@interface VCConnectionIDS
+ (id)VCConnectionIDS_CDBPS:(id)a3;
+ (id)VCConnectionIDS_RPS:(id)a3;
+ (unsigned)worstCaseNetworkOverheadInBytesWithNumOfStreamId:(int)a3 isPriorityIncluded:(BOOL)a4;
- (BOOL)isLocalDelegated;
- (BOOL)isLocalOn5G;
- (BOOL)isOnSameInterfacesAndQRSessionWithConnection:(id)a3;
- (BOOL)isOnSameQRSessionWithConnection:(id)a3;
- (BOOL)isQUICPod;
- (BOOL)isRemoteDelegated;
- (BOOL)isRemoteOn5G;
- (BOOL)isVPN;
- (BOOL)isVirtualRelayLink;
- (BOOL)isWifiToWifi;
- (BOOL)serverIsDegraded;
- (NSData)sharedDigestKey;
- (NSString)channelDataBaseProtocolStackDescription;
- (NSString)description;
- (NSString)localInterfaceName;
- (NSString)localInterfaceTypeString;
- (NSString)relayProtocolStackDescription;
- (NSString)relaySessionToken;
- (NSString)remoteInterfaceTypeString;
- (NSUUID)connectionUUID;
- (VCConnectionIDS)initWithLinkContext:(id)a3 dataChannelToken:(unsigned int)a4;
- (VCDatagramChannelIDS)datagramChannel;
- (id)connectionQRSessionID;
- (int)cellTechForSoMask:(unsigned int)a3 fallbackTo:(int)a4;
- (int)connectionMTU;
- (int)localConnectionType;
- (int)maxConnectionMTU;
- (int)remoteConnectionType;
- (int64_t)linkConnectionType;
- (unsigned)datagramChannelToken;
- (unsigned)downlinkBitrateCap;
- (unsigned)type;
- (unsigned)updateMaxConnectionMTU:(unsigned __int16)a3;
- (unsigned)uplinkAudioBitrateCapOneToOne;
- (unsigned)uplinkBitrateCap;
- (unsigned)uplinkBitrateCapOneToOne;
- (void)dealloc;
- (void)setCellularMTU:(int)a3;
- (void)setChannelDataBaseProtocolStackDescription:(id)a3;
- (void)setConnectionMTU:(int)a3;
- (void)setDownlinkBitrateCap:(unsigned int)a3;
- (void)setIsQUICPod:(BOOL)a3;
- (void)setMaxConnectionMTU:(int)a3;
- (void)setRelayProtocolStackDescription:(id)a3;
- (void)setUpVTable;
- (void)setUplinkAudioBitrateCapOneToOne:(unsigned int)a3;
- (void)setUplinkBitrateCap:(unsigned int)a3;
- (void)setUplinkBitrateCapOneToOne:(unsigned int)a3;
@end

@implementation VCConnectionIDS

