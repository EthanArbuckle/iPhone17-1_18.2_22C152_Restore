@interface RedownloadRecoveryTask
- (void)main;
@end

@implementation RedownloadRecoveryTask

- (void)main
{
  id v26 = 0;
  if (self)
  {
    id v3 = objc_alloc_init((Class)ASDPurchaseHistoryQuery);
    [v3 setAccountID:self->_accountID];
    itemID = self->_itemID;
    v4 = +[NSArray arrayWithObjects:&itemID count:1];
    [v3 setStoreIDs:v4];

    v5 = sub_10001A264();
    v6 = sub_10024B0C4((uint64_t)v5, v3, &v26);
    v7 = [v6 firstObject];

    if (v7)
    {
      v8 = objc_alloc_init(PurchaseInfo);
      v9 = +[NSNumber numberWithUnsignedInteger:self->_recoveryCount];
      [(PurchaseInfo *)v8 setRecoveryCount:v9];

      v10 = [v7 redownloadParams];
      BOOL v11 = v10 != 0;
      if (v10)
      {
        v12 = +[AMSBuyParams buyParamsWithString:v10];
        [(PurchaseInfo *)v8 setBuyParams:v12];

        [(PurchaseInfo *)v8 setBundleID:self->_bundleID];
        [(PurchaseInfo *)v8 setExternalID:self->_externalID];
        [(PurchaseInfo *)v8 setItemID:self->_itemID];
        [(PurchaseInfo *)v8 setLogCode:self->_logCode];
        [(PurchaseInfo *)v8 setMetricsType:&off_10054BDA8];
        id v13 = [objc_alloc((Class)AMSProcessInfo) initWithBundleIdentifier:self->_clientID];
        [(PurchaseInfo *)v8 setClientInfo:v13];

        [(PurchaseInfo *)v8 setPurchaseType:0];
        id v14 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:self->_bundleID allowPlaceholder:0 error:0];
        if (v14) {
          uint64_t v15 = 2;
        }
        else {
          uint64_t v15 = 1;
        }
        [(PurchaseInfo *)v8 setCoordinatorIntent:v15];
        if (self->_userInitiated)
        {
          [(PurchaseInfo *)v8 setPriority:0];
          [(PurchaseInfo *)v8 setCoordinatorImportance:2];
        }
        else
        {
          [(PurchaseInfo *)v8 setPriority:-2];
          [(PurchaseInfo *)v8 setCoordinatorImportance:1];
          [(PurchaseInfo *)v8 setDiscretionary:1];
          [(PurchaseInfo *)v8 setSuppressDialogs:1];
          [(PurchaseInfo *)v8 setSuppressEvaluatorDialogs:1];
          v16 = [(PurchaseInfo *)v8 buyParams];
          [v16 setObject:@"1" forKeyedSubscript:AMSBuyParamPropertyIsBackground];
        }
        [(PurchaseInfo *)v8 setExpectedSoftwarePlatform:self->_softwarePlatform];
        [(PurchaseInfo *)v8 updateGeneratedProperties];
        v17 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = [(PurchaseInfo *)v8 logKey];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%@] Initiating re-purchase for failed install", buf, 0xCu);
        }
        v19 = sub_100213454();
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100267908;
        v28 = &unk_100524210;
        v29 = v8;
        sub_100213A9C((uint64_t)v19, v29, buf);
      }
      else
      {
        ASDErrorWithUserInfoAndFormat();
        id v26 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      BOOL v11 = 0;
    }

    v20 = v26;
  }
  else
  {
    v20 = 0;
    BOOL v11 = 0;
  }
  id v21 = v20;
  v22 = ASDLogHandleForCategory();
  v23 = v22;
  if (v11)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      logKey = self->_logKey;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = logKey;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%@] Started recovery re-purchase", buf, 0xCu);
    }

    [(Task *)self completeWithSuccess];
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v25 = self->_logKey;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%@] Cannot start recovery re-purchase: %{public}@", buf, 0x16u);
    }

    [(Task *)self completeWithError:v21];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_logCode, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end