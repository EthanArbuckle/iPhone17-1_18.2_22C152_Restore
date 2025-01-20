@interface CKFullScreenAppNavbarManager
- (BOOL)_canShowAvatarView;
- (BOOL)_didReceiveMessageChatItem:(id)a3 addedChatItems:(id)a4;
- (BOOL)_shouldStartnotificationQueue;
- (CKAvatarPickerViewController)avatarPickerViewController;
- (CKConversation)conversation;
- (CKFullScreenAppNavbarManager)initWithConversation:(id)a3 plugin:(id)a4;
- (CKFullScreenAppNavbarManagerDelegate)delegate;
- (CKNavigationBarCanvasView)canvasView;
- (IMBalloonPlugin)plugin;
- (NSMutableArray)notificationViews;
- (NSTimer)notificationTimer;
- (UIButton)appIconButton;
- (UIButton)dismissButton;
- (UILabel)defaultTitleLabel;
- (int64_t)_viewModeForCalloutView;
- (int64_t)style;
- (void)_addNotificationViewToQueue;
- (void)_configureCanvasView;
- (void)_contactPhotosEnabledChangedNotification:(id)a3;
- (void)_dequeueNotificationViews:(id)a3;
- (void)_handleChatItemDidChange:(id)a3;
- (void)_invalidateTimer;
- (void)_removeAllNotifications;
- (void)_startNotificationQueue;
- (void)_updateDismissButton;
- (void)_updateTitleLabelText;
- (void)_updateTitleView;
- (void)avatarNotificationCalloutViewDidFinishFadeOut:(id)a3;
- (void)avatarNotificationCalloutViewReceivedTouch:(id)a3;
- (void)dealloc;
- (void)dismissNotifications;
- (void)setAppIconButton:(id)a3;
- (void)setAvatarPickerViewController:(id)a3;
- (void)setCanvasView:(id)a3;
- (void)setConversation:(id)a3;
- (void)setDefaultTitleLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setNotificationTimer:(id)a3;
- (void)setNotificationViews:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation CKFullScreenAppNavbarManager

- (CKFullScreenAppNavbarManager)initWithConversation:(id)a3 plugin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CKFullScreenAppNavbarManager *)self init];
  v9 = v8;
  if (v8)
  {
    [(CKFullScreenAppNavbarManager *)v8 setConversation:v6];
    [(CKFullScreenAppNavbarManager *)v9 setPlugin:v7];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = *MEMORY[0x1E4F6B8D8];
    v12 = [(CKFullScreenAppNavbarManager *)v9 conversation];
    v13 = [v12 chat];
    [v10 addObserver:v9 selector:sel__handleChatItemDidChange_ name:v11 object:v13];

    uint64_t v14 = *MEMORY[0x1E4F6B898];
    v15 = [(CKFullScreenAppNavbarManager *)v9 conversation];
    v16 = [v15 chat];
    [v10 addObserver:v9 selector:sel__handleChatDisplayNameChange_ name:v14 object:v16];

    [v10 addObserver:v9 selector:sel__contactPhotosEnabledChangedNotification_ name:CKConversationListContactPhotosEnabledNotification object:0];
    [(CKFullScreenAppNavbarManager *)v9 _configureCanvasView];
    [(CKFullScreenAppNavbarManager *)v9 _updateDismissButton];
    if (![(CKFullScreenAppNavbarManager *)v9 _canShowAvatarView]) {
      [(CKFullScreenAppNavbarManager *)v9 _updateTitleLabelText];
    }
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  notificationTimer = self->_notificationTimer;
  if (notificationTimer) {
    [(NSTimer *)notificationTimer invalidate];
  }
  if ([(NSMutableArray *)self->_notificationViews count]) {
    [(NSMutableArray *)self->_notificationViews enumerateObjectsUsingBlock:&__block_literal_global_14];
  }
  v5.receiver = self;
  v5.super_class = (Class)CKFullScreenAppNavbarManager;
  [(CKFullScreenAppNavbarManager *)&v5 dealloc];
}

