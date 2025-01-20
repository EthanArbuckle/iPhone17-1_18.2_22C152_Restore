@interface PerformPurchaseTask
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)mainWithCompletionHandler:(id)a3;
@end

@implementation PerformPurchaseTask

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void *, id))a6;
  v12 = *(NSMutableDictionary **)((char *)&self->_presenters + 2);
  v13 = [v10 uniqueIdentifier];
  v14 = [v12 objectForKeyedSubscript:v13];

  if ((+[AMSDevice deviceIsAppleWatch] & 1) != 0
    || ([v14 useLocalAuthAndSystemDialogs] & 1) != 0
    || [v14 useLocalAuthAndInteractiveDialogs])
  {
    v16 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v10 logUUID];
      *(_DWORD *)buf = 138543362;
      v39 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending authentication request", buf, 0xCu);
    }
    id v18 = objc_alloc((Class)AMSAuthenticateTask);
    v19 = sub_10030B11C();
    id v20 = [v18 initWithRequest:v9 bag:v19];

    [v20 setDelegate:self];
    v21 = [v20 performAuthentication];
    id v37 = 0;
    v22 = [v21 resultWithError:&v37];
    id v23 = v37;

    if (v23)
    {
      v24 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v32 = [v10 logUUID];
        *(_DWORD *)buf = 138543618;
        v39 = v32;
        __int16 v40 = 2114;
        id v41 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Failed authentication request with error %{public}@", buf, 0x16u);
      }
    }
    v11[2](v11, v22, v23);
  }
  else
  {
    id Property = *(id *)(&self->super._finished + 1);
    if (Property) {
      id Property = objc_getProperty(Property, v15, 40, 1);
    }
    id v26 = Property;
    v27 = [v26 notificationClient];

    v28 = ASDLogHandleForCategory();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v27)
    {
      if (v29)
      {
        v30 = [v14 logKey];
        *(_DWORD *)buf = 138412546;
        v39 = v30;
        __int16 v40 = 2114;
        id v41 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%@] Sending authentication request to client %{public}@", buf, 0x16u);
      }
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100310AC8;
      v33[3] = &unk_100527D20;
      id v34 = v14;
      id v20 = v27;
      id v35 = v20;
      v36 = v11;
      [v20 deliverAuthenticateRequest:v9 withResultHandler:v33];

      id v23 = v34;
    }
    else
    {
      if (v29)
      {
        v31 = [v14 logKey];
        *(_DWORD *)buf = 138412290;
        v39 = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%@] No client available to handle authentication request", buf, 0xCu);
      }
      ASDErrorWithDescription();
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0, v23);
      id v20 = 0;
    }
  }
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void *, id))a6;
  v12 = *(NSMutableDictionary **)((char *)&self->_presenters + 2);
  v13 = [v10 uniqueIdentifier];
  v14 = [v12 objectForKeyedSubscript:v13];

  unsigned int v15 = [v14 useLocalAuthAndSystemDialogs];
  if (+[AMSDevice deviceIsMac]) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    v17 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v34 = [v14 logKey];
      *(_DWORD *)buf = 138412290;
      v45 = v34;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%@] System Dialogs are not supports on macOS. Using remote dialog requests", buf, 0xCu);
    }
    unsigned int v15 = 0;
  }
  if ((+[AMSDevice deviceIsAppleWatch] & 1) != 0 || v15)
  {
    v25 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [v14 logKey];
      *(_DWORD *)buf = 138412290;
      v45 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[%@] Sending dialog request", buf, 0xCu);
    }
    id v21 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v9];
    v27 = [v21 present];
    id v43 = 0;
    v28 = [v27 resultWithError:&v43];
    id v24 = v43;

    if (v24)
    {
      BOOL v29 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        id v35 = [v14 logKey];
        *(_DWORD *)buf = 138412546;
        v45 = v35;
        __int16 v46 = 2114;
        id v47 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[%@] Error sending dialog request: %{public}@", buf, 0x16u);
      }
    }
    v11[2](v11, v28, v24);
  }
  else
  {
    id Property = *(id *)(&self->super._finished + 1);
    if (Property) {
      id Property = objc_getProperty(Property, v18, 40, 1);
    }
    id v20 = Property;
    id v21 = [v20 notificationClient];

    if ([v14 useLocalAuthAndInteractiveDialogs])
    {
      v22 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [v14 logKey];
        *(_DWORD *)buf = 138412290;
        v45 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%@] Sending interactive dialog request", buf, 0xCu);
      }
      sub_1003104E4((uint64_t)self, v10);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10031121C;
      v40[3] = &unk_100524170;
      id v41 = v10;
      v42 = v11;
      [v24 presentDialogRequest:v9 resultHandler:v40];
    }
    else
    {
      v30 = ASDLogHandleForCategory();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v31)
        {
          v32 = [v14 logKey];
          *(_DWORD *)buf = 138412546;
          v45 = v32;
          __int16 v46 = 2114;
          id v47 = v21;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%@] Sending dialog request to client %{public}@", buf, 0x16u);
        }
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100311330;
        v36[3] = &unk_100527D48;
        id v37 = v14;
        id v21 = v21;
        id v38 = v21;
        v39 = v11;
        [v21 deliverDialogRequest:v9 withResultHandler:v36];

        id v24 = v37;
      }
      else
      {
        if (v31)
        {
          v33 = [v14 logKey];
          *(_DWORD *)buf = 138412290;
          v45 = v33;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%@] No client available to handle dialog request", buf, 0xCu);
        }
        ASDErrorWithDescription();
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        v11[2](v11, 0, v24);
        id v21 = 0;
      }
    }
  }
}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = *(NSMutableDictionary **)((char *)&self->_presenters + 2);
  v13 = [v10 uniqueIdentifier];
  v14 = [v12 objectForKeyedSubscript:v13];

  id Property = *(id *)(&self->super._finished + 1);
  if (Property) {
    id Property = objc_getProperty(Property, v15, 40, 1);
  }
  id v17 = Property;
  id v18 = [v17 notificationClient];

  if ([v14 useLocalAuthAndInteractiveDialogs])
  {
    v19 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v14 logKey];
      *(_DWORD *)buf = 138412290;
      id v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%@] Sending interactive engagement request", buf, 0xCu);
    }
    id v21 = sub_1003104E4((uint64_t)self, v10);
    v22 = [v14 clientInfo];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100311800;
    v31[3] = &unk_100527D70;
    id v32 = v10;
    id v33 = v11;
    [v21 presentEngagementRequest:v9 withClientInfo:v22 resultHandler:v31];
  }
  else
  {
    id v23 = ASDLogHandleForCategory();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v24)
      {
        v25 = [v10 logUUID];
        *(_DWORD *)buf = 138543618;
        id v35 = v25;
        __int16 v36 = 2114;
        id v37 = v18;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending engagement request to client %{public}@", buf, 0x16u);
      }
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100311914;
      v27[3] = &unk_100527D98;
      id v28 = v10;
      id v29 = v18;
      id v30 = v11;
      [v29 deliverEngagementRequest:v9 withResultHandler:v27];

      id v21 = v28;
    }
    else
    {
      if (v24)
      {
        id v26 = [v10 logUUID];
        *(_DWORD *)buf = 138543362;
        id v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] No client available to handle engagement request", buf, 0xCu);
      }
      id v21 = ASDErrorWithDescription();
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v21);
    }
  }
}

