@interface CKSMSComposeViewServiceController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (BOOL)_hostSandboxAllowsFileReadAtFileURL:(id)a3 isResolved:(BOOL)a4;
- (BOOL)canEditRecipients;
- (BOOL)composeChatControllerCanEditRecipients;
- (BOOL)composeChatControllerShouldShowBackButtonViewDuringSendAnimation:(id)a3;
- (BOOL)shouldDisableEntryField;
- (BOOL)shouldHideClearPluginButton;
- (BOOL)supportsAttachments;
- (BOOL)supportsMessageInspection;
- (CKModalTranscriptController)modalTranscriptController;
- (CKSMSComposeViewServiceController)init;
- (CKSMSComposeViewServiceControllerDelegate)composeDelegate;
- (NSArray)cloudPhotoIDs;
- (NSArray)contentText;
- (NSArray)contentURLs;
- (NSArray)photoIDs;
- (NSArray)utiTypes;
- (NSString)serviceId;
- (NSString)shareSheetSessionID;
- (NSString)suggestions;
- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3;
- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3;
- (id)_canonicalPathForFileURL:(id)a3;
- (id)entryViewCompletion;
- (id)gameCenterPickerBlock;
- (id)recipientsFromChatGUID:(id)a3 groupName:(id)a4 handles:(id)a5;
- (void)_forceMMSIfNecessary;
- (void)_insertAttachmentWithURL:(id)a3 andDescription:(id)a4 preview:(id)a5 isFullyRealized:(BOOL)a6 appendedVideoURL:(id)a7 appendedBundleURL:(id)a8 completion:(id)a9;
- (void)_insertFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 preview:(id)a6 isFullyRealized:(BOOL)a7 appendedVideoURL:(id)a8 completion:(id)a9;
- (void)_removeCloudKitShareIfNeeded:(id)a3;
- (void)_takeBackgroundTaskAssertionForMessageSend;
- (void)chatController:(id)a3 didFinishDismissAnimationForSendMenuViewController:(id)a4;
- (void)chatController:(id)a3 requestPresentSendMenu:(id)a4 withPresentationContext:(id)a5 completion:(id)a6;
- (void)chatController:(id)a3 willSendComposition:(id)a4 inConversation:(id)a5;
- (void)composeChatController:(id)a3 didLoadEntryViewContentWithCompletion:(id)a4;
- (void)composeChatController:(id)a3 didSelectNewConversation:(id)a4;
- (void)composeChatController:(id)a3 shouldSendComposition:(id)a4 inConversation:(id)a5 completion:(id)a6;
- (void)composeChatControllerDidCancelComposition:(id)a3;
- (void)configureForDeviceValidation;
- (void)dealloc;
- (void)disableCameraAttachments;
- (void)donateInteractionWithConversation:(id)a3;
- (void)forceCancelComposition;
- (void)forceMMS;
- (void)hideEntryViewContent:(BOOL)a3;
- (void)insertAttachmentWithURL:(id)a3 andDescription:(id)a4;
- (void)insertAttachmentWithURL:(id)a3 andDescription:(id)a4 appendedVideoURL:(id)a5;
- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6;
- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7;
- (void)insertData:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5;
- (void)insertFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5;
- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7;
- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8;
- (void)insertFilename:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5 options:(id)a6;
- (void)insertGroupActivity:(id)a3;
- (void)insertRemoteItemForSending:(id)a3;
- (void)insertRemoteItemForSending:(id)a3 extensionBundleIdentifier:(id)a4;
- (void)insertRemoteItemForSendingAndCalculateEntryViewFrame:(id)a3 completion:(id)a4;
- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5;
- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 completionHandler:(id)a6;
- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8;
- (void)setCanEditRecipients:(BOOL)a3;
- (void)setCloudPhotoIDs:(id)a3;
- (void)setComposeDelegate:(id)a3;
- (void)setContentText:(id)a3;
- (void)setContentURLs:(id)a3;
- (void)setEntryViewCompletion:(id)a3;
- (void)setGameCenterModeWithPickerBlock:(id)a3;
- (void)setGameCenterPickedHandles:(id)a3 playerNames:(id)a4;
- (void)setGameCenterPickerBlock:(id)a3;
- (void)setModalTranscriptController:(id)a3;
- (void)setNavBarTitle:(id)a3;
- (void)setPendingAddresses:(id)a3;
- (void)setPhotoIDs:(id)a3;
- (void)setServiceId:(id)a3;
- (void)setShareSheetSessionID:(id)a3;
- (void)setShouldDisableEntryField:(BOOL)a3;
- (void)setShouldHideClearPluginButton:(BOOL)a3;
- (void)setShouldIgnoreEmailsWhenSending:(BOOL)a3;
- (void)setSuggestions:(id)a3;
- (void)setSupportsMessageInspection:(BOOL)a3;
- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5;
- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 chatGUID:(id)a6 groupName:(id)a7;
- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6;
- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6 chatGUID:(id)a7;
- (void)setTextEntryContentsVisible:(BOOL)a3;
- (void)setUICustomizationData:(id)a3;
- (void)setUTIs:(id)a3;
- (void)setUtiTypes:(id)a3;
- (void)showInsertedItemInEntryView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKSMSComposeViewServiceController

- (CKSMSComposeViewServiceController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKSMSComposeViewServiceController;
  v2 = [(CKSMSComposeViewServiceController *)&v7 init];
  if (v2)
  {
    CKResetCachedUserSettings();
    IMResetCachedUserSettings();
    IMResetCachedCarrierSettings();
    [(CKSMSComposeViewServiceController *)v2 setCanEditRecipients:1];
    if (sDidFirstTimeBringup == 1)
    {
      if (!CKIsRunningUnitTests())
      {
        dispatch_time_t v3 = dispatch_time(0, 0);
        dispatch_after(v3, MEMORY[0x1E4F14428], &__block_literal_global_42);
      }
    }
    else
    {
      sDidFirstTimeBringup = 1;
    }
    v4 = +[CKUIBehavior sharedBehaviors];
    v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "modalTranscriptControllerClass")), "initWithNavigationController:", v2);

    [(CKSMSComposeViewServiceController *)v2 setModalTranscriptController:v5];
    [v5 setDelegate:v2];
  }
  return v2;
}

void __41__CKSMSComposeViewServiceController_init__block_invoke()
{
  v0 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v0 _forceSuspended];

  id v1 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v1 _forceResumed];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  dispatch_time_t v3 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v3 setDelegate:0];

  v4 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [(CKSMSComposeViewServiceController *)self removeChildViewController:v4];

  [(CKSMSComposeViewServiceController *)self setModalTranscriptController:0];
  v5.receiver = self;
  v5.super_class = (Class)CKSMSComposeViewServiceController;
  [(CKSMSComposeViewServiceController *)&v5 dealloc];
}

