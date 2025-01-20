@interface ASDJobOptions
+ (BOOL)supportsSecureCoding;
- (ASDJobManifest)manifest;
- (ASDJobOptions)initWithCoder:(id)a3;
- (NSXPCConnection)endpoint;
- (void)encodeWithCoder:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setManifest:(id)a3;
@end

@implementation ASDJobOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASDJobOptions *)self manifest];
  [v4 encodeObject:v5 forKey:@"purchaseManifest"];

  id v6 = [(ASDJobOptions *)self endpoint];
  [v4 encodeObject:v6 forKey:@"endpoint"];
}

- (ASDJobOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDJobOptions;
  v5 = [(ASDJobOptions *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"purchaseManifest"];
    manifest = v5->_manifest;
    v5->_manifest = (ASDJobManifest *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    if (v8)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v8];
      endpoint = v5->_endpoint;
      v5->_endpoint = (NSXPCConnection *)v9;
    }
  }

  return v5;
}

- (NSXPCConnection)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
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
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end