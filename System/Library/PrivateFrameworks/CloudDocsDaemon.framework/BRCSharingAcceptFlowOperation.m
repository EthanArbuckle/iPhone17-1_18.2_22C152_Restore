@interface BRCSharingAcceptFlowOperation
+ (id)_runningShareIDs;
- (BOOL)_isDirectoryLinkInsideFolderShare;
- (BOOL)_isDocumentLinkInsideFolderShare;
- (BOOL)_isFolderShare;
- (BOOL)_isLinkInsideFolderShare;
- (BOOL)_isOwner;
- (BOOL)_isOwnerOrShareAlreadyAccepted;
- (BOOL)_isiWorkLinkInsideFolderShare;
- (BOOL)_isiWorkShare;
- (BOOL)shouldRetryForError:(id)a3;
- (BOOL)skipOpenInApp;
- (BRCSharingAcceptFlowOperation)initWithShareMetadata:(id)a3 client:(id)a4 session:(id)a5 userNotifier:(id)a6 userActionsNavigator:(id)a7;
- (NSString)identifier;
- (id)_stepNameAtIndex:(unint64_t)a3 withPrefix:(id)a4;
- (id)createActivity;
- (id)subclassableDescriptionWithContext:(id)a3;
- (void)_activateSharedZoneIfNeeded;
- (void)_captureOpenInfoFromItem:(id)a3;
- (void)_completeWithError:(id)a3;
- (void)_createServerFaultIfPossibleWithCompletion:(id)a3;
- (void)_createSideFaultOnDisk_step;
- (void)_endAcceptationFlow_step;
- (void)_finishShareAccept_step;
- (void)_isAccountRestricted_step;
- (void)_isAppInstalled_step;
- (void)_isFolderSharingSupported_step;
- (void)_isUserSignedInToiCloudDrive_step;
- (void)_isiWorkShare;
- (void)_jumpToSelector:(SEL)a3;
- (void)_jumpToSelectorInQueue:(SEL)a3;
- (void)_locateSharedItemOnDisk_step;
- (void)_locateSharedItemOnOwner_step;
- (void)_locateSharedItemOnRecipient_step;
- (void)_openDocumentInDocumentsAppIfInstalled:(id)a3;
- (void)_openSharedItemIfStillNeeded_step;
- (void)_openSharedSideFaultFileWithAppID:(id)a3;
- (void)_openSharedSideFaultFile_step;
- (void)_openiWorkAppPreemptively_step;
- (void)_parseShareMetadata_step;
- (void)_performNextStep;
- (void)_performNextStepInQueue;
- (void)_prepareToDownloadSharedDocument_step;
- (void)_setSpotlightAttribute_step;
- (void)_showSharingJoinDialog_step;
- (void)_startShareAccept_step;
- (void)_waitForSharedItemToBeOnDiskOnOwner_step;
- (void)_waitForSharedItemToBeOnDiskOnRecipient_step;
- (void)_waitForSharedItemToSyncDownOnOwner_step;
- (void)_waitForSharedItemToSyncDownOnRecipient_step;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)moveDialogToFront;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
- (void)setSkipOpenInApp:(BOOL)a3;
@end

@implementation BRCSharingAcceptFlowOperation

- (BRCSharingAcceptFlowOperation)initWithShareMetadata:(id)a3 client:(id)a4 session:(id)a5 userNotifier:(id)a6 userActionsNavigator:(id)a7
{
  id v13 = a3;
  id v29 = a4;
  id v14 = a5;
  id v28 = a6;
  id v27 = a7;
  v15 = [v14 syncContextProvider];
  v16 = [v15 sharedMetadataSyncContext];
  v30.receiver = self;
  v30.super_class = (Class)BRCSharingAcceptFlowOperation;
  v17 = [(_BRCOperation *)&v30 initWithName:@"sharing/accept-flow" syncContext:v16 sessionContext:v14];

  if (v17)
  {
    v18 = [v13 share];
    uint64_t v19 = [v18 URL];
    shareURL = v17->_shareURL;
    v17->_shareURL = (NSURL *)v19;

    objc_storeStrong((id *)&v17->_shareMetadata, a3);
    objc_storeStrong((id *)&v17->_session, a5);
    [(_BRCOperation *)v17 setNonDiscretionary:1];
    [(BRCSharingAcceptFlowOperation *)v17 setQueuePriority:8];
    objc_storeStrong((id *)&v17->_xpcClient, a4);
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("accept-flow-next-step", v21);

    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v22;

    v24 = objc_msgSend(MEMORY[0x1E4F1A218], "br_sharingMisc");
    [(_BRCOperation *)v17 setGroup:v24];

    v25 = +[BRCUserDefaults defaultsForMangledID:0];
    v17->_allowsDirectoryFaults = [v25 forceDeltaInitialSync] ^ 1;

    objc_storeStrong((id *)&v17->_userNotification, a6);
    objc_storeStrong((id *)&v17->_userActionsNavigator, a7);
    v17->_hadProcessedCompletionError = 0;
  }

  return v17;
}

- (void)moveDialogToFront
{
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sharing/accept-flow", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (NSString)identifier
{
  return (NSString *)@"com.apple.clouddocs.accept-shared-url";
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)_stepNameAtIndex:(unint64_t)a3 withPrefix:(id)a4
{
  id v6 = a4;
  if ([(NSArray *)self->_acceptationFlow count])
  {
    if ([(NSArray *)self->_acceptationFlow count] <= a3)
    {
      v10 = @"complete";
    }
    else
    {
      v7 = [(NSArray *)self->_acceptationFlow objectAtIndexedSubscript:a3];
      v8 = [v7 stringByReplacingOccurrencesOfString:@"_" withString:&stru_1F2AC7720];

      if (v6)
      {
        v9 = [NSString stringWithFormat:@"%@:%@", v6, v8];
      }
      else
      {
        v9 = v8;
      }
      v10 = v9;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)subclassableDescriptionWithContext:(id)a3
{
  unint64_t stepIndex = self->_stepIndex;
  BOOL v4 = stepIndex != 0;
  unint64_t v5 = stepIndex - 1;
  if (v4) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 0;
  }
  return [(BRCSharingAcceptFlowOperation *)self _stepNameAtIndex:v6 withPrefix:@"step:"];
}

- (void)_completeWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v50 = brc_bread_crumbs();
    v51 = brc_default_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.5();
    }
  }
  self->_hadProcessedCompletionError = 1;
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke;
  v81[3] = &unk_1E6994740;
  v81[4] = self;
  unint64_t v5 = (void (**)(void, void))MEMORY[0x1D94389C0](v81);
  unint64_t v6 = [v4 domain];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F592A8]];

  if (!v7)
  {
    id v13 = [v4 domain];
    int v14 = [v13 isEqualToString:*MEMORY[0x1E4F19C40]];

    if (v14)
    {
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 3))
      {
        userNotification = self->_userNotification;
        shareMetadata = self->_shareMetadata;
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_48;
        v68[3] = &unk_1E6993628;
        v68[4] = self;
        id v69 = v4;
        [(BRCUserNotifier *)userNotification showErrorDeviceOfflineForShareMetadata:shareMetadata reply:v68];
        v12 = v69;
        goto LABEL_41;
      }
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 4))
      {
        v26 = self->_userNotification;
        id v27 = self->_shareMetadata;
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_49;
        v66[3] = &unk_1E6993628;
        v66[4] = self;
        id v67 = v4;
        [(BRCUserNotifier *)v26 showErrorServerNotReachableForShareMetadata:v27 reply:v66];
        v12 = v67;
        goto LABEL_41;
      }
      if (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 29))
      {
        v41 = self->_userNotification;
        v42 = self->_shareMetadata;
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_3;
        v63[3] = &unk_1E6999400;
        v65 = v5;
        v63[4] = self;
        id v64 = v4;
        [(BRCUserNotifier *)v41 showErrorParticipantLimitReachedForShareMetadata:v42 reply:v63];

        v12 = v65;
        goto LABEL_41;
      }
      if ((objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 32) & 1) != 0
        || (objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 11) & 1) != 0
        || objc_msgSend(v4, "brc_containsCloudKitErrorCode:", 10))
      {
        v45 = self->_userNotification;
        v46 = self->_shareMetadata;
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_4;
        v61[3] = &unk_1E6993628;
        v61[4] = self;
        id v62 = v4;
        [(BRCUserNotifier *)v45 showErrorItemUnavailableOrAccessRestrictedForShareMetadata:v46 reply:v61];
        v12 = v62;
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v19 = [v4 domain];
      int v20 = [v19 isEqualToString:*MEMORY[0x1E4F28798]];

      if (v20)
      {
        uint64_t v21 = [v4 code];
        if (v21 == 35)
        {
          v43 = self->_userNotification;
          v44 = self->_shareMetadata;
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_6;
          v56[3] = &unk_1E6993628;
          v56[4] = self;
          id v57 = v4;
          [(BRCUserNotifier *)v43 showErrorReasonUnknownForShareMetadata:v44 reply:v56];
          v12 = v57;
          goto LABEL_41;
        }
        if (v21 == 1)
        {
          dispatch_queue_t v22 = self->_userNotification;
          v23 = self->_shareMetadata;
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_5;
          v58[3] = &unk_1E6999428;
          v60 = v5;
          v58[4] = self;
          id v59 = v4;
          [(BRCUserNotifier *)v22 showErrorNativeAppDisabledByProfileForShareMetadata:v23 reply:v58];

          v12 = v60;
          goto LABEL_41;
        }
      }
    }
    goto LABEL_42;
  }
  uint64_t v8 = [v4 code];
  v9 = @"appMissing";
  if (v8 <= 32)
  {
    if (v8 <= 22)
    {
      if (v8 != 1)
      {
        if (v8 == 2)
        {
          v10 = self->_userNotification;
          v11 = self->_shareMetadata;
          v73[0] = MEMORY[0x1E4F143A8];
          v73[1] = 3221225472;
          v73[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_46;
          v73[3] = &unk_1E69993D8;
          v73[4] = self;
          v75 = v5;
          id v74 = v4;
          [(BRCUserNotifier *)v10 showErrorSignInToiCloudForShareMetadata:v11 reply:v73];

          v12 = v75;
LABEL_41:

          goto LABEL_45;
        }
        goto LABEL_42;
      }
LABEL_43:
      ((void (**)(void, __CFString *))v5)[2](v5, v9);
      goto LABEL_44;
    }
    if (v8 != 23)
    {
      if (v8 == 29)
      {
        v24 = self->_userNotification;
        v25 = self->_shareMetadata;
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2;
        v76[3] = &unk_1E69993D8;
        v76[4] = self;
        v78 = v5;
        id v77 = v4;
        [(BRCUserNotifier *)v24 showErrorInstallNativeAppForShareMetadata:v25 reply:v76];

        v12 = v78;
        goto LABEL_41;
      }
      goto LABEL_42;
    }
LABEL_44:
    [(_BRCOperation *)self completedWithResult:0 error:v4];
    goto LABEL_45;
  }
  if (v8 <= 129)
  {
    if (v8 != 33)
    {
      if (v8 == 35)
      {
        v17 = self->_userNotification;
        v18 = self->_shareMetadata;
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_47;
        v70[3] = &unk_1E69993D8;
        v70[4] = self;
        v72 = v5;
        id v71 = v4;
        [(BRCUserNotifier *)v17 showErrorTurnOniCloudDriveForShareMetadata:v18 reply:v70];

        v12 = v72;
        goto LABEL_41;
      }
      goto LABEL_42;
    }
    goto LABEL_44;
  }
  if (v8 == 138) {
    goto LABEL_43;
  }
  if (v8 != 130)
  {
LABEL_42:
    v9 = @"other";
    goto LABEL_43;
  }
  id v28 = v4;
  id v29 = [v28 underlyingErrors];
  uint64_t v30 = [v29 count];

  if (v30 != 1)
  {
    v52 = brc_bread_crumbs();
    v53 = brc_default_log();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:].cold.4();
    }
  }
  v31 = [v28 underlyingErrors];
  uint64_t v32 = [v31 count];

  if (v32 == 1)
  {
    v33 = [v28 underlyingErrors];
    uint64_t v34 = [v33 objectAtIndexedSubscript:0];

    id v28 = (id)v34;
  }
  if (!self->_shareMetadata)
  {
    v54 = brc_bread_crumbs();
    v55 = brc_default_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:]();
    }
  }
  v35 = brc_bread_crumbs();
  v36 = brc_default_log();
  if (os_log_type_enabled(v36, (os_log_type_t)0x90u)) {
    -[BRCSharingAcceptFlowOperation _completeWithError:]((uint64_t)v28);
  }

  v37 = +[BRCSystemResourcesManager manager];
  char v38 = [v37 isNetworkReachable];

  if (v38)
  {
    v39 = self->_userNotification;
    v40 = self->_shareMetadata;
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_43;
    v79[3] = &unk_1E6993628;
    v79[4] = self;
    id v80 = v28;
    [(BRCUserNotifier *)v39 showErrorReasonUnknownForShareMetadata:v40 reply:v79];
  }
  else
  {
    v47 = brc_bread_crumbs();
    v48 = brc_default_log();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:]();
    }

    v49 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:3 userInfo:0];
    [(_BRCOperation *)self completedWithResult:0 error:v49];
  }
