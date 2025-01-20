@interface HUAlarmEditViewController
+ (CGSize)desiredContentSize;
- (BOOL)_hasUserSelectedToneAlarm;
- (BOOL)_isAlarmTypeMedia;
- (BOOL)_isMusicAlarmSupportedInAccessory;
- (BOOL)_isNewAlarm;
- (BOOL)_shouldDisablePlayMedia;
- (BOOL)accessorySupportsMusicAlarm;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isCustomVolumeSelected;
- (BOOL)isDatePickerWheelScrolled;
- (BOOL)isEdited;
- (BOOL)isPlayMediaSelected;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HFPlaybackArchive)hfPlaybackArchive;
- (HMRoom)selectedRoom;
- (HUAlarmEditView)editAlarmView;
- (HUAlarmEditViewController)initWithMediaProfileContainer:(id)a3 alarm:(id)a4;
- (HUAlarmEditViewControllerDelegate)delegate;
- (MTAlarm)originalAlarm;
- (MTMutableAlarm)editedAlarm;
- (NSDateComponents)currentDatePickerTimeComponents;
- (NSMutableDictionary)appleMusicSubcriptionResult;
- (NSSet)selectedActionSets;
- (NSString)loggedInAppleMusicAccountDSID;
- (NSURLSessionDataTask)artworkFetchTask;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)_volumeSettingForCurrentEditingAlarm;
- (double)selectedCustomVolumeLevel;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_configureSoundForMediaTypeAlarm:(id)a3;
- (id)_dateComponents;
- (id)_datePickerCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_deleteAlarmButtonCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_mediaPropertiesTypeCellForTableView:(id)a3 atIndexpath:(id)a4;
- (id)_setupCell:(id)a3 forTableView:(id)a4 indexPath:(id)a5;
- (id)_volumeIconMaximum;
- (id)_volumeIconMinimum;
- (id)_volumeSliderCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_volumeTypeCellForTableView:(id)a3 atIndexpath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)editingAlarmSetting;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelButtonClicked:(id)a3;
- (void)_checkAndPrepareEditingAlarmForMediaTypeAlarm;
- (void)_chooseMediaTapped;
- (void)_configureMediaIconView:(id)a3 withImage:(id)a4;
- (void)_didTap:(id)a3;
- (void)_doneButtonClicked:(id)a3;
- (void)_handlePickerChanged;
- (void)_loadArtworkForMediaAlarm;
- (void)_presentMediaPickerUnavailablePromptWithReason:(int64_t)a3 storeKitErrorObject:(id)a4;
- (void)_presentMediaPickerWithOptionsShowsLibraryContent:(BOOL)a3;
- (void)_updateAppleMusicSubscriptionStatus;
- (void)_updateCellForTableView:(id)a3 indexPath:(id)a4;
- (void)_updateEnableStateForDoneButton:(BOOL)a3;
- (void)alarmEditSettingController:(id)a3 didEditAlarm:(id)a4;
- (void)datePickerCell:(id)a3 didSelectDate:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4;
- (void)mediaPickerDidCancel:(id)a3;
- (void)mediaPickerDidPickPlaybackArchive:(id)a3;
- (void)saveAlarmOnlyIfEdited:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setAccessorySupportsMusicAlarm:(BOOL)a3;
- (void)setAppleMusicSubcriptionResult:(id)a3;
- (void)setArtworkFetchTask:(id)a3;
- (void)setCurrentDatePickerTimeComponents:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditAlarmView:(id)a3;
- (void)setEditedAlarm:(id)a3;
- (void)setEditingAlarmSetting:(int64_t)a3;
- (void)setHfPlaybackArchive:(id)a3;
- (void)setIsCustomVolumeSelected:(BOOL)a3;
- (void)setIsDatePickerWheelScrolled:(BOOL)a3;
- (void)setIsPlayMediaSelected:(BOOL)a3;
- (void)setLoggedInAppleMusicAccountDSID:(id)a3;
- (void)setMediaProfileContainer:(id)a3;
- (void)setOriginalAlarm:(id)a3;
- (void)setSelectedCustomVolumeLevel:(double)a3;
- (void)setSelectedRoom:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4;
- (void)startEditingSetting:(int64_t)a3;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUAlarmEditViewController

+ (CGSize)desiredContentSize
{
  double v2 = 320.0;
  double v3 = 509.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (HUAlarmEditViewController)initWithMediaProfileContainer:(id)a3 alarm:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v45.receiver = self;
  v45.super_class = (Class)HUAlarmEditViewController;
  v9 = [(HUAlarmEditViewController *)&v45 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProfileContainer, a3);
    v10->_accessorySupportsMusicAlarm = [(HUAlarmEditViewController *)v10 _isMusicAlarmSupportedInAccessory];
    v10->_isCustomVolumeSelected = 0;
    v10->_isDatePickerWheelScrolled = 0;
    objc_storeStrong((id *)&v10->_originalAlarm, a4);
    v11 = objc_msgSend(v7, "hf_parentRoom");
    objc_storeStrong((id *)&v10->_selectedRoom, v11);
    if (v8)
    {
      uint64_t v12 = [v8 mutableCopy];
      editedAlarm = v10->_editedAlarm;
      v10->_editedAlarm = (MTMutableAlarm *)v12;

      v14 = _HULocalizedStringWithDefaultValue(@"HUAlarmEdit", @"HUAlarmEdit", 1);
      if ([(HUAlarmEditViewController *)v10 accessorySupportsMusicAlarm]
        && v10->_editedAlarm)
      {
        [(HUAlarmEditViewController *)v10 _checkAndPrepareEditingAlarmForMediaTypeAlarm];
      }
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F78B58] alarm];
      v16 = v10->_editedAlarm;
      v10->_editedAlarm = (MTMutableAlarm *)v15;

      v14 = _HULocalizedStringWithDefaultValue(@"HUCreateNewAlarm", @"HUCreateNewAlarm", 1);
      v17 = [(HUAlarmEditViewController *)v10 mediaProfileContainer];
      v18 = [v17 mediaProfiles];
      v19 = +[HUMediaAccountUtilities defaultCurrentVolumeForMediaProfiles:v18];
      [v19 floatValue];
      [(HUAlarmEditViewController *)v10 setSelectedCustomVolumeLevel:v20];
    }
    if (_os_feature_enabled_impl())
    {
      v21 = [(MTMutableAlarm *)v10->_editedAlarm siriContext];
      uint64_t v22 = *MEMORY[0x1E4F5AEC0];
      v23 = [v21 objectForKey:*MEMORY[0x1E4F5AEC0]];

      if (!v23)
      {
        v44 = v11;
        if (v21) {
          id v24 = (id)[v21 mutableCopy];
        }
        else {
          id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        v25 = v24;
        v26 = objc_msgSend(v7, "accessories", 1032);
        v27 = [v26 anyObject];
        v28 = COAlarmSiriContextTargetReferenceForAccessory();
        [v25 setObject:v28 forKey:v22];

        [*(id *)((char *)&v10->super.super.super.isa + v43) setSiriContext:v25];
        v11 = v44;
      }
    }
    v10->_editingAlarmSetting = -1;
    [(HUAlarmEditViewController *)v10 setTitle:v14];
    v29 = _HULocalizedStringWithDefaultValue(@"HUAlarmBack", @"HUAlarmBack", 1);
    v30 = [(HUAlarmEditViewController *)v10 navigationItem];
    [v30 setBackButtonTitle:v29];

    [(HUAlarmEditViewController *)v10 setEdgesForExtendedLayout:0];
    v31 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:v10 action:sel__cancelButtonClicked_];
    v32 = [(HUAlarmEditViewController *)v10 navigationItem];
    [v32 setLeftBarButtonItem:v31];

    LODWORD(v31) = [(HUAlarmEditViewController *)v10 accessorySupportsMusicAlarm];
    id v33 = objc_alloc(MEMORY[0x1E4F427C0]);
    if (v31)
    {
      v34 = (void *)[v33 initWithBarButtonSystemItem:0 target:v10 action:sel__doneButtonClicked_];
      v35 = [(HUAlarmEditViewController *)v10 navigationItem];
      [v35 setRightBarButtonItem:v34];

      if ([(HUAlarmEditViewController *)v10 _isNewAlarm]
        || ![(HUAlarmEditViewController *)v10 _isAlarmTypeMedia])
      {
        uint64_t v36 = [(HUAlarmEditViewController *)v10 _hasUserSelectedToneAlarm];
      }
      else
      {
        uint64_t v36 = [(HUAlarmEditViewController *)v10 _isAlarmTypeMedia];
      }
      [(HUAlarmEditViewController *)v10 _updateEnableStateForDoneButton:v36];
    }
    else
    {
      v37 = (void *)[v33 initWithBarButtonSystemItem:3 target:v10 action:sel__doneButtonClicked_];
      v38 = [(HUAlarmEditViewController *)v10 navigationItem];
      [v38 setRightBarButtonItem:v37];
    }
    if ((HUIsPhoneIdiom() & 1) == 0)
    {
      [(id)objc_opt_class() desiredContentSize];
      -[HUAlarmEditViewController setPreferredContentSize:](v10, "setPreferredContentSize:");
    }
    uint64_t v39 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v10 action:sel__didTap_];
    tapGestureRecognizer = v10->_tapGestureRecognizer;
    v10->_tapGestureRecognizer = (UITapGestureRecognizer *)v39;

    v41 = [(HUAlarmEditViewController *)v10 view];
    [v41 addGestureRecognizer:v10->_tapGestureRecognizer];

    [(UITapGestureRecognizer *)v10->_tapGestureRecognizer setDelegate:v10];
  }

  return v10;
}

