@interface InitObservation
@end

@implementation InitObservation

id ___InitObservation_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.message.EFContentProtectionObserver", 0);
  v1 = (void *)_observationQueue;
  _observationQueue = (uint64_t)v0;

  dispatch_async((dispatch_queue_t)_observationQueue, &__block_literal_global_84);
  return EFLogRegisterStateCaptureBlock((void *)_observationQueue, @"EFContentProtectionObserver", 4, &__block_literal_global_94);
}

void ___InitObservation_block_invoke_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (MKBDeviceFormattedForContentProtection())
  {
    int v2 = -1431655766;
    notify_register_dispatch((const char *)*MEMORY[0x1E4F78160], &v2, (dispatch_queue_t)_observationQueue, &__block_literal_global_87);
    _beganObservingTime = CFAbsoluteTimeGetCurrent();
  }
  sContentProtectionState = _KeyBagLockState();
  dispatch_queue_t v0 = _Log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(sContentProtectionState + 1) > 4) {
      v1 = @"unknown";
    }
    else {
      v1 = off_1E6121ED0[sContentProtectionState + 1];
    }
    int v2 = 138543362;
    v3 = v1;
    _os_log_impl(&dword_1B5A59000, v0, OS_LOG_TYPE_DEFAULT, "Keybag lock status initialized to %{public}@", (uint8_t *)&v2, 0xCu);
  }
}

void ___InitObservation_block_invoke_3()
{
  dispatch_queue_t v0 = _Log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl(&dword_1B5A59000, v0, OS_LOG_TYPE_DEFAULT, "Keybag lock status has changed", v2, 2u);
  }

  _lastNotificationTime = CFAbsoluteTimeGetCurrent();
  unint64_t v1 = _KeyBagLockState();
  _NotifyObserversWithContentProtectionState(v1);
}

@end