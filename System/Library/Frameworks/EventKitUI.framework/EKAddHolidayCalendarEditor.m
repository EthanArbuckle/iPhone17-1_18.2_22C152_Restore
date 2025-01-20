@interface EKAddHolidayCalendarEditor
- (BOOL)_alreadySubscribedToCalendar:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CGSize)calculatePreferredContentSize;
- (EKAddHolidayCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)editItems;
- (id)rightButton;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_beginLoadingHolidayCalendars;
- (void)_displayCalendarListScreen;
- (void)_displayErrorScreen;
- (void)_displayLoadingScreen;
- (void)_holidayCalendarsLoadCompletedWithCalendarData:(id)a3;
- (void)_populatedAlreadySubscribedCalendarURLs;
- (void)calendarEditor:(id)a3 didCompleteWithAction:(int)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation EKAddHolidayCalendarEditor

- (EKAddHolidayCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6
{
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)EKAddHolidayCalendarEditor;
  v12 = [(EKAbstractCalendarEditor *)&v16 initWithCalendar:a3 eventStore:a4 entityType:a5 limitedToSource:v11];
  if (v12)
  {
    v13 = EventKitUIBundle();
    v14 = [v13 localizedStringForKey:@"Add Holiday Calendar - calendar list" value:@"Add Holiday Calendar" table:0];
    [(EKAddHolidayCalendarEditor *)v12 setTitle:v14];

    objc_storeStrong((id *)&v12->_limitedToSource, a6);
    v12->_entityType = a5;
  }

  return v12;
}

- (id)editItems
{
  return 0;
}

- (id)rightButton
{
  return 0;
}

- (void)_beginLoadingHolidayCalendars
{
  [(EKAddHolidayCalendarEditor *)self _populatedAlreadySubscribedCalendarURLs];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__EKAddHolidayCalendarEditor__beginLoadingHolidayCalendars__block_invoke;
  v3[3] = &unk_1E608ACA0;
  v3[4] = self;
  [MEMORY[0x1E4F57C38] fetchAvailableHolidayCalendarsWithCompletion:v3 queue:MEMORY[0x1E4F14428]];
}

uint64_t __59__EKAddHolidayCalendarEditor__beginLoadingHolidayCalendars__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _holidayCalendarsLoadCompletedWithCalendarData:a2];
}

- (void)_holidayCalendarsLoadCompletedWithCalendarData:(id)a3
{
  v5 = (NSArray *)a3;
  objc_storeStrong((id *)&self->_calendarData, a3);
  filteredCalendarData = self->_filteredCalendarData;
  self->_filteredCalendarData = v5;
  v7 = v5;

  NSUInteger v8 = [(NSArray *)self->_calendarData count];
  if (v8)
  {
    v9 = [(EKAddHolidayCalendarEditor *)self tableView];
    [v9 reloadData];

    [(EKAddHolidayCalendarEditor *)self _displayCalendarListScreen];
  }
  else
  {
    [(EKAddHolidayCalendarEditor *)self _holidayCalendarsLoadFailed];
  }
}

