@interface HKCurrentTimeView
- (BOOL)currentTimeButtonEnabled;
- (BOOL)disableControls;
- (BOOL)nextTimeButtonEnabled;
- (BOOL)omitPrevNextButtons;
- (BOOL)previousTimeButtonEnabled;
- (HKCurrentTimeView)initWithCoder:(id)a3;
- (HKCurrentTimeView)initWithFrame:(CGRect)a3;
- (HKCurrentTimeView)initWithWideHorizontalMargin:(BOOL)a3;
- (HKCurrentTimeViewDelegate)delegate;
- (NSString)currentTimeString;
- (double)_backgroundAlpha:(BOOL)a3;
- (double)_currentTimeButtonBaselineToBottom;
- (double)_currentTimeButtonBaselineToTop;
- (double)_foregroundAlpha:(BOOL)a3;
- (id)_backgroundColor:(BOOL)a3;
- (id)_colorIfForeground:(BOOL)a3 enabled:(BOOL)a4;
- (id)_currentTimeButtonFont;
- (id)_foregroundColor:(BOOL)a3;
- (id)_labelColor:(BOOL)a3;
- (id)_tintColor:(BOOL)a3;
- (void)_handleContentSizeCategoryDidChange;
- (void)currentTimeButtonTapped:(id)a3;
- (void)dealloc;
- (void)nextTimeIndexButtonTapped:(id)a3;
- (void)previousTimeIndexButtonTapped:(id)a3;
- (void)setCurrentTimeButtonEnabled:(BOOL)a3;
- (void)setCurrentTimeString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableControls:(BOOL)a3;
- (void)setNextTimeButtonEnabled:(BOOL)a3;
- (void)setOmitPrevNextButtons:(BOOL)a3;
- (void)setPreviousTimeButtonEnabled:(BOOL)a3;
- (void)setupViewWithWideHorizontalMargin:(BOOL)a3;
@end

@implementation HKCurrentTimeView

- (HKCurrentTimeView)initWithWideHorizontalMargin:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  v8.receiver = self;
  v8.super_class = (Class)HKCurrentTimeView;
  v6 = -[HKCurrentTimeView initWithFrame:](&v8, sel_initWithFrame_);

  if (v6) {
    [(HKCurrentTimeView *)v6 setupViewWithWideHorizontalMargin:v3];
  }
  return v6;
}

