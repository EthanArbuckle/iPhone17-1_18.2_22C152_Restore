@interface AMSDPurchaseService
+ (BOOL)isConnectionEntitled:(id)a3;
+ (id)_fdsConsumedCache;
+ (id)_fdsConsumedCacheAccessQueue;
+ (id)_fdsEvaluatorCache;
+ (id)_fdsEvaluatorCacheAccessQueue;
+ (id)_fdsResultCache;
+ (id)_fdsResultCacheAccessQueue;
+ (id)_odiSessionCache;
+ (id)_odiSessionCacheAccessQueue;
- (id)_createScorerWithAction:(unint64_t)a3 account:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)_odiAssessmentForSession:(id)a3;
- (id)_serverEndpointIdentifierForFDSAction:(unint64_t)a3;
- (id)_serviceProviderTypeForServiceIdentifier:(id)a3;
- (unint64_t)_dsidTypeForAccountType:(unint64_t)a3;
- (unint64_t)_outcomeTypeForOutcome:(unint64_t)a3;
- (void)_completeEvaluationForPurchaseIdentifier:(id)a3 logKey:(id)a4;
- (void)_createODISessionWithSessionIdentifier:(id)a3 cacheIdentifier:(id)a4 accountType:(unint64_t)a5 bundleIdentifier:(id)a6 completion:(id)a7;
- (void)_generateLegacyFDSWithRequest:(id)a3 completion:(id)a4;
- (void)_generateODIFDSWithRequest:(id)a3 completion:(id)a4;
- (void)cacheFDS:(id)a3 forPurchaseIdentifier:(id)a4 logKey:(id)a5 completion:(id)a6;
- (void)cachedFDSForPurchaseIdentifier:(id)a3 logKey:(id)a4 completion:(id)a5;
- (void)createODISessionWithSessionIdentifier:(id)a3 accountType:(unint64_t)a4 bundleIdentifier:(id)a5 completion:(id)a6;
- (void)didConsumeFDSForPurchaseIdentifier:(id)a3 logKey:(id)a4 completion:(id)a5;
- (void)generateFDSWithRequest:(id)a3 completion:(id)a4;
- (void)getODIAssessmentForSessionIdentifier:(id)a3 clearCache:(BOOL)a4 completion:(id)a5;
- (void)partialFDSAssessmentForRequest:(id)a3 completion:(id)a4;
- (void)provideFeedbackOnPayloadOutcome:(unint64_t)a3 sessionIdentifier:(id)a4 clearCache:(BOOL)a5 completion:(id)a6;
- (void)updateODIWithAttributes:(id)a3 forSessionIdentifier:(id)a4 completion:(id)a5;
@end

@implementation AMSDPurchaseService

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

- (void)cachedFDSForPurchaseIdentifier:(id)a3 logKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    v11 = 0;
  }
  else
  {
    v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to fetch FDS. We don't have a purchase identifier.", buf, 0x16u);
    }

    v11 = AMSError();
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v21 = sub_100015AF8;
  v22 = sub_100015A6C;
  id v23 = 0;
  if (!v11)
  {
    v14 = [(id)objc_opt_class() _fdsResultCacheAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A510;
    block[3] = &unk_100113B10;
    v19 = buf;
    block[4] = self;
    id v18 = v8;
    dispatch_sync(v14, block);
  }
  if (v10)
  {
    uint64_t v15 = *(void *)(*(void *)&buf[8] + 40);
    v16 = objc_msgSend(v11, "ams_sanitizedForSecureCoding");
    v10[2](v10, v15, v16);
  }
  _Block_object_dispose(buf, 8);
}

