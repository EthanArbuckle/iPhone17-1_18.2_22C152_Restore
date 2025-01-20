@interface CKBrowserViewController
+ (BOOL)supportsMessagesAppExtendedLaunchTest;
+ (id)currentPPTTestName;
- (BOOL)_BOOLForApplePlistKey:(id)a3;
- (BOOL)inCompactPresentation;
- (BOOL)inExpandedPresentation;
- (BOOL)inFullScreenModalPresentation;
- (BOOL)isBusiness;
- (BOOL)isDismissing;
- (BOOL)isLoaded;
- (BOOL)isPrimaryViewController;
- (BOOL)isTransitioningToExpandedPresentation;
- (BOOL)isiMessage;
- (BOOL)linkedBeforeDawn;
- (BOOL)linkedBeforeYukon;
- (BOOL)mayBeKeptInViewHierarchy;
- (BOOL)shouldDisableInsetsForGrabber;
- (BOOL)shouldDisableSnapshotView;
- (BOOL)shouldShowChatChrome;
- (BOOL)shouldSuppressEntryView;
- (BOOL)supportsQuickView;
- (BOOL)wantsDarkUI;
- (BOOL)wantsOpaqueUI;
- (BOOL)wasExpandedPresentation;
- (CKBrowserDragManager)browserDragManager;
- (CKBrowserViewController)initWithBalloonPlugin:(id)a3;
- (CKBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4;
- (CKBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4 pluginPayloads:(id)a5;
- (CKBrowserViewController)initWithBalloonPlugin:(id)a3 pluginPayloads:(id)a4;
- (CKBrowserViewControllerSendDelegate)sendDelegate;
- (IMBalloonPlugin)balloonPlugin;
- (IMBalloonPluginDataSource)balloonPluginDataSource;
- (NSString)conversationID;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIView)dragTargetView;
- (UIViewController)presentationViewController;
- (id)photoBrowserSendDelegate;
- (int64_t)browserPresentationStyle;
- (int64_t)currentBrowserConsumer;
- (unint64_t)sheetDetentStyle;
- (void)_updateContentOverlayInsetsForSelfAndChildren;
- (void)dismiss;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)finishedPPTTestNamed:(id)a3;
- (void)finishedPPTTestNamed:(id)a3 isCKLaunchTest:(BOOL)a4;
- (void)loadView;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setBalloonPluginDataSource:(id)a3;
- (void)setBrowserDragManager:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setCurrentBrowserConsumer:(int64_t)a3;
- (void)setDragTargetView:(id)a3;
- (void)setIsBusiness:(BOOL)a3;
- (void)setIsPrimaryViewController:(BOOL)a3;
- (void)setIsTransitioningToExpandedPresentation:(BOOL)a3;
- (void)setIsiMessage:(BOOL)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setSendDelegate:(id)a3;
- (void)setShouldDisableSnapshotView:(BOOL)a3;
- (void)startPPTTestNamed:(id)a3;
- (void)tearDownRemoteViewIfNeeded;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidTransitionToExpandedPresentation;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToExpandedPresentation;
@end

@implementation CKBrowserViewController

- (void)_updateContentOverlayInsetsForSelfAndChildren
{
  v2.receiver = self;
  v2.super_class = (Class)CKBrowserViewController;
  [(CKBrowserViewController *)&v2 _updateContentOverlayInsetsForSelfAndChildren];
}

