@interface DDRScheduler
- (DDRScheduler)init;
- (NSArray)resetTasks;
- (id)scheduledTasks;
- (int64_t)mode;
- (void)configureTasks;
- (void)setMode:(int64_t)a3;
- (void)setResetTasks:(id)a3;
@end

@implementation DDRScheduler

- (DDRScheduler)init
{
  NSLog(@"initialize pre-reset scheduler", a2);
  v4.receiver = self;
  v4.super_class = (Class)DDRScheduler;
  result = [(DDRScheduler *)&v4 init];
  if (result) {
    result->_mode = 0;
  }
  return result;
}

- (id)scheduledTasks
{
  v2 = [(DDRScheduler *)self resetTasks];
  id v3 = [v2 copy];

  return v3;
}

- (void)configureTasks
{
  NSLog(@"configure all pre-reset tasks", a2);
  id v3 = objc_opt_new();
  v9[0] = v3;
  objc_super v4 = objc_opt_new();
  v9[1] = v4;
  v5 = objc_opt_new();
  v9[2] = v5;
  v6 = objc_opt_new();
  v9[3] = v6;
  v7 = +[NSArray arrayWithObjects:v9 count:4];
  resetTasks = self->_resetTasks;
  self->_resetTasks = v7;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
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