@interface _HKZipArchiveExtractor
- (BOOL)enumerateEntriesWithError:(id *)a3 block:(id)a4;
- (_HKZipArchiveExtractor)init;
- (_HKZipArchiveExtractor)initWithData:(id)a3;
- (_HKZipArchiveExtractor)initWithFileHandle:(id)a3;
- (_HKZipArchiveExtractor)initWithPathname:(id)a3;
- (_HKZipArchiveExtractor)initWithURL:(id)a3;
- (archive)archive;
- (id)_initWithData:(id)a3 fileHandle:(id)a4 path:(id)a5;
- (id)description;
- (id)numberOfEntriesWithError:(id *)a3;
- (int64_t)enumerationCount;
@end

@implementation _HKZipArchiveExtractor

- (_HKZipArchiveExtractor)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)_initWithData:(id)a3 fileHandle:(id)a4 path:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!v10 || v11 || v12)
  {
    BOOL v14 = v11 == 0;
    if (!v12) {
      BOOL v14 = v11 != 0;
    }
    if (v10 || !v14)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"_HKZipArchiveExtractor.m", 58, @"Invalid parameter not satisfying: %@", @"((data != nil) && (fileHandle == nil) && (path == nil)) || ((data == nil) && (fileHandle != nil) && (path == nil)) || ((data == nil) && (fileHandle == nil) && (path != nil))" object file lineNumber description];
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)_HKZipArchiveExtractor;
  v15 = [(_HKZipArchiveExtractor *)&v21 init];
  v16 = v15;
  if (v15)
  {
    v15->_archive = 0;
    objc_storeStrong((id *)&v15->_archiveData, a3);
    objc_storeStrong((id *)&v16->_fileHandle, a4);
    uint64_t v17 = [v13 copy];
    pathname = v16->_pathname;
    v16->_pathname = (NSString *)v17;

    v16->_enumerationCount = 0;
  }

  return v16;
}

- (_HKZipArchiveExtractor)initWithPathname:(id)a3
{
  id v5 = a3;
  if (!v5) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "pathname");
  }
  if (![v5 length])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_HKZipArchiveExtractor.m", 74, @"Invalid parameter not satisfying: %@", @"[pathname length] > 0" object file lineNumber description];
  }
  v6 = [(_HKZipArchiveExtractor *)self _initWithData:0 fileHandle:0 path:v5];

  return v6;
}

- (_HKZipArchiveExtractor)initWithURL:(id)a3
{
  id v5 = a3;
  if (!v5) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "url");
  }
  v6 = [v5 path];
  v7 = v6;
  if (!v6 || ![v6 length])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_HKZipArchiveExtractor.m", 85, @"Invalid parameter not satisfying: %@", @"(path != nil) && (path.length > 0)" object file lineNumber description];
  }
  v8 = [(_HKZipArchiveExtractor *)self _initWithData:0 fileHandle:0 path:v7];

  return v8;
}

- (_HKZipArchiveExtractor)initWithFileHandle:(id)a3
{
  id v4 = a3;
  if (!v4) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "fileHandle");
  }
  id v5 = [(_HKZipArchiveExtractor *)self _initWithData:0 fileHandle:v4 path:0];

  return v5;
}

- (_HKZipArchiveExtractor)initWithData:(id)a3
{
  id v5 = a3;
  if (!v5) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"%s may not be nil", "archiveData");
  }
  if (![v5 length])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_HKZipArchiveExtractor.m", 104, @"Invalid parameter not satisfying: %@", @"archiveData.length > 0" object file lineNumber description];
  }
  v6 = [(_HKZipArchiveExtractor *)self _initWithData:v5 fileHandle:0 path:0];

  return v6;
}

- (id)description
{
  pathname = (NSFileHandle *)self->_pathname;
  if (pathname) {
    goto LABEL_2;
  }
  if (self->_archiveData)
  {
    id v4 = [NSString stringWithFormat:@"%@ length %lu", objc_opt_class(), -[NSData length](self->_archiveData, "length")];
    goto LABEL_5;
  }
  pathname = self->_fileHandle;
  if (pathname)
  {
LABEL_2:
    id v4 = pathname;
LABEL_5:
    id v5 = v4;
    goto LABEL_6;
  }
  id v5 = 0;
LABEL_6:
  v6 = [NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, v5];

  return v6;
}

