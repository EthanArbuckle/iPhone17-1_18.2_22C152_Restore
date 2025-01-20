@interface AVCSessionConfiguration
+ (id)stringFromSessionMode:(int64_t)a3;
+ (int64_t)clientSessionModeWithSessionMode:(int64_t)a3;
+ (int64_t)sessionModeWithClientSessionMode:(int64_t)a3;
- (AVCSessionABTestConfiguration)abTestConfiguration;
- (AVCSessionConfiguration)init;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isRemoteScreenControlEnabled;
- (BOOL)outOfProcessCodecsEnabled;
- (NSCopying)reportingHierarchyToken;
- (NSDate)conversationTimeBase;
- (NSDate)conversationTimeBaseTruncated;
- (NSString)serviceName;
- (NSUUID)conversationID;
- (OS_nw_activity)parentNWActivity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deserializeNwActivity:(id)a3;
- (id)dictionary;
- (id)serializeNwActivity:(id)a3;
- (int64_t)sessionMode;
- (void)cleanupNwActivity;
- (void)dealloc;
- (void)setAbTestConfiguration:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setConversationTimeBase:(id)a3;
- (void)setConversationTimeBaseTruncated:(id)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setOutOfProcessCodecsEnabled:(BOOL)a3;
- (void)setParentNWActivity:(id)a3;
- (void)setRemoteScreenControlEnabled:(BOOL)a3;
- (void)setReportingHierarchyToken:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSessionMode:(int64_t)a3;
- (void)setUpWithDictionary:(id)a3;
@end

@implementation AVCSessionConfiguration

+ (id)stringFromSessionMode:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    v3 = "Unknown";
  }
  else {
    v3 = off_1E6DB98A8[a3];
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s(%ld)", v3, a3);
}

- (id)description
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)AVCSessionConfiguration;
  id v4 = [(AVCSessionConfiguration *)&v9 description];
  id v5 = +[AVCSessionConfiguration stringFromSessionMode:self->_sessionMode];
  v6 = "YES";
  if (self->_oneToOneModeEnabled) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  if (!self->_outOfProcessCodecsEnabled) {
    v6 = "NO";
  }
  return (id)[v3 stringWithFormat:@"{ %@ sessionMode=%@, oneToOneModeEnabled=%s, serviceName=%@, outOfProcessCodecsEnabled=%s, abTestConfiguration=%@ }", v4, v5, v7, self->_serviceName, v6, self->_abTestConfiguration];
}

- (AVCSessionConfiguration)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)AVCSessionConfiguration;
  v2 = [(AVCSessionConfiguration *)&v4 init];
  if (v2) {
    v2->_abTestConfiguration = objc_alloc_init(AVCSessionABTestConfiguration);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  [(AVCSessionConfiguration *)self cleanupNwActivity];
  v3.receiver = self;
  v3.super_class = (Class)AVCSessionConfiguration;
  [(AVCSessionConfiguration *)&v3 dealloc];
}

