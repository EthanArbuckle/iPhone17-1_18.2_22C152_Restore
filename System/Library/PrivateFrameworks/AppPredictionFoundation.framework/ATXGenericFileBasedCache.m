@interface ATXGenericFileBasedCache
- (ATXGenericFileBasedCache)initWithCacheFilePath:(id)a3 loggingHandle:(id)a4 debugName:(id)a5;
- (BOOL)storeData:(id)a3 error:(id *)a4;
- (BOOL)storeSecureCodedObject:(id)a3 error:(id *)a4;
- (NSString)cacheFilePath;
- (id)readSecureCodedObjectWithMaxValidAge:(double)a3 allowableClasses:(id)a4 error:(id *)a5;
- (id)readWithMaxValidAge:(double)a3 error:(id *)a4;
- (void)evict;
@end

@implementation ATXGenericFileBasedCache

- (BOOL)storeSecureCodedObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D25F3B80]();
  id v12 = 0;
  v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v12];
  id v9 = v12;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)self->_loggingHandle, OS_LOG_TYPE_ERROR))
    {
      -[ATXGenericFileBasedCache storeSecureCodedObject:error:]();
      if (a4) {
        goto LABEL_5;
      }
    }
    else if (a4)
    {
LABEL_5:
      BOOL v10 = 0;
      *a4 = v9;
      goto LABEL_8;
    }
    BOOL v10 = 0;
    goto LABEL_8;
  }
  BOOL v10 = [(ATXGenericFileBasedCache *)self storeData:v8 error:a4];
LABEL_8:

  return v10;
}

- (BOOL)storeData:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = open([(NSString *)self->_cacheFilePath UTF8String], 514, 384);
  if (v7 == -1)
  {
    int v10 = *__error();
    v11 = __error();
    id v12 = strerror(*v11);
    loggingHandle = self->_loggingHandle;
    if (os_log_type_enabled(loggingHandle, OS_LOG_TYPE_ERROR))
    {
      debugName = self->_debugName;
      *(_DWORD *)buf = 138412802;
      v32 = debugName;
      __int16 v33 = 1024;
      int v34 = v10;
      __int16 v35 = 2080;
      v36 = v12;
      _os_log_error_impl(&dword_1D0F2B000, loggingHandle, OS_LOG_TYPE_ERROR, "Couldn't create %@ cache file: [%i] %s", buf, 0x1Cu);
      if (!a4) {
        goto LABEL_16;
      }
    }
    else if (!a4)
    {
      goto LABEL_16;
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28798];
    if (v12)
    {
      uint64_t v29 = *MEMORY[0x1E4F28228];
      v16 = [NSString stringWithUTF8String:v12];
      v30 = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      *a4 = [v14 errorWithDomain:v15 code:v10 userInfo:v17];

LABEL_15:
      LOBYTE(a4) = 0;
      goto LABEL_16;
    }
    uint64_t v27 = *MEMORY[0x1E4F28228];
    v28 = @"Unknown error";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    v20 = v14;
    uint64_t v21 = v15;
    uint64_t v22 = 22;
LABEL_14:
    *a4 = [v20 errorWithDomain:v21 code:v22 userInfo:v16];
    goto LABEL_15;
  }
  int v8 = v7;
  char v9 = ATXCacheFileWrite(v7, v6);
  if ((v8 & 0x80000000) == 0) {
    close(v8);
  }
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_loggingHandle, OS_LOG_TYPE_ERROR))
    {
      -[ATXGenericFileBasedCache storeData:error:]();
      if (!a4) {
        goto LABEL_16;
      }
    }
    else if (!a4)
    {
      goto LABEL_16;
    }
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28798];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    v26 = @"Unable to write data";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v20 = v18;
    uint64_t v21 = v19;
    uint64_t v22 = 5;
    goto LABEL_14;
  }
  LOBYTE(a4) = 1;
LABEL_16:

  return (char)a4;
}

- (ATXGenericFileBasedCache)initWithCacheFilePath:(id)a3 loggingHandle:(id)a4 debugName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXGenericFileBasedCache;
  v11 = [(ATXGenericFileBasedCache *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    cacheFilePath = v11->_cacheFilePath;
    v11->_cacheFilePath = (NSString *)v12;

    objc_storeStrong((id *)&v11->_loggingHandle, a4);
    uint64_t v14 = [v10 copy];
    debugName = v11->_debugName;
    v11->_debugName = (NSString *)v14;
  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheFilePath, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_loggingHandle, 0);
}

- (id)readSecureCodedObjectWithMaxValidAge:(double)a3 allowableClasses:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1D25F3B80]();
  id v16 = 0;
  id v10 = [(ATXGenericFileBasedCache *)self readWithMaxValidAge:&v16 error:a3];
  id v11 = v16;
  if (v10)
  {
    id v15 = v11;
    uint64_t v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v10 error:&v15];
    id v13 = v15;

    if (!v12)
    {
      if (os_log_type_enabled((os_log_t)self->_loggingHandle, OS_LOG_TYPE_ERROR)) {
        -[ATXGenericFileBasedCache readSecureCodedObjectWithMaxValidAge:allowableClasses:error:]();
      }
      uint64_t v12 = 0;
    }
    id v11 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }

  if (a5) {
    *a5 = v11;
  }

  return v12;
}

