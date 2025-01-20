@interface MFMailComposeViewController
+ (BOOL)_canSendMailInNewScene;
+ (BOOL)canSendMail;
+ (BOOL)canSendMailSourceAccountManagement:(int)a3;
+ (BOOL)hasAutosavedMessageWithIdentifier:(id)a3;
+ (BOOL)isMailDropConfigured;
+ (id)log;
+ (unint64_t)maximumAttachmentSize;
+ (void)removeAutosavedMessageWithIdentifier:(id)a3;
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (MFMailComposeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MFMailComposeViewController)initWithURL:(id)a3;
- (MFMailComposeViewController)initWithURL:(id)a3 sourceAccountManagement:(int)a4;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)UTITypes;
- (id)_addAttachmentItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5;
- (id)_addAttachmentWithFileURL:(id)a3 mimeType:(id)a4;
- (id)_addContentVariationWithName:(id)a3;
- (id)_internalViewController;
- (id)_validEmailAddressesFromArray:(id)a3;
- (id)cloudPhotoIDs;
- (id)contentText;
- (id)contentURLs;
- (id)mailComposeDelegate;
- (id)photoIDs;
- (id)shareSheetSessionID;
- (int64_t)preferredStatusBarStyle;
- (void)__viewControllerWillBePresented:(BOOL)a3;
- (void)_addAttachmentDataItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5 forContentVariation:(id)a6;
- (void)_presentComposeInNewWindowWithCompletion:(id)a3;
- (void)_setCKShare:(id)a3 setupContainerInfo:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6;
- (void)_setCKShareURLWrapper:(id)a3 share:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6;
- (void)_setDefaultContentVariation:(id)a3;
- (void)_setMessageBody:(id)a3 isHTML:(BOOL)a4 forContentVariation:(id)a5;
- (void)addAttachmentData:(NSData *)attachment mimeType:(NSString *)mimeType fileName:(NSString *)filename;
- (void)addSetupAnimationBlock:(id)a3;
- (void)autosaveWithHandler:(id)a3;
- (void)currentAttachmentLimitWithHandler:(id)a3;
- (void)finalizeCompositionValues;
- (void)recoverAutosavedMessageWithIdentifier:(id)a3;
- (void)requestFramesForAttachmentsWithIdentifiers:(id)a3 resultHandler:(id)a4;
- (void)setBccRecipients:(NSArray *)bccRecipients;
- (void)setCaretPosition:(unint64_t)a3;
- (void)setCcRecipients:(NSArray *)ccRecipients;
- (void)setCloudPhotoIDs:(id)a3;
- (void)setContentText:(id)a3;
- (void)setContentURLs:(id)a3;
- (void)setContentVisible:(BOOL)a3;
- (void)setHideMyEmailFrom:(id)a3;
- (void)setKeyboardVisible:(BOOL)a3;
- (void)setMailComposeDelegate:(id)mailComposeDelegate;
- (void)setMessageBody:(NSString *)body isHTML:(BOOL)isHTML;
- (void)setPhotoIDs:(id)a3;
- (void)setPreferredSendingEmailAddress:(NSString *)emailAddress;
- (void)setShareSheetSessionID:(id)a3;
- (void)setSourceAccountManagement:(int)a3;
- (void)setSubject:(NSString *)subject;
- (void)setToRecipients:(NSArray *)toRecipients;
- (void)setUTITypes:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MFMailComposeViewController

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MFMailComposeViewController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1) {
    dispatch_once(&log_onceToken_4, block);
  }
  v2 = (void *)log_log_4;

  return v2;
}

void __34__MFMailComposeViewController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;
}

- (MFMailComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[MFMailComposeViewController initWithURL:](self, "initWithURL:", 0, a4);
}

- (MFMailComposeViewController)initWithURL:(id)a3
{
  return [(MFMailComposeViewController *)self initWithURL:a3 sourceAccountManagement:1];
}

