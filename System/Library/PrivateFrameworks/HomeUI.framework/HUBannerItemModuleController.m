@interface HUBannerItemModuleController
- (AMSUIUpdateMultiUserTokenTask)multiUserTokenFixTask;
- (BOOL)hasTapActionForItem:(id)a3;
- (Class)collectionCellClassForItem:(id)a3;
- (HUBannerItemModuleController)initWithModule:(id)a3;
- (HUBannerItemModuleController)initWithModule:(id)a3 host:(id)a4 delegate:(id)a5;
- (HUBannerItemModuleControllerDelegate)delegate;
- (HUGridLayoutOptions)layoutOptions;
- (NAFuture)homeMediaAccountFuture;
- (UINavigationController)proxCardNavigationController;
- (id)_defaultCellLayoutOptionsForViewSize:(CGSize)a3;
- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4;
- (unint64_t)didSelectItem:(id)a3;
- (void)_sendBannerInteractionforItem:(id)a3 tappedBannerItemOverrideClassName:(id)a4;
- (void)bannerView:(id)a3 dismissButtonTapped:(id)a4;
- (void)configureCell:(id)a3 forItem:(id)a4;
- (void)dealloc;
- (void)dismissCameraUpgradeBanner;
- (void)fetchMediaAccountForHome:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeMediaAccountFuture:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setMultiUserTokenFixTask:(id)a3;
- (void)setProxCardNavigationController:(id)a3;
- (void)upgradeCameraSelected;
- (void)user:(id)a3 didUpdateNeedsiTunesMultiUserRepair:(BOOL)a4;
@end

@implementation HUBannerItemModuleController

- (HUBannerItemModuleController)initWithModule:(id)a3 host:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  id v12 = v8;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    v14 = v12;
    if (v13) {
      goto LABEL_8;
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v15 handleFailureInFunction:v16, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v11, objc_opt_class() file lineNumber description];
  }
  v14 = 0;
LABEL_8:

  v30.receiver = self;
  v30.super_class = (Class)HUBannerItemModuleController;
  v17 = [(HUItemModuleController *)&v30 initWithModule:v12];
  v18 = v17;
  if (v17)
  {
    [(HUItemModuleController *)v17 setHost:v9];
    [(HUBannerItemModuleController *)v18 setDelegate:v10];
    v19 = [(HUItemModuleController *)v18 host];
    v20 = [v19 presentingViewControllerForModuleController:v18];

    v21 = [v20 view];
    [v21 frame];
    uint64_t v24 = -[HUBannerItemModuleController _defaultCellLayoutOptionsForViewSize:](v18, "_defaultCellLayoutOptionsForViewSize:", v22, v23);
    layoutOptions = v18->_layoutOptions;
    v18->_layoutOptions = (HUGridLayoutOptions *)v24;

    v26 = [v12 context];
    v27 = [v26 home];
    [(HUBannerItemModuleController *)v18 fetchMediaAccountForHome:v27];

    v28 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v28 addUserObserver:v18];
  }
  return v18;
}

- (void)setDelegate:(id)a3
{
}

- (void)fetchMediaAccountForHome:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F69758] isAMac] & 1) == 0 && objc_msgSend(v5, "isMultiUserEnabled"))
  {
    objc_initWeak(&location, self);
    v6 = [MEMORY[0x1E4F68F00] sharedInstance];
    v7 = [v5 uniqueIdentifier];
    id v8 = [v7 UUIDString];
    id v9 = [v6 mediaAccountForHomeIdentifier:v8];

    if (v9)
    {
      id v10 = [(HUItemModuleController *)self module];
      uint64_t v11 = [v10 bannerItemProvider];
      id v12 = [v11 multiUserTokenFixBannerItem];
      [v12 setHomeMediaAccount:v9];
    }
    else
    {
      v13 = [MEMORY[0x1E4F68F00] sharedInstance];
      v14 = [v13 executeHomeMediaAccountFetchForHome:v5];
      [(HUBannerItemModuleController *)self setHomeMediaAccountFuture:v14];

      v15 = [(HUBannerItemModuleController *)self homeMediaAccountFuture];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __57__HUBannerItemModuleController_fetchMediaAccountForHome___block_invoke;
      v25[3] = &unk_1E6386978;
      SEL v27 = a2;
      id v16 = v5;
      id v26 = v16;
      id v17 = (id)[v15 addFailureBlock:v25];

      v18 = [(HUBannerItemModuleController *)self homeMediaAccountFuture];
      v19 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
      v20 = [v18 reschedule:v19];

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __57__HUBannerItemModuleController_fetchMediaAccountForHome___block_invoke_165;
      v22[3] = &unk_1E638B1C8;
      objc_copyWeak(v24, &location);
      v24[1] = (id)a2;
      id v23 = v16;
      id v21 = (id)[v20 addSuccessBlock:v22];

      objc_destroyWeak(v24);
      id v10 = v26;
    }

    objc_destroyWeak(&location);
  }
}

- (NAFuture)homeMediaAccountFuture
{
  return self->_homeMediaAccountFuture;
}

- (void)setHomeMediaAccountFuture:(id)a3
{
}

- (id)_defaultCellLayoutOptionsForViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = [MEMORY[0x1E4F69758] isAMac];
  if ([MEMORY[0x1E4F69758] useMacIdiom]) {
    v6 = &unk_1F19B45E0;
  }
  else {
    v6 = 0;
  }
  v7 = +[HUGridLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", v5, v6, width, height);
  [v7 setStatusHidden:0];
  id v8 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:0];
  id v9 = [v8 preferredContentSizeCategory];
  [v7 setContentSizeCategory:v9];

  [v7 setEditing:0];
  [v7 setSectionLeadingMargin:0.0];
  [v7 setSectionTrailingMargin:0.0];

  return v7;
}