LABEL_45:
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  unint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_cold_1((uint64_t)v3);
  }

  [*(id *)(*(void *)(a1 + 32) + 512) openShareURLInWebBrowser:*(void *)(*(void *)(a1 + 32) + 544) withReason:v3];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_43(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2 && a3)
  {
    v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_2();
    }

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 544);
    if (!v9)
    {
      int v14 = brc_bread_crumbs();
      v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1();
      }

      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 544);
    }
    v10 = *(void **)(v8 + 512);
    v11 = objc_msgSend(v9, "brc_applicationBundleID");
    [v10 openAppStoreForBundleID:v11];

    goto LABEL_11;
  }
  if (a3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_11:
  [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_46(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2 && a3)
  {
    uint64_t v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_46_cold_1();
    }

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    [*(id *)(*(void *)(a1 + 32) + 512) openiCloudSettings];
    goto LABEL_10;
  }
  if (a3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_10:
  [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_47(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2 && a3)
  {
    uint64_t v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_46_cold_1();
    }

    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    [*(id *)(*(void *)(a1 + 32) + 512) openiCloudSettings];
    goto LABEL_10;
  }
  if (a3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_10:
  [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_49(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_3(void *a1, int a2)
{
  if (a2) {
    (*(void (**)(void))(a1[6] + 16))();
  }
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  return [v3 completedWithResult:0 error:v4];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_5(void *a1, int a2)
{
  if (a2) {
    (*(void (**)(void))(a1[6] + 16))();
  }
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  return [v3 completedWithResult:0 error:v4];
}

uint64_t __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(a1 + 40)];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(BRCSharingAcceptFlowOperation *)self _isFolderShare])
  {
    uint64_t v8 = @"folderShare-";
  }
  else if ([(BRCSharingAcceptFlowOperation *)self _isiWorkShare])
  {
    uint64_t v8 = @"iWorkShare-";
  }
  else
  {
    uint64_t v8 = @"documentShare-";
  }
  v9 = [(BRCSharingAcceptFlowOperation *)self _stepNameAtIndex:self->_stepIndex withPrefix:0];
  v10 = [(__CFString *)v8 stringByAppendingString:v9];

  if (v7)
  {
    v11 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      shareURL = self->_shareURL;
      *(_DWORD *)buf = 138412802;
      v33 = shareURL;
      __int16 v34 = 2112;
      id v35 = v7;
      __int16 v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] share acceptation %@ failed with error %@%@", buf, 0x20u);
    }

    if (([(BRCSharingAcceptFlowOperation *)self isCancelled] & 1) == 0
      && !self->_hadProcessedCompletionError)
    {
      id v28 = brc_bread_crumbs();
      id v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        -[BRCSharingAcceptFlowOperation finishWithResult:error:]();
      }
    }
    [(BRCSharingAcceptFlowOperation *)self _activateSharedZoneIfNeeded];
    int v14 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
    session = self->_session;
    if (session && ![(BRCAccountSession *)session isCancelled])
    {
      if (v14)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke;
        block[3] = &unk_1E6993698;
        block[4] = self;
        dispatch_async(v14, block);
      }
      else
      {
        v26 = brc_bread_crumbs();
        id v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
          -[BRCSharingAcceptFlowOperation finishWithResult:error:]();
        }
      }
    }
  }
  else
  {
    int v14 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_shareURL;
      v18 = [(NSURL *)self->_liveFileURL path];
      *(_DWORD *)buf = 138412802;
      v33 = v17;
      __int16 v34 = 2112;
      id v35 = v18;
      __int16 v36 = 2112;
      v37 = v14;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[NOTICE] share acceptation %@ succeed and document is now live on disk at %@%@", buf, 0x20u);
    }
  }

  uint64_t v19 = +[BRCEventsAnalytics sharedAnalytics];
  int v20 = [(BRCClientZone *)self->_clientZone mangledID];
  BOOL v21 = [(BRCClientZone *)self->_clientZone enhancedDrivePrivacyEnabled];
  dispatch_queue_t v22 = [(BRCItemID *)self->_linkItemID itemIDString];
  v23 = [(BRCAccountSession *)self->_session analyticsReporter];
  [v19 registerAndSendNewShareAcceptationWithLastStep:v10 zoneMangledID:v20 enhancedDrivePrivacyEnabled:v21 itemIDString:v22 error:v7 analyticsReporter:v23];

  [(BRCAppLibrary *)self->_appLibrary removeForegroundClient:self];
  if (![(BRCSharingAcceptFlowOperation *)self _isOwner])
  {
    v24 = [(BRCClientZone *)self->_clientZone serverZone];
    [v24 removeForegroundClient:self];
  }
  [(BRCUserNotifier *)self->_userNotification close];
  if (self->_shareID)
  {
    id v25 = +[BRCSharingAcceptFlowOperation _runningShareIDs];
    objc_sync_enter(v25);
    [v25 removeObject:self->_shareID];
    objc_sync_exit(v25);
  }
  v30.receiver = self;
  v30.super_class = (Class)BRCSharingAcceptFlowOperation;
  [(_BRCOperation *)&v30 finishWithResult:v6 error:v7];
}

void __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 576))
  {
    id v3 = objc_msgSend(*(id *)(v2 + 600), "itemByItemID:");
    uint64_t v4 = v3;
    if (v3 && [v3 isShareAcceptationFault])
    {
      unint64_t v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1();
      }

      id v7 = [v4 asShareAcceptationFault];
      [v7 deleteShareAcceptationFault];
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if ([(id)v2 _isLinkInsideFolderShare])
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(void *)(v8 + 584))
    {
      v9 = objc_msgSend(*(id *)(v8 + 600), "itemByItemID:");
      v10 = v9;
      if (v9 && [v9 isShareAcceptationFault])
      {
        v11 = brc_bread_crumbs();
        v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1();
        }

        id v13 = [v10 asShareAcceptationFault];
        [v13 deleteShareAcceptationFault];
      }
    }
  }
}

