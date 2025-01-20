@interface CLTileRemoteDownloader
- (BOOL)canDownloadOverCellular;
- (BOOL)downloadAndDecompressFrom:(const char *)a3 toDecompressedDestination:(const char *)a4 withTimeout:(double)a5 withCompletionHandler:(id)a6;
- (CLTileRemoteDownloader)initWithConnection:()unique_ptr<CLConnection onQueue:(CLConnectionDeleter>)a3;
- (CLTileRemoteDownloader)initWithQueue:(id)a3 canDownloadOverCellular:(BOOL)a4;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (id)onDownloadAndDecompression;
- (void)cancel;
- (void)dealloc;
- (void)handleDisconnection;
- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3;
- (void)setCanDownloadOverCellular:(BOOL)a3;
- (void)setOnDownloadAndDecompression:(id)a3;
- (void)setQueue:(id)a3;
- (void)setup;
@end

@implementation CLTileRemoteDownloader

- (CLTileRemoteDownloader)initWithQueue:(id)a3 canDownloadOverCellular:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CLTileRemoteDownloader;
  v6 = [(CLTileRemoteDownloader *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CLTileRemoteDownloader *)v6 setQueue:a3];
    [(CLTileRemoteDownloader *)v7 setCanDownloadOverCellular:v4];
    xpc_connection_create("com.apple.location.tilesservice", (dispatch_queue_t)[(CLTileRemoteDownloader *)v7 queue]);
    operator new();
  }
  return 0;
}

- (CLTileRemoteDownloader)initWithConnection:()unique_ptr<CLConnection onQueue:(CLConnectionDeleter>)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLTileRemoteDownloader;
  v6 = [(CLTileRemoteDownloader *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(CLTileRemoteDownloader *)v6 setQueue:a4];
    v8 = *(CLConnection **)a3.__ptr_.__value_;
    *(void *)a3.__ptr_.__value_ = 0;
    std::unique_ptr<CLConnection,CLConnectionDeleter>::reset[abi:ne180100](&v7->_connection.__ptr_.__value_, v8);
    [(CLTileRemoteDownloader *)v7 setup];
  }
  return v7;
}

