id sub_4E64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

void sub_57A4()
{
  v0 = +[PSListController appearance];
  v1 = [v0 textColor];

  v2 = +[PSListController appearance];
  v3 = [v2 altTextColor];

  v4 = +[PSListController appearance];
  v5 = [v4 footerHyperlinkColor];

  v6 = +[PSListController appearance];
  v7 = [v6 cellAccessoryColor];

  v8 = +[PKTableViewCell appearance];
  [v8 setCheckmarkAccessoryColor:v5];

  v9 = +[PKTableViewCell appearance];
  [v9 setCustomAccessoryColor:v7];

  v10 = +[PKPaymentTransactionTableCell appearance];
  [v10 setPrimaryColor:v1];

  v11 = +[PKPaymentTransactionTableCell appearance];
  [v11 setSecondaryColor:v3];

  v12 = +[PKLinkedAppView appearance];
  [v12 setMainLabelColor:v1];

  v13 = +[PKLinkedAppView appearance];
  [v13 setSubTextLabelColor:v3];

  uint64_t v21 = objc_opt_class();
  v14 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = +[UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:v14];
  [v15 setColor:v1];

  uint64_t v20 = objc_opt_class();
  v16 = +[NSArray arrayWithObjects:&v20 count:1];
  v17 = +[UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:v16];
  [v17 setColor:v1];

  v18 = +[PKSoftwareUpdateTableView appearance];
  [v18 setLinkColor:v5];

  v19 = +[PKSoftwareUpdateTableView appearance];
  [v19 setTextColor:v1];
}

void sub_6B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_6BBC(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = [WeakRetained settingsController];
    [v4 addCardTapped];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

id sub_6C3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupPendingTransactionHandlerForPassWithUniqueID:*(void *)(a1 + 40)];
}

void sub_6FB4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) settingsController];
  [v1 refreshPasses];
}

void sub_72EC(uint64_t a1)
{
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: Telling settings controller to refresh passes following reload", v6, 2u);
    }
  }
  v5 = [*(id *)(a1 + 32) settingsController];
  [v5 refreshPasses];
}

uint64_t sub_7A3C(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 40) _handleProvisioningPreflightFinishedWithSuccess:1 displayableError:0];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_7F84(uint64_t a1)
{
  if ([*(id *)(a1 + 32) supportsBarcodePayment])
  {
    v2 = pk_Payment_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      v4 = pk_Payment_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = [*(id *)(a1 + 32) uniqueID];
        int v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: Presenting barcodePayment pass %@. Checking if there are existing pending transactions.", (uint8_t *)&v8, 0xCu);
      }
    }
    v6 = *(void **)(a1 + 40);
    v7 = [*(id *)(a1 + 32) uniqueID];
    [v6 _setupPendingTransactionHandlerForPassWithUniqueID:v7];
  }
}

uint64_t sub_84DC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_8750(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_12:
    v11();
    goto LABEL_13;
  }
  int v8 = [v6 domain];
  uint64_t v9 = AKAppleIDAuthenticationErrorDomain;
  if ([v8 isEqual:AKAppleIDAuthenticationErrorDomain])
  {
    id v10 = [v7 code];

    if (v10 == (id)-7003) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  v12 = [v7 domain];
  if (![v12 isEqual:v9])
  {

    goto LABEL_11;
  }
  id v13 = [v7 code];

  if (v13 != (id)-7005)
  {
LABEL_11:
    v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_12;
  }
  v14 = PKLocalizedPaymentString(@"COULD_NOT_CONNECT_TITLE");
  v15 = PKLocalizedPaymentString(@"COULD_NOT_CONNECT_MESSAGE");
  v16 = +[UIAlertController alertControllerWithTitle:v14 message:v15 preferredStyle:1];
  v17 = PKLocalizedString(@"OK_BUTTON_TITLE");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_8970;
  v19[3] = &unk_2C7B0;
  id v20 = *(id *)(a1 + 40);
  v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:v19];
  [v16 addAction:v18];

  [*(id *)(a1 + 32) presentViewController:v16 animated:0 completion:0];
LABEL_13:
}

uint64_t sub_8970(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_8D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_8D40(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundPreflightingTaskIdentifier];
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v2 == v3)
  {
    [*(id *)(a1 + 32) setBackgroundPreflightingTaskIdentifier:UIBackgroundTaskInvalid];
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  v4 = *(void **)(a1 + 40);

  return [v4 endBackgroundTask:v3];
}

void sub_904C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    int v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v13 = a2;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Notice: reported success %d reported error %@", buf, 0x12u);
    }
  }
  uint64_t v9 = [*(id *)(a1 + 32) paymentSetupDelegate];
  id v10 = [v9 companionAgentConnection];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_91CC;
  v11[3] = &unk_2C6A8;
  v11[4] = *(void *)(a1 + 32);
  [v10 noteProvisioningPreflightCompleteWithSuccess:a2 error:v5 completion:v11];
  [*(id *)(a1 + 32) setPerformingBackgroundPreflight:0];
}

id sub_91CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endPreflightBackgroundTaskIfNecessary];
}

void sub_91D4(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a1 + 32);
  if (a2)
  {
    id v6 = v4;
    uint64_t v5 = PKDisplayableErrorForCommonType();

    id v4 = (id)v5;
  }
  id v7 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_93BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Notice: Bring to foreground error %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v4);
  }
}

void sub_993C(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) provisioningController];
    uint64_t v10 = *(void *)(a1 + 40);
    id v4 = +[NSArray arrayWithObjects:&v10 count:1];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_9AC8;
    v8[3] = &unk_2C8A0;
    uint64_t v5 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    [v3 removeExpressPassesWithUniqueIdentifiers:v4 visibleViewController:v5 completion:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = +[NSError errorWithDomain:NPKErrorDomain code:-1005 userInfo:0];
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

void sub_9AC8(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = +[NSError errorWithDomain:NPKErrorDomain code:-1000 userInfo:0];
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_9F68(uint64_t a1)
{
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassbookBridgeSettingsController: user accepted disabling express mode for conflicting pass with unique ID %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_A04C(uint64_t a1)
{
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKPassbookBridgeSettingsController: user rejected disabling express mode for conflicting pass with unique ID %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_A658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A67C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = pk_Payment_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      int v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v21 = v14;
        __int16 v22 = 2112;
        id v23 = v8;
        __int16 v24 = 2112;
        id v25 = v9;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Notice: [PendingTransactionHandler] Fetched pending transaction info for pass: %@, transaction: %@, token: %@", buf, 0x20u);
      }
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_A844;
    v15[3] = &unk_2C918;
    id v16 = v8;
    id v17 = WeakRetained;
    id v18 = v7;
    id v19 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

void sub_A844(id *a1)
{
  if (a1[4])
  {
    objc_storeStrong((id *)a1[5] + 3, a1[6]);
    objc_storeStrong((id *)a1[5] + 4, a1[4]);
    objc_storeStrong((id *)a1[5] + 5, a1[7]);
    id v2 = a1[5];
    [v2 _setupLinkedApplication];
  }
  else
  {
    id v3 = [a1[5] delegate];
    [v3 pendingTransactionHandlerDidComplete:a1[5]];
  }
}

void sub_AF04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_AF50(uint64_t a1)
{
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: [PendingTransactionHandler] User confirmed the pending transaction alert.", v17, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v20 = PKAnalyticsSubjectBridge;
    uint64_t v6 = +[NSArray arrayWithObjects:&v20 count:1];
    v18[0] = PKAnalyticsReportEventKey;
    v18[1] = PKAnalyticsReportButtonTagKey;
    uint64_t v7 = *(void *)(a1 + 32);
    v19[0] = PKAnalyticsReportEventTypeButtonTap;
    v19[1] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    +[PKAnalyticsReporter subjects:v6 sendEvent:v8];

    if (*(unsigned char *)(a1 + 48))
    {
      id v9 = [WeakRetained transaction];
      uint64_t v10 = [WeakRetained pass];
      v11 = [WeakRetained appLaunchToken];
      BOOL v12 = +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:v9 excludeTransactionIdentifier:0 pass:v10 pathSuffix:@"/authenticate" appLaunchToken:v11];
    }
    else
    {
      BOOL v12 = 0;
    }
    int v13 = [WeakRetained delegate];
    uint64_t v14 = [v13 presentingViewControllerForPendingTransactionHandler:WeakRetained];

    id v15 = [WeakRetained linkedApplication];
    [v15 openApplication:v14 withLaunchOptions:0 launchURL:v12];

    id v16 = [WeakRetained delegate];
    [v16 pendingTransactionHandlerDidComplete:WeakRetained];
  }
}

void sub_B1B0(uint64_t a1)
{
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: [PendingTransactionHandler] User canceled the pending transaction alert.", v9, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v12 = PKAnalyticsSubjectBridge;
    uint64_t v6 = +[NSArray arrayWithObjects:&v12 count:1];
    v10[0] = PKAnalyticsReportEventKey;
    v10[1] = PKAnalyticsReportButtonTagKey;
    v11[0] = PKAnalyticsReportEventTypeButtonTap;
    v11[1] = PKAnalyticsReportApplicationRedirectCancelButtonTag;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    +[PKAnalyticsReporter subjects:v6 sendEvent:v7];

    id v8 = [WeakRetained delegate];
    [v8 pendingTransactionHandlerDidComplete:WeakRetained];
  }
}

