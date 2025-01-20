@interface MSServiceAccount
+ (BOOL)supportsSecureCoding;
- (MSServiceAccount)initWithCoder:(id)a3;
- (MSServiceAccount)initWithServiceName:(NSString *)serviceName accountName:(NSString *)accountName;
- (NSArray)intentExamples;
- (NSSet)supportedMediaIntents;
- (NSString)accountName;
- (NSString)authorizationScope;
- (NSString)clientID;
- (NSString)clientSecret;
- (NSString)serviceName;
- (NSURL)authorizationTokenURL;
- (NSURL)configurationURL;
- (NSUUID)serviceID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorizationScope:(NSString *)authorizationScope;
- (void)setAuthorizationTokenURL:(NSURL *)authorizationTokenURL;
- (void)setClientID:(NSString *)clientID;
- (void)setClientSecret:(NSString *)clientSecret;
- (void)setConfigurationURL:(NSURL *)configurationURL;
- (void)setServiceID:(id)a3;
@end

@implementation MSServiceAccount

- (MSServiceAccount)initWithServiceName:(NSString *)serviceName accountName:(NSString *)accountName
{
  v7 = serviceName;
  v8 = accountName;
  v16.receiver = self;
  v16.super_class = (Class)MSServiceAccount;
  uint64_t v9 = [(MSServiceAccount *)&v16 self];

  if (v9)
  {
    if (!v7 || !v8)
    {
      NSLog(&cfstr_FailedToInitia_1.isa);
      v14 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)(v9 + 8), serviceName);
    objc_storeStrong((id *)(v9 + 16), accountName);
    uint64_t v10 = +[MSAssistantPreferences intentExamples];
    v11 = *(void **)(v9 + 72);
    *(void *)(v9 + 72) = v10;

    uint64_t v12 = +[MSAssistantPreferences supportedMediaIntents];
    v13 = *(void **)(v9 + 80);
    *(void *)(v9 + 80) = v12;
  }
  v14 = (MSServiceAccount *)(id)v9;
LABEL_7:

  return v14;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceName, @"serviceName");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_accountName, @"accountName");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_clientID, @"clientID");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_clientSecret, @"clientSecret");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_serviceID, @"serviceID");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_configurationURL, @"configurationURL");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_authorizationTokenURL, @"authorizationTokenURL");
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_authorizationScope, @"authorizationScope");
  v4 = [v3 description];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  serviceName = self->_serviceName;
  id v5 = a3;
  [v5 encodeObject:serviceName forKey:@"MSSCServiceNameEncodedKey"];
  [v5 encodeObject:self->_accountName forKey:@"MSSCAccountNameEncodedKey"];
  [v5 encodeObject:self->_authorizationScope forKey:@"MSSCAuthorizationScope"];
  [v5 encodeObject:self->_authorizationTokenURL forKey:@"MSSCAuthorizationTokenURL"];
  [v5 encodeObject:self->_clientID forKey:@"MSSCClientIDEncodedKey"];
  [v5 encodeObject:self->_clientSecret forKey:@"MSSCClientSecretEncodedKey"];
  [v5 encodeObject:self->_configurationURL forKey:@"MSSCconfigURLEncodedKey"];
  [v5 encodeObject:self->_serviceID forKey:@"MSSCServiceIDEncodedKey"];
  [v5 encodeObject:self->_intentExamples forKey:@"MSSCIntentExamplesEncodedKey"];
  [v5 encodeObject:self->_supportedMediaIntents forKey:@"MSSCSupportedMediaIntentsEncodedKey"];
}

- (MSServiceAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSCServiceNameEncodedKey"];
  serviceName = self->_serviceName;
  self->_serviceName = v5;

  if (self->_serviceName
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSCAccountNameEncodedKey"],
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        accountName = self->_accountName,
        self->_accountName = v7,
        accountName,
        self->_accountName))
  {
    uint64_t v9 = -[MSServiceAccount initWithServiceName:accountName:](self, "initWithServiceName:accountName:", self->_serviceName);
    if (v9)
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSCAuthorizationScope"];
      authorizationScope = v9->_authorizationScope;
      v9->_authorizationScope = (NSString *)v10;

      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSCAuthorizationTokenURL"];
      authorizationTokenURL = v9->_authorizationTokenURL;
      v9->_authorizationTokenURL = (NSURL *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSCClientIDEncodedKey"];
      clientID = v9->_clientID;
      v9->_clientID = (NSString *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSCClientSecretEncodedKey"];
      clientSecret = v9->_clientSecret;
      v9->_clientSecret = (NSString *)v16;

      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSCconfigURLEncodedKey"];
      configurationURL = v9->_configurationURL;
      v9->_configurationURL = (NSURL *)v18;

      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSCServiceIDEncodedKey"];
      serviceID = v9->_serviceID;
      v9->_serviceID = (NSUUID *)v20;

      uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSCIntentExamplesEncodedKey"];
      intentExamples = v9->_intentExamples;
      v9->_intentExamples = (NSArray *)v22;

      uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSSCSupportedMediaIntentsEncodedKey"];
      supportedMediaIntents = v9->_supportedMediaIntents;
      v9->_supportedMediaIntents = (NSSet *)v24;
    }
    self = v9;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)accountName
{
  return self->_accountName;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(NSString *)clientID
{
}

- (NSString)clientSecret
{
  return self->_clientSecret;
}

- (void)setClientSecret:(NSString *)clientSecret
{
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (void)setConfigurationURL:(NSURL *)configurationURL
{
}

- (NSURL)authorizationTokenURL
{
  return self->_authorizationTokenURL;
}

- (void)setAuthorizationTokenURL:(NSURL *)authorizationTokenURL
{
}

- (NSString)authorizationScope
{
  return self->_authorizationScope;
}

- (void)setAuthorizationScope:(NSString *)authorizationScope
{
}

- (NSUUID)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSArray)intentExamples
{
  return self->_intentExamples;
}

- (NSSet)supportedMediaIntents
{
  return self->_supportedMediaIntents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMediaIntents, 0);
  objc_storeStrong((id *)&self->_intentExamples, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_authorizationScope, 0);
  objc_storeStrong((id *)&self->_authorizationTokenURL, 0);
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_clientSecret, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_accountName, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end