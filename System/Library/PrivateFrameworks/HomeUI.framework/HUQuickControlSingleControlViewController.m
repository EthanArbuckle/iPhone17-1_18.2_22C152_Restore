@interface HUQuickControlSingleControlViewController
+ (Class)controlItemClass;
+ (id)controlItemPredicate;
- (BOOL)_canShowWhileLocked;
- (BOOL)areWritesInProgressOrPossible;
- (BOOL)hasModelValueChangedForInteractionCoordinator:(id)a3;
- (BOOL)hasSetControlSize;
- (BOOL)hasWrittenAnyNewValues;
- (BOOL)isUserInteractionEnabled;
- (HFControlItem)controlItem;
- (HUQuickControlInteractionCoordinator)interactionCoordinator;
- (HUQuickControlSingleControlViewController)initWithControlItem:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7;
- (HUQuickControlSingleControlViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7;
- (HUQuickControlViewProfile)viewProfile;
- (NAValueThrottler)valueWriteThrottler;
- (double)horizontalControlCompressionFactor;
- (double)verticalDirectionalControlStretchFactor;
- (id)controlToViewValueTransformer;
- (id)createInteractionCoordinator;
- (id)createViewProfile;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)modelValue;
- (id)overrideSecondaryStatusText;
- (id)overrideStatusText;
- (id)overrideValueForCharacteristic:(id)a3;
- (id)viewForTouchContinuation;
- (unint64_t)inFlightWriteCount;
- (void)_setModelValue:(id)a3 writeValue:(BOOL)a4;
- (void)_updateControlTransform;
- (void)_updateControlViewReachabilityState;
- (void)_updateTitle;
- (void)_updateViewProfileForCurrentItemState;
- (void)_updateWriteState;
- (void)_writeModelControlValue:(id)a3;
- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3;
- (void)hideAuxiliaryViewForInteractionCoordinator:(id)a3;
- (void)interactionCoordinator:(id)a3 interactionStateDidChange:(BOOL)a4;
- (void)interactionCoordinator:(id)a3 showAuxiliaryView:(id)a4;
- (void)interactionCoordinator:(id)a3 viewValueDidChange:(id)a4;
- (void)interactionCoordinatorWantsDismissal:(id)a3;
- (void)loadView;
- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4;
- (void)setControlOrientation:(unint64_t)a3;
- (void)setControlSize:(unint64_t)a3;
- (void)setHasSetControlSize:(BOOL)a3;
- (void)setHasWrittenAnyNewValues:(BOOL)a3;
- (void)setHorizontalControlCompressionFactor:(double)a3;
- (void)setInFlightWriteCount:(unint64_t)a3;
- (void)setInteractionCoordinator:(id)a3;
- (void)setPreferredControl:(unint64_t)a3;
- (void)setPreferredFrameLayoutGuide:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setVerticalDirectionalControlStretchFactor:(double)a3;
- (void)setViewProfile:(id)a3;
- (void)setWritesInProgressOrPossible:(BOOL)a3;
- (void)updateValueFromControlItem;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUQuickControlSingleControlViewController

+ (id)controlItemPredicate
{
  v3 = [HUQuickControlSingleItemPredicate alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__HUQuickControlSingleControlViewController_controlItemPredicate__block_invoke;
  v6[3] = &__block_descriptor_40_e23_B16__0__HFControlItem_8l;
  v6[4] = a1;
  v4 = [(HUQuickControlSingleItemPredicate *)v3 initWithBlock:v6];

  return v4;
}

uint64_t __65__HUQuickControlSingleControlViewController_controlItemPredicate__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 controlItemClass];
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

- (HUQuickControlSingleControlViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a4;
  if ([v12 count] != 1) {
    NSLog(&cfstr_ShouldBeInitia.isa, self, v12);
  }
  v15 = [v12 anyObject];
  v16 = [(HUQuickControlSingleControlViewController *)self initWithControlItem:v15 home:v14 itemUpdater:v13 controlOrientation:a6 preferredControl:a7];

  return v16;
}

