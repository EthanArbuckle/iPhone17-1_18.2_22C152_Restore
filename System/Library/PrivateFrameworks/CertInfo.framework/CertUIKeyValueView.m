@interface CertUIKeyValueView
+ (double)defaultPreferredValueLabelOriginX;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CertUIKeyValueView)initWithFrame:(CGRect)a3;
- (UIImageView)verifiedImageView;
- (UILabel)keyLabel;
- (UILabel)valueLabel;
- (UILabel)verifiedLabel;
- (double)preferredValueLabelOriginX;
- (id)detailFont;
- (id)titleFont;
- (id)verifiedColor;
- (id)verifiedFont;
- (void)_createVerifiedComponentsIfNeeded;
- (void)layoutSubviews;
- (void)setCheckmarkLabelText:(id)a3 checkmarkLabelColor:(id)a4 showCheckmark:(BOOL)a5;
- (void)setHighlightTextColor:(id)a3;
- (void)setItemDetail:(id)a3;
- (void)setKey:(id)a3 value:(id)a4;
- (void)setKeyLabel:(id)a3;
- (void)setPreferredValueLabelOriginX:(double)a3;
- (void)setValueLabel:(id)a3;
- (void)setVerifiedImageView:(id)a3;
- (void)setVerifiedLabel:(id)a3;
@end

@implementation CertUIKeyValueView

+ (double)defaultPreferredValueLabelOriginX
{
  double result = *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX;
  if (*(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX < 0.0)
  {
    v3 = (void *)MEMORY[0x263F1C6B0];
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v3 imageNamed:@"profile-icon" inBundle:v4];

    [v5 size];
    if (v6 > 0.0)
    {
      [v5 size];
      *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX = v7 + 24.0;
    }

    return *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX;
  }
  return result;
}

- (CertUIKeyValueView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CertUIKeyValueView;
  v3 = -[CertUIKeyValueView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    keyLabel = v3->_keyLabel;
    v3->_keyLabel = (UILabel *)v9;

    [(UILabel *)v3->_keyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [MEMORY[0x263F1C550] systemGrayColor];
    [(UILabel *)v3->_keyLabel setTextColor:v11];

    [(UILabel *)v3->_keyLabel setTextAlignment:2];
    v12 = [(CertUIKeyValueView *)v3 titleFont];
    [(UILabel *)v3->_keyLabel setFont:v12];

    [(UILabel *)v3->_keyLabel setNumberOfLines:0];
    [(CertUIKeyValueView *)v3 addSubview:v3->_keyLabel];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v5, v6, v7, v8);
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = (UILabel *)v13;

    [(UILabel *)v3->_valueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(CertUIKeyValueView *)v3 detailFont];
    [(UILabel *)v3->_valueLabel setFont:v15];

    [(UILabel *)v3->_valueLabel setNumberOfLines:0];
    [(CertUIKeyValueView *)v3 addSubview:v3->_valueLabel];
    +[CertUIKeyValueView defaultPreferredValueLabelOriginX];
    v3->_preferredValueLabelOriginX = v16;
  }
  return v3;
}

