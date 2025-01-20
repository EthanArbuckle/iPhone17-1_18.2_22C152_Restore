@interface HUTimerTriggerEditorViewController
- (BOOL)_canCommitTriggerBuilder;
- (BOOL)_canContinue;
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFItem)selectedDateOptionItem;
- (HFTimerTriggerBuilder)timerTriggerBuilder;
- (HUGridLayoutOptions)layoutOptions;
- (HUTimerTriggerEditorViewController)initWithTimerTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5;
- (HUTriggerConditionEditorItemModuleController)conditionModuleController;
- (HUTriggerEditorDelegate)delegate;
- (NSArray)selectedRecurrences;
- (NSDateComponents)selectedFireTimeComponents;
- (NSDateComponents)selectedSignificantEventOffset;
- (id)_commitTriggerBuilder;
- (id)_instructionsSectionIDs;
- (id)_localizedRecurrenceDescription;
- (id)_selectedSignificantEvent;
- (id)itemModuleControllers;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (unint64_t)mode;
- (void)_cancel:(id)a3;
- (void)_changeFireTime:(id)a3;
- (void)_showActionEditor:(id)a3;
- (void)_showSummary:(id)a3;
- (void)conditionEditorModuleController:(id)a3 dismissDetailViewController:(id)a4;
- (void)conditionEditorModuleController:(id)a3 presentDetailViewController:(id)a4;
- (void)datePickerCell:(id)a3 didSelectDate:(id)a4;
- (void)dayOfWeekPickerCell:(id)a3 didChangeSelectedRecurrences:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setSelectedDateOptionItem:(id)a3;
- (void)setSelectedFireTimeComponents:(id)a3;
- (void)setSelectedRecurrences:(id)a3;
- (void)setSelectedSignificantEventOffset:(id)a3;
- (void)setTimerTriggerBuilder:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)timerTriggerOffsetEditor:(id)a3 didFinishWithOffset:(id)a4;
- (void)timerTriggerOffsetEditorDidCancel:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUTimerTriggerEditorViewController

