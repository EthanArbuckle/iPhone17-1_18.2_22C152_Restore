@interface BMComputeXPCPublisherStorage
+ (id)bookmarkStorageForCurrentProcess;
+ (id)currentSession;
- (BMComputeXPCPublisherStorage)initWithUseCase:(id)a3 domain:(unint64_t)a4 isClient:(BOOL)a5;
- (BOOL)checkActiveSubscriptionMarkerForStream:(id)a3;
- (BOOL)checkExistenceOfBookmarkForSubscriptionWithIdentifier:(id)a3 client:(id)a4;
- (BOOL)isClient;
- (id)basePath;
- (id)bookmarkPathForSessionStorageWithIdentifier:(id)a3 client:(id)a4;
- (id)currentSessionBookmarkClientOrServerPath;
- (id)currentSessionBookmarkPath;
- (id)currentSessionNonwakingSubscriptionPath;
- (id)currentSessionPath;
- (id)currentSessionSubscriptionsPath;
- (id)newFileManagerWithUseCase:(id)a3;
- (id)persistentPath;
- (id)readBookmarkForSubscriptionWithIdentifier:(id)a3 client:(id)a4 error:(id *)a5;
- (id)readNonWakingSubscriptions:(id *)a3;
- (id)readNonwakingSubscriptionWithIdentifier:(id)a3 client:(id)a4 error:(id *)a5;
- (id)sessionsPath;
- (id)subscriptionMarkerPathForSessionStorageWithStream:(id)a3;
- (unint64_t)domain;
- (void)initializeBiomeDSLDirectoryForBootSession;
- (void)removeActiveSubscriptionMarkerForStream:(id)a3;
- (void)removeBookmarkFileForSubscriptionWithIdentifier:(id)a3 client:(id)a4;
- (void)removeNonWakingSubscriptionWithIdentifier:(id)a3 client:(id)a4;
- (void)writeActiveSubscriptionMarkerForStream:(id)a3;
- (void)writeBookmark:(id)a3 forSubscriptionWithIdentifier:(id)a4 client:(id)a5;
- (void)writeNonWakingSubscription:(id)a3;
@end

@implementation BMComputeXPCPublisherStorage

- (BOOL)checkExistenceOfBookmarkForSubscriptionWithIdentifier:(id)a3 client:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(BMComputeXPCPublisherStorage *)self bookmarkPathForSessionStorageWithIdentifier:v6 client:a4];
  v8 = [v7 stringByDeletingLastPathComponent];

  v9 = [(BMFileManager *)self->_fileManager contentsOfDirectoryAtPath:v8 error:0];
  int v10 = [v9 containsObject:v6];

  v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if (v10) {
      v12 = @"YES";
    }
    else {
      v12 = @"NO";
    }
    [(BMComputeXPCPublisherStorage *)self domain];
    v13 = BMStringForServiceDomain();
    int v15 = 138413058;
    v16 = v12;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_18E67D000, v11, OS_LOG_TYPE_INFO, "Bookmark file exists: %@ for subscription %@ domain: %@ path: %@", (uint8_t *)&v15, 0x2Au);
  }
  return v10;
}

- (id)readBookmarkForSubscriptionWithIdentifier:(id)a3 client:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    int v10 = [(BMComputeXPCPublisherStorage *)self bookmarkPathForSessionStorageWithIdentifier:v8 client:v9];
    fileManager = self->_fileManager;
    id v38 = 0;
    v12 = [(BMFileManager *)fileManager dataWithContentsOfFileAtPath:v10 error:&v38];
    id v13 = v38;
    if (v13)
    {
      id v14 = v13;
      int v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[BMComputeXPCPublisherStorage readBookmarkForSubscriptionWithIdentifier:client:error:].cold.4();
      }

      if (a5)
      {
        id v14 = v14;
        id v16 = 0;
        *a5 = v14;
LABEL_30:

        goto LABEL_31;
      }
