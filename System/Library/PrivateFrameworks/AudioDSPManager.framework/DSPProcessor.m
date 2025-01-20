@interface DSPProcessor
- (BOOL)hasHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3;
- (BOOL)setHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withData:(id)a4 error:(id *)a5;
- (BOOL)setHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withData:(id)a4 withQualifier:(id)a5 error:(id *)a6;
- (BOOL)validateAdaptConfigurationChangeRequest:(const void *)a3;
- (DSPProcessor)initWithHostDescription:(id)a3 hostCallback:(id)a4 systemConfiguration:(SystemConfiguration *)a5;
- (id).cxx_construct;
- (id)adaptToConfigurationChange:(id)a3 withCallbacks:(void *)a4 error:(id *)a5;
- (id)doNegotiateConfigurationChange:(id)a3 simulate:(BOOL)a4 error:(id *)a5;
- (id)getHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withQualifierData:(id)a4;
- (id)getHostedDSPPropertyInfoArray;
- (id)initWithHostDescription:hostCallback:systemConfiguration:;
- (id)negotiateConfigurationChange:(id)a3 error:(id *)a4;
- (id)simulateConfigurationChange:(id)a3 error:(id *)a4;
- (uint64_t)initWithHostDescription:hostCallback:systemConfiguration:;
- (void)dealloc;
- (void)dumpDiagnosticsWithNSObject:(id)a3 name:(id)a4;
- (void)initWithHostDescription:hostCallback:systemConfiguration:;
- (void)registerExternalNotification:(const void *)a3;
- (void)unregisterExternalNotification;
@end

@implementation DSPProcessor

- (id).cxx_construct
{
  self->_systemConfiguration.mContext.mResourcePath.__pn_.__r_.__value_.var0.var1.__data_ = 0;
  *((_OWORD *)&self->_hostDescription.mBundleID.__r_.__value_.var0.var1 + 1) = 0u;
  *(_OWORD *)&self->_hostDescription.mBundleID.var0 = 0u;
  *(_OWORD *)self->_hostDescription.mBundleID.__r_.__value_.var0.var0.__data_ = 0u;
  self->_systemConfiguration.mContext.mOS = 0;
  *(_OWORD *)&self->_systemConfiguration.mContext.mResourcePath.__pn_.__r_.__value_.var0.var1.__size_ = 0uLL;
  std::__fs::filesystem::path::path[abi:ne180100]<char [24],void>((std::string *)&self->_systemConfiguration.mContext.mResourcePath.__pn_.__r_.var0, (std::string *)"/Library/Audio/Tunings/");
  self->_anon_70[8] = 0;
  self->_anon_70[12] = 0;
  self->_anon_70[16] = 0;
  self->_anon_70[40] = 0;
  self->_anon_70[48] = 0;
  self->_anon_70[72] = 0;
  self->_anon_70[80] = 0;
  self->_anon_70[84] = 0;
  *(_OWORD *)&self->_anon_70[104] = 0u;
  *(_OWORD *)&self->_anon_70[120] = 0u;
  *(_OWORD *)&self->_anon_70[136] = 0u;
  *(_OWORD *)&self->_anon_70[88] = 0u;
  *(_OWORD *)&self->_anon_70[152] = 0u;
  *(_DWORD *)&self->_anon_70[168] = 1065353216;
  self->_pendingDeviceConfigChanges.__engaged_ = 0;
  self->_activeDeviceConfigChanges.var0.__null_state_ = 0;
  self->_activeDeviceConfigChanges.__engaged_ = 0;
  self->_pendingChangeRequest.var0.__null_state_ = 0;
  self->_pendingChangeRequest.__engaged_ = 0;
  self->_activeChangeRequest.var0.__null_state_ = 0;
  self->_activeChangeRequest.__engaged_ = 0;
  self->_graphBuilder.__ptr_.__value_ = 0;
  self->_nodeManager.__ptr_.__value_ = 0;
  self->_pendingDeviceConfigChanges.var0.__null_state_ = 0;
  self->_customPropertyManager.__ptr_.__value_ = 0;
  return self;
}

- (void).cxx_destruct
{
  std::__optional_destruct_base<adm::ConfigurationChangeRequest,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&self->_activeChangeRequest);
  std::__optional_destruct_base<adm::ConfigurationChangeRequest,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&self->_pendingChangeRequest);
  if (self->_activeDeviceConfigChanges.__engaged_)
  {
    p_activeDeviceConfigChanges = &self->_activeDeviceConfigChanges;
    std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_activeDeviceConfigChanges);
  }
  if (self->_pendingDeviceConfigChanges.__engaged_)
  {
    p_activeDeviceConfigChanges = &self->_pendingDeviceConfigChanges;
    std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_activeDeviceConfigChanges);
  }
  value = self->_customPropertyManager.__ptr_.__value_;
  self->_customPropertyManager.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<adm::CustomPropertyManager>::operator()[abi:ne180100]((uint64_t)value);
  }
  v4 = (uint64_t *)self->_nodeManager.__ptr_.__value_;
  self->_nodeManager.__ptr_.__value_ = 0;
  if (v4) {
    std::default_delete<adm::graph::NodeManager>::operator()[abi:ne180100](v4);
  }
  v5 = (void **)self->_graphBuilder.__ptr_.__value_;
  self->_graphBuilder.__ptr_.__value_ = 0;
  if (v5) {
    std::default_delete<adm::graph::GraphBuilder>::operator()[abi:ne180100](v5);
  }
  adm::SystemConfiguration::~SystemConfiguration((void **)&self->_systemConfiguration);
  objc_storeStrong((id *)&self->_hostCallback, 0);
  if ((char)self->_anon_30[7] < 0) {
    operator delete(*(void **)&self->_hostDescription.mBundleID.__r_.var0);
  }
  if (*((char *)&self->_hostDescription.mBundleID.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = self->_hostDescription.mBundleID.__r_.__value_.var0.var1.__data_;
    operator delete(data);
  }
}

