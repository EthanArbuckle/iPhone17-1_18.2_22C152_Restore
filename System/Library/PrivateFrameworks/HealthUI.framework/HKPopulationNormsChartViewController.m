@interface HKPopulationNormsChartViewController
- (BOOL)shouldEmbedInScrollView;
- (HKPopulationNormsChartViewController)initWithDisplayType:(id)a3 healthStore:(id)a4;
- (HKPopulationNormsChartViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 shouldEmbedInScrollView:(BOOL)a5;
- (HKPopulationNormsClassificationCollectionView)classificationCollectionView;
- (HKPopulationNormsDescriptionView)classificationDescriptionView;
- (HKPopulationNormsGraphView)populationNormsGraphView;
- (HKPopulationNormsViewModelDataSource)viewModel;
- (NSLayoutConstraint)previousPopulationNormsGraphHeightConstraint;
- (NSString)baseIdentifier;
- (UILabel)attributionLabel;
- (UILabel)chartTitleLabel;
- (UILabel)classificationLevelsTitleLabel;
- (UISegmentedControl)biologicalSexSegmentedControl;
- (UIView)contentView;
- (id)_viewModelForDisplayType:(id)a3 healthStore:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_deselectClassificationCellAtIndexPath:(id)a3;
- (void)_refreshViewModelIfNecessary;
- (void)_selectClassificationCellAtIndexPath:(id)a3;
- (void)_setupFonts;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)segmentedControlDidChange:(id)a3;
- (void)setAttributionLabel:(id)a3;
- (void)setBaseIdentifier:(id)a3;
- (void)setBiologicalSexSegmentedControl:(id)a3;
- (void)setChartTitleLabel:(id)a3;
- (void)setClassificationCollectionView:(id)a3;
- (void)setClassificationDescriptionView:(id)a3;
- (void)setClassificationLevelsTitleLabel:(id)a3;
- (void)setPopulationNormsGraphView:(id)a3;
- (void)setPreviousPopulationNormsGraphHeightConstraint:(id)a3;
- (void)setViewModel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePopulationNormsGraphHeightWithTraitCollection:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKPopulationNormsChartViewController

- (HKPopulationNormsChartViewController)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  return [(HKPopulationNormsChartViewController *)self initWithDisplayType:a3 healthStore:a4 shouldEmbedInScrollView:1];
}

- (HKPopulationNormsChartViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 shouldEmbedInScrollView:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HKPopulationNormsChartViewController;
  v11 = [(HKPopulationNormsChartViewController *)&v20 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(HKPopulationNormsChartViewController *)v11 _viewModelForDisplayType:v9 healthStore:v10];
    viewModel = v12->_viewModel;
    v12->_viewModel = (HKPopulationNormsViewModelDataSource *)v13;

    v12->_shouldEmbedInScrollView = a5;
    v15 = v12->_viewModel;
    if (v15)
    {
      v16 = [(HKPopulationNormsViewModelDataSource *)v15 viewTitle];
      [(HKPopulationNormsChartViewController *)v12 setTitle:v16];

      v17 = [(HKPopulationNormsViewModelDataSource *)v12->_viewModel hk_UIAutomationIdentifier];
      v18 = [@"UIA.Health" stringByAppendingFormat:@".PopulationNorms.%@", v17];
      [(HKPopulationNormsChartViewController *)v12 setBaseIdentifier:v18];
    }
    else
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:v12 file:@"HKPopulationNormsChartViewController.m" lineNumber:67 description:@"Initialized population norms chart with an unsupported display type."];
    }
  }
  return v12;
}

