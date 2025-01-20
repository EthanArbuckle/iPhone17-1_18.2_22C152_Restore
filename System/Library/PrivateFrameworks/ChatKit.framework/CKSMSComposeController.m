@interface CKSMSComposeController
+ (BOOL)acceptsMIMEType:(id)a3;
+ (BOOL)canSendPhotos:(int)a3 videos:(int)a4 audioClips:(int)a5;
- (BOOL)_canShowWhileLocked;
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers;
- (BOOL)canInsertMessageWithExtensionBundleIdentifier:(id)a3;
- (BOOL)didChangeStatusBarStyle;
- (BOOL)firstItemWasInserted;
- (BOOL)insertAttachmentWithURL:(id)a3 andDescription:(id)a4;
- (BOOL)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6;
- (BOOL)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7;
- (BOOL)insertData:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5;
- (BOOL)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 isCollaboration:(BOOL)a6;
- (BOOL)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7;
- (BOOL)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8;
- (BOOL)insertFilename:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5 options:(id)a6;
- (BOOL)insertGroupActivity:(id)a3;
- (BOOL)insertMessage:(id)a3;
- (BOOL)insertMessage:(id)a3 extensionBundleIdentifier:(id)a4;
- (BOOL)insertRichLinkWithURL:(id)a3 andData:(id)a4;
- (BOOL)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5;
- (BOOL)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 completionHandler:(id)a6;
- (BOOL)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8;
- (BOOL)safeToAdd;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (CKSMSComposeController)init;
- (CKSMSComposeController)initWithNavigationController:(id)a3;
- (CKSMSComposeQueuingRemoteViewControllerProxy)remoteViewControllerProxy;
- (CKSMSComposeRemoteViewController)remoteViewController;
- (UINavigationController)clientNavigationController;
- (_UIAsyncInvocation)cancellationInvocation;
- (id)delegate;
- (int64_t)savedStatusBarStyle;
- (void)_addRemoteVCIfNeeded;
- (void)configureForDeviceValidation;
- (void)dealloc;
- (void)disableCameraAttachments;
- (void)forceCancelComposition;
- (void)forceMMS;
- (void)insertItemForSendingAndCalculateEntryViewFrame:(id)a3 withAlternateFilename:(id)a4 completion:(id)a5;
- (void)setCanEditRecipients:(BOOL)a3;
- (void)setCancellationInvocation:(id)a3;
- (void)setClientNavigationController:(id)a3;
- (void)setCloudPhotoIDs:(id)a3;
- (void)setContentText:(id)a3;
- (void)setContentURLs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidChangeStatusBarStyle:(BOOL)a3;
- (void)setFirstItemWasInserted:(BOOL)a3;
- (void)setGameCenterModeWithPickerBlock:(id)a3;
- (void)setGameCenterPickedHandles:(id)a3 playerNames:(id)a4;
- (void)setNavBarTitle:(id)a3;
- (void)setPendingAddresses:(id)a3;
- (void)setPhotoIDs:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setRemoteViewControllerProxy:(id)a3;
- (void)setSafeToAdd:(BOOL)a3;
- (void)setSavedStatusBarStyle:(int64_t)a3;
- (void)setServiceId:(id)a3;
- (void)setShareSheetSessionID:(id)a3;
- (void)setShouldDisableEntryField:(BOOL)a3;
- (void)setShouldIgnoreEmailsWhenSending:(BOOL)a3;
- (void)setSuggestions:(id)a3;
- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5;
- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 chatGUID:(id)a6 groupName:(id)a7;
- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6;
- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6 chatGUID:(id)a7;
- (void)setTextEntryContentsVisible:(BOOL)a3;
- (void)setUICustomizationData:(id)a3;
- (void)setUTIs:(id)a3;
- (void)showInsertedItemInEntryView;
- (void)smsComposeControllerAppeared;
- (void)smsComposeControllerCancelled;
- (void)smsComposeControllerDataInserted;
- (void)smsComposeControllerEntryViewContentInserted;
- (void)smsComposeControllerSendStartedWithText:(id)a3 messageGUID:(id)a4;
- (void)smsComposeControllerShouldSendMessageWithText:(id)a3 toRecipients:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKSMSComposeController

