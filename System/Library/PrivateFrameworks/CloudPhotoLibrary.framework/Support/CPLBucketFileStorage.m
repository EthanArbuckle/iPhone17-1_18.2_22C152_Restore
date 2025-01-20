@interface CPLBucketFileStorage
- (BOOL)_fixupStoredDestinationURL:(id)a3 isOriginal:(BOOL)a4 needsCommit:(BOOL *)a5 error:(id *)a6;
- (BOOL)_getIsOriginal:(BOOL *)a3 markedForDelete:(BOOL *)a4 forDestinationURL:(id)a5 error:(id *)a6;
- (BOOL)_markURLForDelete:(id)a3 error:(id *)a4;
- (BOOL)_setIsOriginal:(BOOL *)a3 markedForDelete:(BOOL *)a4 onDestinationURL:(id)a5 clearFlags:(BOOL)a6 error:(id *)a7;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)deleteFileWithIdentity:(id)a3 includingOriginal:(BOOL)a4 error:(id *)a5;
- (BOOL)discardAllRetainedFileURLsWithError:(id *)a3;
- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 removingItemAtURL:(id)a5;
- (BOOL)fileManager:(id)a3 shouldRemoveItemAtURL:(id)a4;
- (BOOL)hasFileWithIdentity:(id)a3;
- (BOOL)markForDeleteFileWithIdentity:(id)a3 error:(id *)a4;
- (BOOL)openWithError:(id *)a3;
- (BOOL)releaseFileURL:(id)a3 error:(id *)a4;
- (BOOL)resetWithError:(id *)a3;
- (BOOL)storeData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 needsCommit:(BOOL *)a6 onNewFile:(id)a7 error:(id *)a8;
- (BOOL)storeFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 moveIfPossible:(BOOL)a6 needsCommit:(BOOL *)a7 onNewFile:(id)a8 error:(id *)a9;
- (BOOL)storeUnretainedData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6;
- (BOOL)storeUnretainedFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6;
- (BOOL)trackAllStoresAndDeletes;
- (CPLBucketFileStorage)initWithAbstractObject:(id)a3;
- (id)_destinationURLForIdentity:(id)a3;
- (id)fileEnumeratorIncludingPropertiesForKeys:(id)a3 errorHandler:(id)a4;
- (id)retainFileURLForIdentity:(id)a3 resourceType:(unint64_t)a4 error:(id *)a5;
- (void)_clearFlagsOnFd:(int)a3 url:(id)a4;
- (void)_clearFlagsOnURL:(id)a3;
- (void)checkFileSizeForIdentity:(id)a3;
- (void)setTrackAllStoresAndDeletes:(BOOL)a3;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLBucketFileStorage

- (CPLBucketFileStorage)initWithAbstractObject:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CPLBucketFileStorage;
  v3 = [(CPLBucketFileStorage *)&v15 initWithAbstractObject:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CPLBucketFileStorage *)v3 abstractObject];
    v6 = [v5 baseURL];
    uint64_t v7 = [v6 URLByAppendingPathComponent:@"filecache" isDirectory:1];
    urlForFiles = v4->_urlForFiles;
    v4->_urlForFiles = (NSURL *)v7;

    v9 = (NSFileManager *)objc_alloc_init((Class)NSFileManager);
    fileManager = v4->_fileManager;
    v4->_fileManager = v9;

    logDomain = v4->_logDomain;
    v4->_logDomain = (NSString *)@"engine.filestorage.bucketstorage";

    v12 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    temporarilyRetainedURLs = v4->_temporarilyRetainedURLs;
    v4->_temporarilyRetainedURLs = v12;
  }
  return v4;
}

- (BOOL)openWithError:(id *)a3
{
  fileManager = self->_fileManager;
  urlForFiles = self->_urlForFiles;
  id v11 = 0;
  BOOL v7 = 1;
  unsigned __int8 v8 = [(NSFileManager *)fileManager createDirectoryAtURL:urlForFiles withIntermediateDirectories:1 attributes:0 error:&v11];
  id v9 = v11;
  if ((v8 & 1) == 0)
  {
    if ([(NSFileManager *)self->_fileManager cplIsFileExistsError:v9])
    {

      id v9 = 0;
    }
    else if (a3)
    {
      id v9 = v9;
      BOOL v7 = 0;
      *a3 = v9;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)closeWithError:(id *)a3
{
  return 1;
}

- (id)_destinationURLForIdentity:(id)a3
{
  id v5 = a3;
  v6 = [v5 fingerPrint];
  uint64_t v7 = [v5 fileUTI];
  if (!v6) {
    sub_1001D4870((uint64_t)a2, (uint64_t)self);
  }
  unsigned __int8 v8 = (void *)v7;
  id v14 = 0;
  id v9 = +[CPLResourceIdentity storageNameForFingerPrint:v6 fileUTI:v7 bucket:&v14];
  id v10 = v14;
  id v11 = [(NSURL *)self->_urlForFiles URLByAppendingPathComponent:v10 isDirectory:1];
  v12 = [v11 URLByAppendingPathComponent:v9 isDirectory:0];

  return v12;
}

- (void)_clearFlagsOnFd:(int)a3 url:(id)a4
{
  id v5 = a4;
  ssize_t v6 = fgetxattr(a3, "com.apple.cpl.delete", 0, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  if (v6 > 0 || *__error() == 93)
  {
    id v7 = 0;
    int v8 = 1;
  }
  else
  {
    id v7 = +[CPLErrors posixErrorForURL:v5];
    int v8 = 0;
  }

  id v9 = v7;
  if (v8)
  {
    if (v6 >= 1)
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_1001BF7B8();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          int v18 = 138412290;
          id v19 = v5;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Storing resource at %@: client had a file with remaining CPL flags - clearing", (uint8_t *)&v18, 0xCu);
        }
      }
      id v11 = v5;
      if (fremovexattr(a3, "com.apple.cpl.delete", 0) && *__error() != 93)
      {
        id v13 = +[CPLErrors posixErrorForURL:v11];
        int v12 = 1;
      }
      else
      {
        int v12 = 0;
        id v13 = v9;
      }

      id v16 = v13;
      if (!v12 || _CPLSilentLogging) {
        goto LABEL_18;
      }
      id v14 = sub_1001BF7B8();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v17 = [v11 path];
        int v18 = 138412546;
        id v19 = v17;
        __int16 v20 = 2112;
        id v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to clear flags when storing resource at %@ (ignoring): %@", (uint8_t *)&v18, 0x16u);
      }
LABEL_17:

LABEL_18:
      id v9 = v16;
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v14 = sub_1001BF7B8();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_super v15 = [v5 path];
      int v18 = 138412546;
      id v19 = v15;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to get flags when storing resource at %@ (ignoring): %@", (uint8_t *)&v18, 0x16u);
    }
    id v16 = v9;
    goto LABEL_17;
  }
}

