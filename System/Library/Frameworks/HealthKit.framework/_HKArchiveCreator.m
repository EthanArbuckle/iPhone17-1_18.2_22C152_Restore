@interface _HKArchiveCreator
+ (BOOL)archiveContentsOfDirectoryAtURL:(id)a3 archiveURL:(id)a4 error:(id *)a5;
- (BOOL)archiveIsValid;
- (NSError)error;
- (NSFileHandle)fileHandle;
- (NSURL)archiveURL;
- (_HKArchiveCreator)initWithFileHandle:(id)a3 archiveType:(int64_t)a4;
- (_HKArchiveCreator)initWithURL:(id)a3 archiveType:(int64_t)a4;
- (_HKArchiveCreator)initWithURL:(id)a3 fileHandle:(id)a4 archiveType:(int64_t)a5;
- (int64_t)writeData:(const void *)a3 ofLength:(unint64_t)a4;
- (void)_addDataOfSize:(int64_t)a3 toPathInArchive:(id)a4 fromByteProvider:(id)a5;
- (void)_closeArchiveWithError:(id)a3;
- (void)addDataToArchive:(id)a3 pathInArchive:(id)a4;
- (void)addFileToArchive:(id)a3 pathInArchive:(id)a4;
- (void)closeArchive;
- (void)dealloc;
@end

@implementation _HKArchiveCreator

- (_HKArchiveCreator)initWithURL:(id)a3 fileHandle:(id)a4 archiveType:(int64_t)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (v8 | v9)
  {
    v20.receiver = self;
    v20.super_class = (Class)_HKArchiveCreator;
    v11 = [(_HKArchiveCreator *)&v20 init];
    if (!v11) {
      goto LABEL_13;
    }
    v11->_archive = (archive *)archive_write_new();
    if (a5) {
      goto LABEL_13;
    }
    archive_write_set_format_zip();
    if (v8)
    {
      uint64_t v12 = [(id)v8 copy];
      archiveURL = v11->_archiveURL;
      v11->_archiveURL = (NSURL *)v12;

      [(NSURL *)v11->_archiveURL fileSystemRepresentation];
      uint64_t v14 = archive_write_open_filename();
    }
    else
    {
      if (!v9)
      {
        uint64_t v17 = 4294967266;
LABEL_12:
        v18 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 102, @"Failed to open archive: %s (%d)", archive_error_string(), v17);
        [(_HKArchiveCreator *)v11 _closeArchiveWithError:v18];

LABEL_13:
        self = v11;
        v10 = self;
        goto LABEL_14;
      }
      uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28CB0]), "initWithFileDescriptor:closeOnDealloc:", dup(objc_msgSend((id)v9, "fileDescriptor")), 1);
      fileHandle = v11->_fileHandle;
      v11->_fileHandle = (NSFileHandle *)v15;

      [(NSFileHandle *)v11->_fileHandle fileDescriptor];
      uint64_t v14 = archive_write_open_fd();
    }
    uint64_t v17 = v14;
    if (!v14) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (_HKArchiveCreator)initWithURL:(id)a3 archiveType:(int64_t)a4
{
  return [(_HKArchiveCreator *)self initWithURL:a3 fileHandle:0 archiveType:a4];
}

- (_HKArchiveCreator)initWithFileHandle:(id)a3 archiveType:(int64_t)a4
{
  return [(_HKArchiveCreator *)self initWithURL:0 fileHandle:a3 archiveType:a4];
}

+ (BOOL)archiveContentsOfDirectoryAtURL:(id)a3 archiveURL:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v39 = 0;
  v10 = [v7 path];
  char v11 = [v9 fileExistsAtPath:v10 isDirectory:&v39];

  if (v11)
  {
    if (v39)
    {
      id v32 = v8;
      uint64_t v12 = [[_HKArchiveCreator alloc] initWithURL:v8 archiveType:0];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __70___HKArchiveCreator_archiveContentsOfDirectoryAtURL_archiveURL_error___block_invoke;
      v37[3] = &unk_1E58BF4A0;
      v13 = v12;
      v38 = v13;
      v31 = v9;
      [v9 enumeratorAtURL:v7 includingPropertiesForKeys:0 options:16 errorHandler:v37];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v34;
LABEL_5:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v33 + 1) + 8 * v18);
          if (![(_HKArchiveCreator *)v13 archiveIsValid]) {
            break;
          }
          if (([v19 hasDirectoryPath] & 1) == 0)
          {
            objc_super v20 = (void *)MEMORY[0x1E4F1CB10];
            v21 = [v19 relativePath];
            v22 = [v20 fileURLWithPath:v21];

            [(_HKArchiveCreator *)v13 addFileToArchive:v19 pathInArchive:v22];
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v40 count:16];
            if (v16) {
              goto LABEL_5;
            }
            break;
          }
        }
      }

      BOOL v23 = [(_HKArchiveCreator *)v13 archiveIsValid];
      if (v23)
      {
        [(_HKArchiveCreator *)v13 closeArchive];
        unint64_t v9 = v31;
        id v8 = v32;
LABEL_33:

        goto LABEL_34;
      }
      v26 = [(_HKArchiveCreator *)v13 error];
      v27 = v26;
      if (v26)
      {
        id v28 = v26;
        v29 = a5;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 2000, @"Unknown error");
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        v29 = a5;
        if (!v28)
        {
          unint64_t v9 = v31;
          id v8 = v32;
LABEL_31:

LABEL_32:
          goto LABEL_33;
        }
      }
      if (v29) {
        id *v29 = v28;
      }
      else {
        _HKLogDroppedError(v28);
      }
      unint64_t v9 = v31;
      id v8 = v32;

      if (v27) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"%@ is not a directory", v7);
  }
  else
  {
    id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
    v25 = v24;
    if (v24)
    {
      if (a5) {
        *a5 = v24;
      }
      else {
        _HKLogDroppedError(v24);
      }
    }
  }
  BOOL v23 = 0;
