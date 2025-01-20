uint64_t start()
{
  +[GameControllerConfigService run];
  return 0;
}

uint64_t sub_100003970()
{
  return MAIsQueryResultFailure() ^ 1;
}

uint64_t sub_10000398C(unint64_t a1, unsigned char *a2)
{
  uint64_t result = 0;
  if (a1 <= 0xC && ((1 << a1) & 0x125A) != 0)
  {
    uint64_t result = 1;
    if (a2) {
      *a2 = 1;
    }
  }
  return result;
}

uint64_t sub_1000039C0(uint64_t a1)
{
  unsigned int v2 = MAIsDownloadResultFailure() ^ 1;
  if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0xE) {
    unsigned int v2 = 1;
  }
  if (a1 == 29) {
    return 1;
  }
  else {
    return v2;
  }
}

uint64_t sub_1000039FC(unint64_t a1)
{
  return (a1 < 0x31) & (0x1001190000400uLL >> a1);
}

uint64_t sub_100003A20(uint64_t a1, unsigned char *a2)
{
  uint64_t v2 = a1 - 1;
  uint64_t result = 1;
  switch(v2)
  {
    case 0:
    case 1:
    case 7:
    case 8:
    case 12:
    case 23:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 59:
    case 60:
    case 61:
    case 63:
    case 64:
    case 66:
    case 67:
    case 68:
    case 69:
      if (a2) {
        *a2 = 1;
      }
      break;
    case 2:
    case 15:
    case 16:
    case 17:
    case 29:
    case 33:
    case 34:
    case 46:
    case 70:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_100003B80(uint64_t a1)
{
  uint64_t v1 = a1 - 4;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 7:
    case 8:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 21:
    case 22:
    case 23:
    case 29:
    case 34:
    case 35:
    case 36:
    case 39:
    case 40:
    case 42:
    case 45:
    case 46:
    case 54:
    case 55:
    case 59:
    case 62:
    case 68:
    case 69:
    case 71:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

id sub_100003CDC()
{
  if (qword_100015700 != -1) {
    dispatch_once(&qword_100015700, &stru_100010318);
  }
  v0 = (void *)qword_1000156F8;

  return v0;
}

void sub_100003D30(id a1)
{
  qword_1000156F8 = (uint64_t)dispatch_workloop_create("com.apple.gamecontroller.mobileasset");

  _objc_release_x1();
}

void sub_100003FA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003FB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 24)) {
    goto LABEL_2;
  }
  id v9 = 0;
  char v5 = sub_1000040E0((dispatch_queue_t *)v4, &v9);
  id v6 = v9;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    [v3 failWithError:v6];
    goto LABEL_7;
  }

  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v11 = @"Did not find an installed configuration mobile asset.";
    v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v8 = sub_10000B688((uint64_t)NSError, 0, v7);
    [v3 failWithError:v8];

LABEL_7:
    goto LABEL_8;
  }
LABEL_2:
  objc_msgSend(v3, "succeedWithResult:");
LABEL_8:
}

uint64_t sub_1000040E0(dispatch_queue_t *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v37 = _os_activity_create((void *)&_mh_execute_header, "[Configuration Mobile Asset Manager] Select Configuration Asset", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DETACHED);
  os_activity_scope_enter(v37, &state);
  dispatch_assert_queue_V2(a1[2]);
  sub_1000045FC(a1);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v38 waitUntilFinished];
  if (v4)
  {
    if (v4 == (id)1)
    {
      char v5 = v38;
      if (!a2)
      {
        uint64_t v6 = 0;
        goto LABEL_37;
      }
      [v38 error];
      uint64_t v6 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = [v38 result];
      v34 = a1;
      v36 = [v7 results];
      v8 = sub_10000B558();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

      NSErrorUserInfoKey v10 = v7;
      if (v9)
      {
        CFStringRef v11 = sub_10000B558();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_10000B7AC();
        }

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v12 = v36;
        id v13 = [v12 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v44;
          do
          {
            v15 = 0;
            do
            {
              if (*(void *)v44 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void *)(*((void *)&v43 + 1) + 8 * (void)v15);
              v17 = sub_10000B558();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v50 = v16;
                _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "\t %{public}@", buf, 0xCu);
              }

              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v7 = v10;
            id v13 = [v12 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v13);
        }
      }
      v18 = +[NSPredicate predicateWithBlock:&stru_1000103A8];
      v19 = [v36 filteredArrayUsingPredicate:v18];

      v35 = [v19 sortedArrayUsingSelector:"db_compareTo:"];

      v20 = sub_10000B558();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

      if (v21)
      {
        v22 = sub_10000B558();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_10000B778();
        }

        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v23 = v35;
        id v24 = [v23 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v40;
          do
          {
            v26 = 0;
            do
            {
              if (*(void *)v40 != v25) {
                objc_enumerationMutation(v23);
              }
              uint64_t v27 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v26);
              v28 = sub_10000B558();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v50 = v27;
                _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "\t %{public}@", buf, 0xCu);
              }

              v26 = (char *)v26 + 1;
            }
            while (v24 != v26);
            v7 = v10;
            id v24 = [v23 countByEnumeratingWithState:&v39 objects:v48 count:16];
          }
          while (v24);
        }
      }
      uint64_t v29 = [v35 lastObject];
      v30 = sub_10000B558();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Loaded configuration asset: %@", buf, 0xCu);
      }

      v31 = v34;
      objc_sync_enter(v31);
      dispatch_queue_t v32 = v31[3];
      v31[3] = (dispatch_queue_t)v29;

      objc_sync_exit(v31);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  char v5 = v38;
LABEL_37:

  os_activity_scope_leave(&state);
  return v6;
}

void sub_100004590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,os_activity_scope_state_s state)
{
}

id sub_1000045F0(uint64_t a1, void *a2)
{
  return [a2 configurationBundleURLsForType:*(void *)(a1 + 32)];
}

id sub_1000045FC(id a1)
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "[Configuration Mobile Asset Manager] Query Installed Assets", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2, &v4);
    sub_1000071F0((uint64_t)v1, 1, 1);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    os_activity_scope_leave(&v4);
  }

  return v1;
}

void sub_100004690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

BOOL sub_1000046A4(id a1, MAAsset *a2, NSDictionary *a3)
{
  id v3 = a2;
  id v10 = 0;
  char v4 = sub_1000086C8(v3, &v10);
  id v5 = v10;
  uint64_t v6 = v5;
  if ((v4 & 1) == 0)
  {
    v7 = [v5 domain];
    if (![v7 isEqual:@"GCMobileAssetError"])
    {
LABEL_8:

      goto LABEL_9;
    }
    id v8 = [v6 code];

    if (v8 == (id)3)
    {
      if ([(MAAsset *)v3 state] == (id)5 || [(MAAsset *)v3 state] == (id)6)
      {
        v7 = sub_10000B558();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          sub_10000B7E0();
        }
      }
      else
      {
        v7 = sub_10000B558();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v12 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Installed asset has invalid format: %{public}@", buf, 0xCu);
        }
      }
      goto LABEL_8;
    }
  }
LABEL_9:

  return v4;
}

id sub_100004860(id a1)
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "[Configuration Mobile Asset Manager] Query Available Assets", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2, &v4);
    sub_1000071F0((uint64_t)v1, 2, 0);
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    os_activity_scope_leave(&v4);
  }

  return v1;
}

void sub_1000048F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

NSArray *__cdecl sub_100004908(id a1, MAAssetQuery *a2, BOOL *a3, id *a4)
{
  os_activity_scope_state_s v4 = [(MAAssetQuery *)a2 results];
  id v5 = [v4 sortedArrayUsingSelector:"db_compareTo:"];
  uint64_t v6 = objc_msgSend(v5, "gc_reversedArray");

  return (NSArray *)v6;
}

void sub_100004A64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 24)) {
    goto LABEL_2;
  }
  id v9 = 0;
  char v5 = sub_1000040E0((dispatch_queue_t *)v4, &v9);
  id v6 = v9;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    [v3 failWithError:v6];
    goto LABEL_7;
  }

  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v11 = @"Did not find an installed configuration mobile asset.";
    v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v8 = sub_10000B688((uint64_t)NSError, 0, v7);
    [v3 failWithError:v8];

LABEL_7:
    goto LABEL_8;
  }
LABEL_2:
  objc_msgSend(v3, "succeedWithResult:");
LABEL_8:
}

NSDate *__cdecl sub_100004BE4(id a1, MAAssetQuery *a2, BOOL *a3, id *a4)
{
  char v5 = a2;
  id v6 = [(MAAssetQuery *)v5 valueForKey:@"_lastFetchDate"];
  if (!v6)
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"Could not determine catalog fetch date.";
    v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    sub_10000B688((uint64_t)NSError, 0, v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = 0;
  }

  return (NSDate *)v6;
}

void sub_100005074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_sync_exit(v29);
  _Unwind_Resume(a1);
}

