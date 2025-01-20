@interface FPDVolume
+ (BOOL)getProviderDomainID:(id)a3 location:(unsigned int)a4 foundDomainID:(id *)a5 error:(id *)a6;
+ (id)prettyNameForDomain:(id)a3;
+ (id)prettyNameForNsDomain:(id)a3 provider:(id)a4;
+ (int)_getProviderDomainIDFromFD:(int)a3 shortDescription:(id)a4 location:(unsigned int)a5 domainID:(id *)a6 error:(id *)a7;
+ (unsigned)volumeRoleForStatFS:(const statfs *)a3;
- (BOOL)_computeKnownPathsForRole:(unsigned int)a3;
- (BOOL)_hasCloudStorageDirAtRoot;
- (BOOL)isDefaultVolume;
- (BOOL)isDefaultVolumeForCurrentPersona;
- (BOOL)isInLowDiskSpaceState;
- (BOOL)isLibraryConfigured;
- (BOOL)monitorLowDiskSpaceRecovery;
- (BOOL)writeDomainsProperties:(id)a3 underDirectoryAtURL:(id)a4 error:(id *)a5;
- (FPDVolume)initWithStatFS:(const statfs *)a3 knownRole:(unsigned int)a4 volumeManager:(id)a5;
- (FPDVolumeManager)volumeManager;
- (NSString)root;
- (NSURL)purgatoryDirectory;
- (NSURL)rootURL;
- (NSURL)syncRootsDirectory;
- (NSURL)systemDirectory;
- (NSUUID)uuid;
- (id)_findDomainDirectory:(id)a3 location:(unsigned int)a4 error:(id *)a5;
- (id)_subAppSupportPathForDomain:(id)a3 fileName:(id)a4 error:(id *)a5;
- (id)description;
- (id)findProviderDomainDirectory:(id)a3 location:(unsigned int)a4 error:(id *)a5;
- (id)readDomainsPropertiesUnderDirectoryAtURL:(id)a3 error:(id *)a4;
- (id)removedURL;
- (id)rootURLForLocation:(unsigned int)a3 error:(id *)a4;
- (id)stateDirectoryURL:(id)a3 error:(id *)a4;
- (id)supportPathForDomain:(id)a3 failIfNotExisting:(BOOL)a4 error:(id *)a5;
- (id)temporaryDirectoryURL:(id)a3 error:(id *)a4;
- (int)dev;
- (int64_t)currentAvailableDiskSpace;
- (int64_t)requiredDiskSpaceThreshold;
- (unsigned)role;
- (void)currentAvailableDiskSpace;
- (void)isInLowDiskSpaceState;
- (void)monitorLowDiskSpaceRecoveryForConcreteError:(id)a3;
- (void)removeBrokenEbihilLinksFromRoot;
@end

@implementation FPDVolume

- (unsigned)role
{
  return self->_role;
}

- (BOOL)writeDomainsProperties:(id)a3 underDirectoryAtURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:a5];
  if (v8)
  {
    v9 = [v7 URLByAppendingPathComponent:@"Domains.plist"];
    char v10 = [v8 writeToURL:v9 options:1 error:a5];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSURL)systemDirectory
{
  return self->_systemDirectory;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t role = (int)self->_role;
  if (role > 3) {
    id v7 = @"unknown";
  }
  else {
    id v7 = off_1E6A743B8[role];
  }
  uint64_t dev = self->_dev;
  v9 = [(NSUUID *)self->_uuid fp_UUID];
  char v10 = [(NSString *)self->_root fp_prettyPath];
  v11 = [v3 stringWithFormat:@"<%@:%p role:%@ dev:%d uuid:%@ '%@'>", v5, self, v7, dev, v9, v10];

  return v11;
}

- (BOOL)isDefaultVolumeForCurrentPersona
{
  v3 = [MEMORY[0x1E4FB36F8] sharedManager];
  v4 = [v3 currentPersona];

  if ([v4 isEnterprisePersona]) {
    int v5 = 2;
  }
  else {
    int v5 = 1;
  }
  BOOL v6 = self->_role == v5;

  return v6;
}

