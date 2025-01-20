@interface AIAudiogramEnrollmentViewController
- (AIAudiogramConfirmResultsViewControllerDelegate)audiogramConfirmationDelegate;
- (AIAudiogramEnrollmentViewController)init;
- (AIAudiogramEnrollmentViewController)initWithDelegate:(id)a3;
- (AIAudiogramFinalResultViewController)finalResultViewController;
- (AIAudiogramIngestionEngine)audiogramEngine;
- (AIAudiogramLoadingViewController)loadingController;
- (BOOL)analyticsIngestionAttempted;
- (BOOL)hasLeftMaskedSymbol;
- (BOOL)hasLeftSymbols;
- (BOOL)hasRightMaskedSymbol;
- (BOOL)hasRightSymbols;
- (BOOL)isCameraAvailable;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (HKAudiogramSample)audiogram;
- (HKHealthStore)healthStore;
- (HKUnitPreferenceController)unitPreferenceController;
- (NSArray)audiogramImages;
- (NSArray)selectedFrequencies;
- (NSArray)selectedSymbols;
- (NSDate)initialDate;
- (NSDate)pickedDate;
- (NSMutableSet)frequenciesWithConfiguredInitialPoints;
- (NSNumber)currentFrequency;
- (OBTextWelcomeController)validationFailedController;
- (id)_imagesFromPDF:(id)a3;
- (id)getNextFrequency:(id)a3;
- (int64_t)modalPresentationStyle;
- (unint64_t)analyticsClient;
- (unint64_t)analyticsImportSource;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addDebugToolbarItemToController:(id)a3;
- (void)_addInitialSensitivityPointAtFrequency:(id)a3;
- (void)_cameraAccessisAuthorizedForHealth:(id)a3;
- (void)_cancelTapped:(id)a3;
- (void)_hideAnalyzingAudiogram;
- (void)_importAudiogramImage;
- (void)_importTapped:(id)a3;
- (void)_manuallyImportAudiogram;
- (void)_openCamera;
- (void)_openCameraTapped:(id)a3;
- (void)_openDocumentsTapped:(id)a3;
- (void)_openPhotosTapped:(id)a3;
- (void)_openTapToRadarWithAttachment:(BOOL)a3;
- (void)_prepareToImportAudiogramImages:(id)a3;
- (void)_presentCameraAuthorizationStatusDeniedAlert;
- (void)_showAnalyzingAudiogram;
- (void)_showCameraAuthorizationInSetting;
- (void)_showCameraTips:(id)a3;
- (void)_showDebugViewForImage:(id)a3 debugInfo:(id)a4;
- (void)_showDownloadingAudiogram;
- (void)_showNonCameraOptions:(id)a3;
- (void)_showResultsForAudiogram:(id)a3;
- (void)_showTapToRadarAlert;
- (void)_showValidationFailed;
- (void)_showWelcome;
- (void)_showWelcomeV2;
- (void)_startManualEntryV2;
- (void)_tryAgainTapped:(id)a3;
- (void)audiogramIngestionEngineModelDownloadComplete;
- (void)audiogramIngestionEngineModelDownloadFailed:(id)a3;
- (void)audiogramIngestionEngineModelDownloadProgressed:(float)a3;
- (void)cancelButtonTapped;
- (void)completedAudiogramManualIngestion;
- (void)didSelectNodeToAddWithSelectedFrequency:(id)a3;
- (void)didSelectNodeToEditWithSelectedFrequency:(id)a3;
- (void)dismissCurrentFrequencyInputViewControllerWithAudiogram:(id)a3;
- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4;
- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4;
- (void)documentCameraViewControllerDidCancel:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)refreshFinalConfirmationView;
- (void)setAnalyticsClient:(unint64_t)a3;
- (void)setAnalyticsImportSource:(unint64_t)a3;
- (void)setAnalyticsIngestionAttempted:(BOOL)a3;
- (void)setAudiogram:(id)a3;
- (void)setAudiogramConfirmationDelegate:(id)a3;
- (void)setAudiogramEngine:(id)a3;
- (void)setAudiogramImages:(id)a3;
- (void)setCurrentFrequency:(id)a3;
- (void)setFinalResultViewController:(id)a3;
- (void)setFrequenciesWithConfiguredInitialPoints:(id)a3;
- (void)setHasLeftMaskedSymbol:(BOOL)a3;
- (void)setHasLeftSymbols:(BOOL)a3;
- (void)setHasRightMaskedSymbol:(BOOL)a3;
- (void)setHasRightSymbols:(BOOL)a3;
- (void)setHealthStore:(id)a3;
- (void)setHealthStore:(id)a3 unitPreferenceController:(id)a4 initialDate:(id)a5;
- (void)setInitialDate:(id)a3;
- (void)setIsCameraAvailable:(BOOL)a3;
- (void)setLoadingController:(id)a3;
- (void)setPickedDate:(id)a3;
- (void)setSelectedFrequencies:(id)a3;
- (void)setSelectedSymbols:(id)a3;
- (void)setUnitPreferenceController:(id)a3;
- (void)setValidationFailedController:(id)a3;
- (void)showFrequencySelectionViewController;
- (void)showIndividualFirstSensitivityPointInputViewController;
- (void)showNextFrequencyInputViewControllerWithAudiogram:(id)a3 previousFrequency:(id)a4;
- (void)showSymbolSelectionViewController;
- (void)updateAudiogramDate:(id)a3;
- (void)updateFrequencyViewControllers;
- (void)updateSelectedFrequenciesWithSelectedFrequencies:(id)a3;
- (void)updateSelectedSymbolsWithSelectedSymbols:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AIAudiogramEnrollmentViewController

- (AIAudiogramEnrollmentViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AIAudiogramEnrollmentViewController;
  v2 = [(AIAudiogramEnrollmentViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AIAudiogramEnrollmentViewController *)v2 setAnalyticsClient:0];
  }
  return v3;
}

- (AIAudiogramEnrollmentViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AIAudiogramEnrollmentViewController *)self init];
  v6 = v5;
  if (v5) {
    [(AIAudiogramEnrollmentViewController *)v5 setAudiogramConfirmationDelegate:v4];
  }

  return v6;
}

- (void)setHealthStore:(id)a3 unitPreferenceController:(id)a4 initialDate:(id)a5
{
  id v9 = a5;
  id v8 = a4;
  [(AIAudiogramEnrollmentViewController *)self setHealthStore:a3];
  [(AIAudiogramEnrollmentViewController *)self setUnitPreferenceController:v8];

  [(AIAudiogramEnrollmentViewController *)self setInitialDate:v9];
}

- (void)viewDidLoad
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)AIAudiogramEnrollmentViewController;
  [(OBNavigationController *)&v8 viewDidLoad];
  v3 = [[AIAudiogramIngestionEngine alloc] initWithDelegate:self];
  audiogramEngine = self->_audiogramEngine;
  self->_audiogramEngine = v3;

  self->_isCameraAvailable = [MEMORY[0x263F82808] isSourceTypeAvailable:1];
  BOOL v5 = [(AIAudiogramIngestionEngine *)self->_audiogramEngine isAvailable];
  v6 = AXLogAudiogram();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v5;
    _os_log_impl(&dword_23F0D7000, v6, OS_LOG_TYPE_INFO, "Starting audiogram ingestion. Is model is available? %d", buf, 8u);
  }

  if (!v5) {
    [(AIAudiogramIngestionEngine *)self->_audiogramEngine startRetrievingLatestModelSilently];
  }
  v7 = [(AIAudiogramEnrollmentViewController *)self presentationController];
  [v7 setDelegate:self];

  if (_os_feature_enabled_impl()) {
    [(AIAudiogramEnrollmentViewController *)self _showWelcomeV2];
  }
  else {
    [(AIAudiogramEnrollmentViewController *)self _showWelcome];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AIAudiogramEnrollmentViewController;
  [(AIAudiogramEnrollmentViewController *)&v7 viewDidAppear:a3];
  uint64_t v4 = [(AIAudiogramEnrollmentViewController *)self view];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v6 = [v5 superview];

      BOOL v5 = (void *)v6;
      if (!v6) {
        return;
      }
    }
    [v5 setAccessibilityViewIsModal:1];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)modalPresentationStyle
{
  return 2;
}

- (id)_imagesFromPDF:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  CFURLRef v3 = (const __CFURL *)a3;
  CFURLRef v4 = v3;
  if (!v3)
  {
    v24 = AXLogAudiogram();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[AIAudiogramEnrollmentViewController _imagesFromPDF:]();
    }
    goto LABEL_24;
  }
  CGPDFDocumentRef v5 = CGPDFDocumentCreateWithURL(v3);
  if (!v5)
  {
    v24 = AXLogAudiogram();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[AIAudiogramEnrollmentViewController _imagesFromPDF:]();
    }
LABEL_24:

    objc_super v7 = 0;
    goto LABEL_25;
  }
  uint64_t v6 = v5;
  objc_super v7 = objc_opt_new();
  int64_t NumberOfPages = CGPDFDocumentGetNumberOfPages(v6);
  if (NumberOfPages >= 1)
  {
    int64_t v9 = NumberOfPages;
    size_t v10 = 1;
    do
    {
      Page = CGPDFDocumentGetPage(v6, v10);
      if (Page)
      {
        v12 = Page;
        int RotationAngle = CGPDFPageGetRotationAngle(Page);
        v14 = AXLogAudiogram();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v27 = RotationAngle;
          _os_log_impl(&dword_23F0D7000, v14, OS_LOG_TYPE_INFO, "PDF page angle %i", buf, 8u);
        }

        CGRect BoxRect = CGPDFPageGetBoxRect(v12, kCGPDFMediaBox);
        BoxRect.origin.x = BoxRect.size.width * 4.16666651;
        CGFloat v15 = BoxRect.size.height * 4.16666651;
        BoxRect.origin.y = BoxRect.size.height * 4.16666651;
        UIGraphicsBeginImageContext((CGSize)BoxRect.origin);
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
        CGContextTranslateCTM(CurrentContext, 0.0, v15);
        CGContextScaleCTM(CurrentContext, 4.16666651, -4.16666651);
        CGContextSaveGState(CurrentContext);
        CGContextDrawPDFPage(CurrentContext, v12);
        CGContextRestoreGState(CurrentContext);
        v17 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        uint64_t v18 = 1;
        if ((RotationAngle - 136) >= 0x5A) {
          uint64_t v18 = 2 * ((RotationAngle - 226) < 0x5A);
        }
        if ((RotationAngle - 46) >= 0x5A) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = 3;
        }
        v20 = (void *)MEMORY[0x263F827E8];
        id v21 = v17;
        v22 = objc_msgSend(v20, "imageWithCGImage:scale:orientation:", objc_msgSend(v21, "CGImage"), v19, 1.0);

        [v7 addObject:v22];
      }
      else
      {
        v22 = AXLogAudiogram();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v27 = v10;
          _os_log_error_impl(&dword_23F0D7000, v22, OS_LOG_TYPE_ERROR, "Unable to get page (%i) from document", buf, 8u);
        }
      }

      if (v10 > 2) {
        break;
      }
    }
    while (v9 > (uint64_t)v10++);
  }
  CFRelease(v4);
  CFRelease(v6);
LABEL_25:

  return v7;
}

