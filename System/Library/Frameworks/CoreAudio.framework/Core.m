@interface Core
@end

@implementation Core

uint64_t __66__Core_Audio_Driver_Registrar_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidate];
}

void __66__Core_Audio_Driver_Registrar_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "connection_infos");
  v4 = *(id **)v42;
  v3 = *(id **)(v42 + 8);
  if (*(id **)v42 == v3)
  {
LABEL_4:
    id v5 = 0;
    id v6 = 0;
  }
  else
  {
    while (*(id *)(a1 + 40) != v4[1])
    {
      v4 += 2;
      if (v4 == v3) {
        goto LABEL_4;
      }
    }
    id v5 = *v4;
    id v6 = v4[1];
  }
  if (*(void *)v43) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v43);
  }
  objc_sync_exit(v2);

  v7 = (AMCP::Log::Scope_Registry *)v5;
  v8 = v7;
  if (v7)
  {
    AMCP::Log::Scope_Registry::get(v7);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v42, "com.apple.coreaudio", "AMCP");
    v9 = *(NSObject **)v42;
    AMCP::Log::Scope::get_os_log_t(*(id *)v42);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v43) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v43);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = pthread_self();
      mach_port_t v11 = pthread_mach_thread_np(v10);
      unint64_t v12 = 0;
      v13 = 0;
      int v14 = 47;
      do
      {
        v15 = &aLibraryCachesC_4[v12];
        if (v14 == 47) {
          v13 = &aLibraryCachesC_4[v12];
        }
        int v14 = v15[1];
        if (!v15[1]) {
          break;
        }
        BOOL v16 = v12++ >= 0xFFF;
      }
      while (!v16);
      uint64_t v17 = [(AMCP::Log::Scope_Registry *)v8 UTF8String];
      if (v13) {
        v18 = v13 + 1;
      }
      else {
        v18 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Registrar.mm";
      }
      LODWORD(v42) = 67109890;
      HIDWORD(v42) = v11;
      *(_WORD *)v43 = 2080;
      *(void *)&v43[2] = v18;
      __int16 v44 = 1024;
      int v45 = 50;
      __int16 v46 = 2080;
      uint64_t v47 = v17;
      _os_log_impl(&dword_1BAA78000, v9, OS_LOG_TYPE_DEFAULT, "%6u %32s:%-5d Calling invalidation handler for bundle id %s", (uint8_t *)&v42, 0x22u);
    }

    std::function<void ()(NSString *,NSXPCConnection *)>::operator()([*(id *)(a1 + 32) registrar] + 16, v8, v6);
    v19 = *(id *)(a1 + 32);
    objc_sync_enter(v19);
    v20 = *(void **)(a1 + 32);
    if (v20)
    {
      objc_msgSend(v20, "connection_infos");
      uint64_t v21 = v42;
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v42 = 0;
      *(void *)v43 = 0;
    }
    v29 = *(void ***)v21;
    v30 = *(void ***)(v21 + 8);
    if (*(void ***)v21 == v30)
    {
      v30 = *(void ***)v21;
    }
    else
    {
      while (v6 != v29[1] || v8 != *v29)
      {
        v29 += 2;
        if (v29 == v30) {
          goto LABEL_42;
        }
      }
      if (v29 == v30)
      {
LABEL_42:
        v29 = *(void ***)(v21 + 8);
        goto LABEL_44;
      }
      v36 = v29 + 2;
      if (v29 + 2 != v30)
      {
        do
        {
          v37 = (AMCP::Log::Scope_Registry *)*v36;
          if (v6 != v36[1] || v8 != v37)
          {
            *v36 = 0;
            v39 = (AMCP::Log::Scope_Registry *)*v29;
            *v29 = v37;

            v40 = v36[1];
            v36[1] = 0;
            v41 = v29[1];
            v29[1] = v40;

            v29 += 2;
          }
          v36 += 2;
        }
        while (v36 != v30);
        v30 = *(void ***)(v21 + 8);
      }
    }
