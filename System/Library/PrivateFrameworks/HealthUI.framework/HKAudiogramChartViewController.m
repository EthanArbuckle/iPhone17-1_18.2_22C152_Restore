@interface HKAudiogramChartViewController
+ (BOOL)testChartPointCreation:(id)a3 leftEarSeries:(BOOL)a4 expectedChartPoints:(id)a5 failureMessage:(id *)a6;
+ (id)_baseIdentifierForClassification:(unint64_t)a3;
+ (id)_itemForHearingLossInfographicWithHearingLossClassification:(unint64_t)a3;
+ (id)_itemForTitle:(id)a3 description:(id)a4 baseIdentifier:(id)a5;
+ (id)_localizedDescriptionForClassification:(unint64_t)a3;
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
+ (id)hearingLossInfographicViewController;
- (BOOL)_hasAudiogramData;
- (BOOL)audiogramsFetched;
- (BOOL)shouldScrollToSample:(id)a3;
- (HKAudiogramAnnotationViewDataSource)annotationViewDataSource;
- (HKAudiogramChartViewController)initWithApplicationItems:(id)a3 factorDisplayTypes:(id)a4 chartHeight:(double)a5;
- (HKAudiogramChartViewController)initWithUnitController:(id)a3 sampleTypeUpdateController:(id)a4 minimumAudiogramHeight:(double)a5;
- (HKAudiogramCurrentValueViewDataSource)currentValueViewDataSource;
- (HKDisplayTypeSectionedContextView)contextView;
- (HKFeatureStatusManager)hearingTestFeatureStatus;
- (HKInteractiveChartAnnotationView)currentValueView;
- (HKLollipopController)lollipopController;
- (HKOverlayRoomApplicationItems)applicationItems;
- (HKScalarGraphCollectionViewController)scalarGraphCollectionController;
- (NSArray)factorDisplayTypes;
- (NSArray)sections;
- (NSLayoutConstraint)leadingMarginConstraint;
- (NSLayoutConstraint)stackViewHeightConstraint;
- (NSLayoutConstraint)trailingMarginConstraint;
- (NSMutableArray)audiograms;
- (UIStackView)contextStackView;
- (UIStackView)stackView;
- (double)chartHeight;
- (double)lollipopExtensionLength;
- (id)_attributedLabelTextOverrideWithHearingLevelClassification:(id)a3 valueAndUnit:(id)a4 metricColors:(id)a5 selectedMetricColors:(id)a6;
- (id)_attributedLabelTextWithHearingLevelClassification:(id)a3 valueAndUnit:(id)a4 metricColors:(id)a5 selectedMetricColors:(id)a6 isSelected:(BOOL)a7;
- (id)_audiogramDisplayType;
- (id)_audiogramPureToneAveragePointsSeriesWithSensitivityPoints:(id)a3 seriesEar:(int64_t)a4;
- (id)_audiogramSeriesWithSensitivityPoints:(id)a3 seriesEar:(int64_t)a4;
- (id)_averageLevelOverlaySeriesWithAudiogram:(id)a3 selectedEar:(int64_t)a4;
- (id)_averageSectionFromAudiogram:(id)a3;
- (id)_buildContextItemForEar:(int64_t)a3 metrics:(id)a4;
- (id)_currentAudiogramSample;
- (id)_findNavigationController;
- (id)_healthStore;
- (id)_indexPathForCurrentSelections;
- (id)_sectionsFromAudiogram:(id)a3;
- (id)_setupSeriesForAudiogramSample:(id)a3;
- (id)_unitController;
- (id)_updateController;
- (id)graphSeriesForIndex:(int64_t)a3;
- (id)graphViewControllerForIndex:(int64_t)a3;
- (id)lollipopAnnotationColor;
- (id)lollipopFieldColor;
- (int64_t)currentAudiogramIndex;
- (int64_t)numberOfItemsInCollection;
- (int64_t)selectedOverlayEar;
- (void)_addContextView;
- (void)_addControllerAsChildController:(id)a3;
- (void)_addShowMoreDataButton;
- (void)_pinView:(id)a3 toParentGuide:(id)a4;
- (void)_refreshDynamicInsets;
- (void)_resetCurrentGraph;
- (void)_setAudiograms:(id)a3;
- (void)_setupFixedFrequencyAxisForGraphView:(id)a3;
- (void)_setupInitialUI;
- (void)_showMoreData:(id)a3;
- (void)_updateAudiogramSamples:(id)a3 error:(id)a4;
- (void)_updateHeaderState;
- (void)_updateOverlayPillsAndHeaderWithSample:(id)a3;
- (void)contextView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didTapOnInfoButtonFromCurrentValueView:(id)a3;
- (void)graphCollectionView:(id)a3 didChangeVisibleIndex:(int64_t)a4;
- (void)queryForAudiograms;
- (void)setAnnotationViewDataSource:(id)a3;
- (void)setApplicationItems:(id)a3;
- (void)setAudiograms:(id)a3;
- (void)setAudiogramsFetched:(BOOL)a3;
- (void)setChartHeight:(double)a3;
- (void)setContextStackView:(id)a3;
- (void)setContextView:(id)a3;
- (void)setCurrentAudiogramIndex:(int64_t)a3;
- (void)setCurrentValueView:(id)a3;
- (void)setCurrentValueViewDataSource:(id)a3;
- (void)setHearingTestFeatureStatus:(id)a3;
- (void)setLeadingMarginConstraint:(id)a3;
- (void)setLollipopController:(id)a3;
- (void)setScalarGraphCollectionController:(id)a3;
- (void)setSections:(id)a3;
- (void)setSelectedOverlayEar:(int64_t)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewHeightConstraint:(id)a3;
- (void)setTrailingMarginConstraint:(id)a3;
- (void)updateAnnotationDataSource:(id)a3 pointContexts:(id)a4;
- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HKAudiogramChartViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v13 = a10;
  id v14 = a5;
  v15 = (void *)[objc_alloc((Class)a1) initWithApplicationItems:v14 factorDisplayTypes:v13 chartHeight:350.0];

  [v15 queryForAudiograms];
  return v15;
}

- (HKAudiogramChartViewController)initWithApplicationItems:(id)a3 factorDisplayTypes:(id)a4 chartHeight:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HKAudiogramChartViewController;
  v11 = [(HKAudiogramChartViewController *)&v25 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_applicationItems, a3);
    v12->_chartHeight = a5;
    audiograms = v12->_audiograms;
    v12->_audiograms = 0;

    v12->_currentAudiogramIndex = -1;
    currentValueView = v12->_currentValueView;
    v12->_currentValueView = 0;

    currentValueViewDataSource = v12->_currentValueViewDataSource;
    v12->_currentValueViewDataSource = 0;

    annotationViewDataSource = v12->_annotationViewDataSource;
    v12->_annotationViewDataSource = 0;

    v12->_selectedOverlayEar = 0;
    sections = v12->_sections;
    v12->_sections = 0;

    v12->_audiogramsFetched = 0;
    v18 = [(HKAudiogramChartViewController *)v12 navigationItem];
    [v18 setLargeTitleDisplayMode:2];

    id v19 = objc_alloc(MEMORY[0x1E4F2B068]);
    uint64_t v20 = *MEMORY[0x1E4F29D50];
    v21 = [v9 healthStore];
    uint64_t v22 = [v19 initWithFeatureIdentifier:v20 healthStore:v21];
    hearingTestFeatureStatus = v12->_hearingTestFeatureStatus;
    v12->_hearingTestFeatureStatus = (HKFeatureStatusManager *)v22;

    objc_storeStrong((id *)&v12->_factorDisplayTypes, a4);
  }

  return v12;
}

