@interface HKElectrocardiogramCardView
+ (double)_averageHeartRateBaselineToGraphTop;
+ (double)_averageHeartRateBaselineToSymptomBaseline;
+ (double)_graphBottomToCardBottom;
+ (double)_graphHeight;
+ (double)_headerBottomToAverageHeartRateBaseline;
+ (double)estimatedHeight;
+ (id)_accessibilityContentSizeCategory;
+ (id)_averageHeartRateSymptomsBoldFont;
+ (id)_averageHeartRateSymptomsFont;
+ (id)_averageHeartRateSymptomsFontForElectrocardiogram:(id)a3;
+ (id)_averageHeartRateSymptomsTextStyle;
- (BOOL)_isLayingOutForAccessibility;
- (BOOL)isOnboarding;
- (BOOL)isSampleInteractive;
- (HKDateCache)dateCache;
- (HKElectrocardiogram)sample;
- (HKElectrocardiogramCardView)initWithSample:(id)a3 dateCache:(id)a4 onboarding:(BOOL)a5 activeAlgorithmVersion:(int64_t)a6 isSampleInteractive:(BOOL)a7;
- (HKElectrocardiogramChartView)graphView;
- (HKRoundedHeaderView)headerView;
- (NSArray)largeTextConstraints;
- (NSArray)regularConstraints;
- (NSLayoutConstraint)averageHeartRateLabelFirstBaselineConstraint;
- (NSLayoutConstraint)averageHeartRateLabelWidthConstraint;
- (NSLayoutConstraint)graphTopConstraint;
- (NSLayoutConstraint)heartImageViewHeightConstraint;
- (NSLayoutConstraint)symptomsLabelFirstBaselineConstraint;
- (UIImageView)heartImageView;
- (UILabel)averageHeartRateLabel;
- (UILabel)symptomsLabel;
- (UIView)cellBackgroundView;
- (id)_cardBackgroundColor;
- (id)_cardHeaderColor;
- (id)_chevronColor;
- (id)_graphBackgroundColor;
- (int64_t)activeAlgorithmVersion;
- (void)_setUpGraph;
- (void)_setupConstraints;
- (void)_setupUI;
- (void)_updateForCurrentSizeCategory;
- (void)_updateGraphTopConstraint;
- (void)_updateTextConstraints;
- (void)dateCacheDidUpdate:(id)a3 onNotification:(id)a4;
- (void)dealloc;
- (void)setActiveAlgorithmVersion:(int64_t)a3;
- (void)setAverageHeartRateLabel:(id)a3;
- (void)setAverageHeartRateLabelFirstBaselineConstraint:(id)a3;
- (void)setAverageHeartRateLabelWidthConstraint:(id)a3;
- (void)setCellBackgroundView:(id)a3;
- (void)setDateCache:(id)a3;
- (void)setGraphTopConstraint:(id)a3;
- (void)setGraphView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setHeartImageView:(id)a3;
- (void)setHeartImageViewHeightConstraint:(id)a3;
- (void)setLargeTextConstraints:(id)a3;
- (void)setOnboarding:(BOOL)a3;
- (void)setRegularConstraints:(id)a3;
- (void)setSample:(id)a3;
- (void)setSymptomsLabel:(id)a3;
- (void)setSymptomsLabelFirstBaselineConstraint:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateUI;
@end

@implementation HKElectrocardiogramCardView

- (HKElectrocardiogramCardView)initWithSample:(id)a3 dateCache:(id)a4 onboarding:(BOOL)a5 activeAlgorithmVersion:(int64_t)a6 isSampleInteractive:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKElectrocardiogramCardView;
  v15 = -[HKElectrocardiogramCardView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sample, a3);
    objc_storeWeak((id *)&v16->_dateCache, v14);
    v16->_onboarding = a5;
    v16->_activeAlgorithmVersion = a6;
    v16->_isSampleInteractive = a7;
    [(HKElectrocardiogramCardView *)v16 _setupUI];
    [(HKElectrocardiogramCardView *)v16 _setupConstraints];
    [(HKElectrocardiogramCardView *)v16 updateUI];
    [(HKElectrocardiogramCardView *)v16 _setUpGraph];
  }

  return v16;
}

- (void)setActiveAlgorithmVersion:(int64_t)a3
{
  self->_activeAlgorithmVersion = a3;
  [(HKElectrocardiogramCardView *)self updateUI];
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
  [(HKElectrocardiogramCardView *)self updateUI];
  [(HKElectrocardiogramCardView *)self _setUpGraph];
}

+ (double)estimatedHeight
{
  +[HKRoundedHeaderView estimatedHeight];
  double v3 = v2;
  [(id)objc_opt_class() _headerBottomToAverageHeartRateBaseline];
  double v5 = v3 + v4;
  [(id)objc_opt_class() _averageHeartRateBaselineToGraphTop];
  double v7 = v5 + v6;
  [(id)objc_opt_class() _graphHeight];
  double v9 = v7 + v8;
  [(id)objc_opt_class() _graphBottomToCardBottom];
  return v9 + v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKElectrocardiogramCardView;
  [(HKElectrocardiogramCardView *)&v11 traitCollectionDidChange:v4];
  double v5 = [(HKElectrocardiogramCardView *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];
  int v8 = [v6 isEqualToString:v7];

  if (!v8
    || ([(HKElectrocardiogramCardView *)self traitCollection],
        double v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 hasDifferentColorAppearanceComparedToTraitCollection:v4],
        v9,
        v10))
  {
    [(HKElectrocardiogramCardView *)self updateUI];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)HKElectrocardiogramCardView;
  [(HKElectrocardiogramCardView *)&v3 tintColorDidChange];
  [(HKElectrocardiogramCardView *)self updateUI];
}