- (void)insertFilename:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5 options:(id)a6
{
  v9 = (void *)MEMORY[0x1E4F1CB10];
  id v10 = a6;
  id v11 = a5;
  id v13 = [v9 fileURLWithPath:a3 isDirectory:0];
  v12 = CKTranscoderUserInfoForComposeOptions(v10);

  [(CKSMSComposeViewServiceController *)self insertFileURL:v13 filename:v11 transcoderUserInfo:v12];
}

- (void)insertData:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v11 insertData:v10 MIMEType:v9 exportedFilename:v8];

  id v12 = [(CKSMSComposeViewServiceController *)self _remoteViewControllerProxy];
  [v12 smsComposeControllerDataInserted];
}

- (void)_insertFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 preview:(id)a6 isFullyRealized:(BOOL)a7 appendedVideoURL:(id)a8 completion:(id)a9
{
  BOOL v10 = a7;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  if (v15)
  {
    v21 = [(CKSMSComposeViewServiceController *)self _canonicalPathForFileURL:v15];
    if (v21)
    {
      if ([(CKSMSComposeViewServiceController *)self _hostSandboxAllowsFileReadAtFileURL:v21 isResolved:1])
      {
        v22 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
        v23 = v22;
        if (v10) {
          id v24 = v18;
        }
        else {
          id v24 = 0;
        }
        if (v10) {
          id v25 = 0;
        }
        else {
          id v25 = v18;
        }
        [v22 insertFileURL:v21 filename:v16 fileIsResolved:1 transcoderUserInfo:v17 fullyRealizedPreview:v24 rawPreview:v25 appendedVideoURL:v19 completion:v20];

        v26 = [(CKSMSComposeViewServiceController *)self _remoteViewControllerProxy];
        [v26 smsComposeControllerDataInserted];

        if (IMOSLoggingEnabled())
        {
          v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Insert file and ask for MMCS prewarm", buf, 2u);
          }
        }
        v28 = [MEMORY[0x1E4F6BCC8] sharedInstance];
        [v28 preWarmConnection];

        goto LABEL_23;
      }
      if (IMOSLoggingEnabled())
      {
        v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "CKSMSComposeViewServiceController - Not attaching file, host app does not have file-read-data permissions!", buf, 2u);
        }
LABEL_22:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v15;
        _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "CKSMSComposeViewServiceController - Failed to get canonical path for fileURL %@", buf, 0xCu);
      }
      goto LABEL_22;
    }
LABEL_23:
  }
}

- (void)showInsertedItemInEntryView
{
  dispatch_time_t v3 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v3 hideEntryViewContent:0];

  id v4 = [(CKSMSComposeViewServiceController *)self _remoteViewControllerProxy];
  [v4 smsComposeControllerEntryViewContentInserted];
}

- (id)_canonicalPathForFileURL:(id)a3
{
  uint64_t v6 = 0;
  int v3 = [a3 getResourceValue:&v6 forKey:*MEMORY[0x1E4F1C520] error:0];
  id v4 = 0;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  }

  return v4;
}

- (BOOL)_hostSandboxAllowsFileReadAtFileURL:(id)a3 isResolved:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFURLRef v6 = (const __CFURL *)a3;
  long long v12 = 0u;
  long long v13 = 0u;
  [(CKSMSComposeViewServiceController *)self _hostAuditToken];
  CFBooleanRef propertyValueTypeRefPtr = 0;
  if (!CFURLCopyResourcePropertyForKey(v6, (CFStringRef)*MEMORY[0x1E4F1D6B0], &propertyValueTypeRefPtr, 0))
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_14;
    }
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "CKSMSComposeViewServiceController - Error getting readable property for file url %@", buf, 0xCu);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!propertyValueTypeRefPtr)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_14;
    }
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "CKSMSComposeViewServiceController - Unable to read file at URL %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (!CFBooleanGetValue(propertyValueTypeRefPtr))
  {
LABEL_14:
    LOBYTE(v7) = 0;
    goto LABEL_15;
  }
  if (v4)
  {
    [(__CFURL *)v6 fileSystemRepresentation];
    *(_OWORD *)buf = v12;
    long long v15 = v13;
    LOBYTE(v7) = sandbox_check_by_audit_token() == 0;
  }
  else
  {
    BOOL v10 = realpath_DARWIN_EXTSN((const char *)[(__CFURL *)v6 fileSystemRepresentation], 0);
    *(_OWORD *)buf = v12;
    long long v15 = v13;
    BOOL v7 = sandbox_check_by_audit_token() == 0;
    free(v10);
  }
LABEL_15:

  return v7;
}

- (void)insertFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5
{
}

- (void)_insertAttachmentWithURL:(id)a3 andDescription:(id)a4 preview:(id)a5 isFullyRealized:(BOOL)a6 appendedVideoURL:(id)a7 appendedBundleURL:(id)a8 completion:(id)a9
{
  BOOL v10 = a6;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  if (v14)
  {
    BOOL v26 = v10;
    id v19 = v14;
    id v20 = [v19 scheme];
    int v21 = [v20 isEqualToString:@"assets-library"];

    if (v21)
    {
      uint64_t v27 = *MEMORY[0x1E4F6D370];
      v22 = [v19 absoluteString];
      v28[0] = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];

      if (_insertAttachmentWithURL_andDescription_preview_isFullyRealized_appendedVideoURL_appendedBundleURL_completion___pred_PUTCreatePathForPersistentURLPhotoLibraryServicesCore != -1) {
        dispatch_once(&_insertAttachmentWithURL_andDescription_preview_isFullyRealized_appendedVideoURL_appendedBundleURL_completion___pred_PUTCreatePathForPersistentURLPhotoLibraryServicesCore, &__block_literal_global_304_0);
      }
      isFullyRealized_appendedVideoURL_appendedBundleURL_completion___PUTCreatePathForPersistentURL = (void *)_insertAttachmentWithURL_andDescription_preview_isFullyRealized_appendedVideoURL_appendedBundleURL_completion___PUTCreatePathForPersistentURL(v19, 0);
      uint64_t v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:isFullyRealized_appendedVideoURL_appendedBundleURL_completion___PUTCreatePathForPersistentURL isDirectory:0];

      id v19 = (id)v25;
    }
    else
    {
      v23 = 0;
    }
    [(CKSMSComposeViewServiceController *)self _insertFileURL:v19 filename:v15 transcoderUserInfo:v23 preview:v16 isFullyRealized:v26 appendedVideoURL:v17 completion:v18];
  }
}

void *__147__CKSMSComposeViewServiceController__insertAttachmentWithURL_andDescription_preview_isFullyRealized_appendedVideoURL_appendedBundleURL_completion___block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("PUTCreatePathForPersistentURL", @"PhotoLibraryServicesCore");
  _insertAttachmentWithURL_andDescription_preview_isFullyRealized_appendedVideoURL_appendedBundleURL_completion___PUTCreatePathForPersistentURL = result;
  return result;
}

- (void)insertAttachmentWithURL:(id)a3 andDescription:(id)a4
{
}

