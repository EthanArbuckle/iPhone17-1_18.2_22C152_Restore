@interface HUQuickControlFaucetPanelViewController
+ (id)_childValvesPredicate;
+ (id)_primaryStatePredicate;
+ (id)_temperaturePredicate;
+ (id)controlItemPredicate;
- (BOOL)_canShowWhileLocked;
- (HFChildServiceControlItem)childValvesControlItem;
- (HFPrimaryStateWriter)primaryStateControlItem;
- (HFTemperatureThresholdControlItem)temperatureControlItem;
- (HUQuickControlCollectionViewController)collectionViewController;
- (HUQuickControlFaucetPanelViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7;
- (id)_controlItemMatchingPredicate:(id)a3;
- (id)childQuickControlContentViewControllers;
- (id)overrideStatusText;
- (void)viewDidLoad;
@end

@implementation HUQuickControlFaucetPanelViewController

+ (id)_temperaturePredicate
{
  uint64_t v2 = objc_opt_class();

  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:v2];
}

+ (id)_childValvesPredicate
{
  uint64_t v2 = objc_opt_class();

  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:v2];
}

+ (id)_primaryStatePredicate
{
  uint64_t v2 = [[HUQuickControlSingleItemPredicate alloc] initWithBlock:&__block_literal_global_37];

  return v2;
}

uint64_t __65__HUQuickControlFaucetPanelViewController__primaryStatePredicate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F1AD9090];
}

+ (id)controlItemPredicate
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [HUQuickControlCompoundItemPredicate alloc];
  v4 = [a1 _primaryStatePredicate];
  v12[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v6 = [a1 _temperaturePredicate];
  v7 = objc_msgSend(a1, "_childValvesPredicate", v6);
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v9 = [(HUQuickControlCompoundItemPredicate *)v3 initWithRequiredSubpredicates:v5 optionalSubpredicates:v8 minimumNumberOfMatchedPredicates:2];

  return v9;
}

- (HUQuickControlFaucetPanelViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v13 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HUQuickControlFaucetPanelViewController;
  v14 = [(HUQuickControlViewController *)&v34 initWithControlItems:v13 home:a4 itemUpdater:a5 controlOrientation:a6 preferredControl:a7];
  v15 = v14;
  if (v14)
  {
    v16 = [(HUQuickControlFaucetPanelViewController *)v14 primaryStateControlItem];

    if (!v16)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2, v15, @"HUQuickControlFaucetPanelViewController.m", 56, @"%@ was initialized with missing control items! Items: %@", v15, v13 object file lineNumber description];
    }
    v17 = (void *)MEMORY[0x1E4F1CA80];
    v18 = [(HUQuickControlFaucetPanelViewController *)v15 primaryStateControlItem];
    v19 = [v17 setWithObject:v18];

    v20 = [(HUQuickControlFaucetPanelViewController *)v15 temperatureControlItem];
    objc_msgSend(v19, "na_safeAddObject:", v20);

    v21 = objc_msgSend(v19, "na_map:", &__block_literal_global_60);
    v22 = [HUQuickControlCollectionItemManager alloc];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_2;
    v32[3] = &unk_1E6387220;
    id v33 = v21;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_3;
    v30[3] = &unk_1E6387220;
    v23 = v15;
    v31 = v23;
    id v24 = v21;
    v25 = [(HUQuickControlCollectionItemManager *)v22 initWithDelegate:0 gridItemProviderCreator:v32 supplementaryItemProviderCreator:v30];
    v26 = [[HUQuickControlCollectionViewController alloc] initWithItemManager:v25];
    collectionViewController = v23->_collectionViewController;
    v23->_collectionViewController = v26;
  }
  return v15;
}

id __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 copy];

  return v2;
}

id __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_2(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:*(void *)(a1 + 32)];

  return v1;
}

id __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F69558];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithHome:v4];

  v6 = [*(id *)(a1 + 32) childValvesControlItem];
  v7 = [v6 valueSource];
  v8 = [v7 valueSource];
  [v5 setValueSource:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_4;
  v10[3] = &unk_1E6387268;
  id v11 = *(id *)(a1 + 32);
  [v5 setSourceServiceGenerator:v10];

  return v5;
}

id __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_4(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) childValvesControlItem];
  uint64_t v2 = [v1 updateWithOptions:MEMORY[0x1E4F1CC08]];
  v3 = [v2 flatMap:&__block_literal_global_67];

  return v3;
}

