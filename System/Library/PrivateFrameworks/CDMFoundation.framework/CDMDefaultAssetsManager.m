@interface CDMDefaultAssetsManager
+ (id)getAbsolutePathForAssetsRootFolderForAssetDirPath:(id)a3;
+ (id)getAbsolutePathForLocalizedAssetsRootFolderForAssetDirPath:(id)a3 locale:(id)a4;
- (id)getAbsolutePathForServiceAssetFolders:(id)a3 assetDirPath:(id)a4 locale:(id)a5;
- (id)initManager;
@end

@implementation CDMDefaultAssetsManager

- (void).cxx_destruct
{
}

- (id)getAbsolutePathForServiceAssetFolders:(id)a3 assetDirPath:(id)a4 locale:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = +[CDMDefaultAssetsManager getAbsolutePathForLocalizedAssetsRootFolderForAssetDirPath:a4 locale:a5];
  v10 = +[CDMAssetsUtils findExistFolderInAssetFolders:v8 underBasePath:v9 useFileManager:self->_fileManager];

  if (v10)
  {
    v11 = [v9 stringByAppendingPathComponent:v10];
    v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315394;
      v16 = "-[CDMDefaultAssetsManager getAbsolutePathForServiceAssetFolders:assetDirPath:locale:]";
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s Asset is available under custom asset path %@.", (uint8_t *)&v15, 0x16u);
    }

    v13 = [[CustomAsset alloc] initWithPath:v11];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)initManager
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)CDMDefaultAssetsManager;
  v2 = [(CDMDefaultAssetsManager *)&v7 init];
  if (v2)
  {
    v3 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CDMDefaultAssetsManager initManager]";
      _os_log_impl(&dword_2263A0000, v3, OS_LOG_TYPE_INFO, "%s Initialize CDMDefaultAssetsManager", buf, 0xCu);
    }

    v4 = (NSFileManager *)objc_alloc_init(MEMORY[0x263F08850]);
    fileManager = v2->_fileManager;
    v2->_fileManager = v4;
  }
  return v2;
}

+ (id)getAbsolutePathForLocalizedAssetsRootFolderForAssetDirPath:(id)a3 locale:(id)a4
{
  id v5 = a4;
  v6 = +[CDMDefaultAssetsManager getAbsolutePathForAssetsRootFolderForAssetDirPath:a3];
  objc_super v7 = NSString;
  id v8 = [v5 localeIdentifier];

  v9 = [v7 stringWithFormat:@"%@%@", v8, @".loc"];
  uint64_t v10 = [v6 stringByAppendingPathComponent:v9];

  return v10;
}

+ (id)getAbsolutePathForAssetsRootFolderForAssetDirPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    uint64_t v10 = "+[CDMDefaultAssetsManager getAbsolutePathForAssetsRootFolderForAssetDirPath:]";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_debug_impl(&dword_2263A0000, v4, OS_LOG_TYPE_DEBUG, "%s Existing asset dir path to be: %@.", (uint8_t *)&v9, 0x16u);
  }

  if (!v3)
  {
    id v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      uint64_t v10 = "+[CDMDefaultAssetsManager getAbsolutePathForAssetsRootFolderForAssetDirPath:]";
      _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s Asset dir path is nil. Use value from CDMUserDefaultsUtils instead.", (uint8_t *)&v9, 0xCu);
    }

    id v3 = +[CDMUserDefaultsUtils readCustomAssetsRootPath];
  }
  v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    uint64_t v10 = "+[CDMDefaultAssetsManager getAbsolutePathForAssetsRootFolderForAssetDirPath:]";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s Updated Asset dir path: %@.", (uint8_t *)&v9, 0x16u);
  }

  objc_super v7 = [v3 stringByAppendingPathComponent:@"assets"];

  return v7;
}

@end