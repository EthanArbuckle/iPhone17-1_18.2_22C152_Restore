@interface ASDManagedApplicationRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDManagedApplicationRequestOptions)initWithCoder:(id)a3;
- (ASDManagedApplicationRequestOptions)initWithItemIdentifer:(id)a3 externalVersionIdentifier:(id)a4 bundleIdentifier:(id)a5 bundleVersion:(id)a6 skipDownloads:(BOOL)a7;
- (BOOL)skipDownloads;
- (NSNumber)accountIdentifier;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)itemIdentifier;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)requestType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setRequestType:(int64_t)a3;
@end

@implementation ASDManagedApplicationRequestOptions

- (ASDManagedApplicationRequestOptions)initWithItemIdentifer:(id)a3 externalVersionIdentifier:(id)a4 bundleIdentifier:(id)a5 bundleVersion:(id)a6 skipDownloads:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ASDManagedApplicationRequestOptions;
  v17 = [(ASDManagedApplicationRequestOptions *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_itemIdentifier, a3);
    objc_storeStrong((id *)&v18->_externalVersionIdentifier, a4);
    objc_storeStrong((id *)&v18->_bundleIdentifier, a5);
    objc_storeStrong((id *)&v18->_bundleVersion, a6);
    v18->_skipDownloads = a7;
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDManagedApplicationRequestOptions allocWithZone:](ASDManagedApplicationRequestOptions, "allocWithZone:") init];
  uint64_t v6 = [(NSNumber *)self->_accountIdentifier copyWithZone:a3];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSNumber *)v6;

  uint64_t v8 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_bundleVersion copyWithZone:a3];
  bundleVersion = v5->_bundleVersion;
  v5->_bundleVersion = (NSString *)v10;

  uint64_t v12 = [(NSNumber *)self->_externalVersionIdentifier copyWithZone:a3];
  externalVersionIdentifier = v5->_externalVersionIdentifier;
  v5->_externalVersionIdentifier = (NSNumber *)v12;

  uint64_t v14 = [(NSNumber *)self->_itemIdentifier copyWithZone:a3];
  itemIdentifier = v5->_itemIdentifier;
  v5->_itemIdentifier = (NSNumber *)v14;

  v5->_requestType = self->_requestType;
  v5->_skipDownloads = self->_skipDownloads;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDManagedApplicationRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDManagedApplicationRequestOptions;
  v5 = [(ASDRequestOptions *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifierKey"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifierKey"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersionKey"];
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalVersionIdentifierKey"];
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemIdentifierKey"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSNumber *)v14;

    v5->_requestType = [v4 decodeIntegerForKey:@"requestType"];
    v5->_skipDownloads = [v4 decodeBoolForKey:@"skipDownloadsKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(ASDManagedApplicationRequestOptions *)self accountIdentifier];
  [v9 encodeObject:v4 forKey:@"accountIdentifierKey"];

  v5 = [(ASDManagedApplicationRequestOptions *)self bundleIdentifier];
  [v9 encodeObject:v5 forKey:@"bundleIdentifierKey"];

  uint64_t v6 = [(ASDManagedApplicationRequestOptions *)self bundleVersion];
  [v9 encodeObject:v6 forKey:@"bundleVersionKey"];

  v7 = [(ASDManagedApplicationRequestOptions *)self externalVersionIdentifier];
  [v9 encodeObject:v7 forKey:@"externalVersionIdentifierKey"];

  uint64_t v8 = [(ASDManagedApplicationRequestOptions *)self itemIdentifier];
  [v9 encodeObject:v8 forKey:@"itemIdentifierKey"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[ASDManagedApplicationRequestOptions requestType](self, "requestType"), @"requestType");
  objc_msgSend(v9, "encodeBool:forKey:", -[ASDManagedApplicationRequestOptions skipDownloads](self, "skipDownloads"), @"skipDownloadsKey");
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (BOOL)skipDownloads
{
  return self->_skipDownloads;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end