LABEL_44:
    v31 = v29 + 2;
    if (v29 + 2 != v30)
    {
      do
      {
        v32 = *v31;
        *v31 = 0;
        v33 = *(v31 - 2);
        *(v31 - 2) = v32;

        v34 = v31[1];
        v31[1] = 0;
        v35 = *(v31 - 1);
        *(v31 - 1) = v34;

        v31 += 2;
      }
      while (v31 != v30);
      v29 = v31 - 2;
    }
    std::vector<Registrar_Connection_Info>::__base_destruct_at_end[abi:ne180100](v21, (uint64_t)v29);
    if (*(void *)v43) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v43);
    }
    objc_sync_exit(v19);
  }
  else
  {
    AMCP::Log::Scope_Registry::get(0);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v42, "com.apple.coreaudio", "AMCP");
    v19 = *(NSObject **)v42;
    AMCP::Log::Scope::get_os_log_t(*(id *)v42);
    objc_claimAutoreleasedReturnValue();
    if (*(void *)v43) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v43);
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
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
        BOOL v16 = v24++ >= 0xFFF;
      }
      while (!v16);
      if (v25) {
        v28 = v25 + 1;
      }
      else {
        v28 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Registrar.mm";
      }
      LODWORD(v42) = 67109634;
      HIDWORD(v42) = v23;
      *(_WORD *)v43 = 2080;
      *(void *)&v43[2] = v28;
      __int16 v44 = 1024;
      int v45 = 46;
      _os_log_error_impl(&dword_1BAA78000, v19, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Invalidating connection but bundle id is nil!", (uint8_t *)&v42, 0x18u);
    }
  }
}