- (void)_showWelcome
{
  CFURLRef v3 = [MEMORY[0x263F827E8] _systemImageNamed:@"waveform.path"];
  CFURLRef v4 = [MEMORY[0x263F825C8] systemBlueColor];
  id v31 = [v3 imageWithTintColor:v4 renderingMode:1];

  id v5 = objc_alloc(MEMORY[0x263F5B918]);
  uint64_t v6 = aiLocString(@"AudiogramIngestionWelcomeTitle");
  objc_super v7 = aiLocString(@"AudiogramIngestionWelcomeDetailText");
  objc_super v8 = (void *)[v5 initWithTitle:v6 detailText:v7 icon:v31];

  int64_t v9 = [v8 headerView];
  LODWORD(v10) = 1036831949;
  [v9 setTitleHyphenationFactor:v10];

  if ([(AIAudiogramEnrollmentViewController *)self isCameraAvailable])
  {
    uint64_t v11 = [MEMORY[0x263F827E8] _systemImageNamed:@"camera"];
    v12 = [MEMORY[0x263F825C8] systemBlueColor];
    v13 = [v11 imageWithTintColor:v12 renderingMode:1];

    v14 = aiLocString(@"AudiogramIngestionOptionCameraTitle");
    CGFloat v15 = aiLocString(@"AudiogramIngestionOptionCameraDescription");
    [v8 addBulletedListItemWithTitle:v14 description:v15 image:v13];
  }
  v16 = [MEMORY[0x263F827E8] _systemImageNamed:@"photo.on.rectangle.angled"];
  v17 = [MEMORY[0x263F825C8] systemBlueColor];
  uint64_t v18 = [v16 imageWithTintColor:v17 renderingMode:1];

  uint64_t v19 = aiLocString(@"AudiogramIngestionOptionPhotosTitle");
  v20 = aiLocString(@"AudiogramIngestionOptionPhotosDescription");
  [v8 addBulletedListItemWithTitle:v19 description:v20 image:v18];

  id v21 = [MEMORY[0x263F827E8] _systemImageNamed:@"folder"];
  v22 = [MEMORY[0x263F825C8] systemBlueColor];
  v23 = [v21 imageWithTintColor:v22 renderingMode:1];

  v24 = aiLocString(@"AudiogramIngestionOptionFilesTitle");
  v25 = aiLocString(@"AudiogramIngestionOptionFilesDescription");
  [v8 addBulletedListItemWithTitle:v24 description:v25 image:v23];

  v26 = [MEMORY[0x263F5B898] boldButton];
  int v27 = aiLocString(@"AudiogramIngestionImportButton");
  [v26 setTitle:v27 forState:0];

  [v26 addTarget:self action:sel__importTapped_ forControlEvents:64];
  uint64_t v28 = [v8 buttonTray];
  [v28 addButton:v26];

  v29 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelTapped_];
  v30 = [v8 navigationItem];
  [v30 setRightBarButtonItem:v29];

  [(OBNavigationController *)self pushViewController:v8 animated:1];
}

- (void)_showWelcomeV2
{
  id v24 = [MEMORY[0x263F827E8] _systemImageNamed:@"chart.line.text.clipboard"];
  id v3 = objc_alloc(MEMORY[0x263F5B918]);
  CFURLRef v4 = aiLocString(@"AudiogramIngestionWelcomeTitleV2");
  id v5 = aiLocString(@"AudiogramIngestionWelcomeDetailTextV2");
  uint64_t v6 = (void *)[v3 initWithTitle:v4 detailText:v5 icon:v24];

  objc_super v7 = [v6 headerView];
  LODWORD(v8) = 1036831949;
  [v7 setTitleHyphenationFactor:v8];

  int64_t v9 = audiogramIngestionImageNamed(@"audiogram_symbols");
  if (_os_feature_enabled_impl())
  {
    uint64_t v10 = [MEMORY[0x263F827E8] _systemImageNamed:@"xmark.triangle.circle.square"];

    int64_t v9 = (void *)v10;
  }
  uint64_t v11 = aiLocString(@"AudiogramIngestionOptionSymbolsTitle");
  v12 = aiLocString(@"AudiogramIngestionOptionSymbolsDescription");
  [v6 addBulletedListItemWithTitle:v11 description:v12 image:v9];

  v13 = [MEMORY[0x263F827E8] _systemImageNamed:@"lines.audiogram"];
  v14 = aiLocString(@"AudiogramIngestionOptionFrequenciesTitle");
  CGFloat v15 = aiLocString(@"AudiogramIngestionOptionFrequenciesDescription");
  [v6 addBulletedListItemWithTitle:v14 description:v15 image:v13];

  if ([(AIAudiogramEnrollmentViewController *)self isCameraAvailable])
  {
    v16 = [MEMORY[0x263F5B898] boldButton];
    v17 = aiLocString(@"AudiogramIngestionScanWithCameraButton");
    [v16 setTitle:v17 forState:0];

    [v16 addTarget:self action:sel__showCameraTips_ forControlEvents:64];
    uint64_t v18 = [v6 buttonTray];
    [v18 addButton:v16];
  }
  uint64_t v19 = [MEMORY[0x263F5B8D0] linkButton];
  v20 = aiLocString(@"AudiogramIngestionEnterManuallyButton");
  [v19 setTitle:v20 forState:0];

  [v19 addTarget:self action:sel__showNonCameraOptions_ forControlEvents:64];
  id v21 = [v6 buttonTray];
  [v21 addButton:v19];

  v22 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelTapped_];
  v23 = [v6 navigationItem];
  [v23 setRightBarButtonItem:v22];

  [(OBNavigationController *)self pushViewController:v6 animated:1];
}

- (void)_startManualEntryV2
{
  [(AIAudiogramEnrollmentViewController *)self setAnalyticsImportSource:0];
  [(AIAudiogramEnrollmentViewController *)self setAudiogram:0];
  [(AIAudiogramEnrollmentViewController *)self setSelectedFrequencies:0];
  id v3 = [MEMORY[0x263EFF910] date];
  [(AIAudiogramEnrollmentViewController *)self setPickedDate:v3];

  [(AIAudiogramEnrollmentViewController *)self setSelectedSymbols:0];
  if (_os_feature_enabled_impl())
  {
    [(AIAudiogramEnrollmentViewController *)self showSymbolSelectionViewController];
  }
  else
  {
    [(AIAudiogramEnrollmentViewController *)self setHasLeftSymbols:1];
    [(AIAudiogramEnrollmentViewController *)self setHasRightSymbols:1];
    [(AIAudiogramEnrollmentViewController *)self showFrequencySelectionViewController];
  }
}

- (void)_showValidationFailed
{
}

void __60__AIAudiogramEnrollmentViewController__showValidationFailed__block_invoke(uint64_t a1)
{
  v66[4] = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    v2 = [*(id *)(a1 + 32) audiogramEngine];
    uint64_t v3 = [v2 failureMode];

    if ((unint64_t)(v3 - 1) > 3)
    {
      CFURLRef v4 = 0;
    }
    else
    {
      CFURLRef v4 = aiLocString(off_265059548[v3 - 1]);
    }
    int64_t v9 = aiLocString(@"AudiogramIngestionValidationFailedDescriptionV2");
    uint64_t v10 = v9;
    if (v4)
    {
      uint64_t v11 = aiLocString(@"AudiogramIngestionValidationFailedWithReasonFormat");
      v51 = v4;
      v52 = v10;
      AXCFormattedString();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = v9;
    }
    id v13 = objc_alloc(MEMORY[0x263F5B908]);
    v14 = aiLocString(@"AudiogramIngestionValidationFailedTitleV2");
    CGFloat v15 = (void *)[v13 initWithTitle:v14 detailText:v12 icon:0 contentLayout:2];
    [*(id *)(a1 + 32) setValidationFailedController:v15];

    v16 = [*(id *)(a1 + 32) validationFailedController];
    v17 = [v16 headerView];
    uint64_t v18 = [v17 customIconContainerView];

    if (v18)
    {
      uint64_t v19 = [*(id *)(a1 + 32) audiogramImages];
      v20 = [v19 firstObject];

      if (v20)
      {
        id v21 = objc_alloc(MEMORY[0x263F82828]);
        v22 = [*(id *)(a1 + 32) audiogramImages];
        [v22 firstObject];
        v23 = id v63 = v12;
        v64 = v10;
        id v24 = (void *)[v21 initWithImage:v23];

        [v24 setContentMode:1];
        [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v18 addSubview:v24];
        [v18 setClipsToBounds:0];
        v56 = (void *)MEMORY[0x263F08938];
        v62 = [v24 centerXAnchor];
        v61 = [v18 centerXAnchor];
        v60 = [v62 constraintEqualToAnchor:v61];
        v66[0] = v60;
        v59 = [v24 centerYAnchor];
        v58 = [v18 centerYAnchor];
        v57 = [v59 constraintEqualToAnchor:v58];
        v66[1] = v57;
        v55 = [v24 heightAnchor];
        v54 = [v18 heightAnchor];
        v53 = [v55 constraintEqualToAnchor:v54];
        v66[2] = v53;
        v25 = [v18 superview];
        v26 = [v25 heightAnchor];
        int v27 = [*(id *)(a1 + 32) validationFailedController];
        [v27 view];
        uint64_t v28 = v65 = v4;
        v29 = [v28 heightAnchor];
        v30 = [v26 constraintEqualToAnchor:v29 multiplier:0.2];
        v66[3] = v30;
        id v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:4];
        [v56 activateConstraints:v31];

        CFURLRef v4 = v65;
        id v12 = v63;

        uint64_t v10 = v64;
      }
    }
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x263F5B908]);
    uint64_t v6 = aiLocString(@"AudiogramIngestionValidationFailedTitle");
    objc_super v7 = aiLocString(@"AudiogramIngestionValidationFailedDescription");
    double v8 = (void *)[v5 initWithTitle:v6 detailText:v7 symbolName:0 contentLayout:2];
    [*(id *)(a1 + 32) setValidationFailedController:v8];
  }
  v32 = objc_msgSend(*(id *)(a1 + 32), "validationFailedController", v51, v52);
  v33 = [v32 headerView];
  LODWORD(v34) = 1036831949;
  [v33 setTitleHyphenationFactor:v34];

  v35 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:*(void *)(a1 + 32) action:sel__cancelTapped_];
  v36 = [*(id *)(a1 + 32) validationFailedController];
  v37 = [v36 navigationItem];
  [v37 setRightBarButtonItem:v35];

  LODWORD(v37) = _os_feature_enabled_impl();
  v38 = [MEMORY[0x263F5B898] boldButton];
  if (v37)
  {
    v39 = aiLocString(@"AudiogramIngestionValidationFailedTryAgain");
    [v38 setTitle:v39 forState:0];

    [v38 addTarget:*(void *)(a1 + 32) action:sel__tryAgainTapped_ forControlEvents:64];
    v40 = [*(id *)(a1 + 32) validationFailedController];
    v41 = [v40 buttonTray];
    [v41 addButton:v38];

    v42 = [MEMORY[0x263F5B8D0] linkButton];
    v43 = aiLocString(@"AudiogramIngestionEnterManuallyButton");
    [v42 setTitle:v43 forState:0];

    [v42 addTarget:*(void *)(a1 + 32) action:sel__startManualEntryV2 forControlEvents:64];
    v44 = [*(id *)(a1 + 32) validationFailedController];
    v45 = [v44 buttonTray];
    [v45 addButton:v42];
  }
  else
  {
    v46 = aiLocString(@"AudiogramIngestionManualImportButton");
    [v38 setTitle:v46 forState:0];

    [v38 addTarget:*(void *)(a1 + 32) action:sel__manuallyImportAudiogram forControlEvents:64];
    v42 = [*(id *)(a1 + 32) validationFailedController];
    v44 = [v42 buttonTray];
    [v44 addButton:v38];
  }

  [*(id *)(a1 + 32) _hideAnalyzingAudiogram];
  v47 = [*(id *)(a1 + 32) topViewController];
  v48 = [*(id *)(a1 + 32) validationFailedController];

  if (v47 != v48)
  {
    v49 = *(void **)(a1 + 32);
    v50 = [v49 validationFailedController];
    [v49 pushViewController:v50 animated:0];

    if ([MEMORY[0x263F472B0] isInternalInstall])
    {
      if (_os_feature_enabled_impl()) {
        AXPerformBlockOnMainThreadAfterDelay();
      }
    }
  }
}

void __60__AIAudiogramEnrollmentViewController__showValidationFailed__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 validationFailedController];
  [v1 _addDebugToolbarItemToController:v2];
}

- (void)_showDownloadingAudiogram
{
}