- (void)dealloc
{
  objc_super v3 = [(HKElectrocardiogramCardView *)self dateCache];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramCardView;
  [(HKElectrocardiogramCardView *)&v4 dealloc];
}

- (void)_setupUI
{
  v73[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4FB1618] clearColor];
  [(HKElectrocardiogramCardView *)self setBackgroundColor:v3];

  [(HKElectrocardiogramCardView *)self setClipsToBounds:1];
  objc_super v4 = [(HKElectrocardiogramCardView *)self layer];
  [v4 setCornerRadius:10.0];

  double v5 = [HKRoundedHeaderView alloc];
  double v6 = [(HKElectrocardiogramCardView *)self _cardHeaderColor];
  double v7 = [(HKRoundedHeaderView *)v5 initWithColor:v6 isInteractive:self->_isSampleInteractive];
  [(HKElectrocardiogramCardView *)self setHeaderView:v7];

  int v8 = [(HKElectrocardiogramCardView *)self headerView];
  [v8 setClipsToBounds:1];

  double v9 = [(HKElectrocardiogramCardView *)self headerView];
  [v9 setOpaque:1];

  int v10 = [(HKElectrocardiogramCardView *)self headerView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v11 = [NSString healthAccessibilityIdentifier:1 suffix:@"Card.Header"];
  v12 = [(HKElectrocardiogramCardView *)self headerView];
  [v12 setAccessibilityIdentifier:v11];

  id v13 = [(HKElectrocardiogramCardView *)self headerView];
  [(HKElectrocardiogramCardView *)self addSubview:v13];

  id v14 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(HKElectrocardiogramCardView *)self setCellBackgroundView:v14];

  v15 = [(HKElectrocardiogramCardView *)self _cardBackgroundColor];
  v16 = [(HKElectrocardiogramCardView *)self cellBackgroundView];
  [v16 setBackgroundColor:v15];

  v17 = [(HKElectrocardiogramCardView *)self cellBackgroundView];
  [v17 setClipsToBounds:1];

  objc_super v18 = [(HKElectrocardiogramCardView *)self cellBackgroundView];
  v19 = [v18 layer];
  [v19 setCornerRadius:10.0];

  v20 = [(HKElectrocardiogramCardView *)self cellBackgroundView];
  v21 = [v20 layer];
  [v21 setMaskedCorners:12];

  v22 = [(HKElectrocardiogramCardView *)self cellBackgroundView];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  v23 = [(HKElectrocardiogramCardView *)self cellBackgroundView];
  [(HKElectrocardiogramCardView *)self addSubview:v23];

  id v24 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  [(HKElectrocardiogramCardView *)self setHeartImageView:v24];

  v25 = (void *)MEMORY[0x1E4FB1830];
  v26 = [(id)objc_opt_class() _averageHeartRateSymptomsFont];
  v27 = [v25 configurationWithFont:v26];
  v28 = [(HKElectrocardiogramCardView *)self heartImageView];
  [v28 setPreferredSymbolConfiguration:v27];

  v29 = [MEMORY[0x1E4FB1818] systemImageNamed:@"heart.fill"];
  v30 = [(HKElectrocardiogramCardView *)self heartImageView];
  [v30 setImage:v29];

  v31 = [(HKElectrocardiogramCardView *)self heartImageView];
  [v31 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];

  v32 = [(HKElectrocardiogramCardView *)self heartImageView];
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

  v33 = +[HKDisplayCategory categoryWithID:11];
  v34 = [v33 color];
  v35 = [(HKElectrocardiogramCardView *)self heartImageView];
  [v35 setTintColor:v34];

  v36 = [(HKElectrocardiogramCardView *)self heartImageView];
  [(HKElectrocardiogramCardView *)self addSubview:v36];

  id v37 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKElectrocardiogramCardView *)self setAverageHeartRateLabel:v37];

  v38 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  [v38 setNumberOfLines:0];

  v39 = [(id)objc_opt_class() _averageHeartRateSymptomsFont];
  v40 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  [v40 setFont:v39];

  v41 = [MEMORY[0x1E4FB1618] systemGrayColor];
  v42 = [(HKElectrocardiogramCardView *)self _accessibilityHigherContrastTintColorForColor:v41];
  v43 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  [v43 setTextColor:v42];

  v44 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];

  v45 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  [v45 setAdjustsFontForContentSizeCategory:1];

  v46 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  [(HKElectrocardiogramCardView *)self addSubview:v46];

  id v47 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKElectrocardiogramCardView *)self setSymptomsLabel:v47];

  v48 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  [v48 setNumberOfLines:1];

  v49 = [(id)objc_opt_class() _averageHeartRateSymptomsFont];
  v50 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  [v50 setFont:v49];

  v51 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  [v51 setTranslatesAutoresizingMaskIntoConstraints:0];

  v52 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  [v52 setAdjustsFontForContentSizeCategory:1];

  v53 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  [(HKElectrocardiogramCardView *)self addSubview:v53];

  v54 = [HKElectrocardiogramGridOptions alloc];
  v55 = [MEMORY[0x1E4FB1618] systemGray3Color];
  v56 = [(HKElectrocardiogramGridOptions *)v54 initWithUnitMultiple:(uint64_t)(1.0 / 0.04) axis:2 lineColor:v55 lineWidth:HKUIFloorToScreenScale(0.5)];

  v57 = [HKElectrocardiogramChartView alloc];
  v73[0] = v56;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:1];
  v59 = -[HKElectrocardiogramChartView initWithGridSize:gridOptions:](v57, "initWithGridSize:gridOptions:", v58, 4.0, 4.0);
  [(HKElectrocardiogramCardView *)self setGraphView:v59];

  v60 = [v33 color];
  v61 = [(HKElectrocardiogramCardView *)self graphView];
  [v61 setTintColor:v60];

  v62 = [(HKElectrocardiogramCardView *)self graphView];
  [v62 setEdgeMaskEnabled:1];

  v63 = [(HKElectrocardiogramCardView *)self graphView];
  [v63 setTranslatesAutoresizingMaskIntoConstraints:0];

  v64 = [(HKElectrocardiogramCardView *)self graphView];
  v65 = [v64 layer];
  [v65 setCornerRadius:5.0];

  v66 = [(HKElectrocardiogramCardView *)self graphView];
  v67 = [v66 layer];
  [v67 setMasksToBounds:1];

  double v68 = HKUICeilToScreenScale(0.5);
  v69 = [(HKElectrocardiogramCardView *)self graphView];
  v70 = [v69 layer];
  [v70 setBorderWidth:v68];

  v71 = [(HKElectrocardiogramCardView *)self graphView];
  [(HKElectrocardiogramCardView *)self addSubview:v71];

  v72 = [(HKElectrocardiogramCardView *)self dateCache];
  [v72 registerObserver:self];
}

