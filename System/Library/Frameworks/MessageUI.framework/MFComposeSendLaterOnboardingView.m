@interface MFComposeSendLaterOnboardingView
- (MFComposeSendLaterOnboardingView)initWithFrame:(CGRect)a3;
- (UIButton)cancelButton;
- (UIImageView)sendLaterImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)setSendLaterImageView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation MFComposeSendLaterOnboardingView

- (MFComposeSendLaterOnboardingView)initWithFrame:(CGRect)a3
{
  v48[2] = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)MFComposeSendLaterOnboardingView;
  v3 = -[MFComposeSendLaterOnboardingView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    sendLaterImageView = v3->_sendLaterImageView;
    v3->_sendLaterImageView = v4;

    v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.circle.badge.clock"];
    [(UIImageView *)v3->_sendLaterImageView setImage:v6];

    [(UIImageView *)v3->_sendLaterImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2928]];
    [(UIImageView *)v3->_sendLaterImageView setPreferredSymbolConfiguration:v7];

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v8;

    v10 = _EFLocalizedString();
    [(UILabel *)v3->_titleLabel setText:v10];

    v11 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2908] weight:*MEMORY[0x1E4FB09D0]];
    [(UILabel *)v3->_titleLabel setFont:v11];

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v12;

    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v3->_subtitleLabel setTextColor:v14];

    v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)v3->_subtitleLabel setFont:v15];

    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v3->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    v43 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    v16 = (void *)MEMORY[0x1E4FB1830];
    v17 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] weight:*MEMORY[0x1E4FB09B8]];
    v18 = [v16 configurationWithFont:v17];
    [v43 setPreferredSymbolConfigurationForImage:v18];

    v19 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    [v43 setImage:v19];

    v20 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [v43 setBaseForegroundColor:v20];

    objc_msgSend(v43, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    uint64_t v21 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v43 primaryAction:0];
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (UIButton *)v21;

    LODWORD(v23) = 1148846080;
    [(UIButton *)v3->_cancelButton setContentHuggingPriority:0 forAxis:v23];
    id v24 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    v48[0] = v3->_titleLabel;
    v48[1] = v3->_subtitleLabel;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    objc_msgSend(v24, "mf_addArrangedSubviews:", v25);

    [v24 setAxis:1];
    [v24 setSpacing:4.0];
    id v26 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    v47[0] = v3->_sendLaterImageView;
    v47[1] = v24;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
    objc_msgSend(v26, "mf_addArrangedSubviews:", v27);

    [v26 setAxis:0];
    [v26 setAlignment:1];
    [v26 setSpacing:12.0];
    id v28 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    v46[0] = v26;
    v46[1] = v3->_cancelButton;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    objc_msgSend(v28, "mf_addArrangedSubviews:", v29);

    [v28 setAxis:0];
    [v28 setAlignment:1];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v28 setSpacing:8.0];
    id v30 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v30 addSubview:v28];
    [(MFComposeSendLaterOnboardingView *)v3 addSubview:v30];
    objc_msgSend(v28, "mf_pinToView:usingLayoutMargins:", v30, 1);
    v31 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v30 setBackgroundColor:v31];

    v32 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v30 setBackgroundColor:v32];

    v33 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UIImageView *)v3->_sendLaterImageView setTintColor:v33];

    v34 = _EFLocalizedString();
    [(UILabel *)v3->_subtitleLabel setText:v34];

    v35 = [v30 layer];
    [v35 setCornerRadius:10.0];

    v36 = [v30 layer];
    [v36 setMasksToBounds:1];

    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(v30, "setDirectionalLayoutMargins:", 8.0, 13.0, 8.0, 13.0);
    objc_msgSend(v30, "mf_pinToView:usingLayoutMargins:", v3, 1);
    -[MFComposeSendLaterOnboardingView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", 0.0, 16.0, 16.0, 16.0);
    v37 = (void *)MEMORY[0x1E4F28DC8];
    v38 = [(UIImageView *)v3->_sendLaterImageView heightAnchor];
    v39 = [(UIImageView *)v3->_sendLaterImageView widthAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v45 = v40;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    [v37 activateConstraints:v41];
  }
  return v3;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIImageView)sendLaterImageView
{
  return self->_sendLaterImageView;
}

- (void)setSendLaterImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendLaterImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_cancelButton, 0);
}

@end