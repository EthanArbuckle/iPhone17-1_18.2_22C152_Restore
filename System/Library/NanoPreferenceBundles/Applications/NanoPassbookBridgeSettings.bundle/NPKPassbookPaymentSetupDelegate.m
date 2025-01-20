@interface NPKPassbookPaymentSetupDelegate
+ (id)sharedSetupDelegate;
- (BOOL)_canAddPaymentPass;
- (BOOL)canAddPaymentPass;
- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3;
- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4;
- (BOOL)hasPaymentPassWithUniqueID:(id)a3;
- (BOOL)isDeletionInProgressForPass:(id)a3;
- (BOOL)isSettingsControllerReloadNecessary;
- (BOOL)lastProvidedCanAddPaymentPass;
- (NPKCompanionAgentConnection)companionAgentConnection;
- (NPKPassbookPaymentSetupDelegate)init;
- (NPKPaymentWebServiceCompanionTargetDevice)targetDevice;
- (NSMutableDictionary)deleteStatusHandlers;
- (NSMutableSet)deletionInProgressPasses;
- (NSString)defaultPaymentPassIdentifier;
- (PKPaymentWebService)webService;
- (id)_defaultPaymentPassIdentifier;
- (id)defaultPaymentApplicationForPassWithUniqueID:(id)a3;
- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (id)passWithUniqueID:(id)a3;
- (id)passes;
- (id)paymentPasses;
- (id)peerPaymentAccount;
- (id)peerPaymentPassUniqueID;
- (id)peerPaymentWebService;
- (unint64_t)_numberOfPaymentPasses;
- (unint64_t)countOfPasses;
- (void)_registerForPeerPaymentWithCompletion:(id)a3;
- (void)_setDeletionInProgress:(BOOL)a3 forPassWithUniqueID:(id)a4;
- (void)_unregisterForPeerPaymentWithCompletion:(id)a3;
- (void)loadWebService;
- (void)paymentSetupDidExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a3 withShouldContinue:(BOOL)a4 error:(id)a5;
- (void)paymentSetupDidFinish:(id)a3;
- (void)paymentSetupDidShowEligibilityIssue;
- (void)paymentSetupDidShowError:(id)a3;
- (void)paymentSetupRequestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a3 withVisibleViewController:(id)a4 completion:(id)a5;
- (void)peerPaymentRegistrationStatusHasChanged:(BOOL)a3 completion:(id)a4;
- (void)removePass:(id)a3;
- (void)setDefaultPaymentApplication:(id)a3 forPassWithUniqueID:(id)a4 completion:(id)a5;
- (void)setDefaultPaymentPassIdentifier:(id)a3;
- (void)setDeleteStatusHandlers:(id)a3;
- (void)setDeletionInProgressPasses:(id)a3;
- (void)setDeletionStatusHandler:(id)a3 forPass:(id)a4;
- (void)setLastProvidedCanAddPaymentPass:(BOOL)a3;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10;
@end

@implementation NPKPassbookPaymentSetupDelegate

+ (id)sharedSetupDelegate
{
  if (qword_35DC8 != -1) {
    dispatch_once(&qword_35DC8, &stru_2CFA8);
  }
  v2 = (void *)qword_35DC0;

  return v2;
}

- (NPKPassbookPaymentSetupDelegate)init
{
  v10.receiver = self;
  v10.super_class = (Class)NPKPassbookPaymentSetupDelegate;
  v2 = [(NPKPassbookPaymentSetupDelegate *)&v10 init];
  if (v2)
  {
    v3 = (NPKCompanionAgentConnection *)objc_alloc_init((Class)NPKCompanionAgentConnection);
    companionAgentConnection = v2->_companionAgentConnection;
    v2->_companionAgentConnection = v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    deleteStatusHandlers = v2->_deleteStatusHandlers;
    v2->_deleteStatusHandlers = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableSet set];
    deletionInProgressPasses = v2->_deletionInProgressPasses;
    v2->_deletionInProgressPasses = (NSMutableSet *)v7;
  }
  return v2;
}

- (void)loadWebService
{
  id v2 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  [v2 loadWebService];
}

- (PKPaymentWebService)webService
{
  id v2 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  v3 = [v2 webService];

  v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Payment setup delegate returning web service %@", (uint8_t *)&v8, 0xCu);
    }
  }

  return (PKPaymentWebService *)v3;
}

