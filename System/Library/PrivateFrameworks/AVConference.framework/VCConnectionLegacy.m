@interface VCConnectionLegacy
- (BOOL)isLocalDelegated;
- (BOOL)isLocalIPPort:(tagIPPORT *)a3;
- (BOOL)isLocalOn5G;
- (BOOL)isOnSameIPPortWithConnection:(id)a3;
- (BOOL)isRemoteDelegated;
- (BOOL)isRemoteOn5G;
- (BOOL)isReplaceOnly;
- (BOOL)isUpgraded;
- (BOOL)isVPN;
- (BOOL)isVirtualRelayLink;
- (BOOL)isWifiToWifi;
- (BOOL)serverIsDegraded;
- (BOOL)waitToBeNominated;
- (NSString)description;
- (NSString)localInterfaceName;
- (NSString)localInterfaceTypeString;
- (NSString)remoteInterfaceTypeString;
- (NSUUID)connectionUUID;
- (VCConnectionLegacy)initWithCandidatePair:(tagCANDIDATEPAIR *)a3;
- (VCConnectionLegacy)initWithConnectionResult:(tagCONNRESULT *)a3 type:(unsigned int)a4;
- (id)copy;
- (int)cellularMTU;
- (int)connectionMTU;
- (int)localConnectionType;
- (int)maxConnectionMTU;
- (int)remoteConnectionType;
- (tagCONNRESULT)connectionResult;
- (unsigned)downlinkBitrateCap;
- (unsigned)relayChannelNumber;
- (unsigned)type;
- (unsigned)updateMaxConnectionMTU:(unsigned __int16)a3;
- (unsigned)uplinkAudioBitrateCapOneToOne;
- (unsigned)uplinkBitrateCap;
- (unsigned)uplinkBitrateCapOneToOne;
- (void)dealloc;
- (void)downlinkBitrateCap;
- (void)setConnectionMTU:(int)a3;
- (void)setDownlinkBitrateCap:(unsigned int)a3;
- (void)setMaxConnectionMTU:(int)a3;
- (void)setUpVTable;
- (void)setUplinkAudioBitrateCapOneToOne:(unsigned int)a3;
- (void)setUplinkBitrateCap:(unsigned int)a3;
- (void)setUplinkBitrateCapOneToOne:(unsigned int)a3;
- (void)setWaitToBeNominated:(BOOL)a3;
- (void)uplinkAudioBitrateCapOneToOne;
- (void)uplinkBitrateCap;
- (void)uplinkBitrateCapOneToOne;
@end

@implementation VCConnectionLegacy

- (void)setUpVTable
{
  self->super._vTable.sourceDestinationInfo = _VCConnectionLegacy_SourceDestinationInfo;
  self->super._vTable.isLocalOnCellular = _VCConnectionLegacy_IsLocalOnCellular;
  self->super._vTable.isRemoteOnCellular = _VCConnectionLegacy_IsRemoteOnCellular;
  self->super._vTable.isIPv6 = _VCConnectionLegacy_IsIPv6;
  self->super._vTable.isRelay = _VCConnectionLegacy_IsRelay;
  self->super._vTable.matchesSourceDestinationInfo = _VCConnectionLegacy_MatchesSourceDestinationInfo;
  self->super._vTable.equal = _VCConnectionLegacy_Equal;
  self->super._vTable.localCellTech = _VCConnectionLegacy_LocalCellTech;
  self->super._vTable.setLocalCellTech = _VCConnectionLegacy_SetLocalCellTech;
  self->super._vTable.remoteCellTech = _VCConnectionLegacy_RemoteCellTech;
  self->super._vTable.setRemoteCellTech = _VCConnectionLegacy_SetRemoteCellTech;
  self->super._vTable.copyDescription = _VCConnectionLegacy_CopyDescription;
  self->super._vTable.isLocalOnWiFiOrWired = _VCConnectionLegacy_IsLocalOnWiFiOrWired;
  self->super._vTable.isRemoteOnWiFiOrWired = _VCConnectionLegacy_IsRemoteOnWiFiOrWired;
  self->super._vTable.isLocalOnWiFi = _VCConnectionLegacy_IsLocalOnWiFi;
  self->super._vTable.isRemoteOnWiFi = _VCConnectionLegacy_IsRemoteOnWiFi;
  self->super._vTable.isLocalOnWired = _VCConnectionLegacy_IsLocalOnWired;
  self->super._vTable.isRemoteOnWired = _VCConnectionLegacy_IsRemoteOnWired;
  self->super._vTable.isOnSameInterfacesWithConnection = _VCConnectionLegacy_IsOnSameInterfacesWithConnection;
  self->super._vTable.isEndToEndLink = _VCConnectionLegacy_IsEndToEndLink;
  self->super._vTable.connectionID = _VCConnectionLegacy_ConnectionID;
  self->super._vTable.isLocalExpensive = _VCConnectionLegacy_IsLocalExpensive;
  self->super._vTable.isLocalConstrained = _VCConnectionLegacy_IsLocalConstrained;
  self->super._vTable.isRemoteExpensive = _VCConnectionLegacy_IsRemoteExpensive;
  self->super._vTable.isRemoteConstrained = _VCConnectionLegacy_IsRemoteConstrained;
  self->super._vTable.reportingIPVersion = _VCConnectionLegacy_ReportingIPVersion;
  self->super._vTable.reportingQRServerConfig = _VCConnectionLegacy_ReportingQRServerConfig;
  self->super._vTable.reportingSliceStatus = _VCConnectionLegacy_ReportingSliceStatus;
  self->super._vTable.isHopByHopEncryptionSupported = _VCConnectionLegacy_IsHopByHopEncryptionSupported;
}

