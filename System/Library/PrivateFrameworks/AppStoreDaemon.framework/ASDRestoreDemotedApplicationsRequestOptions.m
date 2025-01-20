@interface ASDRestoreDemotedApplicationsRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDRestoreDemotedApplicationsRequestOptions)initWithAccountID:(id)a3 appleID:(id)a4;
- (ASDRestoreDemotedApplicationsRequestOptions)initWithBundleIDs:(id)a3;
- (ASDRestoreDemotedApplicationsRequestOptions)initWithCoder:(id)a3;
- (NSArray)bundleIDs;
- (NSNumber)accountID;
- (NSString)appleID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIDs:(id)a3;
@end

@implementation ASDRestoreDemotedApplicationsRequestOptions

- (ASDRestoreDemotedApplicationsRequestOptions)initWithAccountID:(id)a3 appleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDRestoreDemotedApplicationsRequestOptions;
  v8 = [(ASDRestoreDemotedApplicationsRequestOptions *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accountID = v8->_accountID;
    v8->_accountID = (NSNumber *)v9;

    uint64_t v11 = [v7 copy];
    appleID = v8->_appleID;
    v8->_appleID = (NSString *)v11;
  }
  return v8;
}

- (ASDRestoreDemotedApplicationsRequestOptions)initWithBundleIDs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDRestoreDemotedApplicationsRequestOptions;
  v5 = [(ASDRestoreDemotedApplicationsRequestOptions *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDRestoreDemotedApplicationsRequestOptions allocWithZone:](ASDRestoreDemotedApplicationsRequestOptions, "allocWithZone:") init];
  uint64_t v6 = [(NSNumber *)self->_accountID copyWithZone:a3];
  accountID = v5->_accountID;
  v5->_accountID = (NSNumber *)v6;

  uint64_t v8 = [(NSString *)self->_appleID copyWithZone:a3];
  appleID = v5->_appleID;
  v5->_appleID = (NSString *)v8;

  uint64_t v10 = [(NSArray *)self->_bundleIDs copyWithZone:a3];
  bundleIDs = v5->_bundleIDs;
  v5->_bundleIDs = (NSArray *)v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRestoreDemotedApplicationsRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASDRestoreDemotedApplicationsRequestOptions;
  v5 = [(ASDRequestOptions *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"bundleIDs"];
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  accountID = self->_accountID;
  id v5 = a3;
  [v5 encodeObject:accountID forKey:@"accountID"];
  [v5 encodeObject:self->_appleID forKey:@"appleID"];
  [v5 encodeObject:self->_bundleIDs forKey:@"bundleIDs"];
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end