- (void)mainWithCompletionHandler:(id)a3
{
  id v106 = a3;
  v109 = +[NSMutableArray array];
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  sub_1002AFF78(*(id **)(&self->super._finished + 1));
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v113 = [obj countByEnumeratingWithState:&v122 objects:v132 count:16];
  if (v113)
  {
    id v3 = 0;
    uint64_t v112 = *(void *)v123;
    uint64_t v107 = AMSBuyParamPropertyPricingParameters;
    while (1)
    {
      v4 = 0;
      do
      {
        if (*(void *)v123 != v112) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v122 + 1) + 8 * (void)v4);
        v6 = [v5 account];
        v7 = objc_msgSend(v6, "ams_DSID");

        v8 = [v5 account];
        id v9 = [v8 username];

        if (v3)
        {
LABEL_7:
          id v10 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            id v38 = [v5 logKey];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v38;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v3;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%@] Failing purchase due to batch error: %{public}@", buf, 0x16u);
          }
          id v11 = [v5 account];
          v12 = objc_msgSend(v11, "ams_DSID");
          v13 = sub_1003DDB9C((uint64_t)StoreItemResponse, v3, v12);
          [v5 setItemResponse:v13];

          goto LABEL_51;
        }
        v14 = [v5 appCapabilities];
        BOOL v15 = v14 == 0;

        if (!v15)
        {
          BOOL v16 = [v5 updateType] != 0;
          id v17 = +[AppCapabilitiesService defaultService];
          id v18 = [v5 bundleID];
          v19 = [v5 appCapabilities];
          id v20 = [v5 logKey];
          id v121 = 0;
          unsigned int v21 = [v17 validateAction:v16 bundleID:v18 capabilities:v19 logKey:v20 error:&v121];
          id v22 = v121;

          if (v21)
          {
          }
          else
          {
            id v3 = v22;
            if ([v5 isUserInitiated]
              && ([v5 suppressDialogs] & 1) == 0)
            {
              id v23 = +[AppCapabilitiesService defaultService];
              [v23 showIneligibleAlert];
            }
            if (v3) {
              goto LABEL_7;
            }
          }
        }
        id v24 = v5;
        if ([v24 purchaseType] != (id)4 && objc_msgSend(v24, "purchaseType") != (id)1)
        {
          uint64_t v32 = 0;
          goto LABEL_31;
        }
        v25 = sub_10030B11C();
        id v126 = 0;
        id v26 = sub_10030B948((uint64_t)v25, @"updateProductContentType", &v126);
        id v27 = v126;

        if (!v26 || v27)
        {
          if (v27)
          {
            id v33 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v83 = [v24 logKey];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v83;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v27;
              _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "[%@] Encountered bag error while fetching updateProduct content type: %@", buf, 0x16u);
            }
