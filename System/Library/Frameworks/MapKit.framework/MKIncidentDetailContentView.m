@interface MKIncidentDetailContentView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (MKIncidentDetailContentView)initWithFrame:(CGRect)a3;
- (MKIncidentDetailDelegate)delegate;
- (id)customBodyTextView;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)_clearChildrenStackView;
- (void)_didTapActionButton;
- (void)_setConstraints;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAccessoryFooterView:(id)a3;
- (void)configureWithAdvisories:(id)a3 artwork:(id)a4;
- (void)configureWithAdvisoryItem:(id)a3;
- (void)configureWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 image:(id)a6;
- (void)reset;
- (void)setDelegate:(id)a3;
@end

@implementation MKIncidentDetailContentView

- (MKIncidentDetailContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKIncidentDetailContentView;
  v3 = -[MKIncidentDetailContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MKIncidentDetailContentView *)v3 _setupSubviews];
    [(MKIncidentDetailContentView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupSubviews
{
  uint64_t v3 = *MEMORY[0x1E4F43870];
  objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E4F43870], *MEMORY[0x1E4F43930]);
  v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
  titleFont = self->_titleFont;
  self->_titleFont = v4;

  objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E4F438C8]);
  objc_super v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
  subTitleFont = self->_subTitleFont;
  self->_subTitleFont = v6;

  objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", v3);
  v8 = (UIFont *)objc_claimAutoreleasedReturnValue();
  bodyFont = self->_bodyFont;
  self->_bodyFont = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v15 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v15;

  [(UIView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_backgroundView setAccessibilityIdentifier:@"BackgroundView"];
  v17 = [(UIView *)self->_backgroundView layer];
  [v17 setCornerRadius:10.0];

  v18 = [(UIView *)self->_backgroundView layer];
  [v18 setMasksToBounds:1];

  v19 = [MEMORY[0x1E4F428B8] tertiarySystemBackgroundColor];
  [(UIView *)self->_backgroundView setBackgroundColor:v19];

  [(MKIncidentDetailContentView *)self addSubview:self->_backgroundView];
  v20 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42E20]), "initWithFrame:", v11, v12, v13, v14);
  stackView = self->_stackView;
  self->_stackView = v20;

  [(UIStackView *)self->_stackView setPreservesSuperviewLayoutMargins:1];
  [(UIStackView *)self->_stackView setSpacing:10.0];
  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setDistribution:0];
  [(UIStackView *)self->_stackView setAlignment:0];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAccessibilityIdentifier:@"StackView"];
  [(MKIncidentDetailContentView *)self addSubview:self->_stackView];
  v22 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42E20]), "initWithFrame:", v11, v12, v13, v14);
  childrenStackViews = self->_childrenStackViews;
  self->_childrenStackViews = v22;

  [(UIStackView *)self->_childrenStackViews setTranslatesAutoresizingMaskIntoConstraints:0];
  v24 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v11, v12, v13, v14);
  imageView = self->_imageView;
  self->_imageView = v24;

  [(UIImageView *)self->_imageView setContentMode:1];
  [(UIImageView *)self->_imageView setClipsToBounds:1];
  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_imageView setAccessibilityIdentifier:@"ImageView"];
  [(UIImageView *)self->_imageView setIsAccessibilityElement:1];
  [(MKIncidentDetailContentView *)self addSubview:self->_imageView];
  v26 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v11, v12, v13, v14);
  titleView = self->_titleView;
  self->_titleView = v26;

  [(UIView *)self->_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_titleView setAccessibilityIdentifier:@"TitleView"];
  v28 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIView *)self->_titleView setBackgroundColor:v28];

  [(MKIncidentDetailContentView *)self addSubview:self->_titleView];
  v29 = (_MKUILabel *)objc_opt_new();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v29;

  [(_MKUILabel *)self->_titleLabel setNumberOfLines:0];
  [(_MKUILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKUILabel *)self->_titleLabel setFont:self->_titleFont];
  [(_MKUILabel *)self->_titleLabel setAccessibilityIdentifier:@"TitleView"];
  [(UIView *)self->_titleView addSubview:self->_titleLabel];
  v31 = (_MKUILabel *)objc_opt_new();
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v31;

  [(_MKUILabel *)self->_subtitleLabel setNumberOfLines:0];
  [(_MKUILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_MKUILabel *)self->_subtitleLabel setFont:self->_subTitleFont];
  v33 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(_MKUILabel *)self->_subtitleLabel setTextColor:v33];

  [(_MKUILabel *)self->_subtitleLabel setAccessibilityIdentifier:@"TimeDescriptionView"];
  [(UIView *)self->_titleView addSubview:self->_subtitleLabel];
  v34 = -[MKViewWithHairline initWithFrame:]([MKViewWithHairline alloc], "initWithFrame:", v11, v12, v13, v14);
  hairlineView = self->_hairlineView;
  self->_hairlineView = v34;

  [(MKViewWithHairline *)self->_hairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKViewWithHairline *)self->_hairlineView setHidden:1];
  [(MKViewWithHairline *)self->_hairlineView setTopHairlineHidden:1];
  [(MKViewWithHairline *)self->_hairlineView setBottomHairlineHidden:0];
  [(MKIncidentDetailContentView *)self addSubview:self->_hairlineView];
  v36 = [(MKIncidentDetailContentView *)self customBodyTextView];
  attributionView = self->_attributionView;
  self->_attributionView = v36;

  [(UITextView *)self->_attributionView setFont:self->_bodyFont];
  [(UITextView *)self->_attributionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextView *)self->_attributionView setAccessibilityIdentifier:@"AttributionView"];
  [(MKIncidentDetailContentView *)self addSubview:self->_attributionView];
  v38 = [(MKIncidentDetailContentView *)self customBodyTextView];
  bodyTextView = self->_bodyTextView;
  self->_bodyTextView = v38;
}

