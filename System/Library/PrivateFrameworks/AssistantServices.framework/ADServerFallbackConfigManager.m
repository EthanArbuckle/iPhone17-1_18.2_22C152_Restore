@interface ADServerFallbackConfigManager
+ (id)sharedInstance;
- (ADServerFallbackConfigManager)init;
- (BOOL)_shouldDisableServerFallbackABForDomainDirected:(BOOL)a3;
- (BOOL)assistantSyncDisabled;
- (BOOL)shouldDisableAssistantSync;
- (BOOL)shouldDisableServerFallbackDomain;
- (BOOL)shouldDisableServerFallbackNL;
- (OS_dispatch_queue)queue;
- (id)updateHandler;
- (void)_populateConfiguration;
- (void)_registerUpdateHandler;
- (void)setQueue:(id)a3;
- (void)setShouldDisableAssistantSync:(BOOL)a3;
- (void)setShouldDisableServerFallbackDomain:(BOOL)a3;
- (void)setShouldDisableServerFallbackNL:(BOOL)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation ADServerFallbackConfigManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_siriUnderstandingClient, 0);
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

- (void)setShouldDisableAssistantSync:(BOOL)a3
{
  self->_shouldDisableAssistantSync = a3;
}

- (BOOL)shouldDisableAssistantSync
{
  return self->_shouldDisableAssistantSync;
}

- (void)setShouldDisableServerFallbackDomain:(BOOL)a3
{
  self->_shouldDisableServerFallbackDomain = a3;
}

- (BOOL)shouldDisableServerFallbackDomain
{
  return self->_shouldDisableServerFallbackDomain;
}

- (void)setShouldDisableServerFallbackNL:(BOOL)a3
{
  self->_shouldDisableServerFallbackNL = a3;
}

- (BOOL)shouldDisableServerFallbackNL
{
  return self->_shouldDisableServerFallbackNL;
}

