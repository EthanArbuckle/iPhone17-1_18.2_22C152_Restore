@interface ACAccountCredential
+ (ACAccountCredential)credentialWithOAuthToken:(id)a3 tokenSecret:(id)a4;
+ (ACAccountCredential)credentialWithPassword:(id)a3;
+ (BOOL)credentialPolicyIsMixedForAccountTypeIdentifier:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (NSSet)allSupportedKeys;
+ (id)additionalServiceSegmentForAccountTypeIdentifier:(id)a3;
+ (id)credentialPolicyForAccountTypeIdentifier:(id)a3 key:(id)a4 clientID:(id)a5;
+ (id)nonPersistentKeysForAccountTypeIdentifier:(id)a3 credentialType:(id)a4;
+ (id)supportedKeysForAccountTypeIdentifier:(id)a3 credentialType:(id)a4;
- (ACAccountCredential)init;
- (ACAccountCredential)initWithCoder:(id)a3;
- (ACAccountCredential)initWithOAuth2Token:(NSString *)token refreshToken:(NSString *)refreshToken expiryDate:(NSDate *)expiryDate;
- (ACAccountCredential)initWithOAuthToken:(NSString *)token tokenSecret:(NSString *)secret;
- (ACAccountCredential)initWithPassword:(id)a3;
- (BOOL)isDirty;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresTouchID;
- (NSDate)expiryDate;
- (NSDate)tokenExpiryDate;
- (NSSet)dirtyProperties;
- (NSString)credentialType;
- (NSString)description;
- (NSString)findMyiPhoneToken;
- (NSString)hsaToken;
- (NSString)mapsToken;
- (NSString)mdmServerToken;
- (NSString)oauthRefreshToken;
- (NSString)oauthToken;
- (NSString)oauthTokenNoSync;
- (NSString)oauthTokenSecret;
- (NSString)password;
- (NSString)token;
- (id)_encodeProtobuf;
- (id)_encodeProtobufData;
- (id)_initWithProtobuf:(id)a3;
- (id)_initWithProtobufData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credentialItemForKey:(id)a3;
- (id)credentialItems;
- (id)keysForCredentialItems;
- (unint64_t)hash;
- (void)_clearDirtyProperties;
- (void)_markPropertyDirty:(id)a3;
- (void)_setOwningAccount:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentialItem:(id)a3 forKey:(id)a4;
- (void)setCredentialType:(id)a3;
- (void)setDirty:(BOOL)a3;
- (void)setEmpty:(BOOL)a3;
- (void)setExpiryDate:(id)a3;
- (void)setFindMyiPhoneToken:(id)a3;
- (void)setHsaToken:(id)a3;
- (void)setMapsToken:(id)a3;
- (void)setMdmServerToken:(id)a3;
- (void)setOauthRefreshToken:(id)a3;
- (void)setOauthToken:(NSString *)oauthToken;
- (void)setOauthTokenNoSync:(id)a3;
- (void)setOauthTokenSecret:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRequiresTouchID:(BOOL)a3;
- (void)setToken:(id)a3;
- (void)setTokenExpiryDate:(id)a3;
@end

@implementation ACAccountCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ACAccountCredential *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      credentialType = self->_credentialType;
      uint64_t v7 = [(ACAccountCredential *)v5 credentialType];
      if (credentialType == (NSString *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_credentialType;
        v10 = [(ACAccountCredential *)v5 credentialType];
        LODWORD(v9) = [(NSString *)v9 isEqual:v10];

        if (!v9)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      credentialItems = self->_credentialItems;
      uint64_t v13 = [(ACAccountCredential *)v5 credentialItems];
      if (credentialItems == (NSDictionary *)v13)
      {
        char v11 = 1;
      }
      else
      {
        v14 = (NSDictionary *)v13;
        v15 = self->_credentialItems;
        v16 = [(ACAccountCredential *)v5 credentialItems];
        char v11 = [(NSDictionary *)v15 isEqual:v16];

        credentialItems = v14;
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)ACAccountCredential;
  id v3 = [(ACAccountCredential *)&v6 hash];
  uint64_t v4 = [(NSDictionary *)self->_credentialItems hash];
  return (unint64_t)v3 + v4 + [(NSString *)self->_credentialType hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDictionary *)self->_credentialItems copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_credentialType copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSMutableSet *)self->_dirtyProperties mutableCopyWithZone:a3];
  char v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  *(unsigned char *)(v5 + 40) = self->_requiresTouchID;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningAccount);
  objc_storeWeak((id *)(v5 + 32), WeakRetained);

  return (id)v5;
}

