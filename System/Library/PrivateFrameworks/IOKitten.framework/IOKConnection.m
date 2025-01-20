@interface IOKConnection
- (BOOL)callAsyncMethodWithSelector:(unsigned int)a3 wakePort:(unsigned int)a4 reference:(unint64_t *)a5 referenceCount:(unsigned int)a6 scalarInputs:(const unint64_t *)a7 scalarInputCount:(unsigned int)a8 scalarOutputs:(unint64_t *)a9 scalarOutputCount:(unsigned int *)outputCnt error:(id *)a11;
- (BOOL)callAsyncMethodWithSelector:(unsigned int)a3 wakePort:(unsigned int)a4 reference:(unint64_t *)a5 referenceCount:(unsigned int)a6 scalarInputs:(const unint64_t *)a7 scalarInputCount:(unsigned int)a8 structInput:(const void *)a9 structInputSize:(unint64_t)inputStructCnt scalarOutputs:(unint64_t *)a11 scalarOutputCount:(unsigned int *)a12 structOutput:(void *)a13 structOutputSize:(unint64_t *)outputStructCnt error:(id *)a15;
- (BOOL)callAsyncMethodWithSelector:(unsigned int)a3 wakePort:(unsigned int)a4 reference:(unint64_t *)a5 referenceCount:(unsigned int)a6 structInput:(const void *)a7 structInputSize:(unint64_t)a8 structOutput:(void *)a9 structOutputSize:(unint64_t *)outputStructCnt error:(id *)a11;
- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 scalarOutputs:(unint64_t *)a6 scalarOutputCount:(unsigned int *)a7 error:(id *)a8;
- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 structInput:(const void *)a6 structInputSize:(unint64_t)a7 scalarOutputs:(unint64_t *)a8 scalarOutputCount:(unsigned int *)a9 structOutput:(void *)outputStruct structOutputSize:(unint64_t *)a11 error:(id *)a12;
- (BOOL)callMethodWithSelector:(unsigned int)a3 structInput:(const void *)a4 structInputSize:(unint64_t)a5 structOutput:(void *)a6 structOutputSize:(unint64_t *)a7 error:(id *)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)mapMemory64OfType:(unsigned int)a3 withOptions:(unsigned int)a4 atAddress:(unint64_t *)a5 ofSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)setNotificationPort:(id)a3 ofType:(unsigned int)a4 withReference:(unint64_t)a5 error:(id *)a6;
- (BOOL)setProperties:(id)a3 error:(id *)a4;
- (BOOL)setProperty:(id)a3 withKey:(id)a4 error:(id *)a5;
- (BOOL)trap:(unsigned int)a3 error:(id *)a4;
- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 error:(id *)a5;
- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 error:(id *)a6;
- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 error:(id *)a7;
- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 p4:(unint64_t)a7 error:(id *)a8;
- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 p4:(unint64_t)a7 p5:(unint64_t)a8 error:(id *)a9;
- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 p4:(unint64_t)a7 p5:(unint64_t)a8 p6:(unint64_t)a9 error:(id *)a10;
- (BOOL)unmapMemory64OfType:(unsigned int)a3 atAddress:(unint64_t)a4 error:(id *)a5;
- (IOKConnection)init;
- (IOKConnection)initWithService:(id)a3;
- (IOKConnection)initWithService:(id)a3 andType:(unsigned int)a4;
- (IOKService)service;
- (unint64_t)hash;
- (unsigned)connection;
- (void)dealloc;
@end

@implementation IOKConnection

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 structInput:(const void *)a6 structInputSize:(unint64_t)a7 scalarOutputs:(unint64_t *)a8 scalarOutputCount:(unsigned int *)a9 structOutput:(void *)outputStruct structOutputSize:(unint64_t *)a11 error:(id *)a12
{
  kern_return_t v12;

  v12 = IOConnectCallMethod([(IOKConnection *)self connection], a3, a4, a5, a6, a7, a8, a9, outputStruct, a11);
  if (v12)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a12) {
        return v12 == 0;
      }
      goto LABEL_4;
    }
    if (a12)
    {
LABEL_4:
      *a12 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v12 userInfo:0];
    }
  }
  return v12 == 0;
}

