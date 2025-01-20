@interface HRSpeedBumpViewController
- (BOOL)stateAnimating;
- (HRSpeedBumpItem)item;
- (HRSpeedBumpViewController)initWithSpeedBumpItem:(id)a3 onboarding:(BOOL)a4 upgradingFromAlgorithmVersion:(int64_t)a5;
- (HRStackedButtonView)stackedButtonView;
- (NSArray)bubbleViews;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (UIView)latestVisibleBubbleView;
- (double)_titleLastBaselineToBodyTop;
- (double)initialContentOffset;
- (id)_bodyFont;
- (id)identifierBundle;
- (void)_scrollBubbleViewToVisible:(id)a3;
- (void)_setStackedButtonViewAsFooterView;
- (void)_setUpBodyConstraints;
- (void)_setUpBodyLabel;
- (void)_setUpBubbleViewConstraints;
- (void)_setUpBubbleViews;
- (void)_setUpStackedButtonView;
- (void)_setUpTitleConstraints;
- (void)_setUpTitleLabel;
- (void)_updateContentViewBottomConstraintWithAnchor:(id)a3 constant:(double)a4;
- (void)_updateUIWithLatestVisibleBubbleView:(id)a3 animated:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setBodyLabel:(id)a3;
- (void)setBubbleViews:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setInitialContentOffset:(double)a3;
- (void)setItem:(id)a3;
- (void)setLatestVisibleBubbleView:(id)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setStateAnimating:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation HRSpeedBumpViewController

- (HRSpeedBumpViewController)initWithSpeedBumpItem:(id)a3 onboarding:(BOOL)a4 upgradingFromAlgorithmVersion:(int64_t)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HRSpeedBumpViewController;
  v10 = (HRSpeedBumpViewController *)[(HRSpeedBumpViewController *)&v13 initForOnboarding:v6 upgradingFromAlgorithmVersion:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_item, a3);
  }

  return v11;
}

- (void)setUpUI
{
  v6.receiver = self;
  v6.super_class = (Class)HRSpeedBumpViewController;
  [(HRSpeedBumpViewController *)&v6 setUpUI];
  v3 = [(HRSpeedBumpViewController *)self scrollView];
  [v3 setDelegate:self];

  [(HRSpeedBumpViewController *)self _setUpTitleLabel];
  v4 = [(HRSpeedBumpViewController *)self item];
  v5 = [v4 body];

  if (v5) {
    [(HRSpeedBumpViewController *)self _setUpBodyLabel];
  }
  [(HRSpeedBumpViewController *)self _setUpBubbleViews];
}

