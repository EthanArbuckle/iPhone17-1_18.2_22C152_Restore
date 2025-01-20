@interface _CAMExpandingControlButton
- (BOOL)isSlashed;
- (CAMSlashContainer)_titleContentView;
- (CGSize)_intrinsicLabelSize;
- (CGSize)intrinsicContentSize;
- (CGSize)slashSize;
- (NSString)titleText;
- (UIEdgeInsets)alignmentRectInsets;
- (UIFont)titleFont;
- (UIImage)titleImage;
- (UIImageView)_filledOutlineContentView;
- (UIImageView)_outlineContentView;
- (UIImageView)_titleImageView;
- (UILabel)_titleLabel;
- (_CAMExpandingControlButton)initWithFrame:(CGRect)a3;
- (id)_attributedTextForTitle:(id)a3;
- (id)_effectiveSubtitleFont;
- (id)_effectiveTitleFont;
- (int64_t)border;
- (int64_t)orientation;
- (void)_createFilledOutlineContentView;
- (void)_createOutlineContentView;
- (void)_setIntrinsicLabelSize:(CGSize)a3;
- (void)_setTitleImageView:(id)a3;
- (void)_setTitleLabel:(id)a3;
- (void)_updateTitleImageView;
- (void)_updateTitleLabel;
- (void)layoutSubviews;
- (void)setBorder:(int64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setSlashSize:(CGSize)a3;
- (void)setSlashed:(BOOL)a3;
- (void)setSlashed:(BOOL)a3 animated:(BOOL)a4;
- (void)setTitleImage:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleText:(id)a3 font:(id)a4;
- (void)tintColorDidChange;
@end

@implementation _CAMExpandingControlButton

- (_CAMExpandingControlButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_CAMExpandingControlButton;
  v3 = -[_CAMExpandingControlButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CAMSlashContainer);
    titleContentView = v3->__titleContentView;
    v3->__titleContentView = v4;

    [(CAMSlashContainer *)v3->__titleContentView setUserInteractionEnabled:0];
    -[CAMSlashContainer setSlashSize:](v3->__titleContentView, "setSlashSize:", 20.0, 20.0);
    [(_CAMExpandingControlButton *)v3 addSubview:v3->__titleContentView];
    id v6 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v6 setUserInteractionEnabled:0];
    [(CAMSlashContainer *)v3->__titleContentView setContentView:v6];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  v3 = [(_CAMExpandingControlButton *)self titleImage];

  if (v3)
  {
    v4 = [(_CAMExpandingControlButton *)self _outlineContentView];

    if (v4)
    {
      v5 = [(_CAMExpandingControlButton *)self _outlineContentView];
    }
    else
    {
      objc_super v8 = [(_CAMExpandingControlButton *)self _filledOutlineContentView];

      if (v8) {
        [(_CAMExpandingControlButton *)self _filledOutlineContentView];
      }
      else {
      v5 = [(_CAMExpandingControlButton *)self _titleImageView];
      }
    }
    v9 = v5;
    double v10 = CAMViewAlignmentSize(v5);
    double v12 = v11;

    double v6 = v10;
    double v7 = v12;
  }
  else
  {
    [(_CAMExpandingControlButton *)self _intrinsicLabelSize];
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v4 = *MEMORY[0x263F834E8];
  double v3 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v6 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
  double v7 = [(_CAMExpandingControlButton *)self _effectiveTitleFont];
  if (v7)
  {
    objc_super v8 = [(_CAMExpandingControlButton *)self titleText];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      [v7 ascender];
      [v7 capHeight];
      UIRoundToViewScale();
      double v4 = v10;
      double v11 = [(_CAMExpandingControlButton *)self _effectiveSubtitleFont];
      [v11 descender];
      UIRoundToViewScale();
      double v6 = v12;
    }
  }

  double v13 = v4;
  double v14 = v3;
  double v15 = v6;
  double v16 = v5;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)layoutSubviews
{
  [(_CAMExpandingControlButton *)self bounds];
  [(_CAMExpandingControlButton *)self intrinsicContentSize];
  double v3 = [(_CAMExpandingControlButton *)self traitCollection];
  [v3 displayScale];
  uint64_t v5 = v4;

  CEKRectWithSize();
  UIRectCenteredIntegralRectScale();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(_CAMExpandingControlButton *)self alignmentRectInsets];
  double v16 = v9 + (v14 - v15) * 0.5;
  v17 = [(_CAMExpandingControlButton *)self _titleContentView];
  objc_msgSend(v17, "setFrame:", v7, v16, v11, v13);

  CEKRectWithSize();
  UIRectGetCenter();
  id v34 = [(_CAMExpandingControlButton *)self _titleImageView];
  double v18 = *MEMORY[0x263F00148];
  double v19 = *(double *)(MEMORY[0x263F00148] + 8);
  [v34 intrinsicContentSize];
  double v21 = v20;
  double v23 = v22;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v34, "setCenter:");
  objc_msgSend(v34, "setBounds:", v18, v19, v21, v23);
  v24 = [(_CAMExpandingControlButton *)self _outlineContentView];
  [v24 intrinsicContentSize];
  double v26 = v25;
  double v28 = v27;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v24, "setCenter:");
  objc_msgSend(v24, "setBounds:", v18, v19, v26, v28);
  v29 = [(_CAMExpandingControlButton *)self _filledOutlineContentView];
  [v29 intrinsicContentSize];
  double v31 = v30;
  double v33 = v32;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v29, "setCenter:");
  objc_msgSend(v29, "setBounds:", v18, v19, v31, v33);
}

