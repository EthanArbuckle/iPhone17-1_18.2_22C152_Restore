@interface AVTAvatarAttributeEditorMulticolorPickerCell
+ (double)estimatedTitleSpaceForWidth:(double)a3 isRemovable:(BOOL)a4 isSelected:(BOOL)a5;
+ (double)estimatedWidthForLabelSize:(CGSize)a3 isRemovable:(BOOL)a4 isSelected:(BOOL)a5;
+ (id)cellIdentifier;
+ (id)labelFont;
- (AVTAvatarAttributeEditorMulticolorPickerCell)initWithFrame:(CGRect)a3;
- (AVTAvatarAttributeEditorMulticolorPickerCellDelegate)delegate;
- (AVTAvatarAttributeEditorSectionItem)item;
- (BOOL)isRTL;
- (BOOL)isRemovable;
- (BOOL)isShowingRemoveButton;
- (BOOL)shouldShowColorBorder;
- (CALayer)colorView;
- (UIButton)clearButton;
- (UILabel)label;
- (void)applyAppearanceForSelected:(BOOL)a3;
- (void)applyDefaultAppearanceForStyle:(int64_t)a3;
- (void)applySelectedAppearanceForStyle:(int64_t)a3;
- (void)didTapClearButton:(id)a3;
- (void)layoutForLTR;
- (void)layoutForRTL;
- (void)layoutSubviews;
- (void)setClearButton:(id)a3;
- (void)setColorView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItem:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)showDropShadow;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateColor;
@end

@implementation AVTAvatarAttributeEditorMulticolorPickerCell

+ (id)cellIdentifier
{
  return @"AVTAvatarAttributeEditorMulticolorPickerCell";
}

+ (id)labelFont
{
  return +[AVTUIFontRepository multicolorPickerLabelFont];
}

+ (double)estimatedWidthForLabelSize:(CGSize)a3 isRemovable:(BOOL)a4 isSelected:(BOOL)a5
{
  double v5 = 0.0;
  if (a4 && a5) {
    double v5 = 27.0;
  }
  return a3.width + 35.0 + v5 + 10.0;
}

+ (double)estimatedTitleSpaceForWidth:(double)a3 isRemovable:(BOOL)a4 isSelected:(BOOL)a5
{
  double v5 = 45.0;
  if (a4 && a5) {
    double v5 = 72.0;
  }
  return a3 - v5;
}

- (AVTAvatarAttributeEditorMulticolorPickerCell)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerCell;
  v3 = -[AVTAvatarAttributeEditorMulticolorPickerCell initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(AVTAvatarAttributeEditorMulticolorPickerCell *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v6;

    v8 = [(id)objc_opt_class() labelFont];
    [(UILabel *)v3->_label setFont:v8];

    v9 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)v3 contentView];
    [v9 addSubview:v3->_label];

    uint64_t v10 = [MEMORY[0x263F157E8] layer];
    colorView = v3->_colorView;
    v3->_colorView = (CALayer *)v10;

    [(CALayer *)v3->_colorView setMasksToBounds:1];
    v12 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)v3 contentView];
    v13 = [v12 layer];
    [v13 addSublayer:v3->_colorView];

    v14 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D2C0] scale:1];
    v15 = [MEMORY[0x263F1C6C8] configurationWithWeight:7];
    v16 = [v14 configurationByApplyingConfiguration:v15];
    v17 = [MEMORY[0x263F1C6B0] systemImageNamed:@"xmark" withConfiguration:v16];
    uint64_t v18 = [MEMORY[0x263F1C488] systemButtonWithImage:v17 target:v3 action:sel_didTapClearButton_];
    clearButton = v3->_clearButton;
    v3->_clearButton = (UIButton *)v18;

    v20 = [MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_3];
    [(UIButton *)v3->_clearButton setTintColor:v20];

    v21 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)v3 contentView];
    [v21 addSubview:v3->_clearButton];

    [(UIButton *)v3->_clearButton setHidden:1];
    v22 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)v3 layer];
    [v22 setShadowRadius:15.0];

    double v23 = *MEMORY[0x263F001B0];
    double v24 = *(double *)(MEMORY[0x263F001B0] + 8);
    v25 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)v3 layer];
    objc_msgSend(v25, "setShadowOffset:", v23, v24);

    v26 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)v3 layer];
    [v26 setMasksToBounds:0];

    v27 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
    v28 = [MEMORY[0x263F1C550] quaternarySystemFillColor];
    id v29 = [v28 resolvedColorWithTraitCollection:v27];
    uint64_t v30 = [v29 CGColor];
    v31 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)v3 layer];
    [v31 setShadowColor:v30];

    [(AVTAvatarAttributeEditorMulticolorPickerCell *)v3 bounds];
    CGRect v38 = CGRectInset(v37, -3.0, -3.0);
    objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRect:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
    id v32 = objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [v32 CGPath];
    v34 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)v3 layer];
    [v34 setShadowPath:v33];
  }
  return v3;
}

