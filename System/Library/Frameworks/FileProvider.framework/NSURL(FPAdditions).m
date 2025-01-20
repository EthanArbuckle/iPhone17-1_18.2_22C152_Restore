@interface NSURL(FPAdditions)
+ (id)fp_backupManifestDirectory;
+ (id)fp_cloudStorageDirectory;
+ (id)fp_homeDirectory;
+ (id)fp_homeDirectoryForUserID:()FPAdditions;
+ (id)fp_homeDirectoryPathForUserID:()FPAdditions;
+ (id)fp_insecureTempDirectory;
+ (id)fp_insecureTempDirectoryIgnoringPersona;
+ (id)fp_lmdURL;
+ (id)fp_personaSharedDirectory;
+ (id)fp_personaSharedDirectoryPathForUserID:()FPAdditions;
+ (id)fp_secureTempDirectory;
+ (id)fp_secureTempDirectoryIgnoringPersona;
+ (id)fp_supportDirectory;
+ (id)fp_supportDirectoryForVolume:()FPAdditions;
+ (id)fp_tempDirectoryForEnterprisePersona;
+ (id)fp_uncachedContainerURLForSecurityApplicationGroupIdentifier:()FPAdditions;
+ (void)fp_tempDirectoryForEnterprisePersona;
- (BOOL)fp_associateThumbnailFromDocumentAtURL:()FPAdditions error:;
- (BOOL)fp_associateThumbnailToVersionAtURL:()FPAdditions thumbnailMetadata:error:;
- (BOOL)fp_isInSyncableRootFast;
- (BOOL)fp_isLocationOrInLocation:()FPAdditions relativeTo:;
- (BOOL)fp_matchesAlternateContentsURL:()FPAdditions;
- (BOOL)fp_removeACLWithError:()FPAdditions;
- (id)_fp_componentsRelativeToRoot:()FPAdditions;
- (id)fp_addDocumentTrackingWithError:()FPAdditions;
- (id)fp_bouncedNameWithIndex:()FPAdditions;
- (id)fp_commonDirectDescendantOf:()FPAdditions;
- (id)fp_directorySizeWithError:()FPAdditions;
- (id)fp_fpfsProviderDomainID:()FPAdditions skipTypeCheck:error:;
- (id)fp_fpfsRootURL;
- (id)fp_mountOnName;
- (id)fp_moveToTempFolderWithFilename:()FPAdditions error:;
- (id)fp_realpathURL;
- (id)fp_relativePathOf:()FPAdditions;
- (id)fp_relativePathWithRealpath:()FPAdditions;
- (id)fp_resolveDetachedRootLogicalLocation:()FPAdditions error:;
- (id)fp_scopeDescription;
- (id)fp_shortDescription;
- (id)fp_uniqueTempFolderWithError:()FPAdditions;
- (id)fp_volumeUUID;
- (uint64_t)_fp_partOfAppInboxWithURLComponents:()FPAdditions;
- (uint64_t)_fp_relationshipToItemAtURL:()FPAdditions bothAreRealpaths:;
- (uint64_t)fp_attachSecurityScopeFromURL:()FPAdditions;
- (uint64_t)fp_checkSandboxFileMetadataRead;
- (uint64_t)fp_fpfsProviderDomainID:()FPAdditions;
- (uint64_t)fp_fpfsProviderDomainID:()FPAdditions error:;
- (uint64_t)fp_hasThumbnailOnImmutableDocument;
- (uint64_t)fp_isAppInboxOrDescendants;
- (uint64_t)fp_isFolder;
- (uint64_t)fp_isPackage;
- (uint64_t)fp_isSymlink;
- (uint64_t)fp_makeWritableOnFD:()FPAdditions error:;
- (uint64_t)fp_makeWritableWithError:()FPAdditions;
- (uint64_t)fp_matchesApplicationContainerURL:()FPAdditions;
- (uint64_t)fp_matchesCloudDocsURL:()FPAdditions;
- (uint64_t)fp_matchesEDSLocation;
- (uint64_t)fp_matchesFPFSURL:()FPAdditions;
- (uint64_t)fp_matchesFileProviderHeuristics:()FPAdditions;
- (uint64_t)fp_matchesFileProviderURL:()FPAdditions;
- (uint64_t)fp_matchesLiveFilesURL:()FPAdditions;
- (uint64_t)fp_matchesUbiquitousHeuristics;
- (uint64_t)fp_realPathRelationshipToItemAtRealPathURL:()FPAdditions;
- (uint64_t)fp_relationshipToItemAtURL:()FPAdditions;
- (uint64_t)fp_removeFileProviderXattrsWithError:()FPAdditions;
- (void)fp_hideExtension:()FPAdditions;
- (void)fp_issueSandboxExtensionOfClass:()FPAdditions report:error:;
- (void)fp_makeWritableAndRemoveNonExportableAttributes;
- (void)fp_mountOnName;
- (void)fp_volumeUUID;
@end

@implementation NSURL(FPAdditions)

