@interface DDRSchedulerResetSceneUnderstandingData
- (DDRSchedulerResetSceneUnderstandingData)init;
- (NSArray)resetTasks;
- (id)scheduledTasks;
- (void)configureTasks;
- (void)setResetTasks:(id)a3;
@end

@implementation DDRSchedulerResetSceneUnderstandingData

- (DDRSchedulerResetSceneUnderstandingData)init
{
  v5.receiver = self;
  v5.super_class = (Class)DDRSchedulerResetSceneUnderstandingData;
  v2 = [(DDRScheduler *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DDRScheduler *)v2 setMode:1];
  }
  return v3;
}

- (void)configureTasks
{
  v7 = objc_alloc_init(DDRScheduler);
  [(DDRScheduler *)v7 configureTasks];
  v3 = [(DDRScheduler *)v7 scheduledTasks];
  v4 = +[NSMutableArray arrayWithArray:v3];

  objc_super v5 = objc_opt_new();
  [v4 addObject:v5];

  id v6 = [v4 copy];
  [(DDRSchedulerResetSceneUnderstandingData *)self setResetTasks:v6];
}

- (id)scheduledTasks
{
  v2 = [(DDRSchedulerResetSceneUnderstandingData *)self resetTasks];
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