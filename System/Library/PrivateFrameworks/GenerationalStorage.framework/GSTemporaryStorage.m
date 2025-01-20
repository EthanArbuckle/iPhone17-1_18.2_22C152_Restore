@interface GSTemporaryStorage
- (BOOL)__lockWithFlags:(int)a3 error:(id *)a4;
- (BOOL)_readLock:(id *)a3;
- (BOOL)_writeLock:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeAdditionUserInfo:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)replaceDocumentWithContentsOfAddition:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6;
- (BOOL)replaceDocumentWithContentsOfItemAtURL:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6;
- (BOOL)setAdditionConflictResolved:(id)a3 value:(BOOL)a4 error:(id *)a5;
- (BOOL)setAdditionDisplayName:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)setAdditionOptions:(id)a3 value:(unint64_t)a4 error:(id *)a5;
- (GSTemporaryStorage)init;
- (GSTemporaryStorage)initWithLibraryURL:(id)a3 forItemAtURL:(id)a4 error:(id *)a5;
- (NSURL)documentURL;
- (NSURL)libraryURL;
- (id)URLforReplacingItemWithError:(id *)a3;
- (id)_URLForNameSpace:(id)a3 createIfNeeded:(BOOL)a4 allowMissing:(BOOL)a5 error:(id *)a6;
- (id)_enumerateItemsAtURL:(id)a3;
- (id)additionWithName:(id)a3 inNameSpace:(id)a4 error:(id *)a5;
- (id)additionsWithNames:(id)a3 inNameSpace:(id)a4 error:(id *)a5;
- (id)description;
- (id)enumeratorForAdditionsInNameSpace:(id)a3 withOptions:(unint64_t)a4 withoutOptions:(unint64_t)a5 ordering:(int)a6;
- (id)getAdditionDictionary:(id)a3 error:(id *)a4;
- (id)prepareAdditionCreationWithItemAtURL:(id)a3 byMoving:(BOOL)a4 creationInfo:(id)a5 error:(id *)a6;
- (id)setAdditionNameSpace:(id)a3 value:(id)a4 error:(id *)a5;
- (id)stagingURLforCreatingAdditionWithError:(id *)a3;
- (unint64_t)hash;
- (void)_protectPath:(id)a3;
- (void)_unlock;
- (void)_unprotectPath:(id)a3;
- (void)cleanupStagingURL:(id)a3;
- (void)createAdditionStagedAtURL:(id)a3 creationInfo:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)finalize;
- (void)removeAdditions:(id)a3 completionHandler:(id)a4;
- (void)removeAllAdditionsForNamespaces:(id)a3 completionHandler:(id)a4;
- (void)setDocumentURL:(id)a3;
@end

@implementation GSTemporaryStorage

- (GSTemporaryStorage)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = _NSMethodExceptionProem();
  [v3 raise:v4, @"%@: cannot use -init for initialization", v5 format];

  return 0;
}

- (GSTemporaryStorage)initWithLibraryURL:(id)a3 forItemAtURL:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (([v11 isFileURL] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"GSTemporaryStorage.m", 143, @"Invalid parameter not satisfying: %@", @"[url isFileURL]" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)GSTemporaryStorage;
  v12 = [(GSTemporaryStorage *)&v24 init];
  if (v12)
  {
    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_storeStrong((id *)&v12->_libraryURL, a3);
    objc_storeStrong((id *)&v12->_documentURL, a4);
    uint64_t v14 = [v10 URLByAppendingPathComponent:@".genstore_staging"];
    stagingURL = v12->_stagingURL;
    v12->_stagingURL = (NSURL *)v14;

    v12->_lockFd = -1;
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.genstore.temp-storage-background-queue", v16);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v17;

    [(NSURL *)v12->_libraryURL gs_chmod:448];
    v19 = v12->_stagingURL;
    uint64_t v25 = *MEMORY[0x1E4F28330];
    v26[0] = &unk_1F37C2CB0;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    int v21 = [v13 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:v20 error:a5];

    if (v21)
    {
      [(NSURL *)v12->_libraryURL gs_chmod:320];
    }
    else
    {

      v12 = 0;
    }
  }
  return v12;
}

- (void)finalize
{
  [(GSTemporaryStorage *)self _unlock];
  v3.receiver = self;
  v3.super_class = (Class)GSTemporaryStorage;
  [(GSTemporaryStorage *)&v3 finalize];
}