uint64_t __39__CKFullScreenAppNavbarManager_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:0];
}

- (void)_handleChatItemDidChange:(id)a3
{
  id v4 = a3;
  id v9 = [v4 userInfo];
  objc_super v5 = [v4 object];

  id v6 = [v5 chatItems];

  id v7 = [v9 objectForKey:*MEMORY[0x1E4F6B8E0]];
  if ([(CKFullScreenAppNavbarManager *)self _didReceiveMessageChatItem:v6 addedChatItems:v7])
  {
    if ([(CKFullScreenAppNavbarManager *)self _shouldStartnotificationQueue])
    {
      [(CKFullScreenAppNavbarManager *)self _startNotificationQueue];
      v8 = [(CKFullScreenAppNavbarManager *)self avatarPickerViewController];
      [v8 _animateOutTitleView];
    }
    [(CKFullScreenAppNavbarManager *)self _addNotificationViewToQueue];
  }
}

- (BOOL)_didReceiveMessageChatItem:(id)a3 addedChatItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CKFullScreenAppNavbarManager__didReceiveMessageChatItem_addedChatItems___block_invoke;
  v10[3] = &unk_1E56213F8;
  id v7 = v5;
  id v11 = v7;
  v12 = &v13;
  [v6 enumerateIndexesWithOptions:2 usingBlock:v10];
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __74__CKFullScreenAppNavbarManager__didReceiveMessageChatItem_addedChatItems___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v9 = [*(id *)(a1 + 32) objectAtIndex:a2];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v9;
  if (isKindOfClass)
  {
    id v7 = v9;
    char v8 = [v7 guid];
    if (v8 && ([v7 isFromMe] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }

    id v6 = v9;
  }
}

- (BOOL)_shouldStartnotificationQueue
{
  v2 = [(CKFullScreenAppNavbarManager *)self notificationViews];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)avatarNotificationCalloutViewDidFinishFadeOut:(id)a3
{
}

- (void)avatarNotificationCalloutViewReceivedTouch:(id)a3
{
  [(CKFullScreenAppNavbarManager *)self _invalidateTimer];

  [(CKFullScreenAppNavbarManager *)self _removeAllNotifications];
}

- (void)_invalidateTimer
{
  BOOL v3 = [(CKFullScreenAppNavbarManager *)self notificationTimer];

  if (v3)
  {
    id v4 = [(CKFullScreenAppNavbarManager *)self notificationTimer];
    [v4 invalidate];

    [(CKFullScreenAppNavbarManager *)self setNotificationTimer:0];
  }
}

- (void)_removeAllNotifications
{
  BOOL v3 = [(CKFullScreenAppNavbarManager *)self notificationViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(CKFullScreenAppNavbarManager *)self notificationViews];
    id v9 = [v5 lastObject];

    id v6 = [(CKFullScreenAppNavbarManager *)self notificationViews];
    [v6 removeLastObject];

    [v9 animateOut];
    id v7 = [(CKFullScreenAppNavbarManager *)self notificationViews];
    [v7 enumerateObjectsUsingBlock:&__block_literal_global_38];

    [(CKFullScreenAppNavbarManager *)self setNotificationViews:0];
    char v8 = [(CKFullScreenAppNavbarManager *)self avatarPickerViewController];
    [v8 _animateInTitleView];
  }
}

uint64_t __55__CKFullScreenAppNavbarManager__removeAllNotifications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (int64_t)_viewModeForCalloutView
{
  return [(CKFullScreenAppNavbarManager *)self style] < 4;
}

- (void)_startNotificationQueue
{
  BOOL v3 = [(CKFullScreenAppNavbarManager *)self notificationViews];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(CKFullScreenAppNavbarManager *)self setNotificationViews:v4];
  }
  id v5 = [(CKFullScreenAppNavbarManager *)self notificationTimer];

  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__dequeueNotificationViews_ selector:0 userInfo:1 repeats:2.0];
    [(CKFullScreenAppNavbarManager *)self setNotificationTimer:v6];

    id v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    char v8 = [(CKFullScreenAppNavbarManager *)self notificationTimer];
    [v7 addTimer:v8 forMode:*MEMORY[0x1E4F1C3A0]];
  }
  id v9 = [(CKFullScreenAppNavbarManager *)self delegate];
  [v9 navbarManagerDidReceiveMessage:self];
}

