@interface NSData(DMCUtilities)
+ (id)_DMCCreateFolderExistError;
+ (uint64_t)DMCDataWithCFData:()DMCUtilities;
- (id)DMCHexString;
- (id)DMCSHA256Hash;
- (uint64_t)DMCAtomicWriteToPath:()DMCUtilities error:;
- (uint64_t)DMCAtomicWriteToURL:()DMCUtilities error:;
@end

@implementation NSData(DMCUtilities)

- (id)DMCHexString
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  v3 = (unsigned __int8 *)[a1 bytes];
  v4 = (char *)v9 - ((2 * v2 + 16) & 0xFFFFFFFFFFFFFFF0);
  if (v2)
  {
    v5 = (char *)v9 - ((2 * v2 + 16) & 0xFFFFFFFFFFFFFFF0);
    do
    {
      unsigned int v6 = *v3++;
      char *v5 = DMCHexString_digits[(unint64_t)v6 >> 4];
      v4 = v5 + 2;
      v5[1] = DMCHexString_digits[v6 & 0xF];
      v5 += 2;
      --v2;
    }
    while (v2);
  }
  unsigned char *v4 = 0;
  v7 = objc_msgSend(NSString, "stringWithCString:encoding:");
  return v7;
}

- (id)DMCSHA256Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];
  return v2;
}

- (uint64_t)DMCAtomicWriteToPath:()DMCUtilities error:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned __int8 v36 = 0;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6 isDirectory:&v36];
  int v9 = v36;

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
    v12 = [v11 URLByDeletingLastPathComponent];
    v13 = NSString;
    v14 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v15 = [v14 UUIDString];
    v16 = [(id)v15 substringToIndex:8];
    v17 = [v11 lastPathComponent];
    v18 = [v13 stringWithFormat:@".temp-%@-%@", v16, v17];

    v19 = [v12 URLByAppendingPathComponent:v18];
    id v35 = 0;
    LOBYTE(v15) = [a1 writeToURL:v19 options:0 error:&v35];
    id v20 = v35;
    if (v15)
    {
      v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v34 = v20;
      char v22 = [v21 replaceItemAtURL:v11 withItemAtURL:v19 backupItemName:0 options:1 resultingItemURL:0 error:&v34];
      id v23 = v34;

      v24 = *DMCLogObjects();
      if (v22)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          id v38 = v11;
          _os_log_impl(&dword_1A7863000, v24, OS_LOG_TYPE_DEBUG, "Wrote file atomically in-place: %{public}@", buf, 0xCu);
        }
        uint64_t v25 = 1;
        id v20 = v23;
        goto LABEL_28;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v38 = v23;
        _os_log_impl(&dword_1A7863000, v24, OS_LOG_TYPE_ERROR, "Failed to replace original file: %{public}@", buf, 0xCu);
      }
      if (a4) {
        *a4 = v23;
      }
      v29 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v33 = v23;
      char v30 = [v29 removeItemAtURL:v19 error:&v33];
      id v20 = v33;

      if ((v30 & 1) == 0)
      {
        v31 = *DMCLogObjects();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v38 = v20;
          _os_log_impl(&dword_1A7863000, v31, OS_LOG_TYPE_ERROR, "Failed to remove temporary file: %{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      v28 = *DMCLogObjects();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v38 = v20;
        _os_log_impl(&dword_1A7863000, v28, OS_LOG_TYPE_ERROR, "Failed to write temporary file: %{public}@", buf, 0xCu);
      }
      if (a4)
      {
        id v20 = v20;
        uint64_t v25 = 0;
        *a4 = v20;
LABEL_28:

        goto LABEL_29;
      }
    }
    uint64_t v25 = 0;
    goto LABEL_28;
  }
  v26 = *DMCLogObjects();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v38 = v6;
    _os_log_impl(&dword_1A7863000, v26, OS_LOG_TYPE_ERROR, "Failed to write temporary file since a directory is present: %{public}@", buf, 0xCu);
  }
  if (a4)
  {
    [MEMORY[0x1E4F1C9B8] _DMCCreateFolderExistError];
    uint64_t v25 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v25 = 0;
  }
LABEL_29:

  return v25;
}

- (uint64_t)DMCAtomicWriteToURL:()DMCUtilities error:
{
  id v6 = [a3 path];
  uint64_t v7 = [a1 DMCAtomicWriteToPath:v6 error:a4];

  return v7;
}

+ (uint64_t)DMCDataWithCFData:()DMCUtilities
{
  v4 = (void *)MEMORY[0x1E4F1C9B8];
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  return [v4 dataWithBytes:BytePtr length:Length];
}

+ (id)_DMCCreateFolderExistError
{
  int v8 = (void *)MEMORY[0x1E4F28C58];
  int v9 = DMCErrorArray(@"ERROR_DIRECTORY_EXIST_AT_DESTINATION", a2, a3, a4, a5, a6, a7, a8, 0);
  BOOL v10 = [v8 DMCErrorWithDomain:@"DMCInternalErrorDomain" code:5 descriptionArray:v9 errorType:0];

  return v10;
}

@end