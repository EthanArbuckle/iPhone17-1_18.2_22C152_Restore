@interface CKFunCameraViewController
- (BOOL)commitPayload:(id)a3 forPlugin:(id)a4 allowAllCommits:(BOOL)a5 error:(id *)a6;
- (BOOL)isDismissing;
- (BOOL)prefersStatusBarHidden;
- (CKBrowserViewControllerProtocol)funCameraAppViewController;
- (CKCamPhysicalCaptureNotifier)physicalCaptureNotifier;
- (CKConversation)conversation;
- (CKFunCameraViewController)initWithConversation:(id)a3;
- (CKFunCameraViewControllerDelegate)delegate;
- (IMBalloonPlugin)balloonPlugin;
- (UIView)funCameraView;
- (id)configuredContentViewControllerForPlugin:(id)a3;
- (id)contentViewControllerForPlugin:(id)a3;
- (id)dragControllerTranscriptDelegate;
- (id)traitCollection;
- (void)_checkExtensionAliveOnAppResume:(id)a3;
- (void)_dismissAndPresentPhotosApp:(BOOL)a3;
- (void)_handleRemoteConnectionInterrupted:(id)a3;
- (void)commitPayload:(id)a3;
- (void)dealloc;
- (void)dismiss;
- (void)dismissAndPresentPhotosApp;
- (void)physicalCaptureNotifierDidChangeState:(id)a3;
- (void)setBalloonPlugin:(id)a3;
- (void)setConversation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFunCameraAppViewController:(id)a3;
- (void)setFunCameraView:(id)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setPhysicalCaptureNotifier:(id)a3;
- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)startEditingPayload:(id)a3;
- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CKFunCameraViewController

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v7 = self;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "CKFunCameraViewController (%p) being torn down", buf, 0xCu);
    }
  }
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CKFunCameraViewController;
  [(CKFunCameraViewController *)&v5 dealloc];
}

