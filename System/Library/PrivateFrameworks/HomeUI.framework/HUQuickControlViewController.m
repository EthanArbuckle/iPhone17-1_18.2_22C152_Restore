@interface HUQuickControlViewController
+ (HUQuickControlItemPredicate)controlItemPredicate;
- (BOOL)areControlItemsRequestingToBeHidden;
- (BOOL)areControlsVisible;
- (BOOL)hasSingleControlView;
- (BOOL)isUserInteractionEnabled;
- (BOOL)shouldShowContentForReachabilityState:(BOOL)a3;
- (HMHome)home;
- (HULayoutAnchorProviding)preferredFrameLayoutGuide;
- (HUQuickControlContentCharacteristicWritingDelegate)characteristicWritingDelegate;
- (HUQuickControlContentHosting)quickControlHost;
- (HUQuickControlContentRequiringHelper)childVCThatRequiresHelper;
- (HUQuickControlItemUpdating)itemUpdater;
- (HUQuickControlSimpleItemUpdater)internalItemUpdater;
- (HUQuickControlViewController)initWithCoder:(id)a3;
- (HUQuickControlViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7;
- (HUQuickControlViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HUQuickControlViewControllerDelegate)delegate;
- (NSSet)affectedCharacteristics;
- (NSSet)controlItems;
- (NSString)overrideSecondaryStatusText;
- (NSString)overrideStatusText;
- (id)childQuickControlContentViewControllers;
- (id)hu_preloadContent;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)overrideValueForCharacteristic:(id)a3;
- (id)viewControllerForTouchContinuation;
- (unint64_t)controlOrientation;
- (unint64_t)controlSize;
- (unint64_t)preferredControl;
- (unint64_t)preferredPresentationStyle;
- (void)_updateControlItemHiddenStateNotifyingHost:(BOOL)a3;
- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3;
- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4;
- (void)setAreControlItemsRequestingToBeHidden:(BOOL)a3;
- (void)setCharacteristicWritingDelegate:(id)a3;
- (void)setChildVCThatRequiresHelper:(id)a3;
- (void)setControlOrientation:(unint64_t)a3;
- (void)setControlSize:(unint64_t)a3;
- (void)setControlsVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferredControl:(unint64_t)a3;
- (void)setPreferredFrameLayoutGuide:(id)a3;
- (void)setQuickControlHost:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation HUQuickControlViewController

+ (HUQuickControlItemPredicate)controlItemPredicate
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HUQuickControlViewController.m", 35, @"%s is an abstract method that must be overriden by subclass %@", "+[HUQuickControlViewController controlItemPredicate]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (HUQuickControlViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v15 = (HUQuickControlSimpleItemUpdater *)a5;
  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlViewController;
  v16 = [(HUQuickControlViewController *)&v21 initWithNibName:0 bundle:0];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_controlItems, a3);
    objc_storeStrong((id *)&v17->_home, a4);
    if (!v15)
    {
      v18 = [[HUQuickControlSimpleItemUpdater alloc] initWithItemHost:v17];
      internalItemUpdater = v17->_internalItemUpdater;
      v17->_internalItemUpdater = v18;

      v15 = v17->_internalItemUpdater;
    }
    objc_storeWeak((id *)&v17->_itemUpdater, v15);
    v17->_controlOrientation = a6;
    v17->_preferredControl = a7;
    [(HUQuickControlViewController *)v17 _updateControlItemHiddenStateNotifyingHost:0];
  }

  return v17;
}

- (HUQuickControlViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUQuickControlViewController.m", 62, @"%s is unavailable; use %@ instead",
    "-[HUQuickControlViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HUQuickControlViewController)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUQuickControlViewController.m", 67, @"%s is unavailable; use %@ instead",
    "-[HUQuickControlViewController initWithCoder:]",
    v6);

  return 0;
}

- (unint64_t)preferredPresentationStyle
{
  return 0;
}

