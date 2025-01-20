@interface HKSingleAudiogramChartViewController
+ (id)_itemForHearingLossInfographicJapanDisclaimer;
+ (id)_itemForHearingLossInfographicWithHearingLossClassification:(unint64_t)a3;
+ (id)_itemForTitle:(id)a3 description:(id)a4;
+ (id)_localizedDescriptionForClassification:(unint64_t)a3;
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
+ (id)hearingLossInfographicViewController;
- (BOOL)_hasAudiogramData;
- (BOOL)_shouldShowEnhancedUI;
- (BOOL)_shouldShowManualIngestionUI;
- (BOOL)audiogramsFetched;
- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3;
- (BOOL)hideEnhancedUI;
- (BOOL)isManualIngestion;
- (BOOL)isStatic;
- (HKAudiogramAnalyticsManager)analyticsManager;
- (HKAudiogramAnnotationViewDataSource)annotationViewDataSource;
- (HKAudiogramCurrentValueViewDataSource)currentValueViewDataSource;
- (HKAudiogramSample)audiogram;
- (HKDisplayTypeSectionedContextView)contextView;
- (HKFeatureStatusManager)hearingTestFeatureStatus;
- (HKInteractiveChartAnnotationView)currentValueView;
- (HKLollipopController)lollipopController;
- (HKOverlayRoomApplicationItems)applicationItems;
- (HKScalarGraphViewController)scalarGraphViewController;
- (HKSingleAudiogramChartViewController)initWithApplicationItems:(id)a3 staticAudiogram:(id)a4 factorDisplayTypes:(id)a5;
- (HKSingleAudiogramChartViewController)initWithApplicationItems:(id)a3 staticAudiogram:(id)a4 factorDisplayTypes:(id)a5 chartHeight:(double)a6 hideEnhancedUI:(BOOL)a7;
- (HKSingleAudiogramChartViewController)initWithApplicationItems:(id)a3 staticAudiogram:(id)a4 factorDisplayTypes:(id)a5 hideEnhancedUI:(BOOL)a6;
- (HKSingleAudiogramChartViewController)initWithHealthStore:(id)a3 staticAudiogram:(id)a4 selectedFrequency:(id)a5;
- (NSArray)factorDisplayTypes;
- (NSArray)graphSeriesCache;
- (NSArray)sections;
- (NSLayoutConstraint)leadingMarginConstraint;
- (NSLayoutConstraint)stackViewHeightConstraint;
- (NSLayoutConstraint)trailingMarginConstraint;
- (NSNumber)selectedFrequency;
- (NSString)chartOverlayVersion;
- (UIStackView)stackView;
- (double)chartHeight;
- (double)lollipopBackgroundViewCornerRadius;
- (double)lollipopExtensionLength;
- (id)_annotationForFrequencyString:(id)a3;
- (id)_attributedLabelTextOverrideWithHearingLevelClassification:(id)a3 valueAndUnit:(id)a4 metricColors:(id)a5 selectedMetricColors:(id)a6;
- (id)_attributedLabelTextWithHearingLevelClassification:(id)a3 valueAndUnit:(id)a4 metricColors:(id)a5 selectedMetricColors:(id)a6 isSelected:(BOOL)a7;
- (id)_audiogramDisplayType;
- (id)_audiogramPureToneAveragePointsSeriesWithSensitivityPoints:(id)a3 selectedFrequency:(id)a4 seriesEar:(int64_t)a5;
- (id)_audiogramPureToneAveragePointsSeriesWithSensitivityPoints:(id)a3 seriesEar:(int64_t)a4;
- (id)_audiogramSeriesWithSensitivityPoints:(id)a3 seriesEar:(int64_t)a4 disabledStyleOverride:(BOOL)a5;
- (id)_averageLevelOverlaySeriesWithAudiogram:(id)a3 selectedEar:(int64_t)a4;
- (id)_averageSectionFromAudiogram:(id)a3;
- (id)_buildContextItemForEar:(int64_t)a3 metrics:(id)a4;
- (id)_earSpecificColorForEar:(int64_t)a3;
- (id)_findNavigationController;
- (id)_formattedFrequencyStringForFrequency:(double)a3;
- (id)_healthStore;
- (id)_indexPathForCurrentSelections;
- (id)_sectionsFromAudiogram:(id)a3;
- (id)_setupSeriesForAudiogramSample:(id)a3;
- (id)_unitController;
- (id)_updateController;
- (id)graphSeries;
- (id)lollipopAnnotationColor;
- (id)lollipopFieldColor;
- (id)newGraphViewController;
- (id)seriesSelectionLineColorForGraphView:(id)a3;
- (int64_t)selectedOverlayEar;
- (int64_t)stackCountForGraphView:(id)a3;
- (void)_addContextView;
- (void)_addControllerAsChildController:(id)a3;
- (void)_addHorizontalAxisAnnotationToGraphView:(id)a3 forSelectedFrequency:(id)a4;
- (void)_addShowMoreDataButton:(id)a3;
- (void)_pinView:(id)a3 toParentGuide:(id)a4 pinBottom:(BOOL)a5;
- (void)_resetCurrentGraph;
- (void)_setNeedsReloadSeries;
- (void)_setupFixedFrequencyAxisForGraphView:(id)a3;
- (void)_showMoreData:(id)a3;
- (void)_updateAudiogramSample:(id)a3 error:(id)a4;
- (void)_updateHeaderState;
- (void)_updateOverlayPillsAndHeader;
- (void)contextView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)didTapOnInfoButtonFromCurrentValueView:(id)a3;
- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4;
- (void)graphViewDidEndSelection:(id)a3;
- (void)queryForAudiogram;
- (void)redrawCurrentCell;
- (void)setAnalyticsManager:(id)a3;
- (void)setAnnotationViewDataSource:(id)a3;
- (void)setApplicationItems:(id)a3;
- (void)setAudiogram:(id)a3;
- (void)setAudiogramsFetched:(BOOL)a3;
- (void)setChartHeight:(double)a3;
- (void)setContextView:(id)a3;
- (void)setCurrentValueView:(id)a3;
- (void)setCurrentValueViewDataSource:(id)a3;
- (void)setGraphSeriesCache:(id)a3;
- (void)setHearingTestFeatureStatus:(id)a3;
- (void)setHideEnhancedUI:(BOOL)a3;
- (void)setIsManualIngestion:(BOOL)a3;
- (void)setIsStatic:(BOOL)a3;
- (void)setLeadingMarginConstraint:(id)a3;
- (void)setLollipopController:(id)a3;
- (void)setScalarGraphViewController:(id)a3;
- (void)setSections:(id)a3;
- (void)setSelectedFrequency:(id)a3;
- (void)setSelectedOverlayEar:(int64_t)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewHeightConstraint:(id)a3;
- (void)setTrailingMarginConstraint:(id)a3;
- (void)updateAnnotationDataSource:(id)a3 pointContexts:(id)a4;
- (void)updateStaticAudiogram:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKSingleAudiogramChartViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v13 = a10;
  id v14 = a5;
  v15 = (void *)[objc_alloc((Class)a1) initWithApplicationItems:v14 staticAudiogram:0 factorDisplayTypes:v13 chartHeight:0 hideEnhancedUI:350.0];

  [v15 queryForAudiogram];
  return v15;
}