- (void)cacheFDS:(id)a3 forPurchaseIdentifier:(id)a4 logKey:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (v11) {
    goto LABEL_2;
  }
  v16 = +[AMSLogConfig sharedConfig];
  if (!v16)
  {
    v16 = +[AMSLogConfig sharedConfig];
  }
  v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = objc_opt_class();
    __int16 v24 = 2114;
    id v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to cache FDS. We don't have a purchase identifier.", buf, 0x16u);
  }

  uint64_t v15 = AMSError();
  if (!v15)
  {
LABEL_2:
    if (!v10) {
      [(AMSDPurchaseService *)self _completeEvaluationForPurchaseIdentifier:v11 logKey:v12];
    }
    v14 = [(id)objc_opt_class() _fdsResultCacheAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A7C0;
    block[3] = &unk_100113B38;
    block[4] = self;
    id v20 = v11;
    id v21 = v10;
    dispatch_sync(v14, block);

    uint64_t v15 = 0;
  }
  if (v13)
  {
    id v18 = objc_msgSend(v15, "ams_sanitizedForSecureCoding");
    v13[2](v13, v18);
  }
}

- (void)didConsumeFDSForPurchaseIdentifier:(id)a3 logKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = objc_opt_class();
    __int16 v23 = 2114;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Caching FDS consumption metadata", buf, 0x16u);
  }

  if (v8) {
    goto LABEL_6;
  }
  uint64_t v15 = +[AMSLogConfig sharedConfig];
  if (!v15)
  {
    uint64_t v15 = +[AMSLogConfig sharedConfig];
  }
  v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v17;
    __int16 v23 = 2114;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to FDS consumption metadata. We don't have a purchase identifier.", buf, 0x16u);
  }

  v14 = AMSError();
  if (!v14)
  {
LABEL_6:
    v13 = [(id)objc_opt_class() _fdsConsumedCacheAccessQueue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004AABC;
    v19[3] = &unk_100112170;
    v19[4] = self;
    id v20 = v8;
    dispatch_sync(v13, v19);

    v14 = 0;
  }
  if (v10)
  {
    id v18 = objc_msgSend(v14, "ams_sanitizedForSecureCoding");
    v10[2](v10, v18);
  }
}

- (void)generateFDSWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = [v6 logKey];
    id v12 = [v6 options];
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v10;
    __int16 v29 = 2114;
    v30 = v11;
    __int16 v31 = 2048;
    id v32 = [v12 action];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Evaluating FDS. action = %ld", buf, 0x20u);
  }
  v13 = [v6 options];
  id v14 = [v13 action];

  if (v14 == (id)4)
  {
    uint64_t v15 = [(id)objc_opt_class() _fdsConsumedCacheAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004AE08;
    block[3] = &unk_100112170;
    block[4] = self;
    id v26 = v6;
    dispatch_sync(v15, block);
  }
  v16 = [v6 options];
  id v17 = [v16 action];

  if (v17 == (id)4)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10004AE80;
    v23[3] = &unk_100113B60;
    id v18 = &v24;
    id v24 = v7;
    id v19 = v7;
    [(AMSDPurchaseService *)self _generateODIFDSWithRequest:v6 completion:v23];
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10004AEFC;
    v21[3] = &unk_100113B60;
    id v18 = &v22;
    id v22 = v7;
    id v20 = v7;
    [(AMSDPurchaseService *)self _generateLegacyFDSWithRequest:v6 completion:v21];
  }
}

- (void)partialFDSAssessmentForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void *))a4;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_100015AF8;
  v44 = sub_100015A6C;
  id v45 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_100015AF8;
  v38 = sub_100015A6C;
  id v39 = 0;
  id v8 = [v6 options];
  BOOL v9 = [v8 action] == (id)4;

  if (v9)
  {
    uint64_t v10 = [(id)objc_opt_class() _odiSessionCacheAccessQueue];
    id v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    uint64_t v28 = sub_10004B364;
    __int16 v29 = &unk_100113B88;
    v30 = self;
    id v11 = v6;
    id v31 = v11;
    id v32 = &v40;
    v33 = &v34;
    dispatch_sync(v10, &v26);

    id v12 = objc_alloc((Class)AMSFDSResult);
    uint64_t v13 = v41[5];
    id v14 = objc_msgSend(v11, "options", v26, v27, v28, v29, v30);
    id v15 = objc_msgSend(v12, "initWithValue:action:", v13, objc_msgSend(v14, "action"));

    if (v7)
    {
      v16 = objc_msgSend((id)v35[5], "ams_sanitizedForSecureCoding");
      v7[2](v7, v15, v16);
    }
  }
  else
  {
    id v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    id v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      id v20 = [v6 logKey];
      id v21 = [v6 options];
      id v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v21 action]);
      *(_DWORD *)buf = 138543874;
      uint64_t v47 = v19;
      __int16 v48 = 2114;
      v49 = v20;
      __int16 v50 = 2112;
      v51 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Partial assessments not supported for action: %@", buf, 0x20u);
    }
    uint64_t v23 = AMSError();
    id v24 = (void *)v35[5];
    v35[5] = v23;

    if (v7)
    {
      id v25 = objc_msgSend((id)v35[5], "ams_sanitizedForSecureCoding");
      v7[2](v7, 0, v25);
    }
  }
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
}

