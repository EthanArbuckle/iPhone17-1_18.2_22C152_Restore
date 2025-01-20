@interface IOThreadXPCSemaphoreTransporter
+ (BOOL)supportsSecureCoding;
+ (id)semaphores:(const ClientIOThreadSynchronizerSemaphores *)a3;
- (BOOL)isEqual:(id)a3;
- (ClientIOThreadSynchronizerSemaphores)getSemaphores;
- (IOThreadXPCSemaphoreTransporter)initWithCoder:(id)a3;
- (IOThreadXPCSemaphoreTransporter)initWithSemaphores:(id)a3 :(id)a4;
- (OS_xpc_object)clientListenableSemaphore;
- (OS_xpc_object)clientPingableSemaphore;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setClientListenableSemaphore:(id)a3;
- (void)setClientPingableSemaphore:(id)a3;
@end

@implementation IOThreadXPCSemaphoreTransporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientPingableSemaphore, 0);
  objc_storeStrong((id *)&self->_clientListenableSemaphore, 0);
}

- (void)setClientPingableSemaphore:(id)a3
{
}

- (OS_xpc_object)clientPingableSemaphore
{
  return self->_clientPingableSemaphore;
}

- (void)setClientListenableSemaphore:(id)a3
{
}

- (OS_xpc_object)clientListenableSemaphore
{
  return self->_clientListenableSemaphore;
}

- (ClientIOThreadSynchronizerSemaphores)getSemaphores
{
  v3 = [(IOThreadXPCSemaphoreTransporter *)self clientPingableSemaphore];
  unsigned int v4 = xpc_mach_send_copy_right();

  v5 = [(IOThreadXPCSemaphoreTransporter *)self clientListenableSemaphore];
  uint64_t v6 = xpc_mach_send_copy_right();

  return (ClientIOThreadSynchronizerSemaphores)(v4 | (unint64_t)(v6 << 32));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(IOThreadXPCSemaphoreTransporter *)self clientPingableSemaphore];
    if (v6)
    {
    }
    else
    {
      v8 = [(IOThreadXPCSemaphoreTransporter *)self clientListenableSemaphore];

      if (!v8)
      {
        v9 = [v5 clientPingableSemaphore];
        if (v9)
        {
          BOOL v7 = 0;
          goto LABEL_10;
        }
        v10 = [v5 clientListenableSemaphore];
        v9 = 0;
        BOOL v7 = v10 == 0;
LABEL_9:

LABEL_10:
        goto LABEL_11;
      }
    }
    v9 = [(IOThreadXPCSemaphoreTransporter *)self clientPingableSemaphore];
    v10 = [v5 clientPingableSemaphore];
    if (xpc_equal(v9, v10))
    {
      v11 = [(IOThreadXPCSemaphoreTransporter *)self clientListenableSemaphore];
      v12 = [v5 clientListenableSemaphore];
      BOOL v7 = xpc_equal(v11, v12);
    }
    else
    {
      BOOL v7 = 0;
    }
    goto LABEL_9;
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"This object may only be decoded by an NSXPCCoder."];
  }
  id v9 = v4;
  id v5 = [(IOThreadXPCSemaphoreTransporter *)self clientPingableSemaphore];

  if (v5)
  {
    uint64_t v6 = [(IOThreadXPCSemaphoreTransporter *)self clientPingableSemaphore];
  }
  else
  {
    uint64_t v6 = xpc_null_create();
  }
  [v9 encodeXPCObject:v6 forKey:@"IOThreadXPCSemaphoreTransporterClientPingable"];

  BOOL v7 = [(IOThreadXPCSemaphoreTransporter *)self clientListenableSemaphore];

  if (v7)
  {
    v8 = [(IOThreadXPCSemaphoreTransporter *)self clientListenableSemaphore];
  }
  else
  {
    v8 = xpc_null_create();
  }
  [v9 encodeXPCObject:v8 forKey:@"IOThreadXPCSemaphoreTransporterClientListenable"];
}

- (void)dealloc
{
  clientPingableSemaphore = self->_clientPingableSemaphore;
  self->_clientPingableSemaphore = 0;

  clientListenableSemaphore = self->_clientListenableSemaphore;
  self->_clientListenableSemaphore = 0;

  v5.receiver = self;
  v5.super_class = (Class)IOThreadXPCSemaphoreTransporter;
  [(IOThreadXPCSemaphoreTransporter *)&v5 dealloc];
}

- (IOThreadXPCSemaphoreTransporter)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"This object may only be decoded by an NSXPCCoder."];
  }
  v17.receiver = self;
  v17.super_class = (Class)IOThreadXPCSemaphoreTransporter;
  objc_super v5 = [(IOThreadXPCSemaphoreTransporter *)&v17 init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [v6 decodeXPCObjectForKey:@"IOThreadXPCSemaphoreTransporterClientPingable"];
    clientPingableSemaphore = v5->_clientPingableSemaphore;
    v5->_clientPingableSemaphore = (OS_xpc_object *)v7;

    if (!v5->_clientPingableSemaphore) {
      goto LABEL_12;
    }
    uint64_t v9 = MEMORY[0x25A277570]();
    uint64_t v10 = MEMORY[0x263EF8758];
    if (v9 == MEMORY[0x263EF8758])
    {
      v11 = v5->_clientPingableSemaphore;
      v5->_clientPingableSemaphore = 0;
    }
    uint64_t v12 = [v6 decodeXPCObjectForKey:@"IOThreadXPCSemaphoreTransporterClientListenable"];
    clientListenableSemaphore = v5->_clientListenableSemaphore;
    v5->_clientListenableSemaphore = (OS_xpc_object *)v12;

    if (!v5->_clientListenableSemaphore)
    {
LABEL_12:

      v15 = 0;
      goto LABEL_13;
    }
    if (MEMORY[0x25A277570]() == v10)
    {
      v14 = v5->_clientListenableSemaphore;
      v5->_clientListenableSemaphore = 0;
    }
  }
  v15 = v5;
LABEL_13:

  return v15;
}

- (IOThreadXPCSemaphoreTransporter)initWithSemaphores:(id)a3 :(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IOThreadXPCSemaphoreTransporter;
  uint64_t v9 = [(IOThreadXPCSemaphoreTransporter *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientPingableSemaphore, a4);
    objc_storeStrong((id *)&v10->_clientListenableSemaphore, a3);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)semaphores:(const ClientIOThreadSynchronizerSemaphores *)a3
{
  v3 = (void *)xpc_mach_send_create();
  id v4 = (void *)xpc_mach_send_create();
  objc_super v5 = [[IOThreadXPCSemaphoreTransporter alloc] initWithSemaphores:v3 :v4];

  return v5;
}

@end