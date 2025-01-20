@interface ATXBackupFileManager
- (ATXBackupDataProviderDelegate)dataProviderDelegate;
- (ATXBackupFileManager)initWithBackupDirectory:(id)a3 dataProviderDelegate:(id)a4;
- (BOOL)commitWithContainerIdentifier:(id)a3;
- (BOOL)compareBackupIDFromBackupWithPath:(id)a3 toMarkerWithPath:(id)a4;
- (BOOL)isD2DRestoreNeeded;
- (BOOL)isMobileBackupRestoreNeeded;
- (BOOL)isRestoreNeeded;
- (BOOL)restoreFromBackup:(id)a3;
- (BOOL)restoreFromD2D;
- (BOOL)restoreFromMobileBackup;
- (BOOL)writeBackupFileForD2D;
- (BOOL)writeBackupMarkers:(const char *)a3;
- (BOOL)writeChunk:(id)a3 withFilename:(id)a4 toBackupFile:(__sFILE *)a5;
- (BOOL)writeContainerID:(id)a3;
- (BOOL)writeData:(id)a3 toPath:(id)a4;
- (BOOL)writeDeviceID:(id)a3;
- (NSString)backupDirectory;
- (NSString)deviceID;
- (__sFILE)openBackupFileForWriting:(id)a3;
- (id)containerIDForCloudKitRestore;
- (id)pathForFile:(id)a3;
- (id)readBackupData:(id)a3;
- (id)writeBackupData:(id)a3 toPath:(id)a4;
- (id)writeBackupFileForDeviceID:(id)a3 pareDown:(BOOL)a4;
- (void)containerIDForCloudKitRestore;
- (void)isRestoreNeeded;
- (void)restoreFromD2D;
- (void)setBackupDirectory:(id)a3;
- (void)setDataProviderDelegate:(id)a3;
- (void)setDeviceID:(id)a3;
@end

@implementation ATXBackupFileManager

- (ATXBackupFileManager)initWithBackupDirectory:(id)a3 dataProviderDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXBackupFileManager;
  v9 = [(ATXBackupFileManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backupDirectory, a3);
    objc_storeWeak((id *)&v10->_dataProviderDelegate, v8);
  }

  return v10;
}

- (id)writeBackupFileForDeviceID:(id)a3 pareDown:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (NSString *)a3;
  id v7 = (void *)os_transaction_create();
  deviceID = self->_deviceID;
  self->_deviceID = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
  v10 = [WeakRetained filenamesAndDataForBackupShouldPareDown:v4 transport:0];

  v11 = [(ATXBackupFileManager *)self writeBackupData:v10 toPath:@"ATXBackupData"];

  return v11;
}

- (BOOL)commitWithContainerIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [(ATXBackupFileManager *)self pathForFile:@"/Backups/ATXBackupData"];
  [v5 removeItemAtPath:v6 error:0];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [(ATXBackupFileManager *)self pathForFile:@"Backups"];
  [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

  BOOL v9 = [(ATXBackupFileManager *)self writeBackupMarkers:&self->_hdr]
    && [(ATXBackupFileManager *)self writeDeviceID:self->_deviceID]
    && [(ATXBackupFileManager *)self writeContainerID:v4];

  return v9;
}

- (NSString)deviceID
{
  v2 = [(ATXBackupFileManager *)self pathForFile:@"/Backups/deviceID"];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    v5 = [NSString stringWithContentsOfFile:v2 encoding:4 error:0];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)restoreFromBackup:(id)a3
{
  id v4 = a3;
  v5 = [(ATXBackupFileManager *)self pathForFile:@"ATXLastBackupVersion"];
  v6 = [(ATXBackupFileManager *)self pathForFile:@"/Backups/backupID"];
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v7 removeItemAtPath:v5 error:0];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  [v8 copyItemAtPath:v6 toPath:v5 error:&v14];
  id v9 = v14;

  if (v9)
  {
    v10 = __atxlog_handle_backup();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager restoreFromBackup:]((uint64_t)v9, v10);
    }
  }
  else
  {
    if (!v4)
    {
      char v11 = 0;
      goto LABEL_6;
    }
    v10 = [(ATXBackupFileManager *)self readBackupData:v4];
    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
      char v11 = [WeakRetained restoreFromBackup:v10];

      goto LABEL_5;
    }
  }
  char v11 = 0;