- (HUTimerTriggerEditorViewController)initWithTimerTriggerBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [[HUTimerTriggerEditorItemManager alloc] initWithTimerTriggerBuilder:v8 delegate:self];
  v50.receiver = self;
  v50.super_class = (Class)HUTimerTriggerEditorViewController;
  v11 = [(HUItemTableViewController *)&v50 initWithItemManager:v10 tableViewStyle:1];
  if (v11)
  {
    v12 = [HUTriggerConditionEditorItemModuleController alloc];
    v13 = [(HUTimerTriggerEditorItemManager *)v10 conditionModule];
    uint64_t v14 = [(HUTriggerConditionEditorItemModuleController *)v12 initWithModule:v13 delegate:v11];
    conditionModuleController = v11->_conditionModuleController;
    v11->_conditionModuleController = (HUTriggerConditionEditorItemModuleController *)v14;

    [(HUTimerTriggerEditorViewController *)v11 setTimerTriggerBuilder:v8];
    [(HUTimerTriggerEditorViewController *)v11 setMode:a4];
    [(HUTimerTriggerEditorViewController *)v11 setDelegate:v9];
    v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    if (!a4
      || ([v8 recurrences], v17 = objc_claimAutoreleasedReturnValue(), v17, !v17))
    {
      v18 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hf_dailyWeekdayIntervalComponentsWithCalendar:", v16);
      [(HUTimerTriggerEditorViewController *)v11 setSelectedRecurrences:v18];
    }
    v19 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorTitle", @"HUTimerTriggerEditorTitle", 1);
    [(HUTimerTriggerEditorViewController *)v11 setTitle:v19];

    v20 = _HULocalizedStringWithDefaultValue(@"HUBackButtonTitle", @"HUBackButtonTitle", 1);
    v21 = [(HUTimerTriggerEditorViewController *)v11 navigationItem];
    [v21 setBackButtonTitle:v20];

    v22 = [MEMORY[0x1E4F1C9C8] date];
    v23 = [v16 dateByAddingUnit:32 value:1 toDate:v22 options:0];

    v24 = [v16 components:96 fromDate:v23];
    v25 = [(HUItemTableViewController *)v11 itemManager];
    [v25 setDefaultFireTimeComponents:v24];

    if (!a4)
    {
      v26 = [v8 triggerActionSets];
      int v27 = [v26 hasActions];
      v28 = &selRef__showSummary_;
      if (!v27) {
        v28 = &selRef__showActionEditor_;
      }
      v29 = *v28;

      id v30 = objc_alloc(MEMORY[0x1E4F427C0]);
      v31 = _HULocalizedStringWithDefaultValue(@"HUTimerTriggerEditorNextButton", @"HUTimerTriggerEditorNextButton", 1);
      v32 = (void *)[v30 initWithTitle:v31 style:2 target:v11 action:v29];
      v33 = [(HUTimerTriggerEditorViewController *)v11 navigationItem];
      [v33 setRightBarButtonItem:v32];
    }
    v34 = [(HUTimerTriggerEditorItemManager *)v10 timeOptionItem];
    v35 = [(HUTimerTriggerEditorViewController *)v11 timerTriggerBuilder];
    v36 = [v35 eventBuilder];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v37 = v36;
      v38 = [v37 fireTimeComponents];

      if (v38)
      {
        id v49 = v9;
        v39 = [v37 fireTimeComponents];
        v40 = [(HUItemTableViewController *)v11 itemManager];
        [v40 setDefaultFireTimeComponents:v39];
LABEL_24:

        id v9 = v49;
        goto LABEL_25;
      }
      v43 = [v37 fireDate];

      if (!v43)
      {
LABEL_25:

        goto LABEL_26;
      }
      id v49 = v9;
      v39 = [v37 fireDate];
      v40 = [v16 components:96 fromDate:v39];
      v44 = [(HUItemTableViewController *)v11 itemManager];
      [v44 setDefaultFireTimeComponents:v40];
LABEL_23:

      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_26:
      [(HUTimerTriggerEditorViewController *)v11 setSelectedDateOptionItem:v34];

      goto LABEL_27;
    }
    id v41 = v36;
    v39 = [v41 significantEvent];
    id v49 = v9;
    if ([v39 isEqualToString:*MEMORY[0x1E4F2DF70]])
    {
      uint64_t v42 = [(HUTimerTriggerEditorItemManager *)v10 sunriseOptionItem];
    }
    else
    {
      if (![v39 isEqualToString:*MEMORY[0x1E4F2DF78]]) {
        goto LABEL_20;
      }
      uint64_t v42 = [(HUTimerTriggerEditorItemManager *)v10 sunsetOptionItem];
    }
    v45 = (void *)v42;

    v34 = v45;
LABEL_20:
    v40 = [(HUItemTableViewController *)v11 itemManager];
    v44 = [v41 significantEventOffset];
    if (v44)
    {
      [v40 setDefaultOffset:v44 forSignificantEvent:v39];
    }
    else
    {
      v48 = v23;
      v46 = objc_opt_new();
      [v40 setDefaultOffset:v46 forSignificantEvent:v39];

      v23 = v48;
    }
    goto LABEL_23;
  }
LABEL_27:

  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUTimerTriggerEditorViewController;
  [(HUItemTableViewController *)&v8 viewWillAppear:a3];
  if ([MEMORY[0x1E4F69758] useMacIdiom])
  {
    v4 = [(HUTimerTriggerEditorViewController *)self view];
    [v4 frame];
    v7 = +[HUGridLimitedWidthViewLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLimitedWidthViewLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", 1, &unk_1F19B4160, v5, v6);
    [(HUTimerTriggerEditorViewController *)self setLayoutOptions:v7];
  }
}

