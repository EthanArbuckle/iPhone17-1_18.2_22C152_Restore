@interface ADSiriAnalyticsServiceHost
+ (id)sharedSiriAnalyticsServiceHost;
- (ADSiriAnalyticsServiceHost)init;
- (BOOL)_siriOrDictationIsEnabled;
- (id)analyticsService;
- (id)messageStream;
- (id)siriAssistantConfiguration;
- (void)deleteLegacyMetricsAffectedBySensitiveConditionsWithCompletion:(id)a3;
- (void)writeLogViewerIdentifierDefaults;
@end

@implementation ADSiriAnalyticsServiceHost

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantAnalyticsConfiguration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_globalDimensionsResolver, 0);
  objc_storeStrong(&self->_siriAnalyticsMessagesSubscription, 0);
  objc_storeStrong((id *)&self->_siriAnalyticsService, 0);
}

- (void)deleteLegacyMetricsAffectedBySensitiveConditionsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ADSiriAnalyticsServiceHost deleteLegacyMetricsAffectedBySensitiveConditionsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000AFB3C;
  v12[3] = &unk_10050CF78;
  id v13 = v4;
  id v6 = v4;
  v7 = objc_retainBlock(v12);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AFC1C;
  block[3] = &unk_10050E188;
  block[4] = self;
  id v11 = v7;
  v9 = v7;
  dispatch_async(queue, block);
}

- (id)siriAssistantConfiguration
{
  return self->_assistantAnalyticsConfiguration;
}

- (BOOL)_siriOrDictationIsEnabled
{
  if ([(AssistantSiriAnalyticsConfiguration *)self->_assistantAnalyticsConfiguration assistantEnabled])return 1; {
  assistantAnalyticsConfiguration = self->_assistantAnalyticsConfiguration;
  }
  return [(AssistantSiriAnalyticsConfiguration *)assistantAnalyticsConfiguration dictationEnabled];
}

- (void)writeLogViewerIdentifierDefaults
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0974;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)messageStream
{
  v2 = +[AssistantSiriAnalytics sharedAnalytics];
  v3 = [v2 defaultMessageStream];

  return v3;
}

- (id)analyticsService
{
  return self->_siriAnalyticsService;
}

- (ADSiriAnalyticsServiceHost)init
{
  v18.receiver = self;
  v18.super_class = (Class)ADSiriAnalyticsServiceHost;
  v2 = [(ADSiriAnalyticsServiceHost *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create(0, v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc_init(ADSiriAnalyticsAssistantConfiguration);
    assistantAnalyticsConfiguration = v2->_assistantAnalyticsConfiguration;
    v2->_assistantAnalyticsConfiguration = (AssistantSiriAnalyticsConfiguration *)v7;

    v9 = (AssistantSiriAnalyticsService *)[objc_alloc((Class)AssistantSiriAnalyticsService) initWithQueue:v2->_queue delegate:v2];
    siriAnalyticsService = v2->_siriAnalyticsService;
    v2->_siriAnalyticsService = v9;

    id v11 = [[ADSiriAnalyticsGlobalDimensionMessageResolver alloc] initWithQueue:v2->_queue];
    globalDimensionsResolver = v2->_globalDimensionsResolver;
    v2->_globalDimensionsResolver = v11;

    [(AssistantSiriAnalyticsService *)v2->_siriAnalyticsService registerMessageResolver:v2->_globalDimensionsResolver];
    id v13 = v2->_siriAnalyticsService;
    v14 = [[ADSiriAnalyticsPhoneCallStateObserver alloc] initWithDelegate:v13 queue:v2->_queue];
    [(AssistantSiriAnalyticsService *)v13 registerSensitiveConditionsObserver:v14];

    v15 = v2->_siriAnalyticsService;
    v16 = [[ADSiriAnalyticsHIPAAOptInStateObserver alloc] initWithDelegate:v15 queue:v2->_queue];
    [(AssistantSiriAnalyticsService *)v15 registerSensitiveConditionsObserver:v16];
  }
  return v2;
}

+ (id)sharedSiriAnalyticsServiceHost
{
  if (qword_100585910 != -1) {
    dispatch_once(&qword_100585910, &stru_100500A60);
  }
  v2 = (void *)qword_100585918;
  return v2;
}

@end