- (id)readWithMaxValidAge:(double)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v7 = open([(NSString *)self->_cacheFilePath UTF8String], 0);
  if (v7 != -1)
  {
    int v8 = v7;
    *(void *)buf = 0;
    double v26 = 0.0;
    id v9 = (void *)MEMORY[0x1D25F3B80]();
    ATXCacheFileRead(v8, (void **)buf, &v26, a3);
    if (v26 < 0.0)
    {
      if (os_log_type_enabled((os_log_t)self->_loggingHandle, OS_LOG_TYPE_ERROR)) {
        -[ATXGenericFileBasedCache readWithMaxValidAge:error:]();
      }
      [(ATXGenericFileBasedCache *)self evict];
    }
    if ((v8 & 0x80000000) == 0) {
      close(v8);
    }
    id v10 = *(void **)buf;
    if (*(void *)buf)
    {
      id v11 = *(id *)buf;
LABEL_17:

      goto LABEL_25;
    }
    if (os_log_type_enabled((os_log_t)self->_loggingHandle, OS_LOG_TYPE_ERROR))
    {
      -[ATXGenericFileBasedCache readWithMaxValidAge:error:]();
      if (!a4) {
        goto LABEL_17;
      }
    }
    else if (!a4)
    {
      goto LABEL_17;
    }
    objc_super v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28798];
    uint64_t v27 = *MEMORY[0x1E4F28228];
    v28 = @"Unable to read data";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    *a4 = [v17 errorWithDomain:v18 code:5 userInfo:v19];

    goto LABEL_17;
  }
  int v12 = *__error();
  id v13 = __error();
  uint64_t v14 = strerror(*v13);
  loggingHandle = self->_loggingHandle;
  if (v12 == 2)
  {
    if (os_log_type_enabled(loggingHandle, OS_LOG_TYPE_DEFAULT))
    {
      debugName = self->_debugName;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = debugName;
      _os_log_impl(&dword_1D0F2B000, loggingHandle, OS_LOG_TYPE_DEFAULT, "Couldn't open %@ cache file because it is missing", buf, 0xCu);
      if (!a4) {
        goto LABEL_24;
      }
LABEL_20:
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28798];
      if (v14)
      {
        uint64_t v31 = *MEMORY[0x1E4F28228];
        uint64_t v22 = [NSString stringWithUTF8String:v14];
        v32 = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        *a4 = [v20 errorWithDomain:v21 code:v12 userInfo:v23];
      }
      else
      {
        uint64_t v29 = *MEMORY[0x1E4F28228];
        v30 = @"Unknown error";
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        *a4 = [v20 errorWithDomain:v21 code:22 userInfo:v22];
      }

      goto LABEL_24;
    }
  }
  else if (os_log_type_enabled(loggingHandle, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = self->_debugName;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v25;
    __int16 v34 = 1024;
    int v35 = v12;
    __int16 v36 = 2080;
    uint64_t v37 = v14;
    _os_log_error_impl(&dword_1D0F2B000, loggingHandle, OS_LOG_TYPE_ERROR, "Couldn't open %@ cache file: [%i] %s", buf, 0x1Cu);
    if (!a4) {
      goto LABEL_24;
    }
    goto LABEL_20;
  }
  if (a4) {
    goto LABEL_20;
  }
LABEL_24:
  id v10 = 0;
LABEL_25:
  return v10;
}

- (void)evict
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  v3 = a2;
  int v4 = *__error();
  v5 = __error();
  id v6 = strerror(*v5);
  int v7 = 138412802;
  uint64_t v8 = v2;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 2080;
  int v12 = v6;
  _os_log_error_impl(&dword_1D0F2B000, v3, OS_LOG_TYPE_ERROR, "Couldn't unlink %@ cache file: [%i] %s", (uint8_t *)&v7, 0x1Cu);
}

- (NSString)cacheFilePath
{
  return self->_cacheFilePath;
}

- (void)storeData:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "Couldn't write %@ cache file", v2, v3, v4, v5, 2u);
}

- (void)storeSecureCodedObject:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0F2B000, v0, v1, "Couldn't archive secure coded data for %@ cache file: %@");
}

- (void)readWithMaxValidAge:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "Couldn't read %@ cache file", v2, v3, v4, v5, 2u);
}

- (void)readWithMaxValidAge:error:.cold.2()
{
  OUTLINED_FUNCTION_0_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "Detected %@ cache file with last modified date in the future -- will attempt deletion", v2, v3, v4, v5, 2u);
}

- (void)readSecureCodedObjectWithMaxValidAge:allowableClasses:error:.cold.1()
{
  OUTLINED_FUNCTION_0_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0F2B000, v0, v1, "Couldn't unarchive secure coded data for %@ cache file: %@");
}

@end