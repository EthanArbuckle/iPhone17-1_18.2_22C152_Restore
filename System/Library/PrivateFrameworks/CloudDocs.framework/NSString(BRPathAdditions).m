@interface NSString(BRPathAdditions)
+ (id)_br_containerPathForDataSeparatedPersona;
+ (id)br_accountSessionOpenErrorInfoPath;
+ (id)br_badFilenameAlternativeName;
+ (id)br_corruptedDBInfoPath;
+ (id)br_currentHomeDir;
+ (id)br_currentPersonaIDWithIsDataSeparated:()BRPathAdditions;
+ (id)br_currentSupportDir;
+ (id)br_emptyFilenameAlternativeName;
+ (id)br_pathForDirectory:()BRPathAdditions;
+ (id)br_pathWithDeviceID:()BRPathAdditions fileID:;
+ (id)br_personaGroupDirForFPFS:()BRPathAdditions;
+ (id)br_reimportDomainErrorInfoPath;
+ (id)br_representableHFSFileNameWithBase:()BRPathAdditions suffix:extension:makeDotFile:;
+ (id)br_supportDirForPersona:()BRPathAdditions dataSeparated:;
+ (uint64_t)br_personaGroupDir;
+ (void)br_currentHomeDir;
- (BOOL)_br_isExcludedWithMaximumDepth:()BRPathAdditions inFPFS:isFile:;
- (BOOL)br_isDocumentTooLargeForUpload:()BRPathAdditions maxUploadDocumentSize:;
- (BOOL)br_isEqualToStringForHFS:()BRPathAdditions isCaseSensitive:;
- (BOOL)br_isInPackage;
- (BOOL)br_isPackageRoot;
- (BOOL)br_isSideFaultName;
- (BOOL)br_nameIsRepresentableOnHFS;
- (__CFString)br_pathRelativeToPath:()BRPathAdditions;
- (const)br_fileSystemRepresentation;
- (id)_br_nameWithAddedExtension:()BRPathAdditions makeDotFile:;
- (id)br_displayFilenameWithExtensionHidden:()BRPathAdditions;
- (id)br_pathExtension;
- (id)br_pathOfPackageRoot;
- (id)br_pathRelativeToDirectory:()BRPathAdditions;
- (id)br_pathRelativeToPackageRoot;
- (id)br_realpath;
- (id)br_realpathKeepingLastSymlink;
- (id)br_representableHFSFileNameWithNumber:()BRPathAdditions addedExtension:makeDotFile:;
- (id)br_sideFaultPath;
- (id)brc_representableHFSFileNameWithSuffix:()BRPathAdditions addedExtension:makeDotFile:;
- (id)brc_stringByDeletingPathExtension;
- (id)removingROSPPrefix;
- (uint64_t)_br_safeFileSystemRepresentationWithDefaultValue:()BRPathAdditions;
- (uint64_t)br_compareToStringForHFS:()BRPathAdditions isCaseSensitive:;
- (uint64_t)br_isAbsolutePath;
- (uint64_t)br_isExcludedButPreservedAtLogOutWithFilenames:()BRPathAdditions extensions:;
- (uint64_t)br_isExcludedFromSyncInFPFSIsFile:()BRPathAdditions;
- (uint64_t)br_isExcludedWithMaximumDepth:()BRPathAdditions;
- (uint64_t)br_representableDirectoryName;
- (uint64_t)br_safeFileSystemRepresentation;
- (uint64_t)br_sideFaultName;
- (void)br_realpath;
- (void)br_realpathKeepingLastSymlink;
@end

@implementation NSString(BRPathAdditions)

+ (id)br_currentPersonaIDWithIsDataSeparated:()BRPathAdditions
{
  v4 = [MEMORY[0x1E4FB36F8] sharedManager];
  v5 = [v4 currentPersona];
  v6 = objc_msgSend(v4, "br_currentPersonaID");
  if (a3) {
    *a3 = [v5 isDataSeparatedPersona];
  }

  return v6;
}

- (id)br_realpath
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (BRIsFPFSEnabled(a1, a2))
  {
    objc_msgSend(a1, "fp_realpath");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = a1;
    v5 = v4;
    memset(v19, 0, 512);
    if (v4)
    {
      v6 = &stru_1EF11DA20;
      v7 = v4;
      while (1)
      {
        if (![v7 length])
        {
          v11 = v6;
          goto LABEL_12;
        }
        id v8 = v7;
        v9 = (const char *)[v8 fileSystemRepresentation];
        long long v17 = xmmword_19EDD6808;
        uint64_t v18 = 0;
        if ((getattrlist(v9, &v17, v19, 0x40CuLL, 0x20u) & 0x80000000) == 0) {
          break;
        }
        if (*__error() != 2)
        {
          v15 = brc_bread_crumbs((uint64_t)"-[NSString(BRPathAdditions) br_realpath]", 671);
          v16 = brc_default_log(1);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            -[NSString(BRPathAdditions) br_realpath]();
          }

          id v3 = v5;
          goto LABEL_13;
        }
        v10 = [v8 lastPathComponent];
        v11 = [v10 stringByAppendingPathComponent:v6];

        v7 = [v8 stringByDeletingLastPathComponent];

        v6 = v11;
        if (!v7) {
          goto LABEL_12;
        }
      }
      v13 = (char *)v19 + SDWORD1(v19[0]) + 4;
      if ([(__CFString *)v6 length] || strcmp(v9, v13))
      {
        v14 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v13);
        id v3 = [v14 stringByAppendingPathComponent:v6];

        goto LABEL_13;
      }
      v11 = v6;
      v7 = v8;
    }
    else
    {
      v7 = 0;
      v11 = &stru_1EF11DA20;
    }
