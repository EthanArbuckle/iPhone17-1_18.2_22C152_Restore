@interface DMCProfileKeyValueView
+ (double)defaultPreferredValueLabelOriginX;
- (CGSize)sizeThatFits:(CGSize)a3;
- (DMCProfileKeyValueView)initWithFrame:(CGRect)a3;
- (UILabel)keyLabel;
- (UILabel)valueLabel;
- (UILabel)verifiedLabel;
- (double)desiredValueLabelOriginXForSize:(CGSize)a3;
- (double)preferredValueLabelOriginX;
- (id)_captionFontBold:(BOOL)a3;
- (void)layoutSubviews;
- (void)setItemDetail:(id)a3;
- (void)setKey:(id)a3 value:(id)a4;
- (void)setKeyLabel:(id)a3;
- (void)setPreferredValueLabelOriginX:(double)a3;
- (void)setValueLabel:(id)a3;
- (void)setVerifiedLabel:(id)a3;
@end

@implementation DMCProfileKeyValueView

+ (double)defaultPreferredValueLabelOriginX
{
  double result = *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX;
  if (*(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX < 0.0)
  {
    v3 = +[DMCIconFactory gearIcon];
    [v3 size];
    if (v4 > 0.0)
    {
      [v3 size];
      *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX = v5 + 24.0;
    }

    return *(double *)&defaultPreferredValueLabelOriginX_defaultPreferredValueLabelOriginX;
  }
  return result;
}

- (DMCProfileKeyValueView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)DMCProfileKeyValueView;
  v3 = -[DMCProfileKeyValueView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
    v11 = [MEMORY[0x263F1C550] DMCProfileSecondaryLabelColor];
    [(UILabel *)v3->_keyLabel setTextColor:v11];

    [(UILabel *)v3->_keyLabel setTextAlignment:2];
    v12 = [(DMCProfileKeyValueView *)v3 _captionFontBold:0];
    [(UILabel *)v3->_keyLabel setFont:v12];

    [(UILabel *)v3->_keyLabel setNumberOfLines:0];
    [(DMCProfileKeyValueView *)v3 addSubview:v3->_keyLabel];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v5, v6, v7, v8);
    valueLabel = v3->_valueLabel;
    v3->_valueLabel = (UILabel *)v13;

    [(UILabel *)v3->_valueLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(DMCProfileKeyValueView *)v3 _captionFontBold:0];
    [(UILabel *)v3->_valueLabel setFont:v15];

    [(UILabel *)v3->_valueLabel setNumberOfLines:0];
    [(DMCProfileKeyValueView *)v3 addSubview:v3->_valueLabel];
    +[DMCProfileKeyValueView defaultPreferredValueLabelOriginX];
    v3->_preferredValueLabelOriginX = v16;
  }
  return v3;
}

