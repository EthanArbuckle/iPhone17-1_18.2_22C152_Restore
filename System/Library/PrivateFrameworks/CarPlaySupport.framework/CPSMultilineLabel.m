@interface CPSMultilineLabel
+ (_NSRange)_rangeOfTrailingWhiteSpace:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_statsForString:(id)a3 inRect:(CGRect)a4;
- (BOOL)_fitsInHeight:(double)a3 numberOfLines:(unint64_t)a4 rect:(CGRect)a5;
- (BOOL)debug;
- (BOOL)prefersFewerLines;
- (CGSize)intrinsicContentSize;
- (CPSMultilineLabel)initWithFrame:(CGRect)a3;
- (CPSMultilineLabelConfig)currentConfiguration;
- (CPSMultilineLabelDelegate)delegate;
- (NSArray)baselineOffsets;
- (NSArray)leadingOffsets;
- (NSAttributedString)attributedText;
- (NSLayoutConstraint)baselineViewBottomAnchor;
- (NSLayoutConstraint)baselineViewTopAnchor;
- (NSLayoutConstraint)textLayoutGuideLeadingConstraint;
- (NSLayoutConstraint)textLayoutGuideTrailingConstraint;
- (NSString)text;
- (UIColor)textColor;
- (UIFont)font;
- (UILayoutGuide)textLayoutGuide;
- (UIView)baselineView;
- (UIView)debugFirstBaselineView;
- (UIView)debugLastBaselineView;
- (__CTFrame)_textFrame:(id)a3 rect:(CGRect)a4;
- (double)_heightForAttributedString:(id)a3 inRect:(CGRect)a4;
- (double)lineSpacing;
- (double)minimumFontSize;
- (double)minimumScaleFactor;
- (id)_attributedStringWithSize:(double)a3;
- (id)_attributedTextForRect:(CGRect)a3;
- (id)_ellipsedString:(id)a3 inRect:(CGRect)a4;
- (id)firstBaselineAnchor;
- (id)lastBaselineAnchor;
- (int64_t)textAlignment;
- (unint64_t)effectiveNumberOfLines;
- (unint64_t)numberOfLines;
- (void)_updateBaselines;
- (void)_updateLayout;
- (void)_updateLayoutGuideConstraints;
- (void)drawRect:(CGRect)a3;
- (void)setBaselineOffsets:(id)a3;
- (void)setBaselineView:(id)a3;
- (void)setBaselineViewBottomAnchor:(id)a3;
- (void)setBaselineViewTopAnchor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDebug:(BOOL)a3;
- (void)setDebugFirstBaselineView:(id)a3;
- (void)setDebugLastBaselineView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setLeadingOffsets:(id)a3;
- (void)setLineSpacing:(double)a3;
- (void)setMinimumFontSize:(double)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)setPrefersFewerLines:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextLayoutGuideLeadingConstraint:(id)a3;
- (void)setTextLayoutGuideTrailingConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSMultilineLabel

