@interface EKCalendarChooserCell
- (BOOL)checked;
- (BOOL)multiSelectStyle;
- (BOOL)shouldAnimate;
- (BOOL)showCheckmarksOnLeft;
- (BOOL)showingSelectionCheckmark;
- (BOOL)showsColorDot;
- (EKCalendarChooserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)selectionCheckmarkCheckedSystemImageName;
- (NSString)selectionCheckmarkUncheckedSystemImageName;
- (NSString)textLabelText;
- (UIColor)selectionCheckmarkColor;
- (double)textLeadingIndent;
- (void)_updateTextLabelTextWithColorDot;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryType:(int64_t)a3;
- (void)setChecked:(BOOL)a3;
- (void)setColorDotHighlightedImage:(id)a3;
- (void)setColorDotImage:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setMultiSelectStyle:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelectionCheckmarkCheckedSystemImageName:(id)a3;
- (void)setSelectionCheckmarkColor:(id)a3;
- (void)setSelectionCheckmarkUncheckedSystemImageName:(id)a3;
- (void)setShouldAnimate:(BOOL)a3;
- (void)setShowCheckmarksOnLeft:(BOOL)a3;
- (void)setShowingSelectionCheckmark:(BOOL)a3;
- (void)setShowsColorDot:(BOOL)a3;
- (void)setTextLabelText:(id)a3;
- (void)updateSelectionCheckmark;
@end

@implementation EKCalendarChooserCell

- (EKCalendarChooserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKCalendarChooserCell;
  v4 = [(EKUITableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(EKCalendarChooserCell *)v4 setShowCheckmarksOnLeft:1];
  }
  return v5;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)EKCalendarChooserCell;
  [(EKCalendarChooserCell *)&v5 prepareForReuse];
  self->_shouldAnimate = 0;
  self->_showsColorDot = 0;
  selectionCheckmarkCheckedSystemImageName = self->_selectionCheckmarkCheckedSystemImageName;
  self->_selectionCheckmarkCheckedSystemImageName = 0;

  selectionCheckmarkUncheckedSystemImageName = self->_selectionCheckmarkUncheckedSystemImageName;
  self->_selectionCheckmarkUncheckedSystemImageName = 0;
}

- (NSString)selectionCheckmarkCheckedSystemImageName
{
  if (self->_selectionCheckmarkCheckedSystemImageName) {
    return self->_selectionCheckmarkCheckedSystemImageName;
  }
  else {
    return (NSString *)@"checkmark.circle.fill";
  }
}

- (NSString)selectionCheckmarkUncheckedSystemImageName
{
  if (self->_selectionCheckmarkUncheckedSystemImageName) {
    return self->_selectionCheckmarkUncheckedSystemImageName;
  }
  else {
    return (NSString *)@"circle";
  }
}

- (void)setAccessoryType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKCalendarChooserCell;
  -[EKCalendarChooserCell setAccessoryType:](&v5, sel_setAccessoryType_);
  [(EKCalendarChooserCell *)self setEditingAccessoryType:a3];
}

- (void)setShowCheckmarksOnLeft:(BOOL)a3
{
  self->_showCheckmarksOnLeft = a3;
  checkmarkView = self->_checkmarkView;
  if (a3)
  {
    if (checkmarkView) {
      goto LABEL_7;
    }
    objc_super v5 = [(EKCalendarChooserCell *)self traitCollection];
    v6 = TableViewCheckmarkImage(v5);

    objc_super v7 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
    v8 = self->_checkmarkView;
    self->_checkmarkView = v7;

    v9 = [(EKCalendarChooserCell *)self contentView];
    [v9 addSubview:self->_checkmarkView];

    [(UIImageView *)self->_checkmarkView setAlpha:0.0];
  }
  else
  {
    if (!checkmarkView) {
      goto LABEL_7;
    }
    [(UIImageView *)checkmarkView removeFromSuperview];
    v6 = self->_checkmarkView;
    self->_checkmarkView = 0;
  }

LABEL_7:

  [(EKCalendarChooserCell *)self setNeedsLayout];
}

