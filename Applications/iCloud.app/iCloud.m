id sub_1000030B0(uint64_t a1)
{
  id result;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t vars8;

  result = [*(id *)(a1 + 32) state];
  switch((unint64_t)result)
  {
    case 0uLL:
    case 1uLL:
      v3 = *(void **)(a1 + 32);
      v4 = 5;
      goto LABEL_4;
    case 2uLL:
      v3 = *(void **)(a1 + 32);
      v4 = 3;
LABEL_4:
      result = [v3 setState:v4];
      break;
    case 4uLL:
      v5 = *(void **)(a1 + 32);
      result = [v5 _dismiss];
      break;
    default:
      return result;
  }
  return result;
}

void sub_10000351C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a3 & 3) != 0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v4 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v8 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unexpected response from retrieving notification: %lx", buf, 0xCu);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = [WeakRetained delegate];
    [v5 retrievingDialogCancelled];
  }
}

id sub_100003684(uint64_t a1)
{
  return [*(id *)(a1 + 32) _timeoutMinPeriod];
}

void sub_100003AE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _displayIfRequired];
}

void sub_100003BC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _schedule];
}

void sub_100003F5C(id a1)
{
  qword_10002A750 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", kCKPhotosEPPMomentShareURLSlug, kCKPhotosShareURLSlug, 0);

  _objc_release_x1();
}

void sub_100004200(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000042B4(id a1)
{
  qword_10002A760 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", kCKKeynoteShareURLSlug, kCKNumbersShareURLSlug, kCKPagesShareURLSlug, 0);

  _objc_release_x1();
}

void sub_1000043C4(id a1)
{
  qword_10002A770 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", kCKCloudDocsShareURLSlug, kCKKeynoteShareURLSlug, kCKNumbersShareURLSlug, kCKPagesShareURLSlug, 0);

  _objc_release_x1();
}

void sub_1000044E0(id a1)
{
  qword_10002A780 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", kCKPhotosEPPMomentShareURLSlug, kCKPhotosShareURLSlug, kCKPhotosSharedLibraryShareURLSlug, 0);

  _objc_release_x1();
}

void sub_1000050DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v7 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void **)(a1 + 32);
      v9 = v7;
      v10 = [v8 CKURLThroughSlug];
      v11 = [*(id *)(a1 + 32) CKPathAfterSlug];
      int v12 = 138544130;
      v13 = v10;
      __int16 v14 = 2160;
      uint64_t v15 = 1752392040;
      __int16 v16 = 2112;
      v17 = v11;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Can't open URL %{public}@%{mask.hash}@ using default web browser: %{public}@", (uint8_t *)&v12, 0x2Au);
    }
  }
}

void sub_100005C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005CAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005CBC(uint64_t a1)
{
}

void sub_100005CC4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v6)
  {
    id v40 = 0;
    v10 = +[NSJSONSerialization JSONObjectWithData:v6 options:1 error:&v40];
    id v11 = v40;
    id v12 = v40;
    v13 = v12;
    if (v10)
    {
      id v29 = v12;
      v30 = v10;
      v31 = v9;
      id v32 = v7;
      id v33 = v6;
      [v10 objectForKey:@"results"];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v14 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v37;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(obj);
            }
            __int16 v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            id v19 = [v18 valueForKey:@"trackId"];
            v20 = [v18 valueForKey:@"trackName"];
            v21 = [v18 valueForKey:@"bundleId"];
            if (v19)
            {
              v45[0] = @"URL";
              v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", *(void *)(a1 + 40), v19);
              v23 = +[NSURL URLWithString:v22];
              v45[1] = @"Name";
              v46[0] = v23;
              v46[1] = v20;
              v24 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
              [*(id *)(a1 + 32) setObject:v24 forKeyedSubscript:v21];
            }
          }
          id v15 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
        }
        while (v15);
      }

      id v7 = v32;
      id v6 = v33;
      v10 = v30;
      v9 = v31;
      v13 = v29;
    }
    else if (v12)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v26 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v42 = v7;
        __int16 v43 = 2112;
        v44 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Parse error while parsing App Store repsonse %{public}@, %@", buf, 0x16u);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v11);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v28 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Parse error while parsing App Store repsonse %{public}@", buf, 0xCu);
      }
    }
  }
  else if (v8)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v25 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v42 = v7;
      __int16 v43 = 2112;
      v44 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Got no data while looking up App Store URL, got response %{public}@, %@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v27 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v42 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Got no data while looking up App Store URL, got response %{public}@", buf, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_1000078C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_100007900(uint64_t a1, int a2, id obj)
{
}

