@interface FAChildTransferInviteView
- (FAChildTransferInviteView)initWithInvite:(id)a3;
- (double)_heightForText:(id)a3 width:(double)a4;
- (double)_heightForTitle:(id)a3 width:(double)a4;
- (double)desiredHeightForWidth:(double)a3;
- (id)_labelWithCenteredText:(id)a3;
- (void)layoutSubviews;
@end

@implementation FAChildTransferInviteView

- (FAChildTransferInviteView)initWithInvite:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)FAChildTransferInviteView;
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = -[FAChildTransferInviteView initWithFrame:](&v38, sel_initWithFrame_, *MEMORY[0x263F001A8], v6, v7, v8);
  if (v9)
  {
    v10 = [v4 organizerFirstName];
    v11 = [v4 organizerLastName];
    v12 = AAUICopyCompositeName();

    v13 = [v4 childFirstName];
    v14 = [v4 childLastName];
    v15 = AAUICopyCompositeName();

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = (UILabel *)v16;

    v18 = v9->_titleLabel;
    v19 = NSString;
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"FAMILY_CHILD_TRANSFER_TITLE" value:&stru_26CA2C800 table:@"Localizable"];
    v22 = objc_msgSend(v19, "stringWithFormat:", v21, v15);
    [(UILabel *)v18 setText:v22];

    [(UILabel *)v9->_titleLabel setTextAlignment:1];
    [(UILabel *)v9->_titleLabel setNumberOfLines:0];
    v23 = v9->_titleLabel;
    v24 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPageTitle");
    [(UILabel *)v23 setFont:v24];

    [(FAChildTransferInviteView *)v9 addSubview:v9->_titleLabel];
    v25 = NSString;
    v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"FAMILY_CHILD_TRANSFER_MESSAGE" value:&stru_26CA2C800 table:@"Localizable"];
    v28 = objc_msgSend(v25, "stringWithFormat:", v27, v12, v15);

    uint64_t v29 = [(FAChildTransferInviteView *)v9 _labelWithCenteredText:v28];
    primaryLabel = v9->_primaryLabel;
    v9->_primaryLabel = (UILabel *)v29;

    [(FAChildTransferInviteView *)v9 addSubview:v9->_primaryLabel];
    v31 = NSString;
    v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v33 = [v32 localizedStringForKey:@"FAMILY_CHILD_TRANSFER_DETAILS" value:&stru_26CA2C800 table:@"Localizable"];
    v34 = objc_msgSend(v31, "stringWithFormat:", v33, v15, v12, v15);

    uint64_t v35 = [(FAChildTransferInviteView *)v9 _labelWithCenteredText:v34];
    detailsLabel = v9->_detailsLabel;
    v9->_detailsLabel = (UILabel *)v35;

    [(FAChildTransferInviteView *)v9 addSubview:v9->_detailsLabel];
  }

  return v9;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)FAChildTransferInviteView;
  [(FAChildTransferInviteView *)&v33 layoutSubviews];
  [(FAChildTransferInviteView *)self frame];
  double v4 = v3;
  double v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 56.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 176.0;
  }
  double v8 = v4 - v7;
  [(UILabel *)self->_titleLabel frame];
  double v10 = v9;
  v11 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v13 = 88.0;
  }
  else {
    double v13 = 28.0;
  }
  v14 = [(UILabel *)self->_titleLabel text];
  [(FAChildTransferInviteView *)self _heightForTitle:v14 width:v8];
  double v16 = v15;

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v13, v10, v8, v16);
  [(UILabel *)self->_primaryLabel frame];
  v17 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v18 = [v17 userInterfaceIdiom];

  if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v19 = 88.0;
  }
  else {
    double v19 = 28.0;
  }
  UIRoundToViewScale();
  double v21 = v10 + v16 + v20;
  v22 = [(UILabel *)self->_primaryLabel text];
  [(FAChildTransferInviteView *)self _heightForText:v22 width:v8];
  double v24 = v23;

  -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v19, v21, v8, v24);
  [(UILabel *)self->_detailsLabel frame];
  v25 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v26 = [v25 userInterfaceIdiom];

  if ((v26 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v27 = 88.0;
  }
  else {
    double v27 = 28.0;
  }
  UIRoundToViewScale();
  double v29 = v21 + v24 + v28;
  v30 = [(UILabel *)self->_detailsLabel text];
  [(FAChildTransferInviteView *)self _heightForText:v30 width:v8];
  double v32 = v31;

  -[UILabel setFrame:](self->_detailsLabel, "setFrame:", v27, v29, v8, v32);
}

- (double)desiredHeightForWidth:(double)a3
{
  double v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 56.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 176.0;
  }
  double v8 = a3 - v7;
  double v9 = [(UILabel *)self->_titleLabel text];
  [(FAChildTransferInviteView *)self _heightForTitle:v9 width:v8];
  double v11 = v10;

  uint64_t v12 = [(UILabel *)self->_primaryLabel text];
  [(FAChildTransferInviteView *)self _heightForText:v12 width:v8];
  double v14 = v13;

  double v15 = [(UILabel *)self->_detailsLabel text];
  [(FAChildTransferInviteView *)self _heightForText:v15 width:v8];
  double v17 = v16;

  UIRoundToViewScale();
  return v11 + v14 + v17 + v18 * 2.0;
}

- (id)_labelWithCenteredText:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x263F828E0];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v6 setText:v4];

  [v6 setTextAlignment:1];
  [v6 setNumberOfLines:0];
  double v7 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPrimaryInformationLabel");
  [v6 setFont:v7];

  return v6;
}

- (double)_heightForText:(id)a3 width:(double)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F814F0];
  id v5 = (void *)MEMORY[0x263F81708];
  id v6 = a3;
  double v7 = objc_msgSend(v5, "aa_fontForPrimaryInformationLabel");
  v13[0] = v7;
  double v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a4, 1.79769313e308);
  double v10 = v9;

  return v10;
}

- (double)_heightForTitle:(id)a3 width:(double)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F814F0];
  id v5 = (void *)MEMORY[0x263F81708];
  id v6 = a3;
  double v7 = objc_msgSend(v5, "aa_fontForPageTitle");
  v13[0] = v7;
  double v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a4, 1.79769313e308);
  double v10 = v9;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end