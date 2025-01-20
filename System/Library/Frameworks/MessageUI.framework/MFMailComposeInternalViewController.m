@interface MFMailComposeInternalViewController
+ (BOOL)_canSendMailInNewScene;
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (MFMailComposeInternalViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MFMailComposeViewControllerDelegate)mailComposeDelegate;
- (NSArray)UTITypes;
- (NSArray)cloudPhotoIDs;
- (NSArray)contentText;
- (NSArray)contentURLs;
- (NSArray)photoIDs;
- (NSString)shareSheetSessionID;
- (id)addAttachmentData:(id)a3 mimeType:(id)a4 fileName:(id)a5;
- (id)addAttachmentFileURL:(id)a3 mimeType:(id)a4;
- (id)addAttachmentItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5;
- (id)addContentVariationWithName:(id)a3;
- (id)placeholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 proxy:(id)a7;
- (id)remoteViewController;
- (id)securityScopeForURL:(id)a3 proxy:(id)a4;
- (void)_beginDelayingCompositionPresenation;
- (void)_cancelComposition:(id)a3;
- (void)_cancelRemoteServiceViewControllerRequest;
- (void)_configureRemoteViewContoller;
- (void)_didEndDelayingCompositionPresentation;
- (void)_endDelayingCompositionPresentation;
- (void)_finishServiceViewControllerRequestWithSuccess:(BOOL)a3;
- (void)_loadContentViewControllerForcingPlaceholder:(BOOL)a3;
- (void)_notifyBodyDidFinishLoadingWithResult:(BOOL)a3;
- (void)_notifyCompositionDidFinish;
- (void)_presentComposeInNewWindowFromComposeViewController:(id)a3 completion:(id)a4;
- (void)_presentComposeInNewWindowFromComposeViewController:(id)a3 completion:(id)a4 dissmisal:(id)a5;
- (void)_processAttachmentsViaProxy:(id)a3 withHandler:(id)a4;
- (void)_serviceViewControllerReady:(id)a3 error:(id)a4;
- (void)_setCKShare:(id)a3 setupContainerInfo:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6;
- (void)_setCKShareURLWrapper:(id)a3 share:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6;
- (void)_setPlaceHolderSubject:(id)a3;
- (void)autosaveWithHandler:(id)a3;
- (void)composeFinishedWithResult:(int64_t)a3;
- (void)composeShouldSendMail:(id)a3 toRecipients:(id)a4 completion:(id)a5;
- (void)compositionFinishedWithResult:(int64_t)a3 error:(id)a4;
- (void)compositionRequestsSendWithBody:(id)a3 recipients:(id)a4 completion:(id)a5;
- (void)compositionViewServiceTerminatedWithError:(id)a3;
- (void)dealloc;
- (void)finalizeCompositionValues;
- (void)loadView;
- (void)requestFramesForAttachmentsWithIdentifiers:(id)a3 resultHandler:(id)a4;
- (void)setAutosaveIdentifier:(id)a3;
- (void)setBccRecipients:(id)a3;
- (void)setCaretPosition:(unint64_t)a3;
- (void)setCcRecipients:(id)a3;
- (void)setCloudPhotoIDs:(id)a3;
- (void)setContentText:(id)a3;
- (void)setContentURLs:(id)a3;
- (void)setContentVisible:(BOOL)a3;
- (void)setDefaultContentVariation:(id)a3;
- (void)setHideMyEmailFrom:(id)a3;
- (void)setMailComposeDelegate:(id)a3;
- (void)setMessageBody:(id)a3 isHTML:(BOOL)a4;
- (void)setPhotoIDs:(id)a3;
- (void)setPreferredSendingEmailAddress:(id)a3;
- (void)setShareSheetSessionID:(id)a3;
- (void)setShowKeyboardImmediately:(BOOL)a3;
- (void)setSourceAccountManagement:(int)a3;
- (void)setSubject:(id)a3;
- (void)setToRecipients:(id)a3;
- (void)setURL:(id)a3;
- (void)setUTITypes:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation MFMailComposeInternalViewController

- (MFMailComposeInternalViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MFMailComposeInternalViewController;
  v8 = [(MFMailComposeInternalViewController *)&v17 initWithNibName:v6 bundle:v7];
  v9 = v8;
  if (v8)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__MFMailComposeInternalViewController_initWithNibName_bundle___block_invoke;
    v15[3] = &unk_1E5F7C0B8;
    v10 = v8;
    v16 = v10;
    v11 = +[MFMailComposeRemoteViewController requestViewControllerWithConnectionHandler:v15];
    objc_storeStrong((id *)&v10->_cancellationInvocation, v11);
    v10->_defaultContentVariationIndex = 0x7FFFFFFFFFFFFFFFLL;
    v12 = objc_alloc_init(MFMailCompositionValues);
    compositionValues = v10->_compositionValues;
    v10->_compositionValues = v12;
  }
  return v9;
}

uint64_t __62__MFMailComposeInternalViewController_initWithNibName_bundle___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _serviceViewControllerReady:a2 error:a3];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  [(MFMailComposeRemoteViewController *)self->_serviceViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeInternalViewController;
  [(MFMailComposeInternalViewController *)&v3 dealloc];
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeInternalViewController;
  [(MFMailComposeInternalViewController *)&v3 loadView];
  [(MFMailComposeInternalViewController *)self _loadContentViewControllerForcingPlaceholder:0];
}

