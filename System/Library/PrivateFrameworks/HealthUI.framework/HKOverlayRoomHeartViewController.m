@interface HKOverlayRoomHeartViewController
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (HKChartSummaryTrendModel)trendModel;
- (HKOverlayRoomHeartViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)preferredInitialOverlayIndex;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (int64_t)_initialPillForPreference:(int64_t)a3;
- (int64_t)preferredOverlay;
- (void)viewDidLoad;
@end

@implementation HKOverlayRoomHeartViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a6;
  id v20 = a5;
  v21 = (void *)[objc_alloc((Class)a1) initWithDisplayDate:v19 applicationItems:v20 mode:1 preferredOverlay:a7 trendModel:v17 factorDisplayTypes:v16];

  [v21 setRestorationUserActivity:v18];
  [v21 setAdditionalChartOptions:a11];
  return v21;
}

- (HKOverlayRoomHeartViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5 preferredOverlay:(int64_t)a6 trendModel:(id)a7 factorDisplayTypes:(id)a8
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = a4;
  uint64_t v18 = +[HKOverlayRoomTrendContext findInitialDateFromTrendModel:v15];
  id v19 = (void *)v18;
  if (v18) {
    id v20 = (void *)v18;
  }
  else {
    id v20 = v14;
  }
  id v21 = v20;

  v28.receiver = self;
  v28.super_class = (Class)HKOverlayRoomHeartViewController;
  v22 = [(HKOverlayRoomViewController *)&v28 initWithDisplayDate:v21 applicationItems:v17 factorDisplayTypes:v16 mode:a5];

  if (v22)
  {
    v22->_preferredOverlay = a6;
    preferredOverlayIndex = v22->_preferredOverlayIndex;
    v22->_preferredOverlayIndex = 0;

    objc_storeStrong((id *)&v22->_trendModel, a7);
    if (a5 == 3)
    {
      uint64_t v24 = 0;
    }
    else
    {
      unsigned int v25 = [v15 selectTrendInitially];
      if (a5) {
        BOOL v26 = a6 == 0;
      }
      else {
        BOOL v26 = 1;
      }
      if (v26) {
        uint64_t v24 = v25;
      }
      else {
        uint64_t v24 = 1;
      }
    }
    [(HKOverlayRoomViewController *)v22 setShouldSelectInitialOverlay:v24];
  }

  return v22;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HKOverlayRoomHeartViewController;
  [(HKOverlayRoomViewController *)&v2 viewDidLoad];
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  v3 = HKHealthKitFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"HEART_RATE" value:&stru_1F3B9CF20 table:*MEMORY[0x1E4F29E40]];

  return v4;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F2B2C0];
  uint64_t v4 = *MEMORY[0x1E4F2A828];
  id v5 = a3;
  v6 = [v3 quantityTypeForIdentifier:v4];
  v7 = [v5 displayTypeController];

  v8 = [v7 displayTypeForObjectType:v6];

  return v8;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v79[9] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2;
  aBlock[3] = &unk_1E6D51A58;
  id v9 = v8;
  id v72 = v9;
  id v10 = v7;
  id v73 = v10;
  int64_t v74 = a3;
  v11 = (void (**)(void *, void, uint64_t))_Block_copy(aBlock);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3;
  v67[3] = &unk_1E6D55A00;
  id v12 = v9;
  id v68 = v12;
  id v13 = v10;
  id v69 = v13;
  int64_t v70 = a3;
  id v14 = (void (**)(void *, void))_Block_copy(v67);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4;
  v63[3] = &unk_1E6D51A80;
  id v55 = v12;
  id v64 = v55;
  id v54 = v13;
  id v65 = v54;
  int64_t v66 = a3;
  int64_t v62 = a3;
  v61 = (void (**)(void))_Block_copy(v63);
  v57 = v61[2]();
  v79[0] = v57;
  id v15 = v11[2](v11, 0, 2);
  v79[1] = v15;
  id v16 = v14[2](v14, *MEMORY[0x1E4F2A8A0]);
  v79[2] = v16;
  v60 = v14;
  id v17 = v14[2](v14, *MEMORY[0x1E4F2A930]);
  v79[3] = v17;
  uint64_t v18 = v11[2](v11, 2, 32);
  v79[4] = v18;
  id v19 = v11[2](v11, 6, 128);
  v79[5] = v19;
  id v20 = v11[2](v11, 1, 64);
  v79[6] = v20;
  id v21 = v11[2](v11, 3, 0);
  v79[7] = v21;
  v56 = v11;
  v22 = v11[2](v11, 4, 0);
  v79[8] = v22;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:9];

  v23 = self;
  switch([(HKOverlayRoomHeartViewController *)self _initialPillForPreference:[(HKOverlayRoomHeartViewController *)self preferredOverlay]])
  {
    case 1:
      uint64_t v24 = v56;
      unsigned int v25 = (void (*)(void *, uint64_t, uint64_t))v56[2];
      BOOL v26 = v56;
      uint64_t v27 = 4;
      goto LABEL_5;
    case 2:
      uint64_t v24 = v56;
      unsigned int v25 = (void (*)(void *, uint64_t, uint64_t))v56[2];
      BOOL v26 = v56;
      uint64_t v27 = 3;
LABEL_5:
      uint64_t v29 = 0;
      goto LABEL_8;
    case 3:
      uint64_t v24 = v56;
      ((void (*)(void *, uint64_t, uint64_t))v56[2])(v56, 6, 128);
      goto LABEL_9;
    case 4:
      uint64_t v24 = v56;
      unsigned int v25 = (void (*)(void *, uint64_t, uint64_t))v56[2];
      BOOL v26 = v56;
      uint64_t v27 = 2;
      uint64_t v29 = 32;
LABEL_8:
      v25(v26, v27, v29);
      objc_super v28 = LABEL_9:;
      break;
    default:
      objc_super v28 = v61[2]();
      uint64_t v24 = v56;
      break;
  }
  int64_t v30 = v62;
  v31 = [(HKOverlayRoomHeartViewController *)self trendModel];

  if (v31)
  {
    v32 = [(HKOverlayRoomHeartViewController *)self primaryDisplayTypeWithApplicationItems:v54];
    v33 = [HKOverlayRoomTrendContext alloc];
    v34 = [(HKOverlayRoomHeartViewController *)self trendModel];
    v35 = [(HKOverlayRoomTrendContext *)v33 initWithBaseDisplayType:v32 trendModel:v34 overlayChartController:v55 applicationItems:v54 overlayMode:v62];

    v36 = [(HKOverlayRoomViewController *)self chartController];
    [v36 setTrendAccessibilityDelegate:v35];

    v37 = [v59 arrayByAddingObject:v35];

    v38 = [(HKOverlayRoomHeartViewController *)self trendModel];
    int v39 = [v38 selectTrendInitially];

    if (v39)
    {
      v40 = v35;

      objc_super v28 = v40;
    }

    v23 = self;
    int64_t v30 = v62;
  }
  else
  {
    v37 = v59;
  }
  if ((unint64_t)(v30 - 1) >= 2)
  {
    if (v30 != 3)
    {
      v49 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_26;
    }
    uint64_t v50 = [v37 indexOfObject:v28];
    if (v50 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v51 = 0;
    }
    else
    {
      v51 = [NSNumber numberWithUnsignedInteger:v50];
    }
    objc_storeStrong((id *)&v23->_preferredOverlayIndex, v51);
    if (v50 != 0x7FFFFFFFFFFFFFFFLL) {

    }
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v52 = __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v45, 0, v37);
    [v45 addObject:v52];

    v46 = [[HKOverlayContextSectionContainer alloc] initWithContainerTitle:0 overlayContextSections:v45];
    v75 = v46;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  }
  else
  {
    uint64_t v41 = [NSNumber numberWithUnsignedInteger:0];
    preferredOverlayIndex = v23->_preferredOverlayIndex;
    v23->_preferredOverlayIndex = (NSNumber *)v41;

    v43 = v37;
    v44 = [HKOverlayContextSectionContainer alloc];
    v76 = v28;
    id v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
    __115__HKOverlayRoomBloodGlucoseViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke((uint64_t)v45, 0, v45);
    v46 = (HKOverlayContextSectionContainer *)objc_claimAutoreleasedReturnValue();
    v77 = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
    v48 = [(HKOverlayContextSectionContainer *)v44 initWithContainerTitle:0 overlayContextSections:v47];
    v78 = v48;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];

    v37 = v43;
  }

