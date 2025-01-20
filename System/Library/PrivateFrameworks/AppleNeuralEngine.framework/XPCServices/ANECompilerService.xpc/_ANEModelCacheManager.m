@interface _ANEModelCacheManager
+ (BOOL)createModelCacheRetain:(id)a3;
+ (BOOL)isSystemModelPath:(id)a3;
+ (BOOL)removeIfStaleBinary:(id)a3 forModelPath:(id)a4;
+ (BOOL)saveSourceModelPath:(id)a3 outputModelDirectory:(id)a4;
+ (id)cachedModelRetainNameFor:(id)a3;
+ (id)cachedSourceModelStoreNameFor:(id)a3;
+ (id)new;
+ (void)initialize;
- (BOOL)cacheURLIdentifierForModel:(id)a3 useSourceURL:(BOOL)a4 withReply:(id)a5;
- (BOOL)garbageCollectDanglingModels;
- (BOOL)removeAllModelsForBundleID:(id)a3;
- (BOOL)scanAllPartitionsForModel:(id)a3 csIdentity:(id)a4 expunge:(BOOL)a5;
- (BOOL)shouldEnforceSizeLimits;
- (NSURL)cacheDir;
- (_ANEModelCacheManager)init;
- (_ANEModelCacheManager)initWithURL:(id)a3;
- (_ANEModelCacheManager)initWithURL:(id)a3 createDirectory:(BOOL)a4;
- (id)URLForBundleID:(id)a3;
- (id)URLForModel:(id)a3 bundleID:(id)a4;
- (id)URLForModel:(id)a3 bundleID:(id)a4 aotCacheUrlIdentifier:(id)a5;
- (id)URLForModel:(id)a3 bundleID:(id)a4 forAllSegments:(BOOL)a5;
- (id)URLForModel:(id)a3 bundleID:(id)a4 forAllSegments:(BOOL)a5 aotCacheUrlIdentifier:(id)a6;
- (id)URLForModel:(id)a3 bundleID:(id)a4 useSourceURL:(BOOL)a5;
- (id)URLForModel:(id)a3 bundleID:(id)a4 useSourceURL:(BOOL)a5 aotCacheUrlIdentifier:(id)a6;
- (id)URLForModel:(id)a3 bundleID:(id)a4 useSourceURL:(BOOL)a5 forAllSegments:(BOOL)a6 aotCacheUrlIdentifier:(id)a7;
- (id)cachedModelAllSegmentsPathFor:(id)a3 csIdentity:(id)a4;
- (id)cachedModelPathFor:(id)a3 csIdentity:(id)a4;
- (id)cachedModelPathFor:(id)a3 csIdentity:(id)a4 useSourceURL:(BOOL)a5;
- (id)cachedModelRetainNameFor:(id)a3 csIdentity:(id)a4;
- (id)cachedSourceModelStoreNameFor:(id)a3 csIdentity:(id)a4;
- (id)filePathForModel:(id)a3 bundleID:(id)a4;
- (id)getDiskSpaceForBundleID:(id)a3;
- (id)getDiskSpaceItemizedByBundleIDAndPurge:(BOOL)a3;
- (id)getModelBinaryPathFromURLIdentifier:(id)a3 bundleID:(id)a4;
- (void)scheduleMaintenanceWithName:(id)a3 directoryPaths:(id)a4;
- (void)startDanglingModelGC;
@end

@implementation _ANEModelCacheManager

+ (void)initialize
{
  if (qword_100057F80 != -1) {
    dispatch_once(&qword_100057F80, &stru_10004D010);
  }
}

- (_ANEModelCacheManager)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (_ANEModelCacheManager)initWithURL:(id)a3 createDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_ANEModelCacheManager;
  v9 = [(_ANEModelCacheManager *)&v19 init];
  if (v9)
  {
    if (v4)
    {
      v10 = +[NSFileManager defaultManager];
      v11 = [v8 path];
      id v18 = 0;
      unsigned __int8 v12 = [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v18];
      id v13 = v18;

      if ((v12 & 1) == 0)
      {
        v14 = (void *)qword_100057F90;
        if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_ERROR))
        {
          v16 = v14;
          v17 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v21 = v17;
          __int16 v22 = 2112;
          id v23 = v8;
          __int16 v24 = 2112;
          id v25 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@: FAILED creating cacheDir=%@ : err=%@", buf, 0x20u);
        }
      }
    }
    objc_storeStrong((id *)&v9->_cacheDir, a3);
  }

  return v9;
}

