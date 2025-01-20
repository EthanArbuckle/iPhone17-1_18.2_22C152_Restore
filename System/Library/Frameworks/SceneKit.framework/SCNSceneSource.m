@interface SCNSceneSource
+ (BOOL)_shouldCacheWithOptions:(id)a3;
+ (SCNSceneSource)sceneSourceWithData:(NSData *)data options:(NSDictionary *)options;
+ (SCNSceneSource)sceneSourceWithURL:(NSURL *)url options:(NSDictionary *)options;
+ (id)_cachedSceneSourceForURL:(id)a3 options:(id)a4;
+ (id)sceneFileTypes;
+ (id)sceneTypes;
+ (void)_cacheSceneSource:(id)a3 forURL:(id)a4 options:(id)a5;
+ (void)_removeCachedSceneSourceIfNeededForURL:(id)a3;
- (BOOL)_appendToEntries:(id)a3 entriesWithType:(unint64_t)a4 passingTest:(id)a5 entryObjectConstructor:(id)a6;
- (BOOL)canExportToColladaWithNoDataLoss;
- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5;
- (NSArray)entriesPassingTest:(void *)predicate;
- (NSArray)identifiersOfEntriesWithClass:(Class)entryClass;
- (NSData)data;
- (NSString)description;
- (NSURL)url;
- (SCNScene)sceneWithOptions:(NSDictionary *)options error:(NSError *)error;
- (SCNScene)sceneWithOptions:(NSDictionary *)options statusHandler:(SCNSceneSourceStatusHandler)statusHandler;
- (SCNSceneSource)initWithData:(NSData *)data options:(NSDictionary *)options;
- (SCNSceneSource)initWithURL:(NSURL *)url options:(NSDictionary *)options;
- (__C3DLibrary)library;
- (__C3DScene)_createSceneRefWithOptions:(id)a3 statusHandler:(id)a4;
- (__C3DSceneSource)sceneSourceRef;
- (id)_sceneWithClass:(Class)a3 options:(id)a4 statusHandler:(id)a5;
- (id)c3dDataRepresentation;
- (id)copyPropertiesAtIndex:(int64_t)a3 options:(id)a4;
- (id)debugQuickLookData;
- (id)debugQuickLookObject;
- (id)entryWithIdentifier:(NSString *)uid withClass:(Class)entryClass;
- (id)performConsistencyCheck;
- (id)propertyForKey:(NSString *)key;
- (id)sceneAtIndex:(unint64_t)a3 options:(id)a4;
- (id)sceneAtIndex:(unint64_t)a3 options:(id)a4 error:(id *)a5;
- (id)sceneSourceOptions;
- (id)sceneWithClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)sceneWithClass:(Class)a3 options:(id)a4 statusHandler:(id)a5;
- (int64_t)sceneCount;
- (int64_t)sourceStatus;
- (void)dealloc;
@end

@implementation SCNSceneSource

- (SCNSceneSource)initWithData:(NSData *)data options:(NSDictionary *)options
{
  v8.receiver = self;
  v8.super_class = (Class)SCNSceneSource;
  v6 = [(SCNSceneSource *)&v8 init];
  if (v6)
  {
    v6->_sceneSourceOptions = options;
    v6->_sceneSource = (__C3DSceneSource *)C3DSceneSourceCreateWithData(data);
  }
  return v6;
}

+ (BOOL)_shouldCacheWithOptions:(id)a3
{
  v3 = (void *)[a3 objectForKey:@"kSceneSourceCacheScenesByURLKey"];

  return [v3 BOOLValue];
}

- (id)sceneSourceOptions
{
  return self->_sceneSourceOptions;
}

+ (id)_cachedSceneSourceForURL:(id)a3 options:(id)a4
{
  objc_sync_enter(a1);
  if (a3)
  {
    if (![a1 _shouldCacheWithOptions:a4]
      || (v7 = (void *)[(id)_sceneSourceCache objectForKey:a3], (a3 = v7) == 0)
      || (id v8 = (id)[v7 sceneSourceOptions], v8 != a4)
      && (!a4 || ([v8 isEqualToDictionary:a4] & 1) == 0))
    {
      a3 = 0;
    }
  }
  objc_sync_exit(a1);
  return a3;
}

+ (void)_cacheSceneSource:(id)a3 forURL:(id)a4 options:(id)a5
{
  objc_sync_enter(a1);
  if ([a1 _shouldCacheWithOptions:a5])
  {
    v9 = (void *)_sceneSourceCache;
    if (!_sceneSourceCache)
    {
      v9 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0x10000 valueOptions:5 capacity:32];
      _sceneSourceCache = (uint64_t)v9;
    }
    [v9 setObject:a3 forKey:a4];
  }

  objc_sync_exit(a1);
}

+ (void)_removeCachedSceneSourceIfNeededForURL:(id)a3
{
  objc_sync_enter(a1);
  if (a3) {
    [(id)_sceneSourceCache removeObjectForKey:a3];
  }

  objc_sync_exit(a1);
}

- (SCNSceneSource)initWithURL:(NSURL *)url options:(NSDictionary *)options
{
  uint64_t v7 = [(id)objc_opt_class() _cachedSceneSourceForURL:url options:options];
  if (v7)
  {
    id v10 = (id)v7;

    return (SCNSceneSource *)v10;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SCNSceneSource;
    v9 = [(SCNSceneSource *)&v11 init];
    if (v9)
    {
      v9->_sceneSourceOptions = options;
      v9->_sceneSource = (__C3DSceneSource *)C3DSceneSourceCreateWithURL(url);
      [(id)objc_opt_class() _cacheSceneSource:v9 forURL:url options:options];
    }
    return v9;
  }
}

