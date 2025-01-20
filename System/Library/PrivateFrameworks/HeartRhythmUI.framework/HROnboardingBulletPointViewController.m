@interface HROnboardingBulletPointViewController
- (CGSize)_bulletImageSize;
- (HRStackedButtonView)stackedButtonView;
- (NSArray)bulletPoints;
- (NSHashTable)bulletPointBodyLabels;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSString)bodyString;
- (NSString)buttonTitleString;
- (NSString)titleString;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (UIStackView)bulletPointsView;
- (UIView)lastBulletPointView;
- (double)_cannotDoHeaderLastBaselineToCannotDoBodyFirstBaseline;
- (id)_bodyFont;
- (id)_boldSubheadlineFont;
- (id)_subheadlineFont;
- (void)_adjustButtonFooterViewLocationForViewContentHeight;
- (void)_setUpButtonFooterView;
- (void)_setupBulletPointViews;
- (void)setBodyLabel:(id)a3;
- (void)setBulletPointBodyLabels:(id)a3;
- (void)setBulletPointsView:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setLastBulletPointView:(id)a3;
- (void)setStackedButtonView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)setUpUI;
- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4;
- (void)updateUserInterfaceForStyle:(int64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HROnboardingBulletPointViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingBulletPointViewController;
  [(HROnboardingBulletPointViewController *)&v3 viewDidLoad];
  [(HROnboardingBulletPointViewController *)self _setUpButtonFooterView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HROnboardingBulletPointViewController;
  [(HROnboardingBulletPointViewController *)&v4 viewWillAppear:a3];
  [(HROnboardingBulletPointViewController *)self _adjustButtonFooterViewLocationForViewContentHeight];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HROnboardingBulletPointViewController;
  [(HROnboardingBulletPointViewController *)&v3 viewDidLayoutSubviews];
  [(HROnboardingBulletPointViewController *)self _adjustButtonFooterViewLocationForViewContentHeight];
}

- (void)updateUserInterfaceForStyle:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)HROnboardingBulletPointViewController;
  [(HROnboardingBulletPointViewController *)&v15 updateUserInterfaceForStyle:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v4 = [(HROnboardingBulletPointViewController *)self bulletPointBodyLabels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        v10 = [MEMORY[0x263F1C550] secondaryLabelColor];
        [v9 setTextColor:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)setUpUI
{
  v37[1] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)HROnboardingBulletPointViewController;
  [(HROnboardingBulletPointViewController *)&v36 setUpUI];
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [(HROnboardingBulletPointViewController *)self setTitleLabel:v3];

  objc_super v4 = [(HROnboardingBulletPointViewController *)self titleString];
  uint64_t v5 = [(HROnboardingBulletPointViewController *)self titleLabel];
  [v5 setText:v4];

  uint64_t v6 = [(HROnboardingBulletPointViewController *)self titleLabel];
  [v6 setTextAlignment:1];

  uint64_t v7 = [(HROnboardingBulletPointViewController *)self titleFont];
  uint64_t v8 = [(HROnboardingBulletPointViewController *)self titleLabel];
  [v8 setFont:v7];

  v9 = [(HROnboardingBulletPointViewController *)self titleLabel];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(HROnboardingBulletPointViewController *)self titleLabel];
  [v10 setNumberOfLines:0];

  long long v11 = [(HROnboardingBulletPointViewController *)self contentView];
  long long v12 = [(HROnboardingBulletPointViewController *)self titleLabel];
  [v11 addSubview:v12];

  long long v13 = [(HROnboardingBulletPointViewController *)self bodyString];

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F1C768]);
    [(HROnboardingBulletPointViewController *)self setBodyLabel:v14];

    objc_super v15 = [(HROnboardingBulletPointViewController *)self bodyString];
    v16 = [(HROnboardingBulletPointViewController *)self bodyLabel];
    [v16 setText:v15];

    uint64_t v17 = [(HROnboardingBulletPointViewController *)self bodyLabel];
    [v17 setTextAlignment:1];

    v18 = [(HROnboardingBulletPointViewController *)self _bodyFont];
    v19 = [(HROnboardingBulletPointViewController *)self bodyLabel];
    [v19 setFont:v18];

    v20 = [(HROnboardingBulletPointViewController *)self bodyLabel];
    [v20 setAdjustsFontForContentSizeCategory:1];

    v21 = [(HROnboardingBulletPointViewController *)self bodyLabel];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

    v22 = [(HROnboardingBulletPointViewController *)self bodyLabel];
    [v22 setNumberOfLines:0];

    v23 = [(HROnboardingBulletPointViewController *)self contentView];
    v24 = [(HROnboardingBulletPointViewController *)self bodyLabel];
    [v23 addSubview:v24];
  }
  id v25 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  [(HROnboardingBulletPointViewController *)self setBulletPointsView:v25];

  v26 = [(HROnboardingBulletPointViewController *)self bulletPointsView];
  [v26 setAxis:1];

  v27 = [(HROnboardingBulletPointViewController *)self bulletPointsView];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  v28 = [(HROnboardingBulletPointViewController *)self contentView];
  v29 = [(HROnboardingBulletPointViewController *)self bulletPointsView];
  [v28 addSubview:v29];

  [(HROnboardingBulletPointViewController *)self _setupBulletPointViews];
  v30 = [(HROnboardingBulletPointViewController *)self buttonTitleString];
  v37[0] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
  v32 = +[HRStackedButtonView buddyStackedButtonViewWithTitles:v31 footerText:0 boldFooterText:0 delegate:self];
  [(HROnboardingBulletPointViewController *)self setStackedButtonView:v32];

  v33 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
  [v33 setBlurHidden:1];

  v34 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
  [v34 setFixedBottomButtonSpacing:1];

  v35 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
  [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)_setupBulletPointViews
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
  [(HROnboardingBulletPointViewController *)self setBulletPointBodyLabels:v3];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [(HROnboardingBulletPointViewController *)self bulletPoints];
  uint64_t v40 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  objc_super v4 = 0;
  if (v40)
  {
    uint64_t v39 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v42 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v7 = [HRImageLabel alloc];
        uint64_t v8 = [v6 bulletImage];
        [(HROnboardingBulletPointViewController *)self _bulletImageSize];
        double v10 = v9;
        double v12 = v11;
        long long v13 = [v6 bulletTitleString];
        id v14 = -[HRImageLabel initWithImage:size:text:](v7, "initWithImage:size:text:", v8, v13, v10, v12);

        objc_super v15 = [(HROnboardingBulletPointViewController *)self _boldSubheadlineFont];
        v16 = [(HRImageLabel *)v14 textLabel];
        [v16 setFont:v15];

        [(HRImageLabel *)v14 setImageAlignment:2];
        [(HRImageLabel *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
        uint64_t v17 = [(HROnboardingBulletPointViewController *)self contentView];
        [v17 addSubview:v14];

        v18 = [(HROnboardingBulletPointViewController *)self titleLabel];
        [(HRImageLabel *)v14 hk_alignHorizontalConstraintsWithView:v18 margin:0.0];

        if (v4)
        {
          v19 = [(HRImageLabel *)v14 textLabel];
          v20 = [v19 topAnchor];
          v21 = [(HRImageLabel *)v4 bottomAnchor];
          v22 = [v20 constraintEqualToAnchor:v21 constant:26.0];
          [v22 setActive:1];
        }
        else
        {
          v23 = [(HROnboardingBulletPointViewController *)self bodyString];

          v19 = [(HRImageLabel *)v14 textLabel];
          v20 = [v19 topAnchor];
          if (v23) {
            [(HROnboardingBulletPointViewController *)self bodyLabel];
          }
          else {
          v21 = [(HROnboardingBulletPointViewController *)self titleLabel];
          }
          v22 = [v21 bottomAnchor];
          v24 = [v20 constraintEqualToAnchor:v22 constant:37.0];
          [v24 setActive:1];
        }
        id v25 = v14;

        v26 = [v6 bulletBodyString];
        uint64_t v27 = [v26 length];

        objc_super v4 = v25;
        if (v27)
        {
          id v28 = objc_alloc_init(MEMORY[0x263F1C768]);
          v29 = [v6 bulletBodyString];
          [v28 setText:v29];

          v30 = [(HROnboardingBulletPointViewController *)self _subheadlineFont];
          [v28 setFont:v30];

          [v28 setAdjustsFontForContentSizeCategory:1];
          [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v28 setNumberOfLines:0];
          v31 = [(HROnboardingBulletPointViewController *)self contentView];
          [v31 addSubview:v28];

          v32 = [(HRImageLabel *)v25 textLabel];
          objc_msgSend(v28, "hk_alignHorizontalConstraintsWithView:margin:", v32, 0.0);

          v33 = [v28 firstBaselineAnchor];
          v34 = [(HRImageLabel *)v25 textLabel];
          v35 = [v34 lastBaselineAnchor];
          [(HROnboardingBulletPointViewController *)self _cannotDoHeaderLastBaselineToCannotDoBodyFirstBaseline];
          objc_super v36 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35);
          [v36 setActive:1];

          objc_super v4 = (HRImageLabel *)v28;
          v37 = [(HROnboardingBulletPointViewController *)self bulletPointBodyLabels];
          [v37 addObject:v4];
        }
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v40);
  }

  [(HROnboardingBulletPointViewController *)self setLastBulletPointView:v4];
}