- (void)dealloc
{
  [(NSURLSessionDataTask *)self->_artworkFetchTask cancel];
  double v3 = [(HUAlarmEditView *)self->_editAlarmView timePicker];
  [v3 removeTarget:self action:sel__handlePickerChanged forControlEvents:4096];

  v4.receiver = self;
  v4.super_class = (Class)HUAlarmEditViewController;
  [(HUAlarmEditViewController *)&v4 dealloc];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUAlarmEditViewController;
  [(HUAlarmEditViewController *)&v9 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  id v7 = [(HUAlarmEditViewController *)self traitCollection];
  if ([v7 horizontalSizeClass] == 1
    && [v6 horizontalSizeClass] == 2
    && [v6 verticalSizeClass] == 2)
  {
    char v8 = [MEMORY[0x1E4F69758] isAMac];

    if ((v8 & 1) == 0) {
      [(HUAlarmEditViewController *)self saveAlarmOnlyIfEdited:1];
    }
  }
  else
  {
  }
}

- (void)_didTap:(id)a3
{
  id v3 = [(HUAlarmEditViewController *)self view];
  [v3 endEditing:1];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    objc_super v9 = [v7 view];
    v10 = [v9 superview];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      BOOL v13 = 1;
      goto LABEL_6;
    }
  }
  id v12 = [(HUAlarmEditViewController *)self tapGestureRecognizer];
  BOOL v13 = v12 != v6;

LABEL_6:
  return v13;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(HUAlarmEditViewController *)self view];
  [v3 endEditing:1];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = [(HUAlarmEditViewController *)self view];
  [v3 endEditing:1];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (HUIsVeryWidePhoneSize()) {
    return 30;
  }
  if (HUIsPadIdiom()) {
    return 30;
  }
  return 2;
}

