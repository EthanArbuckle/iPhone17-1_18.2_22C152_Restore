@interface DSP_HAL_Mock_IOProcessor
- (BOOL)callAdaptHook:(const void *)a3;
- (BOOL)callNegotiateHook:(const void *)a3;
- (DSP_HAL_Mock_IOProcessor)init;
- (DSP_HAL_Mock_PropertySet)processorProperties;
- (HAL_DSP_HostCallbacks)hostCallbacks;
- (function<DSP_HAL_Mock_TestHooks)testHookFetcher;
- (id).cxx_construct;
- (id)adaptToConfigurationChange:(id)a3 withCallbacks:(void *)a4 error:(id *)a5;
- (id)adaptToConfigurationChange:withCallbacks:error:;
- (id)basic_negotiateConfigurationChange:(void *)a3 error:(id *)a4;
- (id)conference_negotiateConfigurationChange:(void *)a3 error:(id *)a4;
- (id)negotiateConfigurationChange:(id)a3 error:(id *)a4;
- (id)simulateConfigurationChange:(id)a3 error:(id *)a4;
- (id)spatial_negotiateConfigurationChange:(void *)a3 error:(id *)a4;
- (int)featureFlag;
- (uint64_t)adaptToConfigurationChange:withCallbacks:error:;
- (void)adaptToConfigurationChange:withCallbacks:error:;
- (void)dealloc;
- (void)dspCallbacks;
- (void)setDspCallbacks:(void *)a3;
- (void)setFeatureFlag:(int)a3;
- (void)setHostCallbacks:(id)a3;
- (void)setProcessorProperties:(id)a3;
- (void)setTestHookFetcher:(function<DSP_HAL_Mock_TestHooks)(;
@end

@implementation DSP_HAL_Mock_IOProcessor

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](self->_testHookFetcher.__f_.__buf_.__lx);
  objc_storeStrong((id *)&self->_processorProperties, 0);

  objc_storeStrong((id *)&self->_hostCallbacks, 0);
}

- (void)setTestHookFetcher:(function<DSP_HAL_Mock_TestHooks)(
{
  v9[3] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)a3);
  p_testHookFetcher = &self->_testHookFetcher;
  if (&self->_testHookFetcher != (function<DSP_HAL_Mock_TestHooks ()> *)v7)
  {
    v5 = v8;
    f = (function<DSP_HAL_Mock_TestHooks ()> *)self->_testHookFetcher.__f_.__f_;
    if (v8 == v7)
    {
      if (f == p_testHookFetcher)
      {
        (*(void (**)(void *, void *))(v7[0] + 24))(v7, v9);
        (*(void (**)(void *))(*v8 + 32))(v8);
        v8 = 0;
        (*(void (**)(void *, void *))(*(void *)self->_testHookFetcher.__f_.__f_ + 24))(self->_testHookFetcher.__f_.__f_, v7);
        (*(void (**)(void *))(*(void *)self->_testHookFetcher.__f_.__f_ + 32))(self->_testHookFetcher.__f_.__f_);
        self->_testHookFetcher.__f_.__f_ = 0;
        v8 = v7;
        (*(void (**)(void *, function<DSP_HAL_Mock_TestHooks ()> *))(v9[0] + 24))(v9, &self->_testHookFetcher);
        (*(void (**)(void *))(v9[0] + 32))(v9);
      }
      else
      {
        (*(void (**)(void *, function<DSP_HAL_Mock_TestHooks ()> *))(v7[0] + 24))(v7, &self->_testHookFetcher);
        (*(void (**)(void *))(*v8 + 32))(v8);
        v8 = self->_testHookFetcher.__f_.__f_;
      }
      self->_testHookFetcher.__f_.__f_ = p_testHookFetcher;
    }
    else if (f == p_testHookFetcher)
    {
      (*(void (**)(function<DSP_HAL_Mock_TestHooks ()> *, void *))(*(void *)p_testHookFetcher->__f_.__buf_.__lx
                                                                              + 24))(&self->_testHookFetcher, v7);
      (*(void (**)(void *))(*(void *)self->_testHookFetcher.__f_.__f_ + 32))(self->_testHookFetcher.__f_.__f_);
      self->_testHookFetcher.__f_.__f_ = v8;
      v8 = v7;
    }
    else
    {
      v8 = self->_testHookFetcher.__f_.__f_;
      self->_testHookFetcher.__f_.__f_ = v5;
    }
  }
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](v7);
}

- (function<DSP_HAL_Mock_TestHooks)testHookFetcher
{
  return (function<DSP_HAL_Mock_TestHooks ()> *)std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_testHookFetcher);
}

- (void)setProcessorProperties:(id)a3
{
}

- (DSP_HAL_Mock_PropertySet)processorProperties
{
  return self->_processorProperties;
}

- (int)featureFlag
{
  return self->_featureFlag;
}

- (void)setHostCallbacks:(id)a3
{
}

- (HAL_DSP_HostCallbacks)hostCallbacks
{
  return self->_hostCallbacks;
}

- (void)dspCallbacks
{
  return self->_dspCallbacks;
}

- (id)adaptToConfigurationChange:(id)a3 withCallbacks:(void *)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = [(DSP_HAL_Mock_IOProcessor *)self featureFlag];
  id v9 = v7;
  v10 = v9;
  if (v9) {
    CFRetain(v9);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v10);

  BOOL v11 = [(DSP_HAL_Mock_IOProcessor *)self callAdaptHook:&cf];
  if (cf) {
    CFRelease(cf);
  }
  if (v11)
  {
    if ((v8 & 0x81) != 0x81)
    {
      v13 = [(DSP_HAL_Mock_IOProcessor *)self dspCallbacks];
      if (v13)
      {
        atomic_load(v13 + 316);
        [(DSP_HAL_Mock_IOProcessor *)self setDspCallbacks:0];
      }
      operator new();
    }
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MockDSP Force Fail Adapt" code:-1 userInfo:0];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MockDSP Failure" code:-1 userInfo:0];
  }
  *a5 = v12;

  return 0;
}