- (void)dealloc
{
  if (self->_sceneSource)
  {
    objc_msgSend((id)objc_opt_class(), "_removeCachedSceneSourceIfNeededForURL:", -[SCNSceneSource url](self, "url"));
    CFRelease(self->_sceneSource);
  }
  lastLoadedScene = self->_lastLoadedScene;
  if (lastLoadedScene) {
    CFRelease(lastLoadedScene);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNSceneSource;
  [(SCNSceneSource *)&v4 dealloc];
}

+ (SCNSceneSource)sceneSourceWithURL:(NSURL *)url options:(NSDictionary *)options
{
  if (url)
  {
    objc_super v4 = (void *)[objc_alloc((Class)a1) initWithURL:url options:options];
    return (SCNSceneSource *)v4;
  }
  else
  {
    NSLog(&cfstr_Scnscenesource_2.isa, a2, 0, options);
    return 0;
  }
}

+ (SCNSceneSource)sceneSourceWithData:(NSData *)data options:(NSDictionary *)options
{
  objc_super v4 = (void *)[objc_alloc((Class)a1) initWithData:data options:options];

  return (SCNSceneSource *)v4;
}

- (NSURL)url
{
  return (NSURL *)C3DSceneSourceGetURL((uint64_t)self->_sceneSource);
}

- (NSData)data
{
  return (NSData *)C3DSceneSourceGetData((uint64_t)self->_sceneSource);
}

- (int64_t)sceneCount
{
  return C3DSceneSourceGetSceneCount();
}

- (NSString)description
{
  v3 = [(SCNSceneSource *)self url];
  objc_super v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  if (v3) {
    return (NSString *)[v4 stringWithFormat:@"<%@: %p | URL='%@'>", v6, self, -[SCNSceneSource url](self, "url")];
  }
  else {
    return (NSString *)[v4 stringWithFormat:@"<%@: %p>", v6, self, v8];
  }
}

- (id)sceneAtIndex:(unint64_t)a3 options:(id)a4
{
  v6 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a4];
  objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3), @"kSceneSourceSceneIndexKey");

  return [(SCNSceneSource *)self sceneWithOptions:v6 error:0];
}

- (id)sceneAtIndex:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v8 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a4];
  objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3), @"kSceneSourceSceneIndexKey");

  return [(SCNSceneSource *)self sceneWithOptions:v8 error:a5];
}

- (__C3DScene)_createSceneRefWithOptions:(id)a3 statusHandler:(id)a4
{
  v5 = (NSDictionary *)a3;
  if (a3 && [a3 objectForKey:@"kSceneSourceSceneIndexKey"]) {
    uint64_t v7 = objc_msgSend(-[NSDictionary objectForKey:](v5, "objectForKey:", @"kSceneSourceSceneIndexKey"), "unsignedIntegerValue");
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(SCNSceneSource *)self url];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __59__SCNSceneSource__createSceneRefWithOptions_statusHandler___block_invoke;
  v23 = &unk_264008D18;
  v24 = v8;
  id v25 = a4;
  if (v8)
  {
    v9 = v8;
    if (!-[NSString isEqualToString:](-[NSString lowercaseString](-[NSURL pathExtension](v8, "pathExtension", v20, v21, v22, v23, v24, v25), "lowercaseString"), "isEqualToString:", @"dae")|| objc_msgSend(-[NSDictionary valueForKey:](v5, "valueForKey:", @"SCNSceneSourceUseModelIOToLoadDAEFiles"), "BOOLValue"))
    {
      if (objc_msgSend(MEMORY[0x263F135E8], "canImportFileExtension:", -[NSURL pathExtension](v9, "pathExtension")))
      {
        if (objc_msgSend(-[NSDictionary valueForKey:](v5, "valueForKey:", @"triggerOptionsForRealtimeViewer"), "BOOLValue"))
        {
          if (v5) {
            id v10 = (NSDictionary *)(id)[(NSDictionary *)v5 mutableCopy];
          }
          else {
            id v10 = (NSDictionary *)[MEMORY[0x263EFF9A0] dictionary];
          }
          v5 = v10;
          uint64_t v11 = MEMORY[0x263EFFA88];
          [(NSDictionary *)v10 setValue:MEMORY[0x263EFFA88] forKey:@"kSceneSourceCreateCameraIfAbsent"];
          [(NSDictionary *)v5 setValue:v11 forKey:@"kSceneSourceCreateNormalsIfAbsent"];
          [(NSDictionary *)v5 setValue:v11 forKey:@"kSceneSourceCreateLightIfAbsent"];
          [(NSDictionary *)v5 setValue:v11 forKey:@"kSceneSourceAdjustInvalidClippingPlanes"];
          [(NSDictionary *)v5 setValue:v11 forKey:@"kSceneSourceFlattenScene"];
          [(NSDictionary *)v5 setValue:v11 forKey:0x26BF72418];
          [(NSDictionary *)v5 setValue:@"playUsingSceneTime" forKey:@"kSceneSourceAnimationLoadingMode"];
        }
        +[SCNTransaction begin];
        +[SCNTransaction setImmediateMode:1];
        MDLAssetWithURL = loadMDLAssetWithURL(v9, v5);
        v13 = [(SCNScene *)MDLAssetWithURL sceneRef];
        if (v13)
        {
          SceneAtIndex = v13;
          CFRetain(v13);
          [(SCNScene *)MDLAssetWithURL _clearSceneRef];
          +[SCNTransaction commit];
          +[SCNTransaction flush];
          C3DIOFinalizeLoadScene((uint64_t)SceneAtIndex, 0, (const __CFDictionary *)v5, 0, -1);
          [(SCNNode *)[(SCNScene *)MDLAssetWithURL rootNode] _syncObjCModelAfterC3DIOSceneLoadingWithNodeRef:C3DSceneGetRootNode((uint64_t)SceneAtIndex)];
          if (v7) {
            goto LABEL_21;
          }
          goto LABEL_19;
        }
        [(SCNScene *)MDLAssetWithURL _clearSceneRef];
        +[SCNTransaction commit];
      }
    }
  }
  SceneAtIndex = (__C3DScene *)C3DSceneSourceCreateSceneAtIndex(self->_sceneSource, v7, (const __CFDictionary *)v5, (uint64_t)&v20);
  if (v7) {
    goto LABEL_21;
  }
LABEL_19:
  if (SceneAtIndex) {
    self->_sceneLoaded = 1;
  }
LABEL_21:
  lastLoadedScene = self->_lastLoadedScene;
  if (lastLoadedScene != SceneAtIndex)
  {
    if (lastLoadedScene) {
      CFRelease(lastLoadedScene);
    }
    self->_lastLoadedScene = SceneAtIndex;
    if (SceneAtIndex)
    {
      int v16 = [(id)objc_opt_class() _shouldCacheWithOptions:v5];
      v17 = self->_lastLoadedScene;
      if (v16) {
        self->_lastLoadedScene = (__C3DScene *)C3DSceneCreateCopy((uint64_t)v17);
      }
      else {
        CFRetain(v17);
      }
    }
  }
  lastOptions = self->_lastOptions;
  if (lastOptions != v5)
  {

    self->_lastOptions = v5;
  }
  return SceneAtIndex;
}