- (unsigned)connection
{
  return self->_connection;
}

- (IOKConnection)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = [NSString stringWithUTF8String:"-[IOKConnection init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (IOKConnection)initWithService:(id)a3 andType:(unsigned int)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IOKConnection;
  v7 = [(IOKConnection *)&v10 init];
  if (v7)
  {
    io_service_t v8 = [v6 object];
    if (IOServiceOpen(v8, *MEMORY[0x263EF8960], a4, &v7->_connection))
    {
      v7->_connection = 0;

      v7 = 0;
    }
  }

  return v7;
}

- (IOKConnection)initWithService:(id)a3
{
  return [(IOKConnection *)self initWithService:a3 andType:0];
}

- (IOKService)service
{
  io_object_t object = 0;
  if (MEMORY[0x223C6B260]([(IOKConnection *)self connection], &object))
  {
    v2 = 0;
  }
  else
  {
    v3 = [IOKService alloc];
    v2 = [(IOKService *)v3 initWithServiceEntry:object];
    IOObjectRelease(object);
  }

  return v2;
}

- (BOOL)setNotificationPort:(id)a3 ofType:(unsigned int)a4 withReference:(unint64_t)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  uint64_t v11 = [(IOKConnection *)self connection];
  uint64_t v12 = [v10 machPort];

  int v13 = MEMORY[0x223C6B2A0](v11, v8, v12, a5);
  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a6) {
        return v13 == 0;
      }
      goto LABEL_4;
    }
    if (a6)
    {
LABEL_4:
      *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v13 userInfo:0];
    }
  }
  return v13 == 0;
}

- (BOOL)mapMemory64OfType:(unsigned int)a3 withOptions:(unsigned int)a4 atAddress:(unint64_t *)a5 ofSize:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a4;
  uint64_t v11 = *(void *)&a3;
  uint64_t v12 = [(IOKConnection *)self connection];
  int v13 = MEMORY[0x223C6B270](v12, v11, *MEMORY[0x263EF8960], a5, a6, v10);
  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a7) {
        return v13 == 0;
      }
      goto LABEL_4;
    }
    if (a7)
    {
LABEL_4:
      *a7 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v13 userInfo:0];
    }
  }
  return v13 == 0;
}

- (BOOL)unmapMemory64OfType:(unsigned int)a3 atAddress:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = [(IOKConnection *)self connection];
  int v9 = MEMORY[0x223C6B320](v8, v7, *MEMORY[0x263EF8960], a4);
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a5) {
        return v9 == 0;
      }
      goto LABEL_4;
    }
    if (a5)
    {
LABEL_4:
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v9 userInfo:0];
    }
  }
  return v9 == 0;
}

- (BOOL)setProperties:(id)a3 error:(id *)a4
{
  kern_return_t v7;

  id v6 = a3;
  uint64_t v7 = IOConnectSetCFProperties([(IOKConnection *)self connection], v6);

  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a4) {
        return v7 == 0;
      }
      goto LABEL_4;
    }
    if (a4)
    {
LABEL_4:
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v7 userInfo:0];
    }
  }
  return v7 == 0;
}

- (BOOL)setProperty:(id)a3 withKey:(id)a4 error:(id *)a5
{
  kern_return_t v10;

  uint64_t v8 = (__CFString *)a4;
  id v9 = a3;
  uint64_t v10 = IOConnectSetCFProperty([(IOKConnection *)self connection], v8, v9);

  if (v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a5) {
        return v10 == 0;
      }
      goto LABEL_4;
    }
    if (a5)
    {
LABEL_4:
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v10 userInfo:0];
    }
  }
  return v10 == 0;
}

