void sub_1000047A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004940(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004CB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004F10(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 tokenID];
  v5 = [v6 stringRepresentation];
  [v4 updateForTokenID:v5 items:*(void *)(a1 + 40)];
}

void sub_100004FE8(id a1)
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v1 = +[NSArray arrayWithObjects:v4 count:6];
  uint64_t v2 = +[NSSet setWithArray:v1];
  v3 = (void *)qword_100028020;
  qword_100028020 = v2;
}

void sub_100005A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100005A74()
{
  if (qword_100028028 != -1) {
    dispatch_once(&qword_100028028, &stru_100020670);
  }
  v0 = (void *)qword_100028030;

  return v0;
}

void sub_100005AC8(uint64_t a1)
{
  v3 = sub_100005A74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v15 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Got SIGTERM, shutting down", v15, 2u);
  }

  id v4 = [*(id *)(a1 + 32) tokenServer];
  [v4 stop];

  v5 = [*(id *)(a1 + 32) slotWatcher];
  [v5 stop];

  id v6 = [*(id *)(a1 + 32) slotServer];
  [v6 stop];

  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = 0;

  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 16);
  *(void *)(v13 + 16) = 0;

  exit(0);
}

void sub_100005BB8(uint64_t a1)
{
  uint64_t v2 = sub_100005A74();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100013D98(v2);
  }

  v3 = [*(id *)(a1 + 32) slotServer];
  [v3 notifyDesktopUp];
}

void sub_100005C18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tokenRegistry];
  [v2 loadTokensFromStore:@"ctkd"];

  id v4 = [*(id *)(a1 + 32) tokenRegistry];
  v3 = [*(id *)(a1 + 32) tokenServer];
  [v3 setTokenRegistry:v4];
}

void sub_100005CA0(uint64_t a1)
{
  uint64_t v2 = sub_100005A74();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100013DDC(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained ensureSlotWatcherIsRunning];
}

void start(uint64_t a1, uint64_t a2)
{
  [[[TKCtkdRunner alloc] initWithArgc:a1 argv:a2] run];
  dispatch_main();
}

void sub_100005DDC(id a1)
{
  qword_100028030 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "ctkd");

  _objc_release_x1();
}

id sub_10000663C()
{
  if (qword_100028038 != -1) {
    dispatch_once(&qword_100028038, &stru_100020708);
  }
  v0 = (void *)qword_100028040;

  return v0;
}

void sub_1000069FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006AB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006B50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006BF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006CC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000706C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007144(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007354(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000742C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000076C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007C54(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000663C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001438C();
  }

  v30 = +[NSMutableSet set];
  v49[0] = kSecClassCertificate;
  v49[1] = kSecClassKey;
  +[NSArray arrayWithObjects:v49 count:2];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v27 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v41;
    location = (id *)(a1 + 32);
    id v26 = v3;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v5;
        uint64_t v6 = *(void *)(*((void *)&v40 + 1) + 8 * v5);
        v46[0] = kSecClass;
        v46[1] = kSecAttrAccessGroup;
        v47[0] = v6;
        v47[1] = kSecAttrAccessGroupToken;
        v46[2] = kSecReturnAttributes;
        v47[2] = &__kCFBooleanTrue;
        uint64_t v7 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v28 = (void *)v7;
        v8 = objc_msgSend(v3, "query:");
        id v9 = [v8 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v37;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v37 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [*(id *)(*((void *)&v36 + 1) + 8 * i) objectForKeyedSubscript:kSecAttrTokenID];
              if (v13)
              {
                id v14 = [objc_alloc((Class)TKTokenID) initWithTokenID:v13];
                id WeakRetained = objc_loadWeakRetained(location);
                v16 = [WeakRetained tokensByTokenID];
                v17 = [v16 objectForKeyedSubscript:v14];

                if (!v17) {
                  [v30 addObject:v14];
                }
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v10);
        }

        uint64_t v5 = v29 + 1;
        id v3 = v26;
      }
      while ((id)(v29 + 1) != v27);
      id v27 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v27);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v18 = v30;
  id v19 = [v18 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) stringRepresentation];
        [v3 updateForTokenID:v23 items:0];
      }
      id v20 = [v18 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v20);
  }
}

