@interface CKModalTranscriptController
- (BOOL)_canShowWhileLocked;
- (BOOL)_deviceIsLocked;
- (BOOL)_insertMediaObject:(id)a3;
- (BOOL)_shouldAllowCameraAttachments;
- (BOOL)_shouldUseDefaultFirstResponder;
- (BOOL)_shouldUseExistingConversations;
- (BOOL)alreadySetUp;
- (BOOL)appearCompleted;
- (BOOL)cameraSelectionDisabled;
- (BOOL)forceMMS;
- (BOOL)messageEntryViewShouldBeginEditing:(id)a3;
- (BOOL)messageEntryViewWidth:(double *)a3 andOffset:(double *)a4;
- (BOOL)mimeType;
- (BOOL)shouldDismissAfterSend;
- (CKChatEagerUploadController)eagerUploadController;
- (CKComposeAssetExplorerManager)assetExplorerManager;
- (CKModalTranscriptController)initWithNavigationController:(id)a3;
- (NSMutableArray)deferredInsertMediaObjectBlocks;
- (NSMutableArray)partsToInsert;
- (NSMutableArray)typesToInsert;
- (double)_offsetForScreenWidth:(double)a3 containerWidth:(double)a4 windowOffset:(CGPoint)a5;
- (id)proposedParticipantHandles;
- (int)entryViewInvisible;
- (void)_conversationListDidFinishLoading:(id)a3;
- (void)_insertMediaObjectAndReturnFrame:(id)a3;
- (void)_setConversationDeferredSetup;
- (void)_setEntryViewVisible:(BOOL)a3;
- (void)createCompositionForPluginPayload:(id)a3 shelfMediaObject:(id)a4 collaborationShareOptions:(id)a5 completionHandler:(id)a6;
- (void)disableCameraAttachments;
- (void)hideEntryViewContent:(BOOL)a3;
- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6;
- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7;
- (void)insertData:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5;
- (void)insertFileURL:(id)a3 filename:(id)a4 fileIsResolved:(BOOL)a5 transcoderUserInfo:(id)a6 fullyRealizedPreview:(id)a7 rawPreview:(id)a8 appendedVideoURL:(id)a9 completion:(id)a10;
- (void)insertFileURLAsMediaObject:(id)a3 filename:(id)a4 fileIsResolved:(BOOL)a5 transcoderUserInfo:(id)a6 fullyRealizedPreview:(id)a7 rawPreview:(id)a8 appendedVideoURL:(id)a9;
- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7;
- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8;
- (void)insertGroupActivity:(id)a3;
- (void)insertMessage:(id)a3 bundleProxy:(id)a4;
- (void)insertMessage:(id)a3 bundleProxy:(id)a4 extensionBundleIdentifier:(id)a5;
- (void)insertRichLinkWithCloudKitShare:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6;
- (void)insertRichLinkWithCloudKitShare:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7;
- (void)insertRichLinkWithURL:(id)a3 data:(id)a4;
- (void)insertRichLinkWithURL:(id)a3 sendAsCopyURL:(id)a4 data:(id)a5 collaborationType:(int64_t)a6 collaborationShareOptions:(id)a7 metadata:(id)a8 isCollaboration:(BOOL)a9 completionHandler:(id)a10;
- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8;
- (void)loadChatInputController;
- (void)registerForNotifications;
- (void)sendComposition:(id)a3;
- (void)setAlreadySetUp:(BOOL)a3;
- (void)setAppearCompleted:(BOOL)a3;
- (void)setAssetExplorerManager:(id)a3;
- (void)setCameraSelectionDisabled:(BOOL)a3;
- (void)setCanEditRecipients:(BOOL)a3;
- (void)setComposition:(id)a3;
- (void)setCompositionForPluginPayload:(id)a3;
- (void)setCompositionForPluginPayload:(id)a3 shelfMediaObject:(id)a4 collaborationShareOptions:(id)a5;
- (void)setCompositionForPluginPayload:(id)a3 shelfMediaObject:(id)a4 collaborationShareOptions:(id)a5 completionHandler:(id)a6;
- (void)setDeferredInsertMediaObjectBlocks:(id)a3;
- (void)setEagerUploadController:(id)a3;
- (void)setEntryView:(id)a3;
- (void)setEntryViewInvisible:(int)a3;
- (void)setForceMMS:(BOOL)a3;
- (void)setMimeType:(BOOL)a3;
- (void)setPartsToInsert:(id)a3;
- (void)setPendingAddresses:(id)a3;
- (void)setTextEntryContentsVisible:(BOOL)a3;
- (void)setTypesToInsert:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKModalTranscriptController

- (CKModalTranscriptController)initWithNavigationController:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKModalTranscriptController;
  v3 = [(CKComposeChatController *)&v11 initWithRecipientAddresses:0 composition:0 bizIntent:0];
  if (v3)
  {
    v4 = objc_alloc_init(CKChatEagerUploadController);
    eagerUploadController = v3->_eagerUploadController;
    v3->_eagerUploadController = v4;

    if (([MEMORY[0x1E4F42B08] usesInputSystemUI] & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F42B20] sharedInstance];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        v8 = [MEMORY[0x1E4F42B20] sharedInstance];
        v9 = objc_opt_new();
        [v8 setDelegate:v9 force:1];
      }
    }
    IMIsSupportedUTIType();
  }
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKModalTranscriptController;
  [(CKShareSheetChatController *)&v6 viewDidAppear:a3];
  [(CKModalTranscriptController *)self setAppearCompleted:1];
  v4 = [(CKChatController *)self entryView];
  v5 = [v4 contentView];
  [v5 setForceEnsureTextViewVisble:0];
}

- (void)setComposition:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKModalTranscriptController;
  [(CKChatController *)&v4 setComposition:a3];
  [(CKChatEagerUploadController *)self->_eagerUploadController cancelAll];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setEntryView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKModalTranscriptController;
  [(CKChatController *)&v6 setEntryView:a3];
  if (![(CKModalTranscriptController *)self appearCompleted])
  {
    objc_super v4 = [(CKChatController *)self entryView];
    v5 = [v4 contentView];
    [v5 setForceEnsureTextViewVisble:1];
  }
}

- (void)_insertMediaObjectAndReturnFrame:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CKModalTranscriptController__insertMediaObjectAndReturnFrame___block_invoke;
    aBlock[3] = &unk_1E5620AF8;
    aBlock[4] = self;
    id v13 = v4;
    objc_super v6 = _Block_copy(aBlock);
    char v7 = v6;
    if (self->_alreadySetUp)
    {
      (*((void (**)(void *))v6 + 2))(v6);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)objc_super v11 = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "!_alreadySetUp, deferring insert block", v11, 2u);
        }
      }
      v9 = [(CKModalTranscriptController *)self deferredInsertMediaObjectBlocks];
      v10 = _Block_copy(v7);
      [v9 addObject:v10];
    }
  }
}

void __64__CKModalTranscriptController__insertMediaObjectAndReturnFrame___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) composition];
  if (v2) {
    goto LABEL_4;
  }
  v3 = [*(id *)(a1 + 32) prepopulatedComposition];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    v5 = [v4 prepopulatedComposition];
    [v4 setComposition:v5];

    v2 = [*(id *)(a1 + 32) composition];
LABEL_4:
    objc_super v6 = v2;
    char v7 = [v2 compositionByAppendingMediaObject:*(void *)(a1 + 40)];

    goto LABEL_5;
  }
  char v7 = +[CKComposition compositionWithMediaObject:*(void *)(a1 + 40) subject:0];
LABEL_5:
  v8 = [*(id *)(a1 + 32) conversation];
  if (![v8 recipientCount])
  {

    goto LABEL_13;
  }
  v9 = [*(id *)(a1 + 32) conversation];
  int v10 = [v9 canSendComposition:v7 error:0];

  if (v10)
  {
LABEL_13:
    [*(id *)(a1 + 32) setComposition:v7];
    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    objc_super v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Can't insert composition now, setting prepopulated composition", v12, 2u);
    }
  }
  [*(id *)(a1 + 32) setPrepopulatedComposition:v7];
LABEL_14:
}

- (BOOL)_insertMediaObject:(id)a3
{
  id v4 = a3;
  if (v4 && !self->_alreadySetUp)
  {
    v5 = [(CKChatController *)self composition];
    if (v5)
    {
      objc_super v6 = v5;
      char v7 = [v5 compositionByAppendingMediaObject:v4];
    }
    else
    {
      char v7 = +[CKComposition compositionWithMediaObject:v4 subject:0];
    }
    v8 = [(CKCoreChatController *)self conversation];
    int v9 = [v8 canSendComposition:v7 error:0];

    if (v9) {
      [(CKModalTranscriptController *)self setComposition:v7];
    }
  }
  return v4 != 0;
}

- (NSMutableArray)deferredInsertMediaObjectBlocks
{
  deferredInsertMediaObjectBlocks = self->_deferredInsertMediaObjectBlocks;
  if (!deferredInsertMediaObjectBlocks)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = self->_deferredInsertMediaObjectBlocks;
    self->_deferredInsertMediaObjectBlocks = v4;

    deferredInsertMediaObjectBlocks = self->_deferredInsertMediaObjectBlocks;
  }

  return deferredInsertMediaObjectBlocks;
}