- (void)dumpDiagnosticsWithNSObject:(id)a3 name:(id)a4
{
  v15 = (adm::utility *)a3;
  id v6 = a4;
  {
    if (v14)
    {
      -[DSPProcessor dumpDiagnosticsWithNSObject:name:]::isDebugDumpEnabled = adm::utility::readDefaultsDebugDumpEnablement(v14);
    }
  }
  if (-[DSPProcessor dumpDiagnosticsWithNSObject:name:]::isDebugDumpEnabled)
  {
    v7 = NSString;
    p_hostDescription = &self->_hostDescription;
    if (*((char *)&self->_hostDescription.mBundleID.__r_.__value_.var0.var1 + 23) < 0) {
      p_hostDescription = (HostDescription *)p_hostDescription->mBundleID.__r_.__value_.var0.var1.__data_;
    }
    v9 = [NSString stringWithUTF8String:p_hostDescription];
    p_var0 = &self->_hostDescription.mBundleID.__r_.var0;
    if ((char)self->_anon_30[7] < 0) {
      p_var0 = *(int **)p_var0;
    }
    v11 = [NSString stringWithUTF8String:p_var0];
    v12 = [v7 stringWithFormat:@"%@(%@_%@)", v6, v9, v11];

    adm::utility::writeNSObjectToDisk(v15, v12, v13);
  }
}

- (void)unregisterExternalNotification
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_hasRegisteredUIOrientation)
  {
    int v3 = CAUnregisterUIOrientation();
    if (v3)
    {
      int v4 = v3;
      v5 = get_adm_log_object();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v4;
        _os_log_error_impl(&dword_248947000, v5, OS_LOG_TYPE_ERROR, "Failed to unregister UIOrientation with error %d", (uint8_t *)v6, 8u);
      }
    }
    else
    {
      self->_hasRegisteredUIOrientation = 0;
      v5 = get_adm_log_object();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v6[0]) = 0;
        _os_log_impl(&dword_248947000, v5, OS_LOG_TYPE_DEFAULT, "Succeeded in unregistering UIOrientation notification", (uint8_t *)v6, 2u);
      }
    }
  }
}

- (void)registerExternalNotification:(const void *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(__p, "isolated audio muted talker detection");
  v5 = (char *)std::__tree<std::string>::find<std::string>((uint64_t)a3 + 8, __p);
  id v6 = (char *)a3 + 16;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v6 != v5)
  {
    objc_initWeak(__p, self);
    objc_copyWeak(&v9, __p);
    int v7 = CARegisterUIOrientation();
    if (v7)
    {
      v8 = get_adm_log_object();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v13 = v7;
        _os_log_error_impl(&dword_248947000, v8, OS_LOG_TYPE_ERROR, "Failed to register UIOrientation with error %d", buf, 8u);
      }
    }
    else
    {
      self->_hasRegisteredUIOrientation = 1;
      v8 = get_adm_log_object();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_248947000, v8, OS_LOG_TYPE_DEFAULT, "Succeeded in registering UIOrientation notification", buf, 2u);
      }
    }

    objc_destroyWeak(&v9);
    objc_destroyWeak(__p);
  }
}

void __45__DSPProcessor_registerExternalNotification___block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v4 = get_adm_log_object();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = a2;
      _os_log_debug_impl(&dword_248947000, v4, OS_LOG_TYPE_DEBUG, "UIOrientation notification received, orientation = %d", buf, 8u);
    }

    v5 = [MEMORY[0x263EFF8F8] dataWithBytes:&v7 length:4];
    uint64_t v6 = 0;
    objc_msgSend(WeakRetained, "setHostedDSPPropertyAtAddress:withData:withQualifier:error:", 0x676C6F6255494F52, 0, v5, 0, &v6);
  }
}

- (id)getHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withQualifierData:(id)a4
{
  AudioObjectPropertyAddress v14 = a3;
  id v5 = a4;
  value = self->_customPropertyManager.__ptr_.__value_;
  id v7 = v5;
  v8 = v7;
  if (v7) {
    CFRetain(v7);
  }
  applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&cf, v8);

  adm::CustomPropertyManager::getCustomProperty((applesauce::CF::DataRef *)&v13, (uint64_t)value, (uint64_t)&v14, cf);
  id v9 = v13;
  uint64_t v10 = v9;
  if (v9) {
    CFRelease(v9);
  }
  if (cf) {
    CFRelease(cf);
  }

  return v10;
}

- (BOOL)setHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withData:(id)a4 withQualifier:(id)a5 error:(id *)a6
{
  AudioObjectPropertyAddress v19 = a3;
  id v8 = a4;
  id v9 = a5;
  value = self->_customPropertyManager.__ptr_.__value_;
  id v11 = v8;
  v12 = v11;
  if (v11) {
    CFRetain(v11);
  }
  applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&v18, v12);

  id v13 = v9;
  AudioObjectPropertyAddress v14 = v13;
  if (v13) {
    CFRetain(v13);
  }
  applesauce::CF::DataRef::DataRef((applesauce::CF::DataRef *)&cf, v14);

  BOOL v15 = adm::CustomPropertyManager::setCustomProperty((uint64_t)value, &v19, (CFDataRef *)&v18, cf);
  if (cf) {
    CFRelease(cf);
  }
  if (v18) {
    CFRelease(v18);
  }

  return v15;
}

- (BOOL)setHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3 withData:(id)a4 error:(id *)a5
{
  return -[DSPProcessor setHostedDSPPropertyAtAddress:withData:withQualifier:error:](self, "setHostedDSPPropertyAtAddress:withData:withQualifier:error:", *(void *)&a3.mSelector, a3.mElement, a4, 0, a5);
}

- (BOOL)hasHostedDSPPropertyAtAddress:(AudioObjectPropertyAddress)a3
{
  uint64_t v3 = 0;
  BOOL result = 1;
  while (1)
  {
    if (a3.mSelector == 707406378
        ? (BOOL v6 = v5 == a3.mSelector)
        : (BOOL v6 = 1),
          v6))
    {
      if (a3.mScope == 707406378
        || ((v8 = *((_DWORD *)v7 + 1), v8 != 707406378) ? (BOOL v9 = v8 == a3.mScope) : (BOOL v9 = 1), v9))
      {
        if (a3.mElement == -1) {
          break;
        }
        int v10 = *((_DWORD *)v7 + 2);
        if (v10 == -1 || v10 == a3.mElement) {
          break;
        }
      }
    }
    v3 += 56;
    if (v3 == 224) {
      return 0;
    }
  }
  return result;
}

