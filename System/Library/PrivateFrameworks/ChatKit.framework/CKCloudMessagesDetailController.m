@interface CKCloudMessagesDetailController
+ (id)specifier;
- (BOOL)_isCloudEnabled;
- (BOOL)_isSyncingWithCloud;
- (CKCloudMessagesDetailController)init;
- (IMDaemonMultiplexedConnectionManaging)daemonConnection;
- (STStoragePlugin)plugin;
- (UIProgressHUD)cloudKitProgressView;
- (id)cloudDocsSpecifiers;
- (id)dataSize:(id)a3;
- (id)specifiers;
- (void)_displayiCloudErrorMessage;
- (void)connectToDaemon;
- (void)dealloc;
- (void)disableAndDelete:(id)a3;
- (void)disconnectFromDaemon;
- (void)hideSpinner;
- (void)setCloudKitProgressView:(id)a3;
- (void)setDaemonConnection:(id)a3;
- (void)setEnabledDidReturned:(id)a3;
- (void)setPlugin:(id)a3;
- (void)showSpinnerMessage:(id)a3;
- (void)tryToDisableAllDevicesDidReturn:(id)a3;
- (void)undoDelete:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKCloudMessagesDetailController

- (id)specifiers
{
  uint64_t v2 = (int)*MEMORY[0x1E4F92F08];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (!v3)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    int v7 = [v6 applicationIsInstalled:@"com.apple.MobileSMS"];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4FA80C8] specifierForAppIdentifier:@"com.apple.MobileSMS"];
      if (!v8)
      {

        id v42 = 0;
        goto LABEL_22;
      }
      v9 = (void *)v8;
      [v5 addObject:v8];
    }
    uint64_t v10 = *MEMORY[0x1E4FA80D8];
    v11 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) propertyForKey:*MEMORY[0x1E4FA80D8]];
    unint64_t v12 = 0x1E4F28000uLL;
    if (v11)
    {
      v13 = (void *)MEMORY[0x1E4F92E70];
      v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"DOCUMENTS_AND_DATA" value:&stru_1EDE4CA38 table:@"General"];
      v16 = [v13 preferenceSpecifierNamed:v15 target:self set:0 get:sel_dataSize_ detail:0 cell:4 edit:0];

      [v16 setProperty:v11 forKey:v10];
      [v5 addObject:v16];
    }
    v17 = [MEMORY[0x1E4F6BC68] sharedInstance];
    int v18 = [v17 eligibleForTruthZone];

    v19 = [MEMORY[0x1E4F6BC68] sharedInstance];
    char v20 = [v19 isInExitState];

    if (v18)
    {
      v59 = v11;
      v21 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"DISABLE_AND_DELETE"];
      if (v20)
      {
        v22 = [MEMORY[0x1E4F6BC68] sharedInstance];
        v23 = [v22 exitDate];

        uint64_t v24 = [v23 dateByAddingTimeInterval:2678400.0];
        id v25 = objc_alloc(MEMORY[0x1E4F1C9A8]);
        v26 = (void *)[v25 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
        v27 = [MEMORY[0x1E4F1C9C8] date];
        v57 = v26;
        v58 = (void *)v24;
        v28 = [v26 components:16 fromDate:v27 toDate:v24 options:0];

        uint64_t v29 = [v28 day];
        if (v29 < 0)
        {
          v36 = 0;
        }
        else
        {
          uint64_t v30 = v29;
          v31 = v5;
          v32 = NSString;
          v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v34 = [v33 localizedStringForKey:@"MIC_WILL_DELETE_DESCRIPTION_FORMAT" value:&stru_1EDE4CA38 table:@"General"];
          v35 = v32;
          v5 = v31;
          unint64_t v12 = 0x1E4F28000;
          v36 = objc_msgSend(v35, "stringWithFormat:", v34, v30);
        }
        [v21 setProperty:v36 forKey:*MEMORY[0x1E4F93170]];
        [v5 addObject:v21];
        v43 = (void *)MEMORY[0x1E4F92E70];
        v44 = [*(id *)(v12 + 2896) bundleForClass:objc_opt_class()];
        [v44 localizedStringForKey:@"UNDO_DELETE" value:&stru_1EDE4CA38 table:@"General"];
        v46 = v45 = v5;
        v47 = [v43 preferenceSpecifierNamed:v46 target:self set:0 get:0 detail:0 cell:13 edit:0];

        v5 = v45;
        [v47 setButtonAction:sel_undoDelete_];
        [v47 setProperty:&unk_1EDF16DF0 forKey:*MEMORY[0x1E4F93060]];
        [v45 addObject:v47];
      }
      else
      {
        v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v38 = [v37 localizedStringForKey:@"DISABLE_AND_DELETE_DESCRIPTION" value:&stru_1EDE4CA38 table:@"General"];
        [v21 setProperty:v38 forKey:*MEMORY[0x1E4F93170]];

        [v5 addObject:v21];
        v39 = (void *)MEMORY[0x1E4F92E70];
        v40 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v41 = [v40 localizedStringForKey:@"DISABLE_AND_DELETE" value:&stru_1EDE4CA38 table:@"General"];
        v23 = [v39 deleteButtonSpecifierWithName:v41 target:self action:sel_disableAndDelete_];

        [v5 addObject:v23];
      }

      v11 = v59;
    }
    v48 = [(CKCloudMessagesDetailController *)self cloudDocsSpecifiers];
    BOOL v49 = [(CKCloudMessagesDetailController *)self _isSyncingWithCloud];
    BOOL v50 = [(CKCloudMessagesDetailController *)self _isCloudEnabled];
    if ([v48 count] && !v49 && v50)
    {
      v51 = (void *)MEMORY[0x1E4F92E70];
      v52 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v53 = [v52 localizedStringForKey:@"MESSAGES" value:&stru_1EDE4CA38 table:@"General"];
      v54 = [v51 groupSpecifierWithName:v53];
      [v5 addObject:v54];

      [v5 addObjectsFromArray:v48];
    }
    v55 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v5;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  }
  id v42 = v3;
