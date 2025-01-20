@interface StickersMessagesViewController
- (AVTAvatarEditorViewController)editorViewController;
- (AVTAvatarStore)avatarStore;
- (AVTStickerViewController)stickerController;
- (AVTUsageTrackingSession)usageTrackingSession;
- (BOOL)allowsEditing;
- (BOOL)isFromKeyboard;
- (BOOL)shouldAllowUserActionOnSticker:(id)a3;
- (BOOL)shouldPresentEditorFromKeyboardSplashScreen;
- (BOOL)shouldShowDisclosureWarning;
- (NSArray)constraints;
- (StickersParentMessagesViewController)delegate;
- (void)addStickerViewToHiearchyIfNeeded;
- (void)dismissAvatarUIControllerAnimated:(BOOL)a3;
- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4;
- (void)setAvatarStore:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditorViewController:(id)a3;
- (void)setShouldShowDisclosureWarning:(BOOL)a3;
- (void)setStickerController:(id)a3;
- (void)setUsageTrackingSession:(id)a3;
- (void)setupStickerView;
- (void)showEditorViewControllerFromKeyboardSplashScreen;
- (void)strongPopupPresentationNotification:(id)a3;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)updateWithPresentationContext:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation StickersMessagesViewController

- (void)updateWithPresentationContext:(unint64_t)a3
{
  self->_isFromKeyboard = a3 == 2;
  self->_allowsEditing = a3 != 1;
  v4 = [(StickersMessagesViewController *)self stickerController];

  if (v4)
  {
    id v5 = [(StickersMessagesViewController *)self stickerController];
    [v5 setAllowEditing:self->_allowsEditing];
  }
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)StickersMessagesViewController;
  [(StickersMessagesViewController *)&v9 viewDidLoad];
  [(StickersMessagesViewController *)self updateWithPresentationContext:[(StickersMessagesViewController *)self presentationContext]];
  v3 = +[AVTUIColorRepository appBackgroundColor];
  v4 = [(StickersMessagesViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(StickersMessagesViewController *)self setShouldShowDisclosureWarning:AVTUIStickersShowDisclosureWarning()];
  id v5 = objc_alloc_init((Class)AVTAvatarStore);
  [(StickersMessagesViewController *)self setAvatarStore:v5];

  v6 = +[AVTUIControllerPresentation pendingGlobalPresentation];

  if (!v6)
  {
    [(StickersMessagesViewController *)self setupStickerView];
    v7 = [(StickersMessagesViewController *)self stickerController];
    v8 = [v7 view];
    [v8 setAlpha:0.0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)StickersMessagesViewController;
  [(StickersMessagesViewController *)&v5 viewDidAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"strongPopupPresentationNotification:" name:@"BaseMessagesViewControllerStrongPopupPresentationNotification" object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)StickersMessagesViewController;
  [(StickersMessagesViewController *)&v8 viewWillAppear:a3];
  v4 = [(StickersMessagesViewController *)self usageTrackingSession];

  if (!v4)
  {
    objc_super v5 = +[AVTUsageTracker currentSession];
    [(StickersMessagesViewController *)self setUsageTrackingSession:v5];
  }
  v6 = [(StickersMessagesViewController *)self usageTrackingSession];
  v7 = [(StickersMessagesViewController *)self avatarStore];
  [v6 beginWithStore:v7];

  [(StickersMessagesViewController *)self addStickerViewToHiearchyIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)StickersMessagesViewController;
  [(StickersMessagesViewController *)&v6 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"BaseMessagesViewControllerStrongPopupPresentationNotification" object:0];

  objc_super v5 = [(StickersMessagesViewController *)self usageTrackingSession];
  [v5 end];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)StickersMessagesViewController;
  [(StickersMessagesViewController *)&v5 viewDidDisappear:a3];
  v4 = [(StickersMessagesViewController *)self stickerController];
  [v4 removeFromParentViewController];
}

