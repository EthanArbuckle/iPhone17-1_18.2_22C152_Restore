@interface AlertDeliveryTypeDescriptor
- (int64_t)bannerSetting;
- (int64_t)lockScreenSetting;
- (int64_t)notificationCenterSetting;
- (void)setBannerSetting:(int64_t)a3;
- (void)setLockScreenSetting:(int64_t)a3;
- (void)setNotificationCenterSetting:(int64_t)a3;
@end

@implementation AlertDeliveryTypeDescriptor

- (int64_t)lockScreenSetting
{
  return self->_lockScreenSetting;
}

- (void)setLockScreenSetting:(int64_t)a3
{
  self->_lockScreenSetting = a3;
}

- (int64_t)notificationCenterSetting
{
  return self->_notificationCenterSetting;
}

- (void)setNotificationCenterSetting:(int64_t)a3
{
  self->_notificationCenterSetting = a3;
}

- (int64_t)bannerSetting
{
  return self->_bannerSetting;
}

- (void)setBannerSetting:(int64_t)a3
{
  self->_bannerSetting = a3;
}

@end