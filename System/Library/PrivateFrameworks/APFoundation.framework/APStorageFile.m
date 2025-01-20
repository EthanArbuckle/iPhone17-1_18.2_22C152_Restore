@interface APStorageFile
+ (__sFILE)_constructFileForURL:(id)a3 forMode:(char *)a4 error:(id *)a5;
- (BOOL)addData:(id)a3 error:(id *)a4;
- (BOOL)addObject:(id)a3 error:(id *)a4;
- (BOOL)verbose;
- (NSString)loggablePath;
- (NSURL)fileURL;
- (__sFILE)fp;
- (id)_initForWritingFile:(__sFILE *)a3 forURL:(id)a4 loggablePath:(id)a5;
- (id)_initWithFile:(__sFILE *)a3 forURL:(id)a4 loggablePath:(id)a5;
- (id)allObjects;
- (id)initForAppendingAtURL:(id)a3;
- (id)initForMode:(int64_t)a3 atURL:(id)a4;
- (id)initForReadingAtURL:(id)a3;
- (id)initForWritingAtURL:(id)a3;
- (id)nextObject;
- (id)nextObjectData;
- (void)_removeCorruptedFile:(id)a3;
- (void)close;
- (void)dealloc;
- (void)setFp:(__sFILE *)a3;
@end

@implementation APStorageFile

- (id)initForWritingAtURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 safePath];
  v6 = [v4 URLByDeletingLastPathComponent];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v14 = 0;
  [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v8 = v14;

  if (!v8)
  {
    id v13 = 0;
    v10 = +[APStorageFile _constructFileForURL:v4 forMode:"w" error:&v13];
    id v8 = v13;
    if (v10)
    {
      self = (APStorageFile *)[(APStorageFile *)self _initForWritingFile:v10 forURL:v4 loggablePath:v5];
      v9 = self;
      goto LABEL_5;
    }
    v12 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740227;
      v16 = v5;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_ERROR, "ERROR: Unable to open file(%{sensitive}@): %{public}@", buf, 0x16u);
    }
  }
  v9 = 0;
LABEL_5:

  return v9;
}

- (id)_initForWritingFile:(__sFILE *)a3 forURL:(id)a4 loggablePath:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)APStorageFile;
  v11 = [(APStorageFile *)&v14 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_fp = a3;
    objc_storeStrong((id *)&v11->_fileURL, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (id)initForAppendingAtURL:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 safePath];
  id v7 = [v5 URLByDeletingLastPathComponent];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v24 = 0;
  [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v24];
  id v9 = v24;

  if (v9)
  {
    id v10 = APLogForCategory(0x2EuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_4:

      v11 = 0;
      goto LABEL_5;
    }
LABEL_3:
    *(_DWORD *)buf = 138740227;
    v28 = v6;
    __int16 v29 = 2114;
    uint64_t v30 = (uint64_t)v9;
    _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_ERROR, "ERROR: Unable to open file(%{sensitive}@): %{public}@", buf, 0x16u);
    goto LABEL_4;
  }
  id v23 = 0;
  id v13 = +[APStorageFile _constructFileForURL:v5 forMode:"a+" error:&v23];
  id v9 = v23;
  if (!v13)
  {
    id v10 = APLogForCategory(0x2EuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (fseek(v13, 0, 2))
  {
    objc_super v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = kSFSFileInconsistencyError;
    v25 = @"reason";
    v26 = @"Could not seek to end of file.";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v17 = [v14 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v15 userInfo:v16];

    id v18 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740227;
      v28 = v6;
      __int16 v29 = 2114;
      uint64_t v30 = v17;
      _os_log_impl(&dword_1D70B2000, v18, OS_LOG_TYPE_ERROR, "ERROR: Could not initialize file(%{sensitive}@) for appending: %{public}@", buf, 0x16u);
    }

    fclose(v13);
    v11 = 0;
    id v9 = (id)v17;
  }
  else
  {
    if (MEMORY[0x1D9469A60](v13))
    {
      v22.receiver = self;
      v22.super_class = (Class)APStorageFile;
      uint64_t v19 = [(APStorageFile *)&v22 init];
      p_isa = (id *)&v19->super.isa;
      if (v19)
      {
        v19->_fp = v13;
        objc_storeStrong((id *)&v19->_fileURL, a3);
        objc_storeStrong(p_isa + 3, v6);
      }
      v21 = p_isa;
    }
    else
    {
      v21 = (APStorageFile *)[(APStorageFile *)self _initForWritingFile:v13 forURL:v5 loggablePath:v6];
    }
    self = v21;
    v11 = v21;
  }
LABEL_5:

  return v11;
}

