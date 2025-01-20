@interface NPKStockholmProvisioningController
- (BOOL)_deviceInRestrictedMode;
- (BOOL)canRegisterForPeerPayment;
- (BOOL)deviceInRestrictedMode;
- (BOOL)deviceSupportsInAppPayments;
- (BOOL)hasFelicaSecureElement;
- (BOOL)isDeviceInRestrictedMode;
- (BOOL)isOrderManagementDisabled;
- (BOOL)isOrderManagementNotificationsDisabled;
- (BOOL)isPaymentHandoffDisabled;
- (BOOL)isRegistrationSupported;
- (BOOL)isSettingsControllerReloadNecessary;
- (BOOL)lastProvidedIsRestricted;
- (BOOL)secureElementIsProductionSigned;
- (BOOL)showPassState;
- (BOOL)supportsAddingPaymentPass:(id)a3;
- (BOOL)supportsAddingPaymentPasses;
- (BOOL)supportsCredentialType:(int64_t)a3;
- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3;
- (BOOL)supportsInAppPaymentsForPass:(id)a3;
- (BOOL)supportsLowPowerExpressMode;
- (BOOL)supportsMessagesForPass:(id)a3;
- (BOOL)supportsTransactionsForPass:(id)a3;
- (NPKCompanionAgentConnection)connection;
- (NPKPassbookPaymentSetupDelegate)paymentSetupDelegate;
- (NPKStockholmProvisioningController)initWithPaymentSetupDelegate:(id)a3;
- (NSHashTable)dataProviderDelegates;
- (NSSet)pendingExpressPassesConfigurations;
- (NSString)defaultPaymentPassIdentifier;
- (NSString)deviceClass;
- (NSString)deviceName;
- (NSString)secureElementIdentifier;
- (PKOSVersionRequirement)deviceVersion;
- (PKPaymentDataProviderDelegate)delegate;
- (PKPaymentOptionsDefaults)defaults;
- (PKPaymentWebService)paymentWebService;
- (id)_changeExpressStateInstructionViewControllerForEnablingExpressMode:(BOOL)a3 paymentCardType:(int64_t)a4 passLocalizedDescription:(id)a5 cancellationHandler:(id)a6;
- (id)_currentExpressPassConfigurationForUniqueID:(id)a3;
- (id)_errorAcknowledgeButtonTitle;
- (id)_errorSetExpressModeMessageWithPass:(id)a3;
- (id)_errorSetExpressModeTitle;
- (id)_unlockRequiredMessageWithPaymentPass:(id)a3;
- (id)_unlockRequiredTitle;
- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3;
- (id)expressPassConfigurations;
- (id)optionsDelegate;
- (id)secureElementID;
- (id)setupBrowsableProductTypesForDevice;
- (id)setupFeaturedNetworksForDevice;
- (id)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3;
- (id)webService;
- (int64_t)apiVersion;
- (void)_accessDelegatesWithHandler:(id)a3;
- (void)_dismissInstructionViewController:(id)a3;
- (void)_handleExpressPassesConfigurationChangedNotification:(id)a3;
- (void)_handleSetExpressPassResult:(unint64_t)a3 forInstructionViewController:(id)a4;
- (void)_presentErrorWithTitle:(id)a3 message:(id)a4 acknowledgeButtonTitle:(id)a5 visibleViewController:(id)a6 dismissBlock:(id)a7;
- (void)_presentInstructionViewController:(id)a3 inVisibleViewController:(id)a4;
- (void)addDelegate:(id)a3;
- (void)balanceReminderThresholdForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5;
- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 completion:(id)a5;
- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5;
- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4;
- (void)deletePaymentTransactionWithIdentifier:(id)a3;
- (void)familyMembersWithCompletion:(id)a3;
- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)passUpgradeWithRequest:(id)a3 pass:(id)a4 visibleViewController:(id)a5 completion:(id)a6;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalance:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithBalances:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithCredentials:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4;
- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)preflightForLocalPassWithCompletion:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeExpressPassesWithUniqueIdentifiers:(id)a3 visibleViewController:(id)a4 completion:(id)a5;
- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setConnection:(id)a3;
- (void)setDataProviderDelegates:(id)a3;
- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)setDefaultPaymentPassIdentifier:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressWithPassConfiguration:(id)a3 visibleViewController:(id)a4 requiresAuth:(BOOL)a5 completion:(id)a6;
- (void)setLastProvidedIsRestricted:(BOOL)a3;
- (void)setPaymentHandoffDisabled:(BOOL)a3;
- (void)setPaymentSetupDelegate:(id)a3;
- (void)setPendingExpressPassesConfigurations:(id)a3;
- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3;
- (void)startServiceModeForPassWithUniqueIdentifier:(id)a3 visibleViewController:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6 completion:(id)a7;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5;
- (void)updateRegionSupportIfNecessary;
@end

@implementation NPKStockholmProvisioningController