- (void)setup
{
  dispatch_assert_queue_V2((dispatch_queue_t)[(CLTileRemoteDownloader *)self queue]);
  objc_initWeak(&location, self);
  v4[1] = (id)MEMORY[0x263EF8330];
  v4[2] = (id)3221225472;
  v4[3] = __31__CLTileRemoteDownloader_setup__block_invoke;
  v4[4] = &unk_2652DD518;
  objc_copyWeak(&v5, &location);
  CLConnection::setDefaultMessageHandler();
  v3[1] = (id)MEMORY[0x263EF8330];
  v3[2] = (id)3221225472;
  v3[3] = __31__CLTileRemoteDownloader_setup__block_invoke_2;
  v3[4] = &unk_2652DD540;
  objc_copyWeak(v4, &location);
  CLConnection::setDisconnectionHandler();
  objc_copyWeak(v3, &location);
  CLConnection::setInterruptionHandler();
  CLConnection::start(self->_connection.__ptr_.__value_);
  objc_destroyWeak(v3);
  objc_destroyWeak(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __31__CLTileRemoteDownloader_setup__block_invoke(uint64_t a1, uint64_t *a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  BOOL v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v5 = *a2;
  v6 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [Weak handleMessage:&v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

uint64_t __31__CLTileRemoteDownloader_setup__block_invoke_2(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak handleDisconnection];
}

uint64_t __31__CLTileRemoteDownloader_setup__block_invoke_3(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak handleDisconnection];
}

- (void)dealloc
{
  [(CLTileRemoteDownloader *)self setOnDownloadAndDecompression:0];
  v3 = [(CLTileRemoteDownloader *)self queue];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  value = self->_connection.__ptr_.__value_;
  self->_connection.__ptr_.__value_ = 0;
  v8[3] = value;
  uint64_t v5 = [(CLTileRemoteDownloader *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CLTileRemoteDownloader_dealloc__block_invoke;
  block[3] = &unk_2652DD568;
  block[4] = v3;
  block[5] = v8;
  dispatch_async((dispatch_queue_t)v5, block);
  [(CLTileRemoteDownloader *)self setQueue:0];
  v6.receiver = self;
  v6.super_class = (Class)CLTileRemoteDownloader;
  [(CLTileRemoteDownloader *)&v6 dealloc];
  _Block_object_dispose(v8, 8);
}

CLConnection *__33__CLTileRemoteDownloader_dealloc__block_invoke(uint64_t a1)
{
  result = *(CLConnection **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (result)
  {
    result = (CLConnection *)CLConnection::deferredDelete(result);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)downloadAndDecompressFrom:(const char *)a3 toDecompressedDestination:(const char *)a4 withTimeout:(double)a5 withCompletionHandler:(id)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)[(CLTileRemoteDownloader *)self queue]);
  if (a5 <= 0.0)
  {
    if (onceToken_TilesFramework_Default != -1) {
      dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    }
    v20 = logObject_TilesFramework_Default;
    if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      __int16 v33 = 2082;
      v34 = &unk_24B55C8A9;
      __int16 v35 = 2050;
      double v36 = a5;
      _os_log_impl(&dword_24B559000, v20, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Ignoring #TileRemoteDownloader request with invalid timeout\", \"Timeout_s\":\"%{public}.09f\"}", buf, 0x1Cu);
      if (onceToken_TilesFramework_Default != -1) {
        dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
      }
    }
    v21 = logObject_TilesFramework_Default;
    if (!os_signpost_enabled((os_log_t)logObject_TilesFramework_Default)) {
      return 0;
    }
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    __int16 v33 = 2082;
    v34 = &unk_24B55C8A9;
    __int16 v35 = 2050;
    double v36 = a5;
    v22 = "Ignoring #TileRemoteDownloader request with invalid timeout";
    v23 = "{\"msg%{public}.0s\":\"Ignoring #TileRemoteDownloader request with invalid timeout\", \"Timeout_s\":\"%{public}.09f\"}";
    goto LABEL_39;
  }
  *(double *)&uint64_t v11 = COERCE_DOUBLE(objc_msgSend(NSURL, "URLWithString:", objc_msgSend(NSString, "stringWithUTF8String:", a3)));
  if (*(double *)&v11 == 0.0)
  {
    if (onceToken_TilesFramework_Default != -1) {
      dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    }
    v24 = logObject_TilesFramework_Default;
    if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      __int16 v33 = 2082;
      v34 = &unk_24B55C8A9;
      __int16 v35 = 2081;
      double v36 = *(double *)&a3;
      _os_log_impl(&dword_24B559000, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TileRemoteDownloader Ignoring new download request with invalid source string\", \"URLString\":%{private, location:escape_only}s}", buf, 0x1Cu);
      if (onceToken_TilesFramework_Default != -1) {
        dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
      }
    }
    v21 = logObject_TilesFramework_Default;
    if (!os_signpost_enabled((os_log_t)logObject_TilesFramework_Default)) {
      return 0;
    }
    *(_DWORD *)buf = 68289283;
    *(_DWORD *)&buf[4] = 0;
    __int16 v33 = 2082;
    v34 = &unk_24B55C8A9;
    __int16 v35 = 2081;
    double v36 = *(double *)&a3;
    v22 = "#TileRemoteDownloader Ignoring new download request with invalid source string";
    v23 = "{\"msg%{public}.0s\":\"#TileRemoteDownloader Ignoring new download request with invalid source string\", \"URL"
          "String\":%{private, location:escape_only}s}";
    goto LABEL_39;
  }
  double v12 = *(double *)&v11;
  uint64_t v13 = [MEMORY[0x263EFC5E8] requestWithURL:v11];
  if (!v13)
  {
    if (onceToken_TilesFramework_Default != -1) {
      dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    }
    v25 = logObject_TilesFramework_Default;
    if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      __int16 v33 = 2082;
      v34 = &unk_24B55C8A9;
      __int16 v35 = 2113;
      double v36 = v12;
      _os_log_impl(&dword_24B559000, v25, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TileRemoteDownloader Ignoring new download request with invalid source url\", \"URL\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (onceToken_TilesFramework_Default != -1) {
        dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
      }
    }
    v21 = logObject_TilesFramework_Default;
    if (!os_signpost_enabled((os_log_t)logObject_TilesFramework_Default)) {
      return 0;
    }
    *(_DWORD *)buf = 68289283;
    *(_DWORD *)&buf[4] = 0;
    __int16 v33 = 2082;
    v34 = &unk_24B55C8A9;
    __int16 v35 = 2113;
    double v36 = v12;
    v22 = "#TileRemoteDownloader Ignoring new download request with invalid source url";
    v23 = "{\"msg%{public}.0s\":\"#TileRemoteDownloader Ignoring new download request with invalid source url\", \"URL\":"
          "%{private, location:escape_only}@}";
    goto LABEL_39;
  }
  v14 = (void *)v13;
  uint64_t v15 = objc_msgSend(NSURL, "fileURLWithPath:isDirectory:", objc_msgSend(NSString, "stringWithUTF8String:", a4), 0);
  if (!v15)
  {
    if (onceToken_TilesFramework_Default != -1) {
      dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    }
    v26 = logObject_TilesFramework_Default;
    if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      __int16 v33 = 2082;
      v34 = &unk_24B55C8A9;
      __int16 v35 = 2113;
      double v36 = 0.0;
      _os_log_impl(&dword_24B559000, v26, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"TileRemoteDownloader Ignoring new download request with invalid decompressed destination url\", \"decompressedDestination\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (onceToken_TilesFramework_Default != -1) {
        dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
      }
    }
    v21 = logObject_TilesFramework_Default;
    if (!os_signpost_enabled((os_log_t)logObject_TilesFramework_Default)) {
      return 0;
    }
    *(_DWORD *)buf = 68289283;
    *(_DWORD *)&buf[4] = 0;
    __int16 v33 = 2082;
    v34 = &unk_24B55C8A9;
    __int16 v35 = 2113;
    double v36 = 0.0;
    v22 = "TileRemoteDownloader Ignoring new download request with invalid decompressed destination url";
    v23 = "{\"msg%{public}.0s\":\"TileRemoteDownloader Ignoring new download request with invalid decompressed destinatio"
          "n url\", \"decompressedDestination\":%{private, location:escape_only}@}";
LABEL_39:
    _os_signpost_emit_with_name_impl(&dword_24B559000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v22, v23, buf, 0x1Cu);
    return 0;
  }
  uint64_t v16 = v15;
  if (onceToken_TilesFramework_Default != -1) {
    dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
  }
  v17 = logObject_TilesFramework_Default;
  if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_DEFAULT))
  {
    value = self->_connection.__ptr_.__value_;
    *(_DWORD *)buf = 68290307;
    *(_DWORD *)&buf[4] = 0;
    __int16 v33 = 2082;
    v34 = &unk_24B55C8A9;
    __int16 v35 = 2050;
    double v36 = *(double *)&self;
    __int16 v37 = 2050;
    v38 = value;
    __int16 v39 = 1026;
    BOOL v40 = [(CLTileRemoteDownloader *)self canDownloadOverCellular];
    __int16 v41 = 2113;
    double v42 = v12;
    __int16 v43 = 2113;
    uint64_t v44 = v16;
    _os_log_impl(&dword_24B559000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TileRemoteDownloader - starting request\", \"self\":\"%{public}p\", \"connection\":\"%{public}p\", \"canDownloadOverCellular\":%{public}hhd, \"srcURL\":%{private, location:escape_only}@, \"decompressedDestination\":%{private, location:escape_only}@}", buf, 0x40u);
  }
  [v14 setTimeoutInterval:a5];
  objc_msgSend(v14, "setAllowsCellularAccess:", -[CLTileRemoteDownloader canDownloadOverCellular](self, "canDownloadOverCellular"));
  [(CLTileRemoteDownloader *)self setOnDownloadAndDecompression:a6];
  v30[0] = @"kCLConnectionDownloadAndDecompressDestinationURLKey";
  v30[1] = @"kCLConnectionDownloadAndDecompressRequestKey";
  v31[0] = v16;
  v31[1] = v14;
  *(void *)buf = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  std::allocate_shared[abi:ne180100]<CLConnectionMessage,std::allocator<CLConnectionMessage>,char const(&)[35],NSDictionary *&,void>("kCLConnectionDownloadAndDecompress", buf, &v28);
  char v19 = CLConnection::sendMessage();
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  return v19;
}

