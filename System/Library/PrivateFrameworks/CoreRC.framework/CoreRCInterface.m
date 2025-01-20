@interface CoreRCInterface
- (BOOL)doesNotImplement:(SEL)a3 error:(id *)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5;
- (CoreRCInterfaceListener)listener;
- (OS_dispatch_queue)serialQueue;
- (id)propertyForKey:(id)a3 error:(id *)a4;
- (id)testProperty;
- (void)dealloc;
- (void)dispatchAsyncHighPriority:(id)a3;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setListener:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTestProperty:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation CoreRCInterface

- (void)dealloc
{
  [(CoreRCInterface *)self setSerialQueue:0];
  v3.receiver = self;
  v3.super_class = (Class)CoreRCInterface;
  [(CoreRCInterface *)&v3 dealloc];
}

- (BOOL)doesNotImplement:(SEL)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCInterface <= 60
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    sel_getName(a3);
    LogPrintF();
  }
  if (a4) {
    *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6735 userInfo:0];
  }
  return 0;
}

- (void)scheduleWithDispatchQueue:(id)a3
{
}

- (void)unscheduleFromDispatchQueue:(id)a3
{
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5
{
  if (gLogCategory_CoreRCInterface <= 10
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    id v11 = a4;
    id v12 = a3;
    LogPrintF();
  }
  int v9 = objc_msgSend(a4, "isEqualToString:", @"CoreRCInterfaceTest", v11, v12);
  if (v9)
  {
    [(CoreRCInterface *)self setTestProperty:a3];
  }
  else if (a5)
  {
    *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
  }
  return v9;
}

- (id)propertyForKey:(id)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCInterface <= 10
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    id v10 = a3;
    LogPrintF();
  }
  if (objc_msgSend(a3, "isEqualToString:", @"CoreRCInterfaceTest", v10))
  {
    id result = [(CoreRCInterface *)self testProperty];
    if (!result)
    {
      v8 = (void *)MEMORY[0x263EFF9D0];
      return (id)[v8 null];
    }
  }
  else if (a4)
  {
    int v9 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    id result = 0;
    *a4 = v9;
  }
  else
  {
    return 0;
  }
  return result;
}

- (void)dispatchAsyncHighPriority:(id)a3
{
  dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, a3);
  dispatch_async((dispatch_queue_t)[(CoreRCInterface *)self serialQueue], v4);
  _Block_release(v4);
}

- (CoreRCInterfaceListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  self->_listener = (CoreRCInterfaceListener *)a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (id)testProperty
{
  return self->_testProperty;
}

- (void)setTestProperty:(id)a3
{
}

@end