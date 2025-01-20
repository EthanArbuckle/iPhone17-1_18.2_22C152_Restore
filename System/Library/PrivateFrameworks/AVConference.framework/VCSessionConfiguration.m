@interface VCSessionConfiguration
- (BOOL)applyConfigurationUsingClientDict:(id)a3;
- (BOOL)isGKVoiceChat;
- (BOOL)isGftTLEEnabled;
- (BOOL)isOneToOneAuthenticationTagEnabled;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isRemoteScreenControlEnabled;
- (BOOL)outOfProcessCodecsEnabled;
- (BOOL)updateWithClientDictionary:(id)a3;
- (NSCopying)reportingHierarchyToken;
- (NSDate)conversationTimeBase;
- (NSDate)conversationTimeBaseTruncated;
- (NSString)serviceName;
- (NSUUID)conversationID;
- (OS_nw_activity)parentNWActivity;
- (VCSessionConfiguration)init;
- (VCSessionConfiguration)initWithClientDictionary:(id)a3;
- (int64_t)sessionMode;
- (void)applyDefaultsConfigurationOverrides;
- (void)cleanupNwActivity;
- (void)dealloc;
- (void)setConversationID:(id)a3;
- (void)setConversationTimeBase:(id)a3;
- (void)setConversationTimeBaseTruncated:(id)a3;
- (void)setGftTLEEnabled:(BOOL)a3;
- (void)setIsGKVoiceChat:(BOOL)a3;
- (void)setOneToOneAuthenticationTagEnabled:(BOOL)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setOutOfProcessCodecsEnabled:(BOOL)a3;
- (void)setParentNWActivity:(id)a3;
- (void)setRemoteScreenControlEnabled:(BOOL)a3;
- (void)setReportingHierarchyToken:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSessionMode:(int64_t)a3;
@end

@implementation VCSessionConfiguration

- (VCSessionConfiguration)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCSessionConfiguration;
  v2 = [(VCSessionConfiguration *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_sessionMode = 0;
    [(VCSessionConfiguration *)v2 applyDefaultsConfigurationOverrides];
  }
  return v3;
}

- (VCSessionConfiguration)initWithClientDictionary:(id)a3
{
  v4 = [(VCSessionConfiguration *)self init];
  objc_super v5 = v4;
  if (a3 && v4) {
    [(VCSessionConfiguration *)v4 applyConfigurationUsingClientDict:a3];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  [(VCSessionConfiguration *)self cleanupNwActivity];
  v3.receiver = self;
  v3.super_class = (Class)VCSessionConfiguration;
  [(VCSessionConfiguration *)&v3 dealloc];
}

- (void)setSessionMode:(int64_t)a3
{
  int v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      objc_super v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315906;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        v9 = "-[VCSessionConfiguration setSessionMode:]";
        __int16 v10 = 1024;
        int v11 = 79;
        __int16 v12 = 1024;
        int v13 = v3;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid value for sessionMode=%d", (uint8_t *)&v6, 0x22u);
      }
    }
  }
  else
  {
    self->_sessionMode = a3;
  }
}

- (int64_t)sessionMode
{
  return self->_sessionMode;
}

- (void)setParentNWActivity:(id)a3
{
  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity) {
    nw_release(parentNWActivity);
  }
  self->_parentNWActivity = (OS_nw_activity *)a3;
  if (a3)
  {
    nw_retain(a3);
  }
}

- (BOOL)updateWithClientDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    return -[VCSessionConfiguration applyConfigurationUsingClientDict:](self, "applyConfigurationUsingClientDict:");
  }
  else
  {
    if ((VCSessionConfiguration *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionConfiguration updateWithClientDictionary:](v6);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v5 = (__CFString *)[(VCSessionConfiguration *)self performSelector:sel_logPrefix];
      }
      else {
        objc_super v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        __int16 v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v9 = 136316162;
          uint64_t v10 = v7;
          __int16 v11 = 2080;
          __int16 v12 = "-[VCSessionConfiguration updateWithClientDictionary:]";
          __int16 v13 = 1024;
          int v14 = 102;
          __int16 v15 = 2112;
          v16 = v5;
          __int16 v17 = 2048;
          v18 = self;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid client dictionary!", (uint8_t *)&v9, 0x30u);
        }
      }
    }
    return 0;
  }
}