- (void)_addNotificationViewToQueue
{
  BOOL v3 = [CKAvatarNotificationCalloutView alloc];
  id v4 = [(CKFullScreenAppNavbarManager *)self conversation];
  id v5 = [v4 previewText];
  id v6 = [v5 string];
  int64_t v7 = [(CKFullScreenAppNavbarManager *)self _viewModeForCalloutView];
  v70 = -[CKAvatarNotificationCalloutView initWithFrame:previewText:mode:](v3, "initWithFrame:previewText:mode:", v6, v7, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [(CKAvatarNotificationCalloutView *)v70 sizeToFit];
  char v8 = [(CKFullScreenAppNavbarManager *)self canvasView];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double rect = v15;

  if ([(CKFullScreenAppNavbarManager *)self _canShowAvatarView])
  {
    char v16 = [(CKFullScreenAppNavbarManager *)self canvasView];
    v17 = [(CKFullScreenAppNavbarManager *)self avatarPickerViewController];
    [v17 titleViewFrame];
    double v19 = v18;
    double v20 = v10;
    double v22 = v21;
    double v23 = v12;
    double v25 = v24;
    double v26 = v14;
    double v28 = v27;
    v29 = [(CKFullScreenAppNavbarManager *)self avatarPickerViewController];
    v30 = [v29 view];
    double v31 = v22;
    CGFloat v10 = v20;
    double v32 = v25;
    CGFloat v12 = v23;
    double v33 = v28;
    CGFloat v14 = v26;
    objc_msgSend(v16, "convertRect:fromView:", v30, v19, v31, v32, v33);
    CGFloat v67 = v35;
    CGFloat v68 = v34;
    CGFloat v66 = v36;
    double v38 = v37;
  }
  else
  {
    char v16 = [(CKFullScreenAppNavbarManager *)self defaultTitleLabel];
    [v16 frame];
    CGFloat v67 = v40;
    CGFloat v68 = v39;
    CGFloat v66 = v41;
    double v38 = v42;
  }
  CGFloat v65 = v38;

  [(CKAvatarNotificationCalloutView *)v70 bounds];
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  double v48 = v47;
  double v50 = v49;
  v72.origin.x = v10;
  v72.origin.y = v12;
  v72.size.width = v14;
  v72.size.height = rect;
  double MidX = CGRectGetMidX(v72);
  v73.origin.x = v44;
  v73.origin.y = v46;
  v73.size.width = v48;
  v73.size.height = v50;
  double v52 = MidX + CGRectGetWidth(v73) * -0.5;
  CGFloat v53 = v68;
  if ([(CKFullScreenAppNavbarManager *)self _canShowAvatarView])
  {
    v74.origin.x = v68;
    v74.origin.y = v67;
    CGFloat v55 = v65;
    CGFloat v54 = v66;
    v74.size.width = v66;
    v74.size.height = v65;
    double rect = CGRectGetMidY(v74);
    v75.origin.x = v52;
    v75.origin.y = v46;
    v75.size.width = v48;
    v75.size.height = v50;
    double MaxY = rect + CGRectGetHeight(v75) * -0.5;
  }
  else
  {
    v76.origin.x = v68;
    v76.origin.y = v67;
    CGFloat v55 = v65;
    CGFloat v54 = v66;
    v76.size.width = v66;
    v76.size.height = v65;
    double MaxY = CGRectGetMaxY(v76);
  }
  -[CKAvatarNotificationCalloutView setFrame:](v70, "setFrame:", v52, MaxY, v48, v50, *(void *)&rect);
  v57 = [(CKAvatarNotificationCalloutView *)v70 layer];
  [v57 anchorPoint];
  double v69 = v58;

  v77.origin.x = v53;
  v77.origin.y = v67;
  v77.size.width = v54;
  v77.size.height = v55;
  CGFloat v59 = CGRectGetHeight(v77) * 0.5;
  v78.origin.x = v52;
  v78.origin.y = MaxY;
  v78.size.width = v48;
  v78.size.height = v50;
  CGFloat v60 = v59 / CGRectGetHeight(v78);
  v61 = [(CKAvatarNotificationCalloutView *)v70 layer];
  objc_msgSend(v61, "setAnchorPoint:", v69, v60);

  [(CKAvatarNotificationCalloutView *)v70 setDelegate:self];
  v62 = [(CKFullScreenAppNavbarManager *)self notificationViews];
  [v62 addObject:v70];

  v63 = [(CKFullScreenAppNavbarManager *)self canvasView];
  [v63 addSubview:v70];

  [(CKAvatarNotificationCalloutView *)v70 animateIn];
}

- (void)_dequeueNotificationViews:(id)a3
{
  id v4 = [(CKFullScreenAppNavbarManager *)self notificationViews];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(CKFullScreenAppNavbarManager *)self notificationViews];
    id v12 = [v6 firstObject];

    int64_t v7 = [(CKFullScreenAppNavbarManager *)self notificationViews];
    [v7 removeFirstObject];

    [v12 animateOut];
    char v8 = [(CKFullScreenAppNavbarManager *)self notificationViews];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      [(CKFullScreenAppNavbarManager *)self setNotificationViews:0];
      CGFloat v10 = [(CKFullScreenAppNavbarManager *)self avatarPickerViewController];
      [v10 _animateInTitleView];

      [(CKFullScreenAppNavbarManager *)self _invalidateTimer];
      double v11 = [(CKFullScreenAppNavbarManager *)self delegate];
      [v11 navbarManagerDidDismissAllMessages:self];
    }
  }
  else
  {
    [(CKFullScreenAppNavbarManager *)self _invalidateTimer];
  }
}

