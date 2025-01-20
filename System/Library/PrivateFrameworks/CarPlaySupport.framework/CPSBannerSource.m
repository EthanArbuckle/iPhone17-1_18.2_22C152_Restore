@interface CPSBannerSource
- (BNBannerSource)bannerKitSource;
- (BOOL)active;
- (BOOL)isRateLimited;
- (CPBannerDelegate)delegate;
- (CPSApplicationStateMonitor)applicationStateMonitor;
- (CPSBannerSource)initWithBundleIdentifier:(id)a3 delegate:(id)a4 applicationStateMonitor:(id)a5;
- (CPSBannerViewController)presentedBannerViewController;
- (NSString)bundleIdentifier;
- (NSTimer)dimissTimer;
- (NSTimer)lastUserDismissedIdentifierResetTimer;
- (NSUUID)lastUserDismissedIdentifier;
- (void)_dismissTimerFired:(id)a3;
- (void)_enqueueBannerItem:(id)a3;
- (void)_flushQueue;
- (void)_postBannerRequestForBannerItem:(id)a3;
- (void)_resetDismissTimer;
- (void)_resetLastUserDismissedIdentifierTimer;
- (void)_resetLastUserDismissedIdentifierTimerFired:(id)a3;
- (void)_revokePresentedBannerWithReason:(id)a3;
- (void)_setBannerRateLimitEnabled:(BOOL)a3 bundleIdentifier:(id)a4;
- (void)applicationStateMonitor:(id)a3 didBecomeActive:(BOOL)a4;
- (void)bannerViewController:(id)a3 requestsDismissalWithReason:(id)a4;
- (void)bannerViewControllerDidAppearWithIdentifier:(id)a3;
- (void)bannerViewControllerDidDisappearWithIdentifier:(id)a3;
- (void)bannerViewControllerTappedWithIdentifier:(id)a3;
- (void)invalidate;
- (void)postBannerForManeuver:(id)a3 travelEstimates:(id)a4;
- (void)postBannerForNavigationAlert:(id)a3;
- (void)sendSuggestUI:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setApplicationStateMonitor:(id)a3;
- (void)setBannerKitSource:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimissTimer:(id)a3;
- (void)setLastUserDismissedIdentifier:(id)a3;
- (void)setLastUserDismissedIdentifierResetTimer:(id)a3;
- (void)setPresentedBannerViewController:(id)a3;
- (void)setRateLimited:(BOOL)a3;
@end

@implementation CPSBannerSource

- (CPSBannerSource)initWithBundleIdentifier:(id)a3 delegate:(id)a4 applicationStateMonitor:(id)a5
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  v5 = v20;
  v20 = 0;
  v16.receiver = v5;
  v16.super_class = (Class)CPSBannerSource;
  v20 = [(CPSBannerSource *)&v16 init];
  objc_storeStrong((id *)&v20, v20);
  if (v20)
  {
    objc_storeWeak((id *)&v20->_delegate, v18);
    objc_storeStrong((id *)&v20->_applicationStateMonitor, v17);
    [(CPSApplicationStateMonitor *)v20->_applicationStateMonitor addApplicationStateObserver:v20];
    uint64_t v6 = [location[0] copy];
    bundleIdentifier = v20->_bundleIdentifier;
    v20->_bundleIdentifier = (NSString *)v6;

    id v15 = CPSRequesterIdentifierForBundleIdentifier(v20->_bundleIdentifier);
    v8 = (BNBannerSource *)(id)[MEMORY[0x263F29B20] bannerSourceForDestination:1 forRequesterIdentifier:v15];
    bannerKitSource = v20->_bannerKitSource;
    v20->_bannerKitSource = v8;

    char v10 = [v17 isApplicationActive];
    v20->_active = v10 & 1;
    objc_storeStrong(&v15, 0);
  }
  v12 = v20;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v12;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      [(CPSBannerSource *)self _flushQueue];
    }
  }
}

- (void)invalidate
{
  v2 = [(CPSBannerSource *)self bannerKitSource];
  [(BNBannerSource *)v2 invalidate];
}

