@interface SiriGKDisambiguationHeader
+ (double)defaultHeight;
- (CGSize)sizeThatFits:(CGSize)result;
- (SiriUIContentButton)headerButton;
- (UIEdgeInsets)_edgeInsets;
- (void)configureWithTitle:(id)a3 subtitle:(id)a4;
- (void)layoutSubviews;
@end

@implementation SiriGKDisambiguationHeader

+ (double)defaultHeight
{
  return SiriUIPlatterStyle[26];
}

- (UIEdgeInsets)_edgeInsets
{
  if (SiriUIIsCompactWidth()) {
    double v2 = SiriUIPlatterStyle[32];
  }
  else {
    double v2 = 0.0;
  }
  if (SiriUIIsCompactWidth()) {
    double v3 = SiriUIPlatterStyle[34];
  }
  else {
    double v3 = 0.0;
  }
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = v2;
  result.right = v3;
  result.bottom = v5;
  result.left = v6;
  result.top = v4;
  return result;
}

- (void)configureWithTitle:(id)a3 subtitle:(id)a4
{
  unint64_t v18 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (!self->_topKeyline)
  {
    v7 = +[SiriUIKeyline keylineWithKeylineType:2];
    topKeyline = self->_topKeyline;
    self->_topKeyline = v7;

    [(SiriGKDisambiguationHeader *)self addSubview:self->_topKeyline];
  }
  if (v18 | v6)
  {
    if (!self->_titleLabel)
    {
      v9 = +[SiriSharedUIContentLabel label];
      titleLabel = self->_titleLabel;
      self->_titleLabel = v9;

      v11 = self->_titleLabel;
      v12 = +[UIFont siriui_mediumWeightFontWithSize:14.0];
      [(SiriSharedUIContentLabel *)v11 setFont:v12];

      v13 = self->_titleLabel;
      v14 = +[UIColor siriui_textColor];
      [(SiriSharedUIContentLabel *)v13 setTextColor:v14];

      [(SiriGKDisambiguationHeader *)self addSubview:self->_titleLabel];
    }
    if (v18) {
      unint64_t v15 = v18;
    }
    else {
      unint64_t v15 = v6;
    }
    [(SiriSharedUIContentLabel *)self->_titleLabel setText:v15];
  }
  v16 = +[SiriUIContentButton button];
  headerButton = self->_headerButton;
  self->_headerButton = v16;

  [(SiriGKDisambiguationHeader *)self addSubview:self->_headerButton];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = SiriUIPlatterStyle[26];
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)SiriGKDisambiguationHeader;
  [(SiriGKDisambiguationHeader *)&v36 layoutSubviews];
  [(SiriGKDisambiguationHeader *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SiriGKDisambiguationHeader *)self _edgeInsets];
  CGFloat v12 = v4 + v11;
  CGFloat v14 = v6 + v13;
  double v16 = v8 - (v11 + v15);
  CGFloat v18 = v10 - (v13 + v17);
  headerButton = self->_headerButton;
  [(SiriGKDisambiguationHeader *)self bounds];
  -[SiriUIContentButton setFrame:](headerButton, "setFrame:");
  [(SiriUIKeyline *)self->_topKeyline frame];
  double v21 = v20;
  -[SiriUIKeyline sizeThatFits:](self->_topKeyline, "sizeThatFits:", v16, v18);
  double v23 = v22;
  double v25 = v24;
  v37.origin.x = v12;
  v37.origin.y = v14;
  v37.size.width = v16;
  v37.size.height = v18;
  -[SiriUIKeyline setFrame:](self->_topKeyline, "setFrame:", CGRectGetMinX(v37), v21, v23, v25);
  if (self->_titleLabel)
  {
    v26 = +[UIScreen mainScreen];
    [v26 scale];
    SiriUIRectForLabelWithDistanceFromTopToBaseline();
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;

    int v33 = SiriUIIsCompactWidth();
    double v34 = SiriUIPlatterStyle[32];
    double v35 = v34 + SiriUIPlatterStyle[34];
    if (v33)
    {
      double v34 = v28;
      double v35 = 0.0;
    }
    -[SiriSharedUIContentLabel setFrame:](self->_titleLabel, "setFrame:", v34, v30, v16 - v35, v32);
  }
}

- (SiriUIContentButton)headerButton
{
  return self->_headerButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerButton, 0);
  objc_storeStrong((id *)&self->_topKeyline, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end