LABEL_19:
      id v16 = 0;
      goto LABEL_30;
    }
    if (![v12 length])
    {
      v28 = __biome_log_for_category();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        [(BMComputeXPCPublisherStorage *)self domain];
        v29 = BMStringForServiceDomain();
        *(_DWORD *)buf = 138412802;
        id v42 = v8;
        __int16 v43 = 2112;
        v44 = v29;
        __int16 v45 = 2112;
        v46 = v10;
        _os_log_impl(&dword_18E67D000, v28, OS_LOG_TYPE_INFO, "Empty bookmark file for subscription %@ domain: %@ path: %@", buf, 0x20u);
      }
      id v14 = 0;
      goto LABEL_19;
    }
    v24 = (void *)MEMORY[0x1E4F28DC0];
    v25 = objc_msgSend(MEMORY[0x1E4F28B90], "bm_allowedClassesForSecureCodingBMBookmark");
    id v37 = 0;
    v26 = [v24 unarchivedObjectOfClasses:v25 fromData:v12 error:&v37];
    id v14 = v37;

    if (v14)
    {
      v27 = __biome_log_for_category();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[BMComputeXPCPublisherStorage readBookmarkForSubscriptionWithIdentifier:client:error:]();
      }

      if (a5)
      {
        id v16 = 0;
        *a5 = v14;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      if ([v26 conformsToProtocol:&unk_1EDDF4CF8])
      {
        v30 = __biome_log_for_category();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          [(BMComputeXPCPublisherStorage *)self domain];
          v31 = BMStringForServiceDomain();
          *(_DWORD *)buf = 138412802;
          id v42 = v8;
          __int16 v43 = 2112;
          v44 = v31;
          __int16 v45 = 2112;
          v46 = v10;
          _os_log_impl(&dword_18E67D000, v30, OS_LOG_TYPE_INFO, "Read bookmark file for subscription %@ domain: %@ path: %@", buf, 0x20u);
        }
        id v16 = v26;
        goto LABEL_29;
      }
      v32 = __biome_log_for_category();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[BMComputeXPCPublisherStorage readBookmarkForSubscriptionWithIdentifier:client:error:]();
      }

      if (a5)
      {
        v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F4FAD8];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v40 = @"Not a bookmark";
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        *a5 = [v33 errorWithDomain:v34 code:0 userInfo:v35];
      }
    }
    id v16 = 0;
    goto LABEL_29;
  }
  int v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[BMComputeXPCPublisherStorage readBookmarkForSubscriptionWithIdentifier:client:error:](v10, v17, v18, v19, v20, v21, v22, v23);
  }
  id v16 = 0;
LABEL_31:

  return v16;
}

- (void)writeBookmark:(id)a3 forSubscriptionWithIdentifier:(id)a4 client:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 length])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
    v12 = v11;
    if (v8)
    {
      id v29 = 0;
      id v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v29];
      id v14 = v29;

      if (v14)
      {
        int v15 = __biome_log_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v31 = v8;
          __int16 v32 = 2112;
          id v33 = v9;
          __int16 v34 = 2112;
          v35 = v14;
          _os_log_error_impl(&dword_18E67D000, v15, OS_LOG_TYPE_ERROR, "Error archiving bookmark %@ for subscription %@. %@", buf, 0x20u);
        }
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      id v13 = v11;
    }
    int v15 = [(BMComputeXPCPublisherStorage *)self bookmarkPathForSessionStorageWithIdentifier:v9 client:v10];
    fileManager = self->_fileManager;
    id v28 = 0;
    char v24 = [(BMFileManager *)fileManager replaceFileAtPath:v15 withData:v13 protection:0xFFFFFFFFLL error:&v28];
    id v14 = v28;
    if ((v24 & 1) == 0)
    {
      v25 = __biome_log_for_category();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        id v31 = v8;
        __int16 v32 = 2112;
        id v33 = v9;
        __int16 v34 = 2112;
        v35 = v15;
        __int16 v36 = 2112;
        id v37 = v14;
        _os_log_error_impl(&dword_18E67D000, v25, OS_LOG_TYPE_ERROR, "Error writing bookmark %@ for subscription %@ to %@. %@", buf, 0x2Au);
      }
    }
    v26 = __biome_log_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      [(BMComputeXPCPublisherStorage *)self domain];
      v27 = BMStringForServiceDomain();
      *(_DWORD *)buf = 138412802;
      id v31 = v9;
      __int16 v32 = 2112;
      id v33 = v27;
      __int16 v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_18E67D000, v26, OS_LOG_TYPE_INFO, "Wrote bookmark file for subscription %@ domain: %@ path: %@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  id v14 = __biome_log_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[BMComputeXPCPublisherStorage writeBookmark:forSubscriptionWithIdentifier:client:](v14, v16, v17, v18, v19, v20, v21, v22);
  }