- (HKSingleAudiogramChartViewController)initWithApplicationItems:(id)a3 staticAudiogram:(id)a4 factorDisplayTypes:(id)a5
{
  return [(HKSingleAudiogramChartViewController *)self initWithApplicationItems:a3 staticAudiogram:a4 factorDisplayTypes:a5 chartHeight:0 hideEnhancedUI:350.0];
}

- (HKSingleAudiogramChartViewController)initWithApplicationItems:(id)a3 staticAudiogram:(id)a4 factorDisplayTypes:(id)a5 hideEnhancedUI:(BOOL)a6
{
  return [(HKSingleAudiogramChartViewController *)self initWithApplicationItems:a3 staticAudiogram:a4 factorDisplayTypes:a5 chartHeight:a6 hideEnhancedUI:350.0];
}

- (HKSingleAudiogramChartViewController)initWithHealthStore:(id)a3 staticAudiogram:(id)a4 selectedFrequency:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc_init(HKOverlayRoomApplicationItems);
  id v13 = [[HKUnitPreferenceController alloc] initWithHealthStore:v11];
  [(HKOverlayRoomApplicationItems *)v12 setUnitController:v13];

  id v14 = [[HKSampleTypeUpdateController alloc] initWithHealthStore:v11];
  [(HKOverlayRoomApplicationItems *)v12 setSampleTypeUpdateController:v14];

  v15 = +[HKDisplayTypeController sharedInstanceForHealthStore:v11];
  [(HKOverlayRoomApplicationItems *)v12 setDisplayTypeController:v15];

  [(HKOverlayRoomApplicationItems *)v12 setHealthStore:v11];
  v16 = [(HKSingleAudiogramChartViewController *)self initWithApplicationItems:v12 staticAudiogram:v10 factorDisplayTypes:0 chartHeight:1 hideEnhancedUI:350.0];

  if (v16)
  {
    v16->_isStatic = 1;
    v16->_isManualIngestion = 1;
    objc_storeStrong((id *)&v16->_selectedFrequency, a5);
  }

  return v16;
}

- (HKSingleAudiogramChartViewController)initWithApplicationItems:(id)a3 staticAudiogram:(id)a4 factorDisplayTypes:(id)a5 chartHeight:(double)a6 hideEnhancedUI:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v35.receiver = self;
  v35.super_class = (Class)HKSingleAudiogramChartViewController;
  v16 = [(HKSingleAudiogramChartViewController *)&v35 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_applicationItems, a3);
    v17->_chartHeight = a6;
    objc_storeStrong((id *)&v17->_audiogram, a4);
    currentValueView = v17->_currentValueView;
    v17->_currentValueView = 0;

    currentValueViewDataSource = v17->_currentValueViewDataSource;
    v17->_currentValueViewDataSource = 0;

    annotationViewDataSource = v17->_annotationViewDataSource;
    v17->_annotationViewDataSource = 0;

    v17->_selectedOverlayEar = 0;
    sections = v17->_sections;
    v17->_sections = 0;

    v17->_audiogramsFetched = v14 != 0;
    v17->_isStatic = v14 != 0;
    v22 = [(HKSingleAudiogramChartViewController *)v17 navigationItem];
    [v22 setLargeTitleDisplayMode:2];

    id v23 = objc_alloc(MEMORY[0x1E4F2B068]);
    uint64_t v24 = *MEMORY[0x1E4F29D50];
    v25 = [v13 healthStore];
    uint64_t v26 = [v23 initWithFeatureIdentifier:v24 healthStore:v25];
    hearingTestFeatureStatus = v17->_hearingTestFeatureStatus;
    v17->_hearingTestFeatureStatus = (HKFeatureStatusManager *)v26;

    objc_storeStrong((id *)&v17->_factorDisplayTypes, a5);
    v17->_hideEnhancedUI = a7;
    selectedFrequency = v17->_selectedFrequency;
    v17->_selectedFrequency = 0;

    graphSeriesCache = v17->_graphSeriesCache;
    v17->_graphSeriesCache = (NSArray *)MEMORY[0x1E4F1CBF0];

    v30 = [HKAudiogramAnalyticsManager alloc];
    v31 = [(HKOverlayRoomApplicationItems *)v17->_applicationItems healthStore];
    uint64_t v32 = [(HKAudiogramAnalyticsManager *)v30 initWithHealthStore:v31];
    analyticsManager = v17->_analyticsManager;
    v17->_analyticsManager = (HKAudiogramAnalyticsManager *)v32;
  }
  return v17;
}

