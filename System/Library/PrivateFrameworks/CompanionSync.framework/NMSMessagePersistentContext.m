@interface NMSMessagePersistentContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isFromRequest;
- (BOOL)processAcked;
- (BOOL)sendAcked;
- (NMSMessagePersistentContext)initWithCoder:(id)a3;
- (NSDate)date;
- (NSDictionary)idsOptions;
- (NSDictionary)userInfo;
- (NSSet)targetDeviceIDs;
- (NSString)idsIdentifier;
- (id)description;
- (unsigned)messageID;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setFromRequest:(BOOL)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setIdsOptions:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setProcessAcked:(BOOL)a3;
- (void)setSendAcked:(BOOL)a3;
- (void)setTargetDeviceIDs:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation NMSMessagePersistentContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NMSMessagePersistentContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NMSMessagePersistentContext;
  v5 = [(NMSMessagePersistentContext *)&v17 init];
  if (v5)
  {
    v5->_messageID = [v4 decodeIntegerForKey:@"m"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v6;

    v8 = allowedClasses();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"u"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    date = v5->_date;
    v5->_date = (NSDate *)v11;

    v5->_fromRequest = [v4 decodeBoolForKey:@"r"];
    v13 = allowedClasses();
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"f"];
    idsOptions = v5->_idsOptions;
    v5->_idsOptions = (NSDictionary *)v14;

    v5->_sendAcked = [v4 decodeBoolForKey:@"sa"];
    v5->_processAcked = [v4 decodeBoolForKey:@"pa"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInteger:self->_messageID forKey:@"m"];
  [v6 encodeObject:self->_idsIdentifier forKey:@"i"];
  if (self->_userInfo)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[NMSMessagePersistentContext encodeWithCoder:]();
    }
    userInfo = self->_userInfo;
  }
  else
  {
    userInfo = 0;
  }
  [v6 encodeObject:userInfo forKey:@"u"];
  [v6 encodeObject:self->_date forKey:@"d"];
  [v6 encodeBool:self->_fromRequest forKey:@"r"];
  if (self->_idsOptions)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[NMSMessagePersistentContext encodeWithCoder:]();
    }
    idsOptions = self->_idsOptions;
  }
  else
  {
    idsOptions = 0;
  }
  [v6 encodeObject:idsOptions forKey:@"f"];
  [v6 encodeBool:self->_sendAcked forKey:@"sa"];
  [v6 encodeBool:self->_processAcked forKey:@"pa"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p id:%hu ids:%@ date:%@ fromRequest:%d sendAcked:%d processAcked:%d idsOptions:%@ userInfo:%@>", v5, self, self->_messageID, self->_idsIdentifier, self->_date, self->_fromRequest, self->_sendAcked, self->_processAcked, self->_idsOptions, self->_userInfo];

  return v6;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)idsOptions
{
  return self->_idsOptions;
}

- (void)setIdsOptions:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BOOL)isFromRequest
{
  return self->_fromRequest;
}

- (void)setFromRequest:(BOOL)a3
{
  self->_fromRequest = a3;
}

- (BOOL)sendAcked
{
  return self->_sendAcked;
}

- (void)setSendAcked:(BOOL)a3
{
  self->_sendAcked = a3;
}

- (BOOL)processAcked
{
  return self->_processAcked;
}

- (void)setProcessAcked:(BOOL)a3
{
  self->_processAcked = a3;
}

- (NSSet)targetDeviceIDs
{
  return self->_targetDeviceIDs;
}

- (void)setTargetDeviceIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceIDs, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_idsOptions, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

- (void)encodeWithCoder:.cold.1()
{
  __assert_rtn("-[NMSMessagePersistentContext encodeWithCoder:]", "NanoMessagingService.m", 1859, "_idsOptions == nil || [_idsOptions isKindOfClass:[NSDictionary class]]");
}

- (void)encodeWithCoder:.cold.2()
{
  __assert_rtn("-[NMSMessagePersistentContext encodeWithCoder:]", "NanoMessagingService.m", 1855, "_userInfo == nil || [_userInfo isKindOfClass:[NSDictionary class]]");
}

@end