void __57__HUBannerItemModuleController_fetchMediaAccountForHome___block_invoke_165(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v27 = 138412546;
    v28 = v6;
    __int16 v29 = 2112;
    id v30 = v3;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@ Setting media account for home with identifier [%@]", (uint8_t *)&v27, 0x16u);
  }
  v7 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v8 = [v7 UUIDString];
  id v9 = [v3 objectForKeyedSubscript:v8];

  id v10 = [WeakRetained module];
  uint64_t v11 = [v10 bannerItemProvider];
  id v12 = [v11 multiUserTokenFixBannerItem];
  [v12 setHomeMediaAccount:v9];

  v13 = [WeakRetained module];
  v14 = [v13 itemUpdater];
  v15 = [v14 firstFullItemUpdateFuture];
  int v16 = [v15 isFinished];

  if (v16)
  {
    id v17 = (void *)MEMORY[0x1E4F69230];
    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v19 = [WeakRetained module];
    v20 = [v19 bannerItemProvider];
    id v21 = [v20 multiUserTokenFixBannerItem];
    double v22 = objc_msgSend(v18, "na_setWithSafeObject:", v21);
    id v23 = [v17 requestToUpdateItems:v22 senderSelector:*(void *)(a1 + 48)];

    uint64_t v24 = [WeakRetained module];
    v25 = [v24 itemUpdater];
    id v26 = (id)[v25 performItemUpdateRequest:v23];
  }
}

- (HUBannerItemModuleController)initWithModule:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithModule_host_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUBannerItemModuleController.m", 51, @"%s is unavailable; use %@ instead",
    "-[HUBannerItemModuleController initWithModule:]",
    v6);

  return 0;
}

- (void)dealloc
{
  id v3 = [(HUBannerItemModuleController *)self homeMediaAccountFuture];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)HUBannerItemModuleController;
  [(HUBannerItemModuleController *)&v4 dealloc];
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(MEMORY[0x1E4F69758], "isAnIPad", a3, a4))
  {
    objc_opt_class();
    uint64_t v5 = [(HUItemModuleController *)self host];
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    id v8 = [MEMORY[0x1E4F42948] currentDevice];
    if ((unint64_t)([v8 orientation] - 1) >= 2) {
      double v9 = 0.75;
    }
    else {
      double v9 = 0.67;
    }

    id v10 = [v7 view];
    [v10 bounds];
    double v12 = v11;
    v13 = [v7 view];

    [v13 bounds];
    double v15 = v12 / v14;

    int v16 = (void *)MEMORY[0x1E4F42608];
    if (v15 >= v9)
    {
      int v17 = 0;
      double v18 = 0.5;
      goto LABEL_12;
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x1E4F42608];
  }
  double v18 = 1.0;
  int v17 = 1;
LABEL_12:
  v19 = [v16 fractionalWidthDimension:v18];
  v20 = (void *)MEMORY[0x1E4F42638];
  id v21 = [MEMORY[0x1E4F42608] estimatedDimension:160.0];
  double v22 = [v20 sizeWithWidthDimension:v19 heightDimension:v21];

  id v23 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v22];
  uint64_t v24 = (void *)MEMORY[0x1E4F42638];
  v25 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  id v26 = [v22 heightDimension];
  int v27 = [v24 sizeWithWidthDimension:v25 heightDimension:v26];

  v28 = (void *)MEMORY[0x1E4F42618];
  if (v17)
  {
    v48[0] = v23;
    __int16 v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    id v30 = [v28 horizontalGroupWithLayoutSize:v27 subitems:v29];
  }
  else
  {
    id v30 = [MEMORY[0x1E4F42618] horizontalGroupWithLayoutSize:v27 subitem:v23 count:2];
  }
  uint64_t v31 = (void *)MEMORY[0x1E4F42640];
  v32 = [(HUBannerItemModuleController *)self layoutOptions];
  [v32 columnSpacing];
  v33 = objc_msgSend(v31, "fixedSpacing:");
  [v30 setInterItemSpacing:v33];

  v34 = [MEMORY[0x1E4F42630] sectionWithGroup:v30];
  v35 = [(HUBannerItemModuleController *)self layoutOptions];
  [v35 rowSpacing];
  objc_msgSend(v34, "setInterGroupSpacing:");

  v36 = [(HUBannerItemModuleController *)self layoutOptions];
  [v36 sectionTopMargin];
  double v38 = v37;
  v39 = [(HUBannerItemModuleController *)self layoutOptions];
  [v39 sectionLeadingMargin];
  double v41 = v40;
  v42 = [(HUBannerItemModuleController *)self layoutOptions];
  [v42 sectionBottomMargin];
  double v44 = v43;
  v45 = [(HUBannerItemModuleController *)self layoutOptions];
  [v45 sectionTrailingMargin];
  objc_msgSend(v34, "setContentInsets:", v38, v41, v44, v46);

  return v34;
}

