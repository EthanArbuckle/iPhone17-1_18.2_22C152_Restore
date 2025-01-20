@interface HUQuickControlPrimaryStateViewController
+ (Class)controlItemClass;
+ (id)controlItemPredicate;
- (BOOL)_isCharacteristicTypeRotationDirection;
- (id)controlToViewValueTransformer;
- (id)createInteractionCoordinator;
- (id)createViewProfile;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUQuickControlPrimaryStateViewController

+ (id)controlItemPredicate
{
  v2 = [[HUQuickControlSingleItemPredicate alloc] initWithBlock:&__block_literal_global_83];

  return v2;
}

uint64_t __64__HUQuickControlPrimaryStateViewController_controlItemPredicate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F1AD9090];
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlPrimaryStateViewController;
  [(HUQuickControlSingleControlViewController *)&v10 viewWillAppear:a3];
  if (![(HUQuickControlSingleControlViewController *)self hasSetControlSize])
  {
    v4 = [(HUQuickControlSingleControlViewController *)self viewProfile];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v6 = [(HUQuickControlPrimaryStateViewController *)self view];
      [v6 frame];
      uint64_t v9 = HUViewSizeSubclassForViewSize(v7, v8);

      [(HUQuickControlSingleControlViewController *)self setControlSize:+[HUQuickControlUtilities sliderQuickControlSizeForViewSizeSubclass:v9]];
    }
  }
}

- (id)createInteractionCoordinator
{
  v3 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [HUQuickControlPushButtonView alloc];
    v6 = [(HUQuickControlSingleControlViewController *)self viewProfile];
    double v7 = [(HUQuickControlPushButtonView *)v5 initWithProfile:v6];
    double v8 = off_1E6382348;
  }
  else
  {
    uint64_t v9 = [HUQuickControlSwitchView alloc];
    v6 = [(HUQuickControlSingleControlViewController *)self viewProfile];
    double v7 = [(HUQuickControlSwitchView *)v9 initWithProfile:v6];
    double v8 = off_1E6382220;
  }

  objc_super v10 = (void *)[objc_alloc(*v8) initWithControlView:v7 delegate:self];

  return v10;
}

- (id)createViewProfile
{
  v3 = [(HUQuickControlSingleControlViewController *)self controlItem];
  BOOL v4 = +[HUQuickControlUtilities shouldDisplayQuickControlAsPushButton:v3 preferredControl:[(HUQuickControlViewController *)self preferredControl]];

  if (v4)
  {
    v5 = objc_alloc_init(HUQuickControlPushButtonViewProfile);
    [(HUQuickControlPushButtonViewProfile *)v5 setToggleColorScheme:[(HUQuickControlPrimaryStateViewController *)self _isCharacteristicTypeRotationDirection] ^ 1];
  }
  else
  {
    v5 = objc_alloc_init(HUQuickControlSwitchViewProfile);
  }

  return v5;
}

- (id)controlToViewValueTransformer
{
  v2 = (void *)MEMORY[0x1E4F69760];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 transformerForValueClass:v3 transformBlock:&__block_literal_global_60_0 reverseTransformBlock:&__block_literal_global_66_0];
}

void *__73__HUQuickControlPrimaryStateViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 integerValue] == 2) {
    return &unk_1F19B41A8;
  }
  else {
    return &unk_1F19B41C0;
  }
}

uint64_t __73__HUQuickControlPrimaryStateViewController_controlToViewValueTransformer__block_invoke_64(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  uint64_t v3 = NSNumber;
  if ((uint64_t)llround(v2) < 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }

  return [v3 numberWithInteger:v4];
}

- (BOOL)_isCharacteristicTypeRotationDirection
{
  double v2 = [(HUQuickControlSingleControlViewController *)self controlItem];
  uint64_t v3 = [v2 characteristicOptions];
  uint64_t v4 = [v3 characteristicTypesForUsage:0];
  v5 = [v4 allObjects];
  v6 = [v5 firstObject];

  LOBYTE(v2) = [v6 isEqualToString:*MEMORY[0x1E4F2CF80]];
  return (char)v2;
}

@end