@interface DSP_HALBypass_IOProcessor
- (DSP_HALBypass_IOProcessor)init;
- (HAL_DSP_HostCallbacks)hostCallbacks;
- (id)adaptToConfigurationChange:(id)a3 withCallbacks:(void *)a4 error:(id *)a5;
- (id)getProcessorPropertySet;
- (id)negotiateConfigurationChange:(id)a3 error:(id *)a4;
- (id)simulateConfigurationChange:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)dspCallbacks;
- (void)setDspCallbacks:(void *)a3;
- (void)setHostCallbacks:(id)a3;
@end

@implementation DSP_HALBypass_IOProcessor

- (void).cxx_destruct
{
}

- (void)setHostCallbacks:(id)a3
{
}

- (HAL_DSP_HostCallbacks)hostCallbacks
{
  return self->_hostCallbacks;
}

- (void)setDspCallbacks:(void *)a3
{
  self->_dspCallbacks = a3;
}

- (void)dspCallbacks
{
  return self->_dspCallbacks;
}

- (id)adaptToConfigurationChange:(id)a3 withCallbacks:(void *)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(DSP_HALBypass_IOProcessor *)self dspCallbacks];
  v8 = v7;
  if (v7)
  {
    unsigned __int8 v9 = atomic_load(v7 + 316);
    if (v9)
    {
      AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)v7);
      AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)v14, "com.apple.coreaudio", "AMCP");
      v10 = **(NSObject ***)v14;
      AMCP::Log::Scope::get_os_log_t(**(id **)v14);
      objc_claimAutoreleasedReturnValue();
      if (*(void *)v15) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v15);
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = pthread_self();
        mach_port_t v12 = pthread_mach_thread_np(v11);
        *(_DWORD *)v14 = 67109634;
        *(_DWORD *)&v14[4] = v12;
        *(_WORD *)v15 = 2080;
        *(void *)&v15[2] = "DSP_HAL_Bypass.mm";
        __int16 v16 = 1024;
        int v17 = 84;
        _os_log_debug_impl(&dword_1BAA78000, v10, OS_LOG_TYPE_DEBUG, "%6u %32s:%-5d [hal_dsp] DSP HAL Bypass adaptToConfigurationChange - existing callbacks are still registered.", v14, 0x18u);
      }
    }
    (*(void (**)(unsigned __int8 *))(*(void *)v8 + 8))(v8);
    [(DSP_HALBypass_IOProcessor *)self setDspCallbacks:0];
  }
  operator new();
}

- (id)negotiateConfigurationChange:(id)a3 error:(id *)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9E0]);

  return v4;
}

- (id)simulateConfigurationChange:(id)a3 error:(id *)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9E0]);

  return v4;
}

- (id)getProcessorPropertySet
{
  return 0;
}

- (void)dealloc
{
  dspCallbacks = self->_dspCallbacks;
  if (dspCallbacks)
  {
    (*(void (**)(void *, SEL))(*(void *)dspCallbacks + 8))(dspCallbacks, a2);
    self->_dspCallbacks = 0;
  }
  hostCallbacks = self->_hostCallbacks;
  self->_hostCallbacks = 0;

  v5.receiver = self;
  v5.super_class = (Class)DSP_HALBypass_IOProcessor;
  [(DSP_HALBypass_IOProcessor *)&v5 dealloc];
}

- (DSP_HALBypass_IOProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)DSP_HALBypass_IOProcessor;
  v2 = [(DSP_HALBypass_IOProcessor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    hostCallbacks = v2->_hostCallbacks;
    v2->_dspCallbacks = 0;
    v2->_hostCallbacks = 0;
  }
  return v3;
}

@end