@interface LanguageAssetMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation LanguageAssetMigrator

- (float)estimatedDuration
{
  return 0.1;
}

- (float)migrationProgress
{
  return 1.0;
}

- (id)dataClassName
{
  return @"LanguageAssetMigrator";
}

- (BOOL)performMigration
{
  return 1;
}
@end