LABEL_12:
    id v3 = v5;
    v6 = v11;
    id v8 = v7;
LABEL_13:
  }

  return v3;
}

+ (id)br_currentHomeDir
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (br_currentHomeDir_once != -1) {
    dispatch_once(&br_currentHomeDir_once, &__block_literal_global_69_0);
  }
  id v2 = (id)br_currentHomeDir_pathByPersonaID;
  objc_sync_enter(v2);
  char v11 = 0;
  id v3 = objc_msgSend(a1, "br_currentPersonaIDWithIsDataSeparated:", &v11);
  id v4 = [(id)br_currentHomeDir_pathByPersonaID objectForKeyedSubscript:v3];
  if (!v4)
  {
    if (v11)
    {
      v5 = objc_msgSend(a1, "_br_containerPathForDataSeparatedPersona");
      if (!v5) {
        goto LABEL_11;
      }
    }
    else
    {
      uid_t v6 = geteuid();
      v5 = getHomeDirectoryForUser(v6);
      if (!v5)
      {
        if (!v6)
        {
          v7 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_currentHomeDir]", 1124);
          id v8 = brc_default_log(1);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            +[NSString(BRPathAdditions) br_currentHomeDir]();
          }
          goto LABEL_13;
        }
LABEL_11:
        v7 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_currentHomeDir]", 1126);
        id v8 = brc_default_log(1);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v7;
          _os_log_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] No path for home directory%@", buf, 0xCu);
        }
LABEL_13:
        id v4 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    id v4 = objc_msgSend(v5, "br_realpath");

    [(id)br_currentHomeDir_pathByPersonaID setObject:v4 forKeyedSubscript:v3];
    v7 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_currentHomeDir]", 1122);
    id v8 = brc_default_log(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v13 = v3;
      __int16 v14 = 2112;
      v15 = v4;
      __int16 v16 = 2112;
      long long v17 = v7;
      _os_log_debug_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Base path for persona %@ is %@%@", buf, 0x20u);
    }
    goto LABEL_14;
  }
LABEL_15:
  id v9 = v4;

  objc_sync_exit(v2);

  return v9;
}

- (id)br_pathExtension
{
  if (![a1 length]) {
    goto LABEL_5;
  }
  id v2 = extensionInFilename((char *)[a1 fileSystemRepresentation]);
  id v3 = (void *)v2;
  if (!v2) {
    goto LABEL_6;
  }
  size_t v4 = strlen(v2);
  if (v4)
  {
    size_t v5 = v4;
    uid_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v3 = [v6 stringWithFileSystemRepresentation:v3 length:v5];
  }
  else
  {
LABEL_5:
    id v3 = 0;
  }
LABEL_6:

  return v3;
}

- (id)brc_stringByDeletingPathExtension
{
  id v2 = (char *)objc_msgSend(a1, "br_safeFileSystemRepresentation");
  id v3 = extensionInFilename(v2);
  if (v3)
  {
    size_t v4 = v3;
    size_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [v5 stringWithFileSystemRepresentation:v2 length:&v4[~(unint64_t)v2]];
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (id)br_displayFilenameWithExtensionHidden:()BRPathAdditions
{
  id v4 = a1;
  size_t v5 = v4;
  if (a3)
  {
    uint64_t v6 = objc_msgSend(v4, "brc_stringByDeletingPathExtension");

    size_t v5 = (void *)v6;
  }
  v7 = [v5 stringByReplacingOccurrencesOfString:@":" withString:@"/"];

  return v7;
}

- (BOOL)br_isDocumentTooLargeForUpload:()BRPathAdditions maxUploadDocumentSize:
{
  uint64_t v4 = a4;
  v53[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = a1;
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
    uint64_t v9 = *MEMORY[0x1E4F1C5F8];
    v53[0] = *MEMORY[0x1E4F1C628];
    v53[1] = v9;
    uint64_t v35 = v9;
    uint64_t v10 = *MEMORY[0x1E4F1C670];
    v53[2] = *MEMORY[0x1E4F1C670];
    char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __fileSystemSizeForDirectoryAtPath_block_invoke;
    v44[3] = &unk_1E59AE130;
    id v31 = v6;
    v32 = v7;
    id v45 = v31;
    v12 = [v7 enumeratorAtURL:v8 includingPropertiesForKeys:v11 options:0 errorHandler:v44];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v36 = 0;
      uint64_t v16 = *(void *)v41;
      uint64_t v34 = v10;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v39 = 0;
          int v19 = [v18 getResourceValue:&v39 forKey:v10 error:0];
          id v20 = v39;
          v21 = v20;
          if (v19 && [v20 BOOLValue])
          {
            id v37 = 0;
            id v38 = 0;
            char v22 = [v18 getResourceValue:&v38 forKey:v35 error:&v37];
            id v23 = v38;
            id v24 = v37;
            if ((v22 & 1) == 0)
            {
              v25 = brc_bread_crumbs((uint64_t)"fileSystemSizeForDirectoryAtPath", 240);
              v26 = brc_default_log(0);
              if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 138412802;
                v47 = v18;
                __int16 v48 = 2112;
                id v49 = v24;
                __int16 v50 = 2112;
                v51 = v25;
                _os_log_error_impl(&dword_19ED3F000, v26, (os_log_type_t)0x90u, "[ERROR] couldn't get fileSize for url %@: %@%@", buf, 0x20u);
              }

              uint64_t v10 = v34;
            }
            v36 += [v23 integerValue];
          }
          else
          {
            id v23 = 0;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v52 count:16];
      }
      while (v15);
    }
    else
    {
      uint64_t v36 = 0;
    }

    uint64_t v4 = a4;
    uint64_t v29 = v36;
  }
  else
  {
    v27 = [MEMORY[0x1E4F28CB8] defaultManager];
    v28 = [v27 attributesOfItemAtPath:a1 error:0];
    uint64_t v29 = [v28 fileSize];
  }
  return v29 > v4;
}

