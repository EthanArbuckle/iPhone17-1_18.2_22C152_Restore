@interface EKUIAvailabilityViewController
+ (double)defaultTimelineHeight;
+ (id)cancelNextTimeString;
+ (id)nextTimeString;
+ (id)presentAvailabilityViewControllerForEvent:(id)a3 fromViewController:(id)a4;
- (BOOL)compact;
- (BOOL)fetchingData;
- (BOOL)fromDetail;
- (BOOL)isAttendeeProposeTime;
- (BOOL)searchingForNextAvailableTime;
- (BOOL)span:(id)a3 overlapsWithDate:(id)a4;
- (BOOL)span:(id)a3 overlapsWithStartDate:(id)a4 endDate:(id)a5;
- (BOOL)updateCurrentEventAtTime:(id)a3;
- (CGRect)frameForFreeSpanViewAtStart:(id)a3 endDate:(id)a4 duration:(double)a5;
- (CGSize)preferredContentSize;
- (EKEvent)event;
- (EKUIAvailabilityFreeSpanView)eventTime;
- (EKUIAvailabilityParticipantList)participantList;
- (EKUIAvailabilityTimelineView)timelineView;
- (EKUIAvailabilityTitleContainerView)titleContainer;
- (EKUIAvailabilityViewController)initWithEvent:(id)a3;
- (EKUIAvailabilityViewController)initWithEvent:(id)a3 isAttendeeProposeTime:(BOOL)a4 proposedStartDate:(id)a5 proposedEndDate:(id)a6;
- (EKUIResizingDateLabel)largeWeekdayLabel;
- (EKUIResizingDateLabel)weekdayLabel;
- (NSArray)busyParticipants;
- (NSArray)participants;
- (NSDate)currentStartDate;
- (NSDate)modifiedEndDate;
- (NSDate)modifiedStartDate;
- (NSLayoutConstraint)largeNavLeadingConstraint;
- (NSLayoutConstraint)participantWidthConstraint;
- (NSLayoutConstraint)timelineHeightConstraint;
- (NSMutableArray)freeSpanViews;
- (NSMutableArray)hourLines;
- (NSMutableArray)participantAvailabilityViews;
- (NSMutableArray)titleConstraints;
- (NSOperationQueue)availabilityRequestsQueue;
- (UIBarButtonItem)bottomNextTime;
- (UIBarButtonItem)bottomSpinner;
- (UIBarButtonItem)doneButton;
- (UIBarButtonItem)topNextTime;
- (UIBarButtonItem)topSpacer;
- (UIBarButtonItem)topSpinner;
- (UIButton)nextButton;
- (UIButton)previousButton;
- (UILabel)unavailableLabel;
- (UIScrollView)scrollView;
- (UIView)containerView;
- (UIView)dateNavContainer;
- (UIView)largeDateNavContainer;
- (UIView)participantDivider;
- (_UINavigationBarPalette)palette;
- (double)availableWidth;
- (double)convertDateIntoOffset:(id)a3;
- (double)pinchStartRatio;
- (double)pinchStartWidth;
- (double)rowHeight;
- (id)dedupSpans:(id)a3;
- (id)eventFreeSpanAtStart:(id)a3 endDate:(id)a4 isFreeSpan:(BOOL)a5;
- (id)mergeSpan:(id)a3 intoSpans:(id)a4;
- (id)saveBlock;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)cancelTapped:(id)a3;
- (void)clearFreeSpanViews;
- (void)configureNavBarAndToolBar;
- (void)configureParticipants;
- (void)configureUnavailableStateForEvent;
- (void)doneTapped:(id)a3;
- (void)fetchAvailability;
- (void)findNextFreeSpan;
- (void)findPossibleEventRanges;
- (void)layout;
- (void)loadView;
- (void)nextAvailableTimeTapped:(id)a3;
- (void)nextDayTapped:(id)a3;
- (void)previousDayTapped:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAvailabilityPanelAvailable:(BOOL)a3 unavailableMessage:(id)a4;
- (void)setAvailabilityRequestsQueue:(id)a3;
- (void)setAvailableWidth:(double)a3;
- (void)setBottomNextTime:(id)a3;
- (void)setBottomSpinner:(id)a3;
- (void)setBusyParticipants:(id)a3;
- (void)setCompact:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setCurrentStartDate:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateNavContainer:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventTime:(id)a3;
- (void)setFetchingData:(BOOL)a3;
- (void)setFreeSpanViews:(id)a3;
- (void)setFromDetail:(BOOL)a3;
- (void)setHourLines:(id)a3;
- (void)setIsAttendeeProposeTime:(BOOL)a3;
- (void)setLargeDateNavContainer:(id)a3;
- (void)setLargeNavLeadingConstraint:(id)a3;
- (void)setLargeWeekdayLabel:(id)a3;
- (void)setModifiedEndDate:(id)a3;
- (void)setModifiedStartDate:(id)a3;
- (void)setNextButton:(id)a3;
- (void)setPalette:(id)a3;
- (void)setParticipantAvailabilityViews:(id)a3;
- (void)setParticipantDivider:(id)a3;
- (void)setParticipantList:(id)a3;
- (void)setParticipantWidthConstraint:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPinchStartRatio:(double)a3;
- (void)setPinchStartWidth:(double)a3;
- (void)setPreviousButton:(id)a3;
- (void)setRowHeight:(double)a3;
- (void)setSaveBlock:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSearchingForNextAvailableTime:(BOOL)a3;
- (void)setTimelineHeightConstraint:(id)a3;
- (void)setTimelineView:(id)a3;
- (void)setTitleConstraints:(id)a3;
- (void)setTitleContainer:(id)a3;
- (void)setTopNextTime:(id)a3;
- (void)setTopSpacer:(id)a3;
- (void)setTopSpinner:(id)a3;
- (void)setUnavailableLabel:(id)a3;
- (void)setWeekdayLabel:(id)a3;
- (void)singleTap:(id)a3;
- (void)sizeWillBeCompact:(BOOL)a3;
- (void)updateForContentCategory;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewPinched:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation EKUIAvailabilityViewController

+ (id)presentAvailabilityViewControllerForEvent:(id)a3 fromViewController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[EKUIAvailabilityViewController alloc] initWithEvent:v6];

  [(EKUIAvailabilityViewController *)v7 setFromDetail:1];
  v8 = [[EKUIAvailabilityNavigationController alloc] initWithRootViewController:v7];
  [(EKUIAvailabilityViewController *)v7 preferredContentSize];
  -[EKUIAvailabilityNavigationController setPreferredContentSize:](v8, "setPreferredContentSize:");
  [v5 presentViewController:v8 animated:1 completion:0];

  return v7;
}

- (EKUIAvailabilityViewController)initWithEvent:(id)a3
{
  return [(EKUIAvailabilityViewController *)self initWithEvent:a3 isAttendeeProposeTime:0 proposedStartDate:0 proposedEndDate:0];
}

