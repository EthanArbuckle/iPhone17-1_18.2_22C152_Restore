id sub_418C()
{
  void *v0;
  void block[5];
  uint64_t vars8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4230;
  block[3] = &unk_C3B0;
  block[4] = self;
  if (qword_10DE8 != -1) {
    dispatch_once(&qword_10DE8, block);
  }
  v0 = (void *)qword_10DE0;

  return v0;
}

uint64_t sub_4230(uint64_t a1)
{
  qword_10DE0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_44F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_456C(uint64_t a1)
{
  v1 = sub_46A0(a1, @"ActiveDSID", 0, 1);

  return v1;
}

id sub_45A8()
{
  self;
  v3[0] = @"ForceAppDRMMode";
  v3[1] = @"CellularSettings";
  v3[2] = @"ActiveCompanionSim";
  v0 = +[NSArray arrayWithObjects:v3 count:3];
  v1 = +[NSSet setWithArray:v0];

  return v1;
}

id sub_466C(void *a1, void *a2, void *a3)
{
  if (a1)
  {
    a1 = sub_46A0((uint64_t)a1, a2, a3, 0);
    uint64_t v3 = vars8;
  }
  return a1;
}

id sub_46A0(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = [*(id *)(a1 + 32) synchronize];
    id v10 = v8;
    v11 = [*(id *)(a1 + 32) dictionaryForKey:@"AutoSettingsData"];
    v12 = v11;
    if (a4)
    {
      [v11 objectForKeyedSubscript:v7];
      v13 = v10;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = sub_456C(a1);
      v13 = v14;
      if (v14)
      {
        v15 = [v14 stringValue];
        v16 = [v12 objectForKeyedSubscript:v15];

        if (v16)
        {
          v17 = [v16 objectForKeyedSubscript:v7];

          if (v17)
          {
            uint64_t v18 = [v16 objectForKeyedSubscript:v7];

            id v10 = (id)v18;
          }
        }
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void sub_47EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = *(NSObject **)(a1 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_48B4;
    block[3] = &unk_C3D8;
    block[4] = a1;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

void sub_48B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v18 = *(id *)(a1 + 40);
  id v3 = v2;
  if (v1)
  {
    v4 = [*(id *)(v1 + 32) dictionaryForKey:@"AutoSettingsData"];
    id v5 = [v4 mutableCopy];

    if (!v5) {
      id v5 = (id)objc_opt_new();
    }
    id v6 = sub_456C(v1);
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 stringValue];
      id v9 = [v5 objectForKeyedSubscript:v8];
      id v10 = [v9 mutableCopy];

      if (!v10) {
        id v10 = (id)objc_opt_new();
      }
      [v10 setObject:v18 forKeyedSubscript:v3];
      v11 = [v7 stringValue];
      [v5 setObject:v10 forKeyedSubscript:v11];
    }
    [*(id *)(v1 + 32) setObject:v5 forKey:@"AutoSettingsData"];
    id v12 = [*(id *)(v1 + 32) synchronize];
    v14 = *(void **)(v1 + 32);
    v13 = *(void **)(v1 + 40);
    v15 = @"AutoSettingsData";
    v16 = [v14 domain];
    v17 = +[NSSet setWithObject:@"AutoSettingsData"];

    [v13 synchronizeNanoDomain:v16 keys:v17];
  }
}

void sub_4A6C(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"WatchSettingsManagerSettingsChangedExternallyNotification" object:0];
}

void sub_4AC0(uint64_t a1)
{
  v2 = ASDLogHandleForCategory(14);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Received a notification that preferences have changed externally.", (uint8_t *)&v6, 2u);
  }

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = ASDLogHandleForCategory(14);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_opt_class();
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Received notification that settings changed externally.", (uint8_t *)&v6, 0xCu);
    }

    dispatch_async(WeakRetained[2], &stru_C3F8);
  }
}

id ASDLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AppStoreDaemon.framework"];
  id v3 = +[NSLocale preferredLanguages];
  v4 = [v2 localizations];
  uint64_t v5 = +[NSBundle preferredLocalizationsFromArray:v4 forPreferences:v3];
  int v6 = [v5 firstObject];
  uint64_t v7 = [v2 localizedStringForKey:v1 value:0 table:0 localization:v6];

  return v7;
}

