@interface DACPLogShared
+ (DACPLogShared)shared;
- (BOOL)_array:(id)a3 beginsWithArray:(id)a4 outRemainingArray:(id *)a5;
- (BOOL)_logData:(id)a3 UUID:(id)a4 startNewFile:(BOOL)a5 sizeCheck:(int64_t)a6 wantsCompressed:(BOOL)a7 maxFileCount:(int64_t)a8 outDidCreateNewFile:(BOOL *)a9 outNewFilePath:(id *)a10;
- (BOOL)_slurpToFileUUID:(id)a3 slurpeeFileDescriptor:(int)a4 prefix:(id)a5 suffix:(id)a6 startNewFile:(BOOL)a7 sizeCheck:(int64_t)a8 wantsCompressed:(BOOL)a9 maxLogFileCount:(int)a10 outDidCreateNewFile:(BOOL *)a11 outNewFilePath:(id *)a12;
- (DACPLogShared)init;
- (id)_getUUIDForFolder:(id)a3 baseName:(id)a4;
@end

@implementation DACPLogShared

+ (DACPLogShared)shared
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__DACPLogShared_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_sharedInstance;

  return (DACPLogShared *)v2;
}

uint64_t __23__DACPLogShared_shared__block_invoke()
{
  shared_sharedInstance = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (DACPLogShared)init
{
  v6.receiver = self;
  v6.super_class = (Class)DACPLogShared;
  v2 = [(DACPLogShared *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    UUIDToFileMap = v2->_UUIDToFileMap;
    v2->_UUIDToFileMap = v3;
  }
  return v2;
}

- (BOOL)_array:(id)a3 beginsWithArray:(id)a4 outRemainingArray:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 DACPLogArrayBeginsWithArray:v8];
  BOOL v10 = v9;
  if (a5 && v9)
  {
    objc_msgSend(v7, "DACPLogSubarrayFromIndexToEndOfArray:", objc_msgSend(v8, "count"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_getUUIDForFolder:(id)a3 baseName:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v46 = (char *)a3;
  id v43 = a4;
  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8854000, v5, OS_LOG_TYPE_INFO, "Handling getUUIDForPath", buf, 2u);
  }

  *(void *)buf = 0;
  v61 = buf;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__0;
  v64 = __Block_byref_object_dispose__0;
  id v65 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  if (_getUUIDForFolder_baseName__onceToken != -1) {
    dispatch_once(&_getUUIDForFolder_baseName__onceToken, &__block_literal_global_91_0);
  }
  objc_super v6 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v66 = 138412290;
    v67 = v46;
    _os_log_impl(&dword_1C8854000, v6, OS_LOG_TYPE_INFO, "Testing requested log folder %@", v66, 0xCu);
  }

  uid_t v7 = geteuid();
  v44 = _homeDirectoryPathComponentsForUID(v7);
  if (v44)
  {
    uint64_t v8 = [v46 pathComponents];
    id v55 = 0;
    BOOL v9 = [(DACPLogShared *)self _array:v8 beginsWithArray:&unk_1F2328420 outRemainingArray:&v55];
    id v10 = v55;
    v11 = v10;
    v45 = (void *)v8;
    if (!v9)
    {
      id v54 = v10;
      BOOL v12 = [(DACPLogShared *)self _array:v8 beginsWithArray:&unk_1F2328438 outRemainingArray:&v54];
      id v13 = v54;

      if (v12)
      {
        v11 = v13;
      }
      else
      {
        id v53 = v13;
        BOOL v15 = [(DACPLogShared *)self _array:v45 beginsWithArray:&unk_1F2328450 outRemainingArray:&v53];
        id v41 = v53;

        if (!v15)
        {
          v16 = v45;
          v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v45, "count"));
          for (uint64_t i = 1; i - 1 < (unint64_t)objc_msgSend(v16, "count", v41); ++i)
          {
            v19 = [v16 objectAtIndexedSubscript:i - 1];
            [v17 addObject:v19];
            id v20 = [NSString pathWithComponents:v17];
            v21 = realpath_DARWIN_EXTSN((const char *)[v20 fileSystemRepresentation], 0);

            if (v21)
            {
              v22 = [NSString stringWithUTF8String:v21];
              v23 = [v22 pathComponents];
              int v24 = [v23 isEqualToArray:v44];

              if (v24)
              {
                v26 = DALoggingwithCategory(0);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v66 = 136315138;
                  v67 = v21;
                  _os_log_impl(&dword_1C8854000, v26, OS_LOG_TYPE_INFO, "Matched client home directory: %s", v66, 0xCu);
                }

                if (i - 1 >= (unint64_t)([v45 count] - 1))
                {
                  v11 = (void *)MEMORY[0x1E4F1CBF0];
                }
                else
                {
                  v11 = objc_msgSend(v45, "subarrayWithRange:", i, objc_msgSend(v45, "count") - i);
                }

                free(v21);
                goto LABEL_31;
              }
              free(v21);
            }

            v16 = v45;
          }

          v25 = DALoggingwithCategory(0);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v66 = 138412290;
            v67 = v46;
            _os_log_impl(&dword_1C8854000, v25, OS_LOG_TYPE_ERROR, "The path %@ does not begin with the caller's home directory.", v66, 0xCu);
          }

          *((unsigned char *)v57 + 24) = 1;
          v11 = v41;
          goto LABEL_46;
        }
        v11 = v41;
      }
    }