id __62__AVTAvatarAttributeEditorMulticolorPickerCell_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 1) {
    [MEMORY[0x263F1C550] tertiaryLabelColor];
  }
  else {
  v2 = [MEMORY[0x263F1C550] secondaryLabelColor];
  }
  return v2;
}

- (BOOL)isRTL
{
  v2 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self traitCollection];
  BOOL v3 = [v2 layoutDirection] == 1;

  return v3;
}

- (BOOL)isShowingRemoveButton
{
  int v3 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self isRemovable];
  if (v3)
  {
    LOBYTE(v3) = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self isSelected];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerCell;
  [(AVTAvatarAttributeEditorMulticolorPickerCell *)&v3 layoutSubviews];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  if ([(AVTAvatarAttributeEditorMulticolorPickerCell *)self isRTL]) {
    [(AVTAvatarAttributeEditorMulticolorPickerCell *)self layoutForRTL];
  }
  else {
    [(AVTAvatarAttributeEditorMulticolorPickerCell *)self layoutForLTR];
  }
  [MEMORY[0x263F158F8] commit];
  [(AVTAvatarAttributeEditorMulticolorPickerCell *)self bounds];
  [(AVTAvatarAttributeEditorMulticolorPickerCell *)self _setContinuousCornerRadius:CGRectGetHeight(v4) * 0.5];
}

- (void)showDropShadow
{
  objc_super v3 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self layer];
  LODWORD(v4) = 1.0;
  [v3 setShadowOpacity:v4];

  [(AVTAvatarAttributeEditorMulticolorPickerCell *)self bounds];
  CGRect v10 = CGRectInset(v9, -3.0, -3.0);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRect:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v7 CGPath];
  uint64_t v6 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self layer];
  [v6 setShadowPath:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerCell;
  [(AVTAvatarAttributeEditorMulticolorPickerCell *)&v13 traitCollectionDidChange:v4];
  uint64_t v5 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    v8 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(AVTAvatarAttributeEditorMulticolorPickerCell *)self setBackgroundColor:v8];

    CGRect v9 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self layer];
    [v9 setShadowOpacity:0.0];

    [(AVTAvatarAttributeEditorMulticolorPickerCell *)self applyAppearanceForSelected:[(AVTAvatarAttributeEditorMulticolorPickerCell *)self isSelected]];
  }
  CGRect v10 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self traitCollection];
  uint64_t v11 = [v10 layoutDirection];
  uint64_t v12 = [v4 layoutDirection];

  if (v11 != v12) {
    [(AVTAvatarAttributeEditorMulticolorPickerCell *)self setNeedsLayout];
  }
}

- (void)layoutForRTL
{
  objc_super v3 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self contentView];
  [v3 bounds];
  double v4 = (CGRectGetHeight(v27) + -20.0) * 0.5;

  double v5 = fmax(v4, 0.0);
  uint64_t v6 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self clearButton];
  double v7 = 10.0;
  objc_msgSend(v6, "setFrame:", 10.0, v5, 20.0, 20.0);

  if ([(AVTAvatarAttributeEditorMulticolorPickerCell *)self isShowingRemoveButton])
  {
    v8 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self clearButton];
    [v8 bounds];
    double v10 = v9 + 7.0 + 10.0 + 35.0;
  }
  else
  {
    double v10 = 45.0;
  }
  uint64_t v11 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self contentView];
  [v11 bounds];
  double Width = CGRectGetWidth(v28);

  if ([(AVTAvatarAttributeEditorMulticolorPickerCell *)self isShowingRemoveButton])
  {
    objc_super v13 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self clearButton];
    [v13 frame];
    double v7 = CGRectGetMaxX(v29) + 7.0;
  }
  double v14 = Width - v10;
  v15 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self contentView];
  [v15 bounds];
  double Height = CGRectGetHeight(v30);
  v17 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self label];
  objc_msgSend(v17, "setFrame:", v7, 0.0, v14, Height);

  uint64_t v18 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self contentView];
  [v18 bounds];
  double v19 = (CGRectGetHeight(v31) + -20.0) * 0.5;

  v20 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self contentView];
  [v20 bounds];
  CGFloat v21 = CGRectGetMaxX(v32) + -30.0;

  v22 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self colorView];
  objc_msgSend(v22, "setFrame:", v21, fmax(v19, 0.0), 20.0, 20.0);

  double v23 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self colorView];
  [v23 setCornerRadius:10.0];

  uint64_t v24 = *MEMORY[0x263F15A20];
  id v25 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self colorView];
  [v25 setCornerCurve:v24];
}

