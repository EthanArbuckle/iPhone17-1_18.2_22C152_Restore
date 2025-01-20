@interface Core_Audio_Driver_Registrar
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Core_Audio_Driver_Registrar)init;
- (id).cxx_construct;
- (id)register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:;
- (shared_ptr<std::vector<Registrar_Connection_Info>>)connection_infos;
- (uint64_t)register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:;
- (void)register_driver:(id)a3 bundle_url:(id)a4 bundle_id:(id)a5 cpu_type:(int)a6 is_using_driver_service:(BOOL)a7 reply:(id)a8;
- (void)register_driver:(void *)a1 bundle_url:(id *)a2 bundle_id:cpu_type:is_using_driver_service:reply:;
- (void)register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:;
- (void)registrar;
- (void)setConnection_infos:(shared_ptr<std::vector<Registrar_Connection_Info>>)a3;
- (void)setRegistrar:(void *)a3;
@end

@implementation Core_Audio_Driver_Registrar

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_connection_infos.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setConnection_infos:(shared_ptr<std::vector<Registrar_Connection_Info>>)a3
{
  v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_connection_infos.__cntrl_;
  self->_connection_infos.__ptr_ = v4;
  self->_connection_infos.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<std::vector<Registrar_Connection_Info>>)connection_infos
{
  cntrl = self->_connection_infos.__cntrl_;
  *v2 = self->_connection_infos.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setRegistrar:(void *)a3
{
  self->_registrar = a3;
}

- (void)registrar
{
  return self->_registrar;
}

- (void)register_driver:(id)a3 bundle_url:(id)a4 bundle_id:(id)a5 cpu_type:(int)a6 is_using_driver_service:(BOOL)a7 reply:(id)a8
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v42 = a4;
  id v13 = a5;
  v14 = (void (**)(id, uint64_t))a8;
  id v15 = [MEMORY[0x1E4F29268] currentConnection];
  v16 = self;
  objc_sync_enter(v16);
  [(Core_Audio_Driver_Registrar *)v16 connection_infos];
  if (*(void *)v50) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v50);
  }
  for (i = **(id ***)buf; ; i += 2)
  {
    if (i == *(id **)(*(void *)buf + 8))
    {
      id v18 = 0;
      id v19 = 0;
      goto LABEL_9;
    }
    if (v15 == i[1]) {
      break;
    }
  }
  objc_storeStrong(i, a5);
  id v19 = *i;
  id v18 = i[1];
LABEL_9:
  objc_sync_exit(v16);

  AMCP::Log::Scope_Registry::get(v20);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
  v21 = **(NSObject ***)buf;
  AMCP::Log::Scope::get_os_log_t(**(id **)buf);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v50) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v50);
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = pthread_self();
    mach_port_t v23 = pthread_mach_thread_np(v22);
    unint64_t v24 = 0;
    v25 = 0;
    int v26 = 47;
    do
    {
      v27 = &aLibraryCachesC_4[v24];
      if (v26 == 47) {
        v25 = &aLibraryCachesC_4[v24];
      }
      int v26 = v27[1];
      if (!v27[1]) {
        break;
      }
    }
    while (v24++ < 0xFFF);
    if (v25) {
      v29 = v25 + 1;
    }
    else {
      v29 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Registrar.mm";
    }
    if (v13) {
      v30 = (const char *)[v13 UTF8String];
    }
    else {
      v30 = "null";
    }
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v23;
    *(_WORD *)v50 = 2080;
    *(void *)&v50[2] = v29;
    __int16 v51 = 1024;
    int v52 = 97;
    __int16 v53 = 2080;
    v54 = v30;
    _os_log_impl(&dword_1BAA78000, v21, OS_LOG_TYPE_DEFAULT, "%6u %32s:%-5d Registering remote driver with bundle id %s", buf, 0x22u);
  }

  uint64_t v31 = [(Core_Audio_Driver_Registrar *)v16 registrar];
  id v32 = v19;
  id v33 = v18;
  id v34 = v13;
  v35 = v16;
  v36 = operator new(0x28uLL);
  void *v36 = &unk_1F145C680;
  v36[1] = v32;
  v36[2] = v33;
  v36[3] = v34;
  v36[4] = v35;
  v48[3] = v36;
  *(void *)buf = v41;
  id v37 = v15;
  id v47 = v37;
  id v46 = v42;
  id v45 = v34;
  int v44 = a6;
  BOOL v43 = a7;
  uint64_t v38 = *(void *)(v31 + 72);
  if (!v38) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v39 = (*(uint64_t (**)(uint64_t, uint8_t *, id *, id *, id *, int *, BOOL *, void *))(*(void *)v38 + 48))(v38, buf, &v47, &v46, &v45, &v44, &v43, v48);

  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v48);
  v14[2](v14, v39);
}

