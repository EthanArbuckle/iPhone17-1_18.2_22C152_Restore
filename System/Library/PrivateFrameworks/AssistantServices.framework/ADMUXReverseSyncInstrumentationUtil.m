@interface ADMUXReverseSyncInstrumentationUtil
+ (void)logSyncTokenFetchRequestReceivedRequestCreatedAt:(id)a3;
@end

@implementation ADMUXReverseSyncInstrumentationUtil

+ (void)logSyncTokenFetchRequestReceivedRequestCreatedAt:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      v19 = "+[ADMUXReverseSyncInstrumentationUtil logSyncTokenFetchRequestReceivedRequestCreatedAt:]";
      __int16 v20 = 2112;
      CFStringRef v21 = @"siriMux_tokenExchange";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Request time in %@ message is empty, not logging latency of token fetch request to SELF", (uint8_t *)&v18, 0x16u);
    }
  }
  v5 = +[AssistantSiriAnalytics sharedStream];
  id v6 = objc_alloc_init((Class)RSSSchemaRSSClientEvent);
  id v7 = objc_alloc_init((Class)RSSSchemaRSSClientEventMetadata);
  id v8 = objc_alloc((Class)SISchemaUUID);
  id v9 = objc_alloc_init((Class)NSUUID);
  id v10 = [v8 initWithNSUUID:v9];
  [v7 setRssId:v10];

  id v11 = objc_alloc_init((Class)RSSSchemaRSSSiriVocabSyncTokenFetchRequestReceived);
  v12 = +[NSDate date];
  [v12 timeIntervalSince1970];
  double v14 = v13;

  [v3 doubleValue];
  double v16 = v14 - v15;
  v17 = AFSiriLogContextDaemon;
  if (v16 >= 0.0)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 136315394;
      v19 = "+[ADMUXReverseSyncInstrumentationUtil logSyncTokenFetchRequestReceivedRequestCreatedAt:]";
      __int16 v20 = 2048;
      CFStringRef v21 = *(const __CFString **)&v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s SyncTokenFetchRequest latency in seconds: %f", (uint8_t *)&v18, 0x16u);
    }
    [v11 setSyncTokenFetchRequestTransferLatencyInMs:(unint64_t)(v16 * 1000.0)];
    [v6 setSyncTokenFetchRequestReceived:v11];
    [v6 setEventMetadata:v7];
    [v5 emitMessage:v6];
  }
  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315138;
    v19 = "+[ADMUXReverseSyncInstrumentationUtil logSyncTokenFetchRequestReceivedRequestCreatedAt:]";
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Timestamp on receiver lower that timestamp on sender, ignoring the metric due to failed sanity check", (uint8_t *)&v18, 0xCu);
  }
}

@end