- (HKAudiogramChartViewController)initWithUnitController:(id)a3 sampleTypeUpdateController:(id)a4 minimumAudiogramHeight:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(HKOverlayRoomApplicationItems);
  [(HKOverlayRoomApplicationItems *)v10 setUnitController:v9];

  [(HKOverlayRoomApplicationItems *)v10 setSampleTypeUpdateController:v8];
  v11 = +[HKDisplayTypeController sharedInstance];
  [(HKOverlayRoomApplicationItems *)v10 setDisplayTypeController:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F2B0B8]);
  [(HKOverlayRoomApplicationItems *)v10 setHealthStore:v12];

  id v13 = [(HKAudiogramChartViewController *)self initWithApplicationItems:v10 factorDisplayTypes:0 chartHeight:a5];
  return v13;
}

- (void)dealloc
{
  v3 = [(HKAudiogramChartViewController *)self _updateController];
  v4 = [MEMORY[0x1E4F2B448] audiogramSampleType];
  [v3 removeObserver:self forType:v4];

  v5.receiver = self;
  v5.super_class = (Class)HKAudiogramChartViewController;
  [(HKAudiogramChartViewController *)&v5 dealloc];
}

- (void)setAudiograms:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(HKAudiogramChartViewController *)self _setAudiograms:v4];
}

- (void)_refreshDynamicInsets
{
  v3 = [(HKAudiogramChartViewController *)self traitCollection];
  uint64_t v4 = [v3 valueForNSIntegerTrait:objc_opt_class()];

  +[HKCollectionViewLayoutEngineDefaults edgeInsetsForWidthDesignation:v4];
  double v6 = v5;
  double v8 = v7;
  id v9 = [MEMORY[0x1E4F2B860] sharedBehavior];
  LODWORD(v4) = [v9 isiPad];

  if (v4)
  {
    +[HKScalarGraphViewController hardLeftMarginWidth];
    double v11 = v10;
    id v12 = [(HKAudiogramChartViewController *)self view];
    int v13 = objc_msgSend(v12, "hk_isLeftToRight");

    id v14 = [(HKAudiogramChartViewController *)self leadingMarginConstraint];
    if (v13)
    {
      [v14 setConstant:v6 - v11];

      double v15 = -v8;
    }
    else
    {
      [v14 setConstant:v6];

      double v15 = v11 - v8;
    }
  }
  else
  {
    v16 = [(HKAudiogramChartViewController *)self view];
    [v16 layoutMargins];
    double v18 = v17;
    double v20 = v19;

    if (v18 + -16.0 >= 0.0) {
      double v21 = v18 + -16.0;
    }
    else {
      double v21 = 0.0;
    }
    uint64_t v22 = [(HKAudiogramChartViewController *)self leadingMarginConstraint];
    [v22 setConstant:v21];

    double v15 = fmin(-(v20 + -16.0), 0.0);
  }
  v23 = [(HKAudiogramChartViewController *)self trailingMarginConstraint];
  [v23 setConstant:v15];

  id v30 = [(HKAudiogramChartViewController *)self leadingMarginConstraint];
  [v30 constant];
  double v25 = v6 - v24;
  v26 = [(HKAudiogramChartViewController *)self trailingMarginConstraint];
  [v26 constant];
  double v28 = v8 + v27;
  v29 = [(HKAudiogramChartViewController *)self contextStackView];
  objc_msgSend(v29, "setDirectionalLayoutMargins:", 0.0, v25, 0.0, v28);
}

- (void)viewWillLayoutSubviews
{
  [(HKAudiogramChartViewController *)self _refreshDynamicInsets];
  v3.receiver = self;
  v3.super_class = (Class)HKAudiogramChartViewController;
  [(HKAudiogramChartViewController *)&v3 viewWillLayoutSubviews];
}

- (void)viewDidLoad
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v72.receiver = self;
  v72.super_class = (Class)HKAudiogramChartViewController;
  [(HKAudiogramChartViewController *)&v72 viewDidLoad];
  objc_super v3 = [(HKAudiogramChartViewController *)self view];
  uint64_t v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB1C60]);
  double v6 = (UIStackView *)[v5 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  stackView = self->_stackView;
  self->_stackView = v6;

  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setDistribution:0];
  double v8 = [HKAudiogramCurrentValueViewDataSource alloc];
  id v9 = [(HKAudiogramChartViewController *)self applicationItems];
  double v10 = [(HKAudiogramCurrentValueViewDataSource *)v8 initWithApplicationItems:v9];
  [(HKAudiogramChartViewController *)self setCurrentValueViewDataSource:v10];

  double v11 = [[HKInteractiveChartAnnotationView alloc] initWithContext:0];
  [(HKAudiogramChartViewController *)self setCurrentValueView:v11];

  id v12 = objc_msgSend(NSString, "hk_chartAccessibilityIdentifier:", @"ValueView");
  int v13 = [(HKAudiogramChartViewController *)self currentValueView];
  [v13 setAccessibilityIdentifier:v12];

  id v14 = [(HKAudiogramChartViewController *)self currentValueView];
  double v15 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v16 = [v15 features];
  objc_msgSend(v14, "setShowsInfoButton:", objc_msgSend(v16, "yodel"));

  double v17 = [(HKAudiogramChartViewController *)self currentValueView];
  [v17 setDelegate:self];

  double v18 = [(HKAudiogramChartViewController *)self currentValueViewDataSource];
  double v19 = [(HKAudiogramChartViewController *)self currentValueView];
  [v19 setDataSource:v18];

  double v20 = [(HKAudiogramChartViewController *)self stackView];
  double v21 = [(HKAudiogramChartViewController *)self currentValueView];
  [v20 addArrangedSubview:v21];

  uint64_t v22 = [(HKAudiogramChartViewController *)self currentValueView];
  v23 = [v22 heightAnchor];
  double v24 = [v23 constraintEqualToConstant:90.0];
  [v24 setActive:1];

  double v25 = [HKScalarGraphCollectionViewController alloc];
  [(HKAudiogramChartViewController *)self chartHeight];
  double v27 = v26;
  double v28 = [(HKAudiogramChartViewController *)self _unitController];
  v29 = [(HKScalarGraphCollectionViewController *)v25 initWithMinimumHeight:v28 unitController:v27];
  [(HKAudiogramChartViewController *)self setScalarGraphCollectionController:v29];

  id v30 = [(HKAudiogramChartViewController *)self scalarGraphCollectionController];
  v31 = [v30 view];
  v32 = [v31 heightAnchor];
  [(HKAudiogramChartViewController *)self chartHeight];
  v33 = objc_msgSend(v32, "constraintEqualToConstant:");
  [v33 setActive:1];

  v34 = [(HKAudiogramChartViewController *)self scalarGraphCollectionController];
  [(HKAudiogramChartViewController *)self _addControllerAsChildController:v34];

  v35 = [(HKAudiogramChartViewController *)self stackView];
  v36 = [(HKAudiogramChartViewController *)self scalarGraphCollectionController];
  v37 = [v36 view];
  [v35 addArrangedSubview:v37];

  v38 = [(HKAudiogramChartViewController *)self scalarGraphCollectionController];
  [v38 setDelegate:self];

  [(HKAudiogramChartViewController *)self _addContextView];
  v39 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v40 = [v39 features];
  LODWORD(v37) = [v40 yodel];

  if (v37) {
    [(HKAudiogramChartViewController *)self _addShowMoreDataButton];
  }
  v41 = [(HKAudiogramChartViewController *)self view];
  [v41 addSubview:self->_stackView];

  v42 = [(HKAudiogramChartViewController *)self stackView];
  v43 = [v42 heightAnchor];
  [(HKAudiogramChartViewController *)self chartHeight];
  double v45 = v44;
  v46 = [(HKAudiogramChartViewController *)self currentValueView];
  [v46 frame];
  v48 = [v43 constraintGreaterThanOrEqualToConstant:v45 + v47];
  stackViewHeightConstraint = self->_stackViewHeightConstraint;
  self->_stackViewHeightConstraint = v48;

  [(NSLayoutConstraint *)self->_stackViewHeightConstraint setActive:1];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v50 = [(UIStackView *)self->_stackView arrangedSubviews];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v68 objects:v73 count:16];
  if (v51)
  {
    uint64_t v53 = v51;
    uint64_t v54 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v69 != v54) {
          objc_enumerationMutation(v50);
        }
        v56 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        LODWORD(v52) = 1148846080;
        [v56 setContentCompressionResistancePriority:1 forAxis:v52];
        LODWORD(v57) = 1148846080;
        [v56 setContentHuggingPriority:1 forAxis:v57];
      }
      uint64_t v53 = [v50 countByEnumeratingWithState:&v68 objects:v73 count:16];
    }
    while (v53);
  }

  v58 = self->_stackView;
  v59 = [(HKAudiogramChartViewController *)self view];
  v60 = [v59 safeAreaLayoutGuide];
  [(HKAudiogramChartViewController *)self _pinView:v58 toParentGuide:v60];

  v61 = [HKAudiogramAnnotationViewDataSource alloc];
  v62 = [(HKAudiogramChartViewController *)self applicationItems];
  v63 = [(HKAudiogramAnnotationViewDataSource *)v61 initWithApplicationItems:v62];
  [(HKAudiogramChartViewController *)self setAnnotationViewDataSource:v63];

  v64 = [HKLollipopController alloc];
  v65 = [(HKAudiogramChartViewController *)self annotationViewDataSource];
  v66 = [(HKAudiogramChartViewController *)self stackView];
  v67 = [(HKLollipopController *)v64 initWithAnnotationDataSource:v65 parentView:v66 delegate:self];
  [(HKAudiogramChartViewController *)self setLollipopController:v67];

  if (self->_audiogramsFetched) {
    [(HKAudiogramChartViewController *)self _setupInitialUI];
  }
}