- (void)loadView
{
  id v3 = [HUAlarmEditView alloc];
  objc_super v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  objc_super v9 = -[HUAlarmEditView initWithFrame:supportsMusicAlarm:](v3, "initWithFrame:supportsMusicAlarm:", [(HUAlarmEditViewController *)self accessorySupportsMusicAlarm], v5, v6, v7, v8);
  editAlarmView = self->_editAlarmView;
  self->_editAlarmView = v9;

  [(HUAlarmEditView *)self->_editAlarmView setAutoresizingMask:16];
  v11 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
  [v11 setDataSource:self];

  id v12 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
  [v12 setDelegate:self];

  double v13 = *MEMORY[0x1E4F43D18];
  v14 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
  [v14 setRowHeight:v13];

  uint64_t v15 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
  [v15 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUAlarmEditViewControllerTableViewCellIdentifier"];

  v16 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
  [v16 _setDisplaysCellContentStringsOnTapAndHold:1];

  if (HUIsPadIdiom()) {
    [(HUAlarmEditView *)self->_editAlarmView setAutoresizingMask:18];
  }
  v17 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
  id v18 = objc_alloc(MEMORY[0x1E4F42FF0]);
  v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v17 setTableFooterView:v19];

  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    float v20 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
    [v20 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUSnoozeSwitchCellReuseIdentifier"];

    v21 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
    [v21 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUVolumeSliderCellReuseIdentifier"];

    uint64_t v22 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
    [v22 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUChooseMediahCellReuseIdentifier"];

    v23 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
    [v23 registerClass:objc_opt_class() forCellReuseIdentifier:@"HURepeatMusicSwitchCellReuseIdentifier"];

    id v24 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
    [v24 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUShuffleMusicSwitchCellReuseIdentifier"];

    v25 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
    uint64_t v26 = objc_opt_class();
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    [v25 registerClass:v26 forCellReuseIdentifier:v28];

    v29 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
    [v29 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUPlayToneCellIdentifier"];

    v30 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
    [v30 registerClass:objc_opt_class() forCellReuseIdentifier:@"HUPlayMediaCellIdentifier"];

    [(HUAlarmEditViewController *)self _updateAppleMusicSubscriptionStatus];
  }
  else
  {
    id v31 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    v32 = [(HUAlarmEditViewController *)self editedAlarm];
    objc_msgSend(v31, "setHour:", objc_msgSend(v32, "hour"));

    id v33 = [(HUAlarmEditViewController *)self editedAlarm];
    objc_msgSend(v31, "setMinute:", objc_msgSend(v33, "minute"));

    v34 = [(HUAlarmEditView *)self->_editAlarmView timePicker];
    v35 = [(HUAlarmEditView *)self->_editAlarmView timePicker];
    uint64_t v36 = [v35 calendar];
    v37 = [v36 dateFromComponents:v31];
    [v34 setDate:v37];

    v38 = [(HUAlarmEditView *)self->_editAlarmView timePicker];
    [v38 addTarget:self action:sel__handlePickerChanged forControlEvents:4096];
  }
  uint64_t v39 = self->_editAlarmView;

  [(HUAlarmEditViewController *)self setView:v39];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUAlarmEditViewController;
  [(HUAlarmEditViewController *)&v8 viewWillAppear:a3];
  self->_editingAlarmSetting = -1;
  objc_super v4 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
  [v4 reloadData];

  double v5 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
  double v6 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
  double v7 = [v6 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v7 animated:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(HUAlarmEditViewController *)self delegate];
  [v5 alarmEditControllerGettingDismissed:self];

  v6.receiver = self;
  v6.super_class = (Class)HUAlarmEditViewController;
  [(HUAlarmEditViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidUnload
{
  editAlarmView = self->_editAlarmView;
  self->_editAlarmView = 0;

  v4.receiver = self;
  v4.super_class = (Class)HUAlarmEditViewController;
  [(HUAlarmEditViewController *)&v4 viewDidUnload];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    BOOL v4 = [(HUAlarmEditViewController *)self _isNewAlarm];
    BOOL v5 = [(HUAlarmEditViewController *)self _isAlarmTypeMedia];
    if (v4)
    {
      BOOL v6 = [(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm];
      if (v5)
      {
        if (v6) {
          return 6;
        }
        if ([(HUAlarmEditViewController *)self _isAlarmTypeMedia])
        {
          if (![(HUAlarmEditViewController *)self _isAlarmTypeMedia]) {
            goto LABEL_27;
          }
          return 6;
        }
        return 3;
      }
      if (!v6)
      {
        if (![(HUAlarmEditViewController *)self _isAlarmTypeMedia])
        {
LABEL_27:
          int v9 = [(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume];
LABEL_28:
          BOOL v10 = v9 == 0;
          int64_t v11 = 4;
          goto LABEL_30;
        }
        return 0;
      }
    }
    else
    {
      char v8 = [MEMORY[0x1E4F69758] isAMac];
      if (v5)
      {
        if ((v8 & 1) == 0)
        {
          if ((HUIsPadIdiom() & 1) == 0)
          {
            BOOL v10 = ![(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume];
            int64_t v11 = 6;
LABEL_30:
            if (v10) {
              return v11;
            }
            else {
              return v11 + 1;
            }
          }
          return 6;
        }
        return 3;
      }
      if ((v8 & 1) == 0
        && (!HUIsPadIdiom()
         || ![(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm]))
      {
        if ([(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm]
          || [(HUAlarmEditViewController *)self _isNewAlarm])
        {
          return 3;
        }
        if (![(HUAlarmEditViewController *)self _isAlarmTypeMedia])
        {
          BOOL v12 = [(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume];
          int v9 = HUIsPhoneIdiom();
          if (!v12) {
            goto LABEL_28;
          }
          if (!v9 || [(HUAlarmEditViewController *)self _isNewAlarm]) {
            return 5;
          }
          return 6;
        }
        return 0;
      }
    }
    return 2;
  }
  if (HUIsPadIdiom()) {
    return 1;
  }
  if ([(HUAlarmEditViewController *)self _isNewAlarm]) {
    return 1;
  }
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    int64_t result = 3;
    switch(a4)
    {
      case 0:
        return result;
      case 1:
        goto LABEL_3;
      case 2:
        if ([(HUAlarmEditViewController *)self _isNewAlarm]
          && ![(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm])
        {
          if (![(HUAlarmEditViewController *)self _isAlarmTypeMedia]) {
            goto LABEL_38;
          }
          if ([MEMORY[0x1E4F69758] isAMac]) {
            int64_t result = 0;
          }
          else {
            int64_t result = 2;
          }
        }
        else
        {
          if ([(HUAlarmEditViewController *)self _isNewAlarm]
            || [(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm])
          {
            if (![(HUAlarmEditViewController *)self _isNewAlarm]
              && [(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm])
            {
              return HUIsPhoneIdiom();
            }
            goto LABEL_32;
          }
          if ([MEMORY[0x1E4F69758] isAMac]) {
            goto LABEL_38;
          }
          if ([(HUAlarmEditViewController *)self _isAlarmTypeMedia]) {
            int64_t result = 2;
          }
          else {
            int64_t result = 1;
          }
        }
        break;
      case 3:
        if ([(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm]
          || ![(HUAlarmEditViewController *)self _isNewAlarm]
          && (![(HUAlarmEditViewController *)self _isAlarmTypeMedia]
           || [(HUAlarmEditViewController *)self _isNewAlarm])
          && ([(HUAlarmEditViewController *)self _isAlarmTypeMedia]
           || [(HUAlarmEditViewController *)self _isNewAlarm]))
        {
          goto LABEL_32;
        }
        goto LABEL_3;
      case 4:
        if (![(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm]
          && [(HUAlarmEditViewController *)self _isAlarmTypeMedia])
        {
LABEL_3:
          int64_t result = 2;
        }
        else if (([(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm] {
                || ![(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume])
        }
               && ([(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm]
                || [(HUAlarmEditViewController *)self _isNewAlarm]))
        {
LABEL_32:
          int64_t result = 0;
        }
        else
        {
LABEL_38:
          int64_t result = 1;
        }
        break;
      case 5:
        if (([(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm]
           || ![(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume])
          && ([(HUAlarmEditViewController *)self _isNewAlarm] || (HUIsPhoneIdiom() & 1) == 0))
        {
          goto LABEL_32;
        }
        goto LABEL_38;
      case 6:
        return HUIsPhoneIdiom();
      default:
        goto LABEL_32;
    }
  }
  else if (a4)
  {
    return 1;
  }
  else
  {
    return 2;
  }
  return result;
}

- (id)_setupCell:(id)a3 forTableView:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 row];
  switch([v10 section])
  {
    case 0:
      BOOL v12 = [v8 detailTextLabel];
      [v12 setAdjustsFontSizeToFitWidth:0];

      double v13 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_alarmsPrimaryTextColor");
      v14 = [v8 textLabel];
      [v14 setTextColor:v13];

      switch(v11)
      {
        case 0:
          id v15 = [(HUAlarmEditViewController *)self _datePickerCellForTableView:v9 atIndexPath:v10];
          goto LABEL_48;
        case 1:
          v47 = _HULocalizedStringWithDefaultValue(@"HUAlarmEditRepeat", @"HUAlarmEditRepeat", 1);
          v48 = [v8 textLabel];
          [v48 setText:v47];

          v49 = [v8 detailTextLabel];
          [v49 setAdjustsFontSizeToFitWidth:1];

          v50 = [v8 detailTextLabel];
          [v50 setMinimumScaleFactor:0.705882353];

          v51 = [(HUAlarmEditViewController *)self editedAlarm];
          [v51 repeatSchedule];
          uint64_t v52 = DateMaskToString();
          goto LABEL_37;
        case 2:
          v53 = _HULocalizedStringWithDefaultValue(@"HUAlarmEditLabel", @"HUAlarmEditLabel", 1);
          v54 = [v8 textLabel];
          [v54 setText:v53];

          v51 = [(HUAlarmEditViewController *)self editedAlarm];
          uint64_t v52 = [v51 displayTitle];
          goto LABEL_37;
        case 3:
          v55 = _HULocalizedStringWithDefaultValue(@"HUAlarmPlayInLabel", @"HUAlarmPlayInLabel", 1);
          v56 = [v8 textLabel];
          [v56 setText:v55];

          v51 = [(HUAlarmEditViewController *)self selectedRoom];
          uint64_t v52 = [v51 name];
LABEL_37:
          v57 = (void *)v52;
          v58 = [v8 detailTextLabel];
          [v58 setText:v57];

          [v8 setAccessoryType:1];
          break;
        default:
          goto LABEL_38;
      }
      goto LABEL_38;
    case 1:
      v16 = [v8 detailTextLabel];
      [v16 setAdjustsFontSizeToFitWidth:0];

      v17 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_alarmsPrimaryTextColor");
      id v18 = [v8 textLabel];
      [v18 setTextColor:v17];

      if (v11 == 1)
      {
        v19 = [v9 dequeueReusableCellWithIdentifier:@"HUPlayMediaCellIdentifier" forIndexPath:v10];

        uint64_t v43 = _HULocalizedStringWithDefaultValue(@"HUAlarmPlayMedia", @"HUAlarmPlayMedia", 1);
        v44 = [v19 textLabel];
        [v44 setText:v43];

        if ([(HUAlarmEditViewController *)self _shouldDisablePlayMedia])
        {
          objc_super v45 = [MEMORY[0x1E4F428B8] systemGrayColor];
          v46 = [v19 textLabel];
          [v46 setTextColor:v45];

          if ([(HUAlarmEditViewController *)self _isNewAlarm])
          {
            [v19 setUserInteractionEnabled:0];
          }
          else
          {
            v69 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
            [v19 setUserInteractionEnabled:v69 != 0];
          }
        }
        if (![(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm])
        {
LABEL_10:
          uint64_t v22 = v19;
          uint64_t v23 = 3;
          goto LABEL_45;
        }
      }
      else
      {
        if (v11)
        {
          v19 = v8;
          goto LABEL_46;
        }
        v19 = [v9 dequeueReusableCellWithIdentifier:@"HUPlayToneCellIdentifier" forIndexPath:v10];

        float v20 = _HULocalizedStringWithDefaultValue(@"HUAlarmPlayTone", @"HUAlarmPlayTone", 1);
        v21 = [v19 textLabel];
        [v21 setText:v20];

        if ([(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm]) {
          goto LABEL_10;
        }
      }
      uint64_t v22 = v19;
      uint64_t v23 = 0;
LABEL_45:
      [v22 setAccessoryType:v23];
LABEL_46:
      id v15 = v19;
LABEL_47:
      id v8 = v15;
LABEL_48:
      id v24 = v15;
LABEL_49:

      return v24;
    case 2:
      if ([(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm]) {
        goto LABEL_33;
      }
      id v24 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:3 reuseIdentifier:@"HUChooseMediahCellReuseIdentifier"];
      v25 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_alarmsPrimaryTextColor");
      uint64_t v26 = [v24 textLabel];
      [v26 setTextColor:v25];

      if (v11 == 1)
      {
        v59 = _HULocalizedStringWithDefaultValue(@"HUAlarmEditAlarmChooseMedia", @"HUAlarmEditAlarmChooseMedia", 1);
        v60 = [v24 textLabel];
        [v60 setText:v59];

        v61 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
        v62 = [v24 textLabel];
        [v62 setTextColor:v61];

        v63 = [v24 imageView];
        [v63 setImage:0];
      }
      else if (!v11)
      {
        if ([(HUAlarmEditViewController *)self _isAlarmTypeMedia])
        {
          v27 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
          v28 = [v27 mediaPlayerPlaybackArchive];
          v29 = [v28 displayProperties];
          v30 = [v29 title];
          id v31 = [v24 textLabel];
          [v31 setText:v30];

          v32 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
          id v33 = [v32 mediaPlayerPlaybackArchive];
          v34 = [v33 displayProperties];
          v35 = [v34 subtitle];
          uint64_t v36 = [v24 detailTextLabel];
          [v36 setText:v35];

          v37 = [v24 detailTextLabel];
          [v37 setAdjustsFontSizeToFitWidth:1];

          v38 = [v24 detailTextLabel];
          [v38 setMinimumScaleFactor:0.705882353];

          uint64_t v39 = (void *)MEMORY[0x1E4F42A80];
          v40 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
          v41 = [v40 artworkImageData];
          v42 = [v39 imageWithData:v41];

          [(HUAlarmEditViewController *)self _configureMediaIconView:v24 withImage:v42];
          [v24 setUserInteractionEnabled:0];
        }
        else
        {
          [v24 setUserInteractionEnabled:1];
          v64 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
          v65 = [v24 textLabel];
          [v65 setTextColor:v64];

          v66 = [v24 imageView];
          [v66 setImage:0];

          v67 = _HULocalizedStringWithDefaultValue(@"HUAlarmEditAlarmChooseMedia", @"HUAlarmEditAlarmChooseMedia", 1);
          v68 = [v24 textLabel];
          [v68 setText:v67];

          v42 = [v24 detailTextLabel];
          [v42 setText:0];
        }

        [v24 setAccessoryView:0];
      }
      goto LABEL_49;
    case 3:
      if (![(HUAlarmEditViewController *)self _isAlarmTypeMedia]
        || [(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm])
      {
        goto LABEL_20;
      }
      id v15 = [(HUAlarmEditViewController *)self _mediaPropertiesTypeCellForTableView:v9 atIndexpath:v10];
      goto LABEL_48;
    case 4:
      if (![(HUAlarmEditViewController *)self _isAlarmTypeMedia]
        && ![(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm])
      {
        if ([(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume])
        {
LABEL_32:
          id v15 = [(HUAlarmEditViewController *)self _volumeSliderCellForTableView:v9 atIndexPath:v10];
        }
        else
        {
LABEL_33:
          id v15 = [(HUAlarmEditViewController *)self _deleteAlarmButtonCellForTableView:v9 atIndexPath:v10];
        }
        goto LABEL_48;
      }
      if ([(HUAlarmEditViewController *)self _isAlarmTypeMedia]
        && ![(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm])
      {
LABEL_20:
        id v15 = [(HUAlarmEditViewController *)self _volumeTypeCellForTableView:v9 atIndexpath:v10];
        goto LABEL_48;
      }
LABEL_38:
      id v15 = v8;
      goto LABEL_47;
    case 5:
      if ([(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume]
        && [(HUAlarmEditViewController *)self _isAlarmTypeMedia])
      {
        goto LABEL_32;
      }
      if ([(HUAlarmEditViewController *)self _isNewAlarm]
        && ![(HUAlarmEditViewController *)self _isAlarmTypeMedia]
        || [(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm])
      {
        goto LABEL_38;
      }
      goto LABEL_33;
    case 6:
      goto LABEL_33;
    default:
      goto LABEL_38;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  uint64_t v9 = [v7 section];
  id v10 = [v6 dequeueReusableCellWithIdentifier:@"HUAlarmEditViewControllerTableViewCellIdentifier"];
  if (!v10) {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:3 reuseIdentifier:@"HUAlarmEditViewControllerTableViewCellIdentifier"];
  }
  if (![(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    if (v9 == 1)
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:0 reuseIdentifier:@"HUAlarmEditTableViewCellIdentifier"];

      uint64_t v22 = _HULocalizedStringWithDefaultValue(@"HUAlarmEditDelete", @"HUAlarmEditDelete", 1);
      uint64_t v23 = [v21 textLabel];
      [v23 setText:v22];

      id v24 = [v21 textLabel];
      [v24 setTextAlignment:1];

      v25 = [MEMORY[0x1E4F428B8] systemRedColor];
      uint64_t v26 = [v21 textLabel];
      [v26 setTextColor:v25];

      id v27 = v21;
LABEL_18:
      uint64_t v11 = v27;
      id v10 = v27;
      goto LABEL_19;
    }
    if (v9)
    {
LABEL_12:
      uint64_t v11 = 0;
      goto LABEL_19;
    }
    BOOL v12 = [v10 detailTextLabel];
    [v12 setAdjustsFontSizeToFitWidth:0];

    [v10 setAccessoryType:1];
    double v13 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_alarmsPrimaryTextColor");
    v14 = [v10 textLabel];
    [v14 setTextColor:v13];

    switch(v8)
    {
      case 2:
        v28 = _HULocalizedStringWithDefaultValue(@"HUAlarmPlayInLabel", @"HUAlarmPlayInLabel", 1);
        v29 = [v10 textLabel];
        [v29 setText:v28];

        v30 = [(HUAlarmEditViewController *)self selectedRoom];
        id v31 = [v30 name];
        v32 = [v10 detailTextLabel];
        [v32 setText:v31];

        [v10 setAccessoryType:1];
        break;
      case 1:
        id v33 = _HULocalizedStringWithDefaultValue(@"HUAlarmEditLabel", @"HUAlarmEditLabel", 1);
        v34 = [v10 textLabel];
        [v34 setText:v33];

        v19 = [(HUAlarmEditViewController *)self editedAlarm];
        uint64_t v20 = [v19 displayTitle];
        goto LABEL_16;
      case 0:
        id v15 = _HULocalizedStringWithDefaultValue(@"HUAlarmEditRepeat", @"HUAlarmEditRepeat", 1);
        v16 = [v10 textLabel];
        [v16 setText:v15];

        v17 = [v10 detailTextLabel];
        [v17 setAdjustsFontSizeToFitWidth:1];

        id v18 = [v10 detailTextLabel];
        [v18 setMinimumScaleFactor:0.705882353];

        v19 = [(HUAlarmEditViewController *)self editedAlarm];
        [v19 repeatSchedule];
        uint64_t v20 = DateMaskToString();
LABEL_16:
        v35 = (void *)v20;
        uint64_t v36 = [v10 detailTextLabel];
        [v36 setText:v35];

        break;
    }
    id v27 = v10;
    goto LABEL_18;
  }
  switch(v9)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      uint64_t v11 = [(HUAlarmEditViewController *)self _setupCell:v10 forTableView:v6 indexPath:v7];
      break;
    default:
      goto LABEL_12;
  }
LABEL_19:

  return v11;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (objc_msgSend(MEMORY[0x1E4F69758], "isAMac", a3))
  {
    if ([(HUAlarmEditViewController *)self _isNewAlarm]
      || [(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm])
    {
      if (a4 == 1)
      {
LABEL_5:
        id v6 = _HULocalizedStringWithDefaultValue(@"HUAlarmMediaActionPlayUnavailableMessage", @"HUAlarmMediaActionPlayUnavailableMessage", 1);
        goto LABEL_8;
      }
    }
    else if (a4 == 2)
    {
      goto LABEL_5;
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (void)_updateCellForTableView:(id)a3 indexPath:(id)a4
{
  id v16 = a4;
  BOOL v5 = [(HUAlarmEditViewController *)self accessorySupportsMusicAlarm];
  id v6 = v16;
  if (v5)
  {
    uint64_t v7 = [v16 section];
    uint64_t v8 = [v16 row];
    uint64_t v9 = v8;
    if (v7 != 4)
    {
      if (v7 == 1)
      {
        if (v8 == 1)
        {
          [(HUAlarmEditViewController *)self setIsPlayMediaSelected:1];
          if ([(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm])
          {
            BOOL v13 = 0;
LABEL_18:
            [(HUAlarmEditViewController *)self _updateEnableStateForDoneButton:v13];
            goto LABEL_19;
          }
          BOOL v10 = [(HUAlarmEditViewController *)self _isAlarmTypeMedia];
LABEL_17:
          BOOL v13 = v10;
          goto LABEL_18;
        }
        if (!v8)
        {
          [(HUAlarmEditViewController *)self setIsPlayMediaSelected:0];
          [(HUAlarmEditViewController *)self setIsCustomVolumeSelected:0];
          BOOL v10 = [(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm];
          goto LABEL_17;
        }
LABEL_19:
        v14 = [(HUAlarmEditViewController *)self editAlarmView];
        id v15 = [v14 settingsTable];
        [v15 reloadData];

        id v6 = v16;
        goto LABEL_20;
      }
      if ([(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm]
        || [(HUAlarmEditViewController *)self _isAlarmTypeMedia])
      {
        goto LABEL_19;
      }
    }
    if (v9 == 1)
    {
      uint64_t v11 = self;
      uint64_t v12 = 1;
    }
    else
    {
      if (v9) {
        goto LABEL_19;
      }
      uint64_t v11 = self;
      uint64_t v12 = 0;
    }
    [(HUAlarmEditViewController *)v11 setIsCustomVolumeSelected:v12];
    goto LABEL_19;
  }
LABEL_20:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 row];
  uint64_t v8 = [v6 section];
  [v13 deselectRowAtIndexPath:v6 animated:1];
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    switch(v8)
    {
      case 0:
        if ((unint64_t)(v7 - 1) <= 2)
        {
          uint64_t v9 = self;
          uint64_t v10 = v7;
          goto LABEL_9;
        }
        break;
      case 1:
      case 3:
        goto LABEL_17;
      case 2:
        if (![(HUAlarmEditViewController *)self _isNewAlarm]
          && ![(HUAlarmEditViewController *)self _isAlarmTypeMedia]
          && [(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm])
        {
          goto LABEL_23;
        }
        [(HUAlarmEditViewController *)self _chooseMediaTapped];
        break;
      case 4:
        if (HUIsPhoneIdiom()
          && ![(HUAlarmEditViewController *)self _isNewAlarm]
          && ![(HUAlarmEditViewController *)self _isAlarmTypeMedia])
        {
          goto LABEL_23;
        }
LABEL_17:
        [(HUAlarmEditViewController *)self _updateCellForTableView:v13 indexPath:v6];
        break;
      case 5:
        if (![(HUAlarmEditViewController *)self _isNewAlarm]
          && (![(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume]
           || ![(HUAlarmEditViewController *)self _isAlarmTypeMedia]))
        {
          goto LABEL_23;
        }
        break;
      case 6:
        if (![(HUAlarmEditViewController *)self _isNewAlarm]) {
          goto LABEL_23;
        }
        break;
      default:
        break;
    }
  }
  else if (v8 == 1)
  {
LABEL_23:
    uint64_t v11 = [(HUAlarmEditViewController *)self delegate];
    uint64_t v12 = [(HUAlarmEditViewController *)self originalAlarm];
    [v11 alarmEditController:self didDeleteAlarm:v12];
  }
  else if (!v8 && v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v7 + 1;
    uint64_t v9 = self;
LABEL_9:
    [(HUAlarmEditViewController *)v9 startEditingSetting:v10];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (![(HUAlarmEditViewController *)self accessorySupportsMusicAlarm]) {
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    id v6 = @"HUAlarmEditAlarmSound";
LABEL_12:
    uint64_t v7 = _HULocalizedStringWithDefaultValue(v6, v6, 1);
    goto LABEL_14;
  }
  if (a4 == 4)
  {
    if ([(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm]
      || ![(HUAlarmEditViewController *)self _isAlarmTypeMedia])
    {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (a4 == 3
    && ![(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm]
    && ![(HUAlarmEditViewController *)self _isAlarmTypeMedia])
  {
LABEL_11:
    id v6 = @"HUAlarmEditAlarmVolume";
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v7 = 0;
LABEL_14:

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] == 2
    && [(HUAlarmEditViewController *)self _isAlarmTypeMedia]
    && ![v5 row])
  {
    double v6 = 100.0;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F43D18];
  }

  return v6;
}

- (void)_configureMediaIconView:(id)a3 withImage:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    if (v6)
    {
      uint64_t v7 = objc_msgSend(v6, "hu_imageScaledToSize:contentMode:", 2, 72.0, 72.0);
      uint64_t v8 = [v19 imageView];
      [v8 setImage:v7];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F42A98] configurationWithPointSize:24.0];
      uint64_t v9 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"music"];
      uint64_t v10 = [v9 imageWithSymbolConfiguration:v7];
      uint64_t v11 = [v19 imageView];
      [v11 setImage:v10];

      uint64_t v12 = [v19 imageView];
      [v12 setContentMode:4];

      uint64_t v8 = [MEMORY[0x1E4F428B8] systemGrayColor];
      id v13 = [v19 imageView];
      [v13 setTintColor:v8];
    }
    v14 = [v19 imageView];
    id v15 = [v14 layer];
    [v15 setCornerRadius:4.0];

    id v16 = [v19 imageView];
    [v16 setClipsToBounds:1];

    v17 = [v19 imageView];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:1];

    id v18 = [v19 imageView];
    [v18 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  }
}

- (id)_dateComponents
{
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    if (_MergedGlobals_6 != -1) {
      dispatch_once(&_MergedGlobals_6, &__block_literal_global_119_0);
    }
    id v3 = (id)qword_1EA12DFF0;
    BOOL v4 = [(HUAlarmEditViewController *)self editedAlarm];
    objc_msgSend(v3, "setHour:", objc_msgSend(v4, "hour"));

    id v5 = [(HUAlarmEditViewController *)self editedAlarm];
    objc_msgSend(v3, "setMinute:", objc_msgSend(v5, "minute"));
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __44__HUAlarmEditViewController__dateComponents__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  v1 = (void *)qword_1EA12DFF0;
  qword_1EA12DFF0 = (uint64_t)v0;
}

- (void)_chooseMediaTapped
{
  if (![(HUAlarmEditViewController *)self accessorySupportsMusicAlarm]) {
    return;
  }
  if (_os_feature_enabled_impl())
  {
    id v3 = [HUMediaSourceListViewController alloc];
    BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = [(HUAlarmEditViewController *)self mediaProfileContainer];
    id v6 = [v4 setWithObject:v5];
    id v14 = [(HUMediaSourceListViewController *)v3 initForMediaProfileContainers:v6 forTarget:1];

    [v14 setDelegate:self];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v14];
    [(HUAlarmEditViewController *)self presentViewController:v7 animated:1 completion:0];
LABEL_9:

    return;
  }
  BOOL v8 = +[HUMediaAccountUtilities isMusicAppInstalled];
  uint64_t v9 = [(HUAlarmEditViewController *)self appleMusicSubcriptionResult];
  id v14 = v9;
  if (!v8)
  {
    uint64_t v7 = [v9 objectForKeyedSubscript:@"HUMediaPickerUnavailableReasonStoreKitErrorObjectKey"];
    [(HUAlarmEditViewController *)self _presentMediaPickerUnavailablePromptWithReason:0 storeKitErrorObject:v7];
    goto LABEL_9;
  }
  uint64_t v10 = [v9 objectForKeyedSubscript:@"HOMediaPickerUnavailableReasonKey"];

  if (v10)
  {
    id v14 = [(HUAlarmEditViewController *)self appleMusicSubcriptionResult];
    uint64_t v7 = [v14 objectForKeyedSubscript:@"HOMediaPickerUnavailableReasonKey"];
    uint64_t v11 = [v7 integerValue];
    uint64_t v12 = [(HUAlarmEditViewController *)self appleMusicSubcriptionResult];
    id v13 = [v12 objectForKeyedSubscript:@"HUMediaPickerUnavailableReasonStoreKitErrorObjectKey"];
    [(HUAlarmEditViewController *)self _presentMediaPickerUnavailablePromptWithReason:v11 storeKitErrorObject:v13];

    goto LABEL_9;
  }

  [(HUAlarmEditViewController *)self _presentMediaPickerWithOptionsShowsLibraryContent:1];
}

- (id)_deleteAlarmButtonCellForTableView:(id)a3 atIndexPath:(id)a4
{
  BOOL v4 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"HUAlarmEditTableViewCellIdentifier", a4);
  if (!v4) {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:0 reuseIdentifier:@"HUAlarmEditTableViewCellIdentifier"];
  }
  id v5 = _HULocalizedStringWithDefaultValue(@"HUAlarmEditDelete", @"HUAlarmEditDelete", 1);
  id v6 = [v4 textLabel];
  [v6 setText:v5];

  uint64_t v7 = [v4 textLabel];
  [v7 setTextAlignment:1];

  BOOL v8 = [MEMORY[0x1E4F428B8] systemRedColor];
  uint64_t v9 = [v4 textLabel];
  [v9 setTextColor:v8];

  return v4;
}

- (id)_volumeSliderCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = [a3 dequeueReusableCellWithIdentifier:@"HUVolumeSliderCellReuseIdentifier" forIndexPath:a4];
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  [v8 setDelegate:self];
  [v8 setMinimumValue:0.0];
  [v8 setMaximumValue:100.0];
  uint64_t v9 = [(HUAlarmEditViewController *)self _volumeIconMinimum];
  [v8 setMinimumValueImage:v9];

  uint64_t v10 = [(HUAlarmEditViewController *)self _volumeIconMaximum];
  [v8 setMaximumValueImage:v10];

  uint64_t v11 = [MEMORY[0x1E4F428B8] systemGrayColor];
  [v8 setTintColor:v11];

  [v8 setShowValue:0];
  objc_msgSend(v8, "setHidden:", -[HUAlarmEditViewController _hasUserSelectedCustomVolume](self, "_hasUserSelectedCustomVolume") ^ 1);
  [(HUAlarmEditViewController *)self _volumeSettingForCurrentEditingAlarm];
  objc_msgSend(v8, "setValue:");
  [v8 value];
  -[HUAlarmEditViewController setSelectedCustomVolumeLevel:](self, "setSelectedCustomVolumeLevel:");

  return v8;
}

- (id)_volumeIconMinimum
{
  if (qword_1EA12E000 != -1) {
    dispatch_once(&qword_1EA12E000, &__block_literal_global_126);
  }
  double v2 = (void *)qword_1EA12DFF8;

  return v2;
}

void __47__HUAlarmEditViewController__volumeIconMinimum__block_invoke()
{
  id v3 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"speaker.fill"];
  id v0 = [MEMORY[0x1E4F428B8] systemGrayColor];
  uint64_t v1 = [v3 imageWithTintColor:v0];
  double v2 = (void *)qword_1EA12DFF8;
  qword_1EA12DFF8 = v1;
}

- (id)_volumeIconMaximum
{
  if (qword_1EA12E010 != -1) {
    dispatch_once(&qword_1EA12E010, &__block_literal_global_131);
  }
  double v2 = (void *)qword_1EA12E008;

  return v2;
}

void __47__HUAlarmEditViewController__volumeIconMaximum__block_invoke()
{
  id v3 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"speaker.wave.3.fill"];
  id v0 = [MEMORY[0x1E4F428B8] systemGrayColor];
  uint64_t v1 = [v3 imageWithTintColor:v0];
  double v2 = (void *)qword_1EA12E008;
  qword_1EA12E008 = v1;
}

- (id)_datePickerCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  if (![(HUAlarmEditViewController *)self isDatePickerWheelScrolled])
  {
    uint64_t v11 = [(HUAlarmEditViewController *)self _dateComponents];
    [v10 setTimeComponents:v11];

    uint64_t v12 = [v10 timeComponents];
    [(HUAlarmEditViewController *)self setCurrentDatePickerTimeComponents:v12];
  }
  [v10 setDelegate:self];
  [v10 setHideTitleLabel:1];
  [v10 setLeftMargin:10.0];
  objc_msgSend(v10, "setSeparatorInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));

  return v10;
}

- (id)_mediaPropertiesTypeCellForTableView:(id)a3 atIndexpath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 row])
  {
    id v15 = [v6 dequeueReusableCellWithIdentifier:@"HURepeatMusicSwitchCellReuseIdentifier" forIndexPath:v7];
    objc_opt_class();
    id v9 = v15;
    if (objc_opt_isKindOfClass()) {
      id v16 = v9;
    }
    else {
      id v16 = 0;
    }
    id v11 = v16;

    v17 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
    objc_msgSend(v11, "setOn:", objc_msgSend(v17, "isRepeatEnabled"));

    id v18 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
    objc_msgSend(v11, "setDisabled:", objc_msgSend(v18, "isRepeatSupported") ^ 1);

    id v14 = @"HUMediaSelectionQueueModifierRepeat";
    goto LABEL_11;
  }
  if ([v7 row] == 1)
  {
    id v8 = [v6 dequeueReusableCellWithIdentifier:@"HUShuffleMusicSwitchCellReuseIdentifier" forIndexPath:v7];
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
    objc_msgSend(v11, "setOn:", objc_msgSend(v12, "isShuffleEnabled"));

    id v13 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
    objc_msgSend(v11, "setDisabled:", objc_msgSend(v13, "isShuffleSupported") ^ 1);

    id v14 = @"HUMediaSelectionQueueModifierShuffle";
LABEL_11:
    id v19 = _HULocalizedStringWithDefaultValue(v14, v14, 1);
    uint64_t v20 = [v11 textLabel];
    [v20 setText:v19];

    [v11 setDelegate:self];
    goto LABEL_13;
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (id)_volumeTypeCellForTableView:(id)a3 atIndexpath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"HUVolumeTypeReuseIdentifier"];
  if (!v7) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:0 reuseIdentifier:@"HUVolumeTypeReuseIdentifier"];
  }
  uint64_t v8 = [v6 row];
  if (v8 == 1)
  {
    id v13 = _HULocalizedStringWithDefaultValue(@"HUAlarmEditAlarmUseCustomVolume", @"HUAlarmEditAlarmUseCustomVolume", 1);
    id v14 = [v7 textLabel];
    [v14 setText:v13];

    if ([(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume]) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    if (v8) {
      goto LABEL_12;
    }
    id v9 = _HULocalizedStringWithDefaultValue(@"HUAlarmEditAlarmUseCurrentVolume", @"HUAlarmEditAlarmUseCurrentVolume", 1);
    uint64_t v10 = [v7 textLabel];
    [v10 setText:v9];

    id v11 = [v7 detailTextLabel];
    [v11 setAdjustsFontSizeToFitWidth:1];

    if ([(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume]) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 3;
    }
  }
  [v7 setAccessoryType:v12];
LABEL_12:

  return v7;
}

- (BOOL)_hasUserSelectedToneAlarm
{
  return ![(HUAlarmEditViewController *)self isPlayMediaSelected];
}

- (BOOL)_isAlarmTypeMedia
{
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    id v3 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
    if (v3) {
      BOOL v4 = ![(HUAlarmEditViewController *)self _hasUserSelectedToneAlarm];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_isNewAlarm
{
  double v2 = [(HUAlarmEditViewController *)self originalAlarm];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)isEdited
{
  if ([(HUAlarmEditViewController *)self _isNewAlarm])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v4 = [(HUAlarmEditViewController *)self originalAlarm];
    id v5 = [(HUAlarmEditViewController *)self editedAlarm];
    int v3 = [v4 isEqual:v5] ^ 1;
  }
  return v3;
}

- (void)saveAlarmOnlyIfEdited:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (![(HUAlarmEditViewController *)self isEdited] && v3) {
    return;
  }
  if (![(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    uint64_t v12 = [(HUAlarmEditView *)self->_editAlarmView timePicker];
    id v13 = [v12 calendar];
    id v14 = [(HUAlarmEditView *)self->_editAlarmView timePicker];
    id v15 = [v14 date];
    id v5 = [v13 components:96 fromDate:v15];

    goto LABEL_12;
  }
  id v5 = [(HUAlarmEditViewController *)self currentDatePickerTimeComponents];
  BOOL v6 = [(HUAlarmEditViewController *)self _isAlarmTypeMedia];
  id v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Saving Regular Alarm", (uint8_t *)&v31, 2u);
    }

    uint64_t v12 = [(HUAlarmEditViewController *)self editedAlarm];
    [v12 setSound:0];
    goto LABEL_16;
  }
  if (v8)
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Saving Media Type Alarm", (uint8_t *)&v31, 2u);
  }

  if (([MEMORY[0x1E4F69758] isAMac] & 1) == 0)
  {
    id v9 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
    uint64_t v10 = [(HUAlarmEditViewController *)self _configureSoundForMediaTypeAlarm:v9];
    id v11 = [(HUAlarmEditViewController *)self editedAlarm];
    [v11 setSound:v10];
  }
  uint64_t v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(HUAlarmEditViewController *)self editedAlarm];
    id v14 = [v13 sound];
    int v31 = 138412290;
    v32 = v14;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Alarm Sound ..%@", (uint8_t *)&v31, 0xCu);
LABEL_12:
  }
LABEL_16:

  uint64_t v16 = [v5 hour];
  v17 = [(HUAlarmEditViewController *)self editedAlarm];
  [v17 setHour:v16];

  uint64_t v18 = [v5 minute];
  id v19 = [(HUAlarmEditViewController *)self editedAlarm];
  [v19 setMinute:v18];

  uint64_t v20 = [(HUAlarmEditViewController *)self editedAlarm];
  v21 = [(HUAlarmEditViewController *)self selectedRoom];
  uint64_t v22 = [(HUAlarmEditViewController *)self mediaProfileContainer];
  objc_msgSend(v20, "hf_moveToRoom:withMediaProfileContainer:", v21, v22);

  LODWORD(v21) = [(HUAlarmEditViewController *)self _isNewAlarm];
  uint64_t v23 = HFLogForCategory();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v24)
    {
      v25 = [(HUAlarmEditViewController *)self editedAlarm];
      uint64_t v26 = [v25 description];
      int v31 = 138412290;
      v32 = v26;
      _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "New Alarm - Alarm Desc %@", (uint8_t *)&v31, 0xCu);
    }
    id v27 = [(HUAlarmEditViewController *)self delegate];
    v28 = [(HUAlarmEditViewController *)self editedAlarm];
    [v27 alarmEditController:self didAddAlarm:v28];
  }
  else
  {
    if (v24)
    {
      v29 = [(HUAlarmEditViewController *)self editedAlarm];
      v30 = [v29 description];
      int v31 = 138412290;
      v32 = v30;
      _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "Edit Alarm - Alarm Desc %@", (uint8_t *)&v31, 0xCu);
    }
    id v27 = [(HUAlarmEditViewController *)self delegate];
    v28 = [(HUAlarmEditViewController *)self editedAlarm];
    [v27 alarmEditController:self didEditAlarm:v28];
  }
}

- (void)_cancelButtonClicked:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[HUAlarmEditViewController _cancelButtonClicked:]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%s(%@) canceling", (uint8_t *)&v6, 0x16u);
  }

  id v5 = [(HUAlarmEditViewController *)self delegate];
  [v5 alarmEditControllerDidCancel:self];
}

- (void)_doneButtonClicked:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    int v6 = "-[HUAlarmEditViewController _doneButtonClicked:]";
    __int16 v7 = 2112;
    __int16 v8 = self;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%s(%@) done", (uint8_t *)&v5, 0x16u);
  }

  [(HUAlarmEditViewController *)self saveAlarmOnlyIfEdited:0];
}

- (void)startEditingSetting:(int64_t)a3
{
  self->_editingAlarmSetting = a3;
  int v5 = [HUAlarmEditSettingViewController alloc];
  int v6 = [(HUAlarmEditViewController *)self editedAlarm];
  __int16 v7 = [(HUAlarmEditViewController *)self mediaProfileContainer];
  __int16 v8 = [(HUAlarmEditViewController *)self selectedRoom];
  uint64_t v9 = [(HUAlarmEditViewController *)self loggedInAppleMusicAccountDSID];
  id v11 = [(HUAlarmEditSettingViewController *)v5 initWithAlarm:v6 setting:a3 mediaProfileContainer:v7 selectedRoom:v8 loggedInAppleMusicAccountDSID:v9];

  [(HUAlarmEditSettingViewController *)v11 setDelegate:self];
  [(HUAlarmEditViewController *)self preferredContentSize];
  -[HUAlarmEditSettingViewController setPreferredContentSize:](v11, "setPreferredContentSize:");
  uint64_t v10 = [(HUAlarmEditViewController *)self navigationController];
  [v10 pushViewController:v11 animated:1];
}

- (void)_handlePickerChanged
{
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    [(HUAlarmEditViewController *)self setIsDatePickerWheelScrolled:1];
  }
}

- (void)_updateEnableStateForDoneButton:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    id v6 = [(HUAlarmEditViewController *)self navigationItem];
    int v5 = [v6 rightBarButtonItem];
    [v5 setEnabled:v3];
  }
}

- (void)_updateAppleMusicSubscriptionStatus
{
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    BOOL v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    appleMusicSubcriptionResult = self->_appleMusicSubcriptionResult;
    self->_appleMusicSubcriptionResult = v3;

    int v5 = [(HUAlarmEditViewController *)self mediaProfileContainer];
    id v6 = [v5 mediaProfiles];
    __int16 v7 = objc_msgSend(v6, "hf_homePodMediaProfiles");
    __int16 v8 = [(HUAlarmEditViewController *)self mediaProfileContainer];
    uint64_t v9 = objc_msgSend(v8, "hf_home");
    uint64_t v10 = +[HUMediaAccountUtilities determineMediaPickerAvailabilityForHomePodProfiles:v7 inHome:v9];

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__HUAlarmEditViewController__updateAppleMusicSubscriptionStatus__block_invoke;
    v15[3] = &unk_1E6388EE0;
    objc_copyWeak(&v16, &location);
    id v11 = (id)[v10 addSuccessBlock:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__HUAlarmEditViewController__updateAppleMusicSubscriptionStatus__block_invoke_2;
    v13[3] = &unk_1E6386FB8;
    objc_copyWeak(&v14, &location);
    id v12 = (id)[v10 addFailureBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __64__HUAlarmEditViewController__updateAppleMusicSubscriptionStatus__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    BOOL v4 = [WeakRetained appleMusicSubcriptionResult];
    [v4 setDictionary:v5];
  }
}

void __64__HUAlarmEditViewController__updateAppleMusicSubscriptionStatus__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    BOOL v4 = [WeakRetained appleMusicSubcriptionResult];
    [v4 setObject:v5 forKey:@"HUAppleMusicSubscriptionErrorKey"];
  }
}

- (void)_loadArtworkForMediaAlarm
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F290E0] sharedSession];
  BOOL v4 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
  id v5 = [v4 mediaPlayerPlaybackArchive];

  id v6 = [v5 displayProperties];
  __int16 v7 = [v6 artworkImageURL];
  if (v7)
  {
    __int16 v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Loading artwork for Media Alarm [%@]", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__HUAlarmEditViewController__loadArtworkForMediaAlarm__block_invoke;
    v11[3] = &unk_1E638AC70;
    objc_copyWeak(&v12, (id *)buf);
    uint64_t v9 = [v3 dataTaskWithURL:v7 completionHandler:v11];
    [(HUAlarmEditViewController *)self setArtworkFetchTask:v9];

    uint64_t v10 = [(HUAlarmEditViewController *)self artworkFetchTask];
    [v10 resume];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __54__HUAlarmEditViewController__loadArtworkForMediaAlarm__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HUAlarmEditViewController__loadArtworkForMediaAlarm__block_invoke_2;
  block[3] = &unk_1E6385250;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
}

void __54__HUAlarmEditViewController__loadArtworkForMediaAlarm__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setArtworkFetchTask:0];
    BOOL v4 = *(void **)(a1 + 32);
    if (v4 || !*(void *)(a1 + 40))
    {
      if ([v4 code] == -999
        && ([*(id *)(a1 + 32) domain],
            id v5 = objc_claimAutoreleasedReturnValue(),
            int v6 = [v5 isEqual:*MEMORY[0x1E4F289A0]],
            v5,
            v6))
      {
        id v7 = HFLogForCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Loading artwork for Media Alarm cancelled.", (uint8_t *)&v13, 2u);
        }
      }
      else
      {
        id v7 = HFLogForCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 32);
          int v13 = 138543362;
          uint64_t v14 = v8;
          _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "Failed to load artwort. Error: %{public}@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
    else
    {
      id v9 = HFLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Loading artwork for Media Alarm done.", (uint8_t *)&v13, 2u);
      }

      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = [v3 hfPlaybackArchive];
      [v11 setArtworkImageData:v10];

      id v7 = [v3 editAlarmView];
      id v12 = [v7 settingsTable];
      [v12 reloadData];
    }
  }
}

