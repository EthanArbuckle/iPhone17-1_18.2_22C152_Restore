@interface HKQuery
+ (BOOL)shouldApplyAdditionalPredicateForObjectType:(id)a3;
+ (Class)configurationClass;
+ (NSPredicate)predicateForActivitySummariesBetweenStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents;
+ (NSPredicate)predicateForActivitySummaryWithDateComponents:(NSDateComponents *)dateComponents;
+ (NSPredicate)predicateForCategorySamplesEqualToValues:(NSSet *)values;
+ (NSPredicate)predicateForCategorySamplesWithOperatorType:(NSPredicateOperatorType)operatorType value:(NSInteger)value;
+ (NSPredicate)predicateForClinicalRecordsFromSource:(HKSource *)source FHIRResourceType:(HKFHIRResourceType)resourceType identifier:(NSString *)identifier;
+ (NSPredicate)predicateForClinicalRecordsWithFHIRResourceType:(HKFHIRResourceType)resourceType;
+ (NSPredicate)predicateForElectrocardiogramsWithClassification:(HKElectrocardiogramClassification)classification;
+ (NSPredicate)predicateForElectrocardiogramsWithSymptomsStatus:(HKElectrocardiogramSymptomsStatus)symptomsStatus;
+ (NSPredicate)predicateForObjectWithUUID:(NSUUID *)UUID;
+ (NSPredicate)predicateForObjectsFromDevices:(NSSet *)devices;
+ (NSPredicate)predicateForObjectsFromSource:(HKSource *)source;
+ (NSPredicate)predicateForObjectsFromSourceRevisions:(NSSet *)sourceRevisions;
+ (NSPredicate)predicateForObjectsFromSources:(NSSet *)sources;
+ (NSPredicate)predicateForObjectsFromWorkout:(HKWorkout *)workout;
+ (NSPredicate)predicateForObjectsWithDeviceProperty:(NSString *)key allowedValues:(NSSet *)allowedValues;
+ (NSPredicate)predicateForObjectsWithMetadataKey:(NSString *)key;
+ (NSPredicate)predicateForObjectsWithMetadataKey:(NSString *)key allowedValues:(NSArray *)allowedValues;
+ (NSPredicate)predicateForObjectsWithMetadataKey:(NSString *)key operatorType:(NSPredicateOperatorType)operatorType value:(id)value;
+ (NSPredicate)predicateForObjectsWithNoCorrelation;
+ (NSPredicate)predicateForObjectsWithUUIDs:(NSSet *)UUIDs;
+ (NSPredicate)predicateForQuantitySamplesWithOperatorType:(NSPredicateOperatorType)operatorType quantity:(HKQuantity *)quantity;
+ (NSPredicate)predicateForSamplesWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate options:(HKQueryOptions)options;
+ (NSPredicate)predicateForVerifiableClinicalRecordsWithRelevantDateWithinDateInterval:(NSDateInterval *)dateInterval;
+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType duration:(NSTimeInterval)duration;
+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType averageQuantity:(HKQuantity *)averageQuantity;
+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType maximumQuantity:(HKQuantity *)maximumQuantity;
+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType minimumQuantity:(HKQuantity *)minimumQuantity;
+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType sumQuantity:(HKQuantity *)sumQuantity;
+ (NSPredicate)predicateForWorkoutActivitiesWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate options:(HKQueryOptions)options;
+ (NSPredicate)predicateForWorkoutActivitiesWithWorkoutActivityType:(HKWorkoutActivityType)workoutActivityType;
+ (NSPredicate)predicateForWorkoutsWithActivityPredicate:(NSPredicate *)activityPredicate;
+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType duration:(NSTimeInterval)duration;
+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType averageQuantity:(HKQuantity *)averageQuantity;
+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType maximumQuantity:(HKQuantity *)maximumQuantity;
+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType minimumQuantity:(HKQuantity *)minimumQuantity;
+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType sumQuantity:(HKQuantity *)sumQuantity;
+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalDistance:(HKQuantity *)totalDistance;
+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalEnergyBurned:(HKQuantity *)totalEnergyBurned;
+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalFlightsClimbed:(HKQuantity *)totalFlightsClimbed;
+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalSwimmingStrokeCount:(HKQuantity *)totalSwimmingStrokeCount;
+ (NSPredicate)predicateForWorkoutsWithWorkoutActivityType:(HKWorkoutActivityType)workoutActivityType;
+ (NSString)taskIdentifier;
+ (id)_cachedInterfaceForProtocol:(id)a3 configurationHandler:(id)a4;
+ (id)_predicateForObjectsFromAppleWatches;
+ (id)_predicateForObjectsWithMinOSBuildVersion:(id)a3 maxOSBuildVersion:(id)a4;
+ (id)_predicateForWorkoutStatisticsWithOperatorType:(unint64_t)a3 quantityType:(id)a4 keyPathPrefix:(id)a5 quantity:(id)a6;
+ (id)clientInterface;
+ (id)clientInterfaceProtocol;
+ (id)predicateForActivityCachesBetweenStartDateComponents:(id)a3 endDateComponents:(id)a4;
+ (id)predicateForActivitySummariesWithActivityMoveMode:(int64_t)a3;
+ (id)predicateForCreationDateWithTodayViewRange:(id)a3;
+ (id)predicateForDiagnosticTestResultCategory:(id)a3;
+ (id)predicateForDiagnosticTestResultWithReferenceRangeStatus:(int64_t)a3;
+ (id)predicateForElectrocardiogramsWithPrivateClassification:(unint64_t)a3;
+ (id)predicateForFitnessFriendAchievementsForFriendUUID:(id)a3;
+ (id)predicateForFitnessFriendActivitySnapshotsForFriendUUID:(id)a3;
+ (id)predicateForFitnessFriendWorkoutsForFriendUUID:(id)a3;
+ (id)predicateForListUserDomainConceptWithListType:(unint64_t)a3;
+ (id)predicateForListUserDomainConceptsWithListTypes:(id)a3;
+ (id)predicateForMedicalRecordWithOriginType:(unint64_t)a3;
+ (id)predicateForMedicalRecordWithState:(unint64_t)a3;
+ (id)predicateForMedicalRecordsAssociatedWithMedicalUserDomainConcept:(id)a3;
+ (id)predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:(id)a3;
+ (id)predicateForMedicalUserDomainConceptWithCategoryType:(int64_t)a3;
+ (id)predicateForMedicalUserDomainConceptsByResolvingConceptResolutionDefinition:(id)a3;
+ (id)predicateForMedicalUserDomainConceptsMappingToSampleWithUUID:(id)a3;
+ (id)predicateForMedicalUserDomainConceptsMappingToSampleWithUUIDs:(id)a3;
+ (id)predicateForMedicalUserDomainConceptsWithCategoryTypes:(id)a3;
+ (id)predicateForMedicationDoseEventWithHashedMedicationIdentifier:(id)a3;
+ (id)predicateForMedicationDoseEventWithHashedMedicationIdentifiers:(id)a3;
+ (id)predicateForMedicationDoseEventWithMedicationIdentifier:(id)a3;
+ (id)predicateForMedicationDoseEventWithMedicationIdentifiers:(id)a3;
+ (id)predicateForMedicationDoseEventWithScheduleItemIdentifier:(id)a3;
+ (id)predicateForMedicationDoseEventWithScheduleItemIdentifiers:(id)a3;
+ (id)predicateForMedicationDoseEventWithStatus:(int64_t)a3;
+ (id)predicateForMedicationDoseEventWithStatuses:(id)a3;
+ (id)predicateForObjectsFromContributorWithUUID:(id)a3;
+ (id)predicateForRecordsFromClinicalAccountIdentifier:(id)a3;
+ (id)predicateForRecordsFromGatewayWithExternalIdentifier:(id)a3;
+ (id)predicateForRecordsWithSortDateFromStartDateComponents:(id)a3 endDateComponents:(id)a4;
+ (id)predicateForSamplesAssociatedWithSample:(id)a3;
+ (id)predicateForSamplesForDayFromDate:(id)a3 calendar:(id)a4 options:(unint64_t)a5;
+ (id)predicateForSamplesWithConceptIdentifier:(id)a3 keyPath:(id)a4;
+ (id)predicateForSamplesWithConceptIdentifiers:(id)a3 keyPath:(id)a4;
+ (id)predicateForSamplesWithStartDate:(id)a3 endDate:(id)a4 inclusiveEndDates:(BOOL)a5 options:(unint64_t)a6;
+ (id)predicateForSamplesWithinDateInterval:(id)a3 options:(unint64_t)a4;
+ (id)predicateForStatesOfMindWithAssociation:(int64_t)a3;
+ (id)predicateForStatesOfMindWithAssociations:(id)a3;
+ (id)predicateForStatesOfMindWithKind:(int64_t)a3;
+ (id)predicateForStatesOfMindWithLabel:(int64_t)a3;
+ (id)predicateForStatesOfMindWithLabels:(id)a3;
+ (id)predicateForStatesOfMindWithValence:(double)a3 operatorType:(unint64_t)a4;
+ (id)predicateForUserDomainConceptWithUUID:(id)a3;
+ (id)predicateForUserDomainConceptsWithSemanticIdentifier:(id)a3;
+ (id)predicateForUserDomainConceptsWithTypeIdentifier:(id)a3;
+ (id)predicateForUserDomainConceptsWithTypeIdentifiers:(id)a3;
+ (id)predicateForUserDomainConceptsWithUUIDs:(id)a3;
+ (id)predicateForWorkoutEffortSamplesRelatedToWorkout:(id)a3 activity:(id)a4;
+ (id)serverInterface;
+ (id)serverInterfaceProtocol;
- (BOOL)_queue_deactivateWithError:(id)a3;
- (BOOL)deactivate;
- (BOOL)deactivating;
- (BOOL)hasQueryUUID:(id)a3;
- (BOOL)queue_shouldDeactivateAfterInitialResults;
- (BOOL)shouldSuppressDataCollection;
- (HKObjectType)objectType;
- (HKQuery)initWithQueryDescriptors:(id)a3;
- (HKQueryDelegate)delegate;
- (HKSampleType)sampleType;
- (NSArray)queryDescriptors;
- (NSPredicate)predicate;
- (NSString)debugIdentifier;
- (NSString)description;
- (NSUUID)activationUUID;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)queue;
- (_HKFilter)_filter;
- (id)_filterForPredicate:(id)a3 objectType:(id)a4;
- (id)_initWithObjectType:(id)a3 predicate:(id)a4;
- (id)exportedInterface;
- (id)remoteInterface;
- (int64_t)activationState;
- (int64_t)deactivateCallCount;
- (int64_t)qualityOfService;
- (unint64_t)applicationSDKVersionToken;
- (void)_queue_activateWithHealthStore:(id)a3 activationUUID:(id)a4 isReactivating:(BOOL)a5 completion:(id)a6;
- (void)_queue_finishActivationWithServerProxy:(id)a3 activationUUID:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_throwInvalidArgumentExceptionIfHasBeenExecuted:(SEL)a3;
- (void)activateWithClientQueue:(id)a3 healthStore:(id)a4 delegate:(id)a5 time:(double)a6 completion:(id)a7;
- (void)client_deliverError:(id)a3 forQuery:(id)a4;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)objectType;
- (void)predicate;
- (void)queue_deactivate;
- (void)queue_deliverError:(id)a3;
- (void)queue_dispatchToClientForUUID:(id)a3 shouldDeactivate:(BOOL)a4 block:(id)a5;
- (void)queue_populateConfiguration:(id)a3;
- (void)queue_queryDidDeactivate:(id)a3;
- (void)queue_queryDidFinishActivation:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)reactivateWithHealthStore:(id)a3;
- (void)sampleType;
- (void)setActivationUUID:(id)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setObjectType:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setShouldSuppressDataCollection:(BOOL)a3;
@end