uint64_t __59__SCNSceneSource__createSceneRefWithOptions_statusHandler___block_invoke(uint64_t a1, int a2, CFErrorRef err, uint64_t a4, float a5)
{
  v33[1] = *MEMORY[0x263EF8340];
  if (a2 != -1) {
    goto LABEL_2;
  }
  if (!err)
  {
    uint64_t v32 = *MEMORY[0x263F08320];
    v33[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"Failed to retrieve scene from XPC service.", &stru_26BF72F58, 0);
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    int v16 = (void *)MEMORY[0x263F087E8];
    v17 = @"SCNKitErrorDomain";
    uint64_t v18 = 0;
LABEL_24:
    v23 = (__CFError *)[v16 errorWithDomain:v17 code:v18 userInfo:v15];
    goto LABEL_25;
  }
  CFErrorDomain Domain = CFErrorGetDomain(err);
  if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x263EFFC60]))
  {
    if (!*(void *)(a1 + 32))
    {
LABEL_2:
      v9 = 0;
      goto LABEL_26;
    }
    v12 = (void *)MEMORY[0x263F087E8];
    v13 = (__CFString *)*MEMORY[0x263F08438];
    CFIndex Code = CFErrorGetCode(err);
    uint64_t v15 = [NSDictionary dictionaryWithObject:*(void *)(a1 + 32) forKey:*MEMORY[0x263F08590]];
    int v16 = v12;
    v17 = v13;
    uint64_t v18 = Code;
    goto LABEL_24;
  }
  CFErrorDomain v19 = CFErrorGetDomain(err);
  if (CFEqual(v19, @"SCNKitErrorDomain"))
  {
    CFStringRef v20 = (id)CFErrorCopyRecoverySuggestion(err);
    CFDictionaryRef v21 = CFErrorCopyUserInfo(err);
    if (*(void *)(a1 + 32)) {
      uint64_t v22 = [NSString stringWithFormat:objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"The document \"%@\" could not be opened.", &stru_26BF72F58, 0), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "path"), "lastPathComponent")];
    }
    else {
      uint64_t v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"The document data could not be read.", &stru_26BF72F58, 0);
    }
    uint64_t v24 = *MEMORY[0x263F08320];
    id v25 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", v22, *MEMORY[0x263F08320], v20, *MEMORY[0x263F08348], 0);
    v26 = v25;
    uint64_t v27 = *(void *)(a1 + 32);
    if (v27) {
      [v25 setObject:v27 forKeyedSubscript:*MEMORY[0x263F08590]];
    }
    uint64_t v28 = [(__CFDictionary *)v21 objectForKey:@"SCNDetailedErrorsKey"];
    if (v28) {
      [v26 setObject:v28 forKey:@"SCNDetailedErrorsKey"];
    }
    int v29 = CFErrorGetCode(err);
    switch(v29)
    {
      case -8:
        objc_msgSend(v26, "setObject:forKeyedSubscript:", -[__CFDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", *MEMORY[0x263EFFC70]), v24);
        int v16 = (void *)MEMORY[0x263F087E8];
        v17 = (__CFString *)*MEMORY[0x263F07F70];
        uint64_t v18 = 4864;
        break;
      case -6:
      case -5:
      case 1:
        int v16 = (void *)MEMORY[0x263F087E8];
        v17 = (__CFString *)*MEMORY[0x263F07F70];
        uint64_t v18 = 259;
        break;
      case -1:
        objc_msgSend(v26, "setObject:forKeyedSubscript:", -[__CFDictionary objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", *MEMORY[0x263EFFC70]), v24);
        int v16 = (void *)MEMORY[0x263F087E8];
        v17 = (__CFString *)*MEMORY[0x263F07F70];
        uint64_t v18 = 260;
        break;
      default:
        v30 = scn_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          __59__SCNSceneSource__createSceneRefWithOptions_statusHandler___block_invoke_cold_1(v29, v30);
        }
        goto LABEL_2;
    }
    uint64_t v15 = (uint64_t)v26;
    goto LABEL_24;
  }
  CFRetain(err);
  v23 = err;
LABEL_25:
  v9 = v23;
LABEL_26:
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, __CFError *, uint64_t, float))(result + 16))(result, a2, v9, a4, a5);
  }
  return result;
}

