@interface _BMDirectFileManager
- (BOOL)_removeDirectoryAtPath:(id)a3 error:(id *)a4;
- (BOOL)_removeFileAtPath:(id)a3 error:(id *)a4;
- (BOOL)replaceFileAtPath:(id)a3 withData:(id)a4 protection:(int)a5 error:(id *)a6;
- (BOOL)setUpWithError:(id *)a3;
- (_BMDirectFileManager)initWithDirectory:(id)a3 cachingOptions:(int64_t)a4;
- (id)_fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6;
- (id)_openTemporaryDirectoryWithError:(id *)a3;
- (id)_temporaryFileHandleWithProtection:(int)a3 unlink:(BOOL)a4 error:(id *)a5;
- (id)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 error:(id *)a6;
- (id)temporaryFileHandleWithProtection:(int)a3 error:(id *)a4;
@end

@implementation _BMDirectFileManager

- (id)_temporaryFileHandleWithProtection:(int)a3 unlink:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v35[2] = *MEMORY[0x1E4F143B8];
  if (![(_BMDirectFileManager *)self setUpWithError:a5])
  {
    v15 = 0;
    goto LABEL_20;
  }
  id v29 = 0;
  v9 = [(_BMDirectFileManager *)self _openTemporaryDirectoryWithError:&v29];
  id v10 = v29;
  v11 = v10;
  if (v9)
  {
    id v28 = 0;
    uint64_t v12 = bm_new_temporary_file([v9 fd], a3, v6, &v28);
    id v13 = v28;
    if ((v12 & 0x80000000) != 0)
    {
      if (!a5)
      {
        v15 = 0;
        goto LABEL_18;
      }
      v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28A50];
      v32[0] = *MEMORY[0x1E4F28568];
      v32[1] = v19;
      v33[0] = @"Failed to create temporary file";
      v33[1] = v14;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
      [v18 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v20];
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6)
      {
        v14 = @"<tmp>";
      }
      else
      {
        v21 = [v9 attributes];
        v22 = [v21 path];
        v14 = [v22 stringByAppendingPathComponent:v13];
      }
      v20 = [[BMFileAttributes alloc] initWithPath:v14 mode:2 protectionClass:BMDataProtectionClassFromOSProtectionClass(a3)];
      v23 = [[BMFileHandle alloc] initWithFileDescriptor:v12 attributes:v20];
      v15 = v23;
      if (v23)
      {
        v24 = v23;
      }
      else if (a5)
      {
        v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v30 = *MEMORY[0x1E4F28568];
        v31 = @"Unspecified failure";
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        *a5 = [v25 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v26];
      }
    }
  }
  else
  {
    if (!a5)
    {
      v15 = 0;
      goto LABEL_19;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28A50];
    v34[0] = *MEMORY[0x1E4F28568];
    v34[1] = v17;
    v35[0] = @"Failed to open temporary directory";
    v35[1] = v10;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    [v16 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v13];
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:

LABEL_19:
LABEL_20:
  return v15;
}

- (id)_openTemporaryDirectoryWithError:(id *)a3
{
  uint64_t v26 = 0;
  v5 = [(BMFileManager *)self directory];
  BOOL v6 = +[BMPaths getServiceDomain:&v26 subpath:0 forPath:v5];

  if (!v6) {
    goto LABEL_3;
  }
  v7 = +[BMPaths biomeTemporaryDirectoryForDomain:v26];
  v8 = [BMFileAttributes alloc];
  uint64_t v9 = BMFileAccessModeFromOFlags(512);
  id v10 = [(BMFileAttributes *)v8 initWithPath:v7 mode:v9 protectionClass:BMDataProtectionClassFromOSProtectionClass(4)];
  fileHandleCache = self->super._fileHandleCache;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __57___BMDirectFileManager__openTemporaryDirectoryWithError___block_invoke;
  v22 = &unk_1E6023338;
  uint64_t v25 = 0x420100200;
  id v23 = v7;
  v24 = v10;
  uint64_t v12 = v10;
  id v13 = v7;
  v14 = [(BMCache *)fileHandleCache cachedObjectWithKey:v12 missHandler:&v19];

  if (!v14)
  {
LABEL_3:
    directory = self->_directory;
    v16 = +[BMStoreDirectory tmp];
    uint64_t v17 = [(NSString *)directory stringByAppendingPathComponent:v16];

    v14 = [(BMFileManager *)self fileHandleForFileAtPath:v17 flags:537920000 protection:4 error:a3];
  }
  return v14;
}

