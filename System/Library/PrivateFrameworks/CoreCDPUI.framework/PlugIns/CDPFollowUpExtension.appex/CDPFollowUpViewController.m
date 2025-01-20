@interface CDPFollowUpViewController
- (AAUIGrandSlamRemoteUIPresenter)grandSlamPresenter;
- (BOOL)_isSOSCompatibilityActionIdentifier:(id)a3;
- (BOOL)_synchronizeFollowUpsWithProvider:(id)a3 error:(id *)a4;
- (CDPUIADPUpsellErrorPresenter)adpUpsellErrorPresenter;
- (UIViewController)adpUpsellLandingScreen;
- (id)_contextForActionIdentifier:(id)a3;
- (id)_followupProvider;
- (id)_makeADPUpsellLandingPageViewedEventWithCDPContext:(id)a3;
- (id)_makeEscapeOfferSelectedEventForOffer:(id)a3 withContext:(id)a4;
- (id)_navController;
- (id)_spinnerViewController;
- (id)accountsForAccountManager:(id)a3;
- (id)grandSlamPresenterWithPresentingScreen:(id)a3;
- (void)_apdUpsellSetupCDPContextForAccountWithAltDSID:(id)a3 itemIdentifier:(id)a4;
- (void)_beginExtensionFlowWithAction:(id)a3;
- (void)_beginLocalSecretCreateActionFlow;
- (void)_beginUpsellFlowOnIOSUsingContext:(id)a3 completion:(id)a4;
- (void)_beginWalrusEnablementFromUpsellCFU;
- (void)_clearADPUpsellFollowUp;
- (void)_clearADPUpsellFollowUpWithAKController;
- (void)_clearFollowUpWithAKControllerWithItemID:(id)a3;
- (void)_clearLocalSecretCreateFollowUp;
- (void)_clearRecoveryKeyRepairFollowUp;
- (void)_clearSOSCompatibilityModeFollowUp;
- (void)_clearSecureTermsFollowUp;
- (void)_handleADPUpsellHTTPResponse:(id)a3;
- (void)_harvestWebAccessStatus:(id)a3;
- (void)_postADPUpsellActionEventForItem:(id)a3 selectedAction:(id)a4;
- (void)_presentAKServerUIWithUrlKey:(id)a3 altDSID:(id)a4 itemID:(id)a5 completion:(id)a6;
- (void)_secureTermsTearDownWithUpdatedSecret:(BOOL)a3 error:(id)a4;
- (void)_setupEncryptionFlowContextWithAltDSID:(id)a3;
- (void)_setupSOSCompatibilityModeEnabledFlowWithContext:(id)a3;
- (void)_setupWithContext:(id)a3;
- (void)_showADPUpsellNetworkError;
- (void)_showGenericTermsUI;
- (void)followUpPerformUpdateWithCompletionHandler:(id)a3;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)loadView;
- (void)presentAlertUIWithCompletion:(id)a3;
- (void)presentFullUIWithCompletion:(id)a3;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)processNotSupportedItem:(id)a3 altDSID:(id)a4 completion:(id)a5 hasFullCDPSupport:(BOOL)a6;
- (void)remoteUIDidDismiss:(id)a3;
- (void)remoteUIDidHandleButton:(id)a3;
- (void)remoteUIDidReceiveHTTPResponse:(id)a3;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)setAdpUpsellErrorPresenter:(id)a3;
- (void)setAdpUpsellLandingScreen:(id)a3;
- (void)setGrandSlamPresenter:(id)a3;
- (void)uiController:(id)a3 prepareAlertContext:(id)a4;
- (void)uiController:(id)a3 preparePresentationContext:(id)a4;
- (void)upsellViewModelDidRequestBeginEnablementFlowWithContext:(id)a3;
- (void)upsellViewModelDidRequestCFUDismissalWithContext:(id)a3;
- (void)upsellViewModelDidRequestFlowCancellationWithContext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CDPFollowUpViewController

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)CDPFollowUpViewController;
  [(CDPFollowUpViewController *)&v5 loadView];
  v3 = +[UIColor clearColor];
  v4 = [(CDPFollowUpViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  objc_super v5 = [(CDPFollowUpViewController *)self _followupProvider];
  id v15 = 0;
  unsigned __int8 v6 = [(CDPFollowUpViewController *)self _synchronizeFollowUpsWithProvider:v5 error:&v15];
  id v7 = v15;

  if (v6)
  {
    unsigned int v8 = 1;
  }
  else
  {
    v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100009FFC();
    }

    v10 = +[AKFollowUpProviderFactory sharedAuthKitFollowupProvider];
    id v14 = 0;
    unsigned int v8 = [(CDPFollowUpViewController *)self _synchronizeFollowUpsWithProvider:v10 error:&v14];
    id v7 = v14;
  }
  v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100009F94();
  }

  v12 = [v7 domain];
  if ([v12 isEqualToString:AKAppleIDAuthenticationErrorDomain]) {
    BOOL v13 = [v7 code] == (id)-7064;
  }
  else {
    BOOL v13 = 0;
  }

  if (v4) {
    v4[2](v4, !v13 & ~v8);
  }
}