- (void)_clearFlagsOnURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = open((const char *)[v4 fileSystemRepresentation], 0);
  if ((v5 & 0x80000000) != 0)
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_1001BF7B8();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = [v4 path];
        id v9 = +[CPLErrors posixErrorForURL:v4];
        int v10 = 138412546;
        id v11 = v8;
        __int16 v12 = 2112;
        id v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to clear flags when storing resource at %@ (ignoring): %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  else
  {
    int v6 = v5;
    [(CPLBucketFileStorage *)self _clearFlagsOnFd:v5 url:v4];
    close(v6);
  }
}

- (BOOL)_setIsOriginal:(BOOL *)a3 markedForDelete:(BOOL *)a4 onDestinationURL:(id)a5 clearFlags:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = v12;
  if (!((unint64_t)a3 | (unint64_t)a4))
  {
    LOBYTE(v17) = 1;
    goto LABEL_35;
  }
  id v14 = v12;
  uint64_t v15 = open((const char *)[v14 fileSystemRepresentation], 0);
  int v16 = v15;
  if (a7 && (v15 & 0x80000000) != 0)
  {
    +[CPLErrors posixErrorForURL:v14];
    LOBYTE(v17) = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  BOOL v17 = (int)v15 >= 0;
  if ((v15 & 0x80000000) == 0 && v8) {
    [(CPLBucketFileStorage *)self _clearFlagsOnFd:v15 url:v14];
  }
  if (a3 && (v16 & 0x80000000) == 0)
  {
    BOOL v18 = *a3;
    id v19 = v14;
    if (v18)
    {
      int v20 = fsetxattr(v16, "com.apple.cpl.original", "Y", 1uLL, 0, 0);
      BOOL v17 = v20 == 0;
      if (!a7 || !v20) {
        goto LABEL_20;
      }
    }
    else
    {
      if (!fremovexattr(v16, "com.apple.cpl.original", 0))
      {
        BOOL v17 = 1;
        goto LABEL_20;
      }
      int v21 = *__error();
      BOOL v17 = v21 == 93;
      if (!a7 || v21 == 93) {
        goto LABEL_20;
      }
    }
    +[CPLErrors posixErrorForURL:v19];
    BOOL v17 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
  }
  if (a4 && v17)
  {
    BOOL v22 = *a4;
    id v23 = v14;
    if (v22)
    {
      int v24 = fsetxattr(v16, "com.apple.cpl.delete", "Y", 1uLL, 0, 0);
      LOBYTE(v17) = v24 == 0;
      if (!a7 || !v24) {
        goto LABEL_32;
      }
    }
    else
    {
      if (!fremovexattr(v16, "com.apple.cpl.delete", 0))
      {
        LOBYTE(v17) = 1;
        goto LABEL_32;
      }
      int v25 = *__error();
      LOBYTE(v17) = v25 == 93;
      if (!a7 || v25 == 93) {
        goto LABEL_32;
      }
    }
    +[CPLErrors posixErrorForURL:v23];
    LOBYTE(v17) = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
  }
  if ((v16 & 0x80000000) == 0) {
    close(v16);
  }
LABEL_35:

  return v17;
}

- (BOOL)_getIsOriginal:(BOOL *)a3 markedForDelete:(BOOL *)a4 forDestinationURL:(id)a5 error:(id *)a6
{
  id v9 = a5;
  int v10 = v9;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    id v11 = v9;
    int v12 = open((const char *)[v11 fileSystemRepresentation], 0);
    int v13 = v12;
    if (a6 && v12 < 0)
    {
      +[CPLErrors posixErrorForURL:v11];
      LOBYTE(v14) = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v14 = v12 >= 0;
      if (a3 && (v12 & 0x80000000) == 0)
      {
        id v15 = v11;
        if (fgetxattr(v13, "com.apple.cpl.original", 0, 0xFFFFFFFFFFFFFFFFLL, 0, 0) < 1)
        {
          if (*__error() == 93)
          {
            *a3 = 0;
            BOOL v14 = 1;
          }
          else if (a6)
          {
            +[CPLErrors posixErrorForURL:v15];
            BOOL v14 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 1;
          *a3 = 1;
        }
      }
      if (a4 && v14)
      {
        id v16 = v11;
        if (fgetxattr(v13, "com.apple.cpl.delete", 0, 0xFFFFFFFFFFFFFFFFLL, 0, 0) < 1)
        {
          if (*__error() == 93)
          {
            *a4 = 0;
            LOBYTE(v14) = 1;
          }
          else if (a6)
          {
            +[CPLErrors posixErrorForURL:v16];
            LOBYTE(v14) = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            LOBYTE(v14) = 0;
          }
        }
        else
        {
          LOBYTE(v14) = 1;
          *a4 = 1;
        }
      }
      if ((v13 & 0x80000000) == 0) {
        close(v13);
      }
    }
  }
  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (BOOL)_fixupStoredDestinationURL:(id)a3 isOriginal:(BOOL)a4 needsCommit:(BOOL *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  __int16 v22 = 0;
  if (v8)
  {
    if (![(CPLBucketFileStorage *)self _getIsOriginal:(char *)&v22 + 1 markedForDelete:&v22 forDestinationURL:v10 error:a6])
    {
      BOOL v13 = 0;
      goto LABEL_23;
    }
    BOOL v11 = HIBYTE(v22) == 0;
    if (HIBYTE(v22)) {
      int v12 = 0;
    }
    else {
      int v12 = &unk_1002CE310;
    }
  }
  else
  {
    BOOL v11 = 0;
    int v12 = 0;
    BOOL v13 = 0;
    if (![(CPLBucketFileStorage *)self _getIsOriginal:0 markedForDelete:&v22 forDestinationURL:v10 error:a6])goto LABEL_23; {
  }
    }
  int v14 = v22;
  if ((_BYTE)v22) {
    id v15 = &unk_1002DC148;
  }
  else {
    id v15 = 0;
  }
  *a5 = v22;
  if (v14 || v11)
  {
    if (!_CPLSilentLogging)
    {
      id v16 = sub_1001BF7B8();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = [v10 path];
        BOOL v18 = (void *)v17;
        id v19 = "";
        int v20 = " original";
        if (!v11) {
          int v20 = "";
        }
        *(_DWORD *)buf = 138412802;
        uint64_t v24 = v17;
        __int16 v25 = 2080;
        v26 = v20;
        if (v14) {
          id v19 = " undelete";
        }
        __int16 v27 = 2080;
        v28 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Marking %@:%s%s", buf, 0x20u);
      }
    }
    BOOL v13 = [(CPLBucketFileStorage *)self _setIsOriginal:v12 markedForDelete:v15 onDestinationURL:v10 clearFlags:0 error:a6];
  }
  else
  {
    BOOL v13 = 1;
  }
LABEL_23:

  return v13;
}

