@interface HKTitledBuddyViewController
+ (id)embedView:(id)a3 inContainerViewWithMinimumEdgeInsets:(UIEdgeInsets)a4;
- (BOOL)shouldCustomizeNavigationBar;
- (BOOL)shouldHideNavigationBar;
- (HKTitledBuddyViewController)init;
- (NSArray)buttons;
- (UIActivityIndicatorView)loadingIndicator;
- (id)_createHeaderView;
- (id)bodyString;
- (id)bottomAnchoredButtons;
- (id)headerView;
- (id)linkButtonTitle;
- (id)subsequentViews;
- (id)titleImage;
- (id)titleString;
- (int64_t)bodyTextAlignment;
- (unint64_t)supportedInterfaceOrientations;
- (void)_anchoredButtonTapped:(id)a3;
- (void)_createAnchoredButtons;
- (void)_updateForCurrentSizeCategory;
- (void)reloadViews;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKTitledBuddyViewController

- (HKTitledBuddyViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKTitledBuddyViewController;
  return [(HKTitledBuddyViewController *)&v3 initWithNibName:0 bundle:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)HKTitledBuddyViewController;
  [(HKTitledBuddyViewController *)&v44 viewDidLoad];
  objc_super v3 = [(HKTitledBuddyViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v5;

  [(UIActivityIndicatorView *)self->_loadingIndicator setHidesWhenStopped:1];
  v7 = [(HKTitledBuddyViewController *)self navigationItem];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_loadingIndicator];
  [v7 setRightBarButtonItem:v8];

  v9 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
  containerStackView = self->_containerStackView;
  self->_containerStackView = v9;

  v11 = self->_containerStackView;
  v12 = [(HKTitledBuddyViewController *)self view];
  [v12 bounds];
  -[UIStackView setFrame:](v11, "setFrame:");

  [(UIStackView *)self->_containerStackView setAutoresizingMask:18];
  [(UIStackView *)self->_containerStackView setAxis:1];
  [(UIStackView *)self->_bodyStackView setAlignment:3];
  v13 = [(HKTitledBuddyViewController *)self view];
  [v13 addSubview:self->_containerStackView];

  v14 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v14;

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_containerStackView addArrangedSubview:self->_scrollView];
  v16 = [(HKTitledBuddyViewController *)self _createHeaderView];
  v45[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  v18 = (void *)[v17 mutableCopy];

  v19 = [(HKTitledBuddyViewController *)self subsequentViews];
  [v18 addObjectsFromArray:v19];

  v20 = (UIStackView *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v18];
  bodyStackView = self->_bodyStackView;
  self->_bodyStackView = v20;

  [(UIStackView *)self->_bodyStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_bodyStackView setAxis:1];
  [(UIStackView *)self->_bodyStackView setAlignment:3];
  [(UIScrollView *)self->_scrollView addSubview:self->_bodyStackView];
  v22 = [(HKTitledBuddyViewController *)self bottomAnchoredButtons];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    v24 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
    v25 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v24];
    anchoredButtonContainerView = self->_anchoredButtonContainerView;
    self->_anchoredButtonContainerView = v25;

    [(UIVisualEffectView *)self->_anchoredButtonContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = [(HKTitledBuddyViewController *)self view];
    [v27 addSubview:self->_anchoredButtonContainerView];

    [(HKTitledBuddyViewController *)self _createAnchoredButtons];
    v28 = [(UIVisualEffectView *)self->_anchoredButtonContainerView bottomAnchor];
    v29 = [(HKTitledBuddyViewController *)self view];
    v30 = [v29 bottomAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    v32 = [(UIVisualEffectView *)self->_anchoredButtonContainerView leadingAnchor];
    v33 = [(HKTitledBuddyViewController *)self view];
    v34 = [v33 leadingAnchor];
    v35 = [v32 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    v36 = [(UIVisualEffectView *)self->_anchoredButtonContainerView trailingAnchor];
    v37 = [(HKTitledBuddyViewController *)self view];
    v38 = [v37 trailingAnchor];
    v39 = [v36 constraintEqualToAnchor:v38];
    [v39 setActive:1];
  }
  v40 = _NSDictionaryOfVariableBindings(&cfstr_ScrollviewBody.isa, self->_scrollView, self->_bodyStackView, 0);
  id v41 = (id)[(UIScrollView *)self->_scrollView hk_addConstraintsWithFormat:@"H:|[_bodyStackView]|" options:0 views:v40];
  id v42 = (id)[(UIScrollView *)self->_scrollView hk_addConstraintsWithFormat:@"V:|[_bodyStackView]|" options:0 views:v40];
  id v43 = (id)[(UIScrollView *)self->_scrollView hk_addEqualsConstraintWithItem:self->_bodyStackView attribute:9 relatedTo:self->_scrollView constant:0.0];
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)HKTitledBuddyViewController;
  [(HKTitledBuddyViewController *)&v15 viewDidLayoutSubviews];
  [(UIScrollView *)self->_scrollView contentSize];
  double v4 = v3;
  [(UIStackView *)self->_bodyStackView bounds];
  if (v4 < CGRectGetHeight(v16))
  {
    scrollView = self->_scrollView;
    [(UIStackView *)self->_bodyStackView bounds];
    -[UIScrollView setContentSize:](scrollView, "setContentSize:", v6, v7);
  }
  if (self->_anchoredButtonContainerView)
  {
    [(UIScrollView *)self->_scrollView contentInset];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(UIVisualEffectView *)self->_anchoredButtonContainerView frame];
    double Height = CGRectGetHeight(v17);
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", v9, v11, Height, v13);
    -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v9, v11, Height, v13);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HKTitledBuddyViewController;
  [(HKTitledBuddyViewController *)&v10 viewWillAppear:a3];
  if ([(HKTitledBuddyViewController *)self shouldCustomizeNavigationBar])
  {
    double v4 = [(HKTitledBuddyViewController *)self navigationController];
    v5 = [v4 navigationBar];
    [v5 _setHidesShadow:1];

    double v6 = [(HKTitledBuddyViewController *)self navigationController];
    double v7 = [v6 navigationBar];
    double v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v7 setBarTintColor:v8];

    double v9 = [(HKTitledBuddyViewController *)self navigationController];
    objc_msgSend(v9, "setNavigationBarHidden:", -[HKTitledBuddyViewController shouldHideNavigationBar](self, "shouldHideNavigationBar"));
  }
}

