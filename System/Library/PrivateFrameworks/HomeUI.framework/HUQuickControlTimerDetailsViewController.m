@interface HUQuickControlTimerDetailsViewController
+ (id)controlItemPredicate;
- (BOOL)_canShowWhileLocked;
- (BOOL)isAccessoryControllable;
- (BOOL)shouldShowContentForReachabilityState:(BOOL)a3;
- (HUQuickControlTimerDetailsViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7;
- (HUTimerTableViewController)timerTableViewController;
- (NSArray)timerTableViewConstraints;
- (NSLayoutConstraint)heightConstraint;
- (id)controlItem;
- (id)createDetailsViewController;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)mediaProfileContainer;
- (void)_addTimerControlView;
- (void)_updateConstraints;
- (void)itemSection:(id)a3 accessoryButtonPressedInHeader:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setTimerTableViewConstraints:(id)a3;
- (void)setTimerTableViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUQuickControlTimerDetailsViewController

+ (id)controlItemPredicate
{
  uint64_t v2 = objc_opt_class();

  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:v2];
}

- (HUQuickControlTimerDetailsViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  v16.receiver = self;
  v16.super_class = (Class)HUQuickControlTimerDetailsViewController;
  v7 = [(HUQuickControlViewController *)&v16 initWithControlItems:a3 home:a4 itemUpdater:a5 controlOrientation:a6 preferredControl:a7];
  v8 = v7;
  if (v7)
  {
    v9 = [(HUQuickControlTimerDetailsViewController *)v7 controlItem];
    v10 = [v9 latestResults];
    v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    if (v11)
    {
      [(HUQuickControlTimerDetailsViewController *)v8 setTitle:v11];
    }
    else
    {
      v12 = HFLocalizedString();
      [(HUQuickControlTimerDetailsViewController *)v8 setTitle:v12];
    }
    objc_opt_class();
    v13 = [(HUQuickControlTimerDetailsViewController *)v8 createDetailsViewController];
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    objc_storeStrong((id *)&v8->_timerTableViewController, v14);
  }
  return v8;
}

- (id)controlItem
{
  v3 = [(HUQuickControlViewController *)self controlItems];
  uint64_t v4 = [v3 count];

  if (v4 != 1)
  {
    v5 = [(HUQuickControlViewController *)self controlItems];
    NSLog(&cfstr_MoreThanOneCon_0.isa, v5);
  }
  objc_opt_class();
  v6 = [(HUQuickControlViewController *)self controlItems];
  v7 = [v6 anyObject];
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)createDetailsViewController
{
  v3 = [(HUQuickControlTimerDetailsViewController *)self mediaProfileContainer];
  if (v3)
  {
    uint64_t v4 = [[HUTimerTableViewController alloc] initWithMediaProfileContainer:v3];
    [(HUQuickControlViewController *)self setChildVCThatRequiresHelper:v4];
  }
  else
  {
    NSLog(&cfstr_ShouldBeImposs_0.isa);
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isAccessoryControllable
{
  uint64_t v2 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
  char v3 = [v2 wasControllableAtLastCheck];

  return v3;
}

- (id)mediaProfileContainer
{
  uint64_t v2 = [(HUQuickControlTimerDetailsViewController *)self controlItem];
  char v3 = [v2 mediaProfileContainer];

  return v3;
}

- (BOOL)shouldShowContentForReachabilityState:(BOOL)a3
{
  return 1;
}

- (void)itemSection:(id)a3 accessoryButtonPressedInHeader:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[HUQuickControlTimerDetailsViewController itemSection:accessoryButtonPressedInHeader:]";
    __int16 v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%s(%@) adding new timer", (uint8_t *)&v7, 0x16u);
  }

  v6 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
  [v6 presentAddMobileTimerObjectViewControllerOnMainThread];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlTimerDetailsViewController;
  [(HUQuickControlTimerDetailsViewController *)&v3 viewDidLoad];
  [(HUQuickControlTimerDetailsViewController *)self _addTimerControlView];
}

- (void)_addTimerControlView
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];

  if (v3)
  {
    uint64_t v4 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
    v5 = [v4 view];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
    [(HUQuickControlTimerDetailsViewController *)self addChildViewController:v6];

    int v7 = [(HUQuickControlTimerDetailsViewController *)self view];
    v8 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
    __int16 v9 = [v8 view];
    [v7 addSubview:v9];

    v10 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
    uint64_t v11 = [v10 tableView];
    [v11 setScrollEnabled:0];

    v12 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
    v13 = [v12 tableView];
    [v13 setAlwaysBounceVertical:0];

    v14 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
    v15 = [v14 tableView];
    [v15 setShowsHorizontalScrollIndicator:0];

    objc_super v16 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
    v17 = [v16 tableView];
    [v17 setShowsVerticalScrollIndicator:0];

    [(HUQuickControlTimerDetailsViewController *)self _updateConstraints];
    id v19 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
    [v19 didMoveToParentViewController:self];
  }
  else
  {
    v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[HUQuickControlTimerDetailsViewController _addTimerControlView]";
      _os_log_debug_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEBUG, "(%s) [self createDetailsViewController] didn't return HUTimerTableViewController.", buf, 0xCu);
    }
  }
}