- (id)getHostedDSPPropertyInfoArray
{
  adm::CustomPropertyManager::getCustomPropertyList((adm::CustomPropertyManager *)&v5);
  id v2 = v5;
  uint64_t v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

- (id)adaptToConfigurationChange:(id)a3 withCallbacks:(void *)a4 error:(id *)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  v58 = self;
  id v7 = (adm::utility *)a3;
  char v55 = 1;
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  int v8 = get_adm_log_object();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_248947000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ADM::Adapt", (const char *)&unk_2489B4309, buf, 2u);
  }

  if (*((char *)&v58->_hostDescription.mBundleID.__r_.__value_.var0.var1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v54, v58->_hostDescription.mBundleID.__r_.__value_.var0.var1.__data_, v58->_hostDescription.mBundleID.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    long long v9 = *(_OWORD *)v58->_hostDescription.mBundleID.__r_.__value_.var0.var0.__data_;
    v54.__r_.__value_.__r.__words[2] = *((void *)&v58->_hostDescription.mBundleID.__r_.__value_.var0.var1 + 2);
    *(_OWORD *)&v54.__r_.__value_.__l.__data_ = v9;
  }
  int v10 = get_adm_log_object();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = &v54;
    if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      id v11 = (std::string *)v54.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl(&dword_248947000, v10, OS_LOG_TYPE_DEFAULT, ">>> ADAPT [%s]", buf, 0xCu);
  }

  LOBYTE(v52) = 0;
  char v53 = 0;
  [(DSPProcessor *)v58 dumpDiagnosticsWithNSObject:v7 name:@"AdaptConfigChange"];
  LOBYTE(v39.super.isa) = 0;
  v41[0] = 0;
  v41[1] = 0;
  v40 = v41;
  char v42 = 0;
  char v43 = 0;
  char v44 = 0;
  char v45 = 0;
  LOBYTE(__p) = 0;
  char v48 = 0;
  char v49 = 0;
  char v50 = 0;
  memset(v51, 0, sizeof(v51));
  if (!adm::utility::convertFromDictionary(v7, &v39, v12))
  {
    v16 = get_adm_log_object();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_248947000, v16, OS_LOG_TYPE_ERROR, "Failed to convert the config change request dictionary", buf, 2u);
    }

    id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"AudioDSPManagerErrorDomain" code:1969448551 userInfo:0];
    goto LABEL_23;
  }
  logConfigChangeRequestBasicInfo((const adm::ConfigurationChangeRequest *)&v39);
  if (![(DSPProcessor *)v58 validateAdaptConfigurationChangeRequest:&v39])
  {
    id v17 = [MEMORY[0x263F087E8] errorWithDomain:@"AudioDSPManagerErrorDomain" code:1969448551 userInfo:0];
LABEL_23:
    CFTypeRef v18 = 0;
    *a5 = v17;
    goto LABEL_24;
  }
  if (!LOBYTE(v39.super.isa))
  {
    v21 = get_adm_log_object();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_248947000, v21, OS_LOG_TYPE_DEFAULT, "Adapt to de-activation config change request", buf, 2u);
    }

    [(DSPProcessor *)v58 unregisterExternalNotification];
    goto LABEL_58;
  }
  adm::graph::GraphBuilder::buildGraph((adm::graph::GraphBuilder *)buf, (const adm::ConfigurationChangeRequest *)v58->_graphBuilder.__ptr_.__value_, (uint64_t)&v39);
  if (v81)
  {
    v37 = 0;
    v38 = 0;
    *(void *)v62 = &v58;
    v63 = buf;
    v64 = &v37;
    if (v80 == -1) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    v59 = v62;
    ((void (*)(uint8_t **, uint64_t *))off_26FCA3798[v80])(&v59, &v79);
    if (!v37)
    {
      v27 = get_adm_log_object();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v62 = 0;
        _os_log_error_impl(&dword_248947000, v27, OS_LOG_TYPE_ERROR, "DSP node is null", v62, 2u);
      }

      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v60 = *MEMORY[0x263F08320];
      v61 = @"ADM failed to create DSP node";
      v29 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      *a5 = [v28 errorWithDomain:@"AudioDSPManagerErrorDomain" code:1970170734 userInfo:v29];

      int v26 = 1;
      goto LABEL_52;
    }
    adm::CustomPropertyManager::attachToNode((uint64_t)v58->_customPropertyManager.__ptr_.__value_, &v37, (uint64_t)&v40);
    adm::graph::Node::createHandlers((adm::graph::Node *)v62, (uint64_t)v37);
    std::__function::__value_func<void ()>::operator=[abi:ne180100]((void *)a4 + 12, (uint64_t)v65);
    AudioObjectPropertyAddress v14 = (char *)a4 + 56;
    id v13 = (char *)*((void *)a4 + 7);
    BOOL v15 = (char *)a4 + 32;
    *((void *)a4 + 7) = 0;
    if (v13 == (char *)a4 + 32)
    {
      (*(void (**)(char *))(*(void *)v15 + 32))((char *)a4 + 32);
    }
    else if (v13)
    {
      (*(void (**)(char *))(*(void *)v13 + 40))(v13);
    }
    if (v68)
    {
      if (v68 == v67)
      {
        void *v14 = v15;
        (*(void (**)(void *, char *))(v67[0] + 24))(v67, (char *)a4 + 32);
        goto LABEL_49;
      }
      void *v14 = v68;
      AudioObjectPropertyAddress v14 = &v68;
    }
    void *v14 = 0;
LABEL_49:
    std::__function::__value_func<void ()>::operator=[abi:ne180100]((void *)a4 + 16, (uint64_t)v70);
    if (v73)
    {
      uint64_t v30 = (*(uint64_t (**)(uint64_t))(*(void *)v73 + 48))(v73);
      char v53 = 1;
      uint64_t v52 = v30;
    }
    std::__function::__value_func<unsigned long long ()(unsigned long long,unsigned long long &)>::~__value_func[abi:ne180100](v75);
    std::__function::__value_func<unsigned long long ()(unsigned long long)>::~__value_func[abi:ne180100](v74);
    std::__function::__value_func<long long ()(void)>::~__value_func[abi:ne180100](v72);
    std::__function::__value_func<void ()>::~__value_func[abi:ne180100](v71);
    std::__function::__value_func<void ()>::~__value_func[abi:ne180100](v70);
    std::__function::__value_func<void ()(unsigned int,AMCP::Proc_Cycle_Info const&)>::~__value_func[abi:ne180100](v69);
    std::__function::__value_func<void ()(unsigned int,AMCP::Proc_Cycle_Info const&,unsigned long,AMCP::Proc_Stream *,unsigned long,AMCP::Proc_Stream *)>::~__value_func[abi:ne180100](v67);
    std::__function::__value_func<void ()(unsigned int,AMCP::Proc_Cycle_Info const&)>::~__value_func[abi:ne180100](v66);
    std::__function::__value_func<void ()>::~__value_func[abi:ne180100](v65);
    std::__function::__value_func<void ()>::~__value_func[abi:ne180100](v62);
    [(DSPProcessor *)v58 registerExternalNotification:&v39];
    int v26 = 0;
