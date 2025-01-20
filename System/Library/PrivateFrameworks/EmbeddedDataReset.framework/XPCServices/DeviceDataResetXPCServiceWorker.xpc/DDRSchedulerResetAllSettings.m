@interface DDRSchedulerResetAllSettings
- (DDRSchedulerResetAllSettings)init;
- (NSArray)resetTasks;
- (id)scheduledTasks;
- (void)configureTasks;
- (void)setResetTasks:(id)a3;
@end

@implementation DDRSchedulerResetAllSettings

- (DDRSchedulerResetAllSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)DDRSchedulerResetAllSettings;
  v2 = [(DDRScheduler *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DDRScheduler *)v2 setMode:3];
  }
  return v3;
}

- (void)configureTasks
{
  v3 = objc_opt_new();
  id v23 = +[NSMutableArray arrayWithObject:v3];

  v4 = objc_alloc_init(DDRSchedulerResetNetworkSettings);
  [(DDRSchedulerResetNetworkSettings *)v4 configureTasks];
  objc_super v5 = [(DDRSchedulerResetNetworkSettings *)v4 scheduledTasks];
  [v23 addObjectsFromArray:v5];

  v6 = objc_opt_new();
  [v23 addObject:v6];

  v7 = objc_opt_new();
  [v23 addObject:v7];

  v8 = objc_opt_new();
  [v23 addObject:v8];

  v9 = objc_opt_new();
  [v23 addObject:v9];

  v10 = objc_opt_new();
  [v23 addObject:v10];

  v11 = objc_opt_new();
  [v23 addObject:v11];

  v12 = objc_opt_new();
  [v23 addObject:v12];

  v13 = objc_opt_new();
  [v23 addObject:v13];

  v14 = objc_opt_new();
  [v23 addObject:v14];

  v15 = objc_opt_new();
  [v23 addObject:v15];

  v16 = objc_opt_new();
  [v23 addObject:v16];

  v17 = objc_opt_new();
  [v23 addObject:v17];

  v18 = objc_opt_new();
  [v23 addObject:v18];

  v19 = objc_opt_new();
  [v23 addObject:v19];

  v20 = objc_opt_new();
  [v23 addObject:v20];

  v21 = objc_opt_new();
  [v23 addObject:v21];

  id v22 = [v23 copy];
  [(DDRSchedulerResetAllSettings *)self setResetTasks:v22];
}

- (id)scheduledTasks
{
  v2 = [(DDRSchedulerResetAllSettings *)self resetTasks];
  id v3 = [v2 copy];

  return v3;
}

- (NSArray)resetTasks
{
  return self->_resetTasks;
}

- (void)setResetTasks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end