LABEL_5:

LABEL_6:
  return v11;
}

- (BOOL)isRestoreNeeded
{
  v3 = [(ATXBackupFileManager *)self pathForFile:@"/Backups/backupID"];
  id v4 = [(ATXBackupFileManager *)self pathForFile:@"ATXLastBackupVersion"];
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [v5 fileExistsAtPath:v3];

  if ((v6 & 1) == 0)
  {
    objc_super v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager isRestoreNeeded]();
    }

    goto LABEL_8;
  }
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 fileExistsAtPath:v4];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v10 = [v9 contentsEqualAtPath:v3 andPath:v4];

    if (v10)
    {
LABEL_8:
      BOOL v11 = 0;
      goto LABEL_9;
    }
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (id)containerIDForCloudKitRestore
{
  v2 = [(ATXBackupFileManager *)self pathForFile:@"/Backups/containerID"];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    v5 = [NSString stringWithContentsOfFile:v2 encoding:4 error:0];
  }
  else
  {
    char v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager containerIDForCloudKitRestore]();
    }

    v5 = 0;
  }

  return v5;
}

- (BOOL)writeBackupFileForD2D
{
  v3 = (void *)os_transaction_create();
  int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [(ATXBackupFileManager *)self pathForFile:@"D2DBackups"];
  [v4 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];

  char v6 = [(ATXBackupFileManager *)self dataProviderDelegate];
  id v7 = [v6 filenamesAndDataForBackupShouldPareDown:0 transport:1];

  int v8 = [(ATXBackupFileManager *)self writeBackupData:v7 toPath:@"/D2DBackups/ATXBackupData"];
  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&self->_hdr length:16];
    char v10 = [(ATXBackupFileManager *)self pathForFile:@"ATXD2DLastBackupVersion"];
    BOOL v11 = [(ATXBackupFileManager *)self writeData:v9 toPath:v10];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)restoreFromD2D
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  LODWORD(v15) = 0;
  id v3 = [(ATXBackupFileManager *)self pathForFile:@"/D2DBackups/ATXBackupData", 0, 0, v15, v16];
  int v4 = fopen((const char *)[v3 UTF8String], "r");

  if (!v4)
  {
    BOOL v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager restoreFromD2D]();
    }

    return 0;
  }
  if (fread(&v14, 0x14uLL, 1uLL, v4) != 1)
  {
    objc_super v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager restoreFromD2D]();
    }

    fclose(v4);
    return 0;
  }
  fclose(v4);
  v5 = [(ATXBackupFileManager *)self pathForFile:@"ATXD2DLastBackupVersion"];
  char v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v14 length:16];
  [(ATXBackupFileManager *)self writeData:v6 toPath:v5];
  id v7 = [(ATXBackupFileManager *)self pathForFile:@"/D2DBackups/ATXBackupData"];
  int v8 = [(ATXBackupFileManager *)self readBackupData:v7];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
    char v10 = [WeakRetained restoreFromBackup:v8];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isD2DRestoreNeeded
{
  v2 = self;
  id v3 = [(ATXBackupFileManager *)self pathForFile:@"/D2DBackups/ATXBackupData"];
  int v4 = [(ATXBackupFileManager *)v2 pathForFile:@"ATXD2DLastBackupVersion"];
  LOBYTE(v2) = [(ATXBackupFileManager *)v2 compareBackupIDFromBackupWithPath:v3 toMarkerWithPath:v4];

  return (char)v2;
}