- (NPKPaymentWebServiceCompanionTargetDevice)targetDevice
{
  id v2 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  v3 = [v2 targetDevice];

  return (NPKPaymentWebServiceCompanionTargetDevice *)v3;
}

- (void)paymentSetupDidFinish:(id)a3
{
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: Payment setup finished for nav controller %@", (uint8_t *)&v12, 0xCu);
    }
  }
  int v8 = [(NPKPassbookPaymentSetupDelegate *)self webService];
  v9 = [(NPKPassbookPaymentSetupDelegate *)self targetDevice];
  objc_super v10 = [v8 context];
  [v9 archiveContext:v10];

  v11 = [v4 presentingViewController];
  [v11 dismissViewControllerAnimated:1 completion:0];
}

- (void)paymentSetupDidShowError:(id)a3
{
  id v3 = a3;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Error during provisioning: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)paymentSetupDidShowEligibilityIssue
{
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: Card eligibility issue", v5, 2u);
    }
  }
}

- (void)paymentSetupRequestPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a3 withVisibleViewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_retainBlock(v10);
      int v16 = 138412802;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Notice: Payment setup request to upgrade passcode with flow controller: %@ visible view controller: %@ completion: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  v15 = [(NPKPassbookPaymentSetupDelegate *)self targetDevice];
  [v15 requestPasscodeUpgradeForPasscodeUpgradeFlowController:v8 withVisibleViewController:v9 completion:v10];
}

- (void)paymentSetupDidExitPasscodeUpgradeForPasscodeUpgradeFlowController:(id)a3 withShouldContinue:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"NO";
      if (v5) {
        CFStringRef v13 = @"YES";
      }
      int v15 = 138412546;
      CFStringRef v16 = v13;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Notice: Payment setup did exit passcode upgrade with should continue: %@ error: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  id v14 = [(NPKPassbookPaymentSetupDelegate *)self targetDevice];
  [v14 exitPasscodeUpgradeForPasscodeUpgradeFlowController:v9 withShouldContinue:v5 error:v8];
}

- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4
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
      *(_DWORD *)buf = 138412290;
      id v30 = v6;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Notice: Payment setup delegate: got delete request for pass %@", buf, 0xCu);
    }
  }
  BOOL v11 = [v6 paymentPass];
  unsigned int v12 = [v11 isPeerPaymentPass];

  if (v12)
  {
    CFStringRef v13 = pk_Payment_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      int v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Notice: Not requiring remote confirmation to remove peer payment pass", buf, 2u);
      }
    }
  }
  CFStringRef v16 = [v6 uniqueID];
  __int16 v17 = [v7 navigationController];
  objc_initWeak((id *)buf, v17);

  [(NPKPassbookPaymentSetupDelegate *)self _setDeletionInProgress:1 forPassWithUniqueID:v16];
  id v18 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  id v19 = [v6 uniqueID];
  __int16 v20 = NPKPairedOrPairingDevice();
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_161C4;
  v24[3] = &unk_2CFF8;
  id v21 = v6;
  id v25 = v21;
  objc_copyWeak(&v28, (id *)buf);
  v26 = self;
  id v22 = v16;
  id v27 = v22;
  [v18 removePaymentPassWithUniqueID:v19 forDevice:v20 waitForConfirmation:v12 ^ 1 completion:v24];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (BOOL)isDeletionInProgressForPass:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NPKPassbookPaymentSetupDelegate *)self deletionInProgressPasses];
  id v6 = [v4 uniqueID];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)setDeletionStatusHandler:(id)a3 forPass:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(NPKPassbookPaymentSetupDelegate *)self deleteStatusHandlers];
  if (v10)
  {
    id v8 = objc_retainBlock(v10);
    BOOL v9 = [v6 uniqueID];

    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v6 uniqueID];

    [v7 removeObjectForKey:v8];
  }
}