void sub_1000086B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_10000870C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = [a3 _plugIn];
  uint64_t v6 = [v8 uuid];
  uint64_t v7 = [v6 UUIDString];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

void sub_1000087A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [v6 objectForKeyedSubscript:v5];
  unsigned __int8 v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = sub_10000663C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100014408();
    }

    [*(id *)(a1 + 40) addObject:v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_100008B70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009430(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000097C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100009C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009E20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009F6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A0E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A258(id a1)
{
  qword_100028040 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "tokenhost");

  _objc_release_x1();
}

void sub_10000A2B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000A2D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000A2EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000A308(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000A8FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000B334()
{
  if (qword_100028048 != -1) {
    dispatch_once(&qword_100028048, &stru_1000207B0);
  }
  v0 = (void *)qword_100028050;

  return v0;
}

id sub_10000B618(uint64_t a1)
{
  return [*(id *)(a1 + 32) tokenArrived];
}

id sub_10000B620(uint64_t a1)
{
  return [*(id *)(a1 + 32) tokenRemoved];
}

void sub_10000B760(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000BDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_10000BDF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000BE08(uint64_t a1)
{
}

uint64_t sub_10000BE10(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) selectApplication:*(void *)(a1 + 40) error:a2]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  }
  return 1;
}

void sub_10000C37C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,os_activity_scope_state_s state)
{
}

void sub_10000C550(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C954(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10000B334();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100014788((uint64_t)v2, v3);
  }
}

void sub_10000C9AC(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained(WeakRetained + 1);
  [v2 invalidate];

  objc_storeWeak(WeakRetained + 1, 0);
  id v3 = sub_10000B334();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100014800(v3);
  }
}

void sub_10000CC0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CD18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CEBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CF3C(id a1)
{
  qword_100028050 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "slotwtch");

  _objc_release_x1();
}

void sub_10000CF80(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id sub_10000D068()
{
  if (qword_100028068 != -1) {
    dispatch_once(&qword_100028068, &stru_100020840);
  }
  v0 = (void *)qword_100028070;

  return v0;
}

void sub_10000D35C(uint64_t a1)
{
  if ([(id)objc_opt_class() isUnlocked])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v15 = [*(id *)(a1 + 32) operations];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v15);
  }
  else
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 24);
    if (!v3)
    {
      id v4 = [&__NSArray0__struct mutableCopy];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v4;

      uint64_t v7 = os_transaction_create();
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(v8 + 32);
      *(void *)(v8 + 32) = v7;

      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = (int *)(v10 + 16);
      v12 = *(NSObject **)(v10 + 8);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000D528;
      handler[3] = &unk_1000207D8;
      objc_copyWeak(&v17, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", v11, v12, handler);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
      id v3 = *(void **)(*(void *)(a1 + 32) + 24);
    }
    id v13 = objc_retainBlock(*(id *)(a1 + 40));
    [v3 addObject:v13];

    id v14 = sub_10000D068();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100014934(v14);
    }
  }
}

void sub_10000D50C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000D528(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([(id)objc_opt_class() isUnlocked])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = *((id *)WeakRetained + 3);
    id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v12;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v6);
          uint64_t v8 = objc_msgSend(WeakRetained, "operations", (void)v11);
          (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

          uint64_t v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }

    uint64_t v9 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = 0;

    notify_cancel(*((_DWORD *)WeakRetained + 4));
    uint64_t v10 = (void *)*((void *)WeakRetained + 4);
    *((void *)WeakRetained + 4) = 0;

    *((_DWORD *)WeakRetained + 4) = 0;
  }
}

void sub_10000D724(id a1)
{
  qword_100028058 = objc_alloc_init(TKHostKeychainOperations);

  _objc_release_x1();
}

void sub_10000D7B0(id a1)
{
  qword_100028070 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "keychain");

  _objc_release_x1();
}

id sub_10000DC3C()
{
  if (qword_100028078 != -1) {
    dispatch_once(&qword_100028078, &stru_1000208E8);
  }
  v0 = (void *)qword_100028080;

  return v0;
}

