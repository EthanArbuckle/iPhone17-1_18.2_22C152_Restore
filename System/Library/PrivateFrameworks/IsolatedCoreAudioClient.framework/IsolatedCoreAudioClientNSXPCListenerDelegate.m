@interface IsolatedCoreAudioClientNSXPCListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IsolatedCoreAudioClientNSXPCListenerDelegate)initWithInterface:(id)a3;
- (NSMutableDictionary)mConnections;
- (NSXPCInterface)mInterface;
- (function<void)mClientReaper;
- (id).cxx_construct;
- (id)lookupConnectionForPID:(int)a3;
- (uint64_t)initWithInterface:;
- (unsigned)getUseCaseIDForPID:(int)a3;
- (void)initWithInterface:;
- (void)setClientReaper:(function<void)(int;
- (void)setMClientReaper:(function<void)(int;
- (void)setMConnections:(id)a3;
- (void)setMInterface:(id)a3;
- (void)setUseCaseIDForCurrentConnection:(unsigned int)a3;
@end

@implementation IsolatedCoreAudioClientNSXPCListenerDelegate

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](self->_mClientReaper.__f_.__buf_.__lx);
  objc_storeStrong((id *)&self->_mConnections, 0);
  objc_storeStrong((id *)&self->_mInterface, 0);
}

- (void)setMClientReaper:(function<void)(int
{
  v9[3] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)a3);
  p_mClientReaper = &self->_mClientReaper;
  if (&self->_mClientReaper != (function<void (int)> *)v7)
  {
    v5 = v8;
    f = (function<void (int)> *)self->_mClientReaper.__f_.__f_;
    if (v8 == v7)
    {
      if (f == p_mClientReaper)
      {
        (*(void (**)(void *, void *))(v7[0] + 24))(v7, v9);
        (*(void (**)(void *))(*v8 + 32))(v8);
        v8 = 0;
        (*(void (**)(void *, void *))(*(void *)self->_mClientReaper.__f_.__f_ + 24))(self->_mClientReaper.__f_.__f_, v7);
        (*(void (**)(void *))(*(void *)self->_mClientReaper.__f_.__f_ + 32))(self->_mClientReaper.__f_.__f_);
        self->_mClientReaper.__f_.__f_ = 0;
        v8 = v7;
        (*(void (**)(void *, function<void (int)> *))(v9[0] + 24))(v9, &self->_mClientReaper);
        (*(void (**)(void *))(v9[0] + 32))(v9);
      }
      else
      {
        (*(void (**)(void *, function<void (int)> *))(v7[0] + 24))(v7, &self->_mClientReaper);
        (*(void (**)(void *))(*v8 + 32))(v8);
        v8 = self->_mClientReaper.__f_.__f_;
      }
      self->_mClientReaper.__f_.__f_ = p_mClientReaper;
    }
    else if (f == p_mClientReaper)
    {
      (*(void (**)(function<void (int)> *, void *))(*(void *)p_mClientReaper->__f_.__buf_.__lx + 24))(&self->_mClientReaper, v7);
      (*(void (**)(void *))(*(void *)self->_mClientReaper.__f_.__f_ + 32))(self->_mClientReaper.__f_.__f_);
      self->_mClientReaper.__f_.__f_ = v8;
      v8 = v7;
    }
    else
    {
      v8 = self->_mClientReaper.__f_.__f_;
      self->_mClientReaper.__f_.__f_ = v5;
    }
  }
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v7);
}

- (function<void)mClientReaper
{
  return (function<void (int)> *)std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_mClientReaper);
}

- (void)setMConnections:(id)a3
{
}

- (NSMutableDictionary)mConnections
{
  return self->_mConnections;
}

- (void)setMInterface:(id)a3
{
}

- (NSXPCInterface)mInterface
{
  return self->_mInterface;
}

- (unsigned)getUseCaseIDForPID:(int)a3
{
  v3 = [(IsolatedCoreAudioClientNSXPCListenerDelegate *)self lookupConnectionForPID:*(void *)&a3];
  unsigned int v4 = [v3 useCaseID];

  return v4;
}

- (void)setUseCaseIDForCurrentConnection:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = [MEMORY[0x263F08D68] currentConnection];
  v5 = -[IsolatedCoreAudioClientNSXPCListenerDelegate lookupConnectionForPID:](self, "lookupConnectionForPID:", [v6 getProcessID]);
  [v5 setUseCaseID:v3];
}