- (VCConnectionLegacy)initWithConnectionResult:(tagCONNRESULT *)a3 type:(unsigned int)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCConnectionLegacy;
  v6 = [(VCConnection *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->super._connectionType = 1;
    v8 = (tagCONNRESULT *)malloc_type_calloc(1uLL, 0x140uLL, 0x1020040A6FBA1A4uLL);
    v7->_connectionResult = v8;
    memcpy(v8, a3, sizeof(tagCONNRESULT));
    uint64_t v9 = 48;
    if ((v7->_connectionResult->mbSrc.iFlags & 1) == 0) {
      uint64_t v9 = 28;
    }
    v7->super._constantConnectionOverhead = v9;
    v7->_type = a4;
    v7->super._priority = -1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(NSString *)[(VCConnectionLegacy *)v7 description] UTF8String];
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        v18 = "-[VCConnectionLegacy initWithConnectionResult:type:]";
        __int16 v19 = 1024;
        int v20 = 122;
        __int16 v21 = 2080;
        uint64_t v22 = v12;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: initWithConnectionResult: %s", buf, 0x26u);
      }
    }
  }
  return v7;
}

- (VCConnectionLegacy)initWithCandidatePair:(tagCANDIDATEPAIR *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(&v9[1], 0, 288);
  long long v8 = 0u;
  v9[0] = 0u;
  BOOL v3 = a3->var0.var1 == 5;
  LODWORD(v8) = a3->var0.var2;
  DWORD1(v9[0]) = v3;
  WORD5(v9[0]) = a3->var15;
  long long v4 = *(_OWORD *)&a3->var0.var7.szIfName[12];
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)&a3->var0.var7.iFlags;
  *(_OWORD *)((char *)&v9[1] + 12) = v4;
  *(void *)((char *)&v9[2] + 12) = *(void *)&a3->var0.var7.IP.abIPv6[12];
  *(tagIPPORT *)((char *)&v9[5] + 12) = a3->var0.var6;
  long long v5 = *(_OWORD *)&a3->var1.var7.iFlags;
  long long v6 = *(_OWORD *)&a3->var1.var7.szIfName[12];
  *(void *)((char *)&v9[5] + 4) = *(void *)&a3->var1.var7.IP.abIPv6[12];
  *(_OWORD *)((char *)&v9[4] + 4) = v6;
  *(_OWORD *)((char *)&v9[3] + 4) = v5;
  *(tagIPPORT *)((char *)&v9[8] + 4) = a3->var1.var6;
  return [(VCConnectionLegacy *)self initWithConnectionResult:&v8 type:0];
}