- (CKFunCameraViewController)initWithConversation:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CKFunCameraViewController;
  v6 = [(CKFunCameraViewController *)&v39 init];
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v41 = v6;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "CKFunCameraViewController (%p) being created", buf, 0xCu);
      }
    }
    objc_storeStrong((id *)&v6->_conversation, a3);
    uint64_t v8 = [MEMORY[0x1E4F6BC18] sharedInstance];
    v9 = IMBalloonExtensionIDWithSuffix();
    uint64_t v10 = [v8 balloonPluginForBundleID:v9];
    balloonPlugin = v6->_balloonPlugin;
    v6->_balloonPlugin = (IMBalloonPlugin *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v6 selector:sel__handleRemoteConnectionInterrupted_ name:*MEMORY[0x1E4F6D348] object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v6 selector:sel__handleRemoteConnectionInterrupted_ name:@"CKRemoteViewFailedInstantiationNotification" object:0];

    v14 = [(CKFunCameraViewController *)v6 configuredContentViewControllerForPlugin:v6->_balloonPlugin];
    v15 = v14;
    if (v14)
    {
      [(CKBrowserViewControllerProtocol *)v14 setSendDelegate:v6];
      funCameraAppViewController = v6->_funCameraAppViewController;
      v6->_funCameraAppViewController = v15;
      v17 = v15;

      uint64_t v18 = [(CKBrowserViewControllerProtocol *)v17 view];
      funCameraView = v6->_funCameraView;
      v6->_funCameraView = (UIView *)v18;

      v20 = [MEMORY[0x1E4F428B8] blackColor];
      [(UIView *)v6->_funCameraView setBackgroundColor:v20];

      v21 = [(CKFunCameraViewController *)v6 view];
      [v21 bounds];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      v30 = [(CKBrowserViewControllerProtocol *)v17 view];
      objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

      [(CKFunCameraViewController *)v6 addChildViewController:v17];
      v31 = [(CKFunCameraViewController *)v6 view];
      v32 = [(CKBrowserViewControllerProtocol *)v17 view];
      [v31 addSubview:v32];

      v33 = objc_alloc_init(CKCamPhysicalCaptureNotifier);
      physicalCaptureNotifier = v6->_physicalCaptureNotifier;
      v6->_physicalCaptureNotifier = v33;

      [(CKCamPhysicalCaptureNotifier *)v6->_physicalCaptureNotifier setDelegate:v6];
      v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v35 addObserver:v6 selector:sel__checkExtensionAliveOnAppResume_ name:*MEMORY[0x1E4F43708] object:0];
    }
    else if (IMOSLoggingEnabled())
    {
      v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = [(IMBalloonPlugin *)v6->_balloonPlugin identifier];
        *(_DWORD *)buf = 138412290;
        v41 = v37;
        _os_log_impl(&dword_18EF18000, v36, OS_LOG_TYPE_INFO, "CKFunCameraViewController: Unable to load plugin or view controller for fun camera, plugin id %@", buf, 0xCu);
      }
    }
  }

  return v6;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CKFunCameraViewController;
  [(CKFunCameraViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(CKFunCameraViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(CKFunCameraViewController *)self funCameraView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKFunCameraViewController;
  [(CKFunCameraViewController *)&v8 viewWillAppear:a3];
  double v4 = [(CKFunCameraViewController *)self physicalCaptureNotifier];
  [v4 setEnabled:1];

  double v5 = [MEMORY[0x1E4F42738] sharedApplication];
  [v5 setIdleTimerDisabled:1];

  if (IMOSLoggingEnabled())
  {
    double v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Enabled idle timer and volume button handler", v7, 2u);
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKFunCameraViewController;
  [(CKFunCameraViewController *)&v8 viewDidDisappear:a3];
  double v4 = [(CKFunCameraViewController *)self physicalCaptureNotifier];
  [v4 setEnabled:0];

  double v5 = [MEMORY[0x1E4F42738] sharedApplication];
  [v5 setIdleTimerDisabled:0];

  if (IMOSLoggingEnabled())
  {
    double v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Disabled idle timer and volume button handler", v7, 2u);
    }
  }
}

- (id)traitCollection
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CKFunCameraViewController;
  v2 = [(CKFunCameraViewController *)&v8 traitCollection];
  v3 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
  double v4 = (void *)MEMORY[0x1E4F42F80];
  v9[0] = v2;
  v9[1] = v3;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  double v6 = [v4 traitCollectionWithTraitsFromCollections:v5];

  return v6;
}

- (id)configuredContentViewControllerForPlugin:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(CKFunCameraViewController *)self contentViewControllerForPlugin:v4];
    if (objc_opt_respondsToSelector()) {
      int v6 = [v5 isLoaded] ^ 1;
    }
    else {
      int v6 = 0;
    }
    objc_super v8 = [(CKFunCameraViewController *)self funCameraAppViewController];

    if (v5 != v8 || v6) && (objc_opt_respondsToSelector()) {
      [v5 loadRemoteViewWithCompletion:0];
    }
    if (objc_opt_respondsToSelector())
    {
      double v9 = [(CKFunCameraViewController *)self conversation];
      double v10 = [v9 senderIdentifier];
      [v5 setSender:v10];
    }
    if (objc_opt_respondsToSelector())
    {
      double v11 = [(CKFunCameraViewController *)self conversation];
      v12 = [v11 recipientStrings];

      [v5 setRecipients:v12];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "contentViewControllerForPlugin: Called with nil plugin", v14, 2u);
      }
    }
    double v5 = 0;
  }

  return v5;
}

- (id)contentViewControllerForPlugin:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[CKBalloonPluginManager sharedInstance];
    double v5 = [v3 identifier];

    int v6 = [v4 viewControllerForPluginIdentifier:v5 dataSource:0];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)_checkExtensionAliveOnAppResume:(id)a3
{
  id v4 = a3;
  double v5 = [(CKFunCameraViewController *)self funCameraAppViewController];
  char v6 = [v5 isAlive];

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      double v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v8 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Extension connection was dead on app resume, dismissing", v8, 2u);
      }
    }
    [(CKFunCameraViewController *)self dismiss];
  }
}

- (void)_handleRemoteConnectionInterrupted:(id)a3
{
  id v4 = a3;
  double v5 = [v4 userInfo];
  char v6 = [v5 objectForKey:*MEMORY[0x1E4F6D340]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = IMBalloonExtensionIDWithSuffix();
    if ([v7 isEqualToIgnoringCase:v6])
    {
      if (IMOSLoggingEnabled())
      {
        objc_super v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v9 = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Dismissing due to extension interruption for camera", v9, 2u);
        }
      }
      [(CKFunCameraViewController *)self dismiss];
    }
  }
}

