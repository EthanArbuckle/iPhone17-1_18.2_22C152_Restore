@interface ATXGymArrivalAnchor
+ (BOOL)isActive;
+ (BOOL)shouldPredicateOnStartDate;
+ (BOOL)shouldProcessContextStoreNotification;
+ (BOOL)usesContextStoreForRealTimeNotifications;
+ (Class)supportedDuetDataProviderClass;
+ (double)secondsOfInfluence;
+ (id)duetEventsPredicates;
+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4;
+ (id)invalidationPredicateForContextStoreRegistration;
+ (id)longDescription;
+ (id)sampleEvent;
+ (int64_t)anchorType;
+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5;
+ (void)unregisterForNotificationsWithoutUsingContextStoreForObserver:(id)a3;
@end

@implementation ATXGymArrivalAnchor

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
  return 22;
}

+ (id)longDescription
{
  return @"The user has arrived at the gym.";
}

+ (double)secondsOfInfluence
{
  return 1800.0;
}

+ (BOOL)shouldPredicateOnStartDate
{
  return 1;
}

+ (BOOL)usesContextStoreForRealTimeNotifications
{
  return 0;
}

+ (id)invalidationPredicateForContextStoreRegistration
{
  return 0;
}

+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ATXGymArrivalAnchor;
  v4 = objc_msgSendSuper2(&v7, sel_fetchAnchorOccurrencesBetweenStartDate_endDate_, a3, a4);
  v5 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_235);

  return v5;
}

uint64_t __70__ATXGymArrivalAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 possibleCategoryNames];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [v2 possibleCategoryNames];
    v6 = [v5 objectAtIndexedSubscript:0];

    if (([v6 isEqualToString:@"gym"] & 1) != 0
      || [v6 isEqualToString:*MEMORY[0x1E4F64000]])
    {
      objc_super v7 = [v2 endDate];
      v8 = [v2 startDate];
      [v7 timeIntervalSinceDate:v8];
      uint64_t v4 = v9 < 600.0;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  return 0;
}

+ (BOOL)isActive
{
  id v2 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 possibleCategoryNames];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      v6 = [v3 possibleCategoryNames];
      objc_super v7 = [v6 objectAtIndexedSubscript:0];

      if ([v7 isEqualToString:@"gym"]) {
        LOBYTE(v5) = 1;
      }
      else {
        LOBYTE(v5) = [v7 isEqualToString:*MEMORY[0x1E4F64000]];
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (id)sampleEvent
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = [ATXPOICategoryVisitDuetEvent alloc];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  v10[0] = @"gym";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v5 = (void *)[v3 initWithArray:v4];
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-20.0];
  objc_super v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-10.0];
  v8 = [(ATXPOICategoryVisitDuetEvent *)v2 initWithPossibleCategoryNames:v5 startDate:v6 endDate:v7];

  return v8;
}

+ (void)registerForNotificationsWithoutUsingContextStoreForObserver:(id)a3 enterSelector:(SEL)a4 exitSelector:(SEL)a5
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = +[ATXPOICategoryVisitDuetDataProvider sharedInstance];
  uint64_t v9 = *MEMORY[0x1E4F64000];
  v11[0] = @"gym";
  v11[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [v8 subscribeToPOIChangesForCategory:v10 observer:v7 enterSelector:a4 exitSelector:a5];
}

+ (void)unregisterForNotificationsWithoutUsingContextStoreForObserver:(id)a3
{
  id v3 = +[ATXPOICategoryVisitDuetDataProvider sharedInstance];
  [v3 unsubscribeToPOIChanges];
}

@end