- (HUQuickControlSingleControlViewController)initWithControlItem:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  [(id)objc_opt_class() controlItemClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"HUQuickControlSingleControlViewController.m", 66, @"Invalid parameter not satisfying: %@", @"[originalControlItem isKindOfClass:[self.class controlItemClass]]" object file lineNumber description];
  }
  v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
  v39.receiver = self;
  v39.super_class = (Class)HUQuickControlSingleControlViewController;
  v17 = [(HUQuickControlViewController *)&v39 initWithControlItems:v16 home:v14 itemUpdater:v15 controlOrientation:a6 preferredControl:a7];

  if (v17)
  {
    v18 = [(HUQuickControlSingleControlViewController *)v17 controlItem];
    v19 = [v18 latestResults];
    v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F683B8]];
    v21 = v20;
    if (!v20) {
      v20 = (void *)MEMORY[0x1E4F1CC38];
    }
    int v22 = [v20 BOOLValue];

    if (v22) {
      double v23 = 0.25;
    }
    else {
      double v23 = INFINITY;
    }
    id v24 = objc_alloc(MEMORY[0x1E4F7A0F8]);
    v25 = [(HUQuickControlSingleControlViewController *)v17 controlItem];
    v26 = [v25 latestResults];
    v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];
    uint64_t v28 = [v24 initWithThrottleInterval:v27 initialValue:v23];
    valueWriteThrottler = v17->_valueWriteThrottler;
    v17->_valueWriteThrottler = (NAValueThrottler *)v28;

    objc_initWeak(&location, v17);
    v30 = [(HUQuickControlSingleControlViewController *)v17 valueWriteThrottler];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __118__HUQuickControlSingleControlViewController_initWithControlItem_home_itemUpdater_controlOrientation_preferredControl___block_invoke;
    v36[3] = &unk_1E63874A0;
    objc_copyWeak(&v37, &location);
    id v31 = (id)[v30 observeValueChangesWithBlock:v36];

    uint64_t v32 = [(HUQuickControlSingleControlViewController *)v17 createInteractionCoordinator];
    interactionCoordinator = v17->_interactionCoordinator;
    v17->_interactionCoordinator = (HUQuickControlInteractionCoordinator *)v32;

    v17->_hasSetControlSize = 0;
    [(HUQuickControlSingleControlViewController *)v17 _updateTitle];
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __118__HUQuickControlSingleControlViewController_initWithControlItem_home_itemUpdater_controlOrientation_preferredControl___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _writeModelControlValue:v3];
}

- (HFControlItem)controlItem
{
  id v3 = [(HUQuickControlViewController *)self controlItems];
  uint64_t v4 = [v3 count];

  if (v4 != 1)
  {
    v5 = [(HUQuickControlViewController *)self controlItems];
    NSLog(&cfstr_ShouldHaveExac.isa, self, v5);
  }
  v6 = [(HUQuickControlViewController *)self controlItems];
  v7 = [v6 anyObject];

  return (HFControlItem *)v7;
}

- (void)loadView
{
  id v3 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  uint64_t v4 = [v3 controlView];

  v5 = [[_HUQuickControlSingleControlHostView alloc] initWithContentView:v4];
  [(HUQuickControlSingleControlViewController *)self setView:v5];

  v6 = [(HUQuickControlViewController *)self preferredFrameLayoutGuide];
  v7 = [(HUQuickControlSingleControlViewController *)self view];
  [v7 setPreferredFrameLayoutGuide:v6];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HUQuickControlSingleControlViewController_loadView__block_invoke;
  v8[3] = &unk_1E6386018;
  v8[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v8];
}

uint64_t __53__HUQuickControlSingleControlViewController_loadView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateValueFromControlItem];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlSingleControlViewController;
  [(HUQuickControlSingleControlViewController *)&v5 viewWillAppear:a3];
  uint64_t v4 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  [v4 setViewVisible:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlSingleControlViewController;
  [(HUQuickControlSingleControlViewController *)&v5 viewDidDisappear:a3];
  uint64_t v4 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  [v4 setViewVisible:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setPreferredFrameLayoutGuide:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSingleControlViewController;
  [(HUQuickControlViewController *)&v6 setPreferredFrameLayoutGuide:v4];
  if ([(HUQuickControlSingleControlViewController *)self isViewLoaded])
  {
    objc_super v5 = [(HUQuickControlSingleControlViewController *)self view];
    [v5 setPreferredFrameLayoutGuide:v4];
  }
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  id v4 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  objc_super v5 = [v4 controlView];
  objc_super v6 = [v5 intrinsicSizeDescriptorForControlSize:a3];

  return v6;
}

- (id)overrideValueForCharacteristic:(id)a3
{
  id v4 = a3;
  if ([(HUQuickControlSingleControlViewController *)self areWritesInProgressOrPossible]
    && ([(HUQuickControlViewController *)self affectedCharacteristics],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 containsObject:v4],
        v5,
        v6))
  {
    v7 = [(HUQuickControlSingleControlViewController *)self controlItem];
    v8 = [(HUQuickControlSingleControlViewController *)self modelValue];
    v9 = [v7 characteristicValuesForValue:v8];
    v10 = [v4 characteristicType];
    v11 = [v9 objectForKeyedSubscript:v10];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HUQuickControlSingleControlViewController;
    v11 = [(HUQuickControlViewController *)&v13 overrideValueForCharacteristic:v4];
  }

  return v11;
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSingleControlViewController;
  id v4 = a3;
  [(HUQuickControlViewController *)&v6 beginUserInteractionWithFirstTouchGestureRecognizer:v4];
  objc_super v5 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  [v5 beginUserInteractionWithFirstTouchGestureRecognizer:v4];
}