- (HKCurrentTimeView)initWithFrame:(CGRect)a3
{
  return -[HKCurrentTimeView initWithWideHorizontalMargin:](self, "initWithWideHorizontalMargin:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HKCurrentTimeView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKCurrentTimeView;
  return [(HKCurrentTimeView *)&v4 initWithCoder:a3];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKCurrentTimeView;
  [(HKCurrentTimeView *)&v4 dealloc];
}

- (void)setupViewWithWideHorizontalMargin:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
  currentTimeButton = self->_currentTimeButton;
  self->_currentTimeButton = v5;

  [(UIButton *)self->_currentTimeButton addTarget:self action:sel_currentTimeButtonTapped_ forControlEvents:64];
  v7 = [(UIButton *)self->_currentTimeButton titleLabel];
  objc_super v8 = [(HKCurrentTimeView *)self _currentTimeButtonFont];
  [v7 setFont:v8];

  v9 = [(UIButton *)self->_currentTimeButton titleLabel];
  [v9 setAdjustsFontSizeToFitWidth:1];

  v10 = [(UIButton *)self->_currentTimeButton titleLabel];
  [v10 setBaselineAdjustment:1];

  v11 = self->_currentTimeButton;
  v12 = HKHealthKeyColor();
  [(UIButton *)v11 setTitleColor:v12 forState:0];

  [(UIButton *)self->_currentTimeButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HKCurrentTimeView *)self addSubview:self->_currentTimeButton];
  v13 = [[HKCurrentTimeChevronButton alloc] initWithChevronDirection:1];
  previousTimeIndexButton = self->_previousTimeIndexButton;
  self->_previousTimeIndexButton = v13;

  [(HKCurrentTimeChevronButton *)self->_previousTimeIndexButton addTarget:self action:sel_previousTimeIndexButtonTapped_ forControlEvents:64];
  [(HKCurrentTimeChevronButton *)self->_previousTimeIndexButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HKCurrentTimeView *)self addSubview:self->_previousTimeIndexButton];
  v15 = [[HKCurrentTimeChevronButton alloc] initWithChevronDirection:0];
  nextTimeIndexButton = self->_nextTimeIndexButton;
  self->_nextTimeIndexButton = v15;

  [(HKCurrentTimeChevronButton *)self->_nextTimeIndexButton addTarget:self action:sel_nextTimeIndexButtonTapped_ forControlEvents:64];
  [(HKCurrentTimeChevronButton *)self->_nextTimeIndexButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HKCurrentTimeView *)self addSubview:self->_nextTimeIndexButton];
  [(HKCurrentTimeView *)self setPreviousTimeButtonEnabled:0];
  [(HKCurrentTimeView *)self setNextTimeButtonEnabled:0];
  if (v3) {
    double v17 = 16.0;
  }
  else {
    double v17 = 3.0;
  }
  v18 = [(HKCurrentTimeChevronButton *)self->_previousTimeIndexButton leftAnchor];
  v19 = [(HKCurrentTimeView *)self leftAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:v17];
  [v20 setActive:1];

  v21 = [(HKCurrentTimeChevronButton *)self->_previousTimeIndexButton centerYAnchor];
  v22 = [(UIButton *)self->_currentTimeButton centerYAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [(HKCurrentTimeChevronButton *)self->_previousTimeIndexButton widthAnchor];
  v25 = [v24 constraintEqualToConstant:54.0];
  [v25 setActive:1];

  v26 = [(HKCurrentTimeChevronButton *)self->_nextTimeIndexButton rightAnchor];
  v27 = [(HKCurrentTimeView *)self rightAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:-v17];
  [v28 setActive:1];

  v29 = [(HKCurrentTimeChevronButton *)self->_nextTimeIndexButton centerYAnchor];
  v30 = [(UIButton *)self->_currentTimeButton centerYAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  v32 = [(HKCurrentTimeChevronButton *)self->_nextTimeIndexButton widthAnchor];
  v33 = [v32 constraintEqualToConstant:54.0];
  [v33 setActive:1];

  v34 = [(UIButton *)self->_currentTimeButton centerXAnchor];
  v35 = [(HKCurrentTimeView *)self centerXAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [v36 setActive:1];

  v37 = [(UIButton *)self->_currentTimeButton leftAnchor];
  v38 = [(HKCurrentTimeView *)self leftAnchor];
  v39 = [v37 constraintEqualToAnchor:v38 constant:v17 + 27.0];
  [v39 setActive:1];

  v40 = [(UIButton *)self->_currentTimeButton rightAnchor];
  v41 = [(HKCurrentTimeView *)self rightAnchor];
  v42 = [v40 constraintEqualToAnchor:v41 constant:-27.0 - v17];
  [v42 setActive:1];

  v43 = [(UIButton *)self->_currentTimeButton topAnchor];
  v44 = [(HKCurrentTimeView *)self topAnchor];
  v45 = [v43 constraintEqualToAnchor:v44 constant:2.0];
  [v45 setActive:1];

  v46 = [(UIButton *)self->_currentTimeButton bottomAnchor];
  v47 = [(HKCurrentTimeView *)self bottomAnchor];
  v48 = [v46 constraintEqualToAnchor:v47 constant:-2.0];
  [v48 setActive:1];

  id v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v49 addObserver:self selector:sel__handleContentSizeCategoryDidChange name:*MEMORY[0x1E4FB27A8] object:0];
}

- (void)setCurrentTimeString:(id)a3
{
  objc_storeStrong((id *)&self->_currentTimeString, a3);
  id v5 = a3;
  [(UIButton *)self->_currentTimeButton setTitle:v5 forState:0];
}

- (void)setDisableControls:(BOOL)a3
{
  BOOL v3 = a3;
  self->_disableControls = a3;
  if (a3)
  {
    BOOL omitPrevNextButtons = 1;
    [(HKCurrentTimeChevronButton *)self->_previousTimeIndexButton setHidden:1];
  }
  else
  {
    [(HKCurrentTimeChevronButton *)self->_previousTimeIndexButton setHidden:self->_omitPrevNextButtons];
    BOOL omitPrevNextButtons = self->_omitPrevNextButtons;
  }
  [(HKCurrentTimeChevronButton *)self->_nextTimeIndexButton setHidden:omitPrevNextButtons];
  [(UIButton *)self->_currentTimeButton setEnabled:!v3];
  [(HKCurrentTimeView *)self setNeedsLayout];
}

- (BOOL)previousTimeButtonEnabled
{
  return [(HKCurrentTimeChevronButton *)self->_previousTimeIndexButton isEnabled];
}

- (BOOL)nextTimeButtonEnabled
{
  return [(HKCurrentTimeChevronButton *)self->_nextTimeIndexButton isEnabled];
}

- (void)setPreviousTimeButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[HKCurrentTimeChevronButton setEnabled:](self->_previousTimeIndexButton, "setEnabled:");
  id v5 = [(HKCurrentTimeChevronButton *)self->_previousTimeIndexButton imageView];
  v6 = [(HKCurrentTimeView *)self _colorIfForeground:1 enabled:v3];
  [v5 setTintColor:v6];

  previousTimeIndexButton = self->_previousTimeIndexButton;
  id v8 = [(HKCurrentTimeView *)self _colorIfForeground:0 enabled:v3];
  [(HKCurrentTimeChevronButton *)previousTimeIndexButton setTintColor:v8];
}