void sub_B344(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) companionAgentConnection];
  id v2 = [*(id *)(a1 + 32) pass];
  BOOL v3 = [v2 uniqueID];
  [v4 markPendingTransactionAsProcessedForPassWithUniqueID:v3];
}

void sub_B70C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingExpressPassesConfigurations];

  if (v2)
  {
    BOOL v3 = pk_Payment_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      uint64_t v5 = pk_Payment_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        int v7 = 138412290;
        uint64_t v8 = v6;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Notice: Received %@. Clearing any pending pendingExpressPassesConfiguration.", (uint8_t *)&v7, 0xCu);
      }
    }
    [*(id *)(a1 + 32) setPendingExpressPassesConfigurations:0];
  }
}

void sub_B958(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_BA04;
  v6[3] = &unk_2C9B8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

uint64_t sub_BA04(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void sub_BEBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    uint64_t v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: finish delete transaction with identifier:%@ error:%@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t sub_C238(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_C570(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_C680(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_C7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_C7E8(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([v5 paymentNetworkIdentifier] == (char *)&stru_20.flags + 3
    || [v5 paymentNetworkIdentifier] == (char *)&dword_C + 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

uint64_t sub_CC4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_D2D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_D2F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) _dismissInstructionViewController:WeakRetained];
    id WeakRetained = v5;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, WeakRetained);
  }

  return _objc_release_x1();
}

void sub_D418(uint64_t a1)
{
  id v3 = [objc_alloc((Class)UINavigationController) initWithRootViewController:*(void *)(a1 + 32)];
  id v2 = [v3 navigationBar];
  BPSApplyStyleToNavBar();

  [*(id *)(a1 + 40) presentViewController:v3 animated:1 completion:0];
}

id sub_D7D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSetExpressPassUnlockRequired];
}

id sub_D7DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSetExpressPassError];
}

void sub_DC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_DCC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_DCD0(uint64_t a1)
{
}

void sub_DCD8(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v2 = pk_Payment_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = pk_Payment_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: setExpressWithPassInformation: instruction view controller cancellation handler called", v7, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v5 = [*(id *)(a1 + 32) paymentSetupDelegate];
    uint64_t v6 = [v5 targetDevice];

    [v6 cancelOutstandingSetDefaultExpressPassRequestsWithExpressMode:*(void *)(a1 + 40)];
  }
}

void sub_DDE0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DEB4;
  block[3] = &unk_2CB40;
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = a2;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v9;
  long long v13 = v9;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_DEB4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v2 = pk_Payment_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = pk_Payment_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        int v7 = 138412290;
        uint64_t v8 = v5;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: setExpressWithPassInformation: updated pendingExpressPassesInformation: %@", (uint8_t *)&v7, 0xCu);
      }
    }
    [*(id *)(a1 + 40) setPendingExpressPassesConfigurations:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(void *)(a1 + 72) == 1;
  return [*(id *)(a1 + 40) _handleSetExpressPassResult:*(void *)(a1 + 72) forInstructionViewController:*(void *)(a1 + 48)];
}

void sub_E620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t sub_E65C(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    id v2 = pk_Payment_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = pk_Payment_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: removeExpressPassesWithUniqueIdentifiers: instruction view controller cancellation handler called", v5, 2u);
      }
    }
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void sub_E724(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (!v5 && (a2 & 1) == 0)
    {
      int v7 = pk_Payment_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        long long v9 = pk_Payment_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v13 = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Notice: removeExpressPassWithUniqueIdentifier: updated pendingExpressPassesInformation: %@", buf, 0xCu);
        }
      }
      [*(id *)(a1 + 32) setPendingExpressPassesConfigurations:0];
      id v6 = *(id *)(a1 + 40);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    if (a2) {
      goto LABEL_3;
    }
LABEL_12:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_E8D8;
    block[3] = &unk_2C6A8;
    id v11 = *(id *)(a1 + 48);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    goto LABEL_13;
  }
  if (!a2) {
    goto LABEL_12;
  }
LABEL_3:
  [*(id *)(a1 + 32) _dismissInstructionViewController:*(void *)(a1 + 48)];
LABEL_13:
}

id sub_E8D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSetExpressPassError];
}

uint64_t sub_E8E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_EB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_EBC0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    BOOL v3 = [WeakRetained navigationController];
    id v4 = [v3 presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    id v5 = [*(id *)(a1 + 32) paymentSetupDelegate];
    id v6 = [v5 targetDevice];

    [v6 cancelOutstandingEnableServiceModeRequests];
    id WeakRetained = v7;
  }
}

void sub_EC6C(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_ED14;
  block[3] = &unk_2CC30;
  char v6 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_ED14(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    return [*(id *)(a1 + 32) handleEnableServiceModeUnlockRequired];
  }
  else {
    return [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
  }
}

void sub_F11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(location);
  objc_destroyWeak(&a30);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_F180(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(a1 + 32))
  {
    if (!*(unsigned char *)(v7 + 24))
    {
      *(unsigned char *)(v7 + 24) = 1;
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      goto LABEL_9;
    }
  }
  else if (!*(unsigned char *)(v7 + 24))
  {
    goto LABEL_9;
  }
  BOOL v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    __int16 v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Warning: Completion block has already been called, not calling again", v11, 2u);
    }
  }
LABEL_9:
}