- (void)cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)[(CLTileRemoteDownloader *)self queue]);
  if ([(CLTileRemoteDownloader *)self onDownloadAndDecompression])
  {
    std::allocate_shared[abi:ne180100]<CLConnectionMessage,std::allocator<CLConnectionMessage>,char const(&)[41],void>("kCLConnectionDownloadAndDecompressCancel", &v3);
    CLConnection::sendMessage();
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  var0 = (CLConnectionMessage **)a3.var0;
  uint64_t v37 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)[(CLTileRemoteDownloader *)self queue]);
  uint64_t v5 = CLConnectionMessage::name(*var0);
  if (*(char *)(v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)v5, *(void *)(v5 + 8));
  }
  else
  {
    long long v6 = *(_OWORD *)v5;
    v26.__r_.__value_.__r.__words[2] = *(void *)(v5 + 16);
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v6;
  }
  v7 = _os_activity_create(&dword_24B559000, "CL: #TileRemoteDownloader Handling message from service", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  if (onceToken_TilesFramework_Default != -1) {
    dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
  }
  v8 = logObject_TilesFramework_Default;
  if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = &v26;
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      objc_super v9 = (std::string *)v26.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 68289794;
    int v28 = 0;
    __int16 v29 = 2082;
    v30 = &unk_24B55C8A9;
    __int16 v31 = 2082;
    v32 = "activity";
    __int16 v33 = 2082;
    v34 = v9;
    __int16 v35 = 2050;
    double v36 = self;
    _os_log_impl(&dword_24B559000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TileRemoteDownloader Handling message from service\", \"event\":%{public, location:escape_only}s, \"messageName\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v26.__r_.__value_.__l.__size_;
  }
  if (size == 39)
  {
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v20 = &v26;
    }
    else {
      v20 = (std::string *)v26.__r_.__value_.__r.__words[0];
    }
    if (!memcmp(v20, "kCLConnectionDownloadAndDecompressError", 0x27uLL))
    {
      v21 = *var0;
      v22 = (objc_class *)objc_opt_class();
      uint64_t ObjectOfClass = CLConnectionMessage::getObjectOfClass(v21, v22);
      id v24 = [(CLTileRemoteDownloader *)self onDownloadAndDecompression];
      (*((void (**)(id, void, void, uint64_t))v24 + 2))(v24, 0, 0, ObjectOfClass);
    }
  }
  else if (size == 41)
  {
    uint64_t v11 = (v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v26
        : (std::string *)v26.__r_.__value_.__r.__words[0];
    if (!memcmp(v11, "kCLConnectionDownloadAndDecompressSuccess", 0x29uLL))
    {
      double v12 = *var0;
      uint64_t v13 = (void *)MEMORY[0x263EFFA08];
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = (NSSet *)objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
      DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v12, v15);
      uint64_t v17 = [DictionaryOfClasses objectForKeyedSubscript:@"kCLConnectionDownloadAndDecompressFileKey"];
      uint64_t v18 = [DictionaryOfClasses objectForKeyedSubscript:@"kCLConnectionDownloadAndDecompressURLResponseKey"];
      char v19 = [(CLTileRemoteDownloader *)self onDownloadAndDecompression];
      v19[2](v19, v17, v18, 0);
    }
  }
  [(CLTileRemoteDownloader *)self setOnDownloadAndDecompression:0];
  os_activity_scope_leave(&state);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
}

