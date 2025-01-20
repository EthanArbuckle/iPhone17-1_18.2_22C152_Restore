@interface OSLogEventStore
+ (id)localStore;
+ (id)localStoreWithRelativePaths:(id)a3;
+ (id)storeWithArchiveURL:(id)a3;
+ (id)storeWithArchiveURL:(id)a3 relativePaths:(id)a4;
+ (id)storeWithFileURL:(id)a3;
- (NSArray)_relativeFilePaths;
- (NSURL)_archiveURL;
- (OSLogEventStore)initWithArchiveURL:(id)a3;
- (OSLogEventStore)initWithArchiveURL:(id)a3 relativePaths:(id)a4;
- (id)_progressHandler;
- (id)_upgradeHandler;
- (void)addFilesToSource:(id)a3 forCollection:(id)a4 withProgress:(id)a5;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)set_archiveURL:(id)a3;
- (void)set_progressHandler:(id)a3;
- (void)set_relativeFilePaths:(id)a3;
- (void)set_upgradeHandler:(id)a3;
@end

@implementation OSLogEventStore

- (NSArray)_relativeFilePaths
{
  return self->_relativeFilePaths;
}

- (id)_progressHandler
{
  return self->_progressHandler;
}

- (void)set_upgradeHandler:(id)a3
{
}

+ (id)localStore
{
  v2 = objc_alloc_init(OSLogEventLocalStore);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_upgradeHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_relativeFilePaths, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

- (id)_upgradeHandler
{
  return self->_upgradeHandler;
}

- (void)set_progressHandler:(id)a3
{
}

- (void)set_relativeFilePaths:(id)a3
{
}

- (void)set_archiveURL:(id)a3
{
}

- (NSURL)_archiveURL
{
  return self->_archiveURL;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, uint64_t))a3;
  v5 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:6];
  archiveURL = self->_archiveURL;
  if (!archiveURL)
  {
    uint64_t v16 = _OSLogError(1);
LABEL_10:
    v18 = (void *)v16;
    v4[2](v4, 0, v16);

    goto LABEL_61;
  }
  uint64_t v7 = open([(NSURL *)archiveURL fileSystemRepresentation], 0);
  if (v7 == -1)
  {
    v17 = __error();
    uint64_t v16 = _OSLogPOSIXError(3, *v17);
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  v9 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v7];
  v10 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v8];
  if (close(v8) == -1)
  {
    int v65 = *__error();
    uint64_t v15 = *__error();
    if (v65 == 9)
    {
      qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1E953C318 = v15;
      __break(1u);
      goto LABEL_64;
    }
    _os_assumes_log();
  }
  id v82 = [(NSURL *)self->_archiveURL URLByAppendingPathComponent:@"timesync"];
  uint64_t v11 = open((const char *)[v82 fileSystemRepresentation], 0);
  if (v11 == -1)
  {
    v13 = 0;
    goto LABEL_12;
  }
  int v12 = v11;
  v13 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v11];
  if (close(v12) == -1)
  {
    int v14 = *__error();
    uint64_t v15 = *__error();
    if (v14 != 9)
    {
      _os_assumes_log();
      goto LABEL_12;
    }
LABEL_64:
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1E953C318 = v15;
    __break(1u);
    return;
  }
