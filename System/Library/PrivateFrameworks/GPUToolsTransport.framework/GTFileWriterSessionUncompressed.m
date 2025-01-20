@interface GTFileWriterSessionUncompressed
+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)_closeCurrentFileDescriptor:(id *)a3;
- (BOOL)_writeUncompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)finish:(id *)a3;
- (GTFileWriterSessionUncompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
- (int)_getCurrentFileDescriptor:(id *)a3;
- (int)_openNextFile:(id *)a3;
- (void)writeFileData:(id)a3 completionHandler:(id)a4;
@end

@implementation GTFileWriterSessionUncompressed

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithFileEntries:v12 relativeToURL:v11 options:v10 error:a6];

  return v13;
}

- (GTFileWriterSessionUncompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  v76[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v68.receiver = self;
  v68.super_class = (Class)GTFileWriterSessionUncompressed;
  v14 = [(GTFileWriterSessionUncompressed *)&v68 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_33;
  }
  v61 = a6;
  id v62 = v13;
  objc_storeStrong((id *)&v14->_fileEntries, a3);
  objc_storeStrong((id *)&v15->_baseURL, a4);
  v15->_currentFileIndex = 0;
  v15->_currentFileBytesWritten = 0;
  v15->_fd = -1;
  os_log_t v16 = os_log_create("com.apple.gputools.transport", "FileWriterSession");
  log = v15->_log;
  v15->_log = (OS_os_log *)v16;

  id v18 = v11;
  id v19 = v12;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v18;
  uint64_t v20 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  v65 = v19;
  if (!v20)
  {
    id v22 = 0;
    int v36 = 1;
    goto LABEL_30;
  }
  uint64_t v21 = v20;
  v58 = v15;
  id v59 = v12;
  id v60 = v11;
  id v22 = 0;
  uint64_t v67 = *(void *)v71;
  uint64_t v64 = *MEMORY[0x263F08438];
  uint64_t v63 = *MEMORY[0x263F08320];
  do
  {
    uint64_t v23 = 0;
    v24 = v22;
    do
    {
      if (*(void *)v71 != v67) {
        objc_enumerationMutation(obj);
      }
      v25 = *(void **)(*((void *)&v70 + 1) + 8 * v23);
      v26 = (void *)MEMORY[0x23ECD9F60]();
      id v69 = v24;
      id v27 = v25;
      v28 = (objc_class *)NSURL;
      id v29 = v19;
      id v30 = [v28 alloc];
      v31 = [v27 path];
      v32 = (void *)[v30 initFileURLWithPath:v31 isDirectory:0 relativeToURL:v29];

      v33 = [MEMORY[0x263F08850] defaultManager];
      v34 = [v32 URLByDeletingLastPathComponent];
      int v35 = [v33 createDirectoryAtURL:v34 withIntermediateDirectories:1 attributes:0 error:&v69];

      int v36 = 0;
      if (v35)
      {
        v37 = [v27 destination];

        if (v37)
        {
          v38 = [MEMORY[0x263F08850] defaultManager];
          v39 = [v32 path];
          v40 = [v27 destination];
          char v41 = [v38 createSymbolicLinkAtPath:v39 withDestinationPath:v40 error:&v69];

          if (v41) {
            goto LABEL_10;
          }
LABEL_22:
          int v36 = 0;
LABEL_23:
          id v19 = v65;
          goto LABEL_24;
        }
        id v42 = objc_alloc_init(MEMORY[0x263EFF8F8]);
        int v43 = [v42 writeToURL:v32 options:0 error:&v69];

        if (!v43) {
          goto LABEL_19;
        }
        int v44 = open((const char *)[v32 fileSystemRepresentation], 1, 0);
        if (v44 < 0)
        {
          v49 = (void *)MEMORY[0x263F087E8];
          uint64_t v50 = *__error();
          uint64_t v75 = v63;
          v76[0] = @"Failed to open file for writing";
          v51 = [NSDictionary dictionaryWithObjects:v76 forKeys:&v75 count:1];
          id v69 = [v49 errorWithDomain:v64 code:v50 userInfo:v51];

          id v19 = v65;
LABEL_19:
          int v36 = 0;
          goto LABEL_24;
        }
        int v45 = v44;
        if (ftruncate(v44, [v27 fileSize]) < 0)
        {
          v52 = (void *)MEMORY[0x263F087E8];
          uint64_t v53 = *__error();
          uint64_t v75 = v63;
          v76[0] = @"Failed to resize file";
          v54 = [NSDictionary dictionaryWithObjects:v76 forKeys:&v75 count:1];
          id v69 = [v52 errorWithDomain:v64 code:v53 userInfo:v54];

          id v19 = v65;
          close(v45);
          goto LABEL_19;
        }
        if (fsync(v45) < 0)
        {
          v46 = (void *)MEMORY[0x263F087E8];
          uint64_t v47 = *__error();
          uint64_t v75 = v63;
          v48 = @"Failed to flush file";
        }
        else
        {
          if ((close(v45) & 0x80000000) == 0)
          {
LABEL_10:
            int v36 = 1;
            goto LABEL_23;
          }
          v46 = (void *)MEMORY[0x263F087E8];
          uint64_t v47 = *__error();
          uint64_t v75 = v63;
          v48 = @"Failed to close file";
        }
        v76[0] = v48;
        v55 = [NSDictionary dictionaryWithObjects:v76 forKeys:&v75 count:1];
        id v69 = [v46 errorWithDomain:v64 code:v47 userInfo:v55];

        goto LABEL_22;
      }
LABEL_24:

      id v22 = v69;
      if (!v36) {
        goto LABEL_28;
      }
      ++v23;
      v24 = v22;
    }
    while (v21 != v23);
    uint64_t v21 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  }
  while (v21);
  int v36 = 1;
LABEL_28:
  id v12 = v59;
  id v11 = v60;
  v15 = v58;
LABEL_30:

  id v13 = v62;
  if (v61) {
    id *v61 = v22;
  }

  if (v36) {
LABEL_33:
  }
    v56 = v15;
  else {
    v56 = 0;
  }

  return v56;
}

- (int)_openNextFile:(id *)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  unint64_t currentFileIndex = self->_currentFileIndex;
  if (currentFileIndex >= [(NSArray *)self->_fileEntries count])
  {
    if (!a3) {
      return -1;
    }
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08438];
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = @"No more files to write to";
    id v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    *a3 = [v13 errorWithDomain:v14 code:2 userInfo:v10];
    goto LABEL_8;
  }
  id v6 = objc_alloc(NSURL);
  v7 = [(NSArray *)self->_fileEntries objectAtIndexedSubscript:self->_currentFileIndex];
  v8 = [v7 path];
  v9 = (void *)[v6 initFileURLWithPath:v8 isDirectory:0 relativeToURL:self->_baseURL];

  id v10 = v9;
  int v11 = open((const char *)[v10 fileSystemRepresentation], 1, 0);
  if (v11 < 0)
  {
    if (a3)
    {
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F08438];
      uint64_t v17 = *__error();
      uint64_t v20 = *MEMORY[0x263F08320];
      uint64_t v21 = @"Failed to open file for writing";
      id v18 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      *a3 = [v15 errorWithDomain:v16 code:v17 userInfo:v18];
    }