LABEL_17:
}

- (unint64_t)domain
{
  return self->_domain;
}

- (id)subscriptionMarkerPathForSessionStorageWithStream:(id)a3
{
  id v4 = a3;
  v5 = [(BMComputeXPCPublisherStorage *)self currentSessionSubscriptionsPath];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (id)currentSessionSubscriptionsPath
{
  v2 = [(BMComputeXPCPublisherStorage *)self currentSessionPath];
  v3 = [MEMORY[0x1E4F4FBA0] subscriptions];
  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

- (id)bookmarkPathForSessionStorageWithIdentifier:(id)a3 client:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BMComputeXPCPublisherStorage *)self currentSessionBookmarkClientOrServerPath];
  id v9 = [v8 stringByAppendingPathComponent:v6];

  id v10 = [v9 stringByAppendingPathComponent:v7];

  return v10;
}

- (id)currentSessionBookmarkClientOrServerPath
{
  if ([(BMComputeXPCPublisherStorage *)self isClient]) {
    [MEMORY[0x1E4F4FBA0] client];
  }
  else {
  v3 = [MEMORY[0x1E4F4FBA0] server];
  }
  id v4 = [(BMComputeXPCPublisherStorage *)self currentSessionBookmarkPath];
  v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

- (id)currentSessionBookmarkPath
{
  v2 = [(BMComputeXPCPublisherStorage *)self currentSessionPath];
  v3 = [MEMORY[0x1E4F4FBA0] bookmarks];
  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

- (id)currentSessionPath
{
  v2 = [(BMComputeXPCPublisherStorage *)self sessionsPath];
  v3 = [(id)objc_opt_class() currentSession];
  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

+ (id)currentSession
{
  v2 = objc_msgSend(MEMORY[0x1E4F29128], "bm_bootSessionUUID");
  v3 = [v2 UUIDString];

  return v3;
}

- (id)sessionsPath
{
  v2 = [(BMComputeXPCPublisherStorage *)self basePath];
  v3 = [MEMORY[0x1E4F4FBA0] sessions];
  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

- (id)basePath
{
  return (id)[MEMORY[0x1E4F4FB78] computeDirectoryForDomain:self->_domain];
}

- (BOOL)isClient
{
  return self->_isClient;
}

- (BOOL)checkActiveSubscriptionMarkerForStream:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(BMComputeXPCPublisherStorage *)self subscriptionMarkerPathForSessionStorageWithStream:v4];
  fileManager = self->_fileManager;
  id v15 = 0;
  LODWORD(v7) = [(BMFileManager *)fileManager fileExistsAtPath:v5 error:&v15];
  id v8 = v15;
  id v9 = @"NO";
  if (v7) {
    id v9 = @"YES";
  }
  id v10 = v9;
  if ((v7 & 1) == 0 && v8)
  {
    uint64_t v7 = __biome_log_for_category();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherStorage checkActiveSubscriptionMarkerForStream:]();
    }

    LOBYTE(v7) = 1;
    id v10 = @"unknown";
  }
  id v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    [(BMComputeXPCPublisherStorage *)self domain];
    v12 = BMStringForServiceDomain();
    id v13 = [MEMORY[0x1E4F4FB78] privacyPathname:v5];
    *(_DWORD *)buf = 138544130;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    id v19 = v4;
    __int16 v20 = 2114;
    uint64_t v21 = v12;
    __int16 v22 = 2114;
    uint64_t v23 = v13;
    _os_log_impl(&dword_18E67D000, v11, OS_LOG_TYPE_INFO, "Subscription marker exists: %{public}@ for stream: %{public}@ using domain: %{public}@ path: %{public}@", buf, 0x2Au);
  }
  return v7;
}

