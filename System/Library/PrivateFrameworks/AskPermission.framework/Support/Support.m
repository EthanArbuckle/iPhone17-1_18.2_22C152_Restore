uint64_t start()
{
  DaemonRunLoop *v0;

  v0 = objc_alloc_init(DaemonRunLoop);
  [(RunLoop *)v0 runUntilIdleExit];

  return 0;
}

BOOL sub_1000036E0(uint64_t a1, void *a2)
{
  v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    v4 = +[APLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    v7 = *(void **)(a1 + 32);
    id v8 = v6;
    v9 = [v7 request];
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting handle approver local notification task. Request: %{public}@", buf, 0x16u);
  }
  v10 = [*(id *)(a1 + 32) request];
  id v13 = 0;
  +[ProductPagePresenter presentRequest:v10 withError:&v13];
  id v11 = v13;

  if (a2) {
    *a2 = v11;
  }

  return v11 == 0;
}

BOOL sub_100003AB8(uint64_t a1, void *a2)
{
  v4 = &AMSLogableError_ptr;
  v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    v5 = +[APLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    v10 = [v8 payload];
    *(_DWORD *)buf = 138543618;
    v86 = v7;
    __int16 v87 = 2114;
    id v88 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting handle approver remote notification task. Payload: %{public}@", buf, 0x16u);
  }
  +[APDefaults setIsApprover:1];
  +[APDefaults setIsRequester:0];
  id v11 = [*(id *)(a1 + 32) requestStatus];
  uint64_t v12 = [*(id *)(a1 + 32) requestIdentifier];
  id v13 = (void *)v12;
  if (v11 == (id)-2 || !v12)
  {
    APError();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_46;
  }
  if ((unint64_t)v11 <= 1)
  {
    v14 = +[LocalNotificationHandler sharedHandler];
    v15 = [*(id *)(a1 + 32) requestIdentifier];
    [v14 dismissNotificationWithIdentifier:v15];

    if (_os_feature_enabled_impl())
    {
      __int16 v16 = *(void **)(a1 + 32);
      id v83 = 0;
      v17 = [v16 _approvalRequestWithError:&v83];
      id v18 = v83;
      v19 = +[ApproverStore sharedStore];
      [v19 storeApprovalRequest:v17];

      v20 = +[NSMutableArray array];
      v21 = v20;
      v67 = a2;
      if (v17)
      {
        [v20 addObject:v17];
      }
      else
      {
        v32 = +[APLogConfig sharedDaemonConfig];
        if (!v32)
        {
          v32 = +[APLogConfig sharedConfig];
        }
        v33 = [v32 OSLogObject];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v86 = v34;
          __int16 v87 = 2112;
          id v88 = v18;
          id v35 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@: Unable to create Request to translate to Biome - Error: %@", buf, 0x16u);
        }
      }
      v36 = +[ApproverStore sharedStore];
      v37 = [v17 uniqueIdentifier];
      v38 = [v36 approvalRequestsMatchingUniqueIdentifier:v37];

      v39 = +[APLogConfig sharedDaemonConfig];
      if (!v39)
      {
        v39 = +[APLogConfig sharedConfig];
      }
      id v65 = v18;
      v66 = v13;
      v40 = [v39 OSLogObject];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = objc_opt_class();
        v42 = v21;
        id v43 = v41;
        id v44 = [v38 count];
        *(_DWORD *)buf = 138543618;
        v86 = v41;
        __int16 v87 = 2048;
        id v88 = v44;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: Matching requests found: %lu", buf, 0x16u);

        v21 = v42;
      }

      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id obj = v38;
      id v71 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
      if (v71)
      {
        uint64_t v45 = *(void *)v80;
        v68 = v17;
        v69 = v21;
        do
        {
          for (i = 0; i != v71; i = (char *)i + 1)
          {
            if (*(void *)v80 != v45) {
              objc_enumerationMutation(obj);
            }
            v47 = *(void **)(*((void *)&v79 + 1) + 8 * i);
            v48 = [v4[120] sharedDaemonConfig];
            if (!v48)
            {
              v48 = [v4[120] sharedConfig];
            }
            v49 = [v48 OSLogObject];
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v50 = objc_opt_class();
              uint64_t v51 = a1;
              id v52 = v50;
              [v47 uniqueIdentifier];
              uint64_t v53 = v45;
              v55 = v54 = v4;
              *(_DWORD *)buf = 138543618;
              v86 = v50;
              __int16 v87 = 2114;
              id v88 = v55;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating request: %{public}@", buf, 0x16u);

              v4 = v54;
              uint64_t v45 = v53;

              a1 = v51;
              v17 = v68;
              v21 = v69;
            }

            id v56 = [v17 status];
            v57 = [v17 approverDSID];
            [v47 updateStatus:v56 withApproverDSID:v57];

            v58 = +[ApproverStore sharedStore];
            [v58 storeApprovalRequest:v47];

            [v21 addObject:v47];
          }
          id v71 = [obj countByEnumeratingWithState:&v79 objects:v84 count:16];
        }
        while (v71);
      }

      id v59 = objc_alloc_init((Class)NSOperationQueue);
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_10000433C;
      v77[3] = &unk_1000385F0;
      id v78 = v21;
      id v60 = v21;
      [v59 addOperationWithBlock:v77];

      id v13 = v66;
      a2 = v67;
      id v22 = v65;
      goto LABEL_46;
    }
LABEL_13:
    id v22 = 0;
    goto LABEL_46;
  }
  if (v11 != (id)-1) {
    goto LABEL_13;
  }
  int v23 = _os_feature_enabled_impl();
  v24 = *(void **)(a1 + 32);
  if (v23)
  {
    id v76 = 0;
    v25 = [v24 _approvalRequestWithError:&v76];
    id v22 = v76;
    if (v25)
    {
      v26 = +[ApproverStore sharedStore];
      [v26 storeApprovalRequest:v25];

      +[BiomeHelper donateToBiomeWithRequest:v25];
      v27 = [*(id *)(a1 + 32) bag];
      v28 = [v27 BOOLForKey:@"enable-ks-via-messages"];

      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_100004398;
      v73[3] = &unk_100038618;
      v29 = v25;
      uint64_t v30 = *(void *)(a1 + 32);
      v74 = v29;
      uint64_t v75 = v30;
      [v28 valueWithCompletion:v73];
      v31 = v74;
    }
    else
    {
      v28 = +[APLogConfig sharedDaemonConfig];
      if (!v28)
      {
        v28 = +[APLogConfig sharedConfig];
      }
      v31 = [v28 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v62 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v86 = v62;
        __int16 v87 = 2112;
        id v88 = v22;
        id v63 = v62;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@: Create Request for Cache failed - Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v72 = 0;
    v61 = [v24 _requestWithError:&v72];
    id v22 = v72;
    if (v61) {
      [*(id *)(a1 + 32) _presentRequest:v61];
    }
  }
LABEL_46:
  if (a2) {
    *a2 = v22;
  }

  return v22 == 0;
}

void sub_10000433C(uint64_t a1)
{
  id v1 = +[NSArray arrayWithArray:*(void *)(a1 + 32)];
  +[BiomeHelper donateToBiomeWithRequests:v1];
}

id sub_100004398(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 BOOLValue];
  id result = [*(id *)(a1 + 32) canSendViaMessages];
  if (result) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    return [v6 _presentRequest:v7];
  }
  return result;
}

id sub_10000576C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadItemsIntoMemory];
}

void sub_100005890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000058A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000058B8(uint64_t a1)
{
}

void sub_1000058C0(uint64_t a1)
{
}

void sub_1000059A0(uint64_t a1)
{
}

void sub_100005A00(id a1)
{
  qword_100042AA8 = [[ApproverStore alloc] initWithInMemoryStore:1];
  _objc_release_x1();
}

void sub_100005A98(id a1)
{
  qword_100042AB8 = objc_alloc_init(ApproverStore);
  _objc_release_x1();
}

void sub_100005C28(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  id v2 = [*(id *)(a1 + 32) requestStore];
  [v2 clearCache];
}

id sub_100005E9C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 _saveChanges];
}

id sub_10000685C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _approvalRequestWithStoreItem:a2];
}