- (_ANEModelCacheManager)initWithURL:(id)a3
{
  return [(_ANEModelCacheManager *)self initWithURL:a3 createDirectory:1];
}

+ (BOOL)isSystemModelPath:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_ANEStrings systemLibraryPath];
  unsigned __int8 v5 = [v3 hasPrefix:v4];

  return v5;
}

- (id)URLForModel:(id)a3 bundleID:(id)a4
{
  return [(_ANEModelCacheManager *)self URLForModel:a3 bundleID:a4 forAllSegments:0 aotCacheUrlIdentifier:0];
}

- (id)URLForModel:(id)a3 bundleID:(id)a4 useSourceURL:(BOOL)a5
{
  return [(_ANEModelCacheManager *)self URLForModel:a3 bundleID:a4 useSourceURL:a5 forAllSegments:0 aotCacheUrlIdentifier:0];
}

- (id)URLForModel:(id)a3 bundleID:(id)a4 aotCacheUrlIdentifier:(id)a5
{
  return [(_ANEModelCacheManager *)self URLForModel:a3 bundleID:a4 forAllSegments:0 aotCacheUrlIdentifier:a5];
}

- (id)URLForModel:(id)a3 bundleID:(id)a4 forAllSegments:(BOOL)a5
{
  return [(_ANEModelCacheManager *)self URLForModel:a3 bundleID:a4 forAllSegments:a5 aotCacheUrlIdentifier:0];
}

- (id)URLForModel:(id)a3 bundleID:(id)a4 useSourceURL:(BOOL)a5 aotCacheUrlIdentifier:(id)a6
{
  return [(_ANEModelCacheManager *)self URLForModel:a3 bundleID:a4 useSourceURL:a5 forAllSegments:0 aotCacheUrlIdentifier:a6];
}

- (id)URLForModel:(id)a3 bundleID:(id)a4 useSourceURL:(BOOL)a5 forAllSegments:(BOOL)a6 aotCacheUrlIdentifier:(id)a7
{
  BOOL v36 = a6;
  BOOL v37 = a5;
  id v11 = a3;
  id v40 = a4;
  id v39 = a7;
  unsigned __int8 v12 = [v11 modelURL];
  v41 = [v12 path];

  id v13 = +[NSXPCConnection currentConnection];
  if (!v13)
  {
    v14 = (void *)qword_100057F90;
    if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_ERROR)) {
      sub_10003206C(v14, a2);
    }
  }
  v15 = +[_ANEStrings processModelShareAccessEntitlement];
  v16 = [v13 valueForEntitlement:v15];
  v17 = v16;
  if (v16 && [v16 BOOLValue])
  {
    id v18 = (void *)qword_100057F90;
    int v19 = 1;
    if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_INFO))
    {
      v20 = v18;
      v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = [v13 processIdentifier];
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@: client(%d) : has entitlement(%@)", buf, 0x1Cu);
    }
  }
  else
  {
    int v19 = 0;
  }
  if ((v19 | [(id)objc_opt_class() isSystemModelPath:v41]))
  {
    id v22 = +[_ANEStrings systemModelsCacheDirectory];
  }
  else
  {
    id v22 = v40;
  }
  id v23 = v22;
  __int16 v24 = [(_ANEModelCacheManager *)self URLForBundleID:v22];
  id v25 = [v11 getCacheURLIdentifier];
  BOOL v26 = v25 == 0;

  if (v26)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = sub_100021460;
    v50 = sub_100021470;
    id v51 = 0;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = sub_100021460;
    v47 = sub_100021470;
    id v48 = 0;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100021478;
    v42[3] = &unk_10004D038;
    v42[4] = buf;
    v42[5] = &v43;
    [(_ANEModelCacheManager *)self cacheURLIdentifierForModel:v11 useSourceURL:v37 withReply:v42];
    if (v39)
    {
      v30 = [v39 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
      v31 = [v24 URLByAppendingPathComponent:v30 isDirectory:1];
      v32 = [v31 URLByAppendingPathComponent:@"shapes" isDirectory:1];
      v33 = [v32 URLByAppendingPathComponent:*(void *)(*(void *)&buf[8] + 40) isDirectory:1];
    }
    else
    {
      v33 = [v24 URLByAppendingPathComponent:*(void *)(*(void *)&buf[8] + 40) isDirectory:1];
    }
    if (v36)
    {
      id v34 = v33;
    }
    else
    {
      id v34 = [v33 URLByAppendingPathComponent:v44[5] isDirectory:1];
    }
    v29 = v34;

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v27 = [v11 getCacheURLIdentifier];
    v28 = [v27 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

    v29 = [v24 URLByAppendingPathComponent:v28 isDirectory:1];
  }

  return v29;
}

