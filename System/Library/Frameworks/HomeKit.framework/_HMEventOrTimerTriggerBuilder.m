@interface _HMEventOrTimerTriggerBuilder
- (NSArray)recurrences;
- (unint64_t)recurrenceDays;
- (void)setRecurrenceDays:(unint64_t)a3;
- (void)setRecurrences:(id)a3;
- (void)updateRecurrences:(id)a3 completionHandler:(id)a4;
@end

@implementation _HMEventOrTimerTriggerBuilder

- (void)updateRecurrences:(id)a3 completionHandler:(id)a4
{
  BOOL v13 = 0;
  id v6 = a4;
  uint64_t v7 = HMDaysOfTheWeekFromDateComponents(a3, &v13);
  if (v13)
  {
    unint64_t v8 = v7;
    os_unfair_lock_lock_with_options();
    self->_recurrenceDays = v8;
    os_unfair_lock_unlock(&self->super.super._lock);
    v9 = self->super.super._context;
    v10 = [(_HMContext *)v9 delegateCaller];
    [v10 callCompletion:v6 error:0];
  }
  else
  {
    if (self) {
      context = self->super.super._context;
    }
    else {
      context = 0;
    }
    v9 = context;
    v10 = [(_HMContext *)v9 delegateCaller];
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v10 callCompletion:v6 error:v12];

    id v6 = (id)v12;
  }
}

- (void)setRecurrences:(id)a3
{
  id v4 = a3;
  BOOL v9 = 0;
  uint64_t v5 = HMDaysOfTheWeekFromDateComponents(v4, &v9);
  if (v9)
  {
    unint64_t v6 = v5;
    os_unfair_lock_lock_with_options();
    self->_recurrenceDays = v6;
    os_unfair_lock_unlock(&self->super.super._lock);
  }
  else
  {
    uint64_t v7 = (_HMEventOrTimerTriggerBuilder *)_HMFPreconditionFailure();
    [(_HMEventOrTimerTriggerBuilder *)v7 recurrences];
  }
}

- (NSArray)recurrences
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  unint64_t recurrenceDays = self->_recurrenceDays;
  if (recurrenceDays)
  {
    uint64_t v5 = HMDaysOfTheWeekToDateComponents(recurrenceDays);
  }
  else
  {
    uint64_t v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v5;
}

- (void)setRecurrenceDays:(unint64_t)a3
{
  if (a3 - 128 <= 0xFFFFFFFFFFFFFF80)
  {
    uint64_t v7 = (_HMEventOrTimerTriggerBuilder *)_HMFPreconditionFailureWithFormat();
    [(_HMEventOrTimerTriggerBuilder *)v7 recurrenceDays];
  }
  else
  {
    p_lock = &self->super.super._lock;
    os_unfair_lock_lock_with_options();
    if (a3 == 127) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = a3;
    }
    self->_unint64_t recurrenceDays = v6;
    os_unfair_lock_unlock(p_lock);
  }
}

- (unint64_t)recurrenceDays
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  if (self->_recurrenceDays) {
    unint64_t recurrenceDays = self->_recurrenceDays;
  }
  else {
    unint64_t recurrenceDays = 127;
  }
  os_unfair_lock_unlock(p_lock);
  return recurrenceDays;
}

@end