- (void)register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:
{
  JUMPOUT(0x1C1859840);
}

- (uint64_t)register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"Z107-[Core_Audio_Driver_Registrar register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:]E3$_1"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)register_driver:(void *)a1 bundle_url:(id *)a2 bundle_id:cpu_type:is_using_driver_service:reply:
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

- (id)register_driver:bundle_url:bundle_id:cpu_type:is_using_driver_service:reply:
{
  return a1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__231;
  v30[4] = __Block_byref_object_dispose__232;
  id v31 = a4;
  id v5 = v31;
  v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1491978];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __66__Core_Audio_Driver_Registrar_listener_shouldAcceptNewConnection___block_invoke;
  v29[3] = &unk_1E62306F0;
  v29[4] = v30;
  [v5 setInterruptionHandler:v29];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66__Core_Audio_Driver_Registrar_listener_shouldAcceptNewConnection___block_invoke_2;
  v27[3] = &unk_1E6230718;
  v27[4] = self;
  id v7 = v5;
  id v28 = v7;
  [v7 setInvalidationHandler:v27];
  v8 = self;
  objc_sync_enter(v8);
  [(Core_Audio_Driver_Registrar *)v8 connection_infos];
  v10 = v25[1];
  unint64_t v9 = (unint64_t)v25[2];
  if ((unint64_t)v10 < v9)
  {
    *(void *)v10 = 0;
    *((void *)v10 + 1) = v7;
    v11 = v10 + 16;
    goto LABEL_20;
  }
  uint64_t v12 = (v10 - *v25) >> 4;
  if ((unint64_t)(v12 + 1) >> 60) {
    std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v13 = v9 - (void)*v25;
  uint64_t v14 = v13 >> 3;
  if (v13 >> 3 <= (unint64_t)(v12 + 1)) {
    uint64_t v14 = v12 + 1;
  }
  if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v15 = v14;
  }
  if (v15)
  {
    if (v15 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    v16 = (char *)operator new(16 * v15);
  }
  else
  {
    v16 = 0;
  }
  v17 = &v16[16 * v12];
  id v18 = &v16[16 * v15];
  *(void *)v17 = 0;
  *((void *)v17 + 1) = v7;
  v11 = v17 + 16;
  id v19 = *v25;
  v20 = v25[1];
  if (v20 == *v25)
  {
    char *v25 = v17;
    v25[1] = v11;
    v25[2] = v18;
    if (v20) {
LABEL_19:
    }
      operator delete(v20);
  }
  else
  {
    do
    {
      long long v21 = *((_OWORD *)v20 - 1);
      v20 -= 16;
      *(void *)v20 = 0;
      *((void *)v20 + 1) = 0;
      *((_OWORD *)v17 - 1) = v21;
      v17 -= 16;
    }
    while (v20 != v19);
    v22 = *v25;
    v20 = v25[1];
    char *v25 = v17;
    v25[1] = v11;
    v25[2] = v18;
    if (v20 != v22)
    {
      do
      {

        mach_port_t v23 = (void *)*((void *)v20 - 2);
        v20 -= 16;
      }
      while (v20 != v22);
      v20 = v22;
    }
    if (v20) {
      goto LABEL_19;
    }
  }
LABEL_20:
  v25[1] = v11;
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  objc_sync_exit(v8);

  [v7 resume];
  _Block_object_dispose(v30, 8);

  return 1;
}

- (Core_Audio_Driver_Registrar)init
{
  v6.receiver = self;
  v6.super_class = (Class)Core_Audio_Driver_Registrar;
  v2 = [(Core_Audio_Driver_Registrar *)&v6 init];
  if (v2)
  {
    uint64_t v3 = operator new(0x30uLL);
    v3[1] = 0;
    v3[2] = 0;
    *uint64_t v3 = &unk_1F145C630;
    v3[4] = 0;
    v3[5] = 0;
    v3[3] = 0;
    cntrl = (std::__shared_weak_count *)v2->_connection_infos.__cntrl_;
    v2->_connection_infos.__ptr_ = v3 + 3;
    v2->_connection_infos.__cntrl_ = (__shared_weak_count *)v3;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v2;
}

@end