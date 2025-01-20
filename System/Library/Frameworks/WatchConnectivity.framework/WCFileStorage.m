@interface WCFileStorage
+ (id)sharedInstance;
- (BOOL)removeItemAtURL:(id)a3 numberOfRetries:(unint64_t)a4 error:(id *)a5;
- (NSArray)outstandingFileTransfers;
- (NSString)pairingID;
- (OS_dispatch_queue)fileQueue;
- (WCContentIndex)fileIndex;
- (WCContentIndex)fileResultsIndex;
- (WCContentIndex)userInfoIndex;
- (WCContentIndex)userInfoResultsIndex;
- (WCFileStorage)init;
- (id)appContextFolderURL:(BOOL)a3;
- (id)appendPathForFileTransfer:(id)a3 toPath:(id)a4;
- (id)homeDirectoryURL;
- (id)loadAppContextDataFromInbox;
- (id)loadAppContextReceived:(BOOL)a3;
- (id)loadOutstandingFileTransfers;
- (id)loadOutstandingUserInfoTransfersAndComplicationUserInfo:(id *)a3;
- (id)localAppContextFolderURL;
- (id)outgoingFileTransferPath;
- (id)persistOutgoingUserInfoTransfer:(id)a3;
- (id)receivedAppContextFolderURL;
- (void)cleanUpOldPairingIDFolderInFolder:(id)a3 pairedDevicesPairingIDs:(id)a4;
- (void)cleanUpOldPairingIDFoldersWithPairedDevicesPairingIDs:(id)a3;
- (void)cleanUpWatchContentDirectoryWithCurrentAppInstallationID:(id)a3;
- (void)cleanupSessionFileFromInbox:(id)a3;
- (void)createWatchDirectoryIfNeeded:(id)a3;
- (void)deleteAppContextDataFromInbox;
- (void)deleteAppContextReceived:(BOOL)a3;
- (void)deleteFileFolderForSessionFileFromInbox:(id)a3;
- (void)deleteOutstandingFileTransfer:(id)a3;
- (void)deleteOutstandingUserInfoTransfer:(id)a3;
- (void)deleteRelatedMetadataForSessionFileFromInbox:(id)a3;
- (void)deleteUserInfoTransferFromInbox:(id)a3;
- (void)enumerateFileTransferResultsWithBlock:(id)a3;
- (void)enumerateIncomingFilesWithBlock:(id)a3;
- (void)enumerateIncomingUserInfosWithBlock:(id)a3;
- (void)enumerateUserInfoResultsWithBlock:(id)a3;
- (void)loadAppContextDataFromInbox;
- (void)persistAppContextData:(id)a3 received:(BOOL)a4;
- (void)persistOutgoingFileTransfer:(id)a3;
- (void)resetIndexes;
- (void)setFileIndex:(id)a3;
- (void)setFileQueue:(id)a3;
- (void)setFileResultsIndex:(id)a3;
- (void)setOutstandingFileTransfers:(id)a3;
- (void)setPairingID:(id)a3;
- (void)setUserInfoIndex:(id)a3;
- (void)setUserInfoResultsIndex:(id)a3;
@end

@implementation WCFileStorage

uint64_t __31__WCFileStorage_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (WCFileStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)WCFileStorage;
  v2 = [(WCFileStorage *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.private.watchconnectivity.file-storage-queue", 0);
    fileQueue = v2->_fileQueue;
    v2->_fileQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WCFileStorage_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

- (void)createWatchDirectoryIfNeeded:(id)a3
{
  id v3 = a3;
  char v13 = 0;
  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5 isDirectory:&v13];

  if (v6)
  {
    if (v13)
    {
LABEL_12:
      id v10 = 0;
      goto LABEL_13;
    }
    v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WCFileStorage createWatchDirectoryIfNeeded:](v7);
    }

    WCDeleteItemAtURL(v3);
  }
  if (!v3) {
    goto LABEL_12;
  }
  v8 = [MEMORY[0x263F08850] defaultManager];
  id v12 = 0;
  char v9 = [v8 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0 && v10)
  {
    v11 = wc_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WCFileStorage createWatchDirectoryIfNeeded:](v3);
    }
  }
LABEL_13:
}

