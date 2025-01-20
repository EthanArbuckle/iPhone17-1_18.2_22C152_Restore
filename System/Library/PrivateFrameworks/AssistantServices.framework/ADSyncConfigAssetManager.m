@interface ADSyncConfigAssetManager
+ (id)sharedInstance;
- (ADSyncConfigAssetManager)init;
- (BOOL)_getBooleanValueForFactor:(id)a3;
- (BOOL)assistantSyncDisabledForEnUS;
- (BOOL)disableAssistantSyncForEnUS;
- (BOOL)disableAssistantSyncForInactiveDevices;
- (BOOL)isInactiveDeviceSyncDisabled;
- (BOOL)isMediaEntitySyncDisabled;
- (OS_dispatch_queue)queue;
- (id)_initWithTriClient:(id)a3;
- (id)updateHandler;
- (int64_t)_getIntValueForFactor:(id)a3;
- (int64_t)inactiveDeviceThreshold;
- (void)_populateConfiguration;
- (void)_registerUpdateHandler;
- (void)setDisableAssistantSyncForEnUS:(BOOL)a3;
- (void)setDisableAssistantSyncForInactiveDevices:(BOOL)a3;
- (void)setInactiveDeviceThreshold:(int64_t)a3;
- (void)setIsMediaEntitySyncDisabled:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation ADSyncConfigAssetManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)setUpdateHandler:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setInactiveDeviceThreshold:(int64_t)a3
{
  self->_inactiveDeviceThreshold = a3;
}

- (void)setDisableAssistantSyncForInactiveDevices:(BOOL)a3
{
  self->_disableAssistantSyncForInactiveDevices = a3;
}

- (BOOL)disableAssistantSyncForInactiveDevices
{
  return self->_disableAssistantSyncForInactiveDevices;
}

- (void)setDisableAssistantSyncForEnUS:(BOOL)a3
{
  self->_disableAssistantSyncForEnUS = a3;
}

- (BOOL)disableAssistantSyncForEnUS
{
  return self->_disableAssistantSyncForEnUS;
}

- (void)setIsMediaEntitySyncDisabled:(BOOL)a3
{
  self->_isMediaEntitySyncDisabled = a3;
}

