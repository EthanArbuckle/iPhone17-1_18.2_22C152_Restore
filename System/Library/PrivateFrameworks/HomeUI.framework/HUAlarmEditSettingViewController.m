@interface HUAlarmEditSettingViewController
- (HMRoom)selectedRoom;
- (HUAlarmEditSettingViewController)initWithAlarm:(id)a3 setting:(int64_t)a4 mediaProfileContainer:(id)a5 selectedRoom:(id)a6 loggedInAppleMusicAccountDSID:(id)a7;
- (HUAlarmEditSettingViewControllerDelegate)delegate;
- (HUAlarmEditableTextCell)editingCell;
- (MTMutableAlarm)alarm;
- (NSMutableArray)roomsList;
- (NSString)loggedInAppleMusicAccountDSID;
- (UITableView)tableView;
- (id)initPlayInSettingWithMediaProfileContainer:(id)a3 selectedRoom:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)setting;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)firstWeekday;
- (unint64_t)repeatSchedule;
- (unsigned)maskForRow:(int64_t)a3;
- (void)_commonInitialization;
- (void)_dismiss;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setAlarm:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingCell:(id)a3;
- (void)setFirstWeekday:(unint64_t)a3;
- (void)setRepeatSchedule:(unint64_t)a3;
- (void)setRoomsList:(id)a3;
- (void)setSelectedRoom:(id)a3;
- (void)setSetting:(int64_t)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textValueChanged:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUAlarmEditSettingViewController

- (HUAlarmEditSettingViewController)initWithAlarm:(id)a3 setting:(int64_t)a4 mediaProfileContainer:(id)a5 selectedRoom:(id)a6 loggedInAppleMusicAccountDSID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HUAlarmEditSettingViewController;
  v16 = [(HUAlarmEditSettingViewController *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v15 copy];
    loggedInAppleMusicAccountDSID = v16->_loggedInAppleMusicAccountDSID;
    v16->_loggedInAppleMusicAccountDSID = (NSString *)v17;

    v16->_setting = a4;
    uint64_t v19 = [v12 mutableCopy];
    alarm = v16->_alarm;
    v16->_alarm = (MTMutableAlarm *)v19;

    objc_storeStrong((id *)&v16->_selectedRoom, a6);
    uint64_t v21 = objc_opt_new();
    roomsList = v16->_roomsList;
    v16->_roomsList = (NSMutableArray *)v21;

    if (v13 && v16->_setting == 3) {
      [(HUAlarmEditSettingViewController *)v16 _setupPlayInSettingWithMediaProfileContainer:v13];
    }
    [(HUAlarmEditSettingViewController *)v16 _commonInitialization];
  }

  return v16;
}

- (id)initPlayInSettingWithMediaProfileContainer:(id)a3 selectedRoom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUAlarmEditSettingViewController;
  v8 = [(HUAlarmEditSettingViewController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_setting = 3;
    objc_storeStrong((id *)&v8->_selectedRoom, a4);
    uint64_t v10 = objc_opt_new();
    roomsList = v9->_roomsList;
    v9->_roomsList = (NSMutableArray *)v10;

    [(HUAlarmEditSettingViewController *)v9 _setupPlayInSettingWithMediaProfileContainer:v6];
    [(HUAlarmEditSettingViewController *)v9 _commonInitialization];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HUAlarmEditSettingViewController;
  [(HUAlarmEditSettingViewController *)&v4 dealloc];
}

- (void)_commonInitialization
{
  int64_t setting = self->_setting;
  switch(setting)
  {
    case 3:
      objc_super v4 = @"HUAlarmPlayInLabel";
      goto LABEL_6;
    case 2:
      _HULocalizedStringWithDefaultValue(@"HUAlarmEditLabel", @"HUAlarmEditLabel", 1);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];
      [v6 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];

      uint64_t v5 = (uint64_t)v7;
      break;
    case 1:
      objc_super v4 = @"HUAlarmEditRepeat";
LABEL_6:
      uint64_t v5 = _HULocalizedStringWithDefaultValue(v4, v4, 1);
      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  id v8 = (id)v5;
  [(HUAlarmEditSettingViewController *)self setTitle:v5];
}

- (void)loadView
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v11 setAutoresizingMask:18];
  int64_t setting = self->_setting;
  if ((unint64_t)(setting - 1) <= 2)
  {
    if (setting == 3)
    {
      id v7 = (objc_class *)MEMORY[0x1E4F42E98];
    }
    else
    {
      if (setting == 1)
      {
        objc_super v4 = [(HUAlarmEditSettingViewController *)self alarm];
        self->_repeatSchedule = [v4 repeatSchedule];

        id v5 = objc_alloc(MEMORY[0x1E4F42E98]);
        id v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
LABEL_8:
        tableView = self->_tableView;
        self->_tableView = v6;

        [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"kHUAlarmEditSettingViewControllerTableViewCellIdentifier"];
        [(UITableView *)self->_tableView setAutoresizingMask:18];
        [(UITableView *)self->_tableView setDataSource:self];
        [(UITableView *)self->_tableView setDelegate:self];
        [v11 addSubview:self->_tableView];
        goto LABEL_9;
      }
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:self selector:sel__dismiss name:kHUEditAlarmTitleFinishedNotification object:0];

      id v7 = (objc_class *)HUCenteredCellUITableView;
    }
    id v9 = [v7 alloc];
    id v6 = (UITableView *)objc_msgSend(v9, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    goto LABEL_8;
  }
