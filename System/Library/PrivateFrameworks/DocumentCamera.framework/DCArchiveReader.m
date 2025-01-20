@interface DCArchiveReader
- (BOOL)moveContentsOfDirectory:(id)a3 toDirectory:(id)a4 resultURLs:(id *)a5 error:(id *)a6;
- (BOOL)overwrite;
- (BOOL)skipsInvisibleHeaders;
- (BOOL)unarchiveResultURLs:(id *)a3 error:(id *)a4;
- (BOOL)unarchiveSourcePath:(id)a3 toDestinationPath:(id)a4 error:(id *)a5;
- (BOOL)writesTemporaryFilesInsideDestination;
- (DCArchiveReader)initWithSourceURL:(id)a3 destinationURL:(id)a4;
- (NSString)destinationPath;
- (NSString)sourcePath;
- (id)incrementalPathInDirectory:(id)a3 withFilename:(id)a4 andExtension:(id)a5;
- (id)temporaryDirectory;
- (void)setDestinationPath:(id)a3;
- (void)setOverwrite:(BOOL)a3;
- (void)setSkipsInvisibleHeaders:(BOOL)a3;
- (void)setSourcePath:(id)a3;
- (void)setWritesTemporaryFilesInsideDestination:(BOOL)a3;
@end

@implementation DCArchiveReader

- (DCArchiveReader)initWithSourceURL:(id)a3 destinationURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DCArchiveReader;
  v8 = [(DCArchiveReader *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 path];
    sourcePath = v8->_sourcePath;
    v8->_sourcePath = (NSString *)v9;

    uint64_t v11 = [v7 path];
    destinationPath = v8->_destinationPath;
    v8->_destinationPath = (NSString *)v11;

    v8->_writesTemporaryFilesInsideDestination = 1;
  }

  return v8;
}

- (BOOL)unarchiveResultURLs:(id *)a3 error:(id *)a4
{
  id v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [(DCArchiveReader *)self destinationPath];
  int v9 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:a4];

  if (v9)
  {
    v10 = [(DCArchiveReader *)self temporaryDirectory];
    if ([v7 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:a4])
    {
      uint64_t v11 = [(DCArchiveReader *)self sourcePath];
      BOOL v12 = [(DCArchiveReader *)self unarchiveSourcePath:v11 toDestinationPath:v10 error:a4];

      if (v12)
      {
        v13 = [(DCArchiveReader *)self destinationPath];
        BOOL v14 = [(DCArchiveReader *)self moveContentsOfDirectory:v10 toDirectory:v13 resultURLs:a3 error:a4];
      }
      else
      {
        BOOL v14 = 0;
      }
      [v7 removeItemAtPath:v10 error:0];
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)temporaryDirectory
{
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];

  if ([(DCArchiveReader *)self writesTemporaryFilesInsideDestination])
  {
    v5 = [(DCArchiveReader *)self destinationPath];
    id v6 = [NSString stringWithFormat:@".%@", v4];
    id v7 = [v5 stringByAppendingPathComponent:v6];
  }
  else
  {
    v5 = NSTemporaryDirectory();
    id v7 = [v5 stringByAppendingPathComponent:v4];
  }

  return v7;
}

