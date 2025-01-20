@interface HDIDSMessagePersistentContext
+ (BOOL)supportsSecureCoding;
- (HDIDSMessagePersistentContext)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDIDSMessagePersistentContext

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInteger:self->_messageID forKey:@"m"];
  [v6 encodeObject:self->_idsIdentifier forKey:@"i"];
  [v6 encodeObject:self->_deviceIdentifier forKey:@"q"];
  if (self->_userInfo)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"HDIDSMessageCenter.m", 918, @"Invalid parameter not satisfying: %@", @"!_userInfo || [_userInfo isKindOfClass:[NSDictionary class]]" object file lineNumber description];
    }
  }
  [v6 encodeObject:self->_userInfo forKey:@"u"];
  [v6 encodeObject:self->_date forKey:@"d"];
  [v6 encodeBool:self->_fromRequest forKey:@"r"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

- (HDIDSMessagePersistentContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDIDSMessagePersistentContext;
  v5 = [(HDIDSMessagePersistentContext *)&v16 init];
  if (v5)
  {
    v5->_messageID = [v4 decodeIntegerForKey:@"m"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"q"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;

    if (_MergedGlobals_222 != -1) {
      dispatch_once(&_MergedGlobals_222, &__block_literal_global_212);
    }
    id v10 = (id)qword_1EBA18E28;
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"u"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    date = v5->_date;
    v5->_date = (NSDate *)v13;

    v5->_fromRequest = [v4 decodeBoolForKey:@"r"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p id:%hu ids:%@ device:%@ date:%@ fromRequest:%d userInfo:%@>", objc_opt_class(), self, self->_messageID, self->_idsIdentifier, self->_deviceIdentifier, self->_date, self->_fromRequest, self->_userInfo];
}

@end