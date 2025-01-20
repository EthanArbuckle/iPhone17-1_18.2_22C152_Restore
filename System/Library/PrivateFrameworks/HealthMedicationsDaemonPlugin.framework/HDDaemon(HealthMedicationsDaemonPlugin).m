@interface HDDaemon(HealthMedicationsDaemonPlugin)
- (id)healthMedicationsDaemonExtension;
@end

@implementation HDDaemon(HealthMedicationsDaemonPlugin)

- (id)healthMedicationsDaemonExtension
{
  v4 = [a1 daemonExtensionWithIdentifier:@"com.apple.health.MedicationsDaemonPlugin"];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HDHealthMedicationsDaemonExtension.m" lineNumber:95 description:@"Health Medications Daemon Extension should not be nil"];
  }
  return v4;
}

@end