- (void)insertAttachmentWithURL:(id)a3 andDescription:(id)a4 appendedVideoURL:(id)a5
{
}

- (void)insertRemoteItemForSendingAndCalculateEntryViewFrame:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CKSMSComposeViewServiceController *)self setEntryViewCompletion:v6];
  id v13 = [v7 attachmentURL];
  id v8 = [v7 attachmentDescription];
  id v9 = [v7 previewUIImage];
  uint64_t v10 = [v7 previewIsFullyRealizedByChatKit];
  id v11 = [v7 appendedVideoURL];
  long long v12 = [v7 appendedBundleURL];

  [(CKSMSComposeViewServiceController *)self _insertAttachmentWithURL:v13 andDescription:v8 preview:v9 isFullyRealized:v10 appendedVideoURL:v11 appendedBundleURL:v12 completion:v6];
}

- (void)composeChatController:(id)a3 didLoadEntryViewContentWithCompletion:(id)a4
{
  objc_super v5 = [(CKSMSComposeViewServiceController *)self entryViewCompletion];

  if (v5)
  {
    [(CKSMSComposeViewServiceController *)self hideEntryViewContent:1];
    id v6 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
    id v7 = [v6 entryView];
    id v8 = [v7 contentView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    id v17 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
    id v18 = [v17 entryView];
    id v19 = [v18 contentView];
    id v20 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
    int v21 = [v20 view];
    objc_msgSend(v19, "convertRect:toView:", v21, v10, v12, v14, v16);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    id v31 = [(CKSMSComposeViewServiceController *)self entryViewCompletion];
    v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v23, v25, v27, v29);
    v31[2](v31, v30);
  }
}

- (void)hideEntryViewContent:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v4 hideEntryViewContent:v3];
}

- (void)insertRemoteItemForSending:(id)a3
{
}

- (void)insertRemoteItemForSending:(id)a3 extensionBundleIdentifier:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 previewImage])
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v6;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "itemForSending %@", buf, 0xCu);
      }
    }
    double v9 = [v6 attachmentURL];
    if (v9)
    {
      double v10 = [v6 attachmentURL];
      double v11 = [v6 attachmentDescription];
      double v12 = [v6 previewUIImage];
      uint64_t v13 = [v6 previewIsFullyRealizedByChatKit];
      double v14 = [v6 appendedVideoURL];
      double v15 = [v6 appendedBundleURL];
      [(CKSMSComposeViewServiceController *)self _insertAttachmentWithURL:v10 andDescription:v11 preview:v12 isFullyRealized:v13 appendedVideoURL:v14 appendedBundleURL:v15 completion:0];
    }
  }
  else
  {
    double v16 = [v6 appendedRichLinkURL];

    if (v16)
    {
      id v17 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
      id v18 = [v6 appendedRichLinkURL];
      id v19 = [v6 appendedRichLinkData];
      [v17 insertRichLinkWithURL:v18 data:v19];

      id v20 = [(CKSMSComposeViewServiceController *)self _remoteViewControllerProxy];
      [v20 smsComposeControllerDataInserted];
    }
    else
    {
      int v21 = [v6 appendedMessage];

      if (v21)
      {
        double v22 = (void *)MEMORY[0x1E4F223F0];
        double v23 = [(CKSMSComposeViewServiceController *)self _hostApplicationBundleIdentifier];
        double v24 = [v22 bundleProxyForIdentifier:v23];

        double v25 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
        double v26 = [v6 appendedMessage];
        [v25 insertMessage:v26 bundleProxy:v24 extensionBundleIdentifier:v7];

        double v27 = [(CKSMSComposeViewServiceController *)self _remoteViewControllerProxy];
        [v27 smsComposeControllerDataInserted];
      }
      else
      {
        double v24 = [v6 attachmentURL];
        double v28 = [v6 attachmentDescription];
        double v29 = [v6 appendedVideoURL];
        [(CKSMSComposeViewServiceController *)self insertAttachmentWithURL:v24 andDescription:v28 appendedVideoURL:v29];
      }
    }
  }
}

- (void)forceCancelComposition
{
  id v3 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [(CKSMSComposeViewServiceController *)self composeChatControllerDidCancelComposition:v3];
}

- (void)setUICustomizationData:(id)a3
{
  id v4 = a3;
  id v6 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  objc_super v5 = [v6 navigationController];
  objc_msgSend(v5, "mf_setDataForUICustomization:", v4);
}

- (void)setUTIs:(id)a3
{
}

- (void)setContentURLs:(id)a3
{
}

- (void)setPhotoIDs:(id)a3
{
}

- (void)setCloudPhotoIDs:(id)a3
{
}

- (void)setContentText:(id)a3
{
}

- (void)setServiceId:(id)a3
{
  objc_storeStrong((id *)&self->_serviceId, a3);
  id v5 = a3;
  id v6 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v6 setServiceId:v5];
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
  id v5 = a3;
  id v6 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v6 setSuggestedRepliesData:v5];
}

- (void)_forceMMSIfNecessary
{
  if (self->_forceMMS)
  {
    id v2 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
    [v2 setForceMMS:1];
  }
}

- (void)forceMMS
{
  self->_forceMMS = 1;
  [(CKSMSComposeViewServiceController *)self _forceMMSIfNecessary];
}

- (void)setGameCenterModeWithPickerBlock:(id)a3
{
  id v4 = a3;
  [(CKSMSComposeViewServiceController *)self setGameCenterPickerBlock:v4];
  id v6 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  id v5 = [v6 composeRecipientSelectionController];
  [v5 setGameCenterPickerBlock:v4];
}

