@interface NSFileManager(NSFileManagerAdditions)
+ (__CFString)mf_defaultVolumeMountPoint;
- (BOOL)mf_setValue:()NSFileManagerAdditions forExtendedAttribute:ofItemAtPath:error:;
- (id)mf_copyFileAtURLToContainer:()NSFileManagerAdditions securityScoped:preferredFileName:error:;
- (id)mf_fileModificationDateAtPath:()NSFileManagerAdditions traverseLink:;
- (id)mf_makeUniqueFileInDirectory:()NSFileManagerAdditions;
- (id)mf_pathsAtDirectory:()NSFileManagerAdditions beginningWithString:;
- (id)mf_valueForExtendedAttribute:()NSFileManagerAdditions ofItemAtPath:error:;
- (id)mf_verifyProtectionClassesForFilesInDirectory:()NSFileManagerAdditions usingBlock:;
- (uint64_t)mf_canWriteToDirectoryAtPath:()NSFileManagerAdditions;
- (uint64_t)mf_makeCompletePath:()NSFileManagerAdditions mode:;
- (uint64_t)mf_protectFileAtPath:()NSFileManagerAdditions withClass:error:;
- (uint64_t)mf_sizeForDirectoryAtPath:()NSFileManagerAdditions error:;
- (uint64_t)mf_sizeForDirectoryAtURL:()NSFileManagerAdditions error:;
@end

@implementation NSFileManager(NSFileManagerAdditions)

+ (__CFString)mf_defaultVolumeMountPoint
{
  return @"/private/var/mobile";
}

- (id)mf_makeUniqueFileInDirectory:()NSFileManagerAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v15 = -86;
  char v5 = [a1 fileExistsAtPath:v4 isDirectory:&v15];
  if (v15) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  if ((v6 & 1) == 0)
  {
    v12 = 0;
    goto LABEL_14;
  }
  memset(__b, 170, sizeof(__b));
  v7 = NSString;
  v8 = [MEMORY[0x1E4F29060] currentThread];
  v9 = objc_msgSend(v7, "stringWithFormat:", @"Mail-T%p.tmp.XXXXXX", v8);
  v10 = [v4 stringByAppendingPathComponent:v9];

  if (([v10 getFileSystemRepresentation:__b maxLength:1025] & 1) == 0)
  {
    v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1AFB03000, v13, OS_LOG_TYPE_DEFAULT, "#Warning *** Warning: invalid path %@", buf, 0xCu);
    }

    goto LABEL_12;
  }
  v11 = mktemp(__b);
  if (!v11)
  {
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v12 = [a1 stringWithFileSystemRepresentation:v11 length:strlen(v11)];
LABEL_13:

LABEL_14:
  return v12;
}

- (uint64_t)mf_makeCompletePath:()NSFileManagerAdditions mode:
{
  return MEMORY[0x1F41092F8](a3, a4);
}

- (uint64_t)mf_canWriteToDirectoryAtPath:()NSFileManagerAdditions
{
  id v4 = a3;
  char v8 = 0;
  if ([a1 fileExistsAtPath:v4 isDirectory:&v8])
  {
    if (v8) {
      uint64_t v5 = [a1 isWritableFileAtPath:v4];
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    char v6 = [v4 stringByDeletingLastPathComponent];
    uint64_t v5 = objc_msgSend(a1, "mf_canWriteToDirectoryAtPath:", v6);
  }
  return v5;
}

- (id)mf_copyFileAtURLToContainer:()NSFileManagerAdditions securityScoped:preferredFileName:error:
{
  id v9 = a3;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4F1CB10];
  v12 = NSTemporaryDirectory();
  v13 = [v11 fileURLWithPath:v12];

  v14 = [MEMORY[0x1E4F29128] UUID];
  char v15 = [v14 UUIDString];
  v16 = [v13 URLByAppendingPathComponent:v15 isDirectory:1];

  v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v17 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:a6])
  {
    if (v10)
    {
      id v18 = v10;
    }
    else
    {
      id v18 = [v9 lastPathComponent];
    }
    v21 = v18;
    v20 = [v16 URLByAppendingPathComponent:v18];

    if (a4) {
      [v9 startAccessingSecurityScopedResource];
    }
    int v22 = [v17 copyItemAtURL:v9 toURL:v20 error:a6];
    if (a4) {
      [v9 stopAccessingSecurityScopedResource];
    }
    if (v22) {
      v23 = v20;
    }
    else {
      v23 = 0;
    }
    id v19 = v23;
  }
  else
  {
    id v19 = 0;
    v20 = v16;
  }

  return v19;
}

- (id)mf_fileModificationDateAtPath:()NSFileManagerAdditions traverseLink:
{
  id v5 = a3;
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v12.st_blksize = v6;
  *(timespec *)v12.st_qspare = v6;
  v12.st_birthtimespec = v6;
  *(timespec *)&v12.st_size = v6;
  v12.st_mtimespec = v6;
  v12.st_ctimespec = v6;
  *(timespec *)&v12.st_uid = v6;
  v12.st_atimespec = v6;
  *(timespec *)&v12.st_dev = v6;
  id v7 = v5;
  char v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation", *(_OWORD *)&v12.st_dev, *(_OWORD *)&v12.st_uid, *(_OWORD *)&v12.st_atimespec);
  if (a4) {
    int v9 = stat(v8, &v12);
  }
  else {
    int v9 = lstat(v8, &v12);
  }
  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v12.st_mtimespec.tv_sec];
  }

  return v10;
}

- (uint64_t)mf_sizeForDirectoryAtPath:()NSFileManagerAdditions error:
{
  timespec v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
  uint64_t v7 = objc_msgSend(a1, "mf_sizeForDirectoryAtURL:error:", v6, a4);

  return v7;
}

