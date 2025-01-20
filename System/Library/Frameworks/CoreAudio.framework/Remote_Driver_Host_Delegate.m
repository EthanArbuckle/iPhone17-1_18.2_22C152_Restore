@interface Remote_Driver_Host_Delegate
- (id).cxx_construct;
- (id)init_with_remote_plugin:(shared_ptr<HALS_UCRemotePlugIn>)a3;
- (int)delete_storage_settings:(__CFString *)a3;
- (int)write_storage_settings:(__CFString *)a3 storage_data:(void *)a4;
- (pair<int,)copy_storage_settings:(__CFString *)a3;
- (shared_ptr<HALS_UCRemotePlugIn>)remote_plugin;
- (uint64_t)object_properties_changed:(NSObject  *){objcproto17OS_dispatch_queue} data:(id)&;
- (uint64_t)object_properties_changed:(uint64_t *)a1 data:;
- (uint64_t)request_config_change:(NSObject  *){objcproto17OS_dispatch_queue} change_action:(id)& change_token:;
- (uint64_t)request_config_change:(uint64_t *)a1 change_action:change_token:;
- (void)object_properties_changed:(unsigned int)a3 data:(id)a4;
- (void)request_config_change:(unsigned int)a3 change_action:(unint64_t)a4 change_token:(unint64_t)a5;
- (void)setRemote_plugin:(shared_ptr<HALS_UCRemotePlugIn>)a3;
- (void)teardown;
@end

@implementation Remote_Driver_Host_Delegate

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_remote_plugin.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setRemote_plugin:(shared_ptr<HALS_UCRemotePlugIn>)a3
{
  v4 = *(HALS_UCRemotePlugIn **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_remote_plugin.__cntrl_;
  self->_remote_plugin.__ptr_ = v4;
  self->_remote_plugin.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<HALS_UCRemotePlugIn>)remote_plugin
{
  cntrl = self->_remote_plugin.__cntrl_;
  *v2 = self->_remote_plugin.__ptr_;
  v2[1] = (HALS_UCRemotePlugIn *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (HALS_UCRemotePlugIn *)self;
  return result;
}

- (int)delete_storage_settings:(__CFString *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  [(Remote_Driver_Host_Delegate *)self remote_plugin];
  if (v15)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    int v14 = 0;
    v4 = *(id *)(v15 + 376);
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    queue[0] = v4;
    memset(&queue[1], 0, 24);
    *(_WORD *)v18 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 850045863;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v28 = 850045863;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v34 = 850045863;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3321888768;
    block[2] = __55__Remote_Driver_Host_Delegate_delete_storage_settings___block_invoke;
    block[3] = &unk_1F145C048;
    block[5] = v15;
    v9 = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    block[4] = &v11;
    v10 = a3;
    unsigned __int8 v5 = atomic_load(v18);
    if (v5) {
      atomic_store(1u, &v18[1]);
    }
    dispatch_sync(queue[0], block);
    int v6 = *((_DWORD *)v12 + 6);
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)queue);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    int v6 = 560947818;
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  return v6;
}

- (pair<int,)copy_storage_settings:(__CFString *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  [(Remote_Driver_Host_Delegate *)self remote_plugin];
  if (v21)
  {
    v4 = *(id *)(v21 + 376);
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    queue[0] = v4;
    memset(&queue[1], 0, 24);
    *(_WORD *)long long v24 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 850045863;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v34 = 850045863;
    uint64_t v40 = 850045863;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    dispatch_semaphore_t v45 = dispatch_semaphore_create(0);
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    int v20 = 0;
    uint64_t v13 = 0;
    int v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3321888768;
    v10[2] = __53__Remote_Driver_Host_Delegate_copy_storage_settings___block_invoke;
    v10[3] = &unk_1F145C010;
    v10[6] = v21;
    uint64_t v11 = v22;
    if (v22) {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v12 = a3;
    v10[4] = &v17;
    v10[5] = &v13;
    unsigned __int8 v5 = atomic_load(v24);
    if (v5) {
      atomic_store(1u, &v24[1]);
    }
    dispatch_sync(queue[0], v10);
    uint64_t v6 = *((unsigned int *)v18 + 6);
    v7 = (void *)v14[3];
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
    AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)queue);
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 560947818;
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  uint64_t v8 = v6;
  v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (int)write_storage_settings:(__CFString *)a3 storage_data:(void *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  int v4 = 560947818;
  if (a4)
  {
    [(Remote_Driver_Host_Delegate *)self remote_plugin];
    if (v18)
    {
      v7 = *(id *)(v18 + 376);
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      queue[0] = v7;
      memset(&queue[1], 0, 24);
      *(_WORD *)uint64_t v21 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 850045863;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v31 = 850045863;
      uint64_t v37 = 850045863;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      dispatch_semaphore_t v42 = dispatch_semaphore_create(0);
      uint64_t v14 = 0;
      uint64_t v15 = &v14;
      uint64_t v16 = 0x2020000000;
      int v17 = 0;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3321888768;
      v10[2] = __67__Remote_Driver_Host_Delegate_write_storage_settings_storage_data___block_invoke;
      v10[3] = &unk_1F145BFD8;
      v10[5] = v18;
      uint64_t v11 = v19;
      if (v19) {
        atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v10[4] = &v14;
      v12 = a4;
      uint64_t v13 = a3;
      unsigned __int8 v8 = atomic_load(v21);
      if (v8) {
        atomic_store(1u, &v21[1]);
      }
      dispatch_sync(queue[0], v10);
      int v4 = *((_DWORD *)v15 + 6);
      if (v11) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      }
      _Block_object_dispose(&v14, 8);
      AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)queue);
    }
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    }
  }
  return v4;
}

