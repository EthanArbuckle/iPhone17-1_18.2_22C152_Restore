@interface HUTimeEventEditorViewController
- (BOOL)_canCommitTriggerBuilder;
- (BOOL)_canContinue;
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFEventTriggerBuilder)triggerBuilder;
- (HFItem)selectedDateOptionItem;
- (HFTimeEventBuilder)timeEvent;
- (HUEventUIFlow)flow;
- (HUGridLayoutOptions)layoutOptions;
- (HUTimeEventEditorViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4;
- (HUTimeEventEditorViewController)initWithTimeEvent:(id)a3 triggerBuilder:(id)a4;
- (NSArray)selectedRecurrences;
- (NSDateComponents)selectedFireTimeComponents;
- (NSDateComponents)selectedSignificantEventOffset;
- (NSString)stepIdentifier;
- (id)_commitTriggerBuilder;
- (id)_instructionsSectionIDs;
- (id)_localizedRecurrenceDescription;
- (id)_selectedSignificantEvent;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (void)_changeFireTime:(id)a3;
- (void)_doneButtonPressed:(id)a3;
- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4;
- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4;
- (void)datePickerCell:(id)a3 didSelectDate:(id)a4;
- (void)dayOfWeekPickerCell:(id)a3 didChangeSelectedRecurrences:(id)a4;
- (void)setFlow:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setSelectedDateOptionItem:(id)a3;
- (void)setSelectedFireTimeComponents:(id)a3;
- (void)setSelectedRecurrences:(id)a3;
- (void)setSelectedSignificantEventOffset:(id)a3;
- (void)setStepIdentifier:(id)a3;
- (void)setTimeEvent:(id)a3;
- (void)setTriggerBuilder:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)timerTriggerOffsetEditor:(id)a3 didFinishWithOffset:(id)a4;
- (void)timerTriggerOffsetEditorDidCancel:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUTimeEventEditorViewController

- (HUTimeEventEditorViewController)initWithTimeEvent:(id)a3 triggerBuilder:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[HUTimeEventEditorItemManager alloc] initWithTimeEvent:v8 triggerBuilder:v7 delegate:self];

  v21.receiver = self;
  v21.super_class = (Class)HUTimeEventEditorViewController;
  v10 = [(HUItemTableViewController *)&v21 initWithItemManager:v9 tableViewStyle:1];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_triggerBuilder, a4);
    v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v13 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorTitle", @"HUTimerTriggerEditorTitle", 1);
    [(HUTimeEventEditorViewController *)v11 setTitle:v13];

    v14 = _HULocalizedStringWithDefaultValue(@"HUBackButtonTitle", @"HUBackButtonTitle", 1);
    v15 = [(HUTimeEventEditorViewController *)v11 navigationItem];
    [v15 setBackButtonTitle:v14];

    v16 = [MEMORY[0x1E4F1C9C8] date];
    v17 = [v12 dateByAddingUnit:32 value:1 toDate:v16 options:0];

    v18 = [v12 components:96 fromDate:v17];
    v19 = [(HUItemTableViewController *)v11 itemManager];
    [v19 setDefaultFireTimeComponents:v18];
  }
  return v11;
}

- (HUTimeEventEditorViewController)initWithFlow:(id)a3 stepIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 eventBuilderItem];
  v9 = [v8 timeEventBuilder];
  v10 = [v6 triggerBuilder];
  v11 = [(HUTimeEventEditorViewController *)self initWithTimeEvent:v9 triggerBuilder:v10];

  if (v11)
  {
    [(HUTimeEventEditorViewController *)v11 setFlow:v6];
    [(HUTimeEventEditorViewController *)v11 setStepIdentifier:v7];
    v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v13 = [(HUTimeEventEditorViewController *)v11 flow];
    v14 = [v13 originalEventBuilderItem];

    if (!v14)
    {
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      v21[3] = 1;
      v15 = (void *)MEMORY[0x1E4F1C978];
      v16 = [v12 weekdaySymbols];
      uint64_t v17 = [v16 count];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __63__HUTimeEventEditorViewController_initWithFlow_stepIdentifier___block_invoke;
      v20[3] = &unk_1E6384DC8;
      v20[4] = v21;
      v18 = objc_msgSend(v15, "na_arrayByRepeatingWithCount:generatorBlock:", v17, v20);
      [(HUTimeEventEditorViewController *)v11 setSelectedRecurrences:v18];

      _Block_object_dispose(v21, 8);
    }
  }
  return v11;
}

