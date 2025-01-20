@interface SecSOSStatus
- (NSXPCConnection)connection;
- (SecSOSStatus)init;
- (void)setConnection:(id)a3;
@end

@implementation SecSOSStatus

- (void).cxx_destruct
{
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (SecSOSStatus)init
{
  v9.receiver = self;
  v9.super_class = (Class)SecSOSStatus;
  v2 = [(SecSOSStatus *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED87A690];
    _SOSControlSetupInterface(v3);
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.securityd.sos" options:0];
    [(SecSOSStatus *)v2 setConnection:v4];

    v5 = [(SecSOSStatus *)v2 connection];

    if (v5)
    {
      v6 = [(SecSOSStatus *)v2 connection];
      [v6 setRemoteObjectInterface:v3];

      v7 = [(SecSOSStatus *)v2 connection];
      [v7 resume];

      v5 = v2;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end