- (id)_fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  v47[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (![(_BMDirectFileManager *)self setUpWithError:a6]) {
    goto LABEL_14;
  }
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = bm_subpath(self->_directory, v11);
    id v13 = v11;
    if (!v12)
    {
      id v13 = [(NSString *)self->_directory stringByAppendingPathComponent:v11];
      uint64_t v12 = v11;
    }
    uint64_t v14 = bm_openat_dprotected([(BMFileHandle *)self->_directoryHandle fd], v12, a4, v7);
    if ((v14 & 0x80000000) != 0)
    {
      if (!a6)
      {
        uint64_t v20 = 0;
        goto LABEL_30;
      }
      v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28798];
      uint64_t v22 = *__error();
      uint64_t v23 = *MEMORY[0x1E4F28568];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      v24 = NSString;
      uint64_t v25 = __error();
      uint64_t v26 = [v24 stringWithUTF8String:strerror(*v25)];
      v45 = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      id v28 = [v39 errorWithDomain:v21 code:v22 userInfo:v27];

      id v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = @"Create failed";
      if ((a4 & 0x200) == 0) {
        uint64_t v30 = @"Open failed";
      }
      uint64_t v31 = *MEMORY[0x1E4F28A50];
      v42[0] = v23;
      v42[1] = v31;
      v43[0] = v30;
      v43[1] = v28;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
      v33 = [v29 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v32];
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v15 = v14;
      if (v7 == -1)
      {
        LODWORD(v7) = fcntl(v14, 63);
        if ((v7 & 0x80000000) != 0)
        {
          if (*__error() != 45)
          {
            __error();
            v34 = __biome_log_for_category(2);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              -[_BMDirectFileManager _fileHandleForFileAtPath:flags:protection:error:]();
            }
          }
          LODWORD(v7) = -1;
        }
      }
      else if (v7 == 4)
      {
        uint64_t v7 = [v11 lastPathComponent];
        v16 = +[BMStoreDirectory lock];
        int v17 = [(id)v7 isEqualToString:v16];

        LODWORD(v7) = 4;
        if (v17) {
          fcntl(v15, 64, 4);
        }
      }
      uint64_t v35 = BMDataProtectionClassFromOSProtectionClass(v7);
      id v28 = [[BMFileAttributes alloc] initWithPath:v13 mode:BMFileAccessModeFromOFlags(a4) protectionClass:v35];
      v36 = [[BMFileHandle alloc] initWithFileDescriptor:v15 attributes:v28];
      uint64_t v20 = v36;
      if (!a6 || v36) {
        goto LABEL_29;
      }
      v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = *MEMORY[0x1E4F28568];
      v41 = @"Unspecified failure";
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      v33 = [v37 errorWithDomain:@"BiomeStorageError" code:0 userInfo:v32];
    }
    *a6 = v33;

LABEL_29:
LABEL_30:

    goto LABEL_31;
  }
  v18 = __biome_log_for_category(2);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[BMFileManager fileExistsAtPath:error:]();
  }

  if (!a6)
  {
LABEL_14:
    uint64_t v20 = 0;
    goto LABEL_32;
  }
  uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v46 = *MEMORY[0x1E4F28568];
  v47[0] = @"Invalid path";
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
  [v19 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v13];
  uint64_t v20 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

LABEL_32:
  return v20;
}

