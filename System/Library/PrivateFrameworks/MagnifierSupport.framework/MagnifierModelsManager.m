@interface MagnifierModelsManager
+ (id)shared;
- (MagnifierAssetsManager)downloadManager;
- (MagnifierModelsManager)init;
- (NSDictionary)doorAttributesClassifierProperties;
- (NSDictionary)signDetectorProperties;
- (NSURL)doorAttributesClassifierModelPath;
- (NSURL)signDetectorModelPath;
- (void)setDownloadManager:(id)a3;
- (void)updateAssetURLs;
@end

@implementation MagnifierModelsManager

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global);
  }
  v2 = (void *)shared_Manager;
  return v2;
}

void __32__MagnifierModelsManager_shared__block_invoke()
{
  v0 = objc_alloc_init(MagnifierModelsManager);
  v1 = (void *)shared_Manager;
  shared_Manager = (uint64_t)v0;
}

- (MagnifierModelsManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MagnifierModelsManager;
  v2 = [(MagnifierModelsManager *)&v7 init];
  if (v2)
  {
    v3 = +[MagnifierAssetsManager sharedInstance];
    [(MagnifierModelsManager *)v2 setDownloadManager:v3];

    v4 = [(MagnifierModelsManager *)v2 downloadManager];
    [v4 setDelegate:v2];

    v5 = [(MagnifierModelsManager *)v2 downloadManager];
    [v5 refreshAssets];

    [(MagnifierModelsManager *)v2 updateAssetURLs];
  }
  return v2;
}

- (void)updateAssetURLs
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_235640000, v0, v1, "[%@]: Door Attributes Classifier Model Path : %@");
}

- (NSURL)doorAttributesClassifierModelPath
{
  return self->_doorAttributesClassiferUncompiledModelPath;
}

- (NSDictionary)doorAttributesClassifierProperties
{
  return self->_doorAttributesClassifierAssetProperties;
}

- (NSURL)signDetectorModelPath
{
  return self->_signDetectorUncompiledModelPath;
}

- (NSDictionary)signDetectorProperties
{
  return self->_signDetectorAssetProperties;
}

- (MagnifierAssetsManager)downloadManager
{
  return self->_downloadManager;
}

- (void)setDownloadManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_signDetectorAssetProperties, 0);
  objc_storeStrong((id *)&self->_signDetectorUncompiledModelPath, 0);
  objc_storeStrong((id *)&self->_doorAttributesClassifierAssetProperties, 0);
  objc_storeStrong((id *)&self->_doorAttributesClassiferUncompiledModelPath, 0);
}

@end