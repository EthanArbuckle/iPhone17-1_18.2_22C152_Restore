@interface PKPaletteHandwritingToolView
- (BOOL)needsUpdateTitleLabel;
- (CGAffineTransform)_toolLabelImageViewTransform;
- (CGPoint)_toolLabelCenterOffset;
- (NSLayoutConstraint)toolLabelCenterXConstraint;
- (NSLayoutConstraint)toolLabelCenterYConstraint;
- (NSString)localeIdentifier;
- (PKPaletteHandwritingToolView)init;
- (PKPaletteHandwritingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5;
- (UILabel)toolLabel;
- (id)_overrideLabelCenterOffsetYHandler;
- (id)_toolLabelText;
- (void)_setOverrideLabelCenterOffsetYHandler:(id)a3;
- (void)_updateUI;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setNeedsUpdateTitleLabel:(BOOL)a3;
- (void)setScalingFactor:(double)a3;
- (void)setToolLabel:(id)a3;
- (void)setToolLabelCenterXConstraint:(id)a3;
- (void)setToolLabelCenterYConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation PKPaletteHandwritingToolView

- (PKPaletteHandwritingToolView)init
{
  v3 = +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:@"com.apple.ink.handwriting"];
  v4 = [(PKPaletteHandwritingToolView *)self initWithToolIdentifier:@"com.apple.ink.handwriting" variant:0 configuration:v3];

  return v4;
}

- (PKPaletteHandwritingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)PKPaletteHandwritingToolView;
  v5 = [(PKPaletteToolView *)&v31 initWithToolIdentifier:a3 variant:a4 configuration:a5];
  v6 = v5;
  if (v5)
  {
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)@"en";

    v6->_needsUpdateTitleLabel = 1;
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    toolLabel = v6->_toolLabel;
    v6->_toolLabel = v8;

    v10 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v11 = [v10 fontDescriptor];
    uint64_t v35 = *MEMORY[0x1E4FB09F0];
    v12 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
    v36[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];

    uint64_t v33 = *MEMORY[0x1E4FB0950];
    v34 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v15 = [v11 fontDescriptorByAddingAttributes:v14];

    v16 = [v15 fontDescriptorWithDesign:*MEMORY[0x1E4FB0938]];

    v17 = (void *)MEMORY[0x1E4FB08E0];
    [v10 pointSize];
    v18 = objc_msgSend(v17, "fontWithDescriptor:size:", v16);

    [(UILabel *)v6->_toolLabel setFont:v18];
    v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v6->_toolLabel setTextColor:v19];

    [(UILabel *)v6->_toolLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteHandwritingToolView *)v6 addSubview:v6->_toolLabel];
    v20 = [(UILabel *)v6->_toolLabel centerXAnchor];
    v21 = [(PKPaletteHandwritingToolView *)v6 centerXAnchor];
    uint64_t v22 = [v20 constraintEqualToAnchor:v21];
    toolLabelCenterXConstraint = v6->_toolLabelCenterXConstraint;
    v6->_toolLabelCenterXConstraint = (NSLayoutConstraint *)v22;

    v24 = [(UILabel *)v6->_toolLabel centerYAnchor];
    v25 = [(PKPaletteHandwritingToolView *)v6 centerYAnchor];
    uint64_t v26 = [v24 constraintEqualToAnchor:v25];
    toolLabelCenterYConstraint = v6->_toolLabelCenterYConstraint;
    v6->_toolLabelCenterYConstraint = (NSLayoutConstraint *)v26;

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v32[0] = v6->_toolLabelCenterXConstraint;
    v32[1] = v6->_toolLabelCenterYConstraint;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    [v28 activateConstraints:v29];

    [(PKPaletteHandwritingToolView *)v6 setEdgeLocation:4];
    [(PKPaletteHandwritingToolView *)v6 _updateUI];
  }
  return v6;
}

