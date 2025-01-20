@interface NSURL
@end

@implementation NSURL

uint64_t __43__NSURL_FPAdditions__fp_matchesEDSLocation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unint64_t v4 = [*(id *)(a1 + 32) count];
    if (v4 >= [v3 count])
    {
      if (![v3 count])
      {
LABEL_9:
        uint64_t v5 = 1;
        goto LABEL_10;
      }
      uint64_t v6 = 0;
      while (1)
      {
        v7 = [v3 objectAtIndexedSubscript:v6];
        v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6];
        if (([v7 isEqualToString:@"<uuid>"] & 1) == 0
          && ([v7 isEqualToString:v8] & 1) == 0)
        {
          break;
        }

        if (++v6 >= (unint64_t)[v3 count]) {
          goto LABEL_9;
        }
      }
    }
  }
  uint64_t v5 = 0;
LABEL_10:

  return v5;
}

uint64_t __45__NSURL_FPFSHelpers__fp_isDatalessWithError___block_invoke(uint64_t a1)
{
  v2 = (const char *)[*(id *)(a1 + 32) fileSystemRepresentation];
  id v3 = (stat *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);

  return lstat(v2, v3);
}

uint64_t __42__NSURL_FPFSHelpers__fp_defaultMoverBlock__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28CB8];
  id v7 = a3;
  id v8 = a2;
  v9 = [v6 defaultManager];
  uint64_t v10 = [v9 moveItemAtURL:v8 toURL:v7 error:a4];

  return v10;
}

void __41__NSURL_FPFSHelpers__getMaxChildrenCount__block_invoke()
{
  id v1 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
  uint64_t v0 = [v1 integerForKey:@"FPMaxChildrenCountForScanOverride"];
  if (v0) {
    getMaxChildrenCount_maxChildrenCount = v0;
  }
}

void __133__NSURL_FPFSHelpers__fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("fp move work queue", v2);
  id v1 = (void *)fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler__workQueue;
  fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler__workQueue = (uint64_t)v0;
}

uint64_t __133__NSURL_FPFSHelpers__fp_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fp_queued_moveUnderFolder:withNewName:coordinationOptions:allowBounce:allowCoordination:moveHandler:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 72), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

void __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    id v28 = 0;
    uint64_t v7 = *MEMORY[0x1E4F1C530];
    id v27 = 0;
    char v8 = [v5 getResourceValue:&v28 forKey:v7 error:&v27];
    id v9 = v28;
    id v10 = v27;
    if ((v8 & 1) == 0)
    {
      v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_cold_2();
      }
    }
    if (v9 && ([v9 isEqual:*(void *)(a1 + 32)] & 1) == 0)
    {
      uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
      uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
      v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

LABEL_22:
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)(a1 + 80)) {
    [*(id *)(a1 + 40) itemAtURL:v5 willMoveToURL:v6];
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v14 + 40);
  char v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_storeStrong((id *)(v14 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v15;
  v16 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) domain];
  if ([v16 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) code];

    if (v17 != 516) {
      goto LABEL_15;
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorForCollisionWithURL:", v6);
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    v16 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

LABEL_15:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v20 = fp_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_cold_1();
    }

    if (*(unsigned char *)(a1 + 80)) {
      [*(id *)(a1 + 40) itemAtURL:v5 didMoveToURL:v6];
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
    id v22 = v6;
    id v10 = *(id *)(v21 + 40);
    *(void *)(v21 + 40) = v22;
    goto LABEL_22;
  }
LABEL_23:
}

void __90__NSURL_FPFSHelpers__fp_importUnderFolder_allowCoordination_usingBlock_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (!v5) {
    objc_msgSend(v6, "fp_hideExtension:", 1);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v8 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2;
  v5[3] = &unk_1E5AF1A88;
  int v7 = *(_DWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  [v2 coordinateWritingItemAtURL:a2 options:1 error:&v8 byAccessor:v5];
  id v3 = v8;
  if (v3)
  {
    unint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_cold_1();
    }
  }
}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  memset(&v8, 0, sizeof(v8));
  if (fstat(*(_DWORD *)(a1 + 48), &v8) < 0)
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_1(v3, v5);
    }
  }
  else if (fpfs_is_busy_date(v8.st_birthtimespec.tv_sec))
  {
    unint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = 0;
    [v4 removeItemAtURL:v3 error:&v7];
    id v5 = v7;

    if (v5)
    {
      long long v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_2();
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_3(a1);
    }
  }
}