- (CKSMSComposeController)init
{
  v16.receiver = self;
  v16.super_class = (Class)CKSMSComposeController;
  v3 = [(CKSMSComposeController *)&v16 init];
  if (v3)
  {
    kdebug_trace();
    v3->_firstItemWasInserted = 0;
    v4 = objc_alloc_init(CKSMSComposeQueuingRemoteViewControllerProxy);
    [(CKSMSComposeController *)v3 setRemoteViewControllerProxy:v4];
    v3->_safeToAdd = 1;
    clientNavigationController = v3->_clientNavigationController;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __30__CKSMSComposeController_init__block_invoke;
    v14[3] = &unk_1E562A488;
    v6 = v3;
    v15 = v6;
    [(UINavigationController *)clientNavigationController _beginDelayingPresentation:v14 cancellationHandler:15.0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __30__CKSMSComposeController_init__block_invoke_2;
    v11[3] = &unk_1E562A4B0;
    SEL v13 = a2;
    v7 = v6;
    v12 = v7;
    uint64_t v8 = +[CKSMSComposeRemoteViewController requestViewControllerWithConnectionHandler:v11];
    cancellationInvocation = v7->_cancellationInvocation;
    v7->_cancellationInvocation = (_UIAsyncInvocation *)v8;
  }
  return v3;
}

uint64_t __30__CKSMSComposeController_init__block_invoke(uint64_t a1, int a2)
{
  v4 = @"NO";
  if (a2) {
    v4 = @"YES";
  }
  NSLog(&cfstr_RemoteComposeC.isa, v4);
  if (a2) {
    [*(id *)(a1 + 32) smsComposeControllerCancelled];
  }
  return 0;
}

void __30__CKSMSComposeController_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  kdebug_trace();
  if (v5)
  {
    v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    NSLog(&stru_1EDE50C18.isa, v6, v5);

    [*(id *)(*(void *)(a1 + 32) + 1016) dismissViewControllerAnimated:0 completion:0];
    [*(id *)(a1 + 32) smsComposeControllerCancelled];
  }
  else if (v15)
  {
    [*(id *)(a1 + 32) setRemoteViewController:v15];
    v7 = [*(id *)(a1 + 32) remoteViewController];
    [v7 setDelegate:*(void *)(a1 + 32)];

    uint64_t v8 = [*(id *)(a1 + 32) remoteViewControllerProxy];
    v9 = [*(id *)(a1 + 32) remoteViewController];
    v10 = [v9 serviceViewControllerProxy];
    [v8 setServiceViewControllerProxy:v10];

    [*(id *)(a1 + 32) _addRemoteVCIfNeeded];
  }
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 1008);
  *(void *)(v11 + 1008) = 0;

  [*(id *)(*(void *)(a1 + 32) + 1016) _endDelayingPresentation];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 1016);
  *(void *)(v13 + 1016) = 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CKSMSComposeController)initWithNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_clientNavigationController, a3);

  return [(CKSMSComposeController *)self init];
}

- (void)dealloc
{
  [(CKSMSComposeController *)self setRemoteViewControllerProxy:0];
  v3 = [(CKSMSComposeController *)self remoteViewController];
  v4 = [v3 view];
  [v4 removeFromSuperview];

  id v5 = [(CKSMSComposeController *)self remoteViewController];
  [v5 removeFromParentViewController];

  v6 = [(CKSMSComposeController *)self remoteViewController];
  [v6 setDelegate:0];

  [(CKSMSComposeController *)self setRemoteViewController:0];
  v7.receiver = self;
  v7.super_class = (Class)CKSMSComposeController;
  [(CKSMSComposeController *)&v7 dealloc];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  cancellationInvocation = self->_cancellationInvocation;
  if (cancellationInvocation)
  {
    id v5 = (id)[(_UIAsyncInvocation *)cancellationInvocation invoke];
    v6 = self->_cancellationInvocation;
    self->_cancellationInvocation = 0;
  }

  [(CKSMSComposeController *)self smsComposeControllerCancelled];
}