uint64_t sub_1000050A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000050B4(uint64_t a1)
{
}

void sub_1000050BC(uint64_t a1)
{
  uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "[Configuration Mobile Asset Manager] Cancel Check For Updates", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005174;
  block[3] = &unk_100010450;
  id v3 = *(NSObject **)(a1 + 32);
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v3, block);
  os_activity_scope_leave(&state);
}

id sub_100005174(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) cancel];
}

void sub_100005184(uint64_t a1, void *a2, void *a3, int a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a5;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  if (v14)
  {
    v17 = sub_10000B5F0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v14 assetId];
      v19 = -[MAAsset contentVersion]_0(v14);
      v20 = -[MAAsset contentRevision]_0(v14);
      [v14 state];
      BOOL v21 = MAStringForMAAssetState();
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v18;
      __int16 v44 = 2112;
      long long v45 = v19;
      __int16 v46 = 2048;
      v47 = v20;
      __int16 v48 = 2112;
      v49 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Loaded updated configuration asset: <%@ v%@-%zi state: %@>", buf, 0x2Au);
    }
    id v22 = *(id *)(a1 + 32);
    objc_sync_enter(v22);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
    objc_sync_exit(v22);

    id v23 = sub_100003CDC();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005578;
    block[3] = &unk_1000104A0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v23, block);

    goto LABEL_5;
  }
  if (!v16)
  {
LABEL_5:
    id v24 = 0;
    goto LABEL_12;
  }
  uint64_t v25 = objc_opt_new();
  [v25 setObject:@"Check for updates failed." forKeyedSubscript:NSLocalizedDescriptionKey];
  *(void *)buf = &a9;
  id v26 = [objc_alloc((Class)NSString) initWithFormat:v16 arguments:&a9];
  [v25 setObject:v26 forKeyedSubscript:NSLocalizedFailureReasonErrorKey];

  if (v15) {
    [v25 setObject:v15 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  if (a4) {
    [v25 setObject:@"Try again in a few minutes." forKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
  }
  id v24 = sub_10000B688((uint64_t)NSError, 1, v25);

LABEL_12:
  id v27 = *(id *)(a1 + 32);
  objc_sync_enter(v27);
  id v28 = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  uint64_t v30 = *(void *)(a1 + 32);
  uint64_t v29 = a1 + 32;
  v31 = *(void **)(v30 + 48);
  *(void *)(v30 + 48) = 0;

  dispatch_queue_t v32 = *(void **)(*(void *)v29 + 40);
  *(void *)(*(void *)v29 + 40) = 0;

  objc_sync_exit(v27);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v33 = v28;
  id v34 = [v33 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v38;
    do
    {
      v36 = 0;
      do
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(v33);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v37 + 1) + 8 * (void)v36) + 16))(*(void *)(*((void *)&v37 + 1) + 8 * (void)v36));
        v36 = (char *)v36 + 1;
      }
      while (v34 != v36);
      id v34 = [v33 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v34);
  }
}

void sub_10000555C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005578(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:GCConfigurationBundleSourceBundlesDidChangeNotification object:*(void *)(a1 + 32)];
}

void sub_1000055DC(uint64_t a1)
{
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10000597C;
  v54[3] = &unk_1000104F0;
  id v55 = *(id *)(a1 + 48);
  id v2 = objc_retainBlock(v54);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100005A54;
  v49[3] = &unk_100010540;
  uint64_t v3 = *(void *)(a1 + 32);
  char v53 = *(unsigned char *)(a1 + 64);
  char v5 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v49[4] = v3;
  uint64_t v52 = v4;
  id v50 = v5;
  id v6 = v2;
  id v51 = v6;
  v7 = objc_retainBlock(v49);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100005EEC;
  v45[3] = &unk_1000105B0;
  v45[4] = *(void *)(a1 + 32);
  id v46 = *(id *)(a1 + 48);
  id v8 = v6;
  id v47 = v8;
  NSErrorUserInfoKey v9 = v7;
  id v48 = v9;
  CFStringRef v10 = objc_retainBlock(v45);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000067DC;
  v40[3] = &unk_100010600;
  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = *(void **)(a1 + 40);
  v40[4] = *(void *)(a1 + 32);
  uint64_t v44 = v11;
  id v41 = v12;
  id v42 = *(id *)(a1 + 48);
  id v13 = v10;
  id v43 = v13;
  id v14 = objc_retainBlock(v40);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100006A80;
  v34[3] = &unk_100010650;
  char v39 = *(unsigned char *)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 56);
  id v16 = *(void **)(a1 + 40);
  v34[4] = *(void *)(a1 + 32);
  uint64_t v38 = v15;
  id v35 = v16;
  id v36 = *(id *)(a1 + 48);
  v17 = v14;
  id v37 = v17;
  v18 = objc_retainBlock(v34);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100006EF4;
  v29[3] = &unk_1000106A0;
  v20 = *(void **)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  v29[4] = *(void *)(a1 + 32);
  uint64_t v33 = v19;
  id v30 = v20;
  id v31 = v13;
  BOOL v21 = v18;
  id v32 = v21;
  id v22 = v13;
  id v23 = objc_retainBlock(v29);
  id v28 = v23;
  if (*(unsigned char *)(a1 + 64)) {
    id v23 = v21;
  }
  ((void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t))v23[2])(v23, v24, v25, v26, v27);
}

void sub_10000597C(uint64_t a1, void *a2)
{
  id v7 = a2;
  unint64_t v3 = (unint64_t)[v7 state];
  if (v3 > 6 || ((1 << v3) & 0x6C) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = MAStringForMAAssetState();
    (*(void (**)(uint64_t, void, void, void, const __CFString *))(v5 + 16))(v5, 0, 0, 0, @"Downloaded asset has invalid state [%ld: %{public}@]: %@");
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100005A54(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_10000B5F0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000B854();
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v5 = sub_100005BB0(*(void *)(a1 + 32), v3, *(unsigned char *)(a1 + 64));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
  if ([*(id *)(*(void *)(a1 + 32) + 40) isCancelled]) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) cancel];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005D18;
  v10[3] = &unk_100010518;
  v10[4] = v6;
  id v8 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v8;
  id v13 = *(id *)(a1 + 48);
  id v9 = v3;
  [v5 observeFinishOnQueue:v7 withBlock:v10];
}

id sub_100005BB0(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [objc_alloc((Class)GCOperation) initOnQueue:0 withOptions:4];
    [v6 setLabel:@"Download Asset"];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000076F4;
    v12[3] = &unk_100010768;
    char v14 = a3;
    id v7 = v5;
    id v13 = v7;
    [v6 setAsyncBlock:v12];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100007998;
    v10[3] = &unk_1000107D0;
    id v11 = v7;
    [v6 observeFinishWithOptions:0x10000 block:v10];
    id v8 = [v6 startAsynchronously];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_100005D18(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setCompletedUnitCount:", (char *)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "completedUnitCount") + 1);
  if (a2 == 1)
  {
    id v8 = [v6 domain];
    if ([v8 isEqual:@"com.apple.MobileAssetError.Download"])
    {
      int v9 = sub_100003A20((uint64_t)[v6 code], 0);

      if (v9)
      {
        CFStringRef v10 = sub_10000B5F0();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10000B950(a1);
        }
LABEL_14:

        id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
        goto LABEL_15;
      }
    }
    else
    {
    }
    CFStringRef v10 = sub_10000B5F0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000B9E4(a1);
    }
    goto LABEL_14;
  }
  if (!a2)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_15:
    v7();
    goto LABEL_16;
  }
  if (([*(id *)(a1 + 40) refreshState] & 1) == 0)
  {
    id v11 = sub_10000B5F0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000B8C8((id *)(a1 + 40));
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_15;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_16:
}