- (void)_updateTextLabelTextWithColorDot
{
  id v23 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  colorDot = self->_colorDot;
  if (colorDot)
  {
    colorDotAttachment = self->_colorDotAttachment;
    if (!colorDotAttachment)
    {
      objc_super v5 = (NSTextAttachment *)objc_alloc_init(MEMORY[0x1E4FB0870]);
      v6 = self->_colorDotAttachment;
      self->_colorDotAttachment = v5;

      colorDot = self->_colorDot;
      colorDotAttachment = self->_colorDotAttachment;
    }
    [(NSTextAttachment *)colorDotAttachment setImage:colorDot];
    if (![(UIImage *)self->_colorDot isSymbolImage])
    {
      objc_super v7 = [(EKCalendarChooserCell *)self textLabel];
      v8 = [v7 font];
      [v8 capHeight];
      double v10 = v9;

      [(UIImage *)self->_colorDot size];
      CalRoundToScreenScale((v10 - v11) * 0.5);
      double v13 = v12;
      [(UIImage *)self->_colorDot size];
      double v15 = v14;
      [(UIImage *)self->_colorDot size];
      -[NSTextAttachment setBounds:](self->_colorDotAttachment, "setBounds:", 0.0, v13, v15, v16);
    }
    v17 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:self->_colorDotAttachment];
    [v23 appendAttributedString:v17];

    v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v23 appendAttributedString:v18];
  }
  id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (self->_textLabelText) {
    textLabelText = (__CFString *)self->_textLabelText;
  }
  else {
    textLabelText = &stru_1F0CC2140;
  }
  v21 = (void *)[v19 initWithString:textLabelText];
  [v23 appendAttributedString:v21];

  v22 = [(EKCalendarChooserCell *)self textLabel];
  [v22 setAttributedText:v23];
}

- (void)setTextLabelText:(id)a3
{
  p_textLabelText = &self->_textLabelText;
  double v9 = (NSString *)a3;
  if (*p_textLabelText != v9) {
    objc_storeStrong((id *)&self->_textLabelText, a3);
  }
  if (self->_colorDot)
  {
    v6 = [(EKCalendarChooserCell *)self traitCollection];
    if (EKUIUsesLargeTextLayout(v6))
    {

LABEL_7:
      [(EKCalendarChooserCell *)self _updateTextLabelTextWithColorDot];
      goto LABEL_9;
    }
    BOOL v7 = [(EKCalendarChooserCell *)self multiSelectStyle];

    if (v7) {
      goto LABEL_7;
    }
  }
  v8 = [(EKCalendarChooserCell *)self textLabel];
  [v8 setText:*p_textLabelText];

LABEL_9:
}

- (void)setColorDotImage:(id)a3
{
  p_colorDot = &self->_colorDot;
  v26 = (UIImage *)a3;
  if (*p_colorDot != v26) {
    objc_storeStrong((id *)&self->_colorDot, a3);
  }
  v6 = [(EKCalendarChooserCell *)self traitCollection];
  if (EKUIUsesLargeTextLayout(v6))
  {

LABEL_6:
    [(UIImageView *)self->_colorDotView removeFromSuperview];
    colorDotView = self->_colorDotView;
    self->_colorDotView = 0;

    [(EKCalendarChooserCell *)self _updateTextLabelTextWithColorDot];
    goto LABEL_7;
  }
  BOOL v7 = [(EKCalendarChooserCell *)self multiSelectStyle];

  if (v7) {
    goto LABEL_6;
  }
  double v9 = self->_colorDotView;
  if (v9)
  {
    [(UIImageView *)v9 setImage:*p_colorDot];
    [(UIImageView *)self->_colorDotView frame];
    double v11 = v10;
    double v13 = v12;
    [(UIImage *)*p_colorDot size];
    -[UIImageView setFrame:](self->_colorDotView, "setFrame:", v11, v13, v14, v15);
  }
  else
  {
    double v16 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v26];
    v17 = self->_colorDotView;
    self->_colorDotView = v16;

    [(UIImageView *)self->_colorDotView frame];
    double v19 = v18;
    double v21 = v20;
    [(UIImage *)*p_colorDot size];
    -[UIImageView setFrame:](self->_colorDotView, "setFrame:", v19, v21, v22, v23);
    v24 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIImageView *)self->_colorDotView setTintColor:v24];

    v25 = [(EKCalendarChooserCell *)self contentView];
    [v25 addSubview:self->_colorDotView];
  }