+ (BOOL)acceptsMIMEType:(id)a3
{
  return 1;
}

+ (BOOL)canSendPhotos:(int)a3 videos:(int)a4 audioClips:(int)a5
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  memset(&v6[4], 0, 28);
  v6[2] = a4;
  v6[3] = a3;
  v6[1] = a5;
  return CKClientComposeCanSendMediaObjectTypes((uint64_t)v6);
}

- (BOOL)insertFilename:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5 options:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v14 insertFilename:v13 MIMEType:v12 exportedFilename:v11 options:v10];

  return 1;
}

- (BOOL)insertData:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v11 insertData:v10 MIMEType:v9 exportedFilename:v8];

  return 1;
}

- (BOOL)insertAttachmentWithURL:(id)a3 andDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[CKRemoteItemForSending alloc] initWithAttachmentURL:v6 description:v7 blockOnPreviewCreation:!self->_firstItemWasInserted];
  if (v8)
  {
    id v9 = [(CKSMSComposeController *)self remoteViewControllerProxy];
    [v9 insertRemoteItemForSending:v8];

    if (!self->_firstItemWasInserted) {
      self->_firstItemWasInserted = 1;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "CKSMSComposeController. Could not initialize CKRemoteItemForSending object.", v12, 2u);
    }
  }
  return 1;
}

- (BOOL)insertRichLinkWithURL:(id)a3 andData:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v7 length];
      id v10 = @"YES";
      if (!v6) {
        id v10 = @"NO";
      }
      int v15 = 138412546;
      objc_super v16 = v10;
      __int16 v17 = 2048;
      uint64_t v18 = v9;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "insertRichLinkWithURL: %@, data: %lu", (uint8_t *)&v15, 0x16u);
    }
  }
  id v11 = [[CKRemoteItemForSending alloc] initWithRichLinkWithURL:v6 data:v7];
  if (v11)
  {
    id v12 = [(CKSMSComposeController *)self remoteViewControllerProxy];
    [v12 insertRemoteItemForSending:v11];
  }
  else if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "CKSMSComposeController. Could not initialize CKRemoteItemForSending object.", (uint8_t *)&v15, 2u);
    }
  }
  return 1;
}

- (void)insertItemForSendingAndCalculateEntryViewFrame:(id)a3 withAlternateFilename:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[CKRemoteItemForSending alloc] initWithAttachmentURL:v8 description:v9 blockOnPreviewCreation:0];
  if (v11)
  {
    id v12 = [(CKSMSComposeController *)self remoteViewControllerProxy];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __106__CKSMSComposeController_insertItemForSendingAndCalculateEntryViewFrame_withAlternateFilename_completion___block_invoke;
    v15[3] = &unk_1E562A4D8;
    id v16 = v10;
    [v12 insertRemoteItemForSendingAndCalculateEntryViewFrame:v11 completion:v15];
  }
  else if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "CKSMSComposeController. Could not initialize CKRemoteItemForSending object.", v14, 2u);
    }
  }
}

void __106__CKSMSComposeController_insertItemForSendingAndCalculateEntryViewFrame_withAlternateFilename_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      [v3 CGRectValue];
      id v5 = NSStringFromRect(v9);
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Expanded entry view frame: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)showInsertedItemInEntryView
{
  id v2 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v2 showInsertedItemInEntryView];
}

- (BOOL)canInsertMessageWithExtensionBundleIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
  uint64_t v5 = objc_opt_class();
  int v6 = [v4 entitlementValueForKey:@"com.apple.private.messages.associated-message-extension-bundle-identifiers" ofClass:v5 valuesOfClass:objc_opt_class()];
  if ([v3 length]
    && [v3 hasPrefix:@"com.apple."]
    && [v6 containsObject:v3])
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v3;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Overriding pluginKitProxy identifier with %@", buf, 0xCu);
      }
    }
    id v8 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:v3];
    LOBYTE(v9) = IMIsPlugInProxyAMessagesExtensionPoint() != 0;
