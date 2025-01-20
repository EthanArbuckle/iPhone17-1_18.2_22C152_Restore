@interface EKDayPreviewController
- (BOOL)_eventOccursOnThisDay:(id)a3;
- (BOOL)_shouldShowAllVisibleEvents;
- (BOOL)hidesAllDayEvents;
- (BOOL)respectsSelectedCalendarsFilter;
- (CGSize)preferredContentSize;
- (EKDayPreviewController)initWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6;
- (EKDayPreviewController)initWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6 model:(id)a7;
- (EKDayPreviewController)initWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6 model:(id)a7 overriddenDayViewHourScale:(double)a8 overriddenDayViewMinHourRange:(int64_t)a9;
- (UIViewController)hostingViewController;
- (_NSRange)_displayedHoursRange;
- (double)_dayViewHeight;
- (id)_anchorEvent;
- (id)_dateForFirstHourMarker;
- (id)_eventsForStartDate:(id)a3 endDate:(id)a4;
- (id)_hourMaskForEvents:(id)a3;
- (id)_selectedCalendars;
- (id)dayView:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5;
- (int64_t)overriddenParticipantStatus;
- (unint64_t)style;
- (unint64_t)supportedInterfaceOrientations;
- (void)_scrollDayViewToCorrectOffsetAnimated:(BOOL)a3;
- (void)_setNewVisibleHourLabels;
- (void)_setupAutoLayout;
- (void)_setupDayView;
- (void)_updateIvarsWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6;
- (void)loadView;
- (void)reload;
- (void)reloadWithNewDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6;
- (void)setHidesAllDayEvents:(BOOL)a3;
- (void)setHostingViewController:(id)a3;
- (void)setOverriddenParticipantStatus:(int64_t)a3;
- (void)setRespectsSelectedCalendarsFilter:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)toggleExpandedState;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EKDayPreviewController

- (EKDayPreviewController)initWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6 model:(id)a7 overriddenDayViewHourScale:(double)a8 overriddenDayViewMinHourRange:(int64_t)a9
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v29.receiver = self;
  v29.super_class = (Class)EKDayPreviewController;
  v21 = [(EKDayPreviewController *)&v29 init];
  v22 = v21;
  if (v21)
  {
    [(EKDayPreviewController *)v21 _updateIvarsWithDate:v16 event:v17 overriddenEventStartDate:v18 overriddenEventEndDate:v19];
    objc_storeStrong((id *)&v22->_model, a7);
    [(EKDayPreviewController *)v22 setRespectsSelectedCalendarsFilter:1];
    [(EKDayPreviewController *)v22 setStyle:0];
    v22->_overriddenDayViewHourScale = a8;
    v22->_overriddenDayViewMinHourRange = a9;
    objc_initWeak(&location, v22);
    v30[0] = objc_opt_class();
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __156__EKDayPreviewController_initWithDate_event_overriddenEventStartDate_overriddenEventEndDate_model_overriddenDayViewHourScale_overriddenDayViewMinHourRange___block_invoke;
    v26[3] = &unk_1E60874F8;
    objc_copyWeak(&v27, &location);
    id v24 = (id)[(EKDayPreviewController *)v22 registerForTraitChanges:v23 withHandler:v26];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v22;
}

void __156__EKDayPreviewController_initWithDate_event_overriddenEventStartDate_overriddenEventEndDate_model_overriddenDayViewHourScale_overriddenDayViewMinHourRange___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    BOOL v2 = [WeakRetained style] == 2;
    WeakRetained = v7;
    if (!v2)
    {
      v3 = [v7[124] layer];
      id v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
      uint64_t v5 = [v4 CGColor];

      [v3 setBackgroundColor:v5];
      if (![v7 style])
      {
        id v6 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
        objc_msgSend(v3, "setBorderColor:", objc_msgSend(v6, "CGColor"));
      }
      WeakRetained = v7;
    }
  }
}

- (EKDayPreviewController)initWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6 model:(id)a7
{
  return [(EKDayPreviewController *)self initWithDate:a3 event:a4 overriddenEventStartDate:a5 overriddenEventEndDate:a6 model:a7 overriddenDayViewHourScale:-1 overriddenDayViewMinHourRange:0.0];
}

- (EKDayPreviewController)initWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6
{
  return [(EKDayPreviewController *)self initWithDate:a3 event:a4 overriddenEventStartDate:a5 overriddenEventEndDate:a6 model:0];
}

