@interface NSError(BRCAdditions)
+ (id)brc_errorWithDomain:()BRCAdditions code:underlyingError:;
+ (uint64_t)brc_daemonAccessDisabledError;
+ (void)initialize;
- (BOOL)_brc_isCloudKitErrorCode:()BRCAdditions;
- (BOOL)_brc_isCloudKitInternalErrorCode:()BRCAdditions;
- (BOOL)_brc_isCloudKitPluginErrorCode:()BRCAdditions;
- (BOOL)brc_isCloudKitRequestRejectedError;
- (BOOL)brc_isDatabaseRemovalError;
- (BOOL)brc_isFrontBoardOpenApplicationRequestDenied;
- (BOOL)brc_isIndividualItemBlacklistError;
- (BOOL)brc_isResetError;
- (BOOL)brc_isXPCConnectionError;
- (double)br_suggestedRetryTimeInterval;
- (id)_brc_cloudKitInternalWithErrorCode:()BRCAdditions;
- (id)_brc_cloudKitPluginErrorPayload;
- (id)br_cloudKitErrorForIdentifier:()BRCAdditions;
- (id)brc_ckPartialErrorsByItemID;
- (id)brc_cloudKitErrorMessage;
- (id)brc_description;
- (id)brc_strippedError;
- (id)brc_telemetryReportableErrorWithRecordName:()BRCAdditions;
- (id)brc_wrappedError;
- (uint64_t)_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown;
- (uint64_t)_brc_isCloudKitZoneNotFoundError;
- (uint64_t)_brc_isCloudKitZoneUserDeletedError;
- (uint64_t)brc_checkErrorsFromCloudKit:()BRCAdditions;
- (uint64_t)brc_containerResetErrorForSharedZone:()BRCAdditions resetReason:;
- (uint64_t)brc_containsCloudKitErrorCode:()BRCAdditions;
- (uint64_t)brc_containsCloudKitInternalErrorCode:()BRCAdditions;
- (uint64_t)brc_isCloudKitAccountTemporarilyUnavailable;
- (uint64_t)brc_isCloudKitAssetFileModified;
- (uint64_t)brc_isCloudKitAtomicFailure;
- (uint64_t)brc_isCloudKitCancellationError;
- (uint64_t)brc_isCloudKitDestinationNeedsSalting;
- (uint64_t)brc_isCloudKitErrorConsideredAsSuccessForZoneThrottle;
- (uint64_t)brc_isCloudKitErrorDataProtectionClass;
- (uint64_t)brc_isCloudKitErrorImplyingZoneNeedsCreation;
- (uint64_t)brc_isCloudKitErrorMissingContentRecordForNewStructureRecord;
- (uint64_t)brc_isCloudKitErrorNeedsPCSPrep;
- (uint64_t)brc_isCloudKitErrorNoNetwork;
- (uint64_t)brc_isCloudKitErrorRemappedToNewRecordName:()BRCAdditions;
- (uint64_t)brc_isCloudKitErrorReparentedToNewParent:()BRCAdditions;
- (uint64_t)brc_isCloudKitErrorRequiresVerifyTerms;
- (uint64_t)brc_isCloudKitErrorRequiringAssetRecheck;
- (uint64_t)brc_isCloudKitErrorRequiringAssetRescan;
- (uint64_t)brc_isCloudKitErrorRequiringAssetReupload;
- (uint64_t)brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown;
- (uint64_t)brc_isCloudKitErrorUnsupportedOSForItemAndGetMinimumSupported:()BRCAdditions;
- (uint64_t)brc_isCloudKitErrorUnsupportedOSForZoneAndGetMinimumSupported:()BRCAdditions;
- (uint64_t)brc_isCloudKitErrorZoneMigrated;
- (uint64_t)brc_isCloudKitErrorZoneUndergoingMigration;
- (uint64_t)brc_isCloudKitHasUnsaltedChildrenWithUnsaltedRecord:()BRCAdditions zoneID:;
- (uint64_t)brc_isCloudKitMMCSErrorChunksCouldNotBeRegisteredError;
- (uint64_t)brc_isCloudKitMMCSItemNotAvailable;
- (uint64_t)brc_isCloudKitMMCSItemNotFound;
- (uint64_t)brc_isCloudKitOutOfQuota;
- (uint64_t)brc_isCloudKitPCSChainingError;
- (uint64_t)brc_isCloudKitPCSDecryptionFailure;
- (uint64_t)brc_isCloudKitParentValidationKeyMismatchErrorWithFieldName:()BRCAdditions;
- (uint64_t)brc_isCloudKitShouldBeUsingEnhancedDrivePrivacyWithFieldName:()BRCAdditions;
- (uint64_t)brc_isCloudKitUnknownItemError;
- (uint64_t)brc_isCloudKitValidationKeyMismatchError;
- (uint64_t)brc_isDenylistError;
- (uint64_t)brc_isEverRetriable;
- (uint64_t)brc_isOutOfSpaceError;
- (uint64_t)brc_isReferenceValidationError;
- (uint64_t)brc_isRetriable;
- (uint64_t)brc_isRetriableForPCSChaining;
- (uint64_t)brc_isSaltingError;
- (uint64_t)brc_isStaleRecordUpdateError;
- (uint64_t)brc_isUserInitiatedRetriable;
- (uint64_t)brc_shouldRetryBubbleLater;
- (uint64_t)brc_shouldRetryLater;
- (void)_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown;
- (void)brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown;
- (void)brc_logUnderlineErrorsChain;
@end