- (NPKStockholmProvisioningController)initWithPaymentSetupDelegate:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPKStockholmProvisioningController;
  v6 = [(NPKStockholmProvisioningController *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paymentSetupDelegate, a3);
    uint64_t v8 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    dataProviderDelegates = v7->_dataProviderDelegates;
    v7->_dataProviderDelegates = (NSHashTable *)v8;

    v10 = (NPKCompanionAgentConnection *)objc_alloc_init((Class)NPKCompanionAgentConnection);
    connection = v7->_connection;
    v7->_connection = v10;

    [(NPKCompanionAgentConnection *)v7->_connection setDelegate:v7];
    v12 = (PKPaymentOptionsDefaults *)objc_alloc_init((Class)PKPaymentOptionsDefaults);
    defaults = v7->_defaults;
    v7->_defaults = v12;

    v14 = +[NSNotificationCenter defaultCenter];
    v15 = NPKNotificationForExpressPassesInformationChange();
    [v14 addObserver:v7 selector:"_handleExpressPassesConfigurationChangedNotification:" name:v15 object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    v17 = NPKNotificationForExpressPassConfigurationChange();
    [v16 addObserver:v7 selector:"_handleExpressPassesConfigurationChangedNotification:" name:v17 object:0];
  }
  return v7;
}

- (void)_handleExpressPassesConfigurationChangedNotification:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_B70C;
  v4[3] = &unk_2C738;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)addDelegate:(id)a3
{
}

- (void)removeDelegate:(id)a3
{
}

- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  v6 = [v5 defaultPaymentApplicationForPassWithUniqueID:v4];

  return v6;
}

- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_B958;
  v13[3] = &unk_2C9E0;
  id v14 = v8;
  id v12 = v8;
  [v11 setDefaultPaymentApplication:v10 forPassWithUniqueID:v9 completion:v13];
}

- (void)setDefaultPaymentPassIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  [v5 setDefaultPaymentPassIdentifier:v4];
}

- (NSString)defaultPaymentPassIdentifier
{
  v2 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  id v3 = [v2 defaultPaymentPassIdentifier];

  return (NSString *)v3;
}

- (NSString)secureElementIdentifier
{
  return (NSString *)[(NPKStockholmProvisioningController *)self secureElementID];
}

- (BOOL)isDeviceInRestrictedMode
{
  return [(NPKStockholmProvisioningController *)self deviceInRestrictedMode];
}

- (id)_currentExpressPassConfigurationForUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKStockholmProvisioningController *)self expressPassConfigurations];
  v6 = v5;
  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "passUniqueIdentifier", (void)v15);
          unsigned __int8 v13 = [v12 isEqualToString:v4];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)expressPassConfigurations
{
  id v3 = [(NPKStockholmProvisioningController *)self pendingExpressPassesConfigurations];

  if (v3)
  {
    id v4 = [(NPKStockholmProvisioningController *)self pendingExpressPassesConfigurations];
    id v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: Have pending expressPassesConfigurations, returning: %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    id v4 = NPKPairedDeviceCurrentExpressPassConfiguration();
  }

  return v4;
}

- (void)deletePaymentTransactionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: Requested to delete transaction with identifier:%@", buf, 0xCu);
    }
  }
  id v8 = [(NPKStockholmProvisioningController *)self connection];
  int v9 = NPKPairedOrPairingDevice();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_BEBC;
  v11[3] = &unk_2CA08;
  id v12 = v4;
  id v10 = v4;
  [v8 deletePaymentTransactionWithIdentifier:v10 fromDevice:v9 completion:v11];
}

- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPKStockholmProvisioningController *)self connection];
  [v11 transitStateWithPassUniqueIdentifier:v10 paymentApplication:v9 completion:v8];
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6 completion:(id)a7
{
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v17 = a10;
  id v18 = a7;
  id v19 = a6;
  id v20 = a3;
  id v21 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  [v21 transactionsForTransactionSourceIdentifiers:v20 withTransactionSource:a4 withBackingData:a5 startDate:v19 endDate:v18 orderedByDate:a8 limit:a9 completion:v17];
}

- (id)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3
{
  return 0;
}

- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKStockholmProvisioningController *)self connection];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_C238;
  v10[3] = &unk_2CA30;
  id v11 = v6;
  id v9 = v6;
  [v8 balancesForPaymentPassWithUniqueIdentifier:v7 completion:v10];
}

- (void)balanceReminderThresholdForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPKStockholmProvisioningController *)self connection];
  [v11 balanceReminderForBalance:v10 pass:v9 withCompletion:v8];
}

- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NPKStockholmProvisioningController *)self connection];
  [v14 setBalanceReminder:v13 forBalance:v12 pass:v11 completion:v10];
}

- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v4 = (void (**)(id, id))a4;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[NPKStockholmProvisioningController plansForPaymentPassWithUniqueIdentifier:completion:]";
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Warning: %s this method is not implemented yet. returning empty set", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v4)
  {
    id v8 = objc_alloc_init((Class)NSArray);
    v4[2](v4, v8);
  }
}

- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPKStockholmProvisioningController *)self connection];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_C570;
  v13[3] = &unk_2CA58;
  id v14 = v8;
  id v12 = v8;
  [v11 commutePlanReminderForCommutePlan:v10 pass:v9 withCompletion:v13];
}

- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(NPKStockholmProvisioningController *)self connection];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_C680;
  v16[3] = &unk_2CA80;
  id v17 = v10;
  id v15 = v10;
  [v14 setCommutePlanReminder:v13 forCommutePlan:v12 pass:v11 completion:v16];
}