- (BOOL)restoreFromMobileBackup
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  LODWORD(v15) = 0;
  id v3 = [(ATXBackupFileManager *)self pathForFile:@"/Backups/ATXBackupData", 0, 0, v15, v16];
  int v4 = fopen((const char *)[v3 UTF8String], "r");

  if (!v4)
  {
    BOOL v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager restoreFromD2D]();
    }

    return 0;
  }
  if (fread(&v14, 0x14uLL, 1uLL, v4) != 1)
  {
    objc_super v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager restoreFromD2D]();
    }

    fclose(v4);
    return 0;
  }
  fclose(v4);
  v5 = [(ATXBackupFileManager *)self pathForFile:@"ATXLastBackupVersion"];
  char v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v14 length:16];
  [(ATXBackupFileManager *)self writeData:v6 toPath:v5];
  id v7 = [(ATXBackupFileManager *)self pathForFile:@"/Backups/ATXBackupData"];
  int v8 = [(ATXBackupFileManager *)self readBackupData:v7];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
    char v10 = [WeakRetained restoreFromBackup:v8];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isMobileBackupRestoreNeeded
{
  v2 = self;
  id v3 = [(ATXBackupFileManager *)self pathForFile:@"/Backups/ATXBackupData"];
  int v4 = [(ATXBackupFileManager *)v2 pathForFile:@"ATXLastBackupVersion"];
  LOBYTE(v2) = [(ATXBackupFileManager *)v2 compareBackupIDFromBackupWithPath:v3 toMarkerWithPath:v4];

  return (char)v2;
}

- (BOOL)writeBackupMarkers:(const char *)a3
{
  v5 = [(ATXBackupFileManager *)self pathForFile:@"ATXLastBackupVersion"];
  char v6 = [(ATXBackupFileManager *)self pathForFile:@"/Backups/backupID"];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:16];
  if ([(ATXBackupFileManager *)self writeData:v7 toPath:v5]) {
    BOOL v8 = [(ATXBackupFileManager *)self writeData:v7 toPath:v6];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)writeDeviceID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(ATXBackupFileManager *)self pathForFile:@"/Backups/deviceID"];
    char v6 = [v4 dataUsingEncoding:4];
    BOOL v7 = [(ATXBackupFileManager *)self writeData:v6 toPath:v5];
  }
  else
  {
    BOOL v8 = __atxlog_handle_backup();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager writeDeviceID:]();
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)writeContainerID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(ATXBackupFileManager *)self pathForFile:@"/Backups/containerID"];
    char v6 = [v4 dataUsingEncoding:4];
    BOOL v7 = [(ATXBackupFileManager *)self writeData:v6 toPath:v5];
  }
  else
  {
    BOOL v8 = __atxlog_handle_backup();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager writeContainerID:]();
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)compareBackupIDFromBackupWithPath:(id)a3 toMarkerWithPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = fopen((const char *)[a3 UTF8String], "r");
  if (v6)
  {
    BOOL v7 = v6;
    uint64_t __ptr = 0;
    uint64_t v18 = 0;
    int v19 = 0;
    id v16 = 0;
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:0 error:&v16];
    id v9 = v16;
    if (fread(&__ptr, 0x14uLL, 1uLL, v7) == 1)
    {
      if (!v8)
      {
LABEL_9:
        BOOL v12 = 1;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      if ([v8 length] == 16)
      {
        char v10 = (void *)[v8 bytes];
        if (*v10 != __ptr || v10[1] != v18) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v14 = __atxlog_handle_default();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[ATXBackupFileManager compareBackupIDFromBackupWithPath:toMarkerWithPath:]();
        }

        unlink((const char *)[v5 UTF8String]);
      }
    }
    else
    {
      v13 = __atxlog_handle_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXBackupFileManager restoreFromD2D]();
      }
    }
    fclose(v7);
    BOOL v12 = 0;
    goto LABEL_22;
  }
  if (*__error() != 2)
  {
    id v9 = __atxlog_handle_backup();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager compareBackupIDFromBackupWithPath:toMarkerWithPath:]();
    }
    BOOL v12 = 0;
    goto LABEL_23;
  }
  BOOL v12 = 0;
LABEL_24:

  return v12;
}

