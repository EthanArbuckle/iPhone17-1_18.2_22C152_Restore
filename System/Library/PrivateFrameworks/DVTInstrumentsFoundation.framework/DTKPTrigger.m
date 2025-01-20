@interface DTKPTrigger
+ (int)reinitializeKperf:(id *)a3;
- (BOOL)collectKernelStacks;
- (BOOL)collectUserStacks;
- (BOOL)requestsPMCSampling;
- (DTKPCPUCounterAllocator)counterAllocator;
- (DTKPCPUCounterAllocator)queryCounterAllocator;
- (DTKPTrigger)init;
- (DTKPTrigger)initWithCounterAllocatorProvider:(id)a3;
- (DTKPTriggerCounterAllocatorProvider)counterAllocatorProvider;
- (OS_dispatch_semaphore)lock;
- (const)triggerKindRepr;
- (int)_setFilterByPid:(int)a3 forAction:(unsigned int)a4;
- (int)_setSamplers:(unsigned int)a3 forAction:(unsigned int)a4;
- (int)addPMCEventNamed:(id)a3 error:(id *)a4;
- (int)start:(id *)a3;
- (int)stop:(id *)a3;
- (int)targetPid;
- (unint64_t)pmcEventCount;
- (unint64_t)triggerKind;
- (unsigned)_actionAlloc;
- (unsigned)actionID;
- (unsigned)samplers;
- (unsigned)triggerID;
- (void)_actionDealloc:(unsigned int)a3;
- (void)dealloc;
- (void)setActionID:(unsigned int)a3;
- (void)setCollectKernelStacks:(BOOL)a3;
- (void)setCollectUserStacks:(BOOL)a3;
- (void)setSamplers:(unsigned int)a3;
- (void)setTargetPid:(int)a3;
@end

@implementation DTKPTrigger

- (DTKPTrigger)init
{
  return [(DTKPTrigger *)self initWithCounterAllocatorProvider:0];
}