- (id)initForReadingAtURL:(id)a3
{
  id v5 = a3;
  v6 = [v5 safePath];
  id v14 = 0;
  id v7 = +[APStorageFile _constructFileForURL:v5 forMode:"r" error:&v14];
  id v8 = v14;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)APStorageFile;
    id v9 = [(APStorageFile *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      v9->_fp = v7;
      objc_storeStrong((id *)&v9->_fileURL, a3);
      objc_storeStrong(p_isa + 3, v6);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)initForMode:(int64_t)a3 atURL:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 'a':
      id v7 = [(APStorageFile *)self initForAppendingAtURL:v6];
      goto LABEL_7;
    case 'w':
      id v7 = [(APStorageFile *)self initForWritingAtURL:v6];
      goto LABEL_7;
    case 'r':
      id v7 = [(APStorageFile *)self initForReadingAtURL:v6];
LABEL_7:
      self = (APStorageFile *)v7;
      break;
  }

  return self;
}

- (id)_initWithFile:(__sFILE *)a3 forURL:(id)a4 loggablePath:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)APStorageFile;
  v11 = [(APStorageFile *)&v14 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_fp = a3;
    objc_storeStrong((id *)&v11->_fileURL, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (BOOL)addObject:(id)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
  if (v6) {
    BOOL v7 = [(APStorageFile *)self addData:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)allObjects
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = (void *)MEMORY[0x1D9469B60]();
  uint64_t v5 = [(APStorageFile *)self nextObject];
  if (v5)
  {
    id v6 = (void *)v5;
    do
    {
      [v3 addObject:v6];
      id v4 = (void *)MEMORY[0x1D9469B60]();
      uint64_t v7 = [(APStorageFile *)self nextObject];

      id v6 = (void *)v7;
    }
    while (v7);
  }
  id v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return v8;
}

- (id)nextObject
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(APStorageFile *)self nextObjectData];
  if (v3)
  {
    id v4 = +[APSupportedSecureEncodedClass classes];
    id v18 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v4 fromData:v3 error:&v18];
    id v6 = v18;
    if (v6)
    {
      uint64_t v7 = APLogForCategory(0x2EuLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        loggablePath = self->_loggablePath;
        *(_DWORD *)buf = 138478339;
        objc_super v22 = v9;
        __int16 v23 = 2117;
        id v24 = loggablePath;
        __int16 v25 = 2114;
        id v26 = v6;
        _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "[%{private}@] Error occurred getting nextObject for file(%{sensitive}@):%{public}@", buf, 0x20u);
      }
      [(APStorageFile *)self _removeCorruptedFile:v6];
      v19[0] = @"storage_error";
      uint64_t v11 = [v6 debugDescription];
      v12 = (void *)v11;
      objc_super v13 = @"nil";
      if (v11) {
        objc_super v14 = (__CFString *)v11;
      }
      else {
        objc_super v14 = @"nil";
      }
      v19[1] = @"storage_path";
      v20[0] = v14;
      if (self->_loggablePath) {
        objc_super v13 = (__CFString *)self->_loggablePath;
      }
      v20[1] = v13;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

      CreateDiagnosticReport(@"Error occurred getting nextObject for file", v15, @"Storage File");
      id v16 = 0;
    }
    else
    {
      id v16 = v5;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (BOOL)addData:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [v6 length];
  unint64_t v8 = v7;
  if (v7 <= 0x10000)
  {
    if (!v7)
    {
LABEL_11:
      LOBYTE(a4) = 1;
      goto LABEL_19;
    }
  }
  else
  {
    id v9 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      size_t v27 = v8;
      __int16 v28 = 1024;
      int v29 = 0x10000;
      _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_ERROR, "EFS size warning: The data of length(%lu) is larger than %d.", buf, 0x12u);
    }
  }
  int __ptr = [v6 length];
  if (fwrite(&__ptr, 4uLL, 1uLL, self->_fp) == 1)
  {
    id v10 = v6;
    size_t v11 = fwrite((const void *)[v10 bytes], 1uLL, objc_msgSend(v10, "length"), self->_fp);
    v12 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      size_t v27 = v11;
      _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_DEBUG, "bytesWritten = %zu", buf, 0xCu);
    }

    if (v11 == [v10 length])
    {
      fflush(self->_fp);
      goto LABEL_11;
    }
    if (!a4) {
      goto LABEL_19;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = kSFSFileInconsistencyError;
    objc_super v22 = @"reason";
    __int16 v23 = @"Bytes written did not match expectation for encrypted data.";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    *a4 = [v17 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v18 userInfo:v19];

    +[APStorageManager sendAnalyticError:@"Failed" domain:@"SFS" code:16104];
LABEL_18:
    LOBYTE(a4) = 0;
    goto LABEL_19;
  }
  objc_super v13 = APLogForCategory(0x2EuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D70B2000, v13, OS_LOG_TYPE_ERROR, "Can't write header for data object", buf, 2u);
  }

  if (a4)
  {
    objc_super v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = kSFSWritingToFileError;
    id v24 = @"reason";
    __int16 v25 = @"Couldn't write header for data object.";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    *a4 = [v14 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v15 userInfo:v16];

    goto LABEL_18;
  }
