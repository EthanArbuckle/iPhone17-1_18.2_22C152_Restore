@interface DTKPTriggerPMI
- (NSString)pmiEventNameOrAlias;
- (int)setPMIEventNamed:(id)a3 threshold:(unint64_t)a4 error:(id *)a5;
- (int)start:(id *)a3;
- (int)stop:(id *)a3;
- (unint64_t)_recordConfigWordsIntoBuffer:(unint64_t *)a3;
- (unint64_t)thresholdCount;
- (unint64_t)triggerKind;
@end

@implementation DTKPTriggerPMI

- (unint64_t)_recordConfigWordsIntoBuffer:(unint64_t *)a3
{
  v4 = [(DTKPTrigger *)self counterAllocator];
  unint64_t v5 = [v4 recordConfigWordsIntoBuffer:a3];

  return v5;
}

- (int)setPMIEventNamed:(id)a3 threshold:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(DTKPTrigger *)self counterAllocator];
  int v10 = [v9 setPMIEventName:v8 pmiThreshold:a4 error:a5];

  if (v10)
  {
    v11 = 0;
    a4 = 0;
  }
  else
  {
    v11 = (NSString *)v8;
  }
  pmiEventNameOrAlias = self->_pmiEventNameOrAlias;
  self->_pmiEventNameOrAlias = v11;

  self->_thresholdCount = a4;
  return v10;
}

- (int)start:(id *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  v6 = (id)sDTKPLogClient;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v7 = [(DTKPTrigger *)self triggerID];
    id v8 = [(NSString *)self->_pmiEventNameOrAlias UTF8String];
    unint64_t thresholdCount = self->_thresholdCount;
    *(_DWORD *)buf = 67109890;
    unsigned int v25 = v7;
    __int16 v26 = 2080;
    v27 = v8;
    __int16 v28 = 2048;
    unint64_t v29 = thresholdCount;
    __int16 v30 = 2048;
    unint64_t v31 = [(DTKPTrigger *)self pmcEventCount];
    _os_log_impl(&dword_23087D000, v6, OS_LOG_TYPE_DEBUG, "DTKPTriggerPMI: Starting PMI Trigger (%d). Event: %s. Threshold: %lld. PMCs: %lu", buf, 0x26u);
  }

  BOOL v10 = [(DTKPTrigger *)self collectKernelStacks];
  BOOL v11 = [(DTKPTrigger *)self collectUserStacks];
  BOOL v12 = [(DTKPTrigger *)self requestsPMCSampling];
  if (v10) {
    int v13 = 4;
  }
  else {
    int v13 = 0;
  }
  if (v11) {
    v13 |= 8u;
  }
  if (v12) {
    int v14 = 33;
  }
  else {
    int v14 = 1;
  }
  [(DTKPTrigger *)self setSamplers:v14 | v13];
  [(DTKPTrigger *)self setActionID:[(DTKPTrigger *)self _actionAlloc]];
  if ([(DTKPTrigger *)self actionID])
  {
    [(DTKPTrigger *)self actionID];
    [(DTKPTrigger *)self triggerID];
    kperf_action_userdata_set();
    v15 = [(DTKPTrigger *)self counterAllocator];
    int v16 = [v15 configurePMIActionID:-[DTKPTrigger actionID](self, "actionID") error:a3];

    if (!v16)
    {
      v17 = [(DTKPTrigger *)self counterAllocator];
      int v16 = [v17 configureHardwarePMIPeriods:a3];

      if (!v16)
      {
        uint64_t v18 = [(DTKPTrigger *)self _setSamplers:[(DTKPTrigger *)self samplers] forAction:[(DTKPTrigger *)self actionID]];
        if (v18)
        {
          v19 = [NSString stringWithFormat:@"Error setting the PMI trigger samplers (0x%x)", -[DTKPTrigger samplers](self, "samplers")];
          int v16 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerPMI", a3, v18, v19);
        }
        else
        {
          uint64_t v23 = [(DTKPTrigger *)self _setFilterByPid:[(DTKPTrigger *)self targetPid] forAction:[(DTKPTrigger *)self actionID]];
          if (v23) {
            int v16 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerPMI", a3, v23, @"Error configuring the Time trigger task filter");
          }
          else {
            int v16 = 0;
          }
        }
      }
    }
  }
  else
  {
    v20 = [NSString stringWithFormat:@"Error allocating a PMI trigger action"];
    int v16 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerPMI", a3, 0xFFFFFFFFLL, v20);
  }
  v21 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_signal(v21);

  return v16;
}

- (int)stop:(id *)a3
{
  v4 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  if ([(DTKPTrigger *)self actionID])
  {
    [(DTKPTrigger *)self _actionDealloc:[(DTKPTrigger *)self actionID]];
    [(DTKPTrigger *)self setActionID:0];
  }
  unint64_t v5 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_signal(v5);

  return 0;
}

- (unint64_t)triggerKind
{
  return 1;
}

- (NSString)pmiEventNameOrAlias
{
  return self->_pmiEventNameOrAlias;
}

- (unint64_t)thresholdCount
{
  return self->_thresholdCount;
}

- (void).cxx_destruct
{
}

@end