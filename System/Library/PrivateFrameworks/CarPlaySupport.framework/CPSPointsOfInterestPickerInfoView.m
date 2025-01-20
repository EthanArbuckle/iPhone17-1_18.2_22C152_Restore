@interface CPSPointsOfInterestPickerInfoView
- (CPPointOfInterest)model;
- (CPSPointsOfInterestPickerInfoDelegate)delegate;
- (CPSStyledTextButton)primaryButton;
- (CPSStyledTextButton)secondaryButton;
- (UIEdgeInsets)safeAreaInsets;
- (UILabel)detailsInformativeText;
- (UILabel)detailsSubtitle;
- (UILabel)detailsTitle;
- (UIStackView)bottomStackView;
- (UIStackView)topStackView;
- (id)_linearFocusItems;
- (void)didSelectButton:(id)a3;
- (void)setBottomStackView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailsInformativeText:(id)a3;
- (void)setDetailsSubtitle:(id)a3;
- (void)setDetailsTitle:(id)a3;
- (void)setModel:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setTopStackView:(id)a3;
- (void)setupViews;
- (void)updateWithModel:(id)a3;
@end

@implementation CPSPointsOfInterestPickerInfoView

- (void)updateWithModel:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(CPSPointsOfInterestPickerInfoView *)v10 model];
  BOOL v8 = v3 == location[0];

  if (!v8)
  {
    objc_storeStrong((id *)&v10->_model, location[0]);
    v7 = [(CPSPointsOfInterestPickerInfoView *)v10 topStackView];

    if (v7)
    {
      v6 = [(CPSPointsOfInterestPickerInfoView *)v10 topStackView];
      [(UIStackView *)v6 removeFromSuperview];

      [(CPSPointsOfInterestPickerInfoView *)v10 setTopStackView:0];
    }
    v5 = [(CPSPointsOfInterestPickerInfoView *)v10 bottomStackView];

    if (v5)
    {
      v4 = [(CPSPointsOfInterestPickerInfoView *)v10 bottomStackView];
      [(UIStackView *)v4 removeFromSuperview];

      [(CPSPointsOfInterestPickerInfoView *)v10 setBottomStackView:0];
    }
    [(CPSPointsOfInterestPickerInfoView *)v10 setupViews];
  }
  objc_storeStrong(location, 0);
}

