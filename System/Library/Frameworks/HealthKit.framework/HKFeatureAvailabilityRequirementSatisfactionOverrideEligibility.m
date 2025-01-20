@interface HKFeatureAvailabilityRequirementSatisfactionOverrideEligibility
- (BOOL)isRequirementOverridable:(id)a3 featureIdentifier:(id)a4 dataSource:(id)a5;
@end

@implementation HKFeatureAvailabilityRequirementSatisfactionOverrideEligibility

- (BOOL)isRequirementOverridable:(id)a3 featureIdentifier:(id)a4 dataSource:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v8 isEqualToString:@"OxygenSaturationRecording"]) {
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"ActiveWatchIsNotUnderInternalDevelopmentImportExclusion"])
  {
    char v10 = 0;
    goto LABEL_9;
  }
  if (![v7 isEqualToString:@"FeatureIsNotRemotelyDisabled"])
  {
LABEL_8:
    char v10 = 1;
    goto LABEL_9;
  }
  v11 = [v9 importExclusionDeviceDataSource];
  v12 = [v9 behavior];
  v13 = [v11 isActiveWatchProdFusedWithBehavior:v12];

  if (v13)
  {
    if ([v13 BOOLValue])
    {
      v14 = [v9 importExclusionDeviceDataSource];
      v15 = [v9 behavior];
      v16 = [v14 isImportAllowedForActiveWatchWithBehavior:v15 featureIdentifier:v8];

      char v10 = [v16 BOOLValue];
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

LABEL_9:
  return v10;
}

@end