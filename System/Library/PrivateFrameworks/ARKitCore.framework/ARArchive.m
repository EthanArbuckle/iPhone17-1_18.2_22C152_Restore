@interface ARArchive
- (ARArchive)init;
- (ARArchive)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (ARArchive)initWithData:(id)a3 error:(id *)a4;
- (BOOL)_loadArchiveFromMemory:(id)a3 error:(id *)a4;
- (BOOL)_loadArchiveFromURL:(id)a3 error:(id *)a4;
- (BOOL)_readDataForEntry:(archive_entry *)a3 archive:(archive *)a4;
- (BOOL)_readDataFromArchive:(archive *)a3;
- (BOOL)_writeToArchive:(archive *)a3;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (NSArray)filePaths;
- (archive)_createArchiveForReading;
- (id)dataForResource:(id)a3 withExtension:(id)a4;
- (id)dataForResourceAtPath:(id)a3;
- (id)dataRepresentation;
- (void)addData:(id)a3 withFilename:(id)a4 extension:(id)a5;
- (void)addData:(id)a3 withPath:(id)a4;
@end

@implementation ARArchive

- (ARArchive)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARArchive;
  v2 = [(ARArchive *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dataByPath = v2->_dataByPath;
    v2->_dataByPath = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (ARArchive)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(ARArchive *)self init];
  v8 = v7;
  if (v7 && ![(ARArchive *)v7 _loadArchiveFromURL:v6 error:a4]) {
    v9 = 0;
  }
  else {
    v9 = v8;
  }

  return v9;
}

- (ARArchive)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(ARArchive *)self init];
  v8 = v7;
  if (v7 && ![(ARArchive *)v7 _loadArchiveFromMemory:v6 error:a4]) {
    v9 = 0;
  }
  else {
    v9 = v8;
  }

  return v9;
}

- (NSArray)filePaths
{
  return (NSArray *)[(NSMutableDictionary *)self->_dataByPath allKeys];
}

- (void)addData:(id)a3 withFilename:(id)a4 extension:(id)a5
{
  id v8 = a3;
  id v9 = [a4 stringByAppendingPathExtension:a5];
  [(ARArchive *)self addData:v8 withPath:v9];
}

- (void)addData:(id)a3 withPath:(id)a4
{
}

- (id)dataForResource:(id)a3 withExtension:(id)a4
{
  v5 = [a3 stringByAppendingPathExtension:a4];
  id v6 = [(ARArchive *)self dataForResourceAtPath:v5];

  return v6;
}