- (void)_updateIvarsWithDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6
{
  id v22 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_storeStrong((id *)&self->_date, a3);
  id v13 = a4;
  v14 = (void *)[v13 copy];

  p_event = &self->_event;
  objc_storeStrong((id *)&self->_event, v14);
  id v16 = [(EKEvent *)self->_event startDate];
  originalEventStartDate = self->_originalEventStartDate;
  self->_originalEventStartDate = v16;

  id v18 = [(EKEvent *)self->_event endDateUnadjustedForLegacyClients];
  originalEventEndDate = self->_originalEventEndDate;
  self->_originalEventEndDate = v18;

  objc_storeStrong((id *)&self->_overriddenEventStartDate, a5);
  p_overriddenEventEndDate = &self->_overriddenEventEndDate;
  objc_storeStrong((id *)&self->_overriddenEventEndDate, a6);
  if (self->_overriddenEventStartDate && *p_overriddenEventEndDate)
  {
    int v21 = -[NSDate CalIsBeforeOrSameAsDate:](self->_overriddenEventStartDate, "CalIsBeforeOrSameAsDate:");
    self->_hasOverriddenEventDates = v21;
    if (v21)
    {
      [(EKEvent *)*p_event overrideStartDate:self->_overriddenEventStartDate];
      [(EKEvent *)*p_event overrideEndDate:*p_overriddenEventEndDate];
    }
  }
  else
  {
    self->_hasOverriddenEventDates = 0;
  }
}

- (void)loadView
{
  v30.receiver = self;
  v30.super_class = (Class)EKDayPreviewController;
  [(EKDayPreviewController *)&v30 loadView];
  if (self->_date)
  {
    v3 = CUIKStringForDateAndDayOfWeekInCalendarTimezone();
    [(EKDayPreviewController *)self setTitle:v3];
  }
  else
  {
    v3 = EventKitUIBundle();
    id v4 = [v3 localizedStringForKey:@"Calendar" value:&stru_1F0CC2140 table:0];
    [(EKDayPreviewController *)self setTitle:v4];
  }
  uint64_t v5 = CUIKCalendar();
  id v6 = [v5 components:30 fromDate:self->_date];

  if (self->_style == 1)
  {
    v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v8 = [v7 traitCollection];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 == 1) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
  id v11 = [EKDayView alloc];
  id v12 = [MEMORY[0x1E4FB1618] clearColor];
  LOBYTE(v29) = 1;
  id v13 = -[EKDayView initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:](v11, "initWithFrame:sizeClass:orientation:displayDate:backgroundColor:opaque:scrollbarShowsInside:isMiniPreviewInEventDetail:rightClickDelegate:", v10, 1, v6, v12, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v29, 0);
  dayView = self->_dayView;
  self->_dayView = v13;

  [(EKDayView *)self->_dayView setTodayScrollSecondBuffer:0.0];
  v15 = self->_dayView;
  id v16 = CUIKCalendar();
  [(EKDayView *)v15 setCalendar:v16];

  [(EKDayView *)self->_dayView setAllowsOccurrenceSelection:0];
  id v17 = self->_dayView;
  id v18 = (void *)CalCopyTimeZone();
  [(EKDayView *)v17 setTimeZone:v18];

  [(EKDayView *)self->_dayView setDataSource:self];
  [(EKDayView *)self->_dayView setShouldEverShowTimeIndicators:0];
  [(EKDayView *)self->_dayView setHourScale:self->_overriddenDayViewHourScale];
  [(EKDayView *)self->_dayView setAnimatesTimeMarker:0];
  [(EKDayView *)self->_dayView setTranslatesAutoresizingMaskIntoConstraints:0];
  if ([(EKDayPreviewController *)self style] == 2)
  {
    id v19 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    id v20 = [(EKDayPreviewController *)self view];
    [v20 setBackgroundColor:v19];

    [(EKDayView *)self->_dayView setOpaque:1];
    int v21 = [(EKDayPreviewController *)self view];
    [v21 addSubview:self->_dayView];
  }
  else
  {
    id v22 = [(EKDayView *)self->_dayView dayContent];
    [v22 setUsesSmallText:1];

    [(EKDayView *)self->_dayView setUserInteractionEnabled:0];
    [(EKDayView *)self->_dayView setScrollAnimationDurationOverride:0.4];
    v23 = [(EKDayView *)self->_dayView dayContent];
    [v23 setOffscreenOccurrencePinningEnabled:0];

    [(EKDayView *)self->_dayView setTopContentInset:16.0];
    [(EKDayView *)self->_dayView setBottomContentInset:28.0];
    [(EKDayView *)self->_dayView setAlignsMidnightToTop:1];
    [(EKDayView *)self->_dayView setAllowsScrolling:[(EKDayPreviewController *)self style] != 0];
    if ([(EKDayPreviewController *)self style] == 1) {
      [(EKDayView *)self->_dayView setEventsFillGrid:1];
    }
    id v24 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    roundedView = self->_roundedView;
    self->_roundedView = v24;

    int v21 = [(UIView *)self->_roundedView layer];
    id v26 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    objc_msgSend(v21, "setBackgroundColor:", objc_msgSend(v26, "CGColor"));

    [v21 setMasksToBounds:1];
    [(UIView *)self->_roundedView setTranslatesAutoresizingMaskIntoConstraints:0];
    if (![(EKDayPreviewController *)self style])
    {
      [v21 setCornerRadius:5.0];
      id v27 = [MEMORY[0x1E4FB1618] separatorColor];
      objc_msgSend(v21, "setBorderColor:", objc_msgSend(v27, "CGColor"));

      [v21 setBorderWidth:1.0 / EKUIScaleFactor()];
    }
    [(UIView *)self->_roundedView addSubview:self->_dayView];
    v28 = [(EKDayPreviewController *)self view];
    [v28 addSubview:self->_roundedView];
  }
}

