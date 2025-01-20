@interface CPUIBarButton
+ (id)buttonWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 type:(unint64_t)a6;
- (BOOL)_showsRoundedBackground;
- (BOOL)showBackIndicator;
- (BOOL)usesSystemComposeGlyph;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSLayoutConstraint)backIndicatorHeightConstraint;
- (UIColor)focusedBackgroundColor;
- (UIColor)focusedColor;
- (UIColor)normalBackgroundColor;
- (UIColor)normalColor;
- (UIFont)buttonFont;
- (UIImage)backIndicatorImage;
- (UIImage)image;
- (UIImageView)backIndicatorImageView;
- (UIView)backgroundView;
- (id)_externalUnfocusedBorderColor;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)style;
- (unint64_t)type;
- (void)_resetAlpha;
- (void)_setupBackButtonImagesIfNeccessary;
- (void)_updateBackIndicatorImageView;
- (void)_updateBackgroundColorWithIsFocused:(BOOL)a3;
- (void)_updateButtonImage:(id)a3;
- (void)didAddSubview:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setBackIndicatorHeightConstraint:(id)a3;
- (void)setBackIndicatorImage:(id)a3;
- (void)setBackIndicatorImageView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setButtonFont:(id)a3;
- (void)setFocusedBackgroundColor:(id)a3;
- (void)setFocusedColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setNormalBackgroundColor:(id)a3;
- (void)setNormalColor:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setUsesSystemComposeGlyph:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPUIBarButton

+ (id)buttonWithTitle:(id)a3 image:(id)a4 style:(int64_t)a5 type:(unint64_t)a6
{
  v68[5] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v65.receiver = a1;
  v65.super_class = (Class)&OBJC_METACLASS___CPUIBarButton;
  v12 = objc_msgSendSuper2(&v65, sel_buttonWithType_, 0);
  v13 = v12;
  if (v12)
  {
    [v12 setImage:v11];
    [v13 setType:a6];
    [v13 setStyle:a5];
    v14 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    [v13 setNormalColor:v14];

    v15 = [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
    [v13 setFocusedColor:v15];

    v16 = [v13 focusedColor];
    [v13 setNormalBackgroundColor:v16];

    v17 = [v13 normalColor];
    [v13 setFocusedBackgroundColor:v17];

    if (!v11 && a6 == 3)
    {
      objc_msgSend(v13, "setImageEdgeInsets:", -3.0, 1.0, 0.0, 0.0);
      [v13 setUsesSystemComposeGlyph:1];
      v18 = CPUILocalizedStringForKey(@"COMPOSE");
      v68[0] = v18;
      v19 = CPUILocalizedStringForKey(@"NEW_MESSAGE");
      v68[1] = v19;
      v20 = CPUILocalizedStringForKey(@"CREATE");
      v68[2] = v20;
      v21 = CPUILocalizedStringForKey(@"WRITE");
      v68[3] = v21;
      v22 = CPUILocalizedStringForKey(@"SQUARE_AND_PENCIL");
      v68[4] = v22;
      v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:5];
      [v13 setAccessibilityUserInputLabels:v23];

      v24 = [MEMORY[0x263F82DA0] _currentTraitCollection];
      CPUIMessageComposeGlyph(v24, 17.0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v10)
    {
      [v13 setTitle:v10 forState:0];
    }
    else if (v11)
    {
      [v13 _updateButtonImage:v11];
    }
    double v25 = 0.0;
    id v63 = v11;
    id v64 = v10;
    if ([v13 showBackIndicator])
    {
      v26 = [MEMORY[0x263F82438] sharedApplication];
      uint64_t v27 = [v26 userInterfaceLayoutDirection];

      if (v10)
      {
        if (v27 == 1) {
          double v28 = 0.0;
        }
        else {
          double v28 = 10.0;
        }
        objc_msgSend(v13, "setTitleEdgeInsets:", 0.0, v28);
      }
      else
      {
        objc_msgSend(v13, "setImageEdgeInsets:", 0.0, 0.0, 0.0, 0.0);
      }
      id v29 = objc_alloc_init(MEMORY[0x263F82828]);
      [v13 setBackIndicatorImageView:v29];

      v30 = [v13 backIndicatorImageView];
      [v30 setTranslatesAutoresizingMaskIntoConstraints:0];

      v31 = [v13 backIndicatorImageView];
      [v13 addSubview:v31];

      v61 = [v13 backIndicatorImageView];
      v59 = [v61 widthAnchor];
      v57 = [v59 constraintEqualToConstant:19.5];
      v67[0] = v57;
      v55 = [v13 backIndicatorImageView];
      v32 = [v55 leadingAnchor];
      v33 = [v13 leadingAnchor];
      v34 = [v32 constraintEqualToAnchor:v33 constant:0.0];
      v67[1] = v34;
      v35 = [v13 backIndicatorImageView];
      v36 = [v35 centerYAnchor];
      v37 = [v13 centerYAnchor];
      v38 = [v36 constraintEqualToAnchor:v37 constant:0.5];
      v67[2] = v38;
      v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:3];
      [v13 addConstraints:v39];

      [v13 _setupBackButtonImagesIfNeccessary];
      double v25 = -6.0;
    }
    id v40 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
    int v41 = [v13 _showsRoundedBackground];
    v42 = [v40 layer];
    v43 = v42;
    if (v41)
    {
      [v42 setCornerRadius:17.0];

      v43 = [MEMORY[0x263F825C8] _carSystemQuaternaryColor];
      [v40 setBackgroundColor:v43];
    }
    else
    {
      [v42 setCornerRadius:6.0];
    }

    v44 = [v40 layer];
    [v44 setCornerCurve:*MEMORY[0x263F15A20]];

    [v13 insertSubview:v40 atIndex:0];
    [v13 setBackgroundView:v40];
    v62 = [v40 topAnchor];
    v60 = [v13 topAnchor];
    v58 = [v62 constraintEqualToAnchor:v60];
    v66[0] = v58;
    v56 = [v40 bottomAnchor];
    v54 = [v13 bottomAnchor];
    v45 = [v56 constraintEqualToAnchor:v54];
    v66[1] = v45;
    v46 = [v40 leadingAnchor];
    v47 = [v13 leadingAnchor];
    v48 = [v46 constraintEqualToAnchor:v47 constant:v25];
    v66[2] = v48;
    v49 = [v40 trailingAnchor];
    v50 = [v13 trailingAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    v66[3] = v51;
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:4];
    [v13 addConstraints:v52];

    [v13 sizeToFit];
    id v11 = v63;
    id v10 = v64;
  }

  return v13;
}

