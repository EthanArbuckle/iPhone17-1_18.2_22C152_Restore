@interface IsolatedCoreAudioXPCService
- (IsolatedCoreAudioXPCService)init;
- (IsolatedCoreAudioXPCService)initWithClientReaper:(function<void)(int;
- (id).cxx_construct;
- (id)init;
- (shared_ptr<ServerSideAudioSwitchboard>)mServerSideSwitchboard;
- (uint64_t)init;
- (void)checkInForIsolatedAudioSharedResources:(unsigned int)a3 with:(id)a4;
- (void)checkOutForIsolatedAudioSharedResources:(unsigned int)a3;
- (void)getWorkgroupForIsolatedAudio:(unsigned int)a3 with:(id)a4;
- (void)init;
- (void)setMServerSideSwitchboard:(shared_ptr<ServerSideAudioSwitchboard>)a3;
- (void)startIsolatedAudioForUseCase:(unsigned int)a3 atTime:(unint64_t)a4 with:(id)a5;
- (void)startIsolatedAudioForUseCase:(unsigned int)a3 with:(id)a4;
- (void)stopIsolatedAudioForUseCase:(unsigned int)a3 with:(id)a4;
@end

@implementation IsolatedCoreAudioXPCService

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_mServerSideSwitchboard.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setMServerSideSwitchboard:(shared_ptr<ServerSideAudioSwitchboard>)a3
{
  p_mServerSideSwitchboard = &self->_mServerSideSwitchboard;
  v5 = *(ServerSideAudioSwitchboard **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_mServerSideSwitchboard.__cntrl_;
  p_mServerSideSwitchboard->__ptr_ = v5;
  p_mServerSideSwitchboard->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<ServerSideAudioSwitchboard>)mServerSideSwitchboard
{
  cntrl = self->_mServerSideSwitchboard.__cntrl_;
  *v2 = self->_mServerSideSwitchboard.__ptr_;
  v2[1] = (ServerSideAudioSwitchboard *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ServerSideAudioSwitchboard *)self;
  return result;
}

- (void)stopIsolatedAudioForUseCase:(unsigned int)a3 with:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, uint64_t))a4;
  v7 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v9 = 136315394;
    *(void *)&v9[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&v9[12] = 1024;
    *(_DWORD *)&v9[14] = 139;
    _os_log_impl(&dword_25439F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - Stop", v9, 0x12u);
  }

  [(IsolatedCoreAudioXPCService *)self mServerSideSwitchboard];
  uint64_t v8 = ServerSideAudioSwitchboard::stopServerIOThread(*(ServerSideAudioSwitchboard **)v9, a3);
  if (*(void *)&v9[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v9[8]);
  }
  v6[2](v6, v8);
}

- (void)startIsolatedAudioForUseCase:(unsigned int)a3 atTime:(unint64_t)a4 with:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void (**)(id, uint64_t))a5;
  v9 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 122;
    _os_log_impl(&dword_25439F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - StartAtTime", buf, 0x12u);
  }

  [(IsolatedCoreAudioXPCService *)self mServerSideSwitchboard];
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)buf, *(uint64_t *)v15, a3);
  if (buf[16])
  {
    if (*(unsigned char *)(*(void *)(*(void *)buf + 16) + 64))
    {
      uint64_t v10 = *(void *)(*(void *)v15 + 40);
      v11 = *(std::__shared_weak_count **)(*(void *)buf + 8);
      uint64_t v13 = **(void **)buf;
      v14 = v11;
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t *, unint64_t))(*(void *)v10 + 56))(v10, &v13, a4);
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
    }
    else
    {
      uint64_t v12 = 4;
    }
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  else
  {
    uint64_t v12 = 4;
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  v8[2](v8, v12);
}