- (void)loadView
{
  v115[9] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(HKPopulationNormsChartViewController *)self setView:v3];

  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
  v5 = [(HKPopulationNormsChartViewController *)self view];
  [v5 setBackgroundColor:v4];

  if (self->_shouldEmbedInScrollView) {
    double v6 = 16.0;
  }
  else {
    double v6 = 0.0;
  }
  v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  contentView = self->_contentView;
  self->_contentView = v7;

  [(UIView *)self->_contentView setHidden:1];
  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentView setAccessibilityIdentifier:self->_baseIdentifier];
  id v9 = objc_alloc(MEMORY[0x1E4FB1C10]);
  id v10 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel localizedBiologicalSexTitles];
  v11 = (UISegmentedControl *)[v9 initWithItems:v10];
  biologicalSexSegmentedControl = self->_biologicalSexSegmentedControl;
  self->_biologicalSexSegmentedControl = v11;

  [(UISegmentedControl *)self->_biologicalSexSegmentedControl addTarget:self action:sel_segmentedControlDidChange_ forControlEvents:4096];
  uint64_t v13 = [(NSString *)self->_baseIdentifier stringByAppendingString:@".BiologicalSex"];
  [(UISegmentedControl *)self->_biologicalSexSegmentedControl setAccessibilityIdentifier:v13];

  [(UIView *)self->_contentView addSubview:self->_biologicalSexSegmentedControl];
  [(UISegmentedControl *)self->_biologicalSexSegmentedControl hk_constrainToSuperviewAlongEdges:&unk_1F3C1FC18 constant:12.0];
  [(UISegmentedControl *)self->_biologicalSexSegmentedControl hk_constrainToSuperviewAlongEdges:&unk_1F3C1FC30 constant:v6];
  [(HKPopulationNormsViewModelDataSource *)self->_viewModel maximumSampleValueQuantity];
  double v15 = v14;
  [(HKPopulationNormsViewModelDataSource *)self->_viewModel minimumSampleValueQuantity];
  double v17 = v16;
  v18 = [HKPopulationNormsGraphView alloc];
  v19 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel quantityUnitTitle];
  objc_super v20 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel ageBucketsTitle];
  v21 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel seriesHighlightedSegmentColor];
  v22 = [(HKPopulationNormsGraphView *)v18 initWithMaxYValue:v19 minYValue:v20 YSeriesTitle:v21 XSeriesTitle:v15 highlightedSegmentColor:v17];
  populationNormsGraphView = self->_populationNormsGraphView;
  self->_populationNormsGraphView = v22;

  [(UIView *)self->_contentView addSubview:self->_populationNormsGraphView];
  [(UIView *)self->_populationNormsGraphView hk_constrainToView:self->_biologicalSexSegmentedControl fromEdge:3 toEdge:4 constant:8.0];
  [(UIView *)self->_populationNormsGraphView hk_constrainToSuperviewAlongEdges:&unk_1F3C1FC48 constant:v6];
  v24 = [(HKPopulationNormsChartViewController *)self traitCollection];
  [(HKPopulationNormsChartViewController *)self updatePopulationNormsGraphHeightWithTraitCollection:v24];

  v25 = [(NSString *)self->_baseIdentifier stringByAppendingString:@".Chart"];
  [(HKPopulationNormsGraphView *)self->_populationNormsGraphView setAccessibilityIdentifier:v25];

  v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  classificationLevelsTitleLabel = self->_classificationLevelsTitleLabel;
  self->_classificationLevelsTitleLabel = v26;

  [(UILabel *)self->_classificationLevelsTitleLabel setNumberOfLines:0];
  v28 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel levelsTitle];
  [(UILabel *)self->_classificationLevelsTitleLabel setText:v28];

  [(UIView *)self->_contentView addSubview:self->_classificationLevelsTitleLabel];
  [(UILabel *)self->_classificationLevelsTitleLabel hk_constrainToView:self->_populationNormsGraphView fromEdge:3 toEdge:4 constant:11.0];
  [(UILabel *)self->_classificationLevelsTitleLabel hk_constrainToSuperviewAlongEdges:&unk_1F3C1FC60 constant:v6];
  v29 = objc_alloc_init(HKPopulationNormsClassificationCollectionViewLayout);
  v30 = [HKPopulationNormsClassificationCollectionView alloc];
  double v31 = *MEMORY[0x1E4F1DB28];
  double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v113 = v29;
  v35 = -[HKPopulationNormsClassificationCollectionView initWithFrame:collectionViewLayout:](v30, "initWithFrame:collectionViewLayout:", v29, *MEMORY[0x1E4F1DB28], v32, v33, v34);
  classificationCollectionView = self->_classificationCollectionView;
  self->_classificationCollectionView = v35;

  [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"HKPopulationNormsClassificationCollectionViewCell"];
  [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView setShowsHorizontalScrollIndicator:0];
  [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView setDataSource:self];
  [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView setDelegate:self];
  v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v31, v32, v33, v34);
  [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView setBackgroundView:v37];

  v38 = [(HKPopulationNormsChartViewController *)self view];
  v39 = [v38 backgroundColor];
  v40 = [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView backgroundView];
  [v40 setBackgroundColor:v39];

  [(UIView *)self->_contentView addSubview:self->_classificationCollectionView];
  [(UIView *)self->_classificationCollectionView hk_constrainToView:self->_classificationLevelsTitleLabel fromEdge:3 toEdge:4 constant:11.0];
  [(UIView *)self->_classificationCollectionView hk_constrainToSuperviewAlongEdges:&unk_1F3C1FC78 constant:0.0];
  v41 = [(NSString *)self->_baseIdentifier stringByAppendingString:@".Classification"];
  [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView setAccessibilityIdentifier:v41];

  v42 = objc_alloc_init(HKPopulationNormsDescriptionView);
  classificationDescriptionView = self->_classificationDescriptionView;
  self->_classificationDescriptionView = v42;

  [(HKPopulationNormsDescriptionView *)self->_classificationDescriptionView setUserInteractionEnabled:0];
  [(HKPopulationNormsDescriptionView *)self->_classificationDescriptionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_contentView addSubview:self->_classificationDescriptionView];
  [(UIView *)self->_classificationDescriptionView hk_constrainToView:self->_classificationCollectionView fromEdge:3 toEdge:4 constant:11.0];
  [(UIView *)self->_classificationDescriptionView hk_constrainToSuperviewAlongEdges:&unk_1F3C1FC90 constant:v6];
  v44 = [(NSString *)self->_baseIdentifier stringByAppendingString:@".Classification.Description"];
  [(HKPopulationNormsDescriptionView *)self->_classificationDescriptionView setAccessibilityIdentifier:v44];

  v45 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  attributionLabel = self->_attributionLabel;
  self->_attributionLabel = v45;

  [(UILabel *)self->_attributionLabel setNumberOfLines:0];
  v47 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel footerText];
  [(UILabel *)self->_attributionLabel setText:v47];

  v48 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_attributionLabel setTextColor:v48];

  [(UIView *)self->_contentView addSubview:self->_attributionLabel];
  [(UILabel *)self->_attributionLabel hk_constrainToView:self->_classificationDescriptionView fromEdge:3 toEdge:4 constant:6.0];
  [(UILabel *)self->_attributionLabel hk_constrainToSuperviewAlongEdges:&unk_1F3C1FCA8 constant:v6];
  [(UILabel *)self->_attributionLabel hk_constrainToSuperviewAlongEdges:&unk_1F3C1FCC0 constant:11.0];
  v49 = [(NSString *)self->_baseIdentifier stringByAppendingString:@".Attribution"];
  [(UILabel *)self->_attributionLabel setAccessibilityIdentifier:v49];

  [(HKPopulationNormsChartViewController *)self _setupFonts];
  if (self->_shouldEmbedInScrollView)
  {
    id v50 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    [v50 setTranslatesAutoresizingMaskIntoConstraints:0];
    v51 = [(HKPopulationNormsChartViewController *)self view];
    [v51 addSubview:v50];

    [v50 addSubview:self->_contentView];
    v99 = (void *)MEMORY[0x1E4F28DC8];
    v102 = [v50 frameLayoutGuide];
    v96 = [v102 topAnchor];
    v100 = [(HKPopulationNormsChartViewController *)self view];
    uint64_t v101 = [v100 topAnchor];
    uint64_t v97 = [v96 constraintEqualToAnchor:v101];
    v115[0] = v97;
    v98 = [v50 frameLayoutGuide];
    v52 = [v98 leadingAnchor];
    v111 = [(HKPopulationNormsChartViewController *)self view];
    [v111 leadingAnchor];
    v110 = v112 = v52;
    v109 = objc_msgSend(v52, "constraintEqualToAnchor:");
    v115[1] = v109;
    v93 = [v50 frameLayoutGuide];
    v53 = [v93 trailingAnchor];
    v87 = [(HKPopulationNormsChartViewController *)self view];
    uint64_t v88 = [v87 trailingAnchor];
    v108 = v53;
    v107 = [v53 constraintEqualToAnchor:v88];
    v115[2] = v107;
    v106 = [v50 frameLayoutGuide];
    v54 = [v106 bottomAnchor];
    v103 = [(HKPopulationNormsChartViewController *)self view];
    v95 = [v103 bottomAnchor];
    v105 = v54;
    v94 = [v54 constraintEqualToAnchor:v95];
    v115[3] = v94;
    v92 = [v50 contentLayoutGuide];
    v91 = [v92 topAnchor];
    v90 = [(UIView *)self->_contentView topAnchor];
    v89 = [v91 constraintEqualToAnchor:v90];
    v115[4] = v89;
    v86 = [v50 contentLayoutGuide];
    v85 = [v86 leadingAnchor];
    v84 = [(UIView *)self->_contentView leadingAnchor];
    v83 = [v85 constraintEqualToAnchor:v84];
    v115[5] = v83;
    v82 = [v50 contentLayoutGuide];
    v81 = [v82 trailingAnchor];
    v80 = [(UIView *)self->_contentView trailingAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v115[6] = v79;
    v55 = [v50 contentLayoutGuide];
    v56 = [v55 bottomAnchor];
    v57 = [(UIView *)self->_contentView bottomAnchor];
    v58 = [v56 constraintEqualToAnchor:v57];
    v115[7] = v58;
    v59 = [v50 frameLayoutGuide];
    v60 = [v59 widthAnchor];
    v61 = [(UIView *)self->_contentView widthAnchor];
    v62 = [v60 constraintEqualToAnchor:v61];
    v115[8] = v62;
    v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:9];
    [v99 activateConstraints:v63];

    v64 = v87;
    v65 = v96;

    v66 = (void *)v88;
    v67 = (void *)v97;

    v68 = v102;
    v69 = v100;

    v70 = v93;
    v71 = (void *)v101;

    v72 = v98;
  }
  else
  {
    v73 = [(HKPopulationNormsChartViewController *)self view];
    [v73 addSubview:self->_contentView];

    v104 = (void *)MEMORY[0x1E4F28DC8];
    id v50 = [(UIView *)self->_contentView topAnchor];
    v68 = [(HKPopulationNormsChartViewController *)self view];
    v65 = [v68 topAnchor];
    v69 = [v50 constraintEqualToAnchor:v65];
    v114[0] = v69;
    v71 = [(UIView *)self->_contentView leadingAnchor];
    v67 = [(HKPopulationNormsChartViewController *)self view];
    v72 = [v67 safeAreaLayoutGuide];
    v112 = [v72 leadingAnchor];
    v111 = objc_msgSend(v71, "constraintEqualToAnchor:");
    v114[1] = v111;
    uint64_t v74 = [(UIView *)self->_contentView trailingAnchor];
    v109 = [(HKPopulationNormsChartViewController *)self view];
    uint64_t v75 = [v109 trailingAnchor];
    v110 = (void *)v74;
    v76 = (void *)v74;
    v70 = (void *)v75;
    v108 = [v76 constraintEqualToAnchor:v75];
    v114[2] = v108;
    v64 = [(UIView *)self->_contentView bottomAnchor];
    v66 = [(HKPopulationNormsChartViewController *)self view];
    v107 = [v66 safeAreaLayoutGuide];
    v106 = [v107 bottomAnchor];
    v105 = objc_msgSend(v64, "constraintEqualToAnchor:");
    v114[3] = v105;
    uint64_t v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:4];
    v78 = v104;
    v103 = (void *)v77;
    objc_msgSend(v78, "activateConstraints:");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKPopulationNormsChartViewController;
  [(HKPopulationNormsChartViewController *)&v4 viewWillAppear:a3];
  [(HKPopulationNormsChartViewController *)self _refreshViewModelIfNecessary];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKPopulationNormsChartViewController;
  [(HKPopulationNormsChartViewController *)&v4 viewDidDisappear:a3];
  [(HKPopulationNormsViewModelDataSource *)self->_viewModel clearUserCharacteristicCache];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKPopulationNormsChartViewController;
  [(HKPopulationNormsChartViewController *)&v13 traitCollectionDidChange:v4];
  if (v4)
  {
    v5 = [(HKPopulationNormsChartViewController *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKPopulationNormsChartViewController *)self _setupFonts];
    }
    id v9 = [(HKPopulationNormsChartViewController *)self traitCollection];

    if (v9 != v4)
    {
      id v10 = [(HKPopulationNormsChartViewController *)self traitCollection];
      [(HKPopulationNormsChartViewController *)self updatePopulationNormsGraphHeightWithTraitCollection:v10];
    }
  }
  v11 = [(HKPopulationNormsChartViewController *)self traitCollection];
  int v12 = [v11 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v12) {
    [(HKPopulationNormsChartViewController *)self _refreshViewModelIfNecessary];
  }
}

