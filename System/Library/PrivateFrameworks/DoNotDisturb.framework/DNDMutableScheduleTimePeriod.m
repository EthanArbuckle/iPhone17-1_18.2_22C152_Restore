@interface DNDMutableScheduleTimePeriod
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setWeekdays:(unint64_t)a3;
@end

@implementation DNDMutableScheduleTimePeriod

- (void)setStartTime:(id)a3
{
  if (a3)
  {
    v4 = (DNDScheduleTime *)[a3 copy];
  }
  else
  {
    v4 = +[DNDScheduleTime defaultStartTime];
  }
  startTime = self->super._startTime;
  self->super._startTime = v4;
  MEMORY[0x1F41817F8](v4, startTime);
}

- (void)setEndTime:(id)a3
{
  if (a3)
  {
    v4 = (DNDScheduleTime *)[a3 copy];
  }
  else
  {
    v4 = +[DNDScheduleTime defaultEndTime];
  }
  endTime = self->super._endTime;
  self->super._endTime = v4;
  MEMORY[0x1F41817F8](v4, endTime);
}

- (void)setWeekdays:(unint64_t)a3
{
  self->super._weekdays = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDScheduleTimePeriod alloc];
  return [(DNDScheduleTimePeriod *)v4 _initWithPeriod:self];
}

@end