void sub_F26C(uint64_t a1)
{
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) uniqueID];
      int v11 = 138412290;
      uint64_t v12 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: User canceled upgrade request for pass with uniqueID:%@", (uint8_t *)&v11, 0xCu);
    }
  }
  id v6 = +[NSError errorWithDomain:NPKErrorDomain code:-1005 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  objc_copyWeak((id *)&v11, (id *)(a1 + 64));
  uint64_t v7 = *(void **)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)&v11);
  [v7 _dismissInstructionViewController:WeakRetained];

  BOOL v9 = [*(id *)(a1 + 40) paymentSetupDelegate];
  __int16 v10 = [v9 targetDevice];
  [v10 cancelOutstandingRemotePassUpdateRequest:*(void *)(a1 + 48) pass:*(void *)(a1 + 32)];

  objc_destroyWeak((id *)&v11);
}

void sub_F3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void sub_F410(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    uint64_t v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [*(id *)(a1 + 32) uniqueID];
      id v16 = NSStringFromNPKRemotePassUpgradeStatus();
      *(_DWORD *)buf = 138413058;
      id v34 = v15;
      __int16 v35 = 2112;
      v36 = v16;
      __int16 v37 = 2112;
      id v38 = v10;
      __int16 v39 = 2112;
      id v40 = v9;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Notice: Received Remote pass upgrade updated for  pass with uniqueID:%@ received, Status:%@ updatedPass:%@ error:%@", buf, 0x2Au);
    }
  }
  objc_copyWeak(&to, (id *)(a1 + 72));
  if (v9)
  {
    id v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    id v25 = sub_F724;
    v26 = &unk_2CCF8;
    id v27 = *(id *)(a1 + 40);
    objc_copyWeak(&v31, &to);
    uint64_t v28 = *(void *)(a1 + 48);
    id v29 = v9;
    id v30 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v23);

    objc_destroyWeak(&v31);
    id v17 = v27;
  }
  else
  {
    id v18 = *(void **)(a1 + 48);
    id v17 = objc_loadWeakRetained(&to);
    [v18 _dismissInstructionViewController:v17];
  }

  if (((a5 != 2) & ~(v9 != 0)) == 0)
  {
    if (*(void *)(a1 + 56))
    {
      (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v9, v10, v19);
      if (v11)
      {
        uint64_t v20 = pk_Payment_log();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

        if (v21)
        {
          __int16 v22 = pk_Payment_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v11;
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Notice: passUpgradeWithRequest: updated pendingExpressPassesInformation: %@", buf, 0xCu);
          }
        }
        objc_msgSend(*(id *)(a1 + 48), "setPendingExpressPassesConfigurations:", v11, v23, v24, v25, v26);
      }
    }
  }
  objc_destroyWeak(&to);
}

void sub_F704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_F724(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  BOOL v3 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v7 = [v6 navigationController];
    uint64_t v8 = [v7 presentationController];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = objc_loadWeakRetained((id *)(a1 + 64));
      id v11 = [v10 navigationController];
      unsigned __int8 v12 = [v11 isBeingDismissed];

      if ((v12 & 1) == 0)
      {
        id v13 = objc_loadWeakRetained((id *)(a1 + 64));
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_FBC8;
        v40[3] = &unk_2CCD0;
        v40[4] = *(void *)(a1 + 40);
        objc_copyWeak(&v41, (id *)(a1 + 64));
        uint64_t v14 = objc_retainBlock(v40);
        objc_destroyWeak(&v41);
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v13 = v2;
  uint64_t v14 = 0;
LABEL_7:
  uint64_t v15 = [*(id *)(a1 + 48) domain];
  unsigned int v16 = [v15 isEqualToString:NPKErrorDomain];

  id v17 = *(void **)(a1 + 48);
  if (v16)
  {
    id v18 = [v17 code];
    if (v18 == (id)-1005)
    {
      uint64_t v28 = *(void **)(a1 + 40);
      uint64_t v19 = objc_loadWeakRetained(v3);
      [v28 _dismissInstructionViewController:v19];
      goto LABEL_27;
    }
    if (v18 == (id)-1001)
    {
      __int16 v39 = *(void **)(a1 + 40);
      uint64_t v19 = +[NSBundle bundleForClass:objc_opt_class()];
      id v29 = [v19 localizedStringForKey:@"GIZMO_UNREACHABLE_ALERT_TITLE" value:&stru_2D2E8 table:@"NanoPassKit"];
      id v30 = +[NSBundle bundleForClass:objc_opt_class()];
      id v31 = [v30 localizedStringForKey:@"GIZMO_UNREACHABLE_ALERT_MESSAGE" value:&stru_2D2E8 table:@"NanoPassKit"];
      v32 = [*(id *)(a1 + 40) _errorAcknowledgeButtonTitle];
      [v39 _presentErrorWithTitle:v29 message:v31 acknowledgeButtonTitle:v32 visibleViewController:v13 dismissBlock:v14];

      goto LABEL_27;
    }
    if (v18 == (id)-1004)
    {
      uint64_t v19 = objc_loadWeakRetained((id *)(a1 + 64));
      [v19 handleSetExpressPassUnlockRequired];
      goto LABEL_27;
    }
    uint64_t v33 = pk_General_log();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

    if (v34)
    {
      __int16 v35 = pk_General_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v36;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "Notice: remote pass upgraded received unknown error: %@", buf, 0xCu);
      }
    }
    __int16 v22 = *(void **)(a1 + 40);
    uint64_t v19 = [v22 _errorSetExpressModeTitle];
    uint64_t v23 = [*(id *)(a1 + 40) _errorSetExpressModeMessageWithPass:*(void *)(a1 + 56)];
LABEL_26:
    __int16 v37 = (void *)v23;
    id v38 = [*(id *)(a1 + 40) _errorAcknowledgeButtonTitle];
    [v22 _presentErrorWithTitle:v19 message:v37 acknowledgeButtonTitle:v38 visibleViewController:v13 dismissBlock:v14];

    goto LABEL_27;
  }
  uint64_t v20 = [v17 domain];
  unsigned int v21 = [v20 isEqualToString:NSURLErrorDomain];

  if (v21)
  {
    __int16 v22 = *(void **)(a1 + 40);
    uint64_t v19 = PKLocalizedPaymentString(@"COULD_NOT_CONNECT_TITLE");
    uint64_t v23 = PKLocalizedPaymentString(@"COULD_NOT_CONNECT_MESSAGE");
    goto LABEL_26;
  }
  uint64_t v24 = pk_General_log();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  if (v25)
  {
    v26 = pk_General_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v27;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Notice: remote pass upgraded received unknown error: %@", buf, 0xCu);
    }
  }
  uint64_t v19 = objc_loadWeakRetained((id *)(a1 + 64));
  [v19 handleSetExpressPassError];
LABEL_27:
}

void sub_FBC8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 _dismissInstructionViewController:WeakRetained];
}

void sub_101FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Telling delegate %@ about %@ transaction service", (uint8_t *)&v8, 0x16u);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 40) didEnableTransactionService:*(unsigned __int8 *)(a1 + 48)];
  }
}

void sub_10478(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Telling delegate %@ about received transaction", (uint8_t *)&v7, 0xCu);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v3 transactionSourceIdentifier:*(void *)(a1 + 32) didReceiveTransaction:*(void *)(a1 + 40)];
  }
}

void sub_106E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Telling delegate %@ about removed transaction", (uint8_t *)&v7, 0xCu);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v3 transactionSourceIdentifier:*(void *)(a1 + 32) didRemoveTransactionWithIdentifier:*(void *)(a1 + 40)];
  }
}

