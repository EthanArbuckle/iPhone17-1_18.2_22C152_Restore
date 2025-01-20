@interface NWUDPSession
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)hasBetterPath;
- (BOOL)isViable;
- (NSString)localPort;
- (NSString)privateDescription;
- (NSUInteger)maximumDatagramLength;
- (NWDatagramConnection)connection;
- (NWEndpoint)endpoint;
- (NWEndpoint)resolvedEndpoint;
- (NWParameters)parameters;
- (NWPath)currentPath;
- (NWUDPSession)initWithConnection:(id)a3;
- (NWUDPSession)initWithEndpoint:(id)a3 parameters:(id)a4;
- (NWUDPSession)initWithUpgradeForSession:(NWUDPSession *)session;
- (NWUDPSessionState)state;
- (id)description;
- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4;
- (id)readHandler;
- (unint64_t)internalMTU;
- (unint64_t)maxReadDatagrams;
- (void)cancel;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)readInternal;
- (void)setConnection:(id)a3;
- (void)setCurrentPath:(id)a3;
- (void)setHasBetterPath:(BOOL)a3;
- (void)setInternalMTU:(unint64_t)a3;
- (void)setMaxReadDatagrams:(unint64_t)a3;
- (void)setReadHandler:(id)a3;
- (void)setReadHandler:(void *)handler maxDatagrams:(NSUInteger)maxDatagrams;
- (void)setResolvedEndpoint:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setViable:(BOOL)a3;
- (void)setupEventHandler;
- (void)tryNextResolvedEndpoint;
- (void)writeDatagram:(NSData *)datagram completionHandler:(void *)completionHandler;
- (void)writeMultipleDatagrams:(NSArray *)datagramArray completionHandler:(void *)completionHandler;
@end

@implementation NWUDPSession

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"maximumDatagramLength"])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NWUDPSession;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong(&self->_readHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_currentPath, 0);
  objc_storeStrong((id *)&self->_resolvedEndpoint, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (NWParameters)parameters
{
  return (NWParameters *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInternalMTU:(unint64_t)a3
{
  self->_internalMTU = a3;
}

- (unint64_t)internalMTU
{
  return self->_internalMTU;
}

- (void)setReadHandler:(id)a3
{
}

- (id)readHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setMaxReadDatagrams:(unint64_t)a3
{
  self->_maxReadDatagrams = a3;
}

- (unint64_t)maxReadDatagrams
{
  return self->_maxReadDatagrams;
}

- (void)setConnection:(id)a3
{
}

- (NWDatagramConnection)connection
{
  return (NWDatagramConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentPath:(id)a3
{
}

- (NWPath)currentPath
{
  return self->_currentPath;
}

- (void)setHasBetterPath:(BOOL)a3
{
  self->_hasBetterPath = a3;
}

- (BOOL)hasBetterPath
{
  return self->_hasBetterPath;
}

- (void)setViable:(BOOL)a3
{
  self->_viable = a3;
}

- (BOOL)isViable
{
  return self->_viable;
}

- (void)setResolvedEndpoint:(id)a3
{
}

- (NWEndpoint)resolvedEndpoint
{
  return self->_resolvedEndpoint;
}

- (NWEndpoint)endpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NWUDPSessionState)state
{
  return self->_state;
}

- (NSString)localPort
{
  v2 = [(NWUDPSession *)self connection];
  v3 = [v2 connectedLocalEndpoint];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 port];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)cancel
{
  id v2 = [(NWUDPSession *)self connection];
  [v2 cancel];
}

- (void)writeDatagram:(NSData *)datagram completionHandler:(void *)completionHandler
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v6 = completionHandler;
  objc_super v7 = datagram;
  v8 = [(NWUDPSession *)self connection];
  v10[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  [v8 writeDatagrams:v9 completionHandler:v6];
}

- (void)writeMultipleDatagrams:(NSArray *)datagramArray completionHandler:(void *)completionHandler
{
  v6 = completionHandler;
  objc_super v7 = datagramArray;
  id v8 = [(NWUDPSession *)self connection];
  [v8 writeDatagrams:v7 completionHandler:v6];
}

- (void)setReadHandler:(void *)handler maxDatagrams:(NSUInteger)maxDatagrams
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (handler)
  {
    -[NWUDPSession setReadHandler:](self, "setReadHandler:");
    [(NWUDPSession *)self setMaxReadDatagrams:maxDatagrams];
    [(NWUDPSession *)self readInternal];
    return;
  }
  v6 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
  objc_super v7 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v13 = 0;
  if (__nwlog_fault(v7, &type, &v13))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      id v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
        v10 = "%{public}s called with null handler";
LABEL_18:
        _os_log_impl(&dword_1830D4000, v8, v9, v10, buf, 0xCu);
      }
    }
    else
    {
      if (v13)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        id v8 = __nwlog_obj();
        os_log_type_t v9 = type;
        BOOL v12 = os_log_type_enabled(v8, type);
        if (backtrace_string)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136446466;
            v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
            __int16 v17 = 2082;
            v18 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v8, v9, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_20;
        }
        if (!v12) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
        v10 = "%{public}s called with null handler, no backtrace";
        goto LABEL_18;
      }
      id v8 = __nwlog_obj();
      os_log_type_t v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        *(_DWORD *)buf = 136446210;
        v16 = "-[NWUDPSession setReadHandler:maxDatagrams:]";
        v10 = "%{public}s called with null handler, backtrace limit exceeded";
        goto LABEL_18;
      }
    }