- (uint64_t)br_isExcludedButPreservedAtLogOutWithFilenames:()BRPathAdditions extensions:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 lastPathComponent];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = 1;
        if (![v8 compare:*(void *)(*((void *)&v24 + 1) + 8 * i) options:1])
        {
          uint64_t v15 = v9;
          goto LABEL_23;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = objc_msgSend(v8, "br_pathExtension");
  if (v15)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v16 = v7;
    uint64_t v14 = [v16 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v17 = *(void *)v21;
      while (2)
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v16);
          }
          if (!objc_msgSend(v15, "compare:options:", *(void *)(*((void *)&v20 + 1) + 8 * j), 1, (void)v20))
          {
            uint64_t v14 = 1;
            goto LABEL_21;
          }
        }
        uint64_t v14 = [v16 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_23:

  return v14;
}

- (uint64_t)br_isExcludedFromSyncInFPFSIsFile:()BRPathAdditions
{
  return objc_msgSend(a1, "_br_isExcludedWithMaximumDepth:inFPFS:isFile:", 1, 1, a3);
}

- (uint64_t)br_isExcludedWithMaximumDepth:()BRPathAdditions
{
  return objc_msgSend(a1, "_br_isExcludedWithMaximumDepth:inFPFS:isFile:", a3, 0, 0);
}

