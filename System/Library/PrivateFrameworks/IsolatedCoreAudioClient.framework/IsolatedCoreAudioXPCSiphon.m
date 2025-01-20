@interface IsolatedCoreAudioXPCSiphon
+ (shared_ptr<SiphonClientMap>)initClientMap;
+ (uint64_t)initClientMap;
+ (void)initClientMap;
- (IsolatedCoreAudioXPCSiphon)init;
- (IsolatedCoreAudioXPCSiphon)initWithClientMap:(shared_ptr<SiphonClientMap>)a3 andServer:(shared_ptr<ClientLocalServer>)a4;
- (NSMutableSet)reverseConnections;
- (id).cxx_construct;
- (shared_ptr<IsolatedCoreAudioSiphon>)mSiphon;
- (shared_ptr<SiphonClientMap>)mClientMap;
- (uint64_t)createClientReaper;
- (void)connectToUseCase:(unsigned int)a3 endpoint:(id)a4;
- (void)createClientReaper;
- (void)requestAudio:(unsigned int)a3 atTime:(unint64_t)a4 atSample:(unint64_t)a5 with:(id)a6;
- (void)setAudioAvailabilityCallback:(unsigned int)a3 usingXPC:(id)a4 with:(id)a5;
- (void)setAudioLapseCallback:(unsigned int)a3 usingXPC:(id)a4 with:(id)a5;
- (void)setMClientMap:(shared_ptr<SiphonClientMap>)a3;
- (void)setMSiphon:(shared_ptr<IsolatedCoreAudioSiphon>)a3;
- (void)setReverseConnections:(id)a3;
- (void)startIO:(unsigned int)a3 with:(id)a4;
- (void)stopIO:(unsigned int)a3 with:(id)a4;
@end

@implementation IsolatedCoreAudioXPCSiphon

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_mClientMap.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_mSiphon.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
  objc_storeStrong((id *)&self->_reverseConnections, 0);
}

- (void)setReverseConnections:(id)a3
{
}

- (NSMutableSet)reverseConnections
{
  return self->_reverseConnections;
}