- (BOOL)setUpWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  p_setUpLock = &self->_setUpLock;
  os_unfair_lock_lock(&self->_setUpLock);
  if (self->_directoryHandle) {
    goto LABEL_4;
  }
  uint64_t v6 = bm_openat_dprotected(4294967293, self->_directory, 1049344, 3);
  if ((v6 & 0x80000000) == 0)
  {
    uint64_t v7 = [[BMFileAttributes alloc] initWithPath:self->_directory mode:1 protectionClass:BMDataProtectionClassFromOSProtectionClass(3)];
    v8 = [[BMFileHandle alloc] initWithFileDescriptor:v6 attributes:v7];
    directoryHandle = self->_directoryHandle;
    self->_directoryHandle = v8;

LABEL_4:
    LOBYTE(a3) = 1;
    goto LABEL_5;
  }
  if (a3)
  {
    int v11 = *__error();
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    id v13 = [NSString stringWithUTF8String:strerror(v11)];
    v16[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a3 = [v12 errorWithDomain:*MEMORY[0x1E4F28798] code:v11 userInfo:v14];

    LOBYTE(a3) = 0;
  }
LABEL_5:
  os_unfair_lock_unlock(p_setUpLock);
  return (char)a3;
}

- (_BMDirectFileManager)initWithDirectory:(id)a3 cachingOptions:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BMDirectFileManager;
  uint64_t v7 = [(BMFileManager *)&v12 initWithDirectory:v6 cachingOptions:a4];
  v8 = v7;
  if (v7)
  {
    v7->_setUpLock._os_unfair_lock_opaque = 0;
    uint64_t v9 = [v6 copy];
    directory = v8->_directory;
    v8->_directory = (NSString *)v9;
  }
  return v8;
}

- (id)temporaryFileHandleWithProtection:(int)a3 error:(id *)a4
{
  return [(_BMDirectFileManager *)self _temporaryFileHandleWithProtection:*(void *)&a3 unlink:1 error:a4];
}

- (id)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  v66[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (![(_BMDirectFileManager *)self setUpWithError:a6]) {
    goto LABEL_19;
  }
  if ([v10 length])
  {
    uint64_t v12 = bm_subpath(self->_directory, v10);
    id v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (void *)v12;
    }
    else {
      uint64_t v14 = v10;
    }
    id v15 = v14;

    if (bm_validate_pathat([(BMFileHandle *)self->_directoryHandle fd], v15))
    {
      if (v11)
      {
        if ((v7 + 1) < 9)
        {
          int v16 = [v15 containsString:@"/"];
          uint64_t v17 = [(BMFileHandle *)self->_directoryHandle fd];
          if (v16)
          {
            v18 = [v15 stringByDeletingLastPathComponent];
            LODWORD(v17) = bm_openat_dprotected(v17, v18, 537920000, 0xFFFFFFFFLL);

            if ((v17 & 0x80000000) != 0)
            {
              v42 = __biome_log_for_category(2);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                -[_BMDirectFileManager replaceFileAtPath:withData:protection:error:]();
              }

              v43 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v57 = *MEMORY[0x1E4F28568];
              v58 = @"Failed to open destination directory";
              uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
              uint64_t v21 = [v43 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v44];

              uint64_t v25 = 0;
              uint64_t v39 = 0xFFFFFFFFLL;
              if (!a6) {
                goto LABEL_43;
              }
LABEL_41:
              if (v21) {
                *a6 = v21;
              }
LABEL_43:
              if ((v39 & 0x80000000) != 0)
              {
                id v28 = 0;
              }
              else
              {
                uint64_t v40 = [[BMFileAttributes alloc] initWithPath:v10 mode:2 protectionClass:BMDataProtectionClassFromOSProtectionClass(v7)];
                id v28 = [[BMFileHandle alloc] initWithFileDescriptor:v39 attributes:v40];
              }
              goto LABEL_47;
            }
          }
          int v51 = v17;
          id v52 = 0;
          uint64_t v19 = [(_BMDirectFileManager *)self _openTemporaryDirectoryWithError:&v52];
          id v20 = v52;
          uint64_t v21 = v20;
          v47 = v19;
          if (v19)
          {
            int v48 = [v11 fd];
            int v22 = [v19 fd];
            uint64_t v23 = [v15 lastPathComponent];
            int v24 = bm_replace_file(v48, v22, v51, v23, v7);

            unsigned int v49 = v24;
            if ((v24 & 0x80000000) == 0)
            {
              if (v7 != -1)
              {
                uint64_t v25 = v47;
LABEL_36:
                int v38 = v51;
LABEL_37:
                if ((v38 & 0x80000000) == 0 && v38 != [(BMFileHandle *)self->_directoryHandle fd]) {
                  close(v38);
                }
                uint64_t v39 = v49;
                if (!a6) {
                  goto LABEL_43;
                }
                goto LABEL_41;
              }
              int v45 = fcntl(v24, 63);
              uint64_t v25 = v47;
              int v38 = v51;
              if ((v45 & 0x80000000) == 0)
              {
                LODWORD(v7) = v45;
                goto LABEL_37;
              }
              if (*__error() == 45)
              {
                LODWORD(v7) = -1;
                goto LABEL_37;
              }
              __error();
              uint64_t v35 = __biome_log_for_category(2);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                -[_BMDirectFileManager _fileHandleForFileAtPath:flags:protection:error:]();
              }
              LODWORD(v7) = -1;
LABEL_35:

              goto LABEL_36;
            }
            v37 = __biome_log_for_category(2);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              -[_BMDirectFileManager replaceFileAtPath:withFileHandle:protection:error:].cold.4();
            }

            uint64_t v46 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v53 = *MEMORY[0x1E4F28568];
            v54 = @"Replace failed";
            uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
            uint64_t v36 = [v46 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v35];
          }
          else
          {
            v50 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v34 = *MEMORY[0x1E4F28A50];
            v55[0] = *MEMORY[0x1E4F28568];
            v55[1] = v34;
            v56[0] = @"Failed to open temporary directory";
            v56[1] = v20;
            uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
            uint64_t v36 = [v50 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v35];

            unsigned int v49 = -1;
          }
          uint64_t v21 = (void *)v36;
          uint64_t v25 = v47;
          goto LABEL_35;
        }
        if (a6)
        {
          id v29 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v59 = *MEMORY[0x1E4F28568];
          v60 = @"Invalid protection class";
          uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v31 = &v60;
          v32 = &v59;
          goto LABEL_28;
        }
        goto LABEL_29;
      }
      v33 = __biome_log_for_category(2);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[_BMDirectFileManager replaceFileAtPath:withFileHandle:protection:error:]();
      }

      if (a6)
      {
        id v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v61 = *MEMORY[0x1E4F28568];
        v62 = @"Invalid file handle";
        uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v31 = &v62;
        v32 = &v61;
        goto LABEL_28;
      }
    }
    else if (a6)
    {
      id v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      v64 = @"Invalid path";
      uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v31 = &v64;
      v32 = &v63;
LABEL_28:
      uint64_t v21 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:1];
      [v29 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v21];
      id v28 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:

      goto LABEL_48;
    }
