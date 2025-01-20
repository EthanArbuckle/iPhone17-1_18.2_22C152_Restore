@interface CPSGuidanceBannerView
- (CPSAbridgableLabel)guidanceDetailTextLabel;
- (CPSAbridgableLabel)guidanceTextLabel;
- (CPSGuidanceBannerView)initWithBannerItem:(id)a3;
- (CPUIBannerViewButton)actionButton;
- (UIImageView)applicationIconImageView;
- (UIImageView)guidanceImageView;
- (UIStackView)labelStackView;
- (int64_t)currentInterfaceStyle;
- (void)_setGuidanceImageViewForImageSet:(id)a3;
- (void)_updateBannerSelectedState;
- (void)_updateLabels;
- (void)setActionButton:(id)a3;
- (void)setApplicationIconImageView:(id)a3;
- (void)setCurrentInterfaceStyle:(int64_t)a3;
- (void)setGuidanceDetailTextLabel:(id)a3;
- (void)setGuidanceImageView:(id)a3;
- (void)setGuidanceTextLabel:(id)a3;
- (void)setLabelStackView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBannerWithBannerItem:(id)a3;
@end

@implementation CPSGuidanceBannerView

- (CPSGuidanceBannerView)initWithBannerItem:(id)a3
{
  v87[11] = *MEMORY[0x263EF8340];
  v85 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v85;
  v85 = 0;
  v83.receiver = v3;
  v83.super_class = (Class)CPSGuidanceBannerView;
  v85 = [(CPSBannerView *)&v83 initWithBannerItem:location[0]];
  objc_storeStrong((id *)&v85, v85);
  if (v85)
  {
    id v82 = (id)[(CPSGuidanceBannerView *)v85 leadingAnchor];
    id v81 = (id)[MEMORY[0x263F1C550] labelColor];
    id v72 = objc_alloc(MEMORY[0x263F1C6D0]);
    id v73 = [(CPSBannerView *)v85 applicationIconImage];
    uint64_t v4 = objc_msgSend(v72, "initWithImage:");
    applicationIconImageView = v85->_applicationIconImageView;
    v85->_applicationIconImageView = (UIImageView *)v4;

    [(UIImageView *)v85->_applicationIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSGuidanceBannerView *)v85 addSubview:v85->_applicationIconImageView];
    id v6 = (id)[(UIImageView *)v85->_applicationIconImageView trailingAnchor];
    id v7 = v82;
    id v82 = v6;

    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    guidanceImageView = v85->_guidanceImageView;
    v85->_guidanceImageView = v8;

    [(UIImageView *)v85->_guidanceImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v85->_guidanceImageView setContentMode:1];
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v85->_guidanceImageView, "setContentCompressionResistancePriority:forAxis:", 0);
    id v74 = (id)[(UIImageView *)v85->_guidanceImageView widthAnchor];
    id v80 = (id)[v74 constraintLessThanOrEqualToConstant:92.0];

    LODWORD(v10) = 1148846080;
    [v80 setPriority:v10];
    id v75 = (id)[(UIImageView *)v85->_guidanceImageView heightAnchor];
    id v79 = (id)[v75 constraintLessThanOrEqualToConstant:38.0];

    LODWORD(v11) = 1148846080;
    [v79 setPriority:v11];
    v76 = [(CPSBannerView *)v85 bannerItem];
    v77 = [(CPSBannerItem *)v76 imageSet];

    if (v77)
    {
      v69 = v85;
      v71 = [(CPSBannerView *)v85 bannerItem];
      v70 = [(CPSBannerItem *)v71 imageSet];
      -[CPSGuidanceBannerView _setGuidanceImageViewForImageSet:](v69, "_setGuidanceImageViewForImageSet:");

      [(CPSGuidanceBannerView *)v85 addSubview:v85->_guidanceImageView];
      id v12 = (id)[(UIImageView *)v85->_guidanceImageView trailingAnchor];
      id v13 = v82;
      id v82 = v12;
    }
    id v78 = objc_alloc_init(MEMORY[0x263F1C9B8]);
    [v78 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v78 setAxis:1];
    [v78 setBaselineRelativeArrangement:1];
    [v78 setSpacing:18.0];
    objc_msgSend(v78, "setAlignment:");
    [(CPSGuidanceBannerView *)v85 addSubview:v78];
    objc_storeStrong((id *)&v85->_labelStackView, v78);
    v14 = objc_alloc_init(CPSAbridgableLabel);
    guidanceTextLabel = v85->_guidanceTextLabel;
    v85->_guidanceTextLabel = v14;

    v31 = v85->_guidanceTextLabel;
    id v32 = (id)objc_msgSend(MEMORY[0x263F1C658], "monospacedDigitSystemFontOfSize:weight:");
    -[CPSAbridgableLabel setFont:](v31, "setFont:");

    [(CPSAbridgableLabel *)v85->_guidanceTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    -[CPSAbridgableLabel setContentHuggingPriority:forAxis:](v85->_guidanceTextLabel, "setContentHuggingPriority:forAxis:", 0);
    [(CPSAbridgableLabel *)v85->_guidanceTextLabel sizeToFit];
    [(CPSAbridgableLabel *)v85->_guidanceTextLabel setTextColor:v81];
    [v78 addArrangedSubview:v85->_guidanceTextLabel];
    v16 = objc_alloc_init(CPSAbridgableLabel);
    guidanceDetailTextLabel = v85->_guidanceDetailTextLabel;
    v85->_guidanceDetailTextLabel = v16;

    v33 = v85->_guidanceDetailTextLabel;
    id v34 = (id)[MEMORY[0x263F1C658] systemFontOfSize:16.0 weight:*MEMORY[0x263F1D338]];
    -[CPSAbridgableLabel setFont:](v33, "setFont:");

    [(CPSAbridgableLabel *)v85->_guidanceDetailTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSAbridgableLabel *)v85->_guidanceDetailTextLabel sizeToFit];
    [(CPSAbridgableLabel *)v85->_guidanceDetailTextLabel setTextColor:v81];
    LODWORD(v18) = 1112014848;
    [(CPSAbridgableLabel *)v85->_guidanceDetailTextLabel setContentHuggingPriority:0 forAxis:v18];
    [v78 addArrangedSubview:v85->_guidanceDetailTextLabel];
    v85->_currentInterfaceStyle = 0;
    v19 = (CPUIBannerViewButton *)(id)[MEMORY[0x263F31360] buttonWithChevronImage];
    actionButton = v85->_actionButton;
    v85->_actionButton = v19;

    [(CPUIBannerViewButton *)v85->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSGuidanceBannerView *)v85 addSubview:v85->_actionButton];
    [(CPSGuidanceBannerView *)v85 _updateBannerSelectedState];
    v35 = (void *)MEMORY[0x263F08938];
    id v66 = (id)[(UIImageView *)v85->_applicationIconImageView leadingAnchor];
    id v65 = (id)[(CPSGuidanceBannerView *)v85 leadingAnchor];
    id v64 = (id)objc_msgSend(v66, "constraintEqualToAnchor:constant:", 16.0);
    v87[0] = v64;
    id v63 = (id)[(UIImageView *)v85->_applicationIconImageView centerYAnchor];
    id v62 = (id)[(CPSGuidanceBannerView *)v85 centerYAnchor];
    id v61 = (id)objc_msgSend(v63, "constraintEqualToAnchor:");
    v87[1] = v61;
    id v60 = (id)[(UIImageView *)v85->_applicationIconImageView widthAnchor];
    id v59 = (id)objc_msgSend(v60, "constraintEqualToConstant:");
    v87[2] = v59;
    id v58 = (id)[(UIImageView *)v85->_applicationIconImageView heightAnchor];
    id v57 = (id)[v58 constraintEqualToConstant:29.0];
    v87[3] = v57;
    id v56 = (id)[(UIStackView *)v85->_labelStackView leadingAnchor];
    id v55 = (id)[v56 constraintEqualToAnchor:v82 constant:10.0];
    v87[4] = v55;
    id v54 = (id)[(UIStackView *)v85->_labelStackView centerYAnchor];
    id v53 = (id)[(CPSGuidanceBannerView *)v85 centerYAnchor];
    id v52 = (id)objc_msgSend(v54, "constraintEqualToAnchor:");
    v87[5] = v52;
    id v51 = (id)[(UIStackView *)v85->_labelStackView topAnchor];
    id v50 = (id)[(CPSGuidanceBannerView *)v85 topAnchor];
    id v49 = (id)objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:");
    v87[6] = v49;
    id v48 = (id)[(UIStackView *)v85->_labelStackView bottomAnchor];
    id v47 = (id)[(CPSGuidanceBannerView *)v85 bottomAnchor];
    id v46 = (id)objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:");
    v87[7] = v46;
    id v45 = (id)[(UIStackView *)v85->_labelStackView trailingAnchor];
    id v44 = (id)[(CPUIBannerViewButton *)v85->_actionButton leadingAnchor];
    id v43 = (id)objc_msgSend(v45, "constraintEqualToAnchor:constant:", -10.0);
    v87[8] = v43;
    id v42 = (id)[(CPUIBannerViewButton *)v85->_actionButton trailingAnchor];
    id v41 = (id)[(CPSGuidanceBannerView *)v85 trailingAnchor];
    id v40 = (id)objc_msgSend(v42, "constraintEqualToAnchor:constant:", -16.0);
    v87[9] = v40;
    id v39 = (id)[(CPUIBannerViewButton *)v85->_actionButton centerYAnchor];
    id v38 = (id)[(CPSGuidanceBannerView *)v85 centerYAnchor];
    id v37 = (id)objc_msgSend(v39, "constraintEqualToAnchor:");
    v87[10] = v37;
    id v36 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:11];
    objc_msgSend(v35, "activateConstraints:");

    v67 = [(CPSBannerView *)v85 bannerItem];
    v68 = [(CPSBannerItem *)v67 imageSet];

    if (v68)
    {
      v23 = (void *)MEMORY[0x263F08938];
      id v30 = (id)[(UIImageView *)v85->_guidanceImageView leadingAnchor];
      id v29 = (id)[(UIImageView *)v85->_applicationIconImageView trailingAnchor];
      id v28 = (id)objc_msgSend(v30, "constraintEqualToAnchor:constant:", 10.0);
      v86[0] = v28;
      id v27 = (id)[(UIImageView *)v85->_guidanceImageView centerYAnchor];
      id v26 = (id)[(CPSGuidanceBannerView *)v85 centerYAnchor];
      id v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
      v86[1] = v25;
      v86[2] = v80;
      v86[3] = v79;
      id v24 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v86 count:4];
      objc_msgSend(v23, "activateConstraints:");
    }
    [(CPSGuidanceBannerView *)v85 _updateLabels];
    objc_storeStrong(&v78, 0);
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, 0);
    objc_storeStrong(&v81, 0);
    objc_storeStrong(&v82, 0);
  }
  v22 = v85;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v85, 0);
  return v22;
}

