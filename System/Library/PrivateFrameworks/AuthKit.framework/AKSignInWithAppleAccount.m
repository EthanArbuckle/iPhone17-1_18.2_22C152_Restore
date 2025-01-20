@interface AKSignInWithAppleAccount
+ (BOOL)supportsSecureCoding;
- (AKSignInWithAppleAccount)initWithClientID:(id)a3 userID:(id)a4;
- (AKSignInWithAppleAccount)initWithClientID:(id)a3 userID:(id)a4 scopes:(id)a5 creationDate:(id)a6 privateEmail:(id)a7;
- (AKSignInWithAppleAccount)initWithCoder:(id)a3;
- (AKSignInWithAppleAccountShareInfo)shareInfo;
- (BOOL)hasEULA;
- (NSDate)creationDate;
- (NSString)appStoreAdamID;
- (NSString)appStoreURL;
- (NSString)clientID;
- (NSString)localizedAppDeveloperName;
- (NSString)localizedAppName;
- (NSString)privacyPolicyURL;
- (NSString)privateEmail;
- (NSString)teamID;
- (NSString)userID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)sharedScopes;
- (void)encodeWithCoder:(id)a3;
- (void)setAppStoreAdamID:(id)a3;
- (void)setHasEULA:(BOOL)a3;
- (void)setLocalizedAppDeveloperName:(id)a3;
- (void)setLocalizedAppName:(id)a3;
- (void)setPrivacyPolicyURL:(id)a3;
- (void)setPrivateEmail:(id)a3;
- (void)setShareInfo:(id)a3;
- (void)setSharedScopes:(int64_t)a3;
- (void)setTeamID:(id)a3;
@end

@implementation AKSignInWithAppleAccount

- (AKSignInWithAppleAccount)initWithClientID:(id)a3 userID:(id)a4 scopes:(id)a5 creationDate:(id)a6 privateEmail:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)AKSignInWithAppleAccount;
  v18 = [(AKSignInWithAppleAccount *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientID, a3);
    objc_storeStrong((id *)&v19->_userID, a4);
    objc_storeStrong((id *)&v19->_creationDate, a6);
    objc_storeStrong((id *)&v19->_privateEmail, a7);
    int64_t v20 = [v15 containsObject:@"name"];
    if ([v15 containsObject:@"email"])
    {
      if (v19->_privateEmail) {
        v20 |= 4uLL;
      }
      else {
        v20 |= 2uLL;
      }
    }
    v19->_sharedScopes = v20;
  }

  return v19;
}

- (AKSignInWithAppleAccount)initWithClientID:(id)a3 userID:(id)a4
{
  return [(AKSignInWithAppleAccount *)self initWithClientID:a3 userID:a4 scopes:MEMORY[0x1E4F1CBF0] creationDate:0 privateEmail:0];
}