id __63__HUTimeEventEditorViewController_initWithFlow_stepIdentifier___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v2 setWeekday:(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))++];

  return v2;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)HUTimeEventEditorViewController;
  [(HUItemTableViewController *)&v31 viewDidLoad];
  v3 = [(HUTimeEventEditorViewController *)self flow];
  v4 = [(HUTimeEventEditorViewController *)self stepIdentifier];
  int v5 = [v3 shouldShowDoneButtonForStep:v4];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v7 = _HULocalizedStringWithDefaultValue(@"HUDoneTitle", @"HUDoneTitle", 1);
    id v8 = sel__doneButtonPressed_;
  }
  else
  {
    v9 = [(HUTimeEventEditorViewController *)self flow];
    v10 = [(HUTimeEventEditorViewController *)self stepIdentifier];
    int v11 = [v9 shouldShowNextButtonForStep:v10];

    if (!v11) {
      goto LABEL_6;
    }
    id v6 = objc_alloc(MEMORY[0x1E4F427C0]);
    id v7 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorNextButton", @"HUTimerTriggerEditorNextButton", 1);
    id v8 = sel__nextButtonPressed_;
  }
  v12 = (void *)[v6 initWithTitle:v7 style:2 target:self action:v8];
  v13 = [(HUTimeEventEditorViewController *)self navigationItem];
  [v13 setRightBarButtonItem:v12];

LABEL_6:
  v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v15 = [(HUItemTableViewController *)self itemManager];
  v16 = [v15 timeOptionItem];

  uint64_t v17 = [(HUTimeEventEditorViewController *)self timeEvent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v19 = [(HUTimeEventEditorViewController *)self timeEvent];
  v20 = v19;
  if (isKindOfClass)
  {
    objc_super v21 = [v19 fireTimeComponents];

    if (v21)
    {
      v22 = [v20 fireTimeComponents];
      v23 = [(HUItemTableViewController *)self itemManager];
      [v23 setDefaultFireTimeComponents:v22];
LABEL_21:

      goto LABEL_22;
    }
    v27 = [v20 fireDate];

    if (!v27)
    {
LABEL_22:

      goto LABEL_23;
    }
    v22 = [v20 fireDate];
    v23 = [v14 components:96 fromDate:v22];
    v28 = [(HUItemTableViewController *)self itemManager];
    [v28 setDefaultFireTimeComponents:v23];
LABEL_20:

    goto LABEL_21;
  }
  objc_opt_class();
  char v24 = objc_opt_isKindOfClass();

  if (v24)
  {
    v20 = [(HUTimeEventEditorViewController *)self timeEvent];
    v22 = [v20 significantEvent];
    if ([v22 isEqualToString:*MEMORY[0x1E4F2DF70]])
    {
      v25 = [(HUItemTableViewController *)self itemManager];
      uint64_t v26 = [v25 sunriseOptionItem];
    }
    else
    {
      if (![v22 isEqualToString:*MEMORY[0x1E4F2DF78]]) {
        goto LABEL_17;
      }
      v25 = [(HUItemTableViewController *)self itemManager];
      uint64_t v26 = [v25 sunsetOptionItem];
    }
    v29 = (void *)v26;

    v16 = v29;
LABEL_17:
    v23 = [(HUItemTableViewController *)self itemManager];
    v28 = [v20 significantEventOffset];
    if (v28)
    {
      [v23 setDefaultOffset:v28 forSignificantEvent:v22];
    }
    else
    {
      v30 = objc_opt_new();
      [v23 setDefaultOffset:v30 forSignificantEvent:v22];
    }
    goto LABEL_20;
  }
LABEL_23:
  [(HUTimeEventEditorViewController *)self setSelectedDateOptionItem:v16];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUTimeEventEditorViewController;
  [(HUItemTableViewController *)&v8 viewWillAppear:a3];
  if ([MEMORY[0x1E4F69758] useMacIdiom])
  {
    v4 = [(HUTimeEventEditorViewController *)self view];
    [v4 frame];
    id v7 = +[HUGridLimitedWidthViewLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLimitedWidthViewLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", 1, &unk_1F19B4028, v5, v6);
    [(HUTimeEventEditorViewController *)self setLayoutOptions:v7];
  }
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)HUTimeEventEditorViewController;
  [(HUItemTableViewController *)&v15 viewDidLayoutSubviews];
  v3 = [(HUTimeEventEditorViewController *)self navigationController];
  v4 = [v3 navigationBar];
  [v4 frame];
  double v6 = v5;

  id v7 = [(HUTimeEventEditorViewController *)self tableView];
  [v7 contentInset];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [(HUTimeEventEditorViewController *)self tableView];
  objc_msgSend(v14, "setContentInset:", v6, v9, v11, v13);
}