- (void)adaptToConfigurationChange:withCallbacks:error:
{
  objc_destroyWeak((id *)(a1 + 8));

  JUMPOUT(0x1C1859840);
}

- (uint64_t)adaptToConfigurationChange:withCallbacks:error:
{
  return a1;
}

- (id)adaptToConfigurationChange:withCallbacks:error:
{
  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_1F145E790;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (id)negotiateConfigurationChange:(id)a3 error:(id *)a4
{
  id v6 = a3;
  DSP_Host_Types::ConfigurationChangeRequest::ConfigurationChangeRequest((DSP_Host_Types::ConfigurationChangeRequest *)&v15);
  v15 = (void (**)(void **, CFTypeRef *))&unk_1F147EED0;
  id v7 = v6;
  char v8 = v7;
  if (v7) {
    CFRetain(v7);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v8);

  v15[4]((void **)&v15, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (!v17[17] || !v17[16]) {
    [(DSP_HAL_Mock_IOProcessor *)self setDspCallbacks:0];
  }
  if (!v19[5]) {
    goto LABEL_11;
  }
  unsigned int v9 = *(_DWORD *)(v19[3] + 28);
  if (v9 > 8) {
    goto LABEL_14;
  }
  int v10 = 1 << v9;
  if ((v10 & 0x10A) != 0)
  {
LABEL_11:
    uint64_t v11 = [(DSP_HAL_Mock_IOProcessor *)self basic_negotiateConfigurationChange:&v15 error:a4];
    goto LABEL_15;
  }
  if ((v10 & 0x30) != 0)
  {
    uint64_t v11 = [(DSP_HAL_Mock_IOProcessor *)self spatial_negotiateConfigurationChange:&v15 error:a4];
  }
  else
  {
LABEL_14:
    uint64_t v11 = [(DSP_HAL_Mock_IOProcessor *)self conference_negotiateConfigurationChange:&v15 error:a4];
  }
LABEL_15:
  id v12 = (void *)v11;
  v15 = (void (**)(void **, CFTypeRef *))&unk_1F14867D0;
  v21 = (void **)&v20;
  std::vector<std::shared_ptr<DSP_Host_Types::DeviceDescription>>::__destroy_vector::operator()[abi:ne180100](&v21);
  DSP_Host_Types::IOContextDescription::~IOContextDescription((DSP_Host_Types::IOContextDescription *)v19);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v18);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)v17);
  v15 = (void (**)(void **, CFTypeRef *))&unk_1F1486820;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v16);

  return v12;
}

- (id)simulateConfigurationChange:(id)a3 error:(id *)a4
{
  v4 = [(DSP_HAL_Mock_IOProcessor *)self negotiateConfigurationChange:a3 error:a4];

  return v4;
}

- (id)basic_negotiateConfigurationChange:(void *)a3 error:(id *)a4
{
  if (*((unsigned char *)a3 + 41)) {
    int v7 = *((unsigned __int8 *)a3 + 40);
  }
  else {
    int v7 = 0;
  }
  DSP_Host_Types::DSP_Host_DictionaryData<DSP_Host_Types::ConfigurationChangeRequest>::operator applesauce::CF::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, (uint64_t)a3);
  BOOL v8 = [(DSP_HAL_Mock_IOProcessor *)self callNegotiateHook:&cf];
  if (cf) {
    CFRelease(cf);
  }
  if (!v8)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"MockDSP Failure" code:-1 userInfo:0];
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  if (!v7)
  {
    if (a4)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = *MEMORY[0x1E4F28798];
      uint64_t v15 = 0;
LABEL_33:
      *a4 = (id)[v13 initWithDomain:v14 code:v15 userInfo:0];
    }
