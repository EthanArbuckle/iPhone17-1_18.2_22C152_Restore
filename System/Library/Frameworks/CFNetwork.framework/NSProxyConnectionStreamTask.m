@interface NSProxyConnectionStreamTask
- (NSProxyConnectionStreamTask)initWithHost:(id)a3 port:(unsigned __int16)a4 queue:(id)a5 configuration:(id)a6;
- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6;
- (void)_onConnected:(uint64_t)a1;
- (void)cancel;
- (void)dealloc;
- (void)read:(unint64_t)a3 handler:(id)a4;
- (void)readFromStream;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)write:(id)a3 handler:(id)a4;
@end

@implementation NSProxyConnectionStreamTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamTask, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_host, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)dealloc
{
  [(NSProxyConnectionStreamTask *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)NSProxyConnectionStreamTask;
  [(NSProxyConnection *)&v3 dealloc];
}

- (void)cancel
{
  if (!self->_streamTask) {
    return;
  }
  id v3 = objc_getProperty(self, a2, 72, 1);
  if (v3)
  {
  }
  else if (!objc_getProperty(self, v4, 80, 1))
  {
    [(NSURLSessionStreamTask *)self->_streamTask closeRead];
    [(NSURLSessionStreamTask *)self->_streamTask closeRead];
    goto LABEL_7;
  }
  objc_msgSend(objc_getProperty(self, v5, 72, 1), "setDelegate:", 0);
  objc_msgSend(objc_getProperty(self, v6, 80, 1), "setDelegate:", 0);
  MEMORY[0x185319F20](self->_inputStream, 0);
  MEMORY[0x18531A970](self->_outputStream, 0);
  [(NSInputStream *)self->_inputStream close];
  [(NSOutputStream *)self->_outputStream close];
  objc_setProperty_atomic(self, v7, 0, 72);
  objc_setProperty_atomic(self, v8, 0, 80);
LABEL_7:
  streamTask = self->_streamTask;
  self->_streamTask = 0;
}

- (void)write:(id)a3 handler:(id)a4
{
  id v6 = a3;
  SEL v8 = (void (**)(id, uint64_t))a4;
  if (self && objc_getProperty(self, v7, 80, 1))
  {
    outputStream = self->_outputStream;
    id v10 = v6;
    uint64_t v11 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", [v10 bytes], objc_msgSend(v10, "length"));
    if (v11 < 1)
    {
      v8[2](v8, 1);
    }
    else
    {
      if (v11 != [v10 length]) {
        __assert_rtn("-[NSProxyConnectionStreamTask write:handler:]", "NSProxyConnection.m", 281, "written == [(NSData*)data length]");
      }
      v8[2](v8, 0);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    streamTask = self->_streamTask;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__NSProxyConnectionStreamTask_write_handler___block_invoke;
    v13[3] = &unk_1E5256300;
    v13[4] = self;
    objc_copyWeak(&v15, &location);
    v14 = v8;
    [(NSURLSessionStreamTask *)streamTask writeData:v6 timeout:v13 completionHandler:-1.0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __45__NSProxyConnectionStreamTask_write_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NSProxyConnectionStreamTask_write_handler___block_invoke_2;
  block[3] = &unk_1E52562D8;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
}

uint64_t __45__NSProxyConnectionStreamTask_write_handler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[NSProxyConnectionStreamTask _onConnected:]((uint64_t)WeakRetained, [*(id *)(a1 + 32) code]);

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) code];
  id v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);

  return v5(v3, v4);
}

- (void)_onConnected:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 48))
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v4 = (id)CFNLog::logger;
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v5)
      {
        uint64_t v6 = *(void *)(a1 + 56);
        int v7 = *(_DWORD *)(a1 + 64);
        int v13 = 138412802;
        uint64_t v14 = v6;
        __int16 v15 = 1024;
        int v16 = v7;
        __int16 v17 = 1024;
        int v18 = a2;
        id v8 = "Failure connecting to: %@:%d error:%d";
        id v9 = v4;
        uint32_t v10 = 24;
LABEL_10:
        _os_log_impl(&dword_184085000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
    else if (v5)
    {
      uint64_t v11 = *(void *)(a1 + 56);
      int v12 = *(_DWORD *)(a1 + 64);
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 1024;
      int v16 = v12;
      id v8 = "Connected to: %@:%d";
      id v9 = v4;
      uint32_t v10 = 18;
      goto LABEL_10;
    }

    *(unsigned char *)(a1 + 48) = 1;
  }
}

- (void)read:(unint64_t)a3 handler:(id)a4
{
  id v7 = a4;
  if (self->_streamTask && !objc_getProperty(self, v6, 72, 1))
  {
    objc_initWeak(&location, self);
    streamTask = self->_streamTask;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__NSProxyConnectionStreamTask_read_handler___block_invoke;
    v9[3] = &unk_1E52562B0;
    v9[4] = self;
    objc_copyWeak(&v11, &location);
    id v10 = v7;
    [(NSURLSessionStreamTask *)streamTask readDataOfMinLength:1 maxLength:a3 timeout:v9 completionHandler:120.0];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __44__NSProxyConnectionStreamTask_read_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__NSProxyConnectionStreamTask_read_handler___block_invoke_2;
  v11[3] = &unk_1E5256288;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  id v12 = v7;
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v15);
}