- (Class)collectionCellClassForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_9:
    objc_super v4 = objc_opt_class();
  }
  else
  {
    objc_super v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HUBannerItemModuleController;
  [(HUItemModuleController *)&v37 configureCell:v6 forItem:v7];
  id v8 = [(HUBannerItemModuleController *)self layoutOptions];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = objc_opt_class();
      id v21 = v6;
      if (v21)
      {
        if (objc_opt_isKindOfClass()) {
          double v22 = v21;
        }
        else {
          double v22 = 0;
        }
        double v12 = v21;
        if (v22) {
          goto LABEL_19;
        }
        id v23 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v24 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
        [v23 handleFailureInFunction:v24, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v20, objc_opt_class() file lineNumber description];
      }
      double v12 = 0;
LABEL_19:

      [v12 setDelegate:self];
      v25 = [v7 latestResults];
      id v26 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
      [v12 setAccessibilityIdentifier:v26];

      int v17 = [v8 welcomeUIBannerCellOptions];
      [v12 setLayoutOptions:v17];
      goto LABEL_20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_22;
    }
    uint64_t v27 = objc_opt_class();
    id v28 = v6;
    if (v28)
    {
      if (objc_opt_isKindOfClass()) {
        __int16 v29 = v28;
      }
      else {
        __int16 v29 = 0;
      }
      double v12 = v28;
      if (v29) {
        goto LABEL_31;
      }
      id v30 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v31 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v30 handleFailureInFunction:v31, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v27, objc_opt_class() file lineNumber description];
    }
    double v12 = 0;
LABEL_31:

    [v12 setDelegate:self];
    v32 = [v8 bannerCellOptions];
    [v12 setLayoutOptions:v32];

    v33 = [v7 latestResults];
    uint64_t v34 = *MEMORY[0x1E4F68928];
    v35 = [v33 objectForKeyedSubscript:*MEMORY[0x1E4F68928]];
    [v12 setAccessibilityIdentifier:v35];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    v36 = [v12 bannerView];
    [v36 setDisableHighlighting:1];

    int v16 = [v7 latestResults];
    int v17 = v16;
    uint64_t v18 = v34;
    goto LABEL_10;
  }
  uint64_t v9 = objc_opt_class();
  id v10 = v6;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      double v11 = v10;
    }
    else {
      double v11 = 0;
    }
    double v12 = v10;
    if (v11) {
      goto LABEL_9;
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    double v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v9, objc_opt_class() file lineNumber description];
  }
  double v12 = 0;
LABEL_9:

  [v12 setDelegate:self];
  double v15 = [v8 bannerCellOptions];
  [v12 setLayoutOptions:v15];

  int v16 = [v7 latestResults];
  int v17 = v16;
  uint64_t v18 = *MEMORY[0x1E4F68928];
LABEL_10:
  v19 = [v16 objectForKeyedSubscript:v18];
  [v12 setAccessibilityIdentifier:v19];

LABEL_20:
LABEL_21:

LABEL_22:
}

- (void)bannerView:(id)a3 dismissButtonTapped:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v33 = self;
    __int16 v34 = 2080;
    v35 = "-[HUBannerItemModuleController bannerView:dismissButtonTapped:]";
    __int16 v36 = 2112;
    id v37 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped dismiss button for %@", buf, 0x20u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F69710]);
  id v8 = [(HUItemModuleController *)self module];
  uint64_t v9 = [v8 context];
  id v10 = [v9 home];
  double v11 = [(HUItemModuleController *)self module];
  double v12 = [v11 context];
  v13 = [v12 home];
  double v14 = [v13 currentUser];
  double v15 = (void *)[v7 initWithHome:v10 user:v14 nameStyle:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = (id)[v15 setDismissedWelcomeUIBanner:1];
  }
  int v17 = (void *)MEMORY[0x1E4F69230];
  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  v19 = [v5 item];
  uint64_t v20 = objc_msgSend(v18, "na_setWithSafeObject:", v19);
  id v21 = [v17 requestToUpdateItems:v20 senderSelector:a2];

  double v22 = [(HUItemModuleController *)self module];
  id v23 = [v22 itemUpdater];
  id v24 = (id)[v23 performItemUpdateRequest:v21];

  v25 = NSString;
  id v26 = [v5 item];
  uint64_t v27 = (objc_class *)objc_opt_class();
  id v28 = NSStringFromClass(v27);
  __int16 v29 = [v25 stringWithFormat:@"%@-dismiss", v28];

  id v30 = [v5 item];
  [(HUBannerItemModuleController *)self _sendBannerInteractionforItem:v30 tappedBannerItemOverrideClassName:v29];
}

- (BOOL)hasTapActionForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v3 latestResults];
      id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68920]];
      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        id v7 = [v3 latestResults];
        id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68948]];
        BOOL v4 = v8 == 0;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }

  return v4;
}

