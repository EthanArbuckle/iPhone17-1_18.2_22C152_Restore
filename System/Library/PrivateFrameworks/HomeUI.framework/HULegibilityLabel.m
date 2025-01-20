@interface HULegibilityLabel
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)adjustsFontSizeToFitWidth;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HULegibilityLabel)initWithCoder:(id)a3;
- (HULegibilityLabel)initWithFrame:(CGRect)a3;
- (HULegibilityLabel)initWithSettings:(id)a3 strength:(double)a4;
- (HULegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6;
- (HULegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6 options:(int64_t)a7;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIColor)textColor;
- (UIEdgeInsets)characterOverflowInsets;
- (UIFont)font;
- (_UILegibilitySettings)legibilitySettings;
- (double)firstBaselineOffsetFromBottom;
- (double)lastBaselineOffsetFromBottom;
- (double)minimumScaleFactor;
- (double)strength;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)lineBreakMode;
- (int64_t)numberOfLines;
- (int64_t)textAlignment;
- (void)_markOurselfDirty;
- (void)_updateLabelForLegibilitySettings;
- (void)_updateLegibilityView;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setOptions:(int64_t)a3;
- (void)setStrength:(double)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation HULegibilityLabel

- (HULegibilityLabel)initWithFrame:(CGRect)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F43228], "sharedInstanceForStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [(HULegibilityLabel *)self initWithSettings:v4 strength:*MEMORY[0x1E4F440D8]];

  return v5;
}

- (HULegibilityLabel)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"HULegibilityLabel.m" lineNumber:54 description:@"Not supported"];

  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);

  return -[HULegibilityLabel initWithFrame:](self, "initWithFrame:", v6, v7, v8, v9);
}

- (HULegibilityLabel)initWithSettings:(id)a3 strength:(double)a4
{
  double v6 = (void *)MEMORY[0x1E4F42A30];
  id v7 = a3;
  [v6 systemFontSize];
  double v8 = objc_msgSend(v6, "systemFontOfSize:");
  double v9 = [(HULegibilityLabel *)self initWithSettings:v7 strength:0 text:v8 font:a4];

  return v9;
}