- (void)setSelectedDateOptionItem:(id)a3
{
  p_selectedDateOptionItem = &self->_selectedDateOptionItem;
  id v39 = a3;
  if (([v39 isEqual:*p_selectedDateOptionItem] & 1) == 0)
  {
    double v6 = *p_selectedDateOptionItem;
    objc_storeStrong((id *)&self->_selectedDateOptionItem, a3);
    if (v6)
    {
      v7 = [(HUItemTableViewController *)self itemManager];
      objc_super v8 = [v7 indexPathForItem:v6];

      if (v8)
      {
        id v9 = [(HUTimerTriggerEditorViewController *)self tableView];
        v10 = [v9 cellForRowAtIndexPath:v8];

        [(HUTimerTriggerEditorViewController *)self updateCell:v10 forItem:v6 indexPath:v8 animated:1];
      }
      v11 = [(HUItemTableViewController *)self itemManager];
      v12 = [v11 timeOptionItem];

      if (v6 == v12)
      {
        v13 = [(HUItemTableViewController *)self itemManager];
        [v13 setDatePickerShown:0];
      }
    }
    if (!*p_selectedDateOptionItem)
    {
      v15 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
      [v15 setEventBuilder:0];
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v14 = [(HUItemTableViewController *)self itemManager];
    v15 = [v14 indexPathForItem:*p_selectedDateOptionItem];

    if (v15)
    {
      v16 = [(HUTimerTriggerEditorViewController *)self tableView];
      v17 = [v16 cellForRowAtIndexPath:v15];

      [(HUTimerTriggerEditorViewController *)self updateCell:v17 forItem:*p_selectedDateOptionItem indexPath:v15 animated:1];
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

      v24 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
      [v24 setEventBuilder:v21];
    }
    else
    {
      v25 = *p_selectedDateOptionItem;
      v26 = [(HUItemTableViewController *)self itemManager];
      int v27 = [v26 sunriseOptionItem];
      if ([(HFItem *)v25 isEqual:v27])
      {
      }
      else
      {
        v28 = *p_selectedDateOptionItem;
        v29 = [(HUItemTableViewController *)self itemManager];
        id v30 = [v29 sunsetOptionItem];
        LODWORD(v28) = [(HFItem *)v28 isEqual:v30];

        if (!v28)
        {
          NSLog(&cfstr_UnhandledOptio.isa, *p_selectedDateOptionItem);
LABEL_19:
          v35 = *p_selectedDateOptionItem;
          v36 = [(HUItemTableViewController *)self itemManager];
          id v37 = [v36 timeOptionItem];

          if (v35 == v37)
          {
            v38 = [(HUItemTableViewController *)self itemManager];
            [v38 setDatePickerShown:1];
          }
          goto LABEL_21;
        }
      }
      id v21 = [(HUTimerTriggerEditorViewController *)self _selectedSignificantEvent];
      v31 = [(HUItemTableViewController *)self itemManager];
      v32 = [v31 defaultOffsetForSignificantEvent:v21];

      id v33 = objc_alloc_init(MEMORY[0x1E4F69578]);
      [v33 setSignificantEvent:v21];
      [v33 setSignificantEventOffset:v32];
      v34 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
      [v34 setEventBuilder:v33];
    }
    goto LABEL_19;
  }
LABEL_22:
}

- (NSDateComponents)selectedSignificantEventOffset
{
  objc_opt_class();
  v3 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
  v4 = [v3 eventBuilder];
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  v7 = [v6 significantEventOffset];

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  return (NSDateComponents *)v9;
}

- (void)setSelectedSignificantEventOffset:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  v4 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
  double v5 = [v4 eventBuilder];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    [v7 setSignificantEventOffset:v9];
    id v8 = [(HUItemTableViewController *)self itemManager];
    [v8 updateForSignificantEventOffsetChange];
  }
}

- (NSDateComponents)selectedFireTimeComponents
{
  objc_opt_class();
  v3 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
  v4 = [v3 eventBuilder];
  if (objc_opt_isKindOfClass()) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 fireTimeComponents];

  return (NSDateComponents *)v7;
}

- (void)setSelectedFireTimeComponents:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  v4 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
  double v5 = [v4 eventBuilder];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    [v7 setFireTimeComponents:v8];
  }
}

- (NSArray)selectedRecurrences
{
  v2 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
  v3 = [v2 recurrences];

  return (NSArray *)v3;
}

- (void)setSelectedRecurrences:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
  [v5 setRecurrences:v4];
}

