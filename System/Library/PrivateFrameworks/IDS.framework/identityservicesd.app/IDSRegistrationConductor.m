@interface IDSRegistrationConductor
+ (BOOL)enableHomeNumber;
+ (BOOL)shouldEnableHomeNumber;
+ (BOOL)shouldEnableStewie;
- (BOOL)shouldSupressRepairLogic;
- (IDSAccountRepair)accountRepair;
- (IDSAccountSync)accountSync;
- (IDSCTAdapter)CTAdapter;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSDeviceCertificationRepair)deviceCertificationRepair;
- (IDSHeartbeatCenter)heartbeatCenter;
- (IDSRegistrationConductor)init;
- (IDSRegistrationController)registrationController;
- (IDSRestoreMonitor)restoreMonitor;
- (IDSRestrictions)restrictions;
- (IDSSIMPhoneUserSynchronizer)SIMPhoneUserSynchronizer;
- (IDSSIMResponder)SIMResponder;
- (IDSStewieCoordinator)stewieCoordinator;
- (IDSSystemAccountAdapter)systemAccountAdapter;
- (IDSSystemAccountUserSynchronizer)systemAccountUserSynchronizer;
- (IDSTemporaryPhoneUserSynchronizer)temporaryPhoneUserSynchronizer;
- (IDSUserAccountSynchronizer)userAccountSynchronizer;
- (IDSUserStore)userStore;
- (OS_dispatch_queue)registrationQueue;
- (void)SIM:(id)a3 didDeactivateWithInfo:(id)a4;
- (void)SIM:(id)a3 didUpdateRegistrationState:(BOOL)a4;
- (void)_setupRestoreTimer;
- (void)accountControllerDidFinishLoadingAccounts:(id)a3;
- (void)bagReloaded:(id)a3;
- (void)carrierBundleInformationDidChange;
- (void)checkRestorationState;
- (void)deviceRecertificationCompleted:(id)a3;
- (void)forceRepairAccounts:(id)a3;
- (void)kickMissedTemporaryAlerts;
- (void)kickRepair;
- (void)kickiCloudRepair;
- (void)preferredAccountChanged:(id)a3;
- (void)registrationController:(id)a3 allRegistrationsSucceeded:(id)a4;
- (void)serviceRestrictionsChanged:(id)a3;
- (void)setAccountController:(id)a3;
- (void)setAccountRepair:(id)a3;
- (void)setAccountSync:(id)a3;
- (void)setCTAdapter:(id)a3;
- (void)setDeviceCertificationRepair:(id)a3;
- (void)setHeartbeatCenter:(id)a3;
- (void)setRegistrationController:(id)a3;
- (void)setRegistrationQueue:(id)a3;
- (void)setRestoreMonitor:(id)a3;
- (void)setRestrictions:(id)a3;
- (void)setSIMPhoneUserSynchronizer:(id)a3;
- (void)setSIMResponder:(id)a3;
- (void)setServiceController:(id)a3;
- (void)setShouldSupressRepairLogic:(BOOL)a3;
- (void)setStewieCoordinator:(id)a3;
- (void)setSystemAccountAdapter:(id)a3;
- (void)setSystemAccountUserSynchronizer:(id)a3;
- (void)setTemporaryPhoneUserSynchronizer:(id)a3;
- (void)setUserAccountSynchronizer:(id)a3;
- (void)setUserStore:(id)a3;
- (void)setup;
- (void)systemDidLeaveFirstDataProtectionLock;
@end

@implementation IDSRegistrationConductor