LABEL_52:
    if (v38) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v38);
    }
    goto LABEL_54;
  }
  v22 = (void *)MEMORY[0x263F087E8];
  uint64_t v23 = *(int *)buf;
  uint64_t v76 = *MEMORY[0x263F08320];
  v77 = @"ADM failed to build graph";
  v24 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  *a5 = [v22 errorWithDomain:@"AudioDSPManagerErrorDomain" code:v23 userInfo:v24];

  v25 = get_adm_log_object();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v62 = 0;
    _os_log_error_impl(&dword_248947000, v25, OS_LOG_TYPE_ERROR, "ADM failed to build graph", v62, 2u);
  }

  int v26 = 1;
LABEL_54:
  if (v81) {
    caulk::__expected_detail::destroy<adm::graph::GraphDescription,(void *)0>((uint64_t)buf);
  }
  if (v26)
  {
    CFTypeRef v18 = 0;
    goto LABEL_24;
  }
LABEL_58:
  p_activeChangeRequest = &v58->_activeChangeRequest;
  if (LOBYTE(v39.super.isa))
  {
    std::optional<adm::ConfigurationChangeRequest>::operator=[abi:ne180100]<adm::ConfigurationChangeRequest,void>((uint64_t)p_activeChangeRequest, (uint64_t)&v39);
    v32 = v58;
    p_pendingDeviceConfigChanges = &v58->_pendingDeviceConfigChanges;
    if (v58->_activeDeviceConfigChanges.__engaged_ == v58->_pendingDeviceConfigChanges.__engaged_)
    {
      if (v58->_activeDeviceConfigChanges.__engaged_)
      {
        std::vector<adm::DeviceConfiguration>::__vdeallocate((uint64_t *)&v58->_activeDeviceConfigChanges.var0.__val_);
        *(_OWORD *)&p_pendingDeviceConfigChanges[1].var0.__null_state_ = *(_OWORD *)&p_pendingDeviceConfigChanges->var0.__null_state_;
        v32->_activeDeviceConfigChanges.var0.__val_.__end_cap_.__value_ = v32->_pendingDeviceConfigChanges.var0.__val_.__end_cap_.__value_;
        p_pendingDeviceConfigChanges->var0.__val_.__end_ = 0;
        p_pendingDeviceConfigChanges->var0.__val_.__end_cap_.__value_ = 0;
        p_pendingDeviceConfigChanges->var0.__val_.__begin_ = 0;
      }
      goto LABEL_68;
    }
    if (!v58->_activeDeviceConfigChanges.__engaged_)
    {
      *(_OWORD *)&v58->_activeDeviceConfigChanges.var0.__null_state_ = *(_OWORD *)&v58->_pendingDeviceConfigChanges.var0.__null_state_;
      v32->_activeDeviceConfigChanges.var0.__val_.__end_cap_.__value_ = v32->_pendingDeviceConfigChanges.var0.__val_.__end_cap_.__value_;
      p_pendingDeviceConfigChanges->var0.__val_.__end_ = 0;
      p_pendingDeviceConfigChanges->var0.__val_.__end_cap_.__value_ = 0;
      p_pendingDeviceConfigChanges->var0.__val_.__begin_ = 0;
      v32->_activeDeviceConfigChanges.__engaged_ = 1;
      goto LABEL_68;
    }
    *(void *)buf = &v58->_activeDeviceConfigChanges;
    goto LABEL_66;
  }
  std::__optional_destruct_base<adm::ConfigurationChangeRequest,false>::reset[abi:ne180100]((uint64_t)p_activeChangeRequest);
  v32 = v58;
  if (v58->_activeDeviceConfigChanges.__engaged_)
  {
    *(void *)buf = &v58->_activeDeviceConfigChanges;
LABEL_66:
    std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    v32->_activeDeviceConfigChanges.__engaged_ = 0;
  }
LABEL_68:
  std::__optional_destruct_base<adm::ConfigurationChangeRequest,false>::reset[abi:ne180100]((uint64_t)&v58->_pendingChangeRequest);
  v34 = v58;
  if (v58->_pendingDeviceConfigChanges.__engaged_)
  {
    *(void *)buf = &v58->_pendingDeviceConfigChanges;
    std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    v34->_pendingDeviceConfigChanges.__engaged_ = 0;
  }
  CFTypeRef v18 = adm::utility::convertToDictionary((uint64_t)&v52);
  [(DSPProcessor *)v58 dumpDiagnosticsWithNSObject:v18 name:@"AdaptResponse"];
  v35 = get_adm_log_object();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = &v54;
    if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v36 = (std::string *)v54.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v36;
    _os_log_impl(&dword_248947000, v35, OS_LOG_TYPE_DEFAULT, "<<< ADAPT [%s]", buf, 0xCu);
  }

LABEL_24:
  *(void *)buf = (char *)&v51[1] + 8;
  std::vector<adm::DeviceDescription>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(void *)buf = v51;
  std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  if (v48 && __p)
  {
    v47 = __p;
    operator delete(__p);
  }
  std::__tree<std::string>::destroy(v41[0]);
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v54.__r_.__value_.__l.__data_);
  }
  AudioObjectPropertyAddress v19 = get_adm_log_object();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_248947000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ADM::Adapt", (const char *)&unk_2489B4309, buf, 2u);
  }

  return v18;
}