- (void)dealloc
{
  v3 = [(HKSingleAudiogramChartViewController *)self _updateController];
  v4 = [MEMORY[0x1E4F2B448] audiogramSampleType];
  [v3 removeObserver:self forType:v4];

  v5.receiver = self;
  v5.super_class = (Class)HKSingleAudiogramChartViewController;
  [(HKSingleAudiogramChartViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (![(HKSingleAudiogramChartViewController *)self isStatic])
  {
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E4F29F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v68 = self;
      _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Chart is not static, starting update observer.", buf, 0xCu);
    }
    v4 = [(HKSingleAudiogramChartViewController *)self _updateController];
    objc_super v5 = [MEMORY[0x1E4F2B448] audiogramSampleType];
    [v4 addObserver:self forType:v5];

    [(HKSingleAudiogramChartViewController *)self queryForAudiogram];
  }
  v65.receiver = self;
  v65.super_class = (Class)HKSingleAudiogramChartViewController;
  [(HKSingleAudiogramChartViewController *)&v65 viewDidLoad];
  id v6 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v7 = (UIStackView *)[v6 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  stackView = self->_stackView;
  self->_stackView = v7;

  [(UIStackView *)self->_stackView setAxis:1];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setDistribution:0];
  id v9 = self->_stackView;
  id v10 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(UIStackView *)v9 setBackgroundColor:v10];

  id v11 = [(UIStackView *)self->_stackView layer];
  [v11 setCornerRadius:20.0];

  if (![(HKSingleAudiogramChartViewController *)self _shouldShowManualIngestionUI])
  {
    v12 = [HKAudiogramCurrentValueViewDataSource alloc];
    id v13 = [(HKSingleAudiogramChartViewController *)self applicationItems];
    id v14 = [(HKAudiogramCurrentValueViewDataSource *)v12 initWithApplicationItems:v13];
    [(HKSingleAudiogramChartViewController *)self setCurrentValueViewDataSource:v14];

    id v15 = [[HKInteractiveChartAnnotationView alloc] initWithContext:0];
    [(HKSingleAudiogramChartViewController *)self setCurrentValueView:v15];

    v16 = [(HKSingleAudiogramChartViewController *)self currentValueView];
    objc_msgSend(v16, "setShowsInfoButton:", -[HKSingleAudiogramChartViewController _shouldShowManualIngestionUI](self, "_shouldShowManualIngestionUI") ^ 1);

    v17 = [(HKSingleAudiogramChartViewController *)self currentValueView];
    [v17 setDelegate:self];

    v18 = [(HKSingleAudiogramChartViewController *)self currentValueViewDataSource];
    v19 = [(HKSingleAudiogramChartViewController *)self currentValueView];
    [v19 setDataSource:v18];

    v20 = [(HKSingleAudiogramChartViewController *)self stackView];
    v21 = [(HKSingleAudiogramChartViewController *)self currentValueView];
    [v20 addArrangedSubview:v21];

    v22 = [(HKSingleAudiogramChartViewController *)self currentValueView];
    id v23 = [v22 heightAnchor];
    uint64_t v24 = [v23 constraintEqualToConstant:90.0];
    [v24 setActive:1];
  }
  id v25 = [(HKSingleAudiogramChartViewController *)self newGraphViewController];
  [(HKSingleAudiogramChartViewController *)self setScalarGraphViewController:v25];

  uint64_t v26 = [(HKSingleAudiogramChartViewController *)self scalarGraphViewController];
  v27 = [v26 view];
  v28 = [v27 heightAnchor];
  [(HKSingleAudiogramChartViewController *)self chartHeight];
  v29 = objc_msgSend(v28, "constraintEqualToConstant:");
  [v29 setActive:1];

  v30 = [(HKSingleAudiogramChartViewController *)self scalarGraphViewController];
  [(HKSingleAudiogramChartViewController *)self _addControllerAsChildController:v30];

  v31 = [(HKSingleAudiogramChartViewController *)self stackView];
  uint64_t v32 = [(HKSingleAudiogramChartViewController *)self scalarGraphViewController];
  v33 = [v32 view];
  [v31 addArrangedSubview:v33];

  if (![(HKSingleAudiogramChartViewController *)self _shouldShowManualIngestionUI]) {
    [(HKSingleAudiogramChartViewController *)self _addContextView];
  }
  if ([(HKSingleAudiogramChartViewController *)self _shouldShowManualIngestionUI])
  {
    [(UIStackView *)self->_stackView setLayoutMarginsRelativeArrangement:1];
    -[UIStackView setLayoutMargins:](self->_stackView, "setLayoutMargins:", 20.0, 0.0, 20.0, 0.0);
  }
  v34 = [(HKSingleAudiogramChartViewController *)self view];
  [v34 addSubview:self->_stackView];

  objc_super v35 = [(HKSingleAudiogramChartViewController *)self stackView];
  v36 = [v35 heightAnchor];
  [(HKSingleAudiogramChartViewController *)self chartHeight];
  double v38 = v37;
  v39 = [(HKSingleAudiogramChartViewController *)self currentValueView];
  [v39 frame];
  v41 = [v36 constraintGreaterThanOrEqualToConstant:v38 + v40];
  stackViewHeightConstraint = self->_stackViewHeightConstraint;
  self->_stackViewHeightConstraint = v41;

  [(NSLayoutConstraint *)self->_stackViewHeightConstraint setActive:1];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v43 = [(UIStackView *)self->_stackView arrangedSubviews];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v44)
  {
    uint64_t v46 = v44;
    uint64_t v47 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v62 != v47) {
          objc_enumerationMutation(v43);
        }
        v49 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        LODWORD(v45) = 1148846080;
        [v49 setContentCompressionResistancePriority:1 forAxis:v45];
        LODWORD(v50) = 1148846080;
        [v49 setContentHuggingPriority:1 forAxis:v50];
      }
      uint64_t v46 = [v43 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v46);
  }

  if ([(HKSingleAudiogramChartViewController *)self _shouldShowEnhancedUI]) {
    [(HKSingleAudiogramChartViewController *)self _addShowMoreDataButton:self->_stackView];
  }
  v51 = self->_stackView;
  v52 = [(HKSingleAudiogramChartViewController *)self view];
  v53 = [v52 safeAreaLayoutGuide];
  [(HKSingleAudiogramChartViewController *)self _pinView:v51 toParentGuide:v53 pinBottom:1];

  v54 = [HKAudiogramAnnotationViewDataSource alloc];
  v55 = [(HKSingleAudiogramChartViewController *)self applicationItems];
  v56 = [(HKAudiogramAnnotationViewDataSource *)v54 initWithApplicationItems:v55];
  [(HKSingleAudiogramChartViewController *)self setAnnotationViewDataSource:v56];

  v57 = [HKLollipopController alloc];
  v58 = [(HKSingleAudiogramChartViewController *)self annotationViewDataSource];
  v59 = [(HKSingleAudiogramChartViewController *)self stackView];
  v60 = [(HKLollipopController *)v57 initWithAnnotationDataSource:v58 parentView:v59 delegate:self];
  [(HKSingleAudiogramChartViewController *)self setLollipopController:v60];

  if (self->_audiogramsFetched) {
    [(HKSingleAudiogramChartViewController *)self _updateOverlayPillsAndHeader];
  }
}

- (void)_addContextView
{
  v3 = [[HKDisplayTypeSectionedContextView alloc] initWithStyle:2];
  contextView = self->_contextView;
  self->_contextView = v3;

  [(HKDisplayTypeSectionedContextView *)self->_contextView setUseBottomInsets:[(HKSingleAudiogramChartViewController *)self _shouldShowEnhancedUI] ^ 1];
  [(HKDisplayTypeSectionedContextView *)self->_contextView setUseHorizontalInsets:1];
  [(HKDisplayTypeSectionedContextView *)self->_contextView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HKDisplayTypeSectionedContextView *)self->_contextView setDelegate:self];
  [(UIStackView *)self->_stackView addArrangedSubview:self->_contextView];
  [(HKDisplayTypeSectionedContextView *)self->_contextView setSemanticContentAttribute:3];
  objc_super v5 = self->_contextView;
  id v6 = [(HKSingleAudiogramChartViewController *)self _sectionsFromAudiogram:0];
  [(HKDisplayTypeSectionedContextView *)v5 setDisplayTypeContextSections:v6];
}

- (BOOL)_shouldShowEnhancedUI
{
  if ([(HKSingleAudiogramChartViewController *)self hideEnhancedUI]) {
    return 0;
  }
  else {
    return ![(HKSingleAudiogramChartViewController *)self _shouldShowManualIngestionUI];
  }
}

- (BOOL)_shouldShowManualIngestionUI
{
  return self->_isManualIngestion;
}

- (void)_addShowMoreDataButton:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB14D0];
  id v5 = a3;
  objc_msgSend(v4, "hk_chartShowMoreDataButtonWithTitleOverride:target:action:", 0, self, sel__showMoreData_);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1144750080;
  [v10 setContentHuggingPriority:1 forAxis:v6];
  v7 = [v5 arrangedSubviews];
  v8 = [v5 arrangedSubviews];
  id v9 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 1);

  [v5 addArrangedSubview:v10];
  [v5 setCustomSpacing:v9 afterView:0.0];
}

- (void)_showMoreData:(id)a3
{
  id v11 = [(HKSingleAudiogramChartViewController *)self _findNavigationController];
  if (v11)
  {
    v4 = [(HKSingleAudiogramChartViewController *)self applicationItems];
    id v5 = [v4 timeScopeController];
    [v5 setSelectedTimeScope:2];

    double v6 = [HKAudiogramLongitudinalOverlayRoomViewController alloc];
    v7 = [(HKSingleAudiogramChartViewController *)self applicationItems];
    v8 = [(HKSingleAudiogramChartViewController *)self factorDisplayTypes];
    id v9 = [(HKAudiogramLongitudinalOverlayRoomViewController *)v6 initWithApplicationItems:v7 factorDisplayTypes:v8];

    id v10 = [[HKModalNavigationController alloc] initWithRootViewController:v9];
    objc_msgSend(v11, "hk_presentModalCardViewController:fullScreen:animated:completion:", v10, 1, 1, 0);
  }
}