- (void)setUpConstraints
{
  v9.receiver = self;
  v9.super_class = (Class)HRSpeedBumpViewController;
  [(HRSpeedBumpViewController *)&v9 setUpConstraints];
  [(HRSpeedBumpViewController *)self _setUpTitleConstraints];
  v3 = [(HRSpeedBumpViewController *)self item];
  v4 = [v3 body];

  if (v4) {
    [(HRSpeedBumpViewController *)self _setUpBodyConstraints];
  }
  [(HRSpeedBumpViewController *)self _setUpBubbleViewConstraints];
  v5 = [(HRSpeedBumpViewController *)self contentView];
  objc_super v6 = [v5 _bottomVisibleView];

  if ([(HRSpeedBumpViewController *)self isOnboarding]) {
    double v7 = 0.0;
  }
  else {
    double v7 = *MEMORY[0x263F46378];
  }
  v8 = [v6 bottomAnchor];
  [(HRSpeedBumpViewController *)self _updateContentViewBottomConstraintWithAnchor:v8 constant:v7];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)HRSpeedBumpViewController;
  [(HRSpeedBumpViewController *)&v9 viewDidLoad];
  int v3 = [(HRSpeedBumpViewController *)self isOnboarding];
  v4 = [(HRSpeedBumpViewController *)self bubbleViews];
  v5 = v4;
  if (v3)
  {
    objc_super v6 = [v4 firstObject];
    [(HRSpeedBumpViewController *)self setLatestVisibleBubbleView:v6];

    [(HRSpeedBumpViewController *)self setInitialContentOffset:1.79769313e308];
  }
  else
  {
    double v7 = [v4 lastObject];
    [(HRSpeedBumpViewController *)self setLatestVisibleBubbleView:v7];
  }
  v8 = [(HRSpeedBumpViewController *)self latestVisibleBubbleView];
  [(HRSpeedBumpViewController *)self _updateUIWithLatestVisibleBubbleView:v8 animated:0];

  if ([(HRSpeedBumpViewController *)self isOnboarding])
  {
    [(HRSpeedBumpViewController *)self _setUpStackedButtonView];
    [(HRSpeedBumpViewController *)self _setStackedButtonViewAsFooterView];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(HRSpeedBumpViewController *)self initialContentOffset];
  if (v4 == 1.79769313e308)
  {
    id v6 = [(HRSpeedBumpViewController *)self scrollView];
    [v6 contentOffset];
    [(HRSpeedBumpViewController *)self setInitialContentOffset:v5];
  }
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  if (!a4 && ![(HRSpeedBumpViewController *)self stateAnimating])
  {
    double v5 = [(HRSpeedBumpViewController *)self latestVisibleBubbleView];
    id v6 = [(HRSpeedBumpViewController *)self bubbleViews];
    double v7 = [v6 lastObject];

    if (v5 == v7)
    {
      id v21 = [(HRSpeedBumpViewController *)self delegate];
      [v21 stepForward];
    }
    else
    {
      v8 = [(HRSpeedBumpViewController *)self bubbleViews];
      objc_super v9 = [(HRSpeedBumpViewController *)self latestVisibleBubbleView];
      uint64_t v10 = [v8 indexOfObject:v9];

      v11 = [(HRSpeedBumpViewController *)self bubbleViews];
      v12 = [v11 objectAtIndexedSubscript:v10 + 1];
      [(HRSpeedBumpViewController *)self setLatestVisibleBubbleView:v12];

      objc_super v13 = [(HRSpeedBumpViewController *)self latestVisibleBubbleView];
      [(HRSpeedBumpViewController *)self _updateUIWithLatestVisibleBubbleView:v13 animated:1];

      v14 = [(HRSpeedBumpViewController *)self latestVisibleBubbleView];
      v15 = [(HRSpeedBumpViewController *)self bubbleViews];
      v16 = [v15 lastObject];

      if (v14 != v16) {
        return;
      }
      id v21 = [(HRSpeedBumpViewController *)self stackedButtonView];
      v17 = [v21 buttons];
      v18 = [v17 firstObject];
      v19 = HRHeartRhythmUIFrameworkBundle();
      v20 = [v19 localizedStringForKey:@"ONBOARDING_CONTINUE" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
      [v18 setTitle:v20 forState:0];
    }
  }
}

- (void)_updateUIWithLatestVisibleBubbleView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(HRSpeedBumpViewController *)self isOnboarding];
  v8 = (double *)MEMORY[0x263F463B0];
  if (!v7) {
    v8 = (double *)MEMORY[0x263F46378];
  }
  double v9 = *v8;
  uint64_t v10 = [v6 bottomAnchor];
  [(HRSpeedBumpViewController *)self _updateContentViewBottomConstraintWithAnchor:v10 constant:v9];

  v11 = [(HRSpeedBumpViewController *)self view];
  [v11 layoutIfNeeded];

  if (v4)
  {
    [(HRSpeedBumpViewController *)self _scrollBubbleViewToVisible:v6];
    if (v6)
    {
      [v6 setAlpha:0.0];
      [(HRSpeedBumpViewController *)self setStateAnimating:1];
      id v12 = objc_alloc(MEMORY[0x263F1CB78]);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __75__HRSpeedBumpViewController__updateUIWithLatestVisibleBubbleView_animated___block_invoke;
      v24[3] = &unk_264581110;
      id v25 = v6;
      objc_super v13 = (void *)[v12 initWithDuration:0 curve:v24 animations:0.5];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __75__HRSpeedBumpViewController__updateUIWithLatestVisibleBubbleView_animated___block_invoke_2;
      v23[3] = &unk_264581478;
      v23[4] = self;
      [v13 addCompletion:v23];
      [v13 startAnimation];
    }
  }
  else
  {
    v14 = [(HRSpeedBumpViewController *)self bubbleViews];
    unint64_t v15 = [v14 indexOfObject:v6];

    v16 = [(HRSpeedBumpViewController *)self bubbleViews];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      unint64_t v18 = 0;
      do
      {
        v19 = [(HRSpeedBumpViewController *)self bubbleViews];
        v20 = [v19 objectAtIndexedSubscript:v18];
        [v20 setHidden:v18 > v15];

        ++v18;
        id v21 = [(HRSpeedBumpViewController *)self bubbleViews];
        unint64_t v22 = [v21 count];
      }
      while (v18 < v22);
    }
  }
}