- (void)setSelectedDateOptionItem:(id)a3
{
  p_selectedDateOptionItem = &self->_selectedDateOptionItem;
  id v45 = a3;
  if (([v45 isEqual:*p_selectedDateOptionItem] & 1) == 0)
  {
    double v6 = *p_selectedDateOptionItem;
    objc_storeStrong((id *)&self->_selectedDateOptionItem, a3);
    if (v6)
    {
      id v7 = [(HUItemTableViewController *)self itemManager];
      double v8 = [v7 indexPathForItem:v6];

      if (v8)
      {
        double v9 = [(HUTimeEventEditorViewController *)self tableView];
        double v10 = [v9 cellForRowAtIndexPath:v8];

        [(HUTimeEventEditorViewController *)self updateCell:v10 forItem:v6 indexPath:v8 animated:1];
      }
      double v11 = [(HUItemTableViewController *)self itemManager];
      double v12 = [v11 timeOptionItem];

      if (v6 == v12)
      {
        double v13 = [(HUItemTableViewController *)self itemManager];
        [v13 setDatePickerShown:0];
      }
    }
    if (!*p_selectedDateOptionItem)
    {
      v27 = [(HUTimeEventEditorViewController *)self triggerBuilder];
      v28 = [(HUTimeEventEditorViewController *)self timeEvent];
      [v27 removeEventBuilder:v28];

      [(HUTimeEventEditorViewController *)self setTimeEvent:0];
LABEL_24:

      goto LABEL_25;
    }
    v14 = [(HUItemTableViewController *)self itemManager];
    objc_super v15 = [v14 indexPathForItem:*p_selectedDateOptionItem];

    if (v15)
    {
      v16 = [(HUTimeEventEditorViewController *)self tableView];
      uint64_t v17 = [v16 cellForRowAtIndexPath:v15];

      if (v17) {
        [(HUTimeEventEditorViewController *)self updateCell:v17 forItem:*p_selectedDateOptionItem indexPath:v15 animated:1];
      }
    }
    v18 = *p_selectedDateOptionItem;
    v19 = [(HUItemTableViewController *)self itemManager];
    v20 = [v19 timeOptionItem];
    LODWORD(v18) = [(HFItem *)v18 isEqual:v20];

    if (v18)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F68F40]);
      v22 = [(HUItemTableViewController *)self itemManager];
      v23 = [v22 defaultFireTimeComponents];
      [v21 setFireTimeComponents:v23];

      char v24 = [(HUTimeEventEditorViewController *)self triggerBuilder];
      v25 = [(HUTimeEventEditorViewController *)self timeEvent];
      [v24 removeEventBuilder:v25];

      uint64_t v26 = [(HUTimeEventEditorViewController *)self triggerBuilder];
      [v26 addEventBuilder:v21];

      [(HUTimeEventEditorViewController *)self setTimeEvent:v21];
    }
    else
    {
      v29 = *p_selectedDateOptionItem;
      v30 = [(HUItemTableViewController *)self itemManager];
      objc_super v31 = [v30 sunriseOptionItem];
      if ([(HFItem *)v29 isEqual:v31])
      {
      }
      else
      {
        v32 = *p_selectedDateOptionItem;
        v33 = [(HUItemTableViewController *)self itemManager];
        v34 = [v33 sunsetOptionItem];
        LODWORD(v32) = [(HFItem *)v32 isEqual:v34];

        if (!v32)
        {
          NSLog(&cfstr_UnhandledOptio.isa, *p_selectedDateOptionItem);
          goto LABEL_21;
        }
      }
      id v21 = [(HUTimeEventEditorViewController *)self _selectedSignificantEvent];
      v35 = [(HUItemTableViewController *)self itemManager];
      v36 = [v35 defaultOffsetForSignificantEvent:v21];

      id v37 = objc_alloc_init(MEMORY[0x1E4F69578]);
      [v37 setSignificantEvent:v21];
      [v37 setSignificantEventOffset:v36];
      v38 = [(HUTimeEventEditorViewController *)self triggerBuilder];
      v39 = [(HUTimeEventEditorViewController *)self timeEvent];
      [v38 removeEventBuilder:v39];

      v40 = [(HUTimeEventEditorViewController *)self triggerBuilder];
      [v40 addEventBuilder:v37];

      [(HUTimeEventEditorViewController *)self setTimeEvent:v37];
    }