- (void)addStickerViewToHiearchyIfNeeded
{
  uint64_t v3 = [(StickersMessagesViewController *)self stickerController];
  if (v3)
  {
    id v11 = (id)v3;
    v4 = [(StickersMessagesViewController *)self stickerController];
    objc_super v5 = [v4 parentViewController];
    if (v5)
    {
    }
    else
    {
      id v6 = [(StickersMessagesViewController *)self presentationStyle];

      if (v6 == (id)3) {
        return;
      }
      v7 = [(StickersMessagesViewController *)self stickerController];
      [(StickersMessagesViewController *)self addChildViewController:v7];

      objc_super v8 = [(StickersMessagesViewController *)self stickerController];
      id v11 = [v8 view];

      objc_super v9 = [(StickersMessagesViewController *)self view];
      [v9 bounds];
      [v11 setFrame:];

      [v11 setAutoresizingMask:18];
      v10 = [(StickersMessagesViewController *)self view];
      [v10 addSubview:v11];

      v4 = [(StickersMessagesViewController *)self stickerController];
      [v4 didMoveToParentViewController:self];
    }
  }
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v4 = [(StickersMessagesViewController *)self usageTrackingSession];
    [v4 didShowExpandedMode];
  }
}

- (BOOL)shouldPresentEditorFromKeyboardSplashScreen
{
  if (![(StickersMessagesViewController *)self isFromKeyboard]
    || [(StickersMessagesViewController *)self presentationStyle] != (id)3)
  {
    return 0;
  }
  uint64_t v3 = +[AVTUIControllerPresentation pendingGlobalPresentation];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)StickersMessagesViewController;
  [(StickersMessagesViewController *)&v8 willBecomeActiveWithConversation:a3];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(StickersMessagesViewController *)self presentationContext];
    id v5 = [(StickersMessagesViewController *)self presentationStyle];
    *(_DWORD *)buf = 134218240;
    id v10 = v4;
    __int16 v11 = 2048;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[StickersView] willBecomeActiveWithConversation context:%lu style:%lu", buf, 0x16u);
  }
  +[STDynamicActivityAttributionPublisher setCurrentAttributionKey:0 andApp:@"com.apple.Animoji.StickersApp"];
  [(StickersMessagesViewController *)self updateWithPresentationContext:[(StickersMessagesViewController *)self presentationContext]];
  if ([(StickersMessagesViewController *)self shouldPresentEditorFromKeyboardSplashScreen])
  {
    [(StickersMessagesViewController *)self showEditorViewControllerFromKeyboardSplashScreen];
  }
  else
  {
    id v6 = [(StickersMessagesViewController *)self stickerController];
    v7 = [v6 view];
    [v7 setAlpha:1.0];
  }
}

- (void)setupStickerView
{
  uint64_t v3 = [(StickersMessagesViewController *)self avatarStore];
  id v4 = +[AVTStickerViewController stickerViewControllerForStore:v3 allowEditing:[(StickersMessagesViewController *)self allowsEditing] allowPeel:1];
  [(StickersMessagesViewController *)self setStickerController:v4];

  id v5 = [(StickersMessagesViewController *)self stickerController];
  [v5 setDisclosureValidationDelegate:self];

  id v6 = [(StickersMessagesViewController *)self stickerController];
  [v6 setPresenterDelegate:self];

  [(StickersMessagesViewController *)self addStickerViewToHiearchyIfNeeded];
}

- (void)showEditorViewControllerFromKeyboardSplashScreen
{
  uint64_t v3 = [(StickersMessagesViewController *)self stickerController];

  if (v3)
  {
    id v4 = [(StickersMessagesViewController *)self stickerController];
    [v4 removeFromParentViewController];

    id v5 = [(StickersMessagesViewController *)self stickerController];
    id v6 = [v5 view];
    [v6 removeFromSuperview];

    [(StickersMessagesViewController *)self setStickerController:0];
  }
  v7 = [(StickersMessagesViewController *)self avatarStore];
  id v13 = +[AVTAvatarEditorViewController viewControllerForCreatingAvatarInStore:v7];

  [v13 setDelegate:self];
  id v8 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v13];
  [(StickersMessagesViewController *)self addChildViewController:v8];
  objc_super v9 = [(StickersMessagesViewController *)self view];
  id v10 = [v8 view];
  [v9 addSubview:v10];

  [v8 didMoveToParentViewController:self];
  [(StickersMessagesViewController *)self setEditorViewController:v13];
  __int16 v11 = [(StickersMessagesViewController *)self delegate];

  if (v11)
  {
    id v12 = [(StickersMessagesViewController *)self delegate];
    [v12 didPresentEditorViewController];
  }
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(StickersMessagesViewController *)self view];
  [v5 bounds];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  id v10 = [(StickersMessagesViewController *)self stickerController];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000667C;
  v12[3] = &unk_10000C450;
  uint64_t v14 = v7;
  uint64_t v15 = v9;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [v10 snapshotInBlock:v12];
}

