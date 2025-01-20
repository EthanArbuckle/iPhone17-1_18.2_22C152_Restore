@interface MXVolumeManager
+ (id)sharedInstance;
+ (void)applyVolumeReductionToHeadphoneRoutes:(float)a3;
- (MXVolumeManager)init;
- (void)dealloc;
@end

@implementation MXVolumeManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1) {
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_65);
  }
  return (id)sharedInstance_sSharedInstance_10;
}

MXVolumeManager *__33__MXVolumeManager_sharedInstance__block_invoke()
{
  result = objc_alloc_init(MXVolumeManager);
  sharedInstance_sSharedInstance_10 = (uint64_t)result;
  return result;
}

- (MXVolumeManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)MXVolumeManager;
  v2 = [(MXVolumeManager *)&v4 init];
  if (v2) {
    v2->mTimerDuration = (int)FigGetCFPreferenceNumberWithDefault();
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)MEMORY[0x1997179E0](self, a2);
  v4.receiver = self;
  v4.super_class = (Class)MXVolumeManager;
  [(MXVolumeManager *)&v4 dealloc];
}

+ (void)applyVolumeReductionToHeadphoneRoutes:(float)a3
{
  objc_super v4 = MXGetSerialQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MXVolumeManager_applyVolumeReductionToHeadphoneRoutes___block_invoke;
  v5[3] = &__block_descriptor_36_e5_v8__0l;
  float v6 = a3;
  MXDispatchAsyncAndWait((uint64_t)"+[MXVolumeManager applyVolumeReductionToHeadphoneRoutes:]", (uint64_t)"MXVolumeManager.m", 80, 0, 0, v4, (uint64_t)v5);
}

void __57__MXVolumeManager_applyVolumeReductionToHeadphoneRoutes___block_invoke(uint64_t a1)
{
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  PVMApplyVolumeReductionToHeadphoneRoutes(*(float *)(a1 + 32));
}

@end