id sub_1000069E4(uint64_t a1)
{
  id v2 = [ApproverStoreItem alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = +[NSDate date];
  BOOL v5 = [(ApproverStoreItem *)v2 initWithRequest:v3 date:v4];
  v6 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = [*(id *)(a1 + 40) uniqueIdentifier];
  [v6 setObject:v5 forKeyedSubscript:v7];

  id v8 = *(void **)(a1 + 32);
  return [v8 _saveChanges];
}

void sub_100009844(id a1)
{
  qword_100042AC8 = (uint64_t)dispatch_queue_create("com.apple.AskPermission.BiometricsHandler", 0);
  _objc_release_x1();
}

id sub_100009CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

id sub_100009F04(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 40) setState:a2];
  if (a2 == 2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(a1 + 40);
    return [v5 _storeToken:v6];
  }
  return result;
}

uint64_t sub_10000A28C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (a2 == 1)
    {
      uint64_t v3 = +[APLogConfig sharedDaemonConfig];
      if (!v3)
      {
        uint64_t v3 = +[APLogConfig sharedConfig];
      }
      v4 = [v3 OSLogObject];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = (id)objc_opt_class();
        id v5 = v14;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Biometrics dialog approved", (uint8_t *)&v13, 0xCu);
      }
      return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 2);
    }
    else
    {
      v10 = +[APLogConfig sharedDaemonConfig];
      if (!v10)
      {
        v10 = +[APLogConfig sharedConfig];
      }
      id v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = (id)objc_opt_class();
        id v12 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Biometrics dialog cancelled", (uint8_t *)&v13, 0xCu);
      }
      return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
    }
  }
  else
  {
    uint64_t v7 = +[APLogConfig sharedDaemonConfig];
    if (!v7)
    {
      uint64_t v7 = +[APLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = (id)objc_opt_class();
      id v9 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Biometrics dialog declined", (uint8_t *)&v13, 0xCu);
    }
    return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1);
  }
}

void sub_10000A748(id a1)
{
}

void sub_10000A8E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v5 = 0;
  uint64_t v3 = +[BiometricsStore retreiveTokenWithAction:v1 error:&v5];
  id v4 = v5;
  (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v3, v4);
}

id sub_10000AAE4(uint64_t a1)
{
  return +[BiometricsStore storeToken:*(void *)(a1 + 32)];
}

void sub_10000AB4C(id a1)
{
  qword_100042AD8 = objc_alloc_init(ConnectionReceiver);
  _objc_release_x1();
}

void sub_10000AF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AF68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = +[APLogConfig sharedDaemonConfig];
  if (!v2)
  {
    uint64_t v2 = +[APLogConfig sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}@: Connection invalidated", (uint8_t *)&v5, 0xCu);
  }
}

void sub_10000B064(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = +[APLogConfig sharedDaemonConfig];
  if (!v2)
  {
    uint64_t v2 = +[APLogConfig sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}@: Connection interrupted", (uint8_t *)&v5, 0xCu);
  }
}

void sub_10000B334(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[APLogConfig sharedDaemonConfig];
  uint64_t v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      uint64_t v7 = +[APLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = (id)objc_opt_class();
      id v9 = v17;
      v10 = "%{public}@: Posted request successfully";
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v16, v13);
    }
  }
  else
  {
    if (!v6)
    {
      uint64_t v7 = +[APLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543618;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2114;
      id v19 = v5;
      id v9 = v17;
      v10 = "%{public}@: Error posting request. Error: %{public}@";
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
      goto LABEL_10;
    }
  }

  uint64_t v14 = *(void *)(a1 + 40);
  v15 = objc_msgSend(v5, "ams_sanitizedForSecureCoding");
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
}