- (void)_loadContentViewControllerForcingPlaceholder:(BOOL)a3
{
  if ([(MFMailComposeInternalViewController *)self isViewLoaded])
  {
    if ((*((unsigned char *)self + 1080) & 8) == 0) {
      goto LABEL_3;
    }
    p_id serviceViewController = (id *)&self->_serviceViewController;
    id serviceViewController = self->_serviceViewController;
    if (serviceViewController && !a3)
    {
      if (!self->_placeholderViewController)
      {
        v5 = 0;
        uint64_t v10 = 1;
        goto LABEL_18;
      }
      v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_INFO, "#CompositionServices Removing placeholder view controller", buf, 2u);
      }

      v5 = self->_placeholderViewController;
      placeholderViewController = self->_placeholderViewController;
      self->_placeholderViewController = 0;

      uint64_t v10 = 1;
      goto LABEL_17;
    }
    if (serviceViewController)
    {
      v11 = MFLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_1AF945000, v11, OS_LOG_TYPE_INFO, "#CompositionServices Removing service view controller", v27, 2u);
      }

      v5 = (MFMailComposePlaceholderViewController *)*p_serviceViewController;
      id v12 = *p_serviceViewController;
      id *p_serviceViewController = 0;
    }
    else
    {
LABEL_3:
      v5 = 0;
    }
    p_id serviceViewController = (id *)&self->_placeholderViewController;
    id serviceViewController = self->_placeholderViewController;
    if (serviceViewController)
    {
      uint64_t v10 = 0;
LABEL_18:
      id v15 = serviceViewController;
      if (v5
        && ([(MFMailComposePlaceholderViewController *)v5 parentViewController],
            v16 = (MFMailComposeInternalViewController *)objc_claimAutoreleasedReturnValue(),
            v16,
            v16 == self))
      {
        [(MFMailComposePlaceholderViewController *)v5 willMoveToParentViewController:0];
        v24 = [(MFMailComposePlaceholderViewController *)v5 view];
        v25 = [v24 superview];
        v26 = [(MFMailComposeInternalViewController *)self view];

        if (v25 == v26) {
          [v24 removeFromSuperview];
        }
        [(MFMailComposePlaceholderViewController *)v5 removeFromParentViewController];

        if (!v15) {
          goto LABEL_25;
        }
      }
      else if (!v15)
      {
LABEL_25:
        v23 = [(MFMailComposeInternalViewController *)self navigationController];
        [v23 setNavigationBarHidden:v10 animated:0];

        return;
      }
      objc_super v17 = [v15 parentViewController];

      if (v17 != self)
      {
        [(MFMailComposeInternalViewController *)self addChildViewController:v15];
        v18 = [v15 view];
        v19 = [v18 superview];
        v20 = [(MFMailComposeInternalViewController *)self view];

        if (v19 != v20)
        {
          v21 = [(MFMailComposeInternalViewController *)self view];
          [v21 addSubview:v18];

          v22 = [(MFMailComposeInternalViewController *)self view];
          [v22 bounds];
          objc_msgSend(v18, "setFrame:");
        }
        [v15 didMoveToParentViewController:self];
      }
      goto LABEL_25;
    }
    v13 = objc_alloc_init(MFMailComposePlaceholderViewController);
    id v14 = *p_serviceViewController;
    id *p_serviceViewController = v13;

    [*p_serviceViewController setSubject:self->_placeholderSubject];
    uint64_t v10 = 0;
LABEL_17:
    id serviceViewController = *p_serviceViewController;
    goto LABEL_18;
  }
}

- (void)_setPlaceHolderSubject:(id)a3
{
  v4 = (NSString *)a3;
  if (self->_placeholderSubject != v4)
  {
    id v7 = v4;
    v5 = (NSString *)[(NSString *)v4 copy];
    placeholderSubject = self->_placeholderSubject;
    self->_placeholderSubject = v5;

    v4 = v7;
  }
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)MFMailComposeInternalViewController;
  [(MFMailComposeInternalViewController *)&v20 viewDidLoad];
  objc_super v3 = [(MFMailComposeInternalViewController *)self navigationItem];
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isSmallPhone"))
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1818]);
    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    id v6 = (void *)[v4 _initWithFilledSystemImageNamed:@"arrow.up.circle.fill" fillColor:v5];

    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v6 style:0 target:0 action:0];
    [v7 setEnabled:0];
    v8 = [(MFMailComposeInternalViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v7];
  }
  else
  {
    v9 = [(MFMailComposeInternalViewController *)self navigationController];
    uint64_t v10 = [v9 navigationBar];
    [v10 setPrefersLargeTitles:1];

    [v3 setLargeTitleDisplayMode:1];
    id v6 = +[MFComposeSendAccessoryButton buttonWithType:0];
    [v3 _setLargeTitleAccessoryView:v6 alignToBaseline:0];
  }

  id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
  id v14 = (void *)[v11 initWithTitle:v13 style:0 target:self action:sel__cancelComposition_];

  id v15 = [(MFMailComposeInternalViewController *)self navigationItem];
  [v15 setLeftBarButtonItem:v14];

  if ([(NSString *)self->_placeholderSubject length])
  {
    placeholderSubject = self->_placeholderSubject;
    objc_super v17 = [(MFMailComposeInternalViewController *)self navigationItem];
    [v17 setTitle:placeholderSubject];
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad"))
    {
      objc_super v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      [v17 localizedStringForKey:@"NEW_MESSAGE_LONG" value:&stru_1F0817A00 table:@"Main"];
    }
    else
    {
      objc_super v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      [v17 localizedStringForKey:@"NEW_MESSAGE" value:&stru_1F0817A00 table:@"Main"];
    v18 = };
    v19 = [(MFMailComposeInternalViewController *)self navigationItem];
    [v19 setTitle:v18];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeInternalViewController;
  [(MFMailComposeInternalViewController *)&v4 viewWillAppear:a3];
  if ((*((unsigned char *)self + 1080) & 0x10) == 0) {
    *((unsigned char *)self + 1080) |= 0x10u;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailComposeInternalViewController;
  [(MFMailComposeInternalViewController *)&v6 viewDidAppear:a3];
  if ((*((unsigned char *)self + 1080) & 0x20) == 0)
  {
    *((unsigned char *)self + 1080) &= ~0x10u;
    *((unsigned char *)self + 1080) |= 0x20u;
    [(MFMailComposeInternalViewController *)self _loadContentViewControllerForcingPlaceholder:0];
    if ((*((unsigned char *)self + 1080) & 0x40) != 0) {
      [(MFMailComposeInternalViewController *)self _notifyCompositionDidFinish];
    }
    objc_super v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    int v5 = [v4 isPPTAvailable];

    if (v5) {
      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_21);
    }
  }
}

