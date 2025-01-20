@interface CDPPaneHeaderView
- (CDPPaneHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)detailTextLabel;
- (UILabel)subLabel;
- (UILabel)textLabel;
- (UIView)_header;
- (double)innerHeaderMaxY;
- (void)layoutSubviews;
- (void)makeAllTheTextFits;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setTitleText:(id)a3;
@end

@implementation CDPPaneHeaderView

- (CDPPaneHeaderView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CDPPaneHeaderView;
  v3 = -[CDPPaneHeaderView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v4 = (void *)getBFFPaneHeaderViewClass_softClass;
    uint64_t v15 = getBFFPaneHeaderViewClass_softClass;
    if (!getBFFPaneHeaderViewClass_softClass)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getBFFPaneHeaderViewClass_block_invoke;
      v11[3] = &unk_26433D708;
      v11[4] = &v12;
      __getBFFPaneHeaderViewClass_block_invoke((uint64_t)v11);
      v4 = (void *)v13[3];
    }
    v5 = v4;
    _Block_object_dispose(&v12, 8);
    id v6 = [v5 alloc];
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    header = v3->_header;
    v3->_header = (BFFPaneHeaderView *)v7;

    [(CDPPaneHeaderView *)v3 addSubview:v3->_header];
  }
  return v3;
}

- (UILabel)detailTextLabel
{
  return (UILabel *)[(BFFPaneHeaderView *)self->_header detailTextLabel];
}

- (UILabel)subLabel
{
  return (UILabel *)[(BFFPaneHeaderView *)self->_header subLabel];
}

- (UILabel)textLabel
{
  return (UILabel *)[(BFFPaneHeaderView *)self->_header textLabel];
}

- (void)setTitleText:(id)a3
{
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CDPPaneHeaderView;
  [(CDPPaneHeaderView *)&v7 layoutSubviews];
  header = self->_header;
  [(CDPPaneHeaderView *)self bounds];
  -[BFFPaneHeaderView setFrame:](header, "setFrame:");
  v4 = self->_header;
  [(CDPPaneHeaderView *)self bounds];
  -[BFFPaneHeaderView sizeThatFits:](v4, "sizeThatFits:", v5, v6);
  [(BFFPaneHeaderView *)self->_header layoutSubviews];
}

- (UIView)_header
{
  return (UIView *)self->_header;
}

- (double)innerHeaderMaxY
{
  v3 = [(BFFPaneHeaderView *)self->_header subLabel];
  v4 = [v3 text];

  double v5 = [(CDPPaneHeaderView *)self superview];
  header = self->_header;
  if (v4)
  {
    objc_super v7 = [(BFFPaneHeaderView *)header subLabel];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(BFFPaneHeaderView *)self->_header subLabel];
  }
  else
  {
    objc_super v7 = [(BFFPaneHeaderView *)header detailTextLabel];
    [v7 bounds];
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
    [(BFFPaneHeaderView *)self->_header detailTextLabel];
  v20 = };
  objc_msgSend(v5, "convertRect:fromView:", v20, v9, v11, v13, v15);
  double MaxY = CGRectGetMaxY(v23);

  return MaxY;
}

- (void)makeAllTheTextFits
{
  v3 = [(CDPPaneHeaderView *)self textLabel];
  [v3 setNumberOfLines:2];

  v4 = [(CDPPaneHeaderView *)self textLabel];
  [v4 setAdjustsFontSizeToFitWidth:1];

  double v5 = [(CDPPaneHeaderView *)self textLabel];
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2050000000;
  double v6 = (void *)getBFFStyleClass_softClass_1;
  uint64_t v20 = getBFFStyleClass_softClass_1;
  if (!getBFFStyleClass_softClass_1)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __getBFFStyleClass_block_invoke_1;
    v16[3] = &unk_26433D708;
    v16[4] = &v17;
    __getBFFStyleClass_block_invoke_1((uint64_t)v16);
    double v6 = (void *)v18[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v17, 8);
  double v8 = [v7 sharedStyle];
  double v9 = [v8 headerTitleFont];
  [v5 setFont:v9];

  double v10 = [(CDPPaneHeaderView *)self detailTextLabel];
  double v11 = (void *)MEMORY[0x263F81708];
  uint64_t v12 = *MEMORY[0x263F83570];
  double v13 = [MEMORY[0x263F82B60] mainScreen];
  double v14 = [v13 traitCollection];
  double v15 = [v11 preferredFontForTextStyle:v12 compatibleWithTraitCollection:v14];
  [v10 setFont:v15];
}

- (void).cxx_destruct
{
}

@end