- (id)copy
{
  BOOL v3 = [[VCConnectionLegacy alloc] initWithConnectionResult:[(VCConnectionLegacy *)self connectionResult] type:[(VCConnectionLegacy *)self type]];
  v3->super._priority = VCConnection_Priority((uint64_t)self);
  v3->_waitToBeNominated = [(VCConnectionLegacy *)self waitToBeNominated];
  return v3;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  connectionResult = self->_connectionResult;
  if (connectionResult) {
    free(connectionResult);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCConnectionLegacy;
  [(VCConnection *)&v4 dealloc];
}

- (BOOL)isLocalIPPort:(tagIPPORT *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  connectionResult = self->_connectionResult;
  if (!connectionResult)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      long long v6 = *MEMORY[0x1E4F47A50];
      v7 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        LOBYTE(v4) = 0;
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          return v4;
        }
        int v14 = 136315650;
        uint64_t v15 = v5;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCConnectionLegacy isLocalIPPort:]";
        __int16 v18 = 1024;
        int v19 = 166;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: isLocalIPPort: NO", (uint8_t *)&v14, 0x1Cu);
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[VCConnectionLegacy isLocalIPPort:]();
      }
    }
    LOBYTE(v4) = 0;
    return v4;
  }
  if ((connectionResult->mbLocal.iFlags & 1) == (a3->iFlags & 1))
  {
    if (connectionResult->mbLocal.iFlags)
    {
      if (*(void *)&connectionResult->mbLocal.IP.dwIPv4 == *(void *)&a3->IP.dwIPv4
        && *(void *)&connectionResult->mbLocal.IP.abIPv6[8] == *(void *)&a3->IP.abIPv6[8])
      {
        goto LABEL_5;
      }
    }
    else if (connectionResult->mbLocal.IP.dwIPv4 == a3->IP.dwIPv4)
    {
LABEL_5:
      BOOL v4 = connectionResult->mbLocal.wPort == a3->wPort;
      goto LABEL_15;
    }
  }
  BOOL v4 = 0;
LABEL_15:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    v11 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = "NO";
        uint64_t v15 = v9;
        int v14 = 136315906;
        __int16 v17 = "-[VCConnectionLegacy isLocalIPPort:]";
        __int16 v16 = 2080;
        if (v4) {
          uint64_t v12 = "YES";
        }
        __int16 v18 = 1024;
        int v19 = 170;
        __int16 v20 = 2080;
        __int16 v21 = v12;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: isLocalIPPort: %s", (uint8_t *)&v14, 0x26u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[VCConnectionLegacy isLocalIPPort:](v9);
    }
  }
  return v4;
}

- (BOOL)isOnSameIPPortWithConnection:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  connectionResult = self->_connectionResult;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (a3 && connectionResult)
  {
    if (ErrorLogLevelForModule >= 8)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      long long v8 = *MEMORY[0x1E4F47A50];
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 136316162;
          uint64_t v26 = v7;
          __int16 v27 = 2080;
          v28 = "-[VCConnectionLegacy isOnSameIPPortWithConnection:]";
          __int16 v29 = 1024;
          int v30 = 195;
          __int16 v31 = 2080;
          v32 = [(NSString *)[(VCConnectionLegacy *)self description] UTF8String];
          __int16 v33 = 2080;
          uint64_t v34 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: isOnSameIPPortWithConnection: %s vs. %s", (uint8_t *)&v25, 0x30u);
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v25 = 136316162;
        uint64_t v26 = v7;
        __int16 v27 = 2080;
        v28 = "-[VCConnectionLegacy isOnSameIPPortWithConnection:]";
        __int16 v29 = 1024;
        int v30 = 195;
        __int16 v31 = 2080;
        v32 = [(NSString *)[(VCConnectionLegacy *)self description] UTF8String];
        __int16 v33 = 2080;
        uint64_t v34 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        _os_log_debug_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCConnection: isOnSameIPPortWithConnection: %s vs. %s", (uint8_t *)&v25, 0x30u);
      }
    }
    uint64_t v15 = self->_connectionResult;
    uint64_t v16 = *((void *)a3 + 35);
    if ((v15->mbLocal.iFlags & 1) == (*(_DWORD *)(v16 + 28) & 1))
    {
      if (v15->mbLocal.iFlags)
      {
        if (*(void *)&v15->mbLocal.IP.dwIPv4 != *(void *)(v16 + 48)
          || *(void *)&v15->mbLocal.IP.abIPv6[8] != *(void *)(v16 + 56))
        {
          goto LABEL_40;
        }
      }
      else if (v15->mbLocal.IP.dwIPv4 != *(_DWORD *)(v16 + 48))
      {
        goto LABEL_40;
      }
      if (v15->mbLocal.wPort != *(unsigned __int16 *)(v16 + 64)
        || (v15->mbDst.iFlags & 1) != (*(_DWORD *)(v16 + 148) & 1))
      {
        goto LABEL_40;
      }
      if (v15->mbDst.iFlags)
      {
        if (*(void *)&v15->mbDst.IP.dwIPv4 != *(void *)(v16 + 168)
          || *(void *)&v15->mbDst.IP.abIPv6[8] != *(void *)(v16 + 176))
        {
          goto LABEL_40;
        }
      }
      else if (v15->mbDst.IP.dwIPv4 != *(_DWORD *)(v16 + 168))
      {
        goto LABEL_40;
      }
      if (v15->mbDst.wPort == *(unsigned __int16 *)(v16 + 184) && v15->bIfRelay == *(_DWORD *)(v16 + 20))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          __int16 v20 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 136315650;
            uint64_t v26 = v19;
            __int16 v27 = 2080;
            v28 = "-[VCConnectionLegacy isOnSameIPPortWithConnection:]";
            __int16 v29 = 1024;
            int v30 = 200;
            _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: isOnSameIPPortWithConnection: YES", (uint8_t *)&v25, 0x1Cu);
          }
        }
        LOBYTE(v14) = 1;
        return v14;
      }
    }