void sub_10000B6E0(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = +[APLogConfig sharedDaemonConfig];
  uint64_t v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
    {
      uint64_t v6 = +[APLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = (id)objc_opt_class();
      id v8 = v14;
      id v9 = "%{public}@: Reset approver account succesfully";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = +[APLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v4;
      id v8 = v14;
      id v9 = "%{public}@: Error resetting approver account. Error: %{public}@";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
      goto LABEL_10;
    }
  }
}

void sub_10000B86C(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = +[APLogConfig sharedDaemonConfig];
  uint64_t v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
    {
      uint64_t v6 = +[APLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = (id)objc_opt_class();
      id v8 = v14;
      id v9 = "%{public}@: Reset requester account successfully";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = +[APLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v4;
      id v8 = v14;
      id v9 = "%{public}@: Error resetting requester account. Error: %{public}@";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
      goto LABEL_10;
    }
  }
}

id sub_10000BDDC(id a1, ApprovalRequest *a2)
{
  return [(ApprovalRequest *)a2 compile];
}

void sub_10000BF94(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[APLogConfig sharedDaemonConfig];
  uint64_t v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      uint64_t v7 = +[APLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = (id)objc_opt_class();
      id v9 = v17;
      v10 = "%{public}@: Local approve request success";
      os_log_type_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v16, v13);
    }
  }
  else
  {
    if (!v6)
    {
      uint64_t v7 = +[APLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543618;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2114;
      id v19 = v5;
      id v9 = v17;
      v10 = "%{public}@: Local approve request error. Error: %{public}@";
      os_log_type_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
      goto LABEL_10;
    }
  }

  uint64_t v14 = *(void *)(a1 + 40);
  __int16 v15 = objc_msgSend(v5, "ams_sanitizedForSecureCoding");
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
}

void sub_10000C614(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[APLogConfig sharedDaemonConfig];
  uint64_t v7 = (void *)v6;
  if (a2)
  {
    if (!v6)
    {
      uint64_t v7 = +[APLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = (id)objc_opt_class();
      id v9 = v17;
      v10 = "%{public}@: Updated request successfully";
      os_log_type_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v16, v13);
    }
  }
  else
  {
    if (!v6)
    {
      uint64_t v7 = +[APLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543618;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2114;
      id v19 = v5;
      id v9 = v17;
      v10 = "%{public}@: Error updating request. Error: %{public}@";
      os_log_type_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
      goto LABEL_10;
    }
  }

  uint64_t v14 = *(void *)(a1 + 40);
  __int16 v15 = objc_msgSend(v5, "ams_sanitizedForSecureCoding");
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
}

uint64_t sub_10000E12C(uint64_t a1, void *a2)
{
  uint64_t v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    uint64_t v3 = +[APLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = (id)objc_opt_class();
    id v5 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting daemon startup task", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v6 = +[ConnectionReceiver sharedReceiver];
  [v6 start];

  uint64_t v7 = +[LocalNotificationHandler sharedHandler];
  [v7 start];

  id v8 = +[RemoteNotificationHandler sharedHandler];
  [v8 start];

  if (a2) {
    *a2 = 0;
  }
  return 1;
}

uint64_t sub_10000E44C(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    id v5 = [a2 selectedActionIdentifier];
    [v5 integerValue];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

void sub_10000E6D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[APLogConfig sharedDaemonConfig];
  id v4 = (void *)v3;
  if (a2 == -1)
  {
    if (!v3)
    {
      id v4 = +[APLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      uint64_t v7 = "%{public}@: Error presenting request";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
  }
  else
  {
    if (!v3)
    {
      id v4 = +[APLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = (id)objc_opt_class();
      id v6 = v11;
      uint64_t v7 = "%{public}@: Presented request succesfully";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v10, 0xCu);
    }
  }
}

void sub_10000E9EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[APLogConfig sharedDaemonConfig];
  if (!v7)
  {
    uint64_t v7 = +[APLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v5;
    id v9 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Received dialog result. Result: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void, id, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5, v6);
}

void sub_10000EB7C(id a1)
{
  qword_100042AE8 = objc_alloc_init(ExtensionManager);
  _objc_release_x1();
}

id sub_10000EE6C(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"APExtensionDownloadContentType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  id v6 = [v4 isEqualToNumber:v5];

  return v6;
}

id sub_10000EFCC(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:@"APExtensionSupportedProductTypes"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = [*(id *)(a1 + 32) productType];
  id v6 = [v4 containsObject:v5];

  return v6;
}

uint64_t sub_10000F330(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 infoDictionary];
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

id sub_10000F380(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_10000F624(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_10000F668(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v3;
    id v7 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Extension completed. Request identifier: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_10000F788(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v3;
    id v7 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@: Extension cancelled. Request identifier: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_10000F8A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v3;
    id v7 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@: Extension interrupted. Request identifier: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_10000FD48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = +[APLogConfig sharedDaemonConfig];
  if (!v6)
  {
    id v6 = +[APLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v18 = 138543618;
    *(void *)&v18[4] = objc_opt_class();
    *(_WORD *)&v18[12] = 2114;
    *(void *)&v18[14] = a2;
    id v8 = *(id *)&v18[4];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Got a FamilyCircle: %{public}@", v18, 0x16u);
  }
  if (a2)
  {
    id v9 = [*(id *)(a1 + 32) DSID];
    if (v9)
    {
      __int16 v10 = [*(id *)(a1 + 32) DSID];
      id v11 = [a2 memberForDSID:v10];
    }
    else
    {
      id v11 = [a2 me];
    }

    id v16 = [*(id *)(a1 + 32) _familyMemberType:v11];
    id v17 = objc_alloc_init(FamilyMember);
    [(FamilyMember *)v17 setType:v16];
    [*(id *)(a1 + 40) finishWithResult:v17];
  }
  else
  {
    __int16 v12 = +[APLogConfig sharedDaemonConfig];
    if (!v12)
    {
      __int16 v12 = +[APLogConfig sharedConfig];
    }
    id v13 = objc_msgSend(v12, "OSLogObject", *(_OWORD *)v18, *(void *)&v18[16]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      *(_DWORD *)__int16 v18 = 138543618;
      *(void *)&v18[4] = v14;
      *(_WORD *)&v18[12] = 2114;
      *(void *)&v18[14] = v5;
      id v15 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Error: %{public}@", v18, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithError:v5];
  }
}

BOOL sub_100010430(uint64_t a1, void *a2)
{
  uint64_t v4 = +[AMSBag sharedBag];
  id v5 = [v4 retrieveRequestURL];

  CFStringRef v39 = @"requestId";
  id v6 = [*(id *)(a1 + 32) identifier];
  v40 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

  id v8 = objc_alloc_init(URLRequestEncoder);
  id v9 = [(URLRequestEncoder *)v8 requestWithMethod:4 bagURL:v5 parameters:v7];
  id v36 = 0;
  __int16 v10 = [v9 resultWithTimeout:&v36 error:60.0];
  id v11 = (ApprovalRequest *)v36;
  if (v10)
  {
    v32 = v7;
    v33 = a2;
    v34 = v5;
    __int16 v12 = +[APLogConfig sharedDaemonConfig];
    if (!v12)
    {
      __int16 v12 = +[APLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v38 = v14;
      id v15 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Encoded request successfully", buf, 0xCu);
    }
    id v16 = +[URLSession sharedSession];
    id v17 = [v16 dataTaskPromiseWithRequest:v10];

    id v35 = v11;
    __int16 v18 = [v17 resultWithTimeout:&v35 error:60.0];
    id v19 = v35;

    if (v18)
    {
      v20 = +[APLogConfig sharedDaemonConfig];
      if (!v20)
      {
        v20 = +[APLogConfig sharedConfig];
      }
      v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v38 = v22;
        int v23 = v19;
        id v24 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result", buf, 0xCu);

        id v19 = v23;
      }

      v25 = [v18 object];
      objc_opt_class();
      a2 = v33;
      if (objc_opt_isKindOfClass()) {
        id v26 = v25;
      }
      else {
        id v26 = 0;
      }

      if (v26
        && (v27 = [[ApprovalRequest alloc] initWithCloudPushDictionary:v26]) != 0)
      {
        v28 = v27;
        v31 = v19;
        [*(id *)(a1 + 32) setRequest:v27];
        if (+[APDefaults isRequester])
        {
          v29 = +[RequesterStore sharedStore];
          [v29 storeRequest:v28];
        }
        else
        {
          v29 = +[ApproverStore sharedStore];
          [v29 storeApprovalRequest:v28];
        }

        id v19 = v31;
      }
      else
      {
        APError();
        v28 = v19;
        id v19 = (ApprovalRequest *)objc_claimAutoreleasedReturnValue();
      }
    }
    id v11 = v19;
    id v5 = v34;
    id v7 = v32;
  }
  if (v11) {
    *a2 = v11;
  }

  return v11 == 0;
}

BOOL sub_1000109EC(uint64_t a1, void *a2)
{
  uint64_t v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    uint64_t v4 = +[APLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = [v7 itemIdentifier];
    *(_DWORD *)buf = 138543618;
    id v36 = v6;
    __int16 v37 = 2114;
    v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting local approve request task. Item identifier: %{public}@", buf, 0x16u);
  }
  __int16 v10 = +[RequesterStore sharedStore];
  id v11 = [*(id *)(a1 + 32) itemIdentifier];
  __int16 v12 = [v10 requestIdentifierWithItemIdentifier:v11];

  if (!v12)
  {
    APError();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!a2) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  id v13 = +[UserProvider localApprovalUser];
  id v34 = 0;
  uint64_t v14 = [v13 resultWithError:&v34];
  id v15 = v34;
  if (v14)
  {
    id v16 = +[APLogConfig sharedDaemonConfig];
    if (!v16)
    {
      id v16 = +[APLogConfig sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v36 = v18;
      id v19 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved local approval user", buf, 0xCu);
    }
    v20 = *(void **)(a1 + 32);
    id v33 = v15;
    v21 = [v20 _serverRequestWithUser:v14 requestIdentifier:v12 error:&v33];
    id v22 = v33;

    if (v21)
    {
      int v23 = +[APLogConfig sharedDaemonConfig];
      if (!v23)
      {
        int v23 = +[APLogConfig sharedConfig];
      }
      id v24 = [v23 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        id v36 = v25;
        id v26 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result", buf, 0xCu);
      }
      uint64_t v27 = [*(id *)(a1 + 32) _parseResult:v21];

      id v22 = (id)v27;
      if (!v27)
      {
        v28 = +[APLogConfig sharedDaemonConfig];
        if (!v28)
        {
          v28 = +[APLogConfig sharedConfig];
        }
        v29 = [v28 OSLogObject];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          id v36 = v30;
          id v31 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Local approve success", buf, 0xCu);
        }
        id v22 = 0;
      }
    }

    id v15 = v22;
  }

  if (a2) {
LABEL_24:
  }
    *a2 = v15;
LABEL_25:

  return v15 == 0;
}

void sub_1000116A4(id a1)
{
  qword_100042AF8 = objc_alloc_init(LocalNotificationHandler);
  _objc_release_x1();
}

void sub_1000123D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000123F8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = +[APLogConfig sharedDaemonConfig];
  id v8 = (void *)v7;
  if (a2)
  {
    if (!v7)
    {
      id v8 = +[APLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v10 = v18;
      id v11 = "%{public}@: Handled approver local notification succesfully.";
      __int16 v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }
  else
  {
    if (!v7)
    {
      id v8 = +[APLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      id v20 = v5;
      id v10 = v18;
      id v11 = "%{public}@: Failed to handle approver local notification. Error: %{public}@";
      __int16 v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 22;
      goto LABEL_10;
    }
  }

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v15, v16);
}

void sub_1000126B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000126DC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = +[APLogConfig sharedDaemonConfig];
  id v8 = (void *)v7;
  if (a2)
  {
    if (!v7)
    {
      id v8 = +[APLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = (id)objc_opt_class();
      id v10 = v18;
      id v11 = "%{public}@: Handled requester local notification succesfully.";
      __int16 v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }
  else
  {
    if (!v7)
    {
      id v8 = +[APLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      id v20 = v5;
      id v10 = v18;
      id v11 = "%{public}@: Failed to handle requester local notification. Error: %{public}@";
      __int16 v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 22;
      goto LABEL_10;
    }
  }

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v15, v16);
}

void sub_100012B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012B54(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = +[APLogConfig sharedDaemonConfig];
  id v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      id v9 = *(void **)(a1 + 32);
      id v10 = v8;
      id v11 = [v9 requestIdentifier];
      int v12 = *(unsigned __int8 *)(a1 + 48);
      int v20 = 138544130;
      v21 = v8;
      __int16 v22 = 2114;
      int v23 = v11;
      __int16 v24 = 1026;
      int v25 = v12;
      __int16 v26 = 2114;
      id v27 = v3;
      os_log_type_t v13 = "%{public}@: Could not present notification. Identifier: %{public}@, silently: %{public}d, error:%{public}@";
      uint32_t v14 = v7;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 38;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v20, v16);
    }
  }
  else
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = objc_opt_class();
      id v18 = *(void **)(a1 + 32);
      id v10 = v17;
      id v11 = [v18 requestIdentifier];
      int v19 = *(unsigned __int8 *)(a1 + 48);
      int v20 = 138543874;
      v21 = v17;
      __int16 v22 = 2114;
      int v23 = v11;
      __int16 v24 = 1026;
      int v25 = v19;
      os_log_type_t v13 = "%{public}@: Presented notification successfully. Identifier: %{public}@, silently: %{public}d";
      uint32_t v14 = v7;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 28;
      goto LABEL_10;
    }
  }
}

void sub_100012E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012EA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = +[APLogConfig sharedDaemonConfig];
  id v6 = (void *)v5;
  if (v3)
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      id v9 = *(void **)(a1 + 32);
      id v10 = v8;
      id v11 = [v9 requestIdentifier];
      int v18 = 138543874;
      int v19 = v8;
      __int16 v20 = 2114;
      v21 = v11;
      __int16 v22 = 2114;
      id v23 = v3;
      int v12 = "%{public}@: Could not replace notification content. Identifier: %{public}@, error:%{public}@";
      os_log_type_t v13 = v7;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 32;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v18, v15);
    }
  }
  else
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v16 = objc_opt_class();
      int v17 = *(void **)(a1 + 32);
      id v10 = v16;
      id v11 = [v17 requestIdentifier];
      int v18 = 138543618;
      int v19 = v16;
      __int16 v20 = 2114;
      v21 = v11;
      int v12 = "%{public}@: Replaced notification content successfully. Identifier: %{public}@";
      os_log_type_t v13 = v7;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 22;
      goto LABEL_10;
    }
  }
}

BOOL sub_1000134DC(uint64_t a1, void *a2)
{
  uint64_t v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    uint64_t v4 = +[APLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = [v7 requestURL];
    *(_DWORD *)buf = 138543618;
    __int16 v37 = v6;
    __int16 v38 = 2114;
    id v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting post request task. Request URL: %{public}@", buf, 0x16u);
  }
  +[APDefaults setIsRequester:1];
  +[APDefaults setIsApprover:0];
  id v10 = *(void **)(a1 + 32);
  id v35 = 0;
  id v11 = [v10 _serverRequestWithError:&v35];
  id v12 = v35;
  if (v11)
  {
    os_log_type_t v13 = +[APLogConfig sharedDaemonConfig];
    if (!v13)
    {
      os_log_type_t v13 = +[APLogConfig sharedConfig];
    }
    os_log_type_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v15 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      __int16 v37 = v15;
      id v16 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result.", buf, 0xCu);
    }
    int v17 = *(void **)(a1 + 32);
    id v34 = v12;
    int v18 = [v17 _storeRequestWithResult:v11 error:&v34];
    id v19 = v34;

    if (_os_feature_enabled_impl())
    {
      __int16 v20 = [v11 object];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v21 = v20;
      }
      else {
        id v21 = 0;
      }

      __int16 v22 = [v21 objectForKeyedSubscript:@"requestId"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v23 = v22;
      }
      else {
        id v23 = 0;
      }

      __int16 v24 = +[APLogConfig sharedDaemonConfig];
      if (!v24)
      {
        __int16 v24 = +[APLogConfig sharedConfig];
      }
      int v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        __int16 v37 = v26;
        __int16 v38 = 2112;
        id v39 = v23;
        id v27 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting Biome Donation - Request Identifier: %@", buf, 0x16u);
      }
      +[BiomeHelper donateToBiomeWithRequest:v18];
    }
    v28 = [*(id *)(a1 + 32) bag];
    v29 = [v28 BOOLForKey:@"enable-ks-via-messages"];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100013924;
    v32[3] = &unk_100038618;
    v32[4] = *(void *)(a1 + 32);
    id v33 = v18;
    id v30 = v18;
    [v29 valueWithCompletion:v32];

    id v12 = v19;
  }
  if (a2) {
    *a2 = v12;
  }

  return v12 == 0;
}

