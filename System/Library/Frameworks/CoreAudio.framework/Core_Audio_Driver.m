@interface Core_Audio_Driver
- (AudioServerPlugInDriverInterface)asp_interface;
- (AudioServerPlugInHostInterface)host_interface;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Core_Audio_Driver)init;
- (Core_Audio_Driver_Host_Proxy)driver_host_proxy;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)concurrent_queue;
- (function<void)m_invalidation_handler;
- (id).cxx_construct;
- (id)init_driver_interface:(AudioServerPlugInDriverInterface *)a3 invalidation_handler:(function<void)(;
- (id)process_boost_reply;
- (int)create_and_start_io_receiver:(unsigned int)a3 client_id:(unsigned int)a4 nominal_sample_rate:(double)a5 io_buffer_frame_size:(unsigned int)a6 work_group_port:(id)a7 io_messenger:(id)a8;
- (int)destroy_io_receiver:(unsigned int)a3;
- (int)destroy_io_receiver:(unsigned int)a3 client_id:(unsigned int)a4;
- (int)handle_register_buffer:(dict)a3;
- (int)handle_unregister_buffer:(dict)a3;
- (shared_ptr<Property_Type_Info>)m_property_type_info;
- (shared_ptr<caulk::mach::unfair_lock>)config_change_info_lock;
- (shared_ptr<caulk::mach::unfair_lock>)io_receiver_lock;
- (shared_ptr<std::map<unsigned)config_change_info_map;
- (shared_ptr<std::unordered_map<AMCP::Portal::IPC::io_messenger_id_t,)io_receivers;
- (shared_ptr<std::vector<std::pair<AMCP::Portal::IPC::shared_buffer_info_t,)io_buffer_list;
- (void)abort_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5 reply:(id)a6;
- (void)add_device_client:(unsigned int)a3 client_id:(unsigned int)a4 process_id:(int)a5 is_native_endianess:(BOOL)a6 bundle_id:(id)a7 reply:(id)a8;
- (void)create_device:(id)a3 client_id:(unsigned int)a4 process_id:(int)a5 is_native_endianess:(BOOL)a6 bundle_id:(id)a7 reply:(id)a8;
- (void)dealloc;
- (void)destroy_device:(unsigned int)a3 reply:(id)a4;
- (void)get_property_data:(Driver_Property_Identity *)a3 qualifier:(id)a4 data_size:(unsigned int)a5 reply:(id)a6;
- (void)get_property_data_size:(Driver_Property_Identity *)a3 qualifier:(id)a4 reply:(id)a5;
- (void)has_property:(Driver_Property_Identity *)a3 reply:(id)a4;
- (void)initialize:(id)a3 reply:(id)a4;
- (void)is_property_settable:(Driver_Property_Identity *)a3 reply:(id)a4;
- (void)object_was_destroyed:(unsigned int)a3 reply:(id)a4;
- (void)perform_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5 reply:(id)a6;
- (void)register_io_buffer:(id)a3 reply:(id)a4;
- (void)release_unpacked_cf_objects:(unsigned int)a3 qualifier_data:(id)a4 data_type:(unsigned int)a5 data:(id)a6;
- (void)remove_device_client:(unsigned int)a3 client_id:(unsigned int)a4 process_id:(int)a5 is_native_endianess:(BOOL)a6 bundle_id:(id)a7 reply:(id)a8;
- (void)setAsp_interface:(AudioServerPlugInDriverInterface *)a3;
- (void)setConcurrent_queue:(id)a3;
- (void)setConfig_change_info_map:(shared_ptr<std:(void *>>)a3 :map<unsigned long)long;
- (void)setDriver_host_proxy:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setHost_interface:(AudioServerPlugInHostInterface *)a3;
- (void)setIo_buffer_list:()shared_ptr<std:(applesauce::xpc::dict>>>)a3 :vector<std::pair<AMCP::Portal::IPC::shared_buffer_info_t;
- (void)setIo_receiver_lock:(shared_ptr<caulk::mach::unfair_lock>)a3;
- (void)setIo_receivers:()shared_ptr<std:(std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>>)a3 :unordered_map<AMCP::Portal::IPC::io_messenger_id_t;
- (void)setListener:(id)a3;
- (void)setM_invalidation_handler:(function<void)(;
- (void)setM_property_type_info:(shared_ptr<Property_Type_Info>)a3;
- (void)setProcess_boost_reply:(id)a3;
- (void)set_property_data:(Driver_Property_Identity *)a3 qualifier:(id)a4 data:(id)a5 reply:(id)a6;
- (void)start_io:(unsigned int)a3 client_id:(unsigned int)a4 reply:(id)a5;
- (void)start_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4 nominal_sample_rate:(double)a5 io_buffer_frame_size:(unsigned int)a6 work_group_port:(id)a7 io_messenger:(id)a8 reply:(id)a9;
- (void)stop_io:(unsigned int)a3 client_id:(unsigned int)a4 reply:(id)a5;
- (void)stop_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4 reply:(id)a5;
- (void)store_change_info:(void *)a3 for_token:(unint64_t)a4;
- (void)unregister_io_buffer:(id)a3 reply:(id)a4;
@end

@implementation Core_Audio_Driver

- (id).cxx_construct
{
  *((void *)self + 23) = 0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  return self;
}

- (void).cxx_destruct
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](self->_m_invalidation_handler.__f_.__buf_.__lx);
  cntrl = self->_io_buffer_list.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_io_receivers.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
  v5 = self->_io_receiver_lock.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5);
  }
  v6 = self->_m_custom_property_type_cache.__cntrl_;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
  v7 = self->_config_change_info_map.__cntrl_;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v7);
  }
  v8 = self->_config_change_info_lock.__cntrl_;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
  }
  objc_storeStrong(&self->_process_boost_reply, 0);
  objc_storeStrong((id *)&self->_concurrent_queue, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_driver_host_proxy, 0);
}

- (void)setIo_buffer_list:()shared_ptr<std:(applesauce::xpc::dict>>>)a3 :vector<std::pair<AMCP::Portal::IPC::shared_buffer_info_t
{
  v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_io_buffer_list.__cntrl_;
  self->_io_buffer_list.__ptr_ = v4;
  self->_io_buffer_list.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<std::vector<std::pair<AMCP::Portal::IPC::shared_buffer_info_t,)io_buffer_list
{
  cntrl = self->_io_buffer_list.__cntrl_;
  *v2 = self->_io_buffer_list.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setIo_receivers:()shared_ptr<std:(std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>>)a3 :unordered_map<AMCP::Portal::IPC::io_messenger_id_t
{
  v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_io_receivers.__cntrl_;
  self->_io_receivers.__ptr_ = v4;
  self->_io_receivers.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<std::unordered_map<AMCP::Portal::IPC::io_messenger_id_t,)io_receivers
{
  cntrl = self->_io_receivers.__cntrl_;
  *v2 = self->_io_receivers.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (void)setProcess_boost_reply:(id)a3
{
}

- (id)process_boost_reply
{
  return self->_process_boost_reply;
}

- (void)setM_invalidation_handler:(function<void)(
{
  std::function<void ()(void)>::operator=(self->_m_invalidation_handler.__f_.__buf_.__lx, (uint64_t)a3);
}

- (function<void)m_invalidation_handler
{
  return (function<void ()> *)std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_m_invalidation_handler);
}

- (void)setIo_receiver_lock:(shared_ptr<caulk::mach::unfair_lock>)a3
{
  v4 = *(unfair_lock **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_io_receiver_lock.__cntrl_;
  self->_io_receiver_lock.__ptr_ = v4;
  self->_io_receiver_lock.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<caulk::mach::unfair_lock>)io_receiver_lock
{
  cntrl = self->_io_receiver_lock.__cntrl_;
  *v2 = self->_io_receiver_lock.__ptr_;
  v2[1] = (unfair_lock *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (unfair_lock *)self;
  return result;
}

- (void)setM_property_type_info:(shared_ptr<Property_Type_Info>)a3
{
  v4 = *(Property_Type_Info **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_m_custom_property_type_cache.__cntrl_;
  self->_m_custom_property_type_cache.__ptr_ = v4;
  self->_m_custom_property_type_cache.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<Property_Type_Info>)m_property_type_info
{
  cntrl = self->_m_custom_property_type_cache.__cntrl_;
  *v2 = self->_m_custom_property_type_cache.__ptr_;
  v2[1] = (Property_Type_Info *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Property_Type_Info *)self;
  return result;
}

- (void)setConcurrent_queue:(id)a3
{
}

- (OS_dispatch_queue)concurrent_queue
{
  return self->_concurrent_queue;
}

- (void)setConfig_change_info_map:(shared_ptr<std:(void *>>)a3 :map<unsigned long)long
{
  v4 = *(void **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_config_change_info_map.__cntrl_;
  self->_config_change_info_map.__ptr_ = v4;
  self->_config_change_info_map.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<std::map<unsigned)config_change_info_map
{
  cntrl = self->_config_change_info_map.__cntrl_;
  *v2 = self->_config_change_info_map.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (shared_ptr<caulk::mach::unfair_lock>)config_change_info_lock
{
  cntrl = self->_config_change_info_lock.__cntrl_;
  *v2 = self->_config_change_info_lock.__ptr_;
  v2[1] = (unfair_lock *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (unfair_lock *)self;
  return result;
}

- (void)setHost_interface:(AudioServerPlugInHostInterface *)a3
{
  self->_host_interface = a3;
}

- (AudioServerPlugInHostInterface)host_interface
{
  return self->_host_interface;
}

- (void)setAsp_interface:(AudioServerPlugInDriverInterface *)a3
{
  self->_asp_interface = a3;
}

- (AudioServerPlugInDriverInterface)asp_interface
{
  return self->_asp_interface;
}

- (void)setEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setListener:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setDriver_host_proxy:(id)a3
{
}

- (Core_Audio_Driver_Host_Proxy)driver_host_proxy
{
  return self->_driver_host_proxy;
}

- (void)set_property_data:(Driver_Property_Identity *)a3 qualifier:(id)a4 data:(id)a5 reply:(id)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v37 = a4;
  id v38 = a5;
  v36 = (void (**)(id, uint64_t))a6;
  v34 = self;
  v10 = [(Core_Audio_Driver *)self asp_interface];
  [(Core_Audio_Driver *)self m_property_type_info];
  p_var2 = &a3->var2;
  uint64_t property_data_and_qualifier_type_code = Property_Type_Info::get_property_data_and_qualifier_type_code(buf, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
  if (*(void *)v56) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v56);
  }
  unpack_data_from_qualifier((uint64_t)&buf, HIDWORD(property_data_and_qualifier_type_code), v37);
  v39 = buf;
  uint64_t v13 = *(unsigned int *)v56;
  unsigned int v33 = *(_DWORD *)&v56[4];
  id v14 = v38;
  if (!v14)
  {
    AMCP::Log::Scope_Registry::get(0);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&buf, "com.apple.coreaudio", "AMCP");
    v27 = *(NSObject **)buf;
    AMCP::Log::Scope::get_os_log_t(*(id *)buf);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v56) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v56);
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = pthread_self();
      mach_port_t v29 = pthread_mach_thread_np(v28);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v29;
      *(_WORD *)v56 = 2080;
      *(void *)&v56[2] = "Core_Audio_Driver.mm";
      __int16 v57 = 1024;
      int v58 = 682;
      __int16 v59 = 2080;
      *(void *)v60 = "value == nil";
      _os_log_error_impl(&dword_1BAA78000, v27, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s Value is nil, cannot unpack data", (uint8_t *)&buf, 0x22u);
    }

    AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v42);
    __cxa_allocate_exception(0x40uLL);
    std::runtime_error::runtime_error(&v48, "Value is nil, cannot unpack data");
    std::runtime_error::runtime_error(&v49, &v48);
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    int v54 = -1;
    v49.__vftable = (std::runtime_error_vtbl *)&unk_1F148A9A8;
    v50 = &unk_1F148A9D0;
    boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)&buf, (uint64_t)&v49);
    *(void *)&v60[6] = "std::tuple<NSData *, UInt32, AMCP::HAL::HAL_Property_Type_Code> unpack_data_from_value(AMCP::HA"
                         "L::HAL_Property_Type_Code, NSData *__strong)";
    v61 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver.mm";
    int v62 = 682;
    applesauce::backtrace::snapshot_N<64>::snapshot_N((char **)&v43);
    long long v46 = v43;
    uint64_t v47 = v44;
    long long v43 = 0uLL;
    uint64_t v44 = 0;
    v45 = &unk_1F148AA90;
    boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>();
  }
  if (property_data_and_qualifier_type_code >= 0x13)
  {
    unsigned int v42 = 0;
    unsigned int v18 = 4;
  }
  else
  {
    uint64_t v15 = property_data_and_qualifier_type_code;
    uint64_t v16 = qword_1BB0322A8[v15];
    uint64_t v17 = qword_1BB032340[v15];
    unsigned int v18 = v17 | v16;
    if (((v17 | v16) & 0xFF00000000) == 0) {
      unsigned int v18 = [v14 length];
    }
  }
  unsigned int v42 = v18;
  id v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA50]), "initWithLength:", objc_msgSend(v14, "length"));
  v19 = (AMCP::Log::Scope_Registry *)AMCP::HAL::unpack_property_data(v14, property_data_and_qualifier_type_code, &v42, (void *)[v35 mutableBytes]);
  if (v19)
  {
    AMCP::Log::Scope_Registry::get(v19);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&buf, "com.apple.coreaudio", "AMCP");
    v30 = *(NSObject **)buf;
    AMCP::Log::Scope::get_os_log_t(*(id *)buf);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v56) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v56);
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = pthread_self();
      mach_port_t v32 = pthread_mach_thread_np(v31);
      LODWORD(buf) = 67109890;
      HIDWORD(buf) = v32;
      *(_WORD *)v56 = 2080;
      *(void *)&v56[2] = "Core_Audio_Driver.mm";
      __int16 v57 = 1024;
      int v58 = 687;
      __int16 v59 = 2080;
      *(void *)v60 = "data_error != kAudioHardwareNoError";
      _os_log_error_impl(&dword_1BAA78000, v30, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s Failed to unpack value", (uint8_t *)&buf, 0x22u);
    }

    AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v41);
    __cxa_allocate_exception(0x40uLL);
    std::runtime_error::runtime_error(&v48, "Failed to unpack value");
    std::runtime_error::runtime_error(&v49, &v48);
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    int v54 = -1;
    v49.__vftable = (std::runtime_error_vtbl *)&unk_1F148A9A8;
    v50 = &unk_1F148A9D0;
    boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)&buf, (uint64_t)&v49);
    *(void *)&v60[6] = "std::tuple<NSData *, UInt32, AMCP::HAL::HAL_Property_Type_Code> unpack_data_from_value(AMCP::HA"
                         "L::HAL_Property_Type_Code, NSData *__strong)";
    v61 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver.mm";
    int v62 = 687;
    applesauce::backtrace::snapshot_N<64>::snapshot_N((char **)&v43);
    long long v46 = v43;
    uint64_t v47 = v44;
    long long v43 = 0uLL;
    uint64_t v44 = 0;
    v45 = &unk_1F148AA90;
    boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>();
  }
  uint64_t v20 = v42;

  SetPropertyData = (*v10)->SetPropertyData;
  uint64_t var0 = a3->var0;
  uint64_t var1 = a3->var1;
  v40 = v39;
  uint64_t v24 = [(Property_Type_Info *)v40 bytes];
  id v25 = v35;
  uint64_t v26 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t, AudioObjectPropertyAddress *, uint64_t, uint64_t, uint64_t, uint64_t))SetPropertyData)(v10, var0, var1, p_var2, v13, v24, v20, [v25 bytes]);
  v36[2](v36, v26);
  [(Core_Audio_Driver *)v34 release_unpacked_cf_objects:v33 qualifier_data:v40 data_type:property_data_and_qualifier_type_code data:v25];
}