- (uint64_t)fp_matchesEDSLocation
{
  v2 = [@"PersonaVolumes/<uuid>/Containers/Data/InternalDaemon/<uuid>/Library/CloudStorage/<uuid>" componentsSeparatedByString:@"/"];
  if (fpfs_supports_sokoban())
  {
    v3 = 0;
  }
  else
  {
    v3 = [@"PersonaVolumes/<uuid>/Containers/Data/InternalDaemon/<uuid>/Library/Mobile Documents" componentsSeparatedByString:@"/"];
  }
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var"];
  v5 = objc_msgSend(v4, "fp_relativePathWithRealpath:", a1);

  if (v5)
  {
    v6 = [@"PersonaVolumes/<uuid>/Containers/Shared/AppGroup/<uuid>/File Provider Storage" componentsSeparatedByString:@"/"];
    v7 = [v5 componentsSeparatedByString:@"/"];
    unint64_t v8 = [v7 count];
    if (v8 >= [v6 count]
      || (unint64_t v9 = [v7 count], v9 >= objc_msgSend(v2, "count"))
      || (unint64_t v10 = [v7 count], v10 >= objc_msgSend(0, "count"))
      || (unint64_t v11 = [v7 count], v11 >= objc_msgSend(v3, "count")))
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __43__NSURL_FPAdditions__fp_matchesEDSLocation__block_invoke;
      v15[3] = &unk_1E5AF20A0;
      id v16 = v7;
      v13 = (uint64_t (**)(void, void))MEMORY[0x1A6248B00](v15);
      if ((((uint64_t (**)(void, void *))v13)[2](v13, v6) & 1) != 0
        || (((uint64_t (**)(void, void *))v13)[2](v13, v2) & 1) != 0
        || (v13[2](v13, 0) & 1) != 0)
      {
        uint64_t v12 = 1;
      }
      else if (fpfs_supports_sokoban())
      {
        uint64_t v12 = 0;
      }
      else
      {
        uint64_t v12 = ((uint64_t (**)(void, void *))v13)[2](v13, v3);
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)fp_relativePathWithRealpath:()FPAdditions
{
  id v4 = a3;
  v5 = [a1 path];
  v6 = [v4 path];

  v7 = 0;
  if (v5 && v6)
  {
    v7 = objc_msgSend(v5, "fp_relativePathWithRealpath:", v6);
  }

  return v7;
}

+ (id)fp_lmdURL
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
  v1 = [v0 URLByAppendingPathComponent:@"Library/Mobile Documents" isDirectory:1];

  return v1;
}

+ (id)fp_homeDirectory
{
  uint64_t v0 = geteuid();
  if (v0)
  {
    v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectoryForUserID:", v0);
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

- (id)fp_fpfsProviderDomainID:()FPAdditions skipTypeCheck:error:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    objc_msgSend(a1, "fp_fpfsRootURL");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = a1;
  }
  v7 = v6;
  if (!v6)
  {
    if (!a5) {
      goto LABEL_31;
    }
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 2;
LABEL_24:
    objc_msgSend(v15, "fp_errorWithPOSIXCode:", v16);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  bzero(v25, 0x401uLL);
  size_t size = 0;
  id v8 = v7;
  unint64_t v9 = fpfs_path_return_assigned_provider_domain_xattr((const char *)[v8 fileSystemRepresentation], (ssize_t *)&size, v25, 0x401uLL);
  if (!v9)
  {
    if (!a5) {
      goto LABEL_31;
    }
    unsigned int v17 = *__error();
    BOOL v18 = v17 == 0;
    unsigned int v19 = 93;
LABEL_20:
    if (v18) {
      uint64_t v16 = v19;
    }
    else {
      uint64_t v16 = v17;
    }
    v15 = (void *)MEMORY[0x1E4F28C58];
    goto LABEL_24;
  }
  unint64_t v10 = v9;
  uint64_t v11 = size;
  if (size >= 0x402)
  {
    uint64_t v12 = malloc_type_malloc(size + 1, 0x94AB70FuLL);
    if (v12)
    {
      v13 = v12;
      v14 = (const char *)[v8 fileSystemRepresentation];
      uint64_t v11 = getxattr(v14, v10, v13, size, 0, 1);
      if (v11 >= 1 && v11 <= (uint64_t)size)
      {
        size_t size = v11;
        goto LABEL_16;
      }
      if (a5)
      {
        unsigned int v21 = *__error();
        if (v21) {
          uint64_t v22 = v21;
        }
        else {
          uint64_t v22 = 93;
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", v22);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      free(v13);
LABEL_31:
      v20 = 0;
      goto LABEL_32;
    }
    if (!a5) {
      goto LABEL_31;
    }
    unsigned int v17 = *__error();
    BOOL v18 = v17 == 0;
    unsigned int v19 = 12;
    goto LABEL_20;
  }
  v13 = v25;
LABEL_16:
  v13[v11] = 0;
  v20 = [NSString stringWithUTF8String:v13];
  if (v13 != v25) {
    free(v13);
  }
LABEL_32:

  return v20;
}

- (uint64_t)fp_fpfsProviderDomainID:()FPAdditions error:
{
  return objc_msgSend(a1, "fp_fpfsProviderDomainID:skipTypeCheck:error:", a3, 0, a4);
}

- (uint64_t)fp_fpfsProviderDomainID:()FPAdditions
{
  return objc_msgSend(a1, "fp_fpfsProviderDomainID:error:", a3, 0);
}

- (void)fp_issueSandboxExtensionOfClass:()FPAdditions report:error:
{
  unint64_t v9 = [a1 path];
  if ([a1 hasDirectoryPath])
  {
    uint64_t v10 = [v9 stringByAppendingString:@"/"];

    unint64_t v9 = (void *)v10;
  }
  int v11 = *MEMORY[0x1E4F14130];
  if (a4) {
    int v11 = 0;
  }
  int v12 = v11 | *MEMORY[0x1E4F14128];
  id v13 = v9;
  v14 = (const char *)fpfs_lp_sandbox_extension_issue_file(a3, (const char *)[v13 fileSystemRepresentation], v12);
  if (v14)
  {
    a5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v14 length:strlen(v14) + 1 freeWhenDone:1];
  }
  else if (a5)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *__error();
    unsigned int v17 = [a1 path];
    BOOL v18 = __error();
    objc_msgSend(v15, "fp_errorWithPOSIXCode:description:", v16, @"couldn't issue sandbox extension %s for '%@': %s", a3, v17, strerror(*v18));
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

- (uint64_t)fp_matchesFileProviderHeuristics:()FPAdditions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  bzero(v12, 0x878uLL);
  id v5 = a1;
  if (FPStatVFS(-1, (const char *)[v5 fileSystemRepresentation], (uint64_t)v12))
  {
    if (*__error() != 2)
    {
      id v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[NSURL(FPAdditions) fp_matchesFileProviderHeuristics:](v5);
      }
    }
  }
  else if ((v12[32] & 0x1200) != 0x1000)
  {
    return 1;
  }
  v7 = objc_msgSend(v5, "fp_realpathURL");
  id v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectoryForUserID:", a3);
  unint64_t v9 = objc_msgSend(v8, "fp_realpathURL");

  if ((objc_msgSend(v7, "fp_matchesFileProviderURL:", v9) & 1) != 0
    || (objc_msgSend(v7, "fp_matchesApplicationContainerURL:", v9) & 1) != 0
    || (objc_msgSend(v7, "fp_matchesEDSLocation") & 1) != 0
    || (objc_msgSend(v7, "fp_matchesCloudDocsURL:", v9) & 1) != 0
    || (objc_msgSend(v7, "fp_matchesFPFSURL:", v9) & 1) != 0
    || (objc_msgSend(v7, "fp_matchesLiveFilesURL:", v9) & 1) != 0)
  {
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = objc_msgSend(v7, "fp_matchesAlternateContentsURL:", v9);
  }

  return v10;
}

- (id)fp_realpathURL
{
  v2 = [a1 path];
  v3 = objc_msgSend(v2, "fp_realpath");

  if ([v3 length])
  {
    objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", v3, objc_msgSend(a1, "hasDirectoryPath"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = a1;
  }
  id v5 = v4;

  return v5;
}

+ (id)fp_homeDirectoryForUserID:()FPAdditions
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectoryPathForUserID:");
  if (v0)
  {
    v1 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v0 isDirectory:1];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (id)fp_homeDirectoryPathForUserID:()FPAdditions
{
  v3 = copyHomeDirectoryCompat(a3);
  if (v3)
  {
    id v4 = v3;
    id v5 = [NSString stringWithUTF8String:v3];
    free(v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (uint64_t)fp_matchesFileProviderURL:()FPAdditions
{
  id v4 = [a3 URLByAppendingPathComponent:@"Containers/Shared/AppGroup/" isDirectory:1];
  id v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, "fp_relativePathWithRealpath:", a1);
    v7 = [v6 pathComponents];
    if ((unint64_t)[v7 count] < 2)
    {
      uint64_t v9 = 0;
    }
    else
    {
      id v8 = [v7 objectAtIndexedSubscript:1];
      uint64_t v9 = [v8 isEqualToString:@"File Provider Storage"];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)fp_matchesCloudDocsURL:()FPAdditions
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = objc_msgSend(v4, "fp_relativePathWithRealpath:", a1);
  uint64_t v6 = objc_msgSend(a1, "fp_isLocationOrInLocation:relativeTo:", @"Library/Mobile Documents", v4);

  return v6;
}

- (uint64_t)fp_matchesApplicationContainerURL:()FPAdditions
{
  v2 = objc_msgSend(a1, "_fp_componentsRelativeToRoot:");
  v3 = v2;
  if (v2
    && (unint64_t)[v2 count] >= 2
    && ([v3 objectAtIndexedSubscript:1],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:@"Documents"],
        v4,
        v5))
  {
    uint64_t v6 = objc_msgSend(a1, "_fp_partOfAppInboxWithURLComponents:", v3) ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)fp_isLocationOrInLocation:()FPAdditions relativeTo:
{
  int v5 = [a4 URLByAppendingPathComponent:a3 isDirectory:1];
  uint64_t v6 = objc_msgSend(v5, "fp_relativePathWithRealpath:", a1);
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)_fp_componentsRelativeToRoot:()FPAdditions
{
  id v4 = [a3 URLByAppendingPathComponent:@"Containers/Data/Application/" isDirectory:1];
  int v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "fp_relativePathWithRealpath:", a1);
    BOOL v7 = [v6 pathComponents];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (uint64_t)fp_matchesLiveFilesURL:()FPAdditions
{
  if (!a3) {
    return 0;
  }
  v3 = objc_msgSend(a3, "fp_relativePathWithRealpath:", a1);
  if ([v3 hasPrefix:@"Library/liveFiles/"]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 hasPrefix:@"Library/LiveFiles/"];
  }

  return v4;
}

- (uint64_t)fp_matchesFPFSURL:()FPAdditions
{
  if (!a3) {
    return 0;
  }
  v3 = objc_msgSend(a3, "fp_relativePathWithRealpath:", a1);
  uint64_t v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 hasPrefix:kFPPath_Library_Slash_CloudStorage_Slash];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)fp_matchesAlternateContentsURL:()FPAdditions
{
  uint64_t v4 = [a3 URLByAppendingPathComponent:@"Containers/Data/Application/" isDirectory:1];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "fp_relativePathWithRealpath:", a1);
    uint64_t v7 = [v6 rangeOfString:@"/"];
    BOOL v10 = 0;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = [v6 substringFromIndex:v7];
      char v9 = [v8 hasPrefix:@"/Library/Application Support/Collaboration/com.apple.iWork"];

      if (v9) {
        BOOL v10 = 1;
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)fp_shortDescription
{
  v1 = [a1 path];
  v2 = objc_msgSend(v1, "fp_prettyPath");

  return v2;
}

- (uint64_t)fp_checkSandboxFileMetadataRead
{
  pid_t v2 = getpid();
  int v3 = *MEMORY[0x1E4F14100] | 1;
  id v4 = [a1 path];
  int v5 = fpfs_lp_sandbox_check(v2, (uint64_t)"file-read-metadata", v3, (const char *)[v4 fileSystemRepresentation]);

  if (!v5) {
    return 1;
  }
  id v13 = 0;
  int v6 = [a1 checkResourceIsReachableAndReturnError:&v13];
  id v7 = v13;
  if (v6
    && (id v12 = 0, [a1 getResourceValue:&v12 forKey:*MEMORY[0x1E4F1C680] error:0])
    && [v12 BOOLValue])
  {
    id v8 = [a1 path];
    id v9 = [v8 stringByDeletingLastPathComponent];
    BOOL v10 = fpfs_lp_sandbox_check(v2, (uint64_t)"file-read-metadata", v3, (const char *)[v9 fileSystemRepresentation]) == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)fp_personaSharedDirectory
{
  uint64_t v0 = geteuid();
  if (v0)
  {
    v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_personaSharedDirectoryPathForUserID:", v0);
    if (v1)
    {
      pid_t v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v1 isDirectory:1];
    }
    else
    {
      pid_t v2 = 0;
    }
  }
  else
  {
    pid_t v2 = 0;
  }

  return v2;
}

+ (id)fp_personaSharedDirectoryPathForUserID:()FPAdditions
{
  if (fp_personaSharedDirectoryPathForUserID__once != -1) {
    dispatch_once(&fp_personaSharedDirectoryPathForUserID__once, &__block_literal_global_9);
  }
  id v4 = (id)fp_personaSharedDirectoryPathForUserID__pathByPersonaID;
  objc_sync_enter(v4);
  int v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  int v6 = [v5 currentPersona];

  uint64_t v7 = [v6 userPersonaUniqueString];
  id v8 = (void *)v7;
  id v9 = @"__FPDefaultPersona__";
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  BOOL v10 = v9;

  int v11 = [(id)fp_personaSharedDirectoryPathForUserID__pathByPersonaID objectForKeyedSubscript:v10];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    if ([v6 isEnterprisePersona])
    {
      if (fpfs_supports_sokoban()) {
        [(id)kFPGroupContainerIdentifier fileSystemRepresentation];
      }
      uint64_t v14 = container_create_or_lookup_path_for_current_user();
    }
    else
    {
      uint64_t v14 = (uint64_t)copyHomeDirectoryCompat(a3);
    }
    v15 = (void *)v14;
    if (v14)
    {
      id v13 = [NSString stringWithUTF8String:v14];
      free(v15);
      uint64_t v16 = fp_current_or_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        +[NSURL(FPAdditions) fp_personaSharedDirectoryPathForUserID:]();
      }

      [(id)fp_personaSharedDirectoryPathForUserID__pathByPersonaID setObject:v13 forKeyedSubscript:v10];
    }
    else
    {
      unsigned int v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[NSURL(FPAdditions) fp_personaSharedDirectoryPathForUserID:]();
      }

      id v13 = 0;
    }
  }

  objc_sync_exit(v4);

  return v13;
}