- (id)_sceneWithClass:(Class)a3 options:(id)a4 statusHandler:(id)a5
{
  v34[2] = *MEMORY[0x263EF8340];
  if (![(objc_class *)a3 isSubclassOfClass:objc_opt_class()]) {
    return 0;
  }
  if (!a4) {
    a4 = (id)[NSDictionary dictionary];
  }
  if (self->_lastLoadedScene && [a4 isEqual:self->_lastOptions])
  {
    ObjCWrapper = (id *)objc_msgSend(MEMORY[0x263F08928], "unarchiveObjectWithData:", objc_msgSend(MEMORY[0x263F08910], "archivedDataWithRootObject:requiringSecureCoding:error:", C3DEntityGetObjCWrapper((id *)self->_lastLoadedScene), 0, 0));
    [ObjCWrapper setSceneSource:self];
    return ObjCWrapper;
  }
  URL = (void *)C3DSceneSourceGetURL((uint64_t)self->_sceneSource);
  Data = (void *)C3DSceneSourceGetData((uint64_t)self->_sceneSource);
  int v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(URL, "pathExtension"), "lowercaseString"), "isEqualToString:", @"scnz");
  if ((objc_msgSend((id)objc_msgSend(a4, "valueForKey:", @"kSceneSourceFormat"), "isEqualToString:", @"scn") & 1) != 0|| ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(URL, "pathExtension"), "lowercaseString"), "isEqualToString:", @"scn") | v12) & 1) != 0|| (unint64_t)objc_msgSend(Data, "length") >= 7&& !strncmp((const char *)objc_msgSend(Data, "bytes"), "bplist", 6uLL))
  {
    uint64_t v33 = 0;
    if (!Data)
    {
      Data = (void *)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:URL options:0 error:&v33];
      if (!Data)
      {
        if (a5)
        {
          char v32 = 1;
          (*((void (**)(id, uint64_t, uint64_t, char *, float))a5 + 2))(a5, -1, v33, &v32, 1.0);
        }
        return 0;
      }
    }
    if (v12)
    {
      Data = objc_msgSend(Data, "scn_uncompressedDataUsingCompressionAlgorithm:", 517);
      if (!Data) {
        return 0;
      }
    }
    id v13 = [[SCNKeyedUnarchiver alloc] initForReadingWithData:Data secure:C3DIOShouldActivateSecurityChecks((const __CFURL *)URL, (CFDictionaryRef)a4)];
    v14 = v13;
    if (v13)
    {
      context = (void *)MEMORY[0x210535ED0]([v13 setDelegate:self]);
      if (URL)
      {
        cf = C3DIOCreateImportContextFromOptions((CFDictionaryRef)a4, (const __CFURL *)URL);
        [v14 setContext:cf];
        objc_msgSend(v14, "setAssetCatalog:", +[SCNAssetCatalog assetCatalogForResourceURL:](SCNAssetCatalog, "assetCatalogForResourceURL:", URL));
        [v14 setDocumentURL:URL];
      }
      else
      {
        cf = 0;
      }
      if ((Class)objc_opt_class() != a3)
      {
        uint64_t v15 = (objc_class *)objc_opt_class();
        [v14 setClass:a3 forClassName:NSStringFromClass(v15)];
      }
      int v16 = (void *)MEMORY[0x263EFFA08];
      v34[0] = objc_opt_class();
      v34[1] = objc_opt_class();
      uint64_t v17 = objc_msgSend(v16, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v34, 2));
      uint64_t v18 = [v14 decodeObjectOfClasses:v17 forKey:*MEMORY[0x263F081D0]];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CFErrorDomain v19 = (void *)v18;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFErrorDomain v19 = (void *)[(objc_class *)a3 scene];
          objc_msgSend((id)objc_msgSend(v19, "rootNode"), "addChildNode:", v18);
        }
        else
        {
          CFStringRef v20 = scn_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[SCNSceneSource _sceneWithClass:options:statusHandler:]();
          }
          CFErrorDomain v19 = 0;
        }
      }
      id v21 = v19;
      [v14 finishDecoding];

      if (cf) {
        CFRelease(cf);
      }
      if (v19)
      {
        self->_sceneLoaded = 1;
        lastLoadedScene = self->_lastLoadedScene;
        if (lastLoadedScene) {
          CFRelease(lastLoadedScene);
        }
        v23 = (__C3DScene *)[v19 sceneRef];
        self->_lastLoadedScene = v23;
        if (v23)
        {
          int v24 = [(id)objc_opt_class() _shouldCacheWithOptions:a4];
          id v25 = self->_lastLoadedScene;
          if (v24) {
            self->_lastLoadedScene = (__C3DScene *)C3DSceneCreateCopy((uint64_t)v25);
          }
          else {
            CFRetain(v25);
          }
        }
        lastOptions = self->_lastOptions;
        if (lastOptions != a4)
        {

          self->_lastOptions = (NSDictionary *)a4;
        }
        [v19 setSceneSource:self];
        return v19;
      }
    }
  }
  uint64_t v27 = [(SCNSceneSource *)self _createSceneRefWithOptions:a4 statusHandler:a5];
  uint64_t v28 = v27;
  if (!v27) {
    return 0;
  }
  ObjCWrapper = C3DEntityGetObjCWrapper((id *)v27);
  if (!ObjCWrapper) {
    ObjCWrapper = (id *)[(objc_class *)a3 sceneWithSceneRef:v28];
  }
  CFRelease(v28);
  [ObjCWrapper setSceneSource:self];
  return ObjCWrapper;
}

- (id)sceneWithClass:(Class)a3 options:(id)a4 statusHandler:(id)a5
{
  int v9 = sceneWithClass_options_statusHandler__nestCounter;
  int v10 = sceneWithClass_options_statusHandler__nestCounter;
  if (sceneWithClass_options_statusHandler__nestCounter <= 0)
  {
    kdebug_trace();
    int v10 = sceneWithClass_options_statusHandler__nestCounter;
  }
  sceneWithClass_options_statusHandler__nestCounter = v10 + 1;
  id v11 = [(SCNSceneSource *)self _sceneWithClass:a3 options:a4 statusHandler:a5];
  int v12 = [(SCNSceneSource *)self url];
  if (v12) {
    [v11 _setSourceURL:v12];
  }
  --sceneWithClass_options_statusHandler__nestCounter;
  if (v9 <= 0) {
    kdebug_trace();
  }
  return v11;
}

- (SCNScene)sceneWithOptions:(NSDictionary *)options statusHandler:(SCNSceneSourceStatusHandler)statusHandler
{
  uint64_t v7 = objc_opt_class();

  return (SCNScene *)[(SCNSceneSource *)self sceneWithClass:v7 options:options statusHandler:statusHandler];
}

- (id)sceneWithClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SCNSceneSource_sceneWithClass_options_error___block_invoke;
  v9[3] = &__block_descriptor_40_e27_v36__0f8q12__NSError_20_B28l;
  v9[4] = a5;
  id v6 = [(SCNSceneSource *)self sceneWithClass:a3 options:a4 statusHandler:v9];
  if (a5) {
    id v7 = *a5;
  }
  return v6;
}

