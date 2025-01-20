@interface VCConnectionSelector
- ($85B13D066EE34EC5DDC86B20300AB7FA)getConnectionSelectionPolicy;
- ($B1DFBE6DA67F006F3F56FF26010DA9BB)serverLinks;
- (BOOL)canUseP2PLinks;
- (BOOL)isPrimaryConnectionSameAsConnection:(id)a3;
- (BOOL)selectPrimaryAndSecondaryWithConnection:(id)a3 isEndToEnd:(BOOL)a4;
- (NSArray)linkPreferenceOrder;
- (VCConnectionProtocol)connectionForDuplication;
- (VCConnectionProtocol)connectionForDuplicationNonProbingVersion;
- (VCConnectionProtocol)lastPrimaryConnectionInUse;
- (VCConnectionProtocol)secondaryConnection;
- (VCConnectionSelector)initWithMultiwayEnabled:(BOOL)a3;
- (id)connectionForGroupType:(unsigned __int8)a3 isPrimary:(BOOL)a4;
- (void)dealloc;
- (void)selectConnectionForGroupType:(unsigned __int8)a3 fromConnectionArray:(id)a4 asPrimary:(BOOL)a5;
- (void)setCanUseP2PLinks:(BOOL)a3;
- (void)setConnectionForDuplication:(id)a3;
- (void)setConnectionForDuplicationNonProbingVersion:(id)a3;
- (void)setLastPrimaryConnectionInUse:(id)a3;
- (void)setLinkPreferenceOrder:(id)a3;
- (void)setSecondaryConnection:(id)a3;
- (void)updateConnectionSelectionPolicy:(id *)a3;
- (void)updateConnectionSelectionPolicyWithPreferRelayOverP2P:(BOOL)a3 preferNonVPN:(BOOL)a4 preferE2E:(BOOL)a5;
- (void)updatePrimaryWithConnection:(id)a3;
- (void)updateSecondaryWithConnection:(id)a3;
- (void)updateSelectedConnectionsForGroupType:(unsigned __int8)a3 connectionAdded:(id)a4;
- (void)updateSelectedConnectionsForGroupType:(unsigned __int8)a3 connectionRemoved:(id)a4 connectionArray:(id)a5;
- (void)useConnectionAsPrimary:(id)a3;
@end

@implementation VCConnectionSelector

- (VCConnectionSelector)initWithMultiwayEnabled:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCConnectionSelector;
  v4 = [(VCConnectionSelector *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_isMultiwaySession = a3;
    v4->_linkPreferenceOrder = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v5->_canUseP2PLinks = 1;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCConnectionSelector;
  [(VCConnectionSelector *)&v3 dealloc];
}

- (void)updatePrimaryWithConnection:(id)a3
{
  if (self && (primaryConnection = self->_primaryConnection) != 0) {
    v6 = (void *)CFRetain(primaryConnection);
  }
  else {
    v6 = 0;
  }
  if ((VCConnection_IsOnSameInterfacesWithConnection((uint64_t)v6) & 1) == 0
    && objc_msgSend(v6, "compare:isPrimary:selectionPolicy:", -[VCConnectionSelector secondaryConnection](self, "secondaryConnection"), 0, &self->_connectionSelectionPolicy) == 1)
  {
    VCConnection_SetPriority((uint64_t)[(VCConnectionSelector *)self secondaryConnection], -1);
    VCConnection_SetPriority((uint64_t)v6, 0);
    [(VCConnectionSelector *)self setSecondaryConnection:v6];
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  VCConnection_SetPriority((uint64_t)v6, -1);
  if (v6) {
LABEL_10:
  }
    CFRelease(v6);
LABEL_11:
  if (self->_isMultiwaySession)
  {
    if ([(VCConnectionSelector *)self secondaryConnection])
    {
      int IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)a3);
      if (IsEndToEndLink != VCConnection_IsEndToEndLink((uint64_t)[(VCConnectionSelector *)self secondaryConnection]))[(VCConnectionSelector *)self setSecondaryConnection:0]; {
    }
      }
  }
  VCConnection_SetPriority((uint64_t)a3, 2);

  [(VCConnectionSelector *)self useConnectionAsPrimary:a3];
}

- (void)updateSecondaryWithConnection:(id)a3
{
  VCConnection_SetPriority((uint64_t)[(VCConnectionSelector *)self secondaryConnection], -1);
  VCConnection_SetPriority((uint64_t)a3, 0);

  [(VCConnectionSelector *)self setSecondaryConnection:a3];
}