void __64__AIAudiogramEnrollmentViewController__showDownloadingAudiogram__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) topViewController];
  uint64_t v3 = [*(id *)(a1 + 32) loadingController];

  if (v2 != v3)
  {
    CFURLRef v4 = [AIAudiogramLoadingViewController alloc];
    id v5 = aiLocString(@"AudiogramIngestionDownloadingTitle");
    uint64_t v6 = [(AIAudiogramLoadingViewController *)v4 initWithTitle:v5 style:0];
    [*(id *)(a1 + 32) setLoadingController:v6];

    objc_super v7 = *(void **)(a1 + 32);
    id v8 = [v7 loadingController];
    [v7 pushViewController:v8 animated:1];
  }
}

- (void)_showAnalyzingAudiogram
{
}

void __62__AIAudiogramEnrollmentViewController__showAnalyzingAudiogram__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) topViewController];
  uint64_t v3 = [*(id *)(a1 + 32) loadingController];

  if (v2 != v3)
  {
    CFURLRef v4 = [[AIAudiogramLoadingViewController alloc] initWithTitle:&stru_26F2D3B98 style:1];
    [*(id *)(a1 + 32) setLoadingController:v4];

    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 loadingController];
    [v5 pushViewController:v6 animated:0];
  }
}

- (void)_hideAnalyzingAudiogram
{
}

void __62__AIAudiogramEnrollmentViewController__hideAnalyzingAudiogram__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) topViewController];
  uint64_t v3 = [*(id *)(a1 + 32) loadingController];

  if (v2 == v3) {
    id v4 = (id)[*(id *)(a1 + 32) popViewControllerAnimated:0];
  }
}

- (void)_showResultsForAudiogram:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockOnMainThread();
}

void __64__AIAudiogramEnrollmentViewController__showResultsForAudiogram___block_invoke(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    id v2 = [*(id *)(a1 + 32) topViewController];
    id v3 = [*(id *)(a1 + 32) loadingController];

    if (v2 == v3)
    {
      [*(id *)(a1 + 32) _hideAnalyzingAudiogram];
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      char v47 = 0;
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x2020000000;
      char v43 = 0;
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__7;
      v38 = __Block_byref_object_dispose__7;
      id v39 = [MEMORY[0x263EFF9C0] set];
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x3032000000;
      id v31 = __Block_byref_object_copy__7;
      v32 = __Block_byref_object_dispose__7;
      id v33 = [MEMORY[0x263EFF980] array];
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      char v27 = 0;
      uint64_t v20 = 0;
      id v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 0;
      id v4 = [*(id *)(a1 + 40) sensitivityPoints];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __64__AIAudiogramEnrollmentViewController__showResultsForAudiogram___block_invoke_434;
      v19[3] = &unk_265059238;
      v19[4] = &v44;
      v19[5] = &v20;
      v19[6] = &v34;
      v19[7] = &v40;
      v19[8] = &v24;
      v19[9] = &v28;
      [v4 enumerateObjectsUsingBlock:v19];

      [*(id *)(a1 + 32) setSelectedFrequencies:v29[5]];
      [*(id *)(a1 + 32) setAudiogram:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) setHasRightSymbols:*((unsigned __int8 *)v41 + 24)];
      [*(id *)(a1 + 32) setHasLeftSymbols:*((unsigned __int8 *)v45 + 24)];
      id v5 = [MEMORY[0x263EFF910] date];
      [*(id *)(a1 + 32) setPickedDate:v5];

      id v6 = [(id)v35[5] allObjects];
      [*(id *)(a1 + 32) setSelectedSymbols:v6];

      [*(id *)(a1 + 32) setHasRightMaskedSymbol:*((unsigned __int8 *)v25 + 24)];
      [*(id *)(a1 + 32) setHasLeftMaskedSymbol:*((unsigned __int8 *)v21 + 24)];
      objc_super v7 = [AIAudiogramFinalResultViewController alloc];
      uint64_t v8 = v29[5];
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = [*(id *)(a1 + 32) audiogramConfirmationDelegate];
      uint64_t v11 = [(AIAudiogramFinalResultViewController *)v7 initWithAudiogram:v9 selectedFrequencies:v8 audiogramConfirmationDelegate:v10 audiogramManualIngestionDelegate:*(void *)(a1 + 32)];

      -[AIAudiogramFinalResultViewController setAnalyticsImportSource:](v11, "setAnalyticsImportSource:", [*(id *)(a1 + 32) analyticsImportSource]);
      -[AIAudiogramFinalResultViewController setAnalyticsClient:](v11, "setAnalyticsClient:", [*(id *)(a1 + 32) analyticsClient]);
      [*(id *)(a1 + 32) pushViewController:v11 animated:0];
      [*(id *)(a1 + 32) setFinalResultViewController:v11];
      if ([MEMORY[0x263F472B0] isInternalInstall])
      {
        uint64_t v18 = v11;
        AXPerformBlockOnMainThreadAfterDelay();
      }
      _Block_object_dispose(&v20, 8);
      _Block_object_dispose(&v24, 8);
      _Block_object_dispose(&v28, 8);

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v40, 8);
      _Block_object_dispose(&v44, 8);
    }
  }
  else
  {
    id v12 = [AIAudiogramResultsViewController alloc];
    id v13 = [*(id *)(a1 + 32) audiogramConfirmationDelegate];
    v17 = [(AIAudiogramResultsViewController *)v12 initWithDelegate:v13 audiogram:*(void *)(a1 + 40)];

    v14 = [*(id *)(a1 + 32) healthStore];
    [(AIAudiogramResultsViewController *)v17 setHealthStore:v14];

    CGFloat v15 = [*(id *)(a1 + 32) unitPreferenceController];
    [(AIAudiogramResultsViewController *)v17 setUnitPreferenceController:v15];

    v16 = [*(id *)(a1 + 32) initialDate];
    [(AIAudiogramResultsViewController *)v17 setInitialDate:v16];

    [(AIAudiogramResultsViewController *)v17 setAnalyticsDidCompleteIngestion:*(void *)(a1 + 40) != 0];
    -[AIAudiogramResultsViewController setAnalyticsImportSource:](v17, "setAnalyticsImportSource:", [*(id *)(a1 + 32) analyticsImportSource]);
    -[AIAudiogramResultsViewController setAnalyticsClient:](v17, "setAnalyticsClient:", [*(id *)(a1 + 32) analyticsClient]);
    [*(id *)(a1 + 32) pushViewController:v17 animated:0];
  }
}

void __64__AIAudiogramEnrollmentViewController__showResultsForAudiogram___block_invoke_434(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v20 = a2;
  id v3 = [v20 tests];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (![v8 side])
        {
          *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
          int v13 = [v8 masked];
          uint64_t v10 = &unk_26F2DB3A0;
          if (!v13) {
            goto LABEL_15;
          }
          int v14 = _os_feature_enabled_impl();
          uint64_t v10 = &unk_26F2DB3A0;
          if (!v14) {
            goto LABEL_15;
          }
          id v12 = (unsigned char *)(*(void *)(a1[5] + 8) + 24);
          uint64_t v10 = &unk_26F2DB388;
          goto LABEL_14;
        }
        if ([v8 side] != 1) {
          continue;
        }
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
        int v9 = [v8 masked];
        uint64_t v10 = &unk_26F2DB3D0;
        if (v9)
        {
          int v11 = _os_feature_enabled_impl();
          uint64_t v10 = &unk_26F2DB3D0;
          if (v11)
          {
            id v12 = (unsigned char *)(*(void *)(a1[8] + 8) + 24);
            uint64_t v10 = &unk_26F2DB3B8;
LABEL_14:
            unsigned char *v12 = 1;
          }
        }
LABEL_15:
        [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  CGFloat v15 = *(void **)(*(void *)(a1[9] + 8) + 40);
  v16 = NSNumber;
  v17 = [v20 frequency];
  uint64_t v18 = [getHKUnitClass_3() hertzUnit];
  [v17 doubleValueForUnit:v18];
  uint64_t v19 = objc_msgSend(v16, "numberWithDouble:");
  [v15 addObject:v19];
}

uint64_t __64__AIAudiogramEnrollmentViewController__showResultsForAudiogram___block_invoke_445(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addDebugToolbarItemToController:*(void *)(a1 + 40)];
}

- (void)_addDebugToolbarItemToController:(id)a3
{
  v35[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F472B0] isInternalInstall])
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v5 = [v4 navigationItem];
      uint64_t v6 = [v5 rightBarButtonItems];
      unint64_t v7 = [v6 count];

      if (v7 <= 1)
      {
        objc_initWeak(&location, self);
        uint64_t v8 = (void *)MEMORY[0x263F82940];
        int v9 = (void *)MEMORY[0x263F823D0];
        uint64_t v10 = [MEMORY[0x263F827E8] _systemImageNamed:@"rectangle.3.group"];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __72__AIAudiogramEnrollmentViewController__addDebugToolbarItemToController___block_invoke;
        v32[3] = &unk_265059288;
        objc_copyWeak(&v33, &location);
        int v11 = [v9 actionWithTitle:@"Debug View" image:v10 identifier:@"debug" handler:v32];
        v35[0] = v11;
        id v12 = (void *)MEMORY[0x263F823D0];
        int v13 = [MEMORY[0x263F827E8] _systemImageNamed:@"ant"];
        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        v29 = __72__AIAudiogramEnrollmentViewController__addDebugToolbarItemToController___block_invoke_3;
        uint64_t v30 = &unk_265059288;
        objc_copyWeak(&v31, &location);
        int v14 = [v12 actionWithTitle:@"File Radar" image:v13 identifier:@"radar" handler:&v27];
        v35[1] = v14;
        CGFloat v15 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v35, 2, v27, v28, v29, v30);
        v16 = [v8 menuWithTitle:@"[Internal Only]" children:v15];

        id v17 = objc_alloc(MEMORY[0x263F824A8]);
        uint64_t v18 = [MEMORY[0x263F827E8] _systemImageNamed:@"ant.fill"];
        uint64_t v19 = (void *)[v17 initWithImage:v18 menu:v16];

        id v20 = [v4 navigationItem];
        long long v21 = [v20 rightBarButtonItems];
        long long v22 = (void *)[v21 mutableCopy];
        long long v23 = v22;
        if (v22)
        {
          id v24 = v22;
        }
        else
        {
          id v24 = [MEMORY[0x263EFF980] array];
        }
        v25 = v24;

        [v25 addObject:v19];
        uint64_t v26 = [v4 navigationItem];
        [v26 setRightBarButtonItems:v25];

        objc_destroyWeak(&v31);
        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __72__AIAudiogramEnrollmentViewController__addDebugToolbarItemToController___block_invoke(uint64_t a1)
{
  id v2 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__AIAudiogramEnrollmentViewController__addDebugToolbarItemToController___block_invoke_2;
  block[3] = &unk_265059260;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __72__AIAudiogramEnrollmentViewController__addDebugToolbarItemToController___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v2 = [WeakRetained audiogramEngine];
    id v3 = [v6[184] firstObject];
    id v4 = [v2 audiogramDetectorResultsFromImage:v3];

    uint64_t v5 = [v6[184] firstObject];
    [v6 _showDebugViewForImage:v5 debugInfo:v4];

    WeakRetained = v6;
  }
}

void __72__AIAudiogramEnrollmentViewController__addDebugToolbarItemToController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showTapToRadarAlert];
}

- (void)_showDebugViewForImage:(id)a3 debugInfo:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  AXPerformBlockOnMainThread();
}

void __72__AIAudiogramEnrollmentViewController__showDebugViewForImage_debugInfo___block_invoke(uint64_t a1)
{
  id v2 = [[_TtC18AudiogramIngestion28AudiogramDebugViewController alloc] initWithImage:*(void *)(a1 + 32) debugInfo:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) pushViewController:v2 animated:1];
}