- (id)hu_preloadContent
{
  return (id)[MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (HULayoutAnchorProviding)preferredFrameLayoutGuide
{
  preferredFrameLayoutGuide = self->_preferredFrameLayoutGuide;
  if (preferredFrameLayoutGuide)
  {
    v3 = preferredFrameLayoutGuide;
  }
  else
  {
    v3 = [(HUQuickControlViewController *)self view];
  }

  return v3;
}

- (void)setPreferredFrameLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFrameLayoutGuide, a3);
  id v5 = a3;
  v6 = [(HUQuickControlViewController *)self childQuickControlContentViewControllers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HUQuickControlViewController_setPreferredFrameLayoutGuide___block_invoke;
  v7[3] = &unk_1E6384F00;
  v7[4] = self;
  objc_msgSend(v6, "na_each:", v7);
}

void __61__HUQuickControlViewController_setPreferredFrameLayoutGuide___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 preferredFrameLayoutGuide];
  [v3 setPreferredFrameLayoutGuide:v4];
}

- (void)setControlsVisible:(BOOL)a3
{
  if (self->_controlsVisible != a3)
  {
    BOOL v3 = a3;
    self->_controlsVisible = a3;
    id v5 = [(HUQuickControlViewController *)self itemUpdater];
    [v5 quickControlItemHost:self didUpdateVisibility:v3];
  }
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  return +[HUIntrinsicSizeDescriptor noIntrinsicSizeDescriptor];
}

- (BOOL)hasSingleControlView
{
  return 0;
}

- (BOOL)shouldShowContentForReachabilityState:(BOOL)a3
{
  if (a3) {
    return ![(HUQuickControlViewController *)self areControlItemsRequestingToBeHidden];
  }
  else {
    return 0;
  }
}

- (NSString)overrideStatusText
{
  return 0;
}

- (NSString)overrideSecondaryStatusText
{
  return 0;
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlViewController *)self childQuickControlContentViewControllers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__HUQuickControlViewController_beginUserInteractionWithFirstTouchGestureRecognizer___block_invoke;
  v7[3] = &unk_1E6384F00;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "na_each:", v7);
}

uint64_t __84__HUQuickControlViewController_beginUserInteractionWithFirstTouchGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 beginUserInteractionWithFirstTouchGestureRecognizer:*(void *)(a1 + 32)];
}

- (id)overrideValueForCharacteristic:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(HUQuickControlViewController *)self childQuickControlContentViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) overrideValueForCharacteristic:v4];
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (NSSet)affectedCharacteristics
{
  BOOL v3 = [(HUQuickControlViewController *)self controlItems];
  id v4 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_2);

  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [(HUQuickControlViewController *)self childQuickControlContentViewControllers];
  uint64_t v7 = [v5 setWithArray:v6];
  uint64_t v8 = objc_msgSend(v7, "na_flatMap:", &__block_literal_global_20);

  v9 = [v4 setByAddingObjectsFromSet:v8];

  return (NSSet *)v9;
}

id __55__HUQuickControlViewController_affectedCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 characteristicOptions];
  id v4 = [v3 objectForKeyedSubscript:&unk_1F19B39F8];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HUQuickControlViewController_affectedCharacteristics__block_invoke_15;
  v8[3] = &unk_1E6384F48;
  id v9 = v2;
  id v5 = v2;
  uint64_t v6 = objc_msgSend(v4, "na_flatMap:", v8);

  return v6;
}

id __55__HUQuickControlViewController_affectedCharacteristics__block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 valueSource];
  id v5 = [v4 allCharacteristicsForCharacteristicType:v3];

  return v5;
}

uint64_t __55__HUQuickControlViewController_affectedCharacteristics__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 affectedCharacteristics];
}

- (id)childQuickControlContentViewControllers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setCharacteristicWritingDelegate:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_characteristicWritingDelegate, v4);
  id v5 = [(HUQuickControlViewController *)self childQuickControlContentViewControllers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__HUQuickControlViewController_setCharacteristicWritingDelegate___block_invoke;
  v7[3] = &unk_1E6384F00;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "na_each:", v7);
}

uint64_t __65__HUQuickControlViewController_setCharacteristicWritingDelegate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCharacteristicWritingDelegate:*(void *)(a1 + 32)];
}

