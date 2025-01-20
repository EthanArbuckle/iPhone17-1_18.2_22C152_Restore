@interface VCConnectionManagerLegacy
- (BOOL)shouldAcceptDataFromSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3;
- (BOOL)shouldNominateConnection:(id)a3;
- (NSString)relayConnectionID;
- (VCConnectionManagerLegacy)init;
- (VCConnectionProtocol)pendingPrimaryConnection;
- (VCConnectionProtocol)pendingSecondaryConnection;
- (id)getPrimaryConnectionToBeCompared;
- (id)getSecondaryConnectionToBeCompared;
- (int)addConnection:(id)a3;
- (int)nominateConnection:(id)a3 asPrimary:(BOOL)a4 interfaceMask:(int)a5 demote:(int *)a6 connectionPriority:(int *)a7 replaceOnly:(int *)a8;
- (int)removeConnection:(id)a3;
- (int)removeConnectionWithIPPort:(tagIPPORT *)a3 isLocalInterface:(BOOL)a4;
- (int)removeConnectionWithIPPortInternal:(tagIPPORT *)a3 isLocalInterface:(BOOL)a4;
- (int)shouldNominateCandidatePair:(tagCANDIDATEPAIR *)a3 interfaceMask:(int)a4 nominated:(int *)a5 demote:(int *)a6 connectionPriority:(int *)a7 replaceOnly:(int *)a8;
- (int)shouldNominateCandidatePairInternal:(tagCANDIDATEPAIR *)a3 interfaceMask:(int)a4 nominated:(int *)a5 demote:(int *)a6 connectionPriority:(int *)a7 replaceOnly:(int *)a8;
- (int)updateStateWithCurrentConnection:(id)a3 asPrimary:(BOOL)a4 interfaceMask:(int)a5 demote:(int *)a6 replaceOnly:(int *)a7;
- (unsigned)getByteCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4;
- (unsigned)getPacketCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4;
- (void)dealloc;
- (void)reportConnection:(id)a3 isInitialConnection:(BOOL)a4;
- (void)setPendingPrimaryConnection:(id)a3;
- (void)setPendingSecondaryConnection:(id)a3;
- (void)setRelayConnectionID:(id)a3;
- (void)setUpVTable;
- (void)updateCellularMTU:(int)a3;
- (void)updateCellularTech:(int)a3 forLocalInterface:(BOOL)a4;
@end

@implementation VCConnectionManagerLegacy

- (void)setUpVTable
{
  self->super._vTable.copyConnection = _VCConnectionManagerLegacy_CopyConnection;
  self->super._vTable.updateConnectionForDuplication = _VCConnectionManagerLegacy_UpdateConnectionForDuplication;
  self->super._vTable.synchronizeParticipantGenerationCounter = _VCConnectionManagerLegacy_SynchronizeParticipantGenerationCounter;
  self->super._vTable.isSourceOnCellularIPv6 = _VCConnectionManagerLegacy_IsSourceOnCellularIPv6;
  self->super._vTable.copyPrimaryConnection = _VCConnectionManagerLegacy_CopyPrimaryConnection;
  self->super._vTable.setPrimaryConnection = _VCConnectionManagerLegacy_SetPrimaryConnection;
  self->super._vTable.updatePacketAndByteCount = _VCConnectionManagerLegacy_UpdatePacketAndByteCount;
  self->super._vTable.updatePersistentPacketCounts = _VCConnectionManagerLegacy_UpdatePersistentPacketCounts;
  self->super._vTable.addLinkProbingTelemetry = _VCConnectionManagerIDS_AddLinkProbingTelemetry;
}

- (VCConnectionManagerLegacy)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCConnectionManagerLegacy;
  return [(VCConnectionManager *)&v3 init];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCConnectionManagerLegacy;
  [(VCConnectionManager *)&v3 dealloc];
}

- (int)shouldNominateCandidatePair:(tagCANDIDATEPAIR *)a3 interfaceMask:(int)a4 nominated:(int *)a5 demote:(int *)a6 connectionPriority:(int *)a7 replaceOnly:(int *)a8
{
  uint64_t v12 = *(void *)&a4;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  LODWORD(a8) = [(VCConnectionManagerLegacy *)self shouldNominateCandidatePairInternal:a3 interfaceMask:v12 nominated:a5 demote:a6 connectionPriority:a7 replaceOnly:a8];
  pthread_rwlock_unlock(p_stateRWlock);
  return (int)a8;
}