- (void)setGameCenterPickedHandles:(id)a3 playerNames:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  double v9 = [v8 composeRecipientSelectionController];
  [v9 setGameCenterPickedHandles:v7 playerNames:v6];

  [(CKSMSComposeViewServiceController *)self becomeFirstResponder];
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6 chatGUID:(id)a7
{
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6
{
  self->_shouldHideClearPluginButton = a6;
  [(CKSMSComposeViewServiceController *)self setText:a3 subject:a4 addresses:a5];
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5
{
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 chatGUID:(id)a6 groupName:(id)a7
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v57 = a4;
  id v60 = a5;
  id v59 = a6;
  id v55 = a7;
  v61 = self;
  double v12 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  uint64_t v13 = [v12 composition];

  if (IMOSLoggingEnabled())
  {
    double v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      double v15 = [v60 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v59;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "setText and subject with addresses: %@ for chatGUID: %@", buf, 0x16u);
    }
  }
  double v16 = [(CKSMSComposeViewServiceController *)self serviceId];
  if (v16)
  {
    BOOL v17 = [v60 count] == 1;

    if (v17)
    {
      id v18 = [(CKSMSComposeViewServiceController *)self serviceId];
      v75[0] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];

      id v60 = (id)v19;
    }
  }
  uint64_t v20 = [v58 length];
  int v21 = (void *)v20;
  if (v13)
  {
    if (v20) {
      double v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v58];
    }
    else {
      double v22 = 0;
    }
    double v26 = [v13 compositionByAppendingText:v22];

    if (v21) {
    double v27 = [CKComposition alloc];
    }
    double v28 = [v26 text];
    uint64_t v29 = [v57 length];
    if (v29) {
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v57];
    }
    else {
      v30 = 0;
    }
    BOOL v62 = v29 == 0;
    id v31 = [v26 shelfPluginPayload];
    uint64_t v32 = [v26 bizIntent];
    v33 = [v26 shelfMediaObject];
    v34 = [v26 collaborationShareOptions];
    v35 = [v26 proofreadingInfo];
    v56 = [(CKComposition *)v27 initWithText:v28 subject:v30 shelfPluginPayload:v31 bizIntent:v32 shelfMediaObject:v33 collaborationShareOptions:v34 proofreadingInfo:v35];

    if (!v62) {
    [(CKComposition *)v56 setShouldHideClearPluginButton:v61->_shouldHideClearPluginButton];
    }
    int v21 = [(CKSMSComposeViewServiceController *)v61 modalTranscriptController];
    [v21 setInitialComposition:0];
  }
  else
  {
    if (v20) {
      int v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v58];
    }
    double v23 = objc_msgSend(v21, "ck_attributedStringByPostProcessingURLTextForRichLinks");
    double v24 = [CKComposition alloc];
    if ([v57 length])
    {
      double v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v57];
      v56 = [(CKComposition *)v24 initWithText:v23 subject:v25];
    }
    else
    {
      v56 = [(CKComposition *)v24 initWithText:v23 subject:0];
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v72 = __Block_byref_object_copy__16;
  v73 = __Block_byref_object_dispose__16;
  id v74 = 0;
  id v74 = [(CKSMSComposeViewServiceController *)v61 recipientsFromChatGUID:v59 groupName:v55 handles:v60];
  if (![*(id *)(*(void *)&buf[8] + 40) count] && IMOSLoggingEnabled())
  {
    v36 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v69 = 0;
      _os_log_impl(&dword_18EF18000, v36, OS_LOG_TYPE_INFO, "recipientsFromChatGUID returned zero recipients", v69, 2u);
    }
  }
  uint64_t v37 = [v60 count];
  if (v59 || v37)
  {
    if (v59)
    {
      if (IMOSLoggingEnabled())
      {
        v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v69 = 138412290;
          uint64_t v70 = (uint64_t)v59;
          _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "Getting recipients for chatGUID: %@", v69, 0xCu);
        }
      }
      uint64_t v40 = [(CKSMSComposeViewServiceController *)v61 recipientsFromChatGUID:v59 groupName:v55 handles:0];
      v41 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v40;
    }
  }
  else
  {
    shareSheetSessionID = v61->_shareSheetSessionID;
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __82__CKSMSComposeViewServiceController_setText_subject_addresses_chatGUID_groupName___block_invoke;
    v67[3] = &unk_1E5623E58;
    v67[4] = v61;
    v67[5] = buf;
    [MEMORY[0x1E4F9F338] requestMessagesRecipientInfoForSessionID:shareSheetSessionID completionHandler:v67];
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v42 = *(id *)(*(void *)&buf[8] + 40);
  uint64_t v43 = [v42 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v64 != v44) {
          objc_enumerationMutation(v42);
        }
        v46 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        v47 = [v46 address];
        BOOL v48 = v47 == 0;

        if (v48 && IMOSLoggingEnabled())
        {
          v49 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v69 = 138412290;
            uint64_t v70 = (uint64_t)v46;
            _os_log_impl(&dword_18EF18000, v49, OS_LOG_TYPE_INFO, "found nil address in new recipient %@, this will set atom state to pending...", v69, 0xCu);
          }
        }
      }
      uint64_t v43 = [v42 countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v43);
  }

  if (IMOSLoggingEnabled())
  {
    v50 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      uint64_t v51 = [*(id *)(*(void *)&buf[8] + 40) count];
      *(_DWORD *)v69 = 134217984;
      uint64_t v70 = v51;
      _os_log_impl(&dword_18EF18000, v50, OS_LOG_TYPE_INFO, "prepopulating %ld new recipients and new composition", v69, 0xCu);
    }
  }
  v52 = [(CKSMSComposeViewServiceController *)v61 modalTranscriptController];
  [v52 setPrepopulatedRecipients:*(void *)(*(void *)&buf[8] + 40)];

  v53 = [(CKSMSComposeViewServiceController *)v61 modalTranscriptController];
  [v53 setPrepopulatedComposition:v56];

  v54 = [(CKSMSComposeViewServiceController *)v61 _remoteViewControllerProxy];
  [v54 smsComposeControllerDataInserted];

  _Block_object_dispose(buf, 8);
}

void __82__CKSMSComposeViewServiceController_setText_subject_addresses_chatGUID_groupName___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) recipientsFromChatGUID:v7 groupName:v8 handles:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  double v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
      double v15 = [v9 componentsJoinedByString:@", "];
      int v16 = 134218498;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      int v21 = v15;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "callback from -[_UIActivityRecipientManager requestMessagesRecipientInfoForSessionID] created %ld newRecipients from chatGUID: %@, handles: %@", (uint8_t *)&v16, 0x20u);
    }
  }
}

