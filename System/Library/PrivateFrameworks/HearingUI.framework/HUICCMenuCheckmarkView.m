@interface HUICCMenuCheckmarkView
- (BOOL)enabled;
- (HACCCapsuleDarkBackground)backgroundMenuView;
- (HACCCapsuleTitleView)titleView;
- (HACCContentModuleDelegate)delegate;
- (HACCStackView)menuViewStack;
- (HUICCMenuCheckmarkView)initWithFrame:(CGRect)a3 andModule:(unint64_t)a4;
- (NSArray)availableComfortSoundsAssets;
- (NSDictionary)comfortSoundsDownloadProgress;
- (NSMutableArray)menuItemViews;
- (NSMutableArray)menuItems;
- (NSNumber)contentValueCache;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (id)_menuItemsforBluetoothDevice:(id)a3;
- (id)contentValue;
- (id)personalAudioToggleBlockForType:(unint64_t)a3 withFeatureEnabled:(BOOL)a4 andAddress:(id)a5;
- (unint64_t)module;
- (void)_handleTapGesture:(id)a3;
- (void)_menuItemsWithCompletion:(id)a3;
- (void)_updateMenuViewIfNecessary;
- (void)setAvailableComfortSoundsAssets:(id)a3;
- (void)setBackgroundMenuView:(id)a3;
- (void)setComfortSoundsDownloadProgress:(id)a3;
- (void)setContentValueCache:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMenuItemViews:(id)a3;
- (void)setMenuItems:(id)a3;
- (void)setMenuViewStack:(id)a3;
- (void)setModule:(unint64_t)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTitleView:(id)a3;
- (void)subscribeListeners;
- (void)unsubscribeListeners;
- (void)updateConversationBoostCache;
- (void)updateValue;
@end

@implementation HUICCMenuCheckmarkView