- (EKUIAvailabilityViewController)initWithEvent:(id)a3 isAttendeeProposeTime:(BOOL)a4 proposedStartDate:(id)a5 proposedEndDate:(id)a6
{
  v135[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v125.receiver = self;
  v125.super_class = (Class)EKUIAvailabilityViewController;
  v14 = [(EKUIAvailabilityViewController *)&v125 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_event, a3);
    v15->_isAttendeeProposeTime = a4;
    v15->_availableWidth = 1440.0;
    uint64_t v16 = objc_opt_new();
    participantAvailabilityViews = v15->_participantAvailabilityViews;
    v15->_participantAvailabilityViews = (NSMutableArray *)v16;

    uint64_t v18 = objc_opt_new();
    freeSpanViews = v15->_freeSpanViews;
    v15->_freeSpanViews = (NSMutableArray *)v18;

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v15 selector:sel__contentSizeCategoryChanged_ name:*MEMORY[0x1E4FB27A8] object:0];

    if (v12)
    {
      id v21 = v12;
    }
    else
    {
      id v21 = [v11 startDate];
    }
    v22 = v21;
    if (v13)
    {
      id v23 = v13;
    }
    else
    {
      id v23 = [v11 endDateUnadjustedForLegacyClients];
    }
    id v24 = v23;
    id v123 = v12;
    v121 = v22;
    if (!a4)
    {
      v22 = [v11 startDate];
    }
    objc_storeStrong((id *)&v15->_modifiedStartDate, v22);
    v25 = v24;
    if (!a4)
    {

      v25 = [v11 endDateUnadjustedForLegacyClients];
    }
    v120 = v24;
    id v122 = v13;
    id v124 = v11;
    objc_storeStrong((id *)&v15->_modifiedEndDate, v25);
    if (!a4) {

    }
    uint64_t v26 = objc_opt_new();
    hourLines = v15->_hourLines;
    v15->_hourLines = (NSMutableArray *)v26;

    uint64_t v28 = objc_opt_new();
    availabilityRequestsQueue = v15->_availabilityRequestsQueue;
    v15->_availabilityRequestsQueue = (NSOperationQueue *)v28;

    objc_opt_class();
    v30 = CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    [(NSOperationQueue *)v15->_availabilityRequestsQueue setName:v30];

    [(EKUIAvailabilityViewController *)v15 configureParticipants];
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:44.0];
    v15->_rowHeight = v31;
    v32 = objc_opt_new();
    [v32 configureWithTransparentBackground];
    v33 = [(EKUIAvailabilityViewController *)v15 navigationItem];
    [v33 setScrollEdgeAppearance:v32];

    v34 = [(EKUIAvailabilityViewController *)v15 navigationItem];
    v119 = v32;
    [v34 setStandardAppearance:v32];

    v35 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v15 action:sel_cancelTapped_];
    v36 = [(EKUIAvailabilityViewController *)v15 navigationItem];
    [v36 setLeftBarButtonItem:v35];

    uint64_t v37 = objc_opt_new();
    titleContainer = v15->_titleContainer;
    v15->_titleContainer = (EKUIAvailabilityTitleContainerView *)v37;

    [(EKUIAvailabilityTitleContainerView *)v15->_titleContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v39 = objc_opt_new();
    titleConstraints = v15->_titleConstraints;
    v15->_titleConstraints = (NSMutableArray *)v39;

    v41 = [(EKUIAvailabilityViewController *)v15 titleContainer];
    v42 = [(EKUIAvailabilityViewController *)v15 navigationItem];
    [v42 setTitleView:v41];

    id v43 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v44 = objc_msgSend(v43, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    largeDateNavContainer = v15->_largeDateNavContainer;
    v15->_largeDateNavContainer = (UIView *)v44;

    [(UIView *)v15->_largeDateNavContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v46 = objc_opt_new();
    largeWeekdayLabel = v15->_largeWeekdayLabel;
    v15->_largeWeekdayLabel = (EKUIResizingDateLabel *)v46;

    v48 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
    [(EKUIResizingDateLabel *)v15->_largeWeekdayLabel setFont:v48];

    [(EKUIResizingDateLabel *)v15->_largeWeekdayLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v49) = 1132068864;
    [(EKUIResizingDateLabel *)v15->_largeWeekdayLabel setContentCompressionResistancePriority:0 forAxis:v49];
    [(UIView *)v15->_largeDateNavContainer addSubview:v15->_largeWeekdayLabel];
    v50 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    v51 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.backward"];
    [v50 setImage:v51];

    uint64_t v52 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v50 primaryAction:0];
    previousButton = v15->_previousButton;
    v15->_previousButton = (UIButton *)v52;

    [(UIButton *)v15->_previousButton setAdjustsImageSizeForAccessibilityContentSizeCategory:0];
    [(UIButton *)v15->_previousButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v54) = 1148846080;
    [(UIButton *)v15->_previousButton setContentHuggingPriority:0 forAxis:v54];
    -[UIButton addTarget:action:forControlEvents:](v15->_previousButton, "addTarget:action:forControlEvents:", v15);
    [(UIView *)v15->_largeDateNavContainer addSubview:v15->_previousButton];
    v55 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    v56 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
    [v55 setImage:v56];

    uint64_t v57 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v55 primaryAction:0];
    nextButton = v15->_nextButton;
    v15->_nextButton = (UIButton *)v57;

    [(UIButton *)v15->_nextButton setAdjustsImageSizeForAccessibilityContentSizeCategory:0];
    [(UIButton *)v15->_nextButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v59) = 1148846080;
    [(UIButton *)v15->_nextButton setContentHuggingPriority:0 forAxis:v59];
    -[UIButton addTarget:action:forControlEvents:](v15->_nextButton, "addTarget:action:forControlEvents:", v15);
    [(UIView *)v15->_largeDateNavContainer addSubview:v15->_nextButton];
    v60 = (void *)MEMORY[0x1E4F28DC8];
    v134[0] = @"prev";
    v135[0] = v15->_previousButton;
    v134[1] = @"date";
    v135[1] = v15->_largeWeekdayLabel;
    v134[2] = @"next";
    v135[2] = v15->_nextButton;
    v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v135 forKeys:v134 count:3];
    v62 = [v60 constraintsWithVisualFormat:@"H:[prev][next][date]|" options:1024 metrics:0 views:v61];
    [v60 activateConstraints:v62];

    v63 = (void *)MEMORY[0x1E4F28DC8];
    v132 = @"date";
    v133 = v15->_largeWeekdayLabel;
    v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
    v65 = [v63 constraintsWithVisualFormat:@"V:|[date]|" options:0 metrics:0 views:v64];
    [v63 activateConstraints:v65];

    v66 = (void *)MEMORY[0x1E4F28DC8];
    v67 = [(EKUIAvailabilityViewController *)v15 previousButton];
    v68 = [(EKUIAvailabilityViewController *)v15 largeDateNavContainer];
    uint64_t v69 = [v66 constraintWithItem:v67 attribute:5 relatedBy:0 toItem:v68 attribute:5 multiplier:1.0 constant:0.0];
    largeNavLeadingConstraint = v15->_largeNavLeadingConstraint;
    v15->_largeNavLeadingConstraint = (NSLayoutConstraint *)v69;

    [(NSLayoutConstraint *)v15->_largeNavLeadingConstraint setActive:1];
    uint64_t v71 = objc_opt_new();
    dateNavContainer = v15->_dateNavContainer;
    v15->_dateNavContainer = (UIView *)v71;

    [(UIView *)v15->_dateNavContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v73 = objc_opt_new();
    weekdayLabel = v15->_weekdayLabel;
    v15->_weekdayLabel = (EKUIResizingDateLabel *)v73;

    v75 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
    [(EKUIResizingDateLabel *)v15->_weekdayLabel setFont:v75];

    [(EKUIResizingDateLabel *)v15->_weekdayLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(EKUIResizingDateLabel *)v15->_weekdayLabel setTextAlignment:1];
    LODWORD(v76) = 1132068864;
    [(EKUIResizingDateLabel *)v15->_weekdayLabel setContentCompressionResistancePriority:0 forAxis:v76];
    [(UIView *)v15->_dateNavContainer addSubview:v15->_weekdayLabel];
    v118 = v50;
    v77 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v50 primaryAction:0];
    [v77 setAdjustsImageSizeForAccessibilityContentSizeCategory:0];
    [v77 addTarget:v15 action:sel_previousDayTapped_ forControlEvents:64];
    [v77 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v15->_dateNavContainer addSubview:v77];
    v117 = v55;
    v78 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v55 primaryAction:0];
    [v78 setAdjustsImageSizeForAccessibilityContentSizeCategory:0];
    [v78 addTarget:v15 action:sel_nextDayTapped_ forControlEvents:64];
    [v78 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v15->_dateNavContainer addSubview:v78];
    v79 = (void *)MEMORY[0x1E4F28DC8];
    v116 = v77;
    v131[0] = v77;
    v130[0] = @"prev";
    v130[1] = @"date";
    v80 = v15->_weekdayLabel;
    v130[2] = @"next";
    v131[1] = v80;
    v131[2] = v78;
    v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v131 forKeys:v130 count:3];
    v82 = [v79 constraintsWithVisualFormat:@"H:|-(>=0)-[prev]-[date]-[next]-(>=0)-|" options:1024 metrics:0 views:v81];
    [v79 activateConstraints:v82];

    v83 = (void *)MEMORY[0x1E4F28DC8];
    v128 = @"date";
    v129 = v15->_weekdayLabel;
    v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
    v85 = [v83 constraintsWithVisualFormat:@"V:|[date]|" options:0 metrics:0 views:v84];
    [v83 activateConstraints:v85];

    v86 = [MEMORY[0x1E4F28DC8] constraintWithItem:v15->_weekdayLabel attribute:9 relatedBy:0 toItem:v15->_dateNavContainer attribute:9 multiplier:1.0 constant:0.0];
    [v86 setActive:1];

    id v87 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v88 = +[EKUIAvailabilityViewController nextTimeString];
    uint64_t v89 = [v87 initWithTitle:v88 style:0 target:v15 action:sel_nextAvailableTimeTapped_];
    topNextTime = v15->_topNextTime;
    v15->_topNextTime = (UIBarButtonItem *)v89;

    if ([(EKUIAvailabilityViewController *)v15 isAttendeeProposeTime])
    {
      [(UIBarButtonItem *)v15->_topNextTime setEnabled:1];
    }
    else
    {
      v91 = [(EKUIAvailabilityViewController *)v15 event];
      -[UIBarButtonItem setEnabled:](v15->_topNextTime, "setEnabled:", [v91 isEditable]);
    }
    v92 = (void *)MEMORY[0x1E4F1CAD0];
    v93 = +[EKUIAvailabilityViewController cancelNextTimeString];
    v127[0] = v93;
    v94 = +[EKUIAvailabilityViewController nextTimeString];
    v127[1] = v94;
    v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
    v96 = [v92 setWithArray:v95];
    [(UIBarButtonItem *)v15->_topNextTime setPossibleTitles:v96];

    uint64_t v97 = [MEMORY[0x1E4FB14A8] fixedSpaceItemOfWidth:15.0];
    topSpacer = v15->_topSpacer;
    v15->_topSpacer = (UIBarButtonItem *)v97;

    v99 = objc_opt_new();
    [v99 startAnimating];
    uint64_t v100 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v99];
    topSpinner = v15->_topSpinner;
    v15->_topSpinner = (UIBarButtonItem *)v100;

    uint64_t v102 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v15 action:sel_doneTapped_];
    doneButton = v15->_doneButton;
    v15->_doneButton = (UIBarButtonItem *)v102;

    if ([(EKUIAvailabilityViewController *)v15 isAttendeeProposeTime])
    {
      [(UIBarButtonItem *)v15->_doneButton setEnabled:1];
    }
    else
    {
      v104 = [(EKUIAvailabilityViewController *)v15 event];
      -[UIBarButtonItem setEnabled:](v15->_doneButton, "setEnabled:", [v104 isEditable]);
    }
    v126[0] = v15->_doneButton;
    v126[1] = v15->_topSpacer;
    v126[2] = v15->_topSpinner;
    v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:3];
    v106 = [(EKUIAvailabilityViewController *)v15 navigationItem];
    [v106 setRightBarButtonItems:v105];

    v107 = objc_opt_new();
    [v107 startAnimating];
    uint64_t v108 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v107];
    bottomSpinner = v15->_bottomSpinner;
    v15->_bottomSpinner = (UIBarButtonItem *)v108;

    id v110 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v111 = EventKitUIBundle();
    v112 = [v111 localizedStringForKey:@"Next Available Time" value:&stru_1F0CC2140 table:0];
    uint64_t v113 = [v110 initWithTitle:v112 style:0 target:v15 action:sel_nextAvailableTimeTapped_];
    bottomNextTime = v15->_bottomNextTime;
    v15->_bottomNextTime = (UIBarButtonItem *)v113;

    v15->_fetchingData = 1;
    id v12 = v123;
    id v11 = v124;
    id v13 = v122;
  }

  return v15;
}

- (void)_contentSizeCategoryChanged:(id)a3
{
}

+ (id)nextTimeString
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Next Available Time" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)cancelNextTimeString
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Stop Searching" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (CGSize)preferredContentSize
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:18.0];
  double v4 = v3 + 13.0;
  id v5 = [(EKUIAvailabilityViewController *)self participants];
  unint64_t v6 = [v5 count];

  unint64_t v7 = 5;
  if (v6 > 5) {
    unint64_t v7 = v6;
  }
  double v8 = (double)v7;
  [(EKUIAvailabilityViewController *)self rowHeight];
  double v10 = v4 + v8 * v9;
  double v11 = 880.0;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(EKUIAvailabilityViewController *)self preferredContentSize];
  [(EKUIAvailabilityViewController *)self sizeWillBeCompact:width < v8];
  v9.receiver = self;
  v9.super_class = (Class)EKUIAvailabilityViewController;
  -[EKUIAvailabilityViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (void)viewWillLayoutSubviews
{
  double v3 = [(EKUIAvailabilityViewController *)self view];
  [v3 frame];
  double v5 = v4;
  [(EKUIAvailabilityViewController *)self preferredContentSize];
  [(EKUIAvailabilityViewController *)self sizeWillBeCompact:v5 < v6];

  v7.receiver = self;
  v7.super_class = (Class)EKUIAvailabilityViewController;
  [(EKUIAvailabilityViewController *)&v7 viewWillLayoutSubviews];
}

- (void)sizeWillBeCompact:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(EKUIAvailabilityViewController *)self compact] != a3)
  {
    double v5 = [(EKUIAvailabilityViewController *)self view];
    double v6 = [v5 window];
    +[EKUIAvailabilityParticipantList listWidthForCompact:v3 orientation:EKUIInterfaceOrientationForViewHierarchy(v6)];
    double v8 = v7;
    objc_super v9 = [(EKUIAvailabilityViewController *)self participantWidthConstraint];
    [v9 setConstant:v8];

    [(EKUIAvailabilityViewController *)self setCompact:v3];
    [(EKUIAvailabilityViewController *)self configureNavBarAndToolBar];
    [(EKUIAvailabilityViewController *)self layout];
  }
}

+ (double)defaultTimelineHeight
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:18.0];
  return v2 + 68.0;
}