void sub_100005EEC(void *a1, void *a2)
{
  id v3 = a2;
  v60 = a1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1[4] + 8));
  uint64_t v4 = [v3 results];
  id v5 = sub_10000B5F0();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  v61 = v4;
  if (v6)
  {
    id v7 = sub_10000B5F0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10000BC0C();
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v76 objects:v85 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v77;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v77 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          char v14 = sub_10000B5F0();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v84 = v13;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "\t %{public}@", buf, 0xCu);
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v76 objects:v85 count:16];
      }
      while (v10);
    }

    uint64_t v4 = v61;
  }
  if ([v4 count])
  {
    id v59 = v3;
    uint64_t v15 = +[NSPredicate predicateWithBlock:&stru_100010560];
    id v16 = [v4 filteredArrayUsingPredicate:v15];

    v17 = [v16 sortedArrayUsingSelector:"db_compareTo:"];

    v18 = sub_10000B5F0();
    LODWORD(v16) = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

    if (v16)
    {
      uint64_t v19 = sub_10000B5F0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_10000BBD8();
      }

      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v20 = v17;
      id v21 = v17;
      id v22 = [v21 countByEnumeratingWithState:&v72 objects:v82 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v73;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v73 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
            uint64_t v27 = sub_10000B5F0();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v84 = v26;
              _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "\t %{public}@", buf, 0xCu);
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v72 objects:v82 count:16];
        }
        while (v23);
      }

      uint64_t v4 = v61;
      v17 = v20;
    }
    if (![v17 count])
    {
      id v55 = sub_10000B5F0();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        sub_10000BAB8(v4);
      }

      uint64_t v56 = v60[5];
      [v4 count];
      (*(void (**)(uint64_t, void, void, void, const __CFString *))(v56 + 16))(v56, 0, 0, 0, @"%zi available assets yielded no viable assets.");
      id v3 = v59;
      goto LABEL_65;
    }
    [v17 lastObject];
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_1000067B4;
    v70[3] = &unk_100010588;
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    id v71 = v28;
    uint64_t v29 = +[NSPredicate predicateWithBlock:v70];
    v58 = v17;
    id v30 = [v17 filteredArrayUsingPredicate:v29];

    id v31 = sub_10000B5F0();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);

    if (v32)
    {
      uint64_t v33 = sub_10000B5F0();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        sub_10000BB64();
      }
      id v57 = v28;

      id v34 = sub_10000B5F0();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        sub_10000BB30();
      }

      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v35 = v30;
      id v36 = [v35 countByEnumeratingWithState:&v66 objects:v81 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v67;
        do
        {
          for (k = 0; k != v37; k = (char *)k + 1)
          {
            if (*(void *)v67 != v38) {
              objc_enumerationMutation(v35);
            }
            long long v40 = *(void **)(*((void *)&v66 + 1) + 8 * (void)k);
            id v41 = sub_10000B5F0();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v84 = v40;
              _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "\t %{public}@", buf, 0xCu);
            }
          }
          id v37 = [v35 countByEnumeratingWithState:&v66 objects:v81 count:16];
        }
        while (v37);
      }

      id v28 = v57;
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v42 = v30;
    id v43 = [v42 countByEnumeratingWithState:&v62 objects:v80 count:16];
    if (v43)
    {
      id v44 = v43;
      long long v45 = 0;
      uint64_t v46 = *(void *)v63;
      do
      {
        for (m = 0; m != v44; m = (char *)m + 1)
        {
          if (*(void *)v63 != v46) {
            objc_enumerationMutation(v42);
          }
          id v48 = *(void **)(*((void *)&v62 + 1) + 8 * (void)m);
          unint64_t v49 = (unint64_t)[v48 state];
          if (v49 <= 6 && ((1 << v49) & 0x6C) != 0)
          {
            id v51 = v48;

            long long v45 = v51;
          }
        }
        id v44 = [v42 countByEnumeratingWithState:&v62 objects:v80 count:16];
      }
      while (v44);

      if (v45)
      {
        uint64_t v52 = sub_10000B5F0();
        id v3 = v59;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v84 = v45;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "Found a previously installed asset that matches the best asset: %{public}@", buf, 0xCu);
        }

        (*(void (**)(void))(v60[6] + 16))();
LABEL_64:

        uint64_t v4 = v61;
        v17 = v58;
LABEL_65:

        goto LABEL_66;
      }
    }
    else
    {
    }
    char v53 = sub_10000B5F0();
    id v3 = v59;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v84 = v28;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Local assets are out of date.  Downloading: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(v60[7] + 16))();
    goto LABEL_64;
  }
  v54 = sub_10000B5F0();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
    sub_10000BA78();
  }

  (*(void (**)(void))(v60[5] + 16))();
LABEL_66:
}

BOOL sub_1000066F8(id a1, MAAsset *a2, NSDictionary *a3)
{
  id v9 = 0;
  char v3 = sub_1000086C8(a2, &v9);
  id v4 = v9;
  id v5 = v4;
  if ((v3 & 1) == 0)
  {
    BOOL v6 = [v4 domain];
    if (![v6 isEqual:@"GCMobileAssetError"])
    {
LABEL_6:

      goto LABEL_7;
    }
    id v7 = [v5 code];

    if (v7 == (id)3)
    {
      BOOL v6 = sub_10000B5F0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        sub_10000BC40();
      }
      goto LABEL_6;
    }
  }
LABEL_7:

  return v3;
}

BOOL sub_1000067B4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "db_compareIgnoringContentRevisionTo:", *(void *)(a1 + 32)) == 0;
}

void sub_1000067DC(uint64_t a1)
{
  id v2 = sub_10000B5F0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000BCB4();
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  char v3 = sub_100004860(*(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v3);
  if ([*(id *)(a1 + 40) isCancelled]) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) cancel];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000691C;
  v5[3] = &unk_1000105D8;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 observeFinishOnQueue:v4 withBlock:v5];
}

void sub_10000691C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  if (a2 == 1)
  {
    id v10 = [v8 domain];
    if ([v10 isEqual:@"com.apple.MobileAssetError.Query"])
    {
      int v11 = sub_10000398C((unint64_t)[v8 code], 0);

      if (v11)
      {
        id v12 = sub_10000B5F0();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10000BCE8();
        }
LABEL_12:

        id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        goto LABEL_13;
      }
    }
    else
    {
    }
    id v12 = sub_10000B5F0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000BD50();
    }
    goto LABEL_12;
  }
  if (!a2)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_13:
    v9();
    goto LABEL_14;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:
}

void sub_100006A80(uint64_t a1)
{
  id v2 = sub_10000B5F0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000BDB8();
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  char v3 = sub_100006BC4(*(void **)(a1 + 32), *(unsigned char *)(a1 + 72));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v3);
  if ([*(id *)(a1 + 40) isCancelled]) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) cancel];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006DAC;
  v5[3] = &unk_100010628;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 observeFinishOnQueue:v4 withBlock:v5];
}

id sub_100006BC4(void *a1, char a2)
{
  if (a1)
  {
    char v3 = a1;
    objc_sync_enter(v3);
    if (!v3[4])
    {
      uint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "[Configuration Mobile Asset Manager] Download Catalog", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DETACHED);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      objc_initWeak(&location, v3);
      id v5 = [objc_alloc((Class)GCOperation) initOnQueue:0 withOptions:4];
      [v5 setLabel:@"Download Catalog"];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100007AFC;
      v10[3] = &unk_1000107F0;
      char v11 = a2;
      [v5 setAsyncBlock:v10];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100007DB0;
      v8[3] = &unk_100010840;
      objc_copyWeak(&v9, &location);
      [v5 observeFinishWithOptions:0x10000 block:v8];
      id v6 = v3[4];
      v3[4] = v5;

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
      os_activity_scope_leave(&state);
    }
    objc_sync_exit(v3);

    a1 = [v3[4] startAsynchronously];
  }

  return a1;
}

void sub_100006D78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));
  os_activity_scope_leave((os_activity_scope_state_t)(v3 - 64));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006DAC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  if (a2 == 1)
  {
    id v8 = [v6 domain];
    if ([v8 isEqual:@"com.apple.MobileAssetError.Download"])
    {
      int v9 = sub_100003A20((uint64_t)[v6 code], 0);

      if (v9)
      {
        id v10 = sub_10000B5F0();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10000BDEC();
        }
LABEL_12:

        id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        goto LABEL_13;
      }
    }
    else
    {
    }
    id v10 = sub_10000B5F0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000BE54();
    }
    goto LABEL_12;
  }
  if (!a2)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_13:
    v7();
    goto LABEL_14;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:
}

void sub_100006EF4(uint64_t a1)
{
  id v2 = sub_10000B5F0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000BEBC();
  }

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = sub_100004860(*(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v3);
  if ([*(id *)(*(void *)(a1 + 32) + 40) isCancelled]) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) cancel];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000703C;
  v6[3] = &unk_100010678;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v3 observeFinishOnQueue:v5 withBlock:v6];
}

void sub_10000703C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  objc_msgSend(*(id *)(a1[4] + 40), "setCompletedUnitCount:", (char *)objc_msgSend(*(id *)(a1[4] + 40), "completedUnitCount") + 1);
  if (a2 == 1)
  {
    id v10 = [v8 domain];
    if ([v10 isEqual:@"com.apple.MobileAssetError.Query"])
    {
      int v11 = sub_10000398C((unint64_t)[v8 code], 0);

      if (v11)
      {
        id v12 = sub_10000B5F0();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10000BEF0();
        }
LABEL_14:

        id v9 = *(void (**)(void))(a1[5] + 16);
        goto LABEL_15;
      }
    }
    else
    {
    }
    id v12 = sub_10000B5F0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000BF58();
    }
    goto LABEL_14;
  }
  if (!a2)
  {
    id v9 = *(void (**)(void))(a1[5] + 16);
LABEL_15:
    v9();
    goto LABEL_17;
  }
  if ([v7 isCatalogFetchedWithinThePastFewDays:1]) {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else {
    (*(void (**)(void))(a1[7] + 16))();
  }
LABEL_17:
}

