@interface HDAudioAnalyticsNoiseSettingsResult
- (BOOL)hasNoiseEnabled;
- (BOOL)hasNoiseNotificationsEnabled;
- (BOOL)hasWatchPairedWithNoiseApp;
- (HDAudioAnalyticsNoiseSettingsResult)initWithWatchPairedWithNoiseApp:(BOOL)a3 hasNoiseEnabled:(BOOL)a4 hasNoiseNotificationsEnabled:(BOOL)a5 noiseThreshold:(id)a6;
- (NSNumber)noiseThreshold;
- (void)setHasNoiseEnabled:(BOOL)a3;
- (void)setHasNoiseNotificationsEnabled:(BOOL)a3;
- (void)setHasWatchPairedWithNoiseApp:(BOOL)a3;
@end

@implementation HDAudioAnalyticsNoiseSettingsResult

- (HDAudioAnalyticsNoiseSettingsResult)initWithWatchPairedWithNoiseApp:(BOOL)a3 hasNoiseEnabled:(BOOL)a4 hasNoiseNotificationsEnabled:(BOOL)a5 noiseThreshold:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDAudioAnalyticsNoiseSettingsResult;
  v11 = [(HDAudioAnalyticsNoiseSettingsResult *)&v17 init];
  v12 = v11;
  if (v11)
  {
    [(HDAudioAnalyticsNoiseSettingsResult *)v11 setHasWatchPairedWithNoiseApp:v8];
    [(HDAudioAnalyticsNoiseSettingsResult *)v12 setHasNoiseEnabled:v7];
    [(HDAudioAnalyticsNoiseSettingsResult *)v12 setHasNoiseNotificationsEnabled:v6];
    if (v6)
    {
      v13 = (NSNumber *)v10;
    }
    else
    {
      v13 = [NSNumber numberWithInt:0];
    }
    noiseThreshold = v12->_noiseThreshold;
    v12->_noiseThreshold = v13;

    v15 = v12;
  }

  return v12;
}

- (BOOL)hasWatchPairedWithNoiseApp
{
  return self->_hasWatchPairedWithNoiseApp;
}

- (void)setHasWatchPairedWithNoiseApp:(BOOL)a3
{
  self->_hasWatchPairedWithNoiseApp = a3;
}

- (BOOL)hasNoiseEnabled
{
  return self->_hasNoiseEnabled;
}

- (void)setHasNoiseEnabled:(BOOL)a3
{
  self->_hasNoiseEnabled = a3;
}

- (BOOL)hasNoiseNotificationsEnabled
{
  return self->_hasNoiseNotificationsEnabled;
}

- (void)setHasNoiseNotificationsEnabled:(BOOL)a3
{
  self->_hasNoiseNotificationsEnabled = a3;
}

- (NSNumber)noiseThreshold
{
  return self->_noiseThreshold;
}

- (void).cxx_destruct
{
}

@end