LABEL_12:
  id v19 = v5;
  v20 = self;
  objc_msgSend(v19, "setCompletedUnitCount:", objc_msgSend(v19, "completedUnitCount") + 1);
  progressHandler = (void (**)(id, void))v20->_progressHandler;

  if (progressHandler)
  {
    [v19 fractionCompleted];
    progressHandler[2](progressHandler, 0);
  }

  v22 = [[_OSLogCollectionReference alloc] initWithDiagnosticsDirectory:v9 timesyncDirectory:v13 UUIDTextDirectory:v10];
  id v86 = 0;
  v23 = [[_OSLogVersioning alloc] initWithCollection:v22 error:&v86];
  id v24 = v86;
  v25 = v9;
  v26 = v24;
  if (!v23)
  {
    v60 = v25;
    v38 = _OSLogPOSIXError(4, [v24 code]);
    v4[2](v4, 0, (uint64_t)v38);

    [(_OSLogCollectionReference *)v22 close];
    goto LABEL_60;
  }
  v79 = v13;
  v80 = v24;
  v77 = v5;
  v78 = v10;
  v27 = v22;
  v28 = v25;
  id v29 = v19;
  v30 = v20;
  objc_msgSend(v29, "setCompletedUnitCount:", objc_msgSend(v29, "completedUnitCount") + 1);
  v31 = (void (**)(id, void))v20->_progressHandler;

  if (v31)
  {
    [v29 fractionCompleted];
    v31[2](v31, 0);
  }

  while (2)
  {
    v32 = v28;
    v22 = v27;
    while (1)
    {
      if ([(_OSLogVersioning *)v23 state] == 1)
      {
        id v39 = v29;
        v40 = v30;
        objc_msgSend(v39, "setCompletedUnitCount:", objc_msgSend(v39, "completedUnitCount") + 1);
        v41 = (void (**)(id, void))v20->_progressHandler;

        if (v41)
        {
          [v39 fractionCompleted];
          v41[2](v41, 0);
        }

        v5 = v77;
        v10 = v78;
        if (!v79)
        {
          uint64_t v42 = open((const char *)[v82 fileSystemRepresentation], 0);
          if (v42 == -1)
          {
            v67 = __error();
            v68 = _OSLogPOSIXError(3, *v67);
            v4[2](v4, 0, (uint64_t)v68);

            v60 = v32;
            [(_OSLogDirectoryReference *)v32 close];
            [(_OSLogDirectoryReference *)v78 close];
            goto LABEL_47;
          }
          v79 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v42];
          v43 = [[_OSLogCollectionReference alloc] initWithDiagnosticsDirectory:v32 timesyncDirectory:v79 UUIDTextDirectory:v78];

          v22 = v43;
        }
        uint64_t v84 = 0;
        [(_OSLogDirectoryReference *)v32 fileDescriptor];
        uint64_t v44 = _os_trace_mmap_at();
        if (!v44)
        {
          v60 = v32;
          v63 = __error();
          v64 = _OSLogPOSIXError(5, *v63);
          v4[2](v4, 0, (uint64_t)v64);

          [(_OSLogCollectionReference *)v22 close];
          v26 = v80;
LABEL_59:

          goto LABEL_60;
        }
        v74 = v40;
        v75 = v32;
        v45 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v44 length:v84 deallocator:&__block_literal_global_3320];
        id v83 = 0;
        uint64_t v46 = [MEMORY[0x1E4F28F98] propertyListWithData:v45 options:0 format:0 error:&v83];
        id v47 = v83;

        v76 = (void *)v46;
        if (!v46)
        {
          v60 = v75;
          v66 = _OSLogInternalError(5, v47);
          v4[2](v4, 0, (uint64_t)v66);

          [(_OSLogCollectionReference *)v22 close];
          id v58 = v47;
LABEL_58:

          v26 = v58;
          goto LABEL_59;
        }
        id v72 = v47;
        v73 = v45;
        v81 = v22;
        v48 = [[_OSLogEventStoreMetadata alloc] initWithDictionary:v46];
        if (!v48)
        {
          v49 = (void (**)(id, void *, double))v20->_progressHandler;
          if (v49)
          {
            [v39 fractionCompleted];
            double v51 = v50;
            v52 = _OSLogError(16);
            v49[2](v49, v52, v51);
          }
        }
        id v53 = v39;
        v54 = v74;
        objc_msgSend(v53, "setCompletedUnitCount:", objc_msgSend(v53, "completedUnitCount") + 1);
        v55 = (void (**)(id, void))v20->_progressHandler;

        if (v55)
        {
          [v53 fractionCompleted];
          v55[2](v55, 0);
        }

        uint64_t v56 = _timesync_db_openat([(_OSLogDirectoryReference *)v79 fileDescriptor], ".");
        if (!v56)
        {
          v69 = __error();
          v70 = _OSLogPOSIXError(12, *v69);
          v4[2](v4, 0, (uint64_t)v70);

          v22 = v81;
          [(_OSLogCollectionReference *)v81 close];
          id v58 = v72;
LABEL_57:
          v60 = v75;

          v45 = v73;
          goto LABEL_58;
        }
        v57 = [[OSLogEventSource alloc] initWithCollection:v81 metadata:v48 timesync:v56];
        _progress(v54, v53, 1);
        [v53 becomeCurrentWithPendingUnitCount:1];
        if (v54->_relativeFilePaths)
        {
          [(OSLogEventStore *)v54 addFilesToSource:v57 forCollection:v81 withProgress:v53];
          id v58 = v72;
        }
        else
        {
          int v71 = _enumerateArchiveIntoSource(v57, v81, v20->_progressHandler, v4);
          id v58 = v72;
          if (!v71)
          {
LABEL_56:

            v22 = v81;
            goto LABEL_57;
          }
        }
        objc_msgSend(v53, "resignCurrent", v72);
        _progress(v54, v53, 0);
        ((void (**)(id, OSLogEventSource *, uint64_t))v4)[2](v4, v57, 0);
        goto LABEL_56;
      }
      uint64_t v33 = [(_OSLogVersioning *)v23 state];
      if (v33 == 3) {
        break;
      }
      if (v33 == 2)
      {
        v60 = v28;
        uint64_t v59 = 11;
LABEL_45:
        uint64_t v61 = _OSLogError(v59);
LABEL_46:
        v62 = (void *)v61;
        v4[2](v4, 0, v61);

        [(_OSLogCollectionReference *)v27 close];
        v5 = v77;
        v10 = v78;
LABEL_47:
        v26 = v80;
        goto LABEL_60;
      }
      if (!v33)
      {
        v60 = v28;
        uint64_t v61 = _OSLogPOSIXError(10, [(_OSLogVersioning *)v23 version]);
        goto LABEL_46;
      }
    }
    upgradeHandler = (uint64_t (**)(void))v30->_upgradeHandler;
    if (!upgradeHandler || (upgradeHandler[2]() & 1) == 0)
    {
      v60 = v28;
      uint64_t v59 = 8;
      goto LABEL_45;
    }
    id v85 = v80;
    BOOL v35 = [(_OSLogVersioning *)v23 performDestructiveUpdates:&v85];
    id v36 = v85;

    v80 = v36;
    if (v35) {
      continue;
    }
    break;
  }
  v37 = _OSLogPOSIXError(9, [v36 code]);
  v4[2](v4, 0, (uint64_t)v37);

  [(_OSLogCollectionReference *)v27 close];
  v26 = v36;
  v22 = v27;
  v60 = v28;
  v5 = v77;
  v10 = v78;
