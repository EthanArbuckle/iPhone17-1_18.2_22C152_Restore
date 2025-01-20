@interface Core_Audio_Driver_Host
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Core_Audio_Driver_Host)init;
- (Core_Audio_Driver_Host_Callback_Delegate)delegate;
- (NSXPCConnection)connection_from_driver;
- (NSXPCConnection)connection_to_driver;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)driver_endpoint;
- (NSXPCListenerEndpoint)endpoint;
- (Protocol)driver_host_protocol;
- (Protocol)driver_protocol;
- (function<void)m_invalidation_handler;
- (id).cxx_construct;
- (id)init_with_delegate:(id)a3;
- (int)abort_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5;
- (int)add_device_client:(unsigned int)a3 client_info:(const AudioServerPlugInClientInfo *)a4;
- (int)create_device:(id)a3 client_info:(const AudioServerPlugInClientInfo *)a4 out_object_id:(unsigned int *)a5;
- (int)destroy_device:(unsigned int)a3;
- (int)get_property_data:(Driver_Property_Identity *)a3 qualifier_data_size:(unsigned int)a4 qualifier_data:(const void *)a5 data_size:(unsigned int)a6 out_data_size:(unsigned int *)a7 out_data:(void *)a8;
- (int)get_property_data_size:(Driver_Property_Identity *)a3 qualifier_data_size:(unsigned int)a4 qualifier_data:(const void *)a5 out_size:(unsigned int *)a6;
- (int)has_property:(Driver_Property_Identity *)a3 out_has_property:(char *)a4;
- (int)initialize_driver:(id)a3;
- (int)is_property_settable:(Driver_Property_Identity *)a3 out_settable:(char *)a4;
- (int)object_was_destroyed:(unsigned int)a3;
- (int)perform_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5;
- (int)register_buffer:(id)a3;
- (int)remove_device_client:(unsigned int)a3 client_info:(const AudioServerPlugInClientInfo *)a4;
- (int)set_property_data:(Driver_Property_Identity *)a3 qualifier_data_size:(unsigned int)a4 qualifier_data:(const void *)a5 data_size:(unsigned int)a6 data:(const void *)a7;
- (int)start_io:(unsigned int)a3 client_info:(unsigned int)a4;
- (int)start_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4 nominal_sample_rate:(double)a5 io_buffer_frame_size:(unsigned int)a6 work_group_port:(unsigned int)a7 io_messenger:(id)a8;
- (int)stop_io:(unsigned int)a3 client_info:(unsigned int)a4;
- (int)stop_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4;
- (int)unregister_buffer:(id)a3;
- (shared_ptr<Property_Type_Info>)m_property_type_info;
- (shared_ptr<caulk::mach::unfair_lock>)config_change_lock;
- (unint64_t)current_config_change_token;
- (void)copy_storage_settings:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)delete_storage_settings:(id)a3 reply:(id)a4;
- (void)object_properties_changed:(unsigned int)a3 properties_data:(id)a4 reply:(id)a5;
- (void)request_config_change:(unsigned int)a3 change_action:(unint64_t)a4 reply:(id)a5;
- (void)retain_reply_for_process_boost;
- (void)setConnection_from_driver:(id)a3;
- (void)setConnection_to_driver:(id)a3;
- (void)setCurrent_config_change_token:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDriver_endpoint:(id)a3;
- (void)setDriver_host_protocol:(id)a3;
- (void)setDriver_protocol:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setListener:(id)a3;
- (void)setM_invalidation_handler:(function<void)(;
- (void)setM_property_type_info:(shared_ptr<Property_Type_Info>)a3;
- (void)set_invalidation_handler:(function<void)(;
- (void)write_storage_settings:(id)a3 storage_data:(id)a4 reply:(id)a5;
@end

@implementation Core_Audio_Driver_Host

- (id).cxx_construct
{
  *((void *)self + 17) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  return self;
}

- (void).cxx_destruct
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](self->_m_invalidation_handler.__f_.__buf_.__lx);
  cntrl = self->_config_change_lock.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_m_custom_property_type_cache.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
  objc_storeStrong((id *)&self->_driver_endpoint, 0);
  objc_storeStrong((id *)&self->_driver_host_protocol, 0);
  objc_storeStrong((id *)&self->_driver_protocol, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection_from_driver, 0);

  objc_storeStrong((id *)&self->_connection_to_driver, 0);
}

- (shared_ptr<caulk::mach::unfair_lock>)config_change_lock
{
  cntrl = self->_config_change_lock.__cntrl_;
  *v2 = self->_config_change_lock.__ptr_;
  v2[1] = (unfair_lock *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (unfair_lock *)self;
  return result;
}

- (void)setDriver_endpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)driver_endpoint
{
  return self->_driver_endpoint;
}

- (void)setM_invalidation_handler:(function<void)(
{
  std::function<void ()(void)>::operator=(self->_m_invalidation_handler.__f_.__buf_.__lx, (uint64_t)a3);
}

- (function<void)m_invalidation_handler
{
  return (function<void ()> *)std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)retstr, (uint64_t)&self->_m_invalidation_handler);
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