- (BOOL)_br_isExcludedWithMaximumDepth:()BRPathAdditions inFPFS:isFile:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = (void *)MEMORY[0x19F3C4670]();
  if ([a1 length])
  {
    uint64_t v10 = (const char *)objc_msgSend(a1, "_br_safeFileSystemRepresentationWithDefaultValue:", a1);
    uint64_t v11 = v31;
    if ((unint64_t)__strlcpy_chk() <= 0x3FF)
    {
      __stringp = v31;
LABEL_6:
      int v13 = 0;
      uint64_t v14 = ".DS_Store";
      uint64_t v15 = "(A Document Being Saved";
      while (1)
      {
        id v16 = strsep(&__stringp, "/");
        if (!_CFURLCStringIsPromiseName())
        {
          if (!strcmp(v16, v14)) {
            goto LABEL_55;
          }
          if (!strncmp(v16, v15, 0x17uLL)) {
            goto LABEL_55;
          }
          if (strcasestr(v16, ".nosync")) {
            goto LABEL_55;
          }
          if (!strcmp(v16, ".ubd")) {
            goto LABEL_55;
          }
          if (strstr(v16, ".weakpkg")) {
            goto LABEL_55;
          }
          if (!strcasecmp(v16, "tmp")) {
            goto LABEL_55;
          }
          if (!strcasecmp(v16, ".tmp")) {
            goto LABEL_55;
          }
          if (++v13 > a3
            || !strcasecmp(v16, "Thumbs.db")
            || !strcasecmp(v16, "desktop.ini")
            || !strncmp(v16, "~$", 2uLL)
            || !strncmp(v16, ".~", 2uLL)
            || !strcasecmp(v16, "Microsoft User Data")
            || !strcasecmp(v16, "$RECYCLE.BIN")
            || !strcasecmp(v16, "iPhoto Library")
            || !strcasecmp(v16, "Dropbox")
            || !strcasecmp(v16, "OneDrive")
            || !strcasecmp(v16, "IDrive-Sync")
            || !strcasecmp(v16, ".dropbox")
            || !strcasecmp(v16, ".dropbox.attr")
            || !strcasecmp(v16, "icon\r"))
          {
            goto LABEL_55;
          }
          uint64_t v29 = v9;
          uint64_t v17 = v15;
          uint64_t v18 = extensionInFilename(v16);
          if (!v18) {
            goto LABEL_47;
          }
          int v19 = v18;
          int v28 = a4;
          uint64_t v20 = a5;
          long long v21 = v14;
          size_t v22 = strlen(v18);
          if (!v22)
          {
            a5 = v20;
            a4 = v28;
LABEL_47:
            uint64_t v15 = v17;
            id v9 = v29;
            goto LABEL_8;
          }
          unint64_t v23 = v22;
          if (!strcasecmp(v19, "tmp")
            || !strcasecmp(v19, "photoslibrary")
            || !strcasecmp(v19, "photolibrary")
            || !strcasecmp(v19, "aplibrary")
            || !strcasecmp(v19, "migratedaplibrary")
            || !strcasecmp(v19, "migratedphotolibrary")
            || !strcasecmp(v19, "migratedaperturelibrary")
            || v23 >= 2 && !strcmp(&v19[v23 - 1], "~"))
          {
LABEL_61:
            a4 = v28;
            id v9 = v29;
            goto LABEL_55;
          }
          int v24 = strncmp(v19, "sb-", 3uLL);
          if (v23 != 18 || v24)
          {
            BOOL v25 = v23 == 3;
            uint64_t v14 = v21;
            if (v25 && *v16 == 46 && *(_WORD *)v19 == 30579 && v19[2] >= 112)
            {
              BOOL v12 = 1;
              id v9 = v29;
              goto LABEL_58;
            }
          }
          else
          {
            uint64_t v14 = v21;
            if (v19[11] == 45) {
              goto LABEL_61;
            }
          }
          int v26 = strcasecmp(v19, "pkpass");
          a5 = v20;
          a4 = v28;
          uint64_t v15 = v17;
          id v9 = v29;
          if (!v26) {
            goto LABEL_54;
          }
        }
LABEL_8:
        if (!__stringp) {
          goto LABEL_54;
        }
      }
    }
    uint64_t v11 = strdup(v10);
    __stringp = v11;
    if (v11) {
      goto LABEL_6;
    }
LABEL_54:
    id v16 = 0;
LABEL_55:
    BOOL v12 = v16 != 0;
    if (!v16 && a4) {
      BOOL v12 = fpfs_path_is_safe_save_temp_file_ext() != 0;
    }
LABEL_58:
    if (v11 != v31) {
      free(v11);
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  return v12;
}

- (BOOL)br_isInPackage
{
  uint64_t v2 = offsetOfPackageRootFilenameInPath(a1, 0);
  if (v2 < 0) {
    return 0;
  }
  id v3 = (unsigned __int8 *)([a1 fileSystemRepresentation] + v2);
  do
  {
    int v5 = *v3++;
    int v4 = v5;
  }
  while (v5 == 47);
  return v4 != 0;
}

- (BOOL)br_isPackageRoot
{
  uint64_t v2 = offsetOfPackageRootFilenameInPath(a1, 0);
  if (v2 < 0) {
    return 0;
  }
  id v3 = (unsigned __int8 *)([a1 fileSystemRepresentation] + v2);
  do
  {
    int v5 = *v3++;
    int v4 = v5;
  }
  while (v5 == 47);
  return v4 == 0;
}

- (id)br_pathOfPackageRoot
{
  id v3 = 0;
  offsetOfPackageRootFilenameInPath(a1, &v3);
  id v1 = v3;

  return v1;
}

- (id)br_pathRelativeToPackageRoot
{
  uint64_t v2 = offsetOfPackageRootFilenameInPath(a1, 0);
  if (v2 < 0)
  {
    int v5 = 0;
  }
  else
  {
    uint64_t v3 = v2;
    uint64_t v4 = [a1 fileSystemRepresentation];
    int v5 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v4 + v3);
  }

  return v5;
}