void __53__MFMailComposeInternalViewController_viewDidAppear___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v0 postNotificationName:@"MFMailShareComposeViewDidShow" object:0 userInfo:0 deliverImmediately:1];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  if (!objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad")) {
    return 1;
  }
  int v5 = [(MFMailComposeInternalViewController *)self parentViewController];
  char v6 = [v5 shouldAutorotateToInterfaceOrientation:a3];

  return v6;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeInternalViewController;
  [(MFMailComposeInternalViewController *)&v5 willMoveToParentViewController:v4];
  if (v4 && (*((unsigned char *)self + 1080) & 8) == 0) {
    [(MFMailComposeInternalViewController *)self _beginDelayingCompositionPresenation];
  }
}

- (void)_beginDelayingCompositionPresenation
{
  if ((*((unsigned char *)self + 1080) & 1) == 0)
  {
    objc_super v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_INFO, "#CompositionServices Began delaying composition presentation", buf, 2u);
    }

    id v4 = [(MFMailComposeInternalViewController *)self navigationController];
    objc_super v5 = v4;
    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __75__MFMailComposeInternalViewController__beginDelayingCompositionPresenation__block_invoke;
      v6[3] = &unk_1E5F7C0E0;
      v6[4] = self;
      v6[5] = 0x3FE6666666666666;
      [v4 _beginDelayingPresentation:v6 cancellationHandler:0.7];
      self->_presentationDelayBeganTimestamp = CFAbsoluteTimeGetCurrent();
      *((unsigned char *)self + 1080) |= 1u;
    }
  }
}

uint64_t __75__MFMailComposeInternalViewController__beginDelayingCompositionPresenation__block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    objc_super v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 134217984;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_INFO, "#CompositionServices Delayed presentation timed out (%f.1 seconds)", (uint8_t *)&v6, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _didEndDelayingCompositionPresentation];
  return 1;
}

- (void)_endDelayingCompositionPresentation
{
  if ((*((unsigned char *)self + 1080) & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MFMailComposeInternalViewController.m" lineNumber:324 description:@"should have delayed presentation"];
  }
  if ((*((unsigned char *)self + 1080) & 2) == 0)
  {
    id v4 = [(MFMailComposeInternalViewController *)self navigationController];
    if (v4) {
      [v4 _endDelayingPresentation];
    }
    [(MFMailComposeInternalViewController *)self _didEndDelayingCompositionPresentation];
  }
}

- (void)_didEndDelayingCompositionPresentation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 1080) & 2) != 0)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"MFMailComposeInternalViewController.m", 339, @"Invalid parameter not satisfying: %@", @"!_didEndDelayedPresentation" object file lineNumber description];
  }
  objc_super v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent() - self->_presentationDelayBeganTimestamp;
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime v8 = v4;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_INFO, "#CompositionServices Ended delaying composition presentation (%.2f seconds)", buf, 0xCu);
  }

  *((unsigned char *)self + 1080) |= 2u;
}

- (void)_serviceViewControllerReady:(id)a3 error:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (self->_serviceViewController)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MFMailComposeInternalViewController.m", 346, @"Invalid parameter not satisfying: %@", @"!_serviceViewController" object file lineNumber description];
  }
  cancellationInvocation = self->_cancellationInvocation;
  self->_cancellationInvocation = 0;

  if (v9)
  {
    id v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMailComposeInternalViewController _serviceViewControllerReady:error:]();
    }
  }
  if (v8)
  {
    id v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_1AF945000, v12, OS_LOG_TYPE_INFO, "#CompositionServices Connected to view service: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_serviceViewController, a3);
    [(MFMailComposeRemoteViewController *)self->_serviceViewController setDelegate:self];
    if ((*((unsigned char *)self + 1080) & 4) != 0) {
      [(MFMailComposeInternalViewController *)self _configureRemoteViewContoller];
    }
  }
  else
  {
    [(MFMailComposeInternalViewController *)self _finishServiceViewControllerRequestWithSuccess:0];
  }
}

- (id)placeholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 proxy:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [MEMORY[0x1E4F60E18] promise];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__MFMailComposeInternalViewController_placeholderForFileName_fileSize_mimeType_contentID_proxy___block_invoke;
  v20[3] = &unk_1E5F7B478;
  id v16 = v15;
  id v21 = v16;
  [v14 serializedPlaceholderForFileName:v11 fileSize:a4 mimeType:v12 contentID:v13 withReply:v20];
  objc_super v17 = [v16 future];
  v18 = [v17 result:0];

  return v18;
}

void __96__MFMailComposeInternalViewController_placeholderForFileName_fileSize_mimeType_contentID_proxy___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F77B80] placeholderFromSerializedRepresentation:a2];
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:");
}

- (id)securityScopeForURL:(id)a3 proxy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F60E18] promise];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __65__MFMailComposeInternalViewController_securityScopeForURL_proxy___block_invoke;
  id v16 = &unk_1E5F7C108;
  id v8 = v5;
  id v17 = v8;
  id v9 = v7;
  id v18 = v9;
  [v6 securityScopeForURL:v8 withReply:&v13];
  uint64_t v10 = objc_msgSend(v9, "future", v13, v14, v15, v16);
  id v11 = [v10 result:0];

  return v11;
}

void __65__MFMailComposeInternalViewController_securityScopeForURL_proxy___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F77B90] securityScopedURL:*(void *)(a1 + 32) withToken:a2];
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:");
}