LABEL_27:
          }
LABEL_28:
          uint64_t v32 = 0;
          goto LABEL_29;
        }
        id v28 = [v26 lowercaseString];
        unsigned __int8 v29 = [v28 isEqualToString:@"application/x-apple-plist"];

        if (v29) {
          goto LABEL_28;
        }
        id v30 = [v26 lowercaseString];
        unsigned __int8 v31 = [v30 isEqualToString:@"application/json"];

        if ((v31 & 1) == 0)
        {
          id v33 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v39 = [v24 logKey];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v39;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[%@] Encountered unrecognized content type for updateProduct call from bag", buf, 0xCu);
          }
          goto LABEL_27;
        }
        uint64_t v32 = 1;
LABEL_29:

LABEL_31:
        [v24 setUseJSONContentType:v32];
        if ([v24 purchaseType] == (id)2)
        {
          id v34 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            id v35 = [v24 logKey];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v35;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[%@] No account required for AMSPurchaseTypeDownloadProduct", buf, 0xCu);
          }
          goto LABEL_48;
        }
        if ([v24 isMachineBased])
        {
          id v34 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v36 = [v24 logKey];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v36;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[%@] No account required for machine based purchase", buf, 0xCu);
          }
          goto LABEL_48;
        }
        if (v7)
        {
          id v37 = +[ACAccountStore ams_sharedAccountStore];
          id v34 = objc_msgSend(v37, "ams_iTunesAccountWithDSID:", v7);

          if (v34)
          {
            [v24 setAccount:v34];
            goto LABEL_48;
          }
          v51 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            v52 = [v24 logKey];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v52;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "[%@] Account provided but we couldn't find it on this device", buf, 0xCu);
          }
          if ([v24 isDiscretionary]) {
            goto LABEL_63;
          }
          if (![v9 length])
          {
            v53 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              v96 = [v24 logKey];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v96;
              _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "[%@] Purchase has a dsID but no username to authenticate", buf, 0xCu);
            }
            goto LABEL_59;
          }
        }
        else
        {
          __int16 v40 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            id v41 = [v24 logKey];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[%@] No account provided", buf, 0xCu);
          }
          v42 = +[ACAccountStore ams_sharedAccountStore];
          id v34 = objc_msgSend(v42, "ams_activeiTunesAccount");

          id v43 = ASDLogHandleForCategory();
          BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
          if (v34)
          {
            if (v44)
            {
              v45 = [v24 logKey];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v45;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[%@] Active iTunes account found, using that", buf, 0xCu);
            }
            [v24 setAccount:v34];
LABEL_48:

            sub_1003E31F8((uint64_t)AMSPurchase, v24);
            id v11 = (unsigned char *)objc_claimAutoreleasedReturnValue();
            __int16 v46 = *(NSMutableDictionary **)((char *)&self->_presenters + 2);
            id v47 = [v11 uniqueIdentifier];
            [v46 setObject:v24 forKeyedSubscript:v47];

            [v109 addObject:v11];
            v12 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v48 = [v24 logKey];
              v49 = [v24 buyParams];
              v50 = [v49 stringValue];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v48;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v50;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%@] Purchasing with parameters: %{public}@", buf, 0x16u);
            }
