@interface NSURL(_QLUtilities)
+ (id)_QLCreateTemporaryReplacementURLForOriginalFileAtURL:()_QLUtilities withExtension:temporaryDirectoryURL:;
+ (id)_QLTemporaryURLWithExtension:()_QLUtilities openingFileHandle:inDirectoryAtURL:;
- (BOOL)_QLIsThumbnailableWithError:()_QLUtilities;
- (id)_QLFileSize;
- (id)_QLIssueFileExtensionWithSandboxType:()_QLUtilities;
- (id)_QLUrlFileSize;
- (id)_qlFastRealpathURL;
- (id)ql_realpathURL;
- (uint64_t)_QLIsDataLess;
- (uint64_t)_QLNeedsCoordination;
- (uint64_t)_QLNeedsDownload;
- (void)_QLFileSize;
- (void)_QLIsDataLess;
- (void)_QLNeedsDownload;
- (void)_QLUrlFileSize;
- (void)_qlFastRealpathURL;
- (void)ql_realpathURL;
@end

@implementation NSURL(_QLUtilities)

- (uint64_t)_QLNeedsCoordination
{
  id v5 = 0;
  uint64_t v1 = [a1 getPromisedItemResourceValue:&v5 forKey:*MEMORY[0x1E4F1C690] error:0];
  id v2 = v5;
  v3 = v2;
  if (v1) {
    uint64_t v1 = [v2 BOOLValue];
  }

  return v1;
}

- (uint64_t)_QLIsDataLess
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend(a1, "startAccessingSecurityScopedResource", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0);
  id v3 = a1;
  int v4 = lstat((const char *)[v3 fileSystemRepresentation], &v9);
  if (v2) {
    [v3 stopAccessingSecurityScopedResource];
  }
  if (v4)
  {
    id v5 = _log();
    uint64_t v6 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = *__error();
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 1024;
      int v13 = v7;
      uint64_t v6 = 1;
      _os_log_impl(&dword_1B281E000, v5, OS_LOG_TYPE_INFO, "stat for %@ failed with errno %{darwin.errno}d; returning YES for _QLIsDataLess",
        buf,
        0x12u);
    }
  }
  else
  {
    uint64_t v6 = (v9.st_flags >> 30) & 1;
    id v5 = _log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(_QLUtilities) _QLIsDataLess]();
    }
  }

  return v6;
}

- (BOOL)_QLIsThumbnailableWithError:()_QLUtilities
{
  v26[1] = *MEMORY[0x1E4F143B8];
  memset(&v20, 0, sizeof(v20));
  int v5 = [a1 startAccessingSecurityScopedResource];
  id v6 = a1;
  int v7 = lstat((const char *)[v6 fileSystemRepresentation], &v20);
  BOOL v8 = v7 != 0;
  if (v5) {
    [v6 stopAccessingSecurityScopedResource];
  }
  if (v7)
  {
    stat v9 = _log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = *__error();
      *(_DWORD *)buf = 138412546;
      id v22 = v6;
      __int16 v23 = 1024;
      int v24 = v10;
      _os_log_impl(&dword_1B281E000, v9, OS_LOG_TYPE_INFO, "stat for %@ failed with errno %{darwin.errno}d; returning YES for _QLIsThumbnailable",
        buf,
        0x12u);
    }
LABEL_21:

    return v8;
  }
  int v11 = v20.st_mode & 0xF000;
  BOOL v13 = v11 == 0x8000 || v11 == 0x4000;
  uint64_t v14 = _log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[NSURL(_QLUtilities) _QLIsThumbnailableWithError:]();
  }

  if (a3) {
    char v15 = v13;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0)
  {
    v16 = _log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[NSURL(_QLUtilities) _QLIsThumbnailableWithError:]();
    }

    stat v9 = [NSString stringWithFormat:@"Cannot thumbnail %@ which is not a regular file", v6];
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    v26[0] = v9;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    *a3 = [v17 errorWithDomain:@"QLThumbnailErrorDomain" code:4 userInfo:v18];

    goto LABEL_21;
  }
  return v13;
}

- (uint64_t)_QLNeedsDownload
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = [a1 startAccessingSecurityScopedResource];
  memset(&v9, 0, sizeof(v9));
  id v3 = a1;
  int v4 = lstat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
         &v9);
  if (v2) {
    [v3 stopAccessingSecurityScopedResource];
  }
  if (v4)
  {
    int v5 = _log();
    uint64_t v6 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = *__error();
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 1024;
      int v13 = v7;
      uint64_t v6 = 1;
      _os_log_impl(&dword_1B281E000, v5, OS_LOG_TYPE_INFO, "stat for %@ failed with errno %{darwin.errno}d; returning YES for _QLNeedsDownload",
        buf,
        0x12u);
    }
  }
  else
  {
    uint64_t v6 = (v9.st_flags >> 30) & 1;
    int v5 = _log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(_QLUtilities) _QLNeedsDownload]();
    }
  }

  return v6;
}