void sub_100013924(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 BOOLValue];
  uint64_t v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    uint64_t v4 = +[APLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = v6;
    *(_DWORD *)buf = 138543874;
    int v17 = v6;
    __int16 v18 = 1024;
    unsigned int v19 = [v7 canSendViaMessages];
    __int16 v20 = 1024;
    unsigned int v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: canSendViaMessages: %d - kill switch: %d", buf, 0x18u);
  }
  if ((v3 & 1) == 0 && [*(id *)(a1 + 32) canSendViaMessages])
  {
    id v9 = +[APLogConfig sharedDaemonConfig];
    if (!v9)
    {
      id v9 = +[APLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      int v17 = v11;
      id v12 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending via iMessage", buf, 0xCu);
    }
    os_log_type_t v13 = [*(id *)(a1 + 32) peopleClient];
    os_log_type_t v14 = [*(id *)(a1 + 40) uniqueIdentifier];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100013B78;
    v15[3] = &unk_100038870;
    v15[4] = *(void *)(a1 + 32);
    [v13 sendFamilyAskToBuyIMessageWithRequestID:v14 completion:v15];
  }
}

void sub_100013B78(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = +[APLogConfig sharedDaemonConfig];
    if (!v5)
    {
      uint64_t v5 = +[APLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2112;
      id v11 = v4;
      id v7 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending via iMessage failed - Error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void sub_10001447C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
}

uint64_t sub_100014544(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100014554(uint64_t a1)
{
}

void sub_10001455C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v5)
  {
    id v7 = +[APLogConfig sharedDaemonConfig];
    if (!v7)
    {
      id v7 = +[APLogConfig sharedConfig];
    }
    int v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = (id)objc_opt_class();
      __int16 v23 = 2112;
      id v24 = v5;
      id v9 = v22;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: PeopleClient returned an error: %@", buf, 0x16u);
    }
  }
  [WeakRetained setCanSendViaMessages:a2];
  __int16 v10 = +[APLogConfig sharedDaemonConfig];
  if (!v10)
  {
    __int16 v10 = +[APLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v22 = v12;
    __int16 v23 = 1024;
    LODWORD(v24) = a2;
    id v13 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: canSendFamilyAskToBuyIMessage: %d", buf, 0x12u);
  }
  os_log_type_t v14 = [*(id *)(a1 + 32) requestURL];
  uint32_t v15 = [v14 absoluteString];
  id v16 = objc_msgSend(v15, "stringByAppendingFormat:", @"&clientInfo=canSendViaMessages:%d", a2);

  int v17 = +[NSURL URLWithString:v16];
  if (v17)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v17);
  }
  else
  {
    uint64_t v18 = [*(id *)(a1 + 32) requestURL];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    [WeakRetained setCanSendViaMessages:0];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

Class sub_100014BE0(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100042B08)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100014D24;
    v4[4] = &unk_100038B98;
    v4[5] = v4;
    long long v5 = off_100038B80;
    uint64_t v6 = 0;
    qword_100042B08 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_100042B08)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PeopleClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_100014D98();
LABEL_8:
    free(v2);
  }
  qword_100042B00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100014D24()
{
  uint64_t result = _sl_dlopen();
  qword_100042B08 = result;
  return result;
}

BOOL sub_100014D98()
{
  v0 = (void *)abort_report_np();
  return +[ProductPagePresenter presentRequest:v2 withError:v3];
}

void sub_100015090(id a1)
{
  qword_100042B18 = objc_alloc_init(RemoteNotificationHandler);
  _objc_release_x1();
}

id sub_1000151EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleStoreNotificationPayload:*(void *)(a1 + 40)];
}

void sub_100015CEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 type];
    if (v7 != (id)1)
    {
      if (v7) {
        goto LABEL_22;
      }
      goto LABEL_15;
    }
    id v13 = +[APLogConfig sharedDaemonConfig];
    if (!v13)
    {
      id v13 = +[APLogConfig sharedConfig];
    }
    os_log_type_t v14 = [v13 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:

      goto LABEL_22;
    }
    *(_DWORD *)int v17 = 138543362;
    *(void *)&v17[4] = objc_opt_class();
    id v16 = *(id *)&v17[4];
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring cloud notification on requester's device", v17, 0xCu);

    goto LABEL_21;
  }
  int v8 = +[APLogConfig sharedDaemonConfig];
  if (!v8)
  {
    int v8 = +[APLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v17 = 138543618;
    *(void *)&v17[4] = objc_opt_class();
    *(_WORD *)&v17[12] = 2114;
    *(void *)&v17[14] = v6;
    id v10 = *(id *)&v17[4];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to determine if Guardian or Requester. Falling back to UserDefaults. Error: %{public}@", v17, 0x16u);
  }
  if ((+[APDefaults isRequester] & 1) != 0
    || (+[RequesterStore sharedStore],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 containsRequestWithIdentifier:*(void *)(a1 + 40)],
        v11,
        (v12 & 1) != 0))
  {
    id v13 = +[APLogConfig sharedDaemonConfig];
    if (!v13)
    {
      id v13 = +[APLogConfig sharedConfig];
    }
    os_log_type_t v14 = [v13 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    uint32_t v15 = objc_opt_class();
    *(_DWORD *)int v17 = 138543362;
    *(void *)&v17[4] = v15;
    id v16 = v15;
    goto LABEL_20;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "_handleApproverNotification:", *(void *)(a1 + 48), *(void *)v17, *(_OWORD *)&v17[8]);
LABEL_22:
}

