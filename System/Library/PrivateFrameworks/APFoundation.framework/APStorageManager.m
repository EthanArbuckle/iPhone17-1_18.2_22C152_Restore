@interface APStorageManager
+ (BOOL)_removeStorageForSubdirectory:(id)a3;
+ (BOOL)areThereStoredItems;
+ (BOOL)removeStorage;
+ (id)_applicationSupportSubdirectory:(id)a3;
+ (id)_rootSubdirectory;
+ (id)_validatedPath:(id)a3 error:(id *)a4;
+ (void)cleanupOldStorage;
+ (void)sendAnalyticError:(id)a3 domain:(id)a4 code:(int64_t)a5;
+ (void)setRootPath:(id)a3;
- (APStorageManager)init;
- (APStorageManager)initWithPathPrefix:(id)a3;
- (APStorageManager)initWithPathPrefix:(id)a3 rootPath:(id)a4;
- (BOOL)_createDirectoriesForURL:(id)a3 error:(id *)a4;
- (BOOL)_fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4 error:(id *)a5;
- (BOOL)directoryExistsAtPath:(id)a3 error:(id *)a4;
- (BOOL)fileExistsAtPath:(id)a3 error:(id *)a4;
- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)removeObjectAtPath:(id)a3 error:(id *)a4;
- (BOOL)storeData:(id)a3 atPath:(id)a4 error:(id *)a5;
- (BOOL)storeObject:(id)a3 atPath:(id)a4 error:(id *)a5;
- (BOOL)touchFileAtPath:(id)a3 error:(id *)a4;
- (Class)_classForEncryptedFile;
- (NSFileManager)fileManager;
- (NSString)pathPrefix;
- (NSString)rootPath;
- (id)_makeApplicationSupportSubdirectory:(id)a3;
- (id)_rootURL;
- (id)_validatedFullPathForPath:(id)a3 error:(id *)a4;
- (id)_validatedFullURLForPath:(id)a3 error:(id *)a4;
- (id)_validatedPath:(id)a3 error:(id *)a4;
- (id)addedToDirectoryDateForFileAtPath:(id)a3 error:(id *)a4;
- (id)contentsOfDirectoryAtPath:(id)a3 error:(id *)a4;
- (id)createdDateForFileAtPath:(id)a3 error:(id *)a4;
- (id)dataStoredAtPath:(id)a3 error:(id *)a4;
- (id)fileAtKeyPath:(id)a3 forMode:(int64_t)a4 error:(id *)a5;
- (id)fileForAppendingAtKeyPath:(id)a3 error:(id *)a4;
- (id)fileForReadingAtKeyPath:(id)a3 error:(id *)a4;
- (id)fileForWritingAtKeyPath:(id)a3 error:(id *)a4;
- (id)iterateObjectsIncludingFolders:(BOOL)a3;
- (id)lastModifiedDateForFileAtPath:(id)a3 error:(id *)a4;
- (id)objectStoredAtPath:(id)a3 error:(id *)a4;
- (id)subpathsOfDirectoryAtPath:(id)a3 error:(id *)a4;
- (void)_initWithPathPrefix:(id)a3 rootPath:(id)a4;
- (void)_initWithSubdirectory:(id)a3;
- (void)dfsWithStartPath:(id)a3 nodeCallback:(id)a4;
- (void)getStorageSize:(unint64_t *)a3 allocatedSize:(unint64_t *)a4 files:(unint64_t *)a5;
- (void)setFileManager:(id)a3;
- (void)setPathPrefix:(id)a3;
@end

@implementation APStorageManager

+ (void)cleanupOldStorage
{
  v2 = +[APStorageManager _applicationSupportSubdirectory:@"EFS"];
  v3 = [v2 path];

  char v7 = 0;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v7];

  if (v5) {
    BOOL v6 = v7 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    +[APStorageManager _removeStorageForSubdirectory:@"EFS"];
  }
}

- (APStorageManager)init
{
  v3 = +[APStorageManager _rootSubdirectory];
  v7.receiver = self;
  v7.super_class = (Class)APStorageManager;
  v4 = [(APStorageManager *)&v7 init];
  int v5 = v4;
  if (v4) {
    [(APStorageManager *)v4 _initWithSubdirectory:v3];
  }

  return v5;
}

