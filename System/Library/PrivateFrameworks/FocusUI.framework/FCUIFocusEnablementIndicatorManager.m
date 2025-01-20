@interface FCUIFocusEnablementIndicatorManager
+ (id)managerWithBannerPoster:(id)a3 systemApertureElementRegistrar:(id)a4;
- (BOOL)shouldKeepPresentingAfterActiveActivityDidChange:(id)a3;
- (FCUIFocusEnablementIndicatorManager)init;
- (id)postPersistentActivity:(id)a3 enabled:(BOOL)a4 systemApertureElementProvider:(id)a5 pickerPresentation:(BOOL)a6;
- (id)postPersistentActivityPickerWithSystemApertureElementProvider:(id)a3;
- (id)postPersistentActivityWithModeIdentifier:(id)a3 systemApertureElementProvider:(id)a4;
- (void)activeActivityDidChangeForManager:(id)a3;
@end

@implementation FCUIFocusEnablementIndicatorManager

+ (id)managerWithBannerPoster:(id)a3 systemApertureElementRegistrar:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!SBSIsSystemApertureAvailable()
    || (+[FCUIFocusEnablementIndicatorSystemApertureManager managerWithSystemApertureElementRegistrar:v6], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = +[FCUIFocusEnablementIndicatorBannerManager managerWithBannerPoster:v5];
  }

  return v7;
}

- (FCUIFocusEnablementIndicatorManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)FCUIFocusEnablementIndicatorManager;
  v2 = [(FCUIFocusEnablementIndicatorManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastActiveActivityLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    uint64_t v4 = [MEMORY[0x263F3F3A0] sharedActivityManager];
    activityManager = v3->_activityManager;
    v3->_activityManager = (FCActivityManager *)v4;

    [(FCActivityManager *)v3->_activityManager addObserver:v3];
    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __43__FCUIFocusEnablementIndicatorManager_init__block_invoke;
    v8[3] = &unk_264542AA0;
    objc_copyWeak(&v9, &location);
    dispatch_async(SerialWithQoS, v8);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__FCUIFocusEnablementIndicatorManager_init__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = (os_unfair_lock_s *)WeakRetained;
    uint64_t v2 = [WeakRetained[1] activeActivity];
    os_unfair_lock_lock(v4 + 6);
    v3 = *(void **)&v4[4]._os_unfair_lock_opaque;
    *(void *)&v4[4]._os_unfair_lock_opaque = v2;

    os_unfair_lock_unlock(v4 + 6);
    WeakRetained = (id *)v4;
  }
}

- (void)activeActivityDidChangeForManager:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activeActivity];
  int v6 = [v4 shouldActivityShowStatusPill:v5];

  os_unfair_lock_lock(&self->_lastActiveActivityLock);
  v7 = self->_lastActiveActivity;
  os_unfair_lock_unlock(&self->_lastActiveActivityLock);
  if (([(FCUIFocusEnablementIndicatorManager *)self shouldKeepPresentingAfterActiveActivityDidChange:v5 lastActivity:v7] & 1) == 0)
  {
    if (v5) {
      v8 = @"Revoking for mode change";
    }
    else {
      v8 = @"Revoking for mode end";
    }
    [(FCUIFocusEnablementIndicatorManager *)self revokeWithReason:v8];
  }
  if (v6)
  {
    if (v5 ? v5 : v7) {
      -[FCUIFocusEnablementIndicatorManager postActivity:enabled:](self, "postActivity:enabled:");
    }
  }
  os_unfair_lock_lock(&self->_lastActiveActivityLock);
  lastActiveActivity = self->_lastActiveActivity;
  self->_lastActiveActivity = v5;
  objc_super v11 = v5;

  os_unfair_lock_unlock(&self->_lastActiveActivityLock);
}

- (id)postPersistentActivityWithModeIdentifier:(id)a3 systemApertureElementProvider:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(FCActivityManager *)self->_activityManager activityWithIdentifier:a3];
  uint64_t v8 = [(FCActivityManager *)self->_activityManager activeActivity];
  uint64_t v9 = BSEqualObjects();
  if (!(v7 | v8))
  {
    uint64_t v7 = [(FCActivityManager *)self->_activityManager defaultActivity];
  }
  v10 = [(FCUIFocusEnablementIndicatorManager *)self postPersistentActivity:v7 enabled:v9 systemApertureElementProvider:v6 pickerPresentation:0];

  return v10;
}

- (id)postPersistentActivityPickerWithSystemApertureElementProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCActivityManager *)self->_activityManager activeActivity];
  id v6 = (void *)v5;
  if (!v5)
  {
    id v6 = [(FCActivityManager *)self->_activityManager defaultActivity];
  }
  uint64_t v7 = [(FCUIFocusEnablementIndicatorManager *)self postPersistentActivity:v6 enabled:v5 != 0 systemApertureElementProvider:v4 pickerPresentation:1];

  return v7;
}

- (BOOL)shouldKeepPresentingAfterActiveActivityDidChange:(id)a3
{
  return 0;
}

- (id)postPersistentActivity:(id)a3 enabled:(BOOL)a4 systemApertureElementProvider:(id)a5 pickerPresentation:(BOOL)a6
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveActivity, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end