+ (id)fp_tempDirectoryForEnterprisePersona
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_personaSharedDirectory");
  v1 = [v0 URLByAppendingPathComponent:@"tmp/com.apple.fileproviderd"];

  pid_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = 0;
  char v3 = [v2 createDirectoryAtURL:v1 withIntermediateDirectories:1 attributes:0 error:&v7];
  id v4 = v7;

  if ((v3 & 1) == 0)
  {
    int v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[NSURL(FPAdditions) fp_tempDirectoryForEnterprisePersona]();
    }
  }

  return v1;
}

+ (id)fp_secureTempDirectory
{
  uint64_t v0 = [MEMORY[0x1E4FB36F8] sharedManager];
  v1 = [v0 currentPersona];

  if ([v1 isEnterprisePersona]) {
    objc_msgSend(MEMORY[0x1E4F1CB10], "fp_tempDirectoryForEnterprisePersona");
  }
  else {
  pid_t v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_secureTempDirectoryIgnoringPersona");
  }

  return v2;
}

+ (id)fp_secureTempDirectoryIgnoringPersona
{
  if (fp_secureTempDirectoryIgnoringPersona_once != -1) {
    dispatch_once(&fp_secureTempDirectoryIgnoringPersona_once, &__block_literal_global_40);
  }
  uint64_t v0 = (void *)fp_secureTempDirectoryIgnoringPersona_sandboxedTemporaryDirectory;

  return v0;
}

