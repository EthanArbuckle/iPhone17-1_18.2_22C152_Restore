@interface EDCategoryPowerLog
+ (void)logStartCategorizationWithReason:(int64_t)a3;
+ (void)logStopCategorizationWithReason:(int64_t)a3 count:(unint64_t)a4;
@end

@implementation EDCategoryPowerLog

+ (void)logStartCategorizationWithReason:(int64_t)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (categoryPowerLogIdentifier_onceToken != -1) {
    dispatch_once(&categoryPowerLogIdentifier_onceToken, &__block_literal_global_12);
  }
  v6[0] = @"eventType";
  v6[1] = @"reason";
  v7[0] = &unk_1F35BABB0;
  v4 = [NSNumber numberWithInteger:a3];
  v7[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  PPSSendTelemetry();
}

+ (void)logStopCategorizationWithReason:(int64_t)a3 count:(unint64_t)a4
{
  v10[3] = *MEMORY[0x1E4F143B8];
  if (categoryPowerLogIdentifier_onceToken != -1) {
    dispatch_once(&categoryPowerLogIdentifier_onceToken, &__block_literal_global_12);
  }
  v10[0] = &unk_1F35BABC8;
  v9[0] = @"eventType";
  v9[1] = @"reason";
  v6 = [NSNumber numberWithInteger:a3];
  v10[1] = v6;
  v9[2] = @"count";
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  v10[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  PPSSendTelemetry();
}

@end