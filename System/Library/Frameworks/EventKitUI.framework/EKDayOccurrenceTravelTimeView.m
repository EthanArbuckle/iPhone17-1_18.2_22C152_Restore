@interface EKDayOccurrenceTravelTimeView
+ (double)minimumNaturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4;
+ (void)initialize;
- (BOOL)animatingAlpha;
- (EKDayOccurrenceTravelTimeView)initWithFrame:(CGRect)a3;
- (EKDayOccurrenceTravelTimeView)initWithReusableTravelTimeView:(id)a3;
- (NSAttributedString)travelTimeString;
- (NSLayoutConstraint)travelTimeLabelToTrailingEdgeConstraint;
- (UIColor)colorBarColor;
- (UIColor)elementColor;
- (UIColor)lineColor;
- (UIImageView)travelTimeIcon;
- (UILabel)travelTimeLabel;
- (UIView)colorBarView;
- (UIView)horizontalLineView;
- (double)alphaForElements;
- (id)_textFont;
- (id)_travelTimeIconForTravelModeWithColor:(id)a3;
- (int64_t)routingMode;
- (void)_updateStringsColorsAndConstraintConstants;
- (void)layoutSubviews;
- (void)setAnimatingAlpha:(BOOL)a3;
- (void)setColorBarColor:(id)a3;
- (void)setColorBarView:(id)a3;
- (void)setElementColor:(id)a3;
- (void)setHorizontalLineView:(id)a3;
- (void)setLineColor:(id)a3;
- (void)setRoutingMode:(int64_t)a3;
- (void)setTravelTimeIcon:(id)a3;
- (void)setTravelTimeLabel:(id)a3;
- (void)setTravelTimeLabelToTrailingEdgeConstraint:(id)a3;
- (void)setTravelTimeString:(id)a3;
@end

@implementation EKDayOccurrenceTravelTimeView

+ (void)initialize
{
  v8[5] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v8[0] = v4;
  v8[1] = v4;
  v8[2] = v2;
  v8[3] = v3;
  v8[4] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:5];
  v7 = (void *)s_iconCache;
  s_iconCache = v6;
}

