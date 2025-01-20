@interface SiriGKPropertyView
- (CGSize)_sizeThatFits:(CGSize)a3 setFrames:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriGKPropertyView)initWithAnswerProperty:(id)a3;
- (double)_bottomMargin;
- (double)_lineHeight;
- (id)_decoratedString:(id)a3 forRegions:(id)a4;
- (id)_labelFontForHighlighted:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation SiriGKPropertyView

- (double)_bottomMargin
{
  return 29.0;
}

- (double)_lineHeight
{
  int v2 = SiriUIIsCompactWidth();
  double result = 20.0;
  if (v2) {
    return 15.0;
  }
  return result;
}

- (SiriGKPropertyView)initWithAnswerProperty:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)SiriGKPropertyView;
  v5 = [(SiriGKPropertyView *)&v55 init];
  p_isa = (id *)&v5->super.super.super.super.isa;
  if (!v5) {
    goto LABEL_23;
  }
  -[SiriGKView setEdgeInsets:](v5, "setEdgeInsets:", 0.0, SiriUIPlatterStyle[32], 0.0, SiriUIPlatterStyle[34]);
  v7 = [v4 command];
  [p_isa setCommand:v7];

  v8 = [p_isa command];
  if (!v8)
  {
    v9 = [v4 punchOut];

    if (!v9) {
      goto LABEL_6;
    }
    v8 = [v4 punchOut];
    [p_isa setCommand:v8];
  }

LABEL_6:
  id v10 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [p_isa _lineHeight];
  objc_msgSend(v10, "setMinimumLineHeight:");
  [p_isa _lineHeight];
  objc_msgSend(v10, "setMaximumLineHeight:");
  uint64_t v11 = [v4 name];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [v4 name];
    unsigned __int8 v14 = [v13 isEqualToString:&stru_188A0];

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = +[SiriSharedUIContentLabel label];
      id v16 = p_isa[6];
      p_isa[6] = (id)v15;

      [p_isa[6] setTranslatesAutoresizingMaskIntoConstraints:0];
      id v17 = p_isa[6];
      v18 = [v4 selected];
      v19 = objc_msgSend(p_isa, "_labelFontForHighlighted:", objc_msgSend(v18, "BOOLValue"));
      [v17 setFont:v19];

      id v20 = objc_alloc((Class)NSAttributedString);
      v21 = [v4 name];
      NSAttributedStringKey v56 = NSParagraphStyleAttributeName;
      id v57 = v10;
      v22 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v23 = [v20 initWithString:v21 attributes:v22];

      [p_isa[6] setAttributedText:v23];
      [p_isa[6] setNumberOfLines:0];
      [p_isa addSubview:p_isa[6]];
    }
  }
  id v24 = objc_alloc_init((Class)NSMutableAttributedString);
  uint64_t v25 = [v4 decoratedValue];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [v4 decoratedValue];
    v28 = [v27 text];
    unsigned __int8 v29 = [v28 isEqualToString:&stru_188A0];

    if ((v29 & 1) == 0)
    {
      v30 = [v4 decoratedValue];
      v31 = [v30 text];
      v32 = [v4 decoratedValue];
      v33 = [v32 regions];
      v34 = [p_isa _decoratedString:v31 forRegions:v33];
      [v24 appendAttributedString:v34];
    }
  }
  uint64_t v35 = [v4 decoratedValueAnnotation];
  if (v35)
  {
    v36 = (void *)v35;
    v37 = [v4 decoratedValueAnnotation];
    v38 = [v37 text];
    unsigned __int8 v39 = [v38 isEqualToString:&stru_188A0];

    if ((v39 & 1) == 0)
    {
      v40 = [v4 decoratedValueAnnotation];
      v41 = [v40 text];
      v42 = +[NSString stringWithFormat:@" %@", v41];

      v43 = [v4 decoratedValueAnnotation];
      v44 = [v43 regions];
      v45 = [p_isa _decoratedString:v42 forRegions:v44];
      [v24 appendAttributedString:v45];
    }
  }
  if ([v24 length])
  {
    uint64_t v46 = +[SiriSharedUIContentLabel label];
    id v47 = p_isa[7];
    p_isa[7] = (id)v46;

    [p_isa[7] setTranslatesAutoresizingMaskIntoConstraints:0];
    id v48 = p_isa[7];
    v49 = [v4 selected];
    v50 = objc_msgSend(p_isa, "_labelFontForHighlighted:", objc_msgSend(v49, "BOOLValue"));
    [v48 setFont:v50];

    [p_isa[7] setNumberOfLines:0];
    id v51 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [p_isa _lineHeight];
    objc_msgSend(v51, "setMinimumLineHeight:");
    [p_isa _lineHeight];
    objc_msgSend(v51, "setMaximumLineHeight:");
    if (SiriLanguageIsRTL()) {
      uint64_t v52 = 0;
    }
    else {
      uint64_t v52 = 2;
    }
    [v51 setAlignment:v52];
    objc_msgSend(v24, "addAttribute:value:range:", NSParagraphStyleAttributeName, v51, 0, objc_msgSend(v24, "length"));
    [p_isa[7] setAttributedText:v24];
    [p_isa addSubview:p_isa[7]];
  }
  [p_isa setNeedsUpdateConstraints];
  if (!p_isa[6] && !p_isa[7])
  {

    v53 = 0;
    goto LABEL_24;
  }