- (void)setControlSize:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlSingleControlViewController;
  [(HUQuickControlViewController *)&v4 setControlSize:a3];
  [(HUQuickControlSingleControlViewController *)self setHasSetControlSize:1];
  [(HUQuickControlSingleControlViewController *)self invalidateViewProfile];
}

- (void)setControlOrientation:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSingleControlViewController;
  -[HUQuickControlViewController setControlOrientation:](&v6, sel_setControlOrientation_);
  objc_super v5 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  [v5 setOrientation:a3];

  [(HUQuickControlSingleControlViewController *)self invalidateViewProfile];
}

- (void)setPreferredControl:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlSingleControlViewController;
  [(HUQuickControlViewController *)&v4 setPreferredControl:a3];
  [(HUQuickControlSingleControlViewController *)self invalidateViewProfile];
}

- (HUQuickControlViewProfile)viewProfile
{
  viewProfile = self->_viewProfile;
  if (!viewProfile)
  {
    [(HUQuickControlSingleControlViewController *)self _updateViewProfileForCurrentItemState];
    viewProfile = self->_viewProfile;
  }

  return viewProfile;
}

- (BOOL)isUserInteractionEnabled
{
  v2 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  char v3 = [v2 isUserInteractionEnabled];

  return v3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  [v4 setUserInteractionEnabled:v3];
}

- (void)_setModelValue:(id)a3 writeValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id modelValue = self->_modelValue;
  id v12 = v7;
  if (modelValue == v7)
  {
    objc_storeStrong(&self->_modelValue, a3);
    v11 = [(HUQuickControlSingleControlViewController *)self valueWriteThrottler];
    [v11 setValue:v12 notifyObservers:v4];
  }
  else
  {
    char v9 = objc_msgSend(modelValue, "isEqual:");
    objc_storeStrong(&self->_modelValue, a3);
    v10 = [(HUQuickControlSingleControlViewController *)self valueWriteThrottler];
    [v10 setValue:v12 notifyObservers:v4];

    if ((v9 & 1) == 0) {
      [(HUQuickControlSingleControlViewController *)self modelValueDidChange];
    }
  }
}

- (void)updateValueFromControlItem
{
  BOOL v3 = [(HUQuickControlSingleControlViewController *)self controlItem];
  BOOL v4 = [v3 latestResults];
  id v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  objc_super v5 = v11;
  if (v11)
  {
    objc_super v6 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
    char v7 = [v6 isUserInteractionActive];

    if ((v7 & 1) == 0)
    {
      v8 = [(HUQuickControlSingleControlViewController *)self controlToViewValueTransformer];
      char v9 = [v8 transformedValueForValue:v11];
      v10 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
      [v10 setValue:v9];
    }
    [(HUQuickControlSingleControlViewController *)self _setModelValue:v11 writeValue:0];
    objc_super v5 = v11;
  }
}