- (void)get_property_data:(Driver_Property_Identity *)a3 qualifier:(id)a4 data_size:(unsigned int)a5 reply:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v37 = a4;
  id v38 = (void (**)(id, uint64_t, void *))a6;
  unsigned int v33 = self;
  v36 = [(Core_Audio_Driver *)self asp_interface];
  [(Core_Audio_Driver *)self m_property_type_info];
  p_var2 = &a3->var2;
  unsigned int property_qualifier_type_code = Property_Type_Info::get_property_qualifier_type_code(v40, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
  if (v41) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v41);
  }
  unpack_data_from_qualifier((uint64_t)&v40, property_qualifier_type_code, v37);
  mach_port_t v32 = v40;
  uint64_t v11 = v41;
  unsigned int v31 = HIDWORD(v41);
  [(Core_Audio_Driver *)self m_property_type_info];
  v12 = v40;
  unsigned int var0 = a3->var0;
  mSelector = (AMCP::HAL *)a3->var2.mSelector;
  uint64_t v15 = (std::mutex *)((char *)v40 + 24);
  std::mutex::lock((std::mutex *)((char *)v40 + 24));
  uint64_t v16 = *(void *)v12;
  uint64_t v17 = *((void *)v12 + 1);
  if (*(void *)v12 != v17)
  {
    while (*(_DWORD *)v16 != var0)
    {
      v16 += 48;
      if (v16 == v17) {
        goto LABEL_13;
      }
    }
  }
  if (v16 == v17
    || (unsigned int v18 = std::__hash_table<std::__hash_value_type<unsigned int,std::optional<unsigned int>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::optional<unsigned int>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::optional<unsigned int>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::optional<unsigned int>>>>::find<unsigned int>((void *)(v16 + 8), mSelector)) == 0)
  {
LABEL_13:
    unsigned int hal_property_value_type_code = AMCP::HAL::get_hal_property_value_type_code(mSelector);
  }
  else
  {
    int v19 = *((_DWORD *)v18 + 5);
    switch(v19)
    {
      case 1918990199:
        unsigned int hal_property_value_type_code = 1;
        break;
      case 1886155636:
        unsigned int hal_property_value_type_code = 15;
        break;
      case 1667658612:
        unsigned int hal_property_value_type_code = 6;
        break;
      default:
        unsigned int hal_property_value_type_code = 0;
        break;
    }
  }
  std::mutex::unlock(v15);
  if (v41) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v41);
  }
  unsigned int v35 = hal_property_value_type_code;
  if (hal_property_value_type_code > 0x12) {
    uint64_t v21 = 0x100000004;
  }
  else {
    uint64_t v21 = qword_1BB032340[hal_property_value_type_code] | qword_1BB0322A8[hal_property_value_type_code];
  }
  if ((v21 & 0xFF00000000) == 0) {
    LODWORD(v21) = a5;
  }
  unsigned int v39 = v21;
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA50]) initWithLength:v21];
  GetPropertyData = (*v36)->GetPropertyData;
  uint64_t v24 = a3->var0;
  uint64_t var1 = a3->var1;
  uint64_t v26 = v32;
  uint64_t v27 = [(Property_Type_Info *)v26 bytes];
  id v28 = v22;
  uint64_t v29 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t, AudioObjectPropertyAddress *, uint64_t, uint64_t, void, unsigned int *, uint64_t))GetPropertyData)(v36, v24, var1, p_var2, v11, v27, v39, &v39, [v28 mutableBytes]);
  if (v29)
  {
    v30 = 0;
  }
  else
  {
    if (p_var2->mSelector == 1668641652)
    {
      [(Core_Audio_Driver *)v33 m_property_type_info];
      Property_Type_Info::add_custom_properties(v40, a3->var0, v39 / 0xCuLL, (const AudioServerPlugInCustomPropertyInfo *)[v28 bytes]);
      if (v41) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v41);
      }
    }
    v30 = AMCP::HAL::pack_property_data(v35, v39, (CFStringRef *)[v28 bytes]);
  }
  v38[2](v38, v29, v30);
  [(Core_Audio_Driver *)v33 release_unpacked_cf_objects:v31 qualifier_data:v26 data_type:v35 data:v28];
}

- (void)get_property_data_size:(Driver_Property_Identity *)a3 qualifier:(id)a4 reply:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v19 = a4;
  v8 = (void (**)(id, uint64_t, void))a5;
  unsigned int v20 = 0;
  v9 = [(Core_Audio_Driver *)self asp_interface];
  [(Core_Audio_Driver *)self m_property_type_info];
  p_var2 = &a3->var2;
  unsigned int property_qualifier_type_code = Property_Type_Info::get_property_qualifier_type_code((Property_Type_Info *)v21, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  unpack_data_from_qualifier((uint64_t)&v21, property_qualifier_type_code, v19);
  uint64_t v13 = v22;
  uint64_t v12 = HIDWORD(v22);
  GetPropertyDataSize = (*v9)->GetPropertyDataSize;
  uint64_t var0 = a3->var0;
  uint64_t var1 = a3->var1;
  id v17 = v21;
  uint64_t v18 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t, AudioObjectPropertyAddress *, uint64_t, uint64_t, unsigned int *))GetPropertyDataSize)(v9, var0, var1, p_var2, v13, [v17 bytes], &v20);
  v8[2](v8, v18, v20);
  [(Core_Audio_Driver *)self release_unpacked_cf_objects:v12 qualifier_data:v17 data_type:0 data:0];
}

- (void)is_property_settable:(Driver_Property_Identity *)a3 reply:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, uint64_t, void))a4;
  v9[0] = 0;
  v7 = [(Core_Audio_Driver *)self asp_interface];
  uint64_t v8 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, void, void, AudioObjectPropertyAddress *, unsigned char *))(*v7)->IsPropertySettable)(v7, a3->var0, a3->var1, &a3->var2, v9);
  v6[2](v6, v8, v9[0]);
}

- (void)release_unpacked_cf_objects:(unsigned int)a3 qualifier_data:(id)a4 data_type:(unsigned int)a5 data:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v17 = v9;
  if (v17)
  {
    id v11 = v17;
    if ([v11 bytes])
    {
      if (a3 <= 0x10 && ((1 << a3) & 0x18040) != 0)
      {
        uint64_t v12 = *(const void **)[v11 bytes];
        if (v12) {
          CFRelease(v12);
        }
      }
    }
  }

  id v13 = v10;
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
    if ([v15 bytes])
    {
      if (a5 <= 0x10 && ((1 << a5) & 0x18040) != 0)
      {
        uint64_t v16 = *(const void **)[v15 bytes];
        if (v16) {
          CFRelease(v16);
        }
      }
    }
  }
}

- (void)has_property:(Driver_Property_Identity *)a3 reply:(id)a4
{
  v6 = (void (**)(id, uint64_t))a4;
  v7 = [(Core_Audio_Driver *)self asp_interface];
  uint64_t v8 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, void, void, AudioObjectPropertyAddress *))(*v7)->HasProperty)(v7, a3->var0, a3->var1, &a3->var2);
  v6[2](v6, v8);
}

- (void)stop_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, void))a5;
  [(Core_Audio_Driver *)self io_receiver_lock];
  os_unfair_lock_lock(lock);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  [(Core_Audio_Driver *)self io_receivers];
  id v9 = std::__hash_table<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Sender>>,std::__unordered_map_hasher<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Sender>>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::__unordered_map_equal<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Sender>>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::allocator<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Sender>>>>::find<AMCP::Portal::IPC::io_messenger_id_t>(lock, a3, a4);
  if (!v9) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v10 = v9;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  caulk::ipc::synchronous_messenger::semaphore_receiver::stop(*(caulk::ipc::synchronous_messenger::semaphore_receiver **)(v10[3] + 32), 5.0);
  [(Core_Audio_Driver *)self io_receivers];
  std::__hash_table<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::__unordered_map_hasher<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::__unordered_map_equal<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::allocator<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>>>::__erase_unique<AMCP::Portal::IPC::io_messenger_id_t>(lock, a3, a4);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  os_unfair_lock_unlock(lock);
  v8[2](v8, 0);
}

- (void)start_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4 nominal_sample_rate:(double)a5 io_buffer_frame_size:(unsigned int)a6 work_group_port:(id)a7 io_messenger:(id)a8 reply:(id)a9
{
  uint64_t v11 = *(void *)&a6;
  uint64_t v13 = *(void *)&a4;
  uint64_t v14 = *(void *)&a3;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = (void (**)(id, void))a9;
  v18[2](v18, [(Core_Audio_Driver *)self create_and_start_io_receiver:v14 client_id:v13 nominal_sample_rate:v11 io_buffer_frame_size:v16 work_group_port:v17 io_messenger:a5]);
}

- (void)stop_io:(unsigned int)a3 client_id:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v12 = (void (**)(id, uint64_t))a5;
  uint64_t v8 = [(Core_Audio_Driver *)self asp_interface];
  uint64_t v9 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t))(*v8)->StopIO)(v8, v6, v5);
  v12[2](v12, v9);
  id v10 = [(Core_Audio_Driver *)self process_boost_reply];

  if (v10)
  {
    uint64_t v11 = [(Core_Audio_Driver *)self process_boost_reply];
    v11[2]();

    [(Core_Audio_Driver *)self setProcess_boost_reply:0];
  }
}