- (void)setupViews
{
  v130[3] = *MEMORY[0x263EF8340];
  v126 = self;
  v125[1] = (id)a2;
  id v2 = objc_alloc(MEMORY[0x263F1C9B8]);
  v105 = (double *)MEMORY[0x263F001A8];
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  topStackView = v126->_topStackView;
  v126->_topStackView = (UIStackView *)v3;

  [(UIStackView *)v126->_topStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UIStackView setAxis:](v126->_topStackView, "setAxis:");
  [(UIStackView *)v126->_topStackView setAlignment:1];
  [(UIStackView *)v126->_topStackView setDistribution:2];
  -[UIStackView setSpacing:](v126->_topStackView, "setSpacing:");
  [(CPSPointsOfInterestPickerInfoView *)v126 addSubview:v126->_topStackView];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263F1C9B8]), "initWithFrame:", *v105, v105[1], v105[2], v105[3]);
  bottomStackView = v126->_bottomStackView;
  v126->_bottomStackView = (UIStackView *)v5;

  [(UIStackView *)v126->_bottomStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)v126->_bottomStackView setAxis:1];
  [(UIStackView *)v126->_bottomStackView setAlignment:3];
  [(UIStackView *)v126->_bottomStackView setSpacing:2.0];
  [(CPSPointsOfInterestPickerInfoView *)v126 addSubview:v126->_bottomStackView];
  v106 = [(CPSPointsOfInterestPickerInfoView *)v126 model];
  v7 = [(CPPointOfInterest *)v106 detailTitle];
  v107 = v7;
  char v123 = 0;
  char v121 = 0;
  if (v7)
  {
    BOOL v8 = v7;
  }
  else
  {
    v124 = [(CPSPointsOfInterestPickerInfoView *)v126 model];
    char v123 = 1;
    v122 = [(CPPointOfInterest *)v124 title];
    char v121 = 1;
    BOOL v8 = v122;
  }
  v125[0] = v8;
  if (v121) {

  }
  if (v123) {
  if (v125[0])
  }
  {
    v9 = (UILabel *)CPSPointsOfInterestMakeLabel(@"CPSPointsOfInterestDetailsLabel");
    detailsTitle = v126->_detailsTitle;
    v126->_detailsTitle = v9;

    [(UILabel *)v126->_detailsTitle setNumberOfLines:4];
    [(UILabel *)v126->_detailsTitle setText:v125[0]];
    id v103 = +[CPSEntityStyles pickerInfoPrimaryFont];
    -[UILabel setFont:](v126->_detailsTitle, "setFont:");

    v104 = [(CPSPointsOfInterestPickerInfoView *)v126 topStackView];
    [(UIStackView *)v104 addArrangedSubview:v126->_detailsTitle];
  }
  v101 = [(CPSPointsOfInterestPickerInfoView *)v126 model];
  v102 = [(CPPointOfInterest *)v101 detailSubtitle];
  char v118 = 0;
  char v116 = 0;
  if (v102)
  {
    v11 = v102;
  }
  else
  {
    v119 = [(CPSPointsOfInterestPickerInfoView *)v126 model];
    char v118 = 1;
    v117 = [(CPPointOfInterest *)v119 subtitle];
    char v116 = 1;
    v11 = v117;
  }
  id v120 = v11;
  if (v116) {

  }
  if (v118) {
  if (v120)
  }
  {
    v12 = (UILabel *)CPSPointsOfInterestMakeLabel(@"CPSPointsOfInterestDetailsSubtitleLabel");
    detailsSubtitle = v126->_detailsSubtitle;
    v126->_detailsSubtitle = v12;

    [(UILabel *)v126->_detailsSubtitle setText:v120];
    [(UILabel *)v126->_detailsSubtitle setNumberOfLines:0];
    id v99 = +[CPSEntityStyles pickerInfoSecondaryFont];
    -[UILabel setFont:](v126->_detailsSubtitle, "setFont:");

    v100 = [(CPSPointsOfInterestPickerInfoView *)v126 topStackView];
    [(UIStackView *)v100 addArrangedSubview:v126->_detailsSubtitle];
  }
  v97 = [(CPSPointsOfInterestPickerInfoView *)v126 model];
  v98 = [(CPPointOfInterest *)v97 detailSummary];
  char v113 = 0;
  char v111 = 0;
  if (v98)
  {
    v14 = v98;
  }
  else
  {
    v114 = [(CPSPointsOfInterestPickerInfoView *)v126 model];
    char v113 = 1;
    v112 = [(CPPointOfInterest *)v114 summary];
    char v111 = 1;
    v14 = v112;
  }
  id v115 = v14;
  if (v111) {

  }
  if (v113) {
  if (v115)
  }
  {
    v15 = (UILabel *)CPSPointsOfInterestMakeLabel(@"CPSPointsOfInterestDetailsInformativeLabel");
    detailsInformativeText = v126->_detailsInformativeText;
    v126->_detailsInformativeText = v15;

    [(UILabel *)v126->_detailsInformativeText setText:v115];
    [(UILabel *)v126->_detailsInformativeText setNumberOfLines:0];
    id v95 = +[CPSEntityStyles pickerInfoSecondaryFont];
    -[UILabel setFont:](v126->_detailsInformativeText, "setFont:");

    v96 = [(CPSPointsOfInterestPickerInfoView *)v126 topStackView];
    [(UIStackView *)v96 addArrangedSubview:v126->_detailsInformativeText];
  }
  v93 = [(CPSPointsOfInterestPickerInfoView *)v126 model];
  v94 = [(CPPointOfInterest *)v93 primaryButton];

  if (v94)
  {
    v77 = [(CPSPointsOfInterestPickerInfoView *)v126 model];
    v76 = [(CPPointOfInterest *)v77 primaryButton];
    v17 = +[CPSStyledTextButton buttonWithTextButton:](CPSStyledTextButton, "buttonWithTextButton:");
    primaryButton = v126->_primaryButton;
    v126->_primaryButton = v17;

    [(CPSStyledTextButton *)v126->_primaryButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v78 = v126->_primaryButton;
    id v79 = (id)[MEMORY[0x263F1C658] systemFontOfSize:15.0 weight:*MEMORY[0x263F1D340]];
    -[CPSStyledTextButton setFontOverride:](v78, "setFontOverride:");

    [(CPSButton *)v126->_primaryButton setDelegate:v126];
    v80 = [(CPSPointsOfInterestPickerInfoView *)v126 bottomStackView];
    [(UIStackView *)v80 addArrangedSubview:v126->_primaryButton];

    v81 = (void *)MEMORY[0x263F08938];
    id v92 = (id)[(CPSStyledTextButton *)v126->_primaryButton heightAnchor];
    id v91 = (id)[v92 constraintEqualToConstant:29.0];
    v130[0] = v91;
    id v90 = (id)[(CPSStyledTextButton *)v126->_primaryButton leftAnchor];
    v89 = [(CPSPointsOfInterestPickerInfoView *)v126 bottomStackView];
    id v88 = (id)[(UIStackView *)v89 leftAnchor];
    id v87 = (id)objc_msgSend(v90, "constraintEqualToAnchor:");
    v130[1] = v87;
    id v86 = (id)[(CPSStyledTextButton *)v126->_primaryButton rightAnchor];
    v85 = [(CPSPointsOfInterestPickerInfoView *)v126 bottomStackView];
    id v84 = (id)[(UIStackView *)v85 rightAnchor];
    id v83 = (id)objc_msgSend(v86, "constraintEqualToAnchor:");
    v130[2] = v83;
    id v82 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v130 count:3];
    objc_msgSend(v81, "activateConstraints:");
  }
  v74 = [(CPSPointsOfInterestPickerInfoView *)v126 model];
  v75 = [(CPPointOfInterest *)v74 secondaryButton];

  if (v75)
  {
    v58 = [(CPSPointsOfInterestPickerInfoView *)v126 model];
    v57 = [(CPPointOfInterest *)v58 secondaryButton];
    v19 = +[CPSStyledTextButton buttonWithTextButton:](CPSStyledTextButton, "buttonWithTextButton:");
    secondaryButton = v126->_secondaryButton;
    v126->_secondaryButton = v19;

    [(CPSStyledTextButton *)v126->_secondaryButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSButton *)v126->_secondaryButton setDelegate:v126];
    v59 = v126->_secondaryButton;
    id v60 = (id)[MEMORY[0x263F1C658] systemFontOfSize:15.0 weight:*MEMORY[0x263F1D340]];
    -[CPSStyledTextButton setFontOverride:](v59, "setFontOverride:");

    v61 = [(CPSPointsOfInterestPickerInfoView *)v126 bottomStackView];
    [(UIStackView *)v61 addArrangedSubview:v126->_secondaryButton];

    v62 = (void *)MEMORY[0x263F08938];
    id v73 = (id)[(CPSStyledTextButton *)v126->_secondaryButton heightAnchor];
    id v72 = (id)[v73 constraintEqualToConstant:29.0];
    v129[0] = v72;
    id v71 = (id)[(CPSStyledTextButton *)v126->_secondaryButton leftAnchor];
    v70 = [(CPSPointsOfInterestPickerInfoView *)v126 bottomStackView];
    id v69 = (id)[(UIStackView *)v70 leftAnchor];
    id v68 = (id)objc_msgSend(v71, "constraintEqualToAnchor:");
    v129[1] = v68;
    id v67 = (id)[(CPSStyledTextButton *)v126->_secondaryButton rightAnchor];
    v66 = [(CPSPointsOfInterestPickerInfoView *)v126 bottomStackView];
    id v65 = (id)[(UIStackView *)v66 rightAnchor];
    id v64 = (id)objc_msgSend(v67, "constraintEqualToAnchor:");
    v129[2] = v64;
    id v63 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v129 count:3];
    objc_msgSend(v62, "activateConstraints:");
  }
  id v110 = (id)objc_opt_new();
  v41 = [(CPSPointsOfInterestPickerInfoView *)v126 topStackView];
  id v40 = (id)[(UIStackView *)v41 topAnchor];
  id v39 = (id)[(CPSPointsOfInterestPickerInfoView *)v126 safeAreaLayoutGuide];
  id v38 = (id)[v39 topAnchor];
  id v37 = (id)objc_msgSend(v40, "constraintEqualToAnchor:");
  v128[0] = v37;
  v36 = [(CPSPointsOfInterestPickerInfoView *)v126 topStackView];
  id v35 = (id)[(UIStackView *)v36 leadingAnchor];
  id v34 = (id)[(CPSPointsOfInterestPickerInfoView *)v126 safeAreaLayoutGuide];
  id v33 = (id)[v34 leadingAnchor];
  id v32 = (id)objc_msgSend(v35, "constraintEqualToAnchor:");
  v128[1] = v32;
  v31 = [(CPSPointsOfInterestPickerInfoView *)v126 topStackView];
  id v30 = (id)[(UIStackView *)v31 trailingAnchor];
  id v29 = (id)[(CPSPointsOfInterestPickerInfoView *)v126 safeAreaLayoutGuide];
  id v28 = (id)[v29 trailingAnchor];
  id v27 = (id)objc_msgSend(v30, "constraintEqualToAnchor:constant:", -20.0);
  v128[2] = v27;
  v26 = [(CPSPointsOfInterestPickerInfoView *)v126 topStackView];
  id v25 = (id)[(UIStackView *)v26 bottomAnchor];
  v24 = [(CPSPointsOfInterestPickerInfoView *)v126 bottomStackView];
  id v23 = (id)[(UIStackView *)v24 topAnchor];
  id v22 = (id)objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:");
  v128[3] = v22;
  id v109 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:4];

  v56 = [(CPSPointsOfInterestPickerInfoView *)v126 bottomStackView];
  id v55 = (id)[(UIStackView *)v56 leadingAnchor];
  id v54 = (id)[(CPSPointsOfInterestPickerInfoView *)v126 safeAreaLayoutGuide];
  id v53 = (id)[v54 leadingAnchor];
  id v52 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
  v127[0] = v52;
  v51 = [(CPSPointsOfInterestPickerInfoView *)v126 bottomStackView];
  id v50 = (id)[(UIStackView *)v51 trailingAnchor];
  id v49 = (id)[(CPSPointsOfInterestPickerInfoView *)v126 safeAreaLayoutGuide];
  id v48 = (id)[v49 trailingAnchor];
  id v47 = (id)objc_msgSend(v50, "constraintEqualToAnchor:");
  v127[1] = v47;
  v46 = [(CPSPointsOfInterestPickerInfoView *)v126 bottomStackView];
  id v45 = (id)[(UIStackView *)v46 bottomAnchor];
  id v44 = (id)[(CPSPointsOfInterestPickerInfoView *)v126 safeAreaLayoutGuide];
  id v43 = (id)[v44 bottomAnchor];
  id v42 = (id)objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:");
  v127[2] = v42;
  id v108 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v127 count:3];

  [v110 addObjectsFromArray:v109];
  [v110 addObjectsFromArray:v108];
  [MEMORY[0x263F08938] activateConstraints:v110];
  LODWORD(v21) = 1148846080;
  [(UILabel *)v126->_detailsTitle setContentCompressionResistancePriority:1 forAxis:v21];
  objc_storeStrong(&v108, 0);
  objc_storeStrong(&v109, 0);
  objc_storeStrong(&v110, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v120, 0);
  objc_storeStrong(v125, 0);
}