LABEL_29:
    id v28 = 0;
    goto LABEL_48;
  }
  uint64_t v26 = __biome_log_for_category(2);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[BMFileManager fileExistsAtPath:error:]();
  }

  if (!a6)
  {
LABEL_19:
    id v28 = 0;
    goto LABEL_49;
  }
  v27 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v65 = *MEMORY[0x1E4F28568];
  v66[0] = @"Missing path";
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
  [v27 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v15];
  id v28 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

LABEL_49:
  return v28;
}

- (BOOL)replaceFileAtPath:(id)a3 withData:(id)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  v63[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ([(_BMDirectFileManager *)self setUpWithError:a6])
  {
    if ([v10 length])
    {
      uint64_t v12 = bm_subpath(self->_directory, v10);
      id v13 = (void *)v12;
      if (v12) {
        uint64_t v14 = (void *)v12;
      }
      else {
        uint64_t v14 = v10;
      }
      id v15 = v14;

      if (bm_validate_pathat([(BMFileHandle *)self->_directoryHandle fd], v15))
      {
        int v16 = [(_BMDirectFileManager *)self _temporaryFileHandleWithProtection:v7 unlink:0 error:a6];
        uint64_t v17 = v16;
        if (v16)
        {
          id v53 = 0;
          char v18 = [v16 overwriteWithData:v11 error:&v53];
          id v19 = v53;
          if ((v18 & 1) == 0)
          {
            v33 = __biome_log_for_category(2);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              -[_BMDirectFileManager replaceFileAtPath:withData:protection:error:].cold.5((uint64_t)v19, v33);
            }

            uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v35 = *MEMORY[0x1E4F28A50];
            v58[0] = *MEMORY[0x1E4F28568];
            v58[1] = v35;
            v59[0] = @"Failed write data";
            v59[1] = v19;
            v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
            id v50 = [v34 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v27];

            id v28 = 0;
            int v51 = -1;
            goto LABEL_32;
          }
          int v20 = [v15 containsString:@"/"];
          uint64_t v21 = [(BMFileHandle *)self->_directoryHandle fd];
          uint64_t v22 = v21;
          if (v20)
          {
            uint64_t v23 = [v15 stringByDeletingLastPathComponent];
            int v24 = bm_openat_dprotected(v22, v23, 537920000, 0xFFFFFFFFLL);

            int v51 = v24;
            if (v24 < 0)
            {
              uint64_t v25 = __biome_log_for_category(2);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                -[_BMDirectFileManager replaceFileAtPath:withData:protection:error:]();
              }

              uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v56 = *MEMORY[0x1E4F28568];
              uint64_t v57 = @"Failed to open destination directory";
              v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
              id v50 = [v26 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v27];

              id v28 = 0;
              goto LABEL_32;
            }
          }
          else
          {
            int v51 = v21;
          }
          id v52 = v19;
          id v28 = [(_BMDirectFileManager *)self _openTemporaryDirectoryWithError:&v52];
          id v36 = v52;

          if (v28)
          {
            id v50 = v36;
            int v49 = [v28 fd];
            v37 = [v17 attributes];
            id v38 = [v37 filename];
            int v39 = renameat(v49, (const char *)[v38 fileSystemRepresentation], v51, (const char *)objc_msgSend(v10, "fileSystemRepresentation"));

            if (!v39)
            {
              BOOL v31 = 1;
LABEL_37:
              if ((v51 & 0x80000000) == 0 && v51 != [(BMFileHandle *)self->_directoryHandle fd]) {
                close(v51);
              }
              if (a6 && v50) {
                *a6 = v50;
              }

              goto LABEL_44;
            }
            v27 = __biome_log_for_category(2);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              -[_BMDirectFileManager replaceFileAtPath:withData:protection:error:].cold.4();
            }
          }
          else
          {
            uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v41 = *MEMORY[0x1E4F28A50];
            v54[0] = *MEMORY[0x1E4F28568];
            v54[1] = v41;
            v55[0] = @"Failed to open temporary directory";
            v55[1] = v36;
            v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
            uint64_t v42 = [v40 errorWithDomain:@"BiomeStorageError" code:1 userInfo:v27];

            id v28 = 0;
            id v50 = (id)v42;
          }
LABEL_32:

          int v43 = [v28 fd];
          uint64_t v44 = [v17 attributes];
          id v45 = [v44 filename];
          int v46 = unlinkat(v43, (const char *)[v45 fileSystemRepresentation], 0);

          if (v46)
          {
            v47 = __biome_log_for_category(2);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              -[_BMDirectFileManager _removeFileAtPath:error:]();
            }
          }
          BOOL v31 = 0;
          goto LABEL_37;
        }
        BOOL v31 = 0;
