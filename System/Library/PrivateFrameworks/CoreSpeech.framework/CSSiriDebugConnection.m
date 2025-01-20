@interface CSSiriDebugConnection
+ (id)_getFalseRejectBannerCommandWithTriggerScore:(float)a3 withTriggeredPhraseId:(unsigned int)a4;
+ (void)launchSiriDebugAppWithMessage:(id)a3;
+ (void)launchSiriDebugFeedbackBannerFalseRejectBannerWithTriggerScore:(float)a3 withTriggeredPhraseId:(unsigned int)a4;
@end

@implementation CSSiriDebugConnection

+ (id)_getFalseRejectBannerCommandWithTriggerScore:(float)a3 withTriggeredPhraseId:(unsigned int)a4
{
  v5 = +[NSString stringWithFormat:@"%d", *(void *)&a4];
  v6 = +[NSString stringWithFormat:@"%0.1f", a3];
  v7 = [@"com.apple.siri.SiriDebug.FeedbackBanner.NearMiss.Notify?triggeredPhraseId={TRIGGERED_PHRASE_ID}&triggerScore={TRIGGER_SCORE}" stringByReplacingOccurrencesOfString:@"{TRIGGERED_PHRASE_ID}" withString:v5];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"{TRIGGER_SCORE}" withString:v6];

  return v8;
}

+ (void)launchSiriDebugFeedbackBannerFalseRejectBannerWithTriggerScore:(float)a3 withTriggeredPhraseId:(unsigned int)a4
{
  +[CSSiriDebugConnection _getFalseRejectBannerCommandWithTriggerScore:withTriggeredPhraseId:](CSSiriDebugConnection, "_getFalseRejectBannerCommandWithTriggerScore:withTriggeredPhraseId:", *(void *)&a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CSSiriDebugConnection launchSiriDebugAppWithMessage:v4];
}

+ (void)launchSiriDebugAppWithMessage:(id)a3
{
  id v3 = a3;
  if (CSIsInternalBuild() && CSIsIPhone())
  {
    id v4 = [objc_alloc((Class)AFUIApplicationSiriTaskDeliverer) initWithAppBundleIdentifier:@"com.apple.siri.SiriDebug"];
    id v5 = [objc_alloc((Class)AFSiriTaskmaster) initWithTaskDeliverer:v4];
    id v6 = [objc_alloc((Class)AFSiriDebugUIRequest) initWithMessage:v3 makeAppFrontmost:0];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005F624;
    v9[3] = &unk_100253AE0;
    id v10 = v3;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005F6E0;
    v7[3] = &unk_10024F638;
    id v8 = v10;
    [v5 handleSiriRequest:v6 deliveryHandler:v9 completionHandler:v7];
  }
}

@end