- (void)_setupConstraints
{
  objc_super v3 = [(HKElectrocardiogramCardView *)self headerView];
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:margin:", self, 0.0);

  objc_super v4 = [(HKElectrocardiogramCardView *)self headerView];
  double v5 = [v4 topAnchor];
  double v6 = [(HKElectrocardiogramCardView *)self topAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  int v8 = [(HKElectrocardiogramCardView *)self cellBackgroundView];
  double v9 = [(HKElectrocardiogramCardView *)self headerView];
  objc_msgSend(v8, "hk_alignHorizontalConstraintsWithView:margin:", v9, 0.0);

  int v10 = [(HKElectrocardiogramCardView *)self cellBackgroundView];
  objc_super v11 = [v10 topAnchor];
  v12 = [(HKElectrocardiogramCardView *)self headerView];
  id v13 = [v12 bottomAnchor];
  id v14 = [v11 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  v15 = [(HKElectrocardiogramCardView *)self cellBackgroundView];
  v16 = [v15 bottomAnchor];
  v17 = [(HKElectrocardiogramCardView *)self graphView];
  objc_super v18 = [v17 bottomAnchor];
  [(id)objc_opt_class() _graphBottomToCardBottom];
  v19 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18);
  [v19 setActive:1];

  v20 = [(HKElectrocardiogramCardView *)self heartImageView];
  v21 = [v20 leadingAnchor];
  v22 = [(HKElectrocardiogramCardView *)self headerView];
  v23 = [v22 leadingAnchor];
  id v24 = [(HKElectrocardiogramCardView *)self headerView];
  [v24 textHorizontalInset];
  v25 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23);
  [v25 setActive:1];

  v26 = [(HKElectrocardiogramCardView *)self heartImageView];
  v27 = [v26 centerYAnchor];
  v28 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  v29 = [v28 centerYAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [(HKElectrocardiogramCardView *)self heartImageView];
  v32 = [v31 heightAnchor];
  v33 = [(id)objc_opt_class() _averageHeartRateSymptomsFont];
  [v33 lineHeight];
  v34 = objc_msgSend(v32, "constraintEqualToConstant:");
  [(HKElectrocardiogramCardView *)self setHeartImageViewHeightConstraint:v34];

  v35 = [(HKElectrocardiogramCardView *)self heartImageViewHeightConstraint];
  [v35 setActive:1];

  v36 = [(HKElectrocardiogramCardView *)self heartImageView];
  id v37 = [v36 widthAnchor];
  v38 = [(HKElectrocardiogramCardView *)self heartImageView];
  v39 = [v38 heightAnchor];
  id v125 = [v37 constraintEqualToAnchor:v39];

  LODWORD(v40) = 1148846080;
  [v125 setPriority:v40];
  [v125 setActive:1];
  v41 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  v42 = [v41 leadingAnchor];
  v43 = [(HKElectrocardiogramCardView *)self heartImageView];
  v44 = [v43 trailingAnchor];
  v45 = [v42 constraintEqualToAnchor:v44 constant:6.0];
  [v45 setActive:1];

  v46 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  id v47 = [v46 firstBaselineAnchor];
  v48 = [(HKElectrocardiogramCardView *)self headerView];
  v49 = [v48 bottomAnchor];
  v50 = [v47 constraintEqualToAnchor:v49];
  [(HKElectrocardiogramCardView *)self setAverageHeartRateLabelFirstBaselineConstraint:v50];

  v51 = [(HKElectrocardiogramCardView *)self averageHeartRateLabelFirstBaselineConstraint];
  [v51 setActive:1];

  v52 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  v53 = [v52 widthAnchor];
  v54 = [(HKElectrocardiogramCardView *)self widthAnchor];
  v55 = [v53 constraintLessThanOrEqualToAnchor:v54 multiplier:0.34];
  [(HKElectrocardiogramCardView *)self setAverageHeartRateLabelWidthConstraint:v55];

  v56 = [(HKElectrocardiogramCardView *)self averageHeartRateLabelWidthConstraint];
  LODWORD(v57) = 1144750080;
  [v56 setPriority:v57];

  v58 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  LODWORD(v59) = 1148846080;
  [v58 setContentCompressionResistancePriority:0 forAxis:v59];

  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v61 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  v62 = [v61 leadingAnchor];
  v63 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  v64 = [v63 trailingAnchor];
  v65 = [v62 constraintGreaterThanOrEqualToAnchor:v64 constant:16.0];
  [v60 addObject:v65];

  v66 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  v67 = [v66 trailingAnchor];
  double v68 = [(HKElectrocardiogramCardView *)self headerView];
  v69 = [v68 trailingAnchor];
  v70 = [(HKElectrocardiogramCardView *)self headerView];
  [v70 textHorizontalInset];
  v72 = [v67 constraintEqualToAnchor:v69 constant:-v71];
  [v60 addObject:v72];

  v73 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  v74 = [v73 firstBaselineAnchor];
  v75 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  v76 = [v75 lastBaselineAnchor];
  v77 = [v74 constraintEqualToAnchor:v76];
  [v60 addObject:v77];

  v78 = (void *)[v60 copy];
  [(HKElectrocardiogramCardView *)self setRegularConstraints:v78];

  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v80 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  v81 = [v80 trailingAnchor];
  v82 = [(HKElectrocardiogramCardView *)self headerView];
  v83 = [v82 trailingAnchor];
  v84 = [(HKElectrocardiogramCardView *)self headerView];
  [v84 textHorizontalInset];
  v86 = [v81 constraintEqualToAnchor:v83 constant:-v85];
  [v79 addObject:v86];

  v87 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  v88 = [v87 leadingAnchor];
  v89 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  v90 = [v89 leadingAnchor];
  v91 = [v88 constraintEqualToAnchor:v90];
  [v79 addObject:v91];

  v92 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  v93 = [v92 trailingAnchor];
  v94 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  v95 = [v94 trailingAnchor];
  v96 = [v93 constraintEqualToAnchor:v95];
  [v79 addObject:v96];

  v97 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  v98 = [v97 firstBaselineAnchor];
  v99 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  v100 = [v99 lastBaselineAnchor];
  v101 = [v98 constraintEqualToAnchor:v100];
  [(HKElectrocardiogramCardView *)self setSymptomsLabelFirstBaselineConstraint:v101];

  v102 = [(HKElectrocardiogramCardView *)self symptomsLabelFirstBaselineConstraint];
  [v79 addObject:v102];

  v103 = (void *)[v79 copy];
  [(HKElectrocardiogramCardView *)self setLargeTextConstraints:v103];

  v104 = [(HKElectrocardiogramCardView *)self graphView];
  v105 = [v104 leftAnchor];
  v106 = [(HKElectrocardiogramCardView *)self headerView];
  v107 = [v106 leftAnchor];
  v108 = [(HKElectrocardiogramCardView *)self headerView];
  [v108 textHorizontalInset];
  v109 = objc_msgSend(v105, "constraintEqualToAnchor:constant:", v107);
  [v109 setActive:1];

  v110 = [(HKElectrocardiogramCardView *)self graphView];
  v111 = [v110 rightAnchor];
  v112 = [(HKElectrocardiogramCardView *)self headerView];
  v113 = [v112 rightAnchor];
  v114 = [(HKElectrocardiogramCardView *)self headerView];
  [v114 textHorizontalInset];
  v116 = [v111 constraintEqualToAnchor:v113 constant:-v115];
  [v116 setActive:1];

  v117 = [(HKElectrocardiogramCardView *)self graphView];
  v118 = [v117 heightAnchor];
  [(id)objc_opt_class() _graphHeight];
  v119 = objc_msgSend(v118, "constraintEqualToConstant:");

  LODWORD(v120) = 1144750080;
  [v119 setPriority:v120];
  [v119 setActive:1];
  v121 = [(HKElectrocardiogramCardView *)self bottomAnchor];
  v122 = [(HKElectrocardiogramCardView *)self cellBackgroundView];
  v123 = [v122 bottomAnchor];
  v124 = [v121 constraintEqualToAnchor:v123];
  [v124 setActive:1];

  [(HKElectrocardiogramCardView *)self _updateForCurrentSizeCategory];
}

- (void)_setUpGraph
{
  id v4 = [(HKElectrocardiogramCardView *)self graphView];
  objc_super v3 = [(HKElectrocardiogramCardView *)self sample];
  [v4 displayElectrocardiogram:v3 allowsScrolling:0];
}

- (void)updateUI
{
  objc_super v3 = [(HKElectrocardiogramCardView *)self sample];

  if (v3)
  {
    id v4 = [(HKElectrocardiogramCardView *)self sample];
    objc_msgSend(v4, "_localizedClassificationWithActiveAlgorithmVersion:", -[HKElectrocardiogramCardView activeAlgorithmVersion](self, "activeAlgorithmVersion"));
    double v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v5) {
      double v6 = v5;
    }
    else {
      double v6 = @" ";
    }
    double v7 = v5;
    int v8 = [(HKElectrocardiogramCardView *)self headerView];
    [v8 setText:v6];

    double v9 = [(HKElectrocardiogramCardView *)self _cardHeaderColor];
    int v10 = [(HKElectrocardiogramCardView *)self headerView];
    [v10 setColor:v9];

    objc_super v11 = [(HKElectrocardiogramCardView *)self sample];
    v12 = [v11 endDate];
    id v13 = [(HKElectrocardiogramCardView *)self dateCache];
    id v14 = HKLastUpdatedText(v12, v13);
    v15 = [(HKElectrocardiogramCardView *)self headerView];
    [v15 setDetailText:v14];

    v16 = [(HKElectrocardiogramCardView *)self sample];
    v17 = objc_msgSend(v16, "hk_classificationTextColor");
    objc_super v18 = [(HKElectrocardiogramCardView *)self headerView];
    [v18 setTextColor:v17];

    v19 = [(HKElectrocardiogramCardView *)self sample];
    v20 = objc_msgSend(v19, "hk_timeStampTextColor");
    v21 = [(HKElectrocardiogramCardView *)self _accessibilityHigherContrastTintColorForColor:v20];
    v22 = [(HKElectrocardiogramCardView *)self headerView];
    [v22 setDetailTextColor:v21];

    v23 = [(HKElectrocardiogramCardView *)self sample];
    id v24 = objc_msgSend(v23, "hk_timeStampCompositingFilter");
    v25 = [(HKElectrocardiogramCardView *)self headerView];
    [v25 setDetailTextCompositingFilter:v24];

    v26 = [(HKElectrocardiogramCardView *)self sample];
    v27 = objc_msgSend(v26, "hk_localizedAverageBPM");
    v28 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
    [v28 setText:v27];

    v29 = [(HKElectrocardiogramCardView *)self sample];
    v30 = objc_msgSend(v29, "hk_BPMTextColor");
    v31 = [(HKElectrocardiogramCardView *)self _accessibilityHigherContrastTintColorForColor:v30];
    v32 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
    [v32 setTextColor:v31];

    v33 = objc_opt_class();
    v34 = [(HKElectrocardiogramCardView *)self sample];
    v35 = [v33 _averageHeartRateSymptomsFontForElectrocardiogram:v34];
    v36 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
    [v36 setFont:v35];

    id v37 = [(HKElectrocardiogramCardView *)self sample];
    v38 = objc_msgSend(v37, "hk_localizedUppercaseNumSymptoms");
    v39 = [(HKElectrocardiogramCardView *)self symptomsLabel];
    [v39 setText:v38];

    double v40 = [(HKElectrocardiogramCardView *)self sample];
    v41 = objc_msgSend(v40, "hk_numSymptomsTextColor");
    v42 = [(HKElectrocardiogramCardView *)self _accessibilityHigherContrastTintColorForColor:v41];
    v43 = [(HKElectrocardiogramCardView *)self symptomsLabel];
    [v43 setTextColor:v42];
  }
  else
  {
    v44 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v45 = [v44 localizedStringForKey:@"ECG_CARD_LOADING_TEXT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Cinnamon"];
    v46 = HKConditionallyRedactedHeartRhythmString();

    double v7 = v46;
    id v47 = [(HKElectrocardiogramCardView *)self headerView];
    [v47 setText:v7];

    v48 = [(HKElectrocardiogramCardView *)self headerView];
    [v48 setDetailText:@" "];

    v49 = objc_msgSend(MEMORY[0x1E4F2AF88], "hk_defaultCardHeaderColor");
    v50 = [(HKElectrocardiogramCardView *)self headerView];
    [v50 setColor:v49];

    v51 = objc_msgSend(MEMORY[0x1E4F2AF88], "hk_defaultClassificationTextColor");
    v52 = [(HKElectrocardiogramCardView *)self _accessibilityHigherContrastTintColorForColor:v51];
    v53 = [(HKElectrocardiogramCardView *)self headerView];
    [v53 setTextColor:v52];

    v54 = objc_msgSend(MEMORY[0x1E4F2AF88], "hk_defaultTimeStampTextColor");
    v55 = [(HKElectrocardiogramCardView *)self _accessibilityHigherContrastTintColorForColor:v54];
    v56 = [(HKElectrocardiogramCardView *)self headerView];
    [v56 setDetailTextColor:v55];

    double v57 = objc_msgSend(MEMORY[0x1E4F2AF88], "hk_defaultTimeStampCompositingFilter");
    v58 = [(HKElectrocardiogramCardView *)self headerView];
    [v58 setDetailTextCompositingFilter:v57];

    double v59 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v60 = [v59 localizedStringForKey:@"NO_AVERAGE_BEATS_PER_MINUTE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Cinnamon"];
    v61 = HKConditionallyRedactedHeartRhythmString();
    v62 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
    [v62 setText:v61];

    v63 = objc_msgSend(MEMORY[0x1E4F2AF88], "hk_defaultBPMTextColor");
    v64 = [(HKElectrocardiogramCardView *)self _accessibilityHigherContrastTintColorForColor:v63];
    v65 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
    [v65 setTextColor:v64];

    v66 = [(id)objc_opt_class() _averageHeartRateSymptomsFont];
    v67 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
    [v67 setFont:v66];

    double v68 = [(HKElectrocardiogramCardView *)self symptomsLabel];
    [v68 setText:@" "];

    double v40 = objc_msgSend(MEMORY[0x1E4F2AF88], "hk_defaultNumSymptomsTextColor");
    v41 = [(HKElectrocardiogramCardView *)self _accessibilityHigherContrastTintColorForColor:v40];
    v42 = [(HKElectrocardiogramCardView *)self symptomsLabel];
    [v42 setTextColor:v41];
  }

  v69 = [NSString healthAccessibilityIdentifier:1 suffix:@"Card.AverageBPM"];
  v70 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  [v70 setAccessibilityIdentifier:v69];

  double v71 = [(HKElectrocardiogramCardView *)self _chevronColor];
  v72 = [(HKElectrocardiogramCardView *)self headerView];
  [v72 setChevronColor:v71];

  id v73 = [MEMORY[0x1E4FB1618] systemGray2Color];
  uint64_t v74 = [v73 CGColor];
  v75 = [(HKElectrocardiogramCardView *)self graphView];
  v76 = [v75 layer];
  [v76 setBorderColor:v74];

  v77 = [(HKElectrocardiogramCardView *)self _graphBackgroundColor];
  v78 = [(HKElectrocardiogramCardView *)self graphView];
  [v78 setBackgroundColor:v77];

  id v79 = [NSString healthAccessibilityIdentifier:1 suffix:@"Card"];
  if (v7) {
    v80 = v7;
  }
  else {
    v80 = @"UndeterminedType";
  }
  v92 = v80;
  v81 = [v79 stringByAppendingFormat:@".%@.SessionResult", v80];
  [(HKElectrocardiogramCardView *)self setAccessibilityIdentifier:v81];

  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v82 = [(HKElectrocardiogramCardView *)self layer];
    [v82 setMaskedCorners:15];

    objc_msgSend(MEMORY[0x1E4FB1618], "hk_electrocardiogramChartBorderColor");
    id v83 = objc_claimAutoreleasedReturnValue();
    uint64_t v84 = [v83 CGColor];
    double v85 = [(HKElectrocardiogramCardView *)self layer];
    [v85 setBorderColor:v84];

    double v86 = HKUICeilToScreenScale(0.5);
    v87 = [(HKElectrocardiogramCardView *)self layer];
    [v87 setBorderWidth:v86];

    v88 = [(HKElectrocardiogramCardView *)self layer];
    [v88 setCornerRadius:12.0];
  }
  else
  {
    v89 = [(HKElectrocardiogramCardView *)self cellBackgroundView];
    v90 = [v89 layer];
    [v90 setMaskedCorners:12];

    v91 = [(HKElectrocardiogramCardView *)self layer];
    [v91 setBorderColor:0];

    v88 = [(HKElectrocardiogramCardView *)self layer];
    [v88 setBorderWidth:0.0];
  }

  [(HKElectrocardiogramCardView *)self _updateForCurrentSizeCategory];
}

