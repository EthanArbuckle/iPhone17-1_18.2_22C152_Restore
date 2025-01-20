@interface MXBiomeStreams
+ (id)sharedInstance;
- (MXBiomeStreams)init;
- (void)dealloc;
- (void)updateBiomeSilentMode:(BOOL)a3 clientType:(unsigned int)a4 untilTime:(id)a5 reason:(id)a6;
@end

@implementation MXBiomeStreams

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  return (id)sharedInstance_sSharedInstance_0;
}

MXBiomeStreams *__32__MXBiomeStreams_sharedInstance__block_invoke()
{
  result = objc_alloc_init(MXBiomeStreams);
  sharedInstance_sSharedInstance_0 = (uint64_t)result;
  return result;
}

- (MXBiomeStreams)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)MXBiomeStreams;
  v2 = [(MXBiomeStreams *)&v7 init];
  if (v2)
  {
    if (BiomeStreamsLibraryCore() && BiomeLibraryLibraryCore())
    {
      if (dword_1E9359ED0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->mAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperience.MXBiomeStreams", v5);
    }
    else
    {
      v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->mAccessQueue);
  self->mAccessQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXBiomeStreams;
  [(MXBiomeStreams *)&v3 dealloc];
}

- (void)updateBiomeSilentMode:(BOOL)a3 clientType:(unsigned int)a4 untilTime:(id)a5 reason:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  mAccessQueue = self->mAccessQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke;
  v14[3] = &unk_1E57C5AD8;
  BOOL v16 = a3;
  unsigned int v15 = a4;
  v14[4] = a5;
  v14[5] = a6;
  MXDispatchAsync((uint64_t)"-[MXBiomeStreams updateBiomeSilentMode:clientType:untilTime:reason:]", (uint64_t)"MXBiomeStreams.m", 93, 0, 0, mAccessQueue, (uint64_t)v14);
}

void __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v16 = 0;
  uint64_t v17 = (uint64_t)&v16;
  uint64_t v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  objc_super v3 = (objc_class *)getBMDeviceSilentModeClass_softClass;
  uint64_t v21 = getBMDeviceSilentModeClass_softClass;
  if (!getBMDeviceSilentModeClass_softClass)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = (uint64_t)__getBMDeviceSilentModeClass_block_invoke;
    v14 = &unk_1E57C5B30;
    unsigned int v15 = &v16;
    __getBMDeviceSilentModeClass_block_invoke((uint64_t)&v11);
    objc_super v3 = *(objc_class **)(v17 + 40);
  }
  _Block_object_dispose(&v16, 8);
  id v4 = [v3 alloc];
  v5 = objc_msgSend(v4, "initWithStarting:clientType:untilTime:reason:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 52)), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v11 = 0;
  uint64_t v12 = (uint64_t)&v11;
  uint64_t v13 = 0x2020000000;
  v6 = (uint64_t (*)(uint64_t, uint64_t))getBiomeLibrarySymbolLoc_ptr;
  v14 = getBiomeLibrarySymbolLoc_ptr;
  if (!getBiomeLibrarySymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = (uint64_t)__getBiomeLibrarySymbolLoc_block_invoke;
    v19 = (void (*)(uint64_t, uint64_t))&unk_1E57C5B30;
    v20 = (void (*)(uint64_t))&v11;
    objc_super v7 = (void *)BiomeLibraryLibrary();
    uint64_t v8 = dlsym(v7, "BiomeLibrary");
    *(void *)(*((void *)v20 + 1) + 24) = v8;
    getBiomeLibrarySymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v20 + 1) + 24);
    v6 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 24);
  }
  _Block_object_dispose(&v11, 8);
  if (!v6)
  {
    __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
    __break(1u);
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v6(v9, v10), "Device"), "SilentMode"), "source"), "sendEvent:", v5);
}

uint64_t __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getBMDeviceSilentModeClass_block_invoke_cold_1(v0);
}

@end