@implementation NSError(BRCAdditions)

- (id)brc_description
{
  v2 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = [a1 domain];
  uint64_t v5 = [a1 code];
  v6 = [a1 userInfo];
  v7 = [v2 stringWithFormat:@"<%@:%p(%@:%ld) - %@>", v3, a1, v4, v5, v6];

  return v7;
}

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__NSError_BRCAdditions__initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

- (BOOL)brc_isResetError
{
  return objc_msgSend(a1, "brc_containerResetErrorForSharedZone:resetReason:", 0, 0) != 0;
}

- (uint64_t)brc_containerResetErrorForSharedZone:()BRCAdditions resetReason:
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__NSError_BRCAdditions__brc_containerResetErrorForSharedZone_resetReason___block_invoke;
  v6[3] = &unk_1E699A430;
  v6[4] = &v8;
  v6[5] = a4;
  char v7 = a3;
  objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", v6);
  uint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (double)br_suggestedRetryTimeInterval
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [a1 userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]];
  [v3 doubleValue];
  double v5 = v4;

  if (objc_msgSend(a1, "_brc_isCloudKitErrorCode:", 2))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = objc_msgSend(a1, "userInfo", 0);
    char v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];
    uint64_t v8 = [v7 objectEnumerator];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "br_suggestedRetryTimeInterval");
          if (v13 > v5) {
            double v5 = v13;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  return v5;
}

- (uint64_t)brc_isRetriable
{
  if (objc_msgSend(a1, "brc_isResetError")) {
    return 0;
  }
  if (objc_msgSend(a1, "brc_isCloudKitErrorNeedsPCSPrep")) {
    return 1;
  }
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_53);
}

- (uint64_t)brc_isUserInitiatedRetriable
{
  if (objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 23)) {
    return 1;
  }
  return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 7);
}

- (uint64_t)brc_shouldRetryLater
{
  if ((objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 9) & 1) != 0
    || (objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 6) & 1) != 0
    || (objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 3) & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(a1, "br_isCloudDocsErrorCode:", 56);
}

- (uint64_t)brc_shouldRetryBubbleLater
{
  if ((objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 9) & 1) != 0
    || (objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 6) & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 3);
}

- (uint64_t)brc_isEverRetriable
{
  if ((objc_msgSend(a1, "brc_isRetriable") & 1) != 0
    || (objc_msgSend(a1, "brc_isCloudKitErrorRequiringAssetRecheck") & 1) != 0
    || (objc_msgSend(a1, "brc_isCloudKitErrorRequiringAssetRescan") & 1) != 0
    || (objc_msgSend(a1, "brc_isCloudKitCancellationError") & 1) != 0
    || (objc_msgSend(a1, "brc_isCloudKitErrorRequiringAssetReupload") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown") ^ 1;
  }
}

- (uint64_t)brc_checkErrorsFromCloudKit:()BRCAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v4 = a3;
  if (((uint64_t (**)(id, void *))v4)[2](v4, a1))
  {
LABEL_2:
    uint64_t v5 = 1;
  }
  else
  {
    v6 = [a1 domain];
    if ([v6 isEqualToString:*MEMORY[0x1E4F19C40]])
    {
      uint64_t v7 = [a1 code];

      if (v7 == 2)
      {
        uint64_t v8 = [a1 userInfo];
        uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v10 = objc_msgSend(v9, "objectEnumerator", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          while (2)
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              if (v4[2](v4, *(void *)(*((void *)&v16 + 1) + 8 * v14)))
              {

                goto LABEL_2;
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
    }
    else
    {
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_brc_isCloudKitErrorCode:()BRCAdditions
{
  if (a3 >= 1000)
  {
    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[NSError(BRCAdditions) _brc_isCloudKitErrorCode:]();
    }
  }
  uint64_t v5 = [a1 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)brc_containsCloudKitErrorCode:()BRCAdditions
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__NSError_BRCAdditions__brc_containsCloudKitErrorCode___block_invoke;
  v4[3] = &__block_descriptor_40_e17_B16__0__NSError_8l;
  v4[4] = a3;
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", v4);
}

- (id)_brc_cloudKitInternalWithErrorCode:()BRCAdditions
{
  id v4 = a1;
  uint64_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v6)
  {
    uint64_t v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    id v4 = (id)v8;
  }
  uint64_t v9 = [v4 domain];
  uint64_t v10 = *MEMORY[0x1E4F19CA0];
  int v11 = [v9 isEqualToString:*MEMORY[0x1E4F19CA0]];

  if (!v11) {
    goto LABEL_10;
  }
  if ([v4 code] == a3)
  {
LABEL_5:
    id v12 = v4;
    id v4 = v12;
    goto LABEL_11;
  }
  if ([v4 code] == 2055)
  {
    uint64_t v13 = [v4 userInfo];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    long long v15 = [v14 domain];
    int v16 = [v15 isEqualToString:v10];

    if (v16 && [v14 code] == a3)
    {
      id v4 = v14;
      goto LABEL_5;
    }
    id v12 = 0;
    id v4 = v14;
  }
  else
  {
LABEL_10:
    id v12 = 0;
  }
LABEL_11:

  return v12;
}

- (BOOL)_brc_isCloudKitInternalErrorCode:()BRCAdditions
{
  if ((unint64_t)a3 >= 2 && a3 <= 999)
  {
    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorCode:]();
    }
  }
  uint64_t v5 = objc_msgSend(a1, "_brc_cloudKitInternalWithErrorCode:", a3);
  BOOL v6 = v5 != 0;

  return v6;
}

- (uint64_t)brc_containsCloudKitInternalErrorCode:()BRCAdditions
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__NSError_BRCAdditions__brc_containsCloudKitInternalErrorCode___block_invoke;
  v4[3] = &__block_descriptor_40_e17_B16__0__NSError_8l;
  v4[4] = a3;
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", v4);
}

- (id)br_cloudKitErrorForIdentifier:()BRCAdditions
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v10 = brc_bread_crumbs();
    int v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[NSError(BRCAdditions) br_cloudKitErrorForIdentifier:]();
    }

    goto LABEL_8;
  }
  uint64_t v5 = [a1 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v7 = [a1 userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  id v9 = [v8 objectForKeyedSubscript:v4];

  if (!v9) {
LABEL_8:
  }
    id v9 = a1;

  return v9;
}

- (uint64_t)brc_isCloudKitCancellationError
{
  return objc_msgSend(a1, "_brc_isCloudKitErrorCode:", 20);
}

- (uint64_t)brc_isCloudKitAssetFileModified
{
  return objc_msgSend(a1, "_brc_isCloudKitErrorCode:", 17);
}

- (uint64_t)brc_isCloudKitOutOfQuota
{
  if (objc_msgSend(a1, "_brc_isCloudKitInternalErrorCode:", 2035)) {
    return 1;
  }
  return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 25);
}