- (MFMailComposeViewController)initWithURL:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if ([(id)objc_opt_class() canSendMailSourceAccountManagement:v4])
  {
    v13.receiver = self;
    v13.super_class = (Class)MFMailComposeViewController;
    v7 = [(MFMailComposeViewController *)&v13 initWithNibName:0 bundle:0];
    if (v7)
    {
      if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad")) {
        [(MFMailComposeViewController *)v7 setModalPresentationStyle:1];
      }
      v8 = objc_alloc_init(MFMailComposeInternalViewController);
      v9 = v8;
      if (v6) {
        [(MFMailComposeInternalViewController *)v8 setURL:v6];
      }
      [(MFMailComposeViewController *)v7 pushViewController:v9 animated:0];
      objc_storeStrong(&v7->_internal, v9);
      [(MFMailComposeViewController *)v7 setSourceAccountManagement:v4];
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v11 = +[MFMailComposeViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MFMailComposeViewController initWithURL:sourceAccountManagement:](v11);
    }

    v10 = 0;
  }

  return v10;
}

- (id)_internalViewController
{
  return self->_internal;
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (void)__viewControllerWillBePresented:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeViewController;
  [(MFMailComposeViewController *)&v4 __viewControllerWillBePresented:a3];
  [(MFMailComposeViewController *)self finalizeCompositionValues];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailComposeViewController;
  [(MFMailComposeViewController *)&v6 viewWillAppear:a3];
  [(MFMailComposeViewController *)self finalizeCompositionValues];
  setupAnimationBlock = (void (**)(void))self->_setupAnimationBlock;
  if (setupAnimationBlock)
  {
    setupAnimationBlock[2]();
    id v5 = self->_setupAnimationBlock;
    self->_setupAnimationBlock = 0;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeViewController;
  [(MFMailComposeViewController *)&v5 viewWillDisappear:a3];
  if ([(MFMailComposeViewController *)self isBeingDismissed])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__MFMailComposeViewController_viewWillDisappear___block_invoke;
    block[3] = &unk_1E5F79088;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __49__MFMailComposeViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MFMailComposeViewControllerIsBeingDismissed" object:*(void *)(a1 + 32)];
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

+ (BOOL)canSendMail
{
  return [a1 canSendMailSourceAccountManagement:1];
}

+ (BOOL)canSendMailSourceAccountManagement:(int)a3
{
  return MEMORY[0x1F412C4D0](*(void *)&a3, a2);
}

- (id)mailComposeDelegate
{
  id v2 = [(MFMailComposeViewController *)self _internalViewController];
  id v3 = [v2 mailComposeDelegate];

  return v3;
}

- (void)setMailComposeDelegate:(id)mailComposeDelegate
{
  id v5 = mailComposeDelegate;
  objc_super v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setMailComposeDelegate:v5];
}

- (void)setSubject:(NSString *)subject
{
  id v5 = subject;
  objc_super v4 = [(MFMailComposeViewController *)self _impl];
  [v4 setSubject:v5];
}

- (id)_validEmailAddressesFromArray:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v5 = 138412290;
    long long v14 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v9, "ea_isLegalCommentedEmailAddress", v14, (void)v15) & 1) == 0)
        {
          v10 = +[MFMailComposeViewController log];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            v20 = v9;
            _os_log_error_impl(&dword_1AF945000, v10, OS_LOG_TYPE_ERROR, "%@ is not a valid email address.", buf, 0xCu);
          }

          if (!v6) {
            id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          [v6 addObject:v9];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v4);

    if (v6)
    {
      id v11 = [MEMORY[0x1E4F1CA48] arrayWithArray:v3];
      v12 = [v6 allObjects];
      [v11 removeObjectsInArray:v12];

      goto LABEL_18;
    }
  }
  else
  {
  }
  id v11 = v3;
  id v6 = 0;
LABEL_18:

  return v11;
}

- (void)setToRecipients:(NSArray *)toRecipients
{
  id v5 = [(MFMailComposeViewController *)self _validEmailAddressesFromArray:toRecipients];
  if ([v5 count])
  {
    uint64_t v4 = [(MFMailComposeViewController *)self _impl];
    [v4 setToRecipients:v5];
  }
}

- (void)setCcRecipients:(NSArray *)ccRecipients
{
  id v6 = ccRecipients;
  uint64_t v4 = -[MFMailComposeViewController _validEmailAddressesFromArray:](self, "_validEmailAddressesFromArray:");
  if ([v4 count])
  {
    id v5 = [(MFMailComposeViewController *)self _impl];
    [v5 setCcRecipients:v6];
  }
}

- (void)setBccRecipients:(NSArray *)bccRecipients
{
  id v6 = bccRecipients;
  uint64_t v4 = -[MFMailComposeViewController _validEmailAddressesFromArray:](self, "_validEmailAddressesFromArray:");
  if ([v4 count])
  {
    id v5 = [(MFMailComposeViewController *)self _impl];
    [v5 setBccRecipients:v6];
  }
}

