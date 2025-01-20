@interface SignalHandler
- (SignalHandler)init;
@end

@implementation SignalHandler

- (SignalHandler)init
{
  v11.receiver = self;
  v11.super_class = (Class)SignalHandler;
  id v2 = [(SignalHandler *)&v11 initWithDomain:"SignalHandler"];
  if (v2)
  {
    if (signal(15, (void (__cdecl *)(int))1) == (void (__cdecl *)(int))-1)
    {
      v3 = [v2 logHandle];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_10002E9C8(v3);
      }
    }
    v4 = dispatch_get_global_queue(2, 0);
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v4);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    v7 = *((void *)v2 + 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100010AE4;
    handler[3] = &unk_100048BC8;
    id v10 = v2;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 1));
  }
  return (SignalHandler *)v2;
}

- (void).cxx_destruct
{
}

@end