- (uint64_t)brc_isCloudKitErrorDataProtectionClass
{
  return objc_msgSend(a1, "br_isCKErrorCode:underlyingErrorCode:", 35, 3010);
}

- (uint64_t)brc_isCloudKitErrorNoNetwork
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(a1, "br_isCKErrorCode:", 3)) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(a1, "underlyingErrors", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v6, "br_isNSURLErrorCode:", -1009))
        {
          uint64_t v7 = [v6 userInfo];
          uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F289D8]];
          uint64_t v3 = v8 == 0;

          goto LABEL_13;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v3;
}

- (uint64_t)brc_isCloudKitErrorRequiresVerifyTerms
{
  if (objc_msgSend(a1, "br_isCKErrorCode:underlyingErrorCode:", 9, 2011)) {
    return 1;
  }
  return objc_msgSend(a1, "br_isCKErrorCode:", 115);
}

- (uint64_t)brc_isCloudKitAtomicFailure
{
  return objc_msgSend(a1, "_brc_isCloudKitInternalErrorCode:", 2024);
}

- (uint64_t)brc_isCloudKitPCSChainingError
{
  if (objc_msgSend(a1, "_brc_isCloudKitInternalErrorCode:", 2044)) {
    return 1;
  }
  return objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 6);
}

- (uint64_t)brc_isCloudKitValidationKeyMismatchError
{
  return objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 11);
}

- (uint64_t)brc_isCloudKitParentValidationKeyMismatchErrorWithFieldName:()BRCAdditions
{
  uint64_t v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 12);
  if (v5)
  {
    int v6 = objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    uint64_t v7 = [[BRCExtensionErrorPayload alloc] initWithData:v6];
    uint64_t v8 = v7;
    if (a3)
    {
      *a3 = [(BRCExtensionErrorPayload *)v7 fieldName];
    }
  }
  return v5;
}

- (uint64_t)brc_isCloudKitHasUnsaltedChildrenWithUnsaltedRecord:()BRCAdditions zoneID:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 10);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    if (a3)
    {
      uint64_t v20 = v8;
      id v9 = [[BRCExtensionErrorPayload alloc] initWithData:v8];
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v19 = v9;
      long long v11 = [(BRCExtensionErrorPayload *)v9 recordIds];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            int v16 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:*(void *)(*((void *)&v21 + 1) + 8 * v15) zoneID:v6];
            [v10 addObject:v16];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v13);
      }

      id v17 = v10;
      *a3 = v17;

      uint64_t v8 = v20;
    }
  }
  return v7;
}

- (uint64_t)brc_isCloudKitDestinationNeedsSalting
{
  return objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 9);
}

- (uint64_t)brc_isCloudKitShouldBeUsingEnhancedDrivePrivacyWithFieldName:()BRCAdditions
{
  uint64_t v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 13);
  if (v5)
  {
    id v6 = objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    uint64_t v7 = [[BRCExtensionErrorPayload alloc] initWithData:v6];
    uint64_t v8 = v7;
    if (a3)
    {
      *a3 = [(BRCExtensionErrorPayload *)v7 fieldName];
    }
  }
  return v5;
}

- (uint64_t)brc_isSaltingError
{
  if ((objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 10) & 1) != 0
    || (objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 9) & 1) != 0
    || (objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 10) & 1) != 0
    || (objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 11) & 1) != 0
    || (objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 12) & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 13);
}