- (HUICCMenuCheckmarkView)initWithFrame:(CGRect)a3 andModule:(unint64_t)a4
{
  v70[4] = *MEMORY[0x263EF8340];
  v67.receiver = self;
  v67.super_class = (Class)HUICCMenuCheckmarkView;
  v4 = -[HUICCMenuCheckmarkView initWithFrame:](&v67, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(HUICCMenuCheckmarkView *)v4 setModule:a4];
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    menuItemViews = v5->_menuItemViews;
    v5->_menuItemViews = v6;

    v8 = objc_alloc_init(HACCCapsuleDarkBackground);
    backgroundMenuView = v5->_backgroundMenuView;
    v5->_backgroundMenuView = v8;

    [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUICCMenuCheckmarkView *)v5 addSubview:v5->_backgroundMenuView];
    [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView setupBackgroundVisualStyle];
    v10 = objc_alloc_init(HACCStackView);
    menuViewStack = v5->_menuViewStack;
    v5->_menuViewStack = v10;

    [(HACCStackView *)v5->_menuViewStack setAxis:1];
    [(HACCStackView *)v5->_menuViewStack setAlignment:0];
    [(HACCStackView *)v5->_menuViewStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUICCMenuCheckmarkView *)v5 addSubview:v5->_menuViewStack];
    v52 = (void *)MEMORY[0x263F08938];
    v60 = [(HACCStackView *)v5->_menuViewStack leadingAnchor];
    v58 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView leadingAnchor];
    v56 = [v60 constraintEqualToAnchor:v58];
    v70[0] = v56;
    v54 = [(HACCStackView *)v5->_menuViewStack trailingAnchor];
    v12 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView trailingAnchor];
    v13 = [v54 constraintEqualToAnchor:v12];
    v70[1] = v13;
    v14 = [(HACCStackView *)v5->_menuViewStack topAnchor];
    v15 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v70[2] = v16;
    v17 = [(HACCStackView *)v5->_menuViewStack bottomAnchor];
    v18 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v70[3] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:4];
    [v52 activateConstraints:v20];

    if (a4 == 32)
    {
      titleView = v5->_titleView;
      v5->_titleView = 0;

      v22 = (void *)MEMORY[0x263F08938];
      v63 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView leadingAnchor];
      v61 = [(HUICCMenuCheckmarkView *)v5 leadingAnchor];
      v59 = [v63 constraintEqualToAnchor:v61];
      v69[0] = v59;
      v57 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView trailingAnchor];
      v55 = [(HUICCMenuCheckmarkView *)v5 trailingAnchor];
      v53 = [v57 constraintEqualToAnchor:v55];
      v69[1] = v53;
      v51 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView topAnchor];
      v50 = [(HUICCMenuCheckmarkView *)v5 topAnchor];
      v49 = [v51 constraintEqualToAnchor:v50];
      v69[2] = v49;
      v48 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView bottomAnchor];
      v47 = [(HUICCMenuCheckmarkView *)v5 bottomAnchor];
      v23 = [v48 constraintEqualToAnchor:v47];
      v69[3] = v23;
      v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:4];
      [v22 activateConstraints:v24];
    }
    else
    {
      if (a4 == 34) {
        double v25 = 26.0;
      }
      else {
        double v25 = 52.0;
      }
      v26 = objc_alloc_init(HACCCapsuleTitleView);
      v27 = v5->_titleView;
      v5->_titleView = v26;

      [(HACCCapsuleTitleView *)v5->_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(HACCCapsuleTitleView *)v5->_titleView setAccessibilityElementsHidden:a4 == 34];
      [(HUICCMenuCheckmarkView *)v5 addSubview:v5->_titleView];
      v42 = (void *)MEMORY[0x263F08938];
      v63 = [(HACCCapsuleTitleView *)v5->_titleView topAnchor];
      v61 = [(HUICCMenuCheckmarkView *)v5 topAnchor];
      v59 = [v63 constraintEqualToAnchor:v61];
      v68[0] = v59;
      v57 = [(HACCCapsuleTitleView *)v5->_titleView leadingAnchor];
      v55 = [(HUICCMenuCheckmarkView *)v5 leadingAnchor];
      v53 = [v57 constraintEqualToAnchor:v55];
      v68[1] = v53;
      v51 = [(HACCCapsuleTitleView *)v5->_titleView trailingAnchor];
      v50 = [(HUICCMenuCheckmarkView *)v5 trailingAnchor];
      v49 = [v51 constraintEqualToAnchor:v50];
      v68[2] = v49;
      v48 = [(HACCCapsuleTitleView *)v5->_titleView heightAnchor];
      v47 = [v48 constraintGreaterThanOrEqualToConstant:v25];
      v68[3] = v47;
      v23 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView leadingAnchor];
      v24 = [(HUICCMenuCheckmarkView *)v5 leadingAnchor];
      v46 = [v23 constraintEqualToAnchor:v24];
      v68[4] = v46;
      v45 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView trailingAnchor];
      v44 = [(HUICCMenuCheckmarkView *)v5 trailingAnchor];
      v43 = [v45 constraintEqualToAnchor:v44];
      v68[5] = v43;
      v28 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView topAnchor];
      v29 = [(HACCCapsuleTitleView *)v5->_titleView bottomAnchor];
      v30 = [v28 constraintEqualToAnchor:v29];
      v68[6] = v30;
      v31 = [(HACCCapsuleDarkBackground *)v5->_backgroundMenuView bottomAnchor];
      v32 = [(HUICCMenuCheckmarkView *)v5 bottomAnchor];
      v33 = [v31 constraintEqualToAnchor:v32];
      v68[7] = v33;
      v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:8];
      [v42 activateConstraints:v34];
    }
    uint64_t v35 = [objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v5 action:sel__handleTapGesture_];
    tapGestureRecognizer = v5->_tapGestureRecognizer;
    v5->_tapGestureRecognizer = (UITapGestureRecognizer *)v35;

    [(UITapGestureRecognizer *)v5->_tapGestureRecognizer setNumberOfTouchesRequired:1];
    [(UITapGestureRecognizer *)v5->_tapGestureRecognizer setNumberOfTapsRequired:1];
    [(HUICCMenuCheckmarkView *)v5 addGestureRecognizer:v5->_tapGestureRecognizer];
  }
  if ([(HUICCMenuCheckmarkView *)v5 module] == 27)
  {
    objc_initWeak(&location, v5);
    v37 = [MEMORY[0x263F47548] sharedInstance];
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __50__HUICCMenuCheckmarkView_initWithFrame_andModule___block_invoke;
    v64[3] = &unk_2647CD168;
    objc_copyWeak(&v65, &location);
    [v37 registerUpdateBlock:v64 forRetrieveSelector:sel_comfortSoundsEnabled withListener:v5];

    objc_destroyWeak(&v65);
    objc_destroyWeak(&location);
  }
  if ([(HUICCMenuCheckmarkView *)v5 module] == 34)
  {
    contentValueCache = v5->_contentValueCache;
    v5->_contentValueCache = (NSNumber *)MEMORY[0x263EFFA80];

    v39 = [MEMORY[0x263F08A00] defaultCenter];
    [v39 addObserver:v5 selector:sel_updateConversationBoostCache name:*MEMORY[0x263F474E0] object:0];

    v40 = [MEMORY[0x263F08A00] defaultCenter];
    [v40 addObserver:v5 selector:sel_updateConversationBoostCache name:*MEMORY[0x263F5D470] object:0];

    [(HUICCMenuCheckmarkView *)v5 updateConversationBoostCache];
  }
  return v5;
}