LABEL_22:

  return v42;
}

- (void)disableAndDelete:(id)a3
{
  id v29 = a3;
  [(CKCloudMessagesDetailController *)self connectToDaemon];
  v4 = (void *)MEMORY[0x1E4F42720];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"DISABLE_ALERT_CANCEL" value:&stru_1EDE4CA38 table:@"General"];
  int v7 = [v4 actionWithTitle:v6 style:1 handler:0];

  uint64_t v8 = (void *)MEMORY[0x1E4F42720];
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"DISABLE_ALERT_DELETE_MESSAGES" value:&stru_1EDE4CA38 table:@"General"];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __52__CKCloudMessagesDetailController_disableAndDelete___block_invoke;
  v30[3] = &unk_1E5621178;
  v30[4] = self;
  v11 = [v8 actionWithTitle:v10 style:2 handler:v30];

  unint64_t v12 = (void *)MEMORY[0x1E4F42728];
  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"DISABLE_ALERT_TITLE" value:&stru_1EDE4CA38 table:@"General"];
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"DISABLE_ALERT_MESSAGE" value:&stru_1EDE4CA38 table:@"General"];
  v17 = [v12 alertControllerWithTitle:v14 message:v16 preferredStyle:0];

  [v17 addAction:v7];
  [v17 addAction:v11];
  int v18 = [(CKCloudMessagesDetailController *)self cachedCellForSpecifier:v29];

  if (v18)
  {
    v19 = [v17 popoverPresentationController];
    [v19 setSourceView:v18];

    [v18 bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = [v17 popoverPresentationController];
    objc_msgSend(v28, "setSourceRect:", v21, v23, v25, v27);
  }
  [(CKCloudMessagesDetailController *)self presentViewController:v17 animated:1 completion:0];
}

