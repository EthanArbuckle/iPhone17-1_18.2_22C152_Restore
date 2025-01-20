@interface EXRunningExtension
@end

@implementation EXRunningExtension

void __37___EXRunningExtension_sharedInstance__block_invoke()
{
  v0 = getenv("EXTENSION_KIT_EXTENSION_TYPE");
  v1 = v0;
  if (v0)
  {
    switch(atoi(v0))
    {
      case 1:
      case 8:
        break;
      case 2:
      case 4:
      case 6:
        get_EXRunningUIViewServiceExtensionClass();
        break;
      case 3:
      case 5:
        get_EXRunningUIKitSceneHostedExtensionClass();
        break;
      case 7:
        get_EXRunningUISceneExtensionClass();
        break;
      default:
        goto LABEL_9;
    }
    uint64_t v2 = objc_opt_new();
    v3 = (void *)sharedInstance_runningExtension;
    sharedInstance_runningExtension = v2;

    v4 = _EXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __37___EXRunningExtension_sharedInstance__block_invoke_cold_3(v1, v4);
    }
  }
  else
  {
LABEL_9:
    v5 = _EXDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __37___EXRunningExtension_sharedInstance__block_invoke_cold_2();
    }

    v6 = _EXDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __37___EXRunningExtension_sharedInstance__block_invoke_cold_1();
    }

    v7 = (_EXRunningLibXPCServiceExtension *)abort_with_reason();
    [(_EXRunningLibXPCServiceExtension *)v7 init];
  }
}

void __65___EXRunningExtension_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setActivateOnResume];
  [v2 setFaultOnSuspend];
}

void __41___EXRunningExtension_entryPointFunction__block_invoke()
{
  unint64_t size = 0;
  prog_image_header = (const mach_header_64 *)_dyld_get_prog_image_header();
  if (!prog_image_header)
  {
    v3 = _EXDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __41___EXRunningExtension_entryPointFunction__block_invoke_cold_3();
    }

    goto LABEL_9;
  }
  v1 = getsectiondata(prog_image_header, "__TEXT", "__swift5_entry", &size);
  if (!v1 || size <= 3)
  {
LABEL_9:
    v4 = _EXDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __41___EXRunningExtension_entryPointFunction__block_invoke_cold_2();
    }

    goto LABEL_12;
  }
  uint64_t v2 = *(int *)v1;
  if (v2)
  {
    entryPointFunction_mainFunction = (uint64_t)&v1[v2];
    return;
  }
LABEL_12:
  v5 = _EXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __41___EXRunningExtension_entryPointFunction__block_invoke_cold_1();
  }
}

void __29___EXRunningExtension_resume__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"XPCService"];
  [v3 setService:@"MainService"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 setDelegate:WeakRetained];
}

uint64_t __29___EXRunningExtension_resume__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _EXSignpostLog();
  if ([*(id *)(a1 + 32) signpost] && os_signpost_enabled(v2))
  {
    id v3 = v2;
    uint64_t v4 = [*(id *)(a1 + 32) signpost];
    if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_191F29000, v3, OS_SIGNPOST_EVENT, v5, "extensionkit-lifecycle", "Runloop started", v7, 2u);
      }
    }
  }
  return [*(id *)(a1 + 32) didFinishLaunching];
}

void __37___EXRunningExtension_sharedInstance__block_invoke_cold_1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = 136315906;
  id v3 = "false";
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1();
  int v4 = 83;
  __int16 v5 = 2082;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_191F29000, v1, OS_LOG_TYPE_ERROR, "%s - %s:%d: Unrecognized extension type: '%{public}s'", (uint8_t *)&v2, 0x26u);
}

void __37___EXRunningExtension_sharedInstance__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_191F29000, v0, OS_LOG_TYPE_FAULT, "Unrecognized extension type: '%{public}s'", v1, 0xCu);
}

void __37___EXRunningExtension_sharedInstance__block_invoke_cold_3(const char *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109120;
  v3[1] = atoi(a1);
  _os_log_debug_impl(&dword_191F29000, a2, OS_LOG_TYPE_DEBUG, "Extension Type: %u", (uint8_t *)v3, 8u);
}

void __41___EXRunningExtension_entryPointFunction__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_191F29000, v0, v1, "SwiftUI: Swift entry point address could not be determined.", v2, v3, v4, v5, v6);
}

void __41___EXRunningExtension_entryPointFunction__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_191F29000, v0, v1, "SwiftUI: Swift entry point data not found.", v2, v3, v4, v5, v6);
}

void __41___EXRunningExtension_entryPointFunction__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_191F29000, v0, v1, "SwiftUI: Swift entry point section not found in the current image", v2, v3, v4, v5, v6);
}

@end