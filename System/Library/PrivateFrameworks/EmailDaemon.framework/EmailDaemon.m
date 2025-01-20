void sub_100005A8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100005C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100005C68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retrieveFreeSpaceStatus:0];
}

void sub_100005D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000060E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000061B0(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_10016B6D8;
  qword_10016B6D8 = (uint64_t)v1;
}

void sub_100006220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100006504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  v10 = v9;

  a9.super_class = (Class)AppBadgeController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000066E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 120), 8);

  _Unwind_Resume(a1);
}

void sub_100006740(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v5 badgeSetting] != (id)2)
  {
    if ([v7 isEqualToString:MSUserNotificationCenterTopicVIP])
    {
      uint64_t v6 = *(void *)(a1 + 40);
LABEL_6:
      *(unsigned char *)(*(void *)(v6 + 8) + 24) = 0;
      goto LABEL_7;
    }
    if ([v7 isEqualToString:MSUserNotificationCenterTopicNotifiedThreads])
    {
      uint64_t v6 = *(void *)(a1 + 48);
      goto LABEL_6;
    }
    if ([v7 isEqualToString:MSUserNotificationCenterTopicAllMessages])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else if (([v7 isEqualToString:MSUserNotificationCenterTopicFavoriteMailboxes] & 1) == 0)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
  }
LABEL_7:
}

void sub_100006838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006ADC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  if (v2 != [*(id *)(a1 + 32) oldBadgeCount])
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v3 = *(void **)(*(void *)(a1 + 32) + 88);
    v4 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100006BF4;
    v5[3] = &unk_100139B80;
    objc_copyWeak(v6, &location);
    v6[1] = *(id *)(a1 + 40);
    [v3 setBadgeNumber:v4 withCompletionHandler:v5];

    objc_destroyWeak(v6);
    objc_destroyWeak(&location);
  }
}

void sub_100006BCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);

  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_100006BF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    id v5 = +[AppBadgeController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000BFE98((uint64_t)v3, a1, v5);
    }
  }
  else
  {
    uint64_t v6 = +[AppBadgeController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 134217984;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "updated badge to %ld", (uint8_t *)&v8, 0xCu);
    }

    [WeakRetained setOldBadgeCount:*(void *)(a1 + 40)];
  }
}

void sub_100006D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000750C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100007740(id *a1, void *a2)
{
  id v3 = a2;
  if (![v3 isInboxMailbox]) {
    goto LABEL_3;
  }
  v4 = [a1[4] bucketBarController];
  id v8 = v3;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  unsigned __int8 v6 = [v4 isBucketBarHiddenForMailboxes:v5];

  if ((v6 & 1) == 0) {
    uint64_t v7 = a1 + 5;
  }
  else {
LABEL_3:
  }
    uint64_t v7 = a1 + 6;
  [*v7 addObject:v3];
}

void sub_10000781C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000784C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) focusedAccountIdentifiers];
  id v5 = [v3 account];
  unsigned __int8 v6 = [v5 objectID];
  uint64_t v7 = [v6 representedObjectID];
  id v8 = [v4 containsObject:v7];

  return v8;
}

void sub_1000078E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007CE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100007E24(uint64_t a1)
{
  id v2 = +[AppBadgeController log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Settings changed. Updating query based on current topics", v4, 2u);
  }

  [*(id *)(a1 + 32) setNotificationSettingsByTopic:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _createCountQueryPredicateFromNotificationTopics];
}

void sub_100007F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100007F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100007FAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createCountQueryPredicateFromNotificationTopics];
}

void sub_10000806C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100008090(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return [v2 _createCountQueryPredicateFromNotificationTopics];
}

void sub_100008158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100008168(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createCountQueryPredicateFromNotificationTopics];
}

void sub_1000081F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100008208(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createCountQueryPredicateFromNotificationTopics];
}

void sub_100008490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008550(id a1)
{
  os_log_t v1 = +[NSUserDefaults standardUserDefaults];
  unsigned int v2 = [v1 BOOLForKey:@"AutoFetchDisabled"];

  if (v2)
  {
    id v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Warning fetching disabled (AutoFetchDisabled = YES)", v6, 2u);
    }
  }
  else
  {
    v4 = objc_alloc_init(AutoFetchController);
    id v5 = (void *)qword_10016B6E8;
    qword_10016B6E8 = (uint64_t)v4;
  }
}

void sub_10000861C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000882C(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100008900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008910(uint64_t a1, void *a2)
{
  [a2 update:*(void *)(a1 + 40)];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = MFAutoFetchLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Posting notification %@", buf, 0xCu);
        }

        uint64_t v9 = +[NSNotificationCenter defaultCenter];
        [v9 postNotificationName:v7 object:*(void *)(a1 + 32)];
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v4);
  }
}

void sub_100008AA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008B28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008B8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100008F28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008F60(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) networkController];
  unsigned int v3 = [v2 isFatPipe];

  sub_10000913C();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      unsigned __int8 v6 = [*(id *)(a1 + 40) name];
      int v10 = 138412290;
      long long v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: network up, transitioned to WiFi, closing WWAN connections", (uint8_t *)&v10, 0xCu);
    }
    id v4 = [*(id *)(a1 + 32) activeAccountsToSyncByMailbox];
    [v4 makeObjectsPerformSelector:"releaseAllForcedConnections"];
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = [*(id *)(a1 + 40) name];
      int v10 = 138412290;
      long long v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: network up, transitioned to WWAN", (uint8_t *)&v10, 0xCu);
    }
  }

  id v8 = [*(id *)(a1 + 32) mailboxController];
  [v8 networkConfigurationChanged];

  uint64_t v9 = +[MFDeliveryQueue sharedDeliveryQueue];
  [v9 processQueue];
}

void sub_1000090F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000913C()
{
  if (qword_10016B700 != -1) {
    dispatch_once(&qword_10016B700, &stru_100139EB8);
  }
  v0 = (void *)qword_10016B6F8;

  return v0;
}

void sub_100009264(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) mailboxController];
  unsigned __int8 v3 = [v2 isIdle];

  id v4 = [*(id *)(a1 + 32) activeAccountsToSyncByMailbox];
  [v4 makeObjectsPerformSelector:"releaseAllConnections"];

  if ((v3 & 1) == 0)
  {
    BOOL v5 = sub_10000913C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RNF: triggering autofetch", v7, 2u);
    }

    unsigned __int8 v6 = [*(id *)(a1 + 32) mailboxController];
    [v6 fetchNow:EMFetchTypeStandardMailbox withAccounts:0];
  }
}

void sub_100009340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100009478(id a1, MailAccount *a2)
{
  return +[AutoFetchController shouldSyncAccountByMailbox:a2];
}

void sub_100009528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100009550(id a1, MFMailboxUid *a2)
{
  unsigned int v2 = [(MFMailboxUid *)a2 account];
  BOOL v3 = +[AutoFetchController shouldSyncAccountByMailbox:v2];

  return v3;
}

void sub_10000959C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100009618(id a1, MailAccount *a2)
{
  return !+[AutoFetchController shouldSyncAccountByMailbox:a2];
}

void sub_1000096FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100009900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_10000995C(uint64_t a1, void *a2)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v5 = 138412546;
    long long v14 = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v7);
        uint64_t v9 = *(void *)(a1 + 32);
        v23[0] = @"AutoFetchJobAccount";
        v23[1] = @"AutoFetchJobMailboxUid";
        v24[0] = v9;
        v24[1] = v8;
        v23[2] = @"AutoFetchJobNewMessagesState";
        int v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v14, (void)v15);
        v24[2] = v10;
        long long v11 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];

        long long v12 = MFAutoFetchLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          CFStringRef v20 = @"AutoFetchProcessJobCompletedNotification";
          __int16 v21 = 2112;
          v22 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Posting notification %@ with user info %@", buf, 0x16u);
        }

        long long v13 = +[NSNotificationCenter defaultCenter];
        [v13 postNotificationName:@"AutoFetchProcessJobCompletedNotification" object:*(void *)(a1 + 40) userInfo:v11];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) _updateState:1];
}

void sub_100009B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

MailAccount *__cdecl sub_10000A020(id a1, MFMailboxUid *a2)
{
  unsigned int v2 = [(MFMailboxUid *)a2 account];

  return (MailAccount *)v2;
}

void sub_10000A050(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(a1 + 32);
  id v4 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v6);
        uint64_t v8 = *(void *)(a1 + 40);
        v19[0] = @"AutoFetchJobAccount";
        v19[1] = @"AutoFetchJobMailboxUid";
        v20[0] = v8;
        v20[1] = v7;
        v19[2] = @"AutoFetchDontNotify";
        uint64_t v9 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
        v20[2] = v9;
        v19[3] = @"AutoFetchJobNewMessagesState";
        uint64_t v10 = [v3 objectForKeyedSubscript:v7];
        long long v11 = (void *)v10;
        long long v12 = &off_100145FC0;
        if (v10) {
          long long v12 = (_UNKNOWN **)v10;
        }
        v20[3] = v12;
        long long v13 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

        [*(id *)(a1 + 48) postNotificationName:@"AutoFetchPushCompletedNotification" object:*(void *)(a1 + 56) userInfo:v13];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v4);
  }
}

void sub_10000A218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A66C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A6D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10000A6E8(id a1, MailAccount *a2)
{
  return +[AutoFetchController shouldSyncAccountByMailbox:a2];
}

void sub_10000A764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10000A780(id a1, MailAccount *a2)
{
  return +[AutoFetchController shouldSyncAccountByMailbox:a2];
}

void sub_10000A838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10000A860(id a1, MFMailboxUid *a2)
{
  unsigned int v2 = [(MFMailboxUid *)a2 account];
  BOOL v3 = +[AutoFetchController shouldSyncAccountByMailbox:v2];

  return v3;
}

void sub_10000A8AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A950(id a1)
{
  os_log_t v1 = os_log_create("com.apple.email", "AutoFetchController");
  unsigned int v2 = (void *)qword_10016B6F8;
  qword_10016B6F8 = (uint64_t)v1;
}

void sub_10000A994(void *a1, uint64_t a2)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        uint64_t v8 = +[MFInvocationQueue sharedInvocationQueue];
        uint64_t v9 = +[MFMonitoredInvocation mf_invocationWithSelector:a2 target:v7];
        [v8 addInvocation:v9];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void sub_10000AAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AB98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10000ABB0(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableSet);
  unsigned int v2 = (void *)qword_10016B708;
  qword_10016B708 = (uint64_t)v1;
}

void sub_10000AD24(_Unwind_Exception *a1)
{
  id v4 = v3;
  objc_sync_exit(v4);

  _Unwind_Resume(a1);
}

void sub_10000ADC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  long long v10 = v9;

  a9.super_class = (Class)AutoFetchRequestPrivate;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10000BBE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  _Unwind_Resume(a1);
}

void sub_10000BE80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = +[DaemonAppController sharedController];
  id v4 = [v3 mailboxProvider];
  uint64_t v5 = [v4 mailboxFromLegacyMailbox:*((void *)WeakRetained + 2)];
  uint64_t v6 = [v5 objectID];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v8 = +[MailPersistentStorage sharedStorage];
    uint64_t v9 = [*((id *)WeakRetained + 2) URLString];
    long long v10 = [v8 fetchDateForSource:v9];

    [v7 setObject:v6 forKeyedSubscript:EMActivityMailboxObjectIDKey];
    long long v11 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
    [v7 setObject:v11 forKeyedSubscript:EMActivityFetchStateKey];

    if (v10) {
      [v7 setObject:v10 forKeyedSubscript:EMActivityLastSuccessfulUpdateKey];
    }
    uint64_t v12 = [*((id *)WeakRetained + 11) startActivityOfType:1 userInfo:v7];
    long long v13 = (void *)*((void *)WeakRetained + 10);
    *((void *)WeakRetained + 10) = v12;

    long long v14 = MFAutoFetchLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v15 = (void *)*((void *)WeakRetained + 10);
      long long v16 = [v15 objectID];
      long long v17 = [v16 stringHash];
      int v32 = 134218496;
      id v33 = WeakRetained;
      __int16 v34 = 2048;
      id v35 = v15;
      __int16 v36 = 2048;
      id v37 = [v17 int64Value];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%p Current #Activity %p (hash: %llx): Starting New Activity", (uint8_t *)&v32, 0x20u);
    }
    long long v18 = MFAutoFetchLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)*((void *)WeakRetained + 1);
      CFStringRef v20 = (void *)*((void *)WeakRetained + 2);
      uint64_t v21 = *((void *)WeakRetained + 3);
      uint64_t v22 = *((void *)WeakRetained + 4);
      int v32 = 134219010;
      id v33 = WeakRetained;
      __int16 v34 = 2112;
      id v35 = v19;
      __int16 v36 = 2112;
      id v37 = v20;
      __int16 v38 = 2112;
      uint64_t v39 = v21;
      __int16 v40 = 2112;
      uint64_t v41 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%p Remote '%@', mailbox '%@', store '%@', key '%@'", (uint8_t *)&v32, 0x34u);
    }

    v23 = MFAutoFetchLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v6, "ef_publicDescription");
      int v32 = 138543618;
      id v33 = v24;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Updated last updated time for mailbox object ID %{public}@ with %@", (uint8_t *)&v32, 0x16u);
    }
    v25 = EFFetchSignpostLog();
    v26 = v25;
    os_signpost_id_t v27 = *((void *)WeakRetained + 12);
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      v28 = (void *)*((void *)WeakRetained + 10);
      v29 = [v28 objectID];
      v30 = [v29 stringHash];
      id v31 = [v30 int64Value];
      int v32 = 134349312;
      id v33 = v28;
      __int16 v34 = 2050;
      id v35 = v31;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, v27, "AutoFetchRequest", "activity=%{signpost.description:attribute,public}p hash=%{signpost.description:attribute,public}llx", (uint8_t *)&v32, 0x16u);
    }
  }
}

void sub_10000C254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000C5D0(uint64_t a1, int a2)
{
  id v4 = EFFetchSignpostLog();
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v8[0] = 67240192;
    v8[1] = a2;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "AutoFetchHeal", "success=%{signpost.description:attribute,public}d", (uint8_t *)v8, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000C8CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CAD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CE2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000D4B0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_10000D4C8(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void sub_10000DAEC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000DC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DD5C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  unsigned int v2 = (void *)qword_10016B718;
  qword_10016B718 = (uint64_t)v1;
}

void sub_10000DDCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E2E0(id a1, OS_xpc_object *a2)
{
  xdict = a2;
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_DELAY, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRES_CLASS_A, 0);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRES_CLASS_B, 0);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRES_CLASS_C, 0);
}

void sub_10000E3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E400(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[34] resetSendLaterAlarmIfNeeded];
  os_log_t v1 = [WeakRetained[4] remindMeNotificationController];
  [v1 resetRemindMeAlarmIfNeeded];
}

void sub_10000E468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E5A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v18);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000EF78(id a1, BOOL a2)
{
  if (a2) {
    uint64_t v2 = 32;
  }
  else {
    uint64_t v2 = 0;
  }
  +[PrivacyProxyClient setTrafficState:32 proxyTraffic:v2 queue:0 completionHandler:0];
}

void sub_10000EF9C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained[26] beginSyncing];
  }
}

void sub_10000EFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F004()
{
  long long v13 = +[MailAccount activeAccounts];
  id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v0 = v13;
  id v1 = [v0 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v1)
  {
    uint64_t v2 = *(void *)v16;
    do
    {
      id v3 = 0;
      do
      {
        if (*(void *)v16 != v2) {
          objc_enumerationMutation(v0);
        }
        uint64_t v4 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v3);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v14 addObject:v4];
        }
        id v3 = (char *)v3 + 1;
      }
      while (v1 != v3);
      id v1 = [v0 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v1);
  }

  if ([v14 count])
  {
    id v5 = v14;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v9);
          long long v11 = +[MFInvocationQueue sharedInvocationQueue];
          uint64_t v12 = +[MFMonitoredInvocation mf_invocationWithSelector:"startListeningForNotifications" target:v10];
          [v11 addInvocation:v12];

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }
  }
}

void sub_10000F254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)DaemonAppController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10000F444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F45C(id a1)
{
  id v1 = +[DaemonAppController log];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "bye bye!", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_10000F730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F808(uint64_t a1)
{
  uint64_t v2 = MFUserAgent();
  id v3 = *(void **)(a1 + 32);

  if (v2 != v3)
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"DaemonAppController.m", 457, @"Invalid parameter not satisfying: %@", @"MFUserAgent() == self" object file lineNumber description];
  }
  id v4 = +[MailXPCServices sharedServer];
  [v4 registerServiceClass:objc_opt_class()];
  [v4 registerServiceClass:objc_opt_class()];
  [v4 registerServiceClass:objc_opt_class()];
  sub_100051144(v4);
  sub_100062C74(v4);
  [v4 start];
}

void sub_10000F920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FB60(void *a1)
{
  id v3 = a1;
  id v1 = +[BGSystemTaskScheduler sharedScheduler];
  [v1 registerForTaskWithIdentifier:v3 usingQueue:0 launchHandler:&stru_10013A1A0];

  uint64_t v2 = +[BGSystemTaskScheduler sharedScheduler];
  [v2 deregisterTaskWithIdentifier:v3];
}

void sub_10000FBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FCBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FD68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FFB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000101F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100010214(uint64_t a1)
{
  [*(id *)(a1 + 32) _delayedStartupTasks];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 invalidate];
}

void sub_100010678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001082C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  long long v17 = v16;

  _Unwind_Resume(a1);
}

void sub_100010864(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = +[DaemonAppController log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000C013C((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void sub_1000108C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000108D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[DaemonAppController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000C01A8((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    uint64_t v4 = +[DaemonAppController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing app succeeded", v11, 2u);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100010990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100010B30(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:MSUserNotificationCenterTopicVIP];
  if ([v3 alertSetting] != (id)2 && objc_msgSend(v3, "notificationCenterSetting") != (id)2) {
    [v3 lockScreenSetting];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100010BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)(v20 - 88));
  _Unwind_Resume(a1);
}

void sub_100010F14(uint64_t a1, char a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if ((a2 & 1) != 0 || a3)
  {
    uint64_t v8 = +[DaemonAppController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C0214(a2, a3, v8);
    }

    uint64_t v7 = [v6 snapshotInvalidator];
    [v7 setEnabled:0];
  }
  else
  {
    uint64_t v7 = [WeakRetained snapshotInvalidator];
    [v7 setEnabled:1];
  }
}

void sub_100010FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = +[EDClientState sharedInstance];
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, [v5 isRunningTests], a3);
}

void sub_10001105C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100011070(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  id v5 = v3;
  if (v3)
  {
    [v3 BOOLValue];
  }
  else
  {
    uint64_t v4 = +[EDClientState sharedInstance];
    [v4 isRunningTests];
  }
  +[EMInternalPreferences preferenceEnabled:14];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100011128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000111E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100011298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000112A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[DaemonAppController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C02A4((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    id v14 = +[NSUserDefaults em_userDefaults];
    uint64_t v15 = kBlackPearlCategorizationVersion;
    v25 = v14;
    v24 = [v14 objectForKey:kBlackPearlCategorizationVersion];
    v23 = off_100169610();
    long long v16 = [v5 objectForKey:v23];
    long long v17 = off_100169618();
    long long v18 = [v5 objectForKey:v17];
    long long v19 = off_100169620();
    uint64_t v20 = [v5 objectForKey:v19];
    long long v21 = +[NSString stringWithFormat:@"%@.%@.%@", v16, v18, v20];

    long long v22 = [*(id *)(a1 + 32) categorySubsystem];
    [v22 recategorizeAllMessagesIfModelVersionChangedFrom:v24 to:v21];

    [v25 setObject:v21 forKey:v15];
  }
}

void sub_100011478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

Class sub_1000118A0()
{
  if (qword_10016B760 != -1) {
    dispatch_once(&qword_10016B760, &stru_10013A1C0);
  }
  Class result = objc_getClass("MCCSecretAgentController");
  qword_10016B750 = (uint64_t)result;
  off_100169608 = (uint64_t (*)())sub_100011904;
  return result;
}

id sub_100011904()
{
  return (id)qword_10016B750;
}

void sub_100011910(id a1)
{
  qword_10016B758 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/icloudMCCKit.framework/icloudMCCKit", 2);
  if (!qword_10016B758) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/icloudMCCKit.framework/icloudMCCKit");
  }
}

id sub_10001194C()
{
  if (qword_10016B760 != -1) {
    dispatch_once(&qword_10016B760, &stru_10013A1C0);
  }
  id v0 = (id *)dlsym((void *)qword_10016B758, "kBPCategorizationMajorVersionKey");
  objc_storeStrong((id *)&qword_10016B738, *v0);
  off_100169610 = (uint64_t (*)())sub_1000119E0;
  id v1 = (void *)qword_10016B738;

  return v1;
}

id sub_1000119E0()
{
  return (id)qword_10016B738;
}

id sub_1000119EC()
{
  if (qword_10016B760 != -1) {
    dispatch_once(&qword_10016B760, &stru_10013A1C0);
  }
  id v0 = (id *)dlsym((void *)qword_10016B758, "kBPCategorizationMinorVersionKey");
  objc_storeStrong((id *)&qword_10016B740, *v0);
  off_100169618 = (uint64_t (*)())sub_100011A80;
  id v1 = (void *)qword_10016B740;

  return v1;
}

id sub_100011A80()
{
  return (id)qword_10016B740;
}

id sub_100011A8C()
{
  if (qword_10016B760 != -1) {
    dispatch_once(&qword_10016B760, &stru_10013A1C0);
  }
  id v0 = (id *)dlsym((void *)qword_10016B758, "kBPCategorizationPatchVersionKey");
  objc_storeStrong((id *)&qword_10016B748, *v0);
  off_100169620 = (uint64_t (*)())sub_100011B20;
  id v1 = (void *)qword_10016B748;

  return v1;
}

id sub_100011B20()
{
  return (id)qword_10016B748;
}

void sub_100011B2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100011BE8(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_10016B768;
  qword_10016B768 = (uint64_t)v1;
}

void sub_100011C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100011E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100011E9C(uint64_t a1)
{
  sub_100011ED8(*(id **)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 registerAccountChangeHookResponder:v3];
}

void sub_100011ED8(id *a1)
{
  if (a1)
  {
    uint64_t v2 = +[DaemonFetchController log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "initializing fetching", buf, 2u);
    }

    uint64_t v3 = +[AutoFetchController sharedController];
    [v3 setDataSource:a1];

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, a1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100012098;
    handler[3] = &unk_100139F90;
    objc_copyWeak(&v6, (id *)buf);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, handler);
    sub_100012424(a1);
    sub_1000124F4((uint64_t)a1);
    [a1[9] schedule];
    uint64_t v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:a1 selector:"_autoFetchProcessFinished:" name:@"AutoFetchProcessFinishedNotification" object:0];

    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void sub_10001205C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012098(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v3 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(xdict, _xpc_event_key_name)];
  if ([v3 isEqualToString:@"PCPreferencesDidChangeNotification"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    sub_10001222C((uint64_t)WeakRetained);
LABEL_12:

    goto LABEL_13;
  }
  if ([v3 isEqualToString:@"com.apple.mobilemail.afc.poll"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained performFetchOfType:sub_10001233C((uint64_t)WeakRetained, 1)];
    goto LABEL_12;
  }
  if ([v3 isEqualToString:@"com.apple.exchangesyncd.ping"])
  {
    id WeakRetained = +[DaemonFetchController log];
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    __int16 v8 = 0;
    id v5 = "received ping notification from exchangesyncd";
    id v6 = (uint8_t *)&v8;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    goto LABEL_12;
  }
  if ([v3 isEqualToString:@"MFNanoMailImportantBridgeSettingHasChangedDarwinNotification"])
  {
    id WeakRetained = +[DaemonFetchController log];
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    __int16 v7 = 0;
    id v5 = "received notification about important NanoMail Bridge setting change";
    id v6 = (uint8_t *)&v7;
    goto LABEL_11;
  }
LABEL_13:
}

void sub_100012208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001222C(uint64_t a1)
{
  if (a1)
  {
    sub_100012D8C(a1);
    uint64_t v2 = *(id *)(a1 + 96);
    dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v2);
    uint64_t v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v3;

    id v5 = *(NSObject **)(a1 + 8);
    dispatch_time_t v6 = dispatch_time(0, 200000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    __int16 v7 = *(NSObject **)(a1 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100012DEC;
    handler[3] = &unk_100139C48;
    void handler[4] = a1;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(*(dispatch_object_t *)(a1 + 8));
  }
}

uint64_t sub_10001233C(uint64_t a1, int a2)
{
  if (!a1) {
    return 0;
  }
  if (a2 == 1)
  {
    dispatch_source_t v3 = +[MFPowerController sharedInstance];
    unsigned __int8 v4 = [v3 isPluggedIn];
    uint64_t v5 = EMFetchTypeScheduled;
    if (v4)
    {
      dispatch_time_t v6 = +[MFNetworkController sharedInstance];
      unsigned int v7 = [v6 isFatPipe];

      if (v7) {
        return v5 | 0x80;
      }
      else {
        return v5;
      }
    }
    else
    {
    }
  }
  else
  {
    if (a2 == 3)
    {
      uint64_t v2 = (unsigned int *)&EMFetchTypeCompacting;
    }
    else
    {
      if (a2 != 2) {
        sub_1000C0310();
      }
      uint64_t v2 = (unsigned int *)&EMFetchTypePowerNap;
    }
    return *v2;
  }
  return v5;
}

void sub_100012408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100012424(id result)
{
  if (result)
  {
    os_log_t v1 = result;
    uint64_t v2 = +[DaemonFetchController log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating push state.", buf, 2u);
    }

    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100012E28;
    v3[3] = &unk_10013A1E8;
    v3[4] = v1;
    return [v1 resetPushStateWithCompletion:v3];
  }
  return result;
}

void sub_1000124F4(uint64_t a1)
{
  if (a1)
  {
    double v2 = sub_10001264C(a1);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    [*(id *)(a1 + 56) interval];
    if (v3 == v2)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = *(id *)(a1 + 56);
      unsigned __int8 v4 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;
    }
    if (*(void *)(a1 + 56))
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [[FetchXPCActivityScheduler alloc] initWithType:2 interval:a1 delegate:v2];
      objc_storeStrong((id *)(a1 + 56), v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    [v6 unregisterAndTearDown];
    [(FetchXPCActivityScheduler *)v5 schedule];
  }
}

void sub_100012618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);

  _Unwind_Resume(a1);
}

double sub_10001264C(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  os_log_t v1 = +[NSUserDefaults em_userDefaults];
  double v2 = [v1 objectForKey:@"PowerNapFetchesInterval"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v3 = (double)(uint64_t)[v2 integerValue];
  }
  else {
    double v3 = 7200.0;
  }

  return v3;
}

void sub_1000126EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012708(uint64_t a1)
{
  if (a1)
  {
    double v2 = +[DaemonFetchController log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Canceling periodic fetches.", v5, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    id v3 = *(id *)(a1 + 64);
    unsigned __int8 v4 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    if (v3) {
      [v3 unregisterAndTearDown];
    }
    else {
      +[FetchXPCActivityScheduler unregisterXPCActivityForType:1];
    }
  }
}

void sub_1000127EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1000127FC(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"MailPCPollIntervalOverride", kCFPreferencesAnyApplication, 0);
  if (AppIntegerValue < 1) {
    return (double)*(int *)(a1 + 20);
  }
  uint64_t v3 = AppIntegerValue;
  unsigned __int8 v4 = +[DaemonFetchController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000C033C(v3, v4);
  }

  return (double)v3;
}

void sub_1000128A0(uint64_t a1)
{
  if (a1)
  {
    double v2 = sub_1000127FC(a1);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    [*(id *)(a1 + 64) interval];
    if (v3 == v2)
    {
      id v4 = 0;
    }
    else
    {
      id v4 = *(id *)(a1 + 64);
      uint64_t v5 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;
    }
    if (*(void *)(a1 + 64))
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [[FetchXPCActivityScheduler alloc] initWithType:1 interval:a1 delegate:v2];
      objc_storeStrong((id *)(a1 + 64), v6);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    [v4 unregisterAndTearDown];
    dispatch_time_t v7 = dispatch_time(0, 500000000);
    __int16 v8 = *(NSObject **)(a1 + 96);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100012A54;
    v10[3] = &unk_100139C20;
    v10[4] = a1;
    uint64_t v11 = v6;
    uint64_t v9 = v6;
    dispatch_after(v7, v8, v10);
  }
}

void sub_100012A24(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_100012A54(uint64_t a1)
{
}

void sub_100012A60(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (a1)
  {
    double v3 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    id v4 = *(id *)(a1 + 64);
    os_unfair_lock_unlock(v3);
    if (v4 == v5) {
      [v5 schedule];
    }
  }
}

void sub_100012AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012D50(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_100012D8C(uint64_t a1)
{
  if (a1)
  {
    double v2 = *(NSObject **)(a1 + 8);
    if (v2)
    {
      dispatch_source_cancel(v2);
      double v3 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = 0;
    }
  }
}

void sub_100012DEC(uint64_t a1)
{
  sub_100012424(*(id *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);

  sub_100012D8C(v2);
}

void sub_100012E28(uint64_t a1, char a2, int a3, int a4, void *a5)
{
  id v9 = a5;
  if (a2)
  {
    uint64_t v10 = +[DaemonFetchController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 67109376;
      v15[1] = a3;
      __int16 v16 = 1024;
      int v17 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "resetPushState: success (schedulePeriodicFetches: %{BOOL}d, pollInterval: %d)", (uint8_t *)v15, 0xEu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 16) = a3;
    *(_DWORD *)(*(void *)(a1 + 32) + 20) = a4;
    if (a3)
    {
      uint64_t v11 = +[DaemonFetchController log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Detected at least one non-manual account: starting periodic fetches.", (uint8_t *)v15, 2u);
      }

      sub_1000128A0(*(void *)(a1 + 32));
    }
    else
    {
      id v14 = +[DaemonFetchController log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "All accounts are manual: stopping periodic fetches.", (uint8_t *)v15, 2u);
      }

      sub_100012708(*(void *)(a1 + 32));
    }
  }
  else
  {
    uint64_t v12 = +[DaemonFetchController log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(v9, "ef_publicDescription");
      sub_1000C03F8(v13, (uint8_t *)v15, v12);
    }
  }
}

void sub_100013008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000131D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100013200(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = [v2 isActive];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

void sub_10001325C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001326C(uint64_t a1)
{
  id v2 = +[AutoFetchController sharedController];
  [v2 fetchNow:EMFetchTypeStandardMailbox withAccounts:*(void *)(a1 + 32)];
}

void sub_1000132D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001333C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

double sub_100013440(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  os_log_t v1 = +[NSUserDefaults em_userDefaults];
  double v2 = (double)(uint64_t)[v1 integerForKey:@"DelayFetchOTCInterval"];

  return v2;
}

void sub_10001349C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000134AC(id a1)
{
  id v1 = +[AutoFetchController sharedController];
  [v1 fetchNow:EMFetchTypeResume];
}

void sub_100013508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_1000135B4(id a1, NSString *a2)
{
  double v2 = +[MailAccount accountWithUniqueId:a2];

  return v2;
}

void sub_1000135FC(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v7 = a3;
  __int16 v8 = v7;
  if (a1)
  {
    id v9 = objc_msgSend(v7, "ef_compactMap:", &stru_10013A2C8);
    if ([v9 count])
    {
      uint64_t v10 = +[DaemonFetchController log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        int v21 = a2;
        __int16 v22 = 1024;
        int v23 = a4;
        __int16 v24 = 2112;
        v25 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "performFetchOfType:%i (%{BOOL}d), uids for %@", buf, 0x18u);
      }

      uint64_t v11 = +[AutoFetchController sharedController];
      [v11 fetchNow:a2 withMailboxes:v9];
    }
    else
    {
      uint64_t v12 = +[DaemonFetchController log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        int v21 = a2;
        __int16 v22 = 1024;
        int v23 = a4;
        __int16 v24 = 2112;
        v25 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "performFetchOfType:%i (%{BOOL}d) failed to find uids for %@", buf, 0x18u);
      }

      if (!a4) {
        goto LABEL_13;
      }
      uint64_t v13 = +[DaemonFetchController log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1000C0450(v13);
      }

      dispatch_time_t v14 = dispatch_time(0, 1000000000);
      uint64_t v15 = *(NSObject **)(a1 + 96);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100013930;
      block[3] = &unk_10013A2F0;
      int v19 = a2;
      id v17 = v8;
      uint64_t v18 = a1;
      dispatch_after(v14, v15, block);
      uint64_t v11 = v17;
    }

LABEL_13:
  }
}

void sub_100013860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001389C(id a1, EMMailboxObjectID *a2)
{
  double v2 = [(EMMailboxObjectID *)a2 url];
  unsigned __int8 v3 = [v2 absoluteString];
  id v4 = +[MailAccount mailboxUidFromActiveAccountsForURL:v3];

  return v4;
}

void sub_100013914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100013930(uint64_t a1)
{
  double v2 = +[DaemonFetchController log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000C0494(a1, v2);
  }

  return sub_1000135FC(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32), 0);
}

void sub_100013A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100013A6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100013C78(id a1, EMMailboxObjectID *a2)
{
  double v2 = [(EMMailboxObjectID *)a2 url];
  unsigned __int8 v3 = [v2 absoluteString];
  id v4 = +[MailAccount mailboxUidFromActiveAccountsForURL:v3];

  return v4;
}

void sub_100013CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013F54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001403C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  double v2 = (void *)qword_10016B778;
  qword_10016B778 = (uint64_t)v1;
}

void sub_1000140AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000141EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100014594(uint64_t a1, void *a2)
{
  id v3 = [a2 clientConnection];
  id v4 = EFBundleIdentifierForXPCConnection();
  id v5 = [*(id *)(a1 + 32) applicationBundleID];
  id v6 = [v4 isEqualToString:v5];

  return v6;
}

void sub_100014608(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000146B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001475C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100014800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100014970(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  double v2 = (void *)qword_10016B788;
  qword_10016B788 = (uint64_t)v1;
}

void sub_1000149E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100014A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014C60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000150E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000152CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015384(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10001544C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001574C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000158E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000159FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015B38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000160B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001619C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001654C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000166B0(void *a1)
{
  id v1 = a1;
  if (qword_10016B7A0 != -1) {
    dispatch_once(&qword_10016B7A0, &stru_10013A380);
  }
  double v2 = [(id)qword_10016B798 objectForKey:v1];
  if (!v2)
  {
    double v2 = [v1 uniqueID];
    [(id)qword_10016B798 setObject:v2 forKey:v1];
  }

  return v2;
}

void sub_100016760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001692C(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100016BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001707C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000170E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000173F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001742C()
{
  if (qword_10016B7B0 != -1) {
    dispatch_once(&qword_10016B7B0, &stru_10013A3A0);
  }
  id v0 = (void *)qword_10016B7A8;

  return v0;
}

void sub_100017480(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) account];
  double v2 = +[NSSet setWithObject:*(void *)(a1 + 40)];
  [v3 changePushedMailboxUidsAdded:v2 deleted:0];
}

void sub_1000174F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001765C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017698(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) account];
  double v2 = +[NSSet setWithObject:*(void *)(a1 + 40)];
  [v3 changePushedMailboxUidsAdded:0 deleted:v2];
}

void sub_100017710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001781C(uint64_t a1)
{
  id v3 = +[NSNotificationCenter defaultCenter];
  double v2 = [*(id *)(a1 + 32) account];
  [v3 postNotificationName:@"MailApplicationAccountFavoritesDidChange" object:v2];
}

void sub_100017898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100017A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017DA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000180F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000181B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000183C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000184F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018B38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)FavoriteItem_SharedMailbox;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100018DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000191A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001959C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000197E0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100019944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019EF8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100019FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A354(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10001A570(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A580(id a1)
{
  uint64_t v1 = +[NSMapTable mapTableWithKeyOptions:517 valueOptions:0];
  double v2 = (void *)qword_10016B798;
  qword_10016B798 = v1;
}

void sub_10001A5C8(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.mobilemail.pushStatusUpdates", v3);
  double v2 = (void *)qword_10016B7A8;
  qword_10016B7A8 = (uint64_t)v1;
}

void *sub_10001A62C(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)FavoritesCollection;
  id v3 = objc_msgSendSuper2(&v6, "init");
  id v4 = v3;
  if (v3)
  {
    v3[1] = a2;
    sub_10001A6B8((uint64_t)v3, a2);
  }
  return v4;
}

void sub_10001A6A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A6B8(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = objc_alloc((Class)EFLocked);
    id v7 = [[FavoritesCollectionState alloc] initWithType:a2];
    id v5 = objc_msgSend(v4, "initWithObject:");
    objc_super v6 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v5;
  }
}

void sub_10001A758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001A9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10001AB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001AF98(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001AFA8(uint64_t a1)
{
}

void sub_10001AFB0(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 dictionaryRepresentations];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001B010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001B150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_10001B180(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 orderedAccountIds];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001B1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001B2A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B2B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 isEditing];
}

void sub_10001B30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001B394(uint64_t a1, void *a2)
{
  id v5 = a2;
  unsigned int v3 = [v5 isEditing];
  int v4 = *(unsigned __int8 *)(a1 + 32);
  if (v4 != v3)
  {
    [v5 setEditing:v4 != 0];
    [v5 invalidateVisibleItems];
  }
}

void sub_10001B400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001B4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10001B514(uint64_t a1, void *a2)
{
  return [a2 setItems:*(void *)(a1 + 32)];
}

void sub_10001B534(id a1, FavoritesCollectionState *a2)
{
}

void sub_10001B66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B6A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 addItem:*(void *)(a1 + 32) ordered:*(unsigned __int8 *)(a1 + 48)];
}

void sub_10001B6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001B710(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    [v3 wasAddedToCollection:a1];
    [a1 invalidateVisibleItems];
  }
}

void sub_10001B76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001B86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B894(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 addExpandedItem:*(void *)(a1 + 32)];
}

void sub_10001B8EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001BAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  id v18 = va_arg(va1, id);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_10001BB28(void *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 addOrUpdateItem:a1[4] didAdd:*(void *)(a1[6] + 8) + 24 didReplace:*(void *)(a1[7] + 8) + 24];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001BBA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001BD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  id v19 = va_arg(va1, id);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);

  _Unwind_Resume(a1);
}

void sub_10001BD70(void *a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 addOrUpdateExpandedItem:a1[4] didAdd:*(void *)(a1[6] + 8) + 24 didReplace:*(void *)(a1[7] + 8) + 24];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001BDE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001BF2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_10001C0E8(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 removeItem:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001C14C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C160(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    [v3 wasRemovedFromCollecion:a1];
    [a1 invalidateVisibleItems];
  }
}

void sub_10001C1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_10001C330(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 removeExpandedItem:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001C394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_10001C534(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 removeItemWithSyncKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001C598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_10001C70C(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 itemWithSyncKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001C770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001C874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_10001C894(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 items];
  id v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10001C900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001CA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_10001CA30(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 expandedItems];
  id v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10001CA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001CBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_10001CBCC(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 visibleItems];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001CC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001CD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_10001CD50(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 selectedItems];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10001CDB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL sub_10001CE44(uint64_t a1, void *a2)
{
  return [a2 type] == *(id *)(a1 + 32);
}

id *sub_10001CE78(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = sub_10001AF98;
    uint64_t v13 = sub_10001AFA8;
    id v14 = 0;
    id v4 = a1[4];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    id v6[2] = sub_10001D6A8;
    v6[3] = &unk_10013A650;
    __int16 v8 = &v9;
    id v7 = v3;
    [v4 performWhileLocked:v6];

    a1 = (id *)(id)v10[5];
    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

void sub_10001CFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

id sub_10001D054(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(id *)(a1 + 32)) {
    id v4 = [v3 isVisible];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

void sub_10001D0A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001D180(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 displayName];
  LOBYTE(v4) = objc_msgSend(v4, "ef_caseInsensitiveIsEqualToString:", v5);

  if (v4)
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = [v3 representingMailbox];
    __int16 v8 = +[MFMailboxUid specialNameForType:](MFMailboxUid, "specialNameForType:", [v7 mailboxType]);

    if (v8) {
      uint64_t v6 = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "ef_caseInsensitiveIsEqualToString:", v8);
    }
    else {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

void sub_10001D23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_10001D26C(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = sub_10001AF98;
    uint64_t v13 = sub_10001AFA8;
    id v14 = (id)0xAAAAAAAAAAAAAAAALL;
    id v14 = objc_alloc_init((Class)NSMutableArray);
    id v4 = a1[4];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    id v6[2] = sub_10001D73C;
    v6[3] = &unk_10013A678;
    id v7 = v3;
    __int16 v8 = &v9;
    [v4 performWhileLocked:v6];

    a1 = (id *)(id)v10[5];
    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

void sub_10001D3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_10001D48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001D4A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 displayName];
  unsigned __int8 v5 = [v4 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = [v3 representingMailbox];
    __int16 v8 = +[MFMailboxUid specialNameForType:](MFMailboxUid, "specialNameForType:", [v7 mailboxType]);

    if (v8) {
      uint64_t v6 = (uint64_t)[v8 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];
    }
    else {
      uint64_t v6 = 0;
    }
  }
  return v6;
}

void sub_10001D558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10001D650(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [a2 itemURLString];
  id v4 = [v2 containsObject:v3];

  return v4;
}

void sub_10001D698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001D6A8(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 items];
  uint64_t v4 = objc_msgSend(v3, "ef_filter:", *(void *)(a1 + 32));
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10001D71C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001D73C(uint64_t a1, void *a2)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [a2 items];
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v6);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
        }
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        __int16 v8 = objc_msgSend(v7, "subItems", 0);
        id v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v14;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v14 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v11);
              if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
                [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v12];
              }
              uint64_t v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            id v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v9);
        }

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v6 != v4);
      id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

void sub_10001D920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001DA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_10001DA88(uint64_t a1, void *a2)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [a2 items];
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
        long long v14 = 0u;
        long long v15 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        __int16 v8 = objc_msgSend(v7, "subItems", 0);
        id v9 = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v13;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v13 != v10) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:*(void *)(*((void *)&v12 + 1) + 8 * (void)j)];
            }
            id v9 = [v8 countByEnumeratingWithState:&v12 objects:v20 count:16];
          }
          while (v9);
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }
}

void sub_10001DC38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001DC78(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    goto LABEL_6;
  }
  if (a2 == 3)
  {
    double v2 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v3 = [v2 localizedStringForKey:@"ACCOUNTS" value:&stru_10013ED08 table:@"Main"];
    goto LABEL_9;
  }
  if (a2 == 2)
  {
    double v2 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v3 = [v2 localizedStringForKey:@"__OUTBOX__" value:&stru_10013ED08 table:@"Main"];
    goto LABEL_9;
  }
  if (a2 != 1)
  {
LABEL_6:
    id v4 = 0;
    goto LABEL_10;
  }
  double v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"INBOXES" value:&stru_10013ED08 table:@"Main"];
LABEL_9:
  id v4 = (void *)v3;

LABEL_10:

  return v4;
}

void sub_10001DD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001DF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001DFDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 countOfVisibleItems];
}

void sub_10001E030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001E0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001E334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E444(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  double v2 = (void *)qword_10016B7B8;
  qword_10016B7B8 = (uint64_t)v1;
}

void sub_10001E4B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001E578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001E9F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001ECC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001ED40()
{
}

void sub_10001ED9C(id a1)
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:4];
  double v2 = (void *)qword_10016B7C8;
  qword_10016B7C8 = v1;
}

void sub_10001EF7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001EFC0(id a1)
{
  uint64_t v1 = +[FavoriteItem itemForUnifiedMailboxWithType:7 selected:0];
  double v2 = (void *)qword_10016B7D8;
  qword_10016B7D8 = v1;
}

void sub_10001F0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10001F120(uint64_t a1, void *a2)
{
  id v3 = [a2 syncKey];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_10001F164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F27C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F3C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001F648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001F980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001FB68(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10001FBBC()
{
}

void sub_10001FE54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100020028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000200E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000200F0(id a1, FavoriteItem *a2)
{
  double v2 = a2;
  if ([(FavoriteItem *)v2 isVisible]) {
    unsigned __int8 v3 = [(FavoriteItem *)v2 isSelected];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

void sub_100020138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000202C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000203C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000204AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v13 = v12;

  _Unwind_Resume(a1);
}

void sub_100020534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100020544(id a1, FavoriteItem *a2)
{
  return [(FavoriteItem *)a2 isVisible];
}

id sub_1000205F8()
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002069C;
  block[3] = &unk_100139B30;
  void block[4] = self;
  if (qword_10016B7F0 != -1) {
    dispatch_once(&qword_10016B7F0, block);
  }
  id v0 = (void *)qword_10016B7E8;

  return v0;
}

void sub_10002069C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.mobilemail", (const char *)[v3 UTF8String]);
  double v2 = (void *)qword_10016B7E8;
  qword_10016B7E8 = (uint64_t)v1;
}

void sub_10002070C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100020D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  _Unwind_Resume(a1);
}

void sub_100020E08(uint64_t a1)
{
  if (!a1) {
    return;
  }
  [*(id *)(a1 + 120) lock];
  double v2 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = 0;

  id v3 = *(id *)(a1 + 104);
  *(unsigned char *)(a1 + 10) = [v3 isDisplayingMultipleAccounts] ^ 1;

  id v4 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;

  id v46 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:*(void *)(a1 + 32)];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  id v48 = [objc_alloc((Class)NSMutableString) initWithString:@"_reload"];
  if (!v46)
  {
    __int16 v8 = sub_1000205F8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      long long v15 = __error();
      long long v16 = strerror(*v15);
      sub_1000C06FC((uint64_t)v16, buf, v14, v8);
    }
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = [v46 objectForKeyedSubscript:@"version"];

  if (!v6)
  {
    long long v17 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = [v46 objectForKeyedSubscript:@"collections"];
  if (!*(void *)(a1 + 24))
  {
    __int16 v8 = [v46 objectForKeyedSubscript:@"lastSelectedItem"];
    if (v8)
    {
      uint64_t v9 = +[FavoriteItem itemFromDictionary:v8];
      uint64_t v10 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v9;

      uint64_t v11 = sub_1000205F8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        long long v12 = *(void **)(a1 + 24);
        long long v13 = [v12 displayName];
        *(_DWORD *)buf = 134218242;
        v70 = v12;
        __int16 v71 = 2112;
        v72 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Loaded _lastSelectedItem : <%p> %@", buf, 0x16u);
      }
    }
LABEL_12:
  }
  long long v17 = (void *)v7;
LABEL_15:
  v47 = v17;
  if ([v17 count])
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id obj = v47;
    id v18 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v60;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v60 != v19) {
            objc_enumerationMutation(obj);
          }
          int v21 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          __int16 v22 = [[FavoritesCollection alloc] initWithDictionary:v21];
          if (_os_feature_enabled_impl())
          {
            int v23 = [v21 objectForKeyedSubscript:@"expandedItems"];
            [(FavoritesCollection *)v22 addExpandedItemsFromDictionaryRepresentations:v23];
          }
          [*(id *)(a1 + 16) addObject:v22];
        }
        id v18 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v18);
    }

    __int16 v24 = +[NSMutableArray array];
    v25 = +[NSMutableArray array];
    v26 = +[MailAccount mailAccounts];
    os_signpost_id_t v27 = objc_msgSend(v26, "ef_filter:", &stru_10013A7C0);

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v28 = v27;
    id v29 = [v28 countByEnumeratingWithState:&v55 objects:v67 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v56;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v56 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(void *)(*((void *)&v55 + 1) + 8 * (void)j);
          id v33 = +[FavoriteItem itemForAccount:v32];
          [v24 addObject:v33];

          __int16 v34 = +[FavoriteItem itemForInboxWithAccount:v32 selected:1];
          [v25 addObject:v34];
        }
        id v29 = [v28 countByEnumeratingWithState:&v55 objects:v67 count:16];
      }
      while (v29);
    }

    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100022204;
    v52[3] = &unk_10013A810;
    v54 = &v63;
    id v35 = v48;
    id v53 = v35;
    __int16 v36 = objc_retainBlock(v52);
    id v37 = [(id)a1 mailboxesCollection];
    uint64_t v38 = objc_opt_class();
    ((void (*)(void *, void *, void *, uint64_t))v36[2])(v36, v37, v25, v38);

    uint64_t v39 = sub_10002250C(a1);
    uint64_t v40 = objc_opt_class();
    ((void (*)(void *, void *, void *, uint64_t))v36[2])(v36, v39, v24, v40);

    int v41 = sub_1000225A0((unsigned char *)a1);
    *((unsigned char *)v64 + 24) |= v41;
    if (v41) {
      [v35 appendString:@" << adding shared mailbox items >>"];
    }
  }
  else
  {
    v42 = sub_1000205F8();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Creating default mailbox collection", v51, 2u);
    }

    sub_100022CEC(a1);
    sub_10002301C((void *)a1);
    [v48 appendString:@" << Creating default mailbox collections >>"];
    *((unsigned char *)v64 + 24) = 1;
  }
  [*(id *)(a1 + 120) unlock];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023230;
  block[3] = &unk_100139C48;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v43 = sub_100021954((id *)a1);
  if (v43)
  {
    *((unsigned char *)v64 + 24) = 1;
    [v48 appendString:v43];
  }
  if (*((unsigned char *)v64 + 24))
  {
    v44 = MFUserAgent();
    unsigned __int8 v45 = [v44 isMaild];

    if ((v45 & 1) == 0)
    {
      [*(id *)(a1 + 120) lock];
      sub_1000232A8(a1, v48);
      [*(id *)(a1 + 120) unlock];
    }
  }

  _Block_object_dispose(&v63, 8);
}

void sub_100021540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

id sub_1000216E0(uint64_t a1)
{
  sub_100020E08(*(void *)(a1 + 32));
  double v2 = sub_1000205F8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FavoritesPersistence collection reloaded.", v4, 2u);
  }

  return [*(id *)(a1 + 40) postNotificationName:@"MailApplicationFavoritesDidChange" object:*(void *)(a1 + 32)];
}

void sub_10002176C(uint64_t a1)
{
  id v3 = NSUbiquitousKeyValueStoreChangeReasonKey;
  id v4 = &off_100146068;
  double v2 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
  [*(id *)(a1 + 32) postNotificationName:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:*(void *)(*(void *)(a1 + 40) + 112) userInfo:v2];
}

void sub_100021818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021830(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[12] = [*(id *)(a1 + 32) BOOLForKey:EMUserDefaultDisableFollowUp];
    sub_100020E08((uint64_t)WeakRetained);
  }
}

void sub_1000218A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100021918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)FavoritesPersistence;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

id sub_100021954(id *a1)
{
  if (a1)
  {
    double v2 = [a1[13] displayedAccounts];
    if ([v2 count])
    {
      id v3 = sub_100021A24((uint64_t)a1, 0);
      id v4 = [a1 mailboxPersistence];
      [v4 fetchMailboxListsWithKind:0];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_1000219FC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

id sub_100021A24(uint64_t a1, char a2)
{
  if (a1)
  {
    if (pthread_main_np() != 1)
    {
      __int16 v36 = +[NSAssertionHandler currentHandler];
      [v36 handleFailureInMethod:"_loadMailboxesForcibly:" object:a1 file:@"FavoritesPersistence.m" lineNumber:894 description:@"Current thread must be main"];
    }
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v38 = [*(id *)(a1 + 104) displayedAccounts];
    id v4 = sub_10002250C(a1);
    uint64_t v39 = [v4 items];

    if ([v38 count] || objc_msgSend(v39, "count"))
    {
      id v37 = objc_msgSend(v39, "ef_filter:", &stru_10013A8F0);
      if (a2) {
        goto LABEL_18;
      }
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v5 = v37;
      id v6 = [v5 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v58;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v58 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = [*(id *)(*((void *)&v57 + 1) + 8 * i) subItems];
            BOOL v10 = [v9 count] == 0;

            if (v10)
            {

              goto LABEL_18;
            }
          }
          id v6 = [v5 countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

      if (Current - *(double *)&qword_10016B7F8 > 5.0)
      {
LABEL_18:
        qword_10016B7F8 = *(void *)&Current;
        *(unsigned char *)(a1 + 11) = 1;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id obj = v37;
        id v12 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
        if (v12)
        {
          uint64_t v41 = *(void *)v54;
          do
          {
            id v42 = v12;
            for (j = 0; j != v42; j = (char *)j + 1)
            {
              if (*(void *)v54 != v41) {
                objc_enumerationMutation(obj);
              }
              uint64_t v14 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
              long long v15 = [v14 account];
              long long v16 = +[MailChangeManager sharedChangeManager];
              v43 = [v16 allMailboxUidsSortedWithSpecialsAtTopForAccount:v15 includingLocals:1 client:a1 outbox:0];

              long long v17 = sub_1000205F8();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                id v18 = [v43 count];
                *(_DWORD *)buf = 134217984;
                id v64 = v18;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "loaded sortedMailboxes.count:%lu", buf, 0xCu);
              }

              uint64_t v19 = +[NSMutableArray array];
              long long v51 = 0u;
              long long v52 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              id v20 = v43;
              id v21 = [v20 countByEnumeratingWithState:&v49 objects:v62 count:16];
              if (v21)
              {
                uint64_t v22 = *(void *)v50;
                do
                {
                  for (k = 0; k != v21; k = (char *)k + 1)
                  {
                    if (*(void *)v50 != v22) {
                      objc_enumerationMutation(v20);
                    }
                    __int16 v24 = +[FavoriteItem itemForMailbox:*(void *)(*((void *)&v49 + 1) + 8 * (void)k) selected:1];
                    [v19 addObject:v24];
                  }
                  id v21 = [v20 countByEnumeratingWithState:&v49 objects:v62 count:16];
                }
                while (v21);
              }

              v25 = MFLogGeneral();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v26 = objc_msgSend(v15, "ef_publicDescription");
                *(_DWORD *)buf = 138543362;
                id v64 = v26;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#Favorites Settings mailbox items for account: %{public}@", buf, 0xCu);
              }
              [*(id *)(a1 + 120) lock];
              [v14 setSubItems:v19];
              os_signpost_id_t v27 = *(void **)(a1 + 56);
              *(void *)(a1 + 56) = 0;

              [*(id *)(a1 + 120) unlock];
            }
            id v12 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
          }
          while (v12);
        }

        *(unsigned char *)(a1 + 11) = 0;
        id v28 = objc_alloc_init((Class)NSMutableArray);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v29 = obj;
        id v30 = [v29 countByEnumeratingWithState:&v45 objects:v61 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v46;
          do
          {
            for (m = 0; m != v30; m = (char *)m + 1)
            {
              if (*(void *)v46 != v31) {
                objc_enumerationMutation(v29);
              }
              id v33 = *(void **)(*((void *)&v45 + 1) + 8 * (void)m);
              if (sub_100024364(a1, v33)) {
                [v28 addObject:v33];
              }
            }
            id v30 = [v29 countByEnumeratingWithState:&v45 objects:v61 count:16];
          }
          while (v30);
        }

        if ([v28 count])
        {
          __int16 v34 = objc_msgSend(v28, "ef_map:", &stru_10013A930);
          uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Refreshing due to item expansion on %lu items:%@", [v34 count], v34);
        }
        else
        {
          uint64_t v11 = 0;
        }
        sub_10002464C(a1, 0);
        sub_100025E8C((id *)a1);
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void sub_100022068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000221A8(id a1, MailAccount *a2)
{
  double v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void sub_1000221F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022204(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v19 = a3;
  __int16 v8 = [v7 items];
  id v9 = [v8 mutableCopy];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000224A8;
  void v24[3] = &unk_10013A7E8;
  uint64_t v26 = a4;
  id v10 = v19;
  id v25 = v10;
  uint64_t v11 = objc_msgSend(v9, "ef_filter:", v24);
  id v12 = [v11 count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v12 != 0;
  if (v12) {
    [*(id *)(a1 + 32) appendFormat:@" << removingItems %@ from collection %@ >>", v11, v7];
  }
  [v9 removeObjectsInArray:v11];
  [v7 setItems:v9];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        unsigned int v18 = [v7 addItem:v17 ordered:1];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v18;
        if (v18) {
          [*(id *)(a1 + 32) appendFormat:@" << addingItem %@ to collection %@ >>", v17, v7];
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v14);
  }
}

void sub_100022444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000224A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_1000224FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10002250C(uint64_t a1)
{
  if (a1)
  {
    [*(id *)(a1 + 120) lock];
    if ([*(id *)(a1 + 16) count])
    {
      double v2 = [*(id *)(a1 + 16) objectAtIndex:2];
    }
    else
    {
      double v2 = 0;
    }
    [*(id *)(a1 + 120) unlock];
  }
  else
  {
    double v2 = 0;
  }

  return v2;
}

void sub_100022590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000225A0(unsigned char *a1)
{
  if (a1)
  {
    os_log_t v1 = +[NSUserDefaults standardUserDefaults];
    id v2 = [v1 integerForKey:@"FlaggedMailboxControllerBadgeCount"];

    id v3 = [a1 mailboxesCollection];
    uint64_t v4 = [a1 conversationSubscriptionProvider];
    unsigned int v32 = [v4 hasSubscribedConversations];

    id v37 = +[FavoriteItem itemForSharedMailboxWithType:1 selected:1];
    v55[0] = v37;
    __int16 v36 = +[FavoriteItem itemForSharedMailboxWithType:2 selected:(uint64_t)v2 > 0];
    v55[1] = v36;
    uint64_t v40 = +[FavoriteItem itemForSharedMailboxWithType:16 selected:0];
    v55[2] = v40;
    id v35 = +[FavoriteItem itemForSharedMailboxWithType:17 selected:0];
    v55[3] = v35;
    uint64_t v41 = +[FavoriteItem itemForSharedMailboxWithType:18 selected:0];
    v55[4] = v41;
    uint64_t v39 = +[FavoriteItem itemForSharedMailboxWithType:19 selected:0];
    v55[5] = v39;
    __int16 v34 = +[FavoriteItem itemForSharedMailboxWithType:20 selected:0];
    v55[6] = v34;
    uint64_t v38 = +[FavoriteItem itemForSharedMailboxWithType:21 selected:0];
    v55[7] = v38;
    id v33 = +[FavoriteItem itemForSharedMailboxWithType:22 selected:0];
    v55[8] = v33;
    id v5 = +[FavoriteItem itemForSharedMailboxWithType:3 selected:0];
    v55[9] = v5;
    id v6 = +[FavoriteItem itemForSharedMailboxWithType:4 selected:0];
    v55[10] = v6;
    id v7 = +[FavoriteItem itemForSharedMailboxWithType:5 selected:0];
    v55[11] = v7;
    __int16 v8 = +[FavoriteItem itemForUnifiedMailboxWithType:5 selected:0];
    v55[12] = v8;
    id v9 = +[FavoriteItem itemForUnifiedMailboxWithType:2 selected:0];
    v55[13] = v9;
    id v10 = +[FavoriteItem itemForUnifiedMailboxWithType:4 selected:0];
    v55[14] = v10;
    uint64_t v11 = +[FavoriteItem itemForUnifiedMailboxWithType:3 selected:0];
    v55[15] = v11;
    id v12 = +[FavoriteItem itemForUnifiedMailboxWithType:1 selected:0];
    v55[16] = v12;
    id v42 = +[NSArray arrayWithObjects:v55 count:17];

    id v13 = +[FavoriteItem itemForSharedMailboxWithType:6 selected:v32];
    v54[0] = v13;
    id v14 = +[FavoriteItem itemForSharedMailboxWithType:15 selected:0];
    v54[1] = v14;
    uint64_t v15 = +[FavoriteItem itemForSharedMailboxWithType:23 selected:0];
    v54[2] = v15;
    long long v16 = +[FavoriteItem itemForSharedMailboxWithType:25 selected:0];
    v54[3] = v16;
    uint64_t v17 = +[FavoriteItem itemForSharedMailboxWithType:8 selected:0];
    v54[4] = v17;
    unsigned int v18 = +[FavoriteItem itemForSharedMailboxWithType:7 selected:0];
    v54[5] = v18;
    id v19 = +[NSArray arrayWithObjects:v54 count:6];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v20 = v42;
    int v21 = 0;
    id v22 = [v20 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v49;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          v21 |= [v3 addItem:*(void *)(*((void *)&v48 + 1) + 8 * i)];
        }
        id v22 = [v20 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v22);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v25 = v19;
    id v26 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v45;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(v25);
          }
          v21 |= [v3 addItem:*(void *)(*((void *)&v44 + 1) + 8 * (void)j) ordered:1];
        }
        id v26 = [v25 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v26);
    }

    if (a1[12])
    {
      id v29 = +[FavoriteItem itemForSharedMailboxWithType:23 selected:0];
      id v30 = [v3 removeItem:v29];
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }
  return v21 & 1;
}

void sub_100022B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_100022CEC(uint64_t a1)
{
  if (a1)
  {
    id v2 = [*(id *)(a1 + 104) displayedAccounts];
    id v3 = +[FavoritesCollection mailboxesCollection];
    [*(id *)(a1 + 120) lock];
    [*(id *)(a1 + 16) addObject:v3];
    [*(id *)(a1 + 120) unlock];
    uint64_t v4 = +[FavoriteItem itemForUnifiedMailboxWithType:7 selected:1];
    [v3 addItem:v4];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v2;
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v23;
      do
      {
        __int16 v8 = 0;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = +[FavoriteItem itemForInboxWithAccount:*(void *)(*((void *)&v22 + 1) + 8 * (void)v8) selected:1];
          [v3 addItem:v9];

          __int16 v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    sub_1000225A0((unsigned char *)a1);
    [*(id *)(a1 + 120) lock];
    id v10 = *(void **)(a1 + 16);
    uint64_t v11 = +[FavoritesCollection outboxCollection];
    [v10 addObject:v11];

    [*(id *)(a1 + 120) unlock];
    id v12 = +[FavoritesCollection accountsCollection];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v5;
    id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        long long v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = +[FavoriteItem itemForAccount:](FavoriteItem, "itemForAccount:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v16), (void)v18);
          [v12 addItem:v17];

          long long v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }

    [*(id *)(a1 + 120) lock];
    [*(id *)(a1 + 16) addObject:v12];
    [*(id *)(a1 + 120) unlock];
  }
}

void sub_100022F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002301C(void *a1)
{
  if (a1)
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    id v3 = [v2 objectForKey:@"InboxesOrder"];

    if (v3)
    {
      uint64_t v4 = +[NSUserDefaults standardUserDefaults];
      [v4 removeObjectForKey:@"InboxesOrder"];

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100023454;
      v12[3] = &unk_10013A838;
      id v13 = v3;
      id v5 = objc_retainBlock(v12);
      id v6 = [a1 mailboxesCollection];
      uint64_t v7 = [v6 items];
      id v8 = [v7 mutableCopy];

      [v8 sortUsingComparator:v5];
      [v6 setItems:v8];
      id v9 = sub_10002250C((uint64_t)a1);

      id v10 = [v9 items];
      id v11 = [v10 mutableCopy];

      [v11 sortUsingComparator:v5];
      [v9 setItems:v11];
    }
  }
}

void sub_1000231C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  long long v19 = v16;

  _Unwind_Resume(a1);
}

void sub_100023230(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:off_100169988 object:*(void *)(a1 + 32) userInfo:0];
}

void sub_100023294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000232A8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    [*(id *)(a1 + 120) lock];
    id v3 = [*(id *)(a1 + 16) mutableCopy];
    [*(id *)(a1 + 120) unlock];
    sub_100023CE4(a1, v3, v4);
  }
}

void sub_100023338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100023430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100023454(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 persistentIDForMigration];
  uint64_t v7 = [v5 persistentIDForMigration];
  id v8 = (void *)v7;
  if (v6)
  {
    unint64_t v9 = (unint64_t)[*(id *)(a1 + 32) indexOfObject:v6];
    if (v8)
    {
LABEL_3:
      unint64_t v10 = (unint64_t)[*(id *)(a1 + 32) indexOfObject:v8];
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v7) {
      goto LABEL_3;
    }
  }
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
  if (v9 < v10) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = v10 < v9;
  }

  return v11;
}

void sub_100023504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10002352C(uint64_t a1)
{
  if (!a1)
  {
    id v10 = 0;
    goto LABEL_17;
  }
  [*(id *)(a1 + 120) lock];
  id v2 = *(void **)(a1 + 56);
  if (v2) {
    goto LABEL_16;
  }
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
  id v4 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v3;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 16);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)v13;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v5);
      }
      unint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      if (!objc_msgSend(v9, "isOutboxCollection", (void)v12))
      {
        if (![v9 isVisible]) {
          continue;
        }
LABEL_12:
        [*(id *)(a1 + 56) addObject:v9];
        continue;
      }
      if (*(unsigned char *)(a1 + 8)) {
        goto LABEL_12;
      }
    }
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v6);
LABEL_15:

  id v2 = *(void **)(a1 + 56);
LABEL_16:
  id v10 = objc_msgSend(v2, "copy", (void)v12);
  [*(id *)(a1 + 120) unlock];
LABEL_17:

  return v10;
}

void sub_1000236DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100023788(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    [*(id *)(a1 + 120) lock];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = *(id *)(a1 + 16);
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          unint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "itemsOfType:", a2, (void)v11);
          [v4 addObjectsFromArray:v9];
        }
        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    [*(id *)(a1 + 120) unlock];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_1000238E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100023920(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = [*(id *)(a1 + 104) displayedAccounts];
    id v4 = [v3 allObjects];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100023A24;
    v10[3] = &unk_10013A858;
    v10[4] = a2;
    uint64_t v5 = objc_msgSend(v4, "ef_compactMap:", v10);
    id v6 = (void *)v5;
    uint64_t v7 = &__NSArray0__struct;
    if (v5) {
      uint64_t v7 = (void *)v5;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_100023A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100023A24(uint64_t a1, void *a2)
{
  id v2 = [a2 mailboxUidOfType:*(void *)(a1 + 32) createIfNeeded:0];

  return v2;
}

void sub_100023C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100023CE4(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v29 = a3;
  if (a1)
  {
    uint64_t v5 = MFUserAgent();
    unsigned int v6 = [v5 isMaild];

    if (v6)
    {
      uint64_t v7 = sub_1000205F8();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000C0754(v7);
      }
    }
    else
    {
      id v27 = objc_alloc_init((Class)NSMutableDictionary);
      id v8 = objc_alloc_init((Class)NSMutableArray);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v9 = v28;
      id v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v34;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v34 != v11) {
              objc_enumerationMutation(v9);
            }
            long long v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            objc_msgSend(v13, "prepareForWriting", v27);
            if (([v13 transient] & 1) == 0)
            {
              long long v14 = [v13 dictionaryRepresentation];
              [v8 addObject:v14];
              long long v15 = [(id)a1 mailboxesCollection];
              BOOL v16 = v13 == v15;

              if (v16)
              {
                uint64_t v17 = MFLogGeneral();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v40 = v29;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#Favorites Writing mailboxes collection with reason: << %@ >>", buf, 0xCu);
                }
              }
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v10);
      }

      int v18 = _os_feature_enabled_impl();
      long long v19 = &off_100146098;
      if (v18) {
        long long v19 = &off_100146080;
      }
      long long v20 = v19;
      v38[0] = v8;
      v37[0] = @"collections";
      v37[1] = @"buildVersion";
      long long v21 = (void *)_CFCopySystemVersionDictionary();
      long long v22 = [v21 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey];

      v37[2] = @"version";
      v38[1] = v22;
      v38[2] = v20;
      long long v23 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
      [v27 setDictionary:v23];

      long long v24 = *(void **)(a1 + 24);
      if (v24)
      {
        long long v25 = [v24 dictionaryRepresentation];
        if ([v25 count]) {
          [v27 setObject:v25 forKey:@"lastSelectedItem"];
        }
      }
      id v26 = *(id *)(a1 + 96);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100024160;
      v30[3] = &unk_100139C20;
      uint64_t v7 = v27;
      uint64_t v31 = v7;
      uint64_t v32 = a1;
      [v26 performBlock:v30];
    }
  }
}

void sub_100024090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100024160(uint64_t a1)
{
  id v2 = +[NSPropertyListSerialization dataWithPropertyList:*(void *)(a1 + 32) format:200 options:0 error:0];
  [v2 writeToFile:*(void *)(*(void *)(a1 + 40) + 32) options:1073741825 error:0];
  id v3 = sub_1000205F8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FavoritesPersistence collection changed", v4, 2u);
  }

  notify_post((const char *)[@"FavoritePersistenceShouldReload" UTF8String]);
}

void sub_100024224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100024328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100024364(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_10002352C(a1);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        id v9 = objc_msgSend(v8, "items", (void)v14);
        id v10 = [v9 indexOfObject:v3];

        if (v10 != (id)0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        if (v5 == (id)++v7)
        {
          id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v5) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v11 = v8;

      if (!v11) {
        goto LABEL_13;
      }
      [*(id *)(a1 + 120) lock];
      [v11 addOrUpdateItem:v3 replacedItem:0];
      [*(id *)(a1 + 120) unlock];
      a1 = 1;
    }
    else
    {
LABEL_10:

LABEL_13:
      long long v12 = MFLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000C0798((uint64_t)v3, v12);
      }

      a1 = 0;
      id v11 = 0;
    }
  }
  return a1;
}

void sub_10002451C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100024630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002464C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000276B0;
    v5[3] = &unk_100139C20;
    id v6 = v3;
    uint64_t v7 = a1;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

void sub_1000247B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000247D8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = sub_1000205F8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v33 = [v5 count];
      __int16 v34 = 2048;
      id v35 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Syncing local changes (%lu added, %lu removed)", buf, 0x16u);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v5;
    char v9 = 0;
    id v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v14 = [v13 syncKey];
          if (v14)
          {
            id v15 = sub_100024C0C(a1, v13);
            [a1[14] setDictionary:v15 forKey:v14];

            char v9 = 1;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = v6;
    id v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v23;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v16);
          }
          long long v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)j), "syncKey", (void)v22);
          if (v20)
          {
            long long v21 = [a1[14] dictionaryForKey:v20];
            if (v21)
            {
              [a1[14] removeObjectForKey:v20];
              char v9 = 1;
            }
          }
        }
        id v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }

    if (v9) {
      [a1[14] synchronize];
    }
  }
}

void sub_100024A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100024BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100024C0C(id a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc((Class)NSMutableDictionary);
    id v5 = [v3 syncValue];
    a1 = [v4 initWithDictionary:v5];

    [a1 setObject:&off_1001460B0 forKey:@"version"];
    +[NSDate timeIntervalSinceReferenceDate];
    id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [a1 setObject:v6 forKey:@"modified"];

    uint64_t v7 = sub_1000205F8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v3 syncKey];
      int v10 = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      id v13 = a1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "syncing key = %@; value = %@",
        (uint8_t *)&v10,
        0x16u);
    }
  }

  return a1;
}

void sub_100024D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100024DC0(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = sub_1000205F8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = a2;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "merging external changes (reason: %lu) %@", buf, 0x16u);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, a1);
    uint64_t v7 = (void *)a1[17];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_100024F68;
    v8[3] = &unk_10013A8D0;
    objc_copyWeak(v10, (id *)buf);
    id v9 = v5;
    v10[1] = a2;
    [v7 performBlock:v8];

    objc_destroyWeak(v10);
    objc_destroyWeak((id *)buf);
  }
}

void sub_100024F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_100024F68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = (void *)WeakRetained[14];
  }
  [WeakRetained synchronize];
  if ([*(id *)(a1 + 32) count])
  {
    id v4 = *(id *)(a1 + 32);
  }
  else
  {
    if (v3) {
      id v5 = (void *)v3[14];
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    uint64_t v7 = [v6 dictionaryRepresentation];
    id v4 = [v7 allKeys];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000250B0;
  block[3] = &unk_10013A8A8;
  void block[4] = v3;
  id v10 = v4;
  uint64_t v11 = *(void *)(a1 + 48);
  id v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100025084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000250B0(uint64_t a1)
{
  uint64_t v61 = 0;
  long long v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 120);
  }
  else {
    id v3 = 0;
  }
  [v3 lock];
  id v41 = [*(id *)(a1 + 40) copy];
  long long v45 = +[NSMutableDictionary dictionary];
  uint64_t v46 = a1;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v41;
  id v4 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v58;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v58 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if ([v7 length] == (id)36)
        {
          id v8 = *(void **)(v46 + 32);
          if (v8) {
            id v8 = (void *)v8[14];
          }
          id v9 = v8;
          id v10 = [v9 objectForKey:v7];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v45 setObject:v10 forKey:v7];
          }
          else if (!v10 && *(void *)(v46 + 48) != 3)
          {
            uint64_t v11 = +[NSNull null];
            [v45 setObject:v11 forKey:v7];
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
    }
    while (v4);
  }

  __int16 v12 = sub_1000205F8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v45 count];
    *(_DWORD *)buf = 134217984;
    id v67 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_mergeExternalChanges applying %lu changes", buf, 0xCu);
  }

  uint64_t v14 = v46;
  [*(id *)(v46 + 32) mailboxesCollection];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100025970;
  v52[3] = &unk_10013A880;
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  id v53 = v42;
  id v54 = 0;
  uint64_t v55 = *(void *)(v46 + 32);
  long long v56 = &v61;
  [v45 enumerateKeysAndObjectsUsingBlock:v52];
  if (*(void *)(v46 + 48) <= 1uLL)
  {
    id v15 = sub_1000205F8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *(void **)(v46 + 48);
      *(_DWORD *)buf = 134217984;
      id v67 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Uploading all items due to change reason: %lu", buf, 0xCu);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v43 = [v42 items];
    id v17 = [v43 countByEnumeratingWithState:&v48 objects:v65 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v49;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v49 != v18) {
            objc_enumerationMutation(v43);
          }
          long long v20 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
          long long v21 = [v20 syncKey];
          if ([v20 shouldSync])
          {
            long long v22 = [v45 objectForKey:v21];
            if (v22)
            {
              long long v23 = [v20 representingMailbox];
              id v24 = v23;
              if (v23)
              {
                if (+[MFMailboxUid isStandardizedMailboxUidType:](MFMailboxUid, "isStandardizedMailboxUidType:", [v23 mailboxType]))
                {
                  long long v25 = [v22 objectForKey:@"mailboxType"];
                  id v26 = [v25 integerValue];

                  if (!v26)
                  {
                    long long v27 = [v22 mutableCopy];
                    long long v28 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v24 mailboxType]);
                    [v27 setObject:v28 forKey:@"mailboxType"];

                    long long v29 = sub_1000205F8();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                    {
                      id v30 = +[EFPrivacy partiallyRedactedStringForString:v21];
                      *(_DWORD *)buf = 138412290;
                      id v67 = v30;
                      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Found new Favorite Mailbox to add %@", buf, 0xCu);
                    }
                    uint64_t v31 = *(void **)(v46 + 32);
                    if (v31) {
                      uint64_t v31 = (void *)v31[14];
                    }
                    uint64_t v32 = v31;
                    id v33 = [v20 syncKey];
                    [v32 setObject:v27 forKey:v33];

                    goto LABEL_44;
                  }
                }
              }
            }
            else
            {
              __int16 v34 = sub_1000205F8();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                id v35 = +[EFPrivacy partiallyRedactedStringForString:v21];
                *(_DWORD *)buf = 138412290;
                id v67 = v35;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Found new Favorite Mailbox to add %@", buf, 0xCu);
              }
              id v24 = sub_100024C0C(*(id *)(v46 + 32), v20);
              long long v36 = *(void **)(v46 + 32);
              if (v36) {
                long long v36 = (void *)v36[14];
              }
              long long v27 = v36;
              [v27 setObject:v24 forKey:v21];
LABEL_44:
            }
          }
        }
        id v17 = [v43 countByEnumeratingWithState:&v48 objects:v65 count:16];
      }
      while (v17);
    }

    uint64_t v14 = v46;
  }
  if (*((unsigned char *)v62 + 24)) {
    sub_1000232A8(*(void *)(v14 + 32), @"_mergeExternalChanges");
  }
  id v37 = +[EFScheduler globalAsyncScheduler];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100025CF4;
  v47[3] = &unk_100139C48;
  v47[4] = *(void *)(v14 + 32);
  [v37 performBlock:v47];

  uint64_t v38 = *(void *)(v46 + 32);
  if (v38) {
    uint64_t v39 = *(void **)(v38 + 120);
  }
  else {
    uint64_t v39 = 0;
  }
  [v39 unlock];
  if (*((unsigned char *)v62 + 24))
  {
    uint64_t v40 = *(void *)(v46 + 32);
    if (v40) {
      sub_10002464C(v40, 0);
    }
  }

  _Block_object_dispose(&v61, 8);
}

void sub_1000257E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_100025970(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = +[NSNull null];

  if (v8 == v6)
  {
    long long v19 = [*(id *)(a1 + 32) itemWithSyncKey:v7];
    long long v20 = [v19 representingMailbox];
    if ([v19 type] == (id)2
      && [*(id *)(a1 + 40) containsObject:v20]
      && (+[FavoriteItem itemForMailbox:selected:shouldSync:](FavoriteItem, "itemForMailbox:selected:shouldSync:", v20, [v19 isSelected], 0), (long long v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= [*(id *)(a1 + 32) addOrUpdateItem:v21 replacedItem:0];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      id v22 = [*(id *)(a1 + 32) removeItemWithSyncKey:v7];
    }
  }
  else
  {
    id v9 = v6;
    id v10 = +[FavoriteItem itemFromDictionary:v9];
    if (v10)
    {
      uint64_t v11 = *(void **)(a1 + 32);
      id v23 = 0;
      unsigned __int8 v12 = [v11 addOrUpdateItem:v10 replacedItem:&v23];
      id v13 = v23;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= v12;
      if (v13)
      {
        uint64_t v14 = sub_1000205F8();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v13 syncKey];
          id v16 = [v10 syncKey];
          *(_DWORD *)buf = 138412546;
          long long v25 = v15;
          __int16 v26 = 2112;
          long long v27 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "item %@ was replaced by %@", buf, 0x16u);
        }
        id v17 = *(void **)(*(void *)(a1 + 48) + 112);
        uint64_t v18 = [v13 syncKey];
        [v17 removeObjectForKey:v18];
      }
    }
    else
    {
      id v13 = sub_1000205F8();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000C0810((uint64_t)v7, (uint64_t)v9, v13);
      }
    }
  }
}

void sub_100025C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100025CF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 112);
  }
  else {
    uint64_t v2 = 0;
  }
  return [v2 synchronize];
}

void sub_100025DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100025E10(id a1, FavoriteItem *a2)
{
  uint64_t v2 = [(FavoriteItem *)a2 account];
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

void sub_100025E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_100025E5C(id a1, FavoriteItem *a2)
{
  uint64_t v2 = [(FavoriteItem *)a2 ef_publicDescription];

  return (NSString *)v2;
}

void sub_100025E8C(id *a1)
{
  if (!a1) {
    return;
  }
  MFUserAgent();
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if ([v18 isMaild]) {
    goto LABEL_5;
  }
  id v3 = objc_getProperty(a1, v2, 80, 1);
  if (v3)
  {

LABEL_5:

    return;
  }
  id Property = objc_getProperty(a1, v4, 88, 1);

  if (!Property)
  {
    id v6 = a1[8];
    id v7 = [v6 mailboxRepository];

    id v8 = +[EFPromise promise];
    id v9 = +[EFScheduler globalAsyncScheduler];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10002786C;
    void v23[3] = &unk_100139C20;
    id v10 = v7;
    id v24 = v10;
    id v11 = v8;
    id v25 = v11;
    [v9 performBlock:v23];

    unsigned __int8 v12 = [v11 future];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002793C;
    v21[3] = &unk_10013A9A8;
    id v13 = v10;
    id v22 = v13;
    uint64_t v14 = [v12 then:v21];
    objc_setProperty_atomic(a1, v15, v14, 88);

    id v17 = objc_getProperty(a1, v16, 88, 1);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100027970;
    v20[3] = &unk_10013A9D0;
    void v20[4] = a1;
    [v17 addSuccessBlock:v20];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100027C9C;
    v19[3] = &unk_10013A0C0;
    void v19[4] = a1;
    [v17 addFailureBlock:v19];
  }
}

void sub_100026160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_100026210(uint64_t a1, char a2)
{
  if (a1)
  {
    LOBYTE(v4) = a2;
    uint64_t v2 = +[EFScheduler mainThreadScheduler];
    [v2 performBlock:&v3];
  }
}

void sub_1000262A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000262BC(uint64_t a1)
{
  sub_100021A24(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2) {
    sub_1000232A8(*(void *)(a1 + 32), v2);
  }
}

void sub_10002631C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100026478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  id v18 = v17;

  _Unwind_Resume(a1);
}

void sub_1000264CC()
{
  JUMPOUT(0x1000264C0);
}

void sub_1000264D8()
{
}

void sub_1000264E0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = sub_1000205F8();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "accounts did change: oldAccounts: %@, newAccounts: %@", (uint8_t *)&v6, 0x16u);
    }

    sub_100020E08(*(void *)(a1 + 48));
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    sub_10002464C(v5, 0);
  }
}

void sub_100026670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100026694(uint64_t a1)
{
  id v2 = sub_1000205F8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Reloading due to focus change", v7, 2u);
  }

  sub_100020E08(*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    sub_10002464C(v3, 0);
  }
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = [*(id *)(a1 + 40) userInfo];
  [v4 postNotificationName:@"FavoritesPersistenceFocusDidChangeNotification" object:v5 userInfo:v6];
}

void sub_10002676C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026788(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    [a1[15] lock];
    SEL v16 = [a1 mailboxesCollection];
    sub_100023788((uint64_t)a1, 2);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    SEL v15 = a1;
    int v6 = 0;
    if (v5)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v10 = [v9 representingMailbox];
          if (v10 && [v3 containsObject:v10])
          {
            id v11 = sub_1000205F8();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v12 = objc_msgSend(v10, "ef_publicDescription");
              *(_DWORD *)buf = 138543362;
              id v22 = v12;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "removing orphaned mailbox from favorites: %{public}@", buf, 0xCu);
            }
            id v13 = [v16 removeItem:v9];
            if (!v6)
            {
              int v6 = +[NSMutableArray array];
            }
            [v6 addObject:v9];
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v5);
    }

    uint64_t v14 = v15;
    if ([v6 count])
    {
      sub_1000247D8(v15, 0, v6);
      sub_1000232A8((uint64_t)v15, @"Removing orphaned mailboxes");
      uint64_t v14 = v15;
      sub_10002464C((uint64_t)v15, 0);
    }
    [v14[15] unlock];
  }
}

void sub_1000269EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100026A68(id *a1, void *a2)
{
  id v18 = a2;
  if (a1)
  {
    [a1[15] lock];
    long long v20 = [a1 mailboxesCollection];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v18;
    id v3 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    uint64_t v17 = (uint64_t)a1;
    if (v3)
    {
      char v4 = 0;
      id v5 = 0;
      uint64_t v6 = *(void *)v22;
      do
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(obj);
          }
          __int16 v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v9 = +[FavoriteItem itemForMailbox:selected:](FavoriteItem, "itemForMailbox:selected:", v8, 1, v17);
          id v10 = [v20 items];
          id v11 = [v10 indexOfObject:v9];
          if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            unsigned __int8 v12 = sub_1000205F8();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              id v13 = objc_msgSend(v8, "ef_publicDescription");
              *(_DWORD *)buf = 138543362;
              __int16 v26 = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "item not found for mailbox: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v14 = sub_1000205F8();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              SEL v15 = objc_msgSend(v8, "ef_publicDescription");
              *(_DWORD *)buf = 138543362;
              __int16 v26 = v15;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "updating existing item with new mailbox data: %{public}@", buf, 0xCu);
            }
            unsigned __int8 v12 = [v10 objectAtIndex:v11];
            [v12 setMailbox:v8];
            if (!v5)
            {
              id v5 = +[NSMutableArray array];
            }
            [v5 addObject:v12];
            char v4 = 1;
          }
        }
        id v3 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v3);

      if (v4)
      {
        uint64_t v16 = v17;
        sub_1000232A8(v17, @"_processNewMailboxes");
        sub_10002464C(v17, 0);
LABEL_21:
        objc_msgSend(*(id *)(v16 + 120), "unlock", v17);

        goto LABEL_22;
      }
    }
    else
    {

      id v5 = 0;
    }
    uint64_t v16 = v17;
    goto LABEL_21;
  }
LABEL_22:
}

void sub_100026D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100026F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100026F58(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"OldChildren"];
  uint64_t v4 = [v2 objectForKeyedSubscript:@"NewChildren"];
  id v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v7 = +[NSMutableArray arrayWithArray:v3];
    [v7 removeObjectsInArray:v5];
    if ([v7 count])
    {
      __int16 v8 = [*(id *)(a1 + 32) object];
      uint64_t v9 = [v8 account];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = sub_1000205F8();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "delaying processing of orphaned mailboxes for Exchange account", buf, 2u);
        }

        id v11 = dispatch_get_global_queue(0, 0);
        dispatch_time_t v12 = dispatch_time(0, 5000000000);
        uint64_t v14 = _NSConcreteStackBlock;
        uint64_t v15 = 3221225472;
        uint64_t v16 = sub_100027204;
        uint64_t v17 = &unk_100139C20;
        uint64_t v18 = *(void *)(a1 + 40);
        id v19 = v7;
        dispatch_after(v12, v11, &v14);
      }
      else
      {
        sub_100026788(*(id **)(a1 + 40), v7);
      }
    }
    id v13 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5, v14, v15, v16, v17, v18);
    [v13 removeObjectsInArray:v3];
    if ([v13 count]) {
      sub_100026A68(*(id **)(a1 + 40), v13);
    }
  }
  [*(id *)(a1 + 40) _loadMailboxesAfterMailboxListingChanged];
  *(unsigned char *)(*(void *)(a1 + 40) + 11) = 0;
}

void sub_1000271A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027204(uint64_t a1)
{
  id v2 = sub_1000205F8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting processing of orphaned mailboxes for Exchange account", v3, 2u);
  }

  sub_100026788(*(id **)(a1 + 32), *(void **)(a1 + 40));
}

void sub_10002748C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100027670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000276B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    CFStringRef v5 = @"FavoritesPersistenceCollectionChangedSourceKey";
    uint64_t v6 = v2;
    id v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:off_100169988 object:*(void *)(a1 + 40) userInfo:v3];
}

void sub_100027778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002784C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002786C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mailboxObjectIDsForMailboxType:6];
  id v5 = [v2 anyObject];

  id v3 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v3, "finishWithResult:");
  }
  else
  {
    uint64_t v4 = +[NSError em_internalErrorWithReason:@"outbox does not exist"];
    [v3 finishWithError:v4];
  }
}

void sub_100027910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10002793C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) mailboxForObjectID:a2];

  return v2;
}

void sub_100027970(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v4 = sub_100027A14(*(id **)(a1 + 32), v8);
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    objc_setProperty_atomic(v5, v3, v4, 80);
  }

  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    objc_setProperty_atomic(v7, v6, 0, 88);
  }
}

void sub_1000279F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id *sub_100027A14(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, v3, 80, 1), "cancel");
    id v17 = v4;
    id v5 = +[NSArray arrayWithObjects:&v17 count:1];
    uint64_t v6 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:v5];

    id v7 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v6 sortDescriptors:&__NSArray0__struct queryOptions:0 label:@"Outbox (Observing)"];
    id v8 = [v4 objectID];
    uint64_t v16 = v8;
    uint64_t v9 = +[NSArray arrayWithObjects:&v16 count:1];
    id v10 = +[EMMailboxScope mailboxScopeForMailboxObjectIDs:v9 forExclusion:0];

    id v11 = [a1[8] messageRepository];
    a1 = [v11 startCountingQuery:v7 includingServerCountsForMailboxScope:v10 withObserver:a1];
    dispatch_time_t v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      uint64_t v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#Favorites Started observing outbox using predicate: %@", (uint8_t *)&v14, 0xCu);
    }
  }

  return a1;
}

void sub_100027C18(_Unwind_Exception *a1)
{
  id v7 = v4;

  _Unwind_Resume(a1);
}

void sub_100027C9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend(v3, "ef_publicDescription");
    sub_1000C08DC(v5, v10, v4);
  }

  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_setProperty_atomic(v7, v6, 0, 80);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v9) {
      objc_setProperty_atomic(v9, v8, 0, 88);
    }
  }
}

void sub_100027D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100028154(id a1, FavoriteItem *a2)
{
  return (id)[(FavoriteItem *)a2 type] == (id)2;
}

void sub_1000281C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000284E4(uint64_t a1, void *a2)
{
  id v3 = [a2 account];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void sub_1000286E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000289D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_100028BF8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _runXPCActivity:v3];
}

void sub_100028C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100028D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100028FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000293D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10002971C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100029910(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 32));
}

void sub_100029998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000299AC(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 32));
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  off_100169B10();
  id v3 = objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(xdict, (const char *)[v3 UTF8String], 1);

  if (*(unsigned char *)(a1 + 40))
  {
    xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  }
}

void sub_100029A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100029AAC(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, *(void *)(a1 + 32));
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_GRACE_PERIOD, *(void *)(a1 + 40));
}

void sub_100029B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100029CAC()
{
  if (qword_10016B810 != -1) {
    dispatch_once(&qword_10016B810, &stru_10013AA98);
  }
  id v0 = (id *)dlsym((void *)qword_10016B808, "_DASCTSMailFetchKey");
  objc_storeStrong((id *)&qword_10016B800, *v0);
  off_100169B10 = (uint64_t (*)())sub_100029D40;
  uint64_t v1 = (void *)qword_10016B800;

  return v1;
}

id sub_100029D40()
{
  return (id)qword_10016B800;
}

void sub_100029D4C(id a1)
{
  qword_10016B808 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/DuetActivityScheduler.framework/DuetActivityScheduler", 2);
  if (!qword_10016B808) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/DuetActivityScheduler.framework/DuetActivityScheduler");
  }
}

void sub_100029F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100029FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100029FB8(id a1, MailAccount *a2)
{
  uint64_t v2 = a2;
  id v3 = [(MailAccount *)v2 primaryMailboxUid];
  BOOL v4 = [[MFNanoBridgeSettingsAccountSpecificMailbox alloc] initWithMailboxUid:v3 account:v2];

  return v4;
}

void sub_10002A028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10002A044(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_10002A08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A0F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002A364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002AACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002AC1C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a1 primaryMailboxUid];
  id v7 = [v6 uniqueId];

  if (v7)
  {
    id v8 = [a3 objectForKey:v7];
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [v5 primaryMailboxUid];
  id v10 = [v9 uniqueId];

  if (v10)
  {
    uint64_t v11 = [a3 objectForKey:v10];
    dispatch_time_t v12 = (void *)v11;
    if (v8 && v11)
    {
      uint64_t v13 = (uint64_t)[v8 compare:v11];
      goto LABEL_12;
    }
  }
  else
  {
    dispatch_time_t v12 = 0;
  }
  if (v7) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v10 != 0;
  }
LABEL_12:

  return v13;
}

void sub_10002AD18(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_10002AE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002AF54(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016B828;
  qword_10016B828 = (uint64_t)v1;
}

void sub_10002AFC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002B078(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016B838;
  qword_10016B838 = (uint64_t)v1;
}

void sub_10002B0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002B2C0(_Unwind_Exception *a1)
{
  BOOL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10002B36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)MailboxAutoFetchController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10002B46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10002B490(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

void sub_10002B58C(_Unwind_Exception *exception_object)
{
}

void sub_10002B920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002B974(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    if ((*(_DWORD *)(result + 48) & a2) != 0)
    {
      uint64_t v3 = *(void *)(result + 32);
      if ((*(_DWORD *)(v3 + 40) & a2) == 0 && *(uint64_t *)(v3 + 32) >= 3) {
        *(unsigned char *)(v2 + 24) = 0;
      }
    }
  }
  return result;
}

void sub_10002BA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

id sub_10002BA9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tryFetch:*(unsigned int *)(a1 + 48) withAccounts:*(void *)(a1 + 40)];
}

void sub_10002BB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10002BB94(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = MFAutoFetchLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "maild fetching mailboxObjectIDs: %@", (uint8_t *)&v8, 0xCu);
    }

    id v5 = *(void **)(a1 + 32);
    BOOL v4 = *(void **)(a1 + 40);
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = [v6 account];
    [v4 _fetchChangedMailboxes:v5 forAccount:v7 options:*(unsigned int *)(a1 + 48)];
  }
}

void sub_10002BC98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002BD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002BD54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = [WeakRetained displayedAccountsToSyncByMailbox];
  BOOL v4 = sub_10002BEF0((uint64_t)v3);

  if ([v4 count])
  {
    id v5 = [*(id *)(a1 + 32) fetchProcessorScheduler];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002BF80;
    v11[3] = &unk_100139C20;
    id v6 = v4;
    uint64_t v7 = *(void *)(a1 + 32);
    id v12 = v6;
    uint64_t v13 = v7;
    [v5 performBlock:v11];

    int v8 = v12;
  }
  else
  {
    uint64_t v9 = MFAutoFetchLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "powernap: no eligible accounts were found", v10, 2u);
    }

    int v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"MailboxAutoFetchProcessFinishedNotification" object:*(void *)(a1 + 32)];
  }
}

void sub_10002BEA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10002BEF0(uint64_t a1)
{
  os_log_t v1 = +[NSMutableSet setWithSet:a1];
  uint64_t v2 = [v1 objectsPassingTest:&stru_10013AC28];
  [v1 minusSet:v2];

  return v1;
}

void sub_10002BF64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002BF80(uint64_t a1)
{
  id v4 = +[MFFetchProcessor powernapProcessor];
  [v4 setAccounts:*(void *)(a1 + 32)];
  uint64_t v2 = [*(id *)(a1 + 40) favoritesPersistence];
  [v4 setFavoritesPersistence:v2];

  [v4 runSynchronouslyWithDuration:1800.0];
  uint64_t v3 = +[MFMessageBodyProcessor powernapProcessor];
  [v3 runSynchronouslyWithDuration:1800];
}

void sub_10002C028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_10002C108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned char *sub_10002C118(uint64_t a1)
{
  Class result = *(unsigned char **)(a1 + 32);
  if (!result[104]) {
    return [result _tryFetch:EMFetchTypeBackground withAccounts:0];
  }
  return result;
}

void sub_10002C234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10002C258(unint64_t a1)
{
  int v1 = a1;
  if (a1 < 5) {
    return (uint64_t)*(&off_10013AC48 + a1);
  }
  uint64_t v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Warning unable to create string for autofetch state %d!", (uint8_t *)v4, 8u);
  }

  return 0;
}

void sub_10002C444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10002C468(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleRequest:*(void *)(a1 + 40) priority:*(void *)(a1 + 48) selector:*(void *)(a1 + 56)];
}

void sub_10002C5B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002C9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_10002CB30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002CD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

id sub_10002CDE0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleRetryRequest:*(void *)(a1 + 40) priority:8 selector:"_fetchCompleted:"];
}

void sub_10002CDF8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) gotNewMessagesState])
  {
    uint64_t v2 = MFPowerLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
      id v4 = [*(id *)(a1 + 32) mailbox];
      id v5 = [v4 accountRelativePath];
      int v19 = 138543618;
      long long v20 = v3;
      __int16 v21 = 2112;
      long long v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Push Received] account=%{public}@ mailbox=%@", (uint8_t *)&v19, 0x16u);
    }
  }
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  [v6 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"AutoFetchJobAccount"];
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) gotNewMessagesState]);
  [v6 setObject:v7 forKeyedSubscript:@"AutoFetchJobNewMessagesState"];

  int v8 = [*(id *)(a1 + 32) mailbox];
  [v6 setObject:v8 forKeyedSubscript:@"AutoFetchJobMailboxUid"];

  uint64_t v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) dontNotify]);
  [v6 setObject:v9 forKeyedSubscript:@"AutoFetchDontNotify"];

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    [v6 setObject:v10 forKeyedSubscript:@"AutoFetchError"];
  }
  id v11 = [objc_alloc((Class)NSDictionary) initWithDictionary:v6];
  id v12 = *(void **)(a1 + 56);
  uint64_t v13 = [*(id *)(a1 + 32) mailbox];
  [v12 _endSignpostForMailboxFetch:v13];

  int v14 = +[NSNotificationCenter defaultCenter];
  [v14 postNotificationName:@"AutoFetchPushCompletedNotification" object:*(void *)(a1 + 56) userInfo:v11];

  [*(id *)(a1 + 32) markAsDone];
  if ([*(id *)(a1 + 32) isPush])
  {
    uint64_t v15 = [*(id *)(a1 + 32) mailbox];
    uint64_t v16 = [v15 fullPath];

    if (v16) {
      sub_10002D1CC((void *)qword_10016B820, v16, *(void **)(a1 + 32));
    }
  }
  if (*(void *)(a1 + 48))
  {
    *(unsigned char *)(*(void *)(a1 + 56) + 48) = 1;
    if ([*(id *)(a1 + 32) displayErrors])
    {
      id v17 = +[DaemonAppController sharedController];
      [v17 displayError:*(void *)(a1 + 48) forAccount:*(void *)(a1 + 40) mode:0];
    }
  }
  uint64_t v18 = +[MFPowerController sharedInstance];
  [v18 releaseAssertionWithIdentifier:@"com.apple.mail.fetchchangeduids"];
}

void sub_10002D110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D1CC(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id obj = v5;
  objc_sync_enter(obj);
  int v8 = [obj objectForKey:v6];
  if (!v8)
  {
    int v8 = [[AutoFetchHistoryEntry alloc] initWithMailboxPath:v6];
    [obj setObject:v8 forKey:v6];
  }
  [(AutoFetchHistoryEntry *)v8 setFrequency:(char *)[(AutoFetchHistoryEntry *)v8 frequency] + 1];
  [(AutoFetchHistoryEntry *)v8 setLastFetchTime:CFAbsoluteTimeGetCurrent()];
  [v7 responsiveness];
  -[AutoFetchHistoryEntry setLastFetchDuration:](v8, "setLastFetchDuration:");
  -[AutoFetchHistoryEntry setNewMessagesState:](v8, "setNewMessagesState:", [v7 gotNewMessagesState]);

  objc_sync_exit(obj);
}

void sub_10002D2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);

  _Unwind_Resume(a1);
}

void sub_10002D630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

unsigned char *sub_10002D79C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:CPNetworkObserverReachable];
  *(unsigned char *)(*(void *)(a1 + 32) + 104) = [v3 BOOLValue];

  id v4 = [*(id *)(a1 + 32) autoFetchState];
  Class result = *(unsigned char **)(a1 + 32);
  if (v4 == (id)2)
  {
    if (result[104])
    {
      [result _cleanUpReachabilityTimer];
      id v6 = *(void **)(a1 + 32);
      return [v6 _checkForWiFi];
    }
  }
  else
  {
    Class result = [result autoFetchState];
    if (!result)
    {
      Class result = *(unsigned char **)(a1 + 32);
      if (result[106])
      {
        if (result[104])
        {
          uint64_t v7 = EMFetchTypeBackground;
          return [result _tryFetch:v7 withAccounts:0];
        }
      }
    }
  }
  return result;
}

void sub_10002D894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002DC94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10002DD10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportReachabilityTimeout];
}

void sub_10002E258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10002E674(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createJobList];
}

void sub_10002E8CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10002E96C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mailbox];
  if ([v2 type] == (id)7) {
    uint64_t v3 = 8;
  }
  else {
    uint64_t v3 = 6;
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);

  return [v4 _scheduleRetryRequest:v5 priority:v3 selector:"_reportSynchronousFetchCompletion:"];
}

void sub_10002E9DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E9EC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) key];
  if (v2)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v2];
    [v3 doubleValue];
    double v5 = v4;

    id v6 = *(void **)(*(void *)(a1 + 40) + 24);
    [*(id *)(a1 + 32) responsiveness];
    int v8 = +[NSNumber numberWithDouble:v5 + v7];
    [v6 setObject:v8 forKey:v2];
  }
  uint64_t v9 = [*(id *)(a1 + 32) mailbox];
  uint64_t v10 = [v9 fullPath];

  if (v10) {
    sub_10002D1CC((void *)qword_10016B818, v10, *(void **)(a1 + 32));
  }
  if ([*(id *)(a1 + 32) gotNewMessagesState])
  {
    id v11 = MFAutoFetchLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 32) mailbox];
      uint64_t v13 = objc_msgSend(v12, "ef_publicDescription");
      int v14 = objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
      int v27 = 138543618;
      long long v28 = v13;
      __int16 v29 = 2114;
      id v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Request got new messages for mailbox %{public}@ of %{public}@", (uint8_t *)&v27, 0x16u);
    }
  }
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  [v15 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"AutoFetchJobAccount"];
  uint64_t v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) gotNewMessagesState]);
  [v15 setObject:v16 forKeyedSubscript:@"AutoFetchJobNewMessagesState"];

  id v17 = [*(id *)(a1 + 32) mailbox];
  [v15 setObject:v17 forKeyedSubscript:@"AutoFetchJobMailboxUid"];

  uint64_t v18 = *(void *)(a1 + 56);
  if (v18) {
    [v15 setObject:v18 forKeyedSubscript:@"AutoFetchError"];
  }
  id v19 = [objc_alloc((Class)NSDictionary) initWithDictionary:v15];
  long long v20 = *(void **)(a1 + 40);
  __int16 v21 = [*(id *)(a1 + 32) mailbox];
  [v20 _endSignpostForMailboxFetch:v21];

  long long v22 = +[NSNotificationCenter defaultCenter];
  [v22 postNotificationName:@"AutoFetchProcessJobCompletedNotification" object:*(void *)(a1 + 40) userInfo:v19];

  [*(id *)(a1 + 32) markAsDone];
  --*(void *)(*(void *)(a1 + 40) + 88);
  long long v23 = *(void **)(a1 + 40);
  if (!v23[11]) {
    [v23 _finishAutoFetch];
  }
  if (*(void *)(a1 + 56))
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 48) = 1;
    if ((*(unsigned char *)(*(void *)(a1 + 40) + 40) & 2) != 0
      || [*(id *)(a1 + 32) displayErrors])
    {
      long long v24 = [*(id *)(a1 + 32) mailbox];
      BOOL v25 = [v24 type] == (id)7;

      if (v25)
      {
        __int16 v26 = +[DaemonAppController sharedController];
        [v26 displayError:*(void *)(a1 + 56) forAccount:*(void *)(a1 + 48) mode:0];
      }
    }
  }
}

void sub_10002ED68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F284()
{
  objc_end_catch();
  JUMPOUT(0x10002F2BCLL);
}

void sub_10002F2A4()
{
}

void sub_10002F2AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002F590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10002F6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id sub_10002F6DC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 userInfo];
    double v4 = [v3 objectForKeyedSubscript:MonitoredActivityInvocation];

    double v5 = [v4 target];
    id v6 = +[NSNotificationCenter defaultCenter];
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = [*(id *)(a1 + 32) object];
    [v6 removeObserver:v7 name:MonitoredActivityEnded object:v8];

    uint64_t v9 = [v5 jobList];
    [*(id *)(a1 + 40) setPushedMailboxJobList:v9];
  }
  uint64_t v10 = *(void **)(a1 + 40);

  return [v10 _scheduleAllJobs];
}

void sub_10002F7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FD44(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = +[NSDate date];
  objc_msgSend(v2, "setLastAdditionalMailboxesFetchDate:");

  id v5 = +[MFFetchProcessor intelligentSkeletonFetchProcessor];
  uint64_t v3 = [*(id *)(a1 + 40) favoritesPersistence];
  [v5 setFavoritesPersistence:v3];

  [v5 setAccounts:*(void *)(a1 + 48)];
  [v5 runSynchronouslyWithDuration:15.0];
}

void sub_10002FDF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10002FED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10002FEF4(uint64_t a1)
{
  uint64_t v2 = +[DaemonAppController sharedController];
  unsigned int v3 = [v2 isFrontmost];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) userInfo];
    id v5 = [v4 objectForKeyedSubscript:MSNewNotificationSoundKeySuppressionContexts];
    id v6 = [*(id *)(a1 + 40) currentAlertSuppresionContexts];
    unsigned int v7 = [v5 intersectsSet:v6];

    if (v7)
    {
      int v8 = [v4 objectForKeyedSubscript:MSNewNotificationSoundKeyAccountIDOfSoundToPlay];
      uint64_t v9 = [v4 objectForKeyedSubscript:MSNewNotificationSoundKeyLoudestState];
      id v10 = [v9 unsignedIntegerValue];

      id v11 = MFAutoFetchLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "**DING** Auto fetch notifying user of new mail.", v12, 2u);
      }

      +[MFSoundController playNewMailSoundStyle:v10 forAccount:v8];
    }
  }
}

void sub_100030048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003043C(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);

  _Unwind_Resume(a1);
}

void sub_1000304D0(void *a1, void *a2)
{
  id v10 = a1;
  id v3 = a2;
  id v4 = [v10 mailbox];
  [v3 appendFormat:@"  mailbox: %@\n", v4];

  id v5 = [v10 account];
  [v3 appendFormat:@"    account: %@\n", v5];

  if ([v10 isVisibleFetch]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  [v3 appendFormat:@"    isVisibleFetch: %@\n", v6];
  if ([v10 isUserRequested]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  [v3 appendFormat:@"    isUserRequested: %@\n", v7];
  if ([v10 isForegroundRequest]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  [v3 appendFormat:@"    isForegroundRequest: %@\n", v8];
  if ([v10 shouldGrowFetchWindow]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  [v3 appendFormat:@"    shouldGrowFetchWindow: %@\n", v9];
}

void sub_100030618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_100030644(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 mailboxPath];
  [v4 appendFormat:@"  %@\n", v5];

  objc_msgSend(v4, "appendFormat:", @"    frequency  : %lu\n", objc_msgSend(v3, "frequency"));
  [v3 lastFetchTime];
  CFStringRef v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  [v4 appendFormat:@"    last fetch : %@\n", v6];

  [v3 lastFetchDuration];
  [v4 appendFormat:@"    duration   : %.2fs\n", v7];
  id v8 = [v3 newMessagesState];
  id v9 = v8;
  if ((unint64_t)v8 >= 6)
  {
    id v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Warning unable to create string for new messages state %lu!", buf, 0xCu);
    }

    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = (uint64_t)*(&off_10013AC70 + (void)v8);
  }
  [v4 appendFormat:@"    result     : %@\n", v10];
}

void sub_1000307DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030860(id a1)
{
  int v1 = +[NSUserDefaults standardUserDefaults];
  unsigned int v2 = [v1 BOOLForKey:@"AutoFetchDisabled"];

  if (v2)
  {
    id v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#Warning fetching disabled (AutoFetchDisabled = YES)", v13, 2u);
    }
  }
  else
  {
    id v4 = [MailboxAutoFetchController alloc];
    id v5 = +[DaemonAppController sharedController];
    CFStringRef v6 = [v5 favoritesPersistence];
    uint64_t v7 = [(MailboxAutoFetchController *)v4 initWithFavoritesPersistence:v6];
    id v8 = (void *)qword_10016B848;
    qword_10016B848 = (uint64_t)v7;

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v10 = (void *)qword_10016B818;
    qword_10016B818 = (uint64_t)v9;

    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    id v12 = (void *)qword_10016B820;
    qword_10016B820 = (uint64_t)v11;
  }
}

void sub_1000309A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100030EB4(id a1, MailAccount *a2, BOOL *a3)
{
  id v3 = a2;
  [(MailAccount *)v3 uniqueIdForPersistentConnection];
  BOOL v4 = PCSettingsGetPollInterval() == -1;

  return v4;
}

void sub_100030EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_100031300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003140C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000314D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100031554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000315B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000316E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031854(_Unwind_Exception *a1)
{
  BOOL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10003191C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100031930(void *a1, void *a2)
{
  BOOL v4 = [a1 mailbox];
  id v5 = [a2 mailbox];
  unint64_t v6 = (unint64_t)[v4 type];
  unint64_t v7 = (unint64_t)[v5 type];
  if (v6 | v7)
  {
    if (v6) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = v7 != 0;
    }
  }
  else
  {
    id v9 = [a1 displayName];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v4 displayName];
    }
    id v12 = v11;

    id v13 = [a2 displayName];
    int v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v5 displayName];
    }
    uint64_t v16 = v15;

    uint64_t v8 = (uint64_t)[v12 localizedCaseInsensitiveCompare:v16];
  }

  return v8;
}

void sub_100031A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000322E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003248C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000325BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100032884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100032A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100032BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100032CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100032D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003303C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100033344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000334E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100033748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100033830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000338E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100033AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100033CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100033D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100033E1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000340E0(int a1, int a2)
{
  BOOL v4 = +[NSMutableString stringWithString:@"FOUND_IN_MAILBOX_FORMAT"];
  id v5 = v4;
  if (a1) {
    [v4 appendString:@"_WITH_ACCOUNT"];
  }
  if (a2) {
    [v5 appendString:@"_SHORT"];
  }
  unint64_t v6 = +[NSBundle mainBundle];
  unint64_t v7 = [v6 localizedStringForKey:v5 value:&stru_10013ED08 table:@"Main"];

  return v7;
}

void sub_1000341A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034390(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100034460(_Unwind_Exception *a1)
{
  unsigned int v2 = v1;

  _Unwind_Resume(a1);
}

void sub_100034650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1000346C4(id a1, NSNumber *a2)
{
  unsigned int v2 = a2;
  id v3 = +[EMMailbox predicateForMailboxType:[(NSNumber *)v2 integerValue]];

  return v3;
}

void sub_100034720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100034730(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

void sub_100034794(id a1)
{
  int v1 = objc_alloc_init(MailChangeManager);
  unsigned int v2 = (void *)qword_10016B878;
  qword_10016B878 = (uint64_t)v1;
}

void sub_1000348BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000349B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100034D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100035480()
{
  objc_end_catch();
  JUMPOUT(0x100035584);
}

void sub_100035490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000354BC()
{
}

void sub_10003553C()
{
  JUMPOUT(0x100035584);
}

void sub_100035550()
{
  JUMPOUT(0x100035560);
}

void sub_10003555C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  JUMPOUT(0x100035578);
}

void sub_1000356D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v15 = v14;

  _Unwind_Resume(a1);
}

void sub_10003595C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100035B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100035C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100035CE8(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100035DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100035EB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100035F74(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1000360D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000361A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100036274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100036408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003660C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000366D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000368A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003712C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000374A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000377F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003793C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MailPersistentStorageSaveOperation;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100037B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  __int16 v21 = v19;
  objc_destroyWeak(v20);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100037BD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isFinished])
  {
    int v1 = [WeakRetained taskAssertion];
    [v1 invalidate];

    [WeakRetained setTaskAssertion:0];
  }
}

void sub_100037C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100037DFC(_Unwind_Exception *a1)
{
  unint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_100037FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038018()
{
  id v0 = [MailPersistentStorage alloc];
  id v3 = +[MailPersistentStorage defaultFilePath];
  int v1 = -[MailPersistentStorage initWithFilePath:](v0, "initWithFilePath:");
  unsigned int v2 = (void *)qword_10016B888;
  qword_10016B888 = (uint64_t)v1;
}

void sub_10003808C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000381D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003823C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000382D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003840C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100038514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000385B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100038630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000386D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100038758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000387D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100038880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100038B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038CFC(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  unsigned int v2 = (void *)qword_10016B890;
  qword_10016B890 = (uint64_t)v1;
}

void sub_100038D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100038E20(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  unsigned int v2 = (void *)qword_10016B8A0;
  qword_10016B8A0 = (uint64_t)v1;
}

void sub_100038F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MailXPCServices;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000390FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039118(uint64_t a1, void *a2)
{
  xpc_object_t object = a2;
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_connection)
  {
    BOOL v4 = +[MailXPCServices log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      string = xpc_dictionary_get_string(object, "XPCErrorDescription");
      sub_1000C0E1C((uint64_t)string, buf, v4);
    }

    exit(0);
  }
  [*(id *)(a1 + 32) _registerConnection:object];
}

void sub_100039208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003931C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039330(id a1, Class a2)
{
  if (objc_opt_respondsToSelector())
  {
    [(objc_class *)a2 shutdown];
  }
}

void sub_10003958C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

char *sub_1000395E8(void *a1)
{
  id v1 = a1;
  unsigned int v2 = xpc_copy_description(v1);
  if (v2) {
    unsigned int v2 = (char *)[objc_alloc((Class)NSString) initWithBytesNoCopy:v2 length:strlen(v2) encoding:4 freeWhenDone:1];
  }

  return v2;
}

void sub_10003966C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003967C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  switch((unint64_t)[v3 code])
  {
    case 0x3E8uLL:
    case 0x3EAuLL:
    case 0x3EBuLL:
      id v5 = +[MailXPCServices log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        sub_1000C0E64();
      }

      goto LABEL_5;
    case 0x3E9uLL:
LABEL_5:
      [*(id *)(*(void *)(a1 + 32) + 40) lock];
      [*(id *)(*(void *)(a1 + 32) + 32) removeObject:WeakRetained];
      [*(id *)(*(void *)(a1 + 32) + 40) unlock];
      [WeakRetained stop];
      break;
    case 0x3ECuLL:
      unint64_t v6 = +[MailXPCServices log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        sub_1000C0EA8();
      }

      break;
    default:
      break;
  }
}

void sub_1000397E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_10003A02C(uint64_t a1, int a2, void *a3, void *a4)
{
  xpc_object_t reply = a3;
  id v8 = a4;
  if (reply)
  {
    if (a2) {
      goto LABEL_8;
    }
  }
  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (a2) {
      goto LABEL_8;
    }
  }
  if (!v8)
  {
    id v8 = +[NSError errorWithDomain:MSMailServiceErrorDomain code:1500 userInfo:0];
  }
  id v9 = (const char *)[_MSMailServiceKeyErrorDomain UTF8String];
  id v10 = [v8 domain];
  xpc_dictionary_set_string(reply, v9, (const char *)[v10 UTF8String]);

  xpc_dictionary_set_int64(reply, (const char *)[_MSMailServiceKeyErrorCode UTF8String], (int64_t)objc_msgSend(v8, "code"));
LABEL_8:
  id v11 = +[MailXPCServices log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = *(_xpc_connection_s **)(a1 + 40);
    if (v12) {
      pid_t pid = xpc_connection_get_pid(v12);
    }
    else {
      pid_t pid = -1;
    }
    int64_t int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), (const char *)[_MSMailServiceMessageIndex UTF8String]);
    uint64_t v15 = *(void *)(a1 + 40);
    if (a2) {
      CFStringRef v16 = &stru_10013ED08;
    }
    else {
      CFStringRef v16 = @"un";
    }
    if (a2) {
      CFStringRef v17 = @"reply";
    }
    else {
      CFStringRef v17 = @"error";
    }
    uint64_t v18 = (char *)v8;
    if (a2)
    {
      uint64_t v21 = *(void *)(a1 + 40);
      int64_t v22 = int64;
      id v19 = reply;
      uint64_t v18 = xpc_copy_description(v19);
      if (v18) {
        uint64_t v18 = (char *)[objc_alloc((Class)NSString) initWithBytesNoCopy:v18 length:strlen(v18) encoding:4 freeWhenDone:1];
      }

      int64_t int64 = v22;
      uint64_t v15 = v21;
    }
    *(_DWORD *)buf = 67110402;
    pid_t v24 = pid;
    __int16 v25 = 2048;
    int64_t v26 = int64;
    __int16 v27 = 2048;
    uint64_t v28 = v15;
    __int16 v29 = 2112;
    CFStringRef v30 = v16;
    __int16 v31 = 2112;
    CFStringRef v32 = v17;
    __int16 v33 = 2112;
    __int16 v34 = v18;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "PID %d (%lld) : <connection: %p> handled message %@successfully sending %@ %@", buf, 0x3Au);
    if (a2) {
  }
    }
  long long v20 = *(_xpc_connection_s **)(a1 + 40);
  if (v20) {
    xpc_connection_send_message(v20, reply);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10003A300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A33C(void *a1)
{
  char v2 = objc_opt_respondsToSelector();
  id v3 = (void *)a1[7];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  if (v2)
  {
    uint64_t v6 = a1[6];
    [v3 handleMessage:v4 connectionState:v5 reply:v6];
  }
  else
  {
    id v9 = 0;
    id v10 = 0;
    [v3 handleMessage:v4 connectionState:v5 replyObject:&v10 error:&v9];
    id v7 = v10;
    id v8 = v9;
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void sub_10003A40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A498(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 40) serviceName];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v2];

  if (v3)
  {
    uint64_t v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"MailXPCServices.m", 319, @"multiple services attempted to register for service name '%@'", v2 object file lineNumber description];
  }
  uint64_t v4 = +[MailXPCServices log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "registering class %@ for service name %@", buf, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 40) forKey:v2];
}

void sub_10003A5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003A6EC(void *a1)
{
  id result = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

void sub_10003A7C4(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 32) + 24);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003A86C;
  v2[3] = &unk_10013AEB0;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsWithOptions:1 usingBlock:v2];
}

void sub_10003A858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10003A86C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003AAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10003AAE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_invalid)
    {
      uint64_t v19 = 1001;
    }
    else if (v3 == &_xpc_error_connection_interrupted)
    {
      uint64_t v19 = 1002;
    }
    else
    {
      if (v3 != &_xpc_error_termination_imminent)
      {
        id v12 = v3;
        id v13 = xpc_copy_description(v12);
        if (v13)
        {
          id v13 = (char *)[objc_alloc((Class)NSString) initWithBytesNoCopy:v13 length:strlen(v13) encoding:4 freeWhenDone:1];

          if (v13)
          {
            NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
            pid_t v24 = v13;
            int v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
LABEL_19:
            long long v20 = +[NSError errorWithDomain:@"XPCConnectionErrorDomain" code:1000 userInfo:v14];

            goto LABEL_20;
          }
        }
        else
        {
        }
        int v14 = 0;
        goto LABEL_19;
      }
      uint64_t v19 = 1003;
    }
    long long v20 = +[NSError errorWithDomain:@"XPCConnectionErrorDomain" code:v19 userInfo:0];
LABEL_20:
    [*(id *)(a1 + 32) handleError:v20];

    goto LABEL_21;
  }
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v15 = [objc_alloc((Class)MFTaskAssertion) initWithName:@"com.apple.mobilemail.services.connection"];
    CFStringRef v16 = *(void **)(a1 + 32);
    CFStringRef v17 = (void *)v16[7];
    uint64_t v18 = v16[3];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10003AE7C;
    v21[3] = &unk_10013AF00;
    int64_t v22 = v16;
    [v17 _dispatchMessage:v3 onQueue:v18 connectionState:v22 completion:v21];
  }
  else
  {
    uint64_t v6 = +[NSAssertionHandler currentHandler];
    uint64_t v9 = a1 + 32;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v9 + 8);
    id v10 = v3;
    id v11 = xpc_copy_description(v10);
    if (v11) {
      id v11 = (char *)[objc_alloc((Class)NSString) initWithBytesNoCopy:v11 length:strlen(v11) encoding:4 freeWhenDone:1];
    }

    [v6 handleFailureInMethod:v8, v7, @"MailXPCServices.m", 408, @"unexpected type encountered %@", v11 object file lineNumber description];
  }
LABEL_21:
}

void sub_10003ADFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003AE7C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if ((a2 & 1) == 0)
  {
    uint64_t v7 = +[NSDictionary dictionaryWithObject:v5 forKey:NSUnderlyingErrorKey];
    id v8 = +[NSError errorWithDomain:@"XPCConnectionErrorDomain" code:1004 userInfo:v7];

    objc_msgSend(*(id *)(a1 + 32), "handleError:");
    id v5 = v8;
  }
}

void sub_10003AF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003AFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFXPCConnection;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10003B054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003B0C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003B234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t start()
{
  return 0;
}

void sub_10003B5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B7EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003BA14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003BACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003BEDC(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10003C034(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10003C3A0(_Unwind_Exception *a1)
{
  id v10 = v8;

  _Unwind_Resume(a1);
}

void sub_10003C4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10003C560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C5C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C6E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C7FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003C8EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003CBD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003CC30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Flags to set: %@ Flags to clear: %@" arguments:&a9];
  id v10 = MFLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Warning MCSAssert: %@", buf, 0xCu);
  }
}

void sub_10003CCFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10003D20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10003D688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D7C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003DA14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003DAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003DB48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003DCC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003DEAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003DFA4(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10003E01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E0C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E214(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10003E2C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E3BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E46C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E6C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E86C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003E994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003EF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_10003F10C(id a1, ECMessageFlagChangeBuilder *a2)
{
}

void sub_10003F2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F3C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003F544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10003F568(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v17 = a3;
  id v16 = [v17 mutableCopy];
  [v16 minusSet:*(void *)(a1 + 32)];
  if ([v16 count])
  {
    id v5 = [v16 allObjects];
    [v14 messagesWereDeleted:v5];
  }
  uint64_t v6 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v17, "count", v14));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v17 allObjects];
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v10);
        id v12 = *(void **)(a1 + 40);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10003F800;
        v18[3] = &unk_10013AFD8;
        v18[4] = v11;
        id v13 = [v12 objectsPassingTest:v18];
        [v6 unionSet:v13];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  [v17 removeAllObjects];
  [v17 unionSet:v6];
}

void sub_10003F788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

BOOL sub_10003F800(uint64_t a1, void *a2)
{
  id v3 = [a2 messageIDHeader];
  uint64_t v4 = [*(id *)(a1 + 32) messageIDHeader];
  BOOL v5 = [v3 compare:v4] == 0;

  return v5;
}

void sub_10003F868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FA08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FB74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FD40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003FEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10003FF20(uint64_t a1, void *a2)
{
  id v20 = a2;
  long long v21 = +[NSMutableArray array];
  char v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v30 = [v20 count];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "performRecentsSearch results: %ld", buf, 0xCu);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = v20;
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v25;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v8 = [v7 metadata];
        uint64_t v9 = off_100169CB8[0]();
        id v10 = [v8 objectForKey:v9];

        if (v10)
        {
          uint64_t v11 = +[NSURL URLWithString:v10];
          id v12 = objc_msgSend(v11, "em_messageIDHeader");
          uint64_t v13 = MFStringHashForMessageIDHeader();
          if (v13 && [*(id *)(a1 + 32) containsIndex:v13]) {
            [v21 addObject:v7];
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }

  id v14 = MFLogGeneral();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [v21 count];
    *(_DWORD *)buf = 134217984;
    id v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%ld recents to remove", buf, 0xCu);
  }

  if ([v21 count])
  {
    id v16 = *(void **)(a1 + 40);
    id v23 = 0;
    unsigned __int8 v17 = [v16 removeRecentContacts:v21 error:&v23];
    id v18 = v23;
    if ((v17 & 1) == 0)
    {
      long long v19 = MFLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#Warning failed to remove MessageAddressScanner recents: %@", buf, 0xCu);
      }
    }
  }
}

void sub_100040224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10004062C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10004084C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040934(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  char v2 = (void *)qword_10016B8D8;
  qword_10016B8D8 = (uint64_t)v1;
}

void sub_100040ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MessageAddressScanner;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100040B2C(uint64_t a1)
{
  ABAddressBookUnregisterExternalChangeCallback(*(ABAddressBookRef *)(a1 + 40), (ABExternalChangeCallback)sub_100040B84, *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  char v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

id sub_100040B84(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 handleAddressBookChange];
}

void sub_100040D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100040DA4(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 32) flush];
  *(unsigned char *)(*(void *)(a1 + 32) + 40) &= ~1u;
  return result;
}

void sub_100040FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100040FE8(uint64_t a1)
{
}

void sub_100041148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100041200(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) userInfo];
  char v2 = [v6 objectForKeyedSubscript:MailMessageStoreChangedFlagsKey];
  id v3 = [v6 objectForKeyedSubscript:MailMessageStoreMessageKey];
  id v4 = [v2 objectForKeyedSubscript:MessageIsDeleted];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (v5) {
    [*(id *)(a1 + 40) _scheduleRemovalOfDetectedAddressesInMessages:v3];
  }
}

void sub_1000412D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000413A0(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) userInfo];
  char v2 = [v3 objectForKeyedSubscript:MailMessageStoreMessageKey];
  [*(id *)(a1 + 40) _scheduleRemovalOfDetectedAddressesInMessages:v2];
}

void sub_100041414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000414AC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) addressBook];

  ABAddressBookRevert(v1);
}

void sub_1000415C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000415E0(uint64_t a1)
{
  char v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) messageIDHash];
    CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    *(_DWORD *)buf = 134218240;
    id v20 = v3;
    __int16 v21 = 2048;
    CFAbsoluteTime v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "#BodyLoading scanning summary for message %lld - enqueued %f secs ago", buf, 0x16u);
  }

  if (DDScannerScanString())
  {
    unsigned __int8 v5 = (void *)DDScannerCopyResultsWithOptions();
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v5 count];
      id v8 = [*(id *)(a1 + 32) messageIDHash];
      *(_DWORD *)buf = 134218240;
      id v20 = v7;
      __int16 v21 = 2048;
      CFAbsoluteTime v22 = *(double *)&v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#BodyLoading found %ld DD results for message %lld", buf, 0x16u);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v12);
          if (DDResultGetCategory() == 3) {
            objc_msgSend(*(id *)(a1 + 48), "_addAddressDetectorResult:forMessage:", v13, *(void *)(a1 + 32), (void)v14);
          }
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

void sub_1000417FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100041A48(_Unwind_Exception *a1)
{
  id v10 = v6;

  _Unwind_Resume(a1);
}

Class sub_100041B50()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  Class result = objc_getClass("CRSearchQuery");
  qword_10016B930 = (uint64_t)result;
  off_100169CA8[0] = (uint64_t (*)())sub_100041BB4;
  return result;
}

id sub_100041BB4()
{
  return (id)qword_10016B930;
}

void sub_100041BC0(id a1)
{
  qword_10016B938 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreRecents.framework/CoreRecents", 2);
  if (!qword_10016B938) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/CoreRecents.framework/CoreRecents");
  }
}

id sub_100041BFC()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  id v0 = (id *)dlsym((void *)qword_10016B938, "CRRecentsDomainMaps");
  objc_storeStrong((id *)&qword_10016B8E8, *v0);
  off_100169CB0[0] = (uint64_t (*)())sub_100041C90;
  id v1 = (void *)qword_10016B8E8;

  return v1;
}

id sub_100041C90()
{
  return (id)qword_10016B8E8;
}

id sub_100041C9C()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  id v0 = (id *)dlsym((void *)qword_10016B938, "CRRecentContactMetadataReferenceURL");
  objc_storeStrong((id *)&qword_10016B908, *v0);
  off_100169CB8[0] = (uint64_t (*)())sub_100041D30;
  id v1 = (void *)qword_10016B908;

  return v1;
}

id sub_100041D30()
{
  return (id)qword_10016B908;
}

id sub_100041D3C()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  id v0 = (id *)dlsym((void *)qword_10016B938, "CRRecentContactMetadataFromAddress");
  objc_storeStrong((id *)&qword_10016B918, *v0);
  off_100169CC0[0] = (uint64_t (*)())sub_100041DD0;
  id v1 = (void *)qword_10016B918;

  return v1;
}

id sub_100041DD0()
{
  return (id)qword_10016B918;
}

id sub_100041DDC()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  id v0 = (id *)dlsym((void *)qword_10016B938, "CRAddressKindEmail");
  objc_storeStrong((id *)&qword_10016B8F0, *v0);
  off_100169CC8[0] = (uint64_t (*)())sub_100041E70;
  id v1 = (void *)qword_10016B8F0;

  return v1;
}

id sub_100041E70()
{
  return (id)qword_10016B8F0;
}

id sub_100041E7C()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  id v0 = (id *)dlsym((void *)qword_10016B938, "CRRecentContactMetadataFromAddressKind");
  objc_storeStrong((id *)&qword_10016B920, *v0);
  off_100169CD0[0] = (uint64_t (*)())sub_100041F10;
  id v1 = (void *)qword_10016B920;

  return v1;
}

id sub_100041F10()
{
  return (id)qword_10016B920;
}

id sub_100041F1C()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  id v0 = (id *)dlsym((void *)qword_10016B938, "CRRecentContactMetadataFromDisplayName");
  objc_storeStrong((id *)&qword_10016B928, *v0);
  off_100169CD8[0] = (uint64_t (*)())sub_100041FB0;
  id v1 = (void *)qword_10016B928;

  return v1;
}

id sub_100041FB0()
{
  return (id)qword_10016B928;
}

id sub_100041FBC()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  id v0 = (id *)dlsym((void *)qword_10016B938, "CRRecentContactMetadataFrom");
  objc_storeStrong((id *)&qword_10016B910, *v0);
  off_100169CE0[0] = (uint64_t (*)())sub_100042050;
  id v1 = (void *)qword_10016B910;

  return v1;
}

id sub_100042050()
{
  return (id)qword_10016B910;
}

id sub_10004205C()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  id v0 = (id *)dlsym((void *)qword_10016B938, "CRRecentContactMetadataSubject");
  objc_storeStrong((id *)&qword_10016B900, *v0);
  off_100169CE8[0] = (uint64_t (*)())sub_1000420F0;
  id v1 = (void *)qword_10016B900;

  return v1;
}

id sub_1000420F0()
{
  return (id)qword_10016B900;
}

double sub_1000420FC()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  double result = *(double *)dlsym((void *)qword_10016B938, "CRRecentWeightMailReceivedTrustedAddress");
  qword_10016B948 = *(void *)&result;
  off_100169CF0[0] = (uint64_t (*)())sub_10004216C;
  return result;
}

double sub_10004216C()
{
  return *(double *)&qword_10016B948;
}

double sub_100042178()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  double result = *(double *)dlsym((void *)qword_10016B938, "CRRecentWeightMailReceivedAddress");
  qword_10016B950 = *(void *)&result;
  off_100169CF8[0] = (uint64_t (*)())sub_1000421E8;
  return result;
}

double sub_1000421E8()
{
  return *(double *)&qword_10016B950;
}

Class sub_1000421F4()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  Class result = objc_getClass("CRRecentContactsLibrary");
  qword_10016B958 = (uint64_t)result;
  off_100169D00[0] = (uint64_t (*)())sub_100042258;
  return result;
}

id sub_100042258()
{
  return (id)qword_10016B958;
}

id sub_100042264()
{
  if (qword_10016B940 != -1) {
    dispatch_once(&qword_10016B940, &stru_10013B098);
  }
  id v0 = (id *)dlsym((void *)qword_10016B938, "CRAddressKindMapLocation");
  objc_storeStrong((id *)&qword_10016B8F8, *v0);
  off_100169D08 = (uint64_t (*)())sub_1000422F8;
  id v1 = (void *)qword_10016B8F8;

  return v1;
}

id sub_1000422F8()
{
  return (id)qword_10016B8F8;
}

void sub_1000423A4(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  char v2 = (void *)qword_10016B960;
  qword_10016B960 = (uint64_t)v1;
}

void sub_100042414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004250C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  char v2 = (void *)qword_10016B970;
  qword_10016B970 = (uint64_t)v1;
}

void sub_10004257C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100042680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100042788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000428C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100042940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100042DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100042EA4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100042EB4(uint64_t a1)
{
}

void sub_100042EBC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  v106 = v7;
  v107 = v6;
  if (v6)
  {
    v108 = [v6 content];
    id v8 = [v108 count];
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v9) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v8 == 0;
    }
    if (!v10)
    {
      unint64_t v11 = 1;
      while (![0 length])
      {
        id v12 = [v108 objectAtIndex:v11 - 1];
        uint64_t v13 = +[MessageBodyLoader log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v11 - 1;
          *(_WORD *)&unsigned char buf[12] = 2114;
          *(void *)&buf[14] = v12;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Content[%lu]: %{public}@", buf, 0x16u);
        }

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v14 = [v12 htmlData];
          long long v15 = [v12 preferredCharacterSet];
          MFEncodingForCharset();
          uint64_t v16 = MFCreateStringWithData();
          uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
          id v18 = *(void **)(v17 + 40);
          *(void *)(v17 + 40) = v16;

          long long v19 = +[MessageBodyLoader log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            CFStringRef v21 = @"nil";
            v100 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            if (v100)
            {
              +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v100 length]);
              CFAbsoluteTime v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
              CFStringRef v21 = v4;
            }
            CFStringRef v22 = @"nil";
            if (v14)
            {
              +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 length]);
              id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
              CFStringRef v22 = v3;
            }
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v21;
            *(_WORD *)&unsigned char buf[12] = 2114;
            *(void *)&buf[14] = v22;
            _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Creating bodyHTML: bodyHTML=%{public}@, data=%{public}@", buf, 0x16u);
            if (v14) {

            }
            if (v100) {
          }
            }
        }
        id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        if (!v9 && v11++ < (unint64_t)v8) {
          continue;
        }
        goto LABEL_28;
      }
      id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
LABEL_28:
    if ([v9 length])
    {
      id v23 = +[NSUserDefaults standardUserDefaults];
      unsigned int v24 = [v23 BOOLForKey:@"LogPreviewGenerationTime"];

      +[NSDate timeIntervalSinceReferenceDate];
      double v26 = v25;
      id v27 = [objc_alloc((Class)ECMessageBodyHTMLParser) initWithHTML:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      id v28 = objc_alloc_init((Class)ECMessageBodyOriginalTextSubparser);
      [v27 addSubparser:v28];
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      char v128 = 0;
      id v29 = [v27 newStringAccumulatorWithOptions:17 lengthLimit:500];
      v116[0] = _NSConcreteStackBlock;
      v116[1] = 3221225472;
      v116[2] = sub_100043FD4;
      v116[3] = &unk_10013B0C0;
      id v30 = v29;
      id v117 = v30;
      v118 = buf;
      [v28 setFoundTextBlock:v116];
      v114[0] = _NSConcreteStackBlock;
      v114[1] = 3221225472;
      v114[2] = sub_100044090;
      v114[3] = &unk_10013B0E8;
      id v31 = v30;
      id v115 = v31;
      [v28 setFoundWhitespaceBlock:v114];
      unsigned int v32 = [v27 parse];
      if (v32)
      {
        __int16 v33 = [v31 accumulatedString];
        __int16 v34 = +[MessageBodyLoader log];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          if (v33)
          {
            +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v33 length]);
            id v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v35 = @"nil";
          }
          *(_DWORD *)v120 = 138543362;
          double v121 = *(double *)&v35;
          _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Parsed summary=%{public}@", v120, 0xCu);
          if (v33) {
        }
          }
      }
      else
      {
        __int16 v34 = +[MessageBodyLoader log];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          long long v36 = [v27 parserError];
          id v37 = objc_msgSend(v36, "ef_publicDescription");
          sub_1000C0F98(v37, v126, v34, v36);
        }
        __int16 v33 = 0;
      }

      +[NSDate timeIntervalSinceReferenceDate];
      double v39 = v38;
      if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
        char v40 = 0;
      }
      else {
        char v40 = v32;
      }
      BOOL v41 = (v40 & 1) == 0 && [v33 length] == 0;
      double v42 = 0.0;
      if ((v41 | v24) == 1)
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v44 = v43;
        long long v45 = +[MFHTMLParser plainTextFromHTML:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) limit:500];
        uint64_t v46 = (void *)MFCreateStringByCondensingWhitespace();
        long long v47 = v46;
        if (v41)
        {
          id v48 = v46;

          long long v49 = +[MessageBodyLoader log];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            if (v48)
            {
              +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v48 length]);
              CFStringRef v98 = (const __CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              CFStringRef v98 = @"nil";
            }
            v105 = (__CFString *)v98;
            *(_DWORD *)v120 = 138543362;
            double v121 = *(double *)&v98;
            _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Parsed summary (old method)=%{public}@", v120, 0xCu);
            if (v48) {
          }
            }
        }
        else
        {
          id v48 = v33;
        }
        +[NSDate timeIntervalSinceReferenceDate];
        double v54 = v53;

        double v42 = v54 - v44;
      }
      else
      {
        id v48 = v33;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v48);
      if (v24)
      {
        uint64_t v55 = +[MessageBodyLoader log];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          id v56 = [v48 length];
          if ((unint64_t)v56 >= 0x50) {
            uint64_t v57 = 80;
          }
          else {
            uint64_t v57 = (uint64_t)v56;
          }
          long long v58 = [v48 substringToIndex:v57];
          *(_DWORD *)v120 = 134218498;
          double v121 = v42;
          __int16 v122 = 2048;
          double v123 = v39 - v26;
          __int16 v124 = 2112;
          v125 = v58;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%0.4fs\t%0.4fs\t\t%@", v120, 0x20u);
        }
      }

      _Block_object_dispose(buf, 8);
    }
    if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length])
    {
      long long v59 = [v107 context];
      v104 = [v59 messageBody];

      v102 = [v104 topLevelPart];
      long long v60 = +[MessageBodyLoader attachmentManager];
      uint64_t v61 = [v102 attachmentURLs];
      v101 = [v60 attachmentsForURLs:v61 error:0];

      id v62 = objc_alloc_init((Class)NSMutableArray);
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v63 = v101;
      id v64 = [v63 countByEnumeratingWithState:&v110 objects:v119 count:16];
      if (v64)
      {
        uint64_t v65 = *(void *)v111;
        do
        {
          for (i = 0; i != v64; i = (char *)i + 1)
          {
            if (*(void *)v111 != v65) {
              objc_enumerationMutation(v63);
            }
            id v67 = *(void **)(*((void *)&v110 + 1) + 8 * i);
            if (![v67 isPass]) {
              goto LABEL_69;
            }
            v68 = +[MessageBodyLoader attachmentManager];
            v69 = [v67 url];
            v70 = [v68 attachmentForURL:v69 error:0];

            __int16 v71 = [v70 passWithError:0];
            v72 = [v71 localizedName];

            if (!v72)
            {
LABEL_69:
              v72 = [v67 filenameStrippingZipIfNeededUseApplications:0];
            }
            if ([v72 length]) {
              [v62 addObject:v72];
            }
          }
          id v64 = [v63 countByEnumeratingWithState:&v110 objects:v119 count:16];
        }
        while (v64);
      }

      if (![v63 count])
      {
        v73 = [v102 firstChildPart];
        if (v73)
        {
          unint64_t v74 = 0;
          do
          {
            v75 = [v73 disposition];
            unsigned int v76 = [v75 isEqualToString:@"attachment"];

            if (v76)
            {
              v77 = [v73 subtype];
              unsigned __int8 v78 = [v77 isEqualToString:@"pkcs7-signature"];

              if ((v78 & 1) == 0)
              {
                v79 = [v73 dispositionParameterForKey:@"filename"];
                if ([v79 length]) {
                  [v62 addObject:v79];
                }
              }
            }
            v80 = [v73 nextSiblingPart];

            if (v74 > 0x13) {
              break;
            }
            ++v74;
            v73 = v80;
          }
          while (v80);
        }
      }
      id v81 = [v62 count];
      if ((unint64_t)v81 < 2)
      {
        if (v81 != (id)1)
        {
          uint64_t v95 = *(void *)(*(void *)(a1 + 40) + 8);
          v82 = *(void **)(v95 + 40);
          *(void *)(v95 + 40) = 0;
          goto LABEL_92;
        }
        v82 = MFLookupLocalizedString();
        id v90 = objc_alloc((Class)NSString);
        v91 = [v62 objectAtIndex:0];
        id v92 = objc_msgSend(v90, "initWithFormat:", v82, v91);
        uint64_t v93 = *(void *)(*(void *)(a1 + 40) + 8);
        v94 = *(void **)(v93 + 40);
        *(void *)(v93 + 40) = v92;

        v89 = +[MessageBodyLoader log];
        if (!os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG)
          || ((v99 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) != 0
            ? (+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v99 length]), v97 = (__CFString *)objc_claimAutoreleasedReturnValue()): (v97 = @"nil"), *(_DWORD *)buf = 138543362, *(void *)&uint8_t buf[4] = v97, _os_log_debug_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "bodyHTML from attachment=%{public}@", buf, 0xCu), !v99))
        {
LABEL_87:

LABEL_92:
          goto LABEL_93;
        }
      }
      else
      {
        v82 = MFLookupLocalizedString();
        id v83 = objc_alloc((Class)NSString);
        v84 = MFLookupLocalizedString();
        v85 = [v62 componentsJoinedByString:v84];
        id v86 = objc_msgSend(v83, "initWithFormat:", v82, v85);
        uint64_t v87 = *(void *)(*(void *)(a1 + 40) + 8);
        v88 = *(void **)(v87 + 40);
        *(void *)(v87 + 40) = v86;

        v89 = +[MessageBodyLoader log];
        if (!os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_87;
        }
        v96 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        if (v96)
        {
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v96 length]);
          v97 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v97 = @"nil";
        }
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v97;
        _os_log_debug_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "bodyHTML from attachments=%{public}@", buf, 0xCu);
        if (!v96) {
          goto LABEL_87;
        }
      }

      goto LABEL_87;
    }
  }
  else
  {
    if (v7)
    {
      NSErrorUserInfoKey v129 = NSUnderlyingErrorKey;
      id v130 = v7;
      v108 = +[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
    }
    else
    {
      v108 = 0;
    }
    long long v50 = +[MessageBodyLoader log];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      long long v51 = objc_msgSend(v106, "ef_publicDescription");
      sub_1000C0F40(v51, buf, v50);
    }

    long long v52 = *(void **)(a1 + 32);
    v103 = +[MFError errorWithDomain:MFMessageErrorDomain code:1030 localizedDescription:0 title:0 userInfo:v108];
    objc_msgSend(v52, "setError:");
  }
LABEL_93:
}

void sub_100043CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_100043FD4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = v7;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    [*(id *)(a1 + 32) appendCustomEntityWithTag:0 stringRepresentation:@" "];
  }
  else if (![v7 valueForAttributes:64])
  {
    [*(id *)(a1 + 32) appendInnerTextWithConsumableNode:v8];
  }
  *a4 = [*(id *)(a1 + 32) isFull];
}

void sub_10004407C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100044090(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendString:@" "];
}

void sub_1000440F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1000443FC(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([v4 isPluggedIn]) {
    [WeakRetained resume];
  }
}

void sub_100044464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004458C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  BOOL v10 = v9;

  a9.super_class = (Class)MessageBodyLoader;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100044708(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 32) + 104))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    id v2 = +[MFNetworkController sharedInstance];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isDataAvailable];
  }
}

void sub_100044790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100044964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100044DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100044E7C(uint64_t a1)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 120) & 2) != 0)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = *(void *)(a1 + 32);
    unsigned __int8 v5 = [*(id *)(a1 + 40) object];
    [v3 removeObserver:v4 name:MonitoredActivityEnded object:v5];

    id v6 = *(void **)(a1 + 32);
    [v6 _getNextClientOrMessage];
  }
  else
  {
    os_log_t v1 = +[MessageBodyLoader log];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1000C102C();
    }
  }
}

void sub_100044F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045010(uint64_t a1)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 120) & 2) != 0)
  {
    id v3 = [*(id *)(a1 + 40) userInfo];
    uint64_t v4 = [v3 objectForKey:MonitoredActivityInvocation];
    os_log_t v1 = [v4 target];

    unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) object];
    [v5 removeObserver:v6 name:MonitoredActivityEnded object:v7];

    if (!*(void *)(*(void *)(a1 + 32) + 48))
    {
      uint64_t v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"MessageBodyLoader.m" lineNumber:515 description:@"should have a current monitor at this point."];
    }
    id v8 = [v1 client];
    id v9 = [v8 message];

    if (v9) {
      [*(id *)(a1 + 32) _recordStats:v9];
    }
    BOOL v10 = +[MessageBodyLoader signpostLog];
    unint64_t v11 = (char *)[v1 signpostID];
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v11, "MBL CLIENT LOAD", (const char *)&unk_10012893E, v17, 2u);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 48);
    *(void *)(v12 + 48) = 0;

    uint64_t v14 = *(void *)(a1 + 32);
    long long v15 = *(void **)(v14 + 136);
    *(void *)(v14 + 136) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 120) &= ~2u;
    *(unsigned char *)(*(void *)(a1 + 32) + 120) |= 4u;
    [*(id *)(a1 + 32) _tryProcessingQueues];
  }
  else
  {
    os_log_t v1 = +[MessageBodyLoader log];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1000C1060();
    }
  }
}

void sub_10004523C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045344(uint64_t a1)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 120) & 2) != 0)
  {
    id v3 = [*(id *)(a1 + 40) userInfo];
    uint64_t v4 = [v3 objectForKey:MonitoredActivityInvocation];
    os_log_t v1 = [v4 target];

    unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) object];
    [v5 removeObserver:v6 name:MonitoredActivityEnded object:v7];

    if (!*(void *)(*(void *)(a1 + 32) + 48))
    {
      id v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"MessageBodyLoader.m" lineNumber:543 description:@"should have a current monitor at this point."];
    }
    id v8 = [v1 message];
    [*(id *)(a1 + 32) _recordStats:v8];
    id v9 = +[MessageBodyLoader signpostLog];
    BOOL v10 = (char *)[v1 signpostID];
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)long long v19 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v10, "MBL MESSAGE LOAD", (const char *)&unk_10012893E, v19, 2u);
    }

    if ([*(id *)(*(void *)(a1 + 32) + 48) shouldCancel])
    {
      [*(id *)(*(void *)(a1 + 32) + 16) insertObject:v8 atIndex:0];
      [*(id *)(*(void *)(a1 + 32) + 24) addObject:v8];
      unint64_t v11 = *(void **)(*(void *)(a1 + 32) + 32);
      uint64_t v12 = [v8 mailbox];
      if (v12) {
        uint64_t v13 = (__CFString *)v12;
      }
      else {
        uint64_t v13 = @"No Mailbox";
      }
      [v11 addObject:v13];
    }
    uint64_t v14 = *(void *)(a1 + 32);
    long long v15 = *(void **)(v14 + 48);
    *(void *)(v14 + 48) = 0;

    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(v16 + 136);
    *(void *)(v16 + 136) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 120) &= ~2u;
    *(unsigned char *)(*(void *)(a1 + 32) + 120) |= 4u;
    [*(id *)(a1 + 32) _tryProcessingQueues];
  }
  else
  {
    os_log_t v1 = +[MessageBodyLoader log];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1000C1094();
    }
  }
}

void sub_1000455C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000456C4(uint64_t a1)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 120) & 2) != 0)
  {
    id v3 = [*(id *)(a1 + 40) userInfo];
    uint64_t v4 = [v3 objectForKey:MonitoredActivityInvocation];
    os_log_t v1 = [v4 target];

    unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) object];
    uint64_t v8 = MonitoredActivityEnded;
    [v5 removeObserver:v6 name:MonitoredActivityEnded object:v7];

    if (*(void *)(*(void *)(a1 + 32) + 48))
    {
      __int16 v34 = +[NSAssertionHandler currentHandler];
      [v34 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"MessageBodyLoader.m" lineNumber:573 description:@"should not have a current monitor at this point."];
    }
    id v9 = [v1 nextClient];

    if (v9)
    {
      BOOL v10 = [_MBLLoadForClientJob alloc];
      unint64_t v11 = [v1 nextClient];
      id v12 = [(_MBLLoadForClientJob *)v10 initForClient:v11 forMBLMailbox:*(void *)(a1 + 32)];

      uint64_t v13 = [v1 nextClient];
      uint64_t v14 = [v13 message];
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void **)(v15 + 136);
      *(void *)(v15 + 136) = v14;

      uint64_t v17 = +[MessageBodyLoader signpostLog];
      id v18 = (char *)[v12 signpostID];
      long long v19 = "_clientLoadFinished:";
      if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        id v20 = [*(id *)(*(void *)(a1 + 32) + 136) messageID];
        int v35 = 138412290;
        long long v36 = v20;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v18, "MBL CLIENT LOAD", "Message=%@", (uint8_t *)&v35, 0xCu);
      }
    }
    else
    {
      CFStringRef v21 = [v1 nextMessage];

      if (!v21) {
        goto LABEL_16;
      }
      CFStringRef v22 = [_MBLLoadMessageJob alloc];
      id v23 = [v1 nextMessage];
      id v12 = [(_MBLLoadMessageJob *)v22 initForMessage:v23 forMBLMailbox:*(void *)(a1 + 32)];

      uint64_t v24 = [v1 nextMessage];
      uint64_t v25 = *(void *)(a1 + 32);
      double v26 = *(void **)(v25 + 136);
      *(void *)(v25 + 136) = v24;

      uint64_t v17 = +[MessageBodyLoader signpostLog];
      id v27 = (char *)[v12 signpostID];
      long long v19 = "_messageLoadFinished:";
      if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        id v28 = [*(id *)(*(void *)(a1 + 32) + 136) messageID];
        int v35 = 138412290;
        long long v36 = v28;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v27, "MBL MESSAGE LOAD", "Message=%@", (uint8_t *)&v35, 0xCu);
      }
    }

    if (v12)
    {
      id v29 = +[MFMonitoredInvocation mf_invocationWithSelector:"run" target:v12];
      uint64_t v30 = [v29 monitor];
      uint64_t v31 = *(void *)(a1 + 32);
      unsigned int v32 = *(void **)(v31 + 48);
      *(void *)(v31 + 48) = v30;

      [*(id *)(*(void *)(a1 + 32) + 48) setCanBeCancelled:1];
      [*(id *)(*(void *)(a1 + 32) + 48) setPriority:6];
      __int16 v33 = +[NSNotificationCenter defaultCenter];
      [v33 addObserver:*(void *)(a1 + 32) selector:v19 name:v8 object:*(void *)(*(void *)(a1 + 32) + 48)];

      [*(id *)(*(void *)(a1 + 32) + 72) addInvocation:v29];
      goto LABEL_17;
    }
LABEL_16:
    *(unsigned char *)(*(void *)(a1 + 32) + 120) &= ~2u;
    [*(id *)(a1 + 32) _tryProcessingQueues];
    goto LABEL_17;
  }
  os_log_t v1 = +[MessageBodyLoader log];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_1000C10C8();
  }
LABEL_17:
}

void sub_100045B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100045C88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:MailMessageStoreMessageKey];

  objc_msgSend(*(id *)(a1 + 40), "addMessages_nts:", v3);
}

void sub_100045CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100045E60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100045F30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeNewMessages_nts:", *(void *)(a1 + 40));
}

id sub_100045FD4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObjectsInArray:*(void *)(a1 + 40)];
}

void sub_100046078(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:MailMessageStoreMessageKey];

  if ([v3 count]) {
    objc_msgSend(*(id *)(a1 + 40), "_removeNewMessages_nts:", v3);
  }
}

void sub_1000460F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000461B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:MailMessageStoreMessageKey];

  uint64_t v4 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        BOOL v10 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "member:", v9, (void)v12);
        unint64_t v11 = v10;
        if (v10)
        {
          [v10 setMutableInfoFromMessage:v9];
          if (([v11 messageFlags] & 2) != 0) {
            [v4 addObject:v9];
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "_removeNewMessages_nts:", v4);
}

void sub_100046350(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100046438(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_nts_insertClient:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 120) |= 4u;
  id v2 = *(void **)(a1 + 32);

  return [v2 _start];
}

id sub_100046520(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_nts_removeClient:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 120) |= 4u;
  id v2 = *(void **)(a1 + 32);

  return [v2 _start];
}

void sub_100046758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000467B4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_getAssociatedObject(v3, off_100169D10);
  id v6 = objc_getAssociatedObject(v4, off_100169D10);
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"priority"];
    id v8 = [v7 integerValue];

    if (v6)
    {
LABEL_3:
      uint64_t v9 = [v6 objectForKeyedSubscript:@"priority"];
      id v10 = [v9 integerValue];

      goto LABEL_6;
    }
  }
  else
  {
    id v8 = [v3 priority];
    if (v6) {
      goto LABEL_3;
    }
  }
  id v10 = [v4 priority];
LABEL_6:
  if ((uint64_t)v8 <= (uint64_t)v10)
  {
    if ((uint64_t)v8 < (uint64_t)v10) {
      goto LABEL_9;
    }
    if (v5)
    {
      long long v13 = [v5 objectForKeyedSubscript:@"ordering"];
      [v13 doubleValue];
      double v15 = v14;

      if (v6)
      {
LABEL_13:
        uint64_t v16 = [v6 objectForKeyedSubscript:@"ordering"];
        [v16 doubleValue];
        double v18 = v17;

LABEL_16:
        if (v15 > v18) {
          goto LABEL_7;
        }
        if (v15 >= v18)
        {
          if (v3 >= v4)
          {
            uint64_t v11 = v3 > v4;
            goto LABEL_10;
          }
          goto LABEL_7;
        }
LABEL_9:
        uint64_t v11 = 1;
        goto LABEL_10;
      }
    }
    else
    {
      [v3 ordering];
      double v15 = v19;
      if (v6) {
        goto LABEL_13;
      }
    }
    [v4 ordering];
    double v18 = v20;
    goto LABEL_16;
  }
LABEL_7:
  uint64_t v11 = -1;
LABEL_10:

  return v11;
}

void sub_100046958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000469A8()
{
}

void sub_1000469B0()
{
}

void sub_100046AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100046C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100046C20(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = @"ordering";
  [v3 ordering];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v7[1] = @"priority";
  v8[0] = v4;
  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 priority]);
  v8[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  objc_setAssociatedObject(v3, off_100169D10, v6, (void *)0x301);
  objc_msgSend(*(id *)(a1 + 32), "ef_insertObject:usingSortFunction:context:allowDuplicates:", v3, sub_1000467B4, 0, 0);
}

void sub_100046D50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100046DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100046F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100047050(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addMessages_nts:", *(void *)(a1 + 40));
}

id sub_100047128(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_nts_isProcessingMessage:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100047228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100047248(uint64_t a1, void *a2)
{
  id v3 = [a2 message];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_10004728C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047334(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 56))
  {
    id v2 = objc_alloc_init((Class)NSCountedSet);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = v2;
  }
  id v9 = [*(id *)(a1 + 40) mailbox];
  if (!objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "countForObject:"))
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:*(void *)(a1 + 32) selector:"_messagesAdded:" name:MailMessageStoreMessagesAdded object:*(void *)(a1 + 40)];
  }
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 56);
  id v8 = [v6 mailbox];
  [v7 addObject:v8];
}

void sub_100047414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000474D0(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) mailbox];
  if (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "countForObject:") == (id)1)
  {
    id v2 = +[NSNotificationCenter defaultCenter];
    [v2 removeObserver:*(void *)(a1 + 40) name:MailMessageStoreMessagesAdded object:*(void *)(a1 + 32)];
  }
  [*(id *)(*(void *)(a1 + 40) + 56) removeObject:v3];
}

void sub_100047570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100047628(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 120) |= 4u;
    id v6 = *(void **)(a1 + 32);
    return [v6 _start];
  }
  return result;
}

void sub_100047714(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void -[MessageBodyLoader _blockingMessage](MessageBodyLoader *self, SEL a2)
{
}

void sub_100047A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100047BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100047CD4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 120) |= 4u;
  return [*(id *)(a1 + 32) _start];
}

void sub_100047D60(uint64_t a1)
{
  --*(_DWORD *)(*(void *)(a1 + 32) + 104);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 104);
  if ((v3 & 0x80000000) == 0)
  {
    if (v3) {
      return;
    }
LABEL_7:
    *(unsigned char *)(v2 + 120) |= 4u;
    [*(id *)(a1 + 32) _start];
    return;
  }
  id v4 = +[MessageBodyLoader log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000C1128();
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 104) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 104)) {
    goto LABEL_7;
  }
}

void *sub_100047E70(void *result)
{
  ++*(_DWORD *)(result[4] + 104);
  uint64_t v1 = result[4];
  if (*(int *)(v1 + 104) >= 1)
  {
    uint64_t v2 = result;
    id result = *(void **)(v1 + 48);
    if (result)
    {
      id result = [result shouldCancel];
      if ((result & 1) == 0)
      {
        int v3 = *(void **)(v2[4] + 48);
        return [v3 cancel];
      }
    }
  }
  return result;
}

void sub_100047F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_100047FF4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "mf_lock");
  [*(id *)(a1 + 32) _clearResumeTime];
  [*(id *)(a1 + 32) resume];
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "mf_unlock");
}

void sub_1000480B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_100048150(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_nts_sortClients");
}

id sub_1000481CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_nts_sortClients");
}

void sub_100048328(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100048658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100048910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100048A00(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48))
  {
    [*(id *)(v2 + 48) cancel];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if ((*(unsigned char *)(v2 + 120) & 2) != 0)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:*(void *)(a1 + 32) name:MonitoredActivityEnded object:0];

    *(unsigned char *)(*(void *)(a1 + 32) + 120) &= ~2u;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [(id)v2 _clearResumeTime];
  uint64_t v6 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 112);
  *(void *)(v7 + 112) = v6;

  id v9 = +[MessageBodyLoader log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = v10[14];
    long long v12 = [v10 account];
    id v13 = [*(id *)(*(void *)(a1 + 32) + 24) count];
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 24);
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2048;
    id v25 = v13;
    __int16 v26 = 2112;
    uint64_t v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "assertionDidExpire: pausing until %@\nAccount:%@ \nnewMessageSet [%ld]:%@", buf, 0x2Au);
  }
  v18[0] = @"assertionDidExpire";
  v18[1] = @"resumeTime";
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 112);
  v19[0] = &off_1001461A0;
  v19[1] = v15;
  uint64_t v16 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  +[MFPowerController powerlog:@"MBL" eventData:v16];

  [*(id *)(a1 + 32) pause];
  return [*(id *)(a1 + 32) _setIsRunning:0];
}

void sub_100048C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100048CC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelSleepIfNeeded];
}

void sub_100048D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100048EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,id a54)
{
  _Block_object_dispose(&a46, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000495F4(uint64_t a1)
{
  unsigned int v1 = [*(id *)(a1 + 32) networkFetchingAllowed];
  uint64_t v2 = +[MFPowerController sharedInstance];
  if ([v2 isBatterySaverModeEnabled]) {
    unsigned int v3 = [v2 isPluggedIn] ^ 1;
  }
  else {
    unsigned int v3 = 0;
  }
  uint64_t v4 = v3 | v1 ^ 1 | [v2 gameModeEnabled];

  return v4;
}

void sub_100049670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100049680(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = [v3 message];
    unsigned int v6 = [v5 isMessageContentsLocallyAvailable] ^ 1;
  }
  else
  {
    unsigned int v6 = 0;
  }
  BOOL v7 = [v4 priority] == (id)-100 && objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "count") != 0;
  uint64_t v8 = v6 | v7;

  return v8;
}

void sub_10004971C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10004973C(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 mailbox];
  id v3 = [v2 mailboxType];

  uint64_t v4 = MFUserAgent();
  unsigned __int8 v5 = [v4 isForeground];

  BOOL v7 = v3 == (id)104 || v3 == (id)4;
  return (v5 & 1) == 0 && v7;
}

void sub_1000497A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100049B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100049CF4(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_10016B988;
  qword_10016B988 = (uint64_t)v1;
}

void sub_100049D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100049E5C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_10016B998;
  qword_10016B998 = (uint64_t)v1;
}

void sub_100049ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004A370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004A4D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004A5D0(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_10016B9A8;
  qword_10016B9A8 = (uint64_t)v1;
}

void sub_10004A640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004A738(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_10016B9B8;
  qword_10016B9B8 = (uint64_t)v1;
}

void sub_10004A7A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004AD60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004AF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004B004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004B284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004B55C(_Unwind_Exception *a1)
{
  unsigned int v6 = v4;

  _Unwind_Resume(a1);
}

void sub_10004B678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10004B734(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, double a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (!v11)
  {
    uint64_t v14 = +[UIApplication sharedApplication];
    id v11 = [v14 preferredContentSizeCategory];
  }
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  if (!qword_10016B9C8) {
    qword_10016B9C8 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, &kCFTypeDictionaryValueCallBacks);
  }
  if (a6 == 0.0)
  {
    double v18 = (const void *)((997 * a5) ^ (31 * a1) ^ (unint64_t)[v15 hash]);
    double v19 = CFDictionaryGetValue((CFDictionaryRef)qword_10016B9C8, v18);
    if (v19) {
      goto LABEL_13;
    }
    keCGFloat y = (void *)v18;
  }
  else
  {
    keCGFloat y = 0;
  }
  id v20 = v15;
  id v57 = v16;
  id v56 = v20;
  id v55 = v17;
  uint64_t v21 = sub_10004BF18((uint64_t)v20);
  v60[0] = NSFontAttributeName;
  v60[1] = NSForegroundColorAttributeName;
  v61[0] = v21;
  v61[1] = v55;
  __int16 v22 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
  id v59 = 0;
  double v23 = sub_10004BFE0(a1, v22, &v59, v57, a6);
  double v58 = v24;
  double v25 = v23;
  id v26 = v59;
  [v21 pointSize];
  CGFloat v28 = v27 * 0.17;
  v63.origin.CGFloat x = sub_10004C158(v21);
  CGFloat x = v63.origin.x;
  CGFloat y = v63.origin.y;
  CGFloat height = v63.size.height;
  CGFloat v33 = fmax(a6, v32);
  v63.size.width = v33;
  CGRectGetWidth(v63);
  UIRoundToViewScale();
  double v54 = v34;
  [v21 capHeight];
  double v53 = v35;
  [v21 ascender];
  double v52 = v36;
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.width = v33;
  v64.size.CGFloat height = height;
  double v51 = CGRectGetHeight(v64);
  [v21 capHeight];
  double v50 = v37;
  v62.width = v33;
  v62.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v62, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  [v55 setStroke];
  double v39 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v20];
  char v40 = +[UIFontMetrics defaultMetrics];
  [v40 scaledValueForValue:v39 compatibleWithTraitCollection:2.0];
  double v42 = v41;

  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.width = v33;
  v65.size.CGFloat height = height;
  CGRect v66 = CGRectInset(v65, 1.5, 1.5);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v66.origin.x, v66.origin.y, v66.size.width, v66.size.height, fmax(fmin(v42, 4.0), 2.0));
  id v43 = objc_claimAutoreleasedReturnValue();
  double v44 = (const CGPath *)[v43 CGPath];

  CGContextAddPath(CurrentContext, v44);
  CGContextSetLineWidth(CurrentContext, v28);
  CGContextStrokePath(CurrentContext);
  objc_msgSend(v26, "drawWithRect:options:attributes:context:", 33, v22, 0, v54, v53 - v52 + (v51 - v50) * 0.5, v25, v58);
  double v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  if (a6 == 0.0)
  {
    if (v19)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_10016B9C8, key, v19);
    }
    else
    {
      double v19 = 0;
      CFDictionarySetValue((CFMutableDictionaryRef)qword_10016B9C8, key, +[NSNull null]);
    }
  }
LABEL_13:
  long long v45 = +[NSNull null];
  if (v45 == v19) {
    uint64_t v46 = 0;
  }
  else {
    uint64_t v46 = v19;
  }
  id v47 = v46;

  return v47;
}

void sub_10004BBD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,_Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

double sub_10004BCE8(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  unsigned int v6 = +[NSBundle mainBundle];
  double v7 = sub_10004BD78(a1, v5, v6, a3);

  return v7;
}

void sub_10004BD5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_10004BD78(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!v7)
  {
    id v9 = +[UIApplication sharedApplication];
    id v7 = [v9 preferredContentSizeCategory];
  }
  id v10 = sub_10004BF18((uint64_t)v7);
  NSAttributedStringKey v14 = NSFontAttributeName;
  id v15 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  sub_10004BFE0(a1, v11, 0, v8, a4);

  [v10 pointSize];
  v16.origin.CGFloat x = sub_10004C158(v10);
  double Width = CGRectGetWidth(v16);

  return Width;
}

void sub_10004BEC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10004BF18(uint64_t a1)
{
  os_log_t v1 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:a1];
  uint64_t v2 = +[UIFont boldSystemFontOfSize:7.5];
  id v3 = +[UIFontMetrics defaultMetrics];
  uint64_t v4 = [v3 scaledFontForFont:v2 compatibleWithTraitCollection:v1];

  return v4;
}

void sub_10004BFB4(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

double sub_10004BFE0(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a4;
  double v11 = 0.0;
  if (a5 > 0.0)
  {
    id v12 = +[UIScreen mainScreen];
    [v12 scale];
    double v14 = 1.0 / (v13 + v13);

    if (v14 + a5 + -6.0 >= 0.0) {
      double v11 = v14 + a5 + -6.0;
    }
    else {
      double v11 = 0.0;
    }
  }
  id v15 = sub_10004C22C(a1, 0, v10);
  double v16 = sub_10004C360(v15, v9, 0.0);
  double v17 = v16;
  if (v11 <= 0.0 || v16 <= v11)
  {
    id v20 = v15;
    if (!a3) {
      goto LABEL_12;
    }
LABEL_11:
    *a3 = v20;
    goto LABEL_12;
  }
  id v20 = sub_10004C22C(a1, 1, v10);

  double v17 = sub_10004C360(v20, v9, v11);
  if (a3) {
    goto LABEL_11;
  }
LABEL_12:

  return v17;
}

void sub_10004C124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CGFloat sub_10004C158(void *a1)
{
  id v1 = a1;
  [v1 capHeight];
  [v1 capHeight];
  UIRoundToViewScale();
  UIRoundToViewScale();
  [v1 capHeight];
  UIRoundToViewScale();

  return CGPointZero.x;
}

void sub_10004C218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10004C22C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (a1 == 3 || a1 == 2)
  {
    uint64_t v6 = MFLookupLocalizedString();
  }
  else
  {
    if (a1 != 1)
    {
      id v7 = 0;
      goto LABEL_10;
    }
    uint64_t v6 = [v4 localizedStringForKey:@"FROM_LABEL" value:&stru_10013ED08 table:@"Main"];
  }
  id v7 = (void *)v6;
LABEL_10:

  return v7;
}

void sub_10004C348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_10004C360(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  if (a3 <= 0.0)
  {
    [v5 sizeWithAttributes:v6];
    double v8 = v9;
  }
  else
  {
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 33, v6, 0, a3, 0.0);
    double v8 = v7;
  }

  return v8;
}

void sub_10004C3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004C4AC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10004C558(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004C668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004C68C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfLoadAttempts:", (char *)objc_msgSend(*(id *)(a1 + 32), "numberOfLoadAttempts") + 1);
  id v2 = [*(id *)(a1 + 32) _bodyLoader];
  [v2 addSingleMessageClient:*(void *)(a1 + 32)];
}

void sub_10004C6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004C798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004C7B0(uint64_t a1)
{
  [*(id *)(a1 + 32) setNumberOfLoadAttempts:0];
  [*(id *)(a1 + 32) setSummaryPromise:0];
  id v2 = [*(id *)(a1 + 32) _bodyLoader];
  [v2 removeSingleMessageClient:*(void *)(a1 + 32)];
}

void sub_10004C81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004C93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  double v19 = v18;

  _Unwind_Resume(a1);
}

void sub_10004C970(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) message];

  if (v2 == v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), *(id *)(a1 + 48));
    id v4 = [*(id *)(a1 + 40) summaryPromise];
    [v4 finishWithResult:*(void *)(a1 + 48) error:0];
  }
}

void sub_10004CA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004CAF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  double v19 = v18;

  _Unwind_Resume(a1);
}

void sub_10004CB2C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) message];

  if (v2 == v3)
  {
    if (*(void *)(a1 + 48) || (unint64_t)[*(id *)(a1 + 40) numberOfLoadAttempts] > 3)
    {
      id v5 = [*(id *)(a1 + 40) message];
      uint64_t v6 = [v5 summary];
      uint64_t v7 = *(void *)(a1 + 40);
      double v8 = *(void **)(v7 + 16);
      *(void *)(v7 + 16) = v6;

      uint64_t v9 = *(void *)(a1 + 48);
      if (v9)
      {
        NSErrorUserInfoKey v15 = NSUnderlyingErrorKey;
        uint64_t v16 = v9;
        id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      }
      else
      {
        id v10 = 0;
      }
      double v11 = [*(id *)(a1 + 40) summaryPromise];
      id v12 = [*(id *)(a1 + 40) message];
      double v13 = [v12 summary];
      double v14 = +[NSError errorWithDomain:EMErrorDomain code:2048 userInfo:v10];
      [v11 finishWithResult:v13 error:v14];
    }
    else
    {
      id v4 = [*(id *)(a1 + 40) requestSummary];
    }
  }
}

void sub_10004CCBC(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_10004CD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004CDE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004CF80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004CFF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004D13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004D1E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004D384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004D4B0(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016B9D8;
  qword_10016B9D8 = (uint64_t)v1;
}

void sub_10004D520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10004D5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004D864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10004D8E0(uint64_t a1, int a2)
{
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 32) account];
    uint64_t v6 = objc_msgSend(v5, "ef_publicDescription");
    uint64_t v7 = (void *)v6;
    CFStringRef v8 = @"failed";
    if (a2) {
      CFStringRef v8 = @"completed";
    }
    int v10 = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    CFStringRef v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Credential renewal for account %{public}@  %@", (uint8_t *)&v10, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10004D9F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004DBA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004DC08(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) validationInvocation];
  [v2 invoke];

  if ([*(id *)(a1 + 32) accountIsValid])
  {
    id v3 = [*(id *)(a1 + 40) account];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = [v5 account];
    if (isKindOfClass)
    {
      [v5 _overwriteAccount:v6 withAlternateAccount:*(void *)(a1 + 48)];

      uint64_t v7 = +[MFAccountHealer log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v8 = [*(id *)(a1 + 40) account];
        id v9 = [v8 hostname];
        int v10 = [*(id *)(a1 + 40) account];
        unsigned int v11 = [v10 portNumber];
        __int16 v12 = [*(id *)(a1 + 40) account];
        *(_DWORD *)buf = 138412802;
        id v35 = v9;
        __int16 v36 = 1024;
        unsigned int v37 = v11;
        __int16 v38 = 1024;
        unsigned int v39 = [v12 usesSSL];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User allow us to heal their account to: %@:%i %i", buf, 0x18u);
      }
      BOOL v13 = 1;
LABEL_16:

      goto LABEL_17;
    }
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if (v14)
    {
      uint64_t v7 = [*(id *)(a1 + 40) account];
      NSErrorUserInfoKey v15 = [*(id *)(a1 + 40) _getMailAccountFromDeliveryAccount:v7];
      BOOL v13 = v15 != 0;
      if (v15)
      {
        [*(id *)(a1 + 40) _overwriteAccount:v7 withAlternateAccount:*(void *)(a1 + 48)];
        uint64_t v16 = +[MFAccountHealer log];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          double v17 = [*(id *)(a1 + 40) account];
          double v18 = [v17 hostname];
          double v19 = [*(id *)(a1 + 40) account];
          unsigned int v20 = [v19 portNumber];
          uint64_t v21 = [*(id *)(a1 + 40) account];
          *(_DWORD *)buf = 138412802;
          id v35 = v18;
          __int16 v36 = 1024;
          unsigned int v37 = v20;
          __int16 v38 = 1024;
          unsigned int v39 = [v21 usesSSL];
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "User allow us to heal their account to: %@:%i %i", buf, 0x18u);
        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, MFMailDefaultSendingAccountDidChange, 0, 0, 1u);
      }
      else
      {
        double v23 = +[MFAccountHealer log];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          double v24 = [*(id *)(a1 + 40) account];
          double v25 = [v24 hostname];
          id v26 = [*(id *)(a1 + 40) account];
          unsigned int v27 = [v26 portNumber];
          CGFloat v28 = [*(id *)(a1 + 40) account];
          *(_DWORD *)buf = 138412802;
          id v35 = v25;
          __int16 v36 = 1024;
          unsigned int v37 = v27;
          __int16 v38 = 1024;
          unsigned int v39 = [v28 usesSSL];
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Unable to find account that is related to this SMTP server: %@:%i %i", buf, 0x18u);
        }
      }

      goto LABEL_16;
    }
  }
  BOOL v13 = 0;
LABEL_17:
  id v29 = +[EFScheduler mainThreadScheduler];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10004E150;
  v31[3] = &unk_10013B270;
  id v30 = *(id *)(a1 + 56);
  BOOL v33 = v13;
  v31[4] = *(void *)(a1 + 40);
  id v32 = v30;
  [v29 performBlock:v31];
}

void sub_10004E070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10004E150(uint64_t a1)
{
  return self;
}

void sub_10004E414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004E6E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004E888(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_10004E9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10004EAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10004EB20(uint64_t a1, void *a2)
{
  id v3 = [a2 deliveryAccount];
  id v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 32) identifier];
  id v6 = [v4 isEqualToString:v5];

  return v6;
}

void sub_10004EB94(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10004EC2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004ED30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  BOOL v13 = v12;

  _Unwind_Resume(a1);
}

void sub_10004EE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10004EE68(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_7;
  }
  if (a2 == 1)
  {
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Warning credential renewal failed: %@", (uint8_t *)&v7, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
}

void sub_10004EF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F06C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004F118(id a1)
{
  v3[0] = @"uniqueID";
  v3[1] = @"name";
  v4[0] = &stru_10013B348;
  v4[1] = &stru_10013B368;
  v3[2] = @"fullUserName";
  v3[3] = @"username";
  _DWORD v4[2] = &stru_10013B388;
  v4[3] = &stru_10013B3A8;
  void v3[4] = @"emailAddresses";
  void v3[5] = @"emailAddressAndAliases";
  v4[4] = &stru_10013B3C8;
  v4[5] = &stru_10013B3E8;
  v3[6] = @"fromEmailAddresses";
  v3[7] = @"fromEmailAddressesIncludingDisabled";
  v4[6] = &stru_10013B408;
  v4[7] = &stru_10013B428;
  v3[8] = @"defaultAddress";
  v3[9] = @"isActive";
  v4[8] = &stru_10013B448;
  v4[9] = &stru_10013B468;
  v3[10] = @"isDefaultSendingAccount";
  v3[11] = @"restrictsRepliesAndForwards";
  v4[10] = &stru_10013B488;
  v4[11] = &stru_10013B4A8;
  v3[12] = @"sendingRestricted";
  v3[13] = @"supportsThreadOperations";
  v4[12] = &stru_10013B4C8;
  v4[13] = &stru_10013B4E8;
  v3[14] = @"syncsReadState";
  v3[15] = @"restrictedRecentsSyncing";
  v4[14] = &stru_10013B508;
  v4[15] = &stru_10013B528;
  uint8_t v3[16] = @"supportsMailDrop";
  v3[17] = @"isManaged";
  uint8_t v4[16] = &stru_10013B548;
  v4[17] = &stru_10013B568;
  v3[18] = @"canFetch";
  v3[19] = @"pcStyle";
  v4[18] = &stru_10013B588;
  v4[19] = &stru_10013B5A8;
  v3[20] = @"restrictedMailDrop";
  v4[20] = &stru_10013B5C8;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:21];
  id v2 = (void *)qword_10016B9E8;
  qword_10016B9E8 = v1;
}

id sub_10004F394(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _accountReference:a3];

  return v3;
}

id sub_10004F3C4(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _displayName:a3];

  return v3;
}

id sub_10004F3F4(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _fullUserName:a3];

  return v3;
}

id sub_10004F424(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _username:a3];

  return v3;
}

id sub_10004F454(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _emailAddresses:a3];

  return v3;
}

id sub_10004F484(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _emailAddressesAndAliases:a3];

  return v3;
}

id sub_10004F4B4(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _fromEmailAddresses:a3];

  return v3;
}

id sub_10004F4E4(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _fromEmailAddressesIncludingDisabled:a3];

  return v3;
}

id sub_10004F514(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _defaultAddress:a3];

  return v3;
}

id sub_10004F544(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _isActive:a3];

  return v3;
}

id sub_10004F574(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _isDefaultSendingAccount:a3];

  return v3;
}

id sub_10004F5A4(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _restrictsRepliesAndForwards:a3];

  return v3;
}

id sub_10004F5D4(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _restrictedFromSendingExternally:a3];

  return v3;
}

id sub_10004F604(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _supportsThreadOperations:a3];

  return v3;
}

id sub_10004F634(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _syncsReadState:a3];

  return v3;
}

id sub_10004F664(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _restrictedFromSyncingRecents:a3];

  return v3;
}

id sub_10004F694(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _supportsMailDrop:a3];

  return v3;
}

id sub_10004F6C4(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _isManaged:a3];

  return v3;
}

id sub_10004F6F4(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _canFetch:a3];

  return v3;
}

id sub_10004F724(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _pcStyle:a3];

  return v3;
}

id sub_10004F754(id a1, MFAccountResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFAccountResultsGenerator *)a2 _restrictedFromMailDrop:a3];

  return v3;
}

void sub_10004FE58(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016B9F8;
  qword_10016B9F8 = (uint64_t)v1;
}

void sub_10004FEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100050000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000500B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000500CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetAccounts];
}

void sub_100050768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000509EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100050A10(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  uint64_t v5 = 0;
  if (v4)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v8 isActive])
        {
          id v9 = [v8 statisticsKind];
          if (v9)
          {
            int v10 = [v2 valueForKey:v9];
            unsigned int v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 intValue] + 1);

            [v2 setValue:v11 forKey:v9];
            uint64_t v5 = (v5 + 1);
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  __int16 v12 = +[NSNumber numberWithInt:v5];
  [v2 setObject:v12 forKeyedSubscript:@"totalCount"];

  id v13 = v2;
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
}

void sub_100050C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100050CC0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

NSDictionary *__cdecl sub_100050CC8(id a1)
{
  os_log_t v1 = +[NSNumber numberWithInt:PCSettingsGetClassPollInterval()];
  id v2 = +[NSNumber numberWithBool:PCSettingsGetClassPushEnabled() == 0];
  v5[0] = @"fetchInterval";
  v5[1] = @"pushDisabled";
  v6[0] = v1;
  v6[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return (NSDictionary *)v3;
}

void sub_100050DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100050F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100050FCC(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"oldFocus"];
  [v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"newFocus"];
  [*(id *)(a1 + 48) resetAccountsSynchronouslyOnMainThread];
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"MFFocusDidChangeNotification" object:*(void *)(a1 + 48) userInfo:v3];
}

void sub_100051070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100051144(void *a1)
{
  id v1 = a1;
  [v1 registerServiceClass:objc_opt_class()];
  [v1 registerServiceClass:objc_opt_class()];
  [v1 registerServiceClass:objc_opt_class()];
  [v1 registerServiceClass:objc_opt_class()];
  [v1 registerServiceClass:objc_opt_class()];
  [v1 registerServiceClass:objc_opt_class()];
}

void sub_100051214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000515AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10005183C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000518A8()
{
}

void sub_100051BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100051D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1000520F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10005251C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000525D0()
{
}

void sub_100052788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005287C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BA08;
  qword_10016BA08 = (uint64_t)v1;
}

void sub_1000528EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100052A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100052AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  int v10 = v9;

  a9.super_class = (Class)MFApplicationShortcutProvider;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100052BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100052BDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateApplicationShortcuts];
}

void sub_100052C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100052C88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateApplicationShortcuts];
}

void sub_100053130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005322C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) specialMailboxFavoriteItem];

  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) specialMailboxFavoriteItem];
    uint64_t v5 = [*(id *)(a1 + 32) specialMailboxFavoriteItem];
    uint64_t v6 = [v5 badgeCountString];
    int v7 = +[EFPair pairWithFirst:v4 second:v6];
    [v3 addObject:v7];
  }
  id v8 = [*(id *)(a1 + 32) mailboxFavoriteItem];

  if (v8)
  {
    id v9 = *(void **)(a1 + 40);
    int v10 = [*(id *)(a1 + 32) mailboxFavoriteItem];
    unsigned int v11 = [*(id *)(a1 + 32) mailboxFavoriteItem];
    __int16 v12 = [v11 badgeCountString];
    id v13 = +[EFPair pairWithFirst:v10 second:v12];
    [v9 addObject:v13];
  }
  long long v14 = [*(id *)(a1 + 32) fixedShortcutItems];
  id v15 = [v14 mutableCopy];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = *(id *)(a1 + 40);
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v16);
        }
        unsigned int v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v21 = *(void **)(a1 + 32);
        __int16 v22 = objc_msgSend(v20, "first", (void)v25);
        double v23 = [v20 second];
        double v24 = [v21 _applicationShortcutForFavoriteItem:v22 badgeCountString:v23];
        [v15 addObject:v24];
      }
      id v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v17);
  }

  [*(id *)(a1 + 32) setShortcutItems:v15];
}

void sub_1000534AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005366C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v17);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000536A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateApplicationShortcuts];
}

void sub_1000536EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100053860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100053A50(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_100053C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100053EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100054158(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1000542D4(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

NSString *__cdecl sub_10005430C(id a1, SBSApplicationShortcutItem *a2)
{
  id v2 = a2;
  id v3 = [(SBSApplicationShortcutItem *)v2 localizedTitle];
  uint64_t v4 = [(SBSApplicationShortcutItem *)v2 localizedSubtitle];
  uint64_t v5 = (void *)v4;
  CFStringRef v6 = &stru_10013ED08;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  int v7 = +[NSString stringWithFormat:@"Name: %@ Subtitle: %@", v3, v6];

  return (NSString *)v7;
}

void sub_1000543B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005483C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000548F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setBadgeCount:");
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100054958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000549F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v12 = v11;

  _Unwind_Resume(a1);
}

void sub_100054A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100054BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100054D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

MailAccount *__cdecl sub_100054D6C(id a1, MFMailMessage *a2)
{
  id v2 = [(MFMailMessage *)a2 account];

  return (MailAccount *)v2;
}

void sub_100054D9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 shouldArchiveByDefault]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 3;
  }
  id v8 = [v5 mailboxUidOfType:v7 createIfNeeded:0];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  _DWORD v15[2] = sub_100054F28;
  v15[3] = &unk_10013B728;
  v15[4] = v7;
  id v9 = objc_msgSend(v6, "ef_filter:", v15);
  int v10 = v9;
  if (v8 && [v9 count])
  {
    __int16 v12 = *(void **)(a1 + 32);
    unsigned int v11 = *(void **)(a1 + 40);
    id v13 = [v8 URL];
    long long v14 = [v11 moveMessages:v10 destinationMailboxURL:v13 userInitiated:0];
    [v12 addObjectsFromArray:v14];
  }
}

void sub_100054EDC(_Unwind_Exception *a1)
{
  uint64_t v7 = v5;

  _Unwind_Resume(a1);
}

BOOL sub_100054F28(uint64_t a1, void *a2)
{
  id v3 = [a2 mailbox];
  BOOL v4 = [v3 type] != *(id *)(a1 + 32);

  return v4;
}

void sub_100054F70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000551C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000552BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000553D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000554A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000555C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000556EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000557A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005598C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055AE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055C14(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BA20;
  qword_10016BA20 = (uint64_t)v1;
}

void sub_100055C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100055D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100055FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

MailAccount *__cdecl sub_100056018(id a1, MFMailMessage *a2)
{
  id v2 = [(MFMailMessage *)a2 account];

  return (MailAccount *)v2;
}

void sub_100056048(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  id v5 = [a2 mailboxUidOfType:3 createIfNeeded:0];
  id v6 = objc_msgSend(v12, "ef_filter:", &stru_10013B7B0);
  uint64_t v7 = v6;
  if (v5 && [v6 count])
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    int v10 = [v5 URL];
    unsigned int v11 = [v9 moveMessages:v7 destinationMailboxURL:v10 userInitiated:0];
    [v8 addObjectsFromArray:v11];
  }
}

void sub_10005612C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL sub_100056170(id a1, MFMailMessage *a2)
{
  id v2 = [(MFMailMessage *)a2 mailbox];
  BOOL v3 = [v2 type] != (id)3;

  return v3;
}

void sub_1000561B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000563FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10005644C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAccountChange];
}

void sub_100056494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000564FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFDaemonAccountsProvider;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10005685C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000569DC(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  return [v2 _handleAccountChange];
}

void sub_100056B94(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BA30;
  qword_10016BA30 = (uint64_t)v1;
}

void sub_100056C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100056CC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100056DF4(_Unwind_Exception *a1)
{
  BOOL v4 = v3;

  _Unwind_Resume(a1);
}

id sub_100056E28(id a1, MFXPCClient *a2)
{
  id v2 = +[MFDAutosave sharedInstance];

  return v2;
}

void sub_100056EB0(id a1)
{
  os_log_t v1 = objc_alloc_init(MFDAutosave);
  id v2 = (void *)qword_10016BA40;
  qword_10016BA40 = (uint64_t)v1;
}

void sub_100056FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057020(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5)
  {
    id v8 = [v6 domain];
    if ([v8 isEqualToString:MSAutosaveErrorDomain])
    {
      id v9 = [v7 code];

      if (v9 == (id)2) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    int v10 = +[MFDAutosave log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = objc_msgSend(v7, "ef_publicDescription");
      sub_1000C1258(v11, (uint64_t)&v12, v10);
    }
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10005713C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100057230(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = +[MFMailMessageLibrary defaultInstance];
    id v9 = +[NSArray arrayWithObject:v5];
    [v8 compactMessages:v9];

    int v10 = +[MFDAutosave log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v16 = 138412290;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Successfully removed autosave. autosaveID=%@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    uint64_t v12 = [v6 domain];
    if ([v12 isEqualToString:MSAutosaveErrorDomain])
    {
      id v13 = [v7 code];

      if (v13 == (id)2) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    int v10 = +[MFDAutosave log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = objc_msgSend(v7, "ef_publicDescription");
      sub_1000C12A8(v14, v15, (uint8_t *)&v16, v10);
    }
  }

LABEL_11:
}

void sub_1000573DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100057538(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    uint64_t v17 = 1;
LABEL_12:
    int v16 = +[NSError errorWithDomain:MSAutosaveErrorDomain code:v17 userInfo:0];
    uint64_t v14 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = 2;
    goto LABEL_12;
  }
  id v2 = +[NSURL URLWithString:*(void *)(a1 + 32)];
  id v3 = objc_msgSend(v2, "mf_messageCriterion");
  if (!v3) {
    goto LABEL_13;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v4 = +[LocalAccount localAccount];
    id v5 = [v4 transientDraftsFolder];
    id v6 = [v5 criterion];

    v20[0] = v3;
    v20[1] = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:v20 count:2];
    uint64_t v8 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v7];

    id v3 = (void *)v8;
    if (!v8) {
      goto LABEL_13;
    }
  }
  id v9 = +[LocalAccount localAccount];
  int v10 = [v9 transientDraftsFolder];
  uint64_t v11 = [v9 storeForMailboxUid:v10];

  uint64_t v12 = [v11 library];
  id v13 = [v12 messagesMatchingCriterion:v3 options:6297663];
  uint64_t v14 = [v13 firstObject];

  if (v14)
  {
    id v15 = +[MFDAutosave log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      double v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Retrieved autosaved message [%@]", (uint8_t *)&v18, 0xCu);
    }

    int v16 = 0;
  }
  else
  {
LABEL_13:
    int v16 = +[NSError errorWithDomain:MSAutosaveErrorDomain code:2 userInfo:0];
    uint64_t v14 = 0;
  }

LABEL_15:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100057800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100057994(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = [a2 messageData];
  if (!(v5 | v6))
  {
    uint64_t v7 = +[NSError errorWithDomain:MSAutosaveErrorDomain code:5 userInfo:0];
    uint64_t v8 = +[MFDAutosave log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C1310(a1, v8, v9);
    }

    uint64_t v5 = v7;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100057A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  _Unwind_Resume(a1);
}

void sub_100057EF4(uint64_t a1)
{
  id v2 = +[MFDAutosave log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v53 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Starting autosave... %@", buf, 0xCu);
  }

  BOOL v4 = +[LocalAccount localAccount];
  uint64_t v5 = [v4 transientDraftsFolder];
  uint64_t v6 = [v4 storeForMailboxUid:v5];

  [v6 openSynchronously];
  uint64_t v7 = +[MFDAutosave log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v53 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Identifying previous autosaves... %@", buf, 0xCu);
  }

  uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "mf_messageCriterion");
  int v10 = *(void **)(a1 + 48);
  if (v10 && ([v10 isEqualToString:*(void *)(a1 + 56)] & 1) == 0)
  {
    uint64_t v11 = +[NSURL URLWithString:*(void *)(a1 + 48)];
    uint64_t v12 = objc_msgSend(v11, "mf_messageCriterion");
    if (v12)
    {
      id v13 = +[MFDAutosave log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void **)(a1 + 48);
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        id v53 = v14;
        __int16 v54 = 2112;
        uint64_t v55 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Including any autosaves of oldID=%@. %@", buf, 0x16u);
      }

      v51[0] = v9;
      v51[1] = v12;
      int v16 = +[NSArray arrayWithObjects:v51 count:2];
      uint64_t v17 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v16];

      uint64_t v9 = (void *)v17;
    }
    else
    {
      int v16 = +[MFDAutosave log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000C1498(a1, v16, v18);
      }
    }
  }
  v50[0] = v9;
  double v19 = [v6 mailbox];
  unsigned int v20 = [v19 criterion];
  v50[1] = v20;
  uint64_t v21 = +[NSArray arrayWithObjects:v50 count:2];
  __int16 v22 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v21];

  double v23 = +[LocalAccount localAccount];
  double v24 = [v23 transientDraftsFolder];
  long long v25 = [v23 storeForMailboxUid:v24];

  long long v26 = [v25 library];
  long long v27 = [v26 messagesMatchingCriterion:v22 options:6297663];

  long long v28 = +[MFDAutosave log];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    id v29 = [v27 count];
    uint64_t v30 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    id v53 = v29;
    __int16 v54 = 2112;
    uint64_t v55 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Found %lu previous autosaves. %@", buf, 0x16u);
  }

  uint64_t v31 = +[MFDAutosave log];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v53 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Adding new autosave to library... %@", buf, 0xCu);
  }

  BOOL v33 = +[MFMailMessageLibrary defaultInstance];
  double v34 = [v33 messageChangeManager];

  uint64_t v49 = *(void *)(a1 + 64);
  id v35 = +[NSArray arrayWithObjects:&v49 count:1];
  __int16 v36 = [v6 mailbox];
  unsigned int v37 = [v36 URL];
  __int16 v38 = [v34 addNewMessages:v35 mailboxURL:v37 userInitiated:0];

  if ([v38 count])
  {
    id v39 = *(id *)(a1 + 56);
    char v40 = +[MFDAutosave log];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      double v41 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v53 = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Autosave added to library successfully. %@", buf, 0xCu);
    }

    if ([v27 count])
    {
      double v42 = +[MFDAutosave log];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        id v53 = v43;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Cleaning up old saves. %@", buf, 0xCu);
      }

      [v34 deleteMessages:v27];
    }
    double v44 = +[MFDAutosave log];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      long long v45 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      id v53 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Autosave complete. %@", buf, 0xCu);
    }

    uint64_t v46 = 0;
  }
  else
  {
    id v47 = +[MFDAutosave log];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_1000C1424(a1, v47, v48);
    }

    id v39 = 0;
    uint64_t v46 = +[NSError errorWithDomain:MSAutosaveErrorDomain code:4 userInfo:0];
  }
  [v6 close];
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  [*(id *)(a1 + 72) invalidate];
}

void sub_10005859C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000587C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000587E4(uint64_t a1)
{
  id v2 = +[MFDAutosave log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Retrieving idle autosave items...", buf, 2u);
  }

  id v3 = +[LocalAccount localAccount];
  BOOL v4 = [v3 transientDraftsFolder];
  uint64_t v5 = [v4 criterion];

  uint64_t v6 = +[LocalAccount localAccount];
  uint64_t v7 = [v6 transientDraftsFolder];
  uint64_t v8 = [v6 storeForMailboxUid:v7];

  uint64_t v9 = [v8 library];
  int v10 = [v9 messagesMatchingCriterion:v5 options:6297663];

  if ([v10 count])
  {
    uint64_t v11 = objc_msgSend(v10, "ef_partition:", &stru_10013B940);
    uint64_t v12 = [v11 second];
    if ([v12 count])
    {
      id v13 = +[MFMailMessageLibrary defaultInstance];
      uint64_t v14 = [v13 messageChangeManager];

      [v14 deleteMessages:v12];
    }
    uint64_t v15 = [v11 first];

    int v16 = [*(id *)(a1 + 32) activeAutosaveSessions];
    uint64_t v17 = [v16 allObjects];

    uint64_t v18 = +[MFDAutosave log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v17 count];
      *(_DWORD *)buf = 134217984;
      id v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Number of active autosave sessions: %lu", buf, 0xCu);
    }

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100058CE4;
    void v24[3] = &unk_10013B990;
    id v20 = v17;
    id v25 = v20;
    uint64_t v21 = objc_msgSend(v15, "ef_compactMap:", v24);
    __int16 v22 = +[MFDAutosave log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v21 count];
      *(_DWORD *)buf = 134217984;
      id v27 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found %lu autosave items in the transient drafts mailbox without active autosave sessions.", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v15 = v10;
  }
}

void sub_100058B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

BOOL sub_100058C60(id a1, MFLibraryMessage *a2)
{
  id v2 = a2;
  id v3 = [(MFLibraryMessage *)v2 messageBodyIfAvailable];
  if (v3)
  {
    BOOL v4 = [(MFLibraryMessage *)v2 mf_documentReference];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_100058CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100058CE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_msgSend(v3, "mf_documentReference");
  BOOL v5 = [v4 absoluteString];

  uint64_t v6 = *(void **)(a1 + 32);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100058E58;
  v12[3] = &unk_10013B968;
  id v7 = v5;
  id v13 = v7;
  if (objc_msgSend(v6, "ef_any:", v12))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [v3 subject];
    int v10 = [v9 subjectString];

    uint64_t v8 = +[MSIdleAutosaveItem withAutosaveIdentifier:v7 subject:v10];
  }

  return v8;
}

void sub_100058E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100058E58(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 autosaveIdentifier];
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

void sub_100058EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100059008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_10005905C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [[MFDAutosaveSession alloc] initWithAutosaveIdentifier:*(void *)(a1 + 32)];
  id v3 = [WeakRetained activeAutosaveSessions];
  [v3 addObject:v2];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000590FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000591C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10005927C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BA50;
  qword_10016BA50 = (uint64_t)v1;
}

void sub_1000592EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100059418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100059530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)MFDAutosaveSession;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100059608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000596F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100059774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100059810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000598BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

int64_t sub_1000598F8(id a1, _MFDelayedNotification *a2, _MFDelayedNotification *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  [(_MFDelayedNotification *)v4 submissionDate];
  double v7 = v6;
  [(_MFDelayedNotification *)v5 submissionDate];
  uint64_t v9 = -1;
  uint64_t v10 = v4 > v5;
  if (v7 < v8) {
    uint64_t v10 = -1;
  }
  if (v4 >= v5) {
    uint64_t v9 = v10;
  }
  if (v7 <= v8) {
    int64_t v11 = v9;
  }
  else {
    int64_t v11 = 1;
  }

  return v11;
}

void sub_100059980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100059AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_100059BC8(void *result)
{
  if (*(double *)(result[4] + 32) != *((double *)result + 5))
  {
    os_log_t v1 = result;
    id v2 = MSUserNotificationsLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = v1[5];
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "setting postingDelay to %.4fs", (uint8_t *)&v4, 0xCu);
    }

    *(void *)(v1[4] + 32) = v1[5];
    return [(id)v1[4] _scheduleNextFireEvent];
  }
  return result;
}

double sub_100059D48(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 32);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_100059DD0(uint64_t a1)
{
  id v2 = MSUserNotificationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "purging all pending delayed messages", v4, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  return [*(id *)(a1 + 32) _scheduleNextFireEvent];
}

void sub_100059EE8(uint64_t a1)
{
  id v2 = MSUserNotificationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Delayed Presenter: Removing pending messages by identifier", buf, 2u);
  }

  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10005A0C4;
  v7[3] = &unk_10013BA48;
  id v8 = *(id *)(a1 + 40);
  int v4 = [v3 indexesOfObjectsPassingTest:v7];
  if ([v4 count])
  {
    uint64_t v5 = MSUserNotificationsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = [*(id *)(a1 + 40) componentsJoinedByString:@"', '"];
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Delayed Presenter: Removing pending messages {'%@'}", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 40) removeObjectsAtIndexes:v4];
    [*(id *)(a1 + 32) _scheduleNextFireEvent];
  }
}

void sub_10005A08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10005A0C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 identifier];
  id v6 = [v4 containsObject:v5];

  if (v6) {
    [v3 invalidate];
  }

  return v6;
}

void sub_10005A12C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005A1E0(uint64_t a1)
{
  id v2 = MSUserNotificationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    double v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Delayed Presenter: Removing all pending notifications for accounts: %{public}@", buf, 0xCu);
  }

  id v15 = objc_alloc_init((Class)NSMutableIndexSet);
  id v14 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(a1 + 32);
  id v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v8 = MSUserNotificationsLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          double v24 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Delayed Presenter: Removing all pending notifications for account: %{public}@", buf, 0xCu);
        }

        uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 40);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10005A564;
        v16[3] = &unk_10013BA70;
        v16[4] = v7;
        id v17 = v14;
        uint64_t v10 = [v9 indexesOfObjectsPassingTest:v16];
        [v15 addIndexes:v10];
      }
      id v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  if ([v15 count])
  {
    int64_t v11 = MSUserNotificationsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v14 componentsJoinedByString:@"', '"];
      *(_DWORD *)buf = 138412290;
      double v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Delayed Presenter: Removing pending messages {'%@'}", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 40) + 40) removeObjectsAtIndexes:v15];
    [*(id *)(a1 + 40) _scheduleNextFireEvent];
  }
}

void sub_10005A4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10005A564(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 notificationMessage];
  id v6 = [v5 accountID];
  id v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v3 identifier];
    [v8 addObject:v9];

    [v3 invalidate];
  }

  return v7;
}

void sub_10005A608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005A734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005A74C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005A970;
  v11[3] = &unk_10013BA98;
  id v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "ef_firstObjectPassingTest:", v11);
  id v3 = (_MFDelayedNotification *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [(_MFDelayedNotification *)v3 setNotificationMessage:*(void *)(a1 + 48)];
    uint64_t v5 = MSUserNotificationsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updated queued message for identifier '%@'", buf, 0xCu);
    }
  }
  else
  {
    id v7 = [[_MFDelayedNotification alloc] initWithNotificationMessage:*(void *)(a1 + 48) identifier:*(void *)(a1 + 40) submissionDate:*(void *)(a1 + 56) context:*(double *)(a1 + 64)];
    id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "ef_insertObject:usingComparator:allowDuplicates:", v7, &stru_10013BA20, 1);
    uint64_t v9 = MSUserNotificationsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "enqueued '%@' at index %lu", buf, 0x16u);
    }

    [*(id *)(a1 + 32) _scheduleNextFireEvent];
    id v4 = v7;
  }
}

void sub_10005A934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10005A970(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isProcessing])
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = [v3 identifier];
    id v4 = [v5 isEqual:*(void *)(a1 + 32)];
  }
  return v4;
}

void sub_10005A9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005AA8C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10005AC20;
  v7[3] = &unk_10013BA98;
  id v8 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "ef_filter:", v7);
  id v4 = MSUserNotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 count];
    id v6 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134218240;
    id v10 = v5;
    __int16 v11 = 2048;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "found %lu messages to process immediately (out of %lu requested)", buf, 0x16u);
  }

  if ([v3 count]) {
    [*(id *)(a1 + 32) _delegateProcessMessages:v3];
  }
}

void sub_10005ABE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005AC20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isProcessing] & 1) != 0
    || (id v4 = *(void **)(a1 + 32),
        [v3 identifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = [v4 containsObject:v5],
        v5,
        !v4))
  {
    uint64_t v6 = 0;
  }
  else
  {
    [v3 process];
    uint64_t v6 = 1;
  }

  return v6;
}

void sub_10005ACA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005AF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10005AF90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processSufficientlyDelayedMessages];
}

void sub_10005AFD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL sub_10005AFEC(id a1, _MFDelayedNotification *a2)
{
  return ![(_MFDelayedNotification *)a2 isProcessing];
}

void sub_10005B178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005B1A0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 isProcessing]) {
    goto LABEL_4;
  }
  double v7 = *(double *)(a1 + 32);
  [v6 submissionDate];
  uint64_t v8 = 1;
  if (v7 < v9)
  {
    *a4 = 1;
LABEL_4:
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_10005B20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005B390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005B3C0(uint64_t a1)
{
  long long v18 = [*(id *)(a1 + 32) delegate];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 40);
  id v1 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v1)
  {
    uint64_t v20 = *(void *)v23;
    uint64_t v16 = MSUserNotificationContentKeyMissingSummary;
    do
    {
      for (i = 0; i != v1; i = (char *)i + 1)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v3 isInvalidated] & 1) == 0)
        {
          id v4 = [v3 notificationMessage];
          id v5 = [v3 context];
          id v6 = [v18 delayedNotificationsPresenter:*(void *)(a1 + 32) userNotificationRequestForNotificationMessage:v4 context:v5];
          if ([v3 isInvalidated]) {
            goto LABEL_18;
          }
          id v7 = v6;
          if ([v5 isEqual:@"modify"])
          {
            uint64_t v8 = [v7 content];
            double v9 = [v8 userInfo];
            id v10 = [v9 objectForKeyedSubscript:v16];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unsigned int v11 = [v10 BOOLValue];

              if (v11)
              {
                id v12 = MSUserNotificationsLog();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
                {
                  id v13 = [v3 identifier];
                  sub_1000C150C(v13, buf, &v27, v12);
                }

LABEL_17:
                [v3 invalidate];
LABEL_18:

                continue;
              }
LABEL_16:
              [v18 delayedNotificationsPresenter:*(void *)(a1 + 32) handleUserNotificationRequest:v7 notificationMessage:v4 context:v5];
              goto LABEL_17;
            }
          }
          goto LABEL_16;
        }
      }
      id v1 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v1);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  __int16 v15 = *(NSObject **)(v14 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B738;
  block[3] = &unk_100139C48;
  void block[4] = v14;
  dispatch_async(v15, block);
}

void sub_10005B6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

id sub_10005B738(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeProcessedMessages];
}

void sub_10005B7E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10005B7F4(id a1, _MFDelayedNotification *a2, unint64_t a3, BOOL *a4)
{
  return [(_MFDelayedNotification *)a2 isProcessing];
}

void sub_10005B98C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005BB34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005BCF8(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BA60;
  qword_10016BA60 = (uint64_t)v1;
}

void sub_10005BD68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005BE1C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BA70;
  qword_10016BA70 = (uint64_t)v1;
}

void sub_10005BE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005C420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C4F4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2[1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062BF0;
  block[3] = &unk_100139C48;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

void sub_10005C588(uint64_t a1)
{
  [*(id *)(a1 + 32) _freeSpaceStatusDidChange:0];
  id v2 = *(void **)(a1 + 32);
  if (v2[12])
  {
    id v3 = v2[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005C62C;
    block[3] = &unk_100139C48;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

id sub_10005C62C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCounts];
}

void sub_10005C698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)MFDeliveryQueue;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10005C774(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_10016BA88;
  qword_10016BA88 = (uint64_t)v1;
}

void sub_10005C824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C940(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3 == 2)
  {
    id v6 = +[MFDeliveryQueue log];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    __int16 v11 = 0;
    id v7 = "ignoring request to process queue: state is 'suspended'";
    uint64_t v8 = (uint8_t *)&v11;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    goto LABEL_15;
  }
  if (v3 == 1)
  {
    *(unsigned char *)(v2 + 56) |= 1u;
    id v6 = +[MFDeliveryQueue log];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    __int16 v10 = 0;
    id v7 = "ignoring request to process queue: state is 'processing'";
    uint64_t v8 = (uint8_t *)&v10;
    goto LABEL_14;
  }
  if (v3) {
    return;
  }
  [(id)v2 _updateCounts];
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(void *)(v4 + 32))
  {
    id v6 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "processQueue: queue is empty (no messages from active accounts)";
      uint64_t v8 = buf;
      goto LABEL_14;
    }
LABEL_15:

    return;
  }
  *(void *)(v4 + 24) = 1;
  double v9 = objc_alloc_init(DeliveryOptions);
  [(DeliveryOptions *)v9 setPlaySound:*(unsigned __int8 *)(a1 + 40)];
  [(DeliveryOptions *)v9 setForceAll:*(unsigned __int8 *)(a1 + 41)];
  [(DeliveryOptions *)v9 setIsUserRequested:*(unsigned __int8 *)(a1 + 42)];
  id v5 = +[MFMonitoredInvocation mf_invocationWithSelector:"_processQueueWithOptions:" target:*(void *)(a1 + 32) object:v9];
  [*(id *)(*(void *)(a1 + 32) + 16) addInvocation:v5];
}

void sub_10005CAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005CB90(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 24);
  switch(v1)
  {
    case 2:
      uint64_t v4 = +[MFDeliveryQueue log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ignoring suspend request, we are already suspended", v6, 2u);
      }

      break;
    case 1:
      id v5 = +[MFDeliveryQueue log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "request suspending delivery queue", v7, 2u);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 56) |= 2u;
      break;
    case 0:
      uint64_t v3 = +[MFDeliveryQueue log];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "suspending delivery queue", buf, 2u);
      }

      *(void *)(*(void *)(a1 + 32) + 24) = 2;
      break;
  }
}

void sub_10005CD50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 24) == 2 && *(void *)(v1 + 96))
  {
    uint64_t v3 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "resuming delivery queue", v4, 2u);
    }

    *(void *)(*(void *)(a1 + 32) + 24) = 0;
  }
}

void sub_10005CED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005CFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005D084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005D19C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005D288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005DD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_10005DF74(uint64_t a1, uint64_t a2)
{
  if (!a2 && *(void *)(a1 + 32))
  {
    uint64_t v3 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Delivery succeeded, will delete message from Outbox with outboxCopy: %@", buf, 0xCu);
    }

    id v5 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v5 deleteMessages:v6 moveToTrash:0];
  }
}

void sub_10005E068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005E3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  _Unwind_Resume(a1);
}

double sub_10005E4D8(uint64_t a1)
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = +[NSUserDefaults em_userDefaults];
  uint64_t v2 = [v1 objectForKey:EMUserDefaultUndoSendDelayTime];

  if (v2) {
    double v3 = (double)(uint64_t)[v2 integerValue];
  }
  else {
    double v3 = 10.0;
  }

  return v3;
}

void sub_10005E560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005E57C(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = sub_10005E8BC;
  long long v19 = sub_10005E8CC;
  id v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  id v10[2] = sub_10005E8D4;
  v10[3] = &unk_10013BC10;
  v10[4] = &v15;
  void v10[5] = &v11;
  sub_10005E95C(WeakRetained, v10);
  [(os_unfair_lock_s *)WeakRetained notifyObserversOfDelayedMessagesDidChange:*((unsigned char *)v12 + 24) == 0];
  double v3 = [(os_unfair_lock_s *)WeakRetained _outboxStore];
  if (v16[5] == *(void *)(a1 + 32))
  {
    id v5 = [(os_unfair_lock_s *)WeakRetained _deliverSynchronously:*(void *)(a1 + 40) outboxCopy:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v4 = +[NSArray arrayWithObjects:&v23 count:1];
    [v3 deleteMessages:v4 moveToTrash:0];

    id v5 = [objc_alloc((Class)EMMessageDeliveryResult) initWithStatus:4 error:0];
  }
  id v6 = v5;
  uint64_t v7 = +[MFPowerController sharedInstance];
  [v7 releaseAssertionWithIdentifier:@"com.apple.message.delivery"];

  if ([v6 status] == (id)9)
  {
    objc_msgSend(*(id *)(a1 + 40), "setRetryCount:", (char *)objc_msgSend(*(id *)(a1 + 40), "retryCount") + 1);
    uint64_t v8 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [*(id *)(a1 + 40) retryCount];
      *(_DWORD *)buf = 134217984;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Retry message delivery. Retry count: %ld", buf, 0xCu);
    }

    [(os_unfair_lock_s *)WeakRetained deliverAsynchronously:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

void sub_10005E848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_10005E8BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10005E8CC(uint64_t a1)
{
}

void sub_10005E8D4(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_msgSend(v6, "ef_removeFirst");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "ef_isEmpty");
}

void sub_10005E948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005E95C(os_unfair_lock_s *a1, void *a2)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v3 = a1 + 13;
    os_unfair_lock_lock(a1 + 13);
    uint64_t v4 = [(os_unfair_lock_s *)a1 delayedMessages];
    v5[2](v5, v4);

    os_unfair_lock_unlock(v3);
  }
}

void sub_10005E9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);
  _Unwind_Resume(a1);
}

id sub_10005EA10(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

void sub_10005EC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose((const void *)(v23 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10005ECC0(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_msgSend(v6, "ef_popElement");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "ef_isEmpty");
}

void sub_10005ED34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005EE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005F080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005F114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10005F130(id a1, MFMailMessage *a2)
{
  return ((unint64_t)[(MFMailMessage *)a2 messageFlags] >> 37) & 1;
}

void sub_10005F1E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005F2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10005F388(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10005F4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_10005F5C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005F97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10005FCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_10006012C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000602A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000602F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) messagePersistence];
  id v5 = [v4 deliveryInfoForMessage:v3];

  id v6 = +[EFPair pairWithFirst:v3 second:v5];

  return v6;
}

void sub_10006037C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_1000603A8(id a1, EFPair *a2, EFPair *a3)
{
  uint64_t v4 = a3;
  id v5 = [(EFPair *)a2 second];
  id v6 = [(EFPair *)v4 second];
  id v7 = [v5 messageSize];
  if (v7 >= [v6 messageSize])
  {
    id v9 = [v5 messageSize];
    if (v9 <= [v6 messageSize]) {
      int64_t v8 = 0;
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

void sub_100060448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

MFLibraryMessage *__cdecl sub_100060470(id a1, EFPair *a2)
{
  uint64_t v2 = [(EFPair *)a2 first];

  return (MFLibraryMessage *)v2;
}

void sub_100060658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006092C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_100060A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100060BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000615DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_100061824(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v3 = +[NSArray arrayWithObjects:&v4 count:1];
    [v2 deleteMessages:v3 moveToTrash:0];
  }
}

void sub_1000618B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100061928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_1000619B0(uint64_t a1)
{
  uint64_t v2 = +[MFDeliveryQueue log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "processing queue did finish", v6, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 56) & 2) != 0)
  {
    *(void *)(v3 + 24) = 2;
    *(unsigned char *)(*(void *)(a1 + 32) + 56) &= ~2u;
  }
  else
  {
    *(void *)(v3 + 24) = 0;
  }
  id result = [*(id *)(a1 + 32) _updateCounts];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 56))
  {
    *(unsigned char *)(v5 + 56) &= ~1u;
    return [*(id *)(a1 + 32) processQueue];
  }
  return result;
}

id sub_100061B0C(uint64_t a1)
{
  uint64_t v2 = +[MFDeliveryQueue log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "change in mail accounts detected: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) _updateCounts];
  return [*(id *)(a1 + 40) processQueue];
}

void sub_100061C64(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKey:MailMessageStoreChangedFlagsKey];

  uint64_t v4 = [v3 objectForKey:MessageIsDeleted];
  int v5 = (void *)v4;
  if (*(void *)(*(void *)(a1 + 40) + 24) != 1 && v4 != 0)
  {
    id v7 = +[MFDeliveryQueue log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "detected deleted flag change of outbox message(s), will updateCounts", v8, 2u);
    }

    [*(id *)(a1 + 40) _updateCounts];
  }
}

void sub_100061D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100061DEC(uint64_t a1)
{
  uint64_t v2 = +[MFDeliveryQueue log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "detected new outbox message(s)", v4, 2u);
  }

  return [*(id *)(a1 + 32) _updateCounts];
}

void sub_100061F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100061F50(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:CPNetworkObserverReachable];
  if ([v3 BOOLValue]) {
    char v4 = 4;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = *(unsigned char *)(*(void *)(a1 + 32) + 56) & 0xFB | v4;

  int v5 = +[MFDeliveryQueue log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (*(unsigned __int8 *)(*(void *)(a1 + 32) + 56) >> 2) & 1;
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "detected change in network reachability: %d", (uint8_t *)v7, 8u);
  }
}

void sub_100062064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006214C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100062168(id a1, MFLibraryMessage *a2)
{
  uint64_t v2 = [(MFLibraryMessage *)a2 mailbox];
  BOOL v3 = [v2 type] == (id)6;

  return v3;
}

void sub_1000621A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000621B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCounts];
}

void sub_100062278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10006229C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];

  BOOL v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);

  return [v3 numberOfPendingMessagesChanged:v4];
}

void sub_1000622F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000623B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000623DC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void sub_100062430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000624D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000624E8(uint64_t a1)
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      int v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) numberOfPendingMessagesChanged:*(void *)(a1 + 40)];
        int v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void sub_1000625E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000626A8(uint64_t a1)
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      int v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) hasDelayedMessagesDidChange:*(unsigned __int8 *)(a1 + 40)];
        int v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void sub_1000627A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006286C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100062A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100062A58(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) messagePersistence];
  int v5 = [v4 deliveryInfoForMessage:v3];

  long long v6 = +[NSString stringWithFormat:@"%@ -- %@", v3, v5];

  return v6;
}

void sub_100062AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100062BF0(uint64_t a1)
{
  id v2 = +[MFDeliveryQueue log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "locale change detected", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_100062C74(void *a1)
{
  id v1 = a1;
  [v1 registerServiceClass:objc_opt_class()];
  [v1 registerServiceClass:objc_opt_class()];
  [v1 registerServiceClass:objc_opt_class()];
  [v1 registerServiceClass:objc_opt_class()];
  [v1 registerServiceClass:objc_opt_class()];
}

void sub_100062D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100062F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100063094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006310C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000631E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000635B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100063660(uint64_t a1)
{
  id v2 = objc_alloc_init(MailServicesComposeDelegate);
  +[MFComposeTypeFactory setupWithCompositionModel:*(void *)(a1 + 32) delegate:v2];
  uint64_t v3 = +[MFComposeTypeFactory messageFromDelegate:v2 originatingBundleID:0 sourceAccountManagement:0];
  uint64_t v4 = +[EFScheduler mainThreadScheduler];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_100063858;
  v8[3] = &unk_10013BDB8;
  id v10 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  [v3 onScheduler:v4 addSuccessBlock:v8];

  int v5 = +[EFScheduler mainThreadScheduler];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10006386C;
  v6[3] = &unk_10013BDE0;
  id v7 = *(id *)(a1 + 40);
  [v3 onScheduler:v5 addFailureBlock:v6];
}

void sub_1000637F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100063858(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t sub_10006386C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100063A50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100063AB8(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11)
  {
    long long v6 = +[MailAccount accountThatMessageIsFrom:v11 includingInactive:1];
    id v7 = sub_100063CB0(v11, v6);

    long long v8 = 0;
  }
  else
  {
    +[NSError errorWithDomain:MSMailServiceErrorDomain code:7342 userInfo:0];
    v8 = id v7 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 setMessageBody:0];
  }
  if (v7)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    id v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(reply, (const char *)[MSSaveEmailResultKeyMessageID UTF8String], v10);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100063C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100063CB0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (!v3)
  {
    uint64_t v15 = "mailMessage != nil";
    int v16 = 219;
    goto LABEL_8;
  }
  if (!v4)
  {
    uint64_t v15 = "account != nil";
    int v16 = 220;
LABEL_8:
    __assert_rtn("_saveMailMessage", "MFDeliveryService.m", v16, v15);
  }
  [v3 markAsViewed];
  objc_msgSend(v3, "setMessageFlags:", (unint64_t)objc_msgSend(v3, "messageFlags") | 0x40);
  long long v6 = [v5 mailboxUidOfType:5 createIfNeeded:1];
  id v7 = +[MFMailMessageLibrary defaultInstance];
  long long v8 = [v7 persistence];
  id v9 = [v8 messageChangeManager];

  id v17 = v3;
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
  id v11 = [v6 URL];
  id v12 = [v9 addNewMessages:v10 mailboxURL:v11 userInitiated:1];

  uint64_t v13 = +[NSURL URLWithString:@"x-last-saved-message"];

  return v13;
}

void sub_100063E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100064214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006429C(uint64_t a1)
{
  id v2 = sub_100063CB0(*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (v2 && *(void *)(a1 + 48))
  {
    id v3 = +[MSAutosave autosave];
    [v3 removeAutosavedMessageWithIdentifier:*(void *)(a1 + 48)];
  }
}

void sub_10006431C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006492C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100064A54()
{
}

void sub_100064CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100064D68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    +[NSError errorWithDomain:MSMailServiceErrorDomain code:7336 userInfo:0];
    id v10 = 0;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  id v7 = +[MailAccount accountThatMessageIsFrom:v5 includingInactive:1];
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 49);
  id v18 = 0;
  id v10 = sub_100065014(v5, v7, v8, v9, &v18);
  id v11 = v18;
  if (v10)
  {
    id v12 = (char *)[v6 composeType];
    if ((unint64_t)(v12 - 4) < 2)
    {
      uint64_t v13 = [v6 legacyMessage];
      [v13 markAsViewed];

      char v14 = [v6 legacyMessage];
      [v14 markAsReplied];
LABEL_8:

      goto LABEL_9;
    }
    if (v12 == (char *)6)
    {
      uint64_t v15 = [v6 legacyMessage];
      [v15 markAsViewed];

      char v14 = [v6 legacyMessage];
      [v14 markAsForwarded];
      goto LABEL_8;
    }
  }
LABEL_9:

LABEL_10:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setMessageBody:0];
  }
  if (v10)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    id v17 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(reply, (const char *)[MSSendEmailResultKeyMessageID UTF8String], v17);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100064FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100065014(void *a1, void *a2, uint64_t a3, char a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = v10;
  if (!v10) {
    __assert_rtn("_sendMailMessage", "MFDeliveryService.m", 475, "account != nil");
  }
  if ([v10 restrictedFromSendingExternally])
  {
    id v12 = +[NSError errorWithDomain:MSMailServiceErrorDomain code:7334 userInfo:0];
    uint64_t v13 = 0;
  }
  else
  {
    [v9 markAsViewed];
    char v14 = +[MFDeliveryQueue sharedDeliveryQueue];
    uint64_t v15 = [v14 append:v9];
    if (v15)
    {
      [v14 processQueueAndPlaySoundOnSuccess:a3 forceAll:0 isUserRequested:1];
      if (a4)
      {
        int v16 = MFComposeLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v15 messageID];
          int v22 = 138412290;
          uint64_t v23 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Skipping recents addition as message:<%@> is being delivered as HME", (uint8_t *)&v22, 0xCu);
        }
      }
      else
      {
        id v18 = [(objc_class *)off_10016A138() defaultInstance];
        long long v19 = [v9 headers];
        [v18 recordContactEventsForHeaders:v19 recentsDomain:kMFMobileMailBundleIdentifier];
      }
      uint64_t v13 = +[NSURL URLWithString:@"x-last-sent-message"];
      id v12 = 0;
    }
    else
    {
      id v12 = +[NSError errorWithDomain:MSMailServiceErrorDomain code:7333 userInfo:0];
      uint64_t v13 = 0;
    }
  }
  if (a5)
  {
    if (v12 && v13 == 0) {
      *a5 = v12;
    }
  }

  return v13;
}

void sub_10006528C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100065698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  _Unwind_Resume(a1);
}

Class sub_1000657A4()
{
  if (qword_10016BAB0 != -1) {
    dispatch_once(&qword_10016BAB0, &stru_10013BE50);
  }
  Class result = objc_getClass("CRRecentContactsLibrary");
  qword_10016BAA0 = (uint64_t)result;
  off_10016A138 = (uint64_t (*)())sub_100065808;
  return result;
}

id sub_100065808()
{
  return (id)qword_10016BAA0;
}

void sub_100065814(id a1)
{
  qword_10016BAA8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreRecents.framework/CoreRecents", 2);
  if (!qword_10016BAA8) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/CoreRecents.framework/CoreRecents");
  }
}

void sub_100065850(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000658C0(id a1)
{
  id v1 = objc_alloc_init(MFDiskFreeSpaceMonitor);
  id v2 = (void *)qword_10016BAC0;
  qword_10016BAC0 = (uint64_t)v1;
}

void sub_100065AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100065BF8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v7 = 0;
  id v3 = [v2 _retrieveFreeSpaceStatus:&v7];
  id v4 = v7;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    if (v3) {
      id v6 = 0;
    }
    else {
      id v6 = v4;
    }
    (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v3, v6);
  }
}

void sub_100065C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100065E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100065F40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100066298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

NSArray *__cdecl sub_100066348(id a1, MailAccount *a2)
{
  id v2 = [(MailAccount *)a2 allMailboxUids];
  id v3 = objc_msgSend(v2, "ef_map:", &stru_10013BF00);

  return (NSArray *)v3;
}

void sub_1000663A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000663B0(id a1, MFMailboxUid *a2)
{
  id v2 = [(MFMailboxUid *)a2 fullPath];

  return v2;
}

uint64_t sub_1000663E0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *a4;
  return result;
}

void sub_1000664B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100066638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100066888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Block_object_dispose((const void *)(v33 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000668F4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKey:NSFileSize];
  id v8 = [v7 integerValue];

  *(void *)(*(void *)(a1[4] + 8) + 24) += v8;
  if ([v10 rangeOfString:@"/Attachments/"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v10 rangeOfString:@"/Messages/"] == (id)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = a1[7];
    }
    else {
      uint64_t v9 = a1[6];
    }
  }
  else
  {
    uint64_t v9 = a1[5];
  }
  *(void *)(*(void *)(v9 + 8) + 24) += v8;
}

void sub_1000669E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100066AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100066AC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 objectForKeyedSubscript:NSFileReferenceCount];
  id v5 = [v4 integerValue];

  if (v5 == (id)1) {
    id v6 = [v7 fileSize];
  }
  else {
    id v6 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v6;
}

void sub_100066B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100066CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100066D50()
{
}

void sub_100066D58(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 fileCreationDate];
  if (objc_msgSend(v6, "ef_isEarlierThanDate:", *(void *)(a1 + 32)))
  {
    id v7 = [v5 objectForKeyedSubscript:NSFileSize];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v7 longLongValue];

    [*(id *)(a1 + 40) removeItemAtPath:v8 error:0];
  }
}

void sub_100066E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100066EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100066F04(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:NSFileReferenceCount];
  id v7 = [v6 integerValue];

  id v8 = +[NSFileManager defaultManager];
  unsigned int v9 = [v8 removeItemAtPath:v12 error:0];

  if (v7 == (id)1) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v10 == 1) {
    id v11 = [v5 fileSize];
  }
  else {
    id v11 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v11;
}

void sub_100066FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000671A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006720C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 fileModificationDate];
  unsigned int v7 = objc_msgSend(v6, "ef_isEarlierThanDate:", *(void *)(a1 + 32));

  if (v7) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000672B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000672E8(id a1, NSFileManager *a2, NSString *a3, NSDictionary *a4, BOOL *a5)
{
}

void sub_100067300(id a1, NSFileManager *a2, NSString *a3, NSDictionary *a4, BOOL *a5)
{
  unsigned int v7 = a2;
  id v6 = a3;
  if ([(NSString *)v6 hasSuffix:@"/Messages"]) {
    [(NSFileManager *)v7 removeItemAtPath:v6 error:0];
  }
}

void sub_100067374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100067480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000675DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006791C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100067A68(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BAC8;
  qword_10016BAC8 = (uint64_t)v1;
}

void sub_100067AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100067B6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100067B7C(id a1, MFXPCClient *a2)
{
  return 1;
}

id sub_100067B84(id a1, MFXPCClient *a2)
{
  id v2 = a2;
  id v3 = [[MFDOpenCompose alloc] initWithClient:v2];

  return v3;
}

void sub_100067BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100067C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100067D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100067EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100067F34(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v12 = 0;
  id v3 = SBSCreateOpenApplicationService();
  id v4 = [v3 canOpenApplication:kMFMobileMailBundleIdentifier reason:&v12];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = FBSOpenApplicationErrorCodeToString();
    id v6 = (void *)v5;
    unsigned int v7 = @"Unknown";
    if (v5) {
      unsigned int v7 = (__CFString *)v5;
    }
    id v8 = v7;

    NSErrorUserInfoKey v13 = NSUnderlyingErrorKey;
    unsigned int v9 = FBSOpenApplicationErrorCreate();
    char v14 = v9;
    unsigned int v10 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1, v8);
    *a2 = +[NSError em_internalErrorWithReason:@"Cannot open application" userInfo:v10];
  }
  return v4;
}

void sub_100068088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000680BC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    id v8 = +[NSXPCConnection currentConnection];
    unsigned int v9 = EFBundleIdentifierForXPCConnection();
    [v6 setHostApplicationBundleIdentifier:v9];

    if (v7)
    {
      unsigned int v10 = [MFDOpenComposeDelegateConfiguration alloc];
      id v11 = [v6 autosaveIdentifier];
      uint64_t v12 = v11;
      if (!v11)
      {
        id v3 = +[NSUUID UUID];
        uint64_t v12 = [v3 UUIDString];
      }
      NSErrorUserInfoKey v13 = [(MFDOpenComposeDelegateConfiguration *)v10 initWithIdentifier:v12 delegateEndpoint:v7 isEntitledDelegate:*(unsigned __int8 *)(a1 + 16)];
      if (!v11)
      {
      }
      [*(id *)(a1 + 24) registerConfiguration:v13];
    }
    else
    {
      NSErrorUserInfoKey v13 = 0;
    }
    id v28 = 0;
    char v14 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v28];
    id v15 = v28;
    id v16 = objc_alloc((Class)NSUserActivity);
    id v17 = [v16 initWithActivityType:MSMailActivityHandoffTypeComposeWithStreams];
    id v18 = [v6 autosaveIdentifier];
    long long v19 = MSMailComposeWindowTargetContentIdentifierWithIdentifier();
    [v17 setTargetContentIdentifier:v19];

    id v20 = objc_alloc_init((Class)NSMutableDictionary);
    long long v21 = v20;
    if (v14)
    {
      [v20 setObject:v14 forKeyedSubscript:kMSOpenMailComposeViewControllerContextKey];
    }
    else
    {
      int v22 = +[MFDOpenCompose log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        sub_1000C17F8();
      }
    }
    if (v13)
    {
      uint64_t v23 = [(MFDOpenComposeDelegateConfiguration *)v13 identifier];
      [v21 setObject:v23 forKeyedSubscript:kMSOpenComposeDelegateIdentifierKey];
    }
    else
    {
      uint64_t v23 = +[MFDOpenCompose log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Connection doesn't match criteria for entitled compose", buf, 2u);
      }
    }

    [v17 setUserInfo:v21];
    long long v24 = +[MFDOpenCompose log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      long long v25 = [v17 activityType];
      long long v26 = [v17 targetContentIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v25;
      __int16 v31 = 2114;
      id v32 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Creating user activity of type: %{public}@, content identifier: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void sub_100068440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100068534(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = +[NSMutableDictionary dictionaryWithCapacity:4];
    [v7 setObject:v5 forKeyedSubscript:&off_1001461D0];
    id v8 = [*(id *)(a1 + 32) activityType];
    [v7 setObject:v8 forKeyedSubscript:&off_1001461E8];

    unsigned int v9 = [*(id *)(a1 + 32) activityType];
    [v7 setObject:v9 forKeyedSubscript:&off_100146200];

    unsigned int v10 = +[NSDate date];
    [v7 setObject:v10 forKeyedSubscript:&off_100146218];

    id v11 = [objc_alloc((Class)UIActivityContinuationAction) initWithSettings:v7];
    v24[0] = SBSOpenApplicationLayoutRoleCenter;
    v23[0] = SBSOpenApplicationOptionKeyLayoutRole;
    v23[1] = FBSOpenApplicationOptionKeyActions;
    id v22 = v11;
    uint64_t v12 = +[NSArray arrayWithObjects:&v22 count:1];
    v24[1] = v12;
    v23[2] = UISOpenApplicationOptionKeyTargetContentIdentifier;
    NSErrorUserInfoKey v13 = [*(id *)(a1 + 32) targetContentIdentifier];
    v24[2] = v13;
    char v14 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
    id v15 = +[FBSOpenApplicationOptions optionsWithDictionary:v14];

    id v16 = SBSCreateOpenApplicationService();
    uint64_t v17 = kMFMobileMailBundleIdentifier;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_1000688D0;
    v20[3] = &unk_10013C0B0;
    id v21 = *(id *)(a1 + 40);
    [v16 openApplication:v17 withOptions:v15 completion:v20];
  }
  else
  {
    id v18 = +[MFDOpenCompose log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      sub_1000C183C();
    }

    uint64_t v19 = *(void *)(a1 + 40);
    if (v19) {
      (*(void (**)(uint64_t, id))(v19 + 16))(v19, v6);
    }
  }
}

void sub_10006882C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000688D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[MFDOpenCompose log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      sub_1000C1880();
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }
}

void sub_1000689A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000689E0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_1000689FC(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void sub_100068A68(id a1)
{
  id v1 = [[MFDOpenComposeDelegateConfigurationStore alloc] _init];
  id v2 = (void *)qword_10016BAD8;
  qword_10016BAD8 = (uint64_t)v1;
}

void sub_100068B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);
  _Unwind_Resume(a1);
}

void sub_100068C40(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_100068D08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100068DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100068F04(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BAE8;
  qword_10016BAE8 = (uint64_t)v1;
}

void sub_100068F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100069004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100069014(id a1, MFXPCClient *a2)
{
  id v2 = a2;
  id v3 = [[MFDOpenComposeDelegateRequest alloc] initWithClient:v2];

  return v3;
}

void sub_100069068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000690DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000692BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v14 = v13;

  _Unwind_Resume(a1);
}

void sub_100069394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000694A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000694BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithClient:v3];

  return v4;
}

void sub_100069510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000696AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  uint64_t v19 = v18;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1000696EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stop];
}

void sub_100069734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100069788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000697EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unsigned int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFDSearch;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000698DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069A94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100069AE0(void *a1, int a2)
{
  id v3 = a1;
  id v4 = [v3 type];
  unsigned int v37 = [v3 criteria];
  if (![_MSCriterionTypeComplex isEqualToString:v4])
  {
    if ([MSCriterionTypeReceivedDate isEqualToString:v4])
    {
      id v20 = [v3 qualifier];
      if ([MSCriterionQualifierGreaterThan isEqualToString:v20])
      {
        uint64_t v21 = 6;
LABEL_37:
        [v37 timeIntervalSince1970];
        double v27 = v26;
        id v28 = objc_alloc((Class)MFMessageCriterion);
        id v29 = +[NSString stringWithFormat:@"%llu", (unint64_t)v27];
        id v30 = [v28 initWithType:11 qualifier:v21 expression:v29];

        [v30 setDateUnits:0];
LABEL_38:

        goto LABEL_62;
      }
      if ([MSCriterionQualifierLessThan isEqualToString:v20])
      {
        uint64_t v21 = 5;
        goto LABEL_37;
      }
LABEL_60:

      goto LABEL_61;
    }
    if ([MSCriterionTypeReadStatus isEqualToString:v4])
    {
      unsigned int v22 = [v37 isEqualToString:MSCriterionExpressionRead];
      id v23 = objc_alloc((Class)MFMessageCriterion);
      if (v22) {
        uint64_t v24 = 3;
      }
      else {
        uint64_t v24 = 7;
      }
      id v25 = [v23 initWithType:27 qualifier:v24 expression:MessageIsRead];
    }
    else if ([MSCriterionTypeMessageReference isEqualToString:v4])
    {
      objc_msgSend(v37, "mf_messageCriterion");
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (![MSCriterionTypeConversationReference isEqualToString:v4])
      {
        if ([MSCriterionTypePredicateFormat isEqualToString:v4])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_61;
          }
          id v20 = objc_alloc_init((Class)MFMessageCriterionConverter);
          id v31 = [v20 messageCriterionFromPredicateFormatString:v37];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_61;
          }
          id v20 = [v3 qualifier];
          if ([MSCriterionQualifierContains isEqualToString:v20])
          {
            uint64_t v32 = 0;
          }
          else
          {
            if (![MSCriterionQualifierDoesNotContain isEqualToString:v20]) {
              goto LABEL_60;
            }
            uint64_t v32 = 4;
          }
          if ([MSCriterionTypeSubject isEqualToString:v4])
          {
            id v30 = [objc_alloc((Class)MFMessageCriterion) initWithType:1 qualifier:v32 expression:v37];
            [v30 setCriterionIdentifier:ECMessageHeaderKeySubject];
            goto LABEL_38;
          }
          if ([MSCriterionTypeSender isEqualToString:v4])
          {
            id v34 = objc_alloc((Class)MFMessageCriterion);
            uint64_t v35 = 35;
          }
          else
          {
            if ([MSCriterionTypeRecipient isEqualToString:v4])
            {
              id v30 = [objc_alloc((Class)MFMessageCriterion) initWithType:1 qualifier:v32 expression:v37];
              [v30 setCriterionIdentifier:ECMessageHeaderKeyTo];
              goto LABEL_38;
            }
            if (![MSCriterionTypeAnyRecipient isEqualToString:v4])
            {
              id v30 = 0;
              goto LABEL_38;
            }
            id v34 = objc_alloc((Class)MFMessageCriterion);
            uint64_t v35 = 9;
          }
          id v31 = [v34 initWithType:v35 qualifier:v32 expression:v37];
        }
        id v30 = v31;
        goto LABEL_38;
      }
      objc_msgSend(v37, "mf_conversationCriterion");
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v30 = v25;
    goto LABEL_62;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v37, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v6 = v37;
    id v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v43;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v6);
        }
        unsigned int v10 = sub_100069AE0(*(void *)(*((void *)&v42 + 1) + 8 * v9), 0);
        if (!v10) {
          break;
        }
        [v5 addObject:v10];

        if (v7 == (id)++v9)
        {
          id v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
          if (v7) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    id v11 = [v5 count];
    if (v11 != [v6 count])
    {
      id v30 = 0;
LABEL_52:

      goto LABEL_62;
    }
    __int16 v36 = [v3 qualifier];
    if (a2)
    {
      id v12 = objc_alloc_init((Class)NSMutableArray);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      NSErrorUserInfoKey v13 = +[MailAccount allActivePrimaryMailboxUids];
      id v14 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v39;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v39 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = +[MFMessageCriterion criterionForMailbox:*(void *)(*((void *)&v38 + 1) + 8 * i)];
            [v12 addObject:v17];
          }
          id v14 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v14);
      }

      if ([v12 count])
      {
        id v18 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v12];
        [v5 addObject:v18];
      }
    }
    if ([_MSCriterionQualifierAllRequired isEqualToString:v36])
    {
      uint64_t v19 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v5];
    }
    else
    {
      if (![_MSCriterionQualifierNotAllRequired isEqualToString:v36])
      {
        id v30 = 0;
        goto LABEL_51;
      }
      uint64_t v19 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v5];
    }
    id v30 = (id)v19;
LABEL_51:

    goto LABEL_52;
  }
LABEL_61:
  id v30 = 0;
LABEL_62:

  return v30;
}

void sub_10006A1F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10006A43C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006A4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006A548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006A660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006A6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006A754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006A87C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006AA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006ACA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006AFC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10006B0B8(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 32) count]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *v2;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "setMessage:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v7), (void)v9);
        id v8 = [*(id *)(*(void *)(a1 + 40) + 64) copyResults];
        if (v8) {
          [v3 addObject:v8];
        }

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [*(id *)(*(void *)(a1 + 40) + 56) foundResults:v3 error:0];
}

void sub_10006B234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10006B378(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) foundResults:0 error:*(void *)(a1 + 40)];
}

void sub_10006B44C(id a1)
{
  os_log_t v1 = [(MFXPCServer *)[MFDVIPServices alloc] initWithClient:0];
  id v2 = (void *)qword_10016BAF8;
  qword_10016BAF8 = (uint64_t)v1;
}

void sub_10006B648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B7AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006B948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006BDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id sub_10006BEE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006BFD8;
  v9[3] = &unk_10013C180;
  id v5 = v3;
  id v10 = v5;
  id v6 = [v4 indexOfObjectPassingTest:v9];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) objectAtIndex:v6];
  }

  return v7;
}

void sub_10006BFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10006BFD8(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:kVIPEmailAddressesKey];
  id v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

void sub_10006C028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006C038(uint64_t a1, void *a2)
{
  id v27 = a2;
  id v3 = [v27 sendersIfCached];
  id v4 = [v3 firstObject];

  if (v4)
  {
    unsigned __int8 v5 = [v27 messageFlags];
    id v6 = [v27 dateSent];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = v4;
    long long v9 = [v8 emailAddressValue];
    id v10 = [v9 simpleAddress];
    long long v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v8 stringValue];
    }
    NSErrorUserInfoKey v13 = v12;

    id v14 = (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v13);

    if (v14)
    {
      if ((v5 & 1) == 0)
      {
        uint64_t v15 = kVIPUnreadCountKey;
        id v16 = [v14 objectForKeyedSubscript:kVIPUnreadCountKey];
        uint64_t v17 = (char *)[v16 unsignedIntegerValue] + 1;

        id v18 = +[NSNumber numberWithUnsignedInteger:v17];
        [v14 setObject:v18 forKeyedSubscript:v15];
      }
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      unint64_t v20 = *(void *)(v19 + 24);
      *(void *)(v19 + 24) = v20 + 1;
      if (v20 <= 0x31)
      {
        uint64_t v21 = [v14 objectForKeyedSubscript:@"priv_totalMessageCount"];
        unsigned int v22 = (char *)[v21 unsignedIntegerValue] + 1;

        id v23 = +[NSNumber numberWithUnsignedInteger:v22];
        [v14 setObject:v23 forKeyedSubscript:@"priv_totalMessageCount"];
      }
      uint64_t v24 = [v14 objectForKeyedSubscript:@"priv_recentInteractionDate"];
      if (!v24
        || ([v14 objectForKeyedSubscript:@"priv_recentInteractionDate"],
            id v25 = objc_claimAutoreleasedReturnValue(),
            id v26 = [v25 compare:v6],
            v25,
            v24,
            v26 == (id)-1))
      {
        [v14 setObject:v6 forKeyedSubscript:@"priv_recentInteractionDate"];
      }
    }
  }
}

void sub_10006C284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006C308()
{
  JUMPOUT(0x10006C2F8);
}

void sub_10006C314()
{
}

int64_t sub_10006C31C(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v4 = a2;
  unsigned __int8 v5 = a3;
  id v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"priv_totalMessageCount"];
  uint64_t v7 = [(NSDictionary *)v5 objectForKeyedSubscript:@"priv_totalMessageCount"];
  id v8 = [v6 unsignedIntegerValue];
  if (v8 <= [v7 unsignedIntegerValue])
  {
    id v10 = [v6 unsignedIntegerValue];
    if (v10 >= [v7 unsignedIntegerValue])
    {
      long long v11 = [(NSDictionary *)v4 objectForKeyedSubscript:@"priv_recentInteractionDate"];
      id v12 = [(NSDictionary *)v5 objectForKeyedSubscript:@"priv_recentInteractionDate"];
      int64_t v9 = (int64_t)[v12 compare:v11];
    }
    else
    {
      int64_t v9 = 1;
    }
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

void sub_10006C434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006C4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006C5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_10006C68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006C730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006C898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006C8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFFetchProcessor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10006C99C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006CA70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006CA8C(id a1, MFActivityConditionBuilder *a2)
{
  id v3 = a2;
  [(MFActivityConditionBuilder *)v3 setRequireWiFi:1];
  [(MFActivityConditionBuilder *)v3 setRequireExternalPower:1];
  [(MFActivityConditionBuilder *)v3 setRequireScreenLocked:1];
  LODWORD(v2) = 1050253722;
  [(MFActivityConditionBuilder *)v3 setMinBatteryLevel:v2];
  [(MFActivityConditionBuilder *)v3 setMaxThermalPressureLevel:1];
}

void sub_10006CB08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006CBC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006CBE0(id a1, MFActivityConditionBuilder *a2)
{
}

void sub_10006CEE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006D82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10006D954(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) -= *(void *)(result + 40);
  return result;
}

uint64_t sub_10006D968(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) -= *(void *)(result + 40);
  return result;
}

uint64_t sub_10006D97C(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) -= *(void *)(result + 40);
  return result;
}

uint64_t sub_10006D990(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) -= *(void *)(result + 40);
  return result;
}

void sub_10006DA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10006DACC(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([v4 BOOLValue] & 1) == 0) {
    [WeakRetained _cancelCurrentInvocations];
  }
}

void sub_10006DB34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006DD88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, uint64_t a11, uint64_t a12, uint64_t a13)
{
  _Unwind_Resume(a1);
}

void sub_10006DEB8(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 56);
  os_log_t v1 = *(void **)(a1 + 32);
  if (!v1[7])
  {
    double v2 = [v1 finishedProcessing];
    dispatch_semaphore_signal(v2);
  }
}

void sub_10006E2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006E760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

BOOL sub_10006E84C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isStore] & 1) == 0
    || ([*(id *)(a1 + 32) excludedMailboxTypes],
        id v4 = objc_claimAutoreleasedReturnValue(),
        +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 mailboxType]),
        unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v4 containsObject:v5],
        v5,
        v4,
        (v6 & 1) != 0)
    || [v3 isNotesMailboxUid]
    && ([*(id *)(a1 + 40) isSyncingNotes] & 1) != 0)
  {
    BOOL v7 = 1;
  }
  else
  {
    int64_t v9 = +[MailPersistentStorage sharedStorage];
    id v10 = [v3 URLString];
    long long v11 = [v9 fetchDateForSource:v10];

    if (v11) {
      BOOL v7 = [v11 compare:*(void *)(a1 + 48)] == (id)1;
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7;
}

void sub_10006E968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006EBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10006EC38(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  objc_msgSend(v2, "addObject:");
}

void sub_10006EC90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006ED78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10006ED9C(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [a2 URLString];
  id v4 = [v2 fetchDateForSource:v3];

  return v4;
}

void sub_10006EDF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006EFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10006EFF4(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  unsigned __int8 v6 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  *(void *)(*(void *)(a1 + 40) + 16 * a3) = a3;
  BOOL v7 = v6;
  if (!v6)
  {
    BOOL v7 = +[NSDate distantPast];
  }
  [v7 timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 40) + 16 * a3 + 8) = v8;
  if (!v6) {
}
  }

void sub_10006F0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10006F0F4(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 8);
  double v3 = *(double *)(a2 + 8);
  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v2 != v3;
  }
}

intptr_t sub_10006F2CC(uint64_t a1, uint64_t a2)
{
  if (a2 == 2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10006F580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006F69C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.mobilemail", (const char *)[v3 UTF8String]);
  double v2 = (void *)qword_10016BB18;
  qword_10016BB18 = (uint64_t)v1;
}

void sub_10006F70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006F8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v15 = v14;

  _Unwind_Resume(a1);
}

void sub_10006F90C(id a1, OS_xpc_object *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_30_MIN);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
}

void sub_10006F9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006F9E4(uint64_t a1, void *a2)
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006FB28;
  v11[3] = &unk_10013AA18;
  id v3 = a2;
  id v12 = v3;
  id v4 = objc_retainBlock(v11);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_10006FB30;
  v8[3] = &unk_10013C3A8;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v5;
  uint64_t v10 = v6;
  BOOL v7 = objc_retainBlock(v8);
  [*(id *)(a1 + 32) runLibraryCompressionShouldDefer:v4 completion:v7];
}

void sub_10006FB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

BOOL sub_10006FB28(uint64_t a1)
{
  return xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
}

void sub_10006FB30(uint64_t a1, int a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
    {
      id v5 = +[MFLibraryCompressionActivityManager log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
        sub_1000C18C4(v7, state, v5);
      }
    }
    if (a2) {
      [*(id *)(a1 + 40) _unregisterXPCActivity];
    }
  }
}

void sub_10006FBEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006FCB0(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  double v2 = (void *)qword_10016BB28;
  qword_10016BB28 = (uint64_t)v1;
}

void sub_10006FD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10006FDE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10006FE40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000704C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000705C0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void sub_100070684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100070694(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mailboxNeedsCompression:a2];
}

void sub_1000707E8(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_10007098C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100070B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100070C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007118C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_1000712F8(id a1, MFLibraryMessage *a2)
{
  double v2 = [(MFLibraryMessage *)a2 nanoMessageId];

  return (NSString *)v2;
}

Class sub_100071350()
{
  if (qword_10016BB48 != -1) {
    dispatch_once(&qword_10016BB48, &stru_10013C430);
  }
  Class result = objc_getClass("NNMKMessage");
  qword_10016BB38 = (uint64_t)result;
  off_10016A560 = (uint64_t (*)())sub_1000713B4;
  return result;
}

id sub_1000713B4()
{
  return (id)qword_10016BB38;
}

void sub_1000713C0(id a1)
{
  qword_10016BB40 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer", 2);
  if (!qword_10016BB40) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer");
  }
}

void sub_10007149C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  double v2 = (void *)qword_10016BB50;
  qword_10016BB50 = (uint64_t)v1;
}

void sub_10007150C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007159C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000716C0(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) detector];
  [v2 ignoreCommand:*(void *)(a1 + 40)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

void sub_10007171C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007180C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10007183C(uint64_t a1)
{
  double v2 = +[MFListUnsubscribeMessageGenerator_iOS deliveryForCommand:*(void *)(a1 + 32)];
  id v3 = [v2 message];
  id v4 = objc_alloc((Class)EMOutgoingMessage);
  id v5 = [v3 messageData];
  id v6 = [v4 initWithMessageData:v5];

  BOOL v7 = [*(id *)(a1 + 40) outgoingMessageRepository];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  id v10[2] = sub_1000719D0;
  v10[3] = &unk_10013C480;
  int8x16_t v9 = *(int8x16_t *)(a1 + 32);
  id v8 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  id v12 = *(id *)(a1 + 48);
  [v7 deliverMessage:v6 usingMailDrop:0 isCancelable:0 completion:v10];
}

void sub_100071980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1000719D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = (unint64_t)[v3 status];
  if (v4 > 9 || ((1 << v4) & 0x3B2) == 0)
  {
    int8x16_t v9 = [*(id *)(a1 + 32) detector];
    [v9 acceptCommand:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = +[MFListUnsubscribeHandler_iOS log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = [v3 error];
      int8x16_t v11 = objc_msgSend(v10, "ef_publicDescription");
      int v12 = 138543618;
      NSErrorUserInfoKey v13 = v11;
      __int16 v14 = 2048;
      unint64_t v15 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error unsubscribing from mail: %{public}@, delivery status: %ld", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    id v8 = [v3 error];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

void sub_100071B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071CE8(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

id sub_100071D14(id a1, EDAccount *a2)
{
  double v2 = a2;
  if ([(EDAccount *)v2 conformsToProtocol:&OBJC_PROTOCOL___EDReceivingAccount])
  {
    id v3 = [(EDAccount *)v2 emailAddresses];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_100071D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100071E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100071E88(uint64_t a1)
{
  [*(id *)(a1 + 32) setMailAccounts:*(void *)(a1 + 40)];
  double v2 = *(void **)(a1 + 32);
  id v3 = [v2 mailAccounts];
  unint64_t v4 = [v2 _activeNonLocalAccountsWithMailAccounts:v3];
  [*(id *)(a1 + 32) setDisplayedAccounts:v4];

  [*(id *)(a1 + 32) setOrderedAccounts:0];
  [*(id *)(a1 + 32) setFocusedAccounts:0];
  id v5 = [*(id *)(a1 + 48) focusedAccountIdentifiers];
  if ([v5 count])
  {
    id v6 = [*(id *)(a1 + 32) displayedAccounts];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    void v8[2] = sub_100072010;
    v8[3] = &unk_10013B2C0;
    id v9 = v5;
    uint64_t v7 = objc_msgSend(v6, "ef_filter:", v8);
    [*(id *)(a1 + 32) setFocusedAccounts:v7];
  }
  +[MailAccount performOnAccounts:*(void *)(a1 + 40) accountBlock:&stru_10013C4E8];
}

void sub_100071FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100072010(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  id v4 = [v2 containsObject:v3];

  return v4;
}

void sub_100072058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100072068(id a1, MailAccount *a2)
{
  double v2 = a2;
  if ([(MailAccount *)v2 isActive])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = [(MailAccount *)v2 accountConduit];
    }
    unsigned __int8 v4 = [(MailAccount *)v2 resetSpecialMailboxesCanPostNotifications:0];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

void sub_1000720E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000721F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100072220(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueID];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_100072264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007247C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100072670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10007272C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100072740(id a1, MailAccount *a2)
{
  double v2 = [(MailAccount *)a2 uniqueID];

  return v2;
}

void sub_1000727C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000727D4(id a1, MailAccount *a2)
{
  double v2 = [(MailAccount *)a2 uniqueID];

  return v2;
}

void sub_100072840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007293C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000729BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000729CC(id a1, MailAccount *a2)
{
  double v2 = a2;
  [(MailAccount *)v2 uniqueIdForPersistentConnection];
  BOOL v3 = PCSettingsGetPollInterval() != -1;

  return v3;
}

void sub_100072A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100072BD8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100072D50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100072F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100072FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000731A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000733B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000735B0(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v5;
    __int16 v17 = 2048;
    id v18 = [v5 messageSize];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#MessageBodyProcessor Found message to download %@ of size: %lu", buf, 0x16u);
  }

  uint64_t v7 = [[_MFMFMailboxMessageBodyProcessorLoaderClient alloc] initWithMessage:v5];
  id v8 = [*(id *)(a1 + 32) messageBodyLoader];
  [v8 addSingleMessageClient:v7];

  id v9 = [(_MFMFMailboxMessageBodyProcessorLoaderClient *)v7 future];
  id v14 = 0;
  id v10 = [v9 resultWithTimeout:&v14 error:300.0];
  id v11 = v14;

  if (v11)
  {
    *a3 = 1;
    int v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSErrorUserInfoKey v13 = objc_msgSend(v11, "ef_publicDescription");
      sub_1000C19F0((uint64_t)v5, v13, buf, v12);
    }
  }
}

void sub_100073748(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_100073A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100073B04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = objc_msgSend(v3, "ef_publicDescription");
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#MessageBodyProcessor Testing message %{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) _shouldTryToDownloadMessage:v3];

  return v6;
}

void sub_100073BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073C0C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) _shouldContinueProcessing])
  {
    if ([*(id *)(a1 + 32) _shouldDownloadMessage:v6]) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [*(id *)(a1 + 32) mailbox];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#MessageBodyProcessor Should stop searching %@ because condition are no more met", (uint8_t *)&v9, 0xCu);
    }
    *a4 = 1;
  }
}

void sub_100073D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100073FB8(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100074134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000741D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000741E0(id a1)
{
  v3[0] = @"displayName";
  v3[1] = @"relativePath";
  v4[0] = &stru_10013C620;
  v4[1] = &stru_10013C640;
  v3[2] = @"type";
  v3[3] = @"level";
  _DWORD v4[2] = &stru_10013C660;
  v4[3] = &stru_10013C680;
  void v3[4] = @"pushState";
  v4[4] = &stru_10013C6A0;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  double v2 = (void *)qword_10016BB60;
  qword_10016BB60 = v1;
}

id sub_1000742D4(id a1, MFMailboxResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMailboxResultsGenerator *)a2 _displayName:a3];

  return v3;
}

id sub_100074304(id a1, MFMailboxResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMailboxResultsGenerator *)a2 _relativePath:a3];

  return v3;
}

id sub_100074334(id a1, MFMailboxResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMailboxResultsGenerator *)a2 _type:a3];

  return v3;
}

id sub_100074364(id a1, MFMailboxResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMailboxResultsGenerator *)a2 _level:a3];

  return v3;
}

id sub_100074394(id a1, MFMailboxResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMailboxResultsGenerator *)a2 _pushState:a3];

  return v3;
}

void sub_1000746C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100074788(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100074A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100074B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100074E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_100074F6C()
{
}

void sub_100074FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100075438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_100075558(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSFileManager defaultManager];
  id v9 = 0;
  unint64_t v5 = (unint64_t)objc_msgSend(v4, "mf_sizeForDirectoryAtURL:error:", v3, &v9);
  id v6 = v9;

  if ((v5 & 0x8000000000000000) != 0)
  {
    if ([v6 code] != (id)2)
    {
      uint64_t v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = objc_msgSend(v6, "ef_publicDescription");
        sub_1000C1A58((uint64_t)v3, v8, buf, v7);
      }
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v5;
  }
}

void sub_100075670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100075738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFMailPurgeableStorageMonitor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000757F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000758A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000758B0(id a1, OS_xpc_object *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
}

void sub_100075944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100075958(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushPurgeableStateUpdate];
}

void sub_100075C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100075CBC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) purgeableStorage];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 nonPurgeableSpace];
}

void sub_100075D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100075D54(id a1)
{
}

void sub_100075E00(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BB80;
  qword_10016BB80 = (uint64_t)v1;
}

void sub_100075E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100076044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  unint64_t v15 = v14;

  _Unwind_Resume(a1);
}

void sub_100076070(id a1, OS_xpc_object *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_30_MIN);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
}

void sub_100076134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100076148(uint64_t a1, void *a2)
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007628C;
  v11[3] = &unk_10013AA18;
  id v3 = a2;
  id v12 = v3;
  id v4 = objc_retainBlock(v11);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_100076294;
  v8[3] = &unk_10013C3A8;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v5;
  uint64_t v10 = v6;
  uint64_t v7 = objc_retainBlock(v8);
  [*(id *)(a1 + 32) runMarkLibraryPurgeableUpgraderShouldDefer:v4 completion:v7];
}

void sub_100076264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

BOOL sub_10007628C(uint64_t a1)
{
  return xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
}

void sub_100076294(uint64_t a1, int a2, int a3)
{
  if (a3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 5;
  }
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), v5))
  {
    uint64_t v6 = +[MFMarkLibraryPurgeableActivityManager log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
      sub_1000C1AC0(v8, state, v5, v6);
    }
  }
  if (a2) {
    [*(id *)(a1 + 40) _unregisterXPCActivity];
  }
}

void sub_100076360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100076424(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BB90;
  qword_10016BB90 = (uint64_t)v1;
}

void sub_100076494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100076554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000765B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100076C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100076D44(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void sub_100076E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100076E18(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _mailboxNeedsToBeMarkedPurgeable:a2];
}

void sub_100076FE0(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_100077198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100077368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100077924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_100077AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100077BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100077C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100077C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100077CAC(id a1, EDMessageActionProvider *a2)
{
  id v2 = [(EDMessageActionProvider *)a2 ID];

  return v2;
}

void sub_100077D28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100077E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100077FC0(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BBA0;
  qword_10016BBA0 = (uint64_t)v1;
}

void sub_100078030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000780B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100078160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100078724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33,void *a34)
{
  _Unwind_Resume(a1);
}

MailAccount *__cdecl sub_1000787F0(id a1, MFMailMessage *a2)
{
  id v2 = [(MFMailMessage *)a2 account];

  return (MailAccount *)v2;
}

void sub_100078820(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) mailboxType];
  uint64_t v7 = mailboxUIDTypeFromECMailboxType();
  int v8 = [v5 mailboxUidOfType:v7 createIfNeeded:0];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  _DWORD v15[2] = sub_1000789A8;
  v15[3] = &unk_10013B728;
  v15[4] = v7;
  id v9 = objc_msgSend(v6, "ef_filter:", v15);
  uint64_t v10 = v9;
  if (v8 && [v9 count])
  {
    id v12 = *(void **)(a1 + 40);
    id v11 = *(void **)(a1 + 48);
    NSErrorUserInfoKey v13 = [v8 URL];
    id v14 = [v11 moveMessages:v10 destinationMailboxURL:v13 userInitiated:0];
    [v12 addObjectsFromArray:v14];
  }
}

void sub_10007895C(_Unwind_Exception *a1)
{
  uint64_t v7 = v5;

  _Unwind_Resume(a1);
}

BOOL sub_1000789A8(uint64_t a1, void *a2)
{
  id v3 = [a2 mailbox];
  BOOL v4 = [v3 type] != *(id *)(a1 + 32);

  return v4;
}

void sub_1000789F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100078A00(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41)) {
    [v3 changesReadTo:*(unsigned __int8 *)(a1 + 40) != 0];
  }
  if (*(unsigned char *)(a1 + 42))
  {
    [v3 changesFlaggedTo:1];
    [v3 changesFlagColorTo:*(void *)(a1 + 32)];
  }
  else if (*(unsigned char *)(a1 + 43))
  {
    [v3 changesFlaggedTo:0];
  }
}

void sub_100078A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100078B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100078C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100078C24(id a1, MEMessageAction *a2)
{
  id v2 = [(MEMessageAction *)a2 destination];
  BOOL v3 = v2 != 0;

  return v3;
}

unsigned char *sub_100078C80(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void sub_100078C90(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

int64_t sub_100078CAC(id a1, MFMailboxUid *a2, MFMailboxUid *a3)
{
  BOOL v4 = a2;
  uint64_t v5 = a3;
  id v6 = +[MailPersistentStorage sharedStorage];
  uint64_t v7 = [(MFMailboxUid *)v4 URLString];
  int v8 = [v6 bodyBackfillDateForSource:v7];

  id v9 = +[MailPersistentStorage sharedStorage];
  uint64_t v10 = [(MFMailboxUid *)v5 URLString];
  id v11 = [v9 bodyBackfillDateForSource:v10];

  if (v8)
  {
    if (v11) {
      int64_t v12 = (int64_t)[v8 compare:v11];
    }
    else {
      int64_t v12 = 1;
    }
  }
  else
  {
    int64_t v12 = -1;
  }

  return v12;
}

void sub_100078DA4(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100078F70(_Unwind_Exception *a1)
{
  BOOL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100078FB4(id a1, MFActivityConditionBuilder *a2)
{
  id v2 = a2;
  [(MFActivityConditionBuilder *)v2 setRequireExternalPower:1];
  [(MFActivityConditionBuilder *)v2 setRequireWiFi:1];
  [(MFActivityConditionBuilder *)v2 setRequireScreenLocked:1];
  [(MFActivityConditionBuilder *)v2 setMaxThermalPressureLevel:1];
}

void sub_100079020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100079164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100079574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100079634(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runSynchronously];
}

void sub_1000796A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007992C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100079AE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100079DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

BOOL sub_100079E68(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isStore] & 1) == 0
    || ([*(id *)(a1 + 32) excludedMailboxTypes],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 mailboxType]),
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v4 containsObject:v5],
        v5,
        v4,
        (v6 & 1) != 0)
    || [v3 isNotesMailboxUid]
    && ([*(id *)(a1 + 40) isSyncingNotes] & 1) != 0)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) persistentStorage];
    uint64_t v10 = [v3 URLString];
    id v11 = [v9 bodyBackfillDateForSource:v10];

    if (v11) {
      BOOL v7 = [v11 compare:*(void *)(a1 + 48)] == (id)1;
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7;
}

void sub_100079F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007A0E4(id a1)
{
}

void sub_10007A1DC(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

id sub_10007A214(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)MFMessageCriterion) initWithType:*(void *)(a1 + 32) qualifier:8 expression:v3];

  return v4;
}

void sub_10007A274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007A3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_10007A3EC(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  id v2 = objc_msgSend(v1, "initWithObjects:", MFMessageHasAttachments, MFMessageConversationIsVIP, MFMessageConversationIsMuted, MessageIsJournaled, 0);
  id v3 = (void *)qword_10016BBC8;
  qword_10016BBC8 = (uint64_t)v2;
}

id sub_10007A46C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v6 = objc_msgSend(v4, "ef_publicDescription");
      int v24 = 138412290;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Warning Unsupported criterion during server-side searchability determination (failing transformation) : %@", (uint8_t *)&v24, 0xCu);
    }
LABEL_8:
    uint64_t v9 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = (uint64_t)[v3 criterionType];
  uint64_t v5 = [v4 expression];
  id v8 = v4;
  uint64_t v9 = v8;
  if (v7 <= 22)
  {
    if ((unint64_t)(v7 - 11) < 2)
    {
      [v5 doubleValue];
      NSErrorUserInfoKey v13 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
      id v14 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
      unint64_t v15 = [v14 components:96 fromDate:v13];
      if ([v15 hour] || objc_msgSend(v15, "minute"))
      {

        uint64_t v9 = 0;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v9 != 0;

LABEL_31:
    }
    else
    {
      if (v7 != 1 && v7 != 9)
      {
LABEL_15:
        id v11 = MFLogGeneral();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v12 = objc_msgSend(v9, "ef_publicDescription");
          int v24 = 138412290;
          id v25 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Warning unexpected criterion during server-side searchability determination (assuming YES) : %@", (uint8_t *)&v24, 0xCu);
        }
      }
LABEL_18:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    switch(v7)
    {
      case 23:
      case 24:
      case 34:
      case 39:
      case 42:
      case 44:
      case 45:
        goto LABEL_7;
      case 26:
        id v16 = [v8 criteria];
        __int16 v17 = [v16 firstObject];
        NSErrorUserInfoKey v13 = [v17 mailServerSideCriterion];

        if (v13)
        {
          uint64_t v18 = +[MFMessageCriterion notCriterionWithCriterion:v13];

          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          uint64_t v9 = (void *)v18;
        }
        else
        {

          uint64_t v9 = 0;
        }
        goto LABEL_31;
      case 27:
        if ([MFMessageSenderIsVIP isEqualToString:v5])
        {
          uint64_t v19 = +[VIPManager defaultInstance];
          uint64_t v20 = [v19 allVIPEmailAddressesCriterion];

          uint64_t v9 = (void *)v20;
          goto LABEL_37;
        }
        if ([MFMessageToOrCcContainsAccountAddress isEqualToString:v5])
        {
          uint64_t v22 = [*(id *)(a1 + 32) myEmailAddressesCriterionWithType:9];
LABEL_36:
          id v23 = (void *)v22;

          uint64_t v9 = v23;
          goto LABEL_37;
        }
        if ([MFMessageToContainsAccountAddress isEqualToString:v5])
        {
          uint64_t v22 = [*(id *)(a1 + 32) myEmailAddressesCriterionWithType:40];
          goto LABEL_36;
        }
        if ([MFMessageCcContainsAccountAddress isEqualToString:v5])
        {
          uint64_t v22 = [*(id *)(a1 + 32) myEmailAddressesCriterionWithType:41];
          goto LABEL_36;
        }
        if ([(id)qword_10016BBC8 containsObject:v5])
        {

          uint64_t v9 = 0;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
LABEL_37:
        BOOL v21 = v9 != 0;
LABEL_38:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v21;
        break;
      case 33:
        BOOL v21 = (unint64_t)[v5 length] > 1;
        goto LABEL_38;
      case 35:
        goto LABEL_18;
      case 46:
      case 49:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_7:

        goto LABEL_8;
      default:
        goto LABEL_15;
    }
  }
LABEL_9:

  return v9;
}

void sub_10007A8BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007AA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10007AAA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 criterionType] == (id)23)
  {
    id v4 = [v3 expression];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }

  return v3;
}

void sub_10007AB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10007AB38(id a1, NSString *a2)
{
  id v2 = +[MailAccount mailboxUidFromActiveAccountsForURL:a2];

  return v2;
}

void sub_10007AC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10007AC40(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 criterionType] == (id)34)
  {
    id v4 = [v3 expression];
    uint64_t v5 = +[NSScanner scannerWithString:v4];
    unsigned __int8 v6 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    uint64_t v7 = +[NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
    [v7 addCharactersInString:@","];
    while (([v5 isAtEnd] & 1) == 0)
    {
      [v5 scanCharactersFromSet:v6 intoString:0];
      unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
      if ([v5 scanLongLong:&v9]) {
        [*(id *)(a1 + 32) addIndex:v9];
      }
      [v5 scanCharactersFromSet:v7 intoString:0];
    }
  }

  return v3;
}

void sub_10007AD68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007AE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFMessageResultsGenerator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10007AF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007AF74(id a1)
{
  v3[0] = @"MSResultsKeyAccountReference";
  v3[1] = @"MSResultsKeyBodySummary";
  v4[0] = &stru_10013C9A0;
  v4[1] = &stru_10013C9C0;
  v3[2] = @"MSResultsKeyConversationReference";
  v3[3] = @"MSResultsKeyDateReceived";
  _DWORD v4[2] = &stru_10013C9E0;
  v4[3] = &stru_10013CA00;
  void v3[4] = @"MSResultsKeyDateSent";
  void v3[5] = @"MSResultsKeyMailboxURL";
  v4[4] = &stru_10013CA20;
  void v4[5] = &stru_10013CA40;
  v3[6] = @"MSResultsKeyMessageIDHash";
  v3[7] = @"MSResultsKeyMessageReference";
  v4[6] = &stru_10013CA60;
  v4[7] = &stru_10013CA80;
  v3[8] = @"MSResultsKeyOutgoing";
  v3[9] = @"MSResultsKeyRecievingAddresses";
  v4[8] = &stru_10013CAA0;
  v4[9] = &stru_10013CAC0;
  v3[10] = @"MSResultsKeyRecipientBcc";
  v3[11] = @"MSResultsKeyRecipientCc";
  v4[10] = &stru_10013CAE0;
  v4[11] = &stru_10013CB00;
  v3[12] = @"MSResultsKeyRecipientTo";
  v3[13] = @"MSResultsKeySender";
  v4[12] = &stru_10013CB20;
  v4[13] = &stru_10013CB40;
  v3[14] = @"MSResultsKeyStatus";
  v3[15] = @"MSResultsKeySubject";
  v4[14] = &stru_10013CB60;
  v4[15] = &stru_10013CB80;
  uint8_t v3[16] = @"MSResultsKeyBestAlternativePart";
  v3[17] = @"MSResultsKeyHeaderData";
  uint8_t v4[16] = &stru_10013CBA0;
  v4[17] = &stru_10013CBC0;
  v3[18] = @"MSResultsKeyIsLocalDraft";
  v3[19] = @"_MSResultsKeyLibraryID";
  v4[18] = &stru_10013CBE0;
  v4[19] = &stru_10013CC00;
  v3[20] = @"MSResultsKeyLocalMessageReference";
  void v3[21] = @"_MSResultsKeyPredictiveModelSummary";
  v4[20] = &stru_10013CC20;
  void v4[21] = &stru_10013CC40;
  v3[22] = @"MSResultsKeyPublisherBulletinID";
  v3[23] = @"MSResultsKeyRFC822Data";
  v4[22] = &stru_10013CC60;
  v4[23] = &stru_10013CC80;
  v3[24] = @"MSResultsKeySuppressionContexts";
  v3[25] = @"_MSResultsKeyMailboxType";
  v4[24] = &stru_10013CCA0;
  v4[25] = &stru_10013CCC0;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:26];
  id v2 = (void *)qword_10016BBD8;
  qword_10016BBD8 = v1;
}

id sub_10007B264(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _accountReference:a3];

  return v3;
}

id sub_10007B294(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _bodySummary:a3];

  return v3;
}

id sub_10007B2C4(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _conversationReference:a3];

  return v3;
}

id sub_10007B2F4(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _dateReceived:a3];

  return v3;
}

id sub_10007B324(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _dateSent:a3];

  return v3;
}

id sub_10007B354(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _mailboxURL:a3];

  return v3;
}

id sub_10007B384(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _messageIDHash:a3];

  return v3;
}

id sub_10007B3B4(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _messageReference:a3];

  return v3;
}

id sub_10007B3E4(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _outgoing:a3];

  return v3;
}

id sub_10007B414(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _receivingAddresses:a3];

  return v3;
}

id sub_10007B444(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _recipientBcc:a3];

  return v3;
}

id sub_10007B474(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _recipientCc:a3];

  return v3;
}

id sub_10007B4A4(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _recipientTo:a3];

  return v3;
}

id sub_10007B4D4(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _sender:a3];

  return v3;
}

id sub_10007B504(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _status:a3];

  return v3;
}

id sub_10007B534(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _subject:a3];

  return v3;
}

id sub_10007B564(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _bestAlternativePart:a3];

  return v3;
}

id sub_10007B594(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _headerData:a3];

  return v3;
}

id sub_10007B5C4(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _isLocalDraft:a3];

  return v3;
}

id sub_10007B5F4(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _messageLibraryID:a3];

  return v3;
}

id sub_10007B624(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _localMessageReference:a3];

  return v3;
}

id sub_10007B654(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _predictiveModelSummary:a3];

  return v3;
}

id sub_10007B684(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _publisherBulletinID:a3];

  return v3;
}

id sub_10007B6B4(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _rfc822Data:a3];

  return v3;
}

id sub_10007B6E4(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _suppressionContexts:a3];

  return v3;
}

id sub_10007B714(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _mailboxType:a3];

  return v3;
}

id sub_10007B744(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _attachmentValueForKey:a3];

  return v3;
}

id sub_10007B774(id a1, MFMessageResultsGenerator *a2, NSString *a3)
{
  id v3 = [(MFMessageResultsGenerator *)a2 _headerValueForKey:a3];

  return v3;
}

void sub_10007B874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007B8DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007B978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007B9E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007BA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007BAB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007BB30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007BB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007BCA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007BE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_10007BE70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10007BE80(uint64_t a1)
{
}

void sub_10007BE88(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v15 = v3;
    id v4 = [v3 content];
    id v5 = [v4 count];
    if (v5)
    {
      unint64_t v6 = 1;
      while (![0 length])
      {
        uint64_t v7 = [v4 objectAtIndex:v6 - 1];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = [v7 htmlData];
          unint64_t v9 = [v7 preferredCharacterSet];
          MFEncodingForCharset();
          uint64_t v10 = (void *)MFCreateStringWithData();
        }
        else
        {
          uint64_t v10 = 0;
        }

        if (!v10 && v6++ < (unint64_t)v5) {
          continue;
        }
        goto LABEL_13;
      }
    }
    uint64_t v10 = 0;
LABEL_13:
    uint64_t v12 = +[ECMessageBodyParsingUtils snippetFromHTMLBody:v10 options:1 maxLength:1000 preservingQuotedForwardedContent:1];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    id v3 = v15;
  }
}

void sub_10007BFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007C238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007C440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007C4E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007C55C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007C5D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007C644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007C6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007C8A0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10007C938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007C9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007CBDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10007CCA8(id a1, NSString *a2, MFAttachment *a3)
{
  id v4 = a2;
  id v5 = [(MFAttachment *)a3 mimeType];
  BOOL v6 = [(NSString *)v4 caseInsensitiveCompare:v5] == NSOrderedSame;

  return v6;
}

void sub_10007CD08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10007CD24(id a1, NSString *a2, MFAttachment *a3)
{
  return [(MFAttachment *)a3 conformsToTypeIdentifier:a2];
}

void sub_10007CD30(id a1)
{
  v3[0] = @"mimeType";
  v3[1] = @"utiType";
  v4[0] = &stru_10013CD68;
  v4[1] = &stru_10013CD88;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  id v2 = (void *)qword_10016BBE8;
  qword_10016BBE8 = v1;
}

void sub_10007CE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007D13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007D1D0(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _knownAttachmentLimiterTests];
  id v6 = [v1 allKeys];

  id v2 = [v6 componentsJoinedByString:@"|"];
  id v3 = +[NSString stringWithFormat:@"%@\\[(%@)=([a-zA-Z0-9.-/]+)\\]", @"MSResultsKeyAttachments", v2];

  id v4 = [objc_alloc((Class)NSRegularExpression) initWithPattern:v3 options:0 error:0];
  id v5 = (void *)qword_10016BBF8;
  qword_10016BBF8 = (uint64_t)v4;
}

void sub_10007D2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_10007D2E0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v34 = a1;
  uint64_t v7 = *(void **)(a1 + 32);
  id v29 = v6;
  id v8 = [v6 rangeAtIndex:1];
  id v30 = objc_msgSend(v7, "substringWithRange:", v8, v9);
  id v28 = a4;
  uint64_t v10 = *(void **)(v34 + 32);
  id v11 = [v29 rangeAtIndex:2];
  uint64_t v33 = objc_msgSend(v10, "substringWithRange:", v11, v12);
  uint64_t v13 = [*(id *)(v34 + 40) _testForAttachmentLimiterType:v30];
  if (v13)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = *(id *)(v34 + 48);
    id v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v14)
    {
      uint64_t v32 = *(void *)v36;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (((unsigned int (**)(void, void *, void *))v13)[2](v13, v33, v16))
          {
            if (!*(void *)(*(void *)(*(void *)(v34 + 56) + 8) + 40))
            {
              uint64_t v17 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [*(id *)(v34 + 48) count]);
              uint64_t v18 = *(void *)(*(void *)(v34 + 56) + 8);
              uint64_t v19 = *(void **)(v18 + 40);
              *(void *)(v18 + 40) = v17;
            }
            uint64_t v20 = [v16 fileName];
            BOOL v21 = [v16 fetchLocalData];
            uint64_t v22 = +[NSMutableDictionary dictionary];
            id v23 = v22;
            if (v20) {
              [v22 setObject:v20 forKeyedSubscript:@"filename"];
            }
            if (v21) {
              [v23 setObject:v21 forKeyedSubscript:@"data"];
            }
            int v24 = *(void **)(*(void *)(*(void *)(v34 + 56) + 8) + 40);
            id v25 = [v16 part];
            id v26 = [v25 partNumber];
            [v24 setObject:v23 forKey:v26];
          }
        }
        id v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v27 = MFLogGeneral();
    id obj = v27;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v41 = v30;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#Warning couldn't find a test for attachment limiter type '%@'", buf, 0xCu);
    }
  }

  unsigned char *v28 = 1;
}

void sub_10007D624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_10007D7AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007D898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007D9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007DA1C()
{
  JUMPOUT(0x10007DA10);
}

void sub_10007DA28()
{
}

void sub_10007DB6C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BC08;
  qword_10016BC08 = (uint64_t)v1;
}

void sub_10007DBDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007DCDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007DD5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFMessageRuleLibraryHook;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10007DE7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007E39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_10007E49C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) messageChangeManager];
  [v7 performOperationOnMessages:v5 withMessageChangeManager:v6];
}

void sub_10007E51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10007E540(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) canExecuteRuleOnMessage:a2];
}

void sub_10007E6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10007E768(uint64_t a1, void *a2)
{
  sub_1000BC1BC(1);

  return [a2 _handleDefaultChanged:0];
}

void sub_10007E880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007E928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007EA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007EC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10007EC88(uint64_t a1, void *a2)
{
  return [a2 _handleNewAccountIdentityAvailable];
}

id sub_10007EC90(uint64_t a1, void *a2)
{
  return [a2 _handleImportantBridgeSettingHasChanged];
}

id sub_10007EC98(uint64_t a1, void *a2)
{
  return [a2 _handleAccountEmailTokenHasChanged];
}

void sub_10007ED3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFNanoAccountHandler;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10007EDC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007EF50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007F210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10007F3FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007F4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007F53C(uint64_t a1)
{
  id v4 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v4 notifyMobileMailAccountsChanged];

  [*(id *)(a1 + 32) _checkIfSettingsChanged];
  id v2 = [*(id *)(a1 + 32) activeAccounts];
  if (v2)
  {
    id v5 = v2;
    id v3 = [*(id *)(a1 + 32) syncProvider];
    [v3 addUpdateOrDeleteAccounts:v5];

    id v2 = v5;
  }
}

void sub_10007F5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_10007F690(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  if ([v2 isEqualToString:@"kIncludeMailBoxesKey"])
  {
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) object];
    unsigned int v4 = [v3 isEqualToString:NanoMailOrganizeByThreadKey];

    if (!v4) {
      return;
    }
  }
  id v5 = *(void **)(a1 + 40);

  [v5 _checkIfSettingsChanged];
}

void sub_10007F738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007F764(id a1)
{
  id v1 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v1 notifyMobileMailSwipeRightActionChanged];
}

void sub_10007F7B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007F850(_Unwind_Exception *a1)
{
  unsigned int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10007F98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10007F9D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = objc_msgSend(v3, "nano_mailbox");
  if ([v4 type] == (id)1)
  {
    id v5 = [*(id *)(a1 + 32) displayName];
    [v4 setCustomName:v5];

    objc_msgSend(v4, "setFilterType:", objc_msgSend(*(id *)(a1 + 40), "inboxesFilterTypes"));
    [v4 setSyncEnabled:1];
  }
  else
  {
    id v6 = objc_msgSend(v3, "nano_displayName");
    [v4 setCustomName:v6];
  }
  id v7 = [*(id *)(a1 + 40) selectedMailboxes];
  id v8 = [v4 mailboxId];
  unsigned int v9 = [v7 containsObject:v8];

  if (v9)
  {
    [v4 setSyncEnabled:1];
    objc_msgSend(v4, "setFilterType:", (unint64_t)objc_msgSend(v4, "filterType") | 1);
  }

  return v4;
}

void sub_10007FAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10007FC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10007FEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008001C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100080040(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  CFStringRef v6 = @"watchedMailboxes";
  uint64_t v7 = v3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"MFNanoServerWatchedMailboxesDidChange" object:v4 userInfo:v5];
}

void sub_100080100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100080198(uint64_t a1)
{
  id v2 = +[MFNanoBridgeSettingsManager sharedInstance];
  uint64_t v3 = [v2 accountIdentities];

  uint64_t v4 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v4 setAccountIdentities:0];

  id v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Nano Received Darwin Notification Account Identity Available. Syncing to watch...", buf, 2u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      unsigned int v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        id v11 = objc_msgSend(*(id *)(a1 + 32), "syncProvider", (void)v14);
        [v11 syncStandaloneAccountIdentity:v10];

        unsigned int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) handleWatchAccountsUpdated];
  uint64_t v12 = [*(id *)(a1 + 32) syncProvider];
  id v13 = [v12 requestWatchAccounts];
}

void sub_10008035C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100080430(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkIfSettingsChanged];
}

void sub_1000804AC(uint64_t a1)
{
  id v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#Nano Received Darwin Notification Account Email Token Changed. Syncing to watch...", v5, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) activeAccounts];
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) syncProvider];
    [v4 addUpdateOrDeleteAccounts:v3];
  }
  [*(id *)(a1 + 32) handleWatchAccountsUpdated];
}

void sub_10008055C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class sub_1000805E4()
{
  if (qword_10016BC28 != -1) {
    dispatch_once(&qword_10016BC28, &stru_10013CE60);
  }
  Class result = objc_getClass("NRPairedDeviceRegistry");
  qword_10016BC18 = (uint64_t)result;
  off_10016A990 = (uint64_t (*)())sub_100080648;
  return result;
}

id sub_100080648()
{
  return (id)qword_10016BC18;
}

void sub_100080654(id a1)
{
  qword_10016BC20 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 2);
  if (!qword_10016BC20) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry");
  }
}

void sub_1000808FC(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100080A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100080B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100080C1C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100080CD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100080D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100080E38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100080FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100081078(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000812A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100081510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100081600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100081884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100081A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100081AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100081B68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100081C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100081D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100081DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100081EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100081F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100081FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000820C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008213C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000823B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100082484()
{
  if (qword_10016BC40 != -1) {
    dispatch_once(&qword_10016BC40, &stru_10013CE80);
  }
  id v0 = (uint64_t (*)())dlsym((void *)qword_10016BC38, "BPSBridgeTintColor");
  off_10016AA58 = v0;

  return v0();
}

void sub_1000824EC(id a1)
{
  qword_10016BC38 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/BridgePreferences.framework/BridgePreferences", 2);
  if (!qword_10016BC38) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/BridgePreferences.framework/BridgePreferences");
  }
}

void sub_10008257C(id a1)
{
  id v1 = objc_alloc_init(MFNanoBridgeSettingsManager);
  id v2 = (void *)qword_10016BC48;
  qword_10016BC48 = (uint64_t)v1;
}

void sub_100082728(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100082840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)MFNanoBridgeSettingsManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100082AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100082D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100082E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100082FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100083080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000831A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100083248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000835F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_100083888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000838F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100083B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100084080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000841A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008425C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100084310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000843C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100084468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008457C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100084648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100084700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008478C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100084868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100084938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000849C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100084A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100084B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100084B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100084C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100084CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100084D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100084DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100084E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100084F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100084FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100085024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100085088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008510C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100085188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100085220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100085310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008561C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100085734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100085A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100085C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class sub_100085C88()
{
  if (qword_10016BCC8 != -1) {
    dispatch_once(&qword_10016BCC8, &stru_10013CEF8);
  }
  Class result = objc_getClass("NPSManager");
  qword_10016BCB8 = (uint64_t)result;
  off_10016AA60 = (uint64_t (*)())sub_100085CEC;
  return result;
}

id sub_100085CEC()
{
  return (id)qword_10016BCB8;
}

void sub_100085CF8(id a1)
{
  qword_10016BCC0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NanoPreferencesSync.framework/NanoPreferencesSync", 2);
  if (!qword_10016BCC0) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/NanoPreferencesSync.framework/NanoPreferencesSync");
  }
}

Class sub_100085D34()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  Class result = objc_getClass("NNMKAccountIdentity");
  qword_10016BCD0 = (uint64_t)result;
  off_10016AA68 = (uint64_t (*)())sub_100085D98;
  return result;
}

id sub_100085D98()
{
  return (id)qword_10016BCD0;
}

void sub_100085DA4(id a1)
{
  qword_10016BCD8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer", 2);
  if (!qword_10016BCD8) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer");
  }
}

id sub_100085DE0()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailLinesOfPreviewKey");
  objc_storeStrong((id *)&qword_10016BC78, *v0);
  off_10016AA70 = (uint64_t (*)())sub_100085E74;
  id v1 = (void *)qword_10016BC78;

  return v1;
}

id sub_100085E74()
{
  return (id)qword_10016BC78;
}

uint64_t sub_100085E80()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  uint64_t result = *(void *)dlsym((void *)qword_10016BCD8, "NanoMailDefaultLinesOfPreview");
  qword_10016BCE8 = result;
  off_10016AA78 = sub_100085EF0;
  return result;
}

uint64_t sub_100085EF0()
{
  return qword_10016BCE8;
}

id sub_100085EFC()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailAskBeforeDeletingKey");
  objc_storeStrong((id *)&qword_10016BC80, *v0);
  off_10016AA80 = (uint64_t (*)())sub_100085F90;
  id v1 = (void *)qword_10016BC80;

  return v1;
}

id sub_100085F90()
{
  return (id)qword_10016BC80;
}

uint64_t sub_100085F9C()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_10016BCD8, "NanoMailDefaultAskBeforeDeleting");
  byte_10016BCF0 = result;
  off_10016AA88 = sub_10008600C;
  return result;
}

uint64_t sub_10008600C()
{
  return byte_10016BCF0;
}

id sub_100086018()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailLoadRemoteImagesKey");
  objc_storeStrong((id *)&qword_10016BC88, *v0);
  off_10016AA90 = (uint64_t (*)())sub_1000860AC;
  id v1 = (void *)qword_10016BC88;

  return v1;
}

id sub_1000860AC()
{
  return (id)qword_10016BC88;
}

uint64_t sub_1000860B8()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_10016BCD8, "NanoMailDefaultLoadRemoteImages");
  byte_10016BCF1 = result;
  off_10016AA98 = sub_100086128;
  return result;
}

uint64_t sub_100086128()
{
  return byte_10016BCF1;
}

id sub_100086134()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailOrganizeByThreadKey");
  objc_storeStrong((id *)&qword_10016BC58, *v0);
  off_10016AAA0 = (uint64_t (*)())sub_1000861C8;
  id v1 = (void *)qword_10016BC58;

  return v1;
}

id sub_1000861C8()
{
  return (id)qword_10016BC58;
}

uint64_t sub_1000861D4()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_10016BCD8, "NanoMailDefaultOrganizeByThread");
  byte_10016BCF2 = result;
  off_10016AAA8 = sub_100086244;
  return result;
}

uint64_t sub_100086244()
{
  return byte_10016BCF2;
}

id sub_100086250()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailSwipeRightActionKey");
  objc_storeStrong((id *)&qword_10016BC60, *v0);
  off_10016AAB0 = (uint64_t (*)())sub_1000862E4;
  id v1 = (void *)qword_10016BC60;

  return v1;
}

id sub_1000862E4()
{
  return (id)qword_10016BC60;
}

id sub_1000862F0()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailDefaultSwipeRightAction");
  objc_storeStrong((id *)&qword_10016BCA8, *v0);
  off_10016AAB8 = (uint64_t (*)())sub_100086384;
  id v1 = (void *)qword_10016BCA8;

  return v1;
}

id sub_100086384()
{
  return (id)qword_10016BCA8;
}

id sub_100086390()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailSignatureKey");
  objc_storeStrong((id *)&qword_10016BC68, *v0);
  off_10016AAC0 = (uint64_t (*)())sub_100086424;
  id v1 = (void *)qword_10016BC68;

  return v1;
}

id sub_100086424()
{
  return (id)qword_10016BC68;
}

Class sub_100086430()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  Class result = objc_getClass("NNMKSyncProvider");
  qword_10016BCF8 = (uint64_t)result;
  off_10016AAC8 = (uint64_t (*)())sub_100086494;
  return result;
}

id sub_100086494()
{
  return (id)qword_10016BCF8;
}

id sub_1000864A0()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailDefaultSignatureLocalizationKey");
  objc_storeStrong((id *)&qword_10016BCB0, *v0);
  off_10016AAD0 = (uint64_t (*)())sub_100086534;
  id v1 = (void *)qword_10016BCB0;

  return v1;
}

id sub_100086534()
{
  return (id)qword_10016BCB0;
}

id sub_100086540()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailAlwaysLoadContentDirectlyKey");
  objc_storeStrong((id *)&qword_10016BC98, *v0);
  off_10016AAD8 = (uint64_t (*)())sub_1000865D4;
  id v1 = (void *)qword_10016BC98;

  return v1;
}

id sub_1000865D4()
{
  return (id)qword_10016BC98;
}

uint64_t sub_1000865E0()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_10016BCD8, "NanoMailDefaultAlwaysLoadContentDirectly");
  byte_10016BD00 = result;
  off_10016AAE0 = sub_100086650;
  return result;
}

uint64_t sub_100086650()
{
  return byte_10016BD00;
}

id sub_10008665C()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailCloudNotificationsEnabledKey");
  objc_storeStrong((id *)&qword_10016BCA0, *v0);
  off_10016AAE8 = (uint64_t (*)())sub_1000866F0;
  id v1 = (void *)qword_10016BCA0;

  return v1;
}

id sub_1000866F0()
{
  return (id)qword_10016BCA0;
}

uint64_t sub_1000866FC()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_10016BCD8, "NanoMailDefaultCloudNotificationsEnabled");
  byte_10016BD01 = result;
  off_10016AAF0 = sub_10008676C;
  return result;
}

uint64_t sub_10008676C()
{
  return byte_10016BD01;
}

id sub_100086778()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailPrivacyProtectionKey");
  objc_storeStrong((id *)&qword_10016BC90, *v0);
  off_10016AAF8 = (uint64_t (*)())sub_10008680C;
  id v1 = (void *)qword_10016BC90;

  return v1;
}

id sub_10008680C()
{
  return (id)qword_10016BC90;
}

id sub_100086818()
{
  if (qword_10016BCE0 != -1) {
    dispatch_once(&qword_10016BCE0, &stru_10013CF18);
  }
  id v0 = (id *)dlsym((void *)qword_10016BCD8, "NanoMailDefaultAccountUidKey");
  objc_storeStrong((id *)&qword_10016BC70, *v0);
  off_10016AB00 = (uint64_t (*)())sub_1000868AC;
  id v1 = (void *)qword_10016BC70;

  return v1;
}

id sub_1000868AC()
{
  return (id)qword_10016BC70;
}

Class sub_1000868B8()
{
  if (qword_10016BCC8 != -1) {
    dispatch_once(&qword_10016BCC8, &stru_10013CEF8);
  }
  Class result = objc_getClass("NPSDomainAccessor");
  qword_10016BD08 = (uint64_t)result;
  off_10016AB08 = (uint64_t (*)())sub_10008691C;
  return result;
}

id sub_10008691C()
{
  return (id)qword_10016BD08;
}

void sub_100086B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100086B60(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) start];
  id v2 = [objc_alloc((Class)NNMKSyncProvider) initWithDelegate:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  [*(id *)(a1 + 32) _addObservers];
  id v5 = [[MFNanoAccountHandler alloc] initWithExecutionQueue:*(void *)(*(void *)(a1 + 32) + 8) syncProvider:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;
}

void sub_100086D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100086E38(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100086F50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100086F60(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 invalidate];
}

void sub_100087014(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) activeAccounts];
  id v4 = (id)v2;
  if (v2) {
    uint64_t v3 = (void *)v2;
  }
  else {
    uint64_t v3 = &__NSArray0__struct;
  }
  [*(id *)(*(void *)(a1 + 32) + 16) replyWithAccounts:v3];
}

void sub_100087084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10008712C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100087144(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) updateBridgeSettingsWithMailboxSelection:*(void *)(a1 + 40)];
}

void sub_1000871E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1000871FC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) updateMessages:*(void *)(a1 + 40)];
}

void sub_1000872C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_1000872EC(void *a1)
{
  return [*(id *)(a1[4] + 40) moveMessages:a1[5] toMailbox:a1[6]];
}

void sub_10008739C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000873B4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = MFLogGeneral();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#Nano Loading first messages (count: %d)", buf, 8u);
    }

    id v4 = +[MFNanoBridgeSettingsManager sharedInstance];
    id v5 = [v4 organizeByThread];

    [*(id *)(a1 + 40) _fetchForMailboxes:*(void *)(a1 + 32) growFetchWindow:0];
    *(void *)buf = 0;
    id v25 = buf;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_1000876D0;
    v20[3] = &unk_10013CF40;
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v22 = buf;
    uint64_t v23 = v6;
    int8x16_t v15 = *(int8x16_t *)(a1 + 32);
    id v7 = (id)v15.i64[0];
    int8x16_t v21 = vextq_s8(v15, v15, 8uLL);
    uint64_t v8 = objc_retainBlock(v20);
    unsigned int v9 = ((void (*)(void))v8[2])();
    uint64_t v10 = v9;
    if (v25[24] || ![v9 count])
    {
      id v11 = objc_msgSend(*(id *)(a1 + 40), "_filteredMessagesArrayFromLibraryMessages:syncedMailboxes:", v10, *(void *)(a1 + 32), *(_OWORD *)&v15);
      [*(id *)(*(void *)(a1 + 40) + 16) replyWithFirstMessages:v11 includesProtectedMessages:1 mailboxes:*(void *)(a1 + 32) organizedByThread:v5];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 40) + 16) reportWillDownloadFirstMessages];
      uint64_t v12 = *(void **)(a1 + 40);
      id v13 = +[MFLibraryMessage nanoMessageIdsForMailMessages:v10];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000876F4;
      v17[3] = &unk_10013CF68;
      int8x16_t v16 = *(int8x16_t *)(a1 + 32);
      id v14 = (id)v16.i64[0];
      int8x16_t v18 = vextq_s8(v16, v16, 8uLL);
      char v19 = (char)v5;
      [v12 _loadFullMesssagesForMessageIds:v13 messagesAlreadyLoadedByMessageId:0 libraryMessagesRetrievalBlock:v8 callback:v17];
    }
    _Block_object_dispose(buf, 8);
  }
}

void sub_100087668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_1000876D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _libraryMessagesReceivedBefore:0 count:*(void *)(a1 + 56) inConversationWithId:0 protectedDataAvailable:*(void *)(*(void *)(a1 + 48) + 8) + 24 limitDateReceived:0 syncedMailboxes:*(void *)(a1 + 40)];
}

id sub_1000876F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) replyWithFirstMessages:a2 includesProtectedMessages:a3 mailboxes:*(void *)(a1 + 40) organizedByThread:*(unsigned __int8 *)(a1 + 48)];
}

void sub_1000877A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1000877BC(uint64_t a1)
{
  uint64_t v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#Nano Loading requested messages (count: %d)", buf, 8u);
  }

  *(void *)buf = 0;
  uint64_t v23 = buf;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_100087A9C;
  v19[3] = &unk_10013CF90;
  int8x16_t v15 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v15.i64[0];
  int8x16_t v20 = vextq_s8(v15, v15, 8uLL);
  int8x16_t v21 = buf;
  id v5 = objc_retainBlock(v19);
  uint64_t v6 = ((void (*)(void))v5[2])();
  id v7 = v6;
  if (v23[24] || ![v6 count])
  {
    uint64_t v8 = *(void **)(a1 + 40);
    unsigned int v9 = objc_msgSend(*(id *)(a1 + 32), "mailboxes", *(_OWORD *)&v15);
    uint64_t v10 = [v8 _filteredMessagesArrayFromLibraryMessages:v7 syncedMailboxes:v9];

    [*(id *)(a1 + 32) setHasProtectedMessages:1];
    [*(id *)(*(void *)(a1 + 40) + 16) replyWithMoreMessages:v10 context:*(void *)(a1 + 32)];
  }
  else
  {
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = +[MFLibraryMessage nanoMessageIdsForMailMessages:v7];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100087B7C;
    v16[3] = &unk_10013CFB8;
    id v13 = *(id *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    id v17 = v13;
    uint64_t v18 = v14;
    [v11 _loadFullMesssagesForMessageIds:v12 messagesAlreadyLoadedByMessageId:0 libraryMessagesRetrievalBlock:v5 callback:v16];

    uint64_t v10 = v17;
  }

  _Block_object_dispose(buf, 8);
}

void sub_100087A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Block_object_dispose((const void *)(v26 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_100087A9C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  unsigned int v3 = [*(id *)(a1 + 40) beforeDate];
  id v4 = [*(id *)(a1 + 40) count];
  id v5 = [*(id *)(a1 + 40) conversationId];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = [*(id *)(a1 + 40) mailboxes];
  uint64_t v8 = [v2 _libraryMessagesReceivedBefore:v3 count:v4 inConversationWithId:v5 protectedDataAvailable:v6 + 24 limitDateReceived:0 syncedMailboxes:v7];

  return v8;
}

void sub_100087B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100087B7C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setHasProtectedMessages:a3];
  [*(id *)(*(void *)(a1 + 40) + 16) replyWithMoreMessages:v5 context:*(void *)(a1 + 32)];
}

void sub_100087BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100087C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100087CA0(uint64_t a1)
{
  uint64_t v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#Nano Attempting to resend message (count: %d)", buf, 8u);
  }

  *(void *)buf = 0;
  id v17 = buf;
  uint64_t v18 = 0x2020000000;
  char v19 = -86;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100087F58;
  v13[3] = &unk_10013CFE0;
  id v14 = *(id *)(a1 + 32);
  int8x16_t v15 = buf;
  id v4 = objc_retainBlock(v13);
  id v5 = ((void (*)(void))v4[2])();
  uint64_t v6 = v5;
  if (v17[24] || ![v5 count])
  {
    id v7 = *(id **)(a1 + 40);
    uint64_t v8 = [v7[2] syncedMailboxes];
    unsigned int v9 = [v7 _filteredMessagesArrayFromLibraryMessages:v6 syncedMailboxes:v8];

    [*(id *)(*(void *)(a1 + 40) + 16) replyWithMessagesToResend:v9 includesProtectedMessages:1];
  }
  else
  {
    uint64_t v10 = *(void **)(a1 + 40);
    id v11 = +[MFLibraryMessage nanoMessageIdsForMailMessages:v6];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100087FCC;
    v12[3] = &unk_10013D008;
    void v12[4] = *(void *)(a1 + 40);
    [v10 _loadFullMesssagesForMessageIds:v11 messagesAlreadyLoadedByMessageId:0 libraryMessagesRetrievalBlock:v4 callback:v12];
  }
  _Block_object_dispose(buf, 8);
}

void sub_100087EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, ...)
{
  va_start(va, a13);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100087F58(uint64_t a1)
{
  uint64_t v2 = +[MFMailMessageLibrary defaultInstance];
  unsigned int v3 = [v2 libraryMessagesForMessageIds:*(void *)(a1 + 32) protectedDataAvailable:*(void *)(*(void *)(a1 + 40) + 8) + 24];

  return v3;
}

void sub_100087FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100087FCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) replyWithMessagesToResend:a2 includesProtectedMessages:a3];
}

void sub_100088074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10008808C(uint64_t a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = -86;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  id v10[2] = sub_1000882A0;
  v10[3] = &unk_10013CFE0;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = &v13;
  uint64_t v2 = objc_retainBlock(v10);
  unsigned int v3 = ((void (*)(void))v2[2])();
  id v4 = v3;
  if (*((unsigned char *)v14 + 24) || ![v3 count])
  {
    id v5 = *(id **)(a1 + 40);
    uint64_t v6 = [v5[2] syncedMailboxes];
    id v7 = [v5 _filteredMessagesArrayFromLibraryMessages:v4 syncedMailboxes:v6];

    [*(id *)(*(void *)(a1 + 40) + 16) replyWithMessagesToSendAsFetchResponse:v7 includesProtectedMessages:1];
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 40);
    id v7 = +[MFLibraryMessage nanoMessageIdsForMailMessages:v4];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100088314;
    v9[3] = &unk_10013D008;
    void v9[4] = *(void *)(a1 + 40);
    [v8 _loadFullMesssagesForMessageIds:v7 messagesAlreadyLoadedByMessageId:0 libraryMessagesRetrievalBlock:v2 callback:v9];
  }

  _Block_object_dispose(&v13, 8);
}

void sub_100088250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, ...)
{
  va_start(va, a13);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000882A0(uint64_t a1)
{
  uint64_t v2 = +[MFMailMessageLibrary defaultInstance];
  unsigned int v3 = [v2 libraryMessagesForMessageIds:*(void *)(a1 + 32) protectedDataAvailable:*(void *)(*(void *)(a1 + 40) + 8) + 24];

  return v3;
}

void sub_100088304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100088314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) replyWithMessagesToSendAsFetchResponse:a2 includesProtectedMessages:a3];
}

void sub_1000883BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000883D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  id v3 = [*(id *)(v1 + 64) accountWithId:*(void *)(a1 + 40)];
  objc_msgSend(v2, "replyWithAccountToResend:");
}

void sub_100088430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000884E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

id sub_1000884F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadContentForLibraryMessageId:*(void *)(a1 + 40) highPriority:*(unsigned __int8 *)(a1 + 48)];
}

void sub_10008859C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1000885B4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];
  [v2 attemptToCancelFullMessageLoadForMessageIds:v3];

  return [*(id *)(a1 + 32) _cancelLoadingContentForLibraryMessageId:*(void *)(a1 + 40)];
}

void sub_100088650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000886D8(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "allKeys", 0);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v7 + 1) + 8 * (void)v5);
        [*(id *)(*(void *)(a1 + 32) + 32) cancelAllPendingOperations];
        [*(id *)(a1 + 32) _cancelLoadingContentForLibraryMessageId:v6];
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void sub_1000887EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000888BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100088978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100088990(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ef_map:", &stru_10013D070);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "addObjectsFromArray:");
  [*(id *)(a1 + 40) _fetchForMailboxes:*(void *)(a1 + 32) growFetchWindow:0];
}

void sub_100088A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_100088A14(id a1, NNMKMailbox *a2)
{
  id v2 = [(NNMKMailbox *)a2 mailboxId];

  return (NSString *)v2;
}

void sub_100088AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100088AF0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = +[VIPManager defaultInstance];
  id v3 = [v4 sortedVIPs];
  [v2 _updateVIPList:v3 requestContext:*(void *)(a1 + 40)];
}

void sub_100088B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100088C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100088C74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 48);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_100088D44;
  v4[3] = &unk_10013BBE8;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  [v3 sendMessage:v2 progressHandler:v4];
}

void sub_100088D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100088D44(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) composedMessageId];
  objc_msgSend(v3, "replyWithMessageSendingProgress:forComposedMessageId:", a2);
}

void sub_100088DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_100088E24(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) handleWatchAccountsUpdated];
}

void sub_100088E44(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"MFNanoServerRequestWatchAccountReauthenticationNotification" object:0];
}

void sub_100088EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100088F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100088F60(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) notifyAuthenticationFailedForAccount:*(void *)(a1 + 40)];
}

void sub_100089000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100089018(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isPaired])
  {
    os_log_t log = [*(id *)(a1 + 40) userInfo];
    uint64_t v2 = [log objectForKey:MailMessageStoreMessageKey];
    id v3 = *(id **)(a1 + 32);
    id v4 = [v3[2] syncedMailboxes];
    id v5 = [v3 _filteredMessagesArrayFromLibraryMessages:v2 syncedMailboxes:v4];

    if ([v5 count]) {
      [*(id *)(*(void *)(a1 + 32) + 16) addMessages:v5];
    }
  }
  else
  {
    loga = MFLogGeneral();
    if (os_log_type_enabled(loga, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 40) userInfo];
      *(_DWORD *)buf = 138543362;
      long long v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_INFO, "#Nano Messages added notification ignored. Not paired. %{public}@", buf, 0xCu);
    }
  }
}

void sub_1000891A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100089280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100089298(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isPaired])
  {
    osos_log_t log = [*(id *)(a1 + 40) userInfo];
    uint64_t v2 = [oslog objectForKey:MailMessageStoreMessageKey];
    char v19 = [oslog objectForKey:MailMessageStoreChangedFlagsKey];
    id v3 = [oslog objectForKey:@"oldFlagsByMessage"];
    if (v3)
    {
      id v4 = [v2 mutableCopy];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v5 = v2;
      id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v22;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v22 != v7) {
              objc_enumerationMutation(v5);
            }
            long long v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            long long v10 = [v3 objectForKeyedSubscript:v9];

            if (v10)
            {
              id v11 = [v3 objectForKeyedSubscript:v9];
              uint64_t v12 = +[MFLibraryMessage nnmkMailItemStatusFromMFMessageFlags:conversationFlags:](MFLibraryMessage, "nnmkMailItemStatusFromMFMessageFlags:conversationFlags:", [v11 unsignedLongLongValue], 0);

              if ((void *)+[MFLibraryMessage nnmkMailItemStatusFromMFMessageFlags:conversationFlags:](MFLibraryMessage, "nnmkMailItemStatusFromMFMessageFlags:conversationFlags:", [v9 messageFlags], 0) == v12)objc_msgSend(v4, "removeObject:", v9); {
            }
              }
          }
          id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v6);
      }
    }
    else
    {
      id v4 = v2;
    }
    id v14 = [v19 objectForKey:MessageIsDeleted];
    unsigned __int8 v15 = [v14 BOOLValue];
    char v16 = *(id **)(a1 + 32);
    if (v15)
    {
      [*(id *)(a1 + 32) _messagesCompacted:*(void *)(a1 + 40)];
    }
    else
    {
      id v17 = [v16[2] syncedMailboxes];
      uint64_t v18 = [v16 _filteredMessagesArrayFromLibraryMessages:v4 syncedMailboxes:v17];

      if ([v18 count]) {
        [*(id *)(*(void *)(a1 + 32) + 16) updateMessagesStatus:v18];
      }
    }
  }
  else
  {
    MFLogGeneral();
    osos_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [*(id *)(a1 + 40) userInfo];
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_INFO, "#Nano Message flags changed notification ignored. Not paired. %{public}@", buf, 0xCu);
    }
  }
}

void sub_1000895B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_100089700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100089718(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isPaired])
  {
    uint64_t v2 = [*(id *)(a1 + 40) userInfo];
    id v3 = [v2 objectForKeyedSubscript:EDConversationFlagsChangedConversationIDKey];
    id v4 = [v3 longLongValue];

    id v5 = EFStringWithInt64();
    id v6 = [v2 objectForKeyedSubscript:EDConversationFlagsKey];
    unint64_t v7 = (unint64_t)[v6 unsignedLongLongValue];

    long long v8 = [v2 objectForKeyedSubscript:EDConversationFlagsOldFlags];
    unint64_t v9 = (unint64_t)[v8 unsignedLongLongValue];

    if ((v7 & 1) != (v9 & 1))
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v10 = [*(id *)(*(void *)(a1 + 32) + 16) syncedMailboxes];
      id v11 = [v10 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v38;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v10);
          }
          if (([*(id *)(*((void *)&v37 + 1) + 8 * v13) filterType] & 0x20) != 0) {
            break;
          }
          if (v11 == (id)++v13)
          {
            id v11 = [v10 countByEnumeratingWithState:&v37 objects:v43 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }

        if ((v7 & 1) == 0)
        {
          char v14 = 0;
          goto LABEL_18;
        }
        +[MFMessageCriterion criterionForConversationID:v4];
        uint64_t v33 = 0;
        uint64_t v34 = &v33;
        uint64_t v35 = 0x2020000000;
        char v36 = -86;
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100089C8C;
        v30[3] = &unk_10013CFE0;
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        id v31 = v15;
        uint64_t v32 = &v33;
        char v16 = objc_retainBlock(v30);
        id v17 = ((void (*)(void))v16[2])();
        uint64_t v18 = v17;
        if (*((unsigned char *)v34 + 24) || ![v17 count])
        {
          char v19 = *(id **)(a1 + 32);
          int8x16_t v20 = [v19[2] syncedMailboxes];
          long long v21 = [v19 _filteredMessagesArrayFromLibraryMessages:v18 syncedMailboxes:v20];

          long long v22 = MFLogGeneral();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v23 = [v21 count];
            *(_DWORD *)buf = 67109120;
            unsigned int v42 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#Nano Syncing existing messages for important thread (count: %d)", buf, 8u);
          }

          [*(id *)(*(void *)(a1 + 32) + 16) updateConversationId:v5 notify:1 messages:v21];
        }
        else
        {
          long long v24 = MFLogGeneral();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v25 = [v18 count];
            *(_DWORD *)buf = 67109120;
            unsigned int v42 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#Nano Missing messages for important thread. Attempting to load (count: %d)", buf, 8u);
          }

          uint64_t v26 = *(void **)(a1 + 32);
          uint64_t v27 = +[MFLibraryMessage nanoMessageIdsForMailMessages:v18];
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_100089D04;
          v28[3] = &unk_10013CFB8;
          v28[4] = *(void *)(a1 + 32);
          id v29 = v5;
          [v26 _loadFullMesssagesForMessageIds:v27 messagesAlreadyLoadedByMessageId:0 libraryMessagesRetrievalBlock:v16 callback:v28];
        }
        _Block_object_dispose(&v33, 8);
      }
      else
      {
LABEL_11:

        char v14 = v7;
LABEL_18:
        [*(id *)(*(void *)(a1 + 32) + 16) updateConversationId:v5 notify:v14 & 1 messages:0];
      }
    }
    if (((v7 >> 2) & 1) != ((v9 >> 2) & 1)) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "updateConversationId:mute:", v5);
    }
  }
}

void sub_100089B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, ...)
{
  va_start(va, a13);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100089C8C(uint64_t a1)
{
  uint64_t v2 = +[MFMailMessageLibrary defaultInstance];
  id v3 = [v2 loadLibraryMessagesFromLibraryMatchingCriterion:*(void *)(a1 + 32) count:10 protectedDataAvailable:*(void *)(*(void *)(a1 + 40) + 8) + 24];

  return v3;
}

void sub_100089CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100089D04(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) updateConversationId:*(void *)(a1 + 40) notify:1 messages:a2];
}

void sub_100089DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100089DC4(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isPaired])
  {
    uint64_t v2 = [*(id *)(a1 + 40) userInfo];
    id v3 = [v2 objectForKey:MailMessageStoreMessageKey];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    void v6[2] = sub_100089F78;
    v6[3] = &unk_10013D0B8;
    void v6[4] = *(void *)(a1 + 32);
    id v4 = objc_msgSend(v3, "ef_compactMap:", v6);
    if ([v4 count]) {
      [*(id *)(*(void *)(a1 + 32) + 16) deleteMessagesWithIds:v4];
    }
  }
  else
  {
    uint64_t v2 = MFLogGeneral();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v5 = [*(id *)(a1 + 40) userInfo];
      *(_DWORD *)buf = 138543362;
      long long v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "#Nano Messages compacted notification ignored. Not paired. %{public}@", buf, 0xCu);
    }
  }
}

void sub_100089F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100089F78(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "mf_externalReference");
  id v4 = [v3 absoluteString];

  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v4];

  return v4;
}

void sub_100089FE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008A094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10008A0AC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) object];
  id v3 = [v2 allVIPs];
  id v4 = [v3 allObjects];

  [*(id *)(a1 + 40) _updateVIPList:v4 requestContext:0];
}

void sub_10008A130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10008A334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10008A448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_10008A460(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"AutoFetchJobAccount"];

  id v4 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"AutoFetchJobMailboxUid"];

  id v6 = [*(id *)(a1 + 32) userInfo];
  unint64_t v7 = [v6 objectForKeyedSubscript:@"AutoFetchError"];

  long long v8 = objc_msgSend(v5, "nano_mailboxId");
  if (![*(id *)(*(void *)(a1 + 40) + 80) containsObject:v8]) {
    goto LABEL_14;
  }
  if (!v3)
  {
    long long v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000C1FC0(v10);
    }
    goto LABEL_13;
  }
  if (!v5)
  {
    long long v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000C2004(v10);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
  {
    unint64_t v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(v5, "nano_mailboxId");
      int v12 = 138543874;
      uint64_t v13 = v3;
      __int16 v14 = 2114;
      id v15 = v11;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Nano Fetch for account failed (accountId: %{public}@, mailbox: %{public}@, error: %{public}@)", (uint8_t *)&v12, 0x20u);
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 80) removeObject:v8];
  [*(id *)(*(void *)(a1 + 40) + 16) notifyFetchCompletedForMailboxId:v8 error:v7];
LABEL_14:
}

void sub_10008A67C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008AAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_10008ABF4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v9 = [*(id *)(a1 + 40) messageId];
  id v3 = objc_msgSend(v2, "objectForKeyedSubscript:");
  if (v3)
  {
    unsigned __int8 v4 = [*(id *)(*(void *)(a1 + 32) + 16) isPaired];

    if (v4)
    {
      id v5 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v8 = *(unsigned __int8 *)(a1 + 64);
      [v5 addMessageContent:v6 forMessage:v7 loadedProtected:v8];
    }
  }
  else
  {
  }
}

void sub_10008ACCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10008AED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008AF28(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v7 = [*(id *)(a1 + 40) messageId];
  id v3 = objc_msgSend(v2, "objectForKeyedSubscript:");
  if (v3)
  {
    unsigned __int8 v4 = [*(id *)(*(void *)(a1 + 32) + 16) isPaired];

    if ((v4 & 1) == 0) {
      return;
    }
    id v5 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 40) messageId];
    objc_msgSend(v5, "addImageAttachment:forMessageId:contentId:loadedProtected:", v6);
  }
}

void sub_10008AFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10008B1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008B238(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v7 = [*(id *)(a1 + 40) messageId];
  id v3 = objc_msgSend(v2, "objectForKeyedSubscript:");
  if (v3)
  {
    unsigned __int8 v4 = [*(id *)(*(void *)(a1 + 32) + 16) isPaired];

    if ((v4 & 1) == 0) {
      return;
    }
    id v5 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 40) messageId];
    objc_msgSend(v5, "addAttachmentData:forMessageId:contentId:loadedProtected:", v6);
  }
}

void sub_10008B30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10008B434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008B468(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = [*(id *)(a1 + 40) messageId];
  id v3 = objc_msgSend(v2, "objectForKeyedSubscript:");

  if (v3)
  {
    unsigned __int8 v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(*(void *)(a1 + 32) + 24);
    id v7 = [v4 messageId];
    objc_msgSend(v5, "removeObjectForKey:");
  }
}

void sub_10008B50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10008B628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008B65C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v7 = [*(id *)(a1 + 40) messageId];
  id v3 = objc_msgSend(v2, "objectForKeyedSubscript:");

  if (v3)
  {
    unsigned __int8 v4 = *(void **)(*(void *)(a1 + 32) + 24);
    id v8 = [*(id *)(a1 + 40) messageId];
    objc_msgSend(v4, "removeObjectForKey:");

    id v5 = *(void **)(a1 + 40);
    id v6 = *(void **)(*(void *)(a1 + 32) + 16);
    id v9 = [v5 messageId];
    objc_msgSend(v6, "reportMessageContentDownloadFailureForMessageId:");
  }
}

void sub_10008B728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10008B7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10008B978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008BA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10008BB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10008BB74(uint64_t a1, void *a2, unsigned int a3)
{
  id v31 = a2;
  id v5 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
  id v6 = v5;
  unsigned int v28 = a3;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v5, "addEntriesFromDictionary:");
  }
  char v40 = -86;
  id v7 = +[MFMailMessageLibrary defaultInstance];
  id v8 = [v31 allKeys];
  uint64_t v30 = a1;
  id v29 = [v7 libraryMessagesForMessageIds:v8 protectedDataAvailable:&v40];

  id v9 = [v6 allKeys];
  id v32 = [v9 mutableCopy];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = v29;
  id v11 = 0;
  id v12 = [v10 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v37;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        __int16 v16 = [v15 nanoMessageId];
        id v17 = [v6 objectForKeyedSubscript:v16];

        if (v17)
        {
          uint64_t v18 = [v17 messageId];
          [v32 removeObject:v18];

          objc_msgSend(v17, "setStatus:", +[MFLibraryMessage nnmkMailItemStatusFromMFMessageFlags:conversationFlags:](MFLibraryMessage, "nnmkMailItemStatusFromMFMessageFlags:conversationFlags:", objc_msgSend(v15, "messageFlags"), objc_msgSend(v15, "conversationFlags")));
        }
        else
        {
          if (!v11)
          {
            id v11 = +[NSMutableDictionary dictionary];
          }
          char v19 = [v15 nanoMessageId];
          [v11 setObject:v15 forKeyedSubscript:v19];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v12);
  }

  [v6 removeObjectsForKeys:v32];
  [v11 removeObjectsForKeys:v32];
  if ([v11 count])
  {
    int8x16_t v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v21 = [v11 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v42 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#Nano Missing %d messages. Attempting to load.", buf, 8u);
    }

    long long v22 = *(void **)(v30 + 40);
    unsigned int v23 = [v11 allValues];
    long long v24 = +[MFLibraryMessage nanoMessageIdsForMailMessages:v23];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10008C064;
    v33[3] = &unk_10013D108;
    uint64_t v25 = *(void *)(v30 + 48);
    id v34 = *(id *)(v30 + 56);
    char v35 = v28;
    [v22 _loadFullMesssagesForMessageIds:v24 messagesAlreadyLoadedByMessageId:v6 libraryMessagesRetrievalBlock:v25 callback:v33];

    uint64_t v26 = v34;
  }
  else
  {
    uint64_t v27 = *(void *)(v30 + 56);
    uint64_t v26 = [v6 allValues];
    (*(void (**)(uint64_t, void *, void))(v27 + 16))(v27, v26, v28);
  }
}

void sub_10008BF64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10008C064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 40)) {
    a3 = 1;
  }
  else {
    a3 = a3;
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, a3);
}

id sub_10008C0BC(id a1, NNMKMessage *a2)
{
  uint64_t v2 = [(NNMKMessage *)a2 messageId];

  return v2;
}

void sub_10008C20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008C370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008C480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10008C534(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [v3 nanoMessage];
  if ([*(id *)(*(void *)(a1 + 32) + 16) isMessageOkForSyncedMailboxes:v4])
  {
    id v5 = v4;
  }
  else
  {
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 messageId];
      int v9 = 138543362;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Nano Dropping message because it does not belong to synced mailboxes. %{public}@", (uint8_t *)&v9, 0xCu);
    }
    id v5 = 0;
  }

  return v5;
}

void sub_10008C648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008C748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10008C784(id a1, NNMKMailbox *a2)
{
  uint64_t v2 = [(NNMKMailbox *)a2 url];
  id v3 = [v2 absoluteString];
  unsigned __int8 v4 = +[MailAccount mailboxUidFromActiveAccountsForURL:v3];

  return v4;
}

void sub_10008C7FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_10008C818(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_10008C860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008C914(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.MobileMail.NanoServer.ContentLoader", v3);
  id v2 = (void *)qword_10016BD10;
  qword_10016BD10 = (uint64_t)v1;
}

void sub_10008C9B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008CB38(_Unwind_Exception *a1)
{
  unsigned __int8 v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10008CC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10008CD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10008CD4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _networkStatusChanged];
}

void sub_10008CD94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10008CDFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFNanoServerFullMessageLoader;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10008CF7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10008CF90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10008CFA8(uint64_t a1)
{
  [*(id *)(a1 + 32) resetExponentialBackoff];
  id v2 = [[MFNanoServerFullMessageLoaderBatchRequest alloc] initWithMessageIds:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  id v3 = [*(id *)(a1 + 32) requests];
  [v3 addObject:v2];

  unsigned __int8 v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 40) count];
    int v6 = 134218242;
    id v7 = v5;
    __int16 v8 = 2114;
    int v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#Nano MFNanoServerFullMessageLoader: Batch request scheduled - message count: %ld - request: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) _dispatchOperation];
}

void sub_10008D0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008D190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008D1A0(uint64_t a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [*(id *)(a1 + 32) requests];
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v5);
        long long v11 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        id v7 = *(id *)(a1 + 40);
        id v8 = [v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v12;
          do
          {
            id v10 = 0;
            do
            {
              if (*(void *)v12 != v9) {
                objc_enumerationMutation(v7);
              }
              [v6 cancelRequestForMessageId:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
              id v10 = (char *)v10 + 1;
            }
            while (v8 != v10);
            id v8 = [v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
          }
          while (v8);
        }

        id v5 = (char *)v5 + 1;
      }
      while (v5 != v3);
      id v3 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v3);
  }
}

void sub_10008D330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008D3EC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) requests];
  [v2 removeAllObjects];

  id v3 = [*(id *)(a1 + 32) operationQueue];
  [v3 cancelAllOperations];
}

void sub_10008D458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10008D4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10008D894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10008DE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_10008DF6C(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = [v8 nanoMessageWithHeaders:a3];
  int v6 = *(void **)(a1 + 32);
  id v7 = [v8 nanoMessageId];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

void sub_10008DFF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v12 = v11;

  _Unwind_Resume(a1);
}

void sub_10008E100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10008E124(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

void sub_10008E2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

  _Block_object_dispose((const void *)(v22 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10008E2FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10008E30C(uint64_t a1)
{
}

void sub_10008E314(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "requests", 0);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = [v6 dequeueAllMessageIds];
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_10008E45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008E554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008E568(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) failedMessageIdsByRequest];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableSet);
    id v5 = [*(id *)(a1 + 32) failedMessageIdsByRequest];
    [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

    id v3 = v4;
  }
  [v3 addObjectsFromArray:*(void *)(a1 + 48)];
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v6 + 10))
  {
    *(unsigned char *)(v6 + 10) = 1;
    [*(id *)(a1 + 32) _exponentialBackoff];
    double v8 = v7;
    uint64_t v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Nano MFNanoServerFullMessageLoader: Scheduling retry in %f seconds", buf, 0xCu);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    long long v11 = [*(id *)(a1 + 32) privateQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008E7B0;
    block[3] = &unk_10013A038;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_after(v10, v11, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void sub_10008E764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10008E7B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = [WeakRetained failedMessageIdsByRequest];
  id v3 = [v2 allKeys];

  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v17;
    *(void *)&long long v5 = 134218242;
    long long v15 = v5;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v7);
        uint64_t v9 = objc_msgSend(WeakRetained, "failedMessageIdsByRequest", v15);
        dispatch_time_t v10 = [v9 objectForKeyedSubscript:v8];

        long long v11 = MFLogGeneral();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v10 count];
          *(_DWORD *)buf = v15;
          id v21 = v12;
          __int16 v22 = 2114;
          uint64_t v23 = v8;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Nano MFNanoServerFullMessageLoader: Enqueueing request to retry - message count: %ld - request: %{public}@", buf, 0x16u);
        }

        id v13 = [v10 allObjects];
        [WeakRetained _enqueueMessageIds:v13 forRequest:v8];

        double v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v4);
  }

  long long v14 = [WeakRetained failedMessageIdsByRequest];
  [v14 removeAllObjects];

  [WeakRetained setIsRetryScheduled:0];
}

void sub_10008E9B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008EB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008EB2C(uint64_t a1, __n128 a2)
{
  id v3 = 0;
  unint64_t v4 = 0;
  a2.n128_u64[0] = 134218242;
  __n128 v14 = a2;
  while (1)
  {
    long long v5 = objc_msgSend(*(id *)(a1 + 32), "requests", *(_OWORD *)&v14);
    BOOL v6 = v4 < (unint64_t)[v5 count];

    if (!v6) {
      break;
    }
    double v7 = [*(id *)(a1 + 32) requests];
    uint64_t v8 = [v7 objectAtIndexedSubscript:v4];

    [v8 addResults:*(void *)(a1 + 40) isProtectedMessage:*(unsigned __int8 *)(a1 + 56)];
    [v8 cancelRequestForMessageIds:*(void *)(a1 + 48)];
    if ([v8 isRequestCompleted])
    {
      uint64_t v9 = [*(id *)(a1 + 32) callbackQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008EDE0;
      block[3] = &unk_100139C48;
      long long v16 = v8;
      dispatch_async(v9, block);

      if (!v3) {
        id v3 = objc_alloc_init((Class)NSMutableIndexSet);
      }
      [v3 addIndex:v4];
      dispatch_time_t v10 = v16;
    }
    else
    {
      dispatch_time_t v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        long long v11 = [v8 results];
        id v12 = [v11 count];
        *(_DWORD *)buf = v14.n128_u32[0];
        id v18 = v12;
        __int16 v19 = 2112;
        int8x16_t v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#Nano MFNanoServerFullMessageLoader: Request not completed - message count: %ld - request: %@", buf, 0x16u);
      }
    }

    ++v4;
  }
  if (v3)
  {
    id v13 = [*(id *)(a1 + 32) requests];
    [v13 removeObjectsAtIndexes:v3];
  }
}

void sub_10008ED64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008EDE0(uint64_t a1)
{
  id v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) results];
    id v4 = [v3 count];
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 134218242;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#Nano MFNanoServerFullMessageLoader: Request completed - message count: %ld - request: %@", (uint8_t *)&v8, 0x16u);
  }
  BOOL v6 = [*(id *)(a1 + 32) completionBlock];
  double v7 = [*(id *)(a1 + 32) results];
  ((void (**)(void, void *, id))v6)[2](v6, v7, [*(id *)(a1 + 32) resultIncludesProtectedMessages]);
}

void sub_10008EF00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008F040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v18 - 40));

  _Unwind_Resume(a1);
}

void sub_10008F074(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v3 = [v2 isCancelled];

  if ((v3 & 1) == 0) {
    [WeakRetained _processPendingRequests];
  }
}

void sub_10008F0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10008F168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10008F1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008F35C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10008F438(uint64_t a1)
{
  id v2 = +[MFMailMessageLibrary defaultInstance];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = [v2 protectedDataAvailability] == 0;

  unsigned __int8 v3 = *(void **)(a1 + 32);

  return [v3 _suspendOrResumeOperationQueue];
}

void sub_10008F498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008F63C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008F8E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008F970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008F9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008FAFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008FB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008FBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10008FCFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008FE28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10008FF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10009018C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000901A8(id a1)
{
  id v1 = objc_alloc_init((Class)NSOperationQueue);
  id v2 = (void *)qword_10016BD20;
  qword_10016BD20 = (uint64_t)v1;

  [(id)qword_10016BD20 setName:@"com.apple.MFNanoServerMessageContentLoader.database"];
  [(id)qword_10016BD20 setMaxConcurrentOperationCount:3];
  [(id)qword_10016BD20 setQualityOfService:17];
  id v3 = objc_alloc_init((Class)NSOperationQueue);
  id v4 = (void *)qword_10016BD28;
  qword_10016BD28 = (uint64_t)v3;

  [(id)qword_10016BD28 setName:@"com.apple.MFNanoServerMessageContentLoader.parsing"];
  [(id)qword_10016BD28 setMaxConcurrentOperationCount:3];
  [(id)qword_10016BD28 setQualityOfService:17];
  id v5 = objc_alloc_init((Class)NSOperationQueue);
  BOOL v6 = (void *)qword_10016BD30;
  qword_10016BD30 = (uint64_t)v5;

  [(id)qword_10016BD30 setName:@"com.apple.MFNanoServerMessageContentLoader.attachments"];
  [(id)qword_10016BD30 setMaxConcurrentOperationCount:1];
  double v7 = (void *)qword_10016BD30;

  [v7 setQualityOfService:17];
}

void sub_100090304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFNanoServerMessageContentLoader;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000903D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100090568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000906E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100090818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100090840(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100090850(uint64_t a1)
{
}

void sub_100090858(uint64_t a1)
{
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  if (([v6 isCancelled] & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) _attemptToLoadLibraryMessageWithContentFromDatabase];
    id v5 = *(void **)(a1 + 32);
    if (v4) {
      [v5 _parseContentFromMessageAndNotifyDelegate:v4 loadedProtected:1];
    }
    else {
      [v5 _downloadContent];
    }
  }
}

void sub_1000908F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100090A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100090A88()
{
}

void sub_100090BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100090D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void sub_100090D78(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  if (([v2 isCancelled] & 1) == 0)
  {
    id v5 = objc_alloc_init(MFNanoServerMessageContentParser);
    [*(id *)(*(void *)(a1 + 32) + 64) addObject:v5];
    if (v5) {
      dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    }
    else {
      dispatch_semaphore_t v6 = 0;
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, *(id *)(a1 + 32));
    id from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, v5);
    uint64_t v7 = *(void *)(a1 + 40);
    [*(id *)(*(void *)(a1 + 32) + 40) screenWidth];
    double v9 = v8;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    _DWORD v15[2] = sub_1000910F8;
    v15[3] = &unk_10013D300;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    id v16 = *(id *)(a1 + 40);
    char v20 = *(unsigned char *)(a1 + 56);
    __int16 v10 = v6;
    long long v17 = v10;
    [(MFNanoServerMessageContentParser *)v5 parseMessage:v7 maxImageWidth:v15 completionBlock:v9];
    if (v10)
    {
      uint64_t v11 = MFLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [*(id *)(a1 + 40) nanoMessageId];
        *(_DWORD *)buf = 138543362;
        long long v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#Nano Waiting for parse to finished. Holding on so no other request in enqueued until this is finished. %{public}@", buf, 0xCu);
      }
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
      id v13 = MFLogGeneral();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __n128 v14 = [*(id *)(a1 + 40) nanoMessageId];
        *(_DWORD *)buf = 138543362;
        long long v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Nano Received signal, parse finished. %{public}@", buf, 0xCu);
      }
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void sub_100091048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);

  _Unwind_Resume(a1);
}

void sub_1000910F8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v10 = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained[8] removeObject:v10];
  if (v13)
  {
    id v11 = +[MessageBodyLoader copySummaryForMessage:*(void *)(a1 + 32) downloadIfNecessary:1];
    id v12 = [*(id *)(a1 + 32) nanoMessage];
    [v12 setPreview:v11];
    [WeakRetained _notifyDelegateThatReceivedMailContent:v13 forMessage:v12 loadedProtected:*(unsigned __int8 *)(a1 + 64)];
    if ([v8 count]) {
      [WeakRetained _startLoadingAttachments:v8 messageBody:v7 loadedProtected:*(unsigned __int8 *)(a1 + 64)];
    }
    else {
      [WeakRetained _notifyDelegateDidFinish];
    }
  }
  else
  {
    [WeakRetained _notifyDelegateOfFailure];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100091234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000914D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_100091544(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  if (([v2 isCancelled] & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    dispatch_semaphore_t v6 = objc_msgSend(*(id *)(a1 + 40), "mf_lastPartNumber");
    id v7 = [v5 partWithNumber:v6];

    id v8 = [*(id *)(a1 + 48) _attachmentForURL:*(void *)(a1 + 40) mimePart:v7];
    id v25 = 0;
    double v9 = [v8 fetchDataSynchronously:&v25];
    id v10 = v25;
    if (v10)
    {
      [*(id *)(a1 + 48) _notifyDelegateOfFailure];
    }
    else if ([v9 length])
    {
      if ([v8 isImageFile])
      {
        CFStringRef v28 = @"downloadedImageSize";
        id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 length]);
        id v29 = v11;
        id v12 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        +[MFPowerController powerlog:@"NanoServer" eventData:v12];

        id v13 = +[NSMutableData data];
        [*(id *)(*(void *)(a1 + 48) + 40) screenWidth];
        double v15 = v14;
        [*(id *)(*(void *)(a1 + 48) + 40) screenScale];
        double v17 = v15 * v16;
        *(float *)&double v17 = v17;
        +[NNMKImageUtility scaleImageFromData:v9 destinationData:v13 maxWidth:v17];
        id v18 = *(void **)(a1 + 48);
        id v19 = [v8 contentID];
        [v18 _notifyDelegateThatReceivedAttachment:v13 forContentId:v19 loadedProtected:*(unsigned __int8 *)(a1 + 72)];
      }
      else
      {
        CFStringRef v26 = @"downloadedAttachmentSize";
        char v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 length]);
        uint64_t v27 = v20;
        id v21 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        +[MFPowerController powerlog:@"NanoServer" eventData:v21];

        __int16 v22 = *(void **)(a1 + 48);
        id v13 = [v8 contentID];
        [v22 _notifyDelegateThatReceivedAttachment:v9 forContentId:v13 loadedProtected:*(unsigned __int8 *)(a1 + 72)];
      }
    }
    uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v24 = *(void *)(v23 + 24) - 1;
    *(void *)(v23 + 24) = v24;
    if (!v24) {
      [*(id *)(a1 + 48) _notifyDelegateDidFinish];
    }
  }
}

void sub_100091838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100091A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100091AD4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "messageContentLoader:receivedMailContent:forMessage:loadedProtected:");
}

id sub_100091BB8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "messageContentLoader:receivedImageAttachment:contentId:loadedProtected:");
}

id sub_100091C9C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "messageContentLoader:receivedAttachmentData:contentId:loadedProtected:");
}

id sub_100091D28(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "messageContentLoaderDidFinishLoading:");
}

id sub_100091DA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "messageContentLoaderDidFailLoadingContent:");
}

void sub_100091F00(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100092098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000921D4(_Unwind_Exception *a1)
{
  id v7 = v5;

  _Unwind_Resume(a1);
}

void sub_100092228()
{
}

void sub_1000923B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1000923E8(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  [*(id *)(a1[4] + 56) lock];
  [*(id *)(a1[4] + 48) removeObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [*(id *)(a1[4] + 56) unlock];
  uint64_t v2 = *(void *)(a1[6] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void sub_100092550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFNanoServerMessageContentParser;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000925F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000927E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10009283C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    id v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v9 = objc_msgSend(v6, "ef_publicDescription");
      sub_1000C2254(v9, v31, v8);
    }
  }
  double v10 = *(double *)(a1 + 56);
  id v27 = 0;
  id v28 = 0;
  id v11 = [WeakRetained parseMessageWithLoadingContextEvent:v5 maxImageWidth:&v28 messageBody:&v27 attachmentURLsToLoad:v10];
  id v12 = v28;
  id v13 = v27;
  if (*(void *)(a1 + 32))
  {
    double v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = objc_msgSend(v6, "ef_publicDescription");
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#Nano Downloading Html Content for Message. %{public}@", buf, 0xCu);
    }
    double v16 = (void *)WeakRetained[3];
    uint64_t v17 = *(void *)(a1 + 32);
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    id v21 = sub_100092B20;
    __int16 v22 = &unk_10013D3A0;
    id v23 = v11;
    id v26 = *(id *)(a1 + 40);
    id v24 = v12;
    id v25 = v13;
    id v18 = [v16 dataTaskWithURL:v17 completionHandler:&v19];
    objc_msgSend(v18, "resume", v19, v20, v21, v22);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100092A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100092B20(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  double v10 = v9;
  if (!v7 || v9)
  {
    id v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) messageId];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      sub_1000C22AC();
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [*(id *)(a1 + 32) setHtmlContentData:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100092C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100092FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_100093394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1000935E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000936D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100093B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  *(void *)(v26 - 128) = 0;

  _Unwind_Resume(a1);
}

void sub_100093F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_100094178(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100094364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000944DC(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_10016BD40;
  qword_10016BD40 = (uint64_t)v1;
}

void sub_1000945A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100094700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100094854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100094A44(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100094ADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100094BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100094C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  double v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFNanoServerMessageContentURLProtocol;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100094F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_100094F88(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained client];
  id v5 = [v9 response];
  [v4 URLProtocol:WeakRetained didReceiveResponse:v5 cacheStoragePolicy:2];

  id v6 = [WeakRetained client];
  id v7 = [v9 data];
  [v6 URLProtocol:WeakRetained didLoadData:v7];

  id v8 = [WeakRetained client];
  [v8 URLProtocolDidFinishLoading:WeakRetained];
}

void sub_100095070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000950B0(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained client];
  [v4 URLProtocol:WeakRetained didFailWithError:v5];
}

void sub_100095128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10009514C(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_100095334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100095488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000954B0(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _didLoadContentEvent:v6 error:v5];
}

void sub_100095528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100095660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100095C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_100095E0C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a2 dataUsingEncoding:4];
  [v3 appendData:v4];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void sub_100095E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100095FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000961A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100096484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100096718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100096934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100096C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100096D10(uint64_t a1)
{
  uint64_t v61 = 0;
  CGSize v62 = &v61;
  uint64_t v63 = 0x3032000000;
  CGRect v64 = sub_10009761C;
  CGRect v65 = sub_10009762C;
  id v66 = 0;
  if ([*(id *)(a1 + 32) sendingType] != (id)1)
  {
    id v11 = *(void **)(a1 + 40);
    id v12 = [*(id *)(a1 + 32) referenceMessageId];
    id v5 = [v11 _libraryMessageForMessageId:v12];

    id v13 = [v5 mailbox];
    double v14 = [v13 account];
    double v15 = [v14 storeForMailboxUid:v13];
    if (v15)
    {
      [v5 setMessageStore:v15];
    }
    else
    {
      double v16 = MFLogGeneral();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = objc_msgSend(v5, "ef_publicDescription");
        *(_DWORD *)buf = 138543362;
        v69 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#Warning #Nano failed to find a store for message %{public}@, things may behave unexpectedly", buf, 0xCu);
      }
    }
    if (!v5)
    {
      id v8 = 0;
LABEL_27:

      goto LABEL_28;
    }
    id v8 = [objc_alloc((Class)MFNanoMailReplyWorkaround) initWithLibraryMessage:v5];
    if ([*(id *)(a1 + 32) sendingType] == (id)2)
    {
      id v18 = [objc_alloc((Class)_MFMailCompositionContext) initReplyToMessage:0 legacyMessage:v5];
    }
    else if ([*(id *)(a1 + 32) sendingType] == (id)3)
    {
      id v18 = [objc_alloc((Class)_MFMailCompositionContext) initReplyAllToMessage:0 legacyMessage:v5];
    }
    else
    {
      if ([*(id *)(a1 + 32) sendingType] != (id)4)
      {
LABEL_26:
        id v23 = objc_alloc((Class)MFMessageLoadingContext);
        id v24 = +[DaemonAppController sharedController];
        id v25 = [v24 defaultAttachmentManager];
        id v26 = [v23 initWithMessage:v5 attachmentManager:v25];

        id v27 = +[EFScheduler immediateScheduler];
        [v26 load:0 scheduler:v27];

        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100097634;
        v57[3] = &unk_10013D490;
        long long v60 = &v61;
        id v58 = *(id *)(a1 + 32);
        id v59 = *(id *)(a1 + 48);
        id v28 = [v26 addLoadObserver:v57];

        goto LABEL_27;
      }
      id v18 = [objc_alloc((Class)_MFMailCompositionContext) initForwardOfMessage:0 legacyMessage:v5];
    }
    __int16 v22 = (void *)v62[5];
    v62[5] = (uint64_t)v18;

    goto LABEL_26;
  }
  id v2 = [objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:0];
  uint64_t v3 = (void *)v62[5];
  v62[5] = (uint64_t)v2;

  id v4 = [*(id *)(a1 + 32) accountId];
  id v5 = +[MailAccount accountWithUniqueId:v4];

  id v6 = [v5 defaultEmailAddress];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [v5 firstEmailAddress];
  }
  [(id)v62[5] setPreferredSendingEmailAddress:v7];
  if (!v6) {

  }
  id v8 = [*(id *)(a1 + 32) accountId];
  if (v8)
  {
    id v9 = [(id)v62[5] preferredSendingEmailAddress];
    BOOL v10 = v9 == 0;

    if (v10)
    {
      id v19 = MFLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = [*(id *)(a1 + 32) accountId];
        id v21 = [*(id *)(a1 + 32) composedMessageId];
        sub_1000C2374(v20, v21, buf, v19);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      id v8 = 0;
      goto LABEL_37;
    }
    id v8 = 0;
  }
LABEL_28:

  if (!v62[5])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_39;
  }
  id v29 = [*(id *)(a1 + 32) to];
  [(id)v62[5] setToRecipients:v29];

  uint64_t v30 = [*(id *)(a1 + 32) cc];
  [(id)v62[5] setCcRecipients:v30];

  id v31 = [*(id *)(a1 + 32) subject];
  [(id)v62[5] setSubject:v31];

  [(id)v62[5] setLoadRest:1];
  id v32 = [*(id *)(a1 + 32) includeAttachments];
  [(id)v62[5] setIncludeAttachments:v32];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v33 = [*(id *)(a1 + 32) attachments];
  id v34 = [v33 countByEnumeratingWithState:&v53 objects:v67 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v54;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v54 != v35) {
          objc_enumerationMutation(v33);
        }
        long long v37 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        long long v38 = (void *)v62[5];
        long long v39 = [v37 data];
        char v40 = [v37 mimeType];
        long long v41 = [v37 fileName];
        id v42 = [v38 addAttachmentData:v39 mimeType:v40 fileName:v41];
      }
      id v34 = [v33 countByEnumeratingWithState:&v53 objects:v67 count:16];
    }
    while (v34);
  }

  long long v43 = (void *)v62[5];
  long long v44 = [*(id *)(a1 + 32) body];
  [v43 setMessageBody:v44 isHTML:0];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000979C4;
  block[3] = &unk_10013D530;
  id v8 = v8;
  double v52 = &v61;
  uint64_t v45 = *(void *)(a1 + 40);
  uint64_t v46 = *(void **)(a1 + 48);
  id v48 = v8;
  uint64_t v49 = v45;
  id v51 = v46;
  id v50 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  id v5 = v48;
LABEL_37:

LABEL_39:
  _Block_object_dispose(&v61, 8);
}

void sub_100097464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10009761C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10009762C(uint64_t a1)
{
}

void sub_100097634(uint64_t a1, void *a2)
{
  id v21 = a2;
  id obj = [v21 content];
  if (obj)
  {
    id v2 = [v21 context];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setLoadingContext:v2];

    if ([*(id *)(a1 + 32) includeAttachments])
    {
      if ([obj count] == (id)1)
      {
        uint64_t v3 = [obj lastObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v5 = [obj lastObject];
          uint64_t v6 = [v5 attachmentsInDocument];

          id obj = (id)v6;
        }
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id obj = obj;
      id v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v29;
        do
        {
          id v9 = 0;
          do
          {
            if (*(void *)v29 != v8) {
              objc_enumerationMutation(obj);
            }
            BOOL v10 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v9);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v26 = 0u;
              long long v27 = 0u;
              long long v24 = 0u;
              long long v25 = 0u;
              id v11 = +[MFAttachmentManager allManagers];
              id v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v12)
              {
                uint64_t v13 = *(void *)v25;
                do
                {
                  double v14 = 0;
                  do
                  {
                    if (*(void *)v25 != v13) {
                      objc_enumerationMutation(v11);
                    }
                    double v15 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)v14) attachmentForTextAttachment:v10 error:0];
                    double v16 = v15;
                    if (v15)
                    {
                      id v17 = [v15 fetchDataSynchronously:0];
                      id v18 = [v10 fileWrapperForcingDownload:1];
                    }

                    double v14 = (char *)v14 + 1;
                  }
                  while (v12 != v14);
                  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
                }
                while (v12);
              }
            }
            id v9 = (char *)v9 + 1;
          }
          while (v9 != v7);
          id v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v7);
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setOriginalContent:obj];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = 0;

    id obj = 0;
  }
}

void sub_100097940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000979C4(uint64_t a1)
{
  id v2 = objc_alloc_init(MFNanoServerMessageSenderComposeDelegate);
  [(MFNanoServerMessageSenderComposeDelegate *)v2 setReplyWorkaround:*(void *)(a1 + 32)];
  [(MFNanoServerMessageSenderComposeDelegate *)v2 setCompositionContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  -[MFNanoServerMessageSenderComposeDelegate setIncludesAttachments:](v2, "setIncludesAttachments:", [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) includeAttachments]);
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 40);
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) contextID];
  [v3 setObject:v2 forKeyedSubscript:v4];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  id v10[2] = sub_100097BA4;
  v10[3] = &unk_10013D508;
  void v10[4] = *(void *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 56);
  id v5 = (id)v9;
  long long v12 = v9;
  id v11 = *(id *)(a1 + 48);
  [(MFNanoServerMessageSenderComposeDelegate *)v2 setAttachmentConfigCompletion:v10];
  +[MFComposeTypeFactory setupWithCompositionModel:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) delegate:v2];
  uint64_t v6 = [*(id *)(a1 + 48) attachments];
  id v7 = [v6 count];

  if (!v7)
  {
    uint64_t v8 = [(MFNanoServerMessageSenderComposeDelegate *)v2 attachmentConfigCompletion];
    v8[2]();
  }
}

void sub_100097B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_100097BA4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) contextID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) contextID];
  [v5 setObject:0 forKeyedSubscript:v6];

  id v7 = +[MFComposeTypeFactory messageFromDelegate:v4 originatingBundleID:0 sourceAccountManagement:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100097DA4;
  v13[3] = &unk_10013D4B8;
  void v13[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v14 = v8;
  uint64_t v15 = v9;
  [v7 addSuccessBlock:v13];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  id v10[2] = sub_100097FB0;
  v10[3] = &unk_10013D4E0;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  [v7 addFailureBlock:v10];
}

void sub_100097D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_100097D98()
{
  JUMPOUT(0x100097D90);
}

void sub_100097DA4(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_sendComposedMessage:");
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:v3];
  id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  if (!v3)
  {
    v4();
    goto LABEL_15;
  }
  v4();
  id v5 = (char *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) composeType];
  if ((unint64_t)(v5 - 4) >= 2)
  {
    if (v5 != (char *)6) {
      goto LABEL_8;
    }
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) legacyMessage];
    [v8 markAsViewed];

    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) legacyMessage];
    [v7 markAsForwarded];
  }
  else
  {
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) legacyMessage];
    [v6 markAsViewed];

    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) legacyMessage];
    [v7 markAsReplied];
  }

LABEL_8:
  dispatch_time_t v9 = dispatch_time(0, 30000000000);
  uint64_t v10 = *(void *)(a1 + 32);
  while (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v10 + 16), v9))
  {
    id v11 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v3];
    uint64_t v10 = *(void *)(a1 + 32);
    if (v11)
    {
      [*(id *)(v10 + 32) removeObjectForKey:v3];
      if ([v11 BOOLValue]) {
        uint64_t v12 = 0x7FFFFFFFLL;
      }
      else {
        uint64_t v12 = -1;
      }
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v12);

      break;
    }
  }
LABEL_15:
  [v13 setMessageBody:0];
}

void sub_100097F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100097FB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) accountId];
    uint64_t v6 = [*(id *)(a1 + 32) composedMessageId];
    int v7 = 138543874;
    id v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Nano Unable to send composed message. Account Id: %{public}@, ComposedMessageId: %{public}@, error: %{public}@", (uint8_t *)&v7, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000980C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000982A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_100098300(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@://%lld", @"x-last-sent-message", [v9 libraryID]);
  uint64_t v6 = +[NSURL URLWithString:v5];

  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:v6])
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v6];
    int v7 = *(void **)(*(void *)(a1 + 32) + 32);
    id v8 = +[NSNumber numberWithBool:a3];
    [v7 setObject:v8 forKey:v6];
  }
}

void sub_1000983FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100098434(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100098448(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000985D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100098740(uint64_t a1)
{
  id v5 = objc_alloc_init(MFNanoServerMessageSenderComposeDelegate);
  [(MFNanoServerMessageSenderComposeDelegate *)v5 setCompositionContext:*(void *)(a1 + 32)];
  -[MFNanoServerMessageSenderComposeDelegate setIncludesAttachments:](v5, "setIncludesAttachments:", [*(id *)(a1 + 32) includeAttachments]);
  +[MFComposeTypeFactory setupWithCompositionModel:*(void *)(a1 + 32) delegate:v5];
  uint64_t v2 = +[MFComposeTypeFactory messageFromDelegate:v5 originatingBundleID:0 sourceAccountManagement:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000987E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10009889C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000989B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100098A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100098CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100098D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100098E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100098F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100099070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10009919C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class sub_100099464()
{
  if (qword_10016BD70 != -1) {
    dispatch_once(&qword_10016BD70, &stru_10013D5F0);
  }
  Class result = objc_getClass("CRRecentContactsLibrary");
  qword_10016BD60 = (uint64_t)result;
  off_10016AC98 = (uint64_t (*)())sub_1000994C8;
  return result;
}

id sub_1000994C8()
{
  return (id)qword_10016BD60;
}

void sub_1000994D4(id a1)
{
  qword_10016BD68 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreRecents.framework/CoreRecents", 2);
  if (!qword_10016BD68) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/CoreRecents.framework/CoreRecents");
  }
}

void sub_100099628(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v59 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [*(id *)(a1 + 32) count]);
  id v57 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [*v2 count]);
  id v58 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [*(id *)(a1 + 32) count]);
  long long v56 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [*(id *)(a1 + 32) count]);
  long long v55 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [*(id *)(a1 + 32) count]);
  uint64_t v63 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [*(id *)(a1 + 32) count]);
  uint64_t v61 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [*(id *)(a1 + 32) count]);
  CGSize v62 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [*(id *)(a1 + 32) count]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) allKeys];
  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v68 objects:v73 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v69;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v69 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v68 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 40) _libraryMessageForMessageId:v7];
        id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        id v10 = [v9 unsignedIntegerValue];

        if (v8)
        {
          __int16 v11 = [v8 mailbox];
          id v12 = [v11 store];
          [v8 setMessageStore:v12];
          if ([*(id *)(a1 + 40) _status:v10 containsState:8]
            && (unsigned __int8 v13 = [v8 messageFlags], v14 = v59, (v13 & 0x10) == 0)
            || ([*(id *)(a1 + 40) _status:v10 containsState:8] & 1) == 0
            && (unsigned __int8 v15 = [v8 messageFlags], v14 = v57, (v15 & 0x10) != 0))
          {
            [v14 addObject:v8];
          }
          if (([*(id *)(a1 + 40) _status:v10 containsState:1] & 1) == 0
            && (unsigned __int8 v16 = [v8 messageFlags], v17 = v58, (v16 & 1) == 0)
            || [*(id *)(a1 + 40) _status:v10 containsState:1]
            && (v18 = [v8 messageFlags], id v17 = v56, (v18 & 1) != 0))
          {
            [v17 addObject:v8];
          }
          if ([*(id *)(a1 + 40) _status:v10 containsState:256]
            && ([v8 messageFlags] & 0x200000) == 0)
          {
            [v55 addObject:v8];
          }
          if ([*(id *)(a1 + 40) _status:v10 containsState:1024])
          {
            uint64_t v19 = [v12 mailbox];
            uint64_t v20 = [v63 objectForKeyedSubscript:v19];
            id v21 = v20;
            if (v20)
            {
              id v22 = v20;
            }
            else
            {
              +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [*(id *)(a1 + 32) count]);
              id v22 = (id)objc_claimAutoreleasedReturnValue();
            }
            long long v27 = v22;

            [v27 addObject:v8];
            long long v28 = [v12 mailbox];
            [v63 setObject:v27 forKeyedSubscript:v28];

            long long v29 = [v12 mailbox];
            [v62 setObject:v12 forKeyedSubscript:v29];
            goto LABEL_30;
          }
          if ([*(id *)(a1 + 40) _status:v10 containsState:512])
          {
            id v23 = [v12 mailbox];
            long long v24 = [v61 objectForKeyedSubscript:v23];
            long long v25 = v24;
            if (v24)
            {
              id v26 = v24;
            }
            else
            {
              +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [*(id *)(a1 + 32) count]);
              id v26 = (id)objc_claimAutoreleasedReturnValue();
            }
            long long v27 = v26;

            [v27 addObject:v8];
            long long v30 = [v12 mailbox];
            [v61 setObject:v27 forKeyedSubscript:v30];

            long long v29 = [v12 mailbox];
            [v62 setObject:v12 forKeyedSubscript:v29];
LABEL_30:
          }
        }
      }
      uint64_t v3 = obj;
      id v4 = [obj countByEnumeratingWithState:&v68 objects:v73 count:16];
    }
    while (v4);
  }

  long long v31 = +[MailChangeManager sharedChangeManager];
  [v31 pause];
  if ([v59 count])
  {
    id v32 = [MCSFlagChange alloc];
    uint64_t v33 = +[NSSet setWithObject:MFMessageIsFlagged];
    id v34 = [(MCSFlagChange *)v32 initWithFlagsToSet:v33 flagsToClear:0 reason:0];

    [*(id *)(a1 + 40) _addOperation:v34 withMessages:v59 toChangeManager:v31];
  }
  if ([v57 count])
  {
    uint64_t v35 = [MCSFlagChange alloc];
    long long v36 = +[NSSet setWithObject:MFMessageIsFlagged];
    long long v37 = [(MCSFlagChange *)v35 initWithFlagsToSet:0 flagsToClear:v36 reason:0];

    [*(id *)(a1 + 40) _addOperation:v37 withMessages:v57 toChangeManager:v31];
  }
  if ([v58 count])
  {
    long long v38 = [MCSFlagChange alloc];
    long long v39 = +[NSSet setWithObject:MessageIsRead];
    char v40 = [(MCSFlagChange *)v38 initWithFlagsToSet:v39 flagsToClear:0 reason:0];

    [*(id *)(a1 + 40) _addOperation:v40 withMessages:v58 toChangeManager:v31];
  }
  if ([v56 count])
  {
    long long v41 = [MCSFlagChange alloc];
    id v42 = +[NSSet setWithObject:MessageIsRead];
    long long v43 = [(MCSFlagChange *)v41 initWithFlagsToSet:0 flagsToClear:v42 reason:0];

    [*(id *)(a1 + 40) _addOperation:v43 withMessages:v56 toChangeManager:v31];
  }
  if ([v55 count])
  {
    long long v44 = objc_alloc_init(MCSJunk);
    [*(id *)(a1 + 40) _addOperation:v44 withMessages:v55 toChangeManager:v31];
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v45 = [v62 allKeys];
  id v46 = [v45 countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v65;
    do
    {
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(void *)v65 != v47) {
          objc_enumerationMutation(v45);
        }
        uint64_t v49 = *(void *)(*((void *)&v64 + 1) + 8 * (void)j);
        id v50 = [v62 objectForKeyedSubscript:v49];
        id v51 = [v63 objectForKeyedSubscript:v49];
        if ([v51 count])
        {
          double v52 = [[MCSArchive alloc] initWithStore:v50];
          [*(id *)(a1 + 40) _addOperation:v52 withMessages:v51 toChangeManager:v31];
        }
        long long v53 = [v61 objectForKeyedSubscript:v49];
        if ([v53 count])
        {
          long long v54 = [[MCSDelete alloc] initWithStore:v50];
          [*(id *)(a1 + 40) _addOperation:v54 withMessages:v53 toChangeManager:v31];
        }
      }
      id v46 = [v45 countByEnumeratingWithState:&v64 objects:v72 count:16];
    }
    while (v46);
  }

  [v31 resume];
}

void sub_100099E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10009A19C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) url];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) url];
    id v4 = [v3 absoluteString];
    uint64_t v5 = +[MailAccount mailboxUidFromActiveAccountsForURL:v4];

    if (v5)
    {
      uint64_t v6 = MFLogGeneral();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [*(id *)(a1 + 32) mailboxId];
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v7;
        __int16 v20 = 2114;
        uint64_t v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Nano Moving messages to new mailbox. MailboxId: %{public}@, MessageIds: %{public}@", buf, 0x16u);
      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10009A4FC;
      v17[3] = &unk_10013D618;
      id v9 = *(void **)(a1 + 40);
      void v17[4] = *(void *)(a1 + 48);
      id v10 = objc_msgSend(v9, "ef_compactMap:", v17);
      id v11 = [objc_alloc((Class)NSSet) initWithArray:v10];
      id v12 = +[MailChangeManager sharedChangeManager];
      [v12 pause];
      unsigned __int8 v13 = [[MCSTransfer alloc] initWithDestination:v5 markAsRead:0];
      [*(id *)(a1 + 48) _addOperation:v13 withMessages:v11 toChangeManager:v12];
      [v12 resume];
    }
    else
    {
      unsigned __int8 v15 = MFLogGeneral();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v16 = [*(id *)(a1 + 32) url];
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#Nano Invalid mailbox url. Unable to move. URL: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [*(id *)(a1 + 32) mailboxId];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Nano Missing mailbox url. Unable to move. Id: %{public}@", buf, 0xCu);
    }
  }
}

void sub_10009A474(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10009A4FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _libraryMessageForMessageId:v3];
  if (!v4)
  {
    uint64_t v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#Nano Invalid message id. Unable to move message. Id: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }

  return v4;
}

void sub_10009A5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009A690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unsigned __int8 v13 = v12;

  _Unwind_Resume(a1);
}

void sub_10009A75C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10009AB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10009AED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10009B0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009B164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009B43C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009B5CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009B6B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10009B6CC(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueId];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 128) uniqueId];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_10009B734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009B7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009B8E4(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10009B968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009B9B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009BAB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009BB64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009BBDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009C118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10009C278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009C388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009C480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009C5B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009C698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10009C6D0(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v6
    || (+[NSDate date],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 timeIntervalSinceDate:v6],
        double v4 = v3,
        v2,
        v4 > 86400.0))
  {
    [*(id *)(a1 + 48) emptyTrash];
    id v5 = +[NSDate date];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

void sub_10009C794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10009C894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10009C8C0()
{
  id v0 = (void *)qword_10016BD78;
  if (!qword_10016BD78)
  {
    v4[0] = @"SwipeActionNone";
    v4[1] = @"SwipeActionRead";
    v5[0] = &off_1001463B0;
    v5[1] = &off_1001463C8;
    void v4[2] = @"SwipeActionFlag";
    v4[3] = @"SwipeActionMove";
    void v5[2] = &off_1001463E0;
    v5[3] = &off_1001463F8;
    void v4[4] = @"SwipeActionTrash";
    void v4[5] = @"SwipeActionArchive";
    void v5[4] = &off_100146410;
    v5[5] = &off_100146428;
    v4[6] = @"SwipeActionAlternateDestructiveAction";
    v5[6] = &off_100146440;
    uint64_t v1 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
    uint64_t v2 = (void *)qword_10016BD78;
    qword_10016BD78 = v1;

    id v0 = (void *)qword_10016BD78;
  }

  return v0;
}

void sub_10009CAB0(_Unwind_Exception *a1)
{
  double v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10009CB84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009CD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  id v23 = v20;

  _Unwind_Resume(a1);
}

void sub_10009CDB0()
{
}

void sub_10009CDC0()
{
}

void sub_10009D2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10009D380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MFUserNotificationCenterController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10009D4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10009D4F4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) vipReader];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = [v2 hasVIPs];

  double v3 = [*(id *)(a1 + 32) conversationSubscriptionProvider];
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = [v3 hasSubscribedConversations];

  double v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "nts_resetUserNotificationCenterTopics");
}

void sub_10009D568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009D618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10009D724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10009D74C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
  id v2 = *((id *)WeakRetained + 20);
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
  double v3 = [WeakRetained _currentSettingsStringForSettingsByTopic:v2];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:v3 forKeyedSubscript:@"Notification Settings"];

  return v4;
}

void sub_10009D7F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009D884(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10009D9BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10009DAF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10009DB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009DCB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10009DCE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = MFUserAgent();
    objc_msgSend(WeakRetained, "_updatePostingDelay:", objc_msgSend(v1, "isForeground"));
  }
}

void sub_10009DD4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10009DDCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10009DE5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10009DF40(id *a1)
{
  [*((id *)a1[4] + 10) updateCutoffForMailboxesWithMessages:a1[5]];
  id v2 = MSUserNotificationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = objc_msgSend(a1[5], "ef_mapSelector:", "ef_publicDescription");
    id v4 = objc_msgSend(a1[6], "ef_publicDescription");
    *(_DWORD *)buf = 138543618;
    long long v29 = v3;
    __int16 v30 = 2114;
    long long v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "notifyMessagesAdded=%{public}@, context=%{public}@", buf, 0x16u);
  }
  id v5 = objc_msgSend(a1[5], "ef_compactMap:", &stru_10013D660);
  id v6 = [a1[4] notificationAnalyticsLogger];
  [v6 messageAddedWithNotificationIDs:v5];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [MFMessageResultsGenerator alloc];
  v27[0] = @"MSResultsKeyBodySummary";
  v27[1] = @"MSResultsKeySuppressionContexts";
  id v9 = +[NSArray arrayWithObjects:v27 count:2];
  id v10 = [(MFMessageResultsGenerator *)v8 initWithKeys:v9 downloadIfNecessary:0];

  id v11 = objc_alloc_init((Class)CNContactStore);
  if ([a1[6] isRemindMe])
  {
    id v12 = a1[5];
  }
  else
  {
    id v12 = [*((id *)a1[4] + 9) messagesNeedingNotification:a1[5]];
  }
  unsigned __int8 v13 = v12;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10009E314;
  v21[3] = &unk_10013D688;
  id v14 = v10;
  id v22 = v14;
  id v15 = a1[6];
  id v16 = a1[4];
  id v23 = v15;
  id v24 = v16;
  id v17 = v11;
  id v25 = v17;
  id v18 = v7;
  id v26 = v18;
  uint64_t v19 = objc_msgSend(v13, "ef_map:", v21);
  if ([v19 count])
  {
    if ([a1[6] isRemindMe])
    {
      uint64_t v20 = 1;
    }
    else if ([a1[6] isSummaryDownload])
    {
      uint64_t v20 = [a1[4] willUseGeneratedSummaries] ^ 1;
    }
    else
    {
      uint64_t v20 = 0;
    }
    [a1[4] handleDidFetchMessages:v18 postImmediately:v20];
  }
}

void sub_10009E238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_10009E2E4(id a1, MFLibraryMessage *a2)
{
  id v2 = [(MFLibraryMessage *)a2 notificationID];

  return (NSString *)v2;
}

id sub_10009E314(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setMessage:v3];
  id v4 = [*(id *)(a1 + 32) results];
  id v5 = [v4 objectForKeyedSubscript:@"MSResultsKeyBodySummary"];
  id v6 = [v4 objectForKeyedSubscript:@"MSResultsKeySuppressionContexts"];
  if ([*(id *)(a1 + 40) isRemindMe])
  {
    id v7 = [MFNotificationMessage alloc];
    id v8 = [*(id *)(a1 + 48) favoritesReader];
    id v9 = [*(id *)(a1 + 48) vipReader];
    uint64_t v10 = *(void *)(a1 + 56);
    id v11 = [*(id *)(a1 + 40) remindMeDate];
    id v12 = [(MFNotificationMessage *)v7 initWithFavoritesReader:v8 vipReader:v9 libraryMessage:v3 contactStore:v10 remindMeDate:v11];
  }
  else
  {
    unsigned __int8 v13 = [MFNotificationMessage alloc];
    id v8 = [*(id *)(a1 + 48) favoritesReader];
    id v9 = [*(id *)(a1 + 48) vipReader];
    id v12 = [(MFNotificationMessage *)v13 initWithFavoritesReader:v8 vipReader:v9 libraryMessage:v3 contactStore:*(void *)(a1 + 56) suppressionContexts:v6 summary:v5];
  }

  if (v12) {
    [*(id *)(a1 + 64) addObject:v12];
  }
  if (([*(id *)(a1 + 40) isSummaryDownload] & 1) == 0
    && ![v5 length]
    && ([*(id *)(a1 + 40) isRemindMe] & 1) == 0)
  {
    [*(id *)(a1 + 48) requestSummaryForMessage:v3];
  }
  if (!v5)
  {
    id v14 = MSUserNotificationsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_msgSend(v3, "ef_publicDescription");
      unsigned int v16 = [*(id *)(a1 + 40) isRemindMe];
      int v18 = 138543618;
      uint64_t v19 = v15;
      __int16 v20 = 1026;
      unsigned int v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No summary for message=%{public}@ isRemindMe=%{public}d", (uint8_t *)&v18, 0x12u);
    }
  }

  return v4;
}

void sub_10009E5A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009E7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_10009E828(id a1, MailAccount *a2)
{
  id v2 = [(MailAccount *)a2 uniqueID];

  return (NSString *)v2;
}

id sub_10009E858(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 request];
  id v5 = [v4 content];

  id v6 = [v3 request];
  id v7 = [v6 identifier];

  id v8 = [v5 userInfo];
  id v9 = [v8 objectForKeyedSubscript:MSUserNotificationContentKeyAccountReference];
  if (v9 && ([*(id *)(a1 + 32) containsObject:v9] & 1) != 0) {
    id v10 = 0;
  }
  else {
    id v10 = v7;
  }

  return v10;
}

void sub_10009E940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009E984()
{
  JUMPOUT(0x10009E978);
}

void sub_10009E990()
{
}

void sub_10009EBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_10009EE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10009EF08(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_removeObjectsInArray:", *(void *)(a1 + 32));
}

id sub_10009EF14(uint64_t a1, void *a2)
{
  return [a2 removeObjectsForKeys:*(void *)(a1 + 32)];
}

void sub_10009F094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10009F950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_10009FB98(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) notificationID];
    [v8 removeObjectForKey:v3];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) remindMeDate];
    id v4 = [*(id *)(a1 + 32) libraryMessage];
    id v5 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 libraryID]);
    id v6 = +[EFPair pairWithFirst:v3 second:v5];
    id v7 = [*(id *)(a1 + 32) notificationID];
    [v8 setObject:v6 forKeyedSubscript:v7];
  }
}

void sub_10009FCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v15 = v13;

  _Unwind_Resume(a1);
}

void sub_10009FD00(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) notificationID];
    [v3 removeObject:v4];

    id v5 = MSUserNotificationsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing notification needing summary: %{public}@", (uint8_t *)&v9, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 41))
  {
    id v7 = [*(id *)(a1 + 32) notificationID];
    [v3 addObject:v7];

    id v5 = MSUserNotificationsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding notification needing summary: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_7;
  }
LABEL_8:
}

void sub_10009FE80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A0134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  id v23 = v21;

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)(v22 - 88));

  _Unwind_Resume(a1);
}

void sub_1000A01E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = MSUserNotificationsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = *(void **)(a1 + 32);
        id v7 = [v6 content];
        id v8 = [v7 topicIdentifiers];
        int v9 = objc_msgSend(v3, "ef_publicDescription");
        int v14 = 138543874;
        id v15 = v6;
        __int16 v16 = 2114;
        id v17 = v8;
        __int16 v18 = 2114;
        uint64_t v19 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to add notification request: %{public}@ for topics: %{public}@ with error %{public}@", (uint8_t *)&v14, 0x20u);
      }
    }
    else
    {
      id v10 = MSUserNotificationsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = *(void **)(a1 + 32);
        id v12 = [v11 content];
        unsigned __int8 v13 = [v12 topicIdentifiers];
        int v14 = 138543618;
        id v15 = v11;
        __int16 v16 = 2114;
        id v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully created notification request: %{public}@ for topics: %{public}@", (uint8_t *)&v14, 0x16u);
      }
      if (*(unsigned char *)(a1 + 56))
      {
        id v5 = [WeakRetained notificationAnalyticsLogger];
        [v5 notificationWithSummaryPostedForNotificationID:*(void *)(a1 + 40)];
      }
      else
      {
        id v5 = [WeakRetained notificationAnalyticsLogger];
        [v5 notificationWithoutSummaryPostedForNotificationID:*(void *)(a1 + 40)];
      }
    }
  }
}

void sub_1000A03D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A0440(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = MSUserNotificationsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = *(void **)(a1 + 32);
        id v7 = [v6 content];
        id v8 = [v7 topicIdentifiers];
        int v9 = objc_msgSend(v3, "ef_publicDescription");
        int v14 = 138543874;
        id v15 = v6;
        __int16 v16 = 2114;
        id v17 = v8;
        __int16 v18 = 2114;
        uint64_t v19 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to replace notification request: %{public}@ for topics: %{public}@ with error %{public}@", (uint8_t *)&v14, 0x20u);
      }
      goto LABEL_9;
    }
    id v10 = MSUserNotificationsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = [v11 content];
      unsigned __int8 v13 = [v12 topicIdentifiers];
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2114;
      id v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully replaced notification request: %{public}@ for topics: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    if (*(unsigned char *)(a1 + 56))
    {
      id v5 = [WeakRetained notificationAnalyticsLogger];
      [v5 notificationSummaryUpdatedForNotificationID:*(void *)(a1 + 40)];
LABEL_9:
    }
  }
}

void sub_1000A0618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000A0700(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_resetUserNotificationCenterTopics");
}

void sub_1000A0930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000A0994(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = MSUserNotificationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000C24A0(a1, (uint64_t)v3, v4);
    }
  }
  else
  {
    id v4 = MSUserNotificationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully set new NotificationCenter topics: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_1000A0A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

UNNotificationTopicRequest *__cdecl sub_1000A0AD4(id a1, MailAccount *a2)
{
  id v2 = a2;
  id v3 = [(MailAccount *)v2 uniqueID];
  id v4 = [(MailAccount *)v2 displayName];
  uint64_t v5 = [(MailAccount *)v2 displayName];
  int v6 = +[UNNotificationTopicRequest topicRequestWithIdentifier:v3 displayName:v4 priority:0 sortIdentifier:v5 supportedOptions:5 enabledOptions:1];

  return (UNNotificationTopicRequest *)v6;
}

void sub_1000A0B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A0FAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A1044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A1124(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) updateCutoffForMailboxesWithMessages:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) objectForKey:MessageIsRead];
  unsigned int v3 = [v2 BOOLValue];

  id v4 = [*(id *)(a1 + 48) objectForKey:MessageIsDeleted];
  unsigned int v5 = [v4 BOOLValue];

  if ((v5 | v3) == 1)
  {
    id v6 = objc_alloc_init((Class)CNContactStore);
    unsigned __int8 v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_1000A1380;
    __int16 v16 = &unk_10013D820;
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 32);
    id v8 = v6;
    id v18 = v8;
    int v9 = objc_msgSend(v7, "ef_compactMap:", &v13);
    id v10 = objc_msgSend(v9, "ef_map:", &stru_10013D860, v13, v14, v15, v16, v17);
    if ([v10 count])
    {
      id v11 = MSUserNotificationsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v10 count];
        *(_DWORD *)buf = 67109890;
        unsigned int v20 = v3;
        __int16 v21 = 1024;
        unsigned int v22 = v5;
        __int16 v23 = 2048;
        id v24 = v12;
        __int16 v25 = 2112;
        id v26 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing notifications due to flag changes (Read:%d, Deleted:%d) for %lu messages: %@", buf, 0x22u);
      }

      [*(id *)(a1 + 32) removeNotificationsWithIdentifiers:v10];
    }
  }
}

void sub_1000A1328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

MFNotificationMessage *sub_1000A1380(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MFNotificationMessage alloc];
  unsigned int v5 = [*(id *)(a1 + 32) favoritesReader];
  id v6 = [*(id *)(a1 + 32) vipReader];
  uint64_t v7 = [(MFNotificationMessage *)v4 initWithFavoritesReader:v5 vipReader:v6 libraryMessage:v3 contactStore:*(void *)(a1 + 40) suppressionContexts:0 summary:0];

  return v7;
}

void sub_1000A142C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_1000A1454(id a1, MFNotificationMessage *a2)
{
  id v2 = [(MFNotificationMessage *)a2 notificationID];

  return (NSString *)v2;
}

void sub_1000A15B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000A15EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(v3, "mf_externalReference");
  [*(id *)(a1 + 32) cancelSummaryRequestForMessageWithExternalReference:v4];
  unsigned int v5 = [v3 notificationID];

  return v5;
}

void sub_1000A1660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A1778(uint64_t a1)
{
  __int16 v21 = [*(id *)(*(void *)(a1 + 32) + 104) deliveredNotifications];
  id v22 = objc_alloc_init((Class)NSMutableArray);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v21;
  id v1 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v1)
  {
    uint64_t v26 = *(void *)v31;
    uint64_t v27 = MSUserNotificationCenterTopicVIP;
    uint64_t v23 = MSUserNotificationContentKeySenderAddress;
    do
    {
      id v2 = v1;
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        unsigned int v5 = MSUserNotificationsLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = v4;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "notification: %@", buf, 0xCu);
        }

        id v6 = [v4 request];
        uint64_t v7 = [v6 content];

        id v8 = [v7 topicIdentifiers];
        int v9 = [v4 request];
        id v10 = [v9 identifier];

        if ([v8 containsObject:v27])
        {
          id v11 = [v7 userInfo];
          id v12 = [v11 objectForKeyedSubscript:v23];
          unsigned __int8 v13 = [*(id *)(a1 + 32) vipReader];
          unsigned __int8 v14 = [v13 isVIPAddress:v12];

          if ((v14 & 1) == 0)
          {
            if ([v8 count] == (id)1)
            {
              [v22 addObject:v10];
            }
            else
            {
              id v15 = [v4 request];
              __int16 v16 = [v15 content];
              id v17 = [v16 mutableCopy];

              id v18 = [objc_alloc((Class)NSMutableSet) initWithSet:v8];
              [v18 removeObject:v27];
              [v17 setTopicIdentifiers:v18];
              uint64_t v19 = [*(id *)(a1 + 32) systemUserNotificationCenter];
              v28[0] = _NSConcreteStackBlock;
              v28[1] = 3221225472;
              v28[2] = sub_1000A1C18;
              v28[3] = &unk_10013A0C0;
              id v29 = v10;
              [v19 replaceContentForRequestWithIdentifier:v29 replacementContent:v17 completionHandler:v28];
            }
          }
        }
      }
      id v1 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v1);
  }

  unsigned int v20 = [*(id *)(a1 + 32) systemUserNotificationCenter];
  [v20 removeDeliveredNotificationsWithIdentifiers:v22];
}

void sub_1000A1B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1000A1C18(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = MSUserNotificationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      sub_1000C252C();
    }
  }
  else
  {
    id v4 = MSUserNotificationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully replaced notification request due to VIP change: ID: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_1000A1D18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A1F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000A2020(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "nts_resetUserNotificationCenterTopics");
  id v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "nts_removeNotificationsForRemovedAccounts");
}

void sub_1000A21CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A2440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A2574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1000A2628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_unfair_lock_unlock(v10);
  _Unwind_Resume(a1);
}

void sub_1000A2774(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1000A27A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [v3 summarizationSetting];
    os_unfair_lock_lock(WeakRetained + 3);
    BYTE2(WeakRetained[6]._os_unfair_lock_opaque) = v5 == (id)2;
    os_unfair_lock_unlock(WeakRetained + 3);
    int v6 = MSUserNotificationsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v5 == (id)2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notification summarization enabled: %{BOOL}d", (uint8_t *)v10, 8u);
    }

    id v7 = [(os_unfair_lock_s *)WeakRetained willUseGeneratedSummaries];
    id v8 = [(os_unfair_lock_s *)WeakRetained notificationAnalyticsLogger];
    [v8 setGeneratedSummarySupported:v7];

    int v9 = MFUserAgent();
    -[os_unfair_lock_s _updatePostingDelay:](WeakRetained, "_updatePostingDelay:", [v9 isForeground]);
  }
}

void sub_1000A28F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A2928(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    objc_storeStrong((id *)&v6[40], a2);
    id v7 = *(id *)&v6[38]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v6 + 2);
    [(os_unfair_lock_s *)v6 _logCurrentSettings];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "userNotificationCenterSettingsDidChange:", v4, (void)v12);
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

void sub_1000A2A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A2B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A2C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000A2CA8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) appendFormat:@"%@: Alerts: %ld, Alert Style: %ld, Lock Screen: %ld, Sounds: %ld, Badges: %ld\n", v6, objc_msgSend(v5, "alertSetting"), objc_msgSend(v5, "alertStyle"), objc_msgSend(v5, "lockScreenSetting"), objc_msgSend(v5, "soundSetting"), objc_msgSend(v5, "badgeSetting")];
}

void sub_1000A2D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  _Unwind_Resume(a1);
}

void sub_1000A2DF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A3568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _Unwind_Exception *exception_objecta, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&STACK[0x330], 8);
  _Block_object_dispose(&STACK[0x350], 8);
  _Block_object_dispose(&STACK[0x370], 8);
  _Block_object_dispose(&STACK[0x390], 8);
  _Unwind_Resume(a1);
}

void sub_1000A3798(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 isEqualToString:MSUserNotificationCenterTopicVIP])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "alertSetting"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "lockScreenSetting"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "soundSetting"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "badgeSetting"));
    uint64_t v6 = *(void *)(a1 + 72);
LABEL_7:
    *(unsigned char *)(*(void *)(v6 + 8) + 24) = 1;
    goto LABEL_8;
  }
  if ([v7 isEqualToString:MSUserNotificationCenterTopicNotifiedThreads])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "alertSetting"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "lockScreenSetting"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "soundSetting"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "badgeSetting"));
    uint64_t v6 = *(void *)(a1 + 112);
    goto LABEL_7;
  }
  if ([v7 isEqualToString:MSUserNotificationCenterTopicFavoriteMailboxes])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "alertSetting"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "lockScreenSetting"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "soundSetting"));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "badgeSetting"));
    uint64_t v6 = *(void *)(a1 + 152);
    goto LABEL_7;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "alertSetting"));
  *(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "lockScreenSetting"));
  *(void *)(*(void *)(*(void *)(a1 + 184) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "soundSetting"));
  *(void *)(*(void *)(*(void *)(a1 + 192) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "_settingIsEnabled:", objc_msgSend(v5, "badgeSetting"));
LABEL_8:
}

void sub_1000A3AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A3E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A4010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A428C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A45DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, ...)
{
  va_start(va, a14);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000A466C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MSUserNotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notifications needing summaries: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 containsObject:*(void *)(a1 + 32)];
}

void sub_1000A473C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A4758(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "mf_externalReference");
  id v4 = [v5 objectForKey:v3];
  if (v4)
  {
    [v5 removeObjectForKey:v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    [v4 setObserver:0];
  }
}

void sub_1000A47FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A48D0(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = *(id *)(a1 + 32);
    if ([v2 conversationFlags] == (id)1)
    {
      id v3 = MSUserNotificationsLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = [v2 globalMessageID];
        id v5 = [v2 conversationID];
        uint64_t v6 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134349568;
        id v19 = v4;
        __int16 v20 = 2050;
        id v21 = v5;
        __int16 v22 = 2050;
        uint64_t v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating notified message for conversation ID change: %{public}lld. Conversation ID: %{public}lld. Old conversation ID: %{public}lld", buf, 0x20u);
      }

      id v7 = [*(id *)(*(void *)(a1 + 40) + 104) deliveredNotifications];
      [v2 notificationID];
      long long v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472;
      long long v14 = sub_1000A4B74;
      long long v15 = &unk_10013D950;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = v8;
      if ((objc_msgSend(v7, "ef_any:", &v12) & 1) == 0)
      {
        id v9 = MSUserNotificationsLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v19 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Post notification for Notified Thread due to conversation ID change: %{public}@", buf, 0xCu);
        }

        uint64_t v10 = *(void **)(a1 + 40);
        id v17 = v2;
        id v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1, v12, v13, v14, v15);
        [v10 notifyMessagesAdded:v11 isSummaryDownload:0];
      }
    }
  }
  else
  {
    id v2 = 0;
  }
}

void sub_1000A4B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id sub_1000A4B74(uint64_t a1, void *a2)
{
  id v3 = [a2 request];
  id v4 = [v3 identifier];
  id v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

void sub_1000A4BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A4D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_1000A4DD0(id a1, MFLibraryMessage *a2)
{
  id v2 = [(MFLibraryMessage *)a2 notificationID];

  return (NSString *)v2;
}

void sub_1000A4EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000A4F04(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 count] != 0;
  id v4 = MSUserNotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    v6[0] = 67240450;
    v6[1] = v5;
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "TriggerSummaryLoads=%{public}d, notificationsNeedingSummaries=%{public}@", (uint8_t *)v6, 0x12u);
  }
}

void sub_1000A4FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A5190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A51F8(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 message];
  int v5 = objc_msgSend(v4, "mf_externalReference");
  [v6 setObject:v3 forKey:v5];
}

void sub_1000A527C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A53A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A54C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v15 = v13;

  _Unwind_Resume(a1);
}

void sub_1000A55D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1000A5600(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectForKey:*(void *)(a1 + 32)];
  if (v3) {
    objc_msgSend(*(id *)(a1 + 40), "_nts_invalidateClient:summaryClientsByReference:", v3, v4);
  }
}

void sub_1000A566C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A57AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1000A57D4(uint64_t a1, void *a2)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v12 = a2;
  id v3 = [v12 objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        __int16 v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [v7 message];
        id v9 = [v8 account];
        uint64_t v10 = [v9 uniqueID];
        unsigned int v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

        if (v11) {
          objc_msgSend(*(id *)(a1 + 40), "_nts_invalidateClient:summaryClientsByReference:", v7, v12);
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void sub_1000A5934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A5A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000A5A38(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "mf_externalReference");
  [v4 removeObjectForKey:v3];
}

void sub_1000A5A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A5B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A5BE0(uint64_t a1)
{
  id v4 = +[EFProcessTransaction transactionWithDescription:@"MFUserNotificationCenterController cleanup"];
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32) name:MailMessageLibraryDidFinishReconciliation object:0];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 104) deliveredNotifications];
  [*(id *)(a1 + 32) _performCleanupForNotifications:v3];
  [v4 invalidate];
}

void sub_1000A5C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A5DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000A5DD8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000A5DE8(uint64_t a1)
{
}

void sub_1000A5DF0(uint64_t a1)
{
  if (EFProtectedDataAvailable())
  {
    id v2 = objc_alloc((Class)NSSet);
    id v3 = [*(id *)(*(void *)(a1 + 32) + 104) deliveredNotifications];
    id v4 = objc_msgSend(v3, "ef_map:", &stru_10013DA28);
    id v5 = [v2 initWithArray:v4];

    id v6 = objc_alloc_init((Class)NSMutableArray);
    __int16 v7 = *(void **)(a1 + 40);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    _DWORD v15[2] = sub_1000A60B4;
    v15[3] = &unk_10013DA50;
    id v8 = v5;
    long long v16 = v8;
    id v9 = v6;
    uint64_t v10 = *(void *)(a1 + 32);
    id v17 = v9;
    uint64_t v18 = v10;
    uint64_t v19 = *(void *)(a1 + 48);
    [v7 enumerateKeysAndObjectsUsingBlock:v15];
    unsigned int v11 = *(void **)(*(void *)(a1 + 32) + 184);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000A64BC;
    v13[3] = &unk_10013D740;
    id v12 = v9;
    id v14 = v12;
    [v11 performWhileLocked:v13];
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]) {
      [*(id *)(a1 + 32) handleDidFetchMessages:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) postImmediately:1];
    }
  }
  else
  {
    id v8 = MSUserNotificationsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not performing cleanup for RemindMe notifications. Protected data is not available.", buf, 2u);
    }
  }
}

void sub_1000A5FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

id sub_1000A6054(id a1, UNNotification *a2)
{
  id v2 = [(UNNotification *)a2 request];
  id v3 = [v2 identifier];

  return v3;
}

void sub_1000A60A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A60B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    __int16 v7 = [*(id *)(a1 + 48) messagePersistence];
    id v8 = [v6 second];
    uint64_t v26 = v8;
    id v9 = +[NSArray arrayWithObjects:&v26 count:1];
    uint64_t v10 = [v7 persistedMessagesForDatabaseIDs:v9 requireProtectedData:1 temporarilyUnavailableDatabaseIDs:0];

    if ([v10 count])
    {
      unsigned int v11 = [MFNotificationMessage alloc];
      id v12 = [*(id *)(a1 + 48) favoritesReader];
      long long v13 = [*(id *)(a1 + 48) vipReader];
      id v14 = [v10 firstObject];
      long long v15 = MSSharedContactStore();
      long long v16 = [v6 first];
      id v17 = [(MFNotificationMessage *)v11 initWithFavoritesReader:v12 vipReader:v13 libraryMessage:v14 contactStore:v15 remindMeDate:v16];

      uint64_t v18 = [v17 summary];
      LODWORD(v13) = [v18 length] == 0;

      if (v13)
      {
        id v21 = MSUserNotificationsLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          [v6 second];
          objc_claimAutoreleasedReturnValue();
          sub_1000C2708();
        }
      }
      else
      {
        uint64_t v19 = MSUserNotificationsLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v20 = [v6 second];
          int v22 = 138412546;
          id v23 = v5;
          __int16 v24 = 2112;
          __int16 v25 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating summary for RemindMe notification %@, message %@", (uint8_t *)&v22, 0x16u);
        }
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v17];
      }
    }
    else
    {
      id v17 = MSUserNotificationsLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        [v6 second];
        objc_claimAutoreleasedReturnValue();
        sub_1000C26C4();
      }
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v5];
    uint64_t v10 = MSUserNotificationsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Skipping update to notification %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

void sub_1000A63E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000A64BC(uint64_t a1, void *a2)
{
  return [a2 removeObjectsForKeys:*(void *)(a1 + 32)];
}

void sub_1000A6568(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

id sub_1000A6594(id a1, NSString *a2)
{
  id v2 = +[NSURL URLWithString:a2];
  id v3 = objc_msgSend(v2, "mf_messageCriterion");

  return v3;
}

void sub_1000A65EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A6A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000A6BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A6CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1000A6CD4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_1000A6D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A7148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A7240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A7424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A76B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000A7710(uint64_t a1)
{
  id v2 = MSUserNotificationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
    sub_1000C2864(v3, a1, v5, v2);
  }

  return [*(id *)(a1 + 48) requestSummaryWithClient:*(void *)(a1 + 40)];
}

void sub_1000A77A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000A7834(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_1000A78EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A7A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A7B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A7BB8(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 activeAccounts];
  objc_msgSend(v1, "_nts_startObservingAccounts:");
}

void sub_1000A7C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A7D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A7D50(uint64_t a1)
{
  id v1 = *(id **)(a1 + 32);
  id v2 = [v1[7] allKeys];
  objc_msgSend(v1, "_nts_stopObservingAccountWithIDs:");
}

void sub_1000A7DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A7E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A7F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A8010(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL sub_1000A8030(id a1, MailAccount *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void sub_1000A807C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A82B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A8320(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000A8330(uint64_t a1)
{
}

void sub_1000A8338(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000A8420(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) userInfo];
  uint64_t v2 = [v4 objectForKeyedSubscript:MailMessageStoreMessageKey];
  uint64_t v3 = [*(id *)(a1 + 40) delegate];
  [v3 notificationCenterObserver:*(void *)(a1 + 40) messageAdded:v2];
}

void sub_1000A84B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A8574(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userInfo];
  uint64_t v2 = [v5 objectForKeyedSubscript:MailMessageStoreMessageKey];
  uint64_t v3 = [v5 objectForKeyedSubscript:MailMessageStoreChangedFlagsKey];
  id v4 = [*(id *)(a1 + 40) delegate];
  [v4 notificationCenterObserver:*(void *)(a1 + 40) messagesUpdated:v2 flags:v3];
}

void sub_1000A8628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A86F8(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) userInfo];
  uint64_t v2 = [v4 objectForKeyedSubscript:MailMessageStoreMessageKey];
  if ([v2 count])
  {
    uint64_t v3 = [*(id *)(a1 + 40) delegate];
    [v3 notificationCenterObserver:*(void *)(a1 + 40) messagesDeleted:v2];
  }
}

void sub_1000A8790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A8830(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_lock(v2);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;

  os_unfair_lock_unlock(v2);
  id v21 = [*(id *)(a1 + 32) activeAccounts];
  id v5 = MSUserNotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 56) allKeys];
    *(_DWORD *)buf = 138412546;
    id v29 = v21;
    __int16 v30 = 2114;
    long long v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Observer: Accounts changed. Active accounts = %@. Currently observed accounts: %{public}@", buf, 0x16u);
  }
  __int16 v7 = [*(id *)(*(void *)(a1 + 32) + 56) allKeys];
  id v8 = [v7 mutableCopy];

  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v21;
  id v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "uniqueID", v21);
        [v8 removeObject:v15];
        long long v16 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v15];
        BOOL v17 = v16 == 0;

        if (v17) {
          uint64_t v18 = v10;
        }
        else {
          uint64_t v18 = v9;
        }
        [v18 addObject:v14];
      }
      id v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    uint64_t v19 = MSUserNotificationsLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Observer: Removed Accounts: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_nts_stopObservingAccountWithIDs:", v8);
  }
  if (objc_msgSend(v9, "count", v21)) {
    objc_msgSend(*(id *)(a1 + 32), "_nts_updateObservationWithAccounts:", v9);
  }
  if ([v10 count]) {
    objc_msgSend(*(id *)(a1 + 32), "_nts_startObservingAccounts:", v10);
  }
  __int16 v20 = [*(id *)(a1 + 32) delegate];
  [v20 activeAccountsDidChangeForNotificationCenterObserver:*(void *)(a1 + 32)];
}

void sub_1000A8B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1000A8C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A8CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000A8DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A8DD0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = +[NSArray arrayWithObjects:&v3 count:1];
  objc_msgSend(v1, "_nts_updateObservationWithAccounts:", v2);
}

void sub_1000A8E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000A9234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1000A962C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000A9A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000A9E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000A9E84(id a1, MFMailboxUid *a2)
{
  return [(MFMailboxUid *)a2 isOutgoingMailboxUid] ^ 1;
}

void sub_1000A9FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_1000AA0A0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _hasBeenUpgraded];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _verifyDatabaseAccessAndPerformUpgrade];
  }
  return result;
}

void sub_1000AA198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AA244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AA2A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AA34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AA3A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AA708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_1000AA7BC(id a1, MailAccount *a2)
{
  uint64_t v2 = [(MailAccount *)a2 uniqueID];

  return (NSString *)v2;
}

id sub_1000AA7EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 notificationID];
  if ([*(id *)(a1 + 32) containsObject:v4])
  {
    id v5 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v4];
    id v6 = [*(id *)(a1 + 40) delegate];
    id v5 = [v6 notificationRequestForNotificationMessage:v3 destinations:4];
  }

  return v5;
}

void sub_1000AA890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AA8BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = MSUserNotificationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000C28D4(a1, (uint64_t)v3, v4);
    }
  }
  else
  {
    id v4 = MSUserNotificationsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "UPGRADE: Successfully created notification request: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_1000AA9A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AAD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Block_object_dispose((const void *)(v24 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_1000AAE50(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v4 = +[MFMailMessageLibrary defaultInstance];
    uint64_t v5 = objc_msgSend(v4, "messagesMatchingCriterion:options:range:success:", v3, *(unsigned int *)(a1 + 48), 0, *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8) + 24);

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_1000AAF10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000AAF2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a1 + 40);
}

MFNotificationMessage *sub_1000AAF44(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MSUserNotificationsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 libraryID];
    id v6 = [v3 subject];
    id v7 = [v6 length];
    id v8 = [v3 senders];
    id v9 = [v8 firstObject];
    int v17 = 134219010;
    id v18 = v3;
    __int16 v19 = 2112;
    id v20 = v3;
    __int16 v21 = 2048;
    id v22 = v5;
    __int16 v23 = 2048;
    id v24 = v7;
    __int16 v25 = 2048;
    id v26 = [v9 length];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UPGRADE: account contain message = %p -> %@, messageID:%lli, subject:%lu, sender:%lu", (uint8_t *)&v17, 0x34u);
  }
  [*(id *)(a1 + 32) setMessage:v3];
  id v10 = [*(id *)(a1 + 32) results];
  id v11 = [v10 objectForKey:@"MSResultsKeyBodySummary"];
  uint64_t v12 = [MFNotificationMessage alloc];
  long long v13 = [*(id *)(a1 + 40) favoritesReader];
  id v14 = [*(id *)(a1 + 40) vipReader];
  long long v15 = [(MFNotificationMessage *)v12 initWithFavoritesReader:v13 vipReader:v14 libraryMessage:v3 contactStore:*(void *)(a1 + 48) suppressionContexts:0 summary:v11];

  return v15;
}

void sub_1000AB130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AB6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35)
{
  _Unwind_Resume(a1);
}

id sub_1000AB888(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = [v5 uniqueID];
  if ([*(id *)(a1 + 32) containsObject:v6] == a3)
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [v8 favoritesReader];
    id v7 = [v8 _criterionForObservedMailboxesInAccount:v5 favoritesReader:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_1000AB930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000AB95C(uint64_t a1)
{
  id v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v1;
}

id sub_1000AB998(uint64_t a1)
{
  id v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v1;
}

void sub_1000ABB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000ABC58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

MFMessageCriterion *__cdecl sub_1000ABC6C(id a1, NSString *a2)
{
  uint64_t v2 = +[NSURL URLWithString:a2];
  id v3 = objc_msgSend(v2, "mf_messageCriterion");

  return (MFMessageCriterion *)v3;
}

void sub_1000ABCC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000ABDD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000ABE98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

MFMessageCriterion *__cdecl sub_1000ABEC4(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  id v5 = objc_alloc((Class)MFMessageCriterion);
  [v3 timeIntervalSince1970];
  id v7 = +[NSString stringWithFormat:@"%lld", (uint64_t)v6];
  id v8 = [v5 initWithType:11 qualifier:6 expression:v7];

  id v9 = objc_alloc((Class)MFMessageCriterion);
  [v4 timeIntervalSince1970];
  id v11 = +[NSString stringWithFormat:@"%lld", (uint64_t)v10];
  id v12 = [v9 initWithType:11 qualifier:5 expression:v11];

  v16[0] = v8;
  v16[1] = v12;
  long long v13 = +[NSArray arrayWithObjects:v16 count:2];
  id v14 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v13];

  return (MFMessageCriterion *)v14;
}

void sub_1000AC06C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AC1CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AC358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AC4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AC694(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_10016BD80;
  qword_10016BD80 = (uint64_t)v1;
}

void sub_1000AC704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AC904(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000ACE30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000ACFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1000AD0AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AD0C4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) autoFetchData];

  if (!v2)
  {
    id v3 = objc_alloc_init(_MFMailNotificationSoundControllerAutoFetchData);
    objc_msgSend(*(id *)(a1 + 32), "setAutoFetchData:");
  }
}

void sub_1000AD144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AD2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AD43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000AD468(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [v1 autoFetchData];
  objc_msgSend(v1, "_fetchJobCompleted:autoFetchData:", v2);
}

void sub_1000AD4C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AD7CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AD928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AD940(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) autoFetchData];
  if (v2) {
    objc_msgSend(*(id *)(a1 + 32), "_fetchFinished:timestamp:", v2, objc_msgSend(v2, "fetchStart"));
  }
  [*(id *)(*(void *)(a1 + 32) + 8) lock];
  [*(id *)(a1 + 32) setAutoFetchData:0];
  [*(id *)(*(void *)(a1 + 32) + 8) signal];
  [*(id *)(*(void *)(a1 + 32) + 8) unlock];
}

void sub_1000AD9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000ADAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  long long v15 = v14;

  _Unwind_Resume(a1);
}

void sub_1000ADB04(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"AutoFetchDontNotify"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    id v5 = *(void **)(*(void *)(a1 + 40) + 56);
    double v6 = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
    [v5 addObject:v6];

    id v7 = *(void **)(a1 + 40);
    id v8 = (char *)[v7 autoFetchPushCount] + 1;
    [v7 setAutoFetchPushCount:v8];
  }
}

void sub_1000ADBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000ADCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  long long v15 = v14;

  _Unwind_Resume(a1);
}

void sub_1000ADD08(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"AutoFetchDontNotify"];
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 56) firstObject];
    double v6 = v5;
    if (v5)
    {
      id v7 = [v5 unsignedLongLongValue];
      [*(id *)(*(void *)(a1 + 40) + 56) removeObjectAtIndex:0];
    }
    else
    {
      id v8 = MSUserNotificationsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000C2CB4(v8);
      }

      id v7 = 0;
    }
    if ([*(id *)(a1 + 40) autoFetchPushCount])
    {
      id v9 = objc_alloc_init(_MFMailNotificationSoundControllerAutoFetchData);
      [*(id *)(a1 + 40) _fetchJobCompleted:*(void *)(a1 + 32) autoFetchData:v9];
      [*(id *)(a1 + 40) _fetchFinished:v9 timestamp:v7];
    }
    [*(id *)(*(void *)(a1 + 40) + 8) lock];
    [*(id *)(a1 + 40) setAutoFetchPushCount:0];
    [*(id *)(*(void *)(a1 + 40) + 56) removeAllObjects];
    [*(id *)(*(void *)(a1 + 40) + 8) signal];
    [*(id *)(*(void *)(a1 + 40) + 8) unlock];
  }
}

void sub_1000ADE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000ADF40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000ADFBC(id a1)
{
  os_log_t v1 = objc_alloc_init(MFUserProfileProvider_iOS);
  id v2 = (void *)qword_10016BD98;
  qword_10016BD98 = (uint64_t)v1;
}

void sub_1000AE054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AE0A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AE238(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1000AE2DC(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_10016BDA0;
  qword_10016BDA0 = v1;

  id v3 = +[UMUserManager sharedManager];
  [v3 registerUserSyncStakeholder:qword_10016BDA0 withMachServiceName:@"com.apple.mailq.sync.xpc"];
}

void sub_1000AE354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AE424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AE640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AE720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AE7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AE838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AE92C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AEA14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AEB0C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BDB0;
  qword_10016BDB0 = (uint64_t)v1;
}

void sub_1000AEB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AEC30(uint64_t a1)
{
  id v2 = [MFVIPSendersLibrary alloc];
  id v5 = [*(id *)(a1 + 32) defaultMessageLibrary];
  id v3 = -[MFVIPSendersLibrary initWithLibrary:](v2, "initWithLibrary:");
  unsigned __int8 v4 = (void *)qword_10016BDC0;
  qword_10016BDC0 = (uint64_t)v3;
}

void sub_1000AECA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000AEFDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AF180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  double v10 = v9;

  a9.super_class = (Class)MFVIPSendersLibrary;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000AF1BC(uint64_t a1)
{
  id v2 = +[EFScheduler mainThreadScheduler];
  [v2 performSyncBlock:&v3];

  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

void sub_1000AF260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000AF270(uint64_t a1)
{
  ABAddressBookUnregisterChangeCallback();
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  ABAddressBookUnregisterExternalChangeCallback(v3, (ABExternalChangeCallback)sub_1000AF2D4, v2);
}

id sub_1000AF2D4(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _handleAddressBookNotification];
}

void sub_1000AF40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_1000AF41C(id *result)
{
  if (atomic_fetch_add_explicit((atomic_uint *volatile)result[4] + 6, 0xFFFFFFFF, memory_order_relaxed) == 1) {
    return (id *)[result[4] _checkForAddressBookChangesNeedingRevert:1];
  }
  return result;
}

void sub_1000AF56C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000AF57C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkForAddressBookChangesNeedingRevert:0];
}

void sub_1000AFA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1000AFCB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B0064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B01A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B029C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B034C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B043C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B044C(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v3 = [*(id *)(a1 + 32) userProfileProvider];
  long long v36 = [v3 accountsEmailAddresses];

  unsigned __int8 v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFAbsoluteTime v54 = *(double *)&v36;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "starting to/cc migration, email addresses: %@", buf, 0xCu);
  }

  char v50 = 1;
  long long v32 = +[MFMailMessageLibrary defaultInstance];
  id v5 = 0;
  char v6 = 0;
  while (v50 && (v6 & 1) == 0)
  {
    uint64_t v35 = +[NSMutableDictionary dictionary];
    id v7 = [v32 storedIntegerPropertyWithName:@"MaxRowIdForMigrationToVersion31"];
    id v8 = [v7 longLongValue];

    long long v33 = [v32 orderedBatchOfMessagesEndingAtRowId:v8 limit:500 success:&v50];
    if (!v50)
    {
      id v26 = MFLogGeneral();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "failure during to/cc migration", buf, 2u);
      }
      goto LABEL_43;
    }
    if ([v33 count])
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = v33;
      id v9 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v9)
      {
        uint64_t v37 = *(void *)v47;
        do
        {
          uint64_t v10 = 0;
          id v38 = v9;
          do
          {
            if (*(void *)v47 != v37) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(void **)(*((void *)&v46 + 1) + 8 * v10);
            id v12 = (char *)[v11 libraryID];
            id v13 = [v11 messageFlags];
            id v14 = [v11 to];
            long long v15 = [v11 cc];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v16 = v36;
            id v17 = [v16 countByEnumeratingWithState:&v42 objects:v51 count:16];
            unint64_t v39 = (unint64_t)v13;
            uint64_t v40 = v10;
            long long v41 = v12;
            BOOL v18 = 0;
            BOOL v19 = 0;
            if (v17)
            {
              uint64_t v20 = *(void *)v43;
              while (2)
              {
                for (i = 0; i != v17; i = (char *)i + 1)
                {
                  if (*(void *)v43 != v20) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * i);
                  if (!v18 && v14 != 0) {
                    BOOL v18 = objc_msgSend(v14, "mf_indexOfRecipientWithEmailAddress:", *(void *)(*((void *)&v42 + 1) + 8 * i)) != (id)0x7FFFFFFFFFFFFFFFLL;
                  }
                  if (!v19 && v15 != 0) {
                    BOOL v19 = objc_msgSend(v15, "mf_indexOfRecipientWithEmailAddress:", v22) != (id)0x7FFFFFFFFFFFFFFFLL;
                  }
                  if (v18 && v19)
                  {
                    LOBYTE(v18) = 1;
                    LOBYTE(v19) = 1;
                    goto LABEL_27;
                  }
                }
                id v17 = [v16 countByEnumeratingWithState:&v42 objects:v51 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }
LABEL_27:

            id v5 = v41;
            uint64_t v23 = 0x8000000000;
            if (!v18 || (v39 & 0x8000000000) != 0) {
              uint64_t v23 = 0;
            }
            if (v19 && (v39 & 0x10000000000) == 0) {
              uint64_t v24 = v23 | 0x10000000000;
            }
            else {
              uint64_t v24 = v23;
            }
            if (v24)
            {
              __int16 v25 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
              [v35 setObject:v25 forKey:v11];
            }
            uint64_t v10 = v40 + 1;
          }
          while ((id)(v40 + 1) != v38);
          id v9 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v9);
      }

      if ([v35 count]) {
        [v32 updateFlagsForMessagesInPlace:v35 success:&v50];
      }
      if (!v50) {
        goto LABEL_44;
      }
      if (v5)
      {
        id v26 = +[NSNumber numberWithLongLong:v5 - 1];
        [v32 setStoredIntegerPropertyWithName:@"MaxRowIdForMigrationToVersion31" value:v26];
LABEL_43:

LABEL_44:
        char v6 = 0;
        goto LABEL_46;
      }
    }
    char v6 = 1;
LABEL_46:
  }
  if (v6)
  {
    uint64_t v27 = MFLogGeneral();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "done with to/cc migration, setting ToCcMigrationCompleted default", buf, 2u);
    }

    [v32 setStoredIntegerPropertyWithName:@"MaxRowIdForMigrationToVersion31" value:0];
    long long v28 = +[NSUserDefaults standardUserDefaults];
    [v28 setBool:1 forKey:@"ToCcMigrationCompleted"];
  }
  id v29 = MFLogGeneral();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    CFAbsoluteTime v30 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime v54 = v30 - Current;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "to/cc migration took %f ms", buf, 0xCu);
  }
}

void sub_1000B09D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

id sub_1000B0B4C(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 56) count]
    || (id result = [*(id *)(*(void *)(a1 + 32) + 48) count]) != 0)
  {
    id result = [*(id *)(a1 + 32) _clearVIPSenderFlagForSenders:*(void *)(*(void *)(a1 + 32) + 56) retryFailedSenders:0];
    if (result)
    {
      id result = [*(id *)(a1 + 32) _setVIPSenderFlagForSenders:*(void *)(*(void *)(a1 + 32) + 48) retryFailedSenders:0];
      if (result)
      {
        [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
        [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
        uint64_t v3 = *(void **)(a1 + 32);
        return [v3 _removePendingVIPChanges];
      }
    }
  }
  return result;
}

void sub_1000B0D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000B0D58(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) unionSet:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 48) minusSet:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_savePendingVIPChanges_nts");
}

void sub_1000B0ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000B0F10(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) minusSet:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 48) unionSet:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_savePendingVIPChanges_nts");
}

void sub_1000B10E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B1120(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)EAEmailAddressSet);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      char v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v6), "emailAddresses", (void)v8);
        [v2 unionSet:v7];

        char v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) _setVIPSenderFlagForSenders:v2 retryFailedSenders:1];
}

void sub_1000B1254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B128C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)EAEmailAddressSet);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      char v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v6), "emailAddresses", (void)v8);
        [v2 unionSet:v7];

        char v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) _clearVIPSenderFlagForSenders:v2 retryFailedSenders:1];
}

void sub_1000B13C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B154C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B1688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B1720(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1000B1820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000B189C(id a1, MFXPCClient *a2)
{
  return [(MFXPCClient *)a2 hasEntitlement:@"com.apple.mobilemail.mailservices"];
}

void sub_1000B199C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B1A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B1B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B1C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B1CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  long long v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFXPCEndpointListener;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000B1DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B1EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B1F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B1F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B21E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak((id *)(v7 - 88));

  _Unwind_Resume(a1);
}

void sub_1000B2270(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [WeakRetained connection];
    uint64_t v5 = [WeakRetained client];
    int v10 = 138412546;
    long long v11 = v4;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#MailServices connection %@ for %@ was invalidated.", (uint8_t *)&v10, 0x16u);
  }
  char v6 = [WeakRetained client];
  uint64_t v7 = [v6 invalidationHandler];

  if (v7) {
    v7[2](v7);
  }
  long long v8 = [WeakRetained client];
  [v8 setInterruptionHandler:0];

  long long v9 = [WeakRetained client];
  [v9 setInvalidationHandler:0];

  [*(id *)(a1 + 32) removeClientInfo:WeakRetained];
}

void sub_1000B23E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B2448(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [WeakRetained connection];
    uint64_t v5 = [WeakRetained client];
    int v10 = 138412546;
    long long v11 = v4;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#MailServices connection %@ for %@ was interrupted.", (uint8_t *)&v10, 0x16u);
  }
  char v6 = [WeakRetained client];
  uint64_t v7 = [v6 interruptionHandler];

  if (v7) {
    v7[2](v7);
  }
  long long v8 = [WeakRetained client];
  [v8 setInterruptionHandler:0];

  long long v9 = [WeakRetained client];
  [v9 setInvalidationHandler:0];

  [*(id *)(a1 + 32) removeClientInfo:WeakRetained];
}

void sub_1000B25BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B2754(id a1)
{
  os_log_t v1 = objc_alloc_init(MFXPCEndpointService);
  id v2 = (void *)qword_10016BDD0;
  qword_10016BDD0 = (uint64_t)v1;
}

void sub_1000B2900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B2C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B2D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  int v10 = v9;

  a9.super_class = (Class)MFXPCEndpointService;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000B2EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B2FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000B3024(id a1, MFXPCEndpointInfo *a2)
{
  id v2 = a2;
  id v3 = [(MFXPCEndpointInfo *)v2 existingListener:0];
  id v4 = [v3 clients];
  uint64_t v5 = [v4 arrayByApplyingSelector:"description"];

  if (v3)
  {
    if ([v5 count])
    {
      char v6 = [v5 componentsJoinedByString:@",\n\t\t"];
      uint64_t v7 = +[NSString stringWithFormat:@"{\n\t\t%@\n\t}", v6];
    }
    else
    {
      uint64_t v7 = &stru_10013ED08;
    }
    long long v8 = [(MFXPCEndpointInfo *)v2 exportedInterface];
    long long v9 = [v8 protocol];
    long long v11 = NSStringFromProtocol(v9);
    int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - <%@: %p> %ld clients %@", v11, objc_opt_class(), v3, [v5 count], v7);
  }
  else
  {
    uint64_t v7 = [(MFXPCEndpointInfo *)v2 exportedInterface];
    long long v8 = [(__CFString *)v7 protocol];
    NSStringFromProtocol((Protocol *)v8);
    long long v9 = (Protocol *)objc_claimAutoreleasedReturnValue();
    int v10 = +[NSString stringWithFormat:@"%@ - no active listener", v9];
  }

  return v10;
}

void sub_1000B31E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B32BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000B32CC(id a1, MFXPCEndpointInfo *a2)
{
  id v2 = [(MFXPCEndpointInfo *)a2 existingListener:0];

  return v2;
}

void sub_1000B3368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B347C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000B348C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc(*(Class *)(a1 + 32)) initWithClient:v3];

  return v4;
}

void sub_1000B34E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B3530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B3594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B3628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B36B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B3714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)NetworkActivityIndicator;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000B3840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B3944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B3AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000B3AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_10016BDF8 != -1) {
    dispatch_once(&qword_10016BDF8, &stru_10013DF68);
  }
  char v6 = (uint64_t (*)())dlsym((void *)qword_10016BDF0, "SBSSetStatusBarShowsActivityForApplication");
  off_10016B488 = v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

void sub_1000B3B88(id a1)
{
  qword_10016BDF0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", 2);
  if (!qword_10016BDF0) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices");
  }
}

void sub_1000B3CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000B3D38(void *a1)
{
  id v1 = a1;
  objc_msgSend(v1, "ef_match");
  id v2 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v3 = EMErrorDomain;
  if ((v2[2](v2, EMErrorDomain, 2048) & 1) != 0
    || (v2[2](v2, v3, 2050) & 1) != 0
    || v2[2](v2, v3, 2049))
  {
    id v4 = [v1 userInfo];
    uint64_t v5 = [v4 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if (!v5 || (sub_1000B3D38(v5), (char v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v7 = +[NSBundle mainBundle];
      char v6 = [v7 localizedStringForKey:@"MESSAGE_UNAVAILABLE" value:&stru_10013ED08 table:@"Main"];
    }
  }
  else if ((v2[2](v2, MFMIMEErrorDomain, 2000000) & 1) != 0 || objc_msgSend(v1, "mf_isSMIMEError"))
  {
    char v6 = [v1 localizedDescription];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

void sub_1000B3EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000B3EFC(uint64_t a1)
{
  if (a1)
  {
    id v1 = +[NSString stringWithFormat:@"%@://conversation/%lld", EMAppleMailURLScheme, a1];
    id v2 = +[NSURL URLWithString:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_1000B3F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000B3F9C(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSURLComponents);
  [v2 setScheme:EMAppleMailURLScheme];
  [v2 setHost:@"document"];
  uint64_t v3 = +[NSString stringWithFormat:@"/%@", v1];
  [v2 setPath:v3];

  id v4 = [v2 URL];

  return v4;
}

void sub_1000B405C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000B41E4(_Unwind_Exception *a1)
{
  char v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1000B42D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B43F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B447C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B4504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B4514(id a1)
{
  id v3 = +[NSBundle mainBundle];
  uint64_t v1 = [v3 bundleIdentifier];
  id v2 = (void *)qword_10016BE00;
  qword_10016BE00 = v1;
}

void sub_1000B4578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B479C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B48E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B49A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B4A5C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BE10;
  qword_10016BE10 = (uint64_t)v1;
}

void sub_1000B4ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B4B80(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_10016BE20;
  qword_10016BE20 = (uint64_t)v1;
}

void sub_1000B4BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B4DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  BOOL v18 = v17;
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1000B4DF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = +[MFDeliveryQueue sharedDeliveryQueue];
    [v2 addObserver:v3];

    id WeakRetained = v3;
  }
}

void sub_1000B4E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B4FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B5150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1000B5174(uint64_t a1)
{
  id v2 = +[OutgoingMessageRepository_iOS signpostLog];
  spid_t pid = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));

  id v3 = +[OutgoingMessageRepository_iOS signpostLog];
  id v4 = v3;
  unint64_t v5 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    char v6 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    long long v36 = v6;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, spid, "EMAIL DELIVERY", "Begin Delivery Message : %p", buf, 0xCu);
  }

  uint64_t v7 = +[MFDeliveryQueue sharedDeliveryQueue];
  long long v8 = [*(id *)(a1 + 32) messageData];
  long long v9 = +[MailAccount outboxMailboxUid];
  int v10 = +[MFMailMessage messageWithRFC822Data:v8 forMailboxUID:v9];

  long long v11 = +[OutgoingMessageRepository_iOS signpostLog];
  __int16 v12 = v11;
  if (v5 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    id v13 = [v10 messageIDHeaderHash];
    *(_DWORD *)buf = 138412290;
    long long v36 = v13;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, spid, "EMAIL DELIVERY", "Set up for messages : %@", buf, 0xCu);
  }
  [v10 setMessageFlags:1];
  id v14 = (id *)MFOutgoingMessageDelivery_ptr;
  if (*(unsigned char *)(a1 + 48)) {
    id v14 = (id *)MFMailDropMailDeliveryUI_ptr;
  }
  id v15 = objc_msgSend(*v14, "newWithMessage:", v10, spid);
  [v15 setDelegate:v7];
  [v15 setIsUserRequested:1];
  objc_msgSend(v15, "setAction:", objc_msgSend(*(id *)(a1 + 32), "action"));
  objc_msgSend(v15, "setShouldSign:", objc_msgSend(*(id *)(a1 + 32), "shouldSign"));
  objc_msgSend(v15, "setShouldEncrypt:", objc_msgSend(*(id *)(a1 + 32), "shouldEncrypt"));
  objc_msgSend(v15, "setConversationFlags:", +[EDConversationPersistence conversationFlagsForConversationNotificationLevel:](EDConversationPersistence, "conversationFlagsForConversationNotificationLevel:", objc_msgSend(*(id *)(a1 + 32), "conversationNotificationLevel")));
  id v16 = [*(id *)(a1 + 32) originalMessageID];
  if (v16)
  {
    id v17 = +[MFMailMessageLibrary defaultInstance];
    BOOL v18 = [v17 persistence];
    BOOL v19 = [v18 messagePersistence];

    uint64_t v20 = [v19 libraryMessageForMessageObjectID:v16];
    [v15 setOriginalMessage:v20];
  }
  __int16 v21 = [v10 headers];
  uint64_t v22 = [v21 firstSenderAddress];

  uint64_t v23 = +[MailAccount accountContainingEmailAddress:v22];
  [v15 setArchiveAccount:v23];
  double v24 = sub_10005E4D8((uint64_t)v7);
  if (*(unsigned char *)(a1 + 49) && v24 > 0.0)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000B5734;
    v31[3] = &unk_10013DFB8;
    os_signpost_id_t v34 = spida;
    id v32 = *(id *)(a1 + 32);
    id v33 = *(id *)(a1 + 40);
    [v7 deliverAsynchronously:v15 completion:v31];

    __int16 v25 = v32;
  }
  else
  {
    __int16 v25 = objc_msgSend(v7, "deliverSynchronously:", v15, v24);
    id v26 = +[OutgoingMessageRepository_iOS signpostLog];
    uint64_t v27 = v26;
    if (v5 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      long long v28 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      long long v36 = v28;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, spida, "EMAIL DELIVERY", "End Delivery of Message : %p", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000B563C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B5734(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[OutgoingMessageRepository_iOS signpostLog];
  unint64_t v5 = v4;
  os_signpost_id_t v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = a1[4];
    int v8 = 134217984;
    uint64_t v9 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "EMAIL DELIVERY", "End Delivery of Message : %p", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

void sub_1000B5828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B58D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000B58F0(uint64_t a1)
{
  id v2 = +[MFDeliveryQueue sharedDeliveryQueue];
  [v2 cancelLastDelayedMessage];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void sub_1000B5958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B59D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B5A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B5B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000B5B2C(uint64_t a1)
{
  id v2 = +[MFDeliveryQueue sharedDeliveryQueue];
  id v3 = [v2 numberOfPendingMessages];

  id v4 = +[OutgoingMessageRepository_iOS log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Outbox has %lu pending messages.", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000B5C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B5CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000B5D0C(uint64_t a1)
{
  id v2 = +[MailAccount outboxMessageStore:1];
  id v3 = [*(id *)(a1 + 32) representedObjectID];
  id v4 = +[MailAccount accountWithUniqueId:v3];
  if (v2) {
    unsigned int v5 = [v2 hasMessageForAccount:v4];
  }
  else {
    unsigned int v5 = 0;
  }
  int v6 = +[OutgoingMessageRepository_iOS log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_msgSend(v4, "ef_publicDescription");
    int v8 = (void *)v7;
    CFStringRef v9 = @"does not have";
    if (v5) {
      CFStringRef v9 = @"has";
    }
    int v10 = 138412546;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    CFStringRef v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Account:%@ %@ messages in Outbox", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000B5E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B5F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B5FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B6090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B625C(_Unwind_Exception *a1)
{
  uint64_t v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1000B63F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1000B6430(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    unsigned int v5 = WeakRetained;
    [WeakRetained[3] setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
    id v3 = *(void **)(a1 + 40);
    id v4 = +[NSNumber numberWithUnsignedInteger:v5[4]];
    [v3 numberOfPendingMessagesChanged:v4];

    id WeakRetained = v5;
  }
}

void sub_1000B64C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B65D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_1000B6604(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained[3] setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

void sub_1000B666C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B6750(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);

  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_1000B6778(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[4] = *(void *)(a1 + 40);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = objc_msgSend(WeakRetained, "observers", 0);
    unsigned int v5 = [v4 allValues];

    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      do
      {
        int v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          CFStringRef v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
          int v10 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
          [v9 numberOfPendingMessagesChanged:v10];

          int v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

void sub_1000B68D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B69EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);

  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_1000B6A14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHasDelayedMessages:*(unsigned __int8 *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = objc_msgSend(WeakRetained, "observers", 0);
  id v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) hasDelayedMessagesDidChange:*(unsigned __int8 *)(a1 + 40)];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void sub_1000B6B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B6E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1000B70CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B728C(_Unwind_Exception *a1)
{
  uint64_t v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1000B74A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B7640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_1000B7748(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6, char a7)
{
  id v20 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)RemoteSearchOperation;
    BOOL v18 = (id *)objc_msgSendSuper2(&v21, "init");
    a1 = v18;
    if (v18)
    {
      objc_storeStrong(v18 + 5, a2);
      objc_storeStrong(a1 + 6, a3);
      objc_storeStrong(a1 + 7, a4);
      objc_storeStrong(a1 + 8, a5);
      objc_storeWeak(a1 + 9, v17);
      *((unsigned char *)a1 + 9) = a7;
    }
  }

  return a1;
}

void sub_1000B7884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1000B78F0(unsigned __int8 *result, unsigned __int8 a2)
{
  if (result)
  {
    uint64_t v3 = result;
    [result willChangeValueForKey:@"isExecuting"];
    [v3 willChangeValueForKey:@"isFinished"];
    atomic_store(a2, v3 + 8);
    [v3 didChangeValueForKey:@"isFinished"];
    return (unsigned __int8 *)[v3 didChangeValueForKey:@"isExecuting"];
  }
  return result;
}

void sub_1000B7AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000B7AE0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

void sub_1000B7EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  _Unwind_Resume(a1);
}

void sub_1000B7F98(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

void sub_1000B7FB0(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained didGetResult:v4 searchContext:*(void *)(a1 + 32)];
}

void sub_1000B801C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B8034(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained didFailToGetResultWithError:v4 searchContext:*(void *)(a1 + 32)];
}

void sub_1000B80A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B8238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B830C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B8430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B8598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

id *sub_1000B85E0(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 9);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

void sub_1000B8618(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 store];
  long long v8 = [v7 searchResultsWithRemoteIDs:v6 requiresBody:*(unsigned __int8 *)(a1 + 48) inMailbox:v5];

  id v9 = [v8 count];
  if (v9 != [v6 count])
  {
    long long v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = *(void **)(a1 + 32);
      if (v11) {
        long long v11 = (void *)v11[7];
      }
      long long v12 = v11;
      long long v13 = *(void **)(a1 + 32);
      if (v13) {
        long long v13 = (void *)v13[5];
      }
      id v14 = v13;
      id v15 = objc_msgSend(v14, "ef_publicDescription");
      id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
      id v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
      int v21 = 138544130;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      double v24 = v15;
      __int16 v25 = 2112;
      id v26 = v16;
      __int16 v27 = 2112;
      long long v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#search-manager [%{public}@] mailbox %{public}@: Returning %@ messages from %@ remote IDs", (uint8_t *)&v21, 0x2Au);
    }
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18)
  {
    id v19 = *(id *)(v18 + 80);
    id v20 = v19;
    if (v19) {
      (*((void (**)(id, void *))v19 + 2))(v19, v8);
    }
  }
  else
  {
    id v20 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v8 count];
}

void sub_1000B885C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B8BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B8C54(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 80);
  }
}

void sub_1000B8C6C(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 88);
  }
}

void sub_1000B8DDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B8E38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  long long v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SearchManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000B8F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B9060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B93F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1000B9494(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void sub_1000B94DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B9578(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1000B958C(_Unwind_Exception *a1)
{
}

void sub_1000B95A0(id a1, NSString *a2, RemoteSearchCoordinator *a3, BOOL *a4)
{
}

void sub_1000B9738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000B9A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a2)
  {

    objc_begin_catch(exception_object);
    os_unfair_lock_unlock(v12);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1000B9B18(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

void sub_1000B9B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000B9D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BA13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BA1F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(a1 + 32) _performRemoteSearchesWithMailboxes:a3 accountID:a2];
  objc_msgSend(*(id *)(a1 + 40), "addChild:withPendingUnitCount:");
}

void sub_1000BA250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000BA4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1000BA56C()
{
}

void sub_1000BA574(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained remoteSearchDidFindMessages:v3];
}

void sub_1000BA5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_1000BA5E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) nextObject];
}

void sub_1000BA9C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v31 - 112));

  _Unwind_Resume(a1);
}

void sub_1000BAAE4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained remoteSearchDidFindMessages:v3];
}

void sub_1000BAB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_1000BAB58(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v2 = *(id *)(a1 + 32);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

id sub_1000BABB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nextObject];
  if (v2)
  {
    *(void *)&long long v3 = 138412802;
    long long v10 = v3;
    do
    {
      id v4 = objc_msgSend(v2, "store", v10);
      unsigned __int8 v5 = [v4 canFetchSearchResults];

      if (v5) {
        break;
      }
      --*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 40), "setTotalUnitCount:");
      id v6 = MFLogGeneral();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        uint64_t v8 = *(void *)(a1 + 56);
        *(_DWORD *)buf = v10;
        uint64_t v12 = v7;
        __int16 v13 = 2114;
        uint64_t v14 = v8;
        __int16 v15 = 2112;
        id v16 = v2;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#search-manager [%@-%{public}@] skipping unsearchable source %@", buf, 0x20u);
      }

      id v2 = [*(id *)(a1 + 32) nextObject];
    }
    while (v2);
  }

  return v2;
}

void sub_1000BAD18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BAE90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000BAF08(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) progress];
  [v2 setUserInfoObject:&__kCFBooleanTrue forKey:@"SearchManagerDidStopSearchingEarlyKey"];

  long long v3 = *(void **)(a1 + 32);

  return [v3 cancel];
}

void sub_1000BAF68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BB264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000BB620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1000BB8EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BBA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000BBAB8(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) _passesSkeletonVerification:a2];
  if ((result & 1) == 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return result;
}

void sub_1000BBBA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BBC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000BBCB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 criterionType] == (id)33) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = (uint64_t)[v3 doesMessageSatisfyCriterion:*(void *)(a1 + 32)];
  }

  return v4;
}

void sub_1000BBD0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BBD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000BBD98(id a1, MFMessageCriterion *a2)
{
  id v2 = a2;
  unint64_t v3 = (unint64_t)[(MFMessageCriterion *)v2 criterionType];
  if (v3 > 0x29) {
    goto LABEL_7;
  }
  if (((1 << v3) & 0x30A08800E00) == 0)
  {
    if (v3 == 1)
    {
      id v6 = [(MFMessageCriterion *)v2 criterionIdentifier];
      unsigned __int8 v4 = [ECMessageHeaderKeySubject isEqualToString:v6];

      goto LABEL_4;
    }
LABEL_7:
    unsigned __int8 v4 = 0;
    goto LABEL_4;
  }
  unsigned __int8 v4 = 1;
LABEL_4:

  return v4;
}

void sub_1000BBE38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BC08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000BC114(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned __int8 v5 = +[NSUserDefaults em_userDefaults];
  id v6 = [v5 valueForKey:v3];

  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

void sub_1000BC19C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000BC1BC(int a1)
{
  int v1 = dword_10016B610;
  if (dword_10016B610 < 0 || a1)
  {
    id v2 = sub_1000BC114(EMUserDefaultMutedThreadActionKey, EMUserDefaultMutedThreadActionMarkAsRead);
    dword_10016B610 = [EMUserDefaultMutedThreadActionMoveToArchiveOrDelete isEqual:v2];

    int v1 = dword_10016B610;
  }
  return v1 != 0;
}

void sub_1000BC234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BC344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BC488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BC59C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BC634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BC690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BC834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BC9F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SuggestionsDataProvider;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000BCCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_1000BCD28(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeFullDownloadProcessing];
}

void sub_1000BCF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

id sub_1000BCFA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 messageId];
  uint64_t v5 = MFStringHashForMessageIDHeader();

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = +[NSNumber numberWithLongLong:v5];
    [v6 setObject:v3 forKeyedSubscript:v7];

    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = [v3 source];
    [v8 addObject:v9];

    id v10 = objc_alloc((Class)MFMessageCriterion);
    long long v11 = [v3 messageId];
    id v12 = [v10 initWithType:1 qualifier:3 expression:v11];

    [v12 setCriterionIdentifier:ECMessageHeaderKeyMessageID];
  }
  else
  {
    __int16 v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v3 messageId];
      int v16 = 138412290;
      id v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Warning could not create hash from message ID %@", (uint8_t *)&v16, 0xCu);
    }
    id v12 = 0;
  }

  return v12;
}

void sub_1000BD164(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1000BD1B4(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (([v9 messageFlags] & 2) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v9 account];
    uint64_t v5 = [v4 uniqueID];
    LOBYTE(v3) = [v3 containsObject:v5];

    if (v3)
    {
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v9 messageIDHash]);
      uint64_t v8 = [v6 objectForKeyedSubscript:v7];

      if (v8) {
        [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:v8];
      }
    }
  }
}

void sub_1000BD29C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000BD39C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processBackgroundDownload];
}

void sub_1000BD3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000BD6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1000BD88C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000BD8AC(id a1, OS_xpc_object *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
}

void sub_1000BD940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000BD954(uint64_t a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1000BDA2C;
  v6[3] = &unk_10013B1F8;
  id v7 = a2;
  id v3 = v7;
  id v4 = objc_retainBlock(v6);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshLostMessagesUntilDeferred:v4];
}

void sub_1000BDA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

BOOL sub_1000BDA2C(uint64_t a1)
{
  return xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
}

void sub_1000BDAB4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 64))
  {
    dispatch_suspend(*(dispatch_object_t *)(v1 + 16));
    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
  }
}

void sub_1000BDB68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 64))
  {
    dispatch_resume(*(dispatch_object_t *)(v1 + 16));
    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  }
}

void sub_1000BDC44(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) unconfirmedLostMessages];
  if ([v2 count])
  {
    id v3 = v2;
  }
  else
  {
    id v4 = +[EFPromise promise];
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 32);
    id v6 = [v4 completionHandlerAdapter];
    [v5 messagesToRefreshWithCompletion:v6];

    id v7 = [v4 future];
    id v3 = [v7 resultWithTimeout:0 error:5.0];

    [*(id *)(a1 + 32) setLastUnconfirmedLostMessagesSearchTime:0.0];
    id v8 = [v3 count];

    if (!v8) {
      goto LABEL_8;
    }
  }
  id v9 = objc_msgSend(v3, "ef_groupBy:", &stru_10013E380);
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v13 = v12;
  uint64_t v14 = +[MFNetworkController sharedInstance];
  unsigned int v15 = [v14 isFatPipe];

  if (v15) {
    uint64_t v16 = -1;
  }
  else {
    uint64_t v16 = 20;
  }
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  uint64_t v22 = sub_1000BDF64;
  __int16 v23 = &unk_10013E3A8;
  id v17 = *(void **)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 32);
  id v27 = v17;
  uint64_t v28 = v16;
  id v18 = v10;
  id v25 = v18;
  id v19 = v11;
  id v26 = v19;
  uint64_t v29 = v13;
  [v9 enumerateKeysAndObjectsUsingBlock:&v20];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "reportMessagesFound:lost:withCompletion:", v18, v19, &stru_10013E3C8, v20, v21, v22, v23, v24);

LABEL_8:
}

void sub_1000BDE98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSCopying *__cdecl sub_1000BDF34(id a1, SGMailMessageKey *a2)
{
  id v2 = [(SGMailMessageKey *)a2 source];

  return (NSCopying *)v2;
}

void sub_1000BDF64(uint64_t a1, void *a2, void *a3)
{
  id v36 = a2;
  id v37 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v37, "count"));
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v5 = v37;
  id v6 = [v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v57;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v57 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        id v10 = [v9 messageId];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 setObject:v9 forKeyedSubscript:v10];
        }
        else
        {
          id v11 = MFLogGeneral();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            uint64_t v12 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            uint64_t v63 = v12;
            _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "See <rdar://problem/26633447> : MessageID should be a string, but is %{public}@", buf, 0xCu);
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v6);
  }

  id v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v35 = +[MailAccount accountWithUniqueId:v36];
  [*(id *)(a1 + 32) lastUnconfirmedLostMessagesSearchTime];
  objc_msgSend(v35, "mailboxesForSuggestionsLostMessageSearchPriorToTime:");
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
  if (v14)
  {
    char v39 = 0;
    uint64_t v43 = *(void *)v53;
    unint64_t v44 = 0;
LABEL_15:
    uint64_t v15 = 0;
    id v40 = v14;
    while (1)
    {
      if (*(void *)v53 != v43) {
        objc_enumerationMutation(obj);
      }
      if ((long long v45 = *(void **)(*((void *)&v52 + 1) + 8 * v15),
            (uint64_t v16 = *(void *)(a1 + 56)) != 0)
        && ((*(uint64_t (**)(void))(v16 + 16))() & 1) != 0
        || v44 >= *(void *)(a1 + 64))
      {
        int v28 = 4;
        char v39 = 1;
      }
      else
      {
        long long v41 = [v45 store];
        id v17 = [v4 allKeys];
        long long v42 = +[NSSet setWithArray:v17];

        id v18 = [v41 messageIdRollCall:v42];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v19 = v18;
        id v20 = [v19 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v49;
          do
          {
            for (j = 0; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v49 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = *(void *)(*((void *)&v48 + 1) + 8 * (void)j);
              uint64_t v24 = [v4 objectForKeyedSubscript:v23];
              [v13 setObject:v24 forKeyedSubscript:v23];

              [v4 removeObjectForKey:v23];
            }
            id v20 = [v19 countByEnumeratingWithState:&v48 objects:v60 count:16];
          }
          while (v20);
        }

        objc_msgSend(v45, "updateSuggestionsLostMessageSearchResultCount:", objc_msgSend(v19, "count"));
        id v25 = [v4 count];
        BOOL v26 = v25 == 0;
        unint64_t v27 = v44;
        if (v25) {
          unint64_t v27 = v44 + 1;
        }
        unint64_t v44 = v27;

        int v28 = 4 * v26;
      }
      if (v28) {
        break;
      }
      if ((id)++v15 == v40)
      {
        id v14 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v14) {
          goto LABEL_15;
        }
        break;
      }
    }
  }
  else
  {
    char v39 = 0;
  }

  uint64_t v29 = *(void **)(a1 + 40);
  CFAbsoluteTime v30 = [v13 allValues];
  [v29 addObjectsFromArray:v30];

  if (v39)
  {
    uint64_t v31 = [v4 allValues];
    [*(id *)(a1 + 32) setUnconfirmedLostMessages:v31];

    [*(id *)(a1 + 32) lastUnconfirmedLostMessagesSearchTime];
    if (v32 == 0.0) {
      [*(id *)(a1 + 32) setLastUnconfirmedLostMessagesSearchTime:*(double *)(a1 + 72)];
    }
  }
  else
  {
    id v33 = *(void **)(a1 + 48);
    os_signpost_id_t v34 = [v4 allValues];
    [v33 addObjectsFromArray:v34];

    [*(id *)(a1 + 32) setLastUnconfirmedLostMessagesSearchTime:0.0];
    [*(id *)(a1 + 32) setUnconfirmedLostMessages:0];
  }
}

void sub_1000BE4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000BE734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000BE7FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BE904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BE960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BE9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BEA18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BEA94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BEB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BEB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000BEC04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000BEC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000BED04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000BEE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_1000BEED4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) lock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(__CFDictionary **)(*(void *)(a1 + 32) + 16);
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "identifier", (void)v9);
        CFDictionaryRemoveValue(v6, v7);
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) unlock];
}

void sub_1000BF014(_Unwind_Exception *a1)
{
}

void sub_1000BF074(uint64_t a1)
{
  id v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) userInfo];
  [v4 postNotificationName:EMVIPsDidChangeNotification object:v2 userInfo:v3];
}

void sub_1000BF0F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000BF1F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BF304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BF39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_1000BF3C8(id a1, EMVIP *a2, EMVIP *a3)
{
  id v4 = a3;
  id v5 = [(EMVIP *)a2 name];
  id v6 = [(EMVIP *)v4 name];
  id v7 = [v5 localizedCaseInsensitiveCompare:v6];

  return (int64_t)v7;
}

void sub_1000BF438(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000BF6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000BF8A8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1000BF874);
}

void sub_1000BFB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000BFD80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BFE30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000BFE98(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Got error %@ updating badge to %ld", (uint8_t *)&v4, 0x16u);
}

void sub_1000BFF24()
{
  sub_10000D4E4();
  uint64_t v2 = (void *)v1;
  sub_10000D4B0(v1, v3, v4, 5.8382e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "[Autofetch Error] account=%{public}@ error=%{public}@", v5, v6);
}

void sub_1000BFF70()
{
  sub_10000D4E4();
  sub_10000D4B0(v1, v2, v3, 3.8521e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "%p Error occurred during autofetch: %{public}@", v4, v5);
}

void sub_1000BFFB4()
{
  sub_10000D4E4();
  sub_10000D4B0(v1, v2, v3, 3.8521e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "Activity %p did finish with error: %{public}@", v4, v5);
}

void sub_1000BFFF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C0030(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C0068(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C00A0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Network Error occurred during autofetch but was suppressed intentionally.\n%{public}@", buf, 0xCu);
}

void sub_1000C00F8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Mail app was uninstalled but maild is still running, looks like MobileMailAppRemovalService didn't run. Calling it now.", v1, 2u);
}

void sub_1000C013C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C01A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C0214(char a1, char a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "WARNING: Snapshot invalidation is disabled. This should only be used for testing purposes. isClientRunningTests=%{BOOL}d forceDisable=%{BOOL}d", (uint8_t *)v3, 0xEu);
}

void sub_1000C02A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C0310()
{
}

void sub_1000C033C(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "overriding periodic fetch interval: %ld seconds", (uint8_t *)&v2, 0xCu);
}

void sub_1000C03B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Auto fetch finished.", v1, 2u);
}

void sub_1000C03F8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "resetPushState failed: %{public}@", buf, 0xCu);
}

void sub_1000C0450(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Will retry.", v1, 2u);
}

void sub_1000C0494(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = 67109378;
  v4[1] = v2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Re-trying performFetchOfType:%i uids for %@", (uint8_t *)v4, 0x12u);
}

void sub_1000C0520()
{
}

void sub_1000C054C()
{
  *(_WORD *)id v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Attempting to set item expanded on an item the does not support expansion. Overriding to NO.", v0, 2u);
}

void sub_1000C0594(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#Favorites Failed to create FavoriteItem_Account dictionary representation for %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C060C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#Favorites Failed to create FavoriteItem_Inbox dictionary representation for %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C0684(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "invalidateVisibleItems %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C06FC(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not read %@: %s", buf, 0x16u);
}

void sub_1000C0754(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Attempting to write to collection data from maild. Returning early.", v1, 2u);
}

void sub_1000C0798(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#Favorites Could not find collection for item:%@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C0810(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "cannot create item for KV entry (possibly the account does not exist): %@ = %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000C0898(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "kvstorage reported quota exceeded", v1, 2u);
}

void sub_1000C08DC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Favorites Failed to get outbox predicate: %{public}@", buf, 0xCu);
}

void sub_1000C0934(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Tried to schedule fetch for type %d more than once.", buf, 8u);
}

void sub_1000C097C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C09B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C09EC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "There are %u running fetch XPC activities.", (uint8_t *)v2, 8u);
}

void sub_1000C0A64(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to mark XPC activity %p as continuing (async).", (uint8_t *)&v2, 0xCu);
}

void sub_1000C0ADC(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Found %u fetch XPC activities.", buf, 8u);
}

void sub_1000C0B24()
{
}

void sub_1000C0B50()
{
}

void sub_1000C0B7C()
{
}

void sub_1000C0BA8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Stack trace: %{public}@", buf, 0xCu);
}

void sub_1000C0C00(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Caught exception %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C0C78()
{
}

void sub_1000C0CA4()
{
}

void sub_1000C0CD0()
{
}

void sub_1000C0CFC()
{
}

void sub_1000C0D28()
{
}

void sub_1000C0D54(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error serializing metadata: %{public}@", buf, 0xCu);
}

void sub_1000C0DAC(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error writing metadata at: %@ with error: %{public}@", buf, 0x16u);
}

void sub_1000C0E1C(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "maild exiting due to xpc error [%s] ", buf, 0xCu);
}

void sub_1000C0E64()
{
  sub_10000D4E4();
  sub_10000D4B0(v1, v2, v3, 5.778e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "connection %@ had error %{public}@", v4, v5);
}

void sub_1000C0EA8()
{
  sub_10000D4E4();
  sub_10000D4B0(v1, v2, v3, 5.778e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "connection %@ was sent bad message %{public}@", v4, v5);
}

void sub_1000C0EEC()
{
  sub_10000D4E4();
  *(_DWORD *)uint64_t v1 = 138412546;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2112;
  *(void *)(v1 + 14) = v3;
  sub_10000D4C8((void *)&_mh_execute_header, "SecTaskCopyValueForEntitlement() failed: %@ (%@)", v4, v5);
}

void sub_1000C0F40(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error getting loading context event: %{public}@", buf, 0xCu);
}

void sub_1000C0F98(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Summary parsing failed: %{public}@", buf, 0xCu);
}

void sub_1000C0FF8()
{
  sub_100049008();
  sub_10000DAEC((void *)&_mh_execute_header, v0, v1, "should be running at this point", v2, v3, v4, v5, v6);
}

void sub_1000C102C()
{
  sub_100049008();
  sub_10000DAEC((void *)&_mh_execute_header, v0, v1, "_finishedCullingMessageList was called but _isWaitingForTask was NO", v2, v3, v4, v5, v6);
}

void sub_1000C1060()
{
  sub_100049008();
  sub_10000DAEC((void *)&_mh_execute_header, v0, v1, "_clientLoadFinished was called but _isWaitingForTask was NO", v2, v3, v4, v5, v6);
}

void sub_1000C1094()
{
  sub_100049008();
  sub_10000DAEC((void *)&_mh_execute_header, v0, v1, "_messageLoadFinished was called but _isWaitingForTask was NO", v2, v3, v4, v5, v6);
}

void sub_1000C10C8()
{
  sub_100049008();
  sub_10000DAEC((void *)&_mh_execute_header, v0, v1, "_getNextClientOrMessageFinished was called but _isWaitingForTask was NO", v2, v3, v4, v5, v6);
}

void sub_1000C10FC()
{
}

void sub_1000C1128()
{
  sub_100049008();
  sub_10000DAEC((void *)&_mh_execute_header, v0, v1, "_noNetworkFetching went negative", v2, v3, v4, v5, v6);
}

void sub_1000C115C()
{
  sub_100049008();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "power assertion timeout", v1, 2u);
}

void sub_1000C119C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create count predicate for favorite item: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C1214(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Checking for existing autosaves failed because no identifier was provided.", v1, 2u);
}

void sub_1000C1258(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_1000591C4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Checking for existing autosaves failed with error [%{public}@]", (uint8_t *)a2);
}

void sub_1000C12A8(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Removal of autosave failed with error. autosaveID=%@ error=%{public}@", buf, 0x16u);
}

void sub_1000C1310(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_1000591C4((void *)&_mh_execute_header, a2, a3, "autosavedMessageDataWithIdentifier returned no data and no error: %{public}@", (uint8_t *)&v4);
}

void sub_1000C1384(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_1000591C4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Autosave could not be performed because message does not have a document identifier header. error=%{public}@", (uint8_t *)a2);
}

void sub_1000C13D4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_1000591C4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Autosave could not be performed because the message data is invalid. error=%{public}@", (uint8_t *)a2);
}

void sub_1000C1424(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_1000591C4((void *)&_mh_execute_header, a2, a3, "Autosave failed! The saved message was not returned from the change manager. %@", (uint8_t *)&v4);
}

void sub_1000C1498(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_1000591C4((void *)&_mh_execute_header, a2, a3, "Ignoring provided old identifier. Failed to create criterion. %@", (uint8_t *)&v4);
}

void sub_1000C150C(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Message '%@' has no summary. Not modifying notification.", buf, 0xCu);
}

void sub_1000C1568(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "message delivery failed with error: %{public}@", buf, 0xCu);
}

void sub_1000C15C4(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#Attachments Unable to handle operation code [%lu]", (uint8_t *)&v2, 0xCu);
}

void sub_1000C163C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C1674(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C16AC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#Attachments ** Unable to vet security scope URL: %@. Must be a URL inside the placeholder directory.", (uint8_t *)&v2, 0xCu);
}

void sub_1000C1724(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C175C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to retrieve free space with error: %{public}@", buf, 0xCu);
}

void sub_1000C17B4()
{
  sub_100068A08();
  sub_1000689FC(v1, v2, 5.8381e-34);
  sub_1000689E0((void *)&_mh_execute_header, v3, v4, "Cannot open application (%{public}@)", v5);
}

void sub_1000C17F8()
{
  sub_100068A08();
  sub_1000689FC(v1, v2, 5.8381e-34);
  sub_1000689E0((void *)&_mh_execute_header, v3, v4, "Failed to archive context. %{public}@", v5);
}

void sub_1000C183C()
{
  sub_100068A08();
  sub_1000689FC(v1, v2, 5.8381e-34);
  sub_1000689E0((void *)&_mh_execute_header, v3, v4, "Failed to create user activity data. %{public}@", v5);
}

void sub_1000C1880()
{
  sub_100068A08();
  sub_1000689FC(v1, v2, 5.8381e-34);
  sub_1000689E0((void *)&_mh_execute_header, v3, v4, "Failed to open compose scene. %{public}@", v5);
}

void sub_1000C18C4(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = 5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to transition from state %ld to state %ld.", buf, 0x16u);
}

void sub_1000C191C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Compression should not have run it was already completed", v1, 2u);
}

void sub_1000C1960()
{
  sub_100070BD4();
  sub_10000D4B0(v2, v3, v4, 5.778e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "Error trying to get compresssed xattr to \"%@\": %{public}@", v5, v6);
}

void sub_1000C19A8()
{
  sub_100070BD4();
  sub_10000D4B0(v2, v3, v4, 5.778e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "Error trying to add compressed xattr to \"%@\": %{public}@", v5, v6);
}

void sub_1000C19F0(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#MessageBodyProcessor Failed to wait for message (%@) download with error %{public}@", buf, 0x16u);
}

void sub_1000C1A58(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#PurgeableStorage Failed to compute size for %@ with error %{public}@", buf, 0x16u);
}

void sub_1000C1AC0(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to transition from state %ld to state %ld.", buf, 0x16u);
}

void sub_1000C1B18()
{
  sub_100070BD4();
  sub_10000D4B0(v2, v3, v4, 5.778e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "Error trying to get purgeable xattr to {%@}: %{public}@", v5, v6);
}

void sub_1000C1B60()
{
  sub_100070BD4();
  sub_10000D4B0(v2, v3, v4, 5.778e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "Error trying to add purgeable xattr to {%@}: %{public}@", v5, v6);
}

void sub_1000C1BA8()
{
  sub_100070BD4();
  sub_10000D4B0(v2, v3, v4, 5.778e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "Error trying to remove purgeable xattr to {%@}: %{public}@", v5, v6);
}

void sub_1000C1BF0(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  sub_10000D4C8((void *)&_mh_execute_header, "Error %{public}@ No filesystem representation for URL %@", (uint8_t *)a3, a4);
}

void sub_1000C1C4C(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543618;
  *(void *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = a3;
  sub_10000D4C8((void *)&_mh_execute_header, "Error %{public}@ attempting to close fts for URL %@", (uint8_t *)a2, a4);
}

void sub_1000C1CA8(unsigned char *a1, unsigned char *a2)
{
  sub_100078C80(a1, a2);
  sub_100078C90((void *)&_mh_execute_header, v2, v3, "Invalid Actions. Invalid message flags. Flag color previously set.", v4);
}

void sub_1000C1CD4(unsigned char *a1, unsigned char *a2)
{
  sub_100078C80(a1, a2);
  sub_100078C90((void *)&_mh_execute_header, v2, v3, "Invalid Actions. Invalid message flags. Flag color previously cleared.", v4);
}

void sub_1000C1D00(unsigned char *a1, unsigned char *a2)
{
  sub_100078C80(a1, a2);
  sub_100078C90((void *)&_mh_execute_header, v2, v3, "Invalid Actions. Invalid message flags. Previously marked as unread.", v4);
}

void sub_1000C1D2C(unsigned char *a1, unsigned char *a2)
{
  sub_100078C80(a1, a2);
  sub_100078C90((void *)&_mh_execute_header, v2, v3, "Invalid Actions. Invalid message flags. Previously marked as read.", v4);
}

void sub_1000C1D58(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid Actions. Already moving message to destination: %{public}@.", buf, 0xCu);
}

void sub_1000C1DB4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Nano Received authentication failure notification with no account.", v1, 2u);
}

void sub_1000C1DF8(uint64_t a1, char a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2 & 1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Nano Attempt to recover mailboxUid for MFNanoBridgeSettingsAccountSpecificMailbox failed. (Id: %{public}@, Active: %lu)", buf, 0x16u);
}

void sub_1000C1E54(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#Nano Attempt to recover mailboxUid for MFNanoBridgeSettingsAccountSpecificMailbox failed. Account did not return valid mailboxUid for mailboxURL: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000C1ED0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#Nano Unable to decode signature: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C1F48(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#Nano Posting NotificationCenter Notification Bridge Setting has Changed for key: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C1FC0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Nano No account sent for job or push complete notification.", v1, 2u);
}

void sub_1000C2004(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#Nano No mailbox returned. Ignoring fetch.", v1, 2u);
}

void sub_1000C2048(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#Nano [%{public}@] Did finish loading.", buf, 0xCu);
}

void sub_1000C20A0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Nano [%{public}@] Did fail loading.", buf, 0xCu);
}

void sub_1000C20F8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "MFNanoServerFullMessageLoader: Protected data not available. Message headers will be downloaded from server", v1, 2u);
}

void sub_1000C213C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "MFNanoServerFullMessageLoader: Protected data available. Message headers will be fetched from database", v1, 2u);
}

void sub_1000C2180(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Nano MFNanoServerFullMessageLoader: library missing %lu messages - messageIds: %{public}@", buf, 0x16u);
}

void sub_1000C21D8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 80);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#Nano Message from MFNanoServerMessageContentLoader is not a LibraryMessage: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_1000C2254(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Nano Error retrieving Html Content for Message. %{public}@", buf, 0xCu);
}

void sub_1000C22AC()
{
  sub_100070BD4();
  *(_DWORD *)uint64_t v2 = 138543618;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2114;
  *(void *)(v2 + 14) = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Nano Error retrieving Html Content for Message. %{public}@, %{public}@", v5, 0x16u);
}

void sub_1000C2310()
{
  sub_100070BD4();
  *(_DWORD *)uint64_t v2 = 138412546;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2112;
  *(void *)(v2 + 14) = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "#Nano NanoContent has nil messageId (hasLoadedCompleteBody). Please file bug against 'Mail | watchOS' component! MessageID: %@, ExternalID: %@", v5, 0x16u);
}

void sub_1000C2374(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Nano Unable to send composed message because requested account is not present on the companion. Account Id: %{public}@, ComposedMessageId: %{public}@", buf, 0x16u);
}

void sub_1000C23E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#aps-push account %@: failed to register mailboxes for external push notifications", (uint8_t *)&v2, 0xCu);
}

void sub_1000C245C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Add sound for Remind Me.", v1, 2u);
}

void sub_1000C24A0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set NotificationCenter topics: %@ with error : %@", (uint8_t *)&v4, 0x16u);
}

void sub_1000C252C()
{
  sub_10000D4E4();
  *(_DWORD *)uint64_t v1 = 138543618;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2114;
  *(void *)(v1 + 14) = v3;
  sub_10000D4C8((void *)&_mh_execute_header, "Failed to replace notification due to VIP change: ID: %{public}@, error: %{public}@", v4, v5);
}

void sub_1000C2580(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C25EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C2658(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000C26C4()
{
  sub_10000D4E4();
  sub_1000A7834(v1, v2, v3, 5.778e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "Failed to find persisted message, skipping updates for RemindMe notification %@, message %@", v4, v5);
}

void sub_1000C2708()
{
  sub_10000D4E4();
  sub_1000A7834(v1, v2, v3, 5.778e-34);
  sub_10000D4C8((void *)&_mh_execute_header, "Could not update summary for RemindMe notification %@, message %@", v4, v5);
}

void sub_1000C274C(void *a1, int a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "notifyContentsAvailable message=%{public}@ -- summary: %u", buf, 0x12u);
}

void sub_1000C27B4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "we've given up requesting the summary for message=%{public}@. we are posting an empty summary string.", buf, 0xCu);
}

void sub_1000C280C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to load body for message: %@", buf, 0xCu);
}

void sub_1000C2864(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *(void *)(*(void *)(a2 + 40) + 16);
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "re-attempting body load for message=%{public}@. attempt number %tu", buf, 0x16u);
}

void sub_1000C28D4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "UPGRADE: Failed to add notification request: %@ with error %@", (uint8_t *)&v4, 0x16u);
}

void sub_1000C2960(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Will not play sound for upcoming notification. Timed out resolving sound for notification %@ autoFetchData=%@", (uint8_t *)&v2, 0x16u);
}

void sub_1000C29E4()
{
  sub_1000ADF5C();
  sub_1000ADF40((void *)&_mh_execute_header, v0, v1, "Received notification %@", v2, v3, v4, v5, v6);
}

void sub_1000C2A5C()
{
  sub_1000ADF5C();
  sub_1000ADF40((void *)&_mh_execute_header, v0, v1, "Received notification %@", v2, v3, v4, v5, v6);
}

void sub_1000C2AD4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to find a valid currentAccountIDOfSoundToPlay - autoFetchData=%@", (uint8_t *)&v2, 0xCu);
}

void sub_1000C2B4C()
{
  sub_1000ADF5C();
  sub_1000ADF40((void *)&_mh_execute_header, v0, v1, "Received notification %@", v2, v3, v4, v5, v6);
}

void sub_1000C2BC4()
{
  sub_1000ADF5C();
  sub_1000ADF40((void *)&_mh_execute_header, v0, v1, "Received notification %@", v2, v3, v4, v5, v6);
}

void sub_1000C2C3C()
{
  sub_1000ADF5C();
  sub_1000ADF40((void *)&_mh_execute_header, v0, v1, "Received notification %@", v2, v3, v4, v5, v6);
}

void sub_1000C2CB4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Sound Controller: Unbalanced calls to _autoFetchPushStarted/Finished", v1, 2u);
}

void sub_1000C2CF8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to find a message for error: %{public}@", buf, 0xCu);
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return _ABAddressBookCreateWithOptions(options, error);
}

uint64_t ABAddressBookFindPersonMatchingEmailAddress()
{
  return _ABAddressBookFindPersonMatchingEmailAddress();
}

uint64_t ABAddressBookRegisterChangeCallback()
{
  return _ABAddressBookRegisterChangeCallback();
}

void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
}

void ABAddressBookRevert(ABAddressBookRef addressBook)
{
}

uint64_t ABAddressBookUnregisterChangeCallback()
{
  return _ABAddressBookUnregisterChangeCallback();
}

void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
}

CFArrayRef ABMultiValueCopyArrayOfAllValues(ABMultiValueRef multiValue)
{
  return _ABMultiValueCopyArrayOfAllValues(multiValue);
}

CFArrayRef ABPersonCopyArrayOfAllLinkedPeople(ABRecordRef person)
{
  return _ABPersonCopyArrayOfAllLinkedPeople(person);
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return _ABRecordCopyValue(record, property);
}

uint64_t AccountConfigurationServiceCopyAccountsForEmailAddress()
{
  return _AccountConfigurationServiceCopyAccountsForEmailAddress();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return _CFStringConvertEncodingToNSStringEncoding(encoding);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t CacheDeleteRequestCacheableSpaceGuidance()
{
  return _CacheDeleteRequestCacheableSpaceGuidance();
}

uint64_t CacheDeleteUpdatePurgeable()
{
  return _CacheDeleteUpdatePurgeable();
}

uint64_t DDResultGetCategory()
{
  return _DDResultGetCategory();
}

uint64_t DDResultGetMatchedString()
{
  return _DDResultGetMatchedString();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return _DDScannerCopyResultsWithOptions();
}

uint64_t DDScannerCreate()
{
  return _DDScannerCreate();
}

uint64_t DDScannerScanString()
{
  return _DDScannerScanString();
}

uint64_t ECNSStringFromMailboxMailboxType()
{
  return _ECNSStringFromMailboxMailboxType();
}

uint64_t EDCategoryPowerLogDidCreateInstance()
{
  return _EDCategoryPowerLogDidCreateInstance();
}

uint64_t EFBundleIdentifierForXPCConnection()
{
  return _EFBundleIdentifierForXPCConnection();
}

uint64_t EFContentProtectionGetObservedState()
{
  return _EFContentProtectionGetObservedState();
}

uint64_t EFDeviceUnlockedSinceBoot()
{
  return _EFDeviceUnlockedSinceBoot();
}

uint64_t EFFetchSignpostLog()
{
  return _EFFetchSignpostLog();
}

uint64_t EFIsCustomerBuild()
{
  return _EFIsCustomerBuild();
}

uint64_t EFIsRunningUnitTests()
{
  return _EFIsRunningUnitTests();
}

uint64_t EFLogRegisterStateCaptureBlock()
{
  return _EFLogRegisterStateCaptureBlock();
}

uint64_t EFMarkFileAsPurgeable()
{
  return _EFMarkFileAsPurgeable();
}

uint64_t EFProtectedDataAvailable()
{
  return _EFProtectedDataAvailable();
}

uint64_t EFRegisterContentProtectionObserver()
{
  return _EFRegisterContentProtectionObserver();
}

uint64_t EFStringWithInt64()
{
  return _EFStringWithInt64();
}

uint64_t EFUnregisterContentProtectionObserver()
{
  return _EFUnregisterContentProtectionObserver();
}

uint64_t EMBlackPearlIsFeatureEnabled()
{
  return _EMBlackPearlIsFeatureEnabled();
}

uint64_t EMIsGreymatterAvailableWithOverride()
{
  return _EMIsGreymatterAvailableWithOverride();
}

uint64_t EMIsGreymatterSupportedWithOverride()
{
  return _EMIsGreymatterSupportedWithOverride();
}

uint64_t EMLogCategoryMessageLoading()
{
  return _EMLogCategoryMessageLoading();
}

uint64_t FBSOpenApplicationErrorCodeToString()
{
  return _FBSOpenApplicationErrorCodeToString();
}

uint64_t FBSOpenApplicationErrorCreate()
{
  return _FBSOpenApplicationErrorCreate();
}

uint64_t MFAutoFetchLog()
{
  return _MFAutoFetchLog();
}

uint64_t MFCharsetForEncoding()
{
  return _MFCharsetForEncoding();
}

uint64_t MFComparatorFunctionForSortOrder()
{
  return _MFComparatorFunctionForSortOrder();
}

uint64_t MFComposeLog()
{
  return _MFComposeLog();
}

uint64_t MFContentTypeIsPlainText()
{
  return _MFContentTypeIsPlainText();
}

uint64_t MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName()
{
  return _MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName();
}

uint64_t MFCreateStringByCondensingWhitespace()
{
  return _MFCreateStringByCondensingWhitespace();
}

uint64_t MFCreateStringWithData()
{
  return _MFCreateStringWithData();
}

uint64_t MFDeviceSupportsNanoCompanion()
{
  return _MFDeviceSupportsNanoCompanion();
}

uint64_t MFEncodingForCharset()
{
  return _MFEncodingForCharset();
}

uint64_t MFErrorCodeWithDataStatus()
{
  return _MFErrorCodeWithDataStatus();
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

uint64_t MFLookupLocalizedString()
{
  return _MFLookupLocalizedString();
}

uint64_t MFMailDirectory()
{
  return _MFMailDirectory();
}

uint64_t MFMailDirectoryURL()
{
  return _MFMailDirectoryURL();
}

uint64_t MFMessageDeliveryStatusString()
{
  return _MFMessageDeliveryStatusString();
}

uint64_t MFMessageFlagsByApplyingDictionary()
{
  return _MFMessageFlagsByApplyingDictionary();
}

uint64_t MFPowerLog()
{
  return _MFPowerLog();
}

uint64_t MFPreferredCompositeNameForAddressAndDisplayName()
{
  return _MFPreferredCompositeNameForAddressAndDisplayName();
}

uint64_t MFRegisterPowerObserver()
{
  return _MFRegisterPowerObserver();
}

uint64_t MFSetUserAgent()
{
  return _MFSetUserAgent();
}

uint64_t MFStringHashForMessageIDHeader()
{
  return _MFStringHashForMessageIDHeader();
}

uint64_t MFUnregisterPowerObserver()
{
  return _MFUnregisterPowerObserver();
}

uint64_t MFUserAgent()
{
  return _MFUserAgent();
}

uint64_t MSMailComposeWindowTargetContentIdentifierWithIdentifier()
{
  return _MSMailComposeWindowTargetContentIdentifierWithIdentifier();
}

uint64_t MSSharedContactStore()
{
  return _MSSharedContactStore();
}

uint64_t MSUserNotificationsLog()
{
  return _MSUserNotificationsLog();
}

uint64_t NSBOOLFromString()
{
  return _NSBOOLFromString();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSStringFromBOOL()
{
  return _NSStringFromBOOL();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromMailboxUidType()
{
  return _NSStringFromMailboxUidType();
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return _NSStringFromProtocol(proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PCSettingsGetClassPollInterval()
{
  return _PCSettingsGetClassPollInterval();
}

uint64_t PCSettingsGetClassPushEnabled()
{
  return _PCSettingsGetClassPushEnabled();
}

uint64_t PCSettingsGetPollInterval()
{
  return _PCSettingsGetPollInterval();
}

uint64_t PCSettingsGetStyle()
{
  return _PCSettingsGetStyle();
}

uint64_t SBSCreateOpenApplicationService()
{
  return _SBSCreateOpenApplicationService();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

uint64_t _EFLocalizedStringFromTable()
{
  return __EFLocalizedStringFromTable();
}

uint64_t _MFShowAttachmentMarkup()
{
  return __MFShowAttachmentMarkup();
}

uint64_t _MSSourceTypeIsValid()
{
  return __MSSourceTypeIsValid();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

uint64_t ef_xpc_activity_register()
{
  return _ef_xpc_activity_register();
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

uint64_t mailboxUIDTypeFromECMailboxType()
{
  return _mailboxUIDTypeFromECMailboxType();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_main_np(void)
{
  return _pthread_main_np();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

int puts(const char *a1)
{
  return _puts(a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

uint64_t xpc_add_bundle()
{
  return _xpc_add_bundle();
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return [a1 ID];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLString(void *a1, const char *a2, ...)
{
  return [a1 URLString];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_VIP(void *a1, const char *a2, ...)
{
  return [a1 VIP];
}

id objc_msgSend__addAllSearchOperations(void *a1, const char *a2, ...)
{
  return [a1 _addAllSearchOperations];
}

id objc_msgSend__addObservers(void *a1, const char *a2, ...)
{
  return [a1 _addObservers];
}

id objc_msgSend__addressBook(void *a1, const char *a2, ...)
{
  return [a1 _addressBook];
}

id objc_msgSend__allVIPDictionaries(void *a1, const char *a2, ...)
{
  return [a1 _allVIPDictionaries];
}

id objc_msgSend__alternateAccount(void *a1, const char *a2, ...)
{
  return [a1 _alternateAccount];
}

id objc_msgSend__attemptToLoadLibraryMessageWithContentFromDatabase(void *a1, const char *a2, ...)
{
  return [a1 _attemptToLoadLibraryMessageWithContentFromDatabase];
}

id objc_msgSend__blockingMessage(void *a1, const char *a2, ...)
{
  return [a1 _blockingMessage];
}

id objc_msgSend__bodyLoader(void *a1, const char *a2, ...)
{
  return [a1 _bodyLoader];
}

id objc_msgSend__calculateOrdering(void *a1, const char *a2, ...)
{
  return [a1 _calculateOrdering];
}

id objc_msgSend__calculatePriority(void *a1, const char *a2, ...)
{
  return [a1 _calculatePriority];
}

id objc_msgSend__callMobileMailAppRemovalService(void *a1, const char *a2, ...)
{
  return [a1 _callMobileMailAppRemovalService];
}

id objc_msgSend__canAccessDatabase(void *a1, const char *a2, ...)
{
  return [a1 _canAccessDatabase];
}

id objc_msgSend__canRun(void *a1, const char *a2, ...)
{
  return [a1 _canRun];
}

id objc_msgSend__cancelCurrentInvocations(void *a1, const char *a2, ...)
{
  return [a1 _cancelCurrentInvocations];
}

id objc_msgSend__cancelSleepIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _cancelSleepIfNeeded];
}

id objc_msgSend__checkForReachability(void *a1, const char *a2, ...)
{
  return [a1 _checkForReachability];
}

id objc_msgSend__checkForWiFi(void *a1, const char *a2, ...)
{
  return [a1 _checkForWiFi];
}

id objc_msgSend__checkIfSettingsChanged(void *a1, const char *a2, ...)
{
  return [a1 _checkIfSettingsChanged];
}

id objc_msgSend__cleanUpReachabilityTimer(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpReachabilityTimer];
}

id objc_msgSend__clearResumeTime(void *a1, const char *a2, ...)
{
  return [a1 _clearResumeTime];
}

id objc_msgSend__configureAnalytics(void *a1, const char *a2, ...)
{
  return [a1 _configureAnalytics];
}

id objc_msgSend__createCountQueryPredicateFromNotificationTopics(void *a1, const char *a2, ...)
{
  return [a1 _createCountQueryPredicateFromNotificationTopics];
}

id objc_msgSend__createJobList(void *a1, const char *a2, ...)
{
  return [a1 _createJobList];
}

id objc_msgSend__dataMigrationIsComplete(void *a1, const char *a2, ...)
{
  return [a1 _dataMigrationIsComplete];
}

id objc_msgSend__defaultAttachmentManager(void *a1, const char *a2, ...)
{
  return [a1 _defaultAttachmentManager];
}

id objc_msgSend__defaultShouldExpand(void *a1, const char *a2, ...)
{
  return [a1 _defaultShouldExpand];
}

id objc_msgSend__defaultShouldSync(void *a1, const char *a2, ...)
{
  return [a1 _defaultShouldSync];
}

id objc_msgSend__delayedStartupTasks(void *a1, const char *a2, ...)
{
  return [a1 _delayedStartupTasks];
}

id objc_msgSend__deliveryResultIfNotHasAdequateFreeSpace(void *a1, const char *a2, ...)
{
  return [a1 _deliveryResultIfNotHasAdequateFreeSpace];
}

id objc_msgSend__deregisterBackgroundTasks(void *a1, const char *a2, ...)
{
  return [a1 _deregisterBackgroundTasks];
}

id objc_msgSend__dispatchOperation(void *a1, const char *a2, ...)
{
  return [a1 _dispatchOperation];
}

id objc_msgSend__displayNameShouldBeRedacted(void *a1, const char *a2, ...)
{
  return [a1 _displayNameShouldBeRedacted];
}

id objc_msgSend__displaySender(void *a1, const char *a2, ...)
{
  return [a1 _displaySender];
}

id objc_msgSend__displaySubject(void *a1, const char *a2, ...)
{
  return [a1 _displaySubject];
}

id objc_msgSend__displayedAccountsIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _displayedAccountsIdentifiers];
}

id objc_msgSend__downloadContent(void *a1, const char *a2, ...)
{
  return [a1 _downloadContent];
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return [a1 _endpoint];
}

id objc_msgSend__excludedAccountIdentifiersByCurrentFocus(void *a1, const char *a2, ...)
{
  return [a1 _excludedAccountIdentifiersByCurrentFocus];
}

id objc_msgSend__exponentialBackoff(void *a1, const char *a2, ...)
{
  return [a1 _exponentialBackoff];
}

id objc_msgSend__fetchCategorizationVersion(void *a1, const char *a2, ...)
{
  return [a1 _fetchCategorizationVersion];
}

id objc_msgSend__fetchedSuccessfully(void *a1, const char *a2, ...)
{
  return [a1 _fetchedSuccessfully];
}

id objc_msgSend__finishAutoFetch(void *a1, const char *a2, ...)
{
  return [a1 _finishAutoFetch];
}

id objc_msgSend__finishRequest(void *a1, const char *a2, ...)
{
  return [a1 _finishRequest];
}

id objc_msgSend__firstActionsDestination(void *a1, const char *a2, ...)
{
  return [a1 _firstActionsDestination];
}

id objc_msgSend__focusedAccountsIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 _focusedAccountsIdentifiers];
}

id objc_msgSend__getNextClientOrMessage(void *a1, const char *a2, ...)
{
  return [a1 _getNextClientOrMessage];
}

id objc_msgSend__handleAccountChange(void *a1, const char *a2, ...)
{
  return [a1 _handleAccountChange];
}

id objc_msgSend__handleNewAccountIdentityAvailable(void *a1, const char *a2, ...)
{
  return [a1 _handleNewAccountIdentityAvailable];
}

id objc_msgSend__hasBeenUpgraded(void *a1, const char *a2, ...)
{
  return [a1 _hasBeenUpgraded];
}

id objc_msgSend__hasSearchableMailAccount(void *a1, const char *a2, ...)
{
  return [a1 _hasSearchableMailAccount];
}

id objc_msgSend__includeMailMailboxesFromDisk(void *a1, const char *a2, ...)
{
  return [a1 _includeMailMailboxesFromDisk];
}

id objc_msgSend__includesMeIconImage(void *a1, const char *a2, ...)
{
  return [a1 _includesMeIconImage];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__isInFavoriteMailbox(void *a1, const char *a2, ...)
{
  return [a1 _isInFavoriteMailbox];
}

id objc_msgSend__isProtectedDataAvailable(void *a1, const char *a2, ...)
{
  return [a1 _isProtectedDataAvailable];
}

id objc_msgSend__knownAttachmentLimiterTests(void *a1, const char *a2, ...)
{
  return [a1 _knownAttachmentLimiterTests];
}

id objc_msgSend__lastClearedInfo(void *a1, const char *a2, ...)
{
  return [a1 _lastClearedInfo];
}

id objc_msgSend__libraryOptions(void *a1, const char *a2, ...)
{
  return [a1 _libraryOptions];
}

id objc_msgSend__loadAccounts(void *a1, const char *a2, ...)
{
  return [a1 _loadAccounts];
}

id objc_msgSend__loadCurrentSettingsAndNotifyObservers(void *a1, const char *a2, ...)
{
  return [a1 _loadCurrentSettingsAndNotifyObservers];
}

id objc_msgSend__loadMailboxesAfterMailboxListingChanged(void *a1, const char *a2, ...)
{
  return [a1 _loadMailboxesAfterMailboxListingChanged];
}

id objc_msgSend__loadRules(void *a1, const char *a2, ...)
{
  return [a1 _loadRules];
}

id objc_msgSend__logCurrentSettings(void *a1, const char *a2, ...)
{
  return [a1 _logCurrentSettings];
}

id objc_msgSend__mailboxSelectionFromPreviousOSVersion(void *a1, const char *a2, ...)
{
  return [a1 _mailboxSelectionFromPreviousOSVersion];
}

id objc_msgSend__mailboxUid(void *a1, const char *a2, ...)
{
  return [a1 _mailboxUid];
}

id objc_msgSend__mailboxesToDownload(void *a1, const char *a2, ...)
{
  return [a1 _mailboxesToDownload];
}

id objc_msgSend__mailboxesToFetch(void *a1, const char *a2, ...)
{
  return [a1 _mailboxesToFetch];
}

id objc_msgSend__markAsScheduled(void *a1, const char *a2, ...)
{
  return [a1 _markAsScheduled];
}

id objc_msgSend__markUpgradeComplete(void *a1, const char *a2, ...)
{
  return [a1 _markUpgradeComplete];
}

id objc_msgSend__markXPCActivitiesAsDone(void *a1, const char *a2, ...)
{
  return [a1 _markXPCActivitiesAsDone];
}

id objc_msgSend__messagesInProgress(void *a1, const char *a2, ...)
{
  return [a1 _messagesInProgress];
}

id objc_msgSend__mobileMailAskBeforeDeleting(void *a1, const char *a2, ...)
{
  return [a1 _mobileMailAskBeforeDeleting];
}

id objc_msgSend__mobileMailDefaultAccountId(void *a1, const char *a2, ...)
{
  return [a1 _mobileMailDefaultAccountId];
}

id objc_msgSend__mobileMailLoadRemoteImages(void *a1, const char *a2, ...)
{
  return [a1 _mobileMailLoadRemoteImages];
}

id objc_msgSend__mobileMailOrganizeByThread(void *a1, const char *a2, ...)
{
  return [a1 _mobileMailOrganizeByThread];
}

id objc_msgSend__mobileMailSwipeRightAction(void *a1, const char *a2, ...)
{
  return [a1 _mobileMailSwipeRightAction];
}

id objc_msgSend__networkStatusChanged(void *a1, const char *a2, ...)
{
  return [a1 _networkStatusChanged];
}

id objc_msgSend__notifyDelegateDidFinish(void *a1, const char *a2, ...)
{
  return [a1 _notifyDelegateDidFinish];
}

id objc_msgSend__notifyDelegateOfFailure(void *a1, const char *a2, ...)
{
  return [a1 _notifyDelegateOfFailure];
}

id objc_msgSend__notifyFavoritesManagerSelectedMailboxesChanged(void *a1, const char *a2, ...)
{
  return [a1 _notifyFavoritesManagerSelectedMailboxesChanged];
}

id objc_msgSend__observeChangesInConditions(void *a1, const char *a2, ...)
{
  return [a1 _observeChangesInConditions];
}

id objc_msgSend__outboxStore(void *a1, const char *a2, ...)
{
  return [a1 _outboxStore];
}

id objc_msgSend__pendingVIPChangesPath(void *a1, const char *a2, ...)
{
  return [a1 _pendingVIPChangesPath];
}

id objc_msgSend__performCleanup(void *a1, const char *a2, ...)
{
  return [a1 _performCleanup];
}

id objc_msgSend__performCleanupOnStartup(void *a1, const char *a2, ...)
{
  return [a1 _performCleanupOnStartup];
}

id objc_msgSend__performLibrarySearch(void *a1, const char *a2, ...)
{
  return [a1 _performLibrarySearch];
}

id objc_msgSend__performTasksAfterProtectedDataBecomesAvailable(void *a1, const char *a2, ...)
{
  return [a1 _performTasksAfterProtectedDataBecomesAvailable];
}

id objc_msgSend__performUpgrade(void *a1, const char *a2, ...)
{
  return [a1 _performUpgrade];
}

id objc_msgSend__populateMessageSets(void *a1, const char *a2, ...)
{
  return [a1 _populateMessageSets];
}

id objc_msgSend__postNotification(void *a1, const char *a2, ...)
{
  return [a1 _postNotification];
}

id objc_msgSend__processBackgroundDownload(void *a1, const char *a2, ...)
{
  return [a1 _processBackgroundDownload];
}

id objc_msgSend__processEligibleMailboxesAndWait(void *a1, const char *a2, ...)
{
  return [a1 _processEligibleMailboxesAndWait];
}

id objc_msgSend__processPendingRequests(void *a1, const char *a2, ...)
{
  return [a1 _processPendingRequests];
}

id objc_msgSend__processSufficientlyDelayedMessages(void *a1, const char *a2, ...)
{
  return [a1 _processSufficientlyDelayedMessages];
}

id objc_msgSend__protectedDataAvailable(void *a1, const char *a2, ...)
{
  return [a1 _protectedDataAvailable];
}

id objc_msgSend__registerForAutoFetchFinishedNotification(void *a1, const char *a2, ...)
{
  return [a1 _registerForAutoFetchFinishedNotification];
}

id objc_msgSend__registerForLibraryAvailabilityNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerForLibraryAvailabilityNotifications];
}

id objc_msgSend__registerLibraryCompression(void *a1, const char *a2, ...)
{
  return [a1 _registerLibraryCompression];
}

id objc_msgSend__registerLibraryPurgeableUpgrader(void *a1, const char *a2, ...)
{
  return [a1 _registerLibraryPurgeableUpgrader];
}

id objc_msgSend__registerNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerNotifications];
}

id objc_msgSend__registerServices(void *a1, const char *a2, ...)
{
  return [a1 _registerServices];
}

id objc_msgSend__registerStateCapture(void *a1, const char *a2, ...)
{
  return [a1 _registerStateCapture];
}

id objc_msgSend__registerXpcActivity(void *a1, const char *a2, ...)
{
  return [a1 _registerXpcActivity];
}

id objc_msgSend__releasePowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 _releasePowerAssertion];
}

id objc_msgSend__retainPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 _retainPowerAssertion];
}

id objc_msgSend__scheduleAllJobs(void *a1, const char *a2, ...)
{
  return [a1 _scheduleAllJobs];
}

id objc_msgSend__scheduleBackgroundDownload(void *a1, const char *a2, ...)
{
  return [a1 _scheduleBackgroundDownload];
}

id objc_msgSend__scheduleNextFireEvent(void *a1, const char *a2, ...)
{
  return [a1 _scheduleNextFireEvent];
}

id objc_msgSend__schedulePushPurgeableSpaceUpdate(void *a1, const char *a2, ...)
{
  return [a1 _schedulePushPurgeableSpaceUpdate];
}

id objc_msgSend__searchResultsProxy(void *a1, const char *a2, ...)
{
  return [a1 _searchResultsProxy];
}

id objc_msgSend__searchableMailboxesByAccount(void *a1, const char *a2, ...)
{
  return [a1 _searchableMailboxesByAccount];
}

id objc_msgSend__setupNetworkObserver(void *a1, const char *a2, ...)
{
  return [a1 _setupNetworkObserver];
}

id objc_msgSend__setupPostingDelayDefaultsObserver(void *a1, const char *a2, ...)
{
  return [a1 _setupPostingDelayDefaultsObserver];
}

id objc_msgSend__setupSnapshotInvalidation(void *a1, const char *a2, ...)
{
  return [a1 _setupSnapshotInvalidation];
}

id objc_msgSend__shouldContinueProcessing(void *a1, const char *a2, ...)
{
  return [a1 _shouldContinueProcessing];
}

id objc_msgSend__sortedMessages(void *a1, const char *a2, ...)
{
  return [a1 _sortedMessages];
}

id objc_msgSend__start(void *a1, const char *a2, ...)
{
  return [a1 _start];
}

id objc_msgSend__startContentLoadProcess(void *a1, const char *a2, ...)
{
  return [a1 _startContentLoadProcess];
}

id objc_msgSend__startNonAcceptingServer(void *a1, const char *a2, ...)
{
  return [a1 _startNonAcceptingServer];
}

id objc_msgSend__subscribeNotification(void *a1, const char *a2, ...)
{
  return [a1 _subscribeNotification];
}

id objc_msgSend__summaryForRemindMe(void *a1, const char *a2, ...)
{
  return [a1 _summaryForRemindMe];
}

id objc_msgSend__suspendOrResumeOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 _suspendOrResumeOperationQueue];
}

id objc_msgSend__tryProcessingQueues(void *a1, const char *a2, ...)
{
  return [a1 _tryProcessingQueues];
}

id objc_msgSend__unregisterAllXPCActivities(void *a1, const char *a2, ...)
{
  return [a1 _unregisterAllXPCActivities];
}

id objc_msgSend__unregisterPushTopics(void *a1, const char *a2, ...)
{
  return [a1 _unregisterPushTopics];
}

id objc_msgSend__unregisterXPCActivity(void *a1, const char *a2, ...)
{
  return [a1 _unregisterXPCActivity];
}

id objc_msgSend__unregisterXpcActivity(void *a1, const char *a2, ...)
{
  return [a1 _unregisterXpcActivity];
}

id objc_msgSend__updateApplicationShortcuts(void *a1, const char *a2, ...)
{
  return [a1 _updateApplicationShortcuts];
}

id objc_msgSend__updateCounts(void *a1, const char *a2, ...)
{
  return [a1 _updateCounts];
}

id objc_msgSend__visibleMailboxes(void *a1, const char *a2, ...)
{
  return [a1 _visibleMailboxes];
}

id objc_msgSend__xpcActivityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _xpcActivityIdentifier];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountConduit(void *a1, const char *a2, ...)
{
  return [a1 accountConduit];
}

id objc_msgSend_accountController(void *a1, const char *a2, ...)
{
  return [a1 accountController];
}

id objc_msgSend_accountDidFinish(void *a1, const char *a2, ...)
{
  return [a1 accountDidFinish];
}

id objc_msgSend_accountDidStart(void *a1, const char *a2, ...)
{
  return [a1 accountDidStart];
}

id objc_msgSend_accountForErrorHandling(void *a1, const char *a2, ...)
{
  return [a1 accountForErrorHandling];
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return [a1 accountID];
}

id objc_msgSend_accountId(void *a1, const char *a2, ...)
{
  return [a1 accountId];
}

id objc_msgSend_accountIdentities(void *a1, const char *a2, ...)
{
  return [a1 accountIdentities];
}

id objc_msgSend_accountIsValid(void *a1, const char *a2, ...)
{
  return [a1 accountIsValid];
}

id objc_msgSend_accountMailboxesBatchSize(void *a1, const char *a2, ...)
{
  return [a1 accountMailboxesBatchSize];
}

id objc_msgSend_accountProxyGenerator(void *a1, const char *a2, ...)
{
  return [a1 accountProxyGenerator];
}

id objc_msgSend_accountRelativePath(void *a1, const char *a2, ...)
{
  return [a1 accountRelativePath];
}

id objc_msgSend_accountRepository(void *a1, const char *a2, ...)
{
  return [a1 accountRepository];
}

id objc_msgSend_accountUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountUniqueIdentifier];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_accountsCollection(void *a1, const char *a2, ...)
{
  return [a1 accountsCollection];
}

id objc_msgSend_accountsDidChange(void *a1, const char *a2, ...)
{
  return [a1 accountsDidChange];
}

id objc_msgSend_accountsEmailAddresses(void *a1, const char *a2, ...)
{
  return [a1 accountsEmailAddresses];
}

id objc_msgSend_accountsProvider(void *a1, const char *a2, ...)
{
  return [a1 accountsProvider];
}

id objc_msgSend_accumulatedString(void *a1, const char *a2, ...)
{
  return [a1 accumulatedString];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_actionHandler(void *a1, const char *a2, ...)
{
  return [a1 actionHandler];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_activeAccountSyncCount(void *a1, const char *a2, ...)
{
  return [a1 activeAccountSyncCount];
}

id objc_msgSend_activeAccounts(void *a1, const char *a2, ...)
{
  return [a1 activeAccounts];
}

id objc_msgSend_activeAccountsToSyncByAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccountsToSyncByAccount];
}

id objc_msgSend_activeAccountsToSyncByMailbox(void *a1, const char *a2, ...)
{
  return [a1 activeAccountsToSyncByMailbox];
}

id objc_msgSend_activeAutosaveSessions(void *a1, const char *a2, ...)
{
  return [a1 activeAutosaveSessions];
}

id objc_msgSend_activeListeners(void *a1, const char *a2, ...)
{
  return [a1 activeListeners];
}

id objc_msgSend_activeNonLocalAccounts(void *a1, const char *a2, ...)
{
  return [a1 activeNonLocalAccounts];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_activityPersistence(void *a1, const char *a2, ...)
{
  return [a1 activityPersistence];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_additionalPredicate(void *a1, const char *a2, ...)
{
  return [a1 additionalPredicate];
}

id objc_msgSend_addressBook(void *a1, const char *a2, ...)
{
  return [a1 addressBook];
}

id objc_msgSend_aggregatedMailboxesFilterTypes(void *a1, const char *a2, ...)
{
  return [a1 aggregatedMailboxesFilterTypes];
}

id objc_msgSend_alarmScheduler(void *a1, const char *a2, ...)
{
  return [a1 alarmScheduler];
}

id objc_msgSend_alertSetting(void *a1, const char *a2, ...)
{
  return [a1 alertSetting];
}

id objc_msgSend_alertStyle(void *a1, const char *a2, ...)
{
  return [a1 alertStyle];
}

id objc_msgSend_algorithm(void *a1, const char *a2, ...)
{
  return [a1 algorithm];
}

id objc_msgSend_allActivePrimaryMailboxUids(void *a1, const char *a2, ...)
{
  return [a1 allActivePrimaryMailboxUids];
}

id objc_msgSend_allCriteriaMustBeSatisfied(void *a1, const char *a2, ...)
{
  return [a1 allCriteriaMustBeSatisfied];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allMailMailboxUid(void *a1, const char *a2, ...)
{
  return [a1 allMailMailboxUid];
}

id objc_msgSend_allMailboxUids(void *a1, const char *a2, ...)
{
  return [a1 allMailboxUids];
}

id objc_msgSend_allMailboxesSyncEnabled(void *a1, const char *a2, ...)
{
  return [a1 allMailboxesSyncEnabled];
}

id objc_msgSend_allManagers(void *a1, const char *a2, ...)
{
  return [a1 allManagers];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allPurgeableMailboxUids(void *a1, const char *a2, ...)
{
  return [a1 allPurgeableMailboxUids];
}

id objc_msgSend_allVIPEmailAddresses(void *a1, const char *a2, ...)
{
  return [a1 allVIPEmailAddresses];
}

id objc_msgSend_allVIPEmailAddressesCriterion(void *a1, const char *a2, ...)
{
  return [a1 allVIPEmailAddressesCriterion];
}

id objc_msgSend_allVIPs(void *a1, const char *a2, ...)
{
  return [a1 allVIPs];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alwaysSatisfiedCondition(void *a1, const char *a2, ...)
{
  return [a1 alwaysSatisfiedCondition];
}

id objc_msgSend_analyticsKey(void *a1, const char *a2, ...)
{
  return [a1 analyticsKey];
}

id objc_msgSend_analyticsLogger(void *a1, const char *a2, ...)
{
  return [a1 analyticsLogger];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_applicationBundleID(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleID];
}

id objc_msgSend_approximateRawSize(void *a1, const char *a2, ...)
{
  return [a1 approximateRawSize];
}

id objc_msgSend_archiveDestination(void *a1, const char *a2, ...)
{
  return [a1 archiveDestination];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_attachmentConfigCompletion(void *a1, const char *a2, ...)
{
  return [a1 attachmentConfigCompletion];
}

id objc_msgSend_attachmentFilename(void *a1, const char *a2, ...)
{
  return [a1 attachmentFilename];
}

id objc_msgSend_attachmentManager(void *a1, const char *a2, ...)
{
  return [a1 attachmentManager];
}

id objc_msgSend_attachmentURLs(void *a1, const char *a2, ...)
{
  return [a1 attachmentURLs];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_attachmentsAdded(void *a1, const char *a2, ...)
{
  return [a1 attachmentsAdded];
}

id objc_msgSend_attachmentsInDocument(void *a1, const char *a2, ...)
{
  return [a1 attachmentsInDocument];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_autoFetchData(void *a1, const char *a2, ...)
{
  return [a1 autoFetchData];
}

id objc_msgSend_autoFetchPushCount(void *a1, const char *a2, ...)
{
  return [a1 autoFetchPushCount];
}

id objc_msgSend_autoFetchState(void *a1, const char *a2, ...)
{
  return [a1 autoFetchState];
}

id objc_msgSend_autofetchAccounts(void *a1, const char *a2, ...)
{
  return [a1 autofetchAccounts];
}

id objc_msgSend_autosave(void *a1, const char *a2, ...)
{
  return [a1 autosave];
}

id objc_msgSend_autosaveIdentifier(void *a1, const char *a2, ...)
{
  return [a1 autosaveIdentifier];
}

id objc_msgSend_autosaveScheduler(void *a1, const char *a2, ...)
{
  return [a1 autosaveScheduler];
}

id objc_msgSend_backingManager(void *a1, const char *a2, ...)
{
  return [a1 backingManager];
}

id objc_msgSend_badgeCount(void *a1, const char *a2, ...)
{
  return [a1 badgeCount];
}

id objc_msgSend_badgeCountDebouncer(void *a1, const char *a2, ...)
{
  return [a1 badgeCountDebouncer];
}

id objc_msgSend_badgeCountString(void *a1, const char *a2, ...)
{
  return [a1 badgeCountString];
}

id objc_msgSend_badgeSetting(void *a1, const char *a2, ...)
{
  return [a1 badgeSetting];
}

id objc_msgSend_baseAccount(void *a1, const char *a2, ...)
{
  return [a1 baseAccount];
}

id objc_msgSend_baseMailDirectory(void *a1, const char *a2, ...)
{
  return [a1 baseMailDirectory];
}

id objc_msgSend_batchSize(void *a1, const char *a2, ...)
{
  return [a1 batchSize];
}

id objc_msgSend_bcc(void *a1, const char *a2, ...)
{
  return [a1 bcc];
}

id objc_msgSend_beforeDate(void *a1, const char *a2, ...)
{
  return [a1 beforeDate];
}

id objc_msgSend_beforeDateReceived(void *a1, const char *a2, ...)
{
  return [a1 beforeDateReceived];
}

id objc_msgSend_beginSyncing(void *a1, const char *a2, ...)
{
  return [a1 beginSyncing];
}

id objc_msgSend_bestAlternativePart(void *a1, const char *a2, ...)
{
  return [a1 bestAlternativePart];
}

id objc_msgSend_blockedSenderManager(void *a1, const char *a2, ...)
{
  return [a1 blockedSenderManager];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bridgeSettingsMailboxSelection(void *a1, const char *a2, ...)
{
  return [a1 bridgeSettingsMailboxSelection];
}

id objc_msgSend_bucketBarController(void *a1, const char *a2, ...)
{
  return [a1 bucketBarController];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytesRead(void *a1, const char *a2, ...)
{
  return [a1 bytesRead];
}

id objc_msgSend_bytesSent(void *a1, const char *a2, ...)
{
  return [a1 bytesSent];
}

id objc_msgSend_bytesWritten(void *a1, const char *a2, ...)
{
  return [a1 bytesWritten];
}

id objc_msgSend_cachedMailAppIsInstalled(void *a1, const char *a2, ...)
{
  return [a1 cachedMailAppIsInstalled];
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return [a1 callStackReturnAddresses];
}

id objc_msgSend_callbackQueue(void *a1, const char *a2, ...)
{
  return [a1 callbackQueue];
}

id objc_msgSend_canBeTriaged(void *a1, const char *a2, ...)
{
  return [a1 canBeTriaged];
}

id objc_msgSend_canFetch(void *a1, const char *a2, ...)
{
  return [a1 canFetch];
}

id objc_msgSend_canFetchSearchResults(void *a1, const char *a2, ...)
{
  return [a1 canFetchSearchResults];
}

id objc_msgSend_canReceiveNewMailNotifications(void *a1, const char *a2, ...)
{
  return [a1 canReceiveNewMailNotifications];
}

id objc_msgSend_canUsePersistence(void *a1, const char *a2, ...)
{
  return [a1 canUsePersistence];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_cancelAllPendingOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllPendingOperations];
}

id objc_msgSend_cancelLastDelayedMessage(void *a1, const char *a2, ...)
{
  return [a1 cancelLastDelayedMessage];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_capabilitiesDictionary(void *a1, const char *a2, ...)
{
  return [a1 capabilitiesDictionary];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_categoryCoreAnalyticsLogger(void *a1, const char *a2, ...)
{
  return [a1 categoryCoreAnalyticsLogger];
}

id objc_msgSend_categoryPersistence(void *a1, const char *a2, ...)
{
  return [a1 categoryPersistence];
}

id objc_msgSend_categorySubsystem(void *a1, const char *a2, ...)
{
  return [a1 categorySubsystem];
}

id objc_msgSend_cc(void *a1, const char *a2, ...)
{
  return [a1 cc];
}

id objc_msgSend_checkForAddressBookChanges(void *a1, const char *a2, ...)
{
  return [a1 checkForAddressBookChanges];
}

id objc_msgSend_childEnumerator(void *a1, const char *a2, ...)
{
  return [a1 childEnumerator];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return [a1 children];
}

id objc_msgSend_clearedInfoForDataProviderMigration(void *a1, const char *a2, ...)
{
  return [a1 clearedInfoForDataProviderMigration];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_clientConnection(void *a1, const char *a2, ...)
{
  return [a1 clientConnection];
}

id objc_msgSend_clientResumer(void *a1, const char *a2, ...)
{
  return [a1 clientResumer];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return [a1 clients];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeConnection(void *a1, const char *a2, ...)
{
  return [a1 closeConnection];
}

id objc_msgSend_coalesceThreadID(void *a1, const char *a2, ...)
{
  return [a1 coalesceThreadID];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_completionHandlerAdapter(void *a1, const char *a2, ...)
{
  return [a1 completionHandlerAdapter];
}

id objc_msgSend_composeType(void *a1, const char *a2, ...)
{
  return [a1 composeType];
}

id objc_msgSend_composeWebView(void *a1, const char *a2, ...)
{
  return [a1 composeWebView];
}

id objc_msgSend_composedMessageId(void *a1, const char *a2, ...)
{
  return [a1 composedMessageId];
}

id objc_msgSend_compositionContext(void *a1, const char *a2, ...)
{
  return [a1 compositionContext];
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return [a1 condition];
}

id objc_msgSend_conditionsObservable(void *a1, const char *a2, ...)
{
  return [a1 conditionsObservable];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionError(void *a1, const char *a2, ...)
{
  return [a1 connectionError];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return [a1 contactStore];
}

id objc_msgSend_containsRichText(void *a1, const char *a2, ...)
{
  return [a1 containsRichText];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentID(void *a1, const char *a2, ...)
{
  return [a1 contentID];
}

id objc_msgSend_contentId(void *a1, const char *a2, ...)
{
  return [a1 contentId];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_contentTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 contentTypeIdentifier];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return [a1 contextID];
}

id objc_msgSend_continueOffset(void *a1, const char *a2, ...)
{
  return [a1 continueOffset];
}

id objc_msgSend_conversationFlags(void *a1, const char *a2, ...)
{
  return [a1 conversationFlags];
}

id objc_msgSend_conversationID(void *a1, const char *a2, ...)
{
  return [a1 conversationID];
}

id objc_msgSend_conversationId(void *a1, const char *a2, ...)
{
  return [a1 conversationId];
}

id objc_msgSend_conversationNotificationLevel(void *a1, const char *a2, ...)
{
  return [a1 conversationNotificationLevel];
}

id objc_msgSend_conversationPersistence(void *a1, const char *a2, ...)
{
  return [a1 conversationPersistence];
}

id objc_msgSend_conversationSubscriptionProvider(void *a1, const char *a2, ...)
{
  return [a1 conversationSubscriptionProvider];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyAddressListForBcc(void *a1, const char *a2, ...)
{
  return [a1 copyAddressListForBcc];
}

id objc_msgSend_copyAddressListForCc(void *a1, const char *a2, ...)
{
  return [a1 copyAddressListForCc];
}

id objc_msgSend_copyAddressListForTo(void *a1, const char *a2, ...)
{
  return [a1 copyAddressListForTo];
}

id objc_msgSend_copyDiagnosticInformation(void *a1, const char *a2, ...)
{
  return [a1 copyDiagnosticInformation];
}

id objc_msgSend_copyReceivingEmailAddresses(void *a1, const char *a2, ...)
{
  return [a1 copyReceivingEmailAddresses];
}

id objc_msgSend_copyResults(void *a1, const char *a2, ...)
{
  return [a1 copyResults];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countOfVisibleItems(void *a1, const char *a2, ...)
{
  return [a1 countOfVisibleItems];
}

id objc_msgSend_countQueryPredicate(void *a1, const char *a2, ...)
{
  return [a1 countQueryPredicate];
}

id objc_msgSend_createAndStartTask(void *a1, const char *a2, ...)
{
  return [a1 createAndStartTask];
}

id objc_msgSend_created(void *a1, const char *a2, ...)
{
  return [a1 created];
}

id objc_msgSend_criteria(void *a1, const char *a2, ...)
{
  return [a1 criteria];
}

id objc_msgSend_criteriaBuilder(void *a1, const char *a2, ...)
{
  return [a1 criteriaBuilder];
}

id objc_msgSend_criterion(void *a1, const char *a2, ...)
{
  return [a1 criterion];
}

id objc_msgSend_criterionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 criterionIdentifier];
}

id objc_msgSend_criterionType(void *a1, const char *a2, ...)
{
  return [a1 criterionType];
}

id objc_msgSend_currentAccountIDOfSoundToPlay(void *a1, const char *a2, ...)
{
  return [a1 currentAccountIDOfSoundToPlay];
}

id objc_msgSend_currentAlertSuppresionContexts(void *a1, const char *a2, ...)
{
  return [a1 currentAlertSuppresionContexts];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentFocus(void *a1, const char *a2, ...)
{
  return [a1 currentFocus];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentMonitor(void *a1, const char *a2, ...)
{
  return [a1 currentMonitor];
}

id objc_msgSend_currentRequests(void *a1, const char *a2, ...)
{
  return [a1 currentRequests];
}

id objc_msgSend_currentSettingsByTopic(void *a1, const char *a2, ...)
{
  return [a1 currentSettingsByTopic];
}

id objc_msgSend_currentStage(void *a1, const char *a2, ...)
{
  return [a1 currentStage];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return [a1 currentUser];
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return [a1 daemonInterface];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_dataStatus(void *a1, const char *a2, ...)
{
  return [a1 dataStatus];
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return [a1 databaseID];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateReceived(void *a1, const char *a2, ...)
{
  return [a1 dateReceived];
}

id objc_msgSend_dateReceivedAsTimeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 dateReceivedAsTimeIntervalSince1970];
}

id objc_msgSend_dateReceivedLimit(void *a1, const char *a2, ...)
{
  return [a1 dateReceivedLimit];
}

id objc_msgSend_dateSent(void *a1, const char *a2, ...)
{
  return [a1 dateSent];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultAttachmentManager(void *a1, const char *a2, ...)
{
  return [a1 defaultAttachmentManager];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 defaultEmailAddress];
}

id objc_msgSend_defaultFilePath(void *a1, const char *a2, ...)
{
  return [a1 defaultFilePath];
}

id objc_msgSend_defaultInstance(void *a1, const char *a2, ...)
{
  return [a1 defaultInstance];
}

id objc_msgSend_defaultInstanceLock(void *a1, const char *a2, ...)
{
  return [a1 defaultInstanceLock];
}

id objc_msgSend_defaultMailAccountForDelivery(void *a1, const char *a2, ...)
{
  return [a1 defaultMailAccountForDelivery];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultMessageLibrary(void *a1, const char *a2, ...)
{
  return [a1 defaultMessageLibrary];
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return [a1 defaultMetrics];
}

id objc_msgSend_defaultMonitor(void *a1, const char *a2, ...)
{
  return [a1 defaultMonitor];
}

id objc_msgSend_defaultProvider(void *a1, const char *a2, ...)
{
  return [a1 defaultProvider];
}

id objc_msgSend_defaultSelectedMailboxes(void *a1, const char *a2, ...)
{
  return [a1 defaultSelectedMailboxes];
}

id objc_msgSend_defaultTopicRequests(void *a1, const char *a2, ...)
{
  return [a1 defaultTopicRequests];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delayedMessageScheduler(void *a1, const char *a2, ...)
{
  return [a1 delayedMessageScheduler];
}

id objc_msgSend_delayedMessages(void *a1, const char *a2, ...)
{
  return [a1 delayedMessages];
}

id objc_msgSend_delayedNotificationPresenter(void *a1, const char *a2, ...)
{
  return [a1 delayedNotificationPresenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegateEndpoint(void *a1, const char *a2, ...)
{
  return [a1 delegateEndpoint];
}

id objc_msgSend_deleted(void *a1, const char *a2, ...)
{
  return [a1 deleted];
}

id objc_msgSend_deliveredNotifications(void *a1, const char *a2, ...)
{
  return [a1 deliveredNotifications];
}

id objc_msgSend_deliveryAccount(void *a1, const char *a2, ...)
{
  return [a1 deliveryAccount];
}

id objc_msgSend_deliveryHookResponder(void *a1, const char *a2, ...)
{
  return [a1 deliveryHookResponder];
}

id objc_msgSend_dequeueAllMessageIds(void *a1, const char *a2, ...)
{
  return [a1 dequeueAllMessageIds];
}

id objc_msgSend_deregister(void *a1, const char *a2, ...)
{
  return [a1 deregister];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_destinationPath(void *a1, const char *a2, ...)
{
  return [a1 destinationPath];
}

id objc_msgSend_detector(void *a1, const char *a2, ...)
{
  return [a1 detector];
}

id objc_msgSend_deviceStorage(void *a1, const char *a2, ...)
{
  return [a1 deviceStorage];
}

id objc_msgSend_diagnosticInformation(void *a1, const char *a2, ...)
{
  return [a1 diagnosticInformation];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryRepresentationRemovingSyncKeys(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentationRemovingSyncKeys];
}

id objc_msgSend_dictionaryRepresentations(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentations];
}

id objc_msgSend_dismissBlock(void *a1, const char *a2, ...)
{
  return [a1 dismissBlock];
}

id objc_msgSend_displayErrors(void *a1, const char *a2, ...)
{
  return [a1 displayErrors];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayNameUsingSpecialNames(void *a1, const char *a2, ...)
{
  return [a1 displayNameUsingSpecialNames];
}

id objc_msgSend_displayOrder(void *a1, const char *a2, ...)
{
  return [a1 displayOrder];
}

id objc_msgSend_displayedAccounts(void *a1, const char *a2, ...)
{
  return [a1 displayedAccounts];
}

id objc_msgSend_displayedAccountsIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 displayedAccountsIdentifiers];
}

id objc_msgSend_displayedAccountsToSyncByMailbox(void *a1, const char *a2, ...)
{
  return [a1 displayedAccountsToSyncByMailbox];
}

id objc_msgSend_disposition(void *a1, const char *a2, ...)
{
  return [a1 disposition];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doCompact(void *a1, const char *a2, ...)
{
  return [a1 doCompact];
}

id objc_msgSend_documentID(void *a1, const char *a2, ...)
{
  return [a1 documentID];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainAccessor(void *a1, const char *a2, ...)
{
  return [a1 domainAccessor];
}

id objc_msgSend_done(void *a1, const char *a2, ...)
{
  return [a1 done];
}

id objc_msgSend_dontNotify(void *a1, const char *a2, ...)
{
  return [a1 dontNotify];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadAllMessages(void *a1, const char *a2, ...)
{
  return [a1 downloadAllMessages];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_emailAddressStrings(void *a1, const char *a2, ...)
{
  return [a1 emailAddressStrings];
}

id objc_msgSend_emailAddressValue(void *a1, const char *a2, ...)
{
  return [a1 emailAddressValue];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_emailAddressesAndAliasesList(void *a1, const char *a2, ...)
{
  return [a1 emailAddressesAndAliasesList];
}

id objc_msgSend_emptyTrash(void *a1, const char *a2, ...)
{
  return [a1 emptyTrash];
}

id objc_msgSend_encodedAsJSON(void *a1, const char *a2, ...)
{
  return [a1 encodedAsJSON];
}

id objc_msgSend_encodedFileSize(void *a1, const char *a2, ...)
{
  return [a1 encodedFileSize];
}

id objc_msgSend_encodedHeaders(void *a1, const char *a2, ...)
{
  return [a1 encodedHeaders];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endTask(void *a1, const char *a2, ...)
{
  return [a1 endTask];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_endpointInfo(void *a1, const char *a2, ...)
{
  return [a1 endpointInfo];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorHandler(void *a1, const char *a2, ...)
{
  return [a1 errorHandler];
}

id objc_msgSend_excludedMailboxTypes(void *a1, const char *a2, ...)
{
  return [a1 excludedMailboxTypes];
}

id objc_msgSend_expandedItemBySyncKey(void *a1, const char *a2, ...)
{
  return [a1 expandedItemBySyncKey];
}

id objc_msgSend_expandedItems(void *a1, const char *a2, ...)
{
  return [a1 expandedItems];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedInterface];
}

id objc_msgSend_exportedObjectForClient(void *a1, const char *a2, ...)
{
  return [a1 exportedObjectForClient];
}

id objc_msgSend_expression(void *a1, const char *a2, ...)
{
  return [a1 expression];
}

id objc_msgSend_externalID(void *a1, const char *a2, ...)
{
  return [a1 externalID];
}

id objc_msgSend_externalReferenceId(void *a1, const char *a2, ...)
{
  return [a1 externalReferenceId];
}

id objc_msgSend_failedCellularAttempts(void *a1, const char *a2, ...)
{
  return [a1 failedCellularAttempts];
}

id objc_msgSend_failedMessageIdsByRequest(void *a1, const char *a2, ...)
{
  return [a1 failedMessageIdsByRequest];
}

id objc_msgSend_favoriteItem(void *a1, const char *a2, ...)
{
  return [a1 favoriteItem];
}

id objc_msgSend_favoriteMailboxUidList(void *a1, const char *a2, ...)
{
  return [a1 favoriteMailboxUidList];
}

id objc_msgSend_favoritesPersistence(void *a1, const char *a2, ...)
{
  return [a1 favoritesPersistence];
}

id objc_msgSend_favoritesReader(void *a1, const char *a2, ...)
{
  return [a1 favoritesReader];
}

id objc_msgSend_fetchForPowernap(void *a1, const char *a2, ...)
{
  return [a1 fetchForPowernap];
}

id objc_msgSend_fetchLocalData(void *a1, const char *a2, ...)
{
  return [a1 fetchLocalData];
}

id objc_msgSend_fetchProcessorScheduler(void *a1, const char *a2, ...)
{
  return [a1 fetchProcessorScheduler];
}

id objc_msgSend_fetchScheduler(void *a1, const char *a2, ...)
{
  return [a1 fetchScheduler];
}

id objc_msgSend_fetchStart(void *a1, const char *a2, ...)
{
  return [a1 fetchStart];
}

id objc_msgSend_fetchWindow(void *a1, const char *a2, ...)
{
  return [a1 fetchWindow];
}

id objc_msgSend_fetchWindowCap(void *a1, const char *a2, ...)
{
  return [a1 fetchWindowCap];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return [a1 fileName];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filter(void *a1, const char *a2, ...)
{
  return [a1 filter];
}

id objc_msgSend_filterType(void *a1, const char *a2, ...)
{
  return [a1 filterType];
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return [a1 finished];
}

id objc_msgSend_finishedProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishedProcessing];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return [a1 first];
}

id objc_msgSend_firstChildPart(void *a1, const char *a2, ...)
{
  return [a1 firstChildPart];
}

id objc_msgSend_firstEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 firstEmailAddress];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstSender(void *a1, const char *a2, ...)
{
  return [a1 firstSender];
}

id objc_msgSend_firstSenderAddress(void *a1, const char *a2, ...)
{
  return [a1 firstSenderAddress];
}

id objc_msgSend_fixedShortcutItems(void *a1, const char *a2, ...)
{
  return [a1 fixedShortcutItems];
}

id objc_msgSend_flag(void *a1, const char *a2, ...)
{
  return [a1 flag];
}

id objc_msgSend_flagChange(void *a1, const char *a2, ...)
{
  return [a1 flagChange];
}

id objc_msgSend_flaggedMessageCriterion(void *a1, const char *a2, ...)
{
  return [a1 flaggedMessageCriterion];
}

id objc_msgSend_flattenedMailboxTreeRepresentation(void *a1, const char *a2, ...)
{
  return [a1 flattenedMailboxTreeRepresentation];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_focusController(void *a1, const char *a2, ...)
{
  return [a1 focusController];
}

id objc_msgSend_focusedAccountIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 focusedAccountIdentifiers];
}

id objc_msgSend_focusedAccounts(void *a1, const char *a2, ...)
{
  return [a1 focusedAccounts];
}

id objc_msgSend_forceAll(void *a1, const char *a2, ...)
{
  return [a1 forceAll];
}

id objc_msgSend_foundMessages(void *a1, const char *a2, ...)
{
  return [a1 foundMessages];
}

id objc_msgSend_freeSpaceMonitor(void *a1, const char *a2, ...)
{
  return [a1 freeSpaceMonitor];
}

id objc_msgSend_freeSpaceStatus(void *a1, const char *a2, ...)
{
  return [a1 freeSpaceStatus];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_from(void *a1, const char *a2, ...)
{
  return [a1 from];
}

id objc_msgSend_fromEmailAddresses(void *a1, const char *a2, ...)
{
  return [a1 fromEmailAddresses];
}

id objc_msgSend_fromEmailAddressesIncludingDisabled(void *a1, const char *a2, ...)
{
  return [a1 fromEmailAddressesIncludingDisabled];
}

id objc_msgSend_fullPath(void *a1, const char *a2, ...)
{
  return [a1 fullPath];
}

id objc_msgSend_fullUserName(void *a1, const char *a2, ...)
{
  return [a1 fullUserName];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_gameModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 gameModeEnabled];
}

id objc_msgSend_generatedSummary(void *a1, const char *a2, ...)
{
  return [a1 generatedSummary];
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return [a1 getPairedDevices];
}

id objc_msgSend_globalAsyncScheduler(void *a1, const char *a2, ...)
{
  return [a1 globalAsyncScheduler];
}

id objc_msgSend_globalMessageID(void *a1, const char *a2, ...)
{
  return [a1 globalMessageID];
}

id objc_msgSend_globalMessageURL(void *a1, const char *a2, ...)
{
  return [a1 globalMessageURL];
}

id objc_msgSend_gotNewMessagesState(void *a1, const char *a2, ...)
{
  return [a1 gotNewMessagesState];
}

id objc_msgSend_groupDictionary(void *a1, const char *a2, ...)
{
  return [a1 groupDictionary];
}

id objc_msgSend_growFetchWindow(void *a1, const char *a2, ...)
{
  return [a1 growFetchWindow];
}

id objc_msgSend_handleWatchAccountsUpdated(void *a1, const char *a2, ...)
{
  return [a1 handleWatchAccountsUpdated];
}

id objc_msgSend_hasAdequateFreeSpace(void *a1, const char *a2, ...)
{
  return [a1 hasAdequateFreeSpace];
}

id objc_msgSend_hasChildren(void *a1, const char *a2, ...)
{
  return [a1 hasChildren];
}

id objc_msgSend_hasFavoriteMailboxes(void *a1, const char *a2, ...)
{
  return [a1 hasFavoriteMailboxes];
}

id objc_msgSend_hasLoadedCompleteBody(void *a1, const char *a2, ...)
{
  return [a1 hasLoadedCompleteBody];
}

id objc_msgSend_hasLoadedSomeContent(void *a1, const char *a2, ...)
{
  return [a1 hasLoadedSomeContent];
}

id objc_msgSend_hasPasswordCredential(void *a1, const char *a2, ...)
{
  return [a1 hasPasswordCredential];
}

id objc_msgSend_hasSubscribedConversations(void *a1, const char *a2, ...)
{
  return [a1 hasSubscribedConversations];
}

id objc_msgSend_hasTextData(void *a1, const char *a2, ...)
{
  return [a1 hasTextData];
}

id objc_msgSend_hasVIPs(void *a1, const char *a2, ...)
{
  return [a1 hasVIPs];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_headerData(void *a1, const char *a2, ...)
{
  return [a1 headerData];
}

id objc_msgSend_headers(void *a1, const char *a2, ...)
{
  return [a1 headers];
}

id objc_msgSend_headersDictionary(void *a1, const char *a2, ...)
{
  return [a1 headersDictionary];
}

id objc_msgSend_headersIfAvailable(void *a1, const char *a2, ...)
{
  return [a1 headersIfAvailable];
}

id objc_msgSend_highPriority(void *a1, const char *a2, ...)
{
  return [a1 highPriority];
}

id objc_msgSend_hookRegistry(void *a1, const char *a2, ...)
{
  return [a1 hookRegistry];
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return [a1 hostname];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_htmlContentData(void *a1, const char *a2, ...)
{
  return [a1 htmlContentData];
}

id objc_msgSend_htmlData(void *a1, const char *a2, ...)
{
  return [a1 htmlData];
}

id objc_msgSend_htmlSignature(void *a1, const char *a2, ...)
{
  return [a1 htmlSignature];
}

id objc_msgSend_iconString(void *a1, const char *a2, ...)
{
  return [a1 iconString];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_immediateScheduler(void *a1, const char *a2, ...)
{
  return [a1 immediateScheduler];
}

id objc_msgSend_inAirplaneMode(void *a1, const char *a2, ...)
{
  return [a1 inAirplaneMode];
}

id objc_msgSend_inboxesFilterTypes(void *a1, const char *a2, ...)
{
  return [a1 inboxesFilterTypes];
}

id objc_msgSend_includeAttachments(void *a1, const char *a2, ...)
{
  return [a1 includeAttachments];
}

id objc_msgSend_includeFavoritesMailboxes(void *a1, const char *a2, ...)
{
  return [a1 includeFavoritesMailboxes];
}

id objc_msgSend_includeMailMailboxes(void *a1, const char *a2, ...)
{
  return [a1 includeMailMailboxes];
}

id objc_msgSend_includePushedMailboxes(void *a1, const char *a2, ...)
{
  return [a1 includePushedMailboxes];
}

id objc_msgSend_includesMeCriterion(void *a1, const char *a2, ...)
{
  return [a1 includesMeCriterion];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_initialXPCActivityInterval(void *a1, const char *a2, ...)
{
  return [a1 initialXPCActivityInterval];
}

id objc_msgSend_initializeConversationManagerAndPerformInitialSync(void *a1, const char *a2, ...)
{
  return [a1 initializeConversationManagerAndPerformInitialSync];
}

id objc_msgSend_int64Value(void *a1, const char *a2, ...)
{
  return [a1 int64Value];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intelligentSkeletonFetchProcessor(void *a1, const char *a2, ...)
{
  return [a1 intelligentSkeletonFetchProcessor];
}

id objc_msgSend_interruptionHandler(void *a1, const char *a2, ...)
{
  return [a1 interruptionHandler];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return [a1 interval];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAndDelete(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndDelete];
}

id objc_msgSend_invalidateMailboxes(void *a1, const char *a2, ...)
{
  return [a1 invalidateMailboxes];
}

id objc_msgSend_invalidateVisibleItems(void *a1, const char *a2, ...)
{
  return [a1 invalidateVisibleItems];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return [a1 invalidationHandler];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return [a1 invoke];
}

id objc_msgSend_invokeAgainWithBody(void *a1, const char *a2, ...)
{
  return [a1 invokeAgainWithBody];
}

id objc_msgSend_isAccountsCollection(void *a1, const char *a2, ...)
{
  return [a1 isAccountsCollection];
}

id objc_msgSend_isActionable(void *a1, const char *a2, ...)
{
  return [a1 isActionable];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return [a1 isAtEnd];
}

id objc_msgSend_isAutomatic(void *a1, const char *a2, ...)
{
  return [a1 isAutomatic];
}

id objc_msgSend_isBatterySaverModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBatterySaverModeEnabled];
}

id objc_msgSend_isBusy(void *a1, const char *a2, ...)
{
  return [a1 isBusy];
}

id objc_msgSend_isCSV(void *a1, const char *a2, ...)
{
  return [a1 isCSV];
}

id objc_msgSend_isCalendarFile(void *a1, const char *a2, ...)
{
  return [a1 isCalendarFile];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isCertificate(void *a1, const char *a2, ...)
{
  return [a1 isCertificate];
}

id objc_msgSend_isCompacting(void *a1, const char *a2, ...)
{
  return [a1 isCompacting];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return [a1 isComplete];
}

id objc_msgSend_isDXF(void *a1, const char *a2, ...)
{
  return [a1 isDXF];
}

id objc_msgSend_isDataAvailable(void *a1, const char *a2, ...)
{
  return [a1 isDataAvailable];
}

id objc_msgSend_isDisplayingMultipleAccounts(void *a1, const char *a2, ...)
{
  return [a1 isDisplayingMultipleAccounts];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isEntitledDelegate(void *a1, const char *a2, ...)
{
  return [a1 isEntitledDelegate];
}

id objc_msgSend_isExcel(void *a1, const char *a2, ...)
{
  return [a1 isExcel];
}

id objc_msgSend_isExpandable(void *a1, const char *a2, ...)
{
  return [a1 isExpandable];
}

id objc_msgSend_isExpandableInEditMode(void *a1, const char *a2, ...)
{
  return [a1 isExpandableInEditMode];
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return [a1 isExpanded];
}

id objc_msgSend_isFatPipe(void *a1, const char *a2, ...)
{
  return [a1 isFatPipe];
}

id objc_msgSend_isFavoriteMailbox(void *a1, const char *a2, ...)
{
  return [a1 isFavoriteMailbox];
}

id objc_msgSend_isFinalized(void *a1, const char *a2, ...)
{
  return [a1 isFinalized];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isForced(void *a1, const char *a2, ...)
{
  return [a1 isForced];
}

id objc_msgSend_isForeground(void *a1, const char *a2, ...)
{
  return [a1 isForeground];
}

id objc_msgSend_isForegroundRequest(void *a1, const char *a2, ...)
{
  return [a1 isForegroundRequest];
}

id objc_msgSend_isFreeSpaceCritical(void *a1, const char *a2, ...)
{
  return [a1 isFreeSpaceCritical];
}

id objc_msgSend_isFrontmost(void *a1, const char *a2, ...)
{
  return [a1 isFrontmost];
}

id objc_msgSend_isFull(void *a1, const char *a2, ...)
{
  return [a1 isFull];
}

id objc_msgSend_isGIF(void *a1, const char *a2, ...)
{
  return [a1 isGIF];
}

id objc_msgSend_isHTML(void *a1, const char *a2, ...)
{
  return [a1 isHTML];
}

id objc_msgSend_isHarvestingSupported(void *a1, const char *a2, ...)
{
  return [a1 isHarvestingSupported];
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return [a1 isIdle];
}

id objc_msgSend_isImage(void *a1, const char *a2, ...)
{
  return [a1 isImage];
}

id objc_msgSend_isImageFile(void *a1, const char *a2, ...)
{
  return [a1 isImageFile];
}

id objc_msgSend_isInboxMailbox(void *a1, const char *a2, ...)
{
  return [a1 isInboxMailbox];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return [a1 isInternal];
}

id objc_msgSend_isInvalidated(void *a1, const char *a2, ...)
{
  return [a1 isInvalidated];
}

id objc_msgSend_isLibraryMessage(void *a1, const char *a2, ...)
{
  return [a1 isLibraryMessage];
}

id objc_msgSend_isMSWord(void *a1, const char *a2, ...)
{
  return [a1 isMSWord];
}

id objc_msgSend_isMailboxesCollection(void *a1, const char *a2, ...)
{
  return [a1 isMailboxesCollection];
}

id objc_msgSend_isMaild(void *a1, const char *a2, ...)
{
  return [a1 isMaild];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isManaged(void *a1, const char *a2, ...)
{
  return [a1 isManaged];
}

id objc_msgSend_isMedia(void *a1, const char *a2, ...)
{
  return [a1 isMedia];
}

id objc_msgSend_isMessageContentsLocallyAvailable(void *a1, const char *a2, ...)
{
  return [a1 isMessageContentsLocallyAvailable];
}

id objc_msgSend_isMobileMail(void *a1, const char *a2, ...)
{
  return [a1 isMobileMail];
}

id objc_msgSend_isMoveToTrashEnabled(void *a1, const char *a2, ...)
{
  return [a1 isMoveToTrashEnabled];
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return [a1 isNetworkReachable];
}

id objc_msgSend_isNetworkUp(void *a1, const char *a2, ...)
{
  return [a1 isNetworkUp];
}

id objc_msgSend_isNotesMailboxUid(void *a1, const char *a2, ...)
{
  return [a1 isNotesMailboxUid];
}

id objc_msgSend_isNotifiedThread(void *a1, const char *a2, ...)
{
  return [a1 isNotifiedThread];
}

id objc_msgSend_isOutboxCollection(void *a1, const char *a2, ...)
{
  return [a1 isOutboxCollection];
}

id objc_msgSend_isOutgoingMailboxUid(void *a1, const char *a2, ...)
{
  return [a1 isOutgoingMailboxUid];
}

id objc_msgSend_isPDFFile(void *a1, const char *a2, ...)
{
  return [a1 isPDFFile];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_isPass(void *a1, const char *a2, ...)
{
  return [a1 isPass];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return [a1 isPaused];
}

id objc_msgSend_isPlainText(void *a1, const char *a2, ...)
{
  return [a1 isPlainText];
}

id objc_msgSend_isPluggedIn(void *a1, const char *a2, ...)
{
  return [a1 isPluggedIn];
}

id objc_msgSend_isPowernapFetch(void *a1, const char *a2, ...)
{
  return [a1 isPowernapFetch];
}

id objc_msgSend_isPowerpoint(void *a1, const char *a2, ...)
{
  return [a1 isPowerpoint];
}

id objc_msgSend_isPrimary(void *a1, const char *a2, ...)
{
  return [a1 isPrimary];
}

id objc_msgSend_isProcessing(void *a1, const char *a2, ...)
{
  return [a1 isProcessing];
}

id objc_msgSend_isProfile(void *a1, const char *a2, ...)
{
  return [a1 isProfile];
}

id objc_msgSend_isPush(void *a1, const char *a2, ...)
{
  return [a1 isPush];
}

id objc_msgSend_isRFC822(void *a1, const char *a2, ...)
{
  return [a1 isRFC822];
}

id objc_msgSend_isRTF(void *a1, const char *a2, ...)
{
  return [a1 isRTF];
}

id objc_msgSend_isRemindMe(void *a1, const char *a2, ...)
{
  return [a1 isRemindMe];
}

id objc_msgSend_isRequestCompleted(void *a1, const char *a2, ...)
{
  return [a1 isRequestCompleted];
}

id objc_msgSend_isRunningTests(void *a1, const char *a2, ...)
{
  return [a1 isRunningTests];
}

id objc_msgSend_isSatisfied(void *a1, const char *a2, ...)
{
  return [a1 isSatisfied];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_isSentMailboxUid(void *a1, const char *a2, ...)
{
  return [a1 isSentMailboxUid];
}

id objc_msgSend_isShowingAllInboxes(void *a1, const char *a2, ...)
{
  return [a1 isShowingAllInboxes];
}

id objc_msgSend_isStore(void *a1, const char *a2, ...)
{
  return [a1 isStore];
}

id objc_msgSend_isSummaryDownload(void *a1, const char *a2, ...)
{
  return [a1 isSummaryDownload];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return [a1 isSuspended];
}

id objc_msgSend_isSyncingNotes(void *a1, const char *a2, ...)
{
  return [a1 isSyncingNotes];
}

id objc_msgSend_isUserRequested(void *a1, const char *a2, ...)
{
  return [a1 isUserRequested];
}

id objc_msgSend_isVCard(void *a1, const char *a2, ...)
{
  return [a1 isVCard];
}

id objc_msgSend_isVIP(void *a1, const char *a2, ...)
{
  return [a1 isVIP];
}

id objc_msgSend_isVPN(void *a1, const char *a2, ...)
{
  return [a1 isVPN];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isVisible(void *a1, const char *a2, ...)
{
  return [a1 isVisible];
}

id objc_msgSend_isVisibleFetch(void *a1, const char *a2, ...)
{
  return [a1 isVisibleFetch];
}

id objc_msgSend_isWatchFace(void *a1, const char *a2, ...)
{
  return [a1 isWatchFace];
}

id objc_msgSend_isWiFiEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWiFiEnabled];
}

id objc_msgSend_isWifi(void *a1, const char *a2, ...)
{
  return [a1 isWifi];
}

id objc_msgSend_isWorkout(void *a1, const char *a2, ...)
{
  return [a1 isWorkout];
}

id objc_msgSend_isZip(void *a1, const char *a2, ...)
{
  return [a1 isZip];
}

id objc_msgSend_itemForOutbox(void *a1, const char *a2, ...)
{
  return [a1 itemForOutbox];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return [a1 itemID];
}

id objc_msgSend_itemURLString(void *a1, const char *a2, ...)
{
  return [a1 itemURLString];
}

id objc_msgSend_itemUUID(void *a1, const char *a2, ...)
{
  return [a1 itemUUID];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_jobList(void *a1, const char *a2, ...)
{
  return [a1 jobList];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastAdditionalMailboxesFetchDate(void *a1, const char *a2, ...)
{
  return [a1 lastAdditionalMailboxesFetchDate];
}

id objc_msgSend_lastAttempt(void *a1, const char *a2, ...)
{
  return [a1 lastAttempt];
}

id objc_msgSend_lastFetchDuration(void *a1, const char *a2, ...)
{
  return [a1 lastFetchDuration];
}

id objc_msgSend_lastFetchTime(void *a1, const char *a2, ...)
{
  return [a1 lastFetchTime];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastStatus(void *a1, const char *a2, ...)
{
  return [a1 lastStatus];
}

id objc_msgSend_lastSystemWakeDate(void *a1, const char *a2, ...)
{
  return [a1 lastSystemWakeDate];
}

id objc_msgSend_lastUnconfirmedLostMessagesSearchTime(void *a1, const char *a2, ...)
{
  return [a1 lastUnconfirmedLostMessagesSearchTime];
}

id objc_msgSend_launchedToTest(void *a1, const char *a2, ...)
{
  return [a1 launchedToTest];
}

id objc_msgSend_legacyMessage(void *a1, const char *a2, ...)
{
  return [a1 legacyMessage];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return [a1 library];
}

id objc_msgSend_libraryCompressionActivity(void *a1, const char *a2, ...)
{
  return [a1 libraryCompressionActivity];
}

id objc_msgSend_libraryCompressionComplete(void *a1, const char *a2, ...)
{
  return [a1 libraryCompressionComplete];
}

id objc_msgSend_libraryID(void *a1, const char *a2, ...)
{
  return [a1 libraryID];
}

id objc_msgSend_libraryMessage(void *a1, const char *a2, ...)
{
  return [a1 libraryMessage];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_loadMessageBodies(void *a1, const char *a2, ...)
{
  return [a1 loadMessageBodies];
}

id objc_msgSend_loadNumOlderMessages(void *a1, const char *a2, ...)
{
  return [a1 loadNumOlderMessages];
}

id objc_msgSend_loadingContext(void *a1, const char *a2, ...)
{
  return [a1 loadingContext];
}

id objc_msgSend_localAccount(void *a1, const char *a2, ...)
{
  return [a1 localAccount];
}

id objc_msgSend_localId(void *a1, const char *a2, ...)
{
  return [a1 localId];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedErrorDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedErrorDescription];
}

id objc_msgSend_localizedErrorTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedErrorTitle];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedRemindMeNotificationTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedRemindMeNotificationTitle];
}

id objc_msgSend_localizedRemindMeNotificationTitleNoSender(void *a1, const char *a2, ...)
{
  return [a1 localizedRemindMeNotificationTitleNoSender];
}

id objc_msgSend_localizedSubtitle(void *a1, const char *a2, ...)
{
  return [a1 localizedSubtitle];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedTitle];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lockScreenSetting(void *a1, const char *a2, ...)
{
  return [a1 lockScreenSetting];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_loggingActivity(void *a1, const char *a2, ...)
{
  return [a1 loggingActivity];
}

id objc_msgSend_loggingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 loggingIdentifier];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_loudestState(void *a1, const char *a2, ...)
{
  return [a1 loudestState];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mailAccounts(void *a1, const char *a2, ...)
{
  return [a1 mailAccounts];
}

id objc_msgSend_mailDataDirectory(void *a1, const char *a2, ...)
{
  return [a1 mailDataDirectory];
}

id objc_msgSend_mailDropDeliveryState(void *a1, const char *a2, ...)
{
  return [a1 mailDropDeliveryState];
}

id objc_msgSend_mailDropState(void *a1, const char *a2, ...)
{
  return [a1 mailDropState];
}

id objc_msgSend_mailServerSideCriterion(void *a1, const char *a2, ...)
{
  return [a1 mailServerSideCriterion];
}

id objc_msgSend_mailbox(void *a1, const char *a2, ...)
{
  return [a1 mailbox];
}

id objc_msgSend_mailboxCollections(void *a1, const char *a2, ...)
{
  return [a1 mailboxCollections];
}

id objc_msgSend_mailboxController(void *a1, const char *a2, ...)
{
  return [a1 mailboxController];
}

id objc_msgSend_mailboxCountObserver(void *a1, const char *a2, ...)
{
  return [a1 mailboxCountObserver];
}

id objc_msgSend_mailboxCutoffController(void *a1, const char *a2, ...)
{
  return [a1 mailboxCutoffController];
}

id objc_msgSend_mailboxFavoriteItem(void *a1, const char *a2, ...)
{
  return [a1 mailboxFavoriteItem];
}

id objc_msgSend_mailboxFilterType(void *a1, const char *a2, ...)
{
  return [a1 mailboxFilterType];
}

id objc_msgSend_mailboxFrecencyController(void *a1, const char *a2, ...)
{
  return [a1 mailboxFrecencyController];
}

id objc_msgSend_mailboxID(void *a1, const char *a2, ...)
{
  return [a1 mailboxID];
}

id objc_msgSend_mailboxId(void *a1, const char *a2, ...)
{
  return [a1 mailboxId];
}

id objc_msgSend_mailboxMessagesBatchSize(void *a1, const char *a2, ...)
{
  return [a1 mailboxMessagesBatchSize];
}

id objc_msgSend_mailboxParentForMove(void *a1, const char *a2, ...)
{
  return [a1 mailboxParentForMove];
}

id objc_msgSend_mailboxPath(void *a1, const char *a2, ...)
{
  return [a1 mailboxPath];
}

id objc_msgSend_mailboxPersistence(void *a1, const char *a2, ...)
{
  return [a1 mailboxPersistence];
}

id objc_msgSend_mailboxProvider(void *a1, const char *a2, ...)
{
  return [a1 mailboxProvider];
}

id objc_msgSend_mailboxRepository(void *a1, const char *a2, ...)
{
  return [a1 mailboxRepository];
}

id objc_msgSend_mailboxScope(void *a1, const char *a2, ...)
{
  return [a1 mailboxScope];
}

id objc_msgSend_mailboxSelection(void *a1, const char *a2, ...)
{
  return [a1 mailboxSelection];
}

id objc_msgSend_mailboxToMoveOrRename(void *a1, const char *a2, ...)
{
  return [a1 mailboxToMoveOrRename];
}

id objc_msgSend_mailboxToRemove(void *a1, const char *a2, ...)
{
  return [a1 mailboxToRemove];
}

id objc_msgSend_mailboxType(void *a1, const char *a2, ...)
{
  return [a1 mailboxType];
}

id objc_msgSend_mailboxUIDs(void *a1, const char *a2, ...)
{
  return [a1 mailboxUIDs];
}

id objc_msgSend_mailboxURL(void *a1, const char *a2, ...)
{
  return [a1 mailboxURL];
}

id objc_msgSend_mailboxes(void *a1, const char *a2, ...)
{
  return [a1 mailboxes];
}

id objc_msgSend_mailboxesCollection(void *a1, const char *a2, ...)
{
  return [a1 mailboxesCollection];
}

id objc_msgSend_mailboxesDidFinish(void *a1, const char *a2, ...)
{
  return [a1 mailboxesDidFinish];
}

id objc_msgSend_mailboxesDidFinishAll(void *a1, const char *a2, ...)
{
  return [a1 mailboxesDidFinishAll];
}

id objc_msgSend_mailboxesDidStart(void *a1, const char *a2, ...)
{
  return [a1 mailboxesDidStart];
}

id objc_msgSend_mailboxesForAutoFetch(void *a1, const char *a2, ...)
{
  return [a1 mailboxesForAutoFetch];
}

id objc_msgSend_mailboxesNeededToBeMarkedPurgeable(void *a1, const char *a2, ...)
{
  return [a1 mailboxesNeededToBeMarkedPurgeable];
}

id objc_msgSend_mailboxesNeedingCompression(void *a1, const char *a2, ...)
{
  return [a1 mailboxesNeedingCompression];
}

id objc_msgSend_mailboxesStage(void *a1, const char *a2, ...)
{
  return [a1 mailboxesStage];
}

id objc_msgSend_mailboxesWithAllMessagesSyncEnabledIds(void *a1, const char *a2, ...)
{
  return [a1 mailboxesWithAllMessagesSyncEnabledIds];
}

id objc_msgSend_mainAlternativeValid(void *a1, const char *a2, ...)
{
  return [a1 mainAlternativeValid];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return [a1 mainThreadScheduler];
}

id objc_msgSend_markAsDone(void *a1, const char *a2, ...)
{
  return [a1 markAsDone];
}

id objc_msgSend_markAsForwarded(void *a1, const char *a2, ...)
{
  return [a1 markAsForwarded];
}

id objc_msgSend_markAsReplied(void *a1, const char *a2, ...)
{
  return [a1 markAsReplied];
}

id objc_msgSend_markAsViewed(void *a1, const char *a2, ...)
{
  return [a1 markAsViewed];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageActionHandler(void *a1, const char *a2, ...)
{
  return [a1 messageActionHandler];
}

id objc_msgSend_messageActionProviderIDs(void *a1, const char *a2, ...)
{
  return [a1 messageActionProviderIDs];
}

id objc_msgSend_messageActionProviders(void *a1, const char *a2, ...)
{
  return [a1 messageActionProviders];
}

id objc_msgSend_messageBody(void *a1, const char *a2, ...)
{
  return [a1 messageBody];
}

id objc_msgSend_messageBodyIfAvailable(void *a1, const char *a2, ...)
{
  return [a1 messageBodyIfAvailable];
}

id objc_msgSend_messageBodyLoader(void *a1, const char *a2, ...)
{
  return [a1 messageBodyLoader];
}

id objc_msgSend_messageChangeManager(void *a1, const char *a2, ...)
{
  return [a1 messageChangeManager];
}

id objc_msgSend_messageData(void *a1, const char *a2, ...)
{
  return [a1 messageData];
}

id objc_msgSend_messageFlags(void *a1, const char *a2, ...)
{
  return [a1 messageFlags];
}

id objc_msgSend_messageID(void *a1, const char *a2, ...)
{
  return [a1 messageID];
}

id objc_msgSend_messageIDHash(void *a1, const char *a2, ...)
{
  return [a1 messageIDHash];
}

id objc_msgSend_messageIDHeader(void *a1, const char *a2, ...)
{
  return [a1 messageIDHeader];
}

id objc_msgSend_messageIDHeaderHash(void *a1, const char *a2, ...)
{
  return [a1 messageIDHeaderHash];
}

id objc_msgSend_messageId(void *a1, const char *a2, ...)
{
  return [a1 messageId];
}

id objc_msgSend_messagePersistence(void *a1, const char *a2, ...)
{
  return [a1 messagePersistence];
}

id objc_msgSend_messageReference(void *a1, const char *a2, ...)
{
  return [a1 messageReference];
}

id objc_msgSend_messageRepository(void *a1, const char *a2, ...)
{
  return [a1 messageRepository];
}

id objc_msgSend_messageSize(void *a1, const char *a2, ...)
{
  return [a1 messageSize];
}

id objc_msgSend_messageStore(void *a1, const char *a2, ...)
{
  return [a1 messageStore];
}

id objc_msgSend_messages(void *a1, const char *a2, ...)
{
  return [a1 messages];
}

id objc_msgSend_messagesAccumulator(void *a1, const char *a2, ...)
{
  return [a1 messagesAccumulator];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_mimeBody(void *a1, const char *a2, ...)
{
  return [a1 mimeBody];
}

id objc_msgSend_mimePart(void *a1, const char *a2, ...)
{
  return [a1 mimePart];
}

id objc_msgSend_mimeType(void *a1, const char *a2, ...)
{
  return [a1 mimeType];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_mirrorSettingsFromCompanion(void *a1, const char *a2, ...)
{
  return [a1 mirrorSettingsFromCompanion];
}

id objc_msgSend_modifiedMailboxName(void *a1, const char *a2, ...)
{
  return [a1 modifiedMailboxName];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_mutableExpandedItemBySyncKey(void *a1, const char *a2, ...)
{
  return [a1 mutableExpandedItemBySyncKey];
}

id objc_msgSend_mutableExpandedItems(void *a1, const char *a2, ...)
{
  return [a1 mutableExpandedItems];
}

id objc_msgSend_mutableItems(void *a1, const char *a2, ...)
{
  return [a1 mutableItems];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nanoAttachmentType(void *a1, const char *a2, ...)
{
  return [a1 nanoAttachmentType];
}

id objc_msgSend_nanoLocalMessageId(void *a1, const char *a2, ...)
{
  return [a1 nanoLocalMessageId];
}

id objc_msgSend_nanoMessage(void *a1, const char *a2, ...)
{
  return [a1 nanoMessage];
}

id objc_msgSend_nanoMessageId(void *a1, const char *a2, ...)
{
  return [a1 nanoMessageId];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_networkConfigurationChanged(void *a1, const char *a2, ...)
{
  return [a1 networkConfigurationChanged];
}

id objc_msgSend_networkController(void *a1, const char *a2, ...)
{
  return [a1 networkController];
}

id objc_msgSend_networkFetchingAllowed(void *a1, const char *a2, ...)
{
  return [a1 networkFetchingAllowed];
}

id objc_msgSend_newMessagesState(void *a1, const char *a2, ...)
{
  return [a1 newMessagesState];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextClient(void *a1, const char *a2, ...)
{
  return [a1 nextClient];
}

id objc_msgSend_nextMessage(void *a1, const char *a2, ...)
{
  return [a1 nextMessage];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nextSearchableMailbox(void *a1, const char *a2, ...)
{
  return [a1 nextSearchableMailbox];
}

id objc_msgSend_nextSiblingPart(void *a1, const char *a2, ...)
{
  return [a1 nextSiblingPart];
}

id objc_msgSend_nonPurgeableSpace(void *a1, const char *a2, ...)
{
  return [a1 nonPurgeableSpace];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notificationAnalyticsLogger(void *a1, const char *a2, ...)
{
  return [a1 notificationAnalyticsLogger];
}

id objc_msgSend_notificationCenterSetting(void *a1, const char *a2, ...)
{
  return [a1 notificationCenterSetting];
}

id objc_msgSend_notificationExpectedFromFetch(void *a1, const char *a2, ...)
{
  return [a1 notificationExpectedFromFetch];
}

id objc_msgSend_notificationID(void *a1, const char *a2, ...)
{
  return [a1 notificationID];
}

id objc_msgSend_notificationMessage(void *a1, const char *a2, ...)
{
  return [a1 notificationMessage];
}

id objc_msgSend_notificationSettingsByTopic(void *a1, const char *a2, ...)
{
  return [a1 notificationSettingsByTopic];
}

id objc_msgSend_notificationSummarizationEnabled(void *a1, const char *a2, ...)
{
  return [a1 notificationSummarizationEnabled];
}

id objc_msgSend_notifyMobileMailAccountsChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyMobileMailAccountsChanged];
}

id objc_msgSend_notifyMobileMailAskBeforeDeletingChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyMobileMailAskBeforeDeletingChanged];
}

id objc_msgSend_notifyMobileMailLoadRemoteImagesChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyMobileMailLoadRemoteImagesChanged];
}

id objc_msgSend_notifyMobileMailOrganizeByThreadChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyMobileMailOrganizeByThreadChanged];
}

id objc_msgSend_notifyMobileMailPrivacyProtectionChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyMobileMailPrivacyProtectionChanged];
}

id objc_msgSend_notifyMobileMailSwipeRightActionChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyMobileMailSwipeRightActionChanged];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfActiveAccounts(void *a1, const char *a2, ...)
{
  return [a1 numberOfActiveAccounts];
}

id objc_msgSend_numberOfAlternatives(void *a1, const char *a2, ...)
{
  return [a1 numberOfAlternatives];
}

id objc_msgSend_numberOfFailures(void *a1, const char *a2, ...)
{
  return [a1 numberOfFailures];
}

id objc_msgSend_numberOfInactiveAccounts(void *a1, const char *a2, ...)
{
  return [a1 numberOfInactiveAccounts];
}

id objc_msgSend_numberOfLoadAttempts(void *a1, const char *a2, ...)
{
  return [a1 numberOfLoadAttempts];
}

id objc_msgSend_numberOfPendingMessages(void *a1, const char *a2, ...)
{
  return [a1 numberOfPendingMessages];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_observationScheduler(void *a1, const char *a2, ...)
{
  return [a1 observationScheduler];
}

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return [a1 observer];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_oldBadgeCount(void *a1, const char *a2, ...)
{
  return [a1 oldBadgeCount];
}

id objc_msgSend_openSynchronously(void *a1, const char *a2, ...)
{
  return [a1 openSynchronously];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return [a1 operationQueue];
}

id objc_msgSend_orderedAccountIds(void *a1, const char *a2, ...)
{
  return [a1 orderedAccountIds];
}

id objc_msgSend_ordering(void *a1, const char *a2, ...)
{
  return [a1 ordering];
}

id objc_msgSend_organizeByThread(void *a1, const char *a2, ...)
{
  return [a1 organizeByThread];
}

id objc_msgSend_originalContentSize(void *a1, const char *a2, ...)
{
  return [a1 originalContentSize];
}

id objc_msgSend_originalConversationId(void *a1, const char *a2, ...)
{
  return [a1 originalConversationId];
}

id objc_msgSend_originalMessageID(void *a1, const char *a2, ...)
{
  return [a1 originalMessageID];
}

id objc_msgSend_originalPushState(void *a1, const char *a2, ...)
{
  return [a1 originalPushState];
}

id objc_msgSend_outboxCollection(void *a1, const char *a2, ...)
{
  return [a1 outboxCollection];
}

id objc_msgSend_outboxCopy(void *a1, const char *a2, ...)
{
  return [a1 outboxCopy];
}

id objc_msgSend_outboxMailboxUid(void *a1, const char *a2, ...)
{
  return [a1 outboxMailboxUid];
}

id objc_msgSend_outgoingMessageRepository(void *a1, const char *a2, ...)
{
  return [a1 outgoingMessageRepository];
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return [a1 output];
}

id objc_msgSend_outputTextView(void *a1, const char *a2, ...)
{
  return [a1 outputTextView];
}

id objc_msgSend_pairedDeviceInfo(void *a1, const char *a2, ...)
{
  return [a1 pairedDeviceInfo];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_parentMailbox(void *a1, const char *a2, ...)
{
  return [a1 parentMailbox];
}

id objc_msgSend_parentPart(void *a1, const char *a2, ...)
{
  return [a1 parentPart];
}

id objc_msgSend_parse(void *a1, const char *a2, ...)
{
  return [a1 parse];
}

id objc_msgSend_parserError(void *a1, const char *a2, ...)
{
  return [a1 parserError];
}

id objc_msgSend_part(void *a1, const char *a2, ...)
{
  return [a1 part];
}

id objc_msgSend_partNumber(void *a1, const char *a2, ...)
{
  return [a1 partNumber];
}

id objc_msgSend_partiallyLoaded(void *a1, const char *a2, ...)
{
  return [a1 partiallyLoaded];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_performDelayedTasks(void *a1, const char *a2, ...)
{
  return [a1 performDelayedTasks];
}

id objc_msgSend_performRemoteSearches(void *a1, const char *a2, ...)
{
  return [a1 performRemoteSearches];
}

id objc_msgSend_performSearch(void *a1, const char *a2, ...)
{
  return [a1 performSearch];
}

id objc_msgSend_performUpgradeIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 performUpgradeIfNecessary];
}

id objc_msgSend_persistAllInboxesStateToMaild(void *a1, const char *a2, ...)
{
  return [a1 persistAllInboxesStateToMaild];
}

id objc_msgSend_persistence(void *a1, const char *a2, ...)
{
  return [a1 persistence];
}

id objc_msgSend_persistentIDForMigration(void *a1, const char *a2, ...)
{
  return [a1 persistentIDForMigration];
}

id objc_msgSend_persistentStorage(void *a1, const char *a2, ...)
{
  return [a1 persistentStorage];
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personaIdentifier];
}

id objc_msgSend_placeholderDirectory(void *a1, const char *a2, ...)
{
  return [a1 placeholderDirectory];
}

id objc_msgSend_playSound(void *a1, const char *a2, ...)
{
  return [a1 playSound];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_portNumber(void *a1, const char *a2, ...)
{
  return [a1 portNumber];
}

id objc_msgSend_powerObservable(void *a1, const char *a2, ...)
{
  return [a1 powerObservable];
}

id objc_msgSend_powernapProcessor(void *a1, const char *a2, ...)
{
  return [a1 powernapProcessor];
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return [a1 predicate];
}

id objc_msgSend_predicateForFlaggedMessages(void *a1, const char *a2, ...)
{
  return [a1 predicateForFlaggedMessages];
}

id objc_msgSend_predicateForIncludesMeMessages(void *a1, const char *a2, ...)
{
  return [a1 predicateForIncludesMeMessages];
}

id objc_msgSend_predicateForMessagesWithAttachments(void *a1, const char *a2, ...)
{
  return [a1 predicateForMessagesWithAttachments];
}

id objc_msgSend_predicateForMuteMessages(void *a1, const char *a2, ...)
{
  return [a1 predicateForMuteMessages];
}

id objc_msgSend_predicateForNotifyMessages(void *a1, const char *a2, ...)
{
  return [a1 predicateForNotifyMessages];
}

id objc_msgSend_predicateForPrimaryMessages(void *a1, const char *a2, ...)
{
  return [a1 predicateForPrimaryMessages];
}

id objc_msgSend_predicateForTodayMessages(void *a1, const char *a2, ...)
{
  return [a1 predicateForTodayMessages];
}

id objc_msgSend_predicateForUnreadMessages(void *a1, const char *a2, ...)
{
  return [a1 predicateForUnreadMessages];
}

id objc_msgSend_preferredCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 preferredCharacterSet];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredEncoding(void *a1, const char *a2, ...)
{
  return [a1 preferredEncoding];
}

id objc_msgSend_preferredSendingEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 preferredSendingEmailAddress];
}

id objc_msgSend_prepareForWriting(void *a1, const char *a2, ...)
{
  return [a1 prepareForWriting];
}

id objc_msgSend_prepareToRebuildActiveAccountsClausesAndExpressions(void *a1, const char *a2, ...)
{
  return [a1 prepareToRebuildActiveAccountsClausesAndExpressions];
}

id objc_msgSend_primaryMailboxUid(void *a1, const char *a2, ...)
{
  return [a1 primaryMailboxUid];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_privacyProtectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 privacyProtectionEnabled];
}

id objc_msgSend_privateQueue(void *a1, const char *a2, ...)
{
  return [a1 privateQueue];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processQueue(void *a1, const char *a2, ...)
{
  return [a1 processQueue];
}

id objc_msgSend_processorCount(void *a1, const char *a2, ...)
{
  return [a1 processorCount];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return [a1 promise];
}

id objc_msgSend_protectedDataAvailability(void *a1, const char *a2, ...)
{
  return [a1 protectedDataAvailability];
}

id objc_msgSend_protectedDataAvailable(void *a1, const char *a2, ...)
{
  return [a1 protectedDataAvailable];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return [a1 protocol];
}

id objc_msgSend_purgeableAccounts(void *a1, const char *a2, ...)
{
  return [a1 purgeableAccounts];
}

id objc_msgSend_purgeableStorage(void *a1, const char *a2, ...)
{
  return [a1 purgeableStorage];
}

id objc_msgSend_pushedMailboxJobList(void *a1, const char *a2, ...)
{
  return [a1 pushedMailboxJobList];
}

id objc_msgSend_pushedMailboxUids(void *a1, const char *a2, ...)
{
  return [a1 pushedMailboxUids];
}

id objc_msgSend_qualifier(void *a1, const char *a2, ...)
{
  return [a1 qualifier];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_queryHandler(void *a1, const char *a2, ...)
{
  return [a1 queryHandler];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rawData(void *a1, const char *a2, ...)
{
  return [a1 rawData];
}

id objc_msgSend_read(void *a1, const char *a2, ...)
{
  return [a1 read];
}

id objc_msgSend_readLater(void *a1, const char *a2, ...)
{
  return [a1 readLater];
}

id objc_msgSend_readStatus(void *a1, const char *a2, ...)
{
  return [a1 readStatus];
}

id objc_msgSend_recentsLibrary(void *a1, const char *a2, ...)
{
  return [a1 recentsLibrary];
}

id objc_msgSend_reference(void *a1, const char *a2, ...)
{
  return [a1 reference];
}

id objc_msgSend_referenceMessageId(void *a1, const char *a2, ...)
{
  return [a1 referenceMessageId];
}

id objc_msgSend_referencedConversations(void *a1, const char *a2, ...)
{
  return [a1 referencedConversations];
}

id objc_msgSend_referencedMailboxes(void *a1, const char *a2, ...)
{
  return [a1 referencedMailboxes];
}

id objc_msgSend_refreshAsync(void *a1, const char *a2, ...)
{
  return [a1 refreshAsync];
}

id objc_msgSend_refreshCachedValues(void *a1, const char *a2, ...)
{
  return [a1 refreshCachedValues];
}

id objc_msgSend_registerForWebRuleNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForWebRuleNotifications];
}

id objc_msgSend_registerSystemTask(void *a1, const char *a2, ...)
{
  return [a1 registerSystemTask];
}

id objc_msgSend_registerXPCActivityForResettingXPCAlarms(void *a1, const char *a2, ...)
{
  return [a1 registerXPCActivityForResettingXPCAlarms];
}

id objc_msgSend_registry(void *a1, const char *a2, ...)
{
  return [a1 registry];
}

id objc_msgSend_reloadAccounts(void *a1, const char *a2, ...)
{
  return [a1 reloadAccounts];
}

id objc_msgSend_reloadDeliveryAccounts(void *a1, const char *a2, ...)
{
  return [a1 reloadDeliveryAccounts];
}

id objc_msgSend_remindMeDate(void *a1, const char *a2, ...)
{
  return [a1 remindMeDate];
}

id objc_msgSend_remindMeNotificationController(void *a1, const char *a2, ...)
{
  return [a1 remindMeNotificationController];
}

id objc_msgSend_remoteClients(void *a1, const char *a2, ...)
{
  return [a1 remoteClients];
}

id objc_msgSend_remoteClientsProvider(void *a1, const char *a2, ...)
{
  return [a1 remoteClientsProvider];
}

id objc_msgSend_remoteID(void *a1, const char *a2, ...)
{
  return [a1 remoteID];
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectInterface];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_remoteSearchDidFinish(void *a1, const char *a2, ...)
{
  return [a1 remoteSearchDidFinish];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllPersistedCommands(void *a1, const char *a2, ...)
{
  return [a1 removeAllPersistedCommands];
}

id objc_msgSend_reportWillDownloadFirstMessages(void *a1, const char *a2, ...)
{
  return [a1 reportWillDownloadFirstMessages];
}

id objc_msgSend_representedAccount(void *a1, const char *a2, ...)
{
  return [a1 representedAccount];
}

id objc_msgSend_representedObjectID(void *a1, const char *a2, ...)
{
  return [a1 representedObjectID];
}

id objc_msgSend_representingMailbox(void *a1, const char *a2, ...)
{
  return [a1 representingMailbox];
}

id objc_msgSend_representingMailboxes(void *a1, const char *a2, ...)
{
  return [a1 representingMailboxes];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestLimiter(void *a1, const char *a2, ...)
{
  return [a1 requestLimiter];
}

id objc_msgSend_requestSummary(void *a1, const char *a2, ...)
{
  return [a1 requestSummary];
}

id objc_msgSend_requestWatchAccounts(void *a1, const char *a2, ...)
{
  return [a1 requestWatchAccounts];
}

id objc_msgSend_requests(void *a1, const char *a2, ...)
{
  return [a1 requests];
}

id objc_msgSend_requiredEntitlement(void *a1, const char *a2, ...)
{
  return [a1 requiredEntitlement];
}

id objc_msgSend_requiredHeaders(void *a1, const char *a2, ...)
{
  return [a1 requiredHeaders];
}

id objc_msgSend_requiresBody(void *a1, const char *a2, ...)
{
  return [a1 requiresBody];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetAccountsSynchronouslyOnMainThread(void *a1, const char *a2, ...)
{
  return [a1 resetAccountsSynchronouslyOnMainThread];
}

id objc_msgSend_resetExponentialBackoff(void *a1, const char *a2, ...)
{
  return [a1 resetExponentialBackoff];
}

id objc_msgSend_resetRemindMeAlarmIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 resetRemindMeAlarmIfNeeded];
}

id objc_msgSend_resetSendLaterAlarmIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 resetSendLaterAlarmIfNeeded];
}

id objc_msgSend_resetUserNotificationCenterTopics(void *a1, const char *a2, ...)
{
  return [a1 resetUserNotificationCenterTopics];
}

id objc_msgSend_resignCurrent(void *a1, const char *a2, ...)
{
  return [a1 resignCurrent];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_responsiveness(void *a1, const char *a2, ...)
{
  return [a1 responsiveness];
}

id objc_msgSend_restrictedFromSendingExternally(void *a1, const char *a2, ...)
{
  return [a1 restrictedFromSendingExternally];
}

id objc_msgSend_restrictedFromSyncingRecents(void *a1, const char *a2, ...)
{
  return [a1 restrictedFromSyncingRecents];
}

id objc_msgSend_restrictedFromTransferingMessagesToOtherAccounts(void *a1, const char *a2, ...)
{
  return [a1 restrictedFromTransferingMessagesToOtherAccounts];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resultIncludesProtectedMessages(void *a1, const char *a2, ...)
{
  return [a1 resultIncludesProtectedMessages];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resultsQueue(void *a1, const char *a2, ...)
{
  return [a1 resultsQueue];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeForUpdates(void *a1, const char *a2, ...)
{
  return [a1 resumeForUpdates];
}

id objc_msgSend_resumeFullDownloadProcessing(void *a1, const char *a2, ...)
{
  return [a1 resumeFullDownloadProcessing];
}

id objc_msgSend_retainArguments(void *a1, const char *a2, ...)
{
  return [a1 retainArguments];
}

id objc_msgSend_retry(void *a1, const char *a2, ...)
{
  return [a1 retry];
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return [a1 retryCount];
}

id objc_msgSend_revert(void *a1, const char *a2, ...)
{
  return [a1 revert];
}

id objc_msgSend_rootMailbox(void *a1, const char *a2, ...)
{
  return [a1 rootMailbox];
}

id objc_msgSend_rootMailboxNode(void *a1, const char *a2, ...)
{
  return [a1 rootMailboxNode];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_rules(void *a1, const char *a2, ...)
{
  return [a1 rules];
}

id objc_msgSend_rulesController(void *a1, const char *a2, ...)
{
  return [a1 rulesController];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runSynchronously(void *a1, const char *a2, ...)
{
  return [a1 runSynchronously];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return [a1 save];
}

id objc_msgSend_saveOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 saveOperationQueue];
}

id objc_msgSend_savePersistentAccount(void *a1, const char *a2, ...)
{
  return [a1 savePersistentAccount];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scanner(void *a1, const char *a2, ...)
{
  return [a1 scanner];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return [a1 schedule];
}

id objc_msgSend_scheduleDelayedStartupTasks(void *a1, const char *a2, ...)
{
  return [a1 scheduleDelayedStartupTasks];
}

id objc_msgSend_scheduleIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 scheduleIfNeeded];
}

id objc_msgSend_scheduleLibraryCompressionIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 scheduleLibraryCompressionIfNeeded];
}

id objc_msgSend_scheduleRecurringActivity(void *a1, const char *a2, ...)
{
  return [a1 scheduleRecurringActivity];
}

id objc_msgSend_scheduler(void *a1, const char *a2, ...)
{
  return [a1 scheduler];
}

id objc_msgSend_schedulerType(void *a1, const char *a2, ...)
{
  return [a1 schedulerType];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_screenWidth(void *a1, const char *a2, ...)
{
  return [a1 screenWidth];
}

id objc_msgSend_scrollableHint(void *a1, const char *a2, ...)
{
  return [a1 scrollableHint];
}

id objc_msgSend_searchContext(void *a1, const char *a2, ...)
{
  return [a1 searchContext];
}

id objc_msgSend_searchManager(void *a1, const char *a2, ...)
{
  return [a1 searchManager];
}

id objc_msgSend_searchProgress(void *a1, const char *a2, ...)
{
  return [a1 searchProgress];
}

id objc_msgSend_searchResultIdentifier(void *a1, const char *a2, ...)
{
  return [a1 searchResultIdentifier];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_securityScopeToken(void *a1, const char *a2, ...)
{
  return [a1 securityScopeToken];
}

id objc_msgSend_selectedItems(void *a1, const char *a2, ...)
{
  return [a1 selectedItems];
}

id objc_msgSend_selectedMailboxes(void *a1, const char *a2, ...)
{
  return [a1 selectedMailboxes];
}

id objc_msgSend_selectedRange(void *a1, const char *a2, ...)
{
  return [a1 selectedRange];
}

id objc_msgSend_sendLaterFolder(void *a1, const char *a2, ...)
{
  return [a1 sendLaterFolder];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_senderAddress(void *a1, const char *a2, ...)
{
  return [a1 senderAddress];
}

id objc_msgSend_senderAddressComment(void *a1, const char *a2, ...)
{
  return [a1 senderAddressComment];
}

id objc_msgSend_senderCommentedAddress(void *a1, const char *a2, ...)
{
  return [a1 senderCommentedAddress];
}

id objc_msgSend_senderFullAddress(void *a1, const char *a2, ...)
{
  return [a1 senderFullAddress];
}

id objc_msgSend_senders(void *a1, const char *a2, ...)
{
  return [a1 senders];
}

id objc_msgSend_sendersIfCached(void *a1, const char *a2, ...)
{
  return [a1 sendersIfCached];
}

id objc_msgSend_sendingEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 sendingEmailAddress];
}

id objc_msgSend_sendingType(void *a1, const char *a2, ...)
{
  return [a1 sendingType];
}

id objc_msgSend_serverCountMailboxScope(void *a1, const char *a2, ...)
{
  return [a1 serverCountMailboxScope];
}

id objc_msgSend_serverId(void *a1, const char *a2, ...)
{
  return [a1 serverId];
}

id objc_msgSend_serverMessageCount(void *a1, const char *a2, ...)
{
  return [a1 serverMessageCount];
}

id objc_msgSend_serverMessagesIndexer(void *a1, const char *a2, ...)
{
  return [a1 serverMessagesIndexer];
}

id objc_msgSend_serverSearchContext(void *a1, const char *a2, ...)
{
  return [a1 serverSearchContext];
}

id objc_msgSend_serviceForMail(void *a1, const char *a2, ...)
{
  return [a1 serviceForMail];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setFlagged(void *a1, const char *a2, ...)
{
  return [a1 setFlagged];
}

id objc_msgSend_setRead(void *a1, const char *a2, ...)
{
  return [a1 setRead];
}

id objc_msgSend_setStroke(void *a1, const char *a2, ...)
{
  return [a1 setStroke];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_settingsObservers(void *a1, const char *a2, ...)
{
  return [a1 settingsObservers];
}

id objc_msgSend_sharedAggregateDictionary(void *a1, const char *a2, ...)
{
  return [a1 sharedAggregateDictionary];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedChangeManager(void *a1, const char *a2, ...)
{
  return [a1 sharedChangeManager];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedDeliveryQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedDeliveryQueue];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedInvocationQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedInvocationQueue];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedNetworkObserver];
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return [a1 sharedRegistry];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_sharedStakeholder(void *a1, const char *a2, ...)
{
  return [a1 sharedStakeholder];
}

id objc_msgSend_sharedStorage(void *a1, const char *a2, ...)
{
  return [a1 sharedStorage];
}

id objc_msgSend_sharedStore(void *a1, const char *a2, ...)
{
  return [a1 sharedStore];
}

id objc_msgSend_shouldAcceptClient(void *a1, const char *a2, ...)
{
  return [a1 shouldAcceptClient];
}

id objc_msgSend_shouldArchiveByDefault(void *a1, const char *a2, ...)
{
  return [a1 shouldArchiveByDefault];
}

id objc_msgSend_shouldCancel(void *a1, const char *a2, ...)
{
  return [a1 shouldCancel];
}

id objc_msgSend_shouldCompact(void *a1, const char *a2, ...)
{
  return [a1 shouldCompact];
}

id objc_msgSend_shouldDeleteInPlace(void *a1, const char *a2, ...)
{
  return [a1 shouldDeleteInPlace];
}

id objc_msgSend_shouldEncrypt(void *a1, const char *a2, ...)
{
  return [a1 shouldEncrypt];
}

id objc_msgSend_shouldGrowFetchWindow(void *a1, const char *a2, ...)
{
  return [a1 shouldGrowFetchWindow];
}

id objc_msgSend_shouldHealFromAlternateAccount(void *a1, const char *a2, ...)
{
  return [a1 shouldHealFromAlternateAccount];
}

id objc_msgSend_shouldHideInbox(void *a1, const char *a2, ...)
{
  return [a1 shouldHideInbox];
}

id objc_msgSend_shouldLoadMessageBody(void *a1, const char *a2, ...)
{
  return [a1 shouldLoadMessageBody];
}

id objc_msgSend_shouldLoadOlderMessages(void *a1, const char *a2, ...)
{
  return [a1 shouldLoadOlderMessages];
}

id objc_msgSend_shouldSetSummary(void *a1, const char *a2, ...)
{
  return [a1 shouldSetSummary];
}

id objc_msgSend_shouldSign(void *a1, const char *a2, ...)
{
  return [a1 shouldSign];
}

id objc_msgSend_shouldSync(void *a1, const char *a2, ...)
{
  return [a1 shouldSync];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return [a1 signal];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_signpostID(void *a1, const char *a2, ...)
{
  return [a1 signpostID];
}

id objc_msgSend_signpostLog(void *a1, const char *a2, ...)
{
  return [a1 signpostLog];
}

id objc_msgSend_simpleAddress(void *a1, const char *a2, ...)
{
  return [a1 simpleAddress];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_snapshotInvalidator(void *a1, const char *a2, ...)
{
  return [a1 snapshotInvalidator];
}

id objc_msgSend_sortedVIPs(void *a1, const char *a2, ...)
{
  return [a1 sortedVIPs];
}

id objc_msgSend_soundController(void *a1, const char *a2, ...)
{
  return [a1 soundController];
}

id objc_msgSend_soundSetting(void *a1, const char *a2, ...)
{
  return [a1 soundSetting];
}

id objc_msgSend_soundsToPlay(void *a1, const char *a2, ...)
{
  return [a1 soundsToPlay];
}

id objc_msgSend_soundsToPlayWaitTimeoutTS(void *a1, const char *a2, ...)
{
  return [a1 soundsToPlayWaitTimeoutTS];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return [a1 sourceType];
}

id objc_msgSend_specialMailboxCountObserver(void *a1, const char *a2, ...)
{
  return [a1 specialMailboxCountObserver];
}

id objc_msgSend_specialMailboxFavoriteItem(void *a1, const char *a2, ...)
{
  return [a1 specialMailboxFavoriteItem];
}

id objc_msgSend_standaloneState(void *a1, const char *a2, ...)
{
  return [a1 standaloneState];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startListeningForBatterySaverNotifications(void *a1, const char *a2, ...)
{
  return [a1 startListeningForBatterySaverNotifications];
}

id objc_msgSend_startListeningForNotifications(void *a1, const char *a2, ...)
{
  return [a1 startListeningForNotifications];
}

id objc_msgSend_startObserving(void *a1, const char *a2, ...)
{
  return [a1 startObserving];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_startUpgradeIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 startUpgradeIfNecessary];
}

id objc_msgSend_startup(void *a1, const char *a2, ...)
{
  return [a1 startup];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statisticsKind(void *a1, const char *a2, ...)
{
  return [a1 statisticsKind];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopDate(void *a1, const char *a2, ...)
{
  return [a1 stopDate];
}

id objc_msgSend_stopEarly(void *a1, const char *a2, ...)
{
  return [a1 stopEarly];
}

id objc_msgSend_stopListeningForNotifications(void *a1, const char *a2, ...)
{
  return [a1 stopListeningForNotifications];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return [a1 storage];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_stores(void *a1, const char *a2, ...)
{
  return [a1 stores];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringHash(void *a1, const char *a2, ...)
{
  return [a1 stringHash];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_subItems(void *a1, const char *a2, ...)
{
  return [a1 subItems];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return [a1 subject];
}

id objc_msgSend_subjectString(void *a1, const char *a2, ...)
{
  return [a1 subjectString];
}

id objc_msgSend_subjectWithoutPrefix(void *a1, const char *a2, ...)
{
  return [a1 subjectWithoutPrefix];
}

id objc_msgSend_submissionDate(void *a1, const char *a2, ...)
{
  return [a1 submissionDate];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_subtype(void *a1, const char *a2, ...)
{
  return [a1 subtype];
}

id objc_msgSend_summarizationSetting(void *a1, const char *a2, ...)
{
  return [a1 summarizationSetting];
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return [a1 summary];
}

id objc_msgSend_summaryClientsLock(void *a1, const char *a2, ...)
{
  return [a1 summaryClientsLock];
}

id objc_msgSend_summaryPromise(void *a1, const char *a2, ...)
{
  return [a1 summaryPromise];
}

id objc_msgSend_supportsMailDrop(void *a1, const char *a2, ...)
{
  return [a1 supportsMailDrop];
}

id objc_msgSend_supportsPurge(void *a1, const char *a2, ...)
{
  return [a1 supportsPurge];
}

id objc_msgSend_supportsSyncingReadState(void *a1, const char *a2, ...)
{
  return [a1 supportsSyncingReadState];
}

id objc_msgSend_supportsThreadOperations(void *a1, const char *a2, ...)
{
  return [a1 supportsThreadOperations];
}

id objc_msgSend_suppressionContexts(void *a1, const char *a2, ...)
{
  return [a1 suppressionContexts];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_syncKey(void *a1, const char *a2, ...)
{
  return [a1 syncKey];
}

id objc_msgSend_syncProvider(void *a1, const char *a2, ...)
{
  return [a1 syncProvider];
}

id objc_msgSend_syncValue(void *a1, const char *a2, ...)
{
  return [a1 syncValue];
}

id objc_msgSend_syncedByAccount(void *a1, const char *a2, ...)
{
  return [a1 syncedByAccount];
}

id objc_msgSend_syncedByMailbox(void *a1, const char *a2, ...)
{
  return [a1 syncedByMailbox];
}

id objc_msgSend_syncedMailboxes(void *a1, const char *a2, ...)
{
  return [a1 syncedMailboxes];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemUserNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 systemUserNotificationCenter];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_targetContentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 targetContentIdentifier];
}

id objc_msgSend_taskAssertion(void *a1, const char *a2, ...)
{
  return [a1 taskAssertion];
}

id objc_msgSend_taskManager(void *a1, const char *a2, ...)
{
  return [a1 taskManager];
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return [a1 tearDown];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textData(void *a1, const char *a2, ...)
{
  return [a1 textData];
}

id objc_msgSend_threadMuteMessageCriterion(void *a1, const char *a2, ...)
{
  return [a1 threadMuteMessageCriterion];
}

id objc_msgSend_threadNotifyMessageCriterion(void *a1, const char *a2, ...)
{
  return [a1 threadNotifyMessageCriterion];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_to(void *a1, const char *a2, ...)
{
  return [a1 to];
}

id objc_msgSend_todayMessageCriterion(void *a1, const char *a2, ...)
{
  return [a1 todayMessageCriterion];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_topLevelPart(void *a1, const char *a2, ...)
{
  return [a1 topLevelPart];
}

id objc_msgSend_topicIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 topicIdentifiers];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_transformer(void *a1, const char *a2, ...)
{
  return [a1 transformer];
}

id objc_msgSend_transient(void *a1, const char *a2, ...)
{
  return [a1 transient];
}

id objc_msgSend_transientDraftsFolder(void *a1, const char *a2, ...)
{
  return [a1 transientDraftsFolder];
}

id objc_msgSend_trashCompactor(void *a1, const char *a2, ...)
{
  return [a1 trashCompactor];
}

id objc_msgSend_treeOfAllGenericMailboxes(void *a1, const char *a2, ...)
{
  return [a1 treeOfAllGenericMailboxes];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_unconfirmedLostMessages(void *a1, const char *a2, ...)
{
  return [a1 unconfirmedLostMessages];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_uniqueIDAndDisplayName(void *a1, const char *a2, ...)
{
  return [a1 uniqueIDAndDisplayName];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return [a1 uniqueId];
}

id objc_msgSend_uniqueIdForPersistentConnection(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdForPersistentConnection];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unreadCountToken(void *a1, const char *a2, ...)
{
  return [a1 unreadCountToken];
}

id objc_msgSend_unreadMessageCriterion(void *a1, const char *a2, ...)
{
  return [a1 unreadMessageCriterion];
}

id objc_msgSend_unregisterAndTearDown(void *a1, const char *a2, ...)
{
  return [a1 unregisterAndTearDown];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateSharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 updateSharedPreferences];
}

id objc_msgSend_upgrader(void *a1, const char *a2, ...)
{
  return [a1 upgrader];
}

id objc_msgSend_uploadContent(void *a1, const char *a2, ...)
{
  return [a1 uploadContent];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_useAccountSignatures(void *a1, const char *a2, ...)
{
  return [a1 useAccountSignatures];
}

id objc_msgSend_useLocalIndex(void *a1, const char *a2, ...)
{
  return [a1 useLocalIndex];
}

id objc_msgSend_useMailboxFrecencyRanking(void *a1, const char *a2, ...)
{
  return [a1 useMailboxFrecencyRanking];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userNotificationCenterController(void *a1, const char *a2, ...)
{
  return [a1 userNotificationCenterController];
}

id objc_msgSend_userProfileProvider(void *a1, const char *a2, ...)
{
  return [a1 userProfileProvider];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_usesSSL(void *a1, const char *a2, ...)
{
  return [a1 usesSSL];
}

id objc_msgSend_validationInvocation(void *a1, const char *a2, ...)
{
  return [a1 validationInvocation];
}

id objc_msgSend_verifySkeletonMessage(void *a1, const char *a2, ...)
{
  return [a1 verifySkeletonMessage];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_vipManager(void *a1, const char *a2, ...)
{
  return [a1 vipManager];
}

id objc_msgSend_vipReader(void *a1, const char *a2, ...)
{
  return [a1 vipReader];
}

id objc_msgSend_visibleItems(void *a1, const char *a2, ...)
{
  return [a1 visibleItems];
}

id objc_msgSend_visibleMailboxObjectIDs(void *a1, const char *a2, ...)
{
  return [a1 visibleMailboxObjectIDs];
}

id objc_msgSend_visibleMailboxes(void *a1, const char *a2, ...)
{
  return [a1 visibleMailboxes];
}

id objc_msgSend_visibleMailboxesToSyncByMailbox(void *a1, const char *a2, ...)
{
  return [a1 visibleMailboxesToSyncByMailbox];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_wasChangedExternally(void *a1, const char *a2, ...)
{
  return [a1 wasChangedExternally];
}

id objc_msgSend_watchAccounts(void *a1, const char *a2, ...)
{
  return [a1 watchAccounts];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_weakToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 weakToWeakObjectsMapTable];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_willFlag(void *a1, const char *a2, ...)
{
  return [a1 willFlag];
}

id objc_msgSend_willMarkRead(void *a1, const char *a2, ...)
{
  return [a1 willMarkRead];
}

id objc_msgSend_willMarkUnread(void *a1, const char *a2, ...)
{
  return [a1 willMarkUnread];
}

id objc_msgSend_willUnflag(void *a1, const char *a2, ...)
{
  return [a1 willUnflag];
}

id objc_msgSend_willUseGeneratedSummaries(void *a1, const char *a2, ...)
{
  return [a1 willUseGeneratedSummaries];
}

id objc_msgSend_xpcActivityInterval(void *a1, const char *a2, ...)
{
  return [a1 xpcActivityInterval];
}