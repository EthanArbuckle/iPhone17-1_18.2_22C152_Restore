@interface CAMFallbackConfiguration
+ (id)getPathOfFallbackDevicesFile;
+ (id)readFallbackDevicesFromDisk;
+ (void)checkAvailableCameraModules;
+ (void)getAvailableFallbackDevicesWithCompletion:(id)a3;
@end

@implementation CAMFallbackConfiguration

+ (void)getAvailableFallbackDevicesWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = (void (**)(id, void *))a3;
  v4 = (void *)MEMORY[0x263EFA5A8];
  v5 = +[CAMCaptureCapabilities capabilities];
  v6 = [v5 getSupportedCameraModules];
  v7 = [v4 discoverySessionWithDeviceTypes:v6 mediaType:0 position:1];

  v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v9 = objc_msgSend(v7, "devices", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) deviceType];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  v15 = [v8 allObjects];
  v3[2](v3, v15);
}

+ (id)readFallbackDevicesFromDisk
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF8C0];
  v3 = NSURL;
  v4 = [(id)objc_opt_class() getPathOfFallbackDevicesFile];
  v5 = [v3 fileURLWithPath:v4];
  id v15 = 0;
  v6 = [v2 arrayWithContentsOfURL:v5 error:&v15];
  id v7 = v15;

  uint64_t v8 = [v7 code];
  v9 = os_log_create("com.apple.camera", "Camera");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 == 260)
  {
    if (!v10) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v11 = "Read in readFallbackDevicesFromDisk no file exists";
    uint64_t v12 = v9;
    uint32_t v13 = 2;
  }
  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412546;
    long long v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    uint64_t v11 = "Read in readFallbackDevicesFromDisk %@ error: %@";
    uint64_t v12 = v9;
    uint32_t v13 = 22;
  }
  _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_7:

  return v6;
}

+ (id)getPathOfFallbackDevicesFile
{
  if (getPathOfFallbackDevicesFile_onceToken != -1) {
    dispatch_once(&getPathOfFallbackDevicesFile_onceToken, &__block_literal_global_53);
  }
  v2 = (void *)getPathOfFallbackDevicesFile_pathOfFile;
  return v2;
}

void __56__CAMFallbackConfiguration_getPathOfFallbackDevicesFile__block_invoke()
{
  CPSharedResourcesDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"Media/DCIM/.MISC/CAMFallbackBackCameraModule.plist"];
  v1 = (void *)getPathOfFallbackDevicesFile_pathOfFile;
  getPathOfFallbackDevicesFile_pathOfFile = v0;
}

+ (void)checkAvailableCameraModules
{
  id v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "checkAvailableCameraModules check available camera modules", v3, 2u);
  }

  +[CAMFallbackConfiguration getAvailableFallbackDevicesWithCompletion:&__block_literal_global_9_0];
}

void __55__CAMFallbackConfiguration_checkAvailableCameraModules__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CAMFallbackConfiguration_checkAvailableCameraModules__block_invoke_2;
  block[3] = &unk_263FA0208;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

void __55__CAMFallbackConfiguration_checkAvailableCameraModules__block_invoke_2(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(NSObject **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v45 = v3;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "checkAvailableCameraModules availableDevices %@", buf, 0xCu);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v4 = +[CAMCaptureCapabilities capabilities];
  v5 = [v4 getSupportedCameraModules];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(NSObject **)(*((void *)&v38 + 1) + 8 * i);
        if (([*(id *)(a1 + 32) containsObject:v10] & 1) == 0)
        {
          long long v17 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v10;
            _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "checkAvailableCameraModules missing camera module %@", buf, 0xCu);
          }

          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          os_log_t v15 = (os_log_t)*(id *)(a1 + 32);
          uint64_t v18 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v35;
            while (2)
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v35 != v20) {
                  objc_enumerationMutation(v15);
                }
                v22 = *(NSObject **)(*((void *)&v34 + 1) + 8 * j);
                v23 = +[CAMCaptureCapabilities capabilities];
                v24 = [v23 fallbackCameraModules];
                char v25 = [v24 containsObject:v22];

                if ((v25 & 1) == 0)
                {
                  v26 = os_log_create("com.apple.camera", "Camera");
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v45 = v22;
                    _os_log_impl(&dword_2099F8000, v26, OS_LOG_TYPE_DEFAULT, "checkAvailableCameraModules missing camera module restored %@", buf, 0xCu);
                  }

                  v27 = *(void **)(a1 + 32);
                  v28 = NSURL;
                  v29 = +[CAMFallbackConfiguration getPathOfFallbackDevicesFile];
                  v30 = [v28 fileURLWithPath:v29];
                  id v33 = 0;
                  [v27 writeToURL:v30 error:&v33];
                  long long v16 = v33;

                  v31 = os_log_create("com.apple.camera", "Camera");
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v45 = v16;
                    _os_log_impl(&dword_2099F8000, v31, OS_LOG_TYPE_DEFAULT, "checkAvailableCameraModules failed with error %@", buf, 0xCu);
                  }

                  goto LABEL_30;
                }
              }
              uint64_t v19 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }
          goto LABEL_31;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = +[CAMCaptureCapabilities capabilities];
  char v12 = [v11 fallbackCameraEnabled];

  if (v12)
  {
    uint32_t v13 = [MEMORY[0x263F08850] defaultManager];
    v14 = +[CAMFallbackConfiguration getPathOfFallbackDevicesFile];
    id v32 = 0;
    [v13 removeItemAtPath:v14 error:&v32];
    os_log_t v15 = (os_log_t)v32;

    long long v16 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v15;
      _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "checkAvailableCameraModules all camera modules restored file cleanup error %@", buf, 0xCu);
    }
LABEL_30:
  }
  else
  {
    os_log_t v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "checkAvailableCameraModules all camera modules operational", buf, 2u);
    }
  }
LABEL_31:
}

@end