- (BOOL)storeFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 moveIfPossible:(BOOL)a6 needsCommit:(BOOL *)a7 onNewFile:(id)a8 error:(id *)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v50 = a3;
  id v15 = a4;
  id v16 = (uint64_t (**)(id, id *))a8;
  uint64_t v17 = [(CPLBucketFileStorage *)self _destinationURLForIdentity:v15];
  unsigned int v18 = [(NSFileManager *)self->_fileManager cplFileExistsAtURL:v17];
  BOOL v20 = self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0;
  if (v18)
  {
    if (v20)
    {
      int v21 = sub_1001BF7B8();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = [v17 lastPathComponent];
        *(_DWORD *)buf = 138412546;
        id v60 = v15;
        __int16 v61 = 2112;
        v62 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "STORING %@ to %@: already in storage", buf, 0x16u);
      }
    }
    id v58 = 0;
    unsigned __int8 v23 = [(CPLBucketFileStorage *)self _fixupStoredDestinationURL:v17 isOriginal:v12 needsCommit:a7 error:&v58];
    id v24 = v58;
    if (v23) {
      goto LABEL_50;
    }
    goto LABEL_35;
  }
  if (v20)
  {
    __int16 v25 = sub_1001BF7B8();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v17 lastPathComponent];
      *(_DWORD *)buf = 138412546;
      id v60 = v15;
      __int16 v61 = 2112;
      v62 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "STORING %@ to %@: adding to storage", buf, 0x16u);
    }
  }
  id v57 = 0;
  int v27 = v16[2](v16, &v57);
  id v28 = v57;
  if (v27)
  {
    *a7 = 1;
    fileManager = self->_fileManager;
    if (v11)
    {
      id v56 = v28;
      unsigned __int8 v30 = [(NSFileManager *)fileManager cplMoveItemAtURL:v50 toURL:v17 error:&v56];
      v31 = v56;
    }
    else
    {
      id v55 = v28;
      unsigned __int8 v30 = [(NSFileManager *)fileManager cplCopyItemAtURL:v50 toURL:v17 error:&v55];
      v31 = v55;
    }
    id v24 = v31;

    if ((v30 & 1) == 0)
    {
      if (![(NSFileManager *)self->_fileManager cplIsFileDoesNotExistError:v24])
      {
LABEL_35:
        id v28 = v24;
        goto LABEL_36;
      }
      v34 = [v17 URLByDeletingLastPathComponent];
      v48 = v34;
      if (!_CPLSilentLogging)
      {
        v35 = sub_1001BF7B8();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v36 = [v34 path];
          *(_DWORD *)buf = 138412290;
          id v60 = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Creating bucket at %@", buf, 0xCu);

          v34 = v48;
        }
      }
      v37 = self->_fileManager;
      id v54 = v24;
      unsigned __int8 v38 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v37, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v34, 1, 0, &v54, v48);
      id v28 = v54;

      if ((v38 & 1) == 0)
      {

        goto LABEL_36;
      }
      v39 = self->_fileManager;
      if (v11)
      {
        id v53 = v28;
        unsigned __int8 v40 = [(NSFileManager *)v39 cplMoveItemAtURL:v50 toURL:v17 error:&v53];
        id v24 = v53;

        id v28 = v24;
        if ((v40 & 1) == 0) {
          goto LABEL_36;
        }
      }
      else
      {
        id v52 = v28;
        unsigned int v47 = [(NSFileManager *)v39 cplCopyItemAtURL:v50 toURL:v17 error:&v52];
        id v24 = v52;

        id v28 = v24;
        if (!v47) {
          goto LABEL_36;
        }
      }
    }
    if (!v12)
    {
      [(CPLBucketFileStorage *)self _clearFlagsOnURL:v17];
LABEL_50:
      BOOL v32 = 1;
      goto LABEL_51;
    }
    id v51 = v24;
    BOOL v32 = 1;
    unsigned __int8 v33 = [(CPLBucketFileStorage *)self _setIsOriginal:&unk_1002CE310 markedForDelete:0 onDestinationURL:v17 clearFlags:1 error:&v51];
    id v28 = v51;

    if (v33) {
      goto LABEL_48;
    }
    [(NSFileManager *)self->_fileManager removeItemAtURL:v17 error:0];
  }
LABEL_36:
  if ([(NSFileManager *)self->_fileManager cplIsFileExistsError:v28])
  {
    if (_CPLSilentLogging) {
      goto LABEL_45;
    }
    v41 = sub_1001BF7B8();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    v42 = [v17 path];
    *(_DWORD *)buf = 138412290;
    id v60 = v42;
    v43 = "Tried to store %@ but file appeared miraculously!";
    v44 = v41;
    uint32_t v45 = 12;
    goto LABEL_43;
  }
  if (_CPLSilentLogging) {
    goto LABEL_45;
  }
  v41 = sub_1001BF7B8();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    v42 = [v17 path];
    *(_DWORD *)buf = 138412802;
    id v60 = v15;
    __int16 v61 = 2112;
    v62 = v42;
    __int16 v63 = 2112;
    id v64 = v28;
    v43 = "Failed to store %@ to %@: %@";
    v44 = v41;
    uint32_t v45 = 32;