- (void)setUpVTable
{
  self->super._vTable.sourceDestinationInfo = _VCConnectionIDS_SourceDestinationInfo;
  self->super._vTable.isLocalOnCellular = _VCConnectionIDS_IsLocalOnCellular;
  self->super._vTable.isRemoteOnCellular = _VCConnectionIDS_IsRemoteOnCellular;
  self->super._vTable.isIPv6 = _VCConnectionIDS_IsIPv6;
  self->super._vTable.isRelay = _VCConnectionIDS_IsRelay;
  self->super._vTable.matchesSourceDestinationInfo = _VCConnectionIDS_MatchesSourceDestinationInfo;
  self->super._vTable.equal = _VCConnectionIDS_Equal;
  self->super._vTable.localCellTech = _VCConnectionIDS_LocalCellTech;
  self->super._vTable.setLocalCellTech = _VCConnectionIDS_SetLocalCellTech;
  self->super._vTable.remoteCellTech = _VCConnectionIDS_RemoteCellTech;
  self->super._vTable.setRemoteCellTech = _VCConnectionIDS_SetRemoteCellTech;
  self->super._vTable.copyDescription = _VCConnectionIDS_CopyDescription;
  self->super._vTable.isLocalOnWiFiOrWired = _VCConnectionIDS_IsLocalOnWiFiOrWired;
  self->super._vTable.isRemoteOnWiFiOrWired = _VCConnectionIDS_IsRemoteOnWiFiOrWired;
  self->super._vTable.isLocalOnWiFi = _VCConnectionIDS_IsLocalOnWiFi;
  self->super._vTable.isRemoteOnWiFi = _VCConnectionIDS_IsRemoteOnWiFi;
  self->super._vTable.isLocalOnWired = _VCConnectionIDS_IsLocalOnWired;
  self->super._vTable.isRemoteOnWired = _VCConnectionIDS_IsRemoteOnWired;
  self->super._vTable.isOnSameInterfacesWithConnection = _VCConnectionIDS_IsOnSameInterfacesWithConnection;
  self->super._vTable.isEndToEndLink = _VCConnectionIDS_IsEndToEndLink;
  self->super._vTable.connectionID = _VCConnectionIDS_ConnectionID;
  self->super._vTable.isLocalExpensive = _VCConnectionIDS_IsLocalExpensive;
  self->super._vTable.isLocalConstrained = _VCConnectionIDS_IsLocalConstrained;
  self->super._vTable.isRemoteExpensive = _VCConnectionIDS_IsRemoteExpensive;
  self->super._vTable.isRemoteConstrained = _VCConnectionIDS_IsRemoteConstrained;
  self->super._vTable.reportingIPVersion = _VCConnectionIDS_ReportingIPVersion;
  self->super._vTable.reportingQRServerConfig = _VCConnectionIDS_ReportingQRServerConfig;
  self->super._vTable.reportingSliceStatus = _VCConnectionIDS_ReportingSliceStatus;
  self->super._vTable.isHopByHopEncryptionSupported = _VCConnectionIDS_IsHopByHopEncryptionSupported;
}

- (VCConnectionIDS)initWithLinkContext:(id)a3 dataChannelToken:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCConnectionIDS;
  v6 = [(VCConnection *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->super._connectionType = 2;
    v6->_linkContext = (IDSDataChannelLinkContext *)a3;
    v7->_datagramChannelToken = v4;
    v7->_datagramChannel = (VCDatagramChannelIDS *)[+[VCDatagramChannelManager sharedInstance] datagramChannelWithChannelToken:v4];
    uint64_t v8 = [+[VCDefaults sharedInstance] localRATTypeOverride];
    if ((v8 + 1) <= 0xA && ((1 << (v8 + 1)) & 0x403) != 0) {
      uint64_t v8 = [(IDSDataChannelLinkContext *)v7->_linkContext RATType];
    }
    v7->_localCellTech = VCConnectionIDSCellTechForRATType(v8);
    if (VCConnection_IsLocalOnCellular((uint64_t)v7)) {
      v7->_localCellTech = [(VCConnectionIDS *)v7 cellTechForSoMask:[(IDSDataChannelLinkContext *)v7->_linkContext localDataSoMask] fallbackTo:v7->_localCellTech];
    }
    v7->_isQUICPod = [(IDSDataChannelLinkContext *)v7->_linkContext isQUICPod];
    v7->_remoteCellTech = VCConnectionIDSCellTechForRATType([(IDSDataChannelLinkContext *)v7->_linkContext remoteRATType]);
    if (VCConnection_IsRemoteOnCellular((uint64_t)v7)) {
      v7->_remoteCellTech = [(VCConnectionIDS *)v7 cellTechForSoMask:[(IDSDataChannelLinkContext *)v7->_linkContext remoteDataSoMask] fallbackTo:v7->_remoteCellTech];
    }
    uint64_t v10 = [(IDSDataChannelLinkContext *)v7->_linkContext connectionType];
    if ((unint64_t)(v10 - 1) > 4) {
      unsigned int v11 = 0;
    }
    else {
      unsigned int v11 = dword_1E25A0120[v10 - 1];
    }
    v7->_type = v11;
    v7->_linkConnectionType = [(IDSDataChannelLinkContext *)v7->_linkContext connectionType];
    int v12 = [(IDSDataChannelLinkContext *)v7->_linkContext maxMTU];
    v7->_maxConnectionMTU = v12;
    v7->_connectionMTU = v12;
    [(VCConnection *)v7 setLinkFlags:[(IDSDataChannelLinkContext *)v7->_linkContext localLinkFlags] & 2 | [(IDSDataChannelLinkContext *)v7->_linkContext localLinkFlags] & 1];
    [(VCConnection *)v7 setRemoteLinkFlags:[(IDSDataChannelLinkContext *)v7->_linkContext remoteLinkFlags] & 2 | [(IDSDataChannelLinkContext *)v7->_linkContext remoteLinkFlags] & 1];
    v7->_isLocalDelegated = ([(IDSDataChannelLinkContext *)v7->_linkContext localLinkFlags] & 4) != 0;
    v7->_isRemoteDelegated = ([(IDSDataChannelLinkContext *)v7->_linkContext remoteLinkFlags] & 4) != 0;
    v7->_isVirtualRelayLink = [(IDSDataChannelLinkContext *)v7->_linkContext isVirtualRelayLink];
    v7->_relayProtocolStackDescription = [(IDSDataChannelLinkContext *)v7->_linkContext relayProtocolStackDescription];
    v7->_channelDataBaseProtocolStackDescription = [(IDSDataChannelLinkContext *)v7->_linkContext channelDataBaseProtocolStackDescription];
    v7->super._constantConnectionOverhead = [(IDSDataChannelLinkContext *)v7->_linkContext estimatedPerPacketConstantOverhead];
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCConnectionIDS;
  [(VCConnection *)&v3 dealloc];
}

- (NSString)description
{
  v2 = (__CFString *)_VCConnectionIDS_CopyDescription((uint64_t)self);

  return (NSString *)v2;
}

- (NSString)relaySessionToken
{
  v2 = (void *)[(NSData *)[(IDSDataChannelLinkContext *)self->_linkContext relaySessionToken] __imHexString];

  return (NSString *)[v2 lowercaseString];
}

- (NSData)sharedDigestKey
{
  v2 = (void *)[(NSData *)[(IDSDataChannelLinkContext *)self->_linkContext relaySessionKey] copy];

  return (NSData *)v2;
}

- (BOOL)isLocalOn5G
{
  return (self->_localCellTech & 0xFFFFFFFE) == 8;
}

- (BOOL)isRemoteOn5G
{
  return (self->_remoteCellTech & 0xFFFFFFFE) == 8;
}

- (BOOL)isVPN
{
  return self->_isLocalDelegated || self->_isRemoteDelegated;
}

- (NSString)localInterfaceName
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  linkContext = self->_linkContext;

  return (NSString *)[(IDSDataChannelLinkContext *)linkContext performSelector:sel_localInterfaceName];
}