- (void)_writeModelControlValue:(id)a3
{
  id v4 = a3;
  [(HUQuickControlSingleControlViewController *)self setInFlightWriteCount:[(HUQuickControlSingleControlViewController *)self inFlightWriteCount] + 1];
  [(HUQuickControlSingleControlViewController *)self setHasWrittenAnyNewValues:1];
  [(HUQuickControlSingleControlViewController *)self _updateWriteState];
  objc_initWeak(&location, self);
  objc_super v5 = [(HUQuickControlSingleControlViewController *)self controlItem];
  objc_super v6 = [v5 writeValue:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__HUQuickControlSingleControlViewController__writeModelControlValue___block_invoke;
  v8[3] = &unk_1E6389BC8;
  objc_copyWeak(&v9, &location);
  id v7 = (id)[v6 addCompletionBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __69__HUQuickControlSingleControlViewController__writeModelControlValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setInFlightWriteCount:", objc_msgSend(WeakRetained, "inFlightWriteCount") - 1);
  [WeakRetained inFlightWriteCount];
  [WeakRetained _updateWriteState];
}

- (void)_updateWriteState
{
  BOOL v3 = [(HUQuickControlSingleControlViewController *)self areWritesInProgressOrPossible];
  id v4 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  if (([v4 isUserInteractionActive] & 1) != 0
    || [(HUQuickControlSingleControlViewController *)self inFlightWriteCount])
  {
    [(HUQuickControlSingleControlViewController *)self setWritesInProgressOrPossible:1];
  }
  else
  {
    objc_super v5 = [(HUQuickControlSingleControlViewController *)self valueWriteThrottler];
    -[HUQuickControlSingleControlViewController setWritesInProgressOrPossible:](self, "setWritesInProgressOrPossible:", [v5 hasPendingValueChange]);
  }
  if (v3 != [(HUQuickControlSingleControlViewController *)self areWritesInProgressOrPossible])
  {
    objc_super v6 = [(HUQuickControlSingleControlViewController *)self controlItem];
    id v7 = [v6 characteristicOptions];
    v8 = [v7 objectForKeyedSubscript:&unk_1F19B5150];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__HUQuickControlSingleControlViewController__updateWriteState__block_invoke;
    v12[3] = &unk_1E6384F48;
    v12[4] = self;
    id v9 = objc_msgSend(v8, "na_flatMap:", v12);

    LODWORD(v7) = [(HUQuickControlSingleControlViewController *)self areWritesInProgressOrPossible];
    v10 = [(HUQuickControlViewController *)self characteristicWritingDelegate];
    id v11 = v10;
    if (v7) {
      [v10 quickControlContent:self willBeginPossibleWritesForCharacteristics:v9];
    }
    else {
      [v10 quickControlContent:self didEndPossibleWritesForCharacteristics:v9];
    }
  }
}

id __62__HUQuickControlSingleControlViewController__updateWriteState__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 controlItem];
  objc_super v5 = [v4 valueSource];
  objc_super v6 = [v5 allCharacteristicsForCharacteristicType:v3];

  return v6;
}

- (void)_updateTitle
{
  id v6 = [(HUQuickControlSingleControlViewController *)self controlItem];
  id v3 = [v6 latestResults];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  if (v4)
  {
    [(HUQuickControlSingleControlViewController *)self setTitle:v4];
  }
  else
  {
    objc_super v5 = HFLocalizedString();
    [(HUQuickControlSingleControlViewController *)self setTitle:v5];
  }
}

- (void)_updateViewProfileForCurrentItemState
{
  id v19 = [(HUQuickControlSingleControlViewController *)self createViewProfile];
  objc_msgSend(v19, "setControlSize:", -[HUQuickControlViewController controlSize](self, "controlSize"));
  id v3 = [(HUQuickControlSingleControlViewController *)self controlItem];
  id v4 = [v3 latestResults];
  objc_super v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68CB0]];
  objc_msgSend(v19, "setSuspendedState:", objc_msgSend(v5, "unsignedIntegerValue"));

  objc_msgSend(v19, "setOrientation:", -[HUQuickControlViewController controlOrientation](self, "controlOrientation"));
  id v6 = [(HUQuickControlSingleControlViewController *)self controlItem];
  id v7 = [v6 latestResults];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F683D0]];
  [v19 setSupplementaryFormattedValue:v8];

  id v9 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v10 = [v9 latestResults];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F683B0]];
  [v19 setDecorationIconDescriptor:v11];

  id v12 = [(HUQuickControlSingleControlViewController *)self controlItem];
  objc_super v13 = objc_msgSend(v12, "hu_tintColor");
  [v19 setTintColor:v13];

  [(HUQuickControlSingleControlViewController *)self setViewProfile:v19];
  id v14 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  id v15 = [v14 controlView];

  v16 = [v15 profile];
  if (v16)
  {
    uint64_t v17 = objc_opt_class();
    if (v17 == objc_opt_class())
    {
      [v15 setProfile:v19];
    }
    else
    {
      v18 = [(HUQuickControlSingleControlViewController *)self createInteractionCoordinator];
      [(HUQuickControlSingleControlViewController *)self setInteractionCoordinator:v18];
    }
  }
}

