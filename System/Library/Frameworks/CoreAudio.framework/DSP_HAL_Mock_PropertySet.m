@interface DSP_HAL_Mock_PropertySet
- (BOOL)hasHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3;
- (BOOL)setHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withData:(id)a4 withQualifier:(id)a5 error:(id *)a6;
- (DSP_HAL_Mock_Property)propAvailableOffloadsInput;
- (DSP_HAL_Mock_Property)propDSPGraphParam;
- (DSP_HAL_Mock_Property)propVoiceActivityState;
- (DSP_HAL_Mock_PropertySet)init;
- (function<unsigned)propertyUpdater;
- (id).cxx_construct;
- (id)getHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withQualifierData:(id)a4;
- (id)getHostedDSPPropertyInfoArray;
- (unsigned)getVoiceActivityState;
- (void)configureForFeatureFlag:(int)a3;
- (void)configureForProcessor:(function<void (unsigned)int;
- (void)dealloc;
- (void)setPropAvailableOffloadsInput:(DSP_HAL_Mock_Property *)a3;
- (void)setPropDSPGraphParam:(DSP_HAL_Mock_Property *)a3;
- (void)setPropVoiceActivityState:(DSP_HAL_Mock_Property *)a3;
- (void)setPropertyUpdater:(function<unsigned int (const AudioObjectPropertyAddress)&;
- (void)toggleVoiceActivityAndNotify;
@end

@implementation DSP_HAL_Mock_PropertySet

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (void)setPropertyUpdater:(function<unsigned int (const AudioObjectPropertyAddress)&
{
  v9[3] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<unsigned int ()(AudioObjectPropertyAddress const&,unsigned int)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)a3);
  p_propertyUpdater = &self->_propertyUpdater;
  if (&self->_propertyUpdater != (function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *)v7)
  {
    v5 = v8;
    f = (function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *)self->_propertyUpdater.__f_.__f_;
    if (v8 == v7)
    {
      if (f == p_propertyUpdater)
      {
        (*(void (**)(void *, void *))(v7[0] + 24))(v7, v9);
        (*(void (**)(void *))(*v8 + 32))(v8);
        v8 = 0;
        (*(void (**)(void *, void *))(*(void *)self->_propertyUpdater.__f_.__f_ + 24))(self->_propertyUpdater.__f_.__f_, v7);
        (*(void (**)(void *))(*(void *)self->_propertyUpdater.__f_.__f_ + 32))(self->_propertyUpdater.__f_.__f_);
        self->_propertyUpdater.__f_.__f_ = 0;
        v8 = v7;
        (*(void (**)(void *, function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *))(v9[0] + 24))(v9, &self->_propertyUpdater);
        (*(void (**)(void *))(v9[0] + 32))(v9);
      }
      else
      {
        (*(void (**)(void *, function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *))(v7[0] + 24))(v7, &self->_propertyUpdater);
        (*(void (**)(void *))(*v8 + 32))(v8);
        v8 = self->_propertyUpdater.__f_.__f_;
      }
      self->_propertyUpdater.__f_.__f_ = p_propertyUpdater;
    }
    else if (f == p_propertyUpdater)
    {
      (*(void (**)(function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *, void *))(*(void *)p_propertyUpdater->__f_.__buf_.__lx + 24))(&self->_propertyUpdater, v7);
      (*(void (**)(void *))(*(void *)self->_propertyUpdater.__f_.__f_ + 32))(self->_propertyUpdater.__f_.__f_);
      self->_propertyUpdater.__f_.__f_ = v8;
      v8 = v7;
    }
    else
    {
      v8 = self->_propertyUpdater.__f_.__f_;
      self->_propertyUpdater.__f_.__f_ = v5;
    }
  }
  std::__function::__value_func<unsigned int ()(AudioObjectPropertyAddress const&,unsigned int)>::~__value_func[abi:ne180100](v7);
}

- (function<unsigned)propertyUpdater
{
  return (function<unsigned int (const AudioObjectPropertyAddress &, unsigned int)> *)std::__function::__value_func<unsigned int ()(AudioObjectPropertyAddress const&,unsigned int)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_propertyUpdater);
}