void *__47__SCNSceneSource_sceneWithClass_options_error___block_invoke(void *result, uint64_t a2, void *a3)
{
  if (a3)
  {
    v3 = result;
    if (result[4])
    {
      uint64_t result = a3;
      *(void *)v3[4] = result;
    }
  }
  return result;
}

- (SCNScene)sceneWithOptions:(NSDictionary *)options error:(NSError *)error
{
  uint64_t v7 = objc_opt_class();

  return (SCNScene *)[(SCNSceneSource *)self sceneWithClass:v7 options:options error:error];
}

- (id)copyPropertiesAtIndex:(int64_t)a3 options:(id)a4
{
  return C3DSceneSourceCopyPropertiesAtIndex((uint64_t)self->_sceneSource, a3);
}

- (id)propertyForKey:(NSString *)key
{
  if (!self->_sceneLoaded) {
    [(SCNSceneSource *)self sceneWithOptions:self->_sceneSourceOptions error:0];
  }
  if (![(NSString *)key isEqualToString:@"geometryMemory"])
  {
    if (![(NSString *)key isEqualToString:@"textureMemory"])
    {
      id v12 = [(SCNSceneSource *)self copyPropertiesAtIndex:0 options:0];
      id v13 = (void *)[v12 objectForKey:key];
      id v14 = v12;
      return v13;
    }
    uint64_t Library = C3DSceneSourceGetLibrary((uint64_t)self->_sceneSource);
    if (Library)
    {
      uint64_t v6 = Library;
      TypeID = (void *)C3DImageGetTypeID();
      goto LABEL_9;
    }
LABEL_10:
    MemoryUsageForKind = 0;
    goto LABEL_11;
  }
  uint64_t v5 = C3DSceneSourceGetLibrary((uint64_t)self->_sceneSource);
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = v5;
  TypeID = (void *)C3DGeometryGetTypeID();
LABEL_9:
  MemoryUsageForKind = C3DLibraryGetMemoryUsageForKind(v6, TypeID);
LABEL_11:
  int v10 = NSNumber;

  return (id)[v10 numberWithUnsignedInteger:MemoryUsageForKind];
}

- (__C3DSceneSource)sceneSourceRef
{
  return self->_sceneSource;
}

- (__C3DLibrary)library
{
  uint64_t result = (__C3DLibrary *)self->_sceneSource;
  if (result) {
    return (__C3DLibrary *)C3DSceneSourceGetLibrary((uint64_t)result);
  }
  return result;
}

- (id)c3dDataRepresentation
{
  if (!self->_sceneLoaded) {
    [(SCNSceneSource *)self sceneWithOptions:self->_sceneSourceOptions error:0];
  }
  lastLoadedScene = self->_lastLoadedScene;
  objc_super v4 = [(SCNSceneSource *)self library];
  uint64_t v6 = C3DCreatePropertyListFromScene(lastLoadedScene, v4, MEMORY[0x263EFFA78], v5);
  if (v6)
  {
    uint64_t v7 = v6;
    CFDataRef Data = CFPropertyListCreateData(0, v6, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFRelease(v7);
  }
  else
  {
    CFDataRef Data = 0;
  }

  return Data;
}

- (id)entryWithIdentifier:(NSString *)uid withClass:(Class)entryClass
{
  if (!self->_sceneLoaded) {
    [(SCNSceneSource *)self sceneWithOptions:self->_sceneSourceOptions error:0];
  }
  sceneSource = self->_sceneSource;
  if (!sceneSource) {
    return 0;
  }
  uint64_t Library = C3DSceneSourceGetLibrary((uint64_t)sceneSource);
  if (!Library) {
    return 0;
  }
  CFDictionaryRef EntryWithDocumentID = C3DLibraryGetEntryWithDocumentID(Library, uid);
  if (!EntryWithDocumentID) {
    return 0;
  }
  int v10 = (id *)EntryWithDocumentID;
  CFTypeID v11 = CFGetTypeID(EntryWithDocumentID);
  if ((Class)objc_opt_class() == entryClass)
  {
    if (v11 != C3DGeometryGetTypeID())
    {
      uint64_t v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SCNSceneSource entryWithIdentifier:withClass:]();
      }
      return 0;
    }
    BOOL v13 = C3DEntityGetObjCWrapper(v10) != 0;
    id v14 = +[SCNGeometry geometryWithGeometryRef:v10];
    goto LABEL_70;
  }
  if ((Class)objc_opt_class() == entryClass)
  {
    if (v11 != C3DMaterialGetTypeID())
    {
      int v16 = scn_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SCNSceneSource entryWithIdentifier:withClass:]();
      }
      return 0;
    }
    BOOL v13 = C3DEntityGetObjCWrapper(v10) != 0;
    id v14 = +[SCNMaterial materialWithMaterialRef:v10];
    goto LABEL_70;
  }
  if ((Class)objc_opt_class() != entryClass)
  {
    if ((Class)objc_opt_class() != entryClass)
    {
      if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DNodeGetTypeID())
        {
          uint64_t v22 = scn_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.5();
          }
          return 0;
        }
        BOOL v13 = C3DEntityGetObjCWrapper(v10) != 0;
        id v14 = +[SCNNode nodeWithNodeRef:v10];
      }
      else if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DLightGetTypeID())
        {
          int v24 = scn_default_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.6();
          }
          return 0;
        }
        BOOL v13 = C3DEntityGetObjCWrapper(v10) != 0;
        id v14 = +[SCNLight lightWithLightRef:v10];
      }
      else if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DCameraGetTypeID())
        {
          v26 = scn_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.7();
          }
          return 0;
        }
        BOOL v13 = C3DEntityGetObjCWrapper(v10) != 0;
        id v14 = +[SCNCamera cameraWithCameraRef:v10];
      }
      else if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DSceneGetTypeID())
        {
          uint64_t v27 = scn_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.8();
          }
          return 0;
        }
        BOOL v13 = C3DEntityGetObjCWrapper(v10) != 0;
        id v14 = +[SCNScene sceneWithSceneRef:v10];
      }
      else if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DSkinnerGetTypeID())
        {
          uint64_t v28 = scn_default_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[SCNSceneSource entryWithIdentifier:withClass:].cold.9();
          }
          return 0;
        }
        BOOL v13 = C3DEntityGetObjCWrapper(v10) != 0;
        id v14 = +[SCNSkinner skinnerWithSkinnerRef:v10];
      }
      else if ((Class)objc_opt_class() == entryClass)
      {
        if (v11 != C3DMorphGetTypeID())
        {
          char v32 = scn_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            -[SCNSceneSource entryWithIdentifier:withClass:]0();
          }
          return 0;
        }
        BOOL v13 = C3DEntityGetObjCWrapper(v10) != 0;
        id v14 = +[SCNMorpher morpherWithMorphRef:v10];
      }
      else
      {
        if ((Class)objc_opt_class() != entryClass)
        {
          if ((Class)objc_opt_class() == entryClass && v11 == C3DImageGetTypeID())
          {
            URL = (void *)C3DImageGetURL((uint64_t)v10);
            BOOL v13 = 0;
            goto LABEL_71;
          }
          return 0;
        }
        if (v11 != C3DImageGetTypeID())
        {
          uint64_t v33 = scn_default_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[SCNSceneSource entryWithIdentifier:withClass:]1();
          }
          return 0;
        }
        BOOL v13 = C3DEntityGetObjCWrapper(v10) != 0;
        id v14 = (SCNGeometry *)+[SCNMaterialProperty copyImageFromC3DImage:v10];
      }