- (BOOL)validateAdaptConfigurationChangeRequest:(const void *)a3
{
  BOOL engaged = self->_pendingChangeRequest.__engaged_;
  if (*(unsigned char *)a3) {
    BOOL v6 = !engaged;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    if (self->_pendingChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair3_.__value_ != *((void *)a3 + 3)) {
      goto LABEL_48;
    }
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)self->_pendingChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__begin_node_;
    p_pair1 = &self->_pendingChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair1_;
    if (begin_node != &self->_pendingChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair1_)
    {
      v20 = (unsigned __int8 *)*((void *)a3 + 1);
      while (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)&begin_node[4], v20 + 32))
      {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)begin_node[1].__value_.__left_;
        v22 = begin_node;
        if (left)
        {
          do
          {
            begin_node = left;
            left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)left->__value_.__left_;
          }
          while (left);
        }
        else
        {
          do
          {
            begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)v22[2].__value_.__left_;
            BOOL v6 = begin_node->__value_.__left_ == v22;
            v22 = begin_node;
          }
          while (!v6);
        }
        uint64_t v23 = (unsigned __int8 *)*((void *)v20 + 1);
        if (v23)
        {
          do
          {
            v24 = v23;
            uint64_t v23 = *(unsigned __int8 **)v23;
          }
          while (v23);
        }
        else
        {
          do
          {
            v24 = (unsigned __int8 *)*((void *)v20 + 2);
            BOOL v6 = *(void *)v24 == (void)v20;
            v20 = v24;
          }
          while (!v6);
        }
        v20 = v24;
        if (begin_node == p_pair1) {
      }
        }
LABEL_48:
      int v26 = get_adm_log_object();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = 0;
        v27 = "Adapt semantics don't match Negotiated semantics";
        v28 = (uint8_t *)&v32;
LABEL_53:
        _os_log_error_impl(&dword_248947000, v26, OS_LOG_TYPE_ERROR, v27, v28, 2u);
        goto LABEL_51;
      }
      goto LABEL_51;
    }
  }
  if (*(unsigned char *)a3) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = !engaged;
  }
  if (!v7) {
  if (self->_activeChangeRequest.__engaged_
  }
    && self->_activeChangeRequest.var0.__null_state_ == *(unsigned __int8 *)a3
    && self->_activeChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair3_.__value_ == *((void *)a3 + 3))
  {
    int v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)self->_activeChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__begin_node_;
    long long v9 = &self->_activeChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair1_;
    if (v8 == &self->_activeChangeRequest.var0.__val_.mIOContextDescription.mSemantics.__tree_.__pair1_)
    {
LABEL_28:
      end = (unsigned __int8 *)self->_activeChangeRequest.var0.__val_.mIOContextDescription.mStreamIDs.__end_;
      begin = (unsigned __int8 *)self->_activeChangeRequest.var0.__val_.mIOContextDescription.mStreamIDs.__begin_;
      id v17 = (unsigned __int8 *)*((void *)a3 + 21);
      if (end - begin == *((void *)a3 + 22) - (void)v17)
      {
        while (begin != end)
        {
          if (!std::equal_to<std::string>::operator()[abi:ne180100](begin, v17)) {
            goto LABEL_50;
          }
          begin += 24;
          v17 += 24;
        }
        v29 = get_adm_log_object();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_248947000, v29, OS_LOG_TYPE_INFO, "warning: Adapt called without a Negotiate, but request is duplicate so allow for now", buf, 2u);
        }
      }
    }
    else
    {
      int v10 = (unsigned __int8 *)*((void *)a3 + 1);
      while (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)&v8[4], v10 + 32))
      {
        id v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)v8[1].__value_.__left_;
        v12 = v8;
        if (v11)
        {
          do
          {
            int v8 = v11;
            id v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)v11->__value_.__left_;
          }
          while (v11);
        }
        else
        {
          do
          {
            int v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)v12[2].__value_.__left_;
            BOOL v6 = v8->__value_.__left_ == v12;
            v12 = v8;
          }
          while (!v6);
        }
        id v13 = (unsigned __int8 *)*((void *)v10 + 1);
        if (v13)
        {
          do
          {
            AudioObjectPropertyAddress v14 = v13;
            id v13 = *(unsigned __int8 **)v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            AudioObjectPropertyAddress v14 = (unsigned __int8 *)*((void *)v10 + 2);
            BOOL v6 = *(void *)v14 == (void)v10;
            int v10 = v14;
          }
          while (!v6);
        }
        int v10 = v14;
        if (v8 == v9) {
          goto LABEL_28;
        }
      }
    }
  }
LABEL_50:
  int v26 = get_adm_log_object();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    __int16 v30 = 0;
    v27 = "Adapt called without a Negotiate";
    v28 = (uint8_t *)&v30;
    goto LABEL_53;
  }
LABEL_51:

  return 0;
}

- (id)doNegotiateConfigurationChange:(id)a3 simulate:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v81 = *MEMORY[0x263EF8340];
  int v8 = (adm::utility *)a3;
  int v68 = 0;
  if (*((char *)&self->_hostDescription.mBundleID.__r_.__value_.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&value, self->_hostDescription.mBundleID.__r_.__value_.var0.var1.__data_, self->_hostDescription.mBundleID.__r_.__value_.var0.var1.__size_);
  }
  else {
    std::string value = (std::string)self->_hostDescription.mBundleID.__r_.__value_;
  }
  long long v9 = get_adm_log_object();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      p_std::string value = &value;
      if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        p_std::string value = (std::string *)value.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)&buf.mIsActivation = 136315138;
      *(void *)(&buf.mIsActivation + 4) = p_value;
      _os_log_impl(&dword_248947000, v9, OS_LOG_TYPE_DEFAULT, ">>> SIMULATE [%s]", (uint8_t *)&buf, 0xCu);
    }

    [(DSPProcessor *)self dumpDiagnosticsWithNSObject:v8 name:@"SimulateConfigChange"];
    if (v68 != -1) {
      ((void (*)(ConfigurationChangeRequest *, char *))off_26FCA3780[v68])(&buf, v65);
    }
    int v68 = -1;
    int v12 = 1;
    v65[0] = 1;
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    id v13 = get_adm_log_object();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)&buf.mIsActivation = 0;
      AudioObjectPropertyAddress v14 = "ADM::Simulate";