- (void)configureNavBarAndToolBar
{
  v100[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  double v4 = [(EKUIAvailabilityViewController *)self navigationController];
  objc_msgSend(v4, "setToolbarHidden:animated:", -[EKUIAvailabilityViewController compact](self, "compact") ^ 1, 0);

  BOOL v5 = [(EKUIAvailabilityViewController *)self searchingForNextAvailableTime];
  double v6 = [(EKUIAvailabilityViewController *)self topNextTime];
  if (v5)
  {
    double v7 = +[EKUIAvailabilityViewController cancelNextTimeString];
    [v6 setTitle:v7];

    double v8 = [(EKUIAvailabilityViewController *)self bottomNextTime];
    +[EKUIAvailabilityViewController cancelNextTimeString];
  }
  else
  {
    objc_super v9 = +[EKUIAvailabilityViewController nextTimeString];
    [v6 setTitle:v9];

    double v8 = [(EKUIAvailabilityViewController *)self bottomNextTime];
    +[EKUIAvailabilityViewController nextTimeString];
  double v10 = };
  [v8 setTitle:v10];

  double v11 = [(EKUIAvailabilityViewController *)self dateNavContainer];
  [v11 removeFromSuperview];

  id v12 = [(EKUIAvailabilityViewController *)self largeDateNavContainer];
  [v12 removeFromSuperview];

  id v13 = (void *)MEMORY[0x1E4F28DC8];
  v14 = [(EKUIAvailabilityViewController *)self titleConstraints];
  [v13 deactivateConstraints:v14];

  v15 = [(EKUIAvailabilityViewController *)self titleConstraints];
  [v15 removeAllObjects];

  +[EKUIAvailabilityViewController defaultTimelineHeight];
  double v17 = v16;
  uint64_t v18 = [(EKUIAvailabilityViewController *)self timelineHeightConstraint];
  [v18 setConstant:v17];

  if ([(EKUIAvailabilityViewController *)self compact])
  {
    [v3 configureWithDefaultBackground];
    if ([(EKUIAvailabilityViewController *)self fetchingData]
      && ![(EKUIAvailabilityViewController *)self searchingForNextAvailableTime])
    {
      v19 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
      v100[0] = v19;
      v20 = [(EKUIAvailabilityViewController *)self bottomSpinner];
      v100[1] = v20;
      id v21 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
      v100[2] = v21;
      v22 = v100;
    }
    else
    {
      v19 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
      v99[0] = v19;
      v20 = [(EKUIAvailabilityViewController *)self bottomNextTime];
      v99[1] = v20;
      id v21 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
      v99[2] = v21;
      v22 = v99;
    }
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
    [(EKUIAvailabilityViewController *)self setToolbarItems:v41 animated:1];

    v42 = [(EKUIAvailabilityViewController *)self navigationItem];
    id v43 = [(EKUIAvailabilityViewController *)self doneButton];
    v98 = v43;
    uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
    [v42 setRightBarButtonItems:v44 animated:0];

    v35 = objc_opt_new();
    [v35 configureWithOpaqueBackground];
    v45 = [(EKUIAvailabilityViewController *)self navigationController];
    uint64_t v46 = [v45 toolbar];
    [v46 setScrollEdgeAppearance:v35];

    v47 = [(EKUIAvailabilityViewController *)self navigationController];
    v48 = [v47 toolbar];
    [v48 setStandardAppearance:v35];

    double v49 = [(EKUIAvailabilityViewController *)self navigationController];
    v50 = [v49 toolbar];
    [v50 setCompactAppearance:v35];

    v51 = [(EKUIAvailabilityViewController *)self navigationController];
    uint64_t v52 = [v51 toolbar];
    [v52 setScrollEdgeAppearance:v35];

    v53 = [(EKUIAvailabilityViewController *)self navigationController];
    double v54 = [v53 toolbar];
    [v54 setTranslucent:0];

    v55 = [(EKUIAvailabilityViewController *)self titleContainer];
    [v55 frame];
    double v57 = v56;
    v58 = [(EKUIAvailabilityViewController *)self weekdayLabel];
    [v58 minDateLabelWidth];
    double v60 = v59 + 100.0;

    if (v57 >= v60)
    {
      v72 = [(EKUIAvailabilityViewController *)self navigationItem];
      [v72 _setBottomPalette:0];

      uint64_t v71 = [(EKUIAvailabilityViewController *)self titleContainer];
      uint64_t v73 = [(EKUIAvailabilityViewController *)self dateNavContainer];
      [v71 addSubview:v73];
    }
    else
    {
      v61 = [(EKUIAvailabilityViewController *)self palette];

      if (!v61)
      {
        id v62 = objc_alloc_init(MEMORY[0x1E4FB21F8]);
        [(EKUIAvailabilityViewController *)self setPalette:v62];

        v63 = [(EKUIAvailabilityViewController *)self palette];
        [v63 setPreferredHeight:40.0];
      }
      v64 = [(EKUIAvailabilityViewController *)self palette];
      v65 = [(EKUIAvailabilityViewController *)self navigationItem];
      [v65 _setBottomPalette:v64];

      v66 = [(EKUIAvailabilityViewController *)self palette];
      v67 = [v66 contentView];
      v68 = [(EKUIAvailabilityViewController *)self dateNavContainer];
      [v67 addSubview:v68];

      +[EKUIAvailabilityViewController defaultTimelineHeight];
      double v70 = v69 + 40.0;
      uint64_t v71 = [(EKUIAvailabilityViewController *)self timelineHeightConstraint];
      [v71 setConstant:v70];
    }

    v74 = [(EKUIAvailabilityViewController *)self titleConstraints];
    v75 = (void *)MEMORY[0x1E4F28DC8];
    v96 = @"date";
    double v76 = [(EKUIAvailabilityViewController *)self dateNavContainer];
    uint64_t v97 = v76;
    v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
    v78 = [v75 constraintsWithVisualFormat:@"H:|[date]|" options:0 metrics:0 views:v77];
    [v74 addObjectsFromArray:v78];

    v36 = [(EKUIAvailabilityViewController *)self titleConstraints];
    v79 = (void *)MEMORY[0x1E4F28DC8];
    v94 = @"date";
    uint64_t v37 = [(EKUIAvailabilityViewController *)self dateNavContainer];
    v95 = v37;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    v80 = [v79 constraintsWithVisualFormat:@"V:|[date]|" options:0 metrics:0 views:v38];
    [v36 addObjectsFromArray:v80];
  }
  else
  {
    [v3 configureWithTransparentBackground];
    id v23 = [(EKUIAvailabilityViewController *)self titleContainer];
    id v24 = [(EKUIAvailabilityViewController *)self largeDateNavContainer];
    [v23 addSubview:v24];

    v25 = [(EKUIAvailabilityViewController *)self titleConstraints];
    uint64_t v26 = (void *)MEMORY[0x1E4F28DC8];
    v92 = @"date";
    v27 = [(EKUIAvailabilityViewController *)self largeDateNavContainer];
    v93 = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    v29 = [v26 constraintsWithVisualFormat:@"H:|[date]|" options:0 metrics:0 views:v28];
    [v25 addObjectsFromArray:v29];

    v30 = [(EKUIAvailabilityViewController *)self titleConstraints];
    double v31 = (void *)MEMORY[0x1E4F28DC8];
    v90 = @"date";
    v32 = [(EKUIAvailabilityViewController *)self largeDateNavContainer];
    v91 = v32;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
    v34 = [v31 constraintsWithVisualFormat:@"V:|[date]|" options:0 metrics:0 views:v33];
    [v30 addObjectsFromArray:v34];

    if ([(EKUIAvailabilityViewController *)self fetchingData]
      && ![(EKUIAvailabilityViewController *)self searchingForNextAvailableTime])
    {
      v35 = [(EKUIAvailabilityViewController *)self navigationItem];
      v36 = [(EKUIAvailabilityViewController *)self doneButton];
      v89[0] = v36;
      uint64_t v37 = [(EKUIAvailabilityViewController *)self topSpacer];
      v89[1] = v37;
      v38 = [(EKUIAvailabilityViewController *)self topSpinner];
      v89[2] = v38;
      uint64_t v39 = (void *)MEMORY[0x1E4F1C978];
      v40 = v89;
    }
    else
    {
      v35 = [(EKUIAvailabilityViewController *)self navigationItem];
      v36 = [(EKUIAvailabilityViewController *)self doneButton];
      v88[0] = v36;
      uint64_t v37 = [(EKUIAvailabilityViewController *)self topSpacer];
      v88[1] = v37;
      v38 = [(EKUIAvailabilityViewController *)self topNextTime];
      v88[2] = v38;
      uint64_t v39 = (void *)MEMORY[0x1E4F1C978];
      v40 = v88;
    }
    v80 = [v39 arrayWithObjects:v40 count:3];
    [v35 setRightBarButtonItems:v80 animated:1];
  }

  v81 = (void *)MEMORY[0x1E4F28DC8];
  v82 = [(EKUIAvailabilityViewController *)self titleConstraints];
  [v81 activateConstraints:v82];

  v83 = [(EKUIAvailabilityViewController *)self navigationItem];
  [v83 setScrollEdgeAppearance:v3];

  v84 = [(EKUIAvailabilityViewController *)self navigationItem];
  [v84 setStandardAppearance:v3];

  v85 = [(EKUIAvailabilityViewController *)self navigationItem];
  [v85 setCompactAppearance:v3];

  v86 = [(EKUIAvailabilityViewController *)self navigationItem];
  [v86 setCompactScrollEdgeAppearance:v3];

  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __59__EKUIAvailabilityViewController_configureNavBarAndToolBar__block_invoke;
  v87[3] = &unk_1E6087570;
  v87[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v87);
  [(EKUIAvailabilityViewController *)self configureUnavailableStateForEvent];
}

uint64_t __59__EKUIAvailabilityViewController_configureNavBarAndToolBar__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layout];
}

- (void)cancelTapped:(id)a3
{
  double v4 = [(EKUIAvailabilityViewController *)self availabilityRequestsQueue];
  [v4 cancelAllOperations];

  BOOL v5 = [(EKEditItemViewController *)self editDelegate];

  if (v5)
  {
    id v6 = [(EKEditItemViewController *)self editDelegate];
    [v6 editItemViewController:self didCompleteWithAction:0];
  }
  else
  {
    id v6 = [(EKUIAvailabilityViewController *)self presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)nextDayTapped:(id)a3
{
  id v6 = [(EKUIAvailabilityViewController *)self currentStartDate];
  double v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  BOOL v5 = [v6 dateByAddingDays:1 inCalendar:v4];
  [(EKUIAvailabilityViewController *)self setDate:v5];
}

- (void)previousDayTapped:(id)a3
{
  id v6 = [(EKUIAvailabilityViewController *)self currentStartDate];
  double v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  BOOL v5 = [v6 dateByAddingDays:-1 inCalendar:v4];
  [(EKUIAvailabilityViewController *)self setDate:v5];
}

- (void)nextAvailableTimeTapped:(id)a3
{
  if ([(EKUIAvailabilityViewController *)self searchingForNextAvailableTime])
  {
    [(EKUIAvailabilityViewController *)self setSearchingForNextAvailableTime:0];
    [(EKUIAvailabilityViewController *)self configureNavBarAndToolBar];
  }
  else
  {
    [(EKUIAvailabilityViewController *)self setSearchingForNextAvailableTime:1];
    double v4 = [MEMORY[0x1E4F1C9C8] now];
    BOOL v5 = [(EKUIAvailabilityViewController *)self event];
    id v6 = [v5 timeZone];
    id v8 = [v4 dateForStartOfDayInTimeZone:v6];

    double v7 = [(EKUIAvailabilityViewController *)self currentStartDate];
    LODWORD(v5) = [v7 isBeforeDate:v8];

    if (v5)
    {
      [(EKUIAvailabilityViewController *)self setDate:v8];
    }
    else if (![(EKUIAvailabilityViewController *)self fetchingData])
    {
      [(EKUIAvailabilityViewController *)self findNextFreeSpan];
    }
  }
}

- (void)doneTapped:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKUIAvailabilityViewController *)self availabilityRequestsQueue];
  [v5 cancelAllOperations];

  id v6 = [(EKUIAvailabilityViewController *)self modifiedStartDate];
  BOOL v7 = [(EKUIAvailabilityViewController *)self isAttendeeProposeTime];
  id v8 = [(EKUIAvailabilityViewController *)self event];
  objc_super v9 = v8;
  if (v7) {
    [v8 proposedStartDate];
  }
  else {
  double v10 = [v8 startDate];
  }
  int v11 = [v6 isEqualToDate:v10];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__EKUIAvailabilityViewController_doneTapped___block_invoke;
  aBlock[3] = &unk_1E6087570;
  aBlock[4] = self;
  id v12 = (void (**)(void))_Block_copy(aBlock);
  if (![(EKUIAvailabilityViewController *)self isAttendeeProposeTime]
    && [(EKUIAvailabilityViewController *)self fromDetail]
    && (int v13 = v11 ^ 1,
        [(EKUIAvailabilityViewController *)self event],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 hasChanges] | v13,
        v14,
        v15 == 1))
  {
    double v16 = [(EKUIAvailabilityViewController *)self event];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __45__EKUIAvailabilityViewController_doneTapped___block_invoke_2;
    v19[3] = &unk_1E60881A0;
    id v20 = v16;
    id v21 = self;
    id v22 = v4;
    id v23 = v12;
    id v17 = v16;
    id v18 = +[EKUISendInviteAlertController presentInviteAlertWithOptions:4 viewController:self withCompletionHandler:v19];
  }
  else
  {
    v12[2](v12);
  }
}

void __45__EKUIAvailabilityViewController_doneTapped___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) editDelegate];

  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 saveAndDismiss];
  }
  else
  {
    id v4 = [v3 presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

void __45__EKUIAvailabilityViewController_doneTapped___block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) rollback];
  }
  else
  {
    if (a2) {
      return;
    }
    BOOL v3 = [*(id *)(a1 + 40) modifiedStartDate];
    [*(id *)(a1 + 32) setStartDate:v3];

    id v4 = [*(id *)(a1 + 40) modifiedEndDate];
    [*(id *)(a1 + 32) setEndDateUnadjustedForLegacyClients:v4];

    if ([*(id *)(a1 + 32) isOrWasPartOfRecurringSeries])
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__11;
      id v20 = __Block_byref_object_dispose__11;
      id v21 = 0;
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      BOOL v7 = *(void **)(a1 + 32);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __45__EKUIAvailabilityViewController_doneTapped___block_invoke_134;
      v12[3] = &unk_1E6089968;
      v12[4] = v6;
      id v13 = v7;
      id v14 = *(id *)(a1 + 56);
      int v15 = &v16;
      uint64_t v8 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:0 viewController:v6 barButtonItem:v5 forEvent:v13 withCompletionHandler:v12];
      objc_super v9 = (void *)v17[5];
      v17[5] = v8;

      _Block_object_dispose(&v16, 8);
      return;
    }
    double v10 = [*(id *)(a1 + 40) saveBlock];
    v10[2](v10, *(void *)(a1 + 32), 0);
  }
  int v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);

  v11();
}

