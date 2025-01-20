@interface DEAttachmentItemSandboxExtensionHandle
- (BOOL)didInit;
- (DEAttachmentItemSandboxExtensionHandle)initWithSandboxExtensionToken:(id)a3 itemURL:(id)a4 errorOut:(id *)p_isa;
- (NSURL)itemURL;
- (int64_t)_handle;
- (void)dealloc;
- (void)setDidInit:(BOOL)a3;
- (void)setItemURL:(id)a3;
@end

@implementation DEAttachmentItemSandboxExtensionHandle

- (DEAttachmentItemSandboxExtensionHandle)initWithSandboxExtensionToken:(id)a3 itemURL:(id)a4 errorOut:(id *)p_isa
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    if (!p_isa) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v37[0] = @"nil sandbox extension token. Do not try attempt to consume a token more than once.";
    v13 = (void *)MEMORY[0x1E4F1C9E8];
    v14 = (__CFString **)v37;
    v15 = &v36;
    goto LABEL_13;
  }
  if (!v9)
  {
    if (!p_isa) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35 = @"nil item URL";
    v13 = (void *)MEMORY[0x1E4F1C9E8];
    v14 = &v35;
    v15 = &v34;
LABEL_13:
    v16 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
    v17 = [v12 errorWithDomain:@"DEExtensionErrorDomain" code:0 userInfo:v16];

    id v18 = v17;
    *p_isa = v18;

    goto LABEL_14;
  }
  v31.receiver = self;
  v31.super_class = (Class)DEAttachmentItemSandboxExtensionHandle;
  self = [(DEAttachmentItemSandboxExtensionHandle *)&v31 init];
  if (self)
  {
    [v8 UTF8String];
    self->__handle = sandbox_extension_consume();
    self->_didInit = 1;
    if ([(DEAttachmentItemSandboxExtensionHandle *)self _handle] != -1)
    {
      objc_storeStrong((id *)&self->_itemURL, a4);
      goto LABEL_6;
    }
    if (!p_isa) {
      goto LABEL_15;
    }
    v20 = NSString;
    v21 = [(DEAttachmentItemSandboxExtensionHandle *)self itemURL];
    v22 = [v21 path];
    v23 = __error();
    v24 = strerror(*v23);
    v25 = "Unknown";
    if (v24) {
      v25 = v24;
    }
    v26 = [v20 stringWithFormat:@"Failed to consume extension token for '%@' due to error: %s", v22, v25];

    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33 = v26;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    v29 = [v27 errorWithDomain:@"DEExtensionErrorDomain" code:0 userInfo:v28];

    id v30 = v29;
    *p_isa = v30;

LABEL_14:
    p_isa = 0;
    goto LABEL_15;
  }
LABEL_6:
  v11 = +[DELogging fwHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DEAttachmentItemSandboxExtensionHandle initWithSandboxExtensionToken:itemURL:errorOut:](self);
  }

  self = self;
  p_isa = (id *)&self->super.isa;
LABEL_15:

  return (DEAttachmentItemSandboxExtensionHandle *)p_isa;
}

- (void)dealloc
{
  v1 = [a1 itemURL];
  v2 = [v1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7E51000, v3, v4, "Released sandbox extension handle for file at path '%@'", v5, v6, v7, v8, v9);
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
}

- (BOOL)didInit
{
  return self->_didInit;
}

- (void)setDidInit:(BOOL)a3
{
  self->_didInit = a3;
}

- (int64_t)_handle
{
  return self->__handle;
}

- (void).cxx_destruct
{
}

- (void)initWithSandboxExtensionToken:(void *)a1 itemURL:errorOut:.cold.1(void *a1)
{
  v1 = [a1 itemURL];
  v2 = [v1 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1A7E51000, v3, v4, "Extending sandbox for file at path '%@'", v5, v6, v7, v8, v9);
}

@end