- (HULegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6
{
  return [(HULegibilityLabel *)self initWithSettings:a3 strength:a5 text:a6 font:0 options:a4];
}

- (HULegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6 options:(int64_t)a7
{
  v74[4] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v72.receiver = self;
  v72.super_class = (Class)HULegibilityLabel;
  double v16 = *MEMORY[0x1E4F1DB28];
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v20 = -[HULegibilityLabel initWithFrame:](&v72, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v17, v18, v19);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_legibilitySettings, a3);
    v21->_strength = a4;
    uint64_t v22 = [v14 copy];
    text = v21->_text;
    v21->_text = (NSString *)v22;

    objc_storeStrong((id *)&v21->_font, a6);
    v21->_options = a7;
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v16, v17, v18, v19);
    id v71 = v13;
    lookasideLabel = v21->_lookasideLabel;
    v21->_lookasideLabel = (UILabel *)v24;

    [(UILabel *)v21->_lookasideLabel setTextAlignment:1];
    [(UILabel *)v21->_lookasideLabel setLineBreakMode:5];
    [(UILabel *)v21->_lookasideLabel setClipsToBounds:0];
    [(UILabel *)v21->_lookasideLabel setHidden:1];
    [(UILabel *)v21->_lookasideLabel setText:v21->_text];
    [(UILabel *)v21->_lookasideLabel setFont:v21->_font];
    [(UILabel *)v21->_lookasideLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HULegibilityLabel *)v21 addSubview:v21->_lookasideLabel];
    v57 = (void *)MEMORY[0x1E4F28DC8];
    v67 = [(UILabel *)v21->_lookasideLabel topAnchor];
    v65 = [(HULegibilityLabel *)v21 topAnchor];
    v63 = [v67 constraintEqualToAnchor:v65];
    v74[0] = v63;
    v61 = [(UILabel *)v21->_lookasideLabel leadingAnchor];
    v59 = [(HULegibilityLabel *)v21 leadingAnchor];
    [v61 constraintEqualToAnchor:v59];
    v26 = id v69 = v15;
    v74[1] = v26;
    v27 = [(UILabel *)v21->_lookasideLabel trailingAnchor];
    v28 = [(HULegibilityLabel *)v21 trailingAnchor];
    [v27 constraintEqualToAnchor:v28];
    v29 = id v70 = v14;
    v74[2] = v29;
    v30 = [(UILabel *)v21->_lookasideLabel heightAnchor];
    v31 = [(HULegibilityLabel *)v21 heightAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    v74[3] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
    [v57 activateConstraints:v33];

    v34 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    firstBaselineLayoutGuide = v21->_firstBaselineLayoutGuide;
    v21->_firstBaselineLayoutGuide = v34;

    [(HULegibilityLabel *)v21 addLayoutGuide:v21->_firstBaselineLayoutGuide];
    v36 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    lastBaselineLayoutGuide = v21->_lastBaselineLayoutGuide;
    v21->_lastBaselineLayoutGuide = v36;

    [(HULegibilityLabel *)v21 addLayoutGuide:v21->_lastBaselineLayoutGuide];
    v54 = (void *)MEMORY[0x1E4F28DC8];
    v68 = [(UILayoutGuide *)v21->_firstBaselineLayoutGuide topAnchor];
    v66 = [(UILabel *)v21->_lookasideLabel firstBaselineAnchor];
    v64 = [v68 constraintEqualToAnchor:v66];
    v73[0] = v64;
    v62 = [(UILayoutGuide *)v21->_firstBaselineLayoutGuide heightAnchor];
    v60 = [v62 constraintEqualToConstant:0.0];
    v73[1] = v60;
    v58 = [(UILayoutGuide *)v21->_firstBaselineLayoutGuide leadingAnchor];
    v56 = [(HULegibilityLabel *)v21 leadingAnchor];
    v55 = [v58 constraintEqualToAnchor:v56];
    v73[2] = v55;
    v53 = [(UILayoutGuide *)v21->_firstBaselineLayoutGuide trailingAnchor];
    v52 = [(HULegibilityLabel *)v21 trailingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v73[3] = v51;
    v50 = [(UILayoutGuide *)v21->_lastBaselineLayoutGuide topAnchor];
    v49 = [(UILabel *)v21->_lookasideLabel lastBaselineAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v73[4] = v48;
    v38 = [(UILayoutGuide *)v21->_lastBaselineLayoutGuide heightAnchor];
    v39 = [v38 constraintEqualToConstant:0.0];
    v73[5] = v39;
    v40 = [(UILayoutGuide *)v21->_lastBaselineLayoutGuide leadingAnchor];
    v41 = [(HULegibilityLabel *)v21 leadingAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v73[6] = v42;
    v43 = [(UILayoutGuide *)v21->_lastBaselineLayoutGuide trailingAnchor];
    v44 = [(HULegibilityLabel *)v21 trailingAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v73[7] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:8];
    [v54 activateConstraints:v46];

    id v15 = v69;
    id v14 = v70;

    id v13 = v71;
    [(HULegibilityLabel *)v21 _markOurselfDirty];
  }

  return v21;
}

- (void)setAttributedText:(id)a3
{
  v4 = (NSAttributedString *)a3;
  attributedText = self->_attributedText;
  if (attributedText != v4)
  {
    double v9 = v4;
    BOOL v6 = [(NSAttributedString *)attributedText isEqualToAttributedString:v4];
    v4 = v9;
    if (!v6)
    {
      id v7 = (NSAttributedString *)[(NSAttributedString *)v9 copy];
      double v8 = self->_attributedText;
      self->_attributedText = v7;

      [(UILabel *)self->_lookasideLabel setAttributedText:self->_attributedText];
      [(HULegibilityLabel *)self _markOurselfDirty];
      v4 = v9;
    }
  }
}

- (void)setText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    text = self->_text;
    self->_text = v4;

    [(UILabel *)self->_lookasideLabel setText:self->_text];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (UIColor)textColor
{
  textColorOverride = self->_textColorOverride;
  if (textColorOverride)
  {
    v3 = textColorOverride;
  }
  else
  {
    v3 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  }

  return v3;
}

- (void)setTextColor:(id)a3
{
  p_textColorOverride = &self->_textColorOverride;
  id v6 = a3;
  if ((-[UIColor isEqual:](*p_textColorOverride, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColorOverride, a3);
    [(UILabel *)self->_lookasideLabel setTextColor:*p_textColorOverride];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (void)setFont:(id)a3
{
  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    objc_storeStrong((id *)&self->_font, a3);
    [(UILabel *)self->_lookasideLabel setFont:v5];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (int64_t)textAlignment
{
  return [(UILabel *)self->_lookasideLabel textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
  if ([(UILabel *)self->_lookasideLabel textAlignment] != a3)
  {
    [(UILabel *)self->_lookasideLabel setTextAlignment:a3];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (int64_t)lineBreakMode
{
  return [(UILabel *)self->_lookasideLabel lineBreakMode];
}

- (void)setLineBreakMode:(int64_t)a3
{
  if ([(UILabel *)self->_lookasideLabel lineBreakMode] != a3)
  {
    [(UILabel *)self->_lookasideLabel setLineBreakMode:a3];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return [(UILabel *)self->_lookasideLabel adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UILabel *)self->_lookasideLabel adjustsFontForContentSizeCategory] != a3)
  {
    [(UILabel *)self->_lookasideLabel setAdjustsFontForContentSizeCategory:v3];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (int64_t)numberOfLines
{
  return [(UILabel *)self->_lookasideLabel numberOfLines];
}

- (void)setNumberOfLines:(int64_t)a3
{
  if ([(UILabel *)self->_lookasideLabel numberOfLines] != a3)
  {
    [(UILabel *)self->_lookasideLabel setNumberOfLines:a3];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return [(UILabel *)self->_lookasideLabel adjustsFontSizeToFitWidth];
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UILabel *)self->_lookasideLabel adjustsFontSizeToFitWidth] != a3)
  {
    [(UILabel *)self->_lookasideLabel setAdjustsFontSizeToFitWidth:v3];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (double)minimumScaleFactor
{
  [(UILabel *)self->_lookasideLabel minimumScaleFactor];
  return result;
}

- (void)setMinimumScaleFactor:(double)a3
{
  [(UILabel *)self->_lookasideLabel minimumScaleFactor];
  if (v5 != a3)
  {
    [(UILabel *)self->_lookasideLabel setMinimumScaleFactor:a3];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (void)setOptions:(int64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    -[_UILegibilityView setOptions:](self->_legibilityView, "setOptions:");
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (double)firstBaselineOffsetFromBottom
{
  [(HULegibilityLabel *)self bounds];
  double Height = CGRectGetHeight(v6);
  [(UILabel *)self->_lookasideLabel effectiveFirstBaselineOffsetFromTop];
  return Height - v4;
}

- (double)lastBaselineOffsetFromBottom
{
  [(UILabel *)self->_lookasideLabel effectiveBaselineOffsetFromBottom];
  return result;
}

- (UIEdgeInsets)characterOverflowInsets
{
  [(UILabel *)self->_lookasideLabel _contentInsetsFromFonts];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  return self->_lookasideLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_lookasideLabel;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(HULegibilityLabel *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)HULegibilityLabel;
  -[HULegibilityLabel setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(UILabel *)self->_lookasideLabel setNeedsLayout];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(HULegibilityLabel *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)HULegibilityLabel;
  -[HULegibilityLabel setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(UILabel *)self->_lookasideLabel setNeedsLayout];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_lookasideLabel, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HULegibilityLabel;
  [(HULegibilityLabel *)&v3 layoutSubviews];
  if (self->_isDirty)
  {
    [(HULegibilityLabel *)self _updateLegibilityView];
    self->_isDirtdouble y = 0;
  }
}

- (void)setStrength:(double)a3
{
  if ((NACGFloatEqualToFloat() & 1) == 0)
  {
    self->_strength = a3;
    [(_UILegibilityView *)self->_legibilityView setStrength:a3];
    [(HULegibilityLabel *)self _markOurselfDirty];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  p_legibilitySettings = &self->_legibilitySettings;
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  id v6 = a3;
  [(_UILegibilityView *)self->_legibilityView updateForChangedSettings:*p_legibilitySettings];
}

- (void)_markOurselfDirty
{
  self->_isDirtdouble y = 1;
  [(HULegibilityLabel *)self setNeedsLayout];
}

- (void)_updateLabelForLegibilitySettings
{
  objc_super v3 = [(UILabel *)self->_lookasideLabel attributedText];
  id v7 = (id)[v3 mutableCopy];

  uint64_t v4 = [v7 length];
  double v5 = [(HULegibilityLabel *)self textColor];
  uint64_t v6 = *MEMORY[0x1E4F42510];
  if (v5) {
    objc_msgSend(v7, "addAttribute:value:range:", v6, v5, 0, v4);
  }
  else {
    objc_msgSend(v7, "removeAttribute:range:", v6, 0, v4);
  }
  [(UILabel *)self->_lookasideLabel setAttributedText:v7];
}

- (void)_updateLegibilityView
{
  [(HULegibilityLabel *)self _updateLabelForLegibilitySettings];
  [(HULegibilityLabel *)self bounds];
  CGFloat x = v62.origin.x;
  CGFloat y = v62.origin.y;
  double width = v62.size.width;
  double height = v62.size.height;
  CGRectGetWidth(v62);
  if ((NACGFloatIsZero() & 1) == 0)
  {
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.double width = width;
    v63.size.double height = height;
    CGRectGetHeight(v63);
    if ((NACGFloatIsZero() & 1) == 0)
    {
      double v58 = y;
      double v56 = x;
      id v7 = [(HULegibilityLabel *)self traitCollection];
      [v7 displayScale];
      double v54 = v8;

      [(HULegibilityLabel *)self characterOverflowInsets];
      double v52 = v9;
      double v53 = v10;
      double v59 = v11;
      double v57 = v12;
      [(UILabel *)self->_lookasideLabel bounds];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_lookasideLabel, "textRectForBounds:limitedToNumberOfLines:", [(UILabel *)self->_lookasideLabel numberOfLines], v13, v15, v17, v19);
      double v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      double v28 = v27;
      v64.origin.CGFloat x = v14;
      v64.origin.CGFloat y = v16;
      v64.size.double width = v18;
      CGFloat v29 = v22;
      v64.size.double height = v20;
      CGFloat v30 = v28;
      double v31 = CGRectGetHeight(v64);
      CGFloat v55 = v29;
      v65.origin.CGFloat x = v29;
      v65.origin.CGFloat y = v24;
      v65.size.double width = v26;
      v65.size.double height = v30;
      double v32 = (v31 - CGRectGetHeight(v65)) * 0.5;
      if ([(UILabel *)self->_lookasideLabel adjustsFontSizeToFitWidth])
      {
        CGFloat v33 = v56;
        CGFloat v34 = v58;
      }
      else
      {
        v66.origin.CGFloat x = v29;
        v66.origin.CGFloat y = v32;
        v66.size.double width = v26;
        v66.size.double height = v30;
        double MinX = CGRectGetMinX(v66);
        v67.origin.CGFloat x = v56;
        v67.origin.CGFloat y = v58;
        v67.size.double width = width;
        v67.size.double height = height;
        double v59 = v59 + MinX - CGRectGetMinX(v67);
        v68.origin.CGFloat x = v29;
        v68.origin.CGFloat y = v32;
        v68.size.double width = v26;
        v68.size.double height = v30;
        double MaxX = CGRectGetMaxX(v68);
        CGFloat v33 = v56;
        v69.origin.CGFloat x = v56;
        CGFloat v34 = v58;
        v69.origin.CGFloat y = v58;
        v69.size.double width = width;
        v69.size.double height = height;
        double v57 = v57 - (MaxX - CGRectGetMaxX(v69));
      }
      CGFloat v51 = v30;
      v70.origin.CGFloat x = v55;
      v70.origin.CGFloat y = v32;
      v70.size.double width = v26;
      v70.size.double height = v30;
      CGFloat v36 = v26;
      CGFloat v37 = v32;
      double MinY = CGRectGetMinY(v70);
      v71.origin.CGFloat x = v33;
      v71.origin.CGFloat y = v34;
      v71.size.double width = width;
      v71.size.double height = height;
      CGFloat v39 = CGRectGetMinY(v71);
      v72.size.double height = v51;
      double v40 = v52 + MinY - v39;
      v72.origin.CGFloat x = v55;
      v72.origin.CGFloat y = v37;
      v72.size.double width = v36;
      double v41 = v40;
      double MaxY = CGRectGetMaxY(v72);
      v73.origin.CGFloat x = v33;
      v73.origin.CGFloat y = v34;
      v73.size.double width = width;
      v73.size.double height = height;
      double v43 = v53 - (MaxY - CGRectGetMaxY(v73));
      HUSizeRoundForScale(width - (v57 + v59), height - (v41 + v43), v54);
      objc_initWeak(&location, self);
      v44 = [MEMORY[0x1E4F42D90] mainScreen];
      [v44 scale];
      objc_copyWeak(v60, &location);
      v60[1] = *(id *)&v41;
      v60[2] = *(id *)&v59;
      v60[3] = *(id *)&v43;
      v60[4] = *(id *)&v57;
      v60[5] = *(id *)&v56;
      v60[6] = *(id *)&v58;
      v60[7] = *(id *)&width;
      v60[8] = *(id *)&height;
      v45 = _UIGraphicsDrawIntoImageContextWithOptions();

      legibilityConstraints = self->_legibilityConstraints;
      self->_legibilityConstraints = 0;

      [(_UILegibilityView *)self->_legibilityView removeFromSuperview];
      legibilityView = self->_legibilityView;
      self->_legibilityView = 0;

      v48 = (_UILegibilityView *)[objc_alloc(MEMORY[0x1E4F43238]) initWithSettings:self->_legibilitySettings strength:v45 image:0 shadowImage:self->_options options:self->_strength];
      v49 = self->_legibilityView;
      self->_legibilityView = v48;

      -[_UILegibilityView setFrame:](self->_legibilityView, "setFrame:", v56 + v59, v58 + v41, width - (v57 + v59), height - (v41 + v43));
      [(HULegibilityLabel *)self addSubview:self->_legibilityView];

      objc_destroyWeak(v60);
      objc_destroyWeak(&location);
    }
  }
}

void __42__HULegibilityLabel__updateLegibilityView__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, -*(double *)(a1 + 48), -*(double *)(a1 + 40));
  CGContextGetCTM(&v4, CurrentContext);
  CGContextSetBaseCTM();
  objc_msgSend(WeakRetained[51], "drawRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_textColorOverride, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_firstBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_legibilityConstraints, 0);
  objc_storeStrong((id *)&self->_legibilityView, 0);

  objc_storeStrong((id *)&self->_lookasideLabel, 0);
}

@end