- (void)tintColorDidChange
{
  [(_CAMExpandingControlButton *)self _updateTitleLabel];
  [(_CAMExpandingControlButton *)self _updateTitleImageView];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(_CAMExpandingControlButton *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)_CAMExpandingControlButton;
  [(_CAMExpandingControlButton *)&v8 setHighlighted:v3];
  if (v5 != v3)
  {
    double v6 = [(_CAMExpandingControlButton *)self _titleLabel];
    double v7 = [v6 layer];
    +[CAMAnimationHelper animateLayer:v7 forButtonHighlighted:v3 layoutStyle:4];
  }
}

- (void)setTitleImage:(id)a3
{
  if (([a3 isEqual:self->_titleImage] & 1) == 0)
  {
    self->_titleImage = (UIImage *)a3;
    [(_CAMExpandingControlButton *)self _updateTitleImageView];
    [(_CAMExpandingControlButton *)self setNeedsLayout];
  }
}

- (void)_updateTitleImageView
{
  id v20 = [(_CAMExpandingControlButton *)self _titleImageView];
  BOOL v3 = [(_CAMExpandingControlButton *)self titleImage];
  if (!v20 && v3)
  {
    id v20 = objc_alloc_init(MEMORY[0x263F82828]);
    [(_CAMExpandingControlButton *)self _setTitleImageView:v20];
    uint64_t v4 = [(_CAMExpandingControlButton *)self _titleContentView];
    int v5 = [v4 contentView];
    [v5 addSubview:v20];
  }
  [v20 setImage:v3];
  double v6 = [(_CAMExpandingControlButton *)self tintColor];
  int64_t v7 = [(_CAMExpandingControlButton *)self border];
  if (v7 == 2)
  {
    double v11 = [(_CAMExpandingControlButton *)self _filledOutlineContentView];

    if (!v11) {
      [(_CAMExpandingControlButton *)self _createFilledOutlineContentView];
    }
    double v12 = [MEMORY[0x263F825C8] systemBackgroundColor];
    double v13 = [(_CAMExpandingControlButton *)self _titleImageView];
    [v13 setTintColor:v12];

    double v14 = [(_CAMExpandingControlButton *)self _outlineContentView];
    [v14 setAlpha:0.0];

    double v15 = [(_CAMExpandingControlButton *)self _filledOutlineContentView];
    double v16 = v15;
    double v17 = 1.0;
  }
  else
  {
    if (v7 == 1)
    {
      double v18 = [(_CAMExpandingControlButton *)self _outlineContentView];

      if (!v18) {
        [(_CAMExpandingControlButton *)self _createOutlineContentView];
      }
      double v19 = [(_CAMExpandingControlButton *)self _titleImageView];
      [v19 setTintColor:v6];

      objc_super v8 = [(_CAMExpandingControlButton *)self _outlineContentView];
      double v9 = v8;
      double v10 = 0.6;
    }
    else
    {
      if (v7) {
        goto LABEL_16;
      }
      objc_super v8 = [(_CAMExpandingControlButton *)self _outlineContentView];
      double v9 = v8;
      double v10 = 0.0;
    }
    [v8 setAlpha:v10];

    double v15 = [(_CAMExpandingControlButton *)self _filledOutlineContentView];
    double v16 = v15;
    double v17 = 0.0;
  }
  [v15 setAlpha:v17];

LABEL_16:
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(_CAMExpandingControlButton *)self titleFont];
  [(_CAMExpandingControlButton *)self setTitleText:v4 font:v5];
}

