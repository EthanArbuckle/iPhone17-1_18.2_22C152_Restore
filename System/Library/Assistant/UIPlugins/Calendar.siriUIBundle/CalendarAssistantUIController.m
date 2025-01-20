@interface CalendarAssistantUIController
+ (id)openEventStore;
+ (void)closeEventStore;
- (BOOL)_buildEvents;
- (BOOL)_canShowWhileLocked;
- (BOOL)_crossesMultipleDays;
- (BOOL)allDayEventsInSection;
- (BOOL)isDraft;
- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4;
- (CalendarAssistantUIController)initWithAceObject:(id)a3;
- (EKCalendarDate)date;
- (EKEventStore)eventStore;
- (NSMutableArray)events;
- (NSMutableArray)sections;
- (UIGestureRecognizer)eventTapRecognizer;
- (double)desiredHeight;
- (id)_eventFromAceEvent:(id)a3;
- (id)dayView:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5;
- (id)dragItemForIndexPath:(id)a3;
- (id)sashItem;
- (id)selectedEventsForEditMenu;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)hiddenEventCount;
- (void)_buildSections;
- (void)_openEvent:(id)a3;
- (void)dayView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5;
- (void)dealloc;
- (void)loadView;
- (void)setAllDayEventsInSection:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setEventStore:(id)a3;
- (void)setEventTapRecognizer:(id)a3;
- (void)setEvents:(id)a3;
- (void)setHiddenEventCount:(unint64_t)a3;
- (void)setIsDraft:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)tappedSingleEventGesture:(id)a3;
@end

@implementation CalendarAssistantUIController

+ (id)openEventStore
{
  v2 = (void *)qword_12420;
  if (qword_12420)
  {
    int v3 = dword_12428 + 1;
  }
  else
  {
    id v4 = objc_alloc_init((Class)EKEventStore);
    v5 = (void *)qword_12420;
    qword_12420 = (uint64_t)v4;

    v2 = (void *)qword_12420;
    int v3 = 1;
  }
  dword_12428 = v3;

  return v2;
}

+ (void)closeEventStore
{
  v2 = (void *)qword_12420;
  if (qword_12420)
  {
    if (!--dword_12428)
    {
      qword_12420 = 0;
    }
  }
}

- (id)sashItem
{
  NSLog(@"CalendarAssistantUIController: providing sash item.", a2);
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = objc_alloc((Class)SiriUISashItem);
  id v4 = [v2 assistantUILocalizedStringForKey:@"Calendar" value:0 table:0];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = +[UIImage imageNamed:@"CalendarMonth" inBundle:v5 compatibleWithTraitCollection:0];
  id v7 = [v3 initWithTitle:v4 image:v6];

  return v7;
}

- (CalendarAssistantUIController)initWithAceObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9.receiver = self;
    v9.super_class = (Class)CalendarAssistantUIController;
    v5 = [(CalendarAssistantUIController *)&v9 init];
    CUIKInvalidateToday();
    self = v5;
    v6 = self;
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    NSLog(@"CalendarAssistantUIController: passed wrong type of class: %@", v7);
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  +[CalendarAssistantUIController closeEventStore];
  v3.receiver = self;
  v3.super_class = (Class)CalendarAssistantUIController;
  [(CalendarAssistantUIController *)&v3 dealloc];
}

