@interface PDTaskSchedulerBlockTask
- (BOOL)isRepeating;
- (NSString)description;
- (NSString)identifier;
- (OS_dispatch_queue)executionQueue;
- (PDTaskSchedulerBlockTask)initWithIdentifier:(id)a3 queue:(id)a4 block:(id)a5;
- (id)taskBlock;
- (unint64_t)delay;
- (unint64_t)gracePeriod;
- (unint64_t)priority;
- (unint64_t)requiredNetworkState;
- (void)clampToPredefinedTimePeriod:(unint64_t)a3;
- (void)runWithTask:(id)a3;
- (void)setDelay:(unint64_t)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setGracePeriod:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setRepeating:(BOOL)a3;
- (void)setRequiredNetworkState:(unint64_t)a3;
- (void)setTaskBlock:(id)a3;
@end

@implementation PDTaskSchedulerBlockTask

- (PDTaskSchedulerBlockTask)initWithIdentifier:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PDTaskSchedulerBlockTask;
  v11 = [(PDTaskSchedulerBlockTask *)&v17 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = v12;

    objc_storeStrong((id *)&v11->_executionQueue, a4);
    id v14 = [v10 copy];
    id taskBlock = v11->_taskBlock;
    v11->_id taskBlock = v14;

    v11->_repeating = 1;
    *(_OWORD *)&v11->_delay = xmmword_10019B790;
    *(int64x2_t *)&v11->_priority = vdupq_n_s64(1uLL);
  }

  return v11;
}

- (void)clampToPredefinedTimePeriod:(unint64_t)a3
{
  self;
  uint64_t v5 = 0;
  while (1)
  {
    unint64_t v6 = qword_10019B7A0[v5];
    if (v6 >= a3) {
      break;
    }
    if (++v5 == 8)
    {
      unint64_t v6 = 604800;
      [(PDTaskSchedulerBlockTask *)self setDelay:604800];
      goto LABEL_6;
    }
  }
  [(PDTaskSchedulerBlockTask *)self setDelay:qword_10019B7A0[v5]];
  if (!(v5 * 8))
  {
    uint64_t v7 = 60;
    goto LABEL_10;
  }
LABEL_6:
  if (v6 - 1 >= 0xE10) {
    uint64_t v7 = 3600;
  }
  else {
    uint64_t v7 = v6 - 1;
  }
LABEL_10:

  [(PDTaskSchedulerBlockTask *)self setGracePeriod:v7];
}

- (void)runWithTask:(id)a3
{
  id v4 = a3;
  CLSInitLog();
  uint64_t v5 = (void *)CLSLogDefault;
  if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
  {
    id v8 = v5;
    id v9 = [(PDTaskSchedulerBlockTask *)self identifier];
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Running scheduled task '%@", buf, 0xCu);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000649F0;
  v10[3] = &unk_1001F2A68;
  v10[4] = self;
  [v4 setExpirationHandler:v10];
  unint64_t v6 = [(PDTaskSchedulerBlockTask *)self executionQueue];
  uint64_t v7 = [(PDTaskSchedulerBlockTask *)self taskBlock];
  dispatch_sync(v6, v7);

  [v4 setTaskCompleted];
}

- (NSString)description
{
  v13.receiver = self;
  v13.super_class = (Class)PDTaskSchedulerBlockTask;
  v3 = [(PDTaskSchedulerBlockTask *)&v13 description];
  id v4 = [v3 mutableCopy];

  [v4 appendFormat:@" (identifier: %@)", self->_identifier];
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:self->_delay];
  [v4 appendFormat:@" (delay: %@)", v5];

  unint64_t v6 = +[NSNumber numberWithUnsignedInteger:self->_gracePeriod];
  [v4 appendFormat:@" (gracePeriod: %@)", v6];

  unint64_t priority = self->_priority;
  if (priority)
  {
    if (priority == 1)
    {
      id v8 = @"Utility";
    }
    else
    {
      id v8 = +[NSString stringWithFormat:@"Unknown PDTaskSchedulerTaskPriority: '%ld'", self->_priority];
    }
  }
  else
  {
    id v8 = @"Maintenance";
  }
  [v4 appendFormat:@" (priority: %@)", v8];

  if (self->_repeating) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  [v4 appendFormat:@" (isRepeating: %@)", v9];
  unint64_t requiredNetworkState = self->_requiredNetworkState;
  if (requiredNetworkState >= 3)
  {
    v11 = +[NSString stringWithFormat:@"Unknown PDTaskSchedulerTaskNetworkState: '%ld'", self->_requiredNetworkState];
  }
  else
  {
    v11 = off_1001F33A8[requiredNetworkState];
  }
  [v4 appendFormat:@" (requiredNetworkState: %@)", v11];

  return (NSString *)v4;
}

- (unint64_t)delay
{
  return self->_delay;
}

- (void)setDelay:(unint64_t)a3
{
  self->_delay = a3;
}

- (unint64_t)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(unint64_t)a3
{
  self->_gracePeriod = a3;
}

- (BOOL)isRepeating
{
  return self->_repeating;
}

- (void)setRepeating:(BOOL)a3
{
  self->_repeating = a3;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_unint64_t priority = a3;
}

- (unint64_t)requiredNetworkState
{
  return self->_requiredNetworkState;
}

- (void)setRequiredNetworkState:(unint64_t)a3
{
  self->_unint64_t requiredNetworkState = a3;
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (id)taskBlock
{
  return self->_taskBlock;
}

- (void)setTaskBlock:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_taskBlock, 0);

  objc_storeStrong((id *)&self->_executionQueue, 0);
}

@end