- (UIEdgeInsets)safeAreaInsets
{
  UIEdgeInsetsMake_5();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)didSelectButton:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = [(CPSPointsOfInterestPickerInfoView *)v9 delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v5 = [(CPSPointsOfInterestPickerInfoView *)v9 delegate];
    id v3 = location[0];
    double v4 = [(CPSPointsOfInterestPickerInfoView *)v9 model];
    -[CPSPointsOfInterestPickerInfoDelegate actionButtonPressed:forModel:](v5, "actionButtonPressed:forModel:", v3);
  }
  objc_storeStrong(location, 0);
}

- (id)_linearFocusItems
{
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  char v7 = [(CPSPointsOfInterestPickerInfoView *)v9 primaryButton];

  if (v7)
  {
    v6 = [(CPSPointsOfInterestPickerInfoView *)v9 primaryButton];
    objc_msgSend(v8[0], "addObject:");
  }
  double v5 = [(CPSPointsOfInterestPickerInfoView *)v9 secondaryButton];

  if (v5)
  {
    double v4 = [(CPSPointsOfInterestPickerInfoView *)v9 secondaryButton];
    objc_msgSend(v8[0], "addObject:");
  }
  id v3 = v8[0];
  objc_storeStrong(v8, 0);

  return v3;
}

- (CPPointOfInterest)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (CPSPointsOfInterestPickerInfoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSPointsOfInterestPickerInfoDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIStackView)topStackView
{
  return self->_topStackView;
}

- (void)setTopStackView:(id)a3
{
}

- (UIStackView)bottomStackView
{
  return self->_bottomStackView;
}

- (void)setBottomStackView:(id)a3
{
}

- (UILabel)detailsTitle
{
  return self->_detailsTitle;
}

- (void)setDetailsTitle:(id)a3
{
}

- (UILabel)detailsSubtitle
{
  return self->_detailsSubtitle;
}

- (void)setDetailsSubtitle:(id)a3
{
}

- (UILabel)detailsInformativeText
{
  return self->_detailsInformativeText;
}

- (void)setDetailsInformativeText:(id)a3
{
}

- (CPSStyledTextButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (CPSStyledTextButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end