- (void)applicationStateMonitor:(id)a3 didBecomeActive:(BOOL)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v13 = a4;
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __59__CPSBannerSource_applicationStateMonitor_didBecomeActive___block_invoke;
  char v10 = &unk_2648A4748;
  v11 = v15;
  BOOL v12 = v13;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

uint64_t __59__CPSBannerSource_applicationStateMonitor_didBecomeActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActive:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)postBannerForManeuver:(id)a3 travelEstimates:(id)a4
{
  objc_super v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __57__CPSBannerSource_postBannerForManeuver_travelEstimates___block_invoke;
  char v10 = &unk_2648A4AD0;
  v11 = v16;
  id v12 = v14;
  id v13 = location[0];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __57__CPSBannerSource_postBannerForManeuver_travelEstimates___block_invoke(id *a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v38[2] = a1;
  v38[1] = a1;
  id v24 = (id)[a1[4] applicationStateMonitor];
  char v25 = [v24 isApplicationActive];

  if ((v25 & 1) == 0)
  {
    id v22 = (id)[a1[5] distanceRemaining];
    char v36 = 0;
    char v34 = 0;
    if (v22)
    {
      id v21 = v22;
    }
    else
    {
      id v37 = (id)[a1[6] initialTravelEstimates];
      char v36 = 1;
      id v35 = (id)[v37 distanceRemaining];
      char v34 = 1;
      id v21 = v35;
    }
    v38[0] = v21;
    if (v34) {

    }
    if (v36) {
    id v33 = 0;
    }
    id v32 = 0;
    id v31 = 0;
    id v20 = (id)[a1[6] notificationAttributedInstructionVariants];

    if (v20)
    {
      id v1 = (id)[a1[6] notificationAttributedInstructionVariants];
      id v2 = v31;
      id v31 = v1;
    }
    else
    {
      id v19 = (id)[a1[6] notificationInstructionVariants];

      if (v19)
      {
        id v3 = (id)[a1[6] notificationInstructionVariants];
        id v4 = v32;
        id v32 = v3;
      }
      else
      {
        id v18 = (id)[a1[6] attributedInstructionVariants];

        if (v18)
        {
          id v5 = (id)[a1[6] attributedInstructionVariants];
          id v6 = v31;
          id v31 = v5;
        }
        else
        {
          id v7 = (id)[a1[6] instructionVariants];
          id v6 = v32;
          id v32 = v7;
        }
      }
    }
    if (v38[0])
    {
      objc_super v16 = (void *)MEMORY[0x263EFF8C0];
      id v17 = CPSFormattedDistanceWithMediumUnit(v38[0]);
      id v8 = (id)[v16 arrayWithObjects:0];
      id v9 = v33;
      id v33 = v8;
    }
    id v15 = (id)[a1[6] notificationSymbolImageSet];
    char v28 = 0;
    if (v15)
    {
      id v14 = v15;
    }
    else
    {
      id v29 = (id)[a1[6] symbolSet];
      char v28 = 1;
      id v14 = v29;
    }
    id v30 = v14;
    if (v28) {

    }
    v11 = [CPSBannerItem alloc];
    id v13 = (id)[a1[6] identifier];
    id v12 = (id)[a1[4] bundleIdentifier];
    LOBYTE(v10) = 1;
    v27 = -[CPSBannerItem initWithIdentifier:bundleIdentifier:textVariants:detailTextVariants:attributedDetailTextVariants:imageSet:isManeuverItem:](v11, "initWithIdentifier:bundleIdentifier:textVariants:detailTextVariants:attributedDetailTextVariants:imageSet:isManeuverItem:", v13, v10);

    id location = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v39, (uint64_t)a1[6]);
      _os_log_impl(&dword_22B689000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "Enqueuing #banner item for maneuver: %{public}@", v39, 0xCu);
    }
    objc_storeStrong(&location, 0);
    [a1[4] _enqueueBannerItem:v27];
    objc_storeStrong((id *)&v27, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong(v38, 0);
  }
}