- (void)_updateUI
{
  [(PKPaletteHandwritingToolView *)self _toolLabelImageViewTransform];
  v3 = [(PKPaletteHandwritingToolView *)self toolLabel];
  v6[0] = v6[3];
  v6[1] = v6[4];
  v6[2] = v6[5];
  [v3 setTransform:v6];

  if ([(PKPaletteHandwritingToolView *)self needsUpdateTitleLabel])
  {
    v4 = [(PKPaletteHandwritingToolView *)self _toolLabelText];
    v5 = [(PKPaletteHandwritingToolView *)self toolLabel];
    [v5 setText:v4];

    [(PKPaletteHandwritingToolView *)self setNeedsUpdateTitleLabel:0];
  }
}

- (id)_toolLabelText
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [(PKPaletteHandwritingToolView *)self localeIdentifier];
  v5 = [v3 localizedStringForKey:@"HANDWRITING_TOOL_TEXT_LABEL" value:@"HANDWRITING_TOOL_TEXT_LABEL" table:@"PencilKit" localization:v4];

  if ([v5 isEqualToString:@"HANDWRITING_TOOL_TEXT_LABEL"])
  {
    uint64_t v6 = [v3 localizedStringForKey:@"HANDWRITING_TOOL_TEXT_LABEL" value:@"HANDWRITING_TOOL_TEXT_LABEL" table:@"PencilKit" localization:@"en"];

    v5 = (void *)v6;
  }

  return v5;
}

- (CGAffineTransform)_toolLabelImageViewTransform
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v16 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v15;
  long long v14 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&retstr->tx = v14;
  if ([(PKPaletteToolView *)self edgeLocation] == 2)
  {
    *(_OWORD *)&v18.a = v16;
    *(_OWORD *)&v18.c = v15;
    *(_OWORD *)&v18.tx = v14;
    CGFloat v6 = 1.57079633;
LABEL_5:
    CGAffineTransformRotate(retstr, &v18, v6);
    goto LABEL_6;
  }
  if ([(PKPaletteToolView *)self edgeLocation] == 8)
  {
    long long v7 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v18.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v18.c = v7;
    *(_OWORD *)&v18.tx = *(_OWORD *)&retstr->tx;
    CGFloat v6 = -1.57079633;
    goto LABEL_5;
  }
LABEL_6:
  [(PKPaletteToolView *)self scalingFactor];
  CGFloat v9 = v8;
  [(PKPaletteToolView *)self scalingFactor];
  long long v10 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v17.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v17.c = v10;
  *(_OWORD *)&v17.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v18, &v17, v9, v11);
  long long v13 = *(_OWORD *)&v18.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v18.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v18.tx;
  return result;
}

- (void)updateConstraints
{
  [(PKPaletteHandwritingToolView *)self _toolLabelCenterOffset];
  double v4 = v3;
  double v6 = v5;
  long long v7 = [(PKPaletteHandwritingToolView *)self toolLabelCenterXConstraint];
  [v7 setConstant:v4];

  double v8 = [(PKPaletteHandwritingToolView *)self toolLabelCenterYConstraint];
  [v8 setConstant:v6];

  v9.receiver = self;
  v9.super_class = (Class)PKPaletteHandwritingToolView;
  [(PKPaletteToolView *)&v9 updateConstraints];
}