LABEL_9:
  [(HUAlarmEditSettingViewController *)self setView:v11];
}

- (void)viewWillAppear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)HUAlarmEditSettingViewController;
  [(HUAlarmEditSettingViewController *)&v20 viewWillAppear:a3];
  int64_t setting = self->_setting;
  if (setting == 1)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v18 = (void *)[v17 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v19 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v18 setLocale:v19];

    self->_firstWeekday = [v18 firstWeekday];
  }
  else if (setting == 2)
  {
    id v5 = [(HUAlarmEditSettingViewController *)self editingCell];

    if (!v5)
    {
      id v6 = objc_opt_new();
      [(HUAlarmEditSettingViewController *)self setEditingCell:v6];

      id v7 = [(HUAlarmEditSettingViewController *)self alarm];
      id v8 = [v7 title];
      id v9 = [(HUAlarmEditSettingViewController *)self editingCell];
      uint64_t v10 = [v9 textField];
      [v10 setText:v8];

      id v11 = [(HUAlarmEditSettingViewController *)self editingCell];
      id v12 = [v11 textField];
      [v12 setAutocapitalizationType:2];

      objc_super v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v14 = *MEMORY[0x1E4F43E28];
      id v15 = [(HUAlarmEditableTextCell *)self->_editingCell textField];
      [v13 addObserver:self selector:sel_textValueChanged_ name:v14 object:v15];
    }
    if ((HUIsPadIdiom() & 1) == 0 && ([MEMORY[0x1E4F69758] isProxHandOffV2Config] & 1) == 0)
    {
      v16 = [(HUAlarmEditableTextCell *)self->_editingCell textField];
      [v16 becomeFirstResponder];
    }
    if ([MEMORY[0x1E4F69758] isProxHandOffV2Config]) {
      [(HUAlarmEditableTextCell *)self->_editingCell setEnabled:0];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUAlarmEditSettingViewController;
  [(HUAlarmEditSettingViewController *)&v5 viewDidAppear:a3];
  if (self->_setting == 2
    && HUIsPadIdiom()
    && ([MEMORY[0x1E4F69758] isProxHandOffV2Config] & 1) == 0)
  {
    objc_super v4 = [(HUAlarmEditableTextCell *)self->_editingCell textField];
    [v4 becomeFirstResponder];
  }
}

- (void)viewDidUnload
{
  tableView = self->_tableView;
  self->_tableView = 0;

  v4.receiver = self;
  v4.super_class = (Class)HUAlarmEditSettingViewController;
  [(HUAlarmEditSettingViewController *)&v4 viewDidUnload];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HUAlarmEditSettingViewController;
  -[HUAlarmEditSettingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  if ((HUIsPadIdiom() & 1) == 0 && ([MEMORY[0x1E4F69758] isProxHandOffV2Config] & 1) == 0)
  {
    objc_super v5 = [(HUAlarmEditableTextCell *)self->_editingCell textField];
    [v5 becomeFirstResponder];
  }
}

- (void)_dismiss
{
  id v3 = [(HUAlarmEditSettingViewController *)self navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (void)_keyboardWillShow:(id)a3
{
  id v16 = a3;
  if (!HUIsPadIdiom()
    || ([(HUAlarmEditSettingViewController *)self traitCollection],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 horizontalSizeClass],
        v4,
        v5 != 2))
  {
    objc_super v6 = [v16 userInfo];
    id v7 = [v6 objectForKey:*MEMORY[0x1E4F43AF0]];
    [v7 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    -[UITableView setKeyboardFrame:](self->_tableView, "setKeyboardFrame:", v9, v11, v13, v15);
    [(UITableView *)self->_tableView layoutSubviews];
  }
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = a3;
  if (!HUIsPadIdiom()
    || ([(HUAlarmEditSettingViewController *)self traitCollection],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 horizontalSizeClass],
        v5,
        v6 != 2))
  {
    id v7 = [v4 userInfo];
    double v8 = [v7 objectForKey:*MEMORY[0x1E4F43AE8]];
    [v8 CGRectValue];
    double v10 = v9;

    double v11 = [v7 objectForKey:*MEMORY[0x1E4F43AF0]];
    [v11 CGRectValue];
    uint64_t v13 = v12;
    double v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;

    if (vabdd_f64(v15, v10) >= 1.0)
    {
      objc_super v20 = (void *)MEMORY[0x1E4F42FF0];
      uint64_t v21 = [v7 objectForKey:*MEMORY[0x1E4F43AA0]];
      [v21 floatValue];
      double v23 = v22;
      objc_super v24 = [v7 objectForKey:*MEMORY[0x1E4F43A98]];
      int v25 = [v24 intValue];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __54__HUAlarmEditSettingViewController__keyboardWillHide___block_invoke;
      v26[3] = &unk_1E638D568;
      v26[4] = self;
      v26[5] = v13;
      *(double *)&v26[6] = v15;
      v26[7] = v17;
      v26[8] = v19;
      [v20 animateWithDuration:v25 delay:v26 options:0 animations:v23 completion:0.0];
    }
  }
}

void __54__HUAlarmEditSettingViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  objc_msgSend(v2, "setKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  id v3 = [*(id *)(a1 + 32) tableView];
  [v3 layoutSubviews];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t setting = self->_setting;
  if (setting == 1) {
    return 7;
  }
  if (setting != 3) {
    return 1;
  }
  uint64_t v5 = [(HUAlarmEditSettingViewController *)self roomsList];
  int64_t v6 = [v5 count];

  return v6;
}

- (unsigned)maskForRow:(int64_t)a3
{
  return 1 << ((a3 + self->_firstWeekday + 5) % 7);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  int64_t setting = self->_setting;
  if (setting == 3)
  {
    double v11 = [v6 dequeueReusableCellWithIdentifier:@"kHUAlarmEditSettingViewControllerTableViewCellIdentifier"];
    uint64_t v16 = [(HUAlarmEditSettingViewController *)self roomsList];
    uint64_t v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
    uint64_t v18 = [v17 name];
    uint64_t v19 = [(HUAlarmEditableTextCell *)v11 textLabel];
    [v19 setText:v18];

    objc_super v20 = [(HUAlarmEditSettingViewController *)self selectedRoom];
    if (v20)
    {
      uint64_t v21 = [(HUAlarmEditSettingViewController *)self roomsList];
      float v22 = objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
      double v23 = [v22 uniqueIdentifier];
      objc_super v24 = [(HUAlarmEditSettingViewController *)self selectedRoom];
      int v25 = [v24 uniqueIdentifier];
      if (objc_msgSend(v23, "hmf_isEqualToUUID:", v25)) {
        uint64_t v26 = 3;
      }
      else {
        uint64_t v26 = 0;
      }
    }
    else
    {
      uint64_t v26 = 0;
    }

    [(HUAlarmEditableTextCell *)v11 setAccessoryType:v26];
  }
  else if (setting == 1)
  {
    unsigned int v10 = -[HUAlarmEditSettingViewController maskForRow:](self, "maskForRow:", [v7 row]);
    double v11 = [v6 dequeueReusableCellWithIdentifier:@"kHUAlarmEditSettingViewControllerTableViewCellIdentifier"];
    uint64_t v12 = DateMaskToString();
    uint64_t v13 = [(HUAlarmEditableTextCell *)v11 textLabel];
    [v13 setText:v12];

    double v14 = [(HUAlarmEditSettingViewController *)self alarm];
    if (([v14 repeatSchedule] & v10) != 0) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 0;
    }
    [(HUAlarmEditableTextCell *)v11 setAccessoryType:v15];
  }
  else
  {
    double v11 = self->_editingCell;
  }
  v27 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_alarmsPrimaryTextColor");
  v28 = [(HUAlarmEditableTextCell *)v11 textLabel];
  [v28 setTextColor:v27];

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  if (v6)
  {
    int64_t setting = self->_setting;
    if (setting == 3)
    {
      [v24 deselectRowAtIndexPath:v6 animated:1];
      uint64_t v12 = [(HUAlarmEditSettingViewController *)self selectedRoom];

      if (v12)
      {
        uint64_t v13 = [(HUAlarmEditSettingViewController *)self roomsList];
        double v14 = [(HUAlarmEditSettingViewController *)self selectedRoom];
        uint64_t v15 = [v13 indexOfObject:v14];

        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = [MEMORY[0x1E4F28D58] indexPathForRow:v15 inSection:0];
          uint64_t v17 = [v24 cellForRowAtIndexPath:v16];

          [v17 setAccessoryType:0];
        }
      }
      double v8 = [v24 cellForRowAtIndexPath:v6];
      [v8 setAccessoryType:3];
      uint64_t v18 = [(HUAlarmEditSettingViewController *)self roomsList];
      uint64_t v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      [(HUAlarmEditSettingViewController *)self setSelectedRoom:v19];
    }
    else
    {
      if (setting != 1) {
        goto LABEL_16;
      }
      double v8 = [v24 cellForRowAtIndexPath:v6];
      if ([v8 accessoryType] == 3) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = 3;
      }
      [v8 setAccessoryType:v9];
      [v24 deselectRowAtIndexPath:v6 animated:1];
      unsigned int v10 = -[HUAlarmEditSettingViewController maskForRow:](self, "maskForRow:", [v6 row]);
      if ([v8 accessoryType] == 3) {
        unint64_t v11 = [(HUAlarmEditSettingViewController *)self repeatSchedule] | v10;
      }
      else {
        unint64_t v11 = [(HUAlarmEditSettingViewController *)self repeatSchedule] & ~v10;
      }
      [(HUAlarmEditSettingViewController *)self setRepeatSchedule:v11];
      unint64_t v20 = [(HUAlarmEditSettingViewController *)self repeatSchedule];
      uint64_t v21 = [(HUAlarmEditSettingViewController *)self alarm];
      [v21 setRepeatSchedule:v20];
    }
    float v22 = [(HUAlarmEditSettingViewController *)self delegate];
    double v23 = [(HUAlarmEditSettingViewController *)self alarm];
    [v22 alarmEditSettingController:self didEditAlarm:v23];
  }
LABEL_16:
}