- (BOOL)selectPrimaryAndSecondaryWithConnection:(id)a3 isEndToEnd:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self && (primaryConnection = self->_primaryConnection) != 0)
  {
    CFTypeRef v8 = CFRetain(primaryConnection);
    if (a4) {
      goto LABEL_10;
    }
  }
  else
  {
    CFTypeRef v8 = 0;
    if (a4) {
      goto LABEL_10;
    }
  }
  if ([(VCConnectionSelector *)self isPrimaryConnectionSameAsConnection:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      BOOL v11 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v15 = 136315650;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      v18 = "-[VCConnectionSelector selectPrimaryAndSecondaryWithConnection:isEndToEnd:]";
      __int16 v19 = 1024;
      int v20 = 209;
      v12 = " [%s] %s:%d HandoverReport: Get the same connection for multiway. Keep using the old connection";
LABEL_16:
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 0x1Cu);
    }
LABEL_17:
    BOOL v11 = 0;
    goto LABEL_21;
  }
LABEL_10:
  if ([a3 compare:v8 isPrimary:1 selectionPolicy:&self->_connectionSelectionPolicy] == 1)
  {
    [(VCConnectionSelector *)self updatePrimaryWithConnection:a3];
    goto LABEL_20;
  }
  if (VCConnection_IsOnSameInterfacesWithConnection((uint64_t)v8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      BOOL v11 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      int v15 = 136315650;
      uint64_t v16 = v13;
      __int16 v17 = 2080;
      v18 = "-[VCConnectionSelector selectPrimaryAndSecondaryWithConnection:isEndToEnd:]";
      __int16 v19 = 1024;
      int v20 = 215;
      v12 = " [%s] %s:%d HandoverReport: a new connection is added with the same interface combo as the primary connectio"
            "n. Prevent selecting it as secondary connection.";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  BOOL v11 = 0;
  if (objc_msgSend(a3, "compare:isPrimary:selectionPolicy:", -[VCConnectionSelector secondaryConnection](self, "secondaryConnection"), 0, &self->_connectionSelectionPolicy) != 1)goto LABEL_21; {
  [(VCConnectionSelector *)self updateSecondaryWithConnection:a3];
  }
LABEL_20:
  BOOL v11 = 1;
LABEL_21:
  if (v8) {
    CFRelease(v8);
  }
  return v11;
}

- (void)useConnectionAsPrimary:(id)a3
{
  VCConnectionSelector_SetPrimaryConnection((uint64_t)self, a3);

  [(VCConnectionSelector *)self setLastPrimaryConnectionInUse:a3];
}

- ($85B13D066EE34EC5DDC86B20300AB7FA)getConnectionSelectionPolicy
{
  return ($85B13D066EE34EC5DDC86B20300AB7FA *)&self->_connectionSelectionPolicy;
}

- (void)updateConnectionSelectionPolicyWithPreferRelayOverP2P:(BOOL)a3 preferNonVPN:(BOOL)a4 preferE2E:(BOOL)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  self->_connectionSelectionPolicy.BOOL preferRelayOverP2P = a3;
  self->_connectionSelectionPolicy.preferIPv6OverIPuint64_t v4 = 0;
  self->_connectionSelectionPolicy.BOOL preferNonVPN = a4;
  self->_connectionSelectionPolicy.BOOL e2eCriteriaEnabled = self->_isMultiwaySession;
  self->_connectionSelectionPolicy.BOOL preferE2E = a5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    objc_super v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL preferRelayOverP2P = self->_connectionSelectionPolicy.preferRelayOverP2P;
      preferIPv6OverIPuint64_t v4 = self->_connectionSelectionPolicy.preferIPv6OverIPv4;
      BOOL preferNonVPN = self->_connectionSelectionPolicy.preferNonVPN;
      BOOL e2eCriteriaEnabled = self->_connectionSelectionPolicy.e2eCriteriaEnabled;
      BOOL preferE2E = self->_connectionSelectionPolicy.preferE2E;
      int v13 = 136316930;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCConnectionSelector updateConnectionSelectionPolicyWithPreferRelayOverP2P:preferNonVPN:preferE2E:]";
      __int16 v17 = 1024;
      int v18 = 243;
      __int16 v19 = 1024;
      BOOL v20 = preferRelayOverP2P;
      __int16 v21 = 1024;
      BOOL v22 = preferIPv6OverIPv4;
      __int16 v23 = 1024;
      BOOL v24 = preferNonVPN;
      __int16 v25 = 1024;
      BOOL v26 = e2eCriteriaEnabled;
      __int16 v27 = 1024;
      BOOL v28 = preferE2E;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ConnectionSelectionPolicy updated: preferRelayOverP2P[%d] preferIPv6OverIPv4[%d] preferNonVPN[%d] e2eCriteriaEnabled[%d] preferE2E[%d]", (uint8_t *)&v13, 0x3Au);
    }
  }
}

