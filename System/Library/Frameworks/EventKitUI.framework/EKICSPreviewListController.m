@interface EKICSPreviewListController
- (BOOL)allowsImport;
- (BOOL)allowsSubitems;
- (BOOL)showWeekNumbers;
- (CGColor)overrideCalendarColor;
- (EKICSPreviewListController)initWithModel:(id)a3;
- (EKICSPreviewListDelegate)listDelegate;
- (id)_timeZone;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)buildSections;
- (void)dealloc;
- (void)importAllPressed:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllowsImport:(BOOL)a3;
- (void)setAllowsSubitems:(BOOL)a3;
- (void)setListDelegate:(id)a3;
- (void)setOverrideCalendarColor:(CGColor *)a3;
- (void)setShowWeekNumbers:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateImportButton;
- (void)viewDidLoad;
@end

@implementation EKICSPreviewListController

- (EKICSPreviewListController)initWithModel:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKICSPreviewListController;
  v6 = [(EKICSPreviewListController *)&v14 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    p_model = (id *)&v6->_model;
    objc_storeStrong((id *)&v6->_model, a3);
    [*p_model addObserver:v7 forKeyPath:@"importedEvents" options:0 context:0];
    v9 = NSString;
    v10 = EventKitUIBundle();
    v11 = [v10 localizedStringForKey:@"x_events_ics_title" value:&stru_1F0CC2140 table:0];
    v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, objc_msgSend(*p_model, "totalEventCount"));
    [(EKICSPreviewListController *)v7 setTitle:v12];

    [(EKICSPreviewListController *)v7 setAllowsSubitems:1];
  }

  return v7;
}

- (void)dealloc
{
  [(EKICSPreviewModel *)self->_model removeObserver:self forKeyPath:@"importedEvents"];
  v3.receiver = self;
  v3.super_class = (Class)EKICSPreviewListController;
  [(EKICSPreviewListController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)EKICSPreviewListController;
  [(EKICSPreviewListController *)&v10 viewDidLoad];
  [(EKICSPreviewListController *)self buildSections];
  [(EKICSPreviewListController *)self updateImportButton];
  objc_super v3 = [(EKICSPreviewListController *)self tableView];
  [v3 setSeparatorStyle:0];
  [v3 setAllowsSelection:self->_allowsSubitems];
  uint64_t v4 = objc_opt_class();
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellReuseIdentifier:v6];

  uint64_t v7 = objc_opt_class();
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v3 registerClass:v7 forCellReuseIdentifier:v9];

  [v3 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"PreviewListControllerHeaderReuseIdentifier"];
}

- (void)updateImportButton
{
  if (self->_allowsImport && [(EKICSPreviewModel *)self->_model unimportedEventCount])
  {
    objc_super v3 = [(EKICSPreviewListController *)self navigationItem];
    uint64_t v4 = [v3 rightBarButtonItem];

    if (v4) {
      return;
    }
    id v5 = [(EKICSPreviewModel *)self->_model importedEvents];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = NSString;
      v8 = EventKitUIBundle();
      v9 = [v8 localizedStringForKey:@"Add (%@)" value:&stru_1F0CC2140 table:0];
      [(EKICSPreviewModel *)self->_model unimportedEventCount];
      objc_super v10 = CUIKLocalizedStringForInteger();
      objc_msgSend(v7, "localizedStringWithFormat:", v9, v10);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = EventKitUIBundle();
      id v13 = [v8 localizedStringForKey:@"Add All" value:&stru_1F0CC2140 table:0];
    }

    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v13 style:2 target:self action:sel_importAllPressed_];
    v12 = [(EKICSPreviewListController *)self navigationItem];
    [v12 setRightBarButtonItem:v11];
  }
  else
  {
    id v13 = [(EKICSPreviewListController *)self navigationItem];
    [v13 setRightBarButtonItem:0];
  }
}

- (void)importAllPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
  [WeakRetained icsPreviewListControllerDidRequestImportAll:self];
}

- (void)setOverrideCalendarColor:(CGColor *)a3
{
  if (self->_overrideCalendarColor != a3)
  {
    self->_overrideCalendarColor = a3;
    id v3 = [(EKICSPreviewListController *)self tableView];
    [v3 reloadData];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  [(EKICSPreviewListController *)self buildSections];
  uint64_t v7 = [(EKICSPreviewListController *)self tableView];
  [v7 reloadData];

  [(EKICSPreviewListController *)self updateImportButton];
}

- (id)_timeZone
{
  v2 = [(EKICSPreviewModel *)self->_model eventStore];
  id v3 = [v2 timeZone];

  return v3;
}

- (void)buildSections
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(EKICSPreviewModel *)self->_model allEvents];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 sortUsingComparator:&__block_literal_global_15];
  id v5 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  sections = self->_sections;
  self->_sections = v5;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v13 = [v12 startDate];
        objc_super v14 = [(EKICSPreviewListController *)self _timeZone];
        v15 = [v13 dateForStartOfDayInTimeZone:v14];

        if (v9)
        {
          v16 = [v9 date];
          char v17 = [v15 isEqualToDate:v16];

          if (v17) {
            goto LABEL_11;
          }
          uint64_t v18 = +[EKPreviewSection sectionWithDate:v15];

          v9 = (void *)v18;
        }
        else
        {
          v9 = +[EKPreviewSection sectionWithDate:v15];
        }
        [(NSMutableArray *)self->_sections addObject:v9];
