@interface NSError(BRAdditions)
+ (id)br_errorWithDomain:()BRAdditions code:description:;
+ (id)br_errorWithDomain:()BRAdditions code:userInfo:description:;
+ (id)br_errorWithPOSIXCode:()BRAdditions;
+ (id)br_errorWithPOSIXCode:()BRAdditions description:;
+ (id)brc_addPartialError:()BRAdditions forURL:toError:;
+ (id)brc_errorAcceptShareFailedWithUnderlyingError:()BRAdditions;
+ (id)brc_errorCollisionWithItem:()BRAdditions;
+ (id)brc_errorDamagedDocumentOnDiskWithUnderlyingError:()BRAdditions;
+ (id)brc_errorDocumentAtURL:()BRAdditions isNotExternalToAppLibrary:;
+ (id)brc_errorFolderHasSharedSubitemsWithSharedByMeURLs:()BRAdditions sharedToMeURLs:;
+ (id)brc_errorForRejectedDeletionOfItem:()BRAdditions;
+ (id)brc_errorFromException:()BRAdditions;
+ (id)brc_errorItemAlreadyPausedFromSyncByBundleID:()BRAdditions;
+ (id)brc_errorItemIneligibleFromSyncForInode:()BRAdditions;
+ (id)brc_errorItemNotFound:()BRAdditions;
+ (id)brc_errorLoggedOutWithUnderlyingError:()BRAdditions;
+ (id)brc_errorMethodNotImplemented:()BRAdditions;
+ (id)brc_errorNoDocument:()BRAdditions underlyingPOSIXError:;
+ (id)brc_errorNoDocumentAtURL:()BRAdditions underlyingError:;
+ (id)brc_errorNotInCloud:()BRAdditions;
+ (id)brc_errorNotOnDisk:()BRAdditions;
+ (id)brc_errorParentItemRemotelyDeleted:()BRAdditions;
+ (id)brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:()BRAdditions;
+ (id)brc_errorPermissionError:()BRAdditions;
+ (id)brc_errorPermissionErrorAtURL:()BRAdditions;
+ (id)brc_errorUnexpectedItemType:()BRAdditions description:;
+ (uint64_t)br_errorFromErrno;
+ (uint64_t)brc_errorAcceptAlreadyInProgressForURL:()BRAdditions;
+ (uint64_t)brc_errorAcceptShareFailedForItem:()BRAdditions;
+ (uint64_t)brc_errorAccountMismatch;
+ (uint64_t)brc_errorAccountSessionOpenFailed;
+ (uint64_t)brc_errorAppLibraryNotFound:()BRAdditions;
+ (uint64_t)brc_errorBouncedItemNotKnownByServer;
+ (uint64_t)brc_errorBuddyFlowNeedsToRun;
+ (uint64_t)brc_errorCantCallFPInSyncBubble;
+ (uint64_t)brc_errorCantCreateAsset;
+ (uint64_t)brc_errorClientZoneNotFound:()BRAdditions;
+ (uint64_t)brc_errorCompatibilityIssue;
+ (uint64_t)brc_errorCoreAnalyticsErrorCountMismatchWithExpected:()BRAdditions actual:;
+ (uint64_t)brc_errorCorruptedDB;
+ (uint64_t)brc_errorDaemonShouldBeLoggedOut;
+ (uint64_t)brc_errorDeletingNonEmptyDirectoryNonRecursively;
+ (uint64_t)brc_errorDocumentEvicted;
+ (uint64_t)brc_errorDocumentIsNoLongerSharedAtIdentifier:()BRAdditions;
+ (uint64_t)brc_errorDocumentIsNotGreedy;
+ (uint64_t)brc_errorDocumentIsNotShared;
+ (uint64_t)brc_errorDocumentIsNotSharedAtIdentifier:()BRAdditions;
+ (uint64_t)brc_errorDocumentWithFilename:()BRAdditions size:isTooLargeToUpload:;
+ (uint64_t)brc_errorDownloadCancelled;
+ (uint64_t)brc_errorDriveDisabledOrAppLibraryDisabled;
+ (uint64_t)brc_errorExcludedFromSyncDueToFilename;
+ (uint64_t)brc_errorExcludedFromSyncUnderRoot;
+ (uint64_t)brc_errorFolderHasSharedSubitems;
+ (uint64_t)brc_errorFolderHierarchyTooDeep;
+ (uint64_t)brc_errorInitialScanItemBouncedByServer;
+ (uint64_t)brc_errorInitialScanItemTypeMismatch;
+ (uint64_t)brc_errorInvalidParameter:()BRAdditions value:;
+ (uint64_t)brc_errorItemAlreadyPartOfAShare;
+ (uint64_t)brc_errorItemBusy;
+ (uint64_t)brc_errorItemChanged;
+ (uint64_t)brc_errorItemInTrash;
+ (uint64_t)brc_errorItemNotPausedFromSync;
+ (uint64_t)brc_errorItemNotShareable;
+ (uint64_t)brc_errorItemProcessingDisabled;
+ (uint64_t)brc_errorLoggedOut;
+ (uint64_t)brc_errorMDMRestrictsCrossPersonaClientApp;
+ (uint64_t)brc_errorNoAppLibraryForBundle:()BRAdditions;
+ (uint64_t)brc_errorNoBRItemService;
+ (uint64_t)brc_errorNoEtagAvailableForDownloadOfItemWithIdentifier:()BRAdditions;
+ (uint64_t)brc_errorNoEtagInContentSignature;
+ (uint64_t)brc_errorNoSuitableClientApp;
+ (uint64_t)brc_errorNotSupportedInCustomerBuild;
+ (uint64_t)brc_errorNotSupportedInFPFS;
+ (uint64_t)brc_errorOperationAlreadyRunning:()BRAdditions;
+ (uint64_t)brc_errorOperationCancelled;
+ (uint64_t)brc_errorPostponeUpload;
+ (uint64_t)brc_errorRecordBouncedByServer;
+ (uint64_t)brc_errorRecordValidation;
+ (uint64_t)brc_errorRequestedVersionHasLocalEdits;
+ (uint64_t)brc_errorRescheduleDownloadForMoreRecentServerVersion;
+ (uint64_t)brc_errorStuckFPFSMigration;
+ (uint64_t)brc_errorSyncBlocked;
+ (uint64_t)brc_errorSyncDisabled:()BRAdditions;
+ (uint64_t)brc_errorTCCAccessDenied;
+ (uint64_t)brc_errorThrottledWithDescription:()BRAdditions;
+ (uint64_t)brc_errorThumbnailGenerationOperationTimedOut;
+ (uint64_t)brc_errorUnknownKey:()BRAdditions;
+ (uint64_t)brc_errorZoneReset;
+ (uint64_t)brc_unkownErrorWithDescription:()BRAdditions;
- (BOOL)br_isCKErrorCode:()BRAdditions;
- (BOOL)br_isCKErrorCode:()BRAdditions underlyingErrorCode:;
- (BOOL)br_isCloudDocsErrorCode:()BRAdditions;
- (BOOL)br_isCocoaErrorCode:()BRAdditions;
- (BOOL)br_isFileProviderErrorCode:()BRAdditions;
- (BOOL)br_isNSURLErrorCode:()BRAdditions;
- (BOOL)br_isNSXPCConnectionError;
- (BOOL)br_isPOSIXErrorCode:()BRAdditions;
- (id)br_errorDescription;
- (id)br_underlyingPOSIXError;
@end

