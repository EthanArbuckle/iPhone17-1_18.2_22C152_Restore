@interface ATXCarPlayConnectedAnchor
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

@implementation ATXCarPlayConnectedAnchor

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
  return 5;
}

+ (id)longDescription
{
  return @"CarPlay device is connected.";
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
  return (id)[MEMORY[0x1E4F5B6B8] keyPathForCarplayConnectedStatus];
}

+ (id)predicateForContextStoreRegistration
{
  v2 = (void *)MEMORY[0x1E4F5B6E8];
  v3 = [(id)objc_opt_class() keyPathForContextStore];
  v4 = [v2 predicateForKeyPath:v3 equalToValue:&unk_1F27F2340];

  return v4;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  v2 = (void *)MEMORY[0x1E4F5B6E8];
  v3 = [(id)objc_opt_class() keyPathForContextStore];
  v4 = [v2 predicateForKeyPath:v3 equalToValue:&unk_1F27F2358];

  return v4;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  v2 = objc_opt_class();
  return [v2 shouldProcessContextStoreNotificationForNumber];
}

+ (BOOL)isActive
{
  v2 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  BOOL v3 = [v2 carPlayState] == 1;

  return v3;
}

+ (id)sampleEvent
{
  v2 = [ATXCarPlayDuetEvent alloc];
  BOOL v3 = objc_opt_new();
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:20.0];
  v5 = [(ATXCarPlayDuetEvent *)v2 initWithCarPlayConnectedState:1 startDate:v3 endDate:v4];

  return v5;
}

@end