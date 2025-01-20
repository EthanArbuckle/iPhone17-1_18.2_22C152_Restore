@interface LPDomainNameIndicator
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPDomainNameIndicator)initWithHost:(id)a3;
- (LPDomainNameIndicator)initWithHost:(id)a3 domainName:(id)a4 theme:(id)a5;
- (void)layoutComponentView;
@end

@implementation LPDomainNameIndicator

- (LPDomainNameIndicator)initWithHost:(id)a3
{
  return 0;
}

- (LPDomainNameIndicator)initWithHost:(id)a3 domainName:(id)a4 theme:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v37.receiver = self;
  v37.super_class = (Class)LPDomainNameIndicator;
  v11 = [(LPComponentView *)&v37 initWithHost:v8];
  v12 = v11;
  if (v11)
  {
    [(LPDomainNameIndicator *)v11 setUserInteractionEnabled:0];
    v13 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v13];
    blurView = v12->_blurView;
    v12->_blurView = (UIVisualEffectView *)v14;

    id v16 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v17 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v13 style:0];
    uint64_t v18 = [v16 initWithEffect:v17];
    vibrancyView = v12->_vibrancyView;
    v12->_vibrancyView = (UIVisualEffectView *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4FB1838]);
    v21 = objc_msgSend(MEMORY[0x1E4FB1818], "_lp_systemImageNamed:", @"safari.fill");
    uint64_t v22 = [v20 initWithImage:v21];
    glyphView = v12->_glyphView;
    v12->_glyphView = (UIImageView *)v22;

    [(UIImageView *)v12->_glyphView setContentMode:4];
    v24 = (void *)MEMORY[0x1E4FB1830];
    v25 = [v10 domainNameIndicatorIconFont];
    v26 = [v24 configurationWithFont:v25];
    [(UIImageView *)v12->_glyphView setPreferredSymbolConfiguration:v26];

    v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v12->_label;
    v12->_label = v27;

    [(UILabel *)v12->_label setText:v9];
    v29 = [v10 domainNameIndicatorFont];
    [(UILabel *)v12->_label setFont:v29];

    [(UILabel *)v12->_label setNumberOfLines:1];
    [(UILabel *)v12->_label setLineBreakMode:4];
    [(UILabel *)v12->_label setBaselineAdjustment:2];
    LODWORD(v30) = 1148846080;
    [(UILabel *)v12->_label setContentCompressionResistancePriority:1 forAxis:v30];
    LODWORD(v31) = 1132068864;
    [(UILabel *)v12->_label setContentCompressionResistancePriority:0 forAxis:v31];
    [(LPDomainNameIndicator *)v12 addSubview:v12->_blurView];
    v32 = [(UIVisualEffectView *)v12->_blurView contentView];
    [v32 addSubview:v12->_vibrancyView];

    v33 = [(UIVisualEffectView *)v12->_vibrancyView contentView];
    [v33 addSubview:v12->_glyphView];

    v34 = [(UIVisualEffectView *)v12->_vibrancyView contentView];
    [v34 addSubview:v12->_label];

    v35 = v12;
  }

  return v12;
}

- (void)layoutComponentView
{
  [(LPDomainNameIndicator *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIImageView sizeThatFits:](self->_glyphView, "sizeThatFits:", v3, v5);
  double v8 = v7;
  double v10 = v9;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v4, v6);
  double v26 = v11;
  double v13 = v12;
  [(LPDomainNameIndicator *)self bounds];
  CGRect v29 = CGRectInset(v28, 10.0, 10.0);
  double y = v29.origin.y;
  double x = v29.origin.x;
  double width = v29.size.width;
  double height = v29.size.height;
  if ([(UIView *)self _lp_isLTR])
  {
    [(UIImageView *)self->_glyphView layoutMargins];
    double v17 = v16;
    double v18 = 5.0;
    v30.origin.double x = 5.0;
    v30.origin.double y = 5.0;
    v30.size.double width = v8;
    v30.size.double height = v10;
    double v19 = CGRectGetMaxX(v30) + v17;
  }
  else
  {
    double v18 = width + -5.0 - v8;
    [(UILabel *)self->_label layoutMargins];
    double v19 = v20;
  }
  v31.origin.double y = 5.0;
  v31.origin.double x = v18;
  v31.size.double width = v8;
  v31.size.double height = v10;
  CGFloat v21 = CGRectGetMidY(v31) - v13 * 0.5;
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:", x, y, width, height);
  [(UIVisualEffectView *)self->_blurView bounds];
  -[UIVisualEffectView setFrame:](self->_vibrancyView, "setFrame:");
  -[UIImageView setFrame:](self->_glyphView, "setFrame:", v18, 5.0, v8, v10);
  -[UILabel setFrame:](self->_label, "setFrame:", v19, v21, v26, v13);
  blurView = self->_blurView;
  [(UIVisualEffectView *)blurView frame];

  [(UIVisualEffectView *)blurView _lp_setCornerRadius:v23 * 0.5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UIImageView sizeThatFits:](self->_glyphView, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width, height);
  double v11 = v10;
  [(UIImageView *)self->_glyphView layoutMargins];
  double v13 = v12;
  [(UILabel *)self->_label layoutMargins];
  double v15 = v11 + v7 + 25.0 + v13 + v14;
  double v16 = v9 + 20.0 + 10.0;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_blurView, 0);

  objc_storeStrong((id *)&self->_vibrancyView, 0);
}

@end