- (ACAccountCredential)initWithOAuth2Token:(NSString *)token refreshToken:(NSString *)refreshToken expiryDate:(NSDate *)expiryDate
{
  uint64_t v8 = token;
  v9 = refreshToken;
  uint64_t v10 = expiryDate;
  v17.receiver = self;
  v17.super_class = (Class)ACAccountCredential;
  char v11 = [(ACAccountCredential *)&v17 init];
  v12 = v11;
  if (v11)
  {
    credentialItems = v11->_credentialItems;
    v11->_credentialItems = (NSDictionary *)MEMORY[0x1E4F1CC08];

    [(ACAccountCredential *)v12 setOauthToken:v8];
    [(ACAccountCredential *)v12 setOauthRefreshToken:v9];
    [(ACAccountCredential *)v12 setExpiryDate:v10];
    uint64_t v14 = [@"oauth2" copy];
    credentialType = v12->_credentialType;
    v12->_credentialType = (NSString *)v14;
  }
  return v12;
}

- (ACAccountCredential)initWithOAuthToken:(NSString *)token tokenSecret:(NSString *)secret
{
  uint64_t v6 = token;
  uint64_t v7 = secret;
  v14.receiver = self;
  v14.super_class = (Class)ACAccountCredential;
  uint64_t v8 = [(ACAccountCredential *)&v14 init];
  v9 = v8;
  if (v8)
  {
    credentialItems = v8->_credentialItems;
    v8->_credentialItems = (NSDictionary *)MEMORY[0x1E4F1CC08];

    [(ACAccountCredential *)v9 setOauthToken:v6];
    [(ACAccountCredential *)v9 setOauthTokenSecret:v7];
    uint64_t v11 = [@"oauth" copy];
    credentialType = v9->_credentialType;
    v9->_credentialType = (NSString *)v11;
  }
  return v9;
}

- (ACAccountCredential)initWithPassword:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACAccountCredential;
  uint64_t v5 = [(ACAccountCredential *)&v11 init];
  uint64_t v6 = v5;
  if (v5)
  {
    credentialItems = v5->_credentialItems;
    v5->_credentialItems = (NSDictionary *)MEMORY[0x1E4F1CC08];

    [(ACAccountCredential *)v6 setPassword:v4];
    uint64_t v8 = [@"password" copy];
    credentialType = v6->_credentialType;
    v6->_credentialType = (NSString *)v8;
  }
  return v6;
}

- (NSString)description
{
  id v3 = NSString;
  credentialType = self->_credentialType;
  uint64_t v5 = [(NSDictionary *)self->_credentialItems allKeys];
  uint64_t v6 = [v5 componentsJoinedByString:@","];
  uint64_t v7 = [v3 stringWithFormat:@"<ACAccountCredential:'%@'-(%@)(TouchID:%d)>", credentialType, v6, self->_requiresTouchID];

  return (NSString *)v7;
}

+ (ACAccountCredential)credentialWithOAuthToken:(id)a3 tokenSecret:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOAuthToken:v6 tokenSecret:v5];

  return (ACAccountCredential *)v7;
}

+ (ACAccountCredential)credentialWithPassword:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPassword:v3];

  return (ACAccountCredential *)v4;
}