- (void)request_config_change:(unsigned int)a3 change_action:(unint64_t)a4 change_token:(unint64_t)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(Remote_Driver_Host_Delegate *)self remote_plugin];
  if (v8)
  {
    id v5 = *(id *)(v8 + 376);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    id v10 = v5;
    *(_WORD *)uint64_t v11 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 850045863;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v21 = 850045863;
    uint64_t v27 = 850045863;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unsigned __int8 v6 = atomic_load(v11);
    if (v6) {
      atomic_store(1u, &v11[1]);
    }
    id v7 = v10;
    operator new();
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (uint64_t)request_config_change:(uint64_t *)a1 change_action:change_token:
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 8);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    MEMORY[0x1C1859840](v2, 0x1020C40992E6479);
  }
  return a1;
}

- (uint64_t)request_config_change:(NSObject  *){objcproto17OS_dispatch_queue} change_action:(id)& change_token:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = a1;
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 720);
  if (v3)
  {
    int v4 = (std::__shared_weak_count *)operator new(0x20uLL);
    id v5 = v4;
    v4->__shared_owners_ = 0;
    p_shared_owners = &v4->__shared_owners_;
    v4->__shared_weak_owners_ = 0;
    v4[1].__vftable = (std::__shared_weak_count_vtbl *)*((void *)a1 + 4);
    id v7 = &v4[1].__vftable;
    v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F145C2F8;
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v8 = (char *)v2[92];
    unint64_t v9 = v2[93];
    if ((unint64_t)v8 >= v9)
    {
      uint64_t v12 = (char *)v2[91];
      uint64_t v13 = (v8 - v12) >> 4;
      unint64_t v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 60) {
        std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v15 = v9 - (void)v12;
      if (v15 >> 3 > v14) {
        unint64_t v14 = v15 >> 3;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v16 >> 60) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      long long v17 = (char *)operator new(16 * v16);
      *(void *)&long long v18 = v7;
      *((void *)&v18 + 1) = v5;
      long long v19 = &v17[16 * v13];
      long long v20 = &v17[16 * v16];
      *(_OWORD *)long long v19 = v18;
      id v10 = v19 + 16;
      atomic_fetch_add_explicit(p_shared_owners, 1uLL, memory_order_relaxed);
      if (v8 == v12)
      {
        v2[91] = v19;
        v2[92] = v10;
        v2[93] = v20;
        if (!v8) {
          goto LABEL_25;
        }
      }
      else
      {
        do
        {
          long long v21 = *((_OWORD *)v8 - 1);
          v8 -= 16;
          *((_OWORD *)v19 - 1) = v21;
          v19 -= 16;
          *(void *)uint64_t v8 = 0;
          *((void *)v8 + 1) = 0;
        }
        while (v8 != v12);
        long long v22 = (char *)v2[91];
        uint64_t v8 = (char *)v2[92];
        v2[91] = v19;
        v2[92] = v10;
        v2[93] = v20;
        if (v8 != v22)
        {
          do
          {
            long long v23 = (std::__shared_weak_count *)*((void *)v8 - 1);
            if (v23) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v23);
            }
            v8 -= 16;
          }
          while (v8 != v22);
          uint64_t v8 = v22;
        }
        if (!v8) {
          goto LABEL_25;
        }
      }
      operator delete(v8);
    }
    else
    {
      *(void *)uint64_t v8 = v7;
      *((void *)v8 + 1) = v4;
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      id v10 = v8 + 16;
      v2[92] = v8 + 16;
    }