- (void)start_io:(unsigned int)a3 client_id:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v8 = (void (**)(id, uint64_t))a5;
  uint64_t v9 = [(Core_Audio_Driver *)self asp_interface];
  uint64_t v10 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t))(*v9)->StartIO)(v9, v6, v5);
  v8[2](v8, v10);
}

- (void)unregister_io_buffer:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = [v6 object];
  xpc_object_t v9 = v8;
  if (!v8) {
    xpc_object_t v9 = xpc_null_create();
  }

  id v10 = v9;
  uint64_t v11 = v10;
  if (!v10 || (uint64_t v12 = (const applesauce::xpc::object *)v10, MEMORY[0x1C185AAD0](v10) != MEMORY[0x1E4F14590]))
  {
    uint64_t v12 = (const applesauce::xpc::object *)xpc_null_create();
  }
  applesauce::xpc::object::object((applesauce::xpc::object *)&v15, v12);
  uint64_t v13 = [(Core_Audio_Driver *)self handle_unregister_buffer:&v15];
  id v14 = v15;
  id v15 = 0;

  v7[2](v7, v13);
}

- (void)register_io_buffer:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = [v6 object];
  xpc_object_t v9 = v8;
  if (!v8) {
    xpc_object_t v9 = xpc_null_create();
  }

  id v10 = v9;
  uint64_t v11 = v10;
  if (!v10 || (uint64_t v12 = (const applesauce::xpc::object *)v10, MEMORY[0x1C185AAD0](v10) != MEMORY[0x1E4F14590]))
  {
    uint64_t v12 = (const applesauce::xpc::object *)xpc_null_create();
  }
  applesauce::xpc::object::object((applesauce::xpc::object *)&v15, v12);
  uint64_t v13 = [(Core_Audio_Driver *)self handle_register_buffer:&v15];
  id v14 = v15;
  id v15 = 0;

  v7[2](v7, v13);
}

- (int)handle_unregister_buffer:(dict)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  unint64_t buffer_key = get_buffer_key((const dict *)a3.var0.fObj);
  unint64_t v7 = v6;
  [(Core_Audio_Driver *)self io_receiver_lock];
  id v8 = *(os_unfair_lock_s **)buf;
  os_unfair_lock_lock(*(os_unfair_lock_t *)buf);
  if (*(void *)v77) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v77);
  }
  [(Core_Audio_Driver *)self io_buffer_list];
  xpc_object_t v9 = **(void (__cdecl ***)(std::runtime_error *__hidden))buf;
  [(Core_Audio_Driver *)self io_buffer_list];
  id v10 = v62.~runtime_error_0;
  if (v9 != v10)
  {
    while (*(_OWORD *)v9 != __PAIR128__(v7, buffer_key))
    {
      xpc_object_t v9 = (void (__cdecl *)(std::runtime_error *__hidden))((char *)v9 + 24);
      if (v9 == v10)
      {
        xpc_object_t v9 = v62.~runtime_error_0;
        break;
      }
    }
  }
  if (v62.__imp_.__imp_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v62.__imp_.__imp_);
  }
  if (*(void *)v77) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v77);
  }
  [(Core_Audio_Driver *)self io_buffer_list];
  uint64_t v11 = *(AMCP::Log::Scope_Registry **)v77;
  uint64_t v12 = *(void (__cdecl **)(std::runtime_error *__hidden))(*(void *)buf + 8);
  if (*(void *)v77) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v77);
  }
  if (v9 == v12)
  {
    AMCP::Log::Scope_Registry::get(v11);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    uint64_t v23 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v77) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v77);
    }
    int v38 = 560947818;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      unsigned int v39 = pthread_self();
      mach_port_t v40 = pthread_mach_thread_np(v39);
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)&buf[4] = v40;
      *(_WORD *)v77 = 2080;
      *(void *)&v77[2] = "Core_Audio_Driver.mm";
      __int16 v78 = 1024;
      int v79 = 551;
      __int16 v80 = 1024;
      *(_DWORD *)v81 = buffer_key;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = HIDWORD(buffer_key);
      *(_WORD *)&v81[10] = 1024;
      *(_DWORD *)&v81[12] = v7;
      _os_log_error_impl(&dword_1BAA78000, v23, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Could not find buffer key in map! device id: %u, client id: %u, stream id: %u", buf, 0x2Au);
    }
    goto LABEL_67;
  }
  [(Core_Audio_Driver *)self io_buffer_list];
  os_unfair_lock_t v13 = *(os_unfair_lock_t *)buf;
  id v14 = *(void (__cdecl **)(std::runtime_error *__hidden))(*(void *)buf + 8);
  if ((void (__cdecl *)(std::runtime_error *__hidden))((char *)v9 + 24) != v14)
  {
    do
    {
      *(_OWORD *)xpc_object_t v9 = *(_OWORD *)((char *)v9 + 24);
      id v15 = *((id *)v9 + 5);
      xpc_object_t v16 = xpc_null_create();
      id v17 = (void *)*((void *)v9 + 5);
      *((void *)v9 + 5) = v16;

      uint64_t v18 = (void *)*((void *)v9 + 2);
      *((void *)v9 + 2) = v15;

      id v19 = (void (__cdecl *)(std::runtime_error *__hidden))((char *)v9 + 24);
      unsigned int v20 = (void (__cdecl *)(std::runtime_error *__hidden))((char *)v9 + 48);
      xpc_object_t v9 = (void (__cdecl *)(std::runtime_error *__hidden))((char *)v9 + 24);
    }
    while (v20 != v14);
    xpc_object_t v9 = v19;
  }
  std::vector<std::pair<AMCP::Portal::IPC::shared_buffer_info_t,applesauce::xpc::dict>>::__base_destruct_at_end[abi:ne180100]((uint64_t)v13, (uint64_t)v9);
  if (*(void *)v77) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v77);
  }
  [(Core_Audio_Driver *)self io_receivers];
  id v21 = *(void **)(*(void *)buf + 16);
  [(Core_Audio_Driver *)self io_receivers];
  for (; v21; id v21 = (void *)*v21)
  {
    if (v21[2] == buffer_key) {
      break;
    }
  }
  if (v62.__imp_.__imp_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v62.__imp_.__imp_);
  }
  if (*(void *)v77) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v77);
  }
  [(Core_Audio_Driver *)self io_receivers];
  if (*(void *)v77) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v77);
  }
  if (v21)
  {
    v22 = (void *)v21[3];
    AMCP::Log::Scope::get_os_log_t(*(id *)a3.var0.fObj);
    uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
    xpc_object_t v24 = v23;
    if (!v23) {
      xpc_object_t v24 = xpc_null_create();
    }

    id v25 = v24;
    uint64_t v26 = v25;
    id v75 = v25;
    if (!v25 || MEMORY[0x1C185AAD0](v25) != MEMORY[0x1E4F14590])
    {
      xpc_object_t v27 = xpc_null_create();
      id v28 = v75;
      id v75 = v27;
    }
    *(void *)buf = &v75;
    *(void *)v77 = "buffer shared memory";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(&v74, (uint64_t)buf);
    *(void *)buf = &v75;
    *(void *)v77 = "buffer device id";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(&v73, (uint64_t)buf);
    unsigned int v29 = applesauce::xpc::dyn_cast_or_default((applesauce::xpc *)&v73, 0);
    *(void *)buf = &v75;
    *(void *)v77 = "buffer client id";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(&v72, (uint64_t)buf);
    unsigned int v30 = applesauce::xpc::dyn_cast_or_default((applesauce::xpc *)&v72, 0);
    *(void *)buf = &v75;
    *(void *)v77 = "buffer stream id";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(&v71, (uint64_t)buf);
    unsigned int v31 = applesauce::xpc::dyn_cast_or_default((applesauce::xpc *)&v71, 0);
    *(void *)buf = &v75;
    *(void *)v77 = "buffer type";
    applesauce::xpc::dict::object_proxy::operator applesauce::xpc::object(&v70, (uint64_t)buf);
    unsigned int v32 = applesauce::xpc::dyn_cast_or_default((applesauce::xpc *)&v70, 0);
    v69[0] = v29;
    v69[1] = v30;
    unsigned int v33 = v22 + 10;
    v69[2] = v31;
    v69[3] = v32;
    v34 = std::__hash_table<std::__hash_value_type<AMCP::Portal::IPC::shared_buffer_info_t,std::tuple<NSObject  {objcproto13OS_xpc_object}* {__strong},std::shared_ptr<caulk::ipc::mapped_memory>,void *>>,std::__unordered_map_hasher<AMCP::Portal::IPC::shared_buffer_info_t,std::__hash_value_type<AMCP::Portal::IPC::shared_buffer_info_t,std::tuple<NSObject  {objcproto13OS_xpc_object}* {__strong},std::shared_ptr<caulk::ipc::mapped_memory>,void *>>,std::hash<AMCP::Portal::IPC::shared_buffer_info_t>,std::equal_to<AMCP::Portal::IPC::shared_buffer_info_t>,true>,std::__unordered_map_equal<AMCP::Portal::IPC::shared_buffer_info_t,std::__hash_value_type<AMCP::Portal::IPC::shared_buffer_info_t,std::tuple<NSObject  {objcproto13OS_xpc_object}* {__strong},std::shared_ptr<caulk::ipc::mapped_memory>,void *>>,std::equal_to<AMCP::Portal::IPC::shared_buffer_info_t>,std::hash<AMCP::Portal::IPC::shared_buffer_info_t>,true>,std::allocator<std::__hash_value_type<AMCP::Portal::IPC::shared_buffer_info_t,std::tuple<NSObject  {objcproto13OS_xpc_object}* {__strong},std::shared_ptr<caulk::ipc::mapped_memory>,void *>>>>::find<AMCP::Portal::IPC::shared_buffer_info_t>(v22 + 10, v69);
    if (!v34)
    {
      AMCP::Log::Scope_Registry::get(0);
      AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
      uint64_t v53 = **(NSObject ***)buf;
      AMCP::Log::Scope::get_os_log_t(**(id **)buf);
      objc_claimAutoreleasedReturnValue();
      if (*(void *)v77) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v77);
      }
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        int v54 = pthread_self();
        mach_port_t v55 = pthread_mach_thread_np(v54);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v55;
        *(_WORD *)v77 = 2080;
        *(void *)&v77[2] = "IO_Receiver.mm";
        __int16 v78 = 1024;
        int v79 = 182;
        __int16 v80 = 2080;
        *(void *)v81 = "find_result == m_shared_memory_map.end()";
        _os_log_error_impl(&dword_1BAA78000, v53, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s buffer key doesnt exist in the map!", buf, 0x22u);
      }

      AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v68);
      __cxa_allocate_exception(0x40uLL);
      std::runtime_error::runtime_error(&v61, "buffer key doesnt exist in the map!");
      std::runtime_error::runtime_error(&v62, &v61);
      uint64_t v64 = 0;
      uint64_t v65 = 0;
      uint64_t v66 = 0;
      int v67 = -1;
      v62.__vftable = (std::runtime_error_vtbl *)&unk_1F148A9A8;
      uint64_t v63 = &unk_1F148A9D0;
      boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)buf, (uint64_t)&v62);
      *(void *)&v81[6] = "void AMCP::Portal::IPC::IO_Receiver::unregister_buffer(__strong xpc_object_t)";
      *(void *)&v81[14] = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/IO_Receiver.mm";
      int v82 = 182;
      applesauce::backtrace::snapshot_N<64>::snapshot_N((char **)&v56);
      int v58 = &unk_1F148AA90;
      long long v59 = v56;
      uint64_t v60 = v57;
      long long v56 = 0uLL;
      uint64_t v57 = 0;
      boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>();
    }
    int8x8_t v35 = (int8x8_t)v22[11];
    unint64_t v36 = v34[1];
    uint8x8_t v37 = (uint8x8_t)vcnt_s8(v35);
    v37.i16[0] = vaddlv_u8(v37);
    if (v37.u32[0] > 1uLL)
    {
      if (v36 >= *(void *)&v35) {
        v36 %= *(void *)&v35;
      }
    }
    else
    {
      v36 &= *(void *)&v35 - 1;
    }
    char v41 = *(uint64_t **)(*v33 + 8 * v36);
    do
    {
      uint64_t v42 = v41;
      char v41 = (uint64_t *)*v41;
    }
    while (v41 != v34);
    if (v42 == v22 + 12) {
      goto LABEL_57;
    }
    unint64_t v43 = v42[1];
    if (v37.u32[0] > 1uLL)
    {
      if (v43 >= *(void *)&v35) {
        v43 %= *(void *)&v35;
      }
    }
    else
    {
      v43 &= *(void *)&v35 - 1;
    }
    if (v43 != v36)
    {
LABEL_57:
      if (!*v34) {
        goto LABEL_58;
      }
      unint64_t v44 = *(void *)(*v34 + 8);
      if (v37.u32[0] > 1uLL)
      {
        if (v44 >= *(void *)&v35) {
          v44 %= *(void *)&v35;
        }
      }
      else
      {
        v44 &= *(void *)&v35 - 1;
      }
      if (v44 != v36) {
LABEL_58:
      }
        *(void *)(*v33 + 8 * v36) = 0;
    }
    uint64_t v45 = *v34;
    if (*v34)
    {
      unint64_t v46 = *(void *)(v45 + 8);
      if (v37.u32[0] > 1uLL)
      {
        if (v46 >= *(void *)&v35) {
          v46 %= *(void *)&v35;
        }
      }
      else
      {
        v46 &= *(void *)&v35 - 1;
      }
      if (v46 != v36)
      {
        *(void *)(*v33 + 8 * v46) = v42;
        uint64_t v45 = *v34;
      }
    }
    *uint64_t v42 = v45;
    uint64_t *v34 = 0;
    --v22[13];
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<AMCP::Portal::IPC::shared_buffer_info_t,std::shared_ptr<caulk::ipc::mapped_memory>>,void *>>>::operator()[abi:ne180100](1, v34);
    xpc_object_t v47 = v70;
    xpc_object_t v70 = 0;

    xpc_object_t v48 = v71;
    xpc_object_t v71 = 0;

    xpc_object_t v49 = v72;
    xpc_object_t v72 = 0;

    xpc_object_t v50 = v73;
    xpc_object_t v73 = 0;

    id v51 = v75;
    id v75 = 0;

    int v38 = 0;