void __87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    v8 = 0;
    int v9 = 47;
    do
    {
      v10 = &aLibraryCachesC_22[v7];
      if (v9 == 47) {
        v8 = &aLibraryCachesC_22[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 240;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error sending request config change message to host: %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 1852797029;
  **(unsigned char **)(a1 + 40) = 1;
}

uint64_t __87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info___block_invoke_41(uint64_t result, int a2, uint64_t a3)
{
  v3 = *(void **)(result + 40);
  **(_DWORD **)(result + 32) = a2;
  void *v3 = a3;
  return result;
}

void __59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    v8 = 0;
    int v9 = 47;
    do
    {
      v10 = &aLibraryCachesC_22[v7];
      if (v9 == 47) {
        v8 = &aLibraryCachesC_22[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 213;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error delete_from_driver_storage message to host: %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 2003329396;
}

uint64_t __59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage___block_invoke_33(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    v8 = 0;
    int v9 = 47;
    do
    {
      v10 = &aLibraryCachesC_22[v7];
      if (v9 == 47) {
        v8 = &aLibraryCachesC_22[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 183;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error write_to_driver_storage message to host: %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 2003329396;
}

uint64_t __70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list___block_invoke_28(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    v8 = 0;
    int v9 = 47;
    do
    {
      v10 = &aLibraryCachesC_22[v7];
      if (v9 == 47) {
        v8 = &aLibraryCachesC_22[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 147;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error copy_from_driver_storage message to host: %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 2003329396;
}

void __57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage___block_invoke_22(uint64_t a1, int a2, id obj)
{
  v3 = *(_DWORD **)(a1 + 32);
  v4 = *(id **)(a1 + 40);
  _DWORD *v3 = a2;
  objc_storeStrong(v4, obj);
}

void __74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    v8 = 0;
    int v9 = 47;
    do
    {
      v10 = &aLibraryCachesC_22[v7];
      if (v9 == 47) {
        v8 = &aLibraryCachesC_22[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 124;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error sending properties changed message to host: %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 2003329396;
  **(unsigned char **)(a1 + 40) = 1;
}

uint64_t __74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data___block_invoke_16(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __63__Core_Audio_Driver_Service_Client_tell_driver_service_to_exit__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 localizedDescription];
  NSLog(&stru_1F148B9B0.isa, v2);
}

void __64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = a2;
  AMCP::Log::Scope_Registry::get(v4);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v16, "com.apple.coreaudio", "AMCP");
  id v5 = *v16;
  AMCP::Log::Scope::get_os_log_t(*v16);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v17);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    mach_port_t v6 = pthread_self();
    mach_port_t v7 = pthread_mach_thread_np(v6);
    unint64_t v8 = 0;
    int v9 = 0;
    int v10 = 47;
    do
    {
      mach_port_t v11 = &aLibraryCachesC_46[v8];
      if (v10 == 47) {
        int v9 = &aLibraryCachesC_46[v8];
      }
      int v10 = v11[1];
      if (!v11[1]) {
        break;
      }
    }
    while (v8++ < 0xFFF);
    if (v9) {
      id v13 = v9 + 1;
    }
    else {
      id v13 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Service_Client.mm";
    }
    uint64_t v14 = [*(id *)(a1 + 40) UTF8String];
    if (v4)
    {
      id v2 = [(AMCP::Log::Scope_Registry *)v4 localizedDescription];
      v15 = (const char *)[v2 UTF8String];
    }
    else
    {
      v15 = "";
    }
    LODWORD(v16) = 67110146;
    HIDWORD(v16) = v7;
    *(_WORD *)__int16 v17 = 2080;
    *(void *)&v17[2] = v13;
    __int16 v18 = 1024;
    int v19 = 156;
    __int16 v20 = 2080;
    uint64_t v21 = v14;
    __int16 v22 = 2080;
    mach_port_t v23 = v15;
    _os_log_error_impl(&dword_1BAA78000, v5, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error loading driver bundle %s %s", (uint8_t *)&v16, 0x2Cu);
    if (v4) {
  }
    }
  **(_DWORD **)(a1 + 32) = 2;
}

void __64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint___block_invoke_27(uint64_t a1, int a2, id obj)
{
  v3 = *(id ***)(a1 + 40);
  **(_DWORD **)(a1 + 32) = a2;
  objc_storeStrong(*v3, obj);
}

uint64_t __67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service__block_invoke(uint64_t result)
{
  **(unsigned char **)(result + 32) = 0;
  return result;
}

uint64_t __67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service__block_invoke_11(uint64_t result, char a2)
{
  **(unsigned char **)(result + 32) = a2;
  return result;
}

void __57__Core_Audio_Driver_Service_Client_get_driver_name_list___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 localizedDescription];
  NSLog(&stru_1F148B9B0.isa, v2);
}

void __57__Core_Audio_Driver_Service_Client_get_driver_name_list___block_invoke_33(uint64_t a1, void *a2)
{
}

void __94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        unint64_t v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 679;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d is_property_settable error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 1768911973;
}

uint64_t __94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data___block_invoke_163(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        unint64_t v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 624;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d get_property_data error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 1768911973;
}

void __112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data___block_invoke_154(uint64_t a1, int a2, id obj)
{
  v3 = *(_DWORD **)(a1 + 32);
  v4 = *(id **)(a1 + 40);
  _DWORD *v3 = a2;
  objc_storeStrong(v4, obj);
}

void __93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        unint64_t v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 586;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d is_property_settable error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 1768911973;
}

uint64_t __93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size___block_invoke_149(uint64_t result, int a2, int a3)
{
  v3 = *(_DWORD **)(result + 40);
  **(_DWORD **)(result + 32) = a2;
  _DWORD *v3 = a3;
  return result;
}

void __60__Core_Audio_Driver_Host_is_property_settable_out_settable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        unint64_t v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 558;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d is_property_settable error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 1768911973;
}

uint64_t __60__Core_Audio_Driver_Host_is_property_settable_out_settable___block_invoke_143(uint64_t result, int a2, char a3)
{
  v3 = *(unsigned char **)(result + 40);
  **(_DWORD **)(result + 32) = a2;
  unsigned char *v3 = a3;
  return result;
}

void __56__Core_Audio_Driver_Host_has_property_out_has_property___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        unint64_t v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 535;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d has_property error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 1768911973;
}

uint64_t __56__Core_Audio_Driver_Host_has_property_out_has_property___block_invoke_137(uint64_t result, char a2)
{
  ***(unsigned char ***)(result + 32) = a2;
  return result;
}

void __44__Core_Audio_Driver_Host_unregister_buffer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        unint64_t v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 509;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d unregister_buffer error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 1768911973;
}

uint64_t __44__Core_Audio_Driver_Host_unregister_buffer___block_invoke_132(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __42__Core_Audio_Driver_Host_register_buffer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        unint64_t v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)BOOL v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 487;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d register_buffer error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 1768911973;
}