- (void)setTitleText:(id)a3 font:(id)a4
{
  double v11 = (NSString *)a3;
  int64_t v7 = (UIFont *)a4;
  titleText = self->_titleText;
  if (titleText != v11 && ![(NSString *)titleText isEqualToString:v11]
    || self->_titleFont != v7 && (-[UIFont isEqual:](v7, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    self->_titleFont = v7;
    [(_CAMExpandingControlButton *)self _updateTitleLabel];
    double v9 = [(_CAMExpandingControlButton *)self _titleLabel];
    [v9 intrinsicContentSize];
    double v10 = [(_CAMExpandingControlButton *)self traitCollection];
    [v10 displayScale];
    CEKSizeCeilToScale();
    -[_CAMExpandingControlButton _setIntrinsicLabelSize:](self, "_setIntrinsicLabelSize:");

    [(_CAMExpandingControlButton *)self setNeedsLayout];
  }
}

- (id)_effectiveTitleFont
{
  v2 = [(_CAMExpandingControlButton *)self titleFont];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[CAMFont cameraFontOfSize:14.0 weight:*MEMORY[0x263F81828]];
  }
  id v5 = v4;

  return v5;
}

- (id)_effectiveSubtitleFont
{
  BOOL v3 = [(_CAMExpandingControlButton *)self titleFont];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(_CAMExpandingControlButton *)self titleText];
    if ([v6 containsString:@"\n"]) {
      +[CAMFont cameraFontOfSize:11.0 weight:*MEMORY[0x263F81838]];
    }
    else {
    id v5 = [(_CAMExpandingControlButton *)self _effectiveTitleFont];
    }
  }
  return v5;
}

- (void)_updateTitleLabel
{
  id v6 = [(_CAMExpandingControlButton *)self _titleLabel];
  BOOL v3 = [(_CAMExpandingControlButton *)self titleText];
  if (!v6 && v3)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v6 setNumberOfLines:0];
    [(_CAMExpandingControlButton *)self _setTitleLabel:v6];
    id v4 = [(_CAMExpandingControlButton *)self _titleContentView];
    [v4 setContentView:v6];
  }
  id v5 = [(_CAMExpandingControlButton *)self _attributedTextForTitle:v3];
  [v6 setAttributedText:v5];
}

- (id)_attributedTextForTitle:(id)a3
{
  v23[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F81650]);
    CEKPixelWidthForView();
    [v5 setParagraphSpacing:v6 + -3.0];
    [v5 setAlignment:1];
    int64_t v7 = [(_CAMExpandingControlButton *)self tintColor];
    objc_super v8 = [(_CAMExpandingControlButton *)self _effectiveTitleFont];
    id v9 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v10 = *MEMORY[0x263F814F0];
    v22[0] = *MEMORY[0x263F81540];
    v22[1] = v10;
    v23[0] = v5;
    v23[1] = v8;
    v22[2] = *MEMORY[0x263F81500];
    v23[2] = v7;
    double v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
    double v12 = (void *)[v9 initWithString:v4 attributes:v11];

    unint64_t v13 = [v4 rangeOfString:@"\n"];
    if (v13 < [v4 length] - 2 && (unint64_t)objc_msgSend(v4, "length") >= 3)
    {
      unint64_t v19 = v13 + 1;
      uint64_t v14 = [v4 length] + ~v13;
      double v15 = (void *)[v12 mutableCopy];
      uint64_t v20 = v10;
      double v16 = [(_CAMExpandingControlButton *)self _effectiveSubtitleFont];
      double v21 = v16;
      double v17 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      objc_msgSend(v15, "addAttributes:range:", v17, v19, v14);

      double v12 = v15;
    }
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (void)setSlashed:(BOOL)a3
{
}