- (void)setSessionMode:(int64_t)a3
{
  int v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        uint64_t v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v6 = 136315906;
          uint64_t v7 = v4;
          __int16 v8 = 2080;
          objc_super v9 = "-[AVCSessionConfiguration setSessionMode:]";
          __int16 v10 = 1024;
          int v11 = 93;
          __int16 v12 = 1024;
          int v13 = v3;
          _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid value for sessionMode=%d", (uint8_t *)&v6, 0x22u);
        }
      }
    }
    else
    {
      self->_sessionMode = 0;
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

- (void)setUpWithDictionary:(id)a3
{
  -[AVCSessionConfiguration setSessionMode:](self, "setSessionMode:", +[AVCSessionConfiguration clientSessionModeWithSessionMode:](AVCSessionConfiguration, "clientSessionModeWithSessionMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionType"), "integerValue")));
  -[AVCSessionConfiguration setReportingHierarchyToken:](self, "setReportingHierarchyToken:", [a3 objectForKeyedSubscript:@"vcSessionParentHierarchyToken"]);
  self->_oneToOneModeEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionOneOnOneModeEnabled"), "BOOLValue");
  if ([a3 objectForKeyedSubscript:@"vcSessionConversationID"])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionConversationID"));
    [(AVCSessionConfiguration *)self setConversationID:v5];
  }
  -[AVCSessionConfiguration setConversationTimeBase:](self, "setConversationTimeBase:", [a3 objectForKeyedSubscript:@"vcSessionConversationTimeBase"]);
  -[AVCSessionConfiguration setConversationTimeBaseTruncated:](self, "setConversationTimeBaseTruncated:", [a3 objectForKeyedSubscript:@"vcSessionConversationTimeBaseTruncated"]);
  -[AVCSessionConfiguration setServiceName:](self, "setServiceName:", [a3 objectForKeyedSubscript:@"vcSessionServiceName"]);
  -[AVCSessionConfiguration setOutOfProcessCodecsEnabled:](self, "setOutOfProcessCodecsEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionOutOfProcessCodecsEnabled"), "BOOLValue"));
  if ([a3 objectForKeyedSubscript:@"vcSessionParentNWActivity"]) {
    -[AVCSessionConfiguration setParentNWActivity:](self, "setParentNWActivity:", -[AVCSessionConfiguration deserializeNwActivity:](self, "deserializeNwActivity:", [a3 objectForKeyedSubscript:@"vcSessionParentNWActivity"]));
  }
  id v6 = +[AVCSessionABTestConfiguration createWithDictionary:](AVCSessionABTestConfiguration, "createWithDictionary:", [a3 objectForKeyedSubscript:@"vcSessionABTestsConfiguration"]);

  [(AVCSessionConfiguration *)self setAbTestConfiguration:v6];
}

- (id)dictionary
{
  v13[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = v3;
  reportingHierarchyToken = self->_reportingHierarchyToken;
  if (reportingHierarchyToken) {
    [v3 setObject:reportingHierarchyToken forKeyedSubscript:@"vcSessionParentHierarchyToken"];
  }
  conversationID = self->_conversationID;
  if (conversationID) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSUUID UUIDString](conversationID, "UUIDString"), @"vcSessionConversationID");
  }
  conversationTimeBase = self->_conversationTimeBase;
  if (conversationTimeBase) {
    [v4 setObject:conversationTimeBase forKeyedSubscript:@"vcSessionConversationTimeBase"];
  }
  conversationTimeBaseTruncated = self->_conversationTimeBaseTruncated;
  if (conversationTimeBaseTruncated) {
    [v4 setObject:conversationTimeBaseTruncated forKeyedSubscript:@"vcSessionConversationTimeBaseTruncated"];
  }
  if (self->_parentNWActivity && nw_activity_is_activated()) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[AVCSessionConfiguration serializeNwActivity:](self, "serializeNwActivity:", self->_parentNWActivity), @"vcSessionParentNWActivity");
  }
  serviceName = self->_serviceName;
  if (serviceName) {
    [v4 setObject:serviceName forKeyedSubscript:@"vcSessionServiceName"];
  }
  abTestConfiguration = self->_abTestConfiguration;
  if (abTestConfiguration) {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", -[AVCSessionABTestConfiguration dictionary](abTestConfiguration, "dictionary"), @"vcSessionABTestsConfiguration");
  }
  v12[0] = @"vcSessionType";
  v13[0] = objc_msgSend(NSNumber, "numberWithInteger:", +[AVCSessionConfiguration sessionModeWithClientSessionMode:](AVCSessionConfiguration, "sessionModeWithClientSessionMode:", self->_sessionMode));
  v12[1] = @"vcSessionOneOnOneModeEnabled";
  v13[1] = [NSNumber numberWithBool:self->_oneToOneModeEnabled];
  v12[2] = @"vcSessionParameterParticipantScreenControlEnabled";
  v13[2] = [NSNumber numberWithBool:self->_remoteScreenControlEnabled];
  v12[3] = @"vcSessionOutOfProcessCodecsEnabled";
  v13[3] = [NSNumber numberWithBool:self->_outOfProcessCodecsEnabled];
  objc_msgSend(v4, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, v12, 4));
  return v4;
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

