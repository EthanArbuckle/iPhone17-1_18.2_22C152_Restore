@interface CDMNLAssetCollection
+ (id)assetCollectionWithAssetPaths:(id)a3 withLanguageCode:(id)a4;
- (NSDictionary)assetPaths;
- (NSString)languageCode;
- (id)_initWithAssetPaths:(id)a3 withLanguageCode:(id)a4;
- (id)getAssetBundlePathForFactorName:(id)a3;
- (id)getAssetForFactorName:(id)a3;
- (id)getAssetPaths;
@end

@implementation CDMNLAssetCollection

- (NSDictionary)assetPaths
{
  return self->_assetPaths;
}

+ (id)assetCollectionWithAssetPaths:(id)a3 withLanguageCode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[CDMNLAssetCollection alloc] _initWithAssetPaths:v6 withLanguageCode:v5];

  return v7;
}

- (id)_initWithAssetPaths:(id)a3 withLanguageCode:(id)a4
{
  id v7 = a3;
  v8 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)CDMNLAssetCollection;
  v9 = [(CDMNLAssetCollection *)&v13 init];
  v10 = v9;
  if (v7) {
    objc_storeStrong((id *)&v9->_assetPaths, a3);
  }
  languageCode = v10->_languageCode;
  v10->_languageCode = v8;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPaths, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (id)getAssetPaths
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  assetPaths = self->_assetPaths;
  if (!assetPaths)
  {
    v4 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "-[CDMNLAssetCollection getAssetPaths]";
      _os_log_impl(&dword_2263A0000, v4, OS_LOG_TYPE_INFO, "%s [WARN]: Nil Asset Paths", (uint8_t *)&v6, 0xCu);
    }

    assetPaths = self->_assetPaths;
  }
  return assetPaths;
}

- (id)getAssetBundlePathForFactorName:(id)a3
{
  assetPaths = self->_assetPaths;
  if (assetPaths)
  {
    v4 = [(NSDictionary *)assetPaths objectForKey:a3];
    id v5 = [v4 getAssetPath];
    if (v5)
    {
      int v6 = [MEMORY[0x263F086E0] bundleWithPath:v5];
    }
    else
    {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (id)getAssetForFactorName:(id)a3
{
  assetPaths = self->_assetPaths;
  if (assetPaths)
  {
    assetPaths = [assetPaths objectForKey:a3];
  }
  return assetPaths;
}

@end