- (id)URLForModel:(id)a3 bundleID:(id)a4 forAllSegments:(BOOL)a5 aotCacheUrlIdentifier:(id)a6
{
  return [(_ANEModelCacheManager *)self URLForModel:a3 bundleID:a4 useSourceURL:0 forAllSegments:a5 aotCacheUrlIdentifier:a6];
}

- (BOOL)cacheURLIdentifierForModel:(id)a3 useSourceURL:(BOOL)a4 withReply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(id, void *, void *))a5;
  if (v6 || [v8 identifierSource] == (id)2)
  {
    v10 = [v8 sourceURL];
  }
  else
  {
    v10 = [v8 modelURL];
  }
  id v11 = v10;
  unsigned __int8 v12 = [v10 path];

  id v13 = +[_ANEHashEncoding hexStringForString:v12];
  v14 = [v8 key];
  v15 = +[_ANEHashEncoding hexStringForString:v14];

  v16 = (void *)qword_100057F90;
  if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    id v18 = NSStringFromSelector(a2);
    int v23 = 138412802;
    __int16 v24 = v18;
    __int16 v25 = 2112;
    *(void *)BOOL v26 = v12;
    *(_WORD *)&v26[8] = 1024;
    *(_DWORD *)&v26[10] = [v8 identifierSource];
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@: modelPathStr:%@ model.identifierSource:%u", (uint8_t *)&v23, 0x1Cu);
  }
  int v19 = (void *)qword_100057F90;
  if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_INFO))
  {
    v20 = v19;
    v21 = NSStringFromSelector(a2);
    int v23 = 138413058;
    __int16 v24 = v21;
    __int16 v25 = 1024;
    *(_DWORD *)BOOL v26 = v6;
    *(_WORD *)&v26[4] = 2112;
    *(void *)&v26[6] = v13;
    __int16 v27 = 2112;
    v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@: useSourceURL:%u hexStr:%@ keyHexStr:%@", (uint8_t *)&v23, 0x26u);
  }
  v9[2](v9, v13, v15);

  return 1;
}

- (id)getModelBinaryPathFromURLIdentifier:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  v7 = [(_ANEModelCacheManager *)self URLForBundleID:a4];
  id v8 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

  v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:1];
  v10 = [v9 path];

  return v10;
}

- (id)cachedModelPathFor:(id)a3 csIdentity:(id)a4 useSourceURL:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v11 = [(_ANEModelCacheManager *)self URLForModel:v8 bundleID:v9 useSourceURL:v5];
  unsigned __int8 v12 = [v11 path];

  id v13 = +[_ANEStrings modelBinaryName];
  v14 = [v12 stringByAppendingPathComponent:v13];

  return v14;
}

- (id)cachedModelPathFor:(id)a3 csIdentity:(id)a4
{
  return [(_ANEModelCacheManager *)self cachedModelPathFor:a3 csIdentity:a4 useSourceURL:0];
}