- (void)setUpConstraints
{
  v31.receiver = self;
  v31.super_class = (Class)HROnboardingBulletPointViewController;
  [(HROnboardingBulletPointViewController *)&v31 setUpConstraints];
  id v3 = [(HROnboardingBulletPointViewController *)self titleLabel];
  objc_super v4 = [(HROnboardingBulletPointViewController *)self contentView];
  HKHealthUIBuddyDirectionalEdgeInsets();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithView:insets:", v4);

  uint64_t v5 = [(HROnboardingBulletPointViewController *)self titleLabel];
  uint64_t v6 = [v5 topAnchor];
  uint64_t v7 = [(HROnboardingBulletPointViewController *)self contentView];
  uint64_t v8 = [v7 topAnchor];
  [(HROnboardingBulletPointViewController *)self contentTop];
  double v9 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
  [v9 setActive:1];

  double v10 = [(HROnboardingBulletPointViewController *)self bodyString];

  if (v10)
  {
    double v11 = [(HROnboardingBulletPointViewController *)self bodyLabel];
    double v12 = [(HROnboardingBulletPointViewController *)self titleLabel];
    objc_msgSend(v11, "hk_alignHorizontalConstraintsWithView:margin:", v12, 0.0);

    long long v13 = [(HROnboardingBulletPointViewController *)self bodyLabel];
    id v14 = [v13 topAnchor];
    objc_super v15 = [(HROnboardingBulletPointViewController *)self titleLabel];
    v16 = [v15 bottomAnchor];
    uint64_t v17 = [v14 constraintEqualToAnchor:v16 constant:15.0];
    [v17 setActive:1];

    v18 = [(HROnboardingBulletPointViewController *)self bulletPointsView];
    v19 = [v18 topAnchor];
    [(HROnboardingBulletPointViewController *)self bodyLabel];
  }
  else
  {
    v18 = [(HROnboardingBulletPointViewController *)self bulletPointsView];
    v19 = [v18 topAnchor];
    [(HROnboardingBulletPointViewController *)self titleLabel];
  v20 = };
  v21 = [v20 bottomAnchor];
  v22 = [v19 constraintEqualToAnchor:v21 constant:37.0];
  [v22 setActive:1];

  v23 = [(HROnboardingBulletPointViewController *)self bulletPointsView];
  v24 = [(HROnboardingBulletPointViewController *)self titleLabel];
  objc_msgSend(v23, "hk_alignHorizontalConstraintsWithView:margin:", v24, 0.0);

  id v25 = [(HROnboardingBulletPointViewController *)self contentView];
  v26 = [v25 bottomAnchor];
  uint64_t v27 = [(HROnboardingBulletPointViewController *)self lastBulletPointView];
  id v28 = [v27 bottomAnchor];
  v29 = [v26 constraintEqualToAnchor:v28 constant:*MEMORY[0x263F46378]];
  [(HROnboardingBulletPointViewController *)self setContentViewBottomConstraint:v29];

  v30 = [(HROnboardingBulletPointViewController *)self contentViewBottomConstraint];
  [v30 setActive:1];
}

