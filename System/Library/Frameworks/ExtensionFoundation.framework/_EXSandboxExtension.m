@interface _EXSandboxExtension
+ (BOOL)sandboxed;
+ (BOOL)supportsSecureCoding;
- (BOOL)consume;
- (NSString)sandboxExtensionToken;
- (_EXSandboxExtension)init;
- (_EXSandboxExtension)initWithCoder:(id)a3;
- (_EXSandboxExtension)initWithExtensionClass:(id)a3 machServiceName:(id)a4 process:(id *)a5;
- (_EXSandboxExtension)initWithURL:(id)a3 readonly:(BOOL)a4;
- (unint64_t)consumedSandboxExtension;
- (void)consume;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConsumedSandboxExtension:(unint64_t)a3;
- (void)setSandboxExtensionToken:(id)a3;
@end

@implementation _EXSandboxExtension

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
}

- (_EXSandboxExtension)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EXSandboxExtension;
  v5 = [(_EXSandboxExtension *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_consumedSandboxExtension = -1;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxExtensionToken"];
    sandboxExtensionToken = v6->_sandboxExtensionToken;
    v6->_sandboxExtensionToken = (NSString *)v7;
  }
  return v6;
}

- (BOOL)consume
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_consumedSandboxExtension = (uint64_t *)&self->_consumedSandboxExtension;
  if (self->_consumedSandboxExtension == -1)
  {
    p_sandboxExtensionToken = &self->_sandboxExtensionToken;
    if ([(NSString *)self->_sandboxExtensionToken UTF8String])
    {
      [(NSString *)*p_sandboxExtensionToken UTF8String];
      uint64_t v5 = sandbox_extension_consume();
      uint64_t *p_consumedSandboxExtension = v5;
      if (v5 != -1)
      {
        v6 = _EXDefaultLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          [(_EXSandboxExtension *)(id *)p_sandboxExtensionToken consume];
        }
        BOOL v3 = 1;
LABEL_14:

        return v3;
      }
    }
    else
    {
      uint64_t v7 = _EXDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[_EXSandboxExtension consume](v7);
      }

      uint64_t *p_consumedSandboxExtension = -1;
    }
    v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(NSString *)*p_sandboxExtensionToken UTF8String];
      int v9 = *__error();
      int v11 = 136446466;
      uint64_t v12 = v8;
      __int16 v13 = 1024;
      int v14 = v9;
    }
    BOOL v3 = 0;
    goto LABEL_14;
  }
  return 1;
}

+ (BOOL)sandboxed
{
  if (sandboxed_onceToken != -1) {
    dispatch_once(&sandboxed_onceToken, &__block_literal_global_11);
  }
  return sandboxed__sandboxed;
}

- (_EXSandboxExtension)initWithExtensionClass:(id)a3 machServiceName:(id)a4 process:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = [(_EXSandboxExtension *)self init];
  if (v10)
  {
    [v8 UTF8String];
    [v9 UTF8String];
    long long v16 = *(_OWORD *)a5->var0;
    long long v17 = *(_OWORD *)&a5->var0[4];
    uint64_t v11 = sandbox_extension_issue_mach_to_process();
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      v10->_consumedSandboxExtension = -1;
      uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", v11, v16, v17);
      sandboxExtensionToken = v10->_sandboxExtensionToken;
      v10->_sandboxExtensionToken = (NSString *)v13;

      free(v12);
    }
  }

  return v10;
}

- (_EXSandboxExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)_EXSandboxExtension;
  result = [(_EXSandboxExtension *)&v3 init];
  if (result) {
    result->_consumedSandboxExtension = -1;
  }
  return result;
}

- (void)dealloc
{
  if (self->_consumedSandboxExtension != -1) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)_EXSandboxExtension;
  [(_EXSandboxExtension *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXSandboxExtension)initWithURL:(id)a3 readonly:(BOOL)a4
{
  id v5 = a3;
  v6 = [(_EXSandboxExtension *)self init];
  if (v6)
  {
    [v5 fileSystemRepresentation];
    uint64_t v7 = sandbox_extension_issue_file();
    if (v7)
    {
      id v8 = (void *)v7;
      v6->_consumedSandboxExtension = -1;
      uint64_t v9 = [NSString stringWithUTF8String:v7];
      sandboxExtensionToken = v6->_sandboxExtensionToken;
      v6->_sandboxExtensionToken = (NSString *)v9;

      free(v8);
    }
  }

  return v6;
}

- (unint64_t)consumedSandboxExtension
{
  return self->_consumedSandboxExtension;
}

- (void)setConsumedSandboxExtension:(unint64_t)a3
{
  self->_consumedSandboxExtension = a3;
}

- (NSString)sandboxExtensionToken
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSandboxExtensionToken:(id)a3
{
}

- (void)consume
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 UTF8String];
  uint64_t v6 = *a2;
  int v7 = 136446466;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = v6;
}

@end