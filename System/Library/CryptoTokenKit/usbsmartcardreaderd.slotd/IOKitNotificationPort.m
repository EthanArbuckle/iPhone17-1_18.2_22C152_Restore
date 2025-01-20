@interface IOKitNotificationPort
+ (void)callbackWithContext:(void *)a3 iterator:(unsigned int)a4;
- (IOKitNotificationPort)init;
- (void)addMatching:(id)a3 type:(const char *)a4 block:(id)a5;
- (void)dealloc;
@end

@implementation IOKitNotificationPort

- (IOKitNotificationPort)init
{
  v8.receiver = self;
  v8.super_class = (Class)IOKitNotificationPort;
  v2 = [(IOKitNotificationPort *)&v8 init];
  if (v2)
  {
    v2->port = IONotificationPortCreate(kIOMainPortDefault);
    uint64_t v3 = objc_opt_new();
    iterator = v2->iterator;
    v2->iterator = (IOKitObjectHolder *)v3;

    RunLoopSource = IONotificationPortGetRunLoopSource(v2->port);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  }
  return v2;
}

- (void)dealloc
{
  IONotificationPortDestroy(self->port);
  v3.receiver = self;
  v3.super_class = (Class)IOKitNotificationPort;
  [(IOKitNotificationPort *)&v3 dealloc];
}

+ (void)callbackWithContext:(void *)a3 iterator:(unsigned int)a4
{
  v5 = [[IOKitObjectHolder alloc] initWithObject:*(void *)&a4];
  if (a3 && v5)
  {
    v10 = v5;
    v6 = a3;
    uint64_t v7 = [(IOKitObjectHolder *)v10 nextObject];
    if (v7)
    {
      objc_super v8 = (void *)v7;
      do
      {
        (*(void (**)(void))(v6[3] + 16))();
        uint64_t v9 = [(IOKitObjectHolder *)v10 nextObject];

        objc_super v8 = (void *)v9;
      }
      while (v9);
    }

    v5 = v10;
  }
}

- (void)addMatching:(id)a3 type:(const char *)a4 block:(id)a5
{
  kern_return_t v13;
  int v14;
  NSObject *v15;
  IOKitNotificationPort *refCon;

  refCon = self;
  id v8 = a3;
  id v9 = objc_retainBlock(a5);
  id block = self->block;
  self->id block = v9;

  port = self->port;
  CFDictionaryRef v12 = (const __CFDictionary *)v8;
  v13 = IOServiceAddMatchingNotification(port, a4, v12, (IOServiceMatchingCallback)sub_100003718, &refCon, [(IOKitObjectHolder *)self->iterator holderPtr]);
  if (v13)
  {
    v14 = v13;
    v15 = sub_1000034C8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000163DC((uint64_t)v12, v14, v15);
    }
  }
  else
  {
    +[IOKitNotificationPort callbackWithContext:refCon iterator:[(IOKitObjectHolder *)refCon->iterator holder]];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->block, 0);

  objc_storeStrong((id *)&self->iterator, 0);
}

@end