void sub_10948(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [*(id *)(a1 + 32) displayableTransitBalance];
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Telling delegate %@ about transit pass properties with balance %@", (uint8_t *)&v8, 0x16u);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 40) didUpdateWithTransitPassProperties:*(void *)(a1 + 32)];
  }
}

void sub_10BD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Telling delegate %@ about balances", (uint8_t *)&v7, 0xCu);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didReceiveBalanceUpdate:*(void *)(a1 + 40)];
  }
}

void sub_10E64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Telling delegate %@ about balance reminder", (uint8_t *)&v11, 0xCu);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 48) identifiers];
    __int16 v10 = [v9 anyObject];
    [v3 paymentPassWithUniqueIdentifier:v7 didUpdateBalanceReminder:v8 forBalanceWithIdentifier:v10];
  }
}

void sub_111C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Notice: Telling delegate %@ about updated shares", (uint8_t *)&v7, 0xCu);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v3 sharesDidUpdateWithPaymentPassWithUniqueIdentifier:*(void *)(a1 + 32)];
  }
}

void sub_11410(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didEnableMessageService:*(unsigned __int8 *)(a1 + 40)];
  }
}

uint64_t sub_1157C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (a2)
  {
    if (!v7) {
      goto LABEL_7;
    }
    id v11 = v5;
    id v8 = [objc_alloc((Class)PKPaymentSetupNavigationController) initWithProvisioningController:*(void *)(a1 + 32) context:4];
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    id v11 = v5;
    id v8 = [*(id *)(a1 + 32) alertForDisplayableError:v5];
    id v9 = *(void (**)(void))(v7 + 16);
  }
  v9();

  id v6 = v11;
LABEL_7:

  return _objc_release_x1(v5, v6);
}

uint64_t sub_11808(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (a2)
  {
    if (!v7) {
      goto LABEL_7;
    }
    id v11 = v5;
    id v8 = [objc_alloc((Class)PKPaymentSetupNavigationController) initWithProvisioningController:*(void *)(a1 + 32) context:4];
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    id v11 = v5;
    id v8 = [*(id *)(a1 + 32) alertForDisplayableError:v5];
    id v9 = *(void (**)(void))(v7 + 16);
  }
  v9();

  id v6 = v11;
LABEL_7:

  return _objc_release_x1(v5, v6);
}

id sub_11B74(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentSetupSupportedInRegion];
}

uint64_t sub_11DB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_12378(void *a1)
{
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Notice: dismissed error with title%@ message:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_12E08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_12E2C(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    id v5 = WeakRetained;
    [WeakRetained _setCurrentScreen:v4];
    id WeakRetained = v5;
  }
}

id sub_12E88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCurrentScreen:1];
}

void sub_12F54(uint64_t a1)
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Restricting settings to shield", v4, 2u);
  }

  [*(id *)(a1 + 32) _setCurrentScreen:3];
  BOOL v3 = +[UIApplication sharedApplication];
  [v3 _updateSnapshotForBackgroundApplication:1];
}

void sub_13B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_14190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_141B0(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  NPKGuaranteeMainThread();
  objc_destroyWeak(&v1);
}

void sub_14238(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1424C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endPasscodeChangeWithPasscodeChanged:0 error:0];
}

void sub_14338(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_14354(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v5;
  char v8 = a2;
  NPKGuaranteeMainThread();

  objc_destroyWeak(&v7);
}

void sub_14410(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_14424(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "_endPasscodeChangeWithPasscodeChanged:error:", 0);
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    BOOL v3 = [WeakRetained instructionViewController];
    [v3 handleChangePasscodeUnlockRequired];
  }
  else
  {
    [WeakRetained _startPasscodeChange];
  }
}

uint64_t sub_14584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a5);
  }
  return result;
}

void sub_146A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_146C8(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    char v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      __int16 v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543874;
      unsigned int v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = a2;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Completed passcode prompt with passcodeChanged: %ld error: %@", buf, 0x20u);
    }
  }
  objc_copyWeak(&v13, (id *)(a1 + 32));
  char v14 = a2;
  id v12 = v5;
  NPKGuaranteeMainThread();

  objc_destroyWeak(&v13);
}

void sub_14868(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_14884(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _endPasscodeChangeWithPasscodeChanged:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

void sub_14A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_14A90(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  id v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    char v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      __int16 v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      int v12 = 138543874;
      id v13 = v11;
      __int16 v14 = 2048;
      uint64_t v15 = a2;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Cancelled passcode prompt with passcodeChanged: %ld error: %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

void sub_14F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_14F44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained pendingAction] == (char *)&dword_0 + 2) {
    [WeakRetained _endPasscodeChangeWithPasscodeChanged:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
  }
  [WeakRetained _finishRemoteAction:*(unsigned __int8 *)(a1 + 48)];
}

Class sub_15548(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_35DB8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_1568C;
    v3[4] = &unk_2CF88;
    v3[5] = v3;
    long long v4 = off_2CF70;
    uint64_t v5 = 0;
    qword_35DB8 = _sl_dlopen();
    if (!qword_35DB8)
    {
      abort_report_np();
LABEL_8:
      sub_19AEC();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("PUConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_35DB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1568C()
{
  uint64_t result = _sl_dlopen();
  qword_35DB8 = result;
  return result;
}

void sub_15754(id a1)
{
  id v1 = objc_alloc_init(NPKPassbookPaymentSetupDelegate);
  uint64_t v2 = qword_35DC0;
  qword_35DC0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_16198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_161C4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_162B4;
  v8[3] = &unk_2CFD0;
  char v14 = a2;
  id v9 = *(id *)(a1 + 32);
  id v10 = v5;
  id v6 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  BOOL v7 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v13);
}

id sub_162B4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  BOOL v3 = pk_Payment_log();
  long long v4 = v3;
  if (v2)
  {
    BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (!v5) {
      goto LABEL_10;
    }
    id v6 = pk_Payment_log();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    BOOL v7 = [*(id *)(a1 + 32) uniqueID];
    *(_DWORD *)id v17 = 138412290;
    *(void *)&v17[4] = v7;
    char v8 = "Notice: Remove payment pass %@ successful";
    id v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 12;
    goto LABEL_8;
  }
  BOOL v12 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (!v12) {
    goto LABEL_10;
  }
  id v6 = pk_Payment_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    BOOL v7 = [*(id *)(a1 + 32) uniqueID];
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)id v17 = 138412546;
    *(void *)&v17[4] = v7;
    *(_WORD *)&v17[12] = 2112;
    *(void *)&v17[14] = v13;
    char v8 = "Error: Remove payment pass %@ failed: %@";
    id v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 22;
LABEL_8:
    _os_log_impl(&dword_0, v9, v10, v8, v17, v11);
  }
LABEL_9:

LABEL_10:
  if (*(unsigned char *)(a1 + 72))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v15 = [WeakRetained popViewControllerAnimated:1];
  }
  return objc_msgSend(*(id *)(a1 + 48), "_setDeletionInProgress:forPassWithUniqueID:", 0, *(void *)(a1 + 56), *(_OWORD *)v17, *(void *)&v17[16]);
}

void sub_16744(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_167D4;
  v4[3] = &unk_2D020;
  BOOL v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 enumerateObjectsUsingBlock:v4];
}