LABEL_21:
    v41 = *p_selectedDateOptionItem;
    v42 = [(HUItemTableViewController *)self itemManager];
    v43 = [v42 timeOptionItem];

    if (v41 == v43)
    {
      v44 = [(HUItemTableViewController *)self itemManager];
      [v44 setDatePickerShown:1];
    }
    goto LABEL_24;
  }
LABEL_25:
}

- (NSDateComponents)selectedSignificantEventOffset
{
  objc_opt_class();
  v3 = [(HUTimeEventEditorViewController *)self timeEvent];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  double v6 = [v5 significantEventOffset];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  double v8 = v7;

  return (NSDateComponents *)v8;
}

- (void)setSelectedSignificantEventOffset:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  v4 = [(HUTimeEventEditorViewController *)self timeEvent];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    [v6 setSignificantEventOffset:v8];
    id v7 = [(HUItemTableViewController *)self itemManager];
    [v7 updateForSignificantEventOffsetChange];
  }
}

- (NSDateComponents)selectedFireTimeComponents
{
  objc_opt_class();
  v3 = [(HUTimeEventEditorViewController *)self timeEvent];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 fireTimeComponents];

  return (NSDateComponents *)v6;
}

- (void)setSelectedFireTimeComponents:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  v4 = [(HUTimeEventEditorViewController *)self timeEvent];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    [v6 setFireTimeComponents:v7];
  }
}

- (NSArray)selectedRecurrences
{
  id v2 = [(HUTimeEventEditorViewController *)self triggerBuilder];
  v3 = [v2 recurrences];

  return (NSArray *)v3;
}

- (void)setSelectedRecurrences:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTimeEventEditorViewController *)self triggerBuilder];
  [v5 setRecurrences:v4];
}

- (void)setLayoutOptions:(id)a3
{
  id v16 = a3;
  if ([MEMORY[0x1E4F69758] useMacIdiom])
  {
    id v5 = [(HUTimeEventEditorViewController *)self layoutOptions];
    char v6 = [v16 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_layoutOptions, a3);
      [v16 sectionTopMargin];
      double v8 = v7;
      [v16 sectionLeadingMargin];
      double v10 = v9;
      [v16 sectionBottomMargin];
      double v12 = v11;
      [v16 sectionTrailingMargin];
      double v14 = v13;
      objc_super v15 = [(HUTimeEventEditorViewController *)self tableView];
      objc_msgSend(v15, "_setSectionContentInset:", v8, v10, v12, v14);
    }
  }
}