- (void)handleDisconnection
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)[(CLTileRemoteDownloader *)self queue]);
  if ([(CLTileRemoteDownloader *)self onDownloadAndDecompression])
  {
    uint64_t v3 = _os_activity_create(&dword_24B559000, "CL: #TileRemoteDownloader Service is unavailable, sending error to clients", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &v7);

    if (onceToken_TilesFramework_Default != -1) {
      dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    }
    BOOL v4 = logObject_TilesFramework_Default;
    if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v9 = 0;
      __int16 v10 = 2082;
      uint64_t v11 = &unk_24B55C8A9;
      __int16 v12 = 2082;
      uint64_t v13 = "activity";
      _os_log_impl(&dword_24B559000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TileRemoteDownloader Service is unavailable, sending error to clients\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"kCLTileErrorDomain" code:2 userInfo:0];
    id v6 = [(CLTileRemoteDownloader *)self onDownloadAndDecompression];
    (*((void (**)(id, void, void, uint64_t))v6 + 2))(v6, 0, 0, v5);
    [(CLTileRemoteDownloader *)self setOnDownloadAndDecompression:0];
    os_activity_scope_leave(&v7);
  }
}

- (BOOL)canDownloadOverCellular
{
  return self->_canDownloadOverCellular;
}

- (void)setCanDownloadOverCellular:(BOOL)a3
{
  self->_canDownloadOverCellular = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)onDownloadAndDecompression
{
  return self->_onDownloadAndDecompression;
}

- (void)setOnDownloadAndDecompression:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end