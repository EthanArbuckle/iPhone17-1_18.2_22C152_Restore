@interface PeppyHIDService
+ (BOOL)matchService:(unsigned int)a3 options:(id)a4 score:(int64_t *)a5;
- (BOOL)_openWithOptions:(unsigned int)a3;
- (BOOL)_setProperty:(id)a3 forKey:(id)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5;
- (PeppyHIDService)init;
- (PeppyHIDService)initWithService:(unsigned int)a3;
- (__IOHIDEvent)_copyEventWithType:(unsigned int)a3 matching:(__IOHIDEvent *)a4 options:(unsigned int)a5;
- (const)getPluginInterface;
- (const)getServiceInterface;
- (id)_getPropertyForKey:(id)a3;
- (id)eventMatching:(id)a3 forClient:(id)a4;
- (id)propertyForKey:(id)a3 client:(id)a4;
- (int)_probeWithService:(unsigned int)a3 properties:(id)a4 outScore:(int *)a5;
- (int)_setOutputEvent:(__IOHIDEvent *)a3;
- (int)_startWithService:(unsigned int)a3 properties:(id)a4;
- (int)_stop;
- (void)_scheduleWithDispatchQueue:(id)a3;
- (void)_setEventCallback:(void *)a3 target:(void *)a4 refcon:(void *)a5;
- (void)_unscheduleWithDispatchQueue:(id)a3;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)setCancelHandler:(id)a3;
- (void)setEventDispatcher:(id)a3;
@end

@implementation PeppyHIDService

- (PeppyHIDService)init
{
  v7.receiver = self;
  v7.super_class = (Class)PeppyHIDService;
  v2 = [(PeppyHIDService *)&v7 init];
  if (v2)
  {
    v3 = (IOCFPlugInInterfaceStruct *)malloc_type_malloc(0x40uLL, 0x108004020ACED9DuLL);
    v2->_pluginInterface = v3;
    v3->_reserved = v2;
    v3->QueryInterface = (HRESULT (__cdecl *)(void *, REFIID, LPVOID *))PeppyIUnknown::QueryInterface;
    v3->AddRef = (ULONG (__cdecl *)(void *))PeppyIUnknown::AddRef;
    v3->Release = (ULONG (__cdecl *)(void *))PeppyIUnknown::Release;
    *(_DWORD *)&v3->version = 1;
    v3->Probe = (IOReturn (__cdecl *)(void *, CFDictionaryRef, io_service_t, SInt32 *))PeppyIUnknown::Probe;
    v3->Start = (IOReturn (__cdecl *)(void *, CFDictionaryRef, io_service_t))PeppyIUnknown::Start;
    v3->Stop = (IOReturn (__cdecl *)(void *))PeppyIUnknown::Stop;
    v4 = (IOHIDServiceInterface2 *)malloc_type_malloc(0x68uLL, 0x80040FDC59921uLL);
    v2->_serviceInterface = v4;
    v4->var0 = v2;
    v4->var1 = PeppyIUnknown::QueryInterface;
    v4->var2 = PeppyIUnknown::AddRef;
    v4->var3 = PeppyIUnknown::Release;
    v4->var4 = PeppyIUnknown::open;
    v4->var5 = PeppyIUnknown::close;
    v4->var6 = PeppyIUnknown::copyProperty;
    v4->var7 = PeppyIUnknown::setProperty;
    v4->var8 = PeppyIUnknown::setEventCallback;
    v4->var9 = PeppyIUnknown::scheduleWithDispatchQueue;
    v4->var10 = PeppyIUnknown::unscheduleFromDispatchQueue;
    v4->var11 = PeppyIUnknown::copyEvent;
    v4->var12 = PeppyIUnknown::setOutputEvent;
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  free(self->_serviceInterface);
  self->_serviceInterface = 0;
  free(self->_pluginInterface);
  self->_pluginInterface = 0;
  v3.receiver = self;
  v3.super_class = (Class)PeppyHIDService;
  [(PeppyHIDService *)&v3 dealloc];
}

+ (BOOL)matchService:(unsigned int)a3 options:(id)a4 score:(int64_t *)a5
{
  id v5 = a4;
  abort();
}

- (PeppyHIDService)initWithService:(unsigned int)a3
{
}

- (id)propertyForKey:(id)a3 client:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  abort();
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  abort();
}

- (id)eventMatching:(id)a3 forClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  abort();
}

- (void)setEventDispatcher:(id)a3
{
  id v3 = a3;
  abort();
}

- (void)setCancelHandler:(id)a3
{
  id v3 = a3;
  abort();
}

- (void)activate
{
}

- (void)cancel
{
}

- (const)getPluginInterface
{
  return (const IOCFPlugInInterfaceStruct **)&self->_pluginInterface;
}

- (const)getServiceInterface
{
  return (const IOHIDServiceInterface2 **)&self->_serviceInterface;
}

- (int)_probeWithService:(unsigned int)a3 properties:(id)a4 outScore:(int *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  uint64_t v10 = 0;
  if ([(id)objc_opt_class() matchService:v6 options:v7 score:&v10])
  {
    int v8 = 0;
    *a5 = v10;
  }
  else
  {
    int v8 = -536870212;
  }

  return v8;
}

- (int)_startWithService:(unsigned int)a3 properties:(id)a4
{
  v4 = [(PeppyHIDService *)self initWithService:*(void *)&a3];

  if (v4) {
    return 0;
  }
  else {
    return -536870212;
  }
}

- (int)_stop
{
  return 0;
}

- (BOOL)_openWithOptions:(unsigned int)a3
{
  return 1;
}

- (id)_getPropertyForKey:(id)a3
{
  id v3 = [(PeppyHIDService *)self propertyForKey:a3 client:0];

  return v3;
}

- (BOOL)_setProperty:(id)a3 forKey:(id)a4
{
  return [(PeppyHIDService *)self setProperty:a3 forKey:a4 client:0];
}

- (void)_setEventCallback:(void *)a3 target:(void *)a4 refcon:(void *)a5
{
  id v9 = objc_opt_new();
  v9[1] = a3;
  v9[2] = a4;
  v9[3] = a5;
  id v10 = v9;
  -[PeppyHIDService setEventDispatcher:](self, "setEventDispatcher:");
}

- (void)_scheduleWithDispatchQueue:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __46__PeppyHIDService__scheduleWithDispatchQueue___block_invoke;
    block[3] = &unk_1412A8;
    block[4] = self;
    id v9 = v5;
    dispatch_async(v9, block);
  }
  else
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PeppyHIDService.mm", 372, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
}

id __46__PeppyHIDService__scheduleWithDispatchQueue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCancelHandler:&__block_literal_global];
  [*(id *)(a1 + 32) setDispatchQueue:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 activate];
}

- (void)_unscheduleWithDispatchQueue:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PeppyHIDService.mm", 386, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__PeppyHIDService__unscheduleWithDispatchQueue___block_invoke;
  block[3] = &unk_1412D0;
  block[4] = self;
  dispatch_async(v5, block);
}

id __48__PeppyHIDService__unscheduleWithDispatchQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (__IOHIDEvent)_copyEventWithType:(unsigned int)a3 matching:(__IOHIDEvent *)a4 options:(unsigned int)a5
{
  return 0;
}

- (int)_setOutputEvent:(__IOHIDEvent *)a3
{
  return -536870201;
}

@end