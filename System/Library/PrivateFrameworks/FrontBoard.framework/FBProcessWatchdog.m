@interface FBProcessWatchdog
- (FBProcessCPUStatistics)cpuStatistics;
- (FBProcessWatchdog)initWithProcess:(id)a3 context:(id)a4 policy:(id)a5;
- (FBProcessWatchdogEventContext)eventContext;
- (id)_policyDesc;
- (int64_t)event;
- (void)activate;
@end

@implementation FBProcessWatchdog

- (int64_t)event
{
  return self->_event;
}

- (id)_policyDesc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = [(FBSProcessWatchdog *)self policy];
  v3 = [v2 provisions];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    double v7 = 0.0;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) { {
          objc_enumerationMutation(v3);
        }
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 type];
        if (v10) { {
          [v10 allowance];
        }
        }
        FBSProcessResourceAllowanceGetValue();
        FBSProcessResourceTimeIntervalForValue();
        if (v11 == 2)
        {
          double v7 = v7 + v12;
        }
        else if (v11 == 1)
        {
          double v8 = v8 + v12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
  }

  if (v8 > 0.0 && v7 > 0.0)
  {
    [NSString stringWithFormat:@"%.2fs cpu over %.2fs", *(void *)&v7, *(void *)&v8];
LABEL_23:
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (v8 > 0.0)
  {
    [NSString stringWithFormat:@"%.2fs", *(void *)&v8, v15];
    goto LABEL_23;
  }
  if (v7 > 0.0)
  {
    [NSString stringWithFormat:@"%.2fs cpu", *(void *)&v7, v15];
    goto LABEL_23;
  }
  v13 = @"n/a";
LABEL_24:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)activate
{
  if (self->_handle)
  {
    v3 = [[FBProcessCPUStatistics alloc] initWithProcessHandle:self->_handle];
    cpuStatistics = self->_cpuStatistics;
    self->_cpuStatistics = v3;
  }
  v5.receiver = self;
  v5.super_class = (Class)FBProcessWatchdog;
  [(FBSProcessWatchdog *)&v5 activate];
}

- (FBProcessWatchdog)initWithProcess:(id)a3 context:(id)a4 policy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v9 event];
  double v12 = NSStringFromProcessWatchdogEvent(v11);
  v17.receiver = self;
  v17.super_class = (Class)FBProcessWatchdog;
  v13 = [(FBSProcessWatchdog *)&v17 initWithName:v12 process:v8 policy:v10];

  if (v13)
  {
    v13->_event = v11;
    objc_storeStrong((id *)&v13->_eventContext, a4);
    uint64_t v14 = [v8 rbsHandle];
    handle = v13->_handle;
    v13->_handle = (RBSProcessHandle *)v14;
  }
  return v13;
}

- (FBProcessWatchdogEventContext)eventContext
{
  return self->_eventContext;
}

- (FBProcessCPUStatistics)cpuStatistics
{
  return self->_cpuStatistics;
}

@end