id sub_10000DC90(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeSlotRegistration:");
}

id sub_10000DF04(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeClient:");
}

void sub_10000E1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000E688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_10000E730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000E794(id a1)
{
  id v1 = objc_alloc((Class)NSXPCConnection);
  id v2 = [v1 initWithMachServiceName:TKClientTokenServerPortName options:0];
  id v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TKClientTokenServerProtocol];
  [v2 setRemoteObjectInterface:v3];

  [v2 resume];
  id v4 = sub_10000DC3C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100014B0C(v2);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000E910;
  v10[3] = &unk_1000208A8;
  id v5 = v2;
  id v11 = v5;
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E974;
  v8[3] = &unk_100020600;
  id v9 = v5;
  id v7 = v5;
  [v6 ensureSlotWatcherRunningWithReply:v8];
}

void sub_10000E910(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10000DC3C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100014B88(a1, (uint64_t)v3, v4);
  }
}

id sub_10000E974(uint64_t a1)
{
  id v2 = sub_10000DC3C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100014C18(a1);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_10000EBDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000EEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000EEE0(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v1 = sub_10000DC3C();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100014D04(v1);
  }
}

void sub_10000EF94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F014(id a1)
{
  qword_100028080 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "smartcard");

  _objc_release_x1();
}

void sub_10000F070(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_10000F194(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

void sub_10000F244(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000F450()
{
  if (qword_100028088 != -1) {
    dispatch_once(&qword_100028088, &stru_100020998);
  }
  v0 = (void *)qword_100028090;

  return v0;
}

void sub_10000F794(uint64_t a1)
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_10000F934;
  v13[4] = sub_10000F944;
  id v14 = 0;
  id v2 = *(void **)(a1 + 40);
  id obj = 0;
  uint64_t v3 = [v2 connectionWithError:&obj];
  objc_storeStrong(&v14, obj);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 16))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000F94C;
    v7[3] = &unk_100020910;
    v7[4] = v6;
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 40);
    id v11 = v13;
    id v10 = *(id *)(a1 + 56);
    _os_activity_initiate((void *)&_mh_execute_header, "evaluate token access request", OS_ACTIVITY_FLAG_DEFAULT, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  _Block_object_dispose(v13, 8);
}

void sub_10000F91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F934(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F944(uint64_t a1)
{
}

void sub_10000F94C(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  unsigned __int8 v6 = [v2 isCaller:v3 allowedForToken:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = a1[7];
  if (v6)
  {
    id v8 = [*(id *)(a1[4] + 16) endpoint];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    (*(void (**)(void, void, void))(v7 + 16))(a1[7], 0, *(void *)(*(void *)(a1[8] + 8) + 40));
  }
}

void sub_10000FAD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FBB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FC64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010388(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_10001078C(id a1)
{
  uint64_t v1 = sub_10000F450();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100014E38(v1, v2, v3);
  }
}

void sub_100010990(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000109B8(id a1)
{
  uint64_t v1 = sub_10000F450();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100014E74(v1, v2, v3);
  }
}

void sub_100010EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100010FCC(id a1)
{
  qword_100028090 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "tkserver");

  _objc_release_x1();
}

void sub_100011010(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void sub_10001107C(id a1)
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:2];
  uint64_t v2 = +[NSSet setWithArray:v1];
  uint64_t v3 = (void *)qword_100028098;
  qword_100028098 = v2;
}

void sub_1000112C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100011330();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100014FE4(a1);
  }

  [*(id *)(a1 + 32) setError:v3];
}

id sub_100011330()
{
  if (qword_1000280A8 != -1) {
    dispatch_once(&qword_1000280A8, &stru_100020AE0);
  }
  v0 = (void *)qword_1000280B0;

  return v0;
}

void sub_100011810(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000120BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *a15, id *location)
{
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_100012124(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100011330();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100015300();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained cache];
    [v7 removeDriverWithClassID:*(void *)(a1 + 32)];
  }
}

void sub_1000121B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100011330();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001536C();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained cache];
    [v7 removeDriverWithClassID:*(void *)(a1 + 32)];
  }
}