LABEL_34:
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C9E0]);
    goto LABEL_35;
  }
  unsigned int v9 = (uint64_t *)*((void *)a3 + 82);
  int v10 = (uint64_t *)*((void *)a3 + 83);
  if (v9 == v10) {
    goto LABEL_31;
  }
  while (1)
  {
    uint64_t v11 = *v9;
    if (*(unsigned char *)(*v9 + 64))
    {
      if (*(unsigned char *)(v11 + 240)) {
        break;
      }
    }
    v9 += 2;
    if (v9 == v10) {
      goto LABEL_31;
    }
  }
  if (*(void *)(v11 + 664) == *(void *)(v11 + 672))
  {
LABEL_31:
    if (a4)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = *MEMORY[0x1E4F28798];
      uint64_t v15 = 2003329396;
      goto LABEL_33;
    }
    goto LABEL_34;
  }
  v40[0] = 0;
  v40[1] = 0;
  long long v41 = 0u;
  memset(v42, 0, sizeof(v42));
  long long v43 = 0u;
  v39 = (void (**)(void **, const void **))&unk_1F1487440;
  uint64_t v44 = 0;
  uint64_t v45 = -1;
  DSP_Host_Types::FormatDescription::FormatDescription((DSP_Host_Types::FormatDescription *)&cf, (const DSP_Host_Types::FormatDescription *)((char *)a3 + 120));
  if (DSP_Dictionariable::DictionarySet::has_all_values((DSP_Dictionariable::DictionarySet *)__p, v38)
    && v33
    && v36
    && v34[17])
  {
    BOOL v16 = v34[16] || v32[4] == 1;
    BOOL v17 = v16;
    if (v35[4] == 1 && v17)
    {
      std::allocate_shared[abi:ne180100]<DSP_Host_Types::FormatDescription,std::allocator<DSP_Host_Types::FormatDescription>,DSP_Host_Types::FormatDescription&,void>((uint64_t *)&v28, (const DSP_Host_Types::FormatDescription *)&cf);
      uint64_t v18 = *((void *)&v41 + 1);
      if (*((void *)&v41 + 1) >= v42[0])
      {
        uint64_t v21 = (uint64_t)(*((void *)&v41 + 1) - v41) >> 4;
        if ((unint64_t)(v21 + 1) >> 60) {
          std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v22 = (uint64_t)(v42[0] - v41) >> 3;
        if (v22 <= v21 + 1) {
          unint64_t v22 = v21 + 1;
        }
        if (v42[0] - (void)v41 >= 0x7FFFFFFFFFFFFFF0uLL) {
          unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v22;
        }
        v46[4] = v42;
        v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v23);
        v25 = &v24[16 * v21];
        v46[0] = v24;
        v46[1] = v25;
        v46[3] = &v24[16 * v26];
        *(_OWORD *)v25 = v28;
        v46[2] = v25 + 16;
        std::vector<std::shared_ptr<DSP_Host_Types::FormatDescription>>::__swap_out_circular_buffer(&v41, v46);
        uint64_t v19 = *((void *)&v41 + 1);
        std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)v46);
      }
      else
      {
        **((_OWORD **)&v41 + 1) = v28;
        uint64_t v19 = v18 + 16;
      }
      *((void *)&v41 + 1) = v19;
    }
  }
  v46[0] = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D528], MEMORY[0x1E4F1D538]);
  v39[3]((void **)&v39, v46);
  mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&v28, v46[0]);
  if (v46[0]) {
    CFRelease(v46[0]);
  }
  id v27 = (id)v28;
  id v12 = v27;
  if (v27) {
    CFRelease(v27);
  }
  CFTypeRef cf = &unk_1F1486968;
  if (__p)
  {
    v38 = (DSP_Dictionariable::DictionarySet *)__p;
    operator delete(__p);
  }
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)v35);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)v34);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)v32);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v31);
  CFTypeRef cf = &unk_1F14869A8;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v30);
  v39 = (void (**)(void **, const void **))&unk_1F1487440;
  CFTypeRef cf = &v43;
  std::vector<std::shared_ptr<DSP_Host_Types::DeviceDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  CFTypeRef cf = &v42[1];
  std::vector<std::shared_ptr<DSP_Host_Types::DeviceDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  CFTypeRef cf = &v41;
  std::vector<std::shared_ptr<DSP_Host_Types::DeviceDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  v39 = (void (**)(void **, const void **))&unk_1F1487480;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v40);
LABEL_35:

  return v12;
}