LABEL_8:
    int v12 = -1;
    goto LABEL_9;
  }
  int v12 = v11;
LABEL_9:

  return v12;
}

- (void)writeFileData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = v6;
  uint64_t v9 = [v8 bytes];
  uint64_t v10 = [v8 length];

  id v12 = 0;
  [(GTFileWriterSessionUncompressed *)self _writeUncompressedFileData:v9 length:v10 error:&v12];
  id v11 = v12;
  v7[2](v7, v11);
}

- (BOOL)_writeUncompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    unint64_t v9 = 0;
    while (1)
    {
      int v10 = [(GTFileWriterSessionUncompressed *)self _getCurrentFileDescriptor:a5];
      if (v10 < 0) {
        break;
      }
      int v11 = v10;
      unint64_t v12 = a4 - v9;
      id v13 = [(NSArray *)self->_fileEntries objectAtIndexedSubscript:self->_currentFileIndex];
      unint64_t v14 = [v13 fileSize] - self->_currentFileBytesWritten;

      uint64_t v15 = 0;
      if (a4 - v9 >= v14) {
        unint64_t v12 = v14;
      }
      do
      {
        ssize_t v16 = write(v11, &a3[v9 + v15], v12 - v15);
        if (v16 < 0) {
          goto LABEL_14;
        }
        v15 += v16;
      }
      while (v15 != v12);
      if ((v12 & 0x8000000000000000) != 0)
      {
LABEL_14:
        if (a5)
        {
          uint64_t v22 = (void *)MEMORY[0x263F087E8];
          uint64_t v23 = *MEMORY[0x263F08438];
          uint64_t v24 = *__error();
          uint64_t v27 = *MEMORY[0x263F08320];
          v28[0] = @"Failed to write to file";
          v25 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
          *a5 = [v22 errorWithDomain:v23 code:v24 userInfo:v25];
        }
        break;
      }
      unint64_t currentFileIndex = self->_currentFileIndex;
      unint64_t v18 = self->_currentFileBytesWritten + v12;
      self->_currentFileBytesWritten = v18;
      id v19 = [(NSArray *)self->_fileEntries objectAtIndexedSubscript:currentFileIndex];
      uint64_t v20 = [v19 fileSize];

      if (v18 == v20)
      {
        BOOL v21 = [(GTFileWriterSessionUncompressed *)self _closeCurrentFileDescriptor:a5];
        if (!v21) {
          return v21;
        }
        ++self->_currentFileIndex;
        self->_currentFileBytesWritten = 0;
      }
      v9 += v12;
      if (v9 >= a4) {
        goto LABEL_13;
      }
    }
    LOBYTE(v21) = 0;
  }
  else
  {
LABEL_13:
    LOBYTE(v21) = 1;
  }
  return v21;
}