- (AKSignInWithAppleAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AKSignInWithAppleAccount;
  v5 = [(AKSignInWithAppleAccount *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamID"];
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
    userID = v5->_userID;
    v5->_userID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedAppName"];
    localizedAppName = v5->_localizedAppName;
    v5->_localizedAppName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v14;

    id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedScopes"];
    v5->_sharedScopes = [v16 integerValue];

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateEmail"];
    privateEmail = v5->_privateEmail;
    v5->_privateEmail = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adamID"];
    appStoreAdamID = v5->_appStoreAdamID;
    v5->_appStoreAdamID = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedAppDeveloperName"];
    localizedAppDeveloperName = v5->_localizedAppDeveloperName;
    v5->_localizedAppDeveloperName = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyPolicyURL"];
    privacyPolicyURL = v5->_privacyPolicyURL;
    v5->_privacyPolicyURL = (NSString *)v23;

    v5->_hasEULA = [v4 decodeBoolForKey:@"hasEULA"];
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareInfo"];
    shareInfo = v5->_shareInfo;
    v5->_shareInfo = (AKSignInWithAppleAccountShareInfo *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  clientID = self->_clientID;
  id v6 = a3;
  [v6 encodeObject:clientID forKey:@"clientID"];
  [v6 encodeObject:self->_teamID forKey:@"teamID"];
  [v6 encodeObject:self->_userID forKey:@"userID"];
  [v6 encodeObject:self->_localizedAppName forKey:@"localizedAppName"];
  [v6 encodeObject:self->_creationDate forKey:@"creationDate"];
  v5 = [NSNumber numberWithInteger:self->_sharedScopes];
  [v6 encodeObject:v5 forKey:@"sharedScopes"];

  [v6 encodeObject:self->_privateEmail forKey:@"privateEmail"];
  [v6 encodeObject:self->_appStoreAdamID forKey:@"adamID"];
  [v6 encodeObject:self->_localizedAppDeveloperName forKey:@"localizedAppDeveloperName"];
  [v6 encodeObject:self->_privacyPolicyURL forKey:@"privacyPolicyURL"];
  [v6 encodeBool:self->_hasEULA forKey:@"hasEULA"];
  [v6 encodeObject:self->_shareInfo forKey:@"shareInfo"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_clientID copy];
  id v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSString *)self->_teamID copy];
  uint64_t v8 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v7;

  uint64_t v9 = [(NSString *)self->_userID copy];
  uint64_t v10 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v9;

  uint64_t v11 = [(NSString *)self->_localizedAppName copy];
  uint64_t v12 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v11;

  uint64_t v13 = [(NSDate *)self->_creationDate copy];
  uint64_t v14 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v13;

  *(void *)(v4 + 40) = self->_sharedScopes;
  uint64_t v15 = [(NSString *)self->_privateEmail copy];
  id v16 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v15;

  uint64_t v17 = [(NSString *)self->_appStoreAdamID copy];
  v18 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v17;

  uint64_t v19 = [(NSString *)self->_localizedAppDeveloperName copy];
  int64_t v20 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v19;

  uint64_t v21 = [(NSString *)self->_privacyPolicyURL copy];
  objc_super v22 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v21;

  *(unsigned char *)(v4 + 8) = self->_hasEULA;
  uint64_t v23 = [(AKSignInWithAppleAccountShareInfo *)self->_shareInfo copy];
  v24 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v23;

  return (id)v4;
}

- (NSString)appStoreURL
{
  appStoreAdamID = self->_appStoreAdamID;
  if (appStoreAdamID)
  {
    v3 = [NSString stringWithFormat:@"itms-apps://apps.apple.com/app/%@", appStoreAdamID];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p {\n\tclientID: %@, \n\tteamID: %@, \n\tlocalizedAppName: %@, \n\tlocalizedAppDeveloperName: %@, \n\tshareInfo: %@, \n}>", v5, self, self->_clientID, self->_teamID, self->_localizedAppName, self->_localizedAppDeveloperName, self->_shareInfo];

  return v6;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setLocalizedAppName:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)sharedScopes
{
  return self->_sharedScopes;
}

- (void)setSharedScopes:(int64_t)a3
{
  self->_sharedScopes = a3;
}

- (NSString)privateEmail
{
  return self->_privateEmail;
}

- (void)setPrivateEmail:(id)a3
{
}

- (NSString)localizedAppDeveloperName
{
  return self->_localizedAppDeveloperName;
}

- (void)setLocalizedAppDeveloperName:(id)a3
{
}

- (NSString)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (void)setPrivacyPolicyURL:(id)a3
{
}

- (BOOL)hasEULA
{
  return self->_hasEULA;
}

- (void)setHasEULA:(BOOL)a3
{
  self->_hasEULA = a3;
}

- (NSString)userID
{
  return self->_userID;
}

- (AKSignInWithAppleAccountShareInfo)shareInfo
{
  return self->_shareInfo;
}

- (void)setShareInfo:(id)a3
{
}

- (NSString)appStoreAdamID
{
  return self->_appStoreAdamID;
}

- (void)setAppStoreAdamID:(id)a3
{
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_appStoreAdamID, 0);
  objc_storeStrong((id *)&self->_shareInfo, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_localizedAppDeveloperName, 0);
  objc_storeStrong((id *)&self->_privateEmail, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

@end