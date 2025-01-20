@interface NSData(ISStoreIndex)
+ (id)_ISStoreIndex_mappedDataWithURL:()ISStoreIndex;
@end

@implementation NSData(ISStoreIndex)

+ (id)_ISStoreIndex_mappedDataWithURL:()ISStoreIndex
{
  id v3 = [a3 path];
  int v4 = open((const char *)[v3 UTF8String], 0);
  if (v4 == -1)
  {
    v8 = _ISDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[NSData(ISStoreIndex) _ISStoreIndex_mappedDataWithURL:](v8);
    }

    v9 = 0;
  }
  else
  {
    int v5 = v4;
    size_t v6 = lseek(v4, 0, 2);
    if (v6)
    {
      v7 = mmap(0, v6, 1, 1, v5, 0);
      if (v7 == (void *)-1) {
        size_t v6 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    close(v5);
    v9 = 0;
    if (v7 && v6)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v9 = (void *)[v10 initWithBytesNoCopy:v7 length:v6 deallocator:*MEMORY[0x1E4F28210]];
    }
  }

  return v9;
}

+ (void)_ISStoreIndex_mappedDataWithURL:()ISStoreIndex .cold.1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1AE771000, a1, OS_LOG_TYPE_DEBUG, "Failed to open store index with errno: %d", (uint8_t *)v3, 8u);
}

@end