- (void)_doneButtonPressed:(id)a3
{
  id v4 = [(HUTimeEventEditorViewController *)self timeEvent];
  id v5 = [(HUTimeEventEditorViewController *)self flow];
  char v6 = [v5 eventBuilderItem];
  [v6 setTimeEventBuilder:v4];

  id v8 = [(HUTimeEventEditorViewController *)self flow];
  double v7 = [(HUTimeEventEditorViewController *)self stepIdentifier];
  [v8 viewController:self didFinishStepWithIdentifier:v7];
}

- (void)_changeFireTime:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v10;
    id v5 = [v4 calendar];
    char v6 = [v4 date];

    double v7 = [v5 components:96 fromDate:v6];
    [(HUTimeEventEditorViewController *)self setSelectedFireTimeComponents:v7];

    id v8 = [(HUTimeEventEditorViewController *)self selectedFireTimeComponents];
    double v9 = [(HUItemTableViewController *)self itemManager];
    [v9 setDefaultFireTimeComponents:v8];
  }
}

- (void)datePickerCell:(id)a3 didSelectDate:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  double v7 = [v5 currentCalendar];
  id v8 = [v7 components:96 fromDate:v6];

  [(HUTimeEventEditorViewController *)self setSelectedFireTimeComponents:v8];
  id v10 = [(HUTimeEventEditorViewController *)self selectedFireTimeComponents];
  double v9 = [(HUItemTableViewController *)self itemManager];
  [v9 setDefaultFireTimeComponents:v10];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  id v6 = [(HUItemTableViewController *)self itemManager];
  double v7 = [v6 dateOptionsItems];
  char v8 = [v7 containsObject:v5];

  if (v8) {
    goto LABEL_6;
  }
  double v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 datePickerItem];

  if (v10 == v5
    || ([(HUItemTableViewController *)self itemManager],
        double v11 = objc_claimAutoreleasedReturnValue(),
        [v11 recurrencesItem],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v12 == v5))
  {
LABEL_6:
    double v13 = objc_opt_class();
  }
  else
  {
    double v13 = 0;
  }
  double v14 = v13;

  return v14;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v6 = v10;
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
    id v8 = v7;

    [v8 setDelegate:self];
    [v8 setHideTitleLabel:1];
    double v9 = +[HUIconCellContentMetrics defaultMetrics];
    [v9 iconSize];
    objc_msgSend(v8, "setLeftMargin:");
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  uint64_t v6 = a6;
  v43[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = [(HUItemTableViewController *)self itemManager];
  double v14 = [v13 dateOptionsItems];
  int v15 = [v14 containsObject:v11];

  if (v15)
  {
    uint64_t v16 = objc_opt_class();
    id v17 = v10;
    if (v17)
    {
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      v19 = v17;
      if (v18) {
        goto LABEL_9;
      }
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v22 = id v21 = v12;
      [v20 handleFailureInFunction:v22, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v16, objc_opt_class() file lineNumber description];

      id v12 = v21;
    }
    v19 = 0;
LABEL_9:

    v23 = [v11 latestResults];
    char v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [v19 setTitleText:v24];

    v25 = [(HUTimeEventEditorViewController *)self selectedDateOptionItem];
    LODWORD(v24) = [v11 isEqual:v25];

    if (v24)
    {
      id v40 = v12;
      unsigned int v41 = v6;
      [v19 setChecked:1];
      uint64_t v26 = [(HUItemTableViewController *)self itemManager];
      v27 = [v26 sunriseOptionItem];
      v43[0] = v27;
      v28 = [(HUItemTableViewController *)self itemManager];
      v29 = [v28 sunsetOptionItem];
      v43[1] = v29;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
      int v31 = [v30 containsObject:v11];

      if (v31) {
        uint64_t v32 = 4;
      }
      else {
        uint64_t v32 = 0;
      }
      [v19 setAccessoryType:v32];
      uint64_t v6 = v41;
      id v12 = v40;
    }
    else
    {
      [v19 setChecked:0];
      [v19 setAccessoryType:0];
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v10;
    [v33 setDelegate:self];
    v34 = (void *)MEMORY[0x1E4F1CAD0];
    v19 = [(HUTimeEventEditorViewController *)self selectedRecurrences];
    v35 = [v34 setWithArray:v19];
    [v33 setSelectedRecurrences:v35];

LABEL_22:
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v36 = v10;
    if (objc_opt_isKindOfClass()) {
      id v37 = v36;
    }
    else {
      id v37 = 0;
    }
    id v38 = v37;

    v39 = [(HUTimeEventEditorViewController *)self selectedFireTimeComponents];
    [v38 setTimeComponents:v39];
  }
LABEL_23:
  v42.receiver = self;
  v42.super_class = (Class)HUTimeEventEditorViewController;
  [(HUItemTableViewController *)&v42 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  id v5 = [(HUTimeEventEditorViewController *)self _instructionsSectionIDs];
  uint64_t v6 = [(HUItemTableViewController *)self itemManager];
  double v7 = [v6 displayedSectionIdentifierForSectionIndex:a3];
  char v8 = [v5 containsObject:v7];

  return v8;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  id v5 = [(HUTimeEventEditorViewController *)self _instructionsSectionIDs];
  uint64_t v6 = [(HUItemTableViewController *)self itemManager];
  double v7 = [v6 displayedSectionIdentifierForSectionIndex:a3];
  char v8 = [v5 containsObject:v7];

  return v8;
}

- (id)_instructionsSectionIDs
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HUTimeEventEditorSectionIdentifierInstructions";
  v4[1] = @"HUTimeEventEditorSectionIdentifierRepeatInstructions";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HUItemTableViewController *)self itemManager];
  double v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUItemTableViewController *)self moduleControllerForItem:v9];

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)HUTimeEventEditorViewController;
    unsigned __int8 v11 = [(HUItemTableViewController *)&v15 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }
  else
  {
    id v12 = [(HUItemTableViewController *)self itemManager];
    double v13 = [v12 dateOptionsItems];
    unsigned __int8 v11 = [v13 containsObject:v9];
  }
  return v11;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HUTimeEventEditorViewController;
  [(HUItemTableViewController *)&v11 tableView:a3 accessoryButtonTappedForRowWithIndexPath:a4];
  id v5 = [HUTimeEventOffsetEditorViewController alloc];
  id v6 = [(HUTimeEventEditorViewController *)self _selectedSignificantEvent];
  id v7 = [(HUTimeEventEditorViewController *)self selectedSignificantEventOffset];
  char v8 = [(HUTimeEventOffsetEditorViewController *)v5 initWithSignificantEvent:v6 currentOffset:v7 delegate:self];

  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v8];
  [v9 setModalPresentationStyle:2];
  id v10 = [(UIViewController *)self hu_presentPreloadableViewController:v9 animated:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUTimeEventEditorViewController;
  [(HUItemTableViewController *)&v14 tableView:v6 didSelectRowAtIndexPath:v7];
  char v8 = [(HUItemTableViewController *)self itemManager];
  double v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUItemTableViewController *)self moduleControllerForItem:v9];

  if (!v10)
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
    objc_super v11 = [(HUItemTableViewController *)self itemManager];
    id v12 = [v11 dateOptionsItems];
    int v13 = [v12 containsObject:v9];

    if (v13) {
      [(HUTimeEventEditorViewController *)self setSelectedDateOptionItem:v9];
    }
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 displayedSectionIdentifierForSectionIndex:a4];
  int v8 = [v7 isEqualToString:@"HUTimeEventEditorSectionIdentifierRepeat"];

  if (v8)
  {
    double v9 = [(HUTimeEventEditorViewController *)self _localizedRecurrenceDescription];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (void)dayOfWeekPickerCell:(id)a3 didChangeSelectedRecurrences:(id)a4
{
  id v5 = objc_msgSend(a4, "allObjects", a3);
  [(HUTimeEventEditorViewController *)self setSelectedRecurrences:v5];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__HUTimeEventEditorViewController_dayOfWeekPickerCell_didChangeSelectedRecurrences___block_invoke;
  v6[3] = &unk_1E6386018;
  v6[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v6];
}

void __84__HUTimeEventEditorViewController_dayOfWeekPickerCell_didChangeSelectedRecurrences___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 beginUpdates];

  v3 = [*(id *)(a1 + 32) itemManager];
  uint64_t v4 = [v3 sectionIndexForDisplayedSectionIdentifier:@"HUTimeEventEditorSectionIdentifierRepeat"];

  id v5 = [*(id *)(a1 + 32) tableView];
  id v9 = [v5 footerViewForSection:v4];

  id v6 = [*(id *)(a1 + 32) _localizedRecurrenceDescription];
  id v7 = [v9 textLabel];
  [v7 setText:v6];

  [v9 sizeToFit];
  [v9 setClipsToBounds:1];
  int v8 = [*(id *)(a1 + 32) tableView];
  [v8 endUpdates];
}

