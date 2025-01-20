@interface NSURL(CopyFile)
+ (uint64_t)fp_createEmptyTempFileWithName:()CopyFile completion:;
+ (uint64_t)fp_createEmptyTempPackageWithName:()CopyFile completion:;
+ (void)_fp_createInTempDirectoryWithName:()CopyFile creationBlock:completion:;
- (id)fp_copyToTempFolderWithFilename:()CopyFile queue:precomputedItemSize:completion:;
- (id)fp_copyToURL:()CopyFile queue:precomputedItemSize:replacePlaceholder:completion:;
- (id)fp_copyToURL:()CopyFile queue:precomputedItemSize:replacePlaceholder:shouldCopyAppleDouble:completion:;
- (uint64_t)fp_getSize:()CopyFile error:;
- (uint64_t)fp_volumeUsesAppleDouble:()CopyFile;
@end

@implementation NSURL(CopyFile)

- (uint64_t)fp_getSize:()CopyFile error:
{
  id v7 = 0;
  int v4 = [a1 getResourceValue:&v7 forKey:*MEMORY[0x1E4F1C5F8] error:0];
  if (a3)
  {
    if (v4) {
      BOOL v5 = v7 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      *a3 = [v7 unsignedLongLongValue];
    }
  }
  return 1;
}

- (uint64_t)fp_volumeUsesAppleDouble:()CopyFile
{
  v3 = [a3 URLByDeletingLastPathComponent];
  id v11 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C950];
  id v10 = 0;
  [v3 getResourceValue:&v11 forKey:v4 error:&v10];
  id v5 = v11;
  id v6 = v10;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(NSURL(CopyFile) *)(uint64_t)v3 fp_volumeUsesAppleDouble:v7];
    }

    uint64_t v8 = 0;
  }
  else if ([v5 isEqualToString:@"exfat"])
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = [v5 isEqualToString:@"msdos"];
  }

  return v8;
}

- (id)fp_copyToURL:()CopyFile queue:precomputedItemSize:replacePlaceholder:shouldCopyAppleDouble:completion:
{
  id v15 = a3;
  queue = a4;
  v16 = a8;
  if (a5) {
    uint64_t v17 = a5;
  }
  else {
    uint64_t v17 = -1;
  }
  v18 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:v17];
  memset(&v67, 0, sizeof(v67));
  id v19 = [a1 path];
  int v20 = lstat((const char *)[v19 fileSystemRepresentation], &v67);

  if (!v20)
  {
    unsigned int v43 = a7;
    mode_t st_mode = v67.st_mode;
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x2020000000;
    int v46 = a6;
    if (a6) {
      int v22 = 268697614;
    }
    else {
      int v22 = 268828686;
    }
    int v66 = v22;
    memset(&v62, 0, sizeof(v62));
    memset(&v61, 0, sizeof(v61));
    v45 = v15;
    v23 = objc_msgSend(v15, "path", a2);
    id v24 = [v23 stringByDeletingLastPathComponent];
    if (stat((const char *)[v24 fileSystemRepresentation], &v62))
    {
    }
    else
    {
      v25 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
      v26 = [v25 path];
      id v27 = [v26 stringByDeletingLastPathComponent];
      int v28 = stat((const char *)[v27 fileSystemRepresentation], &v61);

      if (!v28 && v67.st_dev == v62.st_dev && v67.st_dev == v61.st_dev) {
        *((_DWORD *)v64 + 6) |= 0x1000000u;
      }
    }
    if ((st_mode & 0xF000) == 0x4000)
    {
      *((_DWORD *)v64 + 6) |= 0x8000u;
      if (v46)
      {
        id v29 = [v45 path];
        if ((rmdir((const char *)[v29 fileSystemRepresentation]) & 0x80000000) == 0)
        {

LABEL_26:
          memset(&v60, 0, sizeof(v60));
          goto LABEL_27;
        }
        int v34 = *__error();

        if (v34 == 2) {
          goto LABEL_26;
        }
        v32 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
        v16[2](v16, 0, v32);
LABEL_24:

        id v33 = v18;
        _Block_object_dispose(&v63, 8);
        id v15 = v45;
        goto LABEL_29;
      }
      memset(&v60, 0, sizeof(v60));
    }
    else
    {
      memset(&v60, 0, sizeof(v60));
      if (v46) {
        goto LABEL_27;
      }
    }
    id v30 = [v45 path];
    int v31 = stat((const char *)[v30 fileSystemRepresentation], &v60);

    if (v31)
    {
LABEL_27:
      v35 = copyfile_state_alloc();
      copyfile_state_set(v35, 6u, copyfile_status_cb);
      v36 = objc_opt_new();
      [v36 setCopyError:0];
      [v36 setProgress:v18];
      v37 = objc_opt_new();
      [v36 setLastBytesCopiedByFile:v37];

      [v36 setShouldCopyAppleDouble:v43];
      copyfile_state_set(v35, 7u, v36);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __110__NSURL_CopyFile__fp_copyToURL_queue_precomputedItemSize_replacePlaceholder_shouldCopyAppleDouble_completion___block_invoke;
      block[3] = &unk_1E5AF4170;
      id v49 = v36;
      v50 = a1;
      id v15 = v45;
      id v38 = v45;
      char v58 = v43;
      stat v55 = v67;
      id v51 = v38;
      v54 = &v63;
      uint64_t v56 = v42;
      char v59 = v46;
      id v52 = v18;
      v53 = v16;
      v57 = v35;
      id v39 = v36;
      dispatch_async(queue, block);

      _Block_object_dispose(&v63, 8);
      goto LABEL_28;
    }
    v32 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:17 userInfo:0];
    v16[2](v16, 0, v32);
    goto LABEL_24;
  }
  v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
  v16[2](v16, 0, v21);