- (void)setMClientMap:(shared_ptr<SiphonClientMap>)a3
{
  p_mClientMap = &self->_mClientMap;
  v5 = *(SiphonClientMap **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_mClientMap.__cntrl_;
  p_mClientMap->__ptr_ = v5;
  p_mClientMap->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<SiphonClientMap>)mClientMap
{
  cntrl = self->_mClientMap.__cntrl_;
  *v2 = self->_mClientMap.__ptr_;
  v2[1] = (SiphonClientMap *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (SiphonClientMap *)self;
  return result;
}

- (void)setMSiphon:(shared_ptr<IsolatedCoreAudioSiphon>)a3
{
  p_mSiphon = &self->_mSiphon;
  v5 = *(IsolatedCoreAudioSiphon **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_mSiphon.__cntrl_;
  p_mSiphon->__ptr_ = v5;
  p_mSiphon->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<IsolatedCoreAudioSiphon>)mSiphon
{
  cntrl = self->_mSiphon.__cntrl_;
  *v2 = self->_mSiphon.__ptr_;
  v2[1] = (IsolatedCoreAudioSiphon *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (IsolatedCoreAudioSiphon *)self;
  return result;
}

- (void)requestAudio:(unsigned int)a3 atTime:(unint64_t)a4 atSample:(unint64_t)a5 with:(id)a6
{
  v7 = (void (**)(id, void))a6;
  [(IsolatedCoreAudioXPCSiphon *)self mSiphon];
  (*(void (**)(void))(**(void **)(v8 + 16) + 40))(*(void *)(v8 + 16));
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  v7[2](v7, 0);
}

- (void)stopIO:(unsigned int)a3 with:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void))a4;
  v7.i32[0] = bswap32(a3);
  int8x8_t v8 = vzip1_s8(v7, v7);
  v9.i64[0] = 0x1F0000001FLL;
  v9.i64[1] = 0x1F0000001FLL;
  v10.i64[0] = 0x5F0000005FLL;
  v10.i64[1] = 0x5F0000005FLL;
  *(int8x8_t *)v11.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v10, (uint32x4_t)vsraq_n_s32(v9, vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)v8), 0x18uLL), 0x18uLL))), v8, (int8x8_t)0x2E002E002E002ELL);
  char v30 = 4;
  int16x8_t v26 = v11;
  LODWORD(v29) = vmovn_s16(v11).u32[0];
  BYTE4(v29) = 0;
  v12 = sIsolatedCoreAudioSiphonLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "IsolatedCoreAudioXPCSiphon.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 160;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = &v29;
    _os_log_impl(&dword_25439F000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s called Stop IO", buf, 0x1Cu);
  }

  [(IsolatedCoreAudioXPCSiphon *)self mSiphon];
  uint64_t v13 = *v27;
  v31 = (std::__shared_mutex_base *)(*v27 + 96);
  char v32 = 1;
  std::__shared_mutex_base::lock_shared(v31);
  std::mutex::lock((std::mutex *)(v13 + 32));
  SiphonClientMap::disableAvailabilityCallbacksForClient(*(SiphonClientMap **)(v13 + 8), a3);
  SiphonClientMap::disableLapseHandlingForClient(*(SiphonClientMap **)(v13 + 8), a3);
  uint64_t v14 = *(void *)(v13 + 8) + 16;
  do
  {
    uint64_t v14 = *(void *)v14;
    if (!v14) {
      break;
    }
    unsigned __int8 v15 = atomic_load((unsigned __int8 *)(**(void **)(v14 + 24) + 64));
  }
  while ((v15 & 1) == 0);
  int v16 = *(unsigned __int8 *)(v13 + 24);
  v17 = sIsolatedCoreAudioSiphonLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16) {
    BOOL v19 = v14 == 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19)
  {
    if (v18)
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "IsolatedCoreAudioClientMultiplexer.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 96;
      _os_log_impl(&dword_25439F000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioClientMultiplexer::stopIOIfNoClientsAreRunning sending Stop message to server", buf, 0x12u);
    }
    (*(void (**)(void))(**(void **)v13 + 56))();
    *(unsigned char *)(v13 + 24) = 0;
  }
  else if (v18)
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "IsolatedCoreAudioClientMultiplexer.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 102;
    _os_log_impl(&dword_25439F000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioClientMultiplexer::stopIOIfNoClientsAreRunning Stop requested, but no client IO is running IO", buf, 0x12u);
  }
  v20 = std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>(*(void **)(v13 + 8), a3);
  if (v20)
  {
    v21 = v20;
    char v34 = 4;
    LODWORD(__p[0]) = vmovn_s16(v26).u32[0];
    BYTE4(__p[0]) = 0;
    v22 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "SiphonClientMap.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 43;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = __p;
      _os_log_impl(&dword_25439F000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Waiting for Availability callbacks to complete for %s client", buf, 0x1Cu);
    }
    v23 = *(NSObject **)(*(void *)v21[3] + 72);
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 0x40000000;
    *(void *)&buf[16] = ___ZN10applesauce8dispatch2v19sync_implIZN14SiphonIOClient22drainAvailabilityQueueEvE3__0EEvP16dispatch_queue_sOT_NSt3__117integral_constantIbLb1EEE_block_invoke;
    *(void *)&buf[24] = &__block_descriptor_tmp_521;
    v37 = &v35;
    dispatch_sync(v23, buf);
    v24 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = __p;
      if (v34 < 0) {
        v25 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "SiphonClientMap.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 45;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v25;
      _os_log_impl(&dword_25439F000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Synchronous StopIO Complete for %s client", buf, 0x1Cu);
    }
    if (v34 < 0) {
      operator delete(__p[0]);
    }
  }
  std::mutex::unlock((std::mutex *)(v13 + 32));
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v31);
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  v6[2](v6, 0);
  if (v30 < 0) {
    operator delete(v29);
  }
}