- (void)setDriver_host_protocol:(id)a3
{
}

- (Protocol)driver_host_protocol
{
  return self->_driver_host_protocol;
}

- (void)setDriver_protocol:(id)a3
{
}

- (Protocol)driver_protocol
{
  return self->_driver_protocol;
}

- (void)setCurrent_config_change_token:(unint64_t)a3
{
  self->_current_config_change_token = a3;
}

- (unint64_t)current_config_change_token
{
  return self->_current_config_change_token;
}

- (void)setDelegate:(id)a3
{
}

- (Core_Audio_Driver_Host_Callback_Delegate)delegate
{
  return self->_delegate;
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

- (void)setConnection_from_driver:(id)a3
{
}

- (NSXPCConnection)connection_from_driver
{
  return self->_connection_from_driver;
}

- (void)setConnection_to_driver:(id)a3
{
}

- (NSXPCConnection)connection_to_driver
{
  return self->_connection_to_driver;
}

- (int)set_property_data:(Driver_Property_Identity *)a3 qualifier_data_size:(unsigned int)a4 qualifier_data:(const void *)a5 data_size:(unsigned int)a6 data:(const void *)a7
{
  v28[0] = 2003329396;
  v13 = (void *)MEMORY[0x1C185A0A0](self, a2);
  v14 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3321888768;
  v27[2] = __94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data___block_invoke;
  v27[3] = &__block_descriptor_40_ea8_32c108_ZTSKZ94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data__E4__42_e17_v16__0__NSError_8l;
  v27[4] = v28;
  v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v27];

  if (v15)
  {
    [(Core_Audio_Driver_Host *)self m_property_type_info];
    unint64_t property_data_and_qualifier_type_code = Property_Type_Info::get_property_data_and_qualifier_type_code(v25, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
    if (v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v26);
    }
    if (a5)
    {
      if (((qword_1BB032340[HIDWORD(property_data_and_qualifier_type_code)] | qword_1BB0322A8[HIDWORD(property_data_and_qualifier_type_code)]) & 0xFF00000000) != 0) {
        unsigned int v17 = LODWORD(qword_1BB032340[HIDWORD(property_data_and_qualifier_type_code)]) | LODWORD(qword_1BB0322A8[HIDWORD(property_data_and_qualifier_type_code)]);
      }
      else {
        unsigned int v17 = a4;
      }
      AMCP::HAL::pack_property_data(SHIDWORD(property_data_and_qualifier_type_code), v17, (CFStringRef *)a5);
      a5 = (const void *)objc_claimAutoreleasedReturnValue();
    }
    if (property_data_and_qualifier_type_code > 0x12) {
      uint64_t v18 = 0x100000004;
    }
    else {
      uint64_t v18 = qword_1BB032340[property_data_and_qualifier_type_code] | qword_1BB0322A8[property_data_and_qualifier_type_code];
    }
    if ((v18 & 0xFF00000000) != 0) {
      unsigned int v19 = v18;
    }
    else {
      unsigned int v19 = a6;
    }
    v20 = AMCP::HAL::pack_property_data(property_data_and_qualifier_type_code, v19, (CFStringRef *)a7);
    long long v23 = *(_OWORD *)&a3->var0;
    AudioObjectPropertyElement mElement = a3->var2.mElement;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3321888768;
    v22[2] = __94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data___block_invoke_163;
    v22[3] = &__block_descriptor_40_ea8_32c108_ZTSKZ94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data__E4__43_e8_v12__0i8l;
    v22[4] = v28;
    objc_msgSend(v15, "set_property_data:qualifier:data:reply:", &v23, a5, v20, v22);
  }
  return v28[0];
}

