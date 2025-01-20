@interface CKKeepMessagesSelectionList
- (CKKeepMessagesPreferenceManager)keepMessagesPreferenceManager;
- (CKKeepMessagesSelectionList)init;
- (NSArray)durationPreferenceTitles;
- (NSArray)durationPreferenceValues;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)selectedKeepMessagesPreferenceIndex;
- (void)_configureInitialSelectedIndexes;
- (void)_internalInit;
- (void)_selectionListDidSelectIndexPath:(id)a3;
- (void)_updatePreferenceAtIndexPath:(id)a3;
- (void)_warnAboutDeletingMessagesForSelectedListItem:(id)a3;
- (void)_warnForFinalConfirmationForUpdatingIndexPath:(id)a3;
- (void)dealloc;
- (void)setDurationPreferenceTitles:(id)a3;
- (void)setDurationPreferenceValues:(id)a3;
- (void)setKeepMessagesPreferenceManager:(id)a3;
- (void)setSelectedKeepMessagesPreferenceIndex:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateKeepMessagesPreference:(id)a3;
@end

@implementation CKKeepMessagesSelectionList

- (CKKeepMessagesSelectionList)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKKeepMessagesSelectionList;
  v2 = [(CKKeepMessagesSelectionList *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CKKeepMessagesSelectionList *)v2 _internalInit];
  }
  return v3;
}

- (void)_internalInit
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(CKKeepMessagesPreferenceManager);
  keepMessagesPreferenceManager = self->_keepMessagesPreferenceManager;
  self->_keepMessagesPreferenceManager = v3;

  objc_super v5 = MessagesSettingsLocalizedString(@"KEEP_MESSAGES_1MONTH");
  v12 = v5;
  v6 = MessagesSettingsLocalizedString(@"KEEP_MESSAGES_1YEAR");
  v13 = v6;
  v7 = MessagesSettingsLocalizedString(@"KEEP_MESSAGES_FOREVER");
  v14 = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:3];
  durationPreferenceTitles = self->_durationPreferenceTitles;
  self->_durationPreferenceTitles = v8;

  durationPreferenceValues = self->_durationPreferenceValues;
  self->_durationPreferenceValues = (NSArray *)&unk_26D075A10;

  [(CKKeepMessagesSelectionList *)self _configureInitialSelectedIndexes];
  v11 = [(CKKeepMessagesSelectionList *)self keepMessagesPreferenceManager];
  [v11 addSyncedSettingObserver:self selector:sel__syncedSettingsDidChange_ key:0];
}

- (void)dealloc
{
  v3 = [(CKKeepMessagesSelectionList *)self keepMessagesPreferenceManager];
  [v3 removeSyncedSettingObserver:self key:0];

  v4.receiver = self;
  v4.super_class = (Class)CKKeepMessagesSelectionList;
  [(CKKeepMessagesSelectionList *)&v4 dealloc];
}

- (id)specifiers
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v21 = (int)*MEMORY[0x263F5FDB8];
    objc_super v4 = [MEMORY[0x263EFF980] array];
    uint64_t v5 = MessagesSettingsLocalizedString(@"KEEP_ALL_MESSAGES_HEADER");
    v6 = MessagesSettingsLocalizedString(@"KEEP_ALL_MESSAGES_FOOTER");
    unint64_t v7 = 0x263F5F000uLL;
    v8 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ALL_MESSAGES_GROUP"];
    v20 = (void *)v5;
    [v8 setName:v5];
    [v8 setProperty:v6 forKey:*MEMORY[0x263F600F8]];
    v19 = v8;
    [v4 addObject:v8];
    if ([(NSArray *)self->_durationPreferenceTitles count])
    {
      unint64_t v9 = 0;
      do
      {
        v10 = [(NSArray *)self->_durationPreferenceTitles objectAtIndexedSubscript:v9];
        [*(id *)(v7 + 3136) preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:4 edit:0];
        v12 = unint64_t v11 = v7;
        v13 = NSString;
        v14 = [(NSArray *)self->_durationPreferenceValues objectAtIndexedSubscript:v9];
        uint64_t v15 = objc_msgSend(v13, "stringWithFormat:", @"%ld", objc_msgSend(v14, "integerValue"));

        [v12 setIdentifier:v15];
        [v4 addObject:v12];

        unint64_t v7 = v11;
        ++v9;
      }
      while ([(NSArray *)self->_durationPreferenceTitles count] > v9);
    }
    v16 = (objc_class *)[v4 copy];
    v17 = *(Class *)((char *)&self->super.super.super.super.super.isa + v21);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v21) = v16;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v21);
  }
  return v3;
}