- (void)insertRichLinkWithURL:(id)a3 data:(id)a4
{
  LOBYTE(v4) = 0;
  [(CKModalTranscriptController *)self insertRichLinkWithURL:a3 sendAsCopyURL:0 data:a4 collaborationType:0 collaborationShareOptions:0 metadata:0 isCollaboration:v4 completionHandler:0];
}

- (void)insertRichLinkWithURL:(id)a3 sendAsCopyURL:(id)a4 data:(id)a5 collaborationType:(int64_t)a6 collaborationShareOptions:(id)a7 metadata:(id)a8 isCollaboration:(BOOL)a9 completionHandler:(id)a10
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v44 = a4;
  id v45 = a5;
  id v46 = a7;
  id v17 = a8;
  id v18 = a10;
  v19 = (void (**)(void, void))v18;
  if (self->_alreadySetUp)
  {
    if (v18) {
      (*((void (**)(id, uint64_t))v18 + 2))(v18, 1);
    }
  }
  else
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [v20 startTimingForKey:@"insertRichLinkWithURL"];
    self->_alreadySetUp = 1;
    if ((v16 || a6 != 1) && (a6 != 3 || v17))
    {
      *(void *)buf = 0;
      v79 = buf;
      uint64_t v80 = 0x3032000000;
      v81 = __Block_byref_object_copy__56;
      v82 = __Block_byref_object_dispose__56;
      id v83 = 0;
      id v83 = +[CKBrowserItemPayload createBrowserItemPayloadWithURL:v16 data:v45];
      [*((id *)v79 + 5) setPayloadCollaborationType:a6];
      [*((id *)v79 + 5) setSendAsCopyURL:v44];
      v76[0] = 0;
      v76[1] = v76;
      v76[2] = 0x3032000000;
      v76[3] = __Block_byref_object_copy__56;
      v76[4] = __Block_byref_object_dispose__56;
      id v77 = 0;
      v74[0] = 0;
      v74[1] = v74;
      v74[2] = 0x3032000000;
      v74[3] = __Block_byref_object_copy__56;
      v74[4] = __Block_byref_object_dispose__56;
      id v75 = 0;
      id v29 = v16;
      id v75 = v29;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke;
      aBlock[3] = &unk_1E562A840;
      id v30 = v20;
      id v64 = v30;
      id v42 = v17;
      id v65 = v42;
      v69 = buf;
      id v43 = v46;
      id v66 = v43;
      v67 = self;
      v70 = v76;
      int64_t v72 = a6;
      BOOL v73 = a9;
      id v31 = v44;
      id v68 = v31;
      v71 = v74;
      v32 = _Block_copy(aBlock);
      if ([v29 isFileURL])
      {
        v33 = v30;
        id v39 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
        v38 = [v39 retainAccess];
        v34 = [MEMORY[0x1E4F28C98] readingIntentWithURL:v29 options:0];
        v84[0] = v34;
        v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:1];
        v40 = [MEMORY[0x1E4F28F08] mainQueue];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_129;
        v47[3] = &unk_1E562A930;
        v59 = v74;
        id v37 = v34;
        id v48 = v37;
        id v49 = v29;
        v60 = buf;
        BOOL v62 = a9;
        id v50 = v31;
        id v51 = v33;
        v61 = v76;
        id v57 = v32;
        id v35 = v39;
        id v52 = v35;
        id v36 = v38;
        id v53 = v36;
        id v54 = v43;
        v58 = v19;
        id v55 = v42;
        v56 = self;
        [v35 coordinateAccessWithIntents:v41 queue:v40 byAccessor:v47];

        id v30 = v33;
      }
      else
      {
        (*((void (**)(void *, void, void, id))v32 + 2))(v32, 0, 0, v43);
        if (v19) {
          v19[2](v19, 1);
        }
      }

      _Block_object_dispose(v74, 8);
      _Block_object_dispose(v76, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v21 = +[CKBrowserItemPayload browserItemPayloadForCollaborationWithURL:0 collaborationType:1];
      [v21 setSendAsCopy:!a9];
      v22 = [[CKComposition alloc] initWithText:0 subject:0 shelfPluginPayload:v21];
      [(CKModalTranscriptController *)self setComposition:v22];
      if (IMOSLoggingEnabled())
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Setting composition for the spinner for FP case.", buf, 2u);
        }
      }
      v24 = [(CKChatController *)self entryView];
      v25 = [v24 contentView];
      v26 = [v25 shelfPluginPayload];
      v27 = [v26 datasource];
      id v28 = (id)[v27 pluginPayload];

      if (v19) {
        v19[2](v19, 1);
      }
    }
  }
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(a1 + 32) startTimingForKey:@"setCompositionForPluginPayload"];
  id v10 = *(id *)(a1 + 40);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E562A7F0;
  uint64_t v36 = *(void *)(a1 + 72);
  id v30 = *(id *)(a1 + 48);
  id v11 = v9;
  uint64_t v12 = *(void *)(a1 + 56);
  id v31 = v11;
  uint64_t v32 = v12;
  uint64_t v37 = *(void *)(a1 + 80);
  id v33 = *(id *)(a1 + 32);
  id v13 = v7;
  id v34 = v13;
  id v14 = v8;
  id v35 = v14;
  v15 = (void (**)(void *, id))_Block_copy(aBlock);
  uint64_t v16 = *(void *)(a1 + 96);
  if (v16 == 3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSendAsCopy:*(unsigned char *)(a1 + 104) == 0];
    if (!*(unsigned char *)(a1 + 104))
    {
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setUrl:*(void *)(a1 + 64)];
      v19 = +[CKMediaObjectManager sharedInstance];
      id v20 = *(void **)(a1 + 64);
      v21 = [v20 lastPathComponent];
      v22 = [v21 stringByRemovingPercentEncoding];
      uint64_t v23 = [v19 mediaObjectWithFileURL:v20 filename:v22 transcoderUserInfo:0];
      uint64_t v24 = *(void *)(*(void *)(a1 + 80) + 8);
      v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
    goto LABEL_6;
  }
  if (!v16)
  {
LABEL_6:
    v15[2](v15, v10);
    goto LABEL_7;
  }
  id v17 = (void *)MEMORY[0x1E4F59BA8];
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_121;
  v26[3] = &unk_1E562A818;
  id v27 = v10;
  id v28 = v15;
  [v17 userNameAndEmail:v18 containerSetupInfo:0 completionHandler:v26];