- (void)commitPayload:(id)a3
{
  id v4 = a3;
  id v6 = [(CKFunCameraViewController *)self delegate];
  double v5 = [(CKFunCameraViewController *)self conversation];
  [v6 startCommitPayload:v4 forConversation:v5];
}

- (BOOL)commitPayload:(id)a3 forPlugin:(id)a4 allowAllCommits:(BOOL)a5 error:(id *)a6
{
  return 1;
}

- (void)startEditingPayload:(id)a3
{
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4
{
  id v5 = a3;
  id v7 = [(CKFunCameraViewController *)self delegate];
  id v6 = [(CKFunCameraViewController *)self conversation];
  [v7 startDeferredEditingPayload:v5 forConversation:v6];
}

- (void)dismiss
{
}

- (void)dismissAndPresentPhotosApp
{
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  LODWORD(v5) = a4;
  id v8 = a5;
  id v9 = a3;
  double v10 = [(CKFunCameraViewController *)self conversation];
  uint64_t v11 = [v10 recipientCount];

  if (v11) {
    uint64_t v5 = v5;
  }
  else {
    uint64_t v5 = 0;
  }
  id v12 = [(CKFunCameraViewController *)self delegate];
  [v12 stageAssetArchive:v9 skipShelf:v5 completionHandler:v8];
}

- (void)_dismissAndPresentPhotosApp:(BOOL)a3
{
  [(CKFunCameraViewController *)self setIsDismissing:1];
  uint64_t v5 = [(CKFunCameraViewController *)self funCameraAppViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CKFunCameraViewController *)self funCameraAppViewController];
    [v7 dropAssertion];
  }
  id v8 = [(CKFunCameraViewController *)self delegate];
  [v8 willDismissFunCamera:self];

  id v9 = [MEMORY[0x1E4F42738] sharedApplication];
  [v9 setIdleTimerDisabled:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CKFunCameraViewController__dismissAndPresentPhotosApp___block_invoke;
  v10[3] = &unk_1E5622A18;
  v10[4] = self;
  BOOL v11 = a3;
  [(CKFunCameraViewController *)self dismissViewControllerAnimated:1 completion:v10];
}

void __57__CKFunCameraViewController__dismissAndPresentPhotosApp___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsDismissing:0];
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 didDismissFunCamera:*(void *)(a1 + 32)];

  id v4 = [*(id *)(a1 + 32) funCameraAppViewController];
  if (objc_opt_respondsToSelector()) {
    [v4 killExtensionProcess];
  }
  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 presentPhotosApp];
  }
}

- (void)physicalCaptureNotifierDidChangeState:(id)a3
{
  uint64_t v4 = [a3 state];
  uint64_t v5 = [(CKFunCameraViewController *)self view];
  char v6 = [v5 window];
  int v7 = [v6 isKeyWindow];

  if (v7)
  {
    id v8 = [(CKFunCameraViewController *)self funCameraAppViewController];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(CKFunCameraViewController *)self funCameraAppViewController];
      [v10 volumeButtonPressed:v4 == 1];
    }
  }
}

- (CKFunCameraViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKFunCameraViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IMBalloonPlugin)balloonPlugin
{
  return self->_balloonPlugin;
}

- (void)setBalloonPlugin:(id)a3
{
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (UIView)funCameraView
{
  return self->_funCameraView;
}

- (void)setFunCameraView:(id)a3
{
}

- (CKBrowserViewControllerProtocol)funCameraAppViewController
{
  return self->_funCameraAppViewController;
}

- (void)setFunCameraAppViewController:(id)a3
{
}

- (CKCamPhysicalCaptureNotifier)physicalCaptureNotifier
{
  return self->_physicalCaptureNotifier;
}

- (void)setPhysicalCaptureNotifier:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_physicalCaptureNotifier, 0);
  objc_storeStrong((id *)&self->_funCameraAppViewController, 0);
  objc_storeStrong((id *)&self->_funCameraView, 0);
  objc_storeStrong((id *)&self->_balloonPlugin, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end