LABEL_40:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      uint64_t v22 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        BOOL v14 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
        if (!v14) {
          return v14;
        }
        -[VCConnectionLegacy isOnSameIPPortWithConnection:]();
        goto LABEL_45;
      }
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      LOBYTE(v14) = 0;
      if (v23)
      {
        int v25 = 136315650;
        uint64_t v26 = v21;
        __int16 v27 = 2080;
        v28 = "-[VCConnectionLegacy isOnSameIPPortWithConnection:]";
        __int16 v29 = 1024;
        int v30 = 204;
        goto LABEL_44;
      }
      return v14;
    }
LABEL_45:
    LOBYTE(v14) = 0;
    return v14;
  }
  if (ErrorLogLevelForModule < 8) {
    goto LABEL_45;
  }
  uint64_t v10 = VRTraceErrorLogLevelToCSTR();
  v11 = *MEMORY[0x1E4F47A50];
  uint64_t v12 = *MEMORY[0x1E4F47A50];
  if (!*MEMORY[0x1E4F47A40])
  {
    BOOL v14 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (!v14) {
      return v14;
    }
    -[VCConnectionLegacy isOnSameIPPortWithConnection:]();
    goto LABEL_45;
  }
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  LOBYTE(v14) = 0;
  if (v13)
  {
    int v25 = 136315650;
    uint64_t v26 = v10;
    __int16 v27 = 2080;
    v28 = "-[VCConnectionLegacy isOnSameIPPortWithConnection:]";
    __int16 v29 = 1024;
    int v30 = 192;
LABEL_44:
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: isOnSameIPPortWithConnection: NO", (uint8_t *)&v25, 0x1Cu);
    goto LABEL_45;
  }
  return v14;
}

- (BOOL)isWifiToWifi
{
  int IsLocalOnWiFi = VCConnection_IsLocalOnWiFi((uint64_t)self);
  if (IsLocalOnWiFi)
  {
    LOBYTE(IsLocalOnWiFi) = VCConnection_IsRemoteOnWiFi((uint64_t)self);
  }
  return IsLocalOnWiFi;
}