void __44__NSProxyConnectionStreamTask_read_handler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[NSProxyConnectionStreamTask _onConnected:]((uint64_t)WeakRetained, [*(id *)(a1 + 32) code]);

  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    dispatch_data_t v4 = dispatch_data_create((const void *)[v3 bytes], objc_msgSend(*(id *)(a1 + 40), "length"), 0, 0);
  }
  else {
    dispatch_data_t v4 = 0;
  }
  (*(void (**)(void, dispatch_data_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v4, [*(id *)(a1 + 32) code]);
}

- (NSProxyConnectionStreamTask)initWithHost:(id)a3 port:(unsigned __int16)a4 queue:(id)a5 configuration:(id)a6
{
  unsigned int v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)NSProxyConnectionStreamTask;
  id v14 = [(NSProxyConnectionStreamTask *)&v27 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    if (!_sessionConfig)
    {
      uint64_t v16 = +[NSURLSessionConfiguration defaultSessionConfiguration];
      __int16 v17 = (void *)_sessionConfig;
      _sessionConfig = v16;

      objc_msgSend((id)_sessionConfig, "set_allowTCPIOConnectionStreamTask:", 1);
      int v18 = [v13 objectForKeyedSubscript:@"NSServerConfigurationOutboundConnectionProxyDictionary"];
      [(id)_sessionConfig setConnectionProxyDictionary:v18];
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v19 setUnderlyingQueue:v12];
    [v19 setMaxConcurrentOperationCount:1];
    v20 = +[NSURLSession sessionWithConfiguration:_sessionConfig delegate:v15 delegateQueue:v19];
    uint64_t v21 = [v20 streamTaskWithHostName:v11 port:v8];
    streamTask = v15->_streamTask;
    v15->_streamTask = (NSURLSessionStreamTask *)v21;

    objc_storeStrong((id *)&v15->_host, a3);
    v15->_port = v8;
    if ([(id)_sessionConfig _allowTCPIOConnectionStreamTask])
    {
      [(NSURLSessionStreamTask *)v15->_streamTask captureStreams];
      [(NSURLSessionTask *)v15->_streamTask resume];
    }
    else
    {
      queue = v15->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__NSProxyConnectionStreamTask_initWithHost_port_queue_configuration___block_invoke;
      block[3] = &unk_1E5258228;
      v26 = v15;
      dispatch_async(queue, block);
    }
  }

  return v15;
}

void __69__NSProxyConnectionStreamTask_initWithHost_port_queue_configuration___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) resume];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  id v4 = WeakRetained;
  [WeakRetained connected:0];
}

- (void)URLSession:(id)a3 streamTask:(id)a4 didBecomeInputStream:(id)a5 outputStream:(id)a6
{
  unsigned int v8 = (NSInputStream *)a5;
  id v9 = (NSOutputStream *)a6;
  inputStream = self->_inputStream;
  self->_inputStream = v8;
  id v13 = v8;

  outputStream = self->_outputStream;
  self->_outputStream = v9;
  id v12 = v9;

  [(NSInputStream *)self->_inputStream setDelegate:self];
  [(NSOutputStream *)self->_outputStream setDelegate:self];
  MEMORY[0x185319F20](self->_inputStream, self->_queue);
  [(NSInputStream *)self->_inputStream open];
  MEMORY[0x18531A970](self->_outputStream, self->_queue);
  [(NSOutputStream *)self->_outputStream open];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v8 = (NSOutputStream *)a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
  }
  else {
    id WeakRetained = 0;
  }
  if ((NSOutputStream *)self->_inputStream == v8)
  {
    switch(a4)
    {
      case 0x10uLL:
        [WeakRetained outboundConnectionCompleteWithError:0];
        break;
      case 8uLL:
        id v13 = [(NSOutputStream *)v8 streamError];
        objc_msgSend(WeakRetained, "outboundConnectionCompleteWithError:", objc_msgSend(v13, "code"));

        break;
      case 2uLL:
        if (self->super._pendingWrites < 31) {
          [(NSProxyConnectionStreamTask *)(uint64_t)self readFromStream];
        }
        else {
          self->_dataAvailableForReading = 1;
        }
        break;
    }
  }
  else if (a4 == 1 && self->_outputStream == v8)
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    id v10 = (id)CFNLog::logger;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      host = self->_host;
      int port = self->_port;
      int v14 = 138412546;
      id v15 = host;
      __int16 v16 = 1024;
      int v17 = port;
      _os_log_impl(&dword_184085000, v10, OS_LOG_TYPE_DEFAULT, "Connected to: %@:%d", (uint8_t *)&v14, 0x12u);
    }

    [WeakRetained connected:0];
  }
}

- (void)readFromStream
{
  uint64_t v3 = MEMORY[0x1F4188790](a1, a2, a3);
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = [*(id *)(v3 + 72) read:buffer maxLength:0x8000];
    if (v5 >= 1)
    {
      dispatch_data_t v6 = dispatch_data_create(buffer, v5, 0, 0);
      ++*(void *)(v4 + 32);
      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 24));
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__NSProxyConnectionStreamTask_readFromStream__block_invoke;
      v9[3] = &unk_1E5256400;
      v9[4] = v4;
      [WeakRetained outboundConnectionReceivedData:v6 handler:v9];

LABEL_4:
      return;
    }
    if (!v5)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      dispatch_data_t v6 = (dispatch_data_t)(id)CFNLog::logger;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v8 = 0;
        _os_log_impl(&dword_184085000, v6, OS_LOG_TYPE_DEFAULT, "Read returned 0", v8, 2u);
      }
      goto LABEL_4;
    }
  }
}

uint64_t __45__NSProxyConnectionStreamTask_readFromStream__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    --*(void *)(v1 + 32);
    uint64_t v2 = *(void *)(result + 32);
    if (v2)
    {
      if (*(uint64_t *)(v2 + 32) <= 4 && (*(unsigned char *)(v2 + 68) & 1) != 0)
      {
        *(unsigned char *)(v2 + 68) = 0;
        return -[NSProxyConnectionStreamTask readFromStream](*(void *)(result + 32));
      }
    }
  }
  return result;
}

@end