- (void)setPropDSPGraphParam:(DSP_HAL_Mock_Property *)a3
{
  self->_propDSPGraphParam = a3;
}

- (DSP_HAL_Mock_Property)propDSPGraphParam
{
  return self->_propDSPGraphParam;
}

- (void)setPropVoiceActivityState:(DSP_HAL_Mock_Property *)a3
{
  self->_propVoiceActivityState = a3;
}

- (DSP_HAL_Mock_Property)propVoiceActivityState
{
  return self->_propVoiceActivityState;
}

- (void)setPropAvailableOffloadsInput:(DSP_HAL_Mock_Property *)a3
{
  self->_propAvailableOffloadsInput = a3;
}

- (DSP_HAL_Mock_Property)propAvailableOffloadsInput
{
  return self->_propAvailableOffloadsInput;
}

- (id)getHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withQualifierData:(id)a4
{
  AudioObjectPropertyElement mElement = a3.mElement;
  AudioObjectPropertySelector mSelector = a3.mSelector;
  AudioObjectPropertyScope mScope = a3.mScope;
  id v8 = a4;
  if (mSelector == 1983997011 && mScope == 1768845428)
  {
    if (!mElement)
    {
      v9 = [(DSP_HAL_Mock_PropertySet *)self propVoiceActivityState];
      if (v9
      {
        unsigned int v11 = atomic_load(v10 + 42);
      }
      else
      {
        unsigned int v11 = 0;
      }
      *(_DWORD *)bytes = v11;
      CFDataRef v23 = CFDataCreate(0, bytes, 4);
      applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&v27, v23);
      id v24 = v27;
      v17 = v24;
      if (v24) {
        CFRelease(v24);
      }
      goto LABEL_29;
    }
    goto LABEL_16;
  }
  if (mSelector != 1685278561 || mScope != 1768845428 || mElement)
  {
LABEL_16:
    if ([(DSP_HAL_Mock_PropertySet *)self propDSPGraphParam]
      && (mSelector == 1684500589 || mSelector == 707406378)
      && (mScope == 1768845428 || mScope == 707406378))
    {
      v17 = 0;
      if (!v8 || mElement + 1 > 1) {
        goto LABEL_29;
      }
      if ([v8 length] == 4)
      {
        *(_DWORD *)bytes = 0;
        [v8 getBytes:bytes length:4];
        if (*(_DWORD *)bytes == 1651797616)
        {
          v18 = [(DSP_HAL_Mock_PropertySet *)self propDSPGraphParam];
          if (v18
          {
            unsigned int v20 = atomic_load(v19 + 42);
            unsigned int v21 = v20;
          }
          else
          {
            unsigned int v21 = 0;
          }
          *(_DWORD *)v26 = v21;
          CFDataRef v25 = CFDataCreate(0, v26, 4);
          applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&v27, v25);
          v17 = v27;
          AMCP::Log::Scope::get_os_log_t(v27);
          objc_claimAutoreleasedReturnValue();
          applesauce::CF::DataRef::~DataRef((const void **)&v27);
          goto LABEL_29;
        }
      }
    }
LABEL_28:
    v17 = 0;
    goto LABEL_29;
  }
  v12 = [(DSP_HAL_Mock_PropertySet *)self propAvailableOffloadsInput];
  if (!v12) {
    goto LABEL_28;
  }
  if (!v13) {
    goto LABEL_28;
  }
  v14 = (const void *)atomic_load(v13 + 21);
  if (!v14) {
    goto LABEL_28;
  }
  CFRetain(v14);
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&v27, v14);
  id v15 = v27;
  v16 = v15;
  if (v15) {
    CFRelease(v15);
  }
  v17 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v16 format:200 options:0 error:0];