- (id)writeBackupData:(id)a3 toPath:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    arc4random_buf(&self->_hdr, 0x10uLL);
    self->_hdr.chunkCount = [v6 count];
    BOOL v8 = [(ATXBackupFileManager *)self pathForFile:v7];
    id v9 = [(ATXBackupFileManager *)self openBackupFileForWriting:v8];
    if (v9)
    {
      char v10 = v9;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __47__ATXBackupFileManager_writeBackupData_toPath___block_invoke;
      aBlock[3] = &unk_1E68ACD10;
      v38 = v9;
      id v11 = v8;
      id v37 = v11;
      BOOL v12 = (void (**)(void))_Block_copy(aBlock);
      if (fwrite(&self->_hdr, 0x14uLL, 1uLL, v10) == 1)
      {
        v29 = v11;
        v30 = v12;
        v31 = v8;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v13 = [v6 allKeys];
        uint64_t v14 = [v13 sortedArrayUsingSelector:sel_compare_];

        uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v39 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v33;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              uint64_t v20 = [v6 objectForKeyedSubscript:v19];
              LOBYTE(v19) = [(ATXBackupFileManager *)self writeChunk:v20 withFilename:v19 toBackupFile:v10];

              if ((v19 & 1) == 0)
              {
                v27 = __atxlog_handle_backup();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                  -[ATXBackupFileManager writeBackupData:toPath:]();
                }

                BOOL v12 = v30;
                v30[2](v30);

                id v25 = 0;
                BOOL v8 = v31;
                goto LABEL_21;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v39 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        fclose(v10);
        v21 = [MEMORY[0x1E4F28CB8] defaultManager];
        v22 = [(ATXBackupFileManager *)self pathForFile:@"Backups/AppPredictionExpert"];
        [v21 removeItemAtPath:v22 error:0];

        v23 = [MEMORY[0x1E4F28CB8] defaultManager];
        v24 = [(ATXBackupFileManager *)self pathForFile:@"Backups/backup_version"];
        [v23 removeItemAtPath:v24 error:0];

        id v25 = v29;
        BOOL v12 = v30;
        BOOL v8 = v31;
      }
      else
      {
        v26 = __atxlog_handle_backup();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[ATXBackupFileManager writeBackupData:toPath:]();
        }

        v12[2](v12);
        id v25 = 0;
      }
LABEL_21:
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

uint64_t __47__ATXBackupFileManager_writeBackupData_toPath___block_invoke(uint64_t a1)
{
  v2 = *(FILE **)(a1 + 40);
  if (v2) {
    fclose(v2);
  }
  id v3 = (const char *)[*(id *)(a1 + 32) UTF8String];
  return unlink(v3);
}

- (BOOL)writeChunk:(id)a3 withFilename:(id)a4 toBackupFile:(__sFILE *)a5
{
  id v7 = a3;
  BOOL v8 = (const char *)[a4 UTF8String];
  unsigned int __ptr = strlen(v8);
  if (fwrite(&__ptr, 4uLL, 1uLL, a5) == 1 && fwrite(v8, __ptr, 1uLL, a5) == 1)
  {
    id v9 = [MEMORY[0x1E4F93AE0] compress:v7 lowMemory:1];
    unsigned int __ptr = [v9 length];
    if (fwrite(&__ptr, 4uLL, 1uLL, a5) == 1)
    {
      char v10 = (const void *)[v9 bytes];
      BOOL v11 = fwrite(v10, __ptr, 1uLL, a5) == 1;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (__sFILE)openBackupFileForWriting:(id)a3
{
  int v3 = open_dprotected_np((const char *)[a3 UTF8String], 1537, 3, 0, 384);
  id v4 = fdopen(v3, "w");
  if (!v4)
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager openBackupFileForWriting:]();
    }

    close(v3);
  }
  return v4;
}

