@interface DSP_ADM
- (DSP_ADM)init;
- (id)createFactory;
- (void)admLibrary;
- (void)dealloc;
- (void)setAdmLibrary:(void *)a3;
@end

@implementation DSP_ADM

- (void)setAdmLibrary:(void *)a3
{
  self->_admLibrary = a3;
}

- (void)admLibrary
{
  return self->_admLibrary;
}

- (id)createFactory
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(DSP_ADM *)self admLibrary];
  if (v3)
  {
    AMCP::Log::Scope_Registry::get(v3);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v16, "com.apple.coreaudio", "AMCP");
    v4 = *v16;
    AMCP::Log::Scope::get_os_log_t(*v16);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v17);
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = pthread_self();
      mach_port_t v6 = pthread_mach_thread_np(v5);
      LODWORD(v16) = 67109634;
      HIDWORD(v16) = v6;
      *(_WORD *)v17 = 2080;
      *(void *)&v17[2] = "DSP_ADM.mm";
      __int16 v18 = 1024;
      int v19 = 52;
      _os_log_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_INFO, "%6u %32s:%-5d [hal_dsp] Calling dlsym() on ADM.", (uint8_t *)&v16, 0x18u);
    }

    v7 = (void (*)(void))dlsym([(DSP_ADM *)self admLibrary], "CreateAudioDSPManager");
    if (v7)
    {
      v8 = v7();
      goto LABEL_18;
    }
    v10 = dlerror();
    AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)v10);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v16, "com.apple.coreaudio", "AMCP");
    v9 = *v16;
    AMCP::Log::Scope::get_os_log_t(*v16);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v17);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = pthread_self();
      mach_port_t v15 = pthread_mach_thread_np(v14);
      LODWORD(v16) = 67109890;
      HIDWORD(v16) = v15;
      *(_WORD *)v17 = 2080;
      *(void *)&v17[2] = "DSP_ADM.mm";
      __int16 v18 = 1024;
      int v19 = 58;
      __int16 v20 = 2080;
      v21 = v10;
      _os_log_error_impl(&dword_1BAA78000, v9, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d [hal_dsp] ADM dlsym failed: %s", (uint8_t *)&v16, 0x22u);
    }
  }
  else
  {
    AMCP::Log::Scope_Registry::get(0);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v16, "com.apple.coreaudio", "AMCP");
    v9 = *v16;
    AMCP::Log::Scope::get_os_log_t(*v16);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v17);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = pthread_self();
      mach_port_t v13 = pthread_mach_thread_np(v12);
      LODWORD(v16) = 67109634;
      HIDWORD(v16) = v13;
      *(_WORD *)v17 = 2080;
      *(void *)&v17[2] = "DSP_ADM.mm";
      __int16 v18 = 1024;
      int v19 = 48;
      _os_log_error_impl(&dword_1BAA78000, v9, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d [hal_dsp] ADM library unavailable.  Cannot call createFactory.", (uint8_t *)&v16, 0x18u);
    }
  }

  v8 = 0;
LABEL_18:

  return v8;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_admLibrary)
  {
    AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)self);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v3 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v8);
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = pthread_self();
      mach_port_t v5 = pthread_mach_thread_np(v4);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v5;
      *(_WORD *)v8 = 2080;
      *(void *)&v8[2] = "DSP_ADM.mm";
      __int16 v9 = 1024;
      int v10 = 38;
      _os_log_impl(&dword_1BAA78000, v3, OS_LOG_TYPE_INFO, "%6u %32s:%-5d [hal_dsp] Calling dlclose() on ADM.", buf, 0x18u);
    }

    dlclose(self->_admLibrary);
    self->_admLibrary = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)DSP_ADM;
  [(DSP_ADM *)&v6 dealloc];
}

- (DSP_ADM)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)DSP_ADM;
  v2 = [(DSP_ADM *)&v13 init];
  v3 = v2;
  if (v2)
  {
    AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)v2);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v4 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v15);
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      mach_port_t v5 = pthread_self();
      mach_port_t v6 = pthread_mach_thread_np(v5);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v6;
      *(_WORD *)mach_port_t v15 = 2080;
      *(void *)&v15[2] = "DSP_ADM.mm";
      __int16 v16 = 1024;
      int v17 = 22;
      _os_log_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_INFO, "%6u %32s:%-5d [hal_dsp] Calling dlopen() on ADM.", buf, 0x18u);
    }

    v7 = dlopen("/System/Library/PrivateFrameworks/AudioDSPManager.framework/AudioDSPManager", 1);
    v3->_admLibrary = v7;
    if (!v7)
    {
      v8 = dlerror();
      AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)v8);
      AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
      __int16 v9 = **(NSObject ***)buf;
      AMCP::Log::Scope::get_os_log_t(**(id **)buf);
      objc_claimAutoreleasedReturnValue();
      if (*(void *)v15) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v15);
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = pthread_self();
        mach_port_t v12 = pthread_mach_thread_np(v11);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v12;
        *(_WORD *)mach_port_t v15 = 2080;
        *(void *)&v15[2] = "DSP_ADM.mm";
        __int16 v16 = 1024;
        int v17 = 28;
        __int16 v18 = 2080;
        int v19 = v8;
        _os_log_error_impl(&dword_1BAA78000, v9, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d [hal_dsp] ADM dlopen() failed: %s", buf, 0x22u);
      }
    }
  }
  return v3;
}

@end