LABEL_29:

  return v17;
}

- (BOOL)setHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withData:(id)a4 withQualifier:(id)a5 error:(id *)a6
{
  AudioObjectPropertyElement mElement = a3.mElement;
  uint64_t v8 = *(void *)&a3.mSelector;
  id v10 = a4;
  id v11 = a5;
  if (![(DSP_HAL_Mock_PropertySet *)self propDSPGraphParam]
    || v8 != 1684500589 && v8 != 707406378
    || HIDWORD(v8) != 1768845428 && HIDWORD(v8) != 707406378)
  {
    goto LABEL_14;
  }
  BOOL v12 = 0;
  if (!v11 || mElement + 1 > 1) {
    goto LABEL_15;
  }
  if ([v11 length] != 4
    || (int v18 = 0, [v11 getBytes:&v18 length:4], !v10)
    || v18 != 1651797616
    || [v10 length] != 4)
  {
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
  v13 = [(DSP_HAL_Mock_PropertySet *)self propDSPGraphParam];
  if (v13) {
  else
  }
    v14 = 0;
  float v17 = 0.0;
  [v10 getBytes:&v17 length:4];
  float v16 = v17;
  if (v16 != COERCE_FLOAT(atomic_exchange((atomic_uint *volatile)v14 + 42, LODWORD(v17)))) {
    std::condition_variable::notify_one((std::condition_variable *)v14 + 1);
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (BOOL)hasHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3
{
  unint64_t v3 = *(void *)&a3.mSelector;
  switch(a3.mSelector)
  {
    case 0x6467706Du:
      AudioObjectPropertyElement mElement = a3.mElement;
      v6 = [(DSP_HAL_Mock_PropertySet *)self propDSPGraphParam];
      BOOL v7 = mElement == 0;
      if (!v6) {
        BOOL v7 = 0;
      }
      return HIDWORD(v3) == 1768845428 && v7;
    case 0x64734F61u:
      v4 = [(DSP_HAL_Mock_PropertySet *)self propAvailableOffloadsInput];
      return v4 != 0;
    case 0x76416453u:
      v4 = [(DSP_HAL_Mock_PropertySet *)self propVoiceActivityState];
      return v4 != 0;
    default:
      return 0;
  }
}

- (id)getHostedDSPPropertyInfoArray
{
  v45[0] = 0;
  v45[1] = 0;
  v44 = (void (**)(void **, CFTypeRef *))&unk_1F1487398;
  uint64_t v46 = 0;
  v47 = 0;
  unint64_t v48 = 0;
  if ([(DSP_HAL_Mock_PropertySet *)self propVoiceActivityState])
  {
    std::allocate_shared[abi:ne180100]<DSP_Host_Types::DSPPropertyInfo,std::allocator<DSP_Host_Types::DSPPropertyInfo>,char const(&)[1],void>(&v43, "");
    unint64_t v3 = v47;
    if ((unint64_t)v47 >= v48)
    {
      uint64_t v5 = ((uint64_t)v47 - v46) >> 4;
      if ((unint64_t)(v5 + 1) >> 60) {
        std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v6 = (uint64_t)(v48 - v46) >> 3;
      if (v6 <= v5 + 1) {
        unint64_t v6 = v5 + 1;
      }
      if (v48 - v46 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v7 = v6;
      }
      v53 = &v48;
      uint64_t v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v7);
      v9 = &v8[16 * v5];
      CFTypeRef cf = v8;
      v50 = v9;
      v52 = &v8[16 * v10];
      *(_OWORD *)v9 = v43;
      v51 = v9 + 16;
      std::vector<std::shared_ptr<DSP_Host_Types::FormatDescription>>::__swap_out_circular_buffer(&v46, &cf);
      v4 = v47;
      std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&cf);
    }
    else
    {
      _OWORD *v47 = v43;
      v4 = v3 + 1;
    }
    v47 = v4;
    uint64_t v11 = *((void *)v4 - 2);
    *(_DWORD *)(v11 + 40) = 1983997011;
    *(unsigned char *)(v11 + 44) = 1;
    uint64_t v12 = *((void *)v4 - 2);
    *(_DWORD *)(v12 + 64) = 1768845428;
    *(unsigned char *)(v12 + 68) = 1;
    *(_WORD *)(*((void *)v4 - 2) + 112) = 256;
    *(_WORD *)(*((void *)v4 - 2) + 88) = 256;
    uint64_t v13 = *((void *)v4 - 2);
    *(_DWORD *)(v13 + 136) = 5;
    *(unsigned char *)(v13 + 140) = 1;
    uint64_t v14 = *((void *)v4 - 2);
    *(_DWORD *)(v14 + 224) = 1;
    *(unsigned char *)(v14 + 228) = 1;
  }
  if ([(DSP_HAL_Mock_PropertySet *)self propAvailableOffloadsInput])
  {
    std::allocate_shared[abi:ne180100]<DSP_Host_Types::DSPPropertyInfo,std::allocator<DSP_Host_Types::DSPPropertyInfo>,char const(&)[1],void>(&v43, "");
    id v15 = v47;
    if ((unint64_t)v47 >= v48)
    {
      uint64_t v17 = ((uint64_t)v47 - v46) >> 4;
      if ((unint64_t)(v17 + 1) >> 60) {
        std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v18 = (uint64_t)(v48 - v46) >> 3;
      if (v18 <= v17 + 1) {
        unint64_t v18 = v17 + 1;
      }
      if (v48 - v46 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v19 = v18;
      }
      v53 = &v48;
      unsigned int v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v19);
      unsigned int v21 = &v20[16 * v17];
      CFTypeRef cf = v20;
      v50 = v21;
      v52 = &v20[16 * v22];
      *(_OWORD *)unsigned int v21 = v43;
      v51 = v21 + 16;
      std::vector<std::shared_ptr<DSP_Host_Types::FormatDescription>>::__swap_out_circular_buffer(&v46, &cf);
      float v16 = v47;
      std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&cf);
    }
    else
    {
      _OWORD *v47 = v43;
      float v16 = v15 + 1;
    }
    v47 = v16;
    uint64_t v23 = *((void *)v16 - 2);
    *(_DWORD *)(v23 + 40) = 1685278561;
    *(unsigned char *)(v23 + 44) = 1;
    uint64_t v24 = *((void *)v16 - 2);
    *(_DWORD *)(v24 + 64) = 1768845428;
    *(unsigned char *)(v24 + 68) = 1;
    *(_WORD *)(*((void *)v16 - 2) + 112) = 256;
    *(_WORD *)(*((void *)v16 - 2) + 88) = 257;
    uint64_t v25 = *((void *)v16 - 2);
    *(_DWORD *)(v25 + 136) = 7;
    *(unsigned char *)(v25 + 140) = 1;
    uint64_t v26 = *((void *)v16 - 2);
    *(_DWORD *)(v26 + 224) = 7;
    *(unsigned char *)(v26 + 228) = 1;
  }
  if ([(DSP_HAL_Mock_PropertySet *)self propDSPGraphParam])
  {
    std::allocate_shared[abi:ne180100]<DSP_Host_Types::DSPPropertyInfo,std::allocator<DSP_Host_Types::DSPPropertyInfo>,char const(&)[1],void>(&v43, "");
    v28 = v47;
    if ((unint64_t)v47 >= v48)
    {
      uint64_t v30 = ((uint64_t)v47 - v46) >> 4;
      if ((unint64_t)(v30 + 1) >> 60) {
        std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v31 = (uint64_t)(v48 - v46) >> 3;
      if (v31 <= v30 + 1) {
        unint64_t v31 = v30 + 1;
      }
      if (v48 - v46 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v32 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v32 = v31;
      }
      v53 = &v48;
      v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CA::ValueRange>>(v32);
      v34 = &v33[16 * v30];
      CFTypeRef cf = v33;
      v50 = v34;
      v52 = &v33[16 * v35];
      *(_OWORD *)v34 = v43;
      v51 = v34 + 16;
      std::vector<std::shared_ptr<DSP_Host_Types::FormatDescription>>::__swap_out_circular_buffer(&v46, &cf);
      v29 = v47;
      std::__split_buffer<std::shared_ptr<DSP_Host_Types::FormatDescription>>::~__split_buffer((uint64_t)&cf);
    }
    else
    {
      _OWORD *v47 = v43;
      v29 = v28 + 1;
    }
    v47 = v29;
    uint64_t v36 = *((void *)v29 - 2);
    *(_DWORD *)(v36 + 40) = 1684500589;
    *(unsigned char *)(v36 + 44) = 1;
    uint64_t v37 = *((void *)v29 - 2);
    *(_DWORD *)(v37 + 64) = 707406378;
    *(unsigned char *)(v37 + 68) = 1;
    *(_WORD *)(*((void *)v29 - 2) + 112) = v27 & 1 | 0x100;
    *(_WORD *)(*((void *)v29 - 2) + 88) = 256;
    uint64_t v38 = *((void *)v29 - 2);
    *(_DWORD *)(v38 + 136) = 4;
    *(unsigned char *)(v38 + 140) = 1;
    uint64_t v39 = *((void *)v29 - 2);
    *(_DWORD *)(v39 + 224) = 5;
    *(unsigned char *)(v39 + 228) = 1;
  }
  CFTypeRef cf = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D528], MEMORY[0x1E4F1D538]);
  v44[3]((void **)&v44, &cf);
  mcp_applesauce::CF::Dictionary_Builder::get_dictionary((applesauce::CF::DictionaryRef *)&v43, cf);
  if (cf) {
    CFRelease(cf);
  }
  id v40 = (id)v43;
  v41 = v40;
  if (v40) {
    CFRelease(v40);
  }
  v44 = (void (**)(void **, CFTypeRef *))&unk_1F1487398;
  CFTypeRef cf = &v46;
  std::vector<std::shared_ptr<DSP_Host_Types::DeviceDescription>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
  v44 = (void (**)(void **, CFTypeRef *))&unk_1F14873D8;
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v45);

  return v41;
}

