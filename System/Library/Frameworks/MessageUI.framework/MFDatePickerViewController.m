@interface MFDatePickerViewController
+ (id)datePickerViewControllerWithType:(int64_t)a3 message:(id)a4;
- (BOOL)shouldInvokeDelegate;
- (BOOL)shouldShowDeleteButton;
- (BOOL)timeSwitchEnabled;
- (EFLocked)allItems;
- (EFLocked)items;
- (EMMessage)message;
- (MFDatePickerViewController)initWithType:(int64_t)a3 shouldShowDeleteButton:(BOOL)a4 initialDate:(id)a5;
- (MFDatePickerViewController)initWithType:(int64_t)a3 shouldShowDeleteButton:(BOOL)a4 initialDate:(id)a5 shouldDismissCommit:(BOOL)a6;
- (MFDatePickerViewControllerDelegate)delegate;
- (NSDate)initialDate;
- (OS_dispatch_queue)updateQueue;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)_itemOfType:(unint64_t)a3;
- (id)_itemWithIdentifier:(id)a3;
- (id)_selectedDateForTimeWheelFromDate:(id)a3;
- (id)_selectedTimeForTimeWheelFromDate:(id)a3;
- (id)createCollectionViewLayout;
- (int64_t)type;
- (void)_cancel:(id)a3;
- (void)_datePicked:(id)a3;
- (void)_reloadDataSourceAnimated:(void *)a3 update:;
- (void)_reloadDataSourceAnimated:(void *)a3 update:(void *)a4 completion:;
- (void)calendarCollectionViewCell:(id)a3 didChangeDate:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)datePickerTimeHeaderCollectionViewCell:(id)a3 showTime:(BOOL)a4;
- (void)sendLaterHeaderCollectionViewCellDateTapped:(id)a3;
- (void)sendLaterHeaderCollectionViewCellTimeTapped:(id)a3;
- (void)setAllItems:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialDate:(id)a3;
- (void)setItems:(id)a3;
- (void)setMessage:(id)a3;
- (void)setShouldInvokeDelegate:(BOOL)a3;
- (void)setShouldShowDeleteButton:(BOOL)a3;
- (void)setTimeSwitchEnabled:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setUpDataSourceForCollectionView:(id)a3;
- (void)setUpItemsProvider;
- (void)setUpNavigationBar;
- (void)setUpdateQueue:(id)a3;
- (void)timeCollectionViewCell:(id)a3 didChangeDate:(id)a4;
- (void)timeZonePickerViewController:(id)a3 didSelectCity:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MFDatePickerViewController

+ (id)datePickerViewControllerWithType:(int64_t)a3 message:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 == 1)
  {
    v8 = [v5 readLater];
    v7 = [v8 date];
  }
  else if (a3)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v5 sendLaterDate];
  }
  v9 = [[MFDatePickerViewController alloc] initWithType:a3 shouldShowDeleteButton:1 initialDate:v7];
  [(MFDatePickerViewController *)v9 setMessage:v6];

  return v9;
}

- (MFDatePickerViewController)initWithType:(int64_t)a3 shouldShowDeleteButton:(BOOL)a4 initialDate:(id)a5
{
  return [(MFDatePickerViewController *)self initWithType:a3 shouldShowDeleteButton:a4 initialDate:a5 shouldDismissCommit:0];
}

- (MFDatePickerViewController)initWithType:(int64_t)a3 shouldShowDeleteButton:(BOOL)a4 initialDate:(id)a5 shouldDismissCommit:(BOOL)a6
{
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)MFDatePickerViewController;
  v11 = [(MFDatePickerViewController *)&v29 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v11->_shouldShowDeleteButton = a4;
    v11->_shouldInvokeDelegate = a6;
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.mail.datepicker.update", v14);
    updateQueue = v12->_updateQueue;
    v12->_updateQueue = (OS_dispatch_queue *)v15;

    id v17 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v21 = objc_msgSend(v18, "initWithObjects:", v19, v20, 0);
    uint64_t v22 = [v17 initWithObject:v21];
    items = v12->_items;
    v12->_items = (EFLocked *)v22;

    if (v10 && !objc_msgSend(v10, "ef_isEarlierThanNow"))
    {
      v27 = (NSDate *)v10;
      initialDate = v12->_initialDate;
      v12->_initialDate = v27;
      char v25 = 1;
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1C9C8] now];
      char v25 = 0;
      initialDate = v12->_initialDate;
      v12->_initialDate = (NSDate *)v24;
    }

    v12->_timeSwitchEnabled = v25;
  }

  return v12;
}

