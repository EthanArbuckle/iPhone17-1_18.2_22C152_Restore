@interface CPSDashboardItemView
- (CPDashboardButton)dashboardButton;
- (CPSAbridgableLabel)subtitleLabel;
- (CPSAbridgableLabel)titleLabel;
- (CPSButtonDelegate)delegate;
- (CPSDashboardItemView)initWithDashboardButton:(id)a3 layoutAxis:(unint64_t)a4;
- (NSLayoutConstraint)subtitleWidthConstraint;
- (NSLayoutConstraint)titleLabelConnectingConstraint;
- (UIButton)button;
- (UIColor)focusHighlightColor;
- (UIImageView)imageView;
- (UIView)focusBackgroundView;
- (unint64_t)layoutAxis;
- (void)_buttonTriggered:(id)a3;
- (void)_setup;
- (void)_touchDown:(id)a3;
- (void)_touchEnded:(id)a3;
- (void)focusableItemFocused:(BOOL)a3;
- (void)focusableItemPressed:(BOOL)a3;
- (void)focusableItemSelected;
- (void)hideSubtitle;
- (void)layoutSubviews;
- (void)setButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusBackgroundView:(id)a3;
- (void)setFocusHighlightColor:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLayoutAxis:(unint64_t)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleWidthConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelConnectingConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSDashboardItemView

- (CPSDashboardItemView)initWithDashboardButton:(id)a3 layoutAxis:(unint64_t)a4
{
  v174[24] = *MEMORY[0x263EF8340];
  id v171 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v169 = a4;
  id v4 = v171;
  id v171 = 0;
  v168.receiver = v4;
  v168.super_class = (Class)CPSDashboardItemView;
  id v171 = [(CPSDashboardItemView *)&v168 init];
  objc_storeStrong(&v171, v171);
  if (v171)
  {
    *((void *)v171 + 59) = v169;
    objc_storeStrong((id *)v171 + 51, location[0]);
    id v5 = objc_alloc(MEMORY[0x263F1CB60]);
    id obj = (id)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [obj setTranslatesAutoresizingMaskIntoConstraints:0];
    id v155 = (id)[obj layer];
    [v155 setCornerRadius:4.0];

    id v156 = (id)[obj layer];
    [v156 setCornerCurve:*MEMORY[0x263F15A20]];

    [v171 addSubview:obj];
    [obj setHidden:1];
    objc_storeStrong((id *)v171 + 58, obj);
    id v166 = objc_alloc_init(MEMORY[0x263F1C6D0]);
    [v166 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v171 addSubview:v166];
    objc_storeStrong((id *)v171 + 52, v166);
    id v165 = objc_alloc_init(CPSAbridgableLabel);
    [v165 setTranslatesAutoresizingMaskIntoConstraints:0];
    v159 = (void *)MEMORY[0x263F1D270];
    id v157 = (id)objc_msgSend(MEMORY[0x263F1C658], "_preferredFontForTextStyle:variant:", *MEMORY[0x263F1D270]);
    objc_msgSend(v165, "setFont:");

    [v171 addSubview:v165];
    objc_storeStrong((id *)v171 + 56, v165);
    id v164 = objc_alloc_init(CPSAbridgableLabel);
    [v164 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v158 = (id)[MEMORY[0x263F1C550] _carSystemPrimaryColor];
    objc_msgSend(v164, "setTextColor:");

    id v160 = (id)[MEMORY[0x263F1C658] _preferredFontForTextStyle:*v159 variant:256];
    objc_msgSend(v164, "setFont:");

    [v171 addSubview:v164];
    objc_storeStrong((id *)v171 + 55, v164);
    id v163 = objc_alloc_init(MEMORY[0x263F1C778]);
    [v171 addLayoutGuide:v163];
    if (v169 == 1)
    {
      v83 = (void *)MEMORY[0x263F08938];
      id v154 = (id)[v171 topAnchor];
      id v153 = (id)[v166 topAnchor];
      id v152 = (id)objc_msgSend(v154, "constraintLessThanOrEqualToAnchor:constant:");
      v174[0] = v152;
      id v151 = (id)[v171 topAnchor];
      id v150 = (id)[v163 topAnchor];
      id v149 = (id)objc_msgSend(v151, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
      v174[1] = v149;
      id v148 = (id)[v171 bottomAnchor];
      id v147 = (id)[v166 bottomAnchor];
      id v146 = (id)objc_msgSend(v148, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
      v174[2] = v146;
      id v145 = (id)[v171 bottomAnchor];
      id v144 = (id)[v163 bottomAnchor];
      id v143 = (id)objc_msgSend(v145, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
      v174[3] = v143;
      id v142 = (id)[v166 heightAnchor];
      id v141 = (id)objc_msgSend(v142, "constraintEqualToConstant:");
      v174[4] = v141;
      id v140 = (id)[v166 widthAnchor];
      id v139 = (id)[v140 constraintEqualToConstant:40.0];
      v174[5] = v139;
      id v138 = (id)[v166 leadingAnchor];
      id v137 = (id)[v171 leadingAnchor];
      id v136 = (id)objc_msgSend(v138, "constraintEqualToAnchor:constant:");
      v174[6] = v136;
      id v135 = (id)[v166 centerYAnchor];
      id v134 = (id)[v171 centerYAnchor];
      id v133 = (id)objc_msgSend(v135, "constraintEqualToAnchor:");
      v174[7] = v133;
      id v132 = (id)[v163 leadingAnchor];
      id v131 = (id)[v166 trailingAnchor];
      id v130 = (id)objc_msgSend(v132, "constraintEqualToAnchor:constant:", 8.0);
      v174[8] = v130;
      id v129 = (id)[v163 centerYAnchor];
      id v128 = (id)[v166 centerYAnchor];
      id v127 = (id)objc_msgSend(v129, "constraintEqualToAnchor:");
      v174[9] = v127;
      id v126 = (id)[v163 trailingAnchor];
      id v125 = (id)[v171 trailingAnchor];
      id v124 = (id)objc_msgSend(v126, "constraintEqualToAnchor:constant:", -8.0);
      v174[10] = v124;
      id v123 = (id)[v165 topAnchor];
      id v122 = (id)[v163 topAnchor];
      id v121 = (id)objc_msgSend(v123, "constraintEqualToAnchor:constant:", 0.0);
      v174[11] = v121;
      id v120 = (id)[v165 lastBaselineAnchor];
      id v119 = (id)[v164 firstBaselineAnchor];
      id v118 = (id)objc_msgSend(v120, "constraintEqualToAnchor:constant:", -17.0);
      v174[12] = v118;
      id v117 = (id)[v164 bottomAnchor];
      id v116 = (id)[v163 bottomAnchor];
      id v115 = (id)objc_msgSend(v117, "constraintEqualToAnchor:constant:", 0.0);
      v174[13] = v115;
      id v114 = (id)[v165 leadingAnchor];
      id v113 = (id)[v163 leadingAnchor];
      id v112 = (id)objc_msgSend(v114, "constraintEqualToAnchor:constant:", 0.0);
      v174[14] = v112;
      id v111 = (id)[v165 trailingAnchor];
      id v110 = (id)[v163 trailingAnchor];
      id v109 = (id)objc_msgSend(v111, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
      v174[15] = v109;
      id v108 = (id)[v164 leadingAnchor];
      id v107 = (id)[v163 leadingAnchor];
      id v106 = (id)objc_msgSend(v108, "constraintEqualToAnchor:constant:", 0.0);
      v174[16] = v106;
      id v105 = (id)[v164 trailingAnchor];
      id v104 = (id)[v163 trailingAnchor];
      id v103 = (id)objc_msgSend(v105, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
      v174[17] = v103;
      id v102 = (id)[v163 trailingAnchor];
      id v101 = (id)[v164 trailingAnchor];
      id v100 = (id)objc_msgSend(v102, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
      v174[18] = v100;
      id v99 = (id)[v163 trailingAnchor];
      id v98 = (id)[v165 trailingAnchor];
      id v97 = (id)objc_msgSend(v99, "constraintGreaterThanOrEqualToAnchor:constant:", 0.0);
      v174[19] = v97;
      id v96 = (id)[obj leadingAnchor];
      id v95 = (id)[v165 leadingAnchor];
      id v94 = (id)objc_msgSend(v96, "constraintEqualToAnchor:constant:");
      v174[20] = v94;
      id v93 = (id)[obj trailingAnchor];
      id v92 = (id)[v165 trailingAnchor];
      id v91 = (id)objc_msgSend(v93, "constraintEqualToAnchor:constant:");
      v174[21] = v91;
      id v90 = (id)[obj topAnchor];
      id v89 = (id)[v165 topAnchor];
      id v88 = (id)objc_msgSend(v90, "constraintEqualToAnchor:constant:", -2.0);
      v174[22] = v88;
      id v87 = (id)[obj bottomAnchor];
      id v86 = (id)[v165 bottomAnchor];
      id v85 = (id)objc_msgSend(v87, "constraintEqualToAnchor:constant:", 2.0);
      v174[23] = v85;
      id v84 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v174 count:24];
      objc_msgSend(v83, "activateConstraints:");
    }
    else
    {
      id v25 = (id)[v165 trailingAnchor];
      id v24 = (id)[v164 leadingAnchor];
      id v6 = (id)objc_msgSend(v25, "constraintEqualToAnchor:constant:", -4.0);
      v7 = (void *)*((void *)v171 + 61);
      *((void *)v171 + 61) = v6;

      v26 = (void *)MEMORY[0x263F08938];
      id v82 = (id)[v166 heightAnchor];
      id v81 = (id)objc_msgSend(v82, "constraintEqualToConstant:");
      v173[0] = v81;
      id v80 = (id)[v166 widthAnchor];
      id v79 = (id)[v80 constraintEqualToConstant:30.0];
      v173[1] = v79;
      id v78 = (id)[v166 centerXAnchor];
      id v77 = (id)[v171 centerXAnchor];
      id v76 = (id)objc_msgSend(v78, "constraintEqualToAnchor:");
      v173[2] = v76;
      id v75 = (id)[v166 topAnchor];
      id v74 = (id)[v171 topAnchor];
      id v73 = (id)objc_msgSend(v75, "constraintEqualToAnchor:constant:");
      v173[3] = v73;
      id v72 = (id)[v163 topAnchor];
      id v71 = (id)[v166 bottomAnchor];
      id v70 = (id)objc_msgSend(v72, "constraintEqualToAnchor:constant:", 4.0);
      v173[4] = v70;
      id v69 = (id)[v163 bottomAnchor];
      id v68 = (id)[v171 bottomAnchor];
      id v67 = (id)objc_msgSend(v69, "constraintEqualToAnchor:constant:", 0.0);
      v173[5] = v67;
      id v66 = (id)[v163 leadingAnchor];
      id v65 = (id)[v171 leadingAnchor];
      id v64 = (id)objc_msgSend(v66, "constraintGreaterThanOrEqualToAnchor:");
      v173[6] = v64;
      id v63 = (id)[v163 centerXAnchor];
      id v62 = (id)[v166 centerXAnchor];
      id v61 = (id)objc_msgSend(v63, "constraintEqualToAnchor:");
      v173[7] = v61;
      id v60 = (id)[v163 trailingAnchor];
      id v59 = (id)[v171 trailingAnchor];
      id v58 = (id)objc_msgSend(v60, "constraintLessThanOrEqualToAnchor:");
      v173[8] = v58;
      id v57 = (id)[v165 topAnchor];
      id v56 = (id)[v163 topAnchor];
      id v55 = (id)objc_msgSend(v57, "constraintEqualToAnchor:constant:", 0.0);
      v173[9] = v55;
      id v54 = (id)[v165 bottomAnchor];
      id v53 = (id)[v163 bottomAnchor];
      id v52 = (id)objc_msgSend(v54, "constraintEqualToAnchor:constant:", 0.0);
      v173[10] = v52;
      id v51 = (id)[v165 leadingAnchor];
      id v50 = (id)[v163 leadingAnchor];
      id v49 = (id)objc_msgSend(v51, "constraintEqualToAnchor:constant:", 0.0);
      v173[11] = v49;
      v173[12] = *((void *)v171 + 61);
      id v48 = (id)[v164 topAnchor];
      id v47 = (id)[v163 topAnchor];
      id v46 = (id)objc_msgSend(v48, "constraintEqualToAnchor:constant:", 0.0);
      v173[13] = v46;
      id v45 = (id)[v164 bottomAnchor];
      id v44 = (id)[v163 bottomAnchor];
      id v43 = (id)objc_msgSend(v45, "constraintEqualToAnchor:constant:", 0.0);
      v173[14] = v43;
      id v42 = (id)[v164 trailingAnchor];
      id v41 = (id)[v163 trailingAnchor];
      id v40 = (id)objc_msgSend(v42, "constraintEqualToAnchor:constant:", 0.0);
      v173[15] = v40;
      id v39 = (id)[obj leadingAnchor];
      id v38 = (id)[v163 leadingAnchor];
      id v37 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:");
      v173[16] = v37;
      id v36 = (id)[obj trailingAnchor];
      id v35 = (id)[v163 trailingAnchor];
      id v34 = (id)objc_msgSend(v36, "constraintEqualToAnchor:constant:");
      v173[17] = v34;
      id v33 = (id)[obj topAnchor];
      id v32 = (id)[v163 topAnchor];
      id v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:constant:", -2.0);
      v173[18] = v31;
      id v30 = (id)[obj bottomAnchor];
      id v29 = (id)[v163 bottomAnchor];
      id v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:constant:", 2.0);
      v173[19] = v28;
      id v27 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v173 count:20];
      objc_msgSend(v26, "activateConstraints:");
    }
    id v162 = (id)[MEMORY[0x263F1C488] buttonWithType:0];
    [v162 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v162 addTarget:v171 action:sel__buttonTriggered_ forControlEvents:0x2000];
    [v162 addTarget:v171 action:sel__touchDown_ forControlEvents:1];
    [v162 addTarget:v171 action:sel__touchEnded_ forControlEvents:456];
    [v171 addSubview:v162];
    objc_storeStrong((id *)v171 + 57, v162);
    v10 = (void *)MEMORY[0x263F08938];
    id v23 = (id)[v171 topAnchor];
    id v22 = (id)[v162 topAnchor];
    id v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
    v172[0] = v21;
    id v20 = (id)[v171 bottomAnchor];
    id v19 = (id)[v162 bottomAnchor];
    id v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
    v172[1] = v18;
    id v17 = (id)[v171 leftAnchor];
    id v16 = (id)[v162 leftAnchor];
    id v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v172[2] = v15;
    id v14 = (id)[v171 rightAnchor];
    id v13 = (id)[v162 rightAnchor];
    id v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v172[3] = v12;
    id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v172 count:4];
    objc_msgSend(v10, "activateConstraints:");

    [v171 _setup];
    objc_storeStrong(&v162, 0);
    objc_storeStrong(&v163, 0);
    objc_storeStrong(&v164, 0);
    objc_storeStrong(&v165, 0);
    objc_storeStrong(&v166, 0);
    objc_storeStrong(&obj, 0);
  }
  v9 = (CPSDashboardItemView *)v171;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v171, 0);
  return v9;
}

- (void)setFocusHighlightColor:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_focusHighlightColor, location[0]);
  id v3 = location[0];
  id v4 = [(CPSDashboardItemView *)v6 focusBackgroundView];
  [(UIView *)v4 setBackgroundColor:v3];

  objc_storeStrong(location, 0);
}

- (void)_setup
{
  id v4 = [(CPSDashboardItemView *)self imageView];
  id v3 = [(CPSDashboardItemView *)self dashboardButton];
  v2 = [(CPDashboardButton *)v3 image];
  -[UIImageView setImage:](v4, "setImage:");

  v7 = [(CPSDashboardItemView *)self titleLabel];
  id v6 = [(CPSDashboardItemView *)self dashboardButton];
  id v5 = [(CPDashboardButton *)v6 titleVariants];
  -[CPSAbridgableLabel setTextVariants:](v7, "setTextVariants:");

  v10 = [(CPSDashboardItemView *)self subtitleLabel];
  v9 = [(CPSDashboardItemView *)self dashboardButton];
  v8 = [(CPDashboardButton *)v9 subtitleVariants];
  -[CPSAbridgableLabel setTextVariants:](v10, "setTextVariants:");
}

- (void)layoutSubviews
{
  v27[1] = *MEMORY[0x263EF8340];
  v26 = self;
  SEL v25 = a2;
  v24.receiver = self;
  v24.super_class = (Class)CPSDashboardItemView;
  [(CPSDashboardItemView *)&v24 layoutSubviews];
  id v20 = [(CPSDashboardItemView *)v26 titleLabelConnectingConstraint];
  [(NSLayoutConstraint *)v20 setConstant:-4.0];

  id v21 = [(CPSDashboardItemView *)v26 subtitleWidthConstraint];
  if (v21)
  {
    id v17 = (void *)MEMORY[0x263F08938];
    id v19 = [(CPSDashboardItemView *)v26 subtitleWidthConstraint];
    v27[0] = v19;
    id v18 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    objc_msgSend(v17, "deactivateConstraints:");
  }
  id v12 = [(CPSDashboardItemView *)v26 subtitleLabel];
  [(CPSAbridgableLabel *)v12 setHidden:0];

  id v13 = [(CPSDashboardItemView *)v26 titleLabel];
  [(CPSAbridgableLabel *)v13 sizeToFit];

  id v14 = [(CPSDashboardItemView *)v26 subtitleLabel];
  [(CPSAbridgableLabel *)v14 sizeToFit];

  id v15 = [(CPSDashboardItemView *)v26 subtitleLabel];
  [(CPSAbridgableLabel *)v15 layoutIfNeeded];

  id v16 = [(CPSDashboardItemView *)v26 titleLabel];
  [(CPSAbridgableLabel *)v16 layoutIfNeeded];

  BOOL v23 = 0;
  if ([(CPSDashboardItemView *)v26 layoutAxis] == 2)
  {
    [(CPSDashboardItemView *)v26 bounds];
    double v22 = v2;
    v10 = [(CPSDashboardItemView *)v26 titleLabel];
    [(CPSAbridgableLabel *)v10 intrinsicContentSize];
    double v9 = v3 + 4.0;
    v8 = [(CPSDashboardItemView *)v26 subtitleLabel];
    [(CPSAbridgableLabel *)v8 intrinsicContentSize];
    double v11 = v9 + v4;

    BOOL v23 = v11 > v22;
  }
  id v6 = [(CPSDashboardItemView *)v26 subtitleLabel];
  id v5 = [(CPSAbridgableLabel *)v6 textVariants];
  BOOL v7 = [(NSArray *)v5 count] != 0;

  if (!v7) {
    BOOL v23 = 1;
  }
  if (v23) {
    [(CPSDashboardItemView *)v26 hideSubtitle];
  }
}

- (void)hideSubtitle
{
  v13[1] = *MEMORY[0x263EF8340];
  double v3 = [(CPSDashboardItemView *)self titleLabelConnectingConstraint];
  -[NSLayoutConstraint setConstant:](v3, "setConstant:");

  id v6 = [(CPSDashboardItemView *)self subtitleLabel];
  id v5 = (id)[(CPSAbridgableLabel *)v6 widthAnchor];
  id v4 = (id)[v5 constraintEqualToConstant:0.0];
  -[CPSDashboardItemView setSubtitleWidthConstraint:](self, "setSubtitleWidthConstraint:");

  BOOL v7 = [(CPSDashboardItemView *)self subtitleWidthConstraint];
  LODWORD(v2) = 1148846080;
  [(NSLayoutConstraint *)v7 setPriority:v2];

  v8 = (void *)MEMORY[0x263F08938];
  v10 = [(CPSDashboardItemView *)self subtitleWidthConstraint];
  v13[0] = v10;
  id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  objc_msgSend(v8, "activateConstraints:");

  double v11 = [(CPSDashboardItemView *)self subtitleLabel];
  [(CPSAbridgableLabel *)v11 setHidden:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSDashboardItemView;
  [(CPSDashboardItemView *)&v3 traitCollectionDidChange:location[0]];
  [(CPSDashboardItemView *)v5 _setup];
  objc_storeStrong(location, 0);
}

- (void)focusableItemPressed:(BOOL)a3
{
  if (a3) {
    [(CPSDashboardItemView *)self setAlpha:0.2];
  }
  else {
    [(CPSDashboardItemView *)self setAlpha:1.0];
  }
}

- (void)focusableItemSelected
{
  objc_super v3 = [(CPSDashboardItemView *)self delegate];
  double v2 = [(CPSDashboardItemView *)self dashboardButton];
  -[CPSButtonDelegate didSelectButton:](v3, "didSelectButton:");
}

- (void)focusableItemFocused:(BOOL)a3
{
  if (a3)
  {
    v10 = [(CPSDashboardItemView *)self focusBackgroundView];
    [(UIView *)v10 setHidden:0];

    id v12 = [(CPSDashboardItemView *)self titleLabel];
    id v11 = (id)[MEMORY[0x263F1C550] _carSystemFocusLabelColor];
    -[CPSAbridgableLabel setTextColor:](v12, "setTextColor:");

    if ([(CPSDashboardItemView *)self layoutAxis] == 2)
    {
      id v9 = [(CPSDashboardItemView *)self subtitleLabel];
      id v8 = (id)[MEMORY[0x263F1C550] _carSystemFocusPrimaryColor];
      -[CPSAbridgableLabel setTextColor:](v9, "setTextColor:");
    }
  }
  else
  {
    id v5 = [(CPSDashboardItemView *)self focusBackgroundView];
    [(UIView *)v5 setHidden:1];

    BOOL v7 = [(CPSDashboardItemView *)self titleLabel];
    id v6 = (id)[MEMORY[0x263F1C550] labelColor];
    -[CPSAbridgableLabel setTextColor:](v7, "setTextColor:");

    if ([(CPSDashboardItemView *)self layoutAxis] == 2)
    {
      id v4 = [(CPSDashboardItemView *)self subtitleLabel];
      id v3 = (id)[MEMORY[0x263F1C550] _carSystemPrimaryColor];
      -[CPSAbridgableLabel setTextColor:](v4, "setTextColor:");
    }
  }
}

- (void)_touchDown:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSDashboardItemView *)v4 setAlpha:0.2];
  objc_storeStrong(location, 0);
}

- (void)_touchEnded:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSDashboardItemView *)v4 setAlpha:1.0];
  objc_storeStrong(location, 0);
}

- (void)_buttonTriggered:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(CPSDashboardItemView *)v6 delegate];
  id v3 = [(CPSDashboardItemView *)v6 dashboardButton];
  -[CPSButtonDelegate didSelectButton:](v4, "didSelectButton:");

  objc_storeStrong(location, 0);
}

- (CPDashboardButton)dashboardButton
{
  return self->_dashboardButton;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (CPSButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)focusHighlightColor
{
  return self->_focusHighlightColor;
}

- (CPSAbridgableLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (CPSAbridgableLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (UIView)focusBackgroundView
{
  return self->_focusBackgroundView;
}

- (void)setFocusBackgroundView:(id)a3
{
}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (void)setLayoutAxis:(unint64_t)a3
{
  self->_layoutAxis = a3;
}

- (NSLayoutConstraint)subtitleWidthConstraint
{
  return self->_subtitleWidthConstraint;
}

- (void)setSubtitleWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelConnectingConstraint
{
  return self->_titleLabelConnectingConstraint;
}

- (void)setTitleLabelConnectingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end