@interface DIBaseAgentXPCHandler
- (void)createConnection;
@end

@implementation DIBaseAgentXPCHandler

- (void)createConnection
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = [(DIBaseXPCHandler *)self isPrivileged];
  v4 = [(DIBaseXPCHandler *)self serviceName];
  v5 = [v4 stringByAppendingString:@".xpc"];

  int v6 = *__error();
  if (DIForwardLogs())
  {
    v7 = getDIOSLog();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    int v15 = 41;
    __int16 v16 = 2080;
    v17 = "-[DIBaseAgentXPCHandler createConnection]";
    __int16 v18 = 2114;
    v19 = v5;
    v8 = (char *)_os_log_send_and_compose_impl();

    if (v8)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v8);
      free(v8);
    }
  }
  else
  {
    v9 = getDIOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v15 = 41;
      __int16 v16 = 2080;
      v17 = "-[DIBaseAgentXPCHandler createConnection]";
      __int16 v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_21E237000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection to %{public}@", buf, 0x1Cu);
    }
  }
  if (v3) {
    uint64_t v10 = 4096;
  }
  else {
    uint64_t v10 = 0;
  }
  *__error() = v6;
  v11 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v5 options:v10];
  [(DIBaseXPCHandler *)self setConnection:v11];

  [(DIBaseAgentXPCHandler *)self setConnectionMode];
  v12 = [(DIBaseXPCHandler *)self remoteObjectInterface];
  v13 = [(DIBaseXPCHandler *)self connection];
  [v13 setRemoteObjectInterface:v12];
}

@end