@implementation NSError(BRAdditions)

+ (id)brc_errorLoggedOutWithUnderlyingError:()BRAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  if (a3)
  {
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    v10[0] = a3;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    v7 = objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 2, v6, @"Logged out - iCloud Drive is not configured");
  }
  else
  {
    id v6 = 0;
    v7 = objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 2, 0, @"Logged out - iCloud Drive is not configured");
  }

  return v7;
}

+ (id)br_errorWithDomain:()BRAdditions code:userInfo:description:
{
  id v12 = a3;
  id v13 = a5;
  if (a6)
  {
    v14 = (objc_class *)NSString;
    id v15 = a6;
    v16 = (void *)[[v14 alloc] initWithFormat:v15 arguments:&a9];

    if (v13) {
      v17 = v13;
    }
    else {
      v17 = (void *)MEMORY[0x1E4F1CC08];
    }
    v18 = (void *)[v17 mutableCopy];
    [v18 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F1D140]];

    id v13 = v18;
  }
  v19 = [MEMORY[0x1E4F28C58] errorWithDomain:v12 code:a4 userInfo:v13];

  return v19;
}

- (id)br_errorDescription
{
  v2 = [a1 userInfo];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1D140]];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [a1 description];
  }
  id v6 = v5;

  return v6;
}

