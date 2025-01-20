@interface NSError(BRCSyncOperationThrottle)
- (uint64_t)brc_syncOperationErrorKind;
- (void)brc_syncOperationErrorKind;
@end

@implementation NSError(BRCSyncOperationThrottle)

- (uint64_t)brc_syncOperationErrorKind
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    uint64_t v3 = [a1 code];

    if (v3 == 25)
    {
      uint64_t v4 = 2;
      goto LABEL_10;
    }
  }
  else
  {
  }
  if ((objc_msgSend(a1, "brc_isCloudKitCancellationError") & 1) != 0
    || objc_msgSend(a1, "br_isCloudDocsErrorCode:", 23))
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(NSError(BRCSyncOperationThrottle) *)(uint64_t)v5 brc_syncOperationErrorKind];
    }

    uint64_t v4 = 1;
  }
  else if (objc_msgSend(a1, "brc_isCloudKitAtomicFailure") {
         && (+[BRCUserDefaults defaultsForMangledID:0],
  }
             v8 = objc_claimAutoreleasedReturnValue(),
             int v9 = [v8 considerSyncUpBatchFailuresAsSuccessForThrottling],
             v8,
             v9))
  {
    v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(NSError(BRCSyncOperationThrottle) *)(uint64_t)v10 brc_syncOperationErrorKind];
    }

    uint64_t v4 = 0xFFFFFFFFLL;
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__NSError_BRCSyncOperationThrottle__brc_syncOperationErrorKind__block_invoke;
    v12[3] = &unk_1E69974F0;
    v12[4] = &v13;
    objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", v12);
    uint64_t v4 = *((unsigned int *)v14 + 6);
  }
LABEL_10:
  _Block_object_dispose(&v13, 8);
  return v4;
}

- (void)brc_syncOperationErrorKind
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] this is a batch failure, consider this as a success%@", (uint8_t *)&v2, 0xCu);
}

@end