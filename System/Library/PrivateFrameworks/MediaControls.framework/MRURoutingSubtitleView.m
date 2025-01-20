@interface MRURoutingSubtitleView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUEqualizerView)equalizerView;
- (MRURoutingSubtitleView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (NSString)text;
- (UIImage)icon;
- (UIImageView)iconImageView;
- (UILabel)textLabel;
- (int64_t)state;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setEqualizerView:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)setText:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateVisibility;
- (void)updateVisualStyling;
@end

@implementation MRURoutingSubtitleView

- (MRURoutingSubtitleView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MRURoutingSubtitleView;
  v3 = -[MRURoutingSubtitleView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[MRUEqualizerView alloc] initWithNumberOfBars:4 width:2.0 spacing:1.0];
    equalizerView = v3->_equalizerView;
    v3->_equalizerView = v4;

    [(MRURoutingSubtitleView *)v3 addSubview:v3->_equalizerView];
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v6;

    [(MRURoutingSubtitleView *)v3 addSubview:v3->_iconImageView];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v3->_textLabel;
    v3->_textLabel = v8;

    [(UILabel *)v3->_textLabel setNumberOfLines:1];
    [(MRURoutingSubtitleView *)v3 addSubview:v3->_textLabel];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v3 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRURoutingSubtitleView *)v3 updateContentSizeCategory];
    [(MRURoutingSubtitleView *)v3 updateVisibility];
  }
  return v3;
}

- (void)layoutSubviews
{
  v44.receiver = self;
  v44.super_class = (Class)MRURoutingSubtitleView;
  [(MRURoutingSubtitleView *)&v44 layoutSubviews];
  [(MRURoutingSubtitleView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(UILabel *)self->_textLabel font];
  [v11 descender];
  UIRoundToViewScale();
  double v13 = v12;

  v14 = [(UILabel *)self->_textLabel font];
  [v14 capHeight];
  UIRoundToViewScale();
  double v16 = v15;

  -[MRUEqualizerView sizeThatFits:](self->_equalizerView, "sizeThatFits:", v8, v10);
  double v18 = v17;
  v45.origin.x = v4;
  v45.origin.y = v6;
  v45.size.width = v8;
  v45.size.height = v10;
  CGFloat MinX = CGRectGetMinX(v45);
  v46.origin.x = v4;
  v46.origin.y = v6;
  v46.size.width = v8;
  v46.size.height = v10;
  double v20 = v13 + CGRectGetMaxY(v46) - v16;
  [(MRURoutingSubtitleView *)self bounds];
  double v40 = v20;
  CGFloat v41 = MinX;
  double v42 = v18;
  double v43 = v16;
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUEqualizerView setFrame:](self->_equalizerView, "setFrame:");
  if ([(UIImage *)self->_icon isSymbolImage])
  {
    -[UIImageView sizeThatFits:](self->_iconImageView, "sizeThatFits:", v8, v10);
    double v22 = v21;
    double v24 = v23;
  }
  else
  {
    v25 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_routingSubtitleFont");
    [v25 pointSize];
    double v22 = v26;
    v27 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_routingSubtitleFont");
    [v27 pointSize];
    double v24 = v28;
  }
  v47.origin.x = v4;
  v47.origin.y = v6;
  v47.size.width = v8;
  v47.size.height = v10;
  double v29 = CGRectGetMinX(v47);
  v48.origin.x = v4;
  v48.origin.y = v6;
  v48.size.width = v8;
  v48.size.height = v10;
  double v30 = (CGRectGetMaxY(v48) - v24) * 0.5;
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v29, v30, v22, v24);
  int64_t state = self->_state;
  if ((unint64_t)(state - 1) < 2)
  {
    double v33 = v40;
    double v32 = v41;
    double v34 = v42;
    double v35 = v43;
LABEL_8:
    CGRectGetWidth(*(CGRect *)&v32);
    UIRectInset();
    CGFloat v4 = v36;
    CGFloat v6 = v37;
    double v8 = v38;
    double v10 = v39;
    goto LABEL_9;
  }
  if (state == 3)
  {
    double v32 = v29;
    double v33 = v30;
    double v34 = v22;
    double v35 = v24;
    goto LABEL_8;
  }