- (id)removingROSPPrefix
{
  if ([a1 hasPrefix:@"/System/Volumes/Data"])
  {
    id v2 = [a1 substringFromIndex:objc_msgSend(@"/System/Volumes/Data", "length")];
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (__CFString)br_pathRelativeToPath:()BRPathAdditions
{
  int v5 = (void *)MEMORY[0x19F3C4670]();
  id v6 = [a3 removingROSPPrefix];
  id v7 = [a1 removingROSPPrefix];
  if (![v7 length]) {
    goto LABEL_7;
  }
  if (![v6 length])
  {
    int v13 = v7;
LABEL_9:
    BOOL v12 = v13;
    goto LABEL_15;
  }
  id v8 = (const char *)[v6 fileSystemRepresentation];
  size_t v9 = strlen(v8);
  if (v8[v9 - 1] == 47) {
    size_t v10 = v9 - 1;
  }
  else {
    size_t v10 = v9;
  }
  uint64_t v11 = (const char *)[v7 fileSystemRepresentation];
  if (strncmp(v11, v8, v10)) {
    goto LABEL_7;
  }
  if (v11[v10])
  {
    if (v11[v10] == 47)
    {
      if (v11[v10 + 1])
      {
        objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", &v11[v10 + 1]);
        int v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      goto LABEL_14;
    }
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_14:
  BOOL v12 = &stru_1EF11DA20;
LABEL_15:

  return v12;
}

- (uint64_t)br_isAbsolutePath
{
  uint64_t result = [a1 length];
  if (result) {
    return [a1 characterAtIndex:0] == 47;
  }
  return result;
}

- (const)br_fileSystemRepresentation
{
  if (![a1 length]) {
    return ".";
  }
  id v2 = a1;

  return (const char *)[v2 fileSystemRepresentation];
}

- (uint64_t)br_safeFileSystemRepresentation
{
  id v2 = objc_msgSend(NSString, "br_badFilenameAlternativeName");
  uint64_t v3 = objc_msgSend(a1, "_br_safeFileSystemRepresentationWithDefaultValue:", v2);

  return v3;
}

- (uint64_t)_br_safeFileSystemRepresentationWithDefaultValue:()BRPathAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 fileSystemRepresentation];

  return v5;
}

- (id)br_realpathKeepingLastSymlink
{
  id v1 = a1;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![a1 length]) {
    goto LABEL_10;
  }
  memset(v14, 0, 512);
  id v1 = v1;
  id v2 = (const char *)[v1 fileSystemRepresentation];
  long long v12 = xmmword_19EDD6808;
  uint64_t v13 = 0;
  if (getattrlist(v2, &v12, v14, 0x40CuLL, 0x21u) < 0)
  {
    if (*__error() == 2)
    {
      uint64_t v5 = [v1 stringByDeletingLastPathComponent];
      id v6 = objc_msgSend(v5, "br_realpath");
      id v7 = [v1 lastPathComponent];
      id v8 = [v6 stringByAppendingPathComponent:v7];

      goto LABEL_12;
    }
    size_t v9 = brc_bread_crumbs((uint64_t)"-[NSString(BRPathAdditions) br_realpathKeepingLastSymlink]", 641);
    size_t v10 = brc_default_log(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[NSString(BRPathAdditions) br_realpathKeepingLastSymlink]();
    }

    goto LABEL_10;
  }
  uint64_t v3 = (char *)v14 + SDWORD1(v14[0]) + 4;
  if (!strcmp(v2, v3))
  {
LABEL_10:
    id v4 = v1;
    goto LABEL_11;
  }
  objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  id v8 = v4;
LABEL_12:

  return v8;
}

+ (id)br_pathWithDeviceID:()BRPathAdditions fileID:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if (a3) {
      goto LABEL_3;
    }
    goto LABEL_12;
  }
  id v8 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_pathWithDeviceID:fileID:]", 690);
  size_t v9 = brc_default_log(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    +[NSString(BRPathAdditions) br_pathWithDeviceID:fileID:]();
  }

  if (!a3)
  {
LABEL_12:
    size_t v10 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_pathWithDeviceID:fileID:]", 691);
    uint64_t v11 = brc_default_log(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[NSString(BRPathAdditions) br_pathWithDeviceID:fileID:]();
    }
  }
LABEL_3:
  v12.val[1] = 0;
  v12.val[0] = a3;
  if (fsgetpath(v13, 0x400uLL, &v12, a4) < 1) {
    objc_msgSend(NSString, "stringWithFormat:", @"/.vol/%d/%lld", a3, a4);
  }
  else {
  id v6 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v13);
  }

  return v6;
}

+ (id)br_emptyFilenameAlternativeName
{
  v0 = [MEMORY[0x1E4F29128] UUID];
  id v1 = [v0 UUIDString];
  id v2 = [@".com-apple-bird-noname-" stringByAppendingString:v1];

  return v2;
}

+ (id)br_badFilenameAlternativeName
{
  v0 = [MEMORY[0x1E4F29128] UUID];
  id v1 = [v0 UUIDString];
  id v2 = [@"tmp-bad-filename-" stringByAppendingString:v1];

  return v2;
}

- (BOOL)br_nameIsRepresentableOnHFS
{
  return (unint64_t)([a1 lengthOfBytesUsingEncoding:4] - 1) < 0xFF;
}