void sub_1000122FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100012640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012664(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012674(uint64_t a1)
{
}

void sub_10001267C(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  [*(id *)(a1 + 32) setError:v7];
}

void sub_100012A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100012A84(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;
  id v15 = a4;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  [*(id *)(a1 + 32) setError:v15];
}

void sub_100012C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100012CB0(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return objc_msgSend(*(id *)(a1 + 32), "setError:");
}

void sub_100013130(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000136EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100013A84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100013B7C(id a1)
{
  qword_1000280B0 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "tokenhost");

  _objc_release_x1();
}

void sub_100013BD8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100013BF8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100013C18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100013C38(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 tokenServer];
  if (v4) {
    uint64_t v5 = "token";
  }
  else {
    uint64_t v5 = "";
  }
  id v6 = [a1 slotWatcher];
  if (v6) {
    id v7 = "watcher";
  }
  else {
    id v7 = "";
  }
  id v8 = [a1 slotServer];
  if (v8) {
    uint64_t v9 = "slot";
  }
  else {
    uint64_t v9 = "";
  }
  int v10 = 136447490;
  id v11 = v5;
  __int16 v12 = 2082;
  uint64_t v13 = v7;
  __int16 v14 = 2082;
  id v15 = v9;
  __int16 v16 = 1024;
  uid_t v17 = geteuid();
  __int16 v18 = 1024;
  uid_t v19 = getuid();
  __int16 v20 = 2114;
  CFStringRef v21 = @"n/a";
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Hello from ctkd(%{public}s:%{public}s:%{public}s) euid=%u uid=%u session:%{public}@", (uint8_t *)&v10, 0x36u);
}

void sub_100013D98(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "received desktop-up notification", v1, 2u);
}

void sub_100013DDC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "got signal for ensuring slotwatcher running", v1, 2u);
}

void sub_100013E20(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get path for PID %u", (uint8_t *)v2, 8u);
}

void sub_100013E98(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create executablePath for pid %u", (uint8_t *)v2, 8u);
}

void sub_100013F10()
{
  sub_10000A29C();
  sub_10000A2EC((void *)&_mh_execute_header, v0, v1, "Failed to get URL for path %{public}@", v2, v3, v4, v5, v6);
}

void sub_100013F78()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "BundleID from audit token: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100013FE0()
{
  sub_10000A29C();
  sub_10000A2EC((void *)&_mh_execute_header, v0, v1, "Failed to get bundle URL for URL %{public}@", v2, v3, v4, v5, v6);
}

void sub_100014048()
{
  sub_10000A29C();
  sub_10000A2EC((void *)&_mh_execute_header, v0, v1, "Failed to init bundle with URL %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000140B0()
{
  sub_10000A2A8();
  sub_10000A308((void *)&_mh_execute_header, v0, v1, "Trying to get BundleID in fallback implementation", v2, v3, v4, v5, v6);
}

void sub_1000140E4()
{
  sub_10000A2A8();
  sub_10000A2D0((void *)&_mh_execute_header, v0, v1, "Invalid entitlement item", v2, v3, v4, v5, v6);
}

void sub_100014118()
{
  sub_10000A2A8();
  sub_10000A2D0((void *)&_mh_execute_header, v0, v1, "Invalid entitlement value", v2, v3, v4, v5, v6);
}

void sub_10001414C(void *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 processIdentifier];
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Failed to get bundle identifier for pid %u", (uint8_t *)v3, 8u);
}

void sub_1000141DC()
{
  sub_10000A2A8();
  sub_10000A2D0((void *)&_mh_execute_header, v0, v1, "Failed to store tokendb into prefs", v2, v3, v4, v5, v6);
}

void sub_100014210()
{
  sub_10000A2A8();
  sub_10000A308((void *)&_mh_execute_header, v0, v1, "Writing changes into tokenDB tokens", v2, v3, v4, v5, v6);
}

void sub_100014244()
{
  sub_10000A29C();
  sub_10000A2EC((void *)&_mh_execute_header, v0, v1, "Attempting to remove non-existent token %{public}@ from registry", v2, v3, v4, v5, v6);
}

void sub_1000142AC(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 tokenID];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Read persistent token %{public}@", a1, 0xCu);
}

