@interface GKLabel
+ (void)initialize;
- (BOOL)shouldEnforcePreferredWidth;
- (BOOL)shouldInhibitReplay;
- (BOOL)usingAttributedText;
- (CGSize)intrinsicContentSize;
- (CGSize)shrinkFontToFitSize:(CGSize)a3;
- (GKLabel)initWithFrame:(CGRect)a3;
- (GKTextStyle)appliedStyle;
- (GKTextStyle)baseStyle;
- (UIEdgeInsets)titleEdgeInsets;
- (double)actualFontShrinkageFactor;
- (void)applyTextStyle:(id)a3;
- (void)replayAndApplyStyleUnlessInhibited;
- (void)replayAndApplyStyleWithSystemContentChange:(BOOL)a3;
- (void)setActualFontShrinkageFactor:(double)a3;
- (void)setAppliedStyle:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setBaseStyle:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setShouldEnforcePreferredWidth:(BOOL)a3;
- (void)setShouldInhibitReplay:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTitleEdgeInsets:(UIEdgeInsets)a3;
- (void)shrinkFontToFitWidth;
- (void)updateConstraints;
@end

@implementation GKLabel

- (void)replayAndApplyStyleUnlessInhibited
{
  if (![(GKLabel *)self shouldInhibitReplay])
  {
    [(GKLabel *)self replayAndApplyStyleWithSystemContentChange:0];
  }
}

- (void)replayAndApplyStyleWithSystemContentChange:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(GKLabel *)self usingAttributedText];
  baseStyle = self->_baseStyle;
  if (v5)
  {
    if (!baseStyle) {
      return;
    }
    v7 = [(GKLabel *)self attributedText];
    v8 = [MEMORY[0x1E4F639F8] attributedString:v7 byReplayingFromBaseStyle:self->_baseStyle systemContentSizeDidChange:v3];
    if (v8 != v7)
    {
      v13.receiver = self;
      v13.super_class = (Class)GKLabel;
      [(GKLabel *)&v13 setAttributedText:v8];
    }
  }
  else
  {
    v7 = baseStyle;
    appliedStyle = self->_appliedStyle;
    if (appliedStyle)
    {
      uint64_t v10 = [(GKTextStyle *)appliedStyle replayOnBaseStyle:self->_baseStyle systemContentSizeDidChange:v3];

      v7 = (GKTextStyle *)v10;
    }
    if (!v7) {
      goto LABEL_10;
    }
    double v12 = 0.0;
    v8 = [(GKTextStyle *)v7 resolveFontAndLineSpacing:&v12];
    [(GKLabel *)self setFont:v8];
    v11 = [(GKTextStyle *)v7 color];
    [(GKLabel *)self setTextColor:v11];

    [(GKLabel *)self setLineBreakMode:[(GKTextStyle *)v7 lineBreakMode]];
    [(GKLabel *)self setTextAlignment:[(GKTextStyle *)v7 textAlignment]];
    [(GKLabel *)self setLineSpacing:(uint64_t)v12];
  }

LABEL_10:
}

- (GKTextStyle)baseStyle
{
  return self->_baseStyle;
}

- (void)setBaseStyle:(id)a3
{
  BOOL v5 = (GKTextStyle *)a3;
  p_baseStyle = &self->_baseStyle;
  if (self->_baseStyle != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_baseStyle, a3);
    p_baseStyle = (GKTextStyle **)[(GKLabel *)self replayAndApplyStyleWithSystemContentChange:0];
    BOOL v5 = v7;
  }

  MEMORY[0x1F41817F8](p_baseStyle, v5);
}

- (CGSize)intrinsicContentSize
{
  v16.receiver = self;
  v16.super_class = (Class)GKLabel;
  [(GKLabel *)&v16 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(GKLabel *)self titleEdgeInsets];
  double v8 = v7;
  [(GKLabel *)self titleEdgeInsets];
  double v10 = v4 + v8 + v9;
  [(GKLabel *)self titleEdgeInsets];
  double v12 = v11;
  [(GKLabel *)self titleEdgeInsets];
  double v14 = v6 + v12 + v13;
  double v15 = v10;
  result.height = v14;
  result.width = v15;
  return result;
}