- (void)layoutSubviews
{
  v90.receiver = self;
  v90.super_class = (Class)CertUIKeyValueView;
  [(CertUIKeyValueView *)&v90 layoutSubviews];
  [(CertUIKeyValueView *)self frame];
  double v4 = v3;
  [(CertUIKeyValueView *)self preferredValueLabelOriginX];
  double v6 = v4 - v5;
  [(CertUIKeyValueView *)self frame];
  double v8 = v7 - v6 + -10.0;
  uint64_t v9 = [(CertUIKeyValueView *)self keyLabel];
  objc_msgSend(v9, "sizeThatFits:", v8, 3.40282347e38);
  double v11 = v10;
  CGFloat v13 = v12;

  v91.origin.double x = v8 - v11;
  v91.origin.double y = 0.0;
  v91.size.double width = v11;
  v91.size.double height = v13;
  CGRect v92 = CGRectIntegral(v91);
  double x = v92.origin.x;
  double y = v92.origin.y;
  double width = v92.size.width;
  double height = v92.size.height;
  objc_super v18 = [(CertUIKeyValueView *)self keyLabel];
  objc_msgSend(v18, "setFrame:", x, y, width, height);

  v19 = [(CertUIKeyValueView *)self valueLabel];
  double v89 = v6;
  objc_msgSend(v19, "sizeThatFits:", v6, 3.40282347e38);
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  [(CertUIKeyValueView *)self preferredValueLabelOriginX];
  CGFloat v24 = v93.origin.x;
  v93.origin.double y = 0.0;
  v93.size.double width = v21;
  v93.size.double height = v23;
  CGRect v94 = CGRectIntegral(v93);
  double v25 = v94.origin.x;
  double v26 = v94.origin.y;
  double v27 = v94.size.width;
  double v28 = v94.size.height;
  v29 = [(CertUIKeyValueView *)self valueLabel];
  objc_msgSend(v29, "setFrame:", v25, v26, v27, v28);

  v30 = [(CertUIKeyValueView *)self keyLabel];
  [v30 _firstLineBaselineFrameOriginY];
  double v32 = v31;
  v33 = [(CertUIKeyValueView *)self valueLabel];
  [v33 _firstLineBaselineOffsetFromBoundsTop];
  CGFloat v35 = v32 - v34;

  v95.origin.double x = v24;
  v95.origin.double y = v35;
  v95.size.double width = v21;
  v95.size.double height = v23;
  CGRect v96 = CGRectIntegral(v95);
  double v36 = v96.origin.x;
  double v37 = v96.origin.y;
  double v38 = v96.size.width;
  double v39 = v96.size.height;
  v40 = [(CertUIKeyValueView *)self valueLabel];
  objc_msgSend(v40, "setFrame:", v36, v37, v38, v39);

  v41 = [(CertUIKeyValueView *)self keyLabel];
  v42 = [v41 text];
  uint64_t v43 = [v42 length];

  v44 = [(CertUIKeyValueView *)self valueLabel];
  v45 = [v44 text];
  uint64_t v46 = [v45 length];

  v97.origin.double x = v24;
  v97.origin.double y = v35;
  v97.size.double width = v21;
  v97.size.double height = v23;
  double MaxY = CGRectGetMaxY(v97);
  v48 = [(CertUIKeyValueView *)self verifiedLabel];

  if (v48)
  {
    double v49 = v46 ? MaxY + 5.0 : MaxY;
    v50 = [(CertUIKeyValueView *)self verifiedLabel];
    objc_msgSend(v50, "sizeThatFits:", v89, 3.40282347e38);
    CGFloat v52 = v51;
    CGFloat v54 = v53;

    [(CertUIKeyValueView *)self preferredValueLabelOriginX];
    CGFloat v55 = v98.origin.x;
    v98.origin.double y = v49;
    v98.size.double width = v52;
    v98.size.double height = v54;
    CGRect v99 = CGRectIntegral(v98);
    double v56 = v99.origin.x;
    double v57 = v99.origin.y;
    double v58 = v99.size.width;
    double v59 = v99.size.height;
    v60 = [(CertUIKeyValueView *)self verifiedLabel];
    objc_msgSend(v60, "setFrame:", v56, v57, v58, v59);

    if (!v46)
    {
      if (v43)
      {
        v61 = [(CertUIKeyValueView *)self keyLabel];
        [v61 _firstLineBaselineFrameOriginY];
        double v63 = v62;
        v64 = [(CertUIKeyValueView *)self verifiedLabel];
        [v64 _firstLineBaselineOffsetFromBoundsTop];
        CGFloat v66 = v63 - v65;

        v100.origin.double x = v55;
        v100.origin.double y = v66;
        v100.size.double width = v52;
        v100.size.double height = v54;
        CGRect v101 = CGRectIntegral(v100);
        double v67 = v101.origin.x;
        double v68 = v101.origin.y;
        double v69 = v101.size.width;
        double v70 = v101.size.height;
        v71 = [(CertUIKeyValueView *)self verifiedLabel];
        objc_msgSend(v71, "setFrame:", v67, v68, v69, v70);
      }
    }
  }
  v72 = [(CertUIKeyValueView *)self verifiedImageView];

  if (v72)
  {
    v73 = [(CertUIKeyValueView *)self verifiedImageView];
    v74 = [v73 image];
    [v74 size];
    CGFloat v76 = v75;
    double v78 = v77;

    v79 = [(CertUIKeyValueView *)self verifiedLabel];
    [v79 frame];
    CGFloat v80 = CGRectGetMaxX(v102) + 8.0;

    v81 = [(CertUIKeyValueView *)self verifiedLabel];
    [v81 _firstLineBaselineFrameOriginY];
    CGFloat v83 = v82 - v78;

    v103.origin.double x = v80;
    v103.origin.double y = v83;
    v103.size.double width = v76;
    v103.size.double height = v78;
    CGRect v104 = CGRectIntegral(v103);
    double v84 = v104.origin.x;
    double v85 = v104.origin.y;
    double v86 = v104.size.width;
    double v87 = v104.size.height;
    v88 = [(CertUIKeyValueView *)self verifiedImageView];
    objc_msgSend(v88, "setFrame:", v84, v85, v86, v87);
  }
}