uint64_t __75__HRSpeedBumpViewController__updateUIWithLatestVisibleBubbleView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 32);
  return [v2 setHidden:0];
}

uint64_t __75__HRSpeedBumpViewController__updateUIWithLatestVisibleBubbleView_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStateAnimating:0];
}

- (id)identifierBundle
{
  v2 = NSString;
  int v3 = [(HRSpeedBumpViewController *)self item];
  BOOL v4 = objc_msgSend(v2, "healthAccessibilityIdentifier:suffix:", objc_msgSend(v3, "category"), @"Onboarding.FourThings");

  return v4;
}

- (void)_setUpTitleLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HRSpeedBumpViewController *)self setTitleLabel:v3];

  BOOL v4 = [(HRSpeedBumpViewController *)self item];
  double v5 = [v4 title];
  id v6 = [(HRSpeedBumpViewController *)self titleLabel];
  [v6 setText:v5];

  int v7 = [(HRSpeedBumpViewController *)self titleLabel];
  [v7 setTextAlignment:1];

  v8 = [(HRSpeedBumpViewController *)self titleFont];
  double v9 = [(HRSpeedBumpViewController *)self titleLabel];
  [v9 setFont:v8];

  uint64_t v10 = [(HRSpeedBumpViewController *)self titleLabel];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(HRSpeedBumpViewController *)self titleLabel];
  [v11 setNumberOfLines:0];

  id v12 = [(HRSpeedBumpViewController *)self identifierBundle];
  objc_super v13 = [v12 stringByAppendingString:@".Title"];
  v14 = [(HRSpeedBumpViewController *)self titleLabel];
  [v14 setAccessibilityIdentifier:v13];

  id v16 = [(HRSpeedBumpViewController *)self contentView];
  unint64_t v15 = [(HRSpeedBumpViewController *)self titleLabel];
  [v16 addSubview:v15];
}

- (void)_setUpBodyLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HRSpeedBumpViewController *)self setBodyLabel:v3];

  BOOL v4 = [(HRSpeedBumpViewController *)self item];
  double v5 = [v4 body];
  id v6 = [(HRSpeedBumpViewController *)self bodyLabel];
  [v6 setText:v5];

  int v7 = [(HRSpeedBumpViewController *)self bodyLabel];
  [v7 setTextAlignment:1];

  v8 = [(HRSpeedBumpViewController *)self _bodyFont];
  double v9 = [(HRSpeedBumpViewController *)self bodyLabel];
  [v9 setFont:v8];

  uint64_t v10 = [(HRSpeedBumpViewController *)self bodyLabel];
  [v10 setAdjustsFontForContentSizeCategory:1];

  v11 = [(HRSpeedBumpViewController *)self bodyLabel];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [(HRSpeedBumpViewController *)self bodyLabel];
  [v12 setNumberOfLines:0];

  objc_super v13 = [(HRSpeedBumpViewController *)self identifierBundle];
  v14 = [v13 stringByAppendingString:@".Description"];
  unint64_t v15 = [(HRSpeedBumpViewController *)self bodyLabel];
  [v15 setAccessibilityIdentifier:v14];

  id v17 = [(HRSpeedBumpViewController *)self contentView];
  id v16 = [(HRSpeedBumpViewController *)self bodyLabel];
  [v17 addSubview:v16];
}

