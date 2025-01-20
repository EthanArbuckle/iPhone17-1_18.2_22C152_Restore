@interface VCMockIDSDataChannelLinkContext
- (BOOL)idsUPlusOneMode;
- (BOOL)isVirtualRelayLink;
- (VCMockIDSDataChannelLinkContext)initWithSourcePort:(signed __int16)a3;
- (char)linkID;
- (int64_t)connectionType;
- (unsigned)RATType;
- (unsigned)estimatedPerPacketConstantOverhead;
- (unsigned)localLinkFlags;
- (unsigned)networkType;
- (unsigned)remoteNetworkType;
- (unsigned)remoteRATType;
- (void)setIdsUPlusOneMode:(BOOL)a3;
- (void)setNetworkType:(unsigned __int8)a3;
- (void)setRemoteNetworkType:(unsigned __int8)a3;
@end

@implementation VCMockIDSDataChannelLinkContext

- (VCMockIDSDataChannelLinkContext)initWithSourcePort:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)VCMockIDSDataChannelLinkContext;
  v4 = [(VCMockIDSDataChannelLinkContext *)&v15 init];
  [(IDSDataChannelLinkContext *)v4 initWithDummyInformation];
  int v5 = objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "forceNetworkCellular");
  v4->_forceNetworkCellular = v5;
  if (v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v17 = v6;
        __int16 v18 = 2080;
        v19 = "-[VCMockIDSDataChannelLinkContext initWithSourcePort:]";
        __int16 v20 = 1024;
        int v21 = 110;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Mock IDS channel network type as cellular", buf, 0x1Cu);
      }
    }
  }
  v4->_int networkType = VCDefaults_GetIntValueForKey(@"forceIDSLinkIPVersion", 0);
  v4->_int remoteNetworkType = VCDefaults_GetIntValueForKey(@"forceIDSLinkIPVersion", 0);
  v4->_int localLinkFlags = VCDefaults_GetIntValueForKey(@"forceIDSLocalLinkFlags", 0);
  v4->_idsUPlusOneMode = 0;
  v4->_estimatedPerPacketConstantOverhead = 82;
  if (VCDefaults_GetBoolValueForKey(@"enableTestNetworkRouter", 0)) {
    v4->_int linkID = v3
  }
                - 127
                * (((v3 + ((-32509 * v3) >> 16)) >> 6)
                 + (((v3 + ((-32509 * v3) >> 16)) & 0x8000) >> 15));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int networkType = v4->_networkType;
      int remoteNetworkType = v4->_remoteNetworkType;
      int localLinkFlags = v4->_localLinkFlags;
      int linkID = v4->_linkID;
      *(_DWORD *)buf = 136316930;
      uint64_t v17 = v8;
      __int16 v18 = 2080;
      v19 = "-[VCMockIDSDataChannelLinkContext initWithSourcePort:]";
      __int16 v20 = 1024;
      int v21 = 122;
      __int16 v22 = 1024;
      int v23 = networkType;
      __int16 v24 = 1024;
      int v25 = remoteNetworkType;
      __int16 v26 = 1024;
      int v27 = localLinkFlags;
      __int16 v28 = 1024;
      int v29 = linkID;
      __int16 v30 = 1024;
      int v31 = v3;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Mock IDS channel context forced _networkType=%u _remoteNetworkType=%u _localLinkFlags=%u _linkID=%u [sourcePort=%u]", buf, 0x3Au);
    }
  }
  return v4;
}

- (unsigned)RATType
{
  if (self->_forceNetworkCellular) {
    return 5;
  }
  else {
    return 0;
  }
}

- (unsigned)remoteRATType
{
  if (self->_forceNetworkCellular) {
    return 5;
  }
  else {
    return 0;
  }
}

- (int64_t)connectionType
{
  return 2;
}

- (BOOL)isVirtualRelayLink
{
  return self->_idsUPlusOneMode;
}

- (unsigned)estimatedPerPacketConstantOverhead
{
  return self->_estimatedPerPacketConstantOverhead;
}

- (BOOL)idsUPlusOneMode
{
  return self->_idsUPlusOneMode;
}

- (void)setIdsUPlusOneMode:(BOOL)a3
{
  self->_idsUPlusOneMode = a3;
}

- (unsigned)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(unsigned __int8)a3
{
  self->_int networkType = a3;
}

- (unsigned)remoteNetworkType
{
  return self->_remoteNetworkType;
}

- (void)setRemoteNetworkType:(unsigned __int8)a3
{
  self->_int remoteNetworkType = a3;
}

- (unsigned)localLinkFlags
{
  return self->_localLinkFlags;
}

- (char)linkID
{
  return self->_linkID;
}

@end