- (void)setQuickControlHost:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_quickControlHost, v4);
  id v5 = [(HUQuickControlViewController *)self childQuickControlContentViewControllers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HUQuickControlViewController_setQuickControlHost___block_invoke;
  v7[3] = &unk_1E6384F00;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "na_each:", v7);
}

uint64_t __52__HUQuickControlViewController_setQuickControlHost___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setQuickControlHost:*(void *)(a1 + 32)];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
  id v4 = [(HUQuickControlViewController *)self childQuickControlContentViewControllers];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__HUQuickControlViewController_setUserInteractionEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e114_v16__0__UIViewController_HUQuickControlInteractiveContentContaining__HUQuickControlContentCharacteristicWriting__8l;
  BOOL v6 = a3;
  objc_msgSend(v4, "na_each:", v5);
}

uint64_t __58__HUQuickControlViewController_setUserInteractionEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInteractionEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (id)viewControllerForTouchContinuation
{
  id v2 = [(HUQuickControlViewController *)self childQuickControlContentViewControllers];
  id v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_23);

  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

uint64_t __66__HUQuickControlViewController_viewControllerForTouchContinuation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F1A0CFD8];
}

- (void)_updateControlItemHiddenStateNotifyingHost:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(HUQuickControlViewController *)self areControlItemsRequestingToBeHidden];
  id v6 = [(HUQuickControlViewController *)self controlItems];
  -[HUQuickControlViewController setAreControlItemsRequestingToBeHidden:](self, "setAreControlItemsRequestingToBeHidden:", objc_msgSend(v6, "na_all:", &__block_literal_global_71));

  if (v3
    && v5 != [(HUQuickControlViewController *)self areControlItemsRequestingToBeHidden])
  {
    id v7 = [(HUQuickControlViewController *)self quickControlHost];
    [v7 quickControlContentDidUpdateDesiredVisbilityState:self];
  }
}

uint64_t __75__HUQuickControlViewController__updateControlItemHiddenStateNotifyingHost___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 latestResults];
  BOOL v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  id v4 = v3;
  if (!v3) {
    BOOL v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  uint64_t v5 = [v3 BOOLValue];

  return v5;
}

- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4
{
}

- (BOOL)areControlsVisible
{
  return self->_controlsVisible;
}

- (HUQuickControlContentCharacteristicWritingDelegate)characteristicWritingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_characteristicWritingDelegate);

  return (HUQuickControlContentCharacteristicWritingDelegate *)WeakRetained;
}

- (HUQuickControlContentHosting)quickControlHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quickControlHost);

  return (HUQuickControlContentHosting *)WeakRetained;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (HMHome)home
{
  return self->_home;
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (HUQuickControlItemUpdating)itemUpdater
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemUpdater);

  return (HUQuickControlItemUpdating *)WeakRetained;
}

- (HUQuickControlViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUQuickControlViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (void)setControlSize:(unint64_t)a3
{
  self->_controlSize = a3;
}

- (unint64_t)controlOrientation
{
  return self->_controlOrientation;
}

- (void)setControlOrientation:(unint64_t)a3
{
  self->_controlOrientation = a3;
}

- (unint64_t)preferredControl
{
  return self->_preferredControl;
}

- (void)setPreferredControl:(unint64_t)a3
{
  self->_preferredControl = a3;
}

- (HUQuickControlContentRequiringHelper)childVCThatRequiresHelper
{
  return self->_childVCThatRequiresHelper;
}

- (void)setChildVCThatRequiresHelper:(id)a3
{
}

- (HUQuickControlSimpleItemUpdater)internalItemUpdater
{
  return self->_internalItemUpdater;
}

- (BOOL)areControlItemsRequestingToBeHidden
{
  return self->_areControlItemsRequestingToBeHidden;
}

- (void)setAreControlItemsRequestingToBeHidden:(BOOL)a3
{
  self->_areControlItemsRequestingToBeHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalItemUpdater, 0);
  objc_storeStrong((id *)&self->_childVCThatRequiresHelper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_itemUpdater);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_preferredFrameLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_quickControlHost);

  objc_destroyWeak((id *)&self->_characteristicWritingDelegate);
}

@end