- (void)_updateButtonImage:(id)a3
{
  id v4 = a3;
  v5 = [(CPUIBarButton *)self normalColor];
  id v8 = [v4 _flatImageWithColor:v5];

  v6 = [(CPUIBarButton *)self focusedColor];
  v7 = [v8 _flatImageWithColor:v6];

  [(CPUIBarButton *)self setImage:v8 forState:0];
  [(CPUIBarButton *)self setImage:v7 forState:8];
}

- (BOOL)_showsRoundedBackground
{
  v3 = [(CPUIBarButton *)self image];
  if (v3) {
    BOOL v4 = [(CPUIBarButton *)self style] == 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  BOOL v4 = [(CPUIBarButton *)self currentImage];
  v5 = [(CPUIBarButton *)self backIndicatorImageView];

  double v6 = 30.0;
  if (v5
    || (double v6 = 0.0, !v4)
    || ![(CPUIBarButton *)self _showsRoundedBackground]
    || ([v4 size], double v11 = 34.0, v12 > 34.0))
  {
    v7 = [(CPUIBarButton *)self titleForState:0];
    uint64_t v8 = [v7 length];

    if (v8) {
      double v9 = v6 + -10.0;
    }
    else {
      double v9 = v6;
    }
    if (v4)
    {
      [v4 size];
      double v9 = v9 + v10;
    }
    else
    {
      v13 = [(CPUIBarButton *)self currentTitle];

      if (v13)
      {
        v14 = [(CPUIBarButton *)self titleLabel];
        [v14 sizeToFit];

        v15 = [(CPUIBarButton *)self titleLabel];
        [v15 bounds];
        double v9 = v9 + v16;
      }
    }
    if (v9 <= 140.0) {
      double v11 = v9 + 13.0;
    }
    else {
      double v11 = 153.0;
    }
  }

  double v17 = 34.0;
  double v18 = v11;
  result.height = v17;
  result.width = v18;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[CPUIBarButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_externalUnfocusedBorderColor
{
  return (id)[MEMORY[0x263F825C8] clearColor];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5 = [a3 nextFocusedItem];
  BOOL v6 = v5 == self;

  [(CPUIBarButton *)self _updateBackgroundColorWithIsFocused:v6];
  [(CPUIBarButton *)self _updateBackIndicatorImageView];
}

- (void)_updateBackgroundColorWithIsFocused:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CPUIBarButton *)self _showsRoundedBackground])
  {
    if (!v3)
    {
      uint64_t v5 = [(CPUIBarButton *)self normalBackgroundColor];
LABEL_6:
      id v9 = (id)v5;
      goto LABEL_8;
    }
LABEL_5:
    uint64_t v5 = [(CPUIBarButton *)self focusedBackgroundColor];
    goto LABEL_6;
  }
  if (v3) {
    goto LABEL_5;
  }
  id v9 = 0;