- (id)conference_negotiateConfigurationChange:(void *)a3 error:(id *)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)a3 + 41)) {
    int v7 = *((unsigned __int8 *)a3 + 40);
  }
  else {
    int v7 = 0;
  }
  if (*((void *)a3 + 14)) {
    int v8 = *(_DWORD *)(*((void *)a3 + 12) + 28);
  }
  else {
    int v8 = 1;
  }
  DSP_Host_Types::DSP_Host_DictionaryData<DSP_Host_Types::ConfigurationChangeRequest>::operator applesauce::CF::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, (uint64_t)a3);
  BOOL v9 = [(DSP_HAL_Mock_IOProcessor *)self callNegotiateHook:&cf];
  if (cf) {
    CFRelease(cf);
  }
  if (!v9)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"MockDSP Failure" code:-1 userInfo:0];
    id v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_188;
  }
  if (v7)
  {
    BOOL v10 = (~[(DSP_HAL_Mock_IOProcessor *)self featureFlag] & 0x21) != 0 && v8 != 6;
    uint64_t v11 = (AMCP::Log::Scope_Registry *)[(DSP_HAL_Mock_IOProcessor *)self featureFlag];
    BOOL v12 = (v11 & 0x41) == 65;
    if ((v11 & 0x41) == 0x41 && v8 == 6)
    {
      AMCP::Log::Scope_Registry::get(v11);
      AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&cf, "com.apple.coreaudio", "AMCP");
      uint64_t v14 = *(NSObject **)cf;
      AMCP::Log::Scope::get_os_log_t(*(id *)cf);
      objc_claimAutoreleasedReturnValue();
      if ((void)v103) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v103);
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v81 = pthread_self();
        mach_port_t v82 = pthread_mach_thread_np(v81);
        unint64_t v83 = 0;
        v84 = 0;
        int v85 = 47;
        do
        {
          v86 = &aLibraryCachesC_10[v83];
          if (v85 == 47) {
            v84 = &aLibraryCachesC_10[v83];
          }
          int v85 = v86[1];
          if (!v86[1]) {
            break;
          }
        }
        while (v83++ < 0xFFF);
        if (v84) {
          v88 = v84 + 1;
        }
        else {
          v88 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/DSP/Factories/DSP_HAL_MockFeature_Processors.mm";
        }
        LODWORD(cf) = 67109634;
        HIDWORD(cf) = v82;
        LOWORD(v103) = 2080;
        *(void *)((char *)&v103 + 2) = v88;
        WORD5(v103) = 1024;
        HIDWORD(v103) = 455;
        _os_log_debug_impl(&dword_1BAA78000, v14, OS_LOG_TYPE_DEBUG, "%6u %32s:%-5d [hal_dsp] MOCK WARNING: It is not normal for VAD to request format changes.", (uint8_t *)&cf, 0x18u);
      }
    }
  }
  else
  {
    BOOL v12 = 0;
    BOOL v10 = 0;
  }
  uint64_t v16 = *((void *)a3 + 82);
  uint64_t v17 = *((void *)a3 + 83);
  if (v16 == v17) {
    goto LABEL_89;
  }
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  int v20 = 0;
  double v21 = 0.0;
  while (1)
  {
    unint64_t v22 = *(void **)v16;
    if (*(unsigned char *)(*(void *)v16 + 64) && *((unsigned char *)v22 + 240))
    {
      if (v21 == 0.0 && v22[83] != v22[84]) {
        uint64_t v18 = *(void **)v16;
      }
      if (v22[89] != v22[90]) {
        uint64_t v19 = *(void **)v16;
      }
      if (v18)
      {
        for (i = (uint64_t *)v18[89]; i != (uint64_t *)v18[90]; i += 2)
        {
          uint64_t v25 = *i;
          if (*(unsigned char *)(*i + 44) && *(_DWORD *)(v25 + 40) == 2)
          {
            if (*(unsigned char *)(v25 + 188)) {
              int v20 = *(_DWORD *)(v25 + 184);
            }
            else {
              int v20 = 0;
            }
            break;
          }
        }
        for (j = (uint64_t *)v18[83]; j != (uint64_t *)v18[84] && v21 == 0.0; j += 2)
        {
          uint64_t v27 = *j;
          uint64_t v28 = *(void *)(*j + 336);
          uint64_t v29 = *(void *)(*j + 344);
          if (v28 != v29 && *(unsigned char *)(v27 + 160) && *(unsigned char *)(v27 + 44) && *(_DWORD *)(v27 + 40) == 1)
          {
            if (!v10)
            {
              double v21 = *(double *)(v27 + 152);
              break;
            }
            while (1)
            {
              if (*(unsigned char *)(v28 + 48))
              {
                BOOL v30 = !*(unsigned char *)(v28 + 76) || *(unsigned char *)(v28 + 124) == 0;
                if (!v30 && *(unsigned char *)(v28 + 97) != 0)
                {
                  BOOL v32 = *(unsigned char *)(v28 + 96) || *(_DWORD *)(v28 + 72) == 1;
                  BOOL v33 = v32;
                  if (*(_DWORD *)(v28 + 120) == 1 && v33)
                  {
                    double v21 = *(double *)(v28 + 40);
                    if (v21 != *(double *)(v27 + 152)) {
                      break;
                    }
                  }
                }
              }
              v28 += 152;
              if (v28 == v29)
              {
                double v21 = *(double *)(v27 + 152);
                break;
              }
            }
          }
        }
      }
      if (v19) {
        break;
      }
    }
LABEL_87:
    v16 += 16;
    if (v16 == v17) {
      goto LABEL_88;
    }
  }
  v35 = *((unsigned char *)v19 + 64) ? v19 : 0;
  uint64_t v36 = v35[89];
  uint64_t v37 = v35[90];
  while (v36 != v37)
  {
    if (!*(unsigned char *)(*(void *)v36 + 44) || *(_DWORD *)(*(void *)v36 + 40) != 2)
    {
      uint64_t v19 = 0;
      goto LABEL_87;
    }
    v36 += 16;
  }
  if (v21 == 0.0) {
    goto LABEL_87;
  }
