@interface FAFamilyHeaderView
- (FAFamilyHeaderView)initWithCoder:(id)a3;
- (FAFamilyHeaderView)initWithFamilyCircle:(id)a3 profilePictureStore:(id)a4;
- (FAFamilyHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)familyHeaderLabel;
@end

@implementation FAFamilyHeaderView

- (FAFamilyHeaderView)initWithCoder:(id)a3
{
  return 0;
}

- (FAFamilyHeaderView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (FAFamilyHeaderView)initWithFamilyCircle:(id)a3 profilePictureStore:(id)a4
{
  v42[7] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)FAFamilyHeaderView;
  v8 = -[FAFamilyHeaderView initWithFrame:](&v41, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    familyHeaderLabel = v8->_familyHeaderLabel;
    v8->_familyHeaderLabel = v9;

    [(UILabel *)v8->_familyHeaderLabel setTextAlignment:1];
    v11 = v8->_familyHeaderLabel;
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"FAMILY_SETTINGS_PAGE_TITLE" value:&stru_26CA2C800 table:@"Localizable"];
    [(UILabel *)v11 setText:v13];

    v14 = v8->_familyHeaderLabel;
    v15 = [MEMORY[0x263F81708] systemFontOfSize:24.0 weight:*MEMORY[0x263F81840]];
    [(UILabel *)v14 setFont:v15];

    [(UILabel *)v8->_familyHeaderLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v8->_familyHeaderLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FAFamilyHeaderView *)v8 addSubview:v8->_familyHeaderLabel];
    v16 = [[FAMugshotMarqueeView alloc] initWithFamilyCircle:v6 profilePictureStore:v7];
    mugShots = v8->_mugShots;
    v8->_mugShots = v16;

    [(FAMugshotMarqueeView *)v8->_mugShots setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FAFamilyHeaderView *)v8 addSubview:v8->_mugShots];
    v40 = [(FAMugshotMarqueeView *)v8->_mugShots leftAnchor];
    v39 = [(FAFamilyHeaderView *)v8 leftAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:8.0];
    v42[0] = v38;
    v37 = [(FAMugshotMarqueeView *)v8->_mugShots rightAnchor];
    v36 = [(FAFamilyHeaderView *)v8 rightAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:-8.0];
    v42[1] = v35;
    v34 = [(FAMugshotMarqueeView *)v8->_mugShots topAnchor];
    v33 = [(FAFamilyHeaderView *)v8 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33 constant:24.0];
    v42[2] = v32;
    v31 = [(UILabel *)v8->_familyHeaderLabel firstBaselineAnchor];
    v30 = [(FAMugshotMarqueeView *)v8->_mugShots bottomAnchor];
    v29 = [v31 constraintEqualToAnchor:v30 constant:40.0];
    v42[3] = v29;
    v28 = [(UILabel *)v8->_familyHeaderLabel leadingAnchor];
    v26 = [(FAFamilyHeaderView *)v8 leadingAnchor];
    v18 = [v28 constraintEqualToAnchor:v26 constant:8.0];
    v42[4] = v18;
    v19 = [(UILabel *)v8->_familyHeaderLabel trailingAnchor];
    v20 = [(FAFamilyHeaderView *)v8 trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20 constant:-8.0];
    v42[5] = v21;
    v22 = [(UILabel *)v8->_familyHeaderLabel firstBaselineAnchor];
    v23 = [(FAFamilyHeaderView *)v8 bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:-24.0];
    v42[6] = v24;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:7];

    [MEMORY[0x263F08938] activateConstraints:v27];
  }

  return v8;
}

- (UILabel)familyHeaderLabel
{
  return self->_familyHeaderLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyHeaderLabel, 0);
  objc_storeStrong((id *)&self->_mugShots, 0);
}

@end