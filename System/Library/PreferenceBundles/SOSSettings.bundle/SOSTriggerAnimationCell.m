@interface SOSTriggerAnimationCell
- (SOSTriggerAnimationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)dealloc;
- (void)loadTriggerImageViewWithCompletion:(id)a3;
- (void)updateAssets;
@end

@implementation SOSTriggerAnimationCell

- (SOSTriggerAnimationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SOSTriggerAnimationCell;
  v5 = [(SOSSettingsAssetCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    [(SOSTriggerAnimationCell *)v5 loadTriggerImageViewWithCompletion:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_36B8, @"SOSTriggerMechanismChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v6;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)SOSTriggerAnimationCell;
  [(SOSTriggerAnimationCell *)&v4 dealloc];
}

- (void)loadTriggerImageViewWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_37AC;
  v4[3] = &unk_188B0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[SOSUtilities getAssetViewForPhoneWithCompletion:v4];
}

- (void)updateAssets
{
  if ((+[SOSUtilities canTriggerSOSWithVolumeLockHold] & 1) == 0)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_3910;
    v4[3] = &unk_188D8;
    v4[4] = self;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_3928;
    v3[3] = &unk_18928;
    v3[4] = self;
    +[UIView animateWithDuration:v4 animations:v3 completion:0.25];
  }
}

@end