- (BMComputeXPCPublisherStorage)initWithUseCase:(id)a3 domain:(unint64_t)a4 isClient:(BOOL)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BMComputeXPCPublisherStorage;
  id v9 = [(BMComputeXPCPublisherStorage *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    v9->_domain = a4;
    v9->_isClient = a5;
    uint64_t v11 = [(BMComputeXPCPublisherStorage *)v9 newFileManagerWithUseCase:v8];
    fileManager = v10->_fileManager;
    v10->_fileManager = (BMFileManager *)v11;
  }
  return v10;
}

- (id)newFileManagerWithUseCase:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F4FB78];
  id v6 = [(BMComputeXPCPublisherStorage *)self basePath];
  if (([v5 pathIsManaged:v6 domain:0] & 1) == 0)
  {

    goto LABEL_5;
  }
  uint64_t v7 = [MEMORY[0x1E4F4FB80] current];
  int v8 = objc_msgSend(v7, "reliesOnDirectAccessForDomain:", -[BMComputeXPCPublisherStorage domain](self, "domain"));

  if (v8)
  {
LABEL_5:
    v12 = (void *)MEMORY[0x1E4F4FB68];
    id v10 = [(BMComputeXPCPublisherStorage *)self basePath];
    uint64_t v11 = [v12 fileManagerWithDirectAccessToDirectory:v10 cachingOptions:3];
    goto LABEL_6;
  }
  id v9 = (void *)MEMORY[0x1E4F4FB68];
  id v10 = [(BMComputeXPCPublisherStorage *)self basePath];
  uint64_t v11 = objc_msgSend(v9, "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:", v10, v4, -[BMComputeXPCPublisherStorage domain](self, "domain"), geteuid());
LABEL_6:
  id v13 = (void *)v11;

  return v13;
}

- (void).cxx_destruct
{
}

- (id)persistentPath
{
  v2 = [(BMComputeXPCPublisherStorage *)self basePath];
  v3 = [MEMORY[0x1E4F4FBA0] persistent];
  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

- (id)currentSessionNonwakingSubscriptionPath
{
  v2 = [(BMComputeXPCPublisherStorage *)self currentSessionPath];
  v3 = [MEMORY[0x1E4F4FBA0] nonwaking];
  id v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

- (void)initializeBiomeDSLDirectoryForBootSession
{
  OUTLINED_FUNCTION_4();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = [v1 currentSessionBookmarkPath];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_18E67D000, v0, v3, "BMComputeXPCSubscription error creating directory at DSL directory %@, %@", v4);
}

- (void)removeBookmarkFileForSubscriptionWithIdentifier:(id)a3 client:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    int v8 = [(BMComputeXPCPublisherStorage *)self bookmarkPathForSessionStorageWithIdentifier:v6 client:v7];
    fileManager = self->_fileManager;
    id v22 = 0;
    char v10 = [(BMFileManager *)fileManager removeFileAtPath:v8 error:&v22];
    uint64_t v11 = v22;
    v12 = __biome_log_for_category();
    id v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        [(BMComputeXPCPublisherStorage *)self domain];
        objc_super v14 = BMStringForServiceDomain();
        *(_DWORD *)buf = 138412802;
        id v24 = v6;
        __int16 v25 = 2112;
        v26 = v14;
        __int16 v27 = 2112;
        id v28 = v8;
        _os_log_impl(&dword_18E67D000, v13, OS_LOG_TYPE_INFO, "Removed bookmark file for subscription %@ domain: %@ path: %@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v6;
      __int16 v25 = 2112;
      v26 = v8;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_error_impl(&dword_18E67D000, v13, OS_LOG_TYPE_ERROR, "Error removing bookmark file for subscription %@ at path %@ error %@", buf, 0x20u);
    }
  }
  else
  {
    int v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherStorage removeBookmarkFileForSubscriptionWithIdentifier:client:](v8, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (void)writeNonWakingSubscription:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(BMComputeXPCPublisherStorage *)self isClient])
  {
    uint64_t v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherStorage writeNonWakingSubscription:]();
    }
  }
  else
  {
    uint64_t v5 = [v4 identifier];
    id v6 = [v4 client];
    if (([v4 waking] & 1) == 0 && v5 && v6)
    {
      id v18 = 0;
      id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v18];
      int v8 = v18;
      if (v8)
      {
        id v9 = v8;
        char v10 = __biome_log_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[BMComputeXPCPublisherStorage writeNonWakingSubscription:]();
        }
      }
      else
      {
        uint64_t v11 = [(BMComputeXPCPublisherStorage *)self currentSessionNonwakingSubscriptionPath];
        v12 = [v11 stringByAppendingPathComponent:v6];
        char v10 = [v12 stringByAppendingPathComponent:v5];

        fileManager = self->_fileManager;
        id v17 = 0;
        char v14 = [(BMFileManager *)fileManager replaceFileAtPath:v10 withData:v7 protection:4 error:&v17];
        id v9 = v17;
        if ((v14 & 1) == 0)
        {
          uint64_t v15 = __biome_log_for_category();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v20 = v4;
            __int16 v21 = 2112;
            id v22 = v10;
            __int16 v23 = 2112;
            id v24 = v9;
            _os_log_error_impl(&dword_18E67D000, v15, OS_LOG_TYPE_ERROR, "Error writing subscription %@ to %@. %@", buf, 0x20u);
          }
        }
        uint64_t v16 = __biome_log_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v20 = v4;
          __int16 v21 = 2112;
          id v22 = v10;
          _os_log_impl(&dword_18E67D000, v16, OS_LOG_TYPE_INFO, "Wrote subscription %@ to %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[BMComputeXPCPublisherStorage writeNonWakingSubscription:]();
      }
    }
  }
}