- (void)queryForAudiogram
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E4F29F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F40], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Query for recent audiogram called.", buf, 0xCu);
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9A0] ascending:0];
  id v15 = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

  id v7 = objc_alloc(MEMORY[0x1E4F2B440]);
  v8 = [MEMORY[0x1E4F2B448] audiogramSampleType];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__HKSingleAudiogramChartViewController_queryForAudiogram__block_invoke;
  v12[3] = &unk_1E6D57080;
  id v13 = v4;
  id v14 = self;
  id v9 = v4;
  id v10 = (void *)[v7 initWithSampleType:v8 predicate:0 limit:1 sortDescriptors:v6 resultsHandler:v12];

  id v11 = [(HKSingleAudiogramChartViewController *)self _healthStore];
  [v11 executeQuery:v10];
}

void __57__HKSingleAudiogramChartViewController_queryForAudiogram__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [*(id *)(a1 + 32) timeIntervalSinceNow];
    id v9 = *(void **)(*(void *)(a1 + 40) + 1136);
    id v10 = +[HKAudiogramPerformanceAnalytics metricForAudiogramQueryWithQueryDuration:audiogramCount:](HKAudiogramPerformanceAnalytics, "metricForAudiogramQueryWithQueryDuration:audiogramCount:", [v6 count], -v8);
    [v9 submitPerformanceAnalyticsWithMetric:v10];

    id v11 = *(void **)(a1 + 40);
    v12 = [v6 firstObject];
    [v11 _updateAudiogramSample:v12 error:v7];
  }
  else
  {
    _HKInitializeLogging();
    id v13 = *MEMORY[0x1E4F29F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F40], OS_LOG_TYPE_ERROR)) {
      __57__HKSingleAudiogramChartViewController_queryForAudiogram__block_invoke_cold_1(a1, (uint64_t)v7, v13);
    }
  }
}

- (void)updateStaticAudiogram:(id)a3
{
  id v4 = a3;
  if ([(HKSingleAudiogramChartViewController *)self isStatic])
  {
    [(HKSingleAudiogramChartViewController *)self setAudiogram:v4];
    [(HKSingleAudiogramChartViewController *)self _updateOverlayPillsAndHeader];
  }
}

- (void)_updateAudiogramSample:(id)a3 error:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HKSingleAudiogramChartViewController__updateAudiogramSample_error___block_invoke;
  v7[3] = &unk_1E6D513B0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __69__HKSingleAudiogramChartViewController__updateAudiogramSample_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 979) = 1;
  v3 = [*(id *)(a1 + 32) audiogram];
  if (v3 && *(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) audiogram];
    id v5 = [v4 UUID];
    id v6 = [v5 UUIDString];
    id v7 = [*(id *)(a1 + 40) UUID];
    id v8 = [v7 UUIDString];
    int v2 = [v6 isEqualToString:v8] ^ 1;
  }
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F40], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    uint64_t v11 = *(void *)(a1 + 32);
    if (v2) {
      id v10 = @"YES";
    }
    int v12 = 138543618;
    uint64_t v13 = v11;
    __int16 v14 = 2114;
    id v15 = v10;
    _os_log_impl(&dword_1E0B26000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Should replace audiogram sample: %{public}@.", (uint8_t *)&v12, 0x16u);
  }
  if (v2)
  {
    [*(id *)(a1 + 32) setAudiogram:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _updateOverlayPillsAndHeader];
  }
}

- (BOOL)_hasAudiogramData
{
  return self->_audiogram != 0;
}

- (id)_audiogramDisplayType
{
  int v2 = [(HKSingleAudiogramChartViewController *)self applicationItems];
  v3 = [v2 displayTypeController];
  id v4 = [MEMORY[0x1E4F2B448] audiogramSampleType];
  id v5 = [v3 displayTypeForObjectType:v4];

  return v5;
}

- (id)_healthStore
{
  int v2 = [(HKSingleAudiogramChartViewController *)self applicationItems];
  v3 = [v2 healthStore];

  return v3;
}

- (id)_unitController
{
  int v2 = [(HKSingleAudiogramChartViewController *)self applicationItems];
  v3 = [v2 unitController];

  return v3;
}

- (id)_updateController
{
  int v2 = [(HKSingleAudiogramChartViewController *)self applicationItems];
  v3 = [v2 sampleTypeUpdateController];

  return v3;
}

- (id)_sectionsFromAudiogram:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HKSingleAudiogramChartViewController *)self _averageSectionFromAudiogram:a3];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)_averageSectionFromAudiogram:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 hearingLevelSummary];
  id v6 = [v5 leftEarMetrics];
  id v7 = [(HKSingleAudiogramChartViewController *)self _buildContextItemForEar:1 metrics:v6];

  id v8 = [v4 hearingLevelSummary];

  id v9 = [v8 rightEarMetrics];
  id v10 = [(HKSingleAudiogramChartViewController *)self _buildContextItemForEar:2 metrics:v9];

  uint64_t v11 = objc_alloc_init(_HKDisplayTypeAudiogramContextItemSection2);
  [(_HKDisplayTypeAudiogramContextItemSection2 *)v11 setTitle:0];
  v14[0] = v7;
  v14[1] = v10;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [(_HKDisplayTypeAudiogramContextItemSection2 *)v11 setItems:v12];

  return v11;
}

