@interface ASDVPPRequest
+ (BOOL)supportsSecureCoding;
- (ASDVPPRequest)initWithCoder:(id)a3;
- (NSNumber)accountIdentifier;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)itemIdentifier;
- (NSString)bundleIdentifier;
- (NSUUID)requestIdentifier;
- (id)description;
- (int64_t)archiveType;
- (int64_t)requestType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setArchiveType:(int64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setExternalVersionIdentifier:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestType:(int64_t)a3;
@end

@implementation ASDVPPRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  accountIdentifier = self->_accountIdentifier;
  id v5 = a3;
  [v5 encodeObject:accountIdentifier forKey:@"Account"];
  [v5 encodeInt64:self->_archiveType forKey:@"ArchiveType"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"Bundle"];
  [v5 encodeObject:self->_externalVersionIdentifier forKey:@"ExternalVersion"];
  [v5 encodeObject:self->_itemIdentifier forKey:@"Item"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"Request"];
  [v5 encodeInt64:self->_requestType forKey:@"RequestType"];
}

- (ASDVPPRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASDVPPRequest;
  id v5 = [(ASDVPPRequest *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Account"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v6;

    v5->_archiveType = [v4 decodeInt64ForKey:@"ArchiveType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Bundle"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExternalVersion"];
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Item"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Request"];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v14;

    v5->_requestType = [v4 decodeInt64ForKey:@"RequestType"];
  }

  return v5;
}

- (id)description
{
  int64_t archiveType = self->_archiveType;
  id v4 = &stru_1EEC399F8;
  id v5 = @":iOS";
  if (archiveType != 1) {
    id v5 = &stru_1EEC399F8;
  }
  if (archiveType == 2) {
    uint64_t v6 = @":macOS";
  }
  else {
    uint64_t v6 = v5;
  }
  v7 = v6;
  int64_t requestType = self->_requestType;
  v9 = @":Device";
  if (requestType != 2) {
    v9 = &stru_1EEC399F8;
  }
  if (requestType == 1) {
    uint64_t v10 = @":User";
  }
  else {
    uint64_t v10 = v9;
  }
  v11 = v10;
  if (self->_accountIdentifier)
  {
    id v4 = [NSString stringWithFormat:@":acct %@", self->_accountIdentifier];
  }
  if (self->_externalVersionIdentifier)
  {
    uint64_t v12 = [NSString stringWithFormat:@":evid %@", self->_externalVersionIdentifier];
  }
  else
  {
    uint64_t v12 = &stru_1EEC399F8;
  }
  v13 = [NSString stringWithFormat:@"[%@/%@%@%@%@%@:%@]", self->_bundleIdentifier, self->_itemIdentifier, v12, v7, v11, v4, self->_requestIdentifier];

  return v13;
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountIdentifier:(id)a3
{
}

- (int64_t)archiveType
{
  return self->_archiveType;
}

- (void)setArchiveType:(int64_t)a3
{
  self->_int64_t archiveType = a3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSNumber)externalVersionIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExternalVersionIdentifier:(id)a3
{
}

- (NSNumber)itemIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSUUID)requestIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequestIdentifier:(id)a3
{
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_int64_t requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end