void sub_100014324()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "loading tokendb from suite %{public}@", v2, v3, v4, v5, v6);
}

void sub_10001438C()
{
  sub_10000A2A8();
  sub_10000A308((void *)&_mh_execute_header, v0, v1, "getting set of tokenIDs present in the keychain", v2, v3, v4, v5, v6);
}

void sub_1000143C0(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Writing changes into tokenDB classes: %d extensions", buf, 8u);
}

void sub_100014408()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "Detected new token classID %{public}@", v2, v3, v4, v5, v6);
}

void sub_100014470(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Refusing caller %{public}@, no extension found for classID=%{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_1000144FC()
{
  sub_10000A2A8();
  sub_10000A2D0((void *)&_mh_execute_header, v0, v1, "Token extensions are disabled", v2, v3, v4, v5, v6);
}

void sub_100014530()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "introducing pending-created token %{public}@", v2, v3, v4, v5, v6);
}

void sub_100014598(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to start watching state of new slot, abandoning the slot (err %{public}@)", (uint8_t *)&v2, 0xCu);
}

void sub_100014610(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_10000CF80((void *)&_mh_execute_header, a3, (uint64_t)a3, "Card does not contain any application handled by extension %{public}@", (uint8_t *)a2);
}

void sub_100014660(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 80);
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_10000CF80((void *)&_mh_execute_header, a2, a3, "card inserted into slot: %{public}@", (uint8_t *)&v4);
}

void sub_1000146D4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 80);
  int v4 = 138543362;
  uint64_t v5 = v3;
  sub_10000CF80((void *)&_mh_execute_header, a2, a3, "card removed from slot: %{public}@", (uint8_t *)&v4);
}

void sub_100014748(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_10000CF80((void *)&_mh_execute_header, a3, (uint64_t)a3, "start watching %lu slots", (uint8_t *)a1);
}

void sub_100014788(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to register slot list notifications, error %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100014800(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "connection to slot registration server was interrupted", v1, 2u);
}

void sub_100014844(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "removing slot name=%{public}@: - remaining %lu slots", buf, 0x16u);
}

void sub_1000148AC(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "keychain query failed: %d (%@)", (uint8_t *)v3, 0x12u);
}

void sub_100014934(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "queueing keychain operation, keybag is not unlocked", v1, 2u);
}

void sub_100014978(id *a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  v6[0] = 67109634;
  v6[1] = [WeakRetained processIdentifier];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  CFStringRef v10 = @"com.apple.private.ctk.slot-type";
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "refusing slot registration from pid=%d: slot type '%@' not allowed by entitlement '%@'", (uint8_t *)v6, 0x1Cu);
}

void sub_100014A38(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ignoring multiple registration attempt for slot type '%@'", (uint8_t *)&v3, 0xCu);
}

void sub_100014AB4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "added registration for slot %{public}@", buf, 0xCu);
}

void sub_100014B0C(void *a1)
{
  [a1 processIdentifier];
  sub_10000F058();
  sub_10000F070((void *)&_mh_execute_header, v1, v2, "notify slotwatcher for uid=%d on connection %{public}@", v3, v4, v5, v6, v7);
}

void sub_100014B88(uint64_t a1, uint64_t a2, NSObject *a3)
{
  [*(id *)(a1 + 32) processIdentifier];
  sub_10000F058();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to notify ctkd agent in session uid=%d: %{public}@", v4, 0x12u);
}

void sub_100014C18(uint64_t a1)
{
  [*(id *)(a1 + 32) processIdentifier];
  sub_10000F070((void *)&_mh_execute_header, v1, v2, "notified slotwatcher for uid=%d on connection %{public}@", v3, v4, v5, v6, 2u);
}

void sub_100014CAC(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "removing registration for slot %{public}@", buf, 0xCu);
}

void sub_100014D04(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "addClient notification finished", v1, 2u);
}