- (void)viewDidLoad
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)EKDayPreviewController;
  [(EKDayPreviewController *)&v17 viewDidLoad];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(EKDayPreviewController *)self navigationController];
  id v4 = [v3 viewControllers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;

          v7 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  id v12 = [v7 toolbarItems];
  [(EKDayPreviewController *)self setToolbarItems:v12 animated:0];

  [(EKDayPreviewController *)self _setupAutoLayout];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKDayPreviewController;
  [(EKDayPreviewController *)&v6 viewWillAppear:a3];
  if (!self->_event)
  {
    id v4 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_ERROR, "EKDayPreviewController is being shown with a nil event.", v5, 2u);
    }
  }
  [(EKDayPreviewController *)self _setupDayView];
  if (self->_requireScrollPositionCorrection) {
    [(EKDayPreviewController *)self _scrollDayViewToCorrectOffsetAnimated:0];
  }
}

- (void)viewDidLayoutSubviews
{
  [(EKDayPreviewController *)self _setupDayView];

  [(EKDayPreviewController *)self _scrollDayViewToCorrectOffsetAnimated:0];
}

- (void)reloadWithNewDate:(id)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6
{
  [(EKDayPreviewController *)self _updateIvarsWithDate:a3 event:a4 overriddenEventStartDate:a5 overriddenEventEndDate:a6];

  [(EKDayPreviewController *)self reload];
}

- (void)reload
{
  if (self->_date)
  {
    v3 = CUIKStringForDateAndDayOfWeekInCalendarTimezone();
    [(EKDayPreviewController *)self setTitle:v3];
  }
  else
  {
    v3 = EventKitUIBundle();
    id v4 = [v3 localizedStringForKey:@"Calendar" value:&stru_1F0CC2140 table:0];
    [(EKDayPreviewController *)self setTitle:v4];
  }
  uint64_t v5 = CUIKCalendar();
  id v8 = [v5 components:30 fromDate:self->_date];

  [(EKDayView *)self->_dayView setDisplayDate:v8];
  [(EKDayView *)self->_dayView reloadDataSynchronously];
  if ([(EKDayPreviewController *)self style] == 2) {
    [(EKDayView *)self->_dayView bringEventToFront:self->_event];
  }
  objc_super v6 = [(EKDayView *)self->_dayView occurrenceViewForEvent:self->_event];
  [v6 setSelected:1];
  if (self->_hasOverriddenStatus)
  {
    [v6 setTentative:self->_overriddenParticipantStatus == 4];
    [v6 setDeclined:self->_overriddenParticipantStatus == 3];
    objc_msgSend(v6, "setNeedsReply:", objc_msgSend(MEMORY[0x1E4F255B8], "needsResponseForParticipantStatus:", self->_overriddenParticipantStatus));
  }
  [(EKDayPreviewController *)self _setNewVisibleHourLabels];
  v7 = [(EKDayView *)self->_dayView window];

  if (v7) {
    [(EKDayPreviewController *)self _scrollDayViewToCorrectOffsetAnimated:0];
  }
  else {
    self->_requireScrollPositionCorrection = 1;
  }
  [(EKDayView *)self->_dayView setNeedsDisplay];
}

- (void)_setupDayView
{
  if (!self->_firstshow)
  {
    self->_firstshow = 1;
    [(EKDayPreviewController *)self reload];
  }
}

