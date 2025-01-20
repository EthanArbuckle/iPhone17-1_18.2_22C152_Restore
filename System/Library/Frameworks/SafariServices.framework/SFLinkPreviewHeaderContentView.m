@interface SFLinkPreviewHeaderContentView
- (BOOL)isPreviewEnabled;
- (NSString)domain;
- (SFLinkPreviewHeaderContentView)initWithStyle:(int64_t)a3;
- (SFLinkPreviewHeaderContentViewDelegate)delegate;
- (id)secondaryLabelColor;
- (int64_t)style;
- (void)_togglePreviewButtonPressed;
- (void)_updateDomainWithHidePreviewActionConstraints;
- (void)_updateSafariIconWithShowPreviewActionConstraints;
- (void)setDelegate:(id)a3;
- (void)setDomain:(id)a3;
- (void)setPreviewEnabled:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation SFLinkPreviewHeaderContentView

- (SFLinkPreviewHeaderContentView)initWithStyle:(int64_t)a3
{
  v33.receiver = self;
  v33.super_class = (Class)SFLinkPreviewHeaderContentView;
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = -[SFLinkPreviewHeaderContentView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
    domainLabel = v9->_domainLabel;
    v9->_domainLabel = (UILabel *)v10;

    [(UILabel *)v9->_domainLabel setLineBreakMode:3];
    [(UILabel *)v9->_domainLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v12 = *MEMORY[0x1E4FB28F0];
    uint64_t v13 = *MEMORY[0x1E4FB2790];
    v14 = [MEMORY[0x1E4FB1798] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] maximumContentSizeCategory:*MEMORY[0x1E4FB2790]];
    [(UILabel *)v9->_domainLabel setFont:v14];

    v15 = [(SFLinkPreviewHeaderContentView *)v9 secondaryLabelColor];
    [(UILabel *)v9->_domainLabel setTextColor:v15];

    [(SFLinkPreviewHeaderContentView *)v9 addSubview:v9->_domainLabel];
    v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"safari"];
    uint64_t v17 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    togglePreviewButton = v9->_togglePreviewButton;
    v9->_togglePreviewButton = (UIButton *)v17;

    v19 = v9->_togglePreviewButton;
    v20 = _WBSLocalizedString();
    [(UIButton *)v19 setTitle:v20 forState:0];

    v21 = v9->_togglePreviewButton;
    v22 = [(SFLinkPreviewHeaderContentView *)v9 secondaryLabelColor];
    [(UIButton *)v21 setTitleColor:v22 forState:0];

    v23 = [MEMORY[0x1E4FB1798] _preferredFontForTextStyle:v12 maximumContentSizeCategory:v13];
    v24 = [(UIButton *)v9->_togglePreviewButton titleLabel];
    [v24 setFont:v23];

    LODWORD(v25) = 1144766464;
    [(UIButton *)v9->_togglePreviewButton setContentCompressionResistancePriority:0 forAxis:v25];
    id v26 = objc_alloc(MEMORY[0x1E4FB1838]);
    v27 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v28 = [v16 imageWithTintColor:v27 renderingMode:1];
    uint64_t v29 = [v26 initWithImage:v28];
    safariIcon = v9->_safariIcon;
    v9->_safariIcon = (UIImageView *)v29;

    [(SFLinkPreviewHeaderContentView *)v9 addSubview:v9->_safariIcon];
    [(UIImageView *)v9->_safariIcon setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v9->_togglePreviewButton addTarget:v9 action:sel__togglePreviewButtonPressed forControlEvents:0x2000];
    [(UIButton *)v9->_togglePreviewButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFLinkPreviewHeaderContentView *)v9 addSubview:v9->_togglePreviewButton];
    v31 = v9;
  }
  return v9;
}

- (id)secondaryLabelColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (void)setDomain:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_domain, "isEqualToString:"))
  {
    double v4 = (NSString *)[v6 copy];
    domain = self->_domain;
    self->_domain = v4;

    [(UILabel *)self->_domainLabel setText:self->_domain];
    [(SFLinkPreviewHeaderContentView *)self setNeedsUpdateConstraints];
  }
}

- (void)setPreviewEnabled:(BOOL)a3
{
  if (self->_previewEnabled == a3) {
    return;
  }
  self->_previewEnabled = a3;
  if (a3)
  {
    if (!self->_style) {
      [(UIImageView *)self->_safariIcon removeFromSuperview];
    }
    double v4 = &OBJC_IVAR___SFLinkPreviewHeaderContentView__domainLabel;
    goto LABEL_8;
  }
  [(UILabel *)self->_domainLabel removeFromSuperview];
  if (!self->_style)
  {
    double v4 = &OBJC_IVAR___SFLinkPreviewHeaderContentView__safariIcon;
LABEL_8:
    [(SFLinkPreviewHeaderContentView *)self addSubview:*(Class *)((char *)&self->super.super.super.super.super.isa + *v4)];
  }
  togglePreviewButton = self->_togglePreviewButton;
  id v6 = _WBSLocalizedString();
  [(UIButton *)togglePreviewButton setTitle:v6 forState:0];

  [(SFLinkPreviewHeaderContentView *)self setNeedsUpdateConstraints];
}

- (void)_togglePreviewButtonPressed
{
  [(SFLinkPreviewHeaderContentView *)self setPreviewEnabled:!self->_previewEnabled];
  id v3 = [(SFLinkPreviewHeaderContentView *)self delegate];
  objc_msgSend(v3, "linkPreviewHeaderContentView:didEnableLinkPreview:", self, -[SFLinkPreviewHeaderContentView isPreviewEnabled](self, "isPreviewEnabled"));
}

