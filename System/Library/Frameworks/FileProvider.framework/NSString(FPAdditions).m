@interface NSString(FPAdditions)
+ (char)_fpd_pathWithFileSystemRepresentation:()FPAdditions;
+ (char)fp_pathWithFileSystemRepresentation:()FPAdditions;
+ (id)fp_commonParentPathForItemURLs:()FPAdditions;
+ (id)fp_fromParsedDiskIdentifier:()FPAdditions;
+ (id)fp_hashForToken:()FPAdditions;
+ (id)fp_representableHFSFileNameWithBase:()FPAdditions suffix:extension:makeDotFile:;
+ (uint64_t)fp_coordinatorReadingOptions:()FPAdditions;
+ (uint64_t)fp_maximumBounceLevel;
+ (uint64_t)fp_wordTokenizer;
- (__CFString)fp_fpIdentifier;
- (__CFString)fp_relativePathWithRealpath:()FPAdditions;
- (const)fp_fileSystemRepresentation;
- (id)fp_alwaysObfuscatedDotSeparatedComponents;
- (id)fp_alwaysObfuscatedExtendedAttributeName;
- (id)fp_alwaysObfuscatedFilename;
- (id)fp_alwaysObfuscatedPath;
- (id)fp_bouncedNameWithIndex:()FPAdditions isDir:;
- (id)fp_displayNameFromFilenameWithHiddenPathExtension:()FPAdditions isFolder:;
- (id)fp_filenameFromDisplayNameWithExtension:()FPAdditions;
- (id)fp_obfuscatedDotSeparatedComponents;
- (id)fp_obfuscatedExtendedAttributeName;
- (id)fp_obfuscatedFilename;
- (id)fp_obfuscatedPath;
- (id)fp_obfuscatedProviderDomainID;
- (id)fp_pathExtension;
- (id)fp_prettyPathWithObfuscation:()FPAdditions;
- (id)fp_realpath;
- (id)fp_representableHFSFileNameWithNumber:()FPAdditions addedExtension:makeDotFile:;
- (id)fp_representableHFSFileNameWithNumber:()FPAdditions addedExtension:makeDotFile:isDir:;
- (id)fp_representableHFSFileNameWithSuffix:()FPAdditions addedExtension:makeDotFile:isDir:;
- (id)fp_stringByDeletingPathBounceNo:()FPAdditions andPathExtension:isFolder:;
- (id)fp_stringByDeletingPathExtension;
- (id)fp_valueForKeyPath:()FPAdditions;
- (uint64_t)fp_bouncedNameWithIndex:()FPAdditions;
- (uint64_t)fp_getParsedDiskIdentifier:()FPAdditions;
- (uint64_t)fp_isCJKLanguageIdentifier;
- (uint64_t)fp_isLegacyCloudDocsIdentifier;
- (uint64_t)fp_isiCloudDriveIdentifier;
- (uint64_t)fp_isiCloudDriveOrCloudDocsIdentifier;
- (uint64_t)fp_libnotifyPerUserNotificationName;
- (uint64_t)fp_prettyPath;
- (uint64_t)fp_splitKeyPathInProperty:()FPAdditions remainder:;
- (uint64_t)fp_stringByDeletingPathBounceNo:()FPAdditions andPathExtension:;
- (void)fp_enumerateTokensInRange:()FPAdditions tokenizer:usingBlock:;
- (void)fp_realpath;
@end

@implementation NSString(FPAdditions)

- (__CFString)fp_relativePathWithRealpath:()FPAdditions
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if ([v4 hasPrefix:a1])
  {
    uint64_t v6 = [v5 length];
    if (v6 == [a1 length])
    {
      v7 = &stru_1EF68D1F8;
      goto LABEL_15;
    }
    v8 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(a1, "length"));
    if ([v8 length] && (objc_msgSend(v8, "isEqualToString:", @"/") & 1) == 0)
    {
      if ([v8 hasPrefix:@"/"])
      {
        v7 = [v8 substringFromIndex:1];
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = &stru_1EF68D1F8;
    }
    goto LABEL_14;
  }
  if (![a1 hasPrefix:v5])
  {
LABEL_10:
    v7 = 0;
    goto LABEL_15;
  }
  v8 = objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v5, "length"));
  v7 = &stru_1EF68D1F8;
  if ([v8 length] && !objc_msgSend(v8, "isEqualToString:", @"/")) {
    v7 = 0;
  }
LABEL_14:

LABEL_15:

  return v7;
}

- (uint64_t)fp_libnotifyPerUserNotificationName
{
  return [NSString stringWithFormat:@"user.uid.%d.%@", getuid(), a1];
}