- (int64_t)inactiveDeviceThreshold
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100354850;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isInactiveDeviceSyncDisabled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100354910;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)assistantSyncDisabledForEnUS
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003549D0;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isMediaEntitySyncDisabled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100354A90;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)_getIntValueForFactor:(id)a3
{
  id v4 = a3;
  v5 = [(TRIClient *)self->_client levelForFactor:v4 withNamespaceName:@"SIRI_MEMORY_SYNC_CONFIG"];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 longValue];
  }
  else
  {
    uint64_t v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      v11 = "-[ADSyncConfigAssetManager _getIntValueForFactor:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Level not found, clearing value for factor name %@", (uint8_t *)&v10, 0x16u);
    }
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (BOOL)_getBooleanValueForFactor:(id)a3
{
  id v4 = a3;
  v5 = [(TRIClient *)self->_client levelForFactor:v4 withNamespaceName:@"SIRI_MEMORY_SYNC_CONFIG"];
  uint64_t v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = [v5 BOOLeanValue];
  }
  else
  {
    uint64_t v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      v11 = "-[ADSyncConfigAssetManager _getBooleanValueForFactor:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Level not found, clearing value for factor name %@", (uint8_t *)&v10, 0x16u);
    }
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)_populateConfiguration
{
  BOOL v3 = [(ADSyncConfigAssetManager *)self _getBooleanValueForFactor:@"disable_enUS_sync.enablement_status"];
  self->_disableAssistantSyncForEnUS = v3;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "-[ADSyncConfigAssetManager _populateConfiguration]";
    __int16 v20 = 1024;
    LODWORD(v21) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Updating value for disabling assistant sync config for enUS -> %d", (uint8_t *)&v18, 0x12u);
  }
  BOOL v5 = [(ADSyncConfigAssetManager *)self _getBooleanValueForFactor:@"disable_inactive_sync.enablement_status"];
  self->_disableAssistantSyncForInactiveDevices = v5;
  uint64_t v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "-[ADSyncConfigAssetManager _populateConfiguration]";
    __int16 v20 = 1024;
    LODWORD(v21) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Updating value for inactive device sync config -> %d", (uint8_t *)&v18, 0x12u);
  }
  int64_t v7 = [(ADSyncConfigAssetManager *)self _getIntValueForFactor:@"disable_inactive_sync.threshold"];
  self->_inactiveDeviceThreshold = v7;
  uint64_t v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "-[ADSyncConfigAssetManager _populateConfiguration]";
    __int16 v20 = 2048;
    CFStringRef v21 = (const __CFString *)v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Updating value for inactive device sync threshold -> %lld", (uint8_t *)&v18, 0x16u);
  }
  if (self->_disableAssistantSyncForEnUS)
  {
    char v9 = +[ADPreferences sharedPreferences];
    [v9 setIsSyncDisabledForFullUoDDevices:1];
  }
  int v10 = [(TRIClient *)self->_client levelForFactor:@"siri_audio.media_entity_sync.disablement_status" withNamespaceName:@"SIRI_AUDIO_DISABLE_MEDIA_ENTITY_SYNC"];
  v11 = v10;
  if (v10)
  {
    unsigned int v12 = [v10 BOOLeanValue];
    self->_BOOL isMediaEntitySyncDisabled = v12;
    id v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315650;
      v19 = "-[ADSyncConfigAssetManager _populateConfiguration]";
      __int16 v20 = 2112;
      CFStringRef v21 = @"siri_audio.media_entity_sync.disablement_status";
      __int16 v22 = 1024;
      unsigned int v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Updating sync config: %@ -> %d", (uint8_t *)&v18, 0x1Cu);
    }
    v14 = +[ADPreferences sharedPreferences];
    v15 = v14;
    BOOL isMediaEntitySyncDisabled = self->_isMediaEntitySyncDisabled;
  }
  else
  {
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      v19 = "-[ADSyncConfigAssetManager _populateConfiguration]";
      __int16 v20 = 2112;
      CFStringRef v21 = @"siri_audio.media_entity_sync.disablement_status";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Level not found, clearing config: %@", (uint8_t *)&v18, 0x16u);
    }
    self->_BOOL isMediaEntitySyncDisabled = 0;
    v14 = +[ADPreferences sharedPreferences];
    v15 = v14;
    BOOL isMediaEntitySyncDisabled = 0;
  }
  [v14 setIsMediaEntitySyncDisabledSyncConfig:isMediaEntitySyncDisabled];
}

- (void)_registerUpdateHandler
{
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[ADSyncConfigAssetManager _registerUpdateHandler]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Checking for sync config", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003551A8;
  v12[3] = &unk_10050D5C8;
  objc_copyWeak(&v13, (id *)buf);
  id v4 = objc_retainBlock(v12);
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v4;

  client = self->_client;
  int64_t v7 = +[TRINamespace namespaceNameFromId:1280];
  id v8 = [(TRIClient *)client addUpdateHandlerForNamespaceName:v7 queue:self->_queue usingBlock:self->_updateHandler];

  char v9 = self->_client;
  int v10 = +[TRINamespace namespaceNameFromId:424];
  id v11 = [(TRIClient *)v9 addUpdateHandlerForNamespaceName:v10 queue:self->_queue usingBlock:self->_updateHandler];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (id)_initWithTriClient:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADSyncConfigAssetManager;
  uint64_t v6 = [(ADSyncConfigAssetManager *)&v15 init];
  int64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("ADSyncConfigAssetManager", v8);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    [(ADSyncConfigAssetManager *)v7 _registerUpdateHandler];
    id v11 = v7->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003553A4;
    block[3] = &unk_10050E138;
    v14 = v7;
    dispatch_async(v11, block);
  }
  return v7;
}

- (ADSyncConfigAssetManager)init
{
  BOOL v3 = +[TRIClient clientWithIdentifier:133];
  id v4 = [(ADSyncConfigAssetManager *)self _initWithTriClient:v3];

  return v4;
}

+ (id)sharedInstance
{
  if (qword_100586400 != -1) {
    dispatch_once(&qword_100586400, &stru_10050D5A0);
  }
  v2 = (void *)qword_1005863F8;
  return v2;
}

@end