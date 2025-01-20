@interface FPSupport_PowerStateSingleton
+ (id)sharedFPSupportPowerStateSingleton;
- (FPSupport_PowerStateSingleton)init;
- (void)dealloc;
- (void)postNotification;
@end

@implementation FPSupport_PowerStateSingleton

+ (id)sharedFPSupportPowerStateSingleton
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__FPSupport_PowerStateSingleton_sharedFPSupportPowerStateSingleton__block_invoke;
  block[3] = &unk_1E5794738;
  block[4] = a1;
  if (sharedFPSupportPowerStateSingleton_onceTokenPowerState != -1) {
    dispatch_once(&sharedFPSupportPowerStateSingleton_onceTokenPowerState, block);
  }
  return (id)sharedFPSupportPowerStateSingleton_gSharedFPSupportPowerState;
}

- (void)postNotification
{
}

- (FPSupport_PowerStateSingleton)init
{
  v5.receiver = self;
  v5.super_class = (Class)FPSupport_PowerStateSingleton;
  v2 = [(FPSupport_PowerStateSingleton *)&v5 init];
  if (v2)
  {
    v2->_notificationQ = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.fpsupport.powerStateChangedNotificationQueue", 0);
    v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__didChangePowerState_ name:*MEMORY[0x1E4F287E8] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)FPSupport_PowerStateSingleton;
  [(FPSupport_PowerStateSingleton *)&v2 dealloc];
}

@end