LABEL_8:
  BOOL v6 = [(CPUIBarButton *)self backgroundView];
  [v6 setBackgroundColor:v9];

  v7 = [(CPUIBarButton *)self imageView];
  if (v3) {
    [(CPUIBarButton *)self focusedColor];
  }
  else {
  uint64_t v8 = [(CPUIBarButton *)self normalColor];
  }
  [v7 setTintColor:v8];
}

- (void)didAddSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPUIBarButton;
  [(CPUIBarButton *)&v5 didAddSubview:a3];
  BOOL v4 = [(CPUIBarButton *)self backgroundView];
  [(CPUIBarButton *)self sendSubviewToBack:v4];
}

- (void)_setupBackButtonImagesIfNeccessary
{
  v20[1] = *MEMORY[0x263EF8340];
  id v19 = [(CPUIBarButton *)self traitCollection];
  if ([v19 userInterfaceIdiom] == 3 && -[CPUIBarButton showBackIndicator](self, "showBackIndicator"))
  {
    BOOL v3 = [(CPUIBarButton *)self backIndicatorImageView];
    BOOL v4 = [v3 image];

    if (!v4)
    {
      objc_super v5 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83580] variant:1024];
      BOOL v6 = [MEMORY[0x263F82818] configurationWithFont:v5 scale:2];
      if ([(CPUIBarButton *)self type] == 2) {
        v7 = @"xmark.circle.fill";
      }
      else {
        v7 = @"chevron.backward.circle.fill";
      }
      uint64_t v8 = [MEMORY[0x263F827E8] systemImageNamed:v7];
      id v9 = [v8 imageWithSymbolConfiguration:v6];
      [(CPUIBarButton *)self setBackIndicatorImage:v9];

      double v10 = [(CPUIBarButton *)self backIndicatorImageView];
      double v11 = [(CPUIBarButton *)self backIndicatorImage];
      [v10 setImage:v11];

      double v12 = [(CPUIBarButton *)self backIndicatorHeightConstraint];

      if (!v12)
      {
        v13 = [(CPUIBarButton *)self backIndicatorImageView];
        v14 = [v13 heightAnchor];
        v15 = [v14 constraintEqualToConstant:19.0];

        double v16 = (void *)MEMORY[0x263F08938];
        v20[0] = v15;
        double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
        [v16 activateConstraints:v17];

        [(CPUIBarButton *)self setBackIndicatorHeightConstraint:v15];
      }
      double v18 = [(CPUIBarButton *)self backIndicatorHeightConstraint];
      [v18 setConstant:19.0];

      [(CPUIBarButton *)self _updateBackIndicatorImageView];
    }
  }
  else
  {
  }
}

- (BOOL)showBackIndicator
{
  unint64_t v3 = [(CPUIBarButton *)self type];
  if (v3 != 1) {
    LOBYTE(v3) = [(CPUIBarButton *)self type] == 2;
  }
  return v3;
}

- (UIFont)buttonFont
{
  double v2 = [(CPUIBarButton *)self titleLabel];
  unint64_t v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setButtonFont:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CPUIBarButton *)self titleLabel];
  [v5 setFont:v4];

  BOOL v6 = [(CPUIBarButton *)self backIndicatorImageView];
  [v6 setImage:0];

  [(CPUIBarButton *)self _setupBackButtonImagesIfNeccessary];
}

- (void)setNormalColor:(id)a3
{
  objc_storeStrong((id *)&self->_normalColor, a3);
  id v5 = a3;
  [(CPUIBarButton *)self setTitleColor:v5 forState:0];
  BOOL v6 = [(CPUIBarButton *)self image];
  v7 = [v6 _flatImageWithColor:v5];

  [(CPUIBarButton *)self setImage:v7 forState:0];
  [(CPUIBarButton *)self _updateBackgroundColorWithIsFocused:[(CPUIBarButton *)self isFocused]];
  [(CPUIBarButton *)self _updateBackIndicatorImageView];
}

- (void)setFocusedColor:(id)a3
{
  objc_storeStrong((id *)&self->_focusedColor, a3);
  id v5 = a3;
  [(CPUIBarButton *)self setTitleColor:v5 forState:1];
  [(CPUIBarButton *)self setTitleColor:v5 forState:8];
  BOOL v6 = [v5 colorWithAlphaComponent:0.8];
  [(CPUIBarButton *)self setTitleColor:v6 forState:9];

  v7 = [(CPUIBarButton *)self image];
  uint64_t v8 = [v7 _flatImageWithColor:v5];

  [(CPUIBarButton *)self setImage:v8 forState:8];
  [(CPUIBarButton *)self _updateBackgroundColorWithIsFocused:[(CPUIBarButton *)self isFocused]];
  [(CPUIBarButton *)self _updateBackIndicatorImageView];
}