- (void)updatePopulationNormsGraphHeightWithTraitCollection:(id)a3
{
  id v12 = a3;
  previousPopulationNormsGraphHeightConstraint = self->_previousPopulationNormsGraphHeightConstraint;
  if (previousPopulationNormsGraphHeightConstraint) {
    [(NSLayoutConstraint *)previousPopulationNormsGraphHeightConstraint setActive:0];
  }
  unint64_t v5 = [v12 horizontalSizeClass];
  if (v5 >= 2)
  {
    if (v5 != 2) {
      goto LABEL_8;
    }
    char v8 = [(HKPopulationNormsChartViewController *)self view];
    [v8 frame];
    double v10 = v9 * 0.5;

    double v6 = [(HKPopulationNormsGraphView *)self->_populationNormsGraphView heightAnchor];
    objc_msgSend(v6, "constraintEqualToConstant:", fmax(v10, 400.0));
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v6 = [(HKPopulationNormsGraphView *)self->_populationNormsGraphView heightAnchor];
    v7 = [v6 constraintLessThanOrEqualToConstant:400.0];
  }
  v11 = self->_previousPopulationNormsGraphHeightConstraint;
  self->_previousPopulationNormsGraphHeightConstraint = v7;

  [(NSLayoutConstraint *)self->_previousPopulationNormsGraphHeightConstraint setActive:1];
LABEL_8:
}

