@interface HKOverlayRoomAudioViewController
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (BOOL)_isAudioExposureDevicesSupported;
- (BOOL)_isEnvironmentalAudioExposureRoom;
- (BOOL)_isHeadphoneAudioExposureRoom;
- (BOOL)_shouldShowUnattenuatedOverlayPill;
- (BOOL)isShowingUnattenuatedOverlayPill;
- (BOOL)supportsShowAllFilters;
- (HKAudioExposureDevicesDataSource)audioExposureDevicesDataSource;
- (HKChartSummaryTrendModel)trendModel;
- (HKOverlayRoomAudioViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 identifier:(id)a6 preferredOverlay:(int64_t)a7 audioExposureDeviceDataSource:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10;
- (HKOverlayRoomAudioViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 identifier:(id)a6 preferredOverlay:(int64_t)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9;
- (NSMutableArray)contextDelegates;
- (NSString)quantityTypeIdentifier;
- (id)_buildAudioAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 averageOverVisibleRange:(BOOL)a6 attenuated:(BOOL)a7;
- (id)_buildAverageDataSourceTitleFromTimeScope:(BOOL)a3;
- (id)_buildGranularAverageDataSourceTitleFromTimeScope;
- (id)_headphonePredicateForDevices:(id)a3 withName:(id)a4;
- (id)_makeHeadphoneDeviceFiltersUsingContextCreator:(id)a3;
- (id)_unattenuatedBaseDisplayTypeForPrimaryDisplayType:(id)a3 applicationItems:(id)a4;
- (id)_userInfoCreationBlockForLEQ;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)preferredInitialOverlayIndex;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (id)showAllFiltersButtonTitle;
- (int64_t)_initialPillForPreference:(int64_t)a3;
- (int64_t)preferredOverlay;
- (void)_registerForAudioExposureDeviceUpdates;
- (void)_reloadAudioExposureDevices;
- (void)_setupAudioExposureDataSourceIfNeeded;
- (void)sampleTypeDateRangeController:(id)a3 didUpdateDateRanges:(id)a4;
- (void)setAudioExposureDevicesDataSource:(id)a3;
- (void)setContextDelegates:(id)a3;
- (void)setIsShowingUnattenuatedOverlayPill:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HKOverlayRoomAudioViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  v23 = (void *)[objc_alloc((Class)a1) initWithDisplayDate:v20 applicationItems:v21 mode:1 identifier:v22 preferredOverlay:a7 trendModel:v18 factorDisplayTypes:v17];

  [v23 setRestorationUserActivity:v19];
  [v23 setAdditionalChartOptions:a11];
  return v23;
}

- (HKOverlayRoomAudioViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 identifier:(id)a6 preferredOverlay:(int64_t)a7 audioExposureDeviceDataSource:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10
{
  id v15 = a3;
  id v16 = a6;
  id v35 = a8;
  id v17 = a9;
  id v18 = a10;
  id v19 = a4;
  uint64_t v20 = +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:v17];
  id v21 = (void *)v20;
  v36 = v15;
  if (v20) {
    id v22 = (void *)v20;
  }
  else {
    id v22 = v15;
  }
  id v23 = v22;

  v37.receiver = self;
  v37.super_class = (Class)HKOverlayRoomAudioViewController;
  v24 = [(HKOverlayRoomViewController *)&v37 initWithDisplayDate:v23 applicationItems:v19 factorDisplayTypes:v18 mode:a5];

  if (v24)
  {
    if (([v16 isEqualToString:*MEMORY[0x1E4F2A7F0]] & 1) == 0
      && ([v16 isEqualToString:*MEMORY[0x1E4F2A820]] & 1) == 0
      && ([v16 isEqualToString:*MEMORY[0x1E4F2A7F8]] & 1) == 0)
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2, v24, @"HKOverlayRoomAudioViewController.m", 108, @"Invalid audio type identifier passed into audio room: %@", v16 object file lineNumber description];
    }
    v24->_isShowingUnattenuatedOverlayPill = 0;
    v24->_quantityTypeIdentifier = (NSString *)v16;
    v24->_preferredOverlay = a7;
    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    contextDelegates = v24->_contextDelegates;
    v24->_contextDelegates = v25;

    objc_storeStrong((id *)&v24->_audioExposureDevicesDataSource, a8);
    [(HKOverlayRoomAudioViewController *)v24 _setupAudioExposureDataSourceIfNeeded];
    objc_storeStrong((id *)&v24->_trendModel, a9);
    preferredOverlayIndex = v24->_preferredOverlayIndex;
    v24->_preferredOverlayIndex = 0;

    uint64_t v28 = 0;
    if (a5 != 3)
    {
      unsigned int v29 = objc_msgSend(v17, "selectTrendInitially", 0);
      if (a5) {
        BOOL v30 = a7 == 0;
      }
      else {
        BOOL v30 = 1;
      }
      if (v30) {
        uint64_t v28 = v29;
      }
      else {
        uint64_t v28 = 1;
      }
    }
    [(HKOverlayRoomViewController *)v24 setShouldSelectInitialOverlay:v28];
  }

  return v24;
}

- (HKOverlayRoomAudioViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 identifier:(id)a6 preferredOverlay:(int64_t)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9
{
  return [(HKOverlayRoomAudioViewController *)self initWithDisplayDate:a3 applicationItems:a4 mode:a5 identifier:a6 preferredOverlay:a7 audioExposureDeviceDataSource:0 trendModel:a8 factorDisplayTypes:a9];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HKOverlayRoomAudioViewController;
  [(HKOverlayRoomViewController *)&v3 viewDidLoad];
  [(HKOverlayRoomAudioViewController *)self _registerForAudioExposureDeviceUpdates];
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  if ([(HKOverlayRoomAudioViewController *)self _isEnvironmentalAudioExposureRoom])
  {
    v4 = HKHealthKitFrameworkBundle();
    v5 = v4;
    uint64_t v6 = *MEMORY[0x1E4F29E40];
    v7 = @"ENVIRONMENTAL_AUDIO_EXPOSURE";
  }
  else
  {
    BOOL v8 = [(HKOverlayRoomAudioViewController *)self _isHeadphoneAudioExposureRoom];
    v4 = HKHealthKitFrameworkBundle();
    v5 = v4;
    uint64_t v6 = *MEMORY[0x1E4F29E40];
    if (v8) {
      v7 = @"HEADPHONE_AUDIO_EXPOSURE";
    }
    else {
      v7 = @"ENVIRONMENTAL_SOUND_REDUCTION";
    }
  }
  v9 = [v4 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:v6];

  return v9;
}

- (BOOL)supportsShowAllFilters
{
  if ([(HKOverlayRoomAudioViewController *)self _isHeadphoneAudioExposureRoom]
    || [(HKOverlayRoomAudioViewController *)self _isEnvironmentalAudioExposureRoom]
    || (BOOL v3 = [(HKOverlayRoomViewController *)self healthFactorsEnabled]))
  {
    v5.receiver = self;
    v5.super_class = (Class)HKOverlayRoomAudioViewController;
    LOBYTE(v3) = [(HKOverlayRoomViewController *)&v5 supportsShowAllFilters];
  }
  return v3;
}

- (id)showAllFiltersButtonTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v3 = [v2 localizedStringForKey:@"SHOW_MORE_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F2B2C0];
  quantityTypeIdentifier = self->_quantityTypeIdentifier;
  id v5 = a3;
  uint64_t v6 = [v3 quantityTypeForIdentifier:quantityTypeIdentifier];
  v7 = [v5 displayTypeController];

  BOOL v8 = [v7 displayTypeForObjectType:v6];

  return v8;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v125[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = [(HKOverlayRoomAudioViewController *)self primaryDisplayTypeWithApplicationItems:v8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2;
  aBlock[3] = &unk_1E6D51A58;
  id v11 = v9;
  id v111 = v11;
  id v12 = v8;
  id v112 = v12;
  int64_t v113 = a3;
  v13 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3;
  v105[3] = &unk_1E6D52D90;
  v105[4] = self;
  id v14 = v12;
  id v106 = v14;
  id v15 = v10;
  id v107 = v15;
  id v16 = v11;
  id v108 = v16;
  int64_t v109 = a3;
  id v17 = (void (**)(void *, NSString *, uint64_t))_Block_copy(v105);
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4;
  v101[3] = &unk_1E6D52DB8;
  id v18 = v16;
  id v102 = v18;
  id v19 = v14;
  id v103 = v19;
  int64_t v104 = a3;
  v93 = _Block_copy(v101);
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_5;
  v97[3] = &unk_1E6D51A80;
  id v20 = v18;
  id v98 = v20;
  id v21 = v19;
  id v99 = v21;
  int64_t v100 = a3;
  id v22 = (void (**)(void))_Block_copy(v97);
  v94 = v22;
  v92 = v21;
  if ([(HKOverlayRoomAudioViewController *)self _isEnvironmentalAudioExposureRoom])
  {
    if ([(HKOverlayRoomAudioViewController *)self _initialPillForPreference:[(HKOverlayRoomAudioViewController *)self preferredOverlay]] == 1)v13[2](v13, 5, 0); {
    else
    }
    v25 = v17[2](v17, self->_quantityTypeIdentifier, 2);
    v26 = [(HKOverlayRoomAudioViewController *)self trendModel];

    if (v26)
    {
      v27 = [HKOverlayRoomTrendContext alloc];
      uint64_t v28 = [(HKOverlayRoomAudioViewController *)self trendModel];
      unsigned int v29 = [(HKOverlayRoomTrendContext *)v27 initWithBaseDisplayType:v15 trendModel:v28 overlayChartController:v20 applicationItems:v21 overlayMode:a3];

      BOOL v30 = [(HKOverlayRoomViewController *)self chartController];
      [v30 setTrendAccessibilityDelegate:v29];

      v31 = [(HKOverlayRoomAudioViewController *)self trendModel];
      LODWORD(v28) = [v31 selectTrendInitially];

      if (v28)
      {
        unsigned int v29 = v29;

        v25 = v29;
      }
    }
    else
    {
      unsigned int v29 = 0;
    }
    if ((unint64_t)(a3 - 1) < 2)
    {
      id v91 = v15;
      v38 = [NSNumber numberWithUnsignedInteger:0];
      preferredOverlayIndex = self->_preferredOverlayIndex;
      self->_preferredOverlayIndex = v38;

      v40 = [HKOverlayContextSectionContainer alloc];
      v123 = v25;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
      __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v36, 0, v36);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      id v124 = v41;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
      v43 = [(HKOverlayContextSectionContainer *)v40 initWithContainerTitle:0 overlayContextSections:v42];
      v125[0] = v43;
      objc_super v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:1];

LABEL_39:
LABEL_47:

      id v15 = v91;
      goto LABEL_48;
    }
    if (a3 == 3)
    {
      id v87 = v20;
      id v91 = v15;
      v36 = (HKOverlayContextSectionContainer *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v44 = v17[2](v17, self->_quantityTypeIdentifier, 2);
      [(HKOverlayContextSectionContainer *)v36 addObject:v44];

      if ([(HKOverlayRoomAudioViewController *)self _shouldShowUnattenuatedOverlayPill])
      {
        v45 = v17[2](v17, self->_quantityTypeIdentifier, 0);
        [(HKOverlayContextSectionContainer *)v36 addObject:v45];

        self->_isShowingUnattenuatedOverlayPill = 1;
      }
      v46 = v17[2](v17, self->_quantityTypeIdentifier, 1);
      v122[0] = v46;
      v47 = v94[2]();
      v122[1] = v47;
      v48 = v13[2](v13, 0, 2);
      v122[2] = v48;
      v89 = v13;
      v49 = v13[2](v13, 5, 0);
      v122[3] = v49;
      v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:4];
      [(HKOverlayContextSectionContainer *)v36 addObjectsFromArray:v50];

      if (v29) {
        [(HKOverlayContextSectionContainer *)v36 addObject:v29];
      }
      uint64_t v51 = [(HKOverlayContextSectionContainer *)v36 indexOfObject:v25];
      if (v51 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v52 = 0;
      }
      else
      {
        v52 = [NSNumber numberWithUnsignedInteger:v51];
      }
      v13 = v89;
      objc_storeStrong((id *)&self->_preferredOverlayIndex, v52);
      if (v51 != 0x7FFFFFFFFFFFFFFFLL) {

      }
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v74 = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v41, 0, v36);
      [v41 addObject:v74];

      v42 = [[HKOverlayContextSectionContainer alloc] initWithContainerTitle:0 overlayContextSections:v41];
      v121 = v42;
      objc_super v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
      id v20 = v87;
      goto LABEL_39;
    }
LABEL_34:
    objc_super v37 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_49;
  }
  BOOL v23 = [(HKOverlayRoomAudioViewController *)self _isHeadphoneAudioExposureRoom];
  int64_t v24 = [(HKOverlayRoomAudioViewController *)self _initialPillForPreference:[(HKOverlayRoomAudioViewController *)self preferredOverlay]];
  if (v23)
  {
    if (v24 == 2) {
      v13[2](v13, 7, 0);
    }
    else {
    v25 = v17[2](v17, self->_quantityTypeIdentifier, 0);
    }
    v53 = [(HKOverlayRoomAudioViewController *)self trendModel];

    if (v53)
    {
      v54 = [HKOverlayRoomTrendContext alloc];
      v55 = [(HKOverlayRoomAudioViewController *)self trendModel];
      unsigned int v29 = [(HKOverlayRoomTrendContext *)v54 initWithBaseDisplayType:v15 trendModel:v55 overlayChartController:v20 applicationItems:v21 overlayMode:a3];

      v56 = [(HKOverlayRoomViewController *)self chartController];
      [v56 setTrendAccessibilityDelegate:v29];

      v57 = [(HKOverlayRoomAudioViewController *)self trendModel];
      LODWORD(v55) = [v57 selectTrendInitially];

      if (v55)
      {
        unsigned int v29 = v29;

        v25 = v29;
      }
    }
    else
    {
      unsigned int v29 = 0;
    }
    if ((unint64_t)(a3 - 1) >= 2)
    {
      if (a3 != 3) {
        goto LABEL_34;
      }
      id v88 = v20;
      id v91 = v15;
      v36 = [MEMORY[0x1E4F1CA48] array];
      v84 = (void *)MEMORY[0x1E4F1CA48];
      v85 = v17[2](v17, self->_quantityTypeIdentifier, 0);
      v117[0] = v85;
      v83 = v13[2](v13, 7, 0);
      v117[1] = v83;
      v64 = v17[2](v17, self->_quantityTypeIdentifier, 1);
      v117[2] = v64;
      v65 = v94[2]();
      v117[3] = v65;
      v90 = v13;
      v66 = v13[2](v13, 0, 2);
      v117[4] = v66;
      v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:5];
      v68 = [v84 arrayWithArray:v67];

      if (v29) {
        uint64_t v69 = [v68 addObject:v29];
      }
      v86 = v68;
      v70 = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke(v69, 0, v68);
      v71 = [v70 overlayContextItems];
      uint64_t v72 = [v71 indexOfObject:v25];

      if (v72 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v73 = 0;
      }
      else
      {
        v73 = [NSNumber numberWithUnsignedInteger:v72];
      }
      v13 = v90;
      objc_storeStrong((id *)&self->_preferredOverlayIndex, v73);
      if (v72 != 0x7FFFFFFFFFFFFFFFLL) {

      }
      v63 = v70;
      [(HKOverlayContextSectionContainer *)v36 addObject:v70];
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_6;
      v95[3] = &unk_1E6D52DE0;
      v96 = v93;
      v75 = [(HKOverlayRoomAudioViewController *)self _makeHeadphoneDeviceFiltersUsingContextCreator:v95];
      id v20 = v88;
      if ([v75 count])
      {
        v76 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v77 = [v76 localizedStringForKey:@"AUDIO_OVERLAY_HEADPHONES_FILTER_SECTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

        v79 = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke(v78, v77, v75);
        [(HKOverlayContextSectionContainer *)v36 addObject:v79];

        v63 = v70;
      }
      v80 = [[HKOverlayContextSectionContainer alloc] initWithContainerTitle:0 overlayContextSections:v36];
      v116 = v80;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
      objc_super v37 = v81 = v75;

      v62 = v96;
      id v41 = v86;
    }
    else
    {
      id v91 = v15;
      v58 = [NSNumber numberWithUnsignedInteger:0];
      v59 = self->_preferredOverlayIndex;
      self->_preferredOverlayIndex = v58;

      v60 = [HKOverlayContextSectionContainer alloc];
      v118 = v25;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
      __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v36, 0, v36);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      id v119 = v41;
      uint64_t v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
      v62 = [(HKOverlayContextSectionContainer *)v60 initWithContainerTitle:0 overlayContextSections:v61];
      v120 = v62;
      v63 = (void *)v61;
      objc_super v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
    }

    goto LABEL_47;
  }
  v25 = ((void (*)(void (**)(void)))v22[2])(v22);
  v32 = [NSNumber numberWithUnsignedInteger:0];
  v33 = self->_preferredOverlayIndex;
  self->_preferredOverlayIndex = v32;

  unsigned int v29 = (HKOverlayRoomTrendContext *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v115 = v25;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
  id v35 = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v34, 0, v34);
  [(HKOverlayRoomTrendContext *)v29 addObject:v35];

  v36 = [[HKOverlayContextSectionContainer alloc] initWithContainerTitle:0 overlayContextSections:v29];
  v114 = v36;
  objc_super v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