- (void)_updateTextConstraints
{
  BOOL v3 = [(HKElectrocardiogramCardView *)self _isLayingOutForAccessibility];
  id v4 = [(HKElectrocardiogramCardView *)self averageHeartRateLabelWidthConstraint];
  double v5 = v4;
  if (v3)
  {
    [v4 setActive:0];

    [(id)objc_opt_class() _averageHeartRateBaselineToSymptomBaseline];
    double v7 = v6;
    int v8 = [(HKElectrocardiogramCardView *)self symptomsLabelFirstBaselineConstraint];
    [v8 setConstant:v7];

    double v9 = [(HKElectrocardiogramCardView *)self symptomsLabel];
    int v10 = v9;
    uint64_t v11 = 0;
  }
  else
  {
    [v4 setActive:1];

    v12 = [(HKElectrocardiogramCardView *)self symptomsLabelFirstBaselineConstraint];
    [v12 setConstant:0.0];

    double v9 = [(HKElectrocardiogramCardView *)self symptomsLabel];
    int v10 = v9;
    uint64_t v11 = 1;
  }
  [v9 setNumberOfLines:v11];

  id v13 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  id v14 = [v13 text];
  v15 = objc_msgSend(v14, "hk_copyNonEmptyString");

  if (!v15)
  {
    v16 = [(HKElectrocardiogramCardView *)self averageHeartRateLabelWidthConstraint];
    [v16 setActive:0];
  }
  [(id)objc_opt_class() _headerBottomToAverageHeartRateBaseline];
  double v18 = v17;
  id v19 = [(HKElectrocardiogramCardView *)self averageHeartRateLabelFirstBaselineConstraint];
  [v19 setConstant:v18];
}

