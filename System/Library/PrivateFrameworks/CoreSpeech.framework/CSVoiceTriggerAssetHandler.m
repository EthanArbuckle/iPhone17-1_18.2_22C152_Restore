@interface CSVoiceTriggerAssetHandler
+ (id)assetHandlerFactoryWithDisableOnDeviceCompilation:(BOOL)a3;
+ (id)sharedHandler;
+ (id)sharedHandlerDisabledOnDeviceCompilation;
- (CSVoiceTriggerAssetHandler)init;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (id)defaultFallbackModelIfNil:(id)a3;
- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4;
- (void)notifyObservers:(id)a3 endpointId:(id)a4;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSVoiceTriggerAssetHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)notifyObservers:(id)a3 endpointId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052DA4;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100052FD4;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100053078;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)defaultFallbackModelIfNil:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[CSVoiceTriggerAssetHandler defaultFallbackModelIfNil:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Cannot find voicetrigger asset from asset manager, let's fallback to asset in the framework", (uint8_t *)&v9, 0xCu);
    }
    id v5 = +[CSAsset defaultFallBackAssetForVoiceTrigger];
  }
  id v7 = v5;

  return v7;
}

- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[CSVoiceTriggerAssetHandler getVoiceTriggerAssetWithEndpointId:completion:]", "CSVoiceTriggerAssetHandler.m", 98, "NO");
}

- (CSVoiceTriggerAssetHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSVoiceTriggerAssetHandler;
  v2 = [(CSVoiceTriggerAssetHandler *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVoiceTriggerAssetHandler", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;
  }
  return v2;
}

+ (id)assetHandlerFactoryWithDisableOnDeviceCompilation:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[CSUtils isDarwinOS])
  {
    id v4 = objc_alloc_init(CSVoiceTriggerAssetHandlerDarwin);
  }
  else
  {
    uint64_t v5 = +[CSFPreferences sharedPreferences];
    unsigned int v6 = [v5 isVoiceTriggerAssetOverridingEnabled];

    if (v6) {
      id v7 = CSVoiceTriggerAssetHandlerFromFile;
    }
    else {
      id v7 = CSVoiceTriggerAssetHandlerMac;
    }
    id v4 = (CSVoiceTriggerAssetHandlerDarwin *)[[v7 alloc] initWithDisableOnDeviceCompilation:v3];
  }
  return v4;
}

+ (id)sharedHandlerDisabledOnDeviceCompilation
{
  if (qword_1002A3768 != -1) {
    dispatch_once(&qword_1002A3768, &stru_10024F560);
  }
  v2 = (void *)qword_1002A3760;
  return v2;
}

+ (id)sharedHandler
{
  if (qword_1002A3758 != -1) {
    dispatch_once(&qword_1002A3758, &stru_10024F540);
  }
  v2 = (void *)qword_1002A3750;
  return v2;
}

@end