- (void)_setUpTitleConstraints
{
  id v3 = [(HRSpeedBumpViewController *)self titleLabel];
  BOOL v4 = [(HRSpeedBumpViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:insets:", v4);

  id v9 = [(HRSpeedBumpViewController *)self titleLabel];
  double v5 = [v9 topAnchor];
  id v6 = [(HRSpeedBumpViewController *)self contentView];
  int v7 = [v6 topAnchor];
  [(HRSpeedBumpViewController *)self contentTop];
  v8 = objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7);
  [v8 setActive:1];
}

- (void)_setUpBodyConstraints
{
  id v3 = [(HRSpeedBumpViewController *)self bodyLabel];
  BOOL v4 = [(HRSpeedBumpViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:insets:", v4);

  id v9 = [(HRSpeedBumpViewController *)self bodyLabel];
  double v5 = [v9 topAnchor];
  id v6 = [(HRSpeedBumpViewController *)self titleLabel];
  int v7 = [v6 lastBaselineAnchor];
  [(HRSpeedBumpViewController *)self _titleLastBaselineToBodyTop];
  v8 = objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7);
  [v8 setActive:1];
}

- (void)_setUpBubbleViews
{
  id v3 = (void *)MEMORY[0x263EFF980];
  BOOL v4 = [(HRSpeedBumpViewController *)self item];
  double v5 = [v4 bubbles];
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(HRSpeedBumpViewController *)self item];
  int v7 = [v6 bubbles];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [(HRSpeedBumpViewController *)self item];
      v11 = [v10 bubbles];
      id v12 = [v11 objectAtIndexedSubscript:v9];

      objc_super v13 = [(HRSpeedBumpViewController *)self identifierBundle];
      v14 = objc_msgSend(NSString, "stringWithFormat:", @".Item%d.Title", ++v9);
      unint64_t v15 = [v13 stringByAppendingString:v14];

      id v16 = [(HRSpeedBumpViewController *)self identifierBundle];
      id v17 = objc_msgSend(NSString, "stringWithFormat:", @".Item%d.Description", v9);
      unint64_t v18 = [v16 stringByAppendingString:v17];

      v19 = objc_opt_class();
      v20 = [v12 title];
      id v21 = [v12 body];
      unint64_t v22 = [v19 createTitledListItem:v20 titleAccessibilityIdentifier:v15 listBody:v21 bodyAccessibilityIdentifier:v18 itemNumber:v9];

      [v22 setHidden:1];
      v23 = [(HRSpeedBumpViewController *)self contentView];
      [v23 addSubview:v22];

      [v28 addObject:v22];
      v24 = [(HRSpeedBumpViewController *)self item];
      id v25 = [v24 bubbles];
      unint64_t v26 = [v25 count];
    }
    while (v26 > v9);
  }
  v27 = [MEMORY[0x263EFF8C0] arrayWithArray:v28];
  [(HRSpeedBumpViewController *)self setBubbleViews:v27];
}

- (void)_setUpBubbleViewConstraints
{
  id v3 = [(HRSpeedBumpViewController *)self bubbleViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    double v6 = *MEMORY[0x263F1C228];
    double v7 = *(double *)(MEMORY[0x263F1C228] + 8);
    double v8 = *(double *)(MEMORY[0x263F1C228] + 16);
    double v9 = *(double *)(MEMORY[0x263F1C228] + 24);
    do
    {
      uint64_t v10 = [(HRSpeedBumpViewController *)self bubbleViews];
      v11 = [v10 objectAtIndexedSubscript:v5];

      if (v5)
      {
        id v12 = [(HRSpeedBumpViewController *)self bubbleViews];
        objc_super v13 = [v12 objectAtIndexedSubscript:v5 - 1];

        double v14 = 10.0;
      }
      else
      {
        unint64_t v15 = [(HRSpeedBumpViewController *)self bodyLabel];

        if (v15) {
          [(HRSpeedBumpViewController *)self bodyLabel];
        }
        else {
        objc_super v13 = [(HRSpeedBumpViewController *)self titleLabel];
        }
        double v14 = 34.0;
      }
      id v16 = [v13 lastBaselineAnchor];

      id v17 = [(HRSpeedBumpViewController *)self titleLabel];
      objc_msgSend(v11, "hk_alignHorizontalConstraintsWithView:insets:", v17, v6, v7, v8, v9);

      unint64_t v18 = [v11 topAnchor];
      v19 = [v18 constraintEqualToAnchor:v16 constant:v14];
      [v19 setActive:1];

      ++v5;
      v20 = [(HRSpeedBumpViewController *)self bubbleViews];
      unint64_t v21 = [v20 count];
    }
    while (v21 > v5);
  }
}