LABEL_7:
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_3;
  block[3] = &unk_1E562A7C8;
  uint64_t v14 = *(void *)(a1 + 80);
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  objc_super v6 = *(void **)(a1 + 56);
  id v11 = v4;
  uint64_t v12 = v5;
  uint64_t v15 = *(void *)(a1 + 88);
  id v13 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  [*(id *)(a1 + 64) releaseAccess:*(void *)(a1 + 72)];
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCollaborationMetadata:*(void *)(a1 + 32)];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 48) summary];
    id v4 = v3;
    if (!v3)
    {
      v1 = CKFrameworkBundle();
      id v4 = [v1 localizedStringForKey:@"DEFAULT_COLLABORATION_OPTIONS_SUMMARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCollaborationOptionsSummary:v4];
    if (!v3)
    {
    }
  }
  uint64_t v5 = [*(id *)(a1 + 56) entryView];
  objc_super v6 = [v5 contentView];
  id v7 = [v6 shelfPluginPayload];
  id v8 = [v7 datasource];

  if (v8)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSkipConfigurePlugin:1];
    *(void *)location = 0;
    objc_initWeak((id *)location, *(id *)(a1 + 56));
    id v9 = *(void **)(a1 + 56);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_4;
    v19 = &unk_1E562A7A0;
    objc_copyWeak(&v21, (id *)location);
    uint64_t v20 = *(void *)(a1 + 72);
    [v9 setCompositionForPluginPayload:v10 shelfMediaObject:v11 collaborationShareOptions:v12 completionHandler:&v16];
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)location = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Datasource for existing view is nil. Setup the composition without a spinner animation.", location, 2u);
      }
    }
    [*(id *)(a1 + 56) setCompositionForPluginPayload:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) shelfMediaObject:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) collaborationShareOptions:*(void *)(a1 + 48)];
  }
  objc_msgSend(*(id *)(a1 + 64), "stopTimingForKey:", @"setCompositionForPluginPayload", v16, v17, v18, v19);
  [*(id *)(a1 + 64) stopTimingForKey:@"insertRichLinkWithURL"];
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 64);
      *(_DWORD *)location = 138412290;
      *(void *)&location[4] = v15;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "insertRichLinkWithURL timing: %@", location, 0xCu);
    }
  }
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_4(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Start spinner animation.", v11, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained entryView];
  uint64_t v5 = [v4 contentView];
  objc_super v6 = [v5 shelfPluginPayload];
  id v7 = [v6 datasource];
  [v7 updatePayloadForShelfAnimation:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = [v8 entryView];
  uint64_t v10 = [v9 contentView];
  [v10 setupShelfPluginPayload:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_121(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  uint64_t v11 = [v10 personNameComponentsFromString:v7];
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Updating metadata with email:%@, nameComponents: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  [*(id *)(a1 + 32) setInitiatorHandle:v8];
  [*(id *)(a1 + 32) setInitiatorNameComponents:v11];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_129(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) URL];
  uint64_t v5 = *(void *)(*(void *)(a1 + 120) + 8);
  objc_super v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Creating media object for File URL: %@", buf, 0xCu);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) setSendAsCopy:*(unsigned char *)(a1 + 144) == 0];
  if (*(unsigned char *)(a1 + 144) || (id v9 = *(void **)(a1 + 48)) == 0) {
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
  }
  id v10 = v9;
  [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) setSendAsCopyURL:v10];
  [*(id *)(a1 + 56) startTimingForKey:@"create_media_object"];
  uint64_t v11 = +[CKMediaObjectManager sharedInstance];
  uint64_t v12 = [v10 lastPathComponent];
  int v13 = [v12 stringByRemovingPercentEncoding];
  uint64_t v14 = [v11 mediaObjectWithFileURL:v10 filename:v13 transcoderUserInfo:0];
  uint64_t v15 = *(void *)(*(void *)(a1 + 136) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  [*(id *)(a1 + 56) stopTimingForKey:@"create_media_object"];
  if (*(unsigned char *)(a1 + 144))
  {
    if (*(void *)(a1 + 88))
    {
      (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
      uint64_t v17 = *(void *)(a1 + 112);
      if (v17) {
        (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, 1);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v43 = v24;
          _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "Did not receive metadata for file URL %@, fetching metadata", buf, 0xCu);
        }
      }
      id v25 = *(id *)(a1 + 80);
      id v31 = *(id *)(a1 + 104);
      id v26 = *(id *)(a1 + 64);
      id v27 = *(id *)(a1 + 72);
      id v32 = *(id *)(a1 + 112);
      id v28 = *(id *)(a1 + 56);
      id v29 = *(id *)(a1 + 40);
      id v30 = *(id *)(a1 + 88);
      SWCollaborationMetadataForDocumentURL();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Sending a copy with media object.", buf, 2u);
      }
    }
    v19 = (void *)MEMORY[0x1E4F59BA8];
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_133;
    v33[3] = &unk_1E562A890;
    id v39 = *(id *)(a1 + 104);
    id v34 = *(id *)(a1 + 64);
    id v35 = *(id *)(a1 + 72);
    id v36 = *(id *)(a1 + 80);
    id v40 = *(id *)(a1 + 112);
    id v21 = *(id *)(a1 + 88);
    uint64_t v22 = *(void *)(a1 + 96);
    id v37 = v21;
    uint64_t v38 = v22;
    long long v41 = *(_OWORD *)(a1 + 128);
    [v19 userNameAndEmail:v20 containerSetupInfo:0 completionHandler:v33];
  }
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_133(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2_134;
  v14[3] = &unk_1E562A868;
  id v15 = v9;
  id v23 = *(id *)(a1 + 72);
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v24 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 56);
  id v20 = v8;
  uint64_t v10 = *(void *)(a1 + 64);
  id v21 = v7;
  uint64_t v22 = v10;
  long long v25 = *(_OWORD *)(a1 + 88);
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2_134(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        int v13 = 138412290;
        uint64_t v14 = v4;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Error while trying to get the user name and email : %@.", (uint8_t *)&v13, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    uint64_t v5 = *(void *)(a1 + 104);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }
  }
  else
  {
    [*(id *)(a1 + 64) setInitiatorHandle:*(void *)(a1 + 72)];
    id v6 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    id v7 = [v6 personNameComponentsFromString:*(void *)(a1 + 80)];
    [*(id *)(a1 + 64) setInitiatorNameComponents:v7];
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 72);
        int v13 = 138412546;
        uint64_t v14 = v9;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Updating metadata with email: %@, nameComponents: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setCollaborationMetadata:*(void *)(a1 + 64)];
    uint64_t v10 = [*(id *)(a1 + 56) summary];
    id v11 = v10;
    if (!v10)
    {
      v1 = CKFrameworkBundle();
      id v11 = [v1 localizedStringForKey:@"DEFAULT_COLLABORATION_OPTIONS_SUMMARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setCollaborationOptionsSummary:v11];
    if (!v10)
    {
    }
    [*(id *)(a1 + 88) setCompositionForPluginPayload:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) shelfMediaObject:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) collaborationShareOptions:*(void *)(a1 + 56)];
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    uint64_t v12 = *(void *)(a1 + 104);
    if (v12) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);
    }
  }
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v8;
        __int16 v42 = 2112;
        id v43 = v6;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Error loading metadata for documentURL: %@ error: %@", buf, 0x16u);
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) setSendAsCopy:1];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
    uint64_t v11 = *(void *)(a1 + 40);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_137;
    v39[3] = &unk_1E562A7A0;
    objc_copyWeak(&v40, (id *)buf);
    v39[4] = *(void *)(a1 + 112);
    [v9 setCompositionForPluginPayload:v10 shelfMediaObject:0 collaborationShareOptions:v11 completionHandler:v39];
    uint64_t v12 = [*(id *)(a1 + 32) entryView];
    [v12 configureForDisplayMode:1];

    int v13 = [*(id *)(a1 + 32) entryView];
    [v13 updateEntryView];

    [*(id *)(a1 + 32) createCollaborationFailureAlertForFailedMetadataLoadWithFallback:1 URL:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    uint64_t v14 = *(void *)(a1 + 96);
    if (v14) {
      (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, 1);
    }
    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v15 = *(id *)(a1 + 40);
    if (!v15)
    {
      id v16 = [v5 userSelectedShareOptions];

      if (v16) {
        [v5 userSelectedShareOptions];
      }
      else {
      id v15 = [v5 defaultShareOptions];
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v18;
        __int16 v42 = 2112;
        id v43 = v5;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Successfully loaded metadata for documentURL: %@ metadata: %@", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 64) startTimingForKey:@"setCompositionForPluginPayload"];
    id v19 = (void *)MEMORY[0x1E4F59BA8];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_138;
    v26[3] = &unk_1E562A8E0;
    uint64_t v20 = *(void *)(a1 + 72);
    id v21 = *(id *)(a1 + 80);
    uint64_t v22 = *(void *)(a1 + 112);
    id v27 = v21;
    uint64_t v37 = v22;
    id v28 = v5;
    id v23 = *(id *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 32);
    id v29 = v23;
    uint64_t v30 = v24;
    uint64_t v38 = *(void *)(a1 + 120);
    id v31 = v15;
    id v32 = *(id *)(a1 + 64);
    id v35 = *(id *)(a1 + 88);
    id v33 = *(id *)(a1 + 48);
    id v34 = *(id *)(a1 + 56);
    id v36 = *(id *)(a1 + 96);
    id v25 = v15;
    [v19 userNameAndEmail:v20 containerSetupInfo:0 completionHandler:v26];
  }
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_137(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained entryView];
  id v5 = [v4 contentView];
  id v6 = [v5 shelfPluginPayload];
  id v7 = [v6 datasource];
  [v7 updatePayloadForShelfAnimation:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  id v10 = objc_loadWeakRetained(v2);
  uint64_t v8 = [v10 entryView];
  uint64_t v9 = [v8 contentView];
  [v9 setupShelfPluginPayload:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_138(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2_139;
  v13[3] = &unk_1E562A8B8;
  id v14 = *(id *)(a1 + 32);
  id v15 = v6;
  uint64_t v7 = *(void *)(a1 + 112);
  id v16 = v5;
  uint64_t v26 = v7;
  id v17 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = *(void **)(a1 + 64);
  id v18 = v8;
  uint64_t v19 = v9;
  uint64_t v27 = *(void *)(a1 + 120);
  id v20 = v10;
  id v21 = *(id *)(a1 + 72);
  id v24 = *(id *)(a1 + 96);
  id v22 = *(id *)(a1 + 80);
  id v23 = *(id *)(a1 + 88);
  id v25 = *(id *)(a1 + 104);
  id v11 = v5;
  id v12 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

void __159__CKModalTranscriptController_insertRichLinkWithURL_sendAsCopyURL_data_collaborationType_collaborationShareOptions_metadata_isCollaboration_completionHandler___block_invoke_2_139(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1 + 32;
  [*(id *)(a1 + 32) setInitiatorHandle:*(void *)(a1 + 40)];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  id v5 = [v4 personNameComponentsFromString:*(void *)(v3 + 16)];
  [*(id *)v3 setInitiatorNameComponents:v5];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v13 = 138412546;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Updating metadata with email: %@, nameComponents: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) setCollaborationMetadata:*(void *)(a1 + 56)];
  id v8 = [*(id *)(a1 + 64) summary];
  uint64_t v9 = v8;
  if (!v8)
  {
    v1 = CKFrameworkBundle();
    uint64_t v9 = [v1 localizedStringForKey:@"DEFAULT_COLLABORATION_OPTIONS_SUMMARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) setCollaborationOptionsSummary:v9];
  if (!v8)
  {
  }
  [*(id *)(a1 + 72) setCompositionForPluginPayload:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) shelfMediaObject:*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40) collaborationShareOptions:*(void *)(a1 + 80)];
  [*(id *)(a1 + 88) stopTimingForKey:@"setCompositionForPluginPayload"];
  [*(id *)(a1 + 88) stopTimingForKey:@"insertRichLinkWithURL"];
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 88);
      int v13 = 138412290;
      uint64_t v14 = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "insertRichLinkWithURL timing: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 112) + 16))();
  uint64_t v12 = *(void *)(a1 + 120);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, 1);
  }
}

