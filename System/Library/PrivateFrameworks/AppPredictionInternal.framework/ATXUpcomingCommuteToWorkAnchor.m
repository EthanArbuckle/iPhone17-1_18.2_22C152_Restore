@interface ATXUpcomingCommuteToWorkAnchor
+ (BOOL)isActive;
+ (BOOL)shouldPredicateOnStartDate;
+ (BOOL)shouldProcessContextStoreNotification;
+ (BOOL)usesContextStoreForRealTimeNotifications;
+ (Class)supportedDuetDataProviderClass;
+ (double)secondsOfInfluence;
+ (id)anchorOccurenceDateFromDuetEvent:(id)a3;
+ (id)candidateQueryStartDateFromDuetEvent:(id)a3;
+ (id)duetEventsPredicates;
+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4;
+ (id)invalidationPredicateForContextStoreRegistration;
+ (id)keyPathForContextStore;
+ (id)longDescription;
+ (id)predicateForContextStoreRegistration;
+ (id)sampleEvent;
+ (int64_t)anchorType;
@end

@implementation ATXUpcomingCommuteToWorkAnchor

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
  return 20;
}

+ (id)longDescription
{
  return @"The user is preparing to commute to work.";
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

+ (id)invalidationPredicateForContextStoreRegistration
{
  return 0;
}

+ (id)fetchAnchorOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___ATXUpcomingCommuteToWorkAnchor;
  v5 = objc_msgSendSuper2(&v10, sel_fetchAnchorOccurrencesBetweenStartDate_endDate_, a3, a4);
  v6 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_239);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__ATXUpcomingCommuteToWorkAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_2;
  v9[3] = &__block_descriptor_40_e44___ATXTripDuetEvent_16__0__ATXTripDuetEvent_8l;
  v9[4] = a1;
  v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v9);

  return v7;
}

BOOL __81__ATXUpcomingCommuteToWorkAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 origin] == 1 && objc_msgSend(v2, "destination") == 2;

  return v3;
}

id __81__ATXUpcomingCommuteToWorkAnchor_fetchAnchorOccurrencesBetweenStartDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [(id)objc_opt_class() secondsOfInfluence];
  BOOL v3 = objc_msgSend(v2, "convertToUpcomingCommuteEventWithWindowDuration:");

  return v3;
}

+ (id)anchorOccurenceDateFromDuetEvent:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  id v5 = [v3 alloc];
  [(id)objc_opt_class() secondsOfInfluence];
  double v7 = -v6;
  v8 = [v4 endDate];

  v9 = (void *)[v5 initWithTimeInterval:v8 sinceDate:v7];
  return v9;
}

+ (id)candidateQueryStartDateFromDuetEvent:(id)a3
{
  return (id)[a3 startDate];
}

+ (id)keyPathForContextStore
{
  return (id)[MEMORY[0x1E4F5B6B8] keyPathForPredictedLocationOfInterestTransitions];
}

+ (id)predicateForContextStoreRegistration
{
  id v2 = [(id)objc_opt_class() keyPathForContextStore];
  BOOL v3 = (void *)MEMORY[0x1E4F5B6E8];
  id v4 = [MEMORY[0x1E4F5B6B8] locationOfInterestTypeKey];
  id v5 = [MEMORY[0x1E4F5B6B8] transitionWithinTimeIntervalKey];
  double v6 = [MEMORY[0x1E4F5B6B8] transitionWithinTimeIntervalKey];
  double v7 = [v3 predicateForKeyPath:v2, @"SUBQUERY(SELF.%@.value, $prediction, $prediction.%K = %@ AND $prediction.%K <= %@ AND $prediction.%K > %@).@count > 0", v2, v4, &unk_1F27F2A00, v5, &unk_1F27F2A18, v6, &unk_1F27F2A30 withFormat];

  return v7;
}

+ (BOOL)shouldProcessContextStoreNotification
{
  return 1;
}

+ (BOOL)isActive
{
  BOOL v3 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedDuetDataProviderClass"), "supportedDuetEventClass")), "initWithCurrentContextStoreValues");
  id v4 = v3;
  BOOL v10 = v3
     && ([v3 startDate],
         id v5 = objc_claimAutoreleasedReturnValue(),
         [v5 timeIntervalSinceNow],
         double v7 = v6,
         [a1 secondsOfInfluence],
         double v9 = v8 + 60.0,
         v5,
         v7 <= v9)
     && [v4 origin] == 1
     && [v4 destination] == 2;

  return v10;
}

+ (id)sampleEvent
{
  id v2 = [ATXTripDuetEvent alloc];
  BOOL v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-20.0];
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-10.0];
  id v5 = [(ATXTripDuetEvent *)v2 initWithOrigin:1 destination:2 durationAtOrigin:v3 startDate:v4 endDate:0.0];

  return v5;
}

@end