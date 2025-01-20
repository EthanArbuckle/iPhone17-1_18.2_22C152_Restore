@interface GEOTileData
- (BOOL)hasFileDescriptor;
- (BOOL)isEqual:(id)a3;
- (GEOTileData)init;
- (GEOTileData)initWithData:(id)a3;
- (GEOTileData)initWithDecodedRepresentation:(id)a3;
- (GEOTileData)initWithFileHandle:(id)a3;
- (GEOTileData)initWithFileURL:(id)a3;
- (GEOTileData)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSData)data;
- (NSURL)fileURL;
- (id)decodedRepresentation;
- (id)readDataWithError:(id *)a3;
- (id)readDataWithOptions:(unint64_t)a3 error:(id *)a4;
- (int)consumeFileDescriptor;
- (unint64_t)hash;
- (unint64_t)length;
- (void)_replaceFileURL:(id)a3;
- (void)dealloc;
- (void)encodeToXPCDictionary:(id)a3;
@end

@implementation GEOTileData

- (GEOTileData)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOTileData;
  v6 = [(GEOTileData *)&v27 init];
  if (v6 && MEMORY[0x18C1213B0](v5) == MEMORY[0x1E4F14590])
  {
    v7 = xpc_dictionary_get_value(v5, "data");
    v8 = xpc_dictionary_get_value(v5, "fileURL");
    uint64_t v9 = xpc_dictionary_get_value(v5, "fd");
    v10 = (void *)v9;
    if (v7)
    {
      if (MEMORY[0x18C1213B0](v7) == MEMORY[0x1E4F14580])
      {
        bytes_ptr = xpc_data_get_bytes_ptr(v7);
        size_t length = xpc_data_get_length(v7);
        global_queue = geo_get_global_queue();
        destructor[0] = MEMORY[0x1E4F143A8];
        destructor[1] = 3221225472;
        destructor[2] = __43__GEOTileData_initWithXPCDictionary_error___block_invoke;
        destructor[3] = &unk_1E53D79D8;
        id v26 = v7;
        dispatch_data_t v14 = dispatch_data_create(bytes_ptr, length, global_queue, destructor);
        data = v6->_data;
        v6->_data = (NSData *)v14;

        v6->_sandboxExtension = -1;
LABEL_6:
        v16 = v6;
LABEL_17:

        goto LABEL_18;
      }
    }
    else if (v9)
    {
      if (MEMORY[0x18C1213B0](v9) == MEMORY[0x1E4F145B0])
      {
        int v17 = xpc_fd_dup(v10);
        v18 = GEOGetTileLoadingLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          int v29 = v17;
          _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_DEBUG, "Got file descriptor %d", buf, 8u);
        }

        if (v17 >= 1)
        {
          v6->_fileDescriptor = v17;
          v6->_cachedFileSize = xpc_dictionary_get_uint64(v5, "fileSize");
          goto LABEL_6;
        }
      }
    }
    else
    {
      if (!v8) {
        goto LABEL_6;
      }
      if (MEMORY[0x18C1213B0](v8) == MEMORY[0x1E4F145F0] && xpc_dictionary_get_string(v5, "sbt"))
      {
        v6->_sandboxExtension = sandbox_extension_consume();
        id v20 = [NSString alloc];
        string_ptr = xpc_string_get_string_ptr(v8);
        v22 = (void *)[v20 initWithBytes:string_ptr length:xpc_string_get_length(v8) encoding:4];
        v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v22];
        if ([(NSURL *)v23 isFileURL])
        {
          fileURL = v6->_fileURL;
          v6->_fileURL = v23;

          v6->_cachedFileSize = xpc_dictionary_get_uint64(v5, "fileSize");
          goto LABEL_6;
        }
      }
    }
    v16 = 0;
    goto LABEL_17;
  }
  v16 = 0;
LABEL_18:

  return v16;
}