- (void)main
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    shareURL = self->_shareURL;
    *(_DWORD *)buf = 138412546;
    v39 = shareURL;
    __int16 v40 = 2112;
    v41 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] User clicked on share link %@%@", buf, 0x16u);
  }

  if ([(BRCSharingAcceptFlowOperation *)self _isFolderShare])
  {
    uint64_t v24 = NSStringFromSelector(sel__isAppInstalled_step);
    v37[0] = v24;
    uint64_t v22 = NSStringFromSelector(sel__isFolderSharingSupported_step);
    v37[1] = v22;
    __int16 v34 = NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
    v37[2] = v34;
    v33 = NSStringFromSelector(sel__showSharingJoinDialog_step);
    v37[3] = v33;
    uint64_t v32 = NSStringFromSelector(sel__parseShareMetadata_step);
    v37[4] = v32;
    v31 = NSStringFromSelector(sel__startShareAccept_step);
    v37[5] = v31;
    objc_super v30 = NSStringFromSelector(sel__openiWorkAppPreemptively_step);
    v37[6] = v30;
    id v29 = NSStringFromSelector(sel__locateSharedItemOnOwner_step);
    v37[7] = v29;
    id v28 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
    v37[8] = v28;
    id v27 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
    v37[9] = v27;
    v26 = NSStringFromSelector(sel__createSideFaultOnDisk_step);
    v37[10] = v26;
    id v25 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
    v37[11] = v25;
    id v6 = NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
    v37[12] = v6;
    id v7 = NSStringFromSelector(sel__openSharedSideFaultFile_step);
    v37[13] = v7;
    uint64_t v8 = NSStringFromSelector(sel__finishShareAccept_step);
    v37[14] = v8;
    v9 = NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
    v37[15] = v9;
    v10 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
    v37[16] = v10;
    v11 = NSStringFromSelector(sel__locateSharedItemOnDisk_step);
    v37[17] = v11;
    acceptationFlow = NSStringFromSelector(sel__setSpotlightAttribute_step);
    v37[18] = acceptationFlow;
    id v13 = NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
    v37[19] = v13;
    int v14 = NSStringFromSelector(sel__endAcceptationFlow_step);
    v37[20] = v14;
    v15 = (void *)MEMORY[0x1E4F1C978];
    v16 = v37;
  }
  else
  {
    if (![(BRCSharingAcceptFlowOperation *)self _isiWorkShare])
    {
      int v20 = NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
      v35[0] = v20;
      uint64_t v19 = NSStringFromSelector(sel__showSharingJoinDialog_step);
      v35[1] = v19;
      __int16 v34 = NSStringFromSelector(sel__parseShareMetadata_step);
      v35[2] = v34;
      v33 = NSStringFromSelector(sel__startShareAccept_step);
      v35[3] = v33;
      uint64_t v32 = NSStringFromSelector(sel__locateSharedItemOnOwner_step);
      v35[4] = v32;
      v31 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
      v35[5] = v31;
      objc_super v30 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
      v35[6] = v30;
      id v29 = NSStringFromSelector(sel__createSideFaultOnDisk_step);
      v35[7] = v29;
      id v28 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
      v35[8] = v28;
      id v27 = NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
      v35[9] = v27;
      v26 = NSStringFromSelector(sel__openSharedSideFaultFile_step);
      v35[10] = v26;
      id v25 = NSStringFromSelector(sel__finishShareAccept_step);
      v35[11] = v25;
      id v6 = NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
      v35[12] = v6;
      id v7 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
      v35[13] = v7;
      uint64_t v8 = NSStringFromSelector(sel__prepareToDownloadSharedDocument_step);
      v35[14] = v8;
      v9 = NSStringFromSelector(sel__setSpotlightAttribute_step);
      v35[15] = v9;
      v10 = NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
      v35[16] = v10;
      v11 = NSStringFromSelector(sel__endAcceptationFlow_step);
      v35[17] = v11;
      BOOL v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:18];
      acceptationFlow = self->_acceptationFlow;
      self->_acceptationFlow = v21;
      goto LABEL_9;
    }
    uint64_t v24 = NSStringFromSelector(sel__isAppInstalled_step);
    v36[0] = v24;
    uint64_t v22 = NSStringFromSelector(sel__isUserSignedInToiCloudDrive_step);
    v36[1] = v22;
    __int16 v34 = NSStringFromSelector(sel__isAccountRestricted_step);
    v36[2] = v34;
    v33 = NSStringFromSelector(sel__showSharingJoinDialog_step);
    v36[3] = v33;
    uint64_t v32 = NSStringFromSelector(sel__parseShareMetadata_step);
    v36[4] = v32;
    v31 = NSStringFromSelector(sel__startShareAccept_step);
    v36[5] = v31;
    objc_super v30 = NSStringFromSelector(sel__openiWorkAppPreemptively_step);
    v36[6] = v30;
    id v29 = NSStringFromSelector(sel__locateSharedItemOnOwner_step);
    v36[7] = v29;
    id v28 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnOwner_step);
    v36[8] = v28;
    id v27 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnOwner_step);
    v36[9] = v27;
    v26 = NSStringFromSelector(sel__createSideFaultOnDisk_step);
    v36[10] = v26;
    id v25 = NSStringFromSelector(sel__waitForSharedItemToBeOnDiskOnRecipient_step);
    v36[11] = v25;
    id v6 = NSStringFromSelector(sel__checkIfShouldWaitUntilDownloadCompletion_step);
    v36[12] = v6;
    id v7 = NSStringFromSelector(sel__openSharedSideFaultFile_step);
    v36[13] = v7;
    uint64_t v8 = NSStringFromSelector(sel__finishShareAccept_step);
    v36[14] = v8;
    v9 = NSStringFromSelector(sel__locateSharedItemOnRecipient_step);
    v36[15] = v9;
    v10 = NSStringFromSelector(sel__waitForSharedItemToSyncDownOnRecipient_step);
    v36[16] = v10;
    v11 = NSStringFromSelector(sel__prepareToDownloadSharedDocument_step);
    v36[17] = v11;
    acceptationFlow = NSStringFromSelector(sel__setSpotlightAttribute_step);
    v36[18] = acceptationFlow;
    id v13 = NSStringFromSelector(sel__openSharedItemIfStillNeeded_step);
    v36[19] = v13;
    int v14 = NSStringFromSelector(sel__endAcceptationFlow_step);
    v36[20] = v14;
    v15 = (void *)MEMORY[0x1E4F1C978];
    v16 = v36;
  }
  objc_msgSend(v15, "arrayWithObjects:count:", v16, 21, v22);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v18 = self->_acceptationFlow;
  self->_acceptationFlow = v17;

  uint64_t v19 = v23;
  int v20 = (void *)v24;
LABEL_9:

  self->_unint64_t stepIndex = 0;
  [(BRCSharingAcceptFlowOperation *)self _performNextStep];
}

- (void)_performNextStepInQueue
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Accept flow completed successfully.%@", v2, v3, v4, v5, v6);
}

- (void)_performNextStep
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__BRCSharingAcceptFlowOperation__performNextStep__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__BRCSharingAcceptFlowOperation__performNextStep__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStepInQueue];
}

- (void)_jumpToSelectorInQueue:(SEL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NSStringFromSelector(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = -[NSArray indexOfObject:](self->_acceptationFlow, "indexOfObject:");
  if (v5 >= [(NSArray *)self->_acceptationFlow count])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 84, @"can't fast forward to download step (currentIndex: %lu, downloadIndex: %lu, stepCount: %lu)", self->_stepIndex, v5, -[NSArray count](self->_acceptationFlow, "count"));
  }
  else
  {
    if (self->_stepIndex < v5)
    {
      self->_unint64_t stepIndex = v5;
      [(BRCSharingAcceptFlowOperation *)self _performNextStepInQueue];
      goto LABEL_7;
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 10, @"can't fast forward to download step from current position (currentIndex: %lu)", self->_stepIndex);
  }
  id v7 = (void *)v6;
  [(BRCSharingAcceptFlowOperation *)self _completeWithError:v6];

LABEL_7:
}

- (void)_jumpToSelector:(SEL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__BRCSharingAcceptFlowOperation__jumpToSelector___block_invoke;
  v4[3] = &unk_1E6995308;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __49__BRCSharingAcceptFlowOperation__jumpToSelector___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _jumpToSelectorInQueue:*(void *)(a1 + 40)];
}

- (BOOL)_isOwner
{
  shareMetadata = self->_shareMetadata;
  if (!shareMetadata)
  {
    unint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:]();
    }

    shareMetadata = self->_shareMetadata;
  }
  return [(CKShareMetadata *)shareMetadata participantRole] == CKShareParticipantRoleOwner;
}

- (BOOL)_isOwnerOrShareAlreadyAccepted
{
  shareMetadata = self->_shareMetadata;
  if (!shareMetadata)
  {
    unint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _completeWithError:]();
    }

    shareMetadata = self->_shareMetadata;
  }
  uint64_t v4 = [(CKShareMetadata *)shareMetadata participantRole];
  if (v4 != 1) {
    LOBYTE(v4) = [(CKShareMetadata *)self->_shareMetadata participantStatus] == CKShareParticipantAcceptanceStatusAccepted;
  }
  return v4;
}

- (BOOL)_isFolderShare
{
  uint64_t v2 = [(CKShareMetadata *)self->_shareMetadata share];
  char v3 = [v2 isFolderShare];

  return v3;
}

- (BOOL)_isLinkInsideFolderShare
{
  if ([(BRCSharingAcceptFlowOperation *)self _isFolderShare])
  {
    char v3 = [(CKShareMetadata *)self->_shareMetadata sharedItemHierarchyIDs];
    uint64_t v4 = [v3 lastObject];
    unint64_t v5 = objc_msgSend(v4, "brc_itemIDWithSession:", self->_session);

    uint64_t v6 = [(CKRecordID *)self->_shareID brc_shareItemID];
    if (v5) {
      int v7 = [v5 isEqualToItemID:v6] ^ 1;
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)_isDocumentLinkInsideFolderShare
{
  BOOL v3 = [(BRCSharingAcceptFlowOperation *)self _isLinkInsideFolderShare];
  if (v3)
  {
    uint64_t v4 = [(CKShareMetadata *)self->_shareMetadata sharedItemHierarchyIDs];
    unint64_t v5 = [v4 lastObject];

    uint64_t v6 = [v5 recordName];
    char v7 = [v6 hasPrefix:@"documentContent/"];

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (BOOL)_isDirectoryLinkInsideFolderShare
{
  if (![(BRCSharingAcceptFlowOperation *)self _isFolderShare]) {
    return 0;
  }
  BOOL v3 = [(CKShareMetadata *)self->_shareMetadata sharedItemHierarchyIDs];
  uint64_t v4 = [v3 lastObject];

  unint64_t v5 = objc_msgSend(v4, "brc_itemIDWithSession:", self->_session);
  uint64_t v6 = [(CKRecordID *)self->_shareID brc_shareItemID];
  if ([v5 isEqualToItemID:v6])
  {
    char v7 = [v4 recordName];
    char v8 = [v7 hasPrefix:@"directory/"];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_isiWorkLinkInsideFolderShare
{
  if (![(BRCSharingAcceptFlowOperation *)self _isDocumentLinkInsideFolderShare]) {
    return 0;
  }
  BOOL v3 = [(NSURL *)self->_shareURL brc_applicationContainerID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_isiWorkShare
{
  shareMetadata = self->_shareMetadata;
  if (shareMetadata)
  {
    BOOL v4 = [(CKShareMetadata *)shareMetadata share];
    char v5 = [v4 isFolderShare];

    if (v5) {
      return 0;
    }
    uint64_t v6 = [(CKShareMetadata *)self->_shareMetadata share];
    char v7 = [v6 URL];
    char v8 = objc_msgSend(v7, "brc_applicationName");

    if (!v8)
    {
      return 0;
    }
    else
    {
      v9 = [(CKShareMetadata *)self->_shareMetadata share];
      v10 = objc_msgSend(v9, "brc_sharedRootExtension");

      if (v10)
      {
        v11 = (void *)MEMORY[0x1E4F1CAD0];
        v12 = [MEMORY[0x1E4F59560] iWorkShareableExtensions];
        id v13 = [v11 setWithArray:v12];

        char v14 = [v13 containsObject:v10];
      }
      else
      {
        char v14 = 1;
      }
    }
  }
  else
  {
    shareURL = self->_shareURL;
    if (!shareURL)
    {
      v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[BRCSharingAcceptFlowOperation _isiWorkShare]();
      }

      shareURL = self->_shareURL;
    }
    v16 = [(NSURL *)shareURL brc_applicationContainerID];
    char v14 = v16 != 0;
  }
  return v14;
}

- (void)_captureOpenInfoFromItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [[BRCItemToPathLookup alloc] initWithItem:v4];
  uint64_t v6 = [(BRCItemToPathLookup *)v5 coordinatedWriteURL];
  liveFileURL = self->_liveFileURL;
  self->_liveFileURL = v6;

  [(BRCItemToPathLookup *)v5 closePaths];
  char v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [(NSURL *)self->_liveFileURL path];
    int v11 = 138412802;
    v12 = v10;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] share item URL is %@ for %@%@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)_activateSharedZoneIfNeeded
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx activating shared zone%@");
}

uint64_t __60__BRCSharingAcceptFlowOperation__activateSharedZoneIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 600) resume];
}

- (void)openResourceOperationDidComplete:(id)a3
{
  id v4 = brc_bread_crumbs();
  char v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingAcceptFlowOperation openResourceOperationDidComplete:]();
  }

  [(BRCSharingAcceptFlowOperation *)self _performNextStep];
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = brc_bread_crumbs();
  char v7 = brc_default_log();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
    -[BRCSharingAcceptFlowOperation openResourceOperation:didFailWithError:]((uint64_t)v5);
  }

  char v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAcceptShareFailedWithUnderlyingError:", v5);
  [(BRCSharingAcceptFlowOperation *)self _completeWithError:v8];
}