LABEL_44:

        goto LABEL_45;
      }
      if (a6)
      {
        v32 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        uint64_t v61 = @"Invalid path";
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        [v32 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v17];
        BOOL v31 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_44;
      }
      BOOL v31 = 0;
LABEL_45:

      goto LABEL_46;
    }
    id v29 = __biome_log_for_category(2);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (a6)
    {
      uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v62 = *MEMORY[0x1E4F28568];
      v63[0] = @"Missing path";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
      [v30 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v15];
      BOOL v31 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
  }
  BOOL v31 = 0;
LABEL_46:

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryHandle, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

- (BOOL)_removeFileAtPath:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(_BMDirectFileManager *)self setUpWithError:a4])
  {
    if (v6)
    {
      uint64_t v7 = bm_subpath(self->_directory, v6);
      v8 = (void *)v7;
      if (v7) {
        uint64_t v9 = (void *)v7;
      }
      else {
        uint64_t v9 = v6;
      }
      id v10 = v9;

      if (bm_validate_pathat([(BMFileHandle *)self->_directoryHandle fd], v10))
      {
        if (unlinkat(-[BMFileHandle fd](self->_directoryHandle, "fd"), (const char *)[v10 fileSystemRepresentation], 0) != -1|| *__error() == 2)
        {
          BOOL v11 = 1;
LABEL_19:

          goto LABEL_20;
        }
        id v19 = __biome_log_for_category(2);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[_BMDirectFileManager _removeFileAtPath:error:]();
        }

        if (a4)
        {
          int v20 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v21 = *MEMORY[0x1E4F28568];
          uint64_t v22 = @"Unlink failed";
          id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
          int v16 = v20;
          uint64_t v17 = 1;
          goto LABEL_17;
        }
      }
      else if (a4)
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v23 = *MEMORY[0x1E4F28568];
        int v24 = @"Invalid parameter";
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        int v16 = v14;
        uint64_t v17 = 2;
LABEL_17:
        *a4 = [v16 errorWithDomain:@"BiomeStorageError" code:v17 userInfo:v15];
      }
      BOOL v11 = 0;
      goto LABEL_19;
    }
    uint64_t v12 = __biome_log_for_category(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (a4)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"Invalid path";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      [v13 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v10];
      BOOL v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  BOOL v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)_removeDirectoryAtPath:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(_BMDirectFileManager *)self setUpWithError:a4])
  {
    if (v6)
    {
      uint64_t v7 = bm_subpath(self->_directory, v6);
      v8 = (void *)v7;
      if (v7) {
        uint64_t v9 = (void *)v7;
      }
      else {
        uint64_t v9 = v6;
      }
      id v10 = v9;

      if ((bm_validate_pathat([(BMFileHandle *)self->_directoryHandle fd], v10) & 1) == 0)
      {
        if (!a4)
        {
LABEL_20:
          BOOL v12 = 0;
          goto LABEL_21;
        }
        int v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v24 = *MEMORY[0x1E4F28568];
        uint64_t v25 = @"Invalid parameter";
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        int v16 = v20;
        uint64_t v17 = 2;
LABEL_19:
        *a4 = [v16 errorWithDomain:@"BiomeStorageError" code:v17 userInfo:v15];

        goto LABEL_20;
      }
      int v11 = [(BMFileHandle *)self->_directoryHandle fd];
      BOOL v12 = 1;
      if (removefileat(v11, (const char *)[v10 fileSystemRepresentation], 0, 1u) < 0)
      {
        id v13 = __biome_log_for_category(2);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[_BMDirectFileManager _removeDirectoryAtPath:error:]();
        }

        if (!a4) {
          goto LABEL_20;
        }
        uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28568];
        uint64_t v23 = @"Remove directory failed";
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        int v16 = v14;
        uint64_t v17 = 1;
        goto LABEL_19;
      }
