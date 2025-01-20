@interface NSURL(BRCPathAdditions)
+ (id)brc_ciconiaDumpDirForCurrentPersona;
+ (id)brc_ciconiaWorkDirForCurrentPersona;
+ (id)brc_fileURLWithFileDescriptor:()BRCPathAdditions;
+ (id)brc_fileURLWithVolumeDeviceID:()BRCPathAdditions fileID:isDirectory:withError:;
+ (uint64_t)brc_fileURLWithVolumeDeviceID:()BRCPathAdditions fileID:isDirectory:;
+ (void)brc_ciconiaWorkDirForCurrentPersona;
- (id)brc_issueSandboxExtensionOfClass:()BRCPathAdditions error:;
- (uint64_t)brc_isDirectory:()BRCPathAdditions isExists:withError:;
@end

@implementation NSURL(BRCPathAdditions)

+ (id)brc_fileURLWithFileDescriptor:()BRCPathAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v12 = xmmword_19EDD67A0;
  uint64_t v13 = 0;
  memset(v20, 0, 512);
  if (fgetattrlist(a3, &v12, v20, 0x410uLL, 0x20u) < 0)
  {
    int v7 = *__error();
    v8 = brc_bread_crumbs((uint64_t)"+[NSURL(BRCPathAdditions) brc_fileURLWithFileDescriptor:]", 39);
    v9 = brc_default_log(0);
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109634;
      int v15 = a3;
      __int16 v16 = 1024;
      int v17 = v7;
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_error_impl(&dword_19ED3F000, v9, (os_log_type_t)0x90u, "[ERROR] fgetattrlist(%d) failed %{errno}d%@", buf, 0x18u);
    }

    v10 = __error();
    v6 = 0;
    int *v10 = v7;
  }
  else
  {
    v4 = (char *)v20 + SDWORD2(v20[0]) + 8;
    id v5 = objc_alloc(MEMORY[0x1E4F1CB10]);
    v6 = (void *)[v5 initFileURLWithFileSystemRepresentation:v4 isDirectory:(WORD2(v20[0]) & 0xF000) == 0x4000 relativeToURL:0];
  }

  return v6;
}

+ (id)brc_fileURLWithVolumeDeviceID:()BRCPathAdditions fileID:isDirectory:withError:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v10 = objc_msgSend(v9, "unsignedLongLongValue", objc_msgSend(a3, "unsignedIntValue"));

  if (fsgetpath(v15, 0x400uLL, &v14, v10) < 0)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      *a6 = v12;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v15 isDirectory:a5 relativeToURL:0];
  }

  return v11;
}

+ (uint64_t)brc_fileURLWithVolumeDeviceID:()BRCPathAdditions fileID:isDirectory:
{
  return objc_msgSend(a1, "brc_fileURLWithVolumeDeviceID:fileID:isDirectory:withError:", a3, a4, a5, 0);
}

- (id)brc_issueSandboxExtensionOfClass:()BRCPathAdditions error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = [a1 path];
  [v7 fileSystemRepresentation];
  v8 = (const char *)sandbox_extension_issue_file();

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:strlen(v8) + 1 freeWhenDone:1];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *__error();
    id v12 = [a1 path];
    uint64_t v13 = __error();
    fsid_t v14 = objc_msgSend(v10, "br_errorWithPOSIXCode:description:", v11, @"couldn't issue sandbox extension %s for '%@': %s", a3, v12, strerror(*v13));

    if (v14)
    {
      int v15 = brc_bread_crumbs((uint64_t)"-[NSURL(BRCPathAdditions) brc_issueSandboxExtensionOfClass:error:]", 81);
      uint64_t v16 = brc_default_log(0);
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        __int16 v18 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v20 = "-[NSURL(BRCPathAdditions) brc_issueSandboxExtensionOfClass:error:]";
        __int16 v21 = 2080;
        if (!a4) {
          __int16 v18 = "(ignored by caller)";
        }
        v22 = v18;
        __int16 v23 = 2112;
        v24 = v14;
        __int16 v25 = 2112;
        v26 = v15;
        _os_log_error_impl(&dword_19ED3F000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v14;
    }

    id v9 = 0;
  }

  return v9;
}