+ (id)br_representableHFSFileNameWithBase:()BRPathAdditions suffix:extension:makeDotFile:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v10 length];
  unint64_t v13 = [v11 lengthOfBytesUsingEncoding:4];
  if (v13 < 0x33)
  {
    unint64_t v15 = v13;
  }
  else
  {
    uint64_t v14 = [v9 stringByAppendingPathExtension:v11];

    unint64_t v15 = 0;
    id v11 = 0;
    id v9 = (id)v14;
  }
  uint64_t v16 = 0;
  uint64_t v35 = 0;
  if (v15) {
    unint64_t v17 = ~v15;
  }
  else {
    unint64_t v17 = 0;
  }
  if (a6)
  {
    v36[0] = 46;
    if (*(unsigned char *)[v9 UTF8String] == 95)
    {
      v36[1] = 46;
      uint64_t v16 = 2;
    }
    else
    {
      uint64_t v16 = 1;
    }
  }
  int v34 = a6;
  uint64_t v18 = 255;
  if (v12) {
    uint64_t v18 = 254 - v12;
  }
  int v19 = objc_msgSend(v9, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v36[v16], v18 + v17 - v16, &v35, 4, 0, 0, objc_msgSend(v9, "length"), 0);
  uint64_t v20 = v35;
  if (!v19) {
    uint64_t v20 = 0;
  }
  uint64_t v21 = v20 + v16;
  if (v12)
  {
    uint64_t v22 = v21 + 1;
    v36[v21] = 32;
    if (objc_msgSend(v10, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v36[v21 + 1], v12, &v35, 4, 0, 0, objc_msgSend(v10, "length"), 0))
    {
      uint64_t v21 = v35 + v22;
    }
    else
    {
      unint64_t v23 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:]", 768);
      int v24 = brc_default_log(0);
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
        +[NSString(BRPathAdditions) br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:]();
      }

      BOOL v25 = [MEMORY[0x1E4F29128] UUID];
      id v26 = [v25 UUIDString];
      uint64_t v21 = v22
          + snprintf(&v36[v21 + 1], 254 - v21, "com-apple-bird-recovered-%s", (const char *)[v26 UTF8String]);
    }
  }
  if (v15)
  {
    uint64_t v27 = v21 + 1;
    v36[v21] = 46;
    if (objc_msgSend(v11, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v36[++v21], v15, &v35, 4, 0, 0, objc_msgSend(v11, "length"), 0))uint64_t v21 = v35 + v27; {
  }
    }
  if (v21 == 1) {
    int v29 = v34;
  }
  else {
    int v29 = 0;
  }
  if (v21) {
    BOOL v30 = v29 == 0;
  }
  else {
    BOOL v30 = 0;
  }
  if (v30)
  {
    uint64_t v31 = [[NSString alloc] initWithBytes:v36 length:v21 encoding:4];
  }
  else
  {
    uint64_t v31 = objc_msgSend(NSString, "br_emptyFilenameAlternativeName");
  }
  uint64_t v32 = (void *)v31;

  return v32;
}

- (id)brc_representableHFSFileNameWithSuffix:()BRPathAdditions addedExtension:makeDotFile:
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 length];
  uint64_t v11 = [v9 length];
  if ((a5 & 1) != 0 || v10 || v11 || (unint64_t)[a1 lengthOfBytesUsingEncoding:4] >= 0x100)
  {
    objc_msgSend(a1, "br_pathExtension");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v13 = objc_msgSend(a1, "brc_stringByDeletingPathExtension");
    if (v9)
    {
      if (v12)
      {
        uint64_t v14 = [v12 stringByAppendingPathExtension:v9];

        id v12 = (id)v14;
      }
      else
      {
        id v12 = v9;
      }
    }
    objc_msgSend(NSString, "br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v13, v8, v12, a5);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = a1;
  }

  return v15;
}

- (id)br_representableHFSFileNameWithNumber:()BRPathAdditions addedExtension:makeDotFile:
{
  id v8 = a4;
  id v9 = [a3 stringValue];
  uint64_t v10 = objc_msgSend(a1, "brc_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:", v9, v8, a5);

  return v10;
}

- (id)br_sideFaultPath
{
  id v2 = [a1 stringByDeletingLastPathComponent];
  uint64_t v3 = [a1 lastPathComponent];
  id v4 = objc_msgSend(v3, "br_sideFaultName");
  uint64_t v5 = [v2 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)_br_nameWithAddedExtension:()BRPathAdditions makeDotFile:
{
  id v6 = a3;
  uint64_t v7 = [a1 lengthOfBytesUsingEncoding:4];
  if (v7 + (unint64_t)a4 + [v6 length] < 0x100)
  {
    id v12 = objc_msgSend(a1, "brc_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:", 0, v6, a4);
  }
  else
  {
    id v15 = 0;
    uint64_t v16 = 0;
    id v8 = objc_msgSend(a1, "br_stringByDeletingPathBounceNo:andPathExtension:", &v16, &v15);
    id v9 = v15;
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = [v9 stringByAppendingPathExtension:v6];
    }
    else
    {
      id v11 = v6;
    }
    if (v16)
    {
      unint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      id v12 = objc_msgSend(v8, "br_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v13, v11, a4);
    }
    else
    {
      id v12 = objc_msgSend(v8, "br_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", 0, v11, a4);
    }
  }

  return v12;
}

- (uint64_t)br_sideFaultName
{
  return objc_msgSend(a1, "_br_nameWithAddedExtension:makeDotFile:", @"icloud", 1);
}

- (uint64_t)br_representableDirectoryName
{
  return objc_msgSend(a1, "_br_nameWithAddedExtension:makeDotFile:", @"folder", 0);
}

- (uint64_t)br_compareToStringForHFS:()BRPathAdditions isCaseSensitive:
{
  return _CFStringCompareForHFS();
}

- (BOOL)br_isEqualToStringForHFS:()BRPathAdditions isCaseSensitive:
{
  return _CFStringCompareForHFS() == 0;
}

- (BOOL)br_isSideFaultName
{
  return _CFURLIsPromiseName() != 0;
}

+ (id)br_pathForDirectory:()BRPathAdditions
{
  if (getuid())
  {
    if (!a3)
    {
      unint64_t v13 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_pathForDirectory:]", 897);
      uint64_t v14 = brc_default_log(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        +[NSString(BRPathAdditions) br_pathForDirectory:]();
      }
    }
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [v4 URLsForDirectory:a3 inDomains:1];

    if ([v5 count] != 1)
    {
      id v15 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_pathForDirectory:]", 899);
      uint64_t v16 = brc_default_log(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        +[NSString(BRPathAdditions) br_pathForDirectory:]();
      }
    }
    id v6 = [v5 firstObject];
    uint64_t v7 = [v6 path];
    id v8 = objc_msgSend(v7, "br_realpath");
  }
  else
  {
    if (a3 == 14)
    {
      id v9 = @"Application Support";
    }
    else if (a3 == 5)
    {
      id v9 = @"Library";
    }
    else
    {
      uint64_t v10 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_pathForDirectory:]", 889);
      id v11 = brc_default_log(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        +[NSString(BRPathAdditions) br_pathForDirectory:]();
      }

      id v9 = 0;
    }
    id v8 = [@"/var/mobile" stringByAppendingPathComponent:v9];
  }

  return v8;
}