- (void)stackedButtonView:(id)a3 didTapButtonAtIndex:(int64_t)a4
{
  if (!a4)
  {
    id v5 = [(HROnboardingBulletPointViewController *)self delegate];
    [v5 stepForward];
  }
}

- (CGSize)_bulletImageSize
{
  double v2 = 40.0;
  double v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setUpButtonFooterView
{
  if ([(HROnboardingBulletPointViewController *)self isOnboarding])
  {
    double v3 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
    HKHealthUIBuddyDirectionalEdgeInsets();
    -[HROnboardingBulletPointViewController setFooterView:insets:](self, "setFooterView:insets:", v3);

    uint64_t v4 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
    id v5 = [(HROnboardingBulletPointViewController *)self view];
    [v4 alignBlurViewHorizontalConstraintsWithView:v5];

    id v6 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
    [v6 setBlurHidden:0];
  }
}

- (void)_adjustButtonFooterViewLocationForViewContentHeight
{
  v44[1] = *MEMORY[0x263EF8340];
  if ([(HROnboardingBulletPointViewController *)self isOnboarding])
  {
    double v3 = [(HROnboardingBulletPointViewController *)self view];
    [v3 layoutIfNeeded];

    uint64_t v4 = [(HROnboardingBulletPointViewController *)self view];
    id v5 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
    id v6 = [v5 buttons];
    uint64_t v7 = [v6 firstObject];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
    objc_msgSend(v4, "convertRect:fromView:", v16, v9, v11, v13, v15);
    double v18 = v17;

    v19 = [(HROnboardingBulletPointViewController *)self contentView];
    [v19 frame];
    double v21 = v20;
    v22 = [(HROnboardingBulletPointViewController *)self view];
    [v22 safeAreaInsets];
    double v24 = v18 - v23;

    if (v21 > v24)
    {
      [(HROnboardingBulletPointViewController *)self removeFooterView];
      id v25 = [(HROnboardingBulletPointViewController *)self contentView];
      v26 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
      [v25 addSubview:v26];

      uint64_t v27 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
      [v27 setBlurHidden:1];

      id v28 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
      v29 = [(HROnboardingBulletPointViewController *)self titleLabel];
      objc_msgSend(v28, "hk_alignHorizontalConstraintsWithView:margin:", v29, 0.0);

      v30 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
      objc_super v31 = [v30 topAnchor];
      v32 = [(HROnboardingBulletPointViewController *)self lastBulletPointView];
      v33 = [v32 bottomAnchor];
      v34 = [v31 constraintEqualToAnchor:v33 constant:*MEMORY[0x263F463B0]];
      [v34 setActive:1];

      v35 = (void *)MEMORY[0x263F08938];
      objc_super v36 = [(HROnboardingBulletPointViewController *)self contentViewBottomConstraint];
      v44[0] = v36;
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
      [v35 deactivateConstraints:v37];

      [(HROnboardingBulletPointViewController *)self setContentViewBottomConstraint:0];
      v38 = [(HROnboardingBulletPointViewController *)self contentView];
      uint64_t v39 = [v38 bottomAnchor];
      uint64_t v40 = [(HROnboardingBulletPointViewController *)self stackedButtonView];
      long long v41 = [v40 bottomAnchor];
      long long v42 = [v39 constraintEqualToAnchor:v41];
      [(HROnboardingBulletPointViewController *)self setContentViewBottomConstraint:v42];

      long long v43 = [(HROnboardingBulletPointViewController *)self contentViewBottomConstraint];
      [v43 setActive:1];
    }
  }
}

- (id)_bodyFont
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
}