- (void)startIO:(unsigned int)a3 with:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, uint64_t))a4;
  v7.i32[0] = bswap32(a3);
  int8x8_t v8 = vzip1_s8(v7, v7);
  v9.i64[0] = 0x1F0000001FLL;
  v9.i64[1] = 0x1F0000001FLL;
  v10.i64[0] = 0x5F0000005FLL;
  v10.i64[1] = 0x5F0000005FLL;
  *(int8x8_t *)v11.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v10, (uint32x4_t)vsraq_n_s32(v9, vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)v8), 0x18uLL), 0x18uLL))), v8, (int8x8_t)0x2E002E002E002ELL);
  char v33 = 4;
  int16x8_t v29 = v11;
  LODWORD(v32) = vmovn_s16(v11).u32[0];
  BYTE4(v32) = 0;
  v12 = sIsolatedCoreAudioSiphonLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v39 = "IsolatedCoreAudioXPCSiphon.mm";
    __int16 v40 = 1024;
    int v41 = 142;
    __int16 v42 = 2080;
    v43 = &v32;
    _os_log_impl(&dword_25439F000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s called Start IO", buf, 0x1Cu);
  }

  [(IsolatedCoreAudioXPCSiphon *)self mSiphon];
  uint64_t v13 = v30;
  atomic_store(1u, v30 + 32);
  uint64_t v14 = *(void *)v13;
  char v34 = (std::__shared_mutex_base *)(*(void *)v13 + 96);
  char v35 = 1;
  std::__shared_mutex_base::lock(v34);
  std::mutex::lock((std::mutex *)(v14 + 32));
  unsigned __int8 v15 = *(void **)(v14 + 8);
  int v16 = std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>(v15, a3);
  if (v16)
  {
    v17 = v16;
    char v37 = 4;
    LODWORD(__p[0]) = vmovn_s16(v29).u32[0];
    BYTE4(__p[0]) = 0;
    BOOL v18 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v39 = "SiphonClientMap.cpp";
      __int16 v40 = 1024;
      int v41 = 21;
      __int16 v42 = 2080;
      v43 = __p;
      _os_log_impl(&dword_25439F000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Starting IO on the %s client", buf, 0x1Cu);
    }
    atomic_store(1u, (unsigned __int8 *)(*(void *)v17[3] + 64));
    if (v37 < 0) {
      operator delete(__p[0]);
    }
    unsigned __int8 v15 = *(void **)(v14 + 8);
  }
  BOOL v19 = v15 + 2;
  do
  {
    BOOL v19 = (void *)*v19;
    if (!v19) {
      goto LABEL_13;
    }
    unsigned __int8 v20 = atomic_load((unsigned __int8 *)(*(void *)v19[3] + 64));
  }
  while ((v20 & 1) == 0);
  if (*(unsigned char *)(v14 + 24))
  {
LABEL_13:
    v21 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "IsolatedCoreAudioClientMultiplexer.cpp";
      __int16 v40 = 1024;
      int v41 = 85;
      _os_log_impl(&dword_25439F000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d IsolatedCoreAudioClientMultiplexer::startIOIfNoClientsAreRunning IO already running", buf, 0x12u);
    }
    goto LABEL_15;
  }
  uint64_t v26 = (*(uint64_t (**)(void))(**(void **)v14 + 40))();
  if (!v26)
  {
    *(unsigned char *)(v14 + 24) = 1;
LABEL_15:
    v22 = std::__hash_table<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::shared_ptr<HALUseCase>>>>::find<unsigned int>(*(void **)(v14 + 8), a3);
    if (v22)
    {
      v23 = v22;
      char v37 = 4;
      LODWORD(__p[0]) = vmovn_s16(v29).u32[0];
      BYTE4(__p[0]) = 0;
      v24 = sIsolatedCoreAudioSiphonLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v39 = "SiphonClientMap.cpp";
        __int16 v40 = 1024;
        int v41 = 66;
        __int16 v42 = 2080;
        v43 = __p;
        _os_log_impl(&dword_25439F000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Enabling lapse handling on %s client", buf, 0x1Cu);
        int v25 = v37;
        atomic_store(1u, (unsigned __int8 *)(*(void *)v23[3] + 65));
        if (v25 < 0) {
          operator delete(__p[0]);
        }
      }
      else
      {
        atomic_store(1u, (unsigned __int8 *)(*(void *)v23[3] + 65));
      }
    }
    uint64_t v26 = 0;
    goto LABEL_21;
  }
  v27 = sIsolatedCoreAudioSiphonLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v39 = "IsolatedCoreAudioClientMultiplexer.cpp";
    __int16 v40 = 1024;
    int v41 = 80;
    __int16 v42 = 1024;
    LODWORD(v43) = v26;
    _os_log_impl(&dword_25439F000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d IsolatedCoreAudioClientMultiplexer::startIOIfNoClientsAreRunning IO failed to start with status %d", buf, 0x18u);
  }
  char v37 = 4;
  LODWORD(__p[0]) = vmovn_s16(v29).u32[0];
  BYTE4(__p[0]) = 0;
  v28 = sIsolatedCoreAudioSiphonLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v39 = "IsolatedCoreAudioClientMultiplexer.cpp";
    __int16 v40 = 1024;
    int v41 = 116;
    __int16 v42 = 2080;
    v43 = __p;
    __int16 v44 = 1024;
    int v45 = v26;
    _os_log_impl(&dword_25439F000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d IsolatedCoreAudioClientMultiplexer::startSharedIO failed to start for use case %s with status %d", buf, 0x22u);
  }
  SiphonClientMap::disableAvailabilityCallbacksForClient(*(SiphonClientMap **)(v14 + 8), a3);
  if (v37 < 0) {
    operator delete(__p[0]);
  }