void sub_100007914(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007C48(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  }
  [*(id *)(a1 + 32) setCurrentUserNameComponents:v9];
  [*(id *)(a1 + 32) setCurrentUserFormattedUsername:v7];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100008E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

id sub_100008E60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) supportedDataclassesForAccountType:v3];
  unsigned int v5 = [v4 containsObject:@"com.apple.Dataclass.Mail"];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) accountsWithAccountType:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_100008EF0(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  id v7 = [v15 userIdentity];
  id v8 = [v7 lookupInfo];
  uint64_t v9 = [v8 emailAddress];
  if (v9)
  {
    v10 = (void *)v9;
    id v11 = (void *)a1[4];
    id v12 = [v15 userIdentity];
    v13 = [v12 lookupInfo];
    id v14 = [v13 emailAddress];
    LODWORD(v11) = [v11 containsObject:v14];

    if (v11)
    {
      ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
      if (*(int *)(*(void *)(a1[5] + 8) + 24) >= 2) {
        *a4 = 1;
      }
    }
  }
  else
  {
  }
}

void sub_1000094CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000094E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = v3;
    unsigned int v5 = [*(id *)(a1 + 32) shareName];
    id v6 = [*(id *)(a1 + 32) singleOONMatch];
    id v7 = [v6 userIdentity];
    id v8 = [v7 lookupInfo];
    uint64_t v9 = [v8 emailAddress];
    v10 = +[CKVettingAlerts alertContentForInitiateVettingError:v4 shareTitle:v5 isEmail:v9 != 0 address:*(void *)(a1 + 40)];
    +[CKVettingAlerts showFailureAlert:isSourceICS:](CKVettingAlerts, "showFailureAlert:isSourceICS:", v10, [*(id *)(a1 + 32) isSourceICS]);
  }
  else
  {
    unsigned int v5 = [*(id *)(a1 + 32) url];
    id v4 = +[CKPrettyError errorWithDomain:CKErrorDomain, 8000, @"Can not accept share at URL %@: vetting of the invited email is needed", v5 code format];
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v4;
  id v13 = v4;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000A200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A218(uint64_t a1, void *a2)
{
}

void sub_10000A228(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000A38C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc((Class)CKTuple2);
  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v8 = +[NSString stringWithFormat:@"%@ (%@)", v6, v5];

    id v6 = (id)v8;
  }
  id v9 = [v7 initWithObject1:v6 object2:v5];

  return v9;
}