- (void)_configureInitialSelectedIndexes
{
  id v5 = +[CKKeepMessagesPreferenceManager keepMessagesPreference];
  v3 = [(CKKeepMessagesSelectionList *)self durationPreferenceValues];
  int64_t v4 = [v3 indexOfObject:v5];

  self->_selectedKeepMessagesPreferenceIndex = v4;
}

- (void)_selectionListDidSelectIndexPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 row];
  if (!v5)
  {
    int64_t v8 = v6;
    int64_t v9 = [(CKKeepMessagesSelectionList *)self selectedKeepMessagesPreferenceIndex];
    if (v8 >= v9)
    {
      [(CKKeepMessagesSelectionList *)self _updatePreferenceAtIndexPath:v4];
      if (!IMOSLoggingEnabled()) {
        goto LABEL_15;
      }
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 134218496;
        uint64_t v12 = v9;
        __int16 v13 = 2048;
        int64_t v14 = v8;
        __int16 v15 = 2048;
        uint64_t v16 = 0;
        _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_INFO, "[Conference] Immediately updating preference for duration change (%ld -> %ld) in section={%ld}", (uint8_t *)&v11, 0x20u);
      }
    }
    else
    {
      [(CKKeepMessagesSelectionList *)self _warnAboutDeletingMessagesForSelectedListItem:v4];
      if (!IMOSLoggingEnabled()) {
        goto LABEL_15;
      }
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 134218496;
        uint64_t v12 = v9;
        __int16 v13 = 2048;
        int64_t v14 = v8;
        __int16 v15 = 2048;
        uint64_t v16 = 0;
        _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_INFO, "[Conference] Showing alert about dataloss from duration change (row %ld -> %ld) in section={%ld}", (uint8_t *)&v11, 0x20u);
      }
    }

    goto LABEL_15;
  }
  if (IMOSLoggingEnabled())
  {
    unint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      uint64_t v12 = [v4 row];
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_INFO, "[Conference] Selected an indexPath from an unsupported section={%ld}", (uint8_t *)&v11, 0xCu);
    }
  }
LABEL_15:
}

- (void)_updatePreferenceAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 row];
  uint64_t v6 = [(CKKeepMessagesSelectionList *)self durationPreferenceValues];
  id v9 = [v6 objectAtIndexedSubscript:v5];

  uint64_t v7 = [v4 section];
  if (!v7)
  {
    [(CKKeepMessagesSelectionList *)self updateKeepMessagesPreference:v9];
    int64_t v8 = [(CKKeepMessagesSelectionList *)self durationPreferenceValues];
    self->_selectedKeepMessagesPreferenceIndex = [v8 indexOfObject:v9];

    [(CKKeepMessagesSelectionList *)self reloadSpecifiers];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [(CKKeepMessagesSelectionList *)self _selectionListDidSelectIndexPath:a4];
  [(CKKeepMessagesSelectionList *)self reloadSpecifiers];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CKKeepMessagesSelectionList;
  uint64_t v7 = [(CKKeepMessagesSelectionList *)&v9 tableView:a3 cellForRowAtIndexPath:v6];
  if (![v6 section]) {
    objc_msgSend(v7, "setChecked:", objc_msgSend(v6, "row") == -[CKKeepMessagesSelectionList selectedKeepMessagesPreferenceIndex](self, "selectedKeepMessagesPreferenceIndex"));
  }

  return v7;
}

- (void)_warnAboutDeletingMessagesForSelectedListItem:(id)a3
{
  id v4 = a3;
  if ([v4 row]) {
    uint64_t v5 = @"DELETE_MESSAGES_WARNING_YEAR";
  }
  else {
    uint64_t v5 = @"DELETE_MESSAGES_WARNING_MONTH";
  }
  id v6 = MadridLocalizedString(v5);
  objc_initWeak(&location, self);
  uint64_t v7 = (void *)MEMORY[0x263F82400];
  int64_t v8 = MadridLocalizedString(@"FACETIME_ALERT_CANCEL");
  objc_super v9 = [v7 actionWithTitle:v8 style:1 handler:0];

  v10 = (void *)MEMORY[0x263F82400];
  int v11 = MadridLocalizedString(@"FACETIME_ALERT_DELETE");
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __77__CKKeepMessagesSelectionList__warnAboutDeletingMessagesForSelectedListItem___block_invoke;
  v27[3] = &unk_2644F0FA8;
  objc_copyWeak(&v29, &location);
  id v12 = v4;
  id v28 = v12;
  __int16 v13 = [v10 actionWithTitle:v11 style:2 handler:v27];

  int64_t v14 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:v6 preferredStyle:0];
  [v14 addAction:v9];
  [v14 addAction:v13];
  __int16 v15 = [(CKKeepMessagesSelectionList *)self table];
  uint64_t v16 = [v15 cellForRowAtIndexPath:v12];

  uint64_t v17 = [v14 popoverPresentationController];
  [v17 setSourceView:v16];

  [v16 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [v14 popoverPresentationController];
  objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

  [(CKKeepMessagesSelectionList *)self presentViewController:v14 animated:1 completion:0];
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

void __77__CKKeepMessagesSelectionList__warnAboutDeletingMessagesForSelectedListItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_INFO, "[Conference] Delete tapped. Going to show secondary confirmation alert.", v6, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _warnForFinalConfirmationForUpdatingIndexPath:*(void *)(a1 + 32)];
}

