@interface HUTimerCreationViewController
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HMRoom)selectedRoom;
- (HUTimerCreationDelegate)delegate;
- (HUTimerCreationViewController)initWithMediaProfileContainer:(id)a3;
- (HUTimerIntervalPickerView)timePickerView;
- (NSString)timerTitle;
- (UITextField)nameField;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (double)timerDuration;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)alarmEditSettingController:(id)a3 didEditAlarm:(id)a4;
- (void)cancelTimerCreation:(id)a3;
- (void)createTimer:(id)a3;
- (void)pickerView:(id)a3 didChangeSelectedDuration:(double)a4;
- (void)setDelegate:(id)a3;
- (void)setMediaProfileContainer:(id)a3;
- (void)setNameField:(id)a3;
- (void)setSelectedRoom:(id)a3;
- (void)setTimePickerView:(id)a3;
- (void)setTimerDuration:(double)a3;
- (void)setTimerTitle:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUTimerCreationViewController

- (HUTimerCreationViewController)initWithMediaProfileContainer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTimerCreationViewController;
  v6 = [(HUTimerCreationViewController *)&v11 initWithStyle:2];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaProfileContainer, a3);
    uint64_t v8 = objc_msgSend(v5, "hf_parentRoom");
    selectedRoom = v7->_selectedRoom;
    v7->_selectedRoom = (HMRoom *)v8;
  }
  return v7;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)HUTimerCreationViewController;
  [(HUTimerCreationViewController *)&v27 viewDidLoad];
  v3 = [(HUTimerCreationViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUTimerContainerCellIdentifier"];

  v4 = [HUTimerIntervalPickerView alloc];
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[HUTimerIntervalPickerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
  [(HUTimerCreationViewController *)self setTimePickerView:v9];

  v10 = [(HUTimerCreationViewController *)self timePickerView];
  [v10 setDelegate:self];

  [(HUTimerCreationViewController *)self setEdgesForExtendedLayout:0];
  objc_super v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42F10]), "initWithFrame:", v5, v6, v7, v8);
  [(HUTimerCreationViewController *)self setNameField:v11];

  v12 = _HULocalizedStringWithDefaultValue(@"HUTimerLabelPlaceholder", @"HUTimerLabelPlaceholder", 1);
  v13 = [(HUTimerCreationViewController *)self nameField];
  [v13 setPlaceholder:v12];

  v14 = [(HUTimerCreationViewController *)self nameField];
  [v14 setAutocapitalizationType:1];

  v15 = [(HUTimerCreationViewController *)self nameField];
  [v15 setClearButtonMode:1];

  v16 = [(HUTimerCreationViewController *)self nameField];
  [v16 setDelegate:self];

  v17 = _HULocalizedStringWithDefaultValue(@"HUNewTimer", @"HUNewTimer", 1);
  v18 = [(HUTimerCreationViewController *)self navigationItem];
  [v18 setTitle:v17];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_cancelTimerCreation_];
  v20 = [(HUTimerCreationViewController *)self navigationItem];
  [v20 setLeftBarButtonItem:v19];

  id v21 = objc_alloc(MEMORY[0x1E4F427C0]);
  v22 = _HULocalizedStringWithDefaultValue(@"HUStartTimer", @"HUStartTimer", 1);
  v23 = (void *)[v21 initWithTitle:v22 style:2 target:self action:sel_createTimer_];
  v24 = [(HUTimerCreationViewController *)self navigationItem];
  [v24 setRightBarButtonItem:v23];

  v25 = [(HUTimerCreationViewController *)self navigationItem];
  v26 = [v25 rightBarButtonItem];
  [v26 setEnabled:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 2)
  {
    _HULocalizedStringWithDefaultValue(@"HUTimerToneHeaderLabel", @"HUTimerToneHeaderLabel", 1);
    double v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v5 = &stru_1F18F92B8;
  }
  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithIdentifier:@"HUTimerContainerCellIdentifier" forIndexPath:v6];
  if (![v6 section])
  {
    v13 = [v7 contentView];
    v14 = [(HUTimerCreationViewController *)self nameField];
    [v13 addSubview:v14];

    v15 = [(HUTimerCreationViewController *)self nameField];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = (void *)MEMORY[0x1E4F28DC8];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v36[3] = &unk_1E638E568;
    v36[4] = self;
    id v17 = v7;
    id v37 = v17;
    v18 = __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke((uint64_t)v36);
    [v16 activateConstraints:v18];

    if ([MEMORY[0x1E4F69758] isProxHandOffV2Config])
    {
      v19 = [(HUTimerCreationViewController *)self nameField];
      [v19 setEnabled:0];

      v20 = [(HUTimerCreationViewController *)self nameField];
      [v20 setUserInteractionEnabled:0];

      id v21 = [MEMORY[0x1E4F428B8] systemGrayColor];
      v22 = [(HUTimerCreationViewController *)self nameField];
      [v22 setTextColor:v21];

      [v17 setSelectionStyle:0];
    }
    v23 = v37;
    goto LABEL_10;
  }
  if ([v6 section] != 1) {
    goto LABEL_11;
  }
  if (![v6 row])
  {
    v24 = [v7 contentView];
    v25 = [(HUTimerCreationViewController *)self timePickerView];
    [v24 addSubview:v25];

    v26 = [(HUTimerCreationViewController *)self timePickerView];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    objc_super v27 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    v33 = &unk_1E638E568;
    v34 = self;
    id v35 = v7;
    v28 = __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke_2((uint64_t)&v30);
    objc_msgSend(v27, "activateConstraints:", v28, v30, v31, v32, v33, v34);

    v23 = v35;
LABEL_10:

    goto LABEL_11;
  }
  if ([v6 row] == 1)
  {
    double v8 = _HULocalizedStringWithDefaultValue(@"HUAlarmPlayInLabel", @"HUAlarmPlayInLabel", 1);
    v9 = [v7 textLabel];
    [v9 setText:v8];

    v10 = [(HUTimerCreationViewController *)self selectedRoom];
    objc_super v11 = [v10 name];
    v12 = [v7 detailTextLabel];
    [v12 setText:v11];

    [v7 setAccessoryType:1];
  }