- (IDSRegistrationConductor)init
{
  v78.receiver = self;
  v78.super_class = (Class)IDSRegistrationConductor;
  v2 = [(IDSRegistrationConductor *)&v78 init];
  if (v2)
  {
    uint64_t v3 = im_primary_queue();
    registrationQueue = v2->_registrationQueue;
    v2->_registrationQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[IDSRestoreMonitor sharedInstance];
    restoreMonitor = v2->_restoreMonitor;
    v2->_restoreMonitor = (IDSRestoreMonitor *)v5;

    v7 = [[IDSSystemAccountAdapter alloc] initWithQueue:v2->_registrationQueue];
    systemAccountAdapter = v2->_systemAccountAdapter;
    v2->_systemAccountAdapter = v7;

    uint64_t v9 = +[IDSCTAdapter sharedInstance];
    CTAdapter = v2->_CTAdapter;
    v2->_CTAdapter = (IDSCTAdapter *)v9;

    [(IDSCTAdapter *)v2->_CTAdapter addListener:v2];
    uint64_t v11 = +[IDSDAccountController sharedInstance];
    accountController = v2->_accountController;
    v2->_accountController = (IDSDAccountController *)v11;

    uint64_t v13 = +[IDSDServiceController sharedInstance];
    serviceController = v2->_serviceController;
    v2->_serviceController = (IDSDServiceController *)v13;

    uint64_t v15 = +[IDSRegistrationController sharedInstance];
    registrationController = v2->_registrationController;
    v2->_registrationController = (IDSRegistrationController *)v15;

    uint64_t v17 = +[IDSRestrictions sharedInstance];
    restrictions = v2->_restrictions;
    v2->_restrictions = (IDSRestrictions *)v17;

    v19 = [[IDSUserStore alloc] initWithQueue:v2->_registrationQueue];
    userStore = v2->_userStore;
    v2->_userStore = v19;

    v21 = [IDSSIMPhoneUserSynchronizer alloc];
    v22 = v2->_userStore;
    v23 = v2->_registrationQueue;
    v24 = +[IMLockdownManager sharedInstance];
    v25 = +[IMSystemMonitor sharedInstance];
    v26 = v2->_CTAdapter;
    v27 = +[FTUserConfiguration sharedInstance];
    v28 = [(IDSRegistrationConductor *)v2 registrationController];
    v29 = +[IDSPairingManager sharedInstance];
    v30 = [(IDSSIMPhoneUserSynchronizer *)v21 initWithUserStore:v22 queue:v23 lockdownManager:v24 systemMonitor:v25 CTAdapter:v26 userConfiguration:v27 registrationController:v28 pairingManager:v29];
    SIMPhoneUserSynchronizer = v2->_SIMPhoneUserSynchronizer;
    v2->_SIMPhoneUserSynchronizer = v30;

    v32 = [IDSSystemAccountUserSynchronizer alloc];
    v33 = v2->_systemAccountAdapter;
    v34 = v2->_userStore;
    v35 = +[IDSDataMigrationTracker sharedInstance];
    v36 = [(IDSSystemAccountUserSynchronizer *)v32 initWithSystemAccountAdapter:v33 userStore:v34 migrationTracker:v35 queue:v2->_registrationQueue];
    systemAccountUserSynchronizer = v2->_systemAccountUserSynchronizer;
    v2->_systemAccountUserSynchronizer = v36;

    LODWORD(v33) = +[IDSRegistrationConductor enableHomeNumber];
    p_super = +[IMRGLog registration];
    BOOL v39 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
    if (v33)
    {
      if (v39)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Home Number enabled", buf, 2u);
      }

      v40 = [[IDSTemporaryPhoneUserSynchronizer alloc] initWithUserStore:v2->_userStore ctAdapter:v2->_CTAdapter];
      p_super = &v2->_temporaryPhoneUserSynchronizer->super;
      v2->_temporaryPhoneUserSynchronizer = v40;
    }
    else if (v39)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Home Number disabled", buf, 2u);
    }

    [(IDSUserStore *)v2->_userStore setDataProvider:v2->_SIMPhoneUserSynchronizer forRealm:0];
    [(IDSUserStore *)v2->_userStore setDataProvider:v2->_systemAccountUserSynchronizer forRealm:1];
    if (+[IDSRegistrationConductor enableHomeNumber]) {
      [(IDSUserStore *)v2->_userStore setDataProvider:v2->_temporaryPhoneUserSynchronizer forRealm:2];
    }
    v41 = [IDSUserAccountSynchronizer alloc];
    v42 = v2->_userStore;
    v43 = v2->_accountController;
    v44 = v2->_serviceController;
    v45 = +[IDSDataMigrationTracker sharedInstance];
    v46 = [(IDSUserAccountSynchronizer *)v41 initWithUserStore:v42 accountController:v43 serviceController:v44 migrationTracker:v45 restrictions:v2->_restrictions queue:v2->_registrationQueue];
    userAccountSynchronizer = v2->_userAccountSynchronizer;
    v2->_userAccountSynchronizer = v46;

    uint64_t v48 = +[IDSHeartbeatCenter sharedInstance];
    heartbeatCenter = v2->_heartbeatCenter;
    v2->_heartbeatCenter = (IDSHeartbeatCenter *)v48;

    uint64_t v50 = +[IDSAccountSync sharedInstance];
    accountSync = v2->_accountSync;
    v2->_accountSync = (IDSAccountSync *)v50;

    v52 = [IDSAccountRepair alloc];
    v53 = v2->_accountController;
    v54 = v2->_systemAccountAdapter;
    v55 = +[IMUserDefaults sharedDefaults];
    v56 = +[IDSKeyTransparencyVerifier sharedInstance];
    v57 = [(IDSAccountRepair *)v52 initWithAccountController:v53 systemAccountAdapter:v54 userDefaults:v55 keyTransparencyVerifier:v56];
    accountRepair = v2->_accountRepair;
    v2->_accountRepair = v57;

    v59 = objc_alloc_init(IDSDeviceCertificationRepair);
    deviceCertificationRepair = v2->_deviceCertificationRepair;
    v2->_deviceCertificationRepair = v59;

    v61 = [IDSSIMResponder alloc];
    v62 = v2->_accountController;
    v63 = v2->_serviceController;
    v64 = +[IDSRestrictions sharedInstance];
    v65 = [(IDSSIMResponder *)v61 initWithAccountController:v62 serviceController:v63 restrictions:v64 registrationController:v2->_registrationController];
    SIMResponder = v2->_SIMResponder;
    v2->_SIMResponder = v65;

    if (+[IDSRegistrationConductor shouldEnableStewie])
    {
      v67 = [IDSStewieCoordinator alloc];
      v68 = v2->_userStore;
      v69 = +[IDSServerBag sharedInstance];
      v70 = v2->_registrationQueue;
      v71 = +[IMSystemMonitor sharedInstance];
      v72 = [(IDSStewieCoordinator *)v67 initWithUserStore:v68 bag:v69 queue:v70 systemMonitor:v71];
      stewieCoordinator = v2->_stewieCoordinator;
      v2->_stewieCoordinator = v72;
    }
    IMRegisterForPreferredAccountChangeNotificationsInternal();
    v74 = +[NSNotificationCenter defaultCenter];
    [v74 addObserver:v2 selector:"preferredAccountChanged:" name:IMPreferredAccountForServiceChangedNotificationInternal object:0];
    [v74 addObserver:v2 selector:"bagReloaded:" name:IDSServerBagFinishedLoadingNotification object:0];
    [v74 addObserver:v2 selector:"serviceRestrictionsChanged:" name:kCFManagedPreferencesMCXNotificationName object:kCFManagedPreferencesMCXObjectName];
    [v74 addObserver:v2 selector:"serviceRestrictionsChanged:" name:FaceTimeDeviceRegistrationCapabilityChangedNotification object:0];
    [v74 addObserver:v2 selector:"serviceRestrictionsChanged:" name:FaceTimeDeviceCapabilityChangedNotification object:0];
    [v74 addObserver:v2 selector:"serviceRestrictionsChanged:" name:FaceTimeDeviceRestictionsChangedNotification object:0];
    [v74 addObserver:v2 selector:"ktRegDataUpdated:" name:IDSRegistrationKeyManagerKTRegDataUpdatedNotification object:0];
    v75 = +[IMSystemMonitor sharedInstance];
    [v75 addListener:v2];
  }
  return v2;
}