- (void)insertRichLinkWithCloudKitShare:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v39 = a4;
  id v11 = a5;
  if (!self->_alreadySetUp)
  {
    id v37 = v11;
    self->_alreadySetUp = 1;
    uint64_t v12 = [v10 URL];
    int v13 = +[CKBrowserItemPayload createBrowserItemPayloadWithURL:v12 data:0];

    [v13 setPayloadCollaborationType:2];
    [v13 setCloudKitShare:v10];
    [v13 setSendAsCopy:!v6];
    uint64_t v38 = [v10 URL];
    uint64_t v30 = [v38 absoluteString];
    id v35 = [v38 fragment];
    id v33 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];
    id v36 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F19DD0]];
    if (v36)
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
    }
    else
    {
      uint64_t v14 = 0;
    }
    if (![v14 conformsToType:*MEMORY[0x1E4F44408]]
      || ![v14 conformsToType:*MEMORY[0x1E4F44378]]
      || ![v14 conformsToType:*MEMORY[0x1E4F44390]]
      || ([v14 conformsToType:*MEMORY[0x1E4F444D8]] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v14;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Setting contentType to nil for a non file type. was: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      uint64_t v14 = 0;
    }
    if (v35)
    {
      id v16 = [NSString stringWithFormat:@"#%@", v35];
      id v31 = [v30 stringByReplacingOccurrencesOfString:v16 withString:&stru_1EDE4CA38];
    }
    else
    {
      id v31 = &stru_1EDE4CA38;
    }
    id v32 = [MEMORY[0x1E4F1C9C8] date];
    id v34 = [v10 currentUserParticipant];
    uint64_t v17 = [v34 userIdentity];
    id v18 = [v17 lookupInfo];
    uint64_t v19 = [v18 phoneNumber];
    id v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      id v21 = [v18 emailAddress];
    }
    id v22 = v21;

    id v23 = [v17 nameComponents];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__56;
    id v48 = __Block_byref_object_dispose__56;
    id v49 = 0;
    if ([MEMORY[0x1E4F3BDE0] instancesRespondToSelector:sel_initWithCollaborationIdentifier_title_defaultShareOptions_creationDate_contentType_initiatorHandle_initiatorNameComponents_containerSetupInfo_sourceProcessData_])
    {
      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F3BDE0]) initWithCollaborationIdentifier:v31 title:v33 defaultShareOptions:v37 creationDate:v32 contentType:v14 initiatorHandle:v22 initiatorNameComponents:v23 containerSetupInfo:v39 sourceProcessData:0];
      id v25 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v24;
    }
    else
    {
      id v26 = objc_alloc(MEMORY[0x1E4F3BDE0]);
      id v25 = [v37 optionsGroups];
      uint64_t v27 = [v26 initWithCollaborationIdentifier:v31 title:v33 defaultOptions:v25 creationDate:v32 contentType:v14 initiatorHandle:v22 initiatorNameComponents:v23];
      id v28 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v27;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke;
    block[3] = &unk_1E5625850;
    p_long long buf = &buf;
    id v41 = v13;
    id v42 = v37;
    id v43 = self;
    id v29 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);

    _Block_object_dispose(&buf, 8);
    id v11 = v37;
  }
}

void __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F59BA8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke_2;
  v5[3] = &unk_1E562A980;
  uint64_t v9 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 userNameAndEmail:0 containerSetupInfo:0 completionHandler:v5];
}

void __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke_3;
  v11[3] = &unk_1E562A958;
  uint64_t v17 = *(void *)(a1 + 56);
  id v12 = v6;
  id v13 = v5;
  id v14 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v15 = v7;
  uint64_t v16 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __124__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 72;
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setInitiatorHandle:*(void *)(a1 + 32)];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  uint64_t v4 = [v3 personNameComponentsFromString:*(void *)(v2 - 32)];
  [*(id *)(*(void *)(*(void *)v2 + 8) + 40) setInitiatorNameComponents:v4];
  [*(id *)(a1 + 48) setCollaborationMetadata:*(void *)(*(void *)(*(void *)v2 + 8) + 40)];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Updating metadata for CloudKit with email:%@, nameComponents: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    if ([*(id *)(a1 + 48) payloadCollaborationType] == 2
      && ([*(id *)(a1 + 48) containerSetupInfo],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [v7 containerOptions],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isServiceManatee],
          v8,
          v7,
          v9))
    {
      [*(id *)(a1 + 48) setCollaborationOptionsSummary:0];
    }
    else
    {
      id v10 = [*(id *)(a1 + 56) summary];
      if (v10)
      {
        [*(id *)(a1 + 48) setCollaborationOptionsSummary:v10];
      }
      else
      {
        id v11 = CKFrameworkBundle();
        id v12 = [v11 localizedStringForKey:@"DEFAULT_COLLABORATION_OPTIONS_SUMMARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
        [*(id *)(a1 + 48) setCollaborationOptionsSummary:v12];
      }
    }
  }
  [*(id *)(a1 + 64) setCompositionForPluginPayload:*(void *)(a1 + 48) shelfMediaObject:0 collaborationShareOptions:*(void *)(a1 + 56)];
}

- (void)insertRichLinkWithCloudKitShare:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v57 = a4;
  int v13 = (uint64_t (*)(uint64_t, uint64_t))a5;
  uint64_t v14 = (void (**)(id, uint64_t))a7;
  if (IMOSLoggingEnabled())
  {
    __int16 v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v57;
      *(_WORD *)&buf[22] = 2112;
      id v65 = v13;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Inserting Rich Links With CloudKitShare: %@, containerSetupInfo: %@, collaborationShareOptions: %@", buf, 0x20u);
    }
  }
  if (self->_alreadySetUp) {
    goto LABEL_36;
  }
  self->_alreadySetUp = 1;
  uint64_t v16 = [v12 URL];
  BOOL v17 = v16 == 0;

  if (!v17)
  {
    id v18 = [v12 URL];
    v56 = +[CKBrowserItemPayload createBrowserItemPayloadWithURL:v18 data:0];

    [v56 setPayloadCollaborationType:2];
    [v56 setCloudKitShare:v12];
    [v56 setSendAsCopy:!v8];
    uint64_t v19 = [v12 URL];
    id v20 = [v19 absoluteString];
    uint64_t v21 = [v19 fragment];
    id v52 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];
    id v54 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F19DD0]];
    if (v54)
    {
      id v22 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
    }
    else
    {
      id v22 = 0;
    }
    id v31 = v22;
    if (![v22 conformsToType:*MEMORY[0x1E4F44408]]
      || ![v31 conformsToType:*MEMORY[0x1E4F44378]]
      || ![v31 conformsToType:*MEMORY[0x1E4F44390]]
      || ([v31 conformsToType:*MEMORY[0x1E4F444D8]] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v31;
          _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Setting contentType to nil for a non file type. was: %@", buf, 0xCu);
        }
      }
      id v31 = 0;
    }
    id v51 = v31;
    if (v21)
    {
      id v33 = [NSString stringWithFormat:@"#%@", v21];
      v47 = [v20 stringByReplacingOccurrencesOfString:v33 withString:&stru_1EDE4CA38];
    }
    else
    {
      v47 = &stru_1EDE4CA38;
    }
    uint64_t v50 = [MEMORY[0x1E4F1C9C8] date];
    id v53 = [v12 currentUserParticipant];
    id v34 = [v53 userIdentity];
    id v55 = [v34 lookupInfo];
    id v35 = [v55 phoneNumber];
    id v36 = v35;
    if (v35)
    {
      id v49 = v35;
    }
    else
    {
      id v49 = [v55 emailAddress];
    }

    id v48 = [v34 nameComponents];
    id v37 = (void *)v21;
    uint64_t v38 = v20;
    id v39 = v19;
    id v40 = v13;
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v65 = __Block_byref_object_copy__56;
    id v66 = __Block_byref_object_dispose__56;
    id v67 = 0;
    if ([MEMORY[0x1E4F3BDE0] instancesRespondToSelector:sel_initWithCollaborationIdentifier_title_defaultShareOptions_creationDate_contentType_initiatorHandle_initiatorNameComponents_containerSetupInfo_sourceProcessData_])
    {
      uint64_t v41 = [objc_alloc(MEMORY[0x1E4F3BDE0]) initWithCollaborationIdentifier:v47 title:v52 defaultShareOptions:v13 creationDate:v50 contentType:v51 initiatorHandle:v49 initiatorNameComponents:v48 containerSetupInfo:v57 sourceProcessData:0];
      id v42 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v41;
    }
    else
    {
      id v43 = objc_alloc(MEMORY[0x1E4F3BDE0]);
      id v42 = [v40 optionsGroups];
      uint64_t v44 = [v43 initWithCollaborationIdentifier:v47 title:v52 defaultOptions:v42 creationDate:v50 contentType:v51 initiatorHandle:v49 initiatorNameComponents:v48];
      id v45 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v44;
    }
    int v13 = v40;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke;
    block[3] = &unk_1E562A9A8;
    id v59 = v57;
    id v60 = v56;
    v63 = buf;
    v61 = self;
    BOOL v62 = v40;
    id v46 = v56;
    dispatch_async(MEMORY[0x1E4F14428], block);

    _Block_object_dispose(buf, 8);
LABEL_36:
    if (v14) {
      v14[2](v14, 1);
    }
    goto LABEL_38;
  }
  id v23 = +[CKBrowserItemPayload browserItemPayloadForCollaborationWithURL:0 collaborationType:2];
  [v23 setSendAsCopy:!v8];
  uint64_t v24 = [[CKComposition alloc] initWithText:0 subject:0 shelfPluginPayload:v23];
  [(CKModalTranscriptController *)self setComposition:v24];
  if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Setting composition for the spinner for CloudKit case.", buf, 2u);
    }
  }
  id v26 = [(CKChatController *)self entryView];
  uint64_t v27 = [v26 contentView];
  id v28 = [v27 shelfPluginPayload];
  id v29 = [v28 datasource];
  id v30 = (id)[v29 pluginPayload];

  if (v14) {
    v14[2](v14, 1);
  }

