@interface HUCalendarScrubberContainerViewController
- (AVBackgroundView)backgroundView;
- (BOOL)isEditing;
- (HFCameraPlaybackEngine)playbackEngine;
- (HUCalendarScrubberContainerViewController)initWithPlaybackEngine:(id)a3 calendarScrubberDataSource:(id)a4;
- (HUCalendarScrubberViewController)calendarScrubber;
- (NSArray)constraints;
- (NSDate)lastSelectedDate;
- (UIButton)nextWeekButton;
- (UIButton)prevWeekButton;
- (UIView)hairlineViewLeft;
- (UIView)hairlineViewRight;
- (void)_jumpToDate:(id)a3 animated:(BOOL)a4;
- (void)_updateNextPreviousButtonState;
- (void)handleNextButton:(id)a3;
- (void)handlePreviousButton:(id)a3;
- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6;
- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4;
- (void)scrubberViewController:(id)a3 didSelectItemAtIndex:(id)a4;
- (void)setBackgroundView:(id)a3;
- (void)setCalendarScrubber:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setHairlineViewLeft:(id)a3;
- (void)setHairlineViewRight:(id)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setLastSelectedDate:(id)a3;
- (void)setNextWeekButton:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setPrevWeekButton:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
@end

@implementation HUCalendarScrubberContainerViewController

- (HUCalendarScrubberContainerViewController)initWithPlaybackEngine:(id)a3 calendarScrubberDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)HUCalendarScrubberContainerViewController;
  v8 = [(HUCalendarScrubberContainerViewController *)&v33 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    v8->_isEditing = 0;
    objc_storeWeak((id *)&v8->_playbackEngine, v6);
    id v10 = objc_alloc_init(MEMORY[0x1E4F68FC0]);
    [v10 setPeriodicTimeUpdateInterval:&unk_1F19B6120];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_playbackEngine);
    [WeakRetained addObserver:v9 withOptions:v10];

    v12 = [[HUCalendarScrubberViewController alloc] initWithDataSource:v7];
    calendarScrubber = v9->_calendarScrubber;
    v9->_calendarScrubber = v12;

    [(HUCalendarScrubberViewController *)v9->_calendarScrubber setScrubberDelegate:v9];
    id v14 = objc_alloc(MEMORY[0x1E4F427E0]);
    double v15 = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v19 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], v16, v17, v18);
    prevWeekButton = v9->_prevWeekButton;
    v9->_prevWeekButton = (UIButton *)v19;

    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F427E0]), "initWithFrame:", v15, v16, v17, v18);
    nextWeekButton = v9->_nextWeekButton;
    v9->_nextWeekButton = (UIButton *)v21;

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F16708]), "initWithFrame:", v15, v16, v17, v18);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = (AVBackgroundView *)v23;

    [(AVBackgroundView *)v9->_backgroundView setClipsToBounds:1];
    [(AVBackgroundView *)v9->_backgroundView _setContinuousCornerRadius:16.0];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v15, v16, v17, v18);
    hairlineViewLeft = v9->_hairlineViewLeft;
    v9->_hairlineViewLeft = (UIView *)v25;

    v27 = [MEMORY[0x1E4F428B8] colorWithWhite:0.2 alpha:1.0];
    [(UIView *)v9->_hairlineViewLeft setBackgroundColor:v27];

    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v15, v16, v17, v18);
    hairlineViewRight = v9->_hairlineViewRight;
    v9->_hairlineViewRight = (UIView *)v28;

    v30 = [MEMORY[0x1E4F428B8] colorWithWhite:0.2 alpha:1.0];
    [(UIView *)v9->_hairlineViewRight setBackgroundColor:v30];

    lastSelectedDate = v9->_lastSelectedDate;
    v9->_lastSelectedDate = 0;
  }
  return v9;
}

