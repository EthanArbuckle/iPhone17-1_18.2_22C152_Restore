@interface _DPPrivacyBudgetManager
- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4;
@end

@implementation _DPPrivacyBudgetManager

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  id v5 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64___DPPrivacyBudgetManager_scheduleMaintenanceWithName_database___block_invoke;
  v10[3] = &unk_1E6C43BE0;
  id v11 = v5;
  id v6 = v5;
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E019FA60](v10);
  v9 = +[_DPPeriodicTask taskWithName:v7 period:kSecondsIn12Hours handler:v8];

  +[_DPPeriodicTaskManager registerTask:v9];
}

@end