- (uint64_t)brc_isCloudKitUnknownItemError
{
  uint64_t result = objc_msgSend(a1, "_brc_isCloudKitErrorCode:", 11);
  if (result)
  {
    return objc_msgSend(a1, "_brc_isCloudKitInternalErrorCode:", 2003);
  }
  return result;
}

- (uint64_t)brc_isCloudKitAccountTemporarilyUnavailable
{
  return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 36);
}

- (BOOL)brc_isCloudKitRequestRejectedError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F19C40]]) {
    BOOL v3 = [a1 code] == 15;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (uint64_t)brc_isCloudKitMMCSErrorChunksCouldNotBeRegisteredError
{
  return 0;
}

- (uint64_t)brc_isCloudKitErrorMissingContentRecordForNewStructureRecord
{
  return objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 14);
}

- (id)brc_ckPartialErrorsByItemID
{
  v2 = [a1 domain];
  if (![v2 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  uint64_t v3 = [a1 code];

  if (v3 == 2)
  {
    v2 = [a1 userInfo];
    uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v4 = 0;
LABEL_7:
  return v4;
}

- (uint64_t)brc_isCloudKitErrorRequiringAssetRecheck
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    uint64_t v3 = [a1 code];

    if (v3 == 35) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (uint64_t)brc_isCloudKitErrorRequiringAssetRescan
{
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v3)
  {
    if (([a1 code] & 0xFFFFFFFFFFFFFFFELL) == 0x10)
    {
      id v4 = 0;
      uint64_t v5 = 1;
      goto LABEL_11;
    }
    id v6 = [a1 userInfo];
    id v4 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  else
  {
    id v4 = a1;
  }
  uint64_t v7 = [v4 domain];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F19CA0]];

  if (!v8
    || ((v9 = [v4 code], uint64_t v5 = 1, (unint64_t)(v9 - 3002) > 7)
     || ((1 << (v9 + 70)) & 0x9F) == 0)
    && (unint64_t)(v9 - 7000) >= 5)
  {
    uint64_t v5 = 0;
  }
LABEL_11:

  return v5;
}

- (uint64_t)brc_isCloudKitErrorRequiringAssetReupload
{
  if (objc_msgSend(a1, "brc_isCloudKitErrorRequiringAssetRescan"))
  {
    id v2 = 0;
    uint64_t v3 = 1;
    goto LABEL_14;
  }
  id v4 = [a1 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v5)
  {
    id v6 = [a1 userInfo];
    id v2 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  else
  {
    id v2 = a1;
  }
  uint64_t v7 = [v2 domain];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F19CA0]];

  if (!v8)
  {
LABEL_13:
    uint64_t v3 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = [v2 code];
  uint64_t v3 = 1;
  if (v9 > 5002)
  {
    if ((unint64_t)(v9 - 5003) < 2) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v9 != 1021 && v9 != 3005 && v9 != 3011) {
    goto LABEL_13;
  }
LABEL_14:

  return v3;
}

- (BOOL)_brc_isCloudKitPluginErrorCode:()BRCAdditions
{
  id v4 = objc_msgSend(a1, "_brc_cloudKitInternalWithErrorCode:", 6000);
  int v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F28A50]];

  uint64_t v7 = [v6 domain];
  int v8 = [v7 isEqualToString:@"CloudDocsServerExtension"];

  if (v8) {
    BOOL v9 = [v6 code] == a3;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_brc_cloudKitPluginErrorPayload
{
  v1 = objc_msgSend(a1, "_brc_cloudKitInternalWithErrorCode:", 6000);
  id v2 = [v1 userInfo];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F28A50]];

  id v4 = [v3 userInfo];
  int v5 = [v4 objectForKey:*MEMORY[0x1E4F19C80]];

  return v5;
}

- (uint64_t)brc_isCloudKitErrorUnsupportedOSForItemAndGetMinimumSupported:()BRCAdditions
{
  uint64_t v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 1);
  if (v5)
  {
    id v6 = objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    uint64_t v7 = [[BRCExtensionErrorPayload alloc] initWithData:v6];
    int v8 = v7;
    if (a3)
    {
      *a3 = [(BRCExtensionErrorPayload *)v7 minimumOSName];
    }
  }
  return v5;
}

- (uint64_t)brc_isCloudKitErrorUnsupportedOSForZoneAndGetMinimumSupported:()BRCAdditions
{
  uint64_t v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 2);
  if (v5)
  {
    id v6 = objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    uint64_t v7 = [[BRCExtensionErrorPayload alloc] initWithData:v6];
    int v8 = v7;
    if (a3)
    {
      *a3 = [(BRCExtensionErrorPayload *)v7 minimumOSName];
    }
  }
  return v5;
}

- (uint64_t)brc_isCloudKitErrorReparentedToNewParent:()BRCAdditions
{
  uint64_t v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 7);
  if (v5)
  {
    id v6 = objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    uint64_t v7 = [[BRCExtensionErrorPayload alloc] initWithData:v6];
    if ([(BRCExtensionErrorPayload *)v7 hasRecordId])
    {
      if (!a3)
      {
LABEL_5:

        return v5;
      }
    }
    else
    {
      BOOL v9 = brc_bread_crumbs();
      id v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[NSError(BRCAdditions) brc_isCloudKitErrorReparentedToNewParent:]();
      }

      if (!a3) {
        goto LABEL_5;
      }
    }
    *a3 = [(BRCExtensionErrorPayload *)v7 recordId];
    goto LABEL_5;
  }
  return v5;
}

