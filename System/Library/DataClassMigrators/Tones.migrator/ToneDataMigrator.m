@interface ToneDataMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (id)dataClassName;
@end

@implementation ToneDataMigrator

- (id)dataClassName
{
  return @"tone";
}

- (BOOL)performMigration
{
  return +[TLToneManager _migrateLegacyToneSettings];
}

- (float)estimatedDuration
{
  return 1.0;
}
@end