- (BOOL)supportsTransactionsForPass:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (!NPKIsPairedDeviceStandalone())
  {
    id v4 = [v3 paymentPass];
    id v5 = [v4 devicePaymentApplications];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_C7E8;
    v9[3] = &unk_2CAA8;
    v9[4] = &v10;
    [v5 enumerateObjectsUsingBlock:v9];
LABEL_6:

    goto LABEL_7;
  }
  id v4 = [v3 secureElementPass];
  if (![v4 isAccessPass])
  {
    id v5 = NPKPairedDeviceSecureElementIdentifiers();
    unsigned __int8 v6 = [v4 isPrecursorPass:v5];
    *((unsigned char *)v11 + 24) = v6 ^ 1;
    goto LABEL_6;
  }
  *((unsigned char *)v11 + 24) = 0;
LABEL_7:

  char v7 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)supportsMessagesForPass:(id)a3
{
  return 0;
}

- (BOOL)supportsInAppPaymentsForPass:(id)a3
{
  id v4 = a3;
  if ([(NPKStockholmProvisioningController *)self deviceSupportsInAppPayments])
  {
    id v5 = [v4 paymentPass];
    unsigned __int8 v6 = [v5 deviceInAppPaymentApplications];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  return _NPKPairedOrPairingDeviceSupportsExpressForAutomaticSelectionTechnologyType(a3, a2);
}

- (BOOL)supportsLowPowerExpressMode
{
  v2 = NPKPairedOrPairingDevice();
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F1A5C432-A408-423F-BE6A-680A231439AB"];
  unsigned __int8 v4 = [v2 supportsCapability:v3];

  return v4;
}

- (BOOL)supportsAddingPaymentPasses
{
  return _NPKPairedOrPairingDeviceCanProvisionSecureElementPasses(self, a2);
}

- (BOOL)isPaymentHandoffDisabled
{
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@".GlobalPreferences"];
  unsigned __int8 v3 = [v2 BOOLForKey:PKHandoffPaymentsDisabledKey];

  return v3;
}

- (void)setPaymentHandoffDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@".GlobalPreferences"];
  uint64_t v4 = PKHandoffPaymentsDisabledKey;
  [v8 setBool:v3 forKey:PKHandoffPaymentsDisabledKey];
  id v5 = [v8 synchronize];
  unsigned __int8 v6 = objc_opt_new();
  BOOL v7 = +[NSSet setWithObject:v4];
  [v6 synchronizeNanoDomain:@".GlobalPreferences" keys:v7];
}

- (NSString)deviceClass
{
  id v2 = NPKPairedOrPairingDevice();
  BOOL v3 = NPKDeviceClassFromDevice();

  return (NSString *)v3;
}

- (PKOSVersionRequirement)deviceVersion
{
  id v2 = NPKPairedOrPairingDevice();
  BOOL v3 = NPKDeviceOSVersionRequirementFromDevice();

  return (PKOSVersionRequirement *)v3;
}

- (int64_t)apiVersion
{
  id v2 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  BOOL v3 = [v2 targetDevice];

  if ([v3 deviceSupportTransitReminderSetting]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = [v3 deviceSupportMultipleExpressPasses];
  }

  return v4;
}

- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
    id v9 = [v8 targetDevice];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_CC4C;
    v10[3] = &unk_2CA30;
    id v11 = v6;
    [v9 conflictingExpressPassIdentifiersForPassConfiguration:v7 completion:v10];
  }
}

- (void)familyMembersWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  id v5 = [v6 targetDevice];
  [v5 familyMembersWithCompletion:v4];
}

- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  id v8 = [v9 targetDevice];
  [v8 photosForFamilyMembersWithDSIDs:v7 completion:v6];
}

- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  id v8 = [v9 targetDevice];
  [v8 featureApplicationsForAccountIdentifier:v7 completion:v6];
}

- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  id v11 = [v12 targetDevice];
  [v11 cancelAutoTopUpForPassWithUniqueIdentifier:v10 balanceIdentifiers:v9 completion:v8];
}

- (id)webService
{
  id v2 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  BOOL v3 = [v2 webService];

  return v3;
}

- (PKPaymentWebService)paymentWebService
{
  id v2 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  BOOL v3 = [v2 webService];

  return (PKPaymentWebService *)v3;
}

- (id)optionsDelegate
{
  return [(NPKStockholmProvisioningController *)self defaults];
}