- (id)readBackupData:(id)a3
{
  id v4 = a3;
  id v5 = fopen((const char *)[v4 UTF8String], "r");
  if (v5)
  {
    id v6 = v5;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__ATXBackupFileManager_readBackupData___block_invoke;
    aBlock[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    void aBlock[4] = v5;
    id v7 = (void (**)(void))_Block_copy(aBlock);
    if (fread(&self->_hdr, 0x14uLL, 1uLL, v6) == 1)
    {
      id v25 = v7;
      BOOL v8 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      if (self->_hdr.chunkCount)
      {
        int v9 = 0;
        while (1)
        {
          char v10 = (void *)MEMORY[0x1D25F6CC0]();
          unsigned int __ptr = 0;
          if (fread(&__ptr, 4uLL, 1uLL, v6) != 1) {
            goto LABEL_16;
          }
          size_t v11 = __ptr;
          BOOL v12 = malloc_type_calloc(__ptr + 1, 1uLL, 0x100004077774924uLL);
          v13 = v12;
          if (!v12 || fread(v12, v11, 1uLL, v6) != 1)
          {
            free(v13);
LABEL_16:
            id v7 = v25;
            v25[2](v25);
            id v23 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_19;
          }
          uint64_t v14 = (void *)[[NSString alloc] initWithBytesNoCopy:v13 length:v11 encoding:4 freeWhenDone:1];
          if (fread(&__ptr, 4uLL, 1uLL, v6) != 1) {
            goto LABEL_18;
          }
          size_t v15 = __ptr;
          uint64_t v16 = malloc_type_malloc(__ptr, 0x279605E1uLL);
          uint64_t v17 = v16;
          if (!v16 || fread(v16, v15, 1uLL, v6) != 1) {
            break;
          }
          uint64_t v18 = v8;
          uint64_t v19 = (void *)MEMORY[0x1E4F93AE0];
          uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v17 length:v15];
          v21 = v19;
          BOOL v8 = v18;
          v22 = [v21 decompress:v20];

          [v18 setObject:v22 forKeyedSubscript:v14];
          if (++v9 >= self->_hdr.chunkCount) {
            goto LABEL_12;
          }
        }
        free(v17);
LABEL_18:
        id v7 = v25;
        v25[2](v25);
        id v23 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
      }
      else
      {
LABEL_12:
        fclose(v6);
        id v23 = v8;
        id v7 = v25;
      }
    }
    else
    {
      v7[2](v7);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

uint64_t __39__ATXBackupFileManager_readBackupData___block_invoke(uint64_t a1)
{
  v1 = *(FILE **)(a1 + 32);
  if (v1) {
    fclose(v1);
  }
  v2 = __atxlog_handle_backup();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[ATXBackupFileManager restoreFromD2D]();
  }

  return 0;
}

- (BOOL)writeData:(id)a3 toPath:(id)a4
{
  id v8 = 0;
  char v4 = [a3 writeToFile:a4 options:0 error:&v8];
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    id v6 = __atxlog_handle_backup();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXBackupFileManager writeData:toPath:]((uint64_t)v5, v6);
    }
  }
  return v4;
}

- (id)pathForFile:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXBackupFileManager *)self backupDirectory];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (ATXBackupDataProviderDelegate)dataProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
  return (ATXBackupDataProviderDelegate *)WeakRetained;
}

- (void)setDataProviderDelegate:(id)a3
{
}

- (NSString)backupDirectory
{
  return self->_backupDirectory;
}

- (void)setBackupDirectory:(id)a3
{
}

- (void)setDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_backupDirectory, 0);
  objc_destroyWeak((id *)&self->_dataProviderDelegate);
}

- (void)restoreFromBackup:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Error occurred while writing marker file: %@", (uint8_t *)&v2, 0xCu);
}

- (void)isRestoreNeeded
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "backupID file does not exist", v2, v3, v4, v5, v6);
}

- (void)containerIDForCloudKitRestore
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "containerID file does not exist", v2, v3, v4, v5, v6);
}

- (void)restoreFromD2D
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_13(&dword_1D0FA3000, v1, v2, "Error reading from backup file [%i]: %s", v3, v4, v5, v6, v7);
}

- (void)writeDeviceID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Device ID was null or empty", v2, v3, v4, v5, v6);
}

- (void)writeContainerID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "container ID was null", v2, v3, v4, v5, v6);
}

- (void)compareBackupIDFromBackupWithPath:toMarkerWithPath:.cold.1()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_13(&dword_1D0FA3000, v1, v2, "Error opening backup file %i: %s", v3, v4, v5, v6, v7);
}

- (void)compareBackupIDFromBackupWithPath:toMarkerWithPath:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Backup marker file truncated.", v2, v3, v4, v5, v6);
}

- (void)writeBackupData:toPath:.cold.1()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_13(&dword_1D0FA3000, v1, v2, "Error writing to backup file [%i]: %s", v3, v4, v5, v6, v7);
}

- (void)openBackupFileForWriting:.cold.1()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1_13(&dword_1D0FA3000, v1, v2, "Could not fdopen backup fd [%i]: %s", v3, v4, v5, v6, v7);
}

- (void)writeData:(uint64_t)a1 toPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Could not write data to file: %@", (uint8_t *)&v2, 0xCu);
}

@end