- (id)recipientsFromChatGUID:(id)a3 groupName:(id)a4 handles:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v46 = a4;
  id v47 = a5;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v47 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412546;
      uint64_t v60 = (uint64_t)v48;
      __int16 v61 = 2112;
      uint64_t v62 = (uint64_t)v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Getting CNComposeRecipient recipients from chatGUID: %@ handles: %@", buf, 0x16u);
    }
  }
  if (v48)
  {
    id v9 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    uint64_t v10 = [v9 existingChatWithGUID:v48];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v46 && !v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    uint64_t v10 = [v11 existingChatWithDisplayName:v46];
  }
  if (!v10) {
    goto LABEL_36;
  }
  double v12 = v10;
  if ([v10 joinState] != 3 && objc_msgSend(v10, "joinState") != 2)
  {
    if (IMOSLoggingEnabled())
    {
      double v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v60 = (uint64_t)v10;
        _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Tried to send to a chat we're no longer a part of %@", buf, 0xCu);
      }
    }
    goto LABEL_36;
  }
  uint64_t v13 = +[CKConversationList sharedConversationList];
  uint64_t v44 = [v13 conversationForExistingChat:v10];

  uint64_t v14 = (void *)MEMORY[0x1E4F1CA48];
  double v15 = +[CKIMGroupComposeRecipient composeRecipientWithConversation:v44 searchTerm:0 matchingRecipient:0];
  int v16 = [v14 arrayWithObject:v15];

  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = [v16 count];
      uint64_t v19 = [v47 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v60 = v18;
      __int16 v61 = 2048;
      uint64_t v62 = v19;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "%ld Recipients of %ld handles populated via -[CKIMGroupComposeRecipient composeRecipientWithConversation]", buf, 0x16u);
    }
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v20 = v16;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v54 != v22) {
          objc_enumerationMutation(v20);
        }
        double v24 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        double v25 = [v24 address];
        BOOL v26 = v25 == 0;

        if (v26 && IMOSLoggingEnabled())
        {
          double v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v60 = (uint64_t)v24;
            _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Recipient (from -[CKIMGroupComposeRecipient composeRecipientWithConversation]) %@ has nil address, this will set atom state to pending...", buf, 0xCu);
          }
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v21);
  }

  uint64_t v10 = v12;
  if (!v20)
  {
LABEL_36:
    v45 = v10;
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "Attempting to populate via recipients via -[sRecipientGenerator recipientWithAddress]", buf, 2u);
      }
    }
    id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v47, "count"));
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v30 = v47;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v50 != v32) {
            objc_enumerationMutation(v30);
          }
          v34 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          if (CKIsValidAddress(v34))
          {
            v35 = +[CKRecipientGenerator sharedRecipientGenerator];
            v36 = [v35 recipientWithAddress:v34];

            if (v36)
            {
              uint64_t v37 = [v36 address];
              BOOL v38 = v37 == 0;

              if (v38 && IMOSLoggingEnabled())
              {
                v39 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v60 = (uint64_t)v36;
                  _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "Recipient (from -[sRecipientGenerator recipientWithAddress]) %@ has nil address, this will set atom state to pending...", buf, 0xCu);
                }
              }
              [v20 addObject:v36];
            }
          }
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v31);
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = [v20 count];
        uint64_t v42 = [v30 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v60 = v41;
        __int16 v61 = 2048;
        uint64_t v62 = v42;
        _os_log_impl(&dword_18EF18000, v40, OS_LOG_TYPE_INFO, "%ld Recipients of %ld handles populated via -[sRecipientGenerator recipientWithAddress]", buf, 0x16u);
      }
    }
    uint64_t v10 = v45;
  }

  return v20;
}

- (void)setShareSheetSessionID:(id)a3
{
}

- (void)setPendingAddresses:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v5 setPendingAddresses:v4];
}

- (void)configureForDeviceValidation
{
  if (UIAuditTokenTaskHasEntitlement())
  {
    self->_isDoingUPIDeviceValidation = 1;
    [(CKSMSComposeViewServiceController *)self setCanEditRecipients:0];
    [(CKSMSComposeViewServiceController *)self setShouldDisableEntryField:1];
  }
  else
  {
    NSLog(&cfstr_ProtectedApiIn.isa, [(CKSMSComposeViewServiceController *)self _hostProcessIdentifier]);
  }
}

- (void)setCanEditRecipients:(BOOL)a3
{
  BOOL v3 = a3;
  if (CKIsScreenLocked())
  {
    self->_canEditRecipients = 0;
  }
  else if (self->_canEditRecipients != v3)
  {
    self->_canEditRecipients = v3;
    id v5 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
    [v5 setCanEditRecipients:v3];
  }
}

- (void)setShouldIgnoreEmailsWhenSending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v4 setIgnoreEmailsWhenSending:v3];
}

- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7
{
}

- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6
{
}

- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5
{
}

- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v19 insertFileURLForCollaboration:v18 collaborationShareOptions:v17 metadata:v16 sendAsCopyURL:v15 isCollaboration:v8 completionHandler:v14];
}

- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 completionHandler:(id)a6
{
}

- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v19 insertSWYPendingCollaboration:v18 collaborationShareOptions:v17 collaborationMetadata:v16 sendAsCopyURL:v15 isCollaboration:v8 completionHandler:v14];
}

- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = @"NO";
      *(_DWORD *)id v19 = 138413058;
      *(void *)&v19[4] = v12;
      if (v8) {
        id v17 = @"YES";
      }
      *(_WORD *)&v19[12] = 2112;
      *(void *)&v19[14] = v13;
      __int16 v20 = 2112;
      id v21 = v14;
      __int16 v22 = 2112;
      double v23 = v17;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Invoking insertCKShareForCollaboration with ckShare:%@, containerSetupInfo:%@, shareOptions:%@, isCollaboration: %@", v19, 0x2Au);
    }
  }
  id v18 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v18 insertCKShareForCollaboration:v12 containerSetupInfo:v13 collaborationShareOptions:v14 isCollaboration:v8 completionHandler:v15];
}

- (void)insertGroupActivity:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "insertGroupActivity called %@", (uint8_t *)&v7, 0xCu);
    }
  }
  id v6 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v6 insertGroupActivity:v4];
}

- (void)setShouldDisableEntryField:(BOOL)a3
{
  if (self->_shouldDisableEntryField != a3)
  {
    BOOL v3 = a3;
    self->_shouldDisableEntryField = a3;
    id v4 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
    [v4 setShouldDisableEntryField:v3];
  }
}

- (void)setNavBarTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v5 setOverrideTitle:v4];
}

- (void)disableCameraAttachments
{
  id v2 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v2 disableCameraAttachments];
}

- (void)setTextEntryContentsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v4 setTextEntryContentsVisible:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKSMSComposeViewServiceController;
  [(CKSMSComposeViewServiceController *)&v10 viewWillAppear:a3];
  +[CKApplicationState setMainWindowForegroundActive:1];
  id v4 = [(CKSMSComposeViewServiceController *)self viewControllers];
  id v5 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  char v6 = [v4 containsObject:v5];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "CKSMSComposeViewServiceController - viewWillAppear called after modalTranscriptController is pushed!", v9, 2u);
      }
    }
  }
  else
  {
    id v8 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
    [(CKSMSComposeViewServiceController *)self pushViewController:v8 animated:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_forceMMS)
  {
    id v5 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
    char v6 = [v5 composeRecipientSelectionController];
    [v6 setForceMMS:1];
  }
  id gameCenterPickerBlock = self->_gameCenterPickerBlock;
  if (gameCenterPickerBlock)
  {
    id v8 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
    uint64_t v9 = [v8 composeRecipientSelectionController];
    [v9 setGameCenterPickerBlock:gameCenterPickerBlock];
  }
  objc_super v10 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v10 _forceResumed];

  uint64_t v11 = [(CKSMSComposeViewServiceController *)self _remoteViewControllerProxy];
  [v11 smsComposeControllerAppeared];

  v13.receiver = self;
  v13.super_class = (Class)CKSMSComposeViewServiceController;
  [(CKSMSComposeViewServiceController *)&v13 viewDidAppear:v3];
  id v12 = +[CKImageAnimationTimer sharedTimer];
  [v12 setShouldStopWhenBackgrounded:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKSMSComposeViewServiceController;
  [(CKSMSComposeViewServiceController *)&v4 viewDidDisappear:a3];
  +[CKApplicationState setMainWindowForegroundActive:0];
  BOOL v3 = +[CKImageAnimationTimer sharedTimer];
  [v3 setShouldStopWhenBackgrounded:1];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)composeChatController:(id)a3 shouldSendComposition:(id)a4 inConversation:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  objc_super v10 = (void (**)(id, uint64_t))a6;
  uint64_t v11 = [a5 recipientStrings];
  id v12 = (void *)v11;
  if (self->_gameCenterPickerBlock)
  {
    id v28 = v9;
    objc_super v13 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
    id v14 = [v13 composeRecipientSelectionController];

    id v15 = [v14 recipients];
    id v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          __int16 v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v14 isGameCenterRecipient:v22])
          {
            double v23 = [v22 normalizedAddress];
            [v16 addObject:v23];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }

    if (![v16 count] || (unint64_t v24 = objc_msgSend(v17, "count"), v24 > objc_msgSend(v12, "count"))) {
      [v16 addObjectsFromArray:v12];
    }

    id v9 = v28;
  }
  else
  {
    id v16 = (void *)v11;
  }
  double v25 = [v9 text];
  BOOL v26 = [v25 string];

  if (CKIsRunningUnitTests()
    || ([(CKSMSComposeViewServiceController *)self _hostAuditToken],
        !UIAuditTokenTaskHasEntitlement()))
  {
    v10[2](v10, 1);
  }
  else
  {
    double v27 = [(CKSMSComposeViewServiceController *)self _remoteViewControllerProxy];
    [v27 smsComposeControllerShouldSendMessageWithText:v26 toRecipients:v16 completion:v10];
  }
}