- (id)_buildContextItemForEar:(int64_t)a3 metrics:(id)a4
{
  id v6 = a4;
  id v7 = [(HKSingleAudiogramChartViewController *)self _earSpecificColorForEar:a3];
  id v8 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  id v9 = +[HKUIMetricColors defaultContextViewColorsUsingColor:v8];

  id v10 = +[HKUIMetricColors categoryColorsWithColor:v7];
  uint64_t v11 = objc_alloc_init(HKDisplayTypeContextAudiogramItem2);
  [(HKDisplayTypeContextItem *)v11 setInfoHidden:1];
  [(HKDisplayTypeContextItem *)v11 setMetricColors:v9];
  [(HKDisplayTypeContextItem *)v11 setSelectedMetricColors:v10];
  [(HKDisplayTypeContextAudiogramItem2 *)v11 setEar:a3];
  if (a3 == 1) {
    int v12 = @"LeftAverage";
  }
  else {
    int v12 = @"RightAverage";
  }
  if (a3 == 1) {
    uint64_t v13 = @"LEFT_AVERAGE_HEARING";
  }
  else {
    uint64_t v13 = @"RIGHT_AVERAGE_HEARING";
  }
  __int16 v14 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", v12);
  [(HKDisplayTypeContextItem *)v11 setAccessibilityIdentifier:v14];

  id v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v16 = [v15 localizedStringForKey:v13 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [(HKDisplayTypeContextItem *)v11 setTitle:v16];

  v17 = [v6 averageSensitivity];
  if (v17)
  {
    uint64_t v32 = HKIntegerFormatter();
    [v17 _unit];
    uint64_t v18 = v33 = self;
    [v17 doubleValueForUnit:v18];
    double v20 = v19;

    v21 = [NSNumber numberWithDouble:v20];
    v22 = [v32 stringFromNumber:v21];

    [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v23 = v34 = v7;
    uint64_t v24 = [v23 localizedStringForKey:@"DECIBELS_HEARING_NUMBERLESS_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    [(HKDisplayTypeContextItem *)v11 setValue:v22];
    [(HKDisplayTypeContextItem *)v11 setUnit:v24];
    id v25 = [v6 averageSensitivity];
    HKHearingLevelClassificationForSensitivity();
    id v26 = v6;

    v27 = HKLocalizedStringForHearingLevelClassification();
    v28 = HKFormatValueAndUnit(v22, v24);
    v29 = [(HKSingleAudiogramChartViewController *)v33 _attributedLabelTextOverrideWithHearingLevelClassification:v27 valueAndUnit:v28 metricColors:v9 selectedMetricColors:v10];
    [(HKDisplayTypeContextItem *)v11 setAttributedLabelTextOverride:v29];

    v30 = v32;
    id v6 = v26;

    id v7 = v34;
  }
  else
  {
    v30 = HKUILocalizedString(@"NO_DATA");
    [(HKDisplayTypeContextItem *)v11 setValue:v30];
  }

  return v11;
}

- (id)_attributedLabelTextOverrideWithHearingLevelClassification:(id)a3 valueAndUnit:(id)a4 metricColors:(id)a5 selectedMetricColors:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  __int16 v14 = [(HKSingleAudiogramChartViewController *)self _attributedLabelTextWithHearingLevelClassification:v13 valueAndUnit:v12 metricColors:v11 selectedMetricColors:v10 isSelected:0];
  id v15 = [(HKSingleAudiogramChartViewController *)self _attributedLabelTextWithHearingLevelClassification:v13 valueAndUnit:v12 metricColors:v11 selectedMetricColors:v10 isSelected:1];

  uint64_t v16 = +[HKDisplayTypeContextItemAttributedLabelOverride attributedLabelOverrideWithText:v14 selectedText:v15];

  return v16;
}

- (id)_attributedLabelTextWithHearingLevelClassification:(id)a3 valueAndUnit:(id)a4 metricColors:(id)a5 selectedMetricColors:(id)a6 isSelected:(BOOL)a7
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = NSString;
  id v15 = (void *)MEMORY[0x1E4F28B50];
  id v16 = a3;
  v17 = [v15 bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v18 = [v17 localizedStringForKey:@"HEARING_LEVEL_CLASSIFICATION_%@_AND_AVERAGE_FORMAT_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
  double v19 = objc_msgSend(v14, "localizedStringWithFormat:", v18, v16, v11);

  uint64_t v32 = v13;
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
  v21 = };
  uint64_t v22 = [v19 rangeOfString:v11];
  uint64_t v24 = v23;
  id v25 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v34 = *MEMORY[0x1E4FB06F8];
  id v26 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemValueAndUnitFont");
  uint64_t v35 = *MEMORY[0x1E4FB0700];
  uint64_t v27 = v35;
  v36[0] = v26;
  v36[1] = v20;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v34 count:2];
  v29 = (void *)[v25 initWithString:v19 attributes:v28];

  objc_msgSend(v29, "addAttribute:value:range:", v27, v21, v22, v24);
  v30 = (void *)[v29 copy];

  return v30;
}

- (void)_updateOverlayPillsAndHeader
{
  [(HKSingleAudiogramChartViewController *)self redrawCurrentCell];
  contextView = self->_contextView;
  if (contextView)
  {
    id v4 = [(HKSingleAudiogramChartViewController *)self audiogram];
    id v5 = [(HKSingleAudiogramChartViewController *)self _sectionsFromAudiogram:v4];
    [(HKDisplayTypeSectionedContextView *)contextView setDisplayTypeContextSections:v5];
  }
  [(HKSingleAudiogramChartViewController *)self _updateHeaderState];
}

- (void)_updateHeaderState
{
  v3 = [(HKSingleAudiogramChartViewController *)self currentValueViewDataSource];
  id v4 = [(HKSingleAudiogramChartViewController *)self audiogram];
  [v3 updateWithAudiogram:v4];

  LODWORD(v3) = [(HKSingleAudiogramChartViewController *)self _hasAudiogramData];
  id v5 = [(HKSingleAudiogramChartViewController *)self currentValueView];
  id v6 = v5;
  if (v3) {
    [v5 reloadData];
  }
  else {
    [v5 showNoDataStatus];
  }
}

- (void)_addHorizontalAxisAnnotationToGraphView:(id)a3 forSelectedFrequency:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    [a4 floatValue];
    double v8 = v7;
    +[HKAudiogramChartPoint axisValueFromFrequency:v7];
    double v10 = v9;
    _formattedFrequencyStringForFrequency(0, 1, v8);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [(HKSingleAudiogramChartViewController *)self _annotationForFrequencyString:v14];
    id v12 = [v6 xAxis];

    id v13 = [NSNumber numberWithDouble:v10];
    [v12 addAxisAnnotation:v11 modelCoordinate:v13];
  }
}

- (id)_annotationForFrequencyString:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB08E0];
  double v4 = *MEMORY[0x1E4FB09D0];
  id v5 = a3;
  id v6 = objc_msgSend(v3, "hk_roundedSystemFontWithSize:weight:", 11.0, v4);
  float v7 = (void *)MEMORY[0x1E4FB08E0];
  [v6 pointSize];
  double v8 = objc_msgSend(v7, "hk_roundedSystemFontWithSize:weight:");
  v13[0] = *MEMORY[0x1E4FB0700];
  double v9 = [MEMORY[0x1E4FB1618] labelColor];
  v13[1] = *MEMORY[0x1E4FB06F8];
  v14[0] = v9;
  v14[1] = v8;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v10];
  return v11;
}

- (id)_formattedFrequencyStringForFrequency:(double)a3
{
  return _formattedFrequencyStringForFrequency(0, 1, a3);
}

- (void)didTapOnInfoButtonFromCurrentValueView:(id)a3
{
  id v4 = [(id)objc_opt_class() hearingLossInfographicViewController];
  [(UIViewController *)self hk_presentModalCardViewController:v4 fullScreen:0 animated:1 completion:0];
}

+ (id)hearingLossInfographicViewController
{
  v21[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  double v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v20 localizedStringForKey:@"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_INTRODUCTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
  id v5 = [a1 _itemForTitle:0 description:v4];
  v21[0] = v5;
  id v6 = [a1 _itemForHearingLossInfographicWithHearingLossClassification:1];
  v21[1] = v6;
  float v7 = [a1 _itemForHearingLossInfographicWithHearingLossClassification:2];
  v21[2] = v7;
  double v8 = [a1 _itemForHearingLossInfographicWithHearingLossClassification:3];
  v21[3] = v8;
  double v9 = [a1 _itemForHearingLossInfographicWithHearingLossClassification:4];
  v21[4] = v9;
  double v10 = [a1 _itemForHearingLossInfographicWithHearingLossClassification:5];
  v21[5] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:6];
  id v12 = (void *)[v3 initWithArray:v11];

  id v13 = HKCurrentLocaleCountryCodeIfUnknown();
  LODWORD(v4) = [v13 isEqualToString:*MEMORY[0x1E4F29948]];

  if (v4)
  {
    id v14 = [a1 _itemForHearingLossInfographicJapanDisclaimer];
    [v12 addObject:v14];
  }
  id v15 = [[HKInfographicViewController alloc] initWithItems:v12];
  id v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v17 = [v16 localizedStringForKey:@"HEARING_LEVEL_CLASSIFICATIONS_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
  [(HKInfographicViewController *)v15 setTitle:v17];

  uint64_t v18 = [[HKModalNavigationController alloc] initWithRootViewController:v15];
  return v18;
}

+ (id)_itemForTitle:(id)a3 description:(id)a4
{
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x1E4F28E48];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  if (v5)
  {
    double v9 = HKInteractiveChartInfographicTitleAttributes();
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v9];
    [v8 appendAttributedString:v10];
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7];

  id v12 = [[HKInfographicContentItem alloc] initWithTitle:v8 description:v11];
  return v12;
}