- (void)configureForFeatureFlag:(int)a3
{
  if ((~a3 & 0x101) == 0 && ![(DSP_HAL_Mock_PropertySet *)self propAvailableOffloadsInput]) {
    operator new();
  }
  if ((~a3 & 0x201) == 0 && ![(DSP_HAL_Mock_PropertySet *)self propDSPGraphParam]) {
    operator new();
  }
  if ((~a3 & 0x401) == 0 && ![(DSP_HAL_Mock_PropertySet *)self propDSPGraphParam]) {
    operator new();
  }
}

- (unsigned)getVoiceActivityState
{
  v2 = [(DSP_HAL_Mock_PropertySet *)self propVoiceActivityState];
  if (v2)
  {
    if (v2)
    {
      unsigned int v3 = atomic_load((unsigned int *)&v2[21]);
      LODWORD(v2) = v3 != 0;
    }
  }
  return v2;
}

- (void)toggleVoiceActivityAndNotify
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(DSP_HAL_Mock_PropertySet *)self propVoiceActivityState];
  if (!v3) {
    return;
  }
  if (!v4) {
    return;
  }
  uint64_t v5 = v4;
  [(DSP_HAL_Mock_PropertySet *)self propertyUpdater];
  uint64_t v6 = v15;
  std::__function::__value_func<unsigned int ()(AudioObjectPropertyAddress const&,unsigned int)>::~__value_func[abi:ne180100](v14);
  if (!v6)
  {
    if ((double)(std::chrono::steady_clock::now().__d_.__rep_ - *((void *)v5 + 22)) / 1000000000.0 * 1000.0 <= (double)*((uint64_t *)v5 + 23)) {
      return;
    }
    *((std::chrono::steady_clock::time_point *)v5 + 22) = std::chrono::steady_clock::now();
    unsigned int v10 = atomic_load((unsigned int *)v5 + 42);
    if (atomic_exchange((atomic_uint *volatile)v5 + 42, v10 == 0) == (v10 == 0)) {
      return;
    }
LABEL_10:
    std::condition_variable::notify_one((std::condition_variable *)v5 + 1);
    return;
  }
  [(DSP_HAL_Mock_PropertySet *)self propertyUpdater];
  uint64_t v11 = 1983997011;
  unsigned int v7 = atomic_load((unsigned int *)v5 + 42);
  int v12 = 0;
  BOOL v13 = v7 != 0;
  if (!v15) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  unsigned int v8 = (*(uint64_t (**)(uint64_t, uint64_t *, BOOL *))(*(void *)v15 + 48))(v15, &v11, &v13) != 0;
  std::__function::__value_func<unsigned int ()(AudioObjectPropertyAddress const&,unsigned int)>::~__value_func[abi:ne180100](v14);
  unsigned int v9 = atomic_load((unsigned int *)v5 + 42);
  if (v9 != v8 && atomic_exchange((atomic_uint *volatile)v5 + 42, v8) != v8) {
    goto LABEL_10;
  }
}