- (CKBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4 pluginPayloads:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CKBrowserViewController;
  v12 = [(CKBrowserViewController *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_balloonPlugin, a3);
    objc_storeStrong((id *)&v13->_balloonPluginDataSource, a4);
    v13->_isPrimaryViewController = 1;
    id location = 0;
    objc_initWeak(&location, v13);
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v15 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v16 = *MEMORY[0x1E4F6BAD8];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__CKBrowserViewController_initWithBalloonPlugin_dataSource_pluginPayloads___block_invoke;
    v19[3] = &unk_1E5628738;
    objc_copyWeak(&v20, &location);
    id v17 = (id)[v14 addObserverForName:v16 object:0 queue:v15 usingBlock:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __75__CKBrowserViewController_initWithBalloonPlugin_dataSource_pluginPayloads___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained tearDownRemoteViewIfNeeded];
}

- (CKBrowserViewController)initWithBalloonPlugin:(id)a3 pluginPayloads:(id)a4
{
  return [(CKBrowserViewController *)self initWithBalloonPlugin:a3 dataSource:0 pluginPayloads:a4];
}

- (CKBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  return [(CKBrowserViewController *)self initWithBalloonPlugin:a3 dataSource:a4 pluginPayloads:0];
}

- (CKBrowserViewController)initWithBalloonPlugin:(id)a3
{
  return [(CKBrowserViewController *)self initWithBalloonPlugin:a3 dataSource:0 pluginPayloads:0];
}

+ (BOOL)supportsMessagesAppExtendedLaunchTest
{
  return 0;
}

+ (id)currentPPTTestName
{
  return (id)__CurrentTestName;
}

- (void)tearDownRemoteViewIfNeeded
{
  v3 = [(CKBrowserViewController *)self balloonPlugin];
  v4 = [v3 appBundle];
  id v9 = [v4 bundleIdentifier];

  v5 = v9;
  if (v9)
  {
    v6 = IMSharedDowntimeController();
    char v7 = [v6 allowedToShowAppExtensionWithBundleIdentifier:v9];

    v5 = v9;
    if ((v7 & 1) == 0)
    {
      if (_IMWillLog())
      {
        id v8 = v9;
        _IMAlwaysLog();
      }
      [(CKBrowserViewController *)self forceTearDownRemoteView];
      v5 = v9;
    }
  }
}

- (void)finishedPPTTestNamed:(id)a3
{
}

- (void)startPPTTestNamed:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F42738];
  id v4 = a3;
  id v5 = [v3 sharedApplication];
  [v5 startedTest:v4];
}

- (void)finishedPPTTestNamed:(id)a3 isCKLaunchTest:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  v6 = [(id)objc_opt_class() currentPPTTestName];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v8 = [(CKBrowserViewController *)self balloonPlugin];
    id v9 = [v8 identifier];

    if ([v9 containsString:*MEMORY[0x1E4F6CBE8]])
    {
LABEL_11:

      goto LABEL_12;
    }
    id v10 = [(id)objc_opt_class() currentPPTTestName];
    if ([v10 rangeOfString:@"ExtensionLaunch"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = [MEMORY[0x1E4F42738] sharedApplication];
      v12 = v11;
      id v13 = v15;
    }
    else
    {
      int v14 = [(id)objc_opt_class() supportsMessagesAppExtendedLaunchTest];
      id v11 = [MEMORY[0x1E4F42738] sharedApplication];
      v12 = v11;
      if (v14 && v4)
      {
        [v11 finishedSubTest:@"PluginLaunchSubtest" forTest:v10];
LABEL_10:

        goto LABEL_11;
      }
      id v13 = v10;
    }
    [v11 finishedTest:v13 waitForCommit:1 extraResults:0 withTeardownBlock:0];
    goto LABEL_10;
  }
LABEL_12:
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKBrowserViewController;
  [(CKBrowserViewController *)&v3 viewWillAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKBrowserViewController;
  [(CKBrowserViewController *)&v8 viewWillDisappear:a3];
  BOOL v4 = [(CKBrowserViewController *)self balloonPlugin];
  id v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F6CBA0]];

  if (v6)
  {
    uint64_t v7 = [(CKBrowserViewController *)self sendDelegate];
    [v7 setLocalUserIsTyping:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKBrowserViewController;
  [(CKBrowserViewController *)&v8 viewDidAppear:a3];
  BOOL v4 = [(CKBrowserViewController *)self balloonPlugin];
  id v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F6CBA0]];

  if (v6)
  {
    uint64_t v7 = [(CKBrowserViewController *)self sendDelegate];
    [v7 setLocalUserIsTyping:1];
  }
  [(CKBrowserViewController *)self finishedPPTTestNamed:@"ExtensionLaunch" isCKLaunchTest:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKBrowserViewController;
  [(CKBrowserViewController *)&v3 viewDidDisappear:a3];
}