- (CGPoint)_toolLabelCenterOffset
{
  double v3 = [(PKPaletteHandwritingToolView *)self traitCollection];
  double v4 = [(PKPaletteHandwritingToolView *)self window];
  double v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  if (v6)
  {
    if ([(PKPaletteHandwritingToolView *)self isSelected]) {
      double v7 = 4.0;
    }
    else {
      double v7 = 14.0;
    }
    double v8 = 0.25;
    goto LABEL_22;
  }
  id overrideLabelCenterOffsetYHandler = self->__overrideLabelCenterOffsetYHandler;
  if ([(PKPaletteToolView *)self edgeLocation] == 2)
  {
    BOOL v10 = [(PKPaletteHandwritingToolView *)self isSelected] == 0;
    v11.n128_u64[0] = -24.0;
    double v12 = -4.0;
LABEL_10:
    if (v10) {
      double v8 = v11.n128_f64[0];
    }
    else {
      double v8 = v12;
    }
    if (overrideLabelCenterOffsetYHandler) {
      double v7 = (*((double (**)(__n128))self->__overrideLabelCenterOffsetYHandler + 2))(v11);
    }
    else {
      double v7 = 0.0;
    }
    goto LABEL_22;
  }
  if ([(PKPaletteToolView *)self edgeLocation] == 8)
  {
    BOOL v10 = [(PKPaletteHandwritingToolView *)self isSelected] == 0;
    v11.n128_u64[0] = 24.0;
    double v12 = 4.0;
    goto LABEL_10;
  }
  if (overrideLabelCenterOffsetYHandler)
  {
    double v7 = (*((double (**)(void))self->__overrideLabelCenterOffsetYHandler + 2))();
  }
  else if ([(PKPaletteHandwritingToolView *)self isSelected])
  {
    double v7 = 4.0;
  }
  else
  {
    double v7 = 24.0;
  }
  double v8 = 0.0;
LABEL_22:
  [(PKPaletteToolView *)self scalingFactor];
  double v14 = v7 * v13;
  double v15 = v8 * v13;
  result.y = v14;
  result.x = v15;
  return result;
}

- (void)setScalingFactor:(double)a3
{
  [(PKPaletteToolView *)self scalingFactor];
  double v6 = v5;
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteHandwritingToolView;
  [(PKPaletteToolView *)&v8 setScalingFactor:a3];
  [(PKPaletteToolView *)self scalingFactor];
  if (v6 != v7 && vabdd_f64(v6, v7) >= fabs(v7 * 0.000000999999997))
  {
    [(PKPaletteHandwritingToolView *)self setNeedsUpdateConstraints];
    [(PKPaletteHandwritingToolView *)self _updateUI];
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  unint64_t v5 = [(PKPaletteToolView *)self edgeLocation];
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteHandwritingToolView;
  [(PKPaletteToolView *)&v6 setEdgeLocation:a3];
  if (v5 != [(PKPaletteToolView *)self edgeLocation])
  {
    [(PKPaletteHandwritingToolView *)self setNeedsUpdateConstraints];
    [(PKPaletteHandwritingToolView *)self _updateUI];
  }
}

- (void)setLocaleIdentifier:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_localeIdentifier, "isEqualToString:"))
  {
    double v4 = (NSString *)[v6 copy];
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = v4;

    [(PKPaletteHandwritingToolView *)self setNeedsUpdateTitleLabel:1];
    [(PKPaletteHandwritingToolView *)self _updateUI];
  }
}

- (void)_setOverrideLabelCenterOffsetYHandler:(id)a3
{
  if (self->__overrideLabelCenterOffsetYHandler != a3)
  {
    double v4 = (void *)[a3 copy];
    id overrideLabelCenterOffsetYHandler = self->__overrideLabelCenterOffsetYHandler;
    self->__id overrideLabelCenterOffsetYHandler = v4;

    [(PKPaletteHandwritingToolView *)self setNeedsUpdateConstraints];
  }
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (UILabel)toolLabel
{
  return self->_toolLabel;
}

- (void)setToolLabel:(id)a3
{
}

- (NSLayoutConstraint)toolLabelCenterXConstraint
{
  return self->_toolLabelCenterXConstraint;
}

- (void)setToolLabelCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolLabelCenterYConstraint
{
  return self->_toolLabelCenterYConstraint;
}

- (void)setToolLabelCenterYConstraint:(id)a3
{
}

- (BOOL)needsUpdateTitleLabel
{
  return self->_needsUpdateTitleLabel;
}

- (void)setNeedsUpdateTitleLabel:(BOOL)a3
{
  self->_needsUpdateTitleLabel = a3;
}

- (id)_overrideLabelCenterOffsetYHandler
{
  return self->__overrideLabelCenterOffsetYHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__overrideLabelCenterOffsetYHandler, 0);
  objc_storeStrong((id *)&self->_toolLabelCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_toolLabelCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_toolLabel, 0);

  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end