id __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F688F0]];
  if (v3)
  {
    id v4 = [v2 futureWithResult:v3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CAD0] set];
    id v4 = [v2 futureWithResult:v5];
  }

  return v4;
}

- (void)viewDidLoad
{
  v39[4] = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)HUQuickControlFaucetPanelViewController;
  [(HUQuickControlFaucetPanelViewController *)&v38 viewDidLoad];
  v3 = [(HUQuickControlFaucetPanelViewController *)self collectionViewController];
  [(HUQuickControlFaucetPanelViewController *)self addChildViewController:v3];

  id v4 = [(HUQuickControlFaucetPanelViewController *)self collectionViewController];
  v5 = [v4 view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(HUQuickControlFaucetPanelViewController *)self collectionViewController];
  v7 = [v6 view];
  [v7 setPreservesSuperviewLayoutMargins:1];

  v8 = [(HUQuickControlFaucetPanelViewController *)self view];
  v9 = [(HUQuickControlFaucetPanelViewController *)self collectionViewController];
  v10 = [v9 view];
  [v8 addSubview:v10];

  v26 = (void *)MEMORY[0x1E4F28DC8];
  v37 = [(HUQuickControlFaucetPanelViewController *)self view];
  v35 = [v37 leadingAnchor];
  v36 = [(HUQuickControlFaucetPanelViewController *)self collectionViewController];
  objc_super v34 = [v36 view];
  id v33 = [v34 leadingAnchor];
  v32 = [v35 constraintEqualToAnchor:v33];
  v39[0] = v32;
  v31 = [(HUQuickControlFaucetPanelViewController *)self view];
  v29 = [v31 trailingAnchor];
  v30 = [(HUQuickControlFaucetPanelViewController *)self collectionViewController];
  v28 = [v30 view];
  v27 = [v28 trailingAnchor];
  v25 = [v29 constraintEqualToAnchor:v27];
  v39[1] = v25;
  id v24 = [(HUQuickControlFaucetPanelViewController *)self view];
  v22 = [v24 topAnchor];
  v23 = [(HUQuickControlFaucetPanelViewController *)self collectionViewController];
  v21 = [v23 view];
  id v11 = [v21 topAnchor];
  v12 = [v22 constraintEqualToAnchor:v11];
  v39[2] = v12;
  id v13 = [(HUQuickControlFaucetPanelViewController *)self view];
  v14 = [v13 bottomAnchor];
  v15 = [(HUQuickControlFaucetPanelViewController *)self collectionViewController];
  v16 = [v15 view];
  v17 = [v16 bottomAnchor];
  v18 = [v14 constraintEqualToAnchor:v17];
  v39[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  [v26 activateConstraints:v19];

  v20 = [(HUQuickControlFaucetPanelViewController *)self collectionViewController];
  [v20 didMoveToParentViewController:self];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)childQuickControlContentViewControllers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(HUQuickControlFaucetPanelViewController *)self collectionViewController];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)overrideStatusText
{
  return &stru_1F18F92B8;
}

- (id)_controlItemMatchingPredicate:(id)a3
{
  id v4 = a3;
  v5 = [(HUQuickControlViewController *)self controlItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__HUQuickControlFaucetPanelViewController__controlItemMatchingPredicate___block_invoke;
  v9[3] = &unk_1E6384EB8;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __73__HUQuickControlFaucetPanelViewController__controlItemMatchingPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesControlItem:a2];
}

- (HFPrimaryStateWriter)primaryStateControlItem
{
  v3 = [(id)objc_opt_class() _primaryStatePredicate];
  id v4 = [(HUQuickControlFaucetPanelViewController *)self _controlItemMatchingPredicate:v3];

  return (HFPrimaryStateWriter *)v4;
}

- (HFTemperatureThresholdControlItem)temperatureControlItem
{
  v3 = [(id)objc_opt_class() _temperaturePredicate];
  id v4 = [(HUQuickControlFaucetPanelViewController *)self _controlItemMatchingPredicate:v3];

  return (HFTemperatureThresholdControlItem *)v4;
}

- (HFChildServiceControlItem)childValvesControlItem
{
  v3 = [(id)objc_opt_class() _childValvesPredicate];
  id v4 = [(HUQuickControlFaucetPanelViewController *)self _controlItemMatchingPredicate:v3];

  return (HFChildServiceControlItem *)v4;
}

- (HUQuickControlCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void).cxx_destruct
{
}

@end