- (void)_initWithSubdirectory:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28CB8];
  id v5 = a3;
  BOOL v6 = (NSFileManager *)objc_alloc_init(v4);
  fileManager = self->_fileManager;
  self->_fileManager = v6;

  v8 = [(APStorageManager *)self _makeApplicationSupportSubdirectory:v5];

  rootPath = self->_rootPath;
  self->_rootPath = v8;
}

- (APStorageManager)initWithPathPrefix:(id)a3
{
  return (APStorageManager *)MEMORY[0x1F4181798](self, sel_initWithPathPrefix_rootPath_);
}

- (APStorageManager)initWithPathPrefix:(id)a3 rootPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[APStorageManager _rootSubdirectory];
  v12.receiver = self;
  v12.super_class = (Class)APStorageManager;
  v9 = [(APStorageManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(APStorageManager *)v9 _initWithSubdirectory:v8];
    [(APStorageManager *)v10 _initWithPathPrefix:v6 rootPath:v7];
  }

  return v10;
}

- (void)_initWithPathPrefix:(id)a3 rootPath:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  v8 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
  fileManager = self->_fileManager;
  self->_fileManager = v8;

  objc_storeStrong((id *)&self->_pathPrefix, a3);
  uint64_t v10 = [v7 length];
  v11 = v7;
  if (!v10)
  {
    if (![(id)qword_1EA81B910 length]) {
      goto LABEL_5;
    }
    v11 = (void *)qword_1EA81B910;
  }
  objc_super v12 = v11;
  rootPath = self->_rootPath;
  self->_rootPath = v12;

LABEL_5:
}

- (BOOL)storeObject:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a5];
  if (v9) {
    BOOL v10 = [(APStorageManager *)self storeData:v9 atPath:v8 error:a5];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)objectStoredAtPath:(id)a3 error:(id *)a4
{
  id v5 = -[APStorageManager dataStoredAtPath:error:](self, "dataStoredAtPath:error:", a3);
  if (v5)
  {
    id v6 = +[APSupportedSecureEncodedClass classes];
    id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v5 error:a4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)storeData:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(APStorageManager *)self fileForWritingAtKeyPath:a4 error:a5];
  BOOL v10 = v9;
  if (v9)
  {
    char v11 = [v9 addData:v8 error:a5];
    [v10 close];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)dataStoredAtPath:(id)a3 error:(id *)a4
{
  id v5 = -[APStorageManager fileForReadingAtKeyPath:error:](self, "fileForReadingAtKeyPath:error:", a3);
  id v6 = v5;
  if (a4)
  {
    if (*a4) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v5 == 0;
    }
    if (!v7) {
      goto LABEL_9;
    }
LABEL_7:
    id v8 = 0;
    goto LABEL_10;
  }
  if (!v5) {
    goto LABEL_7;
  }
LABEL_9:
  id v8 = [v5 nextObjectData];
  [v6 close];
LABEL_10:

  return v8;
}

- (Class)_classForEncryptedFile
{
  return (Class)objc_opt_class();
}