- (id)_selectedDateForTimeWheelFromDate:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9C8] now];
  if (objc_msgSend(v4, "ef_isDateNextDayOrLater:", v3))
  {
    id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  else
  {
    id v5 = v3;
  }
  v6 = v5;

  return v6;
}

- (id)_selectedTimeForTimeWheelFromDate:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v7 = objc_msgSend(v4, "ef_localCombinedDate:time:timeZone:", v5, v3, v6);

  return v7;
}

- (void)setUpItemsProvider
{
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = [(MFDatePickerViewController *)self initialDate];
  v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v5 = +[MFTimezoneHelper cityForTimeZone:v4];

  v44 = (void *)v5;
  v6 = [MFDatePickerItemIdentifier alloc];
  v7 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = [(MFDatePickerItemIdentifier *)v6 initWithIdentifier:v7 type:0];

  v42 = (void *)v8;
  v41 = [[MFDatePickerItem alloc] initWithIdentifier:v8 selectedDate:v3 selectedTime:v3 selectedCity:v5 datePickerComponentType:0];
  [v45 setObject:v41 forKeyedSubscript:v8];
  v9 = [MFDatePickerItemIdentifier alloc];
  id v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [(MFDatePickerItemIdentifier *)v9 initWithIdentifier:v10 type:1];

  v40 = (void *)v11;
  v39 = [[MFDatePickerItem alloc] initWithIdentifier:v11 selectedDate:v3 selectedTime:0 selectedCity:0 datePickerComponentType:0];
  [v45 setObject:v39 forKeyedSubscript:v11];
  v12 = [MFDatePickerItemIdentifier alloc];
  v13 = [MEMORY[0x1E4F29128] UUID];
  v43 = [(MFDatePickerItemIdentifier *)v12 initWithIdentifier:v13 type:2];

  v14 = [MFDatePickerItem alloc];
  dispatch_queue_t v15 = [(MFDatePickerViewController *)self _selectedDateForTimeWheelFromDate:v3];
  v16 = [(MFDatePickerViewController *)self _selectedTimeForTimeWheelFromDate:v3];
  uint64_t v17 = [(MFDatePickerItem *)v14 initWithIdentifier:v43 selectedDate:v15 selectedTime:v16 selectedCity:v44 datePickerComponentType:0];

  v38 = (void *)v17;
  [v45 setObject:v17 forKeyedSubscript:v43];
  id v18 = [MFDatePickerItemIdentifier alloc];
  id v19 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v20 = [(MFDatePickerItemIdentifier *)v18 initWithIdentifier:v19 type:5];

  v37 = (void *)v20;
  v36 = [[MFDatePickerItem alloc] initWithIdentifier:v20 selectedDate:0 selectedTime:0 selectedCity:v44 datePickerComponentType:0];
  [v45 setObject:v36 forKeyedSubscript:v20];
  v21 = [MFDatePickerItemIdentifier alloc];
  uint64_t v22 = [MEMORY[0x1E4F29128] UUID];
  v23 = [(MFDatePickerItemIdentifier *)v21 initWithIdentifier:v22 type:3];

  uint64_t v24 = [[MFDatePickerItem alloc] initWithIdentifier:v23 selectedDate:v3 selectedTime:0 selectedCity:0 datePickerComponentType:0];
  [v45 setObject:v24 forKeyedSubscript:v23];
  char v25 = [MFDatePickerItemIdentifier alloc];
  v26 = [MEMORY[0x1E4F29128] UUID];
  v27 = [(MFDatePickerItemIdentifier *)v25 initWithIdentifier:v26 type:4];

  v28 = [[MFDatePickerItem alloc] initWithIdentifier:v27 selectedDate:0 selectedTime:v3 selectedCity:0 datePickerComponentType:0 timeSwitchEnabled:[(MFDatePickerViewController *)self timeSwitchEnabled]];
  [v45 setObject:v28 forKeyedSubscript:v27];
  objc_super v29 = [MFDatePickerItemIdentifier alloc];
  v30 = [MEMORY[0x1E4F29128] UUID];
  v31 = [(MFDatePickerItemIdentifier *)v29 initWithIdentifier:v30 type:6];

  v32 = [[MFDatePickerItem alloc] initWithIdentifier:v31 selectedDate:0 selectedTime:0 selectedCity:0 datePickerComponentType:0];
  [v45 setObject:v32 forKeyedSubscript:v31];
  id v33 = objc_alloc(MEMORY[0x1E4F60DA0]);
  v34 = (void *)[v45 copy];
  v35 = (void *)[v33 initWithObject:v34];
  [(MFDatePickerViewController *)self setAllItems:v35];
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)MFDatePickerViewController;
  [(MFDatePickerViewController *)&v10 viewDidLoad];
  [(MFDatePickerViewController *)self setUpItemsProvider];
  id v3 = objc_alloc(MEMORY[0x1E4FB1568]);
  v4 = [(MFDatePickerViewController *)self createCollectionViewLayout];
  uint64_t v5 = objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setDelegate:self];
  [v5 setShowsVerticalScrollIndicator:0];
  [(MFDatePickerViewController *)self setUpDataSourceForCollectionView:v5];
  [(MFDatePickerViewController *)self setCollectionView:v5];
  v6 = [(MFDatePickerViewController *)self view];
  [v6 addSubview:v5];

  v7 = [(MFDatePickerViewController *)self collectionView];
  uint64_t v8 = [(MFDatePickerViewController *)self view];
  objc_msgSend(v7, "mf_pinToView:usingLayoutMargins:", v8, 0);

  [(MFDatePickerViewController *)self setUpNavigationBar];
  v9 = [(MFDatePickerViewController *)self navigationItem];
  [v9 setHidesBackButton:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MFDatePickerViewController;
  [(MFDatePickerViewController *)&v17 viewDidDisappear:a3];
  if (![(MFDatePickerViewController *)self shouldInvokeDelegate]) {
    return;
  }
  v4 = [(MFDatePickerViewController *)self initialDate];
  int64_t v5 = [(MFDatePickerViewController *)self type];
  if (!v5)
  {
    v6 = [(MFDatePickerViewController *)self _itemOfType:0];
    v12 = (void *)MEMORY[0x1E4F1C9C8];
    v7 = [v6 selectedDate];
    v9 = [v6 selectedTime];
    objc_super v10 = [v6 selectedCity];
    uint64_t v11 = [v10 timeZone];
    uint64_t v13 = objc_msgSend(v12, "ef_localCombinedDate:time:timeZone:", v7, v9, v11);

    v4 = (void *)v13;
    goto LABEL_6;
  }
  if (v5 == 1)
  {
    v6 = [(MFDatePickerViewController *)self _itemOfType:3];
    v7 = [(MFDatePickerViewController *)self _itemOfType:4];
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
    v9 = [v6 selectedDate];
    objc_super v10 = [v7 selectedTime];
    objc_msgSend(v8, "ef_localCombinedDate:time:timeZone:", v9, v10, 0);
    v4 = uint64_t v11 = v4;
LABEL_6:
  }
  v14 = [(MFDatePickerViewController *)self initialDate];
  char v15 = [v4 isEqualToDate:v14];

  if ((v15 & 1) == 0)
  {
    v16 = [(MFDatePickerViewController *)self delegate];
    [v16 datePickerViewController:self didSelectDate:v4];
  }
}