LABEL_19:

  return (char)a4;
}

- (id)nextObjectData
{
  v58[2] = *MEMORY[0x1E4F143B8];
  if (![(APStorageFile *)self fp])
  {
    id v9 = 0;
    goto LABEL_19;
  }
  unsigned int __ptr = 0;
  size_t v3 = fread(&__ptr, 4uLL, 1uLL, self->_fp);
  uint64_t v4 = *__error();
  if (feof(self->_fp))
  {
    uint64_t v5 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = (objc_class *)objc_opt_class();
      unint64_t v7 = NSStringFromClass(v6);
      loggablePath = self->_loggablePath;
      *(_DWORD *)buf = 138478083;
      v50 = v7;
      __int16 v51 = 2117;
      v52 = loggablePath;
      _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "[%{private}@] Reached End of File for file(%{sensitive}@)", buf, 0x16u);
    }
    goto LABEL_17;
  }
  if (v3 != 1)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = kSFSFileInconsistencyError;
    v58[0] = @"Could not read item header.";
    v57[0] = @"reason";
    v57[1] = @"code";
    v21 = [NSNumber numberWithInt:v4];
    v58[1] = v21;
    objc_super v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
    uint64_t v5 = [v19 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v20 userInfo:v22];

    __int16 v23 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = (objc_class *)objc_opt_class();
      __int16 v25 = NSStringFromClass(v24);
      id v26 = self->_loggablePath;
      *(_DWORD *)buf = 138478339;
      v50 = v25;
      __int16 v51 = 2117;
      v52 = v26;
      __int16 v53 = 2112;
      v54 = v5;
      _os_log_impl(&dword_1D70B2000, v23, OS_LOG_TYPE_ERROR, "[%{private}@] Read error occurred getting nextObjectData for file(%{sensitive}@):\n%@", buf, 0x20u);
    }
    +[APStorageManager sendAnalyticError:@"Failed" domain:@"SFS" code:16105];
    goto LABEL_16;
  }
  unint64_t v10 = __ptr;
  if (__ptr > 0x40000)
  {
    size_t v11 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v50) = v10;
      _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_ERROR, "data appears to be corrupt, data.length(%d) is too big.  We are aborting reading file data.", buf, 8u);
    }

    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = kSFSFileInconsistencyError;
    v55 = @"reason";
    v56 = @"Data is larger than intended for read.";
    objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    uint64_t v5 = [v12 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v13 userInfo:v14];

    uint64_t v15 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      uint64_t v18 = self->_loggablePath;
      *(_DWORD *)buf = 138478339;
      v50 = v17;
      __int16 v51 = 2117;
      v52 = v18;
      __int16 v53 = 2114;
      v54 = v5;
      _os_log_impl(&dword_1D70B2000, v15, OS_LOG_TYPE_ERROR, "[%{private}@] Header error occurred getting nextObjectData for file(%{sensitive}@):\n%{public}@", buf, 0x20u);
    }
