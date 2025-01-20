@interface FPSandboxingURLWrapper
+ (BOOL)supportsSecureCoding;
+ (FPSandboxingURLWrapper)wrapperWithSecurityScopedURL:(id)a3;
+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3;
+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 error:(id *)a5;
+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6;
+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 readonly:(BOOL)a4;
+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 readonly:(BOOL)a4 error:(id *)a5;
+ (void)assembleURL:(id)a3 sandbox:(id)a4 physicalURL:(id)a5 physicalSandbox:(id)a6;
- (FPSandboxingURLWrapper)init;
- (FPSandboxingURLWrapper)initWithCoder:(id)a3;
- (FPSandboxingURLWrapper)initWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6;
- (FPSandboxingURLWrapper)originalDocumentURLWrapper;
- (NSData)promiseScope;
- (NSData)scope;
- (NSURL)promiseURL;
- (NSURL)url;
- (id)_init;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)init;
- (void)setOriginalDocumentURLWrapper:(id)a3;
- (void)setPromiseScope:(id)a3;
- (void)setPromiseURL:(id)a3;
- (void)setScope:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation FPSandboxingURLWrapper

+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  v5 = (void *)MEMORY[0x1E4F14000];
  if (!a4) {
    v5 = (void *)MEMORY[0x1E4F14008];
  }
  return (FPSandboxingURLWrapper *)[a1 wrapperWithURL:a3 extensionClass:*v5 error:a5];
}

+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithURL:v10 extensionClass:a4 report:v7 error:a6];

  return (FPSandboxingURLWrapper *)v11;
}

- (FPSandboxingURLWrapper)initWithURL:(id)a3 extensionClass:(const char *)a4 report:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v12 = a3;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"FPSandboxingURLWrapper.m" lineNumber:78 description:@"tried to create wrapper with nil url"];
  }
  v41.receiver = self;
  v41.super_class = (Class)FPSandboxingURLWrapper;
  v14 = [(FPSandboxingURLWrapper *)&v41 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_url, a3);
    v16 = (void *)_CFURLPromiseCopyPhysicalURL();
    if (([v12 isEqual:v16] & 1) == 0) {
      objc_storeStrong((id *)&v15->_promiseURL, v16);
    }
    int v17 = [v12 startAccessingSecurityScopedResource];
    int v35 = [v16 startAccessingSecurityScopedResource];
    id v40 = 0;
    uint64_t v18 = objc_msgSend(v12, "fp_issueSandboxExtensionOfClass:report:error:", a4, v7, &v40);
    id v19 = v40;
    scope = v15->_scope;
    v15->_scope = (NSData *)v18;

    if (v15->_scope)
    {
      if (!v16) {
        goto LABEL_10;
      }
      id v39 = v19;
      uint64_t v21 = objc_msgSend(v16, "fp_issueSandboxExtensionOfClass:report:error:", a4, v7, &v39);
      id v22 = v39;

      promiseScope = v15->_promiseScope;
      v15->_promiseScope = (NSData *)v21;

      if (v15->_promiseScope)
      {
        id v19 = v22;
LABEL_10:
        url = v15->_url;
        id v38 = 0;
        id v37 = 0;
        BOOL v25 = [(NSURL *)url getResourceValue:&v38 forKey:@"FPOriginalDocumentURL" error:&v37];
        id v26 = v38;
        id v27 = v37;
        if (v25 && v26)
        {
          id v36 = v27;
          uint64_t v28 = +[FPSandboxingURLWrapper wrapperWithURL:v26 readonly:0 error:&v36];
          id v29 = v36;

          originalDocumentURLWrapper = v15->_originalDocumentURLWrapper;
          v15->_originalDocumentURLWrapper = (FPSandboxingURLWrapper *)v28;

          id v27 = v29;
        }
        if (v17) {
          [v12 stopAccessingSecurityScopedResource];
        }
        if (v35) {
          [v16 stopAccessingSecurityScopedResource];
        }

        goto LABEL_19;
      }
      v34 = fp_current_or_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[FPSandboxingURLWrapper initWithURL:extensionClass:report:error:]();
      }

      id v19 = v22;
      if (!a6)
      {
LABEL_24:

        v31 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      v32 = fp_current_or_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[FPSandboxingURLWrapper initWithURL:extensionClass:report:error:]();
      }

      if (!a6) {
        goto LABEL_24;
      }
    }
    id v19 = v19;
    *a6 = v19;
    goto LABEL_24;
  }
  id v19 = 0;