void sub_10000B690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_10000B6D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v20 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    id v13 = (void *)kCKShareDaemonPrefix;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v15 hasPrefix:v13])
        {
          uint64_t v16 = [v15 substringFromIndex:[v13 length]];
          if ([v16 length]) {
            [v8 addObject:v16];
          }
        }
        else
        {
          [v7 addObject:v15];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  [WeakRetained setRegisteredAppBundleIDs:v7];
  [WeakRetained setRegisteredDaemonBundleIDs:v8];
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v20;
  id v19 = v20;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000C100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_10000C120(uint64_t a1)
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v2 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Connection to %{public}@ became invalid", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000C1F8(uint64_t a1)
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v2 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Connection to %{public}@ was interrupted", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000C2D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  int v4 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Failed to connect to share handler for %{public}@: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v8 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000C3EC(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v5 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(a1 + 40);
      id v8 = v5;
      int v9 = [v6 url];
      uint64_t v10 = [v9 CKURLThroughSlug];
      __int16 v11 = [*(id *)(a1 + 40) url];
      id v12 = [v11 CKPathAfterSlug];
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v20 = 138544386;
      uint64_t v21 = v7;
      __int16 v22 = 2114;
      long long v23 = v10;
      __int16 v24 = 2160;
      uint64_t v25 = 1752392040;
      __int16 v26 = 2112;
      v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      id v14 = "Daemon %{public}@ handled share metadata for URL %{public}@%{mask.hash}@, error %@";
      id v15 = v8;
      uint32_t v16 = 52;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v20, v16);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v17 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      __int16 v18 = *(void **)(a1 + 40);
      id v8 = v17;
      int v9 = [v18 url];
      uint64_t v10 = [v9 CKURLThroughSlug];
      __int16 v11 = [*(id *)(a1 + 40) url];
      id v12 = [v11 CKPathAfterSlug];
      int v20 = 138544130;
      uint64_t v21 = v19;
      __int16 v22 = 2114;
      long long v23 = v10;
      __int16 v24 = 2160;
      uint64_t v25 = 1752392040;
      __int16 v26 = 2112;
      v27 = v12;
      id v14 = "Daemon %{public}@ handled share metadata for URL %{public}@%{mask.hash}@";
      id v15 = v8;
      uint32_t v16 = 42;
      goto LABEL_10;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000D0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000D0C8(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000D43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D468(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000E1AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t start(int a1, char **a2)
{
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = UIApplicationMain(a1, a2, v6, v8);

  return v9;
}

id sub_10000E514(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = CKLocalizedStringFromTableInBundleVA();

  return v6;
}

void sub_10000FF90(id a1)
{
  qword_10002A790 = +[NSSet setWithObjects:@"pages", @"numbers", @"keynote", @"iclouddrive", @"notes", @"reminders", @"photos", @"photos_links", @"photos_sharing", @"safari-tab-groups", @"freeform", @"share", 0];

  _objc_release_x1();
}

void sub_100012540(id a1)
{
  v1 = (void *)qword_10002A7A0;
  qword_10002A7A0 = (uint64_t)&off_100026C60;

  v10[0] = @"com.apple.Notes";
  v2 = +[NSSet setWithObject:@"com.apple.notes.folder"];
  v11[0] = v2;
  v10[1] = @"photos";
  v9[0] = CKPhotosSharedLibraryShareType;
  v9[1] = CKPhotosEPPMomentShareType;
  id v3 = +[NSArray arrayWithObjects:v9 count:2];
  id v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, 0);
  v11[1] = v4;
  v10[2] = @"freeform";
  id v5 = +[NSSet setWithObject:CKFreeformShareType];
  v11[2] = v5;
  v10[3] = @"safari";
  id v6 = +[NSSet setWithObject:CKSafariTabGroupsShareType];
  v11[3] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v8 = (void *)qword_10002A7A8;
  qword_10002A7A8 = v7;
}

void sub_100012D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012D34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012D44(uint64_t a1)
{
}

void sub_100012D4C(void *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v10)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    __int16 v11 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (void *)a1[4];
      *(_DWORD *)buf = 138543618;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Vetting record of ID:%{public}@ fetch failed due to: %@", buf, 0x16u);
    }
    uint64_t v13 = +[CKPrettyError errorWithDomain:CKUnderlyingErrorDomain, 8004, v10, @"Vetting record missing for vetting token: %@", a1[5] code error format];
    goto LABEL_7;
  }
  if (!v8)
  {
    uint64_t v13 = +[CKPrettyError errorWithDomain:CKUnderlyingErrorDomain, 8004, @"Vetting record missing for vetting token: %@", a1[5] code format];
LABEL_7:
    uint64_t v14 = *(void *)(a1[6] + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    goto LABEL_14;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint32_t v16 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = (void *)a1[5];
    *(_DWORD *)buf = 138543618;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Fetched vetting record: %{public}@ for vetting token: %{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
LABEL_14:
}

void sub_100012FA0(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5 && !*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v6 = +[CKPrettyError errorWithDomain:CKUnderlyingErrorDomain, 8004, v5, @"Vetting record failed: %@", a1[4] code error format];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = a1[5];
  if (v9) {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
  }
}

void sub_1000131E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, id, void, void, void, void, void))(v8 + 16))(v8, v5, 0, 0, 0, 0, 0);
    }
  }
  else
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:kCKCompleteParticipantVettingVettingRecordContainerKey];
    id v10 = [v7 objectForKeyedSubscript:kCKCompleteParticipantVettingVettingRecordEnvironmentKey];
    __int16 v11 = [v7 objectForKeyedSubscript:kCKCompleteParticipantVettingVettingRecordShareTitleKey];
    uint64_t v12 = [v7 objectForKeyedSubscript:kCKCompleteParticipantVettingVettingRecordEmailKey];
    v80 = [v7 objectForKeyedSubscript:kCKCompleteParticipantVettingVettingRecordPhoneKey];
    if (v9) {
      BOOL v13 = v10 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      id v5 = +[CKPrettyError errorWithDomain:CKUnderlyingErrorDomain, 8003, 0, @"Vetting record doesn't contain container:%@ or environment:%@", v9, v10 code error format];
      uint64_t v14 = *(void *)(a1 + 48);
      if (v14) {
        (*(void (**)(uint64_t, id, void *, void *, void *, void, void))(v14 + 16))(v14, v5, v11, v12, v80, 0, 0);
      }
    }
    else
    {
      v78 = v11;
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      id v15 = (void *)ck_log_facility_ck;
      v77 = v12;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        uint32_t v16 = *(void **)(a1 + 32);
        uint64_t v17 = v15;
        __int16 v18 = [v16 url];
        id v19 = [v18 CKURLThroughSlug];
        __int16 v20 = [*(id *)(a1 + 32) url];
        id v21 = [v20 CKPathAfterSlug];
        *(_DWORD *)buf = 138544130;
        v87 = v19;
        __int16 v88 = 2160;
        uint64_t v89 = 1752392040;
        __int16 v90 = 2112;
        v91 = v21;
        __int16 v92 = 2114;
        v93 = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, containerName: %{public}@", buf, 0x2Au);

        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
      }
      __int16 v22 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        long long v23 = *(void **)(a1 + 32);
        __int16 v24 = v22;
        uint64_t v25 = [v23 url];
        __int16 v26 = [v25 CKURLThroughSlug];
        uint64_t v27 = [*(id *)(a1 + 32) url];
        __int16 v28 = [v27 CKPathAfterSlug];
        *(_DWORD *)buf = 138544130;
        v87 = v26;
        __int16 v88 = 2160;
        uint64_t v89 = 1752392040;
        __int16 v90 = 2112;
        v91 = v28;
        __int16 v92 = 2114;
        v93 = v10;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, environmentName: %{public}@", buf, 0x2Au);

        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
      }
      uint64_t v29 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v30 = *(void **)(a1 + 32);
        v31 = v29;
        id v32 = [v30 url];
        id v33 = [v32 CKURLThroughSlug];
        v34 = [*(id *)(a1 + 32) url];
        v35 = [v34 CKPathAfterSlug];
        *(_DWORD *)buf = 138544130;
        v87 = v33;
        __int16 v88 = 2160;
        uint64_t v89 = 1752392040;
        __int16 v90 = 2112;
        v91 = v35;
        __int16 v92 = 2112;
        v93 = v11;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, shareTitle: %@", buf, 0x2Au);

        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
      }
      long long v36 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        long long v37 = *(void **)(a1 + 32);
        long long v38 = v36;
        long long v39 = [v37 url];
        id v40 = [v39 CKURLThroughSlug];
        v41 = [*(id *)(a1 + 32) url];
        id v42 = [v41 CKPathAfterSlug];
        *(_DWORD *)buf = 138544130;
        v87 = v40;
        __int16 v88 = 2160;
        uint64_t v89 = 1752392040;
        __int16 v90 = 2112;
        v91 = v42;
        __int16 v92 = 2112;
        v93 = v77;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, email: %@", buf, 0x2Au);

        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
      }
      __int16 v43 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v44 = *(void **)(a1 + 32);
        v45 = v43;
        v46 = [v44 url];
        v47 = [v46 CKURLThroughSlug];
        v48 = [*(id *)(a1 + 32) url];
        v49 = [v48 CKPathAfterSlug];
        *(_DWORD *)buf = 138544130;
        v87 = v47;
        __int16 v88 = 2160;
        uint64_t v89 = 1752392040;
        __int16 v90 = 2112;
        v91 = v49;
        __int16 v92 = 2112;
        v93 = v80;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, phone: %@", buf, 0x2Au);

        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
      }
      v50 = (void *)ck_log_facility_ck;
      v79 = v9;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v51 = *(void **)(a1 + 32);
        v52 = v50;
        v53 = [v51 url];
        v54 = [v53 CKURLThroughSlug];
        v55 = [*(id *)(a1 + 32) url];
        v56 = [v55 CKPathAfterSlug];
        v57 = [v7 objectForKeyedSubscript:kCKCompleteParticipantVettingVettingRecordRoutingKeyKey];
        *(_DWORD *)buf = 138544130;
        v87 = v54;
        __int16 v88 = 2160;
        uint64_t v89 = 1752392040;
        __int16 v90 = 2112;
        v91 = v56;
        __int16 v92 = 2114;
        v93 = v57;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, routingKey: %{public}@", buf, 0x2Au);

        uint64_t v9 = v79;
        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
      }
      v58 = (void *)ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
      {
        v59 = *(void **)(a1 + 32);
        v60 = v58;
        v61 = [v59 url];
        v62 = [v61 CKURLThroughSlug];
        v63 = [*(id *)(a1 + 32) url];
        v64 = [v63 CKPathAfterSlug];
        v65 = [v7 objectForKeyedSubscript:kCKCompleteParticipantVettingVettingRecordBaseTokenKey];
        *(_DWORD *)buf = 138544130;
        v87 = v62;
        __int16 v88 = 2160;
        uint64_t v89 = 1752392040;
        __int16 v90 = 2112;
        v91 = v64;
        __int16 v92 = 2114;
        v93 = v65;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Vetting record for: %{public}@%{mask.hash}@, baseToken: %{public}@", buf, 0x2Au);

        uint64_t v9 = v79;
      }
      id v66 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:v9 environment:CKContainerEnvironmentFromString()];
      if (__sTestOverridesAvailable
        && ([*(id *)(a1 + 32) testDevice],
            v67 = objc_claimAutoreleasedReturnValue(),
            v67,
            v67))
      {
        v68 = [*(id *)(a1 + 32) testDevice];
        id v69 = [v68 containerWithContainerID:v66];
      }
      else
      {
        id v69 = [objc_alloc((Class)CKContainer) initWithContainerID:v66];
      }
      id v70 = objc_alloc((Class)CKCompleteParticipantVettingOperation);
      uint64_t v71 = *(void *)(a1 + 40);
      v72 = [*(id *)(a1 + 32) url];
      v73 = [v72 host];
      id v74 = [v70 initWithVettingToken:v71 vettingRecord:v7 displayedHostname:v73];

      v75 = [v74 resolvedConfiguration];
      [v75 setRequestOriginator:2];

      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_100013CCC;
      v81[3] = &unk_100024B60;
      id v85 = *(id *)(a1 + 48);
      __int16 v11 = v78;
      id v82 = v78;
      uint64_t v12 = v77;
      id v83 = v77;
      id v84 = v80;
      [v74 setCompleteParticipantVettingCompletionBlock:v81];
      uint64_t v76 = *(void *)(a1 + 56);
      if (v76) {
        (*(void (**)(void))(v76 + 16))();
      }
      [v69 addOperation:v74];

      id v5 = 0;
      uint64_t v9 = v79;
    }
  }
}