- (void)setSlashed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(_CAMExpandingControlButton *)self _titleContentView];
  [v6 setSlashed:v5 animated:v4];
}

- (BOOL)isSlashed
{
  v2 = [(_CAMExpandingControlButton *)self _titleContentView];
  char v3 = [v2 isSlashed];

  return v3;
}

- (CGSize)slashSize
{
  v2 = [(_CAMExpandingControlButton *)self _titleContentView];
  [v2 slashSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setSlashSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(_CAMExpandingControlButton *)self _titleContentView];
  objc_msgSend(v5, "setSlashSize:", width, height);
}

- (void)setBorder:(int64_t)a3
{
  if (self->_border != a3)
  {
    self->_border = a3;
    [(_CAMExpandingControlButton *)self _updateTitleImageView];
  }
}

- (void)_createOutlineContentView
{
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  double v4 = [(_CAMExpandingControlButton *)self traitCollection];
  [v4 displayScale];
  id v5 = +[CAMControlStatusIndicator stretchableCircleImageFilled:scale:](CAMControlStatusIndicator, "stretchableCircleImageFilled:scale:", 0);
  double v6 = (UIImageView *)[v3 initWithImage:v5];
  outlineContentView = self->__outlineContentView;
  self->__outlineContentView = v6;

  id v10 = [(_CAMExpandingControlButton *)self _titleContentView];
  double v8 = [v10 contentView];
  id v9 = [(_CAMExpandingControlButton *)self _outlineContentView];
  [v8 insertSubview:v9 atIndex:0];
}

- (void)_createFilledOutlineContentView
{
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  double v4 = [(_CAMExpandingControlButton *)self traitCollection];
  [v4 displayScale];
  id v5 = +[CAMControlStatusIndicator stretchableCircleImageFilled:scale:](CAMControlStatusIndicator, "stretchableCircleImageFilled:scale:", 1);
  double v6 = (UIImageView *)[v3 initWithImage:v5];
  filledOutlineContentView = self->__filledOutlineContentView;
  self->__filledOutlineContentView = v6;

  id v10 = [(_CAMExpandingControlButton *)self _titleContentView];
  double v8 = [v10 contentView];
  id v9 = [(_CAMExpandingControlButton *)self _filledOutlineContentView];
  [v8 insertSubview:v9 atIndex:0];
}

- (void)setOrientation:(int64_t)a3
{
  id v4 = [(_CAMExpandingControlButton *)self _titleContentView];
  [v4 setOrientation:a3];
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(_CAMExpandingControlButton *)self _titleContentView];
  [v6 setOrientation:a3 animated:v4];
}

- (int64_t)orientation
{
  v2 = [(_CAMExpandingControlButton *)self _titleContentView];
  int64_t v3 = [v2 orientation];

  return v3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (int64_t)border
{
  return self->_border;
}

- (CAMSlashContainer)_titleContentView
{
  return self->__titleContentView;
}

- (UIImageView)_outlineContentView
{
  return self->__outlineContentView;
}

- (UIImageView)_filledOutlineContentView
{
  return self->__filledOutlineContentView;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void)_setTitleLabel:(id)a3
{
}

- (UIImageView)_titleImageView
{
  return self->__titleImageView;
}

- (void)_setTitleImageView:(id)a3
{
}

- (CGSize)_intrinsicLabelSize
{
  double width = self->__intrinsicLabelSize.width;
  double height = self->__intrinsicLabelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setIntrinsicLabelSize:(CGSize)a3
{
  self->__intrinsicLabelSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__titleImageView, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__filledOutlineContentView, 0);
  objc_storeStrong((id *)&self->__outlineContentView, 0);
  objc_storeStrong((id *)&self->__titleContentView, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end