@interface CSVoiceTriggerAssetHandlerFromFile
- (CSVoiceTriggerAssetHandlerFromFile)init;
- (CSVoiceTriggerAssetHandlerFromFile)initWithDisableOnDeviceCompilation:(BOOL)a3;
- (void)getPreinstallVoiceTriggerAssetForCurrentLocale:(id)a3;
- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4;
@end

@implementation CSVoiceTriggerAssetHandlerFromFile

- (void).cxx_destruct
{
}

- (void)getPreinstallVoiceTriggerAssetForCurrentLocale:(id)a3
{
}

- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = +[CSFPreferences sharedPreferences];
  v9 = [v8 fakeVoiceTriggerAssetPath];

  v10 = [v9 stringByDeletingLastPathComponent];
  v11 = +[NSFileManager defaultManager];
  unsigned int v12 = [v11 fileExistsAtPath:v9];

  if (v12) {
    +[CSAsset assetForAssetType:0 resourcePath:v10 configVersion:@"override-asset" assetProvider:2];
  }
  else {
  v13 = +[CSAsset defaultFallBackAssetForVoiceTrigger];
  }
  if (v13)
  {
    onDeviceCompilationHandler = self->_onDeviceCompilationHandler;
    if (onDeviceCompilationHandler)
    {
      id v17 = 0;
      [(CSOnDeviceCompilationHandler *)onDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:v13 assetType:0 endpointId:v6 errOut:&v17];
      id v15 = v17;
      v16 = CSLogCategoryAsset;
      if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[CSVoiceTriggerAssetHandlerFromFile getVoiceTriggerAssetWithEndpointId:completion:]";
        __int16 v20 = 2112;
        id v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Compile cached asset to onDevice CacheIr with error: %@", buf, 0x16u);
      }
    }
  }
  if (v7) {
    v7[2](v7, v13, 0);
  }
}

- (CSVoiceTriggerAssetHandlerFromFile)init
{
  return [(CSVoiceTriggerAssetHandlerFromFile *)self initWithDisableOnDeviceCompilation:0];
}

- (CSVoiceTriggerAssetHandlerFromFile)initWithDisableOnDeviceCompilation:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CSVoiceTriggerAssetHandlerFromFile;
  v4 = [(CSVoiceTriggerAssetHandler *)&v8 init];
  if (v4)
  {
    if (!a3)
    {
      uint64_t v5 = +[CSOnDeviceCompilationHandler sharedHandler];
      onDeviceCompilationHandler = v4->_onDeviceCompilationHandler;
      v4->_onDeviceCompilationHandler = (CSOnDeviceCompilationHandler *)v5;
    }
    [(CSVoiceTriggerAssetHandlerFromFile *)v4 start];
  }
  return v4;
}

@end