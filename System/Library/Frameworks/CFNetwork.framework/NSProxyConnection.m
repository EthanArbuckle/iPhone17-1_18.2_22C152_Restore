@interface NSProxyConnection
- (NSProxyConnection)initWithHost:(id)a3 port:(unsigned __int16)a4 queue:(id)a5 configuration:(id)a6;
- (void)cancel;
- (void)dealloc;
- (void)read:(unint64_t)a3 handler:(id)a4;
- (void)write:(id)a3 handler:(id)a4;
@end

@implementation NSProxyConnection

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  [(NSProxyConnection *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)NSProxyConnection;
  [(NSProxyConnection *)&v3 dealloc];
}

- (void)cancel
{
  if (self->_connection)
  {
    tcp_connection_cancel();
    connection = self->_connection;
    self->_connection = 0;
  }
}

- (void)write:(id)a3 handler:(id)a4
{
  id v5 = a4;
  if (self) {
    ++self->_pendingWrites;
  }
  v7 = v5;
  id v6 = v5;
  tcp_connection_write();
}

uint64_t __35__NSProxyConnection_write_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    --*(void *)(v1 + 32);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)read:(unint64_t)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (self->_connection)
  {
    id v7 = v5;
    tcp_connection_read();
  }
}

uint64_t __34__NSProxyConnection_read_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSProxyConnection)initWithHost:(id)a3 port:(unsigned __int16)a4 queue:(id)a5 configuration:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)NSProxyConnection;
  v13 = [(NSProxyConnection *)&v23 init];
  if (v13)
  {
    id v14 = v10;
    [v14 UTF8String];
    uint64_t v15 = tcp_connection_create();
    connection = v13->_connection;
    v13->_connection = (OS_tcp_connection *)v15;

    objc_initWeak(&location, v13);
    objc_copyWeak(&v20, &location);
    id v18 = v14;
    unsigned __int16 v21 = a4;
    v19 = v13;
    tcp_connection_set_event_handler();
    tcp_connection_start();

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __59__NSProxyConnection_initWithHost_port_queue_configuration___block_invoke(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(WeakRetained + 3);

    if (v6)
    {
      if (a2 == 3)
      {
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        id v12 = (id)CFNLog::logger;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = *(unsigned __int16 *)(a1 + 56);
          uint64_t v14 = *(void *)(a1 + 32);
          int v16 = 138412802;
          uint64_t v17 = v14;
          __int16 v18 = 1024;
          int v19 = v13;
          __int16 v20 = 1024;
          int error = tcp_connection_get_error();
          _os_log_impl(&dword_184085000, v12, OS_LOG_TYPE_DEFAULT, "Failure connecting to: %@:%d error:%d", (uint8_t *)&v16, 0x18u);
        }

        uint64_t v11 = tcp_connection_get_error();
        id v10 = v6;
      }
      else
      {
        if (a2 != 1)
        {
          if (CFNLog::onceToken != -1) {
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
          }
          uint64_t v15 = (id)CFNLog::logger;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = 67109120;
            LODWORD(v17) = a2;
            _os_log_impl(&dword_184085000, v15, OS_LOG_TYPE_DEFAULT, "Event received on outbound connection %d", (uint8_t *)&v16, 8u);
          }

          goto LABEL_21;
        }
        if (CFNLog::onceToken != -1) {
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
        }
        id v7 = (id)CFNLog::logger;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = *(void *)(a1 + 32);
          int v9 = *(unsigned __int16 *)(a1 + 56);
          int v16 = 138412546;
          uint64_t v17 = v8;
          __int16 v18 = 1024;
          int v19 = v9;
          _os_log_impl(&dword_184085000, v7, OS_LOG_TYPE_DEFAULT, "Connected to: %@:%d", (uint8_t *)&v16, 0x12u);
        }

        id v10 = v6;
        uint64_t v11 = 0;
      }
      [v10 connected:v11];
LABEL_21:
    }
  }
}

void __43__NSProxyConnection_initWithTCPConnection___block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 1:
      return;
    case 2:
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v2 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      LOWORD(v7[0]) = 0;
      objc_super v3 = "Inbound EVENT_READ_CLOSE";
      goto LABEL_18;
    case 3:
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v2 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      LOWORD(v7[0]) = 0;
      objc_super v3 = "Inbound EVENT_DISCONNECTED";
      goto LABEL_18;
    case 4:
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v2 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      LOWORD(v7[0]) = 0;
      objc_super v3 = "Inbound EVENT_WRITE_CLOSE";
LABEL_18:
      id v5 = v2;
      uint32_t v6 = 2;
      break;
    default:
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v2 = (id)CFNLog::logger;
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      v7[0] = 67109120;
      v7[1] = a2;
      objc_super v3 = "Event received on inbound connection %d";
      id v5 = v2;
      uint32_t v6 = 8;
      break;
  }
  _os_log_impl(&dword_184085000, v5, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)v7, v6);
LABEL_20:
}

@end