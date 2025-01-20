@interface ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker
+ (id)keyTrackerForRotationSessionStackEngagementStatus:(unint64_t)a3;
- (ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker)initWithStatusAggregationKey:(id)a3 proactiveStatusAggregationKey:(id)a4 proactiveStatusBooleanKey:(id)a5 userScrollStatusBooleanKey:(id)a6 userScrollFinalOutcomeKey:(id)a7;
- (NSString)proactiveStatusAggregationKey;
- (NSString)proactiveStatusBooleanKey;
- (NSString)statusAggregationKey;
- (NSString)userScrollFinalOutcomeKey;
- (NSString)userScrollStatusBooleanKey;
@end

@implementation ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker

- (ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker)initWithStatusAggregationKey:(id)a3 proactiveStatusAggregationKey:(id)a4 proactiveStatusBooleanKey:(id)a5 userScrollStatusBooleanKey:(id)a6 userScrollFinalOutcomeKey:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker;
  v17 = [(ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_statusAggregationKey, a3);
    objc_storeStrong((id *)&v18->_proactiveStatusAggregationKey, a4);
    objc_storeStrong((id *)&v18->_proactiveStatusBooleanKey, a5);
    objc_storeStrong((id *)&v18->_userScrollStatusBooleanKey, a6);
    objc_storeStrong((id *)&v18->_userScrollFinalOutcomeKey, a7);
  }

  return v18;
}

+ (id)keyTrackerForRotationSessionStackEngagementStatus:(unint64_t)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      break;
    case 1uLL:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      if (keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken6 != -1) {
        dispatch_once(&keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken6, block);
      }
      v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult;
      goto LABEL_14;
    case 3uLL:
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke_2;
      v8[3] = &__block_descriptor_40_e5_v8__0l;
      v8[4] = a1;
      if (keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken7 != -1) {
        dispatch_once(&keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken7, v8);
      }
      v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_173;
      goto LABEL_14;
    case 4uLL:
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke_3;
      v7[3] = &__block_descriptor_40_e5_v8__0l;
      v7[4] = a1;
      if (keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken8 != -1) {
        dispatch_once(&keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken8, v7);
      }
      v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_174;
LABEL_14:
      id v3 = v4;
      break;
    default:
      v5 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        +[ATXHomeScreenLogEngagementKeyTracker keyTrackerForStackEngagementStatus:](v5);
      }

      id v3 = 0;
      break;
  }
  return v3;
}

void __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithStatusAggregationKey:@"NumberOfViewsForStackWidgetsOn" proactiveStatusAggregationKey:@"NumberOfProactiveViewsOn" proactiveStatusBooleanKey:@"NumberOfProactiveViewedRotationsOn" userScrollStatusBooleanKey:0 userScrollFinalOutcomeKey:0];
  v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult;
  keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult = v3;
}

void __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithStatusAggregationKey:@"NumberOfPseudoTapsForStackWidgetsOn" proactiveStatusAggregationKey:@"NumberOfProactivePseudoTapsOn" proactiveStatusBooleanKey:@"NumberOfProactivePseudoTappedRotationsOn" userScrollStatusBooleanKey:@"NumberOfUserScrollPseudoTappedRotationsOn" userScrollFinalOutcomeKey:@"NumberOfUserScrollFinalOutcomePseudoTappedOn"];
  v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_173;
  keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_173 = v3;
}

void __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithStatusAggregationKey:@"NumberOfTapsForStackWidgetsOn" proactiveStatusAggregationKey:@"NumberOfProactiveTapsByLocationOn" proactiveStatusBooleanKey:@"NumberOfProactiveTappedRotationsOn" userScrollStatusBooleanKey:@"NumberOfUserScrollPseudoTappedRotationsOn" userScrollFinalOutcomeKey:0];
  v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_174;
  keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_174 = v3;
}

- (NSString)statusAggregationKey
{
  return self->_statusAggregationKey;
}

- (NSString)proactiveStatusAggregationKey
{
  return self->_proactiveStatusAggregationKey;
}

- (NSString)proactiveStatusBooleanKey
{
  return self->_proactiveStatusBooleanKey;
}

- (NSString)userScrollStatusBooleanKey
{
  return self->_userScrollStatusBooleanKey;
}

- (NSString)userScrollFinalOutcomeKey
{
  return self->_userScrollFinalOutcomeKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userScrollFinalOutcomeKey, 0);
  objc_storeStrong((id *)&self->_userScrollStatusBooleanKey, 0);
  objc_storeStrong((id *)&self->_proactiveStatusBooleanKey, 0);
  objc_storeStrong((id *)&self->_proactiveStatusAggregationKey, 0);
  objc_storeStrong((id *)&self->_statusAggregationKey, 0);
}

@end