- (BOOL)unarchiveSourcePath:(id)a3 toDestinationPath:(id)a4 error:(id *)a5
{
  v65[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v53 = a4;
  archive_read_new();
  MEMORY[0x21D44F460]();
  archive_read_support_format_all();
  archive_write_disk_new();
  archive_write_disk_set_standard_lookup();
  BOOL v8 = [(DCArchiveReader *)self skipsInvisibleHeaders];
  id v9 = v7;
  [v9 fileSystemRepresentation];
  v48 = v9;
  [v9 length];
  signed int open_filename = archive_read_open_filename();
  if (open_filename)
  {
    unsigned int v11 = open_filename;
    BOOL v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = open_filename;
    v57[0] = @"Unable to open archive";
    uint64_t v14 = *MEMORY[0x263F08338];
    v56[0] = *MEMORY[0x263F08320];
    v56[1] = v14;
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s", archive_error_string());
    v57[1] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
    uint64_t v17 = [v12 errorWithDomain:@"com.apple.documentcamera" code:v13 userInfo:v16];

    v18 = (void *)v17;
  }
  else
  {
    v18 = 0;
    uint64_t v51 = *MEMORY[0x263F08320];
    unint64_t v19 = 0x263F08000uLL;
    uint64_t v52 = *MEMORY[0x263F08338];
    BOOL v50 = v8;
    while (1)
    {
      unsigned int next_header = archive_read_next_header();
      if (next_header) {
        break;
      }
      context = (void *)MEMORY[0x21D44F7D0]();
      v21 = [*(id *)(v19 + 2880) stringWithUTF8String:archive_entry_pathname()];
      id v22 = [v53 stringByAppendingPathComponent:v21];
      [v22 fileSystemRepresentation];
      archive_entry_set_pathname();
      if (v8 && ([v21 hasPrefix:@"/."] & 1) != 0)
      {
        unsigned int v11 = 0;
        int v23 = 2;
      }
      else
      {
        v54 = v18;
        signed int v24 = archive_write_header();
        if (v24)
        {
          unsigned int v11 = v24;
          v25 = (void *)MEMORY[0x263F087E8];
          unint64_t v26 = v19;
          uint64_t v27 = v24;
          v58[0] = v51;
          v58[1] = v52;
          v59[0] = @"Unable to write header";
          v28 = objc_msgSend(*(id *)(v26 + 2880), "stringWithFormat:", @"%s", archive_error_string());
          v59[1] = v28;
          v29 = [NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
          uint64_t v30 = [v25 errorWithDomain:@"com.apple.documentcamera" code:v27 userInfo:v29];

          BOOL v8 = v50;
          int v23 = 3;
          v18 = (void *)v30;
        }
        else
        {
          while (1)
          {
            unsigned int data_block = archive_read_data_block();
            unsigned int v11 = data_block;
            if (data_block) {
              break;
            }
            if (archive_write_data_block())
            {
              v46 = (void *)MEMORY[0x263F087E8];
              v64[0] = v51;
              v64[1] = v52;
              v65[0] = @"Unable to write data";
              v32 = objc_msgSend(*(id *)(v19 + 2880), "stringWithFormat:", @"%s", archive_error_string());
              v65[1] = v32;
              v33 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
              uint64_t v47 = [v46 errorWithDomain:@"com.apple.documentcamera" code:-25 userInfo:v33];

              uint64_t v34 = v52;
              unint64_t v35 = 0x263F08000;
              v54 = (void *)v47;
              unint64_t v36 = v19;
              goto LABEL_17;
            }
          }
          if (data_block != 1)
          {
            unint64_t v36 = v19;
            unint64_t v35 = 0x263F08000uLL;
            uint64_t v34 = v52;
LABEL_17:
            v42 = *(void **)(v35 + 2024);
            v62[1] = v34;
            v63[0] = @"Unable to read data";
            v62[0] = v51;
            v38 = objc_msgSend(*(id *)(v36 + 2880), "stringWithFormat:", @"%s", archive_error_string());
            v63[1] = v38;
            v39 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
            v40 = v42;
            uint64_t v41 = (int)v11;
LABEL_18:
            uint64_t v43 = [v40 errorWithDomain:@"com.apple.documentcamera" code:v41 userInfo:v39];

            int v23 = 3;
            v18 = (void *)v43;
            BOOL v8 = v50;
            goto LABEL_19;
          }
          if (archive_write_finish_entry())
          {
            v37 = (void *)MEMORY[0x263F087E8];
            v61[0] = @"Unable to finish writing data";
            v60[0] = v51;
            v60[1] = v52;
            v38 = objc_msgSend(NSString, "stringWithFormat:", @"%s", archive_error_string());
            v61[1] = v38;
            v39 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
            v40 = v37;
            uint64_t v41 = 1;
            goto LABEL_18;
          }
          int v23 = 0;
        }
      }
LABEL_19:

      BOOL v44 = v23 == 3;
      unint64_t v19 = 0x263F08000;
      if (v44) {
        goto LABEL_24;
      }
    }
    unsigned int v11 = next_header;
  }
LABEL_24:
  archive_read_close();
  archive_read_finish();
  archive_write_close();
  archive_write_finish();
  if (a5) {
    *a5 = v18;
  }

  return v11 < 2;
}

- (BOOL)moveContentsOfDirectory:(id)a3 toDirectory:(id)a4 resultURLs:(id *)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  [MEMORY[0x263F08850] defaultManager];
  v39 = v38 = v10;
  BOOL v12 = [v39 contentsOfDirectoryAtPath:v10 error:a6];
  uint64_t v13 = v12;
  v37 = a6;
  if (*a6)
  {
    BOOL v14 = 0;
  }
  else
  {
    v31 = a5;
    if (a5)
    {
      v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    }
    else
    {
      v15 = 0;
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v32 = v13;
    id obj = v13;
    uint64_t v36 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v42;
      v33 = v15;
      while (2)
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v42 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v38, "stringByAppendingPathComponent:", v17, v31);
          unint64_t v19 = [v11 stringByAppendingPathComponent:v17];
          if ([(DCArchiveReader *)self overwrite])
          {
            v20 = (void *)v18;
            v21 = [NSURL fileURLWithPath:v18];
            id v22 = [NSURL fileURLWithPath:v19];
            id v40 = 0;
            int v23 = [v39 replaceItemAtURL:v22 withItemAtURL:v21 backupItemName:0 options:1 resultingItemURL:&v40 error:v37];
            id v24 = v40;
            v25 = v24;
            if (!v23)
            {

              unint64_t v26 = v19;
              v15 = v33;
LABEL_21:

              BOOL v14 = 0;
              goto LABEL_22;
            }
            unint64_t v26 = [v24 path];

            v15 = v33;
          }
          else
          {
            uint64_t v27 = [v17 stringByDeletingPathExtension];
            v28 = [v17 pathExtension];
            [(DCArchiveReader *)self incrementalPathInDirectory:v11 withFilename:v27 andExtension:v28];
            unint64_t v26 = v20 = (void *)v18;

            if (([v39 moveItemAtPath:v18 toPath:v26 error:v37] & 1) == 0) {
              goto LABEL_21;
            }
          }
          v29 = [NSURL fileURLWithPath:v26];
          [v15 addObject:v29];
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v36) {
          continue;
        }
        break;
      }
    }

    if (v15) {
      id *v31 = v15;
    }
    BOOL v14 = 1;
