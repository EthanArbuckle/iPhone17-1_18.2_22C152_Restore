@interface GKNotificationBannerWindow
+ (id)bannerWindow;
+ (id)queue;
+ (void)enqueBanner:(id)a3;
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_includeInDefaultImageSnapshot;
- (BOOL)isSemaphoreValid;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (GKNotificationBannerViewController)currentBannerViewController;
- (GKNotificationBannerWindow)init;
- (OS_dispatch_semaphore)bannerSemaphore;
- (void)_hideBanner:(id)a3 quickly:(BOOL)a4;
- (void)_showBanner:(id)a3;
- (void)dealloc;
- (void)handlePan:(id)a3;
- (void)handleSingleTap:(id)a3;
- (void)setCurrentBannerViewController:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation GKNotificationBannerWindow

+ (id)bannerWindow
{
  objc_sync_enter(@"GKNotificationBannerSyncObject");
  id v2 = (id)sBannerWindow;
  objc_sync_exit(@"GKNotificationBannerSyncObject");

  return v2;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (BOOL)_includeInDefaultImageSnapshot
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  v3.receiver = self;
  v3.super_class = (Class)GKNotificationBannerWindow;
  return [(GKNotificationBannerWindow *)&v3 _canBecomeKeyWindow];
}

- (GKNotificationBannerWindow)init
{
  if (GKApplicationLinkedOnOrAfter())
  {
    objc_super v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    v26.receiver = self;
    v26.super_class = (Class)GKNotificationBannerWindow;
    v4 = (GKNotificationBannerWindow *)-[GKNotificationBannerWindow _initWithOrientation:](&v26, sel__initWithOrientation_, [v3 interfaceOrientation]);

    if (!v4) {
      return v4;
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)GKNotificationBannerWindow;
    v4 = [(GKNotificationBannerWindow *)&v25 init];
    if (!v4) {
      return v4;
    }
  }
  v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[GKNotificationBannerWindow setFrame:](v4, "setFrame:", v7, v9, v11, v13);
  [(GKNotificationBannerWindow *)v4 setOpaque:0];
  [(GKNotificationBannerWindow *)v4 setUserInteractionEnabled:1];
  [(GKNotificationBannerWindow *)v4 setHidden:0];
  v14 = objc_alloc_init(GKNotificationBannerViewController);
  currentBannerViewController = v4->_currentBannerViewController;
  v4->_currentBannerViewController = v14;

  [(GKNotificationBannerWindow *)v4 setRootViewController:v4->_currentBannerViewController];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v4 action:sel_handlePan_];
  [(GKNotificationBannerWindow *)v4 addGestureRecognizer:v16];

  dispatch_semaphore_t v17 = dispatch_semaphore_create(1);
  bannerSemaphore = v4->_bannerSemaphore;
  v4->_bannerSemaphore = (OS_dispatch_semaphore *)v17;

  v19 = [MEMORY[0x1E4FB1438] sharedApplication];
  int v20 = [v19 _appAdoptsUISceneLifecycle];

  if (v20)
  {
    v21 = [MEMORY[0x1E4FB1438] sharedApplication];
    v22 = [v21 keyWindow];
    v23 = [v22 windowScene];
    [(GKNotificationBannerWindow *)v4 setWindowScene:v23];
  }
  else
  {
    v21 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [(GKNotificationBannerWindow *)v4 setScreen:v21];
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKNotificationBannerWindow;
  [(GKNotificationBannerWindow *)&v4 dealloc];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(GKNotificationBannerWindow *)self currentBannerViewController];
  char v9 = objc_msgSend(v8, "windowPointInside:withEvent:", v7, x, y);

  return v9;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKNotificationBannerWindow *)self currentBannerViewController];
  [v8 windowTouchesEnded:v7 withEvent:v6];
}

- (void)handleSingleTap:(id)a3
{
  id v4 = a3;
  id v5 = [(GKNotificationBannerWindow *)self currentBannerViewController];
  [v5 handleWindowSingleTap:v4];
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  id v5 = [(GKNotificationBannerWindow *)self currentBannerViewController];
  [v5 handleWindowPan:v4];
}