LABEL_21:
      _os_signpost_emit_with_name_impl(&dword_248947000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v14, (const char *)&unk_2489B4309, (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    if (v10)
    {
      BOOL v15 = &value;
      if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        BOOL v15 = (std::string *)value.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)&buf.mIsActivation = 136315138;
      *(void *)(&buf.mIsActivation + 4) = v15;
      _os_log_impl(&dword_248947000, v9, OS_LOG_TYPE_DEFAULT, ">>> NEGOTIATE [%s]", (uint8_t *)&buf, 0xCu);
    }

    [(DSPProcessor *)self dumpDiagnosticsWithNSObject:v8 name:@"NegotiateConfigChange"];
    if (v68 != -1) {
      ((void (*)(ConfigurationChangeRequest *, char *))off_26FCA3780[v68])(&buf, v65);
    }
    int v68 = -1;
    v65[0] = 1;
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    id v13 = get_adm_log_object();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)&buf.mIsActivation = 0;
      AudioObjectPropertyAddress v14 = "ADM::Negotiate";
      int v12 = 2;
      goto LABEL_21;
    }
    int v12 = 2;
  }

  int v68 = v12;
  buf.mIsActivation = 0;
  memset(&buf.mIOContextDescription.mSemantics.__tree_.__pair1_, 0, 17);
  buf.mIOContextDescription.mSemantics.__tree_.__begin_node_ = &buf.mIOContextDescription.mSemantics.__tree_.__pair1_;
  buf.mIOContextDescription.mRequestedInputFormat.__engaged_ = 0;
  buf.mIOContextDescription.mRequestedOutputFormat.var0.__null_state_ = 0;
  buf.mIOContextDescription.mRequestedOutputFormat.__engaged_ = 0;
  buf.mIOContextDescription.mRequestedOutputChannelLayout.var0.__null_state_ = 0;
  buf.mIOContextDescription.mRequestedOutputChannelLayout.__engaged_ = 0;
  buf.mIOContextDescription.mRequestedBufferFrameSize.var0.__null_state_ = 0;
  buf.mIOContextDescription.mRequestedBufferFrameSize.__engaged_ = 0;
  memset(&buf.mIOContextDescription.mStreamIDs, 0, 48);
  if (!adm::utility::convertFromDictionary(v8, (NSDictionary *)&buf, v16))
  {
    uint64_t v23 = get_adm_log_object();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v70 = 0;
      _os_log_error_impl(&dword_248947000, v23, OS_LOG_TYPE_ERROR, "Failed to convert the config change request dictionary", v70, 2u);
    }

    id v24 = [MEMORY[0x263F087E8] errorWithDomain:@"AudioDSPManagerErrorDomain" code:1969448551 userInfo:0];
    goto LABEL_42;
  }
  logConfigChangeRequestBasicInfo((const adm::ConfigurationChangeRequest *)&buf);
  {
    id v24 = [MEMORY[0x263F087E8] errorWithDomain:@"AudioDSPManagerErrorDomain" code:1969448551 userInfo:0];
LABEL_42:
    v25 = 0;
    *a5 = v24;
    goto LABEL_96;
  }
  adm::config_policy::getDeviceConfigurations((uint64_t)&v61, (adm::ConfigurationChangeRequest *)&buf, (uint64_t)&self->_activeDeviceConfigChanges);
  if (v63)
  {
    adm::config_policy::getIOContextConfiguration((uint64_t)&v56, (const adm::ConfigurationChangeRequest *)&buf);
    int v17 = v60;
    if (v60)
    {
      if (v6) {
        goto LABEL_78;
      }
      CFTypeRef v18 = (uint64_t *)*((void *)&v61 + 1);
      for (i = (uint64_t *)v61; i != v18; i += 9)
      {
        if (*((unsigned char *)i + 41))
        {
          v20 = get_adm_log_object();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = i;
            if (*((char *)i + 23) < 0) {
              v21 = (uint64_t *)*i;
            }
            if (!*((unsigned char *)i + 41)) {
              std::__throw_bad_optional_access[abi:ne180100]();
            }
            int v22 = *((unsigned __int8 *)i + 40);
            *(_DWORD *)v70 = 136315394;
            *(void *)&void v70[4] = v21;
            *(_WORD *)&v70[12] = 1024;
            *(_DWORD *)&v70[14] = v22;
            _os_log_debug_impl(&dword_248947000, v20, OS_LOG_TYPE_DEBUG, "- ref request for device %s => %d", v70, 0x12u);
          }
        }
      }
      if (buf.mIsActivation)
      {
        p_pendingDeviceConfigChanges = &self->_pendingDeviceConfigChanges;
        if (!self->_pendingDeviceConfigChanges.__engaged_)
        {
          p_pendingDeviceConfigChanges->var0.__val_.__begin_ = 0;
          self->_pendingDeviceConfigChanges.var0.__val_.__end_ = 0;
          self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_.__value_ = 0;
          long long v39 = v61;
          *(void *)v70 = &self->_pendingDeviceConfigChanges;
          v70[8] = 0;
          if (*((void *)&v61 + 1) != (void)v61)
          {
            std::vector<adm::DeviceConfiguration>::__vallocate[abi:ne180100](&self->_pendingDeviceConfigChanges.var0.__val_.__begin_, 0x8E38E38E38E38E39 * ((uint64_t)(*((void *)&v61 + 1) - v61) >> 3));
            self->_pendingDeviceConfigChanges.var0.__val_.__end_ = (DeviceConfiguration *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<adm::DeviceConfiguration>,adm::DeviceConfiguration*,adm::DeviceConfiguration*,adm::DeviceConfiguration*>((uint64_t)&self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_, (long long *)v39, *((long long **)&v39 + 1), (std::string *)self->_pendingDeviceConfigChanges.var0.__val_.__end_);
          }
          self->_pendingDeviceConfigChanges.__engaged_ = 1;
          goto LABEL_77;
        }
        if (p_pendingDeviceConfigChanges != (optional<std::vector<adm::DeviceConfiguration>> *)&v61)
        {
          char v55 = (long long *)*((void *)&v61 + 1);
          uint64_t v33 = v61;
          unint64_t v34 = 0x8E38E38E38E38E39 * ((uint64_t)(*((void *)&v61 + 1) - v61) >> 3);
          p_end_cap = &self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_;
          begin = self->_pendingDeviceConfigChanges.var0.__val_.__begin_;
          if (0x8E38E38E38E38E39 * ((self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_.__value_ - begin) >> 3) >= v34)
          {
            int v53 = v17;
            end = self->_pendingDeviceConfigChanges.var0.__val_.__end_;
            if (0x8E38E38E38E38E39 * ((end - begin) >> 3) >= v34)
            {
              if ((void)v61 != *((void *)&v61 + 1))
              {
                do
                {
                  std::string::operator=((std::string *)begin, (const std::string *)v33);
                  long long v45 = *(_OWORD *)(v33 + 24);
                  long long v46 = *(_OWORD *)(v33 + 40);
                  *(_OWORD *)((char *)begin + 53) = *(_OWORD *)(v33 + 53);
                  *(_OWORD *)((char *)begin + 40) = v46;
                  *(_OWORD *)((char *)begin + 24) = v45;
                  begin = (DeviceConfiguration *)((char *)begin + 72);
                  v33 += 72;
                }
                while ((long long *)v33 != v55);
                end = self->_pendingDeviceConfigChanges.var0.__val_.__end_;
              }
              while (end != begin)
              {
                if (*((char *)end - 49) < 0) {
                  operator delete(*((void **)end - 9));
                }
                end = (DeviceConfiguration *)((char *)end - 72);
              }
              self->_pendingDeviceConfigChanges.var0.__val_.__end_ = begin;
              int v17 = v53;
              goto LABEL_77;
            }
            v41 = (long long *)(v61 + 8 * ((end - begin) >> 3));
            if (end == begin)
            {
              int v17 = v53;
              char v42 = &self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_;
            }
            else
            {
              int v17 = v53;
              char v42 = &self->_pendingDeviceConfigChanges.var0.__val_.__end_cap_;
              do
              {
                std::string::operator=((std::string *)begin, (const std::string *)v33);
                long long v43 = *(_OWORD *)(v33 + 24);
                long long v44 = *(_OWORD *)(v33 + 40);
                *(_OWORD *)((char *)begin + 53) = *(_OWORD *)(v33 + 53);
                *(_OWORD *)((char *)begin + 40) = v44;
                *(_OWORD *)((char *)begin + 24) = v43;
                v33 += 72;
                begin = (DeviceConfiguration *)((char *)begin + 72);
              }
              while ((long long *)v33 != v41);
              begin = self->_pendingDeviceConfigChanges.var0.__val_.__end_;
            }
            v38 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<adm::DeviceConfiguration>,adm::DeviceConfiguration*,adm::DeviceConfiguration*,adm::DeviceConfiguration*>((uint64_t)v42, v41, v55, (std::string *)begin);
          }
          else
          {
            std::vector<adm::DeviceConfiguration>::__vdeallocate((uint64_t *)&self->_pendingDeviceConfigChanges.var0.__val_);
            if (v34 > 0x38E38E38E38E38ELL) {
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v36 = 0x1C71C71C71C71C72
                * ((p_end_cap->__value_ - p_pendingDeviceConfigChanges->var0.__val_.__begin_) >> 3);
            if (v36 <= v34) {
              unint64_t v36 = v34;
            }
            if (0x8E38E38E38E38E39
               * ((p_end_cap->__value_ - p_pendingDeviceConfigChanges->var0.__val_.__begin_) >> 3) >= 0x1C71C71C71C71C7)
              unint64_t v37 = 0x38E38E38E38E38ELL;
            else {
              unint64_t v37 = v36;
            }
            std::vector<adm::DeviceConfiguration>::__vallocate[abi:ne180100](&self->_pendingDeviceConfigChanges.var0.__val_.__begin_, v37);
            v38 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<adm::DeviceConfiguration>,adm::DeviceConfiguration*,adm::DeviceConfiguration*,adm::DeviceConfiguration*>((uint64_t)p_end_cap, (long long *)v33, v55, (std::string *)self->_pendingDeviceConfigChanges.var0.__val_.__end_);
          }
          self->_pendingDeviceConfigChanges.var0.__val_.__end_ = (DeviceConfiguration *)v38;
        }
      }
LABEL_77:
      std::optional<adm::ConfigurationChangeRequest>::operator=[abi:ne180100]<adm::ConfigurationChangeRequest,void>((uint64_t)&self->_pendingChangeRequest, (uint64_t)&buf);
LABEL_78:
      memset(v70, 0, sizeof(v70));
      std::vector<CA::StreamDescription>::__init_with_size[abi:ne180100]<CA::StreamDescription*,CA::StreamDescription*>(v70, v56, v57, 0xCCCCCCCCCCCCCCCDLL * ((v57 - (uint64_t)v56) >> 3));
      __p = 0;
      v72 = 0;
      uint64_t v73 = 0;
      std::vector<CA::StreamDescription>::__init_with_size[abi:ne180100]<CA::StreamDescription*,CA::StreamDescription*>(&__p, v58, v59, 0xCCCCCCCCCCCCCCCDLL * ((v59 - (uint64_t)v58) >> 3));
      long long v74 = v61;
      uint64_t v75 = v62;
      uint64_t v62 = 0;
      long long v61 = 0uLL;
      v25 = adm::utility::convertToDictionary((adm::utility *)v70, v47);
      v69 = (void **)&v74;
      std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100](&v69);
      if (__p)
      {
        v72 = __p;
        operator delete(__p);
      }
      if (*(void *)v70)
      {
        *(void *)&v70[8] = *(void *)v70;
        operator delete(*(void **)v70);
      }
      if (v6)
      {
        [(DSPProcessor *)self dumpDiagnosticsWithNSObject:v25 name:@"SimulateResponse"];
        char v48 = get_adm_log_object();
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_92;
        }
        char v49 = &value;
        if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          char v49 = (std::string *)value.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)v70 = 136315138;
        *(void *)&void v70[4] = v49;
        char v50 = "<<< SIMULATE [%s]";
      }
      else
      {
        [(DSPProcessor *)self dumpDiagnosticsWithNSObject:v25 name:@"NegotiateResponse"];
        char v48 = get_adm_log_object();
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_92;
        }
        v51 = &value;
        if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          v51 = (std::string *)value.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)v70 = 136315138;
        *(void *)&void v70[4] = v51;
        char v50 = "<<< NEGOTIATE [%s]";
      }
      _os_log_impl(&dword_248947000, v48, OS_LOG_TYPE_DEFAULT, v50, v70, 0xCu);
