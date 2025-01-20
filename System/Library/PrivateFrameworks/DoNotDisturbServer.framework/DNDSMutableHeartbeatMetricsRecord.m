@interface DNDSMutableHeartbeatMetricsRecord
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabledAtLocation:(BOOL)a3;
- (void)setEnabledDrivingMode:(BOOL)a3;
- (void)setEnabledDuringEvent:(BOOL)a3;
- (void)setEnabledForOneHour:(BOOL)a3;
- (void)setEnabledFromControlCenterPhone:(BOOL)a3;
- (void)setEnabledFromControlCenterWatch:(BOOL)a3;
- (void)setEnabledSleepMode:(BOOL)a3;
- (void)setEnabledUntilEvening:(BOOL)a3;
- (void)setEnabledUntilMorning:(BOOL)a3;
- (void)setManuallyEnabled:(BOOL)a3;
- (void)setNumberOfManualSessions:(id)a3;
- (void)setNumberOfSessions:(id)a3;
@end

@implementation DNDSMutableHeartbeatMetricsRecord

- (void)setEnabled:(BOOL)a3
{
  self->super._enabled = a3;
}

- (void)setManuallyEnabled:(BOOL)a3
{
  self->super._manuallyEnabled = a3;
}

- (void)setNumberOfSessions:(id)a3
{
  v4 = (NSNumber *)[a3 copy];
  numberOfSessions = self->super._numberOfSessions;
  self->super._numberOfSessions = v4;
  MEMORY[0x1F41817F8](v4, numberOfSessions);
}

- (void)setNumberOfManualSessions:(id)a3
{
  v4 = (NSNumber *)[a3 copy];
  numberOfManualSessions = self->super._numberOfManualSessions;
  self->super._numberOfManualSessions = v4;
  MEMORY[0x1F41817F8](v4, numberOfManualSessions);
}

- (void)setEnabledFromControlCenterPhone:(BOOL)a3
{
  self->super._enabledFromControlCenterPhone = a3;
}

- (void)setEnabledFromControlCenterWatch:(BOOL)a3
{
  self->super._enabledFromControlCenterWatch = a3;
}

- (void)setEnabledForOneHour:(BOOL)a3
{
  self->super._enabledForOneHour = a3;
}

- (void)setEnabledUntilEvening:(BOOL)a3
{
  self->super._enabledUntilEvening = a3;
}

- (void)setEnabledUntilMorning:(BOOL)a3
{
  self->super._enabledUntilMorning = a3;
}

- (void)setEnabledAtLocation:(BOOL)a3
{
  self->super._enabledAtLocation = a3;
}

- (void)setEnabledDuringEvent:(BOOL)a3
{
  self->super._enabledDuringEvent = a3;
}

- (void)setEnabledDrivingMode:(BOOL)a3
{
  self->super._enabledDrivingMode = a3;
}

- (void)setEnabledSleepMode:(BOOL)a3
{
  self->super._enabledSleepMode = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDSHeartbeatMetricsRecord alloc];
  return [(DNDSHeartbeatMetricsRecord *)v4 _initWithRecord:self];
}

@end