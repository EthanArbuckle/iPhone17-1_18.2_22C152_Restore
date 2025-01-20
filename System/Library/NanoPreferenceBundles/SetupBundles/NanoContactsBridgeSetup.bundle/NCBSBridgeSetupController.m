@interface NCBSBridgeSetupController
+ (BOOL)controllerNeedsToRunForContactsManagementState:(int)a3;
+ (id)_controllerClassFlowForContactsManagementState:(int)a3 priorFlow:(id)a4;
- (BOOL)_contactsSyncEnabledWithNetworkAccess;
- (BOOL)_setupGuardianHasContacts;
- (BOOL)_shouldPromptForiCloudSync;
- (BOOL)activePairingDeviceSupportsContactsApp;
- (BOOL)holdBeforeDisplaying;
- (BOOL)promptedForiCloudSync;
- (BPSMiniFlowStepController)firstViewControllerForCurrentFlow;
- (NCBSBridgeSetupController)init;
- (NSArray)runningFlow;
- (id)_iCloudSyncPromptAlertMessageStringForNeedToEnableDataAccess:(BOOL)a3 needToEnableiCloudSync:(BOOL)a4 needToMergeContacts:(BOOL)a5;
- (id)_iCloudSyncPromptAlertTitleStringForNeedToEnableDataAccess:(BOOL)a3 needToEnableiCloudSync:(BOOL)a4 needToMergeContacts:(BOOL)a5;
- (id)_nextControllerToRunAtOrAfterIndex:(unint64_t)a3;
- (id)contactsManagementStateManager;
- (id)familyMember;
- (id)familyMemberFirstName;
- (id)setupGuardian;
- (id)viewController;
- (int)_familyMemberContactsStatusForContactsCountStatus:(int)a3;
- (int)cmsForRunningFlow;
- (int)familyMemberContactsStatusAtStartOfFlow;
- (int)setupGuardianHasContactsToDonate;
- (void)_checkContactsManagementAndEnqueueReleaseHold;
- (void)_enqueueReleaseHoldWithSkip:(BOOL)a3;
- (void)_familyMemberSetNotification:(id)a3;
- (void)_fetchContactsManagementStateWithHoldWaitUIAndCompletionHandler:(id)a3;
- (void)_promptForiCloudSyncFollowingController:(id)a3;
- (void)_updateContactsManagementStateWithHoldWaitUIThenStepCompleteController:(id)a3;
- (void)_updateForContactsManagementState:(int)a3 contactsCountStatus:(int)a4;
- (void)dealloc;
- (void)miniFlowStepComplete:(id)a3;
- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4;
- (void)requestContactsManagementWithCompletionHandler:(id)a3;
- (void)setCmsForRunningFlow:(int)a3;
- (void)setFamilyMemberContactsStatusAtStartOfFlow:(int)a3;
- (void)setFirstViewControllerForCurrentFlow:(id)a3;
- (void)setPromptedForiCloudSync:(BOOL)a3;
- (void)setRunningFlow:(id)a3;
- (void)setSetupGuardianHasContactsToDonate:(int)a3;
- (void)setShowingHoldWait:(BOOL)a3;
@end

@implementation NCBSBridgeSetupController

