@interface SiriGKAlternateResultView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriGKAlternateResultView)initWithAlternateResult:(id)a3;
- (id)selectionResponseTitle;
- (void)layoutSubviews;
@end

@implementation SiriGKAlternateResultView

- (SiriGKAlternateResultView)initWithAlternateResult:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SiriGKAlternateResultView;
  v6 = [(SiriGKAlternateResultView *)&v17 init];
  p_isa = (id *)&v6->super.super.super.super.isa;
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_result, a3);
  v8 = [v5 command];
  [p_isa setCommand:v8];

  objc_msgSend(p_isa, "setEdgeInsets:", 0.0, SiriUIPlatterStyle[32], 0.0, SiriUIPlatterStyle[34]);
  v9 = [v5 name];

  if (v9)
  {
    uint64_t v10 = +[SiriSharedUIContentLabel label];
    id v11 = p_isa[7];
    p_isa[7] = (id)v10;

    id v12 = p_isa[7];
    v13 = +[UIFont siriui_lightWeightFontWithSize:18.0];
    [v12 setFont:v13];

    [p_isa[7] setNumberOfLines:4];
    id v14 = p_isa[7];
    v15 = [v5 name];
    [v14 setText:v15];

    [p_isa addSubview:p_isa[7]];
LABEL_4:
    v9 = p_isa;
  }

  return v9;
}

- (id)selectionResponseTitle
{
  v3 = [(SiriGKView *)self command];

  if (v3)
  {
    v4 = [(UILabel *)self->_titleLabel text];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SiriGKView *)self edgeInsets];
  double v8 = width - (v6 + v7);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v8, height - (v9 + v10));
  double v12 = v11 + 22.0;
  double v13 = v8;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)SiriGKAlternateResultView;
  [(SiriGKAlternateResultView *)&v17 layoutSubviews];
  [(SiriGKAlternateResultView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(UILabel *)self->_titleLabel frame];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, v8);
  double v10 = v9;
  double v11 = +[UIScreen mainScreen];
  [v11 scale];
  double v13 = v12;
  [(SiriGKAlternateResultView *)self bounds];
  double v15 = ceil(v14 * 0.5 - v10 * 0.5);
  if (v13 >= 2.0) {
    double v16 = v14 * 0.5 - v10 * 0.5;
  }
  else {
    double v16 = v15;
  }

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v4, v16, v6, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

@end