LABEL_92:

      if (v17) {
        caulk::__expected_detail::destroy<adm::IOContextConfiguration,(void *)0>((uint64_t)&v56);
      }
      goto LABEL_94;
    }
    v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = (int)v56;
    uint64_t v76 = *MEMORY[0x263F08320];
    v77 = @"ADM failed to determine IOContext configuration";
    v31 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    *a5 = [v29 errorWithDomain:@"AudioDSPManagerErrorDomain" code:v30 userInfo:v31];
  }
  else
  {
    int v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = (int)v61;
    uint64_t v78 = *MEMORY[0x263F08320];
    uint64_t v79 = @"ADM failed to determine device configuration";
    v28 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    *a5 = [v26 errorWithDomain:@"AudioDSPManagerErrorDomain" code:v27 userInfo:v28];
  }
  v25 = 0;
LABEL_94:
  if (v63)
  {
    *(void *)v70 = &v61;
    std::vector<adm::DeviceConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)v70);
  }
LABEL_96:
  *(void *)v70 = &buf.mDeviceDescriptions;
  std::vector<adm::DeviceDescription>::__destroy_vector::operator()[abi:ne180100]((void ***)v70);
  *(void *)v70 = &buf.mIOContextDescription.mStreamIDs;
  std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100]((void ***)v70);
  if (buf.mIOContextDescription.mRequestedOutputChannelLayout.__engaged_
    && buf.mIOContextDescription.mRequestedOutputChannelLayout.var0.__val_.mStorage.__begin_)
  {
    buf.mIOContextDescription.mRequestedOutputChannelLayout.var0.__val_.mStorage.__end_ = buf.mIOContextDescription.mRequestedOutputChannelLayout.var0.__val_.mStorage.__begin_;
    operator delete(buf.mIOContextDescription.mRequestedOutputChannelLayout.var0.__val_.mStorage.__begin_);
  }
  std::__tree<std::string>::destroy((char *)buf.mIOContextDescription.mSemantics.__tree_.__pair1_.__value_.__left_);
  if (SHIBYTE(value.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(value.__r_.__value_.__l.__data_);
  }
  std::__variant_detail::__dtor<std::__variant_detail::__traits<std::monostate,adm::ScopedSignpostSimulate,adm::ScopedSignpostNegotiate>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v65);

  return v25;
}

