@interface HDSleepPeriodInfo
- (HDSleepPeriodInfo)initWithUserSetSchedules:(id)a3;
- (NSArray)userSetSchedules;
@end

@implementation HDSleepPeriodInfo

- (HDSleepPeriodInfo)initWithUserSetSchedules:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSleepPeriodInfo;
  v5 = [(HDSleepPeriodInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    userSetSchedules = v5->_userSetSchedules;
    v5->_userSetSchedules = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)userSetSchedules
{
  return self->_userSetSchedules;
}

- (void).cxx_destruct
{
}

@end