- (BOOL)_synchronizeFollowUpsWithProvider:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (AKFollowUpSynchronizer *)objc_alloc_init((Class)AKFollowUpSynchronizer);
  followupSynchronizer = self->_followupSynchronizer;
  self->_followupSynchronizer = v7;

  [(AKFollowUpSynchronizer *)self->_followupSynchronizer setFollowupProvider:v6];
  if (objc_opt_respondsToSelector())
  {
    v9 = self->_followupSynchronizer;
    v10 = +[CDPAccount sharedInstance];
    v11 = [v10 primaryAppleAccount];
    id v15 = 0;
    unsigned __int8 v12 = [(AKFollowUpSynchronizer *)v9 synchronizeFollowUpsForAccount:v11 error:&v15];
    id v13 = v15;

    if (a4) {
      *a4 = v13;
    }
  }
  else if (a4)
  {
    _CDPStateError();
    unsigned __int8 v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v12;
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v44 = a5;
  v10 = _os_activity_create((void *)&_mh_execute_header, "cdp: Processing follow up action", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v11 = _CDPLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v12 = [v8 uniqueIdentifier];
    id v13 = [v9 label];
    *(_DWORD *)buf = 138412546;
    v68 = v12;
    __int16 v69 = 2112;
    v70 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to process the item: %@ and the action: %@", buf, 0x16u);
  }
  id v14 = [v8 userInfo];
  id v15 = [v14 objectForKeyedSubscript:CDPFollowUpItemUserInfoKeyAltDSID];

  if (!v15)
  {
    v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Did not pick up altDSID from item.userInfo... using the primary account's altDSID through ACAccountStore", buf, 2u);
    }

    v17 = +[ACAccountStore defaultStore];
    v18 = objc_msgSend(v17, "aa_primaryAppleAccount");
    id v15 = objc_msgSend(v18, "aa_altDSID");
  }
  id v19 = +[CDPUtilities hasFullCDPSupport];
  v20 = [v9 userInfo];
  v21 = [v20 objectForKeyedSubscript:kCDPAKNativeActionKey];
  akNativeAction = self->_akNativeAction;
  self->_akNativeAction = v21;

  v23 = [v9 userInfo];
  v24 = [v23 objectForKeyedSubscript:kCDPAKFollowUpURLKey];
  urlKey = self->_urlKey;
  self->_urlKey = v24;

  if (!v19) {
    goto LABEL_29;
  }
  v26 = [v9 identifier];
  if ([v26 isEqualToString:kRepairCDPStateActionContinue])
  {
LABEL_19:

LABEL_20:
    objc_storeStrong((id *)&self->_followUpAction, a4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000053C0;
    block[3] = &unk_100010470;
    id v62 = v15;
    id v63 = v8;
    v64 = self;
    id v65 = v44;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_30;
  }
  v27 = [v9 identifier];
  if ([v27 isEqualToString:kOfflineLocalSecretChangeActionContinue])
  {
LABEL_18:

    goto LABEL_19;
  }
  v43 = [v9 identifier];
  if ([v43 isEqualToString:kRepairCDPStateActionRecoveryKey])
  {
LABEL_17:

    goto LABEL_18;
  }
  v42 = [v9 identifier];
  if ([v42 isEqualToString:kSecureTermsActionContinue])
  {
LABEL_16:

    goto LABEL_17;
  }
  v41 = [v9 identifier];
  if ([v41 isEqualToString:kConfirmExistingSecretActionContinue])
  {
LABEL_15:

    goto LABEL_16;
  }
  v40 = [v9 identifier];
  if ([v40 isEqualToString:kADPStateHealingActionContinue])
  {

    goto LABEL_15;
  }
  v39 = [v9 identifier];
  unsigned __int8 v38 = [v39 isEqualToString:kEDPOnlyRepairActionContinue];

  if (v38) {
    goto LABEL_20;
  }
  v28 = [v9 identifier];
  unsigned int v29 = [v28 isEqualToString:kOfflineLocalSecretCreateActionContinue];

  if (v29)
  {
    objc_storeStrong((id *)&self->_followUpAction, a4);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100005504;
    v58[3] = &unk_100010498;
    v58[4] = self;
    id v59 = v15;
    id v60 = v44;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v58);

    goto LABEL_30;
  }
  v30 = [v9 identifier];
  unsigned int v31 = [(CDPFollowUpViewController *)self _isSOSCompatibilityActionIdentifier:v30];

  if (v31)
  {
    objc_storeStrong((id *)&self->_followUpAction, a4);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100005550;
    v54[3] = &unk_100010498;
    id v55 = v8;
    v56 = self;
    id v57 = v44;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v54);

    goto LABEL_30;
  }
  v32 = [v8 uniqueIdentifier];
  unsigned int v33 = [v32 isEqualToString:kADPUpsellItemIdentifier];

  if (!v33)
  {
LABEL_29:
    [(CDPFollowUpViewController *)self processNotSupportedItem:v9 altDSID:v15 completion:v44 hasFullCDPSupport:v19];
    goto LABEL_30;
  }
  objc_storeStrong((id *)&self->_followUpAction, a4);
  v34 = [v8 uniqueIdentifier];
  [(CDPFollowUpViewController *)self _apdUpsellSetupCDPContextForAccountWithAltDSID:v15 itemIdentifier:v34];

  [(CDPFollowUpViewController *)self _postADPUpsellActionEventForItem:v8 selectedAction:v9];
  if (self->_urlKey)
  {
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000055E0;
    v52[3] = &unk_1000104C0;
    v52[4] = self;
    id v53 = v44;
    v35 = objc_retainBlock(v52);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100005708;
    v48[3] = &unk_100010470;
    v48[4] = self;
    id v49 = v15;
    id v50 = v8;
    id v51 = v35;
    v36 = v35;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v48);
  }
  else
  {
    id v37 = objc_alloc_init((Class)CDPWalrusStateController);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100005784;
    v45[3] = &unk_100010510;
    v45[4] = self;
    id v47 = v44;
    id v46 = v15;
    [v37 walrusStatusWithCompletion:v45];
  }
LABEL_30:

  os_activity_scope_leave(&state);
}

