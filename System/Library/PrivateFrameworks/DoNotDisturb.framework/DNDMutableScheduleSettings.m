@interface DNDMutableScheduleSettings
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBedtimeBehaviorEnabledSetting:(unint64_t)a3;
- (void)setScheduleEnabledSetting:(unint64_t)a3;
- (void)setTimePeriod:(id)a3;
@end

@implementation DNDMutableScheduleSettings

- (void)setScheduleEnabledSetting:(unint64_t)a3
{
  self->super._scheduleEnabledSetting = a3;
}

- (void)setTimePeriod:(id)a3
{
  if (a3) {
    v4 = (DNDScheduleTimePeriod *)[a3 copy];
  }
  else {
    v4 = objc_alloc_init(DNDScheduleTimePeriod);
  }
  timePeriod = self->super._timePeriod;
  self->super._timePeriod = v4;
  MEMORY[0x1F41817F8](v4, timePeriod);
}

- (void)setBedtimeBehaviorEnabledSetting:(unint64_t)a3
{
  self->super._bedtimeBehaviorEnabledSetting = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDScheduleSettings alloc];
  return [(DNDScheduleSettings *)v4 _initWithSettings:self];
}

@end