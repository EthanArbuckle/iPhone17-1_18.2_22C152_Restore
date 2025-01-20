@interface ISStoreUnit
+ (id)storeUnitWithData:(id)a3;
+ (id)storeUnitWithStoreURL:(id)a3 UUID:(id)a4;
- (BOOL)isValid;
- (ISStoreUnit)initWithData:(id)a3 UUID:(id)a4;
- (NSData)data;
- (NSUUID)UUID;
- (void)remapWithStoreURL:(id)a3;
@end

@implementation ISStoreUnit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

+ (id)storeUnitWithStoreURL:(id)a3 UUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 UUIDString];
  v8 = [v6 URLByAppendingPathComponent:v7];

  v9 = [v8 URLByAppendingPathExtension:@"isdata"];
  v10 = [v9 path];

  id v11 = v10;
  int v12 = open((const char *)[v11 UTF8String], 0, 256);
  if (v12 == -1)
  {
    v16 = _ISDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[ISStoreUnit storeUnitWithStoreURL:UUID:]();
    }

    v17 = 0;
  }
  else
  {
    int v13 = v12;
    size_t v14 = lseek(v12, 0, 2);
    if (v14)
    {
      v15 = mmap(0, v14, 1, 1, v13, 0);
      if (v15 == (void *)-1) {
        size_t v14 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    close(v13);
    v17 = 0;
    if (v15 && v14)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v19 = (void *)[v18 initWithBytesNoCopy:v15 length:v14 deallocator:*MEMORY[0x1E4F28210]];
      v17 = [[ISStoreUnit alloc] initWithData:v19 UUID:v5];
    }
  }

  return v17;
}

- (ISStoreUnit)initWithData:(id)a3 UUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ISStoreUnit;
  v9 = [(ISStoreUnit *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_UUID, a4);
  }

  return v10;
}

+ (id)storeUnitWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (!v4)
  {
    v9 = _ISDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[ISStoreUnit storeUnitWithData:](v9);
    }
    goto LABEL_8;
  }
  size_t v5 = v4;
  size_t v6 = (v4 + *MEMORY[0x1E4F14B00] + 7) & -*MEMORY[0x1E4F14B00];
  id v7 = (ISStoreUnit *)mmap(0, v6, 3, 4097, 1224736768, 0);
  if (!v7)
  {
    id v10 = 0;
    id v11 = 0;
    goto LABEL_15;
  }
  id v8 = v7;
  if (v7 == (ISStoreUnit *)-1)
  {
    v9 = _ISDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[ISStoreUnit storeUnitWithData:](v9);
    }
LABEL_8:

    id v10 = 0;
    id v11 = 0;
    id v7 = 0;
    goto LABEL_15;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v10 = (id) [v12 initWithBytesNoCopy:v8 length:v5 deallocator:*MEMORY[0x1E4F28210]];
  int v13 = (void *)[v10 bytes];
  size_t v14 = (const void *)[v3 bytes];
  unint64_t v15 = [v10 length];
  size_t v16 = v5;
  if (v5 >= v15) {
    size_t v16 = objc_msgSend(v10, "length", v5);
  }
  memcpy(v13, v14, v16);
  *(void *)((char *)v8 + v6 - 8) = v5;
  v17 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithBytes:size:", v8, v5);
  id v18 = NSString;
  v19 = +[ISDefaults sharedInstance];
  v20 = [v19 cacheSaltString];
  v21 = [v18 stringWithFormat:@"%@-%@", v17, v20];

  id v11 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:", v21);

  id v7 = 0;
  if (v10 && v11) {
    id v7 = [[ISStoreUnit alloc] initWithData:v10 UUID:v11];
  }
LABEL_15:
  v22 = v7;

  return v22;
}

- (BOOL)isValid
{
  NSUInteger v3 = [(NSData *)self->_data length];
  if (v3) {
    LOBYTE(v3) = self->_UUID != 0;
  }
  return v3;
}

- (void)remapWithStoreURL:(id)a3
{
  id v4 = a3;
  if ([(ISStoreUnit *)self isValid])
  {
    size_t v5 = [v4 path];
    size_t v6 = [(NSUUID *)self->_UUID UUIDString];
    id v7 = [v5 stringByAppendingPathComponent:v6];
    id v8 = [v7 stringByAppendingPathExtension:@"isdata"];

    id v9 = v8;
    int v10 = open((const char *)[v9 UTF8String], 0, 256);
    if (v10 == -1)
    {
      size_t v16 = _ISDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        +[ISStoreUnit storeUnitWithStoreURL:UUID:]();
      }
    }
    else
    {
      int v11 = v10;
      id v12 = [(NSData *)self->_data bytes];
      off_t v13 = lseek(v11, 0, 2);
      if (v13 && (size_t v14 = v13, v13 == [(NSData *)self->_data length]))
      {
        mmap(v12, v14, 1, 17, v11, 0);
      }
      else
      {
        unint64_t v15 = _ISDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[ISStoreUnit remapWithStoreURL:]((uint64_t)v9, v15);
        }
      }
      close(v11);
    }
  }
}

+ (void)storeUnitWithStoreURL:UUID:.cold.1()
{
  __error();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_6(&dword_1AE771000, v0, v1, "Failed to open cache file for mapping at path: %@ error: %d", v2, v3, v4, v5, v6);
}

+ (void)storeUnitWithData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1AE771000, log, OS_LOG_TYPE_FAULT, "Failed to mmap file. The file has zero length.", v1, 2u);
}

+ (void)storeUnitWithData:(NSObject *)a1 .cold.2(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1AE771000, a1, OS_LOG_TYPE_FAULT, "Could not mmap(...), error: %d\n", (uint8_t *)v3, 8u);
}

- (void)remapWithStoreURL:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Failed remap store entry with path: %@ due to data size mismatch.", (uint8_t *)&v2, 0xCu);
}

@end