- (void)_populatedAlreadySubscribedCalendarURLs
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(EKAbstractCalendarEditor *)self eventStore];
  v4 = [v3 calendarsForEntityType:self->_entityType];

  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  v19 = (NSSet *)objc_claimAutoreleasedReturnValue();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (self->_limitedToSource)
        {
          id v11 = [*(id *)(*((void *)&v20 + 1) + 8 * i) source];
          int v12 = [v11 isEqual:self->_limitedToSource];

          if (!v12) {
            continue;
          }
          if (self->_limitedToSource) {
            goto LABEL_18;
          }
        }
        v13 = [v10 source];
        char v14 = [v13 isDelegate];

        if ((v14 & 1) == 0)
        {
LABEL_18:
          if ([v10 isSubscribed])
          {
            v15 = [v10 subcalURL];
            uint64_t v16 = [v15 length];

            if (v16)
            {
              v17 = [v10 subcalURL];
              [(NSSet *)v19 addObject:v17];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  alreadySubscribedCalendarURLStrings = self->_alreadySubscribedCalendarURLStrings;
  self->_alreadySubscribedCalendarURLStrings = v19;
}

- (void)_displayLoadingScreen
{
  v3 = [(UIView *)self->_standbyScreen superview];

  if (!v3)
  {
    v4 = [(EKAddHolidayCalendarEditor *)self view];
    [v4 addSubview:self->_standbyScreen];

    standbyScreen = self->_standbyScreen;
    uint64_t v6 = [(EKAddHolidayCalendarEditor *)self view];
    [v6 bounds];
    -[UIView setFrame:](standbyScreen, "setFrame:");
  }
  [(UILabel *)self->_standbyMessageLabel setHidden:1];
  [(UIActivityIndicatorView *)self->_spinner setHidden:0];
  spinner = self->_spinner;

  [(UIActivityIndicatorView *)spinner startAnimating];
}

- (void)_displayErrorScreen
{
  v3 = [(UIView *)self->_standbyScreen superview];

  if (!v3)
  {
    v4 = [(EKAddHolidayCalendarEditor *)self view];
    [v4 addSubview:self->_standbyScreen];

    standbyScreen = self->_standbyScreen;
    uint64_t v6 = [(EKAddHolidayCalendarEditor *)self view];
    [v6 bounds];
    -[UIView setFrame:](standbyScreen, "setFrame:");
  }
  uint64_t v7 = EventKitUIBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"Unable to load available holiday calendars" value:&stru_1F0CC2140 table:0];
  [(UILabel *)self->_standbyMessageLabel setText:v8];

  [(UILabel *)self->_standbyMessageLabel sizeToFit];
  [(UILabel *)self->_standbyMessageLabel setHidden:0];
  [(UIActivityIndicatorView *)self->_spinner setHidden:1];
  spinner = self->_spinner;

  [(UIActivityIndicatorView *)spinner stopAnimating];
}

- (void)_displayCalendarListScreen
{
  [(UIActivityIndicatorView *)self->_spinner setHidden:1];
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  [(UIView *)self->_standbyScreen removeFromSuperview];

  [(EKAbstractCalendarEditor *)self updatePreferredContentSize];
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)EKAddHolidayCalendarEditor;
  [(EKAbstractCalendarEditor *)&v33 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v4 = [(EKAddHolidayCalendarEditor *)self view];
  [v4 bounds];
  id v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  standbyScreen = self->_standbyScreen;
  self->_standbyScreen = v5;

  uint64_t v7 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [(UIView *)self->_standbyScreen setBackgroundColor:v7];

  [(UIView *)self->_standbyScreen setAutoresizingMask:18];
  uint64_t v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  standbyMessageLabel = self->_standbyMessageLabel;
  self->_standbyMessageLabel = v8;

  v10 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_standbyMessageLabel setTextColor:v10];

  [(UILabel *)self->_standbyMessageLabel setTextAlignment:1];
  [(UILabel *)self->_standbyMessageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_standbyMessageLabel setNumberOfLines:0];
  [(UILabel *)self->_standbyMessageLabel setHidden:1];
  [(UIView *)self->_standbyScreen addSubview:self->_standbyMessageLabel];
  id v11 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
  spinner = self->_spinner;
  self->_spinner = v11;

  v13 = [MEMORY[0x1E4FB1618] labelColor];
  [(UIActivityIndicatorView *)self->_spinner setColor:v13];

  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  [(UIView *)self->_standbyScreen addSubview:self->_spinner];
  char v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_standbyMessageLabel attribute:9 relatedBy:0 toItem:self->_standbyScreen attribute:9 multiplier:1.0 constant:0.0];
  [v14 addObject:v15];

  uint64_t v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_standbyMessageLabel attribute:11 relatedBy:0 toItem:self->_standbyScreen attribute:10 multiplier:1.0 constant:0.0];
  [v14 addObject:v16];

  v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_standbyMessageLabel attribute:5 relatedBy:1 toItem:self->_standbyScreen attribute:17 multiplier:1.0 constant:0.0];
  [v14 addObject:v17];

  v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_standbyMessageLabel attribute:6 relatedBy:-1 toItem:self->_standbyScreen attribute:18 multiplier:1.0 constant:0.0];
  [v14 addObject:v18];

  v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_spinner attribute:9 relatedBy:0 toItem:self->_standbyScreen attribute:9 multiplier:1.0 constant:0.0];
  [v14 addObject:v19];

  long long v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_spinner attribute:4 relatedBy:0 toItem:self->_standbyScreen attribute:10 multiplier:1.0 constant:0.0];
  [v14 addObject:v20];

  [MEMORY[0x1E4F28DC8] activateConstraints:v14];
  long long v21 = [(EKAddHolidayCalendarEditor *)self tableView];
  [v21 registerClass:objc_opt_class() forCellReuseIdentifier:@"_HolidayCalendarCellReuseIdentifier"];

  double v22 = *MEMORY[0x1E4FB2F28];
  long long v23 = [(EKAddHolidayCalendarEditor *)self tableView];
  [v23 setEstimatedRowHeight:v22];

  v24 = [(EKAddHolidayCalendarEditor *)self tableView];
  [v24 setRowHeight:v22];

  [(EKAddHolidayCalendarEditor *)self _displayLoadingScreen];
  [(EKAddHolidayCalendarEditor *)self _beginLoadingHolidayCalendars];
  uint64_t v25 = (UISearchController *)objc_alloc_init(MEMORY[0x1E4FB1BF8]);
  searchController = self->_searchController;
  self->_searchController = v25;

  [(UISearchController *)self->_searchController setSearchResultsUpdater:self];
  v27 = [(UISearchController *)self->_searchController searchBar];
  [v27 sizeToFit];

  v28 = [(UISearchController *)self->_searchController searchBar];
  v29 = [v28 searchField];
  [v29 setAccessibilityIdentifier:@"holiday-calendar-search-field"];

  v30 = self->_searchController;
  v31 = [(EKAddHolidayCalendarEditor *)self navigationItem];
  [v31 setSearchController:v30];

  v32 = [(EKAddHolidayCalendarEditor *)self navigationItem];
  [v32 setHidesSearchBarWhenScrolling:0];
}