- (void)_checkAndPrepareEditingAlarmForMediaTypeAlarm
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MTMutableAlarm *)self->_editedAlarm sound];
  uint64_t v4 = [v3 toneIdentifier];
  if (v4)
  {
    id v5 = (void *)v4;
    int v6 = [(MTMutableAlarm *)self->_editedAlarm sound];
    id v7 = [v6 toneIdentifier];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      id v9 = [getTLToneManagerClass() sharedToneManager];
      uint64_t v10 = [(MTMutableAlarm *)self->_editedAlarm sound];
      id v11 = [v10 toneIdentifier];
      id v12 = [v9 _underlyingPlaybackArchiveForToneIdentifier:v11];

      if (v12)
      {
        int v13 = [(HUAlarmEditViewController *)self editedAlarm];
        uint64_t v14 = [v13 sound];
        uint64_t v15 = [v14 soundVolume];

        if (v15)
        {
          [(HUAlarmEditViewController *)self setIsCustomVolumeSelected:1];
          id v16 = [(HUAlarmEditViewController *)self editedAlarm];
          v17 = [v16 sound];
          [v17 soundVolume];
        }
        else
        {
          id v16 = [(HUAlarmEditViewController *)self mediaProfileContainer];
          v17 = [v16 mediaProfiles];
          +[HUMediaAccountUtilities defaultCurrentVolumeForMediaProfiles:v17];
        uint64_t v20 = };
        [v20 floatValue];
        [(HUAlarmEditViewController *)self setSelectedCustomVolumeLevel:v21];

        uint64_t v22 = (HFPlaybackArchive *)[objc_alloc(MEMORY[0x1E4F693D8]) initWithMediaPlayerPlaybackArchive:v12];
        hfPlaybackArchive = self->_hfPlaybackArchive;
        self->_hfPlaybackArchive = v22;

        if (self->_hfPlaybackArchive)
        {
          BOOL v24 = [v12 displayProperties];
          v25 = [v24 artworkImageData];
          if (v25)
          {
          }
          else
          {
            uint64_t v26 = [v12 displayProperties];
            id v27 = [v26 artworkImageURL];

            if (v27) {
              [(HUAlarmEditViewController *)self _loadArtworkForMediaAlarm];
            }
          }
          [(HUAlarmEditViewController *)self setIsPlayMediaSelected:1];
          uint64_t v18 = HFLogForCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
            v29 = [v28 description];
            v30 = [(MTMutableAlarm *)self->_editedAlarm sound];
            int v31 = [v30 toneIdentifier];
            int v32 = 138412802;
            uint64_t v33 = v29;
            __int16 v34 = 2112;
            v35 = v31;
            __int16 v36 = 2112;
            v37 = v12;
            _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "Editing Alarm is Media Alarm. Description %@, ToneIdentifier %@, playbackArchiveObj from TL %@", (uint8_t *)&v32, 0x20u);
          }
          goto LABEL_22;
        }
        uint64_t v18 = HFLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v32) = 0;
          id v19 = "Editing Alarm - Error preparing hfPlaybackArchive. Treating as Regular Alarm";
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v18 = HFLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v32) = 0;
          id v19 = "Editing Alarm - Error converting tone identifier into playback archive by TL. Treating as Regular Alarm";