- (void)createODISessionWithSessionIdentifier:(id)a3 accountType:(unint64_t)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
}

- (void)getODIAssessmentForSessionIdentifier:(id)a3 clearCache:(BOOL)a4 completion:(id)a5
{
  BOOL v18 = a4;
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t, uint64_t))a5;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_100015AF8;
  uint64_t v34 = sub_100015A6C;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_100015AF8;
  uint64_t v28 = sub_100015A6C;
  id v29 = 0;
  BOOL v9 = +[AMSLogConfig sharedConfig];
  if (!v9)
  {
    BOOL v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    AMSLogKey();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = +[NSNumber numberWithBool:v18];
    id v15 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v37 = v11;
    __int16 v38 = 2114;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = v13;
    __int16 v42 = 2112;
    v43 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoking 'getODIAssessment' with cache identifier: %@, clearCache: %@", buf, 0x2Au);
  }
  v16 = [(id)objc_opt_class() _odiSessionCacheAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B878;
  block[3] = &unk_100113BB0;
  block[4] = self;
  id v17 = v7;
  id v20 = v17;
  id v21 = &v30;
  id v22 = &v24;
  BOOL v23 = v18;
  dispatch_sync(v16, block);

  if (v8) {
    v8[2](v8, v31[5], v25[5]);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

- (void)provideFeedbackOnPayloadOutcome:(unint64_t)a3 sessionIdentifier:(id)a4 clearCache:(BOOL)a5 completion:(id)a6
{
  BOOL v20 = a5;
  id v8 = a4;
  BOOL v9 = (void (**)(id, void))a6;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100015AF8;
  uint64_t v30 = sub_100015A6C;
  id v31 = 0;
  uint64_t v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    AMSLogKey();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = +[NSNumber numberWithBool:v20];
    v16 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v33 = v12;
    __int16 v34 = 2114;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v14;
    __int16 v38 = 2112;
    id v39 = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoking 'provideFeedback' with cache identifier: %@, clearCache: %@", buf, 0x2Au);
  }
  id v17 = [(id)objc_opt_class() _odiSessionCacheAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004BD68;
  block[3] = &unk_100113BD8;
  block[4] = self;
  id v18 = v8;
  BOOL v25 = v20;
  id v22 = v18;
  BOOL v23 = &v26;
  unint64_t v24 = a3;
  dispatch_sync(v17, block);

  if (v9) {
    v9[2](v9, v27[5]);
  }

  _Block_object_dispose(&v26, 8);
}

- (void)updateODIWithAttributes:(id)a3 forSessionIdentifier:(id)a4 completion:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  BOOL v9 = (void (**)(id, void))a5;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100015AF8;
  id v29 = sub_100015A6C;
  id v30 = 0;
  uint64_t v10 = +[AMSLogConfig sharedConfig];
  if (!v10)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    AMSLogKey();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = [v20 attributes];
    v16 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544130;
    uint64_t v32 = v12;
    __int16 v33 = 2114;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v14;
    __int16 v37 = 2112;
    __int16 v38 = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoking 'updateODIWithAttributes' with cache identifier: %@, additional attributes: %@", buf, 0x2Au);
  }
  id v17 = [(id)objc_opt_class() _odiSessionCacheAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C220;
  block[3] = &unk_100113C00;
  block[4] = self;
  id v18 = v8;
  id v22 = v18;
  id v19 = v20;
  id v23 = v19;
  unint64_t v24 = &v25;
  dispatch_sync(v17, block);

  if (v9) {
    v9[2](v9, v26[5]);
  }

  _Block_object_dispose(&v25, 8);
}

- (void)_completeEvaluationForPurchaseIdentifier:(id)a3 logKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  id v8 = [(id)objc_opt_class() _fdsConsumedCacheAccessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C864;
  block[3] = &unk_100113B88;
  block[4] = self;
  id v9 = v6;
  id v35 = v9;
  id v36 = v42;
  __int16 v37 = &v38;
  dispatch_sync(v8, block);

  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v10 = [(id)objc_opt_class() _odiSessionCacheAccessQueue];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10004C8F4;
  v27[3] = &unk_100113B10;
  id v29 = &v30;
  v27[4] = self;
  id v11 = v9;
  id v28 = v11;
  dispatch_sync(v10, v27);

  int v12 = *((unsigned __int8 *)v39 + 24);
  if (*((unsigned char *)v31 + 24))
  {
    id v13 = [v11 stringValue];
    [(AMSDPurchaseService *)self provideFeedbackOnPayloadOutcome:2 * (v12 == 0) sessionIdentifier:v13 clearCache:1 completion:0];
  }
  else if (*((unsigned char *)v39 + 24))
  {
    id v14 = [(id)objc_opt_class() _fdsEvaluatorCacheAccessQueue];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10004C980;
    v23[3] = &unk_100113C00;
    void v23[4] = self;
    id v24 = v11;
    id v25 = v7;
    uint64_t v26 = v42;
    dispatch_sync(v14, v23);
  }
  id v15 = [(id)objc_opt_class() _fdsConsumedCacheAccessQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10004CB10;
  v21[3] = &unk_100112170;
  void v21[4] = self;
  id v16 = v11;
  id v22 = v16;
  dispatch_sync(v15, v21);

  id v17 = [(id)objc_opt_class() _fdsEvaluatorCacheAccessQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004CB6C;
  v19[3] = &unk_100112170;
  v19[4] = self;
  id v20 = v16;
  id v18 = v16;
  dispatch_sync(v17, v19);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v42, 8);
}

- (void)_createODISessionWithSessionIdentifier:(id)a3 cacheIdentifier:(id)a4 accountType:(unint64_t)a5 bundleIdentifier:(id)a6 completion:(id)a7
{
  id v30 = a3;
  id v32 = a4;
  id v29 = a6;
  id v31 = (void (**)(id, id, void *))a7;
  int v12 = +[AMSLogConfig sharedConfig];
  if (!v12)
  {
    int v12 = +[AMSLogConfig sharedConfig];
  }
  id v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class();
    id v15 = AMSLogKey();
    id v16 = AMSHashIfNeeded();
    id v17 = +[NSNumber numberWithUnsignedInteger:a5];
    id v18 = AMSHashIfNeeded();
    id v19 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    char v41 = v16;
    *(_WORD *)__int16 v42 = 2112;
    *(void *)&v42[2] = v18;
    __int16 v43 = 2112;
    v44 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoking 'createODISession' with sessionIdentifier: %@, accountType: %@, bundleIdentifier: %@", buf, 0x34u);
  }
  id v20 = [(AMSDPurchaseService *)self _serviceProviderTypeForServiceIdentifier:v30];
  unint64_t v21 = [(AMSDPurchaseService *)self _dsidTypeForAccountType:a5];
  if (v21 == -1)
  {
    id v28 = AMSError();
  }
  else
  {
    uint64_t v36 = 0;
    __int16 v37 = &v36;
    uint64_t v38 = 0x2050000000;
    id v22 = (void *)qword_100130460;
    uint64_t v39 = qword_100130460;
    if (!qword_100130460)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10004FBC0;
      char v41 = &unk_100112770;
      *(void *)__int16 v42 = &v36;
      sub_10004FBC0((uint64_t)buf);
      id v22 = (void *)v37[3];
    }
    id v23 = v22;
    _Block_object_dispose(&v36, 8);
    id v24 = [[v23 alloc] initWithServiceIdentifier:v20 forDSIDType:v21 andLocationBundleIdentifier:v29];
    id v25 = v24;
    if (v24)
    {
      if (!v32)
      {
        uint64_t v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v24 hash]);
        id v32 = +[NSString stringWithFormat:@"%@", v26];
      }
      uint64_t v27 = [(id)objc_opt_class() _odiSessionCacheAccessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004D010;
      block[3] = &unk_100113B38;
      block[4] = self;
      id v34 = v25;
      id v32 = v32;
      id v35 = v32;
      dispatch_sync(v27, block);

      id v28 = 0;
    }
    else
    {
      id v28 = AMSError();
    }
  }
  if (v31) {
    v31[2](v31, v32, v28);
  }
}