- (void)_updateControlTransform
{
  [(HUQuickControlSingleControlViewController *)self horizontalControlCompressionFactor];
  CGFloat v4 = 1.0 - v3;
  [(HUQuickControlSingleControlViewController *)self verticalDirectionalControlStretchFactor];
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v4, fabs(v5) + 1.0);
  id v6 = [(HUQuickControlSingleControlViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  [(HUQuickControlSingleControlViewController *)self verticalDirectionalControlStretchFactor];
  CGAffineTransform v13 = v15;
  CGAffineTransformTranslate(&v14, &v13, 0.0, v8 * v9 * -0.5);
  CGAffineTransform v15 = v14;

  CGAffineTransform v12 = v15;
  v10 = [(HUQuickControlSingleControlViewController *)self view];
  CGAffineTransform v11 = v12;
  [v10 setTransform:&v11];
}

- (void)setHorizontalControlCompressionFactor:(double)a3
{
  if ((NACGFloatEqualToFloat() & 1) == 0)
  {
    self->_horizontalControlCompressionFactor = a3;
    [(HUQuickControlSingleControlViewController *)self _updateControlTransform];
  }
}

- (void)setVerticalDirectionalControlStretchFactor:(double)a3
{
  if ((NACGFloatEqualToFloat() & 1) == 0)
  {
    self->_verticalDirectionalControlStretchFactor = a3;
    [(HUQuickControlSingleControlViewController *)self _updateControlTransform];
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlSingleControlViewController;
  [(HUQuickControlSingleControlViewController *)&v3 viewDidLayoutSubviews];
  [(HUQuickControlSingleControlViewController *)self _updateControlTransform];
}

- (id)createInteractionCoordinator
{
  CGFloat v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUQuickControlSingleControlViewController.m", 343, @"%s is an abstract method that must be overriden by subclass %@", "-[HUQuickControlSingleControlViewController createInteractionCoordinator]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (Class)controlItemClass
{
  CGFloat v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HUQuickControlSingleControlViewController.m", 349, @"%s is an abstract method that must be overriden by subclass %@", "+[HUQuickControlSingleControlViewController controlItemClass]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)createViewProfile
{
  CGFloat v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUQuickControlSingleControlViewController.m", 355, @"%s is an abstract method that must be overriden by subclass %@", "-[HUQuickControlSingleControlViewController createViewProfile]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)controlToViewValueTransformer
{
  return (id)[MEMORY[0x1E4F69760] identityTransformer];
}

- (id)overrideStatusText
{
  v2 = [(HUQuickControlSingleControlViewController *)self controlItem];
  objc_super v3 = [v2 latestResults];
  CGFloat v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68948]];

  return v4;
}

- (id)overrideSecondaryStatusText
{
  return 0;
}

- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlSingleControlViewController;
  [(HUQuickControlViewController *)&v10 quickControlItemUpdater:a3 didUpdateResultsForControlItems:v6];
  double v7 = [(HUQuickControlSingleControlViewController *)self controlItem];
  char v8 = [v6 containsObject:v7];

  if ((v8 & 1) == 0)
  {
    double v9 = [(HUQuickControlSingleControlViewController *)self controlItem];
    NSLog(&cfstr_UnexpectedUpda.isa, v6, v9);
  }
  if (![(HUQuickControlSingleControlViewController *)self areWritesInProgressOrPossible])[(HUQuickControlSingleControlViewController *)self updateValueFromControlItem]; {
  [(HUQuickControlSingleControlViewController *)self _updateTitle];
  }
  [(HUQuickControlSingleControlViewController *)self invalidateViewProfile];
  [(HUQuickControlSingleControlViewController *)self _updateControlViewReachabilityState];
}

- (void)_updateControlViewReachabilityState
{
  objc_super v3 = [(HUQuickControlSingleControlViewController *)self controlItem];
  CGFloat v4 = [v3 latestResults];
  id v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68C40]];

  if (v12) {
    uint64_t v5 = [v12 category] == 1;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  double v7 = [v6 controlView];
  if ([v7 conformsToProtocol:&unk_1F1A161E8])
  {
    char v8 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
    double v9 = [v8 controlView];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
    CGAffineTransform v11 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
    id v6 = [v11 controlView];

    [v6 setReachabilityState:v5];
  }
  else
  {
  }
LABEL_9:
}