LABEL_67:

    goto LABEL_68;
  }
  int v38 = 0;
LABEL_68:
  os_unfair_lock_unlock(v8);
  return v38;
}

- (int)handle_register_buffer:(dict)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  unint64_t buffer_key = (os_unfair_lock_s *)get_buffer_key((const dict *)a3.var0.fObj);
  unint64_t v7 = v6;
  [(Core_Audio_Driver *)self io_receiver_lock];
  id v8 = lock;
  os_unfair_lock_lock(lock);
  if ((void)v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v38);
  }
  [(Core_Audio_Driver *)self io_buffer_list];
  xpc_object_t v9 = *(_OWORD **)&lock->_os_unfair_lock_opaque;
  [(Core_Audio_Driver *)self io_buffer_list];
  id v10 = (_OWORD *)v35[1];
  if (v9 != v10)
  {
    while (*v9 != __PAIR128__(v7, (unint64_t)buffer_key))
    {
      xpc_object_t v9 = (_OWORD *)((char *)v9 + 24);
      if (v9 == v10)
      {
        xpc_object_t v9 = (_OWORD *)v35[1];
        break;
      }
    }
  }
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  if ((void)v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v38);
  }
  [(Core_Audio_Driver *)self io_buffer_list];
  uint64_t v11 = (AMCP::Log::Scope_Registry *)v38;
  uint64_t v12 = *(_OWORD **)&lock[2]._os_unfair_lock_opaque;
  if ((void)v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v38);
  }
  if (v9 != v12)
  {
    AMCP::Log::Scope_Registry::get(v11);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&lock, "com.apple.coreaudio", "AMCP");
    os_unfair_lock_t v13 = *(NSObject **)&lock->_os_unfair_lock_opaque;
    AMCP::Log::Scope::get_os_log_t(*(id *)&lock->_os_unfair_lock_opaque);
    objc_claimAutoreleasedReturnValue();
    if ((void)v38) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v38);
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = pthread_self();
      mach_port_t v15 = pthread_mach_thread_np(v14);
      LODWORD(lock) = 67110402;
      HIDWORD(lock) = v15;
      LOWORD(v38) = 2080;
      *(void *)((char *)&v38 + 2) = "Core_Audio_Driver.mm";
      WORD5(v38) = 1024;
      HIDWORD(v38) = 499;
      __int16 v39 = 1024;
      int v40 = (int)buffer_key;
      __int16 v41 = 1024;
      int v42 = HIDWORD(buffer_key);
      __int16 v43 = 1024;
      int v44 = v7;
      _os_log_error_impl(&dword_1BAA78000, v13, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Buffer was already registered! device id: %u, client id: %u, stream id: %u", (uint8_t *)&lock, 0x2Au);
    }
    goto LABEL_50;
  }
  [(Core_Audio_Driver *)self io_buffer_list];
  os_unfair_lock_t lock = buffer_key;
  *(void *)&long long v38 = v7;
  applesauce::xpc::object::object((applesauce::xpc::object *)((char *)&v38 + 8), *(const applesauce::xpc::object **)a3.var0.fObj);
  unint64_t v16 = v35[1];
  unint64_t v17 = v35[2];
  if (v16 < v17)
  {
    uint64_t v18 = std::pair<AMCP::Portal::IPC::shared_buffer_info_t,applesauce::xpc::dict>::pair[abi:ne180100](v16, (uint64_t)&lock)+ 24;
    v35[1] = v18;
    goto LABEL_37;
  }
  unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - *v35) >> 3);
  if (v19 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - *v35) >> 3);
  uint64_t v21 = 2 * v20;
  if (2 * v20 <= v19 + 1) {
    uint64_t v21 = v19 + 1;
  }
  if (v20 >= 0x555555555555555) {
    unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v22 = v21;
  }
  if (v22)
  {
    if (v22 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v23 = (char *)operator new(24 * v22);
  }
  else
  {
    uint64_t v23 = 0;
  }
  xpc_object_t v24 = &v23[24 * v22];
  uint64_t v25 = std::pair<AMCP::Portal::IPC::shared_buffer_info_t,applesauce::xpc::dict>::pair[abi:ne180100]((uint64_t)&v23[24 * v19], (uint64_t)&lock);
  uint64_t v18 = v25 + 24;
  xpc_object_t v27 = (id *)*v35;
  uint64_t v26 = (id *)v35[1];
  if (v26 == (id *)*v35)
  {
    *int8x8_t v35 = v25;
    v35[1] = v18;
    v35[2] = (uint64_t)v24;
    if (v26) {
LABEL_36:
    }
      operator delete(v26);
  }
  else
  {
    do
    {
      v26 -= 3;
      uint64_t v25 = std::pair<AMCP::Portal::IPC::shared_buffer_info_t,applesauce::xpc::dict>::pair[abi:ne180100](v25 - 24, (uint64_t)v26);
    }
    while (v26 != v27);
    id v28 = (id *)*v35;
    uint64_t v26 = (id *)v35[1];
    *int8x8_t v35 = v25;
    v35[1] = v18;
    v35[2] = (uint64_t)v24;
    if (v26 != v28)
    {
      do
      {
        unsigned int v30 = *(v26 - 1);
        unsigned int v29 = v26 - 1;
        *unsigned int v29 = 0;

        uint64_t v26 = v29 - 2;
      }
      while (v26 != v28);
      uint64_t v26 = v28;
    }
    if (v26) {
      goto LABEL_36;
    }
  }
LABEL_37:
  v35[1] = v18;
  unsigned int v31 = (void *)*((void *)&v38 + 1);
  *((void *)&v38 + 1) = 0;

  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  [(Core_Audio_Driver *)self io_receivers];
  unsigned int v32 = *(void **)&lock[4]._os_unfair_lock_opaque;
  [(Core_Audio_Driver *)self io_receivers];
  for (; v32; unsigned int v32 = (void *)*v32)
  {
    if ((os_unfair_lock_s *)v32[2] == buffer_key) {
      break;
    }
  }
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  if ((void)v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v38);
  }
  [(Core_Audio_Driver *)self io_receivers];
  if ((void)v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v38);
  }
  if (v32)
  {
    uint64_t v33 = v32[3];
    os_unfair_lock_t v13 = *(NSObject **)a3.var0.fObj;
    AMCP::Log::Scope::get_os_log_t(v13);
    objc_claimAutoreleasedReturnValue();
    AMCP::Portal::IPC::IO_Receiver::register_buffer(v33, v13);
LABEL_50:
  }
  os_unfair_lock_unlock(v8);
  return 0;
}

- (void)object_was_destroyed:(unsigned int)a3 reply:(id)a4
{
  unint64_t v6 = (void (**)(id, void))a4;
  [(Core_Audio_Driver *)self m_property_type_info];
  Property_Type_Info::remove_custom_properties(v7, a3);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  v6[2](v6, 0);
}

- (void)destroy_device:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  unint64_t v6 = (void (**)(id, uint64_t))a4;
  unint64_t v7 = [(Core_Audio_Driver *)self asp_interface];
  uint64_t v8 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t))(*v7)->DestroyDevice)(v7, v4);
  [(Core_Audio_Driver *)self destroy_io_receiver:v4];
  v6[2](v6, v8);
}

- (void)create_device:(id)a3 client_id:(unsigned int)a4 process_id:(int)a5 is_native_endianess:(BOOL)a6 bundle_id:(id)a7 reply:(id)a8
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a7;
  unint64_t v16 = (void (**)(id, uint64_t, void))a8;
  unsigned int v19 = 0;
  v20[0] = a4;
  v20[1] = a5;
  id v22 = v15;
  BOOL v21 = a6;
  unint64_t v17 = [(Core_Audio_Driver *)self asp_interface];
  uint64_t v18 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, id, _DWORD *, unsigned int *))(*v17)->CreateDevice)(v17, v14, v20, &v19);
  v16[2](v16, v18, v19);
}

- (void)remove_device_client:(unsigned int)a3 client_id:(unsigned int)a4 process_id:(int)a5 is_native_endianess:(BOOL)a6 bundle_id:(id)a7 reply:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  id v15 = (void (**)(id, uint64_t))a8;
  unint64_t v16 = [(Core_Audio_Driver *)self asp_interface];
  uint64_t v17 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t *))(*v16)->RemoveDeviceClient)(v16, v12, &v18);
  v15[2](v15, v17);
}

- (void)add_device_client:(unsigned int)a3 client_id:(unsigned int)a4 process_id:(int)a5 is_native_endianess:(BOOL)a6 bundle_id:(id)a7 reply:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  id v15 = (void (**)(id, uint64_t))a8;
  unint64_t v16 = [(Core_Audio_Driver *)self asp_interface];
  uint64_t v17 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t, uint64_t *))(*v16)->AddDeviceClient)(v16, v12, &v18);
  v15[2](v15, v17);
}

- (int)destroy_io_receiver:(unsigned int)a3
{
  [(Core_Audio_Driver *)self io_receiver_lock];
  os_unfair_lock_lock(lock);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  [(Core_Audio_Driver *)self io_receivers];
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  uint64_t v5 = *(void **)&lock[4]._os_unfair_lock_opaque;
  if (v5)
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      if (*((_DWORD *)v5 + 4) == a3)
      {
        if (v7 >= v8)
        {
          uint64_t v9 = ((char *)v7 - (char *)v6) >> 3;
          unint64_t v10 = v9 + 1;
          if ((unint64_t)(v9 + 1) >> 61) {
            std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
          }
          if (v8 - v6 > v10) {
            unint64_t v10 = v8 - v6;
          }
          if ((unint64_t)((char *)v8 - (char *)v6) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v11 = v10;
          }
          if (v11)
          {
            if (v11 >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            uint64_t v12 = (char *)operator new(8 * v11);
          }
          else
          {
            uint64_t v12 = 0;
          }
          os_unfair_lock_t v13 = &v12[8 * v9];
          *(void *)os_unfair_lock_t v13 = v5[2];
          id v14 = (unsigned int *)(v13 + 8);
          while (v7 != v6)
          {
            uint64_t v15 = *((void *)v7 - 1);
            v7 -= 2;
            *((void *)v13 - 1) = v15;
            v13 -= 8;
          }
          uint64_t v8 = (unsigned int *)&v12[8 * v11];
          if (v6) {
            operator delete(v6);
          }
          unint64_t v6 = (unsigned int *)v13;
          unint64_t v7 = v14;
        }
        else
        {
          *(void *)unint64_t v7 = v5[2];
          v7 += 2;
        }
      }
      uint64_t v5 = (void *)*v5;
    }
    while (v5);
    if (v6 != v7)
    {
      unint64_t v16 = v6;
      do
      {
        [(Core_Audio_Driver *)self io_receivers];
        std::__hash_table<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::__unordered_map_hasher<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::__unordered_map_equal<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::allocator<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>>>::__erase_unique<AMCP::Portal::IPC::io_messenger_id_t>(lock, *v16, v16[1]);
        if (v19) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v19);
        }
        v16 += 2;
      }
      while (v16 != v7);
    }
    if (v6) {
      operator delete(v6);
    }
  }
  os_unfair_lock_unlock(lock);
  return 0;
}