void __45__EKUIAvailabilityViewController_doneTapped___block_invoke_134(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 3) >= 3)
  {
    uint64_t v13 = v3;
    uint64_t v14 = v2;
    if (a2 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = a2 == 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "saveBlock", v5, v4, v13, v14, v6);
    double v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v10[2](v10, *(void *)(a1 + 40), v9);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;
  }
}

- (void)loadView
{
  v105[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  [v8 setAutoresizingMask:18];
  uint64_t v9 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v8 setBackgroundColor:v9];

  v99 = v8;
  [(EKUIAvailabilityViewController *)self setView:v8];
  double v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setHidden:1];
  [v10 setNumberOfLines:3];
  [v10 setTextAlignment:1];
  uint64_t v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v10 setFont:v11];

  id v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v10 setTextColor:v12];

  [v10 setAdjustsFontForContentSizeCategory:1];
  [(EKUIAvailabilityViewController *)self setUnavailableLabel:v10];
  uint64_t v13 = [(EKUIAvailabilityViewController *)self view];
  [v13 addSubview:v10];

  uint64_t v14 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v102 = [(EKUIAvailabilityViewController *)self view];
  uint64_t v100 = [v14 constraintWithItem:v10 attribute:9 relatedBy:0 toItem:v102 attribute:9 multiplier:1.0 constant:0.0];
  v105[0] = v100;
  int v15 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v16 = [(EKUIAvailabilityViewController *)self view];
  id v17 = [v15 constraintWithItem:v10 attribute:10 relatedBy:0 toItem:v16 attribute:10 multiplier:1.0 constant:0.0];
  v105[1] = v17;
  uint64_t v18 = (void *)MEMORY[0x1E4F28DC8];
  v19 = [(EKUIAvailabilityViewController *)self view];
  id v20 = [v18 constraintWithItem:v10 attribute:5 relatedBy:0 toItem:v19 attribute:5 multiplier:1.0 constant:16.0];
  v105[2] = v20;
  id v21 = (void *)MEMORY[0x1E4F28DC8];
  id v22 = [(EKUIAvailabilityViewController *)self view];
  v98 = v10;
  id v23 = [v21 constraintWithItem:v10 attribute:3 relatedBy:0 toItem:v22 attribute:3 multiplier:1.0 constant:16.0];
  v105[3] = v23;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:4];
  [v14 activateConstraints:v24];

  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v5, v6, v7);
  [v25 setAutoresizingMask:18];
  uint64_t v26 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v25 setBackgroundColor:v26];

  [(EKUIAvailabilityViewController *)self setContainerView:v25];
  v27 = [(EKUIAvailabilityViewController *)self view];
  uint64_t v28 = [(EKUIAvailabilityViewController *)self containerView];
  [v27 addSubview:v28];

  v29 = objc_opt_new();
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(EKUIAvailabilityViewController *)self setScrollView:v29];
  [v29 setDelegate:self];
  [v29 setBounces:0];
  [v25 addSubview:v29];
  v30 = objc_opt_new();
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v31 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v30 setBackgroundColor:v31];

  [v25 addSubview:v30];
  v32 = objc_opt_new();
  v33 = EventKitUIBundle();
  v34 = [v33 localizedStringForKey:@"INVITEES" value:&stru_1F0CC2140 table:0];
  [v32 setText:v34];

  v35 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  [v32 setFont:v35];

  v36 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v32 setTextColor:v36];

  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v32 setAdjustsFontForContentSizeCategory:1];
  LODWORD(v37) = 1148846080;
  [v32 setContentHuggingPriority:0 forAxis:v37];
  v101 = v32;
  [v30 addSubview:v32];
  v38 = objc_opt_new();
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v39 = [MEMORY[0x1E4FB1618] separatorColor];
  [v38 setBackgroundColor:v39];

  [v38 setHidden:1];
  v103 = v30;
  [v30 addSubview:v38];
  [(EKUIAvailabilityViewController *)self setParticipantDivider:v38];
  v40 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_singleTap_];
  [v40 setNumberOfTapsRequired:1];
  if ([(EKUIAvailabilityViewController *)self isAttendeeProposeTime])
  {
    [v40 setEnabled:1];
  }
  else
  {
    v41 = [(EKUIAvailabilityViewController *)self event];
    objc_msgSend(v40, "setEnabled:", objc_msgSend(v41, "isEditable"));
  }
  [v40 setCancelsTouchesInView:0];
  v95 = v40;
  [v29 addGestureRecognizer:v40];
  v94 = (void *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:self action:sel_viewPinched_];
  objc_msgSend(v29, "addGestureRecognizer:");
  v42 = [EKUIAvailabilityParticipantList alloc];
  id v43 = [(EKUIAvailabilityViewController *)self participants];
  uint64_t v44 = [(EKUIAvailabilityParticipantList *)v42 initWithParticipants:v43 viewController:self];

  [(EKUIAvailabilityViewController *)self setParticipantList:v44];
  [(EKUIAvailabilityParticipantList *)v44 setDelegate:self];
  [(EKUIAvailabilityParticipantList *)v44 setBounces:0];
  [(EKUIAvailabilityParticipantList *)v44 setShowsVerticalScrollIndicator:0];
  v45 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [(EKUIAvailabilityParticipantList *)v44 setBackgroundColor:v45];

  [v25 addSubview:v44];
  uint64_t v46 = objc_opt_new();
  [v46 setTranslatesAutoresizingMaskIntoConstraints:0];
  v47 = [MEMORY[0x1E4FB1618] separatorColor];
  [v46 setBackgroundColor:v47];

  [v25 addSubview:v46];
  v48 = objc_opt_new();
  [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v49 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v48 setBackgroundColor:v49];

  [v48 setDelegate:self];
  [v48 setBounces:0];
  [v48 setShowsHorizontalScrollIndicator:0];
  [(EKUIAvailabilityViewController *)self setTimelineView:v48];
  uint64_t v97 = v25;
  [v25 addSubview:v48];
  v96 = v38;
  v93 = v46;
  v50 = _NSDictionaryOfVariableBindings(&cfstr_ScrollviewPart.isa, v29, v44, v48, v30, v46, v38, v101, 0);
  [(EKUIAvailabilityParticipantList *)v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(EKUIAvailabilityParticipantList *)v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  v51 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v52 = [(EKUIAvailabilityViewController *)self view];
  v53 = [v52 window];
  +[EKUIAvailabilityParticipantList listWidthForCompact:0 orientation:EKUIInterfaceOrientationForViewHierarchy(v53)];
  v55 = [v51 constraintWithItem:v44 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v54];
  [(EKUIAvailabilityViewController *)self setParticipantWidthConstraint:v55];

  double v56 = [(EKUIAvailabilityViewController *)self participantWidthConstraint];
  [v56 setActive:1];

  double v57 = [MEMORY[0x1E4F28DC8] constraintWithItem:v30 attribute:7 relatedBy:0 toItem:v44 attribute:7 multiplier:1.0 constant:0.0];
  [v57 setActive:1];

  v58 = (void *)MEMORY[0x1E4F28DC8];
  double v59 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[participantListHeader][timeLine]|" options:0 metrics:&unk_1F0D03DF8 views:v50];
  [v58 activateConstraints:v59];

  double v60 = (void *)MEMORY[0x1E4F28DC8];
  v61 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[participantList][scrollView]|" options:0 metrics:&unk_1F0D03DF8 views:v50];
  [v60 activateConstraints:v61];

  id v62 = [v101 leadingAnchor];
  v63 = [(EKUIAvailabilityViewController *)self view];
  v64 = [v63 safeAreaLayoutGuide];
  v65 = [v64 leadingAnchor];
  v66 = [v62 constraintEqualToAnchor:v65];

  [v66 setConstant:22.0];
  [v66 setActive:1];
  v67 = (void *)MEMORY[0x1E4F28DC8];
  v68 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[inviteesLabel]-(11)-|" options:0 metrics:&unk_1F0D03DF8 views:v50];
  [v67 activateConstraints:v68];

  double v69 = (void *)MEMORY[0x1E4F28DC8];
  double v70 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[participantDivider]|" options:0 metrics:&unk_1F0D03DF8 views:v50];
  [v69 activateConstraints:v70];

  uint64_t v71 = (void *)MEMORY[0x1E4F28DC8];
  v72 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[participantDivider(==dividerWidth)]-(dividerWidth)-|" options:0 metrics:&unk_1F0D03DF8 views:v50];
  [v71 activateConstraints:v72];

  uint64_t v73 = (void *)MEMORY[0x1E4F28DC8];
  v74 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[participantListDivider]|" options:0 metrics:&unk_1F0D03DF8 views:v50];
  [v73 activateConstraints:v74];

  v75 = (void *)MEMORY[0x1E4F28DC8];
  double v76 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[participantListDivider(==dividerWidth)][scrollView]" options:0 metrics:&unk_1F0D03DF8 views:v50];
  [v75 activateConstraints:v76];

  v77 = (void *)MEMORY[0x1E4F28DC8];
  +[EKUIAvailabilityViewController defaultTimelineHeight];
  v79 = [v77 constraintWithItem:v48 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v78];
  [(EKUIAvailabilityViewController *)self setTimelineHeightConstraint:v79];

  v80 = [(EKUIAvailabilityViewController *)self timelineHeightConstraint];
  [v80 setActive:1];

  v81 = (void *)MEMORY[0x1E4F28DC8];
  v82 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[timeLine][scrollView]|" options:0 metrics:&unk_1F0D03DF8 views:v50];
  [v81 activateConstraints:v82];

  v83 = (void *)MEMORY[0x1E4F28DC8];
  v84 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[participantListHeader][participantList]|" options:0 metrics:&unk_1F0D03DF8 views:v50];
  [v83 activateConstraints:v84];

  v85 = [MEMORY[0x1E4F28DC8] constraintWithItem:v103 attribute:8 relatedBy:0 toItem:v48 attribute:8 multiplier:1.0 constant:0.0];
  [v85 setActive:1];

  int v86 = 23;
  do
  {
    id v87 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v4, v5, v6, v7);
    v88 = [MEMORY[0x1E4FB1618] separatorColor];
    [v87 setBackgroundColor:v88];

    uint64_t v89 = [(EKUIAvailabilityViewController *)self scrollView];
    [v89 addSubview:v87];

    v90 = [(EKUIAvailabilityViewController *)self hourLines];
    [v90 addObject:v87];

    --v86;
  }
  while (v86);
  v91 = [(EKUIAvailabilityViewController *)self participants];
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __42__EKUIAvailabilityViewController_loadView__block_invoke;
  v104[3] = &unk_1E6089990;
  v104[4] = self;
  [v91 enumerateObjectsUsingBlock:v104];

  [(EKUIAvailabilityViewController *)self updateForContentCategory];
  v92 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v92 addObserver:self selector:sel_contentCategorySizeChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
}

void __42__EKUIAvailabilityViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v6 = [[EKUIAvailabilityRowView alloc] initWithParticipant:v3];

  double v4 = [*(id *)(a1 + 32) participantAvailabilityViews];
  [v4 addObject:v6];

  double v5 = [*(id *)(a1 + 32) scrollView];
  [v5 addSubview:v6];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)EKUIAvailabilityViewController;
  [(EKEditItemViewController *)&v3 viewDidLoad];
  [(EKUIAvailabilityViewController *)self configureUnavailableStateForEvent];
}