uint64_t __42__Core_Audio_Driver_Host_register_buffer___block_invoke_127(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __56__Core_Audio_Driver_Host_retain_reply_for_process_boost__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v14, "com.apple.coreaudio", "AMCP");
  v3 = *v14;
  AMCP::Log::Scope::get_os_log_t(*v14);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v15);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = pthread_self();
    mach_port_t v5 = pthread_mach_thread_np(v4);
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    int v8 = 47;
    do
    {
      int v9 = &aLibraryCachesC_67[v6];
      if (v8 == 47) {
        unint64_t v7 = &aLibraryCachesC_67[v6];
      }
      int v8 = v9[1];
      if (!v9[1]) {
        break;
      }
    }
    while (v6++ < 0xFFF);
    if (v7) {
      mach_port_t v11 = v7 + 1;
    }
    else {
      mach_port_t v11 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v12 = [(AMCP::Log::Scope_Registry *)v2 description];
    uint64_t v13 = [v12 UTF8String];
    LODWORD(v14) = 67109890;
    HIDWORD(v14) = v5;
    *(_WORD *)v15 = 2080;
    *(void *)&v15[2] = v11;
    __int16 v16 = 1024;
    int v17 = 472;
    __int16 v18 = 2080;
    uint64_t v19 = v13;
    _os_log_error_impl(&dword_1BAA78000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d retain_reply_for_process_boost error %s", (uint8_t *)&v14, 0x22u);
  }
}

void __63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v14, "com.apple.coreaudio", "AMCP");
  v3 = *v14;
  AMCP::Log::Scope::get_os_log_t(*v14);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v15);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = pthread_self();
    mach_port_t v5 = pthread_mach_thread_np(v4);
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    int v8 = 47;
    do
    {
      int v9 = &aLibraryCachesC_67[v6];
      if (v8 == 47) {
        unint64_t v7 = &aLibraryCachesC_67[v6];
      }
      int v8 = v9[1];
      if (!v9[1]) {
        break;
      }
    }
    while (v6++ < 0xFFF);
    if (v7) {
      mach_port_t v11 = v7 + 1;
    }
    else {
      mach_port_t v11 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v12 = [(AMCP::Log::Scope_Registry *)v2 description];
    uint64_t v13 = [v12 UTF8String];
    LODWORD(v14) = 67109890;
    HIDWORD(v14) = v5;
    *(_WORD *)v15 = 2080;
    *(void *)&v15[2] = v11;
    __int16 v16 = 1024;
    int v17 = 454;
    __int16 v18 = 2080;
    uint64_t v19 = v13;
    _os_log_error_impl(&dword_1BAA78000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d stop_synchronous_messenger error %s", (uint8_t *)&v14, 0x22u);
  }
}

uint64_t __63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id___block_invoke_119(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v14, "com.apple.coreaudio", "AMCP");
  v3 = *v14;
  AMCP::Log::Scope::get_os_log_t(*v14);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v15);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = pthread_self();
    mach_port_t v5 = pthread_mach_thread_np(v4);
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    int v8 = 47;
    do
    {
      int v9 = &aLibraryCachesC_67[v6];
      if (v8 == 47) {
        unint64_t v7 = &aLibraryCachesC_67[v6];
      }
      int v8 = v9[1];
      if (!v9[1]) {
        break;
      }
    }
    while (v6++ < 0xFFF);
    if (v7) {
      mach_port_t v11 = v7 + 1;
    }
    else {
      mach_port_t v11 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v12 = [(AMCP::Log::Scope_Registry *)v2 description];
    uint64_t v13 = [v12 UTF8String];
    LODWORD(v14) = 67109890;
    HIDWORD(v14) = v5;
    *(_WORD *)v15 = 2080;
    *(void *)&v15[2] = v11;
    __int16 v16 = 1024;
    int v17 = 427;
    __int16 v18 = 2080;
    uint64_t v19 = v13;
    _os_log_error_impl(&dword_1BAA78000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d start_synchronous_messenger error %s", (uint8_t *)&v14, 0x22u);
  }
}

