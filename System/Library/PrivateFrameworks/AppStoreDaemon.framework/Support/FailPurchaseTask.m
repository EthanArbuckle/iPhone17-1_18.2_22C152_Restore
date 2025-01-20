@interface FailPurchaseTask
- (void)main;
@end

@implementation FailPurchaseTask

- (void)main
{
  if ([(PurchaseInfo *)self->_purchaseInfo discoveredUpdate])
  {
    v3 = [(PurchaseInfo *)self->_purchaseInfo bundleID];

    if (v3)
    {
      *(void *)v46 = 0;
      *(void *)&v46[8] = v46;
      *(void *)&v46[16] = 0x2020000000;
      LOBYTE(v47) = 1;
      v4 = sub_10001A308();
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100387F20;
      v43[3] = &unk_1005273F8;
      v43[4] = self;
      v43[5] = v46;
      [v4 modifyUsingTransaction:v43];

      if (*(unsigned char *)(*(void *)&v46[8] + 24))
      {
        v5 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = [(PurchaseInfo *)self->_purchaseInfo logKey];
          *(_DWORD *)buf = 138412290;
          v45 = v6;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%@] Resetting update after purchase failed", buf, 0xCu);
        }
        v7 = sub_10001A308();
        v8 = [(PurchaseInfo *)self->_purchaseInfo bundleID];
        v9 = [(PurchaseInfo *)self->_purchaseInfo logKey];
        sub_1002E83AC(v7, v8, v9);
      }
      v10 = +[UpdatesManager sharedManager];
      v11 = [(PurchaseInfo *)self->_purchaseInfo logKey];
      [v10 noteUpdatesStateChanged:@"Purchase Failure" logKey:v11];

      _Block_object_dispose(v46, 8);
    }
  }
  if ([(PurchaseInfo *)self->_purchaseInfo generatedVendorID])
  {
    v12 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(PurchaseInfo *)self->_purchaseInfo logKey];
      *(_DWORD *)v46 = 138412290;
      *(void *)&v46[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%@] Removing generated vendor identifier", v46, 0xCu);
    }
    v14 = +[LSApplicationWorkspace defaultWorkspace];
    v15 = [(PurchaseInfo *)self->_purchaseInfo bundleID];

    if (v15)
    {
      v16 = [(PurchaseInfo *)self->_purchaseInfo vendorName];
      v17 = [(PurchaseInfo *)self->_purchaseInfo bundleID];
      [v14 removeDeviceIdentifierForVendorName:v16 bundleIdentifier:v17];
    }
    v18 = [(PurchaseInfo *)self->_purchaseInfo temporaryBundleID];

    if (v18)
    {
      v19 = [(PurchaseInfo *)self->_purchaseInfo vendorName];
      v20 = [(PurchaseInfo *)self->_purchaseInfo temporaryBundleID];
      [v14 removeDeviceIdentifierForVendorName:v19 bundleIdentifier:v20];
    }
  }
  v21 = [(PurchaseInfo *)self->_purchaseInfo coordinator];
  BOOL v22 = v21 == 0;

  if (!v22)
  {
    v23 = self->_purchaseError;
    v24 = [(NSError *)v23 domain];
    unsigned __int8 v25 = [v24 isEqualToString:IXUserPresentableErrorDomain];

    if ((v25 & 1) == 0)
    {
      uint64_t v26 = IXCreateUserPresentableError();

      v23 = (NSError *)v26;
    }
    v27 = [(PurchaseInfo *)self->_purchaseInfo coordinator];
    v28 = ASDErrorWithSafeUserInfo();
    id v42 = 0;
    char v29 = sub_100279D48(v27, v28, &v42);
    id v30 = v42;

    if ((v29 & 1) == 0)
    {
      v31 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v40 = [(PurchaseInfo *)self->_purchaseInfo logKey];
        v41 = [(PurchaseInfo *)self->_purchaseInfo coordinator];
        *(_DWORD *)v46 = 138412802;
        *(void *)&v46[4] = v40;
        *(_WORD *)&v46[12] = 2114;
        *(void *)&v46[14] = v41;
        *(_WORD *)&v46[22] = 2114;
        id v47 = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[%@] Canceling coordinator: %{public}@ failed: %{public}@", v46, 0x20u);
      }
    }
  }
  v32 = [(PurchaseInfo *)self->_purchaseInfo bundleID];

  if (v32)
  {
    v33 = sub_100388088();
    v34 = [(PurchaseInfo *)self->_purchaseInfo bundleID];
    sub_1003886AC((uint64_t)v33, v34);
  }
  if (![(PurchaseInfo *)self->_purchaseInfo purchaseType])
  {
    if (sub_1003C4D74()) {
      +[SkannerEvent resultTypeTokenReceived];
    }
    else {
    v35 = +[SkannerEvent resultTypeTransmission];
    }
    v36 = +[SkannerEvent destinationCommerce];
    v37 = +[SkannerEvent requestWithResult:v35 destination:v36 responseCode:0 postback:0 error:self->_purchaseError];

    v38 = +[SkannerCoordinator sharedInstance];
    v39 = [(PurchaseInfo *)self->_purchaseInfo itemID];
    objc_msgSend(v38, "logEvent:forAdvertisedAppAdamID:synchronizeWithSnout:", v37, objc_msgSend(v39, "longLongValue"), 1);
  }
  [(Task *)self completeWithSuccess];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_purchaseError, 0);
}

@end