LABEL_7:
  [(EKCalendarChooserCell *)self setNeedsLayout];
}

- (void)setColorDotHighlightedImage:(id)a3
{
  objc_super v5 = (UIImage *)a3;
  if (self->_colorDotHighlighted != v5) {
    objc_storeStrong((id *)&self->_colorDotHighlighted, a3);
  }
  [(EKCalendarChooserCell *)self setNeedsLayout];
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  self->_checked = a3;
  if ([(EKCalendarChooserCell *)self showCheckmarksOnLeft])
  {
    double v5 = 0.0;
    if (v3) {
      double v5 = 1.0;
    }
    checkmarkView = self->_checkmarkView;
    [(UIImageView *)checkmarkView setAlpha:v5];
  }
  else
  {
    if ([(EKCalendarChooserCell *)self accessoryType] != 3 || v3)
    {
      if ([(EKCalendarChooserCell *)self accessoryType] || !v3) {
        return;
      }
      BOOL v7 = self;
      uint64_t v8 = 3;
    }
    else
    {
      BOOL v7 = self;
      uint64_t v8 = 0;
    }
    [(EKCalendarChooserCell *)v7 setAccessoryType:v8];
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  LODWORD(v5) = a3;
  if ([(EKCalendarChooserCell *)self selectionStyle]) {
    uint64_t v5 = v5;
  }
  else {
    uint64_t v5 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)EKCalendarChooserCell;
  [(EKCalendarChooserCell *)&v8 setHighlighted:v5 animated:v4];
  if (!v5 || (colorDot = self->_colorDotHighlighted) == 0) {
    colorDot = self->_colorDot;
  }
  [(UIImageView *)self->_colorDotView setImage:colorDot];
  if ([(EKCalendarChooserCell *)self multiSelectStyle]) {
    [(EKCalendarChooserCell *)self updateSelectionCheckmark];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(EKCalendarChooserCell *)self selectionStyle]) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)EKCalendarChooserCell;
  [(EKCalendarChooserCell *)&v8 setSelected:v7 animated:v4];
  if ([(EKCalendarChooserCell *)self multiSelectStyle]) {
    [(EKCalendarChooserCell *)self updateSelectionCheckmark];
  }
}

- (void)updateSelectionCheckmark
{
  int v3 = [(EKCalendarChooserCell *)self isSelected];
  int v4 = v3 ^ [(EKCalendarChooserCell *)self isHighlighted];
  BOOL v5 = [(EKCalendarChooserCell *)self imageView];
  v6 = [v5 image];
  BOOL v7 = v6;
  if (v6 && self->_showingSelectionCheckmark == v4)
  {
    checkMarkColor = self->_checkMarkColor;
    double v9 = [(EKCalendarChooserCell *)self selectionCheckmarkColor];

    if (checkMarkColor == v9) {
      return;
    }
  }
  else
  {
  }
  double v10 = [(EKCalendarChooserCell *)self traitCollection];
  int64_t v11 = +[EKUIConstrainedFontUtilities tableViewCellCappedSymbolImageScaleWithScale:0 traitCollection:v10];

  double v12 = (void *)MEMORY[0x1E4FB1830];
  double v13 = [(EKCalendarChooserCell *)self textLabel];
  double v14 = [v13 font];
  double v15 = [v12 configurationWithFont:v14 scale:v11];

  if (v4) {
    [(EKCalendarChooserCell *)self selectionCheckmarkCheckedSystemImageName];
  }
  else {
  double v16 = [(EKCalendarChooserCell *)self selectionCheckmarkUncheckedSystemImageName];
  }
  id v24 = [MEMORY[0x1E4FB1818] systemImageNamed:v16 withConfiguration:v15];
  v17 = [(EKCalendarChooserCell *)self imageView];
  [v17 setImage:v24];

  double v18 = [(EKCalendarChooserCell *)self selectionCheckmarkColor];
  double v19 = [(EKCalendarChooserCell *)self traitCollection];
  [v19 userInterfaceStyle];
  double v20 = CUIKAdjustedColorForColor();
  double v21 = [(EKCalendarChooserCell *)self imageView];
  [v21 setTintColor:v20];

  double v22 = [(EKCalendarChooserCell *)self selectionCheckmarkColor];
  double v23 = self->_checkMarkColor;
  self->_checkMarkColor = v22;

  self->_showingSelectionCheckmark = v4;
}

