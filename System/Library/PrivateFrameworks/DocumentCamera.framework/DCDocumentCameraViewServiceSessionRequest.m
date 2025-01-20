@interface DCDocumentCameraViewServiceSessionRequest
+ (BOOL)supportsSecureCoding;
- (DCDocumentCameraViewServiceSessionRequest)init;
- (DCDocumentCameraViewServiceSessionRequest)initWithCoder:(id)a3;
- (DCSandboxExtension)cachesDirectorySandboxExtension;
- (NSString)appName;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DCDocumentCameraViewServiceSessionRequest

- (DCDocumentCameraViewServiceSessionRequest)init
{
  v12.receiver = self;
  v12.super_class = (Class)DCDocumentCameraViewServiceSessionRequest;
  v2 = [(DCDocumentCameraViewServiceSessionRequest *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v4 = [v3 _localizedApplicationName];
    appName = v2->_appName;
    v2->_appName = (NSString *)v4;

    v6 = [DCSandboxExtension alloc];
    v7 = +[DCCachesDirectory sharedCachesDirectory];
    v8 = [v7 cachesDirectoryURL];
    uint64_t v9 = [(DCSandboxExtension *)v6 initWithFileURL:v8];
    cachesDirectorySandboxExtension = v2->_cachesDirectorySandboxExtension;
    v2->_cachesDirectorySandboxExtension = (DCSandboxExtension *)v9;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCDocumentCameraViewServiceSessionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DCDocumentCameraViewServiceSessionRequest;
  v5 = [(DCDocumentCameraViewServiceSessionRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAppNameFieldCodingKey"];
    appName = v5->_appName;
    v5->_appName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCachesDirectorySandboxExtensionFieldCodingKey"];
    cachesDirectorySandboxExtension = v5->_cachesDirectorySandboxExtension;
    v5->_cachesDirectorySandboxExtension = (DCSandboxExtension *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DCDocumentCameraViewServiceSessionRequest *)self appName];
  [v4 encodeObject:v5 forKey:@"kAppNameFieldCodingKey"];

  id v6 = [(DCDocumentCameraViewServiceSessionRequest *)self cachesDirectorySandboxExtension];
  [v4 encodeObject:v6 forKey:@"kCachesDirectorySandboxExtensionFieldCodingKey"];
}

- (NSString)appName
{
  return self->_appName;
}

- (DCSandboxExtension)cachesDirectorySandboxExtension
{
  return self->_cachesDirectorySandboxExtension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachesDirectorySandboxExtension, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

@end