+ (void)initialize
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  v21[0] = objc_opt_class();
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  double v4 = [v2 appearanceWhenContainedInInstancesOfClasses:v3];

  id v5 = objc_alloc_init(MEMORY[0x1E4F63A08]);
  [v4 setBaseStyle:v5];

  double v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceIdiom:1];
  double v7 = [MEMORY[0x1E4FB1E20] traitCollectionWithHorizontalSizeClass:1];
  double v8 = (void *)MEMORY[0x1E4FB1E20];
  v20[0] = v6;
  v20[1] = v7;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  double v10 = [v8 traitCollectionWithTraitsFromCollections:v9];

  double v11 = [(id)objc_opt_class() appearanceForTraitCollection:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F63A08]);
  [v11 setBaseStyle:v12];

  double v13 = [MEMORY[0x1E4FB1E20] traitCollectionWithHorizontalSizeClass:2];
  double v14 = (void *)MEMORY[0x1E4FB1E20];
  v19[0] = v6;
  v19[1] = v13;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  objc_super v16 = [v14 traitCollectionWithTraitsFromCollections:v15];

  v17 = [(id)objc_opt_class() appearanceForTraitCollection:v16];
  id v18 = objc_alloc_init(MEMORY[0x1E4F63A00]);
  [v17 setBaseStyle:v18];
}

- (GKLabel)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKLabel;
  double v3 = -[GKLabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v6 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v6 = 0), v6)) {
      double v7 = (Class *)0x1E4F63A08;
    }
    else {
      double v7 = (Class *)0x1E4F63A00;
    }
    id v8 = objc_alloc_init(*v7);
    objc_storeStrong((id *)&v3->_baseStyle, v8);
  }
  return v3;
}

- (void)setAttributedText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKLabel;
  [(GKLabel *)&v4 setAttributedText:a3];
  self->_usingAttributedText = 1;
  [(GKLabel *)self replayAndApplyStyleUnlessInhibited];
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKLabel;
  [(GKLabel *)&v4 setText:a3];
  self->_usingAttributedText = 0;
}

- (void)applyTextStyle:(id)a3
{
  p_appliedStyle = &self->_appliedStyle;
  BOOL v6 = (GKTextStyle *)a3;
  double v7 = v6;
  if (*p_appliedStyle != v6)
  {
    objc_storeStrong((id *)&self->_appliedStyle, a3);
    BOOL v6 = *p_appliedStyle;
  }
  if (v6) {
    [(GKLabel *)self replayAndApplyStyleWithSystemContentChange:0];
  }
}

- (double)actualFontShrinkageFactor
{
  double result = self->_actualFontShrinkageFactor;
  if (result == 0.0) {
    return 1.0;
  }
  return result;
}

- (void)shrinkFontToFitWidth
{
}

- (CGSize)shrinkFontToFitSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v41[2] = *MEMORY[0x1E4F143B8];
  [(GKLabel *)self replayAndApplyStyleUnlessInhibited];
  if (width == 0.0 || (v39 = height, double v6 = width, height == 0.0))
  {
    [(GKLabel *)self frame];
    double v39 = v8;
    if (v7 == 0.0)
    {
      double v28 = height;
      double v27 = width;
      goto LABEL_30;
    }
    double v6 = v7;
  }
  double v9 = [(GKLabel *)self text];
  if ([(GKLabel *)self numberOfLines] == 1)
  {
    objc_super v10 = 0;
    uint64_t v11 = 2;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    double v13 = [v9 componentsSeparatedByCharactersInSet:v12];

    if ((unint64_t)[v13 count] < 2)
    {
      objc_super v10 = 0;
      uint64_t v11 = 2;
    }
    else
    {
      objc_super v10 = [v13 objectAtIndexedSubscript:0];
      uint64_t v11 = 0;
    }
  }
  double v14 = [(GKLabel *)self font];
  [v14 pointSize];
  double v16 = v15;
  [(GKLabel *)self minimumScaleFactor];
  double v18 = v16 * v17;
  v19 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  v20 = (void *)[v19 mutableCopy];

  [v20 setLineBreakMode:v11];
  LODWORD(v21) = *(_DWORD *)"333?";
  [v20 setHyphenationFactor:v21];
  double v38 = v16;
  if (v16 >= v18)
  {
    uint64_t v22 = *MEMORY[0x1E4FB06F8];
    uint64_t v23 = *MEMORY[0x1E4FB0738];
    while (1)
    {
      v40[0] = v22;
      v40[1] = v23;
      v41[0] = v14;
      v41[1] = v20;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
      objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v24, 0, v6, 1.79769313e308);
      double v27 = v26;
      double v28 = v25;
      if (v26 < v6 && v25 < v39)
      {
        if (!v10) {
          break;
        }
        objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v24, 0, 1.79769313e308, v25);
        if (v30 < v6) {
          break;
        }
      }
      double v16 = v16 + -0.5;
      v31 = [v14 fontWithSize:v16];

      double width = v27;
      double height = v28;
      double v14 = v31;
      if (v16 < v18) {
        goto LABEL_24;
      }
    }
  }
  v31 = v14;
  double v28 = height;
  double v27 = width;