LABEL_48:

LABEL_49:
  return v37;
}

id __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:a2 namedPredicate:0 overlayChartController:a1[4] applicationItems:a1[5] optionalDelegate:0 options:a3 mode:a1[6]];
}

id __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3 == 2)
  {
    v13 = *(void **)(a1 + 32);
    id v14 = [*(id *)(a1 + 40) unitController];
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = [*(id *)(a1 + 40) healthStore];
    v10 = [v13 _buildAudioAverageDataSourceWithUnitController:v14 displayType:v15 healthStore:v16 averageOverVisibleRange:1 attenuated:1];

    id v11 = [[_HKAudioVisibleRangeQuantityContextDelegate alloc] initWithCustomDataSource:v10 primaryDisplayType:*(void *)(a1 + 48)];
    goto LABEL_7;
  }
  if (a3 != 1)
  {
    if (a3)
    {
      uint64_t v17 = 0;
      id v11 = 0;
      id v12 = 0;
      goto LABEL_13;
    }
    uint64_t v6 = *(void **)(a1 + 32);
    v7 = [*(id *)(a1 + 40) unitController];
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 40) healthStore];
    v10 = [v6 _buildAudioAverageDataSourceWithUnitController:v7 displayType:v8 healthStore:v9 averageOverVisibleRange:1 attenuated:0];

    id v11 = [[_HKAudioVisibleRangeQuantityContextDelegate alloc] initWithCustomDataSource:v10 primaryDisplayType:*(void *)(a1 + 48)];
    if ([*(id *)(a1 + 32) _isEnvironmentalAudioExposureRoom])
    {
      id v12 = [*(id *)(a1 + 32) _unattenuatedBaseDisplayTypeForPrimaryDisplayType:*(void *)(a1 + 48) applicationItems:*(void *)(a1 + 40)];
LABEL_8:
      uint64_t v17 = 16;
      goto LABEL_10;
    }
