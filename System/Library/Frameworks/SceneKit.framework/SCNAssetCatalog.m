@interface SCNAssetCatalog
+ (id)assetCatalogForResourceURL:(id)a3;
+ (id)assetCatalogNamed:(id)a3;
+ (id)assetCatalogWithURL:(id)a3;
+ (id)objectWithName:(id)a3 class:(Class)a4;
+ (id)recursivePathsForResourcesOfType:(id)a3 inDirectory:(id)a4;
+ (void)clearCache;
- (NSURL)catalogURL;
- (id)URLOfResourceNamed:(id)a3;
- (id)actionNamed:(id)a3;
- (id)animationNamed:(id)a3;
- (id)particleSystemNamed:(id)a3;
- (id)pathByMakingURLRelativeToCatalog:(id)a3;
- (id)sceneNamed:(id)a3;
- (id)sceneWithURL:(id)a3;
- (void)cacheObject:(id)a3 withTimestamp:(double)a4 forKey:(id)a5;
- (void)dealloc;
@end

@implementation SCNAssetCatalog

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNAssetCatalog;
  [(SCNAssetCatalog *)&v3 dealloc];
}

+ (id)assetCatalogNamed:(id)a3
{
  v5 = (__CFString *)[a3 pathExtension];
  if (![(__CFString *)v5 length]) {
    v5 = @"scnasset";
  }
  id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "URLForResource:withExtension:", objc_msgSend(a3, "stringByDeletingPathExtension"), v5);
  if (result)
  {
    return (id)[a1 assetCatalogWithURL:result];
  }
  return result;
}

+ (id)assetCatalogWithURL:(id)a3
{
  v4 = objc_alloc_init(SCNAssetCatalog);
  v4->_catalogURL = (NSURL *)a3;

  return v4;
}

+ (id)assetCatalogForResourceURL:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "path"), "rangeOfString:", @".scnassets");
  if (v6)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "path"), "substringToIndex:", v5 + 10);
    uint64_t v8 = [NSURL fileURLWithPath:v7];
  }
  else
  {
    uint64_t v8 = [a3 URLByDeletingLastPathComponent];
  }

  return (id)[a1 assetCatalogWithURL:v8];
}

- (id)URLOfResourceNamed:(id)a3
{
  db = self->_db;
  if (db)
  {
    id result = [(NSDictionary *)db valueForKey:a3];
    if (!result) {
      return result;
    }
    a3 = result;
  }
  catalogURL = self->_catalogURL;

  return [(NSURL *)catalogURL URLByAppendingPathComponent:a3];
}

- (void)cacheObject:(id)a3 withTimestamp:(double)a4 forKey:(id)a5
{
  if (!self->_cache) {
    self->_cache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  v9 = objc_alloc_init(SCNAssetCatalogCacheEntry);
  [(SCNAssetCatalogCacheEntry *)v9 setItem:a3];
  [(SCNAssetCatalogCacheEntry *)v9 setTimestamp:a4];
  [(NSMutableDictionary *)self->_cache setValue:v9 forKey:a5];
}

- (id)sceneWithURL:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 path];
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_cache valueForKey:v5];
  uint64_t v7 = (SCNScene *)[v6 item];
  double v8 = SCNGetFileTimestampAtURL(a3);
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 timestamp];
      if (v8 == v9) {
        return v7;
      }
      [(NSMutableDictionary *)self->_cache setValue:0 forKey:v5];
    }
  }
  if (a3)
  {
    v11[0] = @"kSceneSourceForceInProcess";
    v11[1] = @"kSceneSourceCheckConsistency";
    v12[0] = MEMORY[0x263EFFA88];
    v12[1] = MEMORY[0x263EFFA80];
    uint64_t v7 = +[SCNScene sceneWithURL:options:error:](SCNScene, "sceneWithURL:options:error:", a3, [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2], 0);
    if (v7) {
      [(SCNAssetCatalog *)self cacheObject:v7 withTimestamp:v5 forKey:v8];
    }
  }
  return v7;
}

- (id)sceneNamed:(id)a3
{
  id v4 = [(SCNAssetCatalog *)self URLOfResourceNamed:a3];

  return [(SCNAssetCatalog *)self sceneWithURL:v4];
}

