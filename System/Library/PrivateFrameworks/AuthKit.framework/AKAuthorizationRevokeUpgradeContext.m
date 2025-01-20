@interface AKAuthorizationRevokeUpgradeContext
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationRevokeUpgradeContext)initWithCoder:(id)a3;
- (NSString)bundleID;
- (NSString)teamID;
- (NSString)transactionID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setTeamID:(id)a3;
- (void)setTransactionID:(id)a3;
@end

@implementation AKAuthorizationRevokeUpgradeContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  transactionID = self->_transactionID;
  id v5 = a3;
  [v5 encodeObject:transactionID forKey:@"_transactionID"];
  [v5 encodeObject:self->_bundleID forKey:@"_bundleID"];
  [v5 encodeObject:self->_teamID forKey:@"_teamID"];
}

- (AKAuthorizationRevokeUpgradeContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AKAuthorizationRevokeUpgradeContext;
  id v5 = [(AKAuthorizationRevokeUpgradeContext *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_transactionID"];
    transactionID = v5->_transactionID;
    v5->_transactionID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_teamID"];
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AKAuthorizationRevokeUpgradeContext);
  uint64_t v5 = [(NSString *)self->_transactionID copy];
  transactionID = v4->_transactionID;
  v4->_transactionID = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_bundleID copy];
  bundleID = v4->_bundleID;
  v4->_bundleID = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_teamID copy];
  teamID = v4->_teamID;
  v4->_teamID = (NSString *)v9;

  return v4;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
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
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_transactionID, 0);
}

@end