- (void)_createVerifiedComponentsIfNeeded
{
  double v3 = [(CertUIKeyValueView *)self verifiedImageView];

  if (!v3)
  {
    double v4 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:0];
    verifiedImageView = self->_verifiedImageView;
    self->_verifiedImageView = v4;

    [(UIImageView *)self->_verifiedImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = [(CertUIKeyValueView *)self verifiedColor];
    [(UIImageView *)self->_verifiedImageView setTintColor:v6];

    [(CertUIKeyValueView *)self addSubview:self->_verifiedImageView];
  }
  double v7 = [(CertUIKeyValueView *)self verifiedLabel];

  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v9 = (UILabel *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    verifiedLabel = self->_verifiedLabel;
    self->_verifiedLabel = v9;

    [(UILabel *)self->_verifiedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v11 = [MEMORY[0x263F1C550] systemRedColor];
    [(UILabel *)self->_verifiedLabel setTextColor:v11];

    double v12 = [(CertUIKeyValueView *)self verifiedFont];
    [(UILabel *)self->_verifiedLabel setFont:v12];

    CGFloat v13 = self->_verifiedLabel;
    [(CertUIKeyValueView *)self addSubview:v13];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(CertUIKeyValueView *)self preferredValueLabelOriginX];
  double v6 = width - v5;
  double v7 = width - (width - v5) + -10.0;
  id v8 = [(CertUIKeyValueView *)self keyLabel];
  objc_msgSend(v8, "sizeThatFits:", v7, 3.40282347e38);
  double v10 = v9;
  CGFloat v12 = v11;

  v44.origin.CGFloat x = v7 - v10;
  double MaxY = 0.0;
  v44.origin.CGFloat y = 0.0;
  v44.size.double width = v10;
  v44.size.CGFloat height = v12;
  CGRect v45 = CGRectIntegral(v44);
  CGFloat x = v45.origin.x;
  CGFloat y = v45.origin.y;
  CGFloat v16 = v45.size.width;
  CGFloat height = v45.size.height;
  if (CGRectGetMaxY(v45) > 0.0)
  {
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.double width = v16;
    v46.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v46);
  }
  objc_super v18 = [(CertUIKeyValueView *)self valueLabel];
  objc_msgSend(v18, "sizeThatFits:", v6, 3.40282347e38);
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  [(CertUIKeyValueView *)self preferredValueLabelOriginX];
  v47.origin.CGFloat y = 0.0;
  v47.size.double width = v20;
  v47.size.CGFloat height = v22;
  CGRect v48 = CGRectIntegral(v47);
  CGFloat v23 = v48.origin.x;
  CGFloat v24 = v48.origin.y;
  CGFloat v25 = v48.size.width;
  CGFloat v26 = v48.size.height;
  if (CGRectGetMaxY(v48) > MaxY)
  {
    v49.origin.CGFloat x = v23;
    v49.origin.CGFloat y = v24;
    v49.size.double width = v25;
    v49.size.CGFloat height = v26;
    double MaxY = CGRectGetMaxY(v49);
  }
  v50.origin.CGFloat x = v23;
  v50.origin.CGFloat y = v24;
  v50.size.double width = v25;
  v50.size.CGFloat height = v26;
  double v27 = CGRectGetMaxY(v50);
  double v28 = [(CertUIKeyValueView *)self valueLabel];
  v29 = [v28 text];
  uint64_t v30 = [v29 length];

  double v31 = [(CertUIKeyValueView *)self verifiedLabel];

  if (v31)
  {
    if (v30) {
      double v27 = v27 + 5.0;
    }
    double v32 = [(CertUIKeyValueView *)self verifiedLabel];
    objc_msgSend(v32, "sizeThatFits:", v6, 3.40282347e38);
    CGFloat v34 = v33;
    CGFloat v36 = v35;

    [(CertUIKeyValueView *)self preferredValueLabelOriginX];
    v51.origin.CGFloat y = v27;
    v51.size.double width = v34;
    v51.size.CGFloat height = v36;
    CGRect v52 = CGRectIntegral(v51);
    CGFloat v37 = v52.origin.x;
    CGFloat v38 = v52.origin.y;
    CGFloat v39 = v52.size.width;
    CGFloat v40 = v52.size.height;
    if (CGRectGetMaxY(v52) > MaxY)
    {
      v53.origin.CGFloat x = v37;
      v53.origin.CGFloat y = v38;
      v53.size.double width = v39;
      v53.size.CGFloat height = v40;
      double MaxY = CGRectGetMaxY(v53);
    }
  }
  double v41 = width;
  double v42 = MaxY;
  result.CGFloat height = v42;
  result.double width = v41;
  return result;
}