@implementation HKQuery

+ (NSPredicate)predicateForObjectsWithMetadataKey:(NSString *)key
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"metadata.%K != nil", key);
}

+ (NSPredicate)predicateForObjectsWithMetadataKey:(NSString *)key allowedValues:(NSArray *)allowedValues
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"metadata.%K IN %@", key, allowedValues];
}

+ (NSPredicate)predicateForObjectsWithMetadataKey:(NSString *)key operatorType:(NSPredicateOperatorType)operatorType value:(id)value
{
  v7 = (void *)MEMORY[0x1E4F28C68];
  v8 = NSString;
  id v9 = value;
  v10 = [v8 stringWithFormat:@"%@.%@", @"metadata", key];
  v11 = [v7 expressionForKeyPath:v10];

  v12 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v9];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v11 rightExpression:v12 modifier:0 type:operatorType options:0];

  return (NSPredicate *)v13;
}

+ (NSPredicate)predicateForSamplesWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate options:(HKQueryOptions)options
{
  return (NSPredicate *)[a1 predicateForSamplesWithStartDate:startDate endDate:endDate inclusiveEndDates:0 options:options];
}

+ (NSPredicate)predicateForClinicalRecordsWithFHIRResourceType:(HKFHIRResourceType)resourceType
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"FHIRResource.resourceType", resourceType];
}

+ (NSPredicate)predicateForClinicalRecordsFromSource:(HKSource *)source FHIRResourceType:(HKFHIRResourceType)resourceType identifier:(NSString *)identifier
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v8 = identifier;
  id v9 = resourceType;
  v10 = [a1 predicateForObjectsFromSource:source];
  v11 = [a1 predicateForClinicalRecordsWithFHIRResourceType:v9];

  v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"FHIRResource.identifier", v8];

  v13 = (void *)MEMORY[0x1E4F28BA0];
  v17[0] = v10;
  v17[1] = v11;
  v17[2] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  v15 = [v13 andPredicateWithSubpredicates:v14];

  return (NSPredicate *)v15;
}

+ (id)predicateForSamplesWithStartDate:(id)a3 endDate:(id)a4 inclusiveEndDates:(BOOL)a5 options:(unint64_t)a6
{
  char v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  v11 = [MEMORY[0x1E4F1CA48] array];
  char v12 = HKProgramSDKAtLeast();
  if (v9)
  {
    if (v6) {
      v13 = @"startDate >= %@";
    }
    else {
      v13 = @"endDate >= %@";
    }
    if (v6) {
      char v12 = 0;
    }
    v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v13, v9);
    [v11 addObject:v14];
  }
  if (v10)
  {
    if ((v6 & 2) != 0)
    {
      BOOL v17 = !v7;
      if (v7) {
        v18 = @"endDate <= %@";
      }
      else {
        v18 = @"endDate < %@";
      }
      v19 = @"startDate < %@";
      if (!v17) {
        v19 = @"startDate <= %@";
      }
      v20 = (void *)MEMORY[0x1E4F28F60];
      v21 = v19;
      v22 = objc_msgSend(v20, "predicateWithFormat:", v18, v10);
      [v11 addObject:v22];

      v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v21, v10);
    }
    else
    {
      if (v7) {
        v15 = @"startDate <= %@";
      }
      else {
        v15 = @"startDate < %@";
      }
      v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v15, v10);
    }
    [v11 addObject:v16];

    char v23 = v12 ^ 1;
    if (!v9) {
      char v23 = 1;
    }
    if ((v23 & 1) == 0)
    {
      v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"offsetFromStartDate >= %@", v9];
      [v11 addObject:v24];
    }
  }
  v25 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v11];

  return v25;
}

+ (NSPredicate)predicateForObjectsFromSource:(HKSource *)source
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"source", source];
}

+ (NSPredicate)predicateForObjectsFromSources:(NSSet *)sources
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"source", sources];
}

+ (NSPredicate)predicateForObjectsFromSourceRevisions:(NSSet *)sourceRevisions
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"sourceRevision", sourceRevisions];
}