- (void)setUpNavigationBar
{
  id v6 = [(MFDatePickerViewController *)self navigationItem];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
  [v6 setLeftBarButtonItem:v3];

  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__datePicked_];
  [v6 setRightBarButtonItem:v4];

  if ((unint64_t)[(MFDatePickerViewController *)self type] <= 1)
  {
    int64_t v5 = _EFLocalizedString();
    [v6 setTitle:v5];
  }
}

- (id)createCollectionViewLayout
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  id v3 = objc_alloc(MEMORY[0x1E4FB1580]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MFDatePickerViewController_createCollectionViewLayout__block_invoke;
  v7[3] = &unk_1E5F7A848;
  id v4 = v2;
  id v8 = v4;
  int64_t v5 = (void *)[v3 initWithSectionProvider:v7];

  return v5;
}

id __56__MFDatePickerViewController_createCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:*(void *)(a1 + 32) layoutEnvironment:a3];
  if (!a2)
  {
    int64_t v5 = (void *)MEMORY[0x1E4FB1338];
    id v6 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v7 = [MEMORY[0x1E4FB1308] estimatedDimension:44.0];
    id v8 = [v5 sizeWithWidthDimension:v6 heightDimension:v7];

    v9 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v8 elementKind:*MEMORY[0x1E4FB2770] alignment:1];
    v12[0] = v9;
    objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v4 setBoundarySupplementaryItems:v10];
  }

  return v4;
}

