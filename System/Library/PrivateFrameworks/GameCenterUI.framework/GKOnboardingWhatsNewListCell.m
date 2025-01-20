@interface GKOnboardingWhatsNewListCell
- (GKOnboardingWhatsNewListCell)initWithType:(unint64_t)a3;
- (NSArray)axConstraints;
- (NSArray)normalConstraints;
- (UIImageView)icon;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)getIconImageFromBundle:(id)a3;
- (id)getIconImageFromSFSymbol:(id)a3;
- (unint64_t)currentCellType;
- (void)createConstarints;
- (void)loadView;
- (void)setAxConstraints:(id)a3;
- (void)setIcon:(id)a3;
- (void)setNormalConstraints:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupCell;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GKOnboardingWhatsNewListCell

- (GKOnboardingWhatsNewListCell)initWithType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKOnboardingWhatsNewListCell;
  v4 = [(GKOnboardingWhatsNewListCell *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_currentCellType = a3;
    [(GKOnboardingWhatsNewListCell *)v4 loadView];
  }
  return v5;
}

- (void)loadView
{
  v3 = objc_opt_new();
  [(GKOnboardingWhatsNewListCell *)self setIcon:v3];

  v4 = [(GKOnboardingWhatsNewListCell *)self icon];
  [v4 setAccessibilityIgnoresInvertColors:1];

  v5 = [(GKOnboardingWhatsNewListCell *)self icon];
  [v5 setContentMode:1];

  v6 = [(GKOnboardingWhatsNewListCell *)self icon];
  [(GKOnboardingWhatsNewListCell *)self addSubview:v6];

  objc_super v7 = objc_opt_new();
  [(GKOnboardingWhatsNewListCell *)self setTitleLabel:v7];

  v8 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  [v8 setNumberOfLines:0];

  v9 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  [v9 setAdjustsFontForContentSizeCategory:1];

  v10 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  [v10 setLineBreakMode:0];

  v11 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  [(GKOnboardingWhatsNewListCell *)self addSubview:v11];

  v12 = objc_opt_new();
  [(GKOnboardingWhatsNewListCell *)self setSubtitleLabel:v12];

  v13 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  [v13 setLineBreakMode:0];

  v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v15 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  [v15 setTextColor:v14];

  v16 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  [v16 setNumberOfLines:0];

  v17 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  [v17 setAdjustsFontForContentSizeCategory:1];

  v18 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  [v18 setLineBreakMode:0];

  v19 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  [(GKOnboardingWhatsNewListCell *)self addSubview:v19];

  v20 = [(GKOnboardingWhatsNewListCell *)self icon];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(GKOnboardingWhatsNewListCell *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  [v23 setTextAlignment:4];

  v24 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  [v24 setTextAlignment:4];

  [(GKOnboardingWhatsNewListCell *)self setupCell];
}

- (void)setupCell
{
  switch(self->_currentCellType)
  {
    case 0uLL:
      v3 = [(GKOnboardingWhatsNewListCell *)self getIconImageFromSFSymbol:@"sparkles"];
      v4 = GKGameCenterUIFrameworkBundle();
      v5 = GKGetLocalizedStringFromTableInBundle();

      v6 = GKGameCenterUIFrameworkBundle();
      goto LABEL_6;
    case 1uLL:
      v3 = [(GKOnboardingWhatsNewListCell *)self getIconImageFromSFSymbol:@"list.bullet.below.star.filled"];
      v8 = GKGameCenterUIFrameworkBundle();
      v5 = GKGetLocalizedStringFromTableInBundle();

      v6 = GKGameCenterUIFrameworkBundle();
      goto LABEL_6;
    case 2uLL:
      v3 = [(GKOnboardingWhatsNewListCell *)self getIconImageFromSFSymbol:@"list.portrait.on.rectangle.portrait.angled.fill"];
      v9 = GKGameCenterUIFrameworkBundle();
      v5 = GKGetLocalizedStringFromTableInBundle();

      v6 = GKGameCenterUIFrameworkBundle();
LABEL_6:
      objc_super v7 = GKGetLocalizedStringFromTableInBundle();

      goto LABEL_7;
    case 3uLL:
      v3 = [(GKOnboardingWhatsNewListCell *)self getIconImageFromBundle:@"gamecenter.widget"];
      v11 = GKGameCenterUIFrameworkBundle();
      v5 = GKGetLocalizedStringFromTableInBundle();

      v12 = GKGameCenterUIFrameworkBundle();
      goto LABEL_11;
    case 4uLL:
      v3 = [(GKOnboardingWhatsNewListCell *)self getIconImageFromBundle:@"gamecenter.friend.inbox"];
      v13 = GKGameCenterUIFrameworkBundle();
      v5 = GKGetLocalizedStringFromTableInBundle();

      v12 = GKGameCenterUIFrameworkBundle();
      goto LABEL_11;
    case 5uLL:
      v3 = [(GKOnboardingWhatsNewListCell *)self getIconImageFromBundle:@"gamecenter.multiplayer"];
      v14 = GKGameCenterUIFrameworkBundle();
      v5 = GKGetLocalizedStringFromTableInBundle();

      v12 = GKGameCenterUIFrameworkBundle();
LABEL_11:
      objc_super v7 = GKGetLocalizedStringFromTableInBundle();

      uint64_t v10 = 1;
      break;
    default:
      v3 = objc_opt_new();
      v5 = 0;
      objc_super v7 = 0;
LABEL_7:
      uint64_t v10 = 2;
      break;
  }
  id v26 = [v3 imageWithRenderingMode:v10];

  v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
  v16 = [(GKOnboardingWhatsNewListCell *)self icon];
  [v16 setTintColor:v15];

  uint64_t v17 = *MEMORY[0x1E4FB2950];
  v18 = [MEMORY[0x1E4FB08E0] _gkPreferredFontForTextStyle:*MEMORY[0x1E4FB2950] symbolicTraits:2];
  v19 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  [v19 setFont:v18];

  v20 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v17];
  v21 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  [v21 setFont:v20];

  v22 = [(GKOnboardingWhatsNewListCell *)self icon];
  [v22 setContentMode:4];

  v23 = [(GKOnboardingWhatsNewListCell *)self icon];
  [v23 setImage:v26];

  v24 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  [v24 setText:v5];

  v25 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  [v25 setText:v7];

  [(GKOnboardingWhatsNewListCell *)self createConstarints];
}