- (EKDayOccurrenceTravelTimeView)initWithFrame:(CGRect)a3
{
  v72[13] = *MEMORY[0x1E4F143B8];
  v71.receiver = self;
  v71.super_class = (Class)EKDayOccurrenceTravelTimeView;
  v3 = -[EKDayOccurrenceTravelTimeView initWithFrame:](&v71, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(EKDayOccurrenceTravelTimeView *)v3 setOpaque:0];
    [(EKDayOccurrenceTravelTimeView *)v4 setUserInteractionEnabled:0];
    [(EKDayOccurrenceTravelTimeView *)v4 setContentMode:3];
    v5 = objc_alloc_init(DottedLineView);
    colorBarView = v4->_colorBarView;
    v4->_colorBarView = &v5->super;

    [(UIView *)v4->_colorBarView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKDayOccurrenceTravelTimeView *)v4 addSubview:v4->_colorBarView];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
    travelTimeIcon = v4->_travelTimeIcon;
    v4->_travelTimeIcon = (UIImageView *)v7;

    v9 = (void *)MEMORY[0x1E4FB1830];
    v10 = [(EKDayOccurrenceTravelTimeView *)v4 _textFont];
    v11 = [v9 configurationWithFont:v10];
    [(UIImageView *)v4->_travelTimeIcon setPreferredSymbolConfiguration:v11];

    [(UIImageView *)v4->_travelTimeIcon setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1148846080;
    [(UIImageView *)v4->_travelTimeIcon setContentCompressionResistancePriority:0 forAxis:v12];
    LODWORD(v13) = 1148846080;
    [(UIImageView *)v4->_travelTimeIcon setContentCompressionResistancePriority:1 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [(UIImageView *)v4->_travelTimeIcon setContentHuggingPriority:0 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [(UIImageView *)v4->_travelTimeIcon setContentHuggingPriority:1 forAxis:v15];
    [(UIImageView *)v4->_travelTimeIcon setAlpha:0.0];
    [(EKDayOccurrenceTravelTimeView *)v4 addSubview:v4->_travelTimeIcon];
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    travelTimeLabel = v4->_travelTimeLabel;
    v4->_travelTimeLabel = v16;

    v18 = [(EKDayOccurrenceTravelTimeView *)v4 _textFont];
    [(UILabel *)v4->_travelTimeLabel setFont:v18];

    [(UILabel *)v4->_travelTimeLabel setNumberOfLines:0];
    [(UILabel *)v4->_travelTimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v19) = 1148846080;
    [(UILabel *)v4->_travelTimeLabel setContentCompressionResistancePriority:1 forAxis:v19];
    [(UILabel *)v4->_travelTimeLabel setAlpha:0.0];
    [(EKDayOccurrenceTravelTimeView *)v4 addSubview:v4->_travelTimeLabel];
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    horizontalLineView = v4->_horizontalLineView;
    v4->_horizontalLineView = v20;

    [(UIView *)v4->_horizontalLineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKDayOccurrenceTravelTimeView *)v4 addSubview:v4->_horizontalLineView];
    v22 = [(EKDayOccurrenceTravelTimeView *)v4 trailingAnchor];
    v23 = [(UILabel *)v4->_travelTimeLabel trailingAnchor];
    [MEMORY[0x1E4F57BB8] occurrencePadding];
    uint64_t v24 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23);
    travelTimeLabelToTrailingEdgeConstraint = v4->_travelTimeLabelToTrailingEdgeConstraint;
    v4->_travelTimeLabelToTrailingEdgeConstraint = (NSLayoutConstraint *)v24;

    v26 = [(EKDayOccurrenceTravelTimeView *)v4 bottomAnchor];
    v27 = [(UILabel *)v4->_travelTimeLabel bottomAnchor];
    [MEMORY[0x1E4F57BB8] occurrencePadding];
    v28 = objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:constant:", v27);

    v57 = v28;
    LODWORD(v29) = 1144750080;
    [v28 setPriority:v29];
    v30 = [(UIView *)v4->_colorBarView bottomAnchor];
    v31 = [(EKDayOccurrenceTravelTimeView *)v4 bottomAnchor];
    [MEMORY[0x1E4F57BB8] occurrencePadding];
    v70 = [v30 constraintEqualToAnchor:v31 constant:-v32];

    LODWORD(v33) = 1144750080;
    [v70 setPriority:v33];
    v59 = (void *)MEMORY[0x1E4F28DC8];
    v72[0] = v70;
    v69 = [(UIView *)v4->_colorBarView leadingAnchor];
    v68 = [(EKDayOccurrenceTravelTimeView *)v4 leadingAnchor];
    [MEMORY[0x1E4F57BB8] occurrencePadding];
    v67 = objc_msgSend(v69, "constraintEqualToAnchor:constant:", v68);
    v72[1] = v67;
    v66 = [(UIView *)v4->_colorBarView widthAnchor];
    [MEMORY[0x1E4F57BB8] colorBarThickness];
    v65 = objc_msgSend(v66, "constraintEqualToConstant:");
    v72[2] = v65;
    v64 = [(UIView *)v4->_colorBarView topAnchor];
    v63 = [(EKDayOccurrenceTravelTimeView *)v4 topAnchor];
    [MEMORY[0x1E4F57BB8] occurrencePadding];
    v62 = objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63);
    v72[3] = v62;
    v61 = [(UIImageView *)v4->_travelTimeIcon leadingAnchor];
    v60 = [(UIView *)v4->_colorBarView trailingAnchor];
    [MEMORY[0x1E4F57BB8] occurrencePadding];
    v58 = objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60);
    v72[4] = v58;
    v56 = [(UIImageView *)v4->_travelTimeIcon topAnchor];
    v55 = [(UIView *)v4->_colorBarView topAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v72[5] = v54;
    v53 = [(UILabel *)v4->_travelTimeLabel leadingAnchor];
    v52 = [(UIImageView *)v4->_travelTimeIcon trailingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 constant:3.0];
    v72[6] = v51;
    v49 = [(UILabel *)v4->_travelTimeLabel topAnchor];
    v50 = [(EKDayOccurrenceTravelTimeView *)v4 colorBarView];
    v48 = [v50 topAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v72[7] = v47;
    v72[8] = v28;
    v46 = [(UIView *)v4->_horizontalLineView leadingAnchor];
    v45 = [(EKDayOccurrenceTravelTimeView *)v4 leadingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v72[9] = v44;
    v34 = [(UIView *)v4->_horizontalLineView trailingAnchor];
    v35 = [(EKDayOccurrenceTravelTimeView *)v4 trailingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v72[10] = v36;
    v37 = [(UIView *)v4->_horizontalLineView heightAnchor];
    CalRoundToScreenScale(0.5);
    v38 = objc_msgSend(v37, "constraintEqualToConstant:");
    v72[11] = v38;
    v39 = [(UIView *)v4->_horizontalLineView bottomAnchor];
    v40 = [(EKDayOccurrenceTravelTimeView *)v4 bottomAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v72[12] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:13];
    [v59 activateConstraints:v42];
  }
  return v4;
}

- (EKDayOccurrenceTravelTimeView)initWithReusableTravelTimeView:(id)a3
{
  id v4 = a3;
  [v4 frame];
  v5 = -[EKDayOccurrenceTravelTimeView initWithFrame:](self, "initWithFrame:");
  if (v5)
  {
    uint64_t v6 = [v4 elementColor];
    [(EKDayOccurrenceTravelTimeView *)v5 setElementColor:v6];

    uint64_t v7 = [v4 lineColor];
    [(EKDayOccurrenceTravelTimeView *)v5 setLineColor:v7];

    -[EKDayOccurrenceTravelTimeView setRoutingMode:](v5, "setRoutingMode:", [v4 routingMode]);
  }

  return v5;
}

- (id)_textFont
{
  return (id)[MEMORY[0x1E4F57BB0] defaultOccurrenceSecondaryTextFont];
}

- (NSAttributedString)travelTimeString
{
  return [(UILabel *)self->_travelTimeLabel attributedText];
}

- (void)setTravelTimeString:(id)a3
{
}

+ (double)minimumNaturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  id v4 = objc_msgSend(MEMORY[0x1E4F57BB0], "defaultOccurrenceSecondaryTextFont", a3, a4);
  [v4 lineHeight];
  double v6 = v5;

  return v6;
}

- (void)_updateStringsColorsAndConstraintConstants
{
  [(UIView *)self->_horizontalLineView setBackgroundColor:self->_lineColor];
  [(UILabel *)self->_travelTimeLabel setTextColor:self->_elementColor];
  v3 = [(EKDayOccurrenceTravelTimeView *)self _travelTimeIconForTravelModeWithColor:self->_elementColor];
  [(UIImageView *)self->_travelTimeIcon setImage:v3];

  [(UIView *)self->_colorBarView setBackgroundColor:self->_colorBarColor];

  [(EKDayOccurrenceTravelTimeView *)self setNeedsLayout];
}

- (void)setElementColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_elementColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_elementColor, a3);
    [(EKDayOccurrenceTravelTimeView *)self _updateStringsColorsAndConstraintConstants];
    double v5 = v6;
  }
}