- (void)setPairingID:(id)a3
{
  id v6 = a3;
  if ((-[NSString isEqual:](self->_pairingID, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    pairingID = self->_pairingID;
    self->_pairingID = v4;

    [(WCFileStorage *)self resetIndexes];
  }
}

- (void)resetIndexes
{
  id v3 = [(WCFileStorage *)self fileIndex];
  [v3 invalidate];

  [(WCFileStorage *)self setFileIndex:0];
  v4 = [(WCFileStorage *)self fileResultsIndex];
  [v4 invalidate];

  [(WCFileStorage *)self setFileResultsIndex:0];
  v5 = [(WCFileStorage *)self userInfoIndex];
  [v5 invalidate];

  [(WCFileStorage *)self setUserInfoIndex:0];
  id v6 = [(WCFileStorage *)self userInfoResultsIndex];
  [v6 invalidate];

  [(WCFileStorage *)self setUserInfoResultsIndex:0];
}

- (id)loadOutstandingFileTransfers
{
  v34[1] = *MEMORY[0x263EF8340];
  v2 = NSURL;
  id v3 = [(WCFileStorage *)self outgoingFileTransferPath];
  v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  v34[0] = *MEMORY[0x263EFF6F0];
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
  id v6 = [MEMORY[0x263F08850] defaultManager];
  v7 = [v6 enumeratorAtURL:v4 includingPropertiesForKeys:v5 options:4 errorHandler:&__block_literal_global_3];

  v8 = objc_opt_new();
  uint64_t v9 = [v7 nextObject];
  if (v9)
  {
    id v10 = (void *)v9;
    do
    {
      v11 = [v10 lastPathComponent];
      int v12 = [v11 isEqual:@"file-transfer-data"];

      if (v12)
      {
        char v13 = (void *)MEMORY[0x263EFF8F8];
        v14 = [v10 path];
        v15 = [v13 dataWithContentsOfFile:v14];

        if (v15)
        {
          v16 = (void *)MEMORY[0x263F08928];
          uint64_t v17 = objc_opt_class();
          id v27 = 0;
          v18 = [v16 unarchivedObjectOfClass:v17 fromData:v15 error:&v27];
          v19 = v27;
          if (v18)
          {
            v20 = [v18 transferIdentifier];
            [v8 setObject:v18 forKeyedSubscript:v20];
          }
          else
          {
            v20 = wc_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v26 = [v10 path];
              v24 = v19;
              v25 = NSPrintF();
              *(_DWORD *)buf = 136446722;
              v29 = "-[WCFileStorage loadOutstandingFileTransfers]";
              __int16 v30 = 2114;
              v31 = v26;
              __int16 v32 = 2114;
              v33 = v25;
              _os_log_error_impl(&dword_222A02000, v20, OS_LOG_TYPE_ERROR, "%{public}s could not unarchive file at path %{public}@ due to %{public}@", buf, 0x20u);
            }
          }
        }
        else
        {
          v19 = wc_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v21 = [v10 path];
            *(_DWORD *)buf = 136446466;
            v29 = "-[WCFileStorage loadOutstandingFileTransfers]";
            __int16 v30 = 2114;
            v31 = v21;
            _os_log_error_impl(&dword_222A02000, v19, OS_LOG_TYPE_ERROR, "%{public}s could not find file at path %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v22 = objc_msgSend(v7, "nextObject", v24);

      id v10 = (void *)v22;
    }
    while (v22);
  }

  return v8;
}

uint64_t __45__WCFileStorage_loadOutstandingFileTransfers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if ([v3 code] != -1100 && objc_msgSend(v3, "code") != 260)
  {
    v4 = wc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__WCFileStorage_loadOutstandingFileTransfers__block_invoke_cold_1();
    }
  }
  return 1;
}

- (void)persistOutgoingFileTransfer:(id)a3
{
  id v4 = a3;
  v5 = [(WCFileStorage *)self outgoingFileTransferPath];
  id v6 = [(WCFileStorage *)self appendPathForFileTransfer:v4 toPath:v5];

  v7 = [MEMORY[0x263F08850] defaultManager];
  id v16 = 0;
  [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v16];
  id v8 = v16;

  if (v8)
  {
    uint64_t v9 = wc_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WCFileStorage persistOutgoingFileTransfer:]();
    }
  }
  else
  {
    id v15 = 0;
    uint64_t v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v15];
    id v8 = v15;
    if (v9)
    {
      id v10 = [v6 stringByAppendingPathComponent:@"file-transfer-data"];
      v11 = [NSURL fileURLWithPath:v10 isDirectory:0];

      id v14 = 0;
      char v12 = [v9 writeToURL:v11 options:1073741825 error:&v14];
      id v8 = v14;
      if ((v12 & 1) == 0)
      {
        char v13 = wc_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[WCFileStorage persistOutgoingFileTransfer:]();
        }
      }
    }
    else
    {
      id v10 = wc_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WCFileStorage persistOutgoingFileTransfer:]();
      }
    }
  }
}

- (void)deleteOutstandingFileTransfer:(id)a3
{
  id v4 = a3;
  v5 = [(WCFileStorage *)self outgoingFileTransferPath];
  id v6 = [(WCFileStorage *)self appendPathForFileTransfer:v4 toPath:v5];

  v7 = [MEMORY[0x263F08850] defaultManager];
  id v11 = 0;
  char v8 = [v7 removeItemAtPath:v6 error:&v11];
  id v9 = v11;

  if ((v8 & 1) == 0
    && [v9 code] != -1100
    && [v9 code] != 260
    && [v9 code] != 4)
  {
    id v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WCFileStorage deleteOutstandingFileTransfer:]();
    }
  }
}

- (id)persistOutgoingUserInfoTransfer:(id)a3
{
  id v4 = a3;
  v5 = [(WCFileStorage *)self homeDirectoryURL];
  id v6 = [(WCFileStorage *)self pairingID];
  v7 = WCUserInfoTransfersInContainer((uint64_t)v5, v6);

  char v8 = [v4 transferIdentifier];
  id v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:1];

  id v10 = [MEMORY[0x263F08850] defaultManager];
  id v26 = 0;
  int v11 = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v12 = v26;

  if (v11)
  {
    char v13 = [v9 URLByAppendingPathComponent:@"userinfo-transfer-object-data" isDirectory:0];

    id v25 = 0;
    id v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v25];
    id v15 = v25;
    id v12 = v15;
    if (v14)
    {
      id v24 = v15;
      int v16 = [v14 writeToURL:v13 options:1073741825 error:&v24];
      id v17 = v24;

      if (!v16)
      {
        v19 = wc_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[WCFileStorage persistOutgoingUserInfoTransfer:]();
        }
        v18 = 0;
        id v12 = v17;
        goto LABEL_17;
      }
      v18 = [v9 URLByAppendingPathComponent:@"userinfo-transfer-wire-data" isDirectory:0];
      v19 = [v4 protobufData];
      id v23 = v17;
      char v20 = [v19 writeToURL:v18 options:1073741825 error:&v23];
      id v12 = v23;

      if (v20)
      {
LABEL_17:

        goto LABEL_18;
      }

      v21 = wc_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[WCFileStorage persistOutgoingUserInfoTransfer:]();
      }
    }
    else
    {
      v19 = wc_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[WCFileStorage persistOutgoingUserInfoTransfer:]();
      }
    }
    v18 = 0;
    goto LABEL_17;
  }
  char v13 = wc_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[WCFileStorage persistOutgoingUserInfoTransfer:].cold.4();
  }
  v18 = 0;
LABEL_18:

  return v18;
}