- (void)setLayoutOptions:(id)a3
{
  id v16 = a3;
  if ([MEMORY[0x1E4F69758] useMacIdiom])
  {
    id v5 = [(HUTimerTriggerEditorViewController *)self layoutOptions];
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
      v15 = [(HUTimerTriggerEditorViewController *)self tableView];
      objc_msgSend(v15, "_setSectionContentInset:", v8, v10, v12, v14);
    }
  }
}

- (void)_showActionEditor:(id)a3
{
  if ([(HUTimerTriggerEditorViewController *)self _canContinue])
  {
    id v4 = [HUTriggerActionPickerViewController alloc];
    id v5 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
    unint64_t v6 = [(HUTimerTriggerEditorViewController *)self mode];
    double v7 = [(HUTimerTriggerEditorViewController *)self delegate];
    double v10 = [(HUTriggerActionPickerViewController *)v4 initWithTriggerBuilder:v5 mode:v6 delegate:v7];

    double v8 = [(HUTimerTriggerEditorViewController *)self navigationController];
    id v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);
  }
}

- (void)_showSummary:(id)a3
{
  if ([(HUTimerTriggerEditorViewController *)self _canContinue])
  {
    id v4 = [HUTriggerSummaryViewController alloc];
    id v5 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
    unint64_t v6 = [(HUTimerTriggerEditorViewController *)self mode];
    double v7 = [(HUTimerTriggerEditorViewController *)self delegate];
    double v10 = [(HUTriggerSummaryViewController *)v4 initWithTriggerBuilder:v5 mode:v6 isPresentedModally:0 delegate:v7];

    double v8 = [(HUTimerTriggerEditorViewController *)self navigationController];
    id v9 = (id)objc_msgSend(v8, "hu_pushPreloadableViewController:animated:", v10, 1);
  }
}

- (void)_cancel:(id)a3
{
  id v4 = [(HUTimerTriggerEditorViewController *)self delegate];
  [v4 triggerEditor:self didFinishWithTriggerBuilder:0];
}

- (void)_changeFireTime:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v10;
    id v5 = [v4 calendar];
    unint64_t v6 = [v4 date];

    double v7 = [v5 components:96 fromDate:v6];
    [(HUTimerTriggerEditorViewController *)self setSelectedFireTimeComponents:v7];

    double v8 = [(HUTimerTriggerEditorViewController *)self selectedFireTimeComponents];
    id v9 = [(HUItemTableViewController *)self itemManager];
    [v9 setDefaultFireTimeComponents:v8];
  }
}

- (void)datePickerCell:(id)a3 didSelectDate:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  double v7 = [v5 currentCalendar];
  double v8 = [v7 components:96 fromDate:v6];

  [(HUTimerTriggerEditorViewController *)self setSelectedFireTimeComponents:v8];
  id v10 = [(HUTimerTriggerEditorViewController *)self selectedFireTimeComponents];
  id v9 = [(HUItemTableViewController *)self itemManager];
  [v9 setDefaultFireTimeComponents:v10];
}

- (id)itemModuleControllers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUTimerTriggerEditorViewController *)self conditionModuleController];
  id v4 = [v2 setWithObject:v3];

  return v4;
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
  id v9 = [(HUItemTableViewController *)self itemManager];
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
  id v12 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v8 = v12;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    [v10 setDelegate:self];
    [v10 setHideTitleLabel:1];
    double v11 = +[HUIconCellContentMetrics defaultMetrics];
    [v11 iconSize];
    objc_msgSend(v10, "setLeftMargin:");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    id v10 = +[HUListContentConfigurationUtilities instructionsConfigurationForItem:v7];
    [v12 setContentConfiguration:v10];
    double v11 = [MEMORY[0x1E4F427B0] clearConfiguration];
    [v12 setBackgroundConfiguration:v11];
  }