- (void)_setupConstraints
{
  v101[31] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UITextView *)self->_attributionView heightAnchor];
  double v4 = 0.0;
  v5 = [v3 constraintEqualToConstant:0.0];
  attributionViewEmptyHeightConstraint = self->_attributionViewEmptyHeightConstraint;
  self->_attributionViewEmptyHeightConstraint = v5;

  v7 = [(UIStackView *)self->_stackView bottomAnchor];
  v8 = [(UIView *)self->_backgroundView bottomAnchor];
  v9 = [v7 constraintEqualToAnchor:v8 constant:-12.0];
  stackViewBottomConstraint = self->_stackViewBottomConstraint;
  self->_stackViewBottomConstraint = v9;

  double v11 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v11 userInterfaceIdiom] == 5) {
    double v4 = 12.0;
  }

  v69 = (void *)MEMORY[0x1E4F28DC8];
  v100 = [(UIView *)self->_backgroundView topAnchor];
  v99 = [(MKIncidentDetailContentView *)self topAnchor];
  v98 = [v100 constraintEqualToAnchor:v99 constant:v4];
  v101[0] = v98;
  v97 = [(UIView *)self->_backgroundView bottomAnchor];
  v96 = [(MKIncidentDetailContentView *)self bottomAnchor];
  v95 = [v97 constraintEqualToAnchor:v96 constant:-12.0];
  v101[1] = v95;
  v94 = [(UIView *)self->_backgroundView trailingAnchor];
  v93 = [(MKIncidentDetailContentView *)self trailingAnchor];
  v92 = [v94 constraintEqualToAnchor:v93 constant:-16.0];
  v101[2] = v92;
  v91 = [(UIView *)self->_backgroundView leadingAnchor];
  v90 = [(MKIncidentDetailContentView *)self leadingAnchor];
  v89 = [v91 constraintEqualToAnchor:v90 constant:16.0];
  v101[3] = v89;
  v88 = [(UIImageView *)self->_imageView widthAnchor];
  v87 = [v88 constraintEqualToConstant:35.0];
  v101[4] = v87;
  v86 = [(UIImageView *)self->_imageView heightAnchor];
  v85 = [v86 constraintEqualToConstant:35.0];
  v101[5] = v85;
  v84 = [(UIImageView *)self->_imageView leadingAnchor];
  v83 = [(UIView *)self->_backgroundView leadingAnchor];
  v82 = [v84 constraintEqualToAnchor:v83 constant:16.0];
  v101[6] = v82;
  v81 = [(UIImageView *)self->_imageView centerYAnchor];
  v80 = [(UIView *)self->_titleView centerYAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v101[7] = v79;
  v78 = [(UIImageView *)self->_imageView topAnchor];
  v77 = [(UIView *)self->_backgroundView topAnchor];
  v76 = [v78 constraintGreaterThanOrEqualToAnchor:v77 constant:12.0];
  v101[8] = v76;
  v75 = [(UIView *)self->_titleView topAnchor];
  v74 = [(UIView *)self->_backgroundView topAnchor];
  v73 = [v75 constraintGreaterThanOrEqualToAnchor:v74 constant:12.0];
  v101[9] = v73;
  v72 = [(UIView *)self->_titleView bottomAnchor];
  v71 = [(UIStackView *)self->_stackView topAnchor];
  v70 = [v72 constraintEqualToAnchor:v71 constant:-12.0];
  v101[10] = v70;
  v68 = [(UIView *)self->_titleView leadingAnchor];
  v67 = [(UIImageView *)self->_imageView trailingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67 constant:10.0];
  v101[11] = v66;
  v65 = [(UIView *)self->_titleView trailingAnchor];
  v64 = [(UIView *)self->_backgroundView trailingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:-16.0];
  v101[12] = v63;
  v62 = [(_MKUILabel *)self->_titleLabel leadingAnchor];
  v61 = [(UIView *)self->_titleView leadingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v101[13] = v60;
  v59 = [(_MKUILabel *)self->_titleLabel trailingAnchor];
  v58 = [(UIView *)self->_titleView trailingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v101[14] = v57;
  v56 = [(_MKUILabel *)self->_titleLabel topAnchor];
  v55 = [(UIView *)self->_titleView topAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v101[15] = v54;
  v52 = [(_MKUILabel *)self->_titleLabel bottomAnchor];
  v51 = [(_MKUILabel *)self->_subtitleLabel topAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v101[16] = v50;
  v49 = [(_MKUILabel *)self->_subtitleLabel leadingAnchor];
  v48 = [(_MKUILabel *)self->_titleLabel leadingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v101[17] = v47;
  v46 = [(_MKUILabel *)self->_subtitleLabel trailingAnchor];
  v45 = [(_MKUILabel *)self->_titleLabel trailingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v101[18] = v44;
  v43 = [(_MKUILabel *)self->_subtitleLabel bottomAnchor];
  v42 = [(UIView *)self->_titleView bottomAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v101[19] = v41;
  v40 = [(UIStackView *)self->_stackView leadingAnchor];
  v39 = [(UIImageView *)self->_imageView leadingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v101[20] = v38;
  v37 = [(UIStackView *)self->_stackView trailingAnchor];
  v36 = [(UIView *)self->_backgroundView trailingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:-16.0];
  double v12 = self->_stackViewBottomConstraint;
  v101[21] = v35;
  v101[22] = v12;
  v53 = [(MKViewWithHairline *)self->_hairlineView topAnchor];
  v34 = [(UIStackView *)self->_stackView bottomAnchor];
  v33 = [v53 constraintEqualToAnchor:v34 constant:12.0];
  v101[23] = v33;
  v32 = [(MKViewWithHairline *)self->_hairlineView trailingAnchor];
  v31 = [(UIView *)self->_backgroundView trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v101[24] = v30;
  v29 = [(MKViewWithHairline *)self->_hairlineView leadingAnchor];
  v28 = [(UIStackView *)self->_stackView leadingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v101[25] = v27;
  v26 = [(UITextView *)self->_attributionView topAnchor];
  v25 = [(MKViewWithHairline *)self->_hairlineView bottomAnchor];
  v24 = [v26 constraintEqualToAnchor:v25 constant:12.0];
  v101[26] = v24;
  double v13 = [(UITextView *)self->_attributionView bottomAnchor];
  double v14 = [(UIView *)self->_backgroundView bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:-12.0];
  v101[27] = v15;
  v16 = [(UITextView *)self->_attributionView trailingAnchor];
  v17 = [(UIView *)self->_backgroundView trailingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:-16.0];
  v101[28] = v18;
  v19 = [(UITextView *)self->_attributionView leadingAnchor];
  v20 = [(UIImageView *)self->_imageView leadingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v22 = self->_attributionViewEmptyHeightConstraint;
  v101[29] = v21;
  v101[30] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:31];
  [v69 activateConstraints:v23];
}

- (void)reset
{
  [(UIStackView *)self->_stackView _mapkit_setArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  [(_MKUILabel *)self->_titleLabel setAttributedText:0];
  [(_MKUILabel *)self->_subtitleLabel setAttributedText:0];
  advisoryItem = self->_advisoryItem;
  self->_advisoryItem = 0;

  [(MKViewWithHairline *)self->_hairlineView setHidden:1];
  [(UITextView *)self->_attributionView setAttributedText:0];
  [(NSLayoutConstraint *)self->_attributionViewEmptyHeightConstraint setActive:1];
  stackViewBottomConstraint = self->_stackViewBottomConstraint;

  [(NSLayoutConstraint *)stackViewBottomConstraint setActive:1];
}

- (id)customBodyTextView
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F42F58]);
  objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
  double v4 = [v3 textContainer];
  [v4 setLineFragmentPadding:0.0];

  [v3 setDelegate:self];
  [v3 setEditable:0];
  [v3 setDataDetectorTypes:3];
  [v3 setScrollEnabled:0];
  [v3 setTextAlignment:4];
  v5 = [MEMORY[0x1E4F428B8] clearColor];
  [v3 setBackgroundColor:v5];

  v13[0] = *MEMORY[0x1E4F42510];
  objc_super v6 = [(UIView *)self mk_theme];
  v7 = [v6 tintColor];
  v14[0] = v7;
  v13[1] = *MEMORY[0x1E4F42508];
  v8 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E4F43870]);
  v14[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v3 setLinkTextAttributes:v9];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = [(UIView *)self mk_theme];
  double v11 = [v10 textColor];
  [v3 setTextColor:v11];

  [v3 setFont:self->_bodyFont];

  return v3;
}

- (void)_clearChildrenStackView
{
  id v2 = [(UIStackView *)self->_childrenStackViews arrangedSubviews];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_32];
}

uint64_t __54__MKIncidentDetailContentView__clearChildrenStackView__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (void)configureWithAdvisoryItem:(id)a3
{
  v59[1] = *MEMORY[0x1E4F143B8];
  v5 = (GEOComposedRouteAdvisoryItem *)a3;
  if (self->_advisoryItem == v5) {
    goto LABEL_29;
  }
  objc_super v6 = [MEMORY[0x1E4F1CA48] array];
  advisoryNoticeItem = self->_advisoryNoticeItem;
  self->_advisoryNoticeItem = 0;

  objc_storeStrong((id *)&self->_advisoryItem, a3);
  v8 = [(GEOComposedRouteAdvisoryItem *)v5 artwork];
  v9 = [(UIImageView *)self->_imageView traitCollection];
  uint64_t v10 = ImageForArtworkDataSource(v8, v9);

  v53 = (void *)v10;
  if (v10)
  {
    [(UIImageView *)self->_imageView setImage:v10];
  }
  else
  {
    double v11 = [MEMORY[0x1E4F42A80] imageNamed:@"warning_badge"];
    [(UIImageView *)self->_imageView setImage:v11];
  }
  [v6 addObject:self->_imageView];
  double v12 = [(GEOComposedRouteAdvisoryItem *)v5 titleString];
  double v13 = [v12 stringWithDefaultOptions];
  double v14 = [v13 capitalizedString];
  if (v14)
  {
    p_titleLabel = &self->_titleLabel;
    [(_MKUILabel *)self->_titleLabel setText:v14];
  }
  else
  {
    v16 = _MKLocalizedStringFromThisBundle(@"MKIncidentExtendedDetailCell_Advisories_title");
    p_titleLabel = &self->_titleLabel;
    [(_MKUILabel *)self->_titleLabel setText:v16];
  }
  [v6 addObject:*p_titleLabel];
  v17 = [(GEOComposedRouteAdvisoryItem *)v5 dateOfLastUpdateString];
  if (v17)
  {

LABEL_11:
    v19 = [(GEOComposedRouteAdvisoryItem *)v5 dateOfLastUpdateString];

    if (v19)
    {
      v20 = [(GEOComposedRouteAdvisoryItem *)v5 dateOfLastUpdateString];
      v21 = [v20 stringWithDefaultOptions];
    }
    else
    {
      if (qword_1EB315A98 != -1) {
        dispatch_once(&qword_1EB315A98, &__block_literal_global_69);
      }
      v22 = (void *)MEMORY[0x1E4F28C10];
      v23 = [(id)_MergedGlobals_3_0 locale];
      v24 = [v22 dateFormatFromTemplate:@"YYYYMMddjma" options:0 locale:v23];
      [(id)_MergedGlobals_3_0 setDateFormat:v24];

      v25 = NSString;
      v20 = _MKLocalizedStringFromThisBundle(@"Placecard_TransitIncident_LastUpdated");
      v26 = (void *)_MergedGlobals_3_0;
      v27 = [(GEOComposedRouteAdvisoryItem *)v5 dateOfLastUpdate];
      v28 = [v26 stringFromDate:v27];
      v21 = objc_msgSend(v25, "stringWithFormat:", v20, v28);
    }
    [(_MKUILabel *)self->_subtitleLabel setText:v21];
    [v6 addObject:self->_subtitleLabel];

    goto LABEL_17;
  }
  v18 = [(GEOComposedRouteAdvisoryItem *)v5 dateOfLastUpdate];

  if (v18) {
    goto LABEL_11;
  }
LABEL_17:
  v29 = DetailTextsForAdvisoryItem(v5);
  if (!v29)
  {
    v30 = [(GEOComposedRouteAdvisoryItem *)v5 subtitleString];
    v31 = [v30 stringWithDefaultOptions];

    if (v31)
    {
      v59[0] = v31;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
    }
    else
    {
      v29 = 0;
    }
  }
  [(MKIncidentDetailContentView *)self _clearChildrenStackView];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __57__MKIncidentDetailContentView_configureWithAdvisoryItem___block_invoke_2;
  v54[3] = &unk_1E54BA3B0;
  v54[4] = self;
  v32 = v5;
  v55 = v32;
  id v33 = v29;
  id v56 = v33;
  [v33 enumerateObjectsUsingBlock:v54];
  v34 = [(UIStackView *)self->_childrenStackViews arrangedSubviews];
  uint64_t v35 = [v34 count];

  if (v35) {
    [(UIStackView *)self->_stackView addArrangedSubview:self->_childrenStackViews];
  }
  v36 = [(GEOComposedRouteAdvisoryItem *)v32 cardAction];
  int v37 = [v36 type];

  if (v37 == 1)
  {
    id v38 = objc_alloc(MEMORY[0x1E4F427E0]);
    v39 = objc_msgSend(v38, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = [MEMORY[0x1E4F428B8] systemBlueColor];
    [v39 setTitleColor:v40 forState:0];

    v41 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", *MEMORY[0x1E4F438C8], 0);
    v42 = [v39 titleLabel];
    [v42 setFont:v41];

    v43 = [v39 titleLabel];
    [v43 setTextAlignment:4];

    v44 = _MKLocalizedStringFromThisBundle(@"Placecard_TransitIncident_actionButton");
    [v39 setTitle:v44 forState:0];

    [v39 addTarget:self action:sel__didTapActionButton forControlEvents:0x2000];
    [(UIStackView *)self->_stackView addArrangedSubview:v39];
  }
  [v6 addObject:self->_stackView];
  v45 = [(GEOComposedRouteAdvisoryItem *)v32 attributionString];

  if (v45)
  {
    v46 = [MKServerFormattedString alloc];
    v47 = [(GEOComposedRouteAdvisoryItem *)v32 attributionString];
    v48 = [(MKServerFormattedString *)v46 initWithComposedString:v47];

    v57[0] = *MEMORY[0x1E4F42510];
    v49 = [MEMORY[0x1E4F428B8] labelColor];
    v57[1] = *MEMORY[0x1E4F42508];
    v58[0] = v49;
    v58[1] = self->_bodyFont;
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
    v51 = [(MKServerFormattedString *)v48 multiPartAttributedStringWithAttributes:v50];
    v52 = [v51 attributedString];

    [(UITextView *)self->_attributionView setAttributedText:v52];
    [(UITextView *)self->_attributionView setDelegate:self];
    [(NSLayoutConstraint *)self->_attributionViewEmptyHeightConstraint setActive:0];
    [(NSLayoutConstraint *)self->_stackViewBottomConstraint setActive:0];
    [(MKViewWithHairline *)self->_hairlineView setHidden:0];
    [v6 addObject:self->_attributionView];
  }
  [(MKIncidentDetailContentView *)self setAccessibilityElements:v6];

LABEL_29:
}

void __57__MKIncidentDetailContentView_configureWithAdvisoryItem___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_3_0;
  _MergedGlobals_3_0 = (uint64_t)v0;

  id v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)_MergedGlobals_3_0 setLocale:v2];
}

void __57__MKIncidentDetailContentView_configureWithAdvisoryItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v8 = [v5 customBodyTextView];
  if (a3
    || ![*(id *)(a1 + 40) isNonTransitIncident]
    || (unint64_t)[*(id *)(a1 + 48) count] <= 1)
  {
    v7 = &OBJC_IVAR___MKIncidentDetailContentView__bodyFont;
  }
  else
  {
    v7 = &OBJC_IVAR___MKIncidentDetailContentView__titleFont;
  }
  [v8 setFont:*(void *)(*(void *)(a1 + 32) + *v7)];
  [v8 setText:v6];

  [v8 setAccessibilityIdentifier:@"TextView"];
  [*(id *)(*(void *)(a1 + 32) + 448) addArrangedSubview:v8];
}

- (void)configureWithAdvisories:(id)a3 artwork:(id)a4
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  advisoryItem = self->_advisoryItem;
  self->_advisoryItem = 0;
  id v9 = a4;

  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  objc_storeStrong((id *)&self->_advisoryNoticeItem, a3);
  double v11 = [(UIImageView *)self->_imageView traitCollection];
  uint64_t v12 = ImageForArtworkDataSource(v9, v11);

  if (!v12)
  {
    double v13 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:3 scale:30.0];
    double v14 = [MEMORY[0x1E4F42A80] systemImageNamed:@"leaf.circle.fill" withConfiguration:v13];
    v15 = [MEMORY[0x1E4F428B8] systemGreenColor];
    v16 = [v14 _flatImageWithColor:v15];
    uint64_t v12 = [v16 imageWithRenderingMode:1];
  }
  v50 = (void *)v12;
  [(UIImageView *)self->_imageView setImage:v12];
  [v10 addObject:self->_imageView];
  [(MKIncidentDetailContentView *)self _clearChildrenStackView];
  v17 = self;
  v52 = [(MKIncidentDetailContentView *)v17 customBodyTextView];
  v18 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v19 = [v18 userInterfaceIdiom];

  if (v19 == 5) {
    [(UITextView *)v17->_attributionView setDelegate:0];
  }
  v51 = v7;
  v20 = [v7 advisoryCard];
  id v21 = objc_alloc(MEMORY[0x1E4F644D0]);
  v22 = [v20 title];
  v23 = (void *)[v21 initWithGeoFormattedString:v22];

  v48 = v23;
  v24 = [v23 stringWithDefaultOptions];
  [(_MKUILabel *)v17->_titleLabel setText:v24];

  [v10 addObject:v17->_titleLabel];
  id v25 = objc_alloc(MEMORY[0x1E4F644D0]);
  v26 = [v20 details];
  uint64_t v27 = [v25 initWithGeoFormattedString:v26];

  v47 = (void *)v27;
  v28 = [[MKServerFormattedString alloc] initWithComposedString:v27];
  uint64_t v45 = *MEMORY[0x1E4F42510];
  v55[0] = *MEMORY[0x1E4F42510];
  v29 = [MEMORY[0x1E4F428B8] labelColor];
  v56[0] = v29;
  uint64_t v30 = *MEMORY[0x1E4F42508];
  v55[1] = *MEMORY[0x1E4F42508];
  v56[1] = v17->_bodyFont;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
  v46 = v28;
  v32 = [(MKServerFormattedString *)v28 multiPartAttributedStringWithAttributes:v31];
  id v33 = [v32 attributedString];

  [v52 setAttributedText:v33];
  [(UIStackView *)v17->_childrenStackViews addArrangedSubview:v52];
  [(UIStackView *)v17->_stackView addArrangedSubview:v17->_childrenStackViews];
  [v10 addObject:v17->_stackView];
  id v34 = objc_alloc(MEMORY[0x1E4F644D0]);
  v49 = v20;
  uint64_t v35 = v20;
  v36 = v10;
  int v37 = [v35 metadata];
  id v38 = (void *)[v34 initWithGeoFormattedString:v37];

  if (v38)
  {
    v39 = [[MKServerFormattedString alloc] initWithComposedString:v38];
    v53[0] = v45;
    v40 = [MEMORY[0x1E4F428B8] labelColor];
    v53[1] = v30;
    v54[0] = v40;
    v54[1] = v17->_bodyFont;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
    v42 = v41 = v33;
    v43 = [(MKServerFormattedString *)v39 multiPartAttributedStringWithAttributes:v42];
    v44 = [v43 attributedString];

    id v33 = v41;
    [(UITextView *)v17->_attributionView setAttributedText:v44];
    [(NSLayoutConstraint *)v17->_attributionViewEmptyHeightConstraint setActive:0];
    [(NSLayoutConstraint *)v17->_stackViewBottomConstraint setActive:0];
    [(MKViewWithHairline *)v17->_hairlineView setHidden:0];
    [v36 addObject:v17->_attributionView];
  }
  [(MKIncidentDetailContentView *)v17 setAccessibilityElements:v36];
}