- (id)_QLFileSize
{
  id v8 = 0;
  uint64_t v1 = *MEMORY[0x1E4F1C5F8];
  id v7 = 0;
  char v2 = [a1 getPromisedItemResourceValue:&v8 forKey:v1 error:&v7];
  id v3 = v8;
  id v4 = v7;
  if ((v2 & 1) == 0)
  {
    int v5 = _log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NSURL(_QLUtilities) _QLFileSize]();
    }
  }

  return v3;
}

- (id)_QLUrlFileSize
{
  uint64_t v1 = a1;
  v43[2] = *MEMORY[0x1E4F143B8];
  if ([a1 _QLNeedsDownload]) {
    goto LABEL_25;
  }
  id v37 = 0;
  uint64_t v2 = *MEMORY[0x1E4F1C628];
  uint64_t v36 = 0;
  uint64_t v28 = v2;
  char v3 = objc_msgSend(v1, "getResourceValue:forKey:error:", &v37);
  id v4 = v37;
  id v5 = 0;
  if ((v3 & 1) == 0)
  {
    int v24 = _log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[NSURL(_QLUtilities) _QLUrlFileSize]();
    }

    goto LABEL_24;
  }
  if (![v4 BOOLValue])
  {
LABEL_24:

LABEL_25:
    uint64_t v25 = [v1 _QLFileSize];
    goto LABEL_26;
  }
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = *MEMORY[0x1E4F1C5F8];
  v43[0] = v28;
  v43[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v27 = v1;
  stat v9 = [v6 enumeratorAtURL:v1 includingPropertiesForKeys:v8 options:0 errorHandler:&__block_literal_global_12];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v33;
    do
    {
      uint64_t v14 = 0;
      char v15 = v5;
      v16 = v4;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
        id v30 = 0;
        id v31 = 0;
        char v18 = [v17 getResourceValue:&v31 forKey:v28 error:&v30];
        id v4 = v31;

        id v5 = v30;
        if ((v18 & 1) == 0)
        {
          v19 = _log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v39 = v17;
            __int16 v40 = 2112;
            id v41 = v5;
            _os_log_error_impl(&dword_1B281E000, v19, OS_LOG_TYPE_ERROR, "Failed to determine if the url(%@) is a directory error: %@", buf, 0x16u);
          }
        }
        stat v20 = [v17 _QLFileSize];
        uint64_t v21 = [v20 unsignedLongLongValue];
        int v22 = [v4 BOOLValue];
        if (v20) {
          BOOL v23 = v22 == 0;
        }
        else {
          BOOL v23 = 1;
        }
        if (!v23) {
          [obj skipDescendants];
        }
        v12 += v21;

        ++v14;
        char v15 = v5;
        v16 = v4;
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  uint64_t v25 = [NSNumber numberWithUnsignedLongLong:v12];

  uint64_t v1 = v27;
  if (!v25) {
    goto LABEL_25;
  }
LABEL_26:

  return v25;
}

- (id)_QLIssueFileExtensionWithSandboxType:()_QLUtilities
{
  [a1 fileSystemRepresentation];
  uint64_t v1 = sandbox_extension_issue_file();
  if (v1)
  {
    uint64_t v2 = (void *)v1;
    char v3 = (void *)[[NSString alloc] initWithCString:v1 encoding:4];
    free(v2);
  }
  else
  {
    id v4 = _log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[NSURL(_QLUtilities) _QLIssueFileExtensionWithSandboxType:]();
    }

    char v3 = 0;
  }

  return v3;
}

+ (id)_QLTemporaryURLWithExtension:()_QLUtilities openingFileHandle:inDirectoryAtURL:
{
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    if (v7)
    {
LABEL_3:
      stat v9 = [@"QuickLookThumbnailing.XXXXX" stringByAppendingPathExtension:v7];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v11 = NSTemporaryDirectory();
    id v8 = [v10 fileURLWithPath:v11];

    if (v7) {
      goto LABEL_3;
    }
  }
  stat v9 = @"QuickLookThumbnailing.XXXXX";
LABEL_6:
  id v12 = [v8 URLByAppendingPathComponent:v9 isDirectory:0];
  uint64_t v13 = strdup((const char *)[v12 fileSystemRepresentation]);
  if (v7) {
    int v14 = [v7 length] + 1;
  }
  else {
    int v14 = 0;
  }
  int v15 = mkstemps(v13, v14);
  if (v15 < 0)
  {
    v16 = _log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[NSURL(_QLUtilities) _QLTemporaryURLWithExtension:openingFileHandle:inDirectoryAtURL:]((uint64_t)v13, v16);
    }
  }
  v17 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v13 isDirectory:0 relativeToURL:0];
  free(v13);
  if (a4) {
    *a4 = v15;
  }
  else {
    close(v15);
  }

  return v17;
}