LABEL_70:
      URL = v14;
      goto LABEL_71;
    }
    if (v11 == C3DKeyframedAnimationGetTypeID()
      || v11 == C3DAnimationGroupGetTypeID()
      || v11 == C3DAnimationClusterGetTypeID())
    {
      BOOL v13 = C3DEntityGetObjCWrapper(v10) != 0;
      uint64_t TypeID = C3DAnimationGroupGetTypeID();
      if (TypeID == CFGetTypeID(v10))
      {
        CFErrorDomain v19 = C3DAnimationClusterCreateWithAnimationGroup((uint64_t)v10);
        if (v19)
        {
          CFStringRef v20 = (id *)v19;
          id v21 = v19;
          int v10 = v20;
        }
      }
      id v14 = +[SCNAnimation animationWithC3DAnimation:v10];
      goto LABEL_70;
    }
    id v25 = scn_default_log();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
LABEL_51:
    -[SCNSceneSource entryWithIdentifier:withClass:]();
    return 0;
  }
  if (v11 != C3DKeyframedAnimationGetTypeID()
    && v11 != C3DAnimationGroupGetTypeID()
    && v11 != C3DAnimationClusterGetTypeID())
  {
    v23 = scn_default_log();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    goto LABEL_51;
  }
  BOOL v13 = C3DEntityGetObjCWrapper(v10) != 0;
  URL = C3DAnimationToCAAnimation(v10);
  if (C3DWasLinkedBeforeMajorOSYear2014())
  {
    [URL setUsesSceneTimeBase:0];
    [URL setRemovedOnCompletion:1];
  }
LABEL_71:
  if (URL && !v13 && self->_lastLoadedScene)
  {
    int v29 = +[SCNScene sceneWithSceneRef:](SCNScene, "sceneWithSceneRef:");
    if ((Class)objc_opt_class() == entryClass)
    {
      v30 = [(SCNScene *)v29 rootNode];
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke;
      v38[3] = &unk_264008D60;
      v38[4] = URL;
      v31 = v38;
      goto LABEL_84;
    }
    if ((Class)objc_opt_class() == entryClass)
    {
      v30 = [(SCNScene *)v29 rootNode];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_2;
      v37[3] = &unk_264008D60;
      v37[4] = URL;
      v31 = v37;
      goto LABEL_84;
    }
    if ((Class)objc_opt_class() == entryClass)
    {
      v30 = [(SCNScene *)v29 rootNode];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_3;
      v36[3] = &unk_264008D60;
      v36[4] = URL;
      v31 = v36;
      goto LABEL_84;
    }
    if ((Class)objc_opt_class() == entryClass)
    {
      v30 = [(SCNScene *)v29 rootNode];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_4;
      v35[3] = &unk_264008D60;
      v35[4] = URL;
      v31 = v35;
      goto LABEL_84;
    }
    if ((Class)objc_opt_class() == entryClass)
    {
      v30 = [(SCNScene *)v29 rootNode];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_5;
      void v34[3] = &unk_264008D60;
      v34[4] = URL;
      v31 = v34;
LABEL_84:
      [(SCNNode *)v30 childNodesPassingTest:v31];
    }
  }
  return URL;
}

uint64_t __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if ([a2 light] == *(void *)(a1 + 32)) {
    *a3 = 1;
  }
  return 0;
}

uint64_t __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  if ([a2 camera] == *(void *)(a1 + 32)) {
    *a3 = 1;
  }
  return 0;
}

uint64_t __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  if ([a2 geometry] == *(void *)(a1 + 32)) {
    *a3 = 1;
  }
  return 0;
}

uint64_t __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_4(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(a1 + 32) == a2) {
    *a3 = 1;
  }
  return 0;
}

uint64_t __48__SCNSceneSource_entryWithIdentifier_withClass___block_invoke_5(uint64_t a1, void *a2, unsigned char *a3)
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "materials"), "containsObject:", *(void *)(a1 + 32)))*a3 = 1; {
  return 0;
  }
}