- (int)get_property_data:(Driver_Property_Identity *)a3 qualifier_data_size:(unsigned int)a4 qualifier_data:(const void *)a5 data_size:(unsigned int)a6 out_data_size:(unsigned int *)a7 out_data:(void *)a8
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v31 = 2003329396;
  v15 = (void *)MEMORY[0x1C185A0A0](self, a2);
  v16 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3321888768;
  v30[2] = __112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data___block_invoke;
  v30[3] = &__block_descriptor_40_ea8_32c127_ZTSKZ112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data__E4__40_e17_v16__0__NSError_8l;
  v30[4] = &v31;
  unsigned int v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v30];

  if (v17)
  {
    v25 = v15;
    [(Core_Audio_Driver_Host *)self m_property_type_info];
    unint64_t property_data_and_qualifier_type_code = Property_Type_Info::get_property_data_and_qualifier_type_code(v32, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
    if (v33) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v33);
    }
    if (a5)
    {
      if (((qword_1BB032340[HIDWORD(property_data_and_qualifier_type_code)] | qword_1BB0322A8[HIDWORD(property_data_and_qualifier_type_code)]) & 0xFF00000000) != 0) {
        unsigned int v19 = LODWORD(qword_1BB032340[HIDWORD(property_data_and_qualifier_type_code)]) | LODWORD(qword_1BB0322A8[HIDWORD(property_data_and_qualifier_type_code)]);
      }
      else {
        unsigned int v19 = a4;
      }
      AMCP::HAL::pack_property_data(SHIDWORD(property_data_and_qualifier_type_code), v19, (CFStringRef *)a5);
      a5 = (const void *)objc_claimAutoreleasedReturnValue();
    }
    if (property_data_and_qualifier_type_code > 0x12) {
      uint64_t v20 = 0x100000004;
    }
    else {
      uint64_t v20 = qword_1BB032340[property_data_and_qualifier_type_code] | qword_1BB0322A8[property_data_and_qualifier_type_code];
    }
    if ((v20 & 0xFF00000000) != 0) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = a6;
    }
    id v29 = 0;
    long long v27 = *(_OWORD *)&a3->var0;
    AudioObjectPropertyElement mElement = a3->var2.mElement;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3321888768;
    v26[2] = __112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data___block_invoke_154;
    v26[3] = &__block_descriptor_48_ea8_32c127_ZTSKZ112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data__E4__41_e19_v20__0i8__NSData_12l;
    v26[4] = &v31;
    v26[5] = &v29;
    objc_msgSend(v17, "get_property_data:qualifier:data_size:reply:", &v27, a5, v21, v26);
    if (!v31)
    {
      id v22 = v29;
      if (v29)
      {
        *a7 = a6;
        int v31 = AMCP::HAL::unpack_property_data(v22, property_data_and_qualifier_type_code, a7, a8);
        if (a3->var2.mSelector == 1668641652)
        {
          unsigned int v23 = *a7;
          [(Core_Audio_Driver_Host *)self m_property_type_info];
          Property_Type_Info::add_custom_properties(v32, a3->var0, v23 / 0xCuLL, (const AudioServerPlugInCustomPropertyInfo *)a8);
          v15 = v25;
          if (v33) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v33);
          }
        }
      }
    }
  }
  return v31;
}

- (int)get_property_data_size:(Driver_Property_Identity *)a3 qualifier_data_size:(unsigned int)a4 qualifier_data:(const void *)a5 out_size:(unsigned int *)a6
{
  uint64_t v24 = 2003329396;
  v11 = (void *)MEMORY[0x1C185A0A0](self, a2);
  v12 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3321888768;
  v23[2] = __93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size___block_invoke;
  v23[3] = &__block_descriptor_40_ea8_32c107_ZTSKZ93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size__E4__38_e17_v16__0__NSError_8l;
  v23[4] = &v24;
  v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v23];

  if (v13)
  {
    [(Core_Audio_Driver_Host *)self m_property_type_info];
    int property_qualifier_type_code = Property_Type_Info::get_property_qualifier_type_code(v21, a3->var0, (AMCP::HAL *)a3->var2.mSelector);
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    if (a5)
    {
      if (((qword_1BB032340[property_qualifier_type_code] | qword_1BB0322A8[property_qualifier_type_code]) & 0xFF00000000) != 0) {
        unsigned int v15 = LODWORD(qword_1BB032340[property_qualifier_type_code]) | LODWORD(qword_1BB0322A8[property_qualifier_type_code]);
      }
      else {
        unsigned int v15 = a4;
      }
      AMCP::HAL::pack_property_data(property_qualifier_type_code, v15, (CFStringRef *)a5);
      a5 = (const void *)objc_claimAutoreleasedReturnValue();
    }
    long long v19 = *(_OWORD *)&a3->var0;
    AudioObjectPropertyElement mElement = a3->var2.mElement;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3321888768;
    v18[2] = __93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size___block_invoke_149;
    v18[3] = &__block_descriptor_48_ea8_32c107_ZTSKZ93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size__E4__39_e11_v16__0i8I12l;
    v18[4] = &v24;
    v18[5] = (char *)&v24 + 4;
    objc_msgSend(v13, "get_property_data_size:qualifier:reply:", &v19, a5, v18);

    unsigned int v16 = HIDWORD(v24);
  }
  else
  {
    unsigned int v16 = 0;
  }
  *a6 = v16;

  return v24;
}

- (int)is_property_settable:(Driver_Property_Identity *)a3 out_settable:(char *)a4
{
  char v17 = 0;
  int v16 = 2003329396;
  v7 = (void *)MEMORY[0x1C185A0A0](self, a2);
  v8 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = __60__Core_Audio_Driver_Host_is_property_settable_out_settable___block_invoke;
  v15[3] = &__block_descriptor_40_ea8_32c74_ZTSKZ60__Core_Audio_Driver_Host_is_property_settable_out_settable__E4__36_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];

  if (v9)
  {
    long long v13 = *(_OWORD *)&a3->var0;
    AudioObjectPropertyElement mElement = a3->var2.mElement;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3321888768;
    v12[2] = __60__Core_Audio_Driver_Host_is_property_settable_out_settable___block_invoke_143;
    v12[3] = &__block_descriptor_48_ea8_32c74_ZTSKZ60__Core_Audio_Driver_Host_is_property_settable_out_settable__E4__37_e11_v16__0i8C12l;
    v12[4] = &v16;
    v12[5] = &v17;
    objc_msgSend(v9, "is_property_settable:reply:", &v13, v12);
    char v10 = v17;
  }
  else
  {
    char v10 = 0;
  }
  *a4 = v10;

  return v16;
}