- (void)loadView
{
  v17.receiver = self;
  v17.super_class = (Class)CKBrowserViewController;
  [(CKBrowserViewController *)&v17 loadView];
  objc_super v3 = [(CKBrowserViewController *)self view];
  [v3 setOpaque:0];

  BOOL v4 = [(CKBrowserViewController *)self view];
  id v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 theme];
  uint64_t v7 = [v6 browserBackgroundColor];
  [v4 setBackgroundColor:v7];

  if ([(CKBrowserViewController *)self conformsToProtocol:&unk_1EE042668])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dragTargetView);

    if (!WeakRetained)
    {
      id v9 = [(CKBrowserViewController *)self view];
      objc_storeWeak((id *)&self->_dragTargetView, v9);
    }
    id v10 = [CKBrowserDragManager alloc];
    id v11 = objc_loadWeakRetained((id *)&self->_dragTargetView);
    v12 = [(CKBrowserDragManager *)v10 initWithTargetView:v11];
    browserDragManager = self->_browserDragManager;
    self->_browserDragManager = v12;

    [(CKBrowserDragManager *)self->_browserDragManager setDelegate:self];
    int v14 = self->_browserDragManager;
    id v15 = [(CKBrowserViewController *)self sendDelegate];
    uint64_t v16 = [v15 dragControllerTranscriptDelegate];
    [(CKBrowserDragManager *)v14 setTranscriptDelegate:v16];
  }
}

- (void)setDragTargetView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragTargetView);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dragTargetView, obj);
    int v6 = [(CKBrowserViewController *)self conformsToProtocol:&unk_1EE042668];
    id v5 = obj;
    if (v6)
    {
      uint64_t v7 = [CKBrowserDragManager alloc];
      id v8 = objc_loadWeakRetained((id *)&self->_dragTargetView);
      id v9 = [(CKBrowserDragManager *)v7 initWithTargetView:v8];
      browserDragManager = self->_browserDragManager;
      self->_browserDragManager = v9;

      [(CKBrowserDragManager *)self->_browserDragManager setDelegate:self];
      id v11 = self->_browserDragManager;
      v12 = [(CKBrowserViewController *)self sendDelegate];
      id v13 = [v12 dragControllerTranscriptDelegate];
      [(CKBrowserDragManager *)v11 setTranscriptDelegate:v13];

      id v5 = obj;
    }
  }
}

- (void)setSendDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sendDelegate, a3);
  browserDragManager = self->_browserDragManager;
  id v6 = [(CKBrowserViewController *)self sendDelegate];
  id v5 = [v6 dragControllerTranscriptDelegate];
  [(CKBrowserDragManager *)browserDragManager setTranscriptDelegate:v5];
}

- (int64_t)browserPresentationStyle
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  if ([(CKBrowserViewController *)self shouldPresentModally]) {
    return 2;
  }
  return 0;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  if (a4) {
    *a4 = 0;
  }
  double v5 = *MEMORY[0x1E4F437F8];
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  int v9 = CKIsRunningInMacCatalyst();
  char v10 = CKIsSendMenuEnabled();
  id v11 = [(CKBrowserViewController *)self balloonPlugin];
  int v12 = [v11 shouldHideAppSwitcher];

  if ((v10 & 1) == 0
    && !v9
    && ((![(CKBrowserViewController *)self inCompactPresentation] | v12) & 1) == 0)
  {
    id v13 = +[CKUIBehavior sharedBehaviors];
    [v13 browserSwitcherExpandThreshold];
    double v8 = v8 + v14;

    id v15 = [(CKBrowserViewController *)self view];
    [v15 safeAreaInsets];
    double v17 = v16;

    if (v17 == 0.0)
    {
      v18 = [(CKBrowserViewController *)self view];
      v19 = [v18 window];
      [v19 safeAreaInsets];
      double v8 = v8 + v20;
    }
  }
  double v21 = v5;
  double v22 = v6;
  double v23 = v8;
  double v24 = v7;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(CKBrowserViewController *)self browserPresentationStyle]
    || CKIsRunningInMacCatalyst())
  {
    v12.receiver = self;
    v12.super_class = (Class)CKBrowserViewController;
    [(CKBrowserViewController *)&v12 presentViewController:v8 animated:v6 completion:v9];
  }
  else
  {
    char v10 = [(CKBrowserViewController *)self presentationViewController];

    if (v10)
    {
      id v11 = [(CKBrowserViewController *)self presentationViewController];
      [v11 presentViewController:v8 animated:v6 completion:v9];
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(CKBrowserViewController *)self browserPresentationStyle])
  {
    -[CKBrowserViewController dismissViewControllerAnimated:completion:](&v9, sel_dismissViewControllerAnimated_completion_, v4, v6, self, CKBrowserViewController, v10.receiver, v10.super_class);
  }
  else
  {
    double v7 = [(CKBrowserViewController *)self presentationViewController];

    if (v7)
    {
      id v8 = [(CKBrowserViewController *)self presentationViewController];
      [v8 dismissViewControllerAnimated:v4 completion:v6];
    }
    else
    {
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      -[CKBrowserViewController dismissViewControllerAnimated:completion:](&v10, sel_dismissViewControllerAnimated_completion_, v4, v6, v9.receiver, v9.super_class, self, CKBrowserViewController);
    }
  }
}

