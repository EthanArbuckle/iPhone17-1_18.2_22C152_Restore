@interface WFArchiveEntry
+ (id)archiveEntriesWithTopLevelFileRepresentation:(id)a3 usedFilenames:(id)a4;
- (WFArchiveEntry)initWithDirectoryName:(id)a3;
- (WFArchiveEntry)initWithFilename:(id)a3 fileRepresentation:(id)a4;
- (WFArchiveEntry)initWithFilename:(id)a3 fileType:(unsigned __int16)a4 filePermission:(unsigned __int16)a5 fileSize:(int64_t)a6 modificationDate:(id)a7 creationDate:(id)a8 dataProvider:(id)a9;
- (archive_entry)entry;
- (id)dataProvider;
- (void)dealloc;
@end

@implementation WFArchiveEntry

- (void).cxx_destruct
{
}

- (id)dataProvider
{
  return self->_dataProvider;
}

- (archive_entry)entry
{
  return self->_entry;
}

- (void)dealloc
{
  archive_entry_free();
  v3.receiver = self;
  v3.super_class = (Class)WFArchiveEntry;
  [(WFArchiveEntry *)&v3 dealloc];
}

- (WFArchiveEntry)initWithFilename:(id)a3 fileType:(unsigned __int16)a4 filePermission:(unsigned __int16)a5 fileSize:(int64_t)a6 modificationDate:(id)a7 creationDate:(id)a8 dataProvider:(id)a9
{
  int v11 = a4;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  if (!v14)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFLibArchive.m", 123, @"Invalid parameter not satisfying: %@", @"filename" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)WFArchiveEntry;
  v18 = [(WFArchiveEntry *)&v25 init];
  if (v18)
  {
    v18->_entry = (archive_entry *)archive_entry_new();
    uint64_t v19 = [v17 copy];
    id dataProvider = v18->_dataProvider;
    v18->_id dataProvider = (id)v19;

    if (v11 == 0x4000 && ([v14 hasSuffix:@"/"] & 1) == 0)
    {
      uint64_t v21 = [v14 stringByAppendingString:@"/"];

      id v14 = (id)v21;
    }
    id v14 = v14;
    [v14 fileSystemRepresentation];
    archive_entry_set_pathname();
    archive_entry_set_filetype();
    archive_entry_set_perm();
    archive_entry_set_size();
    if (v15)
    {
      [v15 timeIntervalSince1970];
      archive_entry_set_mtime();
    }
    if (v16)
    {
      [v16 timeIntervalSince1970];
      archive_entry_set_ctime();
    }
    v22 = v18;
  }

  return v18;
}

- (WFArchiveEntry)initWithFilename:(id)a3 fileRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    id v6 = [v7 filename];
  }
  if ([v8 representationType] == 1
    && ([v8 fileURL],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_msgSend(v9, "wf_fileIsDirectory"),
        v9,
        (v10 & 1) != 0))
  {
    int v22 = 0;
    int v11 = 0;
    uint64_t v12 = 0x4000;
    uint64_t v13 = 493;
  }
  else
  {
    int v11 = v23;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __54__WFArchiveEntry_initWithFilename_fileRepresentation___block_invoke;
    v23[3] = &unk_2642884F8;
    uint64_t v21 = &v24;
    id v24 = v8;
    uint64_t v12 = 0x8000;
    uint64_t v13 = 420;
    int v22 = 1;
  }
  id v14 = _Block_copy(v11);
  id v15 = v6;
  if (!v6)
  {
    id v15 = [v8 filename];
  }
  uint64_t v16 = [v8 fileSize];
  id v17 = [v8 modificationDate];
  v18 = [v8 creationDate];
  uint64_t v19 = [(WFArchiveEntry *)self initWithFilename:v15 fileType:v12 filePermission:v13 fileSize:v16 modificationDate:v17 creationDate:v18 dataProvider:v14];

  if (!v6) {
  if (v22)
  }

  return v19;
}

uint64_t __54__WFArchiveEntry_initWithFilename_fileRepresentation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) inputStream];
}

- (WFArchiveEntry)initWithDirectoryName:(id)a3
{
  return [(WFArchiveEntry *)self initWithFilename:a3 fileType:0x4000 filePermission:493 fileSize:0 modificationDate:0 creationDate:0 dataProvider:0];
}

+ (id)archiveEntriesWithTopLevelFileRepresentation:(id)a3 usedFilenames:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 representationType] == 1
    && ([v5 fileURL],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = objc_msgSend(v7, "wf_fileIsDirectory"),
        v7,
        v8))
  {
    v37 = v6;
    v9 = [v5 fileURL];
    char v10 = objc_opt_new();
    id v11 = objc_alloc((Class)a1);
    uint64_t v12 = [v9 lastPathComponent];
    id v35 = v5;
    uint64_t v13 = [v11 initWithFilename:v12 fileRepresentation:v5];

    id v14 = v10;
    v34 = (void *)v13;
    [v10 addObject:v13];
    id v15 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v16 = [v9 path];
    id v17 = [v15 subpathsOfDirectoryAtPath:v16 error:0];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v17;
    uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          v23 = [v9 URLByAppendingPathComponent:v22];
          id v24 = +[WFFileRepresentation fileWithURL:v23 options:0];
          objc_super v25 = [v9 lastPathComponent];
          v26 = [v25 stringByAppendingPathComponent:v22];

          id v27 = objc_alloc((Class)a1);
          v28 = WFAvailableArchiveFilename(v26, v37);
          v29 = (void *)[v27 initWithFilename:v28 fileRepresentation:v24];

          [v14 addObject:v29];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v19);
    }
    v30 = obj;

    v31 = v34;
    id v5 = v35;
    id v6 = v37;
  }
  else
  {
    id v32 = objc_alloc((Class)a1);
    v9 = [v5 filename];
    v31 = WFAvailableArchiveFilename(v9, v6);
    v30 = (void *)[v32 initWithFilename:v31 fileRepresentation:v5];
    v43 = v30;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  }

  return v14;
}

@end