LABEL_9:
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
    v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [v19 setTitleText:v24];

    v25 = [(HUTimerTriggerEditorViewController *)self selectedDateOptionItem];
    LODWORD(v24) = [v11 isEqual:v25];

    if (v24)
    {
      id v40 = v12;
      unsigned int v41 = v6;
      [v19 setChecked:1];
      v26 = [(HUItemTableViewController *)self itemManager];
      int v27 = [v26 sunriseOptionItem];
      v43[0] = v27;
      v28 = [(HUItemTableViewController *)self itemManager];
      v29 = [v28 sunsetOptionItem];
      v43[1] = v29;
      id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
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
    v19 = [(HUTimerTriggerEditorViewController *)self selectedRecurrences];
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

    id v39 = [(HUTimerTriggerEditorViewController *)self selectedFireTimeComponents];
    [v38 setTimeComponents:v39];
  }
LABEL_23:
  v42.receiver = self;
  v42.super_class = (Class)HUTimerTriggerEditorViewController;
  [(HUItemTableViewController *)&v42 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  id v5 = [(HUTimerTriggerEditorViewController *)self _instructionsSectionIDs];
  uint64_t v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 displayedSectionIdentifierForSectionIndex:a3];
  char v8 = [v5 containsObject:v7];

  return v8;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  id v5 = [(HUTimerTriggerEditorViewController *)self _instructionsSectionIDs];
  uint64_t v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 displayedSectionIdentifierForSectionIndex:a3];
  char v8 = [v5 containsObject:v7];

  return v8;
}

- (id)_instructionsSectionIDs
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HUTimerTriggerEditorSectionIdentifierInstructions";
  v4[1] = @"HUTimerTriggerEditorSectionIdentifierRepeatInstructions";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUItemTableViewController *)self moduleControllerForItem:v9];

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)HUTimerTriggerEditorViewController;
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
  v11.super_class = (Class)HUTimerTriggerEditorViewController;
  [(HUItemTableViewController *)&v11 tableView:a3 accessoryButtonTappedForRowWithIndexPath:a4];
  id v5 = [HUTimeEventOffsetEditorViewController alloc];
  id v6 = [(HUTimerTriggerEditorViewController *)self _selectedSignificantEvent];
  id v7 = [(HUTimerTriggerEditorViewController *)self selectedSignificantEventOffset];
  char v8 = [(HUTimeEventOffsetEditorViewController *)v5 initWithSignificantEvent:v6 currentOffset:v7 delegate:self];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v8];
  [v9 setModalPresentationStyle:2];
  id v10 = [(UIViewController *)self hu_presentPreloadableViewController:v9 animated:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUTimerTriggerEditorViewController;
  [(HUItemTableViewController *)&v14 tableView:v6 didSelectRowAtIndexPath:v7];
  char v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [v8 displayedItemAtIndexPath:v7];

  id v10 = [(HUItemTableViewController *)self moduleControllerForItem:v9];

  if (!v10)
  {
    [v6 deselectRowAtIndexPath:v7 animated:1];
    objc_super v11 = [(HUItemTableViewController *)self itemManager];
    id v12 = [v11 dateOptionsItems];
    int v13 = [v12 containsObject:v9];

    if (v13) {
      [(HUTimerTriggerEditorViewController *)self setSelectedDateOptionItem:v9];
    }
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [v6 displayedSectionIdentifierForSectionIndex:a4];
  int v8 = [v7 isEqualToString:@"HUTimerTriggerEditorSectionIdentifierRepeat"];

  if (v8)
  {
    id v9 = [(HUTimerTriggerEditorViewController *)self _localizedRecurrenceDescription];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)dayOfWeekPickerCell:(id)a3 didChangeSelectedRecurrences:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a4, "allObjects", a3);
  [(HUTimerTriggerEditorViewController *)self setSelectedRecurrences:v5];

  id v6 = [(HUItemTableViewController *)self itemManager];
  uint64_t v7 = [v6 sectionIndexForDisplayedSectionIdentifier:@"HUTimerTriggerEditorSectionIdentifierRepeat"];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__HUTimerTriggerEditorViewController_dayOfWeekPickerCell_didChangeSelectedRecurrences___block_invoke;
  v12[3] = &unk_1E6385738;
  v12[4] = self;
  v12[5] = v7;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v12];
  int v8 = [(HUItemTableViewController *)self itemManager];
  id v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 itemSectionForSectionIndex:v7];
  v13[0] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v8 reloadUIRepresentationForSections:v11 withAnimation:0];
}

