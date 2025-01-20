@interface CacheDeletePruner
+ (id)prunerWithFileAge:(double)a3 dirAge:(double)a4;
- (BOOL)cancel;
- (CacheDeletePruner)initWithFileAge:(double)a3 dirAge:(double)a4;
- (TestTelemetry)testObject;
- (int64_t)dir_age;
- (int64_t)file_age;
- (unint64_t)pruneContainerTmps;
- (unint64_t)pruneDir:(id)a3 bundleID:(id)a4;
- (unint64_t)pruneSystemTmp;
- (unint64_t)pruneUserTmp;
- (void)setCancel:(BOOL)a3;
- (void)setDir_age:(int64_t)a3;
- (void)setFile_age:(int64_t)a3;
- (void)setTestObject:(id)a3;
- (void)stop;
@end

@implementation CacheDeletePruner

- (CacheDeletePruner)initWithFileAge:(double)a3 dirAge:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CacheDeletePruner;
  result = [(CacheDeletePruner *)&v7 init];
  if (result)
  {
    result->_dir_age = (uint64_t)a4;
    result->_file_age = (uint64_t)a3;
  }
  return result;
}

+ (id)prunerWithFileAge:(double)a3 dirAge:(double)a4
{
  v4 = [[CacheDeletePruner alloc] initWithFileAge:a3 dirAge:a4];
  return v4;
}

- (void)stop
{
}

- (unint64_t)pruneContainerTmps
{
  v4 = getRootVolume();
  if (v4)
  {
    v5 = +[CacheDeleteVolume volumeWithPath:v4];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __39__CacheDeletePruner_pruneContainerTmps__block_invoke;
    v7[3] = &unk_10005C930;
    v7[4] = self;
    +[AppCache enumerateAppCachesOnVolume:v5 options:0 telemetry:0 block:v7];
  }
  else
  {
    v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to get root volume ", buf, 2u);
    }
  }

  return 0;
}

uint64_t __39__CacheDeletePruner_pruneContainerTmps__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v5 = objc_msgSend(*(id *)(a1 + 32), "cancel", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0);
  if ((v5 & 1) == 0)
  {
    v6 = [v3 dataContainerURL];
    objc_super v7 = [v6 path];
    id v8 = [v7 stringByAppendingPathComponent:@"tmp"];
    v9 = (const char *)[v8 fileSystemRepresentation];

    if (!v9)
    {
      v15 = CDGetLogHandle();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      v16 = [v3 identifier];
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Unable to create /tmp/ path for %@", buf, 0xCu);
LABEL_9:

LABEL_11:
      goto LABEL_12;
    }
    if (stat(v9, &v18) != -1 && (v18.st_mode & 0xF000) == 0x4000)
    {
      v10 = +[NSString stringWithUTF8String:v9];
      unint64_t v11 = traverse_directory();

      v12 = CDGetLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v3 identifier];
        *(_DWORD *)buf = 138412546;
        v20 = v13;
        __int16 v21 = 2048;
        unint64_t v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ /tmp/ size: %llu", buf, 0x16u);
      }
      if (v11 > 0xA00000)
      {
        v14 = *(void **)(a1 + 32);
        v15 = +[NSString stringWithUTF8String:v9];
        v16 = [v3 identifier];
        [v14 pruneDir:v15 bundleID:v16];
        goto LABEL_9;
      }
    }
  }
LABEL_12:

  return v5 ^ 1;
}

- (unint64_t)pruneSystemTmp
{
  return [(CacheDeletePruner *)self pruneDir:@"/private/var/tmp" bundleID:0];
}

- (unint64_t)pruneUserTmp
{
  return [(CacheDeletePruner *)self pruneDir:@"/private/var/mobile/tmp" bundleID:0];
}

- (unint64_t)pruneDir:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  id v8 = v6;
  id v9 = [v8 fileSystemRepresentation];
  v10 = +[NSMutableSet set];
  v28.tv_sec = 0;
  *(void *)&v28.tv_usec = 0;
  if (gettimeofday(&v28, 0))
  {
    unint64_t v11 = CDGetLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v20 = __error();
      __int16 v21 = strerror(*v20);
      *(_DWORD *)buf = 136315138;
      v35 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "gettimeofday failed: %s", buf, 0xCu);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __39__CacheDeletePruner_pruneDir_bundleID___block_invoke;
  block[3] = &unk_10005C980;
  id v26 = v9;
  block[4] = self;
  timeval v27 = v28;
  id v12 = v10;
  id v24 = v12;
  v25 = &v29;
  dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
  v14 = v13;
  if (v7)
  {
    v15 = [(CacheDeletePruner *)self testObject];
    id v33 = v7;
    v16 = +[NSArray arrayWithObjects:&v33 count:1];
    id v22 = v14;
    id v17 = (id)assert_group_cache_deletion();
  }
  else
  {
    (*((void (**)(dispatch_block_t))v13 + 2))(v13);
  }
  unint64_t v18 = v30[3];

  _Block_object_dispose(&v29, 8);
  return v18;
}