- (void)_apdUpsellSetupCDPContextForAccountWithAltDSID:(id)a3 itemIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AKAccountManager sharedInstance];
  id v9 = [v8 primaryAuthKitAccount];
  if (!v9)
  {
    v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000A420(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v18 = _CDPLogSystem();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v19) {
      sub_10000A3A8(v18, v20, v21, v22, v23, v24, v25, v26);
    }

    v27 = +[CDPContext contextForAccountWithAltDSID:v6];
  }
  else
  {
    if (v19) {
      sub_10000A330(v18, v20, v21, v22, v23, v24, v25, v26);
    }

    v27 = +[CDPContext contextForPrimaryAccount];
  }
  cdpContext = self->_cdpContext;
  self->_cdpContext = v27;

  p_cdpContext = (id *)&self->_cdpContext;
  if (!*p_cdpContext)
  {
    v30 = _CDPLogSystem();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10000A2B8(v30, v31, v32, v33, v34, v35, v36, v37);
    }
  }
  unsigned __int8 v38 = +[NSUUID UUID];
  v39 = [v38 UUIDString];
  [*p_cdpContext setTelemetryFlowID:v39];

  v40 = [v8 telemetryDeviceSessionIDForAccount:v9];
  [*p_cdpContext setTelemetryDeviceSessionID:v40];

  v41 = _CDPLogSystem();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    sub_10000A1F0(p_cdpContext);
  }

  [*p_cdpContext setFollowUpType:v7];
}

- (void)_postADPUpsellActionEventForItem:(id)a3 selectedAction:(id)a4
{
  if (-[NSString isEqualToString:](self->_urlKey, "isEqualToString:", kADPUpsellTearDownAction, a4))
  {
    cdpContext = self->_cdpContext;
    id v6 = &kADPUpsellCFURejected;
  }
  else
  {
    if (![(NSString *)self->_akNativeAction isEqualToString:kADPEnrollAction]) {
      return;
    }
    cdpContext = self->_cdpContext;
    id v6 = &kADPUpsellCFUTriggered;
  }
  id v7 = +[AAFAnalyticsEvent analyticsEventWithContext:cdpContext eventName:*v6 category:kCDPRTCEventCategoryAccountDataAccessRecovery];
  if (v7)
  {
    id v9 = v7;
    id v8 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
    [v8 sendEvent:v9];

    id v7 = v9;
  }
}

- (BOOL)_isSOSCompatibilityActionIdentifier:(id)a3
{
  return [a3 isEqualToString:kSOSCompatibilityActionContinue];
}

- (void)processNotSupportedItem:(id)a3 altDSID:(id)a4 completion:(id)a5 hasFullCDPSupport:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, uint64_t))a5;
  followUpAction = self->_followUpAction;
  self->_followUpAction = 0;

  uint64_t v14 = _CDPLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v10 identifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unknown Action %@, suppressing handling", buf, 0xCu);
  }
  if (!a6)
  {
    id v16 = objc_alloc_init((Class)CDPFollowUpController);
    uint64_t v17 = [v10 identifier];
    v18 = [(CDPFollowUpViewController *)self _contextForActionIdentifier:v17];

    [v18 setAltDSID:v11];
    if (v18)
    {
      id v22 = 0;
      [v16 clearFollowUpWithContext:v18 error:&v22];
      id v19 = v22;
      uint64_t v20 = _CDPLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v10 identifier];
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v21;
        __int16 v25 = 2112;
        id v26 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "cleared followp %@ with result: %@", buf, 0x16u);
      }
    }
  }
  v12[2](v12, 1);
}

- (id)_contextForActionIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kRepairCDPStateActionContinue])
  {
    uint64_t v5 = +[CDPFollowUpContext contextForStateRepair];
LABEL_15:
    id v6 = (void *)v5;
    goto LABEL_16;
  }
  if ([v4 isEqualToString:kOfflineLocalSecretChangeActionContinue])
  {
    uint64_t v5 = +[CDPFollowUpContext contextForOfflinePasscodeChange];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:kRepairCDPStateActionRecoveryKey])
  {
    uint64_t v5 = +[CDPFollowUpContext contextForRecoveryKeyRepair];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:kSecureTermsActionContinue])
  {
    uint64_t v5 = +[CDPFollowUpContext contextForSecureTerms];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:kConfirmExistingSecretActionContinue])
  {
    uint64_t v5 = +[CDPFollowUpContext contextForConfirmExistingSecret];
    goto LABEL_15;
  }
  if ([(CDPFollowUpViewController *)self _isSOSCompatibilityActionIdentifier:v4])
  {
    uint64_t v5 = +[CDPFollowUpContext contextForSOSCompatibilityMode];
    goto LABEL_15;
  }
  if ([v4 isEqualToString:kEDPOnlyRepairIdentifier])
  {
    uint64_t v5 = +[CDPFollowUpContext contextForEDPStateRepair];
    goto LABEL_15;
  }
  id v6 = 0;
LABEL_16:

  return v6;
}

- (void)_presentAKServerUIWithUrlKey:(id)a3 altDSID:(id)a4 itemID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = objc_alloc_init((Class)AKExtensionlessFollowUpHelperContext);
  [v14 setAltDSID:v13];

  [v14 setPresentingViewController:self];
  [v14 setUniqueItemIdentifier:v11];
  [v14 setUrlKey:v10];
  id v15 = objc_alloc_init((Class)AKAppleIDFollowUpServerUIPresenter);
  id v16 = +[AKFollowUpProviderFactory sharedAuthKitFollowupProvider];
  [v15 setFollowUpProvider:v16];

  uint64_t v17 = _CDPLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10000A498();
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100006168;
  v19[3] = &unk_100010538;
  v19[4] = self;
  id v20 = v11;
  id v18 = v11;
  [v15 presentServerUIWithContext:v14 withCompletion:v12 withResponse:v19];
}

- (void)_beginLocalSecretCreateActionFlow
{
  if (self->_context)
  {
    id v3 = [objc_alloc((Class)CDPUIDeviceToDeviceEncryptionHelper) initWithContext:self->_context];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000062A8;
    v4[3] = &unk_100010560;
    v4[4] = self;
    [v3 performDeviceToDeviceEncryptionStateRepairWithCompletion:v4];
  }
}