- (void)layoutForLTR
{
  objc_super v3 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self contentView];
  [v3 bounds];
  double v4 = (CGRectGetHeight(v25) + -20.0) * 0.5;

  double v5 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self colorView];
  objc_msgSend(v5, "setFrame:", 10.0, fmax(v4, 0.0), 20.0, 20.0);

  uint64_t v6 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self colorView];
  [v6 setCornerRadius:10.0];

  uint64_t v7 = *MEMORY[0x263F15A20];
  v8 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self colorView];
  [v8 setCornerCurve:v7];

  double v9 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self contentView];
  [v9 bounds];
  double v10 = (CGRectGetHeight(v26) + -20.0) * 0.5;

  uint64_t v11 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self contentView];
  [v11 bounds];
  CGFloat v12 = CGRectGetMaxX(v27) + -30.0;
  objc_super v13 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self clearButton];
  objc_msgSend(v13, "setFrame:", v12, fmax(v10, 0.0), 20.0, 20.0);

  if ([(AVTAvatarAttributeEditorMulticolorPickerCell *)self isShowingRemoveButton])
  {
    double v14 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self clearButton];
    [v14 bounds];
    double v16 = v15 + 7.0 + 10.0 + 35.0;
  }
  else
  {
    double v16 = 45.0;
  }
  v17 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self contentView];
  [v17 bounds];
  CGFloat v18 = CGRectGetWidth(v28) - v16;

  id v23 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self colorView];
  [v23 frame];
  CGFloat v19 = CGRectGetMaxX(v29) + 5.0;
  v20 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self contentView];
  [v20 bounds];
  double Height = CGRectGetHeight(v30);
  v22 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self label];
  objc_msgSend(v22, "setFrame:", v19, 0.0, v18, Height);
}

- (void)didTapClearButton:(id)a3
{
  id v4 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self delegate];
  [v4 multicolorPickerCellDidTapClearButton:self];
}

- (void)applyAppearanceForSelected:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];

  if (v5)
  {
    uint64_t v6 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v8 = (void *)MEMORY[0x263EFF940];
      double v9 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
      [v8 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v9 format];
    }
    double v10 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
    id v16 = v10;
    if (v3)
    {
      uint64_t v11 = [v10 isRemovable] ^ 1;
      CGFloat v12 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self clearButton];
      [v12 setHidden:v11];

      objc_super v13 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self traitCollection];
      -[AVTAvatarAttributeEditorMulticolorPickerCell applySelectedAppearanceForStyle:](self, "applySelectedAppearanceForStyle:", [v13 userInterfaceStyle]);
    }
    else
    {
      double v15 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self clearButton];
      [v15 setHidden:1];

      objc_super v13 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self traitCollection];
      -[AVTAvatarAttributeEditorMulticolorPickerCell applyDefaultAppearanceForStyle:](self, "applyDefaultAppearanceForStyle:", [v13 userInterfaceStyle]);
    }

    [(AVTAvatarAttributeEditorMulticolorPickerCell *)self updateColorViewBorder];
  }
  else
  {
    double v14 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self clearButton];
    [v14 setHidden:1];

    id v16 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self layer];
    [v16 setShadowOpacity:0.0];
  }
}

- (void)applySelectedAppearanceForStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    id v4 = [MEMORY[0x263F1C550] systemFillColor];
    [(AVTAvatarAttributeEditorMulticolorPickerCell *)self setBackgroundColor:v4];
  }
  else
  {
    [(AVTAvatarAttributeEditorMulticolorPickerCell *)self showDropShadow];
  }
  id v6 = [MEMORY[0x263F1C550] labelColor];
  double v5 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self label];
  [v5 setTextColor:v6];
}

- (void)applyDefaultAppearanceForStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    id v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(AVTAvatarAttributeEditorMulticolorPickerCell *)self setBackgroundColor:v4];
  }
  else
  {
    id v4 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self layer];
    [v4 setShadowOpacity:0.0];
  }

  id v6 = [MEMORY[0x263F1C550] secondaryLabelColor];
  double v5 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self label];
  [v5 setTextColor:v6];
}

- (void)setItem:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v5 format];
  }
  v8 = (AVTAvatarAttributeEditorSectionItem *)v5;
  if (self->_item != v8)
  {
    objc_storeStrong((id *)&self->_item, a3);
    id v6 = [(AVTAvatarAttributeEditorSectionItem *)v8 localizedName];
    uint64_t v7 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self label];
    [v7 setText:v6];

    [(AVTAvatarAttributeEditorMulticolorPickerCell *)self updateColor];
    [(AVTAvatarAttributeEditorMulticolorPickerCell *)self applyAppearanceForSelected:[(AVTAvatarAttributeEditorMulticolorPickerCell *)self isSelected]];
  }
}

- (void)updateColor
{
  BOOL v3 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];

  if (v3)
  {
    id v4 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v6 = (void *)MEMORY[0x263EFF940];
      uint64_t v7 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
      [v6 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v7 format];
    }
    id v17 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
    v8 = [v17 variationStore];
    double v9 = [v17 colorItem];
    double v10 = [v9 color];
    uint64_t v11 = [v8 colorPresetFromColor:v10];

    CGFloat v12 = [v17 colorItem];
    objc_super v13 = [v12 layerContentProvider];
    double v14 = [v17 colorItem];
    double v15 = [v14 skinColor];
    id v16 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self colorView];
    ((void (**)(void, void *, void *, void *))v13)[2](v13, v11, v15, v16);
  }
}

- (BOOL)shouldShowColorBorder
{
  uint64_t v3 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
  if (v3)
  {
    id v4 = (void *)v3;
    int v5 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self isSelected];

    if (v5)
    {
      id v6 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v8 = (void *)MEMORY[0x263EFF940];
        double v9 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
        [v8 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v9 format];
      }
      double v10 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
      uint64_t v11 = [v10 colorItem];
      CGFloat v12 = [v11 identifier];
      if ([v12 isEqualToString:@"Gray"])
      {
LABEL_6:
        char v13 = 1;
LABEL_11:

LABEL_12:
        return v13;
      }
      double v14 = [v11 identifier];
      if ([v14 isEqualToString:@"White"]) {
        goto LABEL_9;
      }
      id v16 = [v11 identifier];
      char v17 = [v16 isEqualToString:@"Clear"];

      if (v17)
      {
        char v13 = 1;
        goto LABEL_12;
      }
      CGFloat v18 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self traitCollection];
      uint64_t v19 = [v18 userInterfaceStyle];

      if (v19 != 2)
      {
        char v13 = 0;
        goto LABEL_12;
      }
      CGFloat v12 = [v11 identifier];
      if ([v12 isEqualToString:@"Black"]) {
        goto LABEL_6;
      }
      double v14 = [v11 identifier];
      if ([v14 isEqualToString:@"Soft Black"])
      {
LABEL_9:
        char v13 = 1;
      }
      else
      {
        v20 = [v11 identifier];
        char v13 = [v20 isEqualToString:@"Dark"];
      }
      goto LABEL_11;
    }
  }
  return 0;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerCell;
  -[AVTAvatarAttributeEditorMulticolorPickerCell setSelected:](&v5, sel_setSelected_);
  [(AVTAvatarAttributeEditorMulticolorPickerCell *)self applyAppearanceForSelected:v3];
}

- (BOOL)isRemovable
{
  BOOL v3 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];

  if (!v3) {
    return 0;
  }
  id v4 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
    [v6 raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v7 format];
  }
  v8 = [(AVTAvatarAttributeEditorMulticolorPickerCell *)self item];
  char v9 = [v8 isRemovable];

  return v9;
}

- (AVTAvatarAttributeEditorSectionItem)item
{
  return self->_item;
}

- (AVTAvatarAttributeEditorMulticolorPickerCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarAttributeEditorMulticolorPickerCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (CALayer)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void)setClearButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
}

@end