void sub_100016040(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = +[APLogConfig sharedDaemonConfig];
  id v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = (id)objc_opt_class();
      id v8 = v14;
      id v9 = "%{public}@: Handled approver remote notification succesfully";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v4;
      id v8 = v14;
      id v9 = "%{public}@: Failed to handle approver remote notification. Error: %{public}@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
      goto LABEL_10;
    }
  }
}

void sub_100016614(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5 || [v5 type] == (id)2)
  {
    id v7 = +[APLogConfig sharedDaemonConfig];
    if (!v7)
    {
      id v7 = +[APLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v15 = 138543618;
      *(void *)&v15[4] = objc_opt_class();
      *(_WORD *)&v15[12] = 2114;
      *(void *)&v15[14] = v6;
      id v9 = *(id *)&v15[4];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to determine if Guardian or Requester. Falling back to UserDefaults. Error: %{public}@", v15, 0x16u);
    }
    if (!+[APDefaults isRequester])
    {
      id v10 = +[APLogConfig sharedDaemonConfig];
      if (!v10)
      {
        id v10 = +[APLogConfig sharedConfig];
      }
      os_log_type_t v11 = objc_msgSend(v10, "OSLogObject", *(_OWORD *)v15, *(void *)&v15[16]);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      uint32_t v12 = objc_opt_class();
      *(_DWORD *)__int16 v15 = 138543362;
      *(void *)&v15[4] = v12;
      id v13 = v12;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring store notification on approver's device", v15, 0xCu);

LABEL_19:
      goto LABEL_21;
    }
LABEL_20:
    objc_msgSend(*(id *)(a1 + 32), "_handleRequesterNotification:andSuppressDialog:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)v15, *(_OWORD *)&v15[8]);
    goto LABEL_21;
  }
  id v14 = [v5 type];
  if (v14 == (id)1) {
    goto LABEL_20;
  }
  if (!v14)
  {
    id v10 = +[APLogConfig sharedDaemonConfig];
    if (!v10)
    {
      id v10 = +[APLogConfig sharedConfig];
    }
    os_log_type_t v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)__int16 v15 = 138543362;
    *(void *)&v15[4] = objc_opt_class();
    id v13 = *(id *)&v15[4];
    goto LABEL_18;
  }
LABEL_21:
}

void sub_100016954(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = +[APLogConfig sharedDaemonConfig];
  id v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = (id)objc_opt_class();
      id v8 = v14;
      id v9 = "%{public}@: Handled requester remote notification succesfully";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else
  {
    if (!v5)
    {
      id v6 = +[APLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      id v16 = v4;
      id v8 = v14;
      id v9 = "%{public}@: Failed to handle requester remote notification. Error: %{public}@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
      goto LABEL_10;
    }
  }
}

void sub_100016D50(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[APLogConfig sharedDaemonConfig];
  id v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      id v4 = +[APLogConfig sharedConfig];
    }
    uint64_t v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v11 = 138543618;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2114;
      id v14 = v2;
      id v6 = v12;
      id v7 = "%{public}@: Failed to register cloud push token. Error: %{public}@";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_FAULT;
      uint32_t v10 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else
  {
    if (!v3)
    {
      id v4 = +[APLogConfig sharedConfig];
    }
    uint64_t v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = (id)objc_opt_class();
      id v6 = v12;
      id v7 = "%{public}@: Registered cloud push token succesfully";
      id v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 12;
      goto LABEL_10;
    }
  }

  +[APDefaults setRetryNotificationRegistration:v2 != 0];
}

uint64_t sub_100017794(uint64_t a1, void *a2)
{
  id v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    id v4 = +[APLogConfig sharedConfig];
  }
  uint64_t v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    os_log_type_t v9 = [v7 request];
    int v14 = 138543618;
    __int16 v15 = v6;
    __int16 v16 = 2114;
    int v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting handle requester local notification task. Request: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  uint32_t v10 = +[LocalNotificationHandler sharedHandler];
  int v11 = [*(id *)(a1 + 32) request];
  id v12 = [v11 requestIdentifier];
  [v10 dismissNotificationWithIdentifier:v12];

  if (a2) {
    *a2 = 0;
  }
  return 1;
}

BOOL sub_100017B40(uint64_t a1, void *a2)
{
  id v4 = &AMSLogableError_ptr;
  uint64_t v5 = +[APLogConfig sharedDaemonConfig];
  if (!v5)
  {
    uint64_t v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    uint32_t v10 = [v8 payload];
    *(_DWORD *)buf = 138543618;
    v95 = v7;
    __int16 v96 = 2114;
    id v97 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting requester remote notification task. Payload: %{public}@", buf, 0x16u);

    id v4 = &AMSLogableError_ptr;
  }

  id v11 = [*(id *)(a1 + 32) requestStatus];
  uint64_t v12 = [*(id *)(a1 + 32) requestIdentifier];
  __int16 v13 = (void *)v12;
  if (v11 == (id)-2 || !v12)
  {
    APError();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ((unint64_t)v11 > 1)
  {
    id v17 = 0;
  }
  else
  {
    int v14 = +[RequesterStore sharedStore];
    [v14 clearExpiredRequests];

    __int16 v15 = *(void **)(a1 + 32);
    id v92 = 0;
    __int16 v16 = [v15 _serverRequestWithError:&v92];
    id v17 = v92;
    if (v16)
    {
      uint64_t v18 = +[APLogConfig sharedDaemonConfig];
      if (!v18)
      {
        uint64_t v18 = +[APLogConfig sharedConfig];
      }
      uint64_t v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v20 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v95 = v20;
        __int16 v96 = 2114;
        id v97 = v16;
        id v21 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result: %{public}@", buf, 0x16u);

        id v4 = &AMSLogableError_ptr;
      }

      id v22 = *(void **)(a1 + 32);
      id v91 = v17;
      uint64_t v23 = [v22 _requestFromResult:v16 withError:&v91];
      id v79 = v91;

      id v83 = (void *)v23;
      if (v23)
      {
        id v24 = +[APLogConfig sharedDaemonConfig];
        if (!v24)
        {
          id v24 = +[APLogConfig sharedConfig];
        }
        int v25 = [v24 OSLogObject];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v26 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v95 = v26;
          __int16 v96 = 2114;
          id v97 = v83;
          id v27 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Decoded server response. Request: %{public}@", buf, 0x16u);
        }
        if ([*(id *)(a1 + 32) suppressDialog])
        {
          v28 = +[APLogConfig sharedDaemonConfig];
          if (!v28)
          {
            v28 = +[APLogConfig sharedConfig];
          }
          v29 = [v28 OSLogObject];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v95 = v30;
            id v31 = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Suppressing Dialog for Inactive Account@", buf, 0xCu);
          }
        }
        else
        {
          [*(id *)(a1 + 32) _presentRequest:v83];
        }
        long long v82 = +[NSMutableArray array];
        id v33 = [v16 object];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v34 = v33;
        }
        else {
          id v34 = 0;
        }
        id v78 = v11;

        if (v34)
        {
          uint64_t v75 = v16;
          id v76 = v13;
          id v74 = v34;
          id v35 = [[ApprovalRequest alloc] initWithCloudPushDictionary:v34];
          id v36 = +[RequesterStore sharedStore];
          [v36 storeRequest:v35];

          [v82 addObject:v35];
          __int16 v37 = +[RequesterStore sharedStore];
          __int16 v38 = [(ApprovalRequest *)v35 uniqueIdentifier];
          id v39 = [v37 requestsMatchingUniqueIdentifier:v38];

          v40 = +[APLogConfig sharedDaemonConfig];
          if (!v40)
          {
            v40 = +[APLogConfig sharedConfig];
          }
          v77 = a2;
          v41 = [v40 OSLogObject];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = objc_opt_class();
            id v43 = v42;
            id v44 = [v39 count];
            *(_DWORD *)buf = 138543618;
            v95 = v42;
            __int16 v96 = 2048;
            id v97 = v44;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%{public}@: Matching requests found: %lu", buf, 0x16u);
          }
          uint64_t v80 = a1;

          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          uint64_t v45 = v39;
          id v46 = [v45 countByEnumeratingWithState:&v87 objects:v93 count:16];
          id v4 = &AMSLogableError_ptr;
          long long v81 = v45;
          if (v46)
          {
            id v47 = v46;
            uint64_t v48 = *(void *)v88;
            do
            {
              for (i = 0; i != v47; i = (char *)i + 1)
              {
                if (*(void *)v88 != v48) {
                  objc_enumerationMutation(v45);
                }
                v50 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                uint64_t v51 = [v4[120] sharedDaemonConfig];
                if (!v51)
                {
                  uint64_t v51 = [v4[120] sharedConfig];
                }
                id v52 = [v51 OSLogObject];
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v53 = objc_opt_class();
                  id v54 = v53;
                  v55 = [v50 uniqueIdentifier];
                  *(_DWORD *)buf = 138543618;
                  v95 = v53;
                  uint64_t v45 = v81;
                  __int16 v96 = 2114;
                  id v97 = v55;
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating request: %{public}@", buf, 0x16u);

                  id v4 = &AMSLogableError_ptr;
                }

                id v56 = [v83 status];
                v57 = [(ApprovalRequest *)v35 approverDSID];
                [v50 updateStatus:v56 withApproverDSID:v57];

                v58 = +[RequesterStore sharedStore];
                [v58 storeRequest:v50];

                [v82 addObject:v50];
              }
              id v47 = [v45 countByEnumeratingWithState:&v87 objects:v93 count:16];
            }
            while (v47);
          }

          if (_os_feature_enabled_impl())
          {
            id v59 = objc_alloc_init((Class)NSOperationQueue);
            v85[0] = _NSConcreteStackBlock;
            v85[1] = 3221225472;
            v85[2] = sub_100018530;
            v85[3] = &unk_1000385F0;
            id v86 = v82;
            [v59 addOperationWithBlock:v85];
          }
          __int16 v13 = v76;
          a2 = v77;
          a1 = v80;
          id v34 = v74;
          __int16 v16 = v75;
        }
        else
        {
          id v35 = +[APLogConfig sharedDaemonConfig];
          if (!v35)
          {
            id v35 = +[APLogConfig sharedConfig];
          }
          id v60 = [(ApprovalRequest *)v35 OSLogObject];
          long long v81 = v60;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v95 = v61;
            id v62 = v61;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}@: Error gather information for Biome donation. Result Object NIL.", buf, 0xCu);
          }
        }

        id v11 = v78;
      }
      if (v11 == (id)1)
      {
        id v63 = *(void **)(a1 + 32);
        id v84 = v79;
        v64 = [v63 _requestResultFromResult:v16 withError:&v84];
        id v65 = v84;

        if (v64)
        {
          uint64_t v66 = [v4[120] sharedDaemonConfig];
          v67 = v4;
          v68 = (void *)v66;
          if (!v66)
          {
            v68 = [v67[120] sharedConfig];
          }
          v69 = [v68 OSLogObject];
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            v70 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v95 = v70;
            __int16 v96 = 2114;
            id v97 = v64;
            id v71 = v16;
            id v72 = v70;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%{public}@: Decoded server response. Result: %{public}@", buf, 0x16u);

            __int16 v16 = v71;
          }

          id v73 = [*(id *)(a1 + 32) _notifyExtensionWithResult:v64];
        }

        id v17 = v65;
      }
      else
      {
        id v17 = v79;
      }
    }
  }
  if (a2) {
    *a2 = v17;
  }

  return v17 == 0;
}