LABEL_16:
    [(APStorageFile *)self _removeCorruptedFile:v5];
    goto LABEL_17;
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:__ptr];
  unint64_t v28 = 0;
  if (v10)
  {
    while (1)
    {
      int v29 = (void *)MEMORY[0x1D9469B60]();
      size_t v30 = v10 - v28 >= 0x40 ? 64 : v10 - v28;
      size_t v31 = fread(buf, 1uLL, v30, self->_fp);
      if (v31 != v30) {
        break;
      }
      v32 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:buf length:v30 freeWhenDone:0];
      [v5 appendData:v32];
      uint64_t v33 = [v32 length];

      v28 += v33;
      if (v28 >= v10) {
        goto LABEL_30;
      }
    }
    v28 += v31;
  }
LABEL_30:
  if (v28 == v10)
  {
    id v9 = v5;
    goto LABEL_18;
  }
  v34 = objc_msgSend(NSString, "stringWithFormat:", @"The data is wrong length(%lu) not (%lu).", -[NSObject length](v5, "length"), v10);
  v35 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v36 = kSFSFileInconsistencyError;
  v47 = @"reason";
  v48 = v34;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  v38 = [v35 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v36 userInfo:v37];

  v39 = APLogForCategory(0x2EuLL);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    v40 = (objc_class *)objc_opt_class();
    v41 = NSStringFromClass(v40);
    *(_DWORD *)v43 = 138478083;
    v44 = v41;
    __int16 v45 = 2114;
    v46 = v38;
    _os_log_impl(&dword_1D70B2000, v39, OS_LOG_TYPE_ERROR, "[%{private}@] %{public}@", v43, 0x16u);
  }
  [(APStorageFile *)self _removeCorruptedFile:v38];

LABEL_17:
  id v9 = 0;
LABEL_18:

LABEL_19:
  return v9;
}

- (void)close
{
  fp = self->_fp;
  if (fp)
  {
    fclose(fp);
    self->_fp = 0;
  }
}

+ (__sFILE)_constructFileForURL:(id)a3 forMode:(char *)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = fopen((const char *)[a3 fileSystemRepresentation], a4);
  unint64_t v7 = v6;
  if (a5 && !v6)
  {
    unint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = kSFSInvalidPathError;
    v12 = @"reason";
    v13[0] = @"Invalid path for SFS.";
    unint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a5 = [v8 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v9 userInfo:v10];
  }
  return v7;
}

- (void)_removeCorruptedFile:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = APLogForCategory(0x2EuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    loggablePath = self->_loggablePath;
    *(_DWORD *)buf = 138478083;
    uint64_t v17 = v6;
    __int16 v18 = 2117;
    uint64_t v19 = loggablePath;
    _os_log_impl(&dword_1D70B2000, v4, OS_LOG_TYPE_ERROR, "[%{private}@] Removing corrupted file at path: %{sensitive}@", buf, 0x16u);
  }
  [(APStorageFile *)self close];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  fileURL = self->_fileURL;
  id v15 = 0;
  [v8 removeItemAtURL:fileURL error:&v15];
  id v10 = v15;

  if (v10)
  {
    size_t v11 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      objc_super v14 = self->_loggablePath;
      *(_DWORD *)buf = 138478339;
      uint64_t v17 = v13;
      __int16 v18 = 2117;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to remove file(%{sensitive}@):\n%{public}@", buf, 0x20u);
    }
  }
  +[APStorageManager sendAnalyticError:@"Failed" domain:@"SFS" code:16106];
}

- (void)dealloc
{
  [(APStorageFile *)self close];
  v3.receiver = self;
  v3.super_class = (Class)APStorageFile;
  [(APStorageFile *)&v3 dealloc];
}

- (__sFILE)fp
{
  return self->_fp;
}

- (void)setFp:(__sFILE *)a3
{
  self->_fp = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (NSString)loggablePath
{
  return self->_loggablePath;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_loggablePath, 0);
}

@end