- (void)setMessageBody:(NSString *)body isHTML:(BOOL)isHTML
{
  BOOL v4 = isHTML;
  uint64_t v7 = body;
  id v6 = [(MFMailComposeViewController *)self _impl];
  [v6 setMessageBody:v7 isHTML:v4];
}

- (void)setHideMyEmailFrom:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(MFMailComposeViewController *)self _impl];
  [v4 setHideMyEmailFrom:v5];
}

- (void)addAttachmentData:(NSData *)attachment mimeType:(NSString *)mimeType fileName:(NSString *)filename
{
  v12 = attachment;
  v8 = mimeType;
  v9 = filename;
  v10 = [(MFMailComposeViewController *)self _impl];
  id v11 = (id)[v10 addAttachmentData:v12 mimeType:v8 fileName:v9];
}

- (void)setPreferredSendingEmailAddress:(NSString *)emailAddress
{
  BOOL v4 = emailAddress;
  if ([(NSString *)v4 ea_isLegalCommentedEmailAddress])
  {
    id v5 = [(MFMailComposeViewController *)self _impl];
    [v5 setPreferredSendingEmailAddress:v4];
  }
  else
  {
    id v5 = +[MFMailComposeViewController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MFMailComposeViewController setPreferredSendingEmailAddress:]((uint64_t)v4, v5);
    }
  }
}

- (void)setUTITypes:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setUTITypes:v5];
}

- (id)UTITypes
{
  id v2 = [(MFMailComposeViewController *)self _internalViewController];
  id v3 = [v2 UTITypes];

  return v3;
}

- (void)setPhotoIDs:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setPhotoIDs:v5];
}

- (id)photoIDs
{
  id v2 = [(MFMailComposeViewController *)self _internalViewController];
  id v3 = [v2 photoIDs];

  return v3;
}

- (void)setCloudPhotoIDs:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setCloudPhotoIDs:v5];
}

- (id)cloudPhotoIDs
{
  id v2 = [(MFMailComposeViewController *)self _internalViewController];
  id v3 = [v2 cloudPhotoIDs];

  return v3;
}

- (void)setContentText:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setContentText:v5];
}

- (id)contentText
{
  id v2 = [(MFMailComposeViewController *)self _internalViewController];
  id v3 = [v2 contentText];

  return v3;
}

- (void)setContentURLs:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setContentURLs:v5];
}

- (id)contentURLs
{
  id v2 = [(MFMailComposeViewController *)self _internalViewController];
  id v3 = [v2 contentURLs];

  return v3;
}

- (void)setShareSheetSessionID:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setShareSheetSessionID:v5];
}

- (id)shareSheetSessionID
{
  id v2 = [(MFMailComposeViewController *)self _internalViewController];
  id v3 = [v2 shareSheetSessionID];

  return v3;
}

- (id)_addAttachmentWithFileURL:(id)a3 mimeType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MFMailComposeViewController *)self _internalViewController];
  v9 = [v8 addAttachmentFileURL:v6 mimeType:v7];

  return v9;
}

- (id)_addAttachmentItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MFMailComposeViewController *)self _internalViewController];
  v12 = [v11 addAttachmentItemProvider:v8 mimeType:v9 fileName:v10];

  return v12;
}

+ (unint64_t)maximumAttachmentSize
{
  return [MEMORY[0x1E4F77B60] currentMessageLimit];
}

- (void)currentAttachmentLimitWithHandler:(id)a3
{
  id v3 = (void (**)(id, uint64_t))a3;
  v3[2](v3, [MEMORY[0x1E4F77B60] currentMessageLimit]);
}

+ (BOOL)isMailDropConfigured
{
  return [MEMORY[0x1E4F77B60] mailDropConfigured];
}

- (void)requestFramesForAttachmentsWithIdentifiers:(id)a3 resultHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(MFMailComposeViewController *)self _internalViewController];
  [v7 requestFramesForAttachmentsWithIdentifiers:v8 resultHandler:v6];
}

- (void)setKeyboardVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setShowKeyboardImmediately:v3];
}

- (void)setContentVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setContentVisible:v3];
}

- (void)setSourceAccountManagement:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setSourceAccountManagement:v3];
}

