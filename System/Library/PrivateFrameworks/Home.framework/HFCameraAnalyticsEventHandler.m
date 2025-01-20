@interface HFCameraAnalyticsEventHandler
+ (id)decoratedPayloadFor:(id)a3;
+ (id)sendAssociatedAccessoriesDidLaunchEventWithCount:(id)a3;
+ (id)sendAssociatedAccessoriesDidModifyListEventWithPayload:(id)a3;
+ (id)sendCameraClipPlayerDidUpdateEventWithError:(id)a3;
+ (id)sendDonationEventWithCameraClipCount:(unint64_t)a3 processName:(id)a4 error:(id)a5;
+ (void)sendEventNamed:(id)a3 payload:(id)a4;
@end

@implementation HFCameraAnalyticsEventHandler

+ (void)sendEventNamed:(id)a3 payload:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[HFCameraAnalyticsEventHandler decoratedPayloadFor:a4];
  int v7 = AnalyticsSendEventLazy();
  v8 = HFLogForCategory(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v10 = v5;
    __int16 v11 = 1024;
    int v12 = v7;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Event:%@ didSucceed:%{BOOL}d payload:%@", buf, 0x1Cu);
  }
}

id __56__HFCameraAnalyticsEventHandler_sendEventNamed_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)sendAssociatedAccessoriesDidLaunchEventWithCount:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = HFCameraAnalyticsCameraAccessoryCount;
  v9[0] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [a1 sendEventNamed:@"com.apple.Home.AssociatedAccessoriesDidLaunch" payload:v6];
  return v6;
}

+ (id)sendAssociatedAccessoriesDidModifyListEventWithPayload:(id)a3
{
  id v4 = a3;
  [a1 sendEventNamed:@"com.apple.Home.AssociatedAccessoriesDidModifySet" payload:v4];
  return v4;
}

+ (id)sendCameraClipPlayerDidUpdateEventWithError:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = @"errorDomain";
  id v4 = a3;
  id v5 = [v4 domain];
  v12[0] = v5;
  v11[1] = @"errorCode";
  id v6 = NSNumber;
  uint64_t v7 = [v4 code];

  uint64_t v8 = [v6 numberWithInteger:v7];
  v12[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  [a1 sendEventNamed:@"com.apple.Home.CameraClipPlayerDidUpdateError" payload:v9];
  return v9;
}

+ (id)sendDonationEventWithCameraClipCount:(unint64_t)a3 processName:(id)a4 error:(id)a5
{
  v14[3] = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = +[HFCameraAnalyticsEvent errorCodeForError:a5];
  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  v13[0] = HFCameraAnalyticsErrorCode;
  v13[1] = HFCameraAnalyticsProcessName;
  v14[0] = v9;
  v14[1] = v8;
  v13[2] = HFCameraAnalyticsCountKey;
  v14[2] = v10;
  __int16 v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  [a1 sendEventNamed:@"com.apple.Home.CameraClipDonationEvent" payload:v11];
  return v11;
}

+ (id)decoratedPayloadFor:(id)a3
{
  id v3 = a3;
  id v4 = +[HFCameraAnalyticsPayloadDecorator sharedDecorator];
  id v5 = [v4 decoratePayload:v3];

  return v5;
}

@end