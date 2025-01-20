@interface AVTAttributeLabeledCollectionViewCell
+ (id)cellIdentifier;
- (AVTAttributeLabeledCollectionViewCell)initWithFrame:(CGRect)a3;
- (BOOL)shouldHideLabelBackground;
- (CGRect)frameForAttributeView;
- (NSString)labelString;
- (UILabel)label;
- (UIVisualEffectView)labelBackgroundView;
- (double)labelVerticalSpace;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setLabel:(id)a3;
- (void)setLabelBackgroundView:(id)a3;
- (void)setLabelString:(id)a3;
- (void)setLabelVerticalSpace:(double)a3;
- (void)setShouldHideLabelBackground:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLabelBackgroundAppearance;
@end

@implementation AVTAttributeLabeledCollectionViewCell

+ (id)cellIdentifier
{
  return @"AVTAttributeLabeledCollectionViewCell";
}

- (AVTAttributeLabeledCollectionViewCell)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)AVTAttributeLabeledCollectionViewCell;
  v3 = -[AVTAttributeLabeledCollectionViewCell initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    label = v3->_label;
    v3->_label = (UILabel *)v9;

    v11 = +[AVTUIFontRepository attributeViewLabelFont];
    [(UILabel *)v3->_label setFont:v11];

    LODWORD(v12) = 1.0;
    [(UILabel *)v3->_label _setHyphenationFactor:v12];
    [(UILabel *)v3->_label setNumberOfLines:2];
    [(UILabel *)v3->_label setTextAlignment:1];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB98]), "initWithFrame:", v5, v6, v7, v8);
    labelBackgroundView = v3->_labelBackgroundView;
    v3->_labelBackgroundView = (UIVisualEffectView *)v13;

    [(AVTAttributeLabeledCollectionViewCell *)v3 updateLabelBackgroundAppearance];
    v15 = [(UIVisualEffectView *)v3->_labelBackgroundView layer];
    [v15 setCornerRadius:3.0];

    [(UIVisualEffectView *)v3->_labelBackgroundView setClipsToBounds:1];
    v16 = [(UIVisualEffectView *)v3->_labelBackgroundView contentView];
    [v16 addSubview:v3->_label];

    v17 = [(AVTAttributeLabeledCollectionViewCell *)v3 contentView];
    [v17 addSubview:v3->_labelBackgroundView];
  }
  return v3;
}

- (void)setShouldHideLabelBackground:(BOOL)a3
{
  if (self->_shouldHideLabelBackground != a3)
  {
    self->_shouldHideLabelBackground = a3;
    [(AVTAttributeLabeledCollectionViewCell *)self updateLabelBackgroundAppearance];
  }
}

- (CGRect)frameForAttributeView
{
  v3 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v6 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
  [v6 bounds];
  double v8 = v7;
  [(AVTAttributeLabeledCollectionViewCell *)self labelVerticalSpace];
  double v10 = v8 - v9;

  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = v5;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  [(AVTAttributeLabeledCollectionViewCell *)self updateLabelBackgroundAppearance];
  v5.receiver = self;
  v5.super_class = (Class)AVTAttributeLabeledCollectionViewCell;
  [(AVTAttributeLabeledCollectionViewCell *)&v5 traitCollectionDidChange:v4];
}

- (void)updateLabelBackgroundAppearance
{
  if ([(AVTAttributeLabeledCollectionViewCell *)self shouldHideLabelBackground])
  {
    id v6 = [MEMORY[0x263F1C550] clearColor];
    -[UIVisualEffectView setBackgroundColor:](self->_labelBackgroundView, "setBackgroundColor:");
  }
  else
  {
    v3 = [(AVTAttributeLabeledCollectionViewCell *)self traitCollection];
    uint64_t v4 = [v3 userInterfaceStyle];

    if (v4 == 2)
    {
      id v6 = [MEMORY[0x263F1C480] effectWithStyle:2];
      -[UIVisualEffectView setEffect:](self->_labelBackgroundView, "setEffect:");
      [MEMORY[0x263F1C550] systemGrayColor];
    }
    else
    {
      id v6 = [MEMORY[0x263F1C480] effectWithStyle:1];
      -[UIVisualEffectView setEffect:](self->_labelBackgroundView, "setEffect:");
      [MEMORY[0x263F1C550] systemGray6Color];
    objc_super v5 = };
    [(UIVisualEffectView *)self->_labelBackgroundView setBackgroundColor:v5];
  }
}