- (void)interactionCoordinator:(id)a3 viewValueDidChange:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if (([v20 isUserInteractionActive] & 1) == 0) {
    NSLog(&cfstr_ReceivedAValue.isa, v20);
  }
  double v7 = [(HUQuickControlSingleControlViewController *)self controlToViewValueTransformer];
  char v8 = [v7 valueForTransformedValue:v6];

  double v9 = [(HUQuickControlSingleControlViewController *)self controlItem];
  char v10 = [v9 normalizedValueForValue:v8];

  CGAffineTransform v11 = [(HUQuickControlSingleControlViewController *)self controlItem];
  id v12 = [v11 latestResults];
  CGAffineTransform v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];
  char v14 = [v13 isEqual:v10];

  if ((v14 & 1) == 0)
  {
    CGAffineTransform v15 = [(HUQuickControlSingleControlViewController *)self controlItem];
    v16 = [v15 latestResults];
    uint64_t v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F683C8]];
    uint64_t v18 = [v17 isEqual:MEMORY[0x1E4F1CC38]] ^ 1;

    [(HUQuickControlSingleControlViewController *)self _setModelValue:v10 writeValue:v18];
  }
  id v19 = [(HUQuickControlViewController *)self characteristicWritingDelegate];
  [v19 quickControlContentDidUpdateCharacteristicValueOverrides:self];
}

- (void)interactionCoordinator:(id)a3 interactionStateDidChange:(BOOL)a4
{
  if (!a4)
  {
    uint64_t v5 = [(HUQuickControlSingleControlViewController *)self valueWriteThrottler];
    [v5 flushValueChanges];
  }

  [(HUQuickControlSingleControlViewController *)self _updateWriteState];
}

- (BOOL)hasModelValueChangedForInteractionCoordinator:(id)a3
{
  if ([(HUQuickControlSingleControlViewController *)self hasWrittenAnyNewValues]) {
    return 1;
  }
  uint64_t v5 = [(HUQuickControlSingleControlViewController *)self valueWriteThrottler];
  char v6 = [v5 hasPendingValueChange];

  return v6;
}

- (void)interactionCoordinatorWantsDismissal:(id)a3
{
  id v4 = [(HUQuickControlViewController *)self quickControlHost];
  [v4 quickControlContent:self requestDismissalOfType:1];
}

- (void)interactionCoordinator:(id)a3 showAuxiliaryView:(id)a4
{
  id v5 = a4;
  id v6 = [(HUQuickControlViewController *)self quickControlHost];
  [v6 quickControlContent:self showAuxiliaryView:v5];
}

- (void)hideAuxiliaryViewForInteractionCoordinator:(id)a3
{
  id v4 = [(HUQuickControlViewController *)self quickControlHost];
  [v4 hideAuxiliaryViewForQuickControlContent:self];
}

- (id)viewForTouchContinuation
{
  objc_super v3 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  [v3 recordInteractionStart];

  id v4 = [(HUQuickControlSingleControlViewController *)self interactionCoordinator];
  id v5 = [v4 controlView];

  return v5;
}

- (HUQuickControlInteractionCoordinator)interactionCoordinator
{
  return self->_interactionCoordinator;
}

- (void)setInteractionCoordinator:(id)a3
{
}

- (id)modelValue
{
  return self->_modelValue;
}

- (BOOL)areWritesInProgressOrPossible
{
  return self->_writesInProgressOrPossible;
}

- (void)setWritesInProgressOrPossible:(BOOL)a3
{
  self->_writesInProgressOrPossible = a3;
}

- (NAValueThrottler)valueWriteThrottler
{
  return self->_valueWriteThrottler;
}

- (unint64_t)inFlightWriteCount
{
  return self->_inFlightWriteCount;
}

- (void)setInFlightWriteCount:(unint64_t)a3
{
  self->_inFlightWriteCount = a3;
}

- (BOOL)hasWrittenAnyNewValues
{
  return self->_hasWrittenAnyNewValues;
}

- (void)setHasWrittenAnyNewValues:(BOOL)a3
{
  self->_hasWrittenAnyNewValues = a3;
}

- (void)setViewProfile:(id)a3
{
}

- (double)verticalDirectionalControlStretchFactor
{
  return self->_verticalDirectionalControlStretchFactor;
}

- (double)horizontalControlCompressionFactor
{
  return self->_horizontalControlCompressionFactor;
}

- (BOOL)hasSetControlSize
{
  return self->_hasSetControlSize;
}

- (void)setHasSetControlSize:(BOOL)a3
{
  self->_hasSetControlSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewProfile, 0);
  objc_storeStrong((id *)&self->_valueWriteThrottler, 0);
  objc_storeStrong(&self->_modelValue, 0);

  objc_storeStrong((id *)&self->_interactionCoordinator, 0);
}

@end