@interface ASDSystemAppMetadata
+ (BOOL)supportsSecureCoding;
- (ASDSystemAppMetadata)initWithBundleID:(id)a3;
- (ASDSystemAppMetadata)initWithCoder:(id)a3;
- (BOOL)isUserInitiated;
- (NSString)bundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)metadataType;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation ASDSystemAppMetadata

- (ASDSystemAppMetadata)initWithBundleID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDSystemAppMetadata;
  v5 = [(ASDSystemAppMetadata *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;
  }
  return v5;
}

- (int64_t)metadataType
{
  return 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ASDSystemAppMetadata allocWithZone:a3] initWithBundleID:self->_bundleID];
  [(ASDSystemAppMetadata *)v4 setUserInitiated:self->_userInitiated];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDSystemAppMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BI"];
  uint64_t v6 = [(ASDSystemAppMetadata *)self initWithBundleID:v5];
  if (v6) {
    v6->_userInitiated = [v4 decodeBoolForKey:@"UI"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"BI"];
  [v5 encodeBool:self->_userInitiated forKey:@"UI"];
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
}

@end