- (BOOL)_buildEvents
{
  v39 = [(CalendarAssistantUIController *)self snippet];
  objc_super v3 = [v39 events];
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  [(CalendarAssistantUIController *)self setEvents:v4];

  v5 = [(CalendarAssistantUIController *)self snippet];
  v6 = [v5 confirmationOptions];
  [(CalendarAssistantUIController *)self setIsDraft:v6 != 0];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v42 = *(void *)v44;
    id v40 = v7;
    uint64_t v41 = _EKEventURLScheme;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v10);
        v12 = [v11 identifier];
        v13 = v12;
        if (!v12
          || ([v12 scheme],
              v14 = objc_claimAutoreleasedReturnValue(),
              id v15 = [v14 compare:v41 options:1],
              v14,
              v15)
          || [(CalendarAssistantUIController *)self isDraft])
        {
          v16 = [(CalendarAssistantUIController *)self delegate];
          v17 = [v11 identifier];
          id v18 = [v16 siriViewController:self domainObjectForIdentifier:v17];

          if (!v18) {
            id v18 = v11;
          }
          v19 = [(CalendarAssistantUIController *)self _eventFromAceEvent:v18];
          v20 = [(CalendarAssistantUIController *)self date];

          if (!v20)
          {
            v21 = [v19 startDate];
            v22 = [(CalendarAssistantUIController *)self eventStore];
            v23 = [v22 timeZone];
            v24 = +[EKCalendarDate calendarDateWithDate:v21 timeZone:v23];
            [(CalendarAssistantUIController *)self setDate:v24];

            id v7 = v40;
          }
          v25 = [(CalendarAssistantUIController *)self events];
          [v25 addObject:v19];
        }
        else
        {
          v26 = [(CalendarAssistantUIController *)self eventStore];
          v27 = [v11 identifier];
          id v18 = [v26 _eventWithURI:v27 checkValid:1];

          if (v18)
          {
            v28 = [(CalendarAssistantUIController *)self date];

            if (!v28)
            {
              v29 = [v18 startDate];
              v30 = [(CalendarAssistantUIController *)self eventStore];
              v31 = [v30 timeZone];
              v32 = +[EKCalendarDate calendarDateWithDate:v29 timeZone:v31];
              [(CalendarAssistantUIController *)self setDate:v32];

              id v7 = v40;
            }
            v33 = [v11 startDate];
            [v18 setStartDate:v33];

            v34 = [v11 endDate];
            [v18 setEndDate:v34];

            v19 = [(CalendarAssistantUIController *)self events];
            [v19 addObject:v18];
          }
          else
          {
            v19 = [v11 identifier];
            NSLog(@"CalendarAssistantUIController: event not found: %@", v19);
          }
        }

        v10 = (char *)v10 + 1;
      }
      while (v9 != v10);
      id v35 = [v7 countByEnumeratingWithState:&v43 objects:v47 count:16];
      id v9 = v35;
    }
    while (v35);
  }

  v36 = [(CalendarAssistantUIController *)self events];
  id v37 = [v36 count];

  if (!v37) {
    NSLog(@"CalendarAssistantUIController: No viable events.");
  }

  return v37 != 0;
}