- (id)loadOutstandingUserInfoTransfersAndComplicationUserInfo:(id *)a3
{
  v40[1] = *MEMORY[0x263EF8340];
  v5 = [(WCFileStorage *)self homeDirectoryURL];
  id v6 = [(WCFileStorage *)self pairingID];
  uint64_t v7 = WCUserInfoTransfersInContainer((uint64_t)v5, v6);

  v40[0] = *MEMORY[0x263EFF6F0];
  char v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
  id v9 = [MEMORY[0x263F08850] defaultManager];
  __int16 v32 = (void *)v7;
  id v10 = [v9 enumeratorAtURL:v7 includingPropertiesForKeys:v8 options:4 errorHandler:&__block_literal_global_12];

  int v11 = objc_opt_new();
  uint64_t v12 = [v10 nextObject];
  if (v12)
  {
    char v13 = (void *)v12;
    do
    {
      id v14 = [v13 lastPathComponent];
      int v15 = [v14 isEqual:@"userinfo-transfer-object-data"];

      if (v15)
      {
        int v16 = (void *)MEMORY[0x263EFF8F8];
        id v17 = [v13 path];
        v18 = [v16 dataWithContentsOfFile:v17];

        if (v18)
        {
          v19 = (void *)MEMORY[0x263F08928];
          uint64_t v20 = objc_opt_class();
          id v33 = 0;
          v21 = [v19 unarchivedObjectOfClass:v20 fromData:v18 error:&v33];
          uint64_t v22 = v33;
          if (v21)
          {
            id v23 = [v21 transferIdentifier];
            [v11 setObject:v21 forKeyedSubscript:v23];

            int v24 = [v21 isCurrentComplicationInfo];
            if (a3 && v24) {
              *a3 = v21;
            }
          }
          else
          {
            id v26 = wc_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v31 = [v13 path];
              v29 = v22;
              __int16 v30 = NSPrintF();
              *(_DWORD *)buf = 136446722;
              v35 = "-[WCFileStorage loadOutstandingUserInfoTransfersAndComplicationUserInfo:]";
              __int16 v36 = 2114;
              v37 = v31;
              __int16 v38 = 2114;
              v39 = v30;
              _os_log_error_impl(&dword_222A02000, v26, OS_LOG_TYPE_ERROR, "%{public}s could not unarchive user info at path %{public}@ due to %{public}@", buf, 0x20u);
            }
          }
        }
        else
        {
          uint64_t v22 = wc_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            id v25 = [v13 path];
            *(_DWORD *)buf = 136446466;
            v35 = "-[WCFileStorage loadOutstandingUserInfoTransfersAndComplicationUserInfo:]";
            __int16 v36 = 2114;
            v37 = v25;
            _os_log_error_impl(&dword_222A02000, v22, OS_LOG_TYPE_ERROR, "%{public}s could not find file at path %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v27 = objc_msgSend(v10, "nextObject", v29);

      char v13 = (void *)v27;
    }
    while (v27);
  }

  return v11;
}

uint64_t __73__WCFileStorage_loadOutstandingUserInfoTransfersAndComplicationUserInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if ([v3 code] != -1100 && objc_msgSend(v3, "code") != 260)
  {
    id v4 = wc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__WCFileStorage_loadOutstandingUserInfoTransfersAndComplicationUserInfo___block_invoke_cold_1();
    }
  }
  return 1;
}

- (void)deleteOutstandingUserInfoTransfer:(id)a3
{
  id v4 = a3;
  v5 = [(WCFileStorage *)self pairingID];

  if (v5)
  {
    id v6 = [(WCFileStorage *)self homeDirectoryURL];
    uint64_t v7 = [(WCFileStorage *)self pairingID];
    char v8 = WCUserInfoTransfersInContainer((uint64_t)v6, v7);

    uint64_t v9 = [v4 transferIdentifier];
    id v10 = [v8 URLByAppendingPathComponent:v9 isDirectory:1];

    id v14 = 0;
    LOBYTE(v9) = [(WCFileStorage *)self removeItemAtURL:v10 numberOfRetries:5 error:&v14];
    id v11 = v14;
    uint64_t v12 = v11;
    if ((v9 & 1) == 0
      && [v11 code] != -1100
      && [v12 code] != 260
      && [v12 code] != 4)
    {
      char v13 = wc_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[WCFileStorage deleteOutstandingUserInfoTransfer:]();
      }
    }
  }
}

- (void)enumerateFileTransferResultsWithBlock:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void, uint8_t *))a3;
  v5 = [(WCFileStorage *)self homeDirectoryURL];
  id v6 = [(WCFileStorage *)self pairingID];
  uint64_t v7 = WCFileTransfersURLInContainer((uint64_t)v5, v6);

  char v8 = (void *)v7;
  uint64_t v9 = [(WCFileStorage *)self fileResultsIndex];

  if (!v9)
  {
    id v10 = [[WCContentIndex alloc] initWithContainingFolder:v7];
    [(WCFileStorage *)self setFileResultsIndex:v10];
  }
  id v11 = [(WCFileStorage *)self fileResultsIndex];
  uint64_t v12 = [v11 index];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v12;
  uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v56;
    v42 = v4;
    v43 = (void *)v7;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v56 != v46) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v55 + 1) + 8 * v13);
        int v15 = wc_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v60 = "-[WCFileStorage enumerateFileTransferResultsWithBlock:]";
          __int16 v61 = 2114;
          v62 = v14;
          _os_log_impl(&dword_222A02000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
        }

        int v16 = [v8 URLByAppendingPathComponent:v14 isDirectory:1];
        id v17 = [v16 URLByAppendingPathComponent:@"file-transfer-result" isDirectory:0];

        v18 = (void *)MEMORY[0x263EFF8F8];
        v19 = [v17 path];
        id v54 = 0;
        uint64_t v20 = [v18 dataWithContentsOfFile:v19 options:2 error:&v54];
        id v21 = v54;

        if (v20)
        {
          uint64_t v22 = (void *)MEMORY[0x263EFFA08];
          v65[0] = objc_opt_class();
          v65[1] = objc_opt_class();
          v65[2] = objc_opt_class();
          id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:3];
          int v24 = [v22 setWithArray:v23];

          id v53 = 0;
          id v25 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v24 fromData:v20 error:&v53];
          id v21 = v53;
          if (v25)
          {
            v45 = v25;
            id v26 = [v17 URLByDeletingLastPathComponent];
            uint64_t v27 = [v26 URLByAppendingPathComponent:@"file-transfer-data" isDirectory:0];

            v28 = (void *)MEMORY[0x263EFF8F8];
            log = v27;
            v29 = [v27 path];
            id v52 = 0;
            __int16 v30 = [v28 dataWithContentsOfFile:v29 options:2 error:&v52];
            id v21 = v52;

            v31 = v14;
            if (v30)
            {

              __int16 v32 = (void *)MEMORY[0x263F08928];
              uint64_t v33 = objc_opt_class();
              id v51 = 0;
              v34 = [v32 unarchivedObjectOfClass:v33 fromData:v30 error:&v51];
              id v21 = v51;
              if (v34)
              {
                v35 = [v45 objectForKeyedSubscript:@"WCFileTransferResultError"];
                [v34 setTransferError:v35];
                goto LABEL_24;
              }
              v35 = wc_log();
              char v8 = v43;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                v40 = NSPrintF();
                *(_DWORD *)buf = 136446722;
                v60 = "-[WCFileStorage enumerateFileTransferResultsWithBlock:]";
                __int16 v61 = 2114;
                v62 = v31;
                __int16 v63 = 2114;
                v64 = v40;
                _os_log_error_impl(&dword_222A02000, v35, OS_LOG_TYPE_ERROR, "%{public}s could not unarchive file %{public}@ due to %{public}@", buf, 0x20u);

                char v8 = v43;
              }
              v34 = 0;
            }
            else
            {
              __int16 v36 = [v17 URLByDeletingLastPathComponent];

              WCDeleteItemAtURL(v36);
              v35 = wc_log();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                [(WCFileStorage *)&v49 enumerateFileTransferResultsWithBlock:v35];
              }
              v34 = 0;
              id v17 = v36;