- (NCBSBridgeSetupController)init
{
  v8.receiver = self;
  v8.super_class = (Class)NCBSBridgeSetupController;
  v2 = [(NCBSBridgeSetupController *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(NCContactsiCloudSyncHelper);
    iCloudSyncHelper = v2->_iCloudSyncHelper;
    v2->_iCloudSyncHelper = v3;

    v5 = objc_alloc_init(NCContactsSyncDataAccessHelper);
    contactsSyncDataAccessHelper = v2->_contactsSyncDataAccessHelper;
    v2->_contactsSyncDataAccessHelper = v5;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NCBSBridgeSetupController;
  [(NCBSBridgeSetupController *)&v4 dealloc];
}

- (id)viewController
{
  v3 = [(NCBSBridgeSetupController *)self firstViewControllerForCurrentFlow];

  if (v3)
  {
    objc_super v4 = NCBS_Tinker_log();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    v5 = [(NCBSBridgeSetupController *)self firstViewControllerForCurrentFlow];
    int v10 = 136446978;
    v11 = "-[NCBSBridgeSetupController viewController]";
    __int16 v12 = 2114;
    v13 = v5;
    __int16 v14 = 1024;
    unsigned int v15 = [(NCBSBridgeSetupController *)self cmsForRunningFlow];
    __int16 v16 = 1024;
    unsigned int v17 = [(NCBSBridgeSetupController *)self familyMemberContactsStatusAtStartOfFlow];
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%{public}s - re-vending firstViewControllerForCurrentFlow: %{public}@ for cmsForRunningFlow: %d familyMemberContactsStatusAtStartOfFlow: %d", (uint8_t *)&v10, 0x22u);
  }
  else
  {
    objc_super v4 = [(NCBSBridgeSetupController *)self contactsManagementStateManager];
    [(NCBSBridgeSetupController *)self _updateForContactsManagementState:[v4 lastKnownContactsManagementState] contactsCountStatus:[v4 contactsCountStatus]];
    v6 = [(NCBSBridgeSetupController *)self _nextControllerToRunAtOrAfterIndex:0];
    [(NCBSBridgeSetupController *)self setFirstViewControllerForCurrentFlow:v6];

    v5 = NCBS_Tinker_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(NCBSBridgeSetupController *)self firstViewControllerForCurrentFlow];
      int v10 = 136447234;
      v11 = "-[NCBSBridgeSetupController viewController]";
      __int16 v12 = 2114;
      v13 = v7;
      __int16 v14 = 1024;
      unsigned int v15 = [(NCBSBridgeSetupController *)self cmsForRunningFlow];
      __int16 v16 = 1024;
      unsigned int v17 = [(NCBSBridgeSetupController *)self familyMemberContactsStatusAtStartOfFlow];
      __int16 v18 = 1024;
      unsigned int v19 = [v4 contactsSyncAndNetworkAccessEnabled];
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - vending firstViewControllerForCurrentFlow: %{public}@ for cmsForRunningFlow: %d familyMemberContactsStatusAtStartOfFlow: %d contactsSyncAndNetworkAccessEnabled: %d", (uint8_t *)&v10, 0x28u);
    }
  }

LABEL_7:
  objc_super v8 = [(NCBSBridgeSetupController *)self firstViewControllerForCurrentFlow];

  return v8;
}

- (void)_updateForContactsManagementState:(int)a3 contactsCountStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v7 = NCBS_Tinker_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v16 = 136446722;
    unsigned int v17 = "-[NCBSBridgeSetupController _updateForContactsManagementState:contactsCountStatus:]";
    __int16 v18 = 1024;
    unsigned int v19 = v5;
    __int16 v20 = 1024;
    unsigned int v21 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%{public}s :%d:%d", (uint8_t *)&v16, 0x18u);
  }

  [(NCBSBridgeSetupController *)self setCmsForRunningFlow:v5];
  objc_super v8 = objc_opt_class();
  uint64_t v9 = [(NCBSBridgeSetupController *)self cmsForRunningFlow];
  int v10 = [(NCBSBridgeSetupController *)self runningFlow];
  v11 = [v8 _controllerClassFlowForContactsManagementState:v9 priorFlow:v10];
  [(NCBSBridgeSetupController *)self setRunningFlow:v11];

  [(NCBSBridgeSetupController *)self setFamilyMemberContactsStatusAtStartOfFlow:[(NCBSBridgeSetupController *)self _familyMemberContactsStatusForContactsCountStatus:v4]];
  [(NCBSBridgeSetupController *)self setSetupGuardianHasContactsToDonate:[(NCBSBridgeSetupController *)self _setupGuardianHasContacts]];
  __int16 v12 = NCBS_Tinker_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [(NCBSBridgeSetupController *)self cmsForRunningFlow];
    unsigned int v14 = [(NCBSBridgeSetupController *)self familyMemberContactsStatusAtStartOfFlow];
    unsigned int v15 = [(NCBSBridgeSetupController *)self setupGuardianHasContactsToDonate];
    int v16 = 136446978;
    unsigned int v17 = "-[NCBSBridgeSetupController _updateForContactsManagementState:contactsCountStatus:]";
    __int16 v18 = 1024;
    unsigned int v19 = v13;
    __int16 v20 = 1024;
    unsigned int v21 = v14;
    __int16 v22 = 1024;
    unsigned int v23 = v15;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}s - updated cmsForRunningFlow: %d familyMemberContactsStatusAtStartOfFlow: %d setupGuardianHasContactsToDonate: %d", (uint8_t *)&v16, 0x1Eu);
  }
}

- (BOOL)_shouldPromptForiCloudSync
{
  if ([(NCBSBridgeSetupController *)self cmsForRunningFlow] == 100
    || [(NCBSBridgeSetupController *)self cmsForRunningFlow] == 101
    || [(NCBSBridgeSetupController *)self cmsForRunningFlow] == 102)
  {
    return ![(NCBSBridgeSetupController *)self promptedForiCloudSync];
  }
  else
  {
    return 0;
  }
}