LABEL_43:
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v43, buf, v45);
  }
LABEL_44:

LABEL_45:
  if (!a9)
  {
    BOOL v32 = 0;
LABEL_48:
    id v24 = v28;
    goto LABEL_51;
  }
  id v24 = v28;
  BOOL v32 = 0;
  *a9 = v24;
LABEL_51:

  return v32;
}

- (BOOL)storeData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 needsCommit:(BOOL *)a6 onNewFile:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  id v50 = a3;
  id v14 = a4;
  id v15 = (uint64_t (**)(id, id *))a7;
  id v16 = [(CPLBucketFileStorage *)self _destinationURLForIdentity:v14];
  if (![(NSFileManager *)self->_fileManager cplFileExistsAtURL:v16])
  {
    *a6 = 1;
    if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
    {
      id v28 = sub_1001BF7B8();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [v16 lastPathComponent];
        *(_DWORD *)buf = 138412546;
        id v58 = v14;
        __int16 v59 = 2112;
        id v60 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "STORING %@ to %@: adding to storage", buf, 0x16u);
      }
    }
    id v55 = 0;
    int v30 = v15[2](v15, &v55);
    id v31 = v55;
    id v32 = v31;
    if (!v30) {
      goto LABEL_39;
    }
    v49 = a8;
    id v54 = v31;
    unsigned __int8 v33 = [v50 writeToURL:v16 options:1 error:&v54];
    id v25 = v54;

    if (v33)
    {
      if (!v11) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
    if ([(NSFileManager *)self->_fileManager cplIsFileDoesNotExistError:v25])
    {
      v36 = [v16 URLByDeletingLastPathComponent];
      v48 = v36;
      if (!_CPLSilentLogging)
      {
        v37 = sub_1001BF7B8();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          unsigned __int8 v38 = [v36 path];
          *(_DWORD *)buf = 138412290;
          id v58 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Creating bucket at %@", buf, 0xCu);

          v36 = v48;
        }
      }
      fileManager = self->_fileManager;
      id v53 = v25;
      unsigned __int8 v40 = [(NSFileManager *)fileManager createDirectoryAtURL:v36 withIntermediateDirectories:1 attributes:0 error:&v53];
      id v32 = v53;

      if ((v40 & 1) == 0)
      {

        goto LABEL_38;
      }
      id v52 = v32;
      unsigned int v41 = [v50 writeToURL:v16 options:1 error:&v52];
      id v25 = v52;

      if (v41 && v11)
      {
LABEL_23:
        v34 = v25;
        id v51 = v25;
        unsigned __int8 v35 = [(CPLBucketFileStorage *)self _setIsOriginal:&unk_1002CE310 markedForDelete:0 onDestinationURL:v16 clearFlags:0 error:&v51];
        id v25 = v51;

        a8 = v49;
        if ((v35 & 1) == 0)
        {
          [(NSFileManager *)self->_fileManager removeItemAtURL:v16 error:0];
          id v32 = v25;
          goto LABEL_39;
        }
LABEL_24:
        BOOL v26 = 1;
        goto LABEL_51;
      }
      if (v41) {
        goto LABEL_24;
      }
    }
    id v32 = v25;
LABEL_38:
    a8 = v49;
    goto LABEL_39;
  }
  uint64_t v17 = v15;
  BOOL v18 = v11;
  if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
  {
    BOOL v20 = sub_1001BF7B8();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      [v16 lastPathComponent];
      v22 = int v21 = a8;
      *(_DWORD *)buf = 138412546;
      id v58 = v14;
      __int16 v59 = 2112;
      id v60 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "STORING %@ to %@: already in storage", buf, 0x16u);

      a8 = v21;
    }
  }
  id v56 = 0;
  unsigned __int8 v23 = [(CPLBucketFileStorage *)self _fixupStoredDestinationURL:v16 isOriginal:v18 needsCommit:a6 error:&v56];
  id v24 = v56;
  id v25 = v24;
  if (v23)
  {
    BOOL v26 = 1;
    id v15 = v17;
    goto LABEL_51;
  }
  id v32 = v24;
  id v15 = v17;
LABEL_39:
  if ([(NSFileManager *)self->_fileManager cplIsFileExistsError:v32])
  {
    if (_CPLSilentLogging) {
      goto LABEL_48;
    }
    v42 = sub_1001BF7B8();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    v43 = [v16 path];
    *(_DWORD *)buf = 138412546;
    id v58 = v14;
    __int16 v59 = 2112;
    id v60 = v43;
    v44 = "Tried to store %@ at %@ but file appeared miraculously!";
    uint32_t v45 = v42;
    uint32_t v46 = 22;
    goto LABEL_46;
  }
  if (_CPLSilentLogging) {
    goto LABEL_48;
  }
  v42 = sub_1001BF7B8();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    v43 = [v16 path];
    *(_DWORD *)buf = 138412802;
    id v58 = v14;
    __int16 v59 = 2112;
    id v60 = v43;
    __int16 v61 = 2112;
    id v62 = v32;
    v44 = "Failed to store %@ to %@: %@";
    uint32_t v45 = v42;
    uint32_t v46 = 32;
LABEL_46:
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, v44, buf, v46);
  }
LABEL_47:

LABEL_48:
  if (a8)
  {
    id v25 = v32;
    BOOL v26 = 0;
    *a8 = v25;
  }
  else
  {
    BOOL v26 = 0;
    id v25 = v32;
  }
LABEL_51:

  return v26;
}