LABEL_31:
    v27 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v66 = 138412290;
      v67 = (char *)v11;
      _os_log_impl(&dword_1C8854000, v27, OS_LOG_TYPE_INFO, "Requested path into client home directory: %@", v66, 0xCu);
    }

    if ((unint64_t)[v11 count] >= 2)
    {
      v28 = [v11 objectAtIndexedSubscript:0];
      if ([v28 isEqualToString:@"Library"])
      {
        v29 = [v11 objectAtIndexedSubscript:1];
        char v30 = [v29 isEqualToString:@"Logs"];

        if (v30)
        {
          v31 = [(id)_getUUIDForFolder_baseName__homeDirComponents arrayByAddingObjectsFromArray:v11];
          v32 = [NSString pathWithComponents:v31];
          v33 = DALoggingwithCategory(0);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v66 = 138412290;
            v67 = v32;
            _os_log_impl(&dword_1C8854000, v33, OS_LOG_TYPE_INFO, "Resolved log file folder to %@", v66, 0xCu);
          }

          if ([v32 length]
            && objc_msgSend(v32, "characterAtIndex:", objc_msgSend(v32, "length") - 1) == 47)
          {
            uint64_t v34 = objc_msgSend(v32, "substringToIndex:", objc_msgSend(v32, "length") - 1);

            v32 = (char *)v34;
          }
          v35 = _fileOpsQueue();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __44__DACPLogShared__getUUIDForFolder_baseName___block_invoke_122;
          block[3] = &unk_1E65744B8;
          v51 = &v56;
          v48 = v32;
          v49 = self;
          id v50 = v43;
          v52 = buf;
          v36 = v32;
          dispatch_sync(v35, block);

LABEL_46:
          goto LABEL_47;
        }
      }
      else
      {
      }
    }
    v37 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v66 = 138412290;
      v67 = v46;
      _os_log_impl(&dword_1C8854000, v37, OS_LOG_TYPE_ERROR, "Log folder: “%@” must begin with /Library/Logs in the user’s home directory.", v66, 0xCu);
    }

    *((unsigned char *)v57 + 24) = 1;
    goto LABEL_46;
  }
  v14 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v66 = 0;
    _os_log_impl(&dword_1C8854000, v14, OS_LOG_TYPE_ERROR, "Could not resolve client home directory. Not granting access to write logs.", v66, 2u);
  }

  *((unsigned char *)v57 + 24) = 1;
LABEL_47:

  if (*((unsigned char *)v57 + 24))
  {
    v38 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v66 = 138412546;
      v67 = v46;
      __int16 v68 = 2112;
      id v69 = v43;
      _os_log_impl(&dword_1C8854000, v38, OS_LOG_TYPE_ERROR, "Get UUID for for folder resulted in an error. Folder: %@. Basename: %@.", v66, 0x16u);
    }
  }
  id v39 = *((id *)v61 + 5);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(buf, 8);

  return v39;
}