- (void)dealloc
{
  [(GSTemporaryStorage *)self _unlock];
  v3.receiver = self;
  v3.super_class = (Class)GSTemporaryStorage;
  [(GSTemporaryStorage *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (GSTemporaryStorage *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSURL *)self->_libraryURL isEqual:v4->_libraryURL];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_libraryURL hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<GSTemporaryURL %p { library:%@ url:%@ }>", self, self->_libraryURL, self->_documentURL];
}

- (BOOL)__lockWithFlags:(int)a3 error:(id *)a4
{
  if ((self->_lockFd & 0x80000000) == 0)
  {
    *__error() = 22;
    char v5 = [NSString stringWithFormat:@"_lockFd isn't -1"];
    int v6 = *__error();
    v7 = gs_default_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
LABEL_4:

      if (a4)
      {
        _GSErrorForErrno(v6, v5);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0;
    }
LABEL_3:
    -[GSTemporaryStorage __lockWithFlags:error:]();
    goto LABEL_4;
  }
  int v11 = open([(NSURL *)self->_libraryURL fileSystemRepresentation], 256);
  self->_lockFd = v11;
  if (v11 < 0)
  {
    char v5 = [NSString stringWithFormat:@"Failed to open \"%@\" for locking", self->_libraryURL];
    int v6 = *__error();
    v7 = gs_default_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (flock(v11, a3))
  {
    v12 = [NSString stringWithFormat:@"Failed to lock %@", self->_libraryURL];
    int v13 = *__error();
    uint64_t v14 = gs_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[GSTemporaryStorage __lockWithFlags:error:]();
    }

    if (a4)
    {
      _GSErrorForErrno(v13, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    [(GSTemporaryStorage *)self _unlock];
    return 0;
  }
  return 1;
}

- (BOOL)_writeLock:(id *)a3
{
  return [(GSTemporaryStorage *)self __lockWithFlags:2 error:a3];
}

- (BOOL)_readLock:(id *)a3
{
  return [(GSTemporaryStorage *)self __lockWithFlags:1 error:a3];
}

- (void)_unlock
{
  int lockFd = self->_lockFd;
  if ((lockFd & 0x80000000) == 0)
  {
    flock(lockFd, 8);
    close(self->_lockFd);
    self->_int lockFd = -1;
  }
}

- (void)_protectPath:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  char v5 = [v3 defaultManager];
  uint64_t v7 = *MEMORY[0x1E4F28330];
  v8[0] = &unk_1F37C2CC8;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v5 setAttributes:v6 ofItemAtPath:v4 error:0];
}

- (void)_unprotectPath:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  char v5 = [v3 defaultManager];
  uint64_t v7 = *MEMORY[0x1E4F28330];
  v8[0] = &unk_1F37C2CB0;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v5 setAttributes:v6 ofItemAtPath:v4 error:0];
}

- (id)_URLForNameSpace:(id)a3 createIfNeeded:(BOOL)a4 allowMissing:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  int v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (![v10 validateGSName:a6])
  {
    uint64_t v14 = 0;
    goto LABEL_20;
  }
  int v12 = [v10 isEqualToString:@"com.apple.documentVersions"];
  libraryURL = self->_libraryURL;
  if (v12)
  {
    uint64_t v14 = libraryURL;
    goto LABEL_20;
  }
  v15 = [(NSURL *)libraryURL URLByAppendingPathComponent:@".ns"];
  v16 = [v15 URLByAppendingPathComponent:v10];
  if (access([(NSURL *)v16 fileSystemRepresentation], 0))
  {
    if (!v8)
    {
      if (!v7 || *__error() != 2)
      {
        dispatch_queue_t v17 = [NSString stringWithFormat:@"The supplied addition doesn't exist"];
        v18 = gs_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          GSAdditionCreationInfoValidate_cold_2();
        }

        if (a6)
        {
          _GSErrorForStatus(105, v17, 0);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      uint64_t v14 = 0;
      goto LABEL_19;
    }
    [(NSURL *)self->_libraryURL gs_chmod:448];
    objc_msgSend(v15, "gs_chmod:", 448);
    if (([v11 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:a6] & 1) == 0)
    {

      v16 = 0;
    }
    objc_msgSend(v15, "gs_chmod:", 320);
    [(NSURL *)self->_libraryURL gs_chmod:320];
  }
  v16 = v16;
  uint64_t v14 = v16;
LABEL_19:

LABEL_20:
  return v14;
}

