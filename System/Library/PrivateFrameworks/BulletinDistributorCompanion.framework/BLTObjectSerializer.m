@interface BLTObjectSerializer
+ (id)serializeObject:(id)a3 nulls:(id *)a4 error:(id *)a5;
+ (id)unserializeObject:(id)a3 nulls:(id)a4 error:(id *)a5;
+ (unint64_t)sizeOfObject:(id)a3;
@end

@implementation BLTObjectSerializer

+ (id)serializeObject:(id)a3 nulls:(id *)a4 error:(id *)a5
{
  id v18 = 0;
  v7 = [a3 objectWithNoNSNulls:&v18];
  id v8 = v18;
  if (v7)
  {
    id v17 = 0;
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)&v17);
    CFDataRef v11 = Data;
    if (!v17 || Data)
    {
      if (a4 && v8)
      {
        CFDataRef v13 = CFPropertyListCreateData(v9, v8, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)&v17);
        CFDataRef v14 = v13;
        if (!v17 || v13)
        {
          *a4 = v13;
        }
        else
        {
          v15 = blt_general_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            +[BLTObjectSerializer serializeObject:nulls:error:]((uint64_t *)&v17, v15);
          }

          if (a5) {
            *a5 = v17;
          }
          CFRelease(v17);
        }
      }
    }
    else
    {
      v12 = blt_general_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[BLTObjectSerializer serializeObject:nulls:error:]();
      }

      if (a5) {
        *a5 = v17;
      }
      CFRelease(v17);
    }
  }
  else
  {
    CFDataRef v11 = 0;
  }

  return v11;
}

+ (id)unserializeObject:(id)a3 nulls:(id)a4 error:(id *)a5
{
  CFDataRef v7 = (const __CFData *)a3;
  CFDataRef v8 = (const __CFData *)a4;
  if (!v7)
  {
LABEL_9:
    CFDataRef v11 = 0;
    goto LABEL_20;
  }
  CFErrorRef error = 0;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFPropertyListRef v10 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, 0, 0, &error);
  CFDataRef v11 = (void *)v10;
  if (error && !v10)
  {
    v12 = blt_general_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[BLTObjectSerializer unserializeObject:nulls:error:]();
    }

    if (a5) {
      *a5 = error;
    }
    CFRelease(error);
    goto LABEL_9;
  }
  if (v8)
  {
    id v18 = 0;
    CFPropertyListRef v13 = CFPropertyListCreateWithData(v9, v8, 0, 0, (CFErrorRef *)&v18);
    CFDataRef v14 = (void *)v13;
    if (!v18 || v13)
    {
      uint64_t v16 = [v11 objectWithNSNulls:v13];

      CFDataRef v11 = (void *)v16;
    }
    else
    {
      v15 = blt_general_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[BLTObjectSerializer unserializeObject:nulls:error:]();
      }

      if (a5) {
        *a5 = v18;
      }
      CFRelease(v18);
    }
  }
LABEL_20:

  return v11;
}

+ (unint64_t)sizeOfObject:(id)a3
{
  return objc_msgSend(a3, "blt_sizeof");
}

+ (void)serializeObject:(uint64_t *)a1 nulls:(NSObject *)a2 error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = 0;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Failed to serialized value (%@) with error: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)serializeObject:nulls:error:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_222F4C000, v0, v1, "Failed to serialized value (%@) with error: %@");
}

+ (void)unserializeObject:nulls:error:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_222F4C000, v0, v1, "Failed to unserialized data (%@) with error: %@");
}

@end