LABEL_24:
              char v8 = v43;
            }

            id v4 = v42;
            id v25 = v45;
          }
          else
          {
            log = wc_log();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v39 = NSPrintF();
              *(_DWORD *)buf = 136446722;
              v60 = "-[WCFileStorage enumerateFileTransferResultsWithBlock:]";
              __int16 v61 = 2114;
              v31 = v14;
              v62 = v14;
              __int16 v63 = 2114;
              v64 = v39;
              _os_log_error_impl(&dword_222A02000, log, OS_LOG_TYPE_ERROR, "%{public}s could not unarchive results %{public}@ due to %{public}@", buf, 0x20u);

              id v25 = 0;
            }
            else
            {
              v31 = v14;
            }
            v34 = 0;
          }

          goto LABEL_30;
        }
        v31 = v14;
        int v24 = wc_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          __int16 v38 = [v17 path];
          *(_DWORD *)buf = 136446466;
          v60 = "-[WCFileStorage enumerateFileTransferResultsWithBlock:]";
          __int16 v61 = 2114;
          v62 = v38;
          _os_log_error_impl(&dword_222A02000, v24, OS_LOG_TYPE_ERROR, "%{public}s could not load file data at path %{public}@", buf, 0x16u);
        }
        v34 = 0;
LABEL_30:

        buf[0] = 0;
        ((void (**)(id, void *, void *, uint8_t *))v4)[2](v4, v34, v31, buf);
        int v37 = buf[0];

        if (v37) {
          goto LABEL_35;
        }
        ++v13;
      }
      while (v47 != v13);
      uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v66 count:16];
      uint64_t v47 = v41;
    }
    while (v41);
  }
LABEL_35:
}

- (void)persistAppContextData:(id)a3 received:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(WCFileStorage *)self appContextFolderURL:v4];
  char v8 = [v7 URLByAppendingPathComponent:@"context" isDirectory:0];
  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  id v16 = 0;
  int v10 = [v9 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v16];
  id v11 = v16;

  if (!v10)
  {
    id v14 = wc_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[WCFileStorage persistAppContextData:received:]();
    }
    id v13 = v11;
    goto LABEL_8;
  }
  id v15 = v11;
  char v12 = [v6 writeToURL:v8 options:1073741825 error:&v15];
  id v13 = v15;

  if ((v12 & 1) == 0)
  {
    id v14 = wc_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[WCFileStorage persistAppContextData:received:]();
    }
LABEL_8:
  }
}

- (id)loadAppContextReceived:(BOOL)a3
{
  id v3 = -[WCFileStorage appContextFolderURL:](self, "appContextFolderURL:");
  BOOL v4 = [v3 URLByAppendingPathComponent:@"context" isDirectory:0];
  id v13 = 0;
  v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4 options:0 error:&v13];
  id v6 = v13;
  uint64_t v7 = v6;
  if (v5)
  {
    id v12 = v6;
    char v8 = WCDeserializePayloadData(v5, &v12);
    id v9 = v12;

    if (v9)
    {
      int v10 = wc_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WCFileStorage loadAppContextReceived:]();
      }

LABEL_6:
      char v8 = MEMORY[0x263EFFA78];
      uint64_t v7 = v9;
      goto LABEL_13;
    }
    uint64_t v7 = 0;
  }
  else
  {
    if (v6 && [v6 code] != -1100 && objc_msgSend(v7, "code") != 260 && objc_msgSend(v7, "code") != 4)
    {
      char v8 = wc_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[WCFileStorage loadAppContextReceived:]();
      }
      id v9 = v7;
      goto LABEL_6;
    }
    char v8 = MEMORY[0x263EFFA78];
  }
LABEL_13:

  return v8;
}

- (void)deleteAppContextReceived:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(WCFileStorage *)self pairingID];

  if (v5)
  {
    id v6 = [(WCFileStorage *)self appContextFolderURL:v3];
    id v11 = 0;
    BOOL v7 = [(WCFileStorage *)self removeItemAtURL:v6 numberOfRetries:5 error:&v11];
    id v8 = v11;
    id v9 = v8;
    if (!v7 && [v8 code] != -1100 && objc_msgSend(v9, "code") != 260 && objc_msgSend(v9, "code") != 4)
    {
      int v10 = wc_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WCFileStorage deleteAppContextReceived:]();
      }
    }
  }
}

- (id)loadAppContextDataFromInbox
{
  BOOL v3 = [(WCFileStorage *)self homeDirectoryURL];
  BOOL v4 = [(WCFileStorage *)self pairingID];
  v5 = WCInboxAppContextFolderURLInContainer((uint64_t)v3, v4);

  id v6 = [v5 URLByAppendingPathComponent:@"context" isDirectory:0];
  id v12 = 0;
  BOOL v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v6 options:0 error:&v12];
  id v8 = v12;
  id v9 = v8;
  if (v8 && [v8 code] != -1100 && objc_msgSend(v9, "code") != 260 && objc_msgSend(v9, "code") != 4)
  {
    int v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WCFileStorage loadAppContextDataFromInbox]();
    }
  }

  return v7;
}

- (void)deleteAppContextDataFromInbox
{
  OUTLINED_FUNCTION_16();
  v2 = [v1 path];
  uint64_t v10 = v0;
  BOOL v3 = NSPrintF();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v4, v5, "%{public}s couldn't delete application context from inbox %{public}@ %{public}@", v6, v7, v8, v9, v10, v11, 2u);
}