- (BOOL)callAsyncMethodWithSelector:(unsigned int)a3 wakePort:(unsigned int)a4 reference:(unint64_t *)a5 referenceCount:(unsigned int)a6 scalarInputs:(const unint64_t *)a7 scalarInputCount:(unsigned int)a8 structInput:(const void *)a9 structInputSize:(unint64_t)inputStructCnt scalarOutputs:(unint64_t *)a11 scalarOutputCount:(unsigned int *)a12 structOutput:(void *)a13 structOutputSize:(unint64_t *)outputStructCnt error:(id *)a15
{
  kern_return_t v15;

  v15 = IOConnectCallAsyncMethod([(IOKConnection *)self connection], a3, a4, a5, a6, a7, a8, a9, inputStructCnt, a11, a12, a13, outputStructCnt);
  if (v15)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a15) {
        return v15 == 0;
      }
      goto LABEL_4;
    }
    if (a15)
    {
LABEL_4:
      *a15 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v15 userInfo:0];
    }
  }
  return v15 == 0;
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 structInput:(const void *)a4 structInputSize:(unint64_t)a5 structOutput:(void *)a6 structOutputSize:(unint64_t *)a7 error:(id *)a8
{
  kern_return_t v9;

  id v9 = IOConnectCallStructMethod([(IOKConnection *)self connection], a3, a4, a5, a6, a7);
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a8) {
        return v9 == 0;
      }
      goto LABEL_4;
    }
    if (a8)
    {
LABEL_4:
      *a8 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v9 userInfo:0];
    }
  }
  return v9 == 0;
}

- (BOOL)callAsyncMethodWithSelector:(unsigned int)a3 wakePort:(unsigned int)a4 reference:(unint64_t *)a5 referenceCount:(unsigned int)a6 structInput:(const void *)a7 structInputSize:(unint64_t)a8 structOutput:(void *)a9 structOutputSize:(unint64_t *)outputStructCnt error:(id *)a11
{
  kern_return_t v11;

  uint64_t v11 = IOConnectCallAsyncStructMethod([(IOKConnection *)self connection], a3, a4, a5, a6, a7, a8, a9, outputStructCnt);
  if (v11)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a11) {
        return v11 == 0;
      }
      goto LABEL_4;
    }
    if (a11)
    {
LABEL_4:
      *a11 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v11 userInfo:0];
    }
  }
  return v11 == 0;
}

- (BOOL)callMethodWithSelector:(unsigned int)a3 scalarInputs:(const unint64_t *)a4 scalarInputCount:(unsigned int)a5 scalarOutputs:(unint64_t *)a6 scalarOutputCount:(unsigned int *)a7 error:(id *)a8
{
  kern_return_t v9;

  id v9 = IOConnectCallScalarMethod([(IOKConnection *)self connection], a3, a4, a5, a6, a7);
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a8) {
        return v9 == 0;
      }
      goto LABEL_4;
    }
    if (a8)
    {
LABEL_4:
      *a8 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v9 userInfo:0];
    }
  }
  return v9 == 0;
}

- (BOOL)callAsyncMethodWithSelector:(unsigned int)a3 wakePort:(unsigned int)a4 reference:(unint64_t *)a5 referenceCount:(unsigned int)a6 scalarInputs:(const unint64_t *)a7 scalarInputCount:(unsigned int)a8 scalarOutputs:(unint64_t *)a9 scalarOutputCount:(unsigned int *)outputCnt error:(id *)a11
{
  kern_return_t v11;

  uint64_t v11 = IOConnectCallAsyncScalarMethod([(IOKConnection *)self connection], a3, a4, a5, a6, a7, a8, a9, outputCnt);
  if (v11)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a11) {
        return v11 == 0;
      }
      goto LABEL_4;
    }
    if (a11)
    {
LABEL_4:
      *a11 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v11 userInfo:0];
    }
  }
  return v11 == 0;
}