+ (NSSet)allSupportedKeys
{
  if (allSupportedKeys_onceToken != -1) {
    dispatch_once(&allSupportedKeys_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)allSupportedKeys_keys;

  return (NSSet *)v2;
}

void __39__ACAccountCredential_allSupportedKeys__block_invoke()
{
  v4[36] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"oauth-token";
  v4[1] = @"oauth-token-secret";
  v4[2] = @"oath-refresh-token";
  v4[3] = @"oauth-expiry-date";
  v4[4] = @"password";
  v4[5] = @"purpose";
  v4[6] = @"token";
  v4[7] = @"oauth-token-nosync";
  v4[8] = @"oauth-graphAPI-token";
  v4[9] = @"rpassword";
  v4[10] = @"old-password";
  v4[11] = @"find-my-iphone-token";
  v4[12] = @"find-my-iphone-app-token";
  v4[13] = @"find-my-iphone-siri-token";
  v4[14] = @"maps-token";
  v4[15] = @"hsa-token";
  v4[16] = @"find-my-friends-token";
  v4[17] = @"find-my-friends-app-token";
  v4[18] = @"token-expiry-date";
  v4[19] = @"heartbeat-token";
  v4[20] = @"heartbeat-token-creation";
  v4[21] = @"continuation-key";
  v4[22] = @"continuation-key-creation";
  v4[23] = @"password-reset-token";
  v4[24] = @"password-reset-token-creation";
  v4[25] = @"password-reset-token-backup";
  v4[26] = @"yahoo-xympki-token";
  v4[27] = @"yahoo-xympki-cookie-y";
  v4[28] = @"yahoo-xympki-cookie-t";
  v4[29] = @"yahoo-xympki-cookie-crumb";
  v4[30] = @"tencent-weibo-client-consumer-key";
  v4[31] = @"container-user-id";
  v4[32] = @"cloudkit-token";
  v4[33] = @"mdm-server-token";
  v4[34] = @"search-party-token";
  v4[35] = @"key-transparency-token";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:36];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)allSupportedKeys_keys;
  allSupportedKeys_keys = v2;
}

