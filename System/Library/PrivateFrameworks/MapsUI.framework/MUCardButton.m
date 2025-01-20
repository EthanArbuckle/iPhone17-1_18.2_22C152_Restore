@interface MUCardButton
- (BOOL)blurBackground;
- (BOOL)drawBackground;
- (MUCardButton)initWithFrame:(CGRect)a3;
- (NSString)symbolName;
- (UIButton)underlyingButton;
- (UIColor)foregroundColor;
- (UIMenu)menu;
- (UIView)backgroundView;
- (void)_setupButton;
- (void)_setupConstraints;
- (void)_setupDefaults;
- (void)_updateButtonAppearance;
- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)setBackgroundView:(id)a3;
- (void)setBlurBackground:(BOOL)a3;
- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setDrawBackground:(BOOL)a3;
- (void)setForegroundColor:(id)a3;
- (void)setMenu:(id)a3;
- (void)setSymbolName:(id)a3;
@end

@implementation MUCardButton

- (MUCardButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUCardButton;
  v3 = -[MUCardButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUCardButton *)v3 _setupDefaults];
    [(MUCardButton *)v4 _setupButton];
    [(MUCardButton *)v4 _setupConstraints];
    [(MUCardButton *)v4 _updateButtonAppearance];
  }
  return v4;
}

- (void)_setupDefaults
{
  self->_drawBackground = MUIdiomInTraitEnvironment(self) != 5;
  self->_blurBackground = 0;
  symbolName = self->_symbolName;
  self->_symbolName = (NSString *)&stru_1EE3BF360;

  v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  foregroundColor = self->_foregroundColor;
  self->_foregroundColor = v4;
  MEMORY[0x1F41817F8](v4, foregroundColor);
}

