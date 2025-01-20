@interface SRAssetsUtilities
+ (BOOL)shouldShowAssetDownloadBanner;
+ (void)_runAssetCheckWithTask:(id)a3;
+ (void)_scheduleAssetCheckWithEarliestBeginDate:(id)a3;
+ (void)setupBackgroundAssetCheck;
- (BOOL)_hasInexpensiveNetwork;
- (BOOL)_hasSufficientDiskSpaceForDownload;
- (SRAssetsUtilities)init;
- (unint64_t)_mockSiriAssetState;
- (void)checkAssetsWithCompletion:(id)a3;
@end

@implementation SRAssetsUtilities

- (SRAssetsUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRAssetsUtilities;
  v2 = [(SRAssetsUtilities *)&v6 init];
  if (v2)
  {
    v3 = (UAFAssetUtilities *)objc_alloc_init((Class)UAFAssetUtilities);
    assetUtilities = v2->_assetUtilities;
    v2->_assetUtilities = v3;
  }
  return v2;
}

- (void)checkAssetsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = +[AFPreferences sharedPreferences];
  unsigned __int8 v6 = [v5 assistantIsEnabled];

  if (v6)
  {
    [(UAFAssetUtilities *)self->_assetUtilities refreshUnderstandingOnDeviceAssetsAvailableAsync];
    unint64_t v7 = [(SRAssetsUtilities *)self _mockSiriAssetState];
    if (v7)
    {
      unint64_t v8 = v7;
      v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315394;
        v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
        __int16 v16 = 2048;
        unint64_t v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Using mock value for Siri asset state: %lu", (uint8_t *)&v14, 0x16u);
      }
      v4[2](v4, v8);
    }
    else
    {
      if ([(UAFAssetUtilities *)self->_assetUtilities understandingOnDeviceAssetsAvailable])
      {
        v10 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          int v14 = 136315138;
          v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Task shows finished asset state", (uint8_t *)&v14, 0xCu);
        }
        uint64_t v11 = 3;
      }
      else if ([(UAFAssetUtilities *)self->_assetUtilities hasSufficientDiskSpaceForDownload])
      {
        [(UAFAssetUtilities *)self->_assetUtilities downloadSiriAssetsIfNeeded];
        v12 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          int v14 = 136315138;
          v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Task shows downloading asset state", (uint8_t *)&v14, 0xCu);
        }
        uint64_t v11 = 2;
      }
      else
      {
        v13 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          int v14 = 136315138;
          v15 = "-[SRAssetsUtilities checkAssetsWithCompletion:]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Task shows out of space asset state", (uint8_t *)&v14, 0xCu);
        }
        uint64_t v11 = 4;
      }
      v4[2](v4, v11);
    }
  }
  else
  {
    v4[2](v4, 1);
  }
}

- (unint64_t)_mockSiriAssetState
{
  id v2 = [objc_alloc((Class)SRUIFPreferences) initWithSuiteName:@"com.apple.SiriViewService"];
  id v3 = [v2 objectForKey:@"MockSiriAssetState"];

  if (v3) {
    id v3 = [v2 integerForKey:@"MockSiriAssetState"];
  }

  return (unint64_t)v3;
}

+ (void)setupBackgroundAssetCheck
{
  id v2 = objc_alloc_init(SRPreferences);
  if (![(SRPreferences *)v2 hasPresentedSiriAssetsNotification])
  {
    id v3 = +[BGTaskScheduler sharedScheduler];
    unsigned int v4 = [v3 registerForTaskWithIdentifier:@"com.apple.siri.CheckAssetStatus" usingQueue:0 launchHandler:&stru_1001433E8];

    if (v4)
    {
      +[SRAssetsUtilities _scheduleAssetCheckWithEarliestBeginDate:0];
    }
    else
    {
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_1000B75A4(v5);
      }
    }
  }
}

+ (void)_scheduleAssetCheckWithEarliestBeginDate:(id)a3
{
  id v3 = a3;
  unsigned int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "+[SRAssetsUtilities _scheduleAssetCheckWithEarliestBeginDate:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Submitting background task request to check assets.", buf, 0xCu);
  }
  id v5 = [objc_alloc((Class)BGProcessingTaskRequest) initWithIdentifier:@"com.apple.siri.CheckAssetStatus"];
  [v5 setRequiresExternalPower:0];
  [v5 setRequiresNetworkConnectivity:1];
  [v5 setEarliestBeginDate:v3];
  unsigned __int8 v6 = +[BGTaskScheduler sharedScheduler];
  id v10 = 0;
  unsigned __int8 v7 = [v6 submitTaskRequest:v5 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B763C(v9, v8);
    }
  }
}

+ (void)_runAssetCheckWithTask:(id)a3
{
  id v3 = a3;
  if (AFDeviceSupportsSiriUOD() & 1) != 0 || (AFDeviceSupportsHybridUOD())
  {
    unsigned int v4 = objc_alloc_init(SRAssetsUtilities);
    objc_initWeak(location, v3);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100018908;
    v8[3] = &unk_100143410;
    objc_copyWeak(&v9, location);
    [v3 setExpirationHandler:v8];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100018A18;
    v6[3] = &unk_100143438;
    id v7 = v3;
    [(SRAssetsUtilities *)v4 checkAssetsWithCompletion:v6];

    objc_destroyWeak(&v9);
    objc_destroyWeak(location);
  }
  else
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "+[SRAssetsUtilities _runAssetCheckWithTask:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s UOD not supported by this device. No background task started.", (uint8_t *)location, 0xCu);
    }
  }
}

- (BOOL)_hasSufficientDiskSpaceForDownload
{
  return [(UAFAssetUtilities *)self->_assetUtilities hasSufficientDiskSpaceForDownload];
}

- (BOOL)_hasInexpensiveNetwork
{
  id v2 = +[NWPathEvaluator sharedDefaultEvaluator];
  id v3 = [v2 path];

  if ([v3 status] == (id)1) {
    unsigned int v4 = [v3 isExpensive] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)shouldShowAssetDownloadBanner
{
  id v2 = objc_alloc_init(SRAssetsUtilities);
  if ([(SRAssetsUtilities *)v2 _hasSufficientDiskSpaceForDownload]) {
    unsigned __int8 v3 = [(SRAssetsUtilities *)v2 _hasInexpensiveNetwork];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end