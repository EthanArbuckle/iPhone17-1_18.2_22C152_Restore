@interface MUPlaceSectionHeaderView
- (MUPlaceSectionHeaderView)initWithViewModel:(id)a3;
- (void)_contentSizeDidChange;
- (void)_setupHeader;
- (void)beginAnimatingActivityIndicator;
- (void)endAnimatingActivityIndicatorWithError:(id)a3;
@end

@implementation MUPlaceSectionHeaderView

- (MUPlaceSectionHeaderView)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceSectionHeaderView;
  v6 = -[MUPlaceSectionHeaderView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_headerViewModel, a3);
    [(MUPlaceSectionHeaderView *)v7 _setupHeader];
  }

  return v7;
}

- (void)_setupHeader
{
  v106[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel titleString];
  [(UILabel *)self->_titleLabel set_mapsui_text:v5];

  v6 = MUPlaceSectionHeaderFont();
  [(UILabel *)self->_titleLabel setFont:v6];

  v7 = +[MUInfoCardStyle sectionHeaderTextColor];
  [(UILabel *)self->_titleLabel setTextColor:v7];

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"PlaceSectionHeaderTitle"];
  [(MUPlaceSectionHeaderView *)self addSubview:self->_titleLabel];
  v8 = [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel subtitleString];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
    v10 = (UILabel *)objc_claimAutoreleasedReturnValue();
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v10;

    [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel subtitleString];
    [(UILabel *)self->_subtitleLabel set_mapsui_text:v12];

    v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)self->_subtitleLabel setTextColor:v13];

    v14 = MUPlaceSectionHeaderSubtitleFont();
    [(UILabel *)self->_subtitleLabel setFont:v14];

    [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)self->_subtitleLabel setAccessibilityIdentifier:@"PlaceSectionHeaderSubtitle"];
    [(MUPlaceSectionHeaderView *)self addSubview:self->_subtitleLabel];
  }
  v15 = [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel seeMoreButtonText];
  if (![v15 length])
  {

    goto LABEL_18;
  }
  v16 = [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel target];
  [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel selector];
  if (objc_opt_respondsToSelector())
  {
  }
  else
  {
    v17 = [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel seeMoreButtonMenu];

    if (!v17) {
      goto LABEL_18;
    }
  }
  objc_msgSend(MEMORY[0x1E4FB14D0], "_mapsui_sectionHeaderButton");
  v18 = (UIButton *)objc_claimAutoreleasedReturnValue();
  seeAllButton = self->_seeAllButton;
  self->_seeAllButton = v18;

  [(UIButton *)self->_seeAllButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel seeMoreButtonText];
  [(UIButton *)self->_seeAllButton set_mapsui_title:v20];

  v21 = [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel seeMoreButtonMenu];

  headerViewModel = self->_headerViewModel;
  if (v21)
  {
    v23 = [(MUPlaceSectionHeaderViewModel *)headerViewModel seeMoreButtonMenu];
    [(UIButton *)self->_seeAllButton setMenu:v23];

    [(UIButton *)self->_seeAllButton setShowsMenuAsPrimaryAction:1];
    [(UIButton *)self->_seeAllButton setPreferredMenuElementOrder:2];
    v24 = [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel target];
    [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel selector];
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      v26 = self->_seeAllButton;
      v27 = [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel target];
      [(UIButton *)v26 addTarget:v27 action:[(MUPlaceSectionHeaderViewModel *)self->_headerViewModel selector] forControlEvents:0x4000];
LABEL_13:
    }
  }
  else
  {
    v28 = [(MUPlaceSectionHeaderViewModel *)headerViewModel target];
    [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel selector];
    char v29 = objc_opt_respondsToSelector();

    if (v29)
    {
      v30 = self->_seeAllButton;
      v27 = [(MUPlaceSectionHeaderViewModel *)self->_headerViewModel target];
      [(UIButton *)v30 _mapsui_setTarget:v27 action:[(MUPlaceSectionHeaderViewModel *)self->_headerViewModel selector]];
      goto LABEL_13;
    }
  }
  v31 = +[MUInfoCardStyle tintColor];
  [(UIButton *)self->_seeAllButton setTintColor:v31];

  if (+[MUInfoCardStyle sectionHeaderStyle] == 1)
  {
    v32 = [MEMORY[0x1E4FB14D8] borderlessButtonConfiguration];
    [v32 setTitleTextAttributesTransformer:&__block_literal_global_10];
    objc_msgSend(v32, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    [(UIButton *)self->_seeAllButton setConfiguration:v32];
  }
  else
  {
    v33 = [(UIButton *)self->_seeAllButton titleLabel];
    [v33 setAdjustsFontForContentSizeCategory:1];

    v32 = MUPlaceSectionHeaderAccessoryButtonFont();
    v34 = [(UIButton *)self->_seeAllButton titleLabel];
    [v34 setFont:v32];
  }
  [(UIButton *)self->_seeAllButton setAccessibilityIdentifier:@"PlaceSectionHeaderButton"];
  [(MUPlaceSectionHeaderView *)self addSubview:self->_seeAllButton];
  v35 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E4FB1780]);
  headerFocusGuide = self->_headerFocusGuide;
  self->_headerFocusGuide = v35;

  v106[0] = self->_seeAllButton;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:1];
  [(UIFocusGuide *)self->_headerFocusGuide setPreferredFocusEnvironments:v37];

  [(MUPlaceSectionHeaderView *)self addLayoutGuide:self->_headerFocusGuide];