- (BOOL)fileExistsAtPath:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned __int8 v13 = 0;
  BOOL v7 = [(APStorageManager *)self _fileExistsAtPath:v6 isDirectory:&v13 error:a4];
  int v8 = v13;
  if (v7 && a4 && v13)
  {
    if (*a4)
    {
      int v8 = 1;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      id v14 = @"reason";
      BOOL v10 = [NSString stringWithFormat:@"A directory exists at the path (%@)!", v6];
      v15[0] = v10;
      char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      *a4 = [v9 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:1025 userInfo:v11];

      int v8 = v13;
    }
  }
  if (v8) {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (id)_rootSubdirectory
{
  return @"SFS";
}

- (BOOL)directoryExistsAtPath:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned __int8 v14 = 0;
  BOOL v7 = [(APStorageManager *)self _fileExistsAtPath:v6 isDirectory:&v14 error:a4];
  int v8 = v14;
  if (v7 && a4 && !v14)
  {
    if (*a4)
    {
      int v8 = 0;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = kSFSErrorDeterminingIfPathIsDirectory;
      v15 = @"reason";
      char v11 = [NSString stringWithFormat:@"A file exists at path (%@) but it is not a directory!", v6];
      v16[0] = v11;
      objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *a4 = [v9 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v10 userInfo:v12];

      int v8 = v14;
    }
  }
  if (!v8) {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_fileExistsAtPath:(id)a3 isDirectory:(BOOL *)a4 error:(id *)a5
{
  BOOL v7 = [(APStorageManager *)self _validatedFullPathForPath:a3 error:a5];
  if (v7) {
    BOOL v8 = [(NSFileManager *)self->_fileManager fileExistsAtPath:v7 isDirectory:a4];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)removeObjectAtPath:(id)a3 error:(id *)a4
{
  id v6 = -[APStorageManager _validatedFullURLForPath:error:](self, "_validatedFullURLForPath:error:", a3);
  if (v6) {
    BOOL v7 = [(NSFileManager *)self->_fileManager removeItemAtURL:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)fileForReadingAtKeyPath:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(APStorageManager *)self _validatedFullURLForPath:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(-[APStorageManager _classForEncryptedFile](self, "_classForEncryptedFile")), "initForReadingAtURL:", v7);
    v9 = (void *)v8;
    if (a4 && !v8)
    {
      char v21 = 0;
      if ([(APStorageManager *)self _fileExistsAtPath:v6 isDirectory:&v21 error:0])
      {
        uint64_t v10 = APLogForCategory(0x2EuLL);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          char v11 = [v7 safePath];
          *(_DWORD *)buf = 138739971;
          v25 = v11;
          _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_ERROR, "ERROR: Unable to open file: %{sensitive}@", buf, 0xCu);
        }
        objc_super v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = kSFSCouldNotConstructFile;
        v22 = @"reason";
        v23 = @"Could not construct StorageFile for reading.";
        unsigned __int8 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        v15 = @"com.apple.ap.StorageFileSystem";
        v16 = v12;
        uint64_t v17 = v13;
      }
      else
      {
        v18 = (void *)MEMORY[0x1E4F28C58];
        v19 = (__CFString *)*MEMORY[0x1E4F281F8];
        v26 = @"reason";
        v27[0] = @"Could not construct EncryptedFile for reading because a specified file does not exist.";
        unsigned __int8 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
        v16 = v18;
        v15 = v19;
        uint64_t v17 = 260;
      }
      *a4 = [v16 errorWithDomain:v15 code:v17 userInfo:v14];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)fileForWritingAtKeyPath:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = -[APStorageManager _validatedFullURLForPath:error:](self, "_validatedFullURLForPath:error:", a3);
  if (v6)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(-[APStorageManager _classForEncryptedFile](self, "_classForEncryptedFile")), "initForWritingAtURL:", v6);
    uint64_t v8 = (void *)v7;
    if (a4 && !v7)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = kSFSCouldNotConstructFile;
      uint64_t v13 = @"reason";
      v14[0] = @"Could not construct StorageFile for writing.";
      char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *a4 = [v9 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v10 userInfo:v11];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)fileForAppendingAtKeyPath:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = -[APStorageManager _validatedFullURLForPath:error:](self, "_validatedFullURLForPath:error:", a3);
  if (v6)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(-[APStorageManager _classForEncryptedFile](self, "_classForEncryptedFile")), "initForAppendingAtURL:", v6);
    uint64_t v8 = (void *)v7;
    if (a4 && !v7)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = kSFSCouldNotConstructFile;
      uint64_t v13 = @"reason";
      v14[0] = @"Could not construct StorageFile for appending.";
      char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *a4 = [v9 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v10 userInfo:v11];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)fileAtKeyPath:(id)a3 forMode:(int64_t)a4 error:(id *)a5
{
  uint64_t v7 = [(APStorageManager *)self _validatedFullURLForPath:a3 error:a5];
  if (v7) {
    uint64_t v8 = objc_msgSend(objc_alloc(-[APStorageManager _classForEncryptedFile](self, "_classForEncryptedFile")), "initForMode:atURL:", a4, v7);
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)lastModifiedDateForFileAtPath:(id)a3 error:(id *)a4
{
  id v5 = -[APStorageManager _validatedFullURLForPath:error:](self, "_validatedFullURLForPath:error:", a3);
  id v6 = v5;
  if (v5)
  {
    id v9 = 0;
    [v5 getResourceValue:&v9 forKey:*MEMORY[0x1E4F1C530] error:a4];
    id v7 = v9;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)createdDateForFileAtPath:(id)a3 error:(id *)a4
{
  id v5 = -[APStorageManager _validatedFullURLForPath:error:](self, "_validatedFullURLForPath:error:", a3);
  id v6 = v5;
  if (v5)
  {
    id v9 = 0;
    [v5 getResourceValue:&v9 forKey:*MEMORY[0x1E4F1C540] error:a4];
    id v7 = v9;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)addedToDirectoryDateForFileAtPath:(id)a3 error:(id *)a4
{
  id v5 = -[APStorageManager _validatedFullURLForPath:error:](self, "_validatedFullURLForPath:error:", a3);
  id v6 = v5;
  if (v5)
  {
    id v9 = 0;
    [v5 getResourceValue:&v9 forKey:*MEMORY[0x1E4F1C508] error:a4];
    id v7 = v9;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)touchFileAtPath:(id)a3 error:(id *)a4
{
  id v5 = -[APStorageManager _validatedFullURLForPath:error:](self, "_validatedFullURLForPath:error:", a3);
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] now];
    char v7 = [v5 setResourceValue:v6 forKey:*MEMORY[0x1E4F1C530] error:a4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)iterateObjectsIncludingFolders:(BOOL)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(APStorageManager *)self _validatedFullURLForPath:&stru_1F2EA2540 error:0];
  id v6 = v5;
  if (v5
    && ([v5 absoluteString],
        char v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v8))
  {
    if (a3)
    {
      id v9 = 0;
    }
    else
    {
      v18[0] = *MEMORY[0x1E4F1C628];
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    }
    char v11 = [(NSFileManager *)self->_fileManager enumeratorAtURL:v6 includingPropertiesForKeys:v9 options:16 errorHandler:&unk_1F2E9CC90];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = sub_1D70D21B8;
    v15[3] = &unk_1E6A6B928;
    id v16 = v11;
    BOOL v17 = a3;
    id v12 = v11;
    uint64_t v13 = _Block_copy(v15);
    uint64_t v10 = _Block_copy(v13);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)getStorageSize:(unint64_t *)a3 allocatedSize:(unint64_t *)a4 files:(unint64_t *)a5
{
  v49[3] = *MEMORY[0x1E4F143B8];
  if (a3 && a4 && a5)
  {
    *a3 = 0;
    *a4 = 0;
    *a5 = 0;
    id v9 = [(APStorageManager *)self _validatedFullURLForPath:&stru_1F2EA2540 error:0];
    uint64_t v10 = v9;
    if (v9)
    {
      char v11 = [v9 absoluteString];
      uint64_t v12 = [v11 length];

      if (v12)
      {
        v31 = a3;
        v33 = a4;
        v34 = a5;
        uint64_t v13 = *MEMORY[0x1E4F1C670];
        uint64_t v14 = *MEMORY[0x1E4F1C558];
        v49[0] = *MEMORY[0x1E4F1C670];
        v49[1] = v14;
        uint64_t v35 = v14;
        v49[2] = *MEMORY[0x1E4F1C718];
        [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
        v30 = v32 = v10;
        -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](self->_fileManager, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          unint64_t v37 = 0;
          unint64_t v38 = 0;
          unint64_t v36 = 0;
          id v17 = 0;
          v18 = 0;
          v19 = 0;
          uint64_t v20 = *(void *)v45;
          uint64_t v39 = *MEMORY[0x1E4F1C5F8];
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              v22 = v17;
              if (*(void *)v45 != v20) {
                objc_enumerationMutation(obj);
              }
              v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              v24 = (void *)MEMORY[0x1D9469B60]();
              id v43 = 0;
              [v23 getResourceValue:&v43 forKey:v13 error:0];
              id v17 = v43;

              if ([v17 BOOLValue])
              {

                id v42 = 0;
                int v25 = [v23 getResourceValue:&v42 forKey:v39 error:0];
                id v26 = v42;
                v18 = v26;
                if (v25) {
                  BOOL v27 = v26 == 0;
                }
                else {
                  BOOL v27 = 1;
                }
                if (v27)
                {
                  v19 = 0;
                }
                else
                {
                  id v41 = 0;
                  int v28 = [v23 getResourceValue:&v41 forKey:v35 error:0];
                  id v29 = v41;
                  v19 = v29;
                  if (v28)
                  {
                    if (v29)
                    {
                      ++v36;
                      v38 += [v18 unsignedLongLongValue];
                      v37 += [v19 unsignedLongLongValue];
                    }
                  }
                }
              }
            }
            uint64_t v16 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
          }
          while (v16);
        }
        else
        {
          unint64_t v37 = 0;
          unint64_t v38 = 0;
          unint64_t v36 = 0;
          id v17 = 0;
          v18 = 0;
          v19 = 0;
        }

        unint64_t *v31 = v38;
        unint64_t *v33 = v37;
        unint64_t *v34 = v36;

        uint64_t v10 = v32;
      }
    }
  }
}