- (void)_showTapToRadarAlert
{
  id v3 = [MEMORY[0x263F82418] alertControllerWithTitle:@"File Radar" message:@"Attach image of audiogram for easier debugging?" preferredStyle:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__AIAudiogramEnrollmentViewController__showTapToRadarAlert__block_invoke;
  v8[3] = &unk_2650592D8;
  v8[4] = self;
  id v4 = [MEMORY[0x263F82400] actionWithTitle:@"Attach" style:0 handler:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__AIAudiogramEnrollmentViewController__showTapToRadarAlert__block_invoke_2;
  v7[3] = &unk_2650592D8;
  v7[4] = self;
  id v5 = [MEMORY[0x263F82400] actionWithTitle:@"Do not attach" style:0 handler:v7];
  id v6 = [MEMORY[0x263F82400] actionWithTitle:@"Cancel" style:1 handler:&__block_literal_global_1];
  [v3 addAction:v4];
  [v3 addAction:v5];
  [v3 addAction:v6];
  [(AIAudiogramEnrollmentViewController *)self presentViewController:v3 animated:1 completion:0];
}

uint64_t __59__AIAudiogramEnrollmentViewController__showTapToRadarAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openTapToRadarWithAttachment:1];
}

uint64_t __59__AIAudiogramEnrollmentViewController__showTapToRadarAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openTapToRadarWithAttachment:0];
}

- (void)_openTapToRadarWithAttachment:(BOOL)a3
{
  BOOL v3 = a3;
  v40[11] = *MEMORY[0x263EF8340];
  id v24 = objc_opt_new();
  [v24 setDateFormat:@"yyyy.MM.dd_HH-mm-ss"];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__7;
  v38 = __Block_byref_object_dispose__7;
  id v39 = [MEMORY[0x263EFF980] array];
  if (v3)
  {
    id v5 = NSURL;
    id v6 = NSTemporaryDirectory();
    id v7 = [v5 fileURLWithPath:v6];

    id v8 = [(AIAudiogramEnrollmentViewController *)self audiogramImages];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __69__AIAudiogramEnrollmentViewController__openTapToRadarWithAttachment___block_invoke;
    v31[3] = &unk_265059320;
    id v9 = v7;
    id v32 = v9;
    id v33 = &v34;
    [v8 enumerateObjectsUsingBlock:v31];
  }
  id v10 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v10 setScheme:@"tap-to-radar"];
  [v10 setHost:@"new"];
  uint64_t v30 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentID" value:@"1105897"];
  v40[0] = v30;
  v29 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentName" value:@"Hearing Accessibility"];
  v40[1] = v29;
  uint64_t v28 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentVersion" value:@"iOS"];
  v40[2] = v28;
  uint64_t v27 = [MEMORY[0x263F08BD0] queryItemWithName:@"Classification" value:@"Other Bug"];
  v40[3] = v27;
  uint64_t v26 = [MEMORY[0x263F08BD0] queryItemWithName:@"Reproducibility" value:@"I Didn't Try"];
  v40[4] = v26;
  v25 = [MEMORY[0x263F08BD0] queryItemWithName:@"Title" value:@"Audiogram Ingestion Accuracy Issue"];
  v40[5] = v25;
  int v11 = [MEMORY[0x263F08BD0] queryItemWithName:@"Description", @"Please share some information on what went wrong (symbols were not identified, had wrong values, etc)" value];
  v40[6] = v11;
  id v12 = (void *)MEMORY[0x263F08BD0];
  int v13 = [MEMORY[0x263EFF910] now];
  int v14 = [v24 stringFromDate:v13];
  CGFloat v15 = [v12 queryItemWithName:@"TimeOfIssue" value:v14];
  v40[7] = v15;
  v16 = (void *)MEMORY[0x263F08BD0];
  id v17 = [(id)v35[5] componentsJoinedByString:@","];
  uint64_t v18 = [v16 queryItemWithName:@"Attachments" value:v17];
  v40[8] = v18;
  uint64_t v19 = [MEMORY[0x263F08BD0] queryItemWithName:@"DeleteOnAttach" value:@"1"];
  v40[9] = v19;
  id v20 = [MEMORY[0x263F08BD0] queryItemWithName:@"IncludeDevicePrefixInTitle" value:@"1"];
  v40[10] = v20;
  long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:11];
  [v10 setQueryItems:v21];

  long long v22 = [v10 URL];
  long long v23 = [MEMORY[0x263F01880] defaultWorkspace];
  [v23 openURL:v22 withOptions:0];

  _Block_object_dispose(&v34, 8);
}

void __69__AIAudiogramEnrollmentViewController__openTapToRadarWithAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = NSString;
  id v7 = a2;
  id v8 = objc_msgSend(v6, "stringWithFormat:", @"Image%lu.jpeg", a3);
  id v12 = [v5 URLByAppendingPathComponent:v8];

  id v9 = UIImageJPEGRepresentation(v7, 1.0);

  [v9 writeToURL:v12 atomically:1];
  id v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  int v11 = [v12 path];
  [v10 addObject:v11];
}

- (void)_manuallyImportAudiogram
{
  if (_os_feature_enabled_impl())
  {
    [(AIAudiogramEnrollmentViewController *)self _startManualEntryV2];
  }
  else
  {
    [(AIAudiogramEnrollmentViewController *)self setAnalyticsImportSource:0];
    [(AIAudiogramEnrollmentViewController *)self _showResultsForAudiogram:0];
  }
}

- (void)_cameraAccessisAuthorizedForHealth:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([MEMORY[0x263F472B0] currentProcessIsHealth])
  {
    id v4 = (id)*MEMORY[0x263EF9D48];
    uint64_t v5 = [MEMORY[0x263EFA598] authorizationStatusForMediaType:v4];
    id v6 = AXLogAudiogram();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = v5;
      _os_log_impl(&dword_23F0D7000, v6, OS_LOG_TYPE_INFO, "The authorization status of camera access in Health app audiogram ingestion: %i", buf, 8u);
    }

    if ((unint64_t)(v5 - 1) >= 3)
    {
      if (!v5)
      {
        id v10 = (void *)MEMORY[0x263EFA598];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_2;
        v14[3] = &unk_265059398;
        id v7 = &v16;
        id v16 = v3;
        id v15 = v4;
        [v10 requestAccessForMediaType:v15 completionHandler:v14];

LABEL_12:
        goto LABEL_13;
      }
      int v11 = AXLogAudiogram();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v20 = v5;
        _os_log_impl(&dword_23F0D7000, v11, OS_LOG_TYPE_INFO, "Unexpected authorization status of camera access in Health app audiogram ingestion: %i", buf, 8u);
      }

      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_571;
      v12[3] = &unk_265059348;
      id v7 = (id *)v13;
      v13[0] = v3;
      v13[1] = v5;
      id v8 = MEMORY[0x263EF83A0];
      id v9 = v12;
    }
    else
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke;
      v17[3] = &unk_265059348;
      id v7 = (id *)v18;
      v18[0] = v3;
      v18[1] = v5;
      id v8 = MEMORY[0x263EF83A0];
      id v9 = v17;
    }
    dispatch_async(v8, v9);
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_3;
  v2[3] = &unk_265059370;
  id v4 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [MEMORY[0x263EFA598] authorizationStatusForMediaType:*(void *)(a1 + 32)];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

uint64_t __74__AIAudiogramEnrollmentViewController__cameraAccessisAuthorizedForHealth___block_invoke_571(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_presentCameraAuthorizationStatusDeniedAlert
{
}

void __83__AIAudiogramEnrollmentViewController__presentCameraAuthorizationStatusDeniedAlert__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F82418];
  id v3 = aiLocString(@"AudiogramIngestionTCCCameraDeniedTitle");
  id v4 = aiLocString(@"AudiogramIngestionTCCCameraDeniedMessage");
  uint64_t v5 = [v2 alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  id v6 = (void *)MEMORY[0x263F82400];
  id v7 = aiLocString(@"AudiogramIngestionTCCCameraDeniedCancelAction");
  id v8 = [v6 actionWithTitle:v7 style:1 handler:0];

  id v9 = (void *)MEMORY[0x263F82400];
  id v10 = aiLocString(@"AudiogramIngestionTCCCameraDeniedDefaultAction");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__AIAudiogramEnrollmentViewController__presentCameraAuthorizationStatusDeniedAlert__block_invoke_2;
  v12[3] = &unk_2650592D8;
  void v12[4] = *(void *)(a1 + 32);
  int v11 = [v9 actionWithTitle:v10 style:0 handler:v12];

  [v5 addAction:v8];
  [v5 addAction:v11];
  [v5 setPreferredAction:v11];
  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

uint64_t __83__AIAudiogramEnrollmentViewController__presentCameraAuthorizationStatusDeniedAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showCameraAuthorizationInSetting];
}

- (void)_showCameraAuthorizationInSetting
{
  [NSURL URLWithString:@"prefs:root=HEALTH"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [MEMORY[0x263F01880] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)_importTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F82418];
  id v6 = aiLocString(@"AudiogramIngestionImportTitle");
  id v7 = [v5 alertControllerWithTitle:v6 message:0 preferredStyle:0];

  if ([(AIAudiogramEnrollmentViewController *)self isCameraAvailable])
  {
    id v8 = (void *)MEMORY[0x263F82400];
    id v9 = aiLocString(@"AudiogramIngestionImportOptionCamera");
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke;
    v27[3] = &unk_2650592D8;
    v27[4] = self;
    id v10 = [v8 actionWithTitle:v9 style:0 handler:v27];

    [v7 addAction:v10];
  }
  int v11 = (void *)MEMORY[0x263F82400];
  id v12 = aiLocString(@"AudiogramIngestionImportOptionPhotos");
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke_2;
  v26[3] = &unk_2650592D8;
  v26[4] = self;
  int v13 = [v11 actionWithTitle:v12 style:0 handler:v26];

  int v14 = (void *)MEMORY[0x263F82400];
  id v15 = aiLocString(@"AudiogramIngestionImportOptionFiles");
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke_3;
  v25[3] = &unk_2650592D8;
  v25[4] = self;
  id v16 = [v14 actionWithTitle:v15 style:0 handler:v25];

  id v17 = (void *)MEMORY[0x263F82400];
  uint64_t v18 = aiLocString(@"AudiogramIngestionImportOptionCancel");
  uint64_t v19 = [v17 actionWithTitle:v18 style:1 handler:0];

  [v7 addAction:v13];
  [v7 addAction:v16];
  [v7 addAction:v19];
  if (_os_feature_enabled_impl())
  {
    uint64_t v20 = [v7 popoverPresentationController];
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      long long v22 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v24 = [v7 popoverPresentationController];
        [v24 setSourceView:v4];
      }
    }
  }
  [(AIAudiogramEnrollmentViewController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openCameraTapped:0];
}

uint64_t __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openPhotosTapped:0];
}

uint64_t __53__AIAudiogramEnrollmentViewController__importTapped___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openDocumentsTapped:0];
}

- (void)_openCameraTapped:(id)a3
{
  if (objc_msgSend(MEMORY[0x263F472B0], "currentProcessIsHealth", a3))
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __57__AIAudiogramEnrollmentViewController__openCameraTapped___block_invoke;
    v4[3] = &unk_2650593C0;
    v4[4] = self;
    [(AIAudiogramEnrollmentViewController *)self _cameraAccessisAuthorizedForHealth:v4];
  }
  else
  {
    [(AIAudiogramEnrollmentViewController *)self _openCamera];
  }
}

uint64_t __57__AIAudiogramEnrollmentViewController__openCameraTapped___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 2) {
    return [*(id *)(result + 32) _presentCameraAuthorizationStatusDeniedAlert];
  }
  if (a2 == 3) {
    return [*(id *)(result + 32) _openCamera];
  }
  return result;
}