- (void)configureUnavailableStateForEvent
{
  objc_super v3 = (void *)MEMORY[0x1E4F254B8];
  double v4 = [(EKUIAvailabilityViewController *)self event];
  uint64_t v5 = [v3 availabilityPanelVisibilityForEvent:v4];

  switch(v5)
  {
    case 0:
      [(EKUIAvailabilityViewController *)self setAvailabilityPanelAvailable:1 unavailableMessage:0];
      return;
    case 1:
      double v6 = EventKitUIBundle();
      id v9 = v6;
      double v7 = @"No event is selected.";
      goto LABEL_11;
    case 2:
      double v6 = EventKitUIBundle();
      id v9 = v6;
      double v7 = @"This calendar does not support availability.";
      goto LABEL_11;
    case 3:
      double v6 = EventKitUIBundle();
      id v9 = v6;
      double v7 = @"You cannot see availability for all-day events.";
      goto LABEL_11;
    case 4:
      double v6 = EventKitUIBundle();
      id v9 = v6;
      double v7 = @"You cannot see availability for events spanning multiple days.";
      goto LABEL_11;
    case 5:
      double v6 = EventKitUIBundle();
      id v9 = v6;
      double v7 = @"You can only see availability for events with invitees.";
      goto LABEL_11;
    case 6:
      double v6 = EventKitUIBundle();
      id v9 = v6;
      double v7 = @"You cannot see the status of attendees.";
LABEL_11:
      uint64_t v8 = [v6 localizedStringForKey:v7 value:&stru_1F0CC2140 table:0];
      [(EKUIAvailabilityViewController *)self setAvailabilityPanelAvailable:0 unavailableMessage:v8];

      break;
    default:
      return;
  }
}

- (void)setAvailabilityPanelAvailable:(BOOL)a3 unavailableMessage:(id)a4
{
  BOOL v4 = a3;
  id v16 = a4;
  double v6 = [(EKUIAvailabilityViewController *)self unavailableLabel];
  double v7 = v6;
  if (v4)
  {
    [v6 setHidden:1];

    [(UIButton *)self->_previousButton setEnabled:1];
    [(UIButton *)self->_nextButton setEnabled:1];
    if ([(EKUIAvailabilityViewController *)self isAttendeeProposeTime])
    {
      [(UIBarButtonItem *)self->_topNextTime setEnabled:1];
    }
    else
    {
      uint64_t v13 = [(EKUIAvailabilityViewController *)self event];
      -[UIBarButtonItem setEnabled:](self->_topNextTime, "setEnabled:", [v13 isEditable]);
    }
    if ([(EKUIAvailabilityViewController *)self isAttendeeProposeTime])
    {
      [(UIBarButtonItem *)self->_doneButton setEnabled:1];
    }
    else
    {
      uint64_t v14 = [(EKUIAvailabilityViewController *)self event];
      -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", [v14 isEditable]);
    }
    int v15 = [(EKUIAvailabilityViewController *)self containerView];
    [v15 setHidden:0];

    uint64_t v11 = [(EKUIAvailabilityViewController *)self navigationController];
    uint64_t v12 = [(EKUIAvailabilityViewController *)self compact] ^ 1;
    double v10 = v11;
  }
  else
  {
    [v6 setHidden:0];

    uint64_t v8 = [(EKUIAvailabilityViewController *)self unavailableLabel];
    [v8 setText:v16];

    [(UIButton *)self->_previousButton setEnabled:0];
    [(UIButton *)self->_nextButton setEnabled:0];
    [(UIBarButtonItem *)self->_topNextTime setEnabled:0];
    [(UIBarButtonItem *)self->_doneButton setEnabled:0];
    id v9 = [(EKUIAvailabilityViewController *)self containerView];
    [v9 setHidden:1];

    double v10 = [(EKUIAvailabilityViewController *)self navigationController];
    uint64_t v11 = v10;
    uint64_t v12 = 1;
  }
  [v10 setToolbarHidden:v12 animated:0];
}

- (void)updateForContentCategory
{
  objc_super v3 = [(EKUIAvailabilityViewController *)self traitCollection];
  BOOL v4 = [v3 preferredContentSizeCategory];
  unint64_t v5 = *MEMORY[0x1E4FB27C0];

  if ((unint64_t)v4 <= v5)
  {
    double v10 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
    uint64_t v11 = [(EKUIAvailabilityViewController *)self weekdayLabel];
    [v11 setFont:v10];

    uint64_t v8 = (void *)MEMORY[0x1E4FB08E0];
    double v9 = 18.0;
  }
  else
  {
    double v6 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:22.0];
    double v7 = [(EKUIAvailabilityViewController *)self weekdayLabel];
    [v7 setFont:v6];

    uint64_t v8 = (void *)MEMORY[0x1E4FB08E0];
    double v9 = 22.0;
  }
  uint64_t v12 = [v8 boldSystemFontOfSize:v9];
  uint64_t v13 = [(EKUIAvailabilityViewController *)self largeWeekdayLabel];
  [v13 setFont:v12];

  +[EKUIAvailabilityViewController defaultTimelineHeight];
  double v15 = v14;
  id v16 = [(EKUIAvailabilityViewController *)self timelineHeightConstraint];
  [v16 setConstant:v15];

  id v17 = [(EKUIAvailabilityViewController *)self timelineView];
  [v17 setLabels];

  id v18 = [(EKUIAvailabilityViewController *)self view];
  [v18 setNeedsLayout];
}

- (void)configureParticipants
{
  objc_super v3 = (void *)MEMORY[0x1E4F57B38];
  id v5 = [(EKUIAvailabilityViewController *)self event];
  BOOL v4 = [v3 participantsForAvailabilityViewControllerFromEvent:v5];
  [(EKUIAvailabilityViewController *)self setParticipants:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKUIAvailabilityViewController;
  [(EKEditItemViewController *)&v5 viewWillAppear:a3];
  BOOL v4 = [(EKUIAvailabilityViewController *)self modifiedStartDate];
  [(EKUIAvailabilityViewController *)self setDate:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EKUIAvailabilityViewController;
  [(EKUIAvailabilityViewController *)&v7 viewDidAppear:a3];
  BOOL v4 = [(EKUIAvailabilityViewController *)self modifiedStartDate];
  BOOL v5 = [(EKUIAvailabilityViewController *)self updateCurrentEventAtTime:v4];

  if (!v5)
  {
    double v6 = [(EKUIAvailabilityViewController *)self scrollView];
    objc_msgSend(v6, "setContentOffset:", 510.0, 0.0);
  }
}

- (void)layout
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(EKUIAvailabilityViewController *)self weekdayLabel];
  [v3 layoutSubviews];

  BOOL v4 = [(EKUIAvailabilityViewController *)self largeWeekdayLabel];
  [v4 layoutSubviews];

  BOOL v5 = [(EKUIAvailabilityViewController *)self view];
  double v6 = [v5 window];
  uint64_t v7 = EKUIInterfaceOrientationForViewHierarchy(v6);

  if (![(EKUIAvailabilityViewController *)self compact])
  {
    if (CalInterfaceIsLeftToRight())
    {
      +[EKUIAvailabilityParticipantList listWidthForCompact:0 orientation:v7];
      double v9 = v8;
    }
    else
    {
      double v10 = [(EKUIAvailabilityViewController *)self view];
      [v10 frame];
      double v12 = v11;
      +[EKUIAvailabilityParticipantList listWidthForCompact:0 orientation:v7];
      double v9 = v12 - v13;
    }
    double v14 = [(EKUIAvailabilityViewController *)self view];
    double v15 = [(EKUIAvailabilityViewController *)self largeDateNavContainer];
    objc_msgSend(v14, "convertPoint:toView:", v15, v9, 0.0);
    double v17 = v16;

    char IsLeftToRight = CalInterfaceIsLeftToRight();
    if ((IsLeftToRight & 1) == 0)
    {
      double v15 = [(EKUIAvailabilityViewController *)self largeDateNavContainer];
      [v15 frame];
      double v17 = v19 - v17;
    }
    id v20 = [(EKUIAvailabilityViewController *)self largeNavLeadingConstraint];
    [v20 setConstant:v17];

    if ((IsLeftToRight & 1) == 0) {
  }
    }
  id v21 = [(EKUIAvailabilityViewController *)self participantAvailabilityViews];
  double v22 = (double)(unint64_t)[v21 count];
  [(EKUIAvailabilityViewController *)self rowHeight];
  double v24 = v23 * v22;

  v25 = [(EKUIAvailabilityViewController *)self participantList];
  [(EKUIAvailabilityViewController *)self rowHeight];
  objc_msgSend(v25, "setRowHeight:");

  +[EKUIAvailabilityParticipantList listWidthForCompact:[(EKUIAvailabilityViewController *)self compact] orientation:v7];
  double v27 = v26;
  uint64_t v28 = [(EKUIAvailabilityViewController *)self participantList];
  objc_msgSend(v28, "setContentSize:", v27, v24);

  v29 = [(EKUIAvailabilityViewController *)self timelineView];
  [(EKUIAvailabilityViewController *)self timelineWidth];
  objc_msgSend(v29, "setContentWidth:");

  v30 = [(EKUIAvailabilityViewController *)self hourLines];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __40__EKUIAvailabilityViewController_layout__block_invoke;
  v69[3] = &unk_1E60899B8;
  v69[4] = self;
  *(double *)&v69[5] = v24;
  [v30 enumerateObjectsUsingBlock:v69];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  double v31 = [(EKUIAvailabilityViewController *)self participantAvailabilityViews];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v66;
    double v35 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v66 != v34) {
          objc_enumerationMutation(v31);
        }
        double v37 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        [(EKUIAvailabilityViewController *)self availableWidth];
        double v39 = v38;
        [(EKUIAvailabilityViewController *)self rowHeight];
        objc_msgSend(v37, "setFrame:", 0.0, v35, v39, v40);
        [(EKUIAvailabilityViewController *)self rowHeight];
        double v35 = v35 + v41;
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v33);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v42 = [(EKUIAvailabilityViewController *)self freeSpanViews];
  uint64_t v43 = [v42 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v62 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        v48 = [v47 startDate];
        double v49 = [v47 endDate];
        [(EKUIAvailabilityViewController *)self frameForFreeSpanViewAtStart:v48 endDate:v49 duration:0.0];
        objc_msgSend(v47, "setFrame:");

        [v47 setNeedsDisplay];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v44);
  }

  v50 = [(EKUIAvailabilityViewController *)self eventTime];
  v51 = [(EKUIAvailabilityViewController *)self eventTime];
  uint64_t v52 = [v51 startDate];
  v53 = [(EKUIAvailabilityViewController *)self event];
  [v53 duration];
  -[EKUIAvailabilityViewController frameForFreeSpanViewAtStart:endDate:duration:](self, "frameForFreeSpanViewAtStart:endDate:duration:", v52, 0);
  objc_msgSend(v50, "setFrame:");

  [(EKUIAvailabilityViewController *)self availableWidth];
  double v55 = v54;
  double v56 = [(EKUIAvailabilityViewController *)self participantAvailabilityViews];
  double v57 = (double)(unint64_t)[v56 count];
  [(EKUIAvailabilityViewController *)self rowHeight];
  double v59 = v58 * v57;
  double v60 = [(EKUIAvailabilityViewController *)self scrollView];
  objc_msgSend(v60, "setContentSize:", v55, v59);
}

void __40__EKUIAvailabilityViewController_layout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v13 = a2;
  [v5 timelineWidth];
  double v7 = (double)(unint64_t)(a3 + 1) / 24.0 * v6 + -0.5;
  double v8 = *(double *)(a1 + 40);
  double v9 = [*(id *)(a1 + 32) scrollView];
  [v9 frame];
  double v11 = v10;

  if (v8 >= v11) {
    double v12 = v8;
  }
  else {
    double v12 = v11;
  }
  objc_msgSend(v13, "setFrame:", v7, 0.0, 0.5, v12);
}