LABEL_88:
  if (v21 == 0.0)
  {
LABEL_89:
    if (a4)
    {
      id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
      *a4 = (id)[v38 initWithDomain:*MEMORY[0x1E4F28798] code:2003329396 userInfo:0];
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1C9E0]);
    goto LABEL_188;
  }
  v93[0] = 0;
  v93[1] = 0;
  v92 = (void (**)(void **, CFTypeRef *))&unk_1F1487440;
  long long v94 = 0u;
  memset(v95, 0, sizeof(v95));
  long long v96 = 0u;
  v97[0] = 0;
  v97[1] = -1;
  std::allocate_shared[abi:ne180100]<DSP_Host_Types::DeviceConfiguration,std::allocator<DSP_Host_Types::DeviceConfiguration>,char const(&)[1],void>(&v98, "");
  v105 = v97;
  v39 = std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(1uLL);
  CFTypeRef cf = v39;
  *(void *)&long long v103 = v39;
  v104 = (char *)&v39[v40];
  _OWORD *v39 = v98;
  *((void *)&v103 + 1) = v39 + 1;
  std::vector<std::shared_ptr<DSP_Host_Types::FormatDescription>>::__swap_out_circular_buffer(&v96, &cf);
  uint64_t v41 = *((void *)&v96 + 1);
  std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&cf);
  *((void *)&v96 + 1) = v41;
  uint64_t v42 = *(void *)(v41 - 16);
  long long v43 = *(std::__shared_weak_count **)(v41 - 8);
  uint64_t v90 = v42;
  if (v43) {
    atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  DSP_Dictionariable::SingleKvp<std::string>::operator=(v42 + 24, (uint64_t)(v18 + 3));
  if (v10)
  {
    *(double *)(v90 + 88) = v21;
    *(unsigned char *)(v90 + 96) = 1;
  }
  if (v20)
  {
    *(_WORD *)(v90 + 120) = v7 | 0x100;
    *(_DWORD *)(v90 + 168) = v20;
    LOBYTE(v10) = 1;
    *(unsigned char *)(v90 + 172) = 1;
  }
  if (v12)
  {
    DSP_Host_Types::FormatDescription::FormatDescription((DSP_Host_Types::FormatDescription *)&cf, (const DSP_Host_Types::FormatDescription *)((char *)a3 + 120));
    if (DSP_Dictionariable::DictionarySet::has_all_values((DSP_Dictionariable::DictionarySet *)__p, v114))
    {
      double v106 = v21;
      char v107 = 1;
      if (!v110) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      if (v109 == 1) {
        int v44 = 2;
      }
      else {
        int v44 = 1;
      }
      int v109 = v44;
      char v110 = 1;
      std::allocate_shared[abi:ne180100]<DSP_Host_Types::FormatDescription,std::allocator<DSP_Host_Types::FormatDescription>,DSP_Host_Types::FormatDescription&,void>((uint64_t *)&v91, (const DSP_Host_Types::FormatDescription *)&cf);
      uint64_t v45 = *((void *)&v94 + 1);
      if (*((void *)&v94 + 1) >= *(void *)&v95[0])
      {
        uint64_t v47 = (uint64_t)(*((void *)&v94 + 1) - v94) >> 4;
        if ((unint64_t)(v47 + 1) >> 60) {
          std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v48 = (uint64_t)(*(void *)&v95[0] - v94) >> 3;
        if (v48 <= v47 + 1) {
          unint64_t v48 = v47 + 1;
        }
        if (*(void *)&v95[0] - (void)v94 >= 0x7FFFFFFFFFFFFFF0uLL) {
          unint64_t v49 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v49 = v48;
        }
        v101 = v95;
        v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v49);
        v51 = &v50[16 * v47];
        *(void *)&long long v98 = v50;
        *((void *)&v98 + 1) = v51;
        v100 = &v50[16 * v52];
        *(_OWORD *)v51 = v91;
        v99 = v51 + 16;
        std::vector<std::shared_ptr<DSP_Host_Types::FormatDescription>>::__swap_out_circular_buffer(&v94, &v98);
        uint64_t v46 = *((void *)&v94 + 1);
        std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&v98);
      }
      else
      {
        **((_OWORD **)&v94 + 1) = v91;
        uint64_t v46 = v45 + 16;
      }
      *((void *)&v94 + 1) = v46;
    }
    CFTypeRef cf = &unk_1F1486968;
    if (__p)
    {
      v114 = (DSP_Dictionariable::DictionarySet *)__p;
      operator delete(__p);
    }
    DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v112);
    DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v111);
    DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v108);
    DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v104);
    CFTypeRef cf = &unk_1F14869A8;
    std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v103);
  }
  if (!v10)
  {
    uint64_t v53 = *((void *)&v96 + 1);
    v54 = *(std::__shared_weak_count **)(*((void *)&v96 + 1) - 8);
    if (v54) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v54);
    }
    *((void *)&v96 + 1) = v53 - 16;
  }
  if (v19)
  {
    v55 = v19 + 89;
    uint64_t v56 = 89;
    if (v19[89] == v19[90])
    {
      uint64_t v56 = 86;
      v55 = v19 + 86;
    }
    uint64_t v57 = v19[v56];
    uint64_t v89 = v55[1];
    if (v57 != v89)
    {
      __int16 v58 = v7 | 0x100;
      do
      {
        uint64_t v60 = *(void *)(*(void *)v57 + 336);
        uint64_t v59 = *(void *)(*(void *)v57 + 344);
        if (v60 == v59)
        {
          char v61 = 0;
        }
        else
        {
          char v61 = 0;
          do
          {
            if (*(unsigned char *)(v60 + 76)) {
              BOOL v62 = *(unsigned char *)(v60 + 124) == 0;
            }
            else {
              BOOL v62 = 1;
            }
            if (!v62 && *(unsigned char *)(v60 + 97) != 0)
            {
              BOOL v64 = *(unsigned char *)(v60 + 96) || *(_DWORD *)(v60 + 72) == 1;
              BOOL v65 = v64;
              BOOL v66 = *(_DWORD *)(v60 + 120) != 1 || !v65;
              if (!v66 && *(unsigned char *)(v60 + 48) && *(double *)(v60 + 40) == v21)
              {
                if (v43) {
                  atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
                }
                v67 = v43;
                uint64_t v68 = v90;
                if (v18 != v19)
                {
                  std::allocate_shared[abi:ne180100]<DSP_Host_Types::DeviceConfiguration,std::allocator<DSP_Host_Types::DeviceConfiguration>,char const(&)[1],void>(&v98, "");
                  uint64_t v69 = *((void *)&v96 + 1);
                  if (*((void *)&v96 + 1) >= v97[0])
                  {
                    uint64_t v71 = (uint64_t)(*((void *)&v96 + 1) - v96) >> 4;
                    if ((unint64_t)(v71 + 1) >> 60) {
                      std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
                    }
                    unint64_t v72 = (uint64_t)(v97[0] - v96) >> 3;
                    if (v72 <= v71 + 1) {
                      unint64_t v72 = v71 + 1;
                    }
                    if (v97[0] - (void)v96 >= 0x7FFFFFFFFFFFFFF0uLL) {
                      unint64_t v73 = 0xFFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v73 = v72;
                    }
                    v105 = v97;
                    v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v73);
                    v75 = &v74[16 * v71];
                    CFTypeRef cf = v74;
                    *(void *)&long long v103 = v75;
                    v104 = &v74[16 * v76];
                    *(_OWORD *)v75 = v98;
                    *((void *)&v103 + 1) = v75 + 16;
                    std::vector<std::shared_ptr<DSP_Host_Types::FormatDescription>>::__swap_out_circular_buffer(&v96, &cf);
                    uint64_t v70 = *((void *)&v96 + 1);
                    std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&cf);
                  }
                  else
                  {
                    **((_OWORD **)&v96 + 1) = v98;
                    uint64_t v70 = v69 + 16;
                  }
                  *((void *)&v96 + 1) = v70;
                  uint64_t v68 = *(void *)(v70 - 16);
                  v67 = *(std::__shared_weak_count **)(v70 - 8);
                  if (v67) {
                    atomic_fetch_add_explicit(&v67->__shared_owners_, 1uLL, memory_order_relaxed);
                  }
                  if (v43) {
                    std::__shared_weak_count::__release_shared[abi:ne180100](v43);
                  }
                }
                DSP_Dictionariable::SingleKvp<std::string>::operator=(v68 + 24, (uint64_t)(v19 + 3));
                double v77 = 0.0;
                double v78 = 0.0;
                if (*(unsigned char *)(*(void *)v57 + 160)) {
                  double v78 = *(double *)(*(void *)v57 + 152);
                }
                if (*(unsigned char *)(v60 + 48)) {
                  double v77 = *(double *)(v60 + 40);
                }
                if (v78 != v77) {
                  DSP_Dictionariable::SingleKvp<double>::operator=(v68 + 72, v60 + 24);
                }
                *(_WORD *)(v68 + 120) = v58;
                if (!*(unsigned char *)(v60 + 76)) {
                  std::__throw_bad_optional_access[abi:ne180100]();
                }
                *(_DWORD *)(v68 + 168) = *(_DWORD *)(v60 + 72);
                char v61 = 1;
                *(unsigned char *)(v68 + 172) = 1;
                if (v67)
                {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v67);
                  char v61 = 1;
                }
              }
            }
            v60 += 152;
          }
          while (v60 != v59);
        }
        v57 += 16;
      }
      while (v57 != v89 && (v61 & 1) == 0);
    }
    CFTypeRef cf = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D528], MEMORY[0x1E4F1D538]);
    v92[3]((void **)&v92, &cf);
    mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&v98, cf);
    if (cf) {
      CFRelease(cf);
    }
    id v79 = (id)v98;
    id v15 = v79;
    if (!v79) {
      goto LABEL_185;
    }
  }
  else
  {
    CFTypeRef cf = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D528], MEMORY[0x1E4F1D538]);
    v92[3]((void **)&v92, &cf);
    mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&v98, cf);
    if (cf) {
      CFRelease(cf);
    }
    id v79 = (id)v98;
    id v15 = v79;
    if (!v79) {
      goto LABEL_185;
    }
  }
  CFRelease(v79);
