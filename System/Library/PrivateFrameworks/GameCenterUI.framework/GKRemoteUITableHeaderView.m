@interface GKRemoteUITableHeaderView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (GKButton)button;
- (GKLabel)label;
- (GKLabel)subLabel;
- (GKRemoteUIAuxiliaryViewDelegate)delegate;
- (GKRemoteUITableHeaderView)initWithAttributes:(id)a3;
- (NSArray)replaceableConstraints;
- (NSDictionary)attributes;
- (double)bottomMargin;
- (double)height;
- (double)labelBaselineOffset;
- (double)labelBaselineToButtonBaselineOffset;
- (double)labelBaselineToSubLabelTopOffset;
- (double)labelTopOffset;
- (double)leftMargin;
- (double)rightMargin;
- (int)layoutStyle;
- (void)applyConstraints;
- (void)buttonTapped:(id)a3;
- (void)createButtonWithAttributes:(id)a3;
- (void)createLabelWithAttributes:(id)a3;
- (void)createSubLabelWithAttributes:(id)a3;
- (void)objectModelDidChange:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeight:(double)a3;
- (void)setLabel:(id)a3;
- (void)setLayoutStyle:(int)a3;
- (void)setReplaceableConstraints:(id)a3;
- (void)setSubLabel:(id)a3;
@end

@implementation GKRemoteUITableHeaderView

- (GKRemoteUITableHeaderView)initWithAttributes:(id)a3
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKRemoteUITableHeaderView;
  v7 = -[GKRemoteUITableHeaderView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_attributes, a3);
    v9 = [v6 objectForKeyedSubscript:@"GKLayoutStyle"];
    v8->_layoutStyle = [v9 integerValue];

    [(GKRemoteUITableHeaderView *)v8 createLabelWithAttributes:v6];
    [(GKRemoteUITableHeaderView *)v8 createSubLabelWithAttributes:v6];
    [(GKRemoteUITableHeaderView *)v8 createButtonWithAttributes:v6];
    if (!v8->_label)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:v8 file:@"GKRemoteUITableHeaderView.m" lineNumber:78 description:@"You MUST have a label. That's why you have a header view in the first place."];
    }
    if (v8->_subLabel && v8->_button)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:v8 file:@"GKRemoteUITableHeaderView.m" lineNumber:79 description:@"No specs for having both a button and a sub label. Choose one or the other."];
    }
    [(GKRemoteUITableHeaderView *)v8 applyConstraints];
    v10 = v8;
  }

  return v8;
}

- (GKRemoteUIAuxiliaryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKRemoteUIAuxiliaryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)createButtonWithAttributes:(id)a3
{
  id v10 = a3;
  v4 = [v10 objectForKeyedSubscript:@"button"];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F639F8] textStyle];
    id v6 = [v10 objectForKeyedSubscript:@"buttonStyle"];
    v7 = objc_msgSend(v5, "styleWithName:fallback:layoutMode:", v6, @"remoteUITableHeaderButton", -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle"));

    v8 = +[GKButton buttonWithType:1];
    button = self->_button;
    self->_button = v8;

    [(GKButton *)self->_button setTitle:v4 forState:0];
    [(GKButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKButton *)self->_button addTarget:self action:sel_buttonTapped_ forControlEvents:64];
    [(GKButton *)self->_button applyTextStyle:v7];
    [(GKRemoteUITableHeaderView *)self addSubview:self->_button];
  }
}

