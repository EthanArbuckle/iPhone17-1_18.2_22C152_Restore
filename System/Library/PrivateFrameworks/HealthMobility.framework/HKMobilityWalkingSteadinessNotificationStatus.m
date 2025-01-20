@interface HKMobilityWalkingSteadinessNotificationStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)fitnessTrackingEnabled;
- (BOOL)healthNotificationsDisabled;
- (BOOL)isEqual:(id)a3;
- (HKMobilityWalkingSteadinessNotificationStatus)initWithCoder:(id)a3;
- (HKMobilityWalkingSteadinessNotificationStatus)initWithState:(int64_t)a3 unavailableReasons:(int64_t)a4 fitnessTrackingEnabled:(BOOL)a5 healthNotificationsDisabled:(BOOL)a6;
- (int64_t)notificationUnavailableReasons;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMobilityWalkingSteadinessNotificationStatus

- (HKMobilityWalkingSteadinessNotificationStatus)initWithState:(int64_t)a3 unavailableReasons:(int64_t)a4 fitnessTrackingEnabled:(BOOL)a5 healthNotificationsDisabled:(BOOL)a6
{
  v14.receiver = self;
  v14.super_class = (Class)HKMobilityWalkingSteadinessNotificationStatus;
  v10 = [(HKMobilityWalkingSteadinessNotificationStatus *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_state = a3;
    v10->_notificationUnavailableReasons = a4;
    v10->_fitnessTrackingEnabled = a5;
    v10->_healthNotificationsDisabled = a6;
    v12 = v10;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKMobilityWalkingSteadinessNotificationStatus *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = self->_state == v5->_state
        && self->_notificationUnavailableReasons == v5->_notificationUnavailableReasons
        && self->_fitnessTrackingEnabled == v5->_fitnessTrackingEnabled
        && self->_healthNotificationsDisabled == v5->_healthNotificationsDisabled;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t v3 = self->_notificationUnavailableReasons ^ self->_state;
  v4 = [NSNumber numberWithBool:self->_fitnessTrackingEnabled];
  uint64_t v5 = v3 ^ [v4 hash];
  BOOL v6 = [NSNumber numberWithBool:self->_healthNotificationsDisabled];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInteger:state forKey:@"State"];
  [v5 encodeInteger:self->_notificationUnavailableReasons forKey:@"NotificationUnavailableReasons"];
  [v5 encodeBool:self->_fitnessTrackingEnabled forKey:@"FitnessTrackingEnabled"];
  [v5 encodeBool:self->_healthNotificationsDisabled forKey:@"HealthNotificationsDisabled"];
}

- (HKMobilityWalkingSteadinessNotificationStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKMobilityWalkingSteadinessNotificationStatus;
  id v5 = [(HKMobilityWalkingSteadinessNotificationStatus *)&v7 init];
  if (v5)
  {
    v5->_int64_t state = [v4 decodeIntegerForKey:@"State"];
    v5->_notificationUnavailableReasons = [v4 decodeIntegerForKey:@"NotificationUnavailableReasons"];
    v5->_fitnessTrackingEnabled = [v4 decodeBoolForKey:@"FitnessTrackingEnabled"];
    v5->_healthNotificationsDisabled = [v4 decodeBoolForKey:@"HealthNotificationsDisabled"];
  }

  return v5;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)notificationUnavailableReasons
{
  return self->_notificationUnavailableReasons;
}

- (BOOL)fitnessTrackingEnabled
{
  return self->_fitnessTrackingEnabled;
}

- (BOOL)healthNotificationsDisabled
{
  return self->_healthNotificationsDisabled;
}

@end