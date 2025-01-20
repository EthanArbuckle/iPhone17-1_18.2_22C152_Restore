@interface VibrationDataMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (id)dataClassName;
@end

@implementation VibrationDataMigrator

- (id)dataClassName
{
  return @"vibration";
}

- (BOOL)performMigration
{
  id v2 = objc_alloc_init((Class)TLVibrationManager);
  unsigned __int8 v3 = [v2 _migrateLegacySettings];

  return v3;
}

- (float)estimatedDuration
{
  return 1.0;
}

@end