- (void)_setDeletionInProgress:(BOOL)a3 forPassWithUniqueID:(id)a4
{
  int v4 = a3;
  id v12 = a4;
  id v6 = [(NPKPassbookPaymentSetupDelegate *)self deletionInProgressPasses];
  unsigned int v7 = [v6 containsObject:v12];

  if (v7 != v4)
  {
    id v8 = [(NPKPassbookPaymentSetupDelegate *)self deletionInProgressPasses];
    BOOL v9 = v8;
    if (v4) {
      [v8 addObject:v12];
    }
    else {
      [v8 removeObject:v12];
    }

    id v10 = [(NPKPassbookPaymentSetupDelegate *)self deleteStatusHandlers];
    BOOL v11 = [v10 objectForKey:v12];

    if (v11) {
      v11[2](v11);
    }
  }
}

- (id)paymentPasses
{
  BOOL v3 = +[NSMutableArray array];
  int v4 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_16744;
  v9[3] = &unk_2D048;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 paymentPassUniqueIDsSynchronous:1 reply:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (BOOL)canAddPaymentPass
{
  BOOL v3 = [(NPKPassbookPaymentSetupDelegate *)self _canAddPaymentPass];
  BOOL v4 = v3;
  [(NPKPassbookPaymentSetupDelegate *)self setLastProvidedCanAddPaymentPass:v3];
  return v4;
}

- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v5 = PKGeneratePassUniqueID();
  id v6 = [(NPKPassbookPaymentSetupDelegate *)self passWithUniqueID:v5];

  return v6;
}

- (id)peerPaymentPassUniqueID
{
  if (PKUseMockSURFServer())
  {
    id v2 = PKMockPeerPaymentPassPassTypeID();
    BOOL v3 = PKMockPeerPaymentPassSerialNumber();
    uint64_t v4 = PKGeneratePassUniqueID();
  }
  else
  {
    id v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
        BOOL v9 = [v8 peerPaymentAccount];
        id v10 = [v9 associatedPassUniqueID];
        int v13 = 138412290;
        BOOL v14 = v10;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: returning peer payment pass unique ID %@", (uint8_t *)&v13, 0xCu);
      }
    }
    id v2 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
    BOOL v3 = [v2 peerPaymentAccount];
    uint64_t v4 = [v3 associatedPassUniqueID];
  }
  BOOL v11 = (void *)v4;

  return v11;
}

- (id)passWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_16C24;
  int v13 = sub_16C34;
  id v14 = 0;
  id v5 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_16C3C;
  v8[3] = &unk_2D070;
  v8[4] = &v9;
  [v5 paymentPassWithUniqueID:v4 synchronous:1 reply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)removePass:(id)a3
{
}

- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3
{
  return 1;
}

- (NSString)defaultPaymentPassIdentifier
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_16C24;
  int v15 = sub_16C34;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_16E20;
  v8[3] = &unk_2D098;
  id v10 = &v11;
  id v5 = v3;
  uint64_t v9 = v5;
  [v4 defaultCardUniqueID:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

- (id)defaultPaymentApplicationForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_16C24;
  __int16 v17 = sub_16C34;
  id v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_16FE4;
  v10[3] = &unk_2D0C0;
  id v12 = &v13;
  id v7 = v5;
  uint64_t v11 = v7;
  [v6 defaultPaymentApplicationForPassWithUniqueID:v4 completion:v10];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (BOOL)hasPaymentPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatch_semaphore_t v5 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_17148;
  v8[3] = &unk_2D0E8;
  id v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [v5 paymentPassUniqueIDsSynchronous:1 reply:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (void)setDefaultPaymentApplication:(id)a3 forPassWithUniqueID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  [v11 setDefaultPaymentApplication:v10 forPassWithUniqueID:v9 completion:v8];
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v17 = a10;
  id v18 = a7;
  id v19 = a6;
  id v20 = a3;
  id v21 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  [v21 transactionsForTransactionSourceIdentifiers:v20 withTransactionSource:a4 withBackingData:a5 startDate:v19 endDate:v18 orderedByDate:a8 limit:a9 completion:v17];
}

- (void)setDefaultPaymentPassIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_173BC;
  v8[3] = &unk_2D110;
  dispatch_semaphore_t v9 = v5;
  id v7 = v5;
  [v6 setDefaultCardUniqueID:v4 completion:v8];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)isSettingsControllerReloadNecessary
{
  unsigned __int8 v3 = [(NPKPassbookPaymentSetupDelegate *)self _canAddPaymentPass];
  return v3 ^ [(NPKPassbookPaymentSetupDelegate *)self lastProvidedCanAddPaymentPass];
}