- (int)destroy_io_receiver:(unsigned int)a3 client_id:(unsigned int)a4
{
  [(Core_Audio_Driver *)self io_receiver_lock];
  os_unfair_lock_lock(lock);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  [(Core_Audio_Driver *)self io_receivers];
  std::__hash_table<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::__unordered_map_hasher<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::__unordered_map_equal<AMCP::Portal::IPC::io_messenger_id_t,std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>,std::equal_to<AMCP::Portal::IPC::io_messenger_id_t>,std::hash<AMCP::Portal::IPC::io_messenger_id_t>,true>,std::allocator<std::__hash_value_type<AMCP::Portal::IPC::io_messenger_id_t,std::shared_ptr<AMCP::Portal::IPC::IO_Receiver>>>>::__erase_unique<AMCP::Portal::IPC::io_messenger_id_t>(lock, a3, a4);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  os_unfair_lock_unlock(lock);
  return 0;
}

- (int)create_and_start_io_receiver:(unsigned int)a3 client_id:(unsigned int)a4 nominal_sample_rate:(double)a5 io_buffer_frame_size:(unsigned int)a6 work_group_port:(id)a7 io_messenger:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v130 = a7;
  id v131 = a8;
  if (v131)
  {
    id v14 = [(Core_Audio_Driver *)self asp_interface];
    [(Core_Audio_Driver *)self io_receiver_lock];
    os_unfair_lock_lock(buf);
    if (*(void *)buf_8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)buf_8);
    }
    [(Core_Audio_Driver *)self io_receivers];
    uint64_t v15 = *(uint64_t **)&buf[4]._os_unfair_lock_opaque;
    [(Core_Audio_Driver *)self io_receivers];
    for (; v15; uint64_t v15 = (uint64_t *)*v15)
    {
      if (*((_DWORD *)v15 + 4) == v12 && *((_DWORD *)v15 + 5) == a4) {
        break;
      }
    }
    if (v136.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v136.__r_.__value_.__l.__size_);
    }
    if (*(void *)buf_8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)buf_8);
    }
    [(Core_Audio_Driver *)self io_receivers];
    unint64_t v16 = *(AMCP::Log::Scope_Registry **)buf_8;
    if (*(void *)buf_8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)buf_8);
    }
    if (v15)
    {
      AMCP::Log::Scope_Registry::get(v16);
      AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&buf, "com.apple.coreaudio", "AMCP");
      v116 = *(NSObject **)&buf->_os_unfair_lock_opaque;
      AMCP::Log::Scope::get_os_log_t(*(id *)&buf->_os_unfair_lock_opaque);
      objc_claimAutoreleasedReturnValue();
      if (*(void *)buf_8) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)buf_8);
      }
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
      {
        v117 = pthread_self();
        mach_port_t v118 = pthread_mach_thread_np(v117);
        LODWORD(buf) = 67109890;
        HIDWORD(buf) = v118;
        *(_WORD *)buf_8 = 2080;
        *(void *)&buf_8[2] = "Core_Audio_Driver.mm";
        *(_WORD *)&buf_8[10] = 1024;
        *(_DWORD *)&buf_8[12] = 286;
        *(_WORD *)&buf_8[16] = 2080;
        *(void *)&buf_8[18] = "find_result != self.io_receivers->end()";
        _os_log_error_impl(&dword_1BAA78000, v116, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s IO Messenger was already created", (uint8_t *)&buf, 0x22u);
      }

      AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v134);
      __cxa_allocate_exception(0x40uLL);
      std::runtime_error::runtime_error(&v132, "IO Messenger was already created");
      std::runtime_error::runtime_error((std::runtime_error *)&v136, &v132);
      uint64_t v137 = 0;
      uint64_t v138 = 0;
      uint64_t v139 = 0;
      int v140 = -1;
      v136.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1F148A9A8;
      v136.__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_1F148A9D0;
      boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)&buf, (uint64_t)&v136);
      *(void *)&buf_8[24] = "-[Core_Audio_Driver create_and_start_io_receiver:client_id:nominal_sample_rate:io_buffer_f"
                              "rame_size:work_group_port:io_messenger:]";
      *(void *)&buf_8[32] = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver.mm";
      LODWORD(v149) = 286;
      applesauce::backtrace::snapshot_N<64>::snapshot_N(&__p.__r_.__value_.__l.__data_);
      std::string v145 = __p;
      v144 = (os_unfair_lock_s *)&unk_1F148AA90;
      memset(&__p, 0, sizeof(__p));
      boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>();
    }
    v128 = [v131 object];
    unsigned int v125 = a6;
    uint64_t v17 = (char *)operator new(0xC0uLL);
    *(_OWORD *)(v17 + 8) = 0u;
    *(void *)uint64_t v17 = &unk_1F147FFC8;
    id v18 = v128;
    *((_OWORD *)v17 + 2) = 0u;
    unint64_t v19 = (unint64_t)(v17 + 32);
    unint64_t v20 = v17 + 24;
    *((void *)v17 + 3) = &unk_1F147E410;
    *(_OWORD *)(v17 + 104) = 0u;
    *(_OWORD *)(v17 + 120) = 0u;
    *((_OWORD *)v17 + 3) = 0u;
    *((void *)v17 + 8) = 0;
    *((_DWORD *)v17 + 34) = 1065353216;
    v126 = v17 + 144;
    *((void *)v17 + 21) = 0;
    *((_OWORD *)v17 + 11) = 0u;
    id v21 = v18;
    caulk::mach::details::release_os_object(0, v22);
    uint64_t v23 = (caulk::mach::details *)*((void *)v17 + 4);
    *((void *)v17 + 4) = v21;
    caulk::mach::details::release_os_object(v23, v24);
    if (AMCP::Feature_Flags::access_event_link_oop_io(0, v25))
    {
      uint64_t v26 = (char *)operator new(0xD8uLL);
      *((void *)v26 + 1) = 0;
      *((void *)v26 + 2) = 0;
      *(void *)uint64_t v26 = &unk_1F147E440;
      *(_OWORD *)(v26 + 24) = 0u;
      *(_OWORD *)(v26 + 40) = 0u;
      *(_OWORD *)(v26 + 56) = 0u;
      *(_OWORD *)(v26 + 72) = 0u;
      *(_OWORD *)(v26 + 88) = 0u;
      *(_OWORD *)(v26 + 104) = 0u;
      *(_OWORD *)(v26 + 120) = 0u;
      *(_OWORD *)(v26 + 136) = 0u;
      *(_OWORD *)(v26 + 152) = 0u;
      *(_OWORD *)(v26 + 168) = 0u;
      *(_OWORD *)(v26 + 184) = 0u;
      *(_OWORD *)(v26 + 200) = 0u;
      MEMORY[0x1C1858E40](v26 + 96);
      *((void *)v26 + 16) = 0;
      *((void *)v26 + 20) = 0;
      *((void *)v26 + 24) = 0;
      *((void *)v26 + 25) = 0x3FD0000000000000;
      *((_WORD *)v26 + 104) = 0;
      *(void *)&long long v27 = v26 + 24;
      *((void *)&v27 + 1) = v26;
      id v28 = (std::__shared_weak_count *)*((void *)v26 + 4);
      if (v28)
      {
        if (v28->__shared_owners_ != -1)
        {
LABEL_29:
          uint64_t v33 = (std::__shared_weak_count *)*((void *)v17 + 6);
          *(_OWORD *)(v17 + 40) = v27;
          if (v33) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v33);
          }
          caulk::make_string((caulk *)"IO Receiver: %u", (uint64_t)&__p, v12);
          v34 = (AMCP::Log::Scope_Registry *)caulk::ipc::synchronous_messenger::eventlink_receiver::ingest_connection_info();
          int8x8_t v35 = (void *)*((void *)v17 + 5);
          if (!v35[2] || !v35[3] || !v35[5] || !v35[6] || !v35[8])
          {
            AMCP::Log::Scope_Registry::get(v34);
            AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&buf, "com.apple.coreaudio", "AMCP");
            v112 = *(NSObject **)&buf->_os_unfair_lock_opaque;
            AMCP::Log::Scope::get_os_log_t(*(id *)&buf->_os_unfair_lock_opaque);
            objc_claimAutoreleasedReturnValue();
            if (*(void *)buf_8) {
              std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)buf_8);
            }
            if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
            {
              v113 = pthread_self();
              mach_port_t v114 = pthread_mach_thread_np(v113);
              LODWORD(buf) = 67109890;
              HIDWORD(buf) = v114;
              *(_WORD *)buf_8 = 2080;
              *(void *)&buf_8[2] = "IO_Receiver.mm";
              *(_WORD *)&buf_8[10] = 1024;
              *(_DWORD *)&buf_8[12] = 86;
              *(_WORD *)&buf_8[16] = 2080;
              *(void *)&buf_8[18] = "!m_event_link_receiver->is_valid()";
              _os_log_error_impl(&dword_1BAA78000, v112, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s Failed to unpack connection info", (uint8_t *)&buf, 0x22u);
            }

            AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)v146);
            __cxa_allocate_exception(0x40uLL);
            std::runtime_error::runtime_error(&v134, "Failed to unpack connection info");
            std::runtime_error::runtime_error((std::runtime_error *)&v136, &v134);
            uint64_t v137 = 0;
            uint64_t v138 = 0;
            uint64_t v139 = 0;
            int v140 = -1;
            v136.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1F148A9A8;
            v136.__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_1F148A9D0;
            boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)&buf, (uint64_t)&v136);
            *(void *)&buf_8[24] = "AMCP::Portal::IPC::IO_Receiver::IO_Receiver(__strong xpc_object_t, AudioServerPlugIn"
                                    "DriverRef, AudioObjectID, UInt32)";
            *(void *)&buf_8[32] = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/IO_Receiver.mm";
            LODWORD(v149) = 86;
            std::vector<void *>::vector(&v132);
            int v115 = backtrace((void **)&v132.~runtime_error, (unint64_t)(v132.__imp_.__imp_ - (const char *)v132.__vftable) >> 3);
            std::vector<void *>::resize((char **)&v132, v115);
            *(std::runtime_error *)&v145.__r_.__value_.__l.__data_ = v132;
            v144 = (os_unfair_lock_s *)&unk_1F148AA90;
            v145.__r_.__value_.__r.__words[2] = v133;
            v132.__vftable = 0;
            v132.__imp_.__imp_ = 0;
            std::string::size_type v133 = 0;
            boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>();
          }
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          goto LABEL_48;
        }
        long long v124 = v27;
        atomic_fetch_add_explicit((atomic_ullong *volatile)v26 + 1, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit((atomic_ullong *volatile)v26 + 2, 1uLL, memory_order_relaxed);
        *((void *)v26 + 3) = v26 + 24;
        *((void *)v26 + 4) = v26;
        std::__shared_weak_count::__release_weak(v28);
      }
      else
      {
        long long v124 = v27;
        atomic_fetch_add_explicit((atomic_ullong *volatile)v26 + 1, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit((atomic_ullong *volatile)v26 + 2, 1uLL, memory_order_relaxed);
        *((void *)v26 + 3) = v26 + 24;
        *((void *)v26 + 4) = v26;
      }
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v26);
      long long v27 = v124;
      goto LABEL_29;
    }
    unsigned int v30 = (char *)operator new(0xD8uLL);
    *((void *)v30 + 1) = 0;
    *((void *)v30 + 2) = 0;
    *(void *)unsigned int v30 = &unk_1F147E490;
    *(_OWORD *)(v30 + 24) = 0u;
    *(_OWORD *)(v30 + 40) = 0u;
    *(_OWORD *)(v30 + 88) = 0u;
    *(_OWORD *)(v30 + 56) = 0u;
    *(_OWORD *)(v30 + 72) = 0u;
    *(_OWORD *)(v30 + 104) = 0u;
    *(_OWORD *)(v30 + 120) = 0u;
    *(_OWORD *)(v30 + 136) = 0u;
    *(_OWORD *)(v30 + 152) = 0u;
    *(_OWORD *)(v30 + 168) = 0u;
    *(_OWORD *)(v30 + 184) = 0u;
    *(_OWORD *)(v30 + 200) = 0u;
    MEMORY[0x1C1858E40](v30 + 88);
    MEMORY[0x1C1858E40](v30 + 96);
    MEMORY[0x1C1858E40](v30 + 104);
    *((void *)v30 + 17) = 0;
    *((void *)v30 + 21) = 0;
    *((void *)v30 + 25) = 0;
    *((_WORD *)v30 + 104) = 0;
    *(void *)&long long v31 = v30 + 24;
    *((void *)&v31 + 1) = v30;
    unsigned int v32 = (std::__shared_weak_count *)*((void *)v30 + 4);
    if (v32)
    {
      unint64_t v20 = v17 + 24;
      if (v32->__shared_owners_ != -1)
      {
LABEL_40:
        unint64_t v36 = (std::__shared_weak_count *)*((void *)v17 + 8);
        *(_OWORD *)(v17 + 56) = v31;
        if (v36) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v36);
        }
        v34 = (AMCP::Log::Scope_Registry *)caulk::ipc::synchronous_messenger::semaphore_receiver::ingest_connection_info();
        uint64_t v37 = *((void *)v17 + 7);
        if (!*(void *)(v37 + 16)
          || !*(void *)(v37 + 24)
          || !*(void *)(v37 + 40)
          || !*(void *)(v37 + 48)
          || !*(_DWORD *)(v37 + 64)
          || !*(_DWORD *)(v37 + 72))
        {
          AMCP::Log::Scope_Registry::get(v34);
          AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&buf, "com.apple.coreaudio", "AMCP");
          v108 = *(NSObject **)&buf->_os_unfair_lock_opaque;
          AMCP::Log::Scope::get_os_log_t(*(id *)&buf->_os_unfair_lock_opaque);
          objc_claimAutoreleasedReturnValue();
          if (*(void *)buf_8) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)buf_8);
          }
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            v109 = pthread_self();
            mach_port_t v110 = pthread_mach_thread_np(v109);
            LODWORD(buf) = 67109890;
            HIDWORD(buf) = v110;
            *(_WORD *)buf_8 = 2080;
            *(void *)&buf_8[2] = "IO_Receiver.mm";
            *(_WORD *)&buf_8[10] = 1024;
            *(_DWORD *)&buf_8[12] = 92;
            *(_WORD *)&buf_8[16] = 2080;
            *(void *)&buf_8[18] = "!m_receiver->is_valid()";
            _os_log_error_impl(&dword_1BAA78000, v108, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s Failed to unpack connection info", (uint8_t *)&buf, 0x22u);
          }

          AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v134);
          __cxa_allocate_exception(0x40uLL);
          std::runtime_error::runtime_error(&v132, "Failed to unpack connection info");
          std::runtime_error::runtime_error((std::runtime_error *)&v136, &v132);
          uint64_t v137 = 0;
          uint64_t v138 = 0;
          uint64_t v139 = 0;
          int v140 = -1;
          v136.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1F148A9A8;
          v136.__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_1F148A9D0;
          boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)&buf, (uint64_t)&v136);
          *(void *)&buf_8[24] = "AMCP::Portal::IPC::IO_Receiver::IO_Receiver(__strong xpc_object_t, AudioServerPlugInDr"
                                  "iverRef, AudioObjectID, UInt32)";
          *(void *)&buf_8[32] = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/IO_Receiver.mm";
          LODWORD(v149) = 92;
          std::vector<void *>::vector(&__p);
          int v111 = backtrace((void **)__p.__r_.__value_.__l.__data_, (__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3);
          std::vector<void *>::resize(&__p.__r_.__value_.__l.__data_, v111);
          std::string v145 = __p;
          v144 = (os_unfair_lock_s *)&unk_1F148AA90;
          memset(&__p, 0, sizeof(__p));
          boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>();
        }