- (void)configureForProcessor:(function<void (unsigned)int
{
  v7[12] = *MEMORY[0x1E4F143B8];
  if (![(DSP_HAL_Mock_PropertySet *)self propVoiceActivityState]) {
    operator new();
  }
  if (a3->var0.var1)
  {
    uint64_t v5 = [(DSP_HAL_Mock_PropertySet *)self propVoiceActivityState];
    if (v5) {
    else
    }
      uint64_t v6 = 0;
    std::__function::__value_func<void ()(unsigned int,unsigned int)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)a3);
    DSP_TemplatedProperty<1983997011u,1768845428u,unsigned int>::setNotifyCallback((uint64_t)v6, (uint64_t)v7);
    std::__function::__value_func<void ()(unsigned int,unsigned int)>::~__value_func[abi:ne180100](v7);
  }
}

- (void)dealloc
{
  propVoiceActivityState = self->_propVoiceActivityState;
  if (propVoiceActivityState)
  {
    (*((void (**)(DSP_HAL_Mock_Property *, SEL))propVoiceActivityState->var0 + 1))(propVoiceActivityState, a2);
    self->_propVoiceActivityState = 0;
  }
  propAvailableOffloadsInput = self->_propAvailableOffloadsInput;
  if (propAvailableOffloadsInput)
  {
    (*((void (**)(DSP_HAL_Mock_Property *, SEL))propAvailableOffloadsInput->var0 + 1))(propAvailableOffloadsInput, a2);
    self->_propAvailableOffloadsInput = 0;
  }
  propDSPGraphParam = self->_propDSPGraphParam;
  if (propDSPGraphParam)
  {
    (*((void (**)(DSP_HAL_Mock_Property *, SEL))propDSPGraphParam->var0 + 1))(propDSPGraphParam, a2);
    self->_propDSPGraphParam = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)DSP_HAL_Mock_PropertySet;
  [(DSP_HAL_Mock_PropertySet *)&v6 dealloc];
}

- (DSP_HAL_Mock_PropertySet)init
{
  v3.receiver = self;
  v3.super_class = (Class)DSP_HAL_Mock_PropertySet;
  result = [(DSP_HAL_Mock_PropertySet *)&v3 init];
  if (result)
  {
    result->_propAvailableOffloadsInput = 0;
    result->_propVoiceActivityState = 0;
    result->_propDSPGraphParam = 0;
  }
  return result;
}

@end