- (CPSMultilineLabel)initWithFrame:(CGRect)a3
{
  v50[8] = *MEMORY[0x263EF8340];
  CGRect v49 = a3;
  SEL v47 = a2;
  v48 = 0;
  v46.receiver = self;
  v46.super_class = (Class)CPSMultilineLabel;
  v48 = -[CPSMultilineLabel initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v48, v48);
  if (v48)
  {
    uint64_t v3 = objc_opt_new();
    currentConfiguration = v48->_currentConfiguration;
    v48->_currentConfiguration = (CPSMultilineLabelConfig *)v3;

    id v23 = (id)[MEMORY[0x263F1C550] clearColor];
    -[CPSMultilineLabel setBackgroundColor:](v48, "setBackgroundColor:");

    v5 = (UIColor *)(id)[MEMORY[0x263F1C550] labelColor];
    textColor = v48->_textColor;
    v48->_textColor = v5;

    v48->_minimumScaleFactor = 1.0;
    v48->_minimumFontSize = -1.79769313e308;
    v48->_lineSpacing = -1.79769313e308;
    id v7 = objc_alloc(MEMORY[0x263F1CB60]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    baselineView = v48->_baselineView;
    v48->_baselineView = (UIView *)v8;

    [(UIView *)v48->_baselineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSMultilineLabel *)v48 addSubview:v48->_baselineView];
    id v24 = (id)[MEMORY[0x263F1C550] clearColor];
    -[UIView setBackgroundColor:](v48->_baselineView, "setBackgroundColor:");

    v10 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    textLayoutGuide = v48->_textLayoutGuide;
    v48->_textLayoutGuide = v10;

    [(CPSMultilineLabel *)v48 addLayoutGuide:v48->_textLayoutGuide];
    v26 = [(UIView *)v48->_baselineView topAnchor];
    id v25 = (id)[(CPSMultilineLabel *)v48 topAnchor];
    v12 = (NSLayoutConstraint *)(id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v26, "constraintEqualToAnchor:");
    baselineViewTopAnchor = v48->_baselineViewTopAnchor;
    v48->_baselineViewTopAnchor = v12;

    v28 = [(UIView *)v48->_baselineView bottomAnchor];
    id v27 = (id)[(CPSMultilineLabel *)v48 bottomAnchor];
    v14 = (NSLayoutConstraint *)(id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v28, "constraintEqualToAnchor:");
    baselineViewBottomAnchor = v48->_baselineViewBottomAnchor;
    v48->_baselineViewBottomAnchor = v14;

    v30 = [(UILayoutGuide *)v48->_textLayoutGuide leadingAnchor];
    id v29 = (id)[(CPSMultilineLabel *)v48 leadingAnchor];
    v16 = (NSLayoutConstraint *)(id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v30, "constraintEqualToAnchor:");
    textLayoutGuideLeadingConstraint = v48->_textLayoutGuideLeadingConstraint;
    v48->_textLayoutGuideLeadingConstraint = v16;

    v32 = [(UILayoutGuide *)v48->_textLayoutGuide trailingAnchor];
    id v31 = (id)[(CPSMultilineLabel *)v48 trailingAnchor];
    v18 = (NSLayoutConstraint *)(id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v32, "constraintEqualToAnchor:");
    textLayoutGuideTrailingConstraint = v48->_textLayoutGuideTrailingConstraint;
    v48->_textLayoutGuideTrailingConstraint = v18;

    v33 = (void *)MEMORY[0x263F08938];
    v50[0] = v48->_baselineViewTopAnchor;
    v50[1] = v48->_baselineViewBottomAnchor;
    v45 = [(UIView *)v48->_baselineView widthAnchor];
    v44 = [(NSLayoutDimension *)v45 constraintEqualToConstant:0.0];
    v50[2] = v44;
    v43 = [(UIView *)v48->_baselineView leadingAnchor];
    id v42 = (id)[(CPSMultilineLabel *)v48 leadingAnchor];
    id v41 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v43, "constraintEqualToAnchor:");
    v50[3] = v41;
    v50[4] = v48->_textLayoutGuideLeadingConstraint;
    v50[5] = v48->_textLayoutGuideTrailingConstraint;
    v40 = [(UILayoutGuide *)v48->_textLayoutGuide topAnchor];
    id v39 = (id)[(CPSMultilineLabel *)v48 topAnchor];
    id v38 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v40, "constraintEqualToAnchor:");
    v50[6] = v38;
    v37 = [(UILayoutGuide *)v48->_textLayoutGuide bottomAnchor];
    id v36 = (id)[(CPSMultilineLabel *)v48 bottomAnchor];
    id v35 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v37, "constraintEqualToAnchor:");
    v50[7] = v35;
    id v34 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:8];
    objc_msgSend(v33, "activateConstraints:");

    -[CPSMultilineLabel setContentHuggingPriority:forAxis:](v48, "setContentHuggingPriority:forAxis:", 1);
    LODWORD(v20) = 1148846080;
    [(CPSMultilineLabel *)v48 setContentHuggingPriority:0 forAxis:v20];
  }
  v22 = v48;
  objc_storeStrong((id *)&v48, 0);
  return v22;
}

