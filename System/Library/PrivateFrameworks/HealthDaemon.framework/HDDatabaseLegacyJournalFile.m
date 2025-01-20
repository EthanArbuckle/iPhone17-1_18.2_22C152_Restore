@interface HDDatabaseLegacyJournalFile
+ (id)_loadJournalEntry:(uint64_t)a1;
+ (uint64_t)_processOkemoJournalWithVersion:(uint64_t)a1 fileHandle:(void *)a2 mapping:(uint64_t)a3 size:(uint64_t)a4 headerLength:(uint64_t)a5 profile:(void *)a6 error:(uint64_t)a7 handler:(void *)a8;
- (BOOL)appendData:(id)a3 entryClass:(Class)a4 error:(id *)a5;
- (BOOL)canAppendData:(id)a3;
- (BOOL)createAndOpenForWritingWithError:(id *)a3;
- (BOOL)flushDataToDisk:(id *)a3;
- (BOOL)isOpen;
- (BOOL)openForReadingWithError:(id *)a3;
- (BOOL)removeWithError:(id *)a3;
- (HDDatabaseLegacyJournalFile)init;
- (HDDatabaseLegacyJournalFile)initWithURL:(id)a3;
- (NSString)description;
- (NSString)journalPath;
- (NSString)name;
- (double)modificationTime;
- (id)_fullPath;
- (int64_t)size;
- (unsigned)enumerateEntriesWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6;
- (unsigned)readVersionWithError:(id *)a3;
- (void)close;
- (void)dealloc;
@end

@implementation HDDatabaseLegacyJournalFile

- (HDDatabaseLegacyJournalFile)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDatabaseLegacyJournalFile)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDDatabaseLegacyJournalFile;
  v6 = [(HDDatabaseLegacyJournalFile *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    v7->_version = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(HDDatabaseLegacyJournalFile *)self close];
  v3.receiver = self;
  v3.super_class = (Class)HDDatabaseLegacyJournalFile;
  [(HDDatabaseLegacyJournalFile *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = -[HDDatabaseLegacyJournalFile _fullPath]((id *)&self->super.isa);
  BOOL v5 = [(HDDatabaseLegacyJournalFile *)self isOpen];
  v6 = @"closed";
  if (v5) {
    v6 = @"open";
  }
  v7 = [v3 stringWithFormat:@"%@ (%@)", v4, v6];

  return (NSString *)v7;
}

- (id)_fullPath
{
  if (a1)
  {
    a1 = [a1[1] path];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NSString)name
{
  return [(NSURL *)self->_URL lastPathComponent];
}

- (NSString)journalPath
{
  v2 = [(NSURL *)self->_URL path];
  objc_super v3 = [v2 stringByDeletingLastPathComponent];

  return (NSString *)v3;
}

- (BOOL)isOpen
{
  return self->_fileHandle != 0;
}

- (int64_t)size
{
  URL = self->_URL;
  id v4 = 0;
  [(NSURL *)URL getResourceValue:&v4 forKey:*MEMORY[0x1E4F1C5F8] error:0];
  return [v4 integerValue];
}

- (double)modificationTime
{
  URL = self->_URL;
  id v8 = 0;
  [(NSURL *)URL getResourceValue:&v8 forKey:*MEMORY[0x1E4F1C530] error:0];
  if (v8)
  {
    [v8 timeIntervalSinceReferenceDate];
    return v3;
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v5 timeIntervalSinceReferenceDate];
    double v4 = v6;
  }
  return v4;
}

- (BOOL)openForReadingWithError:(id *)a3
{
  if ([(HDDatabaseLegacyJournalFile *)self isOpen])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDDatabaseLegacyJournalFile.m", 101, @"Cannot open %@ because it is already open", self object file lineNumber description];
  }
  double v6 = [(HDDatabaseLegacyJournalFile *)self name];
  id v7 = [(HDDatabaseLegacyJournalFile *)self journalPath];
  id v8 = v6;
  self;
  objc_super v9 = [v7 stringByAppendingPathComponent:v8];

  v10 = (void *)MEMORY[0x1E4F28CB0];
  v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
  id v16 = 0;
  v12 = [v10 fileHandleForReadingFromURL:v11 error:&v16];
  id v13 = v16;

  if (!v12) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a3, 102, @"Error opening journal file", v13);
  }

  if (v12) {
    objc_storeStrong((id *)&self->_fileHandle, v12);
  }

  return v12 != 0;
}