- (id)cachedModelAllSegmentsPathFor:(id)a3 csIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = [(_ANEModelCacheManager *)self URLForModel:v6 bundleID:v7 forAllSegments:1 aotCacheUrlIdentifier:0];
  v10 = [v9 path];

  return v10;
}

- (id)cachedSourceModelStoreNameFor:(id)a3 csIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = [(_ANEModelCacheManager *)self URLForModel:v6 bundleID:v7];
  v10 = [v9 path];

  id v11 = [(id)objc_opt_class() cachedSourceModelStoreNameFor:v10];

  return v11;
}

+ (id)cachedSourceModelStoreNameFor:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_ANEStrings modelSourceStoreName];
  BOOL v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

+ (BOOL)saveSourceModelPath:(id)a3 outputModelDirectory:(id)a4
{
  id v6 = a3;
  id v7 = +[_ANEModelCacheManager cachedSourceModelStoreNameFor:a4];
  id v14 = 0;
  unsigned __int8 v8 = [v6 writeToFile:v7 atomically:1 encoding:4 error:&v14];
  id v9 = v14;
  if ((v8 & 1) == 0)
  {
    v10 = (void *)qword_100057F90;
    if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v12 = v10;
      id v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v16 = v13;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: FAILED storing sourceModelPath=%@ to %@ : err=%@", buf, 0x2Au);
    }
  }

  return v8;
}

- (id)cachedModelRetainNameFor:(id)a3 csIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = [(_ANEModelCacheManager *)self URLForModel:v6 bundleID:v7];
  v10 = [v9 path];

  id v11 = [(id)objc_opt_class() cachedModelRetainNameFor:v10];

  return v11;
}

+ (id)cachedModelRetainNameFor:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_ANEStrings modelCacheRetainName];
  BOOL v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

+ (BOOL)createModelCacheRetain:(id)a3
{
  BOOL v4 = +[_ANEModelCacheManager cachedModelRetainNameFor:a3];
  BOOL v5 = +[NSFileManager defaultManager];
  unsigned __int8 v6 = [v5 createFileAtPath:v4 contents:0 attributes:0];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)qword_100057F90;
    if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_ERROR)) {
      sub_100032118(v7, a2, (uint64_t)v4);
    }
  }

  return v6;
}

+ (BOOL)removeIfStaleBinary:(id)a3 forModelPath:(id)a4
{
  id v5 = a3;
  id v32 = a4;
  unsigned __int8 v6 = +[NSFileManager defaultManager];
  id v34 = 0;
  id v7 = [v6 attributesOfItemAtPath:v5 error:&v34];
  id v8 = v34;
  if (v7)
  {
    id v9 = [v7 objectForKeyedSubscript:NSFileCreationDate];
    v10 = [v7 objectForKeyedSubscript:NSFileModificationDate];
    id v33 = v8;
    id v11 = [v6 attributesOfItemAtPath:v32 error:&v33];
    id v12 = v33;

    v30 = v11;
    if (v11)
    {
      id v13 = [v11 objectForKeyedSubscript:NSFileCreationDate];
      id v14 = [v11 objectForKeyedSubscript:NSFileModificationDate];
      id v29 = [v9 compare:v13];
      v15 = v10;
      v16 = (char *)[v10 compare:v14];

      if (v29 != (id)-1 && v16 + 1 != 0) {
        goto LABEL_17;
      }
    }
    else
    {
      v15 = v10;
      id v22 = (void *)qword_100057F90;
      if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_INFO))
      {
        int v23 = v22;
        __int16 v24 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        BOOL v36 = v24;
        __int16 v37 = 2112;
        id v38 = v32;
        __int16 v39 = 2112;
        id v40 = v12;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%@: attributesOfItemAtPath:%@ returned nil : err=%@ : Forcing removal!", buf, 0x20u);
      }
    }
    if (+[_ANEStorageHelper removeDirectoryAtPath:v5])
    {
      BOOL v21 = 1;
LABEL_18:

      goto LABEL_19;
    }
    __int16 v25 = (void *)qword_100057F90;
    if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_ERROR))
    {
      __int16 v27 = v25;
      v28 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      BOOL v36 = v28;
      __int16 v37 = 2112;
      id v38 = v5;
      __int16 v39 = 2112;
      id v40 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@: FAILED to remove %@ : err=%@", buf, 0x20u);
    }