uint64_t sub_100013CCC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, void, void, uint64_t, uint64_t))(result + 16))(result, a2, a1[4], a1[5], a1[6], a3, a4);
  }
  return result;
}

void sub_100013E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100013FD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_100014004(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v36 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v19 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v20 = [WeakRetained retrievingDialog];
    [v20 abort];

    if (!v13)
    {
      id v25 = v19;
      objc_sync_enter(v25);
      if ([v25 cancelled])
      {
        __int16 v26 = [v25 url];
        id v13 = +[CKPrettyError errorWithDomain:CKErrorDomain, 1, @"Vetting for %@ cancelled by the user. Email/phone number vetting cancelled.", v26 code format];
      }
      else
      {
        id v13 = 0;
      }
LABEL_27:
      objc_sync_exit(v19);

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      if (v13) {

      }
      goto LABEL_29;
    }
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v21 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      log = v21;
      v35 = [v19 url];
      v30 = [v35 CKURLThroughSlug];
      v31 = [v19 url];
      id v32 = [v31 CKPathAfterSlug];
      *(_DWORD *)buf = 138544130;
      long long v38 = v30;
      __int16 v39 = 2160;
      uint64_t v40 = 1752392040;
      __int16 v41 = 2112;
      id v42 = v32;
      __int16 v43 = 2112;
      id v44 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Vetting with URL %{public}@%{mask.hash}@ yielded error %@", buf, 0x2Au);
    }
    __int16 v22 = [v13 userInfo];
    long long v23 = [v22 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if ([v13 isAuthenticationUserCancelled])
    {
LABEL_26:

      objc_sync_enter(v19);
      goto LABEL_27;
    }
    __int16 v24 = [v13 domain];
    if ([v24 isEqualToString:CKErrorDomain])
    {
      if ([v13 code] == (id)9)
      {

LABEL_24:
        uint64_t v29 = +[CKVettingAlerts alertContentForICloudAccountError:v13 shareMetadata:0 shareURL:v16];
        +[CKVettingAlerts showICloudAccountSettingAlert:v29 appName:0 previewRequested:0 isSourceICS:0];
        goto LABEL_25;
      }
      BOOL v34 = [v13 code] == (id)115;

      if (v34) {
        goto LABEL_24;
      }
    }
    else
    {
    }
    uint64_t v27 = [v23 domain];
    if ([v27 isEqualToString:CKErrorDomain])
    {
      BOOL v28 = [v23 code] == (id)3;

      if (v28)
      {
        uint64_t v29 = +[CKVettingAlerts alertContentDictionaryForDeviceOfflineErrorWithURLSlug:@"share"];
        +[CKVettingAlerts showFailureAlert:v29 isSourceICS:0];
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
    }
    uint64_t v29 = +[CKVettingAlerts alertContentForCompleteVettingError:v13 shareTitle:v36 email:v14 phone:v15 reconstructedShareURL:v16];
    +[CKVettingAlerts showFailureAlert:v29 isSourceICS:0];
    goto LABEL_25;
  }
  if (!v13)
  {
    id v13 = +[CKPrettyError errorWithDomain:CKErrorDomain code:1000 format:@"Vetting handler went nil waiting for vetting to complete"];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_29:
}

void sub_1000144A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000144C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained retrievingDialog];
  [v1 abort];
}

