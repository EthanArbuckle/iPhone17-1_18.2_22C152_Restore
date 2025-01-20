@interface CRKToolCommandUserInfo
- (CRKToolCommandUserInfo)initWithSessionIdentifier:(id)a3;
- (NSDictionary)dictionaryValue;
- (NSString)sessionIdentifier;
- (id)appVersion;
@end

@implementation CRKToolCommandUserInfo

- (CRKToolCommandUserInfo)initWithSessionIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKToolCommandUserInfo;
  v5 = [(CRKToolCommandUserInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;
  }
  return v5;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  id v4 = +[CRKSystemInfo sharedSystemInfo];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "platform"));
  [v3 setObject:v5 forKeyedSubscript:@"instructorPlatform"];

  uint64_t v6 = [(CRKToolCommandUserInfo *)self appVersion];
  [v3 setObject:v6 forKeyedSubscript:@"instructorClassroomAppVersion"];

  v7 = [v4 systemVersion];
  [v3 setObject:v7 forKeyedSubscript:@"instructorOSVersion"];

  v8 = [(CRKToolCommandUserInfo *)self sessionIdentifier];
  objc_super v9 = [(CRKToolCommandUserInfo *)self sessionIdentifier];

  if (v9) {
    [v3 setObject:v8 forKeyedSubscript:@"sessionIdentifier"];
  }
  v10 = (void *)[v3 copy];

  return (NSDictionary *)v10;
}

- (id)appVersion
{
  return (id)[NSString stringWithFormat:@"%@", &unk_26D81A330];
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
}

@end