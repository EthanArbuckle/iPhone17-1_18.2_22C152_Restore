@interface NSData(ISMutableStoreIndex)
+ (id)_ISMutableStoreIndex_mappedDataWithURL:()ISMutableStoreIndex;
- (BOOL)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex;
@end

@implementation NSData(ISMutableStoreIndex)

+ (id)_ISMutableStoreIndex_mappedDataWithURL:()ISMutableStoreIndex
{
  id v3 = [a3 path];
  int v4 = open_dprotected_np((const char *)[v3 UTF8String], 2, 4, 0, 384);
  if (v4 == -1)
  {
    v8 = 0;
  }
  else
  {
    int v5 = v4;
    size_t v6 = lseek(v4, 0, 2);
    if (v6)
    {
      v7 = mmap(0, v6, 3, 1, v5, 0);
      if (v7 == (void *)-1) {
        size_t v6 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    close(v5);
    v8 = 0;
    if (v6 && v7)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v8 = (void *)[v9 initWithBytesNoCopy:v7 length:v6 deallocator:*MEMORY[0x1E4F28210]];
    }
  }

  return v8;
}

- (BOOL)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex
{
  kern_return_t v19;
  int v20;
  NSObject *v21;
  char v22;
  id v23;
  const std::__fs::filesystem::path *v24;
  id v25;
  const std::__fs::filesystem::path *v26;
  std::error_code *v27;
  int v28;
  NSObject *v29;

  id v4 = a3;
  int v5 = [v4 path];
  size_t v6 = [v5 stringByAppendingPathExtension:@"tmp"];

  size_t v7 = [a1 length];
  v8 = (void *)[a1 bytes];
  id v9 = v6;
  int v10 = open_dprotected_np((const char *)[v9 UTF8String], 1538, 4, 0, 420);
  if (v10 != -1)
  {
    int v11 = v10;
    if (lseek(v10, v7 - 1, 0) != v7 - 1 || write(v11, "", 1uLL) == -1)
    {
      v14 = _ISDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:]();
      }
      goto LABEL_10;
    }
    v12 = mmap(0, v7, 3, 1, v11, 0);
    if (!v12)
    {
LABEL_11:
      close(v11);
      goto LABEL_12;
    }
    v13 = v12;
    if (v12 == (void *)-1)
    {
      v14 = _ISDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:].cold.6();
      }
LABEL_10:

      goto LABEL_11;
    }
    v19 = vm_copy(*MEMORY[0x1E4F14960], (vm_address_t)v8, v7, (vm_address_t)v12);
    if (v19)
    {
      v20 = v19;
      v21 = _ISDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:].cold.5(v20, v21);
      }
    }
    else
    {
      if (mmap(v8, v7, 3, 17, v11, 0) == v8)
      {
        v22 = 0;
        int v15 = 1;
        goto LABEL_25;
      }
      v21 = _ISDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:].cold.4((uint64_t)v9, v21);
      }
    }

    int v15 = 0;
    v22 = 1;
LABEL_25:
    munmap(v13, v7);
    close(v11);
    if (v22) {
      goto LABEL_13;
    }
    v23 = v9;
    v24 = (const std::__fs::filesystem::path *)[v23 UTF8String];
    v25 = [v4 path];
    v26 = (const std::__fs::filesystem::path *)[v25 UTF8String];
    rename(v24, v26, v27);
    LODWORD(v24) = v28;

    if (v24 != -1)
    {
      int v15 = 1;
      goto LABEL_13;
    }
    v29 = _ISDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:]((uint64_t)v23, v4);
    }

LABEL_12:
    int v15 = 0;
LABEL_13:
    BOOL v16 = v15 != 0;
    goto LABEL_17;
  }
  v17 = _ISDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[NSData(ISMutableStoreIndex) _ISMutableStoreIndex_makeBackedByFileAtURL:]();
  }

  BOOL v16 = 0;
LABEL_17:

  return v16;
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.1()
{
  __error();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5(&dword_1AE771000, v0, v1, "File at path: %@ could not be opened or created, error: %d\n", v2, v3, v4, v5, v6);
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.2()
{
  OUTLINED_FUNCTION_2();
  __error();
  OUTLINED_FUNCTION_4(&dword_1AE771000, v0, v1, "File at path: %@ coild not be sizes to fit %ld bytes, error: %d\n", v2, v3, v4, v5, 2u);
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.3(uint64_t a1, void *a2)
{
  v8 = [a2 path];
  __error();
  OUTLINED_FUNCTION_4(&dword_1AE771000, v2, v3, "rename from: %@ to %@ with error: %d", v4, v5, v6, v7, 2u);
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1AE771000, a2, OS_LOG_TYPE_FAULT, "Failed to remap the index buffer to: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.5(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1AE771000, a2, OS_LOG_TYPE_FAULT, "vm_copy failed: %x", (uint8_t *)v2, 8u);
}

- (void)_ISMutableStoreIndex_makeBackedByFileAtURL:()ISMutableStoreIndex .cold.6()
{
  __error();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5(&dword_1AE771000, v0, v1, "Could not mmap(...) file at path: %@, error: %d\n", v2, v3, v4, v5, v6);
}

@end