@interface ASDClaimApplicationsRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDClaimApplicationsRequestOptions)initWithBundleIdentifiers:(id)a3;
- (ASDClaimApplicationsRequestOptions)initWithClaimStyle:(int64_t)a3;
- (ASDClaimApplicationsRequestOptions)initWithCoder:(id)a3;
- (BOOL)establishesActiveAccount;
- (BOOL)ignoresPreviousClaimAttempts;
- (BOOL)suppressErrorDialogs;
- (NSArray)bundleIdentifiers;
- (NSData)clientAuditTokenData;
- (NSDictionary)httpHeaders;
- (NSNumber)accountID;
- (NSNumber)purchaseID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)claimStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setEstablishesActiveAccount:(BOOL)a3;
- (void)setHttpHeaders:(id)a3;
- (void)setIgnoresPreviousClaimAttempts:(BOOL)a3;
- (void)setPurchaseID:(id)a3;
- (void)setSuppressErrorDialogs:(BOOL)a3;
@end

@implementation ASDClaimApplicationsRequestOptions

- (ASDClaimApplicationsRequestOptions)initWithClaimStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASDClaimApplicationsRequestOptions;
  result = [(ASDClaimApplicationsRequestOptions *)&v5 init];
  if (result) {
    result->_claimStyle = a3;
  }
  return result;
}

- (ASDClaimApplicationsRequestOptions)initWithBundleIdentifiers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDClaimApplicationsRequestOptions;
  v6 = [(ASDClaimApplicationsRequestOptions *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifiers, a3);
    v7->_claimStyle = 2;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[ASDClaimApplicationsRequestOptions allocWithZone:](ASDClaimApplicationsRequestOptions, "allocWithZone:") init];
  uint64_t v6 = [(NSNumber *)self->_accountID copyWithZone:a3];
  accountID = v5->_accountID;
  v5->_accountID = (NSNumber *)v6;

  uint64_t v8 = [(NSArray *)self->_bundleIdentifiers copyWithZone:a3];
  bundleIdentifiers = v5->_bundleIdentifiers;
  v5->_bundleIdentifiers = (NSArray *)v8;

  v5->_claimStyle = self->_claimStyle;
  uint64_t v10 = [(NSData *)self->_clientAuditTokenData copyWithZone:a3];
  clientAuditTokenData = v5->_clientAuditTokenData;
  v5->_clientAuditTokenData = (NSData *)v10;

  v5->_establishesActiveAccount = self->_establishesActiveAccount;
  uint64_t v12 = [(NSDictionary *)self->_httpHeaders copyWithZone:a3];
  httpHeaders = v5->_httpHeaders;
  v5->_httpHeaders = (NSDictionary *)v12;

  v5->_ignoresPreviousClaimAttempts = self->_ignoresPreviousClaimAttempts;
  uint64_t v14 = [(NSNumber *)self->_purchaseID copyWithZone:a3];
  purchaseID = v5->_purchaseID;
  v5->_purchaseID = (NSNumber *)v14;

  v5->_suppressErrorDialogs = self->_suppressErrorDialogs;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDClaimApplicationsRequestOptions)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ASDClaimApplicationsRequestOptions;
  id v5 = [(ASDRequestOptions *)&v22 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIDKey"];
    accountID = v5->_accountID;
    v5->_accountID = (NSNumber *)v6;

    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    objc_super v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"bundleIdentifiersKey"];
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"claimStyleKey"];
    v5->_claimStyle = [v12 integerValue];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientAuditTokenDataKey"];
    clientAuditTokenData = v5->_clientAuditTokenData;
    v5->_clientAuditTokenData = (NSData *)v13;

    v5->_establishesActiveAccount = [v4 decodeBoolForKey:@"establishesActiveAccountKey"];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"httpHeadersKey"];
    httpHeaders = v5->_httpHeaders;
    v5->_httpHeaders = (NSDictionary *)v17;

    v5->_ignoresPreviousClaimAttempts = [v4 decodeBoolForKey:@"ignoresPreviousClaimAttempsKey"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaseIDKey"];
    purchaseID = v5->_purchaseID;
    v5->_purchaseID = (NSNumber *)v19;

    v5->_suppressErrorDialogs = [v4 decodeBoolForKey:@"supressErrorDialogsKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(ASDClaimApplicationsRequestOptions *)self accountID];
  [v10 encodeObject:v4 forKey:@"accountIDKey"];

  id v5 = [(ASDClaimApplicationsRequestOptions *)self bundleIdentifiers];
  [v10 encodeObject:v5 forKey:@"bundleIdentifiersKey"];

  uint64_t v6 = [NSNumber numberWithInteger:self->_claimStyle];
  [v10 encodeObject:v6 forKey:@"claimStyleKey"];

  v7 = [(ASDClaimApplicationsRequestOptions *)self clientAuditTokenData];
  [v10 encodeObject:v7 forKey:@"clientAuditTokenDataKey"];

  objc_msgSend(v10, "encodeBool:forKey:", -[ASDClaimApplicationsRequestOptions establishesActiveAccount](self, "establishesActiveAccount"), @"establishesActiveAccountKey");
  uint64_t v8 = [(ASDClaimApplicationsRequestOptions *)self httpHeaders];
  [v10 encodeObject:v8 forKey:@"httpHeadersKey"];

  objc_msgSend(v10, "encodeBool:forKey:", -[ASDClaimApplicationsRequestOptions ignoresPreviousClaimAttempts](self, "ignoresPreviousClaimAttempts"), @"ignoresPreviousClaimAttempsKey");
  objc_super v9 = [(ASDClaimApplicationsRequestOptions *)self purchaseID];
  [v10 encodeObject:v9 forKey:@"purchaseIDKey"];

  objc_msgSend(v10, "encodeBool:forKey:", -[ASDClaimApplicationsRequestOptions suppressErrorDialogs](self, "suppressErrorDialogs"), @"supressErrorDialogsKey");
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (void)setClientAuditTokenData:(id)a3
{
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (int64_t)claimStyle
{
  return self->_claimStyle;
}

- (BOOL)establishesActiveAccount
{
  return self->_establishesActiveAccount;
}

- (void)setEstablishesActiveAccount:(BOOL)a3
{
  self->_establishesActiveAccount = a3;
}

- (NSDictionary)httpHeaders
{
  return self->_httpHeaders;
}

- (void)setHttpHeaders:(id)a3
{
}

- (BOOL)ignoresPreviousClaimAttempts
{
  return self->_ignoresPreviousClaimAttempts;
}

- (void)setIgnoresPreviousClaimAttempts:(BOOL)a3
{
  self->_ignoresPreviousClaimAttempts = a3;
}

- (NSNumber)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
}

- (BOOL)suppressErrorDialogs
{
  return self->_suppressErrorDialogs;
}

- (void)setSuppressErrorDialogs:(BOOL)a3
{
  self->_suppressErrorDialogs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientAuditTokenData, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end