- (BOOL)deviceSupportsInAppPayments
{
  id v2 = NPKPairedOrPairingDevice();
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canRegisterForPeerPayment
{
  if ((PKUseMockSURFServer() & 1) == 0)
  {
    id v4 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
    id v5 = [v4 webService];

    id v6 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
    id v7 = [v6 peerPaymentWebService];

    id v8 = NPKPairedOrPairingDevice();
    id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4CAAF5A2-6DD3-43EE-B2D8-C3D8C4997856"];
    unsigned int v3 = [v8 supportsCapability:v9];

    if (!v3)
    {
LABEL_12:

      return v3;
    }
    id v10 = PKPeerPaymentServiceOverrideURL();

    if (v10)
    {
LABEL_5:
      LOBYTE(v3) = 1;
      goto LABEL_12;
    }
    if ([v5 needsRegistration])
    {
      id v11 = [v5 context];
      id v12 = [v11 configuration];
      char v13 = [v5 targetDevice];
      id v14 = [v13 deviceRegion];
      LOBYTE(v3) = [v12 peerPaymentEnabledForRegion:v14];
    }
    else
    {
      if (v7 && ![v7 needsRegistration]) {
        goto LABEL_5;
      }
      id v11 = [v5 targetDevice];
      id v12 = [v11 deviceRegion];
      LOBYTE(v3) = NPKShouldAllowPeerPaymentRegistrationForWebService();
    }

    goto LABEL_12;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)deviceInRestrictedMode
{
  BOOL v3 = [(NPKStockholmProvisioningController *)self _deviceInRestrictedMode];
  BOOL v4 = v3;
  [(NPKStockholmProvisioningController *)self setLastProvidedIsRestricted:v3];
  return v4;
}

- (BOOL)showPassState
{
  return 1;
}

- (BOOL)secureElementIsProductionSigned
{
  id v2 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  BOOL v3 = [v2 webService];
  BOOL v4 = [v3 context];
  char v5 = [v4 devSigned] ^ 1;

  return v5;
}

- (id)_changeExpressStateInstructionViewControllerForEnablingExpressMode:(BOOL)a3 paymentCardType:(int64_t)a4 passLocalizedDescription:(id)a5 cancellationHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init(NPKSetExpressPassCompanionInstructionViewController);
  [(NPKSetExpressPassCompanionInstructionViewController *)v12 setPaymentCardType:a4];
  [(NPKSetExpressPassCompanionInstructionViewController *)v12 setMessageType:!v8];
  [(NPKSetExpressPassCompanionInstructionViewController *)v12 setCardName:v10];
  objc_initWeak(&location, v12);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_D2F0;
  v15[3] = &unk_2CAD0;
  objc_copyWeak(&v17, &location);
  v15[4] = self;
  id v13 = v11;
  id v16 = v13;
  [(NPKBridgeInstructionViewController *)v12 setCancellationHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v12;
}

- (void)_presentInstructionViewController:(id)a3 inVisibleViewController:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D418;
  v7[3] = &unk_2C738;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)_dismissInstructionViewController:(id)a3
{
  id v4 = [a3 navigationController];
  BOOL v3 = [v4 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_handleSetExpressPassResult:(unint64_t)a3 forInstructionViewController:(id)a4
{
  id v5 = a4;
  id v6 = [v5 cancellationHandler];
  id v7 = v6;
  if (!v6) {
    id v6 = &stru_2CAF0;
  }
  id v8 = objc_retainBlock(v6);

  if (a3 != 1)
  {
    if (a3 == 3)
    {
      id v15 = pk_Payment_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        id v17 = pk_Payment_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Notice: setDefaultExpressPassIdentifier unlock required", buf, 2u);
        }
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_D7D4;
      block[3] = &unk_2C6A8;
      id v25 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      id v18 = v25;
    }
    else
    {
      if (a3 == 2)
      {
        id v9 = pk_Payment_log();
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

        if (v10)
        {
          id v11 = pk_Payment_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            id v12 = "Notice: setDefaultExpressPassIdentifier cancelled handler called";
LABEL_12:
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
            goto LABEL_13;
          }
          goto LABEL_13;
        }
        goto LABEL_14;
      }
      id v19 = pk_Payment_log();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (v20)
      {
        id v21 = pk_Payment_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Notice: setDefaultExpressPassIdentifier error handler called", buf, 2u);
        }
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_D7DC;
      v22[3] = &unk_2C6A8;
      id v23 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);
      id v18 = v23;
    }

    goto LABEL_26;
  }
  id v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v12 = "Notice: setDefaultExpressPassIdentifier success handler called";
      goto LABEL_12;
    }
LABEL_13:
  }
LABEL_14:
  v8->invoke(v8);
LABEL_26:
}

- (void)setExpressWithPassConfiguration:(id)a3 visibleViewController:(id)a4 requiresAuth:(BOOL)a5 completion:(id)a6
{
  BOOL v35 = a5;
  id v9 = a3;
  id v36 = a4;
  id v10 = a6;
  id v11 = [v9 passInformation];
  id v12 = [v11 passUniqueIdentifier];
  id v13 = [v11 expressMode];
  BOOL v14 = pk_Payment_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    BOOL v16 = pk_Payment_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Notice: Request to set express pass with Unique Identifier: %@ expressMode: %@", buf, 0x16u);
    }
  }
  uint64_t v17 = v12 != 0;
  if (v12)
  {
    id v18 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
    id v19 = [v18 passWithUniqueID:v12];
  }
  else
  {
    id v19 = 0;
  }
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  char v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  char v48 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v52 = sub_DCC0;
  v53 = sub_DCD0;
  id v54 = 0;
  if ([v11 cardType] == (char *)&dword_0 + 2)
  {
    uint64_t v20 = NPKPairedDeviceExpressPassConfigurationWithCardType();
    id v21 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v20;
  }
  else
  {
    id v21 = [(NPKStockholmProvisioningController *)self _currentExpressPassConfigurationForUniqueID:v12];
    if (v21) {
      +[NSSet setWithObject:v21];
    }
    else {
    uint64_t v22 = +[NSSet set];
    }
    id v23 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v22;
  }
  v24 = [*(id *)(*(void *)&buf[8] + 40) anyObject];

  if (v24)
  {
    id v25 = [*(id *)(*(void *)&buf[8] + 40) anyObject];
    if ([v25 isNFCExpressEnabled]
      && ![v9 isNFCExpressEnabled]
      || [v25 isUWBExpressEnabled]
      && ((v26 = [v9 isUWBExpressEnabled], v12) ? (uint64_t v17 = v26) : (uint64_t v17 = 0), (v26 & 1) == 0))
    {
      uint64_t v17 = 0;
      BOOL v35 = 0;
    }
  }
  id v27 = [v11 cardType];
  v28 = [v19 localizedDescription];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_DCD8;
  v41[3] = &unk_2CB18;
  v44 = v49;
  id v29 = v10;
  v45 = v47;
  v46 = buf;
  id v43 = v29;
  v41[4] = self;
  id v30 = v13;
  id v42 = v30;
  v31 = [(NPKStockholmProvisioningController *)self _changeExpressStateInstructionViewControllerForEnablingExpressMode:v17 paymentCardType:v27 passLocalizedDescription:v28 cancellationHandler:v41];

  [(NPKStockholmProvisioningController *)self _presentInstructionViewController:v31 inVisibleViewController:v36];
  v32 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  v33 = [v32 targetDevice];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_DDE0;
  v37[3] = &unk_2CB68;
  v39 = buf;
  v37[4] = self;
  v40 = v47;
  id v34 = v31;
  id v38 = v34;
  [v33 setExpressWithPassConfiguration:v9 requestAuthorization:v35 completion:v37];

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v47, 8);
  _Block_object_dispose(v49, 8);
}