- (id)br_pathRelativeToDirectory:()BRPathAdditions
{
  id v2 = objc_msgSend(NSString, "br_pathForDirectory:");
  uint64_t v3 = [v2 stringByAppendingPathComponent:a1];

  return v3;
}

+ (id)br_supportDirForPersona:()BRPathAdditions dataSeparated:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (br_supportDirForPersona_dataSeparated__once != -1) {
    dispatch_once(&br_supportDirForPersona_dataSeparated__once, &__block_literal_global_9);
  }
  id v7 = (id)br_supportDirForPersona_dataSeparated__pathByPersonaID;
  objc_sync_enter(v7);
  id v8 = [(id)br_supportDirForPersona_dataSeparated__pathByPersonaID objectForKeyedSubscript:v6];
  if (!v8)
  {
    if (a4)
    {
      id v9 = objc_msgSend(a1, "br_currentHomeDir");
      uint64_t v10 = [v9 stringByAppendingPathComponent:@"Library/Application Support/CloudDocs"];
    }
    else
    {
      id v9 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
      id v11 = [v9 firstObject];
      uint64_t v10 = [v11 stringByAppendingPathComponent:@"CloudDocs"];
    }
    id v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v8 = [v10 stringByTrimmingCharactersInSet:v12];

    if ([v8 length])
    {
      if (v8)
      {
        unint64_t v13 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_supportDirForPersona:dataSeparated:]", 949);
        uint64_t v14 = brc_default_log(1);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          int v19 = 138412802;
          uint64_t v20 = v8;
          __int16 v21 = 2112;
          id v22 = v6;
          __int16 v23 = 2112;
          int v24 = v13;
          _os_log_debug_impl(&dword_19ED3F000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Caching directory path %@ for persona %@%@", (uint8_t *)&v19, 0x20u);
        }

        id v15 = objc_msgSend(v8, "br_realpath");
        [(id)br_supportDirForPersona_dataSeparated__pathByPersonaID setObject:v15 forKeyedSubscript:v6];
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
    }
    id v15 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_supportDirForPersona:dataSeparated:]", 952);
    uint64_t v16 = brc_default_log(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      uint64_t v20 = v15;
      _os_log_impl(&dword_19ED3F000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] No path for support directory%@", (uint8_t *)&v19, 0xCu);
    }

    id v8 = 0;
    goto LABEL_16;
  }
LABEL_17:
  id v17 = v8;

  objc_sync_exit(v7);

  return v17;
}

+ (id)br_currentSupportDir
{
  unsigned __int8 v4 = 0;
  id v1 = objc_msgSend(a1, "br_currentPersonaIDWithIsDataSeparated:", &v4);
  id v2 = objc_msgSend(NSString, "br_supportDirForPersona:dataSeparated:", v1, v4);

  return v2;
}

+ (uint64_t)br_personaGroupDir
{
  uint64_t v3 = BRIsFPFSEnabled(a1, a2);

  return objc_msgSend(a1, "br_personaGroupDirForFPFS:", v3);
}

+ (id)br_personaGroupDirForFPFS:()BRPathAdditions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (BRCurrentProcessHasAccessToCloudDocsGroupContainers()) {
    goto LABEL_3;
  }
  id v4 = [[BRDaemonConnection alloc] initUsingUserLocalDaemonTokenService];
  uint64_t v5 = (void *)[v4 newSyncTokenProxy];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  __int16 v21 = __55__NSString_BRPathAdditions__br_personaGroupDirForFPFS___block_invoke;
  id v22 = &unk_1E59AD910;
  id v23 = v5;
  id v6 = v5;
  [v6 fetchGroupContainerPathForCurrentPersonaForFPFS:a3 withReply:&v19];
  id v7 = [v6 result];

  if (!v7)
  {
LABEL_3:
    if (a3) {
      id v8 = @"group.com.apple.iCloudDrive";
    }
    else {
      id v8 = @"group.com.apple.CloudDocs";
    }
    [(__CFString *)v8 UTF8String];
    uint64_t v9 = container_create_or_lookup_path_for_current_user();
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      id v7 = [NSString stringWithUTF8String:v9];
      free(v10);
      if (v7) {
        goto LABEL_15;
      }
    }
    else
    {
      id v11 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_personaGroupDirForFPFS:]", 996);
      id v12 = brc_default_log(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v25 = v18;
        __int16 v26 = 2112;
        uint64_t v27 = v11;
        _os_log_impl(&dword_19ED3F000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] container_create_or_lookup_path_for_current_user() failed with %llu%@", buf, 0x16u);
      }
    }
    unint64_t v13 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v14 = [v13 currentPersona];

    id v15 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_personaGroupDirForFPFS:]", 1004);
    uint64_t v16 = brc_default_log(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      +[NSString(BRPathAdditions) br_personaGroupDirForFPFS:]();
    }

    id v7 = 0;
  }