- (void)setUpDataSourceForCollectionView:(id)a3
{
  v103[1] = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v4 = (void *)MEMORY[0x1E4FB15F8];
  uint64_t v5 = objc_opt_class();
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke;
  v96[3] = &unk_1E5F7A870;
  objc_copyWeak(&v97, &location);
  v61 = [v4 registrationWithSupplementaryClass:v5 elementKind:*MEMORY[0x1E4FB2770] configurationHandler:v96];
  id v6 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v7 = objc_opt_class();
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_2;
  v94[3] = &unk_1E5F7A898;
  objc_copyWeak(&v95, &location);
  v62 = [v6 registrationWithCellClass:v7 configurationHandler:v94];
  id v8 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v9 = objc_opt_class();
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_3;
  v92[3] = &unk_1E5F7A8C0;
  objc_copyWeak(&v93, &location);
  v60 = [v8 registrationWithCellClass:v9 configurationHandler:v92];
  objc_super v10 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v11 = objc_opt_class();
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_4;
  v90[3] = &unk_1E5F7A8E8;
  objc_copyWeak(&v91, &location);
  v59 = [v10 registrationWithCellClass:v11 configurationHandler:v90];
  v58 = [MEMORY[0x1E4FB1578] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_16];
  v57 = [MEMORY[0x1E4FB1578] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_56];
  v12 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v13 = objc_opt_class();
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_7;
  v88[3] = &unk_1E5F7A950;
  objc_copyWeak(&v89, &location);
  v56 = [v12 registrationWithCellClass:v13 configurationHandler:v88];
  v14 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v15 = objc_opt_class();
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_8;
  v87[3] = &unk_1E5F7A978;
  v87[4] = self;
  v55 = [v14 registrationWithCellClass:v15 configurationHandler:v87];
  id v16 = objc_alloc(MEMORY[0x1E4FB1598]);
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_9;
  v78[3] = &unk_1E5F7A9A0;
  objc_copyWeak(&v86, &location);
  id v50 = v59;
  id v79 = v50;
  id v48 = v62;
  id v80 = v48;
  id v49 = v60;
  id v81 = v49;
  id v51 = v58;
  id v82 = v51;
  id v53 = v56;
  id v83 = v53;
  id v54 = v55;
  id v84 = v54;
  id v52 = v57;
  id v85 = v52;
  objc_super v17 = (void *)[v16 initWithCollectionView:v63 cellProvider:v78];
  id v18 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  v103[0] = &unk_1F0841398;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:1];
  [v18 appendSectionsWithIdentifiers:v19];

  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_10;
  v76[3] = &unk_1E5F7A9C8;
  id v47 = v61;
  id v77 = v47;
  [v17 setSupplementaryViewProvider:v76];
  int64_t v20 = [(MFDatePickerViewController *)self type];
  if (v20)
  {
    if (v20 != 1) {
      goto LABEL_6;
    }
    v46 = [(MFDatePickerViewController *)self _itemOfType:3];
    id v45 = [(MFDatePickerViewController *)self _itemOfType:1];
    v21 = [(MFDatePickerViewController *)self _itemOfType:4];
    uint64_t v22 = [(MFDatePickerViewController *)self items];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_12;
    v69[3] = &unk_1E5F7AA18;
    id v23 = v46;
    id v70 = v23;
    id v24 = v45;
    id v71 = v24;
    id v25 = v21;
    id v72 = v25;
    [v22 performWhileLocked:v69];

    v26 = [v23 identifier];
    v101[0] = v26;
    v27 = [v24 identifier];
    v101[1] = v27;
    v28 = [v25 identifier];
    v101[2] = v28;
    objc_super v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:3];
    [v18 appendItemsWithIdentifiers:v29 intoSectionWithIdentifier:&unk_1F0841398];
  }
  else
  {
    v30 = [(MFDatePickerViewController *)self _itemOfType:0];
    v31 = [(MFDatePickerViewController *)self _itemOfType:1];
    v32 = [(MFDatePickerViewController *)self items];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_11;
    v73[3] = &unk_1E5F7A9F0;
    id v23 = v30;
    id v74 = v23;
    id v24 = v31;
    id v75 = v24;
    [v32 performWhileLocked:v73];

    id v33 = [v23 identifier];
    v102[0] = v33;
    v34 = [v24 identifier];
    v102[1] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
    [v18 appendItemsWithIdentifiers:v35 intoSectionWithIdentifier:&unk_1F0841398];

    id v25 = v74;
  }