- (FPDVolume)initWithStatFS:(const statfs *)a3 knownRole:(unsigned int)a4 volumeManager:(id)a5
{
  uint64_t role = *(void *)&a4;
  id v8 = a5;
  v24.receiver = self;
  v24.super_class = (Class)FPDVolume;
  v9 = [(FPDVolume *)&v24 init];
  if (v9)
  {
    char v10 = 0;
    if (FPVolumeFPFSSupported())
    {
      v9->_uint64_t dev = a3->f_fsid.val[0];
      uint64_t v11 = [NSString stringWithUTF8String:a3->f_mntonname];
      root = v9->_root;
      v9->_root = (NSString *)v11;

      v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9->_root isDirectory:1];
      uint64_t v14 = objc_msgSend(v13, "fp_volumeUUID");
      uuid = v9->_uuid;
      v9->_uuid = (NSUUID *)v14;

      objc_storeWeak((id *)&v9->_volumeManager, v8);
      v16 = NSString;
      v17 = [(NSString *)v9->_root fp_prettyPath];
      id v18 = [v16 stringWithFormat:@"serial queue for %@", v17];
      v19 = (const char *)[v18 UTF8String];
      v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v21 = dispatch_queue_create(v19, v20);
      serialQueue = v9->_serialQueue;
      v9->_serialQueue = (OS_dispatch_queue *)v21;

      v9->_uint64_t role = role;
      char v10 = 0;
      switch((int)role)
      {
        case 0:
          break;
        case 1:
          uint64_t role = 1;
          v9->_isLibraryConfigured = 1;
          goto LABEL_7;
        case 2:
          v9->_isLibraryConfigured = 1;
          uint64_t role = 2;
          goto LABEL_7;
        case 3:
          v9->_isLibraryConfigured = [(FPDVolume *)v9 _hasCloudStorageDirAtRoot];
          uint64_t role = v9->_role;
          goto LABEL_7;
        default:
LABEL_7:
          if ([(FPDVolume *)v9 _computeKnownPathsForRole:role]) {
            goto LABEL_8;
          }
          char v10 = 0;
          break;
      }
    }
  }
  else
  {
LABEL_8:
    char v10 = v9;
  }

  return v10;
}

+ (unsigned)volumeRoleForStatFS:(const statfs *)a3
{
  if (!APFSVolumeRole()) {
    return 3;
  }
  v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    +[FPDVolume volumeRoleForStatFS:]();
  }

  return 0;
}

- (BOOL)_hasCloudStorageDirAtRoot
{
  id v2 = [(NSString *)self->_root stringByAppendingPathComponent:@".CloudStorage"];
  BOOL v3 = faccessat(-2, (const char *)[v2 fileSystemRepresentation], 0, 32) == 0;

  return v3;
}

- (BOOL)_computeKnownPathsForRole:(unsigned int)a3
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  if (a3 - 1 > 1)
  {
    id v7 = (void *)MEMORY[0x1E4F1CB10];
    id v8 = [(NSString *)self->_root stringByAppendingPathComponent:@".CloudStorage/System"];
    v9 = [v7 fileURLWithPath:v8 isDirectory:1];
    systemDirectory = self->_systemDirectory;
    self->_systemDirectory = v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CB10];
    v12 = [(NSString *)self->_root stringByAppendingPathComponent:@".CloudStorage/Data"];
    v13 = [v11 fileURLWithPath:v12 isDirectory:1];
    syncRootsDirectory = self->_syncRootsDirectory;
    self->_syncRootsDirectory = v13;
LABEL_9:

    BOOL v18 = *((unsigned char *)v22 + 24) != 0;
    goto LABEL_10;
  }
  int v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  [v5 personaGenerationIdentifierWithError:0];

  if (a3 == 2) {
    [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:2];
  }
  else {
  BOOL v6 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  }
  v15 = [v6 userPersonaUniqueString];

  if (v15
    || ([MEMORY[0x1E4FB36F8] sharedManager],
        v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v16 isSharedIPad],
        v16,
        (v17 & 1) != 0))
  {
    v12 = v15;
    FPPerformWithPersona();
    syncRootsDirectory = v12;
    goto LABEL_9;
  }
  v20 = fp_current_or_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[FPDVolume _computeKnownPathsForRole:](a3, v20);
  }

  BOOL v18 = 0;
