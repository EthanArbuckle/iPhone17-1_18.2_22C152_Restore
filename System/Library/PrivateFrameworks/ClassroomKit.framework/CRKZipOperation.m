@interface CRKZipOperation
- (BOOL)createDestinationDirectoryWithError:(id *)a3;
- (BOOL)populateArchive:(archive *)a3 error:(id *)a4;
- (BOOL)populateArchive:(archive *)a3 usingDisk:(archive *)a4 error:(id *)a5;
- (BOOL)validateParametersWithError:(id *)a3;
- (BOOL)writeArchiveOfDirectoryAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)writeDataForFTSEntry:(id)a3 toArchive:(archive *)a4 fileDescriptor:(int)a5 error:(id *)a6;
- (BOOL)writeDataFromFileDescriptor:(int)a3 toArchive:(archive *)a4 usingBuffer:(id)a5 error:(id *)a6;
- (BOOL)writeFTSEntry:(id)a3 toArchive:(archive *)a4 usingDisk:(archive *)a5 error:(id *)a6;
- (BOOL)writeHeaderForFTSEntry:(id)a3 toArchive:(archive *)a4 usingDisk:(archive *)a5 fileDescriptor:(int)a6 error:(id *)a7;
- (CRKZipOperation)initWithDirectoryURL:(id)a3;
- (CRKZipOperation)initWithDirectoryURL:(id)a3 destinationZipName:(id)a4;
- (CRKZipOperation)initWithDirectoryURL:(id)a3 destinationZipURL:(id)a4;
- (NSURL)destinationZipFileURL;
- (NSURL)directoryURL;
- (archive)makeArchiveWithError:(id *)a3;
- (const)relativePathForPathOnDisk:(id)a3;
- (id)errorFromArchive:(archive *)a3;
- (int64_t)lengthOfBufferForFileDescriptor:(int)a3 stat:(stat *)a4;
- (void)finalizeArchive:(archive *)a3;
- (void)main;
@end

@implementation CRKZipOperation

- (CRKZipOperation)initWithDirectoryURL:(id)a3
{
  v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  v6 = [v4 UUID];
  v7 = [v6 UUIDString];
  v8 = [v7 stringByAppendingPathExtension:@"zip"];

  v9 = [(CRKZipOperation *)self initWithDirectoryURL:v5 destinationZipName:v8];
  return v9;
}

- (CRKZipOperation)initWithDirectoryURL:(id)a3 destinationZipName:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if (![v7 length])
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"CRKZipOperation.m" lineNumber:38 description:@"Empty zip file name"];
  }
  v9 = objc_msgSend(NSURL, "crk_uniqueTemporaryDirectoryURL");
  v10 = [v9 URLByAppendingPathComponent:v7];

  v11 = [(CRKZipOperation *)self initWithDirectoryURL:v8 destinationZipURL:v10];
  return v11;
}

- (CRKZipOperation)initWithDirectoryURL:(id)a3 destinationZipURL:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CRKZipOperation.m", 44, @"Invalid parameter not satisfying: %@", @"directoryURL" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"CRKZipOperation.m", 45, @"Invalid parameter not satisfying: %@", @"zipURL" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)CRKZipOperation;
  v11 = [(CRKZipOperation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_directoryURL, a3);
    objc_storeStrong((id *)&v12->_destinationZipFileURL, a4);
  }

  return v12;
}

- (void)main
{
  id v14 = 0;
  BOOL v3 = [(CRKZipOperation *)self validateParametersWithError:&v14];
  id v4 = v14;
  id v5 = v4;
  if (!v3) {
    goto LABEL_5;
  }
  id v13 = v4;
  BOOL v6 = [(CRKZipOperation *)self createDestinationDirectoryWithError:&v13];
  id v7 = v13;

  if (!v6)
  {
    [(CRKZipOperation *)self endOperationWithError:v7];
    id v5 = v7;
    goto LABEL_7;
  }
  id v8 = [(CRKZipOperation *)self directoryURL];
  id v9 = [(CRKZipOperation *)self destinationZipFileURL];
  id v12 = v7;
  BOOL v10 = [(CRKZipOperation *)self writeArchiveOfDirectoryAtURL:v8 toURL:v9 error:&v12];
  id v5 = v12;

  if (v10)
  {
    v11 = [(CRKZipOperation *)self destinationZipFileURL];
    [(CRKZipOperation *)self endOperationWithResultObject:v11];
  }
  else
  {
LABEL_5:
    [(CRKZipOperation *)self endOperationWithError:v5];
  }
LABEL_7:
}