- (id)_subheadlineFont
{
  return (id)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2C0]];
}

- (id)_boldSubheadlineFont
{
  return (id)objc_msgSend(MEMORY[0x263F1C658], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x263F1D2C0], 2);
}

- (double)_cannotDoHeaderLastBaselineToCannotDoBodyFirstBaseline
{
  double v2 = [(HROnboardingBulletPointViewController *)self _bodyFont];
  [v2 _scaledValueForValue:27.0];
  double v4 = v3;

  return v4;
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

- (UIStackView)bulletPointsView
{
  return self->_bulletPointsView;
}

- (void)setBulletPointsView:(id)a3
{
}

- (HRStackedButtonView)stackedButtonView
{
  return self->_stackedButtonView;
}

- (void)setStackedButtonView:(id)a3
{
}

- (UIView)lastBulletPointView
{
  return self->_lastBulletPointView;
}

- (void)setLastBulletPointView:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (void)setContentViewBottomConstraint:(id)a3
{
}

- (NSHashTable)bulletPointBodyLabels
{
  return self->_bulletPointBodyLabels;
}

- (void)setBulletPointBodyLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletPointBodyLabels, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_lastBulletPointView, 0);
  objc_storeStrong((id *)&self->_stackedButtonView, 0);
  objc_storeStrong((id *)&self->_bulletPointsView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (NSString)titleString
{
  return (NSString *)&stru_26D2B53D0;
}

- (NSString)bodyString
{
  return 0;
}

- (NSArray)bulletPoints
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (NSString)buttonTitleString
{
  return (NSString *)&stru_26D2B53D0;
}

@end