- (void)configureWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 image:(id)a6
{
  id v17 = a5;
  titleLabel = self->_titleLabel;
  id v11 = a6;
  id v12 = a4;
  [(_MKUILabel *)titleLabel setText:a3];
  [(_MKUILabel *)self->_subtitleLabel setText:v12];

  [(UIImageView *)self->_imageView setImage:v11];
  if ([v17 length])
  {
    [(UITextView *)self->_bodyTextView setText:v17];
    [(UIStackView *)self->_stackView addSubview:self->_bodyTextView];
    [(UIStackView *)self->_stackView addArrangedSubview:self->_bodyTextView];
  }
  else
  {
    double v13 = [(UIStackView *)self->_stackView arrangedSubviews];
    int v14 = [v13 containsObject:self->_bodyTextView];

    if (v14)
    {
      [(UIStackView *)self->_stackView removeArrangedSubview:self->_bodyTextView];
      [(UITextView *)self->_bodyTextView removeFromSuperview];
    }
  }
  v15 = [(MKIncidentDetailContentView *)self delegate];
  v16 = [v15 accessoryFooterView];

  [(MKIncidentDetailContentView *)self _updateAccessoryFooterView:v16];
}

- (void)_didTapActionButton
{
  id v3 = +[MKMapService sharedService];
  [v3 captureUserAction:381 onTarget:46 forAdvisoryItem:self->_advisoryItem];

  id v6 = [(MKIncidentDetailContentView *)self delegate];
  double v4 = [(GEOComposedRouteAdvisoryItem *)self->_advisoryItem cardAction];
  v5 = [v4 location];
  [v6 cellDidTapDownloadForLocation:v5];
}