LABEL_7:
    id v12 = 0;
    goto LABEL_8;
  }
  v10 = [*(id *)(a1 + 32) primaryDisplayTypeWithApplicationItems:*(void *)(a1 + 40)];
  id v18 = *(void **)(a1 + 32);
  id v19 = [*(id *)(a1 + 40) unitController];
  id v20 = [*(id *)(a1 + 40) healthStore];
  id v21 = [v18 _buildAudioAverageDataSourceWithUnitController:v19 displayType:v10 healthStore:v20 averageOverVisibleRange:0 attenuated:1];

  id v11 = [[_HKAudioStandardQuantityContextDelegate alloc] initWithCustomDataSource:v21 primaryDisplayType:v10];
  id v12 = 0;
  uint64_t v17 = 0;
LABEL_10:

  if (v11)
  {
    id v22 = [*(id *)(a1 + 32) contextDelegates];
    [v22 addObject:v11];
  }
LABEL_13:
  BOOL v23 = +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:v5 overlayChartController:*(void *)(a1 + 56) applicationItems:*(void *)(a1 + 40) optionalDelegate:v11 seriesOptions:v17 mode:*(void *)(a1 + 64) optionalBaseDisplayType:v12];

  return v23;
}

id __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4(void *a1, uint64_t a2)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:0 namedPredicate:a2 overlayChartController:a1[4] applicationItems:a1[5] optionalDelegate:0 options:0 mode:a1[6]];
}