- (CGSize)calculatePreferredContentSize
{
  v5.receiver = self;
  v5.super_class = (Class)EKAddHolidayCalendarEditor;
  [(EKAbstractCalendarEditor *)&v5 calculatePreferredContentSize];
  double v4 = fmax(v3, 400.0);
  result.height = v4;
  result.width = v2;
  return result;
}

- (BOOL)_alreadySubscribedToCalendar:(id)a3
{
  alreadySubscribedCalendarURLStrings = self->_alreadySubscribedCalendarURLStrings;
  double v4 = [a3 URL];
  objc_super v5 = [v4 absoluteString];
  LOBYTE(alreadySubscribedCalendarURLStrings) = [(NSSet *)alreadySubscribedCalendarURLStrings containsObject:v5];

  return (char)alreadySubscribedCalendarURLStrings;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_calendarData count] != 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_filteredCalendarData count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  filteredCalendarData = self->_filteredCalendarData;
  id v7 = a4;
  id v8 = a3;
  v9 = -[NSArray objectAtIndex:](filteredCalendarData, "objectAtIndex:", [v7 row]);
  v10 = [v8 dequeueReusableCellWithIdentifier:@"_HolidayCalendarCellReuseIdentifier" forIndexPath:v7];

  id v11 = [MEMORY[0x1E4FB1618] labelColor];
  int v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  if ([(EKAddHolidayCalendarEditor *)self _alreadySubscribedToCalendar:v9])
  {
    [v10 setAccessoryType:3];
    uint64_t v13 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];

    uint64_t v14 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];

    id v11 = (void *)v13;
    int v12 = (void *)v14;
  }
  else
  {
    [v10 setAccessoryType:0];
  }
  v15 = NSString;
  uint64_t v16 = [v9 localizedDescription];
  v17 = [v15 stringWithFormat:@"holiday-calendar-cell:%@", v16];
  [v10 setAccessibilityIdentifier:v17];

  v18 = [v9 localizedDescription];
  v19 = [v10 textLabel];
  [v19 setText:v18];

  long long v20 = [v10 textLabel];
  [v20 setTextColor:v11];

  long long v21 = [v10 textLabel];
  [v21 setNumberOfLines:0];

  double v22 = NSString;
  long long v23 = [v9 localizedDescription];
  v24 = [v22 stringWithFormat:@"holiday-calendar:%@", v23];
  uint64_t v25 = [v10 textLabel];
  [v25 setAccessibilityIdentifier:v24];

  v26 = [v9 descriptionInLocaleLanguage];
  v27 = [v10 detailTextLabel];
  [v27 setText:v26];

  v28 = [v10 detailTextLabel];
  [v28 setTextColor:v12];

  v29 = [v10 detailTextLabel];
  [v29 setNumberOfLines:0];

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  double v4 = self;
  objc_super v5 = -[NSArray objectAtIndex:](self->_filteredCalendarData, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  LOBYTE(v4) = ![(EKAddHolidayCalendarEditor *)v4 _alreadySubscribedToCalendar:v5];

  return (char)v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NSArray objectAtIndex:](self->_filteredCalendarData, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  id obj = (id)objc_claimAutoreleasedReturnValue();
  if (!-[EKAddHolidayCalendarEditor _alreadySubscribedToCalendar:](self, "_alreadySubscribedToCalendar:"))
  {
    objc_storeStrong((id *)&self->_selectedCalendarDatum, obj);
    objc_super v5 = [(EKAddHolidayCalendarEditor *)self navigationItem];
    uint64_t v6 = [v5 rightBarButtonItem];
    [v6 setEnabled:1];

    id v7 = [EKSubscribedCalendarEditor alloc];
    id v8 = [(EKAbstractCalendarEditor *)self eventStore];
    v9 = [(EKSubscribedCalendarEditor *)v7 initWithCalendar:0 eventStore:v8 entityType:self->_entityType limitedToSource:self->_limitedToSource];

    subscriptionEditor = self->_subscriptionEditor;
    self->_subscriptionEditor = v9;
    id v11 = v9;

    int v12 = [obj URL];
    [(EKSubscribedCalendarEditor *)v11 setPrefillURL:v12];

    [(EKAbstractCalendarEditor *)v11 setDelegate:self];
    uint64_t v13 = EventKitUIBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"Holidays (%@)" value:&stru_1F0CC2140 table:0];

    v15 = NSString;
    uint64_t v16 = [MEMORY[0x1E4F1CA20] currentLocale];
    v17 = [obj locale];
    v18 = [v17 countryCode];
    v19 = [v16 localizedStringForCountryCode:v18];
    long long v20 = objc_msgSend(v15, "stringWithFormat:", v14, v19);

    [(EKSubscribedCalendarEditor *)v11 setHolidayCalendarModeWithTitle:v20];
    long long v21 = [(EKAddHolidayCalendarEditor *)self navigationController];
    [v21 pushViewController:v11 animated:1];

    double v22 = EventKitUIBundle();
    long long v23 = [v22 localizedStringForKey:@"Add Holiday Calendar - calendar preview" value:@"Add Holiday Calendar" table:0];
    [(EKSubscribedCalendarEditor *)v11 setTitle:v23];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v4 = [a3 cellForRowAtIndexPath:a4];
  [v4 setHighlighted:0];
}

