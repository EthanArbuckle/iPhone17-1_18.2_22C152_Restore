@interface MPCPlaybackDelegationProperties
+ (BOOL)supportsSecureCoding;
+ (id)payloadValueFromJSONValue:(id)a3;
- (MPCPlaybackDelegationProperties)initWithCoder:(id)a3;
- (MPCPlaybackDelegationProperties)initWithStoreAccountID:(unint64_t)a3 deviceGUID:(id)a4;
- (NSString)deviceGUID;
- (NSString)deviceName;
- (NSString)requestUserAgent;
- (NSTimeZone)timeZone;
- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4;
- (id)mpc_jsonValue;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)systemReleaseType;
- (unint64_t)storeAccountID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPCPlaybackDelegationProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_requestUserAgent, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_deviceGUID, 0);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSString)requestUserAgent
{
  return self->_requestUserAgent;
}

- (int64_t)systemReleaseType
{
  return self->_systemReleaseType;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  v6 = [[(objc_class *)a3 allocWithZone:a4] initWithStoreAccountID:self->_storeAccountID deviceGUID:self->_deviceGUID];
  if (v6)
  {
    uint64_t v7 = [(NSString *)self->_deviceName copyWithZone:a4];
    v8 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v7;

    uint64_t v9 = [(NSString *)self->_requestUserAgent copyWithZone:a4];
    v10 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v9;

    *((void *)v6 + 3) = self->_systemReleaseType;
    uint64_t v11 = [(NSTimeZone *)self->_timeZone copyWithZone:a4];
    v12 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v11;
  }
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MPCPlaybackDelegationProperties *)self _copyWithClass:v5 zone:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t storeAccountID = self->_storeAccountID;
  id v5 = a3;
  [v5 encodeInt64:storeAccountID forKey:@"storeAccountID"];
  [v5 encodeObject:self->_deviceGUID forKey:@"deviceGUID"];
  [v5 encodeObject:self->_deviceName forKey:@"deviceName"];
  [v5 encodeObject:self->_requestUserAgent forKey:@"requestUserAgent"];
  [v5 encodeInteger:self->_systemReleaseType forKey:@"systemReleaseType"];
  [v5 encodeObject:self->_timeZone forKey:@"timeZone"];
}

- (MPCPlaybackDelegationProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPCPlaybackDelegationProperties;
  id v5 = [(MPCPlaybackDelegationProperties *)&v15 init];
  if (v5)
  {
    v5->_unint64_t storeAccountID = [v4 decodeInt64ForKey:@"storeAccountID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceGUID"];
    deviceGUID = v5->_deviceGUID;
    v5->_deviceGUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestUserAgent"];
    requestUserAgent = v5->_requestUserAgent;
    v5->_requestUserAgent = (NSString *)v10;

    v5->_systemReleaseType = [v4 decodeIntegerForKey:@"systemReleaseType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v12;
  }
  return v5;
}

- (MPCPlaybackDelegationProperties)initWithStoreAccountID:(unint64_t)a3 deviceGUID:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCPlaybackDelegationProperties;
  uint64_t v7 = [(MPCPlaybackDelegationProperties *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_unint64_t storeAccountID = a3;
    uint64_t v9 = [v6 copy];
    deviceGUID = v8->_deviceGUID;
    v8->_deviceGUID = (NSString *)v9;
  }
  return v8;
}

- (id)mpc_jsonValue
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MPCPlaybackDelegationProperties storeAccountID](self, "storeAccountID"));
  [v3 setObject:v4 forKeyedSubscript:@"accountID"];

  id v5 = [(MPCPlaybackDelegationProperties *)self deviceGUID];
  [v3 setObject:v5 forKeyedSubscript:@"deviceGUID"];

  id v6 = [(MPCPlaybackDelegationProperties *)self deviceName];
  [v3 setObject:v6 forKeyedSubscript:@"deviceName"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[MPCPlaybackDelegationProperties systemReleaseType](self, "systemReleaseType"));
  [v3 setObject:v7 forKeyedSubscript:@"systemType"];

  uint64_t v8 = [(MPCPlaybackDelegationProperties *)self requestUserAgent];
  [v3 setObject:v8 forKeyedSubscript:@"requestUserAgent"];

  uint64_t v9 = [(MPCPlaybackDelegationProperties *)self timeZone];
  uint64_t v10 = [v9 name];
  [v3 setObject:v10 forKeyedSubscript:@"timeZone"];

  return v3;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [MPCMutablePlaybackDelegationProperties alloc];
    id v5 = [v3 objectForKeyedSubscript:@"accountID"];
    uint64_t v6 = [v5 unsignedLongLongValue];
    uint64_t v7 = [v3 objectForKeyedSubscript:@"deviceGUID"];
    uint64_t v8 = [(MPCPlaybackDelegationProperties *)v4 initWithStoreAccountID:v6 deviceGUID:v7];

    uint64_t v9 = [v3 objectForKeyedSubscript:@"deviceName"];
    [(MPCMutablePlaybackDelegationProperties *)v8 setDeviceName:v9];

    uint64_t v10 = [v3 objectForKeyedSubscript:@"systemType"];
    -[MPCMutablePlaybackDelegationProperties setSystemReleaseType:](v8, "setSystemReleaseType:", [v10 integerValue]);

    uint64_t v11 = [v3 objectForKeyedSubscript:@"requestUserAgent"];
    [(MPCMutablePlaybackDelegationProperties *)v8 setRequestUserAgent:v11];

    objc_super v12 = (void *)MEMORY[0x263EFFA18];
    v13 = [v3 objectForKeyedSubscript:@"timeZone"];

    v14 = [v12 timeZoneWithName:v13];
    [(MPCMutablePlaybackDelegationProperties *)v8 setTimeZone:v14];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end