- (int)shouldNominateCandidatePairInternal:(tagCANDIDATEPAIR *)a3 interfaceMask:(int)a4 nominated:(int *)a5 demote:(int *)a6 connectionPriority:(int *)a7 replaceOnly:(int *)a8
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  v14 = [[VCConnectionLegacy alloc] initWithCandidatePair:a3];
  int v15 = 0;
  if ([(VCConnectionManagerLegacy *)self shouldNominateConnection:v14])
  {
    BOOL v16 = [(VCConnectionManager *)self isBetterConnection:v14 asPrimary:1];
    if (v16) {
      goto LABEL_6;
    }
    [(VCConnectionManagerLegacy *)self getPrimaryConnectionToBeCompared];
    if (VCConnection_IsOnSameInterfacesWithConnection((uint64_t)v14))
    {
      int v15 = 0;
      goto LABEL_7;
    }
    int v15 = 0;
    if ([(VCConnectionManager *)self isBetterConnection:v14 asPrimary:0])
    {
LABEL_6:
      *a5 = 1;
      int v15 = [(VCConnectionManagerLegacy *)self nominateConnection:v14 asPrimary:v16 interfaceMask:v12 demote:a6 connectionPriority:a7 replaceOnly:a8];
      if (v15 < 0) {
        goto LABEL_44;
      }
    }
  }
LABEL_7:
  int v17 = *a5;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v17)
  {
    if (ErrorLogLevelForModule < 7) {
      goto LABEL_27;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    if (v14) {
      v21 = [(NSString *)[(VCConnectionLegacy *)v14 description] UTF8String];
    }
    else {
      v21 = "<nil>";
    }
    int v25 = *a7;
    int v26 = *a6;
    if ((*a7 & 0xFFFFFFFD) == 1) {
      v27 = "OPTIMAL";
    }
    else {
      v27 = "";
    }
    int v28 = *a8;
    *(_DWORD *)v41 = 136316930;
    *(void *)&v41[4] = v19;
    if (v25 <= 1) {
      v29 = "SECONDARY";
    }
    else {
      v29 = "PRIMARY";
    }
    *(_WORD *)&v41[12] = 2080;
    *(void *)&v41[14] = "-[VCConnectionManagerLegacy shouldNominateCandidatePairInternal:interfaceMask:nominated:demote"
                          ":connectionPriority:replaceOnly:]";
    *(_WORD *)&v41[22] = 1024;
    LODWORD(v42) = 112;
    WORD2(v42) = 2080;
    *(void *)((char *)&v42 + 6) = v21;
    HIWORD(v42) = 2080;
    v43 = v27;
    *(_WORD *)v44 = 2080;
    *(void *)&v44[2] = v29;
    *(_WORD *)&v44[10] = 1024;
    *(_DWORD *)&v44[12] = v26;
    *(_WORD *)&v44[16] = 1024;
    *(_DWORD *)&v44[18] = v28;
    v30 = " [%s] %s:%d HandoverReport: DID nominate connection %s as %s %s connection. Demote current: %d, replace current: %d";
    v31 = v20;
    uint32_t v32 = 70;
  }
  else
  {
    if (ErrorLogLevelForModule < 7) {
      goto LABEL_27;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    if (v14) {
      v24 = [(NSString *)[(VCConnectionLegacy *)v14 description] UTF8String];
    }
    else {
      v24 = "<nil>";
    }
    *(_DWORD *)v41 = 136315906;
    *(void *)&v41[4] = v22;
    *(_WORD *)&v41[12] = 2080;
    *(void *)&v41[14] = "-[VCConnectionManagerLegacy shouldNominateCandidatePairInternal:interfaceMask:nominated:demote"
                          ":connectionPriority:replaceOnly:]";
    *(_WORD *)&v41[22] = 1024;
    LODWORD(v42) = 114;
    WORD2(v42) = 2080;
    *(void *)((char *)&v42 + 6) = v24;
    v30 = " [%s] %s:%d HandoverReport: DID NOT nominate connection %s";
    v31 = v23;
    uint32_t v32 = 38;
  }
  _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, v30, v41, v32);
LABEL_27:
  v33 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v33) {
        v36 = (const char *)objc_msgSend((id)objc_msgSend(v33, "description"), "UTF8String");
      }
      else {
        v36 = "<nil>";
      }
      if ([(VCConnectionManager *)self secondaryConnection])
      {
        v37 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManager secondaryConnection](self, "secondaryConnection"), "description"), "UTF8String");
      }
      else
      {
        v37 = "<nil>";
      }
      if ([(VCConnectionManagerLegacy *)self pendingPrimaryConnection]) {
        v38 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManagerLegacy pendingPrimaryConnection](self, "pendingPrimaryConnection"), "description"), "UTF8String");
      }
      else {
        v38 = "<nil>";
      }
      if ([(VCConnectionManagerLegacy *)self pendingSecondaryConnection]) {
        v39 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection"), "description"), "UTF8String");
      }
      else {
        v39 = "<nil>";
      }
      *(_DWORD *)v41 = 136316674;
      *(void *)&v41[4] = v34;
      *(_WORD *)&v41[12] = 2080;
      *(void *)&v41[14] = "-[VCConnectionManagerLegacy shouldNominateCandidatePairInternal:interfaceMask:nominated:demo"
                            "te:connectionPriority:replaceOnly:]";
      *(_WORD *)&v41[22] = 1024;
      LODWORD(v42) = 122;
      WORD2(v42) = 2080;
      *(void *)((char *)&v42 + 6) = v36;
      HIWORD(v42) = 2080;
      v43 = v37;
      *(_WORD *)v44 = 2080;
      *(void *)&v44[2] = v38;
      *(_WORD *)&v44[10] = 2080;
      *(void *)&v44[12] = v39;
      _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Finished nominating a candidate pair. Primary %s; Secondary: %s; Pending primary: %s"
        "; Pending secondary %s",
        v41,
        0x44u);
    }
  }
  if (v33) {
    CFRelease(v33);
  }
