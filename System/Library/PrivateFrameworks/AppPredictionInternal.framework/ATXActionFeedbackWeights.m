@interface ATXActionFeedbackWeights
+ (ATXActionFeedbackWeights)sharedInstance;
- (ATXActionFeedbackWeights)init;
- (ATXActionFeedbackWeights)initWithAssetClass:(Class)a3;
- (float)confirmWeightForFeedbackStage:(unint64_t)a3 consumerSubType:(unsigned __int8)a4;
- (float)rejectWeightForFeedbackStage:(unint64_t)a3 consumerSubType:(unsigned __int8)a4;
@end

@implementation ATXActionFeedbackWeights

- (float)confirmWeightForFeedbackStage:(unint64_t)a3 consumerSubType:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  if (a3 >= 8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"ATXActionFeedbackWeights.m", 31, @"Invalid parameter not satisfying: %@", @"feedbackStage < ATXActionFeedbackStageMax" object file lineNumber description];
  }
  if (v4 >= 0x30)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"ATXActionFeedbackWeights.m", 32, @"Invalid parameter not satisfying: %@", @"consumerSubType < ATXConsumerSubTypeMax" object file lineNumber description];
  }
  _H0 = *(_WORD *)&self->_confirmWeights[96 * a3 + 2 * v4];
  __asm { FCVT            S0, H0 }
  return result;
}

- (float)rejectWeightForFeedbackStage:(unint64_t)a3 consumerSubType:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  if (a3 >= 8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"ATXActionFeedbackWeights.m", 39, @"Invalid parameter not satisfying: %@", @"feedbackStage < ATXActionFeedbackStageMax" object file lineNumber description];
  }
  if (v4 >= 0x30)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"ATXActionFeedbackWeights.m", 40, @"Invalid parameter not satisfying: %@", @"consumerSubType < ATXConsumerSubTypeMax" object file lineNumber description];
  }
  _H0 = *(_WORD *)&self->_rejectWeights[96 * a3 + 2 * v4];
  __asm { FCVT            S0, H0 }
  return result;
}

- (ATXActionFeedbackWeights)initWithAssetClass:(Class)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ATXActionFeedbackWeights;
  unsigned int v4 = [(ATXActionFeedbackWeights *)&v14 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D25F6CC0]();
    v6 = (void *)MEMORY[0x1E4F4AF08];
    if (!a3) {
      a3 = (Class)objc_opt_class();
    }
    v7 = [v6 dictionaryWithLegacyPathForClass:a3];
    v8 = [v7 objectForKeyedSubscript:@"Confirms"];
    uint64_t v9 = [v7 objectForKeyedSubscript:@"Rejects"];
    v10 = (void *)v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      v12 = __atxlog_handle_default();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ATXActionFeedbackWeights initWithAssetClass:]((uint64_t)v7, v12);
      }
    }
    else
    {
      loadArray((uint64_t)v4->_confirmWeights, v8);
      loadArray((uint64_t)v4->_rejectWeights, v10);
    }
  }
  return v4;
}

- (ATXActionFeedbackWeights)init
{
  return [(ATXActionFeedbackWeights *)self initWithAssetClass:0];
}

+ (ATXActionFeedbackWeights)sharedInstance
{
  if (sharedInstance__pasOnceToken10 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken10, &__block_literal_global_244);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_53;
  return (ATXActionFeedbackWeights *)v2;
}

void __42__ATXActionFeedbackWeights_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_53;
  sharedInstance__pasExprOnceResult_53 = v1;
}

- (void)initWithAssetClass:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Malformed weights asset %@", (uint8_t *)&v2, 0xCu);
}

@end