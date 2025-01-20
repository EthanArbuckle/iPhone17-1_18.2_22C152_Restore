@interface CLSNotificationBanner
+ (void)showBannerWithTitle:(id)a3 message:(id)a4 completionHandler:(id)a5;
@end

@implementation CLSNotificationBanner

+ (void)showBannerWithTitle:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [CLSNotificationBannerView alloc];
  id v13 = (id)objc_msgSend_initWithTitle_message_(v10, v11, (uint64_t)v9, v8);

  objc_msgSend_showWithCompletionHandler_(v13, v12, (uint64_t)v7);
}

@end