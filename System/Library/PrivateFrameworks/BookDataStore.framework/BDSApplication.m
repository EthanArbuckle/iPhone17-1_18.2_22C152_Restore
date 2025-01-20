@interface BDSApplication
+ (NSString)applicationCacheDirectory;
+ (NSString)applicationDocumentsDirectory;
@end

@implementation BDSApplication

+ (NSString)applicationCacheDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v10 = objc_msgSend_lastObject(v2, v3, v4, v5, v6, v7, v8, v9);

  id v18 = v10;
  if (v18)
  {
    v19 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v11, v12, v13, v14, v15, v16, v17);
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v19, v20, (uint64_t)v18, 1, 0, 0, v21, v22);
  }
  return (NSString *)v18;
}

+ (NSString)applicationDocumentsDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v10 = objc_msgSend_lastObject(v2, v3, v4, v5, v6, v7, v8, v9);

  if (v10)
  {
    id v18 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v11, v12, v13, v14, v15, v16, v17);
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v18, v19, (uint64_t)v10, 1, 0, 0, v20, v21);
  }
  return (NSString *)v10;
}

@end