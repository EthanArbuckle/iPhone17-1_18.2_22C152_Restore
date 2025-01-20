@interface NSFileManager(CalClassAdditions)
+ (__CFString)mimeTypeForFile:()CalClassAdditions;
- (BOOL)makeCompletePath:()CalClassAdditions mode:;
- (char)makeUniqueDirectoryWithPath:()CalClassAdditions;
- (id)CalTemporaryDirectoryAppropriateForURL:()CalClassAdditions;
- (id)archivedDataAtPath:()CalClassAdditions createPKZipArchive:error:;
- (uint64_t)archivePathToFile:()CalClassAdditions toFile:createPKZipArchive:;
- (uint64_t)archivePathToFile:()CalClassAdditions toFile:createPKZipArchive:error:;
- (uint64_t)archiveURLToFile:()CalClassAdditions toFile:createPKZipArchive:;
- (uint64_t)archiveURLToFile:()CalClassAdditions toFile:createPKZipArchive:error:;
- (uint64_t)archivedDataAtPath:()CalClassAdditions createPKZipArchive:;
@end

@implementation NSFileManager(CalClassAdditions)

+ (__CFString)mimeTypeForFile:()CalClassAdditions
{
  v3 = [a3 pathExtension];
  v4 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v3];
  v5 = [v4 preferredMIMEType];
  if ([v5 length])
  {
    v6 = v5;
  }
  else
  {
    v7 = [v4 identifier];
    int v8 = [v7 isEqualToString:@"com.apple.traditional-mac-plain-text"];

    if (v8) {
      v6 = @"text/plain";
    }
    else {
      v6 = @"application/octet-stream";
    }
  }

  return v6;
}

- (char)makeUniqueDirectoryWithPath:()CalClassAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([a1 fileExistsAtPath:v4] & 1) != 0
    || ![a1 makeCompletePath:v4 mode:448]
    || (v5 = (char *)v4) == 0)
  {
    strcpy(v19, ".tmp.XXXXXX");
    v6 = (const void *)[MEMORY[0x1E4F29060] currentThread];
    objc_msgSend(NSString, "stringWithFormat:", @"-T%p", v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    int v8 = (const char *)[v7 UTF8String];
    if (strlen(v8) >= 0x11)
    {
      v9 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[NSFileManager(CalClassAdditions) makeUniqueDirectoryWithPath:](v9);
      }
    }
    if ([v4 getFileSystemRepresentation:__s maxLength:1053])
    {
      size_t v10 = strlen(__s);
      uint64_t v11 = 1024;
      if (v10 < 0x400) {
        uint64_t v11 = v10;
      }
      v12 = &__s[v11];
      size_t v13 = strlen(v8);
      snprintf(v12, v13, "-T%p", v6);
      __strlcat_chk();
      v5 = mkdtemp(__s);
      if (!v5
        && *__error() == 2
        && ([MEMORY[0x1E4F28CB8] defaultManager],
            v14 = objc_claimAutoreleasedReturnValue(),
            [v4 stringByDeletingLastPathComponent],
            v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = [v14 makeCompletePath:v15 mode:448],
            v15,
            v14,
            v16))
      {
        [v4 getFileSystemRepresentation:__s maxLength:1053];
        __strlcat_chk();
        v5 = mkdtemp(__s);
      }
      else
      {
        *__error() = 2;
      }
      if (v5)
      {
        v5 = [a1 stringWithFileSystemRepresentation:v5 length:strlen(v5)];
      }
    }
    else
    {
      NSLog(&cfstr_WarningInvalid.isa, v4);

      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)makeCompletePath:()CalClassAdditions mode:
{
  id v6 = a3;
  if (a4)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    int v8 = [NSNumber numberWithInt:a4];
    v9 = objc_msgSend(v7, "initWithObjectsAndKeys:", v8, *MEMORY[0x1E4F28330], 0);
  }
  else
  {
    v9 = 0;
  }
  size_t v10 = [v6 stringByStandardizingPath];

  uint64_t v11 = [v10 pathComponents];
  unint64_t v12 = [v11 count];
  id v13 = v10;
  v14 = v13;
  if (v12)
  {
    unint64_t v15 = v12;
    int v16 = v13;
    while (([a1 fileExistsAtPath:v16] & 1) == 0)
    {
      v17 = [v16 stringByDeletingLastPathComponent];

      int v16 = v17;
      if (!--v15) {
        goto LABEL_11;
      }
    }
    v17 = v16;
  }
  else
  {
    unint64_t v15 = 0;
    v17 = v13;
  }
LABEL_11:
  if (v15 >= v12)
  {
LABEL_15:
    BOOL v18 = 1;
  }
  else
  {
    BOOL v18 = 0;
    while (1)
    {
      v19 = v17;
      uint64_t v20 = [v11 objectAtIndex:v15];
      v17 = [v17 stringByAppendingPathComponent:v20];

      if (([a1 createDirectoryAtPath:v17 withIntermediateDirectories:0 attributes:v9 error:0] & 1) == 0) {
        break;
      }

      BOOL v18 = ++v15 >= v12;
      if (v12 == v15) {
        goto LABEL_15;
      }
    }
    NSLog(&cfstr_CouldnTCreateP.isa, v17);
  }
  return v18;
}