LABEL_6:
  if ([(MFDatePickerViewController *)self shouldShowDeleteButton])
  {
    v36 = [(MFDatePickerViewController *)self _itemOfType:6];
    v37 = [(MFDatePickerViewController *)self items];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_13;
    v67[3] = &unk_1E5F7AA40;
    id v38 = v36;
    id v68 = v38;
    [v37 performWhileLocked:v67];

    v100 = &unk_1F08413B0;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
    [v18 appendSectionsWithIdentifiers:v39];

    v40 = [v38 identifier];
    v99 = v40;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
    [v18 appendItemsWithIdentifiers:v41 intoSectionWithIdentifier:&unk_1F08413B0];
  }
  [(MFDatePickerViewController *)self setDataSource:v17];
  [v63 setDataSource:v17];
  v42 = [(MFDatePickerViewController *)self updateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_14;
  block[3] = &unk_1E5F79038;
  id v65 = v17;
  id v66 = v18;
  id v43 = v18;
  id v44 = v17;
  dispatch_sync(v42, block);

  objc_destroyWeak(&v86);
  objc_destroyWeak(&v89);

  objc_destroyWeak(&v91);
  objc_destroyWeak(&v93);

  objc_destroyWeak(&v95);
  objc_destroyWeak(&v97);
  objc_destroyWeak(&location);
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && (unint64_t)[WeakRetained type] <= 1)
  {
    uint64_t v5 = _EFLocalizedString();
    id v6 = [v7 label];
    [v6 setText:v5];
  }
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v9 setDelegate:WeakRetained];
  id v8 = [v6 selectedDate];
  [v9 updateCalendarDate:v8];
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v15 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v15 setDelegate:WeakRetained];
  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = [v6 selectedDate];
  objc_super v10 = [v6 selectedTime];
  uint64_t v11 = [v6 selectedCity];
  v12 = [v11 timeZone];
  uint64_t v13 = objc_msgSend(v8, "ef_localCombinedDate:time:timeZone:", v9, v10, v12);
  [v15 setMinimumDate:v13];

  v14 = [v6 selectedTime];
  [v15 setDate:v14];
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v16 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = [v6 selectedDate];
  objc_super v10 = [v6 selectedTime];
  uint64_t v11 = [v6 selectedCity];
  v12 = [v11 timeZone];
  uint64_t v13 = objc_msgSend(v8, "ef_localCombinedDate:time:timeZone:", v9, v10, v12);

  v14 = [v6 selectedCity];
  id v15 = [v14 timeZone];
  [v16 updateWithDate:v13 timeZone:v15];

  if ([v6 datePickerComponentType] == 1) {
    objc_msgSend(v16, "updateActiveComponent:", objc_msgSend(v6, "datePickerComponentType"));
  }
  [v16 setDelegate:WeakRetained];
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  uint64_t v5 = [a4 selectedCity];
  id v6 = [v5 displayName];
  [v7 setCurrentCityName:v6];
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  uint64_t v5 = [a4 selectedDate];
  [v6 updateSecondaryTextWithDate:v5];
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v9 setDelegate:WeakRetained];
  id v8 = [v6 selectedTime];
  objc_msgSend(v9, "updateSecondaryTextWithTime:timeSwitchEnabled:", v8, objc_msgSend(v6, "timeSwitchEnabled"));
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_8(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 defaultContentConfiguration];
  if ((unint64_t)[*(id *)(a1 + 32) type] <= 1)
  {
    id v4 = _EFLocalizedString();
    [v3 setText:v4];
  }
  uint64_t v5 = [MEMORY[0x1E4FB1618] systemRedColor];
  id v6 = [v3 textProperties];
  [v6 setColor:v5];

  id v7 = [v3 textProperties];
  [v7 setAlignment:1];

  [v9 setContentConfiguration:v3];
  id v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v9 setBackgroundColor:v8];
}

id *__63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_9(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 11);
  uint64_t v11 = [WeakRetained _itemWithIdentifier:v9];
  switch([v9 type])
  {
    case 0:
      v12 = a1 + 4;
      goto LABEL_9;
    case 1:
      v12 = a1 + 5;
      goto LABEL_9;
    case 2:
      v12 = a1 + 6;
      goto LABEL_9;
    case 3:
      v12 = a1 + 10;
      goto LABEL_9;
    case 4:
      v12 = a1 + 8;
      goto LABEL_9;
    case 5:
      v12 = a1 + 7;
      goto LABEL_9;
    case 6:
      v12 = a1 + 9;
LABEL_9:
      a1 = [v7 dequeueConfiguredReusableCellWithRegistration:*v12 forIndexPath:v8 item:v11];
      break;
    default:
      break;
  }

  return a1;
}