+ (id)supportedKeysForAccountTypeIdentifier:(id)a3 credentialType:(id)a4
{
  v39[8] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"com.apple.account.idms"])
  {
    v39[0] = @"token";
    v39[1] = @"heartbeat-token";
    v39[2] = @"heartbeat-token-creation";
    v39[3] = @"continuation-key";
    v39[4] = @"continuation-key-creation";
    v39[5] = @"password-reset-token";
    v39[6] = @"password-reset-token-creation";
    v39[7] = @"password-reset-token-backup";
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:8];
LABEL_15:
    uint64_t v13 = (void *)v7;
    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"com.apple.account.FaceTime"]
    || [v5 isEqualToString:@"com.apple.account.Madrid"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v9 = @"password";
LABEL_6:
    v22 = v9;
    v23 = 0;
LABEL_12:
    v12 = @"token";
LABEL_13:
    objc_msgSend(v8, "arrayWithObjects:", v12, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
    uint64_t v7 = LABEL_14:;
    goto LABEL_15;
  }
  if ([v5 isEqualToString:@"com.apple.account.GameCenter"]
    || [v5 isEqualToString:@"com.apple.account.IdentityServices"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v24 = 0;
LABEL_10:
    uint64_t v10 = @"rpassword";
    objc_super v11 = @"password";
LABEL_11:
    v22 = v11;
    v23 = v10;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:@"com.apple.account.DeviceLocator"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v24 = 0;
    uint64_t v10 = @"find-my-iphone-siri-token";
    objc_super v11 = @"find-my-iphone-app-token";
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"com.apple.account.FindMyFriends"])
  {
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"find-my-friends-app-token", @"find-my-friends-token", 0, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
    goto LABEL_14;
  }
  if ([v5 isEqualToString:@"com.apple.account.AppleAccount"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v35 = @"key-transparency-token";
    uint64_t v36 = 0;
    v33 = @"find-my-iphone-siri-token";
    v34 = @"search-party-token";
    v31 = @"find-my-friends-app-token";
    v32 = @"mdm-server-token";
    v29 = @"cloudkit-token";
    v30 = @"find-my-friends-token";
    v27 = @"maps-token";
    v28 = @"hsa-token";
    v25 = @"find-my-iphone-token";
    v26 = @"find-my-iphone-app-token";
    v24 = @"old-password";
    goto LABEL_10;
  }
  if (([v5 isEqualToString:@"com.apple.account.iTunesStore"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.account.iTunesStore.sandbox"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v22 = @"rpassword";
    v23 = 0;
LABEL_28:
    v12 = @"password";
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"com.apple.account.tencentweibo"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v26 = @"oauth-token-nosync";
    v27 = 0;
    v15 = @"tencent-weibo-client-consumer-key";
LABEL_31:
    v24 = @"purpose";
    v25 = v15;
    v16 = @"oauth-expiry-date";
LABEL_35:
    objc_super v17 = @"oath-refresh-token";
LABEL_36:
    v22 = v17;
    v23 = v16;
LABEL_37:
    v12 = @"oauth-token";
    goto LABEL_13;
  }
  if ([v5 isEqualToString:@"com.apple.account.Google"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v25 = @"oauth-token-nosync";
    v26 = 0;
    v24 = @"oauth-expiry-date";
LABEL_34:
    v16 = @"password";
    goto LABEL_35;
  }
  if ([v5 isEqualToString:@"com.apple.account.Yahoo"])
  {
    v18 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"oauth-token", @"oath-refresh-token", @"oauth-token-nosync", @"password", @"oauth-expiry-date", 0);
    v38[0] = @"yahoo-xympki-token";
    v38[1] = @"yahoo-xympki-cookie-y";
    v38[2] = @"yahoo-xympki-cookie-t";
    v38[3] = @"yahoo-xympki-cookie-crumb";
    v19 = (void *)MEMORY[0x1E4F1C978];
    v20 = v38;
LABEL_42:
    v21 = [v19 arrayWithObjects:v20 count:4];
    uint64_t v13 = [v18 arrayByAddingObjectsFromArray:v21];

    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"com.apple.account.aol"])
  {
    v18 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"oauth-token", @"oath-refresh-token", @"oauth-token-nosync", @"password", @"oauth-expiry-date", 0);
    v37[0] = @"yahoo-xympki-token";
    v37[1] = @"yahoo-xympki-cookie-y";
    v37[2] = @"yahoo-xympki-cookie-t";
    v37[3] = @"yahoo-xympki-cookie-crumb";
    v19 = (void *)MEMORY[0x1E4F1C978];
    v20 = v37;
    goto LABEL_42;
  }
  if ([v5 isEqualToString:@"com.apple.account.Hotmail"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v24 = @"oauth-graphAPI-token";
    v25 = 0;
    goto LABEL_34;
  }
  if ([v5 isEqualToString:@"com.apple.account.Exchange"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v27 = @"oauth-graphAPI-token";
    v28 = 0;
    v26 = @"password";
LABEL_47:
    v15 = @"oauth-token-nosync";
    goto LABEL_31;
  }
  if ([v6 isEqualToString:@"oauth"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v24 = 0;
    v16 = @"oauth-token-nosync";
    objc_super v17 = @"oauth-token-secret";
    goto LABEL_36;
  }
  if ([v6 isEqualToString:@"password"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v22 = 0;
    goto LABEL_28;
  }
  if ([v6 isEqualToString:@"oauth2"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v26 = 0;
    goto LABEL_47;
  }
  if ([v6 isEqualToString:@"Kerberos"]) {
    goto LABEL_58;
  }
  if ([v6 isEqualToString:@"yahoo-xympki-tokens"])
  {
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"yahoo-xympki-token", @"yahoo-xympki-cookie-y", @"yahoo-xympki-cookie-t", @"yahoo-xympki-cookie-crumb", 0, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
    goto LABEL_14;
  }
  if ([v6 isEqualToString:@"token"])
  {
LABEL_58:
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v22 = 0;
    goto LABEL_12;
  }
  if ([v6 isEqualToString:@"hybrid"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v25 = @"password";
    v26 = 0;
    v23 = @"token";
    v24 = @"oath-refresh-token";
    v22 = @"oauth-token-secret";
    goto LABEL_37;
  }
  if ([v6 isEqualToString:@"appleid-authentication"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    v9 = @"token-expiry-date";
    goto LABEL_6;
  }
  uint64_t v13 = 0;
LABEL_16:

  return v13;
}

+ (id)nonPersistentKeysForAccountTypeIdentifier:(id)a3 credentialType:(id)a4
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.account.FaceTime"]
    || [v4 isEqualToString:@"com.apple.account.Madrid"])
  {
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"password", 0, v7, v8, v9, v10);
    id v5 = LABEL_11:;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"com.apple.account.IdentityServices"]
    || [v4 isEqualToString:@"com.apple.account.GameCenter"])
  {
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"com.apple.account.AppleAccount"])
  {
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"password", @"rpassword", @"old-password", @"find-my-iphone-token", @"hsa-token", 0);
    goto LABEL_11;
  }
  if (([v4 isEqualToString:@"com.apple.account.iTunesStore"] & 1) != 0
    || [v4 isEqualToString:@"com.apple.account.iTunesStore.sandbox"])
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"password", @"rpassword", 0, v8, v9, v10);
    goto LABEL_11;
  }
  id v5 = 0;
LABEL_12:

  return v5;
}