- (id)getAdditionDictionary:(id)a3 error:(id *)a4
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 url];
  BOOL v8 = (const char *)[v7 fileSystemRepresentation];

  if (![(GSTemporaryStorage *)self _readLock:a4])
  {
LABEL_8:
    int v13 = 0;
    goto LABEL_9;
  }
  BOOL v9 = GSGetGenerationOptions(v8);
  BOOL v10 = GSGetConflictResolved(v8);
  if (access(v8, 0))
  {
    int v11 = [NSString stringWithFormat:@"The supplied addition doesn't exist"];
    int v12 = gs_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      GSAdditionCreationInfoValidate_cold_2();
    }

    if (a4)
    {
      _GSErrorForStatus(105, v11, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    [(GSTemporaryStorage *)self _unlock];
    goto LABEL_8;
  }
  [(GSTemporaryStorage *)self _unlock];
  v19[0] = @"o";
  v15 = [NSNumber numberWithUnsignedLongLong:v9];
  v20[0] = v15;
  v19[1] = @"ns";
  v16 = [v6 nameSpace];
  v20[1] = v16;
  v19[2] = @"u";
  dispatch_queue_t v17 = [v6 url];
  v20[2] = v17;
  v19[3] = @"cr";
  v18 = [NSNumber numberWithBool:v10];
  v20[3] = v18;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

LABEL_9:
  return v13;
}

- (BOOL)setAdditionOptions:(id)a3 value:(unint64_t)a4 error:(id *)a5
{
  char v6 = a4;
  id v8 = [a3 url];
  BOOL v9 = (char *)[v8 fileSystemRepresentation];

  if (![(GSTemporaryStorage *)self _writeLock:a5]) {
    return 0;
  }
  if (access(v9, 0))
  {
    BOOL v10 = [NSString stringWithFormat:@"The supplied addition doesn't exist"];
    int v11 = gs_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      GSAdditionCreationInfoValidate_cold_2();
    }

    if (a5)
    {
      _GSErrorForStatus(105, v10, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    char v12 = 0;
  }
  else
  {
    char v12 = GSSetGenerationOptions(v9, v6, a5);
  }
  [(GSTemporaryStorage *)self _unlock];
  return v12;
}

- (BOOL)setAdditionConflictResolved:(id)a3 value:(BOOL)a4 error:(id *)a5
{
  id v8 = [a3 url];
  BOOL v9 = (char *)[v8 fileSystemRepresentation];

  if (![(GSTemporaryStorage *)self _writeLock:a5]) {
    return 0;
  }
  if (access(v9, 0))
  {
    BOOL v10 = [NSString stringWithFormat:@"The supplied addition doesn't exist"];
    int v11 = gs_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      GSAdditionCreationInfoValidate_cold_2();
    }

    if (a5)
    {
      _GSErrorForStatus(105, v10, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    char v12 = 0;
  }
  else
  {
    char v12 = GSSetConflictResolved(v9, a4, a5);
  }
  [(GSTemporaryStorage *)self _unlock];
  return v12;
}

- (BOOL)setAdditionDisplayName:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a3 url];
  BOOL v10 = (char *)[v9 fileSystemRepresentation];

  if ([(GSTemporaryStorage *)self _writeLock:a5])
  {
    if (access(v10, 0))
    {
      int v11 = [NSString stringWithFormat:@"The supplied addition doesn't exist"];
      char v12 = gs_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        GSAdditionCreationInfoValidate_cold_2();
      }

      if (a5)
      {
        _GSErrorForStatus(105, v11, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      char v13 = 0;
    }
    else
    {
      char v13 = GSSetOriginalDisplayName(v10, v8, a5);
    }
    [(GSTemporaryStorage *)self _unlock];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)setAdditionNameSpace:(id)a3 value:(id)a4 error:(id *)a5
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![(GSTemporaryStorage *)self _writeLock:a5])
  {
    id v26 = 0;
    goto LABEL_13;
  }
  BOOL v10 = [v8 nameSpace];
  int v11 = [(GSTemporaryStorage *)self _URLForNameSpace:v10 createIfNeeded:0 allowMissing:0 error:a5];

  if (v11)
  {
    char v12 = [(GSTemporaryStorage *)self _URLForNameSpace:v9 createIfNeeded:1 allowMissing:0 error:a5];
    if (v12)
    {
      char v13 = [v8 name];
      uint64_t v14 = [v12 URLByAppendingPathComponent:v13];

      objc_msgSend(v11, "gs_chmod:", 448);
      objc_msgSend(v12, "gs_chmod:", 448);
      id v15 = [v8 url];
      v16 = (std::__fs::filesystem::path *)[v15 fileSystemRepresentation];
      id v17 = v14;
      int v18 = _PathRename(v16, (std::__fs::filesystem::path *)[v17 fileSystemRepresentation], a5);

      if (v18)
      {
        id v19 = v17;
        BOOL v20 = GSGetGenerationOptions((const char *)[v19 fileSystemRepresentation]);
        id v21 = v19;
        BOOL v22 = GSGetConflictResolved((const char *)[v21 fileSystemRepresentation]);
        v28[0] = @"o";
        v23 = [NSNumber numberWithUnsignedLongLong:v20];
        v29[0] = v23;
        v29[1] = v9;
        v28[1] = @"ns";
        v28[2] = @"u";
        v29[2] = v21;
        v28[3] = @"cr";
        objc_super v24 = [NSNumber numberWithBool:v22];
        v29[3] = v24;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
      }
      else
      {
        uint64_t v25 = 0;
      }
      objc_msgSend(v11, "gs_chmod:", 320);
      objc_msgSend(v12, "gs_chmod:", 320);
      goto LABEL_12;
    }
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = 0;
    char v12 = 0;
  }
  id v17 = 0;
LABEL_12:
  [(GSTemporaryStorage *)self _unlock];
  id v26 = v25;

LABEL_13:
  return v26;
}