id __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_10(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(void *)(a1 + 32));

  return v2;
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_11(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(&unk_1F0841398, "integerValue"));
  [v3 addObject:*(void *)(a1 + 32)];
  [v3 addObject:*(void *)(a1 + 40)];
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_12(void *a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(&unk_1F0841398, "integerValue"));
  [v3 addObject:a1[4]];
  [v3 addObject:a1[5]];
  [v3 addObject:a1[6]];
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_13(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(&unk_1F08413B0, "integerValue"));
  [v3 addObject:*(void *)(a1 + 32)];
}

uint64_t __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) applySnapshot:*(void *)(a1 + 40) animatingDifferences:0];
}

- (void)_reloadDataSourceAnimated:(void *)a3 update:
{
  id v5 = a3;
  if (a1) {
    -[MFDatePickerViewController _reloadDataSourceAnimated:update:completion:](a1, a2, v5, 0);
  }
}

- (void)_reloadDataSourceAnimated:(void *)a3 update:(void *)a4 completion:
{
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = [a1 updateQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__MFDatePickerViewController__reloadDataSourceAnimated_update_completion___block_invoke;
    v10[3] = &unk_1E5F7AA68;
    v10[4] = a1;
    id v11 = v7;
    char v13 = a2;
    id v12 = v8;
    dispatch_async(v9, v10);
  }
}

void __74__MFDatePickerViewController__reloadDataSourceAnimated_update_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSource];
  id v3 = [v2 snapshot];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__MFDatePickerViewController__reloadDataSourceAnimated_update_completion___block_invoke_2;
  v5[3] = &unk_1E5F7A240;
  id v6 = *(id *)(a1 + 48);
  [v2 applySnapshot:v3 animatingDifferences:v4 completion:v5];
}

uint64_t __74__MFDatePickerViewController__reloadDataSourceAnimated_update_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  id v8 = [(MFDatePickerViewController *)self items];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  int64_t v20 = __70__MFDatePickerViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v21 = &unk_1E5F7AA90;
  id v23 = &v24;
  id v9 = v7;
  id v22 = v9;
  [v8 performWhileLocked:&v18];

  objc_super v10 = objc_msgSend((id)v25[5], "identifier", v18, v19, v20, v21);
  uint64_t v11 = [v10 type];

  if (v11 == 5)
  {
    id v12 = [MFTimeZonePickerViewController alloc];
    char v13 = [(id)v25[5] selectedCity];
    v14 = [(MFTimeZonePickerViewController *)v12 initWithCity:v13];

    [(MFTimeZonePickerViewController *)v14 setDelegate:self];
    id v15 = [(MFDatePickerViewController *)self navigationController];
    [v15 pushViewController:v14 animated:1];

    [v6 deselectItemAtIndexPath:v9 animated:1];
  }
  else
  {
    id v16 = [(id)v25[5] identifier];
    uint64_t v17 = [v16 type];

    if (v17 != 6)
    {
      [v6 deselectItemAtIndexPath:v9 animated:1];
      goto LABEL_7;
    }
    v14 = [(MFDatePickerViewController *)self delegate];
    [(MFDatePickerViewController *)self dismissViewControllerAnimated:1 completion:0];
    [(MFTimeZonePickerViewController *)v14 datePickerViewControllerDidDeleteDate:self];
  }

LABEL_7:
  _Block_object_dispose(&v24, 8);
}