- (void)chatController:(id)a3 willSendComposition:(id)a4 inConversation:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  if ([(CKSMSComposeViewServiceController *)self supportsMessageInspection])
  {
    id v8 = [v14 text];
    id v9 = [v8 string];
  }
  else
  {
    id v9 = 0;
  }
  objc_super v10 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  uint64_t v11 = [(CKSMSComposeViewServiceController *)self _hostApplicationBundleIdentifier];
  [v10 setShareSheetHostBundleIdentifier:v11];

  [(CKSMSComposeViewServiceController *)self donateInteractionWithConversation:v7];
  if (self->_isDoingUPIDeviceValidation)
  {
    id v12 = [NSString stringGUID];
    [v14 setFirstMessageGUIDOverride:v12];
  }
  else
  {
    id v12 = 0;
  }
  [(CKSMSComposeViewServiceController *)self _takeBackgroundTaskAssertionForMessageSend];
  objc_super v13 = [(CKSMSComposeViewServiceController *)self _remoteViewControllerProxy];
  [v13 smsComposeControllerSendStartedWithText:v9 messageGUID:v12];
}

- (void)_takeBackgroundTaskAssertionForMessageSend
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Failed to begin messages-view-service-message-send background task", v1, 2u);
}

void __79__CKSMSComposeViewServiceController__takeBackgroundTaskAssertionForMessageSend__block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4F43740];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4F43740])
  {
    BOOL v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __79__CKSMSComposeViewServiceController__takeBackgroundTaskAssertionForMessageSend__block_invoke_cold_1(v3);
    }

    objc_super v4 = [MEMORY[0x1E4F42738] sharedApplication];
    [v4 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __79__CKSMSComposeViewServiceController__takeBackgroundTaskAssertionForMessageSend__block_invoke_354(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4F43740];
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E4F43740])
  {
    BOOL v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_DEFAULT, "Ending messages-view-service-message-send background task due to timer completion.", v5, 2u);
    }

    objc_super v4 = [MEMORY[0x1E4F42738] sharedApplication];
    [v4 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v1;
  }
}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
{
  double v3 = *MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
{
  double v3 = *MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)chatController:(id)a3 requestPresentSendMenu:(id)a4 withPresentationContext:(id)a5 completion:(id)a6
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 handleFailureInMethod:a2 object:self file:@"CKSMSComposeViewServiceController.m" lineNumber:801 description:@"not implemented"];
}

- (void)chatController:(id)a3 didFinishDismissAnimationForSendMenuViewController:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"CKSMSComposeViewServiceController.m" lineNumber:806 description:@"not implemented"];
}

- (BOOL)composeChatControllerCanEditRecipients
{
  return self->_canEditRecipients;
}

- (void)composeChatControllerDidCancelComposition:(id)a3
{
  double v4 = [a3 composition];
  double v5 = [v4 shelfPluginPayload];
  [(CKSMSComposeViewServiceController *)self _removeCloudKitShareIfNeeded:v5];

  id v6 = [(CKSMSComposeViewServiceController *)self modalTranscriptController];
  [v6 setComposition:0];

  id v7 = [(CKSMSComposeViewServiceController *)self _remoteViewControllerProxy];
  [v7 smsComposeControllerCancelled];
}

- (void)_removeCloudKitShareIfNeeded:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    if ([v3 payloadCollaborationType] == 2)
    {
      double v5 = [v4 cloudKitShare];
      int v6 = [v5 isCloudKitShareRemovable];

      if (v6)
      {
        id v7 = (void *)MEMORY[0x192FBA860](@"CSCloudSharing", @"CloudSharing");
        id v8 = [v4 cloudKitShare];
        id v9 = [v4 containerSetupInfo];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __66__CKSMSComposeViewServiceController__removeCloudKitShareIfNeeded___block_invoke;
        v10[3] = &unk_1E56211F0;
        id v11 = v4;
        [v7 removeFromShare:v8 containerSetupInfo:v9 completionHandler:v10];
      }
    }
  }
}

void __66__CKSMSComposeViewServiceController__removeCloudKitShareIfNeeded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [*(id *)(a1 + 32) cloudKitShare];
        int v10 = 138412546;
        id v11 = v7;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Error while removing the CloudKt share: %@, Error: %@", (uint8_t *)&v10, 0x16u);
      }
LABEL_9:
    }
  }
  else if (v5)
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 32) url];
      id v9 = [*(id *)(a1 + 32) containerSetupInfo];
      int v10 = 138412546;
      id v11 = v8;
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Successfully removed CloudKit share with URL: %@, containerSetupInfo: %@ ", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_9;
  }
}

- (void)composeChatController:(id)a3 didSelectNewConversation:(id)a4
{
  id v15 = a4;
  id v4 = +[CKConversationList sharedConversationList];
  [v4 setPendingConversation:v15];

  if (!CKIsRunningInMessagesViewService() || !CKIsScreenLocked())
  {
    int v5 = [v15 chat];

    if (v5)
    {
      if (CKIsRunningInMessagesViewService()
        && ([MEMORY[0x1E4F1CB18] standardUserDefaults],
            int v6 = objc_claimAutoreleasedReturnValue(),
            char v7 = [v6 BOOLForKey:@"ShouldDisableShareSheetHistoryLoad"],
            v6,
            (v7 & 1) != 0))
      {
        unint64_t v8 = 0;
        id v9 = v15;
      }
      else
      {
        unsigned int v10 = [v15 limitToLoad];
        id v11 = +[CKUIBehavior sharedBehaviors];
        unint64_t v12 = [v11 defaultConversationViewingMessageCount];

        if (v12 >= v10) {
          unint64_t v12 = v10;
        }
        id v13 = +[CKUIBehavior sharedBehaviors];
        unint64_t v14 = [v13 initialConversationViewingMessageCount];

        id v9 = v15;
        if (v12 <= v14) {
          unint64_t v8 = v14;
        }
        else {
          unint64_t v8 = v12;
        }
      }
      [v9 setLoadedMessageCount:v8];
    }
  }
}

