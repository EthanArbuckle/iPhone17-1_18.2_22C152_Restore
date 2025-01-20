@interface DDRSchedulerResetNetworkSettings
- (DDRSchedulerResetNetworkSettings)init;
- (NSArray)resetTasks;
- (id)scheduledTasks;
- (void)configureTasks;
- (void)setResetTasks:(id)a3;
@end

@implementation DDRSchedulerResetNetworkSettings

- (DDRSchedulerResetNetworkSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)DDRSchedulerResetNetworkSettings;
  v2 = [(DDRScheduler *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DDRScheduler *)v2 setMode:2];
  }
  return v3;
}

- (void)configureTasks
{
  v19 = objc_alloc_init(DDRScheduler);
  [(DDRScheduler *)v19 configureTasks];
  v3 = [(DDRScheduler *)v19 scheduledTasks];
  v4 = +[NSMutableArray arrayWithArray:v3];

  objc_super v5 = objc_opt_new();
  [v4 addObject:v5];

  v6 = objc_opt_new();
  [v4 addObject:v6];

  v7 = objc_opt_new();
  [v4 addObject:v7];

  v8 = objc_opt_new();
  [v4 addObject:v8];

  v9 = objc_opt_new();
  [v4 addObject:v9];

  v10 = objc_opt_new();
  [v4 addObject:v10];

  v11 = objc_opt_new();
  [v4 addObject:v11];

  v12 = objc_opt_new();
  [v4 addObject:v12];

  v13 = objc_opt_new();
  [v4 addObject:v13];

  v14 = objc_opt_new();
  [v4 addObject:v14];

  v15 = objc_opt_new();
  [v4 addObject:v15];

  v16 = objc_opt_new();
  [v4 addObject:v16];

  v17 = objc_opt_new();
  [v4 addObject:v17];

  id v18 = [v4 copy];
  [(DDRSchedulerResetNetworkSettings *)self setResetTasks:v18];
}

- (id)scheduledTasks
{
  v2 = [(DDRSchedulerResetNetworkSettings *)self resetTasks];
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