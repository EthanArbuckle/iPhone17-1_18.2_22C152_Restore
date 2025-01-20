@interface HDProfile(HealthMedicationsDaemonPlugin)
- (BOOL)_profileExpectsExtension;
- (id)healthMedicationsProfileExtension;
@end

@implementation HDProfile(HealthMedicationsDaemonPlugin)

- (id)healthMedicationsProfileExtension
{
  v4 = [a1 profileExtensionWithIdentifier:@"com.apple.health.MedicationsDaemonPlugin"];
  if ([a1 _profileExpectsExtension] && !v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [a1 profileIdentifier];
    [v6 handleFailureInMethod:a2, a1, @"HDHealthMedicationsProfileExtension.m", 114, @"Health Medications Profile Extension is nil in profile %@", v7 object file lineNumber description];
  }
  return v4;
}

- (BOOL)_profileExpectsExtension
{
  uint64_t v1 = [a1 profileType];
  BOOL v2 = v1 == 1 || v1 == 100;
  return (unint64_t)(v1 - 2) >= 3 && v2;
}

@end