id ASDLogHandleForCategory(uint64_t a1)
{
  if (qword_10F68 != -1) {
    dispatch_once(&qword_10F68, &stru_C470);
  }
  v2 = (void *)qword_10E10[a1];

  return v2;
}

void sub_54F8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.appstored", "Activity");
  v2 = (void *)qword_10E10[0];
  qword_10E10[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.appstored", "AppCapabilities");
  v4 = (void *)qword_10E18;
  qword_10E18 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.appstored", "AppInstall");
  int v6 = (void *)qword_10E20;
  qword_10E20 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.appstored", "AppUsage");
  id v8 = (void *)qword_10E28;
  qword_10E28 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.appstored", "Arcade");
  id v10 = (void *)qword_10E30;
  qword_10E30 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.appstored", "Bag");
  id v12 = (void *)qword_10E38;
  qword_10E38 = (uint64_t)v11;

  os_log_t v13 = os_log_create("com.apple.appstored", "Cleanup");
  v14 = (void *)qword_10E40;
  qword_10E40 = (uint64_t)v13;

  os_log_t v15 = os_log_create("com.apple.appstored", "Clips");
  v16 = (void *)qword_10E48;
  qword_10E48 = (uint64_t)v15;

  os_log_t v17 = os_log_create("com.apple.appstored", "DAAP");
  id v18 = (void *)qword_10E50;
  qword_10E50 = (uint64_t)v17;

  os_log_t v19 = os_log_create("com.apple.appstored", "Daemon");
  v20 = (void *)qword_10E58;
  qword_10E58 = (uint64_t)v19;

  os_log_t v21 = os_log_create("com.apple.appstored", "Download");
  v22 = (void *)qword_10E60;
  qword_10E60 = (uint64_t)v21;

  os_log_t v23 = os_log_create("com.apple.appstored", "EventsExtension");
  v24 = (void *)qword_10E68;
  qword_10E68 = (uint64_t)v23;

  os_log_t v25 = os_log_create("com.apple.appstored", "Extension");
  v26 = (void *)qword_10E70;
  qword_10E70 = (uint64_t)v25;

  os_log_t v27 = os_log_create("com.apple.appstored", "Framework");
  v28 = (void *)qword_10E78;
  qword_10E78 = (uint64_t)v27;

  os_log_t v29 = os_log_create("com.apple.appstored", "General");
  v30 = (void *)qword_10E80;
  qword_10E80 = (uint64_t)v29;

  os_log_t v31 = os_log_create("com.apple.appstored", "Library");
  v32 = (void *)qword_10E88;
  qword_10E88 = (uint64_t)v31;

  os_log_t v33 = os_log_create("com.apple.appstored", "Metrics");
  v34 = (void *)qword_10E90;
  qword_10E90 = (uint64_t)v33;

  os_log_t v35 = os_log_create("com.apple.appstored", "Migrate");
  v36 = (void *)qword_10E98;
  qword_10E98 = (uint64_t)v35;

  os_log_t v37 = os_log_create("com.apple.appstored", "StoreKitInXcode");
  v38 = (void *)qword_10EA0;
  qword_10EA0 = (uint64_t)v37;

  os_log_t v39 = os_log_create("com.apple.appstored", "ODR");
  v40 = (void *)qword_10EA8;
  qword_10EA8 = (uint64_t)v39;

  os_log_t v41 = os_log_create("com.apple.appstored", "Offloading");
  v42 = (void *)qword_10EB0;
  qword_10EB0 = (uint64_t)v41;

  os_log_t v43 = os_log_create("com.apple.appstored", "Daemon-Oversize");
  v44 = (void *)qword_10EB8;
  qword_10EB8 = (uint64_t)v43;

  os_log_t v45 = os_log_create("com.apple.appstored", "Performance");
  v46 = (void *)qword_10EC0;
  qword_10EC0 = (uint64_t)v45;

  os_log_t v47 = os_log_create("com.apple.appstored", "PrivilegedTask");
  v48 = (void *)qword_10EC8;
  qword_10EC8 = (uint64_t)v47;

  os_log_t v49 = os_log_create("com.apple.appstored", "Progress");
  v50 = (void *)qword_10ED0;
  qword_10ED0 = (uint64_t)v49;

  os_log_t v51 = os_log_create("com.apple.appstored", "Purchase");
  v52 = (void *)qword_10ED8;
  qword_10ED8 = (uint64_t)v51;

  os_log_t v53 = os_log_create("com.apple.appstored", "Push");
  v54 = (void *)qword_10EE0;
  qword_10EE0 = (uint64_t)v53;

  os_log_t v55 = os_log_create("com.apple.appstored", "QA");
  v56 = (void *)qword_10EE8;
  qword_10EE8 = (uint64_t)v55;

  os_log_t v57 = os_log_create("com.apple.appstored", "Repair");
  v58 = (void *)qword_10EF0;
  qword_10EF0 = (uint64_t)v57;

  os_log_t v59 = os_log_create("com.apple.appstored", "Restore");
  v60 = (void *)qword_10EF8;
  qword_10EF8 = (uint64_t)v59;

  os_log_t v61 = os_log_create("com.apple.appstored", "Scheduler");
  v62 = (void *)qword_10F00;
  qword_10F00 = (uint64_t)v61;

  os_log_t v63 = os_log_create("com.apple.appstored", "Signpost");
  v64 = (void *)qword_10F08;
  qword_10F08 = (uint64_t)v63;

  os_log_t v65 = os_log_create("com.apple.appstored", "SKAdNetwork");
  v66 = (void *)qword_10F10;
  qword_10F10 = (uint64_t)v65;

  os_log_t v67 = os_log_create("com.apple.appstored", "Skanner");
  v68 = (void *)qword_10F18;
  qword_10F18 = (uint64_t)v67;

  os_log_t v69 = os_log_create("com.apple.appstored", "SoftwareMap");
  v70 = (void *)qword_10F20;
  qword_10F20 = (uint64_t)v69;

  os_log_t v71 = os_log_create("com.apple.appstored", "SQL");
  v72 = (void *)qword_10F28;
  qword_10F28 = (uint64_t)v71;

  os_log_t v73 = os_log_create("com.apple.appstored", "StoreKit");
  v74 = (void *)qword_10F30;
  qword_10F30 = (uint64_t)v73;

  os_log_t v75 = os_log_create("com.apple.appstored", "Subscription");
  v76 = (void *)qword_10F38;
  qword_10F38 = (uint64_t)v75;

  os_log_t v77 = os_log_create("com.apple.appstored", "TestFlightFeedback");
  v78 = (void *)qword_10F40;
  qword_10F40 = (uint64_t)v77;

  os_log_t v79 = os_log_create("com.apple.appstored", "TestFlightExtension");
  v80 = (void *)qword_10F48;
  qword_10F48 = (uint64_t)v79;

  os_log_t v81 = os_log_create("com.apple.appstored", "Updates");
  v82 = (void *)qword_10F50;
  qword_10F50 = (uint64_t)v81;

  os_log_t v83 = os_log_create("com.apple.appstored", "VPP");
  v84 = (void *)qword_10F58;
  qword_10F58 = (uint64_t)v83;

  qword_10F60 = (uint64_t)os_log_create("com.apple.appstored", "XDC");

  _objc_release_x1();
}