- (void)setColorBarColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_colorBarColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_colorBarColor, a3);
    [(EKDayOccurrenceTravelTimeView *)self _updateStringsColorsAndConstraintConstants];
    double v5 = v6;
  }
}

- (void)setLineColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_lineColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_lineColor, a3);
    [(EKDayOccurrenceTravelTimeView *)self _updateStringsColorsAndConstraintConstants];
    double v5 = v6;
  }
}

- (void)setRoutingMode:(int64_t)a3
{
  if (self->_routingMode != a3)
  {
    self->_routingMode = a3;
    [(EKDayOccurrenceTravelTimeView *)self _updateStringsColorsAndConstraintConstants];
  }
}

- (id)_travelTimeIconForTravelModeWithColor:(id)a3
{
  id v4 = a3;
  if (self->_routingMode == -1) {
    int64_t routingMode = 0;
  }
  else {
    int64_t routingMode = self->_routingMode;
  }
  double v6 = [(id)s_iconCache objectAtIndexedSubscript:routingMode];
  uint64_t v7 = [v6 objectForKey:v4];

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    switch(routingMode)
    {
      case -1:
      case 0:
      case 1:
        uint64_t v9 = CarImage_Occurrences();
        goto LABEL_12;
      case 2:
        uint64_t v9 = WalkmanImage_Occurrences();
        goto LABEL_12;
      case 3:
        uint64_t v9 = TransitImage_Occurrences();
        goto LABEL_12;
      case 4:
        uint64_t v9 = BicycleImage_Occurrences();
LABEL_12:
        v8 = (void *)v9;
        break;
      default:
        v8 = 0;
        break;
    }
    uint64_t v7 = [v8 imageWithTintColor:v4 renderingMode:1];
    if (v7)
    {
      v10 = [(id)s_iconCache objectAtIndexedSubscript:routingMode];
      [v10 setObject:v7 forKey:v4];
    }
  }

  return v7;
}