- (void)setDate:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(EKUIAvailabilityViewController *)self event];
  uint64_t v5 = [v4 timeZone];
  double v6 = [v11 dateForStartOfDayInTimeZone:v5];

  double v7 = [(EKUIAvailabilityViewController *)self currentStartDate];
  LOBYTE(v5) = [v6 isEqualToDate:v7];

  if ((v5 & 1) == 0)
  {
    [(EKUIAvailabilityViewController *)self setCurrentStartDate:v6];
    double v8 = [(EKUIAvailabilityViewController *)self weekdayLabel];
    [v8 setDate:v11];

    double v9 = [(EKUIAvailabilityViewController *)self largeWeekdayLabel];
    [v9 setDate:v11];

    double v10 = [(EKUIAvailabilityViewController *)self eventTime];
    [v10 removeFromSuperview];

    [(EKUIAvailabilityViewController *)self setEventTime:0];
    [(EKUIAvailabilityViewController *)self clearFreeSpanViews];
    [(EKUIAvailabilityViewController *)self fetchAvailability];
  }
}

- (void)clearFreeSpanViews
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = [(EKUIAvailabilityViewController *)self freeSpanViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  double v8 = [(EKUIAvailabilityViewController *)self freeSpanViews];
  [v8 removeAllObjects];
}

- (void)fetchAvailability
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  [(EKUIAvailabilityViewController *)self setFetchingData:1];
  [(EKUIAvailabilityViewController *)self configureNavBarAndToolBar];
  objc_super v3 = [(EKUIAvailabilityViewController *)self currentStartDate];
  uint64_t v28 = [v3 dateByAddingTimeInterval:86399.0];

  objc_initWeak(&location, self);
  uint64_t v4 = [(EKUIAvailabilityViewController *)self availabilityRequestsQueue];
  [v4 cancelAllOperations];

  uint64_t v5 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v6 = [(EKUIAvailabilityViewController *)self participantAvailabilityViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v40;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v39 + 1) + 8 * v9);
        long long v11 = [(EKUIAvailabilityViewController *)self currentStartDate];
        [v10 startLoadForDate:v11];

        long long v12 = [v10 participant];
        id v13 = [v12 URL];
        uint64_t v14 = [v13 absoluteString];

        [v5 setObject:v10 forKeyedSubscript:v14];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v7);
  }

  double v15 = [(EKUIAvailabilityViewController *)self currentStartDate];
  id v16 = objc_alloc(MEMORY[0x1E4F25608]);
  double v17 = [(EKUIAvailabilityViewController *)self event];
  id v18 = [v17 calendar];
  double v19 = [v18 source];
  id v20 = [(EKUIAvailabilityViewController *)self currentStartDate];
  id v21 = [(EKUIAvailabilityViewController *)self event];
  double v22 = [v5 allKeys];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke;
  v35[3] = &unk_1E60899E0;
  objc_copyWeak(&v38, &location);
  id v23 = v15;
  id v36 = v23;
  id v24 = v5;
  id v37 = v24;
  v25 = (void *)[v16 initWithSource:v19 startDate:v20 endDate:v28 ignoredEvent:v21 addresses:v22 resultsBlock:v35];

  objc_initWeak(&from, v25);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_3;
  v29[3] = &unk_1E6089A08;
  objc_copyWeak(&v32, &location);
  id v26 = v23;
  id v30 = v26;
  objc_copyWeak(&v33, &from);
  double v31 = self;
  [v25 setCompletionBlock:v29];
  double v27 = [(EKUIAvailabilityViewController *)self availabilityRequestsQueue];
  [v27 addOperation:v25];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [WeakRetained currentStartDate];
  LODWORD(v5) = [v5 isEqualToDate:v6];

  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_2;
    v7[3] = &unk_1E60893C8;
    id v8 = *(id *)(a1 + 40);
    [v3 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 objectForKeyedSubscript:a2];
  [v6 addToSpans:v5];
}

void __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [WeakRetained currentStartDate];
  LODWORD(v3) = [v3 isEqualToDate:v4];

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 56));
    if (([v5 isCancelled] & 1) == 0)
    {
      [WeakRetained setFetchingData:0];
      id v6 = [v5 error];

      if (v6)
      {
        [*(id *)(a1 + 40) setSearchingForNextAvailableTime:0];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v7 = [*(id *)(a1 + 40) participantAvailabilityViews];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              [*(id *)(*((void *)&v22 + 1) + 8 * v11++) completedLoad];
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
          }
          while (v9);
        }
      }
      else
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v12 = [*(id *)(a1 + 40) participantAvailabilityViews];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v19;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v19 != v15) {
                objc_enumerationMutation(v12);
              }
              [*(id *)(*((void *)&v18 + 1) + 8 * v16++) completedLoad];
            }
            while (v14 != v16);
            uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v14);
        }

        [*(id *)(a1 + 40) findPossibleEventRanges];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_4;
      block[3] = &unk_1E6087570;
      block[4] = *(void *)(a1 + 40);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) configureNavBarAndToolBar];
}

- (BOOL)span:(id)a3 overlapsWithDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 startDate];
  if ([v7 CalIsBeforeOrSameAsDate:v6])
  {
    uint64_t v8 = [v5 endDate];
    char v9 = [v8 CalIsAfterOrSameAsDate:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)dedupSpans:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v24 = (id)objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v3;
  uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v6 = v24;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (!v7)
        {

LABEL_19:
          [v6 addObject:v5];
          continue;
        }
        uint64_t v8 = v7;
        uint64_t v26 = i;
        double v27 = v5;
        char v9 = 0;
        uint64_t v10 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v8; ++j)
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v6);
            }
            long long v12 = *(void **)(*((void *)&v28 + 1) + 8 * j);
            uint64_t v13 = [v12 startDate];
            uint64_t v14 = [v5 startDate];
            if ([v13 isEqualToDate:v14])
            {
              uint64_t v15 = [v12 endDate];
              [v5 endDate];
              uint64_t v16 = v8;
              uint64_t v17 = v10;
              v19 = id v18 = v6;
              char v20 = [v15 isEqualToDate:v19];

              id v6 = v18;
              uint64_t v10 = v17;
              uint64_t v8 = v16;
              id v5 = v27;
            }
            else
            {
              char v20 = 0;
            }

            v9 |= v20;
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v8);

        uint64_t i = v26;
        if ((v9 & 1) == 0) {
          goto LABEL_19;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v25);
  }

  return v24;
}

- (id)mergeSpan:(id)a3 intoSpans:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!objc_msgSend(MEMORY[0x1E4F254B8], "showTypeAsBusy:", objc_msgSend(v6, "type"))) {
    goto LABEL_22;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v8 = (void *)[v7 copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v9)
  {

LABEL_20:
    id v30 = objc_alloc(MEMORY[0x1E4F254B0]);
    long long v31 = [v6 startDate];
    long long v32 = [v6 endDate];
    long long v28 = objc_msgSend(v30, "initWithStartDate:endDate:type:", v31, v32, objc_msgSend(v6, "type"));

    [v7 addObject:v28];
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  id v37 = v7;
  uint64_t v38 = self;
  char v40 = 0;
  uint64_t v11 = *(void *)v42;
  id v39 = v6;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      uint64_t v14 = objc_msgSend(v6, "startDate", v37);
      uint64_t v15 = [v13 startDate];
      if ([v14 CalIsAfterOrSameAsDate:v15])
      {
        [v6 endDate];
        uint64_t v16 = v11;
        id v18 = v17 = v8;
        [v13 endDate];
        char v20 = v19 = v10;
        char v21 = [v18 CalIsBeforeOrSameAsDate:v20];

        uint64_t v10 = v19;
        uint64_t v8 = v17;
        uint64_t v11 = v16;
        self = v38;
        id v6 = v39;

        if (v21)
        {
          id v29 = v37;

          goto LABEL_23;
        }
      }
      else
      {
      }
      long long v22 = [v13 startDate];
      BOOL v23 = [(EKUIAvailabilityViewController *)self span:v6 overlapsWithDate:v22];

      if (v23)
      {
        id v24 = [v6 startDate];
        [v13 setStartDate:v24];

        char v40 = 1;
      }
      uint64_t v25 = [v13 endDate];
      BOOL v26 = [(EKUIAvailabilityViewController *)self span:v6 overlapsWithDate:v25];

      if (v26)
      {
        double v27 = [v6 endDate];
        [v13 setEndDate:v27];

        char v40 = 1;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v10);

  id v7 = v37;
  if ((v40 & 1) == 0) {
    goto LABEL_20;
  }
  [(EKUIAvailabilityViewController *)self dedupSpans:v37];
  long long v28 = v37;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  long long v33 = (void *)MEMORY[0x1E4F1CA48];
  long long v34 = [v7 sortedArrayUsingComparator:&__block_literal_global_33];
  uint64_t v35 = [v33 arrayWithArray:v34];

  id v7 = (id)v35;
LABEL_22:
  id v29 = v7;
LABEL_23:

  return v29;
}

uint64_t __54__EKUIAvailabilityViewController_mergeSpan_intoSpans___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)findPossibleEventRanges
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = [(EKUIAvailabilityViewController *)self participantAvailabilityViews];
  uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v9 = [v8 spans];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v38;
          do
          {
            uint64_t v13 = 0;
            uint64_t v14 = v3;
            do
            {
              if (*(void *)v38 != v12) {
                objc_enumerationMutation(v9);
              }
              id v3 = [(EKUIAvailabilityViewController *)self mergeSpan:*(void *)(*((void *)&v37 + 1) + 8 * v13) intoSpans:v14];

              ++v13;
              uint64_t v14 = v3;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v5);
  }

  uint64_t v15 = objc_opt_new();
  uint64_t v16 = [(EKUIAvailabilityViewController *)self currentStartDate];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v17 = v3;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      uint64_t v21 = 0;
      long long v22 = v16;
      do
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        BOOL v23 = *(void **)(*((void *)&v33 + 1) + 8 * v21);
        id v24 = [v23 startDate];
        int v25 = [v22 CalIsBeforeDate:v24];

        if (v25)
        {
          id v26 = objc_alloc(MEMORY[0x1E4F254B0]);
          double v27 = [v23 startDate];
          long long v28 = (void *)[v26 initWithStartDate:v22 endDate:v27 type:2];

          [v15 addObject:v28];
        }
        uint64_t v16 = [v23 endDate];

        ++v21;
        long long v22 = v16;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v19);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__EKUIAvailabilityViewController_findPossibleEventRanges__block_invoke;
  block[3] = &unk_1E6087D68;
  block[4] = self;
  id v32 = v15;
  id v29 = v15;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__EKUIAvailabilityViewController_findPossibleEventRanges__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) clearFreeSpanViews];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "endDate", (void)v24);
        uint64_t v9 = [v7 startDate];
        [v8 timeIntervalSinceDate:v9];
        double v11 = v10;

        uint64_t v12 = [*(id *)(a1 + 32) event];
        [v12 duration];
        double v14 = v13;

        if (v11 >= v14)
        {
          uint64_t v15 = *(void **)(a1 + 32);
          uint64_t v16 = [v7 startDate];
          id v17 = [v7 endDate];
          uint64_t v18 = [v15 eventFreeSpanAtStart:v16 endDate:v17 isFreeSpan:1];

          uint64_t v19 = [*(id *)(a1 + 32) freeSpanViews];
          [v19 addObject:v18];

          uint64_t v20 = [*(id *)(a1 + 32) scrollView];
          [v20 addSubview:v18];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }

  uint64_t v21 = *(void **)(a1 + 32);
  long long v22 = [v21 modifiedStartDate];
  [v21 updateCurrentEventAtTime:v22];

  uint64_t result = [*(id *)(a1 + 32) searchingForNextAvailableTime];
  if (result) {
    return [*(id *)(a1 + 32) findNextFreeSpan];
  }
  return result;
}