- (void)_setupInitialUI
{
  [(HKScalarGraphCollectionViewController *)self->_scalarGraphCollectionController reload];
  [(HKAudiogramChartViewController *)self _updateOverlayPillsAndHeaderWithSample:0];
  if ([(HKAudiogramChartViewController *)self currentAudiogramIndex] == -1)
  {
    if ([(NSMutableArray *)self->_audiograms count]) {
      self->_currentAudiogramIndex = [(NSMutableArray *)self->_audiograms count] - 1;
    }
    scalarGraphCollectionController = self->_scalarGraphCollectionController;
    [(HKScalarGraphCollectionViewController *)scalarGraphCollectionController resetToMostRecent];
  }
  else
  {
    objc_super v3 = self->_scalarGraphCollectionController;
    int64_t v4 = [(HKAudiogramChartViewController *)self currentAudiogramIndex];
    [(HKScalarGraphCollectionViewController *)v3 resetToIndex:v4];
  }
}

- (void)_addContextView
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [[HKDisplayTypeSectionedContextView alloc] initWithStyle:2];
  contextView = self->_contextView;
  self->_contextView = v3;

  id v5 = [MEMORY[0x1E4F2B860] sharedBehavior];
  double v6 = [v5 features];
  -[HKDisplayTypeSectionedContextView setUseBottomInsets:](self->_contextView, "setUseBottomInsets:", [v6 yodel] ^ 1);

  [(HKDisplayTypeSectionedContextView *)self->_contextView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HKDisplayTypeSectionedContextView *)self->_contextView setDelegate:self];
  double v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(HKDisplayTypeSectionedContextView *)self->_contextView setBackgroundColor:v7];

  id v8 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v14[0] = self->_contextView;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  double v10 = (UIStackView *)[v8 initWithArrangedSubviews:v9];
  contextStackView = self->_contextStackView;
  self->_contextStackView = v10;

  [(UIStackView *)self->_contextStackView setAxis:1];
  [(UIStackView *)self->_contextStackView setDistribution:2];
  [(UIStackView *)self->_contextStackView setLayoutMarginsRelativeArrangement:1];
  [(UIStackView *)self->_contextStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_contextStackView];
  [(HKDisplayTypeSectionedContextView *)self->_contextView setSemanticContentAttribute:3];
  id v12 = self->_contextView;
  int v13 = [(HKAudiogramChartViewController *)self _sectionsFromAudiogram:0];
  [(HKDisplayTypeSectionedContextView *)v12 setDisplayTypeContextSections:v13];
}

- (void)_addShowMoreDataButton
{
  objc_msgSend(MEMORY[0x1E4FB14D0], "hk_chartShowMoreDataButtonWithTitleOverride:target:action:", 0, self, sel__showMoreData_);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [(HKAudiogramChartViewController *)self stackView];
  [v3 addArrangedSubview:v4];
}

- (void)_showMoreData:(id)a3
{
  id v11 = [(HKAudiogramChartViewController *)self _findNavigationController];
  if (v11)
  {
    id v4 = [(HKAudiogramChartViewController *)self applicationItems];
    id v5 = [v4 timeScopeController];
    [v5 setSelectedTimeScope:2];

    double v6 = [HKAudiogramLongitudinalOverlayRoomViewController alloc];
    double v7 = [(HKAudiogramChartViewController *)self applicationItems];
    id v8 = [(HKAudiogramChartViewController *)self factorDisplayTypes];
    id v9 = [(HKAudiogramLongitudinalOverlayRoomViewController *)v6 initWithApplicationItems:v7 factorDisplayTypes:v8];

    double v10 = [[HKModalNavigationController alloc] initWithRootViewController:v9];
    objc_msgSend(v11, "hk_presentModalCardViewController:fullScreen:animated:completion:", v10, 1, 1, 0);
  }
}

- (void)queryForAudiograms
{
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9A0] ascending:1];
  v12[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  id v5 = objc_alloc(MEMORY[0x1E4F2B440]);
  double v6 = [MEMORY[0x1E4F2B448] audiogramSampleType];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__HKAudiogramChartViewController_queryForAudiograms__block_invoke;
  v11[3] = &unk_1E6D511E0;
  v11[4] = self;
  double v7 = (void *)[v5 initWithSampleType:v6 predicate:0 limit:0 sortDescriptors:v4 resultsHandler:v11];

  id v8 = [(HKAudiogramChartViewController *)self _updateController];
  id v9 = [MEMORY[0x1E4F2B448] audiogramSampleType];
  [v8 addObserver:self forType:v9];

  double v10 = [(HKAudiogramChartViewController *)self _healthStore];
  [v10 executeQuery:v7];
}

uint64_t __52__HKAudiogramChartViewController_queryForAudiograms__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAudiogramSamples:error:");
}

