@interface ATXChargerConnectedAnchor
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

@implementation ATXChargerConnectedAnchor

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
  return 18;
}

+ (id)longDescription
{
  return @"Charger was connected.";
}

+ (double)secondsOfInfluence
{
  return 3600.0;
}

+ (BOOL)shouldPredicateOnStartDate
{
  return 1;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  return 1;
}

+ (id)keyPathForContextStore
{
  return (id)[MEMORY[0x1E4F5B6B8] keyPathForPluginStatus];
}

+ (id)predicateForContextStoreRegistration
{
  return (id)[MEMORY[0x1E4F5B6B8] predicateForPluginStatus:1];
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  return (id)[MEMORY[0x1E4F5B6B8] predicateForPluginStatus:0];
}

+ (BOOL)shouldProcessContextStoreNotification
{
  v2 = objc_opt_class();
  return [v2 shouldProcessContextStoreNotificationForNumber];
}

+ (BOOL)isActive
{
  v2 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  BOOL v3 = [v2 chargerPluggedInState] == 1;

  return v3;
}

+ (id)sampleEvent
{
  v2 = [ATXChargerPluggedInDuetEvent alloc];
  BOOL v3 = objc_opt_new();
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:20.0];
  v5 = [(ATXChargerPluggedInDuetEvent *)v2 initWithChargerPluggedInState:1 adapterType:&unk_1F27F20A0 startDate:v3 endDate:v4];

  return v5;
}

@end