- (BOOL)trap:(unsigned int)a3 error:(id *)a4
{
  kern_return_t v5;

  v5 = IOConnectTrap0([(IOKConnection *)self connection], a3);
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a4) {
        return v5 == 0;
      }
      goto LABEL_4;
    }
    if (a4)
    {
LABEL_4:
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v5 userInfo:0];
    }
  }
  return v5 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 error:(id *)a5
{
  kern_return_t v6;

  id v6 = IOConnectTrap1([(IOKConnection *)self connection], a3, a4);
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a5) {
        return v6 == 0;
      }
      goto LABEL_4;
    }
    if (a5)
    {
LABEL_4:
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v6 userInfo:0];
    }
  }
  return v6 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 error:(id *)a6
{
  kern_return_t v7;

  uint64_t v7 = IOConnectTrap2([(IOKConnection *)self connection], a3, a4, a5);
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a6) {
        return v7 == 0;
      }
      goto LABEL_4;
    }
    if (a6)
    {
LABEL_4:
      *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v7 userInfo:0];
    }
  }
  return v7 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 error:(id *)a7
{
  kern_return_t v8;

  uint64_t v8 = IOConnectTrap3([(IOKConnection *)self connection], a3, a4, a5, a6);
  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a7) {
        return v8 == 0;
      }
      goto LABEL_4;
    }
    if (a7)
    {
LABEL_4:
      *a7 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v8 userInfo:0];
    }
  }
  return v8 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 p4:(unint64_t)a7 error:(id *)a8
{
  kern_return_t v9;

  id v9 = IOConnectTrap4([(IOKConnection *)self connection], a3, a4, a5, a6, a7);
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a8) {
        return v9 == 0;
      }
      goto LABEL_4;
    }
    if (a8)
    {
LABEL_4:
      *a8 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v9 userInfo:0];
    }
  }
  return v9 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 p4:(unint64_t)a7 p5:(unint64_t)a8 error:(id *)a9
{
  kern_return_t v9;

  id v9 = IOConnectTrap5([(IOKConnection *)self connection], a3, a4, a5, a6, a7, a8);
  if (v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a9) {
        return v9 == 0;
      }
      goto LABEL_4;
    }
    if (a9)
    {
LABEL_4:
      *a9 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v9 userInfo:0];
    }
  }
  return v9 == 0;
}

- (BOOL)trap:(unsigned int)a3 p1:(unint64_t)a4 p2:(unint64_t)a5 p3:(unint64_t)a6 p4:(unint64_t)a7 p5:(unint64_t)a8 p6:(unint64_t)a9 error:(id *)a10
{
  int v10 = MEMORY[0x223C6B310]([(IOKConnection *)self connection], *(void *)&a3, a4, a5, a6, a7, a8, a9);
  if (v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:]();
      if (!a10) {
        return v10 == 0;
      }
      goto LABEL_4;
    }
    if (a10)
    {
LABEL_4:
      *a10 = [MEMORY[0x263F087E8] errorWithDomain:@"IOErrorDomain" code:v10 userInfo:0];
    }
  }
  return v10 == 0;
}

- (unint64_t)hash
{
  return [(IOKConnection *)self connection];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (([v4 isMemberOfClass:objc_opt_class()] & 1) != 0
    || [(IOKConnection *)self isMemberOfClass:objc_opt_class()])
  {
    unsigned int v5 = [(IOKConnection *)self connection];
    BOOL v6 = v5 == [v4 connection];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  io_connect_t connection = self->_connection;
  if (connection) {
    IOServiceClose(connection);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOKConnection;
  [(IOKConnection *)&v4 dealloc];
}

- (void)setNotificationPort:ofType:withReference:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v1 = objc_claimAutoreleasedReturnValue();
  [v1 UTF8String];
  v2 = (const char *)OUTLINED_FUNCTION_3();
  NSStringFromSelector(v2);
  id v3 = objc_claimAutoreleasedReturnValue();
  [v3 UTF8String];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220957000, &_os_log_internal, v4, "%s %s failed with error 0x%08x", v5, v6, v7, v8, v9);
}

@end