- (void)_isFolderSharingSupported_step
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx checking if document sharing is supported%@");
}

- (void)_isAppInstalled_step
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Check if app is installed%@");
}

- (void)_isUserSignedInToiCloudDrive_step
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Check if a user is signed in to iCloud and iCloud Drive is turned on%@");
}

- (void)_isAccountRestricted_step
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Check if app is profile disabled%@");
}

- (void)_showSharingJoinDialog_step
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Show sharing join dialog%@");
}

void __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) _completeWithError:v5];
  }
  else
  {
    if (a2)
    {
      uint64_t v6 = brc_bread_crumbs();
      char v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 544);
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v8;
        __int16 v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] User has accepted to open shared document at %@%@", buf, 0x16u);
      }

      v9 = [*(id *)(a1 + 32) callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke_139;
      block[3] = &unk_1E6993698;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(v9, block);
    }
    else
    {
      v10 = brc_bread_crumbs();
      int v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 544);
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v12;
        __int16 v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] User has refused to open shared document at %@%@", buf, 0x16u);
      }

      __int16 v13 = *(void **)(a1 + 32);
      v9 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
      [v13 _completeWithError:v9];
    }
  }
}

uint64_t __60__BRCSharingAcceptFlowOperation__showSharingJoinDialog_step__block_invoke_139(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_parseShareMetadata_step
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Pre-creating accept operation to block next sync down %@%@", (void)v3, DWORD2(v3));
}

void __57__BRCSharingAcceptFlowOperation__parseShareMetadata_step__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  os_log_t v2 = *(void **)(v1 + 520);
  id v3 = [*(id *)(v1 + 560) share];
  [v2 learnParticipantIdentitiesForShare:v3 forceUpdate:1];
}

- (void)_startShareAccept_step
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Start accepting share URL%@");
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v19 = *(_OWORD *)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 56);
  char v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    id v22 = (id)v19;
    __int16 v23 = 2112;
    id v24 = v5;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx received share access completion - metadata %@, operationError - %@%@", buf, 0x2Au);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6) {
      goto LABEL_5;
    }
    __int16 v13 = [v5 share];
    uint64_t v14 = [v13 recordID];
    __int16 v15 = (void *)*((void *)WeakRetained + 69);
    *((void *)WeakRetained + 69) = v14;

    if (*((void *)WeakRetained + 69)) {
      goto LABEL_9;
    }
    __int16 v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_2();
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: No operation error and no share id");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_5:
      v10 = brc_bread_crumbs();
      int v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = v6;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to accept share - %@%@", buf, 0x16u);
      }

      id v6 = v6;
      uint64_t v12 = (void *)*((void *)WeakRetained + 86);
      *((void *)WeakRetained + 86) = v6;
    }
    else
    {
LABEL_9:
      uint64_t v12 = brc_bread_crumbs();
      uint64_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_1();
      }

      id v6 = 0;
    }

    dispatch_group_leave(*((dispatch_group_t *)WeakRetained + 81));
  }

  __brc_leave_section((uint64_t *)&v19);
}

- (void)_openiWorkAppPreemptively_step
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _linkItemID%@", v2, v3, v4, v5, v6);
}

void __63__BRCSharingAcceptFlowOperation__openiWorkAppPreemptively_step__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 600) itemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];
  if ([v3 isLive]) {
    char v2 = 0;
  }
  else {
    char v2 = [v3 isLost] ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (void)_locateSharedItemOnOwner_step
{
  if (![(BRCSharingAcceptFlowOperation *)self _isOwner]) {
    goto LABEL_3;
  }
  id v3 = [(BRCClientZone *)self->_clientZone serverZone];
  char v4 = [v3 state];
  uint64_t v5 = [(BRCAppLibrary *)self->_appLibrary defaultClientZone];
  uint8_t v6 = [v5 serverZone];
  char v7 = v4 & [v6 state];

  if ((v7 & 4) == 0)
  {
    uint64_t v8 = self->_session;
    v9 = self->_linkItemID;
    v10 = self->_clientZone;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke;
    v14[3] = &unk_1E6996240;
    v14[4] = self;
    __int16 v15 = v8;
    uint64_t v16 = v10;
    __int16 v17 = v9;
    int v11 = v9;
    uint64_t v12 = v10;
    __int16 v13 = v8;
    [(BRCSharingAcceptFlowOperation *)self _createServerFaultIfPossibleWithCompletion:v14];
  }
  else
  {
LABEL_3:
    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAcceptShareFailedWithUnderlyingError:", a2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [v3 _completeWithError:v9];
  }
  else
  {
    char v4 = [*(id *)(a1 + 40) clientDB];
    uint64_t v5 = [v4 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_2;
    block[3] = &unk_1E6993CC8;
    id v11 = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    id v12 = v6;
    uint64_t v13 = v7;
    id v14 = v8;
    dispatch_async(v5, block);
  }
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  id v3 = [v2 st];
  uint64_t v4 = [v3 parentID];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) serverItemByItemID:*(void *)(a1 + 40)];
    uint64_t v5 = [v6 parentItemIDOnServer];

    if (!v5)
    {
LABEL_5:
      [*(id *)(a1 + 48) _performNextStep];
      goto LABEL_10;
    }
  }
  if ([v2 isOnDisk]) {
    goto LABEL_5;
  }
  uint64_t v7 = [*(id *)(a1 + 32) fetchParentChainIfNecessaryWithParentItemID:v5 isUserWaiting:1];
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_3;
    v10[3] = &unk_1E69944C0;
    id v8 = *(id *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 48);
    id v11 = v8;
    uint64_t v12 = v9;
    [v7 addFetchParentChainCompletionBlock:v10];
  }
  else
  {
    [*(id *)(a1 + 48) _performNextStep];
  }

LABEL_10:
}

void __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_3(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) clientDB];
  id v3 = [v2 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_4;
  block[3] = &unk_1E6993698;
  void block[4] = *(void *)(a1 + 40);
  dispatch_sync(v3, block);
}

uint64_t __62__BRCSharingAcceptFlowOperation__locateSharedItemOnOwner_step__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_waitForSharedItemToSyncDownOnOwner_step
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Wait for shared item to sync down%@");
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2;
  v5[3] = &unk_1E6996758;
  char v6 = a2;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async_with_logs_12(v4, v5);
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    char v2 = *(void **)(a1 + 32);
    [v2 _performNextStep];
  }
  else
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_cold_1();
    }

    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    char v6 = [*(id *)(*(void *)(a1 + 32) + 560) share];
    uint64_t v7 = objc_msgSend(v6, "brc_sharedRootDisplayName");
    if (v7)
    {
      id v8 = objc_msgSend(v5, "brc_errorItemNotFound:", v7);
    }
    else
    {
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 576) itemIDString];
      id v8 = objc_msgSend(v5, "brc_errorItemNotFound:", v9);
    }
    v10 = *(void **)(a1 + 32);
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAcceptShareFailedWithUnderlyingError:", v8);
    [v10 _completeWithError:v11];
  }
}

- (void)_waitForSharedItemToBeOnDiskOnOwner_step
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Wait for item to be on disk%@");
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
  uint64_t v5 = [v4 serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_2;
  v6[3] = &unk_1E6996758;
  char v7 = a2;
  v6[4] = *(void *)(a1 + 32);
  dispatch_async_with_logs_12(v5, v6);
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    char v2 = [*(id *)(a1 + 32) callbackQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_3;
    v13[3] = &unk_1E6993698;
    v13[4] = *(void *)(a1 + 32);
    dispatch_async_with_logs_12(v2, v13);
  }
  else
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 576);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      __int16 v17 = v3;
      _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ wasn't able to be found as a fault.  We must have reset or be broken structure or it was deleted locally.%@", buf, 0x16u);
    }

    char v6 = (void *)MEMORY[0x1E4F28C58];
    char v7 = [*(id *)(*(void *)(a1 + 32) + 560) share];
    id v8 = objc_msgSend(v7, "brc_sharedRootDisplayName");
    if (v8)
    {
      uint64_t v9 = objc_msgSend(v6, "brc_errorItemNotFound:", v8);
    }
    else
    {
      v10 = [*(id *)(*(void *)(a1 + 32) + 576) itemIDString];
      uint64_t v9 = objc_msgSend(v6, "brc_errorItemNotFound:", v10);
    }
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAcceptShareFailedWithUnderlyingError:", v9);
    [v11 _completeWithError:v12];
  }
}