void sub_100018530(uint64_t a1)
{
  id v1 = +[NSArray arrayWithArray:*(void *)(a1 + 32)];
  +[BiomeHelper donateToBiomeWithRequests:v1];
}

id sub_100019504(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadItemsIntoMemory];
}

void sub_100019560(id a1)
{
  qword_100042B28 = objc_alloc_init(RequesterStore);
  _objc_release_x1();
}

void sub_1000196F0(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) requestItems];
  id v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint32_t v10 = [v9 createdDate];
        unsigned int v11 = +[NSDate isDateExpired:v10];

        if (v11)
        {
          uint64_t v12 = [v9 uniqueIdentifier];
          [v2 addObject:v12];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v2;
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * (void)j);
        uint64_t v19 = objc_msgSend(*(id *)(a1 + 32), "requestItems", (void)v20);
        [v19 setObject:0 forKeyedSubscript:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  [*(id *)(a1 + 32) _saveChanges];
}

void sub_100019A68(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) requestItems];
  [v2 removeAllObjects];

  id v3 = [*(id *)(a1 + 32) requestStore];
  [v3 clearCache];
}

id sub_10001A4FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) requestItems];
  id v4 = [*(id *)(a1 + 40) uniqueIdentifier];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = *(void **)(a1 + 32);
  return [v5 _saveChanges];
}

id sub_10001AF74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteFile];
}

void sub_10001B158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B184(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001B194(uint64_t a1)
{
}

uint64_t sub_10001B19C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _retrieveFile];
  return _objc_release_x1();
}

id sub_10001B364(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeFileWithItems:*(void *)(a1 + 40)];
}

uint64_t sub_10001D710(uint64_t a1, void *a2)
{
  id v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    id v3 = +[APLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = (id)objc_opt_class();
    id v5 = v24;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting reset approver account task", buf, 0xCu);
  }
  +[BiometricsHandler reset];
  +[APDefaults setIsApprover:0];
  id v6 = +[ApproverStore sharedStore];
  [v6 clearRequests];

  uint64_t v7 = +[LocalNotificationHandler sharedHandler];
  id v8 = [v7 presentedRequests];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v14, "status", (void)v18) == (id)-1)
        {
          id v15 = +[LocalNotificationHandler sharedHandler];
          uint64_t v16 = [v14 requestIdentifier];
          [v15 dismissNotificationWithIdentifier:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  if (a2) {
    *a2 = 0;
  }

  return 1;
}

uint64_t sub_10001D9D0(uint64_t a1, void *a2)
{
  id v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    id v3 = +[APLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = (id)objc_opt_class();
    id v5 = v24;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting reset requester account task", buf, 0xCu);
  }
  id v6 = +[RequesterStore sharedStore];
  [v6 clearRequests];

  +[APDefaults setIsRequester:0];
  uint64_t v7 = +[LocalNotificationHandler sharedHandler];
  id v8 = [v7 presentedRequests];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v14, "status", (void)v18) == (id)1 || !objc_msgSend(v14, "status"))
        {
          id v15 = +[LocalNotificationHandler sharedHandler];
          uint64_t v16 = [v14 requestIdentifier];
          [v15 dismissNotificationWithIdentifier:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  if (a2) {
    *a2 = 0;
  }

  return 1;
}

BOOL sub_10001E1E4(uint64_t a1, void *a2)
{
  id v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    id v3 = +[APLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    id v8 = [v6 requestIdentifier];
    id v9 = [*(id *)(a1 + 32) action];
    *(_DWORD *)buf = 138543874;
    id v52 = v5;
    __int16 v53 = 2114;
    id v54 = v8;
    __int16 v55 = 2050;
    id v56 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting update request task. Identifier: %{public}@, action: %{public}ld", buf, 0x20u);
  }
  id v10 = +[LocalNotificationHandler sharedHandler];
  id v11 = [*(id *)(a1 + 32) requestIdentifier];
  uint64_t v12 = [v10 retrieveRequestWithIdentifier:v11];

  if (v12)
  {
    id v13 = +[APLogConfig sharedDaemonConfig];
    if (!v13)
    {
      id v13 = +[APLogConfig sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v52 = v15;
      id v16 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved request, dismissing notification", buf, 0xCu);
    }
    id v17 = +[LocalNotificationHandler sharedHandler];
    long long v18 = [*(id *)(a1 + 32) requestIdentifier];
    [v17 dismissNotificationWithIdentifier:v18];
  }
  id v46 = (void *)v12;
  id v19 = 0;
  BOOL v20 = 0;
  long long v21 = 0;
  while (1)
  {
    long long v22 = v19;
    id v23 = objc_msgSend(*(id *)(a1 + 32), "action", v46);
    id v50 = v19;
    id v24 = +[UserProvider primaryiCloudUserWithAction:v23 keychainError:&v50];
    id v19 = v50;

    id v49 = v21;
    long long v25 = [v24 resultWithError:&v49];
    id v26 = v49;

    if (!v25) {
      break;
    }
    long long v27 = +[APLogConfig sharedDaemonConfig];
    if (!v27)
    {
      long long v27 = +[APLogConfig sharedConfig];
    }
    v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v52 = v29;
      id v30 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved primary iCloud user.", buf, 0xCu);
    }
    id v31 = *(void **)(a1 + 32);
    id v48 = v26;
    v32 = [v31 _serverRequestWithUser:v25 error:&v48];
    id v33 = v48;

    if (!v32)
    {
      long long v21 = v33;
LABEL_26:

      id v26 = v21;
      break;
    }
    id v34 = +[APLogConfig sharedDaemonConfig];
    if (!v34)
    {
      id v34 = +[APLogConfig sharedConfig];
    }
    id v35 = [v34 OSLogObject];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v52 = v36;
      id v37 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: Received server result.", buf, 0xCu);
    }
    long long v21 = [*(id *)(a1 + 32) _parseResult:v32];

    __int16 v38 = [v25 biometricsToken];
    BOOL v20 = v38 != 0;

    if (!v21 || !v38) {
      goto LABEL_26;
    }
    +[BiometricsHandler removeToken];

    BOOL v20 = 1;
  }

  if (v46 && v26)
  {
    id v39 = +[APLogConfig sharedDaemonConfig];
    if (!v39)
    {
      id v39 = +[APLogConfig sharedConfig];
    }
    v40 = [v39 OSLogObject];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = objc_opt_class();
      id v42 = v41;
      id v43 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      id v52 = v41;
      __int16 v53 = 2114;
      id v54 = v43;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error, presenting notification. error = %{public}@", buf, 0x16u);
    }
    id v44 = +[LocalNotificationHandler sharedHandler];
    [v44 presentNotificationWithRequest:v46 silently:1];
  }
  [*(id *)(a1 + 32) _enqueueMetricsWithKeychainError:v19 usedBiometrics:v20 request:v46 error:v26];
  if (a2) {
    *a2 = v26;
  }

  return v26 == 0;
}