- (id)archivedDataAtPath:()CalClassAdditions createPKZipArchive:error:
{
  keys[6] = *(void **)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a1;
  size_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v8 options:0 error:a5];
  uint64_t v11 = v10;
  if (!v10)
  {
    v21 = 0;
    goto LABEL_26;
  }
  id v35 = v9;
  unint64_t v12 = [v10 filename];
  id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  v14 = [v13 CalTemporaryDirectoryAppropriateForURL:v8];
  unint64_t v15 = [v14 URLByAppendingPathComponent:@"com.apple.iCal.SavedAttachment"];
  int v16 = [v15 path];
  v17 = [v13 makeUniqueDirectoryWithPath:v16];

  BOOL v18 = [v17 stringByAppendingPathComponent:v12];
  if (v18)
  {
    v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v18];
    int v20 = [v11 writeToURL:v19 options:0 originalContentsURL:0 error:a5];

    v21 = 0;
    if (!v20) {
      goto LABEL_23;
    }
    uint64_t v22 = BOMCopierNew();
    if (a4) {
      v23 = @"createPKZip";
    }
    else {
      v23 = @"createCPIO";
    }
    v24 = CFWriteStreamCreateWithAllocatedBuffers(0, 0);
    if (v24)
    {
      v25 = v24;
      if (CFWriteStreamOpen(v24))
      {
        keys[0] = v23;
        keys[1] = @"sequesterResources";
        keys[2] = @"keepParent";
        keys[3] = @"copyResources";
        keys[4] = @"compress";
        keys[5] = @"outputStream";
        v26 = (void *)*MEMORY[0x1E4F1CFD0];
        v27 = (void *)*MEMORY[0x1E4F1CFC8];
        if (a4) {
          v28 = (void *)*MEMORY[0x1E4F1CFD0];
        }
        else {
          v28 = (void *)*MEMORY[0x1E4F1CFC8];
        }
        values[0] = *(void **)MEMORY[0x1E4F1CFD0];
        values[1] = v28;
        values[2] = v26;
        values[3] = v26;
        if (a4) {
          v26 = v27;
        }
        values[4] = v26;
        values[5] = v25;
        CFDictionaryRef v29 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 6, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        uint64_t v30 = v22;
        BOMCopierSetUserData();
        BOMCopierSetFatalErrorHandler();
        BOMCopierSetFatalFileErrorHandler();
        [v18 fileSystemRepresentation];
        v21 = 0;
        if (!BOMCopierCopyWithOptions()) {
          v21 = (void *)CFWriteStreamCopyProperty(v25, (CFStreamPropertyKey)*MEMORY[0x1E4F1D440]);
        }
        if (v29) {
          CFRelease(v29);
        }
        if (v30) {
          BOMCopierFree();
        }
      }
      else
      {
        v34 = objc_msgSend(NSString, "stringWithUTF8String:", "NSData *_archiveForURL(__strong id, NSURL *__strong, BOOL, NSError *__autoreleasing *)");
        NSLog(&cfstr_UnableToOpenWr.isa, v34, v25);

        v21 = 0;
      }
      CFRelease(v25);
      if (!v17) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    v31 = objc_msgSend(NSString, "stringWithUTF8String:", "NSData *_archiveForURL(__strong id, NSURL *__strong, BOOL, NSError *__autoreleasing *)");
    NSLog(&cfstr_UnableToCreate.isa, v31);
  }
  v21 = 0;
LABEL_23:
  if (v17)
  {
LABEL_24:
    v32 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v32 removeItemAtPath:v17 error:0];
  }
LABEL_25:

  id v9 = v35;
LABEL_26:

  return v21;
}

- (uint64_t)archivedDataAtPath:()CalClassAdditions createPKZipArchive:
{
  return [a1 archivedDataAtPath:a3 createPKZipArchive:a4 error:0];
}

- (uint64_t)archiveURLToFile:()CalClassAdditions toFile:createPKZipArchive:error:
{
  id v10 = a4;
  uint64_t v11 = [a1 archivedDataAtPath:a3 createPKZipArchive:a5];
  if (v11)
  {
    unint64_t v12 = [v10 path];
    uint64_t v13 = [v11 writeToFile:v12 options:0 error:a6];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (uint64_t)archiveURLToFile:()CalClassAdditions toFile:createPKZipArchive:
{
  return [a1 archiveURLToFile:a3 toFile:a4 createPKZipArchive:a5 error:0];
}

- (uint64_t)archivePathToFile:()CalClassAdditions toFile:createPKZipArchive:error:
{
  id v10 = (void *)MEMORY[0x1E4F1CB10];
  id v11 = a4;
  unint64_t v12 = [v10 fileURLWithPath:a3];
  uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];

  uint64_t v14 = [a1 archiveURLToFile:v12 toFile:v13 createPKZipArchive:a5 error:a6];
  return v14;
}

- (uint64_t)archivePathToFile:()CalClassAdditions toFile:createPKZipArchive:
{
  return [a1 archivePathToFile:a3 toFile:a4 createPKZipArchive:a5 error:0];
}

- (id)CalTemporaryDirectoryAppropriateForURL:()CalClassAdditions
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v6 = (void *)MEMORY[0x1E4F1CB10];
    id v7 = NSTemporaryDirectory();
    v5 = [v6 fileURLWithPath:v7];
  }
  id v12 = 0;
  id v8 = [a1 URLForDirectory:99 inDomain:1 appropriateForURL:v5 create:1 error:&v12];
  id v9 = v12;
  if (!v8)
  {
    id v10 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(NSFileManager(CalClassAdditions) *)(uint64_t)v4 CalTemporaryDirectoryAppropriateForURL:v10];
    }
  }

  return v8;
}

- (void)makeUniqueDirectoryWithPath:()CalClassAdditions .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "Unexpected pointer size or string formatting.", v1, 2u);
}

- (void)CalTemporaryDirectoryAppropriateForURL:()CalClassAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "Error finding temporary directory appropriate for %@: %@", (uint8_t *)&v3, 0x16u);
}

@end