@interface DIBaseAgentDelegate
- (void)createListener;
@end

@implementation DIBaseAgentDelegate

- (void)createListener
{
  v3 = [(DIBaseServiceDelegate *)self serviceName];
  v4 = [v3 stringByAppendingString:@".xpc"];

  int v5 = *__error();
  if (sub_1000D850C())
  {
    v6 = sub_1000D848C();
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
      fprintf(__stderrp, "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    v8 = sub_1000D848C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(DIBaseServiceDelegate *)self serviceName];
      *(_DWORD *)buf = 68158210;
      int v12 = 37;
      __int16 v13 = 2080;
      v14 = "-[DIBaseAgentDelegate createListener]";
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%.*s: Creating NSXPC listener on %{public}@", buf, 0x1Cu);
    }
  }
  *__error() = v5;
  id v10 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v4];
  [(DIBaseServiceDelegate *)self setListener:v10];
}

@end