- (uint64_t)brc_isCloudKitErrorRemappedToNewRecordName:()BRCAdditions
{
  uint64_t v5 = objc_msgSend(a1, "_brc_isCloudKitPluginErrorCode:", 8);
  if (v5)
  {
    id v6 = objc_msgSend(a1, "_brc_cloudKitPluginErrorPayload");
    uint64_t v7 = [[BRCExtensionErrorPayload alloc] initWithData:v6];
    if ([(BRCExtensionErrorPayload *)v7 hasRecordId])
    {
      if (!a3)
      {
LABEL_5:

        return v5;
      }
    }
    else
    {
      BOOL v9 = brc_bread_crumbs();
      id v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[NSError(BRCAdditions) brc_isCloudKitErrorReparentedToNewParent:]();
      }

      if (!a3) {
        goto LABEL_5;
      }
    }
    *a3 = [(BRCExtensionErrorPayload *)v7 recordId];
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)brc_isIndividualItemBlacklistError
{
  id v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v3)
  {
    id v4 = [a1 userInfo];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  else
  {
    id v5 = a1;
  }
  id v6 = [v5 domain];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F19CA0]];

  if (v7)
  {
    uint64_t v8 = [v5 code];
    BOOL v10 = v8 == 2052 || v8 == 2027;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (uint64_t)brc_isRetriableForPCSChaining
{
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_17_0);
}

- (uint64_t)brc_isCloudKitErrorConsideredAsSuccessForZoneThrottle
{
  if ((objc_msgSend(a1, "_brc_isCloudKitInternalErrorCode:", 3005) & 1) != 0
    || (objc_msgSend(a1, "brc_isCloudKitErrorUnsupportedOSForItemAndGetMinimumSupported:", 0) & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(a1, "brc_isCloudKitOutOfQuota");
}

- (uint64_t)_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown
{
  id v2 = [a1 domain];
  uint64_t v3 = *MEMORY[0x1E4F19CA0];
  char v4 = [v2 isEqualToString:*MEMORY[0x1E4F19CA0]];

  if ((v4 & 1) == 0)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
LABEL_10:
    -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown]();
    goto LABEL_11;
  }
  uint64_t v5 = [a1 code];
  if (v5 <= 2999)
  {
    if (v5 <= 1023)
    {
      if ((unint64_t)(v5 - 1000) < 0x18)
      {
        if (v5 == 1020) {
          return 1;
        }
        int v7 = brc_bread_crumbs();
        uint64_t v8 = brc_default_log();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_11;
        }
        goto LABEL_53;
      }
      if (!v5)
      {
        int v7 = brc_bread_crumbs();
        uint64_t v8 = brc_default_log();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      if (v5 == 1)
      {
        int v7 = brc_bread_crumbs();
        uint64_t v8 = brc_default_log();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_11;
        }
        goto LABEL_53;
      }
    }
    else
    {
      if ((unint64_t)(v5 - 2000) < 0x38)
      {
        uint64_t v6 = 1;
        if (v5 > 2021)
        {
          switch(v5)
          {
            case 2022:
            case 2024:
            case 2029:
            case 2030:
            case 2031:
            case 2034:
            case 2035:
            case 2049:
              return v6;
            case 2036:
              int v7 = brc_bread_crumbs();
              uint64_t v8 = brc_default_log();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_53;
              }
              goto LABEL_11;
            case 2037:
              int v7 = brc_bread_crumbs();
              uint64_t v8 = brc_default_log();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_53;
              }
              goto LABEL_11;
            case 2040:
              int v7 = brc_bread_crumbs();
              uint64_t v8 = brc_default_log();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_53;
              }
              goto LABEL_11;
            case 2041:
              int v7 = brc_bread_crumbs();
              uint64_t v8 = brc_default_log();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_53;
              }
              goto LABEL_11;
            case 2044:
              int v7 = brc_bread_crumbs();
              uint64_t v8 = brc_default_log();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_53;
              }
              goto LABEL_11;
            case 2055:
              int v16 = [a1 userInfo];
              id v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

              long long v18 = [v17 domain];
              int v19 = [v18 isEqualToString:v3];

              if (v19) {
                uint64_t v6 = objc_msgSend(v17, "_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown");
              }
              else {
                uint64_t v6 = 1;
              }

              break;
            default:
              goto LABEL_34;
          }
          return v6;
        }
        if (v5 != 2000)
        {
          if (v5 == 2002 || v5 == 2008) {
            return v6;
          }
LABEL_34:
          int v7 = brc_bread_crumbs();
          uint64_t v8 = brc_default_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_53;
          }
LABEL_11:

          return 0;
        }
        int v7 = brc_bread_crumbs();
        uint64_t v8 = brc_default_log();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_11;
        }