void sub_10001EE84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    [v5 enqueueEvent:v6];
  }
  else
  {
    id v4 = +[APMetricsEvent nonIdentifiableMetricsFieldsForAccount:a2];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001EF6C;
    v7[3] = &unk_100038C88;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    [v4 addFinishBlock:v7];
  }
}

id sub_10001EF6C(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    id v4 = a2;
    id v5 = [v4 objectForKeyedSubscript:@"userId"];
    uint64_t v6 = [v4 objectForKeyedSubscript:@"xpAccountsMatch"];
    id v7 = [v4 objectForKeyedSubscript:@"xpUserIdSyncState"];
    id v8 = [v4 objectForKeyedSubscript:@"clientId"];

    [*(id *)(a1 + 32) setProperty:0 forBodyKey:@"dsId"];
    [*(id *)(a1 + 32) setProperty:v5 forBodyKey:@"userId"];
    [*(id *)(a1 + 32) setProperty:v8 forBodyKey:@"clientId"];
    [*(id *)(a1 + 32) setProperty:kUserIDNamespace forBodyKey:@"userNs"];
    [*(id *)(a1 + 32) setProperty:v6 forBodyKey:@"xpAccountsMatch"];
    [*(id *)(a1 + 32) setProperty:v7 forBodyKey:@"xpUserIdSyncState"];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  return [v9 enqueueEvent:v10];
}

void sub_10001FCF8(id a1)
{
  id v1 = [URLSession alloc];
  id v4 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  uint64_t v2 = [(URLSession *)v1 initWithConfiguration:v4];
  id v3 = (void *)qword_100042B38;
  qword_100042B38 = (uint64_t)v2;
}

void sub_10001FDD0(id a1)
{
  qword_100042B48 = objc_alloc_init(URLSessionHandler);
  _objc_release_x1();
}

id sub_10002019C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 username];
  [*(id *)(a1 + 32) setPreviousLocalApprovalUsername:v4];

  id v5 = +[AMSPromise promiseWithResult:v3];

  return v5;
}

void sub_10002598C(id a1)
{
  id v1 = (void *)qword_100042B58;
  qword_100042B58 = (uint64_t)&off_10003AE40;
}

void sub_100027650(id a1)
{
  id v1 = +[APLogConfig sharedDaemonConfig];
  if (!v1)
  {
    id v1 = +[APLogConfig sharedConfig];
  }
  uint64_t v2 = [v1 OSLogObject];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received SIGTERM, stopping daemon", v3, 2u);
  }

  exit(0);
}

