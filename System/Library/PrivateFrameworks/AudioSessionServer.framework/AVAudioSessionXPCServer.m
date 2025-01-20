@interface AVAudioSessionXPCServer
- (AVAudioSessionXPCServer)init;
- (AVAudioSessionXPCServer)initWithDelegate:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (id).cxx_construct;
- (void)dealloc;
- (void)init2;
- (void)removeConnection:(id)a3;
- (void)start;
@end

@implementation AVAudioSessionXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (as::server *)a4;
  v8 = v7;
  if (self->_needsDefaultWorldInit)
  {
    v9 = *(id *)as::server::gSessionServerLog(v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0].__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)"AVAudioSessionXPCServer.mm";
      WORD2(buf[0].__r_.__value_.__r.__words[1]) = 1024;
      *(_DWORD *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 6) = 503;
      _os_log_impl(&dword_1CFE2A000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Performing deferred initialization", (uint8_t *)buf, 0x12u);
    }
    self->_needsDefaultWorldInit = 0;
  }
  v10 = self->_connections;
  objc_sync_enter(v10);
  [(NSMutableArray *)self->_connections addObject:v8];
  objc_sync_exit(v10);

  [(as::server *)v8 setExportedInterface:self->_exportedInterface];
  [(as::server *)v8 setRemoteObjectInterface:self->_callbackInterface];
  v11 = [(as::server *)v8 _queue];
  label = (char *)dispatch_queue_get_label(v11);
  std::string::basic_string[abi:ne180100]<0>(buf, label);
  as::CreateFixedPriorityDispatchQueue((const void **)&buf[0].__r_.__value_.__l.__data_, QOS_CLASS_USER_INTERACTIVE, &v27);
  if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf[0].__r_.__value_.__l.__data_);
  }

  [(as::server *)v8 _setQueue:v27];
  LODWORD(buf[0].__r_.__value_.__l.__data_) = 0;
  memset(&buf[0].__r_.__value_.__r.__words[1], 0, 40);
  LODWORD(buf[0].__r_.__value_.__l.__data_) = [(as::server *)v8 processIdentifier];
  objc_storeStrong((id *)&buf[0].__r_.__value_.__l.__size_, a4);
  v13 = [AVAudioSessionRemoteXPCClient alloc];
  int data = (int)buf[0].__r_.__value_.__l.__data_;
  id v24 = (id)buf[0].__r_.__value_.__l.__size_;
  objc_copyWeak(&v25, (id *)&buf[0].__r_.__value_.__r.__words[2]);
  if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, buf[1].__r_.__value_.__l.__data_, buf[1].__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = buf[1];
  }
  v14 = [(AVAudioSessionRemoteXPCClient *)v13 initWithServer:self process:&data delegate:self->_serverDelegate];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  objc_destroyWeak(&v25);

  objc_initWeak(&location, v14);
  objc_initWeak(&from, v8);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__AVAudioSessionXPCServer_listener_shouldAcceptNewConnection___block_invoke;
  v18[3] = &unk_1E6875860;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  v15 = (void *)MEMORY[0x1D25E1DE0](v18);
  [(as::server *)v8 setInterruptionHandler:v15];
  [(as::server *)v8 setInvalidationHandler:v15];
  [(as::server *)v8 setExportedObject:v14];
  [(as::server *)v8 resume];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf[1].__r_.__value_.__l.__data_);
  }
  objc_destroyWeak((id *)&buf[0].__r_.__value_.__r.__words[2]);

  id v16 = v27;
  id v27 = 0;

  return 1;
}

- (void)init2
{
}