+ (id)fp_insecureTempDirectory
{
  uint64_t v0 = [MEMORY[0x1E4FB36F8] sharedManager];
  v1 = [v0 currentPersona];

  if ([v1 isEnterprisePersona]) {
    objc_msgSend(MEMORY[0x1E4F1CB10], "fp_tempDirectoryForEnterprisePersona");
  }
  else {
  pid_t v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_insecureTempDirectoryIgnoringPersona");
  }

  return v2;
}

+ (id)fp_insecureTempDirectoryIgnoringPersona
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_insecureTempDirectoryIgnoringPersonaString");
  pid_t v2 = [v0 fileURLWithPath:v1 isDirectory:1];

  return v2;
}

+ (id)fp_cloudStorageDirectory
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_personaSharedDirectory");
  v1 = [v0 URLByAppendingPathComponent:kFPPath_Library_Slash_CloudStorage_Slash];

  return v1;
}

+ (id)fp_supportDirectory
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_personaSharedDirectory");
  v1 = [v0 URLByAppendingPathComponent:@"Library/Application Support/FileProvider"];

  return v1;
}

+ (id)fp_backupManifestDirectory
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_supportDirectory");
  v1 = [v0 URLByAppendingPathComponent:@"backup" isDirectory:1];

  return v1;
}

+ (id)fp_supportDirectoryForVolume:()FPAdditions
{
  char v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a3;
  int v5 = objc_msgSend(v3, "fp_personaSharedDirectory");
  int v6 = objc_msgSend(v5, "fp_mountOnName");

  id v7 = objc_msgSend(v4, "fp_mountOnName");

  if (objc_msgSend(v6, "fp_relationshipToItemAtURL:", v7) == 1)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_supportDirectory");
  }
  else
  {
    id v9 = [(id)kFPPath_DotCloudStorage_Slash stringByAppendingPathComponent:@"System"];
    id v8 = [v7 URLByAppendingPathComponent:v9 isDirectory:1];
  }

  return v8;
}

- (id)fp_scopeDescription
{
  pid_t v2 = (void *)MEMORY[0x1A6247CA0]();
  char v3 = (void *)_CFURLPromiseCopyPhysicalURL();
  id v4 = v3;
  if (v3 && ([v3 isEqual:a1] & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1A6247CA0](v4);
    BOOL v10 = NSString;
    int v11 = objc_msgSend(a1, "fp_shortDescription");
    if (v2) {
      id v12 = @"s";
    }
    else {
      id v12 = @"n";
    }
    uint64_t v13 = [v4 lastPathComponent];
    uint64_t v14 = (void *)v13;
    if (v7) {
      v15 = @"s";
    }
    else {
      v15 = @"n";
    }
    id v9 = [v10 stringWithFormat:@"%@ (%@) -> %@ (%@)", v11, v12, v13, v15];
  }
  else
  {
    int v5 = NSString;
    uint64_t v6 = objc_msgSend(a1, "fp_shortDescription");
    id v7 = (void *)v6;
    id v8 = @"s";
    if (!v2) {
      id v8 = @"n";
    }
    id v9 = [v5 stringWithFormat:@"%@ (%@)", v6, v8];
  }

  return v9;
}

- (id)fp_relativePathOf:()FPAdditions
{
  id v4 = a3;
  int v5 = objc_msgSend(a1, "fp_realpathURL");
  uint64_t v6 = objc_msgSend(v4, "fp_realpathURL");

  id v7 = objc_msgSend(v5, "fp_relativePathWithRealpath:", v6);

  return v7;
}

- (uint64_t)fp_relationshipToItemAtURL:()FPAdditions
{
  return objc_msgSend(a1, "_fp_relationshipToItemAtURL:bothAreRealpaths:", a3, 0);
}

- (uint64_t)fp_realPathRelationshipToItemAtRealPathURL:()FPAdditions
{
  return objc_msgSend(a1, "_fp_relationshipToItemAtURL:bothAreRealpaths:", a3, 1);
}

- (uint64_t)_fp_relationshipToItemAtURL:()FPAdditions bothAreRealpaths:
{
  id v6 = a3;
  uint64_t v7 = 2;
  uint64_t v33 = 2;
  if (v6)
  {
    id v8 = objc_msgSend(a1, "fp_relativePathWithRealpath:", v6);
    if (v8)
    {
      id v9 = v8;
      uint64_t v7 = [v8 length] == 0;
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v10 = *MEMORY[0x1E4F1C820];
    [a1 removeCachedResourceValueForKey:*MEMORY[0x1E4F1C820]];
    uint64_t v11 = *MEMORY[0x1E4F1C628];
    [a1 removeCachedResourceValueForKey:*MEMORY[0x1E4F1C628]];
    [a1 removeCachedResourceValueForKey:*MEMORY[0x1E4F1C5A0]];
    [a1 removeCachedResourceValueForKey:*MEMORY[0x1E4F1C6A0]];
    [a1 removeCachedResourceValueForKey:*MEMORY[0x1E4F1C6F8]];
    id v31 = 0;
    id v32 = 0;
    int v12 = [a1 getResourceValue:&v32 forKey:v10 error:&v31];
    id v13 = v32;
    id v14 = v31;
    if (v12) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      id v17 = 0;
    }
    else
    {
      id v29 = 0;
      id v30 = 0;
      int v16 = [v6 getResourceValue:&v30 forKey:v10 error:&v29];
      id v17 = v30;
      id v18 = v29;

      if (v16 && v17 && [v13 isEqual:v17])
      {
        id v27 = 0;
        id v28 = 0;
        [a1 getResourceValue:&v28 forKey:v11 error:&v27];
        id v19 = v28;
        id v14 = v27;

        if ([v19 BOOLValue])
        {
          v20 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v26 = v14;
          char v21 = [v20 getRelationship:&v33 ofDirectoryAtURL:a1 toItemAtURL:v6 error:&v26];
          id v22 = v26;

          uint64_t v7 = v33;
          if (v21)
          {
            id v9 = 0;
            id v14 = v22;
LABEL_25:

            goto LABEL_26;
          }
          id v14 = v22;
        }
        else
        {
        }
      }
      else
      {
        id v14 = v18;
      }
    }
    if (a4)
    {
      id v9 = 0;
      uint64_t v7 = v33;
    }
    else
    {
      v23 = objc_msgSend(a1, "fp_realpathURL");
      v24 = objc_msgSend(v6, "fp_realpathURL");
      id v9 = objc_msgSend(v23, "fp_relativePathWithRealpath:", v24);
      if ([v9 isEqualToString:&stru_1EF68D1F8])
      {
        uint64_t v7 = 1;
        uint64_t v33 = 1;
      }
      else if (v9)
      {
        uint64_t v7 = 0;
        uint64_t v33 = 0;
      }
      else
      {
        uint64_t v7 = v33;
      }
    }
    goto LABEL_25;
  }
LABEL_27:

  return v7;
}

