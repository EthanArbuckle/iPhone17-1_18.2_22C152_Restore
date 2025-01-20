@interface ARQLSandboxingURLWrapper
+ (BOOL)supportsSecureCoding;
+ (id)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 error:(id *)a5;
+ (id)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6;
+ (id)wrapperWithURL:(id)a3 readonly:(BOOL)a4 error:(id *)a5;
+ (void)assembleURL:(id)a3 sandbox:(id)a4 physicalURL:(id)a5 physicalSandbox:(id)a6;
- (ARQLSandboxingURLWrapper)initWithCoder:(id)a3;
- (ARQLSandboxingURLWrapper)initWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6;
- (NSURL)url;
- (id)issueSandboxExtensionForURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARQLSandboxingURLWrapper

+ (id)wrapperWithURL:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  v5 = (void *)MEMORY[0x263EF8000];
  if (!a4) {
    v5 = (void *)MEMORY[0x263EF8008];
  }
  return (id)[a1 wrapperWithURL:a3 extensionClass:*v5 error:a5];
}

+ (id)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 error:(id *)a5
{
  return (id)[a1 wrapperWithURL:a3 extensionClass:a4 report:1 error:a5];
}

+ (id)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithURL:v10 extensionClass:a4 report:v7 error:a6];

  return v11;
}

- (ARQLSandboxingURLWrapper)initWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ARQLSandboxingURLWrapper;
  v12 = [(ARQLSandboxingURLWrapper *)&v27 init];
  v13 = v12;
  if (!v12)
  {
    id v18 = 0;
LABEL_14:
    v23 = v13;
    goto LABEL_19;
  }
  objc_storeStrong((id *)&v12->_url, a3);
  v14 = (void *)_CFURLPromiseCopyPhysicalURL();
  if (([v11 isEqual:v14] & 1) == 0) {
    objc_storeStrong((id *)&v13->_promiseURL, v14);
  }
  int v15 = [v11 startAccessingSecurityScopedResource];
  int v16 = [v14 startAccessingSecurityScopedResource];
  id v26 = 0;
  uint64_t v17 = [(ARQLSandboxingURLWrapper *)v13 issueSandboxExtensionForURL:v11 extensionClass:a4 report:v7 error:&v26];
  id v18 = v26;
  scope = v13->_scope;
  v13->_scope = (NSData *)v17;

  if (v13->_scope)
  {
    if (!v14)
    {
LABEL_8:
      if (v15) {
        [v11 stopAccessingSecurityScopedResource];
      }
      if (v16) {
        [v14 stopAccessingSecurityScopedResource];
      }

      goto LABEL_14;
    }
    id v25 = v18;
    uint64_t v20 = [(ARQLSandboxingURLWrapper *)v13 issueSandboxExtensionForURL:v14 extensionClass:a4 report:v7 error:&v25];
    id v21 = v25;

    promiseScope = v13->_promiseScope;
    v13->_promiseScope = (NSData *)v20;

    if (v13->_promiseScope)
    {
      id v18 = v21;
      goto LABEL_8;
    }
    id v18 = v21;
  }
  if (a6)
  {
    id v18 = v18;
    *a6 = v18;
  }

  v23 = 0;
LABEL_19:

  return v23;
}

- (id)issueSandboxExtensionForURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6
{
  id v7 = a3;
  v8 = [v7 path];
  int v9 = [v7 hasDirectoryPath];

  if (v9)
  {
    uint64_t v10 = [v8 stringByAppendingString:@"/"];

    v8 = (void *)v10;
  }
  id v11 = v8;
  [v11 fileSystemRepresentation];
  v12 = (const char *)sandbox_extension_issue_file();
  if (v12)
  {
    v13 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v12 length:strlen(v12) + 1 freeWhenDone:1];
  }
  else if (a6)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AssetViewer.ARQLSandboxingURLWrapper" code:1 userInfo:0];
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_url forKey:@"NSURL"];
  [v5 encodeObject:self->_scope forKey:@"NSURLScope"];
  promiseURL = self->_promiseURL;
  if (promiseURL)
  {
    [v5 encodeObject:promiseURL forKey:@"NSPromise"];
    [v5 encodeObject:self->_promiseScope forKey:@"NSPromiseScope"];
  }
}

+ (void)assembleURL:(id)a3 sandbox:(id)a4 physicalURL:(id)a5 physicalSandbox:(id)a6
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v12)
  {
    if (v9) {
      MEMORY[0x21D45F4F0](v12, v9);
    }
    if (v10 && v11) {
      MEMORY[0x21D45F4F0](v10, v11);
    }
    _CFURLPromiseSetPhysicalURL();
  }
}

- (ARQLSandboxingURLWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ARQLSandboxingURLWrapper;
  id v5 = [(ARQLSandboxingURLWrapper *)&v18 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NSURL"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NSPromise"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NSURLScope"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NSPromiseScope"];
    [(id)objc_opt_class() assembleURL:v6 sandbox:v8 physicalURL:v7 physicalSandbox:v9];
    url = v5->_url;
    v5->_url = v6;
    id v11 = v6;

    scope = v5->_scope;
    v5->_scope = v8;
    v13 = v8;

    promiseURL = v5->_promiseURL;
    v5->_promiseURL = v7;
    int v15 = v7;

    promiseScope = v5->_promiseScope;
    v5->_promiseScope = (NSData *)v9;
  }
  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_promiseURL, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end