- (double)alphaForElements
{
  [(UIImageView *)self->_travelTimeIcon frame];
  double Height = CGRectGetHeight(v9);
  [(UILabel *)self->_travelTimeLabel frame];
  double v4 = CGRectGetHeight(v10);
  if (Height < v4) {
    double Height = v4;
  }
  [MEMORY[0x1E4F57BB8] occurrencePadding];
  CGFloat v6 = Height + v5;
  [(EKDayOccurrenceTravelTimeView *)self bounds];
  BOOL v7 = v6 <= CGRectGetHeight(v11);
  double result = 1.0;
  if (!v7) {
    return 0.0;
  }
  return result;
}

- (void)layoutSubviews
{
  [(UIImageView *)self->_travelTimeIcon intrinsicContentSize];
  double v4 = v3;
  [(EKDayOccurrenceTravelTimeView *)self bounds];
  double Width = CGRectGetWidth(v20);
  [MEMORY[0x1E4F57BB8] occurrencePadding];
  double v7 = v6;
  [MEMORY[0x1E4F57BB8] colorBarThickness];
  double v9 = v7 + v8;
  [MEMORY[0x1E4F57BB8] occurrencePadding];
  double v11 = v4 + v9 + v10 + 3.0;
  [MEMORY[0x1E4F57BB8] occurrencePadding];
  double v13 = v12 + v11;
  [(NSLayoutConstraint *)self->_travelTimeLabelToTrailingEdgeConstraint setActive:Width >= v13];
  v19.receiver = self;
  v19.super_class = (Class)EKDayOccurrenceTravelTimeView;
  [(EKDayOccurrenceTravelTimeView *)&v19 layoutSubviews];
  BOOL v14 = Width < v13;
  uint64_t v15 = 0;
  if (!v14)
  {
    [(EKDayOccurrenceTravelTimeView *)self alphaForElements];
    uint64_t v15 = v16;
  }
  if (![(EKDayOccurrenceTravelTimeView *)self animatingAlpha])
  {
    [(EKDayOccurrenceTravelTimeView *)self setAnimatingAlpha:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__EKDayOccurrenceTravelTimeView_layoutSubviews__block_invoke;
    v18[3] = &unk_1E6087E70;
    v18[4] = self;
    v18[5] = v15;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47__EKDayOccurrenceTravelTimeView_layoutSubviews__block_invoke_2;
    v17[3] = &unk_1E6087E98;
    v17[4] = self;
    v17[5] = v15;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0x20000 delay:v18 options:v17 animations:0.200000003 completion:0.0];
  }
}

uint64_t __47__EKDayOccurrenceTravelTimeView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:*(double *)(a1 + 40)];
  double v2 = *(double *)(a1 + 40);
  double v3 = *(void **)(*(void *)(a1 + 32) + 456);

  return [v3 setAlpha:v2];
}

uint64_t __47__EKDayOccurrenceTravelTimeView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimatingAlpha:0];
  double v2 = *(double *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) alphaForElements];
  if (v2 != v4)
  {
    double v5 = *(void **)(a1 + 32);
    return [v5 setNeedsLayout];
  }
  return result;
}

- (UIColor)elementColor
{
  return self->_elementColor;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (UIColor)colorBarColor
{
  return self->_colorBarColor;
}

- (int64_t)routingMode
{
  return self->_routingMode;
}

- (UIImageView)travelTimeIcon
{
  return (UIImageView *)objc_getProperty(self, a2, 448, 1);
}

- (void)setTravelTimeIcon:(id)a3
{
}

- (UILabel)travelTimeLabel
{
  return (UILabel *)objc_getProperty(self, a2, 456, 1);
}

- (void)setTravelTimeLabel:(id)a3
{
}

- (UIView)horizontalLineView
{
  return (UIView *)objc_getProperty(self, a2, 464, 1);
}

- (void)setHorizontalLineView:(id)a3
{
}

- (UIView)colorBarView
{
  return (UIView *)objc_getProperty(self, a2, 472, 1);
}

- (void)setColorBarView:(id)a3
{
}

- (NSLayoutConstraint)travelTimeLabelToTrailingEdgeConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 480, 1);
}

- (void)setTravelTimeLabelToTrailingEdgeConstraint:(id)a3
{
}

- (BOOL)animatingAlpha
{
  return self->_animatingAlpha;
}

- (void)setAnimatingAlpha:(BOOL)a3
{
  self->_animatingAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelTimeLabelToTrailingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_colorBarView, 0);
  objc_storeStrong((id *)&self->_horizontalLineView, 0);
  objc_storeStrong((id *)&self->_travelTimeLabel, 0);
  objc_storeStrong((id *)&self->_travelTimeIcon, 0);
  objc_storeStrong((id *)&self->_colorBarColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);

  objc_storeStrong((id *)&self->_elementColor, 0);
}

@end