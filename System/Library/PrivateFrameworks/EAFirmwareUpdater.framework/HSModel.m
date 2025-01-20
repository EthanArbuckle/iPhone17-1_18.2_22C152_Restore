@interface HSModel
- (BOOL)getHSModelForEngineMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 numHSModels:(unint64_t)a5 modelBuffer:(char *)a6 length:(unint64_t)a7;
- (HSModel)init;
- (void)scheduleCoreSpeechTask:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation HSModel

- (HSModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)HSModel;
  v2 = [(HSModel *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MobileAccessoryUpdater.EAFirmwareUpdater.HSQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __23__HSModel_setDelegate___block_invoke;
  v7[3] = &unk_264E10A00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __23__HSModel_setDelegate___block_invoke(uint64_t a1)
{
}

- (BOOL)getHSModelForEngineMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 numHSModels:(unint64_t)a5 modelBuffer:(char *)a6 length:(unint64_t)a7
{
  v13 = [MEMORY[0x263EFF980] array];
  v14 = [MEMORY[0x263EFF980] array];
  v15 = "valid";
  if (!a6) {
    v15 = "NULL";
  }
  NSLog(&cfstr_Gethsmodelfore.isa, a3, a4, a5, v15, a7);
  if (!a6)
  {
    NSLog(&cfstr_EmptyBuffer.isa, v33);
    goto LABEL_40;
  }
  unint64_t v38 = a5;
  v39 = v14;
  unint64_t v36 = a3;
  unint64_t v37 = a4;
  v35 = self;
  if (a5)
  {
    if (a7 >= 4)
    {
      uint64_t v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      LODWORD(a5) = 0;
      int v20 = 0;
      while (1)
      {
        unsigned int v21 = a6[v16];
        if (v21 >= 2)
        {
          NSLog(&cfstr_UnexpectedMode.isa, a6[v16], v34);
          goto LABEL_31;
        }
        uint64_t v22 = (v20 + 2);
        unint64_t v23 = a6[v20 + 1];
        if (a7 - v22 <= v23)
        {
          NSLog(&cfstr_BadBufferRemai.isa, a7 - v22, v23);
          goto LABEL_31;
        }
        if (v19) {

        }
        v19 = (void *)[[NSString alloc] initWithBytes:&a6[v22] length:v23 encoding:4];
        if (!v19)
        {
          NSLog(&cfstr_FailedToCreate.isa);

          goto LABEL_36;
        }
        int v24 = v22 + v23;
        uint64_t v25 = (v22 + v23 + 1);
        unint64_t v26 = a6[v24];
        if (a7 - v25 < v26)
        {
          NSLog(&cfstr_BadBufferRemai_0.isa, a7 - v25, v26);
          goto LABEL_31;
        }
        if (v18) {

        }
        uint64_t v27 = [[NSString alloc] initWithBytes:&a6[v25] length:v26 encoding:4];
        if (!v27)
        {
          NSLog(&cfstr_FailedToCreate_0.isa);

          goto LABEL_35;
        }
        v18 = (void *)v27;
        if (v17) {

        }
        uint64_t v41 = 0;
        v42 = &v41;
        uint64_t v43 = 0x2050000000;
        v28 = (void *)getCSVoiceTriggerRTModelClass_softClass;
        uint64_t v44 = getCSVoiceTriggerRTModelClass_softClass;
        if (!getCSVoiceTriggerRTModelClass_softClass)
        {
          v40[0] = MEMORY[0x263EF8330];
          v40[1] = 3221225472;
          v40[2] = __getCSVoiceTriggerRTModelClass_block_invoke;
          v40[3] = &unk_264E10A78;
          v40[4] = &v41;
          __getCSVoiceTriggerRTModelClass_block_invoke((uint64_t)v40);
          v28 = (void *)v42[3];
        }
        v29 = v28;
        _Block_object_dispose(&v41, 8);
        uint64_t v30 = [[v29 alloc] initWithData:0 hash:v18 locale:v19 digest:0 signature:0 certificate:0];
        if (!v30) {
          break;
        }
        v17 = (void *)v30;
        v31 = v13;
        if (v21) {
          v31 = v39;
        }
        [v31 addObject:v17];
        uint64_t v16 = (v25 + v26);
        a5 = (a5 + 1);
        int v20 = v25 + v26;
        if (a7 - 3 <= v16) {
          goto LABEL_24;
        }
      }
      NSLog(&cfstr_FailedToCreate_1.isa);
      goto LABEL_34;
    }
    NSLog(&cfstr_InvalidLengthZ.isa, a7);
LABEL_40:
    LOBYTE(v19) = 0;
    goto LABEL_26;
  }
  v19 = 0;
  v18 = 0;
  v17 = 0;
LABEL_24:
  if (a5 == v38)
  {
    v14 = v39;
    NSLog(&cfstr_RequestingHsmo.isa, v36, v37, a5, [v13 count], objc_msgSend(v39, "count"), v35->_queue);
    [(HSModel *)v35 scheduleCoreSpeechTask:v36 minorVersion:v37 downloadedModels:v13 preinstalledModels:v39];

    LOBYTE(v19) = 1;
    goto LABEL_26;
  }
  NSLog(&cfstr_AssetcountUNum.isa, a5, v38);
LABEL_31:

LABEL_34:
LABEL_35:

  LOBYTE(v19) = 0;
LABEL_36:
  v14 = v39;
LABEL_26:

  return (char)v19;
}

- (void)scheduleCoreSpeechTask:(unint64_t)a3 minorVersion:(unint64_t)a4 downloadedModels:(id)a5 preinstalledModels:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  if (self->delegate)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__HSModel_scheduleCoreSpeechTask_minorVersion_downloadedModels_preinstalledModels___block_invoke;
    aBlock[3] = &unk_264E10A50;
    aBlock[4] = self;
    v12 = _Block_copy(aBlock);
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v13 = (void *)getCSCoreSpeechServicesClass_softClass;
    uint64_t v19 = getCSCoreSpeechServicesClass_softClass;
    if (!getCSCoreSpeechServicesClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      unsigned int v21 = __getCSCoreSpeechServicesClass_block_invoke;
      uint64_t v22 = &unk_264E10A78;
      unint64_t v23 = &v16;
      __getCSCoreSpeechServicesClass_block_invoke((uint64_t)&buf);
      v13 = (void *)v17[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v16, 8);
    [v14 voiceTriggerRTModelForVersion:a3 minorVersion:a4 downloadedModels:v10 preinstalledModels:v11 completion:v12];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[HSModel scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:]";
    _os_log_impl(&dword_23BCED000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: delegate is nil", (uint8_t *)&buf, 0xCu);
  }
}

void __83__HSModel_scheduleCoreSpeechTask_minorVersion_downloadedModels_preinstalledModels___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (CFPreferencesGetAppBooleanValue(@"simulateCoreSpeechNotRespoding", @"com.apple.UARPUpdaterServiceLegacyAudio", 0))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_23BCED000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Simulating CoreSpeech not responding", buf, 2u);
    }
  }
  else
  {
    if (v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_23BCED000, &_os_log_internal, OS_LOG_TYPE_INFO, "Download Model %@", buf, 0xCu);
    }
    if (v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_23BCED000, &_os_log_internal, OS_LOG_TYPE_INFO, "Fallback Model %@", buf, 0xCu);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(NSObject **)(v10 + 16);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __83__HSModel_scheduleCoreSpeechTask_minorVersion_downloadedModels_preinstalledModels___block_invoke_42;
    v12[3] = &unk_264E10A28;
    v12[4] = v10;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, v12);
  }
}

void __83__HSModel_scheduleCoreSpeechTask_minorVersion_downloadedModels_preinstalledModels___block_invoke_42(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1[4] + 8);
  if (v2)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7];
    [v2 setHSModel:v3 fallbackModel:v4 error:v5];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[HSModel scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:]_block_invoke";
    _os_log_impl(&dword_23BCED000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: delegate is nil", (uint8_t *)&v6, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->delegate, 0);
}

@end