- (void)setBounds:(CGRect)a3
{
  CGRect v6 = a3;
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSMultilineLabel;
  -[CPSMultilineLabel setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CPSMultilineLabel *)v5 _updateLayout];
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  CGRect v57 = a3;
  v56 = self;
  SEL v55 = a2;
  objc_super v3 = [(CPSMultilineLabel *)self text];
  BOOL v39 = v3 != 0;

  if (v39)
  {
    id v53 = [(CPSMultilineLabel *)v56 attributedText];
    CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
    CGContextClearRect(CurrentContext, v57);
    CGContextSaveGState(CurrentContext);
    if ([(CPSMultilineLabel *)v56 debug])
    {
      CGContextRef v37 = CurrentContext;
      id v38 = (id)[MEMORY[0x263F1C550] yellowColor];
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v38 CGColor]);

      CGContextFillRect(CurrentContext, v57);
    }
    CGContextRef v33 = CurrentContext;
    [(CPSMultilineLabel *)v56 bounds];
    uint64_t v48 = v4;
    uint64_t v49 = v5;
    uint64_t v50 = v6;
    CGFloat v51 = v7;
    CGContextTranslateCTM(CurrentContext, 0.0, v7);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    SEL v47 = -[CPSMultilineLabel _textFrame:rect:](v56, "_textFrame:rect:", v53, v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);
    CFArrayRef Lines = CTFrameGetLines(v47);
    unint64_t Count = CFArrayGetCount(Lines);
    v44[4] = &v9;
    unint64_t v34 = (16 * Count + 15) & 0xFFFFFFFFFFFFFFF0;
    MEMORY[0x270FA5388]();
    id v35 = (char *)&v9 - v34;
    v44[3] = v8;
    uint64_t v59 = 0;
    uint64_t v58 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    v44[1] = 0;
    v44[2] = 0;
    v63.id location = 0;
    v63.length = 0;
    CTFrameGetLineOrigins(v47, v63, (CGPoint *)((char *)&v9 - v34));
    unint64_t v36 = 0x263EFF000uLL;
    v44[0] = (id)objc_opt_new();
    id v43 = (id)objc_opt_new();
    for (int i = 0; i < Count; ++i)
    {
      id v28 = v44[0];
      unint64_t v30 = 0x263F08000uLL;
      id v29 = (id)[NSNumber numberWithDouble:*(double *)&v35[16 * i]];
      objc_msgSend(v28, "addObject:");

      id v31 = v43;
      id v32 = (id)[*(id *)(v30 + 2584) numberWithDouble:*(double *)&v35[16 * i + 8]];
      objc_msgSend(v31, "addObject:");
    }
    [(CPSMultilineLabel *)v56 setBaselineOffsets:v43];
    [(CPSMultilineLabel *)v56 setLeadingOffsets:v44[0]];
    CTFrameDraw(v47, CurrentContext);
    CFRelease(v47);
    CGContextRestoreGState(CurrentContext);
    [(CPSMultilineLabel *)v56 _updateBaselines];
    [(CPSMultilineLabel *)v56 _updateLayoutGuideConstraints];
    v15 = [(CPSMultilineLabel *)v56 currentConfiguration];
    id v41 = (id)[(CPSMultilineLabelConfig *)v15 copy];

    unint64_t v16 = Count;
    v17 = [(CPSMultilineLabel *)v56 currentConfiguration];
    [(CPSMultilineLabelConfig *)v17 setLineCount:v16];

    id location = (id)[v53 attributesAtIndex:0 effectiveRange:0];
    id v19 = (id)[location objectForKeyedSubscript:*MEMORY[0x263F039A0]];
    v18 = [(CPSMultilineLabel *)v56 currentConfiguration];
    [(CPSMultilineLabelConfig *)v18 setFont:v19];

    id v21 = (id)[v53 string];
    double v20 = [(CPSMultilineLabel *)v56 currentConfiguration];
    [(CPSMultilineLabelConfig *)v20 setText:v21];

    id v22 = v53;
    id v23 = [(CPSMultilineLabel *)v56 currentConfiguration];
    [(CPSMultilineLabelConfig *)v23 setAttributedText:v22];

    v26 = [(CPSMultilineLabel *)v56 currentConfiguration];
    id v25 = [(CPSMultilineLabelConfig *)v26 attributedText];
    id v24 = (id)[v41 attributedText];
    BOOL v27 = -[NSAttributedString isEqualToAttributedString:](v25, "isEqualToAttributedString:");

    if (!v27)
    {
      [(CPSMultilineLabel *)v56 invalidateIntrinsicContentSize];
      [(CPSMultilineLabel *)v56 setNeedsLayout];
    }
    id v12 = v41;
    v13 = [(CPSMultilineLabel *)v56 currentConfiguration];
    int v14 = objc_msgSend(v12, "isEqualToLabelConfig:");

    if ((v14 & 1) == 0)
    {
      v11 = [(CPSMultilineLabel *)v56 delegate];
      [(CPSMultilineLabelDelegate *)v11 labelDidUpdateCurrentConfig:v56];
    }
    id v10 = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v41, v10);
    objc_storeStrong(&v43, v10);
    objc_storeStrong(v44, v10);
    objc_storeStrong(&v53, v10);
  }
  else
  {
    CGContextRef v54 = UIGraphicsGetCurrentContext();
    CGContextClearRect(v54, v57);
    CGContextRestoreGState(v54);
  }
}

- (void)setText:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (![(NSString *)v6->_text isEqualToString:location[0]])
  {
    uint64_t v3 = [location[0] copy];
    text = v6->_text;
    v6->_text = (NSString *)v3;

    [(CPSMultilineLabel *)v6 _updateLayout];
  }
  objc_storeStrong(location, 0);
}

- (void)setTextColor:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (([(UIColor *)v4->_textColor isEqual:location[0]] & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_textColor, location[0]);
    [(CPSMultilineLabel *)v4 _updateLayout];
  }
  objc_storeStrong(location, 0);
}

- (unint64_t)effectiveNumberOfLines
{
  if ([(CPSMultilineLabel *)self numberOfLines]) {
    return [(CPSMultilineLabel *)self numberOfLines];
  }
  else {
    return -1;
  }
}

- (NSAttributedString)attributedText
{
  [(CPSMultilineLabel *)self bounds];
  return (NSAttributedString *)-[CPSMultilineLabel _attributedTextForRect:](self, "_attributedTextForRect:", v2, v3, v4, v5);
}

