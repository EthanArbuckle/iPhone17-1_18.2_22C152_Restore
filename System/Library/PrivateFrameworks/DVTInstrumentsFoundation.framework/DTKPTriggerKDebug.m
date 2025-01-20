@interface DTKPTriggerKDebug
- (DTKPKDebugCodeSet)codeSet;
- (DTKPTriggerKDebug)initWithCounterAllocatorProvider:(id)a3;
- (int)filterMode;
- (int)start:(id *)a3;
- (int)stop:(id *)a3;
- (unint64_t)triggerKind;
- (void)addCodeSet:(id)a3;
- (void)clearCodeSet;
- (void)enableClass:(unsigned __int8)a3;
- (void)enableClass:(unsigned __int8)a3 subclass:(unsigned __int8)a4;
- (void)enableClass:(unsigned __int8)a3 subclass:(unsigned __int8)a4 code:(unsigned int)a5;
- (void)enableDebugID:(unsigned int)a3;
- (void)setFilterMode:(int)a3;
@end

@implementation DTKPTriggerKDebug

- (DTKPTriggerKDebug)initWithCounterAllocatorProvider:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DTKPTriggerKDebug;
  v3 = [(DTKPTrigger *)&v8 initWithCounterAllocatorProvider:a3];
  v4 = v3;
  if (v3)
  {
    v3->_filterMode = 0;
    uint64_t v5 = objc_opt_new();
    codeSet = v4->_codeSet;
    v4->_codeSet = (DTKPKDebugCodeSet *)v5;
  }
  return v4;
}

- (void)clearCodeSet
{
  v3 = (DTKPKDebugCodeSet *)objc_opt_new();
  codeSet = self->_codeSet;
  self->_codeSet = v3;
}

- (void)addCodeSet:(id)a3
{
  id v4 = a3;
  id v5 = [(DTKPTriggerKDebug *)self codeSet];
  [v5 addCodeSet:v4];
}

- (void)enableClass:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [(DTKPTriggerKDebug *)self codeSet];
  [v4 addClass:v3];
}

- (void)enableClass:(unsigned __int8)a3 subclass:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  id v6 = [(DTKPTriggerKDebug *)self codeSet];
  [v6 addClass:v5 subclassID:v4];
}

- (void)enableClass:(unsigned __int8)a3 subclass:(unsigned __int8)a4 code:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  id v8 = [(DTKPTriggerKDebug *)self codeSet];
  [v8 addClass:v7 subclassID:v6 code:v5];
}

- (void)enableDebugID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v7 = [(DTKPTriggerKDebug *)self codeSet];
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = [NSNumber numberWithInt:v3];
  uint64_t v6 = [v4 setWithObject:v5];
  [v7 addCodes:v6];
}

- (int)start:(id *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v6 = (id)sDTKPLogClient;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v7 = [(DTKPTrigger *)self triggerID];
    int filterMode = self->_filterMode;
    v9 = [(DTKPTriggerKDebug *)self codeSet];
    id v10 = [v9 description];
    v25[0] = 67109634;
    v25[1] = v7;
    __int16 v26 = 1024;
    int v27 = filterMode;
    __int16 v28 = 2080;
    uint64_t v29 = [v10 UTF8String];
    _os_log_impl(&dword_23087D000, v6, OS_LOG_TYPE_DEBUG, "DTKPTriggerKDebug: Starting KDebug Trigger (%d). Filter Mode: %d. %s.", (uint8_t *)v25, 0x18u);
  }
  v11 = [(DTKPTriggerKDebug *)self codeSet];
  v12 = [v11 kdebugCodes];
  BOOL v13 = [v12 count] == 0;

  if (!v13)
  {
    BOOL v14 = [(DTKPTrigger *)self collectKernelStacks];
    BOOL v15 = [(DTKPTrigger *)self collectUserStacks];
    unint64_t v16 = [(DTKPTrigger *)self pmcEventCount];
    if (v14) {
      int v17 = 4;
    }
    else {
      int v17 = 0;
    }
    if (v15) {
      v17 |= 8u;
    }
    if (v16) {
      v17 |= 0x20u;
    }
    uint64_t v18 = v17 | 1u;
    [(DTKPTrigger *)self setSamplers:v18];
    [(DTKPTrigger *)self setActionID:[(DTKPTrigger *)self _actionAlloc]];
    if (![(DTKPTrigger *)self actionID])
    {
      v22 = [NSString stringWithFormat:@"Error allocating a Kdebug trigger action"];
      int v21 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerKDebug", a3, 0xFFFFFFFFLL, v22);

      goto LABEL_15;
    }
    v19 = [(DTKPTriggerKDebug *)self codeSet];
    uint64_t v20 = [v19 createKperfFilter];

    [(DTKPTrigger *)self _setSamplers:v18 forAction:[(DTKPTrigger *)self actionID]];
    [(DTKPTrigger *)self _setFilterByPid:[(DTKPTrigger *)self targetPid] forAction:[(DTKPTrigger *)self actionID]];
    kperf_kdebug_filter_set();
    [(DTKPTrigger *)self actionID];
    kperf_kdebug_action_set();
    +[DTKPKDebugCodeSet releaseKperfFilter:v20];
  }
  int v21 = 0;
LABEL_15:
  v23 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_signal(v23);

  return v21;
}

- (int)stop:(id *)a3
{
  uint64_t v4 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  kperf_kdebug_filter_set();
  kperf_kdebug_action_set();
  if ([(DTKPTrigger *)self actionID])
  {
    [(DTKPTrigger *)self _actionDealloc:[(DTKPTrigger *)self actionID]];
    [(DTKPTrigger *)self setActionID:0];
  }
  uint64_t v5 = [(DTKPTrigger *)self lock];
  dispatch_semaphore_signal(v5);

  return 0;
}

- (unint64_t)triggerKind
{
  return 2;
}

- (int)filterMode
{
  return self->_filterMode;
}

- (void)setFilterMode:(int)a3
{
  self->_int filterMode = a3;
}

- (DTKPKDebugCodeSet)codeSet
{
  return self->_codeSet;
}

- (void).cxx_destruct
{
}

@end