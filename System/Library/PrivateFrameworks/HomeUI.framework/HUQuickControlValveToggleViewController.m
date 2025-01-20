@interface HUQuickControlValveToggleViewController
+ (Class)controlItemClass;
+ (id)controlItemPredicate;
- (HUQuickControlValveToggleView)controlView;
- (id)controlToViewValueTransformer;
- (id)createInteractionCoordinator;
- (id)createViewProfile;
- (void)setControlView:(id)a3;
@end

@implementation HUQuickControlValveToggleViewController

+ (id)controlItemPredicate
{
  v2 = [[HUQuickControlSingleItemPredicate alloc] initWithBlock:&__block_literal_global_23];

  return v2;
}

uint64_t __63__HUQuickControlValveToggleViewController_controlItemPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 valueSource];
  v4 = [v3 primaryServiceDescriptor];

  v5 = [v4 parentServiceDescriptor];
  v6 = [v5 serviceType];

  if ([(id)*MEMORY[0x1E4F2DE30] isEqualToString:v6]) {
    uint64_t v7 = [v2 conformsToProtocol:&unk_1F1AD9090];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (id)createInteractionCoordinator
{
  v3 = [HUQuickControlValveToggleView alloc];
  v4 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  v5 = [(HUQuickControlValveToggleView *)v3 initWithProfile:v4];

  v6 = [[HUQuickControlSimpleInteractionCoordinator alloc] initWithControlView:v5 delegate:self];

  return v6;
}

- (id)createViewProfile
{
  v3 = objc_alloc_init(HUQuickControlSwitchViewProfile);
  [(HUQuickControlViewProfile *)v3 setControlSize:[(HUQuickControlViewController *)self controlSize]];

  return v3;
}

- (id)controlToViewValueTransformer
{
  id v2 = (void *)MEMORY[0x1E4F69760];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 transformerForValueClass:v3 transformBlock:&__block_literal_global_55 reverseTransformBlock:&__block_literal_global_61];
}

void *__72__HUQuickControlValveToggleViewController_controlToViewValueTransformer__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 integerValue] == 2) {
    return &unk_1F19B3A88;
  }
  else {
    return &unk_1F19B3AA0;
  }
}

uint64_t __72__HUQuickControlValveToggleViewController_controlToViewValueTransformer__block_invoke_59(uint64_t a1, void *a2)
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

- (HUQuickControlValveToggleView)controlView
{
  return self->_controlView;
}

- (void)setControlView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end