- (void)_updateLabels
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = [(CPSBannerView *)self bannerItem];
  guidanceTextLabel = v21->_guidanceTextLabel;
  id v12 = (id)[location[0] textVariants];
  -[CPSAbridgableLabel setTextVariants:](guidanceTextLabel, "setTextVariants:");

  id v13 = (id)[location[0] textVariants];
  char v18 = 0;
  char v16 = 0;
  char v14 = 0;
  if (!v13
    || (id v19 = (id)[location[0] textVariants],
        char v18 = 1,
        BOOL v10 = 0,
        ![v19 count]))
  {
    id v17 = (id)[location[0] detailTextVariants];
    char v16 = 1;
    BOOL v9 = 1;
    if (!v17)
    {
      id v15 = (id)[location[0] attributedDetailTextVariants];
      char v14 = 1;
      BOOL v9 = v15 != 0;
    }
    BOOL v10 = v9;
  }
  if (v14) {

  }
  if (v16) {
  if (v18)
  }

  if (v10) {
    [(CPSAbridgableLabel *)v21->_guidanceDetailTextLabel setNumberOfLines:2];
  }
  else {
    [(CPSAbridgableLabel *)v21->_guidanceDetailTextLabel setNumberOfLines:1];
  }
  id v7 = [(CPSBannerView *)v21 bannerItem];
  v8 = [(CPSBannerItem *)v7 attributedDetailTextVariants];

  if (v8)
  {
    guidanceDetailTextLabel = v21->_guidanceDetailTextLabel;
    id v6 = (id)[location[0] attributedDetailTextVariants];
    -[CPSAbridgableLabel setAttributedTextVariants:](guidanceDetailTextLabel, "setAttributedTextVariants:");
  }
  else
  {
    id v4 = (id)[location[0] detailTextVariants];

    if (v4)
    {
      v2 = v21->_guidanceDetailTextLabel;
      id v3 = (id)[location[0] detailTextVariants];
      -[CPSAbridgableLabel setTextVariants:](v2, "setTextVariants:");
    }
  }
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  BOOL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8.receiver = v10;
  v8.super_class = (Class)CPSGuidanceBannerView;
  [(CPSGuidanceBannerView *)&v8 traitCollectionDidChange:location[0]];
  id v4 = [(CPSGuidanceBannerView *)v10 applicationIconImageView];
  id v3 = [(CPSBannerView *)v10 applicationIconImage];
  -[UIImageView setImage:](v4, "setImage:");

  v5 = v10;
  id v7 = [(CPSBannerView *)v10 bannerItem];
  id v6 = [(CPSBannerItem *)v7 imageSet];
  -[CPSGuidanceBannerView _setGuidanceImageViewForImageSet:](v5, "_setGuidanceImageViewForImageSet:");

  [(CPSGuidanceBannerView *)v10 _updateBannerSelectedState];
  [(CPSGuidanceBannerView *)v10 _updateLabels];
  objc_storeStrong(location, 0);
}