- (void)_processAttachmentsViaProxy:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MFMailComposeInternalViewController__processAttachmentsViaProxy_withHandler___block_invoke;
  block[3] = &unk_1E5F79528;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __79__MFMailComposeInternalViewController__processAttachmentsViaProxy_withHandler___block_invoke(void *a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v47 = [MEMORY[0x1E4F77B60] capabilitiesDictionary];
  v1 = [v47 objectForKeyedSubscript:*MEMORY[0x1E4F77B08]];
  char v2 = [v1 BOOLValue];

  id v3 = [v47 objectForKeyedSubscript:*MEMORY[0x1E4F77B00]];
  uint64_t v4 = [v3 integerValue];

  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__MFMailComposeInternalViewController__processAttachmentsViaProxy_withHandler___block_invoke_2;
  aBlock[3] = &unk_1E5F7C130;
  char v57 = v2;
  aBlock[4] = &v58;
  aBlock[5] = v4;
  v49 = (unsigned int (**)(void *, uint64_t))_Block_copy(aBlock);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = *(id *)(a1[4] + 1040);
  uint64_t v5 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v5)
  {
    uint64_t v50 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v53 != v50) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v8 = [v7 fileSize];
        id v9 = [v7 fileURL];

        if (v9)
        {
          id v10 = (void *)MEMORY[0x1E4F77B90];
          id v11 = [v7 fileURL];
          id v12 = [v10 securityScopedURL:v11];

          if (v49[2](v49, v8))
          {
            id v13 = [v12 startReadAccess];
            uint64_t v14 = (void *)a1[4];
            id v15 = [v13 lastPathComponent];
            id v16 = [v7 mimeType];
            id v17 = [v7 identifier];
            id v18 = [v14 placeholderForFileName:v15 fileSize:v8 mimeType:v16 contentID:v17 proxy:a1[5]];

            v19 = (void *)a1[4];
            objc_super v20 = [v18 fileURL];
            id v21 = [v19 securityScopeForURL:v20 proxy:a1[5]];

            v22 = [v21 startWriteAccess];
            [MEMORY[0x1E4F77B80] cloneFileAtURL:v13 toPlaceholderURL:v22];
            v23 = (void *)a1[5];
            v24 = [v18 serializedRepresentation];
            [v23 addAttachmentWithPlaceholderData:v24];

            [v12 stopAccess];
            [v21 stopAccess];
          }
          else
          {
            v29 = [v12 startReadAccess];
            v30 = [v12 data];
            v31 = (void *)a1[5];
            v32 = [v7 mimeType];
            v33 = [v29 lastPathComponent];
            v34 = [v7 identifier];
            [v31 addAttachmentWithData:v30 mimeType:v32 fileName:v33 hostIdentifier:v34];

            [v12 stopAccess];
            id v21 = 0;
          }
        }
        else
        {
          v25 = [v7 itemProvider];

          if (v25)
          {
            v26 = (void *)a1[5];
            id v12 = [v7 itemProvider];
            id v21 = [v7 mimeType];
            v27 = [v7 fileName];
            v28 = [v7 identifier];
            [v26 addAttachmentWithItemProvider:v12 mimeType:v21 filename:v27 hostIdentifier:v28];
LABEL_17:

            goto LABEL_18;
          }
          if (!v49[2](v49, v8))
          {
            v46 = (void *)a1[5];
            id v12 = [v7 data];
            id v21 = [v7 mimeType];
            v27 = [v7 fileName];
            v28 = [v7 identifier];
            [v46 addAttachmentWithData:v12 mimeType:v21 fileName:v27 hostIdentifier:v28];
            goto LABEL_17;
          }
          v35 = (void *)a1[4];
          v36 = [v7 fileName];
          v37 = [v7 mimeType];
          v38 = [v7 identifier];
          id v12 = [v35 placeholderForFileName:v36 fileSize:v8 mimeType:v37 contentID:v38 proxy:a1[5]];

          v39 = (void *)a1[4];
          v40 = [v12 fileURL];
          id v21 = [v39 securityScopeForURL:v40 proxy:a1[5]];

          v41 = [v21 startWriteAccess];
          v42 = (void *)MEMORY[0x1E4F77B80];
          v43 = [v7 data];
          LODWORD(v42) = [v42 writeData:v43 forURL:v41];

          if (v42)
          {
            v44 = (void *)a1[5];
            v45 = [v12 serializedRepresentation];
            [v44 addAttachmentWithPlaceholderData:v45];
          }
          [v21 stopAccess];
        }
LABEL_18:

        v59[3] += v8;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(a1[6] + 16))();
  _Block_object_dispose(&v58, 8);
}

BOOL __79__MFMailComposeInternalViewController__processAttachmentsViaProxy_withHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (!*(unsigned char *)(a1 + 48)) {
    return 0;
  }
  if (*(void *)(a1 + 40) >= a2) {
    return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + a2 > 0x500000;
  }
  return 1;
}

- (void)_configureRemoteViewContoller
{
  if ((*((unsigned char *)self + 1080) & 4) == 0)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MFMailComposeInternalViewController.m", 485, @"Invalid parameter not satisfying: %@", @"_compositionValuesAreFinalized" object file lineNumber description];
  }
  if ((*((unsigned char *)self + 1080) & 8) != 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MFMailComposeInternalViewController.m", 486, @"Invalid parameter not satisfying: %@", @"!_remoteViewControllerIsConfigured" object file lineNumber description];
  }
  id serviceViewController = self->_serviceViewController;
  if (serviceViewController)
  {
    uint64_t v5 = [(_UIRemoteViewController *)serviceViewController serviceViewControllerProxy];
    id v6 = [(MFMailCompositionValues *)self->_compositionValues dictionaryRepresentation];
    [v5 setCompositionValues:v6];

    id v7 = [(MFMailComposeInternalViewController *)self navigationController];
    uint64_t v8 = objc_msgSend(v7, "mf_dataForUICustomization");
    [v5 setUICustomizationData:v8];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke;
    v11[3] = &unk_1E5F79088;
    v11[4] = self;
    [(MFMailComposeInternalViewController *)self _processAttachmentsViaProxy:v5 withHandler:v11];
  }
}

void __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_2;
  aBlock[3] = &unk_1E5F7B4A0;
  aBlock[4] = *(void *)(a1 + 32);
  char v2 = _Block_copy(aBlock);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1000) serviceViewControllerProxyWithErrorHandler:v2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_2_120;
  v5[3] = &unk_1E5F7A240;
  id v4 = v2;
  id v6 = v4;
  [v3 commitCompositionValuesWithReply:v5];
}

void __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = "succeeded";
    if (v3) {
      uint64_t v5 = "failed";
    }
    id v6 = "";
    if (v3) {
      id v6 = " with error: ";
    }
    *(_DWORD *)buf = 136315650;
    id v11 = v5;
    id v7 = &stru_1F0817A00;
    if (v3) {
      id v7 = v3;
    }
    __int16 v12 = 2080;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_INFO, "#CompositionServices Committing composition values %s%s%@", buf, 0x20u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1080) |= 8u;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_118;
  v8[3] = &unk_1E5F79898;
  v8[4] = *(void *)(a1 + 32);
  BOOL v9 = v3 != 0;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_118(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishServiceViewControllerRequestWithSuccess:*(unsigned char *)(a1 + 40) == 0];
}