- (void)_openCamera
{
  id v3 = (id)objc_opt_new();
  [v3 setDelegate:self];
  [(AIAudiogramEnrollmentViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)_openPhotosTapped:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2050000000;
  uint64_t v5 = (void *)getPHPickerConfigurationClass_softClass;
  uint64_t v25 = getPHPickerConfigurationClass_softClass;
  if (!getPHPickerConfigurationClass_softClass)
  {
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __getPHPickerConfigurationClass_block_invoke;
    uint64_t v20 = &unk_265058588;
    uint64_t v21 = &v22;
    __getPHPickerConfigurationClass_block_invoke((uint64_t)&v17);
    uint64_t v5 = (void *)v23[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v22, 8);
  id v7 = [v6 alloc];
  id v8 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
  id v9 = (void *)[v7 initWithPhotoLibrary:v8];

  [v9 setSelectionLimit:1];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v10 = (void *)getPHPickerFilterClass_softClass;
  uint64_t v25 = getPHPickerFilterClass_softClass;
  if (!getPHPickerFilterClass_softClass)
  {
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __getPHPickerFilterClass_block_invoke;
    uint64_t v20 = &unk_265058588;
    uint64_t v21 = &v22;
    __getPHPickerFilterClass_block_invoke((uint64_t)&v17);
    id v10 = (void *)v23[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v22, 8);
  id v12 = [v11 imagesFilter];
  [v9 setFilter:v12];

  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2050000000;
  int v13 = (void *)getPHPickerViewControllerClass_softClass;
  uint64_t v25 = getPHPickerViewControllerClass_softClass;
  if (!getPHPickerViewControllerClass_softClass)
  {
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __getPHPickerViewControllerClass_block_invoke;
    uint64_t v20 = &unk_265058588;
    uint64_t v21 = &v22;
    __getPHPickerViewControllerClass_block_invoke((uint64_t)&v17);
    int v13 = (void *)v23[3];
  }
  int v14 = v13;
  _Block_object_dispose(&v22, 8);
  id v15 = (void *)[[v14 alloc] initWithConfiguration:v9];
  [v15 setDelegate:self];
  id v16 = [v15 presentationController];
  [v16 setDelegate:self];

  [(AIAudiogramEnrollmentViewController *)self presentViewController:v15 animated:1 completion:0];
}

- (void)_openDocumentsTapped:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F82698]);
  uint64_t v5 = *MEMORY[0x263F1DBF0];
  v9[0] = *MEMORY[0x263F1DB18];
  v9[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  id v7 = (void *)[v4 initForOpeningContentTypes:v6 asCopy:1];

  [v7 setAllowsMultipleSelection:0];
  [v7 setDelegate:self];
  id v8 = [v7 presentationController];
  [v8 setDelegate:self];

  [(AIAudiogramEnrollmentViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_cancelTapped:(id)a3
{
  if (self->_analyticsIngestionAttempted)
  {
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__AIAudiogramEnrollmentViewController__cancelTapped___block_invoke;
    block[3] = &unk_2650586B8;
    void block[4] = self;
    dispatch_async(v4, block);
  }
  [(AIAudiogramEnrollmentViewController *)self dismissViewControllerAnimated:1 completion:0];
}

void __53__AIAudiogramEnrollmentViewController__cancelTapped___block_invoke(uint64_t a1)
{
  v9[4] = *MEMORY[0x263EF8340];
  v8[0] = @"adjusted";
  v8[1] = @"completed";
  v9[0] = MEMORY[0x263EFFA80];
  v9[1] = MEMORY[0x263EFFA80];
  v8[2] = @"import_source";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "analyticsImportSource"));
  v9[2] = v2;
  v8[3] = @"client";
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "analyticsClient"));
  void v9[3] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  uint64_t v5 = AXLogAggregate();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_23F0D7000, v5, OS_LOG_TYPE_INFO, "Audiogram Ingestion canceled: %@", (uint8_t *)&v6, 0xCu);
  }

  AnalyticsSendEvent();
}

- (void)_prepareToImportAudiogramImages:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  self->_analyticsIngestionAttempted = 1;
  objc_storeStrong((id *)&self->_audiogramImages, a3);
  BOOL v6 = [(AIAudiogramIngestionEngine *)self->_audiogramEngine isAvailable];
  id v7 = AXLogAudiogram();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = v6;
    _os_log_impl(&dword_23F0D7000, v7, OS_LOG_TYPE_INFO, "Preparing to import audiogram image. Is model is available? %d", (uint8_t *)v8, 8u);
  }

  if (v6)
  {
    [(AIAudiogramEnrollmentViewController *)self _showAnalyzingAudiogram];
    [(AIAudiogramEnrollmentViewController *)self _importAudiogramImage];
  }
  else
  {
    [(AIAudiogramIngestionEngine *)self->_audiogramEngine startRetrievingLatestModel];
    [(AIAudiogramEnrollmentViewController *)self _showDownloadingAudiogram];
  }
}

- (void)_importAudiogramImage
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "No image received for audiogram import", v2, v3, v4, v5, v6);
}

uint64_t __60__AIAudiogramEnrollmentViewController__importAudiogramImage__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _showResultsForAudiogram:a2];
  }
  else
  {
    uint64_t v5 = AXLogAudiogram();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint8_t v6 = [*(id *)(a1 + 32) audiogramEngine];
      int v7 = 134217984;
      uint64_t v8 = [v6 failureMode];
      _os_log_impl(&dword_23F0D7000, v5, OS_LOG_TYPE_INFO, "Audiogram is invalid. Failure mode from ingestion engine is %lu", (uint8_t *)&v7, 0xCu);
    }
    return [*(id *)(a1 + 32) _showValidationFailed];
  }
}

- (void)audiogramIngestionEngineModelDownloadProgressed:(float)a3
{
}

void __87__AIAudiogramEnrollmentViewController_audiogramIngestionEngineModelDownloadProgressed___block_invoke(uint64_t a1)
{
  uint64_t v2 = AXLogAudiogram();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_23F0D7000, v2, OS_LOG_TYPE_INFO, "Loading controller received progress update", v5, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) loadingController];
  LODWORD(v4) = *(_DWORD *)(a1 + 40);
  [v3 setProgress:v4];
}

- (void)audiogramIngestionEngineModelDownloadComplete
{
}

uint64_t __84__AIAudiogramEnrollmentViewController_audiogramIngestionEngineModelDownloadComplete__block_invoke(uint64_t a1)
{
  uint64_t v2 = AXLogAudiogram();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F0D7000, v2, OS_LOG_TYPE_INFO, "Loading controller received download complete", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) loadingController];
  LODWORD(v4) = 1.0;
  [v3 setProgress:v4];

  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __84__AIAudiogramEnrollmentViewController_audiogramIngestionEngineModelDownloadComplete__block_invoke_624(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) popViewControllerAnimated:0];
  [*(id *)(a1 + 32) _showAnalyzingAudiogram];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _importAudiogramImage];
}

- (void)audiogramIngestionEngineModelDownloadFailed:(id)a3
{
}

void __83__AIAudiogramEnrollmentViewController_audiogramIngestionEngineModelDownloadFailed___block_invoke(uint64_t a1)
{
  id v2 = AXLogAudiogram();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_23F0D7000, v2, OS_LOG_TYPE_INFO, "Loading controller received download failed", v6, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) loadingController];
  [v3 loadViewIfNeeded];

  double v4 = [*(id *)(a1 + 32) loadingController];
  uint64_t v5 = aiLocString(@"AudiogramIngestionLoadingError");
  [v4 showLoadingMessage:v5];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AXLogAudiogram();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F0D7000, v8, OS_LOG_TYPE_INFO, "Audiogram imported via document camera", buf, 2u);
  }

  id v9 = v6;
  AXPerformBlockOnMainThread();
  id v10 = objc_opt_new();
  if ([v7 pageCount])
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = [v7 imageOfPageAtIndex:v11];
      if (v12) {
        [v10 addObject:v12];
      }

      unint64_t v13 = [v7 pageCount];
      if (v11 > 1) {
        break;
      }
      ++v11;
    }
    while (v13 > v11);
  }
  [(AIAudiogramEnrollmentViewController *)self _prepareToImportAudiogramImages:v10];
  [(AIAudiogramEnrollmentViewController *)self setAnalyticsImportSource:3];
}

uint64_t __86__AIAudiogramEnrollmentViewController_documentCameraViewController_didFinishWithScan___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  id v3 = a3;
  double v4 = AXLogAudiogram();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F0D7000, v4, OS_LOG_TYPE_INFO, "Audiogram scan cancelled", buf, 2u);
  }

  id v6 = v3;
  id v5 = v3;
  AXPerformBlockOnMainThread();
}

uint64_t __77__AIAudiogramEnrollmentViewController_documentCameraViewControllerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AXLogAudiogram();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[AIAudiogramEnrollmentViewController documentCameraViewController:didFailWithError:]();
  }

  id v9 = v5;
  id v8 = v5;
  AXPerformBlockOnMainThread();
}

uint64_t __85__AIAudiogramEnrollmentViewController_documentCameraViewController_didFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AXLogAudiogram();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F0D7000, v8, OS_LOG_TYPE_INFO, "Audiogram imported via photo picker", buf, 2u);
  }

  v14[5] = MEMORY[0x263EF8330];
  v14[6] = 3221225472;
  v14[7] = __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke;
  v14[8] = &unk_2650586B8;
  id v15 = v6;
  id v9 = v6;
  AXPerformBlockOnMainThread();
  id v10 = [v7 firstObject];

  unint64_t v11 = [v10 itemProvider];

  uint64_t v12 = objc_opt_class();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2;
  v14[3] = &unk_265059438;
  void v14[4] = self;
  id v13 = (id)[v11 loadObjectOfClass:v12 completionHandler:v14];
}

uint64_t __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = AXLogAudiogram();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2_cold_2();
    }
LABEL_7:

    id v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = AXLogAudiogram();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2_cold_1();
    }
    goto LABEL_7;
  }
LABEL_8:
  id v8 = v5;
  id v9 = objc_opt_new();
  [v9 axSafelyAddObject:v8];
  [*(id *)(a1 + 32) _prepareToImportAudiogramImages:v9];
  [*(id *)(a1 + 32) setAnalyticsImportSource:1];
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke;
  uint64_t v17 = &unk_265058FD8;
  id v18 = v6;
  uint64_t v19 = self;
  id v8 = v6;
  AXPerformBlockOnMainThread();
  id v9 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2;
  v11[3] = &unk_265058FD8;
  id v12 = v7;
  id v13 = self;
  id v10 = v7;
  dispatch_async(v9, v11);
}

uint64_t __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v2 = *(void **)(a1 + 40);
  return [v2 _showAnalyzingAudiogram];
}

void __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2(uint64_t a1)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) firstObject];
  id v3 = [v2 path];
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x263EFF608];
    v20[0] = *MEMORY[0x263EFF608];
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    id v18 = 0;
    id v6 = [v2 resourceValuesForKeys:v5 error:&v18];
    id v7 = v18;

    if (v7)
    {
      id v8 = AXLogAudiogram();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_3();
      }

      [*(id *)(a1 + 40) _showValidationFailed];
    }
    else
    {
      id v10 = [v6 objectForKeyedSubscript:v4];
      if ([v10 conformsToType:*MEMORY[0x263F1DB18]])
      {
        unint64_t v11 = AXLogAudiogram();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl(&dword_23F0D7000, v11, OS_LOG_TYPE_INFO, "Audiogram image imported via document picker", v17, 2u);
        }

        uint64_t v12 = [objc_alloc(MEMORY[0x263F827E8]) initWithContentsOfFile:v3];
        id v13 = (void *)v12;
        if (v12)
        {
          uint64_t v19 = v12;
          uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
        }
        else
        {
          uint64_t v14 = 0;
        }
      }
      else if ([v10 conformsToType:*MEMORY[0x263F1DBF0]])
      {
        uint64_t v15 = AXLogAudiogram();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl(&dword_23F0D7000, v15, OS_LOG_TYPE_INFO, "Audiogram PDF imported via document picker", v17, 2u);
        }

        uint64_t v14 = [*(id *)(a1 + 40) _imagesFromPDF:v2];
      }
      else
      {
        uint64_t v14 = 0;
      }
      if ([v14 count])
      {
        [*(id *)(a1 + 40) _prepareToImportAudiogramImages:v14];
        [*(id *)(a1 + 40) setAnalyticsImportSource:2];
      }
      else
      {
        id v16 = AXLogAudiogram();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_2();
        }

        [*(id *)(a1 + 40) _showValidationFailed];
      }
    }
  }
  else
  {
    id v9 = AXLogAudiogram();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 40) _showValidationFailed];
  }
}