LABEL_25:
    v2[92] = v10;
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    (*(void (**)(uint64_t, void, void, void *))(v3 + 32))(v3, a1[4], *((void *)a1 + 3), v7);
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    return std::unique_ptr<-[Remote_Driver_Host_Delegate request_config_change:change_action:change_token:]::$_8>::~unique_ptr[abi:ne180100]((uint64_t *)&v28);
  }
  AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)a1);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
  uint64_t v11 = **(NSObject ***)buf;
  AMCP::Log::Scope::get_os_log_t(**(id **)buf);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v30);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    long long v25 = pthread_self();
    mach_port_t v26 = pthread_mach_thread_np(v25);
    int v27 = a1[4];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v26;
    *(_WORD *)long long v30 = 2080;
    *(void *)&v30[2] = "HALS_UCRemotePlugIn.mm";
    __int16 v31 = 1024;
    int v32 = 123;
    __int16 v33 = 1024;
    int v34 = v27;
    _os_log_error_impl(&dword_1BAA78000, v11, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d The host ref is null, cannot request config change for object id %u", buf, 0x1Eu);
  }

  return std::unique_ptr<-[Remote_Driver_Host_Delegate request_config_change:change_action:change_token:]::$_8>::~unique_ptr[abi:ne180100]((uint64_t *)&v28);
}

- (void)object_properties_changed:(unsigned int)a3 data:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(Remote_Driver_Host_Delegate *)self remote_plugin];
  if (v10)
  {
    id v6 = *(id *)(v10 + 376);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    id v12 = v6;
    *(_WORD *)uint64_t v13 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 850045863;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v23 = 850045863;
    uint64_t v29 = 850045863;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v7 = v5;
    unsigned __int8 v8 = atomic_load(v13);
    if (v8) {
      atomic_store(1u, &v13[1]);
    }
    id v9 = v12;
    operator new();
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

- (uint64_t)object_properties_changed:(uint64_t *)a1 data:
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 8);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    MEMORY[0x1C1859840](v2, 0x10A0C405C5CD52DLL);
  }
  return a1;
}

- (uint64_t)object_properties_changed:(NSObject  *){objcproto17OS_dispatch_queue} data:(id)&
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a1;
  uint64_t v2 = [*(id *)(a1 + 24) bytes];
  unint64_t v3 = [*(id *)(a1 + 24) length];
  int v4 = *(void (***)(void, void, unint64_t, uint64_t))(*(void *)a1 + 720);
  if (v4)
  {
    (*v4)(v4, *(unsigned int *)(a1 + 16), v3 / 0xC, v2);
  }
  else
  {
    AMCP::Log::Scope_Registry::get(0);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    id v5 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v12);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = pthread_self();
      mach_port_t v8 = pthread_mach_thread_np(v7);
      int v9 = *(_DWORD *)(a1 + 16);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)id v12 = 2080;
      *(void *)&v12[2] = "HALS_UCRemotePlugIn.mm";
      __int16 v13 = 1024;
      int v14 = 97;
      __int16 v15 = 1024;
      int v16 = v9;
      _os_log_error_impl(&dword_1BAA78000, v5, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d The host ref is null, cannot issue properties changed for object id %u", buf, 0x1Eu);
    }
  }
  return std::unique_ptr<-[Remote_Driver_Host_Delegate object_properties_changed:data:]::$_7>::~unique_ptr[abi:ne180100](&v10);
}

- (void)teardown
{
  uint64_t v2 = 0;
  unint64_t v3 = 0;
  [(Remote_Driver_Host_Delegate *)self setRemote_plugin:&v2];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

- (id)init_with_remote_plugin:(shared_ptr<HALS_UCRemotePlugIn>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)Remote_Driver_Host_Delegate;
  int v4 = [(Remote_Driver_Host_Delegate *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    id v7 = *(HALS_UCRemotePlugIn **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_remote_plugin.__cntrl_;
    v5->_remote_plugin.__ptr_ = v7;
    v5->_remote_plugin.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

@end