- (unint64_t)countOfPasses
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_174C8;
  v5[3] = &unk_2D138;
  v5[4] = &v6;
  [v2 countOfPassesSynchronous:1 completion:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)passes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_16C24;
  id v10 = sub_16C34;
  id v11 = 0;
  id v2 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_175EC;
  v5[3] = &unk_2D160;
  v5[4] = &v6;
  [v2 passesSynchronous:1 completion:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)peerPaymentRegistrationStatusHasChanged:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v18 = v4;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Notice: Got peer payment registration status change request (%d)", buf, 8u);
    }
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_177C0;
  v15[3] = &unk_2D188;
  v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  id v11 = objc_retainBlock(v15);
  id v12 = v11;
  if (v4)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_179E8;
    v13[3] = &unk_2D1D8;
    v13[4] = self;
    char v14 = v11;
    [(NPKPassbookPaymentSetupDelegate *)self _registerForPeerPaymentWithCompletion:v13];
  }
  else
  {
    [(NPKPassbookPaymentSetupDelegate *)self _unregisterForPeerPaymentWithCompletion:v11];
  }
}

- (void)_registerForPeerPaymentWithCompletion:(id)a3
{
  id v4 = a3;
  [(NPKPassbookPaymentSetupDelegate *)self webService];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_17F04;
  v18[3] = &unk_2C760;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v5;
  id v20 = self;
  id v6 = v4;
  id v21 = v6;
  id v7 = objc_retainBlock(v18);
  id v8 = [objc_alloc((Class)PKPaymentProvisioningController) initWithWebService:v5];
  [v8 setIsProvisioningForAltAccount:NPKPairedOrPairingDeviceIsTinker()];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_17F84;
  v13[3] = &unk_2D228;
  id v14 = v5;
  id v15 = v8;
  id v16 = v7;
  id v17 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v8;
  id v12 = v5;
  [v11 validatePreconditions:v13];
}

- (void)_unregisterForPeerPaymentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKPassbookPaymentSetupDelegate *)self targetDevice];
  [v5 peerPaymentUnregisterWithCompletion:v4];
}

- (id)peerPaymentWebService
{
  id v2 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  id v3 = [v2 peerPaymentWebService];

  return v3;
}

- (id)peerPaymentAccount
{
  id v2 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  id v3 = [v2 peerPaymentAccount];

  return v3;
}

- (id)_defaultPaymentPassIdentifier
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_16C24;
  id v15 = sub_16C34;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_18374;
  v8[3] = &unk_2D098;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 defaultCardUniqueID:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (BOOL)_canAddPaymentPass
{
  BOOL v4 = (PKEnableDynamicSEAllocation() & 1) != 0
    || (unint64_t v3 = NPKMaxPaymentCards()) == 0
    || [(NPKPassbookPaymentSetupDelegate *)self _numberOfPaymentPasses] < v3;
  id v5 = [(NPKPassbookPaymentSetupDelegate *)self webService];
  id v6 = (char *)[v5 paymentSetupSupportedInRegion];

  return v6 != (unsigned char *)&dword_0 + 2 && v4;
}

- (unint64_t)_numberOfPaymentPasses
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(NPKPassbookPaymentSetupDelegate *)self companionAgentConnection];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_18520;
  v5[3] = &unk_2D250;
  v5[4] = &v6;
  [v2 paymentPassUniqueIDsSynchronous:1 excludingDeactivated:1 reply:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NPKCompanionAgentConnection)companionAgentConnection
{
  return self->_companionAgentConnection;
}

- (NSMutableDictionary)deleteStatusHandlers
{
  return self->_deleteStatusHandlers;
}

- (void)setDeleteStatusHandlers:(id)a3
{
}

- (NSMutableSet)deletionInProgressPasses
{
  return self->_deletionInProgressPasses;
}

- (void)setDeletionInProgressPasses:(id)a3
{
}

- (BOOL)lastProvidedCanAddPaymentPass
{
  return self->_lastProvidedCanAddPaymentPass;
}

- (void)setLastProvidedCanAddPaymentPass:(BOOL)a3
{
  self->_lastProvidedCanAddPaymentPass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletionInProgressPasses, 0);
  objc_storeStrong((id *)&self->_deleteStatusHandlers, 0);

  objc_storeStrong((id *)&self->_companionAgentConnection, 0);
}

@end