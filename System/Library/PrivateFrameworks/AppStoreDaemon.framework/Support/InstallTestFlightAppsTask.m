@interface InstallTestFlightAppsTask
- (void)main;
@end

@implementation InstallTestFlightAppsTask

- (void)main
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v91 = objc_alloc_init((Class)NSMutableArray);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  obj = self->_installs;
  id v4 = [(NSArray *)obj countByEnumeratingWithState:&v103 objects:v114 count:16];
  id v89 = v3;
  if (v4)
  {
    id v5 = v4;
    uint64_t v96 = *(void *)v104;
    v90 = (void *)BAInitialRestrictionsEssentialDownloadAllowance;
    do
    {
      v6 = 0;
      id v92 = v5;
      do
      {
        if (*(void *)v104 != v96) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v103 + 1) + 8 * (void)v6);
        v8 = sub_1003147E0([AppInstallImportAndPolicyTask alloc], v7);
        id v9 = sub_10026E91C(v7, @"automatic_type");
        if (v8)
        {
          v8[49] = v9 == 0;
          v8[48] = v9 != 0;
          objc_setProperty_atomic_copy(v8, v10, &stru_1005279B0, 80);
        }
        if (v7) {
          v11 = (void *)v7[6];
        }
        else {
          v11 = 0;
        }
        id v12 = v11;

        if (v12)
        {
          if (v7) {
            id Property = objc_getProperty(v7, v13, 40, 1);
          }
          else {
            id Property = 0;
          }
          id v15 = Property;
          id v16 = [v15 count];

          if (!v16) {
            goto LABEL_29;
          }
          if (v7) {
            id v18 = objc_getProperty(v7, v17, 40, 1);
          }
          else {
            id v18 = 0;
          }
          id v19 = v18;
          v20 = [v19 objectAtIndexedSubscript:0];

          uint64_t v21 = [v20 valueForProperty:@"bytes_total"];
          if (v21)
          {
            v22 = v21;

            goto LABEL_25;
          }
          v23 = [v20 valueForProperty:@"package_url"];
          v24 = [DetermineSizeForURLTask alloc];
          v25 = sub_100424C14(v7);
          v26 = sub_100313E64((id *)&v24->super.super.super.isa, v23, v25);

          if ([(Task *)self runSubTask:v26 returningError:0])
          {
            id v28 = v26 ? objc_getProperty(v26, v27, 72, 1) : 0;
            v22 = v28;
          }
          else
          {
            v29 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v88 = sub_100424C14(v7);
              if (v26) {
                id v59 = objc_getProperty(v26, v58, 32, 1);
              }
              else {
                id v59 = 0;
              }
              id v60 = v59;
              *(_DWORD *)buf = 138543618;
              v111 = v88;
              __int16 v112 = 2114;
              id v113 = v60;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get package size using packageURL with error: %{public}@", buf, 0x16u);
            }
            v22 = 0;
          }

          id v5 = v92;
          if (v22)
          {
LABEL_25:
            if (sub_1003F1E7C((uint64_t)AppDefaultsManager, @"BackgroundAssetDownloadsEnabled", (id)1))
            {
              if (v7) {
                v30 = (void *)v7[6];
              }
              else {
                v30 = 0;
              }
              v31 = v30;
              sub_10026811C(v31, v90);
              v32 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v31 = ASDLogHandleForCategory();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                v33 = sub_100424C14(v7);
                *(_DWORD *)buf = 138412290;
                v111 = v33;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[%@] Not configuring TestFlight progress for post-processing because the BA feature is disabled", buf, 0xCu);
              }
              v32 = &off_10054C6A8;
            }

            sub_100336518([ProgressPortions alloc], (uint64_t)-[NSObject longLongValue](v22, "longLongValue"), (uint64_t)[v32 unsignedLongLongValue]);
            id v12 = v34;
            v35 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v36 = sub_100424C14(v7);
              *(_DWORD *)buf = 138412546;
              v111 = v36;
              __int16 v112 = 2114;
              id v113 = v12;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[%@] ProgressPortions have been created: %{public}@", buf, 0x16u);

              id v5 = v92;
            }

            if (v8) {
              objc_setProperty_atomic(v8, v37, v12, 96);
            }
          }
          else
          {
LABEL_29:
            v22 = ASDLogHandleForCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v57 = sub_100424C14(v7);
              *(_DWORD *)buf = 138543362;
              v111 = v57;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to determine size of TestFlight package, not creating progressPortions", buf, 0xCu);
            }
            id v12 = 0;
          }
        }
        id v102 = 0;
        unsigned __int8 v38 = [(Task *)self runSubTask:v8 returningError:&v102];
        id v39 = v102;
        v40 = ASDLogHandleForCategory();
        v41 = v40;
        if (v38)
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v42 = sub_100424C14(v7);
            *(_DWORD *)buf = 138412290;
            v111 = v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[%@] TestFlight import succeeded", buf, 0xCu);
          }
          if (v8)
          {
            id v44 = objc_getProperty(v8, v43, 104, 1);
            v46 = v44;
            if (v44) {
              id v44 = objc_getProperty(v44, v45, 24, 1);
            }
          }
          else
          {
            v46 = 0;
            id v44 = 0;
          }
          id v47 = v44;

          if (v47) {
            [v3 addObject:v47];
          }
          if (!self->_reportRemoteProgress)
          {
            v48 = sub_10026E95C(v7, @"bundle_id");
            if (v48)
            {
              v49 = [ProgressInfo alloc];
              v50 = sub_100424C14(v7);
              v51 = sub_10041F328((id *)&v49->super.isa, v48, v12, v50);

              v52 = sub_10026E82C(v7, @"item_id");
              v54 = v52;
              if (v51)
              {
                objc_setProperty_atomic(v51, v53, v52, 152);

                v51[18] = (id)129;
              }
              else
              {
              }
              v55 = sub_100388088();
              sub_100388208((uint64_t)v55, v51, @"TestFlight");

              id v3 = v89;
            }

            id v5 = v92;
          }
        }
        else
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v56 = sub_100424C14(v7);
            *(_DWORD *)buf = 138412546;
            v111 = v56;
            __int16 v112 = 2114;
            id v113 = v39;
            _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "[%@] TestFlight import failed: %{public}@", buf, 0x16u);
          }
          if (v39) {
            [v91 addObject:v39];
          }
        }

        v6 = (char *)v6 + 1;
      }
      while (v5 != v6);
      id v61 = [(NSArray *)obj countByEnumeratingWithState:&v103 objects:v114 count:16];
      id v5 = v61;
    }
    while (v61);
  }

  v62 = v91;
  if (self->_reportRemoteProgress)
  {
    v63 = sub_1002DC980();
    uint64_t v64 = sub_1002DCAAC((uint64_t)v63);

    v97 = (unsigned char *)v64;
    if (v64)
    {
      obja = objc_alloc_init(XDCRegisterAppMessage);
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      v95 = self->_installs;
      id v65 = [(NSArray *)v95 countByEnumeratingWithState:&v98 objects:v109 count:16];
      if (v65)
      {
        id v66 = v65;
        uint64_t v67 = *(void *)v99;
        do
        {
          v68 = 0;
          do
          {
            if (*(void *)v99 != v67) {
              objc_enumerationMutation(v95);
            }
            v69 = *(void **)(*((void *)&v98 + 1) + 8 * (void)v68);
            v70 = sub_10026E95C(v69, @"bundle_id");
            if (v70)
            {
              if (v97[18])
              {
                v71 = sub_1002AA280(v69);
                sub_1003D277C((uint64_t)obja, v71);
              }
              v72 = [ProgressInfo alloc];
              v73 = sub_100424C14(v69);
              v74 = sub_10041F328((id *)&v72->super.isa, v70, 0, v73);

              if (v74)
              {
                *((unsigned char *)v74 + 64) = 1;
                v75 = sub_10026E82C(v69, @"item_id");
                objc_setProperty_atomic(v74, v76, v75, 152);

                v74[18] = (id)129;
              }
              else
              {
                sub_10026E82C(v69, @"item_id");
              }
              v77 = sub_100388088();
              sub_100388208((uint64_t)v77, v74, @"TestFlight");
            }
            v68 = (char *)v68 + 1;
          }
          while (v66 != v68);
          id v78 = [(NSArray *)v95 countByEnumeratingWithState:&v98 objects:v109 count:16];
          id v66 = v78;
        }
        while (v78);
      }

      if (v97[18])
      {
        v79 = sub_1003177EC();
        sub_100317DA8((uint64_t)v79, obja, 5, v97);
      }
      id v3 = v89;
      v62 = v91;
    }
  }
  v80 = sub_1002ED270();
  sub_1002EDDA0((uint64_t)v80, 64);

  [(Task *)self lock];
  v81 = (NSArray *)[v3 copy];
  processedExternalIDs = self->_processedExternalIDs;
  self->_processedExternalIDs = v81;

  [(Task *)self unlock];
  if ([v62 count])
  {
    if ([v62 count] == (id)1)
    {
      v83 = [v62 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v84 = ASDErrorDomain;
      NSErrorUserInfoKey v107 = NSMultipleUnderlyingErrorsKey;
      id v85 = [v62 copy];
      id v108 = v85;
      v86 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      v83 = +[NSError errorWithDomain:v84 code:537 userInfo:v86];
    }
    v87 = ASDErrorWithSafeUserInfo();
    [(Task *)self completeWithError:v87];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedExternalIDs, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_installs, 0);
}

@end