HKOverlayRoomViewControllerLastQuantityContext *__108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_5(void *a1)
{
  v1 = [[HKOverlayRoomViewControllerLastQuantityContext alloc] initWithOverlayChartController:a1[4] applicationItems:a1[5] mode:a1[6] attenuated:1];
  return v1;
}

uint64_t __108__HKOverlayRoomAudioViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_unattenuatedBaseDisplayTypeForPrimaryDisplayType:(id)a3 applicationItems:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F2A7F0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 healthStore];
  v10 = [v7 unitController];
  id v11 = [v8 _audioLevelDataSourceForTypeIdentifier:v6 withHealthStore:v9 attenuatesExposureData:0 unitController:v10];

  id v12 = [[HKInteractiveChartOverlayNamedDataSource alloc] initWithDataSource:v11 named:@"HKAudioExposureUnattenuatedData" withContextTitleForTimeScope:0];
  v13 = objc_msgSend(v8, "hk_interactiveChartsFormatterForTimeScope:", 5);
  id v14 = [v8 displayCategory];
  uint64_t v15 = [v7 unitController];
  id v16 = [v7 chartDataCacheController];

  uint64_t v17 = objc_msgSend(v8, "hk_standardSeriesForTimeScope:displayCategory:unitController:dataCacheController:", 5, v14, v15, v16);

  id v18 = [(HKOverlayRoomViewController *)self chartController];
  id v19 = [v18 displayTypeForGraphSeries:v17 namedDataSource:v12 templateDisplayType:v8 timeScope:5 formatter:v13];

  return v19;
}

- (BOOL)_shouldShowUnattenuatedOverlayPill
{
  v2 = [(HKOverlayRoomViewController *)self applicationItems];
  BOOL v3 = [v2 sampleDateRangeController];

  v4 = [v3 dateRangesBySampleType];

  if (!v4) {
    goto LABEL_6;
  }
  id v5 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A7F8]];
  uint64_t v6 = [v3 dateRangeForSampleType:v5];
  uint64_t v7 = [v6 minValue];
  if (!v7)
  {

    goto LABEL_6;
  }
  id v8 = (void *)v7;
  id v9 = [v6 maxValue];

  if (!v9)
  {
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  BOOL v10 = 1;
LABEL_7:

  return v10;
}