- (BOOL)composeChatControllerShouldShowBackButtonViewDuringSendAnimation:(id)a3
{
  return 0;
}

- (BOOL)supportsAttachments
{
  return 1;
}

- (BOOL)supportsMessageInspection
{
  return self->_supportsMessageInspection;
}

+ (id)_exportedInterface
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFAA818];
  uint64_t v3 = MEMORY[0x192FBA860](@"MSMessage", @"Messages");
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = v3;
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:13];
  int v6 = objc_msgSend(v4, "setWithArray:", v5, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);

  [v2 setClasses:v6 forSelector:sel_insertRemoteItemForSending_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertRemoteItemForSendingAndCalculateEntryViewFrame_completion_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertFileURLForCollaboration_collaborationShareOptions_metadata_sendAsCopyURL_isCollaboration_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertFileURLForCollaboration_collaborationShareOptions_metadata_sendAsCopyURL_isCollaboration_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertCKShareForCollaboration_containerSetupInfo_collaborationShareOptions_isCollaboration_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertCKShareForCollaboration_containerSetupInfo_collaborationShareOptions_isCollaboration_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertFileURLForCollaboration_collaborationShareOptions_metadata_sendAsCopyURL_isCollaboration_completionHandler_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertFileURLForCollaboration_collaborationShareOptions_metadata_sendAsCopyURL_isCollaboration_completionHandler_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertCKShareForCollaboration_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertCKShareForCollaboration_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_completionHandler_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_completionHandler_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_completionHandler_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_completionHandler_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_completionHandler_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_completionHandler_ argumentIndex:2 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_completionHandler_ argumentIndex:3 ofReply:0];
  [v2 setClasses:v6 forSelector:sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_completionHandler_ argumentIndex:4 ofReply:0];

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[CKSMSComposeRemoteViewController exportedInterface];
}

- (void)donateInteractionWithConversation:(id)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  if (self->_utiTypes || self->_photoIDs || self->_cloudPhotoIDs || self->_contentURLs || self->_contentText)
  {
    uint64_t v65 = 1440;
    uint64_t v101 = 0;
    v102 = &v101;
    uint64_t v103 = 0x2050000000;
    id v4 = (void *)get_CDInteractionClass_softClass;
    uint64_t v104 = get_CDInteractionClass_softClass;
    if (!get_CDInteractionClass_softClass)
    {
      uint64_t v96 = MEMORY[0x1E4F143A8];
      uint64_t v97 = 3221225472;
      v98 = __get_CDInteractionClass_block_invoke;
      v99 = &unk_1E5620B90;
      v100 = &v101;
      __get_CDInteractionClass_block_invoke((uint64_t)&v96);
      id v4 = (void *)v102[3];
    }
    v67 = self;
    int v5 = v4;
    _Block_object_dispose(&v101, 8);
    id v68 = objc_alloc_init(v5);
    int v6 = [(CKSMSComposeViewServiceController *)v67 _hostApplicationBundleIdentifier];
    [v68 setBundleId:v6];

    [v68 setTargetBundleId:*MEMORY[0x1E4F9F380]];
    [v68 setDirection:1];
    [v68 setMechanism:13];
    char v7 = [MEMORY[0x1E4F1C9C8] date];
    [v68 setEndDate:v7];

    uint64_t v8 = [v66 chat];
    uint64_t v9 = [v8 guid];
    [v68 setDomainIdentifier:v9];

    uint64_t v70 = objc_opt_new();
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    obuint64_t j = [v66 recipients];
    uint64_t v10 = [obj countByEnumeratingWithState:&v92 objects:v111 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v93;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v93 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v92 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "cnContactWithKeys:", MEMORY[0x1E4F1CBF0], v65);
          uint64_t v101 = 0;
          v102 = &v101;
          uint64_t v103 = 0x2050000000;
          uint64_t v15 = (void *)get_CDContactClass_softClass;
          uint64_t v104 = get_CDContactClass_softClass;
          if (!get_CDContactClass_softClass)
          {
            uint64_t v96 = MEMORY[0x1E4F143A8];
            uint64_t v97 = 3221225472;
            v98 = __get_CDContactClass_block_invoke;
            v99 = &unk_1E5620B90;
            v100 = &v101;
            __get_CDContactClass_block_invoke((uint64_t)&v96);
            uint64_t v15 = (void *)v102[3];
          }
          uint64_t v16 = v15;
          _Block_object_dispose(&v101, 8);
          id v17 = [v16 alloc];
          uint64_t v18 = [v13 rawAddress];
          uint64_t v19 = [v13 rawAddress];
          if ([v19 _appearsToBeEmail]) {
            uint64_t v20 = 2;
          }
          else {
            uint64_t v20 = 1;
          }
          uint64_t v21 = [v13 name];
          __int16 v22 = [v14 identifier];
          if (v14) {
            uint64_t v23 = 3;
          }
          else {
            uint64_t v23 = 0;
          }
          unint64_t v24 = (void *)[v17 initWithIdentifier:v18 type:v20 displayName:v21 personId:v22 personIdType:v23];

          [v70 addObject:v24];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v92 objects:v111 count:16];
      }
      while (v10);
    }

    [v68 setRecipients:v70];
    double v25 = objc_opt_new();
    photoIDs = v67->_photoIDs;
    if (photoIDs || v67->_cloudPhotoIDs)
    {
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      double v27 = photoIDs;
      uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v88 objects:v110 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v89;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v89 != v29) {
              objc_enumerationMutation(v27);
            }
            uint64_t v31 = *(void *)(*((void *)&v88 + 1) + 8 * j);
            id v32 = objc_alloc_init((Class)get_CDAttachmentClass());
            v33 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v31];
            [v32 setIdentifier:v33];

            [v25 addObject:v32];
          }
          uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v88 objects:v110 count:16];
        }
        while (v28);
      }

      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      uint64_t v34 = v67->_cloudPhotoIDs;
      uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v84 objects:v109 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v85;
        do
        {
          for (uint64_t k = 0; k != v35; ++k)
          {
            if (*(void *)v85 != v36) {
              objc_enumerationMutation(v34);
            }
            uint64_t v38 = *(void *)(*((void *)&v84 + 1) + 8 * k);
            id v39 = objc_alloc_init((Class)get_CDAttachmentClass());
            uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v38];
            [v39 setCloudIdentifier:v40];

            [v25 addObject:v39];
          }
          uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v84 objects:v109 count:16];
        }
        while (v35);
      }
    }
    else
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v45 = *(id *)((char *)&v67->super.super.super.super.isa + v65);
      uint64_t v46 = [v45 countByEnumeratingWithState:&v80 objects:v108 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v81;
        do
        {
          for (uint64_t m = 0; m != v46; ++m)
          {
            if (*(void *)v81 != v47) {
              objc_enumerationMutation(v45);
            }
            uint64_t v49 = *(void *)(*((void *)&v80 + 1) + 8 * m);
            id v50 = objc_alloc_init((Class)get_CDAttachmentClass());
            [v50 setUti:v49];
            [v25 addObject:v50];
          }
          uint64_t v46 = [v45 countByEnumeratingWithState:&v80 objects:v108 count:16];
        }
        while (v46);
      }

      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v51 = v67->_contentURLs;
      uint64_t v52 = [(NSArray *)v51 countByEnumeratingWithState:&v76 objects:v107 count:16];
      if (v52)
      {
        uint64_t v53 = *(void *)v77;
        uint64_t v54 = *MEMORY[0x1E4F226F8];
        do
        {
          for (uint64_t n = 0; n != v52; ++n)
          {
            if (*(void *)v77 != v53) {
              objc_enumerationMutation(v51);
            }
            uint64_t v56 = *(void *)(*((void *)&v76 + 1) + 8 * n);
            id v57 = objc_alloc_init((Class)get_CDAttachmentClass());
            [v57 setUti:v54];
            id v58 = [MEMORY[0x1E4F1CB10] URLWithString:v56];
            [v57 setContentURL:v58];

            [v25 addObject:v57];
          }
          uint64_t v52 = [(NSArray *)v51 countByEnumeratingWithState:&v76 objects:v107 count:16];
        }
        while (v52);
      }

      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      uint64_t v34 = v67->_contentText;
      uint64_t v59 = [(NSArray *)v34 countByEnumeratingWithState:&v72 objects:v106 count:16];
      if (v59)
      {
        uint64_t v60 = *(void *)v73;
        uint64_t v61 = *MEMORY[0x1E4F22688];
        do
        {
          for (iuint64_t i = 0; ii != v59; ++ii)
          {
            if (*(void *)v73 != v60) {
              objc_enumerationMutation(v34);
            }
            uint64_t v63 = *(void *)(*((void *)&v72 + 1) + 8 * ii);
            id v64 = objc_alloc_init((Class)get_CDAttachmentClass());
            [v64 setUti:v61];
            [v64 setContentText:v63];
            [v25 addObject:v64];
          }
          uint64_t v59 = [(NSArray *)v34 countByEnumeratingWithState:&v72 objects:v106 count:16];
        }
        while (v59);
      }
    }

    [v68 setAttachments:v25];
    uint64_t v101 = 0;
    v102 = &v101;
    uint64_t v103 = 0x2050000000;
    uint64_t v41 = (void *)get_CDInteractionRecorderClass_softClass;
    uint64_t v104 = get_CDInteractionRecorderClass_softClass;
    if (!get_CDInteractionRecorderClass_softClass)
    {
      uint64_t v96 = MEMORY[0x1E4F143A8];
      uint64_t v97 = 3221225472;
      v98 = __get_CDInteractionRecorderClass_block_invoke;
      v99 = &unk_1E5620B90;
      v100 = &v101;
      __get_CDInteractionRecorderClass_block_invoke((uint64_t)&v96);
      uint64_t v41 = (void *)v102[3];
    }
    id v42 = v41;
    _Block_object_dispose(&v101, 8);
    uint64_t v43 = [v42 interactionRecorder];
    id v105 = v68;
    uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __71__CKSMSComposeViewServiceController_donateInteractionWithConversation___block_invoke;
    v71[3] = &unk_1E56211F0;
    v71[4] = v67;
    [v43 recordInteractions:v44 completionHandler:v71];
  }
}

