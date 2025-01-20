@interface CatalystSiwaPurchaseTask
- (AMSPurchaseSIWAResult)purchaseResult;
- (CatalystSiwaPurchaseTask)initWithPurchase:(id)a3 client:(id)a4 dialogContext:(id)a5 paymentSheetDelegate:(id)a6;
- (id)_performPurchase;
- (void)main;
@end

@implementation CatalystSiwaPurchaseTask

- (CatalystSiwaPurchaseTask)initWithPurchase:(id)a3 client:(id)a4 dialogContext:(id)a5 paymentSheetDelegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CatalystSiwaPurchaseTask;
  v15 = [(Task *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_purchase, a3);
    objc_storeStrong((id *)&v16->_client, a4);
    objc_storeStrong((id *)&v16->_dialogContext, a5);
    objc_storeWeak((id *)&v16->_paymentSheetDelegate, v14);
  }

  return v16;
}

- (void)main
{
  if (self->_client)
  {
    id v3 = 0;
  }
  else
  {
    ASDErrorWithDescription();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_purchase)
  {
    uint64_t v4 = ASDErrorWithDescription();

    id v3 = (id)v4;
    if (v4) {
      goto LABEL_6;
    }
LABEL_8:
    v5 = [(CatalystSiwaPurchaseTask *)self _performPurchase];
    id v15 = 0;
    v6 = [v5 resultWithError:&v15];
    id v3 = v15;

    objc_storeStrong((id *)&self->_purchaseResult, v6);
    if (self->_purchaseResult)
    {
      if (qword_10039F608 != -1) {
        dispatch_once(&qword_10039F608, &stru_100357550);
      }
      v7 = (void *)qword_10039F5D8;
      if (os_log_type_enabled((os_log_t)qword_10039F5D8, OS_LOG_TYPE_DEFAULT))
      {
        purchase = self->_purchase;
        v9 = v7;
        v10 = [(AMSPurchaseSIWA *)purchase logUUID];
        *(_DWORD *)buf = 138543618;
        v17 = self;
        __int16 v18 = 2114;
        v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Purchase completed.", buf, 0x16u);
      }
      if (v3) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v3)
      {
        if (qword_10039F608 != -1) {
          dispatch_once(&qword_10039F608, &stru_100357550);
        }
        id v11 = (void *)qword_10039F5D8;
        if (os_log_type_enabled((os_log_t)qword_10039F5D8, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = self->_purchase;
          id v13 = v11;
          id v14 = [(AMSPurchaseSIWA *)v12 logUUID];
          *(_DWORD *)buf = 138543874;
          v17 = self;
          __int16 v18 = 2114;
          v19 = v14;
          __int16 v20 = 2112;
          id v21 = v3;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Purchase resulted in error: %@.", buf, 0x20u);
        }
        goto LABEL_14;
      }
      ASDErrorWithDescription();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
LABEL_14:
        [(Task *)self completeWithError:v3];
LABEL_22:

        goto LABEL_23;
      }
    }
    [(Task *)self completeWithSuccess];
    goto LABEL_22;
  }
  if (!v3) {
    goto LABEL_8;
  }
LABEL_6:
  [(Task *)self completeWithError:v3];
LABEL_23:
}

- (id)_performPurchase
{
  id v3 = objc_alloc_init((Class)AMSPromise);
  if (self->_dialogContext && (id v4 = objc_loadWeakRetained((id *)&self->_paymentSheetDelegate), v4, v4))
  {
    dialogContext = self->_dialogContext;
    purchase = self->_purchase;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentSheetDelegate);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002A388;
    v14[3] = &unk_100357530;
    id v15 = v3;
    v16 = self;
    [(DialogProtocol *)dialogContext handlePurchase:purchase paymentSheetDelegate:WeakRetained completionHandler:v14];

    v8 = v15;
  }
  else
  {
    if (qword_10039F608 != -1) {
      dispatch_once(&qword_10039F608, &stru_100357550);
    }
    v9 = (void *)qword_10039F5D8;
    if (os_log_type_enabled((os_log_t)qword_10039F5D8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_purchase;
      id v11 = v9;
      id v12 = [(AMSPurchaseSIWA *)v10 logUUID];
      *(_DWORD *)buf = 138543618;
      __int16 v18 = self;
      __int16 v19 = 2114;
      __int16 v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: No dialog observer to process purchase.", buf, 0x16u);
    }
    v8 = ASDErrorWithDescription();
    [v3 finishWithError:v8];
  }

  return v3;
}

- (AMSPurchaseSIWAResult)purchaseResult
{
  return self->_purchaseResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseResult, 0);
  objc_destroyWeak((id *)&self->_paymentSheetDelegate);
  objc_storeStrong((id *)&self->_dialogContext, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_purchase, 0);
}

@end