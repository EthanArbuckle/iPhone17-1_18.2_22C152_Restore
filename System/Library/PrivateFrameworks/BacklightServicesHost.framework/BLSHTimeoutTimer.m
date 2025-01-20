@interface BLSHTimeoutTimer
- (BOOL)reactivateIfPossible;
- (void)reactivateIfPossible;
- (void)restartTimer;
- (void)timerFired;
@end

@implementation BLSHTimeoutTimer

- (BOOL)reactivateIfPossible
{
  v3 = bls_assertions_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(BLSHTimeoutTimer *)self reactivateIfPossible];
  }

  [(BLSHTimeoutTimer *)self restartTimer];
  return 1;
}

- (void)timerFired
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = [(BLSHAssertionAttributeTimer *)self service];
  v4 = [(BLSHAssertionAttributeTimer *)self assertion];
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F29920];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = @"timeout duration expired";
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8 = [v5 errorWithDomain:v6 code:11 userInfo:v7];
  [v3 cancelAssertion:v4 withError:v8];

  [(BLSHAssertionAttributeTimer *)self cancel];
}

- (void)restartTimer
{
  [(BLSHAssertionAttributeTimer *)self cancel];

  -[BLSHAssertionAttributeTimer startTimer]((uint64_t)self);
}

- (void)reactivateIfPossible
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = [a1 attribute];
  v5 = [a1 assertion];
  int v6 = 134218754;
  v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  v11 = v4;
  __int16 v12 = 2112;
  v13 = v5;
  _os_log_debug_impl(&dword_21FCFC000, a2, OS_LOG_TYPE_DEBUG, "%p will restart timer:%{public}@ for attribute:%{pubic}@ assertion:%{pubic}@", (uint8_t *)&v6, 0x2Au);
}

@end