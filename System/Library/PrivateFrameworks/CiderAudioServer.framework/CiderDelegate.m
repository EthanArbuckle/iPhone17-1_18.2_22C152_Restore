@interface CiderDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)init:(shared_ptr<RouteSessionAttributes>)a3;
@end

@implementation CiderDelegate

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = (util *)a4;
  util::server_log(v5);
  v6 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "InCider.mm";
    __int16 v13 = 1024;
    int v14 = 99;
    _os_log_impl(&dword_249BFC000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d New XPC connection created", buf, 0x12u);
  }
  [(util *)v5 setExportedObject:self->mObject];
  v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FDD0F40];
  [(util *)v5 setExportedInterface:v7];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__CiderDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v10[3] = &unk_26527D6B0;
  v10[4] = self;
  [(util *)v5 setInterruptionHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__CiderDelegate_listener_shouldAcceptNewConnection___block_invoke_63;
  v9[3] = &unk_26527D6B0;
  v9[4] = self;
  [(util *)v5 setInvalidationHandler:v9];
  [(util *)v5 resume];

  return 1;
}

void __52__CiderDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  util::server_log((util *)[*(id *)(*(void *)(a1 + 32) + 8) clearReporterOpts]);
  v1 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    v3 = "InCider.mm";
    __int16 v4 = 1024;
    int v5 = 105;
    _os_log_impl(&dword_249BFC000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Existing XPC connection interrupted, cleared reporter optionals", (uint8_t *)&v2, 0x12u);
  }
}

void __52__CiderDelegate_listener_shouldAcceptNewConnection___block_invoke_63(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  util::server_log((util *)[*(id *)(*(void *)(a1 + 32) + 8) clearReporterOpts]);
  v1 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    v3 = "InCider.mm";
    __int16 v4 = 1024;
    int v5 = 109;
    _os_log_impl(&dword_249BFC000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Existing XPC connection invalidated, cleared reporter optionals", (uint8_t *)&v2, 0x12u);
  }
}

- (id)init:(shared_ptr<RouteSessionAttributes>)a3
{
  ptr = a3.__ptr_;
  v12.receiver = self;
  v12.super_class = (Class)CiderDelegate;
  __int16 v4 = [(CiderDelegate *)&v12 init];
  if (v4)
  {
    int v5 = [CiderObject alloc];
    uint64_t v6 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v10 = *(void *)ptr;
    v11 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v7 = [(CiderObject *)v5 init:&v10];
    mObject = v4->mObject;
    v4->mObject = (CiderObject *)v7;

    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
  return v4;
}

@end