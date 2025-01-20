@interface DIClient2IODaemonXPCHandler
- (BOOL)addToRefCountWithError:(id *)a3;
- (DIClient2IODaemonXPCHandler)initWithEndpoint:(id)a3;
- (NSXPCListenerEndpoint)xpcListenerEndpoint;
- (id)remoteObjectInterface;
- (void)createConnection;
- (void)setXpcListenerEndpoint:(id)a3;
@end

@implementation DIClient2IODaemonXPCHandler

- (DIClient2IODaemonXPCHandler)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIClient2IODaemonXPCHandler;
  v6 = [(DIBaseXPCHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_xpcListenerEndpoint, a3);
  }

  return v7;
}

- (void)createConnection
{
  int v3 = *__error();
  if (sub_1000D850C())
  {
    v4 = sub_1000D848C();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v15 = 47;
    __int16 v16 = 2080;
    v17 = "-[DIClient2IODaemonXPCHandler createConnection]";
    id v5 = (char *)_os_log_send_and_compose_impl();

    if (v5)
    {
      fprintf(__stderrp, "%s\n", v5);
      free(v5);
    }
  }
  else
  {
    v6 = sub_1000D848C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v15 = 47;
      __int16 v16 = 2080;
      v17 = "-[DIClient2IODaemonXPCHandler createConnection]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection to IO daemon clients listener", buf, 0x12u);
    }
  }
  *__error() = v3;
  id v7 = objc_alloc((Class)NSXPCConnection);
  v8 = [(DIClient2IODaemonXPCHandler *)self xpcListenerEndpoint];
  id v9 = [v7 initWithListenerEndpoint:v8];
  [(DIBaseXPCHandler *)self setConnection:v9];

  v10 = [(DIClient2IODaemonXPCHandler *)self remoteObjectInterface];
  v11 = [(DIBaseXPCHandler *)self connection];
  [v11 setRemoteObjectInterface:v10];

  v12 = [(DIBaseXPCHandler *)self connection];
  [v12 setInvalidationHandler:&stru_1001BCF48];

  v13 = [(DIBaseXPCHandler *)self connection];
  [v13 setInterruptionHandler:&stru_1001BCF68];
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DIIOClientProtocol];
}

- (BOOL)addToRefCountWithError:(id *)a3
{
  objc_initWeak(&location, self);
  id v5 = [(DIBaseXPCHandler *)self remoteProxy];
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_10010FF4C;
  v10 = &unk_1001A6530;
  objc_copyWeak(&v11, &location);
  [v5 addToRefCountWithReply:&v7];

  LOBYTE(a3) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a3, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return (char)a3;
}

- (NSXPCListenerEndpoint)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end