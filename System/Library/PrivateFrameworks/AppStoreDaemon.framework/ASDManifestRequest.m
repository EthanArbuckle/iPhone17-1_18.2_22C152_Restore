@interface ASDManifestRequest
+ (BOOL)supportsSecureCoding;
- (ASDManifestRequest)initWithCoder:(id)a3;
- (BOOL)pinningRevocationCheckRequired;
- (NSArray)certificates;
- (NSDictionary)manifest;
- (NSURL)manifestURL;
- (NSUUID)requestIdentifier;
- (int64_t)archiveType;
- (void)encodeWithCoder:(id)a3;
- (void)setArchiveType:(int64_t)a3;
- (void)setCertificates:(id)a3;
- (void)setManifest:(id)a3;
- (void)setManifestURL:(id)a3;
- (void)setPinningRevocationCheckRequired:(BOOL)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation ASDManifestRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t archiveType = self->_archiveType;
  id v5 = a3;
  [v5 encodeInt64:archiveType forKey:@"ArchiveType"];
  [v5 encodeObject:self->_manifest forKey:@"Manifest"];
  [v5 encodeObject:self->_manifestURL forKey:@"ManifestURL"];
  [v5 encodeObject:self->_certificates forKey:@"Certificates"];
  [v5 encodeBool:self->_pinningRevocationCheckRequired forKey:@"PinningRequired"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"Request"];
}

- (ASDManifestRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASDManifestRequest;
  id v5 = [(ASDManifestRequest *)&v24 init];
  if (v5)
  {
    v5->_int64_t archiveType = [v4 decodeInt64ForKey:@"ArchiveType"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"Manifest"];
    manifest = v5->_manifest;
    v5->_manifest = (NSDictionary *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ManifestURL"];
    manifestURL = v5->_manifestURL;
    v5->_manifestURL = (NSURL *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"Certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v19;

    v5->_pinningRevocationCheckRequired = [v4 decodeBoolForKey:@"PinningRequired"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Request"];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSUUID *)v21;
  }
  return v5;
}

- (NSDictionary)manifest
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManifest:(id)a3
{
}

- (NSURL)manifestURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManifestURL:(id)a3
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

- (NSArray)certificates
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCertificates:(id)a3
{
}

- (BOOL)pinningRevocationCheckRequired
{
  return self->_pinningRevocationCheckRequired;
}

- (void)setPinningRevocationCheckRequired:(BOOL)a3
{
  self->_pinningRevocationCheckRequired = a3;
}

- (NSUUID)requestIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
}

@end