- (void)removeNonWakingSubscriptionWithIdentifier:(id)a3 client:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(BMComputeXPCPublisherStorage *)self isClient])
  {
    int v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherStorage removeNonWakingSubscriptionWithIdentifier:client:]();
    }
  }
  else if (v6 && v7)
  {
    uint64_t v9 = [(BMComputeXPCPublisherStorage *)self currentSessionNonwakingSubscriptionPath];
    char v10 = [(id)v9 stringByAppendingPathComponent:v7];
    int v8 = [v10 stringByAppendingPathComponent:v6];

    fileManager = self->_fileManager;
    id v15 = 0;
    LOBYTE(v9) = [(BMFileManager *)fileManager removeFileAtPath:v8 error:&v15];
    id v12 = v15;
    if ((v9 & 1) == 0)
    {
      id v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        id v17 = v7;
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2112;
        __int16 v21 = v8;
        __int16 v22 = 2112;
        id v23 = v12;
        _os_log_error_impl(&dword_18E67D000, v13, OS_LOG_TYPE_ERROR, "Error removing non-waking subscription %@/%@ at path %@ error %@", buf, 0x2Au);
      }
    }
    char v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      __int16 v21 = v8;
      _os_log_impl(&dword_18E67D000, v14, OS_LOG_TYPE_INFO, "Removed non-waking subscription %@/%@ at %@", buf, 0x20u);
    }
  }
  else
  {
    int v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherStorage removeNonWakingSubscriptionWithIdentifier:client:]();
    }
  }
}