- (void)_updateAudiogramSamples:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__HKAudiogramChartViewController__updateAudiogramSamples_error___block_invoke;
    v9[3] = &unk_1E6D513B0;
    v9[4] = self;
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
  else
  {
    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F40], OS_LOG_TYPE_ERROR)) {
      -[HKAudiogramChartViewController _updateAudiogramSamples:error:]((uint64_t)self, (uint64_t)v7, v8);
    }
  }
}

void __64__HKAudiogramChartViewController__updateAudiogramSamples_error___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 976) = 1;
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F2B448] audiogramSampleType];
  [v2 updateController:0 didReceiveUpdateForType:v3 samplesAdded:*(void *)(a1 + 40) objectsRemoved:MEMORY[0x1E4F1CBF0] recoveringFromError:0];
}

- (id)_currentAudiogramSample
{
  unint64_t currentAudiogramIndex = self->_currentAudiogramIndex;
  if ((currentAudiogramIndex & 0x8000000000000000) != 0
    || currentAudiogramIndex >= [(NSMutableArray *)self->_audiograms count])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(NSMutableArray *)self->_audiograms objectAtIndex:self->_currentAudiogramIndex];
  }
  return v4;
}

- (BOOL)_hasAudiogramData
{
  audiograms = self->_audiograms;
  if (audiograms)
  {
    unint64_t currentAudiogramIndex = self->_currentAudiogramIndex;
    LOBYTE(audiograms) = (currentAudiogramIndex & 0x8000000000000000) == 0
                      && currentAudiogramIndex < [(NSMutableArray *)audiograms count];
  }
  return (char)audiograms;
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v13;
  audiograms = self->_audiograms;
  if (audiograms && [(NSMutableArray *)audiograms count])
  {
    v36 = v14;
    v38 = [(HKAudiogramChartViewController *)self _currentAudiogramSample];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v35 = v15;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
    id v37 = v11;
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v23 = self->_audiograms;
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_2;
          v41[3] = &unk_1E6D56858;
          v41[4] = v22;
          double v24 = [(NSMutableArray *)v23 hk_firstObjectPassingTest:v41];

          if (!v24)
          {
            -[NSMutableArray insertObject:atIndex:](self->_audiograms, "insertObject:atIndex:", v22, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_audiograms, "indexOfObject:inSortedRange:options:usingComparator:", v22, 0, [(NSMutableArray *)self->_audiograms count], 1024, &__block_literal_global_83));
            if ([(HKAudiogramChartViewController *)self shouldScrollToSample:v22])
            {
              id v25 = v22;

              v38 = v25;
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v19);
    }

    double v26 = (void *)MEMORY[0x1E4F1CAD0];
    id v14 = v36;
    double v27 = objc_msgSend(v36, "hk_map:", &__block_literal_global_421);
    double v28 = [v26 setWithArray:v27];

    v29 = self->_audiograms;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_4;
    v39[3] = &unk_1E6D56858;
    id v30 = v28;
    id v40 = v30;
    [(NSMutableArray *)v29 hk_removeObjectsPassingTest:v39];
    id v11 = v37;
    id v15 = v35;
    if (self->_audiogramsFetched)
    {
      if (v38)
      {
        uint64_t v31 = [(NSMutableArray *)self->_audiograms indexOfObject:v38];
        if (v31 == 0x7FFFFFFFFFFFFFFFLL) {
          int64_t v32 = -1;
        }
        else {
          int64_t v32 = v31;
        }
      }
      else
      {
        int64_t v32 = -1;
      }
      self->_unint64_t currentAudiogramIndex = v32;
      [(HKAudiogramChartViewController *)self _setupInitialUI];
    }
  }
  else
  {
    v33 = [MEMORY[0x1E4F1CA48] arrayWithArray:v15];
    v34 = self->_audiograms;
    self->_audiograms = v33;

    self->_unint64_t currentAudiogramIndex = -1;
    [(HKAudiogramChartViewController *)self _setupInitialUI];
  }
}

uint64_t __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 endDate];
  id v6 = [v4 endDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

BOOL __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 UUID];
  id v4 = [*(id *)(a1 + 32) UUID];
  BOOL v5 = v3 == v4;

  return v5;
}

uint64_t __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

uint64_t __123__HKAudiogramChartViewController_updateController_didReceiveUpdateForType_samplesAdded_objectsRemoved_recoveringFromError___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)shouldScrollToSample:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  [v4 _creationTimestamp];
  double v7 = v6;

  double v8 = vabdd_f64(Current, v7);
  if (v8 > 5.0)
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F40], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = self;
      __int16 v13 = 2048;
      double v14 = Current - v7;
      _os_log_impl(&dword_1E0B26000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Omitting incoming sample with timeDifference %f", (uint8_t *)&v11, 0x16u);
    }
  }
  return v8 <= 5.0;
}

- (id)_audiogramDisplayType
{
  v2 = [(HKAudiogramChartViewController *)self applicationItems];
  id v3 = [v2 displayTypeController];
  id v4 = [MEMORY[0x1E4F2B448] audiogramSampleType];
  BOOL v5 = [v3 displayTypeForObjectType:v4];

  return v5;
}

- (id)_healthStore
{
  v2 = [(HKAudiogramChartViewController *)self applicationItems];
  id v3 = [v2 healthStore];

  return v3;
}

- (id)_unitController
{
  v2 = [(HKAudiogramChartViewController *)self applicationItems];
  id v3 = [v2 unitController];

  return v3;
}

- (id)_updateController
{
  v2 = [(HKAudiogramChartViewController *)self applicationItems];
  id v3 = [v2 sampleTypeUpdateController];

  return v3;
}

- (id)_sectionsFromAudiogram:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HKAudiogramChartViewController *)self _averageSectionFromAudiogram:a3];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)_averageSectionFromAudiogram:(id)a3
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 hearingLevelSummary];
  double v6 = [v5 leftEarMetrics];
  double v7 = [(HKAudiogramChartViewController *)self _buildContextItemForEar:1 metrics:v6];

  double v8 = [v4 hearingLevelSummary];

  id v9 = [v8 rightEarMetrics];
  id v10 = [(HKAudiogramChartViewController *)self _buildContextItemForEar:2 metrics:v9];

  int v11 = objc_alloc_init(_HKDisplayTypeAudiogramContextItemSection);
  [(_HKDisplayTypeAudiogramContextItemSection *)v11 setTitle:0];
  v14[0] = v7;
  v14[1] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [(_HKDisplayTypeAudiogramContextItemSection *)v11 setItems:v12];

  return v11;
}