- (void)showSpinnerMessage:(id)a3
{
  id v4 = a3;
  v5 = [(CKCloudMessagesDetailController *)self view];
  v6 = [v5 window];
  [v6 setUserInteractionEnabled:0];

  int v7 = (UIProgressHUD *)objc_alloc_init(MEMORY[0x1E4F42D20]);
  cloudKitProgressView = self->_cloudKitProgressView;
  self->_cloudKitProgressView = v7;

  [(UIProgressHUD *)self->_cloudKitProgressView setAutoresizingMask:45];
  [(UIProgressHUD *)self->_cloudKitProgressView setFontSize:16];
  [(UIProgressHUD *)self->_cloudKitProgressView setText:v4];

  v9 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  v11 = [(CKCloudMessagesDetailController *)self rootController];
  unint64_t v12 = v11;
  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v13 = [v11 parentViewController];
    id v16 = [v13 view];
  }
  else
  {
    id v16 = [v11 view];
  }

  [(UIProgressHUD *)self->_cloudKitProgressView showInView:v16];
  v14 = [(CKCloudMessagesDetailController *)self view];
  v15 = [v14 window];

  [v15 setUserInteractionEnabled:0];
}

- (void)hideSpinner
{
  v3 = [(CKCloudMessagesDetailController *)self view];
  id v5 = [v3 window];

  [(UIProgressHUD *)self->_cloudKitProgressView hide];
  cloudKitProgressView = self->_cloudKitProgressView;
  self->_cloudKitProgressView = 0;

  [v5 setUserInteractionEnabled:1];
}

+ (id)specifier
{
  uint64_t v2 = (void *)MEMORY[0x1E4F92E70];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"MESSAGES" value:&stru_1EDE4CA38 table:@"General"];
  id v5 = [v2 preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  return v5;
}

- (CKCloudMessagesDetailController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKCloudMessagesDetailController;
  uint64_t v2 = [(CKCloudMessagesDetailController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_setEnabledDidReturned_ name:@"com.apple.IMCore.IMCloudKitHooks.SetEnabledReturned" object:0];

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_tryToDisableAllDevicesDidReturn_ name:@"com.apple.IMCore.IMCloudKitHooks.tryToDisableAllDevicesReturned" object:0];
  }
  return v2;
}

- (void)dealloc
{
  [(CKCloudMessagesDetailController *)self disconnectFromDaemon];
  v3.receiver = self;
  v3.super_class = (Class)CKCloudMessagesDetailController;
  [(CKCloudMessagesDetailController *)&v3 dealloc];
}

- (id)cloudDocsSpecifiers
{
  if (!self->_plugin)
  {
    objc_super v3 = objc_alloc_init(CKStoragePlugin);
    plugin = self->_plugin;
    self->_plugin = &v3->super;
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(STStoragePlugin *)self->_plugin performSelector:sel_cloudDocumentSpecifiers withObject:self];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKCloudMessagesDetailController;
  [(CKCloudMessagesDetailController *)&v7 viewWillAppear:a3];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"MESSAGES" value:&stru_1EDE4CA38 table:@"General"];
  objc_super v6 = [(CKCloudMessagesDetailController *)self navigationItem];
  [v6 setTitle:v5];
}

- (id)dataSize:(id)a3
{
  objc_super v3 = [a3 propertyForKey:*MEMORY[0x1E4FA80D8]];
  [v3 longLongValue];
  id v4 = NSLocalizedFileSizeDescription();

  return v4;
}

void __52__CKCloudMessagesDetailController_disableAndDelete___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v3 = [v2 localizedStringForKey:@"ICLOUD_TURNING_OFF" value:&stru_1EDE4CA38 table:@"General"];
  [v1 showSpinnerMessage:v3];

  id v4 = [MEMORY[0x1E4F6BC68] sharedInstance];
  [v4 tryToDisableAllDevices];
}