- (void)layoutSubviews
{
  v86[1] = *MEMORY[0x263EF8340];
  v80.receiver = self;
  v80.super_class = (Class)AVTAttributeLabeledCollectionViewCell;
  [(AVTAttributeLabeledCollectionViewCell *)&v80 layoutSubviews];
  v3 = [(AVTAttributeCollectionViewCell *)self attributeView];
  [v3 bounds];
  double v5 = v4;
  id v6 = [(AVTAttributeCollectionViewCell *)self attributeView];
  [v6 bounds];
  double v8 = (v5 - v7) * 0.5;

  [(AVTAttributeLabeledCollectionViewCell *)self labelVerticalSpace];
  double v10 = ceil(v9 + v8 + -7.0 + -4.0);
  double v11 = [(AVTAttributeLabeledCollectionViewCell *)self label];
  double v12 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
  [v12 bounds];
  objc_msgSend(v11, "sizeThatFits:", v13, v10);
  double v15 = v14;
  double v17 = v16;

  v18 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
  [v18 bounds];
  double v20 = v19;

  double v21 = ceil(v15);
  if (v20 >= v21) {
    double v20 = v21;
  }
  double v22 = ceil(v17);
  if (v10 >= v22) {
    double v23 = v22;
  }
  else {
    double v23 = v10;
  }
  v24 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
  [v24 bounds];
  double v26 = v25 + -10.0;

  double v27 = 10.0;
  if (v20 >= v26)
  {
    v28 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
    [v28 bounds];
    double v30 = v29 + -4.0;

    double v27 = 0.0;
    if (v20 < v30) {
      double v27 = 4.0;
    }
  }
  v31 = [(AVTAttributeLabeledCollectionViewCell *)self label];
  v32 = [v31 font];
  [v32 lineHeight];
  double v34 = ceil(v33) + 3.0;

  if (v23 > v34)
  {
    v35 = [(AVTAttributeLabeledCollectionViewCell *)self label];
    v36 = [v35 text];
    v37 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
    [v37 bounds];
    double v39 = v38 + -10.0 + -1.0;
    uint64_t v40 = *MEMORY[0x263F1C238];
    uint64_t v85 = *MEMORY[0x263F1C238];
    v41 = [(AVTAttributeLabeledCollectionViewCell *)self label];
    v42 = [v41 font];
    v86[0] = v42;
    v43 = [NSDictionary dictionaryWithObjects:v86 forKeys:&v85 count:1];
    objc_msgSend(v36, "boundingRectWithSize:options:attributes:context:", 1, v43, 0, v39, 1.79769313e308);
    double v45 = v44;

    v46 = [(AVTAttributeLabeledCollectionViewCell *)self label];
    v47 = [v46 text];
    if (ceil(v45) <= v10)
    {
      uint64_t v83 = v40;
      v61 = [(AVTAttributeLabeledCollectionViewCell *)self label];
      v62 = [v61 font];
      v84 = v62;
      v63 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      objc_msgSend(v47, "boundingRectWithSize:options:attributes:context:", 1, v63, 0, 1.79769313e308, v34);
      double v65 = v64;

      v66 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
      [v66 bounds];
      double v68 = v67 + -10.0 + -1.0;

      double v69 = ceil(v65) * 0.6;
      if (v68 >= v69) {
        double v20 = v69;
      }
      else {
        double v20 = v68;
      }
      double v27 = 10.0;
    }
    else
    {
      v48 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
      [v48 bounds];
      double v50 = v49 + -4.0 + -1.0;
      uint64_t v81 = v40;
      v51 = [(AVTAttributeLabeledCollectionViewCell *)self label];
      v52 = [v51 font];
      v82 = v52;
      v53 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      objc_msgSend(v47, "boundingRectWithSize:options:attributes:context:", 1, v53, 0, v50, 1.79769313e308);
      double v55 = v54;
      double v57 = v56;

      double v27 = 0.0;
      if (ceil(v57) <= v10)
      {
        v58 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
        [v58 bounds];
        double v20 = v59 + -4.0 + -1.0;

        double v60 = ceil(v55);
        if (v20 >= v60) {
          double v20 = v60;
        }
        double v27 = 4.0;
      }
    }
  }
  v70 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
  [v70 bounds];
  double v72 = (v71 - (v27 + v20)) * 0.5;

  v73 = [(AVTAttributeCollectionViewCell *)self attributeView];
  [v73 bounds];
  double v75 = v74 - v8 + 7.0;

  v76 = [(AVTAttributeLabeledCollectionViewCell *)self label];
  objc_msgSend(v76, "setFrame:", v27 * 0.5, 2.0, v20, v23);

  v77 = [(AVTAttributeLabeledCollectionViewCell *)self labelBackgroundView];
  objc_msgSend(v77, "setFrame:", v72, v75, v27 + v20, v23 + 4.0);

  v78 = [(AVTAttributeLabeledCollectionViewCell *)self contentView];
  v79 = [(AVTAttributeLabeledCollectionViewCell *)self labelBackgroundView];
  [v78 bringSubviewToFront:v79];
}

- (void)setLabelString:(id)a3
{
  id v8 = a3;
  if (!-[NSString isEqualToString:](self->_labelString, "isEqualToString:"))
  {
    double v4 = (NSString *)[v8 copy];
    labelString = self->_labelString;
    self->_labelString = v4;

    id v6 = self->_labelString;
    double v7 = [(AVTAttributeLabeledCollectionViewCell *)self label];
    [v7 setText:v6];

    [(AVTAttributeLabeledCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)prepareForReuse
{
  [(AVTAttributeLabeledCollectionViewCell *)self setLabelString:0];
  v3 = [(AVTAttributeLabeledCollectionViewCell *)self label];
  [v3 setText:0];

  [(AVTAttributeLabeledCollectionViewCell *)self setNeedsLayout];
  v4.receiver = self;
  v4.super_class = (Class)AVTAttributeLabeledCollectionViewCell;
  [(AVTAttributeCollectionViewCell *)&v4 prepareForReuse];
}

- (NSString)labelString
{
  return self->_labelString;
}

- (double)labelVerticalSpace
{
  return self->_labelVerticalSpace;
}

- (void)setLabelVerticalSpace:(double)a3
{
  self->_labelVerticalSpace = a3;
}

- (BOOL)shouldHideLabelBackground
{
  return self->_shouldHideLabelBackground;
}

- (UIVisualEffectView)labelBackgroundView
{
  return self->_labelBackgroundView;
}

- (void)setLabelBackgroundView:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelBackgroundView, 0);
  objc_storeStrong((id *)&self->_labelString, 0);
}

@end