LABEL_50:
            id v3 = 0;
            goto LABEL_51;
          }
          if (v44)
          {
            v56 = [v24 logKey];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v56;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[%@] No active iTunes account found", buf, 0xCu);
          }
          if ([v24 isDiscretionary])
          {
LABEL_63:
            v53 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              v91 = [v24 logKey];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v91;
              _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "[%@] No account for discretionary purchase", buf, 0xCu);
            }
LABEL_59:

            ASDErrorWithDescription();
            id v11 = (unsigned char *)objc_claimAutoreleasedReturnValue();
            v12 = [v24 account];
            v54 = [v12 ams_DSID];
            v55 = sub_1003DDB9C((uint64_t)StoreItemResponse, v11, v54);
            [v24 setItemResponse:v55];

            goto LABEL_50;
          }
        }
        v57 = ASDLogHandleForCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          v58 = [v24 logKey];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v58;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "[%@] Prompting for account", buf, 0xCu);
        }
        v59 = [PromptForAccountTask alloc];
        v60 = [v24 logKey];
        id v11 = sub_1002EC6E8((id *)&v59->super.super.super.isa, v9, v60);

        v61 = [v24 buyParams];
        v12 = [v61 parameterForKey:v107];

        if (v12)
        {
          unsigned int v62 = [v12 isEqualToString:@"GAMEPRE"];
          unsigned int v63 = v11 ? v62 : 0;
          if (v63 == 1) {
            v11[48] = 1;
          }
        }
        v65 = [v24 requestToken];
        if (v11) {
          objc_setProperty_atomic(v11, v64, v65, 72);
        }

        sub_1002B2A3C();
        v66 = (id *)objc_claimAutoreleasedReturnValue();
        v131 = v11;
        v67 = +[NSArray arrayWithObjects:&v131 count:1];
        if (v66) {
          [v66[1] addOperations:v67 waitUntilFinished:1];
        }

        if (v11) {
          id Property = objc_getProperty(v11, v68, 56, 1);
        }
        else {
          id Property = 0;
        }
        id v70 = Property;
        v71 = [v70 account];

        if (v71)
        {
          if (v11) {
            id v73 = objc_getProperty(v11, v72, 56, 1);
          }
          else {
            id v73 = 0;
          }
          id v74 = v73;
          v75 = [v74 account];
          [v24 setAccount:v75];

          v76 = [v24 buyParams];
          [v76 setParameter:&__kCFBooleanTrue forKey:@"hasBeenAuthedForBuy"];

          sub_1003E31F8((uint64_t)AMSPurchase, v24);
          id v108 = (id)objc_claimAutoreleasedReturnValue();
          v77 = *(NSMutableDictionary **)((char *)&self->_presenters + 2);
          v78 = [v108 uniqueIdentifier];
          [v77 setObject:v24 forKeyedSubscript:v78];

          [v109 addObject:v108];
          v79 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            v80 = [v24 logKey];
            v81 = [v24 buyParams];
            v82 = [v81 stringValue];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v80;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v82;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "[%@] Purchasing with parameters: %{public}@", buf, 0x16u);
          }
          id v3 = 0;
        }
        else
        {
          uint64_t v84 = *(void *)(&self->super._finished + 1);
          if (v84 && *(unsigned char *)(v84 + 24))
          {
            if (v11) {
              id v85 = objc_getProperty(v11, v72, 32, 1);
            }
            else {
              id v85 = 0;
            }
            id v3 = v85;
          }
          else
          {
            id v3 = 0;
          }
          v86 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            v93 = [v24 logKey];
            if (v11) {
              id v94 = objc_getProperty(v11, v92, 32, 1);
            }
            else {
              id v94 = 0;
            }
            id v95 = v94;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v93;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v95;
            _os_log_error_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "[%@] No account for purchase: %{public}@", buf, 0x16u);
          }
          if (v11) {
            id v88 = objc_getProperty(v11, v87, 32, 1);
          }
          else {
            id v88 = 0;
          }
          id v108 = v88;
          v79 = [v24 account];
          v89 = [v79 ams_DSID];
          v90 = sub_1003DDB9C((uint64_t)StoreItemResponse, v108, v89);
          [v24 setItemResponse:v90];
        }
