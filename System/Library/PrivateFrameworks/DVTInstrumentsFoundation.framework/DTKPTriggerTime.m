@interface DTKPTriggerTime
+ (int)reinitializeKperf:(id *)a3;
- (BOOL)profileEveryThread;
- (DTKPTriggerTime)initWithCounterAllocatorProvider:(id)a3;
- (int)_configureTimer:(unsigned int)a3 actionID:(unsigned int)a4 period:(unint64_t)a5 userData:(unsigned int)a6;
- (int)start:(id *)a3;
- (int)stop:(id *)a3;
- (unint64_t)_recordConfigWordsIntoBuffer:(unint64_t *)a3;
- (unint64_t)sampleRate;
- (unint64_t)triggerKind;
- (unsigned)_timerIDAlloc;
- (unsigned)timerID;
- (void)_timerIDDdealloc:(unsigned int)a3;
- (void)dealloc;
- (void)setProfileEveryThread:(BOOL)a3;
- (void)setSampleRate:(unint64_t)a3;
@end

@implementation DTKPTriggerTime

- (DTKPTriggerTime)initWithCounterAllocatorProvider:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DTKPTriggerTime;
  result = [(DTKPTrigger *)&v4 initWithCounterAllocatorProvider:a3];
  if (result)
  {
    result->_sampleRate = 0;
    result->_profileEveryThread = 0;
    result->_timerID = -1;
  }
  return result;
}