- (void)enumerateIncomingFilesWithBlock:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  int v4 = (void (**)(id, void *, void, uint8_t *))a3;
  int v5 = [(WCFileStorage *)self homeDirectoryURL];
  int v6 = [(WCFileStorage *)self pairingID];
  __int16 v32 = WCSessionFilesURLInContainer((uint64_t)v5, v6);

  int v7 = [(WCFileStorage *)self fileIndex];

  if (!v7)
  {
    int v8 = [[WCContentIndex alloc] initWithContainingFolder:v32];
    [(WCFileStorage *)self setFileIndex:v8];
  }
  int v9 = [(WCFileStorage *)self fileIndex];
  uint64_t v10 = [v9 index];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v31 = *(void *)v36;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v35 + 1) + 8 * v13);
        id v15 = wc_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v40 = "-[WCFileStorage enumerateIncomingFilesWithBlock:]";
          __int16 v41 = 2114;
          v42 = v14;
          _os_log_impl(&dword_222A02000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
        }

        id v16 = [v32 URLByAppendingPathComponent:v14 isDirectory:1];
        id v17 = [v16 URLByAppendingPathComponent:@"session-file-data" isDirectory:0];

        v18 = (void *)MEMORY[0x263EFF8F8];
        v19 = [v17 path];
        id v34 = 0;
        uint64_t v20 = [v18 dataWithContentsOfFile:v19 options:2 error:&v34];
        id v21 = v34;

        if (v20)
        {

          uint64_t v22 = (void *)MEMORY[0x263F08928];
          uint64_t v23 = objc_opt_class();
          id v33 = 0;
          int v24 = [v22 unarchivedObjectOfClass:v23 fromData:v20 error:&v33];
          id v21 = v33;
          if (v24) {
            goto LABEL_17;
          }
          id v25 = wc_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v26 = NSPrintF();
            *(_DWORD *)buf = 136446722;
            v40 = "-[WCFileStorage enumerateIncomingFilesWithBlock:]";
            __int16 v41 = 2114;
            v42 = v14;
            __int16 v43 = 2114;
            v44 = v26;
            _os_log_error_impl(&dword_222A02000, v25, OS_LOG_TYPE_ERROR, "%{public}s couldn't unarchive file %{public}@ due to %{public}@", buf, 0x20u);
          }
        }
        else
        {
          id v25 = wc_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v28 = [v17 path];
            v29 = NSPrintF();
            *(_DWORD *)buf = 136446722;
            v40 = "-[WCFileStorage enumerateIncomingFilesWithBlock:]";
            __int16 v41 = 2114;
            v42 = v28;
            __int16 v43 = 2114;
            v44 = v29;
            _os_log_error_impl(&dword_222A02000, v25, OS_LOG_TYPE_ERROR, "%{public}s could not load file data at path %{public}@ due to %{public}@", buf, 0x20u);
          }
        }

        int v24 = 0;
LABEL_17:
        buf[0] = 0;
        ((void (**)(id, void *, void *, uint8_t *))v4)[2](v4, v24, v14, buf);
        int v27 = buf[0];

        if (v27) {
          goto LABEL_20;
        }
        ++v13;
      }
      while (v12 != v13);
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v12);
  }
LABEL_20:
}

- (void)cleanupSessionFileFromInbox:(id)a3
{
  id v4 = a3;
  [(WCFileStorage *)self deleteRelatedMetadataForSessionFileFromInbox:v4];
  [(WCFileStorage *)self deleteFileFolderForSessionFileFromInbox:v4];
}

- (void)deleteRelatedMetadataForSessionFileFromInbox:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(WCFileStorage *)self homeDirectoryURL];
  int v6 = [(WCFileStorage *)self pairingID];
  int v7 = WCSessionFilesURLInContainer((uint64_t)v5, v6);

  uint64_t v8 = [v4 fileIdentifier];
  int v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:1];

  id v14 = 0;
  LOBYTE(v8) = [(WCFileStorage *)self removeItemAtURL:v9 numberOfRetries:5 error:&v14];
  id v10 = v14;
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = wc_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v9 path];
      uint64_t v13 = NSPrintF();
      *(_DWORD *)buf = 136446978;
      id v16 = "-[WCFileStorage deleteRelatedMetadataForSessionFileFromInbox:]";
      __int16 v17 = 2114;
      id v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      uint64_t v22 = v13;
      _os_log_error_impl(&dword_222A02000, v11, OS_LOG_TYPE_ERROR, "%{public}s couldn't delete persistent session file %{public}@ %{public}@ %{public}@", buf, 0x2Au);
    }
  }
}

- (void)deleteFileFolderForSessionFileFromInbox:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(WCFileStorage *)self homeDirectoryURL];
  int v6 = [(WCFileStorage *)self pairingID];
  int v7 = WCTransferredFilesURLInContainer((uint64_t)v5, v6);

  uint64_t v8 = [v4 fileIdentifier];
  int v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:1];

  id v14 = 0;
  LOBYTE(v8) = [(WCFileStorage *)self removeItemAtURL:v9 numberOfRetries:5 error:&v14];
  id v10 = v14;
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = wc_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v9 path];
      uint64_t v13 = NSPrintF();
      *(_DWORD *)buf = 136446978;
      id v16 = "-[WCFileStorage deleteFileFolderForSessionFileFromInbox:]";
      __int16 v17 = 2114;
      id v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      __int16 v21 = 2114;
      uint64_t v22 = v13;
      _os_log_error_impl(&dword_222A02000, v11, OS_LOG_TYPE_ERROR, "%{public}s couldn't delete file folder %{public}@ %{public}@ %{public}@", buf, 0x2Au);
    }
  }
}

- (void)enumerateIncomingUserInfosWithBlock:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void, uint8_t *))a3;
  int v5 = [(WCFileStorage *)self homeDirectoryURL];
  int v6 = [(WCFileStorage *)self pairingID];
  id v34 = WCTransferredUserInfoInboxURLInContainer((uint64_t)v5, v6);

  int v7 = [(WCFileStorage *)self userInfoIndex];

  if (!v7)
  {
    uint64_t v8 = [[WCContentIndex alloc] initWithContainingFolder:v34];
    [(WCFileStorage *)self setUserInfoIndex:v8];
  }
  int v9 = [(WCFileStorage *)self userInfoIndex];
  id v10 = [v9 index];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v33 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v15 = objc_msgSend(v34, "URLByAppendingPathComponent:isDirectory:", v14, 1, v29);
        id v16 = [v15 URLByAppendingPathComponent:@"userinfo-transfer-object-data" isDirectory:0];

        __int16 v17 = (void *)MEMORY[0x263EFF8F8];
        id v18 = [v16 path];
        id v36 = 0;
        __int16 v19 = [v17 dataWithContentsOfFile:v18 options:2 error:&v36];
        id v20 = v36;

        if (!v19)
        {
          id v26 = wc_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v28 = [v16 path];
            id v29 = v20;
            uint64_t v31 = NSPrintF();
            *(_DWORD *)buf = 136446722;
            v42 = "-[WCFileStorage enumerateIncomingUserInfosWithBlock:]";
            __int16 v43 = 2114;
            v44 = v28;
            __int16 v45 = 2114;
            uint64_t v46 = v31;
            _os_log_error_impl(&dword_222A02000, v26, OS_LOG_TYPE_ERROR, "%{public}s could not load user info data at path %{public}@ due to %{public}@", buf, 0x20u);
          }
          goto LABEL_17;
        }

        __int16 v21 = (void *)MEMORY[0x263F08928];
        uint64_t v22 = objc_opt_class();
        id v35 = 0;
        uint64_t v23 = [v21 unarchivedObjectOfClass:v22 fromData:v19 error:&v35];
        id v20 = v35;
        if (!v23
          || ([v23 transferIdentifier],
              int v24 = objc_claimAutoreleasedReturnValue(),
              v24,
              !v24))
        {
          id v25 = wc_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            id v29 = v20;
            __int16 v30 = NSPrintF();
            *(_DWORD *)buf = 136446722;
            v42 = "-[WCFileStorage enumerateIncomingUserInfosWithBlock:]";
            __int16 v43 = 2114;
            v44 = v14;
            __int16 v45 = 2114;
            uint64_t v46 = v30;
            _os_log_error_impl(&dword_222A02000, v25, OS_LOG_TYPE_ERROR, "%{public}s user info malformed %{public}@ due to %{public}@", buf, 0x20u);
          }
          WCDeleteItemAtURL(v16);