- (void)_beginExtensionFlowWithAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  unsigned int v6 = [v5 isEqualToString:kRepairCDPStateActionContinue];

  if (v6)
  {
    stateController = self->_stateController;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100006818;
    v40[3] = &unk_100010560;
    v40[4] = self;
    [(CDPStateController *)stateController repairCloudDataProtectionStateWithCompletion:v40];
    goto LABEL_24;
  }
  id v8 = [v4 identifier];
  unsigned int v9 = [v8 isEqualToString:kOfflineLocalSecretChangeActionContinue];

  if (v9)
  {
    id v10 = self->_stateController;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100006820;
    v39[3] = &unk_100010560;
    v39[4] = self;
    [(CDPStateController *)v10 finishOfflineLocalSecretChangeWithCompletion:v39];
    goto LABEL_24;
  }
  id v11 = [v4 identifier];
  unsigned int v12 = [v11 isEqualToString:kOfflineLocalSecretCreateActionContinue];

  if (v12)
  {
    [(CDPFollowUpViewController *)self _beginLocalSecretCreateActionFlow];
    goto LABEL_24;
  }
  id v13 = [v4 identifier];
  unsigned int v14 = [v13 isEqualToString:kSecureTermsActionContinue];

  if (v14)
  {
    [(CDPFollowUpViewController *)self _showGenericTermsUI];
    goto LABEL_24;
  }
  id v15 = [v4 identifier];
  unsigned int v16 = [v15 isEqualToString:kConfirmExistingSecretActionContinue];

  if (v16)
  {
    uint64_t v17 = self->_stateController;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100006828;
    v38[3] = &unk_100010560;
    v38[4] = self;
    [(CDPStateController *)v17 finishCyrusFlowAfterTermsAgreementWithContext:v38];
    goto LABEL_24;
  }
  id v18 = [v4 identifier];
  unsigned int v19 = [v18 isEqualToString:kRepairCDPStateActionRecoveryKey];

  if (v19)
  {
    id v20 = self->_stateController;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100006830;
    v37[3] = &unk_100010560;
    v37[4] = self;
    [(CDPStateController *)v20 generateNewRecoveryKey:v37];
    goto LABEL_24;
  }
  uint64_t v21 = [v4 identifier];
  unsigned int v22 = [v21 isEqualToString:kSOSCompatibilityActionContinue];

  if (v22)
  {
    objc_initWeak(&location, self);
    uint64_t v23 = self->_stateController;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100006870;
    v34[3] = &unk_100010588;
    uint64_t v24 = &v35;
    objc_copyWeak(&v35, &location);
    [(CDPStateController *)v23 repairCloudDataProtectionStateWithCompletion:v34];
LABEL_18:
    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
    goto LABEL_24;
  }
  __int16 v25 = [v4 identifier];
  if ([v25 isEqualToString:kEDPOnlyRepairActionContinue])
  {
    unsigned int v26 = +[CDPUtilities isGuitarfishEnabled];

    if (v26)
    {
      objc_initWeak(&location, self);
      v27 = self->_stateController;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000068CC;
      v32[3] = &unk_100010588;
      uint64_t v24 = &v33;
      objc_copyWeak(&v33, &location);
      [(CDPStateController *)v27 repairEDPStateWithCompletion:v32];
      goto LABEL_18;
    }
  }
  else
  {
  }
  v28 = [v4 userInfo];
  unsigned int v29 = [v28 objectForKeyedSubscript:kCDPAKNativeActionKey];

  v30 = [v4 userInfo];
  uint64_t v31 = [v30 objectForKeyedSubscript:kCDPAKFollowUpURLKey];

  if (v29 && [v29 isEqualToString:kADPEnrollAction]) {
    [(CDPFollowUpViewController *)self _beginWalrusEnablementFromUpsellCFU];
  }

LABEL_24:
}

- (void)_beginWalrusEnablementFromUpsellCFU
{
  id v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000A614((uint64_t)self);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000069F4;
  v5[3] = &unk_1000105B0;
  v5[4] = self;
  id v4 = objc_retainBlock(v5);
  [(CDPFollowUpViewController *)self _beginUpsellFlowOnIOSUsingContext:self->_cdpContext completion:v4];
}

- (void)_beginUpsellFlowOnIOSUsingContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)CDPUIWalrusSwiftUIFactory);
  unsigned int v9 = +[AKURLBag sharedBag];
  id v10 = +[AKNetworkObserver sharedNetworkObserver];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006B78;
  v12[3] = &unk_1000105D8;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v8 makeSwiftUIUpsellViewWithCDPContext:v7 urlBag:v9 networkObserver:v10 viewModelDelegate:self completion:v12];
}

- (id)_makeADPUpsellLandingPageViewedEventWithCDPContext:(id)a3
{
  id v3 = +[AAFAnalyticsEvent analyticsEventWithContext:a3 eventName:kADPUpsellLandingPageViewed category:kCDPRTCEventCategoryAccountDataAccessRecovery];
  v7[0] = kADPUpsellLandingPageTurnOnEscapeOffer;
  v7[1] = kADPUpsellLandingPageSetUpLaterIniCloudSettingsEscapeOffer;
  v7[2] = kDataAccessCancel;
  id v4 = +[NSArray arrayWithObjects:v7 count:3];
  uint64_t v5 = objc_msgSend(v4, "aaf_arrayAsCommaSeperatedString");
  [v3 setObject:v5 forKeyedSubscript:kCDPAnalyticsEscapeOffer];

  return v3;
}

- (void)_clearLocalSecretCreateFollowUp
{
  id v2 = objc_alloc_init((Class)CDPFollowUpController);
  id v3 = +[CDPFollowUpContext contextForWalrusCreatePasscodeWithCDPContext:0];
  id v9 = 0;
  unsigned int v4 = [v2 clearFollowUpWithContext:v3 error:&v9];
  id v5 = v9;

  id v6 = _CDPLogSystem();
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully cleared local secret create followup", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10000A71C();
  }
}