+ (id)br_errorWithDomain:()BRAdditions code:description:
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (a5)
  {
    v17 = &a9;
    id v12 = (objc_class *)NSString;
    id v13 = a5;
    v14 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&a9];

    uint64_t v18 = *MEMORY[0x1E4F1D140];
    v19[0] = v14;
    a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  }
  id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v11, a4, a5, v17);

  return v15;
}

+ (id)br_errorWithPOSIXCode:()BRAdditions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (__errnum < 0 || *MEMORY[0x1E4F14AA0] <= __errnum)
  {
    v8 = brc_bread_crumbs((uint64_t)"+[NSError(BRAdditions) br_errorWithPOSIXCode:]", 62);
    uint64_t v9 = brc_default_log(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[NSError(BRAdditions) br_errorWithPOSIXCode:]();
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F1D140];
  v4 = [NSString stringWithUTF8String:strerror(__errnum)];
  v11[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:__errnum userInfo:v5];

  return v6;
}

+ (id)br_errorWithPOSIXCode:()BRAdditions description:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v16 = &a9;
    uint64_t v10 = (objc_class *)NSString;
    id v11 = a4;
    id v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

    uint64_t v17 = *MEMORY[0x1E4F1D140];
    v18[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    id v13 = 0;
  }
  v14 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28798], a3, v13, v16);

  return v14;
}

+ (uint64_t)br_errorFromErrno
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v1 = *__error();

  return objc_msgSend(v0, "br_errorWithPOSIXCode:", v1);
}

- (BOOL)br_isCKErrorCode:()BRAdditions
{
  id v5 = [a1 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)br_isCKErrorCode:()BRAdditions underlyingErrorCode:
{
  if (!objc_msgSend(a1, "br_isCKErrorCode:")) {
    return 0;
  }
  BOOL v6 = [a1 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"NSUnderlyingError"];

  v8 = [v7 domain];
  if ([v8 isEqualToString:*MEMORY[0x1E4F19DD8]]) {
    BOOL v9 = [v7 code] == a4;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)br_isPOSIXErrorCode:()BRAdditions
{
  id v5 = [a1 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F28798]]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)br_isCocoaErrorCode:()BRAdditions
{
  id v5 = [a1 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)br_isNSXPCConnectionError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v3 = [a1 code] == 4099 || objc_msgSend(a1, "code") == 4097;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)br_isCloudDocsErrorCode:()BRAdditions
{
  id v5 = [a1 domain];
  if ([v5 isEqualToString:@"BRCloudDocsErrorDomain"]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)br_isFileProviderErrorCode:()BRAdditions
{
  id v5 = [a1 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F25C10]]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)br_isNSURLErrorCode:()BRAdditions
{
  id v5 = [a1 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F289A0]]) {
    BOOL v6 = [a1 code] == a3;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)br_underlyingPOSIXError
{
  v2 = [a1 domain];
  uint64_t v3 = *MEMORY[0x1E4F28798];
  int v4 = [v2 isEqualToString:*MEMORY[0x1E4F28798]];

  if (v4)
  {
    id v5 = a1;
  }
  else
  {
    BOOL v6 = [a1 userInfo];
    id v5 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    v7 = [v5 domain];
    [v7 isEqualToString:v3];
  }

  return v5;
}

+ (uint64_t)brc_errorNotSupportedInFPFS
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 66, @"SPI not supported for FPFS");
}

+ (uint64_t)brc_errorNoBRItemService
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 65, @"BRProtocol Service was not found for item");
}

+ (uint64_t)brc_errorLoggedOut
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOutWithUnderlyingError:", 0);
}

+ (uint64_t)brc_errorDaemonShouldBeLoggedOut
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 3, @"Logged in - iCloud Drive should not be logged in");
}