void __54__NSURL_FPFSHelpers__fp_coordinatedDeleteWithHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (!a1[4])
  {
LABEL_9:
    if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
      v13 = 0;
    }
    else {
      v13 = v4;
    }
    (*(void (**)(void, void *))(a1[5] + 16))(a1[5], v13);
    goto LABEL_16;
  }
  id v16 = 0;
  uint64_t v5 = *MEMORY[0x1E4F1C530];
  id v15 = 0;
  char v6 = [v3 getResourceValue:&v16 forKey:v5 error:&v15];
  id v7 = v16;
  id v8 = v15;
  if (v6)
  {
    if (v7 && ([v7 isEqual:a1[4]] & 1) == 0)
    {
      id v9 = fp_current_or_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __54__NSURL_FPFSHelpers__fp_coordinatedDeleteWithHandler___block_invoke_cold_1();
      }

      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
      uint64_t v11 = *(void *)(a1[6] + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    goto LABEL_9;
  }
  uint64_t v14 = fp_current_or_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_cold_2();
  }

LABEL_16:
}

void __70__NSURL_FPFSHelpers__fp_deleteAllowingCoordination_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v24 = 0;
    char v8 = [v7 removeItemAtURL:v5 error:&v24];
    id v9 = v24;
    uint64_t v10 = v9;
    if (v8)
    {
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v11 = [v9 domain];
    uint64_t v12 = *MEMORY[0x1E4F281F8];
    if ([v11 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v13 = [v10 code];

      if (v13 == 4) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v14 = [v10 domain];
    if ([v14 isEqualToString:v12])
    {
      uint64_t v15 = [v10 code];

      if (v15 == 513)
      {
        id v16 = fp_current_or_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __70__NSURL_FPFSHelpers__fp_deleteAllowingCoordination_completionHandler___block_invoke_cold_1();
        }

        uint64_t v17 = objc_opt_new();
        uint64_t v18 = objc_opt_new();
        [v17 setDelegate:v18];
        id v23 = v10;
        char v19 = [v17 removeItemAtURL:v5 error:&v23];
        id v20 = v23;
        id v21 = v23;

        if ((v19 & 1) == 0) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v20);
        }
        id v7 = v17;
        goto LABEL_17;
      }
    }
    else
    {
    }
LABEL_16:
    uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8);
    id v21 = v10;
    uint64_t v18 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
LABEL_17:

    uint64_t v10 = v21;
    goto LABEL_18;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
LABEL_19:
}

uint64_t __61__NSURL_FPAdditions__fp_personaSharedDirectoryPathForUserID___block_invoke()
{
  fp_personaSharedDirectoryPathForUserID__pathByPersonaID = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

void __59__NSURL_FPAdditions__fp_secureTempDirectoryIgnoringPersona__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v0 = (void *)MEMORY[0x1E4F1CB10];
  id v1 = NSTemporaryDirectory();
  uint64_t v2 = [v0 fileURLWithPath:v1];
  id v3 = (void *)fp_secureTempDirectoryIgnoringPersona_sandboxedTemporaryDirectory;
  fp_secureTempDirectoryIgnoringPersona_sandboxedTemporaryDirectory = v2;

  unint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    uint64_t v6 = fp_secureTempDirectoryIgnoringPersona_sandboxedTemporaryDirectory;
    _os_log_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_INFO, "[INFO] Sandboxed temporary directory is %@", (uint8_t *)&v5, 0xCu);
  }
}

void __48__NSURL_FPAdditions__fp_makeWritableOnFD_error___block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  size_t v0 = sysconf(71);
  if (v0 == -1)
  {
    int v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __48__NSURL_FPAdditions__fp_makeWritableOnFD_error___block_invoke_cold_1(v5);
    }
  }
  else
  {
    size_t v1 = v0;
    uint64_t v2 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v2, v0);
    memset(&v8, 0, sizeof(v8));
    uint64_t v7 = 0;
    if (getpwnam_r("mobile", &v8, v2, v1, &v7)) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = v7 == 0;
    }
    if (v3)
    {
      unint64_t v4 = fp_current_or_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        __48__NSURL_FPAdditions__fp_makeWritableOnFD_error___block_invoke_cold_2();
      }
    }
    else
    {
      fp_makeWritableOnFD_error__mobile_uid = v8.pw_uid;
      fp_makeWritableOnFD_error__mobile_gid = v8.pw_gid;
    }
  }
}