LABEL_38:
}

void __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F59BA8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_2;
  v7[3] = &unk_1E562A980;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  [v2 userNameAndEmail:0 containerSetupInfo:v3 completionHandler:v7];
}

void __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_3;
  v12[3] = &unk_1E562A958;
  uint64_t v18 = *(void *)(a1 + 56);
  id v13 = v6;
  id v14 = v5;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v15 = v7;
  uint64_t v16 = v8;
  id v17 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 72;
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setInitiatorHandle:*(void *)(a1 + 32)];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  id v4 = [v3 personNameComponentsFromString:*(void *)(v2 - 32)];
  [*(id *)(*(void *)(*(void *)v2 + 8) + 40) setInitiatorNameComponents:v4];
  [*(id *)(a1 + 48) setCollaborationMetadata:*(void *)(*(void *)(*(void *)v2 + 8) + 40)];
  id v5 = *(void **)(*(void *)(*(void *)v2 + 8) + 40);
  if (v5
    && ([v5 initiatorHandle], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v8;
        __int16 v31 = 2112;
        id v32 = v4;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Updating metadata for CloudKit with email:%@, nameComponents: %@", buf, 0x16u);
      }
    }
    if (objc_opt_respondsToSelector())
    {
      if ([*(id *)(a1 + 48) payloadCollaborationType] == 2
        && ([*(id *)(a1 + 48) containerSetupInfo],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            [v9 containerOptions],
            id v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = [v10 isServiceManatee],
            v10,
            v9,
            v11))
      {
        [*(id *)(a1 + 48) setCollaborationOptionsSummary:0];
      }
      else
      {
        uint64_t v16 = [*(id *)(a1 + 64) summary];
        if (v16)
        {
          [*(id *)(a1 + 48) setCollaborationOptionsSummary:v16];
        }
        else
        {
          id v17 = CKFrameworkBundle();
          uint64_t v18 = [v17 localizedStringForKey:@"DEFAULT_COLLABORATION_OPTIONS_SUMMARY" value:&stru_1EDE4CA38 table:@"ChatKit"];
          [*(id *)(a1 + 48) setCollaborationOptionsSummary:v18];
        }
      }
    }
    uint64_t v19 = [*(id *)(a1 + 56) entryView];
    id v20 = [v19 contentView];
    uint64_t v21 = [v20 shelfPluginPayload];
    id v22 = [v21 datasource];

    if (v22)
    {
      [*(id *)(a1 + 48) setSkipConfigurePlugin:1];
      *(void *)long long buf = 0;
      objc_initWeak((id *)buf, *(id *)(a1 + 56));
      id v23 = *(void **)(a1 + 56);
      uint64_t v24 = *(void *)(a1 + 48);
      uint64_t v25 = *(void *)(a1 + 64);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_151;
      v27[3] = &unk_1E5625BD8;
      objc_copyWeak(&v29, (id *)buf);
      id v28 = *(id *)(a1 + 48);
      [v23 setCompositionForPluginPayload:v24 shelfMediaObject:0 collaborationShareOptions:v25 completionHandler:v27];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Datasource for existing view is nil. Setup the composition without a spinner annimation.", buf, 2u);
        }
      }
      [*(id *)(a1 + 56) setCompositionForPluginPayload:*(void *)(a1 + 48) shelfMediaObject:0 collaborationShareOptions:*(void *)(a1 + 64)];
    }
  }
  else
  {
    id v13 = *(void **)(a1 + 56);
    id v12 = (id *)(a1 + 56);
    [v13 setComposition:0];
    id v14 = [*v12 entryView];
    [v14 configureForDisplayMode:1];

    id v15 = [*v12 entryView];
    [v15 updateEntryView];

    [*v12 createCollaborationFailureAlertForFailedMetadataLoadWithFallback:0 URL:0];
  }
}

void __142__CKModalTranscriptController_insertRichLinkWithCloudKitShare_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler___block_invoke_151(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained entryView];
  id v5 = [v4 contentView];
  id v6 = [v5 shelfPluginPayload];
  id v7 = [v6 datasource];
  [v7 updatePayloadForShelfAnimation:*(void *)(a1 + 32)];

  id v10 = objc_loadWeakRetained(v2);
  uint64_t v8 = [v10 entryView];
  uint64_t v9 = [v8 contentView];
  [v9 setupShelfPluginPayload:*(void *)(a1 + 32)];
}

- (void)setCompositionForPluginPayload:(id)a3
{
}

- (void)createCompositionForPluginPayload:(id)a3 shelfMediaObject:(id)a4 collaborationShareOptions:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = (id *)&v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__56;
  id v28 = __Block_byref_object_dispose__56;
  id v29 = 0;
  id v29 = [(CKChatController *)self composition];
  if (v11)
  {
    id v14 = [(CKChatController *)self composition];
    id v15 = [v14 compositionByAppendingText:0 shelfPluginPayload:0 shelfMediaObject:v11 collaborationShareOptions:v12];

    uint64_t v16 = [(CKChatController *)self composition];
    id v17 = v15;
    if (!v16)
    {
      id v17 = +[CKComposition compositionWithShelfMediaObject:v11];
    }
    objc_storeStrong(v25 + 5, v17);
    if (!v16) {
  }
    }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __126__CKModalTranscriptController_createCompositionForPluginPayload_shelfMediaObject_collaborationShareOptions_completionHandler___block_invoke;
  v20[3] = &unk_1E562A9D0;
  id v23 = &v24;
  v20[4] = self;
  id v18 = v12;
  id v21 = v18;
  id v19 = v13;
  id v22 = v19;
  +[CKComposition compositionWithShelfPluginPayload:v10 completionHandler:v20];

  _Block_object_dispose(&v24, 8);
}

void __126__CKModalTranscriptController_createCompositionForPluginPayload_shelfMediaObject_collaborationShareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  if (v7)
  {
    uint64_t v8 = [v7 compositionByAppendingComposition:v17];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    id v11 = v17;
    id v10 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v11;
  }

  id v12 = [*(id *)(a1 + 32) conversation];
  int v13 = [v12 canSendComposition:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) error:0];

  if (v13)
  {
    uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) compositionWithCollaborationShareOptions:*(void *)(a1 + 40)];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)setCompositionForPluginPayload:(id)a3 shelfMediaObject:(id)a4 collaborationShareOptions:(id)a5 completionHandler:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v37 = 0;
  uint64_t v38 = (id *)&v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__56;
  uint64_t v41 = __Block_byref_object_dispose__56;
  id v42 = 0;
  id v42 = [(CKChatController *)self composition];
  if (v11)
  {
    uint64_t v14 = [(CKChatController *)self composition];
    uint64_t v15 = [v14 compositionByAppendingText:0 shelfPluginPayload:0 shelfMediaObject:v11 collaborationShareOptions:v12];

    uint64_t v16 = [(CKChatController *)self composition];
    id v17 = v15;
    if (!v16)
    {
      id v17 = +[CKComposition compositionWithShelfMediaObject:v11];
    }
    objc_storeStrong(v38 + 5, v17);
    if (!v16) {
  }
    }
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  __int16 v31 = __123__CKModalTranscriptController_setCompositionForPluginPayload_shelfMediaObject_collaborationShareOptions_completionHandler___block_invoke;
  id v32 = &unk_1E562A9D0;
  id v36 = &v37;
  uint64_t v33 = self;
  id v18 = v12;
  id v34 = v18;
  id v19 = v13;
  id v35 = v19;
  id v20 = _Block_copy(&v29);
  int v21 = objc_msgSend(v10, "shouldStageAsEmbeddedTextAttachment", v29, v30, v31, v32, v33);
  if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = @"NO";
      if (v21) {
        id v23 = @"YES";
      }
      *(_DWORD *)long long buf = 138412290;
      id v46 = v23;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Preparing composition for given pluginPayload. wantsEmbeddedRichLinkTreatment={%@}", buf, 0xCu);
    }
  }
  if (v21)
  {
    uint64_t v24 = [v10 url];
    uint64_t v25 = +[CKEmbeddedRichLinkConfiguration richLinkConfigurationWithURL:v24];
    [v25 setPluginPayload:v10];
    id v43 = @"EmbeddedRichLinkConfiguration";
    uint64_t v44 = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v27 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v28 = (void *)[v27 initWithString:*MEMORY[0x1E4F6C110] attributes:v26];
    +[CKComposition compositionWithText:v28 subject:0 shelfPluginPayload:0 completionHandler:v20];
  }
  else
  {
    +[CKComposition compositionWithShelfPluginPayload:v10 completionHandler:v20];
  }

  _Block_object_dispose(&v37, 8);
}

void __123__CKModalTranscriptController_setCompositionForPluginPayload_shelfMediaObject_collaborationShareOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  if (v7)
  {
    uint64_t v8 = [v7 compositionByAppendingComposition:v18];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    id v11 = v18;
    id v10 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v11;
  }

  id v12 = [*(id *)(a1 + 32) conversation];
  int v13 = [v12 canSendComposition:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) error:0];

  if (v13)
  {
    uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) compositionWithCollaborationShareOptions:*(void *)(a1 + 40)];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    [*(id *)(a1 + 32) setComposition:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v17 = *(void *)(a1 + 48);
    if (v17) {
      (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, 1);
    }
  }
}