+ (id)brc_errorMethodNotImplemented:()BRAdditions
{
  int v4 = brc_bread_crumbs((uint64_t)"+[NSError(BRAdditions) brc_errorMethodNotImplemented:]", 177);
  id v5 = brc_default_log(0);
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
    +[NSError(BRAdditions) brc_errorMethodNotImplemented:v5];
  }

  BOOL v6 = (void *)MEMORY[0x1E4F28C58];
  v7 = NSStringFromSelector(a3);
  v8 = objc_msgSend(v6, "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 9, @"%@ not implemented", v7);

  return v8;
}

+ (uint64_t)brc_errorInvalidParameter:()BRAdditions value:
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 10, @"Invalid parameter '%@': %@", a3, a4);
}

+ (id)brc_errorNotOnDisk:()BRAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 27, @"Item hasn't been made live on disk: '%@'", a3);
  int v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F281F8];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  v10[0] = v3;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v4 errorWithDomain:v5 code:256 userInfo:v6];

  return v7;
}

+ (id)brc_errorNotInCloud:()BRAdditions
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28328];
  v11[0] = *MEMORY[0x1E4F1D140];
  v11[1] = v4;
  uint64_t v5 = @"nil";
  if (a3) {
    uint64_t v5 = a3;
  }
  v12[0] = @"Document hasn't yet been synced to the server";
  v12[1] = v5;
  BOOL v6 = (void *)MEMORY[0x1E4F1C9E8];
  v7 = a3;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v9 = [v3 errorWithDomain:@"BRCloudDocsErrorDomain" code:7 userInfo:v8];

  return v9;
}

+ (id)brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:()BRAdditions
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F1D140];
  v13[0] = @"Path is outside of any CloudDocs app library, will never sync";
  uint64_t v5 = *MEMORY[0x1E4F28328];
  v12[0] = v4;
  v12[1] = v5;
  uint64_t v6 = [a3 path];
  v7 = (void *)v6;
  v8 = @"nil";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v13[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v10 = [v3 errorWithDomain:@"BRCloudDocsErrorDomain" code:6 userInfo:v9];

  return v10;
}

+ (id)brc_errorPermissionError:()BRAdditions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  if (a3) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = &stru_1EF11DA20;
  }
  uint64_t v10 = *MEMORY[0x1E4F1D140];
  v11[0] = v4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v6 = a3;
  v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [v3 errorWithDomain:@"BRCloudDocsErrorDomain" code:8 userInfo:v7];

  return v8;
}

+ (id)brc_errorPermissionErrorAtURL:()BRAdditions
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F1D140];
  v13[0] = @"Permission error when trying to access path";
  uint64_t v5 = *MEMORY[0x1E4F28328];
  v12[0] = v4;
  v12[1] = v5;
  uint64_t v6 = [a3 path];
  v7 = (void *)v6;
  v8 = @"nil";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v13[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v10 = [v3 errorWithDomain:@"BRCloudDocsErrorDomain" code:8 userInfo:v9];

  return v10;
}

+ (id)brc_errorItemNotFound:()BRAdditions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    v8 = @"BRUnderlyingItemIdentifierKey";
    v9[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 14, v5, @"Item not found: '%@'", v4);

  return v6;
}

+ (id)brc_errorParentItemRemotelyDeleted:()BRAdditions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    v8 = @"BRUnderlyingItemIdentifierKey";
    v9[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 144, v5, @"Parent item remotely deleted: '%@'", v4);

  return v6;
}

+ (id)brc_errorUnexpectedItemType:()BRAdditions description:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v10 = @"BRUnderlyingItemIdentifierKey";
    v11[0] = v5;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 123, v7, @"%@", v6);

  return v8;
}

+ (uint64_t)brc_errorUnknownKey:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 25, @"Unknown key: '%@'", a3);
}

+ (uint64_t)brc_errorAppLibraryNotFound:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 12, @"App library not found: '%@'", a3);
}

+ (uint64_t)brc_errorNoAppLibraryForBundle:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 13, @"No app library for bundle '%@'", a3);
}

+ (uint64_t)brc_errorClientZoneNotFound:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 30, @"Client zone not found: '%@'", a3);
}

+ (uint64_t)brc_errorSyncDisabled:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 28, @"Sync is disabled for container: '%@'", a3);
}

+ (uint64_t)brc_errorNoSuitableClientApp
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 29, @"No suitable client app was found to open the document");
}

+ (uint64_t)brc_errorMDMRestrictsCrossPersonaClientApp
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 138, @"No suitable client app was found to open the document");
}

