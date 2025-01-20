@interface EACellBroadcastMessageListener
+ (id)sharedInstance;
- (EACellBroadcastMessageListener)init;
- (void)_cellBroadcastMessageReceived:(id)a3;
- (void)dealloc;
- (void)start;
@end

@implementation EACellBroadcastMessageListener

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __48__EACellBroadcastMessageListener_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_alloc_init(EACellBroadcastMessageListener);
  return MEMORY[0x270F9A758]();
}

- (void)_cellBroadcastMessageReceived:(id)a3
{
}

- (EACellBroadcastMessageListener)init
{
  EARegisterUserNotificationsLogging();
  v7.receiver = self;
  v7.super_class = (Class)EACellBroadcastMessageListener;
  v3 = [(EACellBroadcastMessageListener *)&v7 init];
  if (v3)
  {
    v4 = objc_alloc_init(EAEmergencyAlertCenter);
    emergencyAlertCenter = v3->_emergencyAlertCenter;
    v3->_emergencyAlertCenter = v4;
  }
  return v3;
}

- (void)start
{
}

- (void)dealloc
{
  TURemoveTelephonyCenterObserver();
  v3.receiver = self;
  v3.super_class = (Class)EACellBroadcastMessageListener;
  [(EACellBroadcastMessageListener *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end