LABEL_185:
  if (v43) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v43);
  }
  v92 = (void (**)(void **, CFTypeRef *))&unk_1F1487440;
  CFTypeRef cf = &v96;
  std::vector<std::shared_ptr<DSP_Host_Types::DeviceDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  CFTypeRef cf = (char *)v95 + 8;
  std::vector<std::shared_ptr<DSP_Host_Types::DeviceDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  CFTypeRef cf = &v94;
  std::vector<std::shared_ptr<DSP_Host_Types::DeviceDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  v92 = (void (**)(void **, CFTypeRef *))&unk_1F1487480;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v93);
LABEL_188:

  return v15;
}

- (id)spatial_negotiateConfigurationChange:(void *)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)a3 + 41)) {
    int v7 = *((unsigned __int8 *)a3 + 40);
  }
  else {
    int v7 = 0;
  }
  [(DSP_HAL_Mock_IOProcessor *)self testHookFetcher];
  if (!(void)v34)
  {
    v55 = 0;
    goto LABEL_14;
  }
  [(DSP_HAL_Mock_IOProcessor *)self testHookFetcher];
  if (!v57) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(CFTypeRef *__return_ptr))(*(void *)v57 + 48))(&cf);
  if (v42)
  {
    if (v42 == &cf)
    {
      v55 = (CFTypeRef *)v54;
      (*((void (**)(CFTypeRef *, void *))cf + 3))(&cf, v54);
      goto LABEL_13;
    }
    int v8 = &v42;
    v55 = v42;
  }
  else
  {
    int v8 = &v55;
  }
  void *v8 = 0;
LABEL_13:
  std::__function::__value_func<unsigned int ()(AudioObjectPropertyAddress const&,unsigned int)>::~__value_func[abi:ne180100](&__p);
  std::__function::__value_func<void ()(DSP_HAL_Bypass_Utils::AMCP_IOData_Helper<(DSP_HAL_Bypass_Utils::InterleavePolicy)0> &,applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](&v49);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](&v45);
  std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v43);
  std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](&cf);
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](v56);
LABEL_14:
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](&v32);
  if (v55)
  {
    DSP_Host_Types::DSP_Host_DictionaryData<DSP_Host_Types::ConfigurationChangeRequest>::operator applesauce::CF::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, (uint64_t)a3);
    if (!v55) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    char v9 = (*((uint64_t (**)(CFTypeRef *, CFTypeRef *))*v55 + 6))(v55, &cf);
    if (cf) {
      CFRelease(cf);
    }
    if ((v9 & 1) == 0)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"MockDSP Failure" code:-1 userInfo:0];
      id v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_78;
    }
  }
  for (i = (uint64_t *)*((void *)a3 + 82); ; i += 2)
  {
    if (i == *((uint64_t **)a3 + 83))
    {
      if (a4)
      {
        id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
        *a4 = (id)[v12 initWithDomain:*MEMORY[0x1E4F28798] code:2003329396 userInfo:0];
      }
      goto LABEL_26;
    }
    uint64_t v11 = *i;
    if (*(unsigned char *)(*i + 64))
    {
      if (*(unsigned char *)(v11 + 240)) {
        break;
      }
    }
  }
  if (*(void *)(v11 + 688) == *(void *)(v11 + 696))
  {
    if (a4)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      *a4 = (id)[v18 initWithDomain:*MEMORY[0x1E4F28798] code:2003329396 userInfo:0];
    }