- (void)updateBannerWithBannerItem:(id)a3
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)CPSGuidanceBannerView;
  [(CPSBannerView *)&v6 updateBannerWithBannerItem:location[0]];
  id v3 = v8;
  v5 = [(CPSBannerView *)v8 bannerItem];
  id v4 = [(CPSBannerItem *)v5 imageSet];
  -[CPSGuidanceBannerView _setGuidanceImageViewForImageSet:](v3, "_setGuidanceImageViewForImageSet:");

  [(CPSGuidanceBannerView *)v8 _updateLabels];
  objc_storeStrong(location, 0);
}

- (void)_setGuidanceImageViewForImageSet:(id)a3
{
  BOOL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[(CPSGuidanceBannerView *)v10 traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  if (v8 == 2)
  {
    guidanceImageView = v10->_guidanceImageView;
    id v6 = (id)[location[0] darkContentImage];
    -[UIImageView setImage:](guidanceImageView, "setImage:");
  }
  else
  {
    id v4 = (id)objc_msgSend(location[0], "lightContentImage", v10->_guidanceImageView);
    objc_msgSend(v3, "setImage:");
  }
  objc_storeStrong(location, 0);
}

- (void)_updateBannerSelectedState
{
  id v3 = (id)[(CPSGuidanceBannerView *)self traitCollection];
  char v5 = 0;
  BOOL v4 = 1;
  if (([v3 interactionModel] & 2) != 2)
  {
    id v6 = (id)[(CPSGuidanceBannerView *)self traitCollection];
    char v5 = 1;
    BOOL v4 = [v6 primaryInteractionModel] == 8;
  }
  v2 = [(CPSGuidanceBannerView *)self actionButton];
  [(CPUIBannerViewButton *)v2 setSelected:v4];

  if (v5) {
}
  }

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (CPUIBannerViewButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (UIImageView)applicationIconImageView
{
  return self->_applicationIconImageView;
}

- (void)setApplicationIconImageView:(id)a3
{
}

- (UIImageView)guidanceImageView
{
  return self->_guidanceImageView;
}

- (void)setGuidanceImageView:(id)a3
{
}

- (CPSAbridgableLabel)guidanceTextLabel
{
  return self->_guidanceTextLabel;
}

- (void)setGuidanceTextLabel:(id)a3
{
}

- (CPSAbridgableLabel)guidanceDetailTextLabel
{
  return self->_guidanceDetailTextLabel;
}

- (void)setGuidanceDetailTextLabel:(id)a3
{
}

- (int64_t)currentInterfaceStyle
{
  return self->_currentInterfaceStyle;
}

- (void)setCurrentInterfaceStyle:(int64_t)a3
{
  self->_currentInterfaceStyle = a3;
}

- (void).cxx_destruct
{
}

@end