- (void)dfsWithStartPath:(id)a3 nodeCallback:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (void (**)(id, void *, unsigned char *))a4;
  uint64_t v8 = [v6 stringByDeletingLastPathComponent];
  v30 = self;
  id v9 = [(APStorageManager *)self _validatedFullURLForPath:v8 error:0];

  if (v9)
  {
    uint64_t v10 = [v9 absoluteString];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:15];
      uint64_t v13 = [v6 lastPathComponent];
      v37[0] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
      [v12 addObject:v14];

      char v35 = 0;
      if ([v12 count])
      {
        uint64_t v15 = 0;
        id v29 = v9;
        id v28 = v6;
        do
        {
          uint64_t v16 = v15;
          char v35 = 0;
          uint64_t v15 = objc_msgSend(v12, "lastObject", v28);

          [v12 removeLastObject];
          v7[2](v7, v15, &v35);
          if (!v35)
          {
            id v17 = [NSString pathWithComponents:v15];
            v18 = [v9 URLByAppendingPathComponent:v17];
            fileManager = v30->_fileManager;
            uint64_t v20 = [v18 path];
            char v21 = [(NSFileManager *)fileManager contentsOfDirectoryAtPath:v20 error:0];

            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            id v22 = v21;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v36 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v32;
              do
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v32 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  BOOL v27 = [v15 arrayByAddingObject:*(void *)(*((void *)&v31 + 1) + 8 * i)];
                  [v12 addObject:v27];
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v36 count:16];
              }
              while (v24);
            }

            id v9 = v29;
          }
        }
        while ([v12 count]);

        id v6 = v28;
      }
    }
  }
}