- (void)textValueChanged:(id)a3
{
  id v12 = [a3 object];
  id v4 = [v12 text];
  uint64_t v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  uint64_t v7 = [v6 length];
  if (v7)
  {
    double v8 = [v12 text];
  }
  else
  {
    double v8 = 0;
  }
  uint64_t v9 = [(HUAlarmEditSettingViewController *)self alarm];
  [v9 setTitle:v8];

  if (v7) {
  unsigned int v10 = [(HUAlarmEditSettingViewController *)self delegate];
  }
  unint64_t v11 = [(HUAlarmEditSettingViewController *)self alarm];
  [v10 alarmEditSettingController:self didEditAlarm:v11];
}

- (HUAlarmEditSettingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAlarmEditSettingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)loggedInAppleMusicAccountDSID
{
  return self->_loggedInAppleMusicAccountDSID;
}

- (HMRoom)selectedRoom
{
  return self->_selectedRoom;
}

- (void)setSelectedRoom:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (HUAlarmEditableTextCell)editingCell
{
  return self->_editingCell;
}

- (void)setEditingCell:(id)a3
{
}

- (int64_t)setting
{
  return self->_setting;
}

- (void)setSetting:(int64_t)a3
{
  self->_int64_t setting = a3;
}

- (unint64_t)firstWeekday
{
  return self->_firstWeekday;
}

- (void)setFirstWeekday:(unint64_t)a3
{
  self->_firstWeekday = a3;
}

- (unint64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (void)setRepeatSchedule:(unint64_t)a3
{
  self->_repeatSchedule = a3;
}

- (NSMutableArray)roomsList
{
  return self->_roomsList;
}

- (void)setRoomsList:(id)a3
{
}

- (MTMutableAlarm)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarm, 0);
  objc_storeStrong((id *)&self->_roomsList, 0);
  objc_storeStrong((id *)&self->_editingCell, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_selectedRoom, 0);
  objc_storeStrong((id *)&self->_loggedInAppleMusicAccountDSID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end