- (BOOL)validateParametersWithError:(id *)a3
{
  id v5 = [(CRKZipOperation *)self directoryURL];
  uint64_t v6 = [v5 fileSystemRepresentation];

  if (v6)
  {
    id v7 = [(CRKZipOperation *)self destinationZipFileURL];
    uint64_t v8 = [v7 fileSystemRepresentation];

    BOOL result = v8 != 0;
    if (a3 && !v8)
    {
      BOOL v10 = &unk_26D819DF8;
LABEL_7:
      CRKErrorWithCodeAndUserInfo(2, v10);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v11;
    }
  }
  else
  {
    if (a3)
    {
      BOOL v10 = &unk_26D819DD0;
      goto LABEL_7;
    }
    return 0;
  }
  return result;
}

- (BOOL)createDestinationDirectoryWithError:(id *)a3
{
  id v4 = [(CRKZipOperation *)self destinationZipFileURL];
  id v5 = [v4 URLByDeletingLastPathComponent];

  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  LOBYTE(a3) = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:a3];

  return (char)a3;
}

- (BOOL)writeArchiveOfDirectoryAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = -[CRKZipOperation makeArchiveWithError:](self, "makeArchiveWithError:", a5, a4);
  if (v7)
  {
    uint64_t v8 = v7;
    BOOL v9 = [(CRKZipOperation *)self populateArchive:v7 error:a5];
    [(CRKZipOperation *)self finalizeArchive:v8];
    LOBYTE(v7) = v9;
  }
  return (char)v7;
}

- (archive)makeArchiveWithError:(id *)a3
{
  id v5 = (archive *)archive_write_new();
  archive_write_set_format_zip();
  if (archive_write_set_options())
  {
    uint64_t v6 = _CRKLogGeneral_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CRKZipOperation makeArchiveWithError:](self, (uint64_t)v5);
    }
  }
  id v7 = [(CRKZipOperation *)self destinationZipFileURL];
  [v7 fileSystemRepresentation];
  int v8 = archive_write_open_filename();

  if (v8)
  {
    if (a3)
    {
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    }
    free(v5);
    return 0;
  }
  return v5;
}

- (void)finalizeArchive:(archive *)a3
{
  if (archive_write_free())
  {
    id v5 = _CRKLogGeneral_0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CRKZipOperation finalizeArchive:](self, (uint64_t)a3);
    }
  }
}

- (BOOL)populateArchive:(archive *)a3 error:(id *)a4
{
  uint64_t disk_new = archive_read_disk_new();
  archive_read_disk_set_standard_lookup();
  BOOL v8 = [(CRKZipOperation *)self populateArchive:a3 usingDisk:disk_new error:a4];
  if (archive_read_free())
  {
    BOOL v9 = _CRKLogGeneral_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CRKZipOperation populateArchive:error:](self, disk_new);
    }
  }
  return v8;
}

- (BOOL)populateArchive:(archive *)a3 usingDisk:(archive *)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  BOOL v9 = [CRKFTSEnumeration alloc];
  BOOL v10 = [(CRKZipOperation *)self directoryURL];
  id v11 = [v10 path];
  id v12 = [(CRKFTSEnumeration *)v9 initWithDirectoryPath:v11];

  id v13 = [(CRKFTSEnumeration *)v12 entriesWithError:a5];
  id v14 = v13;
  if (v13)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v13;
    uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      v25 = v14;
      v26 = v12;
      v27 = a5;
      id v17 = 0;
      uint64_t v18 = *(void *)v31;
      while (2)
      {
        uint64_t v19 = 0;
        v20 = v17;
        do
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * v19);
          v22 = (void *)MEMORY[0x22A6208B0]();
          id v29 = v20;
          LODWORD(v21) = [(CRKZipOperation *)self writeFTSEntry:v21 toArchive:a3 usingDisk:a4 error:&v29];
          id v17 = v29;

          if (!v21)
          {
            BOOL v23 = 0;
            goto LABEL_12;
          }
          ++v19;
          v20 = v17;
        }
        while (v16 != v19);
        uint64_t v16 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      BOOL v23 = 1;
LABEL_12:
      id v12 = v26;
      a5 = v27;
      id v14 = v25;
    }
    else
    {
      id v17 = 0;
      BOOL v23 = 1;
    }

    if (a5) {
      *a5 = v17;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)writeFTSEntry:(id)a3 toArchive:(archive *)a4 usingDisk:(archive *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = (void *)MEMORY[0x263F08840];
  id v12 = NSURL;
  id v13 = [v10 path];
  id v14 = [v12 fileURLWithPath:v13];
  uint64_t v15 = [v11 fileHandleForReadingFromURL:v14 error:a6];

  BOOL v17 = v15
     && (uint64_t v16 = [v15 fileDescriptor],
         [(CRKZipOperation *)self writeHeaderForFTSEntry:v10 toArchive:a4 usingDisk:a5 fileDescriptor:v16 error:a6])&& [(CRKZipOperation *)self writeDataForFTSEntry:v10 toArchive:a4 fileDescriptor:v16 error:a6];

  return v17;
}

