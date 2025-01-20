@interface FMFSynchronizer
- (BOOL)timeoutOccurred;
- (FMFSynchronizer)initWithDescription:(id)a3 andTimeout:(double)a4;
- (NSString)info;
- (OS_dispatch_semaphore)sem;
- (double)timeout;
- (id)loggingID;
- (void)setInfo:(id)a3;
- (void)setSem:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutOccurred:(BOOL)a3;
- (void)signal;
- (void)wait;
@end

@implementation FMFSynchronizer

- (FMFSynchronizer)initWithDescription:(id)a3 andTimeout:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMFSynchronizer;
  v8 = [(FMFSynchronizer *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_info, a3);
    v9->_timeout = a4;
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    sem = v9->_sem;
    v9->_sem = (OS_dispatch_semaphore *)v10;
  }
  return v9;
}

- (void)signal
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(FMFSynchronizer *)self sem];
  dispatch_semaphore_signal(v3);

  v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(FMFSynchronizer *)self info];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_DEFAULT, "Signaling end of wait for %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)wait
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(FMFSynchronizer *)self timeout];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  id v7 = [(FMFSynchronizer *)self sem];
  intptr_t v8 = dispatch_semaphore_wait(v7, v6);

  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v10 = v9;
  v11 = LogCategory_Daemon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(FMFSynchronizer *)self info];
    objc_super v13 = (void *)v12;
    v14 = @"timed out";
    int v15 = 134218498;
    double v16 = v10 - v4;
    __int16 v17 = 2112;
    if (!v8) {
      v14 = @"replied";
    }
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_20AD87000, v11, OS_LOG_TYPE_DEFAULT, "Done waiting (%f seconds) for %@. Status: %@", (uint8_t *)&v15, 0x20u);
  }
}

- (id)loggingID
{
  double v3 = NSString;
  double v4 = [(FMFSynchronizer *)self info];
  double v5 = [v3 stringWithFormat:@"%@-%@(0x%X)", v4, objc_opt_class(), self];

  return v5;
}

- (BOOL)timeoutOccurred
{
  return self->_timeoutOccurred;
}

- (void)setTimeoutOccurred:(BOOL)a3
{
  self->_timeoutOccurred = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (OS_dispatch_semaphore)sem
{
  return self->_sem;
}

- (void)setSem:(id)a3
{
}

- (NSString)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_sem, 0);
}

@end