- (void)_showCameraTips:(id)a3
{
  v45[4] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc(MEMORY[0x263F5B918]);
  id v5 = aiLocString(@"AudiogramIngestionCameraTipTitle");
  id v6 = (void *)[v4 initWithTitle:v5 detailText:0 icon:0];

  id v7 = [v6 headerView];
  LODWORD(v8) = 1036831949;
  [v7 setTitleHyphenationFactor:v8];

  id v9 = [v6 headerView];
  id v10 = [v9 customIconContainerView];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F82828]);
    audiogramIngestionImageNamed(@"camera_scan_illustration");
    uint64_t v12 = v44 = self;
    id v13 = [MEMORY[0x263F825C8] systemBlueColor];
    uint64_t v14 = [v12 imageWithTintColor:v13];
    uint64_t v15 = (void *)[v11 initWithImage:v14];

    [v15 setContentMode:1];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 addSubview:v15];
    [v10 setClipsToBounds:0];
    uint64_t v36 = (void *)MEMORY[0x263F08938];
    uint64_t v42 = [v15 centerXAnchor];
    v41 = [v10 centerXAnchor];
    uint64_t v40 = [v42 constraintEqualToAnchor:v41];
    v45[0] = v40;
    id v39 = [v15 centerYAnchor];
    v38 = [v10 centerYAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v45[1] = v37;
    v35 = [v15 heightAnchor];
    id v16 = [v10 heightAnchor];
    uint64_t v17 = [v35 constraintEqualToAnchor:v16];
    v45[2] = v17;
    id v18 = [v10 superview];
    [v18 heightAnchor];
    uint64_t v19 = v43 = v10;
    uint64_t v20 = [v6 view];
    uint64_t v21 = [v20 heightAnchor];
    uint64_t v22 = [v19 constraintEqualToAnchor:v21 multiplier:0.3];
    v45[3] = v22;
    long long v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:4];
    [v36 activateConstraints:v23];

    id v10 = v43;
    self = v44;
  }
  uint64_t v24 = aiLocString(@"AudiogramIngestionCameraTipChart");
  uint64_t v25 = [MEMORY[0x263F825C8] systemBlueColor];
  [v6 addBulletedListItemWithTitle:v24 description:&stru_26F2D3B98 symbolName:@"chart.dots.scatter" tintColor:v25];

  uint64_t v26 = aiLocString(@"AudiogramIngestionCameraTipLight");
  uint64_t v27 = [MEMORY[0x263F825C8] systemBlueColor];
  [v6 addBulletedListItemWithTitle:v26 description:&stru_26F2D3B98 symbolName:@"lightbulb.max" tintColor:v27];

  uint64_t v28 = aiLocString(@"AudiogramIngestionCameraTipSteady");
  v29 = [MEMORY[0x263F825C8] systemBlueColor];
  [v6 addBulletedListItemWithTitle:v28 description:&stru_26F2D3B98 symbolName:@"camera" tintColor:v29];

  uint64_t v30 = [MEMORY[0x263F5B898] boldButton];
  id v31 = aiLocString(@"AudiogramIngestionCameraTipButtonTitle");
  [v30 setTitle:v31 forState:0];

  [v30 addTarget:self action:sel__openCameraTapped_ forControlEvents:64];
  id v32 = [v6 buttonTray];
  [v32 addButton:v30];

  id v33 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelTapped_];
  uint64_t v34 = [v6 navigationItem];
  [v34 setRightBarButtonItem:v33];

  [(OBNavigationController *)self pushViewController:v6 animated:1];
}

- (void)_showNonCameraOptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F82418];
  id v6 = aiLocString(@"AudiogramIngestionImportTitleV2");
  id v7 = [v5 alertControllerWithTitle:v6 message:0 preferredStyle:0];

  double v8 = (void *)MEMORY[0x263F82400];
  id v9 = aiLocString(@"AudiogramIngestionImportOptionPhotosV2");
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke;
  v27[3] = &unk_2650592D8;
  v27[4] = self;
  id v10 = [v8 actionWithTitle:v9 style:0 handler:v27];

  id v11 = (void *)MEMORY[0x263F82400];
  uint64_t v12 = aiLocString(@"AudiogramIngestionImportOptionFilesV2");
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke_2;
  v26[3] = &unk_2650592D8;
  v26[4] = self;
  id v13 = [v11 actionWithTitle:v12 style:0 handler:v26];

  uint64_t v14 = (void *)MEMORY[0x263F82400];
  uint64_t v15 = aiLocString(@"AudiogramIngestionImportOptionManualV2");
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke_3;
  v25[3] = &unk_2650592D8;
  v25[4] = self;
  id v16 = [v14 actionWithTitle:v15 style:0 handler:v25];

  uint64_t v17 = (void *)MEMORY[0x263F82400];
  id v18 = aiLocString(@"AudiogramIngestionImportOptionCancel");
  uint64_t v19 = [v17 actionWithTitle:v18 style:1 handler:0];

  [v7 addAction:v10];
  [v7 addAction:v13];
  [v7 addAction:v16];
  [v7 addAction:v19];
  uint64_t v20 = [v7 popoverPresentationController];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    uint64_t v22 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v24 = [v7 popoverPresentationController];
      [v24 setSourceView:v4];
    }
  }
  [(AIAudiogramEnrollmentViewController *)self presentViewController:v7 animated:1 completion:0];
}

uint64_t __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openPhotosTapped:0];
}

uint64_t __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openDocumentsTapped:0];
}

uint64_t __61__AIAudiogramEnrollmentViewController__showNonCameraOptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startManualEntryV2];
}

- (void)_tryAgainTapped:(id)a3
{
  id v9 = a3;
  id v4 = [(AIAudiogramEnrollmentViewController *)self topViewController];
  id v5 = [(AIAudiogramEnrollmentViewController *)self validationFailedController];

  if (v4 == v5) {
    id v6 = (id)[(AIAudiogramEnrollmentViewController *)self popViewControllerAnimated:0];
  }
  if ([(AIAudiogramEnrollmentViewController *)self analyticsImportSource] == 3)
  {
    uint64_t v7 = [(AIAudiogramEnrollmentViewController *)self _openCameraTapped:v9];
  }
  else if ([(AIAudiogramEnrollmentViewController *)self analyticsImportSource] == 1)
  {
    uint64_t v7 = [(AIAudiogramEnrollmentViewController *)self _openPhotosTapped:v9];
  }
  else
  {
    uint64_t v7 = [(AIAudiogramEnrollmentViewController *)self analyticsImportSource];
    id v8 = v9;
    if (v7 != 2) {
      goto LABEL_10;
    }
    uint64_t v7 = [(AIAudiogramEnrollmentViewController *)self _openDocumentsTapped:v9];
  }
  id v8 = v9;
LABEL_10:
  MEMORY[0x270F9A758](v7, v8);
}

- (void)updateSelectedSymbolsWithSelectedSymbols:(id)a3
{
  id v7 = a3;
  id v4 = (void *)[v7 copy];
  [(AIAudiogramEnrollmentViewController *)self setSelectedSymbols:v4];

  if (([v7 containsObject:&unk_26F2DB3A0] & 1) != 0
    || [v7 containsObject:&unk_26F2DB388])
  {
    uint64_t v5 = 1;
    [(AIAudiogramEnrollmentViewController *)self setHasLeftSymbols:1];
    if (([v7 containsObject:&unk_26F2DB388] & 1) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    [(AIAudiogramEnrollmentViewController *)self setHasLeftSymbols:0];
    uint64_t v5 = 0;
  }
  [(AIAudiogramEnrollmentViewController *)self setHasLeftMaskedSymbol:v5];
LABEL_7:
  if (([v7 containsObject:&unk_26F2DB3B8] & 1) == 0
    && ![v7 containsObject:&unk_26F2DB3D0])
  {
    [(AIAudiogramEnrollmentViewController *)self setHasRightSymbols:0];
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = 1;
  [(AIAudiogramEnrollmentViewController *)self setHasRightSymbols:1];
  if ([v7 containsObject:&unk_26F2DB3B8]) {
LABEL_12:
  }
    [(AIAudiogramEnrollmentViewController *)self setHasRightMaskedSymbol:v6];
}

- (void)showSymbolSelectionViewController
{
}

void __72__AIAudiogramEnrollmentViewController_showSymbolSelectionViewController__block_invoke(uint64_t a1)
{
  id v2 = [_TtC18AudiogramIngestion41AIAudiogramSymbolsSelectionViewController alloc];
  id v3 = aiYodelLocString(@"AudiogramIngestionSymbolSelectionTitle");
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 selectedSymbols];
  uint64_t v6 = [(AIAudiogramSymbolsSelectionViewController *)v2 initWithTitle:v3 delegate:v4 selectedSymbols:v5];

  [*(id *)(a1 + 32) pushViewController:v6 animated:1];
}

- (void)showFrequencySelectionViewController
{
}

void __75__AIAudiogramEnrollmentViewController_showFrequencySelectionViewController__block_invoke(uint64_t a1)
{
  id v2 = [AIAudiogramFrequencySelectionViewController alloc];
  id v3 = aiLocString(@"AudiogramFrequencySelectionTitle");
  id v4 = [*(id *)(a1 + 32) selectedFrequencies];
  uint64_t v5 = [(AIAudiogramFrequencySelectionViewController *)v2 initWithTitle:v3 detailText:&stru_26F2D3B98 selectedFrequencies:v4 delegate:*(void *)(a1 + 32) isModal:0];

  [*(id *)(a1 + 32) pushViewController:v5 animated:1];
}

- (void)cancelButtonTapped
{
}

uint64_t __57__AIAudiogramEnrollmentViewController_cancelButtonTapped__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelTapped:0];
}

- (void)updateSelectedFrequenciesWithSelectedFrequencies:(id)a3
{
  id v4 = [a3 sortedArrayUsingComparator:&__block_literal_global_677];
  [(AIAudiogramEnrollmentViewController *)self setSelectedFrequencies:v4];

  [(AIAudiogramEnrollmentViewController *)self updateFrequencyViewControllers];
  [(AIAudiogramEnrollmentViewController *)self refreshFinalConfirmationView];
}

uint64_t __88__AIAudiogramEnrollmentViewController_updateSelectedFrequenciesWithSelectedFrequencies___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)updateFrequencyViewControllers
{
  id v3 = [(AIAudiogramEnrollmentViewController *)self audiogram];

  if (v3)
  {
    id v4 = [(AIAudiogramEnrollmentViewController *)self audiogram];
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    uint64_t v6 = [(AIAudiogramEnrollmentViewController *)self audiogram];
    id v7 = [v6 sensitivityPoints];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __69__AIAudiogramEnrollmentViewController_updateFrequencyViewControllers__block_invoke;
    v23[3] = &unk_265059480;
    v23[4] = self;
    id v8 = v5;
    id v24 = v8;
    [v7 enumerateObjectsUsingBlock:v23];

    if ([v8 count])
    {
      id HKAudiogramSampleClass_0 = getHKAudiogramSampleClass_0();
      id v10 = [v4 startDate];
      id v11 = [v4 endDate];
      uint64_t v12 = metadataForHKAudiogramSample();
      id v13 = [HKAudiogramSampleClass_0 audiogramSampleWithSensitivityPoints:v8 startDate:v10 endDate:v11 metadata:v12];
    }
    else
    {
      id v13 = 0;
    }
    [(AIAudiogramEnrollmentViewController *)self setAudiogram:v13];
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    uint64_t v15 = [(AIAudiogramEnrollmentViewController *)self childViewControllers];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    uint64_t v19 = __69__AIAudiogramEnrollmentViewController_updateFrequencyViewControllers__block_invoke_2;
    uint64_t v20 = &unk_2650594A8;
    uint64_t v21 = self;
    id v22 = v14;
    id v16 = v14;
    [v15 enumerateObjectsUsingBlock:&v17];

    -[OBNavigationController setViewControllers:](self, "setViewControllers:", v16, v17, v18, v19, v20, v21);
  }
}