- (void)_setupAutoLayout
{
  v74[4] = *MEMORY[0x1E4F143B8];
  if ([(EKDayPreviewController *)self style] == 2)
  {
    v59 = (void *)MEMORY[0x1E4F28DC8];
    v56 = [(EKDayView *)self->_dayView leadingAnchor];
    v63 = [(EKDayPreviewController *)self view];
    v3 = [v63 safeAreaLayoutGuide];
    v65 = [v3 leadingAnchor];
    v64 = [v56 constraintEqualToAnchor:v65];
    v74[0] = v64;
    v61 = [(EKDayView *)self->_dayView trailingAnchor];
    v62 = [(EKDayPreviewController *)self view];
    v60 = [v62 safeAreaLayoutGuide];
    v58 = [v60 trailingAnchor];
    v57 = [v61 constraintEqualToAnchor:v58];
    v74[1] = v57;
    v54 = [(EKDayView *)self->_dayView topAnchor];
    v55 = [(EKDayPreviewController *)self view];
    id v4 = [v55 safeAreaLayoutGuide];
    uint64_t v5 = [v4 topAnchor];
    objc_super v6 = [v54 constraintEqualToAnchor:v5];
    v74[2] = v6;
    v7 = [(EKDayView *)self->_dayView bottomAnchor];
    id v8 = [(EKDayPreviewController *)self view];
    uint64_t v9 = [v8 safeAreaLayoutGuide];
    uint64_t v10 = [v9 bottomAnchor];
    id v11 = [v7 constraintEqualToAnchor:v10];
    v74[3] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
    [v59 activateConstraints:v12];

    long long v13 = v56;
    long long v14 = v63;
  }
  else
  {
    long long v15 = [(EKDayPreviewController *)self hostingViewController];
    char v16 = objc_opt_respondsToSelector();

    objc_super v17 = [(EKDayPreviewController *)self hostingViewController];
    id v18 = v17;
    if (v16) {
      uint64_t v19 = sel_tableView;
    }
    else {
      uint64_t v19 = sel_view;
    }
    objc_msgSend((id)objc_msgSend(v17, "performSelector:", v19), "layoutMargins");
    double v21 = v20;
    double v23 = v22;

    if (CalInterfaceIsLeftToRight()) {
      double v24 = -4.0;
    }
    else {
      double v24 = 1.0;
    }
    unint64_t v25 = [(EKDayPreviewController *)self style];
    double v26 = 0.0;
    if (v25 == 1) {
      double v27 = 0.0;
    }
    else {
      double v27 = v23;
    }
    if (v25 == 1) {
      double v28 = 0.0;
    }
    else {
      double v28 = 16.0;
    }
    if (v25 == 1) {
      double v29 = 0.0;
    }
    else {
      double v29 = 28.0;
    }
    if (v25 == 1)
    {
      double v24 = 0.0;
      double v30 = -1.0;
    }
    else
    {
      double v30 = 0.0;
    }
    if (v25 == 1) {
      double v31 = 0.0;
    }
    else {
      double v31 = v21;
    }
    unint64_t v32 = [(EKDayPreviewController *)self style];
    if (v32) {
      double v33 = v27;
    }
    else {
      double v33 = 0.0;
    }
    if (v32) {
      double v26 = v31;
    }
    v34 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v35 = NSNumber;
      v36 = v34;
      v37 = [v35 numberWithDouble:v26];
      v38 = [NSNumber numberWithDouble:v33];
      v39 = [(EKDayPreviewController *)self hostingViewController];
      *(_DWORD *)buf = 138412802;
      v69 = v37;
      __int16 v70 = 2112;
      v71 = v38;
      __int16 v72 = 2112;
      v73 = v39;
      _os_log_impl(&dword_1B3F4C000, v36, OS_LOG_TYPE_DEBUG, "left %@ right %@ host %@", buf, 0x20u);
    }
    v40 = _NSDictionaryOfVariableBindings(&cfstr_Roundedview.isa, self->_roundedView, 0);
    v66[0] = @"leftMargin";
    v41 = [NSNumber numberWithDouble:v26];
    v67[0] = v41;
    v66[1] = @"rightMargin";
    v42 = [NSNumber numberWithDouble:v33];
    v67[1] = v42;
    v66[2] = @"topContentInset";
    v43 = [NSNumber numberWithDouble:v28];
    v67[2] = v43;
    v66[3] = @"bottomContentInset";
    v44 = [NSNumber numberWithDouble:v29];
    v67[3] = v44;
    v66[4] = @"leftContentInset";
    v45 = [NSNumber numberWithDouble:v24];
    v67[4] = v45;
    v66[5] = @"rightContentInset";
    v46 = [NSNumber numberWithDouble:v30];
    v67[5] = v46;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:6];

    v47 = (void *)MEMORY[0x1E4F28DC8];
    v48 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(leftMargin)-[_roundedView]-(rightMargin)-|" options:0 metrics:v14 views:v40];
    [v47 activateConstraints:v48];

    v49 = (void *)MEMORY[0x1E4F28DC8];
    v50 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(topContentInset)-[_roundedView]-(bottomContentInset)-|" options:0 metrics:v14 views:v40];
    [v49 activateConstraints:v50];

    long long v13 = _NSDictionaryOfVariableBindings(&cfstr_Dayview.isa, self->_dayView, 0);

    v51 = (void *)MEMORY[0x1E4F28DC8];
    v52 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(leftContentInset)-[_dayView]-(rightContentInset)-|" options:0 metrics:v14 views:v13];
    [v51 activateConstraints:v52];

    v53 = (void *)MEMORY[0x1E4F28DC8];
    v3 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[_dayView]|" options:0 metrics:0 views:v13];
    [v53 activateConstraints:v3];
  }
}

