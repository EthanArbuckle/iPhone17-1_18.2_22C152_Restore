@interface AMSDFraudReportService
+ (BOOL)isConnectionEntitled:(id)a3;
+ (id)_reportedScoreFromFSRDataString:(id)a3 error:(id *)a4;
- (void)performFraudReportRefreshWithOptions:(id)a3 completion:(id)a4;
@end

@implementation AMSDFraudReportService

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.private.applemediaservices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  unsigned __int8 v5 = [v4 BOOLValue];
  return v5;
}

- (void)performFraudReportRefreshWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[AMSLogConfig sharedFraudReportConfig];
  if (!v8)
  {
    v8 = +[AMSLogConfig sharedConfig];
  }
  v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    id v11 = v10;
    v12 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    v26 = v10;
    __int16 v27 = 2114;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running fraud report task.", buf, 0x16u);
  }
  v13 = +[AMSDBag defaultBag];
  v14 = [[AMSDFraudReportPrivacyTask alloc] initWithBag:v13];
  v15 = [v6 transactionIdentifier];
  v16 = [v6 keyIdentifier];
  v17 = [(AMSDFraudReportPrivacyTask *)v14 performBlindingWithTransactionID:v15 keyID:v16];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002E608;
  v21[3] = &unk_100112898;
  v21[4] = self;
  id v22 = v6;
  id v23 = v13;
  id v24 = v7;
  id v18 = v13;
  id v19 = v6;
  id v20 = v7;
  [v17 resultWithCompletion:v21];
}

+ (id)_reportedScoreFromFSRDataString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSScanner) initWithString:v5];

  [v6 scanUpToString:@"rs=" intoString:0];
  if ([v6 isAtEnd])
  {
    if (a4) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  [v6 setScanLocation:(char *)objc_msgSend(@"rs=", "length") + (void)objc_msgSend(v6, "scanLocation")];
  unint64_t v9 = 0;
  if (([v6 scanUnsignedLongLong:&v9] & 1) == 0)
  {
    if (a4)
    {
LABEL_10:
      AMSError();
      id v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (_os_feature_enabled_impl() && v9 >= 0x100)
  {
    if (a4) {
      goto LABEL_10;
    }
LABEL_11:
    id v7 = 0;
    goto LABEL_13;
  }
  id v7 = +[NSNumber numberWithUnsignedLongLong:v9];
LABEL_13:

  return v7;
}

@end