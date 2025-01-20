@interface QLCacheVersionedFileIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)versionedFileIdentifierWithThumbnailRequest:(id)a3;
- (BOOL)isEqual:(id)a3;
- (QLCacheFileIdentifier)fileIdentifier;
- (QLCacheVersionedFileIdentifier)initWithCoder:(id)a3;
- (QLCacheVersionedFileIdentifier)initWithFileIdentifier:(id)a3 version:(id)a4;
- (QLThumbnailVersion)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation QLCacheVersionedFileIdentifier

- (QLThumbnailVersion)version
{
  return (QLThumbnailVersion *)objc_getProperty(self, a2, 8, 1);
}

- (QLCacheFileIdentifier)fileIdentifier
{
  return (QLCacheFileIdentifier *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileIdentifier, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

- (QLCacheVersionedFileIdentifier)initWithFileIdentifier:(id)a3 version:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)QLCacheVersionedFileIdentifier;
  v9 = [(QLCacheVersionedFileIdentifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileIdentifier, a3);
    objc_storeStrong((id *)&v10->_version, a4);
  }

  return v10;
}

- (QLCacheVersionedFileIdentifier)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"i"];
  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"v"];

  v10 = [(QLCacheVersionedFileIdentifier *)self initWithFileIdentifier:v8 version:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  fileIdentifier = self->_fileIdentifier;
  id v5 = a3;
  [v5 encodeObject:fileIdentifier forKey:@"i"];
  [v5 encodeObject:self->_version forKey:@"v"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)versionedFileIdentifierWithThumbnailRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 fileIdentifier];
  id v5 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "versionedFileIdentifierClass")), "initWithThumbnailRequest:", v3);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  version = self->_version;
  fileIdentifier = self->_fileIdentifier;

  return (id)[v4 initWithFileIdentifier:fileIdentifier version:version];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<fi:%@ (version: %@)>", self->_fileIdentifier, self->_version];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (QLCacheVersionedFileIdentifier *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      fileIdentifier = self->_fileIdentifier;
      id v7 = [(QLCacheVersionedFileIdentifier *)v5 fileIdentifier];
      if ([(QLCacheFileIdentifier *)fileIdentifier isEqual:v7])
      {
        version = self->_version;
        v9 = [(QLCacheVersionedFileIdentifier *)v5 version];
        char v10 = [(QLThumbnailVersion *)version isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return [(QLCacheFileIdentifier *)self->_fileIdentifier hash];
}

@end