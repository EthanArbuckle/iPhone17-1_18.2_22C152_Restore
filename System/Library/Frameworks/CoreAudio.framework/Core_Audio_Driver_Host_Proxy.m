@interface Core_Audio_Driver_Host_Proxy
- (AudioServerPlugInHostInterface)get_host_interface;
- (Core_Audio_Driver)driver;
- (Core_Audio_Driver_Host_Proxy)init;
- (DictionaryRef)driver_storage;
- (NSXPCConnection)connection_to_host;
- (PropertyListRef)copy_from_driver_storage:(StringRef)a3;
- (id).cxx_construct;
- (id)init_with_host_endpoint:(id)a3 driver:(id)a4;
- (int)delete_from_driver_storage:(StringRef)a3;
- (int)driver_properties_changed:(unsigned int)a3 properties_data:(id)a4;
- (int)driver_request_config_change:(unsigned int)a3 change_action:(unint64_t)a4 change_info:(void *)a5;
- (int)write_to_driver_storage:(StringRef)a3 property_list:(PropertyListRef)a4;
- (shared_ptr<Host_Interface>)host_interface;
- (shared_ptr<caulk::mach::unfair_lock>)driver_storage_lock;
- (void)setConnection_to_host:(id)a3;
- (void)setDriver:(id)a3;
- (void)setDriver_storage:(DictionaryRef)a3;
@end

@implementation Core_Audio_Driver_Host_Proxy

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_driver_storage_lock.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_host_interface.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
  objc_storeStrong((id *)&self->_driver, 0);
  mCFObject = self->_driver_storage.mObject.mCFObject;
  if (mCFObject) {
    CFRelease(mCFObject);
  }

  objc_storeStrong((id *)&self->_connection_to_host, 0);
}

- (void)setDriver:(id)a3
{
}

- (Core_Audio_Driver)driver
{
  return self->_driver;
}

- (void)setDriver_storage:(DictionaryRef)a3
{
  mCFObject = self->_driver_storage.mObject.mCFObject;
  v5 = *(const void **)a3.mObject.mCFObject;
  self->_driver_storage.mObject.mCFObject = *(__CFDictionary **)a3.mObject.mCFObject;
  if (v5) {
    CFRetain(v5);
  }
  if (mCFObject) {
    CFRelease(mCFObject);
  }
}

- (DictionaryRef)driver_storage
{
  v3 = v2;
  mCFObject = self->_driver_storage.mObject.mCFObject;
  if (mCFObject) {
    self = (Core_Audio_Driver_Host_Proxy *)CFRetain(self->_driver_storage.mObject.mCFObject);
  }
  *v3 = mCFObject;
  return (DictionaryRef)self;
}

