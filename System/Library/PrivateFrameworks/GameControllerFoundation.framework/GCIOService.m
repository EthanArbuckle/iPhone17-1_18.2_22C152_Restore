@interface GCIOService
+ (id)addMatchingNotification:(id)a3 type:(const char *)a4 matching:(id)a5 handler:(id)a6;
- (GCIOService)initWithPort:(unsigned int)a3 error:(id *)p_isa;
- (IOCFPlugInInterfaceStruct)createCFPlugInInterface:(__CFUUID *)a3 score:(int *)a4 error:(id *)a5;
- (id)addInterestNotification:(id)a3 type:(const char *)a4 handler:(id)a5;
@end

@implementation GCIOService

- (GCIOService)initWithPort:(unsigned int)a3 error:(id *)p_isa
{
  uint64_t v5 = *(void *)&a3;
  v7 = objc_opt_class();
  if ([v7 isEqual:objc_opt_class()] && !IOObjectConformsTo(v5, "IOService"))
  {
    if (p_isa)
    {
      NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
      v12 = @"Port does not reference an IOService.";
      v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      *p_isa = +[NSError errorWithDomain:NSMachErrorDomain code:4 userInfo:v9];

      p_isa = 0;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GCIOService;
    self = [(GCIORegistryEntry *)&v10 initWithPort:v5 error:p_isa];
    p_isa = (id *)&self->super.super.super.isa;
  }

  return (GCIOService *)p_isa;
}

+ (id)addMatchingNotification:(id)a3 type:(const char *)a4 matching:(id)a5 handler:(id)a6
{
  kern_return_t v16;
  GCIOIterator *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  _GCDisposable *v22;
  _GCDisposable *v23;
  NSObject *v24;
  void *v26;
  void v27[4];
  NSObject *v28;
  id v29;
  uint64_t *v30;
  id v31;
  void v32[4];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  io_iterator_t notification;
  uint8_t buf[24];
  uint64_t vars8;

  id v9 = a3;
  id v10 = a5;
  notification = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__4;
  v39 = __Block_byref_object_dispose__4;
  v40 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke;
  v32[3] = &unk_26BEC45C8;
  v34 = &v35;
  id v11 = a6;
  v33 = v11;
  v12 = (void *)[v32 copy];
  id v13 = v9;
  v14 = (IONotificationPort *)-[GCIONotificationPort port]((uint64_t)v13);
  CFDictionaryRef v15 = (const __CFDictionary *)v10;
  v16 = IOServiceAddMatchingNotification(v14, a4, v15, (IOServiceMatchingCallback)__IOServiceMatchingCallback, v12, &notification);
  if (v16)
  {
    v19 = _gc_log_iokit();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[GCIOService addMatchingNotification:type:matching:handler:]((uint64_t)a4, v16, v19);
    }
    v23 = 0;
  }
  else
  {
    v17 = [GCIOIterator alloc];
    v31 = 0;
    v18 = [(GCIOIterator *)v17 initWithPort:notification objectClass:objc_opt_class() error:&v31];
    v19 = v31;
    v20 = (void *)v36[5];
    v36[5] = v18;

    if (v36[5])
    {
      IOObjectRelease(notification);
      v21 = -[GCIONotificationPort queue]((uint64_t)v13);
      dispatch_async(v21, v12);

      v22 = [_GCDisposable alloc];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke_7;
      v27[3] = &unk_26BEC4618;
      v30 = &v35;
      v28 = v13;
      v29 = v12;
      v23 = [(_GCDisposable *)v22 initWithCleanupHandler:v27];

      v24 = v28;
    }
    else
    {
      v24 = _gc_log_iokit();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v26 = [v19 localizedFailureReason];
        +[GCIOService addMatchingNotification:type:matching:handler:]((uint64_t)a4, v26, buf, v24);
      }
      v23 = 0;
    }
  }
  _Block_object_dispose(&v35, 8);

  return v23;
}