LABEL_11:
        [v9 addEvent:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v8) {
        goto LABEL_15;
      }
    }
  }
  v9 = 0;
LABEL_15:
}

uint64_t __43__EKICSPreviewListController_buildSections__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = [v6 startDate];
  v9 = [v7 startDate];
  uint64_t v10 = [v8 compare:v9];

  if (!v10)
  {
    if ([v6 isAllDay] && !objc_msgSend(v7, "isAllDay"))
    {
      uint64_t v10 = -1;
    }
    else if (([v6 isAllDay] & 1) != 0 || (objc_msgSend(v7, "isAllDay") & 1) == 0)
    {
      v11 = [v6 title];
      v12 = [v7 title];
      uint64_t v10 = [v11 compare:v12 options:1];
    }
    else
    {
      uint64_t v10 = 1;
    }
  }

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSMutableArray *)self->_sections count];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  sections = self->_sections;
  id v7 = a3;
  uint64_t v8 = [(NSMutableArray *)sections objectAtIndex:a4];
  v9 = [v8 date];
  uint64_t v10 = [(EKICSPreviewListController *)self _timeZone];
  uint64_t v14 = 0;
  id v15 = 0;
  v11 = +[EKUIListViewHeader headerWithTableView:v7 reuseIdentifier:@"PreviewListControllerHeaderReuseIdentifier" date:v9 timeZone:v10 currentYearStart:&v15 currentYearEnd:&v14];

  id v12 = v15;

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSMutableArray *)self->_sections objectAtIndex:a4];
  id v5 = [v4 events];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[NSMutableArray objectAtIndex:](self->_sections, "objectAtIndex:", [v7 section]);
  v9 = [v8 events];
  uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));

  overrideCalendarColor = self->_overrideCalendarColor;
  if (overrideCalendarColor)
  {
    id v12 = [v10 calendar];
    [v12 setCGColor:overrideCalendarColor];
  }
  id v13 = [v8 date];
  uint64_t v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v15 = [(EKICSPreviewListController *)self _timeZone];
  [v14 setTimeZone:v15];

  if ([v10 isAllDay])
  {
    v16 = (objc_class *)objc_opt_class();
    char v17 = NSStringFromClass(v16);
    uint64_t v18 = [v6 dequeueReusableCellWithIdentifier:v17 forIndexPath:v7];

    [v18 updateWithEvent:v10 dimmed:0];
  }
  else
  {
    v19 = (objc_class *)objc_opt_class();
    long long v20 = NSStringFromClass(v19);
    uint64_t v18 = [v6 dequeueReusableCellWithIdentifier:v20 forIndexPath:v7];

    long long v21 = [v10 startDate];
    long long v22 = [v10 endDateUnadjustedForLegacyClients];
    uint64_t v23 = objc_msgSend(v14, "cal_isMultidayEventForUIWithStartDate:endDate:", v21, v22);

    [v18 updateWithEvent:v10 isMultiday:v23 occurrenceStartDate:v13 dimmed:0];
  }

  return v18;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  if (self->_allowsSubitems)
  {
    sections = self->_sections;
    id v6 = a4;
    id v7 = -[NSMutableArray objectAtIndex:](sections, "objectAtIndex:", [v6 section]);
    uint64_t v8 = [v7 events];
    uint64_t v9 = [v6 row];

    id v15 = [v8 objectAtIndex:v9];

    if (v15)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
      if (WeakRetained)
      {
        v11 = WeakRetained;
        id v12 = objc_loadWeakRetained((id *)&self->_listDelegate);
        char v13 = objc_opt_respondsToSelector();

        if (v13)
        {
          id v14 = objc_loadWeakRetained((id *)&self->_listDelegate);
          [v14 icsPreviewListController:self didSelectEvent:v15];
        }
      }
    }
  }
}

- (BOOL)allowsImport
{
  return self->_allowsImport;
}

- (void)setAllowsImport:(BOOL)a3
{
  self->_allowsImport = a3;
}

- (BOOL)allowsSubitems
{
  return self->_allowsSubitems;
}

- (void)setAllowsSubitems:(BOOL)a3
{
  self->_allowsSubitems = a3;
}

- (EKICSPreviewListDelegate)listDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);

  return (EKICSPreviewListDelegate *)WeakRetained;
}

- (void)setListDelegate:(id)a3
{
}

- (CGColor)overrideCalendarColor
{
  return self->_overrideCalendarColor;
}

- (BOOL)showWeekNumbers
{
  return self->_showWeekNumbers;
}

- (void)setShowWeekNumbers:(BOOL)a3
{
  self->_showWeekNumbers = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end