+ (id)_QLCreateTemporaryReplacementURLForOriginalFileAtURL:()_QLUtilities withExtension:temporaryDirectoryURL:
{
  id v7 = a3;
  id v8 = a4;
  stat v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = 0;
  uint64_t v10 = [v9 URLForDirectory:99 inDomain:1 appropriateForURL:v7 create:1 error:&v19];
  id v11 = v19;

  if (!v10)
  {
    id v12 = _log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[NSURL(_QLUtilities) _QLCreateTemporaryReplacementURLForOriginalFileAtURL:withExtension:temporaryDirectoryURL:]();
    }
    goto LABEL_13;
  }
  if (v8)
  {
    id v12 = [@"thumbnailXXXXXX" stringByAppendingPathExtension:v8];
  }
  else
  {
    id v12 = @"thumbnailXXXXXX";
  }
  id v13 = [v10 URLByAppendingPathComponent:v12];
  int v14 = strdup((const char *)[v13 fileSystemRepresentation]);

  int v15 = mkstemps(v14, [v8 length] + 1);
  if (v15 < 0)
  {
    v17 = _log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[NSURL(_QLUtilities) _QLCreateTemporaryReplacementURLForOriginalFileAtURL:withExtension:temporaryDirectoryURL:]();
    }

    [MEMORY[0x1E4F28CB8] _QLTRemoveTemporaryDirectoryAtURL:v10];
    free(v14);
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  close(v15);
  v16 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v14 isDirectory:0 relativeToURL:0];
  free(v14);
  if (a5) {
    *a5 = v10;
  }
LABEL_14:

  return v16;
}

- (id)_qlFastRealpathURL
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v5 = xmmword_1B28578D8;
  uint64_t v6 = 0;
  memset(v7, 0, 512);
  id v1 = a1;
  if (getattrlist((const char *)objc_msgSend(v1, "fileSystemRepresentation", 0x800000800000005, 0, 0), &v5, v7, 0x410uLL, 0x20u) < 0)
  {
    char v3 = _log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(NSURL(_QLUtilities) *)(uint64_t)v1 _qlFastRealpathURL];
    }

    id v2 = v1;
  }
  else
  {
    [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:(char *)v7 + SDWORD2(v7[0]) + 8 isDirectory:DWORD1(v7[0]) == 2 relativeToURL:0];
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

- (id)ql_realpathURL
{
  if (_CFURLIsItemPromiseAtURL())
  {
    id v2 = [a1 _qlFastRealpathURL];
  }
  else
  {
    char v3 = (void *)_CFURLPromiseCopyPhysicalURL();
    id v4 = v3;
    if (!v3 || v3 == a1)
    {
      id v2 = [a1 _qlFastRealpathURL];
    }
    else
    {
      long long v5 = [v3 _qlFastRealpathURL];
      if (v5)
      {
        uint64_t v6 = (void *)_CFURLCopyLogicalURLOfPromiseAtURL();
        id v7 = v6;
        if (!v6)
        {
          uint64_t v8 = _log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            -[NSURL(_QLUtilities) ql_realpathURL]();
          }

          id v7 = v5;
        }
        id v2 = v7;
      }
      else
      {
        stat v9 = _log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[NSURL(_QLUtilities) ql_realpathURL]();
        }

        id v2 = a1;
      }
    }
  }

  return v2;
}

- (void)_QLIsDataLess
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_1(&dword_1B281E000, v0, v1, "stat for %@ succeeded; dataless = %d");
}

- (void)_QLIsThumbnailableWithError:()_QLUtilities .cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Cannot thumbnail %@ which is not a regular file", v2, v3, v4, v5, v6);
}

- (void)_QLIsThumbnailableWithError:()_QLUtilities .cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_1(&dword_1B281E000, v0, v1, "stat for %@ succeeded; thumbnailable = %d");
}

- (void)_QLNeedsDownload
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_1(&dword_1B281E000, v0, v1, "stat for %@ succeeded; downloaded = %d");
}

- (void)_QLFileSize
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Error getting the size of file(%@) with error (%@)");
}

- (void)_QLUrlFileSize
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Failed to determine if the url(%@) is a directory error:%@");
}

- (void)_QLIssueFileExtensionWithSandboxType:()_QLUtilities .cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Couldn't issue file extension for url: %@", v2, v3, v4, v5, v6);
}

+ (void)_QLTemporaryURLWithExtension:()_QLUtilities openingFileHandle:inDirectoryAtURL:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "Could not make temporary file at %s: %{darwin.errno}d", (uint8_t *)&v5, 0x12u);
}

+ (void)_QLCreateTemporaryReplacementURLForOriginalFileAtURL:()_QLUtilities withExtension:temporaryDirectoryURL:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Could not create temporary directory on the same voume as %@. URLForDirectory failed with error: %@");
}

+ (void)_QLCreateTemporaryReplacementURLForOriginalFileAtURL:()_QLUtilities withExtension:temporaryDirectoryURL:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B281E000, v0, v1, "Could not create temporary file on the same volume as %@: mkstemps failed", v2, v3, v4, v5, v6);
}

- (void)_qlFastRealpathURL
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  uint64_t v5 = __error();
  uint8_t v6 = strerror(*v5);
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 2080;
  id v12 = v6;
  _os_log_error_impl(&dword_1B281E000, a2, OS_LOG_TYPE_ERROR, "getattrlist() failed for %@: %d (%s)", (uint8_t *)&v7, 0x1Cu);
}

- (void)ql_realpathURL
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Can't copy logical URL for %@: %@");
}

@end