- (void)setDebug:(BOOL)a3
{
  v50[8] = *MEMORY[0x263EF8340];
  if (self->_debug != a3)
  {
    self->_debug = a3;
    if (a3)
    {
      id v3 = objc_alloc(MEMORY[0x263F1CB60]);
      v11 = (double *)MEMORY[0x263F001A8];
      id v6 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      -[CPSMultilineLabel setDebugFirstBaselineView:](self, "setDebugFirstBaselineView:");

      CGFloat v7 = [(CPSMultilineLabel *)self debugFirstBaselineView];
      [(UIView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];

      uint64_t v8 = [(CPSMultilineLabel *)self debugFirstBaselineView];
      -[CPSMultilineLabel addSubview:](self, "addSubview:");

      id v10 = (id)[MEMORY[0x263F1C550] greenColor];
      uint64_t v9 = [(CPSMultilineLabel *)self debugFirstBaselineView];
      [(UIView *)v9 setBackgroundColor:v10];

      id v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", *v11, v11[1], v11[2], v11[3]);
      -[CPSMultilineLabel setDebugLastBaselineView:](self, "setDebugLastBaselineView:");

      v13 = [(CPSMultilineLabel *)self debugLastBaselineView];
      [(UIView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];

      int v14 = [(CPSMultilineLabel *)self debugLastBaselineView];
      -[CPSMultilineLabel addSubview:](self, "addSubview:");

      id v16 = (id)[MEMORY[0x263F1C550] redColor];
      v15 = [(CPSMultilineLabel *)self debugLastBaselineView];
      [(UIView *)v15 setBackgroundColor:v16];

      [(CPSMultilineLabel *)self setNeedsDisplay];
      v17 = (void *)MEMORY[0x263F08938];
      uint64_t v48 = [(CPSMultilineLabel *)self debugFirstBaselineView];
      SEL v47 = [(UIView *)v48 leadingAnchor];
      id v46 = (id)[(CPSMultilineLabel *)self leadingAnchor];
      id v45 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v47, "constraintEqualToAnchor:constant:");
      v50[0] = v45;
      v44 = [(CPSMultilineLabel *)self debugFirstBaselineView];
      id v43 = [(UIView *)v44 trailingAnchor];
      id v42 = (id)[(CPSMultilineLabel *)self centerXAnchor];
      id v41 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v43, "constraintEqualToAnchor:constant:");
      v50[1] = v41;
      v40 = [(CPSMultilineLabel *)self debugFirstBaselineView];
      BOOL v39 = [(UIView *)v40 heightAnchor];
      id v38 = -[NSLayoutDimension constraintEqualToConstant:](v39, "constraintEqualToConstant:");
      v50[2] = v38;
      CGContextRef v37 = [(CPSMultilineLabel *)self debugFirstBaselineView];
      unint64_t v36 = [(UIView *)v37 topAnchor];
      id v35 = [(CPSMultilineLabel *)self firstBaselineAnchor];
      id v34 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v36, "constraintEqualToAnchor:");
      v50[3] = v34;
      CGContextRef v33 = [(CPSMultilineLabel *)self debugLastBaselineView];
      id v32 = [(UIView *)v33 leadingAnchor];
      id v31 = (id)[(CPSMultilineLabel *)self centerXAnchor];
      id v30 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v32, "constraintEqualToAnchor:constant:", -5.0);
      v50[4] = v30;
      id v29 = [(CPSMultilineLabel *)self debugLastBaselineView];
      id v28 = [(UIView *)v29 trailingAnchor];
      id v27 = (id)[(CPSMultilineLabel *)self trailingAnchor];
      id v26 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](v28, "constraintEqualToAnchor:constant:", 5.0);
      v50[5] = v26;
      id v25 = [(CPSMultilineLabel *)self debugLastBaselineView];
      id v24 = [(UIView *)v25 heightAnchor];
      id v23 = [(NSLayoutDimension *)v24 constraintEqualToConstant:1.0];
      v50[6] = v23;
      id v22 = [(CPSMultilineLabel *)self debugLastBaselineView];
      id v21 = [(UIView *)v22 topAnchor];
      id v20 = [(CPSMultilineLabel *)self lastBaselineAnchor];
      id v19 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v21, "constraintEqualToAnchor:");
      v50[7] = v19;
      id v18 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:8];
      objc_msgSend(v17, "activateConstraints:");
    }
    else
    {
      double v4 = [(CPSMultilineLabel *)self debugFirstBaselineView];
      [(UIView *)v4 removeFromSuperview];

      double v5 = [(CPSMultilineLabel *)self debugLastBaselineView];
      [(UIView *)v5 removeFromSuperview];

      -[CPSMultilineLabel setDebugFirstBaselineView:](self, "setDebugFirstBaselineView:");
      [(CPSMultilineLabel *)self setDebugLastBaselineView:0];
    }
  }
}

- (id)firstBaselineAnchor
{
  id v3 = [(CPSMultilineLabel *)self baselineView];
  double v4 = [(UIView *)v3 topAnchor];

  return v4;
}

- (id)lastBaselineAnchor
{
  id v3 = [(CPSMultilineLabel *)self baselineView];
  double v4 = [(UIView *)v3 bottomAnchor];

  return v4;
}

- (CGSize)intrinsicContentSize
{
  id v25 = self;
  SEL v24 = a2;
  uint64_t v23 = 0;
  uint64_t v23 = *MEMORY[0x263F1D7C8];
  id v18 = [(CPSMultilineLabel *)self text];
  BOOL v19 = [(NSString *)v18 length] == 0;

  if (!v19)
  {
    id v16 = [(CPSMultilineLabel *)v25 currentConfiguration];
    v17 = [(CPSMultilineLabelConfig *)v16 attributedText];
    char v20 = 0;
    if (v17)
    {
      double v2 = v17;
    }
    else
    {
      [(CPSMultilineLabel *)v25 bounds];
      CGRectMake();
      id v21 = -[CPSMultilineLabel _attributedTextForRect:](v25, "_attributedTextForRect:", v3, v4, v5, v6);
      char v20 = 1;
      double v2 = (NSAttributedString *)v21;
    }
    id v22 = v2;
    if (v20) {

    }
    int v14 = v25;
    v15 = v22;
    [(CPSMultilineLabel *)v25 bounds];
    -[CPSMultilineLabel _heightForAttributedString:inRect:](v14, "_heightForAttributedString:inRect:", v15, v7, v8, v9, v10);
    uint64_t v23 = v11;
    objc_storeStrong((id *)&v22, 0);
  }
  CGSizeMake_1();
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSMultilineLabel;
  [(CPSMultilineLabel *)&v3 traitCollectionDidChange:location[0]];
  [(CPSMultilineLabel *)v5 setNeedsDisplay];
  [(CPSMultilineLabel *)v5 setNeedsLayout];
  objc_storeStrong(location, 0);
}