- (BOOL)mergeAdditionUserInfo:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [a3 url];
  BOOL v10 = (char *)[v9 fileSystemRepresentation];

  if ([(GSTemporaryStorage *)self _writeLock:a5])
  {
    if (access(v10, 0))
    {
      int v11 = [NSString stringWithFormat:@"The supplied addition doesn't exist"];
      char v12 = gs_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        GSAdditionCreationInfoValidate_cold_2();
      }

      if (a5)
      {
        _GSErrorForStatus(105, v11, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      char v13 = 0;
    }
    else
    {
      char v13 = GSMergeInfoValueDictionary(v10, v8, a5);
    }
    [(GSTemporaryStorage *)self _unlock];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)stagingURLforCreatingAdditionWithError:(id *)a3
{
  char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [(NSURL *)self->_stagingURL path];
  id v7 = objc_msgSend(v5, "gs_createTemporarySubdirectoryOfItem:withTemplate:error:", v6, @"XXXXXXX", a3);

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)URLforReplacingItemWithError:(id *)a3
{
  char v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [v5 URLForDirectory:99 inDomain:1 appropriateForURL:self->_documentURL create:1 error:a3];

  return v6;
}

- (void)cleanupStagingURL:(id)a3
{
  stagingURL = self->_stagingURL;
  id v5 = a3;
  char v6 = [(NSURL *)stagingURL path];
  id v7 = [(NSURL *)self->_stagingURL pathComponents];
  id v8 = [v5 path];

  GSStagingContainer(v6, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = v10;
  if (v10)
  {
    _RemoveTree((char *)[v10 fileSystemRepresentation], 0, 0);
    id v9 = v10;
  }
}

- (id)prepareAdditionCreationWithItemAtURL:(id)a3 byMoving:(BOOL)a4 creationInfo:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = v10;
  char v13 = [(NSURL *)self->_stagingURL path];
  uint64_t v14 = [(NSURL *)self->_stagingURL pathComponents];
  id v15 = [v12 path];
  v16 = GSStagingContainer(v13, v14, v15);

  if (!v16)
  {
    uint64_t v19 = [(GSTemporaryStorage *)self stagingURLforCreatingAdditionWithError:a6];
    if (!v19)
    {
      id v18 = 0;
      id v17 = v12;
      goto LABEL_26;
    }
    BOOL v20 = (void *)v19;
    id v21 = [v11 objectForKey:@"kGSAdditionName"];
    BOOL v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = [v12 lastPathComponent];
    }
    objc_super v24 = v23;

    uint64_t v25 = [v11 objectForKeyedSubscript:@"kGSAdditionKeepFileID"];
    uint64_t v26 = [v25 BOOLValue];

    v27 = [v20 URLByAppendingPathComponent:v24];

    v28 = (std::__fs::filesystem::path *)[v12 fileSystemRepresentation];
    id v17 = v27;
    if (!GSStageTree(v28, (std::__fs::filesystem::path *)[v17 fileSystemRepresentation], v8, v26, a6))
    {
      id v31 = v20;
      _RemoveTree((char *)[v31 fileSystemRepresentation], 0, 0);
      goto LABEL_19;
    }

LABEL_11:
    id v17 = v17;
    v29 = (char *)[v17 fileSystemRepresentation];
    v30 = GSAdditionComputePOSIXName(v11, self->_documentURL, v17, a6);
    if (v30 && GSSetOriginalPOSIXName(v29, v30, a6))
    {
      GSAdditionComputeDN(v11, self->_documentURL, v17, a6);
      id v31 = (id)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        if (!GSSetOriginalDisplayName(v29, v31, a6))
        {
          id v18 = 0;
          goto LABEL_24;
        }
        objc_super v24 = GSAdditionValidateUInfo(v11, a6);
        if (v24 && GSSetInfoDictionary(v29, v24, a6))
        {
          id v18 = v17;
LABEL_20:

LABEL_24:
          v30 = v31;
          goto LABEL_25;
        }
LABEL_19:
        id v18 = 0;
        goto LABEL_20;
      }
      v30 = 0;
    }
    id v18 = 0;
LABEL_25:

    goto LABEL_26;
  }
  id v17 = v12;
  id v18 = 0;
  if (GSArchiveTree((char *)[v17 fileSystemRepresentation], 0, 0, a6)) {
    goto LABEL_11;
  }