void sub_100014D48(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "refusing request for token with invalid tokenID %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100014DC0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "refusing request for non-existing/missing tokenID %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100014E38(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_100011010((void *)&_mh_execute_header, a1, a3, "tokenInserted replied", v3);
}

void sub_100014E74(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_100011010((void *)&_mh_execute_header, a1, a3, "tokenRemoved replied", v3);
}

void sub_100014EB0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_100011010((void *)&_mh_execute_header, a1, a3, "setting token registry to TKTokenServer", v3);
}

void sub_100014EEC(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100011010((void *)&_mh_execute_header, a3, (uint64_t)a3, "received registry loaded signal", a1);
}

void sub_100014F24(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100011010((void *)&_mh_execute_header, a3, (uint64_t)a3, "waiting for the registry to be loaded", a1);
}

void sub_100014F5C(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "sending notification '%@' failed with status %u", (uint8_t *)&v3, 0x12u);
}

void sub_100014FE4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) driver];
  int v2 = [v1 extension];
  int v3 = [v2 identifier];
  sub_10000A29C();
  sub_100013BD8((void *)&_mh_execute_header, v4, v5, "Failed to communicate with driver %{public}@, error: %{public}@", v6, v7, v8, v9, v10);
}

void sub_1000150AC(uint64_t a1, void *a2)
{
  int v2 = [a2 extension];
  uint64_t v9 = [v2 identifier];
  sub_100013BD8((void *)&_mh_execute_header, v3, v4, "Invalid or missing attribute '%{public}@' of extension %{public}@", v5, v6, v7, v8, 2u);
}

void sub_100015160()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "%{public}@: invalidating", v2, v3, v4, v5, v6);
}

void sub_1000151C8()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "%@: beginRequest succeeded", v2, v3, v4, v5, v6);
}

void sub_100015230()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "%@: beginRequest", v2, v3, v4, v5, v6);
}

void sub_100015298()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "%{public}@: failing request for context because cachedriver is invalidated", v2, v3, v4, v5, v6);
}

void sub_100015300()
{
  sub_100013BC0();
  sub_100013BF8((void *)&_mh_execute_header, v0, v1, "%{public}@ extension request %{public}@ invalidated, removing driver from cache");
}

void sub_10001536C()
{
  sub_100013BC0();
  sub_100013BF8((void *)&_mh_execute_header, v0, v1, "%{public}@ extension request %{public}@ cancelled, removing driver from cache");
}

void sub_1000153D8()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "%{public}@: acquired by tokenID", v2, v3, v4, v5, v6);
}

void sub_100015440()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "%{public}@: acquiring", v2, v3, v4, v5, v6);
}

void sub_1000154A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015518(void *a1)
{
  uint64_t v1 = [a1 extension];
  uint64_t v2 = [v1 identifier];
  sub_10000A29C();
  sub_100013C18((void *)&_mh_execute_header, v3, v4, "acquiring token on driver %{public}@ through slot", v5, v6, v7, v8, v9);
}

void sub_1000155B8(void *a1)
{
  uint64_t v1 = [a1 extension];
  uint64_t v2 = [v1 identifier];
  sub_10000A29C();
  sub_100013C18((void *)&_mh_execute_header, v3, v4, "configuring extension %{public}@", v5, v6, v7, v8, v9);
}

void sub_100015658()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "%{public}@ released", v2, v3, v4, v5, v6);
}

void sub_1000156C0()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "%{public}@ releasing", v2, v3, v4, v5, v6);
}

void sub_100015728()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "%@: finished using class driver extension", v2, v3, v4, v5, v6);
}

void sub_100015790()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "%{public}@: removing from cache", v2, v3, v4, v5, v6);
}

void sub_1000157F8()
{
  sub_10000A29C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to enumerate com.apple.ctk-tokens extensions, error %{public}@", v1, 0xCu);
}

void sub_10001586C()
{
  sub_10000A29C();
  sub_10000A2B4((void *)&_mh_execute_header, v0, v1, "%{public}@: created new", v2, v3, v4, v5, v6);
}

void sub_1000158D4(void *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "terminating, force-invalidating %d drivers", (uint8_t *)v3, 8u);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return _CPCopyBundleIdentifierAndTeamFromAuditToken();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SecAccessControlCopyData()
{
  return _SecAccessControlCopyData();
}