- (void)close
{
  fileHandle = self->_fileHandle;
  self->_fileHandle = 0;
  double v3 = fileHandle;

  [(NSFileHandle *)v3 closeFile];
}

- (BOOL)removeWithError:(id *)a3
{
  [(NSURL *)self->_URL removeAllCachedResourceValues];
  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v6 = -[HDDatabaseLegacyJournalFile _fullPath]((id *)&self->super.isa);
  LOBYTE(a3) = [v5 removeItemAtPath:v6 error:a3];

  return (char)a3;
}

- (unsigned)readVersionWithError:(id *)a3
{
  p_unsigned int version = &self->_version;
  unsigned int version = self->_version;
  if (version) {
    return version;
  }
  if (![(HDDatabaseLegacyJournalFile *)self isOpen])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Cannot read journal version if journal file is not open");
    return 0;
  }
  if (![(NSFileHandle *)self->_fileHandle seekToOffset:0 error:a3]) {
    return 0;
  }
  fileHandle = self->_fileHandle;
  id v11 = 0;
  BOOL v8 = [(NSFileHandle *)fileHandle hk_readValue:p_version ofSize:4 error:&v11];
  id v9 = v11;
  if (v8)
  {
    unsigned int version = *p_version;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a3, 100, @"Failed to read journal version", v9);
    unsigned int version = 0;
  }

  return version;
}

- (unsigned)enumerateEntriesWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  if ([(HDDatabaseLegacyJournalFile *)self isOpen])
  {
    unsigned int v11 = [(HDDatabaseLegacyJournalFile *)self readVersionWithError:a5];
    if (v11)
    {
      unsigned int v12 = v11;
      id v13 = -[HDDatabaseLegacyJournalFile _fullPath]((id *)&self->super.isa);
      fileHandle = self->_fileHandle;
      id v15 = v13;
      id v16 = v9;
      v17 = fileHandle;
      id v18 = v10;
      uint64_t v19 = self;
      if ([(NSFileHandle *)v17 seekToOffset:4 error:a5])
      {
        memset(&v62, 0, sizeof(v62));
        int v20 = [(NSFileHandle *)v17 fileDescriptor];
        if ((fstat(v20, &v62) & 0x80000000) == 0)
        {
          v60 = v18;
          id v61 = v16;
          v21 = mmap(0, v62.st_size, 1, 2, v20, 0);
          if (v21 == (void *)-1)
          {
            _HKInitializeLogging();
            v22 = (void *)*MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              v44 = v22;
              int v45 = *__error();
              v46 = __error();
              v47 = strerror(*v46);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v45;
              LOWORD(v66) = 2080;
              *(void *)((char *)&v66 + 2) = v47;
              _os_log_error_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_ERROR, "Journal file could not be mapped: %d: %s", buf, 0x12u);
            }
            v21 = 0;
          }
          uint64_t v57 = (uint64_t)v21;
          off_t st_size = v62.st_size;
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&long long v66 = 3221225472;
          *((void *)&v66 + 1) = __92__HDDatabaseLegacyJournalFile__processJournalFile_profile_fileHandle_version_error_handler___block_invoke;
          v67 = &unk_1E62FBBE8;
          id v23 = v60;
          stat v69 = v62;
          id v68 = v23;
          v70 = sel__processJournalFile_profile_fileHandle_version_error_handler_;
          uint64_t v71 = v19;
          id v56 = v15;
          id v59 = v16;
          v58 = v17;
          v24 = buf;
          self;
          if (v12 - 1 < 2)
          {
            _HKInitializeLogging();
            v31 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v72 = 67109378;
              *(_DWORD *)&v72[4] = v12;
              __int16 v73 = 2114;
              v32 = v56;
              id v74 = v56;
              _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "Ignoring version %u journal %{public}@", v72, 0x12u);
              unsigned int v26 = 2;
              id v18 = v60;
              v25 = (void *)v57;
            }
            else
            {
              unsigned int v26 = 2;
              id v18 = v60;
              v32 = v56;
              v25 = (void *)v57;
            }
            goto LABEL_29;
          }
          if (v12 - 3 >= 2)
          {
            if (v12 == 5)
            {
              v33 = v58;
              id v34 = v59;
              v53 = v24;
              uint64_t v51 = self;
              unsigned __int8 v64 = 0;
              *(void *)v72 = 0;
              BOOL v35 = [(NSFileHandle *)v33 hk_readValue:&v64 ofSize:1 error:v72];
              id v36 = *(id *)v72;
              v52 = v33;
              v54 = v34;
              if (v35)
              {
                id v37 = objc_alloc(MEMORY[0x1E4F1CA58]);
                id v50 = (id) [v37 initWithCapacity:v64];
                uint64_t v38 = [v50 mutableBytes];
                id v63 = v36;
                BOOL v39 = [(NSFileHandle *)v33 hk_readValue:v38 ofSize:v64 error:&v63];
                id v40 = v63;

                id v49 = v40;
                if (v39)
                {
                  v25 = (void *)v57;
                  unsigned int v26 = +[HDDatabaseLegacyJournalFile _processOkemoJournalWithVersion:fileHandle:mapping:size:headerLength:profile:error:handler:](v51, v33, v57, st_size, v64 + 5, v54, (uint64_t)a5, v53);
                  id v18 = v60;
                  id v16 = v61;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a5, 100, @"Unable to read build number from journal file", v40);
                  unsigned int v26 = 2;
                  id v18 = v60;
                  id v16 = v61;
                  v25 = (void *)v57;
                }
                v32 = v56;

                v42 = v49;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a5, 100, @"Unable to read build length from journal file", v36);
                unsigned int v26 = 2;
                v42 = v36;
                id v18 = v60;
                id v16 = v61;
                v32 = v56;
                v25 = (void *)v57;
              }

              goto LABEL_29;
            }
            _HKInitializeLogging();
            v41 = *MEMORY[0x1E4F29F18];
            id v18 = v60;
            v25 = (void *)v57;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v72 = 67109378;
              *(_DWORD *)&v72[4] = v12;
              __int16 v73 = 2112;
              v32 = v56;
              id v74 = v56;
              _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "Unexpected journal version %u at path %@", v72, 0x12u);
              unsigned int v26 = 2;
              goto LABEL_29;
            }
            unsigned int v26 = 2;
          }
          else
          {
            v25 = (void *)v57;
            unsigned int v26 = +[HDDatabaseLegacyJournalFile _processOkemoJournalWithVersion:fileHandle:mapping:size:headerLength:profile:error:handler:]((uint64_t)HDDatabaseLegacyJournalFile, v58, v57, st_size, 4, v59, (uint64_t)a5, v24);
            id v18 = v60;
          }
          v32 = v56;