+ (id)_itemForHearingLossInfographicWithHearingLossClassification:(unint64_t)a3
{
  id v5 = HKLocalizedStringForHearingLevelClassification();
  id v6 = [a1 _localizedDescriptionForClassification:a3];
  id v7 = [a1 _itemForTitle:v5 description:v6];

  return v7;
}

+ (id)_itemForHearingLossInfographicJapanDisclaimer
{
  id v2 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"HEARING_LOSS_INFOGRAPHIC_JAPAN_DISCLAIMER_DESCRIPTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];
  id v5 = HKInteractiveChartInfographicFootnoteAttributes();
  id v6 = (void *)[v2 initWithString:v4 attributes:v5];

  id v7 = [[HKInfographicTextItem alloc] initWithDescription:v6];
  return v7;
}

+ (id)_localizedDescriptionForClassification:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v5 = [v4 usesMetricSystem];

  switch(a3)
  {
    case 1uLL:
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v7 = v6;
      id v8 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_NO_IMPAIRMENT";
      double v9 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_NO_IMPAIRMENT_METRIC";
      goto LABEL_8;
    case 2uLL:
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v7 = v6;
      id v8 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_MILD_IMPAIRMENT";
      double v9 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_MILD_IMPAIRMENT_METRIC";
      goto LABEL_8;
    case 3uLL:
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v7 = v6;
      id v8 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_MODERATE_IMPAIRMENT";
      double v9 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_MODERATE_IMPAIRMENT_METRIC";
      goto LABEL_8;
    case 4uLL:
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v7 = v6;
      id v8 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_SEVERE_IMPAIRMENT";
      double v9 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_SEVERE_IMPAIRMENT_METRIC";
      goto LABEL_8;
    case 5uLL:
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      id v7 = v6;
      id v8 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_PROFOUND_IMPAIRMENT";
      double v9 = @"HEARING_LEVEL_CLASSIFICATION_DESCRIPTION_PROFOUND_IMPAIRMENT_METRIC";
LABEL_8:
      if (v5) {
        id v11 = v9;
      }
      else {
        id v11 = v8;
      }
      double v10 = [v6 localizedStringForKey:v11 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Yodel"];

      break;
    default:
      double v10 = &stru_1F3B9CF20;
      break;
  }
  return v10;
}

- (void)contextView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v18 = a3;
  id v7 = a4;
  id v8 = [(HKSingleAudiogramChartViewController *)self audiogram];

  if (v8)
  {
    if (![v7 section])
    {
      double v9 = [v18 displayTypeContextSections];
      double v10 = [v9 objectAtIndex:0];

      id v11 = [v10 items];
      id v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();

      if (v13 != v14)
      {
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2, self, @"HKSingleAudiogramChartViewController.m", 664, @"We initialized audiogram items, and should get those back" object file lineNumber description];
      }
      id v15 = [v10 items];
      id v16 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v7, "row"));

      self->_selectedOverlayEar = [v16 ear];
    }
    [(HKSingleAudiogramChartViewController *)self redrawCurrentCell];
  }
  else
  {
    self->_selectedOverlayEar = 0;
  }
}

- (void)_resetCurrentGraph
{
  self->_selectedOverlayEar = 0;
  [(HKSingleAudiogramChartViewController *)self redrawCurrentCell];
}

- (void)redrawCurrentCell
{
  [(HKSingleAudiogramChartViewController *)self _setNeedsReloadSeries];
  id v4 = [(HKSingleAudiogramChartViewController *)self scalarGraphViewController];
  id v3 = [v4 graphView];
  [v3 autoscaleYAxesAnimated:0 specificRange:0 onlyIfNeeded:0 completion:0];
}

- (void)_setNeedsReloadSeries
{
  graphSeriesCache = self->_graphSeriesCache;
  self->_graphSeriesCache = (NSArray *)MEMORY[0x1E4F1CBF0];

  id v5 = [(HKSingleAudiogramChartViewController *)self scalarGraphViewController];
  id v4 = [v5 graphView];
  [v4 setNeedsReloadSeries];
}

- (id)newGraphViewController
{
  id v3 = objc_alloc_init(_HKAudiogramFrequencyAxisDimension2);
  id v4 = objc_alloc_init(HKNumericAxisConfiguration);
  [(HKAxisConfiguration *)v4 setMaxLabels:10];
  [(HKAxisConfiguration *)v4 setHorizontalAxisLabelSpacePadding:&unk_1F3C22BE0];
  id v5 = [HKScalarGraphViewController alloc];
  [(HKSingleAudiogramChartViewController *)self chartHeight];
  id v6 = -[HKScalarGraphViewController initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:](v5, "initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:", v3, 3, v4);
  id v7 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisLabelColor");
  id v8 = [(HKGraphViewController *)v6 graphView];
  double v9 = [v8 xAxis];
  double v10 = [v9 preferredStyle];
  id v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_roundedSystemFontWithSize:weight:", 11.0, *MEMORY[0x1E4FB09D0]);
  id v12 = +[HKAxisLabelStyle labelStyleWithColor:v7 font:v11 horizontalAlignment:1 verticalAlignment:3];
  [v10 setLabelStyle:v12];

  uint64_t v13 = [(HKGraphViewController *)v6 graphView];
  uint64_t v14 = [v13 xAxis];
  id v15 = [v14 preferredStyle];
  [v15 setFillOuterPadding:0.0];

  id v16 = [(HKGraphViewController *)v6 graphView];
  [v16 setMultiSeriesSelection:1];

  v17 = [(HKGraphViewController *)v6 graphView];
  objc_msgSend(v17, "setAxisInset:", 0.0, 0.0, 0.0, 0.0);

  id v18 = [(HKGraphViewController *)v6 graphView];
  [(HKSingleAudiogramChartViewController *)self _setupFixedFrequencyAxisForGraphView:v18];

  if ([(HKSingleAudiogramChartViewController *)self _shouldShowManualIngestionUI])
  {
    double v19 = [(HKScalarGraphViewController *)v6 view];
    [v19 setUserInteractionEnabled:0];

    double v20 = [(HKGraphViewController *)v6 graphView];
    [v20 setTilingDisabled:1];

    v21 = [(HKGraphViewController *)v6 graphView];
    [(HKSingleAudiogramChartViewController *)self _addHorizontalAxisAnnotationToGraphView:v21 forSelectedFrequency:self->_selectedFrequency];
  }
  uint64_t v22 = [(HKGraphViewController *)v6 graphView];
  [v22 setDelegate:self];

  [(HKSingleAudiogramChartViewController *)self _setNeedsReloadSeries];
  return v6;
}