LABEL_48:
        *((void *)v17 + 9) = v14;
        if (!v14)
        {
          AMCP::Log::Scope_Registry::get(v34);
          AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&buf, "com.apple.coreaudio", "AMCP");
          v119 = *(NSObject **)&buf->_os_unfair_lock_opaque;
          AMCP::Log::Scope::get_os_log_t(*(id *)&buf->_os_unfair_lock_opaque);
          objc_claimAutoreleasedReturnValue();
          if (*(void *)buf_8) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)buf_8);
          }
          if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          {
            v120 = pthread_self();
            mach_port_t v121 = pthread_mach_thread_np(v120);
            LODWORD(buf) = 67109890;
            HIDWORD(buf) = v121;
            *(_WORD *)buf_8 = 2080;
            *(void *)&buf_8[2] = "IO_Receiver.mm";
            *(_WORD *)&buf_8[10] = 1024;
            *(_DWORD *)&buf_8[12] = 96;
            *(_WORD *)&buf_8[16] = 2080;
            *(void *)&buf_8[18] = "(m_asp_interface) == nullptr";
            _os_log_error_impl(&dword_1BAA78000, v119, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: %s ASP interface is null", (uint8_t *)&buf, 0x22u);
          }

          AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v134);
          __cxa_allocate_exception(0x40uLL);
          std::runtime_error::runtime_error(&v132, "ASP interface is null");
          std::runtime_error::runtime_error((std::runtime_error *)&v136, &v132);
          uint64_t v137 = 0;
          uint64_t v138 = 0;
          uint64_t v139 = 0;
          int v140 = -1;
          v136.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1F148A9A8;
          v136.__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_1F148A9D0;
          boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)&buf, (uint64_t)&v136);
          *(void *)&buf_8[24] = "AMCP::Portal::IPC::IO_Receiver::IO_Receiver(__strong xpc_object_t, AudioServerPlugInDr"
                                  "iverRef, AudioObjectID, UInt32)";
          *(void *)&buf_8[32] = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/IO_Receiver.mm";
          LODWORD(v149) = 96;
          std::vector<void *>::vector(&__p);
          int v122 = backtrace((void **)__p.__r_.__value_.__l.__data_, (__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3);
          std::vector<void *>::resize(&__p.__r_.__value_.__l.__data_, v122);
          std::string v145 = __p;
          v144 = (os_unfair_lock_s *)&unk_1F148AA90;
          memset(&__p, 0, sizeof(__p));
          boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>();
        }
        *((_DWORD *)v17 + 20) = v12;
        *((_DWORD *)v17 + 21) = a4;
        *((_DWORD *)v17 + 24) = 4096;
        *((void *)v17 + 11) = 0x40E5888000000000;
        long long v38 = (char *)*((void *)v17 + 21);
        *((void *)v17 + 21) = 0;
        if (v38 == v126)
        {
          (*(void (**)(char *))(*(void *)v126 + 32))(v126);
        }
        else if (v38)
        {
          (*(void (**)(char *))(*(void *)v38 + 40))(v38);
        }

        v127 = self;
        [(Core_Audio_Driver *)self io_receivers];
        os_unfair_lock_t v39 = buf;
        *(void *)&long long v40 = v20;
        *((void *)&v40 + 1) = v17;
        long long v129 = v40;
        atomic_fetch_add_explicit((atomic_ullong *volatile)v17 + 1, 1uLL, memory_order_relaxed);
        unint64_t v41 = (0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * a4) ^ ((0xC6A4A7935BD1E995 * a4) >> 47))) ^ (0x35A98F4D286A90B9 * ((0xC6A4A7935BD1E995 * v12) ^ ((0xC6A4A7935BD1E995 * v12) >> 47)) + 3864292196u);
        unint64_t v42 = 0xC6A4A7935BD1E995 * v41 + 3864292196u;
        unint64_t v43 = *(void *)&v39[2]._os_unfair_lock_opaque;
        if (v43)
        {
          uint8x8_t v44 = (uint8x8_t)vcnt_s8((int8x8_t)v43);
          v44.i16[0] = vaddlv_u8(v44);
          if (v44.u32[0] > 1uLL)
          {
            unint64_t v19 = 0xC6A4A7935BD1E995 * v41 + 3864292196u;
            if (v42 >= v43) {
              unint64_t v19 = v42 % v43;
            }
          }
          else
          {
            unint64_t v19 = v42 & (v43 - 1);
          }
          uint64_t v45 = *(uint64_t ***)(*(void *)&v39->_os_unfair_lock_opaque + 8 * v19);
          if (v45)
          {
            for (i = *v45; i; i = (uint64_t *)*i)
            {
              unint64_t v47 = i[1];
              if (v47 == v42)
              {
                if (*((_DWORD *)i + 4) == v12 && *((_DWORD *)i + 5) == a4)
                {
                  v101 = self;
                  long long v102 = v129;
                  goto LABEL_130;
                }
              }
              else
              {
                if (v44.u32[0] > 1uLL)
                {
                  if (v47 >= v43) {
                    v47 %= v43;
                  }
                }
                else
                {
                  v47 &= v43 - 1;
                }
                if (v47 != v19) {
                  break;
                }
              }
            }
          }
        }
        xpc_object_t v49 = (char *)operator new(0x28uLL);
        xpc_object_t v50 = v39 + 4;
        *(void *)xpc_object_t v49 = 0;
        *((void *)v49 + 1) = v42;
        *((void *)v49 + 2) = v12 | ((unint64_t)a4 << 32);
        *(_OWORD *)(v49 + 24) = v129;
        float v51 = (float)(unint64_t)(*(void *)&v39[6]._os_unfair_lock_opaque + 1);
        float v52 = *(float *)&v39[8]._os_unfair_lock_opaque;
        if (v43 && (float)(v52 * (float)v43) >= v51)
        {
LABEL_120:
          uint64_t v68 = *(void *)&v39->_os_unfair_lock_opaque;
          v69 = *(void **)(*(void *)&v39->_os_unfair_lock_opaque + 8 * v19);
          if (v69)
          {
            *(void *)xpc_object_t v49 = *v69;
            v101 = v127;
          }
          else
          {
            *(void *)xpc_object_t v49 = *(void *)&v50->_os_unfair_lock_opaque;
            *(void *)&v50->_os_unfair_lock_opaque = v49;
            *(void *)(v68 + 8 * v19) = v50;
            v101 = v127;
            if (!*(void *)v49)
            {
LABEL_129:
              ++*(void *)&v39[6]._os_unfair_lock_opaque;
              long long v102 = 0uLL;
LABEL_130:
              if (*((void *)&v102 + 1)) {
                std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v102 + 1));
              }
              if (*(void *)buf_8) {
                std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)buf_8);
              }
              [(Core_Audio_Driver *)v101 io_buffer_list];
              os_unfair_lock_t v71 = buf;
              if (*(void *)buf_8) {
                std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)buf_8);
              }
              uint64_t v72 = *(void *)&v71->_os_unfair_lock_opaque;
              uint64_t v73 = *(void *)&v71[2]._os_unfair_lock_opaque;
              while (v72 != v73)
              {
                if (*(_DWORD *)v72 == v12)
                {
                  int v74 = *(_DWORD *)(v72 + 4);
                  if (v74) {
                    BOOL v75 = v74 == a4;
                  }
                  else {
                    BOOL v75 = 1;
                  }
                  if (v75)
                  {
                    v76 = *(void **)(v72 + 16);
                    AMCP::Log::Scope::get_os_log_t(v76);
                    objc_claimAutoreleasedReturnValue();
                    AMCP::Portal::IPC::IO_Receiver::register_buffer((uint64_t)(v17 + 24), v76);
                  }
                }
                v72 += 24;
              }
              *((double *)v17 + 11) = a5;
              *((_DWORD *)v17 + 24) = v125;
              id v77 = [v130 object];
              __int16 v78 = v77;
              if (v77 && MEMORY[0x1C185AAD0](v77) == MEMORY[0x1E4F145C8])
              {
                id v80 = v78;
                xpc_mach_send_copy_right();

                caulk::make_string((caulk *)"IO Receiver: %u %u", (uint64_t)&v136, *((unsigned int *)v17 + 20), *((unsigned int *)v17 + 21));
                caulk::mach::os_workgroup_managed::make();
                v81 = (char *)operator new(0x58uLL);
                *((void *)v81 + 1) = 0;
                *((void *)v81 + 2) = 0;
                *(void *)v81 = &unk_1F147E4E0;
                uint64_t v82 = MEMORY[0x1E4FB7EA0] + 16;
                *(_OWORD *)(v81 + 40) = 0u;
                *(_OWORD *)(v81 + 56) = 0u;
                *(_OWORD *)(v81 + 65) = 0u;
                uint64_t v83 = *(void *)buf_8;
                *((void *)v81 + 3) = v82;
                *((void *)v81 + 4) = v83;
                *(void *)buf_8 = 0;
                caulk::mach::details::release_os_object(0, v84);
                uint64_t v85 = *((void *)v81 + 9);
                long long v86 = *(_OWORD *)(v81 + 40);
                long long v87 = *(_OWORD *)&buf_8[24];
                *(_OWORD *)(v81 + 40) = *(_OWORD *)&buf_8[8];
                long long v88 = *(_OWORD *)(v81 + 56);
                *(_OWORD *)(v81 + 56) = v87;
                *((void *)v81 + 9) = v149;
                *(_OWORD *)&buf_8[8] = v86;
                *(_OWORD *)&buf_8[24] = v88;
                uint64_t v149 = v85;
                LOBYTE(v85) = v81[80];
                v81[80] = v150;
                LOBYTE(v150) = v85;
                *(void *)&long long v86 = v81 + 24;
                *((void *)&v86 + 1) = v81;
                v89 = (std::__shared_weak_count *)*((void *)v17 + 23);
                *((_OWORD *)v17 + 11) = v86;
                if (v89) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v89);
                }
                caulk::mach::os_workgroup_managed::~os_workgroup_managed((caulk::mach::os_workgroup_managed *)&buf);
                if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v136.__r_.__value_.__l.__data_);
                }
              }
              else
              {
                int v79 = (std::__shared_weak_count *)*((void *)v17 + 23);
                *((void *)v17 + 22) = 0;
                *((void *)v17 + 23) = 0;
                if (v79) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v79);
                }
              }

              if (AMCP::Feature_Flags::access_event_link_oop_io(0, v90))
              {
                uint64_t v91 = *((void *)v17 + 5);
                os_unfair_lock_t buf = (os_unfair_lock_t)&unk_1F147E580;
                *(void *)buf_8 = v17 + 24;
                *(void *)&buf_8[16] = &buf;
                std::function<void ()(caulk::ipc::mapped_memory &)>::operator=((void *)(v91 + 112), &buf);
              }
              else
              {
                uint64_t v92 = *((void *)v17 + 7);
                os_unfair_lock_t buf = (os_unfair_lock_t)&unk_1F147E580;
                *(void *)buf_8 = v17 + 24;
                *(void *)&buf_8[16] = &buf;
                std::function<void ()(caulk::ipc::mapped_memory &)>::operator=((void *)(v92 + 120), &buf);
              }
              v93 = (AMCP::Log::Scope_Registry *)std::__function::__value_func<void ()(caulk::ipc::mapped_memory &)>::~__value_func[abi:ne180100](&buf);
              v95 = (os_unfair_lock_s *)*((void *)v17 + 5);
              std::string::size_type v94 = *((void *)v17 + 6);
              if (v94) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v94 + 8), 1uLL, memory_order_relaxed);
              }
              v144 = v95;
              v145.__r_.__value_.__r.__words[0] = v94;
              std::string::size_type v97 = *((void *)v17 + 7);
              std::string::size_type v96 = *((void *)v17 + 8);
              if (v96) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v96 + 8), 1uLL, memory_order_relaxed);
              }
              v145.__r_.__value_.__l.__size_ = v97;
              v145.__r_.__value_.__r.__words[2] = v96;
              if (!*((void *)v17 + 22))
              {
                AMCP::Log::Scope_Registry::get(v93);
                AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&buf, "com.apple.coreaudio", "AMCP");
                v98 = *(NSObject **)&buf->_os_unfair_lock_opaque;
                AMCP::Log::Scope::get_os_log_t(*(id *)&buf->_os_unfair_lock_opaque);
                objc_claimAutoreleasedReturnValue();
                if (*(void *)buf_8) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)buf_8);
                }
                if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                {
                  v106 = pthread_self();
                  mach_port_t v107 = pthread_mach_thread_np(v106);
                  LODWORD(buf) = 67109634;
                  HIDWORD(buf) = v107;
                  *(_WORD *)buf_8 = 2080;
                  *(void *)&buf_8[2] = "IO_Receiver.mm";
                  *(_WORD *)&buf_8[10] = 1024;
                  *(_DWORD *)&buf_8[12] = 315;
                  _os_log_error_impl(&dword_1BAA78000, v98, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d IO_Receiver::start_message_thread: work group is null!", (uint8_t *)&buf, 0x18u);
                }
              }
              std::string::basic_string[abi:ne180100]<0>(&__p, "io receiver spawner");
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                std::string::__init_copy_ctor_external(&v136, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
              }
              else {
                std::string v136 = __p;
              }
              LOBYTE(v137) = 1;
              LOBYTE(v138) = 0;
              char v141 = 0;
              int v142 = 1;
              char v143 = 1;
              os_unfair_lock_t buf = v95;
              *(void *)buf_8 = v94;
              if (v94) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v94 + 8), 1uLL, memory_order_relaxed);
              }
              *(void *)&buf_8[8] = v97;
              *(void *)&buf_8[16] = v96;
              if (v96) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v96 + 8), 1uLL, memory_order_relaxed);
              }
              *(void *)&buf_8[24] = *((void *)v17 + 11);
              *(_DWORD *)&buf_8[32] = *((_DWORD *)v17 + 24);
              uint64_t v99 = *((void *)v17 + 23);
              uint64_t v149 = *((void *)v17 + 22);
              uint64_t v150 = v99;
              if (v99) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v99 + 8), 1uLL, memory_order_relaxed);
              }
              int v151 = *((_DWORD *)v17 + 20);
              v132.__vftable = 0;
              LOBYTE(v132.__imp_.__imp_) = 0;
              operator new();
            }
            unint64_t v70 = *(void *)(*(void *)v49 + 8);
            if ((v43 & (v43 - 1)) != 0)
            {
              if (v70 >= v43) {
                v70 %= v43;
              }
            }
            else
            {
              v70 &= v43 - 1;
            }
            v69 = (void *)(*(void *)&v39->_os_unfair_lock_opaque + 8 * v70);
          }
          void *v69 = v49;
          goto LABEL_129;
        }
        BOOL v53 = 1;
        if (v43 >= 3) {
          BOOL v53 = (v43 & (v43 - 1)) != 0;
        }
        unint64_t v54 = v53 | (2 * v43);
        unint64_t v55 = vcvtps_u32_f32(v51 / v52);
        if (v54 <= v55) {
          int8x8_t prime = (int8x8_t)v55;
        }
        else {
          int8x8_t prime = (int8x8_t)v54;
        }
        if (*(void *)&prime == 1)
        {
          int8x8_t prime = (int8x8_t)2;
        }
        else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
        {
          int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        }
        unint64_t v43 = *(void *)&v39[2]._os_unfair_lock_opaque;
        if (*(void *)&prime > v43) {
          goto LABEL_86;
        }
        if (*(void *)&prime < v43)
        {
          unint64_t v63 = vcvtps_u32_f32((float)*(unint64_t *)&v39[6]._os_unfair_lock_opaque / *(float *)&v39[8]._os_unfair_lock_opaque);
          if (v43 < 3 || (uint8x8_t v64 = (uint8x8_t)vcnt_s8((int8x8_t)v43), v64.i16[0] = vaddlv_u8(v64), v64.u32[0] > 1uLL))
          {
            unint64_t v63 = std::__next_prime(v63);
          }
          else
          {
            uint64_t v65 = 1 << -(char)__clz(v63 - 1);
            if (v63 >= 2) {
              unint64_t v63 = v65;
            }
          }
          if (*(void *)&prime <= v63) {
            int8x8_t prime = (int8x8_t)v63;
          }
          if (*(void *)&prime >= v43)
          {
            unint64_t v43 = *(void *)&v39[2]._os_unfair_lock_opaque;
          }
          else
          {
            if (prime)
            {
LABEL_86:
              if (*(void *)&prime >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              uint64_t v57 = operator new(8 * *(void *)&prime);
              int v58 = *(void **)&v39->_os_unfair_lock_opaque;
              *(void *)&v39->_os_unfair_lock_opaque = v57;
              if (v58) {
                operator delete(v58);
              }
              uint64_t v59 = 0;
              *(int8x8_t *)&v39[2]._os_unfair_lock_opaque = prime;
              do
                *(void *)(*(void *)&v39->_os_unfair_lock_opaque + 8 * v59++) = 0;
              while (*(void *)&prime != v59);
              uint64_t v60 = *(void **)&v50->_os_unfair_lock_opaque;
              if (*(void *)&v50->_os_unfair_lock_opaque)
              {
                unint64_t v61 = v60[1];
                uint8x8_t v62 = (uint8x8_t)vcnt_s8(prime);
                v62.i16[0] = vaddlv_u8(v62);
                if (v62.u32[0] > 1uLL)
                {
                  if (v61 >= *(void *)&prime) {
                    v61 %= *(void *)&prime;
                  }
                }
                else
                {
                  v61 &= *(void *)&prime - 1;
                }
                *(void *)(*(void *)&v39->_os_unfair_lock_opaque + 8 * v61) = v50;
                uint64_t v66 = (void *)*v60;
                if (*v60)
                {
                  do
                  {
                    unint64_t v67 = v66[1];
                    if (v62.u32[0] > 1uLL)
                    {
                      if (v67 >= *(void *)&prime) {
                        v67 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v67 &= *(void *)&prime - 1;
                    }
                    if (v67 != v61)
                    {
                      if (!*(void *)(*(void *)&v39->_os_unfair_lock_opaque + 8 * v67))
                      {
                        *(void *)(*(void *)&v39->_os_unfair_lock_opaque + 8 * v67) = v60;
                        goto LABEL_111;
                      }
                      *uint64_t v60 = *v66;
                      *uint64_t v66 = **(void **)(*(void *)&v39->_os_unfair_lock_opaque + 8 * v67);
                      **(void **)(*(void *)&v39->_os_unfair_lock_opaque + 8 * v67) = v66;
                      uint64_t v66 = v60;
                    }
                    unint64_t v67 = v61;
LABEL_111:
                    uint64_t v60 = v66;
                    uint64_t v66 = (void *)*v66;
                    unint64_t v61 = v67;
                  }
                  while (v66);
                }
              }
              unint64_t v43 = (unint64_t)prime;
              goto LABEL_115;
            }
            v103 = *(void **)&v39->_os_unfair_lock_opaque;
            *(void *)&v39->_os_unfair_lock_opaque = 0;
            if (v103) {
              operator delete(v103);
            }
            unint64_t v43 = 0;
            *(void *)&v39[2]._os_unfair_lock_opaque = 0;
          }
        }
LABEL_115:
        if ((v43 & (v43 - 1)) != 0)
        {
          if (v42 >= v43) {
            unint64_t v19 = v42 % v43;
          }
          else {
            unint64_t v19 = v42;
          }
        }
        else
        {
          unint64_t v19 = (v43 - 1) & v42;
        }
        goto LABEL_120;
      }
      long long v123 = v31;
      atomic_fetch_add_explicit((atomic_ullong *volatile)v30 + 1, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit((atomic_ullong *volatile)v30 + 2, 1uLL, memory_order_relaxed);
      *((void *)v30 + 3) = v30 + 24;
      *((void *)v30 + 4) = v30;
      std::__shared_weak_count::__release_weak(v32);
    }
    else
    {
      long long v123 = v31;
      atomic_fetch_add_explicit((atomic_ullong *volatile)v30 + 1, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit((atomic_ullong *volatile)v30 + 2, 1uLL, memory_order_relaxed);
      *((void *)v30 + 3) = v30 + 24;
      *((void *)v30 + 4) = v30;
      unint64_t v20 = v17 + 24;
    }
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v30);
    long long v31 = v123;
    goto LABEL_40;
  }
  AMCP::Log::Scope_Registry::get(0);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&buf, "com.apple.coreaudio", "AMCP");
  unsigned int v29 = *(NSObject **)&buf->_os_unfair_lock_opaque;
  AMCP::Log::Scope::get_os_log_t(*(id *)&buf->_os_unfair_lock_opaque);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)buf_8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)buf_8);
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v104 = pthread_self();
    mach_port_t v105 = pthread_mach_thread_np(v104);
    LODWORD(buf) = 67109634;
    HIDWORD(buf) = v105;
    *(_WORD *)buf_8 = 2080;
    *(void *)&buf_8[2] = "Core_Audio_Driver.mm";
    *(_WORD *)&buf_8[10] = 1024;
    *(_DWORD *)&buf_8[12] = 274;
    _os_log_error_impl(&dword_1BAA78000, v29, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d io messenger/buffer is nil", (uint8_t *)&buf, 0x18u);
  }

  return 1852797029;
}

