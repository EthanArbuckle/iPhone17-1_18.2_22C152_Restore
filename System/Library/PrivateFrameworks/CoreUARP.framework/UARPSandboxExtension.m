@interface UARPSandboxExtension
+ (id)readWriteTokenStringWithURL:(id)a3;
- (UARPSandboxExtension)initWithTokenString:(id)a3;
- (void)dealloc;
@end

@implementation UARPSandboxExtension

+ (id)readWriteTokenStringWithURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = [v3 path];
    [v7 UTF8String];
    v8 = (void *)sandbox_extension_issue_file();

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      v12 = "+[UARPSandboxExtension readWriteTokenStringWithURL:]";
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: Generating Read-Write Sandbox Extension Token for %@ ", (uint8_t *)&v11, 0x16u);
    }
    if (v8)
    {
      v9 = [NSString stringWithUTF8String:v8];
      free(v8);
      goto LABEL_9;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[UARPSandboxExtension readWriteTokenStringWithURL:]((uint64_t)v3);
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (UARPSandboxExtension)initWithTokenString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UARPSandboxExtension;
  v5 = [(UARPSandboxExtension *)&v9 init];
  if (v5
    && ([v4 UTF8String],
        uint64_t v6 = sandbox_extension_consume(),
        v5->_sandboxExtensionHandle = v6,
        v6 == -1))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[UARPSandboxExtension initWithTokenString:]();
    }
    id v7 = 0;
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (void)dealloc
{
  if (self->_sandboxExtensionHandle != -1)
  {
    sandbox_extension_release();
    self->_sandboxExtensionHandle = -1;
  }
  v3.receiver = self;
  v3.super_class = (Class)UARPSandboxExtension;
  [(UARPSandboxExtension *)&v3 dealloc];
}

+ (void)readWriteTokenStringWithURL:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  v2 = "+[UARPSandboxExtension readWriteTokenStringWithURL:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Cannot Generate Sandbox Extension Token for %@ ", (uint8_t *)&v1, 0x16u);
}

- (void)initWithTokenString:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  int v1 = "-[UARPSandboxExtension initWithTokenString:]";
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: failed to cosume sandbox token", (uint8_t *)&v0, 0xCu);
}

@end