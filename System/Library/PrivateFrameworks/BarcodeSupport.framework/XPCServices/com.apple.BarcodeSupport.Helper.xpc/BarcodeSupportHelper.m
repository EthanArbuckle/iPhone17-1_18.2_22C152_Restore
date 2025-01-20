@interface BarcodeSupportHelper
- (void)processAppClipImageWithURL:(id)a3 scale:(double)a4 reply:(id)a5;
- (void)setUpQRCodeControlCenterModuleWithReply:(id)a3;
@end

@implementation BarcodeSupportHelper

- (void)setUpQRCodeControlCenterModuleWithReply:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "BarcodeSupportHelper: set up QR code control center module", buf, 2u);
  }
  v4 = +[NSLocale currentLocale];
  v5 = [v4 countryCode];

  if ([&off_100004308 containsObject:v5])
  {
    v6 = +[CCSControlCenterService sharedInstance];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "BarcodeSupportHelper: get enabled state of QR code control center module", buf, 2u);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100003088;
    v8[3] = &unk_100004128;
    id v9 = v6;
    id v10 = v3;
    id v7 = v6;
    [v7 getEnabledStateOfModuleWithIdentifier:@"com.apple.control-center.QRCodeModule" completionHandler:v8];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v3 + 2))(v3, 1, 0);
  }
}

- (void)processAppClipImageWithURL:(id)a3 scale:(double)a4 reply:(id)a5
{
  v6 = (void (**)(id, void *))a5;
  v5 = _bcs_applyTreatmentToIcon();
  v6[2](v6, v5);
}

@end