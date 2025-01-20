@interface PreferencesTwoPartValueCell
- (BOOL)strikeThroughLargeDetailTextLabel;
- (BOOL)strikeThroughLargePart2TextLabel;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKCellShortener)shortener;
- (TwoPartTextLabel)twoPartTextLabel;
- (UIColor)valueColor;
- (UILabel)largePart2TextLabel;
- (id)description;
- (void)_layoutSubviewsCore;
- (void)checkValueWidths;
- (void)layoutSubviews;
- (void)layoutText:(id)a3 andValue:(id)a4;
- (void)setShortener:(id)a3;
- (void)setStrikeThroughLargeDetailTextLabel:(BOOL)a3;
- (void)setStrikeThroughLargePart2TextLabel:(BOOL)a3;
- (void)shorten;
@end

@implementation PreferencesTwoPartValueCell

- (TwoPartTextLabel)twoPartTextLabel
{
  twoPartLabel = self->_twoPartLabel;
  if (!twoPartLabel)
  {
    v4 = objc_alloc_init(TwoPartTextLabel);
    v5 = self->_twoPartLabel;
    self->_twoPartLabel = v4;

    v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(TwoPartTextLabel *)self->_twoPartLabel setFont:v6];

    v7 = [(PreferencesTwoPartValueCell *)self valueColor];
    [(TwoPartTextLabel *)self->_twoPartLabel setTextColor:v7];

    v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(TwoPartTextLabel *)self->_twoPartLabel setBackgroundColor:v8];

    v9 = [(PreferencesTwoPartValueCell *)self contentView];
    [v9 addSubview:self->_twoPartLabel];

    twoPartLabel = self->_twoPartLabel;
  }

  return twoPartLabel;
}

- (UILabel)largePart2TextLabel
{
  largePart2TextLabel = self->_largePart2TextLabel;
  if (!largePart2TextLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    v5 = self->_largePart2TextLabel;
    self->_largePart2TextLabel = v4;

    v6 = [MEMORY[0x1E4FB1618] tableCellBlueTextColor];
    [(UILabel *)self->_largePart2TextLabel setTextColor:v6];

    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)self->_largePart2TextLabel setBackgroundColor:v7];

    v8 = [(PreferencesTwoPartValueCell *)self contentView];
    [v8 addSubview:self->_largePart2TextLabel];

    largePart2TextLabel = self->_largePart2TextLabel;
  }

  return largePart2TextLabel;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PreferencesTwoPartValueCell;
  v4 = [(PreferencesTwoPartValueCell *)&v9 description];
  v5 = [(PreferencesTwoPartValueCell *)self twoPartTextLabel];
  v6 = [v5 description];
  v7 = [v3 stringWithFormat:@"%@\t%@", v4, v6];

  return v7;
}

- (UIColor)valueColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] tableCellBlueTextColor];
}