- (unint64_t)didSelectItem:(id)a3
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v129 = self;
    __int16 v130 = 2080;
    v131 = "-[HUBannerItemModuleController didSelectItem:]";
    __int16 v132 = 2112;
    id v133 = v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped %@", buf, 0x20u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 latestResults];
    id v8 = [v7 objectForKeyedSubscript:@"HFResultSetupBannerType"];
    uint64_t v9 = [v8 unsignedIntegerValue];

    id v10 = [v5 latestResults];
    double v11 = [v10 objectForKeyedSubscript:@"HFResultKeyPathsForUnfinishedOnboardingFlows"];

    if ([v11 count])
    {
      v119 = [NSString stringWithFormat:@" for flows %@", v11];
    }
    else
    {
      v119 = &stru_1F18F92B8;
    }
    v47 = HFLogForCategory();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v129 = self;
      __int16 v130 = 2080;
      v131 = "-[HUBannerItemModuleController didSelectItem:]";
      __int16 v132 = 2112;
      id v133 = v5;
      __int16 v134 = 2112;
      v135 = v119;
      _os_log_impl(&dword_1BE345000, v47, OS_LOG_TYPE_DEFAULT, "(%@:%s) User tapped Setup Banner %@ %@", buf, 0x2Au);
    }

    if (v9 != 1)
    {
      if (v9)
      {
LABEL_62:

        goto LABEL_63;
      }
      id v48 = [MEMORY[0x1E4F1CA60] dictionary];
      [v48 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"OnboardingDisplayOption_OnboardingFromUserInput"];
      uint64_t v127 = *MEMORY[0x1E4F684D0];
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v127 count:1];
      uint64_t v50 = [v11 isEqualToArray:v49];

      v51 = [NSNumber numberWithBool:v50];
      [v48 setObject:v51 forKeyedSubscript:@"OnboardingDisplayOption_OnboardingFromNaturalLightingReminder"];

      v118 = [(HUItemModuleController *)self module];
      v52 = [v118 context];
      v53 = [v52 home];
      v54 = [(HUItemModuleController *)self host];
      id v55 = +[HUHomeFeatureOnboardingUtilities home:v53 onboardFeaturesForKeyPaths:v11 presentingViewController:v54 usageOptions:v48];