- (id)_iCloudSyncPromptAlertTitleStringForNeedToEnableDataAccess:(BOOL)a3 needToEnableiCloudSync:(BOOL)a4 needToMergeContacts:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (a3)
  {
    objc_super v8 = NanoContactsBridgeSetupBundle();
    if (v6)
    {
      if (v5) {
        CFStringRef v9 = @"TK_CONTACTS_ENABLE_SYNC_REQUEST_TITLE_DATAACCESS_ICLOUDSYNC_MERGECONTACTS";
      }
      else {
        CFStringRef v9 = @"TK_CONTACTS_ENABLE_SYNC_REQUEST_TITLE_DATAACCESS_ICLOUDSYNC";
      }
    }
    else
    {
      CFStringRef v9 = @"TK_CONTACTS_ENABLE_SYNC_REQUEST_TITLE_DATAACCESS";
    }
  }
  else
  {
    if (!a4) {
      goto LABEL_14;
    }
    objc_super v8 = NanoContactsBridgeSetupBundle();
    if (v5) {
      CFStringRef v9 = @"TK_CONTACTS_ENABLE_SYNC_REQUEST_TITLE_ICLOUDSYNC_MERGECONTACTS";
    }
    else {
      CFStringRef v9 = @"TK_CONTACTS_ENABLE_SYNC_REQUEST_TITLE_ICLOUDSYNC";
    }
  }
  int v10 = [v8 localizedStringForKey:v9 value:&stru_1C900 table:@"NanoContactsBridgeSetup"];

  if (v10)
  {
    v11 = NCBS_Tinker_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 136447234;
      unsigned int v14 = "-[NCBSBridgeSetupController _iCloudSyncPromptAlertTitleStringForNeedToEnableDataAccess:needToEnableiCloudSyn"
            "c:needToMergeContacts:]";
      __int16 v15 = 1024;
      BOOL v16 = v7;
      __int16 v17 = 1024;
      BOOL v18 = v6;
      __int16 v19 = 1024;
      BOOL v20 = v5;
      __int16 v21 = 2112;
      __int16 v22 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%{public}s :%d:%d:%d => %@", (uint8_t *)&v13, 0x28u);
    }
    goto LABEL_17;
  }
LABEL_14:
  v11 = NCBS_Tinker_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136446978;
    unsigned int v14 = "-[NCBSBridgeSetupController _iCloudSyncPromptAlertTitleStringForNeedToEnableDataAccess:needToEnableiCloudSync:"
          "needToMergeContacts:]";
    __int16 v15 = 1024;
    BOOL v16 = v7;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    __int16 v19 = 1024;
    BOOL v20 = v5;
    _os_log_error_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "%{public}s :%d:%d:%d - no format string", (uint8_t *)&v13, 0x1Eu);
  }
  int v10 = 0;
LABEL_17:

  return v10;
}

- (id)_iCloudSyncPromptAlertMessageStringForNeedToEnableDataAccess:(BOOL)a3 needToEnableiCloudSync:(BOOL)a4 needToMergeContacts:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (a3)
  {
    CFStringRef v9 = NanoContactsBridgeSetupBundle();
    if (v6)
    {
      if (v5) {
        CFStringRef v10 = @"TK_CONTACTS_ENABLE_SYNC_REQUEST_MESSAGE_DATAACCESS_ICLOUDSYNC_MERGECONTACTS_%@";
      }
      else {
        CFStringRef v10 = @"TK_CONTACTS_ENABLE_SYNC_REQUEST_MESSAGE_DATAACCESS_ICLOUDSYNC_%@";
      }
    }
    else
    {
      CFStringRef v10 = @"TK_CONTACTS_ENABLE_SYNC_REQUEST_MESSAGE_DATAACCESS_%@";
    }
  }
  else
  {
    if (!a4) {
      goto LABEL_14;
    }
    CFStringRef v9 = NanoContactsBridgeSetupBundle();
    if (v5) {
      CFStringRef v10 = @"TK_CONTACTS_ENABLE_SYNC_REQUEST_MESSAGE_ICLOUDSYNC_MERGECONTACTS_%@";
    }
    else {
      CFStringRef v10 = @"TK_CONTACTS_ENABLE_SYNC_REQUEST_MESSAGE_ICLOUDSYNC_%@";
    }
  }
  v11 = [v9 localizedStringForKey:v10 value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  __int16 v12 = [(NCBSBridgeSetupController *)self familyMemberFirstName];
  int v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);

  if (v13)
  {
    unsigned int v14 = NCBS_Tinker_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136447234;
      __int16 v17 = "-[NCBSBridgeSetupController _iCloudSyncPromptAlertMessageStringForNeedToEnableDataAccess:needToEnableiCloudS"
            "ync:needToMergeContacts:]";
      __int16 v18 = 1024;
      BOOL v19 = v7;
      __int16 v20 = 1024;
      BOOL v21 = v6;
      __int16 v22 = 1024;
      BOOL v23 = v5;
      __int16 v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "%{public}s :%d:%d:%d => %@", buf, 0x28u);
    }
    goto LABEL_17;
  }