LABEL_24:
  if (v16 != v38)
  {
    [(GKLabel *)self setFont:v31];
    v32 = [(GKLabel *)self attributedText];

    if (v32)
    {
      v33 = [(GKLabel *)self attributedText];
      v34 = [v33 attributesAtIndex:0 effectiveRange:0];

      v35 = [v34 objectForKeyedSubscript:@"GKRecorderAttribute"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v35 setFontSize:0 rebaseSelector:v16];
      }
    }
  }
  [(GKLabel *)self setActualFontShrinkageFactor:v16 / v38];

LABEL_30:
  double v36 = v27;
  double v37 = v28;
  result.double height = v37;
  result.double width = v36;
  return result;
}

- (void)updateConstraints
{
  if ([(GKLabel *)self shouldEnforcePreferredWidth])
  {
    [(GKLabel *)self bounds];
    double Width = CGRectGetWidth(v6);
    [(GKLabel *)self preferredMaxLayoutWidth];
    if (v4 != Width) {
      [(GKLabel *)self setPreferredMaxLayoutWidth:Width];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)GKLabel;
  [(GKLabel *)&v5 updateConstraints];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(GKLabel *)self shouldEnforcePreferredWidth])
  {
    v10.origin.double x = x;
    v10.origin.double y = y;
    v10.size.double width = width;
    v10.size.double height = height;
    double v8 = CGRectGetWidth(v10);
    [(GKLabel *)self bounds];
    if (v8 != CGRectGetWidth(v11)) {
      [(GKLabel *)self setNeedsUpdateConstraints];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)GKLabel;
  -[GKLabel setBounds:](&v9, sel_setBounds_, x, y, width, height);
}

- (BOOL)shouldEnforcePreferredWidth
{
  return self->_shouldEnforcePreferredWidth;
}

- (void)setShouldEnforcePreferredWidth:(BOOL)a3
{
  self->_shouldEnforcePreferreddouble Width = a3;
}

- (BOOL)usingAttributedText
{
  return self->_usingAttributedText;
}

- (BOOL)shouldInhibitReplay
{
  return self->_shouldInhibitReplay;
}

- (void)setShouldInhibitReplay:(BOOL)a3
{
  self->_shouldInhibitRepladouble y = a3;
}

- (void)setActualFontShrinkageFactor:(double)a3
{
  self->_actualFontShrinkageFactor = a3;
}

- (UIEdgeInsets)titleEdgeInsets
{
  double top = self->_titleEdgeInsets.top;
  double left = self->_titleEdgeInsets.left;
  double bottom = self->_titleEdgeInsets.bottom;
  double right = self->_titleEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)a3
{
  self->_titleEdgeInsets = a3;
}

- (GKTextStyle)appliedStyle
{
  return self->_appliedStyle;
}

- (void)setAppliedStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appliedStyle, 0);

  objc_storeStrong((id *)&self->_baseStyle, 0);
}

@end