- (id)_createScorerWithAction:(unint64_t)a3 account:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v43 = a4;
  id v44 = a5;
  char v41 = [(AMSDPurchaseService *)self _serverEndpointIdentifierForFDSAction:a3];
  uint64_t v10 = [[wumZ2SSA5KbWdu7E alloc] initWithServerEndpointIdentifier:v41];
  if (v10)
  {
    id v11 = objc_msgSend(v43, "ams_firstName");
    int v12 = objc_msgSend(v43, "ams_lastName");
    __int16 v42 = +[AMSDevice phoneNumber];
    id v13 = [v43 username];
    uint64_t v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      uint64_t v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = AMSLogKey();
      AMSHashIfNeeded();
      id v18 = v40 = v13;
      AMSHashIfNeeded();
      id v19 = v39 = v11;
      id v20 = AMSHashIfNeeded();
      AMSHashIfNeeded();
      unint64_t v21 = v38 = v12;
      *(_DWORD *)buf = 138544642;
      uint64_t v46 = v16;
      __int16 v47 = 2114;
      __int16 v48 = v17;
      __int16 v49 = 2112;
      __int16 v50 = v18;
      __int16 v51 = 2112;
      v52 = v19;
      __int16 v53 = 2112;
      v54 = v20;
      __int16 v55 = 2112;
      v56 = v21;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Creating FDS context, firstName = %@ | lastName = %@ | phoneNumber = %@ | username = %@", buf, 0x3Eu);

      int v12 = v38;
      id v11 = v39;

      id v13 = v40;
    }

    id v22 = objc_alloc_init((Class)NSMutableSet);
    if (v11 && v12)
    {
      id v23 = [[cBEET4QRedIfcDrp alloc] initWithFirstName:v11 lastName:v12 source:0];
      if (v23) {
        [v22 addObject:v23];
      }
    }
    if (v13)
    {
      id v24 = [[cBEET4QRedIfcDrp alloc] initWithEmailAddress:v13 source:1];
      if (v24) {
        [v22 addObject:v24];
      }
    }
    [(wumZ2SSA5KbWdu7E *)v10 setIdentities:v22];
    if (v42) {
      [(wumZ2SSA5KbWdu7E *)v10 setPhoneNumber:v42];
    }
    [(wumZ2SSA5KbWdu7E *)v10 setCallerID:v44];
    id v25 = +[AMSLogConfig sharedConfig];
    if (!v25)
    {
      id v25 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = objc_opt_class();
      id v28 = AMSLogKey();
      AMSHashIfNeeded();
      id v29 = v12;
      id v31 = v30 = v11;
      *(_DWORD *)buf = 138543874;
      uint64_t v46 = v27;
      __int16 v47 = 2114;
      __int16 v48 = v28;
      __int16 v49 = 2112;
      __int16 v50 = v31;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Registering FDS Bundle: %@", buf, 0x20u);

      id v11 = v30;
      int v12 = v29;
    }
    id v32 = +[CerKRQOmMu7LBUoc scorerWithContext:v10];
  }
  else
  {
    char v33 = +[AMSLogConfig sharedConfig];
    if (!v33)
    {
      char v33 = +[AMSLogConfig sharedConfig];
    }
    id v34 = [v33 OSLogObject];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = objc_opt_class();
      uint64_t v36 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v35;
      __int16 v47 = 2114;
      __int16 v48 = v36;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create an ASScorerContext.", buf, 0x16u);
    }
    if (a6)
    {
      AMSError();
      id v32 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v32 = 0;
    }
  }

  return v32;
}