void sub_167D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [*(id *)(a1 + 32) passWithUniqueID:v3];
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
  else
  {
    id v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      BOOL v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Error: nil payment pass retrieved from NPKCompanionAgent for unique ID %@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

void sub_16C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_16C24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_16C34(uint64_t a1)
{
}

void sub_16C3C(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  long long v4 = NPKPairedDeviceSecureElementIdentifiers();
  if (v4) {
    NPKIdentifyDevicePaymentApplicationsForPass();
  }
}

void sub_16E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_16E20(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_16FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_16FE4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_17130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_17148(uint64_t a1, void *a2)
{
  id result = [a2 containsObject:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

intptr_t sub_173BC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_174B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_174C8(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_175D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_175EC(uint64_t a1, void *a2)
{
}

void sub_177C0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v24 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    uint32_t v11 = [*(id *)(a1 + 32) peerPaymentWebService];
    [v11 setContext:v9];

    BOOL v12 = [*(id *)(a1 + 32) peerPaymentWebService];
    uint64_t v13 = [v12 archiver];
    [v13 archiveContext:v9];
  }
  if (v10)
  {
    char v14 = [*(id *)(a1 + 32) companionAgentConnection];
    id v15 = NPKPairedOrPairingDevice();
    [v14 setPeerPaymentAccount:v10 forDevice:v15];
  }
  if (v24)
  {
    __int16 v16 = [v24 domain];
    unsigned int v17 = [v16 isEqualToString:NPKErrorDomain];

    if (v17)
    {
      uint64_t v18 = +[NSBundle bundleForClass:objc_opt_class()];
      __int16 v19 = [v18 localizedStringForKey:@"GIZMO_UNREACHABLE_ALERT_TITLE" value:&stru_2D2E8 table:@"NanoPassKit"];
      id v20 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v21 = [v20 localizedStringForKey:@"GIZMO_UNREACHABLE_ALERT_MESSAGE" value:&stru_2D2E8 table:@"NanoPassKit"];
      uint64_t v22 = PKDisplayableErrorCustom();

      id v24 = (id)v22;
    }
  }
  else
  {
    id v24 = 0;
  }
  uint64_t v23 = *(void *)(a1 + 40);
  if (v23) {
    (*(void (**)(uint64_t, uint64_t, id))(v23 + 16))(v23, a2, v24);
  }
}

void sub_179E8(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_17D4C;
  v31[3] = &unk_2D1B0;
  id v35 = *(id *)(a1 + 40);
  char v36 = a2;
  id v12 = v9;
  id v32 = v12;
  id v13 = v10;
  id v33 = v13;
  id v14 = v11;
  id v34 = v14;
  id v15 = objc_retainBlock(v31);
  __int16 v16 = (void (**)(void))v15;
  if (a2)
  {
    unsigned int v17 = [v14 associatedPassUniqueID];
    if (v17
      && (uint64_t v18 = *(void **)(a1 + 32),
          [v14 associatedPassUniqueID],
          __int16 v19 = objc_claimAutoreleasedReturnValue(),
          [v18 passWithUniqueID:v19],
          id v20 = objc_claimAutoreleasedReturnValue(),
          v19,
          v20))
    {
      unsigned int v21 = pk_Payment_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        uint64_t v23 = pk_Payment_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v24 = "Notice: Peer payment pass already downloaded";
LABEL_17:
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
          goto LABEL_18;
        }
        goto LABEL_18;
      }
    }
    else
    {
      id v20 = [v14 associatedPassURL];
      BOOL v25 = pk_Payment_log();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

      if (v20)
      {
        if (v26)
        {
          uint64_t v27 = pk_Payment_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v17;
            _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Notice: Do not yet have peer payment pass with unique ID %@. Attempting to download it now…", buf, 0xCu);
          }
        }
        uint64_t v28 = [*(id *)(a1 + 32) webService];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_17D68;
        v29[3] = &unk_2C788;
        id v30 = v16;
        +[NPKPeerPaymentWebServiceCompanionTargetDevice attemptToDownloadPeerPaymentPassAtURL:v20 withWebService:v28 completion:v29];

        goto LABEL_20;
      }
      if (v26)
      {
        uint64_t v23 = pk_Payment_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v24 = "Warning: Do not yet have peer payment pass, but no URL to download!";
          goto LABEL_17;
        }
LABEL_18:
      }
    }
    v16[2](v16);
LABEL_20:

    goto LABEL_21;
  }
  ((void (*)(void *))v15[2])(v15);
LABEL_21:
}

uint64_t sub_17D4C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t sub_17D68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_17F04(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) context];
  id v4 = [v2 npkPossiblyOverriddenPeerPaymentServiceURL];

  id v3 = [*(id *)(a1 + 40) targetDevice];
  [v3 peerPaymentRegisterWithURL:v4 forceReRegistration:0 completion:*(void *)(a1 + 48)];
}