- (BOOL)applyConfigurationUsingClientDict:(id)a3
{
  if (a3)
  {
    objc_super v5 = objc_alloc_init(AVCSessionConfiguration);
    [(AVCSessionConfiguration *)v5 setUpWithDictionary:a3];
    [(VCSessionConfiguration *)self setSessionMode:[(AVCSessionConfiguration *)v5 sessionMode]];
    [(VCSessionConfiguration *)self setReportingHierarchyToken:[(AVCSessionConfiguration *)v5 reportingHierarchyToken]];
    [(VCSessionConfiguration *)self setConversationID:[(AVCSessionConfiguration *)v5 conversationID]];
    [(VCSessionConfiguration *)self setConversationTimeBase:[(AVCSessionConfiguration *)v5 conversationTimeBase]];
    [(VCSessionConfiguration *)self setConversationTimeBaseTruncated:[(AVCSessionConfiguration *)v5 conversationTimeBaseTruncated]];
    [(VCSessionConfiguration *)self setParentNWActivity:[(AVCSessionConfiguration *)v5 parentNWActivity]];
    [(VCSessionConfiguration *)self setServiceName:[(AVCSessionConfiguration *)v5 serviceName]];
    [(VCSessionConfiguration *)self setOutOfProcessCodecsEnabled:[(AVCSessionConfiguration *)v5 outOfProcessCodecsEnabled]];
    uint64_t v6 = [(AVCSessionConfiguration *)v5 abTestConfiguration];
    [(VCSessionConfiguration *)self setOneToOneAuthenticationTagEnabled:[(AVCSessionABTestConfiguration *)v6 isOneToOneAuthenticationTagEnabled]];
    [(VCSessionConfiguration *)self setGftTLEEnabled:[(AVCSessionABTestConfiguration *)v6 isGftTLEEnabled]];
    if ([+[VCDefaults sharedInstance] supportsOneToOneMode])
    {
      if ([+[VCDefaults sharedInstance] forceOneToOneMode])
      {
        self->_oneToOneModeEnabled = 1;
      }
      else
      {
        self->_oneToOneModeEnabled = [(AVCSessionConfiguration *)v5 isOneToOneModeEnabled];
      }
    }
    else if ([(AVCSessionConfiguration *)v5 isOneToOneModeEnabled])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionConfiguration applyConfigurationUsingClientDict:](v8);
        }
      }
      BOOL v7 = 0;
      goto LABEL_13;
    }
    [(VCSessionConfiguration *)self applyDefaultsConfigurationOverrides];
    BOOL v7 = 1;
LABEL_13:

    return v7;
  }
  return 0;
}

- (void)cleanupNwActivity
{
  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity) {
    nw_release(parentNWActivity);
  }
}

- (void)applyDefaultsConfigurationOverrides
{
  self->_oneToOneAuthenticationTagEnabled = VCDefaults_GetBoolValueForKey(@"forceEnableOneToOneAuthenticationTag", self->_oneToOneAuthenticationTagEnabled);
  self->_gftTLEEnabled = VCDefaults_GetBoolValueForKey(@"forceEnabledGFTTLE", self->_gftTLEEnabled);
}

- (NSCopying)reportingHierarchyToken
{
  return self->_reportingHierarchyToken;
}

- (void)setReportingHierarchyToken:(id)a3
{
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  self->_oneToOneModeEnabled = a3;
}

- (BOOL)isOneToOneAuthenticationTagEnabled
{
  return self->_oneToOneAuthenticationTagEnabled;
}

- (void)setOneToOneAuthenticationTagEnabled:(BOOL)a3
{
  self->_oneToOneAuthenticationTagEnabled = a3;
}

- (BOOL)isGftTLEEnabled
{
  return self->_gftTLEEnabled;
}

- (void)setGftTLEEnabled:(BOOL)a3
{
  self->_gftTLEEnabled = a3;
}

- (BOOL)isRemoteScreenControlEnabled
{
  return self->_remoteScreenControlEnabled;
}

- (void)setRemoteScreenControlEnabled:(BOOL)a3
{
  self->_remoteScreenControlEnabled = a3;
}

- (BOOL)isGKVoiceChat
{
  return self->_isGKVoiceChat;
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  self->_isGKVoiceChat = a3;
}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
}

- (NSDate)conversationTimeBase
{
  return self->_conversationTimeBase;
}

- (void)setConversationTimeBase:(id)a3
{
}

- (NSDate)conversationTimeBaseTruncated
{
  return self->_conversationTimeBaseTruncated;
}

- (void)setConversationTimeBaseTruncated:(id)a3
{
}

- (OS_nw_activity)parentNWActivity
{
  return self->_parentNWActivity;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (BOOL)outOfProcessCodecsEnabled
{
  return self->_outOfProcessCodecsEnabled;
}

- (void)setOutOfProcessCodecsEnabled:(BOOL)a3
{
  self->_outOfProcessCodecsEnabled = a3;
}

- (void)updateWithClientDictionary:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 102;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid client dictionary!", (uint8_t *)&v2, 0x1Cu);
}

- (void)applyConfigurationUsingClientDict:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 140;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Does not support oneToOne mode, but session configuration supports oneToOne Mode", (uint8_t *)&v2, 0x1Cu);
}

@end