LABEL_44:

  return v15;
}

- (int)addConnection:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    p_stateRWlock = &self->super._stateRWlock;
    pthread_rwlock_wrlock(&self->super._stateRWlock);
    BOOL isInitialConnectionEstablished = self->super._isInitialConnectionEstablished;
    if (*(_DWORD *)([v3 connectionResult] + 296))
    {
      v7 = [(VCConnectionManagerLegacy *)self pendingPrimaryConnection];
      if (!v7)
      {
        int v9 = 3;
LABEL_16:
        VCConnection_SetPriority((uint64_t)v3, v9);
        [(VCConnectionManagerLegacy *)self setPendingPrimaryConnection:0];
        int v17 = [(VCConnectionManager *)self lastPrimaryConnectionInUse];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          uint64_t v19 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v53 = v18;
            __int16 v54 = 2080;
            v55 = "-[VCConnectionManagerLegacy addConnection:]";
            __int16 v56 = 1024;
            int v57 = 160;
            __int16 v58 = 2080;
            uint64_t v59 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
            _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: set a PRIMARY connection %s", buf, 0x26u);
          }
        }
        [(VCConnectionManager *)self useConnectionAsPrimary:v3];
        [(NSMutableArray *)self->super._connectionArray addObject:v3];
        if (v17)
        {
          v20 = [(VCConnectionManagerLegacy *)self pendingSecondaryConnection];
          if (v20)
          {
            v21 = v20;
            if (([(VCConnectionProtocol *)v20 waitToBeNominated] & 1) == 0)
            {
              [(VCConnectionManager *)self setSecondaryConnection:v21];
              [(VCConnectionManagerLegacy *)self setPendingSecondaryConnection:0];
            }
          }
        }
        goto LABEL_42;
      }
      v8 = v7;
      if (VCConnection_Equal((uint64_t)v3, (uint64_t)v7))
      {
        int v9 = VCConnection_Priority((uint64_t)v8);
        goto LABEL_16;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v53 = v22;
          __int16 v54 = 2080;
          v55 = "-[VCConnectionManagerLegacy addConnection:]";
          __int16 v56 = 1024;
          int v57 = 174;
          __int16 v58 = 2080;
          uint64_t v59 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
          __int16 v60 = 2080;
          uint64_t v61 = objc_msgSend((id)-[VCConnectionProtocol description](v8, "description"), "UTF8String");
          v24 = " [%s] %s:%d HandoverReport: new connection %s is not the pending primary %s";
LABEL_36:
          _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x30u);
        }
      }
    }
    else
    {
      v11 = [(VCConnectionManagerLegacy *)self pendingSecondaryConnection];
      if (VCConnection_Equal((uint64_t)v3, (uint64_t)v11))
      {
        uint64_t v12 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
        if (v12)
        {
          v13 = (const void *)v12;
          int v14 = VCConnection_Priority((uint64_t)v11);
          VCConnection_SetPriority((uint64_t)v3, v14);
          [(VCConnectionManagerLegacy *)self setPendingSecondaryConnection:0];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            BOOL v16 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v53 = v15;
              __int16 v54 = 2080;
              v55 = "-[VCConnectionManagerLegacy addConnection:]";
              __int16 v56 = 1024;
              int v57 = 204;
              __int16 v58 = 2080;
              uint64_t v59 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
              _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: set a SECONDARY connection %s", buf, 0x26u);
            }
          }
          [(VCConnectionManager *)self setSecondaryConnection:v3];
          CFRelease(v13);
        }
        else
        {
          [v3 setWaitToBeNominated:0];
          [(VCConnectionManagerLegacy *)self setPendingSecondaryConnection:v3];
          id v3 = (id)[v3 copy];
          VCConnection_SetPriority((uint64_t)v3, 2);
          *(_DWORD *)([v3 connectionResult] + 296) = 0;
          [(VCConnectionManager *)self useConnectionAsPrimary:v3];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v28 = VRTraceErrorLogLevelToCSTR();
            v29 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              if (v3) {
                v30 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
              }
              else {
                v30 = "<nil>";
              }
              *(_DWORD *)buf = 136315906;
              uint64_t v53 = v28;
              __int16 v54 = 2080;
              v55 = "-[VCConnectionManagerLegacy addConnection:]";
              __int16 v56 = 1024;
              int v57 = 196;
              __int16 v58 = 2080;
              uint64_t v59 = (uint64_t)v30;
              _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Secondary nomination response comes back first. Use connection %s as a temporary primary", buf, 0x26u);
            }
          }
        }
        [(NSMutableArray *)self->super._connectionArray addObject:v3];
        int v17 = 0;
