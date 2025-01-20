@interface CBDisplayStateClient
- (BOOL)supported;
- (BOOL)switchToFlipbookState:(int64_t)a3 error:(id *)a4;
- (BOOL)transitionToDisplayMode:(int64_t)a3 withDuration:(double)a4 error:(id *)a5;
- (CBDisplayStateClient)init;
- (CBDisplayStateClientDelegate)completionDelegate;
- (int64_t)displayMode;
- (void)_displayModeChangeCompletionHandler:(int64_t)a3;
- (void)_removeCompletionDelegate;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)setCompletionDelegate:(id)a3;
@end

@implementation CBDisplayStateClient

- (CBDisplayStateClient)init
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)CBDisplayStateClient;
  v8 = [(CBDisplayStateClient *)&v6 init];
  if (v8)
  {
    v2 = objc_alloc_init(BrightnessSystemClientInternal);
    v8->_bsci = v2;
    dispatch_queue_t v3 = dispatch_queue_create("CB - DisplayStateClient", 0);
    v8->_queue = (OS_dispatch_queue *)v3;
    os_log_t v4 = os_log_create("com.apple.CoreBrightness.DisplayStateClient", "Default");
    v8->_logHandle = (OS_os_log *)v4;
  }
  return v8;
}

- (void)dealloc
{
  os_log_t v4 = self;
  SEL v3 = a2;

  if (v4->_queue) {
    dispatch_release((dispatch_object_t)v4->_queue);
  }
  if (v4->_logHandle) {

  }
  v2.receiver = v4;
  v2.super_class = (Class)CBDisplayStateClient;
  [(CBDisplayStateClient *)&v2 dealloc];
}

- (void)activate
{
  v10 = self;
  SEL v9 = a2;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  objc_super v6 = __32__CBDisplayStateClient_activate__block_invoke;
  SEL v7 = &unk_1E6218FE0;
  v8 = v10;
  dispatch_sync(queue, &block);
}

uint64_t __32__CBDisplayStateClient_activate__block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  objc_super v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = __32__CBDisplayStateClient_activate__block_invoke_2;
  v8 = &unk_1E62190B8;
  uint64_t v9 = *(void *)(a1 + 32);
  return objc_msgSend(v2, "registerNotificationBlock:");
}

void __32__CBDisplayStateClient_activate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = a1;
  v17 = a2;
  id v16 = a3;
  uint64_t v15 = a1;
  id v3 = a2;
  id v4 = v16;
  int v5 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = __32__CBDisplayStateClient_activate__block_invoke_3;
  uint64_t v11 = &unk_1E62192B0;
  v12 = v17;
  id v13 = v16;
  uint64_t v14 = *(void *)(a1 + 32);
  dispatch_async(v5, &block);
}

void __32__CBDisplayStateClient_activate__block_invoke_3(id *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ([a1[4] isEqual:@"DisplayModeChangeComplete"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(a1[6], "_displayModeChangeCompletionHandler:", objc_msgSend(a1[5], "integerValue"));
    }
    else
    {
      id v3 = *((void *)a1[6] + 2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        uint64_t v1 = objc_opt_class();
        __os_log_helper_16_2_1_8_64((uint64_t)v4, v1);
        _os_log_fault_impl(&dword_1BA438000, v3, OS_LOG_TYPE_FAULT, "unexpected display mode payload type (%@)", v4, 0xCu);
      }
    }
  }
}

- (void)cancel
{
  uint64_t v10 = self;
  SEL v9 = a2;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = __30__CBDisplayStateClient_cancel__block_invoke;
  SEL v7 = &unk_1E6218FE0;
  int v8 = v10;
  dispatch_sync(queue, &block);
}

uint64_t __30__CBDisplayStateClient_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) registerNotificationBlock:0];
  [*(id *)(a1 + 32) _removeCompletionDelegate];
  uint64_t result = a1;
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  return result;
}

- (void)setCompletionDelegate:(id)a3
{
  id v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  SEL v7 = __46__CBDisplayStateClient_setCompletionDelegate___block_invoke;
  int v8 = &unk_1E62196A0;
  SEL v9 = v13;
  id v10 = a3;
  dispatch_sync(queue, &block);
}

uint64_t __46__CBDisplayStateClient_setCompletionDelegate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeCompletionDelegate];
  uint64_t result = a1;
  if (*(void *)(a1 + 40))
  {
    *(void *)(*(void *)(a1 + 32) + 40) = *(id *)(a1 + 40);
    return [*(id *)(*(void *)(a1 + 32) + 8) addPropertyForNotification:@"DisplayModeChangeComplete"];
  }
  return result;
}