- (id)readDataWithError:(id *)a3
{
  return [(GEOTileData *)self readDataWithOptions:0 error:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_decodedRepresentation, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (unint64_t)length
{
  if (self->_data) {
    return [(NSData *)self->_data length];
  }
  if (self->_fileURL) {
    return self->_cachedFileSize;
  }
  return 0;
}

- (id)decodedRepresentation
{
  return self->_decodedRepresentation;
}

- (void)dealloc
{
  if (self->_sandboxExtension != -1) {
    sandbox_extension_release();
  }
  int fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor >= 1 && !self->_fileHandle) {
    close(fileDescriptor);
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOTileData;
  [(GEOTileData *)&v4 dealloc];
}

- (GEOTileData)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOTileData;
  v6 = [(GEOTileData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_sandboxExtension = -1;
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  data = self->_data;
  if (data)
  {
    id v6 = [(NSData *)data _geo_newXPCData];
    xpc_dictionary_set_value(v4, "data", v6);
  }
  else
  {
    fileURL = self->_fileURL;
    if (fileURL)
    {
      id v8 = [(NSURL *)fileURL path];
      xpc_object_t v9 = xpc_string_create((const char *)[v8 UTF8String]);

      xpc_dictionary_set_value(v4, "fileURL", v9);
      xpc_dictionary_set_uint64(v4, "fileSize", self->_cachedFileSize);
      [(NSURL *)self->_fileURL fileSystemRepresentation];
      objc_super v10 = (const char *)sandbox_extension_issue_file();
      if (v10)
      {
        v11 = (char *)v10;
        xpc_dictionary_set_string(v4, "sbt", v10);
        free(v11);
      }
      else
      {
        v13 = GEOGetTileLoadingLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          dispatch_data_t v14 = self->_fileURL;
          int v15 = 138412290;
          v16 = v14;
          _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_FAULT, "Failed to issue sandbox extension for file: %@", (uint8_t *)&v15, 0xCu);
        }
      }
    }
    else if (self->_fileHandle)
    {
      int fileDescriptor = self->_fileDescriptor;
      if (fileDescriptor <= 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        LOWORD(v15) = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _fileDescriptor > 0", (uint8_t *)&v15, 2u);
        int fileDescriptor = self->_fileDescriptor;
      }
      xpc_dictionary_set_fd(v4, "fd", fileDescriptor);
    }
    else if (self->_decodedRepresentation && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _decodedRepresentation == nil", (uint8_t *)&v15, 2u);
    }
  }
}

- (id)readDataWithOptions:(unint64_t)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  p_data = (id *)&self->_data;
  data = self->_data;
  if (data)
  {
    if (a4)
    {
      *a4 = 0;
      data = (NSData *)*p_data;
    }
    goto LABEL_38;
  }
  int fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor < 1)
  {
    fileURL = self->_fileURL;
    if (fileURL)
    {
      v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:fileURL options:a3 error:a4];
      goto LABEL_39;
    }
    if (a4)
    {
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
      v12 = 0;
      *a4 = v13;
      goto LABEL_39;
    }
    goto LABEL_30;
  }
  if (!self->_cachedFileSize)
  {
    off_t v10 = lseek(fileDescriptor, 0, 2);
    if (v10 < 1)
    {
      if (!self->_cachedFileSize)
      {
        dispatch_data_t v14 = GEOGetTileLoadingLog();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        int v35 = self->_fileDescriptor;
        *(_DWORD *)buf = 67109120;
        int v38 = v35;
        v16 = "Unable to determine size of tile file descriptor %d";
        goto LABEL_16;
      }
    }
    else
    {
      self->_unint64_t cachedFileSize = v10;
    }
  }
  if (!lseek(self->_fileDescriptor, 0, 0))
  {
    if ((a3 & 9) != 0)
    {
      int v17 = self->_fileDescriptor;
      id v36 = 0;
      v18 = GEODispatchDataForMemoryMappedFileFromFileDescriptor(v17, &v36);
      id v19 = v36;
      id v20 = v19;
      if (v18)
      {
        objc_storeStrong(p_data, v18);
LABEL_21:

        goto LABEL_34;
      }
      if ((a3 & 8) != 0)
      {
        if (a4) {
          *a4 = v19;
        }
        goto LABEL_21;
      }
    }
    v21 = malloc_type_calloc(1uLL, self->_cachedFileSize, 0xAB2BA2C5uLL);
    if (v21)
    {
      v22 = v21;
      ssize_t v23 = read(self->_fileDescriptor, v21, self->_cachedFileSize);
      if (v23 == self->_cachedFileSize)
      {
        uint64_t v24 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v22 length:v23 freeWhenDone:1];
        id v25 = *p_data;
        id *p_data = (id)v24;
      }
      else
      {
        int v29 = GEOGetTileLoadingLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          unint64_t cachedFileSize = self->_cachedFileSize;
          int v31 = self->_fileDescriptor;
          *(_DWORD *)buf = 67109632;
          int v38 = cachedFileSize;
          __int16 v39 = 1024;
          int v40 = v23;
          __int16 v41 = 1024;
          int v42 = v31;
          _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_ERROR, "Expected to read %u bytes, got %u instead from file descriptor %d", buf, 0x14u);
        }

        free(v22);
      }
      goto LABEL_34;
    }
    id v26 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      unint64_t v27 = self->_cachedFileSize;
      int v28 = self->_fileDescriptor;
      *(_DWORD *)buf = 67109376;
      int v38 = v27;
      __int16 v39 = 1024;
      int v40 = v28;
      _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_ERROR, "Unable to allocate %u bytes for file descriptor %d", buf, 0xEu);
    }

