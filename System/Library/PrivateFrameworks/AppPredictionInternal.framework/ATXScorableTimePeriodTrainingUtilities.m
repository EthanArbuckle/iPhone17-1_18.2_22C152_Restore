@interface ATXScorableTimePeriodTrainingUtilities
+ (id)allTrainableATXModes;
@end

@implementation ATXScorableTimePeriodTrainingUtilities

+ (id)allTrainableATXModes
{
  v2 = allModes();
  v3 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_203);

  return v3;
}

id __62__ATXScorableTimePeriodTrainingUtilities_allTrainableATXModes__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F4B2A8];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 unsignedIntegerValue];

  v6 = (void *)[v4 initWithATXMode:v5];
  return v6;
}

@end