- (void)_generateODIFDSWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 options];
  id v9 = [v8 action];

  if (v9 == (id)4)
  {
    uint64_t v10 = [v6 purchaseIdentifier];
    id v11 = +[NSString stringWithFormat:@"%@", v10];

    uint64_t v12 = AMSODIServiceIdentifierAmpPaidBuy;
    id v13 = [v6 accountType];
    uint64_t v14 = [v6 options];
    id v15 = [v14 bundleIdentifier];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10004D8B8;
    v25[3] = &unk_100113C78;
    id v26 = v6;
    uint64_t v27 = self;
    id v28 = v7;
    [(AMSDPurchaseService *)self _createODISessionWithSessionIdentifier:v12 cacheIdentifier:v11 accountType:v13 bundleIdentifier:v15 completion:v25];
  }
  else
  {
    uint64_t v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      id v19 = [v6 logKey];
      id v20 = [v6 options];
      unint64_t v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 action]);
      *(_DWORD *)buf = 138543874;
      uint64_t v30 = v18;
      __int16 v31 = 2114;
      id v32 = v19;
      __int16 v33 = 2114;
      id v34 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ODI evaluation not supported for action: %{public}@", buf, 0x20u);
    }
    id v22 = [v6 options];
    id v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 action]);
    id v24 = +[NSString stringWithFormat:@"Action not supported: %@", v23];
    id v11 = AMSError();

    if (v7) {
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
}

