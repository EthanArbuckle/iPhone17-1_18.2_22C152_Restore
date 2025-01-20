@interface HWCKBrowserViewController
+ (BOOL)supportsMessagesAppExtendedLaunchTest;
- (BOOL)inCompactPresentation;
- (BOOL)inExpandedPresentation;
- (BOOL)inFullScreenModalPresentation;
- (BOOL)isDismissing;
- (BOOL)isLoaded;
- (BOOL)isPrimaryViewController;
- (BOOL)isTransitioningToExpandedPresentation;
- (BOOL)isiMessage;
- (BOOL)mayBeKeptInViewHierarchy;
- (BOOL)shouldShowChatChrome;
- (BOOL)shouldSuppressEntryView;
- (BOOL)supportsQuickView;
- (BOOL)wantsDarkUI;
- (BOOL)wantsOpaqueUI;
- (BOOL)wasExpandedPresentation;
- (CKBrowserDragManager)browserDragManager;
- (CKBrowserViewControllerSendDelegate)sendDelegate;
- (HWCKBrowserViewController)initWithBalloonPlugin:(id)a3;
- (HWCKBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4;
- (IMBalloonPlugin)balloonPlugin;
- (IMBalloonPluginDataSource)balloonPluginDataSource;
- (NSString)conversationID;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIView)dragTargetView;
- (UIViewController)presentationViewController;
- (int64_t)browserPresentationStyle;
- (int64_t)currentBrowserConsumer;
- (void)dismiss;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setBalloonPluginDataSource:(id)a3;
- (void)setBrowserDragManager:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setCurrentBrowserConsumer:(int64_t)a3;
- (void)setDragTargetView:(id)a3;
- (void)setIsPrimaryViewController:(BOOL)a3;
- (void)setIsTransitioningToExpandedPresentation:(BOOL)a3;
- (void)setIsiMessage:(BOOL)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setSendDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidTransitionToExpandedPresentation;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToExpandedPresentation;
@end

@implementation HWCKBrowserViewController

- (HWCKBrowserViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  id v7 = a4;
  v8 = [(HWCKBrowserViewController *)self initWithBalloonPlugin:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_balloonPluginDataSource, a4);
  }

  return v9;
}

- (HWCKBrowserViewController)initWithBalloonPlugin:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HWCKBrowserViewController;
  v6 = [(HWCKBrowserViewController *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_balloonPlugin, a3);
    v7->_isPrimaryViewController = 1;
  }

  return v7;
}

+ (BOOL)supportsMessagesAppExtendedLaunchTest
{
  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HWCKBrowserViewController;
  [(HWCKBrowserViewController *)&v8 viewWillDisappear:a3];
  v4 = [(HWCKBrowserViewController *)self balloonPlugin];
  id v5 = [v4 identifier];
  unsigned int v6 = [v5 isEqualToString:IMBalloonPluginIdentifierDT];

  if (v6)
  {
    id v7 = [(HWCKBrowserViewController *)self sendDelegate];
    [v7 setLocalUserIsTyping:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HWCKBrowserViewController;
  [(HWCKBrowserViewController *)&v8 viewDidAppear:a3];
  v4 = [(HWCKBrowserViewController *)self balloonPlugin];
  id v5 = [v4 identifier];
  unsigned int v6 = [v5 isEqualToString:IMBalloonPluginIdentifierDT];

  if (v6)
  {
    id v7 = [(HWCKBrowserViewController *)self sendDelegate];
    [v7 setLocalUserIsTyping:1];
  }
}

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)HWCKBrowserViewController;
  [(HWCKBrowserViewController *)&v15 loadView];
  v3 = [(HWCKBrowserViewController *)self view];
  [v3 setOpaque:0];

  v4 = [(HWCKBrowserViewController *)self view];
  id v5 = [sub_11838() sharedBehaviors];
  unsigned int v6 = [v5 theme];
  id v7 = [v6 browserBackgroundColor];
  [v4 setBackgroundColor:v7];

  if ([(HWCKBrowserViewController *)self conformsToProtocol:&OBJC_PROTOCOL___CKBrowserDragControllerDelegate])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dragTargetView);
    if (!WeakRetained)
    {
      objc_super v9 = [(HWCKBrowserViewController *)self view];
      objc_storeWeak((id *)&self->_dragTargetView, v9);

      id WeakRetained = objc_loadWeakRetained((id *)&self->_dragTargetView);
    }
    v10 = (CKBrowserDragManager *)[objc_alloc((Class)sub_1191C()) initWithTargetView:WeakRetained];
    browserDragManager = self->_browserDragManager;
    self->_browserDragManager = v10;

    [(CKBrowserDragManager *)self->_browserDragManager setDelegate:self];
    v12 = self->_browserDragManager;
    v13 = [(HWCKBrowserViewController *)self sendDelegate];
    v14 = [v13 dragControllerTranscriptDelegate];
    [(CKBrowserDragManager *)v12 setTranscriptDelegate:v14];
  }
}

