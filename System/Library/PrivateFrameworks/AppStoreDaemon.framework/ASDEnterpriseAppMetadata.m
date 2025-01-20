@interface ASDEnterpriseAppMetadata
+ (BOOL)supportsSecureCoding;
- (ASDEnterpriseAppMetadata)initWithCoder:(id)a3;
- (ASDEnterpriseAppMetadata)initWithManifestURL:(id)a3;
- (BOOL)hideUserPrompts;
- (NSURL)manifestURL;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)metadataType;
- (void)encodeWithCoder:(id)a3;
- (void)setHideUserPrompts:(BOOL)a3;
@end

@implementation ASDEnterpriseAppMetadata

- (ASDEnterpriseAppMetadata)initWithManifestURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDEnterpriseAppMetadata;
  v5 = [(ASDEnterpriseAppMetadata *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v6;
  }
  return v5;
}

- (int64_t)metadataType
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[ASDEnterpriseAppMetadata alloc] initWithManifestURL:self->_manifestURL];
  *((unsigned char *)result + 8) = self->_hideUserPrompts;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDEnterpriseAppMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MU"];
  uint64_t v6 = [(ASDEnterpriseAppMetadata *)self initWithManifestURL:v5];
  if (v6) {
    v6->_hideUserPrompts = [v4 decodeBoolForKey:@"HP"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  manifestURL = self->_manifestURL;
  id v5 = a3;
  [v5 encodeObject:manifestURL forKey:@"MU"];
  [v5 encodeBool:self->_hideUserPrompts forKey:@"HP"];
}

- (BOOL)hideUserPrompts
{
  return self->_hideUserPrompts;
}

- (void)setHideUserPrompts:(BOOL)a3
{
  self->_hideUserPrompts = a3;
}

- (NSURL)manifestURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end