- (void)setOverriddenParticipantStatus:(int64_t)a3
{
  self->_hasOverriddenStatus = 1;
  self->_overriddenParticipantStatus = a3;
}

- (id)dayView:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5
{
  id v7 = a5;
  id v8 = [a4 date];
  uint64_t v9 = [v7 date];

  uint64_t v10 = [(EKDayPreviewController *)self _eventsForStartDate:v8 endDate:v9];

  return v10;
}

- (id)_selectedCalendars
{
  v3 = [(EKEvent *)self->_event calendar];
  id v4 = [v3 source];

  if (([v4 isDelegate] & 1) == 0)
  {

    id v4 = 0;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F254E8]);
  objc_super v6 = [(EKEvent *)self->_event eventStore];
  id v7 = (void *)[v5 initWithEventStore:v6 limitedToSource:v4 visibilityChangedCallback:0 queue:0];

  id v8 = [v7 visibleCalendars];

  return v8;
}

- (id)_eventsForStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v44 = a4;
  v46 = self;
  if ([(EKDayPreviewController *)self respectsSelectedCalendarsFilter])
  {
    v42 = [(EKDayPreviewController *)self _selectedCalendars];
  }
  else
  {
    v42 = 0;
  }
  model = self->_model;
  if (model)
  {
    [(CUIKCalendarModel *)model setPreferredReloadStartDate:v45 endDate:v44];
    id v7 = [(CUIKCalendarModel *)self->_model occurrencesForStartDate:v45 endDate:v44 preSorted:0 waitForLoad:1];
    v43 = [v7 occurrences];
  }
  else
  {
    p_event = &self->_event;
    uint64_t v9 = [(EKEvent *)self->_event eventStore];
    id v7 = [v9 predicateForEventsWithStartDate:v45 endDate:v44 calendars:v42];

    uint64_t v10 = [(EKEvent *)*p_event eventStore];
    v43 = [v10 eventsMatchingPredicate:v7];
  }
  id v11 = (void *)[v43 mutableCopy];
  id v12 = v11;
  long long v13 = v46;
  if (v46->_hasOverriddenEventDates)
  {
    if (v11)
    {
      uint64_t v52 = 0;
      *(void *)&long long v53 = &v52;
      *((void *)&v53 + 1) = 0x3032000000;
      v54 = __Block_byref_object_copy__5;
      v55 = __Block_byref_object_dispose__5;
      id v56 = 0;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __54__EKDayPreviewController__eventsForStartDate_endDate___block_invoke;
      v51[3] = &unk_1E60886C0;
      v51[4] = v46;
      v51[5] = &v52;
      [v11 enumerateObjectsUsingBlock:v51];
      [v12 removeObject:*(void *)(v53 + 40)];
      _Block_object_dispose(&v52, 8);

      long long v13 = v46;
    }
    else
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    if (v13->_event) {
      objc_msgSend(v12, "addObject:");
    }
  }
  [v12 sortUsingSelector:sel_compareStartDateWithEvent_];
  long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  objc_super v17 = [(EKEvent *)v46->_event eventStore];
  [v17 timeZone];

  [v45 timeIntervalSinceReferenceDate];
  double v19 = v18;
  [v44 timeIntervalSinceReferenceDate];
  double v21 = v20;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v22 = v12;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v48 != v24) {
          objc_enumerationMutation(v22);
        }
        double v26 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        double v27 = [v26 startDate];
        [v27 timeIntervalSinceReferenceDate];
        double v29 = v28;

        if (v29 >= v19)
        {
          if (v29 >= v21) {
            goto LABEL_31;
          }
          char v35 = [v26 isAllDay];
          [v14 addObject:v26];
          v36 = v16;
          if ((v35 & 1) == 0) {
            goto LABEL_28;
          }
        }
        else
        {
          [v26 duration];
          double v31 = v30;
          char v32 = [v26 isAllDay];
          unsigned int v33 = v31;
          if ((v32 & 1) == 0)
          {
            if (v29 + (double)v33 <= v19) {
              continue;
            }
            [v14 addObject:v26];
            v36 = v16;
LABEL_28:
            [v36 addObject:v26];
            continue;
          }
          uint64_t v52 = 0;
          LODWORD(v53) = (v33 + 1) / 0x15180;
          *(void *)((char *)&v53 + 4) = 0;
          HIDWORD(v53) = 0;
          v54 = (uint64_t (*)(uint64_t, uint64_t))0xBFF0000000000000;
          CalAbsoluteTimeAddGregorianUnits();
          if (v34 <= v19) {
            continue;
          }
          [v14 addObject:v26];
        }
        BOOL v37 = [(EKDayPreviewController *)v46 hidesAllDayEvents];
        v36 = v15;
        if (!v37) {
          goto LABEL_28;
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v23);
  }
