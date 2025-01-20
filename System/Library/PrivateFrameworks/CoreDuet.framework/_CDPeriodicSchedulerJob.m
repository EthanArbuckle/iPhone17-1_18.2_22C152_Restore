@interface _CDPeriodicSchedulerJob
+ (_CDPeriodicSchedulerJob)jobWithInterval:(double)a3 schedulerJobName:(id)a4 handler:(id)a5;
+ (_CDPeriodicSchedulerJob)jobWithInterval:(double)a3 schedulerJobName:(id)a4 queue:(id)a5 asynchronousHandler:(BOOL)a6 handler:(id)a7;
+ (_CDPeriodicSchedulerJob)jobWithPeriod:(int64_t)a3 schedulerJobName:(id)a4 handler:(id)a5;
- (BOOL)isHandlerAsynchronous;
- (NSString)jobName;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)activity;
- (OS_xpc_object)executionCriteria;
- (_CDPeriodicSchedulerJob)init;
- (_CDPeriodicSchedulerJob)initWithPeriod:(int64_t)a3 interval:(double)a4 schedulerJobName:(id)a5 queue:(id)a6 asynchronousHandler:(BOOL)a7 handler:(id)a8;
- (double)interval;
- (id)handler;
- (int64_t)period;
- (void)setActivity:(id)a3;
- (void)setExecutionCriteria:(id)a3;
@end

@implementation _CDPeriodicSchedulerJob

- (_CDPeriodicSchedulerJob)init
{
  return 0;
}

+ (_CDPeriodicSchedulerJob)jobWithPeriod:(int64_t)a3 schedulerJobName:(id)a4 handler:(id)a5
{
  switch(a3)
  {
    case 1:
      v8 = (uint64_t *)MEMORY[0x1E4F141F8];
      goto LABEL_10;
    case 2:
      v8 = (uint64_t *)MEMORY[0x1E4F14218];
      goto LABEL_10;
    case 3:
      uint64_t v9 = 3 * *MEMORY[0x1E4F141F8];
      goto LABEL_8;
    case 4:
      uint64_t v10 = 12 * *MEMORY[0x1E4F141F8];
      goto LABEL_11;
    case 5:
      uint64_t v9 = 9 * *MEMORY[0x1E4F141F8];
LABEL_8:
      uint64_t v10 = 2 * v9;
      goto LABEL_11;
    case 6:
      v8 = (uint64_t *)MEMORY[0x1E4F141E8];
      goto LABEL_10;
    default:
      v8 = (uint64_t *)MEMORY[0x1E4F14228];
LABEL_10:
      uint64_t v10 = *v8;
LABEL_11:
      v11 = (const char *)_CDPeriodicSchedulerDefaultQueueName;
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v13 = a5;
      id v14 = a4;
      dispatch_queue_t v15 = dispatch_queue_create(v11, v12);

      v16 = [[_CDPeriodicSchedulerJob alloc] initWithPeriod:a3 interval:v14 schedulerJobName:v15 queue:0 asynchronousHandler:v13 handler:(double)v10];
      return v16;
  }
}

+ (_CDPeriodicSchedulerJob)jobWithInterval:(double)a3 schedulerJobName:(id)a4 handler:(id)a5
{
  uint64_t v8 = _MAPIntervalToCDPeriod((uint64_t)a3);
  uint64_t v9 = (const char *)_CDPeriodicSchedulerDefaultQueueName;
  uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v11 = a5;
  id v12 = a4;
  dispatch_queue_t v13 = dispatch_queue_create(v9, v10);

  id v14 = [[_CDPeriodicSchedulerJob alloc] initWithPeriod:v8 interval:v12 schedulerJobName:v13 queue:0 asynchronousHandler:v11 handler:a3];
  return v14;
}

+ (_CDPeriodicSchedulerJob)jobWithInterval:(double)a3 schedulerJobName:(id)a4 queue:(id)a5 asynchronousHandler:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v12 = _MAPIntervalToCDPeriod((uint64_t)a3);
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  v16 = [[_CDPeriodicSchedulerJob alloc] initWithPeriod:v12 interval:v15 schedulerJobName:v14 queue:v8 asynchronousHandler:v13 handler:a3];

  return v16;
}

- (_CDPeriodicSchedulerJob)initWithPeriod:(int64_t)a3 interval:(double)a4 schedulerJobName:(id)a5 queue:(id)a6 asynchronousHandler:(BOOL)a7 handler:(id)a8
{
  keys[6] = *(char **)MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)_CDPeriodicSchedulerJob;
  v18 = [(_CDPeriodicSchedulerJob *)&v29 init];
  v19 = v18;
  if (v18)
  {
    v18->_period = a3;
    v18->_interval = a4;
    objc_storeStrong((id *)&v18->_queue, a6);
    objc_storeStrong((id *)&v19->_jobName, a5);
    v19->_isHandlerAsynchronous = a7;
    uint64_t v20 = MEMORY[0x192FB31A0](v17);
    id handler = v19->_handler;
    v19->_id handler = (id)v20;

    v22 = (char *)*MEMORY[0x1E4F142F8];
    keys[0] = *(char **)MEMORY[0x1E4F141C8];
    keys[1] = v22;
    v23 = (char *)*MEMORY[0x1E4F14340];
    keys[2] = *(char **)MEMORY[0x1E4F142C8];
    keys[3] = v23;
    v24 = (char *)*MEMORY[0x1E4F14320];
    keys[4] = *(char **)MEMORY[0x1E4F142B0];
    keys[5] = v24;
    values[0] = xpc_int64_create((uint64_t)a4);
    values[1] = xpc_BOOL_create(1);
    values[2] = xpc_string_create((const char *)*MEMORY[0x1E4F142D0]);
    values[3] = xpc_BOOL_create(1);
    values[4] = xpc_BOOL_create(1);
    values[5] = xpc_BOOL_create(1);
    v25 = (OS_xpc_object *)xpc_dictionary_create((const char *const *)keys, values, 6uLL);
    executionCriteria = v19->_executionCriteria;
    v19->_executionCriteria = v25;

    for (uint64_t i = 5; i != -1; --i)
  }

  return v19;
}

- (void)setExecutionCriteria:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    id v9 = v5;
    BOOL v7 = xpc_equal(v5, self->_executionCriteria);
    v6 = v9;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_executionCriteria, a3);
      BOOL v8 = +[_CDPeriodicScheduler sharedInstance];
      [v8 updateExecutionCriteriaOnJob:self];

      v6 = v9;
    }
  }
}

- (int64_t)period
{
  return self->_period;
}

- (double)interval
{
  return self->_interval;
}

- (NSString)jobName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (id)handler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (OS_xpc_object)executionCriteria
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 48, 1);
}

- (OS_xpc_object)activity
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 64, 1);
}

- (void)setActivity:(id)a3
{
}

- (BOOL)isHandlerAsynchronous
{
  return self->_isHandlerAsynchronous;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_executionCriteria, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_jobName, 0);
}

@end