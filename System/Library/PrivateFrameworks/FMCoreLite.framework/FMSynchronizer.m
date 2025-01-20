@interface FMSynchronizer
- (BOOL)timeoutOccurred;
- (FMSynchronizer)initWithDescription:(id)a3 andTimeout:(double)a4;
- (NSString)info;
- (OS_dispatch_semaphore)sem;
- (double)timeout;
- (void)setInfo:(id)a3;
- (void)setSem:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimeoutOccurred:(BOOL)a3;
- (void)signal;
- (void)wait;
@end

@implementation FMSynchronizer

- (FMSynchronizer)initWithDescription:(id)a3 andTimeout:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FMSynchronizer;
  v8 = [(FMSynchronizer *)&v13 init];
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
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 info];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1B2FB9000, a2, OS_LOG_TYPE_DEBUG, "Signaling end of wait for %@", (uint8_t *)&v4, 0xCu);
}

- (void)wait
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(FMSynchronizer *)self timeout];
  if (v5 == -1.0)
  {
    dispatch_time_t v7 = -1;
  }
  else
  {
    [(FMSynchronizer *)self timeout];
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  }
  v8 = [(FMSynchronizer *)self sem];
  intptr_t v9 = dispatch_semaphore_wait(v8, v7);

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v11 = v10;
  if (v9) {
    [(FMSynchronizer *)self setTimeoutOccurred:1];
  }
  v12 = LogCategory_FMSynchronizer();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_super v13 = [(FMSynchronizer *)self info];
    BOOL v14 = [(FMSynchronizer *)self timeoutOccurred];
    v15 = @"replied";
    int v16 = 134218498;
    double v17 = v11 - v4;
    __int16 v18 = 2112;
    if (v14) {
      v15 = @"timed out";
    }
    v19 = v13;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_debug_impl(&dword_1B2FB9000, v12, OS_LOG_TYPE_DEBUG, "Done waiting (%f seconds) for %@. Status: %@", (uint8_t *)&v16, 0x20u);
  }
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

- (NSString)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (OS_dispatch_semaphore)sem
{
  return self->_sem;
}

- (void)setSem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end