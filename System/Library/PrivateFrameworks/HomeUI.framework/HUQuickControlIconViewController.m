@interface HUQuickControlIconViewController
+ (Class)controlItemClass;
+ (id)controlItemPredicate;
- (HUQuickControlIconView)quickControlIconView;
- (id)createInteractionCoordinator;
- (id)createViewProfile;
- (void)setQuickControlIconView:(id)a3;
@end

@implementation HUQuickControlIconViewController

+ (id)controlItemPredicate
{
  v2 = [[HUQuickControlSingleItemPredicate alloc] initWithBlock:&__block_literal_global_268];

  return v2;
}

uint64_t __56__HUQuickControlIconViewController_controlItemPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)createInteractionCoordinator
{
  v3 = [HUQuickControlIconView alloc];
  v4 = [(HUQuickControlSingleControlViewController *)self viewProfile];
  v5 = [(HUQuickControlIconView *)v3 initWithProfile:v4];
  [(HUQuickControlIconViewController *)self setQuickControlIconView:v5];

  v6 = [HUQuickControlSimpleInteractionCoordinator alloc];
  v7 = [(HUQuickControlIconViewController *)self quickControlIconView];
  v8 = [(HUQuickControlSimpleInteractionCoordinator *)v6 initWithControlView:v7 delegate:self];

  return v8;
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (id)createViewProfile
{
  v3 = objc_alloc_init(HUQuickControlIconViewProfile);
  v4 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v5 = [v4 latestResults];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68968]];
  [(HUQuickControlIconViewProfile *)v3 setStatusString:v6];

  v7 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v8 = [v7 latestResults];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68950]];
  [(HUQuickControlIconViewProfile *)v3 setStatusTextColor:v9];

  v10 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v11 = [v10 latestResults];
  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68A88]];
  [(HUQuickControlIconViewProfile *)v3 setSupplementaryString:v12];

  v13 = [(HUQuickControlSingleControlViewController *)self controlItem];
  v14 = [v13 latestResults];
  v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68960]];
  [(HUQuickControlIconViewProfile *)v3 setIconDescriptor:v15];

  return v3;
}

- (HUQuickControlIconView)quickControlIconView
{
  return self->_quickControlIconView;
}

- (void)setQuickControlIconView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end