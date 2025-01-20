@interface WFBrightnessSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (void)getValueWithCompletionHandler:(id)a3;
- (void)setValue:(float)a3 completionHandler:(id)a4;
@end

@implementation WFBrightnessSettingsClient

+ (void)createClientWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  (*((void (**)(id, id, void))a3 + 2))(v4, v5, 0);
}

- (void)setValue:(float)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void))a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v6 = (uint64_t (*)(void))getBKSDisplayBrightnessIsBrightnessLevelControlAvailableSymbolLoc_ptr;
  v29 = getBKSDisplayBrightnessIsBrightnessLevelControlAvailableSymbolLoc_ptr;
  if (!getBKSDisplayBrightnessIsBrightnessLevelControlAvailableSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getBKSDisplayBrightnessIsBrightnessLevelControlAvailableSymbolLoc_block_invoke;
    v31 = &unk_264E5EC88;
    v32 = &v26;
    v7 = BackBoardServicesLibrary();
    v8 = dlsym(v7, "BKSDisplayBrightnessIsBrightnessLevelControlAvailable");
    *(void *)(v32[1] + 24) = v8;
    getBKSDisplayBrightnessIsBrightnessLevelControlAvailableSymbolLoc_ptr = *(_UNKNOWN **)(v32[1] + 24);
    v6 = (uint64_t (*)(void))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v6)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    v21 = [NSString stringWithUTF8String:"BOOL WFBKSDisplayBrightnessIsBrightnessLevelControlAvailable(void)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"WFBrightnessSettingsClient.m", 21, @"%s", dlerror());

    goto LABEL_25;
  }
  if (v6())
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    v9 = (uint64_t (*)(void))getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr;
    v29 = getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr;
    if (!getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getBKSDisplayBrightnessTransactionCreateSymbolLoc_block_invoke;
      v31 = &unk_264E5EC88;
      v32 = &v26;
      v10 = BackBoardServicesLibrary();
      v11 = dlsym(v10, "BKSDisplayBrightnessTransactionCreate");
      *(void *)(v32[1] + 24) = v11;
      getBKSDisplayBrightnessTransactionCreateSymbolLoc_ptr = *(_UNKNOWN **)(v32[1] + 24);
      v9 = (uint64_t (*)(void))v27[3];
    }
    _Block_object_dispose(&v26, 8);
    if (v9)
    {
      v12 = (const void *)v9(0);
      v13 = getWFBundledIntentsLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[WFBrightnessSettingsClient setValue:completionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl(&dword_23C364000, v13, OS_LOG_TYPE_INFO, "%s Created brightness transaction %@", buf, 0x16u);
      }

      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      v14 = (void (*)(uint64_t, float))getBKSDisplayBrightnessSetSymbolLoc_ptr;
      v29 = getBKSDisplayBrightnessSetSymbolLoc_ptr;
      if (!getBKSDisplayBrightnessSetSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getBKSDisplayBrightnessSetSymbolLoc_block_invoke;
        v31 = &unk_264E5EC88;
        v32 = &v26;
        v15 = BackBoardServicesLibrary();
        v16 = dlsym(v15, "BKSDisplayBrightnessSet");
        *(void *)(v32[1] + 24) = v16;
        getBKSDisplayBrightnessSetSymbolLoc_ptr = *(_UNKNOWN **)(v32[1] + 24);
        v14 = (void (*)(uint64_t, float))v27[3];
      }
      _Block_object_dispose(&v26, 8);
      if (v14)
      {
        v14(1, a3);
        v17 = getWFBundledIntentsLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[WFBrightnessSettingsClient setValue:completionHandler:]";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = a3;
          _os_log_impl(&dword_23C364000, v17, OS_LOG_TYPE_INFO, "%s Set system brightness level to %f", buf, 0x16u);
        }

        if (v12) {
          CFRelease(v12);
        }
        v5[2](v5, 0);
        goto LABEL_21;
      }
      v24 = [MEMORY[0x263F08690] currentHandler];
      v25 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFBKSDisplayBrightnessSet(float, Boolean)");
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"WFBrightnessSettingsClient.m", 18, @"%s", dlerror());
    }
    else
    {
      v22 = [MEMORY[0x263F08690] currentHandler];
      v23 = [NSString stringWithUTF8String:"BKSDisplayBrightnessTransactionRef WFBKSDisplayBrightnessTransactionCreate(CFAllocatorRef)"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"WFBrightnessSettingsClient.m", 19, @"%s", dlerror());
    }
LABEL_25:
    __break(1u);
  }
  v18 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[WFBrightnessSettingsClient setValue:completionHandler:]";
    _os_log_impl(&dword_23C364000, v18, OS_LOG_TYPE_INFO, "%s Brightness control unavailable", buf, 0xCu);
  }

  v19 = WFSettingsClientError();
  ((void (**)(id, void *))v5)[2](v5, v19);

LABEL_21:
}

- (void)getValueWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = (void (**)(id, void, float))a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v4 = (float (*)(void))getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr;
  v14 = getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr;
  if (!getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getBKSDisplayBrightnessGetCurrentSymbolLoc_block_invoke;
    v16 = &unk_264E5EC88;
    v17 = &v11;
    id v5 = BackBoardServicesLibrary();
    v6 = dlsym(v5, "BKSDisplayBrightnessGetCurrent");
    *(void *)(v17[1] + 24) = v6;
    getBKSDisplayBrightnessGetCurrentSymbolLoc_ptr = *(_UNKNOWN **)(v17[1] + 24);
    id v4 = (float (*)(void))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v4)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    v10 = [NSString stringWithUTF8String:"float WFBKSDisplayBrightnessGetCurrent(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"WFBrightnessSettingsClient.m", 20, @"%s", dlerror());

    __break(1u);
  }
  float v7 = v4();
  v8 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[WFBrightnessSettingsClient getValueWithCompletionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v7;
    _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_INFO, "%s Retrieved system brightness level: %f", buf, 0x16u);
  }

  v3[2](v3, 0, v7);
}

@end