+ (NSPredicate)predicateForObjectsFromDevices:(NSSet *)devices
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"device", devices];
}

+ (NSPredicate)predicateForObjectsWithDeviceProperty:(NSString *)key allowedValues:(NSSet *)allowedValues
{
  v5 = key;
  char v6 = allowedValues;
  if (!+[_HKObjectComparisonFilter isSupportedDevicePropertyKey:](_HKObjectComparisonFilter, "isSupportedDevicePropertyKey:", v5))[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Unrecognized device property."]; {
  BOOL v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K IN %@", @"device", v5, v6];
  }

  return (NSPredicate *)v7;
}

+ (id)_predicateForObjectsFromAppleWatches
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == true", @"appleWatch");
}

+ (id)_predicateForObjectsWithMinOSBuildVersion:(id)a3 maxOSBuildVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F1CA48] array];
  if (v5)
  {
    v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"OSBuild", v5];
    [v7 addObject:v8];
  }
  if (v6)
  {
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"OSBuild", v6];
    [v7 addObject:v9];
  }
  id v10 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];

  return v10;
}

+ (NSPredicate)predicateForObjectWithUUID:(NSUUID *)UUID
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"UUID", UUID];
}

+ (NSPredicate)predicateForObjectsWithUUIDs:(NSSet *)UUIDs
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"UUID", UUIDs];
}

+ (NSPredicate)predicateForObjectsWithNoCorrelation
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"correlation", 0];
}

+ (NSPredicate)predicateForObjectsFromWorkout:(HKWorkout *)workout
{
  return (NSPredicate *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"workout", workout];
}

+ (id)predicateForWorkoutEffortSamplesRelatedToWorkout:(id)a3 activity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F1CA48] array];
  if (v6)
  {
    v8 = [v5 workoutActivities];
    char v9 = [v8 containsObject:v6];

    if ((v9 & 1) == 0)
    {
      id v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
      char v12 = [v6 workoutConfiguration];
      v13 = _HKWorkoutActivityNameForActivityType([v12 activityType]);
      [v10 raise:v11, @"%@ must be sub activity of Workout", v13 format];
    }
    v14 = [v6 startDate];
    v15 = [v6 endDate];
    v16 = +[HKQuery predicateForSamplesWithStartDate:v14 endDate:v15 options:1];

    [v7 addObject:v16];
  }
  BOOL v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"ratingOfExertionAssociation", v5];
  [v7 addObject:v17];
  v18 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];

  return v18;
}

+ (id)predicateForSamplesAssociatedWithSample:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"association", a3];
}

+ (id)predicateForSamplesWithinDateInterval:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 startDate];
  BOOL v7 = [v5 endDate];

  v8 = +[HKQuery predicateForSamplesWithStartDate:v6 endDate:v7 options:a4];

  return v8;
}

+ (id)predicateForSamplesForDayFromDate:(id)a3 calendar:(id)a4 options:(unint64_t)a5
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalForDayFromDate:calendar:", a3, a4);
  BOOL v7 = +[HKQuery predicateForSamplesWithinDateInterval:v6 options:a5];

  return v7;
}

+ (id)predicateForRecordsFromClinicalAccountIdentifier:(id)a3
{
  v4 = +[HKSource _privateSourceForClinicalAccountIdentifier:a3 name:0];
  id v5 = [a1 predicateForObjectsFromSource:v4];

  return v5;
}

+ (id)predicateForRecordsFromGatewayWithExternalIdentifier:(id)a3
{
  v4 = +[HKSource _publicSourceForClinicalExternalIdentifier:a3 name:0];
  id v5 = [a1 predicateForObjectsFromSource:v4];

  return v5;
}

+ (id)predicateForSamplesWithConceptIdentifier:(id)a3 keyPath:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", a4, a3];
}

+ (id)predicateForSamplesWithConceptIdentifiers:(id)a3 keyPath:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", a4, a3];
}

+ (NSPredicate)predicateForQuantitySamplesWithOperatorType:(NSPredicateOperatorType)operatorType quantity:(HKQuantity *)quantity
{
  id v5 = (void *)MEMORY[0x1E4F28C68];
  id v6 = quantity;
  BOOL v7 = [v5 expressionForKeyPath:@"quantity"];
  v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v6];

  char v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v7 rightExpression:v8 modifier:0 type:operatorType options:0];

  return (NSPredicate *)v9;
}

+ (NSPredicate)predicateForCategorySamplesWithOperatorType:(NSPredicateOperatorType)operatorType value:(NSInteger)value
{
  id v6 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"value"];
  BOOL v7 = (void *)MEMORY[0x1E4F28C68];
  v8 = [NSNumber numberWithInteger:value];
  char v9 = [v7 expressionForConstantValue:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v6 rightExpression:v9 modifier:0 type:operatorType options:0];

  return (NSPredicate *)v10;
}

+ (NSPredicate)predicateForCategorySamplesEqualToValues:(NSSet *)values
{
  v3 = [(NSSet *)values hk_map:&__block_literal_global_20];
  v4 = (void *)MEMORY[0x1E4F28BA0];
  id v5 = [v3 allObjects];
  id v6 = [v4 orPredicateWithSubpredicates:v5];

  return (NSPredicate *)v6;
}

NSPredicate *__66__HKQuery_HKPredicates__predicateForCategorySamplesEqualToValues___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];

  return +[HKQuery predicateForCategorySamplesWithOperatorType:4 value:v2];
}

+ (NSPredicate)predicateForWorkoutsWithWorkoutActivityType:(HKWorkoutActivityType)workoutActivityType
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"workoutType", workoutActivityType);
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType duration:(NSTimeInterval)duration
{
  id v6 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"duration"];
  BOOL v7 = (void *)MEMORY[0x1E4F28C68];
  v8 = [NSNumber numberWithDouble:duration];
  char v9 = [v7 expressionForConstantValue:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v6 rightExpression:v9 modifier:0 type:operatorType options:0];

  return (NSPredicate *)v10;
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalEnergyBurned:(HKQuantity *)totalEnergyBurned
{
  id v5 = (void *)MEMORY[0x1E4F28C68];
  id v6 = totalEnergyBurned;
  BOOL v7 = [v5 expressionForKeyPath:@"totalEnergyBurned"];
  v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v6];

  char v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v7 rightExpression:v8 modifier:0 type:operatorType options:0];

  return (NSPredicate *)v9;
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalDistance:(HKQuantity *)totalDistance
{
  id v5 = (void *)MEMORY[0x1E4F28C68];
  id v6 = totalDistance;
  BOOL v7 = [v5 expressionForKeyPath:@"totalDistance"];
  v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v6];

  char v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v7 rightExpression:v8 modifier:0 type:operatorType options:0];

  return (NSPredicate *)v9;
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalSwimmingStrokeCount:(HKQuantity *)totalSwimmingStrokeCount
{
  id v5 = (void *)MEMORY[0x1E4F28C68];
  id v6 = totalSwimmingStrokeCount;
  BOOL v7 = [v5 expressionForKeyPath:@"totalSwimmingStrokeCount"];
  v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v6];

  char v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v7 rightExpression:v8 modifier:0 type:operatorType options:0];

  return (NSPredicate *)v9;
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType totalFlightsClimbed:(HKQuantity *)totalFlightsClimbed
{
  id v5 = (void *)MEMORY[0x1E4F28C68];
  id v6 = totalFlightsClimbed;
  BOOL v7 = [v5 expressionForKeyPath:@"totalFlightsClimbed"];
  v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v6];

  char v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v7 rightExpression:v8 modifier:0 type:operatorType options:0];

  return (NSPredicate *)v9;
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType sumQuantity:(HKQuantity *)sumQuantity
{
  return (NSPredicate *)[a1 _predicateForWorkoutStatisticsWithOperatorType:operatorType quantityType:quantityType keyPathPrefix:@"sumQuantity" quantity:sumQuantity];
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType minimumQuantity:(HKQuantity *)minimumQuantity
{
  return (NSPredicate *)[a1 _predicateForWorkoutStatisticsWithOperatorType:operatorType quantityType:quantityType keyPathPrefix:@"minimumQuantity" quantity:minimumQuantity];
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType maximumQuantity:(HKQuantity *)maximumQuantity
{
  return (NSPredicate *)[a1 _predicateForWorkoutStatisticsWithOperatorType:operatorType quantityType:quantityType keyPathPrefix:@"maximumQuantity" quantity:maximumQuantity];
}

+ (NSPredicate)predicateForWorkoutsWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType averageQuantity:(HKQuantity *)averageQuantity
{
  return (NSPredicate *)[a1 _predicateForWorkoutStatisticsWithOperatorType:operatorType quantityType:quantityType keyPathPrefix:@"averageQuantity" quantity:averageQuantity];
}

+ (id)_predicateForWorkoutStatisticsWithOperatorType:(unint64_t)a3 quantityType:(id)a4 keyPathPrefix:(id)a5 quantity:(id)a6
{
  char v9 = (void *)MEMORY[0x1E4F28C68];
  id v10 = NSString;
  uint64_t v11 = NSNumber;
  id v12 = a6;
  id v13 = a5;
  v14 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(a4, "code"));
  v15 = [v10 stringWithFormat:@"%@.%@", v13, v14];

  v16 = [v9 expressionForKeyPath:v15];

  BOOL v17 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v12];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v16 rightExpression:v17 modifier:0 type:a3 options:0];

  return v18;
}