- (NSArray)identifiersOfEntriesWithClass:(Class)entryClass
{
  v36[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (NSArray *)[MEMORY[0x263EFF980] array];
  if ((Class)objc_opt_class() == entryClass)
  {
    v36[0] = [NSNumber numberWithUnsignedLong:C3DGeometryGetTypeID()];
    uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v8 = v36;
LABEL_17:
    uint64_t v9 = 1;
    goto LABEL_18;
  }
  if ((Class)objc_opt_class() == entryClass)
  {
    uint64_t v35 = [NSNumber numberWithUnsignedLong:C3DMaterialGetTypeID()];
    uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v8 = &v35;
    goto LABEL_17;
  }
  if ((Class)objc_opt_class() != entryClass && (Class)objc_opt_class() != entryClass)
  {
    if ((Class)objc_opt_class() == entryClass)
    {
      uint64_t v33 = [NSNumber numberWithUnsignedLong:C3DNodeGetTypeID()];
      uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v8 = &v33;
    }
    else if ((Class)objc_opt_class() == entryClass)
    {
      uint64_t v32 = [NSNumber numberWithUnsignedLong:C3DLightGetTypeID()];
      uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v8 = &v32;
    }
    else if ((Class)objc_opt_class() == entryClass)
    {
      uint64_t v31 = [NSNumber numberWithUnsignedLong:C3DCameraGetTypeID()];
      uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v8 = &v31;
    }
    else if ((Class)objc_opt_class() == entryClass)
    {
      uint64_t v30 = [NSNumber numberWithUnsignedLong:C3DSceneGetTypeID()];
      uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v8 = &v30;
    }
    else if ((Class)objc_opt_class() == entryClass)
    {
      uint64_t v29 = [NSNumber numberWithUnsignedLong:C3DMorpherGetTypeID()];
      uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v8 = &v29;
    }
    else
    {
      if ((Class)objc_opt_class() != entryClass)
      {
        uint64_t v6 = scn_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[SCNSceneSource identifiersOfEntriesWithClass:]();
        }
        return (NSArray *)MEMORY[0x263EFFA68];
      }
      uint64_t v28 = [NSNumber numberWithUnsignedLong:C3DSkinnerGetTypeID()];
      uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v8 = &v28;
    }
    goto LABEL_17;
  }
  v34[0] = [NSNumber numberWithUnsignedLong:C3DAnimationGroupGetTypeID()];
  v34[1] = [NSNumber numberWithUnsignedLong:C3DAnimationClusterGetTypeID()];
  v34[2] = [NSNumber numberWithUnsignedLong:C3DKeyframedAnimationGetTypeID()];
  uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v8 = v34;
  uint64_t v9 = 3;
LABEL_18:
  int v10 = (void *)[v7 arrayWithObjects:v8 count:v9];
  if (!self->_sceneLoaded) {
    [(SCNSceneSource *)self sceneWithOptions:self->_sceneSourceOptions error:0];
  }
  sceneSource = self->_sceneSource;
  if (sceneSource)
  {
    uint64_t Library = C3DSceneSourceGetLibrary((uint64_t)sceneSource);
    if (Library)
    {
      uint64_t v13 = Library;
      CFIndex v26 = 0;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v14 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v10);
            }
            uint64_t v18 = C3DLibraryCopyIDsWithKind(v13, (void *)[*(id *)(*((void *)&v22 + 1) + 8 * i) longValue], &v26);
            if (v26 >= 1)
            {
              for (CFIndex j = 0; j < v26; ++j)
              {
                CFStringRef v20 = (void *)[(id)v18[j] copy];
                [(NSArray *)v5 addObject:v20];
              }
            }
            free(v18);
          }
          uint64_t v15 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v15);
      }
    }
  }
  return v5;
}

- (BOOL)_appendToEntries:(id)a3 entriesWithType:(unint64_t)a4 passingTest:(id)a5 entryObjectConstructor:(id)a6
{
  uint64_t Library = C3DSceneSourceGetLibrary((uint64_t)self->_sceneSource);
  CFIndex v20 = 0;
  CFTypeID v11 = C3DLibraryCopyIDsWithKind(Library, (void *)a4, &v20);
  char v19 = 0;
  if (v20 < 1)
  {
    BOOL v17 = 0;
  }
  else
  {
    for (CFIndex i = 0; i < v20; ++i)
    {
      uint64_t v13 = (void *)v11[i];
      CFDictionaryRef EntryWithDocumentID = C3DLibraryGetEntryWithDocumentID(Library, v13);
      uint64_t v15 = (void *)[v13 copy];
      uint64_t v16 = (*((uint64_t (**)(id, const __CFDictionary *))a6 + 2))(a6, EntryWithDocumentID);
      if ((*((unsigned int (**)(id, uint64_t, void *, char *))a5 + 2))(a5, v16, v15, &v19)) {
        [a3 addObject:v16];
      }

      if (v19) {
        break;
      }
    }
    BOOL v17 = v19 != 0;
  }
  free(v11);
  return v17;
}

- (NSArray)entriesPassingTest:(void *)predicate
{
  uint64_t v5 = (NSArray *)[MEMORY[0x263EFF980] array];
  if (!self->_sceneLoaded) {
    [(SCNSceneSource *)self sceneWithOptions:self->_sceneSourceOptions error:0];
  }
  sceneSource = self->_sceneSource;
  if (sceneSource
    && C3DSceneSourceGetLibrary((uint64_t)sceneSource)
    && !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DGeometryGetTypeID(), predicate, &__block_literal_global_76)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DMaterialGetTypeID(), predicate, &__block_literal_global_226)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DAnimationGroupGetTypeID(), predicate,
          &__block_literal_global_228)
    && !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DAnimationClusterGetTypeID(), predicate, &__block_literal_global_230_0)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DNodeGetTypeID(), predicate, &__block_literal_global_232)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DLightGetTypeID(), predicate,
          &__block_literal_global_234)
    && !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DCameraGetTypeID(), predicate, &__block_literal_global_236_0)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DSceneGetTypeID(), predicate, &__block_literal_global_238_0)&& !-[SCNSceneSource _appendToEntries:entriesWithType:passingTest:entryObjectConstructor:](self, "_appendToEntries:entriesWithType:passingTest:entryObjectConstructor:", v5, C3DSkinnerGetTypeID(), predicate,
          &__block_literal_global_240_0))
  {
    [(SCNSceneSource *)self _appendToEntries:v5 entriesWithType:C3DMorphGetTypeID() passingTest:predicate entryObjectConstructor:&__block_literal_global_242];
  }
  return v5;
}

