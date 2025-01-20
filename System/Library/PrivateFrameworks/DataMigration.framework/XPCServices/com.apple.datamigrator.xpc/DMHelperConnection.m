@interface DMHelperConnection
- (DMHelperConnection)init;
- (DMXPCConnection)connection;
- (void)invalidate;
- (void)panicWithMessage:(id)a3;
- (void)performLoggingWork;
- (void)reboot;
- (void)resume;
- (void)setConnection:(id)a3;
@end

@implementation DMHelperConnection

- (DMHelperConnection)init
{
  v5.receiver = self;
  v5.super_class = (Class)DMHelperConnection;
  v2 = [(DMHelperConnection *)&v5 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)DMXPCConnection) initWithServiceName:@"com.apple.datamigratorhelper"];
    [(DMHelperConnection *)v2 setConnection:v3];
  }
  return v2;
}

- (void)resume
{
  id v2 = [(DMHelperConnection *)self connection];
  [v2 resume];
}

- (void)invalidate
{
  id v2 = [(DMHelperConnection *)self connection];
  [v2 invalidate];
}

- (void)panicWithMessage:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, "eventID", 1);
  id v5 = v4;
  v6 = (const char *)[v5 UTF8String];

  xpc_dictionary_set_string(xdict, "message", v6);
  v7 = [(DMHelperConnection *)self connection];
  id v8 = [v7 sendMessageSync:xdict];
}

- (void)reboot
{
  id v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "eventID", 2);
  id v3 = [(DMHelperConnection *)self connection];
  id v4 = [v3 sendMessageSync:v5];
}

- (void)performLoggingWork
{
  id v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "eventID", 3);
  id v3 = [(DMHelperConnection *)self connection];
  id v4 = [v3 sendMessageSync:v5];
}

- (DMXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end