LABEL_42:
        v31 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
        int v32 = VCConnection_Priority((uint64_t)v3);
        if ((int)VRTraceGetErrorLogLevelForModule() < 6
          || (uint64_t v49 = VRTraceErrorLogLevelToCSTR(),
              v33 = *MEMORY[0x1E4F47A50],
              !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
        {
LABEL_64:
          if (v31) {
            CFRelease(v31);
          }
          int NumberOfConnectionsInternal = VCConnectionManager_GetNumberOfConnectionsInternal((uint64_t (**)(void))self);
          VTP_SetAFRCConnectionNumber(NumberOfConnectionsInternal);
          v40 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
          [(VCConnectionManager *)self checkpointPrimaryConnection:v40];
          if (v17)
          {
            [(VCConnectionManager *)self primaryConnectionChanged:v40 oldPrimaryConnection:v17];
          }
          else if (v32 == 2)
          {
            int IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)v3);
            VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, IsLocalOnCellular);
          }
          if (v40) {
            CFRelease(v40);
          }
          delegateQueue = self->super._delegateQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __43__VCConnectionManagerLegacy_addConnection___block_invoke;
          block[3] = &unk_1E6DB3E18;
          block[4] = self;
          block[5] = v3;
          BOOL v51 = !isInitialConnectionEstablished;
          dispatch_async(delegateQueue, block);
          if (!self->super._isInitialConnectionEstablished) {
            self->super._BOOL isInitialConnectionEstablished = 1;
          }
          if (self->super._duplicationPending
            && (int)VCConnectionManager_GetNumberOfConnectionsInternal((uint64_t (**)(void))self) >= 2)
          {
            VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, 1);
          }

          [(VCConnectionManagerLegacy *)self reportConnection:v3 isInitialConnection:!isInitialConnectionEstablished];
          [(VCConnectionManager *)self reportConnectionUpdateWithRespCode:0];
          pthread_rwlock_unlock(p_stateRWlock);
          return 0;
        }
        if ((v32 & 0xFFFFFFFD) == 1) {
          uint64_t v34 = "OPTIMAL";
        }
        else {
          uint64_t v34 = "";
        }
        v35 = "SECONDARY";
        if (v32 > 1) {
          v35 = "PRIMARY";
        }
        v46 = v35;
        v47 = v34;
        if (v3)
        {
          uint64_t v45 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
          if (v31)
          {
LABEL_51:
            v44 = (const char *)objc_msgSend((id)objc_msgSend(v31, "description"), "UTF8String");
LABEL_54:
            if ([(VCConnectionManager *)self secondaryConnection]) {
              v36 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManager secondaryConnection](self, "secondaryConnection"), "description"), "UTF8String");
            }
            else {
              v36 = "<nil>";
            }
            BOOL v48 = isInitialConnectionEstablished;
            if ([(VCConnectionManagerLegacy *)self pendingPrimaryConnection]) {
              v37 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManagerLegacy pendingPrimaryConnection](self, "pendingPrimaryConnection"), "description"), "UTF8String");
            }
            else {
              v37 = "<nil>";
            }
            if ([(VCConnectionManagerLegacy *)self pendingSecondaryConnection]) {
              v38 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](-[VCConnectionManagerLegacy pendingSecondaryConnection](self, "pendingSecondaryConnection"), "description"), "UTF8String");
            }
            else {
              v38 = "<nil>";
            }
            *(_DWORD *)buf = 136317442;
            uint64_t v53 = v49;
            __int16 v54 = 2080;
            v55 = "-[VCConnectionManagerLegacy addConnection:]";
            __int16 v56 = 1024;
            int v57 = 226;
            __int16 v58 = 2080;
            uint64_t v59 = (uint64_t)v47;
            __int16 v60 = 2080;
            uint64_t v61 = (uint64_t)v46;
            __int16 v62 = 2080;
            v63 = v45;
            __int16 v64 = 2080;
            v65 = v44;
            __int16 v66 = 2080;
            v67 = v36;
            __int16 v68 = 2080;
            v69 = v37;
            __int16 v70 = 2080;
            v71 = v38;
            _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Add result %s %s connection %s. Primary %s; Secondary: %s; Pending primary: %s"
              "; Pending secondary: %s",
              buf,
              0x62u);
            BOOL isInitialConnectionEstablished = v48;
            goto LABEL_64;
          }
        }
        else
        {
          uint64_t v45 = "<nil>";
          if (v31) {
            goto LABEL_51;
          }
        }
        v44 = "<nil>";
        goto LABEL_54;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
          if (v11) {
            v27 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](v11, "description"), "UTF8String");
          }
          else {
            v27 = "<nil>";
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v53 = v25;
          __int16 v54 = 2080;
          v55 = "-[VCConnectionManagerLegacy addConnection:]";
          __int16 v56 = 1024;
          int v57 = 211;
          __int16 v58 = 2080;
          uint64_t v59 = v26;
          __int16 v60 = 2080;
          uint64_t v61 = (uint64_t)v27;
          v24 = " [%s] %s:%d HandoverReport: new connection %s is not the pending secondary %s";
          goto LABEL_36;
        }
      }
    }
    int v10 = -2144796671;
    pthread_rwlock_unlock(p_stateRWlock);
    return v10;
  }
  int v10 = -2144796671;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionManagerLegacy addConnection:]();
    }
  }
  return v10;
}