void __39__CacheDeletePruner_pruneDir_bundleID___block_invoke(uint64_t a1)
{
  v2 = +[NSString stringWithUTF8String:*(void *)(a1 + 56)];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  unint64_t v18 = __39__CacheDeletePruner_pruneDir_bundleID___block_invoke_2;
  v19 = &unk_10005C958;
  id v3 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 32);
  long long v23 = *(_OWORD *)(a1 + 64);
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  id v21 = v4;
  uint64_t v22 = v5;
  traverse_directory();

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *(id *)(a1 + 40);
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v12 + 1) + 8 * (void)v10);
        rmdir((const char *)objc_msgSend(v11, "fileSystemRepresentation", (void)v12));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v24 count:16];
    }
    while (v8);
  }
}

uint64_t __39__CacheDeletePruner_pruneDir_bundleID___block_invoke_2(uint64_t a1, const char *a2, uint64_t a3)
{
  if ([*(id *)(a1 + 32) cancel]) {
    return 0;
  }
  uint64_t v7 = *(void *)(a3 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void **)(a1 + 32);
  if (*(unsigned char *)a3)
  {
    if (v7 >= v8 - (uint64_t)objc_msgSend(v9, "dir_age"))
    {
      *(unsigned char *)(a3 + 1) = 1;
    }
    else
    {
      v10 = CDGetLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 67109378;
        *(_DWORD *)id v21 = 167;
        *(_WORD *)&v21[4] = 2080;
        *(void *)&v21[6] = a2;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%d pruneDir rmdir'ing %s", (uint8_t *)&v20, 0x12u);
      }

      if (rmdir(a2))
      {
        id v11 = CDGetLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v16 = __error();
          uint64_t v17 = strerror(*v16);
          int v20 = 136315394;
          *(void *)id v21 = a2;
          *(_WORD *)&v21[8] = 2080;
          *(void *)&v21[10] = v17;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Could not rmdir %s: %s\n", (uint8_t *)&v20, 0x16u);
        }

        *(unsigned char *)(a3 + 1) = 1;
        long long v12 = *(void **)(a1 + 40);
        long long v13 = +[NSString stringWithUTF8String:a2];
        [v12 addObject:v13];
      }
    }
  }
  else if (v7 <= v8 - (uint64_t)objc_msgSend(v9, "file_age"))
  {
    long long v14 = CDGetLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 67109378;
      *(_DWORD *)id v21 = 182;
      *(_WORD *)&v21[4] = 2080;
      *(void *)&v21[6] = a2;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%d pruneDir unlink'ing %s", (uint8_t *)&v20, 0x12u);
    }

    if (unlink(a2))
    {
      long long v15 = CDGetLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        unint64_t v18 = __error();
        v19 = strerror(*v18);
        int v20 = 136315394;
        *(void *)id v21 = a2;
        *(_WORD *)&v21[8] = 2080;
        *(void *)&v21[10] = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "unlink failed on %s : %s", (uint8_t *)&v20, 0x16u);
      }
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += *(void *)(a3 + 8);
    }
  }
  return [*(id *)(a1 + 32) cancel] ^ 1;
}

uint64_t __39__CacheDeletePruner_pruneDir_bundleID___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__CacheDeletePruner_pruneDir_bundleID___block_invoke_2_17(id a1, NSError *a2, NSString *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  id v6 = CDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    v10 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to acquire termination assertion for '%@': %@", (uint8_t *)&v7, 0x16u);
  }
}

- (int64_t)dir_age
{
  return self->_dir_age;
}

- (void)setDir_age:(int64_t)a3
{
  self->_dir_age = a3;
}

- (int64_t)file_age
{
  return self->_file_age;
}

- (void)setFile_age:(int64_t)a3
{
  self->_file_age = a3;
}

- (BOOL)cancel
{
  return self->_cancel;
}

- (void)setCancel:(BOOL)a3
{
  self->_cancel = a3;
}

- (TestTelemetry)testObject
{
  return (TestTelemetry *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTestObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end