LABEL_31:

  uint64_t v38 = [v16 copy];
  cachedTimedEvents = v46->_cachedTimedEvents;
  v46->_cachedTimedEvents = (NSArray *)v38;

  v40 = (void *)[objc_alloc(MEMORY[0x1E4F57BE0]) initWithOccurrences:v14 timedOccurrences:v16 allDayOccurrences:v15];

  return v40;
}

void __54__EKDayPreviewController__eventsForStartDate_endDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = [v13 calendarItemIdentifier];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 1064) calendarItemIdentifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [v13 startDate];
    if ([v10 isEqualToDate:*(void *)(*(void *)(a1 + 32) + 1016)])
    {
      id v11 = [v13 endDateUnadjustedForLegacyClients];
      int v12 = [v11 isEqualToDate:*(void *)(*(void *)(a1 + 32) + 1024)];

      if (v12)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        *a4 = 1;
      }
    }
    else
    {
    }
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v2 = [(EKDayPreviewController *)self view];
  BOOL IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v2);

  if (IsCompactInViewHierarchy) {
    return 26;
  }
  else {
    return 30;
  }
}

- (id)_anchorEvent
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5;
  id v11 = __Block_byref_object_dispose__5;
  int v12 = self->_event;
  if ([(EKDayPreviewController *)self style] != 2
    && [(EKDayPreviewController *)self _shouldShowAllVisibleEvents])
  {
    cachedTimedEvents = self->_cachedTimedEvents;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__EKDayPreviewController__anchorEvent__block_invoke;
    v6[3] = &unk_1E60886C0;
    v6[4] = self;
    v6[5] = &v7;
    [(NSArray *)cachedTimedEvents enumerateObjectsUsingBlock:v6];
  }
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __38__EKDayPreviewController__anchorEvent__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v7 = [v12 startCalendarDateIncludingTravelTime];
  [v7 absoluteTime];
  double v9 = v8;
  [*(id *)(*(void *)(a1 + 32) + 1000) dayStart];
  double v11 = v10;

  if (v9 >= v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_setNewVisibleHourLabels
{
  if ([(EKDayPreviewController *)self style])
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0x7FFFFFFFLL;
  }
  else
  {
    uint64_t v3 = [(EKDayPreviewController *)self _displayedHoursRange];
    uint64_t v4 = v5;
  }
  dayView = self->_dayView;

  -[EKDayView setHoursToRender:](dayView, "setHoursToRender:", v3, v4);
}

- (void)_scrollDayViewToCorrectOffsetAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(EKDayPreviewController *)self _anchorEvent];
  if (v5
    && [(EKDayPreviewController *)self _eventOccursOnThisDay:v5]
    && ([v5 isAllDay] & 1) == 0)
  {
    double v8 = [(EKDayPreviewController *)self _dateForFirstHourMarker];
    dayView = self->_dayView;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__EKDayPreviewController__scrollDayViewToCorrectOffsetAnimated___block_invoke;
    v11[3] = &unk_1E6087570;
    v11[4] = self;
    [(EKDayView *)dayView scrollToDate:v8 offset:v3 animated:v11 whenFinished:-16.0];
  }
  else
  {
    objc_super v6 = self->_dayView;
    date = self->_date;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__EKDayPreviewController__scrollDayViewToCorrectOffsetAnimated___block_invoke_2;
    v10[3] = &unk_1E6087570;
    v10[4] = self;
    [(EKDayView *)v6 scrollToDate:date animated:v3 whenFinished:v10];
  }
  self->_requireScrollPositionCorrection = 0;
}

uint64_t __64__EKDayPreviewController__scrollDayViewToCorrectOffsetAnimated___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 978) = 0;
  return result;
}

uint64_t __64__EKDayPreviewController__scrollDayViewToCorrectOffsetAnimated___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 978) = 0;
  return result;
}

- (BOOL)_eventOccursOnThisDay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 startDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  double v8 = [v4 endDateUnadjustedForLegacyClients];

  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  [(EKDayView *)self->_dayView dayStart];
  BOOL result = 0;
  if (v10 >= v11)
  {
    [(EKDayView *)self->_dayView dayEnd];
    if (v7 <= v12) {
      return 1;
    }
  }
  return result;
}