- (void)_removeCompletionDelegate
{
  self->_completionDelegate = 0;
  [(BrightnessSystemClientInternal *)self->_bsci removePropertyFromNotification:@"DisplayModeChangeComplete"];
}

- (void)_displayModeChangeCompletionHandler:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19 = self;
  SEL v18 = a2;
  uint64_t v17 = a3;
  os_log_t v16 = 0;
  if (self->_logHandle)
  {
    logHandle = v19->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t v16 = logHandle;
  os_signpost_type_t v15 = OS_SIGNPOST_EVENT;
  os_signpost_id_t v14 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v20, v17);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v16, v15, v14, "DisplayModeClientCompletionHandler", "mode: %ld", v20, 0xCu);
  }
  if ([(CBDisplayStateClientDelegate *)v19->_completionDelegate delegateQueue])
  {
    id v13 = 0;
    id v13 = v19->_completionDelegate;
    id v3 = [(CBDisplayStateClientDelegate *)v19->_completionDelegate delegateQueue];
    uint64_t block = MEMORY[0x1E4F143A8];
    int v7 = -1073741824;
    int v8 = 0;
    SEL v9 = __60__CBDisplayStateClient__displayModeChangeCompletionHandler___block_invoke;
    id v10 = &unk_1E6219538;
    id v11 = v13;
    uint64_t v12 = v17;
    dispatch_async(v3, &block);
  }
}

void __60__CBDisplayStateClient__displayModeChangeCompletionHandler___block_invoke(uint64_t a1)
{
}

- (BOOL)supported
{
  id v10 = self;
  SEL v9 = a2;
  uint64_t v3 = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = __33__CBDisplayStateClient_supported__block_invoke;
  int v7 = &unk_1E6218FE0;
  int v8 = self;
  uint64_t v12 = &supported_onceToken;
  id v11 = &v3;
  if (supported_onceToken != -1) {
    dispatch_once(v12, v11);
  }
  return v10->_supported;
}

void __33__CBDisplayStateClient_supported__block_invoke(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  objc_super v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = __33__CBDisplayStateClient_supported__block_invoke_2;
  int v7 = &unk_1E6218FE0;
  uint64_t v8 = *(void *)(a1 + 32);
  dispatch_sync(v2, &block);
}

void __33__CBDisplayStateClient_supported__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 8) copyPropertyForKey:@"DisplayStateControlSupported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *(unsigned char *)(*(void *)(a1 + 32) + 33) = [v2 BOOLValue] & 1;
    }
  }
}

- (int64_t)displayMode
{
  SEL v18 = self;
  SEL v17 = a2;
  uint64_t v12 = 0;
  id v13 = &v12;
  int v14 = 0x20000000;
  int v15 = 32;
  uint64_t v16 = 5;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = __35__CBDisplayStateClient_displayMode__block_invoke;
  uint64_t v9 = &unk_1E6219CA8;
  uint64_t v10 = v18;
  id v11 = &v12;
  dispatch_sync(queue, &block);
  int64_t v4 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v4;
}

void __35__CBDisplayStateClient_displayMode__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 8) copyPropertyForKey:@"DisplayMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (int)[v2 intValue];
    }
  }
}

- (BOOL)transitionToDisplayMode:(int64_t)a3 withDuration:(double)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v46 = self;
  SEL v45 = a2;
  uint64_t v44 = a3;
  double v43 = a4;
  v42 = a5;
  os_log_t v41 = 0;
  if (self->_logHandle)
  {
    logHandle = v46->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  os_log_t v41 = logHandle;
  os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v49, v44);
    _os_log_impl(&dword_1BA438000, v41, v40, "[Display Mode] Client request transition to display mode %ld", v49, 0xCu);
  }
  os_log_t v39 = 0;
  if (v46->_logHandle)
  {
    int v14 = v46->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v13 = init_default_corebrightness_log();
    }
    int v14 = v13;
  }
  os_log_t v39 = v14;
  os_signpost_type_t v38 = OS_SIGNPOST_INTERVAL_BEGIN;
  os_signpost_id_t v37 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v14))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v48, v44);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v39, v38, v37, "DisplayModeClientTransitionToDisplayMode", "%ld", v48, 0xCu);
  }
  uint64_t v32 = 0;
  v33 = &v32;
  int v34 = 0x20000000;
  int v35 = 32;
  char v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  int v29 = 0x20000000;
  int v30 = 32;
  uint64_t v31 = 0;
  queue = v46->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v18 = -1073741824;
  int v19 = 0;
  v20 = __67__CBDisplayStateClient_transitionToDisplayMode_withDuration_error___block_invoke;
  uint64_t v21 = &unk_1E621ACA0;
  v22 = v46;
  uint64_t v25 = v44;
  double v26 = v43;
  v23 = &v32;
  v24 = &v27;
  dispatch_sync(queue, &block);
  if (v42 && v28[3])
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = [NSString stringWithUTF8String:CBClientErrorDomain];
    uint64_t v6 = [v11 errorWithDomain:v12 code:v28[3] userInfo:0];
    id *v42 = (id)v6;
  }
  if (v46->_logHandle)
  {
    uint64_t v10 = v46->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v9 = init_default_corebrightness_log();
    }
    uint64_t v10 = v9;
  }
  if (os_signpost_enabled(v10))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v47, v44);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DisplayModeClientTransitionToDisplayMode", "%ld", v47, 0xCu);
  }
  char v8 = *((unsigned char *)v33 + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v32, 8);
  return v8 & 1;
}