- (id)graphSeries
{
  id v3 = [(HKSingleAudiogramChartViewController *)self audiogram];

  if (v3)
  {
    if ([(NSArray *)self->_graphSeriesCache count])
    {
      id v4 = self->_graphSeriesCache;
    }
    else
    {
      id v5 = [(HKSingleAudiogramChartViewController *)self audiogram];
      id v6 = [(HKSingleAudiogramChartViewController *)self _setupSeriesForAudiogramSample:v5];
      graphSeriesCache = self->_graphSeriesCache;
      self->_graphSeriesCache = v6;

      id v4 = self->_graphSeriesCache;
    }
  }
  else
  {
    id v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (id)_setupSeriesForAudiogramSample:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v6 = self->_selectedFrequency != 0;
  id v7 = [v4 sensitivityPoints];
  id v8 = [(HKSingleAudiogramChartViewController *)self _audiogramSeriesWithSensitivityPoints:v7 seriesEar:2 disabledStyleOverride:v6];
  objc_msgSend(v5, "hk_addNonNilObject:", v8);

  double v9 = [v4 sensitivityPoints];
  double v10 = [(HKSingleAudiogramChartViewController *)self _audiogramSeriesWithSensitivityPoints:v9 seriesEar:1 disabledStyleOverride:v6];
  objc_msgSend(v5, "hk_addNonNilObject:", v10);

  if (self->_selectedOverlayEar)
  {
    id v11 = [v4 sensitivityPoints];
    id v12 = [(HKSingleAudiogramChartViewController *)self _audiogramPureToneAveragePointsSeriesWithSensitivityPoints:v11 seriesEar:self->_selectedOverlayEar];
    objc_msgSend(v5, "hk_addNonNilObject:", v12);

    uint64_t v13 = [(HKSingleAudiogramChartViewController *)self _averageLevelOverlaySeriesWithAudiogram:v4 selectedEar:self->_selectedOverlayEar];
    objc_msgSend(v5, "hk_addNonNilObject:", v13);
  }
  if (self->_selectedFrequency)
  {
    uint64_t v14 = [v4 sensitivityPoints];
    id v15 = [(HKSingleAudiogramChartViewController *)self _audiogramPureToneAveragePointsSeriesWithSensitivityPoints:v14 selectedFrequency:self->_selectedFrequency seriesEar:2];
    objc_msgSend(v5, "hk_addNonNilObject:", v15);

    id v16 = [v4 sensitivityPoints];
    v17 = [(HKSingleAudiogramChartViewController *)self _audiogramPureToneAveragePointsSeriesWithSensitivityPoints:v16 selectedFrequency:self->_selectedFrequency seriesEar:1];
    objc_msgSend(v5, "hk_addNonNilObject:", v17);
  }
  return v5;
}

- (id)_audiogramSeriesWithSensitivityPoints:(id)a3 seriesEar:(int64_t)a4 disabledStyleOverride:(BOOL)a5
{
  BOOL v5 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __110__HKSingleAudiogramChartViewController__audiogramSeriesWithSensitivityPoints_seriesEar_disabledStyleOverride___block_invoke;
  v12[3] = &__block_descriptor_40_e37_B16__0__HKAudiogramSensitivityPoint_8l;
  void v12[4] = a4 != 1;
  id v8 = objc_msgSend(a3, "hk_filter:", v12);
  if ([v8 count])
  {
    double v9 = +[HKAudiogramLineSeries audiogramLineSeriesForSeriesEar:a4 selectedEar:self->_selectedOverlayEar disableConnectionLines:0 disabledStyleOverride:v5 selectedFrequency:0];
    double v10 = [[HKAudiogramDataSource alloc] initWithSensitivityData:v8 forLeftEar:a4 == 1];
    [v9 setDataSource:v10];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

BOOL __110__HKSingleAudiogramChartViewController__audiogramSeriesWithSensitivityPoints_seriesEar_disabledStyleOverride___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tests];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __110__HKSingleAudiogramChartViewController__audiogramSeriesWithSensitivityPoints_seriesEar_disabledStyleOverride___block_invoke_2;
  v7[3] = &__block_descriptor_40_e36_B16__0__HKAudiogramSensitivityTest_8l;
  v7[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "hk_filter:", v7);
  BOOL v5 = [v4 firstObject];

  return v5 != 0;
}

BOOL __110__HKSingleAudiogramChartViewController__audiogramSeriesWithSensitivityPoints_seriesEar_disabledStyleOverride___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 side] == *(void *)(a1 + 32);
}

- (id)_audiogramPureToneAveragePointsSeriesWithSensitivityPoints:(id)a3 seriesEar:(int64_t)a4
{
  return [(HKSingleAudiogramChartViewController *)self _audiogramPureToneAveragePointsSeriesWithSensitivityPoints:a3 selectedFrequency:0 seriesEar:a4];
}

- (id)_audiogramPureToneAveragePointsSeriesWithSensitivityPoints:(id)a3 selectedFrequency:(id)a4 seriesEar:(int64_t)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = [MEMORY[0x1E4F2B860] sharedBehavior];
  double v10 = [v9 features];
  int v11 = [v10 yodel];

  if (v11)
  {
    if (v8)
    {
      v25[0] = v8;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    }
    else
    {
      id v12 = HKHearingLevelClassificationPureToneAverageFrequencies();
    }
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __127__HKSingleAudiogramChartViewController__audiogramPureToneAveragePointsSeriesWithSensitivityPoints_selectedFrequency_seriesEar___block_invoke;
    uint64_t v22 = &unk_1E6D568C0;
    id v14 = v12;
    id v23 = v14;
    BOOL v24 = a5 != 1;
    id v15 = objc_msgSend(v7, "hk_filter:", &v19);
    if (objc_msgSend(v15, "count", v19, v20, v21, v22))
    {
      BOOL v16 = a5 == 1;
      uint64_t v13 = +[HKAudiogramLineSeries audiogramLineSeriesForSeriesEar:a5 selectedEar:0 disableConnectionLines:1 disabledStyleOverride:0 selectedFrequency:v8];
      v17 = [[HKAudiogramDataSource alloc] initWithSensitivityData:v15 forLeftEar:v16];
      [v13 setDataSource:v17];

      [v13 setAllowsSelection:0];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

BOOL __127__HKSingleAudiogramChartViewController__audiogramPureToneAveragePointsSeriesWithSensitivityPoints_selectedFrequency_seriesEar___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = NSNumber;
  BOOL v5 = [v3 frequency];
  BOOL v6 = [MEMORY[0x1E4F2B618] hertzUnit];
  [v5 doubleValueForUnit:v6];
  id v7 = objc_msgSend(v4, "numberWithDouble:");

  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    id v8 = [v3 tests];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __127__HKSingleAudiogramChartViewController__audiogramPureToneAveragePointsSeriesWithSensitivityPoints_selectedFrequency_seriesEar___block_invoke_2;
    v13[3] = &__block_descriptor_40_e36_B16__0__HKAudiogramSensitivityTest_8l;
    v13[4] = *(void *)(a1 + 40);
    double v9 = objc_msgSend(v8, "hk_filter:", v13);
    double v10 = [v9 firstObject];

    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

BOOL __127__HKSingleAudiogramChartViewController__audiogramPureToneAveragePointsSeriesWithSensitivityPoints_selectedFrequency_seriesEar___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 side] == *(void *)(a1 + 32);
}