LABEL_19:
  v31 = v15;
LABEL_25:

  return v31;
}

+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 extensionClass:(const char *)a4 error:(id *)a5
{
  return (FPSandboxingURLWrapper *)[a1 wrapperWithURL:a3 extensionClass:a4 report:1 error:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FPSandboxingURLWrapper *)self url];
  [v4 encodeObject:v5 forKey:@"NSURL"];

  v6 = [(FPSandboxingURLWrapper *)self scope];
  [v4 encodeObject:v6 forKey:@"NSURLScope"];

  BOOL v7 = [(FPSandboxingURLWrapper *)self promiseURL];

  if (v7)
  {
    v8 = [(FPSandboxingURLWrapper *)self promiseURL];
    [v4 encodeObject:v8 forKey:@"NSPromise"];

    v9 = [(FPSandboxingURLWrapper *)self promiseScope];
    [v4 encodeObject:v9 forKey:@"NSPromiseScope"];
  }
  id v10 = [(FPSandboxingURLWrapper *)self originalDocumentURLWrapper];

  if (!v10)
  {
    v11 = [(FPSandboxingURLWrapper *)self url];
    id v20 = 0;
    id v21 = 0;
    int v12 = [v11 getResourceValue:&v21 forKey:@"FPOriginalDocumentURL" error:&v20];
    id v13 = v21;
    id v14 = v20;

    if (v12 && v13)
    {
      id v19 = v14;
      v15 = +[FPSandboxingURLWrapper wrapperWithURL:v13 readonly:0 error:&v19];
      id v16 = v19;

      [(FPSandboxingURLWrapper *)self setOriginalDocumentURLWrapper:v15];
      id v14 = v16;
    }
  }
  int v17 = [(FPSandboxingURLWrapper *)self originalDocumentURLWrapper];

  if (v17)
  {
    uint64_t v18 = [(FPSandboxingURLWrapper *)self originalDocumentURLWrapper];
    [v4 encodeObject:v18 forKey:@"FPOriginalDocumentURL"];
  }
}

- (NSURL)url
{
  return self->_url;
}

- (FPSandboxingURLWrapper)originalDocumentURLWrapper
{
  return (FPSandboxingURLWrapper *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)scope
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)promiseURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (FPSandboxingURLWrapper)initWithCoder:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FPSandboxingURLWrapper;
  v6 = [(FPSandboxingURLWrapper *)&v16 init];
  if (v6)
  {
    BOOL v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"NSURL"];
    v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"NSPromise"];
    v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"FPOriginalDocumentURL"];
    id v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"NSURLScope"];
    v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"NSPromiseScope"];
    [(id)objc_opt_class() assembleURL:v7 sandbox:v10 physicalURL:v8 physicalSandbox:v11];
    if (!v7)
    {
      int v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:v6 file:@"FPSandboxingURLWrapper.m" lineNumber:207 description:@"tried to unarchive a wrapper with nil url"];
    }
    [(FPSandboxingURLWrapper *)v6 setUrl:v7];
    [(FPSandboxingURLWrapper *)v6 setScope:v10];
    [(FPSandboxingURLWrapper *)v6 setPromiseURL:v8];
    [(FPSandboxingURLWrapper *)v6 setPromiseScope:v11];
    [(FPSandboxingURLWrapper *)v6 setOriginalDocumentURLWrapper:v9];
    if (v9)
    {
      id v13 = [(FPSandboxingURLWrapper *)v6 url];
      id v14 = [v9 url];
      [v13 setTemporaryResourceValue:v14 forKey:@"FPOriginalDocumentURL"];
    }
  }

  return v6;
}

