@interface HKObjectComparisonFilter
@end

@implementation HKObjectComparisonFilter

uint64_t __60___HKObjectComparisonFilter_areValidTypes_forKeyPath_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:@"ratingOfExertionAssociation"])
  {
    v6 = [v5 identifier];
    if ([v6 isEqual:@"HKQuantityTypeIdentifierEstimatedWorkoutEffortScore"])
    {
    }
    else
    {
      v7 = [v5 identifier];
      char v8 = [v7 isEqual:@"HKQuantityTypeIdentifierWorkoutEffortScore"];

      if ((v8 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"unexpected data type %@", v5);
        uint64_t v9 = 0;
        goto LABEL_6;
      }
    }
  }
  uint64_t v9 = 1;
LABEL_6:

  return v9;
}

uint64_t __55___HKObjectComparisonFilter__configureForKeyPathSource__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 _isLocalDevice])
  {
    v3 = [v2 bundleIdentifier];
    uint64_t v4 = [v3 isEqualToString:@"com.apple.private.health.localdevice"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __60___HKObjectComparisonFilter__acceptsDataObjectWithMetadata___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) value];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end