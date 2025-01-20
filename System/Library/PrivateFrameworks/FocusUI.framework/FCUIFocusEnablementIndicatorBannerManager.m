@interface FCUIFocusEnablementIndicatorBannerManager
+ (id)_flankingBannerRequesterIdentifier;
+ (id)managerWithBannerPoster:(id)a3;
- (BNPosting)_bannerPoster;
- (BOOL)shouldKeepPresentingAfterActiveActivityDidChange:(id)a3 lastActivity:(id)a4;
- (id)_initWithBannerPoster:(id)a3;
- (id)postPersistentActivity:(id)a3 enabled:(BOOL)a4 systemApertureElementProvider:(id)a5 pickerPresentation:(BOOL)a6;
- (void)_addActivePresentable:(id)a3;
- (void)_invalidateDismissTimerForPresentable:(id)a3;
- (void)_postActivity:(id)a3 enabled:(BOOL)a4 forPreviewing:(BOOL)a5 withOptions:(unint64_t)a6;
- (void)_removeFlankingPresentable:(id)a3;
- (void)_scheduleDismissTimerForPresentable:(id)a3;
- (void)postActivity:(id)a3 enabled:(BOOL)a4;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)revokeWithReason:(id)a3;
@end

@implementation FCUIFocusEnablementIndicatorBannerManager

+ (id)managerWithBannerPoster:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithBannerPoster:v4];

  return v5;
}

- (id)_initWithBannerPoster:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCUIFocusEnablementIndicatorBannerManager;
  v6 = [(FCUIFocusEnablementIndicatorManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bannerPoster, a3);
  }

  return v7;
}

- (BOOL)shouldKeepPresentingAfterActiveActivityDidChange:(id)a3 lastActivity:(id)a4
{
  return 1;
}

- (void)revokeWithReason:(id)a3
{
  id v9 = a3;
  bannerPoster = self->_bannerPoster;
  id v5 = (void *)MEMORY[0x263F29B50];
  v6 = [(id)objc_opt_class() _flankingBannerRequesterIdentifier];
  v7 = [v5 identificationWithRequesterIdentifier:v6];
  id v8 = (id)[(BNPosting *)bannerPoster revokePresentablesWithIdentification:v7 reason:v9 options:0 userInfo:0 error:0];
}

- (void)postActivity:(id)a3 enabled:(BOOL)a4
{
}

- (id)postPersistentActivity:(id)a3 enabled:(BOOL)a4 systemApertureElementProvider:(id)a5 pickerPresentation:(BOOL)a6
{
  BOOL v7 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263F7C288]);
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __125__FCUIFocusEnablementIndicatorBannerManager_postPersistentActivity_enabled_systemApertureElementProvider_pickerPresentation___block_invoke;
  v16 = &unk_264542DA0;
  objc_copyWeak(&v17, &location);
  [v11 addInvalidationBlock:&v13];
  -[FCUIFocusEnablementIndicatorBannerManager _postActivity:enabled:forPreviewing:withOptions:](self, "_postActivity:enabled:forPreviewing:withOptions:", v9, v7, 1, 1, v13, v14, v15, v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __125__FCUIFocusEnablementIndicatorBannerManager_postPersistentActivity_enabled_systemApertureElementProvider_pickerPresentation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained revokeWithReason:v4];
}

- (void)_postActivity:(id)a3 enabled:(BOOL)a4 forPreviewing:(BOOL)a5 withOptions:(unint64_t)a6
{
  unsigned int v24 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v25 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v22 = self;
  id v8 = self->_activeFlankingPresentables;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      uint64_t v14 = objc_msgSend(v13, "activityDescription", v22);
      v15 = [v14 activityUniqueIdentifier];
      v16 = [v25 activityUniqueIdentifier];
      int v17 = [v15 isEqual:v16];

      if (v17)
      {
        a5 = [v13 isForPreviewing];
        if ([v13 isActivityEnabled] == v24) {
          break;
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    v18 = [FCUIFocusEnablementIndicatorBannerPresentable alloc];
    v19 = [(id)objc_opt_class() _flankingBannerRequesterIdentifier];
    id v8 = [(FCUIFocusEnablementIndicatorBannerPresentable *)v18 initWithActivityDescription:v25 requesterIdentifier:v19 enabled:v24 forPreviewing:a5];

    [(FCUIFocusEnablementIndicatorBannerManager *)v22 _addActivePresentable:v8];
    v20 = [MEMORY[0x263EFF9A0] dictionaryWithObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F797B0]];
    v21 = v20;
    if (a5) {
      [v20 setObject:&unk_26D1C0350 forKey:*MEMORY[0x263F797A8]];
    }
    -[BNPosting postPresentable:withOptions:userInfo:error:](v22->_bannerPoster, "postPresentable:withOptions:userInfo:error:", v8, a6, v21, 0, v22);
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v10 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v7 = v10;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = v7;

  int v9 = [v8 isForPreviewing];
  if (v9) {
    [(FCUIFocusEnablementIndicatorBannerManager *)self _removeFlankingPresentable:v10];
  }
}

+ (id)_flankingBannerRequesterIdentifier
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__FCUIFocusEnablementIndicatorBannerManager__flankingBannerRequesterIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_flankingBannerRequesterIdentifier_onceToken != -1) {
    dispatch_once(&_flankingBannerRequesterIdentifier_onceToken, block);
  }
  v2 = (void *)_flankingBannerRequesterIdentifier___flankingBannerRequesterIdentifier;
  return v2;
}