- (void)_updateConstraints
{
  v43[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v4 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewConstraints];
  [v3 deactivateConstraints:v4];

  v5 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
  v6 = [v5 view];
  int v7 = [v6 heightAnchor];
  v8 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
  [v8 preferredContentSize];
  v10 = [v7 constraintEqualToConstant:v9];
  [(HUQuickControlTimerDetailsViewController *)self setHeightConstraint:v10];

  v42 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
  v41 = [v42 view];
  v39 = [v41 leadingAnchor];
  v40 = [(HUQuickControlTimerDetailsViewController *)self view];
  v38 = [v40 layoutMarginsGuide];
  v37 = [v38 leadingAnchor];
  v36 = [v39 constraintEqualToAnchor:v37];
  v43[0] = v36;
  v35 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
  v34 = [v35 view];
  v32 = [v34 trailingAnchor];
  v33 = [(HUQuickControlTimerDetailsViewController *)self view];
  v31 = [v33 layoutMarginsGuide];
  v30 = [v31 trailingAnchor];
  v29 = [v32 constraintEqualToAnchor:v30];
  v43[1] = v29;
  v28 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
  v27 = [v28 view];
  v25 = [v27 topAnchor];
  v26 = [(HUQuickControlTimerDetailsViewController *)self view];
  v24 = [v26 layoutMarginsGuide];
  v23 = [v24 topAnchor];
  uint64_t v22 = [v25 constraintEqualToAnchor:v23];
  v43[2] = v22;
  uint64_t v11 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
  v12 = [v11 view];
  v13 = [v12 bottomAnchor];
  v14 = [(HUQuickControlTimerDetailsViewController *)self view];
  v15 = [v14 layoutMarginsGuide];
  objc_super v16 = [v15 bottomAnchor];
  v17 = [v13 constraintEqualToAnchor:v16];
  v43[3] = v17;
  v18 = [(HUQuickControlTimerDetailsViewController *)self heightConstraint];
  v43[4] = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:5];
  [(HUQuickControlTimerDetailsViewController *)self setTimerTableViewConstraints:v19];

  v20 = (void *)MEMORY[0x1E4F28DC8];
  v21 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewConstraints];
  [v20 activateConstraints:v21];
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  uint64_t v4 = [(HUQuickControlTimerDetailsViewController *)self parentViewController];
  do
  {
    v5 = v4;
    uint64_t v4 = [v4 parentViewController];

    v6 = [(HUQuickControlTimerDetailsViewController *)self parentViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      if (v4) {
        goto LABEL_5;
      }
      goto LABEL_7;
    }
    int v7 = [v4 parentViewController];
  }
  while (v7);
  if (v4)
  {
LABEL_5:
    v8 = [v4 view];
    [v8 frame];
    double v10 = v9 + -80.0;
    goto LABEL_8;
  }
LABEL_7:
  v8 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
  uint64_t v11 = [v8 view];
  [v11 frame];
  double v10 = v12;

LABEL_8:
  v13 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
  [v13 preferredContentSize];
  double v15 = v14;

  objc_super v16 = +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 0, v10, v15);

  return v16;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlTimerDetailsViewController;
  id v4 = a3;
  [(HUQuickControlTimerDetailsViewController *)&v21 preferredContentSizeDidChangeForChildContentContainer:v4];
  v5 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    int v7 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
    [v7 preferredContentSize];
    double v9 = v8;
    double v10 = [(HUQuickControlTimerDetailsViewController *)self heightConstraint];
    [v10 setConstant:v9];

    [(HUQuickControlTimerDetailsViewController *)self preferredContentSize];
    double v12 = v11;
    double v14 = v13;
    double v15 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
    [v15 preferredContentSize];
    double v17 = v16;
    double v19 = v18;

    if (v12 != v17 || v14 != v19)
    {
      v20 = [(HUQuickControlTimerDetailsViewController *)self timerTableViewController];
      [v20 preferredContentSize];
      -[HUQuickControlTimerDetailsViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (HUTimerTableViewController)timerTableViewController
{
  return self->_timerTableViewController;
}

- (void)setTimerTableViewController:(id)a3
{
}

- (NSArray)timerTableViewConstraints
{
  return self->_timerTableViewConstraints;
}

- (void)setTimerTableViewConstraints:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_timerTableViewConstraints, 0);

  objc_storeStrong((id *)&self->_timerTableViewController, 0);
}

@end