void __87__HUTimerTriggerEditorViewController_dayOfWeekPickerCell_didChangeSelectedRecurrences___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 beginUpdates];

  v3 = [*(id *)(a1 + 32) tableView];
  id v7 = [v3 footerViewForSection:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) _localizedRecurrenceDescription];
  id v5 = [v7 textLabel];
  [v5 setText:v4];

  [v7 setClipsToBounds:1];
  [v7 sizeToFit];
  id v6 = [*(id *)(a1 + 32) tableView];
  [v6 endUpdates];
}

- (void)timerTriggerOffsetEditor:(id)a3 didFinishWithOffset:(id)a4
{
  id v5 = a4;
  id v6 = [(HUItemTableViewController *)self itemManager];
  id v7 = [(HUTimerTriggerEditorViewController *)self _selectedSignificantEvent];
  [v6 setDefaultOffset:v5 forSignificantEvent:v7];

  [(HUTimerTriggerEditorViewController *)self setSelectedSignificantEventOffset:v5];

  [(HUTimerTriggerEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)timerTriggerOffsetEditorDidCancel:(id)a3
{
}

- (id)_localizedRecurrenceDescription
{
  v2 = (void *)MEMORY[0x1E4F2EB90];
  v3 = [(HUTimerTriggerEditorViewController *)self selectedRecurrences];
  id v4 = objc_msgSend(v2, "hf_recurrenceNaturalLanguageStringWithRecurrences:", v3);

  return v4;
}

- (BOOL)_canContinue
{
  return 1;
}

- (BOOL)_canCommitTriggerBuilder
{
  v3 = [(HUTimerTriggerEditorViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  id v5 = [(HUTimerTriggerEditorViewController *)self delegate];
  id v6 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
  char v7 = [v5 triggerEditor:self shouldCommitTriggerBuilder:v6];

  return v7;
}

- (id)_commitTriggerBuilder
{
  v3 = (void *)MEMORY[0x1E4F7A0D8];
  char v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 41);
  id v5 = [v3 futureWithError:v4];

  if ([(HUTimerTriggerEditorViewController *)self _canCommitTriggerBuilder]
    && [(HUTimerTriggerEditorViewController *)self _canContinue])
  {
    id v6 = [(HUTimerTriggerEditorViewController *)self timerTriggerBuilder];
    char v7 = [v6 commitItem];

    id v8 = (id)[v7 addFailureBlock:&__block_literal_global_81];
    id v5 = v7;
  }

  return v5;
}

void __59__HUTimerTriggerEditorViewController__commitTriggerBuilder__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F69110];
  id v3 = a2;
  id v4 = [v2 sharedHandler];
  [v4 handleError:v3];
}

- (id)_selectedSignificantEvent
{
  id v3 = [(HUTimerTriggerEditorViewController *)self selectedDateOptionItem];
  id v4 = [(HUItemTableViewController *)self itemManager];
  id v5 = [v4 sunriseOptionItem];
  char v6 = [v3 isEqual:v5];

  if (v6)
  {
    char v7 = (id *)MEMORY[0x1E4F2DF70];
LABEL_5:
    id v12 = *v7;
    goto LABEL_7;
  }
  id v8 = [(HUTimerTriggerEditorViewController *)self selectedDateOptionItem];
  id v9 = [(HUItemTableViewController *)self itemManager];
  id v10 = [v9 sunsetOptionItem];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    char v7 = (id *)MEMORY[0x1E4F2DF78];
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

- (HFTimerTriggerBuilder)timerTriggerBuilder
{
  return self->_timerTriggerBuilder;
}

- (void)setTimerTriggerBuilder:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (HUTriggerEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTriggerEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUTriggerConditionEditorItemModuleController)conditionModuleController
{
  return self->_conditionModuleController;
}

- (HFItem)selectedDateOptionItem
{
  return self->_selectedDateOptionItem;
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_selectedDateOptionItem, 0);
  objc_storeStrong((id *)&self->_conditionModuleController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_timerTriggerBuilder, 0);
}

@end