- (id)_dateForFirstHourMarker
{
  if ([(EKDayPreviewController *)self style] == 1) {
    uint64_t v3 = [(EKDayPreviewController *)self _displayedHoursRange];
  }
  else {
    uint64_t v3 = [(EKDayView *)self->_dayView hoursToRender];
  }
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  [(EKDayView *)self->_dayView dayStart];
  uint64_t v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  double v6 = CUIKCalendar();
  double v7 = [v5 dateByAddingHours:v3 inCalendar:v6];

  return v7;
}

- (id)_hourMaskForEvents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 25;
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:25];
  uint64_t v7 = MEMORY[0x1E4F1CC28];
  do
  {
    [v6 addObject:v7];
    --v5;
  }
  while (v5);
  double v8 = (void *)MEMORY[0x1E4F1C9C8];
  [(EKDayView *)self->_dayView dayStart];
  double v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  double v10 = [v9 dateByAddingDays:1 inCalendar:0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__EKDayPreviewController__hourMaskForEvents___block_invoke;
  v17[3] = &unk_1E60886E8;
  id v18 = v9;
  id v19 = v10;
  uint64_t v21 = 25;
  id v11 = v6;
  id v20 = v11;
  id v12 = v10;
  id v13 = v9;
  [v4 enumerateObjectsUsingBlock:v17];
  long long v14 = v20;
  id v15 = v11;

  return v15;
}

void __45__EKDayPreviewController__hourMaskForEvents___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = [v16 startDateIncludingTravel];
  id v4 = [v3 dateByAddingHours:-1 inCalendar:0];

  uint64_t v5 = [v4 roundSecondsAndMinutesUpInCalendar:0];
  double v6 = [v16 endDateUnadjustedForLegacyClients];
  uint64_t v7 = [v6 dateByAddingHours:1 inCalendar:0];

  double v8 = [v7 roundSecondsAndMinutesDownInCalendar:0];
  if ([v5 isBeforeDate:*(void *)(a1 + 32)])
  {
    id v9 = *(id *)(a1 + 32);

    uint64_t v5 = v9;
  }
  if ([v8 isAfterDate:*(void *)(a1 + 40)])
  {
    id v10 = *(id *)(a1 + 40);

    double v8 = v10;
  }
  if (*(void *)(a1 + 56))
  {
    unint64_t v11 = 0;
    uint64_t v12 = MEMORY[0x1E4F1CC38];
    do
    {
      id v13 = [*(id *)(a1 + 32) dateByAddingHours:v11 inCalendar:0];
      BOOL v14 = [v5 compare:v13] == -1 || objc_msgSend(v5, "compare:", v13) == 0;
      BOOL v15 = [v8 compare:v13] == 1 || objc_msgSend(v8, "compare:", v13) == 0;
      if (v14 && v15) {
        [*(id *)(a1 + 48) setObject:v12 atIndexedSubscript:v11];
      }

      ++v11;
    }
    while (v11 < *(void *)(a1 + 56));
  }
}

- (_NSRange)_displayedHoursRange
{
  v43[1] = *MEMORY[0x1E4F143B8];
  if ([(EKDayPreviewController *)self _shouldShowAllVisibleEvents])
  {
    uint64_t v3 = self->_cachedTimedEvents;
LABEL_5:
    id v4 = v3;
    goto LABEL_6;
  }
  if (self->_event)
  {
    v43[0] = self->_event;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    goto LABEL_5;
  }
  id v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
LABEL_6:
  uint64_t v5 = [(EKDayPreviewController *)self _hourMaskForEvents:v4];
  double v6 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "Hour Mask: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = -1;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __46__EKDayPreviewController__displayedHoursRange__block_invoke;
  v32[3] = &unk_1E6088710;
  v32[4] = &buf;
  [v5 enumerateObjectsUsingBlock:v32];
  uint64_t v7 = [v5 count];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v8 = objc_msgSend(v5, "reverseObjectEnumerator", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    uint64_t v11 = -1;
LABEL_10:
    uint64_t v12 = 0;
    uint64_t v13 = v7 - 1;
    v7 -= v9;
    while (1)
    {
      if (*(void *)v29 != v10) {
        objc_enumerationMutation(v8);
      }
      if (v11 != -1) {
        break;
      }
      if ([*(id *)(*((void *)&v28 + 1) + 8 * v12) BOOLValue]) {
        uint64_t v11 = v13;
      }
      else {
        uint64_t v11 = -1;
      }
      ++v12;
      --v13;
      if (v9 == v12)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v39 count:16];
        if (v9) {
          goto LABEL_10;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v11 = -1;
  }

  uint64_t v14 = *(void *)(*((void *)&buf + 1) + 24);
  unint64_t overriddenDayViewMinHourRange = self->_overriddenDayViewMinHourRange;
  BOOL v16 = [(EKDayPreviewController *)self _shouldShowAllVisibleEvents];
  unint64_t v17 = v11 - v14 + 1;
  if (overriddenDayViewMinHourRange <= v17) {
    unint64_t v18 = v11 - v14 + 1;
  }
  else {
    unint64_t v18 = overriddenDayViewMinHourRange;
  }
  if (v18 <= 1) {
    unint64_t v18 = 1;
  }
  uint64_t v19 = 4;
  if (v18 < 4) {
    uint64_t v19 = v18;
  }
  if (v16) {
    NSUInteger v20 = v18;
  }
  else {
    NSUInteger v20 = v19;
  }
  uint64_t v21 = (id)kEKUILogHandle;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    id v22 = [NSNumber numberWithInteger:*(void *)(*((void *)&buf + 1) + 24)];
    uint64_t v23 = [NSNumber numberWithUnsignedInteger:v17];
    uint64_t v24 = [NSNumber numberWithUnsignedInteger:v20];
    *(_DWORD *)unsigned int v33 = 138412802;
    double v34 = v22;
    __int16 v35 = 2112;
    v36 = v23;
    __int16 v37 = 2112;
    uint64_t v38 = v24;
    _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_DEBUG, "rangeStart %@ length %@ cappedHours %@", v33, 0x20u);
  }
  NSUInteger v25 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);

  NSUInteger v26 = v25;
  NSUInteger v27 = v20;
  result.length = v27;
  result.id location = v26;
  return result;
}

