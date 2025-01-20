@interface ADSiriAnalyticsOnDeviceDigestProvider
+ (id)createOnDeviceDigestEvent;
+ (unsigned)_fetchLatestDaysWithTwoAssistantSpeechRequestsPerWeek;
@end

@implementation ADSiriAnalyticsOnDeviceDigestProvider

+ (unsigned)_fetchLatestDaysWithTwoAssistantSpeechRequestsPerWeek
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  v2 = BiomeLibrary();
  v3 = [v2 Siri];
  v4 = [v3 Metrics];
  v5 = [v4 OnDeviceDigestSegmentsCohorts];

  id v6 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:0 endDate:0 maxEvents:1 lastN:0 reversed:1];
  v7 = [v5 publisherWithOptions:v6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001848B4;
  v10[3] = &unk_100506A98;
  v10[4] = &v11;
  id v8 = [v7 sinkWithCompletion:&stru_100504700 receiveInput:v10];
  LODWORD(v4) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return v4;
}

+ (id)createOnDeviceDigestEvent
{
  id v3 = objc_alloc_init((Class)DIMSchemaDIMOnDeviceDigest);
  objc_msgSend(v3, "setDaysWithTwoAssistantSpeechRequestsPerWeek:", objc_msgSend(a1, "_fetchLatestDaysWithTwoAssistantSpeechRequestsPerWeek"));
  id v4 = objc_alloc_init((Class)DIMSchemaDIMClientEvent);
  [v4 setOnDeviceDigest:v3];

  return v4;
}

@end