+ (int64_t)clientSessionModeWithSessionMode:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

+ (int64_t)sessionModeWithClientSessionMode:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

- (id)serializeNwActivity:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = nw_activity_copy_xpc_token();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (MEMORY[0x1E4E59BB0]() == MEMORY[0x1E4F14600] && (bytes = xpc_uuid_get_bytes(v4)) != 0)
    {
      memset(v8, 0, sizeof(v8));
      uuid_unparse(bytes, v8);
      uint64_t v5 = (void *)[[NSString alloc] initWithCString:v8 encoding:4];
    }
    else
    {
      uint64_t v5 = 0;
    }
    xpc_release(v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)deserializeNwActivity:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:a3];
    uint64_t v4 = v3;
    if (v3)
    {
      *(void *)uuid = 0;
      uint64_t v9 = 0;
      [v3 getUUIDBytes:uuid];
      xpc_object_t v5 = xpc_uuid_create(uuid);
      id v6 = (void *)nw_activity_create_from_xpc_token();
      xpc_release(v5);
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)cleanupNwActivity
{
  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity) {
    nw_release(parentNWActivity);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  xpc_object_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setSessionMode:", -[AVCSessionConfiguration sessionMode](self, "sessionMode"));
  objc_msgSend(v5, "setOneToOneModeEnabled:", -[AVCSessionConfiguration isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));
  objc_msgSend(v5, "setAbTestConfiguration:", -[AVCSessionConfiguration abTestConfiguration](self, "abTestConfiguration"));
  objc_msgSend(v5, "setRemoteScreenControlEnabled:", -[AVCSessionConfiguration isRemoteScreenControlEnabled](self, "isRemoteScreenControlEnabled"));
  objc_msgSend(v5, "setParentNWActivity:", -[AVCSessionConfiguration parentNWActivity](self, "parentNWActivity"));
  objc_msgSend(v5, "setOutOfProcessCodecsEnabled:", -[AVCSessionConfiguration outOfProcessCodecsEnabled](self, "outOfProcessCodecsEnabled"));
  id v6 = (void *)[(NSCopying *)[(AVCSessionConfiguration *)self reportingHierarchyToken] copyWithZone:a3];
  [v5 setReportingHierarchyToken:v6];

  uint64_t v7 = (void *)[(NSUUID *)[(AVCSessionConfiguration *)self conversationID] copyWithZone:a3];
  [v5 setConversationID:v7];

  __int16 v8 = (void *)[(NSDate *)[(AVCSessionConfiguration *)self conversationTimeBase] copyWithZone:a3];
  [v5 setConversationTimeBase:v8];

  uint64_t v9 = (void *)[(NSDate *)[(AVCSessionConfiguration *)self conversationTimeBaseTruncated] copyWithZone:a3];
  [v5 setConversationTimeBaseTruncated:v9];

  uint64_t v10 = (void *)[(NSString *)[(AVCSessionConfiguration *)self serviceName] copyWithZone:a3];
  [v5 setServiceName:v10];

  return v5;
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

- (BOOL)isRemoteScreenControlEnabled
{
  return self->_remoteScreenControlEnabled;
}

- (void)setRemoteScreenControlEnabled:(BOOL)a3
{
  self->_remoteScreenControlEnabled = a3;
}

- (BOOL)outOfProcessCodecsEnabled
{
  return self->_outOfProcessCodecsEnabled;
}

- (void)setOutOfProcessCodecsEnabled:(BOOL)a3
{
  self->_outOfProcessCodecsEnabled = a3;
}

- (AVCSessionABTestConfiguration)abTestConfiguration
{
  return self->_abTestConfiguration;
}

- (void)setAbTestConfiguration:(id)a3
{
}

@end