- (void)dismiss
{
  id v2 = [(CKBrowserViewController *)self sendDelegate];
  [v2 startEditingPayload:0];
}

- (BOOL)isLoaded
{
  return 1;
}

- (BOOL)inCompactPresentation
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && [(CKBrowserViewController *)self currentBrowserConsumer] == 1;
}

- (BOOL)inExpandedPresentation
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && [(CKBrowserViewController *)self currentBrowserConsumer] == 2;
}

- (BOOL)inFullScreenModalPresentation
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && [(CKBrowserViewController *)self currentBrowserConsumer] == 3;
}

- (BOOL)wasExpandedPresentation
{
  return self->_previousConsumer == 2;
}

- (void)setCurrentBrowserConsumer:(int64_t)a3
{
  if (self->_currentBrowserConsumer != a3)
  {
    if ((unint64_t)(a3 - 1) <= 1) {
      self->_previousConsumer = a3;
    }
    self->_currentBrowserConsumer = a3;
  }
}

- (void)viewWillTransitionToExpandedPresentation
{
}

- (void)viewDidTransitionToExpandedPresentation
{
}

- (BOOL)wantsOpaqueUI
{
  return 0;
}

- (BOOL)wantsDarkUI
{
  return 0;
}

- (BOOL)isDismissing
{
  return 0;
}

- (BOOL)shouldShowChatChrome
{
  return 0;
}

- (BOOL)supportsQuickView
{
  return 0;
}

- (BOOL)shouldSuppressEntryView
{
  return 0;
}

- (BOOL)shouldDisableInsetsForGrabber
{
  if (shouldDisableInsetsForGrabber_onceToken != -1) {
    dispatch_once(&shouldDisableInsetsForGrabber_onceToken, &__block_literal_global_138);
  }
  if (shouldDisableInsetsForGrabber_override)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    objc_super v3 = [(CKBrowserViewController *)self balloonPlugin];
    BOOL v4 = [v3 appBundle];
    double v5 = [v4 bundleIdentifier];

    if (!v5)
    {
      id v6 = [v3 identifier];
      char v7 = [v6 isEqualToString:*MEMORY[0x1E4F6CBE8]];

      if (v7)
      {
        double v5 = 0;
      }
      else
      {
        double v5 = [v3 identifier];
      }
    }
    if ([v5 hasPrefix:@"com.apple."]) {
      LOBYTE(self) = [(CKBrowserViewController *)self _BOOLForApplePlistKey:@"MSMessagesOverlayAppearanceDisableInsetsForGrabber"];
    }
    else {
      LODWORD(self) = ![(CKBrowserViewController *)self linkedBeforeDawn];
    }
  }
  return (char)self;
}

uint64_t __56__CKBrowserViewController_shouldDisableInsetsForGrabber__block_invoke()
{
  uint64_t result = IMGetDomainBoolForKey();
  shouldDisableInsetsForGrabber_override = result;
  return result;
}