- (void)tryToDisableAllDevicesDidReturn:(id)a3
{
  id v6 = [a3 userInfo];
  [(CKCloudMessagesDetailController *)self hideSpinner];
  id v4 = [v6 objectForKeyedSubscript:@"ResultSuccess"];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0) {
    [(CKCloudMessagesDetailController *)self _displayiCloudErrorMessage];
  }
  [(CKCloudMessagesDetailController *)self reloadSpecifiers];
}

- (void)_displayiCloudErrorMessage
{
  objc_super v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v3 localizedStringForKey:@"EXIT_ICLOUD_ERROR_TITLE" value:&stru_1EDE4CA38 table:@"General"];

  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v5 = [v4 localizedStringForKey:@"EXIT_ICLOUD_ERROR_MESSAGE" value:&stru_1EDE4CA38 table:@"General"];

  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v7 = [v6 localizedStringForKey:@"EXIT_ICLOUD_ERROR_CONFIRM" value:&stru_1EDE4CA38 table:@"General"];

  uint64_t v8 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v10 message:v5 preferredStyle:1];
  v9 = [MEMORY[0x1E4F42720] actionWithTitle:v7 style:0 handler:0];
  [v8 addAction:v9];

  [(CKCloudMessagesDetailController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)undoDelete:(id)a3
{
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v5 = [v4 localizedStringForKey:@"ICLOUD_TURNING_ON" value:&stru_1EDE4CA38 table:@"General"];
  [(CKCloudMessagesDetailController *)self showSpinnerMessage:v5];

  id v6 = [MEMORY[0x1E4F6BC68] sharedInstance];
  [v6 setEnabled:1];
}

- (void)setEnabledDidReturned:(id)a3
{
  id v6 = [a3 userInfo];
  [(CKCloudMessagesDetailController *)self hideSpinner];
  id v4 = [v6 objectForKeyedSubscript:@"ResultSuccess"];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0) {
    [(CKCloudMessagesDetailController *)self _displayiCloudErrorMessage];
  }
  [(CKCloudMessagesDetailController *)self reloadSpecifiers];
}

- (void)connectToDaemon
{
  objc_super v3 = [(CKCloudMessagesDetailController *)self daemonConnection];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F6BC98] sharedController];
    char v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    objc_super v7 = [v4 multiplexedConnectionWithLabel:v6 capabilities:512 context:0];
    [(CKCloudMessagesDetailController *)self setDaemonConnection:v7];

    id v8 = [(CKCloudMessagesDetailController *)self daemonConnection];
    [v8 connectWithCompletion:&__block_literal_global_249];
  }
}

void __50__CKCloudMessagesDetailController_connectToDaemon__block_invoke()
{
  if (IMOSLoggingEnabled())
  {
    v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_18EF18000, v0, OS_LOG_TYPE_INFO, "connected to daemon", v1, 2u);
    }
  }
}

- (void)disconnectFromDaemon
{
  objc_super v3 = [(CKCloudMessagesDetailController *)self daemonConnection];
  [v3 invalidate];

  [(CKCloudMessagesDetailController *)self setDaemonConnection:0];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v5 = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "disconnected from daemon", v5, 2u);
    }
  }
}

- (BOOL)_isSyncingWithCloud
{
  uint64_t v2 = [MEMORY[0x1E4F6BC68] sharedInstance];
  char v3 = [v2 isSyncing];

  return v3;
}

- (BOOL)_isCloudEnabled
{
  uint64_t v2 = [MEMORY[0x1E4F6BC68] sharedInstance];
  char v3 = [v2 isEnabled];

  return v3;
}

- (STStoragePlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

- (UIProgressHUD)cloudKitProgressView
{
  return self->_cloudKitProgressView;
}

- (void)setCloudKitProgressView:(id)a3
{
}

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_cloudKitProgressView, 0);

  objc_storeStrong((id *)&self->_plugin, 0);
}

@end