- (void)_clearRecoveryKeyRepairFollowUp
{
  id v2 = objc_alloc_init((Class)CDPFollowUpController);
  id v3 = +[CDPFollowUpContext contextForRecoveryKeyRepair];
  id v8 = 0;
  unsigned int v4 = [v2 clearFollowUpWithContext:v3 error:&v8];
  id v5 = v8;

  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"Failed to clear";
    if (v4) {
      CFStringRef v7 = @"Cleared";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ recovery key follow up with error: %@", buf, 0x16u);
  }
}

- (void)_clearFollowUpWithAKControllerWithItemID:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[AKFollowUpProviderFactory sharedAuthKitFollowupProvider];
  id v17 = v3;
  id v5 = +[NSArray arrayWithObjects:&v17 count:1];
  id v10 = 0;
  unsigned int v6 = [v4 removeFollowUpItemsWithIdentifiers:v5 error:&v10];
  id v7 = v10;

  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"Failed to clear";
    *(_DWORD *)buf = 138412802;
    if (v6) {
      CFStringRef v9 = @"Cleared";
    }
    CFStringRef v12 = v9;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ %@ follow up with error: %@", buf, 0x20u);
  }
}

- (void)_clearADPUpsellFollowUpWithAKController
{
  id v2 = +[AKFollowUpProviderFactory sharedAuthKitFollowupProvider];
  uint64_t v13 = kADPUpsellItemIdentifier;
  id v3 = +[NSArray arrayWithObjects:&v13 count:1];
  id v8 = 0;
  unsigned int v4 = [v2 removeFollowUpItemsWithIdentifiers:v3 error:&v8];
  id v5 = v8;

  unsigned int v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"Failed to clear";
    if (v4) {
      CFStringRef v7 = @"Cleared";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ ADP Upsell follow up with error: %@", buf, 0x16u);
  }
}

- (void)_clearADPUpsellFollowUp
{
  id v2 = objc_alloc_init((Class)CDPFollowUpController);
  id v3 = +[CDPFollowUpContext contextForADPUpsell];
  id v8 = 0;
  unsigned int v4 = [v2 clearFollowUpWithContext:v3 error:&v8];
  id v5 = v8;

  unsigned int v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"Failed to clear";
    if (v4) {
      CFStringRef v7 = @"Cleared";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ ADP Upsell follow up with error: %@", buf, 0x16u);
  }
}

- (void)_setupWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (CDPStateController *)[objc_alloc((Class)CDPStateController) initWithContext:v4];

  stateController = self->_stateController;
  self->_stateController = v5;

  CFStringRef v7 = (CDPUIController *)objc_alloc_init((Class)CDPUIController);
  uiController = self->_uiController;
  self->_uiController = v7;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:1];
  [(CDPUIController *)self->_uiController setDelegate:self];
  CFStringRef v9 = self->_uiController;
  CFStringRef v10 = self->_stateController;

  [(CDPStateController *)v10 setUiProvider:v9];
}

- (id)_followupProvider
{
  id v2 = objc_alloc((Class)FLFollowUpController);
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 bundleIdentifier];
  id v5 = [v2 initWithClientIdentifier:v4];

  id v6 = [objc_alloc((Class)AKFollowUpController) initWithFLFollowupController:v5];

  return v6;
}

- (void)_setupEncryptionFlowContextWithAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = (CDPUIDeviceToDeviceEncryptionFlowContext *)[objc_alloc((Class)CDPUIDeviceToDeviceEncryptionFlowContext) initWithAltDSID:v4];

  context = self->_context;
  self->_context = v5;

  [(CDPUIDeviceToDeviceEncryptionFlowContext *)self->_context setDeviceToDeviceEncryptionUpgradeUIStyle:0];
  [(CDPUIDeviceToDeviceEncryptionFlowContext *)self->_context setDeviceToDeviceEncryptionUpgradeType:2];
  CFStringRef v7 = self->_context;

  [(CDPUIDeviceToDeviceEncryptionFlowContext *)v7 setPresentingViewController:self];
}

- (void)_setupSOSCompatibilityModeEnabledFlowWithContext:(id)a3
{
  id v4 = a3;
  [v4 setSosCompatibilityType:1];
  [v4 setKeychainSyncSystem:1];
  [v4 setIsSOSCFUFlow:1];
  id v5 = (CDPStateController *)[objc_alloc((Class)CDPStateController) initWithContext:v4];

  stateController = self->_stateController;
  self->_stateController = v5;

  CFStringRef v7 = (CDPUIController *)objc_alloc_init((Class)CDPUIController);
  uiController = self->_uiController;
  self->_uiController = v7;

  [(CDPUIController *)self->_uiController setForceInlinePresentation:1];
  [(CDPUIController *)self->_uiController setDelegate:self];
  CFStringRef v9 = self->_uiController;
  CFStringRef v10 = self->_stateController;

  [(CDPStateController *)v10 setUiProvider:v9];
}

- (id)_navController
{
  id v2 = objc_alloc_init((Class)PSSetupController);
  [v2 setNavigationBarHidden:1];
  id v3 = +[UIColor systemBackgroundColor];
  id v4 = [v2 view];
  [v4 setBackgroundColor:v3];

  [v2 setModalPresentationStyle:3];

  return v2;
}