LABEL_35:

    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = [v4 plugInKitPlugins];
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            if (IMIsPlugInProxyAMessagesExtensionPoint())
            {
LABEL_34:
              LOBYTE(v9) = 1;
              goto LABEL_35;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
    if ([v6 count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v9)
      {
        uint64_t v13 = *(void *)v18;
        while (2)
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v8);
            }
            int v15 = objc_msgSend(MEMORY[0x1E4F22458], "pluginKitProxyForIdentifier:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && IMIsPlugInProxyAMessagesExtensionPoint())
            {

              goto LABEL_34;
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
      goto LABEL_35;
    }
  }
  LOBYTE(v9) = 0;
LABEL_36:

  return v9;
}

- (BOOL)insertMessage:(id)a3
{
  return [(CKSMSComposeController *)self insertMessage:a3 extensionBundleIdentifier:0];
}

- (BOOL)insertMessage:(id)a3 extensionBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CKSMSComposeController *)self canInsertMessageWithExtensionBundleIdentifier:v7])
  {
    id v8 = [[CKRemoteItemForSending alloc] initWithMSMessage:v6];
    BOOL v9 = v8 != 0;
    if (v8)
    {
      uint64_t v10 = [(CKSMSComposeController *)self remoteViewControllerProxy];
      uint64_t v11 = v10;
      if (v7) {
        [v10 insertRemoteItemForSending:v8 extensionBundleIdentifier:v7];
      }
      else {
        [v10 insertRemoteItemForSending:v8];
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKSMSComposeController. Could not initialize CKRemoteItemForSending object.", v13, 2u);
      }
    }

    goto LABEL_11;
  }
  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v11 setText:v10 subject:v9 addresses:v8];
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 chatGUID:(id)a6 groupName:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v17 setText:v16 subject:v15 addresses:v14 chatGUID:v13 groupName:v12];
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v13 setText:v12 subject:v11 addresses:v10 shouldHideClearPluginButton:v6];
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6 chatGUID:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v16 setText:v15 subject:v14 addresses:v13 shouldHideClearPluginButton:v7 chatGUID:v12];
}

- (void)setPendingAddresses:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v5 setPendingAddresses:v4];
}

- (void)configureForDeviceValidation
{
  id v2 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v2 configureForDeviceValidation];
}

- (void)setCanEditRecipients:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v4 setCanEditRecipients:v3];
}

- (void)setShouldDisableEntryField:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v4 setShouldDisableEntryField:v3];
}

- (void)setShouldIgnoreEmailsWhenSending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v4 setShouldIgnoreEmailsWhenSending:v3];
}

- (BOOL)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 isCollaboration:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v13 insertFileURLForCollaboration:v12 collaborationShareOptions:v11 metadata:v10 sendAsCopyURL:0 isCollaboration:v6];

  return 1;
}

- (BOOL)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v16 insertFileURLForCollaboration:v15 collaborationShareOptions:v14 metadata:v13 sendAsCopyURL:v12 isCollaboration:v7];

  return 1;
}

- (BOOL)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  long long v19 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v19 insertFileURLForCollaboration:v18 collaborationShareOptions:v17 metadata:v16 sendAsCopyURL:v15 isCollaboration:v8 completionHandler:v14];

  return 1;
}

- (BOOL)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v11 insertSWYPendingCollaboration:v10 collaborationShareOptions:v9 collaborationMetadata:v8];

  return 1;
}

- (BOOL)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v14 insertSWYPendingCollaboration:v13 collaborationShareOptions:v12 collaborationMetadata:v11 completionHandler:v10];

  return 1;
}

- (BOOL)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  long long v19 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v19 insertSWYPendingCollaboration:v18 collaborationShareOptions:v17 collaborationMetadata:v16 sendAsCopyURL:v15 isCollaboration:v8 completionHandler:v14];

  return 1;
}

- (BOOL)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
      *(_DWORD *)long long v20 = 138413058;
      *(void *)&v20[4] = v12;
      if (v8) {
        id v17 = @"YES";
      }
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v13;
      __int16 v21 = 2112;
      id v22 = v14;
      __int16 v23 = 2112;
      long long v24 = v17;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "insertCKShareForCollaboration called with share: %@, containerSetupInfo = %@, collaborationShareOptions = %@, isCollaboration = %@", v20, 0x2Au);
    }
  }
  id v18 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v18 insertCKShareForCollaboration:v12 containerSetupInfo:v13 collaborationShareOptions:v14 isCollaboration:v8 completionHandler:v15];

  return 1;
}