void __70__MFDatePickerViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "section"));
  uint64_t v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "item"));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)_datePicked:(id)a3
{
  [(MFDatePickerViewController *)self setShouldInvokeDelegate:1];

  [(MFDatePickerViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_cancel:(id)a3
{
  [(MFDatePickerViewController *)self setShouldInvokeDelegate:0];

  [(MFDatePickerViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (id)_itemOfType:(unint64_t)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__4;
  id v12 = __Block_byref_object_dispose__4;
  id v13 = 0;
  uint64_t v4 = [(MFDatePickerViewController *)self allItems];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MFDatePickerViewController__itemOfType___block_invoke;
  v7[3] = &unk_1E5F7AAE0;
  void v7[4] = &v8;
  v7[5] = a3;
  [v4 performWhileLocked:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __42__MFDatePickerViewController__itemOfType___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__MFDatePickerViewController__itemOfType___block_invoke_2;
  v4[3] = &unk_1E5F7AAB8;
  uint64_t v2 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v2;
  return [a2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __42__MFDatePickerViewController__itemOfType___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([a2 type] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (id)_itemWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  id v5 = [(MFDatePickerViewController *)self allItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__MFDatePickerViewController__itemWithIdentifier___block_invoke;
  v9[3] = &unk_1E5F7AB08;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 performWhileLocked:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__MFDatePickerViewController__itemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)sendLaterHeaderCollectionViewCellDateTapped:(id)a3
{
  [a3 updateActiveComponent:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellDateTapped___block_invoke;
  v4[3] = &unk_1E5F7AB30;
  v4[4] = self;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v4);
}

void __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellDateTapped___block_invoke(uint64_t a1, void *a2)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _itemOfType:2];
  id v5 = objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 5, v4);
  id v6 = [*(id *)(a1 + 32) _itemOfType:1];
  id v7 = [*(id *)(a1 + 32) items];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellDateTapped___block_invoke_2;
  v16[3] = &unk_1E5F7AA18;
  id v8 = v4;
  id v17 = v8;
  id v9 = v5;
  id v18 = v9;
  id v10 = v6;
  id v19 = v10;
  [v7 performWhileLocked:v16];

  uint64_t v11 = [v8 identifier];
  v21[0] = v11;
  uint64_t v12 = [v9 identifier];
  v21[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [v3 deleteItemsWithIdentifiers:v13];

  uint64_t v14 = [v10 identifier];
  int64_t v20 = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  [v3 appendItemsWithIdentifiers:v15 intoSectionWithIdentifier:&unk_1F0841398];
}

void __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellDateTapped___block_invoke_2(void *a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(&unk_1F0841398, "integerValue"));
  [v3 removeObject:a1[4]];
  [v3 removeObject:a1[5]];
  [v3 addObject:a1[6]];
}

- (void)sendLaterHeaderCollectionViewCellTimeTapped:(id)a3
{
  [a3 updateActiveComponent:1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellTimeTapped___block_invoke;
  v4[3] = &unk_1E5F7AB30;
  v4[4] = self;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v4);
}

void __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellTimeTapped___block_invoke(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _itemOfType:2];
  id v5 = [*(id *)(a1 + 32) _itemOfType:5];
  id v6 = [*(id *)(a1 + 32) _itemOfType:1];
  id v7 = [*(id *)(a1 + 32) items];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellTimeTapped___block_invoke_2;
  v16[3] = &unk_1E5F7AA18;
  id v8 = v6;
  id v17 = v8;
  id v9 = v4;
  id v18 = v9;
  id v10 = v5;
  id v19 = v10;
  [v7 performWhileLocked:v16];

  uint64_t v11 = [v8 identifier];
  v21[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v3 deleteItemsWithIdentifiers:v12];

  id v13 = [v9 identifier];
  v20[0] = v13;
  uint64_t v14 = [v10 identifier];
  v20[1] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v3 appendItemsWithIdentifiers:v15 intoSectionWithIdentifier:&unk_1F0841398];
}

void __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellTimeTapped___block_invoke_2(void *a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(&unk_1F0841398, "integerValue"));
  [v3 removeObject:a1[4]];
  [v3 addObject:a1[5]];
  [v3 addObject:a1[6]];
}

- (void)calendarCollectionViewCell:(id)a3 didChangeDate:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__MFDatePickerViewController_calendarCollectionViewCell_didChangeDate___block_invoke;
  v7[3] = &unk_1E5F7AB58;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v7);
}

void __71__MFDatePickerViewController_calendarCollectionViewCell_didChangeDate___block_invoke(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _itemOfType:2];
  id v5 = [*(id *)(a1 + 32) _selectedDateForTimeWheelFromDate:*(void *)(a1 + 40)];
  [v4 setSelectedDate:v5];

  id v6 = [v3 itemIdentifiers];
  id v7 = [v4 identifier];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    id v9 = [v4 identifier];
    v24[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v3 reconfigureItemsWithIdentifiers:v10];
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  if (objc_msgSend(v11, "ef_isLaterThanDate:", *(void *)(a1 + 40))) {
    [v4 setSelectedTime:v11];
  }
  uint64_t v12 = [*(id *)(a1 + 32) type];
  if (v12 == 1)
  {
    id v13 = [*(id *)(a1 + 32) _itemOfType:3];
    [v13 setSelectedDate:*(void *)(a1 + 40)];
    id v15 = [*(id *)(a1 + 32) _itemOfType:4];
    id v17 = [v4 selectedTime];
    [v15 setSelectedTime:v17];

    id v18 = [v15 identifier];
    id v22 = v18;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [v3 reconfigureItemsWithIdentifiers:v19];

    id v16 = [v13 identifier];
    v21 = v16;
    int64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v3 reconfigureItemsWithIdentifiers:v20];

    goto LABEL_9;
  }
  if (!v12)
  {
    id v13 = [*(id *)(a1 + 32) _itemOfType:0];
    [v13 setSelectedDate:*(void *)(a1 + 40)];
    uint64_t v14 = [v4 selectedTime];
    [v13 setSelectedTime:v14];

    id v15 = [v13 identifier];
    id v23 = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v3 reconfigureItemsWithIdentifiers:v16];