- (BOOL)_BOOLForApplePlistKey:(id)a3
{
  id v4 = a3;
  double v5 = [(CKBrowserViewController *)self balloonPlugin];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 proxy], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = [v5 proxy];
    id v8 = [v7 objectForInfoDictionaryKey:v4 ofClass:objc_opt_class() inScope:2];
  }
  else
  {
    objc_super v9 = [(CKBrowserViewController *)self balloonPlugin];
    objc_super v10 = [v9 appBundle];
    id v11 = v10;
    if (v10)
    {
      id v7 = v10;
    }
    else
    {
      objc_super v12 = [(CKBrowserViewController *)self balloonPlugin];
      id v7 = [v12 pluginBundle];
    }
    id v13 = [v7 objectForInfoDictionaryKey:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v14 = v13;
    }
    else {
      double v14 = 0;
    }
    id v8 = v14;
  }
  if (v8) {
    char v15 = [v8 BOOLValue];
  }
  else {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)linkedBeforeDawn
{
  id v2 = [(CKBrowserViewController *)self balloonPlugin];
  char v3 = [v2 linkedBeforeSDKVersion:@"17.0"];

  return v3;
}

- (BOOL)linkedBeforeYukon
{
  id v2 = [(CKBrowserViewController *)self balloonPlugin];
  char v3 = [v2 linkedBeforeSDKVersion:@"13.0"];

  return v3;
}

- (unint64_t)sheetDetentStyle
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  unint64_t v3 = [v2 browserViewControllerSheetDetentStyle];

  return v3;
}

- (BOOL)mayBeKeptInViewHierarchy
{
  return 1;
}

- (CKBrowserViewControllerSendDelegate)sendDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sendDelegate);

  return (CKBrowserViewControllerSendDelegate *)WeakRetained;
}

- (IMBalloonPlugin)balloonPlugin
{
  return self->_balloonPlugin;
}

- (BOOL)isiMessage
{
  return self->_isiMessage;
}

- (void)setIsiMessage:(BOOL)a3
{
  self->_isiMessage = a3;
}

- (BOOL)isBusiness
{
  return self->_isBusiness;
}

- (void)setIsBusiness:(BOOL)a3
{
  self->_isBusiness = a3;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  self->_conversationID = (NSString *)a3;
}

- (IMBalloonPluginDataSource)balloonPluginDataSource
{
  return self->_balloonPluginDataSource;
}

- (void)setBalloonPluginDataSource:(id)a3
{
}

- (UIViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (void)setPresentationViewController:(id)a3
{
}

- (int64_t)currentBrowserConsumer
{
  return self->_currentBrowserConsumer;
}

- (BOOL)isPrimaryViewController
{
  return self->_isPrimaryViewController;
}

- (void)setIsPrimaryViewController:(BOOL)a3
{
  self->_isPrimaryViewController = a3;
}

- (BOOL)shouldDisableSnapshotView
{
  return self->_shouldDisableSnapshotView;
}

- (void)setShouldDisableSnapshotView:(BOOL)a3
{
  self->_shouldDisableSnapshotView = a3;
}

- (UIView)dragTargetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragTargetView);

  return (UIView *)WeakRetained;
}

- (CKBrowserDragManager)browserDragManager
{
  return self->_browserDragManager;
}

- (void)setBrowserDragManager:(id)a3
{
}

- (BOOL)isTransitioningToExpandedPresentation
{
  return self->_isTransitioningToExpandedPresentation;
}

- (void)setIsTransitioningToExpandedPresentation:(BOOL)a3
{
  self->_isTransitioningToExpandedPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserDragManager, 0);
  objc_destroyWeak((id *)&self->_dragTargetView);
  objc_storeStrong((id *)&self->_presentationViewController, 0);
  objc_storeStrong((id *)&self->_balloonPluginDataSource, 0);
  objc_storeStrong((id *)&self->_balloonPlugin, 0);

  objc_destroyWeak((id *)&self->_sendDelegate);
}

- (id)photoBrowserSendDelegate
{
  unint64_t v3 = [(CKBrowserViewController *)self sendDelegate];
  int v4 = [v3 conformsToProtocol:&unk_1EE050BB0];

  if (v4)
  {
    double v5 = [(CKBrowserViewController *)self sendDelegate];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

@end