- (BOOL)shouldAllowUserActionOnSticker:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(StickersMessagesViewController *)self shouldShowDisclosureWarning];
  if (v5)
  {
    uint64_t v6 = +[AVTAlertController alertControllerWithTitle:@"Animoji Disclosure" message:@"Are you sure every person in this conversation is disclosed on Memoji Stickers?" preferredStyle:1];
    objc_initWeak(&location, self);
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    uint64_t v15 = sub_100006984;
    v16 = &unk_10000C478;
    objc_copyWeak(&v17, &location);
    uint64_t v7 = +[UIAlertAction actionWithTitle:@"Yes" style:0 handler:&v13];
    [v6 addAction:v7, v13, v14, v15, v16];

    uint64_t v8 = +[UIAlertAction actionWithTitle:@"No" style:1 handler:0];
    [v6 addAction:v8];

    [v6 _setShouldAlignToKeyboard:0];
    uint64_t v9 = [(StickersMessagesViewController *)self view];
    id v10 = [v9 window];
    id v11 = [v10 rootViewController];
    [v11 presentViewController:v6 animated:0 completion:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v5 ^ 1;
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  +[AVTUIControllerPresentation setPendingGlobalPresentation:](AVTUIControllerPresentation, "setPendingGlobalPresentation:", a3, a4);

  [(StickersMessagesViewController *)self requestPresentationStyle:3];
}

- (void)dismissAvatarUIControllerAnimated:(BOOL)a3
{
  uint64_t v3 = +[AVTUIControllerPresentation pendingGlobalPresentation];
  id v4 = [v3 modalMessagesController];
  [v4 dismiss];

  +[AVTUIControllerPresentation setPendingGlobalPresentation:0];
}

- (void)strongPopupPresentationNotification:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned int v5 = [v4 objectForKeyedSubscript:@"BaseMessagesViewControllerStrongPopupPresentedKey"];
  unsigned int v6 = [v5 BOOLValue];

  uint64_t v7 = [(StickersMessagesViewController *)self stickerController];

  if (v7)
  {
    uint64_t v8 = [(StickersMessagesViewController *)self stickerController];
    id v9 = v8;
    if (v6) {
      [v8 stickerControllerDidEnterBackground];
    }
    else {
      [v8 stickerControllerWillEnterForeground];
    }
  }
}

- (AVTAvatarEditorViewController)editorViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editorViewController);

  return (AVTAvatarEditorViewController *)WeakRetained;
}

- (void)setEditorViewController:(id)a3
{
}

- (StickersParentMessagesViewController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (StickersParentMessagesViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isFromKeyboard
{
  return self->_isFromKeyboard;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (AVTStickerViewController)stickerController
{
  return self->_stickerController;
}

- (void)setStickerController:(id)a3
{
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (void)setAvatarStore:(id)a3
{
}

- (AVTUsageTrackingSession)usageTrackingSession
{
  return self->_usageTrackingSession;
}

- (void)setUsageTrackingSession:(id)a3
{
}

- (BOOL)shouldShowDisclosureWarning
{
  return self->_shouldShowDisclosureWarning;
}

- (void)setShouldShowDisclosureWarning:(BOOL)a3
{
  self->_shouldShowDisclosureWarning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageTrackingSession, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_stickerController, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_editorViewController);
}

@end