- (id)negotiateConfigurationChange:(id)a3 error:(id *)a4
{
  int v4 = [(DSPProcessor *)self doNegotiateConfigurationChange:a3 simulate:0 error:a4];
  return v4;
}

- (id)simulateConfigurationChange:(id)a3 error:(id *)a4
{
  int v4 = [(DSPProcessor *)self doNegotiateConfigurationChange:a3 simulate:1 error:a4];
  return v4;
}

- (void)dealloc
{
  [(DSPProcessor *)self unregisterExternalNotification];
  uint64_t v3 = get_adm_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)ConfigurationChangeRequest buf = 0;
    _os_log_impl(&dword_248947000, v3, OS_LOG_TYPE_DEFAULT, "DSPProcessor destroyed", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)DSPProcessor;
  [(DSPProcessor *)&v4 dealloc];
}

- (DSPProcessor)initWithHostDescription:(id)a3 hostCallback:(id)a4 systemConfiguration:(SystemConfiguration *)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DSPProcessor;
  id v11 = [(DSPProcessor *)&v17 init];
  int v12 = v11;
  id v13 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_hostCallback, a4);
    v13->_systemConfiguration.mContext.mOS = a5->mContext.mOS;
    std::string::operator=((std::string *)&v13->_systemConfiguration.mContext.mResourcePath, (const std::string *)&a5->mContext.mResourcePath);
    std::string::operator=((std::string *)&v12->_systemConfiguration.mContext.mResourcePath.__pn_.__r_.var0, (const std::string *)&a5->mContext.mResourcePath.__pn_.__r_.var0);
    int v14 = *(_DWORD *)a5[1].mContext.mResourcePath.__pn_.__r_.__value_.var0.var0.__data_;
    v13->_anon_70[12] = a5[1].mContext.mResourcePath.__pn_.__r_.__value_.var0.var0.__data_[4];
    *(_DWORD *)&v13->_anon_70[8] = v14;
    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::string,false> const&>((std::string *)&v12->_anon_70[16], (const std::string *)&a5[1].mContext.mResourcePath.__pn_.__r_.__value_.var0.var1.__size_);
    std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<std::string,false> const&>((std::string *)&v12->_anon_70[48], (const std::string *)&a5[2]);
    int var0 = a5[2].mContext.mResourcePath.__pn_.__r_.var0;
    v13->_anon_70[84] = a5[2].mContext.mResourcePath.__pn_.__r_.var1;
    *(_DWORD *)&v13->_anon_70[80] = var0;
    std::string::operator=((std::string *)&v12->_anon_70[88], (const std::string *)&a5[2].mContext.mResourcePath.__pn_.var0);
    std::string::operator=((std::string *)&v12->_anon_70[112], (const std::string *)&a5[3].mContext.mResourcePath.__pn_.__r_.__value_.var0.var1.__size_);
    if (&v13->_systemConfiguration != a5)
    {
      *(_DWORD *)&v13->_anon_70[168] = *((_DWORD *)&a5[4].mContext.mResourcePath.__pn_.__r_.__value_.var0.var1 + 4);
      std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,adm::DSPGraphBasicConfiguration>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,adm::DSPGraphBasicConfiguration>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,adm::DSPGraphBasicConfiguration>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,adm::DSPGraphBasicConfiguration>>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,adm::DSPGraphBasicConfiguration>>,void *> *>>(&v12->_anon_70[136], (uint64_t *)a5[4].mContext.mResourcePath.__pn_.__r_.__value_.var0.var1.__data_);
    }
    operator new();
  }
  MEMORY[0x338] = 0;
  [0 dumpDiagnosticsWithNSObject:v9 name:@"HostDescription"];

  return 0;
}

- (void)initWithHostDescription:hostCallback:systemConfiguration:
{
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x24C5866C0);
}

- (uint64_t)initWithHostDescription:hostCallback:systemConfiguration:
{
  return a1;
}

- (id)initWithHostDescription:hostCallback:systemConfiguration:
{
  v1 = (id *)(a1 + 8);
  id v2 = (id *)operator new(0x10uLL);
  *id v2 = &unk_26FCA37C0;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end