LABEL_17:
    BOOL v21 = 0;
    goto LABEL_18;
  }
  id v18 = (void *)qword_100057F90;
  if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_INFO))
  {
    __int16 v19 = v18;
    v20 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    BOOL v36 = v20;
    __int16 v37 = 2112;
    id v38 = v5;
    __int16 v39 = 2112;
    id v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@: attributesOfItemAtPath:%@ returned nil : err=%@", buf, 0x20u);
  }
  BOOL v21 = 0;
  id v12 = v8;
LABEL_19:

  return v21;
}

- (id)URLForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(_ANEModelCacheManager *)self cacheDir];
  unsigned __int8 v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:1];

  return v6;
}

- (BOOL)removeAllModelsForBundleID:(id)a3
{
  id v3 = [(_ANEModelCacheManager *)self URLForBundleID:a3];
  id v4 = [v3 path];
  BOOL v5 = +[_ANEStorageHelper removeDirectoryAtPath:v4];

  return v5;
}

- (id)filePathForModel:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = [(_ANEModelCacheManager *)self URLForBundleID:v7];
  v10 = [v6 modelURL];
  id v11 = [v10 path];
  id v12 = +[_ANEHashEncoding hexStringForString:v11];

  id v13 = [v9 path];
  id v14 = [v13 stringByAppendingPathComponent:v12];

  return v14;
}

- (id)getDiskSpaceItemizedByBundleIDAndPurge:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_ANEModelCacheManager *)self cacheDir];
  BOOL v5 = [v4 path];

  id v6 = +[_ANEStorageHelper sizeOfModelCacheAtPath:v5 purgeSubdirectories:v3];

  return v6;
}

- (id)getDiskSpaceForBundleID:(id)a3
{
  BOOL v3 = [(_ANEModelCacheManager *)self URLForBundleID:a3];
  id v4 = [v3 path];
  BOOL v5 = +[_ANEStorageHelper sizeOfModelCacheAtPath:v4 purgeSubdirectories:0];

  return v5;
}

- (BOOL)shouldEnforceSizeLimits
{
  return 0;
}

- (BOOL)garbageCollectDanglingModels
{
  v2 = [(_ANEModelCacheManager *)self cacheDir];
  BOOL v3 = +[_ANEStorageHelper garbageCollectDanglingModelsAtPath:v2];

  return v3;
}

- (void)startDanglingModelGC
{
  id v4 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.private.ANEStorageMaintainer"];
  BOOL v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____ANEStorageMaintainerProtocol];
  [v4 setRemoteObjectInterface:v5];

  [v4 resume];
  if (!v4)
  {
    id v6 = (void *)qword_100057F90;
    if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_ERROR)) {
      sub_1000321CC(v6, a2);
    }
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000225F4;
  v10[3] = &unk_10004D060;
  id v11 = @"com.apple.private.ANEStorageMaintainer";
  SEL v12 = a2;
  id v7 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v8 = [(_ANEModelCacheManager *)self cacheDir];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022654;
  v9[3] = &unk_10004D080;
  v9[4] = a2;
  [v7 purgeDanglingModelsAt:v8 withReply:v9];

  [v4 invalidate];
}

- (void)scheduleMaintenanceWithName:(id)a3 directoryPaths:(id)a4
{
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_100022824;
  id v11 = &unk_10004D0A8;
  id v12 = a3;
  id v13 = self;
  id v5 = v12;
  id v6 = objc_retainBlock(&v8);
  id v7 = +[_ANETask taskWithName:period:handler:](_ANETask, "taskWithName:period:handler:", v5, 86400, v6, v8, v9, v10, v11);
  +[_ANETaskManager registerTask:v7];
}