- (void)removeExpressPassesWithUniqueIdentifiers:(id)a3 visibleViewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v41 = a4;
  id v43 = a5;
  id v9 = pk_Payment_log();
  LODWORD(a4) = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (a4)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Notice: Request to remove express passes with unique identifiers: %@ using ExpressPassConfiguration", (uint8_t *)&buf, 0xCu);
    }
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v8;
  id v44 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v58;
    *(void *)&long long v11 = 138412290;
    long long v39 = v11;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v58 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        BOOL v14 = -[NPKStockholmProvisioningController _currentExpressPassConfigurationForUniqueID:](self, "_currentExpressPassConfigurationForUniqueID:", v13, v39);
        if (v14)
        {
          BOOL v15 = [(NPKStockholmProvisioningController *)self expressPassConfigurations];
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v64 = 0x2020000000;
          char v65 = 0;
          if (v13)
          {
            BOOL v16 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
            v45 = [v16 passWithUniqueID:v13];
          }
          else
          {
            v45 = 0;
          }
          uint64_t v20 = [v14 passInformation];
          id v21 = (char *)[v20 cardType];

          uint64_t v22 = [v45 localizedDescription];
          if (v21 == (unsigned char *)&dword_0 + 1) {
            uint64_t v23 = 3;
          }
          else {
            uint64_t v23 = (uint64_t)v21;
          }
          v53[0] = _NSConcreteStackBlock;
          v53[1] = 3221225472;
          v53[2] = sub_E65C;
          v53[3] = &unk_2CB90;
          p_long long buf = &buf;
          id v24 = v43;
          id v55 = v24;
          id v25 = v15;
          id v54 = v25;
          unsigned int v26 = [(NPKStockholmProvisioningController *)self _changeExpressStateInstructionViewControllerForEnablingExpressMode:0 paymentCardType:v23 passLocalizedDescription:v22 cancellationHandler:v53];

          [(NPKStockholmProvisioningController *)self _presentInstructionViewController:v26 inVisibleViewController:v41];
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_E724;
          v48[3] = &unk_2CBB8;
          v52 = &buf;
          v48[4] = self;
          id v27 = v25;
          id v49 = v27;
          id v51 = v24;
          id v28 = v26;
          id v50 = v28;
          id v29 = objc_retainBlock(v48);
          id v30 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
          v31 = [v30 targetDevice];

          if (NPKIsPairedDeviceStandalone())
          {
            [v31 removeExpressPassWithUniqueIdentifier:v13 completion:v29];
          }
          else
          {
            v32 = [v14 passInformation];
            v33 = [v32 expressMode];

            id v34 = pk_Payment_log();
            BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

            if (v35)
            {
              id v36 = pk_Payment_log();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v61 = v39;
                v62 = v33;
                _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "Notice: Matched unique ID to express mode %@", v61, 0xCu);
              }
            }
            id v37 = [objc_alloc((Class)PKExpressPassInformation) initForExpressMode:v33 withPassUniqueIdentifier:0 paymentApplicationIdentifier:0];
            if (v37)
            {
              id v38 = [objc_alloc((Class)PKExpressPassConfiguration) initWithPassInformation:v37 isNFCExpressEnabled:1 isUWBExpressEnabled:0];
              v46[0] = _NSConcreteStackBlock;
              v46[1] = 3221225472;
              v46[2] = sub_E8E0;
              v46[3] = &unk_2CBE0;
              v47 = v29;
              [v31 setExpressWithPassConfiguration:v38 requestAuthorization:0 completion:v46];
            }
            else
            {
              id v38 = +[NSSet set];
              ((void (*)(void *, void, id))v29[2])(v29, 0, v38);
            }
          }
          _Block_object_dispose(&buf, 8);
        }
        else
        {
          uint64_t v17 = pk_Payment_log();
          BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

          if (v18)
          {
            id v19 = pk_Payment_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = v39;
              *(void *)((char *)&buf + 4) = v13;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Notice: No current express pass information for unique ID %@", (uint8_t *)&buf, 0xCu);
            }
          }
          (*((void (**)(id, uint64_t, void))v43 + 2))(v43, 1, 0);
        }
      }
      id v44 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v44);
  }
}

