@interface FAStandardInviteView
- (FAStandardInviteView)initWithInvite:(id)a3 hideLocationSharing:(BOOL)a4;
- (double)_heightForText:(id)a3 width:(double)a4;
- (double)_heightForTitle:(id)a3 width:(double)a4;
- (double)desiredHeightForWidth:(double)a3;
- (id)_labelWithCenteredText:(id)a3;
- (void)layoutSubviews;
@end

@implementation FAStandardInviteView

- (FAStandardInviteView)initWithInvite:(id)a3 hideLocationSharing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FAStandardInviteView;
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  v11 = -[FAStandardInviteView initWithFrame:](&v40, sel_initWithFrame_, *MEMORY[0x263F001A8], v8, v9, v10);
  if (v11)
  {
    BOOL v39 = v4;
    v12 = [v6 organizerFirstName];
    v13 = [v6 organizerLastName];
    v14 = AAUICopyCompositeName();
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (UILabel *)v15;

    v17 = v11->_titleLabel;
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"FAMILY_INVITATION_PAGE_TITLE" value:&stru_26CA2C800 table:@"Localizable"];
    [(UILabel *)v17 setText:v19];

    [(UILabel *)v11->_titleLabel setTextAlignment:1];
    [(UILabel *)v11->_titleLabel setNumberOfLines:0];
    v20 = v11->_titleLabel;
    v21 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPageTitle");
    [(UILabel *)v20 setFont:v21];

    [(FAStandardInviteView *)v11 addSubview:v11->_titleLabel];
    v22 = (void *)MEMORY[0x263F827E8];
    v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v24 = [v22 imageNamed:@"FamilySharingLogo" inBundle:v23];

    uint64_t v25 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v24];
    familySharingLogo = v11->_familySharingLogo;
    v11->_familySharingLogo = (UIImageView *)v25;

    [(FAStandardInviteView *)v11 addSubview:v11->_familySharingLogo];
    v27 = [v6 organizerEmail];

    v28 = NSString;
    v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v30 = v29;
    if (v27)
    {
      v31 = [v29 localizedStringForKey:@"FAMILY_INVITATION_DESCRIPTION_WITH_EMAIL" value:&stru_26CA2C800 table:@"Localizable"];
      v32 = [v6 organizerEmail];
      v33 = objc_msgSend(v28, "stringWithFormat:", v31, v14, v32);
    }
    else
    {
      v31 = [v29 localizedStringForKey:@"FAMILY_INVITATION_DESCRIPTION" value:&stru_26CA2C800 table:@"Localizable"];
      v33 = objc_msgSend(v28, "stringWithFormat:", v31, v14);
    }

    uint64_t v34 = [(FAStandardInviteView *)v11 _labelWithCenteredText:v33];
    inviteHeaderLabel = v11->_inviteHeaderLabel;
    v11->_inviteHeaderLabel = (UILabel *)v34;

    [(FAStandardInviteView *)v11 addSubview:v11->_inviteHeaderLabel];
    v36 = [[FAFamilySharingFeaturesView alloc] initWithContext:1 hideLocationSharing:v39];
    featuresView = v11->_featuresView;
    v11->_featuresView = v36;

    [(FAStandardInviteView *)v11 addSubview:v11->_featuresView];
  }

  return v11;
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)FAStandardInviteView;
  [(FAStandardInviteView *)&v39 layoutSubviews];
  [(FAStandardInviteView *)self frame];
  double v4 = v3;
  v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 88.0;
  }
  else {
    double v7 = 28.0;
  }
  double v8 = v4 - v7;
  double v9 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  double v11 = 56.0;
  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v11 = 176.0;
  }
  double v12 = v4 - v11;
  [(UILabel *)self->_titleLabel frame];
  double v14 = v13;
  uint64_t v15 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v17 = 44.0;
  }
  else {
    double v17 = 14.0;
  }
  v18 = [(UILabel *)self->_titleLabel text];
  [(FAStandardInviteView *)self _heightForTitle:v18 width:v8];
  double v20 = v19;

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v17, v14, v8, v20);
  [(UIImageView *)self->_familySharingLogo sizeToFit];
  [(UIImageView *)self->_familySharingLogo frame];
  double v22 = v21;
  double v24 = v23;
  [(UIImageView *)self->_familySharingLogo size];
  UIRoundToViewScale();
  double v26 = v25;
  UIRoundToViewScale();
  double v28 = v14 + v20 + v27;
  -[UIImageView setFrame:](self->_familySharingLogo, "setFrame:", v26, v28, v22, v24);
  [(UILabel *)self->_inviteHeaderLabel frame];
  v29 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v30 = [v29 userInterfaceIdiom];

  if ((v30 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v31 = 88.0;
  }
  else {
    double v31 = 28.0;
  }
  double v32 = v24 + v28 + 29.0;
  v33 = [(UILabel *)self->_inviteHeaderLabel text];
  [(FAStandardInviteView *)self _heightForText:v33 width:v12];
  double v35 = v34;

  -[UILabel setFrame:](self->_inviteHeaderLabel, "setFrame:", v31, v32, v12, v35);
  [(FAFamilySharingFeaturesView *)self->_featuresView frame];
  [(FAStandardInviteView *)self frame];
  double v37 = v36 + -60.0;
  -[FAFamilySharingFeaturesView systemLayoutSizeFittingSize:](self->_featuresView, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  -[FAFamilySharingFeaturesView setFrame:](self->_featuresView, "setFrame:", 30.0, v32 + v35 + 18.0, v37, v38);
}

- (double)desiredHeightForWidth:(double)a3
{
  v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 88.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v7 = 28.0;
  }
  double v8 = a3 - v7;
  double v9 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  double v11 = 56.0;
  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v11 = 176.0;
  }
  double v12 = a3 - v11;
  double v13 = [(UILabel *)self->_titleLabel text];
  [(FAStandardInviteView *)self _heightForTitle:v13 width:v8];
  double v15 = v14;

  [(UIImageView *)self->_familySharingLogo size];
  double v17 = v16;
  v18 = [(UILabel *)self->_inviteHeaderLabel text];
  [(FAStandardInviteView *)self _heightForText:v18 width:v12];
  double v20 = v19;

  -[FAFamilySharingFeaturesView systemLayoutSizeFittingSize:](self->_featuresView, "systemLayoutSizeFittingSize:", a3 + -60.0, *(double *)(MEMORY[0x263F83810] + 8));
  double v22 = v15 + v17 + v20 + v21;
  UIRoundToViewScale();
  return v23 + v22 + 18.0 + 29.0 + 10.0;
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
  double v7 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
  [v6 setFont:v7];

  return v6;
}

- (double)_heightForText:(id)a3 width:(double)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F814F0];
  id v5 = (void *)MEMORY[0x263F81708];
  id v6 = a3;
  double v7 = [v5 systemFontOfSize:16.0];
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
  objc_storeStrong((id *)&self->_featuresView, 0);
  objc_storeStrong((id *)&self->_inviteHeaderLabel, 0);
  objc_storeStrong((id *)&self->_familySharingLogo, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end