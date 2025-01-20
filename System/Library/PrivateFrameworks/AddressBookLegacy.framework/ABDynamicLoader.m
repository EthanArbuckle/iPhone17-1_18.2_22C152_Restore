@interface ABDynamicLoader
+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5;
+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5 logging:(BOOL)a6;
@end

@implementation ABDynamicLoader

+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5 logging:(BOOL)a6
{
  BOOL v6 = a6;
  v8 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v10 = *a4;
  v11 = (void *)[(id)CPSystemRootDirectory() stringByAppendingPathComponent:a3];
  v12 = getenv("DYLD_FRAMEWORK_PATH");
  v13 = (void *)[v11 stringByDeletingLastPathComponent];
  if (v12)
  {
    v35 = v10;
    v36 = a5;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v14 = objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", v12), "componentsSeparatedByString:", @":");
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      v33 = v8;
      BOOL v34 = v6;
      uint64_t v17 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v19, "lowercaseString"), "containsString:", @"debug"))
          {
            v12 = (char *)[v19 cStringUsingEncoding:4];
            goto LABEL_12;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v16) {
          continue;
        }
        break;
      }
LABEL_12:
      BOOL v6 = v34;
      v8 = v33;
    }
    v20 = (const char *)[v11 fileSystemRepresentation];
    size_t v21 = strlen(v12);
    size_t v22 = v21 + strlen(v20) + 2;
    v23 = (char *)malloc_type_calloc(1uLL, v22, 0x43B19BCEuLL);
    strlcat(v23, v12, v22);
    strlcat(v23, "/", v22);
    strlcat(v23, (const char *)objc_msgSend((id)objc_msgSend(v13, "lastPathComponent"), "fileSystemRepresentation"), v22);
    strlcat(v23, "/", v22);
    strlcat(v23, (const char *)objc_msgSend((id)objc_msgSend(a3, "lastPathComponent"), "fileSystemRepresentation"), v22);
    uint64_t v24 = objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", v12), "stringByAppendingPathComponent:", objc_msgSend(v13, "lastPathComponent"));
    a5 = v36;
    if (v35) {
      goto LABEL_14;
    }
  }
  else
  {
    v23 = (char *)[v11 fileSystemRepresentation];
    v20 = 0;
    uint64_t v24 = (uint64_t)v13;
    v13 = 0;
    if (v10)
    {
LABEL_14:
      BOOL v25 = 1;
      goto LABEL_25;
    }
  }
  v26 = dlopen(v23, 2);
  *v8 = v26;
  if (v20 && !v26)
  {
    v26 = dlopen(v20, 2);
    *v8 = v26;
  }
  BOOL v25 = v26 != 0;
  if (!v26 && v6)
  {
    ABDiagnosticsEnabled();
    if (v20) {
      uint64_t v30 = (uint64_t)v20;
    }
    else {
      uint64_t v30 = (uint64_t)v23;
    }
    _ABLog2(3, (uint64_t)"+[ABDynamicLoader loadFrameworkAtPath:andStoreHandle:bundle:logging:]", 69, 0, @"Could not load framework at path: %s", v27, v28, v29, v30);
    BOOL v25 = 0;
  }
LABEL_25:
  if (a5)
  {
    v31 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:v24];
    *a5 = v31;
    if (!v31)
    {
      if (v13) {
        *a5 = (id)[MEMORY[0x1E4F28B50] bundleWithPath:v13];
      }
    }
  }
  if (v23 && v20) {
    free(v23);
  }
  return v25;
}

+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5
{
  return [a1 loadFrameworkAtPath:a3 andStoreHandle:a4 bundle:a5 logging:1];
}

@end