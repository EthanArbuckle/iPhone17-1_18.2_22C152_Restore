@interface ATXHomeScreenLogEngagementKeyTracker
+ (id)keyTrackerForStackEngagementStatus:(unint64_t)a3;
- (ATXHomeScreenLogEngagementKeyTracker)initWithRotationAggregationKey:(id)a3 rotationBooleanKey:(id)a4 rotationFinalOutcomeKey:(id)a5;
- (NSString)rotationAggregationKey;
- (NSString)rotationBooleanKey;
- (NSString)rotationFinalOutcomeKey;
@end

@implementation ATXHomeScreenLogEngagementKeyTracker

- (ATXHomeScreenLogEngagementKeyTracker)initWithRotationAggregationKey:(id)a3 rotationBooleanKey:(id)a4 rotationFinalOutcomeKey:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXHomeScreenLogEngagementKeyTracker;
  v12 = [(ATXHomeScreenLogEngagementKeyTracker *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_rotationAggregationKey, a3);
    objc_storeStrong((id *)&v13->_rotationBooleanKey, a4);
    objc_storeStrong((id *)&v13->_rotationFinalOutcomeKey, a5);
  }

  return v13;
}

+ (id)keyTrackerForStackEngagementStatus:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken6 != -1) {
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken6, block);
      }
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult;
      goto LABEL_29;
    case 1uLL:
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_2;
      v13[3] = &__block_descriptor_40_e5_v8__0l;
      v13[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken7 != -1) {
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken7, v13);
      }
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_119;
      goto LABEL_29;
    case 2uLL:
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_3;
      v12[3] = &__block_descriptor_40_e5_v8__0l;
      v12[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken8 != -1) {
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken8, v12);
      }
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_120;
      goto LABEL_29;
    case 3uLL:
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_4;
      v11[3] = &__block_descriptor_40_e5_v8__0l;
      v11[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken9 != -1) {
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken9, v11);
      }
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_121;
      goto LABEL_29;
    case 4uLL:
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_5;
      v10[3] = &__block_descriptor_40_e5_v8__0l;
      v10[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken10 != -1) {
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken10, v10);
      }
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_122;
      goto LABEL_29;
    case 5uLL:
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_7;
      v8[3] = &__block_descriptor_40_e5_v8__0l;
      v8[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken12 != -1) {
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken12, v8);
      }
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_124;
      goto LABEL_29;
    case 6uLL:
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_8;
      v7[3] = &__block_descriptor_40_e5_v8__0l;
      v7[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken13 != -1) {
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken13, v7);
      }
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_125;
      goto LABEL_29;
    case 7uLL:
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_6;
      v9[3] = &__block_descriptor_40_e5_v8__0l;
      v9[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken11 != -1) {
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken11, v9);
      }
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_123;
LABEL_29:
      id v5 = v3;
      break;
    default:
      v4 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        +[ATXHomeScreenLogEngagementKeyTracker keyTrackerForStackEngagementStatus:](v4);
      }

      id v5 = 0;
      break;
  }
  return v5;
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithRotationAggregationKey:0 rotationBooleanKey:0 rotationFinalOutcomeKey:@"numFinalOutcomeNotSeen"];
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult;
  keyTrackerForStackEngagementStatus___pasExprOnceResult = v3;
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithRotationAggregationKey:@"views" rotationBooleanKey:@"viewedRotations" rotationFinalOutcomeKey:@"numFinalOutcomeSeen"];
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_119;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_119 = v3;
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithRotationAggregationKey:@"pseudoDismisses" rotationBooleanKey:0 rotationFinalOutcomeKey:@"numFinalOutcomePseudoDismiss"];
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_120;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_120 = v3;
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithRotationAggregationKey:@"pseudotaps" rotationBooleanKey:@"pseudoTappedRotations" rotationFinalOutcomeKey:@"numFinalOutcomePseudoTap"];
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_121;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_121 = v3;
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_5(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithRotationAggregationKey:@"taps" rotationBooleanKey:@"tappedRotations" rotationFinalOutcomeKey:@"numFinalOutcomeTap"];
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_122;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_122 = v3;
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_6(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithRotationAggregationKey:0 rotationBooleanKey:0 rotationFinalOutcomeKey:@"timesAddedToStack"];
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_123;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_123 = v3;
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_7(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithRotationAggregationKey:0 rotationBooleanKey:0 rotationFinalOutcomeKey:@"dismissOnces"];
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_124;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_124 = v3;
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_8(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) initWithRotationAggregationKey:0 rotationBooleanKey:0 rotationFinalOutcomeKey:@"neverShows"];
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_125;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_125 = v3;
}

- (NSString)rotationAggregationKey
{
  return self->_rotationAggregationKey;
}

- (NSString)rotationBooleanKey
{
  return self->_rotationBooleanKey;
}

- (NSString)rotationFinalOutcomeKey
{
  return self->_rotationFinalOutcomeKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationFinalOutcomeKey, 0);
  objc_storeStrong((id *)&self->_rotationBooleanKey, 0);
  objc_storeStrong((id *)&self->_rotationAggregationKey, 0);
}

+ (void)keyTrackerForStackEngagementStatus:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXHomeScreenLogUploader: Received unknown engagement type", v1, 2u);
}

@end