LABEL_61:
      goto LABEL_62;
    }
    v56 = [v5 latestResults];
    v57 = [v56 objectForKeyedSubscript:@"HFResultSetupBannerAccessorySetupFlowsKey"];

    v58 = HFLogForCategory();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v129 = self;
      __int16 v130 = 2080;
      v131 = "-[HUBannerItemModuleController didSelectItem:]";
      __int16 v132 = 2112;
      id v133 = v57;
      _os_log_impl(&dword_1BE345000, v58, OS_LOG_TYPE_DEFAULT, "(%@:%s) Status banner type is Accessory Setup. accessorySetupFlows = %@", buf, 0x20u);
    }

    v118 = objc_msgSend(v57, "na_firstObjectPassingTest:", &__block_literal_global_120);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__HUBannerItemModuleController_didSelectItem___block_invoke_2;
    aBlock[3] = &unk_1E638B178;
    aBlock[4] = self;
    id v48 = v57;
    id v126 = v48;
    v117 = (void (**)(void *, void *, __CFString *))_Block_copy(aBlock);
    v116 = objc_msgSend(v48, "na_firstObjectPassingTest:", &__block_literal_global_137_0);
    v115 = objc_msgSend(v48, "na_firstObjectPassingTest:", &__block_literal_global_140_1);
    if (v118)
    {
      v59 = [(HUItemModuleController *)self module];
      v60 = [v59 context];
      v61 = [v60 home];
      v62 = [v118 homeKitObjects];
      v63 = objc_msgSend(v62, "na_map:", &__block_literal_global_145);
      v64 = +[HUHomeUIServiceLaunchUserInfo userInfoForResumeAccessorySetupInHome:v61 accessoryUUIDs:v63];

      v117[2](v117, v64, &stru_1F18F92B8);
    }
    else if (v116)
    {
      v67 = [(HUItemModuleController *)self module];
      v68 = [v67 context];
      v69 = [v68 home];
      v64 = +[HUHomeUIServiceLaunchUserInfo userInfoForSafetyAndSecurityInHome:v69];

      v117[2](v117, v64, &stru_1F18F92B8);
    }
    else if (v115)
    {
      v72 = [(HUItemModuleController *)self module];
      v73 = [v72 context];
      v74 = [v73 home];
      v64 = +[HUHomeUIServiceLaunchUserInfo userInfoForSiriEndpointInHome:v74];

      v117[2](v117, v64, &stru_1F18F92B8);
    }
    else if (objc_msgSend(v48, "na_any:", &__block_literal_global_147))
    {
      v81 = [(HUItemModuleController *)self module];
      v82 = [v81 context];
      v83 = [v82 home];
      v64 = +[HUHomeUIServiceLaunchUserInfo userInfoForLockAccessFirmwareUpgradeSetupInHome:v83];

      v117[2](v117, v64, &stru_1F18F92B8);
    }
    else if (objc_msgSend(v48, "na_any:", &__block_literal_global_149_0))
    {
      v102 = [(HUItemModuleController *)self module];
      v103 = [v102 context];
      v104 = [v103 home];
      v64 = +[HUHomeUIServiceLaunchUserInfo userInfoForLockAccessWalletKeySetupInHome:v104];

      v117[2](v117, v64, &stru_1F18F92B8);
    }
    else
    {
      if (!objc_msgSend(v48, "na_any:", &__block_literal_global_151_0))
      {
LABEL_60:

        goto LABEL_61;
      }
      v105 = [(HUItemModuleController *)self module];
      v106 = [v105 context];
      v107 = [v106 home];
      v64 = +[HUHomeUIServiceLaunchUserInfo userInfoForLockAccessPinCodeSetupInHome:v107];

      v108 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      v109 = [v108 homeManager];
      [v109 launchHomeUIServiceToResumeSetupWithUserInfo:v64 completionHandler:&__block_literal_global_153_0];
    }
    goto LABEL_60;
  }
  double v12 = [(HUItemModuleController *)self module];
  v13 = [v12 bannerItemProvider];
  double v14 = [v13 multiUserTokenFixBannerItem];
  int v15 = [v5 isEqual:v14];

  if (v15)
  {
    id v16 = [(HUItemModuleController *)self module];
    int v17 = [v16 bannerItemProvider];
    uint64_t v18 = [v17 multiUserTokenFixBannerItem];
    v19 = [v18 homeMediaAccount];

    id v20 = objc_alloc(MEMORY[0x1E4F4E020]);
    id v21 = [(HUItemModuleController *)self module];
    double v22 = [v21 context];
    id v23 = [v22 home];
    id v24 = [v23 uniqueIdentifier];
    v25 = [(HUItemModuleController *)self host];
    id v26 = (void *)[v20 initWithAccount:v19 homeIdentifier:v24 viewController:v25];
    [(HUBannerItemModuleController *)self setMultiUserTokenFixTask:v26];

    uint64_t v27 = [(HUBannerItemModuleController *)self multiUserTokenFixTask];
    id v28 = [v27 performTask];

    __int16 v29 = [(HUItemModuleController *)self module];
    id v30 = [v29 bannerItemProvider];
    uint64_t v31 = [v30 multiUserTokenFixBannerItem];
    [v31 setForceHidden:1];

    v32 = (void *)MEMORY[0x1E4F69230];
    v33 = (void *)MEMORY[0x1E4F1CAD0];
    __int16 v34 = [(HUItemModuleController *)self module];
    v35 = [v34 bannerItemProvider];
    __int16 v36 = [v35 multiUserTokenFixBannerItem];
    id v37 = objc_msgSend(v33, "na_setWithSafeObject:", v36);
    uint64_t v38 = [v32 requestToUpdateItems:v37 senderSelector:a2];

    v39 = [(HUItemModuleController *)self module];
    double v40 = [v39 itemUpdater];

    id v41 = (id)[v40 performItemUpdateRequest:v38];
    objc_initWeak((id *)buf, self);
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __46__HUBannerItemModuleController_didSelectItem___block_invoke_8;
    v120[3] = &unk_1E638B1A0;
    objc_copyWeak(v124, (id *)buf);
    v124[1] = (id)a2;
    id v42 = v19;
    id v121 = v42;
    id v43 = v40;
    id v122 = v43;
    id v44 = v38;
    id v123 = v44;
    [v28 addFinishBlock:v120];

    objc_destroyWeak(v124);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v45 = HFLogForCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v129 = self;
        _os_log_impl(&dword_1BE345000, v45, OS_LOG_TYPE_DEFAULT, "%@: User tapped See home hubs", buf, 0xCu);
      }

      double v46 = [(HUBannerItemModuleController *)self delegate];
      [v46 didSelectUnreachableResidentsBanner:self];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v65 = HFLogForCategory();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v129 = self;
          _os_log_impl(&dword_1BE345000, v65, OS_LOG_TYPE_DEFAULT, "%@: User tapped WelcomeUIBanner", buf, 0xCu);
        }

        v66 = [(HUBannerItemModuleController *)self delegate];
        [v66 didSelectWelcomeBanner:self];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v70 = HFLogForCategory();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v129 = self;
            _os_log_impl(&dword_1BE345000, v70, OS_LOG_TYPE_DEFAULT, "%@: User tapped HomeHubMigrationBanner", buf, 0xCu);
          }

          v71 = [(HUBannerItemModuleController *)self delegate];
          [v71 didSelectHomeHubMigrationBanner:self];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v75 = HFLogForCategory();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v129 = self;
              _os_log_impl(&dword_1BE345000, v75, OS_LOG_TYPE_DEFAULT, "%@: User tapped Media Service Error Banner", buf, 0xCu);
            }

            v76 = [v5 latestResults];
            v77 = [v76 objectForKeyedSubscript:@"HFResultMediaServiceBundleIdentifierKey"];

            v78 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_appStoreURLForBundleIdentifier:", v77);
            v79 = [MEMORY[0x1E4F69378] sharedInstance];
            id v80 = (id)[v79 openURL:v78];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v84 = HFLogForCategory();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v129 = self;
                _os_log_impl(&dword_1BE345000, v84, OS_LOG_TYPE_DEFAULT, "%@: User tapped DropIn Banner", buf, 0xCu);
              }

              objc_opt_class();
              id v85 = v5;
              if (objc_opt_isKindOfClass()) {
                v86 = v85;
              }
              else {
                v86 = 0;
              }
              id v87 = v86;

              v88 = [v87 device];
              v89 = [(HUItemModuleController *)self module];
              v90 = [v89 context];
              v91 = [v90 home];
              v92 = [v88 homeKitIdentifier];
              v93 = objc_msgSend(v91, "hf_accessoryWithIdentifier:", v92);

              objc_opt_class();
              v94 = [(HUItemModuleController *)self host];
              if (objc_opt_isKindOfClass()) {
                v95 = v94;
              }
              else {
                v95 = 0;
              }
              id v96 = v95;

              v97 = [HUHomeControlServiceContext alloc];
              v98 = [v93 home];
              v99 = [(HUHomeControlServiceContext *)v97 initWithServiceType:2 home:v98 accessory:v93 presentingViewController:v96];

              v100 = HFLogForCategory();
              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v129 = self;
                __int16 v130 = 2112;
                v131 = (const char *)v93;
                _os_log_impl(&dword_1BE345000, v100, OS_LOG_TYPE_DEFAULT, "%@: Launching dropin session for accessory: %@", buf, 0x16u);
              }

              v101 = +[HUHomeControlServiceManager sharedInstance];
              [v101 launchServiceWithContext:v99];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(HUBannerItemModuleController *)self upgradeCameraSelected];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v111 = [v5 latestResults];
                  v112 = [v111 objectForKeyedSubscript:*MEMORY[0x1E4F68920]];

                  if (v112)
                  {
                    v113 = [MEMORY[0x1E4F69378] sharedInstance];
                    id v114 = (id)[v113 openURL:v112];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_63:
  [(HUBannerItemModuleController *)self _sendBannerInteractionforItem:v5 tappedBannerItemOverrideClassName:0];

  return 0;
}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:HFAccessorySetupFlowTypeResume];

  return v3;
}

