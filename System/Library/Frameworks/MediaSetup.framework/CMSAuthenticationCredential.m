@interface CMSAuthenticationCredential
+ (BOOL)supportsSecureCoding;
+ (id)authCredentialFromMSAuthData:(id)a3;
+ (id)authCredentialWithToken:(id)a3 tokenType:(id)a4 expirationDate:(id)a5 scope:(id)a6 refreshToken:(id)a7;
- (CMSAuthenticationCredential)initWithCoder:(id)a3;
- (CMSAuthenticationCredential)initWithToken:(id)a3 tokenType:(id)a4 expirationDate:(id)a5 scope:(id)a6 refreshToken:(id)a7;
- (NSDate)authTokenExpiration;
- (NSString)authHeader;
- (NSString)authToken;
- (NSString)refreshToken;
- (NSString)scope;
- (NSString)tokenType;
- (id)basicPropertiesDictionary;
- (id)description;
- (id)jsonDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMSAuthenticationCredential

+ (id)authCredentialWithToken:(id)a3 tokenType:(id)a4 expirationDate:(id)a5 scope:(id)a6 refreshToken:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[CMSAuthenticationCredential alloc] initWithToken:v15 tokenType:v14 expirationDate:v13 scope:v12 refreshToken:v11];

  return v16;
}

- (CMSAuthenticationCredential)initWithToken:(id)a3 tokenType:(id)a4 expirationDate:(id)a5 scope:(id)a6 refreshToken:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CMSAuthenticationCredential;
  v17 = [(CMSAuthenticationCredential *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_authToken, a3);
    objc_storeStrong((id *)&v18->_tokenType, a4);
    objc_storeStrong((id *)&v18->_authTokenExpiration, a5);
    objc_storeStrong((id *)&v18->_scope, a6);
    objc_storeStrong((id *)&v18->_refreshToken, a7);
  }

  return v18;
}

- (id)description
{
  v2 = [(CMSAuthenticationCredential *)self basicPropertiesDictionary];
  v3 = [v2 description];

  return v3;
}

- (id)jsonDictionary
{
  v3 = [(CMSAuthenticationCredential *)self basicPropertiesDictionary];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v3];
  id v5 = objc_alloc_init(MEMORY[0x263F08790]);
  [v5 setDateFormat:@"MM-dd-yyyy HH:mm"];
  v6 = [v5 stringFromDate:self->_authTokenExpiration];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"expirationDate");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSAuthenticationCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CMSAuthenticationCredential;
  id v5 = [(CMSAuthenticationCredential *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSAuthenticationCredentialAuthToken"];
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSAuthenticationCredentialTokenType"];
    tokenType = v5->_tokenType;
    v5->_tokenType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSAuthenticationCredentialAuthTokenExpiration"];
    authTokenExpiration = v5->_authTokenExpiration;
    v5->_authTokenExpiration = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSAuthenticationCredentialScope"];
    scope = v5->_scope;
    v5->_scope = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSAuthenticationCredentialRefreshToken"];
    refreshToken = v5->_refreshToken;
    v5->_refreshToken = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  authToken = self->_authToken;
  id v5 = a3;
  [v5 encodeObject:authToken forKey:@"CMSAuthenticationCredentialAuthToken"];
  [v5 encodeObject:self->_tokenType forKey:@"CMSAuthenticationCredentialTokenType"];
  [v5 encodeObject:self->_authTokenExpiration forKey:@"CMSAuthenticationCredentialAuthTokenExpiration"];
  [v5 encodeObject:self->_scope forKey:@"CMSAuthenticationCredentialScope"];
  [v5 encodeObject:self->_refreshToken forKey:@"CMSAuthenticationCredentialRefreshToken"];
}

+ (id)authCredentialFromMSAuthData:(id)a3
{
  v3 = (void *)MEMORY[0x263F08928];
  id v4 = a3;
  id v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];

  if (v5)
  {
    uint64_t v6 = [v5 credential];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSString)authHeader
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_authHeader
    && v2->_authToken
    && [(NSString *)v2->_tokenType caseInsensitiveCompare:@"Bearer"] == NSOrderedSame)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Bearer %@", v2->_authToken];
    authHeader = v2->_authHeader;
    v2->_authHeader = (NSString *)v5;
  }
  objc_sync_exit(v2);

  v3 = v2->_authHeader;

  return v3;
}

- (id)basicPropertiesDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_authToken, @"authToken");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_tokenType, @"tokenType");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_authTokenExpiration, @"expirationDate");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_scope, @"scope");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_refreshToken, @"refreshToken");

  return v3;
}

- (NSString)authToken
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)tokenType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)authTokenExpiration
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)scope
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)refreshToken
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_authTokenExpiration, 0);
  objc_storeStrong((id *)&self->_tokenType, 0);
  objc_storeStrong((id *)&self->_authToken, 0);

  objc_storeStrong((id *)&self->_authHeader, 0);
}

@end