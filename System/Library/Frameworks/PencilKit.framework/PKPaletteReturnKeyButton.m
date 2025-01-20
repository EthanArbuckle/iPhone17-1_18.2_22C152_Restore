@interface PKPaletteReturnKeyButton
- (BOOL)_shouldUseBlueReturnKeyColor;
- (BOOL)_useCompactLayout;
- (CGSize)_contentViewSize;
- (CGSize)intrinsicContentSize;
- (PKPaletteReturnKeyButton)initWithFrame:(CGRect)a3;
- (PKPaletteReturnKeyButtonContentView)contentView;
- (PKTextInputLanguageSelectionToken)observerToken;
- (double)scalingFactor;
- (id)_backgroundColor;
- (id)_regularLayoutBackgroundColor;
- (id)_returnKeyImage;
- (id)_returnKeyImageSymbolConfiguration;
- (id)_returnKeyLabelText;
- (id)_returnKeyTintColor;
- (id)_textColor;
- (int64_t)axis;
- (int64_t)returnKeyType;
- (void)_updateContentViewOrientation;
- (void)_updateImageView;
- (void)_updateLabelText;
- (void)_updateUI;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAxis:(int64_t)a3;
- (void)setContentView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setObserverToken:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setScalingFactor:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPaletteReturnKeyButton

- (PKPaletteReturnKeyButton)initWithFrame:(CGRect)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PKPaletteReturnKeyButton;
  v3 = -[PKPaletteButton initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKPaletteReturnKeyButton *)v3 setAccessibilityIdentifier:@"Scribble-Large-Return-Button"];
    v5 = objc_alloc_init(PKPaletteReturnKeyButtonContentView);
    contentView = v4->_contentView;
    v4->_contentView = v5;

    [(PKPaletteReturnKeyButtonContentView *)v4->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteReturnKeyButtonContentView *)v4->_contentView setUserInteractionEnabled:0];
    [(PKPaletteReturnKeyButton *)v4 addSubview:v4->_contentView];
    v7 = (void *)MEMORY[0x1E4F28DC8];
    v8 = [(PKPaletteReturnKeyButtonContentView *)v4->_contentView centerXAnchor];
    v9 = [(PKPaletteReturnKeyButton *)v4 centerXAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v23[0] = v10;
    v11 = [(PKPaletteReturnKeyButtonContentView *)v4->_contentView centerYAnchor];
    v12 = [(PKPaletteReturnKeyButton *)v4 centerYAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v23[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    [v7 activateConstraints:v14];

    [(PKPaletteReturnKeyButton *)v4 _updateUI];
    objc_initWeak(&location, v4);
    v15 = +[PKTextInputLanguageSelectionController sharedInstance];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __42__PKPaletteReturnKeyButton_initWithFrame___block_invoke;
    v19[3] = &unk_1E64C7030;
    objc_copyWeak(&v20, &location);
    uint64_t v16 = [v15 registerObserver:v19];
    observerToken = v4->_observerToken;
    v4->_observerToken = (PKTextInputLanguageSelectionToken *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __42__PKPaletteReturnKeyButton_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateUI];
}

- (void)dealloc
{
  [(PKTextInputLanguageSelectionToken *)self->_observerToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKPaletteReturnKeyButton;
  [(PKPaletteReturnKeyButton *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaletteReturnKeyButton;
  [(PKPaletteButton *)&v9 layoutSubviews];
  int64_t v3 = [(PKPaletteReturnKeyButton *)self axis];
  [(PKPaletteReturnKeyButton *)self bounds];
  if (v3) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  double v7 = v6 * 0.5;
  v8 = [(PKPaletteReturnKeyButton *)self layer];
  [v8 setCornerRadius:v7];
}

- (CGSize)intrinsicContentSize
{
  [(PKPaletteReturnKeyButton *)self _contentViewSize];
  double v4 = v3;
  double v6 = v5;
  [(PKPaletteReturnKeyButton *)self scalingFactor];
  double v8 = v6 * v7;
  double v9 = v4 * v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)_contentViewSize
{
  double v3 = 28.0;
  double v4 = 28.0;
  if (![(PKPaletteReturnKeyButton *)self _useCompactLayout])
  {
    double v5 = [(PKPaletteReturnKeyButton *)self contentView];
    objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
    double v4 = v6;
    double v3 = v7;

    if ([(PKPaletteReturnKeyButton *)self axis]) {
      double v3 = v3 + 40.0;
    }
    else {
      double v4 = v4 + 40.0;
    }
  }
  double v8 = v4;
  double v9 = v3;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKPaletteReturnKeyButton *)self _updateUI];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPaletteReturnKeyButton *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteReturnKeyButton;
    [(PKPaletteButton *)&v5 setHighlighted:v3];
    [(PKPaletteReturnKeyButton *)self _updateUI];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPaletteReturnKeyButton *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKPaletteReturnKeyButton;
    [(PKPaletteButton *)&v5 setEnabled:v3];
    [(PKPaletteReturnKeyButton *)self _updateUI];
  }
}

- (void)setReturnKeyType:(int64_t)a3
{
  if (self->_returnKeyType != a3)
  {
    self->_returnKeyType = a3;
    [(PKPaletteReturnKeyButton *)self _updateUI];
  }
}

- (void)setAxis:(int64_t)a3
{
  if (self->_axis != a3)
  {
    self->_axis = a3;
    [(PKPaletteReturnKeyButton *)self _updateUI];
  }
}

- (void)_updateUI
{
  [(PKPaletteReturnKeyButton *)self _updateLabelText];
  [(PKPaletteReturnKeyButton *)self _updateImageView];
  [(PKPaletteReturnKeyButton *)self _updateContentViewOrientation];
  BOOL v3 = [(PKPaletteReturnKeyButton *)self _useCompactLayout];
  double v4 = [(PKPaletteReturnKeyButton *)self contentView];
  [v4 setUseCompactLayout:v3];

  objc_super v5 = [(PKPaletteReturnKeyButton *)self _backgroundColor];
  [(PKPaletteReturnKeyButton *)self setBackgroundColor:v5];

  [(PKPaletteReturnKeyButton *)self invalidateIntrinsicContentSize];
}

- (BOOL)_useCompactLayout
{
  BOOL v3 = [(PKPaletteReturnKeyButton *)self traitCollection];
  double v4 = [(PKPaletteReturnKeyButton *)self window];
  objc_super v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  return v6;
}

- (void)_updateImageView
{
  BOOL v3 = [(PKPaletteReturnKeyButton *)self _returnKeyImage];
  double v4 = [(PKPaletteReturnKeyButton *)self contentView];
  objc_super v5 = [v4 imageView];
  [v5 setImage:v3];

  id v8 = [(PKPaletteReturnKeyButton *)self _returnKeyTintColor];
  BOOL v6 = [(PKPaletteReturnKeyButton *)self contentView];
  double v7 = [v6 imageView];
  [v7 setTintColor:v8];
}

- (id)_backgroundColor
{
  if ([(PKPaletteReturnKeyButton *)self _useCompactLayout]) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  BOOL v3 = [(PKPaletteReturnKeyButton *)self _regularLayoutBackgroundColor];
  }

  return v3;
}

- (id)_regularLayoutBackgroundColor
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_paletteButtonBackgroundColor");
  if ([(PKPaletteReturnKeyButton *)self isEnabled])
  {
    if ([(PKPaletteReturnKeyButton *)self _shouldUseBlueReturnKeyColor])
    {
      uint64_t v4 = [MEMORY[0x1E4FB1618] systemBlueColor];

      BOOL v3 = (void *)v4;
    }
    if ([(PKPaletteReturnKeyButton *)self isHighlighted])
    {
      uint64_t v5 = [v3 colorWithAlphaComponent:0.5];

      BOOL v3 = (void *)v5;
    }
  }

  return v3;
}