LABEL_17:
          _os_log_error_impl(&dword_1BE345000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v32, 2u);
        }
      }
LABEL_22:

      goto LABEL_23;
    }
  }
  else
  {
  }
  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v32) = 0;
    _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "Editing Alarm toneIdentifier is nil. Treating as Regular Alarm", (uint8_t *)&v32, 2u);
  }
LABEL_23:
}

- (id)_configureSoundForMediaTypeAlarm:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 mediaPlayerPlaybackArchive];
  int v6 = [v5 displayProperties];
  uint64_t v7 = [v6 artworkImageData];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [v5 displayProperties];
    uint64_t v10 = [v9 artworkImageURL];

    if (v10)
    {
      id v11 = HFLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "Stripping artwork from Media Alarm", (uint8_t *)&v21, 2u);
      }

      uint64_t v12 = [v5 copyWithOptions:8];
      id v5 = v12;
    }
  }
  else
  {
  }
  int v13 = [getTLToneManagerClass() sharedToneManager];
  uint64_t v14 = [v13 _toneIdentifierWithUnderlyingPlaybackArchive:v5];

  if (v14)
  {
    if ([(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume])
    {
      uint64_t v15 = NSNumber;
      [(HUAlarmEditViewController *)self _volumeSettingForCurrentEditingAlarm];
      id v16 = objc_msgSend(v15, "numberWithDouble:");
    }
    else
    {
      id v16 = 0;
    }
    v17 = [MEMORY[0x1E4F78B70] toneSoundWithIdentifier:v14 vibrationIdentifer:0 volume:v16];
    uint64_t v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v4 mediaPlayerPlaybackArchive];
      int v21 = 138413058;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      BOOL v24 = v19;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "Saving as Media Alarm volume..%@ playback archive properties %@ ToneIdentifier from Tone Library %@ CustomSound %@", (uint8_t *)&v21, 0x2Au);
    }
  }
  else
  {
    id v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412290;
      uint64_t v22 = v5;
      _os_log_error_impl(&dword_1BE345000, v16, OS_LOG_TYPE_ERROR, "Failed to convert playback archive %@ into a tone identifier.", (uint8_t *)&v21, 0xCu);
    }
    v17 = 0;
  }

  return v17;
}

