@interface DNDMutableScheduleTime
- (id)copyWithZone:(_NSZone *)a3;
- (void)setHour:(unint64_t)a3;
- (void)setMinute:(unint64_t)a3;
@end

@implementation DNDMutableScheduleTime

- (void)setHour:(unint64_t)a3
{
  self->super._hour = a3 % 0x18;
}

- (void)setMinute:(unint64_t)a3
{
  self->super._minute = a3 % 0x3C;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDScheduleTime alloc];
  return [(DNDScheduleTime *)v4 _initWithTime:self];
}

@end