LABEL_11:

  return v7;
}

id __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) nameField];
  uint64_t v4 = [v3 leadingAnchor];
  double v5 = [*(id *)(a1 + 40) contentView];
  id v6 = [v5 leadingAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6 constant:10.0];
  [v2 addObject:v7];

  double v8 = [*(id *)(a1 + 32) nameField];
  v9 = [v8 trailingAnchor];
  v10 = [*(id *)(a1 + 40) contentView];
  objc_super v11 = [v10 trailingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v2 addObject:v12];

  v13 = [*(id *)(a1 + 32) nameField];
  v14 = [v13 bottomAnchor];
  v15 = [*(id *)(a1 + 40) contentView];
  v16 = [v15 bottomAnchor];
  id v17 = [v14 constraintEqualToAnchor:v16];
  [v2 addObject:v17];

  v18 = [*(id *)(a1 + 32) nameField];
  v19 = [v18 topAnchor];
  v20 = [*(id *)(a1 + 40) contentView];
  id v21 = [v20 topAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v2 addObject:v22];

  return v2;
}

id __65__HUTimerCreationViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) timePickerView];
  uint64_t v4 = [v3 leadingAnchor];
  double v5 = [*(id *)(a1 + 40) contentView];
  id v6 = [v5 leadingAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];
  [v2 addObject:v7];

  double v8 = [*(id *)(a1 + 32) timePickerView];
  v9 = [v8 trailingAnchor];
  v10 = [*(id *)(a1 + 40) contentView];
  objc_super v11 = [v10 trailingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v2 addObject:v12];

  v13 = [*(id *)(a1 + 32) timePickerView];
  v14 = [v13 bottomAnchor];
  v15 = [*(id *)(a1 + 40) contentView];
  v16 = [v15 bottomAnchor];
  id v17 = [v14 constraintEqualToAnchor:v16];
  [v2 addObject:v17];

  v18 = [*(id *)(a1 + 32) timePickerView];
  v19 = [v18 topAnchor];
  v20 = [*(id *)(a1 + 40) contentView];
  id v21 = [v20 topAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v2 addObject:v22];

  return v2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] == 1)
  {
    if ([v5 row])
    {
      double v6 = *MEMORY[0x1E4F43D18];
    }
    else
    {
      double v7 = [(HUTimerCreationViewController *)self timePickerView];
      [v7 bounds];
      double v6 = v8;
    }
  }
  else
  {
    double v6 = 44.0;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  if ([v10 section] == 1 && objc_msgSend(v10, "row") == 1)
  {
    id v5 = [HUAlarmEditSettingViewController alloc];
    double v6 = [(HUTimerCreationViewController *)self mediaProfileContainer];
    double v7 = [(HUTimerCreationViewController *)self selectedRoom];
    id v8 = [(HUAlarmEditSettingViewController *)v5 initPlayInSettingWithMediaProfileContainer:v6 selectedRoom:v7];

    [v8 setDelegate:self];
    [(HUTimerCreationViewController *)self preferredContentSize];
    objc_msgSend(v8, "setPreferredContentSize:");
    v9 = [(HUTimerCreationViewController *)self navigationController];
    [v9 pushViewController:v8 animated:1];
  }
}