uint64_t __73__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnOwner_step__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_createSideFaultOnDisk_step
{
  id v3 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke;
  block[3] = &unk_1E6993698;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 544))
  {
    id v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1();
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 560))
  {
    uint64_t v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_3();
    }
  }
  memset(v28, 0, sizeof(v28));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _createSideFaultOnDisk_step]_block_invoke", 1385, v28);
  id v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_2();
  }

  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  dispatch_group_t v5 = dispatch_group_create();
  char v6 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148;
  v16[3] = &unk_1E6999478;
  v16[4] = *(void *)(a1 + 32);
  uint64_t v18 = &v20;
  long long v19 = &v24;
  char v7 = v5;
  __int16 v17 = v7;
  [v6 groupInBatch:v16];

  if (!*((unsigned char *)v25 + 24))
  {
    if (*((unsigned char *)v21 + 24))
    {
      id v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_1();
      }

      [*(id *)(a1 + 32) _jumpToSelector:sel__openSharedSideFaultFile_step];
    }
    else
    {
      v10 = [*(id *)(*(void *)(a1 + 32) + 520) clientTruthWorkloop];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_169;
      v15[3] = &unk_1E6993698;
      v15[4] = *(void *)(a1 + 32);
      dispatch_group_notify(v7, v10, v15);
    }
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  __brc_leave_section(v28);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 576);
  id v3 = *(id *)(*(void *)(a1 + 32) + 584);
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 600) itemByItemID:v2];
  if ([*(id *)(a1 + 32) _isLinkInsideFolderShare])
  {
    dispatch_group_t v5 = [*(id *)(*(void *)(a1 + 32) + 600) itemByItemID:v3];
  }
  else
  {
    dispatch_group_t v5 = v4;
  }
  char v6 = v5;
  id v7 = *(id *)(*(void *)(a1 + 32) + 656);
  id v8 = *(id *)(*(void *)(a1 + 32) + 664);
  uint64_t v9 = v8;
  if (!v4)
  {
    v125 = v8;
    int v12 = [*(id *)(a1 + 32) _isOwner];
    uint64_t v13 = *(id **)(a1 + 32);
    v126 = v7;
    if (v12)
    {
      id v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_1();
      }

      __int16 v16 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: document doesn't exists anymore");
      [v13 _completeWithError:v16];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      id v7 = v126;
      goto LABEL_94;
    }
    id v124 = v3;
    [v13[76] recreateDocumentsFolderIfNeededOnDisk];
    if ([*(id *)(*(void *)(a1 + 32) + 560) participantPermission] == 2) {
      uint64_t v21 = 100;
    }
    else {
      uint64_t v21 = 68;
    }
    v123 = v6;
    if ([*(id *)(a1 + 32) _isFolderShare])
    {
      if (([*(id *)(a1 + 32) _isLinkInsideFolderShare] & 1) == 0)
      {
        uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 600) fetchDirectoryContentsIfNecessary:v3 isUserWaiting:1 rescheduleApplyScheduler:1];
        [v22 beginObservingChangesWithDelegate:0];
      }
      char v23 = *(NSObject **)(a1 + 40);
      uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 520) serverTruthWorkloop];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_158;
      block[3] = &unk_1E6993698;
      void block[4] = *(void *)(a1 + 32);
      dispatch_group_async(v23, v24, block);

      if (v6)
      {
        uint64_t v120 = 0;
        id v7 = v126;
      }
      else
      {
        id v35 = [BRCShareAcceptationDirectoryFault alloc];
        uint64_t v36 = *(void *)(a1 + 32);
        uint64_t v37 = *(void *)(v36 + 608);
        uint64_t v38 = [*(id *)(v36 + 600) asSharedClientZone];
        v39 = v35;
        id v7 = v126;
        uint64_t v120 = [(BRCShareAcceptationDirectoryFault *)v39 initWithFilename:v126 itemID:v3 parentIDWhenSubitem:0 appLibrary:v37 clientZone:v38 sharingOptions:v21];
      }
      if ([*(id *)(a1 + 32) _isLinkInsideFolderShare])
      {
        uint64_t v40 = v21 & 0x60;
        if ([*(id *)(a1 + 32) _isDocumentLinkInsideFolderShare])
        {
          v41 = BRCShareAcceptationDocumentFault;
        }
        else
        {
          if (![*(id *)(a1 + 32) _isDirectoryLinkInsideFolderShare])
          {
            v98 = *(void **)(a1 + 32);
            v99 = brc_bread_crumbs();
            v100 = brc_default_log();
            if (os_log_type_enabled(v100, OS_LOG_TYPE_FAULT)) {
              __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_10();
            }

            v101 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: item isn't a document or directory");
            [v98 _completeWithError:v101];

            v51 = 0;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
            char v6 = v123;
            id v7 = v126;
            objc_super v30 = (BRCShareAcceptationDocumentFault *)v120;
            goto LABEL_93;
          }
          v41 = BRCShareAcceptationDirectoryFault;
        }
        id v42 = [v41 alloc];
        uint64_t v43 = *(void *)(a1 + 32);
        uint64_t v44 = *(void *)(v43 + 608);
        v45 = [*(id *)(v43 + 600) asSharedClientZone];
        uint64_t v46 = [v42 initWithFilename:v125 itemID:v2 parentIDWhenSubitem:v3 appLibrary:v44 clientZone:v45 sharingOptions:v40];

        id v7 = v126;
        objc_super v30 = (BRCShareAcceptationDocumentFault *)v120;
        v31 = (void *)v46;
      }
      else
      {
        v31 = 0;
        objc_super v30 = (BRCShareAcceptationDocumentFault *)v120;
      }
    }
    else
    {
      __int16 v25 = [BRCShareAcceptationDocumentFault alloc];
      uint64_t v26 = *(void *)(a1 + 32);
      uint64_t v27 = *(void *)(v26 + 608);
      id v28 = [*(id *)(v26 + 600) asSharedClientZone];
      uint64_t v29 = v25;
      id v7 = v126;
      objc_super v30 = [(BRCShareAcceptationDocumentFault *)v29 initWithFilename:v126 itemID:v3 parentIDWhenSubitem:0 appLibrary:v27 clientZone:v28 sharingOptions:v21];

      v31 = 0;
    }
    [(BRCShareAcceptationDocumentFault *)v30 stageShareAcceptationFaultWithName:v7];
    [(BRCLocalItem *)v30 saveToDBForServerEdit:1 keepAliases:0];
    [v31 stageShareAcceptationFaultWithName:v125];
    [v31 saveToDBForServerEdit:1 keepAliases:0];
    v47 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
    [v47 flush];

    v48 = brc_bread_crumbs();
    brc_default_log();
    v50 = uint64_t v49 = (uint64_t)v31;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
      __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_9((uint64_t)v30);
    }

    char v6 = v123;
    v51 = (void *)v49;
    uint64_t v122 = v49;
    if (v49)
    {
      v52 = brc_bread_crumbs();
      v53 = brc_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_8(v49);
      }

      v51 = (void *)v49;
    }
    if (!v30) {
      goto LABEL_65;
    }
    v54 = [[BRCItemToPathLookup alloc] initWithItem:v30];
    v55 = [(BRCItemToPathLookup *)v54 byPath];
    v56 = [(BRCLocalItem *)v30 st];
    id v57 = [v56 logicalName];
    uint64_t v58 = [v55 logicalURLWithLogicalName:v57];

    v116 = (void *)v58;
    id v59 = [[BRCURLToItemLookup alloc] initWithURL:v58 session:*(void *)(*(void *)(a1 + 32) + 520)];
    if ([(BRCURLToItemLookup *)v59 resolveAndKeepOpenWithError:0])
    {
      v60 = [*(id *)(*(void *)(a1 + 32) + 520) fsWriter];
      uint64_t v61 = [v60 computeSourceBounceNumberIfNecessaryWithLookup:v59 localItem:v30 serverItem:0];

      if (v61)
      {
        [(BRCLocalItem *)v30 bounceReservedItemWithBounceNumber:v61];
        id v62 = [(BRCLocalItem *)v30 st];
        v63 = [v62 logicalName];
        [(BRCShareAcceptationDocumentFault *)v30 stageShareAcceptationFaultWithName:v63];

        [(BRCLocalItem *)v30 saveToDBForServerEdit:1 keepAliases:0];
        id v64 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
        [v64 flush];

        v65 = [[BRCItemToPathLookup alloc] initWithItem:v30];
        v66 = [(BRCLocalItem *)v30 st];
        id v67 = [v66 logicalName];

        v54 = v65;
      }
      else
      {
        id v67 = v126;
      }
      [(BRCURLToItemLookup *)v59 closePaths];
    }
    else
    {
      id v67 = v126;
    }
    v127 = v67;
    v115 = v59;
    if ([*(id *)(a1 + 32) _isFolderShare])
    {
      id v68 = v67;
    }
    else
    {
      objc_msgSend(v67, "br_sideFaultName");
      id v68 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v69 = v68;
    v70 = [*(id *)(*(void *)(a1 + 32) + 520) stageRegistry];
    id v71 = [(BRCLocalItem *)v30 st];
    v72 = [v71 stagedFileID];
    uint64_t v73 = [v72 unsignedLongLongValue];
    v118 = v54;
    [(BRCItemToPathLookup *)v54 byPath];
    v75 = id v74 = v30;
    id v131 = 0;
    v114 = v69;
    int v76 = [v70 moveFromStage:v73 toPath:v75 fileName:v69 error:&v131];
    id v77 = v131;

    if (v76)
    {
      [(BRCShareAcceptationDocumentFault *)v74 markLiveFromStageAsShareAcceptationFault];
      [(BRCLocalItem *)v74 saveToDB];
      v78 = brc_bread_crumbs();
      v79 = brc_default_log();
      objc_super v30 = v74;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_6((uint64_t)v74);
      }
    }
    else
    {
      id v80 = brc_bread_crumbs();
      v81 = brc_default_log();
      if (os_log_type_enabled(v81, (os_log_type_t)0x90u)) {
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_4((uint64_t)v77);
      }

      [*(id *)(a1 + 32) _completeWithError:v77];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      objc_super v30 = v74;
    }

    char v6 = v123;
    id v3 = v124;
    id v7 = v127;
    v51 = (void *)v122;
    if (v76)
    {
LABEL_65:
      v82 = v30;
      if (!v51) {
        goto LABEL_92;
      }
      v83 = [BRCItemToPathLookup alloc];
      v84 = v30 ? v30 : v6;
      v119 = [(BRCItemToPathLookup *)v83 initWithItem:v84];
      v85 = [(BRCItemToPathLookup *)v119 byPath];
      v86 = [v85 pathWithChildAtPath:v125];

      int v130 = 0;
      if ([v86 resolveMustExist:0 error:&v130])
      {
        int v87 = [v86 exists];
        v88 = *(void **)(a1 + 32);
        v121 = v30;
        if (v87)
        {
          id v89 = v7;
          v90 = brc_bread_crumbs();
          v91 = brc_default_log();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT)) {
            __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_2();
          }

          v92 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: child path already exists even though we should have just created the parent");
          [v88 _completeWithError:v92];

          int v93 = 1;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          id v7 = v89;
          objc_super v30 = v121;
        }
        else
        {
          id v128 = v7;
          if ([v88 _isDocumentLinkInsideFolderShare])
          {
            objc_msgSend(v125, "br_sideFaultName");
            id v97 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v97 = v125;
          }
          id v102 = v97;
          v103 = [*(id *)(*(void *)(a1 + 32) + 520) stageRegistry];
          v104 = [v51 st];
          [v104 stagedFileID];
          v106 = v105 = v51;
          id v129 = 0;
          v117 = v102;
          char v107 = objc_msgSend(v103, "moveFromStage:toPath:fileName:error:", objc_msgSend(v106, "unsignedLongLongValue"), v86, v102, &v129);
          id v108 = v129;

          if (v107)
          {
            [v105 markLiveFromStageAsShareAcceptationFault];
            [v105 saveToDB];
            v109 = brc_bread_crumbs();
            v110 = brc_default_log();
            objc_super v30 = v121;
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG)) {
              __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_3(v122);
            }

            int v93 = 0;
          }
          else
          {
            v111 = brc_bread_crumbs();
            v112 = brc_default_log();
            objc_super v30 = v121;
            if (os_log_type_enabled(v112, (os_log_type_t)0x90u)) {
              __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_4((uint64_t)v108);
            }

            [*(id *)(a1 + 32) _completeWithError:v108];
            int v93 = 1;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          }

          char v6 = v123;
          id v7 = v128;
        }
      }
      else
      {
        id v94 = v7;
        v95 = brc_bread_crumbs();
        v96 = brc_default_log();
        if (os_log_type_enabled(v96, (os_log_type_t)0x90u)) {
          __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_5((uint64_t)v95, v96);
        }

        [*(id *)(a1 + 32) _completeWithError:0];
        int v93 = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        id v7 = v94;
      }
      v51 = (void *)v122;

      v82 = (void *)v122;
      id v3 = v124;
      if (!v93)
      {
LABEL_92:
        v113 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
        [v113 flushToMakeEditsVisibleToIPCReaders];

        [*(id *)(a1 + 32) _captureOpenInfoFromItem:v82];
      }
    }