LABEL_26:

  return v18;
}

- (void)createAdditionStagedAtURL:(id)a3 creationInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__GSTemporaryStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke;
  v15[3] = &unk_1E6C9F538;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

void __79__GSTemporaryStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke(uint64_t a1)
{
  v57[4] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) path];
  objc_super v3 = [*(id *)(*(void *)(a1 + 32) + 24) pathComponents];
  id v4 = [*(id *)(a1 + 40) path];
  id v5 = GSStagingContainer(v2, v3, v4);

  if (v5)
  {
    char v6 = [*(id *)(a1 + 40) path];
    id v7 = *(void **)(a1 + 48);
    id v52 = 0;
    id v8 = GSAdditionCreationInfoValidate(v6, v7, &v52);
    id v9 = v52;

    if (v8)
    {
      id v10 = *(void **)(a1 + 32);
      id v51 = v9;
      char v11 = [v10 _writeLock:&v51];
      id v12 = v51;

      if (v11)
      {
        id v13 = [v8 objectForKey:@"kGSAdditionNameSpace"];
        id v14 = [v8 objectForKey:@"kGSAdditionName"];
        id v15 = [v8 objectForKey:@"kGSAdditionOnDuplicate"];
        id v16 = [v8 objectForKey:@"kGSAdditionOptions"];
        v44 = [v8 objectForKey:@"kGSAdditionConflictResolved"];
        id v17 = *(void **)(a1 + 32);
        id v50 = v12;
        id v18 = [v17 _URLForNameSpace:v13 createIfNeeded:1 allowMissing:0 error:&v50];
        id v19 = v50;

        v45 = v16;
        if (!v18)
        {
          id v46 = 0;
          id v34 = 0;
LABEL_29:
          objc_msgSend(v18, "gs_chmod:", 320);
          [*(id *)(a1 + 32) _unlock];
          id v9 = v19;
          goto LABEL_30;
        }
        v43 = v15;
        id v46 = [v18 URLByAppendingPathComponent:v14];
        BOOL v20 = (std::__fs::filesystem::path *)[v46 fileSystemRepresentation];
        int v21 = access((const char *)v20, 0);
        v42 = v14;
        if (!v21)
        {
          int v35 = [v43 intValue];
          if (v35 == 1)
          {
            v56[0] = @"o";
            v30 = [NSNumber numberWithUnsignedLongLong:GSGetGenerationOptions((const char *)v20)];
            v57[0] = v30;
            v57[1] = v13;
            v56[1] = @"ns";
            v56[2] = @"u";
            v57[2] = v46;
            v56[3] = @"cr";
            v39 = [NSNumber numberWithBool:GSGetConflictResolved((const char *)v20)];
            v57[3] = v39;
            id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:4];

LABEL_26:
            id v34 = [[GSAddition alloc] _initWithStorage:*(void *)(a1 + 32) andDictionary:v31];
LABEL_27:

            goto LABEL_28;
          }
          if (!v35)
          {
            v36 = [NSString stringWithFormat:@"Generation already exists"];
            v37 = gs_default_log();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              __79__GSTemporaryStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke_cold_2();
            }

            uint64_t v38 = _GSErrorForStatus(106, v36, 0);

            id v34 = 0;
            id v31 = v19;
            id v19 = (id)v38;
            goto LABEL_27;
          }
        }
        v41 = v13;
        BOOL v22 = (std::__fs::filesystem::path *)[*(id *)(a1 + 40) fileSystemRepresentation];
        id v49 = v19;
        int v23 = GSSetGenerationOptions((char *)v22, [v16 unsignedLongLongValue], &v49);
        id v9 = v49;

        if (!v23)
        {
          id v34 = 0;
          id v13 = v41;
          id v14 = v42;
          id v15 = v43;
LABEL_30:
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          _RemoveTree((char *)[v5 fileSystemRepresentation], 0, 0);

          goto LABEL_31;
        }
        objc_msgSend(v18, "gs_chmod:", 448);
        if (!v21)
        {
          objc_super v24 = (void *)MEMORY[0x1E4F1CB10];
          v55[0] = v5;
          v40 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v25 = [v40 UUIDString];
          v55[1] = v25;
          uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
          v27 = [v24 fileURLWithPathComponents:v26];

          id v28 = v27;
          id v48 = v9;
          LODWORD(v25) = _PathRename(v20, (std::__fs::filesystem::path *)[v28 fileSystemRepresentation], &v48);
          id v19 = v48;

          if (!v25)
          {
            id v34 = 0;
            id v13 = v41;
            goto LABEL_28;
          }
          id v9 = v19;
        }
        id v47 = v9;
        int v29 = _PathRename(v22, v20, &v47);
        id v19 = v47;

        id v13 = v41;
        if (!v29)
        {
          id v34 = 0;
LABEL_28:
          id v14 = v42;
          id v15 = v43;
          goto LABEL_29;
        }
        v53[0] = @"o";
        v53[1] = @"ns";
        v54[0] = v45;
        v54[1] = v41;
        v54[2] = v46;
        v53[2] = @"u";
        v53[3] = @"cr";
        v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v44, "BOOLValue"));
        v54[3] = v30;
        id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:4];
        goto LABEL_26;
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      _RemoveTree((char *)[v5 fileSystemRepresentation], 0, 0);

      id v9 = v12;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      _RemoveTree((char *)[v5 fileSystemRepresentation], 0, 0);
    }
  }
  else
  {
    v32 = [NSString stringWithFormat:@"not a staged URL: %@", *(void *)(a1 + 40)];
    v33 = gs_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      __79__GSTemporaryStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke_cold_1();
    }

    _GSErrorForStatus(104, v32, 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
LABEL_31:
}

