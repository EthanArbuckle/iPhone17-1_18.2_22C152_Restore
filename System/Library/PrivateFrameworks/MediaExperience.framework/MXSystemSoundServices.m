@interface MXSystemSoundServices
+ (id)sharedInstance;
- (BOOL)shouldPrivacyPongPlay;
- (MXSystemSoundServices)init;
- (int)playSystemSound:(unsigned int)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)playPrivacyPongSound;
@end

@implementation MXSystemSoundServices

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_3);
  }
  return (id)sharedInstance_sSharedInstance_1;
}

MXSystemSoundServices *__39__MXSystemSoundServices_sharedInstance__block_invoke()
{
  result = objc_alloc_init(MXSystemSoundServices);
  sharedInstance_sSharedInstance_1 = (uint64_t)result;
  return result;
}

- (MXSystemSoundServices)init
{
  v5.receiver = self;
  v5.super_class = (Class)MXSystemSoundServices;
  v2 = [(MXSystemSoundServices *)&v5 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->mSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperience.SystemSoundServicesQueue", v3);
    v2->_shouldPrivacyPongPlay = 0;
  }
  return v2;
}

- (int)playSystemSound:(unsigned int)a3 completionBlock:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    mSerialQueue = self->mSerialQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__MXSystemSoundServices_playSystemSound_completionBlock___block_invoke;
    v7[3] = &unk_1E57C6340;
    unsigned int v8 = a3;
    v7[4] = a4;
    MXDispatchAsync((uint64_t)"-[MXSystemSoundServices playSystemSound:completionBlock:]", (uint64_t)"MX_SystemSoundServices.m", 59, 0, 0, mSerialQueue, (uint64_t)v7);
    return 0;
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return -15681;
  }
}

void __57__MXSystemSoundServices_playSystemSound_completionBlock___block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  mSerialQueue = self->mSerialQueue;
  if (mSerialQueue)
  {
    dispatch_release(mSerialQueue);
    self->mSerialQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MXSystemSoundServices;
  [(MXSystemSoundServices *)&v4 dealloc];
}

- (void)playPrivacyPongSound
{
  self->_shouldPrivacyPongPlay = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__MXSystemSoundServices_playPrivacyPongSound__block_invoke;
  v2[3] = &unk_1E57C6368;
  v2[4] = self;
  [(MXSystemSoundServices *)self playSystemSound:1365 completionBlock:v2];
}

uint64_t __45__MXSystemSoundServices_playPrivacyPongSound__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (dword_1E9359ED0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    result = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(unsigned char *)(*(void *)(v1 + 32) + 16) = 0;
  return result;
}

- (BOOL)shouldPrivacyPongPlay
{
  return self->_shouldPrivacyPongPlay;
}

@end