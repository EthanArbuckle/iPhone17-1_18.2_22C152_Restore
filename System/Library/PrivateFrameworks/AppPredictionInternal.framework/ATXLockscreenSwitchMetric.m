@interface ATXLockscreenSwitchMetric
- (NSString)lockscreenId;
- (NSString)outcome;
- (NSString)switchMechanism;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (int64_t)duration;
- (void)setDuration:(int64_t)a3;
- (void)setLockscreenId:(id)a3;
- (void)setOutcome:(id)a3;
- (void)setSwitchMechanism:(id)a3;
@end

@implementation ATXLockscreenSwitchMetric

- (id)metricName
{
  return @"com.apple.Proactive.Lockscreen.Switch";
}

- (id)coreAnalyticsDictionary
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"lockscreenId";
  v3 = [(ATXLockscreenSwitchMetric *)self lockscreenId];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"switchMechanism";
  v5 = [(ATXLockscreenSwitchMetric *)self switchMechanism];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v6;
  v12[2] = @"outcome";
  v7 = [(ATXLockscreenSwitchMetric *)self outcome];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v8;
  v12[3] = @"duration";
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXLockscreenSwitchMetric duration](self, "duration"));
  v13[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  if (!v7) {
  if (!v5)
  }

  if (!v3) {
  return v10;
  }
}

- (NSString)lockscreenId
{
  return self->_lockscreenId;
}

- (void)setLockscreenId:(id)a3
{
}

- (NSString)switchMechanism
{
  return self->_switchMechanism;
}

- (void)setSwitchMechanism:(id)a3
{
}

- (NSString)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(id)a3
{
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_switchMechanism, 0);
  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end