- (void)_updateGraphTopConstraint
{
  BOOL v3 = [(HKElectrocardiogramCardView *)self sample];
  id v4 = objc_msgSend(v3, "hk_localizedUppercaseNumSymptoms");
  double v5 = objc_msgSend(v4, "hk_copyNonEmptyString");

  double v6 = [(HKElectrocardiogramCardView *)self graphTopConstraint];

  if (v6)
  {
    double v7 = [(HKElectrocardiogramCardView *)self graphTopConstraint];
    [v7 setActive:0];

    [(HKElectrocardiogramCardView *)self setGraphTopConstraint:0];
  }
  if (v5) {
    [(HKElectrocardiogramCardView *)self symptomsLabel];
  }
  else {
  int v8 = [(HKElectrocardiogramCardView *)self averageHeartRateLabel];
  }
  id v20 = [v8 lastBaselineAnchor];

  [(id)objc_opt_class() _averageHeartRateBaselineToGraphTop];
  double v10 = v9;
  [(id)objc_opt_class() _graphBottomToCardBottom];
  double v12 = v11;
  id v13 = objc_opt_class();
  if (v10 >= v12) {
    [v13 _averageHeartRateBaselineToGraphTop];
  }
  else {
    [v13 _graphBottomToCardBottom];
  }
  double v15 = v14;
  v16 = [(HKElectrocardiogramCardView *)self graphView];
  double v17 = [v16 topAnchor];
  double v18 = [v17 constraintEqualToAnchor:v20 constant:v15];
  [(HKElectrocardiogramCardView *)self setGraphTopConstraint:v18];

  id v19 = [(HKElectrocardiogramCardView *)self graphTopConstraint];
  [v19 setActive:1];
}