- (void)postBannerForNavigationAlert:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __48__CPSBannerSource_postBannerForNavigationAlert___block_invoke;
  id v8 = &unk_2648A3990;
  id v9 = location[0];
  uint64_t v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __48__CPSBannerSource_postBannerForNavigationAlert___block_invoke(id *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v10[2] = a1;
  v10[1] = a1;
  id v3 = [CPSBannerItem alloc];
  id v8 = (id)[a1[4] identifier];
  id v7 = (id)[a1[5] bundleIdentifier];
  id v6 = (id)[a1[4] titleVariants];
  id v5 = (id)[a1[4] subtitleVariants];
  id v4 = (id)[a1[4] imageSet];
  LOBYTE(v1) = 0;
  v10[0] = -[CPSBannerItem initWithIdentifier:bundleIdentifier:textVariants:detailTextVariants:attributedDetailTextVariants:imageSet:isManeuverItem:](v3, "initWithIdentifier:bundleIdentifier:textVariants:detailTextVariants:attributedDetailTextVariants:imageSet:isManeuverItem:", v8, v7, v6, v5, 0, v1);

  id location = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v11, (uint64_t)a1[4]);
    _os_log_impl(&dword_22B689000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "Enqueuing #banner item for navigation alert: %{public}@", v11, 0xCu);
  }
  objc_storeStrong(&location, 0);
  [a1[5] _enqueueBannerItem:v10[0]];
  objc_storeStrong(v10, 0);
}

- (void)bannerViewController:(id)a3 requestsDismissalWithReason:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v4 = [(CPSBannerSource *)v9 presentedBannerViewController];
  BOOL v6 = v4 != location[0];

  if (!v6) {
    [(CPSBannerSource *)v9 _revokePresentedBannerWithReason:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)bannerViewControllerTappedWithIdentifier:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(CPSBannerSource *)v7 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v3 = [(CPSBannerSource *)v7 delegate];
    [(CPBannerDelegate *)v3 bannerTappedWithIdentifier:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)bannerViewControllerDidAppearWithIdentifier:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v12 = [(CPSBannerSource *)v15 delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v10 = [(CPSBannerSource *)v15 presentedBannerViewController];
    id v9 = [(CPSBannerViewController *)v10 bannerItem];
    BOOL v11 = [(CPSBannerItem *)v9 isManeuverItem];

    if (v11)
    {
      id v4 = v15;
      id v8 = (id)[NSURL URLWithString:@"maps:/car/instrumentcluster/instructioncard"];
      v16[0] = v8;
      id v7 = (id)[NSURL URLWithString:@"maps:/car/instrumentcluster/map"];
      v16[1] = v7;
      id v6 = (id)[NSURL URLWithString:@"maps:/car/instrumentcluster"];
      v16[2] = v6;
      id v5 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
      -[CPSBannerSource sendSuggestUI:](v4, "sendSuggestUI:");
    }
    id v3 = [(CPSBannerSource *)v15 delegate];
    [(CPBannerDelegate *)v3 bannerDidAppearWithIdentifier:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)bannerViewControllerDidDisappearWithIdentifier:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = [(CPSBannerSource *)v22 presentedBannerViewController];
  id v17 = [(CPSBannerViewController *)v18 bannerItem];
  objc_super v16 = [(CPSBannerItem *)v17 identifier];
  char v19 = [(NSUUID *)v16 isEqual:location[0]];

  if (v19)
  {
    id v14 = [(CPSBannerSource *)v22 presentedBannerViewController];
    char v13 = [(CPSBannerViewController *)v14 bannerItem];
    BOOL v15 = [(CPSBannerItem *)v13 isManeuverItem];

    if (v15)
    {
      id v9 = v22;
      id v12 = (id)[NSURL URLWithString:@"maps:/car/instrumentcluster/map"];
      v24[0] = v12;
      id v11 = (id)[NSURL URLWithString:@"maps:/car/instrumentcluster"];
      v24[1] = v11;
      id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
      -[CPSBannerSource sendSuggestUI:](v9, "sendSuggestUI:");
    }
    id v20 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(CPSBannerSource *)v22 presentedBannerViewController];
      id v7 = [(CPSBannerViewController *)v8 bannerItem];
      id v6 = [(CPSBannerItem *)v7 bundleIdentifier];
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v23, (uint64_t)v6, (uint64_t)location[0]);
      _os_log_impl(&dword_22B689000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "%{public}@ #banner item (%{public}@) did disappear", v23, 0x16u);
    }
    objc_storeStrong(&v20, 0);
    [(CPSBannerSource *)v22 setPresentedBannerViewController:0];
  }
  id v4 = [(CPSBannerSource *)v22 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v3 = [(CPSBannerSource *)v22 delegate];
    [(CPBannerDelegate *)v3 bannerDidDisappearWithIdentifier:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)sendSuggestUI:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(CPSBannerSource *)v7 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v3 = [(CPSBannerSource *)v7 delegate];
    [(CPBannerDelegate *)v3 sendSuggestUI:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)_setBannerRateLimitEnabled:(BOOL)a3 bundleIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v22 = self;
  SEL v21 = a2;
  BOOL v20 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  int v6 = v20;
  if (v6 == [(CPSBannerSource *)v22 isRateLimited])
  {
    int v18 = 1;
  }
  else
  {
    [(CPSBannerSource *)v22 setRateLimited:v20];
    if (v20)
    {
      id v15 = CarPlaySupportGeneralLogging();
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v23, (uint64_t)location);
        _os_log_impl(&dword_22B689000, (os_log_t)v15, v14, "%{public}@ #banner rate limit enabled", v23, 0xCu);
      }
      objc_storeStrong(&v15, 0);
      dispatch_time_t when = dispatch_time(0, 1000000000);
      queue = MEMORY[0x263EF83A0];
      uint64_t v7 = MEMORY[0x263EF8330];
      int v8 = -1073741824;
      int v9 = 0;
      id v10 = __63__CPSBannerSource__setBannerRateLimitEnabled_bundleIdentifier___block_invoke;
      id v11 = &unk_2648A3990;
      id v12 = v22;
      id v13 = location;
      dispatch_after(when, queue, &v7);

      objc_storeStrong(&v13, 0);
      objc_storeStrong((id *)&v12, 0);
    }
    else
    {
      id v17 = CarPlaySupportGeneralLogging();
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v24, (uint64_t)location);
        _os_log_impl(&dword_22B689000, (os_log_t)v17, v16, "%{public}@ #banner rate limit disabled", v24, 0xCu);
      }
      objc_storeStrong(&v17, 0);
    }
    int v18 = 0;
  }
  objc_storeStrong(&location, 0);
}

