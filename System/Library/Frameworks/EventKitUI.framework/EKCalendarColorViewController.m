@interface EKCalendarColorViewController
- (CGSize)preferredContentSize;
- (EKCalendarColorEditItem)editItem;
- (EKCalendarColorViewController)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)resetBackgroundColor;
- (void)setEditItem:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EKCalendarColorViewController

- (EKCalendarColorViewController)init
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)EKCalendarColorViewController;
  v2 = [(EKCalendarColorViewController *)&v11 initWithStyle:2];
  if (v2)
  {
    v3 = EventKitUIBundle();
    v4 = [v3 localizedStringForKey:@"Calendar Color" value:&stru_1F0CC2140 table:0];
    [(EKCalendarColorViewController *)v2 setTitle:v4];

    objc_initWeak(&location, v2);
    v12[0] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__EKCalendarColorViewController_init__block_invoke;
    v8[3] = &unk_1E60874F8;
    objc_copyWeak(&v9, &location);
    id v6 = (id)[(EKCalendarColorViewController *)v2 registerForTraitChanges:v5 withHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __37__EKCalendarColorViewController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetBackgroundColor];
}

- (void)viewDidLoad
{
  [(EKCalendarColorViewController *)self resetBackgroundColor];
  v3.receiver = self;
  v3.super_class = (Class)EKCalendarColorViewController;
  [(EKCalendarColorViewController *)&v3 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarColorViewController;
  [(EKCalendarColorViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarColorViewController;
  [(EKCalendarColorViewController *)&v6 viewWillDisappear:v3];
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  [(EKCalendarColorEditItem *)self->_editItem reset];
  id v4 = [(EKCalendarColorViewController *)self tableView];
  [v4 reloadData];
}

- (void)resetBackgroundColor
{
  BOOL v3 = [(UIViewController *)self isPresentedInsidePopover];
  id v5 = [(EKCalendarColorViewController *)self tableView];
  if (v3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  id v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  [v5 setBackgroundColor:v4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(EKCalendarColorEditItem *)self->_editItem numberOfSubitems];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  editItem = self->_editItem;
  uint64_t v5 = objc_msgSend(a4, "row", a3);

  return [(EKCalendarColorEditItem *)editItem cellForSubitemAtIndex:v5];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [v8 cellForRowAtIndexPath:v6];
  if ([v7 selectionStyle]) {
    [v8 selectRowAtIndexPath:0 animated:1 scrollPosition:0];
  }
  -[EKCalendarColorEditItem calendarEditor:didSelectSubitem:](self->_editItem, "calendarEditor:didSelectSubitem:", 0, [v6 row]);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(EKCalendarColorEditItem *)self->_editItem headerTitle];
}

- (CGSize)preferredContentSize
{
  double v3 = EKUIContainedControllerIdealWidth();
  id v4 = [(EKCalendarColorViewController *)self tableView];
  objc_msgSend(v4, "sizeThatFits:", v3, 1100.0);
  double v6 = v5;

  double v7 = v3;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (EKCalendarColorEditItem)editItem
{
  return self->_editItem;
}

- (void)setEditItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end