uint64_t __134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger___block_invoke_115(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __46__Core_Audio_Driver_Host_stop_io_client_info___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v14, "com.apple.coreaudio", "AMCP");
  v3 = *v14;
  AMCP::Log::Scope::get_os_log_t(*v14);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v15);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = pthread_self();
    mach_port_t v5 = pthread_mach_thread_np(v4);
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    int v8 = 47;
    do
    {
      int v9 = &aLibraryCachesC_67[v6];
      if (v8 == 47) {
        unint64_t v7 = &aLibraryCachesC_67[v6];
      }
      int v8 = v9[1];
      if (!v9[1]) {
        break;
      }
    }
    while (v6++ < 0xFFF);
    if (v7) {
      mach_port_t v11 = v7 + 1;
    }
    else {
      mach_port_t v11 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v12 = [(AMCP::Log::Scope_Registry *)v2 description];
    uint64_t v13 = [v12 UTF8String];
    LODWORD(v14) = 67109890;
    HIDWORD(v14) = v5;
    *(_WORD *)v15 = 2080;
    *(void *)&v15[2] = v11;
    __int16 v16 = 1024;
    int v17 = 402;
    __int16 v18 = 2080;
    uint64_t v19 = v13;
    _os_log_error_impl(&dword_1BAA78000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d stop_io error %s", (uint8_t *)&v14, 0x22u);
  }
}

uint64_t __46__Core_Audio_Driver_Host_stop_io_client_info___block_invoke_110(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __47__Core_Audio_Driver_Host_start_io_client_info___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v14, "com.apple.coreaudio", "AMCP");
  v3 = *v14;
  AMCP::Log::Scope::get_os_log_t(*v14);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v15);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = pthread_self();
    mach_port_t v5 = pthread_mach_thread_np(v4);
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    int v8 = 47;
    do
    {
      int v9 = &aLibraryCachesC_67[v6];
      if (v8 == 47) {
        unint64_t v7 = &aLibraryCachesC_67[v6];
      }
      int v8 = v9[1];
      if (!v9[1]) {
        break;
      }
    }
    while (v6++ < 0xFFF);
    if (v7) {
      mach_port_t v11 = v7 + 1;
    }
    else {
      mach_port_t v11 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v12 = [(AMCP::Log::Scope_Registry *)v2 description];
    uint64_t v13 = [v12 UTF8String];
    LODWORD(v14) = 67109890;
    HIDWORD(v14) = v5;
    *(_WORD *)v15 = 2080;
    *(void *)&v15[2] = v11;
    __int16 v16 = 1024;
    int v17 = 381;
    __int16 v18 = 2080;
    uint64_t v19 = v13;
    _os_log_error_impl(&dword_1BAA78000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d start_io error %s", (uint8_t *)&v14, 0x22u);
  }
}

uint64_t __47__Core_Audio_Driver_Host_start_io_client_info___block_invoke_106(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __47__Core_Audio_Driver_Host_object_was_destroyed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    mach_port_t v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    int v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        int v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      id v12 = v8 + 1;
    }
    else {
      id v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)__int16 v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 358;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d object_was_destroyed error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 2003329396;
}

uint64_t __47__Core_Audio_Driver_Host_object_was_destroyed___block_invoke_102(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __41__Core_Audio_Driver_Host_destroy_device___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    mach_port_t v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    int v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        int v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      id v12 = v8 + 1;
    }
    else {
      id v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)__int16 v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 340;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d destroy_device error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 2003329396;
}

uint64_t __41__Core_Audio_Driver_Host_destroy_device___block_invoke_97(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __66__Core_Audio_Driver_Host_create_device_client_info_out_object_id___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    mach_port_t v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    int v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        int v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      id v12 = v8 + 1;
    }
    else {
      id v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)__int16 v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 321;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d create_device error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 2003329396;
}

uint64_t __66__Core_Audio_Driver_Host_create_device_client_info_out_object_id___block_invoke_91(uint64_t result, int a2, int a3)
{
  v3 = *(_DWORD ***)(result + 40);
  **(_DWORD **)(result + 32) = a2;
  *AMCP::Log::Scope_Registry *v3 = a3;
  return result;
}