- (void)_setupButton
{
  v3 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  actionButton = self->_actionButton;
  self->_actionButton = v3;

  [(UIButton *)self->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_actionButton setShowsMenuAsPrimaryAction:1];
  [(UIButton *)self->_actionButton setPreferredBehavioralStyle:1];
  LODWORD(v5) = 1148846080;
  [(UIButton *)self->_actionButton setContentCompressionResistancePriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [(UIButton *)self->_actionButton setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [(UIButton *)self->_actionButton setContentCompressionResistancePriority:1 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [(UIButton *)self->_actionButton setContentHuggingPriority:1 forAxis:v8];
  [(UIButton *)self->_actionButton setPointerInteractionEnabled:1];
  [(MUCardButton *)self addSubview:self->_actionButton];
  [(MUCardButton *)self setPreservesSuperviewLayoutMargins:0];
  [(MUCardButton *)self setInsetsLayoutMarginsFromSafeArea:0];
  -[MUCardButton setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
}

- (void)_setupConstraints
{
  v32[6] = *MEMORY[0x1E4F143B8];
  if (MUIdiomInTraitEnvironment(self) == 5) {
    double v3 = 24.0;
  }
  else {
    double v3 = 30.0;
  }
  v4 = [(UIButton *)self->_actionButton heightAnchor];
  double v5 = [v4 constraintEqualToConstant:v3];

  double v6 = v5;
  v31 = v5;
  LODWORD(v7) = 1148846080;
  [v5 setPriority:v7];
  double v8 = [(UIButton *)self->_actionButton widthAnchor];
  v9 = [(UIButton *)self->_actionButton heightAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];

  v30 = v10;
  LODWORD(v11) = 1148846080;
  [v10 setPriority:v11];
  v22 = (void *)MEMORY[0x1E4F28DC8];
  v32[0] = v6;
  v32[1] = v10;
  v28 = [(UIButton *)self->_actionButton topAnchor];
  v29 = [(MUCardButton *)self layoutMarginsGuide];
  v27 = [v29 topAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v32[2] = v26;
  v24 = [(UIButton *)self->_actionButton bottomAnchor];
  v25 = [(MUCardButton *)self layoutMarginsGuide];
  v23 = [v25 bottomAnchor];
  v12 = [v24 constraintEqualToAnchor:v23];
  v32[3] = v12;
  v13 = [(UIButton *)self->_actionButton leadingAnchor];
  v14 = [(MUCardButton *)self layoutMarginsGuide];
  v15 = [v14 leadingAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v32[4] = v16;
  v17 = [(UIButton *)self->_actionButton trailingAnchor];
  v18 = [(MUCardButton *)self layoutMarginsGuide];
  v19 = [v18 trailingAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  v32[5] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:6];
  [v22 activateConstraints:v21];
}

- (void)_updateButtonAppearance
{
  id v15 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  if (self->_drawBackground)
  {
    if (self->_blurBackground)
    {
      double v3 = [MEMORY[0x1E4FB1618] clearColor];
      v4 = [v15 background];
      [v4 setBackgroundColor:v3];

      double v5 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      [v15 setBaseForegroundColor:v5];

      double v6 = [MEMORY[0x1E4FB14C8] effectWithStyle:16];
      double v7 = [v15 background];
      [v7 setVisualEffect:v6];

      goto LABEL_10;
    }
    uint64_t v8 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  }
  else
  {
    if (self->_isHovering) {
      [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    }
    else {
    uint64_t v8 = [MEMORY[0x1E4FB1618] clearColor];
    }
  }
  v9 = (void *)v8;
  v10 = [v15 background];
  [v10 setBackgroundColor:v9];

  [v15 setBaseForegroundColor:self->_foregroundColor];
LABEL_10:
  [v15 setCornerStyle:4];
  double v11 = [MEMORY[0x1E4FB1830] configurationWithPointSize:7 weight:2 scale:15.0];
  v12 = [MEMORY[0x1E4FB1818] systemImageNamed:self->_symbolName withConfiguration:v11];
  [v15 setImage:v12];

  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    v14 = [v15 background];
    [v14 setCustomView:backgroundView];
  }
  [(UIButton *)self->_actionButton setConfiguration:v15];
}

- (void)setSymbolName:(id)a3
{
  id v6 = a3;
  if ((-[NSString isEqual:](self->_symbolName, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    symbolName = self->_symbolName;
    self->_symbolName = v4;

    [(MUCardButton *)self _updateButtonAppearance];
  }
}

- (void)setBlurBackground:(BOOL)a3
{
  if (self->_blurBackground != a3)
  {
    self->_blurBackground = a3;
    [(MUCardButton *)self _updateButtonAppearance];
  }
}

- (void)setDrawBackground:(BOOL)a3
{
  if (self->_drawBackground != a3)
  {
    self->_drawBackground = a3;
    [(MUCardButton *)self _updateButtonAppearance];
  }
}

- (void)setBackgroundView:(id)a3
{
  double v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_backgroundView, a3);
    p_backgroundView = (UIView **)[(MUCardButton *)self _updateButtonAppearance];
    double v5 = v7;
  }
  MEMORY[0x1F41817F8](p_backgroundView, v5);
}

- (void)setForegroundColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_foregroundColor = &self->_foregroundColor;
  if (self->_foregroundColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_foregroundColor, a3);
    p_foregroundColor = (UIColor **)[(MUCardButton *)self _updateButtonAppearance];
    double v5 = v7;
  }
  MEMORY[0x1F41817F8](p_foregroundColor, v5);
}

- (void)setMenu:(id)a3
{
}

- (UIMenu)menu
{
  return [(UIButton *)self->_actionButton menu];
}

- (UIButton)underlyingButton
{
  return self->_actionButton;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
}

- (void)setDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  double trailing = a3.trailing;
  double bottom = a3.bottom;
  double leading = a3.leading;
  double top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)MUCardButton;
  [(MUCardButton *)&v8 setDirectionalLayoutMargins:sel_setDirectionalLayoutMargins_];
  if (MUIdiomInTraitEnvironment(self) != 5) {
    -[UIButton _setTouchInsets:](self->_actionButton, "_setTouchInsets:", -top, -leading, -bottom, -trailing);
  }
}

- (BOOL)blurBackground
{
  return self->_blurBackground;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (BOOL)drawBackground
{
  return self->_drawBackground;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end