- (shared_ptr<caulk::mach::unfair_lock>)driver_storage_lock
{
  cntrl = self->_driver_storage_lock.__cntrl_;
  *v2 = self->_driver_storage_lock.__ptr_;
  v2[1] = (unfair_lock *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (unfair_lock *)self;
  return result;
}

- (shared_ptr<Host_Interface>)host_interface
{
  cntrl = self->_host_interface.__cntrl_;
  *v2 = self->_host_interface.__ptr_;
  v2[1] = (Host_Interface *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Host_Interface *)self;
  return result;
}

- (void)setConnection_to_host:(id)a3
{
}

- (NSXPCConnection)connection_to_host
{
  return self->_connection_to_host;
}

- (int)driver_request_config_change:(unsigned int)a3 change_action:(unint64_t)a4 change_info:(void *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int v9 = 2003329396;
  int v31 = 2003329396;
  uint64_t v30 = 0;
  v10 = [(Core_Audio_Driver_Host_Proxy *)self connection_to_host];

  if (!v10)
  {
    AMCP::Log::Scope_Registry::get(v11);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v12 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v33) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v33);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v20 = pthread_self();
      mach_port_t v21 = pthread_mach_thread_np(v20);
      unint64_t v22 = 0;
      v23 = 0;
      int v24 = 47;
      do
      {
        v25 = &aLibraryCachesC_22[v22];
        if (v24 == 47) {
          v23 = &aLibraryCachesC_22[v22];
        }
        int v24 = v25[1];
        if (!v25[1]) {
          break;
        }
      }
      while (v22++ < 0xFFF);
      if (v23) {
        v27 = v23 + 1;
      }
      else {
        v27 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
      }
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v21;
      *(_WORD *)v33 = 2080;
      *(void *)&v33[2] = v27;
      __int16 v34 = 1024;
      int v35 = 232;
      _os_log_error_impl(&dword_1BAA78000, v12, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d No connection to host", buf, 0x18u);
    }
  }
  buf[0] = 0;
  v13 = [(Core_Audio_Driver_Host_Proxy *)self connection_to_host];
  BOOL v14 = v13 == 0;

  if (!v14)
  {
    v15 = [(Core_Audio_Driver_Host_Proxy *)self connection_to_host];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3321888768;
    v29[2] = __87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info___block_invoke;
    v29[3] = &__block_descriptor_48_ea8_32c101_ZTSKZ87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info__E4__12_e17_v16__0__NSError_8l;
    v29[4] = &v31;
    v29[5] = buf;
    v16 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v29];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3321888768;
    v28[2] = __87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info___block_invoke_41;
    v28[3] = &__block_descriptor_48_ea8_32c101_ZTSKZ87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info__E4__13_e11_v20__0i8Q12l;
    v28[4] = &v31;
    v28[5] = &v30;
    objc_msgSend(v16, "request_config_change:change_action:reply:", v7, a4, v28);
    v17 = [(Core_Audio_Driver_Host_Proxy *)self driver];
    objc_msgSend(v17, "store_change_info:for_token:", a5, v30);

    if (buf[0])
    {
      v18 = [(Core_Audio_Driver_Host_Proxy *)self connection_to_host];
      [v18 invalidate];
    }
    return v31;
  }
  return v9;
}

- (int)delete_from_driver_storage:(StringRef)a3
{
  int v10 = 0;
  v4 = [(Core_Audio_Driver_Host_Proxy *)self connection_to_host];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3321888768;
  v9[2] = __59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage___block_invoke;
  v9[3] = &__block_descriptor_40_ea8_32c73_ZTSKZ59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage__E4__10_e17_v16__0__NSError_8l;
  v9[4] = &v10;
  v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];

  isa = a3.var0.var0->isa;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage___block_invoke_33;
  v8[3] = &__block_descriptor_40_ea8_32c73_ZTSKZ59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage__E4__11_e8_v12__0i8l;
  v8[4] = &v10;
  objc_msgSend(v5, "delete_storage_settings:reply:", isa, v8);
  LODWORD(v4) = v10;

  return (int)v4;
}

- (int)write_to_driver_storage:(StringRef)a3 property_list:(PropertyListRef)a4
{
  int v15 = 0;
  v6 = [(Core_Audio_Driver_Host_Proxy *)self connection_to_host];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = __70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list___block_invoke;
  v14[3] = &__block_descriptor_40_ea8_32c83_ZTSKZ70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list__E3__8_e17_v16__0__NSError_8l;
  v14[4] = &v15;
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v14];
  int v8 = 560947818;

  CFStringRef v13 = *(CFStringRef *)a4.var0.var0;
  if (v13)
  {
    int v9 = AMCP::HAL::pack_property_data(15, 8u, &v13);
    if (v9)
    {
      isa = a3.var0.var0->isa;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3321888768;
      v12[2] = __70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list___block_invoke_28;
      v12[3] = &__block_descriptor_40_ea8_32c83_ZTSKZ70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list__E3__9_e8_v12__0i8l;
      v12[4] = &v15;
      objc_msgSend(v7, "write_storage_settings:storage_data:reply:", isa, v9, v12);
      int v8 = v15;
    }
  }
  return v8;
}