- (uint64_t)fp_isSymlink
{
  int v2 = [a1 startAccessingSecurityScopedResource];
  id v6 = 0;
  [a1 getResourceValue:&v6 forKey:*MEMORY[0x1E4F1C680] error:0];
  id v3 = v6;
  if (v2) {
    [a1 stopAccessingSecurityScopedResource];
  }
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

- (uint64_t)fp_isFolder
{
  int v2 = [a1 startAccessingSecurityScopedResource];
  id v16 = 0;
  uint64_t v3 = *MEMORY[0x1E4F1C628];
  id v15 = 0;
  char v4 = [a1 getResourceValue:&v16 forKey:v3 error:&v15];
  id v5 = v16;
  id v6 = v15;
  uint64_t v7 = v6;
  if ((v4 & 1) != 0
    || !objc_msgSend(v6, "fp_isCocoaErrorCode:", 258)
    || !fpfs_supports_long_paths())
  {
    if ([v5 BOOLValue])
    {
      id v14 = 0;
      [a1 getResourceValue:&v14 forKey:*MEMORY[0x1E4F1C658] error:0];
      id v12 = v14;
      if (v2) {
        [a1 stopAccessingSecurityScopedResource];
      }
      if (([v12 BOOLValue] & 1) == 0)
      {
        uint64_t v10 = [v5 BOOLValue];
        goto LABEL_18;
      }
    }
    else
    {
      if (v2) {
        [a1 stopAccessingSecurityScopedResource];
      }
      id v12 = 0;
    }
    uint64_t v10 = 0;
    goto LABEL_18;
  }
  id v8 = [a1 path];
  int v9 = fpfs_open_longpath((char *)[v8 fileSystemRepresentation], 1081344, 0);

  uint64_t v10 = v9 >= 0;
  if ((v9 & 0x80000000) == 0)
  {
    int v11 = *__error();
    close(v9);
    *__error() = v11;
  }
  if (v2) {
    [a1 stopAccessingSecurityScopedResource];
  }
  id v12 = 0;
LABEL_18:

  return v10;
}

- (uint64_t)fp_isPackage
{
  int v2 = [a1 startAccessingSecurityScopedResource];
  id v8 = 0;
  [a1 getResourceValue:&v8 forKey:*MEMORY[0x1E4F1C628] error:0];
  id v3 = v8;
  if ([v3 BOOLValue])
  {
    id v7 = 0;
    [a1 getResourceValue:&v7 forKey:*MEMORY[0x1E4F1C658] error:0];
    id v4 = v7;
    if (v2) {
      [a1 stopAccessingSecurityScopedResource];
    }
    if ([v4 BOOLValue]) {
      uint64_t v5 = [v3 BOOLValue];
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    if (v2) {
      [a1 stopAccessingSecurityScopedResource];
    }
    uint64_t v5 = 0;
    id v4 = 0;
  }

  return v5;
}

- (void)fp_hideExtension:()FPAdditions
{
  int v2 = objc_msgSend(NSNumber, "numberWithBool:");
  uint64_t v3 = *MEMORY[0x1E4F1C608];
  id v7 = 0;
  char v4 = [a1 setResourceValue:v2 forKey:v3 error:&v7];
  id v5 = v7;

  if ((v4 & 1) == 0)
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NSURL(FPAdditions) fp_hideExtension:]((uint64_t)a1, v5);
    }
  }
}

- (uint64_t)fp_removeFileProviderXattrsWithError:()FPAdditions
{
  id v4 = a1;
  int v5 = open((const char *)[v4 fileSystemRepresentation], 2097158);
  if (v5 < 0
    && (*__error() != 21
     || (int v5 = open((const char *)[v4 fileSystemRepresentation], 1048836), v5 < 0)))
  {
    uint64_t v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(FPAdditions) fp_removeFileProviderXattrsWithError:]((uint64_t)v4, v10);
    }
  }
  else
  {
    uint64_t v6 = 0;
    for (char i = 1; ; char i = 0)
    {
      char v8 = i;
      if (fremovexattr(v5, _fileprovider_xattrs[v6], 0) < 0 && *__error() != 93) {
        break;
      }
      uint64_t v6 = 1;
      if ((v8 & 1) == 0)
      {
        close(v5);
        return 1;
      }
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    close(v5);
  }
  return 0;
}

- (BOOL)fp_removeACLWithError:()FPAdditions
{
  uint64_t section = __fp_create_section();
  int v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[NSURL(FPAdditions) fp_removeACLWithError:](&section);
  }

  int v6 = fpfs_clear_file_acl((const char *)[a1 fileSystemRepresentation]);
  int v7 = v6;
  if (a3 && v6 < 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  __fp_leave_section_Debug((uint64_t)&section);
  return v7 >= 0;
}

- (uint64_t)fp_makeWritableWithError:()FPAdditions
{
  id v4 = a1;
  uint64_t v5 = open((const char *)[v4 fileSystemRepresentation], 33028);
  if ((v5 & 0x80000000) != 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    int v6 = v5;
    uint64_t v7 = objc_msgSend(v4, "fp_makeWritableOnFD:error:", v5, a3);
    close(v6);
    return v7;
  }
}

- (uint64_t)fp_makeWritableOnFD:()FPAdditions error:
{
  memset(&v12, 0, sizeof(v12));
  if (fstat(a3, &v12) < 0)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t result = 0;
      *a4 = v10;
      return result;
    }
    return 0;
  }
  if ((v12.st_mode & 0x80) == 0)
  {
    if (v12.st_mode) {
      mode_t v6 = v12.st_mode | 0x80;
    }
    else {
      mode_t v6 = 493;
    }
    if (fchmod(a3, v6) < 0)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      int v11 = fp_current_or_default_log();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(FPAdditions) fp_makeWritableOnFD:error:].cold.4();
    }
  }
  if (fp_makeWritableOnFD_error__onceToken != -1) {
    dispatch_once(&fp_makeWritableOnFD_error__onceToken, &__block_literal_global_67);
  }
  uint64_t result = 1;
  if (fp_makeWritableOnFD_error__mobile_uid
    && fp_makeWritableOnFD_error__mobile_gid
    && *(void *)&v12.st_uid != __PAIR64__(fp_makeWritableOnFD_error__mobile_gid, fp_makeWritableOnFD_error__mobile_uid))
  {
    if ((fchown(a3, fp_makeWritableOnFD_error__mobile_uid, fp_makeWritableOnFD_error__mobile_gid) & 0x80000000) == 0)
    {
      int v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[NSURL(FPAdditions) fp_makeWritableOnFD:error:]();
      }

      return 1;
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    int v11 = fp_current_or_default_log();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
LABEL_28:
    -[NSURL(FPAdditions) fp_makeWritableOnFD:error:]();
LABEL_29:

    return 0;
  }
  return result;
}

- (void)fp_makeWritableAndRemoveNonExportableAttributes
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] ┏%llx fp_makeWritableAndRemoveNonExportableAttributes item: %@", (void)v3, DWORD2(v3));
}