- (void)sampleTypeDateRangeController:(id)a3 didUpdateDateRanges:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HKOverlayRoomAudioViewController;
  [(HKOverlayRoomViewController *)&v6 sampleTypeDateRangeController:a3 didUpdateDateRanges:a4];
  BOOL isShowingUnattenuatedOverlayPill = self->_isShowingUnattenuatedOverlayPill;
  if (isShowingUnattenuatedOverlayPill != [(HKOverlayRoomAudioViewController *)self _shouldShowUnattenuatedOverlayPill])[(HKOverlayRoomViewController *)self reloadOverlayContextItems]; {
}
  }

- (id)_makeHeadphoneDeviceFiltersUsingContextCreator:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = [(HKOverlayRoomAudioViewController *)self audioExposureDevicesDataSource];
  objc_super v6 = [v5 devicesByName];
  uint64_t v7 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = [(HKOverlayRoomAudioViewController *)self audioExposureDevicesDataSource];
  id v9 = [v8 devicesByName];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x1E4E40740]();
        id v16 = [(HKOverlayRoomAudioViewController *)self audioExposureDevicesDataSource];
        uint64_t v17 = [v16 devicesByName];
        id v18 = [v17 objectForKeyedSubscript:v14];

        id v19 = [(HKOverlayRoomAudioViewController *)self _headphonePredicateForDevices:v18 withName:v14];
        [v7 addObject:v19];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }

  id v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localizedNameKey" ascending:1 selector:sel_localizedStandardCompare_];
  v34 = v20;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  id v22 = [v7 sortedArrayUsingDescriptors:v21];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __83__HKOverlayRoomAudioViewController__makeHeadphoneDeviceFiltersUsingContextCreator___block_invoke;
  v28[3] = &unk_1E6D52E08;
  id v29 = v26;
  id v23 = v26;
  int64_t v24 = objc_msgSend(v22, "hk_map:", v28);

  return v24;
}

uint64_t __83__HKOverlayRoomAudioViewController__makeHeadphoneDeviceFiltersUsingContextCreator___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)_initialPillForPreference:(int64_t)a3
{
  int64_t result = 0;
  if (a3 > 3)
  {
    if (a3 == 4) {
      return 2;
    }
    if (a3 == 11) {
      return result;
    }
  }
  else
  {
    if (!a3) {
      return result;
    }
    if (a3 == 1) {
      return 1;
    }
  }
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEBUG)) {
    -[HKOverlayRoomAudioViewController _initialPillForPreference:](a3, v5);
  }
  return 0;
}

- (id)preferredInitialOverlayIndex
{
  return self->_preferredOverlayIndex;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [HKOverlayRoomAudioViewController alloc];
  uint64_t v11 = [(HKOverlayRoomAudioViewController *)self quantityTypeIdentifier];
  int64_t v12 = [(HKOverlayRoomAudioViewController *)self preferredOverlay];
  v13 = [(HKOverlayRoomAudioViewController *)self audioExposureDevicesDataSource];
  uint64_t v14 = [(HKOverlayRoomAudioViewController *)self trendModel];
  uint64_t v15 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  id v16 = [(HKOverlayRoomAudioViewController *)v10 initWithDisplayDate:v9 applicationItems:v8 mode:a3 identifier:v11 preferredOverlay:v12 audioExposureDeviceDataSource:v13 trendModel:v14 factorDisplayTypes:v15];

  [(HKOverlayRoomViewController *)v16 setAdditionalChartOptions:[(HKOverlayRoomViewController *)self filteredInteractiveChartOptionsForMode:a3]];
  return v16;
}

- (BOOL)_isEnvironmentalAudioExposureRoom
{
  return [(NSString *)self->_quantityTypeIdentifier isEqualToString:*MEMORY[0x1E4F2A7F0]];
}

- (BOOL)_isHeadphoneAudioExposureRoom
{
  return [(NSString *)self->_quantityTypeIdentifier isEqualToString:*MEMORY[0x1E4F2A820]];
}

