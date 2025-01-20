@interface ADDictationOfflineStatusObserver
+ (id)_offlineDictationStatusStringToDictionary:(id)a3;
+ (id)sharedDictationOfflineStatusObserver;
- (ADDictationOfflineStatusObserver)init;
- (NSDictionary)offlineDictationStatus;
- (void)_updateOfflineDictationStatus:(id)a3 error:(id)a4;
- (void)fetchOfflineDictationStatusIgnoringCache:(BOOL)a3 asynchronously:(BOOL)a4;
- (void)setOfflineDictationStatus:(id)a3;
@end

@implementation ADDictationOfflineStatusObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDictationStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setOfflineDictationStatus:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100585898);
  objc_storeStrong((id *)&self->_offlineDictationStatus, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100585898);
  v6 = +[AFPreferences sharedPreferences];
  v7 = [v6 offlineDictationStatus];

  if (([v7 isEqualToDictionary:v5] & 1) == 0)
  {
    v8 = +[AFPreferences sharedPreferences];
    [v8 setOfflineDictationStatus:v5];

    v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      v11 = "-[ADDictationOfflineStatusObserver setOfflineDictationStatus:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Prefs updated with new offline dictation status", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (NSDictionary)offlineDictationStatus
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100585898);
  v3 = self->_offlineDictationStatus;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100585898);
  if (!v3)
  {
    v4 = +[AFPreferences sharedPreferences];
    v3 = [v4 offlineDictationStatus];
  }
  return v3;
}

- (void)fetchOfflineDictationStatusIgnoringCache:(BOOL)a3 asynchronously:(BOOL)a4
{
  BOOL v4 = a4;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100088FF4;
  v11[3] = &unk_10050B790;
  objc_copyWeak(&v12, &location);
  v6 = objc_retainBlock(v11);
  v7 = v6;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100089098;
    block[3] = &unk_10050D0D0;
    int v10 = v6;
    dispatch_async(queue, block);
  }
  else
  {
    ((void (*)(void *))v6[2])(v6);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_updateOfflineDictationStatus:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDaemon;
  if (v7)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      v14 = "-[ADDictationOfflineStatusObserver _updateOfflineDictationStatus:error:]";
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Error getting offline dictation status. Error: %@", (uint8_t *)&v13, 0x16u);
    }
    v9 = [v7 userInfo];
    int v10 = [v9 objectForKeyedSubscript:kAssetQueryResultKey];
    unsigned int v11 = [v10 isEqualToNumber:&off_100523510];

    if (v11)
    {
      [(ADDictationOfflineStatusObserver *)self setOfflineDictationStatus:&__NSDictionary0__struct];
      id v12 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315138;
        v14 = "-[ADDictationOfflineStatusObserver _updateOfflineDictationStatus:error:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Resetting offline dictation status prefs", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      v14 = "-[ADDictationOfflineStatusObserver _updateOfflineDictationStatus:error:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Received offline dictation status %@", (uint8_t *)&v13, 0x16u);
    }
    v9 = [(id)objc_opt_class() _offlineDictationStatusStringToDictionary:v6];
    [(ADDictationOfflineStatusObserver *)self setOfflineDictationStatus:v9];
  }
}

- (ADDictationOfflineStatusObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADDictationOfflineStatusObserver;
  v2 = [(ADDictationOfflineStatusObserver *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("ADDictationOfflineStatusObserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)_offlineDictationStatusStringToDictionary:(id)a3
{
  id v3 = a3;
  +[NSMutableDictionary dictionary];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100089400;
  v7[3] = &unk_10050C388;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = +[NSDictionary dictionaryWithDictionary:v4];

  return v5;
}

+ (id)sharedDictationOfflineStatusObserver
{
  if (qword_100585890 != -1) {
    dispatch_once(&qword_100585890, &stru_1005001A8);
  }
  v2 = (void *)qword_100585888;
  return v2;
}

@end