- (double)textLeadingIndent
{
  int v3 = [(EKCalendarChooserCell *)self traitCollection];
  BOOL v4 = EKUIUsesLargeTextLayout(v3);

  double v5 = 0.0;
  if (![(EKCalendarChooserCell *)self multiSelectStyle])
  {
    if ([(EKCalendarChooserCell *)self showCheckmarksOnLeft])
    {
      [(UIImageView *)self->_checkmarkView frame];
      double v5 = v6 + 11.0 + 10.0;
    }
    else
    {
      double v5 = 16.0;
      if (v4)
      {
        int IsLeftToRight = CalInterfaceIsLeftToRight();
        [(EKCalendarChooserCell *)self layoutMargins];
        if (IsLeftToRight) {
          double v5 = v8;
        }
        else {
          double v5 = v9;
        }
        [(EKCalendarChooserCell *)self showsColorDot];
        goto LABEL_11;
      }
    }
  }
  if ([(EKCalendarChooserCell *)self showsColorDot]
    && !v4
    && ![(EKCalendarChooserCell *)self multiSelectStyle])
  {
    [(UIImage *)self->_colorDot size];
    double v5 = v5 + v18 + 10.0;
    goto LABEL_17;
  }
LABEL_11:
  double v10 = [(EKCalendarChooserCell *)self imageView];
  int64_t v11 = [v10 image];

  if (v11)
  {
    if (CalInterfaceIsLeftToRight())
    {
      double v12 = [(EKCalendarChooserCell *)self imageView];
      [v12 frame];
      double v14 = v13;
    }
    else
    {
      [(EKCalendarChooserCell *)self bounds];
      double v16 = v15;
      double v12 = [(EKCalendarChooserCell *)self imageView];
      [v12 frame];
      double v14 = v16 - CGRectGetMaxX(v21);
    }

    v17 = [(EKCalendarChooserCell *)self imageView];
    [v17 bounds];
    double v5 = v14 + CGRectGetWidth(v22) + 10.0;
  }
LABEL_17:

  CalRoundToScreenScale(v5);
  return result;
}

- (void)layoutSubviews
{
  if (![(EKCalendarChooserCell *)self multiSelectStyle]
    && ([(EKCalendarChooserCell *)self showCheckmarksOnLeft]
     || [(EKCalendarChooserCell *)self showsColorDot]))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__EKCalendarChooserCell_layoutSubviews__block_invoke;
    aBlock[3] = &unk_1E6087570;
    aBlock[4] = self;
    int v3 = _Block_copy(aBlock);
    BOOL v4 = v3;
    if (self->_shouldAnimate) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v3 options:0 animations:0.300000012 completion:0.0];
    }
    else {
      (*((void (**)(void *))v3 + 2))(v3);
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)EKCalendarChooserCell;
    [(EKUITableViewCell *)&v5 layoutSubviews];
  }
}

