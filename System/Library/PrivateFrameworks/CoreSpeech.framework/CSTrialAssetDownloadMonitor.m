@interface CSTrialAssetDownloadMonitor
+ (CSTrialAssetDownloadMonitor)sharedInstance;
- (BOOL)_handleSiriAttAssetTrailDownloadForNamespace:(id)a3;
- (BOOL)_validateDownloadedAssetForAssetType:(unint64_t)a3;
- (CSTrialAssetDownloadMonitor)init;
- (id)_trailStageDirectoryForAsset:(id)a3;
- (void)_notifyTrialAssetDownloadForAssetType:(unint64_t)a3;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)downloadAndNotifyTrialAssetsUpdateForNamespace:(id)a3 onQueue:(id)a4;
@end

@implementation CSTrialAssetDownloadMonitor

- (void).cxx_destruct
{
}

- (id)_trailStageDirectoryForAsset:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  v5 = +[CSFPreferences sharedPreferences];
  v6 = [v5 trialBaseAssetDirectory];

  id v7 = [v6 stringByAppendingPathComponent:v3];

  if ([v4 fileExistsAtPath:v7])
  {
    id v21 = 0;
    unsigned __int8 v8 = [v4 removeItemAtPath:v7 error:&v21];
    id v9 = v21;
    if ((v8 & 1) == 0)
    {
      v10 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v18 = v10;
        v19 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v23 = "-[CSTrialAssetDownloadMonitor _trailStageDirectoryForAsset:]";
        __int16 v24 = 2112;
        id v25 = v7;
        __int16 v26 = 2114;
        v27 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Failed to delete dir at %@ with err: %{public}@", buf, 0x20u);
      }
      v11 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    id v9 = 0;
  }
  v12 = v9;
  id v20 = v9;
  unsigned __int8 v13 = [v4 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v9 = v20;

  if ((v13 & 1) == 0)
  {
    v14 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v16 = v14;
      v17 = [v9 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v23 = "-[CSTrialAssetDownloadMonitor _trailStageDirectoryForAsset:]";
      __int16 v24 = 2114;
      id v25 = v7;
      __int16 v26 = 2114;
      v27 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@", buf, 0x20u);
    }
    id v7 = 0;
  }
  id v7 = v7;
  v11 = v7;
LABEL_12:

  return v11;
}

- (BOOL)_validateDownloadedAssetForAssetType:(unint64_t)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v4 = +[CSTrialAssetManager sharedInstance];
  v5 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016E884;
  v7[3] = &unk_1002538F0;
  v7[4] = &v8;
  v7[5] = a3;
  [v4 getInstalledAssetofType:a3 forLocale:v5 completion:v7];

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

- (void)_notifyTrialAssetDownloadForAssetType:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10016EC9C;
  v3[3] = &unk_100253878;
  v3[4] = self;
  v3[5] = a3;
  [(CSTrialAssetDownloadMonitor *)self enumerateObserversInQueue:v3];
}

- (void)downloadAndNotifyTrialAssetsUpdateForNamespace:(id)a3 onQueue:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016ED98;
  v7[3] = &unk_100253B08;
  id v8 = a3;
  id v9 = self;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)a4, v7);
}

- (BOOL)_handleSiriAttAssetTrailDownloadForNamespace:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_trialClientDict objectForKeyedSubscript:v4];
  [v5 refresh];
  id v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    v18 = "-[CSTrialAssetDownloadMonitor _handleSiriAttAssetTrailDownloadForNamespace:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Got Trial experiment/rollout notification", (uint8_t *)&v17, 0xCu);
  }
  id v7 = [v5 levelForFactor:@"com.apple.siri.sp.invocation" withNamespaceName:v4];
  id v8 = [v7 directoryValue];
  id v9 = [v8 path];

  if (v9)
  {
    [(CSTrialAssetDownloadMonitor *)self _notifyTrialAssetDownloadForAssetType:0];
    uint64_t v10 = [v5 levelForFactor:@"com.apple.siri.sp.mitigation" withNamespaceName:v4];

    char v11 = [v10 directoryValue];
    v12 = [v11 path];

    if (v12)
    {
      [(CSTrialAssetDownloadMonitor *)self _notifyTrialAssetDownloadForAssetType:6];
      BOOL v13 = 1;
    }
    else
    {
      v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315394;
        v18 = "-[CSTrialAssetDownloadMonitor _handleSiriAttAssetTrailDownloadForNamespace:]";
        __int16 v19 = 2114;
        CFStringRef v20 = @"com.apple.siri.sp.mitigation";
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s ERR: null file download path for factor: %{public}@", (uint8_t *)&v17, 0x16u);
      }
      v12 = +[CSDiagnosticReporter sharedInstance];
      [v12 submitTrialIssueReport:kCSDiagnosticReporterTrialDownloadFailed];
      BOOL v13 = 0;
    }
    id v7 = v10;
  }
  else
  {
    v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      v18 = "-[CSTrialAssetDownloadMonitor _handleSiriAttAssetTrailDownloadForNamespace:]";
      __int16 v19 = 2114;
      CFStringRef v20 = @"com.apple.siri.sp.invocation";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s ERR: null file download path for factor: %{public}@", (uint8_t *)&v17, 0x16u);
    }
    v12 = +[CSDiagnosticReporter sharedInstance];
    [v12 submitTrialIssueReport:kCSDiagnosticReporterTrialDownloadFailed];
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  if (+[CSUtils supportTrialMitigationAssets]) {
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_10025E398, &off_10025E3B0, 0);
  }
  else {
  v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_10025E3C8, &off_10025E3E0, 0);
  }
  objc_initWeak(&location, self);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) unsignedIntegerValue];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10016F7D0;
        v13[3] = &unk_100253850;
        v14 = v4;
        objc_copyWeak(&v16, &location);
        id v15 = v3;
        +[CSUtils getTrialIdsForAssetType:v9 withCompletion:v13];

        objc_destroyWeak(&v16);
      }
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v6);
  }

  trialClientDict = self->_trialClientDict;
  self->_trialClientDict = v4;

  objc_destroyWeak(&location);
}

- (CSTrialAssetDownloadMonitor)init
{
  if (+[CSUtils isDarwinOS])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSTrialAssetDownloadMonitor;
    self = [(CSTrialAssetDownloadMonitor *)&v5 init];
    id v3 = self;
  }

  return v3;
}

+ (CSTrialAssetDownloadMonitor)sharedInstance
{
  if (qword_1002A3CC8 != -1) {
    dispatch_once(&qword_1002A3CC8, &stru_100253800);
  }
  v2 = (void *)qword_1002A3CC0;
  return (CSTrialAssetDownloadMonitor *)v2;
}

@end