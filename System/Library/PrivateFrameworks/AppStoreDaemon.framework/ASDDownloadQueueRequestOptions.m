@interface ASDDownloadQueueRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDDownloadQueueRequestOptions)initWithCoder:(id)a3;
- (ASDDownloadQueueRequestOptions)initWithManifest:(id)a3;
- (ASDJobManifest)manifest;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setManifest:(id)a3;
@end

@implementation ASDDownloadQueueRequestOptions

- (ASDDownloadQueueRequestOptions)initWithManifest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDDownloadQueueRequestOptions;
  v6 = [(ASDDownloadQueueRequestOptions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_manifest, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[ASDDownloadQueueRequestOptions allocWithZone:](ASDDownloadQueueRequestOptions, "allocWithZone:") init];
  v6 = [(ASDJobManifest *)self->_manifest copyWithZone:a3];
  manifest = v5->_manifest;
  v5->_manifest = v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDDownloadQueueRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDDownloadQueueRequestOptions;
  id v5 = [(ASDRequestOptions *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifest"];
    manifest = v5->_manifest;
    v5->_manifest = (ASDJobManifest *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ASDJobManifest)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end