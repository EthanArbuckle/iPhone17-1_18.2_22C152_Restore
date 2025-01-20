@interface MCMContainerDataMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation MCMContainerDataMigrator

- (float)migrationProgress
{
  return -1.0;
}

- (float)estimatedDuration
{
  return 2.0;
}

- (BOOL)performMigration
{
  char v2 = container_perform_data_migration();
  if ((v2 & 1) == 0)
  {
    v3 = container_log_handle_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v6 = 1;
      _os_log_fault_impl(&dword_0, v3, OS_LOG_TYPE_FAULT, "Migration failed with error %llu. Please include a sysdiagnose in a bug report for MobileContainerManager | all.", buf, 0xCu);
    }
  }
  return v2;
}

- (id)dataClassName
{
  return @"MCMContainerDataMigrator";
}

@end