void __63__CPSBannerSource__setBannerRateLimitEnabled_bundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  [*(id *)(a1 + 32) _setBannerRateLimitEnabled:0 bundleIdentifier:*(void *)(a1 + 40)];
  oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v3, *(void *)(a1 + 40));
    _os_log_impl(&dword_22B689000, oslog[0], OS_LOG_TYPE_DEFAULT, "%{public}@ #banner rate limit disabled", v3, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (void)_enqueueBannerItem:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = [(CPSBannerSource *)v47 applicationStateMonitor];
  BOOL v31 = [(CPSApplicationStateMonitor *)v30 isApplicationActive];

  if (v31)
  {
    id v45 = CarPlaySupportGeneralLogging();
    os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = (id)[location[0] bundleIdentifier];
      id v28 = (id)[location[0] identifier];
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v53, (uint64_t)v29, (uint64_t)v28);
      _os_log_impl(&dword_22B689000, (os_log_t)v45, v44, "%{public}@ is frontmost, not enqueuing #banner item (%{public}@)", v53, 0x16u);
    }
    objc_storeStrong(&v45, 0);
LABEL_29:
    int v39 = 0;
    goto LABEL_30;
  }
  char v43 = 1;
  v27 = [(CPSBannerSource *)v47 presentedBannerViewController];

  if (!v27)
  {
LABEL_19:
    id v10 = (id)[location[0] identifier];
    int v9 = [(CPSBannerSource *)v47 lastUserDismissedIdentifier];
    char v11 = objc_msgSend(v10, "isEqual:");

    if (v11) {
      char v43 = 0;
    }
    if (v43)
    {
      if ([(CPSBannerSource *)v47 isRateLimited])
      {
        os_log_t v34 = (os_log_t)CarPlaySupportGeneralLogging();
        os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = (id)[location[0] bundleIdentifier];
          id v7 = (id)[location[0] identifier];
          __os_log_helper_16_2_2_8_66_8_66((uint64_t)v49, (uint64_t)v8, (uint64_t)v7);
          _os_log_impl(&dword_22B689000, v34, v33, "%{public}@ is background but rate limited, not enqueuing #banner item (%{public}@)", v49, 0x16u);
        }
        objc_storeStrong((id *)&v34, 0);
      }
      else
      {
        os_log_t v32 = (os_log_t)CarPlaySupportGeneralLogging();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = (id)[location[0] bundleIdentifier];
          id v5 = (id)[location[0] identifier];
          __os_log_helper_16_2_2_8_66_8_66((uint64_t)v48, (uint64_t)v6, (uint64_t)v5);
          _os_log_impl(&dword_22B689000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ is not frontmost, enqueuing #banner item (%{public}@)", v48, 0x16u);
        }
        objc_storeStrong((id *)&v32, 0);
        [(CPSBannerSource *)v47 _postBannerRequestForBannerItem:location[0]];
        id v3 = v47;
        id v4 = (id)[location[0] bundleIdentifier];
        -[CPSBannerSource _setBannerRateLimitEnabled:bundleIdentifier:](v3, "_setBannerRateLimitEnabled:bundleIdentifier:", 1);
      }
    }
    goto LABEL_29;
  }
  SEL v21 = objc_opt_class();
  v23 = [(CPSBannerSource *)v47 presentedBannerViewController];
  id v22 = [(CPSBannerViewController *)v23 bannerItem];
  id v42 = CPSSafeCast_23(v21, v22);

  id v25 = (id)[v42 identifier];
  id v24 = (id)[location[0] identifier];
  char v26 = objc_msgSend(v25, "isEqual:");

  if ((v26 & 1) == 0)
  {
    os_log_t v36 = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (id)[location[0] bundleIdentifier];
      id v12 = (id)[v42 identifier];
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v50, (uint64_t)v13, (uint64_t)v12);
      _os_log_impl(&dword_22B689000, v36, v35, "%{public}@ is background, revoking presented #banner (%{public}@)", v50, 0x16u);
    }
    objc_storeStrong((id *)&v36, 0);
    [(CPSBannerSource *)v47 _revokePresentedBannerWithReason:@"BannerReplaced"];
    goto LABEL_17;
  }
  if (![(CPSBannerSource *)v47 isRateLimited])
  {
    char v43 = 0;
    os_log_type_t v16 = [(CPSBannerSource *)v47 presentedBannerViewController];
    [(CPSBannerViewController *)v16 updateBannerWithBannerItem:location[0]];

    id v17 = v47;
    id v18 = (id)[location[0] bundleIdentifier];
    -[CPSBannerSource _setBannerRateLimitEnabled:bundleIdentifier:](v17, "_setBannerRateLimitEnabled:bundleIdentifier:", 1);

    [(CPSBannerSource *)v47 _resetDismissTimer];
    os_log_t v38 = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (id)[location[0] bundleIdentifier];
      id v14 = (id)[location[0] identifier];
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v51, (uint64_t)v15, (uint64_t)v14);
      _os_log_impl(&dword_22B689000, v38, v37, "%{public}@ is background, #banner item (%{public}@)is being updated", v51, 0x16u);
    }
    objc_storeStrong((id *)&v38, 0);