LABEL_21:
  std::mutex::unlock((std::mutex *)(v14 + 32));
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v34);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  v6[2](v6, v26);
  if (v33 < 0) {
    operator delete(v32);
  }
}

- (void)setAudioLapseCallback:(unsigned int)a3 usingXPC:(id)a4 with:(id)a5
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, void))a5;
  v6 = sIsolatedCoreAudioSiphonLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int8x8_t v8 = "IsolatedCoreAudioXPCSiphon.mm";
    __int16 v9 = 1024;
    int v10 = 134;
    _os_log_impl(&dword_25439F000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setAudioLapseCallback called", (uint8_t *)&v7, 0x12u);
  }

  v5[2](v5, 0);
}

- (void)setAudioAvailabilityCallback:(unsigned int)a3 usingXPC:(id)a4 with:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  unint64_t v8 = (unint64_t)a4;
  __int16 v9 = (void (**)(id, void))a5;
  int v10 = sIsolatedCoreAudioSiphonLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "IsolatedCoreAudioXPCSiphon.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 117;
    _os_log_impl(&dword_25439F000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setAudioAvailabilityCallback called", buf, 0x12u);
  }

  int16x8_t v29 = (void *)v8;
  [(IsolatedCoreAudioXPCSiphon *)self connectToUseCase:v6 endpoint:v8];
  uint64_t v11 = [MEMORY[0x263F08D68] currentConnection];
  int v12 = [v11 getProcessID];
  [(IsolatedCoreAudioXPCSiphon *)self mClientMap];
  uint64_t v13 = *(void *)buf;
  unint64_t v14 = *(void *)(*(void *)buf + 8);
  if (v14)
  {
    uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
    v15.i16[0] = vaddlv_u8(v15);
    if (v15.u32[0] > 1uLL)
    {
      unint64_t v8 = v6;
      if (v14 <= v6) {
        unint64_t v8 = v6 % v14;
      }
    }
    else
    {
      unint64_t v8 = (v14 - 1) & v6;
    }
    int v16 = *(void ***)(**(void **)buf + 8 * v8);
    if (v16)
    {
      v17 = *v16;
      if (*v16)
      {
        do
        {
          unint64_t v18 = v17[1];
          if (v18 == v6)
          {
            if (*((_DWORD *)v17 + 4) == v6)
            {
              v28 = v29;
              goto LABEL_42;
            }
          }
          else
          {
            if (v15.u32[0] > 1uLL)
            {
              if (v18 >= v14) {
                v18 %= v14;
              }
            }
            else
            {
              v18 &= v14 - 1;
            }
            if (v18 != v8) {
              break;
            }
          }
          v17 = (void *)*v17;
        }
        while (v17);
      }
    }
  }
  v17 = operator new(0x20uLL);
  void *v17 = 0;
  v17[1] = v6;
  *((_DWORD *)v17 + 4) = v6;
  v17[3] = 0;
  float v19 = (float)(unint64_t)(*(void *)(v13 + 24) + 1);
  float v20 = *(float *)(v13 + 32);
  if (!v14 || (float)(v20 * (float)v14) < v19)
  {
    BOOL v21 = 1;
    if (v14 >= 3) {
      BOOL v21 = (v14 & (v14 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v14);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      size_t v24 = v23;
    }
    else {
      size_t v24 = v22;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<SiphonClient>>>>::__rehash<true>(v13, v24);
    unint64_t v14 = *(void *)(v13 + 8);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v14 <= v6) {
        unint64_t v8 = v6 % v14;
      }
      else {
        unint64_t v8 = v6;
      }
    }
    else
    {
      unint64_t v8 = (v14 - 1) & v6;
    }
  }
  uint64_t v25 = *(void *)v13;
  uint64_t v26 = *(void **)(*(void *)v13 + 8 * v8);
  if (v26)
  {
    void *v17 = *v26;
    v28 = v29;
LABEL_40:
    *uint64_t v26 = v17;
    goto LABEL_41;
  }
  void *v17 = *(void *)(v13 + 16);
  *(void *)(v13 + 16) = v17;
  *(void *)(v25 + 8 * v8) = v13 + 16;
  v28 = v29;
  if (*v17)
  {
    unint64_t v27 = *(void *)(*v17 + 8);
    if ((v14 & (v14 - 1)) != 0)
    {
      if (v27 >= v14) {
        v27 %= v14;
      }
    }
    else
    {
      v27 &= v14 - 1;
    }
    uint64_t v26 = (void *)(*(void *)v13 + 8 * v27);
    goto LABEL_40;
  }