- (void)layoutText:(id)a3 andValue:(id)a4
{
  id v93 = a3;
  id v6 = a4;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  [(PreferencesTwoPartValueCell *)self directionalLayoutMargins];
  CGFloat v9 = v8;
  v10 = [(PreferencesTwoPartValueCell *)self contentView];
  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v95.origin.double x = v12;
  v95.origin.double y = v14;
  v95.size.double width = v16;
  v95.size.double height = v18;
  CGRect v96 = CGRectInset(v95, v9, 0.0);
  double x = v96.origin.x;
  double width = v96.size.width;
  double height = v96.size.height;
  uint64_t v21 = [(PreferencesTwoPartValueCell *)self indentationLevel];
  double v22 = v9 * (double)v21;
  if (IsLeftToRight) {
    double v23 = v9 * (double)v21;
  }
  else {
    double v23 = -0.0;
  }
  double v24 = width - v22;
  v25 = (double *)MEMORY[0x1E4F1DB30];
  objc_msgSend(v93, "sizeThatFits:", width - v22, height);
  double v27 = v26;
  v28 = [v93 text];
  v29 = v28;
  if (v28 && [v28 length])
  {
    v30 = [v93 superview];

    if (!v30)
    {
      v31 = [(PreferencesTwoPartValueCell *)self contentView];
      [v31 addSubview:v93];
    }
  }
  else
  {
    [v93 removeFromSuperview];
  }
  double v32 = *v25;
  double v33 = *v25;
  if (v6)
  {
    objc_msgSend(v6, "sizeThatFits:", v24, height);
    double v33 = v34;
    v35 = [v6 text];
    v36 = v35;
    if (v35 && [v35 length])
    {
      v37 = [v6 superview];

      if (!v37)
      {
        v38 = [(PreferencesTwoPartValueCell *)self contentView];
        [v38 addSubview:v6];
      }
    }
    else
    {
      [v6 removeFromSuperview];
    }
  }
  uint64_t v39 = [v93 numberOfLines];
  double v40 = ceil(v24 * (v27 / (v27 + v33 + 6.0)));
  [v93 setNumberOfLines:1];
  objc_msgSend(v93, "sizeThatFits:", v40, height);
  double v42 = v41;
  [v93 setNumberOfLines:0];
  objc_msgSend(v93, "sizeThatFits:", v40, height);
  double v45 = v42 * (double)v39;
  if (v39 <= 0) {
    double v45 = 3.40282347e38;
  }
  if (v44 < v45) {
    double v45 = v44;
  }
  CGFloat v90 = v45;
  if (v44 > v45 || v45 > height) {
    double v47 = v40;
  }
  else {
    double v47 = v43;
  }
  [v93 setNumberOfLines:v39];
  uint64_t v48 = [v6 numberOfLines];
  double rect = v24;
  double v49 = v24 - v47;
  double v50 = v24 - v47 + -6.0;
  [v6 setNumberOfLines:1];
  if (v6)
  {
    objc_msgSend(v6, "sizeThatFits:", v50, height);
    double v52 = v51;
    [v6 setNumberOfLines:0];
    objc_msgSend(v6, "sizeThatFits:", v50, height);
    double v32 = v54;
  }
  else
  {
    double v52 = v25[1];
    [0 setNumberOfLines:0];
    double v53 = v52;
  }
  double v55 = v52 * (double)v48;
  if (v48 <= 0) {
    double v55 = 3.40282347e38;
  }
  if (v53 < v55) {
    double v55 = v53;
  }
  CGFloat v87 = v55;
  double v89 = x + v23;
  if (v53 <= v55 && v55 <= height) {
    double v50 = v32;
  }
  [v6 setNumberOfLines:v48];
  v57 = [v93 font];
  [v57 ascender];
  double v59 = v58;
  v60 = [v6 font];
  [v60 ascender];
  double v62 = v61;

  if (v59 >= v62)
  {
    v63 = [v93 font];
    [v63 ascender];
    double v72 = v71;
    v66 = [v6 font];
    [v66 ascender];
    CalRoundToScreenScale(v72 - v73);
    CGFloat v70 = v74;
    CGFloat v69 = 0.0;
  }
  else
  {
    v63 = [v6 font];
    [v63 ascender];
    double v65 = v64;
    v66 = [v93 font];
    [v66 ascender];
    CalRoundToScreenScale(v65 - v67);
    CGFloat v69 = v68;
    CGFloat v70 = 0.0;
  }

  if (IsLeftToRight) {
    double v75 = 0.0;
  }
  else {
    double v75 = v49;
  }
  if (IsLeftToRight) {
    double v76 = rect - v50;
  }
  else {
    double v76 = 0.0;
  }
  v97.origin.double x = v75;
  v97.origin.double y = v69;
  v97.size.double width = v47;
  v97.size.double height = v90;
  v102.origin.double x = v76;
  v102.origin.double y = v70;
  v102.size.double width = v50;
  v102.size.double height = v87;
  CGRect v98 = CGRectUnion(v97, v102);
  double v77 = CalCeilToScreenScale((height - v98.size.height) * 0.5);
  v99.origin.double x = v75;
  v99.origin.double y = v69;
  v99.size.double width = v47;
  v99.size.double height = v90;
  CGRect v100 = CGRectOffset(v99, v89, v77);
  double v78 = v100.origin.x;
  double y = v100.origin.y;
  double v80 = v100.size.width;
  double v91 = v100.size.height;
  v100.origin.double x = v76;
  v100.origin.double y = v70;
  v100.size.double width = v50;
  v100.size.double height = v87;
  CGRect v101 = CGRectOffset(v100, v89, v77);
  double v81 = v101.origin.x;
  double v82 = v101.origin.y;
  double v83 = v101.size.width;
  double v84 = v101.size.height;
  v85 = [v93 superview];

  if (v85) {
    objc_msgSend(v93, "setFrame:", v78, y, v80, v91);
  }
  v86 = [v6 superview];

  if (v86) {
    objc_msgSend(v6, "setFrame:", v81, v82, v83, v84);
  }
}