- (void)abort_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5 reply:(id)a6
{
  id v10 = a6;
  unint64_t v11 = [(Core_Audio_Driver *)self concurrent_queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __75__Core_Audio_Driver_abort_device_configuration_change_action_change_reply___block_invoke;
  block[3] = &__block_descriptor_72_ea8_32c89_ZTSKZ75__Core_Audio_Driver_abort_device_configuration_change_action_change_reply__E4__10_e5_v8__0l;
  uint64_t v12 = self;
  os_unfair_lock_t v13 = _Block_copy(v10);
  id v14 = v12;
  unint64_t v16 = v14;
  unsigned int v17 = a3;
  unint64_t v18 = a4;
  unint64_t v19 = a5;
  id v20 = _Block_copy(v13);
  dispatch_async(v11, block);
}

- (void)perform_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5 reply:(id)a6
{
  id v10 = a6;
  unint64_t v11 = [(Core_Audio_Driver *)self concurrent_queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __77__Core_Audio_Driver_perform_device_configuration_change_action_change_reply___block_invoke;
  block[3] = &__block_descriptor_72_ea8_32c90_ZTSKZ77__Core_Audio_Driver_perform_device_configuration_change_action_change_reply__E3__9_e5_v8__0l;
  uint64_t v12 = self;
  os_unfair_lock_t v13 = _Block_copy(v10);
  id v14 = v12;
  unint64_t v16 = v14;
  unsigned int v17 = a3;
  unint64_t v18 = a4;
  unint64_t v19 = a5;
  id v20 = _Block_copy(v13);
  dispatch_async(v11, block);
}

- (void)initialize:(id)a3 reply:(id)a4
{
  uint64_t v6 = 2003329396;
  id v7 = a3;
  uint64_t v8 = (void (**)(id, uint64_t))a4;
  uint64_t v9 = [(Core_Audio_Driver *)self asp_interface];
  id v10 = [[Core_Audio_Driver_Host_Proxy alloc] init_with_host_endpoint:v7 driver:self];
  [(Core_Audio_Driver *)self setDriver_host_proxy:v10];

  unint64_t v11 = [(Core_Audio_Driver *)self driver_host_proxy];
  uint64_t v12 = objc_msgSend(v11, "get_host_interface");

  if (v9 && v12) {
    uint64_t v6 = ((uint64_t (*)(AudioServerPlugInDriverInterface **, uint64_t))(*v9)->Initialize)(v9, v12);
  }
  v8[2](v8, v6);
}

- (void)store_change_info:(void *)a3 for_token:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  [(Core_Audio_Driver *)self config_change_info_lock];
  id v7 = *(os_unfair_lock_s **)buf;
  os_unfair_lock_lock(*(os_unfair_lock_t *)buf);
  if (*(void *)v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v40);
  }
  uint64_t v8 = (AMCP::Log::Scope_Registry *)[(Core_Audio_Driver *)self config_change_info_map];
  uint64_t v9 = v37;
  unint64_t v11 = v37 + 1;
  id v10 = v37[1];
  if (v10)
  {
    uint64_t v12 = v37 + 1;
    os_unfair_lock_t v13 = v37[1];
    do
    {
      unint64_t v14 = v13[4];
      BOOL v15 = v14 >= a4;
      if (v14 >= a4) {
        unint64_t v16 = (uint64_t **)v13;
      }
      else {
        unint64_t v16 = (uint64_t **)(v13 + 1);
      }
      if (v15) {
        uint64_t v12 = (uint64_t **)v13;
      }
      os_unfair_lock_t v13 = *v16;
    }
    while (*v16);
    if (v12 != v11 && (unint64_t)v12[4] <= a4)
    {
      AMCP::Log::Scope_Registry::get(v8);
      AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
      id v21 = **(NSObject ***)buf;
      AMCP::Log::Scope::get_os_log_t(**(id **)buf);
      objc_claimAutoreleasedReturnValue();
      if (*(void *)v40) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v40);
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = pthread_self();
        mach_port_t v23 = pthread_mach_thread_np(v22);
        *(_DWORD *)os_unfair_lock_t buf = 67109634;
        *(_DWORD *)&buf[4] = v23;
        *(_WORD *)long long v40 = 2080;
        *(void *)&v40[2] = "Core_Audio_Driver.mm";
        __int16 v41 = 1024;
        int v42 = 135;
        _os_log_error_impl(&dword_1BAA78000, v21, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Throwing Exception: change token/info item is already in the map", buf, 0x18u);
      }

      AMCP::Utility::With_Realtime_Disabled::With_Realtime_Disabled((AMCP::Utility::With_Realtime_Disabled *)&v36);
      __cxa_allocate_exception(0x40uLL);
      std::runtime_error::runtime_error(&v29, "change token/info item is already in the map!");
      std::runtime_error::runtime_error(&v30, &v29);
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      int v35 = -1;
      v30.__vftable = (std::runtime_error_vtbl *)&unk_1F148A9A8;
      long long v31 = &unk_1F148A9D0;
      boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>::clone_impl((uint64_t)buf, (uint64_t)&v30);
      unint64_t v43 = "-[Core_Audio_Driver store_change_info:for_token:]";
      uint8x8_t v44 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver.mm";
      int v45 = 135;
      applesauce::backtrace::snapshot_N<64>::snapshot_N((char **)&v24);
      uint64_t v26 = &unk_1F148AA90;
      long long v27 = v24;
      uint64_t v28 = v25;
      long long v24 = 0uLL;
      uint64_t v25 = 0;
      boost::exception_detail::set_info_rv<boost::error_info<applesauce::exceptions::tag_backtrace,applesauce::backtrace::snapshot_N<64>>>::set<boost::exception_detail::clone_impl<boost::exception_detail::error_info_injector<std::runtime_error>>>();
    }
    while (1)
    {
      while (1)
      {
        unsigned int v17 = (uint64_t **)v10;
        unint64_t v18 = v10[4];
        if (v18 <= a4) {
          break;
        }
        id v10 = *v17;
        unint64_t v11 = v17;
        if (!*v17) {
          goto LABEL_21;
        }
      }
      if (v18 >= a4) {
        break;
      }
      id v10 = v17[1];
      if (!v10)
      {
        unint64_t v11 = v17 + 1;
        goto LABEL_21;
      }
    }
  }
  else
  {
    unsigned int v17 = v37 + 1;
LABEL_21:
    unint64_t v19 = (uint64_t *)operator new(0x30uLL);
    v19[4] = a4;
    v19[5] = (uint64_t)a3;
    uint64_t *v19 = 0;
    v19[1] = 0;
    v19[2] = (uint64_t)v17;
    *unint64_t v11 = v19;
    id v20 = (uint64_t *)**v9;
    if (v20)
    {
      *uint64_t v9 = v20;
      unint64_t v19 = *v11;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v9[1], v19);
    v9[2] = (uint64_t *)((char *)v9[2] + 1);
  }
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
  os_unfair_lock_unlock(v7);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1493980];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 setInterruptionHandler:&__block_literal_global_14674];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__Core_Audio_Driver_listener_shouldAcceptNewConnection___block_invoke_2;
  v8[3] = &unk_1E6235418;
  v8[4] = self;
  [v5 setInvalidationHandler:v8];
  [v5 resume];

  return 1;
}

