@interface NSURL(BRAdditions_Private)
+ (BOOL)br_isURL:()BRAdditions_Private syncRootOwnedByICloudDrive:withError:;
- (BOOL)br_getBirthDate:()BRAdditions_Private;
- (BOOL)br_isIgnoredByFileProviderWithError:()BRAdditions_Private;
- (BOOL)br_isRootOwned;
- (id)_br_getAttributeValue:()BRAdditions_Private withSecondaryConnection:withError:;
- (uint64_t)br_isIgnoredByFileProvider;
@end

@implementation NSURL(BRAdditions_Private)

+ (BOOL)br_isURL:()BRAdditions_Private syncRootOwnedByICloudDrive:withError:
{
  id v7 = a3;
  v8 = v7;
  if (a4)
  {
    *a4 = 0;
    id v14 = 0;
    v9 = objc_msgSend(v7, "fp_fpfsProviderDomainID:error:", 0, &v14);
    id v10 = v14;
    v11 = v10;
    BOOL v12 = v10 == 0;
    if (v10)
    {
      if (a5) {
        *a5 = v10;
      }
    }
    else
    {
      *a4 = [v9 hasPrefix:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
    }
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)_br_getAttributeValue:()BRAdditions_Private withSecondaryConnection:withError:
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v35[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__8;
  v33 = __Block_byref_object_dispose__8;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  id v28 = 0;
  if (BRIsFPFSEnabled(v9, v10))
  {
    objc_msgSend(a1, "_br_itemServiceSyncProxy");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __86__NSURL_BRAdditions_Private___br_getAttributeValue_withSecondaryConnection_withError___block_invoke;
    v22[3] = &unk_1E59ADBE8;
    v22[4] = &v29;
    v22[5] = &v23;
    [v11 getAttributeValues:v9 reply:v22];
  }
  else
  {
    if (a4) {
      +[BRDaemonConnection secondaryConnection];
    }
    else {
    BOOL v12 = +[BRDaemonConnection defaultConnection];
    }
    v13 = (void *)[v12 newLegacySyncProxy];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__NSURL_BRAdditions_Private___br_getAttributeValue_withSecondaryConnection_withError___block_invoke_2;
    v20[3] = &unk_1E59ADC10;
    id v11 = v13;
    id v21 = v11;
    [v11 getAttributeValues:v9 forItemAtURL:a1 reply:v20];
    uint64_t v14 = [v11 result];
    v15 = (void *)v30[5];
    v30[5] = v14;

    uint64_t v16 = [v11 error];
    v17 = (void *)v24[5];
    v24[5] = v16;
  }
  if (a5) {
    *a5 = (id) v24[5];
  }
  v18 = [(id)v30[5] objectForKey:v8];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);

  return v18;
}

- (BOOL)br_getBirthDate:()BRAdditions_Private
{
  memset(&v10.st_birthtimespec, 0, 64);
  objc_msgSend(a1, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  id v4 = objc_claimAutoreleasedReturnValue();
  int v5 = lstat((const char *)[v4 fileSystemRepresentation], &v10);

  if (v5)
  {
    int v6 = *__error();
    id v7 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions_Private) br_getBirthDate:]", 1212);
    id v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      -[NSURL(BRAdditions_Private) br_getBirthDate:]();
    }

    *__error() = v6;
  }
  else if (a3)
  {
    *a3 = v10.st_birthtimespec.tv_sec;
  }
  return v5 == 0;
}

- (uint64_t)br_isIgnoredByFileProvider
{
  return objc_msgSend(a1, "br_isIgnoredByFileProviderWithError:", 0);
}

- (BOOL)br_isIgnoredByFileProviderWithError:()BRAdditions_Private
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  ssize_t v4 = getxattr((const char *)[a1 fileSystemRepresentation], "com.apple.fileprovider.ignore#P", 0, 0, 0, 1);
  if (v4 < 0)
  {
    id v7 = __error();
    if (a3 && *v7 != 93)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v5 = brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions_Private) br_isIgnoredByFileProviderWithError:]", 1236);
    int v6 = brc_default_log(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      stat v10 = v5;
      _os_log_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] URL has com.apple.fileprovider.ignore#P attribute%@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4 >= 0;
}

- (BOOL)br_isRootOwned
{
  uint64_t v5 = 0;
  long long v4 = xmmword_19EDD6850;
  uint64_t v3 = 0;
  return getattrlist((const char *)[a1 fileSystemRepresentation], &v4, &v3, 8uLL, 0x20u)&& HIDWORD(v3) == 0;
}

- (void)br_getBirthDate:()BRAdditions_Private .cold.1()
{
  v0 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_2(&dword_19ED3F000, v1, v2, "[ERROR] Failed lstat on file: %@ %{errno}d%@", v3, v4, v5, v6, v7);
}

@end