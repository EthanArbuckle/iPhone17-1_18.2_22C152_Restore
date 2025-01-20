@interface CPLCloudKitScopeListSyncAnchor
+ (BOOL)supportsSecureCoding;
+ (CPLCloudKitScopeListSyncAnchor)cloudKitScopeListSyncAnchorWithScopeListSyncAnchor:(id)a3;
- (CKServerChangeToken)privateChangeToken;
- (CKServerChangeToken)sharedChangeToken;
- (CPLCloudKitScopeListSyncAnchor)initWithCoder:(id)a3;
- (CPLCloudKitScopeListSyncAnchor)initWithPrivateChangeToken:(id)a3 sharedChangeToken:(id)a4;
- (NSData)scopeListSyncAnchor;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLCloudKitScopeListSyncAnchor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (CPLCloudKitScopeListSyncAnchor)cloudKitScopeListSyncAnchorWithScopeListSyncAnchor:(id)a3
{
  id v4 = a3;
  if (!v4
    || (+[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v4 class:objc_opt_class()], (id v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = [objc_alloc((Class)a1) initWithPrivateChangeToken:0 sharedChangeToken:0];
  }

  return (CPLCloudKitScopeListSyncAnchor *)v5;
}

- (CPLCloudKitScopeListSyncAnchor)initWithPrivateChangeToken:(id)a3 sharedChangeToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLCloudKitScopeListSyncAnchor;
  v9 = [(CPLCloudKitScopeListSyncAnchor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_privateChangeToken, a3);
    objc_storeStrong((id *)&v10->_sharedChangeToken, a4);
  }

  return v10;
}

- (CPLCloudKitScopeListSyncAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLCloudKitScopeListSyncAnchor;
  id v5 = [(CPLCloudKitScopeListSyncAnchor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"private"];
    privateChangeToken = v5->_privateChangeToken;
    v5->_privateChangeToken = (CKServerChangeToken *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shared"];
    sharedChangeToken = v5->_sharedChangeToken;
    v5->_sharedChangeToken = (CKServerChangeToken *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  privateChangeToken = self->_privateChangeToken;
  id v5 = a3;
  [v5 encodeObject:privateChangeToken forKey:@"private"];
  [v5 encodeObject:self->_sharedChangeToken forKey:@"shared"];
}

- (NSData)scopeListSyncAnchor
{
  return (NSData *)+[NSKeyedArchiver cpl_archivedDataWithRootObject:self];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(CKServerChangeToken *)self->_privateChangeToken data];
  uint64_t v5 = [v4 base64EncodedStringWithOptions:0];
  uint64_t v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = @"none";
  }
  uint64_t v8 = [(CKServerChangeToken *)self->_sharedChangeToken data];
  uint64_t v9 = [v8 base64EncodedStringWithOptions:0];
  v10 = (void *)v9;
  if (v9) {
    CFStringRef v11 = (const __CFString *)v9;
  }
  else {
    CFStringRef v11 = @"none";
  }
  id v12 = [v3 initWithFormat:@"private: %@ / shared: %@", v7, v11];

  return v12;
}

- (CKServerChangeToken)privateChangeToken
{
  return self->_privateChangeToken;
}

- (CKServerChangeToken)sharedChangeToken
{
  return self->_sharedChangeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedChangeToken, 0);
  objc_storeStrong((id *)&self->_privateChangeToken, 0);
}

@end