LABEL_17:
          uint64_t v23 = 0;
        }
        buf[0] = 0;
        ((void (**)(id, void *, void *, uint8_t *))v4)[2](v4, v23, v14, buf);
        int v27 = buf[0];

        if (v27) {
          goto LABEL_21;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v12);
  }
LABEL_21:
}

- (void)deleteUserInfoTransferFromInbox:(id)a3
{
  id v4 = a3;
  int v5 = [(WCFileStorage *)self homeDirectoryURL];
  int v6 = [(WCFileStorage *)self pairingID];
  int v7 = WCTransferredUserInfoInboxURLInContainer((uint64_t)v5, v6);

  uint64_t v8 = [v4 transferIdentifier];

  int v9 = [v7 URLByAppendingPathComponent:v8 isDirectory:0];

  id v12 = 0;
  LOBYTE(v8) = [(WCFileStorage *)self removeItemAtURL:v9 numberOfRetries:5 error:&v12];
  id v10 = v12;
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = wc_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WCFileStorage deleteUserInfoTransferFromInbox:](v9);
    }
  }
}

- (void)enumerateUserInfoResultsWithBlock:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void, uint8_t *))a3;
  int v5 = [(WCFileStorage *)self homeDirectoryURL];
  int v6 = [(WCFileStorage *)self pairingID];
  int v7 = WCUserInfoTransfersInContainer((uint64_t)v5, v6);

  uint64_t v8 = [(WCFileStorage *)self userInfoResultsIndex];

  if (!v8)
  {
    int v9 = [[WCContentIndex alloc] initWithContainingFolder:v7];
    [(WCFileStorage *)self setUserInfoResultsIndex:v9];
  }
  id v10 = [(WCFileStorage *)self userInfoResultsIndex];
  uint64_t v11 = [v10 index];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v11;
  uint64_t v40 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v49;
    id v35 = v4;
    id v36 = v7;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v49 != v39) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v48 + 1) + 8 * v12);
      id v14 = objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v13, 1, v34);
      id v15 = [v14 URLByAppendingPathComponent:@"userinfo-transfer-result" isDirectory:0];

      id v47 = 0;
      id v16 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v15 options:2 error:&v47];
      id v17 = v47;
      if (v16)
      {
        uint64_t v41 = v13;
        id v18 = (void *)MEMORY[0x263EFFA08];
        v58[0] = objc_opt_class();
        v58[1] = objc_opt_class();
        v58[2] = objc_opt_class();
        __int16 v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:3];
        id v20 = [v18 setWithArray:v19];

        id v46 = 0;
        __int16 v21 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v20 fromData:v16 error:&v46];
        id v17 = v46;
        if (v21)
        {
          long long v38 = v21;
          uint64_t v22 = [v15 URLByDeletingLastPathComponent];
          uint64_t v23 = [v22 URLByAppendingPathComponent:@"userinfo-transfer-object-data" isDirectory:0];

          id v45 = 0;
          int v24 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v23 options:2 error:&v45];
          id v25 = v45;
          id v17 = v25;
          if (v24)
          {

            id v26 = (void *)MEMORY[0x263F08928];
            uint64_t v27 = objc_opt_class();
            id v44 = 0;
            v28 = [v26 unarchivedObjectOfClass:v27 fromData:v24 error:&v44];
            id v17 = v44;
            if (v28)
            {
              id v29 = [v38 objectForKeyedSubscript:@"WCUserInfoTransferResultError"];
              [v28 setTransferError:v29];
            }
            else
            {
              id v29 = wc_log();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                id v53 = "-[WCFileStorage enumerateUserInfoResultsWithBlock:]";
                __int16 v54 = 2114;
                uint64_t v55 = v41;
                _os_log_error_impl(&dword_222A02000, v29, OS_LOG_TYPE_ERROR, "%{public}s didn't unarchive transfer %{public}@", buf, 0x16u);
              }
              v28 = 0;
            }
          }
          else
          {
            uint64_t v31 = [v15 URLByDeletingLastPathComponent];

            WCDeleteItemAtURL(v31);
            id v29 = wc_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              [(WCFileStorage *)&v42 enumerateUserInfoResultsWithBlock:v29];
            }
            v28 = 0;
            id v15 = v31;
            id v4 = v35;
          }

          int v7 = v36;
          __int16 v21 = v38;
        }
        else
        {
          uint64_t v23 = wc_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            id v34 = v17;
            uint64_t v33 = NSPrintF();
            *(_DWORD *)buf = 136446722;
            id v53 = "-[WCFileStorage enumerateUserInfoResultsWithBlock:]";
            __int16 v54 = 2114;
            uint64_t v55 = v41;
            __int16 v56 = 2114;
            long long v57 = v33;
            _os_log_error_impl(&dword_222A02000, v23, OS_LOG_TYPE_ERROR, "%{public}s didn't unarchive results %{public}@ due to %{public}@", buf, 0x20u);

            __int16 v21 = 0;
          }
          v28 = 0;
        }

        uint64_t v13 = v41;
      }
      else
      {
        id v20 = wc_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = v17;
          __int16 v30 = NSPrintF();
          *(_DWORD *)buf = 136446722;
          id v53 = "-[WCFileStorage enumerateUserInfoResultsWithBlock:]";
          __int16 v54 = 2114;
          uint64_t v55 = v13;
          __int16 v56 = 2114;
          long long v57 = v30;
          _os_log_impl(&dword_222A02000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s result does not exist, removing from index %{public}@ due to %{public}@", buf, 0x20u);
        }
        v28 = 0;
      }

      buf[0] = 0;
      v4[2](v4, v28, v13, buf);
      int v32 = buf[0];

      if (v32) {
        break;
      }
      if (v40 == ++v12)
      {
        uint64_t v40 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
        if (v40) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

- (void)cleanUpWatchContentDirectoryWithCurrentAppInstallationID:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(WCFileStorage *)self pairingID];

  if (v5)
  {
    int v6 = [(WCFileStorage *)self homeDirectoryURL];
    int v7 = [(WCFileStorage *)self pairingID];
    uint64_t v8 = WCWatchDirectoryLocationInContainer((uint64_t)v6, v7);

    int v9 = [MEMORY[0x263F08850] defaultManager];
    id v25 = 0;
    id v10 = [v9 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:0 options:4 error:&v25];
    id v11 = v25;

    if (v11)
    {
      if ([v11 code] == -1100 || objc_msgSend(v11, "code") == 260) {
        goto LABEL_18;
      }
      uint64_t v12 = wc_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[WCFileStorage cleanUpWatchContentDirectoryWithCurrentAppInstallationID:]();
      }
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        id v20 = v10;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v18 = [v17 lastPathComponent];
            char v19 = [v4 isEqual:v18];

            if ((v19 & 1) == 0) {
              WCDeleteItemAtURL(v17);
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v14);
        id v10 = v20;
      }
    }