- (int)has_property:(Driver_Property_Identity *)a3 out_has_property:(char *)a4
{
  unsigned int v15 = a4;
  int v14 = 0;
  v6 = (void *)MEMORY[0x1C185A0A0](self, a2);
  v7 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = __56__Core_Audio_Driver_Host_has_property_out_has_property___block_invoke;
  v13[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_has_property_out_has_property__E4__34_e17_v16__0__NSError_8l;
  v13[4] = &v14;
  v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];

  if (v8)
  {
    long long v11 = *(_OWORD *)&a3->var0;
    AudioObjectPropertyElement mElement = a3->var2.mElement;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3321888768;
    v10[2] = __56__Core_Audio_Driver_Host_has_property_out_has_property___block_invoke_137;
    v10[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_has_property_out_has_property__E4__35_e8_v12__0C8l;
    v10[4] = &v15;
    objc_msgSend(v8, "has_property:reply:", &v11, v10);
  }

  return v14;
}

- (int)unregister_buffer:(id)a3
{
  id v4 = a3;
  int v13 = 0;
  v5 = (void *)MEMORY[0x1C185A0A0]();
  v6 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3321888768;
  v12[2] = __44__Core_Audio_Driver_Host_unregister_buffer___block_invoke;
  v12[3] = &__block_descriptor_40_ea8_32c58_ZTSKZ44__Core_Audio_Driver_Host_unregister_buffer__E4__32_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];

  if (v7)
  {
    v8 = +[Core_Audio_XPC_Raw_Transporter object:v4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3321888768;
    v11[2] = __44__Core_Audio_Driver_Host_unregister_buffer___block_invoke_132;
    v11[3] = &__block_descriptor_40_ea8_32c58_ZTSKZ44__Core_Audio_Driver_Host_unregister_buffer__E4__33_e8_v12__0i8l;
    v11[4] = &v13;
    objc_msgSend(v7, "unregister_io_buffer:reply:", v8, v11);
  }
  int v9 = v13;

  return v9;
}

- (int)register_buffer:(id)a3
{
  id v4 = a3;
  int v13 = 0;
  v5 = (void *)MEMORY[0x1C185A0A0]();
  v6 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3321888768;
  v12[2] = __42__Core_Audio_Driver_Host_register_buffer___block_invoke;
  v12[3] = &__block_descriptor_40_ea8_32c56_ZTSKZ42__Core_Audio_Driver_Host_register_buffer__E4__30_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];

  if (v7)
  {
    v8 = +[Core_Audio_XPC_Raw_Transporter object:v4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3321888768;
    v11[2] = __42__Core_Audio_Driver_Host_register_buffer___block_invoke_127;
    v11[3] = &__block_descriptor_40_ea8_32c56_ZTSKZ42__Core_Audio_Driver_Host_register_buffer__E4__31_e8_v12__0i8l;
    v11[4] = &v13;
    objc_msgSend(v7, "register_io_buffer:reply:", v8, v11);
  }
  int v9 = v13;

  return v9;
}

- (void)retain_reply_for_process_boost
{
  v2 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = __56__Core_Audio_Driver_Host_retain_reply_for_process_boost__block_invoke;
  v5[3] = &__block_descriptor_33_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_retain_reply_for_process_boost_E4__28_e17_v16__0__NSError_8l;
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v5];

  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3321888768;
    v4[2] = __56__Core_Audio_Driver_Host_retain_reply_for_process_boost__block_invoke_123;
    v4[3] = &__block_descriptor_33_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_retain_reply_for_process_boost_E4__29_e5_v8__0l;
    objc_msgSend(v3, "retain_reply_for_process_boost:", v4);
  }
}