- (NSString)description
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[15] = v3;
  v13[14] = v3;
  v13[13] = v3;
  v13[11] = v3;
  v13[12] = v3;
  v13[9] = v3;
  v13[10] = v3;
  v13[7] = v3;
  v13[8] = v3;
  v13[5] = v3;
  v13[6] = v3;
  v13[3] = v3;
  v13[4] = v3;
  v13[1] = v3;
  v13[2] = v3;
  v12[15] = v3;
  v13[0] = v3;
  v12[13] = v3;
  v12[14] = v3;
  v12[11] = v3;
  v12[12] = v3;
  v12[9] = v3;
  v12[10] = v3;
  v12[7] = v3;
  v12[8] = v3;
  v12[5] = v3;
  v12[6] = v3;
  v12[3] = v3;
  v12[4] = v3;
  v12[1] = v3;
  v12[2] = v3;
  v11[15] = v3;
  v12[0] = v3;
  v11[13] = v3;
  v11[14] = v3;
  v11[11] = v3;
  v11[12] = v3;
  v11[9] = v3;
  v11[10] = v3;
  v11[7] = v3;
  v11[8] = v3;
  v11[5] = v3;
  v11[6] = v3;
  v11[3] = v3;
  v11[4] = v3;
  v11[1] = v3;
  v11[2] = v3;
  v10[15] = v3;
  v11[0] = v3;
  v10[13] = v3;
  v10[14] = v3;
  v10[11] = v3;
  v10[12] = v3;
  v10[9] = v3;
  v10[10] = v3;
  v10[7] = v3;
  v10[8] = v3;
  v10[5] = v3;
  v10[6] = v3;
  v10[3] = v3;
  v10[4] = v3;
  v10[1] = v3;
  v10[2] = v3;
  p_mbLocal = &self->_connectionResult->mbLocal;
  v10[0] = v3;
  _VCConnectionLegacy_IPPortToString((uint64_t)p_mbLocal, (char *)v13);
  _VCConnectionLegacy_IPPortToString((uint64_t)&self->_connectionResult->mbSrc, (char *)v12);
  _VCConnectionLegacy_IPPortToString((uint64_t)&self->_connectionResult->mbDst, (char *)v11);
  _VCConnectionLegacy_IPPortToString((uint64_t)&self->_connectionResult->mbRemote, (char *)v10);
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (VCConnection_IsRelay((uint64_t)self)) {
    long long v6 = "RELAY";
  }
  else {
    long long v6 = "NOT RELAY";
  }
  if (VCConnection_IsLocalOnWiFi((uint64_t)self)) {
    uint64_t v7 = "WiFi";
  }
  else {
    uint64_t v7 = "Cell";
  }
  if (VCConnection_IsRemoteOnWiFi((uint64_t)self)) {
    long long v8 = "WiFi";
  }
  else {
    long long v8 = "Cell";
  }
  return (NSString *)(id)CFStringCreateWithFormat(v5, 0, @"[%s %s(%s)<>%s<===>%s<>%s(%s)]", v6, v13, v7, v12, v11, v10, v8);
}

- (unsigned)updateMaxConnectionMTU:(unsigned __int16)a3
{
  return a3;
}

- (BOOL)isVPN
{
  return (LOBYTE(self->_connectionResult->mbLocal.iFlags) >> 1) & 1;
}

- (BOOL)serverIsDegraded
{
  return 0;
}

- (BOOL)isUpgraded
{
  return self->_connectionResult->bIfUpgrade != 0;
}

- (BOOL)isReplaceOnly
{
  return self->_connectionResult->bIfReplaceOnly != 0;
}

- (int)localConnectionType
{
  if (VCConnection_IsLocalOnWiFi((uint64_t)self)) {
    return 3;
  }
  VCConnection_LocalCellTech((uint64_t)self);

  return GetConnectionTypeFromCellTech();
}

- (int)remoteConnectionType
{
  if (VCConnection_IsRemoteOnWiFi((uint64_t)self)) {
    return 3;
  }
  VCConnection_RemoteCellTech((uint64_t)self);

  return GetConnectionTypeFromCellTech();
}

- (int)cellularMTU
{
  return self->_connectionResult->wCellularMTU;
}

- (void)setConnectionMTU:(int)a3
{
  self->_connectionResult->wCellularMTU = a3;
}

- (int)connectionMTU
{
  return self->_connectionResult->wCellularMTU;
}

- (NSUUID)connectionUUID
{
  return 0;
}

- (NSString)localInterfaceName
{
  return 0;
}

- (unsigned)downlinkBitrateCap
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionLegacy downlinkBitrateCap]();
    }
  }
  return 0;
}

- (unsigned)uplinkBitrateCap
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionLegacy uplinkBitrateCap]();
    }
  }
  return 0;
}

- (void)setDownlinkBitrateCap:(unsigned int)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionLegacy setDownlinkBitrateCap:]();
    }
  }
}

- (void)setUplinkBitrateCap:(unsigned int)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionLegacy setUplinkBitrateCap:]();
    }
  }
}

- (unsigned)uplinkAudioBitrateCapOneToOne
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionLegacy uplinkAudioBitrateCapOneToOne]();
    }
  }
  return 0;
}