- (BOOL)storeUnretainedFileAtURL:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = [(CPLBucketFileStorage *)self _destinationURLForIdentity:v11];
  fileManager = self->_fileManager;
  id v14 = [v12 path];
  unsigned int v15 = [(NSFileManager *)fileManager fileExistsAtPath:v14];

  BOOL v17 = self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0;
  if (!v15)
  {
    if (v17)
    {
      id v19 = sub_1001BF7B8();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v20 = [v12 lastPathComponent];
        *(_DWORD *)buf = 138412546;
        id v47 = v11;
        __int16 v48 = 2112;
        v49 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "STORING (unretained) %@ to %@: adding to storage", buf, 0x16u);
      }
    }
    v42 = a6;
    int v21 = self->_fileManager;
    id v45 = 0;
    unsigned __int8 v22 = [(NSFileManager *)v21 cplCopyItemAtURL:v10 toURL:v12 error:&v45];
    id v23 = v45;
    id v24 = v23;
    if (v22)
    {
      id v18 = v23;
    }
    else
    {
      if (![(NSFileManager *)self->_fileManager cplIsFileDoesNotExistError:v23])
      {
        id v18 = v24;
        goto LABEL_35;
      }
      BOOL v26 = [v12 URLByDeletingLastPathComponent];
      unsigned int v41 = v26;
      if (!_CPLSilentLogging)
      {
        int v27 = sub_1001BF7B8();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          id v28 = [v26 path];
          *(_DWORD *)buf = 138412290;
          id v47 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Creating bucket at %@", buf, 0xCu);

          BOOL v26 = v41;
        }
      }
      v29 = self->_fileManager;
      id v44 = v24;
      unsigned __int8 v30 = [(NSFileManager *)v29 createDirectoryAtURL:v26 withIntermediateDirectories:1 attributes:0 error:&v44];
      id v18 = v44;

      if ((v30 & 1) == 0)
      {

        goto LABEL_35;
      }
      id v31 = self->_fileManager;
      id v43 = v18;
      unsigned int v32 = [(NSFileManager *)v31 cplCopyItemAtURL:v10 toURL:v12 error:&v43];
      id v33 = v43;

      id v18 = v33;
      if (!v32)
      {
LABEL_35:
        if ([(NSFileManager *)self->_fileManager cplIsFileExistsError:v18])
        {
          if (!_CPLSilentLogging)
          {
            v34 = sub_1001BF7B8();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v36 = [v12 path];
              *(_DWORD *)buf = 138412290;
              id v47 = v36;
              v37 = "Tried to store (unretained) %@ but file appeared miraculously!";
              unsigned __int8 v38 = v34;
              uint32_t v39 = 12;
LABEL_42:
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);

              goto LABEL_43;
            }
            goto LABEL_43;
          }
        }
        else if (!_CPLSilentLogging)
        {
          v34 = sub_1001BF7B8();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            v36 = [v12 path];
            *(_DWORD *)buf = 138412802;
            id v47 = v11;
            __int16 v48 = 2112;
            v49 = v36;
            __int16 v50 = 2112;
            id v51 = v18;
            v37 = "Failed to store (unretained) %@ to %@: %@";
            unsigned __int8 v38 = v34;
            uint32_t v39 = 32;
            goto LABEL_42;
          }
LABEL_43:

          goto LABEL_44;
        }
        LOBYTE(v15) = 0;
        goto LABEL_44;
      }
    }
    if (v7) {
      id v25 = &unk_1002CE310;
    }
    else {
      id v25 = 0;
    }
    if ([(CPLBucketFileStorage *)self _setIsOriginal:v25 markedForDelete:&unk_1002CE310 onDestinationURL:v12 clearFlags:0 error:v42])
    {
      goto LABEL_20;
    }
    [(NSFileManager *)self->_fileManager removeItemAtURL:v12 error:0];
    goto LABEL_35;
  }
  if (v17)
  {
    v34 = sub_1001BF7B8();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v35 = [v12 lastPathComponent];
      *(_DWORD *)buf = 138412546;
      id v47 = v11;
      __int16 v48 = 2112;
      v49 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "STORING (unretained) %@ to %@: already in storage", buf, 0x16u);
    }
    id v18 = 0;
    goto LABEL_43;
  }
  id v18 = 0;
LABEL_20:
  LOBYTE(v15) = 1;
LABEL_44:

  return v15;
}

- (BOOL)storeUnretainedData:(id)a3 identity:(id)a4 isOriginal:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = [(CPLBucketFileStorage *)self _destinationURLForIdentity:v11];
  fileManager = self->_fileManager;
  id v14 = [v12 path];
  unsigned int v15 = [(NSFileManager *)fileManager fileExistsAtPath:v14];

  BOOL v17 = self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0;
  if (!v15)
  {
    if (v17)
    {
      id v19 = sub_1001BF7B8();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v20 = [v12 lastPathComponent];
        *(_DWORD *)buf = 138412546;
        id v45 = v11;
        __int16 v46 = 2112;
        id v47 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "STORING (unretained) %@ to %@: adding to storage", buf, 0x16u);
      }
    }
    unsigned __int8 v40 = a6;
    id v43 = 0;
    unsigned __int8 v21 = [v10 writeToURL:v12 options:1 error:&v43];
    id v22 = v43;
    id v23 = v22;
    if (v21)
    {
      id v18 = v22;
    }
    else
    {
      if (![(NSFileManager *)self->_fileManager cplIsFileDoesNotExistError:v22])
      {
        id v18 = v23;
        goto LABEL_35;
      }
      id v25 = [v12 URLByDeletingLastPathComponent];
      uint32_t v39 = v25;
      if (!_CPLSilentLogging)
      {
        BOOL v26 = sub_1001BF7B8();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          int v27 = [v25 path];
          *(_DWORD *)buf = 138412290;
          id v45 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Creating bucket at %@", buf, 0xCu);

          id v25 = v39;
        }
      }
      id v28 = self->_fileManager;
      id v42 = v23;
      unsigned __int8 v29 = [(NSFileManager *)v28 createDirectoryAtURL:v25 withIntermediateDirectories:1 attributes:0 error:&v42];
      id v18 = v42;

      if ((v29 & 1) == 0)
      {

        goto LABEL_35;
      }
      id v41 = v18;
      unsigned int v30 = [v10 writeToURL:v12 options:1 error:&v41];
      id v31 = v41;

      id v18 = v31;
      if (!v30)
      {
LABEL_35:
        if ([(NSFileManager *)self->_fileManager cplIsFileExistsError:v18])
        {
          if (!_CPLSilentLogging)
          {
            unsigned int v32 = sub_1001BF7B8();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v34 = [v12 path];
              *(_DWORD *)buf = 138412546;
              id v45 = v11;
              __int16 v46 = 2112;
              id v47 = v34;
              unsigned __int8 v35 = "Tried to store (unretained) %@ at %@ but file appeared miraculously!";
              v36 = v32;
              uint32_t v37 = 22;
LABEL_42:
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);

              goto LABEL_43;
            }
            goto LABEL_43;
          }
        }
        else if (!_CPLSilentLogging)
        {
          unsigned int v32 = sub_1001BF7B8();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v34 = [v12 path];
            *(_DWORD *)buf = 138412802;
            id v45 = v11;
            __int16 v46 = 2112;
            id v47 = v34;
            __int16 v48 = 2112;
            id v49 = v18;
            unsigned __int8 v35 = "Failed to store (unretained) %@ to %@: %@";
            v36 = v32;
            uint32_t v37 = 32;
            goto LABEL_42;
          }
