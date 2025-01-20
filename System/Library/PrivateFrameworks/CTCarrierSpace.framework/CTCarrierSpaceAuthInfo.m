@interface CTCarrierSpaceAuthInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldCache;
- (CTCarrierSpaceAuthInfo)init;
- (CTCarrierSpaceAuthInfo)initWithCoder:(id)a3;
- (NSData)accessToken;
- (NSData)refreshToken;
- (NSDate)expiresAt;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessToken:(id)a3;
- (void)setExpiresAt:(id)a3;
- (void)setRefreshToken:(id)a3;
- (void)setShouldCache:(BOOL)a3;
@end

@implementation CTCarrierSpaceAuthInfo

- (CTCarrierSpaceAuthInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)CTCarrierSpaceAuthInfo;
  v2 = [(CTCarrierSpaceAuthInfo *)&v8 init];
  v3 = v2;
  if (v2)
  {
    accessToken = v2->_accessToken;
    v2->_accessToken = 0;

    refreshToken = v3->_refreshToken;
    v3->_refreshToken = 0;

    expiresAt = v3->_expiresAt;
    v3->_expiresAt = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCarrierSpaceAuthInfo *)self accessToken];
  [v3 appendFormat:@" accessToken=%@", v4];

  v5 = [(CTCarrierSpaceAuthInfo *)self refreshToken];
  [v3 appendFormat:@" refreshToken=%@", v5];

  v6 = [(CTCarrierSpaceAuthInfo *)self expiresAt];
  [v3 appendFormat:@" expiresAt=%@", v6];

  objc_msgSend(v3, "appendFormat:", @" shouldCache=%d", -[CTCarrierSpaceAuthInfo shouldCache](self, "shouldCache"));
  [v3 appendString:@">"];
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  accessToken = self->_accessToken;
  id v5 = a3;
  [v5 encodeObject:accessToken forKey:@"accessToken"];
  [v5 encodeObject:self->_refreshToken forKey:@"refreshToken"];
  [v5 encodeObject:self->_expiresAt forKey:@"expiresAt"];
  [v5 encodeBool:self->_shouldCache forKey:@"shouldCache"];
}

- (CTCarrierSpaceAuthInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCarrierSpaceAuthInfo;
  id v5 = [(CTCarrierSpaceAuthInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessToken"];
    accessToken = v5->_accessToken;
    v5->_accessToken = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refreshToken"];
    refreshToken = v5->_refreshToken;
    v5->_refreshToken = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiresAt"];
    expiresAt = v5->_expiresAt;
    v5->_expiresAt = (NSDate *)v10;

    v5->_shouldCache = [v4 decodeBoolForKey:@"shouldCache"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)accessToken
{
  return self->_accessToken;
}

- (void)setAccessToken:(id)a3
{
}

- (NSData)refreshToken
{
  return self->_refreshToken;
}

- (void)setRefreshToken:(id)a3
{
}

- (NSDate)expiresAt
{
  return self->_expiresAt;
}

- (void)setExpiresAt:(id)a3
{
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

- (void)setShouldCache:(BOOL)a3
{
  self->_shouldCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiresAt, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
}

@end