- (BOOL)shouldCustomizeNavigationBar
{
  return 1;
}

- (id)titleImage
{
  return 0;
}

- (id)titleString
{
  return &stru_1F3B9CF20;
}

- (id)bodyString
{
  return &stru_1F3B9CF20;
}

- (int64_t)bodyTextAlignment
{
  return 1;
}

- (id)linkButtonTitle
{
  return 0;
}

- (id)subsequentViews
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)bottomAnchoredButtons
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)shouldHideNavigationBar
{
  return 0;
}

- (void)reloadViews
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v3 = [(UIStackView *)self->_bodyStackView arrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [(UIStackView *)self->_bodyStackView removeArrangedSubview:v8];
        [v8 removeFromSuperview];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }

  double v9 = [(HKTitledBuddyViewController *)self _createHeaderView];
  v27 = v9;
  objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  double v11 = (void *)[v10 mutableCopy];

  double v12 = [(HKTitledBuddyViewController *)self subsequentViews];
  [v11 addObjectsFromArray:v12];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[UIStackView addArrangedSubview:](self->_bodyStackView, "addArrangedSubview:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (id)_createHeaderView
{
  double v3 = [(HKTitledBuddyViewController *)self titleImage];
  [(HKTitledBuddyViewController *)self shouldHideNavigationBar];
  uint64_t v4 = [(HKTitledBuddyViewController *)self view];
  [v4 frame];
  CGRectGetHeight(v21);
  uint64_t v5 = [(HKTitledBuddyViewController *)self view];
  UIRoundToViewScale();
  double v7 = v6;

  double v8 = [HKTitledLogoBuddyHeaderView alloc];
  double v9 = [(HKTitledBuddyViewController *)self linkButtonTitle];
  objc_super v10 = [(HKTitledLogoBuddyHeaderView *)v8 initWithTopInset:v9 linkButtonTitle:v7];
  header = self->_header;
  self->_header = v10;

  [(HKTitledBuddyHeaderView *)self->_header setDelegate:self];
  double v12 = [(HKTitledLogoBuddyHeaderView *)self->_header widthAnchor];
  id v13 = [(HKTitledBuddyViewController *)self view];
  [v13 frame];
  uint64_t v14 = [v12 constraintEqualToConstant:CGRectGetWidth(v22)];
  [v14 setActive:1];

  uint64_t v15 = self->_header;
  uint64_t v16 = [(HKTitledBuddyViewController *)self titleString];
  [(HKTitledBuddyHeaderView *)v15 setTitleText:v16];

  CGRect v17 = self->_header;
  long long v18 = [(HKTitledBuddyViewController *)self bodyString];
  [(HKTitledBuddyHeaderView *)v17 setBodyText:v18 alignment:[(HKTitledBuddyViewController *)self bodyTextAlignment]];

  [(HKTitledLogoBuddyHeaderView *)self->_header setLogoImage:v3];
  long long v19 = self->_header;

  return v19;
}

- (id)headerView
{
  return self->_header;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)_createAnchoredButtons
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(HKTitledBuddyViewController *)self bottomAnchoredButtons];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __53__HKTitledBuddyViewController__createAnchoredButtons__block_invoke;
  v48[3] = &unk_1E6D555E0;
  v48[4] = self;
  uint64_t v5 = v3;
  v49 = v5;
  v47 = v4;
  [v4 enumerateObjectsUsingBlock:v48];
  double v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSArray *)v5 count])
  {
    uint64_t v7 = 0;
    while (1)
    {
      double v8 = [(NSArray *)v5 objectAtIndexedSubscript:v7];
      double v9 = [(UIVisualEffectView *)self->_anchoredButtonContainerView contentView];
      [v9 addSubview:v8];

      objc_super v10 = [v8 centerXAnchor];
      double v11 = [(UIVisualEffectView *)self->_anchoredButtonContainerView centerXAnchor];
      double v12 = [v10 constraintEqualToAnchor:v11];
      [v12 setActive:1];

      double v13 = HKHealthUIBuddyDirectionalEdgeInsets();
      double v15 = v14;
      double v17 = v16;
      long long v18 = objc_msgSend(v8, "leadingAnchor", v13);
      long long v19 = [v8 superview];
      long long v20 = [v19 leadingAnchor];
      CGRect v21 = [v18 constraintEqualToAnchor:v20 constant:v15];
      [v21 setActive:1];

      CGRect v22 = [v8 trailingAnchor];
      long long v23 = [v8 superview];
      long long v24 = [v23 trailingAnchor];
      long long v25 = [v22 constraintEqualToAnchor:v24 constant:-v17];
      [v25 setActive:1];

      if (v7) {
        break;
      }
      v34 = [v8 topAnchor];
      v35 = [(UIVisualEffectView *)self->_anchoredButtonContainerView topAnchor];
      v36 = [v34 constraintEqualToAnchor:v35 constant:32.0];
      [v36 setActive:1];

      if ([(NSArray *)v5 count] == 1)
      {
        v30 = [v8 bottomAnchor];
        v37 = [(UIVisualEffectView *)self->_anchoredButtonContainerView bottomAnchor];
        v38 = [v30 constraintEqualToAnchor:v37 constant:-44.0];
        [v38 setActive:1];
        goto LABEL_13;
      }
LABEL_15:

      if (++v7 >= [(NSArray *)v5 count]) {
        goto LABEL_16;
      }
    }
    v26 = [v8 titleLabel];
    v27 = [v26 font];
    [v27 _bodyLeading];
    double v29 = v28;

    v30 = [(NSArray *)v5 objectAtIndexedSubscript:v7 - 1];
    v31 = [(NSArray *)v5 firstObject];

    double v32 = 42.0;
    if (v29 >= 42.0) {
      double v32 = v29;
    }
    double v33 = -v32;
    if (v30 == v31) {
      [v30 bottomAnchor];
    }
    else {
    v39 = [v30 lastBaselineAnchor];
    }
    v40 = [v8 firstBaselineAnchor];
    v37 = [v39 constraintEqualToAnchor:v40 constant:v33];

    [v37 setActive:1];
    [(NSArray *)v6 addObject:v37];
    if (v7 == [(NSArray *)v5 count] - 1)
    {
      v38 = [v8 lastBaselineAnchor];
      id v41 = [(UIVisualEffectView *)self->_anchoredButtonContainerView bottomAnchor];
      id v42 = [v38 constraintEqualToAnchor:v41 constant:-44.0];
      [v42 setActive:1];

LABEL_13:
    }

    goto LABEL_15;
  }