- (id)_spinnerViewController
{
  spinnerViewController = self->_spinnerViewController;
  if (!spinnerViewController)
  {
    uint64_t v14 = 0;
    __int16 v15 = &v14;
    uint64_t v16 = 0x2050000000;
    id v4 = (void *)qword_100015150;
    uint64_t v17 = qword_100015150;
    if (!qword_100015150)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100009C38;
      v13[3] = &unk_1000106C8;
      v13[4] = &v14;
      sub_100009C38((uint64_t)v13);
      id v4 = (void *)v15[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v14, 8);
    id v6 = (AAUISpinnerViewController *)objc_alloc_init(v5);
    CFStringRef v7 = self->_spinnerViewController;
    self->_spinnerViewController = v6;

    id v8 = [(AAUISpinnerViewController *)self->_spinnerViewController label];
    CFStringRef v9 = @"UPDATING_APPLE_ID_LABEL";
    if (([@"UPDATING_APPLE_ID_LABEL" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v10 = 0;
    }
    else
    {
      CFStringRef v9 = [@"UPDATING_APPLE_ID_LABEL" stringByAppendingString:@"_REBRAND"];
      int v10 = 1;
    }
    __int16 v11 = CDPLocalizedString();
    [v8 setText:v11];

    if (v10) {
    [(AAUISpinnerViewController *)self->_spinnerViewController setSpinning:1];
    }
    [(AAUISpinnerViewController *)self->_spinnerViewController setModalInPresentation:1];
    spinnerViewController = self->_spinnerViewController;
  }

  return spinnerViewController;
}

- (void)uiController:(id)a3 preparePresentationContext:(id)a4
{
  id v6 = a3;
  CFStringRef v7 = (void (**)(void))a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preparing full context for controller: %@", (uint8_t *)&v11, 0xCu);
  }

  if (v7)
  {
    CFStringRef v9 = [v6 presentingViewController];

    if (v9 == self)
    {
      [(CDPFollowUpViewController *)self presentFullUIWithCompletion:v7];
    }
    else
    {
      int v10 = [v6 presentingViewController];

      if (v10) {
        v7[2](v7);
      }
    }
  }
}

- (void)uiController:(id)a3 prepareAlertContext:(id)a4
{
  id v6 = a3;
  CFStringRef v7 = (void (**)(void))a4;
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preparing alert context for controller: %@", (uint8_t *)&v11, 0xCu);
  }

  if (v7)
  {
    CFStringRef v9 = [v6 presentingViewController];

    if (v9)
    {
      v7[2](v7);
    }
    else
    {
      int v10 = [(CDPFollowUpViewController *)self _spinnerViewController];
      [(CDPFollowUpViewController *)self presentViewController:v10 animated:1 completion:0];

      [(CDPFollowUpViewController *)self presentAlertUIWithCompletion:v7];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDPFollowUpViewController;
  [(CDPFollowUpViewController *)&v4 viewDidAppear:a3];
  [(CDPUIController *)self->_uiController setPresentingViewController:self];
  [(CDPFollowUpViewController *)self _beginExtensionFlowWithAction:self->_followUpAction];
}

- (void)presentAlertUIWithCompletion:(id)a3
{
  uiController = self->_uiController;
  id v5 = (void (**)(void))a3;
  [(CDPUIController *)uiController setPresentingViewController:self];
  v5[2]();
}

- (void)presentFullUIWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  id v11 = [(CDPFollowUpViewController *)self _navController];
  -[CDPUIController setPresentingViewController:](self->_uiController, "setPresentingViewController:");
  v4[2](v4);

  id v5 = self;
  id v6 = [(CDPFollowUpViewController *)v5 presentedViewController];

  if (v6)
  {
    uint64_t v7 = [(CDPFollowUpViewController *)v5 presentedViewController];

    id v8 = [(CDPFollowUpViewController *)v5 view];
    id v9 = [v8 effectiveUserInterfaceLayoutDirection];

    if (v9 == (id)1) {
      uint64_t v10 = 15;
    }
    else {
      uint64_t v10 = 16;
    }
    [v11 setModalTransitionStyle:v10];
    id v5 = (CDPFollowUpViewController *)v7;
  }
  [(CDPFollowUpViewController *)v5 presentViewController:v11 animated:1 completion:0];
}

- (void)_clearSOSCompatibilityModeFollowUp
{
  id v2 = objc_alloc_init((Class)CDPFollowUpController);
  id v3 = +[CDPFollowUpContext contextForSOSCompatibilityMode];
  id v8 = 0;
  unsigned int v4 = [v2 clearFollowUpWithContext:v3 error:&v8];
  id v5 = v8;

  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"Failed to clear";
    if (v4) {
      CFStringRef v7 = @"Cleared";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ compatibility mode follow up with error: %@", buf, 0x16u);
  }
}

- (void)_clearSecureTermsFollowUp
{
  id v2 = objc_alloc_init((Class)CDPFollowUpController);
  id v3 = +[CDPFollowUpContext contextForSecureTerms];
  id v8 = 0;
  unsigned int v4 = [v2 clearFollowUpWithContext:v3 error:&v8];
  id v5 = v8;

  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"Failed to clear";
    if (v4) {
      CFStringRef v7 = @"Cleared";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ secure terms follow up with error: %@", buf, 0x16u);
  }
}

- (void)_secureTermsTearDownWithUpdatedSecret:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CFStringRef v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"was not";
    if (v4) {
      CFStringRef v8 = @"was";
    }
    int v10 = 138412290;
    CFStringRef v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Local secret %@ updated after terms agreement.", (uint8_t *)&v10, 0xCu);
  }

  if (v6)
  {
    id v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000A784();
    }
  }
  [(CDPFollowUpViewController *)self _clearSecureTermsFollowUp];
  [(CDPFollowUpViewController *)self finishProcessing];
}