- (int)stop_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int v12 = 0;
  v6 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = __63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id___block_invoke;
  v11[3] = &__block_descriptor_33_ea8_32c77_ZTSKZ63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id__E4__26_e17_v16__0__NSError_8l;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];

  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3321888768;
    v10[2] = __63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id___block_invoke_119;
    v10[3] = &__block_descriptor_40_ea8_32c77_ZTSKZ63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id__E4__27_e8_v12__0i8l;
    v10[4] = &v12;
    objc_msgSend(v7, "stop_synchronous_messenger:client_id:reply:", v5, v4, v10);
    int v8 = v12;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (int)start_synchronous_messenger:(unsigned int)a3 client_id:(unsigned int)a4 nominal_sample_rate:(double)a5 io_buffer_frame_size:(unsigned int)a6 work_group_port:(unsigned int)a7 io_messenger:(id)a8
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = *(void *)&a4;
  uint64_t v11 = *(void *)&a3;
  id v13 = a8;
  int v23 = 0;
  int v14 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3321888768;
  v22[2] = __134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger___block_invoke;
  v22[3] = &__block_descriptor_33_ea8_32c149_ZTSKZ134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger__E4__24_e17_v16__0__NSError_8l;
  unsigned int v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v22];

  if (v15)
  {
    int v16 = (void *)xpc_mach_send_create();
    char v17 = +[Core_Audio_XPC_Raw_Transporter object:v16];
    uint64_t v18 = +[Core_Audio_XPC_Raw_Transporter object:v13];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3321888768;
    v21[2] = __134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger___block_invoke_115;
    v21[3] = &__block_descriptor_40_ea8_32c149_ZTSKZ134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger__E4__25_e8_v12__0i8l;
    v21[4] = &v23;
    objc_msgSend(v15, "start_synchronous_messenger:client_id:nominal_sample_rate:io_buffer_frame_size:work_group_port:io_messenger:reply:", v11, v10, v8, v17, v18, v21, a5);

    int v19 = v23;
  }
  else
  {
    int v19 = 0;
  }

  return v19;
}

- (int)stop_io:(unsigned int)a3 client_info:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int v12 = 0;
  v6 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = __46__Core_Audio_Driver_Host_stop_io_client_info___block_invoke;
  v11[3] = &__block_descriptor_33_ea8_32c60_ZTSKZ46__Core_Audio_Driver_Host_stop_io_client_info__E4__22_e17_v16__0__NSError_8l;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];

  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3321888768;
    v10[2] = __46__Core_Audio_Driver_Host_stop_io_client_info___block_invoke_110;
    v10[3] = &__block_descriptor_40_ea8_32c60_ZTSKZ46__Core_Audio_Driver_Host_stop_io_client_info__E4__23_e8_v12__0i8l;
    v10[4] = &v12;
    objc_msgSend(v7, "stop_io:client_id:reply:", v5, v4, v10);
    int v8 = v12;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (int)start_io:(unsigned int)a3 client_info:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int v12 = 0;
  v6 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = __47__Core_Audio_Driver_Host_start_io_client_info___block_invoke;
  v11[3] = &__block_descriptor_33_ea8_32c61_ZTSKZ47__Core_Audio_Driver_Host_start_io_client_info__E4__20_e17_v16__0__NSError_8l;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];

  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3321888768;
    v10[2] = __47__Core_Audio_Driver_Host_start_io_client_info___block_invoke_106;
    v10[3] = &__block_descriptor_40_ea8_32c61_ZTSKZ47__Core_Audio_Driver_Host_start_io_client_info__E4__21_e8_v12__0i8l;
    v10[4] = &v12;
    objc_msgSend(v7, "start_io:client_id:reply:", v5, v4, v10);
    int v8 = v12;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (int)object_was_destroyed:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v13 = 2003329396;
  uint64_t v5 = (void *)MEMORY[0x1C185A0A0](self, a2);
  v6 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3321888768;
  v12[2] = __47__Core_Audio_Driver_Host_object_was_destroyed___block_invoke;
  v12[3] = &__block_descriptor_40_ea8_32c61_ZTSKZ47__Core_Audio_Driver_Host_object_was_destroyed__E4__18_e17_v16__0__NSError_8l;
  v12[4] = &v13;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = __47__Core_Audio_Driver_Host_object_was_destroyed___block_invoke_102;
  v11[3] = &__block_descriptor_40_ea8_32c61_ZTSKZ47__Core_Audio_Driver_Host_object_was_destroyed__E4__19_e8_v12__0i8l;
  void v11[4] = &v13;
  objc_msgSend(v7, "object_was_destroyed:reply:", v3, v11);
  [(Core_Audio_Driver_Host *)self m_property_type_info];
  Property_Type_Info::remove_custom_properties(v9, v3);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }

  return v13;
}

- (int)destroy_device:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v11 = 2003329396;
  uint64_t v5 = (void *)MEMORY[0x1C185A0A0](self, a2);
  v6 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  v10[2] = __41__Core_Audio_Driver_Host_destroy_device___block_invoke;
  v10[3] = &__block_descriptor_40_ea8_32c55_ZTSKZ41__Core_Audio_Driver_Host_destroy_device__E4__16_e17_v16__0__NSError_8l;
  v10[4] = &v11;
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3321888768;
  v9[2] = __41__Core_Audio_Driver_Host_destroy_device___block_invoke_97;
  v9[3] = &__block_descriptor_40_ea8_32c55_ZTSKZ41__Core_Audio_Driver_Host_destroy_device__E4__17_e8_v12__0i8l;
  v9[4] = &v11;
  objc_msgSend(v7, "destroy_device:reply:", v3, v9);

  return v11;
}

