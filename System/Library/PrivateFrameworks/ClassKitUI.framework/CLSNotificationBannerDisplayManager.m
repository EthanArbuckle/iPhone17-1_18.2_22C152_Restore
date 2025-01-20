@interface CLSNotificationBannerDisplayManager
+ (id)shared;
- (NSDate)lastBannerTime;
- (void)setLastBannerTime:(id)a3;
- (void)showBannerWithTitle:(id)a3 message:(id)a4;
- (void)showPrivacyModalViewWithInfo:(id)a3;
@end

@implementation CLSNotificationBannerDisplayManager

+ (id)shared
{
  if (qword_268496248 != -1) {
    dispatch_once(&qword_268496248, &unk_26DF668B0);
  }
  v2 = (void *)qword_268496240;

  return v2;
}

- (void)showBannerWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22BFA59A0;
  block[3] = &unk_264904F58;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)showPrivacyModalViewWithInfo:(id)a3
{
  id v3 = (id)objc_msgSend_instantiateViewControllerWithInputItems_identifier_connectionHandler_(CLSRemoteViewController, a2, 0, @"com.apple.ClassKitUI.PrivacyDisclosure", &unk_26DF668D0);
}

- (NSDate)lastBannerTime
{
  return self->_lastBannerTime;
}

- (void)setLastBannerTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end