- (void)setUplinkAudioBitrateCapOneToOne:(unsigned int)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionLegacy setUplinkAudioBitrateCapOneToOne:]();
    }
  }
}

- (unsigned)uplinkBitrateCapOneToOne
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionLegacy uplinkBitrateCapOneToOne]();
    }
  }
  return 0;
}

- (void)setUplinkBitrateCapOneToOne:(unsigned int)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionLegacy setUplinkBitrateCapOneToOne:]();
    }
  }
}

- (NSString)localInterfaceTypeString
{
  VCConnection_IsLocalOnCellular((uint64_t)self);
  VCConnection_LocalCellTech((uint64_t)self);
  uint64_t v3 = CelltechToStr();
  BOOL v4 = NSString;

  return (NSString *)[v4 stringWithUTF8String:v3];
}

- (NSString)remoteInterfaceTypeString
{
  VCConnection_IsRemoteOnCellular((uint64_t)self);
  VCConnection_RemoteCellTech((uint64_t)self);
  uint64_t v3 = CelltechToStr();
  BOOL v4 = NSString;

  return (NSString *)[v4 stringWithUTF8String:v3];
}

- (BOOL)waitToBeNominated
{
  return self->_waitToBeNominated;
}

- (void)setWaitToBeNominated:(BOOL)a3
{
  self->_waitToBeNominated = a3;
}

- (tagCONNRESULT)connectionResult
{
  return self->_connectionResult;
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)isLocalDelegated
{
  return self->isLocalDelegated;
}

- (BOOL)isRemoteDelegated
{
  return self->isRemoteDelegated;
}

- (BOOL)isVirtualRelayLink
{
  return self->isVirtualRelayLink;
}

- (int)maxConnectionMTU
{
  return self->maxConnectionMTU;
}

- (void)setMaxConnectionMTU:(int)a3
{
  self->maxConnectionMTU = a3;
}

- (BOOL)isLocalOn5G
{
  return self->isLocalOn5G;
}

- (BOOL)isRemoteOn5G
{
  return self->isRemoteOn5G;
}

- (unsigned)relayChannelNumber
{
  return self->_relayChannelNumber;
}

- (void)isLocalIPPort:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCConnection: isLocalIPPort: NO", v2, v3, v4, v5, v6);
}

- (void)isLocalIPPort:(uint64_t)a1 .cold.2(uint64_t a1)
{
  *(void *)((char *)&v7 + 4) = a1;
  OUTLINED_FUNCTION_4_5();
  LODWORD(v9) = 170;
  if (!v6) {
    __int16 v3 = v4;
  }
  WORD2(v9) = v5;
  HIWORD(v9) = v3;
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d VCConnection: isLocalIPPort: %s", (const char *)v7, *((const char **)&v7 + 1), v8, v9);
}

- (void)isOnSameIPPortWithConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCConnection: isOnSameIPPortWithConnection: NO", v2, v3, v4, v5, v6);
}

- (void)isOnSameIPPortWithConnection:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCConnection: isOnSameIPPortWithConnection: NO", v2, v3, v4, v5, v6);
}

- (void)downlinkBitrateCap
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Downlink bitrate cap is not implemented for legacy VCConnection", v2, v3, v4, v5, v6);
}

- (void)uplinkBitrateCap
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Uplink bitrate cap is not implemented for legacy VCConnection", v2, v3, v4, v5, v6);
}

- (void)setDownlinkBitrateCap:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Setting downlink bitrate cap is not implemented for legacy VCConnection", v2, v3, v4, v5, v6);
}

- (void)setUplinkBitrateCap:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Setting uplink bitrate cap is not implemented for legacy VCConnection", v2, v3, v4, v5, v6);
}

- (void)uplinkAudioBitrateCapOneToOne
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Uplink bitrate cap is not implemented for legacy VCConnection", v2, v3, v4, v5, v6);
}

- (void)setUplinkAudioBitrateCapOneToOne:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Setting uplink bitrate cap is not implemented for legacy VCConnection", v2, v3, v4, v5, v6);
}

- (void)uplinkBitrateCapOneToOne
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Uplink bitrate cap is not implemented for legacy VCConnection", v2, v3, v4, v5, v6);
}

- (void)setUplinkBitrateCapOneToOne:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Setting uplink bitrate cap is not implemented for legacy VCConnection", v2, v3, v4, v5, v6);
}

@end