- (void)_generateLegacyFDSWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  __int16 v51 = (void (**)(id, id, id))a4;
  id v7 = objc_alloc_init((Class)AMSMutablePromise);
  id v8 = [v6 options];
  id v9 = [v8 action];
  uint64_t v10 = [v6 account];
  id v11 = [v6 options];
  uint64_t v12 = [v11 bundleIdentifier];
  id v59 = 0;
  id v13 = [(AMSDPurchaseService *)self _createScorerWithAction:v9 account:v10 bundleIdentifier:v12 error:&v59];
  id v14 = v59;

  id v15 = &swift_willThrow_ptr;
  if (v13)
  {
    id v49 = v14;
    uint64_t v16 = [(id)objc_opt_class() _fdsEvaluatorCacheAccessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004E730;
    block[3] = &unk_100113B38;
    block[4] = self;
    id v17 = v13;
    id v57 = v17;
    id v18 = v6;
    id v58 = v18;
    dispatch_sync(v16, block);

    [v17 prepareScoreMessage];
    id v19 = objc_alloc_init(RvCyrXrrh7eJhtzx);
    [(RvCyrXrrh7eJhtzx *)v19 setNonce:0];
    id v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      id v20 = +[AMSLogConfig sharedConfig];
    }
    unint64_t v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      [v18 logKey];
      id v23 = v22 = v7;
      *(_DWORD *)buf = 138543362;
      uint64_t v61 = (uint64_t)v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AMSDSecurityService: [%{public}@] Generating FDS.", buf, 0xCu);

      id v7 = v22;
    }

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10004E7A4;
    v53[3] = &unk_100113CA0;
    id v54 = v18;
    id v55 = v7;
    [v17 scoreWithScoreRequest:v19 completionHandler:v53];

    id v15 = &swift_willThrow_ptr;
    id v14 = v49;
  }
  else
  {
    id v24 = +[AMSLogConfig sharedConfig];
    if (!v24)
    {
      id v24 = +[AMSLogConfig sharedConfig];
    }
    id v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_opt_class();
      [v6 logKey];
      id v28 = v27 = v7;
      *(_DWORD *)buf = 138543874;
      uint64_t v61 = v26;
      __int16 v62 = 2114;
      v63 = v28;
      __int16 v64 = 2114;
      id v65 = v14;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create FDS with error: %{public}@", buf, 0x20u);

      id v7 = v27;
    }
  }
  id v52 = v14;
  id v29 = [v7 resultWithTimeout:&v52 error:4.0];
  id v30 = v52;

  if (v51)
  {
    id v50 = v7;
    __int16 v31 = [v15[175] sharedConfig];
    if (!v31)
    {
      __int16 v31 = [v15[175] sharedConfig];
    }
    id v32 = [v31 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = objc_opt_class();
      id v34 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v61 = v33;
      __int16 v62 = 2114;
      v63 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Generating base64-encoded AFDS", buf, 0x16u);
    }
    id v35 = objc_alloc_init((Class)NSMutableString);
    id v36 = v29;
    __int16 v37 = (unsigned __int8 *)[v36 bytes];
    if ([v36 length])
    {
      unint64_t v38 = 0;
      do
        objc_msgSend(v35, "appendFormat:", @"%02x", v37[v38++]);
      while ((unint64_t)[v36 length] > v38);
    }
    if ([v35 length])
    {
      uint64_t v39 = [v15[175] sharedConfig];
      if (!v39)
      {
        uint64_t v39 = [v15[175] sharedConfig];
      }
      __int16 v48 = v13;
      uint64_t v40 = [v39 OSLogObject];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v41 = objc_opt_class();
        __int16 v42 = AMSLogKey();
        id v43 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543874;
        uint64_t v61 = v41;
        __int16 v62 = 2114;
        v63 = v42;
        __int16 v64 = 2114;
        id v65 = v43;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully generated AFDS = %{public}@", buf, 0x20u);
      }
      id v44 = objc_alloc((Class)AMSFDSResult);
      id v45 = [v35 copy];
      uint64_t v46 = [v6 options];
      id v47 = objc_msgSend(v44, "initWithValue:action:", v45, objc_msgSend(v46, "action"));

      v51[2](v51, v47, v30);
      id v7 = v50;
      id v13 = v48;
    }
    else
    {
      AMSError();
      id v47 = (id)objc_claimAutoreleasedReturnValue();
      v51[2](v51, 0, v47);
      id v7 = v50;
    }
  }
}

