@interface HKHRIrregularRhythmNotificationsBridgeSettings
- (BOOL)areNotificationsOn;
- (BOOL)isSettingHidden;
- (BOOL)isUserInteractionEnabled;
- (BOOL)shouldLinkToOnboarding;
- (HKHRIrregularRhythmNotificationsBridgeFooter)footer;
- (HKHRIrregularRhythmNotificationsBridgeSettings)initWithSettingHidden:(BOOL)a3 notificationsOn:(BOOL)a4 shouldLinkToOnboarding:(BOOL)a5 userInteractionEnabled:(BOOL)a6 headerText:(id)a7 footer:(id)a8;
- (NSString)headerText;
@end

@implementation HKHRIrregularRhythmNotificationsBridgeSettings

- (HKHRIrregularRhythmNotificationsBridgeSettings)initWithSettingHidden:(BOOL)a3 notificationsOn:(BOOL)a4 shouldLinkToOnboarding:(BOOL)a5 userInteractionEnabled:(BOOL)a6 headerText:(id)a7 footer:(id)a8
{
  id v14 = a7;
  id v15 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HKHRIrregularRhythmNotificationsBridgeSettings;
  v16 = [(HKHRIrregularRhythmNotificationsBridgeSettings *)&v23 init];
  v17 = v16;
  if (v16)
  {
    v16->_isSettingHidden = a3;
    v16->_areNotificationsOn = a4;
    v16->_shouldLinkToOnboarding = a5;
    v16->_isUserInteractionEnabled = a6;
    uint64_t v18 = [v14 copy];
    headerText = v17->_headerText;
    v17->_headerText = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    footer = v17->_footer;
    v17->_footer = (HKHRIrregularRhythmNotificationsBridgeFooter *)v20;
  }
  return v17;
}

- (BOOL)isSettingHidden
{
  return self->_isSettingHidden;
}

- (BOOL)areNotificationsOn
{
  return self->_areNotificationsOn;
}

- (BOOL)shouldLinkToOnboarding
{
  return self->_shouldLinkToOnboarding;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_isUserInteractionEnabled;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (HKHRIrregularRhythmNotificationsBridgeFooter)footer
{
  return self->_footer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);

  objc_storeStrong((id *)&self->_headerText, 0);
}

@end