void sub_100027F78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:AKAuthenticationDSIDKey];
  id v8 = [v5 objectForKeyedSubscript:AKAuthenticationPasswordKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  uint64_t v10 = [v5 objectForKeyedSubscript:AKAuthenticationUsernameKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (v6)
  {
    uint64_t v12 = +[APLogConfig sharedDaemonConfig];
    if (!v12)
    {
      uint64_t v12 = +[APLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138543618;
      id v26 = (id)objc_opt_class();
      __int16 v27 = 2114;
      id v28 = v6;
      id v14 = v26;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to authenticate user. Error: %{public}@", (uint8_t *)&v25, 0x16u);
    }
LABEL_26:

    long long v21 = APError();
    BOOL v20 = 0;
    goto LABEL_27;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v7 stringValue], id v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
  {
    uint64_t v12 = +[APLogConfig sharedDaemonConfig];
    if (!v12)
    {
      uint64_t v12 = +[APLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138543362;
      id v26 = (id)objc_opt_class();
      id v22 = v26;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Authenticated user but no DSID", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_26;
  }
  if (!v9)
  {
    uint64_t v12 = +[APLogConfig sharedDaemonConfig];
    if (!v12)
    {
      uint64_t v12 = +[APLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138543362;
      id v26 = (id)objc_opt_class();
      id v23 = v26;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Authenticated user but no password", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_26;
  }
  uint64_t v16 = +[APLogConfig sharedDaemonConfig];
  uint64_t v12 = (void *)v16;
  if (!v11)
  {
    if (!v16)
    {
      uint64_t v12 = +[APLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v25 = 138543362;
      id v26 = (id)objc_opt_class();
      id v24 = v26;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: Authenticated user but no username", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_26;
  }
  if (!v16)
  {
    uint64_t v12 = +[APLogConfig sharedConfig];
  }
  id v17 = [v12 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543362;
    id v26 = (id)objc_opt_class();
    id v18 = v26;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Authenticated user succesfully", (uint8_t *)&v25, 0xCu);
  }
  id v19 = [v7 stringValue];
  BOOL v20 = [[User alloc] initWithDSID:v19 username:v11 password:v9 biometricsToken:0];

  long long v21 = 0;
LABEL_27:
  (*(void (**)(void, User *, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v20, v21);
}

uint64_t AMSLogableError()
{
  return _AMSLogableError();
}

uint64_t APCustomError()
{
  return _APCustomError();
}

uint64_t APError()
{
  return _APError();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return _SecAccessControlCreateWithFlags(allocator, protection, flags, error);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return _SecCopyErrorMessageString(status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

id objc_msgSend_APSDevelopmentEnvironment(void *a1, const char *a2, ...)
{
  return [a1 APSDevelopmentEnvironment];
}

id objc_msgSend_AskToBuy(void *a1, const char *a2, ...)
{
  return [a1 AskToBuy];
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return [a1 DSID];
}

id objc_msgSend_Family(void *a1, const char *a2, ...)
{
  return [a1 Family];
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return [a1 OSLogObject];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__accountMediaTypes(void *a1, const char *a2, ...)
{
  return [a1 _accountMediaTypes];
}

id objc_msgSend__activeStoreDSIDs(void *a1, const char *a2, ...)
{
  return [a1 _activeStoreDSIDs];
}

id objc_msgSend__biometryType(void *a1, const char *a2, ...)
{
  return [a1 _biometryType];
}

id objc_msgSend__cloudDSID(void *a1, const char *a2, ...)
{
  return [a1 _cloudDSID];
}

id objc_msgSend__copyKeychainQuery(void *a1, const char *a2, ...)
{
  return [a1 _copyKeychainQuery];
}

id objc_msgSend__countryCodes(void *a1, const char *a2, ...)
{
  return [a1 _countryCodes];
}

id objc_msgSend__filePath(void *a1, const char *a2, ...)
{
  return [a1 _filePath];
}

id objc_msgSend__migrationItems(void *a1, const char *a2, ...)
{
  return [a1 _migrationItems];
}

id objc_msgSend__processInfo(void *a1, const char *a2, ...)
{
  return [a1 _processInfo];
}

id objc_msgSend__retrieveFile(void *a1, const char *a2, ...)
{
  return [a1 _retrieveFile];
}

id objc_msgSend__run(void *a1, const char *a2, ...)
{
  return [a1 _run];
}

id objc_msgSend__saveChanges(void *a1, const char *a2, ...)
{
  return [a1 _saveChanges];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessQueue(void *a1, const char *a2, ...)
{
  return [a1 accessQueue];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_ageRating(void *a1, const char *a2, ...)
{
  return [a1 ageRating];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_approve(void *a1, const char *a2, ...)
{
  return [a1 approve];
}

id objc_msgSend_approverDSID(void *a1, const char *a2, ...)
{
  return [a1 approverDSID];
}

id objc_msgSend_approverStoreItems(void *a1, const char *a2, ...)
{
  return [a1 approverStoreItems];
}

id objc_msgSend_apsConnection(void *a1, const char *a2, ...)
{
  return [a1 apsConnection];
}

id objc_msgSend_apsQueue(void *a1, const char *a2, ...)
{
  return [a1 apsQueue];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return [a1 bag];
}

id objc_msgSend_biometricsToken(void *a1, const char *a2, ...)
{
  return [a1 biometricsToken];
}

id objc_msgSend_biometryType(void *a1, const char *a2, ...)
{
  return [a1 biometryType];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_canSendViaMessages(void *a1, const char *a2, ...)
{
  return [a1 canSendViaMessages];
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return [a1 clearCache];
}

id objc_msgSend_clearExpiredRequests(void *a1, const char *a2, ...)
{
  return [a1 clearExpiredRequests];
}

id objc_msgSend_clearRequests(void *a1, const char *a2, ...)
{
  return [a1 clearRequests];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_compile(void *a1, const char *a2, ...)
{
  return [a1 compile];
}

id objc_msgSend_completionHandlerAdapter(void *a1, const char *a2, ...)
{
  return [a1 completionHandlerAdapter];
}

id objc_msgSend_connectionListener(void *a1, const char *a2, ...)
{
  return [a1 connectionListener];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_createdDate(void *a1, const char *a2, ...)
{
  return [a1 createdDate];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return [a1 currentProcess];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_decline(void *a1, const char *a2, ...)
{
  return [a1 decline];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return [a1 defaultSound];
}

id objc_msgSend_deliveredNotifications(void *a1, const char *a2, ...)
{
  return [a1 deliveredNotifications];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_fileAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 fileAccessQueue];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return [a1 fileName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getCachedApprovalRequests(void *a1, const char *a2, ...)
{
  return [a1 getCachedApprovalRequests];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isApprover(void *a1, const char *a2, ...)
{
  return [a1 isApprover];
}

id objc_msgSend_isChildAccount(void *a1, const char *a2, ...)
{
  return [a1 isChildAccount];
}

id objc_msgSend_isGuardian(void *a1, const char *a2, ...)
{
  return [a1 isGuardian];
}

id objc_msgSend_isMocked(void *a1, const char *a2, ...)
{
  return [a1 isMocked];
}

id objc_msgSend_isOrganizer(void *a1, const char *a2, ...)
{
  return [a1 isOrganizer];
}

id objc_msgSend_isParent(void *a1, const char *a2, ...)
{
  return [a1 isParent];
}

id objc_msgSend_isRequester(void *a1, const char *a2, ...)
{
  return [a1 isRequester];
}

id objc_msgSend_isSubscription(void *a1, const char *a2, ...)
{
  return [a1 isSubscription];
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return [a1 isSupported];
}

id objc_msgSend_isTeenAccount(void *a1, const char *a2, ...)
{
  return [a1 isTeenAccount];
}

id objc_msgSend_itemBundleID(void *a1, const char *a2, ...)
{
  return [a1 itemBundleID];
}

id objc_msgSend_itemBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemBundleIdentifier];
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return [a1 itemDescription];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemIdentifier];
}

id objc_msgSend_itemTitle(void *a1, const char *a2, ...)
{
  return [a1 itemTitle];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineOfBusiness(void *a1, const char *a2, ...)
{
  return [a1 lineOfBusiness];
}

id objc_msgSend_localApprovalUser(void *a1, const char *a2, ...)
{
  return [a1 localApprovalUser];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_localizedPrice(void *a1, const char *a2, ...)
{
  return [a1 localizedPrice];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_me(void *a1, const char *a2, ...)
{
  return [a1 me];
}

id objc_msgSend_memberType(void *a1, const char *a2, ...)
{
  return [a1 memberType];
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return [a1 modifiedDate];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return [a1 notificationCenter];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_offerName(void *a1, const char *a2, ...)
{
  return [a1 offerName];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_peopleClient(void *a1, const char *a2, ...)
{
  return [a1 peopleClient];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return [a1 perform];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_presentedRequests(void *a1, const char *a2, ...)
{
  return [a1 presentedRequests];
}

id objc_msgSend_previewURL(void *a1, const char *a2, ...)
{
  return [a1 previewURL];
}

id objc_msgSend_previousLocalApprovalUsername(void *a1, const char *a2, ...)
{
  return [a1 previousLocalApprovalUsername];
}

id objc_msgSend_priceSummary(void *a1, const char *a2, ...)
{
  return [a1 priceSummary];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return [a1 productType];
}

id objc_msgSend_productTypeName(void *a1, const char *a2, ...)
{
  return [a1 productTypeName];
}

id objc_msgSend_productURL(void *a1, const char *a2, ...)
{
  return [a1 productURL];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeToken(void *a1, const char *a2, ...)
{
  return [a1 removeToken];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_requestInfo(void *a1, const char *a2, ...)
{
  return [a1 requestInfo];
}

id objc_msgSend_requestItems(void *a1, const char *a2, ...)
{
  return [a1 requestItems];
}

id objc_msgSend_requestStatus(void *a1, const char *a2, ...)
{
  return [a1 requestStatus];
}

id objc_msgSend_requestStore(void *a1, const char *a2, ...)
{
  return [a1 requestStore];
}

id objc_msgSend_requestString(void *a1, const char *a2, ...)
{
  return [a1 requestString];
}

id objc_msgSend_requestSummary(void *a1, const char *a2, ...)
{
  return [a1 requestSummary];
}

id objc_msgSend_requestURL(void *a1, const char *a2, ...)
{
  return [a1 requestURL];
}

id objc_msgSend_requesterDSID(void *a1, const char *a2, ...)
{
  return [a1 requesterDSID];
}

id objc_msgSend_requesterName(void *a1, const char *a2, ...)
{
  return [a1 requesterName];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retrieveRequestURL(void *a1, const char *a2, ...)
{
  return [a1 retrieveRequestURL];
}

id objc_msgSend_runUntilIdleExit(void *a1, const char *a2, ...)
{
  return [a1 runUntilIdleExit];
}

id objc_msgSend_selectedActionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 selectedActionIdentifier];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_sharedBag(void *a1, const char *a2, ...)
{
  return [a1 sharedBag];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedConfig];
}

id objc_msgSend_sharedDaemonConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedDaemonConfig];
}

id objc_msgSend_sharedExtensionManager(void *a1, const char *a2, ...)
{
  return [a1 sharedExtensionManager];
}

id objc_msgSend_sharedFrameworkConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedFrameworkConfig];
}

id objc_msgSend_sharedHandler(void *a1, const char *a2, ...)
{
  return [a1 sharedHandler];
}

id objc_msgSend_sharedReceiver(void *a1, const char *a2, ...)
{
  return [a1 sharedReceiver];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_sharedStore(void *a1, const char *a2, ...)
{
  return [a1 sharedStore];
}

id objc_msgSend_sharedUIServiceConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedUIServiceConfig];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_starRating(void *a1, const char *a2, ...)
{
  return [a1 starRating];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_storeQueue(void *a1, const char *a2, ...)
{
  return [a1 storeQueue];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_suppressDialog(void *a1, const char *a2, ...)
{
  return [a1 suppressDialog];
}

id objc_msgSend_thumbnailURLString(void *a1, const char *a2, ...)
{
  return [a1 thumbnailURLString];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return [a1 topic];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_updateRequestURL(void *a1, const char *a2, ...)
{
  return [a1 updateRequestURL];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}