void sub_100014688(id a1)
{
  qword_10002A7B8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", kCKCloudDocsShareURLSlug, kCKFreeformShareURLSlug, kCKGenericShareURLSlug, kCKKeynoteShareURLSlug, kCKNotesShareURLSlug, kCKNumbersShareURLSlug, kCKPagesShareURLSlug, kCKPhotosEPPMomentShareURLSlug, kCKPhotosShareURLSlug, kCKPhotosSharedLibraryShareURLSlug, kCKRemindersShareURLSlug, kCKSafariTabGroupsShareURLSlug, 0);

  _objc_release_x1();
}

void sub_100014918(_Unwind_Exception *exception_object)
{
}

void sub_100014AEC(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100014B74;
  v2[3] = &unk_100024BF8;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 acceptShareWithCompletionHandler:v2];
}

void sub_100014B74(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v4 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Warn: Failed to accept share. %@", (uint8_t *)&v5, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100014FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
}

void sub_100015010(uint64_t a1)
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v2 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    int v5 = 134217984;
    id v6 = [v3 backgroundTaskID];
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "The time given for the share URL handling task %lu to complete while the app is in background has expired, the app will likely be killed now", (uint8_t *)&v5, 0xCu);
  }
}

void sub_100015100(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000151E0;
  v3[3] = &unk_100024C48;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  objc_copyWeak(&v6, (id *)(a1 + 56));
  [v2 acceptShareWithCompletionHandler:v3];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void sub_1000151C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000151E0(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v4 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      id v5 = a1[4];
      id v6 = v4;
      uint64_t v7 = [v5 CKURLThroughSlug];
      uint64_t v8 = [a1[4] CKPathAfterSlug];
      int v18 = 138544130;
      id v19 = v7;
      __int16 v20 = 2160;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2112;
      long long v23 = v8;
      __int16 v24 = 2112;
      id v25 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Accepting shareURL %{public}@%{mask.hash}@ yielded error %@", (uint8_t *)&v18, 0x2Au);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v9 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      id v10 = a1[4];
      int v18 = 138412290;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Accepted shareURL %@ successfully", (uint8_t *)&v18, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  uint64_t v12 = [WeakRetained activeSharingURLs];
  [v12 CKSynchronizedRemoveObject:a1[4]];

  id v13 = objc_loadWeakRetained(a1 + 6);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v14 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    id v15 = v14;
    id v16 = [v13 backgroundTaskID];
    int v18 = 134217984;
    id v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Finished background task %lu (share URL handling)", (uint8_t *)&v18, 0xCu);
  }
  id v17 = +[UIApplication sharedApplication];
  [v17 endBackgroundTask:[v13 backgroundTaskID]];

  [v13 setBackgroundTaskID:UIBackgroundTaskInvalid];
}