uint64_t __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_2_120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_finishServiceViewControllerRequestWithSuccess:(BOOL)a3
{
  if (a3)
  {
    if ((*((unsigned char *)self + 1080) & 8) == 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"MFMailComposeInternalViewController.m", 516, @"Invalid parameter not satisfying: %@", @"_remoteViewControllerIsConfigured" object file lineNumber description];
    }
    [(MFMailComposeInternalViewController *)self _notifyBodyDidFinishLoadingWithResult:1];
  }
  else
  {
    -[MFMailComposeInternalViewController _notifyBodyDidFinishLoadingWithResult:](self, "_notifyBodyDidFinishLoadingWithResult:");
    [(MFMailComposeInternalViewController *)self compositionFinishedWithResult:0 error:0];
  }
  if ((*((unsigned char *)self + 1080) & 0x10) == 0) {
    [(MFMailComposeInternalViewController *)self _loadContentViewControllerForcingPlaceholder:0];
  }

  [(MFMailComposeInternalViewController *)self _endDelayingCompositionPresentation];
}

- (void)_cancelComposition:(id)a3
{
  [(MFMailComposeInternalViewController *)self _cancelRemoteServiceViewControllerRequest];

  [(MFMailComposeInternalViewController *)self compositionFinishedWithResult:0 error:0];
}

- (void)_cancelRemoteServiceViewControllerRequest
{
  cancellationInvocation = self->_cancellationInvocation;
  if (cancellationInvocation)
  {
    id v4 = (id)[(_UIAsyncInvocation *)cancellationInvocation invoke];
    uint64_t v5 = self->_cancellationInvocation;
    self->_cancellationInvocation = 0;
  }
}

- (void)compositionFinishedWithResult:(int64_t)a3 error:(id)a4
{
  id v9 = a4;
  if ((*((unsigned char *)self + 1080) & 0x40) == 0)
  {
    *((unsigned char *)self + 1080) |= 0x40u;
    self->_composeResult = a3;
    objc_storeStrong((id *)&self->_composeResultError, a4);
    int v7 = objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad") ^ 1;
    if (a3 != 2) {
      LOBYTE(v7) = 1;
    }
    if ((v7 & 1) == 0)
    {
      uint64_t v8 = [(MFMailComposeInternalViewController *)self parentViewController];
      [v8 setModalTransitionStyle:13];
    }
    if ((*((unsigned char *)self + 1080) & 0x20) != 0) {
      [(MFMailComposeInternalViewController *)self _notifyCompositionDidFinish];
    }
  }
}

- (void)compositionRequestsSendWithBody:(id)a3 recipients:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v11 = [(MFMailComposeInternalViewController *)self navigationController];
    [WeakRetained mailComposeController:v11 shouldSendMail:v12 toRecipients:v8 completion:v9];
  }
  else
  {
    v9[2](v9, 1);
  }
}

- (void)setMailComposeDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeDelegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_mailComposeDelegate, obj);
    if (objc_opt_respondsToSelector()) {
      char v6 = 0x80;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 1080) = v6 & 0x80 | *((unsigned char *)self + 1080) & 0x7F;
    uint64_t v5 = obj;
  }
}

- (void)_notifyCompositionDidFinish
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 1080) & 0x40) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MFMailComposeInternalViewController.m", 589, @"Invalid parameter not satisfying: %@", @"_didFinish" object file lineNumber description];
  }
  if ((*((unsigned char *)self + 1080) & 0x20) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MFMailComposeInternalViewController.m", 590, @"Invalid parameter not satisfying: %@", @"_didAppear" object file lineNumber description];
  }
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int64_t composeResult = self->_composeResult;
    composeResultError = self->_composeResultError;
    int v7 = @", error: ";
    if (!composeResultError) {
      int v7 = &stru_1F0817A00;
    }
    *(_DWORD *)buf = 134218498;
    if (!composeResultError) {
      composeResultError = (NSError *)&stru_1F0817A00;
    }
    int64_t v13 = composeResult;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = composeResultError;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_INFO, "#CompositionServices Notifying delegate that composition finished with result %ld%@%@", buf, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(MFMailComposeInternalViewController *)self navigationController];
    [WeakRetained mailComposeController:v9 didFinishWithResult:self->_composeResult error:self->_composeResultError];
  }
}

- (void)_notifyBodyDidFinishLoadingWithResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = "DID NOT";
    if (v3) {
      char v6 = "DID";
    }
    int v9 = 136315138;
    id v10 = v6;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_INFO, "#CompositionServices Notifying delegate that composition message body %s finish loading", (uint8_t *)&v9, 0xCu);
  }

  if (*((char *)self + 1080) < 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeDelegate);
    id v8 = [(MFMailComposeInternalViewController *)self navigationController];
    [WeakRetained mailComposeController:v8 bodyFinishedLoadingWithResult:v3 error:0];
  }
}

- (void)compositionViewServiceTerminatedWithError:(id)a3
{
  [(MFMailComposeInternalViewController *)self _cancelRemoteServiceViewControllerRequest];
  [(MFMailComposeInternalViewController *)self _loadContentViewControllerForcingPlaceholder:1];

  [(MFMailComposeInternalViewController *)self compositionFinishedWithResult:0 error:0];
}

- (void)setURL:(id)a3
{
  id v7 = a3;
  -[MFMailCompositionValues setMailtoURL:](self->_compositionValues, "setMailtoURL:");
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60300]) initWithURL:v7];
  uint64_t v5 = [v4 subject];

  if (v5)
  {
    char v6 = [v4 subject];
    [(MFMailComposeInternalViewController *)self _setPlaceHolderSubject:v6];
  }
}

- (void)setAutosaveIdentifier:(id)a3
{
}

- (void)setSubject:(id)a3
{
  id v4 = (id)[a3 copy];
  -[MFMailCompositionValues setSubject:](self->_compositionValues, "setSubject:");
  [(MFMailComposeInternalViewController *)self _setPlaceHolderSubject:v4];
}