- (void)_setUpStackedButtonView
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = HRHeartRhythmUIFrameworkBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"ONBOARDING_NEXT" value:&stru_26D2B53D0 table:@"HeartRhythmUI-Localizable"];
  v10[0] = v4;
  unint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  double v6 = +[HRStackedButtonView buddyStackedButtonViewWithTitles:v5 footerText:0 boldFooterText:0 delegate:self];
  [(HRSpeedBumpViewController *)self setStackedButtonView:v6];

  double v7 = [(HRSpeedBumpViewController *)self stackedButtonView];
  [v7 setBlurHidden:0];

  double v8 = [(HRSpeedBumpViewController *)self stackedButtonView];
  [v8 setFixedBottomButtonSpacing:1];

  double v9 = [(HRSpeedBumpViewController *)self stackedButtonView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)_setStackedButtonViewAsFooterView
{
  id v3 = [(HRSpeedBumpViewController *)self stackedButtonView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  -[HRSpeedBumpViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

  uint64_t v4 = [(HRSpeedBumpViewController *)self stackedButtonView];
  [v4 setClipsToBounds:0];

  id v6 = [(HRSpeedBumpViewController *)self stackedButtonView];
  unint64_t v5 = [(HRSpeedBumpViewController *)self view];
  [v6 alignBlurViewHorizontalConstraintsWithView:v5];
}

- (void)_updateContentViewBottomConstraintWithAnchor:(id)a3 constant:(double)a4
{
  id v6 = a3;
  double v7 = [(HRSpeedBumpViewController *)self contentViewBottomConstraint];
  [v7 setActive:0];

  [(HRSpeedBumpViewController *)self setContentViewBottomConstraint:0];
  double v8 = [(HRSpeedBumpViewController *)self contentView];
  double v9 = [v8 bottomAnchor];
  uint64_t v10 = [v9 constraintEqualToAnchor:v6 constant:a4];

  [(HRSpeedBumpViewController *)self setContentViewBottomConstraint:v10];
  id v11 = [(HRSpeedBumpViewController *)self contentViewBottomConstraint];
  [v11 setActive:1];
}

- (void)_scrollBubbleViewToVisible:(id)a3
{
  id v4 = a3;
  [(HRSpeedBumpViewController *)self initialContentOffset];
  if (v5 == 1.79769313e308)
  {
    id v6 = [(HRSpeedBumpViewController *)self scrollView];
    [v6 contentOffset];
    [(HRSpeedBumpViewController *)self setInitialContentOffset:v7];
  }
  double v8 = [(HRSpeedBumpViewController *)self scrollView];
  [v8 bounds];
  double Height = CGRectGetHeight(v32);
  uint64_t v10 = [(HRSpeedBumpViewController *)self stackedButtonView];
  [v10 bounds];
  double v11 = Height - CGRectGetHeight(v33);

  [v4 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v34.origin.x = v13;
  v34.origin.y = v15;
  v34.size.width = v17;
  v34.size.height = v19;
  double MaxY = CGRectGetMaxY(v34);
  unint64_t v21 = [(HRSpeedBumpViewController *)self navigationController];
  unint64_t v22 = [v21 navigationBar];
  [v22 bounds];
  double v23 = MaxY + CGRectGetHeight(v35);

  double v24 = v23 - v11 + 20.0;
  if (v24 > 0.0)
  {
    id v25 = [(HRSpeedBumpViewController *)self scrollView];
    [v25 contentOffset];
    double v27 = v26;
    [(HRSpeedBumpViewController *)self initialContentOffset];
    double v29 = v24 + v28;

    id v30 = [(HRSpeedBumpViewController *)self scrollView];
    objc_msgSend(v30, "setContentOffset:animated:", 1, v27, v29);
  }
}

- (double)_titleLastBaselineToBodyTop
{
  v2 = [(HRSpeedBumpViewController *)self titleFont];
  [v2 _scaledValueForValue:24.0];
  double v4 = v3;

  return v4;
}

- (id)_bodyFont
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
}

- (HRSpeedBumpItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (UIView)latestVisibleBubbleView
{
  return self->_latestVisibleBubbleView;
}

- (void)setLatestVisibleBubbleView:(id)a3
{
  self->_latestVisibleBubbleView = (UIView *)a3;
}

- (BOOL)stateAnimating
{
  return self->_stateAnimating;
}

- (void)setStateAnimating:(BOOL)a3
{
  self->_stateAnimating = a3;
}

- (double)initialContentOffset
{
  return self->_initialContentOffset;
}

- (void)setInitialContentOffset:(double)a3
{
  self->_initialContentOffset = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (NSArray)bubbleViews
{
  return self->_bubbleViews;
}

- (void)setBubbleViews:(id)a3
{
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_bubbleViews, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end