void __44__DACPLogShared__getUUIDForFolder_baseName___block_invoke()
{
  uid_t v0 = getuid();
  uint64_t v1 = _homeDirectoryPathComponentsForUID(v0);
  v2 = (void *)_getUUIDForFolder_baseName__homeDirComponents;
  _getUUIDForFolder_baseName__homeDirComponents = v1;

  if (!_getUUIDForFolder_baseName__homeDirComponents)
  {
    v3 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_1C8854000, v3, OS_LOG_TYPE_DEFAULT, "Could not resolve home directory. Falling back to /var/mobile.", v6, 2u);
    }

    uint64_t v4 = [@"/var/mobile" pathComponents];
    v5 = (void *)_getUUIDForFolder_baseName__homeDirComponents;
    _getUUIDForFolder_baseName__homeDirComponents = v4;
  }
}

void __44__DACPLogShared__getUUIDForFolder_baseName___block_invoke_122(void *a1)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  char v34 = 1;
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v2 fileExistsAtPath:a1[4] isDirectory:&v34])
  {
    if (!v34)
    {
      v3 = DALoggingwithCategory(0);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v4 = a1[4];
        *(_DWORD *)buf = 138412290;
        uint64_t v37 = v4;
        _os_log_impl(&dword_1C8854000, v3, OS_LOG_TYPE_ERROR, "Folder path %@ does not refer to a directory.", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v40 = *MEMORY[0x1E4F28330];
    v41[0] = &unk_1F23283F0;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    objc_super v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = a1[4];
    id v33 = 0;
    [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:v5 error:&v33];
    id v8 = v33;

    BOOL v9 = DALoggingwithCategory(0);
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = a1[4];
        *(_DWORD *)buf = 138412546;
        uint64_t v37 = v11;
        __int16 v38 = 2112;
        id v39 = v8;
        _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_ERROR, "Could not create directory %@. Error: %@", buf, 0x16u);
      }

      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
      goto LABEL_26;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = a1[4];
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = v12;
      _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_INFO, "Created directory at path: %@", buf, 0xCu);
    }
  }
  v28 = v2;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = (DACPLogDFile *)*(id *)(a1[5] + 8);
  uint64_t v14 = [(DACPLogDFile *)v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v19 = [*(id *)(a1[5] + 8) objectForKey:v18];
        id v20 = [v19 folder];
        if ([v20 isEqualToString:a1[4]])
        {
          v21 = [v19 baseName];
          int v22 = [v21 isEqualToString:a1[6]];

          if (v22)
          {
            objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v18);

            goto LABEL_25;
          }
        }
        else
        {
        }
      }
      uint64_t v15 = [(DACPLogDFile *)v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v15);
  }

  id v13 = [[DACPLogDFile alloc] initWithFolder:a1[4] baseName:a1[6]];
  v23 = *(void **)(a1[5] + 8);
  int v24 = [(DACPLogDFile *)v13 UUID];
  [v23 setObject:v13 forKey:v24];

  uint64_t v25 = [(DACPLogDFile *)v13 UUID];
  uint64_t v26 = *(void *)(a1[8] + 8);
  v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;

LABEL_25:
  v2 = v28;
LABEL_26:
}

- (BOOL)_logData:(id)a3 UUID:(id)a4 startNewFile:(BOOL)a5 sizeCheck:(int64_t)a6 wantsCompressed:(BOOL)a7 maxFileCount:(int64_t)a8 outDidCreateNewFile:(BOOL *)a9 outNewFilePath:(id *)a10
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8854000, v16, OS_LOG_TYPE_INFO, "Handling logData", buf, 2u);
  }

  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  *(void *)buf = 0;
  __int16 v38 = buf;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__0;
  id v41 = __Block_byref_object_dispose__0;
  id v42 = 0;
  v17 = _fileOpsQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__DACPLogShared__logData_UUID_startNewFile_sizeCheck_wantsCompressed_maxFileCount_outDidCreateNewFile_outNewFilePath___block_invoke;
  block[3] = &unk_1E65744E0;
  void block[4] = self;
  id v18 = v15;
  id v27 = v18;
  long long v29 = &v47;
  long long v30 = buf;
  BOOL v35 = a5;
  long long v31 = &v43;
  long long v32 = &v51;
  id v19 = v14;
  id v28 = v19;
  BOOL v36 = a7;
  int64_t v33 = a6;
  int64_t v34 = a8;
  dispatch_sync(v17, block);

  if (*((unsigned char *)v52 + 24))
  {
    id v20 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v55 = 138412290;
      id v56 = v18;
      _os_log_impl(&dword_1C8854000, v20, OS_LOG_TYPE_ERROR, "Log data resulted in an error. UUID: %@.", v55, 0xCu);
    }
  }
  else
  {
    *((unsigned char *)v48 + 24) ^= 1u;
    if (a9) {
      *a9 = *((unsigned char *)v44 + 24);
    }
    if (a10)
    {
      v21 = (void *)*((void *)v38 + 5);
      if (v21) {
        *a10 = v21;
      }
    }
  }
  BOOL v22 = *((unsigned char *)v48 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v22;
}