- (id)dataForResourceAtPath:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_dataByPath objectForKeyedSubscript:a3];
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = archive_write_new();
  if (v7)
  {
    uint64_t v8 = v7;
    archive_write_set_format_zip();
    id v9 = v6;
    [v9 fileSystemRepresentation];
    if (archive_write_open_filename())
    {
      archive_write_free();
    }
    else
    {
      BOOL v17 = [(ARArchive *)self _writeToArchive:v8];
      archive_write_free();
      if (v17)
      {
        LOBYTE(a4) = 1;
        goto LABEL_15;
      }
    }
    v18 = _ARLogGeneral_29();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      v21 = [v9 path];
      *(_DWORD *)buf = 138543875;
      v28 = v20;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2113;
      v32 = v21;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to write to archive at path: %{private}@.", buf, 0x20u);
    }
    if (a4)
    {
      uint64_t v23 = *MEMORY[0x1E4F289D0];
      id v24 = v9;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      goto LABEL_14;
    }
  }
  else
  {
    v10 = _ARLogGeneral_29();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = [v6 path];
      *(_DWORD *)buf = 138543875;
      v28 = v12;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2113;
      v32 = v13;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create archive at path: %{private}@.", buf, 0x20u);
    }
    if (a4)
    {
      uint64_t v25 = *MEMORY[0x1E4F28588];
      v14 = ARKitCoreBundle();
      v15 = [v14 localizedStringForKey:@"Unable to create archive." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      v26 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

LABEL_14:
      ARErrorWithCodeAndUserInfo(500, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
LABEL_15:

  return (char)a4;
}

- (id)dataRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = archive_write_new();
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = objc_opt_new();
    archive_write_set_format_zip();
    if (archive_write_open())
    {
      archive_write_free();
    }
    else
    {
      BOOL v8 = [(ARArchive *)self _writeToArchive:v4];
      archive_write_free();
      if (v8)
      {
        v5 = v5;
        id v9 = v5;
        goto LABEL_12;
      }
    }
    uint64_t v7 = _ARLogGeneral_29();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to write archive to memory", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_10;
  }
  v5 = _ARLogGeneral_29();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v13 = 138543618;
    v14 = v7;
    __int16 v15 = 2048;
    v16 = self;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create archive.", (uint8_t *)&v13, 0x16u);
LABEL_10:
  }
  id v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)_loadArchiveFromMemory:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    if (!a4)
    {
LABEL_15:
      BOOL v22 = 0;
      goto LABEL_16;
    }
    uint64_t v40 = *MEMORY[0x1E4F28588];
    int v13 = ARKitCoreBundle();
    v14 = [v13 localizedStringForKey:@"Unable to read archive from memory." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
    v41[0] = v14;
    __int16 v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = (void **)v41;
    uint64_t v17 = &v40;
LABEL_14:
    v21 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];

    ARErrorWithCodeAndUserInfo(500, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  uint64_t v7 = [(ARArchive *)self _createArchiveForReading];
  if (!v7)
  {
    v18 = _ARLogGeneral_29();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138543618;
      v37 = v20;
      __int16 v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Cannot read archive from memory", buf, 0x16u);
    }
    if (!a4) {
      goto LABEL_15;
    }
    uint64_t v34 = *MEMORY[0x1E4F28588];
    int v13 = ARKitCoreBundle();
    v14 = [v13 localizedStringForKey:@"Unable to read archive from memory." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
    v35 = v14;
    __int16 v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = &v35;
    uint64_t v17 = &v34;
    goto LABEL_14;
  }
  BOOL v8 = v7;
  id v9 = v6;
  [v9 bytes];
  [v9 length];
  if (archive_read_open_memory())
  {
    archive_read_free();
    v10 = _ARLogGeneral_29();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543618;
      v37 = v12;
      __int16 v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Cannot read archive from memory", buf, 0x16u);
    }
    if (!a4) {
      goto LABEL_15;
    }
    uint64_t v32 = *MEMORY[0x1E4F28588];
    int v13 = ARKitCoreBundle();
    v14 = [v13 localizedStringForKey:@"Unable to read archive from memory." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
    uint64_t v33 = v14;
    __int16 v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = &v33;
    uint64_t v17 = &v32;
    goto LABEL_14;
  }
  BOOL v22 = [(ARArchive *)self _readDataFromArchive:v8];
  if (!v22)
  {
    id v24 = _ARLogGeneral_29();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138543618;
      v37 = v26;
      __int16 v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Cannot read archive from memory", buf, 0x16u);
    }
    if (a4)
    {
      uint64_t v30 = *MEMORY[0x1E4F28588];
      v27 = ARKitCoreBundle();
      v28 = objc_msgSend(v27, "localizedStringForKey:value:table:", @"Unable to read archive from memory.", &stru_1F120C8F0, @"Localizable_iOS", v30);
      __int16 v31 = v28;
      __int16 v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];

      ARErrorWithCodeAndUserInfo(500, v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  archive_read_free();
LABEL_16:

  return v22;
}

- (BOOL)_loadArchiveFromURL:(id)a3 error:(id *)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v18 = _ARLogGeneral_29();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138543618;
      v41 = v20;
      __int16 v42 = 2048;
      v43 = self;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Cannot read archive from nil URL", buf, 0x16u);
    }
    if (!a4) {
      goto LABEL_17;
    }
    uint64_t v46 = *MEMORY[0x1E4F289D0];
    v47[0] = @"NULL";
    __int16 v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = (id *)v47;
    uint64_t v17 = &v46;
    goto LABEL_16;
  }
  uint64_t v7 = [(ARArchive *)self _createArchiveForReading];
  if (!v7)
  {
    v21 = _ARLogGeneral_29();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      id v24 = [v6 path];
      *(_DWORD *)buf = 138543875;
      v41 = v23;
      __int16 v42 = 2048;
      v43 = self;
      __int16 v44 = 2113;
      v45 = v24;
      _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to read archive at path: %{private}@.", buf, 0x20u);
    }
    if (!a4) {
      goto LABEL_17;
    }
    uint64_t v38 = *MEMORY[0x1E4F289D0];
    id v39 = v6;
    __int16 v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = &v39;
    uint64_t v17 = &v38;
    goto LABEL_16;
  }
  BOOL v8 = v7;
  id v9 = [v6 path];
  [v9 UTF8String];
  int open_filename = archive_read_open_filename();

  if (open_filename)
  {
    archive_read_free();
    v11 = _ARLogGeneral_29();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      int v13 = NSStringFromClass(v12);
      v14 = [v6 path];
      *(_DWORD *)buf = 138543875;
      v41 = v13;
      __int16 v42 = 2048;
      v43 = self;
      __int16 v44 = 2113;
      v45 = v14;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to read archive at path: %{private}@.", buf, 0x20u);
    }
    if (!a4) {
      goto LABEL_17;
    }
    uint64_t v36 = *MEMORY[0x1E4F289D0];
    id v37 = v6;
    __int16 v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = &v37;
    uint64_t v17 = &v36;