- (BOOL)_isMusicAlarmSupportedInAccessory
{
  double v2 = [(HUAlarmEditViewController *)self mediaProfileContainer];
  char v3 = objc_msgSend(v2, "hf_supportsMusicAlarm");

  return v3;
}

- (BOOL)_shouldDisablePlayMedia
{
  return [MEMORY[0x1E4F69758] isAMac];
}

- (void)alarmEditSettingController:(id)a3 didEditAlarm:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 selectedRoom];
  [(HUAlarmEditViewController *)self setSelectedRoom:v7];

  uint64_t v8 = (void *)[v6 mutableCopy];
  [(HUAlarmEditViewController *)self setEditedAlarm:v8];

  id v9 = [(HUAlarmEditView *)self->_editAlarmView settingsTable];
  [v9 reloadData];
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v19 = a3;
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    id v6 = [v19 textLabel];
    uint64_t v7 = [v6 text];
    uint64_t v8 = _HULocalizedStringWithDefaultValue(@"HUAlarmEditAlarmSnooze", @"HUAlarmEditAlarmSnooze", 1);
    int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      uint64_t v10 = [(HUAlarmEditViewController *)self editedAlarm];
      [v10 setAllowsSnooze:v4];
    }
    else
    {
      id v11 = [v19 textLabel];
      uint64_t v12 = [v11 text];
      int v13 = _HULocalizedStringWithDefaultValue(@"HUMediaSelectionQueueModifierRepeat", @"HUMediaSelectionQueueModifierRepeat", 1);
      int v14 = [v12 isEqualToString:v13];

      if (v14)
      {
        uint64_t v10 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
        [v10 setRepeatEnabled:v4];
      }
      else
      {
        uint64_t v15 = [v19 textLabel];
        id v16 = [v15 text];
        v17 = _HULocalizedStringWithDefaultValue(@"HUMediaSelectionQueueModifierShuffle", @"HUMediaSelectionQueueModifierShuffle", 1);
        int v18 = [v16 isEqualToString:v17];

        if (!v18) {
          goto LABEL_9;
        }
        uint64_t v10 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
        [v10 setShuffleEnabled:v4];
      }
    }
  }