- (id)fp_addDocumentTrackingWithError:()FPAdditions
{
  id v4 = (const char *)[a1 fileSystemRepresentation];
  pid_t v5 = getpid();
  if (fpfs_lp_sandbox_check(v5, (uint64_t)"file-write-flags", *MEMORY[0x1E4F14100] | 1u, v4))
  {
    mode_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(FPAdditions) fp_addDocumentTrackingWithError:]();
    }

    uint64_t v7 = 0;
    int v8 = *__error();
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  int v9 = open(v4, 260);
  if (v9 < 0)
  {
    int v8 = *__error();
    if (v8 == 2)
    {
      uint64_t v7 = 0;
      int v8 = 2;
      if (!a3) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NSURL(FPAdditions) fp_addDocumentTrackingWithError:]();
    }

    uint64_t v7 = 0;
    if (a3)
    {
LABEL_20:
      if (!v7)
      {
        *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v8 userInfo:0];
      }
    }
  }
  else
  {
    int v10 = v9;
    uint64_t DocumentId = GSLibraryGetOrAllocateDocumentId();
    if (DocumentId)
    {
      uint64_t v7 = [NSNumber numberWithUnsignedInt:DocumentId];
      int v8 = 0;
    }
    else
    {
      int v8 = *__error();
      stat v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NSURL(FPAdditions) fp_addDocumentTrackingWithError:]();
      }

      uint64_t v7 = 0;
    }
    close(v10);
    if (a3) {
      goto LABEL_20;
    }
  }
LABEL_22:

  return v7;
}

- (uint64_t)fp_attachSecurityScopeFromURL:()FPAdditions
{
  if (MEMORY[0x1A6247CA0](a3)) {
    MEMORY[0x1A6247C60](a1);
  }

  return MEMORY[0x1F41817F8]();
}

- (BOOL)fp_associateThumbnailFromDocumentAtURL:()FPAdditions error:
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2050000000;
  uint64_t v7 = (void *)getGSStorageManagerClass_softClass;
  uint64_t v21 = getGSStorageManagerClass_softClass;
  if (!getGSStorageManagerClass_softClass)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getGSStorageManagerClass_block_invoke;
    v17[3] = &unk_1E5AF1950;
    v17[4] = &v18;
    __getGSStorageManagerClass_block_invoke((uint64_t)v17);
    uint64_t v7 = (void *)v19[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v18, 8);
  int v9 = [v8 manager];
  int v10 = [v9 isPermanentStorageSupportedAtURL:a1 error:0];

  if (v10)
  {
    int v11 = [a1 startAccessingSecurityScopedResource];
    int v12 = [v6 startAccessingSecurityScopedResource];
    id v16 = 0;
    [getQLThumbnailAdditionClass() associateThumbnailsForDocumentAtURL:v6 withDocumentAtURL:a1 error:&v16];
    id v13 = v16;
    if (v11)
    {
      [a1 stopAccessingSecurityScopedResource];
      if (!v12)
      {
LABEL_6:
        if (!a4)
        {
LABEL_8:
          BOOL v14 = v13 == 0;

          goto LABEL_15;
        }
LABEL_7:
        *a4 = v13;
        goto LABEL_8;
      }
    }
    else if (!v12)
    {
      goto LABEL_6;
    }
    [v6 stopAccessingSecurityScopedResource];
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (a4)
  {
    FPNotSupportedError();
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_15:

  return v14;
}

- (BOOL)fp_associateThumbnailToVersionAtURL:()FPAdditions thumbnailMetadata:error:
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = [a1 startAccessingSecurityScopedResource];
  int v11 = [v8 startAccessingSecurityScopedResource];
  id QLThumbnailAdditionClass = getQLThumbnailAdditionClass();
  uint64_t v18 = *MEMORY[0x1E4F1C500];
  v19[0] = v8;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v17 = 0;
  LODWORD(QLThumbnailAdditionClass) = [QLThumbnailAdditionClass associateThumbnailImagesDictionary:v13 serializedQuickLookMetadata:v9 withImmutableDocument:1 atURL:a1 error:&v17];

  id v14 = v17;
  if (QLThumbnailAdditionClass)
  {
    objc_msgSend(a1, "fp_hasThumbnailOnImmutableDocument");
    id v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(FPAdditions) fp_associateThumbnailToVersionAtURL:thumbnailMetadata:error:]();
    }

    if (!v10)
    {
LABEL_3:
      if (!v11) {
        goto LABEL_4;
      }
LABEL_11:
      [v8 stopAccessingSecurityScopedResource];
      if (!a5) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if (!v10)
  {
    goto LABEL_3;
  }
  [a1 stopAccessingSecurityScopedResource];
  if (v11) {
    goto LABEL_11;
  }
LABEL_4:
  if (a5) {
LABEL_5:
  }
    *a5 = v14;
LABEL_6:

  return v14 == 0;
}

- (uint64_t)fp_hasThumbnailOnImmutableDocument
{
  id QLThumbnailAdditionClass = getQLThumbnailAdditionClass();

  return [QLThumbnailAdditionClass hasThumbnailOnImmutableDocumentAtURL:a1];
}

- (id)fp_directorySizeWithError:()FPAdditions
{
  uint64_t v18 = 0;
  double Current = CFAbsoluteTimeGetCurrent();
  [a1 fileSystemRepresentation];
  int v6 = dirstat_np();
  if (CFAbsoluteTimeGetCurrent() - Current > 1.0)
  {
    fp_simulate_crash(@"dirstat took more than 1s to return", v7, v8, v9, v10, v11, v12, v13, 0);
    id v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[NSURL(FPAdditions) fp_directorySizeWithError:](v14);
    }
  }
  if (v6 < 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = 0;
      *a3 = v16;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = [NSNumber numberWithLongLong:v18];
  }

  return v15;
}