LABEL_93:

LABEL_94:
    uint64_t v9 = v125;
    goto LABEL_95;
  }
  v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_13((uint64_t)v4);
  }

  if ([v4 isLive])
  {
    if (([v4 isShareAcceptationFault] & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    [*(id *)(a1 + 32) _captureOpenInfoFromItem:v4];
  }
  else
  {
    if (([v4 isAlmostDead] & 1) != 0 || objc_msgSend(v4, "isReserved"))
    {
      __int16 v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_11((uint64_t)v4);
      }

      long long v19 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F28798], 35, @"Share %@ can not be accepted right now.", *(void *)(*(void *)(a1 + 32) + 544));
      uint64_t v20 = *(void **)(a1 + 32);
    }
    else
    {
      uint64_t v32 = *(void **)(a1 + 32);
      v33 = brc_bread_crumbs();
      __int16 v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_12((uint64_t)v4);
      }

      long long v19 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: item is in an unknown state: %@:", v4);
      uint64_t v20 = v32;
    }
    [v20 _completeWithError:v19];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
LABEL_95:
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_158(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 600) serverZone];
  [v1 clearStateBits:4];
}

uint64_t __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_169(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_openSharedSideFaultFileWithAppID:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = [(CKRecordID *)self->_shareID recordName];
  char v6 = self->_liveFileURL;
  id v7 = v6;
  if (self->_skipOpenInApp)
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFileWithAppID:]();
    }

    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
  else
  {
    v10 = v6;
    id v11 = v4;
    id v12 = v5;
    FPExtendBookmarkForDocumentURL();
  }
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    char v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412802;
      id v24 = v5;
      __int16 v25 = 2112;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Got bookmark string %@ for URL %@%@", buf, 0x20u);
    }
    id v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    uint64_t v9 = *MEMORY[0x1E4F22378];
    v21[0] = *MEMORY[0x1E4F22340];
    v21[1] = v9;
    v22[0] = v5;
    v22[1] = MEMORY[0x1E4F1CC38];
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_2(a1, (uint64_t)v11, v12);
    }

    uint64_t v13 = [v8 operationToOpenResource:*(void *)(a1 + 32) usingApplication:*(void *)(a1 + 48) uniqueDocumentIdentifier:*(void *)(a1 + 56) isContentManaged:BRCurrentPersonaIsDataSeparated() sourceAuditToken:0 userInfo:v10 options:0 delegate:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) addSubOperation:v13];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F592A8];
    if (a3)
    {
      uint64_t v29 = *MEMORY[0x1E4F28A50];
      v30[0] = a3;
      __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    }
    else
    {
      __int16 v16 = (void *)MEMORY[0x1E4F1CC08];
    }
    __int16 v17 = [*(id *)(a1 + 32) path];
    id v8 = objc_msgSend(v14, "br_errorWithDomain:code:userInfo:description:", v15, 10, v16, @"Can't get bookmark string at %@", v17);

    if (a3) {
    uint64_t v18 = brc_bread_crumbs();
    }
    long long v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
      __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_1((id *)(a1 + 32));
    }

    [*(id *)(a1 + 40) _completeWithError:v8];
  }
}

- (void)_openDocumentInDocumentsAppIfInstalled:(id)a3
{
  id v4 = a3;
  if (self->_skipOpenInApp)
  {
    id v5 = brc_bread_crumbs();
    char v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFileWithAppID:]();
    }

    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.DocumentsApp"];
    id v8 = [v7 appState];
    int v9 = [v8 isInstalled];

    if (v9)
    {
      v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:0];
      [v11 setScheme:@"shareddocuments"];
      id v12 = [v11 URL];
      id v18 = 0;
      [v10 openSensitiveURL:v12 withOptions:0 error:&v18];
      id v13 = v18;

      if (v13)
      {
        id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAcceptShareFailedWithUnderlyingError:", v13);
        [(BRCSharingAcceptFlowOperation *)self _completeWithError:v14];
      }
      else
      {
        [(BRCSharingAcceptFlowOperation *)self _performNextStep];
      }
    }
    else
    {
      userNotification = self->_userNotification;
      shareURL = self->_shareURL;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72__BRCSharingAcceptFlowOperation__openDocumentInDocumentsAppIfInstalled___block_invoke;
      v17[3] = &unk_1E6993698;
      v17[4] = self;
      [(BRCUserNotifier *)userNotification showErrorDocumentsAppNotVisibleForShareURL:shareURL reply:v17];
    }
  }
}

uint64_t __72__BRCSharingAcceptFlowOperation__openDocumentInDocumentsAppIfInstalled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_openSharedSideFaultFile_step
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _liveFileURL%@", v2, v3, v4, v5, v6);
}

- (void)_finishShareAccept_step
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Waiting for share accept to finish%@");
}

void __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 688);
  uint64_t v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke_cold_1((uint64_t)v2);
  }

  if ((objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 3) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 4) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 29) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 32) & 1) != 0
    || (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 11) & 1) != 0
    || objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 10))
  {
    [*(id *)(a1 + 32) _completeWithError:v2];
    goto LABEL_10;
  }
  if (objc_msgSend(v2, "brc_containsCloudKitErrorCode:", 9))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
LABEL_16:
    id v8 = (void *)v6;
    [v5 _completeWithError:v6];

    goto LABEL_10;
  }
  id v7 = *(void **)(a1 + 32);
  if (!v2)
  {
    [v7 _performNextStep];
    goto LABEL_10;
  }
  if (([v7 finishIfCancelled] & 1) == 0)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAcceptShareFailedWithUnderlyingError:", v2);
    goto LABEL_16;
  }
LABEL_10:
}

- (void)_createServerFaultIfPossibleWithCompletion:(id)a3
{
  id v4 = a3;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:]", 1844, v15);
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:]();
  }

  if (!self->_clientZone)
  {
    int v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _createServerFaultIfPossibleWithCompletion:]();
    }
  }
  if (!self->_linkItemID)
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _openiWorkAppPreemptively_step]();
    }
  }
  if (self->_allowsDirectoryFaults)
  {
    id v7 = [(BRCClientZone *)self->_clientZone db];
    id v8 = [v7 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke;
    block[3] = &unk_1E6994600;
    void block[4] = self;
    id v14 = v4;
    dispatch_async(v8, block);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
  __brc_leave_section(v15);
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 600) serverItemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 _performNextStep];
    return;
  }
  int v4 = [v3 _isDocumentLinkInsideFolderShare];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 560) sharedItemHierarchyIDs];
  unint64_t v6 = [v5 count];
  if (v4) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 1;
  }

  if (v6 <= v7)
  {
    if (![*(id *)(a1 + 32) _isOwner]
      || ([*(id *)(*(void *)(a1 + 32) + 576) isEqualToItemID:*(void *)(*(void *)(a1 + 32) + 584)] & 1) == 0&& (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 600), "serverItemByItemID:", *(void *)(*(void *)(a1 + 32) + 584)), v33 = objc_claimAutoreleasedReturnValue(), v33, v33))
    {
      __int16 v34 = brc_bread_crumbs();
      id v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_2();
      }

      [*(id *)(a1 + 32) _performNextStep];
      return;
    }
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 600) serverZone];
  int v9 = [*(id *)(*(void *)(a1 + 32) + 560) rootRecordID];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v11 = [[BRCFetchRecordSubResourcesOperation alloc] initAndScheduleWithServerZone:v8 parentOperation:*(void *)(a1 + 32) pendingChangesStream:0 contentRecordsFetchedInline:1 sessionContext:*(void *)(*(void *)(a1 + 32) + 256)];
  [v10 addObject:v9];
  [v10 addObject:*(void *)(*(void *)(a1 + 32) + 552)];
  id v12 = [v9 recordName];
  if (![v12 hasPrefix:@"documentContent/"]) {
    goto LABEL_12;
  }
  int v13 = [v8 isPrivateZone];

  if (v13)
  {
    id v14 = [v9 recordName];
    id v12 = [v14 substringFromIndex:objc_msgSend(@"documentContent/", "length")];

    uint64_t v15 = [@"documentStructure/" stringByAppendingString:v12];
    id v16 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    __int16 v17 = [v9 zoneID];
    id v18 = (void *)[v16 initWithRecordName:v15 zoneID:v17];

    [v10 addObject:v18];
LABEL_12:
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v19 = [*(id *)(*(void *)(a1 + 32) + 560) sharedItemHierarchyIDs];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v19);
        }
        [v10 addObject:*(void *)(*((void *)&v44 + 1) + 8 * i)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v21);
  }

  if (!v9)
  {
    uint64_t v36 = brc_bread_crumbs();
    uint64_t v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_1();
    }
  }
  id v24 = objc_alloc(MEMORY[0x1E4F1A0A8]);
  __int16 v25 = [v10 allObjects];
  uint64_t v26 = (void *)[v24 initWithRecordIDs:v25];

  __int16 v27 = [MEMORY[0x1E4F1A2D8] desiredKeysWithMask:185];
  [v26 setDesiredKeys:v27];

  [v26 setShouldFetchAssetContent:0];
  id v28 = [v11 callbackQueue];
  [v26 setCallbackQueue:v28];

  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  uint64_t v40 = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_190;
  v41 = &unk_1E6997338;
  id v43 = *(id *)(a1 + 40);
  id v29 = v11;
  id v42 = v29;
  [v26 setFetchRecordsCompletionBlock:&v38];
  int v30 = objc_msgSend(v8, "isPrivateZone", v38, v39, v40, v41);
  v31 = *(id **)(a1 + 32);
  if (v30)
  {
    uint64_t v32 = [v31[76] transferSyncContext];
    [v31 addSubOperation:v26 overrideContext:v32 allowsCellularAccess:0];
  }
  else
  {
    [v31 addSubOperation:v26];
  }
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    unint64_t v6 = brc_bread_crumbs();
    unint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_190_cold_1((uint64_t)v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [a2 allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(a1 + 32) addRecord:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    int v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_191;
    v14[3] = &unk_1E6994600;
    id v15 = v13;
    id v16 = *(id *)(a1 + 40);
    [v15 notifyWhenRecordsAreFetchedAndFinish:v14];
  }
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_191(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_191_cold_2();
  }

  int v4 = [*(id *)(a1 + 32) saveRecordsWithQueryCursor:0];
  id v5 = [*(id *)(a1 + 32) error];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) error];
  }
  else
  {
    if (v4)
    {
      (*(void (**)(void, void))(v6 + 16))(*(void *)(a1 + 40), 0);
      return;
    }
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_191_cold_1();
    }

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: couldn't save to server truth when creating server fault");
  }
  uint64_t v10 = (void *)v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
}

