@interface CMSAuthenticationConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)authConfigurationFromMSAuthData:(id)a3;
+ (id)authConfigurationWithClientID:(id)a3 clientSecret:(id)a4 authorizationURL:(id)a5 scope:(id)a6;
- (CMSAuthenticationConfiguration)initWithClientID:(id)a3 clientSecret:(id)a4 authorizationURL:(id)a5 scope:(id)a6;
- (CMSAuthenticationConfiguration)initWithCoder:(id)a3;
- (NSString)clientID;
- (NSString)clientSecret;
- (NSString)scope;
- (NSURL)authorizationURL;
- (id)basicPropertiesDictionary;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMSAuthenticationConfiguration

+ (id)authConfigurationWithClientID:(id)a3 clientSecret:(id)a4 authorizationURL:(id)a5 scope:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[CMSAuthenticationConfiguration alloc] initWithClientID:v12 clientSecret:v11 authorizationURL:v10 scope:v9];

  return v13;
}

- (CMSAuthenticationConfiguration)initWithClientID:(id)a3 clientSecret:(id)a4 authorizationURL:(id)a5 scope:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CMSAuthenticationConfiguration;
  v15 = [(CMSAuthenticationConfiguration *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_clientID, a3);
    objc_storeStrong((id *)&v16->_clientSecret, a4);
    objc_storeStrong((id *)&v16->_authorizationURL, a5);
    objc_storeStrong((id *)&v16->_scope, a6);
  }

  return v16;
}

- (id)description
{
  v2 = [(CMSAuthenticationConfiguration *)self basicPropertiesDictionary];
  v3 = [v2 description];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSAuthenticationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CMSAuthenticationConfiguration;
  v5 = [(CMSAuthenticationConfiguration *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSAuthenticationConfigurationClientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSAuthenticationConfigurationClientSecret"];
    clientSecret = v5->_clientSecret;
    v5->_clientSecret = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSAuthenticationConfigurationAuthorizationURL"];
    authorizationURL = v5->_authorizationURL;
    v5->_authorizationURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CMSAuthenticationConfigurationScope"];
    scope = v5->_scope;
    v5->_scope = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  clientID = self->_clientID;
  id v5 = a3;
  [v5 encodeObject:clientID forKey:@"CMSAuthenticationConfigurationClientID"];
  [v5 encodeObject:self->_clientSecret forKey:@"CMSAuthenticationConfigurationClientSecret"];
  [v5 encodeObject:self->_authorizationURL forKey:@"CMSAuthenticationConfigurationAuthorizationURL"];
  [v5 encodeObject:self->_scope forKey:@"CMSAuthenticationConfigurationScope"];
}

+ (id)authConfigurationFromMSAuthData:(id)a3
{
  v3 = (void *)MEMORY[0x263F08928];
  id v4 = a3;
  id v5 = [v3 unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];

  if (v5)
  {
    uint64_t v6 = [v5 configuration];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)basicPropertiesDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(NSURL *)self->_authorizationURL absoluteString];
  objc_msgSend(v3, "na_safeSetObject:forKey:", v4, @"authorizationURL");

  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_clientID, @"clientIdentifier");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_clientSecret, @"clientSecret");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_scope, @"scope");

  return v3;
}

- (NSString)clientID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)clientSecret
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)authorizationURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)scope
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);
  objc_storeStrong((id *)&self->_clientSecret, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

@end