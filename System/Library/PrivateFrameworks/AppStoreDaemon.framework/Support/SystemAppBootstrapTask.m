@interface SystemAppBootstrapTask
- (void)main;
@end

@implementation SystemAppBootstrapTask

- (void)main
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NSMutableDictionary *)self->_installs count];
    *(_DWORD *)buf = 134217984;
    id v93 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to bootstrap %lu system app(s)", buf, 0xCu);
  }

  v5 = [(NSMutableDictionary *)self->_installs allKeys];
  v6 = +[NSMutableSet setWithArray:v5];

  v7 = [v6 allObjects];
  v8 = sub_1003012F8((uint64_t)SystemAppLookupTask, v7);

  id v83 = 0;
  unsigned int v9 = [(Task *)self runSubTask:v8 returningError:&v83];
  id v11 = v83;
  v70 = v6;
  if (v9)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    if (v8) {
      id Property = objc_getProperty(v8, v10, 48, 1);
    }
    else {
      id Property = 0;
    }
    id obj = Property;
    id v73 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
    v68 = v8;
    if (!v73)
    {
LABEL_41:

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v40 = v6;
      id v41 = [v40 countByEnumeratingWithState:&v74 objects:v88 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v75;
        do
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v75 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = [(NSMutableDictionary *)self->_installs objectForKeyedSubscript:*(void *)(*((void *)&v74 + 1) + 8 * i)];
            [v45 setValue:&off_10054B6B8 forProperty:@"phase"];
          }
          id v42 = [v40 countByEnumeratingWithState:&v74 objects:v88 count:16];
        }
        while (v42);
      }

      [(Task *)self lock];
      v46 = [(NSMutableDictionary *)self->_installs allValues];
      results = self->_results;
      self->_results = v46;

      [(Task *)self unlock];
      [(Task *)self completeWithSuccess];
      v8 = v68;
      goto LABEL_74;
    }
    uint64_t v72 = *(void *)v80;
    v69 = self;
LABEL_8:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v80 != v72) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v79 + 1) + 8 * v13);
      installs = self->_installs;
      v16 = v14 ? (void *)v14[2] : 0;
      id v17 = v16;
      v18 = [(NSMutableDictionary *)installs objectForKeyedSubscript:v17];

      if (v18) {
        break;
      }
      v19 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        if (v14) {
          v34 = (void *)v14[2];
        }
        else {
          v34 = 0;
        }
        id v25 = v34;
        *(_DWORD *)buf = 138543362;
        id v93 = v25;
        _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Received item for unexpected system app: %{public}@", buf, 0xCu);