- (void)updateConnectionSelectionPolicy:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    self->_connectionSelectionPolicy = ($8E6C8695571AE95F6D1A2FB9CBF78DE5)*a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL preferRelayOverP2P = self->_connectionSelectionPolicy.preferRelayOverP2P;
        preferIPv6OverIPuint64_t v4 = self->_connectionSelectionPolicy.preferIPv6OverIPv4;
        BOOL preferNonVPN = self->_connectionSelectionPolicy.preferNonVPN;
        BOOL e2eCriteriaEnabled = self->_connectionSelectionPolicy.e2eCriteriaEnabled;
        BOOL preferE2E = self->_connectionSelectionPolicy.preferE2E;
        BOOL preferWired = self->_connectionSelectionPolicy.preferWired;
        int v18 = 136317186;
        uint64_t v19 = v4;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCConnectionSelector updateConnectionSelectionPolicy:]";
        __int16 v22 = 1024;
        int v23 = 256;
        __int16 v24 = 1024;
        BOOL v25 = preferRelayOverP2P;
        __int16 v26 = 1024;
        BOOL v27 = preferIPv6OverIPv4;
        __int16 v28 = 1024;
        BOOL v29 = preferNonVPN;
        __int16 v30 = 1024;
        BOOL v31 = e2eCriteriaEnabled;
        __int16 v32 = 1024;
        BOOL v33 = preferE2E;
        __int16 v34 = 1024;
        BOOL v35 = preferWired;
        v12 = " [%s] %s:%d ConnectionSelectionPolicy updated: preferRelayOverP2P=%d preferIPv6OverIPv4=%d preferNonVPN=%d"
              " e2eCriteriaEnabled=%d preferE2E=%d preferWired=%d";
        int v13 = v5;
        uint32_t v14 = 64;
LABEL_5:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315650;
        uint64_t v19 = v15;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCConnectionSelector updateConnectionSelectionPolicy:]";
        __int16 v22 = 1024;
        int v23 = 247;
        v12 = " [%s] %s:%d new connection selection policy is nil";
        int v13 = v16;
        uint32_t v14 = 28;
        goto LABEL_5;
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[VCConnectionSelector updateConnectionSelectionPolicy:]();
    }
  }
}

- (void)updateSelectedConnectionsForGroupType:(unsigned __int8)a3 connectionAdded:(id)a4
{
  int v5 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 48;
  if (!a3) {
    uint64_t v6 = 32;
  }
  objc_super v7 = (id *)((char *)&self->super.isa + v6);
  p_connectionSelectionPolicy = &self->_connectionSelectionPolicy;
  if ([a4 compare:*(Class *)((char *)&self->super.isa + v6) isPrimary:1 selectionPolicy:&self->_connectionSelectionPolicy] == 1)
  {
    if ([*v7 compare:v7[1] isPrimary:0 selectionPolicy:p_connectionSelectionPolicy] == 1)
    {

      v7[1] = *v7;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          id v11 = v7[1];
          if (v11) {
            v12 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
          }
          else {
            v12 = "<nil>";
          }
          int v20 = 136316162;
          uint64_t v21 = v9;
          __int16 v22 = 2080;
          int v23 = "-[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionAdded:]";
          __int16 v24 = 1024;
          int v25 = 272;
          __int16 v26 = 2080;
          BOOL v27 = v12;
          __int16 v28 = 1024;
          int v29 = v5;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Updated secondary connection to: %s for group: %d", (uint8_t *)&v20, 0x2Cu);
        }
      }
    }

    *objc_super v7 = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint32_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (*v7) {
          int v18 = (const char *)objc_msgSend((id)objc_msgSend(*v7, "description"), "UTF8String");
        }
        else {
          int v18 = "<nil>";
        }
        int v20 = 136316162;
        uint64_t v21 = v17;
        __int16 v22 = 2080;
        int v23 = "-[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionAdded:]";
        __int16 v24 = 1024;
        int v25 = 276;
        __int16 v26 = 2080;
        BOOL v27 = v18;
        __int16 v28 = 1024;
        int v29 = v5;
        uint64_t v19 = " [%s] %s:%d HandoverReport: Updated primary connection to: %s for group: %d";