void sub_100015988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 96));
  _Unwind_Resume(a1);
}

void sub_1000159AC(uint64_t a1)
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v2 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    int v5 = 134217984;
    id v6 = [v3 backgroundTaskID];
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "The time given for the vetting URL handling task %lu to complete while the app is in background has expired, the app will likely be killed now", (uint8_t *)&v5, 0xCu);
  }
}

void sub_100015A9C(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100015B80;
  v3[3] = &unk_100024C70;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v6, (id *)(a1 + 56));
  [v2 completeVettingWithCompletionHandler:v3];
  objc_destroyWeak(&v6);

  objc_destroyWeak(&v5);
}

void sub_100015B64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100015B80(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  __int16 v11 = [WeakRetained activeVettingURLToVettingAcceptor];
  [v11 CKSynchronizedRemoveObjectForKey:a1[4]];

  if (v7)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v12 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      id v13 = a1[4];
      id v14 = v12;
      id v15 = [v13 CKURLThroughSlug];
      id v16 = [a1[4] CKPathAfterSlug];
      int v27 = 138544130;
      id v28 = v15;
      __int16 v29 = 2160;
      uint64_t v30 = 1752392040;
      __int16 v31 = 2112;
      id v32 = v16;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Vetting with URL %{public}@%{mask.hash}@ yielded error %@.", (uint8_t *)&v27, 0x2Au);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v17 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      id v18 = a1[4];
      id v19 = v17;
      __int16 v20 = [v18 CKURLThroughSlug];
      uint64_t v21 = [a1[4] CKPathAfterSlug];
      int v27 = 138543874;
      id v28 = v20;
      __int16 v29 = 2160;
      uint64_t v30 = 1752392040;
      __int16 v31 = 2112;
      id v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Vetting with URL %{public}@%{mask.hash}@ succeeded. Performing share accept.", (uint8_t *)&v27, 0x20u);
    }
    [WeakRetained acceptShareWithMetadata:v9 shareURL:v8];
  }
  id v22 = objc_loadWeakRetained(a1 + 6);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  long long v23 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    __int16 v24 = v23;
    id v25 = [v22 backgroundTaskID];
    int v27 = 134217984;
    id v28 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Finished background task %lu (vetting URL handling).", (uint8_t *)&v27, 0xCu);
  }
  __int16 v26 = +[UIApplication sharedApplication];
  [v26 endBackgroundTask:[v22 backgroundTaskID]];

  [v22 setBackgroundTaskID:UIBackgroundTaskInvalid];
}

void sub_10001612C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_100016B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t CKAdoptPersonaID()
{
  return _CKAdoptPersonaID();
}

uint64_t CKContainerEnvironmentFromString()
{
  return _CKContainerEnvironmentFromString();
}

uint64_t CKDeviceClass()
{
  return _CKDeviceClass();
}

uint64_t CKLocalizedString()
{
  return _CKLocalizedString();
}

uint64_t CKLocalizedStringFromTableInBundleVA()
{
  return _CKLocalizedStringFromTableInBundleVA();
}