- (id)_addContentVariationWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMailComposeViewController *)self _internalViewController];
  id v6 = [v5 addContentVariationWithName:v4];

  return v6;
}

- (void)_setDefaultContentVariation:(id)a3
{
  id v5 = a3;
  id v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setDefaultContentVariation:v5];
}

- (void)_setMessageBody:(id)a3 isHTML:(BOOL)a4 forContentVariation:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v7 = a5;
  [v7 setBody:v8];
  [v7 setBodyIsHTML:v6];
}

- (void)_addAttachmentDataItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5 forContentVariation:(id)a6
{
  id v11 = a6;
  id v10 = [(MFMailComposeViewController *)self _addAttachmentItemProvider:a3 mimeType:a4 fileName:a5];
  [v11 addAttachmentIdentifier:v10];
}

- (void)finalizeCompositionValues
{
  id v2 = [(MFMailComposeViewController *)self _internalViewController];
  [v2 finalizeCompositionValues];
}

- (void)addSetupAnimationBlock:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_setupAnimationBlock) {
    __assert_rtn("-[MFMailComposeViewController addSetupAnimationBlock:]", "MFMailComposeViewController.m", 416, "_setupAnimationBlock == NULL");
  }
  id v5 = _Block_copy(v4);
  id setupAnimationBlock = self->_setupAnimationBlock;
  self->_id setupAnimationBlock = v5;
}

- (void)setCaretPosition:(unint64_t)a3
{
  id v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setCaretPosition:a3];
}

- (void)_setCKShareURLWrapper:(id)a3 share:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a3;
  id v10 = a4;
  id v11 = [(MFMailComposeViewController *)self _internalViewController];
  [v11 _setCKShareURLWrapper:v12 share:v10 permissionType:a5 allowOthersToInvite:v6];
}

- (void)_setCKShare:(id)a3 setupContainerInfo:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a3;
  id v10 = a4;
  id v11 = [(MFMailComposeViewController *)self _internalViewController];
  [v11 _setCKShare:v12 setupContainerInfo:v10 permissionType:a5 allowOthersToInvite:v6];
}

+ (BOOL)_canSendMailInNewScene
{
  return +[MFMailComposeInternalViewController _canSendMailInNewScene];
}

- (void)_presentComposeInNewWindowWithCompletion:(id)a3
{
  id v5 = a3;
  id v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 _presentComposeInNewWindowFromComposeViewController:self completion:v5];
}

+ (BOOL)hasAutosavedMessageWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F73B48] autosave];
  char v5 = [v4 hasAutosavedMessageWithIdentifier:v3];

  return v5;
}

- (void)recoverAutosavedMessageWithIdentifier:(id)a3
{
  id v5 = a3;
  id v4 = [(MFMailComposeViewController *)self _internalViewController];
  [v4 setAutosaveIdentifier:v5];
}

- (void)autosaveWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMailComposeViewController *)self _internalViewController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MFMailComposeViewController_autosaveWithHandler___block_invoke;
  v7[3] = &unk_1E5F7C220;
  id v6 = v4;
  id v8 = v6;
  [v5 autosaveWithHandler:v7];
}

uint64_t __51__MFMailComposeViewController_autosaveWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)removeAutosavedMessageWithIdentifier:(id)a3
{
  id v4 = a3;
  id v3 = [MEMORY[0x1E4F73B48] autosave];
  [v3 removeAutosavedMessageWithIdentifier:v4];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad"))
  {
    id v5 = [(MFMailComposeViewController *)self parentViewController];
    id v6 = v5;
    if (v5) {
      char v7 = [v5 shouldAutorotateToInterfaceOrientation:a3];
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MFMailComposeViewController;
    return [(MFMailComposeViewController *)&v9 shouldAutorotateToInterfaceOrientation:a3];
  }
  return v7;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  id v2 = [(MFMailComposeViewController *)self _internalViewController];
  id v3 = [v2 remoteViewController];

  return (_UIRemoteViewController *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setupAnimationBlock, 0);

  objc_storeStrong(&self->_internal, 0);
}

- (void)initWithURL:(os_log_t)log sourceAccountManagement:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Unable to initialize due to + [MFMailComposeViewController canSendMail] returns NO.", v1, 2u);
}

- (void)setPreferredSendingEmailAddress:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF945000, a2, OS_LOG_TYPE_ERROR, "%{public}@ is not a valid email address.", (uint8_t *)&v2, 0xCu);
}

@end