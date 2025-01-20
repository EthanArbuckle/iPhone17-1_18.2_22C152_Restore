@interface CLSNotificationBannerWindow
+ (id)bannerWindow;
+ (id)queue;
+ (void)enqueBanner:(id)a3;
- (BOOL)_canAffectStatusBarAppearance;
- (BOOL)_includeInDefaultImageSnapshot;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CLSNotificationBannerViewController)currentBannerViewController;
- (CLSNotificationBannerWindow)init;
- (OS_dispatch_semaphore)bannerSemaphore;
- (void)_hideBanner:(id)a3 quickly:(BOOL)a4;
- (void)_showBanner:(id)a3;
- (void)handlePan:(id)a3;
- (void)setBannerSemaphore:(id)a3;
- (void)setCurrentBannerViewController:(id)a3;
@end

@implementation CLSNotificationBannerWindow

+ (id)bannerWindow
{
  objc_sync_enter(@"CLSNotificationBannerSyncObject");
  id v2 = (id)qword_2684961F0;
  objc_sync_exit(@"CLSNotificationBannerSyncObject");

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

- (CLSNotificationBannerWindow)init
{
  v4 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], a2, v2);
  v7 = sub_22BFA2228(v4, v5, v6);
  v10 = objc_msgSend_windowScene(v7, v8, v9);
  v26.receiver = self;
  v26.super_class = (Class)CLSNotificationBannerWindow;
  v11 = [(CLSNotificationBannerWindow *)&v26 initWithWindowScene:v10];
  uint64_t v13 = (uint64_t)v11;
  if (v11)
  {
    objc_msgSend_setOpaque_(v11, v12, 0);
    objc_msgSend_setUserInteractionEnabled_((void *)v13, v14, 1);
    objc_msgSend_setHidden_((void *)v13, v15, 0);
    v16 = objc_alloc_init(CLSNotificationBannerViewController);
    v17 = *(void **)(v13 + 896);
    *(void *)(v13 + 896) = v16;

    objc_msgSend_setRootViewController_((void *)v13, v18, *(void *)(v13 + 896));
    id v19 = objc_alloc(MEMORY[0x263F1C838]);
    v21 = objc_msgSend_initWithTarget_action_(v19, v20, v13, sel_handlePan_);
    objc_msgSend_addGestureRecognizer_((void *)v13, v22, (uint64_t)v21);
    dispatch_semaphore_t v23 = dispatch_semaphore_create(1);
    v24 = *(void **)(v13 + 904);
    *(void *)(v13 + 904) = v23;
  }
  return (CLSNotificationBannerWindow *)v13;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v10 = objc_msgSend_currentBannerViewController(self, v8, v9);
  char v12 = objc_msgSend_windowPointInside_withEvent_(v10, v11, (uint64_t)v7, x, y);

  return v12;
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  objc_msgSend_currentBannerViewController(self, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleWindowPan_(v8, v7, (uint64_t)v4);
}

- (void)_showBanner:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_currentBannerViewController(self, v5, v6);
  objc_msgSend_addBannerView_(v7, v8, (uint64_t)v4);

  objc_msgSend_currentBannerViewController(self, v9, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_showCurrentBanner(v13, v11, v12);
}

- (void)_hideBanner:(id)a3 quickly:(BOOL)a4
{
  BOOL v4 = a4;
  objc_msgSend_currentBannerViewController(self, a2, (uint64_t)a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hideBannerQuickly_(v6, v5, v4);
}

+ (id)queue
{
  if (qword_268496200 != -1) {
    dispatch_once(&qword_268496200, &unk_26DF667F0);
  }
  uint64_t v2 = (void *)qword_2684961F8;

  return v2;
}

+ (void)enqueBanner:(id)a3
{
  id v6 = a3;
  if (!atomic_fetch_add_explicit(&dword_2684961EC, 1u, memory_order_relaxed))
  {
    objc_sync_enter(@"CLSNotificationBannerSyncObject");
    id v7 = objc_alloc_init(CLSNotificationBannerWindow);
    id v8 = (void *)qword_2684961F0;
    qword_2684961F0 = (uint64_t)v7;

    objc_sync_exit(@"CLSNotificationBannerSyncObject");
  }
  uint64_t v9 = objc_msgSend_queue(a1, v4, v5);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22BFA28D4;
  block[3] = &unk_264904E40;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (CLSNotificationBannerViewController)currentBannerViewController
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

- (void)setBannerSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerSemaphore, 0);

  objc_storeStrong((id *)&self->_currentBannerViewController, 0);
}

@end