- (void)_layoutSubviewsCore
{
  v4.receiver = self;
  v4.super_class = (Class)PreferencesTwoPartValueCell;
  [(EKUITableViewCell *)&v4 layoutSubviews];
  v3 = [(PreferencesTwoPartValueCell *)self textLabel];
  [(PreferencesTwoPartValueCell *)self layoutText:v3 andValue:self->_twoPartLabel];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(PreferencesTwoPartValueCell *)self traitCollection];
  if (EKUIUsesLargeTextLayout(v6))
  {
  }
  else
  {
    largePart2TextLabel = self->_largePart2TextLabel;

    if (!largePart2TextLabel)
    {
      v23.receiver = self;
      v23.super_class = (Class)PreferencesTwoPartValueCell;
      -[PreferencesTwoPartValueCell sizeThatFits:](&v23, sel_sizeThatFits_, width, height);
      double v9 = v18;
      double v17 = v19;
      goto LABEL_6;
    }
  }
  [(PreferencesTwoPartValueCell *)self setNeedsLayout];
  [(PreferencesTwoPartValueCell *)self layoutIfNeeded];
  v22.receiver = self;
  v22.super_class = (Class)PreferencesTwoPartValueCell;
  -[PreferencesTwoPartValueCell sizeThatFits:](&v22, sel_sizeThatFits_, width, height);
  double v9 = v8;
  double v11 = v10;
  [(UILabel *)self->_largePart2TextLabel frame];
  double v13 = v12;
  CGFloat v14 = [(UILabel *)self->_largePart2TextLabel font];
  [v14 _bodyLeading];
  CalRoundToScreenScale((v13 + v15) * 0.5);
  double v17 = v11 + v16;

LABEL_6:
  double v20 = v9;
  double v21 = v17;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)setStrikeThroughLargeDetailTextLabel:(BOOL)a3
{
  if (self->_strikeThroughLargeDetailTextLabel != a3) {
    self->_strikeThroughLargeDetailTextLabel = a3;
  }
  [(PreferencesTwoPartValueCell *)self setNeedsLayout];
}