void __50__HUICCMenuCheckmarkView_initWithFrame_andModule___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateValue];
}

- (void)subscribeListeners
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  v3 = [NSString stringWithFormat:@"Registering Comfort Sounds listener"];
  v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUICCMenuCheckmarkView subscribeListeners]", 142, v3];
  v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v6 UTF8String];
    _os_log_impl(&dword_226B65000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ([(HUICCMenuCheckmarkView *)self module] == 27)
  {
    objc_initWeak((id *)buf, self);
    v8 = [MEMORY[0x263F47528] sharedInstance];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__HUICCMenuCheckmarkView_subscribeListeners__block_invoke;
    v9[3] = &unk_2647CD400;
    objc_copyWeak(&v10, (id *)buf);
    [v8 registerListener:self forComfortSoundsModelUpdatesHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __44__HUICCMenuCheckmarkView_subscribeListeners__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v7 = v5;
  id v8 = v6;
  AXPerformBlockOnMainThread();

  objc_destroyWeak(&v9);
}

void __44__HUICCMenuCheckmarkView_subscribeListeners__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setAvailableComfortSoundsAssets:*(void *)(a1 + 32)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 setComfortSoundsDownloadProgress:*(void *)(a1 + 40)];

  id v5 = objc_loadWeakRetained(v2);
  [v5 _updateMenuViewIfNecessary];
}

- (void)unsubscribeListeners
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  v3 = [NSString stringWithFormat:@"Unregistering Comfort Sounds listener"];
  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUICCMenuCheckmarkView unsubscribeListeners]", 160, v3];
  id v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = [v6 UTF8String];
    _os_log_impl(&dword_226B65000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ([(HUICCMenuCheckmarkView *)self module] == 27)
  {
    id v8 = [MEMORY[0x263F47528] sharedInstance];
    [v8 unregisterComfortSoundsModelUpdatesHandler:self];
  }
}

- (void)updateValue
{
  id v7 = [(HUICCMenuCheckmarkView *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v7;
    id v4 = [(HUICCMenuCheckmarkView *)self tapGestureRecognizer];
    id v5 = [v3 scrollView];

    id v6 = [v5 panGestureRecognizer];
    [v4 requireGestureRecognizerToFail:v6];
  }
  [(HUICCMenuCheckmarkView *)self _updateMenuViewIfNecessary];
}

- (id)contentValue
{
  return self->_contentValueCache;
}

- (BOOL)enabled
{
  return 1;
}

- (void)_updateMenuViewIfNecessary
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __52__HUICCMenuCheckmarkView__updateMenuViewIfNecessary__block_invoke;
  v2[3] = &unk_2647CD428;
  v2[4] = self;
  [(HUICCMenuCheckmarkView *)self _menuItemsWithCompletion:v2];
}

