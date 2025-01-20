@interface EFSandboxedURLWrapper
+ (BOOL)supportsSecureCoding;
+ (OS_os_log)log;
- (BOOL)isReadOnly;
- (EFDeallocInvocationToken)invocable;
- (EFSandboxedURLWrapper)initWithCoder:(id)a3;
- (EFSandboxedURLWrapper)initWithFileURL:(id)a3 readOnly:(BOOL)a4;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (NSString)sandboxToken;
- (NSURL)url;
- (void)addInvalidationHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EFSandboxedURLWrapper

- (EFSandboxedURLWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_url"];
  v6 = -[EFSandboxedURLWrapper initWithFileURL:readOnly:](self, "initWithFileURL:readOnly:", v5, [v4 decodeBoolForKey:@"EFPropertyKey_readOnly"]);
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kEFSandboxExtensionToken"];
    sandboxToken = v6->_sandboxToken;
    v6->_sandboxToken = (NSString *)v7;

    v9 = v6->_sandboxToken;
    if (v9) {
      MEMORY[0x1BA9A4C30](v6->_url, [(NSString *)v9 dataUsingEncoding:4]);
    }
  }

  return v6;
}

- (EFSandboxedURLWrapper)initWithFileURL:(id)a3 readOnly:(BOOL)a4
{
  id v6 = a3;
  if ([v6 isFileURL])
  {
    v14.receiver = self;
    v14.super_class = (Class)EFSandboxedURLWrapper;
    uint64_t v7 = [(EFSandboxedURLWrapper *)&v14 init];
    if (v7)
    {
      v8 = objc_alloc_init(EFDeallocInvocationToken);
      invocable = v7->_invocable;
      v7->_invocable = v8;

      uint64_t v10 = [v6 copy];
      url = v7->_url;
      v7->_url = (NSURL *)v10;

      v7->_readOnly = a4;
      objc_setAssociatedObject(v7->_url, v7, v7->_invocable, (void *)0x301);
    }
    self = v7;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(EFSandboxedURLWrapper *)self url];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_url"];

  objc_msgSend(v4, "encodeBool:forKey:", -[EFSandboxedURLWrapper isReadOnly](self, "isReadOnly"), @"EFPropertyKey_readOnly");
  long long v28 = 0u;
  long long v29 = 0u;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 connection];
    uint64_t v7 = v6;
    if (v6) {
      [v6 auditToken];
    }
    else {
      memset(buf, 0, 32);
    }
    long long v28 = *(_OWORD *)buf;
    long long v29 = *(_OWORD *)&buf[16];
  }
  v8 = [(EFSandboxedURLWrapper *)self url];
  int v9 = [v8 startAccessingSecurityScopedResource];
  BOOL v10 = [(EFSandboxedURLWrapper *)self isReadOnly];
  id v11 = v8;
  if (v11
    && (getpid(),
        uint64_t v24 = [v11 fileSystemRepresentation],
        !sandbox_check()))
  {
    v13 = (uint64_t *)MEMORY[0x1E4F14000];
    if (!v10) {
      v13 = (uint64_t *)MEMORY[0x1E4F14008];
    }
    uint64_t v12 = *v13;
  }
  else
  {
    uint64_t v12 = 0;
  }

  long long v25 = v28;
  long long v26 = v29;
  id v14 = v11;
  if (!v12)
  {
LABEL_24:

    v19 = 0;
    if (!v9) {
      goto LABEL_26;
    }
LABEL_25:
    objc_msgSend(v14, "stopAccessingSecurityScopedResource", v24);
    goto LABEL_26;
  }
  memset(v27, 0, sizeof(v27));
  BOOL v15 = bcmp(&v25, v27, 0x20uLL) == 0;
  id v16 = v14;
  [v16 fileSystemRepresentation];
  if (v15)
  {
    uint64_t v17 = sandbox_extension_issue_file();
  }
  else
  {
    *(_OWORD *)buf = v25;
    *(_OWORD *)&buf[16] = v26;
    uint64_t v17 = sandbox_extension_issue_file_to_process();
  }
  v18 = (void *)v17;
  if (!v17)
  {
    int v20 = *__error();
    v21 = __error();
    v22 = strerror(*v21);
    v23 = +[EFSandboxedURLWrapper log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v20;
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = v22;
      _os_log_error_impl(&dword_1B5A59000, v23, OS_LOG_TYPE_ERROR, "unable to issue sandbox extension %{public}s for URL %@: (%d) %{public}s", buf, 0x26u);
    }

    goto LABEL_24;
  }
  v19 = [NSString stringWithUTF8String:v17];
  free(v18);

  if (v19) {
    [v4 encodeObject:v19 forKey:@"kEFSandboxExtensionToken"];
  }
  if (v9) {
    goto LABEL_25;
  }
LABEL_26:
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxToken, 0);
  objc_storeStrong((id *)&self->_invocable, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__EFSandboxedURLWrapper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_5 != -1) {
    dispatch_once(&log_onceToken_5, block);
  }
  v2 = (void *)log_log_5;
  return (OS_os_log *)v2;
}

void __28__EFSandboxedURLWrapper_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_5;
  log_log_5 = (uint64_t)v1;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EFSandboxedURLWrapper *)self url];
  BOOL v6 = [(EFSandboxedURLWrapper *)self isReadOnly];
  uint64_t v7 = [(EFSandboxedURLWrapper *)self sandboxToken];
  v8 = [v3 stringWithFormat:@"<%@: %p> url=%@, readOnly=%d, token=%@, invocable=%@", v4, self, v5, v6, v7, self->_invocable];

  return (NSString *)v8;
}

- (NSString)ef_publicDescription
{
  id v3 = +[EFDevice currentDevice];
  int v4 = [v3 isInternal];

  if (v4)
  {
    v5 = [(EFSandboxedURLWrapper *)self debugDescription];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)EFSandboxedURLWrapper;
    BOOL v6 = [(EFSandboxedURLWrapper *)&v10 description];
    uint64_t v7 = [(EFSandboxedURLWrapper *)self sandboxToken];
    v8 = @"YES";
    if (!v7) {
      v8 = @"NO";
    }
    v5 = [v6 stringByAppendingFormat:@" has-token=%@", v8];
  }
  return (NSString *)v5;
}

- (void)addInvalidationHandler:(id)a3
{
}

- (EFDeallocInvocationToken)invocable
{
  return self->_invocable;
}

- (NSString)sandboxToken
{
  return self->_sandboxToken;
}

@end