+ (id)brc_ciconiaWorkDirForCurrentPersona
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB36F8] sharedManager];
  v1 = [v0 currentPersona];

  v2 = objc_msgSend(v1, "br_personaID");
  int v3 = [v2 isEqual:@"__defaultPersonaID__"];

  if (v3)
  {
    v4 = _getCloudDocsAppSupportURL();
    id v5 = [v4 URLByAppendingPathComponent:@"ciconia"];
    goto LABEL_14;
  }
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [v6 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.iCloudDrive"];
  v4 = [v7 path];

  if (!v4)
  {
    [@"group.com.apple.iCloudDrive" UTF8String];
    uint64_t v8 = container_create_or_lookup_path_for_current_user();
    if (!v8)
    {
      uint64_t v10 = brc_bread_crumbs((uint64_t)"+[NSURL(BRCPathAdditions) brc_ciconiaWorkDirForCurrentPersona]", 116);
      uint64_t v11 = brc_default_log(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v17 = 1;
        __int16 v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_19ED3F000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] container_create_or_lookup_path_for_current_user() failed with %llu%@", buf, 0x16u);
      }

      goto LABEL_10;
    }
    id v9 = (void *)v8;
    v4 = [NSString stringWithUTF8String:v8];
    free(v9);
    if (!v4)
    {
LABEL_10:
      id v12 = brc_bread_crumbs((uint64_t)"+[NSURL(BRCPathAdditions) brc_ciconiaWorkDirForCurrentPersona]", 124);
      uint64_t v13 = brc_default_log(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        +[NSURL(BRCPathAdditions) brc_ciconiaWorkDirForCurrentPersona];
      }

      v4 = 0;
    }
  }
  fsid_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  id v5 = [v14 URLByAppendingPathComponent:@"ciconia"];

LABEL_14:

  return v5;
}

+ (id)brc_ciconiaDumpDirForCurrentPersona
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB36F8] sharedManager];
  v1 = [v0 currentPersona];

  v2 = objc_msgSend(v1, "br_personaID");
  int v3 = [v2 isEqual:@"__defaultPersonaID__"];

  if (v3)
  {
    v4 = _getCloudDocsAppSupportURL();
    id v5 = [v4 URLByAppendingPathComponent:@"session/ciconia_diagnose"];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = [v6 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.CloudDocs"];
    uint64_t v8 = [v7 path];

    if (!v8)
    {
      [@"group.com.apple.CloudDocs" UTF8String];
      uint64_t v9 = container_create_or_lookup_path_for_current_user();
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        uint64_t v8 = [NSString stringWithUTF8String:v9];
        free(v10);
      }
      else
      {
        uint64_t v11 = brc_bread_crumbs((uint64_t)"+[NSURL(BRCPathAdditions) brc_ciconiaDumpDirForCurrentPersona]", 146);
        id v12 = brc_default_log(1);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v16 = 1;
          __int16 v17 = 2112;
          __int16 v18 = v11;
          _os_log_impl(&dword_19ED3F000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] container_create_or_lookup_path_for_current_user() failed with %llu%@", buf, 0x16u);
        }

        uint64_t v8 = 0;
      }
    }
    v4 = [v8 stringByAppendingPathComponent:@"Library/Application Support/CloudDocs"];

    uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    id v5 = [v13 URLByAppendingPathComponent:@"session/ciconia_diagnose"];
  }

  return v5;
}

- (uint64_t)brc_isDirectory:()BRCPathAdditions isExists:withError:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  objc_msgSend(a1, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  id v8 = objc_claimAutoreleasedReturnValue();
  int v9 = fstatat(-1, (const char *)[v8 fileSystemRepresentation], &v16, 32);

  if (v9 < 0)
  {
    if (*__error() == 2)
    {
      return 1;
    }
    else
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      BOOL v10 = v11 == 0;
      if (v11)
      {
        id v12 = brc_bread_crumbs((uint64_t)"-[NSURL(BRCPathAdditions) brc_isDirectory:isExists:withError:]", 169);
        uint64_t v13 = brc_default_log(0);
        if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
        {
          int v15 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          __int16 v18 = "-[NSURL(BRCPathAdditions) brc_isDirectory:isExists:withError:]";
          __int16 v19 = 2080;
          if (!a5) {
            int v15 = "(ignored by caller)";
          }
          uint64_t v20 = v15;
          __int16 v21 = 2112;
          v22 = v11;
          __int16 v23 = 2112;
          v24 = v12;
          _os_log_error_impl(&dword_19ED3F000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a5) {
        *a5 = v11;
      }
    }
  }
  else
  {
    if (a3) {
      *a3 = (v16.st_mode & 0xF000) == 0x4000;
    }
    BOOL v10 = 1;
    if (a4) {
      *a4 = 1;
    }
  }
  return v10;
}

+ (void)brc_ciconiaWorkDirForCurrentPersona
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_19ED3F000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unable to retrieve base path for current persona : %@%@", (uint8_t *)&v3, 0x16u);
}

@end