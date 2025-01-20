@interface IMSandboxedResource
+ (BOOL)supportsSecureCoding;
+ (Class)resourceClass;
- (BOOL)accessResourceByConsumingSandboxExtensionWithBlock:(id)a3;
- (IMSandboxedResource)initWithCoder:(id)a3;
- (NSString)sandboxExtension;
- (char)_sandboxExtensionForAuditToken:(id *)a3;
- (char)_sandboxExtensionForPID:(int)a3;
- (id)description;
- (id)resource;
- (int64_t)sandboxExtensionHandle;
- (void)authorizeForAuditToken:(id *)a3;
- (void)authorizeForPID:(int)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setResource:(id)a3;
- (void)setSandboxExtension:(id)a3;
- (void)setSandboxExtensionHandle:(int64_t)a3;
@end

@implementation IMSandboxedResource

- (id)description
{
  v3 = NSString;
  v4 = [(IMSandboxedResource *)self resource];
  v5 = [(IMSandboxedResource *)self sandboxExtension];
  v6 = @"YES";
  if (!v5) {
    v6 = @"NO";
  }
  v7 = [v3 stringWithFormat:@"<IMSandboxedResource resource: %@ hasSandboxExtension: %@>", v4, v6];

  return v7;
}

- (void)dealloc
{
  if (self->_sandboxExtensionHandle >= 1)
  {
    sandbox_extension_release();
    self->_sandboxExtensionHandle = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)IMSandboxedResource;
  [(IMSandboxedResource *)&v3 dealloc];
}

- (void)authorizeForPID:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = -[IMSandboxedResource _sandboxExtensionForPID:](self, "_sandboxExtensionForPID:");
  if (v5)
  {
    v6 = v5;
    v7 = [NSString stringWithUTF8String:v5];
    sandboxExtension = self->_sandboxExtension;
    self->_sandboxExtension = v7;

    free(v6);
  }
  else if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      uint64_t v11 = a3;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Unable to obtain sandbox extension for PID: %llu", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)authorizeForAuditToken:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v4;
  v5 = [(IMSandboxedResource *)self _sandboxExtensionForAuditToken:v10];
  if (v5)
  {
    v6 = v5;
    v7 = [NSString stringWithUTF8String:v5];
    sandboxExtension = self->_sandboxExtension;
    self->_sandboxExtension = v7;

    free(v6);
  }
  else if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Unable to obtain sandbox extension for auditToken", (uint8_t *)v10, 2u);
    }
  }
}

- (BOOL)accessResourceByConsumingSandboxExtensionWithBlock:(id)a3
{
  *(void *)&v17[5] = *MEMORY[0x1E4F143B8];
  long long v4 = (void (**)(id, void *))a3;
  v5 = [(IMSandboxedResource *)self sandboxExtension];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_11:
      BOOL v9 = 0;
      goto LABEL_12;
    }
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [(IMSandboxedResource *)self resource];
      int v16 = 138412290;
      *(void *)v17 = v11;
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Unable to access protected resource (missing sandbox extension): %@", (uint8_t *)&v16, 0xCu);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!self->_sandboxExtensionHandle)
  {
    [(NSString *)self->_sandboxExtension UTF8String];
    int64_t v7 = sandbox_extension_consume();
    self->_sandboxExtensionHandle = v7;
    if (v7 == -1)
    {
      sandboxExtension = self->_sandboxExtension;
      self->_sandboxExtension = 0;

      self->_sandboxExtensionHandle = 0;
      if (!IMOSLoggingEnabled()) {
        goto LABEL_11;
      }
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v14 = *__error();
        v15 = [(IMSandboxedResource *)self resource];
        int v16 = 67109378;
        v17[0] = v14;
        LOWORD(v17[1]) = 2112;
        *(void *)((char *)&v17[1] + 2) = v15;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Unable to access protected resource, error: %d resource: %@", (uint8_t *)&v16, 0x12u);
      }
      goto LABEL_10;
    }
  }
  if (v4)
  {
    v8 = [(IMSandboxedResource *)self resource];
    v4[2](v4, v8);
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

+ (Class)resourceClass
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  long long v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is not implemented", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (char)_sandboxExtensionForPID:(int)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"%@ is not implemented", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (char)_sandboxExtensionForAuditToken:(id *)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  id v7 = [v5 stringWithFormat:@"%@ is not implemented", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(IMSandboxedResource *)self sandboxExtension];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      uint64_t v13 = sub_1A07A445C;
      int v14 = &unk_1E5A101A8;
      v15 = self;
      id v16 = v5;
      [(IMSandboxedResource *)self accessResourceByConsumingSandboxExtensionWithBlock:&v11];
    }
    else
    {
      id v8 = [v5 connection];
      -[IMSandboxedResource authorizeForPID:](self, "authorizeForPID:", [v8 processIdentifier]);
    }
  }
  BOOL v9 = [(IMSandboxedResource *)self sandboxExtension];
  [v4 encodeObject:v9 forKey:@"sandboxExtension"];

  int v10 = [(IMSandboxedResource *)self resource];
  [v4 encodeObject:v10 forKey:@"resource"];
}

- (IMSandboxedResource)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IMSandboxedResource *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxExtension"];
    sandboxExtension = v5->_sandboxExtension;
    v5->_sandboxExtension = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_msgSend((id)objc_opt_class(), "resourceClass"), @"resource");
    id resource = v5->_resource;
    v5->_id resource = (id)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)sandboxExtensionHandle
{
  return self->_sandboxExtensionHandle;
}

- (void)setSandboxExtensionHandle:(int64_t)a3
{
  self->_sandboxExtensionHandle = a3;
}

- (id)resource
{
  return self->_resource;
}

- (void)setResource:(id)a3
{
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (void)setSandboxExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtension, 0);

  objc_storeStrong(&self->_resource, 0);
}

@end