LABEL_53:
        -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown]();
        goto LABEL_11;
      }
      if (v5 == 1024)
      {
        int v7 = brc_bread_crumbs();
        uint64_t v8 = brc_default_log();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
    goto LABEL_61;
  }
  uint64_t v6 = 1;
  if (v5 <= 5999)
  {
    if ((unint64_t)(v5 - 3000) < 0xC) {
      return v6;
    }
    if ((unint64_t)(v5 - 5000) < 0xC)
    {
      if (v5 != 5004) {
        return v6;
      }
      int v7 = brc_bread_crumbs();
      uint64_t v8 = brc_default_log();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
      goto LABEL_53;
    }
    if ((unint64_t)(v5 - 4000) < 3) {
      return v6;
    }
    goto LABEL_61;
  }
  if ((unint64_t)(v5 - 8000) < 0xE || (unint64_t)(v5 - 7000) < 5) {
    return v6;
  }
  if (v5 != 6000)
  {
LABEL_61:
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  BOOL v10 = [a1 userInfo];
  long long v11 = [v10 objectForKey:*MEMORY[0x1E4F28A50]];

  uint64_t v12 = [v11 domain];
  int v13 = [v12 isEqualToString:@"CloudDocsServerExtension"];

  if (v13)
  {
    uint64_t v6 = 1;
    switch([v11 code])
    {
      case 1:
      case 2:
      case 13:
      case 14:
        goto LABEL_66;
      case 3:
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          break;
        }
        goto LABEL_86;
      case 4:
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          break;
        }
        goto LABEL_86;
      case 5:
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          break;
        }
        goto LABEL_86;
      case 6:
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          break;
        }
        goto LABEL_86;
      case 7:
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          break;
        }
        goto LABEL_86;
      case 8:
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          break;
        }
        goto LABEL_86;
      case 9:
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          break;
        }
        goto LABEL_86;
      case 10:
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          break;
        }
        goto LABEL_86;
      case 11:
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          break;
        }
        goto LABEL_86;
      case 12:
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          break;
        }
LABEL_86:
        -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown]();
        break;
      default:
        uint64_t v14 = brc_bread_crumbs();
        uint64_t v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          goto LABEL_64;
        }
        break;
    }
  }
  else
  {
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
LABEL_64:
    }
      -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown]();
  }

  uint64_t v6 = 0;
LABEL_66:

  return v6;
}

- (uint64_t)brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "brc_isXPCConnectionError"))
  {
    id v2 = brc_bread_crumbs();
    uint64_t v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[NSError(BRCAdditions) brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown]();
    }

    char v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
LABEL_5:
    -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown]();
LABEL_6:

    return 0;
  }
  uint64_t v8 = [a1 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v9)
  {
    uint64_t v6 = 1;
    switch([a1 code])
    {
      case 1:
        BOOL v10 = [a1 userInfo];
        long long v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
        uint64_t v12 = objc_msgSend(v11, "_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown");

        return v12;
      case 2:
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v15 = objc_msgSend(a1, "userInfo", 0);
        int v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];
        id v17 = [v16 objectEnumerator];

        uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (!v18) {
          goto LABEL_28;
        }
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v29;
        break;
      case 3:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 4:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 5:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          goto LABEL_6;
        }
        goto LABEL_68;
      case 6:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 7:
      case 16:
      case 17:
      case 25:
      case 27:
      case 28:
      case 29:
      case 32:
      case 33:
      case 34:
      case 35:
        return v6;
      case 8:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          goto LABEL_6;
        }
        goto LABEL_68;
      case 9:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 10:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 11:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 12:
        long long v22 = [a1 userInfo];
        id v17 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

        if (v17) {
          goto LABEL_53;
        }
        long long v23 = brc_bread_crumbs();
        long long v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown]();
        }
        goto LABEL_81;
      case 13:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 14:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 15:
        v25 = [a1 userInfo];
        id v17 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

        if (v17)
        {
LABEL_53:
          uint64_t v6 = objc_msgSend(v17, "_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown");
          goto LABEL_82;
        }
        long long v23 = brc_bread_crumbs();
        long long v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
          -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown]();
        }
        goto LABEL_81;
      case 18:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          goto LABEL_6;
        }
        goto LABEL_68;
      case 19:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 20:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 21:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 22:
        uint64_t v26 = [a1 userInfo];
        v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

        if (v27) {
          uint64_t v6 = objc_msgSend(v27, "_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown");
        }

        return v6;
      case 23:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 24:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          goto LABEL_6;
        }
LABEL_68:
        -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown]();
        goto LABEL_6;
      case 26:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 30:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 31:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      case 36:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
      default:
        char v4 = brc_bread_crumbs();
        uint64_t v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        goto LABEL_6;
    }
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown") & 1) == 0)
        {
          long long v23 = brc_bread_crumbs();
          long long v24 = brc_default_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            -[NSError(BRCAdditions) _brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown]();
          }
LABEL_81:

          uint64_t v6 = 0;
          goto LABEL_82;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v19) {
        continue;
      }
      break;
    }
LABEL_28:
    uint64_t v6 = 1;
LABEL_82:

    return v6;
  }
  int v13 = [a1 domain];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F19CA0]];

  if (!v14)
  {
    char v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  return objc_msgSend(a1, "_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown");
}

- (uint64_t)brc_isDenylistError
{
  return objc_msgSend(a1, "brc_containsCloudKitInternalErrorCode:", 2039);
}