- (void)setMessageBody:(id)a3 isHTML:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    [(MFMailCompositionValues *)self->_compositionValues setMessageBody:v6];
    [(MFMailCompositionValues *)self->_compositionValues setIsHTML:v4];
  }
}

- (void)setToRecipients:(id)a3
{
}

- (void)setHideMyEmailFrom:(id)a3
{
}

- (void)setCcRecipients:(id)a3
{
}

- (void)setBccRecipients:(id)a3
{
}

- (void)setPreferredSendingEmailAddress:(id)a3
{
}

- (void)setShowKeyboardImmediately:(BOOL)a3
{
}

- (void)setSourceAccountManagement:(int)a3
{
}

- (void)setContentVisible:(BOOL)a3
{
  id serviceViewController = self->_serviceViewController;
  if (serviceViewController)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__MFMailComposeInternalViewController_setContentVisible___block_invoke;
    v5[3] = &unk_1E5F79898;
    void v5[4] = self;
    BOOL v6 = a3;
    [(_UIRemoteViewController *)serviceViewController synchronizeAnimationsInActions:v5];
  }
  else
  {
    compositionValues = self->_compositionValues;
    [(MFMailCompositionValues *)compositionValues setShowContentImmediately:a3];
  }
}

void __57__MFMailComposeInternalViewController_setContentVisible___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1000) serviceViewControllerProxy];
  [v2 setContentVisible:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setCaretPosition:(unint64_t)a3
{
}

- (id)addContentVariationWithName:(id)a3
{
  BOOL v3 = [(MFMailCompositionValues *)self->_compositionValues addContentVariationWithName:a3];

  return v3;
}

- (void)setDefaultContentVariation:(id)a3
{
  id v7 = a3;
  unint64_t v4 = -[NSMutableArray indexOfObject:](self->_contentVariations, "indexOfObject:");
  if (self->_contentVariations) {
    BOOL v5 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:0 userInfo:0];
    objc_exception_throw(v6);
  }
  self->_defaultContentVariationIndex = v4;
}

- (void)setUTITypes:(id)a3
{
}

- (NSArray)UTITypes
{
  return [(MFMailCompositionValues *)self->_compositionValues UTITypes];
}

- (void)setPhotoIDs:(id)a3
{
}

- (NSArray)photoIDs
{
  return [(MFMailCompositionValues *)self->_compositionValues photoIDs];
}

- (void)setCloudPhotoIDs:(id)a3
{
}

- (NSArray)cloudPhotoIDs
{
  return [(MFMailCompositionValues *)self->_compositionValues cloudPhotoIDs];
}

- (void)setContentText:(id)a3
{
}

- (NSArray)contentText
{
  return [(MFMailCompositionValues *)self->_compositionValues contentText];
}

- (void)setContentURLs:(id)a3
{
}

- (NSArray)contentURLs
{
  return [(MFMailCompositionValues *)self->_compositionValues contentURLs];
}

- (void)setShareSheetSessionID:(id)a3
{
}

- (NSString)shareSheetSessionID
{
  return [(MFMailCompositionValues *)self->_compositionValues shareSheetSessionID];
}

- (void)_setCKShareURLWrapper:(id)a3 share:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v10 = a4;
  [(MFMailCompositionValues *)self->_compositionValues setSharingSandboxingURLWrapper:v11];
  [(MFMailCompositionValues *)self->_compositionValues setCkShare:v10];
  [(MFMailCompositionValues *)self->_compositionValues setCkSharePermissionType:a5];
  [(MFMailCompositionValues *)self->_compositionValues setCkShareAllowOthersToInvite:v6];
}

- (void)_setCKShare:(id)a3 setupContainerInfo:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v10 = a4;
  [(MFMailCompositionValues *)self->_compositionValues setCkShare:v11];
  [(MFMailCompositionValues *)self->_compositionValues setCkContainerSetupInfo:v10];
  [(MFMailCompositionValues *)self->_compositionValues setCkSharePermissionType:a5];
  [(MFMailCompositionValues *)self->_compositionValues setCkShareAllowOthersToInvite:v6];
}

- (id)addAttachmentFileURL:(id)a3 mimeType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFMailComposeInternalViewController.m", 768, @"%s fileURL must not be nil.", "-[MFMailComposeInternalViewController addAttachmentFileURL:mimeType:]");

    if (v9) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFMailComposeInternalViewController.m", 769, @"%s mimeType must not be nil.", "-[MFMailComposeInternalViewController addAttachmentFileURL:mimeType:]");

LABEL_3:
  id v10 = +[MFMailComposeAttachmentWrapper wrapperWithFileURL:v7 mimeType:v9];
  attachments = self->_attachments;
  if (!attachments)
  {
    id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int64_t v13 = self->_attachments;
    self->_attachments = v12;

    attachments = self->_attachments;
  }
  [(NSMutableArray *)attachments addObject:v10];
  __int16 v14 = [v10 identifier];

  return v14;
}

- (id)addAttachmentData:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_10:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFMailComposeInternalViewController.m", 784, @"%s mimeType must not be nil.", "-[MFMailComposeInternalViewController addAttachmentData:mimeType:fileName:]");

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFMailComposeInternalViewController.m", 783, @"%s attachment must not be nil.", "-[MFMailComposeInternalViewController addAttachmentData:mimeType:fileName:]");

  if (!v10) {
    goto LABEL_10;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_11:
  objc_super v20 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFMailComposeInternalViewController.m", 785, @"%s filename must not be nil.", "-[MFMailComposeInternalViewController addAttachmentData:mimeType:fileName:]");

LABEL_4:
  id v12 = +[MFMailComposeAttachmentWrapper wrapperWithData:v9 mimeType:v10 fileName:v11];
  attachments = self->_attachments;
  if (!attachments)
  {
    __int16 v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = self->_attachments;
    self->_attachments = v14;

    attachments = self->_attachments;
  }
  [(NSMutableArray *)attachments addObject:v12];
  __int16 v16 = [v12 identifier];

  return v16;
}