void __67__CBDisplayStateClient_transitionToDisplayMode_withDuration_error___block_invoke(uint64_t a1)
{
  v4[2] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA9ECAE0]();
  if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    v3[0] = @"Value";
    v4[0] = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    v3[1] = @"TransitionLength";
    v4[1] = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setSyncProperty:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v4, v3, 2), @"DisplayMode") & 1;
    if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) & 1) == 0) {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
  }
}

- (BOOL)switchToFlipbookState:(int64_t)a3 error:(id *)a4
{
  uint64_t v21 = self;
  SEL v20 = a2;
  int64_t v19 = a3;
  int v18 = a4;
  v14[0] = 0;
  v14[1] = v14;
  int v15 = 0x20000000;
  int v16 = 32;
  uint64_t v17 = 0;
  queue = self->_queue;
  uint64_t block = MEMORY[0x1E4F143A8];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __52__CBDisplayStateClient_switchToFlipbookState_error___block_invoke;
  uint64_t v10 = &unk_1E62197B8;
  id v11 = v21;
  int64_t v13 = a3;
  uint64_t v12 = v14;
  dispatch_sync(queue, &block);
  _Block_object_dispose(v14, 8);
  return 1;
}

void __52__CBDisplayStateClient_switchToFlipbookState_error___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22 = a1;
  uint64_t v21 = a1;
  os_log_t v20 = 0;
  if (*(void *)(a1[4] + 16))
  {
    uint64_t v6 = *(NSObject **)(a1[4] + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    uint64_t v6 = inited;
  }
  os_log_t v20 = v6;
  os_signpost_type_t v19 = OS_SIGNPOST_INTERVAL_BEGIN;
  os_signpost_id_t v18 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v6))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v24, a1[6]);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v20, v19, v18, "DisplayStateClientSwitchToFlipbookState", "%ld", v24, 0xCu);
  }
  context = (void *)MEMORY[0x1BA9ECAE0]();
  if (*(unsigned char *)(a1[4] + 32))
  {
    char v17 = 0;
    char v17 = objc_msgSend(*(id *)(a1[4] + 8), "setSyncProperty:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", a1[6]), @"FlipBookState") & 1;
    if (!v17) {
      *(void *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = 2;
  }
  if ([*(id *)(a1[4] + 40) delegateQueue])
  {
    id v16 = 0;
    id v16 = *(id *)(a1[4] + 40);
    uint64_t v1 = [*(id *)(a1[4] + 40) delegateQueue];
    uint64_t block = MEMORY[0x1E4F143A8];
    int v9 = -1073741824;
    int v10 = 0;
    id v11 = __52__CBDisplayStateClient_switchToFlipbookState_error___block_invoke_27;
    uint64_t v12 = &unk_1E6219808;
    uint64_t v14 = a1[5];
    id v13 = v16;
    uint64_t v15 = a1[6];
    dispatch_async(v1, &block);
  }
  if (*(void *)(a1[4] + 16))
  {
    uint64_t v3 = *(NSObject **)(a1[4] + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v2 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v2 = init_default_corebrightness_log();
    }
    uint64_t v3 = v2;
  }
  if (os_signpost_enabled(v3))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v23, a1[6]);
    _os_signpost_emit_with_name_impl(&dword_1BA438000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DisplayStateClientSwitchToFlipbookState", "%ld", v23, 0xCu);
  }
}

void __52__CBDisplayStateClient_switchToFlipbookState_error___block_invoke_27(uint64_t a1)
{
  context = (void *)MEMORY[0x1BA9ECAE0]();
  uint64_t v3 = 0;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", objc_msgSend(NSString, "stringWithUTF8String:", CBClientErrorDomain), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0);
  }
  [*(id *)(a1 + 32) didCompleteSwitchToFlipbookState:*(void *)(a1 + 48) withError:v3];
}

- (CBDisplayStateClientDelegate)completionDelegate
{
  return self->_completionDelegate;
}

@end