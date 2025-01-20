@interface ANEDeviceController
@end

@implementation ANEDeviceController

void __29___ANEDeviceController_start__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = +[_ANEVirtualClient sharedConnection];

  if (v2)
  {
    [*(id *)(a1 + 32) setDevice:0];
    v3 = +[_ANELog common];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      objc_claimAutoreleasedReturnValue();
      __29___ANEDeviceController_start__block_invoke_cold_2();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setUsecount:", objc_msgSend(*(id *)(a1 + 32), "usecount") + 1);
    v4 = +[_ANELog common];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [*(id *)(a1 + 32) usecount];
      uint64_t v12 = [*(id *)(a1 + 32) device];
      int v13 = [*(id *)(a1 + 32) isPrivileged];
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v12;
      __int16 v23 = 1024;
      int v24 = v13;
      _os_log_debug_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_DEBUG, "%@: self.usecount=%lld : self.device=%p : self.isPrivileged=%d", buf, 0x26u);
    }
    if ([*(id *)(a1 + 32) usecount] == 1)
    {
      memset(buf, 0, sizeof(buf));
      if ([*(id *)(a1 + 32) isPrivileged])
      {
        uint64_t v5 = 0;
        int v6 = 2;
        *(_DWORD *)buf = 2;
      }
      else
      {
        *(_DWORD *)buf = 1;
        uint64_t v5 = [*(id *)(a1 + 32) programHandle];
        int v6 = 1;
      }
      *(void *)&buf[8] = v5;
      *(_DWORD *)&buf[16] = 10000;
      *(_DWORD *)&buf[24] = 10000;
      v7 = +[_ANELog common];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v14 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)v16 = 138412802;
        v17 = v14;
        __int16 v18 = 1024;
        int v19 = v6;
        __int16 v20 = 2048;
        uint64_t v21 = v5;
        _os_log_debug_impl(&dword_1DB8AB000, v7, OS_LOG_TYPE_DEBUG, "%@: Calling ANEDeviceOpen( deviceUsageType=%u : programHandle=%llu)", v16, 0x1Cu);
      }
      uint64_t v15 = 0;
      uint64_t v8 = *(void *)(a1 + 32);
      if (LoadDeviceNamed((uint64_t)&v15, (uint64_t)buf, v8)
        && LoadDeviceNamed((uint64_t)&v15, (uint64_t)buf, v8)
        || !v15)
      {
        v9 = +[_ANELog common];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 40));
          objc_claimAutoreleasedReturnValue();
          __29___ANEDeviceController_start__block_invoke_cold_1();
        }

        [*(id *)(a1 + 32) setDevice:0];
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "setDevice:");
      }
    }
  }
}

void __34___ANEDeviceController_initialize__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.ane.devicecontroller", v2);
  v1 = (void *)gANEControllerQueue;
  gANEControllerQueue = (uint64_t)v0;
}

uint64_t __50___ANEDeviceController_sharedPrivilegedConnection__block_invoke()
{
  +[_ANEDeviceController sharedPrivilegedConnection]::conn = [[_ANEDeviceController alloc] initWithProgramHandle:0 priviledged:1];
  return MEMORY[0x1F41817F8]();
}

void __28___ANEDeviceController_stop__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setUsecount:", objc_msgSend(*(id *)(a1 + 32), "usecount") - 1);
  v2 = +[_ANELog common];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [*(id *)(a1 + 32) usecount];
    uint64_t v8 = [*(id *)(a1 + 32) device];
    *(_DWORD *)buf = 138412802;
    id v13 = v6;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    _os_log_debug_impl(&dword_1DB8AB000, v2, OS_LOG_TYPE_DEBUG, "%@: self.usecount=%lld : self.device=%p", buf, 0x20u);
  }
  if (![*(id *)(a1 + 32) usecount] && objc_msgSend(*(id *)(a1 + 32), "device"))
  {
    uint64_t v3 = [*(id *)(a1 + 32) device];
    if (!v3 || !*(void *)v3 || (*(unsigned int (**)(void))(*(void *)v3 + 8))())
    {
      v4 = +[_ANELog common];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        objc_claimAutoreleasedReturnValue();
        __28___ANEDeviceController_stop__block_invoke_cold_1();
      }
    }
    [*(id *)(a1 + 32) setDevice:0];
    uint64_t v5 = +[_ANELog common];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [*(id *)(a1 + 32) usecount];
      uint64_t v11 = [*(id *)(a1 + 32) device];
      *(_DWORD *)buf = 138412802;
      id v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      _os_log_debug_impl(&dword_1DB8AB000, v5, OS_LOG_TYPE_DEBUG, "%@: ANEDeviceClose() self.usecount=%lld : self.device=%p", buf, 0x20u);
    }
  }
}

void __29___ANEDeviceController_start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_31(v1, v2, v3, 5.778e-34);
  _os_log_error_impl(&dword_1DB8AB000, v5, OS_LOG_TYPE_ERROR, "%@: ANEDeviceOpen() failed : ret=%u :", v4, 0x12u);
}

void __29___ANEDeviceController_start__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)uint64_t v1 = 138412290;
  *(void *)(v1 + 4) = v2;
  _os_log_debug_impl(&dword_1DB8AB000, v3, OS_LOG_TYPE_DEBUG, "%@: ANEDeviceController not instantiated in VM", v4, 0xCu);
}

void __28___ANEDeviceController_stop__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_31(v1, v2, v3, 5.778e-34);
  _os_log_error_impl(&dword_1DB8AB000, v5, OS_LOG_TYPE_ERROR, "%@: ANEDeviceClose() failed : ret=%u :", v4, 0x12u);
}

@end