uint64_t SecAccessControlCreateFromData()
{
  return _SecAccessControlCreateFromData();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

uint64_t SecItemUpdateTokenItemsForAccessGroups()
{
  return _SecItemUpdateTokenItemsForAccessGroups();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
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

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
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

void exit(int a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

uid_t getuid(void)
{
  return _getuid();
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

id objc_msgSend_ATR(void *a1, const char *a2, ...)
{
  return [a1 ATR];
}

id objc_msgSend_SEPKeyListener(void *a1, const char *a2, ...)
{
  return [a1 SEPKeyListener];
}

id objc_msgSend_SEPKeyServer(void *a1, const char *a2, ...)
{
  return [a1 SEPKeyServer];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend__localizedName(void *a1, const char *a2, ...)
{
  return [a1 _localizedName];
}

id objc_msgSend__plugIn(void *a1, const char *a2, ...)
{
  return [a1 _plugIn];
}

id objc_msgSend_accessControl(void *a1, const char *a2, ...)
{
  return [a1 accessControl];
}

id objc_msgSend_accessRegistry(void *a1, const char *a2, ...)
{
  return [a1 accessRegistry];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowTestOnlyExtensions(void *a1, const char *a2, ...)
{
  return [a1 allowTestOnlyExtensions];
}

id objc_msgSend_allowedExtensionClassIDs(void *a1, const char *a2, ...)
{
  return [a1 allowedExtensionClassIDs];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authContext(void *a1, const char *a2, ...)
{
  return [a1 authContext];
}

id objc_msgSend_avoidInitialKeepAlive(void *a1, const char *a2, ...)
{
  return [a1 avoidInitialKeepAlive];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_broadcast(void *a1, const char *a2, ...)
{
  return [a1 broadcast];
}

id objc_msgSend_builtinTokenIDs(void *a1, const char *a2, ...)
{
  return [a1 builtinTokenIDs];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_classID(void *a1, const char *a2, ...)
{
  return [a1 classID];
}

id objc_msgSend_clientBundleID(void *a1, const char *a2, ...)
{
  return [a1 clientBundleID];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_commitTransaction(void *a1, const char *a2, ...)
{
  return [a1 commitTransaction];
}

id objc_msgSend_configurationData(void *a1, const char *a2, ...)
{
  return [a1 configurationData];
}

id objc_msgSend_connectionCount(void *a1, const char *a2, ...)
{
  return [a1 connectionCount];
}

id objc_msgSend_containingUrl(void *a1, const char *a2, ...)
{
  return [a1 containingUrl];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_driver(void *a1, const char *a2, ...)
{
  return [a1 driver];
}

id objc_msgSend_driverCache(void *a1, const char *a2, ...)
{
  return [a1 driverCache];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_ensureSlotWatcherIsRunning(void *a1, const char *a2, ...)
{
  return [a1 ensureSlotWatcherIsRunning];
}

id objc_msgSend_ensureSlotWatchersRunning(void *a1, const char *a2, ...)
{
  return [a1 ensureSlotWatchersRunning];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return [a1 extension];
}

id objc_msgSend_externalTransactions(void *a1, const char *a2, ...)
{
  return [a1 externalTransactions];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hasRegistry(void *a1, const char *a2, ...)
{
  return [a1 hasRegistry];
}

id objc_msgSend_hasStarted(void *a1, const char *a2, ...)
{
  return [a1 hasStarted];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idleTimeout(void *a1, const char *a2, ...)
{
  return [a1 idleTimeout];
}

id objc_msgSend_initializeSandBox(void *a1, const char *a2, ...)
{
  return [a1 initializeSandBox];
}

id objc_msgSend_instanceID(void *a1, const char *a2, ...)
{
  return [a1 instanceID];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceForChangeProtocol(void *a1, const char *a2, ...)
{
  return [a1 interfaceForChangeProtocol];
}

id objc_msgSend_interfaceForProtocol(void *a1, const char *a2, ...)
{
  return [a1 interfaceForProtocol];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isUnlocked(void *a1, const char *a2, ...)
{
  return [a1 isUnlocked];
}

id objc_msgSend_keySize(void *a1, const char *a2, ...)
{
  return [a1 keySize];
}

id objc_msgSend_keyType(void *a1, const char *a2, ...)
{
  return [a1 keyType];
}

id objc_msgSend_keychain(void *a1, const char *a2, ...)
{
  return [a1 keychain];
}

id objc_msgSend_keychainItemClasses(void *a1, const char *a2, ...)
{
  return [a1 keychainItemClasses];
}

id objc_msgSend_keychainItems(void *a1, const char *a2, ...)
{
  return [a1 keychainItems];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_makeSmartCard(void *a1, const char *a2, ...)
{
  return [a1 makeSmartCard];
}

id objc_msgSend_markModified(void *a1, const char *a2, ...)
{
  return [a1 markModified];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notifyDesktopUp(void *a1, const char *a2, ...)
{
  return [a1 notifyDesktopUp];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pendingCreationTokens(void *a1, const char *a2, ...)
{
  return [a1 pendingCreationTokens];
}

id objc_msgSend_persistent(void *a1, const char *a2, ...)
{
  return [a1 persistent];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_propertyList(void *a1, const char *a2, ...)
{
  return [a1 propertyList];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_registry(void *a1, const char *a2, ...)
{
  return [a1 registry];
}

id objc_msgSend_reloadTokenClassesFromStore(void *a1, const char *a2, ...)
{
  return [a1 reloadTokenClassesFromStore];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_remove(void *a1, const char *a2, ...)
{
  return [a1 remove];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_resetDB(void *a1, const char *a2, ...)
{
  return [a1 resetDB];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sigTermSource(void *a1, const char *a2, ...)
{
  return [a1 sigTermSource];
}

id objc_msgSend_slot(void *a1, const char *a2, ...)
{
  return [a1 slot];
}

id objc_msgSend_slotName(void *a1, const char *a2, ...)
{
  return [a1 slotName];
}

id objc_msgSend_slotServer(void *a1, const char *a2, ...)
{
  return [a1 slotServer];
}

id objc_msgSend_slotType(void *a1, const char *a2, ...)
{
  return [a1 slotType];
}

id objc_msgSend_slotWatcher(void *a1, const char *a2, ...)
{
  return [a1 slotWatcher];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startObserving(void *a1, const char *a2, ...)
{
  return [a1 startObserving];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return [a1 storage];
}

id objc_msgSend_stringRepresentation(void *a1, const char *a2, ...)
{
  return [a1 stringRepresentation];
}

id objc_msgSend_systemKey(void *a1, const char *a2, ...)
{
  return [a1 systemKey];
}

id objc_msgSend_systemSessionKey(void *a1, const char *a2, ...)
{
  return [a1 systemSessionKey];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_tokenDriverCache(void *a1, const char *a2, ...)
{
  return [a1 tokenDriverCache];
}

id objc_msgSend_tokenDriverProtocol(void *a1, const char *a2, ...)
{
  return [a1 tokenDriverProtocol];
}

id objc_msgSend_tokenExtensions(void *a1, const char *a2, ...)
{
  return [a1 tokenExtensions];
}

id objc_msgSend_tokenID(void *a1, const char *a2, ...)
{
  return [a1 tokenID];
}

id objc_msgSend_tokenRegistry(void *a1, const char *a2, ...)
{
  return [a1 tokenRegistry];
}

id objc_msgSend_tokenRemoved(void *a1, const char *a2, ...)
{
  return [a1 tokenRemoved];
}

id objc_msgSend_tokenServer(void *a1, const char *a2, ...)
{
  return [a1 tokenServer];
}

id objc_msgSend_tokenServerListener(void *a1, const char *a2, ...)
{
  return [a1 tokenServerListener];
}

id objc_msgSend_tokenWatcherListener(void *a1, const char *a2, ...)
{
  return [a1 tokenWatcherListener];
}

id objc_msgSend_tokens(void *a1, const char *a2, ...)
{
  return [a1 tokens];
}

id objc_msgSend_tokensByTokenID(void *a1, const char *a2, ...)
{
  return [a1 tokensByTokenID];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return [a1 valid];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_waitForRegistry(void *a1, const char *a2, ...)
{
  return [a1 waitForRegistry];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}