- (int)create_device:(id)a3 client_info:(const AudioServerPlugInClientInfo *)a4 out_object_id:(unsigned int *)a5
{
  id v8 = a3;
  uint64_t v20 = a5;
  int v19 = 2003329396;
  int v9 = (void *)MEMORY[0x1C185A0A0]();
  uint64_t v10 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3321888768;
  v18[2] = __66__Core_Audio_Driver_Host_create_device_client_info_out_object_id___block_invoke;
  v18[3] = &__block_descriptor_40_ea8_32c80_ZTSKZ66__Core_Audio_Driver_Host_create_device_client_info_out_object_id__E4__14_e17_v16__0__NSError_8l;
  v18[4] = &v19;
  int v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v18];

  uint64_t mClientID = a4->mClientID;
  uint64_t mProcessID = a4->mProcessID;
  BOOL v14 = a4->mIsNativeEndian != 0;
  CFStringRef mBundleID = a4->mBundleID;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3321888768;
  v17[2] = __66__Core_Audio_Driver_Host_create_device_client_info_out_object_id___block_invoke_91;
  v17[3] = &__block_descriptor_48_ea8_32c80_ZTSKZ66__Core_Audio_Driver_Host_create_device_client_info_out_object_id__E4__15_e11_v16__0i8I12l;
  v17[4] = &v19;
  v17[5] = &v20;
  objc_msgSend(v11, "create_device:client_id:process_id:is_native_endianess:bundle_id:reply:", v8, mClientID, mProcessID, v14, mBundleID, v17);

  LODWORD(v9) = v19;

  return (int)v9;
}

- (int)remove_device_client:(unsigned int)a3 client_info:(const AudioServerPlugInClientInfo *)a4
{
  uint64_t v5 = *(void *)&a3;
  int v17 = 2003329396;
  v7 = (void *)MEMORY[0x1C185A0A0](self, a2);
  id v8 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3321888768;
  v16[2] = __59__Core_Audio_Driver_Host_remove_device_client_client_info___block_invoke;
  v16[3] = &__block_descriptor_40_ea8_32c73_ZTSKZ59__Core_Audio_Driver_Host_remove_device_client_client_info__E4__12_e17_v16__0__NSError_8l;
  v16[4] = &v17;
  int v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v16];

  uint64_t mClientID = a4->mClientID;
  uint64_t mProcessID = a4->mProcessID;
  BOOL v12 = a4->mIsNativeEndian != 0;
  CFStringRef mBundleID = a4->mBundleID;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = __59__Core_Audio_Driver_Host_remove_device_client_client_info___block_invoke_86;
  v15[3] = &__block_descriptor_40_ea8_32c73_ZTSKZ59__Core_Audio_Driver_Host_remove_device_client_client_info__E4__13_e8_v12__0i8l;
  v15[4] = &v17;
  objc_msgSend(v9, "remove_device_client:client_id:process_id:is_native_endianess:bundle_id:reply:", v5, mClientID, mProcessID, v12, mBundleID, v15);

  return v17;
}

- (int)add_device_client:(unsigned int)a3 client_info:(const AudioServerPlugInClientInfo *)a4
{
  uint64_t v5 = *(void *)&a3;
  int v17 = 2003329396;
  v7 = (void *)MEMORY[0x1C185A0A0](self, a2);
  id v8 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3321888768;
  v16[2] = __56__Core_Audio_Driver_Host_add_device_client_client_info___block_invoke;
  v16[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_add_device_client_client_info__E4__10_e17_v16__0__NSError_8l;
  v16[4] = &v17;
  int v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v16];

  uint64_t mClientID = a4->mClientID;
  uint64_t mProcessID = a4->mProcessID;
  BOOL v12 = a4->mIsNativeEndian != 0;
  CFStringRef mBundleID = a4->mBundleID;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = __56__Core_Audio_Driver_Host_add_device_client_client_info___block_invoke_81;
  v15[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ56__Core_Audio_Driver_Host_add_device_client_client_info__E4__11_e8_v12__0i8l;
  v15[4] = &v17;
  objc_msgSend(v9, "add_device_client:client_id:process_id:is_native_endianess:bundle_id:reply:", v5, mClientID, mProcessID, v12, mBundleID, v15);

  return v17;
}

- (int)abort_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  int v15 = 2003329396;
  int v9 = (void *)MEMORY[0x1C185A0A0](self, a2);
  uint64_t v10 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = __74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change___block_invoke;
  v14[3] = &__block_descriptor_40_ea8_32c87_ZTSKZ74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change__E3__8_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  int v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v14];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = __74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change___block_invoke_76;
  v13[3] = &__block_descriptor_40_ea8_32c87_ZTSKZ74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change__E3__9_e8_v12__0i8l;
  v13[4] = &v15;
  objc_msgSend(v11, "abort_device_configuration_change:action:change:reply:", v7, a4, a5, v13);

  return v15;
}