- (void)setup
{
  uint64_t v3 = [(IDSRegistrationConductor *)self registrationController];
  [v3 addListener:self];

  v4 = [(IDSRegistrationConductor *)self accountController];
  [v4 setDelegate:self];

  uint64_t v5 = [(IDSRegistrationConductor *)self userStore];
  [v5 reloadUsers];

  v6 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v7 = [v6 isUnderFirstDataProtectionLock];

  if ((v7 & 1) == 0)
  {
    im_dispatch_after_primary_queue();
    im_dispatch_after_primary_queue();
  }
  im_dispatch_after_primary_queue();
}

- (void)kickMissedTemporaryAlerts
{
  uint64_t v3 = [(IDSRegistrationConductor *)self userStore];
  v4 = [v3 usersWithRealm:2];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v7 = 138412290;
    long long v15 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "finishedRegistration", v15, (void)v16)
          && ([v11 hasNotifiedSuccess] & 1) == 0)
        {
          v12 = +[IMRGLog registration];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Alerting for finished Home Number registration that has not notified user %@", buf, 0xCu);
          }

          +[IDSTemporaryPhoneAlertManager presentSuccessAlertForUser:v11];
          uint64_t v13 = [v11 temporaryPhoneUserWithNotifiedSuccess];
          v14 = [(IDSRegistrationConductor *)self userStore];
          [v14 updateUser:v13];
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }
}