LABEL_14:
  unsigned int v14 = NCBS_Tinker_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v17 = "-[NCBSBridgeSetupController _iCloudSyncPromptAlertMessageStringForNeedToEnableDataAccess:needToEnableiCloudSyn"
          "c:needToMergeContacts:]";
    __int16 v18 = 1024;
    BOOL v19 = v7;
    __int16 v20 = 1024;
    BOOL v21 = v6;
    __int16 v22 = 1024;
    BOOL v23 = v5;
    _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "%{public}s :%d:%d:%d - no format string", buf, 0x1Eu);
  }
  int v13 = 0;
LABEL_17:

  return v13;
}

- (void)_promptForiCloudSyncFollowingController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NCContactsSyncDataAccessHelper *)self->_contactsSyncDataAccessHelper networkAccessEnabledForContacts];
  unsigned int v6 = [(NCContactsiCloudSyncHelper *)self->_iCloudSyncHelper primaryiCloudAccountCardDAVEnabled];
  BOOL v7 = (v6 & 1) == 0
    && [(NCContactsiCloudSyncHelper *)self->_iCloudSyncHelper enablingPrimaryiCloudAccountRequiresMergeFromLocal];
  char v8 = v6 ^ 1;
  __int16 v20 = [(NCBSBridgeSetupController *)self _iCloudSyncPromptAlertTitleStringForNeedToEnableDataAccess:v5 ^ 1 needToEnableiCloudSync:v6 ^ 1 needToMergeContacts:v7];
  BOOL v19 = [(NCBSBridgeSetupController *)self _iCloudSyncPromptAlertMessageStringForNeedToEnableDataAccess:v5 ^ 1 needToEnableiCloudSync:v6 ^ 1 needToMergeContacts:v7];
  CFStringRef v9 = +[UIAlertController alertControllerWithTitle:v20 message:v19 preferredStyle:1];
  CFStringRef v10 = NanoContactsBridgeSetupBundle();
  v11 = [v10 localizedStringForKey:@"TK_CONTACTS_ENABLE_SYNC_REQUEST_BUTTON_ENABLE" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_B234;
  v23[3] = &unk_1C768;
  char v25 = v5 ^ 1;
  v23[4] = self;
  char v26 = v8;
  id v12 = v4;
  id v24 = v12;
  int v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v23];
  [v9 addAction:v13];

  unsigned int v14 = NanoContactsBridgeSetupBundle();
  __int16 v15 = [v14 localizedStringForKey:@"TK_CONTACTS_ENABLE_SYNC_REQUEST_BUTTON_SETUP_LATER" value:&stru_1C900 table:@"NanoContactsBridgeSetup"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_B3D0;
  v21[3] = &unk_1C790;
  v21[4] = self;
  id v22 = v12;
  id v16 = v12;
  __int16 v17 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v21];
  [v9 addAction:v17];

  [(NCBSBridgeSetupController *)self setPromptedForiCloudSync:1];
  __int16 v18 = [(NCBSBridgeSetupController *)self viewController];
  [v18 presentViewController:v9 animated:1 completion:0];
}

- (void)_fetchContactsManagementStateWithHoldWaitUIAndCompletionHandler:(id)a3
{
  id v4 = a3;
  [(NCBSBridgeSetupController *)self setShowingHoldWait:1];
  unsigned int v5 = [(NCBSBridgeSetupController *)self contactsManagementStateManager];
  unsigned int v6 = NCBS_Tinker_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v13 = "-[NCBSBridgeSetupController _fetchContactsManagementStateWithHoldWaitUIAndCompletionHandler:]";
    __int16 v14 = 2112;
    __int16 v15 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s - querying contactsManagementStateManager (this may take a while): %@", buf, 0x16u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_B5E4;
  v9[3] = &unk_1C7E0;
  v9[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v8 fetchContactsManagementStateWithCompletionHandler:v9];
}

- (void)_updateContactsManagementStateWithHoldWaitUIThenStepCompleteController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[NCBSBridgeSetupController _updateContactsManagementStateWithHoldWaitUIThenStepCompleteController:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: %@", buf, 0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_B910;
  v7[3] = &unk_1C808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NCBSBridgeSetupController *)self _fetchContactsManagementStateWithHoldWaitUIAndCompletionHandler:v7];
}

