@interface IDSPersistentMapMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSPersistentMapMetadata)initWithCoder:(id)a3;
- (IDSPersistentMapMetadata)initWithVersionNumber:(int64_t)a3;
- (int64_t)versionNumber;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSPersistentMapMetadata

- (IDSPersistentMapMetadata)initWithVersionNumber:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IDSPersistentMapMetadata;
  result = [(IDSPersistentMapMetadata *)&v5 init];
  if (result) {
    result->_versionNumber = a3;
  }
  return result;
}

- (IDSPersistentMapMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)IDSPersistentMapMetadata;
  objc_super v5 = [(IDSPersistentMapMetadata *)&v7 init];
  if (v5) {
    v5->_versionNumber = (int64_t)[v4 decodeIntegerForKey:@"versionNumber"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[IDSPersistentMapMetadata versionNumber](self, "versionNumber"), @"versionNumber");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(IDSPersistentMapMetadata *)self versionNumber];
    id v7 = [v5 versionNumber];

    BOOL v8 = v6 == (void)v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int64_t)versionNumber
{
  return self->_versionNumber;
}

@end