- (void)setUrl:(id)a3
{
}

- (void)setScope:(id)a3
{
}

- (void)setPromiseURL:(id)a3
{
}

- (void)setPromiseScope:(id)a3
{
}

- (void)setOriginalDocumentURLWrapper:(id)a3
{
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
      MEMORY[0x1A6247C60](v12, v9);
    }
    if (v10 && v11) {
      MEMORY[0x1A6247C60](v10, v11);
    }
    _CFURLPromiseSetPhysicalURL();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalDocumentURLWrapper, 0);
  objc_storeStrong((id *)&self->_promiseURL, 0);
  objc_storeStrong((id *)&self->_promiseScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (FPSandboxingURLWrapper)init
{
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[FPSandboxingURLWrapper init](v3);
  }

  v5.receiver = self;
  v5.super_class = (Class)FPSandboxingURLWrapper;
  return [(FPSandboxingURLWrapper *)&v5 init];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)FPSandboxingURLWrapper;
  return [(FPSandboxingURLWrapper *)&v3 init];
}

+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3
{
  return (FPSandboxingURLWrapper *)[a1 wrapperWithURL:a3 readonly:0];
}

+ (FPSandboxingURLWrapper)wrapperWithURL:(id)a3 readonly:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v13 = 0;
  v8 = [a1 wrapperWithURL:v7 readonly:v4 error:&v13];
  id v9 = v13;
  if (!v8)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = objc_msgSend(v7, "fp_shortDescription");
    [v10 handleFailureInMethod:a2, a1, @"FPSandboxingURLWrapper.m", 55, @"nil wrapper returned for url %@: %@", v11, v9 object file lineNumber description];
  }

  return (FPSandboxingURLWrapper *)v8;
}

+ (FPSandboxingURLWrapper)wrapperWithSecurityScopedURL:(id)a3
{
  id v5 = a3;
  id v6 = [[FPSandboxingURLWrapper alloc] _init];
  [v6 setUrl:v5];
  id v7 = (void *)MEMORY[0x1A6247CA0](v5);

  [v6 setScope:v7];
  v8 = [v6 url];
  id v21 = 0;
  id v20 = 0;
  int v9 = [v8 getResourceValue:&v21 forKey:@"FPOriginalDocumentURL" error:&v20];
  id v10 = v21;
  id v11 = v20;

  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    id v19 = v11;
    id v13 = +[FPSandboxingURLWrapper wrapperWithURL:v10 readonly:0 error:&v19];
    id v14 = v19;

    [v6 setOriginalDocumentURLWrapper:v13];
    id v11 = v14;
  }
  v15 = [v6 scope];

  if (!v15)
  {
    objc_super v16 = [v6 scope];

    if (!v16)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:a1 file:@"FPSandboxingURLWrapper.m" lineNumber:136 description:@"missing security scope"];
    }
  }

  return (FPSandboxingURLWrapper *)v6;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FPSandboxingURLWrapper *)self url];
  id v6 = objc_msgSend(v5, "fp_shortDescription");
  id v7 = [(FPSandboxingURLWrapper *)self promiseURL];
  v8 = objc_msgSend(v7, "fp_shortDescription");
  int v9 = [v3 stringWithFormat:@"<%@: %p url: %@ promiseURL: %@>", v4, self, v6, v8];

  return v9;
}

- (NSData)promiseScope
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] -init called on FPSandboxingURLWrapper. This will result in a partially uninitialized object.", v1, 2u);
}

- (void)initWithURL:extensionClass:report:error:.cold.1()
{
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] Could not issue %s sandbox extension (%@).");
}

@end