- (id)_buildContextItemForEar:(int64_t)a3 metrics:(id)a4
{
  id v6 = a4;
  double v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  double v8 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v7];

  id v9 = +[HKUIMetricColors hearingHealthColors];
  id v10 = objc_alloc_init(HKDisplayTypeContextAudiogramItem);
  [(HKDisplayTypeContextItem *)v10 setInfoHidden:1];
  [(HKDisplayTypeContextItem *)v10 setMetricColors:v8];
  [(HKDisplayTypeContextItem *)v10 setSelectedMetricColors:v9];
  [(HKDisplayTypeContextAudiogramItem *)v10 setEar:a3];
  if (a3 == 1) {
    int v11 = @"LeftAverage";
  }
  else {
    int v11 = @"RightAverage";
  }
  if (a3 == 1) {
    id v12 = @"LEFT_AVERAGE_HEARING";
  }
  else {
    id v12 = @"RIGHT_AVERAGE_HEARING";
  }
  __int16 v13 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", v11);
  [(HKDisplayTypeContextItem *)v10 setAccessibilityIdentifier:v13];

  double v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v15 = [v14 localizedStringForKey:v12 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKDisplayTypeContextItem *)v10 setTitle:v15];

  v16 = [v6 averageSensitivity];
  if (v16)
  {
    v33 = self;
    v34 = v6;
    id v17 = HKIntegerFormatter();
    uint64_t v18 = [v16 _unit];
    [v16 doubleValueForUnit:v18];
    double v20 = v19;

    double v21 = [NSNumber numberWithDouble:v20];
    uint64_t v22 = [v17 stringFromNumber:v21];

    v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    double v24 = [v23 localizedStringForKey:@"DECIBELS_HEARING_NUMBERLESS_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    [(HKDisplayTypeContextItem *)v10 setValue:v22];
    [(HKDisplayTypeContextItem *)v10 setUnit:v24];
    id v25 = [MEMORY[0x1E4F2B860] sharedBehavior];
    double v26 = [v25 features];
    int v27 = [v26 yodel];

    if (v27)
    {
      double v28 = [v34 averageSensitivity];
      HKHearingLevelClassificationForSensitivity();

      v29 = HKLocalizedStringForHearingLevelClassification();
      id v30 = HKFormatValueAndUnit(v22, v24);
      uint64_t v31 = [(HKAudiogramChartViewController *)v33 _attributedLabelTextOverrideWithHearingLevelClassification:v29 valueAndUnit:v30 metricColors:v8 selectedMetricColors:v9];
      [(HKDisplayTypeContextItem *)v10 setAttributedLabelTextOverride:v31];
    }
    id v6 = v34;
  }
  else
  {
    id v17 = HKUILocalizedString(@"NO_DATA");
    [(HKDisplayTypeContextItem *)v10 setValue:v17];
  }

  return v10;
}

- (id)_attributedLabelTextOverrideWithHearingLevelClassification:(id)a3 valueAndUnit:(id)a4 metricColors:(id)a5 selectedMetricColors:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  double v14 = [(HKAudiogramChartViewController *)self _attributedLabelTextWithHearingLevelClassification:v13 valueAndUnit:v12 metricColors:v11 selectedMetricColors:v10 isSelected:0];
  uint64_t v15 = [(HKAudiogramChartViewController *)self _attributedLabelTextWithHearingLevelClassification:v13 valueAndUnit:v12 metricColors:v11 selectedMetricColors:v10 isSelected:1];

  v16 = +[HKDisplayTypeContextItemAttributedLabelOverride attributedLabelOverrideWithText:v14 selectedText:v15];

  return v16;
}

- (id)_attributedLabelTextWithHearingLevelClassification:(id)a3 valueAndUnit:(id)a4 metricColors:(id)a5 selectedMetricColors:(id)a6 isSelected:(BOOL)a7
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = NSString;
  uint64_t v15 = (void *)MEMORY[0x1E4F28B50];
  id v16 = a3;
  id v17 = [v15 bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v18 = [v17 localizedStringForKey:@"HEARING_LEVEL_CLASSIFICATION_%@_AND_AVERAGE_FORMAT_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
  double v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, v16, v11);

  int64_t v32 = v13;
  v33 = v12;
  if (a7)
  {
    double v20 = [v13 contextViewPrimaryTextColor];
    [v13 contextViewPrimaryTextColor];
  }
  else
  {
    double v20 = [v12 contextViewPrimaryTextColor];
    [v12 contextViewSecondaryTextColor];
  double v21 = };
  uint64_t v22 = [v19 rangeOfString:v11];
  uint64_t v24 = v23;
  id v25 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v34 = *MEMORY[0x1E4FB06F8];
  double v26 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemValueAndUnitFont");
  uint64_t v35 = *MEMORY[0x1E4FB0700];
  uint64_t v27 = v35;
  v36[0] = v26;
  v36[1] = v20;
  double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v34 count:2];
  v29 = (void *)[v25 initWithString:v19 attributes:v28];

  objc_msgSend(v29, "addAttribute:value:range:", v27, v21, v22, v24);
  id v30 = (void *)[v29 copy];

  return v30;
}

- (void)_updateOverlayPillsAndHeaderWithSample:(id)a3
{
  contextView = self->_contextView;
  if (contextView)
  {
    BOOL v5 = [(HKAudiogramChartViewController *)self _sectionsFromAudiogram:a3];
    [(HKDisplayTypeSectionedContextView *)contextView setDisplayTypeContextSections:v5];
  }
  [(HKAudiogramChartViewController *)self _updateHeaderState];
}

- (void)_updateHeaderState
{
  if ([(HKAudiogramChartViewController *)self _hasAudiogramData])
  {
    id v3 = [(HKAudiogramChartViewController *)self currentValueViewDataSource];
    id v4 = [(HKAudiogramChartViewController *)self _currentAudiogramSample];
    [v3 updateWithAudiogram:v4];

    id v5 = [(HKAudiogramChartViewController *)self currentValueView];
    [v5 reloadData];
  }
  else
  {
    id v5 = [(HKAudiogramChartViewController *)self currentValueView];
    [v5 showNoDataStatus];
  }
}

- (void)didTapOnInfoButtonFromCurrentValueView:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F2B860], "sharedBehavior", a3);
  id v5 = [v4 features];
  int v6 = [v5 yodel];

  if (v6)
  {
    id v7 = [(id)objc_opt_class() hearingLossInfographicViewController];
    [(UIViewController *)self hk_presentModalCardViewController:v7 fullScreen:0 animated:1 completion:0];
  }
}

+ (id)hearingLossInfographicViewController
{
  v18[6] = *MEMORY[0x1E4F143B8];
  id v3 = [HKInfographicViewController alloc];
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_INTRODUCTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
  int v6 = [a1 _itemForTitle:0 description:v5 baseIdentifier:@"HearingLevelClassificationIntroduction"];
  v18[0] = v6;
  id v7 = [a1 _itemForHearingLossInfographicWithHearingLossClassification:1];
  v18[1] = v7;
  double v8 = [a1 _itemForHearingLossInfographicWithHearingLossClassification:2];
  v18[2] = v8;
  id v9 = [a1 _itemForHearingLossInfographicWithHearingLossClassification:3];
  v18[3] = v9;
  id v10 = [a1 _itemForHearingLossInfographicWithHearingLossClassification:4];
  v18[4] = v10;
  id v11 = [a1 _itemForHearingLossInfographicWithHearingLossClassification:5];
  v18[5] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:6];
  id v13 = [(HKInfographicViewController *)v3 initWithItems:v12];

  double v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v15 = [v14 localizedStringForKey:@"HEARING_LEVEL_CLASSIFICATIONS_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
  [(HKInfographicViewController *)v13 setTitle:v15];

  id v16 = [[HKModalNavigationController alloc] initWithRootViewController:v13];
  return v16;
}

+ (id)_itemForTitle:(id)a3 description:(id)a4 baseIdentifier:(id)a5
{
  id v7 = a3;
  double v8 = (objc_class *)MEMORY[0x1E4F28E48];
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init(v8);
  if (v7)
  {
    id v12 = HKInteractiveChartInfographicTitleAttributes();
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v12];
    [v11 appendAttributedString:v13];
  }
  double v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10];

  uint64_t v15 = [[HKInfographicContentItem alloc] initWithTitle:v11 description:v14];
  [(HKInfographicContentItem *)v15 setBaseIdentifier:v9];

  return v15;
}