LABEL_28:
  id v40 = v18;
LABEL_29:

  return v18;
}

- (id)fp_copyToURL:()CopyFile queue:precomputedItemSize:replacePlaceholder:completion:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (objc_msgSend(a1, "fp_volumeUsesAppleDouble:", v12)) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = objc_msgSend(a1, "fp_volumeUsesAppleDouble:", a1) ^ 1;
  }
  v16 = objc_msgSend(a1, "fp_copyToURL:queue:precomputedItemSize:replacePlaceholder:shouldCopyAppleDouble:completion:", v12, v13, a5, a6, v15, v14);

  return v16;
}

- (id)fp_copyToTempFolderWithFilename:()CopyFile queue:precomputedItemSize:completion:
{
  id v8 = a4;
  id v9 = a6;
  id v10 = (void *)MEMORY[0x1E4F28CB8];
  id v11 = a3;
  id v12 = [v10 defaultManager];
  id v13 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_insecureTempDirectory");
  id v14 = [v13 path];
  uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v16 = [v15 UUIDString];
  uint64_t v17 = [v14 stringByAppendingPathComponent:v16];

  v18 = [v17 stringByAppendingPathComponent:v11];

  id v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v18 isDirectory:0];
  id v29 = 0;
  LOBYTE(v16) = [v12 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v29];
  id v20 = v29;
  if (v16)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __88__NSURL_CopyFile__fp_copyToTempFolderWithFilename_queue_precomputedItemSize_completion___block_invoke;
    v25[3] = &unk_1E5AF4198;
    id v28 = v9;
    id v26 = v19;
    id v27 = v17;
    v21 = objc_msgSend(a1, "fp_copyToURL:queue:precomputedItemSize:replacePlaceholder:completion:", v26, v8, a5, 1, v25);
  }
  else
  {
    (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v20);
    v21 = 0;
  }

  return v21;
}

+ (void)_fp_createInTempDirectoryWithName:()CopyFile creationBlock:completion:
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F28CB8];
  id v10 = a3;
  id v11 = [v9 defaultManager];
  id v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_insecureTempDirectory");
  id v13 = [v12 path];
  uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v15 = [(id)v14 UUIDString];
  uint64_t v16 = [v13 stringByAppendingPathComponent:v15];

  uint64_t v17 = [v16 stringByAppendingPathComponent:v10];

  v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17 isDirectory:0];
  id v25 = 0;
  LOBYTE(v14) = [v11 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v19 = v25;
  id v20 = v19;
  if (v14)
  {
    id v24 = v19;
    char v21 = v7[2](v7, v18, &v24);
    id v22 = v24;

    if (v21)
    {
      v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16 isDirectory:1];
      v8[2](v8, v18, v23, 0);
    }
    else
    {
      ((void (**)(id, void *, void *, id))v8)[2](v8, 0, 0, v22);
    }
    id v20 = v22;
  }
  else
  {
    ((void (**)(id, void *, void *, id))v8)[2](v8, 0, 0, v19);
  }
}

+ (uint64_t)fp_createEmptyTempFileWithName:()CopyFile completion:
{
  return objc_msgSend(a1, "_fp_createInTempDirectoryWithName:creationBlock:completion:", a3, &__block_literal_global_32, a4);
}

+ (uint64_t)fp_createEmptyTempPackageWithName:()CopyFile completion:
{
  return objc_msgSend(a1, "_fp_createInTempDirectoryWithName:creationBlock:completion:", a3, &__block_literal_global_68, a4);
}

- (void)fp_volumeUsesAppleDouble:()CopyFile .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v6 = *__error();
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  id v10 = v5;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] copyfile: statfs(%@) failed: %@ %{errno}d", (uint8_t *)&v7, 0x1Cu);
}

@end