- (void)startServiceModeForPassWithUniqueIdentifier:(id)a3 visibleViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Notice: Bridge got request to turn on service mode for pass %@; visible view controller %@",
        buf,
        0x16u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = objc_alloc_init(NPKEnableTransitServiceModeInstructionViewController);
    id v12 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v11];
    uint64_t v13 = [v12 navigationBar];
    BPSApplyStyleToNavBar();

    id v14 = v7;
    [v14 presentViewController:v12 animated:1 completion:0];
    objc_initWeak((id *)buf, v11);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_EBC0;
    v22[3] = &unk_2CC08;
    objc_copyWeak(&v23, (id *)buf);
    void v22[4] = self;
    [(NPKBridgeInstructionViewController *)v11 setCancellationHandler:v22];
    BOOL v15 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
    BOOL v16 = [v15 targetDevice];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_EC6C;
    v19[3] = &unk_2CC58;
    uint64_t v17 = v11;
    uint64_t v20 = v17;
    id v18 = v14;
    id v21 = v18;
    [v16 enableServiceModeForPassWithUniqueIdentifier:v6 completion:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)passUpgradeWithRequest:(id)a3 pass:(id)a4 visibleViewController:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = pk_General_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    BOOL v16 = pk_General_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v11 uniqueID];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Notice: Bridge got request to upgrade pass with uniqueID:%@ visisble view controller:%@", buf, 0x16u);
    }
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v50 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_F180;
  v46[3] = &unk_2CC80;
  id v18 = v13;
  id v47 = v18;
  char v48 = buf;
  id v19 = objc_retainBlock(v46);
  uint64_t v20 = objc_alloc_init(NPKSetExpressPassCompanionInstructionViewController);
  objc_initWeak(&location, v20);
  -[NPKSetExpressPassCompanionInstructionViewController setPaymentCardType:](v20, "setPaymentCardType:", [v11 cardType]);
  [(NPKSetExpressPassCompanionInstructionViewController *)v20 setMessageType:0];
  id v21 = [v11 localizedDescription];
  [(NPKSetExpressPassCompanionInstructionViewController *)v20 setCardName:v21];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_F26C;
  v39[3] = &unk_2CCA8;
  id v22 = v11;
  id v40 = v22;
  id v23 = v19;
  id v43 = v23;
  objc_copyWeak(&v44, &location);
  id v41 = self;
  id v31 = v10;
  id v42 = v31;
  [(NPKBridgeInstructionViewController *)v20 setCancellationHandler:v39];
  [(NPKStockholmProvisioningController *)self _presentInstructionViewController:v20 inVisibleViewController:v12];
  id v24 = v12;
  id v25 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  __int16 v26 = [v25 targetDevice];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_F410;
  v32[3] = &unk_2CD20;
  id v27 = v22;
  id v33 = v27;
  objc_copyWeak(&v38, &location);
  id v28 = v24;
  id v34 = v28;
  BOOL v35 = self;
  id v29 = v18;
  id v36 = v29;
  id v30 = v23;
  id v37 = v30;
  [v26 remotePassUpgradeWithRequest:v31 pass:v27 requireAuthorization:1 notifyUserOnPairedDevice:0 updateBlock:v32];

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v44);

  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
}

- (BOOL)isOrderManagementDisabled
{
  return 1;
}

- (BOOL)isOrderManagementNotificationsDisabled
{
  return 1;
}

- (NSString)deviceName
{
  id v2 = NPKPairedOrPairingDevice();
  BOOL v3 = [v2 valueForProperty:NRDevicePropertyName];

  return (NSString *)v3;
}

- (BOOL)hasFelicaSecureElement
{
  id v2 = NPKPairedOrPairingDevice();
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6C4614A2-1ECC-4405-9FEE-B5F0A5666961"];
  unsigned __int8 v4 = [v2 supportsCapability:v3];

  return v4;
}

- (BOOL)supportsCredentialType:(int64_t)a3
{
  return NPKPairedOrPairingDeviceSupportsCredentialType();
}

- (BOOL)supportsAddingPaymentPass:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 devicePrimaryPaymentApplication];
  [v4 paymentNetworkIdentifier];

  if (NPKPairedOrPairingDeviceSupportsCredentialType())
  {
    if ([v3 isStoredValuePass]
      && (NPKPairedDeviceSecureElementIdentifiers(),
          id v5 = objc_claimAutoreleasedReturnValue(),
          id v6 = (char *)[v5 count],
          v5,
          v6 == (unsigned char *)&dword_0 + 2))
    {
      if ([v3 isSuicaPass])
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v7 = objc_msgSend(v3, "paymentApplications", 0);
        id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (!v8)
        {
          BOOL v14 = 1;
          goto LABEL_25;
        }
        id v9 = v8;
        uint64_t v10 = *(void *)v23;
LABEL_7:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v22 + 1) + 8 * v11) supportedTransitNetworkIdentifiers];
          unsigned __int8 v13 = [v12 containsObject:@"transit.felica.suica"];

          if ((v13 & 1) == 0) {
            break;
          }
          if (v9 == (id)++v11)
          {
            id v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
            BOOL v14 = 1;
            if (v9) {
              goto LABEL_7;
            }
            goto LABEL_25;
          }
        }
        id v18 = pk_Payment_log();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (!v19) {
          goto LABEL_23;
        }
        uint64_t v17 = pk_Payment_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [v3 uniqueID];
          *(_DWORD *)long long buf = 138412290;
          id v27 = v20;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Notice: Adding non-Suica payment pass to dualSE Apple Watch not supported for pass with uniqueID: %@", buf, 0xCu);
        }
        goto LABEL_22;
      }
      BOOL v15 = pk_Payment_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      BOOL v14 = 0;
      if (v16)
      {
        id v7 = pk_Payment_log();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
LABEL_23:
          BOOL v14 = 0;
LABEL_25:

          goto LABEL_26;
        }
        uint64_t v17 = [v3 uniqueID];
        *(_DWORD *)long long buf = 138412290;
        id v27 = v17;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: Adding non-Suica payment pass to dualSE Apple Watch not supported for pass with uniqueID: %@", buf, 0xCu);
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_26:

  return v14;
}