- (void)startIsolatedAudioForUseCase:(unsigned int)a3 with:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, uint64_t))a4;
  v7 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "IsolatedCoreAudioXPCService.mm";
    __int16 v26 = 1024;
    int v27 = 105;
    _os_log_impl(&dword_25439F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - Start", buf, 0x12u);
  }

  [(IsolatedCoreAudioXPCService *)self mServerSideSwitchboard];
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)&v21, v16, a3);
  int v9 = v23;
  if (v23 && *(unsigned char *)(*(void *)(v21 + 16) + 64))
  {
    uint64_t v10 = *(void *)(v16 + 40);
    v11 = *(std::__shared_weak_count **)(v21 + 8);
    __p = *(void **)v21;
    v19 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v12 = (*(uint64_t (**)(uint64_t, void **))(*(void *)v10 + 48))(v10, &__p);
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    }
LABEL_13:
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    goto LABEL_15;
  }
  v8.i32[0] = bswap32(a3);
  *(int8x8_t *)v8.i8 = vzip1_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v8.i8);
  v13.i64[0] = 0x1F0000001FLL;
  v13.i64[1] = 0x1F0000001FLL;
  v14.i64[0] = 0x5F0000005FLL;
  v14.i64[1] = 0x5F0000005FLL;
  *(int8x8_t *)v8.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v14, (uint32x4_t)vsraq_n_s32(v13, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v8.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)v8.i8, (int8x8_t)0x2E002E002E002ELL);
  char v20 = 4;
  LODWORD(__p) = vmovn_s16(v8).u32[0];
  BYTE4(__p) = 0;
  v15 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "ServerSideAudioSwitchboard.cpp";
    __int16 v26 = 1024;
    int v27 = 45;
    __int16 v28 = 2080;
    p_p = &__p;
    _os_log_impl(&dword_25439F000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ServerSideAudioSwitchboard::startServerIOThread IO not started for client %s", buf, 0x1Cu);
    if (v20 < 0) {
      operator delete(__p);
    }
  }
  uint64_t v12 = 4;
  if (v9) {
    goto LABEL_13;
  }
LABEL_15:
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  v6[2](v6, v12);
}

- (void)getWorkgroupForIsolatedAudio:(unsigned int)a3 with:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 86;
    _os_log_impl(&dword_25439F000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - getWorkgroupForIsolatedAudio", buf, 0x12u);
  }

  [(IsolatedCoreAudioXPCService *)self mServerSideSwitchboard];
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)buf, v13, a3);
  if (buf[16])
  {
    int16x8_t v8 = *(std::__shared_weak_count **)&buf[8];
    uint64_t v9 = *(void *)(v13 + 40);
    uint64_t v10 = *(void *)(*(void *)buf + 8);
    *(void *)buf = **(void **)buf;
    *(void *)&buf[8] = v10;
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    v11 = (void *)(*(uint64_t (**)(uint64_t, unsigned char *))(*(void *)v9 + 72))(v9, buf);
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    uint64_t v12 = v11;
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    IOThreadWorkgroup::IOThreadWorkgroup((IOThreadWorkgroup *)buf, v12);
  }
  std::__throw_bad_optional_access[abi:ne180100]();
}

- (void)checkOutForIsolatedAudioSharedResources:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "IsolatedCoreAudioXPCService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 73;
    _os_log_impl(&dword_25439F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - checkOutForIsolatedAudioSharedResources", buf, 0x12u);
  }

  [(IsolatedCoreAudioXPCService *)self mServerSideSwitchboard];
  uint64_t v6 = *(void *)v16;
  ServerSideAudioSwitchboard::GetClientForIO((ServerSideAudioSwitchboard *)buf, *(uint64_t *)v16, a3);
  if (buf[16])
  {
    uint64_t v7 = *(void *)(*(void *)v16 + 40);
    int16x8_t v8 = *(uint64_t **)buf;
    uint64_t v9 = *(std::__shared_weak_count **)(*(void *)buf + 8);
    uint64_t v14 = **(void **)buf;
    v15 = v9;
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v7 + 64))(v7, &v14);
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    *(unsigned char *)(v8[2] + 64) = 0;
    uint64_t v10 = *(void *)(v6 + 40);
    v11 = (std::__shared_weak_count *)v8[1];
    uint64_t v12 = *v8;
    uint64_t v13 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v10 + 40))(v10, &v12);
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
}

- (void)checkInForIsolatedAudioSharedResources:(unsigned int)a3 with:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  a4;
  uint64_t v6 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int buf = 136315394;
    buf_4 = "IsolatedCoreAudioXPCService.mm";
    __int16 buf_12 = 1024;
    int buf_14 = 44;
    _os_log_impl(&dword_25439F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - checkInForIsolatedAudioSharedResources", (uint8_t *)&buf, 0x12u);
  }

  [(IsolatedCoreAudioClientNSXPCListenerDelegate *)self setUseCaseIDForCurrentConnection:v4];
  [(IsolatedCoreAudioXPCService *)self mServerSideSwitchboard];
  (*(void (**)(uint64_t *__return_ptr))(**(void **)(v11 + 40) + 16))(&v12);
  uint64_t v7 = operator new(0x58uLL);
  v7[1] = 0;
  v7[2] = 0;
  void *v7 = &unk_2703C3558;
  uint64_t v8 = v12;
  uint64_t v9 = v13;
  if (v13)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
    v7[4] = v9;
    v7[3] = v8;
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  else
  {
    v7[4] = 0;
    v7[3] = v8;
  }
  uint64_t v10 = operator new(0x60uLL);
  v10[1] = 0;
  v10[2] = 0;
  *uint64_t v10 = &unk_2703C3590;
  ServerIOThreadResources::ServerIOThreadResources((ServerIOThreadResources *)(v10 + 3));
}