- (id)addAttachmentItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MFMailComposeInternalViewController.m", 799, @"Invalid parameter not satisfying: %@", @"itemProvider" object file lineNumber description];
  }
  id v12 = +[MFMailComposeAttachmentWrapper wrapperWithItemProvider:v9 mimeType:v10 fileName:v11];
  attachments = self->_attachments;
  if (!attachments)
  {
    __int16 v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = self->_attachments;
    self->_attachments = v14;

    attachments = self->_attachments;
  }
  [(NSMutableArray *)attachments addObject:v12];
  __int16 v16 = [v12 identifier];

  return v16;
}

- (void)finalizeCompositionValues
{
  if ((*((unsigned char *)self + 1080) & 4) == 0)
  {
    BOOL v3 = (void *)[(NSMutableArray *)self->_contentVariations copy];
    [(MFMailCompositionValues *)self->_compositionValues setContentVariations:v3];

    [(MFMailCompositionValues *)self->_compositionValues setDefaultContentVariationIndex:self->_defaultContentVariationIndex];
    unint64_t v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_INFO, "#CompositionServices Finalizing composition values", v5, 2u);
    }

    *((unsigned char *)self + 1080) |= 4u;
    [(MFMailComposeInternalViewController *)self _configureRemoteViewContoller];
  }
}

+ (BOOL)_canSendMailInNewScene
{
  int v2 = objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad");
  if (v2)
  {
    LOBYTE(v2) = MEMORY[0x1F412C4C8]();
  }
  return v2;
}

- (void)_presentComposeInNewWindowFromComposeViewController:(id)a3 completion:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __102__MFMailComposeInternalViewController__presentComposeInNewWindowFromComposeViewController_completion___block_invoke;
  v4[3] = &unk_1E5F79088;
  v4[4] = self;
  [(MFMailComposeInternalViewController *)self _presentComposeInNewWindowFromComposeViewController:a3 completion:a4 dissmisal:v4];
}

void __102__MFMailComposeInternalViewController__presentComposeInNewWindowFromComposeViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(void **)(v1 + 1088);
  *(void *)(v1 + 1088) = 0;
}

- (void)_presentComposeInNewWindowFromComposeViewController:(id)a3 completion:(id)a4 dissmisal:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int64_t v13 = [(MFMailComposeInternalViewController *)self mailComposeDelegate];

  if (v13)
  {
    listener = self->_listener;
    if (!listener)
    {
      id v15 = [MEMORY[0x1E4F29290] anonymousListener];
      __int16 v16 = self->_listener;
      self->_listener = v15;

      [(NSXPCListener *)self->_listener setDelegate:self];
      [(NSXPCListener *)self->_listener resume];
      listener = self->_listener;
    }
    int64_t v13 = [(NSXPCListener *)listener endpoint];
    id v17 = _Block_copy(v12);
    id sceneDismissal = self->_sceneDismissal;
    self->_id sceneDismissal = v17;

    objc_storeStrong((id *)&self->_composeViewController, a3);
  }
  id v19 = objc_alloc(MEMORY[0x1E4F73B60]);
  objc_super v20 = [(MFMailCompositionValues *)self->_compositionValues autosaveIdentifier];
  id v21 = v20;
  if (!v20)
  {
    BOOL v5 = [MEMORY[0x1E4F29128] UUID];
    id v21 = [v5 UUIDString];
  }
  v22 = [(MFMailCompositionValues *)self->_compositionValues dictionaryRepresentation];
  v23 = (void *)[v19 initWithAutosaveIdentifier:v21 compositionValues:v22 attachments:self->_attachments];

  if (!v20)
  {
  }
  v24 = MFLogGeneral();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = [v23 autosaveIdentifier];
    *(_DWORD *)buf = 138543362;
    v31 = v25;
    _os_log_impl(&dword_1AF945000, v24, OS_LOG_TYPE_INFO, "#CompositionServices Present compose in new window with identifier: %{public}@", buf, 0xCu);
  }
  v26 = (void *)MEMORY[0x1E4F73B58];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __112__MFMailComposeInternalViewController__presentComposeInNewWindowFromComposeViewController_completion_dissmisal___block_invoke;
  v28[3] = &unk_1E5F7B708;
  id v27 = v11;
  id v29 = v27;
  [v26 presentNewMailWithContext:v23 delegateEndpoint:v13 completion:v28];
}

void __112__MFMailComposeInternalViewController__presentComposeInNewWindowFromComposeViewController_completion_dissmisal___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    unint64_t v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL v5 = objc_msgSend(v3, "ef_publicDescription");
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_INFO, "#CompositionServices Present compose in new window failed with error: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 == 0);
  }
}

- (void)composeShouldSendMail:(id)a3 toRecipients:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  __int16 v16 = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  __int16 v14 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v15, 3221225472, __85__MFMailComposeInternalViewController_composeShouldSendMail_toRecipients_completion___block_invoke, &unk_1E5F7C158, v16);
  [v14 performBlock:&v15];
}

void __85__MFMailComposeInternalViewController_composeShouldSendMail_toRecipients_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) mailComposeDelegate];
  if (objc_opt_respondsToSelector())
  {
    int v2 = [*(id *)(a1 + 32) navigationController];
    [v3 mailComposeController:v2 shouldSendMail:*(void *)(a1 + 40) toRecipients:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)composeFinishedWithResult:(int64_t)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", MEMORY[0x1E4F143A8], 3221225472, __65__MFMailComposeInternalViewController_composeFinishedWithResult___block_invoke, &unk_1E5F79178, self, a3);
  [v3 performBlock:&v4];
}