LABEL_43:

          goto LABEL_44;
        }
        LOBYTE(v15) = 0;
        goto LABEL_44;
      }
    }
    if (v7) {
      id v24 = &unk_1002CE310;
    }
    else {
      id v24 = 0;
    }
    if ([(CPLBucketFileStorage *)self _setIsOriginal:v24 markedForDelete:&unk_1002CE310 onDestinationURL:v12 clearFlags:0 error:v40])
    {
      goto LABEL_20;
    }
    [(NSFileManager *)self->_fileManager removeItemAtURL:v12 error:0];
    goto LABEL_35;
  }
  if (v17)
  {
    unsigned int v32 = sub_1001BF7B8();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = [v12 lastPathComponent];
      *(_DWORD *)buf = 138412546;
      id v45 = v11;
      __int16 v46 = 2112;
      id v47 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "STORING (unretained) %@ to %@: already in storage", buf, 0x16u);
    }
    id v18 = 0;
    goto LABEL_43;
  }
  id v18 = 0;
LABEL_20:
  LOBYTE(v15) = 1;
LABEL_44:

  return v15;
}

- (BOOL)hasFileWithIdentity:(id)a3
{
  v3 = self;
  id v4 = [(CPLBucketFileStorage *)self _destinationURLForIdentity:a3];
  LOBYTE(v3) = [(NSFileManager *)v3->_fileManager cplFileExistsAtURL:v4];

  return (char)v3;
}

- (void)checkFileSizeForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLBucketFileStorage *)self _destinationURLForIdentity:v4];
  id v10 = 0;
  id v9 = 0;
  unsigned int v6 = [v5 getResourceValue:&v10 forKey:NSURLFileSizeKey error:&v9];
  BOOL v7 = v10;
  id v8 = v9;
  if (v6) {
    objc_msgSend(v4, "setFileSize:", objc_msgSend(v7, "unsignedIntegerValue"));
  }
}

- (id)retainFileURLForIdentity:(id)a3 resourceType:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [(CPLBucketFileStorage *)self _destinationURLForIdentity:v7];
  if ([(NSFileManager *)self->_fileManager cplFileExistsAtURL:v8])
  {
    if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
    {
      id v10 = sub_1001BF7B8();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v8 lastPathComponent];
        int v19 = 138412546;
        id v20 = v7;
        __int16 v21 = 2112;
        id v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "RETAINING %@ to %@", (uint8_t *)&v19, 0x16u);
      }
    }
    if (!self->_temporarilyRetainedURLsAtTheStartOfTransaction)
    {
      BOOL v12 = (NSCountedSet *)[(NSCountedSet *)self->_temporarilyRetainedURLs mutableCopy];
      temporarilyRetainedURLsAtTheStartOfTransaction = self->_temporarilyRetainedURLsAtTheStartOfTransaction;
      self->_temporarilyRetainedURLsAtTheStartOfTransaction = v12;
    }
    [(NSCountedSet *)self->_temporarilyRetainedURLs addObject:v8];
  }
  else
  {
    id v14 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v23 = NSFilePathErrorKey;
    unsigned int v15 = [v8 path];
    id v24 = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v17 = [v14 initWithDomain:NSCocoaErrorDomain code:4 userInfo:v16];

    if (a5) {
      *a5 = v17;
    }

    id v8 = 0;
  }

  return v8;
}

- (BOOL)releaseFileURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
  {
    id v7 = sub_1001BF7B8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 lastPathComponent];
      int v12 = 138412290;
      BOOL v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "RELEASING %@", (uint8_t *)&v12, 0xCu);
    }
  }
  if (!self->_temporarilyRetainedURLsAtTheStartOfTransaction)
  {
    id v9 = (NSCountedSet *)[(NSCountedSet *)self->_temporarilyRetainedURLs mutableCopy];
    temporarilyRetainedURLsAtTheStartOfTransaction = self->_temporarilyRetainedURLsAtTheStartOfTransaction;
    self->_temporarilyRetainedURLsAtTheStartOfTransaction = v9;
  }
  [(NSCountedSet *)self->_temporarilyRetainedURLs removeObject:v5];

  return 1;
}

- (BOOL)discardAllRetainedFileURLsWithError:(id *)a3
{
  if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
  {
    id v5 = sub_1001BF7B8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DISCARDING al retained resources", v9, 2u);
    }
  }
  if (!self->_temporarilyRetainedURLsAtTheStartOfTransaction)
  {
    unsigned int v6 = (NSCountedSet *)[(NSCountedSet *)self->_temporarilyRetainedURLs mutableCopy];
    temporarilyRetainedURLsAtTheStartOfTransaction = self->_temporarilyRetainedURLsAtTheStartOfTransaction;
    self->_temporarilyRetainedURLsAtTheStartOfTransaction = v6;
  }
  [(NSCountedSet *)self->_temporarilyRetainedURLs removeAllObjects];
  return 1;
}