- (uint64_t)brc_isOutOfSpaceError
{
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_19);
}

- (BOOL)brc_isDatabaseRemovalError
{
  BOOL result = 0;
  if ([a1 isSqliteErrorCode:10])
  {
    id v2 = [a1 userInfo];
    uint64_t v3 = [v2 objectForKeyedSubscript:@"SqliteExtendedCode"];
    uint64_t v4 = [v3 longLongValue];

    if (v4 == 6922) {
      return 1;
    }
  }
  return result;
}

- (uint64_t)_brc_isCloudKitZoneNotFoundError
{
  return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 26);
}

- (uint64_t)_brc_isCloudKitZoneUserDeletedError
{
  return objc_msgSend(a1, "brc_containsCloudKitErrorCode:", 28);
}

- (uint64_t)brc_isCloudKitErrorImplyingZoneNeedsCreation
{
  if (objc_msgSend(a1, "_brc_isCloudKitZoneNotFoundError")) {
    return 1;
  }
  return objc_msgSend(a1, "_brc_isCloudKitZoneUserDeletedError");
}

- (uint64_t)brc_isCloudKitErrorZoneUndergoingMigration
{
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_24);
}

- (uint64_t)brc_isCloudKitErrorZoneMigrated
{
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_26);
}

- (uint64_t)brc_isCloudKitErrorNeedsPCSPrep
{
  return objc_msgSend(a1, "brc_checkErrorsFromCloudKit:", &__block_literal_global_28_0);
}

- (uint64_t)brc_isStaleRecordUpdateError
{
  return objc_msgSend(a1, "brc_containsCloudKitInternalErrorCode:", 2041);
}

- (uint64_t)brc_isReferenceValidationError
{
  return objc_msgSend(a1, "brc_containsCloudKitInternalErrorCode:", 2025);
}

- (uint64_t)brc_isCloudKitPCSDecryptionFailure
{
  return objc_msgSend(a1, "brc_containsCloudKitInternalErrorCode:", 5004);
}

- (uint64_t)brc_isCloudKitMMCSItemNotAvailable
{
  return objc_msgSend(a1, "brc_containsCloudKitInternalErrorCode:", 3010);
}

- (uint64_t)brc_isCloudKitMMCSItemNotFound
{
  return objc_msgSend(a1, "brc_containsCloudKitInternalErrorCode:", 3002);
}

- (BOOL)brc_isFrontBoardOpenApplicationRequestDenied
{
  id v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F626B8]]) {
    BOOL v3 = [a1 code] == 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)brc_strippedError
{
  id v2 = [a1 domain];
  uint64_t v3 = *MEMORY[0x1E4F19C40];
  if ([v2 isEqualToString:*MEMORY[0x1E4F19C40]])
  {

    goto LABEL_4;
  }
  uint64_t v4 = [a1 domain];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F19CA0]];

  if (v5)
  {
LABEL_4:
    uint64_t v6 = objc_opt_new();
    int v7 = [a1 domain];
    if ([v7 isEqualToString:v3])
    {
      uint64_t v8 = [a1 code];

      if (v8 == 2)
      {
        int v9 = [a1 userInfo];
        id v10 = (id)*MEMORY[0x1E4F19CD8];
        long long v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

        uint64_t v12 = objc_opt_new();
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __42__NSError_BRCAdditions__brc_strippedError__block_invoke;
        v27[3] = &unk_1E6995BF8;
        id v13 = v12;
        id v28 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v27];
        uint64_t v14 = [v13 count];
        if (v14 == 1)
        {
          uint64_t v15 = [v13 allValues];
          int v16 = [v15 firstObject];
          objc_msgSend(v16, "brc_strippedError");
          id v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          [v6 setObject:v13 forKeyedSubscript:v10];
        }

        if (v14 == 1) {
          goto LABEL_10;
        }
      }
    }
    else
    {
    }
    id v17 = [a1 userInfo];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    long long v24 = __42__NSError_BRCAdditions__brc_strippedError__block_invoke_2;
    v25 = &unk_1E6995BF8;
    id v18 = v6;
    id v26 = v18;
    [v17 enumerateKeysAndObjectsUsingBlock:&v22];

    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = objc_msgSend(a1, "domain", v22, v23, v24, v25);
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, objc_msgSend(a1, "code"), v18);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    goto LABEL_12;
  }
  id v10 = a1;
LABEL_12:
  return v10;
}

+ (id)brc_errorWithDomain:()BRCAdditions code:underlyingError:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  int v9 = [v7 userInfo];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  long long v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

  uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
  if (v11)
  {
    v20[0] = *MEMORY[0x1E4F28A50];
    v20[1] = v10;
    v21[0] = v7;
    v21[1] = v11;
    id v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = v21;
    uint64_t v15 = v20;
    uint64_t v16 = 2;
  }
  else
  {
    uint64_t v22 = *MEMORY[0x1E4F28A50];
    v23[0] = v7;
    id v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = v23;
    uint64_t v15 = &v22;
    uint64_t v16 = 1;
  }
  id v17 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
  id v18 = [v12 errorWithDomain:v8 code:a4 userInfo:v17];

  return v18;
}

