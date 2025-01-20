@interface AKAuthorizationUpgradeContext
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationUpgradeContext)initWithCoder:(id)a3;
- (NSString)appID;
- (NSString)appName;
- (NSString)bundleID;
- (NSString)nonce;
- (NSString)serviceID;
- (NSString)state;
- (NSString)teamID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppID:(id)a3;
- (void)setAppName:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setNonce:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setState:(id)a3;
- (void)setTeamID:(id)a3;
@end

@implementation AKAuthorizationUpgradeContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  appID = self->_appID;
  id v5 = a3;
  [v5 encodeObject:appID forKey:@"_appID"];
  [v5 encodeObject:self->_appName forKey:@"_appName"];
  [v5 encodeObject:self->_bundleID forKey:@"_bundleID"];
  [v5 encodeObject:self->_nonce forKey:@"_nonce"];
  [v5 encodeObject:self->_serviceID forKey:@"_serviceID"];
  [v5 encodeObject:self->_state forKey:@"_state"];
  [v5 encodeObject:self->_teamID forKey:@"_teamID"];
}

- (AKAuthorizationUpgradeContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AKAuthorizationUpgradeContext;
  id v5 = [(AKAuthorizationUpgradeContext *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appID"];
    appID = v5->_appID;
    v5->_appID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_appName"];
    appName = v5->_appName;
    v5->_appName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceID"];
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_state"];
    state = v5->_state;
    v5->_state = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_teamID"];
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v18;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AKAuthorizationUpgradeContext);
  uint64_t v5 = [(NSString *)self->_appID copy];
  appID = v4->_appID;
  v4->_appID = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_appName copy];
  appName = v4->_appName;
  v4->_appName = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_bundleID copy];
  bundleID = v4->_bundleID;
  v4->_bundleID = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_nonce copy];
  nonce = v4->_nonce;
  v4->_nonce = (NSString *)v11;

  uint64_t v13 = [(NSString *)self->_serviceID copy];
  serviceID = v4->_serviceID;
  v4->_serviceID = (NSString *)v13;

  uint64_t v15 = [(NSString *)self->_state copy];
  state = v4->_state;
  v4->_state = (NSString *)v15;

  uint64_t v17 = [(NSString *)self->_teamID copy];
  teamID = v4->_teamID;
  v4->_teamID = (NSString *)v17;

  return v4;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appID, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

@end