void __52__HUICCMenuCheckmarkView__updateMenuViewIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) menuItems];
  char v5 = [v4 isEqualToArray:v3];

  if ((v5 & 1) == 0)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = [*(id *)(a1 + 32) menuItemViews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          [v11 removeFromSuperview];
          uint64_t v12 = [*(id *)(a1 + 32) menuViewStack];
          [v12 removeArrangedSubview:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v8);
    }

    uint64_t v13 = [*(id *)(a1 + 32) menuItemViews];
    [v13 removeAllObjects];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = v3;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          v20 = objc_alloc_init(HUICCMenuItemCheckmarkView);
          -[HUICCMenuItemCheckmarkView setMenuItem:](v20, "setMenuItem:", v19, (void)v30);
          v21 = [*(id *)(a1 + 32) menuItemViews];
          uint64_t v22 = [v21 count];

          v23 = *(void **)(a1 + 32);
          if (v22)
          {
            v24 = [v23 menuViewStack];
            [v24 addArrangedSubview:v20 withPartialSeparator:1];
          }
          else
          {
            double v25 = [v23 titleView];
            BOOL v26 = v25 != 0;

            v24 = [*(id *)(a1 + 32) menuViewStack];
            [v24 addArrangedSubview:v20 withSeparator:v26];
          }

          v27 = [*(id *)(a1 + 32) menuViewStack];
          [v27 addArrangedSubview:v20];

          v28 = [*(id *)(a1 + 32) menuItemViews];
          [v28 addObject:v20];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v16);
    }

    v29 = (void *)[v14 copy];
    [*(id *)(a1 + 32) setMenuItems:v29];
  }
}

- (void)_menuItemsWithCompletion:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync();
}

void __51__HUICCMenuCheckmarkView__menuItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__HUICCMenuCheckmarkView__menuItemsWithCompletion___block_invoke_2;
  block[3] = &unk_2647CD450;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __51__HUICCMenuCheckmarkView__menuItemsWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _menuItemsforBluetoothDevice:*(void *)(a1 + 40)];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return MEMORY[0x270F9A758]();
}

