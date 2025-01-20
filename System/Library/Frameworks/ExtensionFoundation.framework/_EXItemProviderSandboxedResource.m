@interface _EXItemProviderSandboxedResource
+ (BOOL)supportsSecureCoding;
- (BOOL)isAccessingSecurityScopedResource;
- (NSData)sandboxExtensionToken;
- (NSURL)resourceURL;
- (_EXItemProviderSandboxedResource)initWithCoder:(id)a3;
- (_EXItemProviderSandboxedResource)initWithContentsOfURL:(id)a3 auditToken:(id *)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)resolveURLAndReturnError:(id *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessingSecurityScopedResource:(BOOL)a3;
- (void)setResourceURL:(id)a3;
- (void)setSandboxExtensionToken:(id)a3;
@end

@implementation _EXItemProviderSandboxedResource

- (_EXItemProviderSandboxedResource)initWithContentsOfURL:(id)a3 auditToken:(id *)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_EXItemProviderSandboxedResource;
  v9 = [(_EXItemProviderSandboxedResource *)&v32 init];
  v10 = v9;
  if (v9)
  {
    [(_EXItemProviderSandboxedResource *)v9 setResourceURL:v8];
    v11 = [(_EXItemProviderSandboxedResource *)v10 resourceURL];
    long long v12 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v33.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v33.val[4] = v12;
    id v13 = v11;
    v14 = _EXLegacyLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      pidp[0] = 0;
      audit_token_t atoken = v33;
      audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, pidp, 0, 0);
      atoken.val[0] = 138412546;
      *(void *)&atoken.val[1] = v13;
      LOWORD(atoken.val[3]) = 1024;
      *(unsigned int *)((char *)&atoken.val[3] + 2) = pidp[0];
    }

    int v15 = [v13 startAccessingSecurityScopedResource];
    id v16 = v13;
    [v16 fileSystemRepresentation];
    audit_token_t atoken = v33;
    v17 = (const char *)sandbox_extension_issue_file_to_process();
    if (v15) {
      [v16 stopAccessingSecurityScopedResource];
    }
    if (v17)
    {
      v18 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v17 length:strlen(v17) + 1 freeWhenDone:1];
      id v19 = 0;
    }
    else
    {
      v21 = NSString;
      v22 = [v16 path];
      v23 = __error();
      v24 = [v21 stringWithFormat:@"Cannot issue a sandbox extension for file \"%@\": %s", v22, strerror(*v23)];

      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28798];
      uint64_t v27 = *__error();
      *(void *)pidp = *MEMORY[0x1E4F28568];
      *(void *)atoken.val = v24;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&atoken forKeys:pidp count:1];
      id v19 = [v25 errorWithDomain:v26 code:v27 userInfo:v28];

      v18 = 0;
    }

    id v29 = v19;
    if (v18)
    {
      [(_EXItemProviderSandboxedResource *)v10 setSandboxExtensionToken:v18];
      v20 = v10;
    }
    else
    {
      v30 = _EXLegacyLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[_EXItemProviderSandboxedResource initWithContentsOfURL:auditToken:error:](v10, (uint64_t)v29, v30);
      }

      v20 = 0;
      if (a5) {
        *a5 = v29;
      }
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  if ([(_EXItemProviderSandboxedResource *)self isAccessingSecurityScopedResource]) {
    [(NSURL *)self->_resourceURL stopAccessingSecurityScopedResource];
  }
  [(_EXItemProviderSandboxedResource *)self setResourceURL:0];
  [(_EXItemProviderSandboxedResource *)self setSandboxExtensionToken:0];
  v3.receiver = self;
  v3.super_class = (Class)_EXItemProviderSandboxedResource;
  [(_EXItemProviderSandboxedResource *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXItemProviderSandboxedResource)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_EXItemProviderSandboxedResource *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resourceURL"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxExtensionToken"];
    id v8 = _EXLegacyLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_EXItemProviderSandboxedResource initWithCoder:]();
    }

    MEMORY[0x192FEAB40](v6, v7);
    -[_EXItemProviderSandboxedResource setAccessingSecurityScopedResource:](v5, "setAccessingSecurityScopedResource:", [v6 startAccessingSecurityScopedResource]);
    BOOL v9 = [(_EXItemProviderSandboxedResource *)v5 isAccessingSecurityScopedResource];
    v10 = v6;
    if (!v9)
    {
      v11 = _EXLegacyLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_EXItemProviderSandboxedResource initWithCoder:]((uint64_t)v6, v11);
      }

      v10 = 0;
    }
    [(_EXItemProviderSandboxedResource *)v5 setResourceURL:v10];
    long long v12 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_EXItemProviderSandboxedResource *)self resourceURL];
  v6 = [(_EXItemProviderSandboxedResource *)self sandboxExtensionToken];
  v7 = _EXLegacyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_EXItemProviderSandboxedResource encodeWithCoder:]();
  }

  [v4 encodeObject:v5 forKey:@"resourceURL"];
  [v4 encodeObject:v6 forKey:@"sandboxExtensionToken"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = [(_EXItemProviderSandboxedResource *)self resourceURL];
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContentsOfURL:v3];

  return v4;
}

- (id)resolveURLAndReturnError:(id *)a3
{
  objc_super v3 = [(_EXItemProviderSandboxedResource *)self resourceURL];
  if ([v3 startAccessingSecurityScopedResource]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (void)setResourceURL:(id)a3
{
}

- (NSData)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
}

- (BOOL)isAccessingSecurityScopedResource
{
  return self->_accessingSecurityScopedResource;
}

- (void)setAccessingSecurityScopedResource:(BOOL)a3
{
  self->_accessingSecurityScopedResource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);

  objc_storeStrong((id *)&self->_resourceURL, 0);
}

- (void)initWithContentsOfURL:(void *)a1 auditToken:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 resourceURL];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_191F29000, a3, OS_LOG_TYPE_ERROR, "Failed to issue sandbox token for URL: '%@' with error: '%@'", (uint8_t *)&v6, 0x16u);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191F29000, a2, OS_LOG_TYPE_ERROR, "Failed to attach sandbox extension to URL: '%@'", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
}

@end