- (IsolatedCoreAudioXPCService)initWithClientReaper:(function<void)(int
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v4 = [(IsolatedCoreAudioXPCService *)self init];
  if (v4)
  {
    std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)v6, (uint64_t)a3);
    [(IsolatedCoreAudioClientNSXPCListenerDelegate *)v4 setClientReaper:v6];
    std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v6);
  }
  return v4;
}

- (IsolatedCoreAudioXPCService)init
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = sIsolatedCoreAudioLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 136315394;
    *(void *)&uint8_t buf[4] = "IsolatedCoreAudioXPCService.mm";
    __int16 v18 = 1024;
    int v19 = 16;
    _os_log_impl(&dword_25439F000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioXPCService - Normal INIT", buf, 0x12u);
  }

  uint64_t v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2703C6DD0];
  v15.receiver = self;
  v15.super_class = (Class)IsolatedCoreAudioXPCService;
  v5 = [(IsolatedCoreAudioClientNSXPCListenerDelegate *)&v15 initWithInterface:v4];

  if (v5)
  {
    uint64_t v6 = (char *)operator new(0x50uLL);
    *((void *)v6 + 1) = 0;
    *((void *)v6 + 2) = 0;
    *(void *)uint64_t v6 = &unk_2703C35C8;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *((void *)v6 + 7) = 0;
    *((void *)v6 + 8) = 0;
    *((_DWORD *)v6 + 14) = 1065353216;
    *((void *)v6 + 9) = 0;
    uint64_t v13 = v6 + 24;
    uint64_t v14 = (std::__shared_weak_count *)v6;
    [(IsolatedCoreAudioXPCService *)v5 setMServerSideSwitchboard:&v13];
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    [(IsolatedCoreAudioXPCService *)v5 mServerSideSwitchboard];
    uint64_t v7 = (std::__shared_weak_count *)operator new(0xA8uLL);
    v7->__shared_owners_ = 0;
    v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C34E8;
    v7->__shared_weak_owners_ = 0;
    v7[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_2703C2D68;
    *(_OWORD *)&v7[1].__shared_owners_ = 0u;
    v7[2].std::__shared_count = 0u;
    LODWORD(v7[2].__shared_weak_owners_) = 1065353216;
    v7[3].__vftable = (std::__shared_weak_count_vtbl *)850045863;
    *(_OWORD *)&v7[3].__shared_owners_ = 0u;
    v7[4].std::__shared_count = 0u;
    *(_OWORD *)&v7[4].__shared_weak_owners_ = 0u;
    v7[5].__shared_owners_ = 0;
    v7[6].__shared_weak_owners_ = 0;
    *(void *)int buf = &unk_2703C26B0;
    shared_weak_owners = buf;
    std::__function::__func<ServerSideHardware::ServerSideHardware(void)::$_0,std::allocator<ServerSideHardware::ServerSideHardware(void)::$_0>,std::shared_ptr<HALUseCase> ()>::__clone((uint64_t)buf, &v7[5].__shared_weak_owners_);
    shared_weak_owners = (unsigned char *)v7[6].__shared_weak_owners_;
    v7[6].__shared_weak_owners_ = (uint64_t)&v7[5].__shared_weak_owners_;
    std::__function::__value_func<std::shared_ptr<HALUseCase> ()>::~__value_func[abi:ne180100](buf);
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v8 = *(std::__shared_weak_count **)(v11 + 48);
    *(void *)(v11 + 40) = v7 + 1;
    *(void *)(v11 + 48) = v7;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    uint64_t v9 = v5;
    v16[0] = &unk_2703C3BF0;
    v16[1] = v9;
    v16[3] = v16;
    [(IsolatedCoreAudioClientNSXPCListenerDelegate *)v9 setClientReaper:v16];
    std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v16);
  }
  return v5;
}

- (void)init
{
  JUMPOUT(0x25A276FE0);
}

- (uint64_t)init
{
  return a1;
}

- (id)init
{
  *a2 = &unk_2703C3BF0;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

@end