void __65__MFMailComposeInternalViewController_composeFinishedWithResult___block_invoke(uint64_t a1)
{
  int v2 = (uint64_t *)(a1 + 40);
  unint64_t v3 = MFMailComposeResultMake(*(void *)(a1 + 40));
  if (v3 != *v2)
  {
    uint64_t v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__MFMailComposeInternalViewController_composeFinishedWithResult___block_invoke_cold_1(v2, v4, v5);
    }
  }
  uint64_t v6 = [*(id *)(a1 + 32) mailComposeDelegate];
  int v7 = [*(id *)(a1 + 32) navigationController];
  [v6 mailComposeController:v7 didFinishWithResult:v3 error:0];

  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 1088);
  if (v9)
  {
    (*(void (**)(void))(v9 + 16))();
    uint64_t v8 = *(void *)(a1 + 32);
  }
  id v10 = *(void **)(v8 + 984);
  *(void *)(v8 + 984) = 0;

  id v11 = *(id *)(*(void *)(a1 + 32) + 976);
  id v12 = v11;
  if (v11)
  {
    [v11 setDelegate:0];
    [v12 invalidate];
    uint64_t v13 = *(void *)(a1 + 32);
    __int16 v14 = *(void **)(v13 + 976);
    *(void *)(v13 + 976) = 0;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 valueForEntitlement:@"com.apple.mobilemail.mailservices"];
  if ((objc_opt_respondsToSelector() & 1) != 0 || ([v6 BOOLValue] & 1) == 0)
  {
    uint64_t v8 = MSDEntitledOpenComposeProtocolDelegateXPCInterface();
    [v5 setExportedInterface:v8];

    [v5 setExportedObject:self];
    [v5 resume];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)requestFramesForAttachmentsWithIdentifiers:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_serviceViewController)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v9 = [MEMORY[0x1E4FB1438] sharedApplication];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke;
    v23[3] = &unk_1E5F79A10;
    v23[4] = &v24;
    uint64_t v10 = [v9 beginBackgroundTaskWithExpirationHandler:v23];

    v25[3] = v10;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_169;
    aBlock[3] = &unk_1E5F7C1A8;
    aBlock[4] = self;
    id v21 = v8;
    v22 = &v24;
    id v11 = _Block_copy(aBlock);
    id serviceViewController = self->_serviceViewController;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_2;
    v18[3] = &unk_1E5F7B708;
    id v13 = v11;
    id v19 = v13;
    __int16 v14 = [(_UIRemoteViewController *)serviceViewController serviceViewControllerProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_3;
    v16[3] = &unk_1E5F7C1D0;
    id v15 = v13;
    id v17 = v15;
    [v14 framesForAttachmentsWithIdentifiers:v6 withReply:v16];

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke(uint64_t a1)
{
  int v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_INFO, "#CompositionServices Background task expired (requestFramesForAttachmentsWithIdentifiers)", v4, 2u);
  }

  unint64_t v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

void __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_169_cold_1();
    }
  }
  if (v5)
  {
    uint64_t v8 = [*(id *)(a1 + 32) navigationController];
    uint64_t v9 = [v8 view];

    uint64_t v10 = [*(id *)(a1 + 32) view];
    id v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_171;
    v16[3] = &unk_1E5F7C180;
    id v12 = v9;
    id v17 = v12;
    id v13 = v10;
    id v18 = v13;
    id v14 = v11;
    id v19 = v14;
    [v5 enumerateKeysAndObjectsUsingBlock:v16];
  }
  else
  {
    id v14 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v15 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v15 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
}

void __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  [v5 CGRectValue];
  objc_msgSend(v6, "convertRect:fromView:", *(void *)(a1 + 40));
  id v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
  [*(id *)(a1 + 48) setObject:v7 forKey:v8];
}

uint64_t __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)autosaveWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serviceViewController)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
    id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke;
    v20[3] = &unk_1E5F79A10;
    void v20[4] = &v21;
    uint64_t v7 = [v6 beginBackgroundTaskWithExpirationHandler:v20];

    v22[3] = v7;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_176;
    aBlock[3] = &unk_1E5F7C1F8;
    id v18 = v5;
    id v19 = &v21;
    id v8 = _Block_copy(aBlock);
    id serviceViewController = self->_serviceViewController;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_178;
    v15[3] = &unk_1E5F7B708;
    id v10 = v8;
    id v16 = v10;
    id v11 = [(_UIRemoteViewController *)serviceViewController serviceViewControllerProxyWithErrorHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_2;
    v13[3] = &unk_1E5F7C220;
    id v12 = v10;
    id v14 = v12;
    [v11 autosaveWithReply:v13];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke(uint64_t a1)
{
  int v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_INFO, "#CompositionServices Background task expired (autosaveWithHandler)", v4, 2u);
  }

  unint64_t v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

void __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_176(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_176_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v8 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v8 endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

uint64_t __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_178(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)remoteViewController
{
  return self->_serviceViewController;
}

- (MFMailComposeViewControllerDelegate)mailComposeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeDelegate);

  return (MFMailComposeViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mailComposeDelegate);
  objc_storeStrong(&self->_sceneDismissal, 0);
  objc_storeStrong((id *)&self->_composeResultError, 0);
  objc_storeStrong((id *)&self->_placeholderSubject, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_compositionValues, 0);
  objc_storeStrong((id *)&self->_contentVariations, 0);
  objc_storeStrong((id *)&self->_cancellationInvocation, 0);
  objc_storeStrong((id *)&self->_serviceViewController, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_composeViewController, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_serviceViewControllerReady:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_1_3(&dword_1AF945000, v3, (uint64_t)v3, "#CompositionServices _serviceViewControllerReady: %{public}@", v4);
}

void __79__MFMailComposeInternalViewController__processAttachmentsViaProxy_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  _DWORD *v1 = 138412290;
  *unint64_t v3 = v2;
  OUTLINED_FUNCTION_1_3(&dword_1AF945000, v5, (uint64_t)v3, "Failed to write placeholder for [%@]", v4);
}

void __65__MFMailComposeInternalViewController_composeFinishedWithResult___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_1_3(&dword_1AF945000, a2, a3, "#CompositionServices Remote compose window returned invalid result: %ld", (uint8_t *)&v4);
}

void __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_169_cold_1()
{
  OUTLINED_FUNCTION_4();
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_1_3(&dword_1AF945000, v3, (uint64_t)v3, "#CompositionServices requestFramesForAttachmentsWithIdentifiers: %{public}@", v4);
}

void __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_176_cold_1()
{
  OUTLINED_FUNCTION_4();
  *(_DWORD *)uint64_t v1 = 138543362;
  *(void *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_1_3(&dword_1AF945000, v3, (uint64_t)v3, "#CompositionServices autosaveWithHandler: %{public}@", v4);
}

@end