- (BOOL)replaceDocumentWithContentsOfAddition:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    id v12 = GSAdditionSaveBlocking(self, self->_documentURL, 0, v11, a6);
    if (!v12)
    {
      BOOL v16 = 0;
      goto LABEL_11;
    }
    id v13 = v12;
    if (a5) {
      *a5 = v12;
    }
  }
  GSRestoreAdditionInternal(self->_documentURL, v10, a6);
  id v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  id v15 = v14;
  BOOL v16 = v14 != 0;
  if (v14 && self->_documentURL != v14) {
    [(GSTemporaryStorage *)self setDocumentURL:v14];
  }

LABEL_11:
  return v16;
}

- (BOOL)replaceDocumentWithContentsOfItemAtURL:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    id v12 = GSAdditionSaveBlocking(self, self->_documentURL, 0, v11, a6);
    if (!v12)
    {
LABEL_11:
      BOOL v16 = 0;
      goto LABEL_12;
    }
    id v13 = v12;
    if (a5) {
      *a5 = v12;
    }
  }
  if (![(NSURL *)self->_documentURL checkResourceIsReachableAndReturnError:a6])goto LABEL_11; {
  GSReplaceDocumentInternal(self->_documentURL, v10, a6);
  }
  id v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  id v15 = v14;
  BOOL v16 = v14 != 0;
  if (v14 && self->_documentURL != v14) {
    [(GSTemporaryStorage *)self setDocumentURL:v14];
  }