- (BOOL)_markURLForDelete:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = open((const char *)[v5 fileSystemRepresentation], 0);
  if (v6 < 0)
  {
    if (*__error() == 2)
    {
      BOOL v10 = 1;
    }
    else if (a4)
    {
      +[CPLErrors posixErrorForURL:v5];
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    int v7 = v6;
    id v8 = v5;
    int v9 = fsetxattr(v7, "com.apple.cpl.delete", "Y", 1uLL, 0, 0);
    BOOL v10 = v9 == 0;
    if (a4 && v9)
    {
      +[CPLErrors posixErrorForURL:v8];
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    close(v7);
  }

  return v10;
}

- (BOOL)deleteFileWithIdentity:(id)a3 includingOriginal:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [(CPLBucketFileStorage *)self _destinationURLForIdentity:v7];
  if (([(NSCountedSet *)self->_temporarilyRetainedURLs containsObject:v8] & 1) == 0)
  {
    if (a4)
    {
      id v11 = 0;
    }
    else
    {
      buf[0] = 0;
      id v34 = 0;
      unsigned int v23 = [(CPLBucketFileStorage *)self _getIsOriginal:buf markedForDelete:0 forDestinationURL:v8 error:&v34];
      id v24 = v34;
      BOOL v10 = v24;
      if (!v23)
      {
        if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
        {
          id v17 = sub_1001BF7B8();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [v8 lastPathComponent];
            *(_DWORD *)buf = 138412546;
            id v36 = v7;
            __int16 v37 = 2112;
            unsigned __int8 v38 = v18;
            int v19 = "DELETING %@ from %@: ignoring";
            id v20 = v17;
            os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
            uint32_t v22 = 22;
            goto LABEL_46;
          }
LABEL_47:
          BOOL v29 = 1;
          goto LABEL_36;
        }
LABEL_41:
        BOOL v29 = 1;
        goto LABEL_43;
      }
      if (buf[0])
      {
        if (!self->_trackAllStoresAndDeletes || _CPLSilentLogging != 0) {
          goto LABEL_35;
        }
        BOOL v26 = sub_1001BF7B8();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = [v8 lastPathComponent];
          *(_DWORD *)buf = 138412546;
          id v36 = v7;
          __int16 v37 = 2112;
          unsigned __int8 v38 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "DELETING %@ from %@: mark for delete", buf, 0x16u);
        }
        goto LABEL_34;
      }
      id v11 = v24;
    }
    if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
    {
      BOOL v13 = sub_1001BF7B8();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v8 lastPathComponent];
        *(_DWORD *)buf = 138412546;
        id v36 = v7;
        __int16 v37 = 2112;
        unsigned __int8 v38 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "DELETING %@ from %@", buf, 0x16u);
      }
    }
    fileManager = self->_fileManager;
    unsigned int v32 = v11;
    unsigned __int8 v16 = [(NSFileManager *)fileManager removeItemAtURL:v8 error:&v32];
    BOOL v10 = v32;

    if ((v16 & 1) == 0)
    {
      if (![(NSFileManager *)self->_fileManager cplIsFileDoesNotExistError:v10])
      {
        BOOL v29 = 0;
        goto LABEL_43;
      }
      if (!_CPLSilentLogging)
      {
        id v17 = sub_1001BF7B8();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          id v18 = [v8 path];
          *(_DWORD *)buf = 138412290;
          id v36 = v18;
          int v19 = "Deleting %@ failed because the file was already gone";
          id v20 = v17;
          os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
          uint32_t v22 = 12;
LABEL_46:
          _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v22);

          goto LABEL_47;
        }
        goto LABEL_47;
      }
    }
    goto LABEL_41;
  }
  if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
  {
    BOOL v26 = sub_1001BF7B8();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [v8 lastPathComponent];
      *(_DWORD *)buf = 138412546;
      id v36 = v7;
      __int16 v37 = 2112;
      unsigned __int8 v38 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "DELETING %@ from %@: resource is retained", buf, 0x16u);
    }
    BOOL v10 = 0;
LABEL_34:

    goto LABEL_35;
  }
  BOOL v10 = 0;
LABEL_35:
  id v33 = v10;
  BOOL v29 = [(CPLBucketFileStorage *)self _markURLForDelete:v8 error:&v33];
  id v17 = v10;
  BOOL v10 = v33;
LABEL_36:

LABEL_43:
  return v29;
}

- (BOOL)markForDeleteFileWithIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLBucketFileStorage *)self _destinationURLForIdentity:v6];
  if (self->_trackAllStoresAndDeletes && _CPLSilentLogging == 0)
  {
    int v9 = sub_1001BF7B8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [v7 lastPathComponent];
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      unsigned __int8 v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MARKING FOR DELETE %@ from %@", (uint8_t *)&v13, 0x16u);
    }
  }
  BOOL v11 = [(CPLBucketFileStorage *)self _markURLForDelete:v7 error:a4];

  return v11;
}

- (id)fileEnumeratorIncludingPropertiesForKeys:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  fileManager = self->_fileManager;
  urlForFiles = self->_urlForFiles;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001C2308;
  v13[3] = &unk_10027FA68;
  id v14 = v6;
  id v9 = v6;
  BOOL v10 = [(NSFileManager *)fileManager enumeratorAtURL:urlForFiles includingPropertiesForKeys:a3 options:4 errorHandler:v13];
  BOOL v11 = [[CPLBucketFileStorageEnumerator alloc] initWithDirectoryEnumerator:v10];

  return v11;
}