- (void)_locateSharedItemOnRecipient_step
{
  if ([(BRCSharingAcceptFlowOperation *)self _isOwner]) {
    goto LABEL_3;
  }
  uint64_t v3 = [(BRCClientZone *)self->_clientZone serverZone];
  char v4 = [v3 state];
  id v5 = [(BRCAppLibrary *)self->_appLibrary defaultClientZone];
  uint64_t v6 = [v5 serverZone];
  char v7 = v4 & [v6 state];

  if ((v7 & 4) != 0)
  {
LABEL_3:
    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke;
    v8[3] = &unk_1E69939E8;
    v8[4] = self;
    [(BRCSharingAcceptFlowOperation *)self _createServerFaultIfPossibleWithCompletion:v8];
  }
}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 520) clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_2;
  block[3] = &unk_1E6993698;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 600) serverItemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];
  if (v2)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 520) serverAliasItemForSharedItem:v2];
    char v4 = *(id **)(a1 + 32);
    if (v3)
    {
      [v4 _performNextStep];
    }
    else
    {
      char v7 = [v4[76] defaultClientZone];
      id v8 = [v2 itemGlobalID];
      uint64_t v9 = [v7 serverZone];
      uint64_t v10 = +[BRCItemID shareAliasRecordIDFromTargetItemID:v8 zone:v9 hasDerivedShareAlias:0];

      uint64_t v11 = [v7 locateRecordIfNecessaryForRecordID:v10 isUserWaiting:1];
      if (v11)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_197;
        v14[3] = &unk_1E6994400;
        id v12 = v10;
        uint64_t v13 = *(void *)(a1 + 32);
        id v15 = v12;
        uint64_t v16 = v13;
        [v11 addLocateRecordCompletionBlock:v14];
      }
      else
      {
        [*(id *)(a1 + 32) _performNextStep];
      }
    }
  }
  else
  {
    id v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v18 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't create a directory fault%@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _performNextStep];
  }
}

void __66__BRCSharingAcceptFlowOperation__locateSharedItemOnRecipient_step__block_invoke_197(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = brc_bread_crumbs();
  char v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = @"fail";
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413058;
    if (a2) {
      id v8 = @"success";
    }
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    long long v17 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] Fetch share alias for share alias record ID [%@]: %@ with error %@%@", (uint8_t *)&v10, 0x2Au);
  }

  [*(id *)(a1 + 40) _performNextStep];
}

- (void)_waitForSharedItemToSyncDownOnRecipient_step
{
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _waitForSharedItemToSyncDownOnRecipient_step]", 1964, v7);
  uint64_t v3 = brc_bread_crumbs();
  char v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingAcceptFlowOperation _waitForSharedItemToSyncDownOnOwner_step]();
  }

  if ([(BRCSharingAcceptFlowOperation *)self _isOwner])
  {
    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
  else
  {
    clientZone = self->_clientZone;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke;
    v6[3] = &unk_1E6998CB0;
    v6[4] = self;
    [(BRCClientZone *)clientZone performBlock:v6 whenSyncDownCompletesLookingForItemID:self->_linkItemID];
    [(BRCSharingAcceptFlowOperation *)self _activateSharedZoneIfNeeded];
  }
  __brc_leave_section(v7);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke(uint64_t a1, char a2)
{
  char v4 = [*(id *)(a1 + 32) callbackQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2;
  v5[3] = &unk_1E6996758;
  char v6 = a2;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async_with_logs_12(v4, v5);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = *(void **)(a1 + 32);
    [v2 _performNextStep];
  }
  else
  {
    uint64_t v3 = brc_bread_crumbs();
    char v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2_cold_1();
    }

    id v5 = (void *)MEMORY[0x1E4F28C58];
    char v6 = [*(id *)(*(void *)(a1 + 32) + 560) share];
    char v7 = objc_msgSend(v6, "brc_sharedRootDisplayName");
    if (v7)
    {
      id v8 = objc_msgSend(v5, "brc_errorItemNotFound:", v7);
    }
    else
    {
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 576) itemIDString];
      id v8 = objc_msgSend(v5, "brc_errorItemNotFound:", v9);
    }
    int v10 = *(void **)(a1 + 32);
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAcceptShareFailedWithUnderlyingError:", v8);
    [v10 _completeWithError:v11];
  }
}

- (void)_waitForSharedItemToBeOnDiskOnRecipient_step
{
  if (!self->_linkItemID)
  {
    char v6 = brc_bread_crumbs();
    char v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _openiWorkAppPreemptively_step]();
    }
  }
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _waitForSharedItemToBeOnDiskOnRecipient_step]", 2004, v9);
  uint64_t v3 = brc_bread_crumbs();
  char v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCSharingAcceptFlowOperation _waitForSharedItemToBeOnDiskOnOwner_step]();
  }

  if ([(BRCSharingAcceptFlowOperation *)self _isOwner])
  {
    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
  else
  {
    clientZone = self->_clientZone;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke;
    v8[3] = &unk_1E6998CB0;
    v8[4] = self;
    [(BRCClientZone *)clientZone performBlock:v8 whenItemWithRecordIDIsOnDisk:self->_linkItemRecordID];
  }
  __brc_leave_section(v9);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke(uint64_t a1, char a2)
{
  char v4 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
  id v5 = [v4 serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_2;
  v6[3] = &unk_1E6996758;
  char v7 = a2;
  v6[4] = *(void *)(a1 + 32);
  dispatch_async_with_logs_12(v5, v6);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) callbackQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_3;
    v13[3] = &unk_1E6993698;
    v13[4] = *(void *)(a1 + 32);
    dispatch_async_with_logs_12(v2, v13);
  }
  else
  {
    uint64_t v3 = brc_bread_crumbs();
    char v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 576);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      long long v17 = v3;
      _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ wasn't able to be found as a fault.  We must have reset or be broken structure or it was deleted locally.%@", buf, 0x16u);
    }

    char v6 = (void *)MEMORY[0x1E4F28C58];
    char v7 = [*(id *)(*(void *)(a1 + 32) + 560) share];
    id v8 = objc_msgSend(v7, "brc_sharedRootDisplayName");
    if (v8)
    {
      uint64_t v9 = objc_msgSend(v6, "brc_errorItemNotFound:", v8);
    }
    else
    {
      int v10 = [*(id *)(*(void *)(a1 + 32) + 576) itemIDString];
      uint64_t v9 = objc_msgSend(v6, "brc_errorItemNotFound:", v10);
    }
    uint64_t v11 = *(void **)(a1 + 32);
    __int16 v12 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAcceptShareFailedWithUnderlyingError:", v9);
    [v11 _completeWithError:v12];
  }
}

uint64_t __77__BRCSharingAcceptFlowOperation__waitForSharedItemToBeOnDiskOnRecipient_step__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextStep];
}

- (void)_locateSharedItemOnDisk_step
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Locate shared folder on disk%@");
}

void __61__BRCSharingAcceptFlowOperation__locateSharedItemOnDisk_step__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 600) itemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];
  if ([v2 isOnDisk])
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 520) clientDB];
    [v3 flushToMakeEditsVisibleToIPCReaders];

    char v4 = [[BRCItemToPathLookup alloc] initWithItem:v2];
    uint64_t v5 = [(BRCItemToPathLookup *)v4 coordinatedWriteURL];
    uint64_t v6 = *(void *)(a1 + 32);
    char v7 = *(void **)(v6 + 640);
    *(void *)(v6 + 640) = v5;

    [*(id *)(a1 + 32) _performNextStep];
  }
  else
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 576);
      int v18 = 138412546;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ wasn't able to be found on disk.  We must have reset or be broken structure or it was deleted locally.%@", (uint8_t *)&v18, 0x16u);
    }

    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    __int16 v12 = [*(id *)(*(void *)(a1 + 32) + 560) share];
    uint64_t v13 = objc_msgSend(v12, "brc_sharedRootDisplayName");
    if (v13)
    {
      __int16 v14 = objc_msgSend(v11, "brc_errorItemNotFound:", v13);
    }
    else
    {
      uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 576) itemIDString];
      __int16 v14 = objc_msgSend(v11, "brc_errorItemNotFound:", v15);
    }
    __int16 v16 = *(void **)(a1 + 32);
    long long v17 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAcceptShareFailedWithUnderlyingError:", v14);
    [v16 _completeWithError:v17];
  }
}

- (void)_prepareToDownloadSharedDocument_step
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx prepare to open shared document%@");
}

void __70__BRCSharingAcceptFlowOperation__prepareToDownloadSharedDocument_step__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 600) itemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];
  if (([v2 isDocument] & 1) == 0)
  {
    uint64_t v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      __70__BRCSharingAcceptFlowOperation__prepareToDownloadSharedDocument_step__block_invoke_cold_2((uint64_t)v2);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"itemID", *(void *)(*(void *)(a1 + 32) + 576));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    char v7 = *(void **)(a1 + 32);
    id v8 = (void *)MEMORY[0x1E4F28C58];
    goto LABEL_16;
  }
  if (!*(void *)(*(void *)(a1 + 32) + 640))
  {
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v20 = v2;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Could not compute the coordinated read URL of the item %@.  It must have been deleted locally%@", buf, 0x16u);
    }

    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    __int16 v12 = [*(id *)(*(void *)(a1 + 32) + 560) share];
    uint64_t v13 = objc_msgSend(v12, "brc_sharedRootDisplayName");
    if (v13)
    {
      objc_msgSend(v11, "brc_errorItemNotFound:", v13);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v14 = [*(id *)(*(void *)(a1 + 32) + 576) itemIDString];
      objc_msgSend(v11, "brc_errorItemNotFound:", v14);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    char v7 = *(void **)(a1 + 32);
    id v8 = (void *)MEMORY[0x1E4F28C58];
LABEL_16:
    uint64_t v15 = objc_msgSend(v8, "brc_errorAcceptShareFailedWithUnderlyingError:", v4);
    [v7 _completeWithError:v15];

    goto LABEL_17;
  }
  if ([v2 isReserved])
  {
    __int16 v16 = brc_bread_crumbs();
    long long v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      __70__BRCSharingAcceptFlowOperation__prepareToDownloadSharedDocument_step__block_invoke_cold_1();
    }
  }
  id v18 = 0;
  char v3 = [v2 startDownloadInTask:0 options:8 etagIfLoser:0 stageFileName:0 error:&v18];
  id v4 = v18;
  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else {
    [*(id *)(a1 + 32) _completeWithError:v4];
  }