LABEL_9:
}

- (void)sliderValueTableViewCell:(id)a3 didChangeValue:(double)a4
{
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    [(HUAlarmEditViewController *)self setSelectedCustomVolumeLevel:a4];
  }
}

- (void)datePickerCell:(id)a3 didSelectDate:(id)a4
{
  id v6 = a3;
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    [(HUAlarmEditViewController *)self setIsDatePickerWheelScrolled:1];
    id v5 = [v6 timeComponents];
    [(HUAlarmEditViewController *)self setCurrentDatePickerTimeComponents:v5];
  }
}

- (void)mediaPicker:(id)a3 didPickPlaybackArchive:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    id v6 = [(HUAlarmEditViewController *)self artworkFetchTask];
    [v6 cancel];

    [(HUAlarmEditViewController *)self setHfPlaybackArchive:0];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F693D8]) initWithMediaPlayerPlaybackArchive:v5];
    [(HUAlarmEditViewController *)self setHfPlaybackArchive:v7];

    uint64_t v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
      uint64_t v10 = [v9 description];
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "didPickPlaybackArchive Media Alarm. Description %@", buf, 0xCu);
    }
    id v11 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
    [v11 setAutoPlayEnabled:0];

    uint64_t v12 = [(HUAlarmEditViewController *)self editAlarmView];
    int v13 = [v12 settingsTable];
    [v13 reloadData];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__HUAlarmEditViewController_mediaPicker_didPickPlaybackArchive___block_invoke;
    v14[3] = &unk_1E6386018;
    v14[4] = self;
    [(HUAlarmEditViewController *)self dismissViewControllerAnimated:1 completion:v14];
  }
}

uint64_t __64__HUAlarmEditViewController_mediaPicker_didPickPlaybackArchive___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _isAlarmTypeMedia];

  return [v1 _updateEnableStateForDoneButton:v2];
}

- (void)_presentMediaPickerWithOptionsShowsLibraryContent:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    uint64_t v23 = 0;
    BOOL v24 = &v23;
    uint64_t v25 = 0x2050000000;
    id v5 = (void *)qword_1EA12E028;
    uint64_t v26 = qword_1EA12E028;
    if (!qword_1EA12E028)
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __getMPMediaPickerControllerClass_block_invoke_0;
      int v21 = &unk_1E63852F0;
      uint64_t v22 = &v23;
      __getMPMediaPickerControllerClass_block_invoke_0((uint64_t)&v18);
      id v5 = (void *)v24[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v23, 8);
    uint64_t v7 = (void *)[[v6 alloc] initWithSupportedTypeIdentifiers:&unk_1F19B5948 selectionMode:4];
    [v7 setShowsCloudItems:1];
    [v7 setShowsItemsWithProtectedAssets:1];
    [v7 setShowsCatalogContent:1];
    [v7 setShowsLibraryContent:v3];
    uint64_t v8 = [MEMORY[0x1E4F42D90] mainScreen];
    [v8 scale];
    double v10 = v9;

    if (v10 <= 4.0) {
      double v11 = 256.0;
    }
    else {
      double v11 = v10 * 64.0;
    }
    uint64_t v23 = 0;
    BOOL v24 = &v23;
    uint64_t v25 = 0x2050000000;
    uint64_t v12 = (void *)qword_1EA12E030;
    uint64_t v26 = qword_1EA12E030;
    if (!qword_1EA12E030)
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __getMPPlaybackArchiveConfigurationClass_block_invoke_0;
      int v21 = &unk_1E63852F0;
      uint64_t v22 = &v23;
      __getMPPlaybackArchiveConfigurationClass_block_invoke_0((uint64_t)&v18);
      uint64_t v12 = (void *)v24[3];
    }
    int v13 = v12;
    _Block_object_dispose(&v23, 8);
    int v14 = objc_msgSend([v13 alloc], "initWithPreferredArtworkSize:", v11, v11);
    [v7 setPlaybackArchiveConfiguration:v14];

    [v7 setDelegate:self];
    [v7 setModalPresentationStyle:2];
    uint64_t v15 = [(HUAlarmEditViewController *)self view];
    [v15 frame];
    objc_msgSend(v7, "setPreferredContentSize:", v16, v17);

    [(HUAlarmEditViewController *)self presentViewController:v7 animated:1 completion:0];
  }
}

- (void)mediaPickerDidCancel:(id)a3
{
}

- (void)mediaPickerDidPickPlaybackArchive:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HUAlarmEditViewController *)self accessorySupportsMusicAlarm])
  {
    id v5 = [(HUAlarmEditViewController *)self artworkFetchTask];
    [v5 cancel];

    [(HUAlarmEditViewController *)self setHfPlaybackArchive:0];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F693D8]) initWithMediaPlayerPlaybackArchive:v4];
    [(HUAlarmEditViewController *)self setHfPlaybackArchive:v6];

    uint64_t v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
      double v9 = [v8 description];
      int v13 = 138412290;
      int v14 = v9;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "didPickPlaybackArchive Media Alarm. Description %@", (uint8_t *)&v13, 0xCu);
    }
    double v10 = [(HUAlarmEditViewController *)self hfPlaybackArchive];
    [v10 setAutoPlayEnabled:0];

    double v11 = [(HUAlarmEditViewController *)self editAlarmView];
    uint64_t v12 = [v11 settingsTable];
    [v12 reloadData];

    [(HUAlarmEditViewController *)self dismissViewControllerAnimated:1 completion:0];
    [(HUAlarmEditViewController *)self _updateEnableStateForDoneButton:[(HUAlarmEditViewController *)self _isAlarmTypeMedia]];
  }
}