void sub_5BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5BF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadForExternalChange];
}

void sub_65BC(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v4 = [a1[24] clearDialog:v3];
    id v12 = 0;
    unsigned int v5 = [v4 resultWithError:&v12];
    id v6 = v12;

    if (v5 && ([v3 identifier], os_log_t v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      [a1 beginUpdates];
      id v8 = [v3 identifier];
      [a1 removeSpecifierID:v8 animated:1];

      [a1 endUpdates];
    }
    else if (v6)
    {
      os_log_t v9 = ASDLogHandleForCategory(14);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = objc_opt_class();
        os_log_t v11 = [v3 identifier];
        *(_DWORD *)buf = 138543874;
        uint64_t v14 = v10;
        __int16 v15 = 2114;
        v16 = v11;
        __int16 v17 = 2114;
        id v18 = v6;
        _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Error clearing repair dialog (%{public}@): %{public}@", buf, 0x20u);
      }
    }
  }
}

void sub_6E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  objc_destroyWeak(v34);
  objc_destroyWeak((id *)(v35 - 256));
  _Unwind_Resume(a1);
}

void sub_6E78(uint64_t a1, int a2)
{
  val = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (a2)
  {
    v4 = *(void **)(a1 + 40);
    id v5 = *(id *)(a1 + 32);
    id v6 = v4;
    if (val)
    {
      os_log_t v7 = [v5 deepLink];
      id v8 = +[NSURLComponents componentsWithURL:v7 resolvingAgainstBaseURL:0];

      os_log_t v9 = [v8 scheme];
      unsigned int v10 = [v9 isEqualToString:@"itms-ui"];

      if (v10) {
        [v8 setScheme:@"https"];
      }
      id location = 0;
      p_id location = &location;
      uint64_t v21 = 0x2050000000;
      id v11 = (id)qword_10E00;
      uint64_t v22 = qword_10E00;
      if (!qword_10E00)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v24 = sub_8634;
        os_log_t v25 = &unk_C600;
        v26 = &location;
        sub_8634((uint64_t)&buf);
        id v11 = p_location[3];
      }
      id v12 = (objc_class *)v11;
      _Block_object_dispose(&location, 8);
      id v13 = [v12 alloc];
      uint64_t v14 = [v8 URL];
      id v15 = [v13 initWithAccountURL:v14];

      [v15 setDelegate:val];
      if (v6)
      {
        objc_storeStrong(val + 23, v4);
        objc_initWeak(&location, val);
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v24 = sub_8050;
        os_log_t v25 = &unk_C588;
        v26 = val;
        objc_copyWeak(&v28, &location);
        id v27 = v15;
        [v27 prepareWithCompletionBlock:&buf];

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
      else
      {
        v16 = ASDLogHandleForCategory(14);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = objc_opt_class();
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v17;
          _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "[%{public}@]: Action tapped but no dialog request found", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
}

void sub_717C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
}

void sub_71B4(uint64_t a1, int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
  {
    id v5 = WeakRetained;
    sub_65BC(WeakRetained, *(void **)(a1 + 32));
    id WeakRetained = v5;
  }
}

void sub_720C(uint64_t a1, void *a2)
{
  os_log_t v45 = a2;
  if (a1)
  {
    v46 = sub_7A70();
    id v3 = [v46 valueForProperty:NRDevicePropertyIsAltAccount];
    unsigned int v4 = [v3 BOOLValue];

    if (v4)
    {
      id v43 = v46;
      id v5 = [v43 valueForProperty:@"_altAccountAltDSID"];
      if (v5)
      {
        id v6 = objc_opt_new();
        [v6 setCachePolicy:1];
        uint64_t v58 = 0;
        os_log_t v59 = &v58;
        uint64_t v60 = 0x3032000000;
        os_log_t v61 = sub_82E4;
        v62 = sub_82F4;
        id v63 = 0;
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_82FC;
        v55[3] = &unk_C5D8;
        v55[4] = a1;
        os_log_t v57 = &v58;
        os_log_t v7 = dispatch_semaphore_create(0);
        v56 = v7;
        v44 = v6;
        [v6 startRequestWithCompletionHandler:v55];
        dispatch_time_t v8 = dispatch_time(0, 30000000000);
        v42 = v7;
        if (dispatch_semaphore_wait(v7, v8))
        {
          os_log_t v9 = ASDLogHandleForCategory(14);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v40 = objc_opt_class();
            *(_DWORD *)long long buf = 138543362;
            uint64_t v65 = v40;
            _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Timed out attempting to sync the family circle", buf, 0xCu);
          }
          id v10 = 0;
        }
        else
        {
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          uint64_t v21 = [(id)v59[5] members];
          id v22 = [v21 countByEnumeratingWithState:&v51 objects:buf count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v52;
            while (2)
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v52 != v23) {
                  objc_enumerationMutation(v21);
                }
                os_log_t v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
                v26 = [v25 altDSID];
                unsigned int v27 = [v26 isEqualToString:v5];

                if (v27)
                {
                  id v22 = v5;
                  id v28 = [v25 dsid];
                  os_log_t v29 = [v25 appleID];
                  goto LABEL_27;
                }
              }
              id v22 = [v21 countByEnumeratingWithState:&v51 objects:buf count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
          id v28 = 0;
          os_log_t v29 = 0;
LABEL_27:

          os_log_t v9 = v22;
          id v30 = v28;
          id v31 = v29;
          v32 = +[ACAccountStore ams_sharedAccountStore];
          objc_msgSend(v32, "ams_iTunesAccountWithAltDSID:DSID:username:", v9, v30, v31);
          id v10 = (id)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            if (v9 || v30 || v31)
            {
              os_log_t v33 = +[ACAccountStore ams_sharedAccountStore];
              v34 = [v33 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifieriTunesStore];

              id v10 = [objc_alloc((Class)ACAccount) initWithAccountType:v34];
              objc_msgSend(v10, "ams_setAltDSID:", v9);
              objc_msgSend(v10, "ams_setDSID:", v30);
              [v10 setUsername:v31];
            }
            else
            {
              id v10 = 0;
            }
          }
        }
        _Block_object_dispose(&v58, 8);
      }
      else
      {
        v44 = ASDLogHandleForCategory(14);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          uint64_t v65 = objc_opt_class();
          __int16 v66 = 2114;
          id v67 = v43;
          _os_log_error_impl(&dword_0, v44, OS_LOG_TYPE_ERROR, "[%{public}@]: No alt DSID found for device: %{public}@", buf, 0x16u);
        }
        id v10 = 0;
      }

      if (!v10)
      {
        os_log_t v39 = ASDLogHandleForCategory(14);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          uint64_t v41 = objc_opt_class();
          *(_DWORD *)long long buf = 138543362;
          uint64_t v65 = v41;
          _os_log_error_impl(&dword_0, v39, OS_LOG_TYPE_ERROR, "[%{public}@]: Requested active family account authentication but there is no active family iTunes account.", buf, 0xCu);
        }

        v45[2](v45, 0);
        goto LABEL_40;
      }
    }
    else
    {
      id v11 = +[ACAccountStore ams_sharedAccountStore];
      objc_msgSend(v11, "ams_activeiTunesAccount");
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        id v12 = ASDLogHandleForCategory(14);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543362;
          uint64_t v65 = objc_opt_class();
          _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "[%{public}@]: Requested active account authentication but there is no active iTunes account.", buf, 0xCu);
        }

        id v13 = ASDLogHandleForCategory(14);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = objc_opt_class();
          *(_DWORD *)long long buf = 138543362;
          uint64_t v65 = v14;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Presenting sign-in needed dialog.", buf, 0xCu);
        }

        id v15 = ASDLocalizedString(@"SIGN_IN_TO_APP_STORE_ON_THIS_IPHONE");
        v16 = +[AMSDialogRequest requestWithTitle:0 message:v15];

        uint64_t v17 = ASDLocalizedString(@"OK");
        id v18 = +[AMSDialogAction actionWithTitle:v17];
        [v16 addButtonAction:v18];

        id v19 = [objc_alloc((Class)AMSSystemAlertDialogTask) initWithRequest:v16];
        v20 = [v19 present];
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_7D9C;
        v47[3] = &unk_C560;
        v47[4] = a1;
        v48 = v45;
        [v20 addFinishBlock:v47];

        goto LABEL_40;
      }
    }
    id v35 = objc_alloc_init((Class)AMSAuthenticateOptions);
    [v35 setProxyAppBundleID:@"com.apple.AppStore"];
    [v35 setForceSyncToPairedWatch:v4 ^ 1];
    id v36 = [objc_alloc((Class)AMSAuthenticateRequest) initWithAccount:v10 options:v35];
    id v37 = [objc_alloc((Class)sub_7AF8()) initWithRequest:v36 presentingViewController:a1];
    sub_7BDC(a1);
    v38 = [v37 performAuthentication];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_7C50;
    v49[3] = &unk_C538;
    v49[4] = a1;
    v50 = v45;
    [v38 addFinishBlock:v49];

