@interface HUBadgeAndDisclosureAccessoryView
+ (id)_disclosureImage;
- (HUBadgeAndDisclosureAccessoryView)initWithFrame:(CGRect)a3;
- (UIImageView)badgeImageView;
- (UIImageView)disclosureImageView;
- (UILabel)badgeLabel;
- (UIView)badgeContainerView;
- (int64_t)badgeCount;
- (void)setBadgeContainerView:(id)a3;
- (void)setBadgeCount:(int64_t)a3;
- (void)setBadgeImageView:(id)a3;
- (void)setBadgeLabel:(id)a3;
- (void)setDisclosureImageView:(id)a3;
@end

@implementation HUBadgeAndDisclosureAccessoryView

+ (id)_disclosureImage
{
  if (qword_1EBA468E8 != -1) {
    dispatch_once(&qword_1EBA468E8, &__block_literal_global_6);
  }
  v2 = (void *)_MergedGlobals_1;

  return v2;
}

void __53__HUBadgeAndDisclosureAccessoryView__disclosureImage__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:0 reuseIdentifier:0];
  uint64_t v0 = [v2 _disclosureChevronImage:0];
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;
}

- (HUBadgeAndDisclosureAccessoryView)initWithFrame:(CGRect)a3
{
  v62.receiver = self;
  v62.super_class = (Class)HUBadgeAndDisclosureAccessoryView;
  v3 = -[HUBadgeAndDisclosureAccessoryView initWithFrame:](&v62, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    badgeContainerView = v3->_badgeContainerView;
    v3->_badgeContainerView = v4;

    [(UIView *)v3->_badgeContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_badgeContainerView setHidden:1];
    [(HUBadgeAndDisclosureAccessoryView *)v3 addSubview:v3->_badgeContainerView];
    id v6 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v7 = HUImageNamed(@"HUSoftwareUpdateBadge");
    uint64_t v8 = [v6 initWithImage:v7];
    badgeImageView = v3->_badgeImageView;
    v3->_badgeImageView = (UIImageView *)v8;

    [(UIImageView *)v3->_badgeImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_badgeContainerView addSubview:v3->_badgeImageView];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    badgeLabel = v3->_badgeLabel;
    v3->_badgeLabel = v10;

    v12 = [MEMORY[0x1E4F42A30] systemFontOfSize:17.0];
    [(UILabel *)v3->_badgeLabel setFont:v12];

    v13 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UILabel *)v3->_badgeLabel setTextColor:v13];

    [(UILabel *)v3->_badgeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_badgeContainerView addSubview:v3->_badgeLabel];
    id v14 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v15 = [(id)objc_opt_class() _disclosureImage];
    uint64_t v16 = [v14 initWithImage:v15];
    disclosureImageView = v3->_disclosureImageView;
    v3->_disclosureImageView = (UIImageView *)v16;

    [(UIImageView *)v3->_disclosureImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HUBadgeAndDisclosureAccessoryView *)v3 addSubview:v3->_disclosureImageView];
    v18 = [MEMORY[0x1E4F1CA48] array];
    v19 = [(UIImageView *)v3->_badgeImageView leadingAnchor];
    v20 = [(UIView *)v3->_badgeContainerView leadingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v18 addObject:v21];

    v22 = [(UIImageView *)v3->_badgeImageView trailingAnchor];
    v23 = [(UIView *)v3->_badgeContainerView trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v18 addObject:v24];

    v25 = [(UIImageView *)v3->_badgeImageView topAnchor];
    v26 = [(UIView *)v3->_badgeContainerView topAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [v18 addObject:v27];

    v28 = [(UIImageView *)v3->_badgeImageView bottomAnchor];
    v29 = [(UIView *)v3->_badgeContainerView bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    [v18 addObject:v30];

    v31 = [(UILabel *)v3->_badgeLabel centerXAnchor];
    v32 = [(UIView *)v3->_badgeContainerView centerXAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    [v18 addObject:v33];

    v34 = [(UILabel *)v3->_badgeLabel centerYAnchor];
    v35 = [(UIView *)v3->_badgeContainerView centerYAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    [v18 addObject:v36];

    v37 = [(UIView *)v3->_badgeContainerView leadingAnchor];
    v38 = [(HUBadgeAndDisclosureAccessoryView *)v3 leadingAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    [v18 addObject:v39];

    v40 = [(UIView *)v3->_badgeContainerView topAnchor];
    v41 = [(HUBadgeAndDisclosureAccessoryView *)v3 topAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    [v18 addObject:v42];

    v43 = [(UIView *)v3->_badgeContainerView bottomAnchor];
    v44 = [(HUBadgeAndDisclosureAccessoryView *)v3 bottomAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [v18 addObject:v45];

    v46 = [(UIImageView *)v3->_disclosureImageView leadingAnchor];
    v47 = [(UIView *)v3->_badgeContainerView trailingAnchor];
    v48 = [v46 constraintEqualToAnchor:v47 constant:12.0];
    [v18 addObject:v48];

    v49 = [(UIImageView *)v3->_disclosureImageView trailingAnchor];
    v50 = [(HUBadgeAndDisclosureAccessoryView *)v3 trailingAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v18 addObject:v51];

    v52 = [(UIImageView *)v3->_disclosureImageView centerYAnchor];
    v53 = [(HUBadgeAndDisclosureAccessoryView *)v3 centerYAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    [v18 addObject:v54];

    [MEMORY[0x1E4F28DC8] activateConstraints:v18];
    [(HUBadgeAndDisclosureAccessoryView *)v3 bounds];
    double v56 = v55;
    double v58 = v57;
    -[HUBadgeAndDisclosureAccessoryView systemLayoutSizeFittingSize:](v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
    -[HUBadgeAndDisclosureAccessoryView setBounds:](v3, "setBounds:", v56, v58, v59, v60);
  }
  return v3;
}

- (void)setBadgeCount:(int64_t)a3
{
  if (self->_badgeCount != a3)
  {
    self->_badgeCount = a3;
    if (a3)
    {
      v4 = (void *)MEMORY[0x1E4F28EE0];
      v5 = objc_msgSend(NSNumber, "numberWithInteger:");
      id v6 = [v4 localizedStringFromNumber:v5 numberStyle:0];
      v7 = [(HUBadgeAndDisclosureAccessoryView *)self badgeLabel];
      [v7 setText:v6];

      uint64_t v8 = [(HUBadgeAndDisclosureAccessoryView *)self badgeContainerView];
      id v10 = v8;
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v8 = [(HUBadgeAndDisclosureAccessoryView *)self badgeContainerView];
      id v10 = v8;
      uint64_t v9 = 1;
    }
    [v8 setHidden:v9];
  }
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (UIView)badgeContainerView
{
  return self->_badgeContainerView;
}

- (void)setBadgeContainerView:(id)a3
{
}

- (UIImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
}

- (UILabel)badgeLabel
{
  return self->_badgeLabel;
}

- (void)setBadgeLabel:(id)a3
{
}

- (UIImageView)disclosureImageView
{
  return self->_disclosureImageView;
}

- (void)setDisclosureImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureImageView, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);

  objc_storeStrong((id *)&self->_badgeContainerView, 0);
}

@end