uint64_t __43__VCConnectionManagerLegacy_addConnection___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);

  return [v2 connectionCallback:v3 isInitialConnection:v4];
}

- (int)removeConnection:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 connectionResult] + 28;
    return [(VCConnectionManagerLegacy *)self removeConnectionWithIPPort:v4 isLocalInterface:1];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCConnectionManagerLegacy removeConnection:]();
      }
    }
    return -2144796671;
  }
}

- (int)removeConnectionWithIPPort:(tagIPPORT *)a3 isLocalInterface:(BOOL)a4
{
  uint64_t v4 = a4;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  LODWORD(v4) = [(VCConnectionManagerLegacy *)self removeConnectionWithIPPortInternal:a3 isLocalInterface:v4];
  pthread_rwlock_unlock(p_stateRWlock);
  return v4;
}

- (int)removeConnectionWithIPPortInternal:(tagIPPORT *)a3 isLocalInterface:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  memset(v36, 0, sizeof(v36));
  IPPORTToStringWithSize();
  v7 = [(VCConnectionManager *)self secondaryConnection];
  v8 = v7;
  if (v7)
  {
    if (v4)
    {
      if (([(VCConnectionProtocol *)v7 isLocalIPPort:a3] & 1) == 0) {
        goto LABEL_12;
      }
    }
    else if (!VCConnectionLegacy_IsRemoteIPPort((uint64_t)v7, (uint64_t)a3))
    {
      goto LABEL_12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = objc_msgSend((id)-[VCConnectionProtocol description](v8, "description"), "UTF8String");
        *(_DWORD *)uint64_t v28 = 136316418;
        uint64_t v12 = "REMOTE";
        *(void *)&v28[4] = v9;
        *(void *)&v28[14] = "-[VCConnectionManagerLegacy removeConnectionWithIPPortInternal:isLocalInterface:]";
        *(_WORD *)&v28[22] = 1024;
        *(_WORD *)&v28[12] = 2080;
        if (v4) {
          uint64_t v12 = "LOCAL";
        }
        int v29 = 304;
        __int16 v30 = 2080;
        uint64_t v31 = v11;
        __int16 v32 = 2080;
        uint64_t v33 = (uint64_t)v12;
        __int16 v34 = 2080;
        v35 = v36;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: removed SECONDARY connection %s due to %s IPPort %s change", v28, 0x3Au);
      }
    }
    -[VCConnectionManager setSecondaryConnection:](self, "setSecondaryConnection:", 0, *(_OWORD *)v28, *(void *)&v28[16]);
    v8 = 0;
  }
LABEL_12:
  v13 = [(VCConnectionManager *)self lastPrimaryConnectionInUse];
  int v14 = v13;
  if (v4)
  {
    if (([(VCConnectionProtocol *)v13 isLocalIPPort:a3] & 1) == 0) {
      goto LABEL_32;
    }
  }
  else if (!VCConnectionLegacy_IsRemoteIPPort((uint64_t)v13, (uint64_t)a3))
  {
LABEL_32:
    int v24 = 0;
    v8 = 0;
    goto LABEL_36;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    BOOL v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v14) {
        int v17 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](v14, "description"), "UTF8String");
      }
      else {
        int v17 = "<nil>";
      }
      uint64_t v18 = "REMOTE";
      *(_DWORD *)uint64_t v28 = 136316418;
      *(void *)&v28[4] = v15;
      *(_WORD *)&v28[12] = 2080;
      *(void *)&v28[14] = "-[VCConnectionManagerLegacy removeConnectionWithIPPortInternal:isLocalInterface:]";
      if (v4) {
        uint64_t v18 = "LOCAL";
      }
      *(_WORD *)&v28[22] = 1024;
      int v29 = 314;
      __int16 v30 = 2080;
      uint64_t v31 = (uint64_t)v17;
      __int16 v32 = 2080;
      uint64_t v33 = (uint64_t)v18;
      __int16 v34 = 2080;
      v35 = v36;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: removed PRIMARY connection %s due to %s IPPort %s change", v28, 0x3Au);
    }
  }
  VCConnectionManager_SetPrimaryConnection((uint64_t)self);
  if (!v8)
  {
    VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCConnectionManagerLegacy removeConnectionWithIPPortInternal:isLocalInterface:](v22, v23);
      }
    }
    goto LABEL_32;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v14) {
        v21 = (const char *)objc_msgSend((id)-[VCConnectionProtocol description](v14, "description"), "UTF8String");
      }
      else {
        v21 = "<nil>";
      }
      uint64_t v25 = objc_msgSend((id)-[VCConnectionProtocol description](v8, "description", *(void *)v28, *(_OWORD *)&v28[8]), "UTF8String");
      *(_DWORD *)uint64_t v28 = 136316418;
      *(void *)&v28[4] = v19;
      *(_WORD *)&v28[12] = 2080;
      *(void *)&v28[14] = "-[VCConnectionManagerLegacy removeConnectionWithIPPortInternal:isLocalInterface:]";
      *(_WORD *)&v28[22] = 1024;
      int v29 = 322;
      __int16 v30 = 2080;
      uint64_t v31 = (uint64_t)v21;
      __int16 v32 = 2080;
      uint64_t v33 = v25;
      __int16 v34 = 2080;
      v35 = v36;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: replace primary connection %s with new primary %s due to removed IPPort %s", v28, 0x3Au);
    }
  }
  -[VCConnectionManager promoteSecondaryConnectionToPrimary:](self, "promoteSecondaryConnectionToPrimary:", v8, *(void *)v28, *(_OWORD *)&v28[8]);
  int v24 = 1;
  *(_DWORD *)([(VCConnectionProtocol *)v8 connectionResult] + 296) = 1;