LABEL_9:
  }
}

- (void)timeCollectionViewCell:(id)a3 didChangeDate:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MFDatePickerViewController_timeCollectionViewCell_didChangeDate___block_invoke;
  v7[3] = &unk_1E5F7AB58;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v7);
}

void __67__MFDatePickerViewController_timeCollectionViewCell_didChangeDate___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _itemOfType:2];
  [v4 setSelectedTime:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(a1 + 32) type];
  if (!v5)
  {
    id v6 = [*(id *)(a1 + 32) _itemOfType:0];
    [v6 setSelectedTime:*(void *)(a1 + 40)];
    id v7 = [v6 identifier];
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v3 reconfigureItemsWithIdentifiers:v8];
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    id v6 = [*(id *)(a1 + 32) _itemOfType:4];
    [v6 setSelectedTime:*(void *)(a1 + 40)];
    id v7 = [v6 identifier];
    id v9 = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    [v3 reconfigureItemsWithIdentifiers:v8];
LABEL_5:
  }
}

- (void)datePickerTimeHeaderCollectionViewCell:(id)a3 showTime:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(MFDatePickerViewController *)self _itemOfType:4];
  [v6 setTimeSwitchEnabled:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__MFDatePickerViewController_datePickerTimeHeaderCollectionViewCell_showTime___block_invoke;
  v8[3] = &unk_1E5F7AB80;
  v8[4] = self;
  BOOL v10 = v4;
  id v7 = v6;
  id v9 = v7;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v8);
}

void __78__MFDatePickerViewController_datePickerTimeHeaderCollectionViewCell_showTime___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) _itemOfType:2];
  uint64_t v5 = v4;
  if (*(unsigned char *)(a1 + 48))
  {
    id v6 = [v4 identifier];
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v3 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:&unk_1F0841398];
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_tomorrowMorning");
    [*(id *)(a1 + 40) setSelectedTime:v8];

    id v6 = [v5 identifier];
    id v9 = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    [v3 deleteItemsWithIdentifiers:v7];
  }
}

- (void)timeZonePickerViewController:(id)a3 didSelectCity:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__MFDatePickerViewController_timeZonePickerViewController_didSelectCity___block_invoke;
  v7[3] = &unk_1E5F7AB58;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v7);
}

void __73__MFDatePickerViewController_timeZonePickerViewController_didSelectCity___block_invoke(uint64_t a1, void *a2)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) _itemOfType:0];
  [v4 setSelectedCity:*(void *)(a1 + 40)];
  [v4 setDatePickerComponentType:1];
  id v5 = [*(id *)(a1 + 32) _itemOfType:5];
  [v5 setSelectedCity:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 32) _itemOfType:2];
  [v6 setSelectedCity:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 32) _itemOfType:2];
  id v8 = [v5 identifier];
  id v9 = objc_msgSend(v4, "identifier", v8);
  v12[1] = v9;
  BOOL v10 = [v7 identifier];
  void v12[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  [v3 reconfigureItemsWithIdentifiers:v11];
}

- (MFDatePickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFDatePickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)shouldShowDeleteButton
{
  return self->_shouldShowDeleteButton;
}

- (void)setShouldShowDeleteButton:(BOOL)a3
{
  self->_shouldShowDeleteButton = a3;
}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (EFLocked)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (EFLocked)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
}

- (NSDate)initialDate
{
  return self->_initialDate;
}

- (void)setInitialDate:(id)a3
{
}

- (BOOL)timeSwitchEnabled
{
  return self->_timeSwitchEnabled;
}

- (void)setTimeSwitchEnabled:(BOOL)a3
{
  self->_timeSwitchEnabled = a3;
}

- (BOOL)shouldInvokeDelegate
{
  return self->_shouldInvokeDelegate;
}

- (void)setShouldInvokeDelegate:(BOOL)a3
{
  self->_shouldInvokeDelegate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end