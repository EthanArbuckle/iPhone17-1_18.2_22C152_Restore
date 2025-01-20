@interface IMAudioSessionController_iOS
- (IMAudioSessionController_iOS)init;
- (void)audioSessionInterruption:(id)a3;
- (void)audioSessionMediaServicesWereLost:(id)a3;
- (void)audioSessionMediaServicesWereReset:(id)a3;
- (void)audioSessionRouteChange:(id)a3;
- (void)configureAudioSessionWithOptions:(unint64_t)a3;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
@end

@implementation IMAudioSessionController_iOS

- (void)dealloc
{
  v4 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)IMAudioSessionController_iOS;
  [(IMAudioSessionController_iOS *)&v6 dealloc];
}

- (IMAudioSessionController_iOS)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMAudioSessionController_iOS;
  v4 = [(IMAudioSessionController_iOS *)&v11 init];
  if (v4)
  {
    v5 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v2, v3);
    objc_msgSend_addObserver_selector_name_object_(v5, v6, (uint64_t)v4, sel_audioSessionInterruption_, *MEMORY[0x263EF90A0], 0);
    objc_msgSend_addObserver_selector_name_object_(v5, v7, (uint64_t)v4, sel_audioSessionRouteChange_, *MEMORY[0x263EF9248], 0);
    objc_msgSend_addObserver_selector_name_object_(v5, v8, (uint64_t)v4, sel_audioSessionMediaServicesWereLost_, *MEMORY[0x263EF90E8], 0);
    objc_msgSend_addObserver_selector_name_object_(v5, v9, (uint64_t)v4, sel_audioSessionMediaServicesWereReset_, *MEMORY[0x263EF90F8], 0);
  }
  return v4;
}

- (void)configureAudioSessionWithOptions:(unint64_t)a3
{
  v35.receiver = self;
  v35.super_class = (Class)IMAudioSessionController_iOS;
  -[IMAudioSessionController configureAudioSessionWithOptions:](&v35, sel_configureAudioSessionWithOptions_);
  objc_super v6 = objc_msgSend_sharedInstance(MEMORY[0x263EF93E0], v4, v5);
  uint64_t v7 = *MEMORY[0x263EF9108];
  id v34 = 0;
  char v9 = objc_msgSend_setMode_error_(v6, v8, v7, &v34);
  id v12 = v34;
  if ((v9 & 1) == 0)
  {
    v13 = objc_msgSend_audio(IMSharedUILogs, v10, v11);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_2180FAA74();
    }
  }
  int v14 = a3 & 1;
  uint64_t v15 = 44;
  if ((a3 & 1) == 0) {
    uint64_t v15 = 36;
  }
  if ((a3 & 2) != 0) {
    uint64_t v15 = 0;
  }
  unint64_t v16 = v15 | (a3 >> 1) & 2;
  v17 = (id *)MEMORY[0x263EF9048];
  if ((a3 & 2) == 0) {
    v17 = (id *)MEMORY[0x263EF9050];
  }
  id v18 = *v17;

  id v33 = 0;
  char v20 = objc_msgSend_setCategory_withOptions_error_(v6, v19, (uint64_t)v18, v16, &v33);
  id v23 = v33;
  if ((v20 & 1) == 0)
  {
    v24 = objc_msgSend_audio(IMSharedUILogs, v21, v22);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_2180FAA0C();
    }
  }
  id v32 = 0;
  char v26 = objc_msgSend_setActivationContext_error_(v6, v25, MEMORY[0x263EFFA78], &v32);
  id v29 = v32;
  if ((v26 & 1) == 0)
  {
    v30 = objc_msgSend_audio(IMSharedUILogs, v27, v28);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_2180FA9A4();
    }
  }
  v31 = objc_msgSend_audio(IMSharedUILogs, v27, v28);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_2180FA8F0(v14, v6, v31);
  }
}

- (void)audioSessionRouteChange:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_audio(IMSharedUILogs, v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v26 = 138412290;
    id v27 = v4;
    _os_log_impl(&dword_2180ED000, v7, OS_LOG_TYPE_INFO, "audioSessionRouteChange: %@", (uint8_t *)&v26, 0xCu);
  }

  objc_msgSend_setDirty_(self, v8, 1);
  if (objc_msgSend_isActive(self, v9, v10))
  {
    v13 = objc_msgSend_userInfo(v4, v11, v12);
    uint64_t v15 = objc_msgSend_objectForKey_(v13, v14, *MEMORY[0x263EF9268]);
    uint64_t v18 = objc_msgSend_unsignedIntegerValue(v15, v16, v17);

    if ((unint64_t)(v18 - 1) <= 1)
    {
      v21 = objc_msgSend_audio(IMSharedUILogs, v19, v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_2180ED000, v21, OS_LOG_TYPE_INFO, "Available audio routes changed", (uint8_t *)&v26, 2u);
      }

      uint64_t v24 = objc_msgSend_options(self, v22, v23);
      objc_msgSend_activateWithOptions_completion_(self, v25, v24, 0);
    }
  }
}

- (void)audioSessionInterruption:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_audio(IMSharedUILogs, v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_2180ED000, v7, OS_LOG_TYPE_INFO, "audioSessionInterruption: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_setDirty_(self, v8, 1);
}

- (void)audioSessionMediaServicesWereLost:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_audio(IMSharedUILogs, v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_2180ED000, v7, OS_LOG_TYPE_INFO, "audioSessionMediaServicesWereLost: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_setDirty_(self, v8, 1);
}

- (void)audioSessionMediaServicesWereReset:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_audio(IMSharedUILogs, v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_2180ED000, v7, OS_LOG_TYPE_INFO, "audioSessionMediaServicesWereReset: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend_setDirty_(self, v8, 1);
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x263EF93E0], a2, a3);
    id v19 = 0;
    char active = objc_msgSend_setActive_error_(v5, v6, 1, &v19);
    id v8 = v19;

    if ((active & 1) == 0)
    {
      uint64_t v11 = objc_msgSend_audio(IMSharedUILogs, v9, v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_2180FAADC();
      }
LABEL_8:
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend_sharedInstance(MEMORY[0x263EF93E0], a2, a3);
    id v18 = 0;
    char v14 = objc_msgSend_setActive_withOptions_error_(v12, v13, 0, 1, &v18);
    id v8 = v18;

    if ((v14 & 1) == 0)
    {
      uint64_t v11 = objc_msgSend_audio(IMSharedUILogs, v15, v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_2180FAB44();
      }
      goto LABEL_8;
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)IMAudioSessionController_iOS;
  [(IMAudioSessionController *)&v17 setActive:v3];
}

@end