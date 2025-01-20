@interface SRSiriDebugManager
+ (void)_notifySiriDebugAppWithMessage:(id)a3 completionHandler:(id)a4;
+ (void)invokeSiriDebugFeedbackBannerFor:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation SRSiriDebugManager

+ (void)invokeSiriDebugFeedbackBannerFor:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = SASRequestSourceGetName();
    *(_DWORD *)buf = 136315394;
    v13 = "+[SRSiriDebugManager invokeSiriDebugFeedbackBannerFor:completionHandler:]";
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s SiriDebug: RequestSource to invoke Siri Banner: %@", buf, 0x16u);
  }
  if ((a3 | 4) == 0xC)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100015B7C;
    v10[3] = &unk_100143278;
    id v11 = v6;
    [a1 _notifySiriDebugAppWithMessage:@"com.apple.siri.SiriDebug.FeedbackBanner.VoiceTrigger.Notify" completionHandler:v10];
  }
}

+ (void)_notifySiriDebugAppWithMessage:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (AFIsInternalInstall())
  {
    id v7 = [objc_alloc((Class)AFUIApplicationSiriTaskDeliverer) initWithAppBundleIdentifier:@"com.apple.siri.SiriDebug"];
    id v8 = [objc_alloc((Class)AFSiriTaskmaster) initWithTaskDeliverer:v7];
    id v9 = [objc_alloc((Class)AFSiriDebugUIRequest) initWithMessage:v5 makeAppFrontmost:0];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100015D14;
    v13[3] = &unk_100142E88;
    id v14 = v5;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100015DD0;
    v10[3] = &unk_1001432A0;
    id v11 = v14;
    id v12 = v6;
    [v8 handleSiriRequest:v9 deliveryHandler:v13 completionHandler:v10];
  }
}

@end