- (DTKPTrigger)initWithCounterAllocatorProvider:(id)a3
{
  v4 = (DTKPTriggerCounterAllocatorProvider *)a3;
  v10.receiver = self;
  v10.super_class = (Class)DTKPTrigger;
  v5 = [(DTKPTrigger *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_triggerID = atomic_fetch_add_explicit(dword_268708150, 1u, memory_order_relaxed) + 1;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(1);
    lock = v6->_lock;
    v6->_lock = (OS_dispatch_semaphore *)v7;

    *(_WORD *)&v6->_collectUserStacks = 0;
    v6->_targetPid = -3;
    v6->_counterAllocatorProvider = v4;
    v6->_requestsPMCSampling = 0;
    [(DTKPTrigger *)v6 setSamplers:0];
  }

  return v6;
}

- (void)dealloc
{
  if (self->_actionID)
  {
    v3 = [NSString stringWithFormat:@"A %@ trigger was deallocated without freeing up its action ID.", objc_opt_class()];
    DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTrigger", 0, 4294966893, v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)DTKPTrigger;
  [(DTKPTrigger *)&v4 dealloc];
}

+ (int)reinitializeKperf:(id *)a3
{
  if (qword_268708158)
  {
    free((void *)qword_268708158);
    qword_268708158 = 0;
  }
  if (kperf_action_count_set())
  {
    objc_super v4 = [NSString stringWithFormat:@"Failed to set the number of kperf actions: %d", *__error()];
    int v5 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTrigger", a3, 4294966894, v4);

    return v5;
  }
  else
  {
    qword_268708158 = (uint64_t)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
    if (qword_268708158)
    {
      byte_268708160 = 1;
      return 0;
    }
    else
    {
      return DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTrigger", a3, 4294967096, @"Failed to allocate memory for kperf actions.");
    }
  }
}

- (int)start:(id *)a3
{
}

- (int)stop:(id *)a3
{
}

- (unsigned)_actionAlloc
{
  if (byte_268708160 == 1)
  {
    unint64_t v2 = 1;
    while (*(unsigned char *)(qword_268708158 + v2))
    {
      if (v2++ >= 0x1F) {
        goto LABEL_6;
      }
    }
    *(unsigned char *)(qword_268708158 + v2) = 1;
  }
  else
  {
LABEL_6:
    LODWORD(v2) = 0;
  }
  return v2;
}

- (void)_actionDealloc:(unsigned int)a3
{
  BOOL v3 = a3 - 1 > 0x1E || byte_268708160 == 0;
  if (v3 || !*(unsigned char *)(qword_268708158 + a3)) {
    sub_23093EF3C();
  }
  *(unsigned char *)(qword_268708158 + a3) = 0;
}

- (int)_setSamplers:(unsigned int)a3 forAction:(unsigned int)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a4) {
    return -4;
  }
  unsigned int v4 = byte_268708160 ? 32 : 0;
  if (v4 < a4) {
    return -4;
  }
  int v7 = kperf_action_samplers_set();
  v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v9 = [v8 objectForKey:@"XRKPerfMaxFrames"];

  if (v9) {
    int v10 = [v9 intValue];
  }
  else {
    int v10 = 128;
  }
  int v11 = kperf_action_ucallstack_depth_set();
  if (v11)
  {
    int v12 = v11;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109634;
      v14[1] = v10;
      __int16 v15 = 2112;
      v16 = self;
      __int16 v17 = 1024;
      int v18 = v12;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to set the maximum user callstack depth to %u on trigger: %@ - error %d", (uint8_t *)v14, 0x18u);
    }
  }
  if (v7) {
    int v5 = -1;
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (int)_setFilterByPid:(int)a3 forAction:(unsigned int)a4
{
  if (!a4) {
    return -4;
  }
  if (byte_268708160) {
    unsigned int v4 = 32;
  }
  else {
    unsigned int v4 = 0;
  }
  if (v4 < a4) {
    return -4;
  }
  if (kperf_action_filter_set_by_pid()) {
    return -6;
  }
  return 0;
}

- (DTKPCPUCounterAllocator)counterAllocator
{
  return (DTKPCPUCounterAllocator *)[(DTKPTriggerCounterAllocatorProvider *)self->_counterAllocatorProvider counterAllocator];
}

- (DTKPCPUCounterAllocator)queryCounterAllocator
{
  return (DTKPCPUCounterAllocator *)[(DTKPTriggerCounterAllocatorProvider *)self->_counterAllocatorProvider queryCounterAllocator];
}

- (int)addPMCEventNamed:(id)a3 error:(id *)a4
{
  self->_requestsPMCSampling = 1;
  id v6 = a3;
  int v7 = [(DTKPTrigger *)self counterAllocator];
  LODWORD(a4) = [v7 addPMCEventName:v6 error:a4];

  return (int)a4;
}

- (unint64_t)pmcEventCount
{
  unint64_t v2 = [(DTKPTrigger *)self queryCounterAllocator];
  unint64_t v3 = [v2 pmcEventCount];

  return v3;
}

- (unint64_t)triggerKind
{
}

- (const)triggerKindRepr
{
  return off_264B909D8[[(DTKPTrigger *)self triggerKind]];
}

- (unsigned)triggerID
{
  return self->_triggerID;
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
}

- (BOOL)collectUserStacks
{
  return self->_collectUserStacks;
}

- (void)setCollectUserStacks:(BOOL)a3
{
  self->_collectUserStacks = a3;
}

- (BOOL)collectKernelStacks
{
  return self->_collectKernelStacks;
}

- (void)setCollectKernelStacks:(BOOL)a3
{
  self->_collectKernelStacks = a3;
}

- (unsigned)actionID
{
  return self->_actionID;
}

- (void)setActionID:(unsigned int)a3
{
  self->_actionID = a3;
}

- (unsigned)samplers
{
  return self->_samplers;
}

- (void)setSamplers:(unsigned int)a3
{
  self->_samplers = a3;
}

- (OS_dispatch_semaphore)lock
{
  return self->_lock;
}

- (DTKPTriggerCounterAllocatorProvider)counterAllocatorProvider
{
  return self->_counterAllocatorProvider;
}

- (BOOL)requestsPMCSampling
{
  return self->_requestsPMCSampling;
}

- (void).cxx_destruct
{
}

@end