- (BOOL)writeHeaderForFTSEntry:(id)a3 toArchive:(archive *)a4 usingDisk:(archive *)a5 fileDescriptor:(int)a6 error:(id *)a7
{
  id v11 = a3;
  archive_entry_new();
  id v12 = [v11 path];
  [(CRKZipOperation *)self relativePathForPathOnDisk:v12];
  archive_entry_set_pathname();

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  if (v11) {
    objc_msgSend(v11, "stat", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  }
  if (archive_read_disk_entry_from_file())
  {
    if (!a7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (!archive_write_header())
  {
    int v13 = 0;
    goto LABEL_10;
  }
  a5 = a4;
  if (a7)
  {
LABEL_8:
    -[CRKZipOperation errorFromArchive:](self, "errorFromArchive:", a5, v15, v16, v17, v18, v19, v20, v21, v22, v23);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  int v13 = 1;
LABEL_10:
  archive_entry_free();

  return v13 == 0;
}

- (const)relativePathForPathOnDisk:(id)a3
{
  uint64_t v4 = [a3 fileSystemRepresentation];
  id v5 = [(CRKZipOperation *)self directoryURL];
  uint64_t v6 = [v5 path];
  id v7 = [v6 stringByDeletingLastPathComponent];
  size_t v8 = strlen((const char *)[v7 fileSystemRepresentation]) + v4;

  return (const char *)(v8 + 1);
}

- (BOOL)writeDataForFTSEntry:(id)a3 toArchive:(archive *)a4 fileDescriptor:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  if (a3) {
    [a3 stat];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  int64_t v10 = [(CRKZipOperation *)self lengthOfBufferForFileDescriptor:v7 stat:v14];
  id v11 = [MEMORY[0x263EFF990] dataWithLength:v10];
  BOOL v12 = [(CRKZipOperation *)self writeDataFromFileDescriptor:v7 toArchive:a4 usingBuffer:v11 error:a6];

  return v12;
}

- (int64_t)lengthOfBufferForFileDescriptor:(int)a3 stat:(stat *)a4
{
  off_t v5 = +[CRKChunkedFile preferredChunkSizeForFileDescriptor:*(void *)&a3];
  if (v5 >= a4->st_size) {
    off_t st_size = a4->st_size;
  }
  else {
    off_t st_size = v5;
  }
  if (v5 <= 0) {
    return a4->st_size;
  }
  else {
    return st_size;
  }
}

- (BOOL)writeDataFromFileDescriptor:(int)a3 toArchive:(archive *)a4 usingBuffer:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = [[CRKChunkedFile alloc] initWithFileDescriptor:v8];
  do
  {
    uint64_t v12 = [(CRKChunkedFile *)v11 readNextChunkIntoBuffer:v10 error:a6];
    if (v12 < 1)
    {
      BOOL v13 = v12 == 0;
      goto LABEL_8;
    }
    [v10 bytes];
  }
  while (archive_write_data() != -1);
  if (a6)
  {
    [(CRKZipOperation *)self errorFromArchive:a4];
    BOOL v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_8:

  return v13;
}

- (id)errorFromArchive:(archive *)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  int v3 = archive_errno();
  uint64_t v4 = archive_error_string();
  if (v4)
  {
    uint64_t v5 = [NSString stringWithUTF8String:v4];
    uint64_t v6 = (void *)v5;
    if (v5)
    {
      uint64_t v10 = *MEMORY[0x263F08320];
      v11[0] = v5;
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:v3 userInfo:v7];

  return v8;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (NSURL)destinationZipFileURL
{
  return self->_destinationZipFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationZipFileURL, 0);

  objc_storeStrong((id *)&self->_directoryURL, 0);
}

- (void)makeArchiveWithError:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  v2 = [a1 errorFromArchive:a2];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v3, v4, "Failed to set compression type to deflate: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)finalizeArchive:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  v2 = [a1 errorFromArchive:a2];
  uint64_t v3 = [v2 verboseDescription];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v4, v5, "Failed to finalize archive: %{public}@", v6, v7, v8, v9, 2u);
}

- (void)populateArchive:(void *)a1 error:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  v2 = [a1 errorFromArchive:a2];
  uint64_t v3 = [v2 verboseDescription];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v4, v5, "Failed to close disk archive: %{public}@", v6, v7, v8, v9, 2u);
}

@end