@interface CRKFeatureDataStoreDefaults
@end

@implementation CRKFeatureDataStoreDefaults

void __59__CRKFeatureDataStoreDefaults_MCX_restrictionDefaultValues__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v0 pathForResource:@"defaultSettings_macOS" ofType:@"plist"];

  uint64_t v1 = [NSDictionary dictionaryWithContentsOfFile:v3];
  v2 = (void *)restrictionDefaultValues_classroomRestrictionDefaultValues;
  restrictionDefaultValues_classroomRestrictionDefaultValues = v1;
}

@end