void __118__DACPLogShared__logData_UUID_startNewFile_sizeCheck_wantsCompressed_maxFileCount_outDidCreateNewFile_outNewFilePath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  v3 = v2;
  if (!v2)
  {
    uint64_t v7 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C8854000, v7, OS_LOG_TYPE_ERROR, "Cannot find UUID. Asking client to retry.", buf, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 56);
    goto LABEL_11;
  }
  if (!*(unsigned char *)(a1 + 104))
  {
    if (*(uint64_t *)(a1 + 88) < 1)
    {
      id v9 = 0;
    }
    else
    {
      v19[1] = 0;
      objc_msgSend(v2, "checkForMaximumFileSize:wantsCompressed:outDidCreateNewFile:outNewFilePath:");
      id v9 = 0;
    }
    buf[0] = 0;
    uint64_t v10 = *(void *)(a1 + 48);
    v19[0] = 0;
    char v11 = [v3 logData:v10 outDidCreateNewFile:buf outNewFilePath:v19];
    id v12 = v19[0];
    id v13 = v12;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v11 ^ 1;
    if (buf[0])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      id v14 = v12;

      id v9 = v14;
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v9;
    id v17 = v9;

    goto LABEL_16;
  }
  uint64_t v4 = [v2 startNewFile];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  objc_super v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v8 = *(void *)(a1 + 80);
LABEL_11:
    *(unsigned char *)(*(void *)(v8 + 8) + 24) = 1;
    goto LABEL_19;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v3 logData:*(void *)(a1 + 48) outDidCreateNewFile:0 outNewFilePath:0] ^ 1;
LABEL_16:
  uint64_t v18 = *(void *)(a1 + 96);
  if (v18 && *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    [v3 cullFilesMaxFileCount:v18 - 1];
  }
LABEL_19:
}

- (BOOL)_slurpToFileUUID:(id)a3 slurpeeFileDescriptor:(int)a4 prefix:(id)a5 suffix:(id)a6 startNewFile:(BOOL)a7 sizeCheck:(int64_t)a8 wantsCompressed:(BOOL)a9 maxLogFileCount:(int)a10 outDidCreateNewFile:(BOOL *)a11 outNewFilePath:(id *)a12
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  v21 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8854000, v21, OS_LOG_TYPE_INFO, "Handling slurpFile", buf, 2u);
  }

  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v53 = 0;
  char v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  *(void *)buf = 0;
  v48 = buf;
  uint64_t v49 = 0x3032000000;
  char v50 = __Block_byref_object_copy__0;
  uint64_t v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  if (v19)
  {
    BOOL v22 = [v19 dataUsingEncoding:4];
  }
  else
  {
    BOOL v22 = 0;
  }
  int v33 = a4;
  if (v20)
  {
    v23 = [v20 dataUsingEncoding:4];
    int64_t v24 = a8;
  }
  else
  {
    int64_t v24 = a8;
    v23 = 0;
  }
  uint64_t v25 = _fileOpsQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __160__DACPLogShared__slurpToFileUUID_slurpeeFileDescriptor_prefix_suffix_startNewFile_sizeCheck_wantsCompressed_maxLogFileCount_outDidCreateNewFile_outNewFilePath___block_invoke;
  block[3] = &unk_1E6574530;
  void block[4] = self;
  id v35 = v18;
  id v36 = v23;
  BOOL v45 = a7;
  uint64_t v39 = &v61;
  uint64_t v40 = buf;
  id v37 = v22;
  __int16 v38 = &v57;
  id v41 = &v53;
  int64_t v42 = v24;
  BOOL v46 = a9;
  int v43 = v33;
  int v44 = a10;
  id v26 = v35;
  id v27 = v22;
  id v28 = v23;
  dispatch_sync(v25, block);

  if (*((unsigned char *)v62 + 24))
  {
    long long v29 = DALoggingwithCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v65 = 138412290;
      id v66 = v26;
      _os_log_impl(&dword_1C8854000, v29, OS_LOG_TYPE_ERROR, "Slurp to file UUID resulted in an error. UUID: %@.", v65, 0xCu);
    }
  }
  else
  {
    *((unsigned char *)v58 + 24) ^= 1u;
    if (a11) {
      *a11 = *((unsigned char *)v54 + 24);
    }
    if (a12)
    {
      long long v32 = (void *)*((void *)v48 + 5);
      if (v32) {
        *a12 = v32;
      }
    }
  }
  BOOL v30 = *((unsigned char *)v58 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);

  return v30;
}

