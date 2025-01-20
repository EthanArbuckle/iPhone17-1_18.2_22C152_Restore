@interface _NSCFServer
+ (BOOL)startSocksServerWithPort:(int64_t)a3;
+ (BOOL)stopAll;
+ (id)adressesForInterface:(id)a3;
+ (id)listeners;
- (BOOL)isCoprocessorInterfaceEnabled;
- (BOOL)start;
- (BOOL)stop;
- (NSDictionary)configuration;
- (NSString)interface;
- (_NSCFServer)init;
- (_NSCFServer)initWithType:(int64_t)a3;
- (_NSCFServer)initWithType:(int64_t)a3 port:(int64_t)a4;
- (_NSCFServer)initWithType:(int64_t)a3 port:(int64_t)a4 interface:(id)a5;
- (int64_t)listenerPort;
- (int64_t)type;
- (uint64_t)startWithAcceptHandler:(uint64_t)a1;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)setEnableCoprocessorInterface:(BOOL)a3;
- (void)setInterface:(id)a3;
- (void)setListenerPort:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _NSCFServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_interface, 0);
}

- (void)setEnableCoprocessorInterface:(BOOL)a3
{
  self->_enableCoprocessorInterface = a3;
}

- (BOOL)isCoprocessorInterfaceEnabled
{
  return self->_enableCoprocessorInterface;
}

- (void)setConfiguration:(id)a3
{
}

- (NSDictionary)configuration
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInterface:(id)a3
{
}

- (NSString)interface
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setListenerPort:(int64_t)a3
{
  self->_listenerPort = a3;
}

- (int64_t)listenerPort
{
  return self->_listenerPort;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)dealloc
{
  [(_NSCFServer *)self stop];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v3 = (id)CFNLog::logger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_184085000, v3, OS_LOG_TYPE_DEFAULT, "Listener deallocated", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)_NSCFServer;
  [(_NSCFServer *)&v4 dealloc];
}

- (BOOL)stop
{
  listener = self->_listener;
  if (listener)
  {
    tcp_listener_cancel();
    objc_super v4 = self->_listener;
    self->_listener = 0;

    v5 = +[_NSCFServer listeners]();
    [v5 setObject:0 forKeyedSubscript:self->_listenerID];
  }
  return listener != 0;
}

+ (id)listeners
{
  self;
  v0 = (void *)_listeners;
  if (!_listeners)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2 = (void *)_listeners;
    _listeners = (uint64_t)v1;

    v0 = (void *)_listeners;
  }

  return v0;
}

- (BOOL)start
{
  if (self->_type == 1)
  {
    uint64_t v3 = objc_opt_class();
    objc_super v4 = [(_NSCFServer *)self configuration];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __20___NSCFServer_start__block_invoke;
    v8[3] = &unk_1E5253328;
    id v9 = v4;
    uint64_t v10 = v3;
    v5 = v4;
    char v6 = -[_NSCFServer startWithAcceptHandler:]((uint64_t)self, v8);
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v5 = (id)CFNLog::logger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, "Error: Unknown Server Protocol Type", buf, 2u);
    }
    char v6 = 0;
  }

  return v6;
}