LABEL_36:
  int NumberOfConnectionsInternal = VCConnectionManager_GetNumberOfConnectionsInternal((uint64_t (**)(void))self);
  VTP_SetAFRCConnectionNumber(NumberOfConnectionsInternal);
  if (v24)
  {
    [(VCConnectionManager *)self checkpointPrimaryConnection:v8];
    [(VCConnectionManager *)self primaryConnectionChanged:v8 oldPrimaryConnection:v14];
    [(VCConnectionManagerLegacy *)self reportConnection:v8 isInitialConnection:0];
  }

  return 0;
}

- (void)reportConnection:(id)a3 isInitialConnection:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  VCConnection_Priority((uint64_t)a3);
  uint64_t v7 = VCConnection_LocalCellTech((uint64_t)a3);
  uint64_t v8 = VCConnection_RemoteCellTech((uint64_t)a3);
  *(void *)&v47[14] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v46[1] = v9;
  *(_OWORD *)v47 = v9;
  v46[0] = v9;
  *(void *)((char *)v45 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v44[1] = v9;
  v45[0] = v9;
  v44[0] = v9;
  *(void *)((char *)v43 + 14) = 0xAAAAAAAAAAAAAAAALL;
  v42[1] = v9;
  v43[0] = v9;
  v42[0] = v9;
  if (self->super._reportingAgent)
  {
    uint64_t v10 = v8;
    BOOL v32 = v4;
    uint64_t v11 = [a3 connectionResult];
    LODWORD(v12) = *(_DWORD *)(v11 + 268);
    double v13 = (double)v12 * 0.0000152587891;
    IPPORTToStringWithSize();
    IPPORTToStringWithSize();
    IPPORTToStringWithSize();
    uint64_t v14 = *(unsigned int *)(v11 + 268);
    unsigned int IsRelay = VCConnection_IsRelay((uint64_t)a3);
    uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"connectionResultCallback %s/%s (rtt: %f cell: %d/%d v6/rel: %d/%d)  RTT=%d/%d", v46, v44, *(void *)&v13, v7, v10, VCConnection_IsIPv6((uint64_t)a3), IsRelay, v14, (v13 * 1000.0));
    if (IsRelay) {
      BOOL v16 = "relay";
    }
    else {
      BOOL v16 = "p2p";
    }
    VCConnection_IsLocalOnCellular((uint64_t)a3);
    uint64_t v17 = CelltechToStr();
    VCConnection_IsRemoteOnCellular((uint64_t)a3);
    uint64_t v18 = CelltechToStr();
    relayConnectionID = self->_relayConnectionID;
    BOOL EyeContactEnabledBoolValue = VCDefaults_GetEyeContactEnabledBoolValue(1);
    v40[0] = @"ConnectionType";
    v41[0] = [NSString stringWithUTF8String:v16];
    v40[1] = @"LocalCandidate";
    v41[1] = [NSString stringWithUTF8String:v46];
    v40[2] = @"RemoteCandidate";
    v41[2] = [NSString stringWithUTF8String:v42];
    v40[3] = @"LocalInterfaceType";
    v41[3] = [NSString stringWithUTF8String:v17];
    v40[4] = @"RemoteInterfaceType";
    v41[4] = [NSString stringWithUTF8String:v18];
    v40[5] = @"relayServer";
    v41[5] = [NSString stringWithUTF8String:v44];
    v40[6] = @"relayType";
    v41[6] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "type"));
    v40[7] = @"VPN";
    int v21 = [a3 isVPN];
    uint64_t v22 = &unk_1F3DC4380;
    if (v21) {
      uint64_t v22 = &unk_1F3DC4368;
    }
    v23 = @"Unknown";
    if (relayConnectionID) {
      v23 = (__CFString *)relayConnectionID;
    }
    v41[7] = v22;
    v41[8] = v23;
    v40[8] = @"IDSToken";
    v40[9] = @"VPCENABLED";
    v41[9] = [NSNumber numberWithBool:EyeContactEnabledBoolValue];
    v40[10] = @"EndToEnd";
    int v24 = NSString;
    if (VCConnection_IsEndToEndLink((uint64_t)a3)) {
      uint64_t v25 = "1";
    }
    else {
      uint64_t v25 = "0";
    }
    v41[10] = [v24 stringWithUTF8String:v25];
    uint64_t v26 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v41, v40, 11), "mutableCopy");
    VCConnectionManager_AddTelemetryForConnection((uint64_t)self, (uint64_t)a3, v26);
    reportingGenericEvent();

    if (v31)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        uint64_t v28 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v27;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCConnectionManagerLegacy reportConnection:isInitialConnection:]";
          __int16 v36 = 1024;
          int v37 = 406;
          __int16 v38 = 2080;
          uint64_t v39 = objc_msgSend((id)objc_msgSend(v31, "description"), "UTF8String");
          _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d reportConnection: %s", buf, 0x26u);
        }
      }
    }
    if (v32)
    {
      memset(buf, 170, 18);
      if (!Get80211BSSID())
      {
        strncpy(__dst, buf, 8uLL);
        __dst[8] = 0;
        reportingLog();
      }
    }
    v33.receiver = self;
    v33.super_class = (Class)VCConnectionManagerLegacy;
    [(VCConnectionManager *)&v33 reportConnection:a3 isInitialConnection:v32];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    __int16 v30 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v29;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCConnectionManagerLegacy reportConnection:isInitialConnection:]";
      __int16 v36 = 1024;
      int v37 = 363;
      _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d reportConnection: reportingAgent is nil, can not report connections", buf, 0x1Cu);
    }
  }
}