LABEL_30:
    v12 = 0;
    goto LABEL_39;
  }
  dispatch_data_t v14 = GEOGetTileLoadingLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v15 = self->_fileDescriptor;
    *(_DWORD *)buf = 67109120;
    int v38 = v15;
    v16 = "Unable to seek to begninng of file descriptor %d";
LABEL_16:
    _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, v16, buf, 8u);
  }
LABEL_17:

LABEL_34:
  fileHandle = self->_fileHandle;
  if (fileHandle)
  {
    [(NSFileHandle *)fileHandle closeAndReturnError:0];
    v33 = self->_fileHandle;
    self->_fileHandle = 0;
  }
  else
  {
    close(self->_fileDescriptor);
  }
  self->_int fileDescriptor = 0;
  data = self->_data;
LABEL_38:
  v12 = data;
LABEL_39:

  return v12;
}

- (GEOTileData)init
{
  result = (GEOTileData *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOTileData)initWithFileURL:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOTileData;
  id v5 = [(GEOTileData *)&v18 init];
  if (v5)
  {
    if (([v4 isFileURL] & 1) == 0)
    {
      id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"fileURL must be a file URL" userInfo:0];
      objc_exception_throw(v17);
    }
    uint64_t v6 = [v4 copy];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    id v8 = v5->_fileURL;
    uint64_t v10 = *MEMORY[0x1E4F1C628];
    v19[0] = *MEMORY[0x1E4F1C5F8];
    uint64_t v9 = v19[0];
    v19[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v12 = [(NSURL *)v8 resourceValuesForKeys:v11 error:0];

    id v13 = [v12 objectForKeyedSubscript:v9];
    v5->_unint64_t cachedFileSize = [v13 unsignedIntegerValue];

    dispatch_data_t v14 = [v12 objectForKeyedSubscript:v10];
    v5->_isDir = [v14 BOOLValue];

    v5->_sandboxExtension = -1;
    int v15 = v5;
  }
  return v5;
}

- (GEOTileData)initWithFileHandle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOTileData;
  uint64_t v6 = [(GEOTileData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileHandle, a3);
    v7->_int fileDescriptor = [(NSFileHandle *)v7->_fileHandle fileDescriptor];
    v7->_sandboxExtension = -1;
    id v8 = v7;
  }

  return v7;
}

- (GEOTileData)initWithDecodedRepresentation:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOTileData;
  uint64_t v6 = [(GEOTileData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_decodedRepresentation, a3);
    v7->_sandboxExtension = -1;
    id v8 = v7;
  }

  return v7;
}

- (void)_replaceFileURL:(id)a3
{
  id v7 = a3;
  if (([v7 isFileURL] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"fileURL must be a file URL" userInfo:0];
    objc_exception_throw(v6);
  }
  id v4 = (NSURL *)[v7 copy];
  fileURL = self->_fileURL;
  self->_fileURL = v4;
}

- (NSData)data
{
  data = self->_data;
  if (!data)
  {
    if (self->_fileDescriptor < 1)
    {
      data = 0;
    }
    else
    {
      id v4 = [(GEOTileData *)self readDataWithError:0];
      data = self->_data;
    }
  }

  return data;
}

- (BOOL)hasFileDescriptor
{
  return self->_fileDescriptor > 0;
}

- (int)consumeFileDescriptor
{
  int fileDescriptor = self->_fileDescriptor;
  self->_int fileDescriptor = 0;
  return fileDescriptor;
}

- (unint64_t)hash
{
  data = self->_data;
  if (data || (data = self->_fileURL) != 0 || (data = self->_decodedRepresentation) != 0)
  {
    return [data hash];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)GEOTileData;
    return [(GEOTileData *)&v4 hash];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    data = self->_data;
    if (data)
    {
      if (v5[1])
      {
        char v7 = -[NSData isEqualToData:](data, "isEqualToData:");
LABEL_12:
        BOOL v8 = v7;
LABEL_15:

        goto LABEL_16;
      }
      goto LABEL_14;
    }
    fileURL = self->_fileURL;
    if (fileURL)
    {
      if (!v5[4]) {
        goto LABEL_14;
      }
    }
    else
    {
      fileURL = self->_decodedRepresentation;
      if (!fileURL)
      {
        if (!v5[1])
        {
          BOOL v8 = v5[8] == 0;
          goto LABEL_15;
        }
        goto LABEL_14;
      }
      if (!v5[8])
      {
LABEL_14:
        BOOL v8 = 0;
        goto LABEL_15;
      }
    }
    char v7 = objc_msgSend(fileURL, "isEqual:");
    goto LABEL_12;
  }
  BOOL v8 = 0;
LABEL_16:

  return v8;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

@end