- (void)createLabelWithAttributes:(id)a3
{
  id v4 = a3;
  id v14 = [v4 objectForKeyedSubscript:@"label"];
  v5 = [MEMORY[0x1E4F639F8] textStyle];
  id v6 = [v4 objectForKeyedSubscript:@"labelStyle"];
  v7 = objc_msgSend(v5, "styleWithName:fallback:layoutMode:", v6, @"remoteUITableHeaderLabel", -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle"));

  v8 = [v4 objectForKeyedSubscript:@"labelNumberOfLines"];

  uint64_t v9 = [v8 integerValue];
  id v10 = [GKLabel alloc];
  v11 = -[GKLabel initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  label = self->_label;
  self->_label = v11;

  [(GKLabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GKLabel *)self->_label setNumberOfLines:0];
  v13 = [v14 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
  [(GKLabel *)self->_label setText:v13];

  if (v9 >= 1) {
    [(GKLabel *)self->_label setNumberOfLines:v9];
  }
  [(GKLabel *)self->_label applyTextStyle:v7];
  [(GKRemoteUITableHeaderView *)self addSubview:self->_label];
}

- (void)createSubLabelWithAttributes:(id)a3
{
  id v16 = a3;
  id v4 = [v16 objectForKeyedSubscript:@"subLabel"];
  if (v4)
  {
    v5 = v4;
    id v6 = [v4 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

    v7 = [MEMORY[0x1E4F639F8] textStyle];
    v8 = [v16 objectForKeyedSubscript:@"subLabelStyle"];
    uint64_t v9 = objc_msgSend(v7, "styleWithName:fallback:layoutMode:", v8, @"remoteUITableHeaderSubLabel", -[GKRemoteUITableHeaderView layoutStyle](self, "layoutStyle"));

    id v10 = [v16 objectForKeyedSubscript:@"subLabelNumberOfLines"];
    uint64_t v11 = [v10 integerValue];

    v12 = [GKLabel alloc];
    v13 = -[GKLabel initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    subLabel = self->_subLabel;
    self->_subLabel = v13;

    [(GKLabel *)self->_subLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKLabel *)self->_subLabel setNumberOfLines:0];
    v15 = [v6 _gkAttributedStringByApplyingStyle:v9];
    [(GKLabel *)self->_subLabel setAttributedText:v15];

    if (v11 >= 1) {
      [(GKLabel *)self->_subLabel setNumberOfLines:v11];
    }
    [(GKLabel *)self->_subLabel setAdjustsFontSizeToFitWidth:1];
    [(GKLabel *)self->_subLabel applyTextStyle:v9];
    [(GKRemoteUITableHeaderView *)self addSubview:self->_subLabel];
  }
}

- (double)labelBaselineOffset
{
  int v2 = [(GKRemoteUITableHeaderView *)self layoutStyle];
  double result = 36.0;
  if (v2 == 1) {
    double result = 144.0;
  }
  if (v2 == 2) {
    return 202.0;
  }
  return result;
}

- (double)leftMargin
{
  int v2 = [(GKRemoteUITableHeaderView *)self layoutStyle];
  double result = 0.0;
  if (v2 == 1) {
    double result = 25.0;
  }
  if (v2 == 2) {
    return 15.0;
  }
  return result;
}

- (double)rightMargin
{
  int v2 = [(GKRemoteUITableHeaderView *)self layoutStyle];
  double result = 0.0;
  if (v2 == 1) {
    double result = 25.0;
  }
  if (v2 == 2) {
    return 15.0;
  }
  return result;
}

- (double)bottomMargin
{
  int v3 = [(GKRemoteUITableHeaderView *)self layoutStyle];
  switch(v3)
  {
    case 2:
      double result = 30.0;
      if (self->_subLabel) {
        return result;
      }
      double result = 35.0;
      goto LABEL_11;
    case 1:
      if (self->_subLabel) {
        return 40.0;
      }
      double result = 32.0;
      goto LABEL_11;
    case 0:
      double result = 20.0;
      if (!self->_subLabel)
      {
        double result = 25.0;
LABEL_11:
        if (self->_button) {
          return 0.0;
        }
      }
      break;
  }
  return result;
}

- (double)labelTopOffset
{
  [(GKRemoteUITableHeaderView *)self labelBaselineOffset];
  double v4 = v3;
  v5 = [(GKLabel *)self->_label font];
  [v5 ascender];
  double v7 = v4 - v6;

  return v7;
}

- (double)labelBaselineToSubLabelTopOffset
{
  int v2 = [(GKRemoteUITableHeaderView *)self layoutStyle];
  double result = 5.0;
  if ((v2 - 1) < 2) {
    return 15.0;
  }
  return result;
}

- (double)labelBaselineToButtonBaselineOffset
{
  return dbl_1AF7CB210[[(GKRemoteUITableHeaderView *)self layoutStyle] - 1 < 2];
}

- (void)applyConstraints
{
  v31[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GKRemoteUITableHeaderView *)self replaceableConstraints];
  if (v3) {
    [(GKRemoteUITableHeaderView *)self removeConstraints:v3];
  }
  v29 = (void *)v3;
  double v4 = [(GKRemoteUITableHeaderView *)self label];
  v5 = [(GKRemoteUITableHeaderView *)self subLabel];
  uint64_t v6 = [(GKRemoteUITableHeaderView *)self button];
  double v7 = [MEMORY[0x1E4F1CA48] array];
  v30[0] = @"left";
  v8 = NSNumber;
  [(GKRemoteUITableHeaderView *)self leftMargin];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  v31[0] = v9;
  v30[1] = @"right";
  id v10 = NSNumber;
  [(GKRemoteUITableHeaderView *)self rightMargin];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  v31[1] = v11;
  v30[2] = @"labelToSubLabel";
  v12 = NSNumber;
  [(GKRemoteUITableHeaderView *)self labelBaselineToSubLabelTopOffset];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v31[2] = v13;
  v30[3] = @"labelToButton";
  id v14 = NSNumber;
  [(GKRemoteUITableHeaderView *)self labelBaselineToButtonBaselineOffset];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v31[3] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];

  if (v5)
  {
    v17 = _NSDictionaryOfVariableBindings(&cfstr_LabelSublabel.isa, v4, v5, 0);
    v18 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(left)-[subLabel]-(right)-|" options:0 metrics:v16 views:v17];
    [v7 addObjectsFromArray:v18];

    v19 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[label]-(labelToSubLabel)-[subLabel]" options:0 metrics:v16 views:v17];
    [v7 addObjectsFromArray:v19];

    v20 = (void *)v6;
  }
  else
  {
    v20 = (void *)v6;
    if (v6)
    {
      v17 = _NSDictionaryOfVariableBindings(&cfstr_LabelButton.isa, v4, v6, 0);
      v21 = (void *)MEMORY[0x1E4F28DC8];
      [(GKRemoteUITableHeaderView *)self labelBaselineToButtonBaselineOffset];
      v23 = [v21 constraintWithItem:v6 attribute:11 relatedBy:0 toItem:v4 attribute:11 multiplier:1.0 constant:v22];
      [v7 addObject:v23];

      v24 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
      [v7 addObject:v24];
    }
    else
    {
      v17 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v4, 0);
    }
  }
  v25 = (void *)MEMORY[0x1E4F28DC8];
  [(GKRemoteUITableHeaderView *)self labelTopOffset];
  v27 = [v25 constraintWithItem:v4 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v26];
  [v7 addObject:v27];

  v28 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(left)-[label]-(right)-|" options:0 metrics:v16 views:v17];
  [v7 addObjectsFromArray:v28];

  [(GKRemoteUITableHeaderView *)self setReplaceableConstraints:v7];
  [(GKRemoteUITableHeaderView *)self addConstraints:v7];
}

- (CGSize)intrinsicContentSize
{
  -[GKRemoteUITableHeaderView sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(GKRemoteUITableHeaderView *)self leftMargin];
  double v6 = v5;
  [(GKRemoteUITableHeaderView *)self rightMargin];
  double v35 = width;
  double v8 = width - (v6 + v7);
  uint64_t v9 = [(GKRemoteUITableHeaderView *)self label];
  id v10 = [(GKRemoteUITableHeaderView *)self subLabel];
  uint64_t v11 = [(GKRemoteUITableHeaderView *)self button];
  v12 = [v9 font];
  [v9 setPreferredMaxLayoutWidth:v8];
  [v12 ascender];
  double v14 = v13;
  [v12 descender];
  double v16 = fabs(v15);
  objc_msgSend(v9, "sizeThatFits:", v8, 1.79769313e308);
  double v18 = v17;
  [(GKRemoteUITableHeaderView *)self labelBaselineToSubLabelTopOffset];
  double v20 = v19;
  [(GKRemoteUITableHeaderView *)self labelBaselineToButtonBaselineOffset];
  double v22 = v21;
  [(GKRemoteUITableHeaderView *)self bottomMargin];
  double v24 = v23;
  [(GKRemoteUITableHeaderView *)self labelBaselineOffset];
  double v26 = v25;
  double v27 = v18 - v14 - v16;
  if (v10)
  {
    [v10 setPreferredMaxLayoutWidth:v8];
    [v10 intrinsicContentSize];
    double v29 = v28;
    int v30 = [(GKRemoteUITableHeaderView *)self layoutStyle];
    double v31 = 0.0;
    if (v30 <= 2) {
      double v31 = dbl_1AF7CB220[v30];
    }
    double v32 = v24 + v20 + v27 + v26 + v29 + v31;
  }
  else if (v11)
  {
    double v32 = v24 + v22 + v27 + v25;
  }
  else
  {
    double v32 = v24 + v27 + v25;
  }

  double v33 = v35;
  double v34 = v32;
  result.height = v34;
  result.double width = v33;
  return result;
}

- (void)buttonTapped:(id)a3
{
  id v6 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:@"url"];
  double v4 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:@"name"];
  double v5 = [(GKRemoteUITableHeaderView *)self delegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 auxiliaryView:self pressedLink:v6 attributes:self->_attributes];
  }
  else if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 auxiliaryView:self pressedButton:v4 attributes:self->_attributes];
  }
}

- (void)objectModelDidChange:(id)a3
{
  id v5 = a3;
  double v4 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:@"enabledFunction"];
  if (v4) {
    -[GKButton setEnabled:](self->_button, "setEnabled:", [v5 validateWithFunction:v4]);
  }
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (GKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (GKLabel)subLabel
{
  return self->_subLabel;
}

- (void)setSubLabel:(id)a3
{
}

- (GKButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSArray)replaceableConstraints
{
  return self->_replaceableConstraints;
}

- (void)setReplaceableConstraints:(id)a3
{
}

- (int)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int)a3
{
  self->_layoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceableConstraints, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end