LABEL_17:
}

- (void)_setSpotlightAttribute_step
{
  if ([(BRCSharingAcceptFlowOperation *)self _isOwnerOrShareAlreadyAccepted])
  {
    [(BRCSharingAcceptFlowOperation *)self _performNextStep];
  }
  else
  {
    char v3 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__BRCSharingAcceptFlowOperation__setSpotlightAttribute_step__block_invoke;
    block[3] = &unk_1E6993698;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

void __60__BRCSharingAcceptFlowOperation__setSpotlightAttribute_step__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) _isOwner];
  char v3 = [*(id *)(*(void *)(a1 + 32) + 600) itemByItemID:*(void *)(*(void *)(a1 + 32) + 576)];
  id v4 = v3;
  if (v2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [v3 ownerKey];
    char v7 = [v4 db];
    id v8 = +[BRCAccountSession userIdentityForKey:v6 db:v7];

    uint64_t v9 = [v8 nameComponentsAcceptUnknownUser:1];
    uint64_t v5 = objc_msgSend(v9, "br_formattedName");
  }
  uint64_t v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 640), "br_physicalURL");
  uint64_t v11 = [v4 collaborationIdentifierIfComputable];
  char v12 = BRCSetAllShareAttributesAtURL(v10);

  if ((v12 & 1) == 0)
  {
    int v13 = *__error();
    __int16 v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      __int16 v16 = [*(id *)(*(void *)(a1 + 32) + 640) path];
      int v17 = 138412802;
      id v18 = v16;
      __int16 v19 = 1024;
      int v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] could not set share attributes for share at path: %@ %{errno}d%@", (uint8_t *)&v17, 0x1Cu);
    }
    *__error() = v13;
  }
  [*(id *)(a1 + 32) _performNextStep];
}

- (void)_openSharedItemIfStillNeeded_step
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_liveFileURL)
  {
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCSharingAcceptFlowOperation _openSharedSideFaultFile_step]();
    }
  }
  memset(v11, 0, sizeof(v11));
  __brc_create_section(0, (uint64_t)"-[BRCSharingAcceptFlowOperation _openSharedItemIfStillNeeded_step]", 2223, v11);
  char v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v11[0];
    id v8 = [(NSURL *)self->_liveFileURL path];
    *(_DWORD *)buf = 134218498;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    int v17 = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Open shared document if still needed at %@%@", buf, 0x20u);
  }
  if (!self->_liveFileURL)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"_liveFileURL", 0);
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAcceptShareFailedWithUnderlyingError:", v5);
    [(BRCSharingAcceptFlowOperation *)self _completeWithError:v6];

LABEL_11:
    goto LABEL_12;
  }
  if ([(BRCSharingAcceptFlowOperation *)self _isFolderShare])
  {
    uint64_t v5 = [(NSURL *)self->_shareURL brc_applicationContainerID];
    if (v5) {
      [(BRCSharingAcceptFlowOperation *)self _openSharedSideFaultFileWithAppID:v5];
    }
    else {
      [(BRCSharingAcceptFlowOperation *)self _openDocumentInDocumentsAppIfInstalled:self->_liveFileURL];
    }
    goto LABEL_11;
  }
  [(BRCSharingAcceptFlowOperation *)self _performNextStep];
LABEL_12:
  __brc_leave_section(v11);
}

- (void)_endAcceptationFlow_step
{
}

+ (id)_runningShareIDs
{
  if (_runningShareIDs_onceToken != -1) {
    dispatch_once(&_runningShareIDs_onceToken, &__block_literal_global_47);
  }
  char v2 = (void *)_runningShareIDs_ret;
  return v2;
}

void __49__BRCSharingAcceptFlowOperation__runningShareIDs__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  os_log_t v1 = (void *)_runningShareIDs_ret;
  _runningShareIDs_ret = v0;
}

- (BOOL)skipOpenInApp
{
  return self->_skipOpenInApp;
}

- (void)setSkipOpenInApp:(BOOL)a3
{
  self->_skipOpenInApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareAcceptationError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_linkFilename, 0);
  objc_storeStrong((id *)&self->_rootFilename, 0);
  objc_storeStrong((id *)&self->_shareAcceptGroup, 0);
  objc_storeStrong((id *)&self->_liveFileURL, 0);
  objc_storeStrong((id *)&self->_acceptOperation, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_unsaltedBookmarkData, 0);
  objc_storeStrong((id *)&self->_rootItemID, 0);
  objc_storeStrong((id *)&self->_linkItemID, 0);
  objc_storeStrong((id *)&self->_linkItemRecordID, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_acceptationFlow, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_userActionsNavigator, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
}

- (void)_completeWithError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] network is unreachable, replacing error with generic network error%@", v2, v3, v4, v5, v6);
}

- (void)_completeWithError:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] failing share acceptation with %@%@", (void)v3, DWORD2(v3));
}

- (void)_completeWithError:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _shareMetadata%@", v2, v3, v4, v5, v6);
}

- (void)_completeWithError:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: error.underlyingErrors.count == 1%@", v2, v3, v4, v5, v6);
}

- (void)_completeWithError:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: error _completeWithError must be called only in case we should complete with an error%@", v2, v3, v4, v5, v6);
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] fallback to iCloud Web with reason: %@%@", (void)v3, DWORD2(v3));
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self->_shareURL%@", v2, v3, v4, v5, v6);
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !(goToAppStore && openWebPreview)%@", v2, v3, v4, v5, v6);
}

void __52__BRCSharingAcceptFlowOperation__completeWithError___block_invoke_46_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !(goToSettings && openWebPreview)%@", v2, v3, v4, v5, v6);
}

- (void)finishWithResult:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Session is not cancelled but DBs serial queue is nil!%@", v2, v3, v4, v5, v6);
}

- (void)finishWithResult:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.cancelled || _hadProcessedCompletionError completedWithResult:error: called with error directly. Should call _completeWithError: instead.%@", v2, v3, v4, v5, v6);
}

void __56__BRCSharingAcceptFlowOperation_finishWithResult_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] delete share acceptation fault because operation failed%@", v2, v3, v4, v5, v6);
}

- (void)_isiWorkShare
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _shareURL%@", v2, v3, v4, v5, v6);
}

- (void)openResourceOperationDidComplete:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Open application completed successfully%@", v2, v3, v4, v5, v6);
}

- (void)openResourceOperation:(uint64_t)a1 didFailWithError:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] Failed to open the target app - %@%@", (void)v3, DWORD2(v3));
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] accept operation completed with success%@", v2, v3, v4, v5, v6);
}

void __55__BRCSharingAcceptFlowOperation__startShareAccept_step__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: No operation error and no share id%@", v2, v3, v4, v5, v6);
}

void __73__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnOwner_step__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: %@ wasn't found after syncing down on the owner%@");
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] item is on disk, jump to prepare to open shared document%@", v2, v3, v4, v5, v6);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Preparing side fault%@");
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self->_shareMetadata%@", v2, v3, v4, v5, v6);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: document doesn't exists anymore%@", v2, v3, v4, v5, v6);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: child path already exists even though we should have just created the parent%@", v2, v3, v4, v5, v6);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] created link shared item-to-be on disk: %@%@", (void)v3, DWORD2(v3));
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] can't make the file live: %@%@", (void)v3, DWORD2(v3));
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_5(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = 0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D353B000, a2, (os_log_type_t)0x90u, "[ERROR] can't resolve child path %@%@", (uint8_t *)&v2, 0x16u);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_6(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] created shared item-to-be on disk: %@%@", (void)v3, DWORD2(v3));
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_8(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] created link shared item-to-be in db: %@%@", (void)v3, DWORD2(v3));
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_9(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] created shared item-to-be in db: %@%@", (void)v3, DWORD2(v3));
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_10()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: item isn't a document or directory%@", v2, v3, v4, v5, v6);
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_11(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] share item %@ is in transient state, should try again later%@", (void)v3, DWORD2(v3));
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_12(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: item is in an unknown state: %@:%@", (void)v3, DWORD2(v3));
}

void __60__BRCSharingAcceptFlowOperation__createSideFaultOnDisk_step__block_invoke_148_cold_13(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] found share item %@%@", (void)v3, DWORD2(v3));
}

- (void)_openSharedSideFaultFileWithAppID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Skipping open in app%@", v2, v3, v4, v5, v6);
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] can't get bookmark string at %@%@", v4, v5, v6, v7, v8);
}

void __67__BRCSharingAcceptFlowOperation__openSharedSideFaultFileWithAppID___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_3_0();
  __int16 v8 = 2112;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] doing open operation on \"%@\" with \"%@\"%@", v7, 0x20u);
}

void __56__BRCSharingAcceptFlowOperation__finishShareAccept_step__block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Share accept finished with error %@%@", (void)v3, DWORD2(v3));
}

- (void)_createServerFaultIfPossibleWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _clientZone%@", v2, v3, v4, v5, v6);
}

- (void)_createServerFaultIfPossibleWithCompletion:.cold.3()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Creating server fault if possible%@");
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: rootRecordID%@", v2, v3, v4, v5, v6);
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] We don't have need to fetch deeply into the folder. Letting the list directory take care of fetching%@", v2, v3, v4, v5, v6);
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_190_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Failed to fetch record for server fault - %@%@", (void)v3, DWORD2(v3));
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_191_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: couldn't save to server truth when creating server fault%@", v2, v3, v4, v5, v6);
}

void __76__BRCSharingAcceptFlowOperation__createServerFaultIfPossibleWithCompletion___block_invoke_191_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Finished fetching records for server fault%@", v2, v3, v4, v5, v6);
}

void __77__BRCSharingAcceptFlowOperation__waitForSharedItemToSyncDownOnRecipient_step__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] %@ wasn't found after syncing down%@");
}

void __70__BRCSharingAcceptFlowOperation__prepareToDownloadSharedDocument_step__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !li.isReserved%@", v2, v3, v4, v5, v6);
}

void __70__BRCSharingAcceptFlowOperation__prepareToDownloadSharedDocument_step__block_invoke_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] Invalid kind of item; %@%@", (void)v3, DWORD2(v3));
}

@end