+ (BOOL)enableHomeNumber
{
  return _[a1 shouldEnableHomeNumber];
}

+ (BOOL)shouldEnableHomeNumber
{
  v2 = +[IDSServerBag sharedInstance];
  uint64_t v3 = [v2 objectForKey:@"disable-home-number"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v4 = [v3 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v4) = 1;
  }

  return v4;
}

+ (BOOL)shouldEnableStewie
{
  int v2 = _os_feature_enabled_impl();
  uint64_t v3 = +[IDSServerBag sharedInstance];
  unsigned int v4 = [v3 objectForKey:@"disable-stewie-provisioning"];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v2 &= ~[v4 BOOLValue];
    }
  }

  return v2;
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (IDSStewieCoordinator)stewieCoordinator
{
  return self->_stewieCoordinator;
}

- (void)setStewieCoordinator:(id)a3
{
}

- (OS_dispatch_queue)registrationQueue
{
  return self->_registrationQueue;
}

- (void)setRegistrationQueue:(id)a3
{
}

- (IDSRestoreMonitor)restoreMonitor
{
  return self->_restoreMonitor;
}

- (void)setRestoreMonitor:(id)a3
{
}

- (IDSSystemAccountAdapter)systemAccountAdapter
{
  return self->_systemAccountAdapter;
}

- (void)setSystemAccountAdapter:(id)a3
{
}

- (IDSCTAdapter)CTAdapter
{
  return self->_CTAdapter;
}

- (void)setCTAdapter:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (IDSRegistrationController)registrationController
{
  return self->_registrationController;
}

- (void)setRegistrationController:(id)a3
{
}

- (IDSSIMPhoneUserSynchronizer)SIMPhoneUserSynchronizer
{
  return self->_SIMPhoneUserSynchronizer;
}

- (void)setSIMPhoneUserSynchronizer:(id)a3
{
}

- (IDSSystemAccountUserSynchronizer)systemAccountUserSynchronizer
{
  return self->_systemAccountUserSynchronizer;
}

- (void)setSystemAccountUserSynchronizer:(id)a3
{
}

- (IDSTemporaryPhoneUserSynchronizer)temporaryPhoneUserSynchronizer
{
  return self->_temporaryPhoneUserSynchronizer;
}

- (void)setTemporaryPhoneUserSynchronizer:(id)a3
{
}

- (IDSUserAccountSynchronizer)userAccountSynchronizer
{
  return self->_userAccountSynchronizer;
}

- (void)setUserAccountSynchronizer:(id)a3
{
}

- (IDSHeartbeatCenter)heartbeatCenter
{
  return self->_heartbeatCenter;
}

- (void)setHeartbeatCenter:(id)a3
{
}

- (IDSRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
}

- (IDSAccountSync)accountSync
{
  return self->_accountSync;
}

- (void)setAccountSync:(id)a3
{
}

- (IDSAccountRepair)accountRepair
{
  return self->_accountRepair;
}

- (void)setAccountRepair:(id)a3
{
}

- (IDSDeviceCertificationRepair)deviceCertificationRepair
{
  return self->_deviceCertificationRepair;
}

- (void)setDeviceCertificationRepair:(id)a3
{
}

- (IDSSIMResponder)SIMResponder
{
  return self->_SIMResponder;
}

- (void)setSIMResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SIMResponder, 0);
  objc_storeStrong((id *)&self->_deviceCertificationRepair, 0);
  objc_storeStrong((id *)&self->_accountRepair, 0);
  objc_storeStrong((id *)&self->_accountSync, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_heartbeatCenter, 0);
  objc_storeStrong((id *)&self->_userAccountSynchronizer, 0);
  objc_storeStrong((id *)&self->_temporaryPhoneUserSynchronizer, 0);
  objc_storeStrong((id *)&self->_systemAccountUserSynchronizer, 0);
  objc_storeStrong((id *)&self->_SIMPhoneUserSynchronizer, 0);
  objc_storeStrong((id *)&self->_registrationController, 0);
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_CTAdapter, 0);
  objc_storeStrong((id *)&self->_systemAccountAdapter, 0);
  objc_storeStrong((id *)&self->_restoreMonitor, 0);
  objc_storeStrong((id *)&self->_registrationQueue, 0);
  objc_storeStrong((id *)&self->_stewieCoordinator, 0);

  objc_storeStrong((id *)&self->_userStore, 0);
}

