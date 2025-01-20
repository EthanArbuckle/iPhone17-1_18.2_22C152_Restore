@interface HUQuickControlIncrementalStateViewController
+ (Class)controlItemClass;
- (id)_createControlView;
- (id)controlToViewValueTransformer;
- (id)createInteractionCoordinator;
- (id)createViewProfile;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUQuickControlIncrementalStateViewController

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlIncrementalStateViewController;
  [(HUQuickControlSingleControlViewController *)&v8 viewWillAppear:a3];
  if (![(HUQuickControlSingleControlViewController *)self hasSetControlSize])
  {
    v4 = [(HUQuickControlIncrementalStateViewController *)self view];
    [v4 frame];
    uint64_t v7 = HUViewSizeSubclassForViewSize(v5, v6);

    [(HUQuickControlSingleControlViewController *)self setControlSize:+[HUQuickControlUtilities sliderQuickControlSizeForViewSizeSubclass:v7]];
  }
}

- (id)_createControlView
{
  v3 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  uint64_t v4 = objc_opt_class();

  if (v4 == objc_opt_class() || v4 == objc_opt_class()) {
    double v5 = (objc_class *)objc_opt_class();
  }
  else {
    double v5 = 0;
  }
  id v6 = [v5 alloc];
  uint64_t v7 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  objc_super v8 = (void *)[v6 initWithProfile:v7];

  return v8;
}

- (id)createInteractionCoordinator
{
  v3 = [HUQuickControlElasticSliderInteractionCoordinator alloc];
  uint64_t v4 = [(HUQuickControlIncrementalStateViewController *)self _createControlView];
  double v5 = [(HUQuickControlElasticSliderInteractionCoordinator *)v3 initWithControlView:v4 delegate:self];

  return v5;
}

- (id)createViewProfile
{
  v3 = [(HUQuickControlSingleControlViewController *)self controlItem];
  uint64_t v4 = [(HUQuickControlSingleControlViewController *)self controlItem];
  double v5 = [v4 incrementalCharacteristicType];
  id v6 = [v3 metadataForCharacteristicType:v5];

  uint64_t v7 = objc_alloc_init(HUQuickControlSliderViewProfile);
  objc_super v8 = objc_msgSend(v6, "hf_numericValueConstraints");
  v9 = [v8 percentageConstraints];
  [(HUQuickControlSliderViewProfile *)v7 setPrimaryValueConstraints:v9];

  v10 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v11 = [v10 latestResults];
  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68698]];
  unsigned int v13 = [v12 BOOLValue];

  [(HUQuickControlSliderViewProfile *)v7 setPreferredFillSection:v13];
  [(HUQuickControlSliderViewProfile *)v7 setHasOffState:v13 ^ 1];

  return v7;
}

- (id)controlToViewValueTransformer
{
  v2 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 numberOfSegments];
    uint64_t v4 = (void *)MEMORY[0x1E4F69760];
    uint64_t v5 = objc_opt_class();
    v9[4] = v3;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__HUQuickControlIncrementalStateViewController_controlToViewValueTransformer__block_invoke;
    v10[3] = &__block_descriptor_40_e18__16__0__NSNumber_8l;
    v10[4] = v3;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__HUQuickControlIncrementalStateViewController_controlToViewValueTransformer__block_invoke_2;
    v9[3] = &__block_descriptor_40_e18__16__0__NSNumber_8l;
    uint64_t v6 = [v4 transformerForValueClass:v5 transformBlock:v10 reverseTransformBlock:v9];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F69760] identityTransformer];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

uint64_t __77__HUQuickControlIncrementalStateViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = NSNumber;
  [a2 doubleValue];
  double v5 = v4 * (double)*(unint64_t *)(a1 + 32);

  return [v3 numberWithDouble:v5];
}

uint64_t __77__HUQuickControlIncrementalStateViewController_controlToViewValueTransformer__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = NSNumber;
  [a2 doubleValue];
  double v5 = v4 / (double)*(unint64_t *)(a1 + 32);

  return [v3 numberWithDouble:v5];
}

@end