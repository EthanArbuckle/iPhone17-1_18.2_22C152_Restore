@interface HKOntologyStore(HealthMedications)
- (void)markCoreMedsShardAsRequiredWithCompletion:()HealthMedications;
- (void)markInteractionsShardAsRequiredWithCompletion:()HealthMedications;
- (void)markMedicationShardsAsRequiredOnFirstLaunchWithCompletion:()HealthMedications;
- (void)markMedsEducationAsRequiredWithCompletion:()HealthMedications;
- (void)markMedsScanningShardAsRequiredWithCompletion:()HealthMedications;
@end

@implementation HKOntologyStore(HealthMedications)

- (void)markMedicationShardsAsRequiredOnFirstLaunchWithCompletion:()HealthMedications
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F2A2C8];
  v8[0] = *MEMORY[0x1E4F2A2A0];
  v8[1] = v4;
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  v7 = [v5 arrayWithObjects:v8 count:2];
  [a1 markShardsWithIdentifiers:v7 options:3 completion:v6];
}

- (void)markCoreMedsShardAsRequiredWithCompletion:()HealthMedications
{
}

- (void)markMedsScanningShardAsRequiredWithCompletion:()HealthMedications
{
}

- (void)markInteractionsShardAsRequiredWithCompletion:()HealthMedications
{
}

- (void)markMedsEducationAsRequiredWithCompletion:()HealthMedications
{
}

@end