void __46__HUBannerItemModuleController_didSelectItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v8 = [v7 homeManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__HUBannerItemModuleController_didSelectItem___block_invoke_3;
  v12[3] = &unk_1E638B150;
  uint64_t v9 = *(void **)(a1 + 40);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v9;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  [v8 launchHomeUIServiceToResumeSetupWithUserInfo:v11 completionHandler:v12];
}

void __46__HUBannerItemModuleController_didSelectItem___block_invoke_3(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    int v9 = 138413570;
    uint64_t v10 = v5;
    __int16 v11 = 2080;
    double v12 = "-[HUBannerItemModuleController didSelectItem:]_block_invoke_3";
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%@:%s) Launched home ui service to resume setup with user info %@. accessorySetupFlows = %@. error = %@. %@", (uint8_t *)&v9, 0x3Eu);
  }
}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke_135(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:HFAccessorySetupFlowTypeSafetyAndSecurity];

  return v3;
}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke_2_138(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:HFAccessorySetupFlowTypeSiriEndpoint];

  return v3;
}

id __46__HUBannerItemModuleController_didSelectItem___block_invoke_3_142(uint64_t a1, void *a2)
{
  v2 = [a2 uniqueIdentifier];
  uint64_t v3 = [v2 UUIDString];

  return v3;
}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 type];
  if ([v3 isEqualToString:HFAccessorySetupFlowTypeLockAccessFirmwareUpdatePinCode])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = [v2 type];
    if ([v5 isEqualToString:HFAccessorySetupFlowTypeLockAccessFirmwareUpdateAll])
    {
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v6 = [v2 type];
      uint64_t v4 = [v6 isEqualToString:HFAccessorySetupFlowTypeLockAccessFirmwareUpdateWalletKey];
    }
  }

  return v4;
}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 type];
  if ([v3 isEqualToString:HFAccessorySetupFlowTypeLockAccessAll])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = [v2 type];
    if ([v5 isEqualToString:HFAccessorySetupFlowTypeLockAccessWalletKey])
    {
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v6 = [v2 type];
      uint64_t v4 = [v6 isEqualToString:HFAccessorySetupFlowTypeLockAccessWalletKeyUWB];
    }
  }

  return v4;
}

uint64_t __46__HUBannerItemModuleController_didSelectItem___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  uint64_t v3 = [v2 isEqualToString:HFAccessorySetupFlowTypeLockAccessPinCode];

  return v3;
}

void __46__HUBannerItemModuleController_didSelectItem___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v8 = [WeakRetained module];
  uint64_t v9 = [v8 bannerItemProvider];
  uint64_t v10 = [(id)v9 multiUserTokenFixBannerItem];
  [v10 setForceHidden:0];

  LOBYTE(v9) = [v6 BOOLValue];
  __int16 v11 = HFLogForCategory();
  double v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v14 = *(void *)(a1 + 32);
      __int16 v15 = [WeakRetained module];
      uint64_t v16 = [v15 context];
      __int16 v17 = [v16 home];
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = v13;
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      __int16 v30 = 2112;
      uint64_t v31 = v17;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@ Successfully fixed MultiUser Token for MediaAccount [%@] in Home [%@]", buf, 0x20u);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __46__HUBannerItemModuleController_didSelectItem___block_invoke_155;
    v23[3] = &unk_1E63850E0;
    id v24 = *(id *)(a1 + 40);
    id v25 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v23);

    double v12 = v24;
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v18 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = [WeakRetained module];
    uint64_t v21 = [v20 context];
    double v22 = [v21 home];
    *(_DWORD *)buf = 138413058;
    uint64_t v27 = v18;
    __int16 v28 = 2112;
    uint64_t v29 = v19;
    __int16 v30 = 2112;
    uint64_t v31 = v22;
    __int16 v32 = 2112;
    id v33 = v5;
    _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "%@ Error in fixing MultiUser Token for MediaAccount [%@] in Home [%@] - %@", buf, 0x2Au);
  }
}

id __46__HUBannerItemModuleController_didSelectItem___block_invoke_155(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) performItemUpdateRequest:*(void *)(a1 + 40)];
}

void __57__HUBannerItemModuleController_fetchMediaAccountForHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v7 = [v6 UUIDString];
    int v8 = 138412802;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "%@ Error fetching media account for home with identifier [%@] - [%@]", (uint8_t *)&v8, 0x20u);
  }
}

- (void)user:(id)a3 didUpdateNeedsiTunesMultiUserRepair:(BOOL)a4
{
  id v6 = (void *)MEMORY[0x1E4F69230];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  int v8 = [(HUItemModuleController *)self module];
  uint64_t v9 = [v8 bannerItemProvider];
  __int16 v10 = [v9 multiUserTokenFixBannerItem];
  __int16 v11 = objc_msgSend(v7, "na_setWithSafeObject:", v10);
  id v15 = [v6 requestToUpdateItems:v11 senderSelector:a2];

  __int16 v12 = [(HUItemModuleController *)self module];
  id v13 = [v12 itemUpdater];
  id v14 = (id)[v13 performItemUpdateRequest:v15];
}