LABEL_10:
  _Block_object_dispose(&v21, 8);
  return v18;
}

void __39__FPDVolume__computeKnownPathsForRole___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    v4 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v5 = [v4 personaGenerationIdentifierWithError:0];

    if (v5 == *(void *)(a1 + 56))
    {
      BOOL v6 = [NSString stringWithFormat:@"Failed to adopt persona %@ for role %d\nError: %@", *(void *)(a1 + 32), *(unsigned int *)(a1 + 64), v3];
      id v7 = objc_opt_new();
      [v7 requestTapToRadarWithTitle:@"Failed to adopt persona" description:v6 keywords:MEMORY[0x1E4F1CBF0] attachments:MEMORY[0x1E4F1CBF0] displayReason:@"a problem bringing up a domain occured"];
    }
    else
    {
      uint64_t v14 = fp_current_or_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __39__FPDVolume__computeKnownPathsForRole___block_invoke_cold_1(a1, v14);
      }
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_supportDirectory");
    uint64_t v9 = *(void *)(a1 + 40);
    char v10 = *(void **)(v9 + 72);
    *(void *)(v9 + 72) = v8;

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_cloudStorageDirectory");
    uint64_t v12 = *(void *)(a1 + 40);
    v13 = *(void **)(v12 + 80);
    *(void *)(v12 + 80) = v11;
  }
}

- (id)rootURLForLocation:(unsigned int)a3 error:(id *)a4
{
  if (a3 > 2)
  {
    id v5 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    id v5 = *(id *)((char *)&self->super.isa + qword_1D75245C0[a3]);
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", 2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  return v5;
}

+ (int)_getProviderDomainIDFromFD:(int)a3 shortDescription:(id)a4 location:(unsigned int)a5 domainID:(id *)a6 error:(id *)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  uint64_t v12 = "com.apple.file-provider-domain-id";
  ssize_t v13 = fgetxattr(a3, "com.apple.file-provider-domain-id", 0, 0, 0, 0);
  ssize_t v14 = v13;
  if (v13 != -1)
  {
    size_t v15 = v13;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (*__error() != 93
    || (uint64_t v12 = "com.apple.file-provider-domain-id#PN",
        ssize_t v21 = fgetxattr(a3, "com.apple.file-provider-domain-id#PN", 0, 0, 0, 0),
        v21 == -1))
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *__error();
    char v24 = v22;
LABEL_17:
    objc_msgSend(v24, "fp_errorWithPOSIXCode:", v23, *(void *)v28);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    int v17 = -1;
    goto LABEL_26;
  }
  size_t v15 = v21;
  if (a5)
  {
LABEL_3:
    v28[0] = 0;
    fpfs_is_detached_root();
    BOOL v16 = a5 == 2;
    int v17 = -1;
    if (v16) {
      goto LABEL_26;
    }
  }
LABEL_4:
  BOOL v18 = malloc_type_malloc(v15 + 1, 0x3CFBE061uLL);
  if (!v18)
  {
    char v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = 12;
    goto LABEL_17;
  }
  v19 = v18;
  if (fgetxattr(a3, v12, v18, v15, 0, 0) < 1)
  {
    v25 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
    a6 = a7;
    goto LABEL_23;
  }
  v19[v15] = 0;
  if (v14 == -1)
  {
    if (fsetxattr(a3, "com.apple.file-provider-domain-id", v19, v15, 0, 0) < 0)
    {
      v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
LABEL_20:
        int v26 = *__error();
        *(_DWORD *)v28 = 138412546;
        *(void *)&v28[4] = v11;
        *(_WORD *)&v28[12] = 1024;
        *(_DWORD *)&v28[14] = v26;
        _os_log_impl(&dword_1D744C000, v20, OS_LOG_TYPE_INFO, "[INFO] couldn't upgrade domain xattr on %@: %d", v28, 0x12u);
      }
LABEL_21:

      goto LABEL_22;
    }
    if (fremovexattr(a3, "com.apple.file-provider-domain-id#PN", 0) < 0)
    {
      v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      goto LABEL_21;
    }
  }