- (int)perform_device_configuration_change:(unsigned int)a3 action:(unint64_t)a4 change:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  int v15 = 2003329396;
  int v9 = (void *)MEMORY[0x1C185A0A0](self, a2);
  uint64_t v10 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = __76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change___block_invoke;
  v14[3] = &__block_descriptor_40_ea8_32c89_ZTSKZ76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change__E3__6_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  int v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v14];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = __76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change___block_invoke_71;
  v13[3] = &__block_descriptor_40_ea8_32c89_ZTSKZ76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change__E3__7_e8_v12__0i8l;
  v13[4] = &v15;
  objc_msgSend(v11, "perform_device_configuration_change:action:change:reply:", v7, a4, a5, v13);

  return v15;
}

- (void)set_invalidation_handler:(function<void)(
{
  v4[4] = *MEMORY[0x1E4F143B8];
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v4, (uint64_t)a3);
  [(Core_Audio_Driver_Host *)self setM_invalidation_handler:v4];
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v4);
}

- (int)initialize_driver:(id)a3
{
  id v4 = a3;
  int v29 = 2003329396;
  uint64_t v5 = (void *)MEMORY[0x1C185A0A0]();
  v6 = [(Core_Audio_Driver_Host *)self driver_endpoint];

  if (!v6) {
    [(Core_Audio_Driver_Host *)self setDriver_endpoint:v4];
  }
  uint64_t v7 = [(Core_Audio_Driver_Host *)self connection_to_driver];

  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29268]);
    int v9 = [(Core_Audio_Driver_Host *)self driver_endpoint];
    uint64_t v10 = (void *)[v8 initWithListenerEndpoint:v9];
    [(Core_Audio_Driver_Host *)self setConnection_to_driver:v10];

    int v11 = [(Core_Audio_Driver_Host *)self connection_to_driver];

    if (v11)
    {
      BOOL v12 = (void *)MEMORY[0x1E4F29280];
      int v13 = [(Core_Audio_Driver_Host *)self driver_protocol];
      BOOL v14 = [v12 interfaceWithProtocol:v13];
      int v15 = [(Core_Audio_Driver_Host *)self connection_to_driver];
      [v15 setRemoteObjectInterface:v14];

      int v16 = self;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __44__Core_Audio_Driver_Host_initialize_driver___block_invoke;
      v27[3] = &unk_1E6235418;
      int v17 = v16;
      v28 = v17;
      uint64_t v18 = [(Core_Audio_Driver_Host *)v17 connection_to_driver];
      [v18 setInvalidationHandler:v27];

      int v19 = [(Core_Audio_Driver_Host *)v17 connection_to_driver];
      [v19 resume];
    }
  }
  uint64_t v20 = [(Core_Audio_Driver_Host *)self connection_to_driver];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3321888768;
  v26[2] = __44__Core_Audio_Driver_Host_initialize_driver___block_invoke_2;
  v26[3] = &__block_descriptor_33_ea8_32c57_ZTSKZ44__Core_Audio_Driver_Host_initialize_driver__E3__4_e17_v16__0__NSError_8l;
  uint64_t v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v26];

  if (v21)
  {
    id v22 = [(Core_Audio_Driver_Host *)self endpoint];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3321888768;
    v25[2] = __44__Core_Audio_Driver_Host_initialize_driver___block_invoke_65;
    v25[3] = &__block_descriptor_40_ea8_32c57_ZTSKZ44__Core_Audio_Driver_Host_initialize_driver__E3__5_e8_v12__0i8l;
    v25[4] = &v29;
    [v21 initialize:v22 reply:v25];
  }
  int v23 = v29;

  return v23;
}

- (void)delete_storage_settings:(id)a3 reply:(id)a4
{
  id v9 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  uint64_t v7 = [(Core_Audio_Driver_Host *)self delegate];
  uint64_t v8 = objc_msgSend(v7, "delete_storage_settings:", v9);

  v6[2](v6, v8);
}

- (void)copy_storage_settings:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = [(Core_Audio_Driver_Host *)self delegate];
  unsigned int v11 = objc_msgSend(v8, "copy_storage_settings:", v6);
  CFTypeRef cf = v9;

  uint64_t v10 = AMCP::HAL::pack_property_data(15, 8u, (CFStringRef *)&cf);
  v7[2](v7, v11, v10);
  if (cf) {
    CFRelease(cf);
  }
}

- (void)write_storage_settings:(id)a3 storage_data:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  unsigned int v13 = 8;
  CFTypeRef cf = 0;
  AMCP::HAL::unpack_property_data(a4, 15, &v13, &cf);
  uint64_t v10 = [(Core_Audio_Driver_Host *)self delegate];
  uint64_t v11 = objc_msgSend(v10, "write_storage_settings:storage_data:", v8, cf);

  if (cf) {
    CFRelease(cf);
  }
  v9[2](v9, v11);
}