- (void)miniFlowStepComplete:(id)a3
{
  id v4 = a3;
  unsigned int v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136446466;
    __int16 v17 = "-[NCBSBridgeSetupController miniFlowStepComplete:]";
    __int16 v18 = 2112;
    BOOL v19 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: %@", (uint8_t *)&v16, 0x16u);
  }

  if ([(NCBSBridgeSetupController *)self _shouldPromptForiCloudSync])
  {
    BOOL v6 = [(NCBSBridgeSetupController *)self _contactsSyncEnabledWithNetworkAccess];
    id v7 = [(NCBSBridgeSetupController *)self contactsManagementStateManager];
    [v7 setContactsSyncAndNetworkAccessEnabled:v6];

    if (v6)
    {
      [(NCBSBridgeSetupController *)self _updateContactsManagementStateWithHoldWaitUIThenStepCompleteController:v4];
    }
    else
    {
      id v12 = NCBS_Tinker_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136446210;
        __int16 v17 = "-[NCBSBridgeSetupController miniFlowStepComplete:]";
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}s - prompting for iCloud sync", (uint8_t *)&v16, 0xCu);
      }

      [(NCBSBridgeSetupController *)self _promptForiCloudSyncFollowingController:v4];
    }
  }
  else
  {
    id v8 = [(NCBSBridgeSetupController *)self runningFlow];
    CFStringRef v9 = (char *)[v8 indexOfObject:objc_opt_class()];
    if (v9 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = NCBS_Tinker_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unsigned int v11 = [(NCBSBridgeSetupController *)self cmsForRunningFlow];
        int v16 = 136446978;
        __int16 v17 = "-[NCBSBridgeSetupController miniFlowStepComplete:]";
        __int16 v18 = 2112;
        BOOL v19 = v4;
        __int16 v20 = 1024;
        unsigned int v21 = v11;
        __int16 v22 = 2112;
        BOOL v23 = v8;
        _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "%{public}s - completedController %@ not found in flow[%d] %@", (uint8_t *)&v16, 0x26u);
      }
    }
    else
    {
      id v10 = [(NCBSBridgeSetupController *)self _nextControllerToRunAtOrAfterIndex:v9 + 1];
      int v13 = NCBS_Tinker_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v14)
        {
          int v16 = 136446466;
          __int16 v17 = "-[NCBSBridgeSetupController miniFlowStepComplete:]";
          __int16 v18 = 2112;
          BOOL v19 = v10;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}s - pushing %@", (uint8_t *)&v16, 0x16u);
        }

        __int16 v15 = [v4 navigationController];
        [v15 pushViewController:v10 animated:1];
      }
      else
      {
        if (v14)
        {
          int v16 = 136446210;
          __int16 v17 = "-[NCBSBridgeSetupController miniFlowStepComplete:]";
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}s - no next controller -> buddyControllerDone", (uint8_t *)&v16, 0xCu);
        }

        __int16 v15 = [(NCBSBridgeSetupController *)self delegate];
        [v15 buddyControllerDone:self];
      }
    }
  }
}

- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4
{
  id v5 = objc_alloc_init(a4);
  [v5 setMiniFlowDelegate:self];
  [(NCBSBridgeSetupController *)self pushController:v5 animated:1];
}

- (id)familyMember
{
  v2 = [(NCBSBridgeSetupController *)self delegate];
  v3 = [v2 setupFlowUserInfo];
  id v4 = [v3 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

  return v4;
}

- (id)familyMemberFirstName
{
  v2 = [(NCBSBridgeSetupController *)self familyMember];
  v3 = [v2 firstName];

  return v3;
}

- (id)setupGuardian
{
  v3 = [(NCBSBridgeSetupController *)self delegate];
  id v4 = [v3 setupFlowUserInfo];
  id v5 = [v4 objectForKeyedSubscript:BPSPairingFlowFamilyPairingParent];

  if (!v5)
  {
    BOOL v6 = [(NCBSBridgeSetupController *)self delegate];
    id v7 = [v6 setupFlowUserInfo];
    id v5 = [v7 objectForKeyedSubscript:BPSPairingFlowFamilyOrganizer];

    id v8 = NCBS_Tinker_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446210;
      unsigned int v11 = "-[NCBSBridgeSetupController setupGuardian]";
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s - no BPSPairingFlowFamilyPairingParent, fell back to BPSPairingFlowFamilyOrganizer", (uint8_t *)&v10, 0xCu);
    }
  }

  return v5;
}

- (void)requestContactsManagementWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NCBSBridgeSetupController *)self contactsManagementStateManager];
  BOOL v6 = [v5 familyMember];
  id v7 = NCBS_Tinker_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    CFStringRef v9 = "-[NCBSBridgeSetupController requestContactsManagementWithCompletionHandler:]";
    __int16 v10 = 2112;
    unsigned int v11 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s - requestContactsManagementForFamilyMember: %@", (uint8_t *)&v8, 0x16u);
  }

  [v5 requestContactsManagementForFamilyMember:v6 completionHandler:v4];
}