LABEL_17:
    int v39 = 0;
    goto LABEL_18;
  }
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = (id)[location[0] bundleIdentifier];
    id v19 = (id)[location[0] identifier];
    __os_log_helper_16_2_2_8_66_8_66((uint64_t)v52, (uint64_t)v20, (uint64_t)v19);
    _os_log_impl(&dword_22B689000, oslog, v40, "%{public}@ is background but rate limited, not updating #banner item (%{public}@)", v52, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  int v39 = 1;
LABEL_18:
  objc_storeStrong(&v42, 0);
  if (!v39) {
    goto LABEL_19;
  }
LABEL_30:
  objc_storeStrong(location, 0);
}

- (void)_postBannerRequestForBannerItem:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  BOOL v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  id v14 = [(CPSBannerSource *)v31 bannerKitSource];
  id v27 = 0;
  id v13 = (id)[(BNBannerSource *)v14 layoutDescriptionWithError:&v27];
  objc_storeStrong(&v29, v27);
  id v28 = v13;

  if (v28)
  {
    id v26 = [[CPSBannerViewController alloc] initWithBannerItem:location[0]];
    [v26 setDelegate:v31];
    [v28 presentationSize];
    double v22 = v3;
    double v23 = v4;
    [v28 containerSize];
    v21[1] = v5;
    v21[2] = v6;
    objc_msgSend(v26, "preferredContentSizeWithPresentationSize:containerSize:", v22, v23, *(double *)&v5, *(double *)&v6);
    double v24 = v7;
    double v25 = v8;
    objc_msgSend(v26, "setPreferredContentSize:", v7, v8);
    [(CPSBannerSource *)v31 setPresentedBannerViewController:v26];
    v21[0] = 0;
    char v11 = [(CPSBannerSource *)v31 bannerKitSource];
    id v20 = 0;
    char v12 = [(BNBannerSource *)v11 postPresentable:v26 options:1 userInfo:0 error:&v20];
    objc_storeStrong(v21, v20);

    if (v12)
    {
      id v19 = CarPlaySupportGeneralLogging();
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = (id)[location[0] bundleIdentifier];
        id v9 = (id)[location[0] identifier];
        __os_log_helper_16_2_2_8_66_8_66((uint64_t)v34, (uint64_t)v10, (uint64_t)v9);
        _os_log_impl(&dword_22B689000, (os_log_t)v19, v18, "%{public}@ Posted request for #banner item (%{public}@)", v34, 0x16u);
      }
      objc_storeStrong(&v19, 0);
      [(CPSBannerSource *)v31 _resetDismissTimer];
    }
    else
    {
      os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v33, (uint64_t)v21[0]);
        _os_log_error_impl(&dword_22B689000, oslog, v16, "Error attempting to post request for #banner item: %{public}@", v33, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(v21, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    os_log_t v15 = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v32, (uint64_t)v29);
      _os_log_error_impl(&dword_22B689000, v15, OS_LOG_TYPE_ERROR, "Error requesting layout description from #banner source: %{public}@", v32, 0xCu);
    }
    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)_revokePresentedBannerWithReason:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  double v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  id v19 = [(CPSBannerSource *)v22 presentedBannerViewController];
  id v18 = CarPlaySupportGeneralLogging();
  os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (id)[v19 bannerItem];
    id v12 = (id)[v13 bundleIdentifier];
    id v11 = (id)[v19 bannerItem];
    id v10 = (id)[v11 identifier];
    __os_log_helper_16_2_3_8_66_8_66_8_66((uint64_t)v25, (uint64_t)v12, (uint64_t)v10, (uint64_t)location[0]);
    _os_log_impl(&dword_22B689000, (os_log_t)v18, v17, "%{public}@ Revoking presentable for #banner item (%{public}@) with reason: %{public}@", v25, 0x20u);
  }
  objc_storeStrong(&v18, 0);
  double v8 = [(CPSBannerSource *)v22 bannerKitSource];
  id v7 = (id)[v19 requestIdentifier];
  v16[1] = 0;
  char v9 = -[BNBannerSource revokePresentableWithRequestIdentifier:animated:reason:userInfo:error:](v8, "revokePresentableWithRequestIdentifier:animated:reason:userInfo:error:");
  objc_storeStrong(&v20, 0);

  if (v9)
  {
    v16[0] = CarPlaySupportGeneralLogging();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v16[0], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (id)[v19 bannerItem];
      id v5 = (id)[v6 bundleIdentifier];
      id v4 = (id)[v19 bannerItem];
      id v3 = (id)[v4 identifier];
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v24, (uint64_t)v5, (uint64_t)v3);
      _os_log_impl(&dword_22B689000, (os_log_t)v16[0], v15, "%{public}@ Revoked presentable for #banner item (%{public}@)", v24, 0x16u);
    }
    objc_storeStrong(v16, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v23, (uint64_t)v20);
      _os_log_error_impl(&dword_22B689000, oslog, OS_LOG_TYPE_ERROR, "Error attempting to revoke presentable for #banner item: %{public}@", v23, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)_flushQueue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  os_log_type_t v17 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  char v15 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    os_log_type_t type = v15;
    __os_log_helper_16_0_0(v14);
    _os_log_debug_impl(&dword_22B689000, log, type, "Flushing banner queue", v14, 2u);
  }
  objc_storeStrong(location, 0);
  id v13 = 0;
  id v4 = [(CPSBannerSource *)v17 bannerKitSource];
  id v12 = 0;
  id v5 = (id)[(BNBannerSource *)v4 revokeAllPresentablesWithReason:@"FlushQueue" userInfo:0 error:&v12];
  objc_storeStrong(&v13, v12);

  if (v5)
  {
    id v11 = CarPlaySupportGeneralLogging();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      id v2 = v11;
      os_log_type_t v3 = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_impl(&dword_22B689000, v2, v3, "Flushed #banner source", v9, 2u);
    }
    objc_storeStrong(&v11, 0);
  }
  else
  {
    id v8 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v18, (uint64_t)v13);
      _os_log_error_impl(&dword_22B689000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "Error flushing #banner source: %{public}@", v18, 0xCu);
    }
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(&v13, 0);
}

