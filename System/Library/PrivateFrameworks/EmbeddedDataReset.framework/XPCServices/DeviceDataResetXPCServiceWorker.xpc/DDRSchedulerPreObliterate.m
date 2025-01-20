@interface DDRSchedulerPreObliterate
- (BOOL)eraseDataPlan;
- (DDRSchedulerPreObliterate)initWithRequest:(id)a3;
- (NSArray)allResetTasks;
- (id)scheduledTasks;
- (void)configureTasks;
- (void)setAllResetTasks:(id)a3;
- (void)setEraseDataPlan:(BOOL)a3;
@end

@implementation DDRSchedulerPreObliterate

- (DDRSchedulerPreObliterate)initWithRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DDRSchedulerPreObliterate;
  v5 = [(DDRScheduler *)&v8 init];
  if (v5)
  {
    -[DDRScheduler setMode:](v5, "setMode:", [v4 mode]);
    v6 = [v4 options];
    -[DDRSchedulerPreObliterate setEraseDataPlan:](v5, "setEraseDataPlan:", [v6 eraseDataPlan]);
  }
  return v5;
}

- (void)configureTasks
{
  v13 = objc_alloc_init(DDRScheduler);
  [(DDRScheduler *)v13 configureTasks];
  v3 = [(DDRScheduler *)v13 scheduledTasks];
  id v4 = +[NSMutableArray arrayWithArray:v3];

  v5 = objc_opt_new();
  [v4 addObject:v5];

  v6 = objc_opt_new();
  [v4 addObject:v6];

  v7 = [[DDRTaskClearTelephonySettings alloc] initWithEraseDataPlan:[(DDRSchedulerPreObliterate *)self eraseDataPlan]];
  [v4 addObject:v7];

  objc_super v8 = objc_opt_new();
  [v4 addObject:v8];

  v9 = objc_opt_new();
  [v4 addObject:v9];

  v10 = objc_opt_new();
  [v4 addObject:v10];

  v11 = objc_opt_new();
  [v4 addObject:v11];

  id v12 = [v4 copy];
  [(DDRSchedulerPreObliterate *)self setAllResetTasks:v12];
}

- (id)scheduledTasks
{
  v2 = [(DDRSchedulerPreObliterate *)self allResetTasks];
  id v3 = [v2 copy];

  return v3;
}

- (NSArray)allResetTasks
{
  return self->_allResetTasks;
}

- (void)setAllResetTasks:(id)a3
{
}

- (BOOL)eraseDataPlan
{
  return self->_eraseDataPlan;
}

- (void)setEraseDataPlan:(BOOL)a3
{
  self->_eraseDataPlan = a3;
}

- (void).cxx_destruct
{
}

@end