+ (id)brc_errorNoDocumentAtURL:()BRAdditions underlyingError:
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F1D140];
  v16[0] = @"No document at URL";
  uint64_t v7 = *MEMORY[0x1E4F28328];
  v15[0] = v6;
  v15[1] = v7;
  id v8 = a4;
  uint64_t v9 = [a3 path];
  uint64_t v10 = (void *)v9;
  id v11 = @"nil";
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  v15[2] = *MEMORY[0x1E4F28A50];
  v16[1] = v11;
  v16[2] = v8;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  id v13 = [v5 errorWithDomain:@"BRCloudDocsErrorDomain" code:5 userInfo:v12];

  return v13;
}

+ (id)brc_errorNoDocument:()BRAdditions underlyingPOSIXError:
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28328];
  v13[0] = *MEMORY[0x1E4F1D140];
  v13[1] = v6;
  uint64_t v7 = @"nil";
  if (a3) {
    uint64_t v7 = a3;
  }
  v14[0] = @"No document at path";
  v14[1] = v7;
  v13[2] = *MEMORY[0x1E4F28A50];
  id v8 = a3;
  uint64_t v9 = objc_msgSend(v5, "br_errorWithPOSIXCode:", a4);
  v14[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  id v11 = [v5 errorWithDomain:@"BRCloudDocsErrorDomain" code:5 userInfo:v10];

  return v11;
}

+ (id)brc_errorDocumentAtURL:()BRAdditions isNotExternalToAppLibrary:
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v5 stringWithFormat:@"Document is not external to app library %@", a4];
  id v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F1D140];
  v17[0] = v7;
  uint64_t v10 = *MEMORY[0x1E4F28328];
  v16[0] = v9;
  v16[1] = v10;
  id v11 = [v6 path];

  id v12 = @"nil";
  if (v11) {
    id v12 = v11;
  }
  v17[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v14 = [v8 errorWithDomain:@"BRCloudDocsErrorDomain" code:11 userInfo:v13];

  return v14;
}

+ (uint64_t)brc_errorDocumentIsNotShared
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 20, @"document is not shared");
}

+ (uint64_t)brc_errorDocumentIsNotSharedAtIdentifier:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 20, @"document is not shared at '%@'", a3);
}

+ (uint64_t)brc_errorDocumentIsNoLongerSharedAtIdentifier:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 24, @"document is no longer shared at '%@'", a3);
}

+ (uint64_t)brc_errorDocumentEvicted
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 61, @"document evicted");
}

+ (uint64_t)brc_errorAccountMismatch
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 4, @"Account mismatch");
}

+ (uint64_t)brc_errorDocumentWithFilename:()BRAdditions size:isTooLargeToUpload:
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 19, @"document '%@' of size:%lli is too large to upload (max size: %lli)", a3, a4, a5);
}

+ (uint64_t)brc_errorOperationCancelled
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 23, @"operation was cancelled");
}

+ (uint64_t)brc_errorDownloadCancelled
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F281F8], 3072, @"download was cancelled");
}

+ (uint64_t)brc_errorCompatibilityIssue
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 31, @"Compatibility issue prevent action");
}

+ (uint64_t)brc_errorAcceptAlreadyInProgressForURL:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 33, @"accept operation already in progress for %@", a3);
}

+ (uint64_t)brc_errorDriveDisabledOrAppLibraryDisabled
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 35, @"iCloud drive disabled or app library disabled");
}

+ (uint64_t)brc_errorSyncBlocked
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 36, @"Synchronization is blocked");
}

+ (uint64_t)brc_errorItemAlreadyPartOfAShare
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 37, @"Item is already part of a folder share");
}

+ (id)brc_errorFolderHasSharedSubitemsWithSharedByMeURLs:()BRAdditions sharedToMeURLs:
{
  void v13[3] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  v12[0] = @"BRFailedURLsKey";
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 arrayByAddingObjectsFromArray:v6];
  v13[0] = v8;
  v13[1] = v7;
  v12[1] = @"BRSharedByMeURLsKey";
  void v12[2] = @"BRSharedToMeURLsKey";
  v13[2] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  uint64_t v10 = objc_msgSend(v5, "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 38, v9, @"Folder has shared subitems");

  return v10;
}