- (void)_setConstraints
{
  v99[31] = *MEMORY[0x1E4F143B8];
  id v3 = [(UITextView *)self->_attributionView heightAnchor];
  double v4 = [v3 constraintEqualToConstant:0.0];
  attributionViewEmptyHeightConstraint = self->_attributionViewEmptyHeightConstraint;
  self->_attributionViewEmptyHeightConstraint = v4;

  id v6 = [(UIStackView *)self->_stackView bottomAnchor];
  id v7 = [(UIView *)self->_backgroundView bottomAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7 constant:-12.0];
  stackViewBottomConstraint = self->_stackViewBottomConstraint;
  self->_stackViewBottomConstraint = v8;

  v67 = (void *)MEMORY[0x1E4F28DC8];
  v98 = [(UIView *)self->_backgroundView topAnchor];
  v97 = [(MKIncidentDetailContentView *)self topAnchor];
  v96 = [v98 constraintEqualToAnchor:v97 constant:0.0];
  v99[0] = v96;
  v95 = [(UIView *)self->_backgroundView bottomAnchor];
  v94 = [(MKIncidentDetailContentView *)self bottomAnchor];
  v93 = [v95 constraintEqualToAnchor:v94 constant:-16.0];
  v99[1] = v93;
  v92 = [(UIView *)self->_backgroundView trailingAnchor];
  v91 = [(MKIncidentDetailContentView *)self trailingAnchor];
  v90 = [v92 constraintEqualToAnchor:v91 constant:-16.0];
  v99[2] = v90;
  v89 = [(UIView *)self->_backgroundView leadingAnchor];
  v88 = [(MKIncidentDetailContentView *)self leadingAnchor];
  v87 = [v89 constraintEqualToAnchor:v88 constant:16.0];
  v99[3] = v87;
  v86 = [(UIImageView *)self->_imageView widthAnchor];
  v85 = [v86 constraintEqualToConstant:35.0];
  v99[4] = v85;
  v84 = [(UIImageView *)self->_imageView heightAnchor];
  v83 = [v84 constraintEqualToConstant:35.0];
  v99[5] = v83;
  v82 = [(UIImageView *)self->_imageView leadingAnchor];
  v81 = [(UIView *)self->_backgroundView leadingAnchor];
  v80 = [v82 constraintEqualToAnchor:v81 constant:16.0];
  v99[6] = v80;
  v79 = [(UIImageView *)self->_imageView centerYAnchor];
  v78 = [(UIView *)self->_titleView centerYAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v99[7] = v77;
  v76 = [(UIImageView *)self->_imageView topAnchor];
  v75 = [(UIView *)self->_backgroundView topAnchor];
  v74 = [v76 constraintGreaterThanOrEqualToAnchor:v75 constant:12.0];
  v99[8] = v74;
  v73 = [(UIView *)self->_titleView topAnchor];
  v72 = [(UIView *)self->_backgroundView topAnchor];
  v71 = [v73 constraintGreaterThanOrEqualToAnchor:v72 constant:12.0];
  v99[9] = v71;
  v70 = [(UIView *)self->_titleView bottomAnchor];
  v69 = [(UIStackView *)self->_stackView topAnchor];
  v68 = [v70 constraintEqualToAnchor:v69 constant:-12.0];
  v99[10] = v68;
  v66 = [(UIView *)self->_titleView leadingAnchor];
  v65 = [(UIImageView *)self->_imageView trailingAnchor];
  v64 = [v66 constraintEqualToAnchor:v65 constant:10.0];
  v99[11] = v64;
  v63 = [(UIView *)self->_titleView trailingAnchor];
  v62 = [(UIView *)self->_backgroundView trailingAnchor];
  v61 = [v63 constraintEqualToAnchor:v62 constant:-16.0];
  v99[12] = v61;
  v60 = [(_MKUILabel *)self->_titleLabel leadingAnchor];
  v59 = [(UIView *)self->_titleView leadingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v99[13] = v58;
  v57 = [(_MKUILabel *)self->_titleLabel trailingAnchor];
  id v56 = [(UIView *)self->_titleView trailingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v99[14] = v55;
  v54 = [(_MKUILabel *)self->_titleLabel topAnchor];
  v53 = [(UIView *)self->_titleView topAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v99[15] = v52;
  v50 = [(_MKUILabel *)self->_titleLabel bottomAnchor];
  v49 = [(_MKUILabel *)self->_subtitleLabel topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v99[16] = v48;
  v47 = [(_MKUILabel *)self->_subtitleLabel leadingAnchor];
  v46 = [(_MKUILabel *)self->_titleLabel leadingAnchor];
  uint64_t v45 = [v47 constraintEqualToAnchor:v46];
  v99[17] = v45;
  v44 = [(_MKUILabel *)self->_subtitleLabel trailingAnchor];
  v43 = [(_MKUILabel *)self->_titleLabel trailingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v99[18] = v42;
  v41 = [(_MKUILabel *)self->_subtitleLabel bottomAnchor];
  v40 = [(UIView *)self->_titleView bottomAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v99[19] = v39;
  id v38 = [(UIStackView *)self->_stackView leadingAnchor];
  int v37 = [(UIImageView *)self->_imageView leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v99[20] = v36;
  uint64_t v35 = [(UIStackView *)self->_stackView trailingAnchor];
  id v34 = [(UIView *)self->_backgroundView trailingAnchor];
  id v33 = [v35 constraintEqualToAnchor:v34 constant:-16.0];
  uint64_t v10 = self->_stackViewBottomConstraint;
  v99[21] = v33;
  v99[22] = v10;
  v51 = [(MKViewWithHairline *)self->_hairlineView topAnchor];
  v32 = [(UIStackView *)self->_stackView bottomAnchor];
  v31 = [v51 constraintEqualToAnchor:v32 constant:12.0];
  v99[23] = v31;
  uint64_t v30 = [(MKViewWithHairline *)self->_hairlineView trailingAnchor];
  v29 = [(UIView *)self->_backgroundView trailingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v99[24] = v28;
  uint64_t v27 = [(MKViewWithHairline *)self->_hairlineView leadingAnchor];
  v26 = [(UIStackView *)self->_stackView leadingAnchor];
  id v25 = [v27 constraintEqualToAnchor:v26];
  v99[25] = v25;
  v24 = [(UITextView *)self->_attributionView topAnchor];
  v23 = [(MKViewWithHairline *)self->_hairlineView bottomAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:12.0];
  v99[26] = v22;
  id v11 = [(UITextView *)self->_attributionView bottomAnchor];
  id v12 = [(UIView *)self->_backgroundView bottomAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12 constant:-12.0];
  v99[27] = v13;
  int v14 = [(UITextView *)self->_attributionView trailingAnchor];
  v15 = [(UIView *)self->_backgroundView trailingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:-16.0];
  v99[28] = v16;
  id v17 = [(UITextView *)self->_attributionView leadingAnchor];
  v18 = [(UIImageView *)self->_imageView leadingAnchor];
  uint64_t v19 = [v17 constraintEqualToAnchor:v18];
  v20 = self->_attributionViewEmptyHeightConstraint;
  v99[29] = v19;
  v99[30] = v20;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:31];
  [v67 activateConstraints:v21];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  if (self->_advisoryItem)
  {
    uint64_t v10 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v10 userInterfaceIdiom] != 5)
    {
LABEL_5:

      goto LABEL_6;
    }
    advisoryItem = self->_advisoryItem;

    if (advisoryItem)
    {
      uint64_t v10 = +[MKMapService sharedService];
      [v10 captureUserAction:249 onTarget:46 forAdvisoryItem:self->_advisoryItem];
      goto LABEL_5;
    }
  }
LABEL_6:

  return 1;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 != 5)
  {
    double v13 = _MKLocalizedStringFromThisBundle(@"Open Link in Safari Action");
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__11;
    v24[4] = __Block_byref_object_dispose__11;
    int v14 = self;
    id v25 = v14;
    if (v14->_advisoryNoticeItem)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __79__MKIncidentDetailContentView_textView_primaryActionForTextItem_defaultAction___block_invoke;
      v23[3] = &unk_1E54BA3D8;
      v23[4] = v24;
      self = [MEMORY[0x1E4F426E8] actionWithTitle:v13 image:0 identifier:0 handler:v23];
    }
    else
    {
      v15 = v14;
      if (!v14->_advisoryItem)
      {
        char v18 = 1;
LABEL_7:
        _Block_object_dispose(v24, 8);

        if ((v18 & 1) == 0) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
      v16 = (void *)MEMORY[0x1E4F426E8];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __79__MKIncidentDetailContentView_textView_primaryActionForTextItem_defaultAction___block_invoke_2;
      v20[3] = &unk_1E54BA400;
      v22 = v24;
      id v21 = v9;
      self = [v16 actionWithTitle:v13 image:0 identifier:0 handler:v20];
      id v17 = +[MKMapService sharedService];
      [v17 captureUserAction:249 onTarget:46 forAdvisoryItem:v15->_advisoryItem];
    }
    char v18 = 0;
    goto LABEL_7;
  }
LABEL_8:
  self = (MKIncidentDetailContentView *)v10;
LABEL_9:

  return self;
}

void __79__MKIncidentDetailContentView_textView_primaryActionForTextItem_defaultAction___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 544) advisoryCard];
  id v2 = [v10 metadata];
  id v3 = [v2 formatArguments];
  double v4 = [v3 firstObject];
  v5 = [v4 urlData];

  if ([v5 hasUrl])
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) delegate];
      id v9 = [v5 url];
      [v8 openUrlForAdvisoryNotice:v9];
    }
  }
}

