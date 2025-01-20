@interface DCSandboxExtension
+ (BOOL)supportsSecureCoding;
- (BOOL)canAccessFileURL;
- (BOOL)shouldIssueSandboxExtensionWhenEncoding;
- (DCSandboxExtension)initWithCoder:(id)a3;
- (DCSandboxExtension)initWithFileURL:(id)a3;
- (NSURL)fileURL;
- (int64_t)sandboxExtensionHandle;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)relinquish;
- (void)setSandboxExtensionHandle:(int64_t)a3;
@end

@implementation DCSandboxExtension

- (DCSandboxExtension)initWithFileURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DCSandboxExtension;
  v6 = [(DCSandboxExtension *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_canAccessFileURL = 1;
    objc_storeStrong((id *)&v6->_fileURL, a3);
    v7->_shouldIssueSandboxExtensionWhenEncoding = 1;
    [(DCSandboxExtension *)v7 setSandboxExtensionHandle:-1];
  }

  return v7;
}

- (void)relinquish
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "FAILED to release sandbox extension handle: %@", (uint8_t *)&v2, 0xCu);
}

- (void)dealloc
{
  [(DCSandboxExtension *)self relinquish];
  v3.receiver = self;
  v3.super_class = (Class)DCSandboxExtension;
  [(DCSandboxExtension *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCSandboxExtension)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DCSandboxExtension;
  id v5 = [(DCSandboxExtension *)&v22 init];
  v6 = v5;
  if (v5)
  {
    v5->_canAccessFileURL = 0;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFileURLFieldCodingKey"];
    fileURL = v6->_fileURL;
    v6->_fileURL = (NSURL *)v7;

    v6->_shouldIssueSandboxExtensionWhenEncoding = 0;
    objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSandboxExtensionTokenCodingKey"];
    v10 = (void *)[v9 mutableCopy];

    if (v10)
    {
      [v10 increaseLengthBy:1];
      id v11 = v10;
      [v11 bytes];
      [(DCSandboxExtension *)v6 setSandboxExtensionHandle:sandbox_extension_consume()];
      if ([(DCSandboxExtension *)v6 sandboxExtensionHandle] != -1)
      {
        v12 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = [(DCSandboxExtension *)v6 fileURL];
          *(_DWORD *)buf = 138412290;
          v24 = v13;
          _os_log_impl(&dword_217885000, v12, OS_LOG_TYPE_INFO, "Consumed sandbox extension for %@", buf, 0xCu);
        }
        v6->_canAccessFileURL = 1;
        goto LABEL_13;
      }
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F08438];
      uint64_t v17 = *__error();
      v25[0] = @"sandboxExtensionToken";
      v25[1] = @"file";
      v26[0] = v11;
      v18 = [(DCSandboxExtension *)v6 fileURL];
      v26[1] = v18;
      v19 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
      v14 = [v15 errorWithDomain:v16 code:v17 userInfo:v19];

      v20 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[DCSandboxExtension initWithCoder:]((uint64_t)v14, v20);
      }
    }
    else
    {
      v14 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[DCSandboxExtension initWithCoder:](v14);
      }
    }

LABEL_13:
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(DCSandboxExtension *)self shouldIssueSandboxExtensionWhenEncoding])
  {
    id v5 = [(DCSandboxExtension *)self fileURL];
    id v6 = [v5 path];
    [v6 cStringUsingEncoding:4];

    uint64_t v7 = (const char *)sandbox_extension_issue_file();
    if (v7)
    {
      v8 = (char *)v7;
      objc_super v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:strlen(v7)];
      free(v8);
      v10 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [(DCSandboxExtension *)self fileURL];
        int v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_217885000, v10, OS_LOG_TYPE_INFO, "Issued sandbox extension for %@", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      v10 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[DCSandboxExtension encodeWithCoder:](self, v10);
      }
      objc_super v9 = 0;
    }

    [v4 encodeObject:v9 forKey:@"kSandboxExtensionTokenCodingKey"];
  }
  else
  {
    [v4 encodeObject:0 forKey:@"kSandboxExtensionTokenCodingKey"];
  }
  v12 = [(DCSandboxExtension *)self fileURL];
  [v4 encodeObject:v12 forKey:@"kFileURLFieldCodingKey"];
}

- (BOOL)canAccessFileURL
{
  return self->_canAccessFileURL;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)shouldIssueSandboxExtensionWhenEncoding
{
  return self->_shouldIssueSandboxExtensionWhenEncoding;
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "FAILED to consume sandbox extension: no extension token found", v1, 2u);
}

- (void)initWithCoder:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "FAILED to consume sandbox extension: %@", (uint8_t *)&v2, 0xCu);
}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 fileURL];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "FAILED to issue sandbox extension for %@", (uint8_t *)&v4, 0xCu);
}

@end