- (BOOL)resetWithError:(id *)a3
{
  urlForFiles = self->_urlForFiles;
  id v6 = +[NSUUID UUID];
  id v7 = [v6 UUIDString];
  id v8 = [(NSURL *)urlForFiles URLByAppendingPathExtension:v7];

  if (!_CPLSilentLogging)
  {
    id v9 = sub_1001BF7B8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [(NSURL *)self->_urlForFiles path];
      BOOL v11 = [v8 path];
      *(_DWORD *)buf = 138412546;
      id v60 = v10;
      __int16 v61 = 2112;
      id v62 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Moving %@ to %@", buf, 0x16u);
    }
  }
  if ([(NSFileManager *)self->_fileManager moveItemAtURL:self->_urlForFiles toURL:v8 error:a3])
  {
    if (!_CPLSilentLogging)
    {
      int v12 = sub_1001BF7B8();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = [(NSURL *)self->_urlForFiles path];
        *(_DWORD *)buf = 138412290;
        id v60 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Recreating %@", buf, 0xCu);
      }
    }
    fileManager = self->_fileManager;
    __int16 v15 = self->_urlForFiles;
    id v57 = 0;
    unsigned __int8 v16 = [(NSFileManager *)fileManager createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v57];
    id v17 = v57;
    if (v16)
    {
      if (!_CPLSilentLogging)
      {
        id v18 = sub_1001BF7B8();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = [v8 path];
          *(_DWORD *)buf = 138412290;
          id v60 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Removing %@", buf, 0xCu);
        }
      }
      [(NSFileManager *)self->_fileManager setDelegate:self];
      id v20 = self->_fileManager;
      id v56 = 0;
      unsigned __int8 v21 = [(NSFileManager *)v20 removeItemAtURL:v8 error:&v56];
      id v22 = v56;
      if ((v21 & 1) == 0 && !_CPLSilentLogging)
      {
        unsigned int v23 = sub_1001BF7B8();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = [v8 path];
          *(_DWORD *)buf = 138412546;
          id v60 = v24;
          __int16 v61 = 2112;
          id v62 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to effectively remove %@: %@", buf, 0x16u);
        }
      }
      id v46 = v17;
      id v47 = v8;
      uint64_t v25 = [(NSURL *)self->_urlForFiles URLByDeletingLastPathComponent];
      BOOL v26 = [(NSURL *)self->_urlForFiles lastPathComponent];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      __int16 v48 = self;
      id v45 = (void *)v25;
      id obj = [(NSFileManager *)self->_fileManager enumeratorAtURL:v25 includingPropertiesForKeys:0 options:1 errorHandler:&stru_10027FAA8];
      id v27 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v53;
        do
        {
          unsigned int v30 = 0;
          id v49 = v28;
          do
          {
            if (*(void *)v53 != v29) {
              objc_enumerationMutation(obj);
            }
            id v31 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v30);
            unsigned int v32 = [v31 lastPathComponent];
            id v33 = [v32 pathExtension];
            id v34 = [v32 stringByDeletingPathExtension];
            if ([v33 length] && objc_msgSend(v34, "isEqualToString:", v26))
            {
              if (!_CPLSilentLogging)
              {
                unsigned __int8 v35 = sub_1001BF7B8();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v60 = v32;
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Found orphaned file cache to clean-up %@. Cleaning it up now", buf, 0xCu);
                }
              }
              uint64_t v36 = v29;
              __int16 v37 = v26;
              unsigned __int8 v38 = v48->_fileManager;
              id v51 = v22;
              unsigned __int8 v39 = [(NSFileManager *)v38 removeItemAtURL:v31 error:&v51];
              id v40 = v51;

              if ((v39 & 1) == 0 && !_CPLSilentLogging)
              {
                id v41 = sub_1001BF7B8();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  id v42 = [v31 path];
                  *(_DWORD *)buf = 138412546;
                  id v60 = v42;
                  __int16 v61 = 2112;
                  id v62 = v40;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to effectively remove %@: %@", buf, 0x16u);
                }
              }
              id v22 = v40;
              BOOL v26 = v37;
              uint64_t v29 = v36;
              id v28 = v49;
            }

            unsigned int v30 = (char *)v30 + 1;
          }
          while (v28 != v30);
          id v28 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
        }
        while (v28);
      }

      [(NSFileManager *)v48->_fileManager setDelegate:0];
      BOOL v43 = 1;
      id v17 = v46;
      id v8 = v47;
    }
    else if ([(NSFileManager *)self->_fileManager cplIsFileExistsError:v17])
    {
      BOOL v43 = 1;
    }
    else
    {
      BOOL v43 = 0;
      if (a3) {
        *a3 = v17;
      }
    }
  }
  else
  {
    BOOL v43 = 0;
  }

  return v43;
}

- (BOOL)fileManager:(id)a3 shouldRemoveItemAtURL:(id)a4
{
  id v4 = a4;
  id v11 = 0;
  unsigned int v5 = [v4 getResourceValue:&v11 forKey:NSURLIsDirectoryKey error:0];
  id v6 = v11;
  id v7 = v6;
  if (v5 && ([v6 BOOLValue] & 1) == 0 && !_CPLSilentLogging)
  {
    id v8 = sub_1001BF7B8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 lastPathComponent];
      *(_DWORD *)buf = 138412290;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleting %@", buf, 0xCu);
    }
  }

  return 1;
}

- (BOOL)fileManager:(id)a3 shouldProceedAfterError:(id)a4 removingItemAtURL:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  if (!_CPLSilentLogging)
  {
    id v8 = sub_1001BF7B8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v7 path];
      int v11 = 138412546;
      int v12 = v9;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", (uint8_t *)&v11, 0x16u);
    }
  }

  return 1;
}

- (void)writeTransactionDidFail
{
  temporarilyRetainedURLsAtTheStartOfTransaction = self->_temporarilyRetainedURLsAtTheStartOfTransaction;
  if (temporarilyRetainedURLsAtTheStartOfTransaction)
  {
    objc_storeStrong((id *)&self->_temporarilyRetainedURLs, temporarilyRetainedURLsAtTheStartOfTransaction);
    id v4 = self->_temporarilyRetainedURLsAtTheStartOfTransaction;
    self->_temporarilyRetainedURLsAtTheStartOfTransaction = 0;
  }
}

- (void)writeTransactionDidSucceed
{
  self->_temporarilyRetainedURLsAtTheStartOfTransaction = 0;
  _objc_release_x1();
}

- (BOOL)trackAllStoresAndDeletes
{
  return self->_trackAllStoresAndDeletes;
}

- (void)setTrackAllStoresAndDeletes:(BOOL)a3
{
  self->_trackAllStoresAndDeletes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporarilyRetainedURLsAtTheStartOfTransaction, 0);
  objc_storeStrong((id *)&self->_temporarilyRetainedURLs, 0);
  objc_storeStrong((id *)&self->_logDomain, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_urlForFiles, 0);
}

@end