- (void)dealloc
{
  if (self->_timerID != -1)
  {
    v3 = [NSString stringWithFormat:@"A %@ trigger was deallocated without freeing up its timer ID.", objc_opt_class()];
    DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", 0, 4294966893, v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)DTKPTriggerTime;
  [(DTKPTrigger *)&v4 dealloc];
}

+ (int)reinitializeKperf:(id *)a3
{
  if (qword_268707EB0)
  {
    free((void *)qword_268707EB0);
    qword_268707EB0 = 0;
    byte_268707EB8 = 0;
  }
  if (kperf_timer_count_set())
  {
    NSString *v4 = [NSString stringWithFormat:@"Failed to set the number of kperf timers: %d", *__error()];
    v5 = a3;
    uint64_t v6 = 4294966894;
LABEL_5:
    int v7 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", v5, v6, v4);

    return v7;
  }
  qword_268707EB0 = (uint64_t)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
  if (!qword_268707EB0)
  {
    objc_super v4 = [NSString stringWithFormat:@"Failed to allocate memory for kperf timers: %d.", *__error()];
    v5 = a3;
    uint64_t v6 = 4294967096;
    goto LABEL_5;
  }
  byte_268707EB8 = 1;
  return 0;
}

- (unint64_t)_recordConfigWordsIntoBuffer:(unint64_t *)a3
{
  objc_super v4 = [(DTKPTrigger *)self counterAllocator];
  unint64_t v5 = [v4 recordConfigWordsIntoBuffer:a3];

  return v5;
}

- (unsigned)_timerIDAlloc
{
  if (byte_268707EB8 == 1)
  {
    unint64_t v2 = 0;
    while (*(unsigned char *)(qword_268707EB0 + v2))
    {
      if (v2++ >= 7) {
        goto LABEL_6;
      }
    }
    *(unsigned char *)(qword_268707EB0 + v2) = 1;
  }
  else
  {
LABEL_6:
    LODWORD(v2) = -1;
  }
  return v2;
}

- (void)_timerIDDdealloc:(unsigned int)a3
{
  if (a3 > 7 || !byte_268707EB8 || !*(unsigned char *)(qword_268707EB0 + a3)) {
    sub_23093D120();
  }
  *(unsigned char *)(qword_268707EB0 + a3) = 0;
}

- (int)_configureTimer:(unsigned int)a3 actionID:(unsigned int)a4 period:(unint64_t)a5 userData:(unsigned int)a6
{
  int result = -4;
  if (a3 <= 7)
  {
    if (byte_268707EB8)
    {
      kperf_ns_to_ticks();
      kperf_timer_action_set();
      kperf_timer_period_set();
      kperf_action_userdata_set();
      return 0;
    }
  }
  return result;
}

- (int)start:(id *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v6 = (id)sDTKPLogClient;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    unsigned int v24 = [(DTKPTrigger *)self triggerID];
    __int16 v25 = 2048;
    unint64_t v26 = [(DTKPTriggerTime *)self sampleRate] / 0x3E8;
    __int16 v27 = 2048;
    unint64_t v28 = [(DTKPTrigger *)self pmcEventCount];
    _os_log_impl(&dword_23087D000, v6, OS_LOG_TYPE_DEBUG, "DTKPTriggerTime: Starting Time Trigger (%d). Period: %lld us. PMCs: %lu", buf, 0x1Cu);
  }

  BOOL v7 = [(DTKPTrigger *)self collectKernelStacks];
  BOOL v8 = [(DTKPTrigger *)self collectUserStacks];
  unint64_t v9 = [(DTKPTrigger *)self pmcEventCount];
  if (v7) {
    unsigned int v10 = 5;
  }
  else {
    unsigned int v10 = 1;
  }
  if (v8) {
    v10 |= 8u;
  }
  if (v9) {
    uint64_t v11 = v10 | 0x20;
  }
  else {
    uint64_t v11 = v10;
  }
  [(DTKPTrigger *)self setSamplers:v11];
  [(DTKPTrigger *)self setActionID:[(DTKPTrigger *)self _actionAlloc]];
  if ([(DTKPTrigger *)self actionID])
  {
    uint64_t v12 = [(DTKPTrigger *)self _setSamplers:[(DTKPTrigger *)self samplers] forAction:[(DTKPTrigger *)self actionID]];
    if (v12)
    {
      v13 = [NSString stringWithFormat:@"Error setting the Time trigger samplers (0x%x)", -[DTKPTrigger samplers](self, "samplers")];
      int v14 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", a3, v12, v13);
    }
    else
    {
      uint64_t v16 = [(DTKPTrigger *)self _setFilterByPid:[(DTKPTrigger *)self targetPid] forAction:[(DTKPTrigger *)self actionID]];
      if (v16)
      {
        v17 = @"Error configuring the Time trigger task filter";
      }
      else
      {
        uint64_t v20 = [(DTKPTriggerTime *)self _timerIDAlloc];
        self->_timerID = v20;
        if (v20 == -1)
        {
          v17 = @"Error allocating a Time trigger ID";
          uint64_t v16 = 0xFFFFFFFFLL;
        }
        else
        {
          uint64_t v16 = [(DTKPTriggerTime *)self _configureTimer:v20 actionID:[(DTKPTrigger *)self actionID] period:[(DTKPTriggerTime *)self sampleRate] userData:[(DTKPTrigger *)self triggerID]];
          if (!v16)
          {
            if ([(DTKPTriggerTime *)self profileEveryThread])
            {
              *(_DWORD *)buf = 1;
              if (sysctlbyname("kperf.lightweight_pet", 0, 0, buf, 4uLL))
              {
                v21 = [NSString stringWithFormat:@"Error enabling LPET mode: %d", *__error()];
                int v14 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", a3, 4294967290, v21);

                goto LABEL_18;
              }
              if (kperf_timer_pet_set())
              {
                v22 = [NSString stringWithFormat:@"Error enabling the PET mode timer: %d", *__error()];
                int v14 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", a3, 4294967290, v22);

                goto LABEL_18;
              }
            }
            int v14 = 0;
            goto LABEL_18;
          }
          v17 = @"Error configuring the Time trigger action";
        }
      }
      int v14 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", a3, v16, v17);
    }
  }
  else
  {
    v15 = [NSString stringWithFormat:@"Error allocating a Time trigger action"];
    int v14 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", a3, 0xFFFFFFFFLL, v15);
  }
LABEL_18:
  v18 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_signal(v18);

  return v14;
}

- (int)stop:(id *)a3
{
  objc_super v4 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  if ([(DTKPTrigger *)self actionID])
  {
    [(DTKPTrigger *)self _actionDealloc:[(DTKPTrigger *)self actionID]];
    [(DTKPTrigger *)self setActionID:0];
  }
  if (self->_timerID != -1)
  {
    -[DTKPTriggerTime _timerIDDdealloc:](self, "_timerIDDdealloc:");
    self->_timerID = -1;
  }
  unint64_t v5 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_signal(v5);

  return 0;
}

- (unint64_t)triggerKind
{
  return 0;
}

- (unint64_t)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(unint64_t)a3
{
  self->_sampleRate = a3;
}

- (BOOL)profileEveryThread
{
  return self->_profileEveryThread;
}

- (void)setProfileEveryThread:(BOOL)a3
{
  self->_profileEveryThread = a3;
}

- (unsigned)timerID
{
  return self->_timerID;
}

@end