id sub_1000071F0(uint64_t a1, uint64_t a2, int a3)
{
  if (a1)
  {
    uint64_t v5 = sub_10000B558();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10000BFC0(a2, v5);
    }

    id v6 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.GameController.DB1"];
    [v6 returnTypes:a2];
    if (a3)
    {
      [v6 setDoNotBlockOnNetworkStatus:1];
      [v6 setDoNotBlockBeforeFirstUnlock:1];
    }
    id v7 = [objc_alloc((Class)GCOperation) initOnQueue:0 withOptions:256];
    [v7 setLabel:@"Query Assets"];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000073B8;
    v17[3] = &unk_1000106F0;
    id v8 = v6;
    id v18 = v8;
    [v7 setSyncBlock:v17];
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    char v14 = sub_1000074F4;
    uint64_t v15 = &unk_100010340;
    id v16 = v8;
    id v9 = v8;
    [v7 setAsyncBlock:&v12];
    id v10 = objc_msgSend(v7, "activate", v12, v13, v14, v15);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id sub_1000073B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [*(id *)(a1 + 32) queryMetaDataSync];
  if (sub_100003970())
  {
    id v6 = *(id *)(a1 + 32);
  }
  else
  {
    v13[0] = @"Assets query failed.";
    v12[0] = NSLocalizedDescriptionKey;
    v12[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v7 = MAStringForMAQueryResult();
    id v8 = (void *)v7;
    CFStringRef v9 = &stru_100010C80;
    if (v7) {
      CFStringRef v9 = (const __CFString *)v7;
    }
    v13[1] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    *a3 = +[NSError errorWithDomain:@"com.apple.MobileAssetError.Query" code:v5 userInfo:v10];

    id v6 = 0;
  }

  return v6;
}

void sub_1000074F4(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000075A0;
  v5[3] = &unk_100010718;
  id v6 = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = v3;
  id v4 = v6;
  [v3 queryMetaDataWithError:v5];
}

void sub_1000075A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = sub_100003970();
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [*(id *)(a1 + 32) succeedWithResult:*(void *)(a1 + 40)];
  }
  else if (v5)
  {
    [*(id *)(a1 + 32) failWithError:v5];
  }
  else
  {
    v14[0] = @"Assets query failed.";
    v13[0] = NSLocalizedDescriptionKey;
    v13[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v8 = MAStringForMAQueryResult();
    CFStringRef v9 = (void *)v8;
    CFStringRef v10 = &stru_100010C80;
    if (v8) {
      CFStringRef v10 = (const __CFString *)v8;
    }
    v14[1] = v10;
    int v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v12 = +[NSError errorWithDomain:@"com.apple.MobileAssetError.Query" code:a2 userInfo:v11];
    [v7 failWithError:v12];
  }
}

void sub_1000076F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  id v5 = v4;
  if (*(unsigned char *)(a1 + 40))
  {
    [v4 setAllowsCellularAccess:1];
    [v5 setDiscretionary:0];
    [v5 setAllowsExpensiveAccess:1];
    [v5 setRequiresPowerPluggedIn:0];
  }
  int v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000077E8;
  v8[3] = &unk_100010740;
  id v9 = v3;
  id v7 = v3;
  [v6 startDownload:v5 completionWithError:v8];
}

void sub_1000077E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (sub_1000039C0(a2))
  {
    int v6 = *(void **)(a1 + 32);
    id v7 = +[NSNumber numberWithInteger:a2];
    [v6 succeedWithResult:v7];
  }
  else
  {
    if (sub_100003B80(a2))
    {
      uint64_t v8 = sub_10000B558();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_10000C054(a2, (uint64_t)v5, v8);
      }
    }
    id v9 = *(void **)(a1 + 32);
    if (v5)
    {
      [v9 failWithError:v5];
    }
    else
    {
      v16[0] = @"Asset download failed.";
      v15[0] = NSLocalizedDescriptionKey;
      v15[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v10 = MAStringForMADownloadResult();
      int v11 = (void *)v10;
      CFStringRef v12 = &stru_100010C80;
      if (v10) {
        CFStringRef v12 = (const __CFString *)v10;
      }
      v16[1] = v12;
      uint64_t v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
      char v14 = +[NSError errorWithDomain:@"com.apple.MobileAssetError.Download" code:a2 userInfo:v13];
      [v9 failWithError:v14];
    }
  }
}

id *sub_100007998(id *result, uint64_t a2)
{
  if (!a2)
  {
    id v2 = result;
    id v3 = sub_10000B558();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10000C0F8();
    }

    return (id *)[v2[4] cancelDownload:&stru_1000107A8];
  }
  return result;
}

void sub_1000079FC(id a1, int64_t a2)
{
  id v3 = sub_10000B558();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v4)
    {
      id v5 = MAStringForMACancelDownloadResult();
      int v6 = 134218242;
      int64_t v7 = a2;
      __int16 v8 = 2114;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Asset download cancellation failed with error [%ld: %{public}@]", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (v4)
  {
    LOWORD(v6) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Asset download cancelled.", (uint8_t *)&v6, 2u);
  }
}

void sub_100007AFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_opt_new();
  id v5 = v4;
  if (*(unsigned char *)(a1 + 32))
  {
    [v4 setAllowsCellularAccess:1];
    [v5 setDiscretionary:0];
    [v5 setAllowsExpensiveAccess:1];
    [v5 setRequiresPowerPluggedIn:0];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007C00;
  v7[3] = &unk_100010740;
  id v8 = v3;
  id v6 = v3;
  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.GameController.DB1" options:v5 completionWithError:v7];
}

void sub_100007C00(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (sub_1000039C0(a2))
  {
    id v6 = *(void **)(a1 + 32);
    int64_t v7 = +[NSNumber numberWithInteger:a2];
    [v6 succeedWithResult:v7];
  }
  else
  {
    if (sub_100003B80(a2))
    {
      id v8 = sub_10000B558();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10000C12C(a2, (uint64_t)v5, v8);
      }
    }
    id v9 = *(void **)(a1 + 32);
    if (v5)
    {
      [v9 failWithError:v5];
    }
    else
    {
      v16[0] = @"Asset catalog download failed.";
      v15[0] = NSLocalizedDescriptionKey;
      v15[1] = NSLocalizedFailureReasonErrorKey;
      uint64_t v10 = MAStringForMADownloadResult();
      int v11 = (void *)v10;
      CFStringRef v12 = &stru_100010C80;
      if (v10) {
        CFStringRef v12 = (const __CFString *)v10;
      }
      v16[1] = v12;
      uint64_t v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
      char v14 = +[NSError errorWithDomain:@"com.apple.MobileAssetError.Download" code:a2 userInfo:v13];
      [v9 failWithError:v14];
    }
  }
}

void sub_100007DB0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v10 = WeakRetained;
    if (WeakRetained)
    {
      int v11 = WeakRetained;
      objc_sync_enter(v11);
      CFStringRef v12 = (void *)v11[4];
      v11[4] = 0;

      objc_sync_exit(v11);
    }
  }
  else
  {
    uint64_t v13 = sub_10000B558();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10000C1D0();
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_100007F00;
    v14[3] = &unk_100010818;
    objc_copyWeak(&v15, (id *)(a1 + 32));
    +[MAAsset cancelCatalogDownload:@"com.apple.MobileAsset.GameController.DB1" then:v14];
    objc_destroyWeak(&v15);
  }
}

void sub_100007EEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100007F00(uint64_t a1, uint64_t a2)
{
  BOOL v4 = sub_10000B558();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      id v6 = MAStringForMACancelDownloadResult();
      int v11 = 134218242;
      uint64_t v12 = a2;
      __int16 v13 = 2114;
      char v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Catalog download cancellation failed with error [%ld: %{public}@]", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Catalog download cancelled.", (uint8_t *)&v11, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    objc_sync_enter(v9);
    uint64_t v10 = (void *)v9[4];
    v9[4] = 0;

    objc_sync_exit(v9);
  }
}

void sub_1000080B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000080D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000813C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000815C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000824C(id a1)
{
  qword_100015708 = objc_alloc_init(GameControllerConfigService);

  _objc_release_x1();
}