- (double)_volumeSettingForCurrentEditingAlarm
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  double v3 = 0.0;
  if (![(HUAlarmEditViewController *)self accessorySupportsMusicAlarm]) {
    return v3;
  }
  id v4 = [(HUAlarmEditViewController *)self mediaProfileContainer];
  id v5 = [v4 mediaProfiles];
  id v6 = +[HUMediaAccountUtilities defaultCurrentVolumeForMediaProfiles:v5];
  [v6 floatValue];
  double v8 = v7;

  if ([(HUAlarmEditViewController *)self _isNewAlarm])
  {
    [(HUAlarmEditViewController *)self selectedCustomVolumeLevel];
    double v3 = v8;
    if (v9 != v8)
    {
LABEL_4:
      [(HUAlarmEditViewController *)self selectedCustomVolumeLevel];
      double v3 = v10;
    }
  }
  else
  {
    double v11 = [(HUAlarmEditViewController *)self editedAlarm];
    uint64_t v12 = [v11 sound];
    int v13 = [v12 soundVolume];

    if (v13)
    {
      int v14 = [(HUAlarmEditViewController *)self editedAlarm];
      uint64_t v15 = [v14 sound];
      double v16 = [v15 soundVolume];
      [v16 floatValue];
      double v18 = v17;
      [(HUAlarmEditViewController *)self selectedCustomVolumeLevel];
      if (v19 == v18)
      {
        uint64_t v20 = [(HUAlarmEditViewController *)self editedAlarm];
        int v21 = [v20 sound];
        uint64_t v22 = [v21 soundVolume];
        [v22 floatValue];
        double v3 = v23;
      }
      else
      {
        [(HUAlarmEditViewController *)self selectedCustomVolumeLevel];
        double v3 = v25;
      }

      goto LABEL_13;
    }
    [(HUAlarmEditViewController *)self selectedCustomVolumeLevel];
    double v3 = v8;
    if (v24 != v8)
    {
      double v3 = v8;
      if ([(HUAlarmEditViewController *)self _isAlarmTypeMedia]) {
        goto LABEL_4;
      }
    }
  }
LABEL_13:
  uint64_t v26 = HFLogForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    if ([(HUAlarmEditViewController *)self _hasUserSelectedCustomVolume]) {
      __int16 v27 = @"YES";
    }
    else {
      __int16 v27 = @"NO";
    }
    [(HUAlarmEditViewController *)self selectedCustomVolumeLevel];
    uint64_t v29 = v28;
    int v32 = 134219010;
    if ([(HUAlarmEditViewController *)self _isNewAlarm]) {
      v30 = @"YES";
    }
    else {
      v30 = @"NO";
    }
    double v33 = v8;
    __int16 v34 = 2112;
    v35 = v27;
    __int16 v36 = 2048;
    uint64_t v37 = v29;
    __int16 v38 = 2112;
    uint64_t v39 = v30;
    __int16 v40 = 2048;
    double v41 = v3;
    _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "Volume Setting:  Default Volume From Profile %f Custom Volume %@ User Toggled Volume Level %f New Alarm %@ VolumeSet %f", (uint8_t *)&v32, 0x34u);
  }

  return v3;
}

- (void)_presentMediaPickerUnavailablePromptWithReason:(int64_t)a3 storeKitErrorObject:(id)a4
{
  id v6 = a4;
  if (![(HUAlarmEditViewController *)self accessorySupportsMusicAlarm]) {
    goto LABEL_17;
  }
  switch(a3)
  {
    case 2:
      double v8 = +[HUMediaAccountUtilities reasonForMediaPickerNotAvailable:2];
      int v10 = 0;
      int v21 = 0;
      float v7 = 0;
      double v9 = @"HUAlertError";
      if (!v8) {
        goto LABEL_12;
      }
      goto LABEL_10;
    case 1:
      float v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"music://subscribe"];
      int v10 = 1;
      int v21 = @"HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptGetAppleMusicButton";
      double v8 = @"HUMusicAlarmMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptMessage";
      double v9 = @"HUMediaPickerUnavailableMusicCatalogPlaybackDisabledPromptTitle";
      goto LABEL_10;
    case 0:
      float v7 = +[HUMediaAccountUtilities musicAppURL];
      double v8 = @"HUTriggerMediaPickerUnavailableMusicAppUninstalledForMusicAlarmPromptMessage";
      double v9 = @"HUMediaPickerUnavailableMusicAppUninstalledPromptTitle";
      int v10 = 1;
      int v21 = @"HUMediaPickerUnavailableMusicAppUninstalledPromptOpenAppStoreButton";
      if (!v8) {
        goto LABEL_12;
      }
LABEL_10:
      double v11 = _HULocalizedStringWithDefaultValue(v8, v8, 1);
      goto LABEL_13;
  }
  double v9 = 0;
  float v7 = 0;
  int v21 = 0;
  int v10 = 0;
LABEL_12:
  double v11 = objc_msgSend(v6, "localizedDescription", v21);
  double v8 = 0;
LABEL_13:
  uint64_t v12 = (void *)MEMORY[0x1E4F42728];
  int v13 = _HULocalizedStringWithDefaultValue(v9, v9, 1);
  int v14 = [v12 alertControllerWithTitle:v13 message:v11 preferredStyle:1];

  uint64_t v15 = (void *)MEMORY[0x1E4F42720];
  double v16 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  float v17 = [v15 actionWithTitle:v16 style:0 handler:0];
  [v14 addAction:v17];

  if (v10 && v7)
  {
    double v18 = (void *)MEMORY[0x1E4F42720];
    double v19 = _HULocalizedStringWithDefaultValue(v21, v21, 1);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    double v24 = __96__HUAlarmEditViewController__presentMediaPickerUnavailablePromptWithReason_storeKitErrorObject___block_invoke;
    double v25 = &unk_1E6385188;
    id v26 = v7;
    uint64_t v20 = [v18 actionWithTitle:v19 style:0 handler:&v22];
    [v14 addAction:v20];
  }
  -[HUAlarmEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0, v21, v22, v23, v24, v25);

LABEL_17:
}

void __96__HUAlarmEditViewController__presentMediaPickerUnavailablePromptWithReason_storeKitErrorObject___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F69378] sharedInstance];
  id v2 = (id)[v3 openURL:*(void *)(a1 + 32)];
}

- (HUAlarmEditViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAlarmEditViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)loggedInAppleMusicAccountDSID
{
  return self->_loggedInAppleMusicAccountDSID;
}

- (void)setLoggedInAppleMusicAccountDSID:(id)a3
{
}

- (NSSet)selectedActionSets
{
  return self->_selectedActionSets;
}

- (HUAlarmEditView)editAlarmView
{
  return self->_editAlarmView;
}

- (void)setEditAlarmView:(id)a3
{
}

- (int64_t)editingAlarmSetting
{
  return self->_editingAlarmSetting;
}

- (void)setEditingAlarmSetting:(int64_t)a3
{
  self->_editingAlarmSetting = a3;
}

- (MTAlarm)originalAlarm
{
  return self->_originalAlarm;
}

- (void)setOriginalAlarm:(id)a3
{
}

- (MTMutableAlarm)editedAlarm
{
  return self->_editedAlarm;
}

- (void)setEditedAlarm:(id)a3
{
}

- (double)selectedCustomVolumeLevel
{
  return self->_selectedCustomVolumeLevel;
}

- (void)setSelectedCustomVolumeLevel:(double)a3
{
  self->_selectedCustomVolumeLevel = a3;
}

- (BOOL)isCustomVolumeSelected
{
  return self->_isCustomVolumeSelected;
}

- (void)setIsCustomVolumeSelected:(BOOL)a3
{
  self->_isCustomVolumeSelected = a3;
}

- (BOOL)isPlayMediaSelected
{
  return self->_isPlayMediaSelected;
}

- (void)setIsPlayMediaSelected:(BOOL)a3
{
  self->_isPlayMediaSelected = a3;
}

- (BOOL)accessorySupportsMusicAlarm
{
  return self->_accessorySupportsMusicAlarm;
}

- (void)setAccessorySupportsMusicAlarm:(BOOL)a3
{
  self->_accessorySupportsMusicAlarm = a3;
}

- (HFPlaybackArchive)hfPlaybackArchive
{
  return self->_hfPlaybackArchive;
}

- (void)setHfPlaybackArchive:(id)a3
{
}

- (NSURLSessionDataTask)artworkFetchTask
{
  return self->_artworkFetchTask;
}

- (void)setArtworkFetchTask:(id)a3
{
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setMediaProfileContainer:(id)a3
{
}

- (NSMutableDictionary)appleMusicSubcriptionResult
{
  return self->_appleMusicSubcriptionResult;
}

- (void)setAppleMusicSubcriptionResult:(id)a3
{
}

- (BOOL)isDatePickerWheelScrolled
{
  return self->_isDatePickerWheelScrolled;
}

- (void)setIsDatePickerWheelScrolled:(BOOL)a3
{
  self->_isDatePickerWheelScrolled = a3;
}

- (NSDateComponents)currentDatePickerTimeComponents
{
  return self->_currentDatePickerTimeComponents;
}

- (void)setCurrentDatePickerTimeComponents:(id)a3
{
}

- (HMRoom)selectedRoom
{
  return self->_selectedRoom;
}

- (void)setSelectedRoom:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectedRoom, 0);
  objc_storeStrong((id *)&self->_currentDatePickerTimeComponents, 0);
  objc_storeStrong((id *)&self->_appleMusicSubcriptionResult, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_artworkFetchTask, 0);
  objc_storeStrong((id *)&self->_hfPlaybackArchive, 0);
  objc_storeStrong((id *)&self->_editedAlarm, 0);
  objc_storeStrong((id *)&self->_originalAlarm, 0);
  objc_storeStrong((id *)&self->_editAlarmView, 0);
  objc_storeStrong((id *)&self->_selectedActionSets, 0);
  objc_storeStrong((id *)&self->_loggedInAppleMusicAccountDSID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end