- (void)setCompositionForPluginPayload:(id)a3 shelfMediaObject:(id)a4 collaborationShareOptions:(id)a5
{
}

- (void)insertMessage:(id)a3 bundleProxy:(id)a4
{
}

- (void)insertMessage:(id)a3 bundleProxy:(id)a4 extensionBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && !self->_alreadySetUp)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke;
    aBlock[3] = &unk_1E5621088;
    id v36 = v9;
    id v37 = v10;
    id v11 = v8;
    id v38 = v11;
    uint64_t v39 = self;
    id v12 = (void (**)(void))_Block_copy(aBlock);
    int v13 = [v11 layout];
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    char v16 = [v15 isEqualToString:@"MSMessageLiveLayout"];

    if (v16)
    {
      uint64_t v17 = +[CKBalloonPluginManager sharedInstance];
      int v18 = [v17 hasLoadedExtensions];

      if (!v18)
      {
        if (IMOSLoggingEnabled())
        {
          int v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Waiting for extensions to load before inserting message", buf, 2u);
          }
        }
        *(void *)long long buf = 0;
        uint64_t v30 = buf;
        uint64_t v31 = 0x3032000000;
        id v32 = __Block_byref_object_copy__56;
        uint64_t v33 = __Block_byref_object_dispose__56;
        id v34 = 0;
        id v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v23 = [MEMORY[0x1E4F28F08] mainQueue];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_179;
        v26[3] = &unk_1E562A9F8;
        id v28 = buf;
        id v27 = v12;
        uint64_t v24 = [v22 addObserverForName:@"CKBrowserSelectionControllerDataSourceChangedNotification" object:0 queue:v23 usingBlock:v26];
        uint64_t v25 = (void *)*((void *)v30 + 5);
        *((void *)v30 + 5) = v24;

        _Block_object_dispose(buf, 8);
        goto LABEL_18;
      }
      v12[2](v12);
      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          id v20 = "Extensions were loaded, inserted message";
LABEL_11:
          _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, v20, buf, 2u);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else
    {
      v12[2](v12);
      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          id v20 = "Non-live layout, inserted message";
          goto LABEL_11;
        }
LABEL_12:
      }
    }
LABEL_18:
  }
}

void __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = [v2 entitlementValueForKey:@"com.apple.private.messages.associated-message-extension-bundle-identifiers" ofClass:v3 valuesOfClass:objc_opt_class()];
  if ([*(id *)(a1 + 40) length]
    && [*(id *)(a1 + 40) hasPrefix:@"com.apple."]
    && [v4 containsObject:*(void *)(a1 + 40)])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v39 = v6;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Overriding pluginKitProxy identifier with %@", buf, 0xCu);
      }
    }
    id v7 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:*(void *)(a1 + 40)];
    uint64_t v8 = IMIsPlugInProxyAMessagesExtensionPoint();
    if (v8)
    {
      id v9 = __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_2(v8, v7);
      id v10 = 0;
    }
    else
    {
      id v10 = 0;
      id v9 = 0;
    }
LABEL_40:

    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = 0;
      goto LABEL_37;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = 0;
    goto LABEL_26;
  }
  id v11 = *(id *)(a1 + 32);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = [v11 plugInKitPlugins];
  id v9 = (void *)[v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v13 = *(void *)v33;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v12);
        }
        uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v16 = IMIsPlugInProxyAMessagesExtensionPoint();
        if (v16)
        {
          id v9 = __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_2(v16, v15);
          goto LABEL_25;
        }
      }
      id v9 = (void *)[v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  id v10 = [v11 itemID];

  if (!v9)
  {
LABEL_26:
    if ([v4 count])
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v7 = v4;
      id v9 = (void *)[v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v9)
      {
        uint64_t v17 = *(void *)v29;
        while (2)
        {
          for (j = 0; j != v9; j = (char *)j + 1)
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v7);
            }
            id v19 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:*(void *)(*((void *)&v28 + 1) + 8 * (void)j)];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v20 = IMIsPlugInProxyAMessagesExtensionPoint();
              if (v20)
              {
                id v9 = __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_2(v20, v19);

                goto LABEL_40;
              }
            }
          }
          id v9 = (void *)[v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
      goto LABEL_40;
    }
LABEL_37:
    id v9 = 0;
  }
LABEL_41:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v21 = objc_msgSend(v9, "__ck_statusJPEGImageDataForTransportWithCompressionFactor:", 0.2);
    id v22 = [v9 browserDisplayName];
    id v23 = v10;
    uint64_t v24 = objc_msgSend((id)objc_msgSend(v9, "dataSourceClass"), "pluginPayloadFromMessagePayload:appIconData:appName:adamID:allowDataPayloads:", *(void *)(a1 + 48), v21, v22, v23, objc_msgSend(v9, "canSendDataPayloads"));
    [v24 setIsFromMe:1];
    uint64_t v25 = [v9 identifier];
    [v24 setPluginBundleID:v25];

    if ([v24 shouldExpire]
      && (id v26 = +[CKComposition newExpirableCompositionWithText:0 subject:0 shelfPluginPayload:v24]) != 0)
    {
      [*(id *)(a1 + 56) setComposition:v26];
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_173;
      v27[3] = &unk_1E5621AF8;
      void v27[4] = *(void *)(a1 + 56);
      +[CKComposition compositionWithShelfPluginPayload:v24 completionHandler:v27];
    }
  }
}

id __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = (void *)*MEMORY[0x1E4F6CBE8];
  id v4 = [v2 teamID];
  id v5 = [v2 bundleIdentifier];
  uint64_t v6 = [v3 stringByAppendingFormat:@":%@:%@", v4, v5];

  id v7 = [MEMORY[0x1E4F6BC18] sharedInstance];
  uint64_t v8 = [v7 balloonPluginForBundleID:v6];

  id v9 = [v8 identifier];
  LODWORD(v3) = [v9 isEqualToString:v3];

  if (v3)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F6BBF8]);
    id v11 = [v8 pluginBundle];
    uint64_t v12 = [v10 initWithPluginBundle:v11 pluginKitProxy:v2 extension:0];

    uint64_t v8 = (void *)v12;
  }

  return v8;
}

uint64_t __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_173(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setComposition:a2];
}

void __83__CKModalTranscriptController_insertMessage_bundleProxy_extensionBundleIdentifier___block_invoke_179(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Notified of plugin manager plugin changes", buf, 2u);
    }
  }
  id v5 = +[CKBalloonPluginManager sharedInstance];
  id v6 = (id)[v5 allPlugins];

  id v7 = +[CKBalloonPluginManager sharedInstance];
  int v8 = [v7 hasLoadedExtensions];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Extensions finally loaded, inserted message", v11, 2u);
      }
    }
  }
}

- (void)insertFileURL:(id)a3 filename:(id)a4 fileIsResolved:(BOOL)a5 transcoderUserInfo:(id)a6 fullyRealizedPreview:(id)a7 rawPreview:(id)a8 appendedVideoURL:(id)a9 completion:(id)a10
{
  BOOL v45 = a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (v15)
  {
    int v21 = [(CKModalTranscriptController *)self assetExplorerManager];
    id v22 = [v21 generatePackageFromAssetURL:v15 appendedVideoURL:v20 previewImage:v18];

    id v23 = [(CKModalTranscriptController *)self assetExplorerManager];
    uint64_t v24 = v23;
    if (v22)
    {
      [v23 saveFileURL:v15 filename:v16 transcoderUserInfo:v17 fullyRealizedPreview:v18 rawPreview:v19 appendedVideoURL:v20];

      uint64_t v25 = [(CKModalTranscriptController *)self assetExplorerManager];
      [v25 stageAssetPackage:v22];
    }
    else
    {
      id v38 = v20;
      id v39 = v19;
      id v40 = v18;
      id v41 = v17;
      id v42 = v16;
      id v43 = v15;
      id v26 = [v23 clearAndDisableShelfAndReturnPreviouslyShelvedData];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = v26;
      uint64_t v27 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v47 != v29) {
              objc_enumerationMutation(obj);
            }
            long long v31 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            long long v32 = [v31 fileURL];
            long long v33 = [v31 filename];
            long long v34 = [v31 transcoderUserInfo];
            long long v35 = [v31 fullyRealizedPreview];
            id v36 = [v31 rawPreview];
            id v37 = [v31 appendedVideoURL];
            [(CKModalTranscriptController *)self insertFileURLAsMediaObject:v32 filename:v33 fileIsResolved:v45 transcoderUserInfo:v34 fullyRealizedPreview:v35 rawPreview:v36 appendedVideoURL:v37];
          }
          uint64_t v28 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
        }
        while (v28);
      }

      id v20 = v38;
      id v19 = v39;
      id v16 = v42;
      id v15 = v43;
      id v18 = v40;
      id v17 = v41;
      [(CKModalTranscriptController *)self insertFileURLAsMediaObject:v43 filename:v42 fileIsResolved:v45 transcoderUserInfo:v41 fullyRealizedPreview:v40 rawPreview:v39 appendedVideoURL:v38];

      id v22 = 0;
    }
  }
}