LABEL_18:
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v39 = [(UILabel *)self->_titleLabel leadingAnchor];
  v40 = [(MUPlaceSectionHeaderView *)self leadingAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  v105[0] = v41;
  v42 = [(UILabel *)self->_titleLabel topAnchor];
  v43 = [(MUPlaceSectionHeaderView *)self topAnchor];
  v44 = [v42 constraintEqualToAnchor:v43 constant:3.0];
  v105[1] = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
  v101 = v38;
  [v38 addObjectsFromArray:v45];

  v46 = self->_titleLabel;
  v47 = self->_subtitleLabel;
  if (v47)
  {
    v98 = [(UILabel *)v47 leadingAnchor];
    v96 = [(MUPlaceSectionHeaderView *)self leadingAnchor];
    v48 = [v98 constraintEqualToAnchor:v96];
    v104[0] = v48;
    v49 = [(UILabel *)self->_subtitleLabel topAnchor];
    v50 = [(UILabel *)self->_titleLabel bottomAnchor];
    [v49 constraintEqualToAnchor:v50 constant:4.0];
    v51 = v94 = v46;
    v104[1] = v51;
    v52 = [(UILabel *)self->_subtitleLabel bottomAnchor];
    v53 = [(MUPlaceSectionHeaderView *)self bottomAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    v104[2] = v54;
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:3];
    [v101 addObjectsFromArray:v55];

    v46 = self->_subtitleLabel;
  }
  v56 = [(UILabel *)v46 bottomAnchor];
  v57 = [(MUPlaceSectionHeaderView *)self bottomAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  v59 = v101;
  [v101 addObject:v58];

  v60 = self->_seeAllButton;
  if (v60)
  {
    v61 = [(UIButton *)v60 bottomAnchor];
    v62 = [(MUPlaceSectionHeaderView *)self bottomAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];

    LODWORD(v64) = 1132068864;
    [v63 setPriority:v64];
    v89 = [(UILabel *)self->_titleLabel trailingAnchor];
    uint64_t v90 = [(UIButton *)self->_seeAllButton leadingAnchor];
    v99 = [v89 constraintLessThanOrEqualToAnchor:v90 constant:-8.0];
    v103[0] = v99;
    v97 = [(UIButton *)self->_seeAllButton trailingAnchor];
    v95 = [(MUPlaceSectionHeaderView *)self trailingAnchor];
    v93 = [v97 constraintEqualToAnchor:v95];
    v103[1] = v93;
    v92 = [(UIButton *)self->_seeAllButton firstBaselineAnchor];
    v100 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
    v91 = [v92 constraintEqualToAnchor:v100];
    v103[2] = v91;
    v88 = [(UIButton *)self->_seeAllButton topAnchor];
    v87 = [(MUPlaceSectionHeaderView *)self topAnchor];
    v86 = [v88 constraintGreaterThanOrEqualToAnchor:v87];
    v103[3] = v86;
    v103[4] = v63;
    v85 = [(UIFocusGuide *)self->_headerFocusGuide leadingAnchor];
    v84 = [(MUPlaceSectionHeaderView *)self leadingAnchor];
    v83 = [v85 constraintEqualToAnchor:v84];
    v103[5] = v83;
    v82 = [(UIFocusGuide *)self->_headerFocusGuide trailingAnchor];
    v81 = [(MUPlaceSectionHeaderView *)self trailingAnchor];
    v80 = [v82 constraintEqualToAnchor:v81];
    v103[6] = v80;
    v65 = [(UIFocusGuide *)self->_headerFocusGuide topAnchor];
    v66 = [(MUPlaceSectionHeaderView *)self topAnchor];
    v67 = [v65 constraintEqualToAnchor:v66];
    v103[7] = v67;
    v68 = [(UIFocusGuide *)self->_headerFocusGuide bottomAnchor];
    v69 = [(MUPlaceSectionHeaderView *)self bottomAnchor];
    v70 = [v68 constraintEqualToAnchor:v69];
    v103[8] = v70;
    v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:9];
    [v101 addObjectsFromArray:v71];

    v72 = v63;
    v73 = v89;

    v74 = (void *)v90;
    v59 = v101;
  }
  else
  {
    v72 = [(UILabel *)self->_titleLabel trailingAnchor];
    v73 = [(MUPlaceSectionHeaderView *)self trailingAnchor];
    v74 = [v72 constraintEqualToAnchor:v73];
    [v101 addObject:v74];
  }

  v75 = (void *)MEMORY[0x1E4F28DC8];
  v76 = (void *)[v59 copy];
  [v75 activateConstraints:v76];

  v77 = self;
  v102 = v77;
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
  id v79 = (id)[(MUPlaceSectionHeaderView *)self registerForTraitChanges:v78 withAction:sel__contentSizeDidChange];
}

id __40__MUPlaceSectionHeaderView__setupHeader__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  v3 = MUPlaceSectionHeaderAccessoryButtonFont();
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v2;
}

- (void)_contentSizeDidChange
{
  v3 = MUPlaceSectionHeaderFont();
  [(UILabel *)self->_titleLabel setFont:v3];

  MUPlaceSectionHeaderSubtitleFont();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_subtitleLabel setFont:v4];
}

- (void)beginAnimatingActivityIndicator
{
  [(UIButton *)self->_seeAllButton setAlpha:0.3];
  seeAllButton = self->_seeAllButton;
  [(UIButton *)seeAllButton setUserInteractionEnabled:0];
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  -[UIButton setAlpha:](self->_seeAllButton, "setAlpha:", a3, 1.0);
  seeAllButton = self->_seeAllButton;
  [(UIButton *)seeAllButton setUserInteractionEnabled:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerViewModel, 0);
  objc_storeStrong((id *)&self->_headerFocusGuide, 0);
  objc_storeStrong((id *)&self->_seeAllButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end