- (void)request_config_change:(unsigned int)a3 change_action:(unint64_t)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = (void (**)(id, void, unint64_t))a5;
  [(Core_Audio_Driver_Host *)self config_change_lock];
  os_unfair_lock_lock(lock);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  unint64_t v9 = [(Core_Audio_Driver_Host *)self current_config_change_token] + 1;
  [(Core_Audio_Driver_Host *)self setCurrent_config_change_token:v9];
  uint64_t v10 = [(Core_Audio_Driver_Host *)self delegate];
  if (v10)
  {
    uint64_t v11 = [(Core_Audio_Driver_Host *)self delegate];
    objc_msgSend(v11, "request_config_change:change_action:change_token:", v6, a4, v9);
  }
  v8[2](v8, 0, v9);
  os_unfair_lock_unlock(lock);
}

- (void)object_properties_changed:(unsigned int)a3 properties_data:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v12 = a4;
  id v8 = (void (**)(id, uint64_t))a5;
  if ([v12 length])
  {
    unint64_t v9 = [(Core_Audio_Driver_Host *)self delegate];
    uint64_t v10 = v9;
    if (v9) {
      objc_msgSend(v9, "object_properties_changed:data:", v6, v12);
    }

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 561211770;
  }
  v8[2](v8, v11);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F29280];
  uint64_t v7 = [(Core_Audio_Driver_Host *)self driver_host_protocol];
  id v8 = [v6 interfaceWithProtocol:v7];
  [v5 setExportedInterface:v8];

  [v5 setExportedObject:self];
  [v5 setInterruptionHandler:&__block_literal_global_5627];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__Core_Audio_Driver_Host_listener_shouldAcceptNewConnection___block_invoke_2;
  v10[3] = &unk_1E6235418;
  v10[4] = self;
  [v5 setInvalidationHandler:v10];
  [v5 resume];
  [(Core_Audio_Driver_Host *)self setConnection_from_driver:v5];

  return 1;
}

- (void)dealloc
{
  connection_to_driver = self->_connection_to_driver;
  if (connection_to_driver)
  {
    [(NSXPCConnection *)connection_to_driver invalidate];
    id v4 = self->_connection_to_driver;
    self->_connection_to_driver = 0;
  }
  connection_from_driver = self->_connection_from_driver;
  if (connection_from_driver)
  {
    [(NSXPCConnection *)connection_from_driver invalidate];
    uint64_t v6 = self->_connection_from_driver;
    self->_connection_from_driver = 0;
  }
  listener = self->_listener;
  if (listener)
  {
    [(NSXPCListener *)listener invalidate];
    id v8 = self->_listener;
    self->_listener = 0;
  }
  delegate = self->_delegate;
  if (delegate)
  {
    self->_delegate = 0;
  }
  endpoint = self->_endpoint;
  if (endpoint)
  {
    self->_endpoint = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)Core_Audio_Driver_Host;
  [(Core_Audio_Driver_Host *)&v11 dealloc];
}

- (id)init_with_delegate:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(Core_Audio_Driver_Host *)self init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v7;
}

- (Core_Audio_Driver_Host)init
{
  v12.receiver = self;
  v12.super_class = (Class)Core_Audio_Driver_Host;
  id v2 = [(Core_Audio_Driver_Host *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29290] anonymousListener];
    id v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    [*((id *)v2 + 3) setDelegate:v2];
    [*((id *)v2 + 3) resume];
    uint64_t v5 = [*((id *)v2 + 3) endpoint];
    uint64_t v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    uint64_t v7 = operator new(0x20uLL);
    v7[1] = 0;
    v7[2] = 0;
    void *v7 = &unk_1F147FE38;
    *((_DWORD *)v7 + 6) = 0;
    id v8 = (std::__shared_weak_count *)*((void *)v2 + 13);
    *((void *)v2 + 12) = v7 + 3;
    *((void *)v2 + 13) = v7;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    *((void *)v2 + 6) = 0;
    objc_storeStrong((id *)v2 + 7, &unk_1F1493980);
    objc_storeStrong((id *)v2 + 8, &unk_1F14927C0);
    unint64_t v9 = (char *)operator new(0x70uLL);
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = 0;
    *(void *)unint64_t v9 = &unk_1F147FF78;
    *((void *)v9 + 4) = 0;
    *((void *)v9 + 5) = 0;
    *((void *)v9 + 3) = 0;
    *((void *)v9 + 6) = 850045863;
    *(_OWORD *)(v9 + 56) = 0u;
    *(_OWORD *)(v9 + 72) = 0u;
    *(_OWORD *)(v9 + 88) = 0u;
    *((void *)v9 + 13) = 0;
    uint64_t v10 = (std::__shared_weak_count *)*((void *)v2 + 11);
    *((void *)v2 + 10) = v9 + 24;
    *((void *)v2 + 11) = v9;
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    std::__function::__value_func<void ()(void)>::operator=[abi:ne180100]((void *)v2 + 14);
  }
  return (Core_Audio_Driver_Host *)v2;
}

@end