- (void)findNextFreeSpan
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v3 = [(EKUIAvailabilityViewController *)self freeSpanViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v30 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * v7);
      uint64_t v9 = [v8 startDate];
      double v10 = [(EKUIAvailabilityViewController *)self modifiedStartDate];
      int v11 = [v9 isAfterDate:v10];

      if (v11) {
        break;
      }
      uint64_t v12 = [v8 endDate];
      double v13 = [(EKUIAvailabilityViewController *)self modifiedEndDate];
      int v14 = [v12 isAfterDate:v13];

      if (v14)
      {
        id v17 = [(EKUIAvailabilityViewController *)self modifiedStartDate];
        uint64_t v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        uint64_t v19 = [v17 dateByAddingHours:1 inCalendar:v18];
        [(EKUIAvailabilityViewController *)self setModifiedStartDate:v19];

        uint64_t v20 = [(EKUIAvailabilityViewController *)self modifiedStartDate];
        uint64_t v21 = [(EKUIAvailabilityViewController *)self event];
        [(id)v21 duration];
        long long v22 = objc_msgSend(v20, "dateByAddingTimeInterval:");

        BOOL v23 = [v8 endDate];
        LOBYTE(v21) = [v22 isBeforeDate:v23];

        if ((v21 & 1) == 0)
        {
          long long v24 = [v8 endDate];
          long long v25 = [(EKUIAvailabilityViewController *)self event];
          [v25 duration];
          long long v27 = [v24 dateByAddingTimeInterval:-v26];
          [(EKUIAvailabilityViewController *)self setModifiedStartDate:v27];
        }
        long long v28 = [(EKUIAvailabilityViewController *)self modifiedStartDate];
        [(EKUIAvailabilityViewController *)self updateCurrentEventAtTime:v28];

        [(EKUIAvailabilityViewController *)self setSearchingForNextAvailableTime:0];
        goto LABEL_15;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    uint64_t v15 = [v8 startDate];
    [(EKUIAvailabilityViewController *)self setModifiedStartDate:v15];

    uint64_t v16 = [(EKUIAvailabilityViewController *)self modifiedStartDate];
    [(EKUIAvailabilityViewController *)self updateCurrentEventAtTime:v16];

    [(EKUIAvailabilityViewController *)self setSearchingForNextAvailableTime:0];
LABEL_15:

    return;
  }
LABEL_10:

  [(EKUIAvailabilityViewController *)self nextDayTapped:0];
}

- (void)singleTap:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKUIAvailabilityViewController *)self scrollView];
  [v4 locationInView:v5];
  double v7 = v6;

  [(EKUIAvailabilityViewController *)self timelineWidth];
  double v9 = v8 / 24.0;
  double v10 = [(EKUIAvailabilityViewController *)self event];
  [v10 duration];
  double v12 = v9 * (v11 / 3600.0);

  double v38 = v12;
  double v13 = v7 - v12 * 0.5;
  double v14 = v7 + v12 * 0.5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__EKUIAvailabilityViewController_singleTap___block_invoke;
  aBlock[3] = &unk_1E6089A30;
  aBlock[4] = self;
  uint64_t v15 = (void (**)(void, __n128, double))_Block_copy(aBlock);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v16 = [(EKUIAvailabilityViewController *)self freeSpanViews];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    double v19 = v9 * 0.25;
    uint64_t v20 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v16);
        }
        long long v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        [v22 frame];
        double v24 = v23;
        [v22 frame];
        double v26 = v25;
        [v22 frame];
        double v28 = v26 + v27;
        if (v7 > v24 && v7 < v28)
        {
          double v30 = v13 - v24 >= 0.0 ? v13 - v24 : -(v13 - v24);
          double v31 = v28 - v14 >= 0.0 ? v28 - v14 : -(v28 - v14);
          if (v30 < v19 || v31 < v19)
          {
            int IsLeftToRight = CalTimeDirectionIsLeftToRight();
            v35.n128_u64[0] = 0;
            if (IsLeftToRight) {
              v35.n128_f64[0] = v38;
            }
            v35.n128_f64[0] = v28 - v35.n128_f64[0];
            double v36 = -0.0;
            if (!IsLeftToRight) {
              double v36 = v38;
            }
            double v37 = v24 + v36;
            if (v30 <= v31) {
              v35.n128_f64[0] = v37;
            }
            v15[2](v15, v35, 60.0);

            goto LABEL_34;
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  if (CalTimeDirectionIsLeftToRight()) {
    v33.n128_f64[0] = v13;
  }
  else {
    v33.n128_f64[0] = v14;
  }
  v15[2](v15, v33, 900.0);
LABEL_34:
}

void __44__EKUIAvailabilityViewController_singleTap___block_invoke(uint64_t a1, double a2, double a3)
{
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  [*(id *)(a1 + 32) timelineWidth];
  if (!IsLeftToRight)
  {
    a2 = v7 - a2;
    [*(id *)(a1 + 32) timelineWidth];
  }
  double v8 = floor(a2 / v7 * 86400.0 / a3 + 0.5) * a3;
  id v30 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v9 = [*(id *)(a1 + 32) event];
  double v10 = [v9 startDate];
  double v11 = [v30 components:64 fromDate:v10];

  double v12 = [*(id *)(a1 + 32) event];
  double v13 = [v12 endDateUnadjustedForLegacyClients];
  double v14 = [v30 components:64 fromDate:v13];

  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * [v14 minute] + 0x888888888888888, 1) <= 0x888888888888888uLL
    && [v11 minute] <= 9)
  {
    HIDWORD(v15) = -2023406815 * (int)v8 + 9544368;
    LODWORD(v15) = HIDWORD(v15);
    if ((v15 >> 3) <= 0x2468AC) {
      double v8 = v8 + (double)(60 * [v11 minute]);
    }
  }
  uint64_t v16 = [*(id *)(a1 + 32) currentStartDate];
  uint64_t v17 = [v16 dateByAddingTimeInterval:v8];

  uint64_t v18 = [*(id *)(a1 + 32) event];
  double v19 = [v18 timeZone];
  uint64_t v20 = [*(id *)(a1 + 32) currentStartDate];
  [v19 daylightSavingTimeOffsetForDate:v20];
  unint64_t v22 = (unint64_t)v21;

  double v23 = [*(id *)(a1 + 32) event];
  double v24 = [v23 timeZone];
  [v24 daylightSavingTimeOffsetForDate:v17];
  unint64_t v26 = (unint64_t)v25;

  double v27 = *(void **)(a1 + 32);
  double v28 = [v27 currentStartDate];
  long long v29 = [v28 dateByAddingTimeInterval:v8 + (double)(uint64_t)(v22 - v26)];
  [v27 updateCurrentEventAtTime:v29];
}

- (void)viewPinched:(id)a3
{
  id v38 = a3;
  uint64_t v4 = [v38 state];
  if ((unint64_t)(v4 - 3) <= 2) {
    [(EKUIAvailabilityViewController *)self layout];
  }
  if (([v38 numberOfTouches] & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    if (v4 == 2)
    {
      double v9 = [(EKUIAvailabilityViewController *)self timelineView];
      [v9 minWidth];
      double v11 = v10;

      [(EKUIAvailabilityViewController *)self pinchStartWidth];
      double v13 = v12;
      [v38 scale];
      double v15 = v13 * v14;
      if (v11 >= v15) {
        double v15 = v11;
      }
      if (v15 > 5000.0) {
        double v15 = 5000.0;
      }
      [(EKUIAvailabilityViewController *)self setAvailableWidth:v15];
      uint64_t v16 = [(EKUIAvailabilityViewController *)self view];
      [v38 locationOfTouch:0 inView:v16];
      double v18 = v17;
      BOOL v19 = [(EKUIAvailabilityViewController *)self compact];
      uint64_t v20 = [(EKUIAvailabilityViewController *)self view];
      double v21 = [v20 window];
      +[EKUIAvailabilityParticipantList listWidthForCompact:v19 orientation:EKUIInterfaceOrientationForViewHierarchy(v21)];
      double v23 = v18 - v22;

      [(EKUIAvailabilityViewController *)self pinchStartRatio];
      double v25 = v24;
      [(EKUIAvailabilityViewController *)self availableWidth];
      double v27 = -(v23 - v25 * v26);
      double v28 = [(EKUIAvailabilityViewController *)self scrollView];
      [v28 contentOffset];
      double v30 = v29;

      if (v27 >= 0.0) {
        double v31 = v27;
      }
      else {
        double v31 = 0.0;
      }
      [(EKUIAvailabilityViewController *)self availableWidth];
      double v33 = v32;
      uint64_t v34 = [(EKUIAvailabilityViewController *)self scrollView];
      [v34 frame];
      double v36 = v33 - v35;

      if (v31 < v36) {
        double v36 = v31;
      }
      double v37 = [(EKUIAvailabilityViewController *)self scrollView];
      objc_msgSend(v37, "setContentOffset:animated:", 0, v36, v30);

      [(EKUIAvailabilityViewController *)self layout];
    }
    else if (v4 == 1)
    {
      [(EKUIAvailabilityViewController *)self availableWidth];
      -[EKUIAvailabilityViewController setPinchStartWidth:](self, "setPinchStartWidth:");
      uint64_t v5 = [(EKUIAvailabilityViewController *)self scrollView];
      [v38 locationOfTouch:0 inView:v5];
      double v7 = v6;
      [(EKUIAvailabilityViewController *)self pinchStartWidth];
      [(EKUIAvailabilityViewController *)self setPinchStartRatio:v7 / v8];
    }
  }
}

- (BOOL)span:(id)a3 overlapsWithStartDate:(id)a4 endDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_msgSend(MEMORY[0x1E4F254B8], "showTypeAsBusy:", objc_msgSend(v7, "type")))
  {
    double v10 = [v7 startDate];
    if ([v10 CalIsBeforeOrSameAsDate:v8])
    {
      double v11 = [v7 endDate];
      char v12 = [v11 CalIsAfterDate:v8];

      if (v12) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    double v14 = [v7 startDate];
    if ([v14 CalIsBeforeDate:v9])
    {
      double v15 = [v7 endDate];
      char v16 = [v15 CalIsAfterOrSameAsDate:v9];

      if (v16)
      {
LABEL_9:
        char v13 = 1;
        goto LABEL_15;
      }
    }
    else
    {
    }
    double v17 = [v7 startDate];
    if ([v17 CalIsAfterOrSameAsDate:v8])
    {
      double v18 = [v7 endDate];
      char v13 = [v18 CalIsBeforeOrSameAsDate:v9];
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }
LABEL_15:

  return v13;
}

- (BOOL)updateCurrentEventAtTime:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(EKUIAvailabilityViewController *)self event];
  [v5 duration];
  double v6 = objc_msgSend(v4, "dateByAddingTimeInterval:");

  [(EKUIAvailabilityViewController *)self setModifiedStartDate:v4];
  [(EKUIAvailabilityViewController *)self setModifiedEndDate:v6];
  id v7 = [(EKUIAvailabilityViewController *)self eventTime];
  [v7 removeFromSuperview];

  id v8 = objc_alloc(MEMORY[0x1E4F576D0]);
  id v9 = [(EKUIAvailabilityViewController *)self currentStartDate];
  double v10 = (void *)[v8 initWithStartDate:v9 duration:86400.0];

  if (([v10 containsDate:v4] & 1) != 0 || objc_msgSend(v10, "containsDate:", v6))
  {
    double v11 = [(EKUIAvailabilityViewController *)self eventFreeSpanAtStart:v4 endDate:v6 isFreeSpan:0];
    [(EKUIAvailabilityViewController *)self setEventTime:v11];

    char v12 = [(EKUIAvailabilityViewController *)self scrollView];
    char v13 = [(EKUIAvailabilityViewController *)self eventTime];
    [v12 addSubview:v13];

    double v14 = [(EKUIAvailabilityViewController *)self scrollView];
    double v15 = [(EKUIAvailabilityViewController *)self eventTime];
    [v15 frame];
    BOOL v16 = 1;
    objc_msgSend(v14, "scrollRectToVisible:animated:", 1);

    if (![(EKUIAvailabilityViewController *)self fetchingData])
    {
      double v31 = v10;
      double v33 = objc_opt_new();
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      obuint64_t j = [(EKUIAvailabilityViewController *)self participantAvailabilityViews];
      uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v34 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v40 != v34) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            double v21 = objc_msgSend(v20, "spans", v31);
            uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v36;
              while (2)
              {
                for (uint64_t j = 0; j != v23; ++j)
                {
                  if (*(void *)v36 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  if ([(EKUIAvailabilityViewController *)self span:*(void *)(*((void *)&v35 + 1) + 8 * j) overlapsWithStartDate:v4 endDate:v6])
                  {
                    double v26 = (void *)MEMORY[0x1E4F255C0];
                    double v27 = [v20 participant];
                    double v28 = [v26 participantForSortingWithEKParticipant:v27];

                    [v33 addObject:v28];
                    goto LABEL_19;
                  }
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
                if (v23) {
                  continue;
                }
                break;
              }
            }
LABEL_19:
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v18);
      }

      [(EKUIAvailabilityViewController *)self setBusyParticipants:v33];
      double v29 = [(EKUIAvailabilityViewController *)self participantList];
      [v29 setBusyParticipants:v33];

      BOOL v16 = 1;
      double v10 = v31;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (CGRect)frameForFreeSpanViewAtStart:(id)a3 endDate:(id)a4 duration:(double)a5
{
  id v7 = a4;
  [(EKUIAvailabilityViewController *)self convertDateIntoOffset:a3];
  double v9 = v8;
  if (v7)
  {
    [(EKUIAvailabilityViewController *)self convertDateIntoOffset:v7];
    double v11 = v10;
    if (CalTimeDirectionIsLeftToRight()) {
      double v12 = v11 - v9;
    }
    else {
      double v12 = v9 - v11;
    }
  }
  else
  {
    char v13 = [(EKUIAvailabilityViewController *)self event];
    [v13 duration];
    double v15 = v14 / 86400.0;
    [(EKUIAvailabilityViewController *)self timelineWidth];
    double v17 = v16;
    double v12 = v15 * v16;

    int IsLeftToRight = CalTimeDirectionIsLeftToRight();
    double v19 = -(v15 * v17);
    if (IsLeftToRight) {
      double v19 = v12;
    }
    double v11 = v9 + v19;
  }
  +[EKUIAvailabilityRowView padInset];
  double v21 = v20;
  +[EKUIAvailabilityRowView cornerRadius];
  if (v12 < v22)
  {
    +[EKUIAvailabilityRowView cornerRadius];
    double v12 = v23;
  }
  if (!CalTimeDirectionIsLeftToRight()) {
    double v9 = v11;
  }
  uint64_t v24 = [(EKUIAvailabilityViewController *)self participantAvailabilityViews];
  double v25 = (double)(unint64_t)[v24 count];
  [(EKUIAvailabilityViewController *)self rowHeight];
  double v27 = v21 * -2.0 + v25 * v26;

  double v28 = v9;
  double v29 = v21;
  double v30 = v12;
  double v31 = v27;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)eventFreeSpanAtStart:(id)a3 endDate:(id)a4 isFreeSpan:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [(EKUIAvailabilityViewController *)self event];
  double v11 = [v10 calendar];
  double v12 = [v11 displayColor];

  [(EKUIAvailabilityViewController *)self frameForFreeSpanViewAtStart:v9 endDate:v8 duration:0.0];
  double v17 = -[EKUIAvailabilityFreeSpanView initWithFrame:andColor:startDate:endDate:isFreeSpan:]([EKUIAvailabilityFreeSpanView alloc], "initWithFrame:andColor:startDate:endDate:isFreeSpan:", v12, v9, v8, v5, v13, v14, v15, v16);

  return v17;
}