+ (NSPredicate)predicateForWorkoutActivitiesWithWorkoutActivityType:(HKWorkoutActivityType)workoutActivityType
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"activityType", workoutActivityType);
}

+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType duration:(NSTimeInterval)duration
{
  id v6 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"activityDuration"];
  BOOL v7 = (void *)MEMORY[0x1E4F28C68];
  v8 = [NSNumber numberWithDouble:duration];
  char v9 = [v7 expressionForConstantValue:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v6 rightExpression:v9 modifier:0 type:operatorType options:0];

  return (NSPredicate *)v10;
}

+ (NSPredicate)predicateForWorkoutActivitiesWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate options:(HKQueryOptions)options
{
  char v5 = options;
  BOOL v7 = startDate;
  v8 = endDate;
  char v9 = [MEMORY[0x1E4F1CA48] array];
  if (v7)
  {
    if (v5) {
      id v10 = &HKPredicateKeyPathWorkoutActivityStartDate;
    }
    else {
      id v10 = &HKPredicateKeyPathWorkoutActivityEndDate;
    }
    uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", *v10, v7];
    [v9 addObject:v11];
  }
  if (v8)
  {
    if ((v5 & 2) != 0) {
      id v12 = &HKPredicateKeyPathWorkoutActivityEndDate;
    }
    else {
      id v12 = &HKPredicateKeyPathWorkoutActivityStartDate;
    }
    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", *v12, v8];
    [v9 addObject:v13];
  }
  v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v9];

  return (NSPredicate *)v14;
}

+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType sumQuantity:(HKQuantity *)sumQuantity
{
  return (NSPredicate *)[a1 _predicateForWorkoutStatisticsWithOperatorType:operatorType quantityType:quantityType keyPathPrefix:@"activitySumQuantity" quantity:sumQuantity];
}

+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType minimumQuantity:(HKQuantity *)minimumQuantity
{
  return (NSPredicate *)[a1 _predicateForWorkoutStatisticsWithOperatorType:operatorType quantityType:quantityType keyPathPrefix:@"activityMinimumQuantity" quantity:minimumQuantity];
}

+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType maximumQuantity:(HKQuantity *)maximumQuantity
{
  return (NSPredicate *)[a1 _predicateForWorkoutStatisticsWithOperatorType:operatorType quantityType:quantityType keyPathPrefix:@"activityMaximumQuantity" quantity:maximumQuantity];
}

+ (NSPredicate)predicateForWorkoutActivitiesWithOperatorType:(NSPredicateOperatorType)operatorType quantityType:(HKQuantityType *)quantityType averageQuantity:(HKQuantity *)averageQuantity
{
  return (NSPredicate *)[a1 _predicateForWorkoutStatisticsWithOperatorType:operatorType quantityType:quantityType keyPathPrefix:@"activityAverageQuantity" quantity:averageQuantity];
}

+ (NSPredicate)predicateForWorkoutsWithActivityPredicate:(NSPredicate *)activityPredicate
{
  v3 = (void *)MEMORY[0x1E4F28C68];
  v4 = activityPredicate;
  char v5 = [v3 expressionForKeyPath:@"workoutActivity"];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v4];

  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v5 rightExpression:v6 modifier:0 type:99 options:0];

  return (NSPredicate *)v7;
}

+ (NSPredicate)predicateForActivitySummaryWithDateComponents:(NSDateComponents *)dateComponents
{
  v3 = dateComponents;
  id v8 = 0;
  BOOL v4 = +[HKActivitySummary _validateActivitySummaryDateComponents:v3 errorMessage:&v8];
  id v5 = v8;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@", v5 format];
  }
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"dateComponents", v3];

  return (NSPredicate *)v6;
}

+ (NSPredicate)predicateForActivitySummariesBetweenStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = startDateComponents;
  id v15 = 0;
  id v6 = endDateComponents;
  BOOL v7 = +[HKActivitySummary _validateActivitySummaryDateComponentsRange:v5 endDateComponents:v6 errorMessage:&v15];
  id v8 = v15;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@", v8 format];
  }
  char v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"dateComponents", v5];
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"dateComponents", v6];

  uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
  v16[0] = v9;
  v16[1] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v13 = [v11 andPredicateWithSubpredicates:v12];

  return (NSPredicate *)v13;
}

+ (id)predicateForActivitySummariesWithActivityMoveMode:(int64_t)a3
{
  if (!_HKActivityMoveModeIsValid(a3)) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid activity move mode %ld", a3);
  }
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %ld", @"activityMoveMode", a3);
}

+ (NSPredicate)predicateForElectrocardiogramsWithClassification:(HKElectrocardiogramClassification)classification
{
  if (!_HKECGCPublicClassificationIsValid(classification)) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid ECG classification provided %ld", classification);
  }
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %ld", @"ecg_public_classification", classification);
}

+ (id)predicateForElectrocardiogramsWithPrivateClassification:(unint64_t)a3
{
  if (!_HKECGCPrivateClassificationIsValid(a3)) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid private ECG classification provided %ld", a3);
  }
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %ld", @"ecg_private_classification", a3);
}

+ (NSPredicate)predicateForElectrocardiogramsWithSymptomsStatus:(HKElectrocardiogramSymptomsStatus)symptomsStatus
{
  if (!_HKECGSymptomsStatusIsValid(symptomsStatus)) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid ECG symptoms status provided %ld", symptomsStatus);
  }
  return (NSPredicate *)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %ld", @"ecg_symptoms_status", symptomsStatus);
}

+ (id)predicateForObjectsFromContributorWithUUID:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"contributor", a3];
}

+ (id)predicateForUserDomainConceptsWithSemanticIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"semanticIdentifier", a3];
}

+ (id)predicateForUserDomainConceptsWithTypeIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"udcTypeIdentifier", a3];
}

+ (id)predicateForUserDomainConceptsWithTypeIdentifiers:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"udcTypeIdentifier", a3];
}

+ (id)predicateForUserDomainConceptWithUUID:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"udcUUID", a3];
}

+ (id)predicateForUserDomainConceptsWithUUIDs:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"udcUUID", a3];
}

+ (id)predicateForListUserDomainConceptWithListType:(unint64_t)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  BOOL v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [v3 predicateWithFormat:@"%K == %@", @"listType", v4];

  return v5;
}

+ (id)predicateForListUserDomainConceptsWithListTypes:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"listType", a3];
}

+ (id)predicateForMedicalUserDomainConceptWithCategoryType:(int64_t)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  BOOL v4 = [NSNumber numberWithInteger:a3];
  id v5 = [v3 predicateWithFormat:@"%K == %@", @"categoryTypes", v4];

  return v5;
}