- (void)insertFileURLAsMediaObject:(id)a3 filename:(id)a4 fileIsResolved:(BOOL)a5 transcoderUserInfo:(id)a6 fullyRealizedPreview:(id)a7 rawPreview:(id)a8 appendedVideoURL:(id)a9
{
  BOOL v12 = a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  int v21 = +[CKMediaObjectManager sharedInstance];
  LOWORD(v44) = 0;
  id v22 = objc_msgSend(v21, "mediaObjectWithFileURL:filename:fileIsResolved:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:isScreenshot:", v15, v16, v12, v17, 0, 0, 0, v44);

  int v23 = [(id)objc_opt_class() canGeneratePreviewInMVSHostProcess];
  if ([MEMORY[0x1E4F6E7D8] isCroppingAvoidanceEnabled])
  {
    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = +[CKUIBehavior sharedBehaviors];
        [v24 previewMaxWidth];
        double v26 = v25;

        uint64_t v27 = [v22 previewForWidth:0 orientation:v26];

        id v18 = (id)v27;
      }
    }
  }
  if (v18) {
    int v28 = v23;
  }
  else {
    int v28 = 0;
  }
  if (v28 == 1) {
    [v22 cacheAndPersistPreview:v18 orientation:1];
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138413314;
      id v46 = v15;
      __int16 v47 = 2112;
      id v48 = v16;
      __int16 v49 = 2112;
      id v50 = v17;
      __int16 v51 = 2112;
      id v52 = v20;
      __int16 v53 = 2112;
      id v54 = v22;
      _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "fileURL %@, filename %@, transcoderUserInfo %@, appendedVideoURL %@, mediaObject %@", buf, 0x34u);
    }
  }
  long long v30 = [v20 path];
  BOOL v31 = [v30 length] == 0;

  if (!v31)
  {
    long long v32 = [v22 fileURL];
    long long v33 = CKGetTmpPathForAppendedVideoURL(v20, v32);

    long long v34 = [v22 transferGUID];
    CKLinkAndCreateAppendedVideoTransfer(v33, v20, v34);
  }
  [(CKModalTranscriptController *)self _insertMediaObjectAndReturnFrame:v22];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v22 duration],
        double v36 = v35,
        [(CKCoreChatController *)self conversation],
        id v37 = objc_claimAutoreleasedReturnValue(),
        [v37 maxTrimDurationForMedia:v22],
        BOOL v39 = v36 <= v38,
        v37,
        v39))
  {
    id v40 = [v22 transfer];
    BOOL v41 = CKFileSizeEligibleForEagerUpload([v40 totalBytes]);

    if (v41)
    {
      eagerUploadController = self->_eagerUploadController;
      id v43 = [(CKModalTranscriptController *)self proposedParticipantHandles];
      [(CKChatEagerUploadController *)eagerUploadController uploadFileURL:v15 filename:v16 transcoderUserInfo:v17 videoComplementURL:v20 attributionInfo:0 identifier:0 recipients:v43];
    }
  }
}

- (id)proposedParticipantHandles
{
  id v3 = [(CKComposeChatController *)self proposedRecipients];
  id v4 = objc_msgSend(v3, "__im_canonicalIDSAddressesFromEntities");

  id v5 = [(CKCoreChatController *)self conversation];
  id v6 = [v5 senderIdentifier];
  id v7 = IMChatCanonicalIDSIDsForAddress();

  if ([v7 length])
  {
    uint64_t v8 = [v4 arrayByAddingObject:v7];

    id v4 = (void *)v8;
  }

  return v4;
}

- (void)insertData:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5
{
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F22500];
  id v9 = a5;
  id v10 = a3;
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v8, (CFStringRef)a4, 0);
  id v11 = +[CKMediaObjectManager sharedInstance];
  BOOL v12 = [v11 mediaObjectWithData:v10 UTIType:PreferredIdentifierForTag filename:v9 transcoderUserInfo:0];

  [(CKModalTranscriptController *)self _insertMediaObject:v12];
}

- (BOOL)messageEntryViewWidth:(double *)a3 andOffset:(double *)a4
{
  uint64_t v20 = 0;
  double v21 = 0.0;
  v19.receiver = self;
  v19.super_class = (Class)CKModalTranscriptController;
  BOOL v7 = [(CKChatController *)&v19 messageEntryViewWidth:&v21 andOffset:&v20];
  if (v7 && !CKIsRunningInMessages())
  {
    uint64_t v20 = 0;
    CFStringRef v8 = [(CKChatController *)self entryView];
    id v9 = [v8 window];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 hostedWindowOffset];
      double v11 = v10;
      double v13 = v12;
    }
    else
    {
      double v11 = *MEMORY[0x1E4F1DAD8];
      double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    uint64_t v14 = [(CKModalTranscriptController *)self view];
    id v15 = [v14 window];
    [v15 bounds];
    -[CKModalTranscriptController _offsetForScreenWidth:containerWidth:windowOffset:](self, "_offsetForScreenWidth:containerWidth:windowOffset:", v16, v21, v11, v13);
    uint64_t v20 = v17;
  }
  if (a3) {
    *a3 = v21;
  }
  if (a4) {
    *(void *)a4 = v20;
  }
  return v7;
}

- (double)_offsetForScreenWidth:(double)a3 containerWidth:(double)a4 windowOffset:(CGPoint)a5
{
  double result = a3 * 0.5 - a4 * 0.5;
  if (a5.x != 0.0) {
    return a5.x;
  }
  return result;
}

- (CKComposeAssetExplorerManager)assetExplorerManager
{
  assetExplorerManager = self->_assetExplorerManager;
  if (!assetExplorerManager)
  {
    id v4 = [CKComposeAssetExplorerManager alloc];
    id v5 = [(CKCoreChatController *)self inputController];
    id v6 = [(CKComposeAssetExplorerManager *)v4 initWithInputController:v5];
    BOOL v7 = self->_assetExplorerManager;
    self->_assetExplorerManager = v6;

    assetExplorerManager = self->_assetExplorerManager;
  }

  return assetExplorerManager;
}

- (void)loadChatInputController
{
  v5.receiver = self;
  v5.super_class = (Class)CKModalTranscriptController;
  [(CKChatController *)&v5 loadChatInputController];
  id v3 = [(CKModalTranscriptController *)self assetExplorerManager];
  id v4 = [(CKCoreChatController *)self inputController];
  [v3 setInputController:v4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CKModalTranscriptController;
  id v7 = a4;
  -[CKChatController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__CKModalTranscriptController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5621550;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

void __82__CKModalTranscriptController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) entryView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  id v11 = [*(id *)(a1 + 32) entryView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKModalTranscriptController;
  [(CKComposeChatController *)&v11 viewWillAppear:a3];
  if (!self->_alreadySetUp)
  {
    [(CKModalTranscriptController *)self _setEntryViewVisible:self->_entryViewInvisible == 0];
    self->_alreadySetUp = 1;
    double v4 = [(CKModalTranscriptController *)self deferredInsertMediaObjectBlocks];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        double v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v10 = 0;
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Running deferred insert block", v10, 2u);
        }
      }
      double v7 = [(CKModalTranscriptController *)self deferredInsertMediaObjectBlocks];
      [v7 enumerateObjectsUsingBlock:&__block_literal_global_199_1];

      double v8 = [(CKModalTranscriptController *)self deferredInsertMediaObjectBlocks];
      [v8 removeAllObjects];
    }
  }
  double v9 = +[CKConversationList sharedConversationList];
  [v9 resort];
}

uint64_t __46__CKModalTranscriptController_viewWillAppear___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)sendComposition:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKModalTranscriptController;
  id v4 = a3;
  [(CKShareSheetChatController *)&v10 sendComposition:v4];
  uint64_t v5 = objc_msgSend(v4, "shelfPluginPayload", v10.receiver, v10.super_class);

  double v6 = [v5 pluginBundleID];

  if (v6)
  {
    double v7 = +[CKBalloonPluginManager sharedInstance];
    char v8 = [v7 isPluginEnabled:v6];

    if ((v8 & 1) == 0)
    {
      double v9 = +[CKBalloonPluginManager sharedInstance];
      [v9 setEnabled:1 forPlugin:v6];
    }
  }
  [(CKChatEagerUploadController *)self->_eagerUploadController didSendComposition];
}

- (void)_setConversationDeferredSetup
{
  v5.receiver = self;
  v5.super_class = (Class)CKModalTranscriptController;
  [(CKComposeChatController *)&v5 _setConversationDeferredSetup];
  BOOL v3 = [(CKModalTranscriptController *)self _deviceIsLocked];
  id v4 = [(CKChatController *)self collectionView];
  [v4 setHidden:v3];
}

- (BOOL)_deviceIsLocked
{
  int v2 = CKIsRunningInMessagesViewService();
  if (v2)
  {
    LOBYTE(v2) = CKIsScreenLocked();
  }
  return v2;
}

- (void)setPendingAddresses:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (CKIsValidAddress(v11))
        {
          double v12 = +[CKRecipientGenerator sharedRecipientGenerator];
          double v13 = [v12 recipientWithAddress:v11];

          if (v13) {
            [v5 addObject:v13];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(CKComposeChatController *)self setPrepopulatedRecipients:v5];
}

- (void)setCanEditRecipients:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKComposeChatController *)self composeRecipientSelectionController];
  [v4 setEditable:v3];
}

- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  self->_alreadySetUp = 0;
  LOBYTE(v8) = a7;
  [(CKModalTranscriptController *)self insertRichLinkWithURL:a3 sendAsCopyURL:a6 data:0 collaborationType:1 collaborationShareOptions:a4 metadata:a5 isCollaboration:v8 completionHandler:a8];
}

- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7
{
}

- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  id v21 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  self->_alreadySetUp = 0;
  uint64_t v17 = [a3 fileURL];
  id v18 = (void *)v17;
  if (v21)
  {
    LOBYTE(v20) = a7;
    [(CKModalTranscriptController *)self insertRichLinkWithURL:v17 sendAsCopyURL:v15 data:0 collaborationType:3 collaborationShareOptions:v21 metadata:v14 isCollaboration:v20 completionHandler:v16];
  }
  else
  {
    uint64_t v19 = [v14 defaultShareOptions];
    LOBYTE(v20) = a7;
    [(CKModalTranscriptController *)self insertRichLinkWithURL:v18 sendAsCopyURL:v15 data:0 collaborationType:3 collaborationShareOptions:v19 metadata:v14 isCollaboration:v20 completionHandler:v16];
  }
}

- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7
{
  self->_alreadySetUp = 0;
  [(CKModalTranscriptController *)self insertRichLinkWithCloudKitShare:a3 containerSetupInfo:a4 collaborationShareOptions:a5 isCollaboration:a6 completionHandler:a7];
}

- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6
{
}

- (void)insertGroupActivity:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "insertGroupActivity groupActivity is nil", buf, 2u);
    }
  }
  id v38 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  objc_super v5 = NSClassFromString(&cfstr_Lpshareplayinv.isa);
  if (v5) {
    id v6 = objc_alloc_init(v5);
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = [v3 concatenatedMetadataDescription];
  BOOL v8 = [v7 length] == 0;

  if (v8)
  {
    double v36 = 0;
  }
  else
  {
    double v36 = [v3 concatenatedMetadataDescription];
  }
  SEL v9 = NSSelectorFromString(&cfstr_Settitle.isa);
  if (objc_opt_respondsToSelector()) {
    [v6 performSelector:v9 withObject:v36];
  }
  SEL v10 = NSSelectorFromString(&cfstr_Setapplication.isa);
  if (objc_opt_respondsToSelector())
  {
    objc_super v11 = [v3 bundleIdentifier];
    [v6 performSelector:v10 withObject:v11];
  }
  SEL v12 = NSSelectorFromString(&cfstr_Setapplication_0.isa);
  if (objc_opt_respondsToSelector())
  {
    double v13 = [v3 localizedApplicationName];
    if (v13)
    {
      [v6 performSelector:v12 withObject:v13];
    }
    else
    {
      id v14 = [v3 fallbackApplicationName];
      [v6 performSelector:v12 withObject:v14];
    }
  }
  id v15 = [v3 metadata];
  id v16 = [v15 imageData];
  BOOL v17 = v16 == 0;

  if (v17) {
    goto LABEL_50;
  }
  id v18 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v19 = [v3 metadata];
  uint64_t v20 = [v19 imageData];
  id v21 = [v18 imageWithData:v20];

  if (!v21)
  {
LABEL_50:
    if (IMOSLoggingEnabled())
    {
      int v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v23, OS_LOG_TYPE_INFO, "insertGroupActivity image is nil", buf, 2u);
      }
    }
    id v21 = 0;
    id v22 = 0;
  }
  else
  {
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v21];
  }
  SEL v24 = NSSelectorFromString(&cfstr_Seticon.isa);
  if (objc_opt_respondsToSelector()) {
    [v6 performSelector:v24 withObject:v22];
  }
  [v38 setSpecialization:v6];
  id v25 = objc_alloc_init(MEMORY[0x1E4F30AA8]);
  [v25 setMetadata:v38];
  double v26 = [v25 dataRepresentationWithOutOfLineAttachments:0];
  if (!v26 && IMOSLoggingEnabled())
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "insertGroupActivity pluginPayloadData is nil", buf, 2u);
    }
  }
  int v28 = objc_alloc_init(CKBrowserItemPayload);
  uint64_t v29 = [NSString stringGUID];
  [(CKBrowserItemPayload *)v28 setMessageGUID:v29];

  [(CKBrowserItemPayload *)v28 setPluginBundleID:*MEMORY[0x1E4F6CC10]];
  [(CKBrowserItemPayload *)v28 setData:v26];
  long long v30 = [(CKChatController *)self composition];
  BOOL v31 = [[CKComposition alloc] initWithText:0 subject:0 shelfPluginPayload:v28];
  long long v32 = [(CKComposition *)v31 shelfPluginPayload];
  [v32 setGroupActivity:v3];

  if (v30)
  {
    long long v33 = [v30 compositionByAppendingComposition:v31];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "insertGroupActivity composition is nil, setting as appendComposition", buf, 2u);
      }
    }
    long long v33 = v31;
  }
  [(CKModalTranscriptController *)self setComposition:v33];
  if (IMOSLoggingEnabled())
  {
    double v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v40 = v3;
      _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "Did insert group activity %@", buf, 0xCu);
    }
  }
}

- (void)disableCameraAttachments
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      objc_super v5 = "-[CKModalTranscriptController disableCameraAttachments]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "reloadEntryViewIfNeeded called from %s", (uint8_t *)&v4, 0xCu);
    }
  }
  [(CKComposeChatController *)self reloadEntryViewIfNeeded];
  self->_cameraSelectionDisabled = 1;
}

- (BOOL)_shouldAllowCameraAttachments
{
  return !self->_cameraSelectionDisabled && !CKIsScreenLocked();
}

- (void)setTextEntryContentsVisible:(BOOL)a3
{
  if (self->_alreadySetUp) {
    [(CKModalTranscriptController *)self _setEntryViewVisible:a3];
  }
  else {
    self->_entryViewInvisible = !a3;
  }
}

- (BOOL)shouldDismissAfterSend
{
  return 1;
}

- (void)setForceMMS:(BOOL)a3
{
  self->_forceMMS = a3;
  id v4 = [(CKCoreChatController *)self conversation];
  [v4 setForceMMS:self->_forceMMS];
}

- (void)_setEntryViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(CKChatController *)self entryView];
  id v4 = [v7 contentView];
  objc_super v5 = v4;
  double v6 = 0.0;
  if (v3) {
    double v6 = 1.0;
  }
  [v4 setAlpha:v6];
}

- (void)hideEntryViewContent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKChatController *)self entryView];
  id v4 = [v5 contentView];
  [v4 setHidden:v3];
}

- (BOOL)messageEntryViewShouldBeginEditing:(id)a3
{
  return ![(CKChatController *)self shouldDisableEntryView];
}

- (void)registerForNotifications
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if (!CKIsRunningInMessagesOrSpringBoard())
  {
    [v4 addObserver:self selector:sel__applicationBecameActive_ name:*MEMORY[0x1E4F43648] object:0];
    [v4 addObserver:self selector:sel__screenLocked_ name:*MEMORY[0x1E4F436E0] object:0];
    [v4 addObserver:self selector:sel__screenUnlocked_ name:*MEMORY[0x1E4F436A8] object:0];
    [v4 addObserver:self selector:sel__conversationListDidFinishLoading_ name:@"CKConversationListFinishedLoadingNotification" object:0];
    BOOL v3 = [MEMORY[0x1E4F6C3E0] sharedInstance];
    [v3 addListener:self];
  }
}

- (void)_conversationListDidFinishLoading:(id)a3
{
  id v3 = +[CKConversationList sharedConversationList];
  [v3 resort];
}

- (BOOL)_shouldUseDefaultFirstResponder
{
  return 1;
}

- (BOOL)_shouldUseExistingConversations
{
  if (CKIsRunningInMessages()) {
    return 1;
  }

  return IMIsRunningInMessagesComposeViewService();
}

- (BOOL)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(BOOL)a3
{
  self->_mimeType = a3;
}

- (BOOL)forceMMS
{
  return self->_forceMMS;
}

- (void)setAssetExplorerManager:(id)a3
{
}

- (BOOL)alreadySetUp
{
  return self->_alreadySetUp;
}

- (void)setAlreadySetUp:(BOOL)a3
{
  self->_alreadySetUp = a3;
}

- (NSMutableArray)partsToInsert
{
  return self->_partsToInsert;
}

- (void)setPartsToInsert:(id)a3
{
}

- (NSMutableArray)typesToInsert
{
  return self->_typesToInsert;
}

- (void)setTypesToInsert:(id)a3
{
}

- (int)entryViewInvisible
{
  return self->_entryViewInvisible;
}

- (void)setEntryViewInvisible:(int)a3
{
  self->_entryViewInvisible = a3;
}

- (BOOL)cameraSelectionDisabled
{
  return self->_cameraSelectionDisabled;
}

- (void)setCameraSelectionDisabled:(BOOL)a3
{
  self->_cameraSelectionDisabled = a3;
}

- (CKChatEagerUploadController)eagerUploadController
{
  return self->_eagerUploadController;
}

- (void)setEagerUploadController:(id)a3
{
}

- (void)setDeferredInsertMediaObjectBlocks:(id)a3
{
}

- (BOOL)appearCompleted
{
  return self->_appearCompleted;
}

- (void)setAppearCompleted:(BOOL)a3
{
  self->_appearCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredInsertMediaObjectBlocks, 0);
  objc_storeStrong((id *)&self->_eagerUploadController, 0);
  objc_storeStrong((id *)&self->_typesToInsert, 0);
  objc_storeStrong((id *)&self->_partsToInsert, 0);

  objc_storeStrong((id *)&self->_assetExplorerManager, 0);
}

@end