- (double)convertDateIntoOffset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(EKUIAvailabilityViewController *)self event];
  double v6 = [v5 timeZone];
  id v7 = [(EKUIAvailabilityViewController *)self currentStartDate];
  [v6 daylightSavingTimeOffsetForDate:v7];
  unint64_t v9 = (unint64_t)v8;

  double v10 = [(EKUIAvailabilityViewController *)self event];
  double v11 = [v10 timeZone];
  [v11 daylightSavingTimeOffsetForDate:v4];
  unint64_t v13 = (unint64_t)v12;

  double v14 = [(EKUIAvailabilityViewController *)self currentStartDate];
  [v4 timeIntervalSinceDate:v14];
  double v16 = v15;

  [(EKUIAvailabilityViewController *)self timelineWidth];
  double v18 = (v16 + (double)(uint64_t)(v13 - v9)) / 86400.0 * v17;
  if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
  {
    [(EKUIAvailabilityViewController *)self timelineWidth];
    return v19 - v18;
  }
  return v18;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v21 = a3;
  id v4 = [(EKUIAvailabilityViewController *)self scrollView];

  if (v4 == v21)
  {
    BOOL v5 = [(EKUIAvailabilityViewController *)self timelineView];
    [v21 contentOffset];
    objc_msgSend(v5, "setHorizontalScrollOffset:");

    double v6 = [(EKUIAvailabilityViewController *)self participantList];
    [v21 contentOffset];
    [v6 setVerticalScrollOffset:v7];
  }
  id v8 = [(EKUIAvailabilityViewController *)self participantList];

  if (v8 == v21)
  {
    unint64_t v9 = [(EKUIAvailabilityViewController *)self scrollView];
    double v10 = [(EKUIAvailabilityViewController *)self scrollView];
    [v10 contentOffset];
    double v12 = v11;
    [v21 contentOffset];
    [v9 setContentOffset:v12];

    [v21 contentOffset];
    BOOL v14 = v13 == 0.0;
    double v15 = [(EKUIAvailabilityViewController *)self participantDivider];
    [v15 setHidden:v14];
  }
  id v16 = [(EKUIAvailabilityViewController *)self timelineView];

  if (v16 == v21)
  {
    double v17 = [(EKUIAvailabilityViewController *)self scrollView];
    [v21 contentOffset];
    double v19 = v18;
    double v20 = [(EKUIAvailabilityViewController *)self scrollView];
    [v20 contentOffset];
    [v17 setContentOffset:v19];
  }
}

- (id)saveBlock
{
  return objc_getProperty(self, a2, 1064, 1);
}

- (void)setSaveBlock:(id)a3
{
}

- (BOOL)fromDetail
{
  return self->_fromDetail;
}

- (void)setFromDetail:(BOOL)a3
{
  self->_fromDetail = a3;
}

- (BOOL)isAttendeeProposeTime
{
  return self->_isAttendeeProposeTime;
}

- (void)setIsAttendeeProposeTime:(BOOL)a3
{
  self->_isAttendeeProposeTime = a3;
}

- (NSDate)modifiedStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setModifiedStartDate:(id)a3
{
}

- (NSDate)modifiedEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setModifiedEndDate:(id)a3
{
}

- (NSArray)busyParticipants
{
  return (NSArray *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setBusyParticipants:(id)a3
{
}

- (EKEvent)event
{
  return (EKEvent *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setEvent:(id)a3
{
}

- (EKUIAvailabilityParticipantList)participantList
{
  return self->_participantList;
}

- (void)setParticipantList:(id)a3
{
}

- (NSMutableArray)participantAvailabilityViews
{
  return self->_participantAvailabilityViews;
}

- (void)setParticipantAvailabilityViews:(id)a3
{
}

- (NSMutableArray)freeSpanViews
{
  return self->_freeSpanViews;
}

- (void)setFreeSpanViews:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSDate)currentStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setCurrentStartDate:(id)a3
{
}

- (UIView)containerView
{
  return (UIView *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setContainerView:(id)a3
{
}

- (UILabel)unavailableLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setUnavailableLabel:(id)a3
{
}

- (EKUIAvailabilityTitleContainerView)titleContainer
{
  return (EKUIAvailabilityTitleContainerView *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setTitleContainer:(id)a3
{
}

- (UIView)largeDateNavContainer
{
  return (UIView *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setLargeDateNavContainer:(id)a3
{
}

- (UIView)dateNavContainer
{
  return (UIView *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setDateNavContainer:(id)a3
{
}

- (EKUIResizingDateLabel)weekdayLabel
{
  return (EKUIResizingDateLabel *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setWeekdayLabel:(id)a3
{
}

- (EKUIResizingDateLabel)largeWeekdayLabel
{
  return (EKUIResizingDateLabel *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setLargeWeekdayLabel:(id)a3
{
}

- (UIButton)previousButton
{
  return (UIButton *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setPreviousButton:(id)a3
{
}

- (UIButton)nextButton
{
  return (UIButton *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setNextButton:(id)a3
{
}

- (UIView)participantDivider
{
  return (UIView *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setParticipantDivider:(id)a3
{
}

- (UIBarButtonItem)topNextTime
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setTopNextTime:(id)a3
{
}

- (UIBarButtonItem)bottomNextTime
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setBottomNextTime:(id)a3
{
}

- (UIBarButtonItem)topSpacer
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setTopSpacer:(id)a3
{
}

- (UIBarButtonItem)topSpinner
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setTopSpinner:(id)a3
{
}

- (UIBarButtonItem)bottomSpinner
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setBottomSpinner:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setDoneButton:(id)a3
{
}

- (BOOL)searchingForNextAvailableTime
{
  return self->_searchingForNextAvailableTime;
}

- (void)setSearchingForNextAvailableTime:(BOOL)a3
{
  self->_searchingForNextAvailableTime = a3;
}

- (BOOL)fetchingData
{
  return self->_fetchingData;
}

- (void)setFetchingData:(BOOL)a3
{
  self->_fetchingData = a3;
}

- (BOOL)compact
{
  return self->_compact;
}

- (void)setCompact:(BOOL)a3
{
  self->_compact = a3;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setScrollView:(id)a3
{
}

- (EKUIAvailabilityTimelineView)timelineView
{
  return (EKUIAvailabilityTimelineView *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setTimelineView:(id)a3
{
}

- (EKUIAvailabilityFreeSpanView)eventTime
{
  return (EKUIAvailabilityFreeSpanView *)objc_getProperty(self, a2, 1288, 1);
}

- (void)setEventTime:(id)a3
{
}

- (double)availableWidth
{
  return self->_availableWidth;
}

- (void)setAvailableWidth:(double)a3
{
  self->_availableWidth = a3;
}

- (double)pinchStartWidth
{
  return self->_pinchStartWidth;
}

- (void)setPinchStartWidth:(double)a3
{
  self->_pinchStartWidth = a3;
}

- (double)pinchStartRatio
{
  return self->_pinchStartRatio;
}

- (void)setPinchStartRatio:(double)a3
{
  self->_pinchStartRatio = a3;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (NSMutableArray)hourLines
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1328, 1);
}

- (void)setHourLines:(id)a3
{
}

- (NSLayoutConstraint)participantWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1336, 1);
}

- (void)setParticipantWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)timelineHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1344, 1);
}

- (void)setTimelineHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)largeNavLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1352, 1);
}

- (void)setLargeNavLeadingConstraint:(id)a3
{
}

- (NSMutableArray)titleConstraints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1360, 1);
}

- (void)setTitleConstraints:(id)a3
{
}

- (NSOperationQueue)availabilityRequestsQueue
{
  return self->_availabilityRequestsQueue;
}

- (void)setAvailabilityRequestsQueue:(id)a3
{
}

- (_UINavigationBarPalette)palette
{
  return (_UINavigationBarPalette *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setPalette:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_availabilityRequestsQueue, 0);
  objc_storeStrong((id *)&self->_titleConstraints, 0);
  objc_storeStrong((id *)&self->_largeNavLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_timelineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_participantWidthConstraint, 0);
  objc_storeStrong((id *)&self->_hourLines, 0);
  objc_storeStrong((id *)&self->_eventTime, 0);
  objc_storeStrong((id *)&self->_timelineView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_bottomSpinner, 0);
  objc_storeStrong((id *)&self->_topSpinner, 0);
  objc_storeStrong((id *)&self->_topSpacer, 0);
  objc_storeStrong((id *)&self->_bottomNextTime, 0);
  objc_storeStrong((id *)&self->_topNextTime, 0);
  objc_storeStrong((id *)&self->_participantDivider, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_previousButton, 0);
  objc_storeStrong((id *)&self->_largeWeekdayLabel, 0);
  objc_storeStrong((id *)&self->_weekdayLabel, 0);
  objc_storeStrong((id *)&self->_dateNavContainer, 0);
  objc_storeStrong((id *)&self->_largeDateNavContainer, 0);
  objc_storeStrong((id *)&self->_titleContainer, 0);
  objc_storeStrong((id *)&self->_unavailableLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_currentStartDate, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_freeSpanViews, 0);
  objc_storeStrong((id *)&self->_participantAvailabilityViews, 0);
  objc_storeStrong((id *)&self->_participantList, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_busyParticipants, 0);
  objc_storeStrong((id *)&self->_modifiedEndDate, 0);
  objc_storeStrong((id *)&self->_modifiedStartDate, 0);

  objc_storeStrong(&self->_saveBlock, 0);
}

@end