- (id)lookupConnectionForPID:(int)a3
{
  unsigned int v4 = [NSNumber numberWithInt:*(void *)&a3];
  v5 = [(IsolatedCoreAudioClientNSXPCListenerDelegate *)self mConnections];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setClientReaper:(function<void)(int
{
  v4[4] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)v4, (uint64_t)a3);
  [(IsolatedCoreAudioClientNSXPCListenerDelegate *)self setMClientReaper:v4];
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "IsolatedCoreAudioClientNSXPCListenerDelegate.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 31;
    _os_log_impl(&dword_25439F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioClientNSXPCListenerDelegate - Listener", buf, 0x12u);
  }

  uint64_t v7 = [v5 getProcessID];
  int v8 = v7;
  v9 = [NSNumber numberWithInt:v7];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = [[IsolatedCoreAudioUseCaseConnection alloc] initWithConnection:v5];
  v10 = [(IsolatedCoreAudioClientNSXPCListenerDelegate *)self mInterface];
  [v5 setExportedInterface:v10];

  [v5 setExportedObject:self];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __83__IsolatedCoreAudioClientNSXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v22[3] = &unk_2653A8138;
  v22[4] = buf;
  [v5 setInterruptionHandler:v22];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __83__IsolatedCoreAudioClientNSXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_3;
  v18 = &unk_2653A8160;
  v19 = self;
  int v21 = v8;
  id v11 = v9;
  id v20 = v11;
  [v5 setInvalidationHandler:&v15];
  v12 = [(IsolatedCoreAudioClientNSXPCListenerDelegate *)self mConnections];
  objc_sync_enter(v12);
  v13 = [(IsolatedCoreAudioClientNSXPCListenerDelegate *)self mConnections];
  [v13 setObject:*(void *)(*(void *)&buf[8] + 40) forKey:v11];

  objc_sync_exit(v12);
  [v5 resume];

  _Block_object_dispose(buf, 8);
  return 1;
}

uint64_t __83__IsolatedCoreAudioClientNSXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "IsolatedCoreAudioClientNSXPCListenerDelegate.mm";
    __int16 v6 = 1024;
    int v7 = 39;
    _os_log_impl(&dword_25439F000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioClientNSXPCListenerDelegate - interruptionHandler", (uint8_t *)&v4, 0x12u);
  }

  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
}

void __83__IsolatedCoreAudioClientNSXPCListenerDelegate_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v6[0]) = 136315394;
    *(void *)((char *)v6 + 4) = "IsolatedCoreAudioClientNSXPCListenerDelegate.mm";
    WORD6(v6[0]) = 1024;
    *(_DWORD *)((char *)v6 + 14) = 44;
    _os_log_impl(&dword_25439F000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioClientNSXPCListenerDelegate - invalidationHandler", (uint8_t *)v6, 0x12u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    [v3 mClientReaper];
    uint64_t v3 = (void *)*((void *)&v6[1] + 1);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  std::function<void ()(int)>::operator()((uint64_t)v3, *(_DWORD *)(a1 + 48));
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v6);
  int v4 = [*(id *)(a1 + 32) mConnections];
  objc_sync_enter(v4);
  id v5 = [*(id *)(a1 + 32) mConnections];
  [v5 removeObjectForKey:*(void *)(a1 + 40)];

  objc_sync_exit(v4);
}

- (IsolatedCoreAudioClientNSXPCListenerDelegate)initWithInterface:(id)a3
{
  v10[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IsolatedCoreAudioClientNSXPCListenerDelegate;
  id v5 = [(IsolatedCoreAudioClientNSXPCListenerDelegate *)&v9 init];
  __int16 v6 = v5;
  if (v5)
  {
    [(IsolatedCoreAudioClientNSXPCListenerDelegate *)v5 setMInterface:v4];
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    [(IsolatedCoreAudioClientNSXPCListenerDelegate *)v6 setMConnections:v7];

    v10[0] = &unk_2703C3758;
    v10[3] = v10;
    [(IsolatedCoreAudioClientNSXPCListenerDelegate *)v6 setMClientReaper:v10];
    std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v10);
  }

  return v6;
}

- (void)initWithInterface:
{
}

- (uint64_t)initWithInterface:
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"Z66-[IsolatedCoreAudioClientNSXPCListenerDelegate initWithInterface:]E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end