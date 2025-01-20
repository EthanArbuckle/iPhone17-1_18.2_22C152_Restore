@interface DIBaseAgentDelegate
- (void)createListener;
@end

@implementation DIBaseAgentDelegate

- (void)createListener
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(DIBaseServiceDelegate *)self serviceName];
  v4 = [v3 stringByAppendingString:@".xpc"];

  int v5 = *__error();
  if (DIForwardLogs())
  {
    v6 = getDIOSLog();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    [(DIBaseServiceDelegate *)self serviceName];
    *(_DWORD *)buf = 68158210;
    int v12 = 37;
    __int16 v13 = 2080;
    v14 = "-[DIBaseAgentDelegate createListener]";
    __int16 v15 = 2114;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    v8 = getDIOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(DIBaseServiceDelegate *)self serviceName];
      *(_DWORD *)buf = 68158210;
      int v12 = 37;
      __int16 v13 = 2080;
      v14 = "-[DIBaseAgentDelegate createListener]";
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_21E237000, v8, OS_LOG_TYPE_DEFAULT, "%.*s: Creating NSXPC listener on %{public}@", buf, 0x1Cu);
    }
  }
  *__error() = v5;
  v10 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v4];
  [(DIBaseServiceDelegate *)self setListener:v10];
}

@end