- (BOOL)isWifiToWifi
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int IsLocalExpensive = VCConnection_IsLocalExpensive((uint64_t)self);
  int IsRemoteExpensive = VCConnection_IsRemoteExpensive((uint64_t)self);
  int IsLocalConstrained = VCConnection_IsLocalConstrained((uint64_t)self);
  int IsRemoteConstrained = VCConnection_IsRemoteConstrained((uint64_t)self);
  BOOL v7 = ((IsLocalExpensive & 1) == 0 && !IsLocalConstrained
     || VCConnection_IsLocalOnWiFiOrWired((uint64_t)self))
    && (!(IsRemoteExpensive | IsRemoteConstrained) || VCConnection_IsRemoteOnWiFiOrWired((uint64_t)self));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136317186;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCConnectionIDS isWifiToWifi]";
        __int16 v16 = 1024;
        int v17 = 273;
        __int16 v18 = 1024;
        int v19 = IsLocalExpensive;
        __int16 v20 = 1024;
        int v21 = IsLocalConstrained;
        __int16 v22 = 1024;
        BOOL v23 = [(VCConnectionIDS *)self isLocalOn5G];
        __int16 v24 = 1024;
        int v25 = IsRemoteExpensive;
        __int16 v26 = 1024;
        int v27 = IsRemoteConstrained;
        __int16 v28 = 1024;
        BOOL v29 = [(VCConnectionIDS *)self isRemoteOn5G];
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [Local] Expensive %d, constraint %d, 5G %d. [Remote] Expensive %d, constraint %d, 5G %d", (uint8_t *)&v12, 0x40u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136317186;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCConnectionIDS isWifiToWifi]";
      __int16 v16 = 1024;
      int v17 = 273;
      __int16 v18 = 1024;
      int v19 = IsLocalExpensive;
      __int16 v20 = 1024;
      int v21 = IsLocalConstrained;
      __int16 v22 = 1024;
      BOOL v23 = [(VCConnectionIDS *)self isLocalOn5G];
      __int16 v24 = 1024;
      int v25 = IsRemoteExpensive;
      __int16 v26 = 1024;
      int v27 = IsRemoteConstrained;
      __int16 v28 = 1024;
      BOOL v29 = [(VCConnectionIDS *)self isRemoteOn5G];
      _os_log_debug_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d [Local] Expensive %d, constraint %d, 5G %d. [Remote] Expensive %d, constraint %d, 5G %d", (uint8_t *)&v12, 0x40u);
    }
  }
  return v7;
}