- (int)nominateConnection:(id)a3 asPrimary:(BOOL)a4 interfaceMask:(int)a5 demote:(int *)a6 connectionPriority:(int *)a7 replaceOnly:(int *)a8
{
  uint64_t v11 = *(void *)&a5;
  BOOL v12 = a4;
  if (a4)
  {
    if ([(VCConnectionManager *)self isOptimalConnection:a3 asPrimary:1 interfaceMask:*(void *)&a5])
    {
      int v15 = 3;
    }
    else
    {
      int v15 = 2;
    }
  }
  else
  {
    int v15 = [(VCConnectionManager *)self isOptimalConnection:a3 asPrimary:a4 interfaceMask:*(void *)&a5];
  }
  *a7 = v15;
  VCConnection_SetPriority((uint64_t)a3, v15);

  return [(VCConnectionManagerLegacy *)self updateStateWithCurrentConnection:a3 asPrimary:v12 interfaceMask:v11 demote:a6 replaceOnly:a8];
}

- (BOOL)shouldNominateConnection:(id)a3
{
  id v5 = [(VCConnectionManagerLegacy *)self getPrimaryConnectionToBeCompared];
  id v6 = [(VCConnectionManagerLegacy *)self getSecondaryConnectionToBeCompared];
  if (!v5) {
    return 1;
  }
  id v7 = v6;
  if ([a3 isOnSameIPPortWithConnection:v5]) {
    return 0;
  }
  else {
    return [a3 isOnSameIPPortWithConnection:v7] ^ 1;
  }
}

- (int)updateStateWithCurrentConnection:(id)a3 asPrimary:(BOOL)a4 interfaceMask:(int)a5 demote:(int *)a6 replaceOnly:(int *)a7
{
  uint64_t v9 = *(void *)&a5;
  BOOL v10 = a4;
  id v13 = [(VCConnectionManagerLegacy *)self getPrimaryConnectionToBeCompared];
  id v14 = [(VCConnectionManagerLegacy *)self getSecondaryConnectionToBeCompared];
  if (v10)
  {
    if (v13)
    {
      if (v14)
      {
        BOOL v15 = [(VCConnectionManager *)self isBetterConnection:v13 asPrimary:0];
        if (v15) {
          int v16 = 3;
        }
        else {
          int v16 = 0;
        }
        int v17 = !v15;
      }
      else
      {
        int v17 = VCConnection_IsOnSameInterfacesWithConnection((uint64_t)a3);
        if (v17) {
          int v16 = 0;
        }
        else {
          int v16 = 2;
        }
      }
    }
    else
    {
      int v16 = 0;
      int v17 = 0;
    }
    *a6 = v16;
    *a7 = v17;
    if ((*a6 & 0xFFFFFFFE) == 2)
    {
      VCConnection_SetPriority((uint64_t)v13, [(VCConnectionManager *)self isOptimalConnection:v13 asPrimary:0 interfaceMask:v9]);
      [(VCConnectionManagerLegacy *)self setPendingSecondaryConnection:v13];
    }
    [a3 setWaitToBeNominated:1];
    [(VCConnectionManagerLegacy *)self setPendingPrimaryConnection:a3];
  }
  else
  {
    BOOL v18 = v14 != 0;
    *a6 = v18;
    *a7 = v18;
    [a3 setWaitToBeNominated:1];
    [(VCConnectionManagerLegacy *)self setPendingSecondaryConnection:a3];
  }
  return 0;
}