- (void)_refreshViewModelIfNecessary
{
  id v3 = [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView indexPathsForSelectedItems];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView indexPathsForSelectedItems];
    double v6 = [v5 firstObject];
  }
  else
  {
    double v6 = 0;
  }
  viewModel = self->_viewModel;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HKPopulationNormsChartViewController__refreshViewModelIfNecessary__block_invoke;
  v9[3] = &unk_1E6D513B0;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  [(HKPopulationNormsViewModelDataSource *)viewModel prepareUserCharacteristicCacheWithHandler:v9];
}

void __68__HKPopulationNormsChartViewController__refreshViewModelIfNecessary__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_deselectClassificationCellAtIndexPath:");
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1008), "setSelectedSegmentIndex:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 992), "currentBiologicalSexSegmentIndex"));
  objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 992), "currentClassificationIndex"), 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) collectionView:*(void *)(*(void *)(a1 + 40) + 1032) didSelectItemAtIndexPath:v6];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 1016);
  uint64_t v4 = [*(id *)(v2 + 992) userAgeBucketIndex];
  unint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 992) userLatestSampleValue];
  [v3 updateWithUserAgeBucketIndex:v4 userLatestSampleValue:v5];

  [*(id *)(*(void *)(a1 + 40) + 984) setHidden:0];
}

