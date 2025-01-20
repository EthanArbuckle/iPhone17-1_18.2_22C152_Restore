@interface FSTaskProgressUpdater
+ (id)progressUpdaterWithProgress:(id)a3;
- (FSTaskProgressUpdater)initWithProgress:(id)a3;
- (NSProgress)childProgress;
- (NSProgress)parentProgress;
- (OS_dispatch_source)timerSource;
- (id)startPhase:(id)a3 parentUnitCount:(int64_t)a4 phaseTotalCount:(int64_t)a5 completedCounter:(const unsigned int *)a6;
- (void)dealloc;
- (void)endPhase:(id)a3;
- (void)setChildProgress:(id)a3;
- (void)setParentProgress:(id)a3;
- (void)setTimerSource:(id)a3;
@end

@implementation FSTaskProgressUpdater

- (FSTaskProgressUpdater)initWithProgress:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FSTaskProgressUpdater;
  v6 = [(FSTaskProgressUpdater *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parentProgress, a3);
    timerSource = v7->_timerSource;
    v7->_timerSource = 0;

    childProgress = v7->_childProgress;
    v7->_childProgress = 0;
  }
  return v7;
}

+ (id)progressUpdaterWithProgress:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithProgress:v4];

  return v5;
}

- (id)startPhase:(id)a3 parentUnitCount:(int64_t)a4 phaseTotalCount:(int64_t)a5 completedCounter:(const unsigned int *)a6
{
  if (self->_childProgress)
  {
    v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[FSTaskProgressUpdater startPhase:parentUnitCount:phaseTotalCount:completedCounter:]((uint64_t)self, v7);
    }

    v8 = fs_errorForPOSIXError(22);
  }
  else
  {
    [(NSProgress *)self->_parentProgress setLocalizedDescription:a3];
    v12 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:a5];
    childProgress = self->_childProgress;
    self->_childProgress = v12;

    [(NSProgress *)self->_parentProgress addChild:self->_childProgress withPendingUnitCount:a4];
    v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, 0);
    timerSource = self->_timerSource;
    self->_timerSource = v14;

    v16 = self->_timerSource;
    if (v16)
    {
      dispatch_time_t v17 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v16, v17, 0x3B9ACA00uLL, 0x5F5E100uLL);
      v18 = [(FSTaskProgressUpdater *)self childProgress];
      v19 = self->_timerSource;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __85__FSTaskProgressUpdater_startPhase_parentUnitCount_phaseTotalCount_completedCounter___block_invoke;
      v22[3] = &unk_26530B4F8;
      id v23 = v18;
      v24 = a6;
      id v20 = v18;
      dispatch_source_set_event_handler(v19, v22);
      dispatch_resume((dispatch_object_t)self->_timerSource);
    }
    v8 = 0;
  }
  return v8;
}

uint64_t __85__FSTaskProgressUpdater_startPhase_parentUnitCount_phaseTotalCount_completedCounter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCompletedUnitCount:**(unsigned int **)(a1 + 40)];
}

- (void)endPhase:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_childProgress)
  {
    timerSource = self->_timerSource;
    id v9 = v5;
    if (timerSource)
    {
      dispatch_source_cancel(timerSource);
      v7 = self->_timerSource;
      self->_timerSource = 0;
    }
    [(NSProgress *)self->_parentProgress setLocalizedDescription:v9];
    [(NSProgress *)self->_childProgress setCompletedUnitCount:[(NSProgress *)self->_childProgress totalUnitCount]];
    childProgress = self->_childProgress;
    self->_childProgress = 0;

    id v5 = v9;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)dealloc
{
  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    id v4 = self->_timerSource;
    self->_timerSource = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)FSTaskProgressUpdater;
  [(FSTaskProgressUpdater *)&v5 dealloc];
}

- (NSProgress)parentProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParentProgress:(id)a3
{
}

- (NSProgress)childProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 16, 1);
}

- (void)setChildProgress:(id)a3
{
}

- (OS_dispatch_source)timerSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTimerSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_childProgress, 0);
  objc_storeStrong((id *)&self->_parentProgress, 0);
}

- (void)startPhase:(uint64_t)a1 parentUnitCount:(NSObject *)a2 phaseTotalCount:completedCounter:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [*(id *)(a1 + 8) localizedDescription];
  int v4 = 136315394;
  objc_super v5 = "-[FSTaskProgressUpdater startPhase:parentUnitCount:phaseTotalCount:completedCounter:]";
  __int16 v6 = 2112;
  v7 = v3;
  _os_log_fault_impl(&dword_24DDB2000, a2, OS_LOG_TYPE_FAULT, "%s missing endPhase call for %@", (uint8_t *)&v4, 0x16u);
}

@end