void __79__MKIncidentDetailContentView_textView_primaryActionForTextItem_defaultAction___block_invoke_2(uint64_t a1)
{
  id v11 = [*(id *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 536) attribution];
  if (v11
    && ([v11 formatTokens],
        id v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 count],
        v2,
        v3))
  {
    double v4 = [v11 formatTokens];
    v5 = [v4 firstObject];

    id v6 = [v5 urlValue];
    char v7 = [v6 url];
  }
  else
  {
    v5 = [*(id *)(a1 + 32) link];
    char v7 = [v5 absoluteString];
  }

  if (v7)
  {
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 552));
      [WeakRetained openUrlForAdvisoryNotice:v7];
    }
  }
}

- (void)_updateAccessoryFooterView:(id)a3
{
  v5 = (UIView *)a3;
  p_accessoryFooterView = &self->_accessoryFooterView;
  accessoryFooterView = self->_accessoryFooterView;
  id v8 = v5;
  if (accessoryFooterView != v5)
  {
    if (accessoryFooterView)
    {
      -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:");
      [(UIView *)*p_accessoryFooterView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_accessoryFooterView, a3);
    if (*p_accessoryFooterView) {
      -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:");
    }
  }
}

- (MKIncidentDetailDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKIncidentDetailDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_advisoryNoticeItem, 0);
  objc_storeStrong((id *)&self->_advisoryItem, 0);
  objc_storeStrong((id *)&self->_accessoryFooterView, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_subTitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_stackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_attributionViewEmptyHeightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_childrenStackViews, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end