LABEL_21:

      goto LABEL_22;
    }
    char v18 = __biome_log_for_category(2);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[BMFileManager fileExistsAtPath:error:]();
    }

    if (a4)
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = @"Invalid path";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      [v19 errorWithDomain:@"BiomeStorageError" code:2 userInfo:v10];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
  }
  BOOL v12 = 0;
LABEL_22:

  return v12;
}

- (void)_fileHandleForFileAtPath:flags:protection:error:.cold.2()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_1(&dword_1B30A0000, v0, v1, "fcntl(%d, F_GETPROTECTIONCLASS) failed: %{darwin.errno}d");
}

- (void)_removeFileAtPath:error:.cold.2()
{
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1B30A0000, v0, v1, "unlinkat() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

- (void)_removeDirectoryAtPath:error:.cold.2()
{
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1B30A0000, v0, v1, "removefileat() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

- (void)replaceFileAtPath:withData:protection:error:.cold.3()
{
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1B30A0000, v0, v1, "bm_openat_dprotected() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

- (void)replaceFileAtPath:withData:protection:error:.cold.4()
{
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_1(&dword_1B30A0000, v0, v1, "renameat() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

- (void)replaceFileAtPath:(uint64_t)a1 withData:(NSObject *)a2 protection:error:.cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "overwriteWithData:error: failed with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)replaceFileAtPath:withFileHandle:protection:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "Missing file handle parameter", v2, v3, v4, v5, v6);
}

- (void)replaceFileAtPath:withFileHandle:protection:error:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1B30A0000, v0, v1, "bm_replace_file() failed", v2, v3, v4, v5, v6);
}

@end