- (void)_updateLayout
{
  double v2 = [(CPSMultilineLabel *)self currentConfiguration];
  [(CPSMultilineLabelConfig *)v2 setAttributedText:0];

  [(CPSMultilineLabel *)self setNeedsDisplay];
  [(CPSMultilineLabel *)self invalidateIntrinsicContentSize];
  objc_super v3 = [(CPSMultilineLabel *)self baselineViewTopAnchor];
  [(NSLayoutConstraint *)v3 setActive:0];

  double v4 = [(CPSMultilineLabel *)self baselineViewBottomAnchor];
  [(NSLayoutConstraint *)v4 setActive:0];
}

- (void)_updateBaselines
{
  v15 = [(CPSMultilineLabel *)self baselineViewTopAnchor];
  [(NSLayoutConstraint *)v15 setActive:1];

  id v16 = [(CPSMultilineLabel *)self baselineViewBottomAnchor];
  [(NSLayoutConstraint *)v16 setActive:1];

  v17 = [(CPSMultilineLabel *)self baselineOffsets];
  BOOL v18 = [(NSArray *)v17 count] == 0;

  if (v18)
  {
    double v9 = [(CPSMultilineLabel *)self baselineViewTopAnchor];
    [(NSLayoutConstraint *)v9 setConstant:0.0];
  }
  else
  {
    [(CPSMultilineLabel *)self bounds];
    double v10 = v2;
    int v14 = [(CPSMultilineLabel *)self baselineOffsets];
    id v13 = [(NSArray *)v14 firstObject];
    [v13 doubleValue];
    double v11 = v10 - v3;
    double v12 = [(CPSMultilineLabel *)self baselineViewTopAnchor];
    [(NSLayoutConstraint *)v12 setConstant:v11];
  }
  double v8 = [(CPSMultilineLabel *)self baselineOffsets];
  id v7 = [(NSArray *)v8 lastObject];
  [v7 doubleValue];
  double v5 = -v4;
  double v6 = [(CPSMultilineLabel *)self baselineViewBottomAnchor];
  [(NSLayoutConstraint *)v6 setConstant:v5];
}

- (void)_updateLayoutGuideConstraints
{
  int v14 = self;
  SEL v13 = a2;
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  int v10 = 0x20000000;
  int v11 = 32;
  uint64_t v12 = 0x7FEFFFFFFFFFFFFFLL;
  id v7 = [(CPSMultilineLabel *)self leadingOffsets];
  -[NSArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:");

  double v6 = v9[3];
  [(CPSMultilineLabel *)v14 bounds];
  if (v6 > CGRectGetWidth(v15)) {
    v9[3] = 0.0;
  }
  double v5 = v9[3];
  double v4 = [(CPSMultilineLabel *)v14 textLayoutGuideLeadingConstraint];
  [(NSLayoutConstraint *)v4 setConstant:v5];

  double v3 = -v9[3];
  double v2 = [(CPSMultilineLabel *)v14 textLayoutGuideTrailingConstraint];
  [(NSLayoutConstraint *)v2 setConstant:v3];

  _Block_object_dispose(&v8, 8);
}

void __50__CPSMultilineLabel__updateLayoutGuideConstraints__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  double v4 = *(double *)(*(void *)(a1[4] + 8) + 24);
  [location[0] doubleValue];
  *(double *)(*(void *)(a1[4] + 8) + 24) = fmin(v4, v2);
  objc_storeStrong(location, 0);
}