- (BOOL)activePairingDeviceSupportsContactsApp
{
  v2 = [(NCBSBridgeSetupController *)self delegate];
  v3 = [v2 activePairingDevice];

  if (v3)
  {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"CBF3763A-5F42-4463-B714-39903987FE90"];
    unsigned __int8 v5 = [v3 supportsCapability:v4];

    BOOL v6 = NCBS_Tinker_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSStringFromBOOL();
      int v16 = 136446466;
      __int16 v17 = "-[NCBSBridgeSetupController activePairingDeviceSupportsContactsApp]";
      __int16 v18 = 2112;
      BOOL v19 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s - %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    BOOL v6 = NCBS_Tinker_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10A20(v6, v8, v9, v10, v11, v12, v13, v14);
    }
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)holdBeforeDisplaying
{
  v3 = [(NCBSBridgeSetupController *)self familyMember];

  if (v3)
  {
    [(NCBSBridgeSetupController *)self _checkContactsManagementAndEnqueueReleaseHold];
  }
  else
  {
    id v4 = NCBS_Tinker_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446210;
      uint64_t v9 = "-[NCBSBridgeSetupController holdBeforeDisplaying]";
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s - !self.familyMember, waiting for BPSTinkerFamilyMemberNameSet", (uint8_t *)&v8, 0xCu);
    }

    unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_familyMemberSetNotification:" name:BPSTinkerFamilyMemberNameSet object:0];
  }
  BOOL v6 = NCBS_Tinker_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    uint64_t v9 = "-[NCBSBridgeSetupController holdBeforeDisplaying]";
    __int16 v10 = 1024;
    int v11 = 1;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s -> %d", (uint8_t *)&v8, 0x12u);
  }

  return 1;
}

- (void)_familyMemberSetNotification:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136446466;
    __int16 v17 = "-[NCBSBridgeSetupController _familyMemberSetNotification:]";
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: %@", (uint8_t *)&v16, 0x16u);
  }

  BOOL v6 = [(NCBSBridgeSetupController *)self familyMember];

  if (!v6)
  {
    id v7 = NCBS_Tinker_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10A98(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  __int16 v15 = +[NSNotificationCenter defaultCenter];
  [v15 removeObserver:self name:BPSTinkerFamilyMemberNameSet object:0];

  [(NCBSBridgeSetupController *)self _checkContactsManagementAndEnqueueReleaseHold];
}

- (void)_checkContactsManagementAndEnqueueReleaseHold
{
  v3 = [(NCBSBridgeSetupController *)self contactsManagementStateManager];
  id v4 = NCBS_Tinker_log();
  unsigned __int8 v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v8 = "-[NCBSBridgeSetupController _checkContactsManagementAndEnqueueReleaseHold]";
      __int16 v9 = 2112;
      uint64_t v10 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - querying contactsManagementStateManager (this may take a while): %@", buf, 0x16u);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_C660;
    v6[3] = &unk_1C830;
    v6[4] = self;
    [v3 fetchContactsManagementStateWithCompletionHandler:v6];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10B10(self, v5);
    }

    [(NCBSBridgeSetupController *)self _enqueueReleaseHoldWithSkip:1];
  }
}

- (void)_enqueueReleaseHoldWithSkip:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v9 = "-[NCBSBridgeSetupController _enqueueReleaseHoldWithSkip:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: %d [dispatch]", buf, 0x12u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C8B8;
  v6[3] = &unk_1C858;
  BOOL v7 = v3;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