- (void)_updateForCurrentSizeCategory
{
  [(HKElectrocardiogramCardView *)self _updateTextConstraints];
  [(HKElectrocardiogramCardView *)self _updateGraphTopConstraint];
  BOOL v3 = [(id)objc_opt_class() _accessibilityContentSizeCategory];
  int64_t v4 = [(UIView *)self hk_trailingTextAlignmentAtOrBelowSizeCategory:v3];
  double v5 = [(HKElectrocardiogramCardView *)self symptomsLabel];
  [v5 setTextAlignment:v4];

  BOOL v6 = [(HKElectrocardiogramCardView *)self _isLayingOutForAccessibility];
  double v7 = (void *)MEMORY[0x1E4F28DC8];
  if (v6)
  {
    int v8 = [(HKElectrocardiogramCardView *)self regularConstraints];
    [v7 deactivateConstraints:v8];

    double v9 = (void *)MEMORY[0x1E4F28DC8];
    [(HKElectrocardiogramCardView *)self largeTextConstraints];
  }
  else
  {
    double v10 = [(HKElectrocardiogramCardView *)self largeTextConstraints];
    [v7 deactivateConstraints:v10];

    double v9 = (void *)MEMORY[0x1E4F28DC8];
    [(HKElectrocardiogramCardView *)self regularConstraints];
  double v11 = };
  [v9 activateConstraints:v11];

  id v15 = [(id)objc_opt_class() _averageHeartRateSymptomsFont];
  [v15 lineHeight];
  double v13 = v12;
  double v14 = [(HKElectrocardiogramCardView *)self heartImageViewHeightConstraint];
  [v14 setConstant:v13];
}