+ (id)fp_fromParsedDiskIdentifier:()FPAdditions
{
  if (a3 == 0xFFFFFFFF80000000)
  {
    [NSString stringWithFormat:@"%@trash", @"__fp/fs/"];
  }
  else
  {
    if (a3)
    {
      id v4 = NSString;
      if (a3 < 0)
      {
        v5 = [NSNumber numberWithInteger:-a3];
        [v4 stringWithFormat:@"%@%@%@"], @"__fp/fs/", @"docID("), v5;
      }
      else
      {
        v5 = objc_msgSend(NSNumber, "numberWithInteger:");
        [v4 stringWithFormat:@"%@%@%@"], @"__fp/fs/", @"fileID("), v5;
      v3 = };

      goto LABEL_10;
    }
    [NSString stringWithFormat:@"%@root", @"__fp/fs/"];
  v3 = };
LABEL_10:

  return v3;
}

- (uint64_t)fp_isiCloudDriveOrCloudDocsIdentifier
{
  if (([a1 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"] & 1) != 0
    || ([a1 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) != 0)
  {
    return 1;
  }

  return [a1 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];
}

- (id)fp_obfuscatedProviderDomainID
{
  if (fp_shouldObfuscateFilenames())
  {
    v2 = NSString;
    v3 = objc_msgSend(a1, "fp_toProviderID");
    id v4 = objc_msgSend(a1, "fp_toDomainIdentifier");
    v5 = objc_msgSend(v4, "fp_obfuscatedFilename");
    id v6 = [v2 stringWithFormat:@"%@/%@", v3, v5];
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (id)fp_obfuscatedFilename
{
  v2 = objc_msgSend(a1, "fp_alwaysObfuscatedFilename");
  if (fp_shouldObfuscateFilenames()) {
    v3 = v2;
  }
  else {
    v3 = a1;
  }
  id v4 = v3;

  return v4;
}

- (id)fp_alwaysObfuscatedFilename
{
  if (![a1 length])
  {
    id v5 = a1;
    goto LABEL_14;
  }
  id v16 = 0;
  id v17 = 0;
  v2 = objc_msgSend(a1, "fp_stringByDeletingPathBounceNo:andPathExtension:", &v17, &v16);
  id v3 = v17;
  id v4 = v16;
  if ((unint64_t)[v2 length] > 2)
  {
    id v6 = obfuscateString(v2);
    v7 = v6;
    if (v4 && v3)
    {
      v8 = NSString;
      uint64_t v14 = [v3 intValue];
      id v15 = v4;
      v13 = v7;
      v9 = @"%@ %u.%@";
    }
    else
    {
      if (v4)
      {
        v10 = NSString;
        v13 = v7;
        uint64_t v14 = (uint64_t)v4;
        v9 = @"%@.%@";
        goto LABEL_11;
      }
      if (!v3)
      {
        id v11 = v6;
        goto LABEL_12;
      }
      v8 = NSString;
      v13 = v6;
      uint64_t v14 = [v3 intValue];
      v9 = @"%@ %u";
    }
    v10 = v8;
LABEL_11:
    objc_msgSend(v10, "stringWithFormat:", v9, v13, v14, v15);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    id v5 = v11;

    goto LABEL_13;
  }
  id v5 = a1;
LABEL_13:

LABEL_14:

  return v5;
}

- (id)fp_stringByDeletingPathBounceNo:()FPAdditions andPathExtension:isFolder:
{
  id v8 = a1;
  v9 = (char *)[v8 fileSystemRepresentation];
  v10 = v9;
  if ((a5 & 1) != 0 || (id v11 = _extensionInFilename(v9, 0)) == 0)
  {
    if (a4) {
      *a4 = 0;
    }
    size_t v14 = strlen(v10);
    v12 = 0;
    char v13 = 1;
  }
  else
  {
    v12 = v11;
    if (a4)
    {
      objc_msgSend(NSString, "fp_pathWithFileSystemRepresentation:", v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    char v13 = 0;
    size_t v14 = (size_t)&v12[~(unint64_t)v10];
  }
  id v15 = strrchr(v10, 32);
  if (v15)
  {
    id v16 = v15;
    if (v15 != v10 && v15 != &v10[v14])
    {
      id v17 = v15 + 1;
      if (v15[1] != 48)
      {
        uint64_t v32 = v17 - v10;
        if (v14 == v17 - v10) {
          goto LABEL_21;
        }
        v30 = a3;
        id v31 = v8;
        BOOL v18 = 0;
        int64_t v19 = &v10[v14] - v15;
        unint64_t v20 = 1;
        do
        {
          unsigned int v21 = v16[v20];
          if ((v21 & 0x80000000) != 0)
          {
            if (!__maskrune(v21, 0x400uLL)) {
              break;
            }
          }
          else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v21 + 60) & 0x400) == 0)
          {
            break;
          }
          BOOL v18 = v20++ >= v14 - (v17 - v10);
        }
        while (v19 != v20);
        a3 = v30;
        id v8 = v31;
        if (v18)
        {
LABEL_21:
          *__error() = 0;
          uint64_t v22 = strtoll(v16 + 1, 0, 10);
          if (*__error()) {
            BOOL v23 = 1;
          }
          else {
            BOOL v23 = v22 <= 1;
          }
          char v24 = !v23;
          int v25 = v24 & (v22 < 500);
          if (v25) {
            size_t v14 = v32 - 1;
          }
          if (a3 && (v25 & 1) != 0)
          {
            *a3 = [NSNumber numberWithLongLong:v22];
          }
        }
      }
    }
  }
  if (a4) {
    char v26 = 1;
  }
  else {
    char v26 = v13;
  }
  if (v26)
  {
    if (v10[v14])
    {
      v27 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v28 = [v27 stringWithFileSystemRepresentation:v10 length:v14];
    }
    else
    {
      id v28 = v8;
    }
  }
  else
  {
    v33 = 0;
    asprintf(&v33, "%.*s.%s", v14, v10, v12);
    objc_msgSend(NSString, "fp_pathWithFileSystemRepresentation:", v33);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    free(v33);
  }

  return v28;
}

- (id)fp_realpath
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = v1;
  if (!v1)
  {
    id v6 = 0;
    id v4 = &stru_1EF68D1F8;
    goto LABEL_34;
  }
  char v3 = 0;
  id v4 = &stru_1EF68D1F8;
  id v5 = v1;
  while (1)
  {
    if (![v5 length])
    {
      id v6 = v5;
      goto LABEL_34;
    }
    id v6 = v5;
    v7 = (char *)[v6 fileSystemRepresentation];
    if (!v7) {
      goto LABEL_34;
    }
    bzero(&v24, 0x40CuLL);
    long long v22 = xmmword_1A34E4878;
    uint64_t v23 = 0;
    if (v3) {
      unsigned int v8 = 32;
    }
    else {
      unsigned int v8 = 33;
    }
    if (getattrlist(v7, &v22, &v24, 0x40CuLL, v8) < 0)
    {
      unsigned int v21 = 0;
      goto LABEL_12;
    }
    v9 = strdup((const char *)&v24.st_mode + *(int *)&v24.st_mode);
    unsigned int v21 = v9;
    if (v9) {
      break;
    }
LABEL_12:
    if (*__error() == 63 && fpfs_supports_long_paths())
    {
      int v10 = (v3 & 1) != 0 ? 0 : 0x200000;
      int v11 = fpfs_open_longpath(v7, v10, 0);
      int v12 = v11;
      if ((v11 & 0x80000000) == 0)
      {
        memset(&v24, 0, sizeof(v24));
        if (fstat(v11, &v24) < 0 || (fpfs_fsgetpath(v24.st_dev, v24.st_ino, &v21, 0) & 0x80000000) != 0) {
          unsigned int v21 = 0;
        }
        int v13 = *__error();
        close(v12);
        *__error() = v13;
        id v16 = v21;
        if (v21) {
          goto LABEL_28;
        }
      }
    }
    if (*__error() != 2 && *__error() != 70)
    {
      int64_t v19 = fp_current_or_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        [(NSString(FPAdditions) *)(uint64_t)v6 fp_realpath];
      }

      goto LABEL_34;
    }
    size_t v14 = [v6 lastPathComponent];
    uint64_t v15 = [v14 stringByAppendingPathComponent:v4];

    id v5 = [v6 stringByDeletingLastPathComponent];

    char v3 = 1;
    id v4 = (__CFString *)v15;
    if (!v5)
    {
      id v6 = 0;
      id v4 = (__CFString *)v15;
      goto LABEL_34;
    }
  }
  id v16 = v9;
LABEL_28:
  if ([(__CFString *)v4 length] || strcmp(v7, v16))
  {
    id v17 = objc_msgSend(NSString, "_fpd_pathWithFileSystemRepresentation:", v16);
    id v18 = [v17 stringByAppendingPathComponent:v4];

    free(v16);
    goto LABEL_35;
  }
  free(v16);
LABEL_34:
  id v18 = v2;
LABEL_35:

  return v18;
}

- (uint64_t)fp_stringByDeletingPathBounceNo:()FPAdditions andPathExtension:
{
  return objc_msgSend(a1, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", a3, a4, 0);
}

+ (char)_fpd_pathWithFileSystemRepresentation:()FPAdditions
{
  char v3 = a3;
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v3 = [v4 stringWithFileSystemRepresentation:v3 length:strlen(v3)];
  }

  return v3;
}

- (id)fp_displayNameFromFilenameWithHiddenPathExtension:()FPAdditions isFolder:
{
  id v6 = a1;
  v7 = v6;
  if (a3 && (a4 & 1) == 0)
  {
    uint64_t v8 = [v6 stringByDeletingPathExtension];

    v7 = (void *)v8;
  }
  v9 = [v7 stringByReplacingOccurrencesOfString:@":" withString:@"/"];

  return v9;
}

- (uint64_t)fp_prettyPath
{
  uint64_t shouldObfuscateFilenames = fp_shouldObfuscateFilenames();

  return objc_msgSend(a1, "fp_prettyPathWithObfuscation:", shouldObfuscateFilenames);
}

- (id)fp_prettyPathWithObfuscation:()FPAdditions
{
  if (([a1 hasPrefix:@"/Applications/"] & 1) != 0
    || ([a1 hasPrefix:@"/System/Library/"] & 1) != 0
    || [a1 hasPrefix:@"/AppleInternal/"])
  {
    id v5 = a1;
  }
  else
  {
    v7 = (void *)[a1 mutableCopy];
    if (fp_prettyPathWithObfuscation__onceToken != -1) {
      dispatch_once(&fp_prettyPathWithObfuscation__onceToken, &__block_literal_global_129);
    }
    unsigned int v21 = replacePrefix(v7, (void *)fp_prettyPathWithObfuscation__temporaryDirectory, @"<Temp>/");
    int v8 = replacePrefix(v7, @"/private/var/mobile/", @"~/");
    int v9 = replacePrefix(v7, @"/var/mobile/", @"~/");
    int v10 = replacePrefix(v7, @"~/Containers/Shared/AppGroup/", @"<GroupContainers>/");
    int v11 = replacePrefix(v7, @"~/Library/Group Containers/", @"<GroupContainers>/");
    int v12 = replacePrefix(v7, @"~/Library/Application Support/", @"<AppSupport>/");
    int v13 = replacePrefix(v7, @"~/Library/Mobile Documents/", @"~LMD/");
    int v14 = replacePrefix(v7, @"~/Containers/Data/Application/", @"<AppContainers>/");
    int v15 = replacePrefix(v7, @"~/Library/CloudStorage/", @"<FPFS>/");
    int v16 = replacePrefix(v7, @"~/Library/Group Containers/group.com.apple.FileProvider.LocalStorage/File Provider Storage", @"<LocalStorage>");
    if (a3)
    {
      uint64_t v17 = v9 | v8 | v21;
      if (v12 | v11 | v10) {
        uint64_t v17 = 2;
      }
      if (v14 | v13) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = v17;
      }
      if (v15) {
        uint64_t v18 = 2;
      }
      if (v16) {
        unint64_t v19 = 1;
      }
      else {
        unint64_t v19 = v18;
      }
      obfuscatePath(v7, v19);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = v7;
    }
    id v5 = v20;
  }

  return v5;
}

- (uint64_t)fp_isiCloudDriveIdentifier
{
  if ([a1 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"]) {
    return 1;
  }

  return [a1 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];
}

+ (id)fp_hashForToken:()FPAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    memset(&v11, 0, sizeof(v11));
    id v3 = a3;
    CC_SHA1_Init(&v11);
    id v4 = v3;
    id v5 = (const void *)objc_msgSend(v4, "bytes", *(_OWORD *)&v11.h0, *(_OWORD *)&v11.h4, *(_OWORD *)&v11.data[1], *(_OWORD *)&v11.data[5], *(_OWORD *)&v11.data[9], *(_OWORD *)&v11.data[13]);
    CC_LONG v6 = [v4 length];

    CC_SHA1_Update(&v11, v5, v6);
    *(void *)md = 0;
    uint64_t v13 = 0;
    int v14 = 0;
    CC_SHA1_Final(md, &v11);
    v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
    int v8 = [v7 base64EncodedDataWithOptions:0];
    int v9 = (void *)[[NSString alloc] initWithData:v8 encoding:1];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (__CFString)fp_fpIdentifier
{
  if ([a1 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"])
  {
    v2 = @"icloud";
  }
  else if ([a1 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"])
  {
    v2 = @"icloudmanaged";
  }
  else if ([a1 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"])
  {
    v2 = @"clouddocs";
  }
  else if ([a1 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"])
  {
    v2 = @"clouddocsmanaged";
  }
  else if ([a1 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
  {
    v2 = @"localstorage";
  }
  else if ([a1 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"])
  {
    v2 = @"userfs";
  }
  else if ([a1 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"])
  {
    v2 = @"smbfs";
  }
  else if ([a1 hasPrefix:@"com.getdropbox.Dropbox.FileProvider"])
  {
    v2 = @"dropbox";
  }
  else
  {
    v2 = a1;
  }

  return v2;
}

- (uint64_t)fp_isLegacyCloudDocsIdentifier
{
  if ([a1 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"]) {
    return 1;
  }

  return [a1 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];
}

- (uint64_t)fp_getParsedDiskIdentifier:()FPAdditions
{
  if ([a1 hasPrefix:@"__fp/fs/"])
  {
    id v5 = [a1 substringFromIndex:8];
    if ([v5 isEqualToString:@"root"])
    {
      *a3 = 0;
LABEL_7:
      uint64_t v6 = 1;
LABEL_8:

      return v6;
    }
    if ([v5 isEqualToString:@"trash"])
    {
      *a3 = 0xFFFFFFFF80000000;
      goto LABEL_7;
    }
    if ([v5 hasSuffix:@""]))
    {
      if ([v5 hasPrefix:@"docID("]
      {
        int v8 = objc_msgSend(v5, "substringWithRange:", 6, objc_msgSend(v5, "length") - 7);
        uint64_t v9 = [v8 integerValue];
        if (v9 >= 1)
        {
          *a3 = -v9;
LABEL_17:

          goto LABEL_7;
        }
LABEL_18:

        goto LABEL_19;
      }
      if ([v5 hasPrefix:@"fileID("]
      {
        int v8 = objc_msgSend(v5, "substringWithRange:", 7, objc_msgSend(v5, "length") - 8);
        uint64_t v10 = [v8 integerValue];
        if (v10 >= 1)
        {
          *a3 = v10;
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
LABEL_19:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  return 0;
}

- (id)fp_filenameFromDisplayNameWithExtension:()FPAdditions
{
  id v4 = a3;
  id v5 = [a1 stringByReplacingOccurrencesOfString:@"/" withString:@":"];
  if (v4)
  {
    uint64_t v6 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

    uint64_t v7 = [v5 stringByAppendingPathExtension:v6];

    id v5 = (void *)v7;
  }

  return v5;
}

+ (char)fp_pathWithFileSystemRepresentation:()FPAdditions
{
  id v3 = a3;
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v3 = [v4 stringWithFileSystemRepresentation:v3 length:strlen(v3)];
  }

  return v3;
}

+ (id)fp_commonParentPathForItemURLs:()FPAdditions
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__12;
    v37 = __Block_byref_object_dispose__12;
    id v38 = 0;
    id v20 = v3;
    id v4 = [v3 firstObject];
    id v5 = [v4 URLByDeletingLastPathComponent];
    id v38 = [v5 pathComponents];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v6 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = [*(id *)(*((void *)&v29 + 1) + 8 * i) pathComponents];
          uint64_t v25 = 0;
          char v26 = &v25;
          uint64_t v27 = 0x2020000000;
          char v28 = 0;
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __56__NSString_FPAdditions__fp_commonParentPathForItemURLs___block_invoke;
          v21[3] = &unk_1E5AF3378;
          uint64_t v23 = &v33;
          stat v24 = &v25;
          id v11 = v10;
          id v22 = v11;
          [v11 enumerateObjectsUsingBlock:v21];
          if (!*((unsigned char *)v26 + 24))
          {
            if ([v11 count])
            {
              uint64_t v12 = objc_msgSend(v11, "subarrayWithRange:", 0, objc_msgSend(v11, "count") - 1);
              uint64_t v13 = (void *)v34[5];
              v34[5] = v12;
            }
            else
            {
              int v14 = v6;
              uint64_t v15 = v34;
              id v16 = v11;
              uint64_t v13 = (void *)v15[5];
              v15[5] = (uint64_t)v16;
              uint64_t v6 = v14;
            }
          }
          _Block_object_dispose(&v25, 8);
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v7);
    }

    uint64_t v17 = [NSString pathWithComponents:v34[5]];
    if (([v17 hasSuffix:@"/"] & 1) == 0)
    {
      uint64_t v18 = [v17 stringByAppendingString:@"/"];

      uint64_t v17 = (void *)v18;
    }
    _Block_object_dispose(&v33, 8);

    id v3 = v20;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (uint64_t)fp_maximumBounceLevel
{
  return 500;
}

- (id)fp_obfuscatedDotSeparatedComponents
{
  v2 = objc_msgSend(a1, "fp_alwaysObfuscatedDotSeparatedComponents");
  if (fp_shouldObfuscateFilenames()) {
    id v3 = v2;
  }
  else {
    id v3 = a1;
  }
  id v4 = v3;

  return v4;
}

- (id)fp_alwaysObfuscatedDotSeparatedComponents
{
  if ([a1 length])
  {
    v2 = [a1 componentsSeparatedByString:@"."];
    id v3 = (void *)[v2 mutableCopy];

    if ([v3 count])
    {
      unint64_t v4 = 0;
      do
      {
        id v5 = [v3 objectAtIndexedSubscript:v4];
        uint64_t v6 = obfuscateString(v5);
        [v3 setObject:v6 atIndexedSubscript:v4];

        ++v4;
      }
      while (v4 < [v3 count]);
    }
    id v7 = [v3 componentsJoinedByString:@"."];
  }
  else
  {
    id v7 = a1;
  }

  return v7;
}

- (id)fp_obfuscatedExtendedAttributeName
{
  v2 = objc_msgSend(a1, "fp_alwaysObfuscatedExtendedAttributeName");
  if (fp_shouldObfuscateFilenames()) {
    id v3 = v2;
  }
  else {
    id v3 = a1;
  }
  id v4 = v3;

  return v4;
}

- (id)fp_alwaysObfuscatedExtendedAttributeName
{
  if ([a1 length])
  {
    uint64_t v2 = [a1 rangeOfString:@"#" options:5];
    uint64_t v4 = v3;
    uint64_t v5 = [a1 length];
    uint64_t v6 = &stru_1EF68D1F8;
    if (v4)
    {
      if (v2)
      {
        [a1 rangeOfComposedCharacterSequenceAtIndex:v2];
        uint64_t v8 = v7 + v2;
        if (v7 + v2 < (unint64_t)[a1 length])
        {
          uint64_t v9 = 0;
          while (1)
          {
            int v10 = [a1 characterAtIndex:v8];
            if (v10 > 97)
            {
              if (v10 <= 109)
              {
                if (v10 != 98)
                {
                  uint64_t v11 = 2;
                  if (v10 != 99) {
                    break;
                  }
                  goto LABEL_26;
                }
LABEL_25:
                uint64_t v11 = 16;
                goto LABEL_26;
              }
              if (v10 == 110)
              {
LABEL_23:
                uint64_t v11 = 4;
                goto LABEL_26;
              }
              if (v10 == 115) {
                goto LABEL_24;
              }
              if (v10 != 112) {
                break;
              }
            }
            else
            {
              if (v10 <= 77)
              {
                if (v10 != 66)
                {
                  uint64_t v11 = 2;
                  if (v10 != 67) {
                    break;
                  }
                  goto LABEL_26;
                }
                goto LABEL_25;
              }
              if (v10 == 78) {
                goto LABEL_23;
              }
              if (v10 != 80)
              {
                if (v10 != 83) {
                  break;
                }
LABEL_24:
                uint64_t v11 = 8;
                goto LABEL_26;
              }
            }
            uint64_t v11 = 1;
LABEL_26:
            if ((v11 & v9) != 0) {
              break;
            }
            v9 |= v11;
            if (++v8 >= (unint64_t)[a1 length])
            {
              objc_msgSend(a1, "substringWithRange:", v2, objc_msgSend(a1, "length") - v2);
              uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
              uint64_t v5 = v2;
              break;
            }
          }
        }
      }
    }
    uint64_t v12 = objc_msgSend(a1, "rangeOfString:options:range:", @":", 5, 0, v5);
    if (v13 && (uint64_t v14 = v12) != 0)
    {
      uint64_t v15 = [a1 rangeOfComposedCharacterSequenceAtIndex:v12];
      if (v5 == v15 + v16)
      {
        uint64_t v17 = 0;
      }
      else
      {
        unint64_t v19 = objc_msgSend(a1, "substringWithRange:", v15 + v16, v5 - (v15 + v16));
        uint64_t v17 = objc_msgSend(v19, "fp_alwaysObfuscatedDotSeparatedComponents");

        uint64_t v5 = v14;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    id v20 = objc_msgSend(a1, "substringWithRange:", 0, v5);
    unsigned int v21 = objc_msgSend(v20, "fp_alwaysObfuscatedDotSeparatedComponents");

    if (v17) {
      [NSString stringWithFormat:@"%@:%@%@", v21, v17, v6];
    }
    else {
    id v18 = [NSString stringWithFormat:@"%@%@", v21, v6, v23];
    }
  }
  else
  {
    id v18 = a1;
  }

  return v18;
}

- (id)fp_alwaysObfuscatedPath
{
  return obfuscatePath(a1, 0);
}

- (id)fp_obfuscatedPath
{
  if (fp_shouldObfuscateFilenames())
  {
    objc_msgSend(a1, "fp_alwaysObfuscatedPath");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }

  return v2;
}

- (id)fp_bouncedNameWithIndex:()FPAdditions isDir:
{
  if (a4)
  {
    uint64_t v7 = [a1 lastPathComponent];
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = objc_msgSend(a1, "fp_stringByDeletingPathExtension");
    uint64_t v8 = objc_msgSend(a1, "fp_pathExtension");
  }
  if ([v8 isEqualToString:@"icloud"])
  {
    uint64_t v9 = objc_msgSend(v7, "fp_pathExtension");
    uint64_t v10 = objc_msgSend(v7, "fp_stringByDeletingPathExtension");

    if (v9)
    {
      uint64_t v11 = [v9 stringByAppendingPathExtension:v8];

      uint64_t v8 = (void *)v11;
    }

    uint64_t v7 = (void *)v10;
  }
  uint64_t v12 = [NSNumber numberWithInteger:a3];
  uint64_t v13 = objc_msgSend(v7, "fp_representableHFSFileNameWithNumber:addedExtension:makeDotFile:isDir:", v12, v8, 0, a4);

  return v13;
}

- (uint64_t)fp_bouncedNameWithIndex:()FPAdditions
{
  return objc_msgSend(a1, "fp_bouncedNameWithIndex:isDir:", a3, 0);
}

- (const)fp_fileSystemRepresentation
{
  if (![a1 length]) {
    return ".";
  }
  id v2 = a1;

  return (const char *)[v2 fileSystemRepresentation];
}

+ (id)fp_representableHFSFileNameWithBase:()FPAdditions suffix:extension:makeDotFile:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
  memset(&v31[2], 0, 223);
  uint64_t v17 = 254 - v12;
  if (v15) {
    unint64_t v18 = ~v15;
  }
  else {
    unint64_t v18 = 0;
  }
  memset(v31, 0, 32);
  if (a6)
  {
    LOBYTE(v31[0]) = 46;
    uint64_t v16 = 1;
  }
  uint64_t v30 = 0;
  if (!v12) {
    uint64_t v17 = 255;
  }
  int v19 = objc_msgSend(v9, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (unint64_t)v31 | v16, v17 + v18 - v16, &v30, 4, 0, 0, objc_msgSend(v9, "length"), 0);
  uint64_t v20 = v30;
  if (!v19) {
    uint64_t v20 = 0;
  }
  uint64_t v21 = v20 + v16;
  if (!v12)
  {
LABEL_16:
    if (!v15) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  uint64_t v22 = v21 + 1;
  *((unsigned char *)v31 + v21) = 32;
  if (objc_msgSend(v10, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)v31 + v21 + 1, v12, &v30, 4, 0, 0, objc_msgSend(v10, "length"), 0))
  {
    uint64_t v21 = v30 + v22;
    goto LABEL_16;
  }
  uint64_t v23 = fp_current_or_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    +[NSString(FPAdditions) fp_representableHFSFileNameWithBase:suffix:extension:makeDotFile:]((uint64_t)v9, v23);
  }

  stat v24 = [MEMORY[0x1E4F29128] UUID];
  id v25 = [v24 UUIDString];
  uint64_t v21 = v22
      + snprintf((char *)v31 + v21 + 1, 254 - v21, "com-apple-bird-recovered-%s", (const char *)[v25 UTF8String]);

  if (v15)
  {
LABEL_21:
    uint64_t v26 = v21 + 1;
    *((unsigned char *)v31 + v21) = 46;
    if (objc_msgSend(v11, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)v31 + ++v21, v15, &v30, 4, 0, 0, objc_msgSend(v11, "length"), 0))uint64_t v21 = v30 + v26; {
  }
    }
LABEL_23:
  char v28 = (void *)[[NSString alloc] initWithBytes:v31 length:v21 encoding:4];

  return v28;
}

- (id)fp_representableHFSFileNameWithSuffix:()FPAdditions addedExtension:makeDotFile:isDir:
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 length];
  uint64_t v13 = [v11 length];
  if ((a5 & 1) != 0 || v12 || v13 || (unint64_t)[a1 lengthOfBytesUsingEncoding:4] >= 0x100)
  {
    if (v11 || a6)
    {
      id v14 = v11;
      id v15 = a1;
    }
    else
    {
      objc_msgSend(a1, "fp_pathExtension");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "fp_stringByDeletingPathExtension");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v16 = v15;
    objc_msgSend(NSString, "fp_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v15, v10, v14, a5);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = a1;
  }

  return v17;
}

- (id)fp_representableHFSFileNameWithNumber:()FPAdditions addedExtension:makeDotFile:isDir:
{
  id v10 = a4;
  id v11 = [a3 stringValue];
  uint64_t v12 = objc_msgSend(a1, "fp_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:isDir:", v11, v10, a5, a6);

  return v12;
}

- (id)fp_representableHFSFileNameWithNumber:()FPAdditions addedExtension:makeDotFile:
{
  id v8 = a4;
  id v9 = [a3 stringValue];
  id v10 = objc_msgSend(a1, "fp_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:isDir:", v9, v8, a5, 0);

  return v10;
}

- (id)fp_pathExtension
{
  id v1 = _extensionInFilename((char *)[a1 fileSystemRepresentation], 0);
  id v2 = (void *)v1;
  if (v1)
  {
    size_t v3 = strlen(v1);
    if (v3)
    {
      size_t v4 = v3;
      uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v2 = [v5 stringWithFileSystemRepresentation:v2 length:v4];
    }
    else
    {
      id v2 = 0;
    }
  }

  return v2;
}

- (id)fp_stringByDeletingPathExtension
{
  id v1 = a1;
  id v2 = (char *)[v1 fileSystemRepresentation];
  size_t v3 = _extensionInFilename(v2, 0);
  if (v3)
  {
    size_t v4 = v3;
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [v5 stringWithFileSystemRepresentation:v2 length:&v4[~(unint64_t)v2]];
  }
  else
  {
    id v6 = v1;
  }

  return v6;
}

+ (uint64_t)fp_wordTokenizer
{
  if (fp_wordTokenizer_onceToken != -1) {
    dispatch_once(&fp_wordTokenizer_onceToken, &__block_literal_global_188);
  }
  return fp_wordTokenizer_tokenizerRef;
}

- (void)fp_enumerateTokensInRange:()FPAdditions tokenizer:usingBlock:
{
  id v11 = a6;
  if (!a5)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"NSString+FPAdditions.m" lineNumber:962 description:@"tokenizerRef may not be null."];
  }
  v18.location = a3;
  v18.length = a4;
  CFStringTokenizerSetString(a5, a1, v18);
  do
  {
    if (!CFStringTokenizerAdvanceToNextToken(a5)) {
      break;
    }
    uint64_t v12 = (void *)MEMORY[0x1A6248870]();
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(a5);
    id v14 = -[__CFString substringWithRange:](a1, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    unsigned __int8 v17 = 0;
    v11[2](v11, v14, CurrentTokenRange.location, CurrentTokenRange.length, &v17);
    int v15 = v17;
  }
  while (!v15);
}

- (uint64_t)fp_isCJKLanguageIdentifier
{
  if (fp_isCJKLanguageIdentifier_onceToken != -1) {
    dispatch_once(&fp_isCJKLanguageIdentifier_onceToken, &__block_literal_global_197);
  }
  id v2 = (void *)fp_isCJKLanguageIdentifier_cjkLanguages;

  return [v2 containsObject:a1];
}

+ (uint64_t)fp_coordinatorReadingOptions:()FPAdditions
{
  uint64_t v3 = 109;
  uint64_t v4 = 45;
  if ((a3 & 0x40000000) == 0) {
    uint64_t v3 = 45;
  }
  uint64_t v18 = v3;
  uint64_t v5 = 112;
  if ((a3 & 0x20000000) == 0) {
    uint64_t v5 = 45;
  }
  uint64_t v6 = 99;
  if ((a3 & 0x80000) == 0) {
    uint64_t v6 = 45;
  }
  uint64_t v16 = v6;
  uint64_t v17 = v5;
  uint64_t v7 = 98;
  if ((a3 & 0x40000) == 0) {
    uint64_t v7 = 45;
  }
  uint64_t v8 = 114;
  if ((a3 & 0x20000) == 0) {
    uint64_t v8 = 45;
  }
  uint64_t v14 = v8;
  uint64_t v15 = v7;
  uint64_t v9 = 117;
  if ((a3 & 8) == 0) {
    uint64_t v9 = 45;
  }
  uint64_t v10 = 105;
  if ((a3 & 4) == 0) {
    uint64_t v10 = 45;
  }
  uint64_t v13 = v9;
  uint64_t v11 = 115;
  if ((a3 & 2) == 0) {
    uint64_t v11 = 45;
  }
  if (a3) {
    uint64_t v4 = 119;
  }
  return objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c%c%c%c%c%c (0x%lx)", v4, v11, v10, v13, v14, v15, v16, v17, v18, a3);
}

- (uint64_t)fp_splitKeyPathInProperty:()FPAdditions remainder:
{
  uint64_t result = [a1 length];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t result = [a1 rangeOfString:@"."];
    if (result)
    {
      uint64_t v9 = result;
      if (result == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v10 = a1;
        id v11 = 0;
        *a3 = v10;
      }
      else
      {
        if (result == v8 - 1) {
          return 0;
        }
        objc_msgSend(a1, "substringWithRange:", 0, result);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "substringWithRange:", v9 + 1, v8 + ~v9);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      *a4 = v11;
      return 1;
    }
  }
  return result;
}

- (id)fp_valueForKeyPath:()FPAdditions
{
  if ([a3 isEqual:@"pathExtension"])
  {
    uint64_t v4 = [a1 pathExtension];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)fp_realpath
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] realpath(%@) failed: %{errno}d", (uint8_t *)&v5, 0x12u);
}

+ (void)fp_representableHFSFileNameWithBase:()FPAdditions suffix:extension:makeDotFile:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
}

@end