uint64_t __39__EKCalendarChooserCell_layoutSubviews__block_invoke(uint64_t a1)
{
  v40.receiver = *(id *)(a1 + 32);
  v40.super_class = (Class)EKCalendarChooserCell;
  objc_msgSendSuper2(&v40, sel_layoutSubviews);
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  int v3 = [*(id *)(a1 + 32) textLabel];
  [v3 frame];
  double v5 = v4;
  double v6 = [*(id *)(a1 + 32) textLabel];
  [v6 _capOffsetFromBoundsTop];
  double v8 = v5 + v7;
  double v9 = [*(id *)(a1 + 32) textLabel];
  double v10 = [v9 font];
  [v10 capHeight];
  CalRoundToScreenScale(v8 + v11 * 0.5);
  double v13 = v12;

  [*(id *)(*(void *)(a1 + 32) + 1112) sizeToFit];
  [*(id *)(*(void *)(a1 + 32) + 1112) bounds];
  CGFloat Height = CGRectGetHeight(v41);
  CalRoundToScreenScale(v13 - Height * 0.5);
  double v16 = v15;
  double v17 = 11.0;
  if ((IsLeftToRight & 1) == 0)
  {
    double v18 = [*(id *)(a1 + 32) contentView];
    [v18 bounds];
    double v20 = v19;
    [*(id *)(*(void *)(a1 + 32) + 1112) frame];
    double v17 = v20 - v21 + -11.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1112) frame];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1112), "setFrame:", v17, v16);
  if ([*(id *)(a1 + 32) showCheckmarksOnLeft])
  {
    [*(id *)(*(void *)(a1 + 32) + 1112) frame];
    if (IsLeftToRight)
    {
      double v26 = CGRectGetMaxX(*(CGRect *)&v22) + 10.0;
LABEL_7:
      [*(id *)(a1 + 32) safeAreaInsets];
      double v28 = v26 + v27;
      goto LABEL_11;
    }
    double v26 = CGRectGetMinX(*(CGRect *)&v22) + -10.0;
  }
  else
  {
    double v26 = 16.0;
    if (IsLeftToRight) {
      goto LABEL_7;
    }
    v29 = [*(id *)(a1 + 32) contentView];
    [v29 bounds];
    double v26 = v30 + -16.0;
  }
  v31 = [*(id *)(a1 + 32) contentView];
  [v31 bounds];
  double v33 = v32 - v26;
  [*(id *)(a1 + 32) safeAreaInsets];
  double v28 = v33 + v34;

LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "setSeparatorInset:", 0.0, v28, 0.0, 0.0);
  uint64_t result = [*(id *)(a1 + 32) showsColorDot];
  if (result)
  {
    if (!IsLeftToRight)
    {
      [*(id *)(*(void *)(a1 + 32) + 1104) frame];
      double v26 = v26 - v36;
    }
    [*(id *)(*(void *)(a1 + 32) + 1104) bounds];
    CGFloat v37 = CGRectGetHeight(v42);
    CalRoundToScreenScale(v13 + v37 * -0.5);
    double v39 = v38;
    [*(id *)(*(void *)(a1 + 32) + 1104) frame];
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1104), "setFrame:", v26, v39);
  }
  return result;
}

- (BOOL)showingSelectionCheckmark
{
  return self->_showingSelectionCheckmark;
}

- (void)setShowingSelectionCheckmark:(BOOL)a3
{
  self->_showingSelectionCheckmark = a3;
}

- (BOOL)multiSelectStyle
{
  return self->_multiSelectStyle;
}

- (void)setMultiSelectStyle:(BOOL)a3
{
  self->_multiSelectStyle = a3;
}

- (BOOL)showCheckmarksOnLeft
{
  return self->_showCheckmarksOnLeft;
}

- (BOOL)checked
{
  return self->_checked;
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

- (BOOL)showsColorDot
{
  return self->_showsColorDot;
}

- (void)setShowsColorDot:(BOOL)a3
{
  self->_showsColorDot = a3;
}

- (NSString)textLabelText
{
  return self->_textLabelText;
}

- (UIColor)selectionCheckmarkColor
{
  return self->_selectionCheckmarkColor;
}

- (void)setSelectionCheckmarkColor:(id)a3
{
}

- (void)setSelectionCheckmarkCheckedSystemImageName:(id)a3
{
}

- (void)setSelectionCheckmarkUncheckedSystemImageName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionCheckmarkUncheckedSystemImageName, 0);
  objc_storeStrong((id *)&self->_selectionCheckmarkCheckedSystemImageName, 0);
  objc_storeStrong((id *)&self->_selectionCheckmarkColor, 0);
  objc_storeStrong((id *)&self->_textLabelText, 0);
  objc_storeStrong((id *)&self->_colorDotAttachment, 0);
  objc_storeStrong((id *)&self->_checkMarkColor, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_colorDotView, 0);
  objc_storeStrong((id *)&self->_colorDotHighlighted, 0);

  objc_storeStrong((id *)&self->_colorDot, 0);
}

@end