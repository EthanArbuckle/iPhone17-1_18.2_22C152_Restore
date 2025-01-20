@interface AKPrivateEmailContext
+ (BOOL)supportsSecureCoding;
- (AKPrivateEmailContext)initWithCoder:(id)a3;
- (AKPrivateEmailContext)initWithContext:(id)a3 bundleID:(id)a4;
- (AKPrivateEmailContext)initWithContext:(id)a3 client:(id)a4;
- (AKPrivateEmailContext)initWithKey:(id)a3;
- (AKPrivateEmailContext)initWithKey:(id)a3 altDSID:(id)a4;
- (AKPrivateEmailContext)initWithKey:(id)a3 altDSID:(id)a4 clientAppBundleId:(id)a5;
- (AKPrivateEmailContext)initWithKey:(id)a3 altDSID:(id)a4 originType:(id)a5 originIdentifier:(id)a6;
- (BOOL)keyAndBundleIdAreHashed;
- (NSString)altDSID;
- (NSString)clientAppBundleId;
- (NSString)key;
- (NSString)metadataString;
- (NSString)originIdentifier;
- (NSString)originType;
- (NSString)proxiedAppID;
- (NSString)proxiedAppName;
- (NSString)proxiedBundleIdentifier;
- (NSString)upgradeBundleIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)sanitiseInternalState;
- (void)setClientAppBundleId:(id)a3;
- (void)setKeyAndBundleIdAreHashed:(BOOL)a3;
- (void)setMetadataString:(id)a3;
- (void)setProxiedAppID:(id)a3;
- (void)setProxiedAppName:(id)a3;
- (void)setProxiedBundleIdentifier:(id)a3;
@end

@implementation AKPrivateEmailContext

- (AKPrivateEmailContext)initWithKey:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKPrivateEmailContext;
  v6 = [(AKPrivateEmailContext *)&v8 init];
  if (v6 == self) {
    objc_storeStrong((id *)&self->_key, a3);
  }

  return v6;
}

- (AKPrivateEmailContext)initWithKey:(id)a3 altDSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKPrivateEmailContext;
  v9 = [(AKPrivateEmailContext *)&v11 init];
  if (v9 == self)
  {
    objc_storeStrong((id *)&self->_key, a3);
    objc_storeStrong((id *)&self->_altDSID, a4);
  }

  return v9;
}

- (AKPrivateEmailContext)initWithKey:(id)a3 altDSID:(id)a4 clientAppBundleId:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AKPrivateEmailContext;
  v12 = [(AKPrivateEmailContext *)&v15 init];
  if (v12 == self)
  {
    objc_storeStrong((id *)&self->_key, a3);
    objc_storeStrong((id *)&self->_altDSID, a4);
    objc_storeStrong((id *)&self->_clientAppBundleId, a5);
    originType = self->_originType;
    self->_originType = (NSString *)@"ThirdPartyApp";

    objc_storeStrong((id *)&self->_originIdentifier, a5);
  }

  return v12;
}

- (AKPrivateEmailContext)initWithKey:(id)a3 altDSID:(id)a4 originType:(id)a5 originIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AKPrivateEmailContext;
  objc_super v15 = [(AKPrivateEmailContext *)&v17 init];
  if (v15 == self)
  {
    objc_storeStrong((id *)&self->_key, a3);
    objc_storeStrong((id *)&self->_altDSID, a4);
    objc_storeStrong((id *)&self->_originType, a5);
    objc_storeStrong((id *)&self->_originIdentifier, a6);
  }

  return v15;
}

- (AKPrivateEmailContext)initWithContext:(id)a3 client:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 upgradeBundleIdentifier];

  if (v8) {
    [v7 upgradeBundleIdentifier];
  }
  else {
  id v9 = [v6 bundleID];
  }
  id v10 = [(AKPrivateEmailContext *)self initWithContext:v7 bundleID:v9];

  return v10;
}

- (AKPrivateEmailContext)initWithContext:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AKPrivateEmailContext;
  id v8 = [(AKPrivateEmailContext *)&v28 init];
  if (v8)
  {
    uint64_t v9 = [v6 key];
    key = v8->_key;
    v8->_key = (NSString *)v9;

    uint64_t v11 = [v6 altDSID];
    altDSID = v8->_altDSID;
    v8->_altDSID = (NSString *)v11;

    uint64_t v13 = [v6 clientAppBundleId];
    clientAppBundleId = v8->_clientAppBundleId;
    v8->_clientAppBundleId = (NSString *)v13;

    uint64_t v15 = [v6 proxiedAppID];
    proxiedAppID = v8->_proxiedAppID;
    v8->_proxiedAppID = (NSString *)v15;

    uint64_t v17 = [v6 proxiedAppName];
    proxiedAppName = v8->_proxiedAppName;
    v8->_proxiedAppName = (NSString *)v17;

    uint64_t v19 = [v6 proxiedBundleIdentifier];
    proxiedBundleIdentifier = v8->_proxiedBundleIdentifier;
    v8->_proxiedBundleIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v8->_upgradeBundleIdentifier, a4);
    uint64_t v21 = [v6 originType];
    originType = v8->_originType;
    v8->_originType = (NSString *)v21;

    uint64_t v23 = [v6 originIdentifier];
    originIdentifier = v8->_originIdentifier;
    v8->_originIdentifier = (NSString *)v23;

    uint64_t v25 = [v6 metadataString];
    metadataString = v8->_metadataString;
    v8->_metadataString = (NSString *)v25;
  }
  return v8;
}