LABEL_41:
  ++*(void *)(v13 + 24);
LABEL_42:
  *(_DWORD *)(v17[3] + 32) = v12;
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  [(IsolatedCoreAudioClientNSXPCListenerDelegate *)self setUseCaseIDForCurrentConnection:v6];

  v9[2](v9, 0);
}

- (void)connectToUseCase:(unsigned int)a3 endpoint:(id)a4
{
  id v6 = a4;
  int v7 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v6];
  unint64_t v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2703C7350];
  [v7 setRemoteObjectInterface:v8];

  [v7 setInterruptionHandler:&__block_literal_global_474];
  [v7 setInvalidationHandler:&__block_literal_global_23];
  [v7 activate];
  __int16 v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_27];
  [(IsolatedCoreAudioXPCSiphon *)self mClientMap];
  unint64_t v10 = v17[1];
  if (!v10) {
    goto LABEL_17;
  }
  uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
  v11.i16[0] = vaddlv_u8(v11);
  if (v11.u32[0] > 1uLL)
  {
    unint64_t v12 = a3;
    if (v10 <= a3) {
      unint64_t v12 = a3 % v10;
    }
  }
  else
  {
    unint64_t v12 = (v10 - 1) & a3;
  }
  uint64_t v13 = *(uint64_t ***)(*v17 + 8 * v12);
  if (!v13 || (unint64_t v14 = *v13) == 0) {
LABEL_17:
  }
    std::__throw_out_of_range[abi:ne180100]();
  while (1)
  {
    unint64_t v15 = v14[1];
    if (v15 == a3) {
      break;
    }
    if (v11.u32[0] > 1uLL)
    {
      if (v15 >= v10) {
        v15 %= v10;
      }
    }
    else
    {
      v15 &= v10 - 1;
    }
    if (v15 != v12) {
      goto LABEL_17;
    }
LABEL_16:
    unint64_t v14 = (uint64_t *)*v14;
    if (!v14) {
      goto LABEL_17;
    }
  }
  if (*((_DWORD *)v14 + 4) != a3) {
    goto LABEL_16;
  }
  objc_storeStrong(*(id **)(v14[3] + 16), v9);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  int v16 = [(IsolatedCoreAudioXPCSiphon *)self reverseConnections];
  [v16 addObject:v7];
}

void __56__IsolatedCoreAudioXPCSiphon_connectToUseCase_endpoint___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = sIsolatedCoreAudioSiphonLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = [v2 localizedDescription];
    v5 = [v2 localizedFailureReason];
    int v6 = 136316162;
    int v7 = "IsolatedCoreAudioXPCSiphon.mm";
    __int16 v8 = 1024;
    int v9 = 106;
    __int16 v10 = 2112;
    uint8x8_t v11 = @"Error on remote object proxy";
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    unint64_t v15 = v5;
    _os_log_impl(&dword_25439F000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d %@: %@ %@\n", (uint8_t *)&v6, 0x30u);
  }
}

void __56__IsolatedCoreAudioXPCSiphon_connectToUseCase_endpoint___block_invoke_21()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = sIsolatedCoreAudioSiphonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315394;
    id v2 = "IsolatedCoreAudioXPCSiphon.mm";
    __int16 v3 = 1024;
    int v4 = 101;
    _os_log_impl(&dword_25439F000, v0, OS_LOG_TYPE_ERROR, "%25s:%-5d Reverse connection invalidated", (uint8_t *)&v1, 0x12u);
  }
}