- (void)viewDidLoad
{
  v40.receiver = self;
  v40.super_class = (Class)HUCalendarScrubberContainerViewController;
  [(HUCalendarScrubberContainerViewController *)&v40 viewDidLoad];
  uint64_t v28 = [(HUCalendarScrubberContainerViewController *)self view];
  uint64_t v3 = [(HUCalendarScrubberContainerViewController *)self backgroundView];
  v4 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
  uint64_t v5 = [v4 view];

  id v6 = [(HUCalendarScrubberContainerViewController *)self prevWeekButton];
  id v7 = [(HUCalendarScrubberContainerViewController *)self nextWeekButton];
  v8 = [(HUCalendarScrubberContainerViewController *)self hairlineViewLeft];
  v9 = [(HUCalendarScrubberContainerViewController *)self hairlineViewRight];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = [MEMORY[0x1E4F42A80] kitImageNamed:@"UINavigationBarBackIndicatorDefault"];
  uint64_t v11 = [v10 imageWithRenderingMode:2];

  v12 = v6;
  [v6 setImage:v11 forState:0];
  v30 = (void *)v11;
  [v7 setImage:v11 forState:0];
  v13 = (void *)v3;
  id v14 = (void *)v5;
  if (v7) {
    [v7 transform];
  }
  else {
    memset(&v38, 0, sizeof(v38));
  }
  CGAffineTransformRotate(&v39, &v38, 3.14159265);
  CGAffineTransform v37 = v39;
  [v7 setTransform:&v37];
  double v15 = [(HUCalendarScrubberContainerViewController *)self traitCollection];
  uint64_t v16 = [v15 layoutDirection];

  if (v16)
  {
    if (v12) {
      [v12 transform];
    }
    else {
      memset(&v35, 0, sizeof(v35));
    }
    double v17 = v8;
    CGAffineTransformRotate(&v36, &v35, 3.14159265);
    CGAffineTransform v34 = v36;
    [v12 setTransform:&v34];
    double v18 = (void *)v28;
    if (v7) {
      [v7 transform];
    }
    else {
      memset(&v32, 0, sizeof(v32));
    }
    CGAffineTransformRotate(&v33, &v32, 3.14159265);
    CGAffineTransform v31 = v33;
    [v7 setTransform:&v31];
    uint64_t v19 = &selRef_handlePreviousButton_;
    v20 = &selRef_handleNextButton_;
  }
  else
  {
    double v17 = v8;
    double v18 = (void *)v28;
    uint64_t v19 = &selRef_handleNextButton_;
    v20 = &selRef_handlePreviousButton_;
  }
  v29 = v12;
  [v12 addTarget:self action:*v20 forControlEvents:64];
  [v7 addTarget:self action:*v19 forControlEvents:64];
  objc_msgSend(v18, "naui_addAutoLayoutSubview:", v13);
  [v13 addSubview:v12 applyingMaterialStyle:0 tintEffectStyle:0];
  [v13 addSubview:v7 applyingMaterialStyle:0 tintEffectStyle:0];
  uint64_t v21 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
  [(HUCalendarScrubberContainerViewController *)self addChildViewController:v21];

  objc_msgSend(v13, "naui_addAutoLayoutSubview:", v14);
  v22 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
  [v22 didMoveToParentViewController:self];

  [v13 addSubview:v9 applyingMaterialStyle:1 tintEffectStyle:1];
  uint64_t v23 = v17;
  [v13 addSubview:v17 applyingMaterialStyle:1 tintEffectStyle:1];
  [v18 setNeedsUpdateConstraints];
  [(HUCalendarScrubberContainerViewController *)self _updateNextPreviousButtonState];
  v24 = [(HUCalendarScrubberContainerViewController *)self playbackEngine];
  uint64_t v25 = [v24 playbackPosition];
  BOOL v26 = [v25 contentType] == 0;
  v27 = [(HUCalendarScrubberContainerViewController *)self view];
  [v27 setHidden:v26];
}