+ (id)VCConnectionIDS_RPS:(id)a3
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCConnectionIDS VCConnectionIDS_RPS:]();
      }
    }
    return &stru_1F3D3E450;
  }
  objc_super v3 = (void *)*((void *)a3 + 42);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCConnectionIDS VCConnectionIDS_RPS:]();
      }
    }
    return &stru_1F3D3E450;
  }
  id v4 = v3;

  return v4;
}

+ (id)VCConnectionIDS_CDBPS:(id)a3
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCConnectionIDS VCConnectionIDS_CDBPS:]();
      }
    }
    return &stru_1F3D3E450;
  }
  objc_super v3 = (void *)*((void *)a3 + 43);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCConnectionIDS VCConnectionIDS_CDBPS:]();
      }
    }
    return &stru_1F3D3E450;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)serverIsDegraded
{
  return [(IDSDataChannelLinkContext *)self->_linkContext serverIsDegraded];
}

- (id)connectionQRSessionID
{
  return [(IDSDataChannelLinkContext *)self->_linkContext QRSessionID];
}

- (void)setConnectionMTU:(int)a3
{
  self->_connectionMTU = a3;
}

- (int)connectionMTU
{
  return self->_connectionMTU;
}

+ (unsigned)worstCaseNetworkOverheadInBytesWithNumOfStreamId:(int)a3 isPriorityIncluded:(BOOL)a4
{
  if (a4) {
    int v4 = 45;
  }
  else {
    int v4 = 44;
  }
  return ((a3 > 1) | (2 * a3)) + v4 + 56;
}

- (NSUUID)connectionUUID
{
  return [(IDSDataChannelLinkContext *)self->_linkContext linkUUID];
}

- (int)localConnectionType
{
  if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)self)) {
    return 3;
  }
  VCConnection_LocalCellTech((uint64_t)self);

  return GetConnectionTypeFromCellTech();
}

- (int)remoteConnectionType
{
  if (VCConnection_IsRemoteOnWiFiOrWired((uint64_t)self)) {
    return 3;
  }
  VCConnection_RemoteCellTech((uint64_t)self);

  return GetConnectionTypeFromCellTech();
}

- (int64_t)linkConnectionType
{
  return self->_linkConnectionType;
}

- (NSString)localInterfaceTypeString
{
  VCConnection_IsLocalOnCellular((uint64_t)self);
  VCConnection_LocalCellTech((uint64_t)self);
  uint64_t v3 = CelltechToStr();
  int v4 = NSString;

  return (NSString *)[v4 stringWithUTF8String:v3];
}

- (NSString)remoteInterfaceTypeString
{
  VCConnection_IsRemoteOnCellular((uint64_t)self);
  VCConnection_RemoteCellTech((uint64_t)self);
  uint64_t v3 = CelltechToStr();
  int v4 = NSString;

  return (NSString *)[v4 stringWithUTF8String:v3];
}

- (void)setCellularMTU:(int)a3
{
  if (VCConnection_IsLocalOnCellular((uint64_t)self)) {
    self->_connectionMTU = a3;
  }
}