- (BOOL)enumerateEntriesWithError:(id *)a3 block:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, void *, unsigned char *))a4;
  if (self->_isEnumeratingEntries)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"self", objc_opt_class(), a2, @"Already enumerating this archive");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (a3) {
        *a3 = v8;
      }
      else {
        _HKLogDroppedError(v8);
      }
    }

    goto LABEL_27;
  }
  self->_isEnumeratingEntries = 1;
  ++self->_enumerationCount;
  self->_archive = (archive *)archive_read_new();
  if (!archive_read_support_format_zip() && !archive_read_support_filter_all())
  {
    archiveData = self->_archiveData;
    if (archiveData)
    {
      [(NSData *)archiveData bytes];
      [(NSData *)self->_archiveData length];
      int open_memory = archive_read_open_memory();
LABEL_15:
      if (!open_memory)
      {
        uint64_t v23 = 0;
        while (1)
        {
          unsigned int next_header = archive_read_next_header();
          if (next_header) {
            break;
          }
          if (archive_entry_filetype() == 0x8000)
          {
            char v22 = 0;
            v15 = (void *)MEMORY[0x19F395970]();
            v16 = [NSString stringWithUTF8String:archive_entry_pathname()];
            uint64_t v17 = [_HKZipArchiveEntry alloc];
            v18 = [(_HKZipArchiveEntry *)v17 initWithExtractor:self currentEntry:v23 pathname:v16];
            v7[2](v7, v18, &v22);
            BOOL v19 = [(_HKZipArchiveEntry *)v18 didReadEntryData];

            if (v22)
            {
              unsigned int next_header = 0;
              break;
            }
            if (!v19)
            {
              unsigned int next_header = archive_read_data_skip();
              if (next_header) {
                break;
              }
            }
          }
        }
        if (next_header < 2)
        {
          BOOL v20 = 1;
          goto LABEL_28;
        }
      }
      goto LABEL_26;
    }
    fileHandle = self->_fileHandle;
    if (fileHandle)
    {
      [(NSFileHandle *)fileHandle fileDescriptor];
      int open_memory = archive_read_open_fd();
      goto LABEL_15;
    }
    pathname = self->_pathname;
    if (pathname)
    {
      [(NSString *)pathname UTF8String];
      int open_memory = archive_read_open_filename();
      goto LABEL_15;
    }
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 920, @"Unable to open/read data: %s", archive_error_string());
LABEL_27:
  BOOL v20 = 0;
LABEL_28:
  if (self->_archive)
  {
    archive_read_free();
    self->_archive = 0;
  }
  if (self->_isEnumeratingEntries) {
    self->_isEnumeratingEntries = 0;
  }

  return v20;
}

- (id)numberOfEntriesWithError:(id *)a3
{
  numberOfEntries = self->_numberOfEntries;
  if (numberOfEntries)
  {
    id v4 = numberOfEntries;
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51___HKZipArchiveExtractor_numberOfEntriesWithError___block_invoke;
    v9[3] = &unk_1E58BF1C8;
    v9[4] = &v10;
    if ([(_HKZipArchiveExtractor *)self enumerateEntriesWithError:a3 block:v9])
    {
      v6 = [NSNumber numberWithInteger:v11[3]];
      v7 = self->_numberOfEntries;
      self->_numberOfEntries = v6;

      id v4 = self->_numberOfEntries;
    }
    else
    {
      id v4 = 0;
    }
    _Block_object_dispose(&v10, 8);
  }

  return v4;
}

- (archive)archive
{
  return self->_archive;
}

- (int64_t)enumerationCount
{
  return self->_enumerationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfEntries, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_archiveData, 0);

  objc_storeStrong((id *)&self->_pathname, 0);
}

- (void)enumerateEntriesWithError:(uint64_t)a3 block:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  id v6 = a1;
  _os_log_fault_impl(&dword_19C023000, a4, OS_LOG_TYPE_FAULT, "Caught exception in %{public}@: %{public}@", (uint8_t *)a3, 0x16u);
}

@end