- (BOOL)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v13 insertCKShareForCollaboration:v12 containerSetupInfo:v11 collaborationShareOptions:v10 isCollaboration:v6];

  return 1;
}

- (BOOL)insertGroupActivity:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "insertGroupActivity called", v8, 2u);
    }
  }
  BOOL v6 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v6 insertGroupActivity:v4];

  return 1;
}

- (void)setNavBarTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v5 setNavBarTitle:v4];
}

- (void)disableCameraAttachments
{
  id v2 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v2 disableCameraAttachments];
}

- (void)forceCancelComposition
{
  id v2 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v2 forceCancelComposition];
}

- (void)forceMMS
{
  id v2 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v2 forceMMS];
}

- (void)setGameCenterModeWithPickerBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v5 setGameCenterModeWithPickerBlock:v4];
}

- (void)setGameCenterPickedHandles:(id)a3 playerNames:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v8 setGameCenterPickedHandles:v7 playerNames:v6];
}

- (void)setUICustomizationData:(id)a3
{
  id v5 = a3;
  if ((_UIApplicationUsesLegacyUI() & 1) == 0)
  {
    id v4 = [(CKSMSComposeController *)self remoteViewControllerProxy];
    [v4 setUICustomizationData:v5];
  }
}

- (void)setUTIs:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v5 setUTIs:v4];
}

- (void)setContentURLs:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v5 setContentURLs:v4];
}

- (void)setPhotoIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v5 setPhotoIDs:v4];
}

- (void)setCloudPhotoIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v5 setCloudPhotoIDs:v4];
}

- (void)setContentText:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v5 setContentText:v4];
}

- (void)setShareSheetSessionID:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v5 setShareSheetSessionID:v4];
}

- (void)setServiceId:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v5 setServiceId:v4];
}

- (void)setSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v5 setSuggestions:v4];
}

- (void)smsComposeControllerDataInserted
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained smsComposeControllerDataInserted:self];
}

- (void)smsComposeControllerAppeared
{
  BOOL v3 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v3 _forceResumed];

  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained smsComposeControllerAppeared:self];
}

- (void)smsComposeControllerCancelled
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained smsComposeControllerCancelled:self];
}

- (void)smsComposeControllerEntryViewContentInserted
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained smsComposeControllerDataInserted:self];
}

- (void)smsComposeControllerShouldSendMessageWithText:(id)a3 toRecipients:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(p_delegate);
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = objc_loadWeakRetained(p_delegate);
    [v13 smsComposeControllerShouldSendMessageWithText:v14 toRecipients:v8 completion:v9];
  }
  else
  {
    v9[2](v9, 1);
  }
}

- (void)smsComposeControllerSendStartedWithText:(id)a3 messageGUID:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  id v9 = objc_loadWeakRetained(&self->_delegate);
  id v10 = v9;
  if (v8)
  {
    [v9 smsComposeControllerSendStarted:self withText:v13 messageGUID:v6];
  }
  else
  {
    char v11 = objc_opt_respondsToSelector();

    id v12 = objc_loadWeakRetained(&self->_delegate);
    id v10 = v12;
    if (v11) {
      [v12 smsComposeControllerSendStarted:self withText:v13];
    }
    else {
      [v12 smsComposeControllerSendStarted:self];
    }
  }
}

- (void)setTextEntryContentsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKSMSComposeController *)self remoteViewControllerProxy];
  [v4 setTextEntryContentsVisible:v3];
}