uint64_t CKSelectLocalAppNamesByBundleIDs()
{
  return _CKSelectLocalAppNamesByBundleIDs();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return _TCCAccessCopyBundleIdentifiersDisabledForService();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
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
  return [super a2];
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CKBladerunnerShareURLSlugBasedApplicationBundleID(void *a1, const char *a2, ...)
{
  return [a1 CKBladerunnerShareURLSlugBasedApplicationBundleID];
}

id objc_msgSend_CKClientSuitableError(void *a1, const char *a2, ...)
{
  return [a1 CKClientSuitableError];
}

id objc_msgSend_CKPathAfterSlug(void *a1, const char *a2, ...)
{
  return [a1 CKPathAfterSlug];
}

id objc_msgSend_CKShareURLSlugBasedApplicationName(void *a1, const char *a2, ...)
{
  return [a1 CKShareURLSlugBasedApplicationName];
}

id objc_msgSend_CKURLSlug(void *a1, const char *a2, ...)
{
  return [a1 CKURLSlug];
}

id objc_msgSend_CKURLThroughSlug(void *a1, const char *a2, ...)
{
  return [a1 CKURLThroughSlug];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return [a1 _dismiss];
}

id objc_msgSend__displayIfRequired(void *a1, const char *a2, ...)
{
  return [a1 _displayIfRequired];
}

id objc_msgSend__fetchCurrentUserNameComponents(void *a1, const char *a2, ...)
{
  return [a1 _fetchCurrentUserNameComponents];
}

id objc_msgSend__getShareName(void *a1, const char *a2, ...)
{
  return [a1 _getShareName];
}

id objc_msgSend__handlePotentialOONMatches(void *a1, const char *a2, ...)
{
  return [a1 _handlePotentialOONMatches];
}

id objc_msgSend__schedule(void *a1, const char *a2, ...)
{
  return [a1 _schedule];
}

id objc_msgSend__showVettingAlert(void *a1, const char *a2, ...)
{
  return [a1 _showVettingAlert];
}

id objc_msgSend__trySelectingOONParticipant(void *a1, const char *a2, ...)
{
  return [a1 _trySelectingOONParticipant];
}

id objc_msgSend_abort(void *a1, const char *a2, ...)
{
  return [a1 abort];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_acceptQueue(void *a1, const char *a2, ...)
{
  return [a1 acceptQueue];
}

id objc_msgSend_accepting(void *a1, const char *a2, ...)
{
  return [a1 accepting];
}

id objc_msgSend_accountProperties(void *a1, const char *a2, ...)
{
  return [a1 accountProperties];
}

id objc_msgSend_activeSharingURLs(void *a1, const char *a2, ...)
{
  return [a1 activeSharingURLs];
}

id objc_msgSend_activeVettingURLToVettingAcceptor(void *a1, const char *a2, ...)
{
  return [a1 activeVettingURLToVettingAcceptor];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_alertContentForGenericInitiateVettingError(void *a1, const char *a2, ...)
{
  return [a1 alertContentForGenericInitiateVettingError];
}

id objc_msgSend_allAccountTypes(void *a1, const char *a2, ...)
{
  return [a1 allAccountTypes];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowsAnonymousPublicAccess(void *a1, const char *a2, ...)
{
  return [a1 allowsAnonymousPublicAccess];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backgroundTaskID(void *a1, const char *a2, ...)
{
  return [a1 backgroundTaskID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return [a1 cancelled];
}

id objc_msgSend_chooseFromMultipleBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 chooseFromMultipleBundleIDs];
}

id objc_msgSend_chosenAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 chosenAppBundleID];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return [a1 containerID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentUserFormattedUsername(void *a1, const char *a2, ...)
{
  return [a1 currentUserFormattedUsername];
}

id objc_msgSend_currentUserNameComponents(void *a1, const char *a2, ...)
{
  return [a1 currentUserNameComponents];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceTypeSpecificSuffix(void *a1, const char *a2, ...)
{
  return [a1 deviceTypeSpecificSuffix];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_fallbackFlowCause(void *a1, const char *a2, ...)
{
  return [a1 fallbackFlowCause];
}

id objc_msgSend_fetchMetadata(void *a1, const char *a2, ...)
{
  return [a1 fetchMetadata];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_initOnce(void *a1, const char *a2, ...)
{
  return [a1 initOnce];
}

id objc_msgSend_invitationToken(void *a1, const char *a2, ...)
{
  return [a1 invitationToken];
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isAppleInternalInstall];
}

id objc_msgSend_isAuthenticationUserCancelled(void *a1, const char *a2, ...)
{
  return [a1 isAuthenticationUserCancelled];
}

id objc_msgSend_isInitialized(void *a1, const char *a2, ...)
{
  return [a1 isInitialized];
}

id objc_msgSend_isSourceICS(void *a1, const char *a2, ...)
{
  return [a1 isSourceICS];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localBundleIDsToDisplayNames(void *a1, const char *a2, ...)
{
  return [a1 localBundleIDsToDisplayNames];
}

id objc_msgSend_lookupInfo(void *a1, const char *a2, ...)
{
  return [a1 lookupInfo];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_matterhornName(void *a1, const char *a2, ...)
{
  return [a1 matterhornName];
}

id objc_msgSend_metadataIndicatedContainer(void *a1, const char *a2, ...)
{
  return [a1 metadataIndicatedContainer];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return [a1 nameComponents];
}

id objc_msgSend_outOfNetworkMatches(void *a1, const char *a2, ...)
{
  return [a1 outOfNetworkMatches];
}

id objc_msgSend_ownerIdentity(void *a1, const char *a2, ...)
{
  return [a1 ownerIdentity];
}

id objc_msgSend_participantID(void *a1, const char *a2, ...)
{
  return [a1 participantID];
}

id objc_msgSend_participantRole(void *a1, const char *a2, ...)
{
  return [a1 participantRole];
}

id objc_msgSend_participantStatus(void *a1, const char *a2, ...)
{
  return [a1 participantStatus];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_percentEncodedQuery(void *a1, const char *a2, ...)
{
  return [a1 percentEncodedQuery];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_promptForSingleBundleID(void *a1, const char *a2, ...)
{
  return [a1 promptForSingleBundleID];
}

id objc_msgSend_publicCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 publicCloudDatabase];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return [a1 recordID];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return [a1 recordName];
}

id objc_msgSend_registeredAppBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 registeredAppBundleIDs];
}

id objc_msgSend_registeredDaemonBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 registeredDaemonBundleIDs];
}

id objc_msgSend_registrationDate(void *a1, const char *a2, ...)
{
  return [a1 registrationDate];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resolvedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 resolvedConfiguration];
}

id objc_msgSend_resourceURL(void *a1, const char *a2, ...)
{
  return [a1 resourceURL];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retrievingDialog(void *a1, const char *a2, ...)
{
  return [a1 retrievingDialog];
}

id objc_msgSend_retrievingDialogCancelled(void *a1, const char *a2, ...)
{
  return [a1 retrievingDialogCancelled];
}

id objc_msgSend_retrievingDialogShouldDisplay(void *a1, const char *a2, ...)
{
  return [a1 retrievingDialogShouldDisplay];
}

id objc_msgSend_retrievingNotification(void *a1, const char *a2, ...)
{
  return [a1 retrievingNotification];
}

id objc_msgSend_rootRecord(void *a1, const char *a2, ...)
{
  return [a1 rootRecord];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return [a1 schedule];
}

id objc_msgSend_selectedAccountID(void *a1, const char *a2, ...)
{
  return [a1 selectedAccountID];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_share(void *a1, const char *a2, ...)
{
  return [a1 share];
}

id objc_msgSend_shareAcceptorRetrievingDialogDelay(void *a1, const char *a2, ...)
{
  return [a1 shareAcceptorRetrievingDialogDelay];
}

id objc_msgSend_shareAcceptorRetrievingDialogMinPeriod(void *a1, const char *a2, ...)
{
  return [a1 shareAcceptorRetrievingDialogMinPeriod];
}

id objc_msgSend_shareMetadata(void *a1, const char *a2, ...)
{
  return [a1 shareMetadata];
}

id objc_msgSend_shareName(void *a1, const char *a2, ...)
{
  return [a1 shareName];
}

id objc_msgSend_shareNeedsAcceptance(void *a1, const char *a2, ...)
{
  return [a1 shareNeedsAcceptance];
}

id objc_msgSend_shareURLToAccountIDSystemAcceptationOverrides(void *a1, const char *a2, ...)
{
  return [a1 shareURLToAccountIDSystemAcceptationOverrides];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedGuard(void *a1, const char *a2, ...)
{
  return [a1 sharedGuard];
}

id objc_msgSend_sharedOptions(void *a1, const char *a2, ...)
{
  return [a1 sharedOptions];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_shouldTerminateAfterFetchingMetadata(void *a1, const char *a2, ...)
{
  return [a1 shouldTerminateAfterFetchingMetadata];
}

id objc_msgSend_singleOONMatch(void *a1, const char *a2, ...)
{
  return [a1 singleOONMatch];
}

id objc_msgSend_specialContainerType(void *a1, const char *a2, ...)
{
  return [a1 specialContainerType];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateName(void *a1, const char *a2, ...)
{
  return [a1 stateName];
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return [a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_testContainer(void *a1, const char *a2, ...)
{
  return [a1 testContainer];
}

id objc_msgSend_testDevice(void *a1, const char *a2, ...)
{
  return [a1 testDevice];
}

id objc_msgSend_testTargetContainer(void *a1, const char *a2, ...)
{
  return [a1 testTargetContainer];
}

id objc_msgSend_unitTestOverrides(void *a1, const char *a2, ...)
{
  return [a1 unitTestOverrides];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userIdentity(void *a1, const char *a2, ...)
{
  return [a1 userIdentity];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_vettingHandler(void *a1, const char *a2, ...)
{
  return [a1 vettingHandler];
}

id objc_msgSend_webFlowReason(void *a1, const char *a2, ...)
{
  return [a1 webFlowReason];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return [a1 webpageURL];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_willAcceptShareAtURL_(void *a1, const char *a2, ...)
{
  return [a1 willAcceptShareAtURL:];
}