- (void)_setupFonts
{
  id v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:maximumContentSizeCategory:", *MEMORY[0x1E4FB2990], 32770, *MEMORY[0x1E4FB2798]);
  [(UILabel *)self->_classificationLevelsTitleLabel setFont:v3];

  id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [(UILabel *)self->_attributionLabel setFont:v4];
}

- (id)_viewModelForDisplayType:(id)a3 healthStore:(id)a4
{
  id v5 = a4;
  id v6 = [a3 objectType];
  v7 = [v6 identifier];
  id v8 = (void *)*MEMORY[0x1E4F2A918];

  if (v7 == v8) {
    double v9 = [(HKPopulationNormsAbstractViewModel *)[HKCardioFitnessPopulationNormsViewModel alloc] initWithHealthStore:v5];
  }
  else {
    double v9 = 0;
  }

  return v9;
}

- (void)segmentedControlDidChange:(id)a3
{
  -[HKPopulationNormsViewModelDataSource setBiologicalSexSegmentIndex:](self->_viewModel, "setBiologicalSexSegmentIndex:", [a3 selectedSegmentIndex]);
  populationNormsGraphView = self->_populationNormsGraphView;
  id v5 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel currentDataForBiologicalSex];
  [(HKPopulationNormsGraphView *)populationNormsGraphView updateWithFlattenedLevelsByAgeBucket:v5 currentClassificationIndex:[(HKPopulationNormsViewModelDataSource *)self->_viewModel currentClassificationIndex]];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(HKPopulationNormsViewModelDataSource *)self->_viewModel numberOfClassifications];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"HKPopulationNormsClassificationCollectionViewCell" forIndexPath:v6];
  id v8 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel seriesHighlightedColor];
  [v7 setHighlightColor:v8];

  if ([(HKPopulationNormsViewModelDataSource *)self->_viewModel isCurrentClassificationAvailable])
  {
    uint64_t v9 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel currentClassificationIndex];
    BOOL v10 = v9 == [v6 row];
  }
  else
  {
    BOOL v10 = 0;
  }
  v11 = -[HKPopulationNormsViewModelDataSource localizedClassificationTitleForIndex:](self->_viewModel, "localizedClassificationTitleForIndex:", [v6 row]);
  id v12 = -[HKPopulationNormsViewModelDataSource classificationIdentifierForIndex:](self->_viewModel, "classificationIdentifierForIndex:", [v6 row]);
  [v7 setTitle:v11 classificationIdentifier:v12 highlighted:v10];

  return v7;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v4 = [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView cellForItemAtIndexPath:a4];
  if (v4)
  {
    id v5 = v4;
    [v4 setSoftHighlightState:1];
    id v4 = v5;
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v4 = [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView cellForItemAtIndexPath:a4];
  if (v4)
  {
    id v5 = v4;
    [v4 setSoftHighlightState:0];
    id v4 = v5;
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28D58];
  viewModel = self->_viewModel;
  id v7 = a4;
  objc_msgSend(v5, "indexPathForRow:inSection:", -[HKPopulationNormsViewModelDataSource currentClassificationIndex](viewModel, "currentClassificationIndex"), 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(HKPopulationNormsChartViewController *)self _deselectClassificationCellAtIndexPath:v8];
  -[HKPopulationNormsViewModelDataSource setClassificationIndex:](self->_viewModel, "setClassificationIndex:", [v7 row]);
  [(HKPopulationNormsChartViewController *)self _selectClassificationCellAtIndexPath:v7];
}