LABEL_9:
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", v8, v10, *(void *)&v40, *(void *)&v41, *(void *)&v42, *(void *)&v43);
  MRUSizeCeilToViewScale(self);
  v49.origin.x = v4;
  v49.origin.y = v6;
  v49.size.width = v8;
  v49.size.height = v10;
  CGRectGetMinX(v49);
  v50.origin.x = v4;
  v50.origin.y = v6;
  v50.size.width = v8;
  v50.size.height = v10;
  CGRectGetMinY(v50);
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  CGRectGetWidth(v51);
  [(MRURoutingSubtitleView *)self bounds];
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_textLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  CGFloat v4 = [(UILabel *)self->_textLabel font];
  [v4 lineHeight];
  UIRoundToViewScale();
  double v6 = v5;

  double v7 = width;
  double v8 = v6;
  result.height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
  id v5 = a3;
  [(UILabel *)self->_textLabel setText:v5];

  [(MRURoutingSubtitleView *)self setNeedsLayout];
}

- (void)setIcon:(id)a3
{
  p_icon = &self->_icon;
  objc_storeStrong((id *)&self->_icon, a3);
  id v6 = a3;
  [(UIImageView *)self->_iconImageView setImage:*p_icon];
  if ([(UIImage *)*p_icon isSymbolImage]) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 1;
  }
  [(UIImageView *)self->_iconImageView setContentMode:v7];

  [(MRURoutingSubtitleView *)self updateVisualStyling];

  [(MRURoutingSubtitleView *)self setNeedsLayout];
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_int64_t state = a3;
    [(MRURoutingSubtitleView *)self updateVisibility];
    [(MRURoutingSubtitleView *)self setNeedsLayout];
  }
}

- (void)setStylingProvider:(id)a3
{
  id v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  uint64_t v7 = v5;
  if (stylingProvider != v5)
  {
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRURoutingSubtitleView *)self updateVisualStyling];
    [(MRUEqualizerView *)self->_equalizerView setStylingProvider:v7];
  }
}

- (void)prepareForReuse
{
  [(UILabel *)self->_textLabel setText:0];

  [(MRURoutingSubtitleView *)self setState:0];
}

- (void)updateVisualStyling
{
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_textLabel];
  stylingProvider = self->_stylingProvider;
  uint64_t v4 = [(UIImage *)self->_icon isSymbolImage];
  iconImageView = self->_iconImageView;

  [(MRUVisualStylingProvider *)stylingProvider applyStyle:v4 toView:iconImageView];
}

- (void)updateContentSizeCategory
{
  double v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_routingSubtitleFont");
  [(UILabel *)self->_textLabel setFont:v3];

  uint64_t v4 = (void *)MEMORY[0x1E4FB1830];
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_routingSubtitleFont");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 configurationWithFont:v6 scale:-1];
  [(UIImageView *)self->_iconImageView setPreferredSymbolConfiguration:v5];
}

- (void)updateVisibility
{
  uint64_t v3 = 0;
  uint64_t v4 = 1;
  double v5 = 0.0;
  switch(self->_state)
  {
    case 0:
      goto LABEL_6;
    case 1:
      uint64_t v3 = 0;
      goto LABEL_4;
    case 2:
      uint64_t v3 = 1;
LABEL_4:
      double v5 = 1.0;
      goto LABEL_6;
    case 3:
      uint64_t v3 = 0;
      uint64_t v4 = 0;
LABEL_6:
      [(MRUEqualizerView *)self->_equalizerView setAlpha:v5];
      [(MRUEqualizerView *)self->_equalizerView setAnimating:v3];
      iconImageView = self->_iconImageView;
      [(UIImageView *)iconImageView setHidden:v4];
      break;
    default:
      return;
  }
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)text
{
  return self->_text;
}

- (UIImage)icon
{
  return self->_icon;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (MRUEqualizerView)equalizerView
{
  return self->_equalizerView;
}

- (void)setEqualizerView:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_equalizerView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end