- (void)setStrikeThroughLargePart2TextLabel:(BOOL)a3
{
  if (self->_strikeThroughLargePart2TextLabel != a3) {
    self->_strikeThroughLargePart2TextLabel = a3;
  }
  [(PreferencesTwoPartValueCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  *(void *)&rect.size.double height = self;
  double v55 = PreferencesTwoPartValueCell;
  [(CGFloat *)(objc_super *)&rect.size.height layoutSubviews];
  v3 = [(PreferencesTwoPartValueCell *)self traitCollection];
  BOOL v4 = EKUIUsesLargeTextLayout(v3);

  if (v4)
  {
    v5 = [(PreferencesTwoPartValueCell *)self detailTextLabel];
    id v6 = [v5 text];

    v7 = [(PreferencesTwoPartValueCell *)self largePart2TextLabel];
    double v8 = [v7 text];

    double v9 = (uint64_t *)MEMORY[0x1E4FB0768];
    if (v6)
    {
      double v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v6];
      uint64_t v11 = *v9;
      double v12 = [NSNumber numberWithBool:self->_strikeThroughLargeDetailTextLabel];
      objc_msgSend(v10, "addAttribute:value:range:", v11, v12, 0, objc_msgSend(v10, "length"));

      double v13 = [(PreferencesTwoPartValueCell *)self detailTextLabel];
      [v13 setAttributedText:v10];
    }
    if (v8)
    {
      CGFloat v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8];
      uint64_t v15 = *v9;
      double v16 = [NSNumber numberWithBool:self->_strikeThroughLargePart2TextLabel];
      objc_msgSend(v14, "addAttribute:value:range:", v15, v16, 0, objc_msgSend(v14, "length"));

      double v17 = [(PreferencesTwoPartValueCell *)self largePart2TextLabel];
      [v17 setAttributedText:v14];
    }
    if (self->_largePart2TextLabel)
    {
      double v18 = [(PreferencesTwoPartValueCell *)self textLabel];
      [v18 sizeToFit];

      double v19 = [(PreferencesTwoPartValueCell *)self detailTextLabel];
      [v19 sizeToFit];

      [(UILabel *)self->_largePart2TextLabel sizeToFit];
      double v20 = [(PreferencesTwoPartValueCell *)self textLabel];
      [v20 frame];
      rect.size.double width = v21;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;

      v28 = [(PreferencesTwoPartValueCell *)self detailTextLabel];
      [v28 frame];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;

      v37 = [(UILabel *)self->_largePart2TextLabel text];
      uint64_t v38 = [v37 length];

      if (v38)
      {
        uint64_t v39 = [(UILabel *)self->_largePart2TextLabel font];
        [v39 _bodyLeading];
        CalRoundToScreenScale(v40 * 0.5);
        double v42 = v41;

        double v43 = v23 - v42;
        double v44 = [(PreferencesTwoPartValueCell *)self textLabel];
        objc_msgSend(v44, "setFrame:", rect.size.width, v43, v25, v27);

        double v45 = v32 - v42;
        v46 = [(PreferencesTwoPartValueCell *)self detailTextLabel];
        rect.origin.double x = v30;
        objc_msgSend(v46, "setFrame:", v30, v45, v34, v36);

        [(UILabel *)self->_largePart2TextLabel frame];
        double v48 = v47;
        double v50 = v49;
        if (CalInterfaceIsLeftToRight())
        {
          v56.size.double width = v25;
          v56.origin.double x = rect.size.width;
          v56.origin.double y = v43;
          v56.size.double height = v27;
          double MinX = CGRectGetMinX(v56);
        }
        else
        {
          v57.size.double width = v25;
          v57.origin.double x = rect.size.width;
          v57.origin.double y = v43;
          v57.size.double height = v27;
          double MinX = CGRectGetMaxX(v57) - v48;
        }
        v58.origin.double x = rect.origin.x;
        v58.origin.double y = v45;
        v58.size.double width = v34;
        v58.size.double height = v36;
        -[UILabel setFrame:](self->_largePart2TextLabel, "setFrame:", MinX, CGRectGetMaxY(v58), v48, v50);
        double v53 = [(PreferencesTwoPartValueCell *)self contentView];
        [v53 addSubview:self->_largePart2TextLabel];
      }
    }
    else
    {
      [0 removeFromSuperview];
    }
  }
  else
  {
    double v52 = [(PreferencesTwoPartValueCell *)self textLabel];
    [(PreferencesTwoPartValueCell *)self layoutText:v52 andValue:self->_twoPartLabel];

    [(PreferencesTwoPartValueCell *)self checkValueWidths];
  }
}

- (void)shorten
{
  p_shortener = &self->_shortener;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shortener);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_shortener);
    [v5 shortenCell:self];

    [(PreferencesTwoPartValueCell *)self _layoutSubviewsCore];
  }
}

- (void)checkValueWidths
{
  if ([(TwoPartTextLabel *)self->_twoPartLabel hasTwoParts])
  {
    [(TwoPartTextLabel *)self->_twoPartLabel frame];
    double v4 = v3;
    [(TwoPartTextLabel *)self->_twoPartLabel idealSize];
    if (v4 < v5)
    {
      [(PreferencesTwoPartValueCell *)self shorten];
    }
  }
}

- (EKCellShortener)shortener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shortener);

  return (EKCellShortener *)WeakRetained;
}

- (void)setShortener:(id)a3
{
}

- (BOOL)strikeThroughLargeDetailTextLabel
{
  return self->_strikeThroughLargeDetailTextLabel;
}

- (BOOL)strikeThroughLargePart2TextLabel
{
  return self->_strikeThroughLargePart2TextLabel;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shortener);
  objc_storeStrong((id *)&self->_largePart2TextLabel, 0);

  objc_storeStrong((id *)&self->_twoPartLabel, 0);
}

@end