LABEL_24:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v20, 0x2Cu);
      }
    }
  }
  else if ([a4 compare:v7[1] isPrimary:0 selectionPolicy:p_connectionSelectionPolicy] == 1)
  {

    v7[1] = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint32_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v7[1];
        if (v15) {
          uint64_t v16 = (const char *)objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
        }
        else {
          uint64_t v16 = "<nil>";
        }
        int v20 = 136316162;
        uint64_t v21 = v13;
        __int16 v22 = 2080;
        int v23 = "-[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionAdded:]";
        __int16 v24 = 1024;
        int v25 = 281;
        __int16 v26 = 2080;
        BOOL v27 = v16;
        __int16 v28 = 1024;
        int v29 = v5;
        uint64_t v19 = " [%s] %s:%d HandoverReport: Updated secondary connection to: %s for group: %d";
        goto LABEL_24;
      }
    }
  }
}

- (void)updateSelectedConnectionsForGroupType:(unsigned __int8)a3 connectionRemoved:(id)a4 connectionArray:(id)a5
{
  uint64_t v7 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 48;
  if (!a3) {
    uint64_t v9 = 32;
  }
  v10 = (id *)((char *)&self->super.isa + v9);
  if (VCConnection_Equal((uint64_t)a4, *(uint64_t *)((char *)&self->super.isa + v9)))
  {

    id *v10 = 0;
    [(VCConnectionSelector *)self selectConnectionForGroupType:v7 fromConnectionArray:a5 asPrimary:1];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (*v10) {
          uint64_t v13 = (const char *)objc_msgSend((id)objc_msgSend(*v10, "description"), "UTF8String");
        }
        else {
          uint64_t v13 = "<nil>";
        }
        int v18 = 136316162;
        uint64_t v19 = v11;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionRemoved:connectionArray:]";
        __int16 v22 = 1024;
        int v23 = 292;
        __int16 v24 = 2080;
        int v25 = v13;
        __int16 v26 = 1024;
        int v27 = v7;
        uint64_t v17 = " [%s] %s:%d HandoverReport: Updated primary connection to: %s for group: %d";
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v18, 0x2Cu);
      }
    }
  }
  else if (VCConnection_Equal((uint64_t)a4, (uint64_t)v10[1]))
  {

    v10[1] = 0;
    [(VCConnectionSelector *)self selectConnectionForGroupType:v7 fromConnectionArray:a5 asPrimary:0];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v10[1];
        if (v15) {
          uint64_t v16 = (const char *)objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
        }
        else {
          uint64_t v16 = "<nil>";
        }
        int v18 = 136316162;
        uint64_t v19 = v14;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCConnectionSelector updateSelectedConnectionsForGroupType:connectionRemoved:connectionArray:]";
        __int16 v22 = 1024;
        int v23 = 297;
        __int16 v24 = 2080;
        int v25 = v16;
        __int16 v26 = 1024;
        int v27 = v7;
        uint64_t v17 = " [%s] %s:%d HandoverReport: Updated secondary connection to: %s for group: %d";
        goto LABEL_17;
      }
    }
  }
}

- (void)selectConnectionForGroupType:(unsigned __int8)a3 fromConnectionArray:(id)a4 asPrimary:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 48;
  if (!a3) {
    uint64_t v8 = 32;
  }
  uint64_t v9 = (void **)((char *)&self->super.isa + v8);
  v10 = (void **)((char *)&self->_primaryConnection + v8);
  __int16 v20 = v10;
  if (a5) {
    v10 = v9;
  }
  uint64_t v11 = *v10;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [a4 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    p_connectionSelectionPolicy = &self->_connectionSelectionPolicy;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(a4);
        }
        uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((VCConnection_IsEndToEndLink((uint64_t)v17) & 1) == 0
          && [v17 compare:v11 isPrimary:v5 selectionPolicy:p_connectionSelectionPolicy] == 1)
        {
          int v18 = *v9;
          if (v5)
          {
            uint64_t v19 = v9;
          }
          else
          {
            if (VCConnection_IsOnSameInterfacesWithConnection((uint64_t)v17)) {
              continue;
            }
            uint64_t v19 = v20;
            int v18 = *v20;
          }

          *uint64_t v19 = v17;
        }
      }
      uint64_t v13 = [a4 countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v13);
  }
}

- (id)connectionForGroupType:(unsigned __int8)a3 isPrimary:(BOOL)a4
{
  uint64_t v4 = 48;
  if (!a3) {
    uint64_t v4 = 32;
  }
  BOOL v5 = (id *)((char *)&self->super.isa + v4);
  if (!a4) {
    ++v5;
  }
  id v6 = *v5;

  return v6;
}