LABEL_12:
  return v16;
}

- (id)additionWithName:(id)a3 inNameSpace:(id)a4 error:(id *)a5
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(GSTemporaryStorage *)self _URLForNameSpace:v9 createIfNeeded:0 allowMissing:0 error:a5];
  id v11 = v10;
  if (!v10) {
    goto LABEL_9;
  }
  id v12 = [v10 URLByAppendingPathComponent:v8];

  id v11 = v12;
  id v13 = (const char *)[v11 fileSystemRepresentation];
  if (access(v13, 0))
  {
    id v14 = [NSString stringWithFormat:@"The supplied addition doesn't exist"];
    id v15 = gs_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      GSAdditionCreationInfoValidate_cold_2();
    }

    if (a5)
    {
      _GSErrorForStatus(105, v14, 0);
      id v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v16 = 0;
    }
    goto LABEL_11;
  }
  if (![(GSTemporaryStorage *)self _readLock:a5])
  {
LABEL_9:
    id v16 = 0;
    goto LABEL_12;
  }
  v20[0] = @"o";
  id v17 = [NSNumber numberWithUnsignedLongLong:GSGetGenerationOptions(v13)];
  v21[0] = v17;
  v21[1] = v9;
  v20[1] = @"ns";
  v20[2] = @"u";
  v21[2] = v11;
  v20[3] = @"cr";
  id v18 = [NSNumber numberWithBool:GSGetConflictResolved(v13)];
  v21[3] = v18;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];

  [(GSTemporaryStorage *)self _unlock];
  id v16 = [[GSAddition alloc] _initWithStorage:self andDictionary:v14];
LABEL_11:

LABEL_12:
  return v16;
}

- (id)additionsWithNames:(id)a3 inNameSpace:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    v33 = a5;
    v32 = self;
    while (2)
    {
      uint64_t v15 = 0;
      uint64_t v34 = v13;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * v15);
        id v17 = [(GSTemporaryStorage *)self _URLForNameSpace:v9 createIfNeeded:0 allowMissing:0 error:a5];
        if (v17)
        {
          id v18 = v17;
          id v19 = [v17 URLByAppendingPathComponent:v16];

          id v20 = v19;
          int v21 = (const char *)[v20 fileSystemRepresentation];
          if (!access(v21, 0))
          {
            if (![(GSTemporaryStorage *)self _readLock:a5])
            {

              id v30 = 0;
              goto LABEL_15;
            }
            v39[0] = @"o";
            uint64_t v22 = v14;
            id v23 = v11;
            id v24 = v10;
            uint64_t v25 = [NSNumber numberWithUnsignedLongLong:GSGetGenerationOptions(v21)];
            v40[0] = v25;
            v40[1] = v9;
            v39[1] = @"ns";
            v39[2] = @"u";
            v40[2] = v20;
            v39[3] = @"cr";
            id v26 = v9;
            v27 = [NSNumber numberWithBool:GSGetConflictResolved(v21)];
            v40[3] = v27;
            id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];

            id v10 = v24;
            id v11 = v23;
            uint64_t v14 = v22;
            uint64_t v13 = v34;
            self = v32;
            [(GSTemporaryStorage *)v32 _unlock];
            id v29 = [[GSAddition alloc] _initWithStorage:v32 andDictionary:v28];
            [v10 addObject:v29];

            id v9 = v26;
            a5 = v33;
          }
        }
        else
        {
          id v20 = 0;
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v30 = v10;
LABEL_15:

  return v30;
}

- (id)enumeratorForAdditionsInNameSpace:(id)a3 withOptions:(unint64_t)a4 withoutOptions:(unint64_t)a5 ordering:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = [[GSTemporaryAddtionEnumerator alloc] initWithStorage:self nameSpace:v10 withOptions:a4 withoutOptions:a5 ordering:v6];

  return v11;
}

- (id)_enumerateItemsAtURL:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  uint64_t v6 = [v5 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:1 errorHandler:0];

  return v6;
}

