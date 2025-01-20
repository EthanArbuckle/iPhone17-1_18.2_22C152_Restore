@interface FPSupport
@end

@implementation FPSupport

id __67__FPSupport_PowerStateSingleton_sharedFPSupportPowerStateSingleton__block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  sharedFPSupportPowerStateSingleton_gSharedFPSupportPowerState = (uint64_t)result;
  return result;
}

uint64_t __49__FPSupport_PowerStateSingleton_postNotification__block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  +[FPSupport_PowerStateSingleton sharedFPSupportPowerStateSingleton];

  return CMNotificationCenterPostNotification();
}

id __57__FPSupport_VideoRangeSingleton_sharedFPSupportSingleton__block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  sharedFPSupportSingleton_gSharedFPSupport = (uint64_t)result;
  return result;
}

uint64_t __49__FPSupport_VideoRangeSingleton_postNotification__block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  +[FPSupport_VideoRangeSingleton sharedFPSupportSingleton];

  return CMNotificationCenterPostNotification();
}

uint64_t __80__FPSupport_VideoRangeSingleton_observeValueForKeyPath_ofObject_change_context___block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  +[FPSupport_VideoRangeSingleton sharedFPSupportSingleton];

  return CMNotificationCenterPostNotification();
}

uint64_t __FPSupport_IsRunningInAppleVirtualMachine_block_invoke()
{
  size_t v1 = 4;
  return sysctlbyname("kern.hv_vmm_present", &FPSupport_IsRunningInAppleVirtualMachine_isAppleVirtualMachine, &v1, 0, 0);
}

uint64_t __FPSupport_GetAudioSpatializationPreferencesMonitor_block_invoke()
{
  if ((in_audio_mx_server_process() & 1) != 0
    || (uint64_t result = FigAudioSessionCreateUsingAuxiliaryAVAudioSession(*MEMORY[0x1E4F1CF80], 0, @"AudioSpatializationPreferencesMonitor", &FPSupport_GetAudioSpatializationPreferencesMonitor_audioSession), !result))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    return FigNotificationCenterAddWeakListener();
  }
  return result;
}

dispatch_queue_t __FPSupport_AudioSpatializationPreferencesChanged_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.coremedia.fpsupport.AudioSpatializationPreferencesChangedQueue", 0);
  FPSupport_AudioSpatializationPreferencesChanged_sAudioSpatializationPreferencesChangedQueue = (uint64_t)result;
  return result;
}

uint64_t __FPSupport_AudioSpatializationPreferencesChanged_block_invoke_2()
{
  CMNotificationCenterGetDefaultLocalCenter();
  if (FPSupport_GetAudioSpatializationPreferencesMonitor_onceToken != -1) {
    dispatch_once(&FPSupport_GetAudioSpatializationPreferencesMonitor_onceToken, &__block_literal_global_51);
  }

  return CMNotificationCenterPostNotification();
}

@end