- (id)_menuItemsforBluetoothDevice:(id)a3
{
  v77[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(HUICCMenuCheckmarkView *)self module];
  id v6 = [MEMORY[0x263EFF980] array];
  v54 = [MEMORY[0x263EFF980] array];
  id v7 = [MEMORY[0x263EFF980] array];
  id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_initWeak(&location, self);
  switch(v5)
  {
    case 0x1BuLL:
      id v8 = hearingLocString();
      v28 = [MEMORY[0x263EFF980] array];
      v29 = [(HUICCMenuCheckmarkView *)self availableComfortSoundsAssets];
      if ([v29 count])
      {
        v69[0] = MEMORY[0x263EF8330];
        v69[1] = 3221225472;
        v69[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_55;
        v69[3] = &unk_2647CD4C8;
        id v70 = v28;
        [v29 enumerateObjectsUsingBlock:v69];
      }
      else
      {
        for (uint64_t i = 1; i != 9; ++i)
        {
          uint64_t v40 = [MEMORY[0x263F47540] defaultComfortSoundForGroup:i];
          [v28 hcSafeAddObject:v40];
        }
      }
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_2;
      v63[3] = &unk_2647CD518;
      id v64 = v6;
      id v65 = self;
      id v66 = v54;
      id v67 = v7;
      objc_copyWeak(&v68, &location);
      [v28 enumerateObjectsUsingBlock:v63];
      v41 = [MEMORY[0x263F47548] sharedInstance];
      v42 = [v41 selectedComfortSound];

      if (v42)
      {
        v43 = [v42 localizedName];
        v76 = v43;
        double v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
      }
      else
      {
        double v25 = 0;
      }

      objc_destroyWeak(&v68);
      goto LABEL_36;
    case 0x22uLL:
      v28 = paLocString();
      [v6 addObject:v28];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_4;
      v61[3] = &unk_2647CD168;
      objc_copyWeak(&v62, &location);
      long long v30 = (void *)MEMORY[0x22A6626E0](v61);
      long long v31 = (void *)MEMORY[0x22A6626E0]();
      [v7 addObject:v31];

      long long v32 = [(HUICCMenuCheckmarkView *)self contentValue];
      int v33 = [v32 BOOLValue];

      if (v33)
      {
        v75 = v28;
        double v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v75 count:1];
      }
      else
      {
        double v25 = 0;
      }

      objc_destroyWeak(&v62);
      id v8 = 0;
      goto LABEL_36;
    case 0x20uLL:
      id v8 = paLocString();
      uint64_t v9 = [MEMORY[0x263F5D450] sharedInstance];
      uint64_t v10 = [v4 address];
      uint64_t v11 = [v9 yodelEnabledForAddress:v10];

      if (v11)
      {
        uint64_t v12 = accessibilityHearingAidSupportBundle();
        uint64_t v13 = [v12 localizedStringForKey:@"YodelFeatureName" value:@"YodelFeatureName" table:@"HearingProtection-Yodel"];

        id v8 = (void *)v13;
      }
      id v14 = paLocString();
      v77[0] = v14;
      uint64_t v15 = paLocString();
      v77[1] = v15;
      uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
      [v6 addObjectsFromArray:v16];

      uint64_t v17 = [v4 address];
      v18 = [(HUICCMenuCheckmarkView *)self personalAudioToggleBlockForType:2 withFeatureEnabled:v11 andAddress:v17];
      [v7 addObject:v18];

      uint64_t v19 = [v4 address];
      v20 = [(HUICCMenuCheckmarkView *)self personalAudioToggleBlockForType:4 withFeatureEnabled:v11 andAddress:v19];
      [v7 addObject:v20];

      int v21 = [v4 featureCapability:33];
      if (v21)
      {
        uint64_t v22 = paLocString();
        [v6 addObject:v22];

        v71[0] = MEMORY[0x263EF8330];
        v71[1] = 3221225472;
        v71[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke;
        v71[3] = &unk_2647CD4A0;
        id v72 = v4;
        objc_copyWeak(&v73, &location);
        v23 = (void *)MEMORY[0x22A6626E0](v71);
        v24 = (void *)MEMORY[0x22A6626E0]();
        [v7 addObject:v24];

        objc_destroyWeak(&v73);
      }
      double v25 = [MEMORY[0x263EFF980] array];
      BOOL v26 = [MEMORY[0x263F5D458] sharedInstance];
      if (v11)
      {
        v27 = [v4 address];
      }
      else
      {
        v27 = (void *)*MEMORY[0x263F5D468];
      }
      [v26 accommodationTypesForRouteUID:v27];
      if (v11) {

      }
      if (compoundAttributeContainsAttribute())
      {
        long long v34 = paLocString();
        [v25 addObject:v34];
      }
      if (compoundAttributeContainsAttribute())
      {
        long long v35 = paLocString();
        [v25 addObject:v35];
      }
      if (v21)
      {
        if (v11)
        {
          long long v36 = [MEMORY[0x263F5D450] sharedInstance];
          long long v37 = [v4 address];
          int v38 = [v36 hearingAidEnabledForAddress:v37];

          if (!v38) {
            break;
          }
          goto LABEL_35;
        }
        v44 = [MEMORY[0x263F5D458] sharedInstance];
        v45 = [v4 address];
        char v46 = [v44 transparencyCustomizedForAddress:v45];

        if (v46)
        {
LABEL_35:
          v28 = paLocString();
          [v25 addObject:v28];
LABEL_36:
        }
      }
      break;
    default:
      double v25 = 0;
      id v8 = 0;
      break;
  }
  if ([v6 count])
  {
    uint64_t v47 = [v6 count];
    if (v47 == [v7 count])
    {
      id v48 = objc_loadWeakRetained(&location);
      v49 = [v48 titleView];
      v50 = [v49 titleLabel];
      [v50 setText:v8];

      uint64_t v51 = [v54 count];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_5;
      v55[3] = &unk_2647CD568;
      id v56 = v7;
      uint64_t v60 = v51;
      id v57 = v54;
      id v58 = v25;
      id v59 = v53;
      [v6 enumerateObjectsUsingBlock:v55];
    }
  }
  objc_destroyWeak(&location);

  return v53;
}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) address];
  id v3 = [MEMORY[0x263F5D450] sharedInstance];
  int v4 = [v3 yodelEnabledForAddress:v2];

  if (v4)
  {
    PAInitializeLogging();
    unint64_t v5 = [NSString stringWithFormat:@"User toggled YHA"];
    id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[HUICCMenuCheckmarkView _menuItemsforBluetoothDevice:]_block_invoke", 294, v5];
    id v7 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      uint64_t v9 = v7;
      *(_DWORD *)buf = 136446210;
      uint64_t v20 = [v8 UTF8String];
      _os_log_impl(&dword_226B65000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v10 = [MEMORY[0x263F5D450] sharedInstance];
    [v10 toggleHearingAidForAddress:v2];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F5D458] sharedInstance];
    int v12 = [v11 transparencyCustomizedForAddress:v2];

    uint64_t v13 = v12 ^ 1u;
    id v14 = [MEMORY[0x263F5D458] sharedInstance];
    [v14 setTransparencyCustomized:v13 forAddress:v2];
  }
  uint64_t v15 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v15);
  [WeakRetained _updateMenuViewIfNecessary];

  id v17 = objc_loadWeakRetained(v15);
  v18 = [v17 delegate];

  [v18 updateView];
}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_55(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263F47540] comfortSoundWithAsset:a2];
  [*(id *)(a1 + 32) hcSafeAddObject:v3];
}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  unint64_t v5 = [v3 localizedName];
  [v4 addObject:v5];

  id v6 = [v3 asset];
  id v7 = [*(id *)(a1 + 40) comfortSoundsDownloadProgress];
  id v8 = [v6 assetId];
  uint64_t v9 = [v7 objectForKey:v8];

  if (v9 && ([v9 floatValue], v10 < 1.0))
  {
    hearingLocString();
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = &stru_26DAB2B88;
  }
  [*(id *)(a1 + 48) addObject:v11];
  int v12 = *(void **)(a1 + 56);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_3;
  v16[3] = &unk_2647CD4F0;
  id v13 = v6;
  id v17 = v13;
  id v14 = v3;
  id v18 = v14;
  objc_copyWeak(&v19, (id *)(a1 + 64));
  uint64_t v15 = (void *)MEMORY[0x22A6626E0](v16);
  [v12 addObject:v15];

  objc_destroyWeak(&v19);
}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_3(id *a1)
{
  int v2 = [a1[4] isInstalled];
  id v3 = [MEMORY[0x263F47548] sharedInstance];
  int v4 = v3;
  if (v2)
  {
    [v3 setSelectedComfortSound:a1[5]];
  }
  else
  {
    unint64_t v5 = objc_msgSend(MEMORY[0x263F47540], "defaultComfortSoundForGroup:", objc_msgSend(a1[5], "soundGroup"));
    [v4 setSelectedComfortSound:v5];

    int v4 = [MEMORY[0x263F47528] sharedInstance];
    [v4 downloadComfortSoundAsset:a1[4]];
  }

  id v6 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _updateMenuViewIfNecessary];

  id v8 = objc_loadWeakRetained(v6);
  id v9 = [v8 delegate];

  [v9 updateViewForModule:27];
  [v9 updateViewForModule:24];
}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v1);
  [v3 controlDidActivate:v4];

  id v5 = objc_loadWeakRetained(v1);
  [v5 updateConversationBoostCache];

  id v6 = objc_loadWeakRetained(v1);
  [v6 _updateMenuViewIfNecessary];
}

