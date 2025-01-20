@interface ATXMicrolocationVisitAnchor
+ (BOOL)isActive;
+ (BOOL)shouldPredicateOnStartDate;
+ (BOOL)shouldProcessContextStoreNotification;
+ (BOOL)usesContextStoreForRealTimeNotifications;
+ (Class)supportedDuetDataProviderClass;
+ (double)secondsOfInfluence;
+ (id)duetEventsPredicates;
+ (id)keyPathForContextStore;
+ (id)longDescription;
+ (id)predicateForContextStoreRegistration;
+ (id)sampleEvent;
+ (int64_t)anchorType;
+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5;
+ (void)unregisterForNotificationsWithoutUsingContextStoreForObserver:(id)a3;
@end

@implementation ATXMicrolocationVisitAnchor

+ (Class)supportedDuetDataProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)duetEventsPredicates
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"confidence >= %@", &unk_1F27F3C98];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (int64_t)anchorType
{
  return 19;
}

+ (id)longDescription
{
  return @"User entered a microlocation.";
}

+ (double)secondsOfInfluence
{
  return 7200.0;
}

+ (BOOL)shouldPredicateOnStartDate
{
  return 1;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  return 0;
}

+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5
{
  v6 = (void *)MEMORY[0x1E4F28C40];
  id v7 = a3;
  id v11 = [v6 defaultCenter];
  uint64_t v8 = *MEMORY[0x1E4F5B630];
  v9 = [MEMORY[0x1E4F5B5F8] microLocationVisitStream];
  v10 = [v9 name];
  [v11 addObserver:v7 selector:a4 name:v8 object:v10];
}

+ (void)unregisterForNotificationsWithoutUsingContextStoreForObserver:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28C40];
  id v4 = a3;
  id v8 = [v3 defaultCenter];
  uint64_t v5 = *MEMORY[0x1E4F5B630];
  v6 = [MEMORY[0x1E4F5B5F8] microLocationVisitStream];
  id v7 = [v6 name];
  [v8 removeObserver:v4 name:v5 object:v7];
}

+ (id)keyPathForContextStore
{
  return 0;
}

+ (id)predicateForContextStoreRegistration
{
  return 0;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  return 0;
}

+ (BOOL)isActive
{
  return 1;
}

+ (id)sampleEvent
{
  v2 = [ATXMicrolocationVisitDuetEvent alloc];
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-20.0];
  v6 = objc_opt_new();
  id v7 = [(ATXMicrolocationVisitDuetEvent *)v2 initWithDominantMicrolocationUUID:v3 microlocationProbabilities:v4 startDate:v5 endDate:v6];

  return v7;
}

@end