+ (BOOL)controllerNeedsToRunForContactsManagementState:(int)a3
{
  BOOL v3 = [(id)objc_opt_class() _controllerClassFlowForContactsManagementState:*(void *)&a3 priorFlow:0];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

+ (id)_controllerClassFlowForContactsManagementState:(int)a3 priorFlow:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 0:
      BOOL v7 = NCBS_Tinker_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10C3C(v7);
      }

      goto LABEL_7;
    case 1:
      if ([v6 containsObject:objc_opt_class()])
      {
        v32[0] = objc_opt_class();
        v32[1] = objc_opt_class();
        uint64_t v8 = v32;
        goto LABEL_15;
      }
      uint64_t v31 = objc_opt_class();
      uint64_t v8 = &v31;
      uint64_t v12 = 1;
      goto LABEL_16;
    case 2:
      __int16 v10 = NCBS_Tinker_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10CCC(v10);
      }

      uint64_t v11 = [a1 _controllerClassFlowForContactsManagementState:3 priorFlow:v6];
      goto LABEL_17;
    case 3:
      v30[0] = objc_opt_class();
      v30[1] = objc_opt_class();
      uint64_t v8 = v30;
      goto LABEL_15;
    case 4:
      v29[0] = objc_opt_class();
      v29[1] = objc_opt_class();
      uint64_t v8 = v29;
      goto LABEL_15;
    case 5:
      v28[0] = objc_opt_class();
      v28[1] = objc_opt_class();
      v28[2] = objc_opt_class();
      v28[3] = objc_opt_class();
      uint64_t v8 = v28;
      uint64_t v12 = 4;
      goto LABEL_16;
    default:
      if ((a3 - 100) >= 3)
      {
LABEL_7:
        __int16 v9 = 0;
      }
      else
      {
        v27[0] = objc_opt_class();
        v27[1] = objc_opt_class();
        uint64_t v8 = v27;
LABEL_15:
        uint64_t v12 = 2;
LABEL_16:
        uint64_t v11 = +[NSArray arrayWithObjects:v8 count:v12];
LABEL_17:
        __int16 v9 = (void *)v11;
      }
      uint64_t v13 = NCBS_Tinker_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136446978;
        __int16 v20 = "+[NCBSBridgeSetupController _controllerClassFlowForContactsManagementState:priorFlow:]";
        __int16 v21 = 1024;
        int v22 = a3;
        __int16 v23 = 2114;
        id v24 = v9;
        __int16 v25 = 2114;
        id v26 = v6;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}s: %d -> %{public}@ (priorFlow: %{public}@)", (uint8_t *)&v19, 0x26u);
      }

      id v14 = [v6 count];
      if (v14 > [v9 count])
      {
        __int16 v15 = NCBS_Tinker_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v17 = [v6 count];
          id v18 = [v9 count];
          int v19 = 136446978;
          __int16 v20 = "+[NCBSBridgeSetupController _controllerClassFlowForContactsManagementState:priorFlow:]";
          __int16 v21 = 1024;
          int v22 = a3;
          __int16 v23 = 2048;
          id v24 = v17;
          __int16 v25 = 2048;
          id v26 = v18;
          _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "%{public}s: %d; reduced flow element count (%tu -> %tu)",
            (uint8_t *)&v19,
            0x26u);
        }
      }
      return v9;
  }
}

- (id)contactsManagementStateManager
{
  contactsManagementStateManager = self->_contactsManagementStateManager;
  if (!contactsManagementStateManager)
  {
    BOOL v4 = [(NCBSBridgeSetupController *)self delegate];
    unsigned __int8 v5 = +[NCABTinkerContactsManagementStateManager managerForBuddyControllerDelegate:v4];
    id v6 = self->_contactsManagementStateManager;
    self->_contactsManagementStateManager = v5;

    [(NCABTinkerContactsManagementStateManager *)self->_contactsManagementStateManager setContactsSyncAndNetworkAccessEnabled:0];
    contactsManagementStateManager = self->_contactsManagementStateManager;
  }

  return contactsManagementStateManager;
}

- (id)_nextControllerToRunAtOrAfterIndex:(unint64_t)a3
{
  unsigned __int8 v5 = [(NCBSBridgeSetupController *)self runningFlow];
  if ((unint64_t)[v5 count] <= a3)
  {
    id v10 = 0;
  }
  else
  {
    *(void *)&long long v6 = 136446466;
    long long v14 = v6;
    do
    {
      BOOL v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", a3, v14);
      if (objc_opt_respondsToSelector()) {
        unsigned int v8 = [v7 controllerNeedsToRunWithMiniFlowDelegate:self];
      }
      else {
        unsigned int v8 = 1;
      }
      __int16 v9 = NCBS_Tinker_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        int v16 = "-[NCBSBridgeSetupController _nextControllerToRunAtOrAfterIndex:]";
        __int16 v17 = 2048;
        unint64_t v18 = a3;
        __int16 v19 = 1024;
        unsigned int v20 = v8;
        __int16 v21 = 2112;
        int v22 = v7;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s - controllerFlowIndex: %tu runController: %d controllerClass: %@", buf, 0x26u);
      }

      if (v8)
      {
        id v10 = objc_msgSend(objc_msgSend(v7, "alloc"), "init");
        [v10 setMiniFlowDelegate:self];
      }
      else
      {
        uint64_t v11 = NCBS_Tinker_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          int v16 = "-[NCBSBridgeSetupController _nextControllerToRunAtOrAfterIndex:]";
          __int16 v17 = 2112;
          unint64_t v18 = (unint64_t)v7;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}s - skipping controllerClass: %@", buf, 0x16u);
        }

        id v10 = 0;
      }
      ++a3;
    }
    while (a3 < (unint64_t)[v5 count] && !v10);
  }
  uint64_t v12 = NCBS_Tinker_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v16 = "-[NCBSBridgeSetupController _nextControllerToRunAtOrAfterIndex:]";
    __int16 v17 = 2112;
    unint64_t v18 = (unint64_t)v10;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}s - returning %@", buf, 0x16u);
  }

  return v10;
}

- (int)_familyMemberContactsStatusForContactsCountStatus:(int)a3
{
  if (a3 == 4) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if (a3 == 5) {
    return 3;
  }
  else {
    return v3;
  }
}