LABEL_19:
  }
LABEL_20:
  if (v7) {
    free(v7);
  }
}

- (void)readInternal
{
  uint64_t v3 = [(NWUDPSession *)self readHandler];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = [(NWUDPSession *)self connection];
    uint64_t v6 = [v5 connectionState];

    if (v6 == 3)
    {
      objc_super v7 = [(NWUDPSession *)self connection];
      unint64_t v8 = [(NWUDPSession *)self maxReadDatagrams];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __28__NWUDPSession_readInternal__block_invoke;
      v9[3] = &unk_1E5241CC0;
      v9[4] = self;
      [v7 readDatagramsWithMinimumCount:0 maximumCount:v8 completionHandler:v9];
    }
  }
}

void __28__NWUDPSession_readInternal__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) readHandler];

  if (v6)
  {
    objc_super v7 = [*(id *)(a1 + 32) readHandler];
    ((void (**)(void, id, id))v7)[2](v7, v8, v5);

    [*(id *)(a1 + 32) readInternal];
  }
}

- (NSUInteger)maximumDatagramLength
{
  id v2 = self;
  objc_sync_enter(v2);
  NSUInteger v3 = [(NWUDPSession *)v2 internalMTU];
  objc_sync_exit(v2);

  return v3;
}

- (void)tryNextResolvedEndpoint
{
  id v2 = [(NWUDPSession *)self connection];
  [v2 cancelCurrentEndpoint];
}

- (NSString)privateDescription
{
  id v2 = [(NWUDPSession *)self descriptionWithIndent:0 showFullContent:1];

  return (NSString *)v2;
}

- (id)description
{
  id v2 = [(NWUDPSession *)self descriptionWithIndent:0 showFullContent:0];

  return v2;
}

- (id)descriptionWithIndent:(int)a3 showFullContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v7 appendString:@"{"];
  id v8 = [(NWUDPSession *)self parameters];
  [v7 appendPrettyObject:v8 withName:@"parameters" indent:v5 showFullContent:v4];

  os_log_type_t v9 = [(NWUDPSession *)self endpoint];
  [v7 appendPrettyObject:v9 withName:@"endpoint" indent:v5 showFullContent:v4];

  [v7 appendString:@"\n}"];
  return v7;
}

- (void)dealloc
{
  NSUInteger v3 = [(NWUDPSession *)self connection];
  [v3 removeObserver:self forKeyPath:@"connectionState"];

  BOOL v4 = [(NWUDPSession *)self connection];
  [v4 removeObserver:self forKeyPath:@"viable"];

  uint64_t v5 = [(NWUDPSession *)self connection];
  [v5 removeObserver:self forKeyPath:@"hasBetterPath"];

  uint64_t v6 = [(NWUDPSession *)self connection];
  [v6 removeObserver:self forKeyPath:@"currentPath"];

  v7.receiver = self;
  v7.super_class = (Class)NWUDPSession;
  [(NWUDPSession *)&v7 dealloc];
}

- (NWUDPSession)initWithUpgradeForSession:(NWUDPSession *)session
{
  BOOL v4 = session;
  uint64_t v5 = [(NWUDPSession *)v4 endpoint];
  uint64_t v6 = [(NWUDPSession *)v4 parameters];

  objc_super v7 = [(NWUDPSession *)self initWithEndpoint:v5 parameters:v6];
  return v7;
}