void __71__CKSMSComposeViewServiceController_donateInteractionWithConversation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (CKIsRunningUnitTests())
  {
    int v5 = [*(id *)(a1 + 32) composeDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      char v7 = [*(id *)(a1 + 32) composeDelegate];
      [v7 composeViewServiceController:*(void *)(a1 + 32) willDonateToDuetWithUTIs:*(void *)(*(void *)(a1 + 32) + 1440)];
    }
  }
  if (v4 && IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "recordInteraction failed with error %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (CKModalTranscriptController)modalTranscriptController
{
  return self->_modalTranscriptController;
}

- (void)setModalTranscriptController:(id)a3
{
}

- (BOOL)canEditRecipients
{
  return self->_canEditRecipients;
}

- (BOOL)shouldDisableEntryField
{
  return self->_shouldDisableEntryField;
}

- (BOOL)shouldHideClearPluginButton
{
  return self->_shouldHideClearPluginButton;
}

- (void)setShouldHideClearPluginButton:(BOOL)a3
{
  self->_shouldHideClearPluginButtouint64_t n = a3;
}

- (CKSMSComposeViewServiceControllerDelegate)composeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeDelegate);

  return (CKSMSComposeViewServiceControllerDelegate *)WeakRetained;
}

- (void)setComposeDelegate:(id)a3
{
}

- (void)setSupportsMessageInspection:(BOOL)a3
{
  self->_supportsMessageInspectiouint64_t n = a3;
}

- (NSArray)utiTypes
{
  return self->_utiTypes;
}

- (void)setUtiTypes:(id)a3
{
}

- (NSArray)contentURLs
{
  return self->_contentURLs;
}

- (NSArray)photoIDs
{
  return self->_photoIDs;
}

- (NSArray)cloudPhotoIDs
{
  return self->_cloudPhotoIDs;
}

- (NSArray)contentText
{
  return self->_contentText;
}

- (NSString)shareSheetSessionID
{
  return self->_shareSheetSessionID;
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (NSString)suggestions
{
  return self->_suggestions;
}

- (id)gameCenterPickerBlock
{
  return self->_gameCenterPickerBlock;
}

- (void)setGameCenterPickerBlock:(id)a3
{
}

- (id)entryViewCompletion
{
  return self->_entryViewCompletion;
}

- (void)setEntryViewCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_entryViewCompletion, 0);
  objc_storeStrong(&self->_gameCenterPickerBlock, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_shareSheetSessionID, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
  objc_storeStrong((id *)&self->_cloudPhotoIDs, 0);
  objc_storeStrong((id *)&self->_photoIDs, 0);
  objc_storeStrong((id *)&self->_contentURLs, 0);
  objc_storeStrong((id *)&self->_utiTypes, 0);
  objc_destroyWeak((id *)&self->_composeDelegate);

  objc_storeStrong((id *)&self->_modalTranscriptController, 0);
}

void __79__CKSMSComposeViewServiceController__takeBackgroundTaskAssertionForMessageSend__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Background runtime expired prior to messages-view-service-message-send timer completion", v1, 2u);
}

@end