+ (uint64_t)brc_errorFolderHasSharedSubitems
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 38, @"Folder has shared subitems");
}

+ (uint64_t)brc_errorFolderHierarchyTooDeep
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 44, @"Folder hierarchy is too deep");
}

+ (uint64_t)brc_errorItemNotShareable
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 45, @"Item is not eligible to be shared");
}

+ (uint64_t)brc_errorItemInTrash
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 39, @"Item is in the trash");
}

+ (id)brc_errorItemIneligibleFromSyncForInode:()BRAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  if (a3)
  {
    uint64_t v9 = @"inode";
    v10[0] = a3;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 43, v6, @"Item isn't eligible to sync");
  }
  else
  {
    id v6 = 0;
    id v7 = objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 43, 0, @"Item isn't eligible to sync");
  }

  return v7;
}

+ (id)brc_errorItemAlreadyPausedFromSyncByBundleID:()BRAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  if (a3)
  {
    uint64_t v9 = @"bundleID";
    v10[0] = a3;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 59, v6, @"Item is already paused from sync by another bundleID");
  }
  else
  {
    id v6 = 0;
    id v7 = objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 59, 0, @"Item is already paused from sync by another bundleID");
  }

  return v7;
}

+ (uint64_t)brc_errorItemNotPausedFromSync
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 60, @"Item isn't paused from sync");
}

+ (id)brc_addPartialError:()BRAdditions forURL:toError:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    v19 = @"BRPartialErrorsByURLKey";
    id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v20[0] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v10 = [v13 errorWithDomain:@"BRCloudDocsErrorDomain" code:21 userInfo:v12];
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v10 = v9;
  if ([v9 code] != 21)
  {
    id v11 = brc_bread_crumbs((uint64_t)"+[NSError(BRAdditions) brc_addPartialError:forURL:toError:]", 449);
    id v12 = brc_default_log(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      +[NSError(BRAdditions) brc_addPartialError:forURL:toError:]();
    }
    goto LABEL_6;
  }
LABEL_7:
  v14 = [v10 userInfo];
  id v15 = [v14 objectForKeyedSubscript:@"BRPartialErrorsByURLKey"];

  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v17 = brc_bread_crumbs((uint64_t)"+[NSError(BRAdditions) brc_addPartialError:forURL:toError:]", 453);
    uint64_t v18 = brc_default_log(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      +[NSError(BRAdditions) brc_addPartialError:forURL:toError:]();
    }
  }
  [v15 setObject:v7 forKey:v8];

  return v10;
}

+ (uint64_t)brc_errorItemChanged
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 40, @"Item changed");
}

+ (uint64_t)brc_errorCoreAnalyticsErrorCountMismatchWithExpected:()BRAdditions actual:
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 58, @"Error count mismatch.  Expected %@ actual %@", a3, a4);
}

+ (id)brc_errorCollisionWithItem:()BRAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  id v9 = @"BRUnderlyingItemKey";
  v10[0] = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v3 errorWithDomain:@"BRCloudDocsErrorDomain" code:63 userInfo:v6];

  return v7;
}

+ (id)brc_errorForRejectedDeletionOfItem:()BRAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  id v9 = @"BRUnderlyingItemKey";
  v10[0] = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v3 errorWithDomain:@"BRCloudDocsErrorDomain" code:64 userInfo:v6];

  return v7;
}

+ (uint64_t)brc_errorAccountSessionOpenFailed
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 84, @"Failed to open account session");
}

+ (uint64_t)brc_errorCorruptedDB
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 79, @"Corrupted DB");
}

+ (uint64_t)brc_errorBuddyFlowNeedsToRun
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 110, @"Device is not set up yet");
}

+ (uint64_t)brc_errorDocumentIsNotGreedy
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 101, @"Document is not greedy");
}

+ (uint64_t)brc_unkownErrorWithDescription:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 25, @"%@", a3);
}

+ (uint64_t)brc_errorItemProcessingDisabled
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 86, @"Item Processing Disabled");
}

+ (uint64_t)brc_errorDeletingNonEmptyDirectoryNonRecursively
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 87, @"Deleting Non Empty Directory Non Recursively");
}

+ (uint64_t)brc_errorExcludedFromSyncUnderRoot
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 82, @"Excluded From Sync Under Root");
}

