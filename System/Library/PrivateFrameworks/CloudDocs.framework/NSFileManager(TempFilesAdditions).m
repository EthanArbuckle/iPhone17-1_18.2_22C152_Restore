@interface NSFileManager(TempFilesAdditions)
- (id)brc_createTemporaryFileInDirectory:()TempFilesAdditions withTemplate:error:;
- (id)brc_createTemporarySubdirectoryOfItem:()TempFilesAdditions withTemplate:error:;
- (uint64_t)brc_createTemporaryFdInDirectory:()TempFilesAdditions withTemplate:error:;
@end

@implementation NSFileManager(TempFilesAdditions)

- (id)brc_createTemporarySubdirectoryOfItem:()TempFilesAdditions withTemplate:error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v26[0] = 0;
  id v9 = v7;
  int v10 = open((const char *)[v9 fileSystemRepresentation], 33028);
  if ((v10 & 0x80000000) == 0 && (__pthread_fchdir() & 0x80000000) == 0)
  {
    if ([v8 getFileSystemRepresentation:v26 maxLength:1024])
    {
      if (mkdtemp(v26))
      {
        v11 = [NSString stringWithUTF8String:v26];
        v12 = [v9 stringByAppendingPathComponent:v11];

        if (v12) {
          goto LABEL_14;
        }
      }
    }
    else
    {
      *__error() = 63;
    }
  }
  v13 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
  if (v13)
  {
    v14 = brc_bread_crumbs((uint64_t)"-[NSFileManager(TempFilesAdditions) brc_createTemporarySubdirectoryOfItem:withTemplate:error:]", 49);
    v15 = brc_default_log(0);
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      v17 = "(passed to caller)";
      int v18 = 136315906;
      v19 = "-[NSFileManager(TempFilesAdditions) brc_createTemporarySubdirectoryOfItem:withTemplate:error:]";
      __int16 v20 = 2080;
      if (!a5) {
        v17 = "(ignored by caller)";
      }
      v21 = v17;
      __int16 v22 = 2112;
      v23 = v13;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_error_impl(&dword_19ED3F000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v18, 0x2Au);
    }
  }
  if (a5) {
    *a5 = v13;
  }

  v12 = 0;
LABEL_14:
  if (v10 >= 1) {
    close(v10);
  }

  return v12;
}

- (uint64_t)brc_createTemporaryFdInDirectory:()TempFilesAdditions withTemplate:error:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v11 = -1;
  if ((_mkstempWrapper(a1, a3, a4, &v11, 0) & 0x80000000) != 0)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    if (v6)
    {
      id v7 = brc_bread_crumbs((uint64_t)"-[NSFileManager(TempFilesAdditions) brc_createTemporaryFdInDirectory:withTemplate:error:]", 96);
      id v8 = brc_default_log(0);
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        int v10 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v13 = "-[NSFileManager(TempFilesAdditions) brc_createTemporaryFdInDirectory:withTemplate:error:]";
        __int16 v14 = 2080;
        if (!a5) {
          int v10 = "(ignored by caller)";
        }
        v15 = v10;
        __int16 v16 = 2112;
        v17 = v6;
        __int16 v18 = 2112;
        v19 = v7;
        _os_log_error_impl(&dword_19ED3F000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v6;
    }
  }
  return v11;
}

- (id)brc_createTemporaryFileInDirectory:()TempFilesAdditions withTemplate:error:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v16 = 0;
  LODWORD(a1) = _mkstempWrapper(a1, v8, a4, 0, &v16);
  id v9 = v16;
  if ((a1 & 0x80000000) != 0)
  {
    unsigned int v11 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    if (v11)
    {
      v12 = brc_bread_crumbs((uint64_t)"-[NSFileManager(TempFilesAdditions) brc_createTemporaryFileInDirectory:withTemplate:error:]", 107);
      v13 = brc_default_log(0);
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        v15 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        __int16 v18 = "-[NSFileManager(TempFilesAdditions) brc_createTemporaryFileInDirectory:withTemplate:error:]";
        __int16 v19 = 2080;
        if (!a5) {
          v15 = "(ignored by caller)";
        }
        uint64_t v20 = v15;
        __int16 v21 = 2112;
        __int16 v22 = v11;
        __int16 v23 = 2112;
        __int16 v24 = v12;
        _os_log_error_impl(&dword_19ED3F000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v11;
    }

    int v10 = 0;
  }
  else
  {
    int v10 = [v8 stringByAppendingPathComponent:v9];
  }

  return v10;
}

@end