void __110__NSURL_CopyFile__fp_copyToURL_queue_precomputedItemSize_replacePlaceholder_shouldCopyAppleDouble_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  BOOL v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __110__NSURL_CopyFile__fp_copyToURL_queue_precomputedItemSize_replacePlaceholder_shouldCopyAppleDouble_completion___block_invoke_cold_1(a1, v3);
  }

  if ((*(unsigned char *)(a1 + 196) & 0x20) == 0
    && ((uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8),
         int v5 = *(_DWORD *)(v4 + 24),
         (*(_WORD *)(a1 + 84) & 0xF000) == 0x8000)
      ? (BOOL v6 = (v5 & 0x1000000) == 0)
      : (BOOL v6 = 0),
        v6))
  {
    if ((v5 & 8) == 0)
    {
      passwd v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:*(void *)(a1 + 224) object:*(void *)(a1 + 40) file:@"NSURL+CopyFile.m" lineNumber:325 description:@"flags must include COPYFILE_DATA"];

      uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
      int v5 = *(_DWORD *)(v4 + 24);
    }
    *(_DWORD *)(v4 + 24) = v5 ^ 8;
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    int v10 = *(_DWORD *)(v9 + 24);
    if ((v10 & 0x40000) == 0)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:*(void *)(a1 + 224) object:*(void *)(a1 + 40) file:@"NSURL+CopyFile.m" lineNumber:327 description:@"flags must include COPYFILE_NOFOLLOW_SRC"];

      uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
      int v10 = *(_DWORD *)(v9 + 24);
    }
    *(_DWORD *)(v9 + 24) = v10 ^ 0x40000;
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    int v13 = *(_DWORD *)(v12 + 24);
    if ((v13 & 0x20000) != 0) {
      *(_DWORD *)(v12 + 24) = v13 ^ 0x20000;
    }
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v14 = [*(id *)(a1 + 40) path];
  uint64_t v15 = [*(id *)(a1 + 48) path];
  if (v7)
  {
    id v16 = +[FPThreadedCopier sharedCopier];
    uint64_t v17 = *(unsigned __int8 *)(a1 + 241);
    uint64_t v18 = *(void *)(a1 + 56);
    id v26 = 0;
    char v19 = [v16 copy:v14 to:v15 overwriteDestination:v17 progress:v18 error:&v26];
    id v20 = v26;

    if ((v19 & 1) == 0)
    {
      (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), [*(id *)(a1 + 32) rootWasCopied], v20);
      goto LABEL_26;
    }
  }
  else
  {
    id v20 = 0;
  }
  if (copyfile((const char *)[v14 fileSystemRepresentation], (const char *)objc_msgSend(v15, "fileSystemRepresentation"), *(copyfile_state_t *)(a1 + 232), *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)))
  {
    if ([*(id *)(a1 + 32) copyError]) {
      int v21 = [*(id *)(a1 + 32) copyError];
    }
    else {
      int v21 = *__error();
    }
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)(a1 + 64);
    uint64_t v24 = [*(id *)(a1 + 32) rootWasCopied];
    v25 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v22 userInfo:0];
    (*(void (**)(uint64_t, uint64_t, void *))(v23 + 16))(v23, v24, v25);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "fp_makeWritableAndRemoveNonExportableAttributes");
    (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), 1, 0);
  }
LABEL_26:
  copyfile_state_free(*(copyfile_state_t *)(a1 + 232));
}

void __88__NSURL_CopyFile__fp_copyToTempFolderWithFilename_queue_precomputedItemSize_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1[6];
  if (a3)
  {
    uint64_t v4 = *(void (**)(uint64_t, void, void, uint64_t))(v3 + 16);
    uint64_t v5 = a1[6];
    v4(v5, 0, 0, a3);
  }
  else
  {
    uint64_t v6 = a1[4];
    id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a1[5] isDirectory:1];
    (*(void (**)(uint64_t, uint64_t, id, void))(v3 + 16))(v3, v6, v7, 0);
  }
}