LABEL_16:
    uint64_t v25 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
    ARErrorWithCodeAndUserInfo(500, v25);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
    BOOL v26 = 0;
    goto LABEL_18;
  }
  BOOL v26 = [(ARArchive *)self _readDataFromArchive:v8];
  if (!v26)
  {
    v28 = _ARLogGeneral_29();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      __int16 v29 = (objc_class *)objc_opt_class();
      uint64_t v30 = NSStringFromClass(v29);
      __int16 v31 = [v6 path];
      *(_DWORD *)buf = 138543875;
      v41 = v30;
      __int16 v42 = 2048;
      v43 = self;
      __int16 v44 = 2113;
      v45 = v31;
      _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to read archive at path: %{private}@.", buf, 0x20u);
    }
    if (a4)
    {
      v34[0] = *MEMORY[0x1E4F28588];
      uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s", archive_error_string());
      v34[1] = *MEMORY[0x1E4F289D0];
      v35[0] = v32;
      v35[1] = v6;
      uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

      ARErrorWithCodeAndUserInfo(500, v33);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  archive_read_free();
LABEL_18:

  return v26;
}

- (BOOL)_writeToArchive:(archive *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_dataByPath;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [(NSMutableDictionary *)self->_dataByPath objectForKeyedSubscript:v8];
        archive_entry_new();
        [v8 fileSystemRepresentation];
        archive_entry_set_pathname();
        [v9 length];
        archive_entry_set_size();
        archive_entry_set_filetype();
        archive_entry_set_perm();
        time(0);
        archive_entry_set_birthtime();
        archive_entry_set_ctime();
        archive_entry_set_mtime();
        archive_entry_set_atime();
        if (archive_write_header())
        {
          archive_entry_free();
LABEL_13:

          BOOL v13 = 0;
          goto LABEL_14;
        }
        id v10 = v9;
        [v10 bytes];
        [v10 length];
        uint64_t v11 = archive_write_data();
        uint64_t v12 = [v10 length];
        archive_entry_free();
        if (v11 != v12) {
          goto LABEL_13;
        }
      }
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      BOOL v13 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v13 = 1;
  }
LABEL_14:

  return v13;
}

- (archive)_createArchiveForReading
{
  v2 = (archive *)archive_read_new();
  if (v2)
  {
    archive_read_support_format_zip();
    archive_read_support_filter_compress();
  }
  return v2;
}

- (BOOL)_readDataFromArchive:(archive *)a3
{
  while (1)
  {
    unsigned int next_header = archive_read_next_header();
    if (next_header) {
      break;
    }
    if (archive_entry_filetype() == 0x8000
      && [(ARArchive *)self _readDataForEntry:0 archive:a3])
    {
      unsigned int next_header = 1;
      return next_header < 2;
    }
  }
  return next_header < 2;
}

- (BOOL)_readDataForEntry:(archive_entry *)a3 archive:(archive *)a4
{
  uint64_t v4 = ((uint64_t (*)(ARArchive *, SEL, archive_entry *, archive *))MEMORY[0x1F4188790])(self, a2, a3, a4);
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [NSString stringWithUTF8String:archive_entry_pathname()];
  if (!v5)
  {
    uint64_t v6 = _ARLogGeneral_29();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    BOOL v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138543618;
    long long v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = v4;
    _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to construct path", buf, 0x16u);
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v6 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t data = archive_read_data();
  if (data >= 1)
  {
    do
    {
      [v6 appendBytes:buf length:data];
      uint64_t data = archive_read_data();
    }
    while (data > 0);
  }
  if (data < 0)
  {
    id v9 = _ARLogGeneral_29();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      int v13 = 138543618;
      v14 = v11;
      __int16 v15 = 2048;
      uint64_t v16 = v4;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not read data to buffer.", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_10;
  }
  [*(id *)(v4 + 8) setObject:v6 forKeyedSubscript:v5];
LABEL_11:

  return 0;
}

- (void).cxx_destruct
{
}

@end