- (id)_attributedTextForRect:(CGRect)a3
{
  CGRect v26 = a3;
  id v25 = self;
  v24[1] = (id)a2;
  v24[0] = -[CPSMultilineLabel _attributedStringWithSize:](self, "_attributedStringWithSize:");
  -[CPSMultilineLabel _heightForAttributedString:inRect:](v25, "_heightForAttributedString:inRect:", v24[0], v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  double v23 = v3;
  -[CPSMultilineLabel _statsForString:inRect:](v25, "_statsForString:inRect:", v24[0], v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  uint64_t v22 = v4;
  [(CPSMultilineLabel *)v25 minimumScaleFactor];
  if (v5 >= 1.0)
  {
    [(CPSMultilineLabel *)v25 minimumFontSize];
    if (v12 > -1.79769313e308
      && !-[CPSMultilineLabel _fitsInHeight:numberOfLines:rect:](v25, "_fitsInHeight:numberOfLines:rect:", v22, v23, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height))
    {
      [(CPSMultilineLabel *)v25 minimumFontSize];
      id v13 = -[CPSMultilineLabel _attributedStringWithSize:](v25, "_attributedStringWithSize:");
      id v14 = v24[0];
      v24[0] = v13;
    }
  }
  else
  {
    BOOL v18 = [(CPSMultilineLabel *)v25 font];
    [(UIFont *)v18 pointSize];
    double v19 = v6;

    double v21 = v19;
    [(CPSMultilineLabel *)v25 minimumScaleFactor];
    double v20 = v19 * v7;
    while (1)
    {
      BOOL v17 = 0;
      if (!-[CPSMultilineLabel _fitsInHeight:numberOfLines:rect:](v25, "_fitsInHeight:numberOfLines:rect:", v22, v23, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height))BOOL v17 = v21 >= v20; {
      if (!v17)
      }
        break;
      double v21 = v21 - 0.100000001;
      id v8 = [(CPSMultilineLabel *)v25 _attributedStringWithSize:v21];
      id v9 = v24[0];
      v24[0] = v8;

      -[CPSMultilineLabel _heightForAttributedString:inRect:](v25, "_heightForAttributedString:inRect:", v24[0], v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
      double v23 = v10;
      -[CPSMultilineLabel _statsForString:inRect:](v25, "_statsForString:inRect:", v24[0], v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
      uint64_t v22 = v11;
    }
  }
  id v16 = -[CPSMultilineLabel _ellipsedString:inRect:](v25, "_ellipsedString:inRect:", v24[0], v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  objc_storeStrong(v24, 0);

  return v16;
}

- (id)_attributedStringWithSize:(double)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v59 = self;
  SEL v58 = a2;
  double v57 = a3;
  id v56 = (id)objc_opt_new();
  uint64_t v34 = 0;
  id v35 = [(CPSMultilineLabel *)v59 font];
  int v39 = 0;
  CTFontRef CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits((CTFontRef)v35, v57, 0, 0, 0);

  location[1] = CopyWithSymbolicTraits;
  CTFontRef v61 = CopyWithSymbolicTraits;
  CGContextRef v37 = CopyWithSymbolicTraits;
  objc_msgSend(v56, "setObject:forKeyedSubscript:");

  id v38 = [(CPSMultilineLabel *)v59 textColor];
  objc_msgSend(v56, "setObject:forKeyedSubscript:");

  location[0] = (id)objc_opt_new();
  CTTextAlignment v54 = NSTextAlignmentToCTTextAlignment((NSTextAlignment)[(CPSMultilineLabel *)v59 textAlignment]);
  char v52 = 0;
  BOOL v40 = 0;
  if (v54 == kCTTextAlignmentNatural)
  {
    id v53 = (id)[(CPSMultilineLabel *)v59 traitCollection];
    char v52 = 1;
    BOOL v40 = [v53 layoutDirection] == 1;
  }
  BOOL v33 = v40;
  if (v52) {

  }
  if (v33) {
    CTTextAlignment v54 = kCTTextAlignmentRight;
  }
  v51[0] = 0;
  v51[1] = 1;
  v51[2] = &v54;
  id v31 = location[0];
  id v32 = (id)[MEMORY[0x263F08D40] valueWithBytes:v51 objCType:"{CTParagraphStyleSetting=IQ^v}"];
  objc_msgSend(v31, "addObject:");

  [(CPSMultilineLabel *)v59 lineSpacing];
  if (v3 > -1.79769313e308)
  {
    double v23 = &v50;
    uint64_t v50 = 0;
    [(CPSMultilineLabel *)v59 lineSpacing];
    uint64_t v50 = v4;
    v49[0] = 14;
    v49[1] = 8;
    v49[2] = &v50;
    id v27 = v48;
    v48[0] = 15;
    v48[1] = 8;
    v48[2] = &v50;
    id v24 = location[0];
    unint64_t v26 = 0x263F08000uLL;
    id v28 = "{CTParagraphStyleSetting=IQ^v}";
    id v25 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithBytes:objCType:", v49);
    objc_msgSend(v24, "addObject:");

    id v29 = location[0];
    id v30 = (id)[MEMORY[0x263F08D40] valueWithBytes:v48 objCType:"{CTParagraphStyleSetting=IQ^v}"];
    objc_msgSend(v29, "addObject:");
  }
  if ([location[0] count])
  {
    SEL v47 = &v13;
    unint64_t v21 = (24 * [location[0] count] + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v5 = MEMORY[0x270FA5388]();
    uint64_t v22 = (const CTParagraphStyleSetting *)((char *)&v13 - v21);
    uint64_t v46 = v5;
    for (int i = 0; ; ++i)
    {
      unint64_t v20 = i;
      unint64_t v6 = [location[0] count];
      if (v20 >= v6) {
        break;
      }
      id v7 = (id)[location[0] objectAtIndexedSubscript:i];
      double v19 = &v44;
      id v44 = v7;
      long long v42 = 0uLL;
      id v43 = 0;
      [v7 getValue:&v42];
      id v8 = v19;
      id v9 = (CTParagraphStyleSetting *)&v22[i];
      *(_OWORD *)&v9->spec = v42;
      v9->value = v43;
      objc_storeStrong(v8, 0);
    }
    CTParagraphStyleRef v41 = 0;
    size_t v10 = [location[0] count];
    CTParagraphStyleRef v41 = CTParagraphStyleCreate(v22, v10);
    CTParagraphStyleRef v60 = v41;
    BOOL v18 = v41;
    objc_msgSend(v56, "setObject:forKeyedSubscript:");
  }
  id v13 = objc_alloc(MEMORY[0x263F089B8]);
  id v14 = [(CPSMultilineLabel *)v59 text];
  id v16 = &v56;
  uint64_t v15 = objc_msgSend(v13, "initWithString:attributes:");

  id v17 = 0;
  objc_storeStrong(location, 0);
  objc_storeStrong(v16, v17);
  uint64_t v11 = (void *)v15;

  return v11;
}

- (id)_ellipsedString:(id)a3 inRect:(CGRect)a4
{
  CGRect v32 = a4;
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  *(void *)&long long v29 = -[CPSMultilineLabel _statsForString:inRect:](v31, "_statsForString:inRect:", location[0], v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  *((void *)&v29 + 1) = v4;
  if ((unint64_t)v29 < [location[0] length]
    || *((void *)&v29 + 1) > [(CPSMultilineLabel *)v31 effectiveNumberOfLines])
  {
    id v27 = (char *)([location[0] length] - v29);
    id v19 = (id)[location[0] string];
    id v18 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v5 = [location[0] length];
    uint64_t v39 = v5 - (void)v27;
    id v38 = v27;
    uint64_t v40 = v5 - (void)v27;
    CTParagraphStyleRef v41 = v27;
    v24[1] = (id)(v5 - (void)v27);
    id v24[2] = v27;
    uint64_t v25 = objc_msgSend(v19, "rangeOfCharacterFromSet:options:range:", v18, 0, v5 - (void)v27, v27);
    uint64_t v26 = v6;

    if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
      id v27 = 0;
    }
    else {
      id v27 = (char *)([location[0] length] - v25);
    }
    v24[0] = 0;
    unint64_t v23 = [location[0] length];
    while (1)
    {
      BOOL v17 = 1;
      if ((unint64_t)v29 >= v23) {
        BOOL v17 = *((void *)&v29 + 1) > [(CPSMultilineLabel *)v31 effectiveNumberOfLines];
      }
      if (!v17) {
        break;
      }
      id v7 = (void *)[location[0] mutableCopy];
      id v8 = v24[0];
      v24[0] = v7;

      if ([v24[0] length] <= (unint64_t)v27)
      {
        id v33 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26DEE39C0];
        int v28 = 1;
        goto LABEL_17;
      }
      uint64_t v9 = [v24[0] length];
      uint64_t v35 = v9 - (void)v27;
      uint64_t v34 = v27;
      uint64_t v36 = v9 - (void)v27;
      CGContextRef v37 = v27;
      [v24[0] replaceCharactersInRange:v9 - (void)v27 withString:v27];
      id v14 = objc_opt_class();
      id v16 = (id)[v24[0] string];
      id v15 = (id)[v16 stringByReplacingOccurrencesOfString:@"…" withString:&stru_26DEE39C0];
      uint64_t v21 = objc_msgSend(v14, "_rangeOfTrailingWhiteSpace:");
      uint64_t v22 = v10;

      if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v24[0], "replaceCharactersInRange:withString:", v21, v22, &stru_26DEE39C0);
      }
      *(void *)&long long v20 = -[CPSMultilineLabel _statsForString:inRect:](v31, "_statsForString:inRect:", v24[0], v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
      *((void *)&v20 + 1) = v11;
      long long v29 = v20;
      unint64_t v23 = [v24[0] length];
      ++v27;
    }
    id v33 = v24[0];
    int v28 = 1;
LABEL_17:
    objc_storeStrong(v24, 0);
  }
  else
  {
    id v33 = location[0];
    int v28 = 1;
  }
  objc_storeStrong(location, 0);
  double v12 = v33;

  return v12;
}

- (__CTFrame)_textFrame:(id)a3 rect:(CGRect)a4
{
  CGRect v9 = a4;
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)location[0]);
  path = CGPathCreateMutable();
  CGPathAddRect(path, 0, v9);
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v14.id location = 0;
  v14.length = 0;
  Frame = CTFramesetterCreateFrame(framesetter, v14, path, 0);
  CFRelease(framesetter);
  CFRelease(path);
  objc_storeStrong(location, 0);
  return Frame;
}

- (BOOL)_fitsInHeight:(double)a3 numberOfLines:(unint64_t)a4 rect:(CGRect)a5
{
  BOOL v9 = a3 <= a5.size.height;
  BOOL v8 = a4 <= [(CPSMultilineLabel *)self effectiveNumberOfLines];
  BOOL v7 = 0;
  if ([(CPSMultilineLabel *)self prefersFewerLines]) {
    BOOL v7 = a4 > 1;
  }
  BOOL v6 = 0;
  if (v9)
  {
    BOOL v6 = 0;
    if (v8) {
      return !v7;
    }
  }
  return v6;
}

- (double)_heightForAttributedString:(id)a3 inRect:(CGRect)a4
{
  CGRect v10 = a4;
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)location[0]);
    CGSizeMake_1();
    long long v7 = *MEMORY[0x263F001B0];
    if (framesetter)
    {
      uint64_t v13 = 0;
      uint64_t v12 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      v16.id location = 0;
      v16.length = 0;
      *((void *)&v7 + 1) = *(void *)&CTFramesetterSuggestFrameSizeWithConstraints(framesetter, v16, 0, *(CGSize *)&v4, 0).height;
      CFRelease(framesetter);
    }
    double v11 = *((double *)&v7 + 1);
  }
  else
  {
    double v11 = 0.0;
  }
  objc_storeStrong(location, 0);
  return v11;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)_statsForString:(id)a3 inRect:(CGRect)a4
{
  CGRect v12 = a4;
  double v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  frame = -[CPSMultilineLabel _textFrame:rect:](v11, "_textFrame:rect:", location[0], v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  CFIndex length = CTFrameGetVisibleStringRange(frame).length;
  CFArrayRef theArray = CTFrameGetLines(frame);
  CFIndex Count = CFArrayGetCount(theArray);
  CFRelease(frame);
  CFIndex v13 = length;
  CFIndex v14 = Count;
  objc_storeStrong(location, 0);
  unint64_t v4 = v13;
  unint64_t v5 = v14;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

+ (_NSRange)_rangeOfTrailingWhiteSpace:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v16 = 0;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v19 = 0;
  long long v11 = 0x7FFFFFFFFFFFFFFFuLL;
  size_t size = [location[0] length];
  if (size)
  {
    long long v7 = malloc_type_calloc(2uLL, size, 0xD10AC1D9uLL);
    if (v7)
    {
      uint64_t v13 = 0;
      size_t v12 = size;
      uint64_t v14 = 0;
      size_t v15 = size;
      v6[1] = 0;
      v6[2] = (id)size;
      objc_msgSend(location[0], "getCharacters:range:", v7, 0, size);
      v6[0] = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      for (size_t i = size - 1; ([v6[0] characterIsMember:*((unsigned __int16 *)v7 + i)] & 1) != 0; --i)
      {
        if ((void)v11 == 0x7FFFFFFFFFFFFFFFLL) {
          long long v11 = size;
        }
        *(void *)&long long v11 = v11 - 1;
        ++*((void *)&v11 + 1);
      }
      free(v7);
      int v8 = 1;
      objc_storeStrong(v6, 0);
    }
    else
    {
      int v8 = 1;
    }
  }
  else
  {
    int v8 = 1;
  }
  objc_storeStrong(location, 0);
  NSUInteger v4 = *((void *)&v11 + 1);
  NSUInteger v3 = v11;
  result.CFIndex length = v4;
  result.id location = v3;
  return result;
}

- (CPSMultilineLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSMultilineLabelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_lineSpacing = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (double)minimumFontSize
{
  return self->_minimumFontSize;
}

- (void)setMinimumFontSize:(double)a3
{
  self->_minimumFontSize = a3;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfCFArrayRef Lines = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (BOOL)prefersFewerLines
{
  return self->_prefersFewerLines;
}

- (void)setPrefersFewerLines:(BOOL)a3
{
  self->_prefersFewerCFArrayRef Lines = a3;
}

- (UILayoutGuide)textLayoutGuide
{
  return self->_textLayoutGuide;
}

- (CPSMultilineLabelConfig)currentConfiguration
{
  return self->_currentConfiguration;
}

- (BOOL)debug
{
  return self->_debug;
}

- (NSArray)baselineOffsets
{
  return self->_baselineOffsets;
}

- (void)setBaselineOffsets:(id)a3
{
  self->_baselineOffsets = (NSArray *)a3;
}

- (UIView)baselineView
{
  return self->_baselineView;
}

- (void)setBaselineView:(id)a3
{
}

- (NSLayoutConstraint)baselineViewTopAnchor
{
  return self->_baselineViewTopAnchor;
}

- (void)setBaselineViewTopAnchor:(id)a3
{
}

- (NSLayoutConstraint)baselineViewBottomAnchor
{
  return self->_baselineViewBottomAnchor;
}

- (void)setBaselineViewBottomAnchor:(id)a3
{
}

- (NSArray)leadingOffsets
{
  return self->_leadingOffsets;
}

- (void)setLeadingOffsets:(id)a3
{
  self->_leadingOffsets = (NSArray *)a3;
}

- (NSLayoutConstraint)textLayoutGuideLeadingConstraint
{
  return self->_textLayoutGuideLeadingConstraint;
}

- (void)setTextLayoutGuideLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)textLayoutGuideTrailingConstraint
{
  return self->_textLayoutGuideTrailingConstraint;
}

- (void)setTextLayoutGuideTrailingConstraint:(id)a3
{
}

- (UIView)debugFirstBaselineView
{
  return self->_debugFirstBaselineView;
}

- (void)setDebugFirstBaselineView:(id)a3
{
}

- (UIView)debugLastBaselineView
{
  return self->_debugLastBaselineView;
}

- (void)setDebugLastBaselineView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end