- (id)readNonWakingSubscriptions:(id *)a3
{
  v50[1] = *MEMORY[0x1E4F143B8];
  if (![(BMComputeXPCPublisherStorage *)self isClient])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v8 = [(BMComputeXPCPublisherStorage *)self currentSessionNonwakingSubscriptionPath];
    fileManager = self->_fileManager;
    id v46 = 0;
    char v10 = [(BMFileManager *)fileManager contentsOfDirectoryAtPath:v8 error:&v46];
    id v11 = v46;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v12 = v10;
    uint64_t v31 = [v12 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v31)
    {
      uint64_t v13 = *(void *)v43;
      uint64_t v29 = *(void *)v43;
      v30 = a3;
      id v33 = v12;
      __int16 v34 = v8;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(v12);
          }
          uint64_t v32 = v14;
          uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8 * v14);
          uint64_t v16 = objc_msgSend(v8, "stringByAppendingPathComponent:", v15, v29);
          id v17 = self->_fileManager;
          id v41 = v11;
          v35 = (void *)v16;
          __int16 v18 = -[BMFileManager contentsOfDirectoryAtPath:error:](v17, "contentsOfDirectoryAtPath:error:");
          id v19 = v41;

          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v20 = v18;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v47 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v38;
            id v11 = v19;
            while (2)
            {
              uint64_t v24 = 0;
              uint64_t v25 = v11;
              do
              {
                if (*(void *)v38 != v23) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * v24);
                id v36 = v25;
                __int16 v27 = [(BMComputeXPCPublisherStorage *)self readNonwakingSubscriptionWithIdentifier:v26 client:v15 error:&v36];
                id v11 = v36;

                if (!v27)
                {
                  if (v30) {
                    id *v30 = v11;
                  }

                  id v12 = v33;
                  id v7 = 0;
                  int v8 = v34;
                  goto LABEL_25;
                }
                [v6 addObject:v27];

                ++v24;
                uint64_t v25 = v11;
              }
              while (v22 != v24);
              uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v47 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
          else
          {
            id v11 = v19;
          }

          uint64_t v14 = v32 + 1;
          id v12 = v33;
          int v8 = v34;
          uint64_t v13 = v29;
        }
        while (v32 + 1 != v31);
        uint64_t v31 = [v33 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v31);
    }

    id v7 = (void *)[v6 copy];
LABEL_25:

    goto LABEL_26;
  }
  if (a3)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v49 = *MEMORY[0x1E4F28568];
    v50[0] = @"Invalid for client to read non-waking subscriptions";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
    id v7 = 0;
    *a3 = (id)[v5 initWithDomain:@"BiomeComputeError" code:-1 userInfo:v6];
LABEL_26:

    goto LABEL_27;
  }
  id v7 = 0;
LABEL_27:

  return v7;
}

- (id)readNonwakingSubscriptionWithIdentifier:(id)a3 client:(id)a4 error:(id *)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(BMComputeXPCPublisherStorage *)self isClient])
  {
    if (!a5)
    {
      id v12 = 0;
      goto LABEL_27;
    }
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31[0] = @"Invalid for client to read non-waking subscriptions";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v12 = 0;
    *a5 = (id)[v10 initWithDomain:@"BiomeComputeError" code:-1 userInfo:v11];
  }
  else if ([v8 length] && objc_msgSend(v9, "length"))
  {
    uint64_t v13 = [(BMComputeXPCPublisherStorage *)self currentSessionNonwakingSubscriptionPath];
    uint64_t v14 = [v13 stringByAppendingPathComponent:v9];
    id v11 = [v14 stringByAppendingPathComponent:v8];

    fileManager = self->_fileManager;
    id v25 = 0;
    uint64_t v16 = [(BMFileManager *)fileManager dataWithContentsOfFileAtPath:v11 error:&v25];
    id v17 = v25;
    if (v17)
    {
      id v18 = v17;
      id v19 = __biome_log_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[BMComputeXPCPublisherStorage readBookmarkForSubscriptionWithIdentifier:client:error:].cold.4();
      }

      if (a5)
      {
        id v18 = v18;
        id v12 = 0;
        *a5 = v18;
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      id v24 = 0;
      id v20 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v16 error:&v24];
      id v18 = v24;
      if (v18)
      {
        uint64_t v21 = __biome_log_for_category();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[BMComputeXPCPublisherStorage readNonwakingSubscriptionWithIdentifier:client:error:]();
        }

        id v12 = 0;
        if (a5) {
          *a5 = v18;
        }
      }
      else
      {
        uint64_t v22 = __biome_log_for_category();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v27 = v20;
          __int16 v28 = 2112;
          uint64_t v29 = v11;
          _os_log_impl(&dword_18E67D000, v22, OS_LOG_TYPE_INFO, "Read subscription %@ from path: %@", buf, 0x16u);
        }

        id v12 = v20;
      }
    }
  }
  else
  {
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherStorage readNonwakingSubscriptionWithIdentifier:client:error:]();
    }
    id v12 = 0;
  }

LABEL_27:

  return v12;
}