- (id)createChartOverlayViewController
{
  if ([(HKOverlayRoomViewController *)self controllerMode] != 3)
  {
    int64_t v3 = +[HKOverlayRoomTrendContext findStartingTimeScopeFromTrendModel:self->_trendModel];
    if (v3 != 8)
    {
      int64_t v4 = v3;
      id v5 = [(HKOverlayRoomViewController *)self applicationItems];
      objc_super v6 = [v5 timeScopeController];
      [v6 setSelectedTimeScope:v4];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)HKOverlayRoomAudioViewController;
  uint64_t v7 = [(HKOverlayRoomViewController *)&v9 createChartOverlayViewController];
  return v7;
}

- (BOOL)_isAudioExposureDevicesSupported
{
  return ![(HKOverlayRoomAudioViewController *)self _isEnvironmentalAudioExposureRoom];
}

- (void)_setupAudioExposureDataSourceIfNeeded
{
  if ([(HKOverlayRoomAudioViewController *)self _isAudioExposureDevicesSupported])
  {
    int64_t v3 = [(HKOverlayRoomAudioViewController *)self audioExposureDevicesDataSource];

    if (!v3)
    {
      int64_t v4 = [HKAudioExposureDevicesDataSource alloc];
      id v5 = [(HKOverlayRoomViewController *)self applicationItems];
      objc_super v6 = [v5 healthStore];
      uint64_t v7 = [(HKAudioExposureDevicesDataSource *)v4 initWithDeviceType:0 healthStore:v6];

      [(HKAudioExposureDevicesDataSource *)v7 startQuery];
      [(HKOverlayRoomAudioViewController *)self setAudioExposureDevicesDataSource:v7];
    }
  }
}

- (void)_registerForAudioExposureDeviceUpdates
{
  if ([(HKOverlayRoomAudioViewController *)self _isAudioExposureDevicesSupported])
  {
    int64_t v3 = [(HKOverlayRoomAudioViewController *)self audioExposureDevicesDataSource];

    if (v3)
    {
      id v4 = [(HKOverlayRoomAudioViewController *)self audioExposureDevicesDataSource];
      [v4 addObserver:self];
    }
  }
}

- (void)_reloadAudioExposureDevices
{
  if ([(HKOverlayRoomAudioViewController *)self _isAudioExposureDevicesSupported])
  {
    uint64_t v3 = [(HKOverlayRoomAudioViewController *)self audioExposureDevicesDataSource];
    uint64_t v4 = v3;
    if (v3
      && (id v6 = (id)v3,
          uint64_t v3 = [(HKOverlayRoomAudioViewController *)self isViewLoaded],
          uint64_t v4 = (uint64_t)v6,
          (v3 & 1) != 0))
    {
      int64_t v5 = [(HKOverlayRoomViewController *)self controllerMode];

      if (v5 == 3)
      {
        [(HKOverlayRoomViewController *)self reloadOverlayContextItems];
      }
    }
    else
    {
      MEMORY[0x1F41817F8](v3, v4);
    }
  }
}

- (id)_headphonePredicateForDevices:(id)a3 withName:(id)a4
{
  int64_t v5 = (void *)MEMORY[0x1E4F2B3C0];
  id v6 = a4;
  uint64_t v7 = [v5 predicateForObjectsFromDevices:a3];
  id v8 = [[HKInteractiveChartOverlayPredicate alloc] initWithPredicate:v7 name:v6];

  return v8;
}

- (id)_buildAudioAverageDataSourceWithUnitController:(id)a3 displayType:(id)a4 healthStore:(id)a5 averageOverVisibleRange:(BOOL)a6 attenuated:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v7)
  {
    uint64_t v15 = _HKStatisticsOptionAttenuateSamples() | 0x42;
    id v16 = @"HKOverlayRoomNamedChartCacheDataSource_AttenuatedLEQ";
  }
  else
  {
    id v16 = @"HKOverlayRoomNamedChartCacheDataSource_LEQ";
    uint64_t v15 = 66;
  }
  uint64_t v17 = [[HKQuantityTypeDataSource alloc] initWithUnitController:v12 options:v15 displayType:v13 healthStore:v14];
  id v18 = [(HKOverlayRoomAudioViewController *)self _userInfoCreationBlockForLEQ];
  [(HKQuantityTypeDataSource *)v17 setUserInfoCreationBlock:v18];

  if (v8) {
    [(HKOverlayRoomAudioViewController *)self _buildAverageDataSourceTitleFromTimeScope:v7];
  }
  else {
  id v19 = [(HKOverlayRoomAudioViewController *)self _buildGranularAverageDataSourceTitleFromTimeScope];
  }
  id v20 = [[HKInteractiveChartOverlayNamedDataSource alloc] initWithDataSource:v17 named:v16 withContextTitleForTimeScope:v19];

  return v20;
}

