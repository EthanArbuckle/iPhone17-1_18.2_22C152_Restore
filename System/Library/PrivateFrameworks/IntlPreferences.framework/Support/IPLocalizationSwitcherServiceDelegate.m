@interface IPLocalizationSwitcherServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IPLocalizationSwitcherServiceDelegate)init;
- (NSMutableSet)subscribers;
- (OS_dispatch_queue)queue;
- (OS_xpc_event_publisher)publisher;
- (void)addSubscriber:(unint64_t)a3;
- (void)preferredLanguageChangedForBundleID:(id)a3;
- (void)removeSubscriber:(unint64_t)a3;
- (void)setPublisher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSubscribers:(id)a3;
@end

@implementation IPLocalizationSwitcherServiceDelegate

- (IPLocalizationSwitcherServiceDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)IPLocalizationSwitcherServiceDelegate;
  v2 = [(IPLocalizationSwitcherServiceDelegate *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSMutableSet *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.IntlPreferences.events", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___IPLocalizationSwitcherProtocol];
  [v5 setExportedInterface:v6];

  v7 = objc_opt_new();
  [v7 setDelegate:self];
  [v5 setExportedObject:v7];
  objc_super v8 = [v5 valueForEntitlement:@"com.apple.localizationswitcher"];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v8 BOOLValue])
  {
    [v5 resume];
    BOOL v9 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000026A0();
    }
    [v5 invalidate];
    BOOL v9 = 0;
  }

  return v9;
}

- (void)addSubscriber:(unint64_t)a3
{
  id v5 = [(IPLocalizationSwitcherServiceDelegate *)self subscribers];
  v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v5 addObject:v4];
}

- (void)removeSubscriber:(unint64_t)a3
{
  id v5 = [(IPLocalizationSwitcherServiceDelegate *)self subscribers];
  v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v5 removeObject:v4];
}

- (void)preferredLanguageChangedForBundleID:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(IPLocalizationSwitcherServiceDelegate *)self subscribers];
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 134217984;
    long long v13 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "unsignedLongLongValue", v13);
        v11 = [(IPLocalizationSwitcherServiceDelegate *)self publisher];
        v12 = [(IPLocalizationSwitcherServiceDelegate *)self queue];
        id v15 = v4;
        xpc_event_publisher_fire_with_reply();

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          id v21 = v10;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Fired initial XPC event to ping the subscriber [%llu]", buf, 0xCu);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (NSMutableSet)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

@end