- (void)dealloc
{
  asp_interface = self->_asp_interface;
  if (asp_interface)
  {
    Release = (void (*)(void))(*asp_interface)->Release;
    if (Release)
    {
      Release();
      self->_asp_interface = 0;
    }
  }
  listener = self->_listener;
  if (listener)
  {
    [(NSXPCListener *)listener invalidate];
    uint64_t v6 = self->_listener;
    self->_listener = 0;
  }
  driver_host_proxy = self->_driver_host_proxy;
  self->_driver_host_proxy = 0;

  v8.receiver = self;
  v8.super_class = (Class)Core_Audio_Driver;
  [(Core_Audio_Driver *)&v8 dealloc];
}

- (id)init_driver_interface:(AudioServerPlugInDriverInterface *)a3 invalidation_handler:(function<void)(
{
  uint64_t v6 = [(Core_Audio_Driver *)self init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v7;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    [(NSXPCListener *)v6->_listener resume];
    uint64_t v9 = [(Core_Audio_Driver *)v6 listener];
    uint64_t v10 = [v9 endpoint];
    endpoint = v6->_endpoint;
    v6->_endpoint = (NSXPCListenerEndpoint *)v10;

    std::function<void ()(void)>::operator=(v6->_m_invalidation_handler.__f_.__buf_.__lx, (uint64_t)a4);
    v6->_asp_interface = a3;
    if (a3)
    {
      AddRef = (*a3)->AddRef;
      if (AddRef) {
        ((void (*)(AudioServerPlugInDriverInterface **))AddRef)(a3);
      }
    }
  }
  return v6;
}

- (Core_Audio_Driver)init
{
  v24.receiver = self;
  v24.super_class = (Class)Core_Audio_Driver;
  v2 = [(Core_Audio_Driver *)&v24 init];
  uint64_t v3 = v2;
  if (v2)
  {
    listener = v2->_listener;
    v2->_listener = 0;

    endpoint = v3->_endpoint;
    v3->_endpoint = 0;

    driver_host_proxy = v3->_driver_host_proxy;
    v3->_driver_host_proxy = 0;

    v3->_asp_interface = 0;
    v3->_host_interface = 0;
    uint64_t v7 = operator new(0x20uLL);
    v7[1] = 0;
    v7[2] = 0;
    void *v7 = &unk_1F147FE38;
    *((_DWORD *)v7 + 6) = 0;
    cntrl = (std::__shared_weak_count *)v3->_config_change_info_lock.__cntrl_;
    v3->_config_change_info_lock.__ptr_ = (unfair_lock *)(v7 + 3);
    v3->_config_change_info_lock.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    uint64_t v9 = operator new(0x30uLL);
    v9[1] = 0;
    v9[2] = 0;
    *uint64_t v9 = &unk_1F147FE88;
    v9[5] = 0;
    v9[4] = 0;
    v9[3] = v9 + 4;
    uint64_t v10 = (std::__shared_weak_count *)v3->_config_change_info_map.__cntrl_;
    v3->_config_change_info_map.__ptr_ = v9 + 3;
    v3->_config_change_info_map.__cntrl_ = (__shared_weak_count *)v9;
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    unint64_t v11 = (char *)operator new(0x40uLL);
    *((void *)v11 + 1) = 0;
    *((void *)v11 + 2) = 0;
    *(void *)unint64_t v11 = &unk_1F147FED8;
    *(_OWORD *)(v11 + 24) = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    *((_DWORD *)v11 + 14) = 1065353216;
    uint64_t v12 = (std::__shared_weak_count *)v3->_io_receivers.__cntrl_;
    v3->_io_receivers.__ptr_ = v11 + 24;
    v3->_io_receivers.__cntrl_ = (__shared_weak_count *)v11;
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    os_unfair_lock_t v13 = operator new(0x30uLL);
    v13[1] = 0;
    v13[2] = 0;
    *os_unfair_lock_t v13 = &unk_1F147FF28;
    v13[4] = 0;
    v13[5] = 0;
    v13[3] = 0;
    unint64_t v14 = (std::__shared_weak_count *)v3->_io_buffer_list.__cntrl_;
    v3->_io_buffer_list.__ptr_ = v13 + 3;
    v3->_io_buffer_list.__cntrl_ = (__shared_weak_count *)v13;
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    BOOL v15 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    unint64_t v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v17 = dispatch_queue_create("Property_Listener_Gateway IO Queue", v16);
    concurrent_queue = v3->_concurrent_queue;
    v3->_concurrent_queue = (OS_dispatch_queue *)v17;

    unint64_t v19 = (char *)operator new(0x70uLL);
    *((void *)v19 + 1) = 0;
    *((void *)v19 + 2) = 0;
    *(void *)unint64_t v19 = &unk_1F147FF78;
    *((void *)v19 + 4) = 0;
    *((void *)v19 + 5) = 0;
    *((void *)v19 + 3) = 0;
    *((void *)v19 + 6) = 850045863;
    *(_OWORD *)(v19 + 56) = 0u;
    *(_OWORD *)(v19 + 72) = 0u;
    *(_OWORD *)(v19 + 88) = 0u;
    *((void *)v19 + 13) = 0;
    id v20 = (std::__shared_weak_count *)v3->_m_custom_property_type_cache.__cntrl_;
    v3->_m_custom_property_type_cache.__ptr_ = (Property_Type_Info *)(v19 + 24);
    v3->_m_custom_property_type_cache.__cntrl_ = (__shared_weak_count *)v19;
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    id v21 = operator new(0x20uLL);
    v21[1] = 0;
    v21[2] = 0;
    *id v21 = &unk_1F147FE38;
    *((_DWORD *)v21 + 6) = 0;
    id v22 = (std::__shared_weak_count *)v3->_io_receiver_lock.__cntrl_;
    v3->_io_receiver_lock.__ptr_ = (unfair_lock *)(v21 + 3);
    v3->_io_receiver_lock.__cntrl_ = (__shared_weak_count *)v21;
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    std::__function::__value_func<void ()(void)>::operator=[abi:ne180100](v3->_m_invalidation_handler.__f_.__buf_.__lx);
  }
  return v3;
}

@end