LABEL_22:
  v25 = objc_msgSend(NSString, "stringWithUTF8String:", v19, *(_OWORD *)v28, *(void *)&v28[16], v29);
LABEL_23:
  *a6 = v25;
  free(v19);
  if (*a7) {
    int v17 = -1;
  }
  else {
    int v17 = 0;
  }
LABEL_26:

  return v17;
}

+ (BOOL)getProviderDomainID:(id)a3 location:(unsigned int)a4 foundDomainID:(id *)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  int v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  id v8 = a3;
  [v8 fileSystemRepresentation];
  id v9 = v8;
  if ((fpfs_openat() & 0x80000000) != 0 && v17[5])
  {
    id v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_msgSend(v9, "fp_shortDescription");
      ssize_t v13 = objc_msgSend((id)v17[5], "fp_prettyDescription");
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v12;
      __int16 v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_1D744C000, v11, OS_LOG_TYPE_INFO, "[INFO] couldn't retrieve provider domainID from %@: %@", buf, 0x16u);
    }
    if ((objc_msgSend((id)v17[5], "fp_isPOSIXErrorCode:", 2) & 1) != 0
      || (objc_msgSend((id)v17[5], "fp_isPOSIXErrorCode:", 20) & 1) != 0
      || (objc_msgSend((id)v17[5], "fp_isPOSIXErrorCode:", 13) & 1) != 0
      || objc_msgSend((id)v17[5], "fp_isPOSIXErrorCode:", 93))
    {
      ssize_t v14 = (id *)(v23 + 5);
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
      if (!a6) {
        goto LABEL_12;
      }
      ssize_t v14 = (id *)(v17 + 5);
      a5 = a6;
    }
    *a5 = *v14;
LABEL_12:

    goto LABEL_13;
  }

  *a5 = (id) v23[5];
  BOOL v10 = 1;
LABEL_13:
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

uint64_t __62__FPDVolume_getProviderDomainID_location_foundDomainID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 56);
  id v5 = objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  uint64_t v8 = *(unsigned int *)(a1 + 64);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(id *)(v9 + 40);
  id obj = v7;
  uint64_t v10 = [v4 _getProviderDomainIDFromFD:a2 shortDescription:v5 location:v8 domainID:&obj error:&v12];
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v9 + 40), v12);

  return v10;
}

- (id)_findDomainDirectory:(id)a3 location:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  uint64_t v8 = [(FPDVolume *)self rootURLForLocation:v6 error:a5];
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = [v8 path];
  id v31 = 0;
  id v11 = [v9 contentsOfDirectoryAtPath:v10 error:&v31];
  id v12 = v31;

  if (v11)
  {
    uint64_t v23 = v11;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v11;
    uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(obj);
          }
          int v17 = [v8 URLByAppendingPathComponent:*(void *)(*((void *)&v27 + 1) + 8 * i) isDirectory:1];
          id v26 = 0;
          BOOL v18 = +[FPDVolume getProviderDomainID:v17 location:v6 foundDomainID:&v26 error:a5];
          id v19 = v26;
          v20 = v19;
          if (v18 && ([v19 isEqualToString:v25] & 1) != 0)
          {

            goto LABEL_15;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    int v17 = 0;
LABEL_15:
    id v11 = v23;
  }
  else if (objc_msgSend(v12, "fp_isCocoaErrorCode:", 4))
  {
    int v17 = 0;
  }
  else
  {
    char v22 = objc_msgSend(v12, "fp_isCocoaErrorCode:", 260);
    int v17 = 0;
    if (a5 && (v22 & 1) == 0)
    {
      int v17 = 0;
      *a5 = v12;
    }
  }

  return v17;
}