- (void)_buildSections
{
  objc_super v3 = [(CalendarAssistantUIController *)self events];
  [v3 sortUsingSelector:"compareStartDateWithEvent:"];
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  [(CalendarAssistantUIController *)self setSections:v4];

  int v25 = [v3 count];
  if (v25 >= 26) {
    [(CalendarAssistantUIController *)self setHiddenEventCount:(v25 - 25)];
  }
  [(CalendarAssistantUIController *)self setAllDayEventsInSection:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    id v8 = 0;
    uint64_t v9 = *(void *)v27;
LABEL_5:
    uint64_t v10 = 0;
    int v23 = v7;
    int v22 = v7 + v6;
    while (1)
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
      if (v25 >= 26 && v23 + (int)v10 > 24) {
        break;
      }
      v12 = [*(id *)(*((void *)&v26 + 1) + 8 * v10) startCalendarDate];
      v13 = [v12 date];
      v14 = [(EKEventStore *)self->_eventStore timeZone];
      id v15 = +[EKCalendarDate calendarDateWithDate:v13 timeZone:v14];

      v16 = [v15 calendarDateForDay];
      v17 = [v16 date];

      if (!v8
        || ([v8 date],
            id v18 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v19 = [v17 isEqualToDate:v18],
            v18,
            (v19 & 1) == 0))
      {
        uint64_t v20 = +[CalendarAssistantUISnippetSection sectionWithDate:v17];

        v21 = [(CalendarAssistantUIController *)self sections];
        [v21 addObject:v20];

        id v8 = (void *)v20;
      }
      if ([v11 isAllDay]) {
        [(CalendarAssistantUIController *)self setAllDayEventsInSection:1];
      }
      [v8 addEvent:v11];

      if (v6 == (id)++v10)
      {
        id v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        int v7 = v22;
        if (v6) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (id)_eventFromAceEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 startDate];
  uint64_t v6 = [v4 endDate];
  uint64_t v7 = CalCopyTimeZone();
  if (!v6)
  {
    int v117 = 0;
    uint64_t v116 = 0;
    uint64_t v119 = 0;
    uint64_t v120 = 0;
    [v5 timeIntervalSinceReferenceDate];
    int v118 = 1;
    CalAbsoluteTimeAddGregorianUnits();
    uint64_t v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  id v8 = [(CalendarAssistantUIController *)self eventStore];
  uint64_t v9 = +[EKEvent eventWithEventStore:v8];

  uint64_t v10 = [v4 calendarId];

  if (!v10) {
    goto LABEL_5;
  }
  v11 = [(CalendarAssistantUIController *)self eventStore];
  v12 = [v4 calendarId];
  uint64_t v13 = [v11 calendarWithExternalURI:v12];

  if (!v13)
  {
LABEL_5:
    v14 = [(CalendarAssistantUIController *)self eventStore];
    uint64_t v13 = [v14 defaultCalendarForNewEvents];
  }
  [v9 setCalendar:v13];
  id v15 = [v4 title];
  [v9 setTitle:v15];

  v16 = [v4 location];
  [v9 setLocation:v16];

  v17 = [v4 notes];
  [v9 setNotes:v17];

  [v9 setStartDate:v5];
  [v9 setEndDate:v6];
  v96 = (void *)v7;
  [v9 setTimeZone:v7];
  objc_msgSend(v9, "setAllDay:", objc_msgSend(v4, "allDay"));
  id v18 = [v4 attendees];
  unsigned __int8 v19 = [v9 calendar];
  uint64_t v20 = [v19 source];
  v21 = [v20 constraints];
  unsigned int v22 = [v21 supportsOutgoingInvitations];

  v94 = (void *)v13;
  v95 = (void *)v6;
  if (!v22)
  {
    unsigned int v25 = 1;
    goto LABEL_10;
  }
  int v23 = [v20 constraints];
  unsigned int v24 = [v23 requiresOutgoingInvitationsInDefaultCalendar];

  if (v24)
  {
    unsigned int v25 = [v19 isDefaultSchedulingCalendar] ^ 1;
LABEL_10:
    unsigned int v97 = v25;
    goto LABEL_12;
  }
  unsigned int v97 = 0;
LABEL_12:
  v93 = v19;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v18;
  id v26 = [obj countByEnumeratingWithState:&v105 objects:v115 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v106;
    while (2)
    {
      long long v29 = v5;
      v30 = v20;
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v106 != v28) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        v33 = [v32 data];
        if (v33)
        {

LABEL_24:
          int v37 = 0;
          uint64_t v20 = v30;
          id v5 = v29;
          goto LABEL_25;
        }
        v34 = [v32 object];
        id v35 = [v34 emails];
        id v36 = [v35 count];

        if (v36) {
          goto LABEL_24;
        }
      }
      id v27 = [obj countByEnumeratingWithState:&v105 objects:v115 count:16];
      int v37 = 1;
      uint64_t v20 = v30;
      id v5 = v29;
      if (v27) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v37 = 1;
  }
LABEL_25:

  v92 = v20;
  if (![obj count] || !(v37 | v97))
  {
    long long v46 = [v4 title];
    [v9 setTitle:v46];
    goto LABEL_48;
  }
  id v38 = obj;
  v39 = +[NSMutableArray array];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v40 = v38;
  id v41 = [v40 countByEnumeratingWithState:&v109 objects:&v116 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v110;
    do
    {
      for (j = 0; j != v42; j = (char *)j + 1)
      {
        if (*(void *)v110 != v43) {
          objc_enumerationMutation(v40);
        }
        long long v45 = [*(id *)(*((void *)&v109 + 1) + 8 * (void)j) displayText];
        [v39 addObject:v45];
      }
      id v42 = [v40 countByEnumeratingWithState:&v109 objects:&v116 count:16];
    }
    while (v42);
  }

  long long v46 = (char *)[v39 count];
  v47 = +[NSBundle bundleForClass:objc_opt_class()];
  v48 = v47;
  if (v46)
  {
    v91 = v5;
    if (v46 == (unsigned char *)&dword_0 + 2)
    {
      [v47 assistantUILocalizedStringForKey:@"%@ and %@ (two item format)" value:@"%@ and %@" table:0];
      v49 = v89 = v48;
      v50 = [v39 objectAtIndex:0];
      v51 = [v39 objectAtIndex:1];
      long long v46 = +[NSString localizedStringWithValidatedFormat:v49, @"%@%@", 0, v50, v51 validFormatSpecifiers error];

      v48 = v89;
    }
    else
    {
      if (v46 != (unsigned char *)&dword_0 + 1)
      {
        id v87 = v4;
        v88 = v46 - 1;
        v52 = v47;
        uint64_t v53 = [v47 assistantUILocalizedStringForKey:@"%@, %@ (start format)", @"%@, %@", 0 value table];
        v54 = [v39 objectAtIndex:0];
        v55 = [v39 objectAtIndex:1];
        v86 = (void *)v53;
        v56 = +[NSString localizedStringWithValidatedFormat:v53, @"%@%@", 0, v54, v55 validFormatSpecifiers error];

        if ((unint64_t)(v46 - 1) < 3)
        {
          v61 = v56;
          v58 = v52;
        }
        else
        {
          uint64_t v57 = 3;
          v98 = v46;
          v58 = v52;
          do
          {
            v59 = [v52 assistantUILocalizedStringForKey:@"%@, %@ (middle format)", @"%@, %@", 0 value table];
            v60 = [v39 objectAtIndex:v57 - 1];
            v61 = +[NSString localizedStringWithValidatedFormat:v59, @"%@%@", 0, v56, v60 validFormatSpecifiers error];

            ++v57;
            v56 = v61;
          }
          while (v98 != (char *)v57);
        }
        v90 = v58;
        v62 = [v58 assistantUILocalizedStringForKey:@"%@ and %@ (end format)" value:@"%@ and %@" table:0];
        v63 = [v39 objectAtIndex:v88];
        long long v46 = +[NSString localizedStringWithValidatedFormat:v62, @"%@%@", 0, v61, v63 validFormatSpecifiers error];

        id v4 = v87;
        v48 = v90;
        id v5 = v91;
        goto LABEL_47;
      }
      long long v46 = [v39 objectAtIndex:0];
    }
    id v5 = v91;
  }
LABEL_47:

  v64 = +[NSBundle bundleForClass:objc_opt_class()];
  v65 = [v64 assistantUILocalizedStringForKey:@"%1$@ with %2$@" value:&stru_C528 table:0];

  v66 = [v4 title];
  v67 = +[NSString localizedStringWithValidatedFormat:v65, @"%@%@", 0, v66, v46 validFormatSpecifiers error];
  [v9 setTitle:v67];

LABEL_48:
  memset(v104, 0, sizeof(v104));
  v68 = [v4 recurrences];
  if ([v68 countByEnumeratingWithState:v104 objects:v114 count:16])
  {
    id v69 = **((id **)&v104[0] + 1);
    uint64_t v70 = [v69 frequency] - 2;
    if (v70 < 3) {
      uint64_t v71 = v70 + 1;
    }
    else {
      uint64_t v71 = 0;
    }
    v72 = [v69 endDate];

    if (v72)
    {
      id v73 = objc_alloc((Class)EKRecurrenceEnd);
      v74 = [v69 endDate];
      id v75 = [v73 initWithEndDate:v74];
    }
    else if ((uint64_t)[v69 endCount] < 1)
    {
      id v75 = 0;
    }
    else
    {
      id v75 = objc_msgSend(objc_alloc((Class)EKRecurrenceEnd), "initWithOccurrenceCount:", objc_msgSend(v69, "endCount"));
    }
    id v76 = objc_msgSend(objc_alloc((Class)EKRecurrenceRule), "initRecurrenceWithFrequency:interval:end:", v71, objc_msgSend(v69, "interval"), v75);

    [v9 addRecurrenceRule:v76];
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  v77 = [v4 alerts];
  id v78 = [v77 countByEnumeratingWithState:&v100 objects:v113 count:16];
  if (v78)
  {
    id v79 = v78;
    uint64_t v80 = *(void *)v101;
    do
    {
      for (k = 0; k != v79; k = (char *)k + 1)
      {
        if (*(void *)v101 != v80) {
          objc_enumerationMutation(v77);
        }
        v82 = *(void **)(*((void *)&v100 + 1) + 8 * (void)k);
        id v83 = objc_alloc((Class)EKAlarm);
        [v82 doubleValue];
        id v84 = objc_msgSend(v83, "initWithRelativeOffset:");
        if (v84) {
          [v9 addAlarm:v84];
        }
      }
      id v79 = [v77 countByEnumeratingWithState:&v100 objects:v113 count:16];
    }
    while (v79);
  }

  return v9;
}

- (BOOL)_crossesMultipleDays
{
  v2 = [(CalendarAssistantUIController *)self sections];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)_openEvent:(id)a3
{
  id v5 = [a3 externalURL];
  id v4 = [(CalendarAssistantUIController *)self delegate];
  [v4 siriViewController:self openURL:v5 completion:0];
}

- (double)desiredHeight
{
  v2 = [(CalendarAssistantUIController *)self view];
  [v2 bounds];
  double v4 = v3;

  return v4;
}

- (void)tappedSingleEventGesture:(id)a3
{
  if (![(CalendarAssistantUIController *)self isDraft])
  {
    id v5 = [(CalendarAssistantUIController *)self events];
    double v4 = [v5 firstObject];
    [(CalendarAssistantUIController *)self _openEvent:v4];
  }
}

- (void)loadView
{
  if (([(CalendarAssistantUIController *)self isViewLoaded] & 1) == 0)
  {
    double v3 = +[CalendarAssistantUIController openEventStore];
    [(CalendarAssistantUIController *)self setEventStore:v3];

    if ([(CalendarAssistantUIController *)self _buildEvents])
    {
      [(CalendarAssistantUIController *)self _buildSections];
      id v22 = +[NSBundle bundleForClass:objc_opt_class()];
      -[CalendarAssistantUIController setDefaultViewInsets:](self, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      double v4 = [v22 assistantUILocalizedStringForKey:@"Calendar" value:&stru_C528 table:0];
      [(CalendarAssistantUIController *)self setTitle:v4];

      id v5 = [(CalendarAssistantUIController *)self date];
      uint64_t v6 = [v5 date];
      uint64_t v7 = CUIKLongDayLongMonthStringForDate();

      id v8 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      uint64_t v9 = +[UIColor clearColor];
      [v8 setBackgroundColor:v9];

      [v8 setSeparatorStyle:0];
      [v8 setOpaque:0];
      [v8 setDelegate:self];
      [v8 setDataSource:self];
      [v8 _setMarginWidth:0.0];
      [v8 setShowsHorizontalScrollIndicator:0];
      [v8 setShowsVerticalScrollIndicator:0];
      [v8 setScrollsToTop:0];
      [v8 setScrollEnabled:0];
      [v8 setSectionHeaderTopPadding:0.0];
      uint64_t v10 = +[AFPreferences sharedPreferences];
      unsigned int v11 = [v10 enableDragAndDrop];

      if (v11) {
        [v8 setDragDelegate:self];
      }
      v12 = [(CalendarAssistantUIController *)self delegate];
      [v12 siriViewControllerExpectedWidth:self];
      double v14 = v13;

      [v8 setRowHeight:UITableViewAutomaticDimension];
      +[CalendarAssistantUIHeaderView headerHeight];
      objc_msgSend(v8, "setEstimatedSectionHeaderHeight:");
      [v8 reloadData];
      [v8 layoutIfNeeded];
      [v8 setAutoresizingMask:18];
      [v8 contentSize];
      double v16 = v15;
      objc_msgSend(v8, "setFrame:", 0.0, 0.0, v14, v15);
      double v17 = v16 + 8.0;
      id v18 = [(CalendarAssistantUIController *)self events];
      unsigned __int8 v19 = (char *)[v18 count];

      if (v19 == (unsigned char *)&dword_0 + 1)
      {
        [(CalendarAssistantUIController *)self setSubtitle:v7];
        CalRoundToScreenScale();
        double v17 = v17 - v20;
        [v8 setSeparatorStyle:0];
      }
      id v21 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v14, v17);
      [v21 setAutoresizingMask:18];
      [v21 addSubview:v8];
      [(CalendarAssistantUIController *)self setView:v21];
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dayView:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5
{
}

- (id)selectedEventsForEditMenu
{
  return &__NSArray0__struct;
}

- (id)dayView:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5
{
  uint64_t v6 = +[NSMutableArray array];
  uint64_t v7 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [(CalendarAssistantUIController *)self events];
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v13 isAllDay]) {
          double v14 = v6;
        }
        else {
          double v14 = v7;
        }
        [v14 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v15 = objc_alloc((Class)CUIKOccurrencesCollection);
  double v16 = [(CalendarAssistantUIController *)self events];
  id v17 = [v15 initWithOccurrences:v16 timedOccurrences:v7 allDayOccurrences:v6];

  return v17;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  double v3 = [(CalendarAssistantUIController *)self sections];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(CalendarAssistantUIController *)self sections];
  uint64_t v6 = [v5 objectAtIndex:a4];
  uint64_t v7 = [v6 events];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];

  return v4;
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v5 = -[CalendarAssistantUIController dragItemForIndexPath:](self, "dragItemForIndexPath:", a5, a4);
  id v8 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v8 count:1];

  return v6;
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  uint64_t v6 = -[CalendarAssistantUIController dragItemForIndexPath:](self, "dragItemForIndexPath:", a5, a4, a6.x, a6.y);
  id v9 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return v7;
}

- (id)dragItemForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CalendarAssistantUIController *)self sections];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "section"));
  uint64_t v7 = [v6 events];
  id v8 = [v4 row];

  id v9 = [v7 objectAtIndex:v8];

  id v10 = objc_alloc_init((Class)NSItemProvider);
  uint64_t v11 = [v9 title];
  [v10 setSuggestedName:v11];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_6014;
  v37[3] = &unk_C308;
  id v12 = v9;
  id v38 = v12;
  [v10 registerDataRepresentationForTypeIdentifier:@"com.apple.calendar.ics" visibility:0 loadHandler:v37];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_60AC;
  v35[3] = &unk_C308;
  id v13 = v12;
  id v36 = v13;
  [v10 registerDataRepresentationForTypeIdentifier:@"com.apple.ical.ics" visibility:0 loadHandler:v35];
  uint64_t v14 = kUINSUserActivityInternalType;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_6144;
  v33[3] = &unk_C308;
  id v15 = v13;
  id v34 = v15;
  [v10 registerDataRepresentationForTypeIdentifier:v14 visibility:0 loadHandler:v33];
  double v16 = +[CUIKEventDescriptionGenerator sharedGenerator];
  id v17 = [v16 textRepresentationForEvent:v15 withTextFormat:0 showURI:0];

  id v18 = [UTTypeUTF8PlainText identifier];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_61F8;
  v31[3] = &unk_C308;
  id v19 = v17;
  id v32 = v19;
  [v10 registerDataRepresentationForTypeIdentifier:v18 visibility:0 loadHandler:v31];

  long long v20 = [UTTypeUTF16PlainText identifier];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_6294;
  v29[3] = &unk_C308;
  id v21 = v19;
  id v30 = v21;
  [v10 registerDataRepresentationForTypeIdentifier:v20 visibility:0 loadHandler:v29];

  id v22 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v10];
  uint64_t v23 = [v15 calendar];
  if (v23
    && (unsigned int v24 = (void *)v23,
        [v15 calendar],
        unsigned int v25 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v26 = [v25 isManaged],
        v25,
        v24,
        (v26 & 1) != 0))
  {
    uint64_t v27 = 1;
  }
  else
  {
    uint64_t v27 = 2;
  }
  objc_msgSend(v22, "set_managementState:", v27);

  return v22;
}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  return 1;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v5 = a4;
  uint64_t v6 = +[UIColor siriui_platterTextColor];
  uint64_t v7 = [v5 calTextLabel];
  [v7 setTextColor:v6];

  id v10 = [v5 calTextLabel];
  id v8 = [v10 textColor];
  id v9 = [v5 overlayLabel];

  [v9 setTextColor:v8];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = [(CalendarAssistantUIController *)self sections];
  uint64_t v6 = [v5 objectAtIndex:a4];

  uint64_t v7 = objc_alloc_init(CalendarAssistantUIHeaderView);
  id v8 = [v6 date];
  if (v8)
  {
    id v9 = CUIKStringForDateAndDayOfWeekInCalendarTimezone();
    id v10 = [(CalendarAssistantUIHeaderView *)v7 calTextLabel];
    [v10 setText:v9];

    uint64_t v11 = CUIKGetOverlayCalendar();
    if (v11)
    {
      id v12 = +[CUIKDateStrings monthDayStringForDate:v8 inCalendar:v11];
      id v13 = [(CalendarAssistantUIHeaderView *)v7 overlayLabel];
      [v13 setText:v12];
    }
    else
    {
      id v12 = [(CalendarAssistantUIHeaderView *)v7 overlayLabel];
      [v12 setText:0];
    }
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(CalendarAssistantUIController *)self sections];
  uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "section"));
  id v8 = [v7 events];
  id v9 = [v5 row];

  id v10 = [v8 objectAtIndex:v9];

  if (v10 && [v10 refresh]) {
    [(CalendarAssistantUIController *)self _openEvent:v10];
  }

  _objc_release_x1();
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
  self->_eventStore = (EKEventStore *)a3;
}

- (UIGestureRecognizer)eventTapRecognizer
{
  return self->_eventTapRecognizer;
}

- (void)setEventTapRecognizer:(id)a3
{
}

- (EKCalendarDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

- (void)setIsDraft:(BOOL)a3
{
  self->_isDraft = a3;
}

- (unint64_t)hiddenEventCount
{
  return self->_hiddenEventCount;
}

- (void)setHiddenEventCount:(unint64_t)a3
{
  self->_hiddenEventCount = a3;
}

- (BOOL)allDayEventsInSection
{
  return self->_allDayEventsInSection;
}

- (void)setAllDayEventsInSection:(BOOL)a3
{
  self->_allDayEventsInSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_eventTapRecognizer, 0);
}

@end