- (id)fp_uniqueTempFolderWithError:()FPAdditions
{
  pid_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 URLForDirectory:99 inDomain:1 appropriateForURL:a1 create:1 error:a3];

  if (v6)
  {
    uint64_t v7 = [v6 path];
    uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    uint64_t v10 = [v7 stringByAppendingPathComponent:v9];

    uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v12 = [v11 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:a3];
    uint64_t v13 = 0;
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:1];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)fp_moveToTempFolderWithFilename:()FPAdditions error:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(a1, "fp_uniqueTempFolderWithError:", a4);
  if (v7)
  {
    if (!v6)
    {
      id v6 = [a1 lastPathComponent];
    }
    uint64_t v8 = [v7 URLByAppendingPathComponent:v6];
    uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v10 = [v7 path];
    int v11 = [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:a4];

    id v12 = 0;
    if (v11)
    {
      if ([v9 moveItemAtURL:a1 toURL:v8 error:a4])
      {
        uint64_t v21 = *MEMORY[0x1E4F28370];
        v22[0] = *MEMORY[0x1E4F28358];
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
        id v14 = [v8 path];
        id v20 = 0;
        char v15 = [v9 setAttributes:v13 ofItemAtPath:v14 error:&v20];
        id v16 = v20;

        if ((v15 & 1) == 0)
        {
          id v17 = fp_current_or_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[NSURL(FPAdditions) fp_moveToTempFolderWithFilename:error:]();
          }
        }
        uint64_t v18 = v8;
      }
      else
      {
        uint64_t v18 = 0;
      }
      id v12 = v18;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (uint64_t)_fp_partOfAppInboxWithURLComponents:()FPAdditions
{
  id v3 = a3;
  if ((unint64_t)[v3 count] < 3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v4 = [v3 objectAtIndexedSubscript:1];
    if ([v4 isEqualToString:@"Documents"])
    {
      pid_t v5 = [v3 objectAtIndexedSubscript:2];
      uint64_t v6 = [v5 isEqualToString:@"Inbox"];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

- (uint64_t)fp_isAppInboxOrDescendants
{
  os_log_t v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
  id v3 = objc_msgSend(a1, "_fp_componentsRelativeToRoot:", v2);

  if (v3) {
    uint64_t v4 = objc_msgSend(a1, "_fp_partOfAppInboxWithURLComponents:", v3);
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)fp_fpfsRootURL
{
  os_log_t v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = objc_msgSend(v2, "fp_relativePathOf:", a1);
    id v5 = (id)kFPPath_Library_Slash_CloudStorage_Slash;
    if ([v4 hasPrefix:v5])
    {
      uint64_t v6 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v5, "length"));

      uint64_t v7 = [v6 pathComponents];
      if ((unint64_t)[v7 count] >= 2)
      {
        uint64_t v9 = [v3 URLByAppendingPathComponent:v5];
        uint64_t v10 = [v7 firstObject];
        uint64_t v8 = [v9 URLByAppendingPathComponent:v10];
      }
      else
      {
        uint64_t v8 = 0;
      }

      uint64_t v4 = v6;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)fp_isInSyncableRootFast
{
  os_log_t v2 = [a1 path];
  if ([v2 containsString:kFPPath_Library_Slash_CloudStorage_Slash])
  {
  }
  else
  {
    id v3 = [a1 path];
    int v4 = [v3 containsString:kFPPath_DotCloudStorage_Slash];

    if (!v4) {
      return 0;
    }
  }
  int v5 = getiopolicy_np(3, 1);
  setiopolicy_np(3, 1, 1);
  uint64_t v11 = 0;
  id v6 = a1;
  if ((fpfs_lp_fsctl((char *)[v6 fileSystemRepresentation], 0x40084A4AuLL, &v11, 1u) & 0x80000000) == 0)
  {
    if (v11)
    {
      BOOL v7 = 1;
      goto LABEL_16;
    }
    if ([v6 hasDirectoryPath])
    {
      int v10 = 0;
      BOOL v7 = (int)fpfs_lp_fsctl((char *)[v6 fileSystemRepresentation], 0x40044A48uLL, &v10, 1u) >= 0&& v10 != 0;
      goto LABEL_16;
    }
  }
  BOOL v7 = 0;
LABEL_16:
  if ((v5 & 0x80000000) == 0) {
    setiopolicy_np(3, 1, v5);
  }
  return v7;
}

- (uint64_t)fp_matchesUbiquitousHeuristics
{
  uint64_t v1 = objc_msgSend(a1, "fp_realpathURL");
  if (objc_msgSend(v1, "fp_isInSyncableRootFast"))
  {
    uint64_t v2 = MEMORY[0x1E4F1CC38];
  }
  else
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
    int v4 = objc_msgSend(v3, "fp_realpathURL");

    if (v4)
    {
      if ((objc_msgSend(v1, "fp_matchesApplicationContainerURL:", v4) & 1) != 0
        || (objc_msgSend(v1, "fp_matchesLiveFilesURL:", v4) & 1) != 0)
      {
        uint64_t v2 = MEMORY[0x1E4F1CC28];
      }
      else
      {
        char v6 = objc_msgSend(v1, "fp_matchesCloudDocsURL:", v4);
        uint64_t v2 = MEMORY[0x1E4F1CC38];
        if ((v6 & 1) == 0 && !objc_msgSend(v1, "fp_matchesFPFSURL:", v4)) {
          uint64_t v2 = 0;
        }
      }
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  return v2;
}

- (id)fp_commonDirectDescendantOf:()FPAdditions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && ([a1 path],
        int v5 = objc_claimAutoreleasedReturnValue(),
        [v4 path],
        char v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 hasPrefix:v6],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [a1 pathComponents];
    if ([v8 count])
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
      int v10 = [v8 objectAtIndexedSubscript:0];
      uint64_t v11 = [v9 URLWithString:v10];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v23 = v8;
      id v12 = objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        while (2)
        {
          uint64_t v16 = 0;
          id v17 = v11;
          do
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * v16);
            id v19 = [v4 path];
            id v20 = [v17 path];
            int v21 = [v19 hasPrefix:v20];

            if (!v21)
            {
              uint64_t v11 = v17;
              goto LABEL_15;
            }
            uint64_t v11 = [v17 URLByAppendingPathComponent:v18];

            ++v16;
            id v17 = v11;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      uint64_t v8 = v23;
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)fp_bouncedNameWithIndex:()FPAdditions
{
  int v5 = [a1 startAccessingSecurityScopedResource];
  uint64_t v6 = objc_msgSend(a1, "fp_isFolder");
  if (v5) {
    [a1 stopAccessingSecurityScopedResource];
  }
  int v7 = [a1 lastPathComponent];
  uint64_t v8 = objc_msgSend(v7, "fp_bouncedNameWithIndex:isDir:", a3, v6);

  return v8;
}

- (id)fp_volumeUUID
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v7[1] = 0;
  int v8 = 0;
  long long v5 = xmmword_1A34E47B0;
  uint64_t v6 = 0;
  id v1 = a1;
  if (getattrlist((const char *)objc_msgSend(v1, "fileSystemRepresentation", 5, 0x40000, 0), &v5, v7, 0x14uLL, 0) < 0)
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[NSURL(FPAdditions) fp_volumeUUID](v1);
    }

    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:(char *)v7 + 4];
  }

  return v2;
}

- (id)fp_mountOnName
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  bzero(v8, 0x40CuLL);
  long long v6 = xmmword_1A34E47C8;
  uint64_t v7 = 0;
  id v2 = a1;
  if (getattrlist((const char *)objc_msgSend(v2, "fileSystemRepresentation", 5, 2147487744, 0), &v6, v8, 0x40CuLL, 1u) < 0)
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[NSURL(FPAdditions) fp_mountOnName](v2);
    }
    id v4 = 0;
  }
  else
  {
    id v3 = [NSString stringWithUTF8String:(char *)v9 + v9[0]];
    id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  }

  return v4;
}

+ (id)fp_uncachedContainerURLForSecurityApplicationGroupIdentifier:()FPAdditions
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FB36F8] sharedManager];
  long long v5 = [v4 currentPersona];

  long long v6 = [MEMORY[0x1E4FB36F8] sharedManager];
  if (([v6 isSharedIPad] & 1) == 0) {
    [v5 isEnterprisePersona];
  }

  id v7 = [v5 userPersonaUniqueString];
  [v7 UTF8String];
  container_query_create();
  container_query_set_class();
  id v8 = v3;
  xpc_object_t v9 = xpc_string_create((const char *)[v8 UTF8String]);
  container_query_set_group_identifiers();

  container_query_set_transient();
  container_query_operation_set_flags();
  container_query_set_persona_unique_string();
  if (container_query_get_single_result())
  {
    uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:container_get_path() isDirectory:1 relativeToURL:0];
  }
  else
  {
    container_query_get_last_error();
    uint64_t v11 = (void *)container_error_copy_unlocalized_description();
    id v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[NSURL(FPAdditions) fp_uncachedContainerURLForSecurityApplicationGroupIdentifier:]();
    }

    free(v11);
    uint64_t v10 = 0;
  }
  container_query_free();

  return v10;
}