LABEL_40:
  }
}

void sub_7A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

id sub_7A70()
{
  v0 = +[NRPairedDeviceRegistry sharedInstance];
  os_log_t v1 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  v2 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:v1];
  id v3 = [v2 firstObject];

  return v3;
}

id sub_7AF8()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_10DF0;
  uint64_t v7 = qword_10DF0;
  if (!qword_10DF0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_846C;
    void v3[3] = &unk_C600;
    v3[4] = &v4;
    sub_846C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_7BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_7BDC(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_81C0;
  block[3] = &unk_C5B0;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_7C50(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  sub_7D04(*(void *)(a1 + 32));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_7D80;
  v7[3] = &unk_C510;
  id v5 = *(id *)(a1 + 40);
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

void sub_7D04(uint64_t a1)
{
  if (a1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_8288;
    block[3] = &unk_C5B0;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_7D80(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

uint64_t sub_7D9C(uint64_t a1)
{
  v2 = ASDLogHandleForCategory(14);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = objc_opt_class();
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Sign-in needed dialog acknowledged.", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_7E60(uint64_t a1)
{
  sub_7D04(*(void *)(a1 + 32));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void sub_8050(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = ASDLogHandleForCategory(14);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543618;
      uint64_t v7 = objc_opt_class();
      __int16 v8 = 2114;
      id v9 = v4;
      _os_log_error_impl(&dword_0, WeakRetained, OS_LOG_TYPE_ERROR, "[%{public}@]: Error preparing account view controller: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
  }
}

id sub_81B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_81C0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationItem];
  uint64_t v3 = [v2 rightBarButtonItem];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 200);
  *(void *)(v4 + 200) = v3;

  id v8 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  id v6 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v8];
  [v8 startAnimating];
  uint64_t v7 = [*(id *)(a1 + 32) navigationItem];
  [v7 setRightBarButtonItem:v6];
}

void sub_8288(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[25];
  id v3 = [v1 navigationItem];
  [v3 setRightBarButtonItem:v2];
}

uint64_t sub_82E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_82F4(uint64_t a1)
{
}

void sub_82FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = ASDLogHandleForCategory(14);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543618;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Error loading family circle: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

Class sub_846C(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_10DF8)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_85C0;
    v4[4] = &unk_C3B0;
    v4[5] = v4;
    long long v5 = off_C620;
    uint64_t v6 = 0;
    qword_10DF8 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_10DF8)
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
    Class result = objc_getClass("AMSUIAuthenticateTask");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_10DF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_85C0()
{
  uint64_t result = _sl_dlopen();
  qword_10DF8 = result;
  return result;
}

void sub_8634(uint64_t a1)
{
  if (!qword_10E08) {
    qword_10E08 = (uint64_t)dlopen("/System/Library/Frameworks/StoreKit.framework/StoreKit", 2);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SKAccountPageViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10E00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = (const void *)abort_report_np();
    _Block_object_dispose(v2, v3);
  }
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void free(void *a1)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__newFormattedLabel(void *a1, const char *a2, ...)
{
  return [a1 _newFormattedLabel];
}

id objc_msgSend__reloadForExternalChange(void *a1, const char *a2, ...)
{
  return [a1 _reloadForExternalChange];
}

id objc_msgSend__setupLabels(void *a1, const char *a2, ...)
{
  return [a1 _setupLabels];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return [a1 altDSID];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buttonActions(void *a1, const char *a2, ...)
{
  return [a1 buttonActions];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_deepLink(void *a1, const char *a2, ...)
{
  return [a1 deepLink];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return [a1 dsid];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return [a1 layoutSubviews];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_members(void *a1, const char *a2, ...)
{
  return [a1 members];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_performAuthentication(void *a1, const char *a2, ...)
{
  return [a1 performAuthentication];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_repairSubtitle(void *a1, const char *a2, ...)
{
  return [a1 repairSubtitle];
}

id objc_msgSend_repairTitle(void *a1, const char *a2, ...)
{
  return [a1 repairTitle];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return [a1 textColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}