- (void)_showGenericTermsUI
{
  id v3 = objc_alloc_init((Class)ACAccountStore);
  BOOL v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  uint64_t v10 = 0;
  CFStringRef v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v5 = (void *)qword_100015160;
  uint64_t v13 = qword_100015160;
  if (!qword_100015160)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009E00;
    v9[3] = &unk_1000106C8;
    v9[4] = &v10;
    sub_100009E00((uint64_t)v9);
    id v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  CFStringRef v7 = (AAUIGenericTermsRemoteUI *)[[v6 alloc] initWithAccount:v4 inStore:v3];
  genericTermsRemoteUI = self->_genericTermsRemoteUI;
  self->_genericTermsRemoteUI = v7;

  [(AAUIGenericTermsRemoteUI *)self->_genericTermsRemoteUI setDelegate:self];
  [(AAUIGenericTermsRemoteUI *)self->_genericTermsRemoteUI presentFromViewController:self modal:1];
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  CFStringRef v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AAUIGenericTermsRemoteUI generic terms callback with success: %@", buf, 0xCu);
  }

  if (v4)
  {
    id v9 = [v6 account];
    if (v9)
    {
      uint64_t v10 = [v6 accountStore];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000828C;
      v12[3] = &unk_100010600;
      v12[4] = self;
      id v13 = v6;
      id v14 = v9;
      objc_msgSend(v10, "aa_updatePropertiesForAppleAccount:completion:", v14, v12);
    }
    else
    {
      CFStringRef v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10000A7EC();
      }

      [(CDPFollowUpViewController *)self finishProcessing];
    }
  }
  else
  {
    [(CDPFollowUpViewController *)self finishProcessing];
  }
}

- (void)upsellViewModelDidRequestBeginEnablementFlowWithContext:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User tapped Turn On on the ADP upsell landing page. Beginning RUI flow.", (uint8_t *)buf, 2u);
  }

  id v6 = [(CDPFollowUpViewController *)self _makeEscapeOfferSelectedEventForOffer:kADPUpsellLandingPageTurnOnEscapeOffer withContext:v4];
  if (v6)
  {
    CFStringRef v7 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
    [v7 sendEvent:v6];
  }
  CFStringRef v8 = [(CDPFollowUpViewController *)self adpUpsellLandingScreen];

  if (v8)
  {
    id v9 = objc_alloc((Class)NSMutableURLRequest);
    uint64_t v10 = +[AKURLBag sharedBag];
    CFStringRef v11 = [v10 dataRecoveryServiceDisableURL];
    id v12 = [v9 initWithURL:v11];

    [v12 setHTTPMethod:@"GET"];
    objc_initWeak(buf, self);
    id v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10000A90C();
    }

    id v14 = [(CDPFollowUpViewController *)self adpUpsellLandingScreen];
    __int16 v15 = [(CDPFollowUpViewController *)self grandSlamPresenterWithPresentingScreen:v14];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100008750;
    v18[3] = &unk_100010650;
    objc_copyWeak(&v20, buf);
    id v16 = v12;
    id v19 = v16;
    [v15 loadRequest:v16 completion:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);
  }
  else
  {
    uint64_t v17 = _CDPLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_10000A888(v17);
    }

    [(CDPFollowUpViewController *)self finishProcessing];
  }
}

- (void)upsellViewModelDidRequestCFUDismissalWithContext:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User tapped Set Up Later on the ADP upsell landing page.", buf, 2u);
  }

  id v6 = [(CDPFollowUpViewController *)self _makeEscapeOfferSelectedEventForOffer:kADPUpsellLandingPageSetUpLaterIniCloudSettingsEscapeOffer withContext:v4];
  if (v6)
  {
    CFStringRef v7 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
    [v7 sendEvent:v6];
  }
  CFStringRef v8 = [(CDPFollowUpViewController *)self adpUpsellLandingScreen];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    __int16 v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_10000AA54(v15);
    }

    [(CDPFollowUpViewController *)self finishProcessing];
  }
  else
  {
    id v10 = kADPUpsellTearDownAction;
    CFStringRef v11 = +[CDPAccount sharedInstance];
    id v12 = [v11 primaryAccountAltDSID];

    id v13 = kADPUpsellItemIdentifier;
    id v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Firing off best effort teardown with urlKey=%@, altDSID=%@, itemID=%@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100008B24;
    v16[3] = &unk_100010588;
    objc_copyWeak(&v17, (id *)buf);
    [(CDPFollowUpViewController *)self _presentAKServerUIWithUrlKey:v10 altDSID:v12 itemID:v13 completion:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

- (void)upsellViewModelDidRequestFlowCancellationWithContext:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User requested exiting out of the ADP upsell landing page. Not taking any action.", v8, 2u);
  }

  id v6 = [(CDPFollowUpViewController *)self _makeEscapeOfferSelectedEventForOffer:kDataAccessCancel withContext:v4];

  if (v6)
  {
    CFStringRef v7 = +[CDPAnalyticsReporterRTC rtcAnalyticsReporter];
    [v7 sendEvent:v6];
  }
  [(CDPFollowUpViewController *)self finishProcessing];
}

- (id)_makeEscapeOfferSelectedEventForOffer:(id)a3 withContext:(id)a4
{
  uint64_t v5 = kCDPAnalyticsEscapeOfferSelectedEvent;
  uint64_t v6 = kCDPRTCEventCategoryAccountDataAccessRecovery;
  id v7 = a3;
  CFStringRef v8 = +[AAFAnalyticsEvent analyticsEventWithContext:a4 eventName:v5 category:v6];
  [v8 setObject:v7 forKeyedSubscript:kCDPAnalyticsEscapeOfferSelected];

  return v8;
}

- (void)_harvestWebAccessStatus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CDPLogSystem();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10000AB74(v4, v6);
    }

    id v7 = +[CDPAccount sharedInstance];
    CFStringRef v8 = [v7 primaryAppleAccount];
    uint64_t v6 = objc_msgSend(v8, "aa_altDSID");

    BOOL v9 = +[AKAccountManager sharedInstance];
    id v10 = [v9 authKitAccountWithAltDSID:v6];

    [v10 setAccountProperty:v4 forKey:@"webAccessEnabled"];
    objc_initWeak(&location, self);
    CFStringRef v11 = [v10 accountStore];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100008ED4;
    v12[3] = &unk_100010588;
    objc_copyWeak(&v13, &location);
    [v11 saveAccount:v10 withCompletionHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10000AB40();
  }
}