uint64_t __61__NSURL_CopyFile__fp_createEmptyTempFileWithName_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9B8];
  id v5 = a2;
  uint64_t v6 = [v4 data];
  uint64_t v7 = [v6 writeToURL:v5 options:0 error:a3];

  return v7;
}

uint64_t __64__NSURL_CopyFile__fp_createEmptyTempPackageWithName_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F28CF0];
  id v5 = a2;
  id v6 = [v4 alloc];
  uint64_t v7 = (void *)[v6 initDirectoryWithFileWrappers:MEMORY[0x1E4F1CC08]];
  uint64_t v8 = [v7 writeToURL:v5 options:0 originalContentsURL:0 error:a3];

  return v8;
}

void __50__NSURL_FPConflictWinner__fp_lastEditorDeviceName__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    id v7 = [a2 itemVersion];
    uint64_t v4 = [v7 lastEditorDeviceName];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

uint64_t __54__NSURL_FPConflictWinner__fp_lastEditorNameComponents__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    uint64_t v11 = v5;
    id v5 = (id)[v5 isShared];
    id v6 = v11;
    if (v5)
    {
      uint64_t v7 = [v11 mostRecentEditorNameComponents];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = v11;
    }
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

void __110__NSURL_FPConflictWinner__fp_addTestConflictLoserFromItemAtURL_lastEditorDeviceName_lastEditorUserName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16_0();
  objc_msgSend(v1, "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "fp_shortDescription");
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG] sucessfully imported %@ to %@", v5, v6, v7, v8, 2u);
}

void __140__NSURL_FPFSHelpers__fp_queued_moveUnderFolder_withNewName_coordinationOptions_allowBounce_allowCoordination_moveHandler_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_16_0();
  [v1 path];
  objc_claimAutoreleasedReturnValue();
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "fp_prettyDescription");
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG] Can't read mtime from %@: %@", v5, v6, v7, v8, 2u);
}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] Coordination for writing failed with error: %@", v2, v3, v4, v5, v6);
}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 absoluteString];
  uint64_t v4 = objc_msgSend(v3, "fp_obfuscatedPath");
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Can't stat file at coordinated url: \"%@\"", v5, 0xCu);
}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A33AE000, v1, OS_LOG_TYPE_ERROR, "[ERROR] Failed to remove file at url: \"%@\" error: %@", v2, 0x16u);
}

void __92__NSURL_FPFSHelpers__fp_deleteStaleBusyFileWithFileDescriptor_coordinatorPurposeIdentifier___block_invoke_2_cold_3(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) absoluteString];
  uint64_t v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v3, v4, "[DEBUG] File is not busy anymore, it was not stale \"%@\"", v5, v6, v7, v8, v9);
}

void __54__NSURL_FPFSHelpers__fp_coordinatedDeleteWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16_0();
  [v1 path];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "fp_prettyDescription");
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG] The file was modified after the coordination %@: %@", v5, v6, v7, v8, 2u);
}

void __70__NSURL_FPFSHelpers__fp_deleteAllowingCoordination_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_30();
  _os_log_debug_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] block failed with a permission error, let's try again after changing the file's permissions", v1, 2u);
}

void __48__NSURL_FPAdditions__fp_makeWritableOnFD_error___block_invoke_cold_1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_1A33AE000, a1, OS_LOG_TYPE_FAULT, "[CRIT] cannot fetch _SC_GETPW_R_SIZE_MAX: %{errno}d", (uint8_t *)v3, 8u);
}

void __48__NSURL_FPAdditions__fp_makeWritableOnFD_error___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_11_2();
  _os_log_fault_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_FAULT, "[CRIT] cannot resolve the mobile user: %{errno}d", v1, 8u);
}

void __110__NSURL_CopyFile__fp_copyToURL_queue_precomputedItemSize_replacePlaceholder_shouldCopyAppleDouble_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 40) path];
  uint64_t v5 = [*(id *)(a1 + 48) path];
  int v6 = *(unsigned __int8 *)(a1 + 240);
  int v7 = 138412802;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  int v10 = v5;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] copyfile: %@ -> %@ AD-copy: %d", (uint8_t *)&v7, 0x1Cu);
}

@end