- (void)writeActiveSubscriptionMarkerForStream:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BMComputeXPCPublisherStorage *)self subscriptionMarkerPathForSessionStorageWithStream:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  fileManager = self->_fileManager;
  id v14 = 0;
  int v8 = [(BMFileManager *)fileManager replaceFileAtPath:v5 withData:v6 protection:4 error:&v14];
  id v9 = v14;
  if ((v8 & 1) == 0)
  {
    id v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherStorage writeActiveSubscriptionMarkerForStream:]();
    }
  }
  id v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if (v8) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    [(BMComputeXPCPublisherStorage *)self domain];
    uint64_t v13 = BMStringForServiceDomain();
    *(_DWORD *)buf = 138413058;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2112;
    id v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v5;
    _os_log_impl(&dword_18E67D000, v11, OS_LOG_TYPE_INFO, "Wrote new active subscription marker with success: %@ for stream: %@ using domain: %@ path: %@", buf, 0x2Au);
  }
}

- (void)removeActiveSubscriptionMarkerForStream:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BMComputeXPCPublisherStorage *)self subscriptionMarkerPathForSessionStorageWithStream:v4];
  fileManager = self->_fileManager;
  id v13 = 0;
  int v7 = [(BMFileManager *)fileManager removeFileAtPath:v5 error:&v13];
  id v8 = v13;
  if ((v7 & 1) == 0)
  {
    id v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherStorage removeActiveSubscriptionMarkerForStream:]();
    }
  }
  id v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v7) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    [(BMComputeXPCPublisherStorage *)self domain];
    id v12 = BMStringForServiceDomain();
    *(_DWORD *)buf = 138413058;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 2112;
    __int16 v19 = v12;
    __int16 v20 = 2112;
    __int16 v21 = v5;
    _os_log_impl(&dword_18E67D000, v10, OS_LOG_TYPE_INFO, "Removed active subscription marker with success: %@ for stream: %@ using domain: %@ path: %@", buf, 0x2Au);
  }
}

+ (id)bookmarkStorageForCurrentProcess
{
  v2 = [BMComputeXPCPublisherStorage alloc];
  uint64_t v3 = [(BMComputeXPCPublisherStorage *)v2 initWithUseCase:*MEMORY[0x1E4F4FAF8] domain:0 isClient:1];

  return v3;
}

- (void)readBookmarkForSubscriptionWithIdentifier:(uint64_t)a3 client:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)readBookmarkForSubscriptionWithIdentifier:client:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "Error: contents of path %@ do not conform to BMBookmark", v2, v3, v4, v5, v6);
}

- (void)readBookmarkForSubscriptionWithIdentifier:client:error:.cold.3()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Error decoding data from path %@, error %@");
}

- (void)readBookmarkForSubscriptionWithIdentifier:client:error:.cold.4()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Error reading contents of %@. %@");
}

- (void)writeBookmark:(uint64_t)a3 forSubscriptionWithIdentifier:(uint64_t)a4 client:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeBookmarkFileForSubscriptionWithIdentifier:(uint64_t)a3 client:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeNonWakingSubscription:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "Invalid for client to write non-waking subscription %@", v2, v3, v4, v5, v6);
}

- (void)writeNonWakingSubscription:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_18E67D000, v0, v1, "Invalid attempt to write subscription: %@", v2, v3, v4, v5, v6);
}

- (void)writeNonWakingSubscription:.cold.3()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Error archiving subscription %@. %@");
}

- (void)removeNonWakingSubscriptionWithIdentifier:client:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Invalid for client to remove non-waking subscription %@/%@");
}

- (void)removeNonWakingSubscriptionWithIdentifier:client:.cold.2()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Invalid attempt to remove non-waking subscription: %@/%@");
}

- (void)readNonwakingSubscriptionWithIdentifier:client:error:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Invalid subscription identifier/client when attempting to read subscription, %@/%@");
}

- (void)readNonwakingSubscriptionWithIdentifier:client:error:.cold.2()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Error decoding subscription data from path %@, error %@");
}

- (void)checkActiveSubscriptionMarkerForStream:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Failed to check presence of active subscription marker for %{public}@, %{public}@");
}

- (void)writeActiveSubscriptionMarkerForStream:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Failed to write active subscription marker for stream %@, %@");
}

- (void)removeActiveSubscriptionMarkerForStream:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Failed to remove active subscription marker for stream %@, %@");
}

@end