- (void)_resetDismissTimer
{
  id v2 = [(CPSBannerSource *)self dimissTimer];
  [(NSTimer *)v2 invalidate];

  id v3 = (id)[MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__dismissTimerFired_ selector:0 userInfo:0 repeats:10.0];
  -[CPSBannerSource setDimissTimer:](self, "setDimissTimer:");
}

- (void)_dismissTimerFired:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(CPSBannerSource *)v5 presentedBannerViewController];

  if (v3) {
    [(CPSBannerSource *)v5 _revokePresentedBannerWithReason:@"BannerExpired"];
  }
  objc_storeStrong(location, 0);
}

- (void)_resetLastUserDismissedIdentifierTimer
{
  id v2 = [(CPSBannerSource *)self lastUserDismissedIdentifierResetTimer];
  [(NSTimer *)v2 invalidate];

  id v3 = (id)[MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__resetLastUserDismissedIdentifierTimerFired_ selector:0 userInfo:0 repeats:30.0];
  -[CPSBannerSource setLastUserDismissedIdentifierResetTimer:](self, "setLastUserDismissedIdentifierResetTimer:");
}

- (void)_resetLastUserDismissedIdentifierTimerFired:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSBannerSource *)v4 setLastUserDismissedIdentifier:0];
  objc_storeStrong(location, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (CPBannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPBannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CPSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
}

- (BNBannerSource)bannerKitSource
{
  return self->_bannerKitSource;
}

- (void)setBannerKitSource:(id)a3
{
}

- (CPSBannerViewController)presentedBannerViewController
{
  return self->_presentedBannerViewController;
}

- (void)setPresentedBannerViewController:(id)a3
{
}

- (NSTimer)dimissTimer
{
  return self->_dimissTimer;
}

- (void)setDimissTimer:(id)a3
{
}

- (BOOL)isRateLimited
{
  return self->_rateLimited;
}

- (void)setRateLimited:(BOOL)a3
{
  self->_rateLimited = a3;
}

- (NSUUID)lastUserDismissedIdentifier
{
  return self->_lastUserDismissedIdentifier;
}

- (void)setLastUserDismissedIdentifier:(id)a3
{
}

- (NSTimer)lastUserDismissedIdentifierResetTimer
{
  return self->_lastUserDismissedIdentifierResetTimer;
}

- (void)setLastUserDismissedIdentifierResetTimer:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
}

@end