- (AVAudioSessionXPCServer)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = *(id *)as::server::gSessionServerLog((as::server *)self);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "AVAudioSessionXPCServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 442;
    _os_log_impl(&dword_1CFE2A000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Server starting", buf, 0x12u);
  }
  v16.receiver = self;
  v16.super_class = (Class)AVAudioSessionXPCServer;
  id v4 = [(AVAudioSessionXPCServer *)&v16 init];
  if (v4)
  {
    as::WorkloopPool::Create((as::WorkloopPool *)0x14);
    long long v5 = *(_OWORD *)buf;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    id v6 = (std::__shared_weak_count *)*((void *)v4 + 7);
    *((_OWORD *)v4 + 3) = v5;
    if (v6)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      if (*(void *)&buf[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
      }
    }
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.audio.AudioSession"];
    v8 = (void *)*((void *)v4 + 9);
    *((void *)v4 + 9) = v7;

    v9 = [*((id *)v4 + 9) _queue];
    label = (char *)dispatch_queue_get_label(v9);
    std::string::basic_string[abi:ne180100]<0>(buf, label);
    as::CreateFixedPriorityDispatchQueue((const void **)buf, QOS_CLASS_USER_INTERACTIVE, &v15);
    if (v18 < 0) {
      operator delete(*(void **)buf);
    }

    [*((id *)v4 + 9) _setQueue:v15];
    v11 = [*((id *)v4 + 9) endpoint];
    as::SetServerXPCListenerEndpoint(v11, v12);

    *((unsigned char *)v4 + 40) = 1;
    [v4 init2];
    id v13 = v15;
    id v15 = 0;
  }
  return (AVAudioSessionXPCServer *)v4;
}

- (AVAudioSessionXPCServer)initWithDelegate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v5 = (as::server *)a3;
  id v6 = *(id *)as::server::gSessionServerLog(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "AVAudioSessionXPCServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 461;
    _os_log_impl(&dword_1CFE2A000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Server starting", buf, 0x12u);
  }
  v19.receiver = self;
  v19.super_class = (Class)AVAudioSessionXPCServer;
  id v7 = [(AVAudioSessionXPCServer *)&v19 init];
  if (v7)
  {
    as::WorkloopPool::Create((as::WorkloopPool *)0x14);
    long long v8 = *(_OWORD *)buf;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    v9 = (std::__shared_weak_count *)*((void *)v7 + 7);
    *((_OWORD *)v7 + 3) = v8;
    if (v9)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      if (*(void *)&buf[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
      }
    }
    objc_storeStrong((id *)v7 + 8, a3);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.audio.AudioSession"];
    v11 = (void *)*((void *)v7 + 9);
    *((void *)v7 + 9) = v10;

    v12 = [*((id *)v7 + 9) _queue];
    label = (char *)dispatch_queue_get_label(v12);
    std::string::basic_string[abi:ne180100]<0>(buf, label);
    as::CreateFixedPriorityDispatchQueue((const void **)buf, QOS_CLASS_USER_INTERACTIVE, &v18);
    if (v21 < 0) {
      operator delete(*(void **)buf);
    }

    [*((id *)v7 + 9) _setQueue:v18];
    v14 = [*((id *)v7 + 9) endpoint];
    as::SetServerXPCListenerEndpoint(v14, v15);

    *((unsigned char *)v7 + 40) = 1;
    [v7 init2];
    id v16 = v18;
    id v18 = 0;
  }
  return (AVAudioSessionXPCServer *)v7;
}

- (void)start
{
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = self->_connections;
  objc_sync_enter(v3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_connections;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v8 suspend];
        [v8 invalidate];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v23 count:16];
    }
    while (v5);
  }

  connections = self->_connections;
  self->_connections = 0;

  objc_sync_exit(v3);
  value = (std::promise<void> *)self->_deallocPromise.__ptr_.__value_;
  if (value) {
    std::promise<void>::set_value(value);
  }
  v11 = *(id *)as::server::gSessionServerLog((as::server *)value);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "AVAudioSessionXPCServer.mm";
    __int16 v19 = 1024;
    int v20 = 497;
    __int16 v21 = 2048;
    uint64_t v22 = self;
    _os_log_impl(&dword_1CFE2A000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Server %p deallocated", buf, 0x1Cu);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVAudioSessionXPCServer;
  [(AVAudioSessionXPCServer *)&v12 dealloc];
}

void __62__AVAudioSessionXPCServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];

  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 setExportedObject:0];
}

- (void)removeConnection:(id)a3
{
  obj = self->_connections;
  id v5 = a3;
  objc_sync_enter(obj);
  [(NSMutableArray *)self->_connections removeObject:v5];

  objc_sync_exit(obj);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_serverDelegate, 0);
  cntrl = self->_workloopPool.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  std::unique_ptr<std::promise<void>>::reset[abi:ne180100]((uint64_t *)&self->_deallocPromise, 0);
  objc_storeStrong((id *)&self->_callbackInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end