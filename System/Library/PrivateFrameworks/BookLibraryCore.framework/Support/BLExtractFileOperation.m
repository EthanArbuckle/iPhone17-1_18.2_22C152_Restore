@interface BLExtractFileOperation
- (BLBookInstallInfo)installInfo;
- (BLExtractFileOperation)initWithSoucePath:(id)a3 destinationPath:(id)a4 fileAttributes:(id)a5 installInfo:(id)a6;
- (BLOperationProgress)progress;
- (BOOL)_applyFileAttributesToDirectory:(id)a3 error:(id *)a4;
- (BOOL)_performExtraction:(id *)a3;
- (BOOL)success;
- (BUFileCopier)copier;
- (NSDictionary)fileAttributes;
- (NSError)error;
- (NSString)description;
- (NSString)destinationFilePath;
- (NSString)sourceFilePath;
- (void)_initializeProgress;
- (void)_updateProgressWithByteCount:(int64_t)a3;
- (void)didCopyItemToURL:(id)a3 fileSize:(unint64_t)a4;
- (void)main;
- (void)setCopier:(id)a3;
- (void)setDestinationFilePath:(id)a3;
- (void)setError:(id)a3;
- (void)setFileAttributes:(id)a3;
- (void)setInstallInfo:(id)a3;
- (void)setProgress:(id)a3;
- (void)setSourceFilePath:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation BLExtractFileOperation

- (BLExtractFileOperation)initWithSoucePath:(id)a3 destinationPath:(id)a4 fileAttributes:(id)a5 installInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BLExtractFileOperation;
  v15 = [(BLExtractFileOperation *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sourceFilePath, a3);
    objc_storeStrong((id *)&v16->_destinationFilePath, a4);
    objc_storeStrong((id *)&v16->_fileAttributes, a5);
    objc_storeWeak((id *)&v16->_installInfo, v14);
    v17 = objc_alloc_init(BLOperationProgress);
    progress = v16->_progress;
    v16->_progress = v17;
  }
  return v16;
}

- (void)main
{
  [(BLExtractFileOperation *)self _initializeProgress];
  v3 = [(BLExtractFileOperation *)self sourceFilePath];
  if (![v3 length])
  {

    goto LABEL_6;
  }
  v4 = [(BLExtractFileOperation *)self destinationFilePath];
  id v5 = [v4 length];

  if (!v5)
  {
LABEL_6:
    sub_10004B6AC(7, @"Unable to extract", @"Missing either source or destination path.");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v6 = 0;
    goto LABEL_7;
  }
  id v9 = 0;
  BOOL v6 = [(BLExtractFileOperation *)self _performExtraction:&v9];
  id v7 = v9;
  if (v6)
  {
    v8 = [(BLExtractFileOperation *)self destinationFilePath];
    [(BLExtractFileOperation *)self _applyFileAttributesToDirectory:v8 error:0];

    BOOL v6 = 1;
  }
LABEL_7:
  [(BLExtractFileOperation *)self setError:v7];
  [(BLExtractFileOperation *)self setSuccess:v6];
}