LABEL_16:
  buttonStackConstraints = self->_buttonStackConstraints;
  self->_buttonStackConstraints = v6;
  objc_super v44 = v6;

  buttons = self->_buttons;
  self->_buttons = v5;
  v46 = v5;
}

void __53__HKTitledBuddyViewController__createAnchoredButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4FB14D0];
  id v6 = a2;
  uint64_t v7 = HKHealthKeyColor();
  uint64_t v8 = *(void *)(a1 + 32);
  if (a3) {
    objc_msgSend(v5, "hk_buttonTintedWithColor:title:target:action:", v7, v6, v8, sel__anchoredButtonTapped_);
  }
  else {
    objc_msgSend(v5, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v7, v6, v8, sel__anchoredButtonTapped_);
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 setTag:a3];
  [*(id *)(a1 + 40) addObject:v9];
}

- (void)_anchoredButtonTapped:(id)a3
{
  uint64_t v4 = [a3 tag];
  [(HKTitledBuddyViewController *)self buttonAtIndexTapped:v4];
}

- (void)_updateForCurrentSizeCategory
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = self->_buttonStackConstraints;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        uint64_t v8 = [(NSArray *)self->_buttons firstObject];
        id v9 = [v8 titleLabel];
        objc_super v10 = [v9 font];
        [v10 _bodyLeading];
        double v12 = v11;

        double v13 = 42.0;
        if (v12 >= 42.0) {
          double v13 = v12;
        }
        [v7 setConstant:-v13];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKTitledBuddyViewController;
  [(HKTitledBuddyViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    uint64_t v5 = [(HKTitledBuddyViewController *)self traitCollection];
    uint64_t v6 = [v5 preferredContentSizeCategory];
    uint64_t v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__HKTitledBuddyViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E6D50ED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __56__HKTitledBuddyViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForCurrentSizeCategory];
}