uint64_t __46__EKDayPreviewController__displayedHoursRange__block_invoke(uint64_t result, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) == -1)
  {
    uint64_t v5 = result;
    _NSRange result = [a2 BOOLValue];
    if (result) {
      *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = a3;
    }
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

- (double)_dayViewHeight
{
  [(EKDayPreviewController *)self _displayedHoursRange];
  double v4 = (double)(unint64_t)(v3 - 1);
  [(EKDayView *)self->_dayView scaledHourHeight];

  +[EKDayTimeView defaultHeightForNumHours:scaledHourHeight:](EKDayTimeView, "defaultHeightForNumHours:scaledHourHeight:", (uint64_t)v4);
  return result;
}

- (CGSize)preferredContentSize
{
  uint64_t v3 = [(EKDayPreviewController *)self view];
  objc_msgSend(v3, "sizeThatFits:", 2147483650.0, 2147483650.0);
  double v5 = v4;

  [(EKDayPreviewController *)self _dayViewHeight];
  double v7 = v6 + 44.0;
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (BOOL)_shouldShowAllVisibleEvents
{
  return self->_userHasTappedToExpand || [(EKDayPreviewController *)self style] == 2;
}

- (void)toggleExpandedState
{
  if (!self->_isAnimating)
  {
    self->_userHasTappedToExpand ^= 1u;
    self->_isAnimating = 1;
    uint64_t v3 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_DEBUG, "User tapped to expand", buf, 2u);
    }
    double v4 = [(EKDayPreviewController *)self view];
    [v4 setNeedsLayout];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__EKDayPreviewController_toggleExpandedState__block_invoke;
    block[3] = &unk_1E6087570;
    block[4] = self;
    double v5 = MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], block);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__EKDayPreviewController_toggleExpandedState__block_invoke_2;
    v6[3] = &unk_1E6087570;
    v6[4] = self;
    dispatch_async(v5, v6);
  }
}

uint64_t __45__EKDayPreviewController_toggleExpandedState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setNewVisibleHourLabels];
  BOOL v2 = *(void **)(a1 + 32);

  return [v2 _scrollDayViewToCorrectOffsetAnimated:1];
}

void __45__EKDayPreviewController_toggleExpandedState__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1000) dayContent];
  v1 = [v2 layer];
  recursiveAnimationRemove(v1);
}

- (int64_t)overriddenParticipantStatus
{
  return self->_overriddenParticipantStatus;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (UIViewController)hostingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setHostingViewController:(id)a3
{
}

- (BOOL)hidesAllDayEvents
{
  return self->_hidesAllDayEvents;
}

- (void)setHidesAllDayEvents:(BOOL)a3
{
  self->_hidesAllDayEvents = a3;
}

- (BOOL)respectsSelectedCalendarsFilter
{
  return self->_respectsSelectedCalendarsFilter;
}

- (void)setRespectsSelectedCalendarsFilter:(BOOL)a3
{
  self->_respectsSelectedCalendarsFilter = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostingViewController);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_overriddenEventEndDate, 0);
  objc_storeStrong((id *)&self->_overriddenEventStartDate, 0);
  objc_storeStrong((id *)&self->_originalEventEndDate, 0);
  objc_storeStrong((id *)&self->_originalEventStartDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dayView, 0);
  objc_storeStrong((id *)&self->_roundedView, 0);

  objc_storeStrong((id *)&self->_cachedTimedEvents, 0);
}

@end