- (void)timerTriggerOffsetEditor:(id)a3 didFinishWithOffset:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [(HUTimeEventEditorViewController *)self _selectedSignificantEvent];
  [v6 setDefaultOffset:v5 forSignificantEvent:v7];

  [(HUTimeEventEditorViewController *)self setSelectedSignificantEventOffset:v5];

  [(HUTimeEventEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)timerTriggerOffsetEditorDidCancel:(id)a3
{
}

- (id)_localizedRecurrenceDescription
{
  id v2 = (void *)MEMORY[0x1E4F2EB90];
  v3 = [(HUTimeEventEditorViewController *)self selectedRecurrences];
  uint64_t v4 = objc_msgSend(v2, "hf_recurrenceNaturalLanguageStringWithRecurrences:", v3);

  return v4;
}

- (BOOL)_canContinue
{
  return 1;
}

- (BOOL)_canCommitTriggerBuilder
{
  return 1;
}

- (id)_commitTriggerBuilder
{
  v3 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 41);
  id v5 = [v3 futureWithError:v4];

  if ([(HUTimeEventEditorViewController *)self _canCommitTriggerBuilder]
    && [(HUTimeEventEditorViewController *)self _canContinue])
  {
    id v6 = [(HUTimeEventEditorViewController *)self triggerBuilder];
    id v7 = [v6 commitItem];

    id v8 = (id)[v7 addFailureBlock:&__block_literal_global_76];
    id v5 = v7;
  }

  return v5;
}

void __56__HUTimeEventEditorViewController__commitTriggerBuilder__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

- (id)_selectedSignificantEvent
{
  id v3 = [(HUTimeEventEditorViewController *)self selectedDateOptionItem];
  id v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 sunriseOptionItem];
  char v6 = [v3 isEqual:v5];

  if (v6)
  {
    id v7 = (id *)MEMORY[0x1E4F2DF70];
LABEL_5:
    id v12 = *v7;
    goto LABEL_7;
  }
  id v8 = [(HUTimeEventEditorViewController *)self selectedDateOptionItem];
  id v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 sunsetOptionItem];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    id v7 = (id *)MEMORY[0x1E4F2DF78];
    goto LABEL_5;
  }
  id v12 = 0;
LABEL_7:

  return v12;
}

- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4
{
  id v4 = [(UIViewController *)self hu_presentPreloadableViewController:a4 animated:1];
}

- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4
{
}

- (HFTimeEventBuilder)timeEvent
{
  return self->_timeEvent;
}

- (void)setTimeEvent:(id)a3
{
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
}

- (HFItem)selectedDateOptionItem
{
  return self->_selectedDateOptionItem;
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (HUEventUIFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_selectedDateOptionItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_timeEvent, 0);
}

@end