- (BOOL)isPrimaryConnectionSameAsConnection:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_20;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    uint64_t v21 = *MEMORY[0x1E4F47A50];
    if (!*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[VCConnectionSelector isPrimaryConnectionSameAsConnection:]();
      }
      goto LABEL_20;
    }
    LOBYTE(v14) = 0;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    int v22 = 136315650;
    uint64_t v23 = v20;
    __int16 v24 = 2080;
    long long v25 = "-[VCConnectionSelector isPrimaryConnectionSameAsConnection:]";
    __int16 v26 = 1024;
    int v27 = 332;
    int v18 = " [%s] %s:%d new connection is nil";
    goto LABEL_17;
  }
  if (!self || (primaryConnection = self->_primaryConnection) == 0 || (CFTypeRef v5 = CFRetain(primaryConnection)) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
    {
LABEL_20:
      LOBYTE(v14) = 0;
      return v14;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    if (!*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[VCConnectionSelector isPrimaryConnectionSameAsConnection:]();
      }
      goto LABEL_20;
    }
    LOBYTE(v14) = 0;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    int v22 = 136315650;
    uint64_t v23 = v15;
    __int16 v24 = 2080;
    long long v25 = "-[VCConnectionSelector isPrimaryConnectionSameAsConnection:]";
    __int16 v26 = 1024;
    int v27 = 334;
    int v18 = " [%s] %s:%d current connection is nil";
LABEL_17:
    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 0x1Cu);
    goto LABEL_20;
  }
  id v6 = v5;
  int IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)v5);
  if (IsEndToEndLink == VCConnection_IsEndToEndLink((uint64_t)a3)
    && (int IsLocalOnWiFiOrWired = VCConnection_IsLocalOnWiFiOrWired((uint64_t)v6),
        IsLocalOnWiFiOrWired == VCConnection_IsLocalOnWiFiOrWired((uint64_t)a3))
    && (int IsRemoteOnWiFiOrWired = VCConnection_IsRemoteOnWiFiOrWired((uint64_t)v6),
        IsRemoteOnWiFiOrWired == VCConnection_IsRemoteOnWiFiOrWired((uint64_t)a3))
    && (int IsLocalOnWired = VCConnection_IsLocalOnWired((uint64_t)v6),
        IsLocalOnWired == VCConnection_IsLocalOnWired((uint64_t)a3))
    && (int IsRemoteOnWired = VCConnection_IsRemoteOnWired((uint64_t)v6),
        IsRemoteOnWired == VCConnection_IsRemoteOnWired((uint64_t)a3))
    && (int IsRelay = VCConnection_IsRelay((uint64_t)v6), IsRelay == VCConnection_IsRelay((uint64_t)a3)))
  {
    IsIPid v6 = VCConnection_IsIPv6((uint64_t)v6);
    int v14 = IsIPv6 ^ VCConnection_IsIPv6((uint64_t)a3) ^ 1;
  }
  else
  {
    LOBYTE(v14) = 0;
  }
  CFRelease(v6);
  return v14;
}

- (VCConnectionProtocol)secondaryConnection
{
  return self->_secondaryConnection;
}

- (void)setSecondaryConnection:(id)a3
{
}

- (VCConnectionProtocol)connectionForDuplication
{
  return self->_connectionForDuplication;
}

- (void)setConnectionForDuplication:(id)a3
{
}

- (VCConnectionProtocol)connectionForDuplicationNonProbingVersion
{
  return self->_connectionForDuplicationNonProbingVersion;
}

- (void)setConnectionForDuplicationNonProbingVersion:(id)a3
{
}

- (VCConnectionProtocol)lastPrimaryConnectionInUse
{
  return self->_lastPrimaryConnectionInUse;
}

- (void)setLastPrimaryConnectionInUse:(id)a3
{
}

- (NSArray)linkPreferenceOrder
{
  return self->_linkPreferenceOrder;
}

- (void)setLinkPreferenceOrder:(id)a3
{
}

- ($B1DFBE6DA67F006F3F56FF26010DA9BB)serverLinks
{
  dest[2] = *MEMORY[0x1E4F143B8];
  objc_copyStruct(dest, &self->_serverLinks, 16, 1, 0);
  v2 = (void *)dest[0];
  objc_super v3 = (void *)dest[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)canUseP2PLinks
{
  return self->_canUseP2PLinks;
}

- (void)setCanUseP2PLinks:(BOOL)a3
{
  self->_canUseP2PLinks = a3;
}

- (void)updateConnectionSelectionPolicy:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d new connection selection policy is nil", v2, v3, v4, v5, v6);
}

- (void)isPrimaryConnectionSameAsConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d new connection is nil", v2, v3, v4, v5, v6);
}

- (void)isPrimaryConnectionSameAsConnection:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d current connection is nil", v2, v3, v4, v5, v6);
}

@end