+ (id)_itemForHearingLossInfographicWithHearingLossClassification:(unint64_t)a3
{
  id v5 = HKLocalizedStringForHearingLevelClassification();
  int v6 = [a1 _localizedDescriptionForClassification:a3];
  id v7 = [a1 _baseIdentifierForClassification:a3];
  double v8 = [a1 _itemForTitle:v5 description:v6 baseIdentifier:v7];

  return v8;
}

+ (id)_localizedDescriptionForClassification:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v5 = [v4 usesMetricSystem];

  switch(a3)
  {
    case 1uLL:
      int v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v7 = v6;
      double v8 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_NO_IMPAIRMENT";
      id v9 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_NO_IMPAIRMENT_METRIC";
      goto LABEL_8;
    case 2uLL:
      int v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v7 = v6;
      double v8 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_MILD_IMPAIRMENT";
      id v9 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_MILD_IMPAIRMENT_METRIC";
      goto LABEL_8;
    case 3uLL:
      int v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v7 = v6;
      double v8 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_MODERATE_IMPAIRMENT";
      id v9 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_MODERATE_IMPAIRMENT_METRIC";
      goto LABEL_8;
    case 4uLL:
      int v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v7 = v6;
      double v8 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_SEVERE_IMPAIRMENT";
      id v9 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_SEVERE_IMPAIRMENT_METRIC";
      goto LABEL_8;
    case 5uLL:
      int v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v7 = v6;
      double v8 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_PROFOUND_IMPAIRMENT";
      id v9 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_PROFOUND_IMPAIRMENT_METRIC";
LABEL_8:
      if (v5) {
        id v11 = v9;
      }
      else {
        id v11 = v8;
      }
      id v10 = [v6 localizedStringForKey:v11 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];

      break;
    default:
      id v10 = &stru_1F3B9CF20;
      break;
  }
  return v10;
}

+ (id)_baseIdentifierForClassification:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return off_1E6D568E0[a3 - 1];
  }
}

- (void)contextView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v21 = a3;
  id v7 = a4;
  double v8 = [(HKAudiogramChartViewController *)self audiograms];
  if (!v8 || [(HKAudiogramChartViewController *)self currentAudiogramIndex] < 0)
  {

    goto LABEL_10;
  }
  unint64_t v9 = [(HKAudiogramChartViewController *)self currentAudiogramIndex];
  id v10 = [(HKAudiogramChartViewController *)self audiograms];
  unint64_t v11 = [v10 count];

  if (v9 >= v11)
  {
LABEL_10:
    self->_selectedOverlayEar = 0;
    goto LABEL_11;
  }
  if (![v7 section])
  {
    id v12 = [v21 displayTypeContextSections];
    id v13 = [v12 objectAtIndex:0];

    double v14 = [v13 items];
    uint64_t v15 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v7, "row"));
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();

    if (v16 != v17)
    {
      double v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"HKAudiogramChartViewController.m", 700, @"We initialized audiogram items, and should get those back" object file lineNumber description];
    }
    uint64_t v18 = [v13 items];
    double v19 = objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v7, "row"));

    self->_selectedOverlayEar = [v19 ear];
  }
  [(HKScalarGraphCollectionViewController *)self->_scalarGraphCollectionController redrawCurrentCell];
LABEL_11:
}

- (void)_resetCurrentGraph
{
  self->_selectedOverlayEar = 0;
  [(HKScalarGraphCollectionViewController *)self->_scalarGraphCollectionController redrawCurrentCell];
}

- (int64_t)numberOfItemsInCollection
{
  if (![(NSMutableArray *)self->_audiograms count]) {
    return 1;
  }
  audiograms = self->_audiograms;
  return [(NSMutableArray *)audiograms count];
}

- (id)graphViewControllerForIndex:(int64_t)a3
{
  id v4 = objc_alloc_init(_HKAudiogramFrequencyAxisDimension);
  int v5 = objc_alloc_init(HKNumericAxisConfiguration);
  [(HKAxisConfiguration *)v5 setMaxLabels:10];
  int v6 = [HKScalarGraphViewController alloc];
  [(HKAudiogramChartViewController *)self chartHeight];
  id v7 = -[HKScalarGraphViewController initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:](v6, "initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:", v4, 3, v5);
  double v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisLabelColor");
  unint64_t v9 = [(HKGraphViewController *)v7 graphView];
  id v10 = [v9 xAxis];
  unint64_t v11 = [v10 preferredStyle];
  id v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_roundedSystemFontWithSize:weight:", 12.0, *MEMORY[0x1E4FB09D0]);
  id v13 = +[HKAxisLabelStyle labelStyleWithColor:v8 font:v12 horizontalAlignment:1 verticalAlignment:3];
  [v11 setLabelStyle:v13];

  double v14 = [(HKGraphViewController *)v7 graphView];
  uint64_t v15 = [v14 xAxis];
  uint64_t v16 = [v15 preferredStyle];
  [v16 setFillOuterPadding:0.0];

  uint64_t v17 = [(HKGraphViewController *)v7 graphView];
  [v17 setMultiSeriesSelection:1];

  uint64_t v18 = [(HKGraphViewController *)v7 graphView];
  objc_msgSend(v18, "setAxisInset:", 0.0, 0.0, 0.0, 0.0);

  double v19 = [(HKGraphViewController *)v7 graphView];
  [(HKAudiogramChartViewController *)self _setupFixedFrequencyAxisForGraphView:v19];

  return v7;
}

- (id)graphSeriesForIndex:(int64_t)a3
{
  unint64_t v5 = [(NSMutableArray *)self->_audiograms count];
  int v6 = (void *)MEMORY[0x1E4F1CBF0];
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    id v7 = [(HKAudiogramChartViewController *)self audiograms];
    double v8 = [v7 objectAtIndexedSubscript:a3];

    int v6 = [(HKAudiogramChartViewController *)self _setupSeriesForAudiogramSample:v8];
  }
  return v6;
}

- (void)graphCollectionView:(id)a3 didChangeVisibleIndex:(int64_t)a4
{
  id v6 = a3;
  audiograms = self->_audiograms;
  if (audiograms)
  {
    id v11 = v6;
    audiograms = (NSMutableArray *)[(NSMutableArray *)audiograms count];
    id v6 = v11;
    if ((int)audiograms - 1 >= a4)
    {
      self->_unint64_t currentAudiogramIndex = a4;
      double v8 = [(NSMutableArray *)self->_audiograms objectAtIndexedSubscript:[(HKAudiogramChartViewController *)self currentAudiogramIndex]];
      [(HKAudiogramChartViewController *)self _updateOverlayPillsAndHeaderWithSample:v8];

      unint64_t v9 = [(HKAudiogramChartViewController *)self _indexPathForCurrentSelections];
      contextView = self->_contextView;
      if (contextView)
      {
        if (v9)
        {
          [(HKDisplayTypeSectionedContextView *)contextView selectItemAtIndexPath:v9 animated:0 scrollPosition:0];
          [(HKAudiogramChartViewController *)self contextView:self->_contextView didSelectItemAtIndexPath:v9];
        }
        else
        {
          [(HKDisplayTypeSectionedContextView *)contextView deselectAllItemsAnimated:0];
          [(HKAudiogramChartViewController *)self _resetCurrentGraph];
        }
      }

      id v6 = v11;
    }
  }
  MEMORY[0x1F41817F8](audiograms, v6);
}