void __56__IsolatedCoreAudioXPCSiphon_connectToUseCase_endpoint___block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = sIsolatedCoreAudioSiphonLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315394;
    id v2 = "IsolatedCoreAudioXPCSiphon.mm";
    __int16 v3 = 1024;
    int v4 = 100;
    _os_log_impl(&dword_25439F000, v0, OS_LOG_TYPE_ERROR, "%25s:%-5d Reverse connection interrupted", (uint8_t *)&v1, 0x12u);
  }
}

- (void)createClientReaper
{
  *a1 = &unk_2703C40A8;
  id v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

- (uint64_t)createClientReaper
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_2703C40A8;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

- (IsolatedCoreAudioXPCSiphon)initWithClientMap:(shared_ptr<SiphonClientMap>)a3 andServer:(shared_ptr<ClientLocalServer>)a4
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v7 = objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_2703C6F90, a3.__cntrl_, a4.var0, a4.var1);
  v15.receiver = self;
  v15.super_class = (Class)IsolatedCoreAudioXPCSiphon;
  __int16 v8 = [(IsolatedCoreAudioClientNSXPCListenerDelegate *)&v15 initWithInterface:v7];

  if (v8)
  {
    int v9 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      buf[0] = 136315394;
      *(void *)&buf[1] = "IsolatedCoreAudioXPCSiphon.mm";
      __int16 v18 = 1024;
      int v19 = 71;
      _os_log_impl(&dword_25439F000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Hello Siphon Tests", (uint8_t *)buf, 0x12u);
    }

    __int16 v10 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v13 = *(void *)ptr;
    __int16 v14 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(IsolatedCoreAudioXPCSiphon *)v8 setMClientMap:&v13];
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    [(IsolatedCoreAudioXPCSiphon *)v8 mClientMap];
    uint8x8_t v11 = (char *)operator new(0x40uLL);
    *(_OWORD *)(v11 + 8) = 0u;
    *(_OWORD *)(v11 + 24) = 0u;
    *(void *)uint8x8_t v11 = &unk_2703C4058;
    *(_OWORD *)cntrl = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    v11[56] = 0;
    v16[0] = &unk_2703C4230;
    v16[3] = v16;
    operator new();
  }
  return 0;
}

- (IsolatedCoreAudioXPCSiphon)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2703C6F90];
  v11.receiver = self;
  v11.super_class = (Class)IsolatedCoreAudioXPCSiphon;
  int v4 = [(IsolatedCoreAudioClientNSXPCListenerDelegate *)&v11 initWithInterface:v3];

  if (v4)
  {
    uint64_t v5 = sIsolatedCoreAudioSiphonLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      buf[0] = 136315394;
      *(void *)&buf[1] = "IsolatedCoreAudioXPCSiphon.mm";
      LOWORD(buf[3]) = 1024;
      *(_DWORD *)((char *)&buf[3] + 2) = 58;
      _os_log_impl(&dword_25439F000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Hello Siphon", (uint8_t *)buf, 0x12u);
    }

    +[IsolatedCoreAudioXPCSiphon initClientMap];
    [(IsolatedCoreAudioXPCSiphon *)v4 setMClientMap:v9];
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    [(IsolatedCoreAudioXPCSiphon *)v4 mClientMap];
    int v6 = (char *)operator new(0x40uLL);
    *(_OWORD *)(v6 + 8) = 0u;
    *(void *)int v6 = &unk_2703C4058;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    v6[56] = 0;
    int v7 = operator new(0x38uLL);
    v7[1] = 0;
    v7[2] = 0;
    *int v7 = &unk_2703C3520;
    XPCConnectionToServer::XPCConnectionToServer((XPCConnectionToServer *)(v7 + 3), 1935962992);
    operator new();
  }
  return 0;
}

+ (shared_ptr<SiphonClientMap>)initClientMap
{
  uint64_t v3 = v2;
  int v4 = (char *)operator new(0x40uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)int v4 = &unk_2703C3E68;
  *(_OWORD *)(v4 + 40) = 0u;
  *((_DWORD *)v4 + 14) = 1065353216;
  v3[1] = v4;
  *(_OWORD *)(v4 + 24) = 0u;
  void *v3 = v4 + 24;
  operator new();
}

+ (void)initClientMap
{
  *a1 = &unk_2703C3EB8;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

+ (uint64_t)initClientMap
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_2703C3EB8;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

@end