@interface HDHeadphoneExposureNotificationAnalyticsInfo
- (HDHeadphoneExposureNotificationAnalyticsInfo)initWithLastLockDate:(id)a3 lastNotificationDate:(id)a4;
- (id)boundedIntegerForMinutesSinceLastUnlockWithNowDate:(id)a3;
- (id)boundedIntegerForTimeSinceLastNotificationWithNowDate:(id)a3;
@end

@implementation HDHeadphoneExposureNotificationAnalyticsInfo

- (HDHeadphoneExposureNotificationAnalyticsInfo)initWithLastLockDate:(id)a3 lastNotificationDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDHeadphoneExposureNotificationAnalyticsInfo;
  v9 = [(HDHeadphoneExposureNotificationAnalyticsInfo *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastLockDate, a3);
    objc_storeStrong((id *)&v10->_lastNotificationDate, a4);
    v11 = v10;
  }

  return v10;
}

- (id)boundedIntegerForMinutesSinceLastUnlockWithNowDate:(id)a3
{
  lastLockDate = self->_lastLockDate;
  if (lastLockDate)
  {
    [a3 timeIntervalSinceDate:lastLockDate];
    v4 = +[HDAudioAnalyticsUtilities boundedIntegerForLockedDuration:](HDAudioAnalyticsUtilities, "boundedIntegerForLockedDuration:");
  }
  else
  {
    v4 = &unk_26D9E99E8;
  }
  return v4;
}

- (id)boundedIntegerForTimeSinceLastNotificationWithNowDate:(id)a3
{
  lastNotificationDate = self->_lastNotificationDate;
  if (lastNotificationDate)
  {
    [a3 timeIntervalSinceDate:lastNotificationDate];
    v4 = +[HDAudioAnalyticsUtilities boundedIntegerForTimeSinceLastNotification:](HDAudioAnalyticsUtilities, "boundedIntegerForTimeSinceLastNotification:");
  }
  else
  {
    v4 = &unk_26D9E99E8;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNotificationDate, 0);
  objc_storeStrong((id *)&self->_lastLockDate, 0);
}

@end