LABEL_15:

  return v7;
}

+ (id)br_corruptedDBInfoPath
{
  v0 = objc_msgSend(NSString, "br_currentSupportDir");
  id v1 = [v0 stringByAppendingPathComponent:@"corrupted_db_info"];

  return v1;
}

+ (id)br_reimportDomainErrorInfoPath
{
  v0 = objc_msgSend(NSString, "br_currentSupportDir");
  id v1 = [v0 stringByAppendingPathComponent:@"reimport_domain_error_info"];

  return v1;
}

+ (id)br_accountSessionOpenErrorInfoPath
{
  v0 = objc_msgSend(NSString, "br_currentSupportDir");
  id v1 = [v0 stringByAppendingPathComponent:@"account_session_open_error_info"];

  return v1;
}

+ (id)_br_containerPathForDataSeparatedPersona
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (+[BRContainerCache hasDaemonicParts]) {
    goto LABEL_3;
  }
  id v0 = [[BRDaemonConnection alloc] initUsingUserLocalDaemonTokenService];
  id v1 = (void *)[v0 newSyncTokenProxy];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __69__NSString_BRPathAdditions___br_containerPathForDataSeparatedPersona__block_invoke;
  uint64_t v16 = &unk_1E59AD910;
  id v17 = v1;
  id v2 = v1;
  [v2 fetchContainerPathForCurrentPersonaWithReply:&v13];
  uint64_t v3 = [v2 result];

  if (!v3)
  {
LABEL_3:
    uint64_t v4 = container_create_or_lookup_path_for_current_user();
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v3 = [NSString stringWithUTF8String:v4];
      free(v5);
      if (v3) {
        goto LABEL_12;
      }
    }
    else
    {
      id v6 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) _br_containerPathForDataSeparatedPersona]", 1043);
      id v7 = brc_default_log(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v19 = 1;
        __int16 v20 = 2112;
        __int16 v21 = v6;
        _os_log_impl(&dword_19ED3F000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] container_create_or_lookup_path_for_current_user() failed with %llu%@", buf, 0x16u);
      }
    }
    id v8 = objc_msgSend(MEMORY[0x1E4FB36F8], "sharedManager", 1, v13, v14, v15, v16);
    uint64_t v9 = [v8 currentPersona];

    uint64_t v10 = brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) _br_containerPathForDataSeparatedPersona]", 1051);
    id v11 = brc_default_log(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[NSString(BRPathAdditions) br_personaGroupDirForFPFS:]();
    }

    uint64_t v3 = 0;
  }
LABEL_12:

  return v3;
}

- (void)_br_safeFileSystemRepresentationWithDefaultValue:()BRPathAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] Got unexpected exception %@. rethrow%@");
}

- (void)br_realpathKeepingLastSymlink
{
  __error();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_2(&dword_19ED3F000, v0, v1, "[DEBUG] realpath(%s) failed %{errno}d%@", v2, v3, v4, v5, v6);
}

- (void)br_realpath
{
  __error();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_2(&dword_19ED3F000, v0, v1, "[DEBUG] realpath(%@) failed %{errno}d%@", v2, v3, v4, v5, v6);
}

+ (void)br_pathWithDeviceID:()BRPathAdditions fileID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: deviceID != 0%@", v2, v3, v4, v5, v6);
}

+ (void)br_pathWithDeviceID:()BRPathAdditions fileID:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: fileID != 0%@", v2, v3, v4, v5, v6);
}

+ (void)br_representableHFSFileNameWithBase:()BRPathAdditions suffix:extension:makeDotFile:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
}

+ (void)br_pathForDirectory:()BRPathAdditions .cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: unknown directory%@", v2, v3, v4, v5, v6);
}

+ (void)br_pathForDirectory:()BRPathAdditions .cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: urls.count == 1%@", v2, v3, v4, v5, v6);
}

+ (void)br_pathForDirectory:()BRPathAdditions .cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: directory > 0%@", v2, v3, v4, v5, v6);
}

+ (void)br_personaGroupDirForFPFS:()BRPathAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: Unable to retrieve base path for current persona : %@%@");
}

+ (void)br_currentHomeDir
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_19ED3F000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] No path for home directory because we're running as root%@", v1, 0xCu);
}

@end