- (void)setItemDetail:(id)a3
{
  id v10 = a3;
  double v4 = [v10 detailTitle];
  double v5 = [v10 detail];
  [(CertUIKeyValueView *)self setKey:v4 value:v5];

  double v6 = [v10 detailHighlightColor];
  [(CertUIKeyValueView *)self setHighlightTextColor:v6];

  if ([v10 showCheckmarkView])
  {
    double v7 = [v10 checkmarkText];
    id v8 = [v10 checkmarkHighlightColor];
    -[CertUIKeyValueView setCheckmarkLabelText:checkmarkLabelColor:showCheckmark:](self, "setCheckmarkLabelText:checkmarkLabelColor:showCheckmark:", v7, v8, [v10 showCheckmark]);
  }
  else
  {
    double v9 = [(CertUIKeyValueView *)self verifiedLabel];
    [v9 setText:0];

    double v7 = [(CertUIKeyValueView *)self verifiedImageView];
    [v7 setImage:0];
  }

  [(CertUIKeyValueView *)self setNeedsLayout];
}

- (void)setKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CertUIKeyValueView *)self keyLabel];
  [v8 setText:v7];

  double v9 = [(CertUIKeyValueView *)self valueLabel];
  [v9 setText:v6];

  [(CertUIKeyValueView *)self setNeedsLayout];
}

- (void)setHighlightTextColor:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [(CertUIKeyValueView *)self keyLabel];
    [v5 setTextColor:v4];

    id v6 = [(CertUIKeyValueView *)self valueLabel];
    [v6 setTextColor:v4];
  }
}

- (void)setCheckmarkLabelText:(id)a3 checkmarkLabelColor:(id)a4 showCheckmark:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(CertUIKeyValueView *)self _createVerifiedComponentsIfNeeded];
  if (v5)
  {
    id v10 = (void *)MEMORY[0x263F1C6B0];
    double v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    CGFloat v12 = [v10 imageNamed:@"VerifiedCheckmark" inBundle:v11];
  }
  else
  {
    CGFloat v12 = 0;
  }
  CGFloat v13 = [(CertUIKeyValueView *)self verifiedLabel];
  [v13 setText:v9];

  v14 = [(CertUIKeyValueView *)self verifiedLabel];
  [v14 setTextColor:v8];

  id v16 = [v12 imageWithRenderingMode:2];

  v15 = [(CertUIKeyValueView *)self verifiedImageView];
  [v15 setImage:v16];

  [(CertUIKeyValueView *)self setNeedsLayout];
}

- (void)setPreferredValueLabelOriginX:(double)a3
{
  if (a3 >= 0.0 && self->_preferredValueLabelOriginX != a3)
  {
    self->_preferredValueLabelOriginX = a3;
    [(CertUIKeyValueView *)self setNeedsLayout];
  }
}

- (id)titleFont
{
  v2 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D270]];
  double v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  id v4 = [MEMORY[0x263F1C658] fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (id)detailFont
{
  v2 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D270]];
  double v3 = [MEMORY[0x263F1C658] fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (id)verifiedFont
{
  v2 = [(CertUIKeyValueView *)self detailFont];
  double v3 = [v2 fontDescriptor];

  id v4 = [v3 fontDescriptorWithSymbolicTraits:2];

  BOOL v5 = [MEMORY[0x263F1C658] fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (id)verifiedColor
{
  return (id)[MEMORY[0x263F1C550] colorWithRed:0.0 green:0.8 blue:0.278431373 alpha:1.0];
}

- (double)preferredValueLabelOriginX
{
  return self->_preferredValueLabelOriginX;
}

- (UILabel)keyLabel
{
  return self->_keyLabel;
}

- (void)setKeyLabel:(id)a3
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (UIImageView)verifiedImageView
{
  return self->_verifiedImageView;
}

- (void)setVerifiedImageView:(id)a3
{
}

- (UILabel)verifiedLabel
{
  return self->_verifiedLabel;
}

- (void)setVerifiedLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiedLabel, 0);
  objc_storeStrong((id *)&self->_verifiedImageView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_keyLabel, 0);
}

@end