uint64_t __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  v4 = -[GCIONotificationPort queue](*(void *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke_2;
  block[3] = &unk_26BEC45F0;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

id __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke_2()
{
  return self;
}

- (id)addInterestNotification:(id)a3 type:(const char *)a4 handler:(id)a5
{
  kern_return_t v13;
  _GCDisposable *v14;
  _GCDisposable *v15;
  NSObject *v16;
  kern_return_t v18;
  void v19[4];
  NSObject *v20;
  id v21;
  io_object_t v22;
  io_object_t notification;
  uint8_t buf[4];
  GCIOService *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  kern_return_t v29;
  uint64_t vars8;

  id v8 = a3;
  notification = 0;
  id v9 = (void *)[a5 copy];
  id v10 = v8;
  id v11 = (IONotificationPort *)-[GCIONotificationPort port]((uint64_t)v10);
  io_service_t v12 = -[GCIOObject port]((uint64_t)self);
  id v13 = IOServiceAddInterestNotification(v11, v12, a4, (IOServiceInterestCallback)__IOServiceNotificationCallback, v9, &notification);
  if (v13)
  {
    v18 = v13;
    v16 = _gc_log_iokit();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v25 = self;
      v26 = 2082;
      v27 = a4;
      v28 = 1024;
      v29 = v18;
      _os_log_error_impl(&dword_20AD04000, v16, OS_LOG_TYPE_ERROR, "%@ Error registering interest notification for '%{public}s': %{mach.errno}d", buf, 0x1Cu);
    }
    CFDictionaryRef v15 = 0;
  }
  else
  {
    v14 = [_GCDisposable alloc];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __52__GCIOService_addInterestNotification_type_handler___block_invoke;
    v19[3] = &unk_26BEC4640;
    v22 = notification;
    v20 = v10;
    v21 = v9;
    CFDictionaryRef v15 = [(_GCDisposable *)v14 initWithCleanupHandler:v19];

    v16 = v20;
  }

  return v15;
}

void __52__GCIOService_addInterestNotification_type_handler___block_invoke(uint64_t a1)
{
  IOObjectRelease(*(_DWORD *)(a1 + 48));
  uint64_t v2 = -[GCIONotificationPort queue](*(void *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__GCIOService_addInterestNotification_type_handler___block_invoke_2;
  block[3] = &unk_26BEC45F0;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

id __52__GCIOService_addInterestNotification_type_handler___block_invoke_2()
{
  return self;
}

- (IOCFPlugInInterfaceStruct)createCFPlugInInterface:(__CFUUID *)a3 score:(int *)a4 error:(id *)a5
{
  kern_return_t v10;
  uint64_t v12;
  void *v13;
  IOCFPlugInInterface **theInterface;
  SInt32 theScore;
  NSErrorUserInfoKey v16;
  __CFString *v17;

  theScore = 0;
  theInterface = 0;
  io_service_t v8 = -[GCIOObject port]((uint64_t)self);
  CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  id v10 = IOCreatePlugInInterfaceForService(v8, a3, v9, &theInterface, &theScore);
  if (v10)
  {
    if (a5)
    {
      io_service_t v12 = v10;
      v16 = NSLocalizedFailureErrorKey;
      v17 = @"CFPlugIn instantiation failed.";
      id v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      *a5 = +[NSError errorWithDomain:NSMachErrorDomain code:v12 userInfo:v13];
    }
    return 0;
  }
  else
  {
    if (a4) {
      *a4 = theScore;
    }
    return theInterface;
  }
}

+ (void)addMatchingNotification:(uint64_t)a1 type:(void *)a2 matching:(uint8_t *)buf handler:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_20AD04000, log, OS_LOG_TYPE_ERROR, "<IOService> Error creating iterator for matching notification for '%{public}s': %{public}@", buf, 0x16u);
}

+ (void)addMatchingNotification:(os_log_t)log type:matching:handler:.cold.2(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_20AD04000, log, OS_LOG_TYPE_ERROR, "<IOService> Error registering matching notification for '%{public}s': %{mach.errno}d", (uint8_t *)&v3, 0x12u);
}

@end