- (BOOL)shouldSupressRepairLogic
{
  int v2 = [(IDSRegistrationConductor *)self accountRepair];
  unsigned __int8 v3 = [v2 shouldSupressRepairLogic];

  return v3;
}

- (void)setShouldSupressRepairLogic:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(IDSRegistrationConductor *)self accountRepair];
  [v4 setShouldSupressRepairLogic:v3];
}

- (void)kickRepair
{
  id v2 = [(IDSRegistrationConductor *)self accountRepair];
  [v2 repairAccounts];
}

- (void)kickiCloudRepair
{
  id v2 = [(IDSRegistrationConductor *)self accountRepair];
  [v2 repairiCloudBasedAccounts];
}

- (void)forceRepairAccounts:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSRegistrationConductor *)self accountRepair];
  [v5 forceRepairAccounts:v4];
}

- (void)accountControllerDidFinishLoadingAccounts:(id)a3
{
  id v4 = [(IDSRegistrationConductor *)self restrictions];
  [v4 updateAccountActivation];

  id v5 = [(IDSRegistrationConductor *)self accountSync];
  [v5 kickAnyUnfinishedSynchronization];

  id v6 = [(IDSRegistrationConductor *)self userAccountSynchronizer];
  [v6 synchronize];
}

- (void)registrationController:(id)a3 allRegistrationsSucceeded:(id)a4
{
  id v5 = a4;
  id v6 = [(IDSRegistrationConductor *)self accountSync];
  [v6 stopAnyUnfinishedSynchronization];

  long long v7 = [(IDSRegistrationConductor *)self accountSync];
  [v7 noteShouldSynchronizeAllServices];

  id v8 = [(IDSRegistrationConductor *)self accountSync];
  [v8 noteShouldSynchronizeTinkerDeviceInfo];

  id v9 = [(IDSRegistrationConductor *)self accountRepair];
  [v9 kickRepairForAllRegistrationsSucceeded:v5];
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  BOOL v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "First unlock, kick accounts check", buf, 2u);
  }

  im_dispatch_after_primary_queue();
  [(IDSRegistrationConductor *)self kickMissedTemporaryAlerts];
}

- (void)preferredAccountChanged:(id)a3
{
}

- (void)bagReloaded:(id)a3
{
  id v3 = [(IDSRegistrationConductor *)self accountRepair];
  [v3 recalculatePhoneRepairTimer];
}

- (void)serviceRestrictionsChanged:(id)a3
{
  id v4 = [(IDSRegistrationConductor *)self accountRepair];
  [v4 setupPhoneNumberRepairTimer];

  id v5 = [(IDSRegistrationConductor *)self userAccountSynchronizer];
  [v5 synchronize];
}

- (void)deviceRecertificationCompleted:(id)a3
{
  id v3 = [(IDSRegistrationConductor *)self accountRepair];
  [v3 repairAccounts];
}

- (void)SIM:(id)a3 didUpdateRegistrationState:(BOOL)a4
{
  id v6 = [(IDSRegistrationConductor *)self registrationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018A4E8;
  v7[3] = &unk_10097E8D8;
  v7[4] = self;
  BOOL v8 = a4;
  dispatch_async(v6, v7);
}

- (void)carrierBundleInformationDidChange
{
  id v3 = [(IDSRegistrationConductor *)self registrationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018A60C;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)SIM:(id)a3 didDeactivateWithInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(IDSRegistrationConductor *)self registrationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018A74C;
  block[3] = &unk_10097E418;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_setupRestoreTimer
{
}

- (void)checkRestorationState
{
  [(IDSRestoreMonitor *)self->_restoreMonitor removeTarget:self];
  id v3 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v4 = [v3 isSetup];

  if (v4)
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device is properly setup", v7, 2u);
    }

    id v6 = [(IDSRegistrationConductor *)self SIMPhoneUserSynchronizer];
    [v6 verifyState];
  }
  else
  {
    [(IDSRegistrationConductor *)self _setupRestoreTimer];
  }
}

@end