- (void)setNextTimeButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[HKCurrentTimeChevronButton setEnabled:](self->_nextTimeIndexButton, "setEnabled:");
  id v5 = [(HKCurrentTimeChevronButton *)self->_nextTimeIndexButton imageView];
  v6 = [(HKCurrentTimeView *)self _colorIfForeground:1 enabled:v3];
  [v5 setTintColor:v6];

  nextTimeIndexButton = self->_nextTimeIndexButton;
  id v8 = [(HKCurrentTimeView *)self _colorIfForeground:0 enabled:v3];
  [(HKCurrentTimeChevronButton *)nextTimeIndexButton setTintColor:v8];
}

- (void)setCurrentTimeButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIButton setEnabled:](self->_currentTimeButton, "setEnabled:");
  currentTimeButton = self->_currentTimeButton;
  id v6 = [(HKCurrentTimeView *)self _labelColor:v3];
  [(UIButton *)currentTimeButton setTitleColor:v6 forState:0];
}

- (void)setOmitPrevNextButtons:(BOOL)a3
{
  self->_BOOL omitPrevNextButtons = a3;
  [(HKCurrentTimeView *)self setDisableControls:self->_disableControls];
}

- (void)currentTimeButtonTapped:(id)a3
{
  id v4 = [(HKCurrentTimeView *)self delegate];
  [v4 currentTimeViewDidTapOnDateSelector:self];
}

- (void)previousTimeIndexButtonTapped:(id)a3
{
  id v4 = [(HKCurrentTimeView *)self delegate];
  [v4 currentTimeViewDidTapOnPreviousTimeButton:self];
}

- (void)nextTimeIndexButtonTapped:(id)a3
{
  id v4 = [(HKCurrentTimeView *)self delegate];
  [v4 currentTimeViewDidTapOnNextTimeButton:self];
}

- (id)_currentTimeButtonFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28F0], 2);
}

- (double)_currentTimeButtonBaselineToTop
{
  v2 = [(HKCurrentTimeView *)self _currentTimeButtonFont];
  [v2 _scaledValueForValue:27.0];
  double v4 = v3;

  return v4;
}

- (double)_currentTimeButtonBaselineToBottom
{
  v2 = [(HKCurrentTimeView *)self _currentTimeButtonFont];
  [v2 _scaledValueForValue:19.0];
  double v4 = v3;

  return v4;
}

- (id)_colorIfForeground:(BOOL)a3 enabled:(BOOL)a4
{
  if (a3) {
    [(HKCurrentTimeView *)self _foregroundColor:a4];
  }
  else {
  double v4 = [(HKCurrentTimeView *)self _backgroundColor:a4];
  }
  return v4;
}

- (id)_tintColor:(BOOL)a3
{
  if (a3) {
    HKHealthTintColor();
  }
  else {
  double v3 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  return v3;
}

- (id)_labelColor:(BOOL)a3
{
  if (a3) {
    HKHealthKeyColor();
  }
  else {
  double v3 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayTextColor");
  }
  return v3;
}

- (id)_foregroundColor:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[HKCurrentTimeView _tintColor:](self, "_tintColor:");
  [(HKCurrentTimeView *)self _foregroundAlpha:v3];
  id v6 = objc_msgSend(v5, "colorWithAlphaComponent:");

  return v6;
}

- (id)_backgroundColor:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[HKCurrentTimeView _tintColor:](self, "_tintColor:");
  [(HKCurrentTimeView *)self _backgroundAlpha:v3];
  id v6 = objc_msgSend(v5, "colorWithAlphaComponent:");

  return v6;
}

- (double)_foregroundAlpha:(BOOL)a3
{
  double result = 0.4;
  if (a3) {
    return 1.0;
  }
  return result;
}

- (double)_backgroundAlpha:(BOOL)a3
{
  double result = 0.1;
  if (a3) {
    return 0.05;
  }
  return result;
}

- (void)_handleContentSizeCategoryDidChange
{
  id v4 = [(UIButton *)self->_currentTimeButton titleLabel];
  BOOL v3 = [(HKCurrentTimeView *)self _currentTimeButtonFont];
  [v4 setFont:v3];
}

- (NSString)currentTimeString
{
  return self->_currentTimeString;
}

- (HKCurrentTimeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKCurrentTimeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)disableControls
{
  return self->_disableControls;
}

- (BOOL)currentTimeButtonEnabled
{
  return self->_currentTimeButtonEnabled;
}

- (BOOL)omitPrevNextButtons
{
  return self->_omitPrevNextButtons;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentTimeString, 0);
  objc_storeStrong((id *)&self->_nextTimeIndexButton, 0);
  objc_storeStrong((id *)&self->_previousTimeIndexButton, 0);
  objc_storeStrong((id *)&self->_currentTimeButton, 0);
}

@end