- (void)setNormalBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_normalBackgroundColor, a3);
  uint64_t v4 = [(CPUIBarButton *)self isFocused];
  [(CPUIBarButton *)self _updateBackgroundColorWithIsFocused:v4];
}

- (void)setFocusedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_focusedBackgroundColor, a3);
  uint64_t v4 = [(CPUIBarButton *)self isFocused];
  [(CPUIBarButton *)self _updateBackgroundColorWithIsFocused:v4];
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPUIBarButton;
  [(CPUIButton *)&v7 traitCollectionDidChange:a3];
  [(CPUIBarButton *)self _setupBackButtonImagesIfNeccessary];
  if ([(CPUIBarButton *)self usesSystemComposeGlyph])
  {
    uint64_t v4 = [(CPUIBarButton *)self traitCollection];
    id v5 = CPUIMessageComposeGlyph(v4, 17.0);
    [(CPUIBarButton *)self _updateButtonImage:v5];
  }
  else
  {
    BOOL v6 = [(CPUIBarButton *)self image];

    if (!v6) {
      return;
    }
    uint64_t v4 = [(CPUIBarButton *)self image];
    [(CPUIBarButton *)self _updateButtonImage:v4];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CPUIBarButton;
  id v6 = a3;
  [(CPUIBarButton *)&v9 touchesBegan:v6 withEvent:a4];
  LODWORD(a4) = _touchesContainDirectTouch(v6);

  if (a4)
  {
    if (([(CPUIBarButton *)self isFocused] & 1) == 0)
    {
      objc_super v7 = [(CPUIBarButton *)self backIndicatorImageView];
      [v7 setAlpha:0.2];
    }
    uint64_t v8 = [(CPUIBarButton *)self backgroundView];
    [v8 setAlpha:0.2];
  }
}

- (void)_updateBackIndicatorImageView
{
  unint64_t v3 = [(CPUIBarButton *)self backIndicatorImageView];
  uint64_t v4 = [v3 image];

  if (v4)
  {
    int v5 = [(CPUIBarButton *)self isFocused];
    id v7 = [(CPUIBarButton *)self backIndicatorImageView];
    if (v5) {
      [(CPUIBarButton *)self focusedColor];
    }
    else {
    id v6 = [(CPUIBarButton *)self normalColor];
    }
    [v7 setTintColor:v6];
  }
}

- (void)_resetAlpha
{
  unint64_t v3 = [(CPUIBarButton *)self backIndicatorImageView];
  [v3 setAlpha:1.0];

  id v4 = [(CPUIBarButton *)self backgroundView];
  [v4 setAlpha:1.0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CPUIBarButton;
  id v6 = a3;
  [(CPUIBarButton *)&v7 touchesEnded:v6 withEvent:a4];
  LODWORD(a4) = _touchesContainDirectTouch(v6);

  if (a4) {
    [(CPUIBarButton *)self _resetAlpha];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CPUIBarButton;
  id v6 = a3;
  [(CPUIBarButton *)&v7 touchesCancelled:v6 withEvent:a4];
  LODWORD(a4) = _touchesContainDirectTouch(v6);

  if (a4) {
    [(CPUIBarButton *)self _resetAlpha];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[CPUIBarButton pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y)) {
    int v5 = self;
  }
  else {
    int v5 = 0;
  }
  return v5;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)usesSystemComposeGlyph
{
  return self->_usesSystemComposeGlyph;
}

- (void)setUsesSystemComposeGlyph:(BOOL)a3
{
  self->_usesSystemComposeGlyph = a3;
}

- (UIImageView)backIndicatorImageView
{
  return self->_backIndicatorImageView;
}

- (void)setBackIndicatorImageView:(id)a3
{
}

- (UIImage)backIndicatorImage
{
  return self->_backIndicatorImage;
}

- (void)setBackIndicatorImage:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (NSLayoutConstraint)backIndicatorHeightConstraint
{
  return self->_backIndicatorHeightConstraint;
}

- (void)setBackIndicatorHeightConstraint:(id)a3
{
}

- (UIColor)normalColor
{
  return self->_normalColor;
}

- (UIColor)focusedColor
{
  return self->_focusedColor;
}

- (UIColor)normalBackgroundColor
{
  return self->_normalBackgroundColor;
}

- (UIColor)focusedBackgroundColor
{
  return self->_focusedBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_normalBackgroundColor, 0);
  objc_storeStrong((id *)&self->_focusedColor, 0);
  objc_storeStrong((id *)&self->_normalColor, 0);
  objc_storeStrong((id *)&self->_backIndicatorHeightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backIndicatorImage, 0);
  objc_storeStrong((id *)&self->_backIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end