- (NWUDPSession)initWithEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)NWUDPSession;
  os_log_type_t v9 = [(NWUDPSession *)&v24 init];
  v10 = v9;
  if (!v9)
  {
    v14 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v22 = 0;
    if (!__nwlog_fault(v15, &type, &v22)) {
      goto LABEL_19;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
        v18 = "%{public}s [super init] failed";
LABEL_17:
        _os_log_impl(&dword_1830D4000, v16, v17, v18, buf, 0xCu);
      }
    }
    else
    {
      if (v22)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        v16 = __nwlog_obj();
        os_log_type_t v17 = type;
        BOOL v20 = os_log_type_enabled(v16, type);
        if (backtrace_string)
        {
          if (v20)
          {
            *(_DWORD *)buf = 136446466;
            v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
            __int16 v27 = 2082;
            v28 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v16, v17, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_19;
        }
        if (!v20) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136446210;
        v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
        v18 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_17;
      }
      v16 = __nwlog_obj();
      os_log_type_t v17 = type;
      if (os_log_type_enabled(v16, type))
      {
        *(_DWORD *)buf = 136446210;
        v26 = "-[NWUDPSession initWithEndpoint:parameters:]";
        v18 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_17;
      }
    }
LABEL_18:

LABEL_19:
    if (v15) {
      free(v15);
    }
    goto LABEL_21;
  }
  v9->_internalMTU = 1500;
  objc_storeStrong((id *)&v9->_endpoint, a3);
  [v8 setDataMode:1];
  objc_storeStrong((id *)&v10->_parameters, a4);
  uint64_t v11 = +[NWConnection connectionWithEndpoint:v7 parameters:v8];
  connection = v10->_connection;
  v10->_connection = (NWDatagramConnection *)v11;

  if (!v10->_connection)
  {
LABEL_21:
    char v13 = 0;
    goto LABEL_22;
  }
  [(NWUDPSession *)v10 setupEventHandler];
  char v13 = v10;
LABEL_22:

  return v13;
}

- (void)setupEventHandler
{
  NSUInteger v3 = [(NWUDPSession *)self connection];
  [v3 addObserver:self forKeyPath:@"connectionState" options:5 context:0];

  BOOL v4 = [(NWUDPSession *)self connection];
  [v4 addObserver:self forKeyPath:@"hasBetterPath" options:5 context:0];

  uint64_t v5 = [(NWUDPSession *)self connection];
  [v5 addObserver:self forKeyPath:@"viable" options:5 context:0];

  id v6 = [(NWUDPSession *)self connection];
  [v6 addObserver:self forKeyPath:@"currentPath" options:5 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v22 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v22 isEqualToString:@"connectionState"])
  {
    uint64_t v11 = [(NWUDPSession *)self connection];
    uint64_t v12 = [v11 connectionState];

    if (v12 == 3)
    {
      char v13 = [(NWUDPSession *)self connection];
      v14 = [v13 connectedRemoteEndpoint];
      [(NWUDPSession *)self setResolvedEndpoint:v14];

      [(NWUDPSession *)self setState:3];
      [(NWUDPSession *)self readInternal];
    }
    else
    {
      [(NWUDPSession *)self setState:v12];
    }
  }
  else if ([v22 isEqualToString:@"hasBetterPath"])
  {
    v15 = [(NWUDPSession *)self connection];
    -[NWUDPSession setHasBetterPath:](self, "setHasBetterPath:", [v15 hasBetterPath]);
  }
  else if ([v22 isEqualToString:@"viable"])
  {
    v16 = [(NWUDPSession *)self connection];
    -[NWUDPSession setViable:](self, "setViable:", [v16 isViable]);
  }
  else if ([v22 isEqualToString:@"currentPath"])
  {
    os_log_type_t v17 = [(NWUDPSession *)self connection];
    v18 = [v17 currentPath];
    [(NWUDPSession *)self setCurrentPath:v18];

    uint64_t v19 = [(NWUDPSession *)self currentPath];
    uint64_t v20 = [v19 maximumDatagramSize];

    v21 = self;
    objc_sync_enter(v21);
    if (v20 == [(NWUDPSession *)v21 internalMTU])
    {
      objc_sync_exit(v21);
    }
    else
    {
      [(NWUDPSession *)v21 willChangeValueForKey:@"maximumDatagramLength"];
      [(NWUDPSession *)v21 setInternalMTU:v20];
      objc_sync_exit(v21);

      [(NWUDPSession *)v21 didChangeValueForKey:@"maximumDatagramLength"];
    }
  }
}