LABEL_26:
    id v13 = objc_alloc_init(MEMORY[0x1E4F1C9E0]);
    goto LABEL_78;
  }
  v33[0] = 0;
  v33[1] = 0;
  BOOL v32 = (void (**)(void **, const void **))&unk_1F1487440;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v38 = 0;
  uint64_t v39 = -1;
  DSP_Host_Types::FormatDescription::FormatDescription((DSP_Host_Types::FormatDescription *)&cf, (const DSP_Host_Types::FormatDescription *)((char *)a3 + 272));
  if (v7)
  {
    if (*((unsigned char *)a3 + 516))
    {
      int v14 = *((_DWORD *)a3 + 128);
      if (v14)
      {
        if (v14 != 0x10000)
        {
          int v16 = (unsigned __int16)*((_DWORD *)a3 + 128);
          goto LABEL_48;
        }
        if (*((unsigned char *)a3 + 540))
        {
          unint64_t v15 = *((unsigned int *)a3 + 134);
          if (v15)
          {
            int v16 = 0;
            do
            {
              v16 += v15 & 1;
              BOOL v17 = v15 >= 2;
              v15 >>= 1;
            }
            while (v17);
          }
          else
          {
            int v16 = 0;
          }
LABEL_48:
          int v46 = v16;
          char v47 = 1;
        }
      }
      else if (*((unsigned char *)a3 + 564))
      {
        int v16 = *((_DWORD *)a3 + 140);
        goto LABEL_48;
      }
    }
    if (DSP_Dictionariable::DictionarySet::has_all_values((DSP_Dictionariable::DictionarySet *)__p, v53)
      && v47
      && v51
      && BYTE1(v49))
    {
      BOOL v20 = (_BYTE)v49 || v46 == 1;
      BOOL v21 = v20;
      if (v50[4] == 1 && v21)
      {
        std::allocate_shared[abi:ne180100]<DSP_Host_Types::FormatDescription,std::allocator<DSP_Host_Types::FormatDescription>,DSP_Host_Types::FormatDescription&,void>((uint64_t *)&v31, (const DSP_Host_Types::FormatDescription *)&cf);
        long long v22 = v36;
        if ((unint64_t)v36 >= *((void *)&v36 + 1))
        {
          uint64_t v24 = (uint64_t)(v36 - *((void *)&v35 + 1)) >> 4;
          if ((unint64_t)(v24 + 1) >> 60) {
            std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v25 = (uint64_t)(*((void *)&v36 + 1) - *((void *)&v35 + 1)) >> 3;
          if (v25 <= v24 + 1) {
            unint64_t v25 = v24 + 1;
          }
          if (*((void *)&v36 + 1) - *((void *)&v35 + 1) >= 0x7FFFFFFFFFFFFFF0uLL) {
            unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v26 = v25;
          }
          __int16 v58 = (char *)&v36 + 8;
          uint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v26);
          uint64_t v28 = &v27[16 * v24];
          v56[0] = v27;
          v56[1] = v28;
          uint64_t v57 = &v27[16 * v29];
          *(_OWORD *)uint64_t v28 = v31;
          v56[2] = v28 + 16;
          std::vector<std::shared_ptr<DSP_Host_Types::FormatDescription>>::__swap_out_circular_buffer((void *)&v35 + 1, v56);
          uint64_t v23 = v36;
          std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)v56);
        }
        else
        {
          *(_OWORD *)long long v36 = v31;
          uint64_t v23 = v22 + 16;
        }
        *(void *)&long long v36 = v23;
      }
    }
    v56[0] = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D528], MEMORY[0x1E4F1D538]);
    v32[3]((void **)&v32, v56);
    mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&v31, v56[0]);
    if (v56[0]) {
      CFRelease(v56[0]);
    }
    id v19 = (id)v31;
    id v13 = v19;
    if (v19) {
LABEL_74:
    }
      CFRelease(v19);
  }
  else
  {
    v56[0] = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D528], MEMORY[0x1E4F1D538]);
    v32[3]((void **)&v32, v56);
    mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&v31, v56[0]);
    if (v56[0]) {
      CFRelease(v56[0]);
    }
    id v19 = (id)v31;
    id v13 = v19;
    if (v19) {
      goto LABEL_74;
    }
  }
  CFTypeRef cf = &unk_1F1486968;
  if (__p)
  {
    uint64_t v53 = (DSP_Dictionariable::DictionarySet *)__p;
    operator delete(__p);
  }
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)v50);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v48);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v44);
  DSP_Dictionariable::DictionariableKvp::~DictionariableKvp((DSP_Dictionariable::DictionariableKvp *)&v42);
  CFTypeRef cf = &unk_1F14869A8;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v41);
  BOOL v32 = (void (**)(void **, const void **))&unk_1F1487440;
  CFTypeRef cf = &v37;
  std::vector<std::shared_ptr<DSP_Host_Types::DeviceDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  CFTypeRef cf = (char *)&v35 + 8;
  std::vector<std::shared_ptr<DSP_Host_Types::DeviceDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  CFTypeRef cf = &v34;
  std::vector<std::shared_ptr<DSP_Host_Types::DeviceDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  BOOL v32 = (void (**)(void **, const void **))&unk_1F1487480;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v33);
LABEL_78:
  std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v54);

  return v13;
}

- (void)setDspCallbacks:(void *)a3
{
  dspCallbacks = self->_dspCallbacks;
  if (dspCallbacks)
  {
    (*(void (**)(void *, SEL))(*(void *)dspCallbacks + 8))(dspCallbacks, a2);
    self->_dspCallbacks = 0;
  }
  if (a3) {
    self->_dspCallbacks = a3;
  }
}