- (unsigned)updateMaxConnectionMTU:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((VCConnection_IsLocalOnCellular((uint64_t)self) & 1) != 0
    || VCConnection_IsRemoteOnCellular((uint64_t)self))
  {
    int connectionMTU = self->_connectionMTU;
    unsigned int v6 = VCConnection_IsIPv6((uint64_t)self) ? 1280 : 1450;
    unsigned __int16 v7 = (_WORD)connectionMTU ? connectionMTU : v3;
    int v8 = v7;
    BOOL v9 = v7 >= v6 || v7 == 0;
    unsigned __int16 v10 = v9 ? v6 : v7;
    if (v10 != v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        int v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136316674;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          int v17 = "-[VCConnectionIDS updateMaxConnectionMTU:]";
          __int16 v18 = 1024;
          int v19 = 461;
          __int16 v20 = 1024;
          int v21 = v3;
          __int16 v22 = 1024;
          int v23 = v10;
          __int16 v24 = 1024;
          int IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)self);
          __int16 v26 = 1024;
          int v27 = v8;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d UpdateMTU MTU: %d -> %d Cellular: %d/%d", (uint8_t *)&v14, 0x34u);
        }
      }
      self->_maxConnectionMTU = v10;
      LOWORD(v3) = v10;
    }
  }
  return v3;
}

- (BOOL)isOnSameQRSessionWithConnection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unint64_t v4 = [(VCConnectionIDS *)self connectionQRSessionID];
    uint64_t v5 = [a3 connectionQRSessionID];
    if (v4 && v5)
    {
      LOBYTE(v5) = [(id)v4 isEqual:v5];
    }
    else
    {
      LOBYTE(v5) = (v4 | v5) == 0;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      unsigned __int16 v7 = *MEMORY[0x1E4F47A50];
      int v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        LOBYTE(v5) = 0;
        if (!v9) {
          return v5;
        }
        int v11 = 136315650;
        uint64_t v12 = v6;
        __int16 v13 = 2080;
        int v14 = "-[VCConnectionIDS isOnSameQRSessionWithConnection:]";
        __int16 v15 = 1024;
        int v16 = 491;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: connection to check is nil", (uint8_t *)&v11, 0x1Cu);
      }
      else
      {
        LODWORD(v5) = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
        if (!v5) {
          return v5;
        }
        -[VCConnectionIDS isOnSameQRSessionWithConnection:]();
      }
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isOnSameInterfacesAndQRSessionWithConnection:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!a3)
  {
    if (ErrorLogLevelForModule >= 8)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        LOBYTE(v14) = 0;
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          return v14;
        }
        int v20 = 136315650;
        uint64_t v21 = v11;
        __int16 v22 = 2080;
        int v23 = "-[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:]";
        __int16 v24 = 1024;
        int v25 = 506;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: connection to check is nil", (uint8_t *)&v20, 0x1Cu);
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:]();
      }
    }
    LOBYTE(v14) = 0;
    return v14;
  }
  uint64_t v6 = (unsigned char *)MEMORY[0x1E4F47A40];
  unsigned __int16 v7 = (NSObject **)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 8)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    BOOL v9 = *v7;
    unsigned __int16 v10 = *v7;
    if (*v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136316162;
        uint64_t v21 = v8;
        __int16 v22 = 2080;
        int v23 = "-[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:]";
        __int16 v24 = 1024;
        int v25 = 509;
        __int16 v26 = 2080;
        int v27 = [(NSString *)[(VCConnectionIDS *)self description] UTF8String];
        __int16 v28 = 2080;
        uint64_t v29 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: isOnSameInterfacesAndQRSessionWithConnection: %s vs. %s", (uint8_t *)&v20, 0x30u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 136316162;
      uint64_t v21 = v8;
      __int16 v22 = 2080;
      int v23 = "-[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:]";
      __int16 v24 = 1024;
      int v25 = 509;
      __int16 v26 = 2080;
      int v27 = [(NSString *)[(VCConnectionIDS *)self description] UTF8String];
      __int16 v28 = 2080;
      uint64_t v29 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      _os_log_debug_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCConnection: isOnSameInterfacesAndQRSessionWithConnection: %s vs. %s", (uint8_t *)&v20, 0x30u);
    }
  }
  if (VCConnection_IsOnSameInterfacesWithConnection((uint64_t)self)) {
    BOOL v14 = [(VCConnectionIDS *)self isOnSameQRSessionWithConnection:a3];
  }
  else {
    BOOL v14 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    int v16 = *v7;
    uint64_t v17 = *v7;
    if (*v6)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = "NO";
        uint64_t v21 = v15;
        int v20 = 136315906;
        int v23 = "-[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:]";
        __int16 v22 = 2080;
        if (v14) {
          __int16 v18 = "YES";
        }
        __int16 v24 = 1024;
        int v25 = 511;
        __int16 v26 = 2080;
        int v27 = v18;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnection: isOnSameInterfacesAndQRSessionWithConnection: %s", (uint8_t *)&v20, 0x26u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      [(VCConnectionIDS *)v15 isOnSameInterfacesAndQRSessionWithConnection:v16];
    }
  }
  return v14;
}