- (int)_getCurrentFileDescriptor:(id *)a3
{
  int result = self->_fd;
  if (result < 0)
  {
    int result = [(GTFileWriterSessionUncompressed *)self _openNextFile:a3];
    self->_fd = result;
  }
  return result;
}

- (BOOL)finish:(id *)a3
{
  baseURL = self->_baseURL;
  self->_baseURL = 0;

  fileEntries = self->_fileEntries;
  self->_fileEntries = 0;

  self->_unint64_t currentFileIndex = 0;
  self->_currentFileBytesWritten = 0;
  return [(GTFileWriterSessionUncompressed *)self _closeCurrentFileDescriptor:a3];
}

- (BOOL)_closeCurrentFileDescriptor:(id *)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  int fd = self->_fd;
  if (fd < 0) {
    return 1;
  }
  self->_int fd = -1;
  if (fsync(fd) < 0)
  {
    if (a3)
    {
      id v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = *MEMORY[0x263F08438];
      uint64_t v8 = *__error();
      uint64_t v15 = *MEMORY[0x263F08320];
      v16[0] = @"Failed to flush file";
      unint64_t v9 = NSDictionary;
      int v10 = (__CFString **)v16;
      int v11 = &v15;
LABEL_9:
      unint64_t v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
      *a3 = [v6 errorWithDomain:v7 code:v8 userInfo:v12];
    }
  }
  else
  {
    if ((close(fd) & 0x80000000) == 0) {
      return 1;
    }
    if (a3)
    {
      id v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = *MEMORY[0x263F08438];
      uint64_t v8 = *__error();
      uint64_t v13 = *MEMORY[0x263F08320];
      unint64_t v14 = @"Failed to close file";
      unint64_t v9 = NSDictionary;
      int v10 = &v14;
      int v11 = &v13;
      goto LABEL_9;
    }
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_fileEntries, 0);
}

@end