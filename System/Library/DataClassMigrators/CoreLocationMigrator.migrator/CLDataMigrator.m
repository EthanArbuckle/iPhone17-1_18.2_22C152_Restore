@interface CLDataMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation CLDataMigrator

- (id)dataClassName
{
  return @"CoreLocation";
}

- (BOOL)performMigration
{
  int v2 = CLInternalPerformMigration();
  v3 = "succeeded";
  if (!v2) {
    v3 = "failed";
  }
  fprintf(__stderrp, "CoreLocation migration: %s\n", v3);
  return 1;
}

- (float)estimatedDuration
{
  return 60.0;
}

- (float)migrationProgress
{
  return -1.0;
}

@end