+ (uint64_t)brc_errorExcludedFromSyncDueToFilename
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 83, @"Excluded From Sync Due To Filename");
}

+ (uint64_t)brc_errorNoEtagInContentSignature
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 88, @"No etag");
}

+ (uint64_t)brc_errorRequestedVersionHasLocalEdits
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 89, @"Requested Version for download has local edits");
}

+ (uint64_t)brc_errorNoEtagAvailableForDownloadOfItemWithIdentifier:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F281F8], 256, @"Etag is nil for %@", a3);
}

+ (uint64_t)brc_errorCantCallFPInSyncBubble
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 114, @"cant call fp in sync bubble");
}

+ (uint64_t)brc_errorRescheduleDownloadForMoreRecentServerVersion
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 115, @"reschedule download");
}

+ (uint64_t)brc_errorItemBusy
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:120 userInfo:0];
}

+ (uint64_t)brc_errorPostponeUpload
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:140 userInfo:0];
}

+ (uint64_t)brc_errorAcceptShareFailedForItem:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 130, @"Accept share failed for item %@", a3);
}

+ (id)brc_errorAcceptShareFailedWithUnderlyingError:()BRAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  v10[0] = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v3 errorWithDomain:@"BRCloudDocsErrorDomain" code:130 userInfo:v6];

  return v7;
}

+ (uint64_t)brc_errorCantCreateAsset
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:124 userInfo:0];
}

+ (uint64_t)brc_errorThrottledWithDescription:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 132, @"%@", a3);
}

+ (uint64_t)brc_errorThumbnailGenerationOperationTimedOut
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:133 userInfo:0];
}

+ (uint64_t)brc_errorStuckFPFSMigration
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:134 userInfo:0];
}

+ (uint64_t)brc_errorNotSupportedInCustomerBuild
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:102 userInfo:0];
}

+ (uint64_t)brc_errorZoneReset
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:103 userInfo:0];
}

+ (uint64_t)brc_errorOperationAlreadyRunning:()BRAdditions
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 136, @"operation %@ already running", a3);
}

+ (uint64_t)brc_errorTCCAccessDenied
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 141, @"Access denied");
}

+ (id)brc_errorFromException:()BRAdditions
{
  id v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = [v4 reason];

  id v7 = objc_msgSend(v3, "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 143, @"%@ - %@", v5, v6);

  return v7;
}

+ (uint64_t)brc_errorInitialScanItemBouncedByServer
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 145, @"Initial scan item got bounced by server");
}

+ (uint64_t)brc_errorInitialScanItemTypeMismatch
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 148, @"Initial scan item has a mismatch type");
}

+ (uint64_t)brc_errorRecordBouncedByServer
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 146, @"Server bounced CK record");
}

+ (uint64_t)brc_errorBouncedItemNotKnownByServer
{
  return objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", @"BRCloudDocsErrorDomain", 147, @"Server bounced CK record");
}

+ (uint64_t)brc_errorRecordValidation
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"BRCloudDocsErrorDomain" code:150 userInfo:0];
}

+ (id)brc_errorDamagedDocumentOnDiskWithUnderlyingError:()BRAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  if (a3)
  {
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    v10[0] = a3;
    id v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v7 = objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 151, v6, @"The current document on disk is damaged and needs recovery");
  }
  else
  {
    id v6 = 0;
    id v7 = objc_msgSend(v3, "br_errorWithDomain:code:userInfo:description:", @"BRCloudDocsErrorDomain", 151, 0, @"The current document on disk is damaged and needs recovery");
  }

  return v7;
}

+ (void)br_errorWithPOSIXCode:()BRAdditions .cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: code >= 0 && code < sys_nerr%@", v2, v3, v4, v5, v6);
}

+ (void)brc_errorMethodNotImplemented:()BRAdditions .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_4();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_19ED3F000, a3, (os_log_type_t)0x90u, "[ERROR] method not implemented: %@%@", v6, 0x16u);
}

+ (void)brc_addPartialError:()BRAdditions forURL:toError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: dict && [dict isKindOfClass:[NSMutableDictionary class]]%@", v2, v3, v4, v5, v6);
}

+ (void)brc_addPartialError:()BRAdditions forURL:toError:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: existingError.code == BRErrorPartialFailure%@", v2, v3, v4, v5, v6);
}

@end