- (void)_showADPUpsellNetworkError
{
  id v3 = CDPLocalizedStringInTable();
  CDPLocalizedStringInTable();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009110;
  block[3] = &unk_1000106A0;
  void block[4] = self;
  id v7 = v3;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v8;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleADPUpsellHTTPResponse:(id)a3
{
  id v4 = a3;
  if ([v4 statusCode] != (id)401)
  {
    id v5 = [v4 statusCode];
    if (v4)
    {
      if (v5 != (id)302)
      {
        uint64_t v6 = _CDPLogSystem();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138477827;
          id v19 = v4;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Harvesting data from response: %{private}@", (uint8_t *)&v18, 0xCu);
        }

        id v7 = [v4 allHeaderFields];
        id v8 = [v7 objectForKeyedSubscript:@"X-Apple-I-Web-Access"];

        [(CDPFollowUpViewController *)self _harvestWebAccessStatus:v8];
        BOOL v9 = [v4 allHeaderFields];
        id v10 = [v9 objectForKeyedSubscript:@"X-Apple-AK-Advanced-ICloud-Data-Protection"];

        if (v10)
        {
          CFStringRef v11 = _CDPLogSystem();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = (objc_class *)objc_opt_class();
            id v13 = NSStringFromClass(v12);
            unsigned int v14 = [v10 BOOLValue];
            int v18 = 138412546;
            id v19 = v13;
            __int16 v20 = 1024;
            unsigned int v21 = v14;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: ADP isEnabled: %d", (uint8_t *)&v18, 0x12u);
          }
        }
        __int16 v15 = [v4 allHeaderFields];
        id v16 = [v15 objectForKeyedSubscript:@"X-Apple-AK-Action"];

        if (v16 && [v16 isEqual:@"delete"])
        {
          id v17 = _CDPLogSystem();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            sub_10000A500();
          }

          [(CDPFollowUpViewController *)self _clearADPUpsellFollowUpWithAKController];
        }
      }
    }
  }
}

- (id)accountsForAccountManager:(id)a3
{
  id v3 = +[CDPAccount sharedInstance];
  id v4 = [v3 primaryAppleAccount];

  if (v4)
  {
    uint64_t v15 = AIDAServiceTypeCloud;
    id v16 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  else
  {
    uint64_t v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000ACD8(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    id v5 = &__NSDictionary0__struct;
  }

  return v5;
}

- (id)grandSlamPresenterWithPresentingScreen:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000ADF4();
  }

  p_grandSlamPresenter = (id *)&self->_grandSlamPresenter;
  if (self->_grandSlamPresenter)
  {
    uint64_t v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10000AD84((uint64_t)&self->_grandSlamPresenter, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  id v14 = objc_alloc((Class)AIDAAccountManager);
  uint64_t v15 = +[ACAccountStore defaultStore];
  id v16 = [v14 initWithAccountStore:v15];

  [v16 setDelegate:self];
  id v17 = objc_alloc_init((Class)sub_100009640());
  if (objc_opt_respondsToSelector())
  {
    id v18 = [objc_alloc((Class)sub_100009640()) initWithAccountManager:v16 hookType:2 presenter:v4 cdpContext:self->_cdpContext];
  }
  else
  {
    id v19 = _CDPLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10000AD50();
    }

    id v18 = [objc_alloc((Class)sub_100009640()) initWithAccountManager:v16 hookType:2 presenter:v4];
  }
  __int16 v20 = v18;

  [v20 setDelegate:self];
  id v21 = *p_grandSlamPresenter;
  id *p_grandSlamPresenter = v20;
  id v22 = v20;

  id v23 = *p_grandSlamPresenter;
  return v23;
}

- (void)remoteUIDidReceiveHTTPResponse:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000AE5C();
  }

  [(CDPFollowUpViewController *)self _handleADPUpsellHTTPResponse:v4];
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = [v6 debugDescription];
    int v12 = 138412803;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 2113;
    id v17 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@: Request %@ completed with error: %{private}@", (uint8_t *)&v12, 0x20u);
  }
  if (v7) {
    [(CDPFollowUpViewController *)self _showADPUpsellNetworkError];
  }
}

- (void)remoteUIDidDismiss:(id)a3
{
  id v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000AEC4();
  }

  id v5 = [(CDPFollowUpViewController *)self navigationController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009970;
  v6[3] = &unk_1000105B0;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

- (void)remoteUIDidHandleButton:(id)a3
{
  id v4 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000B004();
  }

  id v6 = [v4 objectForKeyedSubscript:AKActionKey];
  if ([v6 isEqualToString:AKActionCancel])
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10000AF9C();
    }

    [(CDPFollowUpViewController *)self finishProcessing];
  }
}

- (AAUIGrandSlamRemoteUIPresenter)grandSlamPresenter
{
  return self->_grandSlamPresenter;
}

- (void)setGrandSlamPresenter:(id)a3
{
}

- (UIViewController)adpUpsellLandingScreen
{
  return self->_adpUpsellLandingScreen;
}

- (void)setAdpUpsellLandingScreen:(id)a3
{
}

- (CDPUIADPUpsellErrorPresenter)adpUpsellErrorPresenter
{
  return self->_adpUpsellErrorPresenter;
}

- (void)setAdpUpsellErrorPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adpUpsellErrorPresenter, 0);
  objc_storeStrong((id *)&self->_adpUpsellLandingScreen, 0);
  objc_storeStrong((id *)&self->_grandSlamPresenter, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_akNativeAction, 0);
  objc_storeStrong((id *)&self->_urlKey, 0);
  objc_storeStrong((id *)&self->_followupSynchronizer, 0);
  objc_storeStrong((id *)&self->_baseFollowupManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_followUpAction, 0);
  objc_storeStrong((id *)&self->_genericTermsRemoteUI, 0);
  objc_storeStrong((id *)&self->_spinnerViewController, 0);
  objc_storeStrong((id *)&self->_uiController, 0);

  objc_storeStrong((id *)&self->_stateController, 0);
}

@end