+ (id)predicateForMedicalUserDomainConceptsWithCategoryTypes:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"categoryTypes", a3];
}

+ (id)predicateForMedicalUserDomainConceptsMappingToSampleWithUUID:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"medicalRecordUUID", a3];
}

+ (id)predicateForMedicalUserDomainConceptsMappingToSampleWithUUIDs:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"medicalRecordUUID", a3];
}

+ (id)predicateForMedicalUserDomainConceptsByResolvingConceptResolutionDefinition:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"unresolvedConceptResolutionDefinition", a3];
}

+ (id)predicateForDiagnosticTestResultCategory:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"category", a3];
}

+ (id)predicateForDiagnosticTestResultWithReferenceRangeStatus:(int64_t)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  BOOL v4 = [NSNumber numberWithInteger:a3];
  id v5 = [v3 predicateWithFormat:@"%K == %@", @"referenceRangeStatus", v4];

  return v5;
}

+ (id)predicateForRecordsWithSortDateFromStartDateComponents:(id)a3 endDateComponents:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  BOOL v4 = +[HKMedicalRecord _sortDateIntervalFromStartDateComponents:a3 endDateComponents:a4 error:&v16];
  id v5 = v16;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@", v5 format];
  }
  id v6 = (void *)MEMORY[0x1E4F28F60];
  BOOL v7 = [v4 startDate];
  id v8 = [v6 predicateWithFormat:@"%K  >= %@", @"sortDate", v7];

  char v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [v4 endDate];
  uint64_t v11 = [v9 predicateWithFormat:@"%K  < %@", @"sortDate", v10];

  id v12 = (void *)MEMORY[0x1E4F28BA0];
  v17[0] = v8;
  v17[1] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v14 = [v12 andPredicateWithSubpredicates:v13];

  return v14;
}

+ (id)predicateForCreationDateWithTodayViewRange:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  id v5 = [v4 startDate];
  id v6 = [v4 endDate];

  BOOL v7 = [v3 predicateWithFormat:@"(%K >= %@) AND (%K < %@)", @"creationDate", v5, @"creationDate", v6];

  return v7;
}

+ (id)predicateForMedicalRecordWithOriginType:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"medicalRecordOriginType", a3);
}

+ (id)predicateForMedicalRecordWithState:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"state", a3);
}

+ (id)predicateForMedicalRecordsAssociatedWithMedicalUserDomainConcept:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K CONTAINS %@", @"userDomainConcept", a3];
}

+ (id)predicateForMedicalRecordsWithSignedClinicalDataOriginIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"signedClinicalDataOriginIdentifier", a3];
}

+ (NSPredicate)predicateForVerifiableClinicalRecordsWithRelevantDateWithinDateInterval:(NSDateInterval *)dateInterval
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = dateInterval;
  id v5 = [(NSDateInterval *)v4 startDate];
  id v6 = [(NSDateInterval *)v4 endDate];

  BOOL v7 = [v3 predicateWithFormat:@"(%K >= %@) AND (%K <= %@)", @"relevantDate", v5, @"relevantDate", v6];

  return (NSPredicate *)v7;
}

+ (id)predicateForMedicationDoseEventWithStatus:(int64_t)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [v3 predicateWithFormat:@"%K == %@", @"status", v4];

  return v5;
}

+ (id)predicateForMedicationDoseEventWithStatuses:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"status", a3];
}

+ (id)predicateForMedicationDoseEventWithMedicationIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"medicationIdentifier", a3];
}

+ (id)predicateForMedicationDoseEventWithMedicationIdentifiers:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"medicationIdentifier", a3];
}

+ (id)predicateForMedicationDoseEventWithHashedMedicationIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"hashedMedicationIdentifier", a3];
}

+ (id)predicateForMedicationDoseEventWithHashedMedicationIdentifiers:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"hashedMedicationIdentifier", a3];
}

+ (id)predicateForMedicationDoseEventWithScheduleItemIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"scheduleItemIdentifier", a3];
}

+ (id)predicateForMedicationDoseEventWithScheduleItemIdentifiers:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"scheduleItemIdentifier", a3];
}

+ (id)predicateForStatesOfMindWithValence:(double)a3 operatorType:(unint64_t)a4
{
  id v6 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"valence"];
  BOOL v7 = (void *)MEMORY[0x1E4F28C68];
  id v8 = [NSNumber numberWithDouble:a3];
  char v9 = [v7 expressionForConstantValue:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v6 rightExpression:v9 modifier:0 type:a4 options:0];

  return v10;
}

+ (id)predicateForStatesOfMindWithKind:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"reflectiveInterval", HKStateOfMindReflectiveIntervalFromKind(a3, a2));
}

+ (id)predicateForStatesOfMindWithLabel:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"labels", a3);
}

+ (id)predicateForStatesOfMindWithAssociation:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"domains", HKStateOfMindDomainFromAssociation(a3, a2));
}

+ (id)predicateForStatesOfMindWithLabels:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"labels", a3];
}

+ (id)predicateForStatesOfMindWithAssociations:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = NSNumber;
        uint64_t v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) integerValue];
        id v13 = objc_msgSend(v10, "numberWithInteger:", HKStateOfMindDomainFromAssociation(v11, v12));
        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"domains", v4, (void)v16];

  return v14;
}

+ (id)predicateForFitnessFriendActivitySnapshotsForFriendUUID:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = objc_msgSend(a3, "hk_dataForUUIDBytes");
  id v5 = [v3 predicateWithFormat:@"%K == %@", @"friend_uuid", v4];

  return v5;
}

- (id)_initWithObjectType:(id)a3 predicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKQuery;
  char v9 = [(HKQuery *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = HKCreateSerialDispatchQueue(v9, @"activation");
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    atomic_store(0, (unsigned int *)&v10->_activationState);
    v10->_qualityOfService = -1;
    objc_storeStrong((id *)&v10->_objectType, a3);
    objc_storeStrong((id *)&v10->_predicate, a4);
    uint64_t v13 = [(HKQuery *)v10 _filterForPredicate:v10->_predicate objectType:v10->_objectType];
    filter = v10->_filter;
    v10->_filter = (_HKFilter *)v13;
  }
  return v10;
}

- (HKQuery)initWithQueryDescriptors:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  uint64_t v6 = [v5 sampleType];
  id v7 = [v4 firstObject];
  id v8 = [v7 predicate];
  char v9 = [(HKQuery *)self _initWithObjectType:v6 predicate:v8];

  if (v9)
  {
    uint64_t v10 = [v4 copy];
    queryDescriptors = v9->_queryDescriptors;
    v9->_queryDescriptors = (NSArray *)v10;
  }
  return v9;
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EECE9728;
}

+ (id)serverInterfaceProtocol
{
  return &unk_1EED526D0;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void)queue_queryDidFinishActivation:(id)a3 success:(BOOL)a4 error:(id)a5
{
}

- (void)queue_queryDidDeactivate:(id)a3
{
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 1;
}

+ (BOOL)shouldApplyAdditionalPredicateForObjectType:(id)a3
{
  return 1;
}

- (void)queue_populateConfiguration:(id)a3
{
  filter = self->_filter;
  id v5 = a3;
  [v5 setFilter:filter];
  [v5 setObjectType:self->_objectType];
  [v5 setDebugIdentifier:self->_debugIdentifier];
  [v5 setQualityOfService:self->_qualityOfService];
  objc_msgSend(v5, "setShouldDeactivateAfterInitialResults:", -[HKQuery queue_shouldDeactivateAfterInitialResults](self, "queue_shouldDeactivateAfterInitialResults"));
  [v5 setShouldSuppressDataCollection:self->_shouldSuppressDataCollection];
  [v5 setActivationTime:self->_activationTime];
}