- (id)getPrimaryConnectionToBeCompared
{
  id result = [(VCConnectionManagerLegacy *)self pendingPrimaryConnection];
  if (!result)
  {
    BOOL v4 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
    return v4;
  }
  return result;
}

- (id)getSecondaryConnectionToBeCompared
{
  id result = [(VCConnectionManagerLegacy *)self pendingSecondaryConnection];
  if (!result)
  {
    return [(VCConnectionManager *)self secondaryConnection];
  }
  return result;
}

- (void)updateCellularMTU:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  id v6 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  [v6 setConnectionMTU:v3];
  if (v6) {
    CFRelease(v6);
  }
  [(VCConnectionProtocol *)[(VCConnectionManager *)self secondaryConnection] setConnectionMTU:v3];
  [(VCConnectionProtocol *)[(VCConnectionManagerLegacy *)self pendingPrimaryConnection] setConnectionMTU:v3];
  [(VCConnectionProtocol *)[(VCConnectionManagerLegacy *)self pendingSecondaryConnection] setConnectionMTU:v3];

  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)updateCellularTech:(int)a3 forLocalInterface:(BOOL)a4
{
  BOOL v4 = a4;
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_wrlock(&self->super._stateRWlock);
  uint64_t v7 = VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  uint64_t v8 = (const void *)v7;
  if (!v4)
  {
    VCConnection_SetRemoteCellTech(v7);
    VCConnection_SetRemoteCellTech((uint64_t)[(VCConnectionManager *)self secondaryConnection]);
    VCConnection_SetRemoteCellTech((uint64_t)[(VCConnectionManagerLegacy *)self pendingPrimaryConnection]);
    VCConnection_SetRemoteCellTech((uint64_t)[(VCConnectionManagerLegacy *)self pendingSecondaryConnection]);
    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  VCConnection_SetLocalCellTech(v7);
  VCConnection_SetLocalCellTech((uint64_t)[(VCConnectionManager *)self secondaryConnection]);
  VCConnection_SetLocalCellTech((uint64_t)[(VCConnectionManagerLegacy *)self pendingPrimaryConnection]);
  VCConnection_SetLocalCellTech((uint64_t)[(VCConnectionManagerLegacy *)self pendingSecondaryConnection]);
  if (v8) {
LABEL_5:
  }
    CFRelease(v8);
LABEL_6:

  pthread_rwlock_unlock(p_stateRWlock);
}

- (BOOL)shouldAcceptDataFromSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->super._stateRWlock;
  pthread_rwlock_rdlock(&self->super._stateRWlock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  connectionArray = self->super._connectionArray;
  uint64_t v7 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(connectionArray);
        }
        if (VCConnection_MatchesSourceDestinationInfo(*(void *)(*((void *)&v14 + 1) + 8 * i), (uint64_t)a3))
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:
  pthread_rwlock_unlock(p_stateRWlock);
  return v11;
}

- (unsigned)getPacketCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
  return 0;
}

- (unsigned)getByteCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
  return 0;
}

- (VCConnectionProtocol)pendingPrimaryConnection
{
  return self->_pendingPrimaryConnection;
}

- (void)setPendingPrimaryConnection:(id)a3
{
}

- (VCConnectionProtocol)pendingSecondaryConnection
{
  return self->_pendingSecondaryConnection;
}

- (void)setPendingSecondaryConnection:(id)a3
{
}

- (NSString)relayConnectionID
{
  return self->_relayConnectionID;
}

- (void)setRelayConnectionID:(id)a3
{
}

- (void)addConnection:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCConnectionManagerLegacy addConnection:]";
  __int16 v4 = 1024;
  int v5 = 133;
  __int16 v6 = v0;
  uint64_t v7 = "-[VCConnectionManagerLegacy addConnection:]";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d HandoverReport: %s received a nil VCConnection!", v2, 0x26u);
}

- (void)removeConnection:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCConnectionManagerLegacy removeConnection:]";
  __int16 v4 = 1024;
  int v5 = 270;
  __int16 v6 = v0;
  uint64_t v7 = "-[VCConnectionManagerLegacy removeConnection:]";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d HandoverReport: %s received a nil VCConnection!", v2, 0x26u);
}

- (void)removeConnectionWithIPPortInternal:(uint64_t)a1 isLocalInterface:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  int v5 = "-[VCConnectionManagerLegacy removeConnectionWithIPPortInternal:isLocalInterface:]";
  __int16 v6 = 1024;
  int v7 = 331;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d HandoverReport: no available connection after interface change", (uint8_t *)&v2, 0x1Cu);
}

@end