- (void)layoutSubviews
{
  v89.receiver = self;
  v89.super_class = (Class)DMCProfileKeyValueView;
  [(DMCProfileKeyValueView *)&v89 layoutSubviews];
  [(DMCProfileKeyValueView *)self frame];
  double v4 = v3;
  [(DMCProfileKeyValueView *)self preferredValueLabelOriginX];
  double v6 = v4 - v5;
  [(DMCProfileKeyValueView *)self frame];
  double v8 = v7 - v6 + -10.0;
  uint64_t v9 = [(DMCProfileKeyValueView *)self keyLabel];
  objc_msgSend(v9, "sizeThatFits:", v8, 3.40282347e38);
  double v11 = v10;
  uint64_t v13 = v12;

  v14 = (id *)MEMORY[0x263F1D020];
  if ([(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection])
  {
    [(DMCProfileKeyValueView *)self frame];
    double v16 = v15 - v11 + -10.0;
  }
  else
  {
    double v16 = v8 - v11;
  }
  uint64_t v17 = 0;
  double v18 = v11;
  uint64_t v19 = v13;
  CGRect v90 = CGRectIntegral(*(CGRect *)&v16);
  double x = v90.origin.x;
  double y = v90.origin.y;
  double width = v90.size.width;
  double height = v90.size.height;
  v24 = [(DMCProfileKeyValueView *)self keyLabel];
  objc_msgSend(v24, "setFrame:", x, y, width, height);

  v25 = [(DMCProfileKeyValueView *)self valueLabel];
  objc_msgSend(v25, "sizeThatFits:", v6, 3.40282347e38);
  double v27 = v26;
  CGFloat v29 = v28;

  double v87 = v6;
  if ([*v14 userInterfaceLayoutDirection])
  {
    [(DMCProfileKeyValueView *)self frame];
    double v31 = v30;
    [(DMCProfileKeyValueView *)self preferredValueLabelOriginX];
    double v33 = v31 - v32 - v27;
  }
  else
  {
    [(DMCProfileKeyValueView *)self preferredValueLabelOriginX];
    double v33 = v34;
  }
  v91.origin.double y = 0.0;
  v91.origin.double x = v33;
  v91.size.double width = v27;
  v91.size.double height = v29;
  CGRect v92 = CGRectIntegral(v91);
  double v35 = v92.origin.x;
  double v36 = v92.origin.y;
  double v37 = v92.size.width;
  double v38 = v92.size.height;
  v39 = [(DMCProfileKeyValueView *)self valueLabel];
  objc_msgSend(v39, "setFrame:", v35, v36, v37, v38);

  v40 = [(DMCProfileKeyValueView *)self keyLabel];
  [v40 _firstLineBaselineFrameOriginY];
  double v42 = v41;
  v43 = [(DMCProfileKeyValueView *)self valueLabel];
  [v43 _firstLineBaselineOffsetFromBoundsTop];
  CGFloat v45 = v42 - v44;

  v93.origin.double x = v33;
  v93.origin.double y = v45;
  v93.size.double width = v27;
  v93.size.double height = v29;
  CGRect v94 = CGRectIntegral(v93);
  double v46 = v94.origin.x;
  double v47 = v94.origin.y;
  double v48 = v94.size.width;
  double v49 = v94.size.height;
  v50 = [(DMCProfileKeyValueView *)self valueLabel];
  objc_msgSend(v50, "setFrame:", v46, v47, v48, v49);

  v51 = [(DMCProfileKeyValueView *)self keyLabel];
  v52 = [v51 text];
  uint64_t v53 = [v52 length];

  v54 = [(DMCProfileKeyValueView *)self valueLabel];
  v55 = [v54 text];
  uint64_t v56 = [v55 length];

  v95.origin.double x = v33;
  v95.origin.double y = v45;
  v95.size.double width = v27;
  v95.size.double height = v29;
  double MaxY = CGRectGetMaxY(v95);
  if (v56) {
    double v58 = MaxY + 5.0;
  }
  else {
    double v58 = MaxY;
  }
  v59 = [(DMCProfileKeyValueView *)self verifiedLabel];

  if (v59)
  {
    v60 = [(DMCProfileKeyValueView *)self verifiedLabel];
    objc_msgSend(v60, "sizeThatFits:", v88, v86);
    double v62 = v61;
    CGFloat v64 = v63;

    if ([*v14 userInterfaceLayoutDirection])
    {
      [(DMCProfileKeyValueView *)self frame];
      double v66 = v65;
      [(DMCProfileKeyValueView *)self preferredValueLabelOriginX];
      double v68 = v66 - v67 - v62;
    }
    else
    {
      [(DMCProfileKeyValueView *)self preferredValueLabelOriginX];
      double v68 = v69;
    }
    v96.origin.double x = v68;
    v96.origin.double y = v58;
    v96.size.double width = v62;
    v96.size.double height = v64;
    CGRect v97 = CGRectIntegral(v96);
    double v70 = v97.origin.x;
    double v71 = v97.origin.y;
    double v72 = v97.size.width;
    double v73 = v97.size.height;
    v74 = [(DMCProfileKeyValueView *)self verifiedLabel];
    objc_msgSend(v74, "setFrame:", v70, v71, v72, v73);

    if (!v56)
    {
      if (v53)
      {
        v75 = [(DMCProfileKeyValueView *)self keyLabel];
        [v75 _firstLineBaselineFrameOriginY];
        double v77 = v76;
        v78 = [(DMCProfileKeyValueView *)self verifiedLabel];
        [v78 _firstLineBaselineOffsetFromBoundsTop];
        CGFloat v80 = v77 - v79;

        v98.origin.double x = v68;
        v98.origin.double y = v80;
        v98.size.double width = v62;
        v98.size.double height = v64;
        CGRect v99 = CGRectIntegral(v98);
        double v81 = v99.origin.x;
        double v82 = v99.origin.y;
        double v83 = v99.size.width;
        double v84 = v99.size.height;
        v85 = [(DMCProfileKeyValueView *)self verifiedLabel];
        objc_msgSend(v85, "setFrame:", v81, v82, v83, v84);
      }
    }
  }
}

- (UILabel)verifiedLabel
{
  verifiedLabel = self->_verifiedLabel;
  if (!verifiedLabel)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v6 = self->_verifiedLabel;
    self->_verifiedLabel = v5;

    [(UILabel *)self->_verifiedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v7 = [(DMCProfileKeyValueView *)self _captionFontBold:0];
    [(UILabel *)self->_verifiedLabel setFont:v7];

    [(DMCProfileKeyValueView *)self addSubview:self->_verifiedLabel];
    verifiedLabel = self->_verifiedLabel;
  }
  return verifiedLabel;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(DMCProfileKeyValueView *)self preferredValueLabelOriginX];
  double v6 = width - v5;
  double v7 = width - (width - v5) + -10.0;
  double v8 = [(DMCProfileKeyValueView *)self keyLabel];
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
  double v18 = [(DMCProfileKeyValueView *)self valueLabel];
  objc_msgSend(v18, "sizeThatFits:", v6, 3.40282347e38);
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  [(DMCProfileKeyValueView *)self preferredValueLabelOriginX];
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
  double v28 = [(DMCProfileKeyValueView *)self valueLabel];
  CGFloat v29 = [v28 text];
  uint64_t v30 = [v29 length];

  double v31 = [(DMCProfileKeyValueView *)self verifiedLabel];

  if (v31)
  {
    if (v30) {
      double v27 = v27 + 5.0;
    }
    double v32 = [(DMCProfileKeyValueView *)self verifiedLabel];
    objc_msgSend(v32, "sizeThatFits:", v6, 3.40282347e38);
    CGFloat v34 = v33;
    CGFloat v36 = v35;

    [(DMCProfileKeyValueView *)self preferredValueLabelOriginX];
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

- (double)desiredValueLabelOriginXForSize:(CGSize)a3
{
  float v3 = (a3.width + -10.0) * 0.65;
  CGFloat v4 = a3.width - roundf(v3) + -10.0;
  double v5 = [(DMCProfileKeyValueView *)self keyLabel];
  objc_msgSend(v5, "sizeThatFits:", v4, 3.40282347e38);
  double v7 = v6;

  return v7 + 10.0;
}

- (void)setKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(DMCProfileKeyValueView *)self keyLabel];
  [v8 setText:v7];

  double v9 = [(DMCProfileKeyValueView *)self valueLabel];
  [v9 setText:v6];

  [(DMCProfileKeyValueView *)self setNeedsLayout];
}

- (void)setItemDetail:(id)a3
{
  id v4 = a3;
  double v5 = [v4 title];
  id v6 = [(DMCProfileKeyValueView *)self keyLabel];
  [v6 setText:v5];

  id v7 = [v4 detail];
  double v8 = [(DMCProfileKeyValueView *)self valueLabel];
  [v8 setText:v7];

  double v9 = [v4 trustText];

  double v10 = [(DMCProfileKeyValueView *)self verifiedLabel];
  [v10 setAttributedText:v9];

  [(DMCProfileKeyValueView *)self setNeedsLayout];
}

- (void)setPreferredValueLabelOriginX:(double)a3
{
  if (a3 >= 0.0 && self->_preferredValueLabelOriginX != a3)
  {
    self->_preferredValueLabelOriginX = a3;
    [(DMCProfileKeyValueView *)self setNeedsLayout];
  }
}

- (id)_captionFontBold:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D270]];
  double v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 fontDescriptorWithSymbolicTraits:2];

    double v5 = (void *)v6;
  }
  id v7 = [MEMORY[0x263F81708] fontWithDescriptor:v5 size:0.0];

  return v7;
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

- (void)setVerifiedLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifiedLabel, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_keyLabel, 0);
}

@end