LABEL_23:
  v53 = p_isa;
LABEL_24:

  return v53;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SiriGKView *)self edgeInsets];
  double v10 = width - v8 - v9;

  -[SiriGKPropertyView _sizeThatFits:setFrames:](self, "_sizeThatFits:setFrames:", 0, v10, height - v6 - v7);
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)updateConstraints
{
  v13.receiver = self;
  v13.super_class = (Class)SiriGKPropertyView;
  [(SiriGKPropertyView *)&v13 updateConstraints];
  if (!self->_hasSetUpConstraints)
  {
    leftLabel = self->_leftLabel;
    if (!leftLabel) {
      leftLabel = self->_rightLabel;
    }
    id v4 = leftLabel;
    rightLabel = self->_rightLabel;
    if (!rightLabel) {
      rightLabel = self->_leftLabel;
    }
    double v6 = rightLabel;
    if (self->_leftLabel)
    {
      if (self->_rightLabel)
      {
        double v7 = +[NSLayoutConstraint constraintWithItem:v4 attribute:6 relatedBy:0 toItem:v6 attribute:5 multiplier:1.0 constant:-10.0];
        [(SiriGKPropertyView *)self addConstraint:v7];

        double v8 = +[NSLayoutConstraint constraintWithItem:v4 attribute:10 relatedBy:0 toItem:v6 attribute:10 multiplier:1.0 constant:0.0];
        [(SiriGKPropertyView *)self addConstraint:v8];

        double v9 = +[NSLayoutConstraint constraintWithItem:v4 attribute:7 relatedBy:0 toItem:v6 attribute:7 multiplier:1.0 constant:0.0];
        [(SiriGKPropertyView *)self addConstraint:v9];
      }
    }
    double v10 = +[NSLayoutConstraint constraintWithItem:v4 attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:0.0];
    [(SiriGKPropertyView *)self addConstraint:v10];

    double v11 = +[NSLayoutConstraint constraintWithItem:v6 attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:0.0];
    [(SiriGKPropertyView *)self addConstraint:v11];

    double v12 = +[NSLayoutConstraint constraintWithItem:v4 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
    [(SiriGKPropertyView *)self addConstraint:v12];

    self->_hasSetUpConstraints = 1;
  }
}

- (CGSize)_sizeThatFits:(CGSize)a3 setFrames:(BOOL)a4
{
  BOOL v4 = a4;
  double width = a3.width;
  double v7 = (a3.width + -10.0) * 0.5;
  double y = CGRectZero.origin.y;
  -[UILabel sizeThatFits:](self->_leftLabel, "sizeThatFits:", v7, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;
  [(SiriGKPropertyView *)self _bottomMargin];
  double v14 = v12 + v13;
  if (v4) {
    -[UILabel setFrame:](self->_leftLabel, "setFrame:", CGRectZero.origin.x, y, v10, v14);
  }
  -[UILabel sizeThatFits:](self->_rightLabel, "sizeThatFits:", v7, 1.79769313e308);
  double v16 = v15;
  double v18 = v17;
  [(SiriGKPropertyView *)self _bottomMargin];
  double v20 = v18 + v19;
  if (v4) {
    -[UILabel setFrame:](self->_rightLabel, "setFrame:", width - v16, y, v16, v20);
  }
  v26.origin.x = CGRectZero.origin.x;
  v26.origin.double y = y;
  v26.size.double width = v10;
  v26.size.double height = v14;
  double MaxY = CGRectGetMaxY(v26);
  v27.origin.x = width - v16;
  v27.origin.double y = y;
  v27.size.double width = v16;
  v27.size.double height = v20;
  double v22 = CGRectGetMaxY(v27);
  if (MaxY >= v22) {
    double v23 = MaxY;
  }
  else {
    double v23 = v22;
  }
  double v24 = width;
  result.double height = v23;
  result.double width = v24;
  return result;
}

- (id)_labelFontForHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = SiriUIIsCompactWidth();
  double v5 = 18.0;
  if (v4) {
    double v5 = 14.0;
  }
  if (v3) {
    +[UIFont siriui_mediumWeightFontWithSize:v5];
  }
  else {
  double v6 = +[UIFont siriui_lightWeightFontWithSize:v5];
  }

  return v6;
}

- (id)_decoratedString:(id)a3 forRegions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v25 = v5;
  id v7 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v5];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    uint64_t v11 = SARegionPropertySUPERSCRIPTValue;
    uint64_t v26 = SARegionPropertySUBSCRIPTValue;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        double v14 = [v13 property];
        unsigned __int8 v15 = [v14 isEqualToString:v11];

        double v16 = 0.3;
        if ((v15 & 1) == 0)
        {
          double v17 = [v13 property];
          unsigned int v18 = [v17 isEqualToString:v26];

          double v16 = -0.3;
          if (!v18) {
            continue;
          }
        }
        [(SiriGKPropertyView *)self _lineHeight];
        double v20 = +[NSNumber numberWithDouble:v19 * v16];
        v21 = [v13 start];
        id v22 = [v21 integerValue];
        double v23 = [v13 length];
        objc_msgSend(v7, "addAttribute:value:range:", NSBaselineOffsetAttributeName, v20, v22, objc_msgSend(v23, "integerValue"));
      }
      id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightLabel, 0);

  objc_storeStrong((id *)&self->_leftLabel, 0);
}

@end