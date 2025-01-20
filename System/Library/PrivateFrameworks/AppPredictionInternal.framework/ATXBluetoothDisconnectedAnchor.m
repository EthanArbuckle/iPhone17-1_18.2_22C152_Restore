@interface ATXBluetoothDisconnectedAnchor
+ (BOOL)isActive;
+ (BOOL)shouldPredicateOnStartDate;
+ (BOOL)shouldProcessContextStoreNotification;
+ (BOOL)usesContextStoreForRealTimeNotifications;
+ (Class)supportedDuetDataProviderClass;
+ (double)secondsOfInfluence;
+ (id)duetEventsPredicates;
+ (id)invalidationPredicateForContextStoreRegistration;
+ (id)keyPathForContextStore;
+ (id)longDescription;
+ (id)predicateForContextStoreRegistration;
+ (id)sampleEvent;
+ (int64_t)anchorType;
@end

@implementation ATXBluetoothDisconnectedAnchor

+ (Class)supportedDuetDataProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)duetEventsPredicates
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithIntegerValue:1];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithMinimumDuration:60.0];
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (int64_t)anchorType
{
  return 2;
}

+ (id)longDescription
{
  return @"Bluetooth device is disconnected.";
}

+ (double)secondsOfInfluence
{
  return 3600.0;
}

+ (BOOL)shouldPredicateOnStartDate
{
  return 0;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  return 1;
}

+ (id)keyPathForContextStore
{
  return (id)[MEMORY[0x1E4F5B6B8] keyPathForBluetoothDataDictionary];
}

+ (id)predicateForContextStoreRegistration
{
  return (id)[MEMORY[0x1E4F5B6B8] predicateForBluetoothConnectionStatus:0];
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  return (id)[MEMORY[0x1E4F5B6B8] predicateForBluetoothConnectionStatus:1];
}

+ (BOOL)shouldProcessContextStoreNotification
{
  v2 = objc_opt_class();
  return [v2 shouldProcessContextStoreNotificationForDict];
}

+ (BOOL)isActive
{
  v2 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  BOOL v3 = [v2 bluetoothState] == 0;

  return v3;
}

+ (id)sampleEvent
{
  v2 = [ATXBluetoothDuetEvent alloc];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-20.0];
  v4 = objc_opt_new();
  v5 = [(ATXBluetoothDuetEvent *)v2 initWithBluetoothState:0 deviceType:1 deviceName:@"Sample BT Device" hardwareAddress:@"1:1:1:1:1" startDate:v3 endDate:v4];

  return v5;
}

@end