- (void)_deselectClassificationCellAtIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = -[HKPopulationNormsClassificationCollectionView cellForItemAtIndexPath:](self->_classificationCollectionView, "cellForItemAtIndexPath:");
  if (v4)
  {
    id v5 = -[HKPopulationNormsViewModelDataSource localizedClassificationTitleForIndex:](self->_viewModel, "localizedClassificationTitleForIndex:", [v7 item]);
    id v6 = -[HKPopulationNormsViewModelDataSource classificationIdentifierForIndex:](self->_viewModel, "classificationIdentifierForIndex:", [v7 item]);
    [v4 setTitle:v5 classificationIdentifier:v6 highlighted:0];

    [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView deselectItemAtIndexPath:v7 animated:1];
  }
}

- (void)_selectClassificationCellAtIndexPath:(id)a3
{
  id v13 = a3;
  populationNormsGraphView = self->_populationNormsGraphView;
  id v5 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel currentDataForBiologicalSex];
  [(HKPopulationNormsGraphView *)populationNormsGraphView updateWithFlattenedLevelsByAgeBucket:v5 currentClassificationIndex:[(HKPopulationNormsViewModelDataSource *)self->_viewModel currentClassificationIndex]];

  id v6 = [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView cellForItemAtIndexPath:v13];
  if (v6)
  {
    id v7 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel currentLocalizedClassificationTitle];
    id v8 = -[HKPopulationNormsViewModelDataSource classificationIdentifierForIndex:](self->_viewModel, "classificationIdentifierForIndex:", [v13 item]);
    [v6 setTitle:v7 classificationIdentifier:v8 highlighted:1];
  }
  [(HKPopulationNormsClassificationCollectionView *)self->_classificationCollectionView scrollToItemAtIndexPath:v13 atScrollPosition:16 animated:[(UIView *)self->_contentView isHidden] ^ 1];
  classificationDescriptionView = self->_classificationDescriptionView;
  int v10 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel shouldShowClassificationTitle];
  if (v10)
  {
    v11 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel currentLocalizedClassificationName];
  }
  else
  {
    v11 = 0;
  }
  id v12 = [(HKPopulationNormsViewModelDataSource *)self->_viewModel currentLocalizedClassificationDescription];
  [(HKPopulationNormsDescriptionView *)classificationDescriptionView updateWithTitle:v11 description:v12];

  if (v10) {
}
  }