- (void)dismissNotifications
{
  [(CKFullScreenAppNavbarManager *)self _invalidateTimer];

  [(CKFullScreenAppNavbarManager *)self _removeAllNotifications];
}

- (void)_contactPhotosEnabledChangedNotification:(id)a3
{
  [(CKFullScreenAppNavbarManager *)self _updateTitleView];
  id v4 = [(CKFullScreenAppNavbarManager *)self canvasView];
  uint64_t v5 = [v4 titleView];
  id v6 = [(CKFullScreenAppNavbarManager *)self avatarPickerViewController];
  int64_t v7 = [v6 view];

  if (v5 == v7)
  {
    char v8 = [(CKFullScreenAppNavbarManager *)self canvasView];
    uint64_t v9 = [v8 titleView];
    CGFloat v10 = [(CKFullScreenAppNavbarManager *)self defaultTitleLabel];

    if (v9 != v10) {
      [(CKFullScreenAppNavbarManager *)self setDefaultTitleLabel:0];
    }
  }
  else
  {
    [(CKFullScreenAppNavbarManager *)self setAvatarPickerViewController:0];
    [(CKFullScreenAppNavbarManager *)self _updateTitleLabelText];
  }
  id v11 = [(CKFullScreenAppNavbarManager *)self canvasView];
  [v11 setNeedsLayout];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    uint64_t v5 = [(CKFullScreenAppNavbarManager *)self avatarPickerViewController];
    [v5 setStyle:a3];

    [(CKFullScreenAppNavbarManager *)self _updateDismissButton];
  }
}