- (ACAccountCredential)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACAccountCredential;
  uint64_t v2 = [(ACAccountCredential *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    credentialItems = v2->_credentialItems;
    v2->_credentialItems = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v3;
}

- (ACAccountCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ACAccountCredential;
  id v5 = [(ACAccountCredential *)&v23 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"credentialItems"];
    uint64_t v11 = [v10 copy];
    credentialItems = v5->_credentialItems;
    v5->_credentialItems = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialType"];
    uint64_t v14 = [v13 copy];
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"dirtyProperties"];
    dirtyProperties = v5->_dirtyProperties;
    v5->_dirtyProperties = (NSMutableSet *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requiresTouchID"];
    v5->_requiresTouchID = [v21 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  credentialItems = self->_credentialItems;
  id v5 = a3;
  [v5 encodeObject:credentialItems forKey:@"credentialItems"];
  [v5 encodeObject:self->_credentialType forKey:@"credentialType"];
  [v5 encodeObject:self->_dirtyProperties forKey:@"dirtyProperties"];
  id v6 = [NSNumber numberWithBool:self->_requiresTouchID];
  [v5 encodeObject:v6 forKey:@"_requiresTouchID"];
}

- (id)_initWithProtobuf:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ACAccountCredential *)self init];
  if (v5)
  {
    id v31 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 credentialType];
    uint64_t v8 = [v7 copy];
    credentialType = v5->_credentialType;
    v5->_credentialType = (NSString *)v8;

    v5->_requiresTouchID = [v6 requiresTouchID];
    uint64_t v10 = [v6 dirtyProperties];

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1CA80]);
      v12 = [v6 dirtyProperties];
      uint64_t v13 = [v11 initWithArray:v12];
      dirtyProperties = v5->_dirtyProperties;
      v5->_dirtyProperties = (NSMutableSet *)v13;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v16 = [v6 credentialItems];
    uint64_t v17 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v18 = [v6 credentialItems];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          objc_super v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v24 = [v23 value];
          v25 = +[ACZeroingString stringWithString:v24];
          v26 = [v23 key];
          [v17 setObject:v25 forKeyedSubscript:v26];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v20);
    }

    uint64_t v27 = [v17 copy];
    credentialItems = v5->_credentialItems;
    v5->_credentialItems = (NSDictionary *)v27;

    v29 = v5;
    id v4 = v31;
  }

  return v5;
}

- (id)_initWithProtobufData:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"ACAccountCredential.m", 358, @"Invalid parameter not satisfying: %@", @"data.length != 0" object file lineNumber description];
  }
  if ([v5 length])
  {
    id v6 = [[ACProtobufAccountCredential alloc] initWithData:v5];
    if (v6)
    {
      self = (ACAccountCredential *)[(ACAccountCredential *)self _initWithProtobuf:v6];
      uint64_t v7 = self;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_encodeProtobuf
{
  id v3 = objc_opt_new();
  [v3 setCredentialType:self->_credentialType];
  [v3 setRequiresTouchID:self->_requiresTouchID];
  id v4 = [(NSMutableSet *)self->_dirtyProperties allObjects];
  id v5 = (void *)[v4 mutableCopy];
  [v3 setDirtyProperties:v5];

  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSDictionary count](self->_credentialItems, "count"));
  credentialItems = self->_credentialItems;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__ACAccountCredential__encodeProtobuf__block_invoke;
  v10[3] = &unk_1E5BCE8C0;
  id v11 = v6;
  id v8 = v6;
  [(NSDictionary *)credentialItems enumerateKeysAndObjectsUsingBlock:v10];
  [v3 setCredentialItems:v8];

  return v3;
}