- (id)_returnKeyTintColor
{
  if ([(PKPaletteReturnKeyButton *)self _useCompactLayout]) {
    [(PKPaletteReturnKeyButton *)self _regularLayoutBackgroundColor];
  }
  else {
  BOOL v3 = [(PKPaletteReturnKeyButton *)self _textColor];
  }

  return v3;
}

- (void)_updateContentViewOrientation
{
  BOOL v3 = [(PKPaletteReturnKeyButton *)self axis] == 1;
  uint64_t v4 = [(PKPaletteReturnKeyButton *)self contentView];
  [v4 setLayoutOrientation:v3];

  [(PKPaletteReturnKeyButton *)self scalingFactor];
  CGFloat v6 = v5;
  [(PKPaletteReturnKeyButton *)self scalingFactor];
  CGAffineTransformMakeScale(&v10, v6, v7);
  id v8 = [(PKPaletteReturnKeyButton *)self contentView];
  CGAffineTransform v9 = v10;
  [v8 setTransform:&v9];
}

- (void)_updateLabelText
{
  BOOL v3 = [(PKPaletteReturnKeyButton *)self _returnKeyLabelText];
  uint64_t v4 = [(PKPaletteReturnKeyButton *)self contentView];
  [v4 setText:v3];

  id v6 = [(PKPaletteReturnKeyButton *)self _textColor];
  double v5 = [(PKPaletteReturnKeyButton *)self contentView];
  [v5 setTextColor:v6];
}

- (id)_returnKeyLabelText
{
  BOOL v3 = +[PKTextInputLanguageSelectionController sharedInstance];
  uint64_t v4 = [v3 currentLanguageIdentifiers];
  double v5 = [v4 firstObject];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v5];
  }
  else
  {
    id v6 = 0;
  }
  [(PKPaletteReturnKeyButton *)self returnKeyType];
  CGFloat v7 = UIKeyboardLocalizedReturnKeyNameForLocale();
  id v8 = [v7 capitalizedStringWithLocale:v6];

  return v8;
}

- (id)_textColor
{
  BOOL v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  if ([(PKPaletteReturnKeyButton *)self _shouldUseBlueReturnKeyColor])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] whiteColor];

    BOOL v3 = (void *)v4;
  }
  if (([(PKPaletteReturnKeyButton *)self isEnabled] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];

    BOOL v3 = (void *)v5;
  }

  return v3;
}

- (BOOL)_shouldUseBlueReturnKeyColor
{
  int64_t v3 = [(PKPaletteReturnKeyButton *)self returnKeyType];
  if (v3) {
    LOBYTE(v3) = [(PKPaletteReturnKeyButton *)self returnKeyType] != 4
  }
              && [(PKPaletteReturnKeyButton *)self returnKeyType] != 11;
  return v3;
}

- (id)_returnKeyImage
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  int64_t v3 = [(PKPaletteReturnKeyButton *)self _returnKeyImageSymbolConfiguration];
  uint64_t v4 = [v2 systemImageNamed:@"arrow.forward.circle" withConfiguration:v3];
  uint64_t v5 = [v4 imageFlippedForRightToLeftLayoutDirection];

  return v5;
}

- (id)_returnKeyImageSymbolConfiguration
{
  if ([(PKPaletteReturnKeyButton *)self _useCompactLayout]) {
    [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:2 scale:17.0];
  }
  else {
  v2 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:14.0];
  }

  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaletteReturnKeyButton;
  [(PKPaletteButton *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKPaletteReturnKeyButton *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];
  if (v6 == [v4 verticalSizeClass])
  {
    CGFloat v7 = [(PKPaletteReturnKeyButton *)self traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];
    uint64_t v9 = [v4 horizontalSizeClass];

    if (v8 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(PKPaletteReturnKeyButton *)self _updateUI];
LABEL_6:
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (int64_t)axis
{
  return self->_axis;
}

- (PKPaletteReturnKeyButtonContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (PKTextInputLanguageSelectionToken)observerToken
{
  return self->_observerToken;
}

- (void)setObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerToken, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end