+ (id)prettyNameForNsDomain:(id)a3 provider:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 displayName];
  id v7 = [v5 descriptor];

  uint64_t v8 = [v7 localizedName];

  if ([v6 isEqualToString:&stru_1F2EC3618])
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [NSString stringWithFormat:@"%@ - %@", v8, v6];
  }
  uint64_t v10 = v9;

  id v11 = [v10 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F2EC3618];

  id v12 = [v11 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

  return v12;
}

+ (id)prettyNameForDomain:(id)a3
{
  id v4 = a3;
  id v5 = [v4 nsDomain];

  if (v5)
  {
    uint64_t v6 = [v4 provider];

    if (!v6)
    {
      id v11 = [NSString stringWithFormat:@"[ASSERT] ‼️ no provider for %@", v4];
      id v12 = fp_current_or_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        +[FPDVolume prettyNameForDomain:]();
      }

      __assert_rtn("+[FPDVolume prettyNameForDomain:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDVolume.m", 357, (const char *)[v11 UTF8String]);
    }
    id v7 = [v4 nsDomain];
    uint64_t v8 = [v4 provider];
    id v9 = [a1 prettyNameForNsDomain:v7 provider:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)findProviderDomainDirectory:(id)a3 location:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = [v8 providerDomainID];
  uint64_t v10 = [(FPDVolume *)self _findDomainDirectory:v9 location:v6 error:a5];

  if (v10)
  {
    id v11 = v10;
  }
  else
  {
    id v12 = [(FPDVolume *)self rootURLForLocation:v6 error:a5];
    uint64_t v13 = [v8 providerDomainID];
    uint64_t v14 = [(FPDVolume *)self _findDomainDirectory:v13 location:v6 == 0 error:a5];

    if (v14)
    {
      uint64_t v15 = [v14 lastPathComponent];
      id v11 = [v12 URLByAppendingPathComponent:v15 isDirectory:1];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v16 = [v15 UUIDString];
      id v11 = [v12 URLByAppendingPathComponent:v16 isDirectory:1];
    }
  }

  return v11;
}

- (id)supportPathForDomain:(id)a3 failIfNotExisting:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = (void *)MEMORY[0x1E4F28CB8];
  id v9 = a3;
  uint64_t v10 = [v8 defaultManager];
  id v11 = [(FPDVolume *)self findProviderDomainDirectory:v9 location:0 error:a5];

  if (v6
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [v11 path],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v12 fileExistsAtPath:v13],
        v13,
        v12,
        !v14))
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
      id v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = v11;
  }

  return v15;
}

- (id)_subAppSupportPathForDomain:(id)a3 fileName:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(FPDVolume *)self supportPathForDomain:a3 failIfNotExisting:0 error:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = [v9 URLByAppendingPathComponent:v8 isDirectory:1];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)stateDirectoryURL:(id)a3 error:(id *)a4
{
  return [(FPDVolume *)self _subAppSupportPathForDomain:a3 fileName:@"state" error:a4];
}

- (id)temporaryDirectoryURL:(id)a3 error:(id *)a4
{
  return [(FPDVolume *)self _subAppSupportPathForDomain:a3 fileName:@"tmp" error:a4];
}

- (NSURL)purgatoryDirectory
{
  id v2 = [(FPDVolume *)self systemDirectory];
  id v3 = [v2 URLByAppendingPathComponent:@"Purgatory" isDirectory:1];

  return (NSURL *)v3;
}

- (id)removedURL
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(FPDVolume *)self purgatoryDirectory];
  id v5 = [v4 path];
  objc_msgSend(v3, "fp_createPathIfNeeded:", v5);

  BOOL v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = [v6 UUIDString];
  id v8 = [@"removed_domain_" stringByAppendingString:v7];

  id v9 = [(FPDVolume *)self purgatoryDirectory];
  uint64_t v10 = [v9 URLByAppendingPathComponent:v8 isDirectory:1];

  return v10;
}

- (NSURL)rootURL
{
  return (NSURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:self->_root isDirectory:1];
}