- (id)getIconImageFromBundle:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v4 = *MEMORY[0x1E4FB2928];
  id v5 = a3;
  v6 = [v3 configurationWithTextStyle:v4];
  objc_super v7 = (void *)MEMORY[0x1E4FB1818];
  v8 = GKGameCenterUIFrameworkBundle();
  v9 = [v7 imageNamed:v5 inBundle:v8 withConfiguration:v6];

  return v9;
}

- (id)getIconImageFromSFSymbol:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v4 = *MEMORY[0x1E4FB2928];
  id v5 = a3;
  v6 = [v3 configurationWithTextStyle:v4];
  objc_super v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v5 withConfiguration:v6];

  return v7;
}

- (void)createConstarints
{
  v108[12] = *MEMORY[0x1E4F143B8];
  v105 = [(GKOnboardingWhatsNewListCell *)self icon];
  v103 = [v105 widthAnchor];
  v101 = [v103 constraintEqualToConstant:40.0];
  v108[0] = v101;
  v99 = [(GKOnboardingWhatsNewListCell *)self icon];
  v97 = [v99 heightAnchor];
  v95 = [v97 constraintEqualToConstant:40.0];
  v108[1] = v95;
  v93 = [(GKOnboardingWhatsNewListCell *)self icon];
  v91 = [v93 leadingAnchor];
  v89 = [(GKOnboardingWhatsNewListCell *)self leadingAnchor];
  v87 = [v91 constraintEqualToAnchor:v89];
  v108[2] = v87;
  v85 = [(GKOnboardingWhatsNewListCell *)self icon];
  v83 = [v85 centerYAnchor];
  v81 = [(GKOnboardingWhatsNewListCell *)self centerYAnchor];
  v79 = [v83 constraintEqualToAnchor:v81];
  v108[3] = v79;
  v77 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  v73 = [v77 leadingAnchor];
  v75 = [(GKOnboardingWhatsNewListCell *)self icon];
  v71 = [v75 trailingAnchor];
  v69 = [v73 constraintEqualToAnchor:v71 constant:14.0];
  v108[4] = v69;
  v67 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  v65 = [v67 trailingAnchor];
  v63 = [(GKOnboardingWhatsNewListCell *)self trailingAnchor];
  v61 = [v65 constraintEqualToAnchor:v63];
  v108[5] = v61;
  v59 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  v57 = [v59 topAnchor];
  v55 = [(GKOnboardingWhatsNewListCell *)self topAnchor];
  v53 = [v57 constraintEqualToAnchor:v55];
  v108[6] = v53;
  v52 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  v48 = [v52 leadingAnchor];
  v50 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  v46 = [v50 leadingAnchor];
  v44 = [v48 constraintEqualToAnchor:v46];
  v108[7] = v44;
  v42 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  v38 = [v42 trailingAnchor];
  v40 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  v36 = [v40 trailingAnchor];
  v34 = [v38 constraintEqualToAnchor:v36];
  v108[8] = v34;
  v32 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  v30 = [v32 topAnchor];
  v3 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  uint64_t v4 = [v3 bottomAnchor];
  id v5 = [v30 constraintEqualToAnchor:v4 constant:2.0];
  v108[9] = v5;
  v6 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  objc_super v7 = [v6 bottomAnchor];
  v8 = [(GKOnboardingWhatsNewListCell *)self bottomAnchor];
  v9 = [v7 constraintLessThanOrEqualToAnchor:v8];
  v108[10] = v9;
  uint64_t v10 = [(GKOnboardingWhatsNewListCell *)self heightAnchor];
  v11 = [v10 constraintGreaterThanOrEqualToConstant:45.0];
  v108[11] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:12];
  normalConstraints = self->_normalConstraints;
  self->_normalConstraints = v12;

  v106 = [(GKOnboardingWhatsNewListCell *)self icon];
  v104 = [v106 widthAnchor];
  v102 = [v104 constraintEqualToConstant:62.0];
  v107[0] = v102;
  v100 = [(GKOnboardingWhatsNewListCell *)self icon];
  v98 = [v100 heightAnchor];
  v96 = [v98 constraintEqualToConstant:74.0];
  v107[1] = v96;
  v94 = [(GKOnboardingWhatsNewListCell *)self icon];
  v92 = [v94 leadingAnchor];
  v90 = [(GKOnboardingWhatsNewListCell *)self leadingAnchor];
  v88 = [v92 constraintEqualToAnchor:v90];
  v107[2] = v88;
  v86 = [(GKOnboardingWhatsNewListCell *)self icon];
  v84 = [v86 topAnchor];
  v82 = [(GKOnboardingWhatsNewListCell *)self topAnchor];
  v80 = [v84 constraintEqualToAnchor:v82];
  v107[3] = v80;
  v78 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  v74 = [v78 leadingAnchor];
  v76 = [(GKOnboardingWhatsNewListCell *)self icon];
  v72 = [v76 leadingAnchor];
  v70 = [v74 constraintEqualToAnchor:v72];
  v107[4] = v70;
  v68 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  v66 = [v68 trailingAnchor];
  v64 = [(GKOnboardingWhatsNewListCell *)self trailingAnchor];
  v62 = [v66 constraintEqualToAnchor:v64];
  v107[5] = v62;
  v60 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  v56 = [v60 topAnchor];
  v58 = [(GKOnboardingWhatsNewListCell *)self icon];
  v54 = [v58 bottomAnchor];
  v51 = [v56 constraintEqualToAnchor:v54];
  v107[6] = v51;
  v49 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  v45 = [v49 leadingAnchor];
  v47 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  v43 = [v47 leadingAnchor];
  v41 = [v45 constraintEqualToAnchor:v43];
  v107[7] = v41;
  v39 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  v35 = [v39 trailingAnchor];
  v37 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  v33 = [v37 trailingAnchor];
  v31 = [v35 constraintEqualToAnchor:v33];
  v107[8] = v31;
  v29 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  v28 = [v29 topAnchor];
  v14 = [(GKOnboardingWhatsNewListCell *)self titleLabel];
  v15 = [v14 bottomAnchor];
  v16 = [v28 constraintEqualToAnchor:v15 constant:4.0];
  v107[9] = v16;
  uint64_t v17 = [(GKOnboardingWhatsNewListCell *)self subtitleLabel];
  v18 = [v17 bottomAnchor];
  v19 = [(GKOnboardingWhatsNewListCell *)self bottomAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  v107[10] = v20;
  v21 = [(GKOnboardingWhatsNewListCell *)self heightAnchor];
  v22 = [v21 constraintGreaterThanOrEqualToConstant:80.0];
  v107[11] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:12];
  axConstraints = self->_axConstraints;
  self->_axConstraints = v23;

  v25 = [(GKOnboardingWhatsNewListCell *)self traitCollection];
  id v26 = [v25 preferredContentSizeCategory];
  LODWORD(v21) = UIContentSizeCategoryIsAccessibilityCategory(v26);

  uint64_t v27 = 440;
  if (v21) {
    uint64_t v27 = 448;
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:*(Class *)((char *)&self->super.super.super.isa + v27)];
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4 = [(GKOnboardingWhatsNewListCell *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory) {
    objc_super v7 = &OBJC_IVAR___GKOnboardingWhatsNewListCell__normalConstraints;
  }
  else {
    objc_super v7 = &OBJC_IVAR___GKOnboardingWhatsNewListCell__axConstraints;
  }
  if (IsAccessibilityCategory) {
    v8 = &OBJC_IVAR___GKOnboardingWhatsNewListCell__axConstraints;
  }
  else {
    v8 = &OBJC_IVAR___GKOnboardingWhatsNewListCell__normalConstraints;
  }
  [MEMORY[0x1E4F28DC8] deactivateConstraints:*(Class *)((char *)&self->super.super.super.isa + *v7)];
  v9 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.isa + *v8);

  [v9 activateConstraints:v10];
}

- (unint64_t)currentCellType
{
  return self->_currentCellType;
}

- (UIImageView)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
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

- (NSArray)normalConstraints
{
  return self->_normalConstraints;
}

- (void)setNormalConstraints:(id)a3
{
}

- (NSArray)axConstraints
{
  return self->_axConstraints;
}

- (void)setAxConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axConstraints, 0);
  objc_storeStrong((id *)&self->_normalConstraints, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_icon, 0);
}

@end