@interface MPStoreModelRequest
+ (BOOL)requiresNetwork;
+ (BOOL)supportsSecureCoding;
- (MPStoreModelRequest)init;
- (MPStoreModelRequest)initWithCoder:(id)a3;
- (NSString)clientIdentifier;
- (NSString)clientPlatformIdentifier;
- (NSString)clientVersion;
- (double)timeoutInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)authenticationOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationOptions:(unint64_t)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientPlatformIdentifier:(id)a3;
- (void)setClientVersion:(id)a3;
- (void)setTimeoutInterval:(double)a3;
@end

@implementation MPStoreModelRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientPlatformIdentifier, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)setAuthenticationOptions:(unint64_t)a3
{
  self->_authenticationOptions = a3;
}

- (unint64_t)authenticationOptions
{
  return self->_authenticationOptions;
}

- (void)setClientPlatformIdentifier:(id)a3
{
}

- (NSString)clientPlatformIdentifier
{
  return self->_clientPlatformIdentifier;
}

- (void)setClientVersion:(id)a3
{
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_didSetTimeoutInterval = 1;
  self->_timeoutInterval = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MPStoreModelRequest;
  v5 = -[MPModelRequest copyWithZone:](&v14, sel_copyWithZone_);
  v6 = v5;
  if (v5)
  {
    v5[9] = *(void *)&self->_timeoutInterval;
    *((unsigned char *)v5 + 64) = self->_didSetTimeoutInterval;
    uint64_t v7 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
    v8 = (void *)v6[10];
    v6[10] = v7;

    uint64_t v9 = [(NSString *)self->_clientVersion copyWithZone:a3];
    v10 = (void *)v6[11];
    v6[11] = v9;

    uint64_t v11 = [(NSString *)self->_clientPlatformIdentifier copyWithZone:a3];
    v12 = (void *)v6[12];
    v6[12] = v11;

    v6[13] = self->_authenticationOptions;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPStoreModelRequest;
  [(MPModelRequest *)&v5 encodeWithCoder:v4];
  if (self->_didSetTimeoutInterval) {
    [v4 encodeDouble:@"MPStoreModelRequestTimeoutInterval" forKey:self->_timeoutInterval];
  }
  [v4 encodeObject:self->_clientIdentifier forKey:@"MPStoreModelRequestClientIdentifier"];
  [v4 encodeObject:self->_clientVersion forKey:@"MPStoreModelRequestClientVersion"];
  [v4 encodeObject:self->_clientPlatformIdentifier forKey:@"MPStoreModelRequestClientPlatformIdentifier"];
  [v4 encodeInteger:self->_authenticationOptions forKey:@"MPStoreModelRequestAuthenticationOptions"];
}

- (MPStoreModelRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPStoreModelRequest;
  objc_super v5 = [(MPModelRequest *)&v14 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"MPStoreModelRequestTimeoutInterval"])
    {
      [v4 decodeDoubleForKey:@"MPStoreModelRequestTimeoutInterval"];
      v5->_timeoutInterval = v6;
    }
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPStoreModelRequestClientIdentifier"];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPStoreModelRequestClientVersion"];
    clientVersion = v5->_clientVersion;
    v5->_clientVersion = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPStoreModelRequestClientPlatformIdentifier"];
    clientPlatformIdentifier = v5->_clientPlatformIdentifier;
    v5->_clientPlatformIdentifier = (NSString *)v11;

    if ([v4 containsValueForKey:@"MPStoreModelRequestAuthenticationOptions"]) {
      v5->_authenticationOptions = [v4 decodeIntegerForKey:@"MPStoreModelRequestAuthenticationOptions"];
    }
  }

  return v5;
}

- (MPStoreModelRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPStoreModelRequest;
  result = [(MPStoreModelRequest *)&v3 init];
  if (result)
  {
    result->_timeoutInterval = 60.0;
    result->_authenticationOptions = 0;
  }
  return result;
}

+ (BOOL)requiresNetwork
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end