- (void)_throwInvalidArgumentExceptionIfHasBeenExecuted:(SEL)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v5 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HKQuery__throwInvalidArgumentExceptionIfHasBeenExecuted___block_invoke;
  block[3] = &unk_1E58BBAA0;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v11 + 24))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = objc_opt_class();
    id v8 = NSStringFromSelector(a3);
    [v6 raise:*MEMORY[0x1E4F1C3C8], @"%@: %@ not callable after first execution", v7, v8 format];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __59__HKQuery__throwInvalidArgumentExceptionIfHasBeenExecuted___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)queue_dispatchToClientForUUID:(id)a3 shouldDeactivate:(BOOL)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_clientQueue)
  {
    uint64_t v10 = [(HKQuery *)self activationUUID];
    int v11 = [v10 isEqual:v8];

    if (v11)
    {
      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__HKQuery_queue_dispatchToClientForUUID_shouldDeactivate_block___block_invoke;
      block[3] = &unk_1E58C1F18;
      block[4] = self;
      BOOL v15 = a4;
      id v14 = v9;
      dispatch_async(clientQueue, block);
    }
  }
}

uint64_t __64__HKQuery_queue_dispatchToClientForUUID_shouldDeactivate_block___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) deactivating];
  if ((result & 1) == 0)
  {
    if (!*(unsigned char *)(a1 + 48) || (uint64_t result = [*(id *)(a1 + 32) deactivate], result))
    {
      id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
      return v3();
    }
  }
  return result;
}

- (BOOL)hasQueryUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(HKQuery *)self activationUUID];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (void)activateWithClientQueue:(id)a3 healthStore:(id)a4 delegate:(id)a5 time:(double)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  long long v17 = [MEMORY[0x1E4F29128] UUID];
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HKQuery.m", 180, @"Invalid parameter not satisfying: %@", @"clientQueue" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_12:
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2, self, @"HKQuery.m", 182, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

      if (v16) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"HKQuery.m", 181, @"Invalid parameter not satisfying: %@", @"healthStore" object file lineNumber description];

  if (!v15) {
    goto LABEL_12;
  }
LABEL_4:
  if (v16) {
    goto LABEL_5;
  }
LABEL_13:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"HKQuery.m", 183, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_5:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke;
  aBlock[3] = &unk_1E58BBD38;
  id v50 = v16;
  long long v18 = _Block_copy(aBlock);
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__18;
  v43 = __Block_byref_object_dispose__18;
  id v44 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke_86;
  block[3] = &unk_1E58C1F40;
  block[4] = self;
  v36 = &v45;
  id v20 = v15;
  id v31 = v20;
  id v21 = v13;
  id v32 = v21;
  id v22 = v17;
  id v33 = v22;
  id v23 = v14;
  double v38 = a6;
  id v34 = v23;
  v37 = &v39;
  id v24 = v18;
  id v35 = v24;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v46 + 24)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ has already been executed and cannot be executed again.", self format];
  }
  v25 = (void *)v40[5];
  if (v25) {
    [v25 raise];
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
}

void __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke_2;
  v8[3] = &unk_1E58BBA28;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  HKDispatchAsyncOnGlobalConcurrentQueue(0x15u, v8);
}

uint64_t __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

unsigned char *__72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke_86(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[8] || (uint64_t result = (unsigned char *)[result activationState]) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v3 = a1 + 32;
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), *(id *)(a1 + 48));
    [*(id *)(a1 + 32) setActivationUUID:*(void *)(a1 + 56)];
    *(void *)(*(void *)v3 + 136) = [*(id *)(a1 + 64) applicationSDKVersionToken];
    *(void *)(*(void *)v3 + 40) = *(void *)(a1 + 96);
    unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 104) count];
    _HKInitializeLogging();
    id v5 = HKLogQuery;
    BOOL v6 = os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT);
    if (v4 < 2)
    {
      if (v6)
      {
        id v9 = *(void **)(a1 + 32);
        id v10 = v5;
        uint64_t v11 = [v9 objectType];
        uint64_t v12 = (void *)v11;
        if (v11) {
          id v13 = (__CFString *)v11;
        }
        else {
          id v13 = @"()";
        }
        id v14 = [*(id *)(a1 + 32) predicate];
        int v15 = 138543874;
        id v16 = v9;
        __int16 v17 = 2114;
        long long v18 = v13;
        __int16 v19 = 2112;
        id v20 = v14;
        _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "Executing query %{public}@ for type %{public}@ with predicate %@", (uint8_t *)&v15, 0x20u);
      }
    }
    else if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = (__CFString *)v7[13];
      int v15 = 138543618;
      id v16 = v7;
      __int16 v17 = 2112;
      long long v18 = v8;
      _os_log_impl(&dword_19C023000, v5, OS_LOG_TYPE_DEFAULT, "Executing multi-type query %{public}@ with descriptors %@", (uint8_t *)&v15, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "queue_validate");
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    return (unsigned char *)objc_msgSend(*(id *)(a1 + 32), "_queue_activateWithHealthStore:activationUUID:isReactivating:completion:", *(void *)(a1 + 64), *(void *)(a1 + 56), 0, *(void *)(a1 + 72));
  }
  return result;
}

- (void)reactivateWithHealthStore:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__HKQuery_reactivateWithHealthStore___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __37__HKQuery_reactivateWithHealthStore___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) activationUUID];
  if (v2)
  {
    if ([*(id *)(a1 + 32) activationState] == 3)
    {
      _HKInitializeLogging();
      uint64_t v3 = HKLogQuery;
      if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v14 = v4;
        id v5 = "%{public}@: Query deactivated before reactivation was requested; ignoring reactivation request.";
LABEL_10:
        _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
      }
    }
    else
    {
      if ([*(id *)(a1 + 32) activationState] != 1)
      {
        [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = *(void **)(v8 + 24);
        *(void *)(v8 + 24) = 0;

        id v10 = *(void **)(a1 + 32);
        uint64_t v11 = *(void *)(a1 + 40);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __37__HKQuery_reactivateWithHealthStore___block_invoke_93;
        v12[3] = &unk_1E58BBE28;
        v12[4] = v10;
        objc_msgSend(v10, "_queue_activateWithHealthStore:activationUUID:isReactivating:completion:", v11, v2, 1, v12);
        goto LABEL_12;
      }
      _HKInitializeLogging();
      uint64_t v3 = HKLogQuery;
      if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v14 = v7;
        id v5 = "%{public}@: Query is activation in progress; ignoring reactivation request.";
        goto LABEL_10;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v3 = HKLogQuery;
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v6;
      id v5 = "%{public}@: Query reactivated with nil UUID; ignoring reactivation request.";
      goto LABEL_10;
    }
  }
LABEL_12:
}

void __37__HKQuery_reactivateWithHealthStore___block_invoke_93(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if ((a2 & 1) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(NSObject **)(v7 + 120);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__HKQuery_reactivateWithHealthStore___block_invoke_2;
    v9[3] = &unk_1E58BBBD0;
    v9[4] = v7;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

uint64_t __37__HKQuery_reactivateWithHealthStore___block_invoke_2(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
    __37__HKQuery_reactivateWithHealthStore___block_invoke_2_cold_1();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_deactivateWithError:", *(void *)(a1 + 40));
}

- (int64_t)activationState
{
  return (int)atomic_load((unsigned int *)&self->_activationState);
}

- (BOOL)deactivating
{
  return [(HKQuery *)self activationState] == 3;
}

- (BOOL)deactivate
{
  atomic_fetch_add(&self->_deactivateCallCount, 1u);
  if ([(HKQuery *)self deactivating]) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __21__HKQuery_deactivate__block_invoke;
  v6[3] = &unk_1E58BBAA0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __21__HKQuery_deactivate__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_deactivateWithError:", 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)queue_deactivate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);

  [(HKQuery *)self _queue_deactivateWithError:0];
}

- (void)_queue_activateWithHealthStore:(id)a3 activationUUID:(id)a4 isReactivating:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  atomic_store(1u, (unsigned int *)&self->_activationState);
  objc_storeStrong((id *)&self->_strongHealthStore, a3);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke;
  aBlock[3] = &unk_1E58C1F90;
  void aBlock[4] = self;
  id v14 = v12;
  id v31 = v14;
  id v15 = v13;
  id v32 = v15;
  id v16 = _Block_copy(aBlock);
  p_proxyProvider = &self->_proxyProvider;
  if (!self->_proxyProvider)
  {
    id v18 = objc_alloc_init((Class)[(id)objc_opt_class() configurationClass]);
    [(HKQuery *)self queue_populateConfiguration:v18];
    __int16 v19 = [[HKQueryServerProxyProvider alloc] initWithHealthStore:v11 query:self configuration:v18 queryUUID:v14];
    proxyProvider = self->_proxyProvider;
    self->_proxyProvider = v19;

    [(HKQueryServerProxyProvider *)self->_proxyProvider setShouldForceReactivation:v7];
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEBUG)) {
    -[HKQuery _queue_activateWithHealthStore:activationUUID:isReactivating:completion:]();
  }
  objc_initWeak(&location, *p_proxyProvider);
  uint64_t v21 = *p_proxyProvider;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_96;
  v26[3] = &unk_1E58C1FE0;
  id v27 = v16;
  objc_copyWeak(&v28, &location);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_3;
  v23[3] = &unk_1E58C2008;
  id v22 = v27;
  id v24 = v22;
  objc_copyWeak(&v25, &location);
  [(HKProxyProvider *)v21 fetchProxyWithHandler:v26 errorHandler:v23];
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(NSObject **)(v10 + 120);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2;
  v15[3] = &unk_1E58C1F68;
  v15[4] = v10;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v11, v15);
}