- (int)cellTechForSoMask:(unsigned int)a3 fallbackTo:(int)a4
{
  if (a3) {
    a4 = 5;
  }
  if ((a3 & 8) != 0) {
    int v5 = 9;
  }
  else {
    int v5 = a4;
  }
  if ((a3 & 4) != 0) {
    return 8;
  }
  else {
    return v5;
  }
}

- (unsigned)datagramChannelToken
{
  return self->_datagramChannelToken;
}

- (VCDatagramChannelIDS)datagramChannel
{
  return self->_datagramChannel;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)uplinkBitrateCap
{
  return self->_uplinkBitrateCap;
}

- (void)setUplinkBitrateCap:(unsigned int)a3
{
  self->_uplinkBitrateCap = a3;
}

- (unsigned)downlinkBitrateCap
{
  return self->_downlinkBitrateCap;
}

- (void)setDownlinkBitrateCap:(unsigned int)a3
{
  self->_downlinkBitrateCap = a3;
}

- (unsigned)uplinkAudioBitrateCapOneToOne
{
  return self->_uplinkAudioBitrateCapOneToOne;
}

- (void)setUplinkAudioBitrateCapOneToOne:(unsigned int)a3
{
  self->_uplinkAudioBitrateCapOneToOne = a3;
}

- (unsigned)uplinkBitrateCapOneToOne
{
  return self->_uplinkBitrateCapOneToOne;
}

- (void)setUplinkBitrateCapOneToOne:(unsigned int)a3
{
  self->_uplinkBitrateCapOneToOne = a3;
}

- (BOOL)isLocalDelegated
{
  return self->_isLocalDelegated;
}

- (BOOL)isRemoteDelegated
{
  return self->_isRemoteDelegated;
}

- (BOOL)isVirtualRelayLink
{
  return self->_isVirtualRelayLink;
}

- (int)maxConnectionMTU
{
  return self->_maxConnectionMTU;
}

- (void)setMaxConnectionMTU:(int)a3
{
  self->_maxConnectionMTU = a3;
}

- (BOOL)isQUICPod
{
  return self->_isQUICPod;
}

- (void)setIsQUICPod:(BOOL)a3
{
  self->_isQUICPod = a3;
}

- (NSString)relayProtocolStackDescription
{
  return (NSString *)objc_getProperty(self, a2, 336, 1);
}

- (void)setRelayProtocolStackDescription:(id)a3
{
}

- (NSString)channelDataBaseProtocolStackDescription
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setChannelDataBaseProtocolStackDescription:(id)a3
{
}

+ (void)VCConnectionIDS_RPS:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Passed connection is nil", v2, v3, v4, v5, v6);
}

+ (void)VCConnectionIDS_RPS:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Relay protcol description has not been set yet", v2, v3, v4, v5, v6);
}

+ (void)VCConnectionIDS_CDBPS:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Passed connection is nil", v2, v3, v4, v5, v6);
}

+ (void)VCConnectionIDS_CDBPS:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Channel protocol description has not been set yet", v2, v3, v4, v5, v6);
}

- (void)isOnSameQRSessionWithConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCConnection: connection to check is nil", v2, v3, v4, v5, v6);
}

- (void)isOnSameInterfacesAndQRSessionWithConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCConnection: connection to check is nil", v2, v3, v4, v5, v6);
}

- (void)isOnSameInterfacesAndQRSessionWithConnection:(os_log_t)log .cold.2(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = "NO";
  uint64_t v5 = a1;
  int v4 = 136315906;
  unsigned __int16 v7 = "-[VCConnectionIDS isOnSameInterfacesAndQRSessionWithConnection:]";
  __int16 v6 = 2080;
  __int16 v8 = 1024;
  int v9 = 511;
  if (a2) {
    uint64_t v3 = "YES";
  }
  __int16 v10 = 2080;
  uint64_t v11 = v3;
  _os_log_debug_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCConnection: isOnSameInterfacesAndQRSessionWithConnection: %s", (uint8_t *)&v4, 0x26u);
}

@end