- (NWUDPSession)initWithConnection:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v15 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v34 = "-[NWUDPSession initWithConnection:]";
    v16 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v31 = 0;
    if (!__nwlog_fault(v16, &type, &v31)) {
      goto LABEL_31;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      os_log_type_t v17 = __nwlog_obj();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        uint64_t v19 = "%{public}s called with null internalConnection";
LABEL_29:
        _os_log_impl(&dword_1830D4000, v17, v18, v19, buf, 0xCu);
      }
    }
    else
    {
      if (v31)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        os_log_type_t v17 = __nwlog_obj();
        os_log_type_t v18 = type;
        BOOL v26 = os_log_type_enabled(v17, type);
        if (backtrace_string)
        {
          if (v26)
          {
            *(_DWORD *)buf = 136446466;
            v34 = "-[NWUDPSession initWithConnection:]";
            __int16 v35 = 2082;
            v36 = backtrace_string;
            _os_log_impl(&dword_1830D4000, v17, v18, "%{public}s called with null internalConnection, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_31;
        }
        if (!v26) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        uint64_t v19 = "%{public}s called with null internalConnection, no backtrace";
        goto LABEL_29;
      }
      os_log_type_t v17 = __nwlog_obj();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v17, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        uint64_t v19 = "%{public}s called with null internalConnection, backtrace limit exceeded";
        goto LABEL_29;
      }
    }
LABEL_30:

LABEL_31:
    if (v16) {
      free(v16);
    }
    goto LABEL_40;
  }
  v30.receiver = self;
  v30.super_class = (Class)NWUDPSession;
  uint64_t v5 = [(NWUDPSession *)&v30 init];
  if (!v5)
  {
    uint64_t v20 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v34 = "-[NWUDPSession initWithConnection:]";
    v21 = (void *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v31 = 0;
    if (!__nwlog_fault((const char *)v21, &type, &v31))
    {
LABEL_37:
      if (v21) {
        free(v21);
      }
      self = 0;
      goto LABEL_40;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      id v22 = __nwlog_obj();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        objc_super v24 = "%{public}s [super init] failed";
LABEL_35:
        _os_log_impl(&dword_1830D4000, v22, v23, v24, buf, 0xCu);
      }
    }
    else
    {
      if (v31)
      {
        __int16 v27 = (char *)__nw_create_backtrace_string();
        id v22 = __nwlog_obj();
        os_log_type_t v23 = type;
        BOOL v28 = os_log_type_enabled(v22, type);
        if (v27)
        {
          if (v28)
          {
            *(_DWORD *)buf = 136446466;
            v34 = "-[NWUDPSession initWithConnection:]";
            __int16 v35 = 2082;
            v36 = v27;
            _os_log_impl(&dword_1830D4000, v22, v23, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v27);
          goto LABEL_37;
        }
        if (!v28) {
          goto LABEL_36;
        }
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        objc_super v24 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_35;
      }
      id v22 = __nwlog_obj();
      os_log_type_t v23 = type;
      if (os_log_type_enabled(v22, type))
      {
        *(_DWORD *)buf = 136446210;
        v34 = "-[NWUDPSession initWithConnection:]";
        objc_super v24 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_35;
      }
    }
LABEL_36:

    goto LABEL_37;
  }
  self = v5;
  id v6 = +[NWConnection connectionWithInternalConnection:v4];
  connection = self->_connection;
  self->_connection = v6;

  if (!self->_connection)
  {
LABEL_40:
    v14 = 0;
    goto LABEL_41;
  }
  id v8 = [(NWUDPSession *)self connection];
  id v9 = [v8 endpoint];
  endpoint = self->_endpoint;
  self->_endpoint = v9;

  uint64_t v11 = [(NWUDPSession *)self connection];
  uint64_t v12 = [v11 parameters];
  parameters = self->_parameters;
  self->_parameters = v12;

  [(NWUDPSession *)self setupEventHandler];
  self = self;
  v14 = self;
LABEL_41:

  return v14;
}

@end