- (BOOL)_shouldDisableServerFallbackABForDomainDirected:(BOOL)a3
{
  v4 = @"disableFallbackNL";
  if (a3) {
    v4 = @"disableFallbackDomain";
  }
  v5 = v4;
  v6 = [(TRIClient *)self->_siriUnderstandingClient levelForFactor:v5 withNamespaceName:@"SIRI_UNDERSTANDING_CLASSIC_DEPRECATION"];
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    CFStringRef v8 = @"YES";
    int v11 = 136315906;
    v12 = "-[ADServerFallbackConfigManager _shouldDisableServerFallbackABForDomainDirected:]";
    if (!v6) {
      CFStringRef v8 = @"NO";
    }
    __int16 v13 = 2112;
    v14 = v5;
    __int16 v15 = 2112;
    CFStringRef v16 = @"SIRI_UNDERSTANDING_CLASSIC_DEPRECATION";
    __int16 v17 = 2112;
    CFStringRef v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Getting level information from trial for factor = %@, namespace = %@, level is not nil = %@", (uint8_t *)&v11, 0x2Au);
  }
  if (v6)
  {
    if ([v6 levelOneOfCase] == 10) {
      unsigned __int8 v9 = [v6 BOOLeanValue];
    }
    else {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (void)_populateConfiguration
{
  self->_BOOL shouldDisableServerFallbackDomain = [(ADServerFallbackConfigManager *)self _shouldDisableServerFallbackABForDomainDirected:1];
  v3 = +[ADPreferences sharedPreferences];
  [v3 setShouldDisableServerFallbackDomain:self->_shouldDisableServerFallbackDomain];

  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    BOOL shouldDisableServerFallbackDomain = self->_shouldDisableServerFallbackDomain;
    int v15 = 136315394;
    CFStringRef v16 = "-[ADServerFallbackConfigManager _populateConfiguration]";
    __int16 v17 = 1024;
    LODWORD(v18) = shouldDisableServerFallbackDomain;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Updating value for _shouldDisableServerFallbackDomain config-> %d", (uint8_t *)&v15, 0x12u);
  }
  self->_BOOL shouldDisableServerFallbackNL = [(ADServerFallbackConfigManager *)self _shouldDisableServerFallbackABForDomainDirected:0];
  v6 = +[ADPreferences sharedPreferences];
  [v6 setShouldDisableServerFallbackNL:self->_shouldDisableServerFallbackNL];

  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    BOOL shouldDisableServerFallbackNL = self->_shouldDisableServerFallbackNL;
    int v15 = 136315394;
    CFStringRef v16 = "-[ADServerFallbackConfigManager _populateConfiguration]";
    __int16 v17 = 1024;
    LODWORD(v18) = shouldDisableServerFallbackNL;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Updating value for _shouldDisableServerFallbackNL config-> %d", (uint8_t *)&v15, 0x12u);
  }
  unsigned __int8 v9 = [(TRIClient *)self->_siriUnderstandingClient levelForFactor:@"disableAssistantSync" withNamespaceName:@"SIRI_UNDERSTANDING_CLASSIC_DEPRECATION"];
  v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    CFStringRef v11 = @"YES";
    int v15 = 136315906;
    CFStringRef v16 = "-[ADServerFallbackConfigManager _populateConfiguration]";
    if (!v9) {
      CFStringRef v11 = @"NO";
    }
    __int16 v17 = 2112;
    CFStringRef v18 = @"disableAssistantSync";
    __int16 v19 = 2112;
    CFStringRef v20 = @"SIRI_UNDERSTANDING_CLASSIC_DEPRECATION";
    __int16 v21 = 2112;
    CFStringRef v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Getting level information from trial for factor = %@, namespace = %@, level is not nil = %@", (uint8_t *)&v15, 0x2Au);
  }
  self->_unsigned int shouldDisableAssistantSync = 0;
  if (v9)
  {
    if ([v9 levelOneOfCase] == 10)
    {
      unsigned int shouldDisableAssistantSync = [v9 BOOLeanValue];
      self->_unsigned int shouldDisableAssistantSync = shouldDisableAssistantSync;
    }
    else
    {
      unsigned int shouldDisableAssistantSync = self->_shouldDisableAssistantSync;
    }
  }
  else
  {
    unsigned int shouldDisableAssistantSync = 0;
  }
  __int16 v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315394;
    CFStringRef v16 = "-[ADServerFallbackConfigManager _populateConfiguration]";
    __int16 v17 = 1024;
    LODWORD(v18) = shouldDisableAssistantSync;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Updating value for _shouldDisableAssistantSync config-> %d", (uint8_t *)&v15, 0x12u);
    unsigned int shouldDisableAssistantSync = self->_shouldDisableAssistantSync;
  }
  if (shouldDisableAssistantSync)
  {
    v14 = +[ADPreferences sharedPreferences];
    [v14 setIsSyncDisabledForFullUoDDevices:1];
  }
}

- (void)_registerUpdateHandler
{
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[ADServerFallbackConfigManager _registerUpdateHandler]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Registering update handler for ADServerFallbackConfigManager", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012D264;
  v7[3] = &unk_10050D5C8;
  objc_copyWeak(&v8, (id *)buf);
  v4 = objc_retainBlock(v7);
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v4;

  id v6 = [(TRIClient *)self->_siriUnderstandingClient addUpdateHandlerForNamespaceName:@"SIRI_UNDERSTANDING_CLASSIC_DEPRECATION" queue:self->_queue usingBlock:self->_updateHandler];
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (BOOL)assistantSyncDisabled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10012D3F4;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (ADServerFallbackConfigManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)ADServerFallbackConfigManager;
  v2 = [(ADServerFallbackConfigManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[TRIClient clientWithIdentifier:115];
    siriUnderstandingClient = v2->_siriUnderstandingClient;
    v2->_siriUnderstandingClient = (TRIClient *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("ADServerFallbackConfigManager", v5);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    [(ADServerFallbackConfigManager *)v2 _registerUpdateHandler];
    uint64_t v8 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012D520;
    block[3] = &unk_10050E138;
    CFStringRef v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100585C50 != -1) {
    dispatch_once(&qword_100585C50, &stru_100502EA0);
  }
  v2 = (void *)qword_100585C48;
  return v2;
}

@end