void __59__Core_Audio_Driver_Host_remove_device_client_client_info___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    mach_port_t v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    int v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        int v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      id v12 = v8 + 1;
    }
    else {
      id v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)__int16 v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 301;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d remove_device_client error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 2003329396;
}

uint64_t __59__Core_Audio_Driver_Host_remove_device_client_client_info___block_invoke_86(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __56__Core_Audio_Driver_Host_add_device_client_client_info___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    mach_port_t v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    int v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        int v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      id v12 = v8 + 1;
    }
    else {
      id v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)__int16 v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 282;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d add_device_client error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 2003329396;
}

uint64_t __56__Core_Audio_Driver_Host_add_device_client_client_info___block_invoke_81(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    mach_port_t v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    int v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        int v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      id v12 = v8 + 1;
    }
    else {
      id v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)__int16 v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 263;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d abort_device_configuration_change error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 2003329396;
}

uint64_t __74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change___block_invoke_76(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v15, "com.apple.coreaudio", "AMCP");
  v4 = *v15;
  AMCP::Log::Scope::get_os_log_t(*v15);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    mach_port_t v5 = pthread_self();
    mach_port_t v6 = pthread_mach_thread_np(v5);
    unint64_t v7 = 0;
    int v8 = 0;
    int v9 = 47;
    do
    {
      int v10 = &aLibraryCachesC_67[v7];
      if (v9 == 47) {
        int v8 = &aLibraryCachesC_67[v7];
      }
      int v9 = v10[1];
      if (!v10[1]) {
        break;
      }
    }
    while (v7++ < 0xFFF);
    if (v8) {
      id v12 = v8 + 1;
    }
    else {
      id v12 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v13 = [(AMCP::Log::Scope_Registry *)v3 description];
    uint64_t v14 = [v13 UTF8String];
    LODWORD(v15) = 67109890;
    HIDWORD(v15) = v6;
    *(_WORD *)__int16 v16 = 2080;
    *(void *)&v16[2] = v12;
    __int16 v17 = 1024;
    int v18 = 244;
    __int16 v19 = 2080;
    uint64_t v20 = v14;
    _os_log_error_impl(&dword_1BAA78000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d perform_device_configuration_change error %s", (uint8_t *)&v15, 0x22u);
  }
  **(_DWORD **)(a1 + 32) = 2003329396;
}

uint64_t __76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change___block_invoke_71(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void *__44__Core_Audio_Driver_Host_initialize_driver___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "connection_from_driver");
  [v2 invalidate];

  v3 = [*(id *)(a1 + 32) listener];
  [v3 invalidate];

  v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&v8);
  }
  objc_msgSend(v4, "m_invalidation_handler");
  uint64_t v5 = *((void *)&v9 + 1);
  result = std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&v8);
  if (!v5) {
    return result;
  }
  unint64_t v7 = *(void **)(a1 + 32);
  if (!v7)
  {
    long long v8 = 0u;
    long long v9 = 0u;
LABEL_10:
    std::__throw_bad_function_call[abi:ne180100]();
  }
  objc_msgSend(v7, "m_invalidation_handler");
  if (!*((void *)&v9 + 1)) {
    goto LABEL_10;
  }
  (*(void (**)(void))(**((void **)&v9 + 1) + 48))(*((void *)&v9 + 1));
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&v8);
}

void __44__Core_Audio_Driver_Host_initialize_driver___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v14, "com.apple.coreaudio", "AMCP");
  v3 = *v14;
  AMCP::Log::Scope::get_os_log_t(*v14);
  objc_claimAutoreleasedReturnValue();
  if (*(void *)v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v15);
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = pthread_self();
    mach_port_t v5 = pthread_mach_thread_np(v4);
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    int v8 = 47;
    do
    {
      long long v9 = &aLibraryCachesC_67[v6];
      if (v8 == 47) {
        unint64_t v7 = &aLibraryCachesC_67[v6];
      }
      int v8 = v9[1];
      if (!v9[1]) {
        break;
      }
    }
    while (v6++ < 0xFFF);
    if (v7) {
      mach_port_t v11 = v7 + 1;
    }
    else {
      mach_port_t v11 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    }
    id v12 = [(AMCP::Log::Scope_Registry *)v2 description];
    uint64_t v13 = [v12 UTF8String];
    LODWORD(v14) = 67109890;
    HIDWORD(v14) = v5;
    *(_WORD *)v15 = 2080;
    *(void *)&v15[2] = v11;
    __int16 v16 = 1024;
    int v17 = 216;
    __int16 v18 = 2080;
    uint64_t v19 = v13;
    _os_log_error_impl(&dword_1BAA78000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error initializing driver %s", (uint8_t *)&v14, 0x22u);
  }
}