- (void)dismissCameraUpgradeBanner
{
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing camera upgrade banner.", (uint8_t *)buf, 2u);
  }

  id v5 = objc_alloc(MEMORY[0x1E4F69710]);
  id v6 = [(HUItemModuleController *)self module];
  uint64_t v7 = [v6 context];
  int v8 = [v7 home];
  uint64_t v9 = [(HUItemModuleController *)self module];
  __int16 v10 = [v9 context];
  __int16 v11 = [v10 home];
  __int16 v12 = [v11 currentUser];
  id v13 = (void *)[v5 initWithHome:v8 user:v12 nameStyle:0];

  objc_initWeak(buf, self);
  id v14 = [v13 setDismissCameraUpgradeBanner:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__HUBannerItemModuleController_dismissCameraUpgradeBanner__block_invoke;
  v16[3] = &unk_1E6388DF8;
  objc_copyWeak(v17, buf);
  v17[1] = (id)a2;
  id v15 = (id)[v14 addCompletionBlock:v16];

  objc_destroyWeak(v17);
  objc_destroyWeak(buf);
}

void __58__HUBannerItemModuleController_dismissCameraUpgradeBanner__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x1E4F69230];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [WeakRetained module];
  id v5 = [v4 bannerItemProvider];
  id v6 = [v5 cameraUpgradeOfferBannerItem];
  uint64_t v7 = objc_msgSend(v3, "na_setWithSafeObject:", v6);
  int v8 = [v2 requestToUpdateItems:v7 senderSelector:*(void *)(a1 + 40)];

  uint64_t v9 = [WeakRetained module];
  __int16 v10 = [v9 itemUpdater];
  id v11 = (id)[v10 performItemUpdateRequest:v8];
}

- (void)upgradeCameraSelected
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v2 = [(HUItemModuleController *)self module];
  id v3 = [v2 context];
  uint64_t v4 = [v3 home];
  id v5 = objc_msgSend(v4, "hf_allCameraProfilesSupportingRecording");
  id v44 = (void *)[v5 count];

  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v58 = v44;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Upgrade camera selected. Number of cameras supporting recording %lu", buf, 0xCu);
  }

  uint64_t v7 = [(HUItemModuleController *)self module];
  int v8 = [v7 bannerItemProvider];
  uint64_t v9 = [v8 cameraUpgradeOfferBannerItem];
  v45 = [v9 sheetActionText];

  id v50 = objc_alloc_init(MEMORY[0x1E4F94220]);
  __int16 v10 = [(HUItemModuleController *)self module];
  id v11 = [v10 bannerItemProvider];
  __int16 v12 = [v11 cameraUpgradeOfferBannerItem];
  id v13 = [v12 sheetTitle];
  [v50 setTitle:v13];

  id v14 = [(HUItemModuleController *)self module];
  id v15 = [v14 bannerItemProvider];
  uint64_t v16 = [v15 cameraUpgradeOfferBannerItem];
  __int16 v17 = [v16 sheetMessage];
  [v50 setSubtitle:v17];

  [v50 setDismissalType:3];
  id v18 = objc_alloc(MEMORY[0x1E4F42AA0]);
  uint64_t v19 = HUImageNamed(@"Onboarding-Camera");
  id v48 = (void *)[v18 initWithImage:v19];

  [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v20 = [v50 contentView];
  [v20 addSubview:v48];

  uint64_t v21 = [v50 contentView];
  v47 = [v21 mainContentGuide];

  double v22 = (void *)MEMORY[0x1E4F28DC8];
  double v46 = [v48 topAnchor];
  id v23 = [v47 topAnchor];
  id v24 = [v46 constraintGreaterThanOrEqualToAnchor:v23];
  v56[0] = v24;
  id v25 = [v48 centerYAnchor];
  id v26 = [v47 centerYAnchor];
  uint64_t v27 = [v25 constraintEqualToAnchor:v26];
  v56[1] = v27;
  __int16 v28 = [v48 centerXAnchor];
  uint64_t v29 = [v47 centerXAnchor];
  __int16 v30 = [v28 constraintEqualToAnchor:v29];
  v56[2] = v30;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
  [v22 activateConstraints:v31];

  objc_initWeak((id *)buf, self);
  __int16 v32 = (void *)MEMORY[0x1E4F94218];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke;
  v54[3] = &unk_1E638B218;
  objc_copyWeak(v55, (id *)buf);
  v55[1] = v44;
  id v33 = [v32 actionWithTitle:v45 style:0 handler:v54];
  id v34 = (id)[v50 addAction:v33];

  v35 = (void *)MEMORY[0x1E4F94218];
  __int16 v36 = _HULocalizedStringWithDefaultValue(@"HUSetupLater", @"HUSetupLater", 1);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke_201;
  v51[3] = &unk_1E638B1F0;
  objc_copyWeak(&v53, (id *)buf);
  id v37 = v50;
  id v52 = v37;
  uint64_t v38 = [v35 actionWithTitle:v36 style:1 handler:v51];
  id v39 = (id)[v37 addAction:v38];

  objc_opt_class();
  id v40 = [(HUItemModuleController *)self host];
  if (objc_opt_isKindOfClass()) {
    id v41 = v40;
  }
  else {
    id v41 = 0;
  }
  id v42 = v41;

  id v43 = [v42 presentProxCardFlowWithDelegate:self initialViewController:v37];
  [(HUBannerItemModuleController *)self setProxCardNavigationController:v43];

  objc_destroyWeak(&v53);
  objc_destroyWeak(v55);
  objc_destroyWeak((id *)buf);
}

