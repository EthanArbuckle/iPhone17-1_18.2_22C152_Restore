@interface IsolatedCoreAudioUseCaseConnection
- (IsolatedCoreAudioUseCaseConnection)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (int)pid;
- (unsigned)useCaseID;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)setPid:(int)a3;
- (void)setUseCaseID:(unsigned int)a3;
@end

@implementation IsolatedCoreAudioUseCaseConnection

- (void).cxx_destruct
{
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setUseCaseID:(unsigned int)a3
{
  self->useCaseID = a3;
}

- (unsigned)useCaseID
{
  return self->useCaseID;
}

- (void)invalidate
{
  id v2 = [(IsolatedCoreAudioUseCaseConnection *)self connection];
  [v2 invalidate];
}

- (IsolatedCoreAudioUseCaseConnection)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IsolatedCoreAudioUseCaseConnection;
  v5 = [(IsolatedCoreAudioUseCaseConnection *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(IsolatedCoreAudioUseCaseConnection *)v5 setConnection:v4];
    -[IsolatedCoreAudioUseCaseConnection setPid:](v6, "setPid:", [v4 getProcessID]);
  }

  return v6;
}

@end