LABEL_22:
    uint64_t v13 = v32;
  }
  return v14;
}

- (id)incrementalPathInDirectory:(id)a3 withFilename:(id)a4 andExtension:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 stringByAppendingPathComponent:v8];
  if ([v9 length])
  {
    uint64_t v11 = [v10 stringByAppendingPathExtension:v9];

    id v10 = (void *)v11;
  }
  BOOL v12 = [MEMORY[0x263F08850] defaultManager];
  if ([v12 fileExistsAtPath:v10])
  {
    uint64_t v13 = 2;
    do
    {
      BOOL v14 = [NSString stringWithFormat:@"%@ %lu", v8, v13];
      v15 = [v7 stringByAppendingPathComponent:v14];

      if ([v9 length])
      {
        uint64_t v16 = [v15 stringByAppendingPathExtension:v9];

        v15 = (void *)v16;
      }
      ++v13;
      id v10 = v15;
    }
    while (([v12 fileExistsAtPath:v15] & 1) != 0);
  }
  else
  {
    v15 = v10;
  }

  return v15;
}

- (BOOL)overwrite
{
  return self->_overwrite;
}

- (void)setOverwrite:(BOOL)a3
{
  self->_overwrite = a3;
}

- (BOOL)writesTemporaryFilesInsideDestination
{
  return self->_writesTemporaryFilesInsideDestination;
}

- (void)setWritesTemporaryFilesInsideDestination:(BOOL)a3
{
  self->_writesTemporaryFilesInsideDestination = a3;
}

- (BOOL)skipsInvisibleHeaders
{
  return self->_skipsInvisibleHeaders;
}

- (void)setSkipsInvisibleHeaders:(BOOL)a3
{
  self->_skipsInvisibleHeaders = a3;
}

- (NSString)sourcePath
{
  return self->_sourcePath;
}

- (void)setSourcePath:(id)a3
{
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationPath, 0);

  objc_storeStrong((id *)&self->_sourcePath, 0);
}

@end