- (void)removeAdditions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    workQueue = self->_workQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__GSTemporaryStorage_removeAdditions_completionHandler___block_invoke_2;
    v11[3] = &unk_1E6C9F560;
    v11[4] = self;
    id v13 = v7;
    id v12 = v6;
    dispatch_async(workQueue, v11);

    id v10 = v13;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__GSTemporaryStorage_removeAdditions_completionHandler___block_invoke;
    v14[3] = &unk_1E6C9F360;
    id v15 = v7;
    [(GSTemporaryStorage *)self removeAllAdditionsForNamespaces:0 completionHandler:v14];
    id v10 = v15;
  }
}

uint64_t __56__GSTemporaryStorage_removeAdditions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__GSTemporaryStorage_removeAdditions_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) URLByAppendingPathComponent:@".ns"];
  objc_super v3 = *(void **)(a1 + 32);
  id v36 = 0;
  char v4 = [v3 _writeLock:&v36];
  id v5 = v36;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "gs_chmod:", 448);
    objc_msgSend(v2, "gs_chmod:", 448);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = [*(id *)(a1 + 32) _enumerateItemsAtURL:v2];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "gs_chmod:", 448);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v8);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [*(id *)(*((void *)&v28 + 1) + 8 * j) url];
          _RemoveTree((char *)[v16 fileSystemRepresentation], 0, 0);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v13);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v17 = objc_msgSend(*(id *)(a1 + 32), "_enumerateItemsAtURL:", v2, 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(id *)(*((void *)&v24 + 1) + 8 * k);
          rmdir((const char *)[v22 fileSystemRepresentation]);
          objc_msgSend(v22, "gs_chmod:", 448);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v37 count:16];
      }
      while (v19);
    }

    objc_msgSend(v2, "gs_chmod:", 320);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "gs_chmod:", 320);
    [*(id *)(a1 + 32) _unlock];
    id v23 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v23 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v23();
}

- (void)removeAllAdditionsForNamespaces:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__GSTemporaryStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke;
  block[3] = &unk_1E6C9F560;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);
}

void __72__GSTemporaryStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) URLByAppendingPathComponent:@".ns"];
  objc_super v3 = *(void **)(a1 + 32);
  id v34 = 0;
  char v4 = [v3 _writeLock:&v34];
  id v5 = v34;
  if (v4)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "gs_chmod:", 448);
    objc_msgSend(v2, "gs_chmod:", 448);
    id v6 = *(void **)(a1 + 40);
    if (!v6
      && (id v7 = v2,
          _RemoveTree((char *)[v7 fileSystemRepresentation], 0, 0),
          v7,
          v2 = 0,
          (id v6 = *(void **)(a1 + 40)) == 0)
      || [v6 containsObject:@"com.apple.documentVersions"])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v8 = [*(id *)(a1 + 32) _enumerateItemsAtURL:*(void *)(*(void *)(a1 + 32) + 8)];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        id v25 = v5;
        id v11 = 0;
        uint64_t v12 = *(void *)v31;
        do
        {
          uint64_t v13 = 0;
          uint64_t v14 = v11;
          do
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(v8);
            }
            id v11 = *(id *)(*((void *)&v30 + 1) + 8 * v13);

            id v15 = [v11 lastPathComponent];
            char v16 = [v15 hasPrefix:@"."];

            if ((v16 & 1) == 0) {
              _RemoveTree((char *)[v11 fileSystemRepresentation], 0, 0);
            }
            ++v13;
            uint64_t v14 = v11;
          }
          while (v10 != v13);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v10);

        id v5 = v25;
      }
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      id v20 = 0;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v17);
          }
          id v23 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (([v23 isEqualToString:@"com.apple.documentVersions"] & 1) == 0)
          {
            long long v24 = [v2 URLByAppendingPathComponent:v23];

            id v20 = v24;
            _RemoveTree((char *)[v20 fileSystemRepresentation], 0, 0);
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v19);
    }
    else
    {
      id v20 = 0;
    }

    objc_msgSend(v2, "gs_chmod:", 320);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "gs_chmod:", 320);
    [*(id *)(a1 + 32) _unlock];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (NSURL)libraryURL
{
  return self->_libraryURL;
}

- (NSURL)documentURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDocumentURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_stagingURL, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
}

- (void)__lockWithFlags:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  strerror(v0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1DC715000, v1, v2, "[DEBUG] %@; error %d (%s)", v3, v4, v5, v6, v7);
}

void __79__GSTemporaryStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1DC715000, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

void __79__GSTemporaryStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1DC715000, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
}

@end