uint64_t __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEBUG)) {
    __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2_cold_1();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_finishActivationWithServerProxy:activationUUID:error:completion:", *(void *)(a1 + 48), *(void *)(a1 + 64), *(void *)(a1 + 56), *(void *)(a1 + 72));
}

void __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2_97;
  v5[3] = &unk_1E58C1FB8;
  id v7 = *(id *)(a1 + 32);
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v4 = v3;
  id v6 = v4;
  objc_msgSend(v4, "remote_startQueryWithCompletion:", v5);

  objc_destroyWeak(&v8);
}

void __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2_97(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (id *)(a1 + 48);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  (*(void (**)(uint64_t))(v3 + 16))(v3);
}

void __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(uint64_t, id, void, id))(v2 + 16))(v2, WeakRetained, 0, v4);
}

- (void)_queue_finishActivationWithServerProxy:(id)a3 activationUUID:(id)a4 error:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, uint64_t, void))a6;
  int64_t v15 = [(HKQuery *)self activationState];
  if (v15 == 1)
  {
    if (v11)
    {
      objc_storeStrong((id *)&self->_serverProxy, a3);
      atomic_store(2u, (unsigned int *)&self->_activationState);
      v14[2](v14, 1, 0);
    }
    else
    {
      [(HKQuery *)self _queue_deactivateWithError:v13];
      ((void (**)(id, uint64_t, id))v14)[2](v14, 0, v13);
    }
    [(HKQuery *)self queue_queryDidFinishActivation:v12 success:v11 != 0 error:v13];
  }
  else if (v15 != 3)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
      -[HKQuery _queue_finishActivationWithServerProxy:activationUUID:error:completion:]();
    }
    id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Invalid query activation state upon completing connection");
    [(HKQuery *)self _queue_deactivateWithError:v16];
    ((void (**)(id, uint64_t, void *))v14)[2](v14, 0, v16);
  }
}

- (BOOL)_queue_deactivateWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v5 = atomic_exchange(&self->_activationState, 3u);
  if (v5 != 3)
  {
    _HKInitializeLogging();
    id v6 = HKLogQuery;
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = " with error: ";
      if (!v4) {
        id v7 = "";
      }
      int v15 = 138543874;
      id v16 = self;
      id v8 = &stru_1EEC60288;
      if (v4) {
        id v8 = v4;
      }
      __int16 v17 = 2080;
      id v18 = v7;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "Stopping query %{public}@%s%{public}@", (uint8_t *)&v15, 0x20u);
    }
    if (v4) {
      [(HKQuery *)self queue_deliverError:v4];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)&self->_delegate, 0);
    [WeakRetained queryDidFinishExecuting:self];
    clientQueue = self->_clientQueue;
    self->_clientQueue = 0;

    id v11 = [(HKQuery *)self activationUUID];
    [(HKQuery *)self setActivationUUID:0];
    [(HKQueryServerInterface *)self->_serverProxy remote_deactivateServer];
    serverProxy = self->_serverProxy;
    self->_serverProxy = 0;

    [(HKQuery *)self queue_queryDidDeactivate:v11];
    proxyProvider = self->_proxyProvider;
    self->_proxyProvider = 0;
  }
  return v5 != 3;
}

- (int64_t)deactivateCallCount
{
  return (int)atomic_load((unsigned int *)&self->_deactivateCallCount);
}

- (void)client_deliverError:(id)a3 forQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKQuery *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HKQuery_client_deliverError_forQuery___block_invoke;
  block[3] = &unk_1E58BB9C8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __40__HKQuery_client_deliverError_forQuery___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  _HKInitializeLogging();
  uint64_t v3 = HKLogQuery;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v9 = 138543874;
      uint64_t v10 = v4;
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Received error for query %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR))
  {
    __40__HKQuery_client_deliverError_forQuery___block_invoke_cold_1();
  }
  id v7 = [*(id *)(a1 + 40) activationUUID];
  int v8 = [v7 isEqual:*(void *)(a1 + 48)];

  if (v8) {
    objc_msgSend(*(id *)(a1 + 40), "_queue_deactivateWithError:", *(void *)(a1 + 32));
  }
}

+ (NSString)taskIdentifier
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HKSampleType)sampleType
{
  if ([(NSArray *)self->_queryDescriptors count] < 2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = self->_objectType;
      goto LABEL_7;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
      -[HKQuery sampleType]();
    }
  }
  uint64_t v3 = 0;
LABEL_7:

  return (HKSampleType *)v3;
}

- (HKObjectType)objectType
{
  if ([(NSArray *)self->_queryDescriptors count] < 2)
  {
    uint64_t v3 = self->_objectType;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
      -[HKQuery objectType]();
    }
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSPredicate)predicate
{
  if ([(NSArray *)self->_queryDescriptors count] < 2)
  {
    uint64_t v3 = self->_predicate;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
      -[HKQuery predicate]();
    }
    uint64_t v3 = 0;
  }

  return v3;
}

- (HKQueryDelegate)delegate
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__18;
  __int16 v11 = __Block_byref_object_dispose__18;
  id v12 = 0;
  uint64_t v3 = [(HKQuery *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __19__HKQuery_delegate__block_invoke;
  v6[3] = &unk_1E58BBAA0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HKQueryDelegate *)v4;
}

uint64_t __19__HKQuery_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));

  return MEMORY[0x1F41817F8]();
}

- (void)setPredicate:(id)a3
{
  uint64_t v5 = (NSPredicate *)a3;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  predicate = self->_predicate;
  self->_predicate = v5;
  uint64_t v9 = v5;

  uint64_t v7 = [(HKQuery *)self _filterForPredicate:self->_predicate objectType:self->_objectType];
  filter = self->_filter;
  self->_filter = v7;
}