+ (id)_accessibilityContentSizeCategory
{
  return (id)*MEMORY[0x1E4FB27C0];
}

- (BOOL)_isLayingOutForAccessibility
{
  BOOL v3 = [(id)objc_opt_class() _accessibilityContentSizeCategory];
  if (HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory(v3))
  {
    int64_t v4 = [(HKElectrocardiogramCardView *)self traitCollection];
    BOOL v5 = [v4 horizontalSizeClass] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)_averageHeartRateSymptomsTextStyle
{
  return (id)*MEMORY[0x1E4FB28F0];
}

+ (id)_averageHeartRateSymptomsFont
{
  double v2 = (void *)MEMORY[0x1E4FB08E0];
  BOOL v3 = [(id)objc_opt_class() _averageHeartRateSymptomsTextStyle];
  int64_t v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:", v3);

  return v4;
}

+ (id)_averageHeartRateSymptomsBoldFont
{
  double v2 = (void *)MEMORY[0x1E4FB08E0];
  BOOL v3 = [(id)objc_opt_class() _averageHeartRateSymptomsTextStyle];
  int64_t v4 = objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);

  return v4;
}

+ (id)_averageHeartRateSymptomsFontForElectrocardiogram:(id)a3
{
  int v3 = objc_msgSend(a3, "hk_isBPMTextBold");
  int64_t v4 = objc_opt_class();
  if (v3) {
    [v4 _averageHeartRateSymptomsBoldFont];
  }
  else {
  BOOL v5 = [v4 _averageHeartRateSymptomsFont];
  }
  return v5;
}

+ (double)_headerBottomToAverageHeartRateBaseline
{
  double v2 = [(id)objc_opt_class() _averageHeartRateSymptomsFont];
  [v2 _scaledValueForValue:24.0];
  double v4 = v3;

  return v4;
}

+ (double)_averageHeartRateBaselineToSymptomBaseline
{
  double v2 = [(id)objc_opt_class() _averageHeartRateSymptomsFont];
  [v2 _scaledValueForValue:20.0];
  double v4 = v3;

  return v4;
}

+ (double)_averageHeartRateBaselineToGraphTop
{
  double v2 = [(id)objc_opt_class() _averageHeartRateSymptomsFont];
  [v2 _scaledValueForValue:12.0];
  double v4 = v3;

  return v4;
}

