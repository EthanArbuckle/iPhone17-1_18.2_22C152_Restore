@interface CXSandboxExtendedURL
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSandboxExtendedURL:(id)a3;
- (CXSandboxExtendedURL)init;
- (CXSandboxExtendedURL)initWithCoder:(id)a3;
- (CXSandboxExtendedURL)initWithURL:(id)a3;
- (NSString)sandboxExtensionToken;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)sandboxExtensionHandle;
- (unint64_t)hash;
- (void)URL;
- (void)encodeWithCoder:(id)a3;
- (void)setSandboxExtensionHandle:(int64_t)a3;
- (void)setSandboxExtensionToken:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation CXSandboxExtendedURL

- (CXSandboxExtendedURL)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CXSandboxExtendedURL;
  v6 = [(CXSandboxExtendedURL *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_URL, a3);
  }

  return v7;
}

- (CXSandboxExtendedURL)init
{
  return 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  URL = self->_URL;
  v6 = [(CXSandboxExtendedURL *)self sandboxExtensionToken];
  v7 = [v3 stringWithFormat:@"<%@ %p URL=%@ sandboxExtensionToken=%@ sandboxExtensionHandle=%lld>", v4, self, URL, v6, -[CXSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle")];

  return v7;
}

- (NSURL)URL
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CXSandboxExtendedURL *)self sandboxExtensionToken];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    int64_t v5 = [(CXSandboxExtendedURL *)self sandboxExtensionHandle];

    if (!v5)
    {
      id v6 = [(CXSandboxExtendedURL *)self sandboxExtensionToken];
      [v6 UTF8String];
      [(CXSandboxExtendedURL *)self setSandboxExtensionHandle:sandbox_extension_consume()];

      uint64_t v7 = [(CXSandboxExtendedURL *)self sandboxExtensionHandle];
      v8 = CXDefaultLog();
      objc_super v9 = v8;
      if (v7 < 1)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(CXSandboxExtendedURL *)self URL];
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        URL = self->_URL;
        int v13 = 138412290;
        v14 = URL;
        _os_log_impl(&dword_1A6E3A000, v9, OS_LOG_TYPE_DEFAULT, "Successfully consumed sandbox extension for URL %@", (uint8_t *)&v13, 0xCu);
      }

      [(CXSandboxExtendedURL *)self setSandboxExtensionToken:0];
    }
  }
  v11 = self->_URL;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CXSandboxExtendedURL *)self isEqualToSandboxExtendedURL:v4];

  return v5;
}

- (BOOL)isEqualToSandboxExtendedURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXSandboxExtendedURL *)self URL];
  uint64_t v6 = [v4 URL];
  if (v5 | v6 && ![(id)v5 isEqual:v6])
  {
    BOOL v10 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [(CXSandboxExtendedURL *)self sandboxExtensionToken];
  v8 = [v4 sandboxExtensionToken];
  if (!v8)
  {
    if (!v7) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  if (([v7 isEqualToString:v8] & 1) == 0) {
    goto LABEL_7;
  }
LABEL_5:
  int64_t v9 = [(CXSandboxExtendedURL *)self sandboxExtensionHandle];
  BOOL v10 = v9 == [v4 sandboxExtensionHandle];
LABEL_8:

LABEL_10:
  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CXSandboxExtendedURL *)self URL];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(CXSandboxExtendedURL *)self sandboxExtensionToken];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(CXSandboxExtendedURL *)self sandboxExtensionHandle];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(CXSandboxExtendedURL *)self URL];
  uint64_t v6 = (void *)[v4 initWithURL:v5];

  unint64_t v7 = [(CXSandboxExtendedURL *)self sandboxExtensionToken];
  [v6 setSandboxExtensionToken:v7];

  objc_msgSend(v6, "setSandboxExtensionHandle:", -[CXSandboxExtendedURL sandboxExtensionHandle](self, "sandboxExtensionHandle"));
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSandboxExtendedURL)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector("URL");
  unint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];
  v8 = [(CXSandboxExtendedURL *)self initWithURL:v7];

  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    BOOL v10 = NSStringFromSelector(sel_sandboxExtensionToken);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    sandboxExtensionToken = v8->_sandboxExtensionToken;
    v8->_sandboxExtensionToken = (NSString *)v11;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXSandboxExtendedURL *)self URL];
  uint64_t v6 = NSStringFromSelector("URL");
  [v4 encodeObject:v5 forKey:v6];

  unint64_t v7 = [(CXSandboxExtendedURL *)self URL];
  id v8 = [v7 path];
  [v8 fileSystemRepresentation];
  uint64_t v9 = (void *)sandbox_extension_issue_file();

  if (v9)
  {
    BOOL v10 = [NSString stringWithUTF8String:v9];
    uint64_t v11 = NSStringFromSelector(sel_sandboxExtensionToken);
    [v4 encodeObject:v10 forKey:v11];

    free(v9);
  }
  else
  {
    v12 = CXDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CXSandboxExtendedURL encodeWithCoder:](self, v12);
    }
  }
}

- (void)setURL:(id)a3
{
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (NSString)sandboxExtensionToken
{
  return self->_sandboxExtensionToken;
}

- (void)setSandboxExtensionToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionToken, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)URL
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 sandboxExtensionToken];
  int v5 = 138412546;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a1 sandboxExtensionHandle];
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Unable to consume sandbox extension with token %@, received handle %lld", (uint8_t *)&v5, 0x16u);
}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 URL];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Unable to issue sandbox extension for URL %@", (uint8_t *)&v4, 0xCu);
}

@end