- (id)_serverEndpointIdentifierForFDSAction:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_100113E28[a3];
  }
}

+ (id)_fdsConsumedCache
{
  if (qword_1001303D0 != -1) {
    dispatch_once(&qword_1001303D0, &stru_100113CC0);
  }
  v2 = (void *)qword_1001303D8;
  return v2;
}

+ (id)_fdsConsumedCacheAccessQueue
{
  if (qword_1001303E0 != -1) {
    dispatch_once(&qword_1001303E0, &stru_100113CE0);
  }
  v2 = (void *)qword_1001303E8;
  return v2;
}

+ (id)_fdsEvaluatorCache
{
  if (qword_1001303F0 != -1) {
    dispatch_once(&qword_1001303F0, &stru_100113D00);
  }
  v2 = (void *)qword_1001303F8;
  return v2;
}

+ (id)_fdsEvaluatorCacheAccessQueue
{
  if (qword_100130400 != -1) {
    dispatch_once(&qword_100130400, &stru_100113D20);
  }
  v2 = (void *)qword_100130408;
  return v2;
}

+ (id)_fdsResultCache
{
  if (qword_100130410 != -1) {
    dispatch_once(&qword_100130410, &stru_100113D40);
  }
  v2 = (void *)qword_100130418;
  return v2;
}

+ (id)_fdsResultCacheAccessQueue
{
  if (qword_100130420 != -1) {
    dispatch_once(&qword_100130420, &stru_100113D60);
  }
  v2 = (void *)qword_100130428;
  return v2;
}

- (unint64_t)_dsidTypeForAccountType:(unint64_t)a3
{
  if (a3 == 1) {
    return 0;
  }
  if (a3 == 2) {
    return 1;
  }
  unsigned __int8 v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    unsigned __int8 v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = AMSLogKey();
    id v9 = +[NSNumber numberWithUnsignedInteger:a3];
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v8;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unrecognized account type: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  return -1;
}

- (id)_odiAssessmentForSession:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)AMSMutableLazyPromise);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004EFDC;
  v8[3] = &unk_100113DB0;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 initWithBlock:v8];

  return v6;
}