- (id)_setupSeriesForAudiogramSample:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [v4 sensitivityPoints];
  id v7 = [(HKAudiogramChartViewController *)self _audiogramSeriesWithSensitivityPoints:v6 seriesEar:2];
  objc_msgSend(v5, "hk_addNonNilObject:", v7);

  double v8 = [v4 sensitivityPoints];
  unint64_t v9 = [(HKAudiogramChartViewController *)self _audiogramSeriesWithSensitivityPoints:v8 seriesEar:1];
  objc_msgSend(v5, "hk_addNonNilObject:", v9);

  if (self->_selectedOverlayEar)
  {
    id v10 = [v4 sensitivityPoints];
    id v11 = [(HKAudiogramChartViewController *)self _audiogramPureToneAveragePointsSeriesWithSensitivityPoints:v10 seriesEar:self->_selectedOverlayEar];
    objc_msgSend(v5, "hk_addNonNilObject:", v11);

    id v12 = [(HKAudiogramChartViewController *)self _averageLevelOverlaySeriesWithAudiogram:v4 selectedEar:self->_selectedOverlayEar];
    objc_msgSend(v5, "hk_addNonNilObject:", v12);
  }
  return v5;
}

- (id)_audiogramSeriesWithSensitivityPoints:(id)a3 seriesEar:(int64_t)a4
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__HKAudiogramChartViewController__audiogramSeriesWithSensitivityPoints_seriesEar___block_invoke;
  v11[3] = &__block_descriptor_40_e37_B16__0__HKAudiogramSensitivityPoint_8l;
  v11[4] = a4 != 1;
  id v6 = objc_msgSend(a3, "hk_filter:", v11);
  if ([v6 count])
  {
    BOOL v7 = a4 == 1;
    double v8 = +[HKAudiogramLineSeries audiogramLineSeriesForSeriesEar:a4 selectedEar:self->_selectedOverlayEar disableConnectionLines:0];
    unint64_t v9 = [[HKAudiogramDataSource alloc] initWithSensitivityData:v6 forLeftEar:v7];
    [v8 setDataSource:v9];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

BOOL __82__HKAudiogramChartViewController__audiogramSeriesWithSensitivityPoints_seriesEar___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tests];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__HKAudiogramChartViewController__audiogramSeriesWithSensitivityPoints_seriesEar___block_invoke_2;
  v7[3] = &__block_descriptor_40_e36_B16__0__HKAudiogramSensitivityTest_8l;
  v7[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "hk_filter:", v7);
  id v5 = [v4 firstObject];

  return v5 != 0;
}

BOOL __82__HKAudiogramChartViewController__audiogramSeriesWithSensitivityPoints_seriesEar___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 side] == *(void *)(a1 + 32);
}

- (id)_audiogramPureToneAveragePointsSeriesWithSensitivityPoints:(id)a3 seriesEar:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  double v8 = [v7 features];
  int v9 = [v8 yodel];

  if (v9)
  {
    id v10 = HKHearingLevelClassificationPureToneAverageFrequencies();
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __103__HKAudiogramChartViewController__audiogramPureToneAveragePointsSeriesWithSensitivityPoints_seriesEar___block_invoke;
    double v19 = &unk_1E6D568C0;
    id v11 = v10;
    id v20 = v11;
    BOOL v21 = a4 != 1;
    id v12 = objc_msgSend(v6, "hk_filter:", &v16);
    if (objc_msgSend(v12, "count", v16, v17, v18, v19))
    {
      id v13 = +[HKAudiogramLineSeries audiogramLineSeriesForSeriesEar:self->_selectedOverlayEar selectedEar:0 disableConnectionLines:1];
      double v14 = [[HKAudiogramDataSource alloc] initWithSensitivityData:v12 forLeftEar:a4 == 1];
      [v13 setDataSource:v14];

      [v13 setAllowsSelection:0];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

BOOL __103__HKAudiogramChartViewController__audiogramPureToneAveragePointsSeriesWithSensitivityPoints_seriesEar___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = NSNumber;
  id v5 = [v3 frequency];
  id v6 = [MEMORY[0x1E4F2B618] hertzUnit];
  [v5 doubleValueForUnit:v6];
  BOOL v7 = objc_msgSend(v4, "numberWithDouble:");

  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    double v8 = [v3 tests];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __103__HKAudiogramChartViewController__audiogramPureToneAveragePointsSeriesWithSensitivityPoints_seriesEar___block_invoke_2;
    v13[3] = &__block_descriptor_40_e36_B16__0__HKAudiogramSensitivityTest_8l;
    v13[4] = *(void *)(a1 + 40);
    int v9 = objc_msgSend(v8, "hk_filter:", v13);
    id v10 = [v9 firstObject];

    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

BOOL __103__HKAudiogramChartViewController__audiogramPureToneAveragePointsSeriesWithSensitivityPoints_seriesEar___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 side] == *(void *)(a1 + 32);
}

- (id)_averageLevelOverlaySeriesWithAudiogram:(id)a3 selectedEar:(int64_t)a4
{
  BOOL v4 = a4 == 1;
  id v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a3;
  BOOL v7 = objc_msgSend(v5, "hk_hearingHealthAudiogramAverageLineColor");
  double v8 = +[HKAudiogramAverageLevelSeries audiogramAverageLevelSeriesWithColor:v7];

  int v9 = [[HKAudiogramAverageSensitivityDataSource alloc] initWithAudiogramSample:v6 isLeftEar:v4];
  [v8 setDataSource:v9];

  return v8;
}

- (void)_setupFixedFrequencyAxisForGraphView:(id)a3
{
  id v3 = a3;
  id v4 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C22BC0 maxValue:&unk_1F3C22BD0];
  [v3 setEffectiveAxisRange:v4 effectiveVisibleRangeCadence:v4 effectiveVisibleRangeActive:v4];
}

- (void)updateAnnotationDataSource:(id)a3 pointContexts:(id)a4
{
  BOOL v5 = self->_selectedOverlayEar != 0;
  id v6 = a4;
  BOOL v7 = [(HKAudiogramChartViewController *)self _currentAudiogramSample];
  id v9 = [v7 startDate];

  double v8 = [(HKAudiogramChartViewController *)self annotationViewDataSource];
  [v8 updateWithPointSelectionContexts:v6 date:v9 isAverage:v5];
}

- (id)lollipopAnnotationColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopBackgroundColor");
}

- (id)lollipopFieldColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
}

- (double)lollipopExtensionLength
{
  return 14.0;
}

- (void)_addControllerAsChildController:(id)a3
{
  id v4 = a3;
  [(HKAudiogramChartViewController *)self addChildViewController:v4];
  [v4 didMoveToParentViewController:self];
}

- (void)_pinView:(id)a3 toParentGuide:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v8 = [v7 leadingAnchor];
  id v9 = [v6 leadingAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  [(HKAudiogramChartViewController *)self setLeadingMarginConstraint:v10];

  BOOL v11 = [(HKAudiogramChartViewController *)self leadingMarginConstraint];
  [v11 setActive:1];

  id v12 = [v7 trailingAnchor];
  id v13 = [v6 trailingAnchor];
  double v14 = [v12 constraintEqualToAnchor:v13];
  [(HKAudiogramChartViewController *)self setTrailingMarginConstraint:v14];

  uint64_t v15 = [(HKAudiogramChartViewController *)self trailingMarginConstraint];
  [v15 setActive:1];

  uint64_t v16 = [v7 topAnchor];
  uint64_t v17 = [v6 topAnchor];
  uint64_t v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  id v21 = [v7 bottomAnchor];

  double v19 = [v6 bottomAnchor];

  id v20 = [v21 constraintEqualToAnchor:v19];
  [v20 setActive:1];
}