- (void)_addRemoteVCIfNeeded
{
  if (self->_safeToAdd)
  {
    BOOL v3 = [(CKSMSComposeController *)self remoteViewController];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  id v5 = [(CKSMSComposeController *)self remoteViewController];
  id v6 = [v5 parentViewController];

  if (v4 && !v6)
  {
    id v7 = [(CKSMSComposeController *)self remoteViewController];
    [(CKSMSComposeController *)self addChildViewController:v7];

    char v8 = [(CKSMSComposeController *)self view];
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    id v17 = [(CKSMSComposeController *)self remoteViewController];
    id v18 = [v17 view];
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

    long long v19 = [(CKSMSComposeController *)self view];
    long long v20 = [(CKSMSComposeController *)self remoteViewController];
    __int16 v21 = [v20 view];
    [v19 addSubview:v21];

    id v22 = [(CKSMSComposeController *)self remoteViewController];
    [v22 didMoveToParentViewController:self];
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CKSMSComposeController;
  [(CKSMSComposeController *)&v7 viewDidLoad];
  BOOL v3 = [(CKSMSComposeController *)self view];
  BOOL v4 = +[CKUIBehavior sharedBehaviors];
  id v5 = [v4 theme];
  id v6 = [v5 transcriptBackgroundColor];
  [v3 setBackgroundColor:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_safeToAdd = 0;
  id v5 = [(CKSMSComposeController *)self navigationController];
  [v5 setNavigationBarHidden:1 animated:0];

  v6.receiver = self;
  v6.super_class = (Class)CKSMSComposeController;
  [(CKSMSComposeController *)&v6 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_safeToAdd = 1;
  [(CKSMSComposeController *)self _addRemoteVCIfNeeded];
  v6.receiver = self;
  v6.super_class = (Class)CKSMSComposeController;
  [(CKSMSComposeController *)&v6 viewDidAppear:v3];
  id v5 = [MEMORY[0x1E4F42738] sharedApplication];
  if ([v5 statusBarStyle])
  {
    self->_didChangeStatusBarStyle = 1;
    self->_savedStatusBarStyle = [v5 statusBarStyle];
    [v5 setStatusBarStyle:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKSMSComposeController;
  [(CKSMSComposeController *)&v6 viewWillDisappear:a3];
  if (self->_didChangeStatusBarStyle)
  {
    int64_t savedStatusBarStyle = self->_savedStatusBarStyle;
    id v5 = [MEMORY[0x1E4F42738] sharedApplication];
    [v5 setStatusBarStyle:savedStatusBarStyle];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKSMSComposeController;
  [(CKSMSComposeController *)&v3 viewDidDisappear:a3];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  BOOL v4 = [(CKSMSComposeController *)self remoteViewController];
  LOBYTE(a3) = [v4 shouldAutorotateToInterfaceOrientation:a3];

  return a3;
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKSMSComposeRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (CKSMSComposeQueuingRemoteViewControllerProxy)remoteViewControllerProxy
{
  return self->_remoteViewControllerProxy;
}

- (void)setRemoteViewControllerProxy:(id)a3
{
}

- (_UIAsyncInvocation)cancellationInvocation
{
  return self->_cancellationInvocation;
}

- (void)setCancellationInvocation:(id)a3
{
}

- (UINavigationController)clientNavigationController
{
  return self->_clientNavigationController;
}

- (void)setClientNavigationController:(id)a3
{
}

- (BOOL)safeToAdd
{
  return self->_safeToAdd;
}

- (void)setSafeToAdd:(BOOL)a3
{
  self->_safeToAdd = a3;
}

- (BOOL)didChangeStatusBarStyle
{
  return self->_didChangeStatusBarStyle;
}

- (void)setDidChangeStatusBarStyle:(BOOL)a3
{
  self->_didChangeStatusBarStyle = a3;
}

- (int64_t)savedStatusBarStyle
{
  return self->_savedStatusBarStyle;
}

- (void)setSavedStatusBarStyle:(int64_t)a3
{
  self->_int64_t savedStatusBarStyle = a3;
}

- (BOOL)firstItemWasInserted
{
  return self->_firstItemWasInserted;
}

- (void)setFirstItemWasInserted:(BOOL)a3
{
  self->_firstItemWasInserted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientNavigationController, 0);
  objc_storeStrong((id *)&self->_cancellationInvocation, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);

  objc_destroyWeak(&self->_delegate);
}

@end