void __69__AIAudiogramEnrollmentViewController_updateFrequencyViewControllers__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 frequency];
  id v4 = [getHKUnitClass_3() hertzUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  id v7 = [*(id *)(a1 + 32) selectedFrequencies];
  id v8 = [NSNumber numberWithDouble:v6];
  if ([v7 containsObject:v8])
  {
    id v9 = *(void **)(a1 + 40);
    id v10 = [NSNumber numberWithDouble:v6];
    LOBYTE(v9) = [v9 containsObject:v10];

    if ((v9 & 1) == 0)
    {
      [*(id *)(a1 + 40) addObject:v13];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v11 = [*(id *)(a1 + 32) frequenciesWithConfiguredInitialPoints];
  uint64_t v12 = [NSNumber numberWithDouble:v6];
  [v11 removeObject:v12];

LABEL_6:
}

void __69__AIAudiogramEnrollmentViewController_updateFrequencyViewControllers__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([*(id *)(a1 + 32) selectedFrequencies],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v6 currentFrequency],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v3 containsObject:v4],
        v4,
        v3,
        v5))
  {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (void)refreshFinalConfirmationView
{
  id v3 = [(AIAudiogramEnrollmentViewController *)self finalResultViewController];

  if (v3)
  {
    id v4 = [(AIAudiogramEnrollmentViewController *)self finalResultViewController];
    int v5 = [(AIAudiogramEnrollmentViewController *)self selectedFrequencies];
    [v4 updateFrequencies:v5];

    id v7 = [(AIAudiogramEnrollmentViewController *)self finalResultViewController];
    id v6 = [(AIAudiogramEnrollmentViewController *)self audiogram];
    [v7 reloadAudiogram:v6];
  }
}

- (void)showIndividualFirstSensitivityPointInputViewController
{
  id v3 = [(AIAudiogramEnrollmentViewController *)self selectedFrequencies];
  uint64_t v4 = [v3 firstObject];
  if (v4)
  {
    int v5 = (void *)v4;
    id v6 = [(AIAudiogramEnrollmentViewController *)self frequenciesWithConfiguredInitialPoints];
    id v7 = [(AIAudiogramEnrollmentViewController *)self selectedFrequencies];
    id v8 = [v7 firstObject];
    char v9 = [v6 containsObject:v8];

    if (v9) {
      goto LABEL_5;
    }
    id v3 = [(AIAudiogramEnrollmentViewController *)self selectedFrequencies];
    id v10 = [v3 firstObject];
    [(AIAudiogramEnrollmentViewController *)self _addInitialSensitivityPointAtFrequency:v10];
  }
LABEL_5:
  id v11 = [(AIAudiogramEnrollmentViewController *)self audiogram];

  if (v11)
  {
    uint64_t v12 = [AIAudiogramIndividualFrequencyInputViewController alloc];
    id v13 = [(AIAudiogramEnrollmentViewController *)self audiogramConfirmationDelegate];
    uint64_t v14 = [(AIAudiogramEnrollmentViewController *)self audiogram];
    uint64_t v15 = [(AIAudiogramEnrollmentViewController *)self selectedFrequencies];
    id v16 = [v15 firstObject];
    uint64_t v17 = [(AIAudiogramEnrollmentViewController *)self selectedSymbols];
    id v24 = [(AIAudiogramIndividualFrequencyInputViewController *)v12 initWithDelegate:self audiogramConfirmationDelegate:v13 audiogram:v14 currentFrequency:v16 isModalViewController:0 selectedSymbols:v17];

    uint64_t v18 = NSString;
    uint64_t v19 = aiLocString(@"AudiogramIngestionAddValuesTitle");
    uint64_t v20 = [(AIAudiogramEnrollmentViewController *)self selectedFrequencies];
    uint64_t v21 = [v20 firstObject];
    id v22 = objc_msgSend(v18, "stringWithFormat:", v19, v21);
    long long v23 = [(AIAudiogramIndividualFrequencyInputViewController *)v24 frequencyTitleLabel];
    [v23 setText:v22];

    [(OBNavigationController *)self pushViewController:v24 animated:1];
  }
}

- (void)showNextFrequencyInputViewControllerWithAudiogram:(id)a3 previousFrequency:(id)a4
{
  id v6 = a4;
  [(AIAudiogramEnrollmentViewController *)self setAudiogram:a3];
  id v27 = [(AIAudiogramEnrollmentViewController *)self getNextFrequency:v6];

  if (v27)
  {
    id v7 = [(AIAudiogramEnrollmentViewController *)self frequenciesWithConfiguredInitialPoints];
    char v8 = [v7 containsObject:v27];

    if ((v8 & 1) == 0) {
      [(AIAudiogramEnrollmentViewController *)self _addInitialSensitivityPointAtFrequency:v27];
    }
    char v9 = [AIAudiogramIndividualFrequencyInputViewController alloc];
    id v10 = [(AIAudiogramEnrollmentViewController *)self audiogramConfirmationDelegate];
    id v11 = [(AIAudiogramEnrollmentViewController *)self audiogram];
    uint64_t v12 = [(AIAudiogramEnrollmentViewController *)self selectedSymbols];
    id v13 = [(AIAudiogramIndividualFrequencyInputViewController *)v9 initWithDelegate:self audiogramConfirmationDelegate:v10 audiogram:v11 currentFrequency:v27 isModalViewController:0 selectedSymbols:v12];

    uint64_t v14 = NSString;
    uint64_t v15 = aiLocString(@"AudiogramIngestionAddValuesTitle");
    id v16 = objc_msgSend(v14, "stringWithFormat:", v15, v27);
    uint64_t v17 = [(AIAudiogramIndividualFrequencyInputViewController *)v13 frequencyTitleLabel];
    [v17 setText:v16];
  }
  else
  {
    uint64_t v18 = [AIAudiogramFinalResultViewController alloc];
    uint64_t v19 = [(AIAudiogramEnrollmentViewController *)self audiogram];
    uint64_t v20 = [(AIAudiogramEnrollmentViewController *)self selectedFrequencies];
    uint64_t v21 = [(AIAudiogramEnrollmentViewController *)self audiogramConfirmationDelegate];
    id v22 = [(AIAudiogramFinalResultViewController *)v18 initWithAudiogram:v19 selectedFrequencies:v20 audiogramConfirmationDelegate:v21 audiogramManualIngestionDelegate:self];
    [(AIAudiogramEnrollmentViewController *)self setFinalResultViewController:v22];

    unint64_t v23 = [(AIAudiogramEnrollmentViewController *)self analyticsImportSource];
    id v24 = [(AIAudiogramEnrollmentViewController *)self finalResultViewController];
    [v24 setAnalyticsImportSource:v23];

    unint64_t v25 = [(AIAudiogramEnrollmentViewController *)self analyticsClient];
    uint64_t v26 = [(AIAudiogramEnrollmentViewController *)self finalResultViewController];
    [v26 setAnalyticsClient:v25];

    id v13 = [(AIAudiogramEnrollmentViewController *)self finalResultViewController];
  }
  [(OBNavigationController *)self pushViewController:v13 animated:1];
}

- (void)_addInitialSensitivityPointAtFrequency:(id)a3
{
  id v4 = a3;
  int v5 = [(AIAudiogramEnrollmentViewController *)self frequenciesWithConfiguredInitialPoints];

  if (!v5)
  {
    id v6 = objc_opt_new();
    [(AIAudiogramEnrollmentViewController *)self setFrequenciesWithConfiguredInitialPoints:v6];
  }
  id v7 = [(AIAudiogramEnrollmentViewController *)self frequenciesWithConfiguredInitialPoints];
  [v7 addObject:v4];

  char v8 = [getHKUnitClass_3() decibelHearingLevelUnit];
  char v9 = [getHKUnitClass_3() hertzUnit];
  id HKQuantityClass_2 = getHKQuantityClass_2();
  [v4 doubleValue];
  id v11 = objc_msgSend(HKQuantityClass_2, "quantityWithUnit:doubleValue:", v9);
  uint64_t v12 = (void *)MEMORY[0x263EFF980];
  id v13 = [(AIAudiogramEnrollmentViewController *)self audiogram];
  uint64_t v14 = [v13 sensitivityPoints];
  uint64_t v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = MEMORY[0x263EFFA68];
  }
  uint64_t v17 = [v12 arrayWithArray:v16];

  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __78__AIAudiogramEnrollmentViewController__addInitialSensitivityPointAtFrequency___block_invoke;
  v49[3] = &unk_2650594D0;
  id v18 = v9;
  id v50 = v18;
  id v19 = v4;
  id v51 = v19;
  if ([v17 indexOfObjectPassingTest:v49] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v20 = [MEMORY[0x263EFF980] array];
    char v43 = v11;
    if ([(AIAudiogramEnrollmentViewController *)self hasLeftSymbols])
    {
      id v21 = objc_alloc((Class)getHKAudiogramSensitivityTestClass_1());
      id v22 = v8;
      unint64_t v23 = [getHKQuantityClass_2() quantityWithUnit:v8 doubleValue:0.0];
      id v24 = [(AIAudiogramEnrollmentViewController *)self selectedSymbols];
      id v48 = 0;
      unint64_t v25 = objc_msgSend(v21, "initWithSensitivity:type:masked:side:clampingRange:error:", v23, 0, objc_msgSend(v24, "containsObject:", &unk_26F2DB3A0) ^ 1, 0, 0, &v48);
      id v26 = v48;

      if (v25 && !v26) {
        [v20 addObject:v25];
      }

      char v8 = v22;
      id v11 = v43;
    }
    else
    {
      id v26 = 0;
    }
    if ([(AIAudiogramEnrollmentViewController *)self hasRightSymbols])
    {
      uint64_t v42 = v20;

      id v27 = objc_alloc((Class)getHKAudiogramSensitivityTestClass_1());
      uint64_t v28 = v8;
      v29 = [getHKQuantityClass_2() quantityWithUnit:v8 doubleValue:0.0];
      uint64_t v30 = [(AIAudiogramEnrollmentViewController *)self selectedSymbols];
      id v47 = 0;
      id v31 = objc_msgSend(v27, "initWithSensitivity:type:masked:side:clampingRange:error:", v29, 0, objc_msgSend(v30, "containsObject:", &unk_26F2DB3D0) ^ 1, 1, 0, &v47);
      id v26 = v47;

      if (v31 && !v26) {
        [v42 addObject:v31];
      }

      char v8 = v28;
      uint64_t v20 = v42;
      id v11 = v43;
    }
    if (objc_msgSend(v20, "count", v42))
    {
      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x2050000000;
      id v32 = (void *)getHKAudiogramSensitivityPointClass_softClass_2;
      uint64_t v56 = getHKAudiogramSensitivityPointClass_softClass_2;
      if (!getHKAudiogramSensitivityPointClass_softClass_2)
      {
        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = __getHKAudiogramSensitivityPointClass_block_invoke_2;
        v52[3] = &unk_265058588;
        v52[4] = &v53;
        __getHKAudiogramSensitivityPointClass_block_invoke_2((uint64_t)v52);
        id v32 = (void *)v54[3];
      }
      id v33 = v32;
      _Block_object_dispose(&v53, 8);
      id v46 = v26;
      uint64_t v34 = [v33 sensitivityPointWithFrequency:v11 tests:v20 error:&v46];
      id v35 = v46;

      [v17 addObject:v34];
      id v26 = v35;
    }
    if ([v17 count])
    {
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __78__AIAudiogramEnrollmentViewController__addInitialSensitivityPointAtFrequency___block_invoke_2;
      v44[3] = &unk_2650594F8;
      id v45 = v18;
      uint64_t v36 = [v17 sortedArrayUsingComparator:v44];
      uint64_t v37 = [v36 mutableCopy];

      v38 = [(AIAudiogramEnrollmentViewController *)self pickedDate];
      id HKAudiogramSampleClass_0 = getHKAudiogramSampleClass_0();
      uint64_t v40 = metadataForHKAudiogramSample();
      v41 = [HKAudiogramSampleClass_0 audiogramSampleWithSensitivityPoints:v37 startDate:v38 endDate:v38 metadata:v40];
      [(AIAudiogramEnrollmentViewController *)self setAudiogram:v41];

      id v11 = v43;
      uint64_t v17 = (void *)v37;
    }
  }
  else
  {
    id v26 = 0;
  }
}

