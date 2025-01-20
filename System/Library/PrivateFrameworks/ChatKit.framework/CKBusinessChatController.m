@interface CKBusinessChatController
- (BOOL)canShowBusinessOnboarding;
- (BOOL)shouldListParticipantsInTitle;
- (CKNavbarCanvasViewController)navbarCanvasViewController;
- (int64_t)preferredStatusBarStyle;
- (void)_handleAddressBookChangedNotification:(id)a3;
- (void)_updateNavigationUI;
- (void)cleanUpBizNavBarIfNecessary;
- (void)loadView;
- (void)setNavbarCanvasViewController:(id)a3;
- (void)setupBizNavBarIfNecessary;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKBusinessChatController

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CKBusinessChatController;
  [(CKChatController *)&v3 loadView];
  [(CKBusinessChatController *)self setupBizNavBarIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKBusinessChatController;
  [(CKChatController *)&v4 viewWillDisappear:a3];
  [(CKBusinessChatController *)self cleanUpBizNavBarIfNecessary];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKBusinessChatController;
  [(CKChatController *)&v3 viewDidLayoutSubviews];
  [(CKBusinessChatController *)self setupBizNavBarIfNecessary];
}

- (int64_t)preferredStatusBarStyle
{
  objc_super v3 = +[CKUIBehavior sharedBehaviors];
  objc_super v4 = [v3 theme];
  v5 = [(CKCoreChatController *)self conversation];
  v6 = [v5 chat];
  int64_t v7 = [v4 statusBarStyleForBusinessChat:v6];

  return v7;
}

- (void)_handleAddressBookChangedNotification:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKBusinessChatController;
  [(CKChatController *)&v4 _handleAddressBookChangedNotification:a3];
  [(CKBusinessChatController *)self setupBizNavBarIfNecessary];
}

- (void)setupBizNavBarIfNecessary
{
  objc_super v3 = [(CKCoreChatController *)self conversation];
  objc_super v4 = [v3 chat];

  if (v4)
  {
    v5 = [(CKBusinessChatController *)self navbarCanvasViewController];
    v6 = [v5 view];
    int64_t v7 = +[CKUIBehavior sharedBehaviors];
    v8 = [v7 theme];
    v9 = [(CKCoreChatController *)self conversation];
    v10 = [v9 chat];
    v11 = [v8 secondaryBrandColorForBusinessChat:v10];
    [v6 setTintColor:v11];

    v12 = [(CKBusinessChatController *)self navbarCanvasViewController];
    v13 = [v12 conversationIdentityView];
    v14 = +[CKUIBehavior sharedBehaviors];
    v15 = [v14 theme];
    v16 = [(CKCoreChatController *)self conversation];
    v17 = [v16 chat];
    objc_msgSend(v13, "setStyle:", objc_msgSend(v15, "navBarTextStyleForBusinessChat:", v17));

    v18 = [(CKBusinessChatController *)self navbarCanvasViewController];
    [v18 updateDefaultLabelIfNecessary];

    v19 = [(CKBusinessChatController *)self navigationController];
    v20 = [v19 navigationBar];
    v21 = [(CKCoreChatController *)self conversation];
    v22 = [v21 chat];
    [v20 enableBranding:1 forBusinessChat:v22];

    [(CKBusinessChatController *)self setNeedsStatusBarAppearanceUpdate];
  }
}

- (void)_updateNavigationUI
{
  v3.receiver = self;
  v3.super_class = (Class)CKBusinessChatController;
  [(CKChatController *)&v3 _updateNavigationUI];
  [(CKBusinessChatController *)self setupBizNavBarIfNecessary];
}

- (void)cleanUpBizNavBarIfNecessary
{
  objc_super v3 = [(CKCoreChatController *)self conversation];
  objc_super v4 = [v3 chat];

  if (v4)
  {
    v5 = [(CKBusinessChatController *)self navbarCanvasViewController];
    v6 = [v5 view];
    [v6 setTintColor:0];

    int64_t v7 = [(CKBusinessChatController *)self navbarCanvasViewController];
    v8 = [v7 conversationIdentityView];
    [v8 setStyle:4];

    v9 = [(CKBusinessChatController *)self navigationController];
    v10 = [v9 navigationBar];
    v11 = [(CKCoreChatController *)self conversation];
    v12 = [v11 chat];
    [v10 enableBranding:0 forBusinessChat:v12];

    [(CKBusinessChatController *)self setNeedsStatusBarAppearanceUpdate];
  }
}

- (BOOL)shouldListParticipantsInTitle
{
  return 0;
}

- (BOOL)canShowBusinessOnboarding
{
  v2 = [(CKCoreChatController *)self conversation];
  char v3 = [v2 isChatBot] ^ 1;

  return v3;
}

- (CKNavbarCanvasViewController)navbarCanvasViewController
{
  return self->_navbarCanvasViewController;
}

- (void)setNavbarCanvasViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end