- (int64_t)requiredDiskSpaceThreshold
{
  requiredDiskSpaceThresholdOverride = self->_requiredDiskSpaceThresholdOverride;
  if (requiredDiskSpaceThresholdOverride)
  {
    return [(NSNumber *)requiredDiskSpaceThresholdOverride longLongValue];
  }
  else
  {
    if (os_variant_has_internal_content())
    {
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
      id v5 = [v4 objectForKey:@"low-disk-threshold"];

      if (v5)
      {
        int64_t v6 = [v4 integerForKey:@"low-disk-threshold"];

        return v6;
      }
    }
    return 104857600;
  }
}

- (void)monitorLowDiskSpaceRecoveryForConcreteError:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(FPDVolume *)self currentAvailableDiskSpace];
  if (v5 < 0)
  {
    uint64_t v10 = [NSString stringWithFormat:@"[diskspace] low disk space detected through error, setting up fallback could not determine available disk space. Exiting."];
    id v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDVolume monitorLowDiskSpaceRecoveryForConcreteError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDVolume.m", 529, (const char *)[v10 UTF8String]);
  }
  int64_t v6 = [NSNumber numberWithLongLong:v5 + 209715200];
  requiredDiskSpaceThresholdOverride = self->_requiredDiskSpaceThresholdOverride;
  self->_requiredDiskSpaceThresholdOverride = v6;

  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(FPDVolume *)(uint64_t)v4 monitorLowDiskSpaceRecoveryForConcreteError:v8];
  }

  [(FPDVolume *)self monitorLowDiskSpaceRecovery];
  id v9 = self;
  objc_sync_enter(v9);
  if (!v9->_diskSpaceRecoveryTimer)
  {
    id v12 = [NSString stringWithFormat:@"[diskspace] low disk space detected through an error, setting up fallback failed. Exiting."];
    uint64_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDVolume monitorLowDiskSpaceRecoveryForConcreteError:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDVolume.m", 538, (const char *)[v12 UTF8String]);
  }
  objc_sync_exit(v9);
}

- (int64_t)currentAvailableDiskSpace
{
  v4[271] = *MEMORY[0x1E4F143B8];
  bzero(v4, 0x878uLL);
  if ((FPStatFSFromPath() & 0x80000000) == 0) {
    return FPFileSystemFreeBytes();
  }
  id v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[FPDVolume currentAvailableDiskSpace](v3);
  }

  return -1;
}

- (BOOL)isInLowDiskSpaceState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(FPDVolume *)self currentAvailableDiskSpace];
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(FPDVolume *)(uint64_t)self isInLowDiskSpaceState];
  }

  if (v3 < 0)
  {
    int64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(FPDVolume *)(uint64_t)self isInLowDiskSpaceState];
    }
  }
  else
  {
    if (v3 < [(FPDVolume *)self requiredDiskSpaceThreshold])
    {
      int64_t v5 = fp_current_or_default_log();
      BOOL v6 = 1;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v7 = [(NSString *)self->_root fp_prettyPath];
        int v10 = 138412546;
        id v11 = v7;
        __int16 v12 = 2048;
        uint64_t v13 = v3;
        _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_INFO, "[INFO] [diskspace] (%@) In low disk space: %lld bytes", (uint8_t *)&v10, 0x16u);
      }
      goto LABEL_10;
    }
    if (!os_variant_has_internal_content()) {
      return 0;
    }
    int64_t v5 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
    if (![v5 BOOLForKey:@"force-low-disk-state"])
    {
      BOOL v6 = 0;
      goto LABEL_10;
    }
    id v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FPDVolume isInLowDiskSpaceState](v9);
    }
  }
  BOOL v6 = 1;
LABEL_10:

  return v6;
}