id sub_100008310(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    id v2 = (void *)v1[2];
    if (!v2)
    {
      id v3 = [[_GCConfigurationMobileAssetManager alloc] initWithProvider:v1];
      BOOL v4 = (void *)v1[2];
      v1[2] = v3;

      id v2 = (void *)v1[2];
    }
    id v5 = v2;
    objc_sync_exit(v1);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_1000083A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

uint64_t sub_1000086C8(void *a1, void *a2)
{
  uint64_t v2 = (uint64_t)a1;
  if (a1)
  {
    if (sub_1000089CC(a1, a2))
    {
      id v24 = 0;
      BOOL v4 = sub_100008B20((void *)v2, &v24);
      id v5 = v24;
      id v6 = v5;
      if (v4 || !v5)
      {
        if (v4)
        {
          id v7 = +[GCVersion currentSourceVersion];
          unsigned int v8 = [v4 isGreaterThanSourceVersion:v7];

          if (v8)
          {
            if (a2)
            {
              v28[0] = @"Asset is incompatible with host.";
              v27[0] = NSLocalizedDescriptionKey;
              v27[1] = NSLocalizedFailureReasonErrorKey;
              uint64_t v9 = +[NSString stringWithFormat:@"Asset requires version '%@'.", v4];
              v28[1] = v9;
              uint64_t v10 = v28;
              int v11 = v27;
LABEL_22:
              id v18 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:2];
              sub_10000B688((uint64_t)NSError, 6, v18);
              *a2 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_23;
            }
            goto LABEL_23;
          }
        }

        id v23 = 0;
        uint64_t v12 = sub_100008DD0((void *)v2, &v23);
        id v6 = v23;
        if (!v12
          || (v12,
              v6,
              id v22 = 0,
              __int16 v13 = sub_1000090DC((void *)v2, &v22),
              id v14 = v22,
              id v6 = v14,
              !v13)
          && v14)
        {
LABEL_27:
          if (a2)
          {
            uint64_t v2 = 0;
            *a2 = v6;
            goto LABEL_25;
          }
          goto LABEL_24;
        }

        id v21 = 0;
        BOOL v4 = sub_100009300((void *)v2, &v21);
        id v15 = v21;
        id v6 = v15;
        if (v4 || !v15)
        {
          if (v4 && sub_1000096EC((uint64_t)MAAsset, v4) < 0)
          {
            if (a2)
            {
              v25[0] = NSLocalizedDescriptionKey;
              v25[1] = NSLocalizedFailureReasonErrorKey;
              v26[0] = @"Asset is incompatible with host.";
              uint64_t v9 = +[NSString stringWithFormat:@"Asset does not support the current platform."];
              v26[1] = v9;
              uint64_t v10 = v26;
              int v11 = v25;
              goto LABEL_22;
            }
LABEL_23:

LABEL_24:
            uint64_t v2 = 0;
            goto LABEL_25;
          }

          id v20 = 0;
          id v16 = sub_1000097A0((void *)v2, &v20);
          id v17 = v20;
          id v6 = v17;
          if (v16 || !v17)
          {

            uint64_t v2 = 1;
LABEL_25:

            return v2;
          }
          goto LABEL_27;
        }
      }
      if (a2) {
        *a2 = v6;
      }
      goto LABEL_23;
    }
    return 0;
  }
  return v2;
}