BOOL __78__AIAudiogramEnrollmentViewController__addInitialSensitivityPointAtFrequency___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 frequency];
  [v6 doubleValueForUnit:*(void *)(a1 + 32)];
  double v8 = v7;
  [*(id *)(a1 + 40) doubleValue];
  double v10 = v9;

  if (v8 == v10) {
    *a4 = 1;
  }
  return v8 == v10;
}

uint64_t __78__AIAudiogramEnrollmentViewController__addInitialSensitivityPointAtFrequency___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 frequency];
  [v6 doubleValueForUnit:*(void *)(a1 + 32)];
  double v8 = v7;
  double v9 = [v5 frequency];

  [v9 doubleValueForUnit:*(void *)(a1 + 32)];
  double v11 = v10;

  if (v8 >= v11) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)getNextFrequency:(id)a3
{
  id v4 = a3;
  id v5 = [(AIAudiogramEnrollmentViewController *)self selectedFrequencies];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v7 = v6 + 1,
        [(AIAudiogramEnrollmentViewController *)self selectedFrequencies],
        double v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 count],
        v8,
        v7 >= v9))
  {
    double v11 = 0;
  }
  else
  {
    double v10 = [(AIAudiogramEnrollmentViewController *)self selectedFrequencies];
    double v11 = [v10 objectAtIndex:v7];
  }
  return v11;
}

- (void)completedAudiogramManualIngestion
{
}

- (void)updateAudiogramDate:(id)a3
{
  id v12 = a3;
  -[AIAudiogramEnrollmentViewController setPickedDate:](self, "setPickedDate:");
  id v4 = [(AIAudiogramEnrollmentViewController *)self audiogram];
  id v5 = [v4 sensitivityPoints];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id HKAudiogramSampleClass_0 = getHKAudiogramSampleClass_0();
    double v8 = [(AIAudiogramEnrollmentViewController *)self audiogram];
    unint64_t v9 = [v8 sensitivityPoints];
    double v10 = metadataForHKAudiogramSample();
    double v11 = [HKAudiogramSampleClass_0 audiogramSampleWithSensitivityPoints:v9 startDate:v12 endDate:v12 metadata:v10];
    [(AIAudiogramEnrollmentViewController *)self setAudiogram:v11];

    [(AIAudiogramEnrollmentViewController *)self updateFrequencyViewControllers];
    [(AIAudiogramEnrollmentViewController *)self refreshFinalConfirmationView];
  }
}

- (void)didSelectNodeToEditWithSelectedFrequency:(id)a3
{
  id v16 = a3;
  id v4 = [(AIAudiogramEnrollmentViewController *)self frequenciesWithConfiguredInitialPoints];
  char v5 = [v4 containsObject:v16];

  if ((v5 & 1) == 0) {
    [(AIAudiogramEnrollmentViewController *)self _addInitialSensitivityPointAtFrequency:v16];
  }
  uint64_t v6 = [AIAudiogramIndividualFrequencyInputViewController alloc];
  unint64_t v7 = [(AIAudiogramEnrollmentViewController *)self audiogramConfirmationDelegate];
  double v8 = [(AIAudiogramEnrollmentViewController *)self audiogram];
  unint64_t v9 = [(AIAudiogramEnrollmentViewController *)self selectedSymbols];
  double v10 = [(AIAudiogramIndividualFrequencyInputViewController *)v6 initWithDelegate:self audiogramConfirmationDelegate:v7 audiogram:v8 currentFrequency:v16 isModalViewController:1 selectedSymbols:v9];

  double v11 = NSString;
  id v12 = aiLocString(@"AudiogramIngestionEditValuesTitle");
  id v13 = objc_msgSend(v11, "stringWithFormat:", v12, v16);
  uint64_t v14 = [(AIAudiogramIndividualFrequencyInputViewController *)v10 frequencyTitleLabel];
  [v14 setText:v13];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v10];
  [(AIAudiogramEnrollmentViewController *)self presentViewController:v15 animated:1 completion:0];
}

- (void)didSelectNodeToAddWithSelectedFrequency:(id)a3
{
  id v16 = a3;
  id v4 = [(AIAudiogramEnrollmentViewController *)self frequenciesWithConfiguredInitialPoints];
  char v5 = [v4 containsObject:v16];

  if ((v5 & 1) == 0) {
    [(AIAudiogramEnrollmentViewController *)self _addInitialSensitivityPointAtFrequency:v16];
  }
  uint64_t v6 = [AIAudiogramIndividualFrequencyInputViewController alloc];
  unint64_t v7 = [(AIAudiogramEnrollmentViewController *)self audiogramConfirmationDelegate];
  double v8 = [(AIAudiogramEnrollmentViewController *)self audiogram];
  unint64_t v9 = [(AIAudiogramEnrollmentViewController *)self selectedSymbols];
  double v10 = [(AIAudiogramIndividualFrequencyInputViewController *)v6 initWithDelegate:self audiogramConfirmationDelegate:v7 audiogram:v8 currentFrequency:v16 isModalViewController:1 selectedSymbols:v9];

  [(AIAudiogramIndividualFrequencyInputViewController *)v10 setUserAddedFrequencyAfterOptical:1];
  double v11 = NSString;
  id v12 = aiLocString(@"AudiogramIngestionAddValuesTitle");
  id v13 = objc_msgSend(v11, "stringWithFormat:", v12, v16);
  uint64_t v14 = [(AIAudiogramIndividualFrequencyInputViewController *)v10 frequencyTitleLabel];
  [v14 setText:v13];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v10];
  [(AIAudiogramEnrollmentViewController *)self dismissViewControllerAnimated:0 completion:0];
  [(AIAudiogramEnrollmentViewController *)self presentViewController:v15 animated:1 completion:0];
}

- (void)dismissCurrentFrequencyInputViewControllerWithAudiogram:(id)a3
{
  id v4 = a3;
  [(AIAudiogramEnrollmentViewController *)self setAudiogram:v4];
  [(AIAudiogramEnrollmentViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v5 = [(AIAudiogramEnrollmentViewController *)self finalResultViewController];
  [v5 reloadAudiogram:v4];
}

- (unint64_t)analyticsClient
{
  return self->_analyticsClient;
}

- (void)setAnalyticsClient:(unint64_t)a3
{
  self->_analyticsClient = a3;
}

- (AIAudiogramConfirmResultsViewControllerDelegate)audiogramConfirmationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audiogramConfirmationDelegate);
  return (AIAudiogramConfirmResultsViewControllerDelegate *)WeakRetained;
}

- (void)setAudiogramConfirmationDelegate:(id)a3
{
}

- (OBTextWelcomeController)validationFailedController
{
  return self->_validationFailedController;
}

- (void)setValidationFailedController:(id)a3
{
}

- (AIAudiogramLoadingViewController)loadingController
{
  return self->_loadingController;
}

- (void)setLoadingController:(id)a3
{
}

- (BOOL)isCameraAvailable
{
  return self->_isCameraAvailable;
}

- (void)setIsCameraAvailable:(BOOL)a3
{
  self->_isCameraAvailable = a3;
}

- (AIAudiogramIngestionEngine)audiogramEngine
{
  return self->_audiogramEngine;
}

- (void)setAudiogramEngine:(id)a3
{
}

- (NSArray)audiogramImages
{
  return self->_audiogramImages;
}

- (void)setAudiogramImages:(id)a3
{
}

- (BOOL)analyticsIngestionAttempted
{
  return self->_analyticsIngestionAttempted;
}

- (void)setAnalyticsIngestionAttempted:(BOOL)a3
{
  self->_analyticsIngestionAttempted = a3;
}

- (unint64_t)analyticsImportSource
{
  return self->_analyticsImportSource;
}

- (void)setAnalyticsImportSource:(unint64_t)a3
{
  self->_analyticsImportSource = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
}

- (NSDate)initialDate
{
  return self->_initialDate;
}

- (void)setInitialDate:(id)a3
{
}

- (NSArray)selectedFrequencies
{
  return self->_selectedFrequencies;
}

- (void)setSelectedFrequencies:(id)a3
{
}

- (HKAudiogramSample)audiogram
{
  return self->_audiogram;
}

- (void)setAudiogram:(id)a3
{
}

- (NSNumber)currentFrequency
{
  return self->_currentFrequency;
}

- (void)setCurrentFrequency:(id)a3
{
}

- (BOOL)hasLeftSymbols
{
  return self->_hasLeftSymbols;
}

- (void)setHasLeftSymbols:(BOOL)a3
{
  self->_hasLeftSymbols = a3;
}

- (BOOL)hasRightSymbols
{
  return self->_hasRightSymbols;
}

- (void)setHasRightSymbols:(BOOL)a3
{
  self->_hasRightSymbols = a3;
}

- (NSDate)pickedDate
{
  return self->_pickedDate;
}

- (void)setPickedDate:(id)a3
{
  self->_pickedDate = (NSDate *)a3;
}

- (NSArray)selectedSymbols
{
  return self->_selectedSymbols;
}

- (void)setSelectedSymbols:(id)a3
{
}

- (BOOL)hasLeftMaskedSymbol
{
  return self->_hasLeftMaskedSymbol;
}

- (void)setHasLeftMaskedSymbol:(BOOL)a3
{
  self->_hasLeftMaskedSymbol = a3;
}

- (BOOL)hasRightMaskedSymbol
{
  return self->_hasRightMaskedSymbol;
}

- (void)setHasRightMaskedSymbol:(BOOL)a3
{
  self->_hasRightMaskedSymbol = a3;
}

- (AIAudiogramFinalResultViewController)finalResultViewController
{
  return self->_finalResultViewController;
}

- (void)setFinalResultViewController:(id)a3
{
}

- (NSMutableSet)frequenciesWithConfiguredInitialPoints
{
  return self->_frequenciesWithConfiguredInitialPoints;
}

- (void)setFrequenciesWithConfiguredInitialPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequenciesWithConfiguredInitialPoints, 0);
  objc_storeStrong((id *)&self->_finalResultViewController, 0);
  objc_storeStrong((id *)&self->_selectedSymbols, 0);
  objc_storeStrong((id *)&self->_currentFrequency, 0);
  objc_storeStrong((id *)&self->_audiogram, 0);
  objc_storeStrong((id *)&self->_selectedFrequencies, 0);
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_audiogramImages, 0);
  objc_storeStrong((id *)&self->_audiogramEngine, 0);
  objc_storeStrong((id *)&self->_loadingController, 0);
  objc_storeStrong((id *)&self->_validationFailedController, 0);
  objc_destroyWeak((id *)&self->_audiogramConfirmationDelegate);
}

- (void)_imagesFromPDF:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "CFURLRef was nil", v2, v3, v4, v5, v6);
}

- (void)_imagesFromPDF:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "CGPDFDocumentRef was nil", v2, v3, v4, v5, v6);
}

- (void)documentCameraViewController:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Audiogram scan failed %@", v2, v3, v4, v5, v6);
}

void __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Object returned from photo picker was not UIImage. Instead found %@", v2, v3, v4, v5, v6);
}

void __63__AIAudiogramEnrollmentViewController_picker_didFinishPicking___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Error picking photo from photo picker %@", v2, v3, v4, v5, v6);
}

void __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F0D7000, v0, v1, "No path provided for picked document", v2, v3, v4, v5, v6);
}

void __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "No document read from URL: %@", v2, v3, v4, v5, v6);
}

void __77__AIAudiogramEnrollmentViewController_documentPicker_didPickDocumentsAtURLs___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_23F0D7000, v0, v1, "Unable to read content type from document's path: %@", v2, v3, v4, v5, v6);
}

@end