- (id)animationNamed:(id)a3
{
  uint64_t v5 = -[NSMutableDictionary valueForKey:](self->_cache, "valueForKey:");
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  else
  {
    id v8 = [(SCNAssetCatalog *)self URLOfResourceNamed:a3];
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8];
      uint64_t v6 = objc_msgSend(MEMORY[0x263F08928], "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", objc_opt_class()), v9, 0);
      if (v6) {
        [(SCNAssetCatalog *)self cacheObject:v6 withTimestamp:a3 forKey:0.0];
      }
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (id)actionNamed:(id)a3
{
  uint64_t v5 = -[NSMutableDictionary valueForKey:](self->_cache, "valueForKey:");
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  else
  {
    id v8 = [(SCNAssetCatalog *)self URLOfResourceNamed:a3];
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8];
      uint64_t v6 = objc_msgSend(MEMORY[0x263F08928], "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", objc_opt_class()), v9, 0);
      if (v6) {
        [(SCNAssetCatalog *)self cacheObject:v6 withTimestamp:a3 forKey:0.0];
      }
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (id)particleSystemNamed:(id)a3
{
  uint64_t v5 = -[NSMutableDictionary valueForKey:](self->_cache, "valueForKey:");
  if (v5)
  {
    id v6 = (id)v5;
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  else
  {
    id v6 = [(SCNAssetCatalog *)self URLOfResourceNamed:a3];
    if (v6)
    {
      id v6 = (id)objc_msgSend(MEMORY[0x263F08928], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfFile:", objc_msgSend(v6, "path")), 0);
      if (v6) {
        [(SCNAssetCatalog *)self cacheObject:v6 withTimestamp:a3 forKey:0.0];
      }
    }
  }
  return v6;
}

- (id)pathByMakingURLRelativeToCatalog:(id)a3
{
  id v3 = C3DCopyRelativeFromFolderURL(self->_catalogURL, a3);

  return v3;
}

+ (id)recursivePathsForResourcesOfType:(id)a3 inDirectory:(id)a4
{
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "enumeratorAtPath:", a4);
  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    do
    {
      if (!objc_msgSend((id)objc_msgSend(v9, "pathExtension"), "caseInsensitiveCompare:", a3)) {
        objc_msgSend(v6, "addObject:", objc_msgSend(a4, "stringByAppendingPathComponent:", v9));
      }
      uint64_t v9 = (void *)[v7 nextObject];
    }
    while (v9);
  }

  return v6;
}

+ (void)clearCache
{
  objc_sync_enter(a1);
  [(id)lookUpCache removeAllObjects];

  objc_sync_exit(a1);
}

+ (id)objectWithName:(id)a3 class:(Class)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  if (objectWithName_class__onceToken != -1) {
    dispatch_once(&objectWithName_class__onceToken, &__block_literal_global_84);
  }
  id v7 = +[SCNSceneDatabase lookUpKeyForObjectNamed:a3 class:a4];
  objc_sync_enter(a1);
  uint64_t v8 = (void *)[(id)lookUpCache valueForKey:v7];
  if (!v8)
  {
    uint64_t v9 = objc_msgSend(a1, "recursivePathsForResourcesOfType:inDirectory:", @"scn", objc_msgSend((id)SCNGetResourceBundle(), "bundlePath"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v22;
      uint64_t v12 = *MEMORY[0x263F081D0];
      id v20 = a1;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v15 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v14];
          id v16 = -[SCNKeyedUnarchiver initForReadingWithData:secure:]([SCNKeyedUnarchiver alloc], "initForReadingWithData:secure:", v15, C3DIOShouldActivateSecurityChecks((const __CFURL *)[NSURL fileURLWithPath:v14 isDirectory:0], 0));
          [v16 setClass:objc_opt_class() forClassName:@"SCNScene"];
          [v16 setLookUpKey:v7];
          v17 = (void *)MEMORY[0x263EFFA08];
          v25[0] = objc_opt_class();
          v25[1] = objc_opt_class();
          uint64_t v18 = objc_msgSend(v16, "decodeObjectOfClasses:forKey:", objc_msgSend(v17, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v25, 2)), v12);
          uint64_t v8 = (void *)[v16 lookUpFoundInstance];

          if (v8 && v18)
          {
            a1 = v20;
            [(id)lookUpCache setValue:v8 forKey:v7];
            goto LABEL_18;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        uint64_t v8 = 0;
        a1 = v20;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
LABEL_18:
  objc_sync_exit(a1);
  return v8;
}

id __40__SCNAssetCatalog_objectWithName_class___block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x263EFF9A0]);
  lookUpCache = (uint64_t)result;
  return result;
}

- (NSURL)catalogURL
{
  return self->_catalogURL;
}

@end