- (PropertyListRef)copy_from_driver_storage:(StringRef)a3
{
  v5 = v3;
  int v16 = 0;
  v6 = [(Core_Audio_Driver_Host_Proxy *)self connection_to_host];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3321888768;
  v15[2] = __57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage___block_invoke;
  v15[3] = &__block_descriptor_40_ea8_32c70_ZTSKZ57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage__E3__6_e17_v16__0__NSError_8l;
  v15[4] = &v16;
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v15];

  isa = a3.var0.var0->isa;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = __57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage___block_invoke_22;
  v13[3] = &__block_descriptor_48_ea8_32c70_ZTSKZ57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage__E3__7_e19_v20__0i8__NSData_12l;
  v13[4] = &v16;
  v13[5] = &v14;
  id v14 = 0;
  objc_msgSend(v7, "copy_storage_settings:reply:", isa, v13);
  id v9 = v14;
  if (v16 || !v14)
  {
    *(void *)v5 = 0;
  }
  else
  {
    unsigned int v12 = 8;
    CFTypeRef cf = 0;
    int v16 = AMCP::HAL::unpack_property_data(v14, 15, &v12, &cf);
    if (v16 || !cf)
    {
      *(void *)v5 = 0;
    }
    else
    {
      mcp_applesauce::CF::PropertyListRef::from_get(v5, cf);
      CFRelease(cf);
    }
    id v9 = v14;
  }

  return v10;
}

- (int)driver_properties_changed:(unsigned int)a3 properties_data:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  char v15 = 0;
  int v14 = 2003329396;
  uint64_t v7 = [(Core_Audio_Driver_Host_Proxy *)self connection_to_host];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3321888768;
  v13[2] = __74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data___block_invoke;
  v13[3] = &__block_descriptor_48_ea8_32c87_ZTSKZ74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data__E3__4_e17_v16__0__NSError_8l;
  v13[4] = &v14;
  v13[5] = &v15;
  int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3321888768;
  v12[2] = __74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data___block_invoke_16;
  v12[3] = &__block_descriptor_40_ea8_32c87_ZTSKZ74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data__E3__5_e8_v12__0i8l;
  v12[4] = &v14;
  objc_msgSend(v8, "object_properties_changed:properties_data:reply:", v4, v6, v12);
  if (v15)
  {
    id v9 = [(Core_Audio_Driver_Host_Proxy *)self connection_to_host];
    [v9 invalidate];
  }
  int v10 = v14;

  return v10;
}

- (AudioServerPlugInHostInterface)get_host_interface
{
  [(Core_Audio_Driver_Host_Proxy *)self host_interface];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return v3;
}

- (id)init_with_host_endpoint:(id)a3 driver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)Core_Audio_Driver_Host_Proxy;
  id v8 = [(Core_Audio_Driver_Host_Proxy *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v6];
    int v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F14927C0];
    [*((id *)v8 + 1) setRemoteObjectInterface:v11];

    [*((id *)v8 + 1) resume];
    std::allocate_shared[abi:ne180100]<Host_Interface,std::allocator<Host_Interface>,Core_Audio_Driver_Host_Proxy * {__strong}&,void>(&v16, v8);
    unsigned int v12 = (std::__shared_weak_count *)*((void *)v8 + 5);
    *((_OWORD *)v8 + 2) = v16;
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    objc_storeStrong((id *)v8 + 3, a4);
    CFStringRef v13 = v8;
  }
  else
  {
    CFStringRef v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (Core_Audio_Driver_Host_Proxy)init
{
  v11.receiver = self;
  v11.super_class = (Class)Core_Audio_Driver_Host_Proxy;
  v2 = [(Core_Audio_Driver_Host_Proxy *)&v11 init];
  v3 = v2;
  if (v2)
  {
    connection_to_host = v2->_connection_to_host;
    v2->_connection_to_host = 0;

    std::allocate_shared[abi:ne180100]<Host_Interface,std::allocator<Host_Interface>,Core_Audio_Driver_Host_Proxy * {__strong}&,void>(&v10, v3);
    cntrl = (std::__shared_weak_count *)v3->_host_interface.__cntrl_;
    v3->_host_interface = v10;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    driver = v3->_driver;
    v3->_driver = 0;

    id v7 = v3;
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

@end