void __38__ACAccountCredential__encodeProtobuf__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [[ACProtobufKeyValuePair alloc] initWithValue:v5 forKey:v6];

  [v4 addObject:v7];
}

- (id)_encodeProtobufData
{
  uint64_t v2 = [(ACAccountCredential *)self _encodeProtobuf];
  id v3 = [v2 data];

  return v3;
}

- (void)_setOwningAccount:(id)a3
{
}

- (BOOL)isDirty
{
  return [(NSMutableSet *)self->_dirtyProperties count] != 0;
}

- (BOOL)isEmpty
{
  return [(NSDictionary *)self->_credentialItems count] == 0;
}

- (NSSet)dirtyProperties
{
  uint64_t v2 = (void *)[(NSMutableSet *)self->_dirtyProperties copy];

  return (NSSet *)v2;
}

- (void)_markPropertyDirty:(id)a3
{
  id v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  id v11 = v4;
  if (!dirtyProperties)
  {
    id v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    uint64_t v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    id v4 = v11;
    dirtyProperties = self->_dirtyProperties;
  }
  [(NSMutableSet *)dirtyProperties addObject:v4];
  p_owningAccount = &self->_owningAccount;
  id WeakRetained = objc_loadWeakRetained((id *)p_owningAccount);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)p_owningAccount);
    [v10 _markCredentialDirty];
  }
}

- (void)_clearDirtyProperties
{
  self->_dirtyProperties = 0;
  MEMORY[0x1F41817F8]();
}

- (id)credentialItems
{
  return self->_credentialItems;
}

- (id)keysForCredentialItems
{
  return [(NSDictionary *)self->_credentialItems allKeys];
}

- (id)credentialItemForKey:(id)a3
{
  id v3 = [(NSDictionary *)self->_credentialItems objectForKey:a3];
  if (v3) {
    id v4 = (void *)[NSString _newZStringWithString:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)setCredentialItem:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id v8 = (void *)[(NSDictionary *)v7->_credentialItems mutableCopy];
  if (v12)
  {
    uint64_t v9 = [[ACZeroingString alloc] initWithString:v12];
    [v8 setObject:v9 forKey:v6];
  }
  else
  {
    [v8 removeObjectForKey:v6];
  }
  uint64_t v10 = [v8 copy];
  credentialItems = v7->_credentialItems;
  v7->_credentialItems = (NSDictionary *)v10;

  objc_sync_exit(v7);
  [(ACAccountCredential *)v7 _markPropertyDirty:@"credentialItems"];
}

- (NSString)token
{
  return (NSString *)[(ACAccountCredential *)self credentialItemForKey:@"token"];
}

- (void)setToken:(id)a3
{
}

- (NSString)oauthToken
{
  return (NSString *)[(ACAccountCredential *)self credentialItemForKey:@"oauth-token"];
}

- (void)setOauthToken:(NSString *)oauthToken
{
}

- (NSString)oauthTokenSecret
{
  return (NSString *)[(ACAccountCredential *)self credentialItemForKey:@"oauth-token-secret"];
}

- (void)setOauthTokenSecret:(id)a3
{
}

- (NSString)oauthTokenNoSync
{
  return (NSString *)[(ACAccountCredential *)self credentialItemForKey:@"oauth-token-nosync"];
}

- (void)setOauthTokenNoSync:(id)a3
{
}

- (NSString)oauthRefreshToken
{
  return (NSString *)[(ACAccountCredential *)self credentialItemForKey:@"oath-refresh-token"];
}

- (void)setOauthRefreshToken:(id)a3
{
}

- (NSDate)expiryDate
{
  uint64_t v2 = [(ACAccountCredential *)self credentialItemForKey:@"oauth-expiry-date"];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    id v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setExpiryDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(NSString, "stringWithFormat:", @"%f", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ACAccountCredential *)self setCredentialItem:v5 forKey:@"oauth-expiry-date"];
}