- (id)_validatedPath:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    char v7 = +[APStorageManager _validatedPath:v6 error:a4];
    uint64_t v8 = v7;
    if (v7)
    {
      if (self->_pathPrefix)
      {
        id v9 = [NSString stringWithFormat:@"%@/%@", self->_pathPrefix, v7];
      }
      else
      {
        id v9 = v7;
      }
      uint64_t v13 = v9;
      a4 = +[APStorageManager _validatedPath:v9 error:a4];
    }
    else
    {
      a4 = 0;
    }
  }
  else if (a4)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = kSFSMissingPathError;
    uint64_t v15 = @"reason";
    v16[0] = @"path was nil.";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a4 = [v10 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v11 userInfo:v12];

    a4 = 0;
  }

  return a4;
}

+ (id)_validatedPath:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 hasPrefix:@"/"] & 1) != 0
    || ([v5 hasPrefix:@".."] & 1) != 0
    || ([v5 hasPrefix:@"."] & 1) != 0
    || ([v5 hasPrefix:@"~"] & 1) != 0
    || ([v5 containsString:@"/../"] & 1) != 0
    || [v5 containsString:@"/./"])
  {
    if (a4)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = kSFSInvalidPathError;
      uint64_t v13 = @"reason";
      v14[0] = @"Invalid path for SFS.";
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      *a4 = [v6 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v7 userInfo:v8];
    }
    id v9 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_ERROR, "Invalid characters in URL.", v12, 2u);
    }

    id v10 = 0;
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (id)_validatedFullPathForPath:(id)a3 error:(id *)a4
{
  v4 = [(APStorageManager *)self _validatedFullURLForPath:a3 error:a4];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 path];
    if ([v6 hasPrefix:@"//localhost"])
    {
      uint64_t v7 = [v6 substringFromIndex:objc_msgSend(@"//localhost", "length")];

      id v6 = (void *)v7;
    }
    if ([v6 hasPrefix:@"/localhost"])
    {
      uint64_t v8 = [v6 substringFromIndex:objc_msgSend(@"/localhost", "length")];

      id v6 = (void *)v8;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_validatedFullURLForPath:(id)a3 error:(id *)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = -[APStorageManager _validatedPath:error:](self, "_validatedPath:error:", a3);
  if (v6)
  {
    uint64_t v7 = [(APStorageManager *)self _rootURL];
    uint64_t v8 = [v7 URLByAppendingPathComponent:v6];
    id v9 = (void *)v8;
    if (a4 && !v8)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = kSFSCouldNotAppendPathError;
      v14[0] = @"name";
      v14[1] = @"reason";
      v15[0] = v6;
      v15[1] = @"Could not append path";
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
      *a4 = [v10 errorWithDomain:@"com.apple.ap.StorageFileSystem" code:v11 userInfo:v12];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)subpathsOfDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v6 = -[APStorageManager _validatedFullPathForPath:error:](self, "_validatedFullPathForPath:error:", a3);
  if (v6)
  {
    uint64_t v7 = [(NSFileManager *)self->_fileManager subpathsOfDirectoryAtPath:v6 error:a4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)contentsOfDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v6 = -[APStorageManager _validatedFullPathForPath:error:](self, "_validatedFullPathForPath:error:", a3);
  if (v6)
  {
    uint64_t v7 = [(NSFileManager *)self->_fileManager contentsOfDirectoryAtPath:v6 error:a4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(APStorageManager *)self _validatedFullURLForPath:a3 error:a5];
  if (v9)
  {
    id v10 = [(APStorageManager *)self _validatedFullURLForPath:v8 error:a5];
    BOOL v11 = v10
       && [(APStorageManager *)self _createDirectoriesForURL:v10 error:a5]
       && [(NSFileManager *)self->_fileManager moveItemAtURL:v9 toURL:v10 error:a5];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (void)setRootPath:(id)a3
{
}

- (id)_rootURL
{
  v3 = [(APStorageManager *)self rootPath];

  if (v3)
  {
    v4 = [APSafeFileURL alloc];
    id v5 = [(APStorageManager *)self rootPath];
    id v6 = (void *)[(APSafeFileURL *)v4 initFileURLWithPath:v5];
  }
  else
  {
    uint64_t v7 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "root URL nil", v9, 2u);
    }

    +[APStorageManager sendAnalyticError:@"Failed" domain:@"SFS" code:16101];
    id v6 = 0;
  }
  return v6;
}

+ (id)_applicationSupportSubdirectory:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  id v5 = [v4 lastObject];

  id v6 = (void *)MEMORY[0x1E4F1CB10];
  v11[0] = v5;
  v11[1] = @"com.apple.ap.promotedcontentd";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v8 = [v6 fileURLWithPathComponents:v7];

  if (v3)
  {
    uint64_t v9 = [v8 URLByAppendingPathComponent:v3 isDirectory:1];

    id v8 = (void *)v9;
  }

  return v8;
}

- (id)_makeApplicationSupportSubdirectory:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = +[APStorageManager _applicationSupportSubdirectory:a3];
  fileManager = self->_fileManager;
  id v13 = 0;
  BOOL v6 = [(NSFileManager *)fileManager createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v7 = v13;
  if (v6)
  {
    id v8 = [v4 path];
  }
  else
  {
    uint64_t v9 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v7 localizedFailureReason];
      BOOL v11 = [v7 userInfo];
      *(_DWORD *)buf = 138740483;
      uint64_t v15 = v4;
      __int16 v16 = 2114;
      id v17 = v10;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_ERROR, "Failed to create Application Support subdirectory: %{sensitive}@ %{public}@ %{public}@", buf, 0x20u);
    }
    +[APStorageManager sendAnalyticError:@"Failed" domain:@"SFS" code:16109];
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_createDirectoriesForURL:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [a3 URLByDeletingLastPathComponent];
  BOOL v7 = [(NSFileManager *)self->_fileManager createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:a4];
  if (!v7)
  {
    id v8 = APLogForCategory(0x2EuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = *a4;
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_ERROR, "Failed to create directory, %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  return v7;
}

+ (BOOL)areThereStoredItems
{
  id v3 = +[APStorageManager _rootSubdirectory];
  v4 = [a1 _applicationSupportSubdirectory:v3];
  id v5 = [v4 path];

  BOOL v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = 0;
  BOOL v7 = [v6 contentsOfDirectoryAtPath:v5 error:&v10];

  if (v7) {
    BOOL v8 = [v7 count] != 0;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)removeStorage
{
  id v3 = +[APStorageManager _rootSubdirectory];
  LOBYTE(a1) = [a1 _removeStorageForSubdirectory:v3];

  return (char)a1;
}

+ (BOOL)_removeStorageForSubdirectory:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 _applicationSupportSubdirectory:a3];
  v4 = [v3 path];

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4 isDirectory:0];

  if (v6)
  {
    BOOL v7 = [MEMORY[0x1E4F29128] UUID];
    BOOL v8 = [v7 UUIDString];

    id v9 = NSTemporaryDirectory();
    uint64_t v10 = [v9 stringByAppendingPathComponent:v8];

    int v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v24 = 0;
    int v12 = [v11 moveItemAtPath:v4 toPath:v10 error:&v24];
    id v13 = v24;

    if (v12)
    {
      uint64_t v14 = dispatch_get_global_queue(9, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D70D38FC;
      block[3] = &unk_1E6A6B6D0;
      id v23 = v10;
      dispatch_async(v14, block);
    }
    else
    {
      __int16 v16 = APLogForCategory(0x2EuLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v26 = v13;
        _os_log_impl(&dword_1D70B2000, v16, OS_LOG_TYPE_ERROR, "Failed to move SFS folder: %{public}@", buf, 0xCu);
      }

      id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v21 = 0;
      char v18 = [v17 removeItemAtPath:v4 error:&v21];
      id v13 = v21;

      if ((v18 & 1) == 0)
      {
        v19 = APLogForCategory(0x2EuLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v26 = v13;
          _os_log_impl(&dword_1D70B2000, v19, OS_LOG_TYPE_ERROR, "Failed to remove SFS folder in place: %{public}@", buf, 0xCu);
        }

        +[APStorageManager sendAnalyticError:@"Failed" domain:@"SFS" code:161003];
        BOOL v15 = 0;
        goto LABEL_14;
      }
    }
    BOOL v15 = 1;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v8 = APLogForCategory(0x2EuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_DEBUG, "There is no SFS folder.", buf, 2u);
  }
  BOOL v15 = 1;
LABEL_15:

  return v15;
}

+ (void)sendAnalyticError:(id)a3 domain:(id)a4 code:(int64_t)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  char v18 = @"code";
  BOOL v7 = NSNumber;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 numberWithInteger:a5];
  v19[0] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

  int v12 = [NSString stringWithFormat:@"%@%@", v8, v9];

  id v13 = APLogForCategory(0x2EuLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    BOOL v15 = v12;
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_impl(&dword_1D70B2000, v13, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
  }

  +[APAnalytics sendEvent:v12 customPayload:v11];
}

- (NSString)pathPrefix
{
  return self->_pathPrefix;
}

- (void)setPathPrefix:(id)a3
{
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_pathPrefix, 0);
}

@end