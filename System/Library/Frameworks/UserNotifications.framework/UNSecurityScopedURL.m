@interface UNSecurityScopedURL
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsDirectEncoding;
- (UNSecurityScopedURL)initWithCoder:(id)a3;
- (id)_issueSandboxExtension;
- (id)initFileURLWithPath:(id)a3 sandboxExtensionClass:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNSecurityScopedURL

- (id)initFileURLWithPath:(id)a3 sandboxExtensionClass:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UNSecurityScopedURL;
  v7 = [(UNSecurityScopedURL *)&v11 initFileURLWithPath:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    v9 = (void *)v7[5];
    v7[5] = v8;
  }
  return v7;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (id)_issueSandboxExtension
{
  if ([(NSString *)self->_sandboxExtensionClass length])
  {
    v3 = [(UNSecurityScopedURL *)self path];
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v5 = [v4 fileExistsAtPath:v3];

    if (v5)
    {
      id v6 = [(NSString *)self->_sandboxExtensionClass cStringUsingEncoding:1];
      uint64_t v7 = [(UNSecurityScopedURL *)self fileSystemRepresentation];
      if (v6 && v7 != 0)
      {
        v9 = (const char *)sandbox_extension_issue_file();
        v10 = (void *)v9;
        if (!v9)
        {
LABEL_10:

          goto LABEL_12;
        }
        size_t v11 = strnlen(v9, 0x400uLL);
        if (v11 <= 0x3FF)
        {
          v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v10 length:v11 + 1];
          goto LABEL_10;
        }
      }
    }
    v10 = 0;
    goto LABEL_10;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UNSecurityScopedURL;
  [(UNSecurityScopedURL *)&v6 encodeWithCoder:v4];
  int v5 = [(UNSecurityScopedURL *)self _issueSandboxExtension];
  if (!v5) {
    int v5 = (void *)MEMORY[0x1B3E70210](self);
  }
  [v4 encodeObject:v5 forKey:@"sandboxExtension"];
}

- (UNSecurityScopedURL)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UNSecurityScopedURL;
  int v5 = [(UNSecurityScopedURL *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxExtension"];
    MEMORY[0x1B3E70200](v5, v6);
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end