void __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_5(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc(MEMORY[0x263F33CC0]);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_6;
  int v12 = &unk_2647CD540;
  id v13 = *(id *)(a1 + 32);
  unint64_t v14 = a3;
  id v7 = (void *)[v6 initWithTitle:v5 identifier:v5 handler:&v9];
  if (*(void *)(a1 + 64) > a3)
  {
    id v8 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3, v9, v10, v11, v12);
    [v7 setSubtitle:v8];
  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v5, v9, v10, v11, v12)) {
    [v7 setSelected:1];
  }
  [*(id *)(a1 + 56) addObject:v7];
}

uint64_t __55__HUICCMenuCheckmarkView__menuItemsforBluetoothDevice___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 40)];
  int v2 = (void *)v1;
  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }

  return 0;
}

- (id)personalAudioToggleBlockForType:(unint64_t)a3 withFeatureEnabled:(BOOL)a4 andAddress:(id)a5
{
  id v8 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__HUICCMenuCheckmarkView_personalAudioToggleBlockForType_withFeatureEnabled_andAddress___block_invoke;
  v12[3] = &unk_2647CD590;
  BOOL v15 = a4;
  id v13 = v8;
  v14[1] = (id)a3;
  id v9 = v8;
  objc_copyWeak(v14, &location);
  uint64_t v10 = (void *)MEMORY[0x22A6626E0](v12);
  objc_destroyWeak(v14);

  objc_destroyWeak(&location);
  return v10;
}