- (id)setupBrowsableProductTypesForDevice
{
  id v2 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  id v3 = [v2 webService];

  unsigned __int8 v4 = [v3 targetDevice];
  id v5 = [v4 deviceRegion];

  id v6 = [v3 context];
  id v7 = [v6 configuration];
  id v8 = [v7 paymentSetupBrowsableProductTypesForRegion:v5];

  return v8;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = @"disabled";
  if (v4) {
    id v7 = @"enabled";
  }
  id v8 = v7;
  id v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    uint64_t v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Notice: Provisioning controller: pass with unique ID %@ %@ transaction service", buf, 0x16u);
    }
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_101FC;
  v14[3] = &unk_2CD48;
  BOOL v15 = v8;
  id v16 = v6;
  BOOL v17 = v4;
  id v12 = v6;
  unsigned __int8 v13 = v8;
  [(NPKStockholmProvisioningController *)self _accessDelegatesWithHandler:v14];
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Notice: Provisioning controller: transaction source identifier %@ received transaction %@", buf, 0x16u);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10478;
  v13[3] = &unk_2CD70;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(NPKStockholmProvisioningController *)self _accessDelegatesWithHandler:v13];
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Notice: Provisioning controller: transaction source identifier %@ removed transaction with identifier %@", buf, 0x16u);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_106E0;
  v13[3] = &unk_2CD70;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(NPKStockholmProvisioningController *)self _accessDelegatesWithHandler:v13];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Notice: Provisioning controller: pass with unique ID %@ updated with transit pass properties %@", buf, 0x16u);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10948;
  v13[3] = &unk_2CD70;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [(NPKStockholmProvisioningController *)self _accessDelegatesWithHandler:v13];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithBalances:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Notice: Provisioning controller: pass with unique ID %@ updated with balances %@", buf, 0x16u);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10BD0;
  v13[3] = &unk_2CD70;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(NPKStockholmProvisioningController *)self _accessDelegatesWithHandler:v13];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalance:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    unsigned __int8 v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412802;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Notice: Provisioning controller: pass with unique ID %@ updated with balance reminder %@ balance %@", buf, 0x20u);
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10E64;
  v17[3] = &unk_2CD98;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [(NPKStockholmProvisioningController *)self _accessDelegatesWithHandler:v17];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithCredentials:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Notice: Provisioning controller: did update with credentials %@ for pass with unique ID %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: Provisioning controller: shares did update for pass with unique ID %@", buf, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_111C0;
  v9[3] = &unk_2CDC0;
  id v10 = v4;
  id v8 = v4;
  [(NPKStockholmProvisioningController *)self _accessDelegatesWithHandler:v9];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v15 = v6;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Notice: Provisioning controller: pass with unique ID %@ did enable message service %d", buf, 0x12u);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_11410;
  v11[3] = &unk_2CDE8;
  id v12 = v6;
  BOOL v13 = v4;
  id v10 = v6;
  [(NPKStockholmProvisioningController *)self _accessDelegatesWithHandler:v11];
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)PKPaymentProvisioningController);
  id v6 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  id v7 = [v6 webService];
  id v8 = [v5 initWithWebService:v7];

  [v8 setIsProvisioningForAltAccount:NPKPairedOrPairingDeviceIsTinker()];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1157C;
  v11[3] = &unk_2CE10;
  id v12 = v8;
  id v13 = v4;
  id v9 = v8;
  id v10 = v4;
  [v9 preflightWithCompletion:v11];
}

- (id)setupFeaturedNetworksForDevice
{
  id v2 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  id v3 = [v2 webService];

  id v4 = [v3 targetDevice];
  id v5 = [v4 deviceRegion];

  id v6 = [v3 context];
  id v7 = [v6 configuration];
  id v8 = [v7 paymentSetupFeaturedNetworksForRegion:v5];

  return v8;
}

- (void)preflightForLocalPassWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)PKPaymentProvisioningController);
  id v6 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  id v7 = [v6 webService];
  id v8 = [v5 initWithWebService:v7];

  [v8 setIsProvisioningForAltAccount:NPKPairedOrPairingDeviceIsTinker()];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_11808;
  v11[3] = &unk_2CE10;
  id v12 = v8;
  id v13 = v4;
  id v9 = v8;
  id v10 = v4;
  [v9 validatePreconditionsAndRegister:v11];
}

- (BOOL)isRegistrationSupported
{
  id v2 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  id v3 = [v2 webService];

  if (v3) {
    int v4 = [v3 paymentSetupSupportedInRegion] != (char *)&dword_0 + 2;
  }
  else {
    int v4 = 1;
  }
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[NSLocale currentLocale];
      id v9 = [v8 localeIdentifier];
      id v10 = +[NSLocale currentLocale];
      id v11 = [v10 regionCode];
      v13[0] = 67109634;
      v13[1] = v4;
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      BOOL v17 = v11;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: Registration supported result %d locale %@ country code %@", (uint8_t *)v13, 0x1Cu);
    }
  }

  return v4;
}