void sub_17F84(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5 || !a2)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, void, id, void, void))(v7 + 16))(v7, 0, v5, 0, 0);
    }
  }
  else if ([*(id *)(a1 + 32) needsRegistration])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1808C;
    v8[3] = &unk_2D200;
    BOOL v6 = *(void **)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    [v6 registerDevice:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_1808C(uint64_t a1, int a2, void *a3)
{
  if (a3 || !a2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return _objc_release_x2();
}

void sub_1835C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18374(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_18508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_18520(uint64_t a1, void *a2)
{
  id result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_18B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_18DE4(uint64_t a1)
{
  sub_18E3C();
  Class result = objc_getClass("MCProfileConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_19B38();
  }
  qword_35DD0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_18E3C()
{
  v3[0] = 0;
  if (!qword_35DD8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_18F3C;
    v3[4] = &unk_2CF88;
    v3[5] = v3;
    long long v4 = off_2D270;
    uint64_t v5 = 0;
    qword_35DD8 = _sl_dlopen();
  }
  uint64_t v0 = qword_35DD8;
  id v1 = (void *)v3[0];
  if (!qword_35DD8)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_18F3C()
{
  uint64_t result = _sl_dlopen();
  qword_35DD8 = result;
  return result;
}

void *sub_18FB0(uint64_t a1)
{
  int v2 = (void *)sub_18E3C();
  uint64_t result = dlsym(v2, "MCFeatureMinimumPasscodeLength");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_35DE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_191C0(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2)
  {
    CFStringRef v4 = @"EXPRESS_TRANSIT";
    if (a2 == 3) {
      CFStringRef v4 = @"EXPRESS_ACCESS";
    }
    if (a2 == 4) {
      CFStringRef v4 = @"EXPRESS_ACCESS";
    }
  }
  else
  {
    uint64_t v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      uint64_t v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v11 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Warning: Received unexpected payment card type: %ld; deferring to access pass copy.",
          buf,
          0xCu);
      }
    }
    CFStringRef v4 = @"EXPRESS_ACCESS";
  }
  int v8 = +[NSString stringWithFormat:@"%@_%@", v4, v3];

  return v8;
}

void sub_19AEC()
{
  uint64_t v0 = abort_report_np();
  sub_19B14(v0);
}

void sub_19B14()
{
}

void sub_19B38()
{
}

uint64_t BPSApplyStyleToNavBar()
{
  return _BPSApplyStyleToNavBar();
}

uint64_t BPSSetupBackgroundColor()
{
  return _BPSSetupBackgroundColor();
}

uint64_t BPSTextColor()
{
  return _BPSTextColor();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

uint64_t NPKDeviceClassFromDevice()
{
  return _NPKDeviceClassFromDevice();
}

uint64_t NPKDeviceOSVersionRequirementFromDevice()
{
  return _NPKDeviceOSVersionRequirementFromDevice();
}

uint64_t NPKGuaranteeMainThread()
{
  return _NPKGuaranteeMainThread();
}

uint64_t NPKIdentifyDevicePaymentApplicationsForPass()
{
  return _NPKIdentifyDevicePaymentApplicationsForPass();
}

uint64_t NPKIsPairedDeviceStandalone()
{
  return _NPKIsPairedDeviceStandalone();
}

uint64_t NPKMaxPaymentCards()
{
  return _NPKMaxPaymentCards();
}

uint64_t NPKNotificationForExpressPassConfigurationChange()
{
  return _NPKNotificationForExpressPassConfigurationChange();
}

uint64_t NPKNotificationForExpressPassesInformationChange()
{
  return _NPKNotificationForExpressPassesInformationChange();
}

uint64_t NPKNotificationForSyncedSettingsChange()
{
  return _NPKNotificationForSyncedSettingsChange();
}

uint64_t NPKPairedDeviceCurrentExpressPassConfiguration()
{
  return _NPKPairedDeviceCurrentExpressPassConfiguration();
}

uint64_t NPKPairedDeviceExpressPassConfigurationWithCardType()
{
  return _NPKPairedDeviceExpressPassConfigurationWithCardType();
}

uint64_t NPKPairedDeviceSecureElementIdentifiers()
{
  return _NPKPairedDeviceSecureElementIdentifiers();
}

uint64_t NPKPairedOrPairingDevice()
{
  return _NPKPairedOrPairingDevice();
}

uint64_t NPKPairedOrPairingDeviceIsTinker()
{
  return _NPKPairedOrPairingDeviceIsTinker();
}

uint64_t NPKPairedOrPairingDeviceSupportsCredentialType()
{
  return _NPKPairedOrPairingDeviceSupportsCredentialType();
}

uint64_t NPKShouldAllowPeerPaymentRegistrationForWebService()
{
  return _NPKShouldAllowPeerPaymentRegistrationForWebService();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromNPKRemotePassUpgradeStatus()
{
  return _NSStringFromNPKRemotePassUpgradeStatus();
}

uint64_t PKDisplayableErrorCustom()
{
  return _PKDisplayableErrorCustom();
}

uint64_t PKDisplayableErrorForCommonType()
{
  return _PKDisplayableErrorForCommonType();
}

uint64_t PKEnableDynamicSEAllocation()
{
  return _PKEnableDynamicSEAllocation();
}

uint64_t PKGeneratePassUniqueID()
{
  return _PKGeneratePassUniqueID();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
}

uint64_t PKMockPeerPaymentPassPassTypeID()
{
  return _PKMockPeerPaymentPassPassTypeID();
}

uint64_t PKMockPeerPaymentPassSerialNumber()
{
  return _PKMockPeerPaymentPassSerialNumber();
}

uint64_t PKPassbookIsCurrentlyAvailable()
{
  return _PKPassbookIsCurrentlyAvailable();
}

uint64_t PKPeerPaymentServiceOverrideURL()
{
  return _PKPeerPaymentServiceOverrideURL();
}

uint64_t PKUseMockSURFServer()
{
  return _PKUseMockSURFServer();
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NPKAssertAbort()
{
  return __NPKAssertAbort();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PKLocalizedString(NSString *a1)
{
  return PKLocalizedString(a1);
}

uint64_t PKLocalizedAquamanString(NSString *a1)
{
  return PKLocalizedAquamanString(a1);
}

uint64_t PKLocalizedAquamanString(NSString *a1, NSString *a2, ...)
{
  return PKLocalizedAquamanString(a1, a2);
}

uint64_t PKLocalizedPaymentString(NSString *a1)
{
  return PKLocalizedPaymentString(a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t pk_General_log()
{
  return _pk_General_log();
}

uint64_t pk_Payment_log()
{
  return _pk_Payment_log();
}

id objc_msgSend__canAddPaymentPass(void *a1, const char *a2, ...)
{
  return [a1 _canAddPaymentPass];
}

id objc_msgSend__cancelRemoteAction(void *a1, const char *a2, ...)
{
  return [a1 _cancelRemoteAction];
}

id objc_msgSend__deviceInRestrictedMode(void *a1, const char *a2, ...)
{
  return [a1 _deviceInRestrictedMode];
}

id objc_msgSend__errorAcknowledgeButtonTitle(void *a1, const char *a2, ...)
{
  return [a1 _errorAcknowledgeButtonTitle];
}

id objc_msgSend__errorMessage(void *a1, const char *a2, ...)
{
  return [a1 _errorMessage];
}

id objc_msgSend__errorSetExpressModeTitle(void *a1, const char *a2, ...)
{
  return [a1 _errorSetExpressModeTitle];
}

id objc_msgSend__errorTitle(void *a1, const char *a2, ...)
{
  return [a1 _errorTitle];
}

id objc_msgSend__instructionMessage(void *a1, const char *a2, ...)
{
  return [a1 _instructionMessage];
}

id objc_msgSend__instructionTitle(void *a1, const char *a2, ...)
{
  return [a1 _instructionTitle];
}

id objc_msgSend__loadCurrentScreen(void *a1, const char *a2, ...)
{
  return [a1 _loadCurrentScreen];
}

id objc_msgSend__numberOfPaymentPasses(void *a1, const char *a2, ...)
{
  return [a1 _numberOfPaymentPasses];
}

id objc_msgSend__remoteLibrary(void *a1, const char *a2, ...)
{
  return [a1 _remoteLibrary];
}

id objc_msgSend__shouldPresentOrPushViewController(void *a1, const char *a2, ...)
{
  return [a1 _shouldPresentOrPushViewController];
}

id objc_msgSend__shouldUsePasscodeConnection(void *a1, const char *a2, ...)
{
  return [a1 _shouldUsePasscodeConnection];
}

id objc_msgSend__startPasscodeChange(void *a1, const char *a2, ...)
{
  return [a1 _startPasscodeChange];
}

id objc_msgSend__startPreflightBackgroundTaskIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _startPreflightBackgroundTaskIfNecessary];
}

id objc_msgSend__tellGizmoToPromptForPasscodeChange(void *a1, const char *a2, ...)
{
  return [a1 _tellGizmoToPromptForPasscodeChange];
}

id objc_msgSend__unlockRequiredMessage(void *a1, const char *a2, ...)
{
  return [a1 _unlockRequiredMessage];
}

id objc_msgSend__unlockRequiredTitle(void *a1, const char *a2, ...)
{
  return [a1 _unlockRequiredTitle];
}

id objc_msgSend_aaAlternateDSID(void *a1, const char *a2, ...)
{
  return [a1 aaAlternateDSID];
}

id objc_msgSend_activityIndicatorView(void *a1, const char *a2, ...)
{
  return [a1 activityIndicatorView];
}

id objc_msgSend_addCardTapped(void *a1, const char *a2, ...)
{
  return [a1 addCardTapped];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_altTextColor(void *a1, const char *a2, ...)
{
  return [a1 altTextColor];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appLaunchToken(void *a1, const char *a2, ...)
{
  return [a1 appLaunchToken];
}

id objc_msgSend_appProtectionCoordinator(void *a1, const char *a2, ...)
{
  return [a1 appProtectionCoordinator];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_applicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleIdentifier];
}

id objc_msgSend_applicationDidBecomeActive(void *a1, const char *a2, ...)
{
  return [a1 applicationDidBecomeActive];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_archiver(void *a1, const char *a2, ...)
{
  return [a1 archiver];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_associatedPassURL(void *a1, const char *a2, ...)
{
  return [a1 associatedPassURL];
}

id objc_msgSend_associatedPassUniqueID(void *a1, const char *a2, ...)
{
  return [a1 associatedPassUniqueID];
}

id objc_msgSend_backgroundPreflightingTaskIdentifier(void *a1, const char *a2, ...)
{
  return [a1 backgroundPreflightingTaskIdentifier];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_beginShowingViewController(void *a1, const char *a2, ...)
{
  return [a1 beginShowingViewController];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_buttonTextColor(void *a1, const char *a2, ...)
{
  return [a1 buttonTextColor];
}

id objc_msgSend_cancelOutstandingEnableServiceModeRequests(void *a1, const char *a2, ...)
{
  return [a1 cancelOutstandingEnableServiceModeRequests];
}

id objc_msgSend_cancellationHandler(void *a1, const char *a2, ...)
{
  return [a1 cancellationHandler];
}

id objc_msgSend_cardName(void *a1, const char *a2, ...)
{
  return [a1 cardName];
}

id objc_msgSend_cardType(void *a1, const char *a2, ...)
{
  return [a1 cardType];
}

id objc_msgSend_cellAccessoryColor(void *a1, const char *a2, ...)
{
  return [a1 cellAccessoryColor];
}

id objc_msgSend_cellHighlightColor(void *a1, const char *a2, ...)
{
  return [a1 cellHighlightColor];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_companionAgentConnection(void *a1, const char *a2, ...)
{
  return [a1 companionAgentConnection];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currencyAmount(void *a1, const char *a2, ...)
{
  return [a1 currencyAmount];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentScreen(void *a1, const char *a2, ...)
{
  return [a1 currentScreen];
}

id objc_msgSend_darkTextColor(void *a1, const char *a2, ...)
{
  return [a1 darkTextColor];
}

id objc_msgSend_dataProviderDelegates(void *a1, const char *a2, ...)
{
  return [a1 dataProviderDelegates];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultPaymentPassIdentifier(void *a1, const char *a2, ...)
{
  return [a1 defaultPaymentPassIdentifier];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteStatusHandlers(void *a1, const char *a2, ...)
{
  return [a1 deleteStatusHandlers];
}

id objc_msgSend_deletionInProgressPasses(void *a1, const char *a2, ...)
{
  return [a1 deletionInProgressPasses];
}

id objc_msgSend_devSigned(void *a1, const char *a2, ...)
{
  return [a1 devSigned];
}

id objc_msgSend_deviceInAppPaymentApplications(void *a1, const char *a2, ...)
{
  return [a1 deviceInAppPaymentApplications];
}

id objc_msgSend_devicePaymentApplications(void *a1, const char *a2, ...)
{
  return [a1 devicePaymentApplications];
}

id objc_msgSend_devicePrimaryPaymentApplication(void *a1, const char *a2, ...)
{
  return [a1 devicePrimaryPaymentApplication];
}

id objc_msgSend_deviceRegion(void *a1, const char *a2, ...)
{
  return [a1 deviceRegion];
}

id objc_msgSend_deviceSupportMultipleExpressPasses(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportMultipleExpressPasses];
}

id objc_msgSend_deviceSupportTransitReminderSetting(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportTransitReminderSetting];
}

id objc_msgSend_deviceSupportsInAppPayments(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsInAppPayments];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayableTransitBalance(void *a1, const char *a2, ...)
{
  return [a1 displayableTransitBalance];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_endedShowingViewController(void *a1, const char *a2, ...)
{
  return [a1 endedShowingViewController];
}

id objc_msgSend_expressMode(void *a1, const char *a2, ...)
{
  return [a1 expressMode];
}

id objc_msgSend_expressPassConfigurations(void *a1, const char *a2, ...)
{
  return [a1 expressPassConfigurations];
}

id objc_msgSend_flowController(void *a1, const char *a2, ...)
{
  return [a1 flowController];
}

id objc_msgSend_footerHyperlinkColor(void *a1, const char *a2, ...)
{
  return [a1 footerHyperlinkColor];
}

id objc_msgSend_formattedStringValue(void *a1, const char *a2, ...)
{
  return [a1 formattedStringValue];
}

id objc_msgSend_groupsController(void *a1, const char *a2, ...)
{
  return [a1 groupsController];
}

id objc_msgSend_handleChangePasscodeUnlockRequired(void *a1, const char *a2, ...)
{
  return [a1 handleChangePasscodeUnlockRequired];
}

id objc_msgSend_handlePendingURL(void *a1, const char *a2, ...)
{
  return [a1 handlePendingURL];
}

id objc_msgSend_handleSetExpressPassError(void *a1, const char *a2, ...)
{
  return [a1 handleSetExpressPassError];
}

id objc_msgSend_handleSetExpressPassUnlockRequired(void *a1, const char *a2, ...)
{
  return [a1 handleSetExpressPassUnlockRequired];
}

id objc_msgSend_hiddenRightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 hiddenRightBarButtonItem];
}

id objc_msgSend_hidesBackButton(void *a1, const char *a2, ...)
{
  return [a1 hidesBackButton];
}

id objc_msgSend_hidesCancelButton(void *a1, const char *a2, ...)
{
  return [a1 hidesCancelButton];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return [a1 identifiers];
}

id objc_msgSend_instructionLabel(void *a1, const char *a2, ...)
{
  return [a1 instructionLabel];
}

id objc_msgSend_instructionLabelTextColor(void *a1, const char *a2, ...)
{
  return [a1 instructionLabelTextColor];
}

id objc_msgSend_instructionViewController(void *a1, const char *a2, ...)
{
  return [a1 instructionViewController];
}

id objc_msgSend_interactivePopGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 interactivePopGestureRecognizer];
}

id objc_msgSend_isAccessPass(void *a1, const char *a2, ...)
{
  return [a1 isAccessPass];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isBeingDismissed(void *a1, const char *a2, ...)
{
  return [a1 isBeingDismissed];
}

id objc_msgSend_isEffectivelyLocked(void *a1, const char *a2, ...)
{
  return [a1 isEffectivelyLocked];
}

id objc_msgSend_isInAppSwitcher(void *a1, const char *a2, ...)
{
  return [a1 isInAppSwitcher];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isNFCExpressEnabled(void *a1, const char *a2, ...)
{
  return [a1 isNFCExpressEnabled];
}

id objc_msgSend_isPeerPaymentPass(void *a1, const char *a2, ...)
{
  return [a1 isPeerPaymentPass];
}

id objc_msgSend_isRegistrationSupported(void *a1, const char *a2, ...)
{
  return [a1 isRegistrationSupported];
}

id objc_msgSend_isSettingsControllerReloadNecessary(void *a1, const char *a2, ...)
{
  return [a1 isSettingsControllerReloadNecessary];
}

id objc_msgSend_isStoredValuePass(void *a1, const char *a2, ...)
{
  return [a1 isStoredValuePass];
}

id objc_msgSend_isSuicaPass(void *a1, const char *a2, ...)
{
  return [a1 isSuicaPass];
}

id objc_msgSend_isUWBExpressEnabled(void *a1, const char *a2, ...)
{
  return [a1 isUWBExpressEnabled];
}

id objc_msgSend_isViewVisible(void *a1, const char *a2, ...)
{
  return [a1 isViewVisible];
}

id objc_msgSend_lastProvidedCanAddPaymentPass(void *a1, const char *a2, ...)
{
  return [a1 lastProvidedCanAddPaymentPass];
}

id objc_msgSend_lastProvidedIsRestricted(void *a1, const char *a2, ...)
{
  return [a1 lastProvidedIsRestricted];
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 leftBarButtonItem];
}

id objc_msgSend_linkedApplication(void *a1, const char *a2, ...)
{
  return [a1 linkedApplication];
}

id objc_msgSend_listSettingsController(void *a1, const char *a2, ...)
{
  return [a1 listSettingsController];
}

id objc_msgSend_loadWebService(void *a1, const char *a2, ...)
{
  return [a1 loadWebService];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedMirroringDetailFooter(void *a1, const char *a2, ...)
{
  return [a1 localizedMirroringDetailFooter];
}

id objc_msgSend_localizedPaneTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedPaneTitle];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_merchant(void *a1, const char *a2, ...)
{
  return [a1 merchant];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return [a1 messageType];
}

id objc_msgSend_mirrorSettings(void *a1, const char *a2, ...)
{
  return [a1 mirrorSettings];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_needsRegistration(void *a1, const char *a2, ...)
{
  return [a1 needsRegistration];
}

id objc_msgSend_npkPossiblyOverriddenPeerPaymentServiceURL(void *a1, const char *a2, ...)
{
  return [a1 npkPossiblyOverriddenPeerPaymentServiceURL];
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return [a1 organizationName];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_pass(void *a1, const char *a2, ...)
{
  return [a1 pass];
}

id objc_msgSend_passInformation(void *a1, const char *a2, ...)
{
  return [a1 passInformation];
}

id objc_msgSend_passLibraryDataProvider(void *a1, const char *a2, ...)
{
  return [a1 passLibraryDataProvider];
}

id objc_msgSend_passUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 passUniqueIdentifier];
}

id objc_msgSend_passcodeChangeCompletion(void *a1, const char *a2, ...)
{
  return [a1 passcodeChangeCompletion];
}

id objc_msgSend_passcodeConnection(void *a1, const char *a2, ...)
{
  return [a1 passcodeConnection];
}

id objc_msgSend_paymentApplications(void *a1, const char *a2, ...)
{
  return [a1 paymentApplications];
}

id objc_msgSend_paymentCardType(void *a1, const char *a2, ...)
{
  return [a1 paymentCardType];
}

id objc_msgSend_paymentNetworkIdentifier(void *a1, const char *a2, ...)
{
  return [a1 paymentNetworkIdentifier];
}

id objc_msgSend_paymentPass(void *a1, const char *a2, ...)
{
  return [a1 paymentPass];
}

id objc_msgSend_paymentSetupDelegate(void *a1, const char *a2, ...)
{
  return [a1 paymentSetupDelegate];
}

id objc_msgSend_paymentSetupSupportedInRegion(void *a1, const char *a2, ...)
{
  return [a1 paymentSetupSupportedInRegion];
}

id objc_msgSend_peerPaymentAccount(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentAccount];
}

id objc_msgSend_peerPaymentPassUniqueID(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentPassUniqueID];
}

id objc_msgSend_peerPaymentWebService(void *a1, const char *a2, ...)
{
  return [a1 peerPaymentWebService];
}

id objc_msgSend_pendingAction(void *a1, const char *a2, ...)
{
  return [a1 pendingAction];
}

id objc_msgSend_pendingExpressPassesConfigurations(void *a1, const char *a2, ...)
{
  return [a1 pendingExpressPassesConfigurations];
}

id objc_msgSend_pendingTransactionHandler(void *a1, const char *a2, ...)
{
  return [a1 pendingTransactionHandler];
}

id objc_msgSend_performingBackgroundPreflight(void *a1, const char *a2, ...)
{
  return [a1 performingBackgroundPreflight];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_presentTermsAndConditions(void *a1, const char *a2, ...)
{
  return [a1 presentTermsAndConditions];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return [a1 presentationController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_provisioningController(void *a1, const char *a2, ...)
{
  return [a1 provisioningController];
}

id objc_msgSend_refreshDefaultCard(void *a1, const char *a2, ...)
{
  return [a1 refreshDefaultCard];
}

id objc_msgSend_refreshPasses(void *a1, const char *a2, ...)
{
  return [a1 refreshPasses];
}

id objc_msgSend_refreshPeerPaymentStatus(void *a1, const char *a2, ...)
{
  return [a1 refreshPeerPaymentStatus];
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return [a1 regionCode];
}

id objc_msgSend_reloadApplicationStateIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 reloadApplicationStateIfNecessary];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requestAccess(void *a1, const char *a2, ...)
{
  return [a1 requestAccess];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_secureElementPass(void *a1, const char *a2, ...)
{
  return [a1 secureElementPass];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_settingsController(void *a1, const char *a2, ...)
{
  return [a1 settingsController];
}

id objc_msgSend_settingsMode(void *a1, const char *a2, ...)
{
  return [a1 settingsMode];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedSetupDelegate(void *a1, const char *a2, ...)
{
  return [a1 sharedSetupDelegate];
}

id objc_msgSend_sharedWebServiceProvider(void *a1, const char *a2, ...)
{
  return [a1 sharedWebServiceProvider];
}

id objc_msgSend_shieldViewController(void *a1, const char *a2, ...)
{
  return [a1 shieldViewController];
}

id objc_msgSend_shouldNavigateToTermsAndConditions(void *a1, const char *a2, ...)
{
  return [a1 shouldNavigateToTermsAndConditions];
}

id objc_msgSend_shouldShowUpdateRequired(void *a1, const char *a2, ...)
{
  return [a1 shouldShowUpdateRequired];
}

id objc_msgSend_showAlerts(void *a1, const char *a2, ...)
{
  return [a1 showAlerts];
}

id objc_msgSend_showUpdateRequired(void *a1, const char *a2, ...)
{
  return [a1 showUpdateRequired];
}

id objc_msgSend_showingSpinner(void *a1, const char *a2, ...)
{
  return [a1 showingSpinner];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_spinnerItem(void *a1, const char *a2, ...)
{
  return [a1 spinnerItem];
}

id objc_msgSend_splitViewController(void *a1, const char *a2, ...)
{
  return [a1 splitViewController];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_supportedTransitNetworkIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 supportedTransitNetworkIdentifiers];
}

id objc_msgSend_supportsBarcodePayment(void *a1, const char *a2, ...)
{
  return [a1 supportsBarcodePayment];
}

id objc_msgSend_suppressMirrorOption(void *a1, const char *a2, ...)
{
  return [a1 suppressMirrorOption];
}

id objc_msgSend_suppressSendToNotificationCenterOption(void *a1, const char *a2, ...)
{
  return [a1 suppressSendToNotificationCenterOption];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemGroupedBackgroundColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_targetDevice(void *a1, const char *a2, ...)
{
  return [a1 targetDevice];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return [a1 textColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return [a1 transaction];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_updateRegionSupportIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 updateRegionSupportIfNecessary];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_viewDidAppear(void *a1, const char *a2, ...)
{
  return [a1 viewDidAppear];
}

id objc_msgSend_webService(void *a1, const char *a2, ...)
{
  return [a1 webService];
}

id objc_msgSend_willHandleURL(void *a1, const char *a2, ...)
{
  return [a1 willHandleURL];
}