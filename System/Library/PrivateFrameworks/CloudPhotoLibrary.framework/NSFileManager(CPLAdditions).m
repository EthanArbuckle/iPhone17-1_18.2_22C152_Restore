@interface NSFileManager(CPLAdditions)
- (BOOL)cplCopyItemAtURL:()CPLAdditions toURL:error:;
- (BOOL)cplIsFileDoesNotExistError:()CPLAdditions;
- (BOOL)cplIsFileExistsError:()CPLAdditions;
- (uint64_t)cplFileExistsAtURL:()CPLAdditions;
- (uint64_t)cplMoveItemAtURL:()CPLAdditions toURL:error:;
@end

@implementation NSFileManager(CPLAdditions)

- (uint64_t)cplFileExistsAtURL:()CPLAdditions
{
  v4 = [a3 path];
  uint64_t v5 = [a1 fileExistsAtPath:v4];

  return v5;
}

- (BOOL)cplIsFileDoesNotExistError:()CPLAdditions
{
  id v3 = a3;
  v4 = [v3 domain];
  if (![v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {

    goto LABEL_5;
  }
  if ([v3 code] == 4)
  {
    BOOL v5 = 1;
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v7 = [v3 code];

  if (v7 != 260)
  {
LABEL_5:
    v6 = [v3 cplUnderlyingPOSIXError];
    v4 = v6;
    if (v6) {
      BOOL v5 = [v6 code] == 2;
    }
    else {
      BOOL v5 = 0;
    }
    goto LABEL_10;
  }
  BOOL v5 = 1;
LABEL_11:

  return v5;
}

- (BOOL)cplIsFileExistsError:()CPLAdditions
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 516)
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v7 = [v3 cplUnderlyingPOSIXError];
  v8 = v7;
  if (v7) {
    BOOL v6 = [v7 code] == 17;
  }
  else {
    BOOL v6 = 0;
  }

LABEL_9:
  return v6;
}

- (uint64_t)cplMoveItemAtURL:()CPLAdditions toURL:error:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v11 = (const std::__fs::filesystem::path *)[v10 fileSystemRepresentation];
  id v12 = v9;
  v13 = (const std::__fs::filesystem::path *)[v12 fileSystemRepresentation];
  rename(v11, v13, v14);
  if (!v15) {
    goto LABEL_5;
  }
  if (*__error() != 18)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      uint64_t v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    uint64_t v21 = 0;
    goto LABEL_14;
  }
  if (![a1 cplCopyItemAtURL:v10 toURL:v12 error:a5]) {
    goto LABEL_13;
  }
  [a1 removeItemAtURL:v10 error:0];
LABEL_5:
  uint64_t v28 = *MEMORY[0x1E4F28370];
  v29[0] = *MEMORY[0x1E4F28358];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  v17 = [v12 path];
  id v23 = 0;
  char v18 = [a1 setAttributes:v16 ofItemAtPath:v17 error:&v23];
  id v19 = v23;

  if ((v18 & 1) == 0 && !_CPLSilentLogging)
  {
    v20 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v19;
      _os_log_impl(&dword_1B4CAC000, v20, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
    }
  }
  uint64_t v21 = 1;
LABEL_14:

  return v21;
}

- (BOOL)cplCopyItemAtURL:()CPLAdditions toURL:error:
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (const char *)[a3 fileSystemRepresentation];
  id v10 = v8;
  int v11 = copyfile(v9, (const char *)[v10 fileSystemRepresentation], 0, 0x1200008u);
  if (v11)
  {
    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
    }
  }
  else
  {
    uint64_t v23 = *MEMORY[0x1E4F28370];
    v24[0] = *MEMORY[0x1E4F28358];
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v13 = [v10 path];
    id v18 = 0;
    char v14 = [a1 setAttributes:v12 ofItemAtPath:v13 error:&v18];
    id v15 = v18;

    if ((v14 & 1) == 0 && !_CPLSilentLogging)
    {
      v16 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v10;
        __int16 v21 = 2112;
        id v22 = v15;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
      }
    }
  }

  return v11 == 0;
}

@end