LABEL_30:
      }
      if (v14) {
        v37 = (void *)v14[2];
      }
      else {
        v37 = 0;
      }
      id v38 = v37;
      [v6 removeObject:v38];

      if (v73 == (id)++v13)
      {
        id v39 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
        id v73 = v39;
        if (!v39) {
          goto LABEL_41;
        }
        goto LABEL_8;
      }
    }
    v19 = sub_100209368([AppPackage alloc], v14);
    v89 = v19;
    v20 = +[NSArray arrayWithObjects:&v89 count:1];
    objc_setProperty_atomic_copy(v18, v21, v20, 40);

    v22 = +[NSNull null];
    [v18 setValue:v22 forProperty:@"failure_error"];

    [v18 setValue:&off_10054B6A0 forProperty:@"bootstrapped"];
    if (v14) {
      v23 = (void *)v14[8];
    }
    else {
      v23 = 0;
    }
    id v24 = v23;
    [v18 setValue:v24 forProperty:@"bundle_name"];

    sub_1003D4A3C();
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    if (((unint64_t)sub_10026E91C(v18, @"IFNULL(app_install.priority, 0)") & 0x8000000000000000) != 0)
    {
      sub_1003D4C80((uint64_t)v25, 3);
      sub_1003D4D3C((uint64_t)v25, 3);
      sub_1003D4B04((uint64_t)v25, 62);
    }
    else
    {
      id v27 = objc_getProperty(v18, v26, 40, 1);
      [v27 firstObject];
      v29 = v28 = v11;
      v30 = sub_1003B66E0(v18, v29);

      v31 = (uint64_t *)sub_1003B8854((id *)[ReviewNetworkPolicyTask alloc], v30);
      id v78 = v28;
      unsigned int v32 = [(Task *)self runSubTask:v31 returningError:&v78];
      id v11 = v78;

      if (v32)
      {
        if (v31)
        {
          sub_1003D4C80((uint64_t)v25, v31[7]);
          sub_1003D4D3C((uint64_t)v25, v31[8]);
          uint64_t v33 = v31[9];
        }
        else
        {
          sub_1003D4C80((uint64_t)v25, 0);
          sub_1003D4D3C((uint64_t)v25, 0);
          uint64_t v33 = 0;
        }
        sub_1003D4B04((uint64_t)v25, v33);
      }

      self = v69;
      v6 = v70;
    }
    sub_100424D18(v18, (id *)v25);
    v35 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = sub_100424C14(v18);
      *(_DWORD *)buf = 138412290;
      id v93 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[%@] Bootstrap completed", buf, 0xCu);
    }
    goto LABEL_30;
  }
  v48 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    id v67 = [(NSMutableDictionary *)self->_installs count];
    *(_DWORD *)buf = 134218242;
    id v93 = v67;
    __int16 v94 = 2114;
    id v95 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Bootstrap for %lu system app(s) failed with error: %{public}@", buf, 0x16u);
  }

  if (!os_variant_has_internal_content()) {
    goto LABEL_73;
  }
  id v49 = v11;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v50 = [(NSMutableDictionary *)self->_installs objectEnumerator];
  id v51 = [v50 countByEnumeratingWithState:&v84 objects:buf count:16];
  if (!v51) {
    goto LABEL_72;
  }
  id v52 = v51;
  uint64_t v53 = *(void *)v85;
  while (2)
  {
    for (j = 0; j != v52; j = (char *)j + 1)
    {
      if (*(void *)v85 != v53) {
        objc_enumerationMutation(v50);
      }
      if (!sub_10026E7EC(*(id *)(*((void *)&v84 + 1) + 8 * (void)j), @"supress_dialogs"))
      {

        id v55 = v49;
        self;
        id v56 = v55;
        v57 = [v56 domain];
        unsigned int v58 = [v57 isEqualToString:ASDErrorDomain];

        if (v58)
        {
          v59 = [v56 userInfo];
          v60 = [v59 objectForKeyedSubscript:NSUnderlyingErrorKey];

          id v61 = v56;
          v6 = v70;
          if (v60)
          {
            id v61 = v60;
          }
          if ([v56 code] == (id)513) {
            v62 = @"Basejumper does not have assets for this build. Please try again later.";
          }
          else {
            v62 = @"Unable to connect to basejumper. Make sure you are on an internal network or have VPN on-demand enabled.";
          }

          if (!v61) {
            goto LABEL_71;
          }
        }
        else
        {
          v62 = @"An unknown error occurred. Make sure you are on an internal network or have VPN on-demand enabled.";
          id v61 = v56;
          v6 = v70;
          if (!v56)
          {
LABEL_71:

            v50 = +[AMSDialogRequest requestWithTitle:@"Internal Only" message:v62];

            v64 = ASDLocalizedString();
            v65 = +[AMSDialogAction actionWithTitle:v64 style:0];

            v91 = v65;
            v66 = +[NSArray arrayWithObjects:&v91 count:1];
            [v50 setButtonActions:v66];

            sub_100422394(v50, @"systemAppBootstrapInternal");
            sub_10025F158(v65, @"ok");
            sub_10033CE18((uint64_t)InteractiveRequestPresenter, v50, 0);

            goto LABEL_72;
          }
        }
        v63 = [v61 domain];
        -[__CFString stringByAppendingFormat:](v62, "stringByAppendingFormat:", @" (%@: %ld)", v63, [v61 code]);
        v62 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_71;
      }
    }
    id v52 = [v50 countByEnumeratingWithState:&v84 objects:buf count:16];
    if (v52) {
      continue;
    }
    break;
  }
  v6 = v70;
LABEL_72:

LABEL_73:
  [(Task *)self completeWithError:v11];
LABEL_74:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_installs, 0);
}

@end