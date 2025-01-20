@interface DADeviceObserverAggregator
+ (id)aggregatorWithObserverClasses:(id)a3;
+ (id)defaultObserverClasses;
- (DADeviceObserverAggregator)init;
- (DADeviceObserverAggregator)initWithObserverClasses:(id)a3;
- (NSArray)observers;
- (NSMutableDictionary)handlers;
- (NSOperationQueue)discoveryQueue;
- (id)allDevices;
- (id)beginDiscoveringDevicesWithHandler:(id)a3;
- (void)_beginObserving;
- (void)_endObserving;
- (void)discoverAllDevicesWithCompletionHandler:(id)a3;
- (void)endDiscoveringDevicesWithIdentifier:(id)a3;
- (void)observerDidChangeDevices:(id)a3;
- (void)setDiscoveryQueue:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation DADeviceObserverAggregator

+ (id)aggregatorWithObserverClasses:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithObserverClasses:v4];

  return v5;
}

+ (id)defaultObserverClasses
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
}

- (DADeviceObserverAggregator)init
{
  v3 = [(id)objc_opt_class() defaultObserverClasses];
  id v4 = [(DADeviceObserverAggregator *)self initWithObserverClasses:v3];

  return v4;
}

- (DADeviceObserverAggregator)initWithObserverClasses:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DADeviceObserverAggregator;
  id v5 = [(DADeviceObserverAggregator *)&v26 init];
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    discoveryQueue = v5->_discoveryQueue;
    v5->_discoveryQueue = v6;

    v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v4;
    v10 = (char *)[v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v10)
    {
      v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_opt_new();
          v15 = [DADeviceObserverEnclosure alloc];
          v16 = -[DADeviceObserverEnclosure initWithObserver:delegate:](v15, "initWithObserver:delegate:", v14, v5, v22);
          [v8 addObject:v16];

          ++v13;
        }
        while (v11 != v13);
        v11 = (char *)[v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v11);
    }

    v17 = (NSArray *)[v8 copy];
    observers = v5->_observers;
    v5->_observers = v17;

    uint64_t v19 = +[NSMutableDictionary dictionary];
    handlers = v5->_handlers;
    v5->_handlers = (NSMutableDictionary *)v19;
  }
  return v5;
}

- (id)allDevices
{
  v3 = +[NSMutableSet set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(DADeviceObserverAggregator *)self observers];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) devices];
        [v3 unionSet:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUUID UUID];
  id v6 = [(DADeviceObserverAggregator *)self handlers];
  objc_sync_enter(v6);
  id v7 = [v4 copy];
  id v8 = objc_retainBlock(v7);
  id v9 = [(DADeviceObserverAggregator *)self handlers];
  [v9 setObject:v8 forKeyedSubscript:v5];

  objc_sync_exit(v6);
  [(DADeviceObserverAggregator *)self _beginObserving];

  return v5;
}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DADeviceObserverAggregator *)self handlers];
  [v5 removeObjectForKey:v4];

  id v6 = [(DADeviceObserverAggregator *)self handlers];
  id v7 = [v6 count];

  if (!v7)
  {
    [(DADeviceObserverAggregator *)self _endObserving];
  }
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(21, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005380;
  v7[3] = &unk_100014648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)observerDidChangeDevices:(id)a3
{
  id v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(DADeviceObserverAggregator *)self handlers];
    *(_DWORD *)buf = 138412290;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handlers: %@", buf, 0xCu);
  }
  id v6 = [(DADeviceObserverAggregator *)self handlers];
  id v7 = [v6 copy];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v20;
    *(void *)&long long v10 = 138412546;
    long long v18 = v10;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * (void)v13), v18, (void)v19);
        long long v14 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = [(DADeviceObserverAggregator *)self allDevices];
          v16 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = objc_retainBlock(v14);
            *(_DWORD *)buf = v18;
            id v24 = v17;
            __int16 v25 = 2112;
            objc_super v26 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Calling handler: %@ with devices: %@", buf, 0x16u);
          }
          ((void (**)(void, void *))v14)[2](v14, v15);
        }
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v11);
  }
}

- (void)_beginObserving
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(DADeviceObserverAggregator *)self observers];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) begin];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_endObserving
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(DADeviceObserverAggregator *)self observers];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) end];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSOperationQueue)discoveryQueue
{
  return self->_discoveryQueue;
}

- (void)setDiscoveryQueue:(id)a3
{
}

- (NSArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_discoveryQueue, 0);
}

@end