- (void)_showBanner:(id)a3
{
  id v4 = a3;
  id v5 = [(GKNotificationBannerWindow *)self currentBannerViewController];
  [v5 addBannerView:v4];

  id v6 = [(GKNotificationBannerWindow *)self currentBannerViewController];
  [v6 showCurrentBanner];
}

- (void)_hideBanner:(id)a3 quickly:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(GKNotificationBannerWindow *)self currentBannerViewController];
  [v5 hideBannerQuickly:v4];
}

- (BOOL)isSemaphoreValid
{
  bannerSemaphore = self->_bannerSemaphore;
  if (!bannerSemaphore)
  {
    BOOL v4 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    id v5 = self->_bannerSemaphore;
    self->_bannerSemaphore = v4;

    id v6 = (NSObject **)MEMORY[0x1E4F63860];
    id v7 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v8 = (id)GKOSLoggers();
      id v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_INFO, "Notification banner semaphore unexpectedly null. Recreating...", v10, 2u);
    }
    bannerSemaphore = self->_bannerSemaphore;
  }
  return bannerSemaphore != 0;
}

+ (id)queue
{
  if (queue_onceToken != -1) {
    dispatch_once(&queue_onceToken, &__block_literal_global_27);
  }
  id v2 = (void *)queue_sQueue;

  return v2;
}

void __35__GKNotificationBannerWindow_queue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.GameKit.banner", v2);
  v1 = (void *)queue_sQueue;
  queue_sQueue = (uint64_t)v0;
}

+ (void)enqueBanner:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__GKNotificationBannerWindow_enqueBanner___block_invoke;
  v6[3] = &unk_1E5F64DF0;
  id v7 = v4;
  id v8 = a1;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __42__GKNotificationBannerWindow_enqueBanner___block_invoke(uint64_t a1)
{
  if (GKAtomicIncrement32() == 1)
  {
    objc_sync_enter(@"GKNotificationBannerSyncObject");
    id v2 = objc_alloc_init(GKNotificationBannerWindow);
    objc_super v3 = (void *)sBannerWindow;
    sBannerWindow = (uint64_t)v2;

    objc_sync_exit(@"GKNotificationBannerSyncObject");
  }
  id v4 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__GKNotificationBannerWindow_enqueBanner___block_invoke_2;
  block[3] = &unk_1E5F62EB0;
  id v6 = *(id *)(a1 + 32);
  dispatch_async(v4, block);
}

void __42__GKNotificationBannerWindow_enqueBanner___block_invoke_2(uint64_t a1)
{
  if ([(id)sBannerWindow isSemaphoreValid])
  {
    id v2 = [(id)sBannerWindow bannerSemaphore];
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  }
  objc_super v3 = (void *)MEMORY[0x1E4F636D8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKNotificationBanner_iOS.m", 366, "+[GKNotificationBannerWindow enqueBanner:]_block_invoke_2");
  id v5 = [v3 dispatchGroupWithName:v4];

  id v6 = [*(id *)(a1 + 32) playerAvatarView];
  id v7 = [v6 player];

  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42__GKNotificationBannerWindow_enqueBanner___block_invoke_3;
    v10[3] = &unk_1E5F63650;
    id v11 = v6;
    [v5 perform:v10];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__GKNotificationBannerWindow_enqueBanner___block_invoke_5;
  v8[3] = &unk_1E5F62EB0;
  id v9 = *(id *)(a1 + 32);
  [v5 notifyOnMainQueueWithBlock:v8];
}

void __42__GKNotificationBannerWindow_enqueBanner___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__GKNotificationBannerWindow_enqueBanner___block_invoke_4;
  v6[3] = &unk_1E5F639B0;
  id v7 = v3;
  id v5 = v3;
  [v4 refreshImageWithCompletionHandler:v6];
}

uint64_t __42__GKNotificationBannerWindow_enqueBanner___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42__GKNotificationBannerWindow_enqueBanner___block_invoke_5(uint64_t a1)
{
  return [(id)sBannerWindow _showBanner:*(void *)(a1 + 32)];
}

- (GKNotificationBannerViewController)currentBannerViewController
{
  return self->_currentBannerViewController;
}

- (void)setCurrentBannerViewController:(id)a3
{
}

- (OS_dispatch_semaphore)bannerSemaphore
{
  return self->_bannerSemaphore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBannerViewController, 0);

  objc_storeStrong((id *)&self->_bannerSemaphore, 0);
}

@end