- (uint64_t)startWithAcceptHandler:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_super v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("listener-queue", v4);

    uint64_t v6 = tcp_listener_create();
    v7 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v6;

    if (*(void *)(a1 + 56))
    {
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      id v9 = [NSNumber numberWithInteger:*(void *)(a1 + 24)];
      id v10 = [v9 stringValue];
      [v10 UTF8String];
      tcp_listener_set_port();

      location[1] = (id)MEMORY[0x1E4F143A8];
      location[2] = (id)3221225472;
      location[3] = __38___NSCFServer_startWithAcceptHandler___block_invoke;
      location[4] = &unk_1E5253350;
      v17 = v5;
      id v18 = v3;
      tcp_listener_set_accept_handler();
      objc_initWeak(location, (id)a1);
      v11 = v8;
      objc_copyWeak(&v15, location);
      tcp_listener_set_error_handler();
      v12 = [(id)a1 interface];

      if (v12)
      {
        [*(id *)(a1 + 32) UTF8String];
        tcp_listener_set_interface();
      }
      if ([(id)a1 isCoprocessorInterfaceEnabled]) {
        tcp_listener_enable_coprocessor_interface();
      }
      tcp_listener_start();
      *(void *)(a1 + 24) = __rev16(tcp_listener_get_port());
      v13 = +[_NSCFServer listeners]();
      [v13 setObject:a1 forKeyedSubscript:*(void *)(a1 + 48)];

      dispatch_semaphore_signal(v11);
      a1 = *(void *)(a1 + 24) != 0;
      objc_destroyWeak(&v15);

      objc_destroyWeak(location);
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (_NSCFServer)init
{
  return [(_NSCFServer *)self initWithType:0];
}

- (_NSCFServer)initWithType:(int64_t)a3 port:(int64_t)a4
{
  return [(_NSCFServer *)self initWithType:a3 port:a4 interface:0];
}

- (_NSCFServer)initWithType:(int64_t)a3
{
  return [(_NSCFServer *)self initWithType:a3 port:0 interface:0];
}

- (_NSCFServer)initWithType:(int64_t)a3 port:(int64_t)a4 interface:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_NSCFServer;
  id v9 = [(_NSCFServer *)&v13 init];
  if (v9)
  {
    ++_listenerIDCounter;
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:");
    listenerID = v9->_listenerID;
    v9->_listenerID = (NSNumber *)v10;

    [(_NSCFServer *)v9 setType:a3];
    [(_NSCFServer *)v9 setListenerPort:a4];
    [(_NSCFServer *)v9 setInterface:v8];
  }

  return v9;
}

+ (id)adressesForInterface:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F1CA80] set];
  v17 = 0;
  if (getifaddrs(&v17)) {
    perror("getifaddrs");
  }
  dispatch_queue_t v5 = v17;
  if (v17)
  {
    while (1)
    {
      ifa_addr = v5->ifa_addr;
      if (ifa_addr && (v5->ifa_flags & 1) != 0)
      {
        int sa_family = ifa_addr->sa_family;
        if (sa_family == 30)
        {
          id v8 = &ifa_addr->sa_data[6];
          goto LABEL_10;
        }
        if (sa_family == 2)
        {
          id v8 = &ifa_addr->sa_data[2];
LABEL_10:
          id v9 = inet_ntop(sa_family, v8, v22, 0x40u);
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
          }
          uint64_t v10 = (id)CFNLog::logger;
          BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          if (v9)
          {
            if (v11)
            {
              ifa_name = v5->ifa_name;
              *(_DWORD *)buf = 136315394;
              v19 = ifa_name;
              __int16 v20 = 2080;
              v21 = v22;
              _os_log_impl(&dword_184085000, v10, OS_LOG_TYPE_DEFAULT, "%s: %s\n", buf, 0x16u);
            }

            uint64_t v10 = [NSString stringWithUTF8String:v5->ifa_name];
            if ([v3 isEqualToString:v10])
            {
              objc_super v13 = [NSString stringWithUTF8String:v22];
              [v4 addObject:v13];
            }
          }
          else if (v11)
          {
            v14 = v5->ifa_name;
            *(_DWORD *)buf = 136315138;
            v19 = v14;
            _os_log_impl(&dword_184085000, v10, OS_LOG_TYPE_DEFAULT, "%s: inet_ntop failed!\n", buf, 0xCu);
          }
        }
      }
      dispatch_queue_t v5 = v5->ifa_next;
      if (!v5)
      {
        id v15 = v17;
        goto LABEL_23;
      }
    }
  }
  id v15 = 0;
LABEL_23:
  MEMORY[0x18531BE20](v15);

  return v4;
}

+ (BOOL)stopAll
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend((id)_listeners, "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6++) stop];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  v7 = (void *)_listeners;
  _listeners = 0;

  return 1;
}

+ (BOOL)startSocksServerWithPort:(int64_t)a3
{
  uint64_t v4 = objc_alloc_init(_NSCFServer);
  [(_NSCFServer *)v4 setListenerPort:a3];
  LOBYTE(a3) = -[_NSCFServer startWithAcceptHandler:]((uint64_t)v4, &__block_literal_global_3585);

  return a3;
}

@end