+ (double)_graphHeight
{
  return 120.0;
}

+ (double)_graphBottomToCardBottom
{
  return 16.0;
}

- (void)dateCacheDidUpdate:(id)a3 onNotification:(id)a4
{
  id v9 = [(HKElectrocardiogramCardView *)self sample];
  BOOL v5 = [v9 endDate];
  BOOL v6 = [(HKElectrocardiogramCardView *)self dateCache];
  double v7 = HKLastUpdatedText(v5, v6);
  int v8 = [(HKElectrocardiogramCardView *)self headerView];
  [v8 setDetailText:v7];
}

- (id)_cardHeaderColor
{
  double v3 = [(HKElectrocardiogramCardView *)self sample];
  double v4 = objc_msgSend(v3, "hk_cardHeaderColor");
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F2AF88], "hk_abnormalCardHeaderColor");
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F2AF88], "hk_abnormalCardHeaderColor");
LABEL_5:
    int v8 = (void *)v7;
    goto LABEL_7;
  }
  if ([(HKElectrocardiogramCardView *)self isOnboarding])
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
    goto LABEL_5;
  }
  id v9 = [(HKElectrocardiogramCardView *)self sample];
  int v8 = objc_msgSend(v9, "hk_cardHeaderColor");

LABEL_7:
  return v8;
}

- (id)_chevronColor
{
  double v2 = [(HKElectrocardiogramCardView *)self sample];
  double v3 = objc_msgSend(v2, "hk_cardHeaderColor");
  double v4 = objc_msgSend(MEMORY[0x1E4F2AF88], "hk_abnormalCardHeaderColor");
  int v5 = [v3 isEqual:v4];

  if (v5) {
    [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
  }
  else {
  int v6 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  }
  return v6;
}

- (id)_cardBackgroundColor
{
  if ([(HKElectrocardiogramCardView *)self isOnboarding])
  {
    double v3 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  else
  {
    double v4 = [(HKElectrocardiogramCardView *)self sample];
    int v5 = objc_msgSend(v4, "hk_cardBackgroundColor");
    int v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F2AF88], "hk_defaultCardBackgroundColor");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v3 = v7;
  }
  return v3;
}

- (id)_graphBackgroundColor
{
  if ([(HKElectrocardiogramCardView *)self isOnboarding]) {
    [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  else {
  double v3 = [(HKElectrocardiogramCardView *)self _cardBackgroundColor];
  }
  return v3;
}

- (HKElectrocardiogram)sample
{
  return self->_sample;
}

- (HKDateCache)dateCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateCache);
  return (HKDateCache *)WeakRetained;
}

- (void)setDateCache:(id)a3
{
}

- (BOOL)isOnboarding
{
  return self->_onboarding;
}

- (void)setOnboarding:(BOOL)a3
{
  self->_onboarding = a3;
}

- (int64_t)activeAlgorithmVersion
{
  return self->_activeAlgorithmVersion;
}

- (BOOL)isSampleInteractive
{
  return self->_isSampleInteractive;
}

- (HKRoundedHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)cellBackgroundView
{
  return self->_cellBackgroundView;
}

- (void)setCellBackgroundView:(id)a3
{
}

- (UIImageView)heartImageView
{
  return self->_heartImageView;
}

- (void)setHeartImageView:(id)a3
{
}

- (UILabel)averageHeartRateLabel
{
  return self->_averageHeartRateLabel;
}

- (void)setAverageHeartRateLabel:(id)a3
{
}

- (UILabel)symptomsLabel
{
  return self->_symptomsLabel;
}

- (void)setSymptomsLabel:(id)a3
{
}

- (HKElectrocardiogramChartView)graphView
{
  return self->_graphView;
}

- (void)setGraphView:(id)a3
{
}

- (NSLayoutConstraint)averageHeartRateLabelFirstBaselineConstraint
{
  return self->_averageHeartRateLabelFirstBaselineConstraint;
}

- (void)setAverageHeartRateLabelFirstBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)averageHeartRateLabelWidthConstraint
{
  return self->_averageHeartRateLabelWidthConstraint;
}

- (void)setAverageHeartRateLabelWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)symptomsLabelFirstBaselineConstraint
{
  return self->_symptomsLabelFirstBaselineConstraint;
}

- (void)setSymptomsLabelFirstBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)graphTopConstraint
{
  return self->_graphTopConstraint;
}

- (void)setGraphTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)heartImageViewHeightConstraint
{
  return self->_heartImageViewHeightConstraint;
}

- (void)setHeartImageViewHeightConstraint:(id)a3
{
}

- (NSArray)regularConstraints
{
  return self->_regularConstraints;
}

- (void)setRegularConstraints:(id)a3
{
}

- (NSArray)largeTextConstraints
{
  return self->_largeTextConstraints;
}

- (void)setLargeTextConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_heartImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_graphTopConstraint, 0);
  objc_storeStrong((id *)&self->_symptomsLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_averageHeartRateLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_averageHeartRateLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_graphView, 0);
  objc_storeStrong((id *)&self->_symptomsLabel, 0);
  objc_storeStrong((id *)&self->_averageHeartRateLabel, 0);
  objc_storeStrong((id *)&self->_heartImageView, 0);
  objc_storeStrong((id *)&self->_cellBackgroundView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_dateCache);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end