SCNGeometry *__37__SCNSceneSource_entriesPassingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SCNGeometry geometryWithGeometryRef:a2];
}

SCNMaterial *__37__SCNSceneSource_entriesPassingTest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[SCNMaterial materialWithMaterialRef:a2];
}

id __37__SCNSceneSource_entriesPassingTest___block_invoke_3(uint64_t a1, const void *a2)
{
  return C3DAnimationToCAAnimation(a2);
}

id __37__SCNSceneSource_entriesPassingTest___block_invoke_4(uint64_t a1, const void *a2)
{
  return C3DAnimationToCAAnimation(a2);
}

SCNNode *__37__SCNSceneSource_entriesPassingTest___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return +[SCNNode nodeWithNodeRef:a2];
}

SCNLight *__37__SCNSceneSource_entriesPassingTest___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return +[SCNLight lightWithLightRef:a2];
}

SCNCamera *__37__SCNSceneSource_entriesPassingTest___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return +[SCNCamera cameraWithCameraRef:a2];
}

SCNScene *__37__SCNSceneSource_entriesPassingTest___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return +[SCNScene sceneWithSceneRef:a2];
}

SCNSkinner *__37__SCNSceneSource_entriesPassingTest___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return +[SCNSkinner skinnerWithSkinnerRef:a2];
}

SCNMorpher *__37__SCNSceneSource_entriesPassingTest___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return +[SCNMorpher morpherWithMorphRef:a2];
}

- (int64_t)sourceStatus
{
  return (int)C3DSceneSourceGetStatus((uint64_t)self->_sceneSource);
}

- (BOOL)canExportToColladaWithNoDataLoss
{
  return 0;
}

+ (id)sceneTypes
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithObject:@"org.khronos.collada.digital-asset-exchange"];
}

+ (id)sceneFileTypes
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithObject:@"dae"];
}

- (id)performConsistencyCheck
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3052000000;
  uint64_t v7 = __Block_byref_object_copy__7;
  uint64_t v8 = __Block_byref_object_dispose__7;
  uint64_t v9 = 0;
  C3DSceneSourcePerformConsistencyCheck(self->_sceneSource);
  v2 = (void *)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void *__41__SCNSceneSource_performConsistencyCheck__block_invoke(void *result, int a2, void *cf)
{
  if (cf)
  {
    uint64_t v4 = result;
    CFRetain(cf);
    uint64_t result = cf;
    *(void *)(*(void *)(v4[4] + 8) + 40) = result;
  }
  return result;
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)SCNGetSceneKitBundle();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = [a5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(a5);
      }
      uint64_t v12 = [v7 classNamed:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      if (v12)
      {
        uint64_t v13 = (objc_class *)v12;
        if (![a3 requiresSecureCoding]) {
          return v13;
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v14 = (void *)[a3 allowedClasses];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v26;
          uint64_t v24 = v9;
LABEL_10:
          id v18 = a3;
          id v19 = a5;
          CFIndex v20 = v7;
          uint64_t v21 = v10;
          uint64_t v22 = 0;
          while (1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            if ([(objc_class *)v13 isSubclassOfClass:*(void *)(*((void *)&v25 + 1) + 8 * v22)])return v13; {
            if (v16 == ++v22)
            }
            {
              uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
              uint64_t v10 = v21;
              uint64_t v7 = v20;
              a5 = v19;
              a3 = v18;
              uint64_t v9 = v24;
              if (v16) {
                goto LABEL_10;
              }
              break;
            }
          }
        }
      }
    }
    uint64_t v9 = [a5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    uint64_t v13 = 0;
    if (v9) {
      continue;
    }
    return v13;
  }
}

- (id)debugQuickLookObject
{
  v2 = [(SCNSceneSource *)self sceneWithOptions:0 error:0];

  return [(SCNScene *)v2 debugQuickLookObject];
}

- (id)debugQuickLookData
{
  v2 = [(SCNSceneSource *)self debugQuickLookObject];

  return UIImagePNGRepresentation(v2);
}

void __59__SCNSceneSource__createSceneRefWithOptions_statusHandler___block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unhandled SceneKit error code (%d)", (uint8_t *)v2, 8u);
}

- (void)_sceneWithClass:options:statusHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: failed to unarchive scene at %@ (%@)");
}

- (void)_sceneWithClass:options:statusHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: failed to unarchive scene at %@ - unknown decoded object class (%@)");
}

- (void)_sceneWithClass:options:statusHandler:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: failed to unarchive data at %@ (%@)");
}

- (void)entryWithIdentifier:withClass:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a geometry", v2, v3, v4, v5, v6);
}

- (void)entryWithIdentifier:withClass:.cold.2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a material", v2, v3, v4, v5, v6);
}

- (void)entryWithIdentifier:withClass:.cold.3()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not an animation", v2, v3, v4, v5, v6);
}

- (void)entryWithIdentifier:withClass:.cold.5()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a node", v2, v3, v4, v5, v6);
}

- (void)entryWithIdentifier:withClass:.cold.6()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a light", v2, v3, v4, v5, v6);
}

- (void)entryWithIdentifier:withClass:.cold.7()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a camera", v2, v3, v4, v5, v6);
}

- (void)entryWithIdentifier:withClass:.cold.8()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a scene", v2, v3, v4, v5, v6);
}

- (void)entryWithIdentifier:withClass:.cold.9()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a skinner", v2, v3, v4, v5, v6);
}

- (void)entryWithIdentifier:withClass:.cold.10()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not a morpher", v2, v3, v4, v5, v6);
}

- (void)entryWithIdentifier:withClass:.cold.11()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: entryWithUID:withClass: object with uid %@ exists but is not an image", v2, v3, v4, v5, v6);
}

- (void)identifiersOfEntriesWithClass:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: entrieswithClass: class %@ is not a known C3D class", v2, v3, v4, v5, v6);
}

@end