void __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke(uint64_t a1, void *a2)
{
  id v47 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "camera upgrade - continue tapped. Present camera upgrade sheet", buf, 2u);
  }

  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissCameraUpgradeBanner];
  if (*(void *)(a1 + 40) == 1)
  {
    id v6 = [WeakRetained module];
    uint64_t v7 = [v6 context];
    int v8 = [v7 home];
    uint64_t v9 = objc_msgSend(v8, "hf_allCameraProfilesSupportingRecording");
    __int16 v10 = [v9 firstObject];

    id v11 = objc_alloc(MEMORY[0x1E4F68F98]);
    __int16 v12 = [WeakRetained module];
    id v13 = [v12 context];
    id v14 = [v13 home];
    id v15 = objc_msgSend(v14, "hf_characteristicValueManager");
    uint64_t v16 = (void *)[v11 initWithProfile:v10 valueSource:v15];

    id v17 = (id)[v16 updateWithOptions:MEMORY[0x1E4F1CC08]];
    id v18 = [[HUCameraRecordingOptionsTableViewController alloc] initWithServiceLikeItem:v16];
    [(HUCameraRecordingOptionsTableViewController *)v18 setDisplayStyle:2];
    uint64_t v19 = [v10 accessory];
    uint64_t v20 = [v19 name];
    uint64_t v27 = HULocalizedStringWithFormat(@"HUProximityCardNamedCameraSetupCardSubtitle", @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
  }
  else
  {
    __int16 v28 = [HUMultiCameraRecordingOptionsTableViewController alloc];
    uint64_t v29 = [WeakRetained module];
    __int16 v30 = [v29 context];
    uint64_t v31 = [v30 home];
    id v18 = [(HUMultiCameraRecordingOptionsTableViewController *)v28 initWithHome:v31];

    uint64_t v27 = _HULocalizedStringWithDefaultValue(@"HUProximityCardAllCamerasSetupCardSubtitle", @"HUProximityCardAllCamerasSetupCardSubtitle", 1);
  }
  __int16 v32 = [(HUCameraRecordingOptionsTableViewController *)v18 view];
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v33 = [(HUCameraRecordingOptionsTableViewController *)v18 tableView];
  id v34 = (void *)[objc_alloc(MEMORY[0x1E4F94230]) initWithCardStyle:0 scrollView:v33];
  [v33 _setTopPadding:0.0];
  [v33 _setBottomPadding:0.0];
  v35 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  [v33 setBackgroundColor:v35];

  __int16 v36 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  id v37 = [v33 backgroundView];
  [v37 setBackgroundColor:v36];

  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F94220]) initWithContentView:v34];
  id v39 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingSetup_Title", @"HUCameraRecordingSetup_Title", 1);
  [v38 setTitle:v39];

  [v38 setSubtitle:v27];
  [v38 addChildViewController:v18];
  [(HUCameraRecordingOptionsTableViewController *)v18 didMoveToParentViewController:v38];
  [v38 setDismissalType:3];
  id v40 = (void *)MEMORY[0x1E4F94218];
  id v41 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  void v48[2] = __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke_195;
  v48[3] = &unk_1E638B1F0;
  objc_copyWeak(&v50, v4);
  id v42 = v38;
  id v49 = v42;
  id v43 = [v40 actionWithTitle:v41 style:0 handler:v48];
  id v44 = (id)[v42 addAction:v43];

  v45 = [WeakRetained proxCardNavigationController];
  id v46 = (id)objc_msgSend(v45, "hu_pushPreloadableViewController:animated:", v42, 1);

  objc_destroyWeak(&v50);
}

void __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke_195(uint64_t a1)
{
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "camera upgrade - done tapped", v7, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = +[HUViewControllerDismissalRequest requestWithViewController:*(void *)(a1 + 32)];
  id v5 = [WeakRetained host];
  id v6 = (id)[v5 moduleController:WeakRetained dismissViewControllerForRequest:v4];
}

void __53__HUBannerItemModuleController_upgradeCameraSelected__block_invoke_201(uint64_t a1)
{
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "camera upgrade - setup later tapped", v11, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained dismissCameraUpgradeBanner];
  uint64_t v4 = [*(id *)(a1 + 32) navigationController];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v5 navigationController];
  }
  else
  {
    id v6 = v5;
  }
  uint64_t v7 = v6;

  int v8 = +[HUViewControllerDismissalRequest requestWithViewController:v7];
  uint64_t v9 = [WeakRetained host];
  id v10 = (id)[v9 moduleController:WeakRetained dismissViewControllerForRequest:v8];
}

- (void)_sendBannerInteractionforItem:(id)a3 tappedBannerItemOverrideClassName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  int v8 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v12 = v9;

  id v10 = (void *)MEMORY[0x1E4F68EE0];
  id v11 = [v12 hiddenBanners];
  [v10 sendBannerInteractionforItem:v7 tappedBannerItemOverrideClassName:v6 hiddenBannerEvents:v11];
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
}

- (AMSUIUpdateMultiUserTokenTask)multiUserTokenFixTask
{
  return self->_multiUserTokenFixTask;
}

- (void)setMultiUserTokenFixTask:(id)a3
{
}

- (UINavigationController)proxCardNavigationController
{
  return self->_proxCardNavigationController;
}

- (void)setProxCardNavigationController:(id)a3
{
}

- (HUBannerItemModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUBannerItemModuleControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxCardNavigationController, 0);
  objc_storeStrong((id *)&self->_multiUserTokenFixTask, 0);
  objc_storeStrong((id *)&self->_homeMediaAccountFuture, 0);

  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end