- (BOOL)_applyFileAttributesToDirectory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = BLBookInstallLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    buf.st_dev = 138412290;
    *(void *)&buf.st_mode = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[Install-ExtractFile-Op]: Fixing file permissions for %@", (uint8_t *)&buf, 0xCu);
  }

  id v43 = 0;
  id v36 = objc_alloc_init((Class)NSFileManager);
  v8 = [v36 subpathsOfDirectoryAtPath:v6 error:&v43];
  id v9 = (char *)v43;
  if (v8)
  {
    v10 = [(BLExtractFileOperation *)self fileAttributes];
    id v11 = [v10 mutableCopy];

    id v35 = v11;
    if (!v11) {
      id v35 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v32 = v8;
    v33 = a4;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v12 = v8;
    id v37 = [v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v37)
    {
      uint64_t v13 = *(void *)v40;
      unsigned __int8 v14 = 1;
      uint64_t v34 = *(void *)v40;
LABEL_8:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v39 + 1) + 8 * v15);
        id v18 = [v6 stringByAppendingPathComponent:v16];
        v19 = (const char *)[v18 fileSystemRepresentation];
        if (v19)
        {
          memset(&buf, 0, sizeof(buf));
          if (stat(v19, &buf))
          {
            objc_super v20 = BLBookInstallLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = __error();
              v22 = strerror(*v21);
              *(_DWORD *)v44 = 138412546;
              id v45 = v18;
              __int16 v46 = 2080;
              v47 = v22;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[Install-ExtractFile-Op]: Could not stat %@: %s", v44, 0x16u);
            }

            v23 = (char *)[objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
            unsigned __int8 v14 = 0;
          }
          else
          {
            id v24 = v12;
            id v25 = v6;
            id v26 = objc_alloc((Class)NSNumber);
            v27 = (char *)[v26 initWithShort:(__int16)buf.st_mode | 0x1B0u];
            [v35 setObject:v27 forKey:NSFilePosixPermissions];

            id v38 = 0;
            unsigned __int8 v14 = [v36 setAttributes:v35 ofItemAtPath:v18 error:&v38];
            v23 = (char *)v38;
            if ((v14 & 1) == 0)
            {
              v28 = BLBookInstallLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v44 = 138412546;
                id v45 = v18;
                __int16 v46 = 2112;
                v47 = v23;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "[Install-ExtractFile-Op]: Could not set file attributes for file: %@, error:  %@", v44, 0x16u);
              }
            }
            id v9 = v27;
            id v6 = v25;
            id v12 = v24;
            uint64_t v13 = v34;
          }

          id v9 = v23;
        }

        if ((v14 & 1) == 0) {
          break;
        }
        if (v37 == (id)++v15)
        {
          id v37 = [v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (v37) {
            goto LABEL_8;
          }
          break;
        }
      }
    }
    else
    {
      unsigned __int8 v14 = 1;
    }

    BOOL v30 = v14 & 1;
    v8 = v32;
    a4 = v33;
    if (v33) {
      goto LABEL_32;
    }
  }
  else
  {
    v29 = BLBookInstallLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 138412546;
      *(void *)&buf.st_mode = v6;
      WORD2(buf.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[Install-ExtractFile-Op]: Could not get sub-paths of %@:  %@", (uint8_t *)&buf, 0x16u);
    }

    BOOL v30 = 0;
    if (a4) {
LABEL_32:
    }
      *a4 = v9;
  }

  return v30;
}

- (void)_initializeProgress
{
  uint64_t v12 = 0;
  v3 = [(BLExtractFileOperation *)self sourceFilePath];
  v4 = +[NSURL fileURLWithPath:v3];

  id v11 = 0;
  id v5 = [objc_alloc((Class)BUUnarchivingFileCopier) initWithURL:v4 options:4 error:&v11];
  id v6 = v11;
  [(BLExtractFileOperation *)self setCopier:v5];

  id v7 = [(BLExtractFileOperation *)self copier];
  [v7 setDelegate:self];

  if (v6)
  {
    v8 = BLBookInstallLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 141558530;
      uint64_t v14 = 1752392040;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error initializing unarchiving copier. sourceURL: %{mask.hash}@, error:  %@", buf, 0x20u);
    }
  }
  else
  {
    id v9 = [(BLExtractFileOperation *)self copier];
    [v9 countTotalFileSize:&v12 totalFileCount:0];

    v10 = BLBookInstallLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)stat buf = 134217984;
      uint64_t v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[Install-ExtractFile-Op]: Preparing to uncompress to total file size: %llu", buf, 0xCu);
    }

    [(BLOperationProgress *)self->_progress setUnits:1];
    [(BLOperationProgress *)self->_progress setMaxValue:v12];
    [(BLOperationProgress *)self->_progress resetSnapshots];
    self->_lastSnapshotTime = -1.79769313e308;
    [(BLExtractFileOperation *)self _updateProgressWithByteCount:0];
  }
}