LABEL_18:
  }
}

- (void)cleanUpOldPairingIDFoldersWithPairedDevicesPairingIDs:(id)a3
{
  id v4 = a3;
  int v5 = [(WCFileStorage *)self pairingID];
  int v6 = v5;
  if (v4 && v5)
  {
    int v7 = [(WCFileStorage *)self pairingID];
    int v8 = [v4 containsObject:v7];

    if (v8)
    {
      int v9 = [(WCFileStorage *)self homeDirectoryURL];
      id v10 = [(WCFileStorage *)self pairingID];
      id v11 = WCInboxURLInContainer((uint64_t)v9, v10);

      uint64_t v12 = [v11 URLByDeletingLastPathComponent];

      uint64_t v13 = [(WCFileStorage *)self homeDirectoryURL];
      uint64_t v14 = [(WCFileStorage *)self pairingID];
      uint64_t v15 = WCApplicationSupportURLInContainer((uint64_t)v13, v14);

      id v16 = [v15 URLByDeletingLastPathComponent];

      [(WCFileStorage *)self cleanUpOldPairingIDFolderInFolder:v12 pairedDevicesPairingIDs:v4];
      [(WCFileStorage *)self cleanUpOldPairingIDFolderInFolder:v16 pairedDevicesPairingIDs:v4];

      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v12 = wc_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[WCFileStorage cleanUpOldPairingIDFoldersWithPairedDevicesPairingIDs:]();
  }
LABEL_8:
}

- (void)cleanUpOldPairingIDFolderInFolder:(id)a3 pairedDevicesPairingIDs:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = [MEMORY[0x263F08850] defaultManager];
  id v25 = 0;
  int v8 = [v7 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:4 error:&v25];
  id v9 = v25;

  if (!v9)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      char v19 = v8;
      id v20 = v5;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v16 = [v15 lastPathComponent];
          if (([v6 containsObject:v16] & 1) == 0)
          {
            id v17 = wc_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              id v18 = [v15 path];
              *(_DWORD *)buf = 136446722;
              uint64_t v27 = "-[WCFileStorage cleanUpOldPairingIDFolderInFolder:pairedDevicesPairingIDs:]";
              __int16 v28 = 2114;
              id v29 = v6;
              __int16 v30 = 2114;
              uint64_t v31 = v18;
              _os_log_impl(&dword_222A02000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@, deleting %{public}@", buf, 0x20u);
            }
            WCDeleteItemAtURL(v15);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v32 count:16];
      }
      while (v12);
      int v8 = v19;
      id v5 = v20;
    }
    goto LABEL_18;
  }
  if ([v9 code] != -1100 && objc_msgSend(v9, "code") != 260)
  {
    id v10 = wc_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WCFileStorage cleanUpOldPairingIDFolderInFolder:pairedDevicesPairingIDs:]();
    }
LABEL_18:
  }
}