- (BOOL)monitorLowDiskSpaceRecovery
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(FPDVolume *)v2 isInLowDiskSpaceState];
  if (v3 && !v2->_diskSpaceRecoveryTimer)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] [diskspace] Setting up to monitor low disk space recovery.", buf, 2u);
    }

    int64_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v2->_serialQueue);
    dispatch_time_t v6 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v5, v6, 0xDF8475800uLL, 0x165A0BC00uLL);
    dispatch_set_qos_class_fallback();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__FPDVolume_monitorLowDiskSpaceRecovery__block_invoke;
    block[3] = &unk_1E6A73FE8;
    block[4] = v2;
    id v7 = v5;
    dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v7, v8);

    dispatch_resume(v7);
    diskSpaceRecoveryTimer = v2->_diskSpaceRecoveryTimer;
    v2->_diskSpaceRecoveryTimer = (OS_dispatch_source *)v7;
    int v10 = v7;
  }
  objc_sync_exit(v2);

  return v3;
}

uint64_t __40__FPDVolume_monitorLowDiskSpaceRecovery__block_invoke(uint64_t a1)
{
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D744C000, v2, OS_LOG_TYPE_DEFAULT, "[NOTICE] [diskspace] Trying to recover from disconnect due to low disk space.", buf, 2u);
  }

  uint64_t result = [*(id *)(a1 + 32) isInLowDiskSpaceState];
  if ((result & 1) == 0)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v5 = 0;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] [diskspace] Disk space now available, restarting fileproviderd", v5, 2u);
    }

    _Exit(0);
  }
  return result;
}

- (BOOL)isDefaultVolume
{
  if (self->_role - 1 >= 2)
  {
    BOOL v3 = [NSString stringWithFormat:@"[ASSERT] ‼️ Invalid role for %@ - use an FPDExternalVolume instance instead", self];
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      +[FPDVolume prettyNameForDomain:]();
    }

    __assert_rtn("-[FPDVolume isDefaultVolume]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDVolume.m", 604, (const char *)[v3 UTF8String]);
  }
  return 1;
}

- (id)readDomainsPropertiesUnderDirectoryAtURL:(id)a3 error:(id *)a4
{
  int64_t v5 = [a3 URLByAppendingPathComponent:@"Domains.plist"];
  dispatch_time_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v5 error:a4];

  return v6;
}

- (void)removeBrokenEbihilLinksFromRoot
{
}

- (int)dev
{
  return self->_dev;
}

- (NSString)root
{
  return self->_root;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isLibraryConfigured
{
  return self->_isLibraryConfigured;
}

- (FPDVolumeManager)volumeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeManager);
  return (FPDVolumeManager *)WeakRetained;
}

- (NSURL)syncRootsDirectory
{
  return self->_syncRootsDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncRootsDirectory, 0);
  objc_storeStrong((id *)&self->_systemDirectory, 0);
  objc_destroyWeak((id *)&self->_volumeManager);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_requiredDiskSpaceThresholdOverride, 0);
  objc_storeStrong((id *)&self->_diskSpaceRecoveryTimer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

+ (void)volumeRoleForStatFS:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_1D744C000, v1, OS_LOG_TYPE_ERROR, "[ERROR] Unable to resolve role for volume %{public}s: %u", v2, 0x12u);
}

- (void)_computeKnownPathsForRole:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed gathering persona for role: %d - failing volume init", (uint8_t *)v2, 8u);
}

void __39__FPDVolume__computeKnownPathsForRole___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(a1 + 64);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed adopting %@ for role %d but generation changed in-between, bailing out", (uint8_t *)&v4, 0x12u);
}

+ (void)prettyNameForDomain:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1D744C000, v0, v1, "[CRIT] %{public}@", v2, v3, v4, v5, v6);
}

- (void)monitorLowDiskSpaceRecoveryForConcreteError:(NSObject *)a3 .cold.3(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a2 longLongValue];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1D744C000, a3, OS_LOG_TYPE_ERROR, "[ERROR] [diskspace] low disk space detected through an error %@. Monitoring with incremented recovery amount %lld", (uint8_t *)&v6, 0x16u);
}

- (void)currentAvailableDiskSpace
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D744C000, log, OS_LOG_TYPE_ERROR, "[ERROR] [diskspace] failed to get disk space: error doing statfs.", v1, 2u);
}

- (void)isInLowDiskSpaceState
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 48), "fp_prettyPath");
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1D744C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] [diskspace] (%@) Available disk space is: %lld bytes", v6, 0x16u);
}

@end