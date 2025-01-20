@interface IOKNotificationPort
- (IOKNotificationPort)init;
- (IOKNotificationPort)initWithMasterPort:(unsigned int)a3 onDispatchQueue:(id)a4;
- (IONotificationPort)port;
- (OS_dispatch_queue)queue;
- (id)initOnDispatchQueue:(id)a3;
- (unsigned)machPort;
- (void)dealloc;
@end

@implementation IOKNotificationPort

- (void)dealloc
{
  port = self->_port;
  if (port) {
    IONotificationPortDestroy(port);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOKNotificationPort;
  [(IOKNotificationPort *)&v4 dealloc];
}

- (IOKNotificationPort)initWithMasterPort:(unsigned int)a3 onDispatchQueue:(id)a4
{
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IOKNotificationPort;
  v8 = [(IOKNotificationPort *)&v11 init];
  if (v8)
  {
    v8->_port = IONotificationPortCreate(a3);
    objc_storeStrong((id *)&v8->_queue, a4);
    port = v8->_port;
    if (port)
    {
      IONotificationPortSetDispatchQueue(port, v7);
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IONotificationPort)port
{
  return self->_port;
}

- (void).cxx_destruct
{
}

- (id)initOnDispatchQueue:(id)a3
{
  return [(IOKNotificationPort *)self initWithMasterPort:*MEMORY[0x263F0EC90] onDispatchQueue:a3];
}

- (IOKNotificationPort)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = [NSString stringWithUTF8String:"-[IOKNotificationPort init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (unsigned)machPort
{
  v2 = [(IOKNotificationPort *)self port];

  return IONotificationPortGetMachPort(v2);
}

@end