LABEL_34:

  return v23;
}

- (void)dealloc
{
  [(_HKArchiveCreator *)self closeArchive];
  v3.receiver = self;
  v3.super_class = (Class)_HKArchiveCreator;
  [(_HKArchiveCreator *)&v3 dealloc];
}

- (BOOL)archiveIsValid
{
  return self->_archive != 0;
}

- (int64_t)writeData:(const void *)a3 ofLength:(unint64_t)a4
{
  int64_t result = (int64_t)self->_archive;
  if (result) {
    return MEMORY[0x1F417E1D8]();
  }
  return result;
}

- (void)addFileToArchive:(id)a3 pathInArchive:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(_HKArchiveCreator *)self archiveIsValid])
  {
    if ([v7 isFileURL])
    {
      unint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      v10 = [v7 path];
      id v22 = 0;
      char v11 = [v9 attributesOfItemAtPath:v10 error:&v22];
      id v12 = v22;

      if (v11)
      {
        id v21 = 0;
        v13 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v7 error:&v21];
        id v14 = v21;
        if (v13)
        {
          uint64_t v15 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
          uint64_t v16 = [v15 longLongValue];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __52___HKArchiveCreator_addFileToArchive_pathInArchive___block_invoke;
          v18[3] = &unk_1E58BF4C8;
          id v19 = v13;
          objc_super v20 = self;
          [(_HKArchiveCreator *)self _addDataOfSize:v16 toPathInArchive:v8 fromByteProvider:v18];
        }
        else
        {
          [(_HKArchiveCreator *)self _closeArchiveWithError:v14];
        }
      }
      else
      {
        [(_HKArchiveCreator *)self _closeArchiveWithError:v12];
      }
    }
    else
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"%@ is not a file URL"", v7);
      [(_HKArchiveCreator *)self _closeArchiveWithError:v17];
    }
  }
}

- (void)addDataToArchive:(id)a3 pathInArchive:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52___HKArchiveCreator_addDataToArchive_pathInArchive___block_invoke;
  v10[3] = &unk_1E58BF4F0;
  id v11 = v6;
  id v9 = v6;
  [(_HKArchiveCreator *)self _addDataOfSize:v8 toPathInArchive:v7 fromByteProvider:v10];
}

- (void)_addDataOfSize:(int64_t)a3 toPathInArchive:(id)a4 fromByteProvider:(id)a5
{
  id v12 = a4;
  uint64_t v8 = (uint64_t (**)(id, _HKArchiveCreator *))a5;
  if ([(_HKArchiveCreator *)self archiveIsValid])
  {
    archive_entry_new();
    [v12 fileSystemRepresentation];
    archive_entry_set_pathname();
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
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 102, @"Failed to write archive header");
    }
    else
    {
      int64_t v10 = v8[2](v8, self);
      if (v10 >= a3)
      {
LABEL_7:
        archive_entry_free();
        goto LABEL_8;
      }
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 102, @"Wrote %ld bytes, expected %ld", v10, a3);
    }
    id v11 = (void *)v9;
    [(_HKArchiveCreator *)self _closeArchiveWithError:v9];

    goto LABEL_7;
  }
LABEL_8:
}

- (void)closeArchive
{
}

- (void)_closeArchiveWithError:(id)a3
{
  id v5 = a3;
  if (self->_archive)
  {
    archive_write_close();
    archive_write_free();
    self->_archive = 0;
    if (v5)
    {
      _HKInitializeLogging();
      id v6 = HKLogInfrastructure();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(_HKArchiveCreator *)(uint64_t)self _closeArchiveWithError:v6];
      }
    }
    objc_storeStrong((id *)&self->_error, a3);
  }
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);

  objc_storeStrong((id *)&self->_archiveURL, 0);
}

- (void)_closeArchiveWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 138412546;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_error_impl(&dword_19C023000, a3, OS_LOG_TYPE_ERROR, "%@: closing archive unexpectedly: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end