void __88__HUICCMenuCheckmarkView_personalAudioToggleBlockForType_withFeatureEnabled_andAddress___block_invoke(uint64_t a1)
{
  id v14 = (id)*MEMORY[0x263F5D468];
  if (*(unsigned char *)(a1 + 56) && [*(id *)(a1 + 32) length])
  {
    id v2 = *(id *)(a1 + 32);

    id v14 = v2;
  }
  id v3 = [MEMORY[0x263F5D458] sharedInstance];
  [v3 accommodationTypesForRouteUID:v14];

  if (compoundAttributeContainsAttribute()) {
    uint64_t v4 = compoundAttributeByRemovingAttribute();
  }
  else {
    uint64_t v4 = compoundAttributeByAddingAttribute();
  }
  uint64_t v5 = v4;
  id v6 = [MEMORY[0x263F5D458] sharedInstance];
  [v6 setAccommodationTypes:v5 forRouteUID:v14];

  id v7 = [MEMORY[0x263F5D450] sharedInstance];
  int v8 = [v7 yodelEnabledForAddress:*(void *)(a1 + 32)];

  if (v8)
  {
    id v9 = [MEMORY[0x263F5D450] sharedInstance];
    [v9 setAccommodationType:v5 forAddress:*(void *)(a1 + 32)];
  }
  uint64_t v10 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v10);
  [WeakRetained _updateMenuViewIfNecessary];

  id v12 = objc_loadWeakRetained(v10);
  id v13 = [v12 delegate];

  [v13 updateViewForModule:31];
  [v13 updateViewForModule:32];
}

- (void)_handleTapGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  [v4 locationInView:self];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = -[HUICCMenuCheckmarkView hitTest:withEvent:](self, "hitTest:withEvent:", 0, v7, v9);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    id v12 = v11;
    if (v5 == 3)
    {
      [v11 setHighlighted:1];
      id v13 = v12;
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

void __44__HUICCMenuCheckmarkView__handleTapGesture___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHighlighted:0];
  id v2 = [*(id *)(a1 + 32) menuItem];
  [v2 performAction];
}

- (void)updateConversationBoostCache
{
  if ([(HUICCMenuCheckmarkView *)self module] == 34) {
    paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync();
  }
  if ([(HUICCMenuCheckmarkView *)self module] == 32) {
    [(HUICCMenuCheckmarkView *)self _updateMenuViewIfNecessary];
  }
}

void __54__HUICCMenuCheckmarkView_updateConversationBoostCache__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__HUICCMenuCheckmarkView_updateConversationBoostCache__block_invoke_2;
  v6[3] = &unk_2647CD360;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __54__HUICCMenuCheckmarkView_updateConversationBoostCache__block_invoke_2(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) address];
  id v2 = [MEMORY[0x263F5D458] sharedInstance];
  uint64_t v3 = [v2 transparencyBeamformingForAddress:v8];

  uint64_t v4 = [MEMORY[0x263F5D450] sharedInstance];
  int v5 = [v4 yodelEnabledForAddress:v8];

  if (v5)
  {
    double v6 = [MEMORY[0x263F5D450] sharedInstance];
    uint64_t v3 = [v6 beamformingForAddress:v8];
  }
  id v7 = [NSNumber numberWithBool:v3];
  [*(id *)(a1 + 40) setContentValueCache:v7];

  [*(id *)(a1 + 40) _updateMenuViewIfNecessary];
}

- (HACCContentModuleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HACCContentModuleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)module
{
  return self->module;
}

- (void)setModule:(unint64_t)a3
{
  self->module = a3;
}

- (HACCCapsuleTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (HACCCapsuleDarkBackground)backgroundMenuView
{
  return self->_backgroundMenuView;
}

- (void)setBackgroundMenuView:(id)a3
{
}

- (HACCStackView)menuViewStack
{
  return self->_menuViewStack;
}

- (void)setMenuViewStack:(id)a3
{
}

- (NSMutableArray)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
}

- (NSMutableArray)menuItemViews
{
  return self->_menuItemViews;
}

- (void)setMenuItemViews:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (NSArray)availableComfortSoundsAssets
{
  return self->_availableComfortSoundsAssets;
}

- (void)setAvailableComfortSoundsAssets:(id)a3
{
}

- (NSDictionary)comfortSoundsDownloadProgress
{
  return self->_comfortSoundsDownloadProgress;
}

- (void)setComfortSoundsDownloadProgress:(id)a3
{
}

- (NSNumber)contentValueCache
{
  return self->_contentValueCache;
}

- (void)setContentValueCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentValueCache, 0);
  objc_storeStrong((id *)&self->_comfortSoundsDownloadProgress, 0);
  objc_storeStrong((id *)&self->_availableComfortSoundsAssets, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_menuItemViews, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_menuViewStack, 0);
  objc_storeStrong((id *)&self->_backgroundMenuView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end