- (BOOL)scanAllPartitionsForModel:(id)a3 csIdentity:(id)a4 expunge:(BOOL)a5
{
  BOOL v65 = a5;
  id v8 = a3;
  v66 = (__CFString *)a4;
  uint64_t v9 = +[NSFileManager defaultManager];
  v10 = [(_ANEModelCacheManager *)self cacheDir];
  NSURLResourceKey v94 = NSURLIsRegularFileKey;
  id v11 = +[NSArray arrayWithObjects:&v94 count:1];
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100023114;
  v80[3] = &unk_10004D0C8;
  aSelector = a2;
  v80[4] = a2;
  v64 = v9;
  id v12 = [v9 enumeratorAtURL:v10 includingPropertiesForKeys:v11 options:0 errorHandler:v80];

  v72 = v8;
  objc_msgSend(v8, "string_id");
  kdebug_trace();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v76 objects:v93 count:16];
  if (v14)
  {
    id v16 = v14;
    CFStringRef v68 = 0;
    uint64_t v17 = 1;
    id v18 = &OBJC_IVAR____ANEDeviceController__device;
    uint64_t v19 = *(void *)v77;
    *(void *)&long long v15 = 138413314;
    long long v62 = v15;
    id v67 = v13;
    uint64_t v71 = *(void *)v77;
    do
    {
      v20 = 0;
      id v70 = v16;
      do
      {
        if (*(void *)v77 != v19) {
          objc_enumerationMutation(v13);
        }
        BOOL v21 = *(void **)(*((void *)&v76 + 1) + 8 * (void)v20);
        id v22 = objc_msgSend(v21, "lastPathComponent", v62);
        int v23 = [v18 + 268 modelBinaryName];
        unsigned int v24 = [v22 isEqualToString:v23];

        if (v24)
        {
          uint64_t v73 = v17;
          __int16 v25 = [v21 URLByDeletingLastPathComponent];
          BOOL v26 = [v18 + 268 modelSourceStoreName];
          __int16 v27 = [(__CFString *)v25 URLByAppendingPathComponent:v26];

          id v75 = 0;
          v28 = +[NSString stringWithContentsOfURL:v27 encoding:4 error:&v75];
          id v29 = (__CFString *)v75;
          if (v28)
          {
            v30 = [v72 modelURL];
            v31 = [v30 path];

            id v32 = (void *)qword_100057F90;
            if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_DEBUG))
            {
              v54 = v32;
              v55 = NSStringFromSelector(aSelector);
              CFStringRef v56 = (const __CFString *)[(__CFString *)v28 length];
              v57 = (__CFString *)[(__CFString *)v31 length];
              *(_DWORD *)buf = v62;
              uint64_t v82 = (uint64_t)v55;
              __int16 v83 = 2112;
              v84 = v28;
              __int16 v85 = 2048;
              CFStringRef v86 = v56;
              id v16 = v70;
              __int16 v87 = 2112;
              v88 = v31;
              __int16 v89 = 2048;
              v90 = v57;
              _os_log_debug_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "%@: [ sourcePathname=%@ %lu : modelPathname=%@ %lu ]", buf, 0x34u);

              id v13 = v67;
            }
            if ([(__CFString *)v31 isEqualToString:v28])
            {
              id v33 = [v21 pathComponents];
              id v34 = [v33 objectAtIndex:9];
              v35 = (void *)qword_100057F90;
              if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_INFO))
              {
                BOOL v36 = v35;
                __int16 v37 = NSStringFromSelector(aSelector);
                *(_DWORD *)buf = 138412546;
                uint64_t v82 = (uint64_t)v37;
                __int16 v83 = 2112;
                v84 = v34;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%@: pathCsIdentity %@", buf, 0x16u);

                id v16 = v70;
              }
              if ([(__CFString *)v66 isEqualToString:v34])
              {
                CFStringRef v68 = (const __CFString *)((char *)v68 + 1);
                if (v65)
                {
                  v74 = v29;
                  id v38 = [v64 removeItemAtURL:v25 error:&v74];
                  CFStringRef v39 = v74;

                  id v40 = (void *)qword_100057F90;
                  uint64_t v73 = (uint64_t)v38;
                  if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_INFO))
                  {
                    log = v40;
                    uint64_t v41 = NSStringFromSelector(aSelector);
                    v42 = (void *)v41;
                    *(_DWORD *)buf = 138412802;
                    CFStringRef v43 = @"Success!";
                    if (!v38) {
                      CFStringRef v43 = v39;
                    }
                    uint64_t v82 = v41;
                    __int16 v83 = 2112;
                    v84 = v25;
                    __int16 v85 = 2112;
                    CFStringRef v86 = v43;
                    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%@: Remove modelDirURL=%@ : %@", buf, 0x20u);
                  }
                  id v16 = v70;
                }
                else
                {
                  id v51 = (void *)qword_100057F90;
                  if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_INFO))
                  {
                    v52 = v51;
                    v53 = NSStringFromSelector(aSelector);
                    *(_DWORD *)buf = 138412802;
                    uint64_t v82 = (uint64_t)v53;
                    __int16 v83 = 2112;
                    v84 = v25;
                    __int16 v85 = 2048;
                    CFStringRef v86 = v68;
                    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%@: Found modelDirURL=%@ : total so far (%lu)", buf, 0x20u);

                    id v16 = v70;
                  }
                  CFStringRef v39 = v29;
                }
                objc_msgSend(v72, "string_id");
                kdebug_trace();
                id v29 = (__CFString *)v39;
              }
              else
              {
                v50 = qword_100057F90;
                if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v82 = (uint64_t)v34;
                  __int16 v83 = 2112;
                  v84 = v66;
                  __int16 v85 = 2112;
                  CFStringRef v86 = v31;
                  _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "pathCsIdentity %@ is not matching csIdentity input%@ for model: %@", buf, 0x20u);
                }
              }

              id v13 = v67;
            }
            else
            {
              uint64_t v45 = (void *)qword_100057F90;
              if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_INFO))
              {
                v46 = v45;
                v47 = NSStringFromSelector(aSelector);
                id v48 = (__CFString *)[(__CFString *)v28 length];
                id v49 = [(__CFString *)v31 length];
                *(_DWORD *)buf = 138413570;
                uint64_t v82 = (uint64_t)v47;
                __int16 v83 = 2112;
                v84 = v25;
                __int16 v85 = 2112;
                CFStringRef v86 = v28;
                __int16 v87 = 2048;
                v88 = v48;
                id v16 = v70;
                __int16 v89 = 2112;
                v90 = v31;
                __int16 v91 = 2048;
                id v92 = v49;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%@: modelDirURL=%@ : NOT removing [ sourcePathname=%@ %lu : modelPathname=%@ %lu ]", buf, 0x3Eu);
              }
            }
          }
          else
          {
            v44 = (void *)qword_100057F90;
            if (os_log_type_enabled((os_log_t)qword_100057F90, OS_LOG_TYPE_ERROR))
            {
              v58 = v44;
              v59 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412802;
              uint64_t v82 = (uint64_t)v59;
              __int16 v83 = 2112;
              v84 = v27;
              __int16 v85 = 2112;
              CFStringRef v86 = v29;
              _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%@: Nil sourcePathname! : srcStoreURL=%@ : lErr=%@", buf, 0x20u);
            }
            objc_msgSend(v72, "string_id");
            kdebug_trace();
          }

          uint64_t v17 = v73;
          id v18 = &OBJC_IVAR____ANEDeviceController__device;
          uint64_t v19 = v71;
        }
        v20 = (char *)v20 + 1;
      }
      while (v16 != v20);
      id v16 = [v13 countByEnumeratingWithState:&v76 objects:v93 count:16];
    }
    while (v16);
  }
  else
  {
    CFStringRef v68 = 0;
    LOBYTE(v17) = 1;
  }

  if (v65) {
    BOOL v60 = v17;
  }
  else {
    BOOL v60 = v68 != 0;
  }
  objc_msgSend(v72, "string_id");
  kdebug_trace();

  return v60;
}

- (NSURL)cacheDir
{
  return self->_cacheDir;
}

- (void).cxx_destruct
{
}

@end