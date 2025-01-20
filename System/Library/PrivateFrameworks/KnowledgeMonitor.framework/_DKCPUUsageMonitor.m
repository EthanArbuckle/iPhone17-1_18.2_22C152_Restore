@interface _DKCPUUsageMonitor
+ (id)entitlements;
+ (id)eventStream;
- (BOOL)updateCPUUsagePercentage:(unint64_t *)a3;
- (OS_dispatch_source)timer;
- (id)loadState;
- (unint64_t)getCPUUsageLevelFromPercentage:(unint64_t)a3;
- (unint64_t)getCurrentCPUUsageLevel;
- (unint64_t)lastCPUUsageLevel;
- (unint64_t)lastIdleTick;
- (unint64_t)lastSysTick;
- (unint64_t)lastUserTick;
- (void)getCPUTicksForUser:(unint64_t *)a3 system:(unint64_t *)a4 idle:(unint64_t *)a5;
- (void)setCurrentCPUUsageLevel:(unint64_t)a3;
- (void)setLastCPUUsageLevel:(unint64_t)a3;
- (void)setLastIdleTick:(unint64_t)a3;
- (void)setLastSysTick:(unint64_t)a3;
- (void)setLastUserTick:(unint64_t)a3;
- (void)setTimer:(id)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
@end

@implementation _DKCPUUsageMonitor

- (unint64_t)getCurrentCPUUsageLevel
{
  uint64_t v5 = 0;
  unint64_t lastCPUUsageLevel = self->_lastCPUUsageLevel;
  if ([(_DKCPUUsageMonitor *)self updateCPUUsagePercentage:&v5]) {
    return [(_DKCPUUsageMonitor *)self getCPUUsageLevelFromPercentage:v5];
  }
  return lastCPUUsageLevel;
}

- (BOOL)updateCPUUsagePercentage:(unint64_t *)a3
{
  unint64_t lastUserTick = self->_lastUserTick;
  unint64_t lastSysTick = self->_lastSysTick;
  unint64_t v18 = lastUserTick;
  unint64_t lastIdleTick = self->_lastIdleTick;
  [(_DKCPUUsageMonitor *)self getCPUTicksForUser:&v18 system:&lastSysTick idle:&lastIdleTick];
  unint64_t v6 = self->_lastUserTick;
  unint64_t v7 = self->_lastSysTick;
  unint64_t v8 = self->_lastIdleTick;
  unint64_t v9 = v18 - v6;
  BOOL v11 = v18 == v6 && lastSysTick == v7 && lastIdleTick == v8;
  char v12 = v11;
  if (!v11)
  {
    unint64_t v13 = lastIdleTick - v8;
    unint64_t v14 = lastSysTick - v7;
    *a3 = (unint64_t)((double)(v14 + v9) / (double)(v13 + v14 + v9) * 100.0);
    self->_lastUserTick += v9;
    self->_lastSysTick += v14;
    self->_lastIdleTick += v13;
  }
  return v12 ^ 1;
}

- (unint64_t)getCPUUsageLevelFromPercentage:(unint64_t)a3
{
  unint64_t v3 = 90;
  uint64_t v4 = 75;
  uint64_t v5 = 50;
  if (a3 <= 0x32) {
    uint64_t v5 = 0;
  }
  if (a3 <= 0x4B) {
    uint64_t v4 = v5;
  }
  if (a3 <= 0x5A) {
    unint64_t v3 = v4;
  }
  if (a3 <= 0x5F) {
    return v3;
  }
  else {
    return 95;
  }
}

- (void)getCPUTicksForUser:(unint64_t *)a3 system:(unint64_t *)a4 idle:(unint64_t *)a5
{
  *(void *)host_info_out = 0;
  uint64_t v13 = 0;
  mach_msg_type_number_t host_info_outCnt = 4;
  host_t v8 = MEMORY[0x22A629A00](self, a2);
  if (!host_statistics(v8, 3, host_info_out, &host_info_outCnt))
  {
    unint64_t v9 = host_info_out[1];
    unint64_t v10 = v13;
    *a3 = (HIDWORD(v13) + host_info_out[0]);
    *a4 = v9;
    *a5 = v10;
  }
}

- (void)setCurrentCPUUsageLevel:(unint64_t)a3
{
  if (self->_lastCPUUsageLevel != a3)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    unint64_t v6 = [MEMORY[0x263F351B8] userContext];
    unint64_t v7 = [MEMORY[0x263F351D0] keyPathForCPUUsageLevel];
    [v6 setObject:v5 forKeyedSubscript:v7];

    self->_unint64_t lastCPUUsageLevel = a3;
  }
}

+ (id)eventStream
{
  return @"CPUUsageLevel";
}

+ (id)entitlements
{
  return 0;
}

- (id)loadState
{
  return 0;
}

- (void)start
{
  v5.receiver = self;
  v5.super_class = (Class)_DKCPUUsageMonitor;
  if ([(_DKMonitor *)&v5 instantMonitorNeedsActivation])
  {
    unint64_t v3 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __27___DKCPUUsageMonitor_start__block_invoke;
    block[3] = &unk_264714788;
    block[4] = self;
    dispatch_sync(v3, block);
  }
}

- (void)stop
{
  v4.receiver = self;
  v4.super_class = (Class)_DKCPUUsageMonitor;
  if ([(_DKMonitor *)&v4 instantMonitorNeedsDeactivation])
  {
    timer = self->_timer;
    if (timer) {
      dispatch_suspend(timer);
    }
  }
}

- (void)synchronouslyReflectCurrentValue
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (unint64_t)lastUserTick
{
  return self->_lastUserTick;
}

- (void)setLastUserTick:(unint64_t)a3
{
  self->_unint64_t lastUserTick = a3;
}

- (unint64_t)lastIdleTick
{
  return self->_lastIdleTick;
}

- (void)setLastIdleTick:(unint64_t)a3
{
  self->_unint64_t lastIdleTick = a3;
}

- (unint64_t)lastSysTick
{
  return self->_lastSysTick;
}

- (void)setLastSysTick:(unint64_t)a3
{
  self->_unint64_t lastSysTick = a3;
}

- (unint64_t)lastCPUUsageLevel
{
  return self->_lastCPUUsageLevel;
}

- (void)setLastCPUUsageLevel:(unint64_t)a3
{
  self->_unint64_t lastCPUUsageLevel = a3;
}

- (void).cxx_destruct
{
}

@end