- (id)fp_resolveDetachedRootLogicalLocation:()FPAdditions error:
{
  if (a3) {
    *a3 = 0;
  }
  int v7 = getiopolicy_np(3, 1);
  if (v7 != 1) {
    setiopolicy_np(3, 1, 1);
  }
  id v8 = a1;
  int v9 = open((const char *)[v8 fileSystemRepresentation], 1081604);
  if ((v9 & 0x80000000) == 0)
  {
    int v10 = v9;
    id v11 = v8;
    unint64_t v12 = fgetxattr(v10, "com.apple.fileprovider.detached#B", 0, 0, 0, 0);
    if ((v12 & 0x8000000000000000) != 0)
    {
      if (a4)
      {
        id v17 = FPNotSupportedError();
LABEL_25:
        int v21 = 0;
        *a4 = v17;
LABEL_27:

        close(v10);
        if (!v21)
        {
          uint64_t v16 = 0;
LABEL_50:

          goto LABEL_51;
        }
        id v22 = v11;
        v23 = [MEMORY[0x1E4F28F98] propertyListWithData:v21 options:0 format:0 error:a4];
        if (!v23) {
          goto LABEL_37;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v24 = v23;
          long long v25 = [v24 objectForKeyedSubscript:@"name"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v26 = [v24 objectForKeyedSubscript:@"parentBookmark"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v27 = [MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v26 options:536871424 relativeToURL:0 bookmarkDataIsStale:0 error:a4];
              id v28 = v27;
              if (v27)
              {
                uint64_t v16 = [v27 URLByAppendingPathComponent:v25 isDirectory:1];
              }
              else
              {
                uint64_t v16 = 0;
              }
            }
            else if (a4)
            {
              objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:itemURL:debugDescription:", 22, v22, @"parentBookmark is not a data blob");
              uint64_t v16 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v16 = 0;
            }
          }
          else if (a4)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:itemURL:debugDescription:", 22, v22, @"name is not a string");
            uint64_t v16 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v16 = 0;
          }

          goto LABEL_49;
        }
        if (a4)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:itemURL:debugDescription:", 22, v22, @"bookmark is not encoding a dictionary");
          uint64_t v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_37:
          uint64_t v16 = 0;
        }
LABEL_49:

        goto LABEL_50;
      }
    }
    else
    {
      int64_t v13 = v12;
      if (a3) {
        *a3 = 1;
      }
      if (v12 <= 0x100000)
      {
        uint64_t v18 = malloc_type_malloc(v12, 0xF75B909FuLL);
        if (v18)
        {
          id v19 = v18;
          ssize_t v20 = fgetxattr(v10, "com.apple.fileprovider.detached#B", v18, v13, 0, 0);
          if (v20 <= v13)
          {
            int v21 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v19 length:v20 freeWhenDone:1];
            goto LABEL_27;
          }
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:itemURL:debugDescription:", 12, v11, @"xattr is too large for the allocated buffer");
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          free(v19);
        }
        else if (a4)
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v15 = @"cannot allocate buffer";
          goto LABEL_24;
        }
      }
      else if (a4)
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = @"detach root xattr is too large";
LABEL_24:
        id v17 = objc_msgSend(v14, "fp_errorWithPOSIXCode:itemURL:debugDescription:", 12, v11, v15);
        goto LABEL_25;
      }
    }
    int v21 = 0;
    goto LABEL_27;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:itemURL:debugDescription:", *__error(), v8, @"item doesn't exist or is not a directory");
    uint64_t v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_51:
  if (v7 != 1) {
    setiopolicy_np(3, 1, v7);
  }

  return v16;
}

+ (void)fp_personaSharedDirectoryPathForUserID:()FPAdditions .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, v0, v1, "[ERROR] couldn't resolve shared directory for persona %@", v2, v3, v4, v5, v6);
}

+ (void)fp_personaSharedDirectoryPathForUserID:()FPAdditions .cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] resolved shared directory for persona %@: %@");
}

+ (void)fp_tempDirectoryForEnterprisePersona
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, v0, v1, "[ERROR] Error creating secure temp directory for enterprise persona: %@", v2, v3, v4, v5, v6);
}

- (void)fp_hideExtension:()FPAdditions .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] Failed to set HasHiddenExtension property for %@: %@", v5, v6, v7, v8, v9);
}

- (void)fp_removeFileProviderXattrsWithError:()FPAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
  OUTLINED_FUNCTION_15_0();
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] failed to open %@, error %@", v4, 0x16u);
}

- (void)fp_removeACLWithError:()FPAdditions .cold.1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG] ┏%llx remove item ACLs: %@", (void)v3, DWORD2(v3));
}

- (void)fp_makeWritableOnFD:()FPAdditions error:.cold.1()
{
  __error();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1A33AE000, v0, v1, "[ERROR] couldn't set permissions on %@; %{errno}d",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)fp_makeWritableOnFD:()FPAdditions error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] fixed up ownership on %@", v2, v3, v4, v5, v6);
}

- (void)fp_makeWritableOnFD:()FPAdditions error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] fixed up permissions on %@", v2, v3, v4, v5, v6);
}

- (void)fp_addDocumentTrackingWithError:()FPAdditions .cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_1A33AE000, v1, OS_LOG_TYPE_ERROR, "[ERROR] open failed at \"%s\", errno:%{errno}d", v2, 0x12u);
}

- (void)fp_addDocumentTrackingWithError:()FPAdditions .cold.2()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_6_2(&dword_1A33AE000, v0, v1, "[ERROR] GSLibraryGetOrAllocateDocumentId failed, errno:%{errno}d", v2, v3, v4, v5, v6);
}

- (void)fp_addDocumentTrackingWithError:()FPAdditions .cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] sandbox_check for \"file-write-flags\" failed at \"%s\"", v2, v3, v4, v5, v6);
}

- (void)fp_associateThumbnailToVersionAtURL:()FPAdditions thumbnailMetadata:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_1A33AE000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] verify thumbnail exist on = %@: %{BOOL}d", v2, 0x12u);
}

- (void)fp_directorySizeWithError:()FPAdditions .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1A33AE000, log, OS_LOG_TYPE_FAULT, "[SIMCRASH] dirstat took more than 1s to return", v1, 2u);
}

- (void)fp_moveToTempFolderWithFilename:()FPAdditions error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, v0, v1, "[ERROR] couldn't set protection level on file to be imported %@", v2, v3, v4, v5, v6);
}

- (void)fp_matchesFileProviderHeuristics:()FPAdditions .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  __error();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1A33AE000, v2, v3, "[ERROR] getattrlist(%@) = %d", v4, v5, v6, v7, v8);
}

- (void)fp_volumeUUID
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] Unable to get file system attributes for volume path %{public}@: %{public}s", v5, v6, v7, v8, 2u);
}

- (void)fp_mountOnName
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  __error();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_1A33AE000, v2, v3, "[ERROR] Unable to getattrlist path %{public}@: %{errno}d", v4, v5, v6, v7, v8);
}

+ (void)fp_uncachedContainerURLForSecurityApplicationGroupIdentifier:()FPAdditions .cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A33AE000, v1, OS_LOG_TYPE_ERROR, "[ERROR] Error fetching group container for %@: %s", v2, 0x16u);
}

@end