- (UIView)contentView
{
  return self->_contentView;
}

- (HKPopulationNormsViewModelDataSource)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (UILabel)chartTitleLabel
{
  return self->_chartTitleLabel;
}

- (void)setChartTitleLabel:(id)a3
{
}

- (UISegmentedControl)biologicalSexSegmentedControl
{
  return self->_biologicalSexSegmentedControl;
}

- (void)setBiologicalSexSegmentedControl:(id)a3
{
}

- (HKPopulationNormsGraphView)populationNormsGraphView
{
  return self->_populationNormsGraphView;
}

- (void)setPopulationNormsGraphView:(id)a3
{
}

- (UILabel)classificationLevelsTitleLabel
{
  return self->_classificationLevelsTitleLabel;
}

- (void)setClassificationLevelsTitleLabel:(id)a3
{
}

- (HKPopulationNormsClassificationCollectionView)classificationCollectionView
{
  return self->_classificationCollectionView;
}

- (void)setClassificationCollectionView:(id)a3
{
}

- (HKPopulationNormsDescriptionView)classificationDescriptionView
{
  return self->_classificationDescriptionView;
}

- (void)setClassificationDescriptionView:(id)a3
{
}

- (UILabel)attributionLabel
{
  return self->_attributionLabel;
}

- (void)setAttributionLabel:(id)a3
{
}

- (NSLayoutConstraint)previousPopulationNormsGraphHeightConstraint
{
  return self->_previousPopulationNormsGraphHeightConstraint;
}

- (void)setPreviousPopulationNormsGraphHeightConstraint:(id)a3
{
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (void)setBaseIdentifier:(id)a3
{
}

- (BOOL)shouldEmbedInScrollView
{
  return self->_shouldEmbedInScrollView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
  objc_storeStrong((id *)&self->_previousPopulationNormsGraphHeightConstraint, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_classificationDescriptionView, 0);
  objc_storeStrong((id *)&self->_classificationCollectionView, 0);
  objc_storeStrong((id *)&self->_classificationLevelsTitleLabel, 0);
  objc_storeStrong((id *)&self->_populationNormsGraphView, 0);
  objc_storeStrong((id *)&self->_biologicalSexSegmentedControl, 0);
  objc_storeStrong((id *)&self->_chartTitleLabel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end