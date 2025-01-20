@interface ATXAudioDisconnectedAnchor
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

@implementation ATXAudioDisconnectedAnchor

+ (Class)supportedDuetDataProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)duetEventsPredicates
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithIntegerValue:1];
  v3 = (void *)MEMORY[0x1E4F5B5D0];
  v4 = objc_msgSend(MEMORY[0x1E4F5B4B8], "portType", v2);
  v5 = [v3 predicateForObjectsWithMetadataKey:v4 andValue:@"Headphones"];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithMinimumDuration:60.0];
  v9[2] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];

  return v7;
}

+ (int64_t)anchorType
{
  return 17;
}

+ (id)longDescription
{
  return @"Wired audio device is disconnected.";
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
  return (id)[MEMORY[0x1E4F5B6B8] keyPathForAudioOutputDataDictionary];
}

+ (id)predicateForContextStoreRegistration
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5B6B8] predicateForAudioOutputStatus:0];
  v3 = (void *)MEMORY[0x1E4F5B6E8];
  v4 = [(id)objc_opt_class() keyPathForContextStore];
  v5 = [(id)objc_opt_class() keyPathForContextStore];
  v6 = [MEMORY[0x1E4F5B6B8] audioPortTypeKey];
  v7 = [v3 predicateForKeyPath:v4, @"SELF.%@.value.%K = %@", v5, v6, @"Headphones" withFormat];

  v8 = (void *)MEMORY[0x1E4F5B6E8];
  v12[0] = v2;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = [v8 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5B6B8] predicateForAudioOutputStatus:1];
  v3 = (void *)MEMORY[0x1E4F5B6E8];
  v4 = [(id)objc_opt_class() keyPathForContextStore];
  v5 = [(id)objc_opt_class() keyPathForContextStore];
  v6 = [MEMORY[0x1E4F5B6B8] audioPortTypeKey];
  v7 = [v3 predicateForKeyPath:v4, @"SELF.%@.value.%K = %@", v5, v6, @"Headphones" withFormat];

  v8 = (void *)MEMORY[0x1E4F5B6E8];
  v12[0] = v2;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = [v8 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  v2 = objc_opt_class();
  return [v2 shouldProcessContextStoreNotificationForDict];
}

+ (BOOL)isActive
{
  v2 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  BOOL v3 = [v2 audioState] == 0;

  return v3;
}

+ (id)sampleEvent
{
  v2 = [ATXAudioDuetEvent alloc];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-20.0];
  v4 = objc_opt_new();
  v5 = [(ATXAudioDuetEvent *)v2 initWithAudioState:0 deviceIdentifier:@"Headphones" portType:@"Headphones" portName:@"Headphones" routeChangeReason:&unk_1F27F2088 startDate:v3 endDate:v4];

  return v5;
}

@end