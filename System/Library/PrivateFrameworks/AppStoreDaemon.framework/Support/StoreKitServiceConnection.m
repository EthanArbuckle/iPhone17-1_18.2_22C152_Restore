@interface StoreKitServiceConnection
- (void)addPostbacksFromDictionaries:(id)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)configureSourceForTestPostbackDictionaries:(id)a3 forBundleID:(id)a4 completion:(id)a5;
- (void)developerPostbackURLForBundleID:(id)a3 completion:(id)a4;
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4;
- (void)retrieveTestPostbacksForBundleID:(id)a3 completion:(id)a4;
- (void)sendTestPingbackForBundleID:(id)a3 completion:(id)a4;
- (void)validateSKAdNetworkImpression:(id)a3 withPublicKey:(id)a4 forBundleID:(id)a5 source:(int64_t)a6 completion:(id)a7;
@end

@implementation StoreKitServiceConnection

- (void)addPostbacksFromDictionaries:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  unsigned __int8 v11 = sub_10027EB6C(self, @"com.apple.private.storekit.octane-ad-network");
  v12 = ASDLogHandleForCategory();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v37 = self;
      __int16 v38 = 2082;
      v39 = "-[StoreKitServiceConnection addPostbacksFromDictionaries:forBundleID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
    }

    v14 = sub_1003C44E0();
    int v15 = sub_1003CD174((uint64_t)v14, v9);

    v16 = ASDLogHandleForCategory();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Prior mock postbacks cleared.", buf, 2u);
      }

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v16 = v8;
      id v18 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v18)
      {
        id v19 = v18;
        id v30 = v8;
        uint64_t v20 = *(void *)v32;
        while (1)
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(v16);
            }
            v22 = sub_10027BF9C((uint64_t)InstallAttributionPingback, *(void **)(*((void *)&v31 + 1) + 8 * i));
            sub_10027D6CC((uint64_t)v22, v9);
            v23 = sub_1003C44E0();
            int v24 = sub_1003CCC28((uint64_t)v23, v22);

            v25 = ASDLogHandleForCategory();
            BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
            if (v24)
            {
              if (!v26) {
                goto LABEL_18;
              }
              *(_WORD *)buf = 0;
              v27 = v25;
              v28 = "Mock postback added.";
            }
            else
            {
              if (!v26) {
                goto LABEL_18;
              }
              *(_WORD *)buf = 0;
              v27 = v25;
              v28 = "Adding mock postback failed.";
            }
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
LABEL_18:
          }
          id v19 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (!v19)
          {
            id v8 = v30;
            break;
          }
        }
      }
    }
    else if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Clearing prior postbacks failed. Not adding new ones", buf, 2u);
    }

    v10[2](v10, 0);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v37 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Process is not entitled for SKAdNetwork test methods", buf, 0xCu);
    }

    v29 = ASDErrorWithTitleAndMessage();
    ((void (**)(id, void *))v10)[2](v10, v29);
  }
}

- (void)developerPostbackURLForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  unsigned __int8 v8 = sub_10027EB6C(self, @"com.apple.private.storekit.octane-ad-network");
  id v9 = ASDLogHandleForCategory();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      __int16 v22 = 2082;
      v23 = "-[StoreKitServiceConnection developerPostbackURLForBundleID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
    }

    id v19 = 0;
    unsigned __int8 v11 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v19];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = sub_100296F10(v11);
      v14 = (void *)v13;
      if (v13)
      {
        int v15 = sub_1002F205C(v13);
        v16 = sub_10027C7E8((uint64_t)InstallAttributionPingback, v15);
        BOOL v17 = +[NSURL URLWithString:v16];
      }
      else
      {
        BOOL v17 = 0;
      }
      v7[2](v7, v17);
    }
    else
    {
      id v18 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "App record not found:%@", buf, 0xCu);
      }

      if (v7) {
        v7[2](v7, 0);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Process is not entitled for SKAdNetwork test methods", buf, 0xCu);
    }

    v7[2](v7, 0);
  }
}

- (void)retrieveTestPostbacksForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  unsigned __int8 v8 = sub_10027EB6C(self, @"com.apple.private.storekit.octane-ad-network");
  id v9 = ASDLogHandleForCategory();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      v14 = self;
      __int16 v15 = 2082;
      v16 = "-[StoreKitServiceConnection retrieveTestPostbacksForBundleID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v13, 0x16u);
    }

    unsigned __int8 v11 = sub_1003C44E0();
    v12 = sub_1003CCED4(v11, v6);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      v14 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Process is not entitled for SKAdNetwork test methods", (uint8_t *)&v13, 0xCu);
    }

    v12 = objc_opt_new();
  }
  v7[2](v7, v12);
}

