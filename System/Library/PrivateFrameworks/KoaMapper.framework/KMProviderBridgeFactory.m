@interface KMProviderBridgeFactory
+ (void)initialize;
- (KMProviderBridgeFactory)initWithDirectory:(id)a3;
- (id)allInstalledAppBundleIdentifiers;
- (id)bridgeForOriginAppId:(id)a3;
- (id)bridgeForOriginAppId:(id)a3 languageCode:(id)a4;
- (id)globalTermMultiDatasetBridgeWithModifiedOriginAppIds:(id)a3 languageCode:(id)a4;
- (id)intentVocabularyMultiDatasetBridge;
- (void)bootstrapBridgeListenersWithHandler:(id)a3;
@end

@implementation KMProviderBridgeFactory

- (id)intentVocabularyMultiDatasetBridge
{
  v2 = objc_alloc_init(KMIntentVocabularyMultiDatasetBridge);
  return v2;
}

- (void).cxx_destruct
{
}

- (id)allInstalledAppBundleIdentifiers
{
  return +[KMLaunchServicesBridge allInstalledAppBundleIdentifiers];
}

- (void)bootstrapBridgeListenersWithHandler:(id)a3
{
}

- (id)globalTermMultiDatasetBridgeWithModifiedOriginAppIds:(id)a3 languageCode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[KMAppGlobalVocabularyMultiDatasetBridge alloc] initWithModifiedOriginAppIds:v6 languageCode:v5];

  return v7;
}

- (id)bridgeForOriginAppId:(id)a3 languageCode:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    v8 = KMLogContextCore;
    if (!os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    int v12 = 136315394;
    v13 = "-[KMProviderBridgeFactory bridgeForOriginAppId:languageCode:]";
    __int16 v14 = 2112;
    id v15 = 0;
    v9 = "%s invalid language code: %@";
LABEL_15:
    _os_log_error_impl(&dword_22475B000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v12, 0x16u);
    goto LABEL_10;
  }
  if ([v5 isEqual:*MEMORY[0x263F51048]])
  {
    v7 = KMLaunchServicesBridge;
LABEL_8:
    v10 = (void *)[[v7 alloc] initWithLanguageCode:v6];
    goto LABEL_11;
  }
  if ([v5 isEqual:*MEMORY[0x263F51080]])
  {
    v7 = KMLanguageModelBridge;
    goto LABEL_8;
  }
  v8 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315394;
    v13 = "-[KMProviderBridgeFactory bridgeForOriginAppId:languageCode:]";
    __int16 v14 = 2112;
    id v15 = v5;
    v9 = "%s Unexpected originAppId: \"%@\" for localized single-dataset bridge";
    goto LABEL_15;
  }
LABEL_10:
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)bridgeForOriginAppId:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqual:*MEMORY[0x263F51050]])
  {
    id v5 = KMCalendarEventBridge;
LABEL_15:
    id v6 = (KMContactStoreBridge *)objc_alloc_init(v5);
    goto LABEL_16;
  }
  if ([v4 isEqual:*MEMORY[0x263F51060]])
  {
    id v6 = [[KMContactStoreBridge alloc] initWithDirectory:self->_directory];
LABEL_16:
    v7 = v6;
    goto LABEL_17;
  }
  if ([v4 isEqual:*MEMORY[0x263F51068]])
  {
    id v5 = KMCoreRoutineBridge;
    goto LABEL_15;
  }
  if ([v4 isEqual:*MEMORY[0x263F51078]])
  {
    id v5 = KMHomeManagerBridge;
    goto LABEL_15;
  }
  if ([v4 isEqual:*MEMORY[0x263F51088]])
  {
    id v5 = KMPortraitEntitiesBridge;
    goto LABEL_15;
  }
  if ([v4 isEqual:*MEMORY[0x263F51058]])
  {
    id v5 = KMRadioStationBridge;
    goto LABEL_15;
  }
  if ([v4 isEqual:*MEMORY[0x263F51070]])
  {
    id v5 = KMFindMySyncDevicesBridge;
    goto LABEL_15;
  }
  v9 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315394;
    v11 = "-[KMProviderBridgeFactory bridgeForOriginAppId:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_error_impl(&dword_22475B000, v9, OS_LOG_TYPE_ERROR, "%s Unexpected originAppId: \"%@\" for unlocalized single-dataset bridge", (uint8_t *)&v10, 0x16u);
  }
  v7 = 0;
LABEL_17:

  return v7;
}

- (KMProviderBridgeFactory)initWithDirectory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KMProviderBridgeFactory;
  id v6 = [(KMProviderBridgeFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_directory, a3);
  }

  return v7;
}

+ (void)initialize
{
  if (KMLogInit_onceToken != -1) {
    dispatch_once(&KMLogInit_onceToken, &__block_literal_global_116);
  }
}

@end