- (void)_updateDomainWithHidePreviewActionConstraints
{
  v26[7] = *MEMORY[0x1E4F143B8];
  if (!self->_domainWithHidePreviewActionConstraints)
  {
    double v25 = [(UILabel *)self->_domainLabel centerYAnchor];
    v24 = [(SFLinkPreviewHeaderContentView *)self centerYAnchor];
    v23 = [v25 constraintEqualToAnchor:v24 constant:0.0];
    v26[0] = v23;
    v22 = [(UILabel *)self->_domainLabel heightAnchor];
    v21 = [(SFLinkPreviewHeaderContentView *)self heightAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v26[1] = v20;
    v19 = [(UILabel *)self->_domainLabel leadingAnchor];
    v18 = [(SFLinkPreviewHeaderContentView *)self leadingAnchor];
    uint64_t v17 = [v19 constraintEqualToAnchor:v18 constant:16.0];
    v26[2] = v17;
    v16 = [(UILabel *)self->_domainLabel trailingAnchor];
    v15 = [(UIButton *)self->_togglePreviewButton leadingAnchor];
    v14 = [v16 constraintLessThanOrEqualToAnchor:v15 constant:-16.0];
    v26[3] = v14;
    uint64_t v13 = [(UIButton *)self->_togglePreviewButton trailingAnchor];
    id v3 = [(SFLinkPreviewHeaderContentView *)self trailingAnchor];
    double v4 = [v13 constraintEqualToAnchor:v3 constant:-16.0];
    v26[4] = v4;
    double v5 = [(UIButton *)self->_togglePreviewButton topAnchor];
    id v6 = [(SFLinkPreviewHeaderContentView *)self topAnchor];
    double v7 = [v5 constraintEqualToAnchor:v6];
    v26[5] = v7;
    v8 = [(UIButton *)self->_togglePreviewButton bottomAnchor];
    v9 = [(SFLinkPreviewHeaderContentView *)self bottomAnchor];
    uint64_t v10 = [v8 constraintEqualToAnchor:v9];
    v26[6] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];
    domainWithHidePreviewActionConstraints = self->_domainWithHidePreviewActionConstraints;
    self->_domainWithHidePreviewActionConstraints = v11;
  }
}

- (void)_updateSafariIconWithShowPreviewActionConstraints
{
  v27[8] = *MEMORY[0x1E4F143B8];
  if (!self->_safariIconWithShowPreviewActionConstraints)
  {
    id v26 = [(UIImageView *)self->_safariIcon leadingAnchor];
    double v25 = [(SFLinkPreviewHeaderContentView *)self leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25 constant:16.0];
    v27[0] = v24;
    v23 = [(UIImageView *)self->_safariIcon centerYAnchor];
    v22 = [(SFLinkPreviewHeaderContentView *)self centerYAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v27[1] = v21;
    v20 = [(UIImageView *)self->_safariIcon widthAnchor];
    v19 = [v20 constraintEqualToConstant:16.0];
    v27[2] = v19;
    v18 = [(UIImageView *)self->_safariIcon heightAnchor];
    uint64_t v17 = [v18 constraintEqualToConstant:16.0];
    v27[3] = v17;
    v16 = [(UIImageView *)self->_safariIcon trailingAnchor];
    v15 = [(UIButton *)self->_togglePreviewButton leadingAnchor];
    v14 = [v16 constraintEqualToAnchor:v15 constant:-6.0];
    v27[4] = v14;
    uint64_t v13 = [(UIButton *)self->_togglePreviewButton topAnchor];
    id v3 = [(SFLinkPreviewHeaderContentView *)self topAnchor];
    double v4 = [v13 constraintEqualToAnchor:v3];
    v27[5] = v4;
    double v5 = [(UIButton *)self->_togglePreviewButton bottomAnchor];
    id v6 = [(SFLinkPreviewHeaderContentView *)self bottomAnchor];
    double v7 = [v5 constraintEqualToAnchor:v6];
    v27[6] = v7;
    v8 = [(UIButton *)self->_togglePreviewButton trailingAnchor];
    v9 = [(SFLinkPreviewHeaderContentView *)self trailingAnchor];
    uint64_t v10 = [v8 constraintLessThanOrEqualToAnchor:v9 constant:-16.0];
    v27[7] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:8];
    safariIconWithShowPreviewActionConstraints = self->_safariIconWithShowPreviewActionConstraints;
    self->_safariIconWithShowPreviewActionConstraints = v11;
  }
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)SFLinkPreviewHeaderContentView;
  [(SFLinkPreviewHeaderContentView *)&v3 updateConstraints];
  if (self->_previewEnabled) {
    [(SFLinkPreviewHeaderContentView *)self _updateDomainWithHidePreviewActionConstraints];
  }
  else {
    [(SFLinkPreviewHeaderContentView *)self _updateSafariIconWithShowPreviewActionConstraints];
  }
  objc_msgSend(MEMORY[0x1E4F28DC8], "sf_setConstraints:active:", self->_domainWithHidePreviewActionConstraints, self->_previewEnabled);
  objc_msgSend(MEMORY[0x1E4F28DC8], "sf_setConstraints:active:", self->_safariIconWithShowPreviewActionConstraints, !self->_previewEnabled);
}

- (SFLinkPreviewHeaderContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFLinkPreviewHeaderContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)isPreviewEnabled
{
  return self->_previewEnabled;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_safariIconWithShowPreviewActionConstraints, 0);
  objc_storeStrong((id *)&self->_domainWithHidePreviewActionConstraints, 0);
  objc_storeStrong((id *)&self->_safariIcon, 0);
  objc_storeStrong((id *)&self->_togglePreviewButton, 0);

  objc_storeStrong((id *)&self->_domainLabel, 0);
}

@end