- (void)updateRegionSupportIfNecessary
{
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Notice: Updating region support", buf, 2u);
    }
  }
  BOOL v6 = [(NPKStockholmProvisioningController *)self paymentSetupDelegate];
  id v7 = [v6 webService];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_11B74;
  v9[3] = &unk_2CA08;
  id v10 = v7;
  id v8 = v7;
  +[PKPaymentRegistrationUtilities configureWebServiceIfNecessary:v8 completion:v9];
}

- (id)secureElementID
{
  return (id)_NPKPairedDevicePrimarySecureElementIdentifier(self, a2);
}

- (BOOL)isSettingsControllerReloadNecessary
{
  unsigned int v3 = [(NPKStockholmProvisioningController *)self _deviceInRestrictedMode];
  if (v3 != [(NPKStockholmProvisioningController *)self lastProvidedIsRestricted]) {
    return 1;
  }
  id v5 = [(NPKStockholmProvisioningController *)self pendingExpressPassesConfigurations];
  BOOL v4 = v5 == 0;

  return v4;
}

- (BOOL)_deviceInRestrictedMode
{
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanopassbook"];
  unsigned int v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = [v2 BOOLForKey:@"InRestrictedMode"];
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Notice: inRestrictedMode %d", (uint8_t *)v8, 8u);
    }
  }
  unsigned __int8 v6 = [v2 BOOLForKey:@"InRestrictedMode"];

  return v6;
}

- (void)_accessDelegatesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKStockholmProvisioningController *)self dataProviderDelegates];
  unsigned __int8 v6 = [v5 allObjects];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_11DB0;
  v8[3] = &unk_2CE38;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (id)_unlockRequiredTitle
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v3 = [v2 localizedStringForKey:@"EXPRESS_TRANSIT_SET_CARD_UNLOCK_REQUIRED_TITLE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];

  return v3;
}

- (id)_unlockRequiredMessageWithPaymentPass:(id)a3
{
  unsigned int v3 = [a3 localizedDescription];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v3)
  {
    id v5 = [v4 localizedStringForKey:@"EXPRESS_TRANSIT_SET_CARD_UNLOCK_REQUIRED_MESSAGE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
    unsigned __int8 v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);
  }
  else
  {
    unsigned __int8 v6 = [v4 localizedStringForKey:@"EXPRESS_TRANSIT_SET_CARD_UNLOCK_REQUIRED_MESSAGE_NO_CARD_NAME" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
  }

  return v6;
}

- (id)_errorAcknowledgeButtonTitle
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v3 = [v2 localizedStringForKey:@"EXPRESS_TRANSIT_ERROR_ACKNOWLEDGE_BUTTON_TITLE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];

  return v3;
}

- (id)_errorSetExpressModeTitle
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v3 = [v2 localizedStringForKey:@"EXPRESS_TRANSIT_SET_CARD_ERROR_TITLE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];

  return v3;
}

- (id)_errorSetExpressModeMessageWithPass:(id)a3
{
  unsigned int v3 = [a3 localizedDescription];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v3)
  {
    id v5 = [v4 localizedStringForKey:@"EXPRESS_ACCESS_SET_CARD_ERROR_MESSAGE" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
    unsigned __int8 v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3);
  }
  else
  {
    unsigned __int8 v6 = [v4 localizedStringForKey:@"EXPRESS_ACCESS_SET_CARD_ERROR_MESSAGE_NO_CARD_NAME" value:&stru_2D2E8 table:@"NanoPassbookBridgeSettings-Companion_ICE"];
  }

  return v6;
}

- (void)_presentErrorWithTitle:(id)a3 message:(id)a4 acknowledgeButtonTitle:(id)a5 visibleViewController:(id)a6 dismissBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = a5;
  __int16 v16 = pk_General_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    id v18 = pk_General_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412802;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = v12;
      __int16 v32 = 2112;
      id v33 = v13;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Notice: presenting error with Title:%@ message:%@ visibleViewController:%@", buf, 0x20u);
    }
  }
  id v19 = +[UIAlertController alertControllerWithTitle:v11 message:v12 preferredStyle:1];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_12378;
  v24[3] = &unk_2CE60;
  id v25 = v11;
  id v26 = v12;
  id v27 = v14;
  id v20 = v14;
  id v21 = v12;
  id v22 = v11;
  __int16 v23 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v24];

  [v19 addAction:v23];
  [v13 presentViewController:v19 animated:1 completion:0];
}

- (PKPaymentDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentDataProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPKPassbookPaymentSetupDelegate)paymentSetupDelegate
{
  return self->_paymentSetupDelegate;
}

- (void)setPaymentSetupDelegate:(id)a3
{
}

- (NSHashTable)dataProviderDelegates
{
  return self->_dataProviderDelegates;
}

- (void)setDataProviderDelegates:(id)a3
{
}

- (BOOL)lastProvidedIsRestricted
{
  return self->_lastProvidedIsRestricted;
}

- (void)setLastProvidedIsRestricted:(BOOL)a3
{
  self->_lastProvidedIsRestricted = a3;
}

- (NPKCompanionAgentConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (PKPaymentOptionsDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSSet)pendingExpressPassesConfigurations
{
  return self->_pendingExpressPassesConfigurations;
}

- (void)setPendingExpressPassesConfigurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingExpressPassesConfigurations, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dataProviderDelegates, 0);
  objc_storeStrong((id *)&self->_paymentSetupDelegate, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end