- (void)updateViewConstraints
{
  v2 = self;
  v110[30] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUCalendarScrubberContainerViewController *)self constraints];

  if (!v3)
  {
    v4 = [(HUCalendarScrubberContainerViewController *)v2 backgroundView];
    [(HUCalendarScrubberContainerViewController *)v2 calendarScrubber];
    uint64_t v5 = v108 = v2;
    id v6 = [v5 view];

    id v7 = [(HUCalendarScrubberContainerViewController *)v108 prevWeekButton];
    v8 = [(HUCalendarScrubberContainerViewController *)v108 nextWeekButton];
    v9 = [(HUCalendarScrubberContainerViewController *)v108 hairlineViewLeft];
    id v10 = [(HUCalendarScrubberContainerViewController *)v108 hairlineViewRight];
    v106 = [v4 centerXAnchor];
    v107 = [(HUCalendarScrubberContainerViewController *)v108 view];
    v105 = [v107 centerXAnchor];
    v104 = [v106 constraintEqualToAnchor:v105];
    v110[0] = v104;
    v102 = [v4 centerYAnchor];
    v103 = [(HUCalendarScrubberContainerViewController *)v108 view];
    v101 = [v103 centerYAnchor];
    v100 = [v102 constraintEqualToAnchor:v101];
    v110[1] = v100;
    v98 = [v4 widthAnchor];
    v99 = [(HUCalendarScrubberContainerViewController *)v108 view];
    v97 = [v99 widthAnchor];
    v96 = [v98 constraintEqualToAnchor:v97];
    v110[2] = v96;
    v95 = [v4 heightAnchor];
    v94 = [v95 constraintEqualToConstant:47.0];
    v110[3] = v94;
    v93 = [v6 leadingAnchor];
    v92 = [v9 trailingAnchor];
    v91 = [v93 constraintEqualToAnchor:v92];
    v110[4] = v91;
    v90 = [v6 trailingAnchor];
    v89 = [v10 leadingAnchor];
    v88 = [v90 constraintEqualToAnchor:v89];
    v110[5] = v88;
    v87 = [v6 topAnchor];
    v86 = [v4 topAnchor];
    v85 = [v87 constraintEqualToAnchor:v86];
    v110[6] = v85;
    v84 = [v6 bottomAnchor];
    v82 = [v4 bottomAnchor];
    v81 = [v84 constraintEqualToAnchor:v82];
    v110[7] = v81;
    v80 = [v6 centerXAnchor];
    v79 = [v4 centerXAnchor];
    v78 = [v80 constraintEqualToAnchor:v79];
    v110[8] = v78;
    v77 = [v6 widthAnchor];
    v76 = [v77 constraintLessThanOrEqualToConstant:400.0];
    v110[9] = v76;
    v73 = [v7 topAnchor];
    v72 = [v4 topAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v110[10] = v71;
    v70 = [v7 bottomAnchor];
    v69 = [v4 bottomAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v110[11] = v68;
    v67 = [v7 leadingAnchor];
    v66 = [v4 leadingAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v110[12] = v65;
    v64 = [v7 trailingAnchor];
    v63 = [v9 leadingAnchor];
    v61 = [v64 constraintEqualToAnchor:v63];
    v110[13] = v61;
    v83 = v7;
    v60 = [v7 widthAnchor];
    v59 = [v60 constraintEqualToConstant:60.0];
    v110[14] = v59;
    v57 = [v9 leadingAnchor];
    v56 = [v7 trailingAnchor];
    v54 = [v57 constraintEqualToAnchor:v56];
    v110[15] = v54;
    v53 = [v9 trailingAnchor];
    v74 = v6;
    v52 = [v6 leadingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v110[16] = v51;
    v50 = [v9 widthAnchor];
    v49 = [v50 constraintEqualToConstant:1.0];
    v110[17] = v49;
    v75 = v9;
    v48 = [v9 topAnchor];
    v47 = [v4 topAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v110[18] = v46;
    v45 = [v9 bottomAnchor];
    v44 = [v4 bottomAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v110[19] = v43;
    v42 = [v10 leadingAnchor];
    v41 = [v6 trailingAnchor];
    objc_super v40 = [v42 constraintEqualToAnchor:v41];
    v110[20] = v40;
    CGAffineTransform v39 = [v10 trailingAnchor];
    uint64_t v11 = v8;
    v55 = v8;
    CGAffineTransform v38 = [v8 leadingAnchor];
    CGAffineTransform v37 = [v39 constraintEqualToAnchor:v38];
    v110[21] = v37;
    CGAffineTransform v36 = [v10 widthAnchor];
    CGAffineTransform v35 = [v36 constraintEqualToConstant:1.0];
    v110[22] = v35;
    CGAffineTransform v34 = [v10 topAnchor];
    CGAffineTransform v33 = [v4 topAnchor];
    CGAffineTransform v32 = [v34 constraintEqualToAnchor:v33];
    v110[23] = v32;
    v62 = v10;
    CGAffineTransform v31 = [v10 bottomAnchor];
    v58 = v4;
    v30 = [v4 bottomAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v110[24] = v29;
    uint64_t v28 = [v8 leadingAnchor];
    v27 = [v10 trailingAnchor];
    BOOL v26 = [v28 constraintEqualToAnchor:v27];
    v110[25] = v26;
    uint64_t v25 = [v8 trailingAnchor];
    v24 = [v4 trailingAnchor];
    v12 = [v25 constraintEqualToAnchor:v24];
    v110[26] = v12;
    v13 = [v8 topAnchor];
    id v14 = [v4 topAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];
    v110[27] = v15;
    uint64_t v16 = [v11 bottomAnchor];
    double v17 = [v4 bottomAnchor];
    double v18 = [v16 constraintEqualToAnchor:v17];
    v110[28] = v18;
    uint64_t v19 = [v11 widthAnchor];
    v20 = [v19 constraintEqualToConstant:60.0];
    v110[29] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:30];
    [(HUCalendarScrubberContainerViewController *)v108 setConstraints:v21];

    v2 = v108;
    v22 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v23 = [(HUCalendarScrubberContainerViewController *)v108 constraints];
    [v22 activateConstraints:v23];
  }
  v109.receiver = v2;
  v109.super_class = (Class)HUCalendarScrubberContainerViewController;
  [(HUCalendarScrubberContainerViewController *)&v109 updateViewConstraints];
}

- (void)handleNextButton:(id)a3
{
  id v5 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
  v4 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
  objc_msgSend(v5, "jumpToSection:animated:completion:", objc_msgSend(v4, "nextSection"), 1, 0);

  [(HUCalendarScrubberContainerViewController *)self _updateNextPreviousButtonState];
}

- (void)handlePreviousButton:(id)a3
{
  id v5 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
  v4 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
  objc_msgSend(v5, "jumpToSection:animated:completion:", objc_msgSend(v4, "previousSection"), 1, 0);

  [(HUCalendarScrubberContainerViewController *)self _updateNextPreviousButtonState];
}

- (void)_jumpToDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
  v8 = [v7 dataSource];
  v9 = [v8 indexPathForDate:v6];

  objc_initWeak(&location, self);
  id v10 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
  uint64_t v11 = [v9 section];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__HUCalendarScrubberContainerViewController__jumpToDate_animated___block_invoke;
  v14[3] = &unk_1E63873B0;
  objc_copyWeak(&v17, &location);
  id v12 = v7;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v10 jumpToSection:v11 animated:v4 completion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __66__HUCalendarScrubberContainerViewController__jumpToDate_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [*(id *)(a1 + 32) collectionView];
  [v2 selectItemAtIndexPath:*(void *)(a1 + 40) animated:0 scrollPosition:0];

  [WeakRetained _updateNextPreviousButtonState];
}

- (void)_updateNextPreviousButtonState
{
  id v12 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
  uint64_t v3 = [(HUCalendarScrubberContainerViewController *)self traitCollection];
  uint64_t v4 = [v3 layoutDirection];

  if (v4)
  {
    BOOL v5 = [v12 nextSection] != 0x7FFFFFFFFFFFFFFFLL;
    id v6 = [(HUCalendarScrubberContainerViewController *)self prevWeekButton];
    [v6 setEnabled:v5];

    uint64_t v7 = [v12 previousSection];
  }
  else
  {
    BOOL v8 = [v12 previousSection] != 0x7FFFFFFFFFFFFFFFLL;
    v9 = [(HUCalendarScrubberContainerViewController *)self prevWeekButton];
    [v9 setEnabled:v8];

    uint64_t v7 = [v12 nextSection];
  }
  BOOL v10 = v7 != 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v11 = [(HUCalendarScrubberContainerViewController *)self nextWeekButton];
  [v11 setEnabled:v10];
}

- (void)scrubberViewController:(id)a3 didSelectItemAtIndex:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 dataSource];
  BOOL v8 = [v7 dateAtIndexPath:v6];

  v9 = [(HUCalendarScrubberContainerViewController *)self playbackEngine];
  BOOL v10 = [v9 firstOfTheDayClipForDate:v8];

  uint64_t v11 = HFLogForCategory();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v10 uniqueIdentifier];
      int v18 = 138412546;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Calendar moving to first clip:%@ for date:%@", (uint8_t *)&v18, 0x16u);
    }
    id v14 = [(HUCalendarScrubberContainerViewController *)self playbackEngine];
    [v14 setTimelineState:2];

    [v10 dateOfOccurrence];
    v8 = id v12 = v8;
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v18 = 138412290;
    uint64_t v19 = v8;
    _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "Calendar unable to find first clip for date:%@", (uint8_t *)&v18, 0xCu);
  }

  BOOL v15 = [(HUCalendarScrubberContainerViewController *)self isEditing];
  id v16 = [(HUCalendarScrubberContainerViewController *)self playbackEngine];
  id v17 = v16;
  if (v15) {
    [v16 updatePlaybackPositionToDate:v8 usingClip:v10];
  }
  else {
    [v16 startPlaybackAtDate:v8 withClip:v10];
  }
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = [v5 contentType] == 0;
  uint64_t v7 = [(HUCalendarScrubberContainerViewController *)self view];
  [(id)v7 setHidden:v6];

  BOOL v8 = [(HUCalendarScrubberContainerViewController *)self view];
  LOBYTE(v7) = [v8 isHidden];

  if ((v7 & 1) == 0)
  {
    v9 = [v5 clipPlaybackDate];
    uint64_t v10 = [(HUCalendarScrubberContainerViewController *)self lastSelectedDate];
    if (!v10) {
      goto LABEL_8;
    }
    uint64_t v11 = (void *)v10;
    id v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v13 = [(HUCalendarScrubberContainerViewController *)self lastSelectedDate];
    char v14 = [v12 isDate:v9 inSameDayAsDate:v13];

    if (v14)
    {
      BOOL v15 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
      id v16 = [v15 collectionView];
      id v17 = [v16 indexPathsForSelectedItems];
      uint64_t v18 = [v17 count];

      if (v18)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        uint64_t v23 = v9;
        _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "Update calendar to selected date:%@ because there was no selected index path.", (uint8_t *)&v22, 0xCu);
      }
      uint64_t v20 = 0;
    }
    else
    {
LABEL_8:
      uint64_t v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [(HUCalendarScrubberContainerViewController *)self lastSelectedDate];
        int v22 = 138412546;
        uint64_t v23 = v9;
        __int16 v24 = 2112;
        uint64_t v25 = v21;
        _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "Update calendar to selected date:%@ from date:%@.", (uint8_t *)&v22, 0x16u);
      }
      uint64_t v20 = 1;
    }

    [(HUCalendarScrubberContainerViewController *)self setLastSelectedDate:v9];
    [(HUCalendarScrubberContainerViewController *)self _jumpToDate:v9 animated:v20];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6
{
  id v7 = a3;
  id v10 = [(HUCalendarScrubberContainerViewController *)self calendarScrubber];
  BOOL v8 = [v10 dataSource];
  v9 = [v7 daysWithClips];

  [v8 updateDatesWithClips:v9];
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (HUCalendarScrubberViewController)calendarScrubber
{
  return self->_calendarScrubber;
}

- (void)setCalendarScrubber:(id)a3
{
}

- (UIButton)prevWeekButton
{
  return self->_prevWeekButton;
}

- (void)setPrevWeekButton:(id)a3
{
}

- (UIButton)nextWeekButton
{
  return self->_nextWeekButton;
}

- (void)setNextWeekButton:(id)a3
{
}

- (AVBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)hairlineViewLeft
{
  return self->_hairlineViewLeft;
}

- (void)setHairlineViewLeft:(id)a3
{
}

- (UIView)hairlineViewRight
{
  return self->_hairlineViewRight;
}

- (void)setHairlineViewRight:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (HFCameraPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (HFCameraPlaybackEngine *)WeakRetained;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (NSDate)lastSelectedDate
{
  return self->_lastSelectedDate;
}

- (void)setLastSelectedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedDate, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_hairlineViewRight, 0);
  objc_storeStrong((id *)&self->_hairlineViewLeft, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_nextWeekButton, 0);
  objc_storeStrong((id *)&self->_prevWeekButton, 0);

  objc_storeStrong((id *)&self->_calendarScrubber, 0);
}

@end