@interface ADOfflineMetricsManager
+ (id)_buildOfflineMetricsMap;
+ (void)_deleteLegacyOfflineMetricsFiles;
- (ADOfflineMetricsManager)init;
- (void)deleteAllMetrics;
- (void)deleteMetricsWithOfflineIdentifier:(id)a3;
- (void)fetchNextMetricsUsingBlock:(id)a3;
- (void)insertMetrics:(id)a3;
@end

@implementation ADOfflineMetricsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)deleteAllMetrics
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ADOfflineMetricsManager deleteAllMetrics]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10021635C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)fetchNextMetricsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ADOfflineMetricsManager fetchNextMetricsUsingBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100216494;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)deleteMetricsWithOfflineIdentifier:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[ADOfflineMetricsManager deleteMetricsWithOfflineIdentifier:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s offlineIdentifier = %@", buf, 0x16u);
  }
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002166C0;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)insertMetrics:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[ADOfflineMetricsManager insertMetrics:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s metrics = %@", buf, 0x16u);
  }
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100216804;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (ADOfflineMetricsManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)ADOfflineMetricsManager;
  v2 = [(ADOfflineMetricsManager *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.offline-metrics", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002169A0;
    block[3] = &unk_10050E138;
    v10 = v2;
    dispatch_async(v7, block);
  }
  return v2;
}

+ (id)_buildOfflineMetricsMap
{
  v2 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
  v3 = [v2 URLByAppendingPathComponent:@"SiriMetrics"];
  id v4 = [v3 path];

  dispatch_queue_t v5 = [[ADOfflineMetricsMap alloc] initWithPath:v4];
  return v5;
}

+ (void)_deleteLegacyOfflineMetricsFiles
{
  v2 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
  v3 = [v2 URLByAppendingPathComponent:@"SiriOfflineMetrics.plist"];
  id v4 = [v3 path];
  v23[0] = v4;
  dispatch_queue_t v5 = +[ADAudioFileWriter _savedAudioFilesDirectory]_0();
  v6 = [v5 URLByAppendingPathComponent:@"offlineSAMetrics.plist"];
  v7 = [v6 path];
  v23[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v23 count:2];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v13);
        v15 = +[NSFileManager defaultManager];
        unsigned int v16 = [v15 fileExistsAtPath:v14];

        if (v16)
        {
          v17 = +[NSFileManager defaultManager];
          [v17 removeItemAtPath:v14 error:0];
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

@end