- (BOOL)removeItemAtURL:(id)a3 numberOfRetries:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4)
  {
    id v9 = [MEMORY[0x263F08850] defaultManager];
    char v10 = [v9 removeItemAtURL:v8 error:a5];

    BOOL v11 = (v10 & 1) != 0
       || [(WCFileStorage *)self removeItemAtURL:v8 numberOfRetries:a4 - 1 error:a5];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)appendPathForFileTransfer:(id)a3 toPath:(id)a4
{
  id v5 = a4;
  id v6 = [a3 transferIdentifier];
  int v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

- (id)outgoingFileTransferPath
{
  BOOL v3 = [(WCFileStorage *)self homeDirectoryURL];
  id v4 = [(WCFileStorage *)self pairingID];
  id v5 = WCFileTransfersURLInContainer((uint64_t)v3, v4);
  id v6 = [v5 path];

  return v6;
}

- (id)homeDirectoryURL
{
  v2 = NSURL;
  BOOL v3 = NSHomeDirectory();
  id v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  return v4;
}

- (id)appContextFolderURL:(BOOL)a3
{
  if (a3) {
    [(WCFileStorage *)self receivedAppContextFolderURL];
  }
  else {
  BOOL v3 = [(WCFileStorage *)self localAppContextFolderURL];
  }

  return v3;
}

- (id)localAppContextFolderURL
{
  BOOL v3 = [(WCFileStorage *)self homeDirectoryURL];
  id v4 = [(WCFileStorage *)self pairingID];
  id v5 = WCApplicationSupportURLInContainer((uint64_t)v3, v4);

  id v6 = [v5 URLByAppendingPathComponent:@"ApplicationContext" isDirectory:1];

  return v6;
}

- (id)receivedAppContextFolderURL
{
  BOOL v3 = [(WCFileStorage *)self homeDirectoryURL];
  id v4 = [(WCFileStorage *)self pairingID];
  id v5 = WCApplicationSupportURLInContainer((uint64_t)v3, v4);

  id v6 = [v5 URLByAppendingPathComponent:@"ReceivedApplicationContext" isDirectory:1];

  return v6;
}

- (NSString)pairingID
{
  return self->_pairingID;
}

- (OS_dispatch_queue)fileQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileQueue:(id)a3
{
}

- (NSArray)outstandingFileTransfers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutstandingFileTransfers:(id)a3
{
}

- (WCContentIndex)fileIndex
{
  return (WCContentIndex *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileIndex:(id)a3
{
}

- (WCContentIndex)fileResultsIndex
{
  return (WCContentIndex *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFileResultsIndex:(id)a3
{
}

- (WCContentIndex)userInfoIndex
{
  return (WCContentIndex *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserInfoIndex:(id)a3
{
}

- (WCContentIndex)userInfoResultsIndex
{
  return (WCContentIndex *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUserInfoResultsIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoResultsIndex, 0);
  objc_storeStrong((id *)&self->_userInfoIndex, 0);
  objc_storeStrong((id *)&self->_fileResultsIndex, 0);
  objc_storeStrong((id *)&self->_fileIndex, 0);
  objc_storeStrong((id *)&self->_outstandingFileTransfers, 0);
  objc_storeStrong((id *)&self->_fileQueue, 0);

  objc_storeStrong((id *)&self->_pairingID, 0);
}

void __45__WCFileStorage_loadOutstandingFileTransfers__block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = NSPrintF();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_222A02000, v1, v2, "%{public}s error enumerating files %{public}@", (uint8_t *)v3);
}

- (void)persistOutgoingFileTransfer:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136446722;
  OUTLINED_FUNCTION_12();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_222A02000, v2, OS_LOG_TYPE_ERROR, "%{public}s error serializing file transfer %{public}@ due to %{public}@", (uint8_t *)v3, 0x20u);
}

- (void)persistOutgoingFileTransfer:.cold.2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  __int16 v0 = NSPrintF();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s error writing archived data to disk %{public}@, %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

- (void)persistOutgoingFileTransfer:.cold.3()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  __int16 v0 = NSPrintF();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s error creating outgoing file transfer path %{public}@, %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

- (void)deleteOutstandingFileTransfer:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  __int16 v0 = NSPrintF();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s failed to remove file transfer %{public}@ error %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

- (void)persistOutgoingUserInfoTransfer:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  __int16 v0 = NSPrintF();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s error serializing user info transfer %{public}@ due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

- (void)persistOutgoingUserInfoTransfer:.cold.2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  __int16 v0 = NSPrintF();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s error writing user info wire data to disk %{public}@, %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

- (void)persistOutgoingUserInfoTransfer:.cold.3()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  __int16 v0 = NSPrintF();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s error writing archived data to disk %{public}@, %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

- (void)persistOutgoingUserInfoTransfer:.cold.4()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0(*MEMORY[0x263EF8340]);
  __int16 v0 = NSPrintF();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s error creating outgoing user info transfer path %{public}@, %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void __73__WCFileStorage_loadOutstandingUserInfoTransfersAndComplicationUserInfo___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  __int16 v0 = NSPrintF();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_222A02000, v1, v2, "%{public}s error enumerating files %{public}@", (uint8_t *)v3);
}

- (void)deleteOutstandingUserInfoTransfer:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_12();
  _os_log_error_impl(&dword_222A02000, v0, OS_LOG_TYPE_ERROR, "%{public}s failed to remove user info transfer %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)enumerateFileTransferResultsWithBlock:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_222A02000, log, OS_LOG_TYPE_ERROR, "result exists without file transfer", buf, 2u);
}

- (void)persistAppContextData:received:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  os_log_t v0 = NSPrintF();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s error writing application context data to file (received: %s due to: %{public}@)", v3, v4, v5, v6, v7, v8, 2u);
}

- (void)persistAppContextData:received:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  os_log_t v0 = NSPrintF();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s error creating application context folder (received: %s due to %{public}@)", v3, v4, v5, v6, v7, v8, 2u);
}

- (void)loadAppContextReceived:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  os_log_t v0 = NSPrintF();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s error loading in%s application context data %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

- (void)loadAppContextReceived:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  os_log_t v0 = NSPrintF();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s error deserializing%s application context %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

- (void)deleteAppContextReceived:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  os_log_t v0 = NSPrintF();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v1, v2, "%{public}s failed to remove%s app context folder %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

- (void)loadAppContextDataFromInbox
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  os_log_t v0 = NSPrintF();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_222A02000, v1, v2, "%{public}s error loading in application context from inbox %{public}@", (uint8_t *)v3);
}

- (void)deleteUserInfoTransferFromInbox:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 path];
  v4[0] = 136446466;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_222A02000, v2, v3, "%{public}s couldn't remove user info at URL %{public}@", (uint8_t *)v4);
}

- (void)enumerateUserInfoResultsWithBlock:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_222A02000, log, OS_LOG_TYPE_ERROR, "results exist without file transfer", buf, 2u);
}

- (void)createWatchDirectoryIfNeeded:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 path];
  v4[0] = 136446466;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_222A02000, v2, v3, "%{public}s error creating watch directory at %{public}@", (uint8_t *)v4);
}

- (void)createWatchDirectoryIfNeeded:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_222A02000, log, OS_LOG_TYPE_ERROR, "watch directory exists as file, deleting file", v1, 2u);
}

- (void)cleanUpWatchContentDirectoryWithCurrentAppInstallationID:.cold.1()
{
  OUTLINED_FUNCTION_16();
  uint64_t v2 = [v1 path];
  uint64_t v10 = v0;
  uint64_t v3 = NSPrintF();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v4, v5, "%{public}s error getting contents of %{public}@ due to %{public}@", v6, v7, v8, v9, v10, v11, 2u);
}

- (void)cleanUpOldPairingIDFoldersWithPairedDevicesPairingIDs:.cold.1()
{
  OUTLINED_FUNCTION_16();
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [v2 pairingID];
  int v4 = WCCompactStringFromCollection(v1);
  int v5 = 136446722;
  int v6 = "-[WCFileStorage cleanUpOldPairingIDFoldersWithPairedDevicesPairingIDs:]";
  __int16 v7 = 2114;
  int v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_222A02000, v0, OS_LOG_TYPE_ERROR, "%{public}s missing pairingID: %{public}@, or pairingIDs: %{public}@", (uint8_t *)&v5, 0x20u);
}

- (void)cleanUpOldPairingIDFolderInFolder:pairedDevicesPairingIDs:.cold.1()
{
  OUTLINED_FUNCTION_16();
  id v2 = [v1 path];
  uint64_t v10 = v0;
  uint64_t v3 = NSPrintF();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_222A02000, v4, v5, "%{public}s error getting contents of %{public}@ due to %{public}@", v6, v7, v8, v9, v10, v11, 2u);
}

@end