- (void)didCopyItemToURL:(id)a3 fileSize:(unint64_t)a4
{
}

- (BOOL)_performExtraction:(id *)a3
{
  id v5 = [(BLExtractFileOperation *)self sourceFilePath];
  id v6 = +[NSURL fileURLWithPath:v5];

  id v7 = [(BLExtractFileOperation *)self destinationFilePath];
  v8 = +[NSURL fileURLWithPath:v7];

  id v9 = BLBookInstallLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [v6 path];
    id v11 = [v8 path];
    *(_DWORD *)stat buf = 141558786;
    uint64_t v21 = 1752392040;
    __int16 v22 = 2112;
    v23 = v10;
    __int16 v24 = 2160;
    uint64_t v25 = 1752392040;
    __int16 v26 = 2112;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[Install-ExtractFile-Op]: Extracting %{mask.hash}@ to %{mask.hash}@", buf, 0x2Au);
  }
  uint64_t v12 = [(BLExtractFileOperation *)self copier];
  uint64_t v13 = v12;
  if (v12)
  {
    id v19 = 0;
    unsigned __int8 v14 = [v12 copyToURL:v8 error:&v19];
    id v15 = v19;
    if (v14)
    {
      BOOL v16 = 1;
      if (!a3) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v15 = 0;
  }
  __int16 v17 = BLBookInstallLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 138412290;
    uint64_t v21 = (uint64_t)v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[Install-ExtractFile-Op]: Extraction failed with error:  %@", buf, 0xCu);
  }

  BOOL v16 = 0;
  if (a3) {
LABEL_11:
  }
    *a3 = v15;
LABEL_12:

  return v16;
}

- (void)_updateProgressWithByteCount:(int64_t)a3
{
  int64_t v5 = [(BLOperationProgress *)self->_progress currentValue];
  int64_t v6 = v5 + a3;
  int64_t v7 = [(BLOperationProgress *)self->_progress maxValue];
  if (v6 >= v7) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = v6;
  }
  if (v8 != v5) {
    -[BLOperationProgress setCurrentValue:](self->_progress, "setCurrentValue:");
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v10 = *(double *)&qword_1001C7640 + self->_lastSnapshotTime;
  if (v10 < Current)
  {
    [(BLOperationProgress *)self->_progress snapshot];
    id v12 = [(BLExtractFileOperation *)self installInfo];
    id v11 = [v12 progressDelegate];
    [v11 operation:self updatedProgress:self->_progress forInstall:v12];

    self->_lastSnapshotTime = Current;
  }
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@(%p)>\n_destinationFilePath = %@;\n_sourceFilePath = %@;\n_fileAttributes = %@;",
    v4,
    self,
    self->_destinationFilePath,
    self->_sourceFilePath,
  int64_t v5 = self->_fileAttributes);

  return (NSString *)v5;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSString)destinationFilePath
{
  return self->_destinationFilePath;
}

- (void)setDestinationFilePath:(id)a3
{
}

- (NSDictionary)fileAttributes
{
  return self->_fileAttributes;
}

- (void)setFileAttributes:(id)a3
{
}

- (NSString)sourceFilePath
{
  return self->_sourceFilePath;
}

- (void)setSourceFilePath:(id)a3
{
}

- (BUFileCopier)copier
{
  return self->_copier;
}

- (void)setCopier:(id)a3
{
}

- (BLOperationProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (BLBookInstallInfo)installInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_installInfo);

  return (BLBookInstallInfo *)WeakRetained;
}

- (void)setInstallInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_installInfo);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_copier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_sourceFilePath, 0);
  objc_storeStrong((id *)&self->_fileAttributes, 0);

  objc_storeStrong((id *)&self->_destinationFilePath, 0);
}

@end