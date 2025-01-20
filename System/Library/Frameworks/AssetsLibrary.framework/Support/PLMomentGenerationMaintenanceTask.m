@interface PLMomentGenerationMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
@end

@implementation PLMomentGenerationMaintenanceTask

- (BOOL)runTaskWithTransaction:(id)a3
{
  id v4 = a3;
  v5 = [(PLMaintenanceTask *)self libraryServicesManager];
  v6 = [v5 momentGenerationDataManager];

  [v6 runPeriodicMaintenanceTasks:50 withTransaction:v4];
  return 1;
}

@end