- (void)textFieldDidChange:(id)a3
{
  id v5 = [a3 object];
  uint64_t v4 = [v5 text];
  [(HUTimerCreationViewController *)self setTimerTitle:v4];
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [v4 text];
  [(HUTimerCreationViewController *)self setTimerTitle:v5];

  [v4 resignFirstResponder];
  return 1;
}

- (void)pickerView:(id)a3 didChangeSelectedDuration:(double)a4
{
  [(HUTimerCreationViewController *)self setTimerDuration:a3];
  id v7 = [(HUTimerCreationViewController *)self navigationItem];
  double v6 = [v7 rightBarButtonItem];
  [v6 setEnabled:a4 > 0.0];
}

- (void)cancelTimerCreation:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    double v6 = "-[HUTimerCreationViewController cancelTimerCreation:]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%s(%@): Cancelling timer creation", (uint8_t *)&v5, 0x16u);
  }

  [(HUTimerCreationViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)alarmEditSettingController:(id)a3 didEditAlarm:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  int v5 = [a3 selectedRoom];
  [(HUTimerCreationViewController *)self setSelectedRoom:v5];

  double v6 = [MEMORY[0x1E4F28D58] indexPathForRow:1 inSection:1];
  __int16 v7 = [(HUTimerCreationViewController *)self tableView];
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v7 reloadRowsAtIndexPaths:v8 withRowAnimation:5];
}

- (void)createTimer:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    v22 = "-[HUTimerCreationViewController createTimer:]";
    __int16 v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%s(%@) done", (uint8_t *)&v21, 0x16u);
  }

  [(HUTimerCreationViewController *)self timerDuration];
  if (v5 > 0.0)
  {
    double v6 = [(HUTimerCreationViewController *)self nameField];
    int v7 = [v6 isEditing];

    if (v7)
    {
      id v8 = [(HUTimerCreationViewController *)self nameField];
      uint64_t v9 = [v8 text];
      [(HUTimerCreationViewController *)self setTimerTitle:v9];

      id v10 = [(HUTimerCreationViewController *)self nameField];
      [v10 endEditing:1];
    }
    id v11 = objc_alloc(MEMORY[0x1E4F78B68]);
    [(HUTimerCreationViewController *)self timerDuration];
    v12 = objc_msgSend(v11, "initWithState:duration:", 3);
    v13 = [(HUTimerCreationViewController *)self timerTitle];
    [v12 setTitle:v13];

    v14 = [MEMORY[0x1E4F78B70] toneSoundWithIdentifier:0 vibrationIdentifer:0 volume:0];
    [v12 setSound:v14];

    v15 = [(HUTimerCreationViewController *)self selectedRoom];
    v16 = [(HUTimerCreationViewController *)self mediaProfileContainer];
    objc_msgSend(v12, "hf_moveToRoom:withMediaProfileContainer:", v15, v16);

    id v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315650;
      v22 = "-[HUTimerCreationViewController createTimer:]";
      __int16 v23 = 2112;
      v24 = self;
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%s(%@): Creating timer %@", (uint8_t *)&v21, 0x20u);
    }

    v18 = [(HUTimerCreationViewController *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      v20 = [(HUTimerCreationViewController *)self delegate];
      [v20 timerCreationViewController:self didCreateTimer:v12];
    }
    [(HUTimerCreationViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (HUTimerCreationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUTimerCreationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setMediaProfileContainer:(id)a3
{
}

- (HUTimerIntervalPickerView)timePickerView
{
  return self->_timePickerView;
}

- (void)setTimePickerView:(id)a3
{
}

- (UITextField)nameField
{
  return self->_nameField;
}

- (void)setNameField:(id)a3
{
}

- (NSString)timerTitle
{
  return self->_timerTitle;
}

- (void)setTimerTitle:(id)a3
{
}

- (double)timerDuration
{
  return self->_timerDuration;
}

- (void)setTimerDuration:(double)a3
{
  self->_timerDuration = a3;
}

- (HMRoom)selectedRoom
{
  return self->_selectedRoom;
}

- (void)setSelectedRoom:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedRoom, 0);
  objc_storeStrong((id *)&self->_timerTitle, 0);
  objc_storeStrong((id *)&self->_nameField, 0);
  objc_storeStrong((id *)&self->_timePickerView, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end