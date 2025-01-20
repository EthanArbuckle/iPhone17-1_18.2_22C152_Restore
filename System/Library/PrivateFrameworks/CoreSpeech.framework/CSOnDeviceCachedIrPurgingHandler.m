@interface CSOnDeviceCachedIrPurgingHandler
+ (id)sharedHandler;
- (CSOnDeviceCachedIrPurgingHandler)init;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)_cleanUpOnDeviceCompilationPath;
- (void)_purgeCachedIrFilesWithAsset:(id)a3;
- (void)cleanUpCachedIrDir;
- (void)dealloc;
- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5;
- (void)startRegistration;
- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5;
@end

@implementation CSOnDeviceCachedIrPurgingHandler

- (void).cxx_destruct
{
}

- (void)_purgeCachedIrFilesWithAsset:(id)a3
{
  id v4 = a3;
  if (CSIsHorseman())
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSOnDeviceCachedIrPurgingHandler _purgeCachedIrFilesWithAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s purging for specific device is not handled here", buf, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10016B5B8;
    block[3] = &unk_100253AE0;
    id v8 = v4;
    dispatch_async(queue, block);
  }
}

- (void)_cleanUpOnDeviceCompilationPath
{
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      v9 = "-[CSOnDeviceCachedIrPurgingHandler CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger is disabled, clean up cached ir path", (uint8_t *)&v8, 0xCu);
    }
    [(CSOnDeviceCachedIrPurgingHandler *)self _cleanUpOnDeviceCompilationPath];
  }
}

- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[CSOnDeviceCachedIrPurgingHandler mitigationAssetHandler:endpointId:didChangeCachedAsset:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s received notification to purge mitigation asset with endPoint id: %@", (uint8_t *)&v10, 0x16u);
  }
  [(CSOnDeviceCachedIrPurgingHandler *)self _purgeCachedIrFilesWithAsset:v8];
}

- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[CSOnDeviceCachedIrPurgingHandler voiceTriggerAssetHandler:endpointId:didChangeCachedAsset:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s received notification to purge voice trigger asset with endPoint id: %@", (uint8_t *)&v10, 0x16u);
  }
  [(CSOnDeviceCachedIrPurgingHandler *)self _purgeCachedIrFilesWithAsset:v8];
}

- (void)cleanUpCachedIrDir
{
}

- (void)startRegistration
{
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[CSOnDeviceCachedIrPurgingHandler startRegistration]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s onDevice cached purgedHandler starts", (uint8_t *)&v7, 0xCu);
  }
  id v4 = +[CSVoiceTriggerAssetHandler sharedHandler];
  [v4 registerObserver:self];

  v5 = +[CSAttSiriMitigationAssetHandler sharedHandler];
  [v5 registerObserver:self];

  id v6 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  [v6 addObserver:self];
}

- (void)dealloc
{
  v3 = +[CSVoiceTriggerAssetHandler sharedHandler];
  [v3 unregisterObserver:self];

  id v4 = +[CSAttSiriMitigationAssetHandler sharedHandler];
  [v4 unregisterObserver:self];

  v5 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)CSOnDeviceCachedIrPurgingHandler;
  [(CSOnDeviceCachedIrPurgingHandler *)&v6 dealloc];
}

- (CSOnDeviceCachedIrPurgingHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSOnDeviceCachedIrPurgingHandler;
  v2 = [(CSOnDeviceCachedIrPurgingHandler *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
    dispatch_queue_t v4 = dispatch_queue_create("CSOnDeviceCachedIrPurgingHandler", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)sharedHandler
{
  if (qword_1002A3CA0 != -1) {
    dispatch_once(&qword_1002A3CA0, &stru_1002535F8);
  }
  v2 = (void *)qword_1002A3C98;
  return v2;
}

@end