- (void)setDragTargetView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragTargetView);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dragTargetView, obj);
    if ([(HWCKBrowserViewController *)self conformsToProtocol:&OBJC_PROTOCOL___CKBrowserDragControllerDelegate])
    {
      id v5 = (CKBrowserDragManager *)[objc_alloc((Class)sub_1191C()) initWithTargetView:obj];
      browserDragManager = self->_browserDragManager;
      self->_browserDragManager = v5;

      [(CKBrowserDragManager *)self->_browserDragManager setDelegate:self];
      id v7 = self->_browserDragManager;
      objc_super v8 = [(HWCKBrowserViewController *)self sendDelegate];
      objc_super v9 = [v8 dragControllerTranscriptDelegate];
      [(CKBrowserDragManager *)v7 setTranscriptDelegate:v9];
    }
  }
}

- (void)setSendDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sendDelegate, a3);
  browserDragManager = self->_browserDragManager;
  id v6 = [(HWCKBrowserViewController *)self sendDelegate];
  id v5 = [v6 dragControllerTranscriptDelegate];
  [(CKBrowserDragManager *)browserDragManager setTranscriptDelegate:v5];
}

- (int64_t)browserPresentationStyle
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  if ([(HWCKBrowserViewController *)self shouldPresentModally]) {
    return 2;
  }
  return 0;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  if (a4) {
    *a4 = 0;
  }
  CGFloat left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  CGFloat right = UIEdgeInsetsZero.right;
  objc_super v8 = [(HWCKBrowserViewController *)self balloonPlugin];
  if ([v8 shouldHideAppSwitcher]) {
    goto LABEL_7;
  }
  unsigned int v9 = [(HWCKBrowserViewController *)self inCompactPresentation];

  if (v9)
  {
    v10 = [sub_11838() sharedBehaviors];
    [v10 browserSwitcherExpandThreshold];
    double bottom = bottom + v11;

    v12 = [(HWCKBrowserViewController *)self view];
    [v12 safeAreaInsets];
    double v14 = v13;

    if (v14 == 0.0)
    {
      objc_super v8 = [(HWCKBrowserViewController *)self view];
      objc_super v15 = [v8 window];
      [v15 safeAreaInsets];
      double bottom = bottom + v16;

LABEL_7:
    }
  }
  double top = UIEdgeInsetsZero.top;
  double v18 = left;
  double v19 = bottom;
  double v20 = right;
  result.CGFloat right = v20;
  result.double bottom = v19;
  result.CGFloat left = v18;
  result.double top = top;
  return result;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(HWCKBrowserViewController *)self browserPresentationStyle])
  {
    v12.receiver = self;
    v12.super_class = (Class)HWCKBrowserViewController;
    [(HWCKBrowserViewController *)&v12 presentViewController:v8 animated:v6 completion:v9];
  }
  else
  {
    v10 = [(HWCKBrowserViewController *)self presentationViewController];

    if (v10)
    {
      double v11 = [(HWCKBrowserViewController *)self presentationViewController];
      [v11 presentViewController:v8 animated:v6 completion:v9];
    }
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(HWCKBrowserViewController *)self browserPresentationStyle])
  {
    v9.receiver = self;
    v9.super_class = (Class)HWCKBrowserViewController;
    [(HWCKBrowserViewController *)&v9 dismissViewControllerAnimated:v4 completion:v6];
  }
  else
  {
    id v7 = [(HWCKBrowserViewController *)self presentationViewController];

    if (v7)
    {
      id v8 = [(HWCKBrowserViewController *)self presentationViewController];
      [v8 dismissViewControllerAnimated:v4 completion:v6];
    }
  }
}

- (void)dismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sendDelegate);
  if ([WeakRetained handwritingIsDisplayed])
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x2020000000;
    v3 = (void (*)(void))off_33650;
    id v8 = off_33650;
    if (!off_33650)
    {
      BOOL v4 = (void *)sub_1236C();
      v6[3] = (uint64_t)dlsym(v4, "CKSetHandwritingShouldBeAutoDisplayed");
      off_33650 = (_UNKNOWN *)v6[3];
      v3 = (void (*)(void))v6[3];
    }
    _Block_object_dispose(&v5, 8);
    if (!v3) {
      sub_165DC();
    }
    v3(0);
  }
  [WeakRetained startEditingPayload:0];
}

- (BOOL)isLoaded
{
  return 1;
}

- (BOOL)inCompactPresentation
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && (char *)[(HWCKBrowserViewController *)self currentBrowserConsumer] == (char *)&dword_0 + 1;
}

- (BOOL)inExpandedPresentation
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && (char *)[(HWCKBrowserViewController *)self currentBrowserConsumer] == (char *)&dword_0 + 2;
}

- (BOOL)inFullScreenModalPresentation
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && (char *)[(HWCKBrowserViewController *)self currentBrowserConsumer] == (char *)&dword_0 + 3;
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

- (BOOL)isDismissing
{
  return self->_dismissing;
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

@end