- (BOOL)_contactsSyncEnabledWithNetworkAccess
{
  unsigned int v3 = [(NCContactsiCloudSyncHelper *)self->_iCloudSyncHelper primaryiCloudAccountCardDAVEnabled];
  unsigned int v4 = [(NCContactsSyncDataAccessHelper *)self->_contactsSyncDataAccessHelper networkAccessEnabledForContacts];
  unsigned __int8 v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136446722;
    unsigned int v8 = "-[NCBSBridgeSetupController _contactsSyncEnabledWithNetworkAccess]";
    __int16 v9 = 1024;
    unsigned int v10 = v3;
    __int16 v11 = 1024;
    unsigned int v12 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%{public}s - primaryiCloudAccountCardDAVEnabled: %d, networkAccessEnabledForContacts: %d", (uint8_t *)&v7, 0x18u);
  }

  return v3 & v4;
}

- (BOOL)_setupGuardianHasContacts
{
  v2 = +[NCABContactsSyncHelper localDeviceContactsCount];
  id v3 = [v2 unsignedIntegerValue];
  unsigned int v4 = NCBS_Tinker_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[NCBSBridgeSetupController _setupGuardianHasContacts]";
    __int16 v8 = 2114;
    __int16 v9 = v2;
    __int16 v10 = 1024;
    BOOL v11 = v3 != 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s - contactCountNumber: %{public}@ -> hasContacts: %d", (uint8_t *)&v6, 0x1Cu);
  }

  return v3 != 0;
}

- (void)setShowingHoldWait:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = NCBS_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136446466;
    __int16 v21 = "-[NCBSBridgeSetupController setShowingHoldWait:]";
    __int16 v22 = 1024;
    BOOL v23 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: %d", (uint8_t *)&v20, 0x12u);
  }

  int v6 = [(NCBSBridgeSetupController *)self navigationController];
  int v7 = v6;
  if (v3)
  {
    __int16 v8 = [v6 topViewController];
    __int16 v9 = [v8 view];
    [v9 setUserInteractionEnabled:0];

    __int16 v10 = [(NCBSBridgeSetupController *)self navigationController];
    BOOL v11 = [v10 navigationBar];
    [v11 setUserInteractionEnabled:0];

    id v12 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithFrame:", 0.0, 0.0, 20.0, 20.0);
    id v13 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v12];
    long long v14 = [(NCBSBridgeSetupController *)self navigationController];
    __int16 v15 = [v14 navigationBar];

    int v16 = [v15 topItem];
    [v16 setRightBarButtonItem:v13 animated:1];
    [v12 startAnimating];
  }
  else
  {
    id v12 = [v6 navigationBar];

    id v13 = [v12 topItem];
    [v13 setRightBarButtonItem:0 animated:1];
    __int16 v17 = [(NCBSBridgeSetupController *)self navigationController];
    unint64_t v18 = [v17 topViewController];
    __int16 v19 = [v18 view];
    [v19 setUserInteractionEnabled:1];

    __int16 v15 = [(NCBSBridgeSetupController *)self navigationController];
    int v16 = [v15 navigationBar];
    [v16 setUserInteractionEnabled:1];
  }
}

- (int)setupGuardianHasContactsToDonate
{
  return self->setupGuardianHasContactsToDonate;
}

- (void)setSetupGuardianHasContactsToDonate:(int)a3
{
  self->setupGuardianHasContactsToDonate = a3;
}

- (int)cmsForRunningFlow
{
  return self->_cmsForRunningFlow;
}

- (void)setCmsForRunningFlow:(int)a3
{
  self->_cmsForRunningFlow = a3;
}

- (NSArray)runningFlow
{
  return self->_runningFlow;
}

- (void)setRunningFlow:(id)a3
{
}

- (BPSMiniFlowStepController)firstViewControllerForCurrentFlow
{
  return self->_firstViewControllerForCurrentFlow;
}

- (void)setFirstViewControllerForCurrentFlow:(id)a3
{
}

- (int)familyMemberContactsStatusAtStartOfFlow
{
  return self->_familyMemberContactsStatusAtStartOfFlow;
}

- (void)setFamilyMemberContactsStatusAtStartOfFlow:(int)a3
{
  self->_familyMemberContactsStatusAtStartOfFlow = a3;
}

- (BOOL)promptedForiCloudSync
{
  return self->_promptedForiCloudSync;
}

- (void)setPromptedForiCloudSync:(BOOL)a3
{
  self->_promptedForiCloudSync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstViewControllerForCurrentFlow, 0);
  objc_storeStrong((id *)&self->_runningFlow, 0);
  objc_storeStrong((id *)&self->_contactsSyncDataAccessHelper, 0);
  objc_storeStrong((id *)&self->_iCloudSyncHelper, 0);

  objc_storeStrong((id *)&self->_contactsManagementStateManager, 0);
}

@end