+ (id)embedView:(id)a3 inContainerViewWithMinimumEdgeInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  v21[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 addSubview:v8];
  objc_super v10 = _NSDictionaryOfVariableBindings(&cfstr_View_0.isa, v8, 0);
  v20[0] = @"topInset";
  double v11 = [NSNumber numberWithDouble:top];
  v21[0] = v11;
  v20[1] = @"leftInset";
  double v12 = [NSNumber numberWithDouble:left];
  v21[1] = v12;
  v20[2] = @"bottomInset";
  double v13 = [NSNumber numberWithDouble:bottom];
  v21[2] = v13;
  v20[3] = @"rightInset";
  double v14 = [NSNumber numberWithDouble:right];
  v21[3] = v14;
  long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];

  id v16 = (id)objc_msgSend(v9, "hk_addConstraintsWithFormat:options:metrics:views:", @"V:|-(>=topInset)-[view]-(>=bottomInset)-|", 0, v15, v10);
  id v17 = (id)objc_msgSend(v9, "hk_addConstraintsWithFormat:options:metrics:views:", @"H:|-(>=leftInset)-[view]-(>=rightInset)-|", 0, v15, v10);
  id v18 = (id)objc_msgSend(v9, "hk_addEqualsConstraintWithItem:attribute:relatedTo:constant:", v8, 9, v9, 0.0);

  return v9;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_buttonStackConstraints, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_anchoredButtonContainerView, 0);
  objc_storeStrong((id *)&self->_bodyStackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end