- (uint64_t)mf_sizeForDirectoryAtURL:()NSFileManagerAdditions error:
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 fileSystemRepresentation];
  if ((dirstat_np() & 0x80000000) != 0)
  {
    if (a4)
    {
      v12[0] = *MEMORY[0x1E4F28568];
      uint64_t v7 = NSString;
      char v8 = __error();
      int v9 = [v7 stringWithUTF8String:strerror(*v8)];
      v12[1] = *MEMORY[0x1E4F289D0];
      v13[0] = v9;
      v13[1] = v5;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v10];
    }
    uint64_t v6 = -1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)mf_pathsAtDirectory:()NSFileManagerAdditions beginningWithString:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [a1 contentsOfDirectoryAtPath:v6 error:0];
  int v9 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasPrefix:", v7, (void)v17))
        {
          char v15 = [v6 stringByAppendingPathComponent:v14];
          [v9 addObject:v15];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v9;
}

- (uint64_t)mf_protectFileAtPath:()NSFileManagerAdditions withClass:error:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    switch(a4)
    {
      case 3:
        uint64_t v16 = *MEMORY[0x1E4F28370];
        uint64_t v17 = *MEMORY[0x1E4F28358];
        int v9 = &v16;
        id v10 = &v17;
        break;
      case 2:
        uint64_t v18 = *MEMORY[0x1E4F28370];
        uint64_t v19 = *MEMORY[0x1E4F28348];
        int v9 = &v18;
        id v10 = &v19;
        break;
      case 1:
        uint64_t v20 = *MEMORY[0x1E4F28370];
        v21[0] = *MEMORY[0x1E4F28340];
        int v9 = &v20;
        id v10 = v21;
        break;
      default:
        uint64_t v14 = *MEMORY[0x1E4F28370];
        uint64_t v15 = *MEMORY[0x1E4F28378];
        int v9 = &v14;
        id v10 = &v15;
        break;
    }
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:1];
    uint64_t v11 = [a1 setAttributes:v12 ofItemAtPath:v8 error:a5];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)mf_setValue:()NSFileManagerAdditions forExtendedAttribute:ofItemAtPath:error:
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = a5;
  uint64_t v12 = v11;
  if (v9)
  {
    v13 = (const char *)[(__CFString *)v11 fileSystemRepresentation];
    uint64_t v14 = (const char *)[v10 UTF8String];
    id v15 = v9;
    int v16 = setxattr(v13, v14, (const void *)[v15 bytes], objc_msgSend(v15, "length"), 0, 0);
  }
  else
  {
    int v16 = removexattr((const char *)-[__CFString fileSystemRepresentation](v11, "fileSystemRepresentation"), (const char *)[v10 UTF8String], 0);
  }
  int v17 = v16;
  if (a6 && v16)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *__error();
    if (v12) {
      uint64_t v20 = v12;
    }
    else {
      uint64_t v20 = &stru_1F08428B0;
    }
    uint64_t v23 = *MEMORY[0x1E4F28328];
    v24[0] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a6 = [v18 errorWithDomain:*MEMORY[0x1E4F28798] code:v19 userInfo:v21];
  }
  return v17 == 0;
}

- (id)mf_valueForExtendedAttribute:()NSFileManagerAdditions ofItemAtPath:error:
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (const char *)[(__CFString *)v8 fileSystemRepresentation];
  id v10 = v7;
  uint64_t v11 = (const char *)[v10 UTF8String];
  ssize_t v12 = getxattr(v9, v11, 0, 0, 0, 0);
  if (v12 < 0)
  {
    if (a5)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *__error();
      if (v8) {
        v21 = v8;
      }
      else {
        v21 = &stru_1F08428B0;
      }
      uint64_t v23 = *MEMORY[0x1E4F28328];
      v24 = v21;
      int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      uint64_t v18 = [v19 errorWithDomain:*MEMORY[0x1E4F28798] code:v20 userInfo:v17];
      id v13 = 0;
      goto LABEL_13;
    }
    id v13 = 0;
  }
  else
  {
    id v13 = +[MFMutableData dataWithCapacity:v12];
    ssize_t v14 = getxattr(v9, v11, (void *)[v13 mutableBytes], v12, 0, 0);
    if (a5 && v14 != v12)
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      if (v8) {
        int v16 = v8;
      }
      else {
        int v16 = &stru_1F08428B0;
      }
      uint64_t v25 = *MEMORY[0x1E4F28328];
      v26[0] = v16;
      int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      uint64_t v18 = [v15 errorWithDomain:*MEMORY[0x1E4F28798] code:5 userInfo:v17];
LABEL_13:
      *a5 = v18;
    }
  }

  return v13;
}

- (id)mf_verifyProtectionClassesForFilesInDirectory:()NSFileManagerAdditions usingBlock:
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v25 = a4;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v24 = *MEMORY[0x1E4F1C590];
  v32[0] = *MEMORY[0x1E4F1C590];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  id v7 = [a1 enumeratorAtURL:v21 includingPropertiesForKeys:v6 options:0 errorHandler:&__block_literal_global_10];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    id v10 = (void *)*MEMORY[0x1E4F1C598];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        ssize_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v13 = v25[2](v25, v12);
        id v14 = v10;
        id v15 = v14;
        if (v13)
        {
          id v26 = 0;
          int v16 = [v12 getResourceValue:&v26 forKey:v24 error:0];
          id v17 = v26;

          if (v16 && ([v17 isEqualToString:v13] & 1) == 0)
          {
            uint64_t v18 = [v12 URLByStandardizingPath];
            uint64_t v19 = [v18 standardizedURL];
            [v22 setObject:v13 forKeyedSubscript:v19];
          }
        }
        else
        {
          id v17 = v14;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  return v22;
}

@end