- (BOOL)callAdaptHook:(const void *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(DSP_HAL_Mock_IOProcessor *)self testHookFetcher];
  if (!v17)
  {
    std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](v16);
    return 1;
  }
  [(DSP_HAL_Mock_IOProcessor *)self testHookFetcher];
  if (!v9) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(void *__return_ptr))(*(void *)v9 + 48))(v10);
  uint64_t v5 = v12;
  std::__function::__value_func<unsigned int ()(AudioObjectPropertyAddress const&,unsigned int)>::~__value_func[abi:ne180100](v15);
  std::__function::__value_func<void ()(DSP_HAL_Bypass_Utils::AMCP_IOData_Helper<(DSP_HAL_Bypass_Utils::InterleavePolicy)0> &,applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v14);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](v13);
  std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v11);
  std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v10);
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](v8);
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](v16);
  if (!v5) {
    return 1;
  }
  [(DSP_HAL_Mock_IOProcessor *)self testHookFetcher];
  if (!v17) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(void *__return_ptr))(*(void *)v17 + 48))(v10);
  if (!v12) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  char v6 = (*(uint64_t (**)(uint64_t, const void *))(*(void *)v12 + 48))(v12, a3);
  std::__function::__value_func<unsigned int ()(AudioObjectPropertyAddress const&,unsigned int)>::~__value_func[abi:ne180100](v15);
  std::__function::__value_func<void ()(DSP_HAL_Bypass_Utils::AMCP_IOData_Helper<(DSP_HAL_Bypass_Utils::InterleavePolicy)0> &,applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v14);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](v13);
  std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v11);
  std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v10);
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](v16);
  return v6;
}

- (void)setFeatureFlag:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_featureFlag = a3;
  uint64_t v5 = [(DSP_HAL_Mock_IOProcessor *)self processorProperties];

  if (v5)
  {
    id v6 = [(DSP_HAL_Mock_IOProcessor *)self processorProperties];
    [v6 configureForFeatureFlag:v3];
  }
}

- (BOOL)callNegotiateHook:(const void *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(DSP_HAL_Mock_IOProcessor *)self testHookFetcher];
  if (!v17)
  {
    std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](v16);
    return 1;
  }
  [(DSP_HAL_Mock_IOProcessor *)self testHookFetcher];
  if (!v9) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(void *__return_ptr))(*(void *)v9 + 48))(v10);
  uint64_t v5 = v11;
  std::__function::__value_func<unsigned int ()(AudioObjectPropertyAddress const&,unsigned int)>::~__value_func[abi:ne180100](v15);
  std::__function::__value_func<void ()(DSP_HAL_Bypass_Utils::AMCP_IOData_Helper<(DSP_HAL_Bypass_Utils::InterleavePolicy)0> &,applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v14);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](v13);
  std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v12);
  std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v10);
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](v8);
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](v16);
  if (!v5) {
    return 1;
  }
  [(DSP_HAL_Mock_IOProcessor *)self testHookFetcher];
  if (!v17) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(void *__return_ptr))(*(void *)v17 + 48))(v10);
  if (!v11) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  char v6 = (*(uint64_t (**)(uint64_t, const void *))(*(void *)v11 + 48))(v11, a3);
  std::__function::__value_func<unsigned int ()(AudioObjectPropertyAddress const&,unsigned int)>::~__value_func[abi:ne180100](v15);
  std::__function::__value_func<void ()(DSP_HAL_Bypass_Utils::AMCP_IOData_Helper<(DSP_HAL_Bypass_Utils::InterleavePolicy)0> &,applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v14);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:ne180100](v13);
  std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v12);
  std::__function::__value_func<BOOL ()(applesauce::CF::DictionaryRef const&)>::~__value_func[abi:ne180100](v10);
  std::__function::__value_func<DSP_HAL_Mock_TestHooks ()(void)>::~__value_func[abi:ne180100](v16);
  return v6;
}

- (void)dealloc
{
  processorProperties = self->_processorProperties;
  self->_processorProperties = 0;

  dspCallbacks = self->_dspCallbacks;
  if (dspCallbacks)
  {
    (*(void (**)(void *))(*(void *)dspCallbacks + 8))(dspCallbacks);
    self->_dspCallbacks = 0;
  }
  hostCallbacks = self->_hostCallbacks;
  self->_hostCallbacks = 0;

  v6.receiver = self;
  v6.super_class = (Class)DSP_HAL_Mock_IOProcessor;
  [(DSP_HAL_Mock_IOProcessor *)&v6 dealloc];
}

- (DSP_HAL_Mock_IOProcessor)init
{
  void v12[4] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)DSP_HAL_Mock_IOProcessor;
  v2 = [(DSP_HAL_Mock_IOProcessor *)&v11 init];
  uint64_t v3 = v2;
  v4 = v2;
  if (v2)
  {
    hostCallbacks = v2->_hostCallbacks;
    v2->_dspCallbacks = 0;
    v2->_hostCallbacks = 0;

    processorProperties = v4->_processorProperties;
    v4->_processorProperties = 0;

    v4->_featureFlag = 97;
    f = (function<DSP_HAL_Mock_TestHooks ()> *)v4->_testHookFetcher.__f_.__f_;
    v4->_testHookFetcher.__f_.__f_ = 0;
    if (f == &v3->_testHookFetcher)
    {
      (*(void (**)(function<DSP_HAL_Mock_TestHooks ()> *))(*(void *)v3->_testHookFetcher.__f_.__buf_.__lx
                                                                    + 32))(&v3->_testHookFetcher);
    }
    else if (f)
    {
      (*(void (**)(function<DSP_HAL_Mock_TestHooks ()> *))(*(void *)f->__f_.__buf_.__lx + 40))(f);
    }
    int v8 = objc_alloc_init(DSP_HAL_Mock_PropertySet);
    [(DSP_HAL_Mock_IOProcessor *)v4 setProcessorProperties:v8];

    uint64_t v9 = [(DSP_HAL_Mock_IOProcessor *)v4 processorProperties];
    v12[3] = 0;
    [v9 configureForProcessor:v12];
    std::__function::__value_func<void ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v12);
  }
  return v4;
}

@end