LABEL_29:

          if (v25) {
            munmap(v25, v62.st_size);
          }

          goto LABEL_32;
        }
        v27 = (void *)MEMORY[0x1E4F28C58];
        id v28 = v18;
        uint64_t v29 = *__error();
        v30 = __error();
        uint64_t v48 = v29;
        id v18 = v28;
        objc_msgSend(v27, "hk_assignError:code:format:", a5, 102, @"Journal file fstat failed: %d: %s", v48, strerror(*v30));
      }
      unsigned int v26 = 0;
LABEL_32:

      goto LABEL_33;
    }
    unsigned int v26 = 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 100, @"Journal is not open");
    unsigned int v26 = 0;
  }
LABEL_33:

  return v26;
}

+ (id)_loadJournalEntry:(uint64_t)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v2 error:0];

  [v3 setClass:objc_opt_class() forClassName:@"_UserDefaultUpdatedJournalEntry"];
  [v3 setClass:objc_opt_class() forClassName:@"_UserDefaultRemovedJournalEntry"];
  double v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  if (!v4 || ([v3 error], BOOL v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    _HKInitializeLogging();
    double v6 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
    {
      BOOL v8 = v6;
      id v9 = [v3 error];
      int v10 = 138543362;
      unsigned int v11 = v9;
      _os_log_fault_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_FAULT, "Error occurred while decoding journal entry: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }

  return v4;
}

uint64_t __92__HDDatabaseLegacyJournalFile__processJournalFile_profile_fileHandle_version_error_handler___block_invoke(void *a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(a1[4] + 16))();
  if (v2 == 4)
  {
    double v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = a1[23];
    uint64_t v5 = a1[24];
    id v7 = HDStringFromJournalProcessingResult(4u);
    [v4 handleFailureInMethod:v6, v5, @"HDDatabaseLegacyJournalFile.m", 329, @"%@ does not support %@", v5, v7 object file lineNumber description];
  }
  return v2;
}

+ (uint64_t)_processOkemoJournalWithVersion:(uint64_t)a1 fileHandle:(void *)a2 mapping:(uint64_t)a3 size:(uint64_t)a4 headerLength:(uint64_t)a5 profile:(void *)a6 error:(uint64_t)a7 handler:(void *)a8
{
  id v10 = a2;
  id v11 = a6;
  id v12 = a8;
  self;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 3;
  id v15 = v10;
  id v16 = v12;
  HKWithAutoreleasePool();
  uint64_t v13 = *((unsigned int *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return v13;
}

uint64_t __122__HDDatabaseLegacyJournalFile__processOkemoJournalWithVersion_fileHandle_mapping_size_headerLength_profile_error_handler___block_invoke(void *a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  uint64_t v5 = v4;
  uint64_t v6 = a1[7];
  id v7 = (os_log_t *)MEMORY[0x1E4F29F18];
  if (v6)
  {
    uint64_t v8 = a1[9];
    uint64_t v9 = a1[10];
    uint64_t v10 = self;
    id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = (unsigned int *)(v9 + v6);
    unint64_t v12 = v8 + v6;
    unint64_t v13 = v8 + v6 - 4;
    uint64_t v68 = v6;
    if ((unint64_t)v11 >= v13)
    {
      v33 = 0;
    }
    else
    {
      uint64_t v67 = v8;
      stat v69 = v5;
      uint64_t v71 = a2;
      __int16 v73 = a1;
      while (1)
      {
        v14 = v11 + 1;
        uint64_t v15 = *v11;
        id v11 = (unsigned int *)((char *)v11 + v15 + 4);
        if ((unint64_t)v11 > v12) {
          break;
        }
        id v16 = (void *)MEMORY[0x1C187C0E0]();
        uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v14 length:v15 freeWhenDone:0];
        if (v17)
        {
          id v18 = +[HDDatabaseLegacyJournalFile _loadJournalEntry:](v10, v17);
          if (v18)
          {
            [v75 addObject:v18];
          }
          else
          {
            _HKInitializeLogging();
            uint64_t v19 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v78 = v15;
              *(_WORD *)&v78[4] = 2048;
              *(void *)&v78[6] = (char *)v14 - v68;
              _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "Failed to load journal entry (%d bytes at offset %lu); skipping.",
                buf,
                0x12u);
            }
          }
        }
        if ((unint64_t)v11 >= v13)
        {
          v33 = 0;
          goto LABEL_25;
        }
      }
      v33 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"*** Journal file too short for expected data, Offset: %lu Length: %d, fileSize: %ld", (char *)v14 - v68, v15, v67);
      id v11 = v14;
LABEL_25:
      a2 = v71;
      a1 = v73;
      id v7 = (os_log_t *)MEMORY[0x1E4F29F18];
      uint64_t v5 = v69;
    }
    _HKInitializeLogging();
    id v34 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v78 = ((unint64_t)v11 - v68) >> 10;
      _os_log_debug_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_DEBUG, "Processed file size %luK.", buf, 0xCu);
    }
    id v35 = v75;
    id v36 = v33;
    if (v36)
    {
      id v37 = v36;
      if (a2) {
        *a2 = v36;
      }
      else {
        _HKLogDroppedError();
      }

      id v38 = v35;
      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 2;
      _HKInitializeLogging();
      os_log_t v44 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      id v40 = v44;
      [v5 timeIntervalSinceNow];
      double v46 = -v45;
      uint64_t v47 = [v38 count];
      uint64_t v48 = *a2;
      *(_DWORD *)buf = 134218498;
      *(double *)v78 = v46;
      *(_WORD *)&v78[8] = 2048;
      *(void *)&v78[10] = v47;
      __int16 v79 = 2114;
      uint64_t v80 = v48;
      _os_log_error_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_ERROR, "Map load time: %0.2f, entries: %ld, error: %{public}@", buf, 0x20u);
    }
    else
    {

      id v38 = v35;
      _HKInitializeLogging();
      os_log_t v39 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_45;
      }
      id v40 = v39;
      [v5 timeIntervalSinceNow];
      double v42 = -v41;
      uint64_t v43 = [v38 count];
      *(_DWORD *)buf = 134218240;
      *(double *)v78 = v42;
      *(_WORD *)&v78[8] = 2048;
      *(void *)&v78[10] = v43;
      _os_log_debug_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_DEBUG, "Map load time: %0.2f, entries: %ld", buf, 0x16u);
    }
  }
  else
  {
    int v20 = (void *)a1[4];
    if (!v20)
    {
      id v38 = 0;
      goto LABEL_45;
    }
    v70 = v4;
    v72 = a2;
    id v74 = a1;
    id v21 = v20;
    uint64_t v22 = self;
    id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v23 = 0;
    while (1)
    {
      v24 = (void *)MEMORY[0x1C187C0E0]();
      v25 = [v21 readDataOfLength:4];
      if ([v25 length] != 4) {
        break;
      }
      id v26 = v25;
      uint64_t v27 = *(unsigned int *)[v26 bytes];
      id v28 = [v21 readDataOfLength:v27];
      if ([v28 length] == v27)
      {
        uint64_t v29 = +[HDDatabaseLegacyJournalFile _loadJournalEntry:](v22, v28);
        if (v29)
        {
          v30 = (void *)v29;
          [v76 addObject:v29];
          char v31 = 1;
        }
        else
        {
          uint64_t v32 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Unknown journal entry (%lu bytes at offset %llu)", objc_msgSend(v28, "length"), objc_msgSend(v21, "offsetInFile") - objc_msgSend(v28, "length"));

          v30 = 0;
          char v31 = 0;
          id v23 = (void *)v32;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Journal file too short for expected data, Offset: %lu Length: %ld, fileSize: %llu", objc_msgSend(v28, "length"), v27, objc_msgSend(v21, "offsetInFile") - objc_msgSend(v28, "length"));
        char v31 = 0;
        id v23 = v30 = v23;
      }

      if ((v31 & 1) == 0) {
        goto LABEL_39;
      }
    }

LABEL_39:
    _HKInitializeLogging();
    id v7 = (os_log_t *)MEMORY[0x1E4F29F18];
    id v49 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
    {
      id v63 = v49;
      *(_DWORD *)buf = 134217984;
      *(void *)v78 = (unint64_t)[v21 offsetInFile] >> 10;
      _os_log_debug_impl(&dword_1BCB7D000, v63, OS_LOG_TYPE_DEBUG, "Processed file size %lluK.", buf, 0xCu);
    }
    id v50 = v76;

    id v38 = v50;
    a1 = v74;
    uint64_t v5 = v70;
    if (v23)
    {
      *(_DWORD *)(*(void *)(v74[6] + 8) + 24) = 2;
      _HKInitializeLogging();
      os_log_t v51 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      v52 = v51;
      [v70 timeIntervalSinceNow];
      double v54 = -v53;
      uint64_t v55 = [v38 count];
      uint64_t v56 = *v72;
      *(_DWORD *)buf = 134218498;
      *(double *)v78 = v54;
      *(_WORD *)&v78[8] = 2048;
      *(void *)&v78[10] = v55;
      __int16 v79 = 2114;
      uint64_t v80 = v56;
      _os_log_error_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_ERROR, "Load time: %0.2f, entries: %ld, error: %{public}@", buf, 0x20u);
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v57 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_45;
      }
      v52 = v57;
      [v70 timeIntervalSinceNow];
      double v65 = -v64;
      uint64_t v66 = [v38 count];
      *(_DWORD *)buf = 134218240;
      *(double *)v78 = v65;
      *(_WORD *)&v78[8] = 2048;
      *(void *)&v78[10] = v66;
      _os_log_debug_impl(&dword_1BCB7D000, v52, OS_LOG_TYPE_DEBUG, "Load time: %0.2f, entries: %ld", buf, 0x16u);
    }
  }
LABEL_45:
  if ([v38 count])
  {
    id v58 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);

    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();
    _HKInitializeLogging();
    os_log_t v59 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
    {
      v60 = v59;
      [v58 timeIntervalSinceNow];
      *(_DWORD *)buf = 134217984;
      *(double *)v78 = -v61;
      _os_log_debug_impl(&dword_1BCB7D000, v60, OS_LOG_TYPE_DEBUG, "Merge time: %0.2f", buf, 0xCu);
    }
  }
  else
  {
    id v58 = v5;
  }

  return 1;
}

- (BOOL)createAndOpenForWritingWithError:(id *)a3
{
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3328, @"HDDatabaseLegacyJournalFile does not support writing");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (a3) {
      *a3 = v4;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v4 == 0;
}

- (BOOL)canAppendData:(id)a3
{
  return 0;
}

- (BOOL)appendData:(id)a3 entryClass:(Class)a4 error:(id *)a5
{
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3328, @"HDDatabaseLegacyJournalFile does not support writing");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (a5) {
      *a5 = v6;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v6 == 0;
}

- (BOOL)flushDataToDisk:(id *)a3
{
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3328, @"HDDatabaseLegacyJournalFile does not support writing");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (a3) {
      *a3 = v4;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v4 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end