LABEL_51:

        v4 = (char *)v4 + 1;
      }
      while (v113 != v4);
      id v97 = [obj countByEnumeratingWithState:&v122 objects:v132 count:16];
      id v113 = v97;
      if (!v97) {
        goto LABEL_108;
      }
    }
  }
  id v3 = 0;
LABEL_108:

  if ([v109 count])
  {
    id v98 = objc_alloc((Class)AMSPurchaseQueueConfiguration);
    v99 = sub_10030B11C();
    id v100 = [v98 initWithBag:v99];

    [v100 setDelegate:self];
    v101 = (PurchaseBatch *)[objc_alloc((Class)AMSPurchaseQueue) initWithConfiguration:v100];
    v102 = *(PurchaseBatch **)((char *)&self->_purchaseBatch + 2);
    *(PurchaseBatch **)((char *)&self->_purchaseBatch + 2) = v101;

    v103 = [*(id *)((char *)&self->_purchaseBatch + 2) enquePurchases:v109];
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_100312C7C;
    v119[3] = &unk_100521910;
    id v104 = v100;
    id v120 = v104;
    [v103 addErrorBlock:v119];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v128 = sub_1000181B8;
    v129 = sub_100017C98;
    id v130 = 0;
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_100312D70;
    v116[3] = &unk_100527DC0;
    v116[4] = self;
    v118 = buf;
    id v105 = v104;
    id v117 = v105;
    [v103 addSuccessBlock:v116];
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472;
    v114[2] = sub_100313774;
    v114[3] = &unk_100527DE8;
    id v115 = v106;
    [v103 addFinishBlock:v114];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    (*((void (**)(id, void))v106 + 2))(v106, 0);
  }
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting dialog task", buf, 0xCu);
  }

  id v10 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v8];
  id v11 = [v10 present];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100313934;
  v13[3] = &unk_100524170;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v11 addFinishBlock:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_purchasing + 2), 0);
  objc_storeStrong((id *)((char *)&self->_presenters + 2), 0);
  objc_storeStrong((id *)((char *)&self->_purchaseQueue + 2), 0);
  objc_storeStrong((id *)((char *)&self->_purchaseBatch + 2), 0);
  objc_storeStrong((id *)(&self->super._finished + 1), 0);
}

@end