id sub_1000089CC(void *a1, void *a2)
{
  id v3 = a1;
  BOOL v4 = [v3 assetType];
  id v5 = [v4 isEqualToString:@"com.apple.MobileAsset.GameController.DB1"];

  if (a2 && (v5 & 1) == 0)
  {
    v10[0] = NSLocalizedDescriptionKey;
    v10[1] = NSLocalizedFailureReasonErrorKey;
    v11[0] = @"Invalid asset.";
    id v6 = [v3 assetType];
    id v7 = +[NSString stringWithFormat:@"Asset has incorrect type '%@'.", v6];
    v11[1] = v7;
    unsigned int v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    sub_10000B688((uint64_t)NSError, 2, v8);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

id sub_100008B20(void *a1, void *a2)
{
  if (a1)
  {
    BOOL v4 = objc_getAssociatedObject(a1, off_100010890);
    if (v4) {
      goto LABEL_8;
    }
    if (sub_1000089CC(a1, a2))
    {
      id v5 = [a1 attributes];
      id v15 = 0;
      id v6 = objc_msgSend(v5, "gc_requiredObjectForKey:ofClass:error:", @"_CompatibilityVersion", objc_opt_class(), &v15);
      id v7 = v15;

      if (v6)
      {
        id v8 = [objc_alloc((Class)GCVersion) initWithString:v6];
        if (v8)
        {
          BOOL v4 = v8;
          objc_setAssociatedObject(a1, off_100010890, v8, (void *)0x303);
LABEL_7:

          goto LABEL_8;
        }
        if (a2)
        {
          v18[0] = @"Invalid asset format.";
          v17[0] = NSLocalizedDescriptionKey;
          v17[1] = NSLocalizedFailureReasonErrorKey;
          uint64_t v12 = +[NSString stringWithFormat:@"'%@' is not a valid version.", v6];
          v18[1] = v12;
          v17[2] = @"FailingKeyPath";
          CFStringRef v16 = @"_CompatibilityVersion";
          __int16 v13 = +[NSArray arrayWithObjects:&v16 count:1];
          v18[2] = v13;
          id v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
          sub_10000B688((uint64_t)NSError, 3, v14);
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (a2)
      {
        v20[0] = @"Invalid asset format.";
        v19[0] = NSLocalizedDescriptionKey;
        v19[1] = NSLocalizedFailureReasonErrorKey;
        uint64_t v10 = [v7 localizedFailureReason];
        v20[1] = v10;
        int v11 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
        sub_10000B688((uint64_t)NSError, 3, v11);
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v4 = 0;
      goto LABEL_7;
    }
  }
  BOOL v4 = 0;
LABEL_8:

  return v4;
}

id sub_100008DD0(void *a1, void *a2)
{
  if (a1)
  {
    BOOL v4 = objc_getAssociatedObject(a1, off_100010898);
    if (v4) {
      goto LABEL_8;
    }
    if (sub_1000089CC(a1, a2))
    {
      id v5 = [a1 attributes];
      id v18 = 0;
      id v6 = objc_msgSend(v5, "gc_requiredObjectForKey:ofClass:error:", @"_ContentVersion", objc_opt_class(), &v18);
      id v7 = v18;

      if (v6)
      {
        id v8 = [objc_alloc((Class)GCVersion) initWithString:v6];
        if (v8)
        {
          BOOL v4 = v8;
          objc_setAssociatedObject(a1, off_100010898, v8, (void *)0x303);
LABEL_7:

          goto LABEL_8;
        }
        if (a2)
        {
          v21[0] = @"Invalid asset format.";
          v20[0] = NSLocalizedDescriptionKey;
          v20[1] = NSLocalizedFailureReasonErrorKey;
          uint64_t v12 = +[NSString stringWithFormat:@"'%@' is not a valid version.", v6];
          v21[1] = v12;
          void v20[2] = @"FailingKeyPath";
          CFStringRef v19 = @"_ContentVersion";
          __int16 v13 = +[NSArray arrayWithObjects:&v19 count:1];
          v21[2] = v13;
          id v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
          sub_10000B688((uint64_t)NSError, 3, v14);
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        uint64_t v10 = [v7 domain];
        int v11 = v10;
        if (v10 == (void *)GC_NSCollectionErrorDomain)
        {
          id v15 = [v7 code];

          if (v15 == (id)3)
          {
            BOOL v4 = sub_100009D8C(a1, a2);
            goto LABEL_7;
          }
        }
        else
        {
        }
        if (a2)
        {
          v23[0] = @"Invalid asset format.";
          v22[0] = NSLocalizedDescriptionKey;
          v22[1] = NSLocalizedFailureReasonErrorKey;
          CFStringRef v16 = [v7 localizedFailureReason];
          v23[1] = v16;
          id v17 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
          sub_10000B688((uint64_t)NSError, 3, v17);
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      BOOL v4 = 0;
      goto LABEL_7;
    }
  }
  BOOL v4 = 0;
LABEL_8:

  return v4;
}

void *sub_1000090DC(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a2;
  if (!sub_1000089CC(a1, a2)) {
    return 0;
  }
  BOOL v4 = [a1 attributes];
  id v12 = 0;
  id v5 = objc_msgSend(v4, "gc_requiredObjectForKey:ofClass:error:", @"_ContentRevision", objc_opt_class(), &v12);
  id v6 = v12;

  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 0;
  }
  if (!v7)
  {
    if (!v2) {
      goto LABEL_13;
    }
    v16[0] = @"Invalid asset format.";
    v15[0] = NSLocalizedDescriptionKey;
    v15[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v10 = [v6 localizedFailureReason];
    v16[1] = v10;
    int v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    sub_10000B688((uint64_t)NSError, 3, v11);
    *uint64_t v2 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (((unint64_t)[v5 integerValue] & 0x8000000000000000) != 0)
  {
    if (v2)
    {
      v13[0] = NSLocalizedDescriptionKey;
      v13[1] = NSLocalizedFailureReasonErrorKey;
      v14[0] = @"Invalid asset format.";
      v14[1] = @"Negative values are not permitted.";
      void v13[2] = @"FailingKeyPath";
      void v14[2] = @"_ContentRevision";
      id v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
      sub_10000B688((uint64_t)NSError, 3, v8);
      *uint64_t v2 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = [v5 integerValue];
  }
LABEL_13:

  return v2;
}

id sub_100009300(void *a1, void *a2)
{
  if (a1)
  {
    objc_getAssociatedObject(a1, off_1000108A0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4) {
      goto LABEL_19;
    }
    if (sub_1000089CC(a1, a2))
    {
      id v5 = [a1 attributes];
      id v26 = 0;
      id v6 = objc_msgSend(v5, "gc_objectForKey:ofClass:error:", @"Platforms", objc_opt_class(), &v26);
      id v7 = v26;

      if (!v6 && v7)
      {
        if (a2)
        {
          v30[0] = @"Invalid asset format.";
          v29[0] = NSLocalizedDescriptionKey;
          v29[1] = NSLocalizedFailureReasonErrorKey;
          id v17 = [v7 localizedFailureReason];
          v30[1] = v17;
          id v18 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
          sub_10000B688((uint64_t)NSError, 3, v18);
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        if (!v6)
        {
LABEL_9:
          objc_setAssociatedObject(a1, off_1000108A0, v6, (void *)0x303);
          id v4 = v6;
LABEL_18:

          goto LABEL_19;
        }
        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x3032000000;
        v24[3] = sub_10000A1D4;
        v24[4] = sub_10000A1E4;
        id v25 = 0;
        uint64_t v20 = 0;
        id v21 = &v20;
        uint64_t v22 = 0x2020000000;
        uint64_t v23 = 0;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        void v19[2] = sub_10000A1EC;
        v19[3] = &unk_1000108B8;
        v19[4] = v24;
        v19[5] = &v20;
        objc_msgSend(v6, "gc_enumerateKeysAndObjectsUsingBlock:", v19);
        id v8 = (id)v21[3];
        if (v8 == [v6 count])
        {
          _Block_object_dispose(&v20, 8);
          _Block_object_dispose(v24, 8);

          goto LABEL_9;
        }
        if (a2)
        {
          v28[0] = @"Invalid asset format.";
          v27[0] = NSLocalizedDescriptionKey;
          v27[1] = NSLocalizedFailureReasonErrorKey;
          uint64_t v9 = [v7 localizedFailureReason];
          uint64_t v10 = (void *)v9;
          CFStringRef v11 = &stru_100010C80;
          if (v9) {
            CFStringRef v11 = (const __CFString *)v9;
          }
          v28[1] = v11;
          void v27[2] = @"FailingKeyPath";
          id v12 = sub_10000B700(v7);
          __int16 v13 = v12;
          if (!v12) {
            id v12 = &__NSArray0__struct;
          }
          id v14 = [v12 arrayByAddingObject:@"Platforms"];
          void v28[2] = v14;
          id v15 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
          sub_10000B688((uint64_t)NSError, 3, v15);
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
        _Block_object_dispose(&v20, 8);
        _Block_object_dispose(v24, 8);
      }
      id v4 = 0;
      goto LABEL_18;
    }
  }
  id v4 = 0;
LABEL_19:

  return v4;
}

void sub_1000096C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000096EC(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  if (v2)
  {
    id v3 = [v2 objectForKeyedSubscript:@"ios"];
    if (v3)
    {
      id v4 = v3;
      BOOL v5 = [v3 BOOLValue] == 0;
      uint64_t v6 = 3;
    }
    else
    {
      uint64_t v8 = [v2 objectForKeyedSubscript:@"embeddedos"];
      id v4 = v8;
      if (!v8)
      {
        uint64_t v7 = -1;
LABEL_10:

        goto LABEL_11;
      }
      BOOL v5 = [v8 BOOLValue] == 0;
      uint64_t v6 = 2;
    }
    if (v5) {
      uint64_t v7 = -v6;
    }
    else {
      uint64_t v7 = v6;
    }
    goto LABEL_10;
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

id sub_1000097A0(void *a1, void *a2)
{
  if (a1)
  {
    objc_getAssociatedObject(a1, &off_1000108A8);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4) {
      goto LABEL_17;
    }
    if (sub_1000089CC(a1, a2))
    {
      BOOL v5 = [a1 attributes];
      id v28 = 0;
      uint64_t v6 = objc_msgSend(v5, "gc_objectForKey:ofClass:error:", @"ConfigurationBundles", objc_opt_class(), &v28);
      id v7 = v28;

      if (!v6 && v7)
      {
        if (a2)
        {
          v32[0] = @"Invalid asset format.";
          v31[0] = NSLocalizedDescriptionKey;
          v31[1] = NSLocalizedFailureReasonErrorKey;
          id v15 = [v7 localizedFailureReason];
          v32[1] = v15;
          CFStringRef v16 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
          sub_10000B688((uint64_t)NSError, 3, v16);
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        if (!v6)
        {
LABEL_9:
          objc_setAssociatedObject(a1, &off_1000108A8, v6, (void *)0x303);
          id v4 = v6;
LABEL_16:

          goto LABEL_17;
        }
        uint64_t v22 = 0;
        uint64_t v23 = &v22;
        uint64_t v24 = 0x3032000000;
        id v25 = sub_10000A1D4;
        id v26 = sub_10000A1E4;
        id v27 = 0;
        uint64_t v18 = 0;
        CFStringRef v19 = &v18;
        uint64_t v20 = 0x2020000000;
        uint64_t v21 = 0;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10000A410;
        void v17[3] = &unk_100010908;
        void v17[4] = &v22;
        v17[5] = &v18;
        objc_msgSend(v6, "gc_enumerateKeysAndObjectsUsingBlock:", v17);
        id v8 = (id)v19[3];
        if (v8 == [v6 count])
        {
          _Block_object_dispose(&v18, 8);
          _Block_object_dispose(&v22, 8);

          goto LABEL_9;
        }
        if (a2)
        {
          v30[0] = @"Invalid asset format.";
          v29[0] = NSLocalizedDescriptionKey;
          v29[1] = NSLocalizedFailureReasonErrorKey;
          uint64_t v9 = [(id)v23[5] localizedFailureReason];
          v30[1] = v9;
          void v29[2] = @"FailingKeyPath";
          uint64_t v10 = sub_10000B700((void *)v23[5]);
          uint64_t v11 = v10;
          if (!v10) {
            uint64_t v10 = &__NSArray0__struct;
          }
          uint64_t v12 = [v10 arrayByAddingObject:@"ConfigurationBundles"];
          void v30[2] = v12;
          __int16 v13 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
          sub_10000B688((uint64_t)NSError, 3, v13);
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
        _Block_object_dispose(&v18, 8);
        _Block_object_dispose(&v22, 8);
      }
      id v4 = 0;
      goto LABEL_16;
    }
  }
  id v4 = 0;
LABEL_17:

  return v4;
}

void sub_100009B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void *sub_100009D8C(void *a1, void *a2)
{
  if (a1)
  {
    id v2 = a2;
    if (sub_1000089CC(a1, a2))
    {
      id v4 = [a1 attributes];
      id v10 = 0;
      BOOL v5 = objc_msgSend(v4, "gc_requiredObjectForKey:ofClass:error:", @"_ContentVersion", objc_opt_class(), &v10);
      id v6 = v10;

      if (v5)
      {
        if (((unint64_t)[v5 integerValue] & 0x8000000000000000) == 0)
        {
          id v2 = objc_msgSend(objc_alloc((Class)GCVersion), "initWithMajor:minor:patch:", objc_msgSend(v5, "unsignedIntegerValue"), 0, 0);
          objc_setAssociatedObject(a1, off_100010898, v2, (void *)0x303);
LABEL_9:

          goto LABEL_10;
        }
        if (!v2) {
          goto LABEL_9;
        }
        v11[0] = NSLocalizedDescriptionKey;
        v11[1] = NSLocalizedFailureReasonErrorKey;
        v12[0] = @"Invalid asset format.";
        v12[1] = @"Negative values are not permitted.";
        void v11[2] = @"FailingKeyPath";
        void v12[2] = @"_ContentVersion";
        id v7 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
        sub_10000B688((uint64_t)NSError, 3, v7);
        *id v2 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v2) {
          goto LABEL_9;
        }
        v14[0] = @"Invalid asset format.";
        v13[0] = NSLocalizedDescriptionKey;
        v13[1] = NSLocalizedFailureReasonErrorKey;
        id v7 = [v6 localizedFailureReason];
        v14[1] = v7;
        uint64_t v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
        sub_10000B688((uint64_t)NSError, 3, v9);
        *id v2 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v2 = 0;
      goto LABEL_9;
    }
  }
  id v2 = 0;
LABEL_10:

  return v2;
}

uint64_t sub_10000A1D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A1E4(uint64_t a1)
{
}

void sub_10000A1EC(uint64_t a1, void (**a2)(void, void, void), void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    id v15 = *(id *)(v13 + 40);
    id v14 = v7[2](v7, v12, &v15);
    objc_storeStrong((id *)(v13 + 40), v15);
    if (v14) {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    else {
      *a4 = 1;
    }
  }
  else
  {
    *a4 = 1;
  }
}

uint64_t sub_10000A310(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v7 = 0;
  id v1 = sub_100009300(a1, &v7);
  id v2 = v7;
  id v3 = v2;
  if (!v1 && v2)
  {
    id v6 = +[NSException gc_exceptionWithName:NSInvalidArgumentException error:v2];
    objc_exception_throw(v6);
  }
  uint64_t v4 = sub_1000096EC((uint64_t)MAAsset, v1);

  return v4;
}

void sub_10000A410(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v36 = *(id *)(v9 + 40);
  uint64_t v10 = v6[2](v6, v8, &v36);
  objc_storeStrong((id *)(v9 + 40), v36);
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v12 + 40);
    uint64_t v13 = v7[2](v7, v11, &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
    if (v13)
    {
      uint64_t v29 = 0;
      id v30 = &v29;
      uint64_t v31 = 0x3032000000;
      BOOL v32 = sub_10000A1D4;
      uint64_t v33 = sub_10000A1E4;
      id v34 = 0;
      uint64_t v25 = 0;
      id v26 = &v25;
      uint64_t v27 = 0x2020000000;
      uint64_t v28 = 0;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000A75C;
      v24[3] = &unk_1000108E0;
      v24[4] = &v29;
      void v24[5] = &v25;
      objc_msgSend(v13, "gc_enumerateObjectsUsingBlock:", v24);
      id v14 = (id)v26[3];
      if (v14 == [v13 count])
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      }
      else
      {
        v37[0] = NSLocalizedFailureReasonErrorKey;
        id v15 = [(id)v30[5] localizedFailureReason];
        v37[1] = @"FailingKeyPath";
        v38[0] = v15;
        CFStringRef v16 = sub_10000B700((void *)v30[5]);
        id v17 = v16;
        if (!v16) {
          CFStringRef v16 = &__NSArray0__struct;
        }
        uint64_t v18 = [v16 arrayByAddingObject:v10];
        v38[1] = v18;
        CFStringRef v19 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
        uint64_t v20 = sub_10000B688((uint64_t)NSError, 3, v19);
        uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;

        *a4 = 1;
      }
      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&v29, 8);
    }
    else
    {
      *a4 = 1;
    }
  }
  else
  {
    *a4 = 1;
  }
}

void sub_10000A730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_10000A75C(uint64_t a1, void (**a2)(void, void, void), uint64_t a3, unsigned char *a4)
{
  uint64_t v8 = a2;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = ((void (**)(void, uint64_t, id *))a2)[2](v8, v9, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else
  {
    v21[0] = NSLocalizedFailureReasonErrorKey;
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) localizedFailureReason];
    v21[1] = @"FailingKeyPath";
    v22[0] = v12;
    uint64_t v13 = +[NSString stringWithFormat:@"%lu", a3];
    uint64_t v20 = v13;
    uint64_t v14 = +[NSArray arrayWithObjects:&v20 count:1];
    v22[1] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    uint64_t v16 = sub_10000B688((uint64_t)NSError, 3, v15);
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    *a4 = 1;
  }
}

void sub_10000AB20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![*(id *)(a1 + 32) state]) {
    [*(id *)(a1 + 32) refreshState];
  }
  unint64_t v4 = (unint64_t)[*(id *)(a1 + 32) state];
  if (v4 > 6 || ((1 << v4) & 0x6C) == 0)
  {
    unint64_t v19 = v4;
    uint64_t v20 = +[NSNotificationCenter defaultCenter];
    [v20 postNotificationName:@"GCDBMobileAssetErrorNotification" object:*(void *)(a1 + 32)];

    v53[0] = NSLocalizedDescriptionKey;
    v53[1] = NSLocalizedFailureReasonErrorKey;
    v54[0] = @"Fetch bundle URLS for configuration failed.";
    uint64_t v21 = MAStringForMAAssetState();
    uint64_t v22 = +[NSString stringWithFormat:@"Asset is not installed.  State [%li: %@].", v19, v21];
    v54[1] = v22;
    uint64_t v23 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
    id v6 = sub_10000B688((uint64_t)NSError, 4, v23);

    [v3 failWithError:v6];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) getLocalFileUrl];
    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      id v48 = 0;
      uint64_t v8 = sub_1000097A0(v7, &v48);
      id v9 = v48;
      uint64_t v10 = [v8 objectForKey:*(void *)(a1 + 40)];

      if (!v10 && v9)
      {
        uint64_t v31 = +[NSNotificationCenter defaultCenter];
        [v31 postNotificationName:@"GCDBMobileAssetErrorNotification" object:*(void *)(a1 + 32)];

        [v3 failWithError:v9];
      }
      else if ([v10 count])
      {
        uint64_t v11 = +[NSFileManager defaultManager];
        uint64_t v42 = 0;
        id v43 = &v42;
        uint64_t v44 = 0x3032000000;
        long long v45 = sub_10000A1D4;
        uint64_t v46 = sub_10000A1E4;
        id v47 = 0;
        id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10000B0F4;
        v36[3] = &unk_100010930;
        id v37 = v6;
        id v41 = &v42;
        id v13 = v11;
        uint64_t v14 = *(void *)(a1 + 32);
        id v38 = v13;
        uint64_t v39 = v14;
        id v15 = v12;
        id v40 = v15;
        [v10 enumerateObjectsUsingBlock:v36];
        if ([v15 count] || (uint64_t v24 = (void *)v43[5]) == 0)
        {
          id v16 = [v15 copy];
          [v3 succeedWithResult:v16];
        }
        else
        {
          id v32 = [v24 code];
          v49[0] = NSLocalizedDescriptionKey;
          id v35 = [(id)v43[5] localizedDescription];
          CFStringRef v25 = v35;
          if (!v35) {
            CFStringRef v25 = &stru_100010C80;
          }
          v50[0] = v25;
          v49[1] = NSLocalizedFailureReasonErrorKey;
          id v34 = [(id)v43[5] localizedFailureReason];
          CFStringRef v26 = v34;
          if (!v34) {
            CFStringRef v26 = &stru_100010C80;
          }
          v50[1] = v26;
          v49[2] = @"FailingKeyPath";
          uint64_t v27 = sub_10000B700((void *)v43[5]);
          uint64_t v28 = v27;
          if (!v27) {
            uint64_t v27 = &__NSArray0__struct;
          }
          uint64_t v33 = [v27 arrayByAddingObject:*(void *)(a1 + 40)];
          uint64_t v29 = [v33 arrayByAddingObject:@"ConfigurationBundles"];
          v50[2] = v29;
          id v30 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];
          sub_10000B688((uint64_t)NSError, (uint64_t)v32, v30);
          id v16 = (id)objc_claimAutoreleasedReturnValue();

          [v3 failWithError:v16];
        }

        _Block_object_dispose(&v42, 8);
      }
      else
      {
        [v3 succeedWithResult:&__NSArray0__struct];
      }
    }
    else
    {
      uint64_t v17 = +[NSNotificationCenter defaultCenter];
      [v17 postNotificationName:@"GCDBMobileAssetErrorNotification" object:*(void *)(a1 + 32)];

      v51[0] = NSLocalizedDescriptionKey;
      v51[1] = NSLocalizedFailureReasonErrorKey;
      v52[0] = @"Fetch bundle URLS for configuration failed.";
      v52[1] = @"Asset data is missing.";
      uint64_t v18 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
      sub_10000B688((uint64_t)NSError, 5, v18);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      [v3 failWithError:v9];
    }
  }
}

void sub_10000B0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_10000B0F4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v5];
  id v7 = [v6 path];
  uint64_t v8 = [v7 stringByStandardizingPath];

  id v9 = [*(id *)(a1 + 32) path];
  uint64_t v10 = [v9 stringByStandardizingPath];

  if (!v8 || ([v8 hasPrefix:v10] & 1) == 0)
  {
    v33[0] = @"Invalid asset format.";
    v32[0] = NSLocalizedDescriptionKey;
    v32[1] = NSLocalizedFailureReasonErrorKey;
    id v13 = +[NSString stringWithFormat:@"Invalid path '%@' -> '%@'.", v5, v8];
    v33[1] = v13;
    v33[2] = v8;
    void v32[2] = NSFilePathErrorKey;
    v32[3] = @"FailingKeyPath";
    uint64_t v14 = +[NSString stringWithFormat:@"[%lu]", a3];
    uint64_t v31 = v14;
    id v15 = +[NSArray arrayWithObjects:&v31 count:1];
    v32[4] = @"AssetDataPath";
    v33[3] = v15;
    v33[4] = v10;
    id v16 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];
    uint64_t v17 = sub_10000B688((uint64_t)NSError, 3, v16);
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v11 = *(void **)(a1 + 40);
  id v12 = [v6 path];
  LOBYTE(v11) = [v11 fileExistsAtPath:v12];

  if ((v11 & 1) == 0)
  {
    uint64_t v20 = +[NSNotificationCenter defaultCenter];
    [v20 postNotificationName:@"GCDBMobileAssetErrorNotification" object:*(void *)(a1 + 48)];

    v30[0] = @"Invalid asset format.";
    v29[0] = NSLocalizedDescriptionKey;
    v29[1] = NSLocalizedFailureReasonErrorKey;
    id v13 = +[NSString stringWithFormat:@"No configuration bundle at path '%@' -> '%@'.", v5, v8];
    v30[1] = v13;
    void v29[2] = NSFilePathErrorKey;
    uint64_t v21 = [v6 path];
    void v30[2] = v21;
    void v29[3] = @"FailingKeyPath";
    uint64_t v22 = +[NSString stringWithFormat:@"[%lu]", a3];
    uint64_t v28 = v22;
    uint64_t v23 = +[NSArray arrayWithObjects:&v28 count:1];
    v29[4] = @"AssetDataPath";
    void v30[3] = v23;
    v30[4] = v10;
    uint64_t v24 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:5];
    uint64_t v25 = sub_10000B688((uint64_t)NSError, 3, v24);
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    goto LABEL_6;
  }
  [*(id *)(a1 + 56) addObject:v6];
LABEL_7:
}

os_log_t sub_10000B48C(char *category)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller.mobileasset", category);

  return v1;
}

id sub_10000B4C0()
{
  if (qword_100015720 != -1) {
    dispatch_once(&qword_100015720, &stru_1000109A8);
  }
  v0 = (void *)qword_100015718;

  return v0;
}

void sub_10000B514(id a1)
{
  qword_100015718 = (uint64_t)os_log_create("com.apple.gamecontroller.mobileasset", "Common");

  _objc_release_x1();
}

id sub_10000B558()
{
  if (qword_100015730 != -1) {
    dispatch_once(&qword_100015730, &stru_1000109C8);
  }
  v0 = (void *)qword_100015728;

  return v0;
}

void sub_10000B5AC(id a1)
{
  qword_100015728 = (uint64_t)os_log_create("com.apple.gamecontroller.mobileasset", "DB");

  _objc_release_x1();
}

id sub_10000B5F0()
{
  if (qword_100015740 != -1) {
    dispatch_once(&qword_100015740, &stru_1000109E8);
  }
  v0 = (void *)qword_100015738;

  return v0;
}

void sub_10000B644(id a1)
{
  qword_100015738 = (uint64_t)os_log_create("com.apple.gamecontroller.mobileasset", "DB.Update");

  _objc_release_x1();
}

id sub_10000B688(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  self;
  id v5 = +[NSError errorWithDomain:@"GCMobileAssetError" code:a2 userInfo:v4];

  return v5;
}

id sub_10000B700(void *a1)
{
  if (a1)
  {
    os_log_t v1 = [a1 userInfo];
    id v2 = objc_msgSend(v1, "gc_objectForKey:ofClass:error:", @"FailingKeyPath", objc_opt_class(), 0);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_10000B778()
{
  sub_1000080F4();
  sub_1000080B0((void *)&_mh_execute_header, v0, v1, "Viable installed assets:", v2, v3, v4, v5, v6);
}

void sub_10000B7AC()
{
  sub_1000080F4();
  sub_1000080B0((void *)&_mh_execute_header, v0, v1, "Found installed assets:", v2, v3, v4, v5, v6);
}

void sub_10000B7E0()
{
  sub_1000080CC();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Pre-installed asset has invalid format: %{public}@", v1, 0xCu);
}

void sub_10000B854()
{
  sub_1000080CC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Download asset: %{public}@", v1, 0xCu);
}

void sub_10000B8C8(id *a1)
{
  uint64_t v1 = [*a1 assetId];
  sub_1000080CC();
  sub_10000815C((void *)&_mh_execute_header, v2, v3, "Failed to refresh state of downloaded asset '%{public}@'.", v4, v5, v6, v7, v8);
}

void sub_10000B950(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) assetId];
  sub_100008124();
  sub_10000813C((void *)&_mh_execute_header, v2, v3, "Download asset '%{public}@' failed with a transient error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10000B9E4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) assetId];
  sub_100008124();
  sub_10000813C((void *)&_mh_execute_header, v2, v3, "Download asset '%{public}@' failed: %{public}@", v4, v5, v6, v7, v8);
}

void sub_10000BA78()
{
  sub_1000080F4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "No available assets.", v1, 2u);
}

void sub_10000BAB8(void *a1)
{
  [a1 count];
  sub_1000080CC();
  sub_10000815C((void *)&_mh_execute_header, v1, v2, "%zi available assets yielded no viable assets.", v3, v4, v5, v6, v7);
}

void sub_10000BB30()
{
  sub_1000080F4();
  sub_1000080B0((void *)&_mh_execute_header, v0, v1, "Candidate assets:", v2, v3, v4, v5, v6);
}

void sub_10000BB64()
{
  sub_1000080CC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Best asset: %{public}@", v1, 0xCu);
}

void sub_10000BBD8()
{
  sub_1000080F4();
  sub_1000080B0((void *)&_mh_execute_header, v0, v1, "Viable assets:", v2, v3, v4, v5, v6);
}

void sub_10000BC0C()
{
  sub_1000080F4();
  sub_1000080B0((void *)&_mh_execute_header, v0, v1, "Found available assets:", v2, v3, v4, v5, v6);
}

void sub_10000BC40()
{
  sub_1000080CC();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Asset has invalid format: %{public}@", v1, 0xCu);
}

void sub_10000BCB4()
{
  sub_1000080F4();
  sub_1000080B0((void *)&_mh_execute_header, v0, v1, "Discover available assets.", v2, v3, v4, v5, v6);
}

void sub_10000BCE8()
{
  sub_1000080CC();
  sub_1000080D8((void *)&_mh_execute_header, v0, v1, "Asset query failed with a transient error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000BD50()
{
  sub_1000080CC();
  sub_1000080D8((void *)&_mh_execute_header, v0, v1, "Asset query failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000BDB8()
{
  sub_1000080F4();
  sub_1000080B0((void *)&_mh_execute_header, v0, v1, "Download catalog.", v2, v3, v4, v5, v6);
}

void sub_10000BDEC()
{
  sub_1000080CC();
  sub_1000080D8((void *)&_mh_execute_header, v0, v1, "Asset catalog download failed with transient error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000BE54()
{
  sub_1000080CC();
  sub_1000080D8((void *)&_mh_execute_header, v0, v1, "Asset catalog download failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000BEBC()
{
  sub_1000080F4();
  sub_1000080B0((void *)&_mh_execute_header, v0, v1, "Check last catalog update.", v2, v3, v4, v5, v6);
}

void sub_10000BEF0()
{
  sub_1000080CC();
  sub_1000080D8((void *)&_mh_execute_header, v0, v1, "Asset query failed with transient error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000BF58()
{
  sub_1000080CC();
  sub_1000080D8((void *)&_mh_execute_header, v0, v1, "Asset query failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000BFC0(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = MAStringForMAQueryReturnTypes();
  sub_1000080CC();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Query assets - types:%{public}@", v4, 0xCu);
}

void sub_10000C054(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = MAStringForMADownloadResult();
  sub_100008100();
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Asset download failed with an error that needs investigation [%ld: %{public}@] %@.", v5, 0x20u);
}

void sub_10000C0F8()
{
  sub_1000080F4();
  sub_1000080B0((void *)&_mh_execute_header, v0, v1, "Asset download cancellation requested.", v2, v3, v4, v5, v6);
}

void sub_10000C12C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = MAStringForMADownloadResult();
  sub_100008100();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Asset catalog download failed with an error that needs investigation [%ld: %{public}@] %@.", v5, 0x20u);
}

void sub_10000C1D0()
{
  sub_1000080F4();
  sub_1000080B0((void *)&_mh_execute_header, v0, v1, "Catalog download cancellation requested.", v2, v3, v4, v5, v6);
}

void sub_10000C204(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2082;
  uint64_t v5 = "com.apple.private.gamecontroller.config.client";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Rejecting connection %@.  Client is missing the '%{public}s' entitlement.", (uint8_t *)&v2, 0x16u);
}

uint64_t MAIsDownloadResultFailure()
{
  return _MAIsDownloadResultFailure();
}

uint64_t MAIsQueryResultFailure()
{
  return _MAIsQueryResultFailure();
}

uint64_t MAStringForMAAssetState()
{
  return _MAStringForMAAssetState();
}

uint64_t MAStringForMACancelDownloadResult()
{
  return _MAStringForMACancelDownloadResult();
}

uint64_t MAStringForMADownloadResult()
{
  return _MAStringForMADownloadResult();
}

uint64_t MAStringForMAQueryResult()
{
  return _MAStringForMAQueryResult();
}

uint64_t MAStringForMAQueryReturnTypes()
{
  return _MAStringForMAQueryReturnTypes();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return [a1 assetId];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return [a1 assetType];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
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

id objc_msgSend_currentSourceVersion(void *a1, const char *a2, ...)
{
  return [a1 currentSourceVersion];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return [a1 refreshState];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startAsynchronously(void *a1, const char *a2, ...)
{
  return [a1 startAsynchronously];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilFinished];
}