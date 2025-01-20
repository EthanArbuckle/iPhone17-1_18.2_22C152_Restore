@interface AMSDFraudReportPrivacyTask
+ (id)_blindedTransactionWithTransactionID:(id)a3 pks:(id)a4 keyID:(id)a5 error:(id *)a6;
+ (id)performUnBlindingFraudReportForResponse:(id)a3 tdmToken:(id)a4 pks:(id)a5 error:(id *)a6;
- (AMSBagProtocol)bag;
- (AMSDFraudReportPrivacyTask)initWithBag:(id)a3;
- (id)performBlindingWithTransactionID:(id)a3 keyID:(id)a4;
@end

@implementation AMSDFraudReportPrivacyTask

- (AMSDFraudReportPrivacyTask)initWithBag:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"bag must not be nil" userInfo:0];
    objc_exception_throw(v10);
  }
  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)AMSDFraudReportPrivacyTask;
  v7 = [(AMSDFraudReportPrivacyTask *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_bag, a3);
  }

  return v8;
}

- (id)performBlindingWithTransactionID:(id)a3 keyID:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D544;
  v9[3] = &unk_100112848;
  id v10 = self;
  id v11 = a3;
  id v12 = a4;
  id v5 = v12;
  id v6 = v11;
  v7 = [(AMSDFraudReportPrivacyTask *)v10 performTaskWithPromiseBlock:v9];

  return v7;
}

+ (id)performUnBlindingFraudReportForResponse:(id)a3 tdmToken:(id)a4 pks:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = AMSSetLogKeyIfNeeded();
  v14 = +[AMSLogConfig sharedFraudReportConfig];
  if (!v14)
  {
    v14 = +[AMSLogConfig sharedConfig];
  }
  v15 = [v14 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v32 = a1;
    __int16 v33 = 2114;
    v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running fraud report unblinding response task.", buf, 0x16u);
  }

  v16 = [v10 nameSpace];
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@|%hhu|%hhu", v16, [v10 reportedScore], objc_msgSend(v10, "newScore"));
  v18 = [v17 dataUsingEncoding:4];

  if (v18)
  {
    id v19 = a1;
    v29 = a6;
    v20 = [v10 evaluatedElementData];
    v21 = [v10 proofData];
    id v30 = 0;
    v22 = [v11 finalizeWithEvaluatedElement:v20 proof:v21 publicKey:v12 fsr:v18 error:&v30];
    id v23 = v30;

    if (v22)
    {
      v24 = [v22 base64EncodedStringWithOptions:0];
      [v10 _setFinalizedElement:v24];

      id v25 = v10;
    }
    else
    {
      v26 = +[AMSLogConfig sharedFraudReportConfig];
      if (!v26)
      {
        v26 = +[AMSLogConfig sharedConfig];
      }
      v27 = [v26 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v32 = v19;
        __int16 v33 = 2114;
        v34 = v13;
        __int16 v35 = 2114;
        id v36 = v23;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error fraud report unblinding message, cannot create a finalized element: %{public}@", buf, 0x20u);
      }

      id v25 = 0;
      if (v29) {
        id *v29 = v23;
      }
    }
  }
  else if (a6)
  {
    AMSError();
    id v25 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

+ (id)_blindedTransactionWithTransactionID:(id)a3 pks:(id)a4 keyID:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = AMSSetLogKeyIfNeeded();
  v13 = [v11 dataUsingEncoding:4];

  if (v13)
  {
    id v14 = [objc_alloc((Class)TDMToken) initWithTID:v13];
    v15 = [v14 blindedElement];

    if (v15)
    {
      v16 = [v10 dataUsingEncoding:4];
      v17 = [[AMSDFraudReportBlindedTransaction alloc] initWithTDMToken:v14 pks:v9 keyID:v16];
    }
    else if (a6)
    {
      AMSError();
      v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }
  else if (a6)
  {
    AMSError();
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void).cxx_destruct
{
}

@end