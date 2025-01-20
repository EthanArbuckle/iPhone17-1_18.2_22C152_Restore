@interface HMSoftwareUpdateDocumentationMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMFDigest)digest;
- (HMSoftwareUpdateDocumentationMetadata)init;
- (HMSoftwareUpdateDocumentationMetadata)initWithCoder:(id)a3;
- (HMSoftwareUpdateDocumentationMetadata)initWithURL:(id)a3 digest:(id)a4;
- (NSURL)URL;
- (NSUUID)metadataDigestUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMSoftwareUpdateDocumentationMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDigestUUID, 0);
  objc_storeStrong((id *)&self->_digest, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

- (NSUUID)metadataDigestUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMFDigest)digest
{
  return (HMFDigest *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMSoftwareUpdateDocumentationMetadata *)self URL];
  [v4 encodeObject:v5 forKey:@"HM.url"];

  id v6 = [(HMSoftwareUpdateDocumentationMetadata *)self digest];
  [v4 encodeObject:v6 forKey:@"HM.digest"];
}

- (HMSoftwareUpdateDocumentationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.url"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.digest"];

  v7 = [(HMSoftwareUpdateDocumentationMetadata *)self initWithURL:v5 digest:v6];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(HMSoftwareUpdateDocumentationMetadata *)self URL];
  v7 = (void *)[v6 copyWithZone:a3];
  v8 = [(HMSoftwareUpdateDocumentationMetadata *)self digest];
  v9 = (void *)[v8 copyWithZone:a3];
  v10 = (void *)[v5 initWithURL:v7 digest:v9];

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HMSoftwareUpdateDocumentationMetadata *)self URL];
  id v6 = [v5 path];
  v7 = [(HMSoftwareUpdateDocumentationMetadata *)self digest];
  v8 = [v3 stringWithFormat:@"<%@, URL = %@, Digest = %@>", v4, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMSoftwareUpdateDocumentationMetadata *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    if (!v6) {
      goto LABEL_8;
    }
    v7 = [(HMSoftwareUpdateDocumentationMetadata *)self URL];
    v8 = [v7 absoluteURL];
    v9 = [(HMSoftwareUpdateDocumentationMetadata *)v6 URL];
    v10 = [v9 absoluteURL];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      v12 = [(HMSoftwareUpdateDocumentationMetadata *)self digest];
      v13 = [(HMSoftwareUpdateDocumentationMetadata *)v6 digest];
      char v14 = [v12 isEqual:v13];
    }
    else
    {
LABEL_8:
      char v14 = 0;
    }
  }
  return v14;
}

- (unint64_t)hash
{
  v2 = [(HMSoftwareUpdateDocumentationMetadata *)self URL];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMSoftwareUpdateDocumentationMetadata)initWithURL:(id)a3 digest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMSoftwareUpdateDocumentationMetadata;
  v8 = [(HMSoftwareUpdateDocumentationMetadata *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    URL = v8->_URL;
    v8->_URL = (NSURL *)v9;

    uint64_t v11 = [v7 copy];
    digest = v8->_digest;
    v8->_digest = (HMFDigest *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F29128]);
    id v14 = [v7 value];
    uint64_t v15 = objc_msgSend(v13, "initWithUUIDBytes:", objc_msgSend(v14, "bytes"));
    metadataDigestUUID = v8->_metadataDigestUUID;
    v8->_metadataDigestUUID = (NSUUID *)v15;
  }
  return v8;
}

- (HMSoftwareUpdateDocumentationMetadata)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end