void __79__FCUIFocusEnablementIndicatorBannerManager__flankingBannerRequesterIdentifier__block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x263F086E0] bundleForClass:*(void *)(a1 + 32)];
  v2 = [v6 bundleIdentifier];
  v3 = NSStringFromClass(*(Class *)(a1 + 32));
  uint64_t v4 = [v2 stringByAppendingString:v3];
  id v5 = (void *)_flankingBannerRequesterIdentifier___flankingBannerRequesterIdentifier;
  _flankingBannerRequesterIdentifier___flankingBannerRequesterIdentifier = v4;
}

- (void)_addActivePresentable:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    uint64_t v4 = self;
    objc_sync_enter(v4);
    activeFlankingPresentables = v4->_activeFlankingPresentables;
    if (!activeFlankingPresentables)
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      BOOL v7 = v4->_activeFlankingPresentables;
      v4->_activeFlankingPresentables = v6;

      activeFlankingPresentables = v4->_activeFlankingPresentables;
    }
    [(NSMutableArray *)activeFlankingPresentables addObject:v8];
    [v8 addPresentableObserver:v4];
    objc_sync_exit(v4);
  }
}

- (void)_removeFlankingPresentable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    [v7 removePresentableObserver:v5];
    [(FCUIFocusEnablementIndicatorBannerManager *)v5 _invalidateDismissTimerForPresentable:v7];
    [(NSMutableArray *)v5->_activeFlankingPresentables removeObject:v7];
    if (![(NSMutableArray *)v5->_activeFlankingPresentables count])
    {
      activeFlankingPresentables = v5->_activeFlankingPresentables;
      v5->_activeFlankingPresentables = 0;
    }
    objc_sync_exit(v5);

    id v4 = v7;
  }
}

- (void)_scheduleDismissTimerForPresentable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMapTable *)v5->_flankingBannersToDismissTimers objectForKey:v4];
    if (!v6)
    {
      objc_initWeak(&location, v5);
      id v7 = (void *)MEMORY[0x263EFFA20];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __81__FCUIFocusEnablementIndicatorBannerManager__scheduleDismissTimerForPresentable___block_invoke;
      v12[3] = &unk_264542DE8;
      objc_copyWeak(&v14, &location);
      id v8 = v4;
      id v13 = v8;
      id v6 = [v7 scheduledTimerWithTimeInterval:0 repeats:v12 block:6.0];
      flankingBannersToDismissTimers = v5->_flankingBannersToDismissTimers;
      if (!flankingBannersToDismissTimers)
      {
        uint64_t v10 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
        uint64_t v11 = v5->_flankingBannersToDismissTimers;
        v5->_flankingBannersToDismissTimers = (NSMapTable *)v10;

        flankingBannersToDismissTimers = v5->_flankingBannersToDismissTimers;
      }
      [(NSMapTable *)flankingBannersToDismissTimers setObject:v6 forKey:v8];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }

    objc_sync_exit(v5);
  }
}

void __81__FCUIFocusEnablementIndicatorBannerManager__scheduleDismissTimerForPresentable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidateDismissTimerForPresentable:*(void *)(a1 + 32)];
  v2 = [WeakRetained _bannerPoster];
  v3 = [MEMORY[0x263F29B50] uniqueIdentificationForPresentable:*(void *)(a1 + 32)];
  id v4 = (id)[v2 revokePresentablesWithIdentification:v3 reason:@"Revoking for dismiss timer" options:0 userInfo:0 error:0];
}

- (void)_invalidateDismissTimerForPresentable:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMapTable *)v5->_flankingBannersToDismissTimers objectForKey:v8];
    [v6 invalidate];
    [(NSMapTable *)v5->_flankingBannersToDismissTimers removeObjectForKey:v8];
    if (![(NSMapTable *)v5->_flankingBannersToDismissTimers count])
    {
      flankingBannersToDismissTimers = v5->_flankingBannersToDismissTimers;
      v5->_flankingBannersToDismissTimers = 0;
    }
    objc_sync_exit(v5);

    id v4 = v8;
  }
}

- (BNPosting)_bannerPoster
{
  return self->_bannerPoster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerPoster, 0);
  objc_storeStrong((id *)&self->_flankingBannersToDismissTimers, 0);
  objc_storeStrong((id *)&self->_activeFlankingPresentables, 0);
}

@end