- (void)setObjectType:(id)a3
{
  uint64_t v5 = (HKObjectType *)a3;
  [(HKQuery *)self _throwInvalidArgumentExceptionIfHasBeenExecuted:a2];
  objectType = self->_objectType;
  self->_objectType = v5;
  uint64_t v9 = v5;

  uint64_t v7 = [(HKQuery *)self _filterForPredicate:self->_predicate objectType:self->_objectType];
  filter = self->_filter;
  self->_filter = v7;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (NSString)description
{
  if ([(HKQuery *)self activationState])
  {
    unint64_t v3 = [(HKQuery *)self activationState] - 1;
    if (v3 > 2) {
      id v4 = @"inactive";
    }
    else {
      id v4 = *(&off_1E58C2048 + v3);
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [(HKQuery *)self activationUUID];
  uint64_t v6 = HKCopyQueryDescription(self, v5, 0, self->_debugIdentifier, self->_qualityOfService, v4);

  return (NSString *)v6;
}

+ (id)clientInterface
{
  unint64_t v3 = [a1 clientInterfaceProtocol];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__HKQuery_clientInterface__block_invoke;
  v6[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v6[4] = a1;
  id v4 = [a1 _cachedInterfaceForProtocol:v3 configurationHandler:v6];

  return v4;
}

uint64_t __26__HKQuery_clientInterface__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) configureClientInterface:a2];
}

+ (id)serverInterface
{
  unint64_t v3 = [a1 serverInterfaceProtocol];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__HKQuery_serverInterface__block_invoke;
  v6[3] = &__block_descriptor_40_e24_v16__0__NSXPCInterface_8l;
  v6[4] = a1;
  id v4 = [a1 _cachedInterfaceForProtocol:v3 configurationHandler:v6];

  return v4;
}

uint64_t __26__HKQuery_serverInterface__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) configureServerInterface:a2];
}

+ (id)_cachedInterfaceForProtocol:(id)a3 configurationHandler:(id)a4
{
  uint64_t v5 = (Protocol *)a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  uint64_t v7 = NSStringFromProtocol(v5);
  os_unfair_lock_lock((os_unfair_lock_t)&_cachedInterfaceForProtocol_configurationHandler__lock);
  int v8 = (void *)_cachedInterfaceForProtocol_configurationHandler__interfacesCache;
  if (!_cachedInterfaceForProtocol_configurationHandler__interfacesCache)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v10 = (void *)_cachedInterfaceForProtocol_configurationHandler__interfacesCache;
    _cachedInterfaceForProtocol_configurationHandler__interfacesCache = (uint64_t)v9;

    int v8 = (void *)_cachedInterfaceForProtocol_configurationHandler__interfacesCache;
  }
  id v11 = [v8 objectForKeyedSubscript:v7];
  os_unfair_lock_unlock((os_unfair_lock_t)&_cachedInterfaceForProtocol_configurationHandler__lock);
  if (!v11)
  {
    id v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v5];
    v6[2](v6, v12);
    os_unfair_lock_lock((os_unfair_lock_t)&_cachedInterfaceForProtocol_configurationHandler__lock);
    uint64_t v13 = [(id)_cachedInterfaceForProtocol_configurationHandler__interfacesCache objectForKeyedSubscript:v7];
    uint64_t v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = (void *)v13;
    }
    else {
      uint64_t v15 = v12;
    }
    id v11 = v15;

    [(id)_cachedInterfaceForProtocol_configurationHandler__interfacesCache setObject:v11 forKeyedSubscript:v7];
    os_unfair_lock_unlock((os_unfair_lock_t)&_cachedInterfaceForProtocol_configurationHandler__lock);
  }

  return v11;
}

- (id)_filterForPredicate:(id)a3 objectType:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v8;
  if ([(id)objc_opt_class() shouldApplyAdditionalPredicateForObjectType:v7])
  {
    uint64_t v10 = [v7 _predicateForSDKVersionToken:HKApplicationSDKVersionToken()];
    id v11 = v10;
    id v9 = v8;
    if (v10)
    {
      if (v8)
      {
        id v12 = (void *)MEMORY[0x1E4F28BA0];
        v17[0] = self->_predicate;
        v17[1] = v10;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
        id v9 = [v12 andPredicateWithSubpredicates:v13];
      }
      else
      {
        id v9 = v10;
      }
    }
  }
  if (v7) {
    [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  }
  else {
  uint64_t v14 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v15 = objc_msgSend(v9, "hk_filterRepresentationForDataTypes:", v14);

  return v15;
}

- (id)exportedInterface
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 clientInterface];
}

- (id)remoteInterface
{
  uint64_t v2 = objc_opt_class();

  return (id)[v2 serverInterface];
}

- (void)connectionInvalidated
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_19C023000, v0, OS_LOG_TYPE_DEBUG, "%{public}@: Connection invalidated", v1, 0xCu);
}

- (void)connectionInterrupted
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_19C023000, v0, OS_LOG_TYPE_DEBUG, "%{public}@: Connection interrupted", v1, 0xCu);
}

- (NSUUID)activationUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setActivationUUID:(id)a3
{
}

- (_HKFilter)_filter
{
  return self->_filter;
}

- (NSArray)queryDescriptors
{
  return self->_queryDescriptors;
}

- (BOOL)shouldSuppressDataCollection
{
  return self->_shouldSuppressDataCollection;
}

- (void)setShouldSuppressDataCollection:(BOOL)a3
{
  self->_shouldSuppressDataCollection = a3;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (unint64_t)applicationSDKVersionToken
{
  return self->_applicationSDKVersionToken;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_activationUUID, 0);
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_strongHealthStore, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_objectType, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)predicateForActivityCachesBetweenStartDateComponents:(id)a3 endDateComponents:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v15 = 0;
  id v6 = a4;
  BOOL v7 = +[HKActivitySummary _validateActivitySummaryDateComponentsRange:v5 endDateComponents:v6 errorMessage:&v15];
  id v8 = v15;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@", v8 format];
  }
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", @"dateComponents", v5];
  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"dateComponents", v6];

  id v11 = (void *)MEMORY[0x1E4F28BA0];
  v16[0] = v9;
  v16[1] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  uint64_t v13 = [v11 andPredicateWithSubpredicates:v12];

  return v13;
}

+ (id)predicateForFitnessFriendAchievementsForFriendUUID:(id)a3
{
  unint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = objc_msgSend(a3, "hk_dataForUUIDBytes");
  id v5 = [v3 predicateWithFormat:@"%K == %@", @"friend_uuid", v4];

  return v5;
}

+ (id)predicateForFitnessFriendWorkoutsForFriendUUID:(id)a3
{
  unint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = objc_msgSend(a3, "hk_dataForUUIDBytes");
  id v5 = [v3 predicateWithFormat:@"%K == %@", @"friend_uuid", v4];

  return v5;
}

- (void)queue_deliverError:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

void __72__HKQuery_activateWithClientQueue_healthStore_delegate_time_completion___block_invoke_86_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_begin_catch(a1);
  uint64_t v5 = *(void *)(*(void *)(a3 + 88) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  objc_end_catch();
}

void __37__HKQuery_reactivateWithHealthStore___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_9();
  _os_log_error_impl(&dword_19C023000, v0, OS_LOG_TYPE_ERROR, "%{public}@: Error reactivating query: %{public}@", v1, 0x16u);
}

- (void)_queue_activateWithHealthStore:activationUUID:isReactivating:completion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_19C023000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: Initiating connection to query server via %@", v2, 0x16u);
}

void __83__HKQuery__queue_activateWithHealthStore_activationUUID_isReactivating_completion___block_invoke_2_cold_1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_9();
  __int16 v5 = 1024;
  int v6 = v0;
  __int16 v7 = v1;
  uint64_t v8 = v2;
  _os_log_debug_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: Connection to query server via %{public}@ complete with success=%{BOOL}d, error=%{public}@", v4, 0x26u);
}

- (void)_queue_finishActivationWithServerProxy:activationUUID:error:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "%{public}@: Invalid query activation state upon completing connection", v2, v3, v4, v5, v6);
}

void __40__HKQuery_client_deliverError_forQuery___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_9();
  _os_log_error_impl(&dword_19C023000, v0, OS_LOG_TYPE_ERROR, "%{public}@: Received nil error for query %{public}@", v1, 0x16u);
}

- (void)sampleType
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "%{public}@: Attempt to access 'sampleType' property on a multi-type query.", v2, v3, v4, v5, v6);
}

- (void)objectType
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "%{public}@: Attempt to access 'objectType' property on a multi-type query.", v2, v3, v4, v5, v6);
}

- (void)predicate
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_19C023000, v0, v1, "%{public}@: Attempt to access 'predicate' property on a multi-type query.", v2, v3, v4, v5, v6);
}

@end