- (void)_warnForFinalConfirmationForUpdatingIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F4A558] sharedInstance];
  int v6 = [v5 isEnabled];

  if (v6) {
    uint64_t v7 = @"ALL_DEVICES";
  }
  else {
    uint64_t v7 = @"THIS_DEVICE";
  }
  int64_t v8 = MadridLocalizedString(v7);
  uint64_t v9 = [v4 row];
  BOOL v10 = v9 == 0;
  if (v9) {
    int v11 = @"ARE_YOU_SURE_YOU_WANT_TO_DELETE_MESSAGES_OLDER_THAN_1_YEAR";
  }
  else {
    int v11 = @"ARE_YOU_SURE_YOU_WANT_TO_DELETE_MESSAGES_OLDER_THAN_30_DAYS";
  }
  if (v10) {
    id v12 = @"PERMANENTLY_DELETE_MESSAGES_OLDER_THAN_30_DAYS_FROM_%@";
  }
  else {
    id v12 = @"PERMANENTLY_DELETE_MESSAGES_OLDER_THAN_1_YEAR_FROM_%@";
  }
  v35 = MadridLocalizedString(v11);
  __int16 v13 = MadridLocalizedString(v12);
  int64_t v14 = objc_msgSend(NSString, "stringWithFormat:", v13, v8);

  objc_initWeak(&location, self);
  __int16 v15 = (void *)MEMORY[0x263F82400];
  uint64_t v16 = MadridLocalizedString(@"FACETIME_ALERT_CANCEL");
  uint64_t v17 = [v15 actionWithTitle:v16 style:1 handler:0];

  double v18 = (void *)MEMORY[0x263F82400];
  double v19 = MadridLocalizedString(@"DELETE_OLDER_MESSAGES");
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __77__CKKeepMessagesSelectionList__warnForFinalConfirmationForUpdatingIndexPath___block_invoke;
  v36[3] = &unk_2644F0FA8;
  objc_copyWeak(&v38, &location);
  id v20 = v4;
  id v37 = v20;
  double v21 = [v18 actionWithTitle:v19 style:2 handler:v36];

  double v22 = [MEMORY[0x263F82418] alertControllerWithTitle:v35 message:v14 preferredStyle:1];
  [v22 addAction:v17];
  [v22 addAction:v21];
  double v23 = [(CKKeepMessagesSelectionList *)self table];
  double v24 = [v23 cellForRowAtIndexPath:v20];

  double v25 = [v22 popoverPresentationController];
  [v25 setSourceView:v24];

  [v24 bounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [v22 popoverPresentationController];
  objc_msgSend(v34, "setSourceRect:", v27, v29, v31, v33);

  [(CKKeepMessagesSelectionList *)self presentViewController:v22 animated:1 completion:0];
  objc_destroyWeak(&v38);

  objc_destroyWeak(&location);
}

void __77__CKKeepMessagesSelectionList__warnForFinalConfirmationForUpdatingIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_INFO, "[Conference] Confirmed duration change in alert. Updating.", v6, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updatePreferenceAtIndexPath:*(void *)(a1 + 32)];

  notify_post("com.apple.imautomatichistorydeletionagent.prefchange");
}

- (void)updateKeepMessagesPreference:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKeepMessagesSelectionList *)self keepMessagesPreferenceManager];
  [v5 updateKeepMessagesPreference:v4];
}

- (NSArray)durationPreferenceTitles
{
  return self->_durationPreferenceTitles;
}

- (void)setDurationPreferenceTitles:(id)a3
{
}

- (NSArray)durationPreferenceValues
{
  return self->_durationPreferenceValues;
}

- (void)setDurationPreferenceValues:(id)a3
{
}

- (int64_t)selectedKeepMessagesPreferenceIndex
{
  return self->_selectedKeepMessagesPreferenceIndex;
}

- (void)setSelectedKeepMessagesPreferenceIndex:(int64_t)a3
{
  self->_selectedKeepMessagesPreferenceIndex = a3;
}

- (CKKeepMessagesPreferenceManager)keepMessagesPreferenceManager
{
  return self->_keepMessagesPreferenceManager;
}

- (void)setKeepMessagesPreferenceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepMessagesPreferenceManager, 0);
  objc_storeStrong((id *)&self->_durationPreferenceValues, 0);
  objc_storeStrong((id *)&self->_durationPreferenceTitles, 0);
}

@end