- (id)brc_wrappedError
{
  id v2 = [a1 domain];
  uint64_t v3 = (void *)*MEMORY[0x1E4F592A8];
  if ([v2 isEqualToString:*MEMORY[0x1E4F592A8]])
  {

    goto LABEL_4;
  }
  uint64_t v4 = [a1 domain];
  char v5 = (void *)*MEMORY[0x1E4F281F8];
  int v6 = [v4 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v6) {
    goto LABEL_4;
  }
  uint64_t v10 = [a1 domain];
  if ([v10 isEqualToString:*MEMORY[0x1E4F19C40]])
  {

LABEL_12:
    id v13 = objc_msgSend(a1, "brc_strippedError");
    if (objc_msgSend(a1, "brc_isCloudKitOutOfQuota"))
    {
      uint64_t v14 = v5;
      uint64_t v15 = 4354;
    }
    else
    {
      uint64_t v14 = v3;
      uint64_t v15 = 17;
    }
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorWithDomain:code:underlyingError:", v14, v15, v13);

    goto LABEL_6;
  }
  long long v11 = [a1 domain];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F19CA0]];

  if (v12) {
    goto LABEL_12;
  }
  uint64_t v16 = [a1 domain];
  int v17 = [v16 isEqualToString:*MEMORY[0x1E4F28798]];

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorWithDomain:code:underlyingError:", v5, 512, a1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v18 = [a1 domain];
  int v19 = [v18 isEqualToString:*MEMORY[0x1E4F63BC0]];

  if (v19)
  {
    id v20 = v3;
    uint64_t v21 = [a1 code];
    if (v21 == 6)
    {
      uint64_t v23 = 8;
    }
    else if (v21 == 1)
    {
      id v22 = v5;

      uint64_t v23 = 512;
      id v20 = v22;
    }
    else
    {
      uint64_t v23 = 15;
    }
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorWithDomain:code:underlyingError:", v20, v23, a1);

    goto LABEL_6;
  }
LABEL_4:
  id v7 = a1;
LABEL_5:
  id v8 = v7;
LABEL_6:
  return v8;
}

+ (uint64_t)brc_daemonAccessDisabledError
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 16, @"Sync is restricted for this client");
}

- (id)brc_cloudKitErrorMessage
{
  id v2 = [a1 userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F19C68]];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    int v6 = [a1 userInfo];
    id v5 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F19C30]];
  }
  return v5;
}

- (id)brc_telemetryReportableErrorWithRecordName:()BRCAdditions
{
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__46;
  v34 = __Block_byref_object_dispose__46;
  id v4 = a1;
  id v35 = v4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__46;
  id v28 = __Block_byref_object_dispose__46;
  id v29 = 0;
  id v5 = [v4 domain];
  if (![v5 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v6 = [v4 code];

  if (v6 == 2)
  {
    id v7 = [v4 userInfo];
    id v5 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __68__NSError_BRCAdditions__brc_telemetryReportableErrorWithRecordName___block_invoke;
    v23[3] = &unk_1E699A478;
    v23[4] = &v30;
    v23[5] = &v24;
    [v5 enumerateKeysAndObjectsUsingBlock:v23];
    if (a3) {
      *a3 = (id) v25[5];
    }
    goto LABEL_5;
  }
LABEL_6:
  id v8 = [(id)v31[5] userInfo];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v12 = [(id)v31[5] userInfo];
    uint64_t v13 = [v12 objectForKeyedSubscript:v9];
    uint64_t v14 = (void *)v31[5];
    v31[5] = v13;

    uint64_t v15 = [(id)v31[5] userInfo];
    uint64_t v16 = [v15 objectForKeyedSubscript:v9];
    objc_opt_class();
    char v17 = objc_opt_isKindOfClass();

    if (v17)
    {
      id v18 = [(id)v31[5] userInfo];
      uint64_t v19 = [v18 objectForKeyedSubscript:v9];
      id v20 = (void *)v31[5];
      v31[5] = v19;
    }
  }
  id v21 = (id)v31[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v21;
}

- (BOOL)brc_isXPCConnectionError
{
  id v2 = [a1 domain];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F281F8]];

  return v3 && (unint64_t)([a1 code] - 4225) > 0xFFFFFFFFFFFFFF7ELL;
}

- (void)brc_logUnderlineErrorsChain
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Printing Underline Errors Chain for %@%@");
}

- (void)_brc_isCloudKitErrorCode:()BRCAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: code < CKErrorInternalGenericError%@", v2, v3, v4, v5, v6);
}

- (void)_brc_isCloudKitInternalErrorCode:()BRCAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: code == CKErrorInternalSuccess || code == CKErrorInternalCancelled || code >= CKErrorInternalGenericError%@", v2, v3, v4, v5, v6);
}

- (void)br_cloudKitErrorForIdentifier:()BRCAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: there should be a recordID%@", v2, v3, v4, v5, v6);
}

- (void)brc_isCloudKitErrorReparentedToNewParent:()BRCAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: errorPayload.hasRecordId%@", v2, v3, v4, v5, v6);
}

- (void)_brc_isCloudKitInternalErrorSafeToSyncUpWithoutSyncDown
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] we should sync-down again after %@%@");
}

- (void)brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Cloudd crashed, our sync up could have been received by the server%@", v2, v3, v4, v5, v6);
}

@end