- (BOOL)_canShowAvatarView
{
  v2 = +[CKUIBehavior sharedBehaviors];
  if ([v2 contactPhotosEnabled])
  {
    BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
    if (v4 <= 320.0)
    {
      BOOL v6 = 0;
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F42D90] mainScreen];
      [v5 bounds];
      BOOL v6 = _UIUserInterfaceSizeClassForHeight() != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_configureCanvasView
{
  BOOL v3 = [(CKFullScreenAppNavbarManager *)self appIconButton];
  double v4 = [(CKFullScreenAppNavbarManager *)self canvasView];
  [v4 setLeftItemView:v3];

  uint64_t v5 = [(CKFullScreenAppNavbarManager *)self dismissButton];
  BOOL v6 = [(CKFullScreenAppNavbarManager *)self canvasView];
  [v6 setRightItemView:v5];

  [(CKFullScreenAppNavbarManager *)self _updateTitleView];
}

- (void)_updateTitleView
{
  if ([(CKFullScreenAppNavbarManager *)self _canShowAvatarView])
  {
    id v5 = [(CKFullScreenAppNavbarManager *)self avatarPickerViewController];
    BOOL v3 = [v5 view];
    double v4 = [(CKFullScreenAppNavbarManager *)self canvasView];
    [v4 setTitleView:v3];
  }
  else
  {
    id v5 = [(CKFullScreenAppNavbarManager *)self defaultTitleLabel];
    BOOL v3 = [(CKFullScreenAppNavbarManager *)self canvasView];
    [v3 setTitleView:v5];
  }
}

- (void)_updateTitleLabelText
{
  id v8 = [(CKFullScreenAppNavbarManager *)self conversation];
  int v3 = [v8 hasDisplayName];
  double v4 = [(CKFullScreenAppNavbarManager *)self conversation];
  id v5 = v4;
  if (v3) {
    [v4 displayName];
  }
  else {
  BOOL v6 = [v4 displayNameForMediaObjects:0 subject:0 shouldListParticipants:0];
  }
  int64_t v7 = [(CKFullScreenAppNavbarManager *)self defaultTitleLabel];
  [v7 setText:v6];
}

- (void)_updateDismissButton
{
  int v3 = [(CKFullScreenAppNavbarManager *)self dismissButton];
  double v4 = [MEMORY[0x1E4F42A80] ckTemplateImageNamed:@"Dismiss-Chevron"];
  [v3 setImage:v4 forState:0];

  if ([(CKFullScreenAppNavbarManager *)self style] < 4) {
    [MEMORY[0x1E4F428B8] colorWithRed:0.619607843 green:0.643137255 blue:0.682352941 alpha:1.0];
  }
  else {
  id v7 = [MEMORY[0x1E4F428B8] systemBlueColor];
  }
  id v5 = [(CKFullScreenAppNavbarManager *)self dismissButton];
  BOOL v6 = [v5 imageView];
  [v6 setTintColor:v7];
}

- (CKAvatarPickerViewController)avatarPickerViewController
{
  avatarPickerViewController = self->_avatarPickerViewController;
  if (!avatarPickerViewController)
  {
    double v4 = [CKAvatarPickerViewController alloc];
    id v5 = [(CKFullScreenAppNavbarManager *)self conversation];
    BOOL v6 = [(CKAvatarPickerViewController *)v4 initWithConversation:v5];
    id v7 = self->_avatarPickerViewController;
    self->_avatarPickerViewController = v6;

    avatarPickerViewController = self->_avatarPickerViewController;
  }

  return avatarPickerViewController;
}

- (CKNavigationBarCanvasView)canvasView
{
  canvasView = self->_canvasView;
  if (!canvasView)
  {
    double v4 = [CKNavigationBarCanvasView alloc];
    id v5 = -[CKNavigationBarCanvasView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v6 = self->_canvasView;
    self->_canvasView = v5;

    canvasView = self->_canvasView;
  }

  return canvasView;
}

- (UIButton)dismissButton
{
  dismissButton = self->_dismissButton;
  if (!dismissButton)
  {
    double v4 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    id v5 = self->_dismissButton;
    self->_dismissButton = v4;

    [(UIButton *)self->_dismissButton setShowsTouchWhenHighlighted:1];
    dismissButton = self->_dismissButton;
  }

  return dismissButton;
}

- (UILabel)defaultTitleLabel
{
  defaultTitleLabel = self->_defaultTitleLabel;
  if (!defaultTitleLabel)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    id v5 = self->_defaultTitleLabel;
    self->_defaultTitleLabel = v4;

    [(UILabel *)self->_defaultTitleLabel setTextAlignment:1];
    BOOL v6 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
    [(UILabel *)self->_defaultTitleLabel setFont:v6];

    defaultTitleLabel = self->_defaultTitleLabel;
  }

  return defaultTitleLabel;
}

- (UIButton)appIconButton
{
  if (!self->_appIconButton)
  {
    int v3 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    appIconButton = self->_appIconButton;
    self->_appIconButton = v3;

    id v5 = [(CKFullScreenAppNavbarManager *)self plugin];
    BOOL v6 = [v5 identifier];
    char v7 = [v6 isEqualToString:*MEMORY[0x1E4F6CBA0]];

    if ((v7 & 1) == 0)
    {
      id v8 = [(CKFullScreenAppNavbarManager *)self plugin];
      uint64_t v9 = [v8 identifier];

      id location = 0;
      objc_initWeak(&location, self);
      CGFloat v10 = [(CKFullScreenAppNavbarManager *)self plugin];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __45__CKFullScreenAppNavbarManager_appIconButton__block_invoke;
      v14[3] = &unk_1E5621528;
      objc_copyWeak(&v16, &location);
      id v11 = v9;
      id v15 = v11;
      objc_msgSend(v10, "__ck_generateStatusImage:", v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  id v12 = self->_appIconButton;

  return v12;
}

void __45__CKFullScreenAppNavbarManager_appIconButton__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = *(void **)(a1 + 32);
    BOOL v6 = [WeakRetained plugin];
    char v7 = [v6 identifier];
    LODWORD(v5) = [v5 isEqualToString:v7];

    if (v5)
    {
      id v8 = [MEMORY[0x1E4F427E8] ckCreateButtonConfigurationWithType:0 withImage:v9];
      [v4[2] setConfiguration:v8];
    }
  }
}

- (void)setPlugin:(id)a3
{
  id v5 = (IMBalloonPlugin *)a3;
  if (self->_plugin != v5)
  {
    id v12 = v5;
    objc_storeStrong((id *)&self->_plugin, a3);
    BOOL v6 = [(CKFullScreenAppNavbarManager *)self plugin];
    char v7 = [v6 identifier];
    char v8 = [v7 isEqualToString:*MEMORY[0x1E4F6CBA0]];

    id v5 = v12;
    if ((v8 & 1) == 0)
    {
      id v9 = [(CKFullScreenAppNavbarManager *)self plugin];
      CGFloat v10 = objc_msgSend(v9, "__ck_statusImage");

      id v11 = [MEMORY[0x1E4F427E8] ckCreateButtonConfigurationWithType:0 withImage:v10];
      [(UIButton *)self->_appIconButton setConfiguration:v11];

      [(UIButton *)self->_appIconButton setNeedsLayout];
      id v5 = v12;
    }
  }
}

- (void)setDismissButton:(id)a3
{
}

- (void)setAppIconButton:(id)a3
{
}

- (void)setCanvasView:(id)a3
{
}

- (void)setAvatarPickerViewController:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (CKFullScreenAppNavbarManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKFullScreenAppNavbarManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IMBalloonPlugin)plugin
{
  return self->_plugin;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (NSMutableArray)notificationViews
{
  return self->_notificationViews;
}

- (void)setNotificationViews:(id)a3
{
}

- (NSTimer)notificationTimer
{
  return self->_notificationTimer;
}

- (void)setNotificationTimer:(id)a3
{
}

- (void)setDefaultTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTitleLabel, 0);
  objc_storeStrong((id *)&self->_notificationTimer, 0);
  objc_storeStrong((id *)&self->_notificationViews, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_avatarPickerViewController, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_appIconButton, 0);

  objc_storeStrong((id *)&self->_dismissButton, 0);
}

@end