- (void)sendTestPingbackForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = sub_10027EB6C(self, @"com.apple.private.storekit.octane-ad-network");
  id v9 = ASDLogHandleForCategory();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v15 = self;
      __int16 v16 = 2082;
      BOOL v17 = "-[StoreKitServiceConnection sendTestPingbackForBundleID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
    }

    unsigned __int8 v11 = sub_1003C44E0();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10027F1EC;
    v12[3] = &unk_100524958;
    id v13 = v7;
    sub_1003CEF44((uint64_t)v11, v6, v12);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v15 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Process is not entitled for SKAdNetwork test methods", buf, 0xCu);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)validateSKAdNetworkImpression:(id)a3 withPublicKey:(id)a4 forBundleID:(id)a5 source:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  __int16 v15 = (void (**)(id, void *))a7;
  unsigned __int8 v16 = sub_10027EB6C(self, @"com.apple.private.storekit.octane-ad-network");
  BOOL v17 = ASDLogHandleForCategory();
  id v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "-[StoreKitServiceConnection validateSKAdNetworkImpression:withPublicKey:forBundleID:source:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v37 = sub_100017FE8;
    __int16 v38 = sub_100017BB0;
    id v39 = 0;
    if (a6 == 4)
    {
      id v19 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v34 = 138543362;
        v35 = self;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Validating test impression from web", v34, 0xCu);
      }

      uint64_t v20 = sub_1003DB11C();
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10027F744;
      v33[3] = &unk_100524980;
      v33[4] = buf;
      [v20 validateWebAdImpressionResponseProperties:v12 completionHandler:v33];
    }
    else
    {
      __int16 v22 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v34 = 138543362;
        v35 = self;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Validating test web impression from app", v34, 0xCu);
      }

      uint64_t v20 = [v12 objectForKeyedSubscript:@"adNetworkAttributionSignature"];
      if (!v20)
      {
        long long v31 = ASDErrorWithDescription();
        v15[2](v15, v31);

        goto LABEL_22;
      }
      v23 = +[ASDInstallAttributionParamsConfig paramsFromDictionary:v12];
      [v23 setSourceAppBundleId:v14];
      int v24 = [v12 objectForKeyedSubscript:@"fidelity-type"];
      v25 = sub_1003DB11C();
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10027F754;
      v32[3] = &unk_100524980;
      v32[4] = buf;
      [v25 validateImpression:v23 withFidelityType:v24 completionHandler:v32];
    }
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      BOOL v26 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = *(StoreKitServiceConnection **)(*(void *)&buf[8] + 40);
        *(_DWORD *)long long v34 = 138412290;
        v35 = v27;
        v28 = "Validation failed with error:%@";
        v29 = v26;
        uint32_t v30 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, v34, v30);
      }
    }
    else
    {
      BOOL v26 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v34 = 0;
        v28 = "Validation passed.";
        v29 = v26;
        uint32_t v30 = 2;
        goto LABEL_20;
      }
    }

    v15[2](v15, *(void **)(*(void *)&buf[8] + 40));
LABEL_22:
    _Block_object_dispose(buf, 8);

    goto LABEL_23;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Process is not entitled for SKAdNetwork test methods", buf, 0xCu);
  }

  v21 = ASDErrorWithTitleAndMessage();
  v15[2](v15, v21);

LABEL_23:
}

- (void)configureSourceForTestPostbackDictionaries:(id)a3 forBundleID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unsigned __int8 v9 = sub_10027EB6C(self, @"com.apple.private.storekit.octane-ad-network");
  v10 = ASDLogHandleForCategory();
  unsigned __int8 v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543618;
      id v14 = self;
      __int16 v15 = 2082;
      unsigned __int8 v16 = "-[StoreKitServiceConnection configureSourceForTestPostbackDictionaries:forBundleID:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}s", (uint8_t *)&v13, 0x16u);
    }

    id v12 = sub_1003C44E0();
    sub_1003CD4EC((uint64_t)v12, v7, v8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543362;
      id v14 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Process is not entitled for SKAdNetwork test methods", (uint8_t *)&v13, 0xCu);
    }

    id v12 = ASDErrorWithTitleAndMessage();
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v12);
  }
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = sub_10027EB6C(self, @"com.apple.private.storekit.background-auth");
  unsigned __int8 v9 = ASDLogHandleForCategory();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned __int8 v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting authenticate task", buf, 0xCu);
    }

    id v11 = [objc_alloc((Class)AMSAuthenticateTask) initWithRequest:v6];
    [v11 setDelegate:self];
    id v12 = [v11 performAuthentication];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10027FB30;
    v13[3] = &unk_100524148;
    v13[4] = self;
    id v14 = v7;
    [v12 addFinishBlock:v13];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      unsigned __int8 v16 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Process is not entitled for background authentication", buf, 0xCu);
    }

    ASDErrorWithTitleAndMessage();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v11);
  }
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  ASDErrorWithTitleAndMessage();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)handleEngagementRequest:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  ASDErrorWithTitleAndMessage();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  unsigned __int8 v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting dialog task", buf, 0xCu);
  }

  id v10 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v8];
  id v11 = [v10 present];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10027FEB4;
  v13[3] = &unk_100524170;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v11 addFinishBlock:v13];
}

@end