- (id)_findNavigationController
{
  id v3 = [(HKAudiogramChartViewController *)self navigationController];

  if (v3)
  {
    id v4 = [(HKAudiogramChartViewController *)self navigationController];
    goto LABEL_3;
  }
  id v6 = [(HKAudiogramChartViewController *)self view];
  id v4 = [v6 nextResponder];

  if (v4)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v4;
        double v8 = [v7 navigationController];

        if (v8)
        {
          id v4 = [v7 navigationController];

          break;
        }
      }
      uint64_t v9 = [v4 nextResponder];

      id v4 = (void *)v9;
    }
    while (v9);
  }
LABEL_3:
  return v4;
}

- (id)_indexPathForCurrentSelections
{
  int64_t selectedOverlayEar = self->_selectedOverlayEar;
  if (selectedOverlayEar == 2)
  {
    uint64_t v3 = 1;
    goto LABEL_5;
  }
  if (selectedOverlayEar == 1)
  {
    uint64_t v3 = 0;
LABEL_5:
    id v4 = [MEMORY[0x1E4F28D58] indexPathForRow:v3 inSection:0];
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:
  return v4;
}

- (HKOverlayRoomApplicationItems)applicationItems
{
  return self->_applicationItems;
}

- (void)setApplicationItems:(id)a3
{
}

- (NSMutableArray)audiograms
{
  return self->_audiograms;
}

- (void)_setAudiograms:(id)a3
{
}

- (int64_t)currentAudiogramIndex
{
  return self->_currentAudiogramIndex;
}

- (void)setCurrentAudiogramIndex:(int64_t)a3
{
  self->_unint64_t currentAudiogramIndex = a3;
}

- (double)chartHeight
{
  return self->_chartHeight;
}

- (void)setChartHeight:(double)a3
{
  self->_chartHeight = a3;
}

- (HKScalarGraphCollectionViewController)scalarGraphCollectionController
{
  return self->_scalarGraphCollectionController;
}

- (void)setScalarGraphCollectionController:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSLayoutConstraint)stackViewHeightConstraint
{
  return self->_stackViewHeightConstraint;
}

- (void)setStackViewHeightConstraint:(id)a3
{
}

- (UIStackView)contextStackView
{
  return self->_contextStackView;
}

- (void)setContextStackView:(id)a3
{
}

- (HKDisplayTypeSectionedContextView)contextView
{
  return self->_contextView;
}

- (void)setContextView:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (HKInteractiveChartAnnotationView)currentValueView
{
  return self->_currentValueView;
}

- (void)setCurrentValueView:(id)a3
{
}

- (HKAudiogramCurrentValueViewDataSource)currentValueViewDataSource
{
  return self->_currentValueViewDataSource;
}

- (void)setCurrentValueViewDataSource:(id)a3
{
}

- (HKAudiogramAnnotationViewDataSource)annotationViewDataSource
{
  return self->_annotationViewDataSource;
}

- (void)setAnnotationViewDataSource:(id)a3
{
}

- (int64_t)selectedOverlayEar
{
  return self->_selectedOverlayEar;
}

- (void)setSelectedOverlayEar:(int64_t)a3
{
  self->_int64_t selectedOverlayEar = a3;
}

- (HKLollipopController)lollipopController
{
  return self->_lollipopController;
}

- (void)setLollipopController:(id)a3
{
}

- (BOOL)audiogramsFetched
{
  return self->_audiogramsFetched;
}

- (void)setAudiogramsFetched:(BOOL)a3
{
  self->_audiogramsFetched = a3;
}

- (NSLayoutConstraint)leadingMarginConstraint
{
  return self->_leadingMarginConstraint;
}

- (void)setLeadingMarginConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return self->_trailingMarginConstraint;
}

- (void)setTrailingMarginConstraint:(id)a3
{
}

- (HKFeatureStatusManager)hearingTestFeatureStatus
{
  return self->_hearingTestFeatureStatus;
}

- (void)setHearingTestFeatureStatus:(id)a3
{
}

- (NSArray)factorDisplayTypes
{
  return self->_factorDisplayTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorDisplayTypes, 0);
  objc_storeStrong((id *)&self->_hearingTestFeatureStatus, 0);
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_lollipopController, 0);
  objc_storeStrong((id *)&self->_annotationViewDataSource, 0);
  objc_storeStrong((id *)&self->_currentValueViewDataSource, 0);
  objc_storeStrong((id *)&self->_currentValueView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_contextView, 0);
  objc_storeStrong((id *)&self->_contextStackView, 0);
  objc_storeStrong((id *)&self->_stackViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scalarGraphCollectionController, 0);
  objc_storeStrong((id *)&self->_audiograms, 0);
  objc_storeStrong((id *)&self->_applicationItems, 0);
}

+ (BOOL)testChartPointCreation:(id)a3 leftEarSeries:(BOOL)a4 expectedChartPoints:(id)a5 failureMessage:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = +[HKAudiogramChartPoint chartPointsFromSensitivityPoints:a3 isLeftEar:v7];
  id v11 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v11 setNumberStyle:1];
  id v12 = [v9 componentsSeparatedByString:@";"];
  uint64_t v13 = [v12 count];
  if (v13 != [v10 count])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Expected point count doesn't match actual point count: %ld != %ld", objc_msgSend(v12, "count"), objc_msgSend(v10, "count"));
    BOOL v37 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v14)
  {
    BOOL v37 = 1;
    goto LABEL_19;
  }
  uint64_t v15 = v14;
  v41 = a6;
  uint64_t v16 = 0;
  uint64_t v17 = *(void *)v46;
  long long v42 = v12;
  id v43 = v9;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v46 != v17) {
        objc_enumerationMutation(obj);
      }
      double v19 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      id v20 = [v19 componentsSeparatedByString:@","];
      if ([v20 count] != 2)
      {
        [NSString stringWithFormat:@"Point does not have two coordinates: '%@'", v19, v39, v40];
LABEL_18:
        id *v41 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v37 = 0;
        id v12 = v42;
        id v9 = v43;
        goto LABEL_19;
      }
      id v21 = [v20 objectAtIndexedSubscript:0];
      uint64_t v22 = [v11 numberFromString:v21];
      [v22 doubleValue];
      double v24 = v23;

      id v25 = [v20 objectAtIndexedSubscript:1];
      double v26 = [v11 numberFromString:v25];
      [v26 doubleValue];
      double v28 = v27;

      v29 = [v10 objectAtIndexedSubscript:v16 + i];
      id v30 = [v29 xValueAsGenericType];
      [v30 doubleValue];
      double v32 = v31;

      v33 = [v10 objectAtIndexedSubscript:v16 + i];
      uint64_t v34 = [v33 yValue];
      [v34 doubleValue];
      double v36 = v35;

      if (vabdd_f64(v24, v32) > 0.000001)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"X value mismatch (slot %ld): %lg != %lg", v16 + i, *(void *)&v24, *(void *)&v32);
        goto LABEL_18;
      }
      if (vabdd_f64(v28, v36) > 0.000001)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Y value mismatch (slot %ld: %lg != %lg"), v16 + i, *(void *)&v28, *(void *)&v36;
        goto LABEL_18;
      }
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    v16 += i;
    BOOL v37 = 1;
    id v12 = v42;
    id v9 = v43;
    if (v15) {
      continue;
    }
    break;
  }
LABEL_19:

LABEL_20:
  return v37;
}

- (void)_updateAudiogramSamples:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to retrieve audiograms: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end