- (id)_buildAverageDataSourceTitleFromTimeScope:(BOOL)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__HKOverlayRoomAudioViewController__buildAverageDataSourceTitleFromTimeScope___block_invoke;
  v6[3] = &unk_1E6D52E30;
  v6[4] = self;
  BOOL v7 = a3;
  uint64_t v3 = _Block_copy(v6);
  uint64_t v4 = _Block_copy(v3);

  return v4;
}

id __78__HKOverlayRoomAudioViewController__buildAverageDataSourceTitleFromTimeScope___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isEnvironmentalAudioExposureRoom]
    && [*(id *)(a1 + 32) _shouldShowUnattenuatedOverlayPill]
    && !*(unsigned char *)(a1 + 40))
  {
    v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v3 = v2;
    uint64_t v4 = @"OVERLAY_AVERAGE_AUDIO_EXPOSURE_WITHOUT_ATTENUATION";
  }
  else
  {
    v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v3 = v2;
    uint64_t v4 = @"OVERLAY_AVERAGE_AUDIO_EXPOSURE";
  }
  int64_t v5 = [v2 localizedStringForKey:v4 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v5;
}

- (id)_buildGranularAverageDataSourceTitleFromTimeScope
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__HKOverlayRoomAudioViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke;
  v5[3] = &unk_1E6D51B90;
  v5[4] = self;
  v5[5] = a2;
  v2 = _Block_copy(v5);
  uint64_t v3 = _Block_copy(v2);

  return v3;
}

__CFString *__85__HKOverlayRoomAudioViewController__buildGranularAverageDataSourceTitleFromTimeScope__block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 8:
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"HKOverlayRoomAudioViewController.m", 707, @"Unsupported zoom level (%ld)", a2);
      int64_t v5 = &stru_1F3B9CF20;
      goto LABEL_10;
    case 2:
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v4 = v6;
      BOOL v7 = @"OVERLAY_AVERAGE_MONTHLY";
      goto LABEL_9;
    case 3:
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v4 = v6;
      BOOL v7 = @"OVERLAY_AVERAGE_WEEKLY";
      goto LABEL_9;
    case 4:
    case 5:
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v4 = v6;
      BOOL v7 = @"OVERLAY_AVERAGE_DAILY";
      goto LABEL_9;
    case 6:
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v4 = v6;
      BOOL v7 = @"OVERLAY_AVERAGE_HOURLY";
      goto LABEL_9;
    case 7:
      id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      uint64_t v4 = v6;
      BOOL v7 = @"OVERLAY_AVERAGE_BYMINUTE";
LABEL_9:
      int64_t v5 = [v6 localizedStringForKey:v7 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
LABEL_10:

      break;
    default:
      int64_t v5 = &stru_1F3B9CF20;
      break;
  }
  return v5;
}

- (id)_userInfoCreationBlockForLEQ
{
  return &__block_literal_global_381;
}

HKInteractiveChartAudioData *__64__HKOverlayRoomAudioViewController__userInfoCreationBlockForLEQ__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F2B618];
  id v3 = a2;
  uint64_t v4 = [v2 decibelAWeightedSoundPressureLevelUnit];
  int64_t v5 = [v3 averageQuantity];
  [v5 doubleValueForUnit:v4];
  double v7 = v6;

  BOOL v8 = [v3 durationQuantity];

  if (v8)
  {
    objc_super v9 = [MEMORY[0x1E4F2B618] secondUnit];
    [v8 doubleValueForUnit:v9];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }
  id v12 = objc_alloc_init(HKInteractiveChartAudioData);
  [(HKInteractiveChartAudioData *)v12 setAverageLEQ:v7];
  [(HKInteractiveChartAudioData *)v12 setDuration:v11];
  [(HKInteractiveChartAudioData *)v12 setOverviewData:0];

  return v12;
}

- (NSString)quantityTypeIdentifier
{
  return self->_quantityTypeIdentifier;
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (NSMutableArray)contextDelegates
{
  return self->_contextDelegates;
}

- (void)setContextDelegates:(id)a3
{
}

- (HKAudioExposureDevicesDataSource)audioExposureDevicesDataSource
{
  return self->_audioExposureDevicesDataSource;
}

- (void)setAudioExposureDevicesDataSource:(id)a3
{
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (BOOL)isShowingUnattenuatedOverlayPill
{
  return self->_isShowingUnattenuatedOverlayPill;
}

- (void)setIsShowingUnattenuatedOverlayPill:(BOOL)a3
{
  self->_BOOL isShowingUnattenuatedOverlayPill = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_audioExposureDevicesDataSource, 0);
  objc_storeStrong((id *)&self->_contextDelegates, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
}

- (void)_initialPillForPreference:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_DEBUG, "HKOverlayRoomAudioViewController received invalid secondary type: %ld", (uint8_t *)&v2, 0xCu);
}

@end