- (unint64_t)_outcomeTypeForOutcome:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (id)_serviceProviderTypeForServiceIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:AMSODIServiceIdentifierAmpPaidBuy])
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    id v4 = (id *)qword_100130490;
    uint64_t v24 = qword_100130490;
    if (!qword_100130490)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10004FDA8;
      uint64_t v26 = &unk_100112770;
      id v27 = &v21;
      id v5 = (void *)sub_10004FA4C();
      id v6 = dlsym(v5, "ODIServiceProviderIdAmpPaidBuy");
      *(void *)(v27[1] + 24) = v6;
      qword_100130490 = *(void *)(v27[1] + 24);
      id v4 = (id *)v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v4) {
      sub_1000CB5C0();
    }
LABEL_25:
    id v15 = *v4;
    goto LABEL_26;
  }
  if ([v3 isEqualToString:AMSODISessionIdentifierApplicationCreate])
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    id v4 = (id *)qword_100130498;
    uint64_t v24 = qword_100130498;
    if (!qword_100130498)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10004FDF8;
      uint64_t v26 = &unk_100112770;
      id v27 = &v21;
      uint64_t v7 = (void *)sub_10004FA4C();
      id v8 = dlsym(v7, "ODIServiceProviderIdApplicationCreate");
      *(void *)(v27[1] + 24) = v8;
      qword_100130498 = *(void *)(v27[1] + 24);
      id v4 = (id *)v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v4) {
      sub_1000CB5C0();
    }
    goto LABEL_25;
  }
  if ([v3 isEqualToString:AMSODISessionIdentifierApplicationSubmit])
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    id v4 = (id *)qword_1001304A0;
    uint64_t v24 = qword_1001304A0;
    if (!qword_1001304A0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10004FE48;
      uint64_t v26 = &unk_100112770;
      id v27 = &v21;
      id v9 = (void *)sub_10004FA4C();
      int v10 = dlsym(v9, "ODIServiceProviderIdApplicationSubmit");
      *(void *)(v27[1] + 24) = v10;
      qword_1001304A0 = *(void *)(v27[1] + 24);
      id v4 = (id *)v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v4) {
      sub_1000CB5C0();
    }
    goto LABEL_25;
  }
  if ([v3 isEqualToString:AMSODISessionIdentifierIdUpdate])
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    id v4 = (id *)qword_1001304A8;
    uint64_t v24 = qword_1001304A8;
    if (!qword_1001304A8)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10004FE98;
      uint64_t v26 = &unk_100112770;
      id v27 = &v21;
      uint64_t v11 = (void *)sub_10004FA4C();
      __int16 v12 = dlsym(v11, "ODIServiceProviderIdIdUpdate");
      *(void *)(v27[1] + 24) = v12;
      qword_1001304A8 = *(void *)(v27[1] + 24);
      id v4 = (id *)v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v4) {
      sub_1000CB5C0();
    }
    goto LABEL_25;
  }
  if ([v3 isEqualToString:AMSODISessionIdentifierTDMTrustedInference])
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    id v4 = (id *)qword_1001304B0;
    uint64_t v24 = qword_1001304B0;
    if (!qword_1001304B0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10004FEE8;
      uint64_t v26 = &unk_100112770;
      id v27 = &v21;
      id v13 = (void *)sub_10004FA4C();
      __int16 v14 = dlsym(v13, "ODIServiceProviderIdTDMTrustedInference");
      *(void *)(v27[1] + 24) = v14;
      qword_1001304B0 = *(void *)(v27[1] + 24);
      id v4 = (id *)v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v4) {
      sub_1000CB5C0();
    }
    goto LABEL_25;
  }
  id v17 = +[AMSLogConfig sharedConfig];
  id v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = objc_opt_class();
    id v20 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to parse ODI service identifier: %{public}@", buf, 0x20u);
  }
  id v15 = 0;
LABEL_26:

  return v15;
}

+ (id)_odiSessionCache
{
  if (qword_100130430 != -1) {
    dispatch_once(&qword_100130430, &stru_100113DD0);
  }
  v2 = (void *)qword_100130438;
  return v2;
}

+ (id)_odiSessionCacheAccessQueue
{
  if (qword_100130440 != -1) {
    dispatch_once(&qword_100130440, &stru_100113DF0);
  }
  v2 = (void *)qword_100130448;
  return v2;
}

@end