- (id)_averageLevelOverlaySeriesWithAudiogram:(id)a3 selectedEar:(int64_t)a4
{
  BOOL v6 = a4 == 1;
  id v7 = a3;
  id v8 = [(HKSingleAudiogramChartViewController *)self _earSpecificColorForEar:a4];
  double v9 = +[HKAudiogramAverageLevelSeries audiogramAverageLevelSeriesWithColor:v8];
  double v10 = [[HKAudiogramAverageSensitivityDataSource alloc] initWithAudiogramSample:v7 isLeftEar:v6];

  [v9 setDataSource:v10];
  return v9;
}

- (void)_setupFixedFrequencyAxisForGraphView:(id)a3
{
  id v3 = a3;
  id v4 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C22BF0 maxValue:&unk_1F3C22C00];
  [v3 setEffectiveAxisRange:v4 effectiveVisibleRangeCadence:v4 effectiveVisibleRangeActive:v4];
}

- (void)updateAnnotationDataSource:(id)a3 pointContexts:(id)a4
{
  BOOL v5 = self->_selectedOverlayEar != 0;
  id v6 = a4;
  id v7 = [(HKSingleAudiogramChartViewController *)self audiogram];
  id v9 = [v7 endDate];

  id v8 = [(HKSingleAudiogramChartViewController *)self annotationViewDataSource];
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

- (double)lollipopBackgroundViewCornerRadius
{
  return 20.0;
}

- (int64_t)stackCountForGraphView:(id)a3
{
  return 1;
}

- (id)seriesSelectionLineColorForGraphView:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopStickColor", a3);
}

- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3
{
  return 1;
}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  id v17 = a4;
  if (+[HKLollipopController pointSelectionContextsHaveUserInfo:](HKLollipopController, "pointSelectionContextsHaveUserInfo:"))
  {
    BOOL v5 = [(HKSingleAudiogramChartViewController *)self lollipopController];
    int v6 = [v5 isVisible];

    if (v6)
    {
      id v7 = [(HKSingleAudiogramChartViewController *)self lollipopController];
      [v7 updateWithPointContexts:v17];
    }
    else
    {
      id v8 = [(HKSingleAudiogramChartViewController *)self currentValueView];
      [v8 frame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      id v7 = [(HKSingleAudiogramChartViewController *)self lollipopController];
      objc_msgSend(v7, "setVisibleWithRect:pointContexts:animated:", v17, 1, v10, v12, v14, v16);
    }
  }
}

- (void)graphViewDidEndSelection:(id)a3
{
  id v3 = [(HKSingleAudiogramChartViewController *)self lollipopController];
  [v3 setInvisibleAnimated:1];
}

- (NSString)chartOverlayVersion
{
  return (NSString *)@"overlays";
}

- (void)_addControllerAsChildController:(id)a3
{
  id v4 = a3;
  [(HKSingleAudiogramChartViewController *)self addChildViewController:v4];
  [v4 didMoveToParentViewController:self];
}

- (void)_pinView:(id)a3 toParentGuide:(id)a4 pinBottom:(BOOL)a5
{
  BOOL v5 = a5;
  id v23 = a3;
  id v8 = a4;
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v9 = [v23 leadingAnchor];
  double v10 = [v8 leadingAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10];
  [(HKSingleAudiogramChartViewController *)self setLeadingMarginConstraint:v11];

  double v12 = [(HKSingleAudiogramChartViewController *)self leadingMarginConstraint];
  [v12 setActive:1];

  double v13 = [v23 trailingAnchor];
  double v14 = [v8 trailingAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  [(HKSingleAudiogramChartViewController *)self setTrailingMarginConstraint:v15];

  double v16 = [(HKSingleAudiogramChartViewController *)self trailingMarginConstraint];
  [v16 setActive:1];

  id v17 = [v23 topAnchor];
  id v18 = [v8 topAnchor];
  uint64_t v19 = [v17 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  if (v5)
  {
    uint64_t v20 = [v23 bottomAnchor];
    v21 = [v8 bottomAnchor];
    uint64_t v22 = [v20 constraintEqualToAnchor:v21];
    [v22 setActive:1];
  }
}

- (id)_findNavigationController
{
  id v3 = [(HKSingleAudiogramChartViewController *)self navigationController];

  if (v3)
  {
    id v4 = [(HKSingleAudiogramChartViewController *)self navigationController];
    goto LABEL_3;
  }
  int v6 = [(HKSingleAudiogramChartViewController *)self view];
  id v4 = [v6 nextResponder];

  if (v4)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v4;
        id v8 = [v7 navigationController];

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

- (id)_earSpecificColorForEar:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_hearingHealthAudiogramLeftEarLineColor");
      self = (HKSingleAudiogramChartViewController *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E4FB1618], "hk_hearingHealthAudiogramRightEarLineColor");
      self = (HKSingleAudiogramChartViewController *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    self = [MEMORY[0x1E4FB1618] labelColor];
  }
  return self;
}

- (HKOverlayRoomApplicationItems)applicationItems
{
  return self->_applicationItems;
}

- (void)setApplicationItems:(id)a3
{
}

- (HKAudiogramSample)audiogram
{
  return self->_audiogram;
}

- (void)setAudiogram:(id)a3
{
}

- (double)chartHeight
{
  return self->_chartHeight;
}

- (void)setChartHeight:(double)a3
{
  self->_chartHeight = a3;
}

- (BOOL)isStatic
{
  return self->_isStatic;
}

- (void)setIsStatic:(BOOL)a3
{
  self->_isStatic = a3;
}

- (BOOL)hideEnhancedUI
{
  return self->_hideEnhancedUI;
}

- (void)setHideEnhancedUI:(BOOL)a3
{
  self->_hideEnhancedUI = a3;
}

- (BOOL)isManualIngestion
{
  return self->_isManualIngestion;
}

- (void)setIsManualIngestion:(BOOL)a3
{
  self->_isManualIngestion = a3;
}

- (NSNumber)selectedFrequency
{
  return self->_selectedFrequency;
}

- (void)setSelectedFrequency:(id)a3
{
}

- (HKScalarGraphViewController)scalarGraphViewController
{
  return self->_scalarGraphViewController;
}

- (void)setScalarGraphViewController:(id)a3
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

- (NSArray)factorDisplayTypes
{
  return self->_factorDisplayTypes;
}

- (HKFeatureStatusManager)hearingTestFeatureStatus
{
  return self->_hearingTestFeatureStatus;
}

- (void)setHearingTestFeatureStatus:(id)a3
{
}

- (NSArray)graphSeriesCache
{
  return self->_graphSeriesCache;
}

- (void)setGraphSeriesCache:(id)a3
{
}

- (HKAudiogramAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_graphSeriesCache, 0);
  objc_storeStrong((id *)&self->_hearingTestFeatureStatus, 0);
  objc_storeStrong((id *)&self->_factorDisplayTypes, 0);
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_lollipopController, 0);
  objc_storeStrong((id *)&self->_annotationViewDataSource, 0);
  objc_storeStrong((id *)&self->_currentValueViewDataSource, 0);
  objc_storeStrong((id *)&self->_currentValueView, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_contextView, 0);
  objc_storeStrong((id *)&self->_stackViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scalarGraphViewController, 0);
  objc_storeStrong((id *)&self->_selectedFrequency, 0);
  objc_storeStrong((id *)&self->_audiogram, 0);
  objc_storeStrong((id *)&self->_applicationItems, 0);
}

void __57__HKSingleAudiogramChartViewController_queryForAudiogram__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to retrieve audiogram: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end