void __160__DACPLogShared__slurpToFileUUID_slurpeeFileDescriptor_prefix_suffix_startNewFile_sizeCheck_wantsCompressed_maxLogFileCount_outDidCreateNewFile_outNewFilePath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __160__DACPLogShared__slurpToFileUUID_slurpeeFileDescriptor_prefix_suffix_startNewFile_sizeCheck_wantsCompressed_maxLogFileCount_outDidCreateNewFile_outNewFilePath___block_invoke_124;
    aBlock[3] = &unk_1E6574508;
    int v25 = *(_DWORD *)(a1 + 104);
    uint64_t v24 = *(void *)(a1 + 72);
    id v4 = v2;
    id v22 = v4;
    id v23 = *(id *)(a1 + 48);
    uint64_t v5 = (void (**)(void))_Block_copy(aBlock);
    if (*(unsigned char *)(a1 + 112))
    {
      uint64_t v6 = [v4 startNewFile];
      uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
LABEL_20:

        goto LABEL_21;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      uint64_t v9 = *(void *)(a1 + 56);
      if (v9) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v4 logData:v9 outDidCreateNewFile:0 outNewFilePath:0] ^ 1;
      }
      v5[2](v5);
    }
    else
    {
      if (*(uint64_t *)(a1 + 96) < 1)
      {
        id v11 = 0;
      }
      else
      {
        v20[1] = 0;
        objc_msgSend(v4, "checkForMaximumFileSize:wantsCompressed:outDidCreateNewFile:outNewFilePath:");
        id v11 = 0;
      }
      buf[0] = 0;
      uint64_t v12 = *(void *)(a1 + 56);
      v20[0] = 0;
      char v13 = [v4 logData:v12 outDidCreateNewFile:buf outNewFilePath:v20];
      id v14 = v20[0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v13 ^ 1;
      v5[2](v5);
      if (buf[0])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
        id v15 = v14;

        id v11 = v15;
      }
      uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v11;
      id v18 = v11;
    }
    uint64_t v19 = *(int *)(a1 + 108);
    if (v19 && *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
      [v4 cullFilesMaxFileCount:v19 - 1];
    }
    goto LABEL_20;
  }
  uint64_t v10 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8854000, v10, OS_LOG_TYPE_ERROR, "Cannot find UUID. Asking client to retry.", buf, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
LABEL_21:
}

uint64_t __160__DACPLogShared__slurpToFileUUID_slurpeeFileDescriptor_prefix_suffix_startNewFile_sizeCheck_wantsCompressed_maxLogFileCount_outDidCreateNewFile_outNewFilePath___block_invoke_124(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56) != -1)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:*(unsigned int *)(a1 + 56) closeOnDealloc:0];
    if (v2)
    {
      memset(&v7, 0, sizeof(v7));
      if (fstat(*(_DWORD *)(a1 + 56), &v7))
      {
        v3 = 0;
      }
      else if (v7.st_size < 4096)
      {
LABEL_10:
        v3 = [v2 readDataToEndOfFile];
        if ([v3 length]) {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= [*(id *)(a1 + 32) logData:v3 outDidCreateNewFile:0 outNewFilePath:0] ^ 1;
        }
      }
      else
      {
        uint64_t v4 = 0;
        v3 = 0;
        while (1)
        {
          uint64_t v5 = v3;
          v3 = [v2 readDataOfLength:4096];

          if (![v3 length]) {
            break;
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= [*(id *)(a1 + 32) logData:v3 outDidCreateNewFile:0 outNewFilePath:0] ^ 1;
          v4 -= 4096;
          if (v7.st_size + v4 < 4096)
          {

            goto LABEL_10;
          }
        }
      }
    }
  }
  uint64_t result = [*(id *)(a1 + 32) logData:*(void *)(a1 + 40) outDidCreateNewFile:0 outNewFilePath:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= result ^ 1;
  return result;
}

- (void).cxx_destruct
{
}

@end