LABEL_26:
  return v49;
}

id __108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  return +[HKOverlayRoomViewControllerIntegratedContext distributionContextWithStyle:a2 namedPredicate:0 overlayChartController:a1[4] applicationItems:a1[5] optionalDelegate:0 options:a3 mode:a1[6]];
}

id __108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_3(void *a1, uint64_t a2)
{
  return +[HKOverlayRoomViewControllerIntegratedContext quantityContextWithIdentifier:a2 overlayChartController:a1[4] applicationItems:a1[5] optionalDelegate:0 seriesOptions:0 mode:a1[6]];
}

HKOverlayRoomViewControllerLastQuantityContext *__108__HKOverlayRoomHeartViewController_contextSectionContainersForMode_applicationItems_overlayChartController___block_invoke_4(void *a1)
{
  v1 = [[HKOverlayRoomViewControllerLastQuantityContext alloc] initWithOverlayChartController:a1[4] applicationItems:a1[5] mode:a1[6]];
  return v1;
}

- (int64_t)_initialPillForPreference:(int64_t)a3
{
  if (unint64_t)a3 < 0xC && ((0xE0Du >> a3)) {
    return qword_1E0F05E38[a3];
  }
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEBUG)) {
    -[HKOverlayRoomHeartViewController _initialPillForPreference:](a3, v4);
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
  id v10 = [HKOverlayRoomHeartViewController alloc];
  int64_t v11 = [(HKOverlayRoomHeartViewController *)self preferredOverlay];
  id v12 = [(HKOverlayRoomHeartViewController *)self trendModel];
  id v13 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  id v14 = [(HKOverlayRoomHeartViewController *)v10 initWithDisplayDate:v9 applicationItems:v8 mode:a3 preferredOverlay:v11 trendModel:v12 factorDisplayTypes:v13];

  [(HKOverlayRoomViewController *)v14 setAdditionalChartOptions:[(HKOverlayRoomViewController *)self filteredInteractiveChartOptionsForMode:a3]];
  return v14;
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
      v6 = [v5 timeScopeController];
      [v6 setSelectedTimeScope:v4];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)HKOverlayRoomHeartViewController;
  id v7 = [(HKOverlayRoomViewController *)&v9 createChartOverlayViewController];
  return v7;
}

- (int64_t)preferredOverlay
{
  return self->_preferredOverlay;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendModel, 0);
  objc_storeStrong((id *)&self->_preferredOverlayIndex, 0);
}

- (void)_initialPillForPreference:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_DEBUG, "HKOverlayRoomHeartViewController received invalid secondary type: %ld", (uint8_t *)&v2, 0xCu);
}

@end