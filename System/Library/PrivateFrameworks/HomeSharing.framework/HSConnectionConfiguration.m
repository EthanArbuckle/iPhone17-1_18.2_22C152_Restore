@interface HSConnectionConfiguration
+ (BOOL)supportsSecureCoding;
- (HSConnectionConfiguration)init;
- (HSConnectionConfiguration)initWithCoder:(id)a3;
- (ICUserIdentity)userIdentity;
- (ICUserIdentityStore)userIdentityStore;
- (NSNumber)familyMemberStoreID;
- (NSString)buildIdentifier;
- (NSString)libraryBagKey;
- (NSString)purchaseClientIdentifier;
- (NSURL)baseURL;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)requestReason;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setBuildIdentifier:(id)a3;
- (void)setFamilyMemberStoreID:(id)a3;
- (void)setLibraryBagKey:(id)a3;
- (void)setPurchaseClientIdentifier:(id)a3;
- (void)setRequestReason:(int64_t)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation HSConnectionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberStoreID, 0);
  objc_storeStrong((id *)&self->_purchaseClientIdentifier, 0);
  objc_storeStrong((id *)&self->_buildIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryBagKey, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_userIdentityStore, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (void)setFamilyMemberStoreID:(id)a3
{
}

- (NSNumber)familyMemberStoreID
{
  return self->_familyMemberStoreID;
}

- (void)setRequestReason:(int64_t)a3
{
  self->_requestReason = a3;
}

- (int64_t)requestReason
{
  return self->_requestReason;
}

- (void)setPurchaseClientIdentifier:(id)a3
{
}

- (NSString)purchaseClientIdentifier
{
  return self->_purchaseClientIdentifier;
}

- (void)setBuildIdentifier:(id)a3
{
}

- (NSString)buildIdentifier
{
  return self->_buildIdentifier;
}

- (void)setLibraryBagKey:(id)a3
{
}

- (NSString)libraryBagKey
{
  return self->_libraryBagKey;
}

- (void)setBaseURL:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (ICUserIdentityStore)userIdentityStore
{
  return self->_userIdentityStore;
}

- (void)setUserIdentity:(id)a3
{
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(HSConnectionConfiguration);
  objc_storeStrong((id *)&v4->_userIdentity, self->_userIdentity);
  objc_storeStrong((id *)&v4->_userIdentityStore, self->_userIdentityStore);
  uint64_t v5 = [(NSURL *)self->_baseURL copy];
  baseURL = v4->_baseURL;
  v4->_baseURL = (NSURL *)v5;

  uint64_t v7 = [(NSString *)self->_libraryBagKey copy];
  libraryBagKey = v4->_libraryBagKey;
  v4->_libraryBagKey = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_buildIdentifier copy];
  buildIdentifier = v4->_buildIdentifier;
  v4->_buildIdentifier = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_purchaseClientIdentifier copy];
  purchaseClientIdentifier = v4->_purchaseClientIdentifier;
  v4->_purchaseClientIdentifier = (NSString *)v11;

  v4->_requestReason = self->_requestReason;
  objc_storeStrong((id *)&v4->_familyMemberStoreID, self->_familyMemberStoreID);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  userIdentity = self->_userIdentity;
  userIdentityStore = self->_userIdentityStore;
  id v6 = a3;
  objc_msgSend(v6, "ic_encodeUserIdentity:withStore:forKey:", userIdentity, userIdentityStore, @"userIdentity");
  [v6 encodeObject:self->_userIdentityStore forKey:@"userIdentityStore"];
  [v6 encodeObject:self->_baseURL forKey:@"baseURL"];
  [v6 encodeObject:self->_libraryBagKey forKey:@"libraryBagKey"];
  [v6 encodeObject:self->_buildIdentifier forKey:@"buildIdentifier"];
  [v6 encodeObject:self->_purchaseClientIdentifier forKey:@"purchaseClientIdentifier"];
  [v6 encodeInt64:self->_requestReason forKey:@"requestReason"];
  [v6 encodeObject:self->_familyMemberStoreID forKey:@"familyMemberStoreID"];
}

- (HSConnectionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HSConnectionConfiguration;
  uint64_t v5 = [(HSConnectionConfiguration *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userIdentity"];
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userIdentityStore"];
    userIdentityStore = v5->_userIdentityStore;
    v5->_userIdentityStore = (ICUserIdentityStore *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryBagKey"];
    libraryBagKey = v5->_libraryBagKey;
    v5->_libraryBagKey = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buildIdentifier"];
    buildIdentifier = v5->_buildIdentifier;
    v5->_buildIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaseClientIdentifier"];
    purchaseClientIdentifier = v5->_purchaseClientIdentifier;
    v5->_purchaseClientIdentifier = (NSString *)v16;

    v5->_requestReason = [v4 decodeInt64ForKey:@"requestReason"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyMemberStoreID"];
    familyMemberStoreID = v5->_familyMemberStoreID;
    v5->_familyMemberStoreID = (NSNumber *)v18;
  }
  return v5;
}

- (HSConnectionConfiguration)init
{
  v15.receiver = self;
  v15.super_class = (Class)HSConnectionConfiguration;
  v2 = [(HSConnectionConfiguration *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F893C0] activeLockerAccount];
    userIdentity = v2->_userIdentity;
    v2->_userIdentity = (ICUserIdentity *)v3;

    uint64_t v5 = [MEMORY[0x263F893C8] defaultIdentityStore];
    userIdentityStore = v2->_userIdentityStore;
    v2->_userIdentityStore = (ICUserIdentityStore *)v5;

    uint64_t v7 = (__CFString *)MGCopyAnswer();
    if (![(__CFString *)v7 length])
    {

      uint64_t v7 = @"UNKNOWN";
    }
    uint64_t v8 = [NSString stringWithFormat:@"%@/%@", @"1.3", v7];
    buildIdentifier = v2->_buildIdentifier;
    v2->_buildIdentifier = (NSString *)v8;

    uint64_t v10 = NSString;
    uint64_t v11 = HSGetCloudDAAPClientPrefix();
    uint64_t v12 = [v10 stringWithFormat:@"%@/%@%@", @"1.1", v11, v7];
    purchaseClientIdentifier = v2->_purchaseClientIdentifier;
    v2->_purchaseClientIdentifier = (NSString *)v12;

    v2->_requestReason = 0;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end