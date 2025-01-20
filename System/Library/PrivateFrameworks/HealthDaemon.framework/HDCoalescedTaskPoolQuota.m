@interface HDCoalescedTaskPoolQuota
- (HDCoalescedTaskPoolQuota)initWithAvailableQuota:(int64_t)a3 maximumQuota:(int64_t)a4 refillInterval:(double)a5 minimumInterval:(double)a6 lastTrigger:(double)a7;
- (double)lastTrigger;
- (double)minimumInterval;
- (double)quotaRefillInterval;
- (double)timeUntilNextAvailableTrigger;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)availableQuota;
- (int64_t)maximumQuota;
- (void)consumeQuota;
@end

@implementation HDCoalescedTaskPoolQuota

- (HDCoalescedTaskPoolQuota)initWithAvailableQuota:(int64_t)a3 maximumQuota:(int64_t)a4 refillInterval:(double)a5 minimumInterval:(double)a6 lastTrigger:(double)a7
{
  if (a5 <= 0.0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDCoalescedTaskPoolQuota.m", 26, @"Invalid parameter not satisfying: %@", @"refillInterval > 0.0" object file lineNumber description];
  }
  if (a4 <= 0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDCoalescedTaskPoolQuota.m", 27, @"Invalid parameter not satisfying: %@", @"maximumQuota > 0" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)HDCoalescedTaskPoolQuota;
  result = [(HDCoalescedTaskPoolQuota *)&v17 init];
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_availableQuotaAfterLastTrigger = a3;
    result->_maximumQuota = a4;
    result->_quotaRefillInterval = a5;
    result->_minimumInterval = a6;
    result->_lastTrigger = a7;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HDCoalescedTaskPoolQuota alloc];
  int64_t availableQuotaAfterLastTrigger = self->_availableQuotaAfterLastTrigger;
  int64_t maximumQuota = self->_maximumQuota;
  double quotaRefillInterval = self->_quotaRefillInterval;
  double minimumInterval = self->_minimumInterval;
  double lastTrigger = self->_lastTrigger;

  return [(HDCoalescedTaskPoolQuota *)v4 initWithAvailableQuota:availableQuotaAfterLastTrigger maximumQuota:maximumQuota refillInterval:quotaRefillInterval minimumInterval:minimumInterval lastTrigger:lastTrigger];
}

- (int64_t)availableQuota
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent() - self->_lastTrigger;
  os_unfair_lock_unlock(p_lock);
  double v5 = v4 / self->_quotaRefillInterval;
  int64_t availableQuotaAfterLastTrigger = self->_availableQuotaAfterLastTrigger;
  if (self->_maximumQuota >= ((uint64_t)v5 & ~((uint64_t)v5 >> 63)) + availableQuotaAfterLastTrigger) {
    return ((uint64_t)v5 & ~((uint64_t)v5 >> 63)) + availableQuotaAfterLastTrigger;
  }
  else {
    return self->_maximumQuota;
  }
}

- (void)consumeQuota
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double Current = CFAbsoluteTimeGetCurrent();
  double v5 = (Current - self->_lastTrigger) / self->_quotaRefillInterval;
  self->_double lastTrigger = Current;
  int64_t maximumQuota = self->_availableQuotaAfterLastTrigger + ((uint64_t)v5 & ~((uint64_t)v5 >> 63));
  if (self->_maximumQuota < maximumQuota) {
    int64_t maximumQuota = self->_maximumQuota;
  }
  if (maximumQuota <= 1) {
    int64_t maximumQuota = 1;
  }
  self->_int64_t availableQuotaAfterLastTrigger = maximumQuota - 1;

  os_unfair_lock_unlock(p_lock);
}

- (double)timeUntilNextAvailableTrigger
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = CFAbsoluteTimeGetCurrent() - self->_lastTrigger;
  double v5 = 0.0;
  if (self->_availableQuotaAfterLastTrigger <= 0) {
    double v5 = self->_quotaRefillInterval - v4;
  }
  double v6 = self->_minimumInterval - v4;
  os_unfair_lock_unlock(p_lock);
  if (v6 >= v5) {
    double v7 = v6;
  }
  else {
    double v7 = v5;
  }
  return fmax(v7, 0.0);
}

- (int64_t)maximumQuota
{
  return self->_maximumQuota;
}

- (double)quotaRefillInterval
{
  return self->_quotaRefillInterval;
}

- (double)minimumInterval
{
  return self->_minimumInterval;
}

- (double)lastTrigger
{
  return self->_lastTrigger;
}

@end