- (void)calendarEditor:(id)a3 didCompleteWithAction:(int)a4
{
  v17[4] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (EKSubscribedCalendarEditor *)a3;
  if (self->_subscriptionEditor == v6)
  {
    if (a4)
    {
      if ((a4 & 0xFFFFFFFD) == 1)
      {
        v16[0] = @"url";
        id v7 = [(CUIKSubscribedHolidayCalendar *)self->_selectedCalendarDatum URL];
        id v8 = [v7 absoluteString];
        v17[0] = v8;
        v16[1] = @"locale";
        v9 = [(CUIKSubscribedHolidayCalendar *)self->_selectedCalendarDatum locale];
        v10 = [v9 localeIdentifier];
        v17[1] = v10;
        v16[2] = @"languageCode";
        id v11 = [(CUIKSubscribedHolidayCalendar *)self->_selectedCalendarDatum languageCode];
        v17[2] = v11;
        v16[3] = @"countryCode";
        int v12 = [(CUIKSubscribedHolidayCalendar *)self->_selectedCalendarDatum countryCode];
        v17[3] = v12;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
        CalAnalyticsSendEvent();

        [(EKAbstractCalendarEditor *)self done:0];
      }
    }
    else
    {
      uint64_t v14 = [(EKAddHolidayCalendarEditor *)self navigationController];
      id v15 = (id)[v14 popViewControllerAnimated:1];
    }
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 searchBar];
  objc_super v5 = [v4 text];

  if ([v5 length])
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_calendarData, "count"));
    uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = self->_calendarData;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "localizedDescription", (void)v17);
          int v14 = [v13 localizedStandardContainsString:v5];

          if (v14) {
            [(NSArray *)v6 addObject:v12];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    filteredCalendarData = self->_filteredCalendarData;
    self->_filteredCalendarData = v6;
  }
  else
  {
    objc_storeStrong((id *)&self->_filteredCalendarData, self->_calendarData);
  }
  uint64_t v16 = [(EKAddHolidayCalendarEditor *)self tableView];
  [v16 reloadData];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedToSource, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_standbyMessageLabel, 0);
  objc_storeStrong((id *)&self->_standbyScreen, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_subscriptionEditor, 0);
  objc_storeStrong((id *)&self->_selectedCalendarDatum, 0);
  objc_storeStrong((id *)&self->_alreadySubscribedCalendarURLStrings, 0);
  objc_storeStrong((id *)&self->_filteredCalendarData, 0);

  objc_storeStrong((id *)&self->_calendarData, 0);
}

@end