- (NSString)password
{
  return (NSString *)[(ACAccountCredential *)self credentialItemForKey:@"password"];
}

- (void)setPassword:(id)a3
{
}

- (NSString)findMyiPhoneToken
{
  return (NSString *)[(ACAccountCredential *)self credentialItemForKey:@"find-my-iphone-token"];
}

- (void)setFindMyiPhoneToken:(id)a3
{
}

- (NSString)mapsToken
{
  return (NSString *)[(ACAccountCredential *)self credentialItemForKey:@"maps-token"];
}

- (void)setMapsToken:(id)a3
{
}

- (NSString)hsaToken
{
  return (NSString *)[(ACAccountCredential *)self credentialItemForKey:@"hsa-token"];
}

- (void)setHsaToken:(id)a3
{
}

- (NSString)mdmServerToken
{
  return (NSString *)[(ACAccountCredential *)self credentialItemForKey:@"mdm-server-token"];
}

- (void)setMdmServerToken:(id)a3
{
}

- (NSDate)tokenExpiryDate
{
  uint64_t v2 = [(ACAccountCredential *)self credentialItemForKey:@"token-expiry-date"];
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setTokenExpiryDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  objc_msgSend(NSString, "stringWithFormat:", @"%f", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ACAccountCredential *)self setCredentialItem:v5 forKey:@"token-expiry-date"];
}

- (NSString)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  credentialType = self->_credentialType;
  self->_credentialType = v4;

  [(ACAccountCredential *)self _markPropertyDirty:@"credentialType"];
}

+ (id)credentialPolicyForAccountTypeIdentifier:(id)a3 key:(id)a4 clientID:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 isEqualToString:@"com.apple.account.AppleIDAuthentication"];
  uint64_t v9 = (id *)MEMORY[0x1E4F3B570];
  uint64_t v10 = (id *)MEMORY[0x1E4F3B570];
  if (v8) {
    goto LABEL_13;
  }
  if ([v6 isEqualToString:@"com.apple.account.FindMyFriends"])
  {
    if ([v7 isEqualToString:@"find-my-friends-token"]) {
      goto LABEL_12;
    }
    if ([v7 isEqualToString:@"find-my-friends-app-token"])
    {
      uint64_t v10 = (id *)MEMORY[0x1E4F3B570];
      goto LABEL_13;
    }
  }
  if ([v6 isEqualToString:@"com.apple.account.DeviceLocator"])
  {
    char v11 = [v7 isEqualToString:@"find-my-iphone-siri-token"];
    uint64_t v10 = (id *)MEMORY[0x1E4F3B570];
    if ((v11 & 1) == 0 && ![v7 isEqualToString:@"find-my-iphone-app-token"]) {
      uint64_t v10 = (id *)MEMORY[0x1E4F3B588];
    }
    goto LABEL_13;
  }
  if ([v6 isEqualToString:@"com.apple.account.HolidayCalendar"])
  {
LABEL_12:
    uint64_t v10 = (id *)MEMORY[0x1E4F3B588];
    goto LABEL_13;
  }
  char v14 = [v6 isEqualToString:@"com.apple.account.Exchange"];
  uint64_t v10 = (id *)MEMORY[0x1E4F3B578];
  if ((v14 & 1) == 0 && ![v6 isEqualToString:@"com.apple.account.Hotmail"]) {
    uint64_t v10 = v9;
  }
LABEL_13:
  id v12 = *v10;

  return v12;
}

+ (BOOL)credentialPolicyIsMixedForAccountTypeIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.account.FindMyFriends"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"com.apple.account.DeviceLocator"];
  }

  return v4;
}

+ (id)additionalServiceSegmentForAccountTypeIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.account.Yahoo"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.twitter"] & 1) != 0
    || [v3 isEqualToString:@"com.apple.account.aol"])
  {
    char v4 = @"com.apple.iOS";
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)requiresTouchID
{
  return self->_requiresTouchID;
}

- (void)setRequiresTouchID:(BOOL)a3
{
  self->_requiresTouchID = a3;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void)setEmpty:(BOOL)a3
{
  self->_empty = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningAccount);
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);

  objc_storeStrong((id *)&self->_credentialItems, 0);
}

@end