uint64_t __44__Core_Audio_Driver_Host_initialize_driver___block_invoke_65(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __61__Core_Audio_Driver_Host_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) listener];
  [v2 invalidate];

  objc_msgSend(*(id *)(a1 + 32), "connection_to_driver");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 invalidate];
}

uint64_t __75__Core_Audio_Driver_abort_device_configuration_change_action_change_reply___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "config_change_info_map");
  objc_msgSend(*(id *)(a1 + 32), "config_change_info_lock");
  os_unfair_lock_lock(lock);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  id v2 = *(void **)(v14 + 8);
  if (!v2) {
    goto LABEL_14;
  }
  unint64_t v3 = *(void *)(a1 + 56);
  v4 = (uint64_t *)(v14 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      unint64_t v7 = v2;
    }
    else {
      unint64_t v7 = v2 + 1;
    }
    if (v6) {
      v4 = v2;
    }
    id v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 != (uint64_t *)(v14 + 8) && v3 >= v4[4])
  {
    uint64_t v9 = v4[5];
    uint64_t v10 = *(os_unfair_lock_s **)(a1 + 32);
    if (v10)
    {
      [(os_unfair_lock_s *)v10 config_change_info_map];
      uint64_t v10 = lock;
    }
    else
    {
      uint64_t v13 = 0;
    }
    std::__tree<HALS_IOUADriver *>::__remove_node_pointer((uint64_t **)v10, v4);
    operator delete(v4);
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    os_unfair_lock_unlock(lock);
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "asp_interface");
    (*(void (**)(uint64_t, void, void, uint64_t))(*(void *)v11 + 80))(v11, *(unsigned int *)(a1 + 40), *(void *)(a1 + 48), v9);
  }
  else
  {
LABEL_14:
    os_unfair_lock_unlock(lock);
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
}

uint64_t __77__Core_Audio_Driver_perform_device_configuration_change_action_change_reply___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "config_change_info_map");
  objc_msgSend(*(id *)(a1 + 32), "config_change_info_lock");
  os_unfair_lock_lock(lock);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  id v2 = *(void **)(v14 + 8);
  if (!v2) {
    goto LABEL_14;
  }
  unint64_t v3 = *(void *)(a1 + 56);
  v4 = (uint64_t *)(v14 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      unint64_t v7 = v2;
    }
    else {
      unint64_t v7 = v2 + 1;
    }
    if (v6) {
      v4 = v2;
    }
    id v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 != (uint64_t *)(v14 + 8) && v3 >= v4[4])
  {
    uint64_t v9 = v4[5];
    uint64_t v10 = *(os_unfair_lock_s **)(a1 + 32);
    if (v10)
    {
      [(os_unfair_lock_s *)v10 config_change_info_map];
      uint64_t v10 = lock;
    }
    else
    {
      uint64_t v13 = 0;
    }
    std::__tree<HALS_IOUADriver *>::__remove_node_pointer((uint64_t **)v10, v4);
    operator delete(v4);
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    os_unfair_lock_unlock(lock);
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "asp_interface");
    (*(void (**)(uint64_t, void, void, uint64_t))(*(void *)v11 + 72))(v11, *(unsigned int *)(a1 + 40), *(void *)(a1 + 48), v9);
  }
  else
  {
LABEL_14:
    os_unfair_lock_unlock(lock);
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64));
}

void *__56__Core_Audio_Driver_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(v1, "m_invalidation_handler");
    if (*((void *)&v4 + 1)) {
      (*(void (**)(void))(**((void **)&v4 + 1) + 48))(*((void *)&v4 + 1));
    }
  }
  else
  {
    long long v3 = 0u;
    long long v4 = 0u;
  }
  return std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&v3);
}

@end