@interface ATXLocationExitAnchor
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

@implementation ATXLocationExitAnchor

+ (Class)supportedDuetDataProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)duetEventsPredicates
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (int64_t)anchorType
{
  return 8;
}

+ (id)longDescription
{
  return @"The user exited a known LOI.";
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
  return 0;
}

+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5
{
  v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a3;
  id v8 = [v6 defaultCenter];
  [v8 addObserver:v7 selector:a4 name:*MEMORY[0x1E4F93698] object:0];
}

+ (void)unregisterForNotificationsWithoutUsingContextStoreForObserver:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4 name:*MEMORY[0x1E4F93698] object:0];
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
  v2 = [ATXLocationVisitDuetEvent alloc];
  v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-20.0];
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-10.0];
  v6 = [(ATXLocationVisitDuetEvent *)v2 initWithLocationOfInterestIdentifier:v3 startDate:v4 endDate:v5];

  return v6;
}

@end