- (void)sanitiseInternalState
{
  v3 = [(NSString *)self->_key lowercaseString];
  key = self->_key;
  self->_key = v3;

  id v5 = [(NSString *)self->_metadataString lowercaseString];
  metadataString = self->_metadataString;
  self->_metadataString = v5;

  self->_originIdentifier = [(NSString *)self->_originIdentifier lowercaseString];

  MEMORY[0x1F41817F8]();
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"HmeContext:{%@:%@:%@}", self->_altDSID, self->_key, self->_clientAppBundleId];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"contextKey"];
  [v5 encodeObject:self->_altDSID forKey:@"contextAltDSID"];
  [v5 encodeObject:self->_proxiedAppID forKey:@"contextProxiedApp"];
  [v5 encodeObject:self->_proxiedBundleIdentifier forKey:@"contextBundleID"];
  [v5 encodeObject:self->_proxiedAppName forKey:@"contextAppName"];
  [v5 encodeObject:self->_upgradeBundleIdentifier forKey:@"upgradeBundleID"];
  [v5 encodeObject:self->_clientAppBundleId forKey:@"privateEmailClientBundle"];
  [v5 encodeObject:self->_originType forKey:@"originType"];
  [v5 encodeObject:self->_originIdentifier forKey:@"originIdentifier"];
  [v5 encodeObject:self->_metadataString forKey:@"metadataString"];
}

- (AKPrivateEmailContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AKPrivateEmailContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextAltDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextKey"];
    key = v5->_key;
    v5->_key = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextProxiedApp"];
    proxiedAppID = v5->_proxiedAppID;
    v5->_proxiedAppID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextBundleID"];
    proxiedBundleIdentifier = v5->_proxiedBundleIdentifier;
    v5->_proxiedBundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextAppName"];
    proxiedAppName = v5->_proxiedAppName;
    v5->_proxiedAppName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"upgradeBundleID"];
    upgradeBundleIdentifier = v5->_upgradeBundleIdentifier;
    v5->_upgradeBundleIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateEmailClientBundle"];
    clientAppBundleId = v5->_clientAppBundleId;
    v5->_clientAppBundleId = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originType"];
    originType = v5->_originType;
    v5->_originType = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originIdentifier"];
    originIdentifier = v5->_originIdentifier;
    v5->_originIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataString"];
    metadataString = v5->_metadataString;
    v5->_metadataString = (NSString *)v24;
  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)proxiedAppID
{
  return self->_proxiedAppID;
}

- (void)setProxiedAppID:(id)a3
{
}

- (NSString)proxiedBundleIdentifier
{
  return self->_proxiedBundleIdentifier;
}

- (void)setProxiedBundleIdentifier:(id)a3
{
}

- (NSString)proxiedAppName
{
  return self->_proxiedAppName;
}

- (void)setProxiedAppName:(id)a3
{
}

- (NSString)upgradeBundleIdentifier
{
  return self->_upgradeBundleIdentifier;
}

- (NSString)clientAppBundleId
{
  return self->_clientAppBundleId;
}

- (void)setClientAppBundleId:(id)a3
{
}

- (BOOL)keyAndBundleIdAreHashed
{
  return self->_keyAndBundleIdAreHashed;
}

- (void)setKeyAndBundleIdAreHashed:(BOOL)a3
{
  self->_keyAndBundleIdAreHashed = a3;
}

- (NSString)originType
{
  return self->_originType;
}

- (NSString)originIdentifier
{
  return self->_originIdentifier;
}

- (NSString)metadataString
{
  return self->_metadataString;
}

- (void)setMetadataString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataString, 0);
  objc_storeStrong((id *)&self->_originIdentifier, 0);
  objc_storeStrong((id *)&self->_originType, 0);
  objc_storeStrong((id *)&self->_clientAppBundleId, 0);
  objc_storeStrong((id *)&self->_upgradeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppName, 0);
  objc_storeStrong((id *)&self->_proxiedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_proxiedAppID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end