LABEL_60:

LABEL_61:
}

uint64_t __48__OSLogEventStore_prepareWithCompletionHandler___block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

- (void)addFilesToSource:(id)a3 forCollection:(id)a4 withProgress:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v8;
  id v28 = v10;
  id v29 = self;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  int v12 = self->_relativeFilePaths;
  uint64_t v30 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v30)
  {
    uint64_t v13 = *(void *)v33;
    p_vtable = OSLogPersistence.vtable;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = objc_msgSend(objc_alloc((Class)(p_vtable + 387)), "initWithCollection:subpath:", v9, objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v15), "fileSystemRepresentation"));
        v17 = [_OSLogIndexFile alloc];
        id v31 = 0;
        v18 = [(_OSLogIndexFile *)v17 initWithTraceFile:v16 error:&v31];
        id v19 = v31;
        if (v18)
        {
          [v11 _insertIndexFile:v18];
        }
        else
        {
          progressHandler = (void (**)(id, void *, double))v29->_progressHandler;
          if (progressHandler)
          {
            [v28 fractionCompleted];
            double v22 = v21;
            _OSLogInternalError(17, v19);
            uint64_t v23 = v13;
            id v24 = v9;
            v25 = v12;
            v27 = v26 = v11;
            progressHandler[2](progressHandler, v27, v22);

            uint64_t v11 = v26;
            int v12 = v25;
            id v9 = v24;
            uint64_t v13 = v23;
            p_vtable = (void **)(OSLogPersistence + 24);
          }
        }

        ++v15;
      }
      while (v30 != v15);
      uint64_t v30 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v30);
  }
}

- (OSLogEventStore)initWithArchiveURL:(id)a3 relativePaths:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(OSLogEventStore *)self init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_archiveURL, a3);
    objc_storeStrong((id *)&v10->_relativeFilePaths, a4);
  }

  return v10;
}

- (OSLogEventStore)initWithArchiveURL:(id)a3
{
  id v5 = a3;
  v6 = [(OSLogEventStore *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_archiveURL, a3);
  }

  return v7;
}

+ (id)storeWithArchiveURL:(id)a3 relativePaths:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithArchiveURL:v7 relativePaths:v6];

  return v8;
}

+ (id)storeWithFileURL:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v4 = [a3 pathComponents];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [MEMORY[0x1E4F1CA48] array];
  while ([v5 count])
  {
    id v7 = [v5 lastObject];
    char v8 = [v7 hasSuffix:@".logarchive"];

    if (v8) {
      break;
    }
    id v9 = [v5 lastObject];
    [v6 insertObject:v9 atIndex:0];

    [v5 removeLastObject];
  }
  if ([v5 count])
  {
    id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v5];
  }
  else
  {
    id v10 = 0;
  }
  if ([v6 count])
  {
    uint64_t v11 = [v6 componentsJoinedByString:@"/"];
    v15[0] = v11;
    int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    int v12 = 0;
  }
  uint64_t v13 = (void *)[objc_alloc((Class)a1) initWithArchiveURL:v10 relativePaths:v12];

  return v13;
}

+ (id)storeWithArchiveURL:(id)a3
{
  id v3 = a3;
  v4 = [[OSLogEventStore alloc] initWithArchiveURL:v3];

  return v4;
}

+ (id)localStoreWithRelativePaths:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(OSLogEventLocalStore);
  [(OSLogEventStore *)v4 set_relativeFilePaths:v3];

  return v4;
}

@end