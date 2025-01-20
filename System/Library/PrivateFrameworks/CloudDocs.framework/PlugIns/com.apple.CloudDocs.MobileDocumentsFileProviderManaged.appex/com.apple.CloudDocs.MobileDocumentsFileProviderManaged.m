void sub_100004918(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;

  v3 = a2;
  if (v3)
  {
    v4 = brc_bread_crumbs();
    v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v6 = *(void *)(a1 + 32);
      v7 = 138412802;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, (os_log_type_t)0x90u, "[ERROR] %@ - failed to signal enumerator for root container: %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
}

void sub_100004C40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004C6C(uint64_t a1)
{
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000229DC();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  [*(id *)(a1 + 32) invalidateChangeToken];
  v6 = [*(id *)(a1 + 40) domain];
  unsigned int v7 = [v6 isEqualToString:BRCloudDocsErrorDomain];

  if (v7) {
    [*(id *)(a1 + 32) _signalChange];
  }
}

uint64_t sub_10000506C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 74) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100005084(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005094(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    v27 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Received notification sender %@ error %@%@", buf, 0x2Au);
  }

  v10 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100005240;
  v15[3] = &unk_1000386D8;
  id v16 = v7;
  id v11 = *(id *)(a1 + 40);
  id v18 = v6;
  id v19 = v11;
  uint64_t v17 = *(void *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v15);
}

void sub_100005240(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v3 + 73))
    {
      uint64_t v4 = brc_bread_crumbs();
      v5 = brc_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100022B1C();
      }

      [*(id *)(a1 + 48) invalidate];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      int v6 = *(unsigned __int8 *)(v3 + 72);
      id v7 = *(void **)(a1 + 48);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100005494;
      v22[3] = &unk_1000385D0;
      v22[4] = v3;
      uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v22];
      uint64_t v9 = *(void *)(a1 + 40);
      v10 = *(void **)(v9 + 24);
      *(void *)(v9 + 24) = v8;

      [*(id *)(*(void *)(a1 + 40) + 24) boostPriority:&stru_100038688];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000054A4;
      v21[3] = &unk_1000385D0;
      v21[4] = *(void *)(a1 + 40);
      id v11 = objc_retainBlock(v21);
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      uint64_t v17 = sub_1000054B0;
      id v18 = &unk_1000386B0;
      uint64_t v19 = *(void *)(a1 + 40);
      id v20 = v11;
      id v12 = v11;
      id v13 = objc_retainBlock(&v15);
      if (v6) {
        uint64_t v14 = 23;
      }
      else {
        uint64_t v14 = 19;
      }
      objc_msgSend(*(id *)(a1 + 40), "watchItemWithUpdateSender:options:errorHandler:gatherReply:", *(void *)(a1 + 48), v14, v12, v13, v15, v16, v17, v18, v19);
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

id sub_100005494(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleNotificationError:a2];
}

id sub_1000054A4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleNotificationError:a2];
}

void sub_1000054B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v6 = a1 + 32;
    id v4 = v7;
    objc_sync_enter(v4);
    *(unsigned char *)(*(void *)v6 + 112) = 1;
    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100022B88();
    }

    if (*(void *)(*(void *)v6 + 96))
    {
      if ([*(id *)(*(void *)v6 + 32) count])
      {
        v10 = *(void **)(*(void *)v6 + 96);
        id v11 = [*(id *)(*(void *)v6 + 32) allValues];
        [v10 didEnumerateItems:v11];
      }
      [*(id *)(*(void *)v6 + 96) finishEnumeratingUpToPage:0];
      id v12 = *(void **)(*(void *)v6 + 96);
      *(void *)(*(void *)v6 + 96) = 0;
    }
    objc_sync_exit(v4);
    goto LABEL_13;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(void *)(*(void *)(a1 + 32) + 96))
  {
    brc_bread_crumbs();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100022C18();
    }

LABEL_13:
  }
}

void sub_100005634(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000056E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupNotificationReceivingIfNeededWithCompletion:*(void *)(a1 + 40)];
}

void sub_100005AF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005F50(_Unwind_Exception *a1)
{
}

void sub_100005F94(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(a2, "br_fileProviderError");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v3 finishEnumeratingWithError:v13];
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "br_pageTokenCompletedInitialEnumeration"))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    [v4 enumerateNextGatherBatchWithObserver:v6 fromPage:v5];
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000061C0;
    v16[3] = &unk_100038750;
    long long v19 = *(_OWORD *)(a1 + 64);
    uint64_t v20 = *(void *)(a1 + 80);
    id v7 = *(void **)(a1 + 56);
    v16[4] = *(void *)(a1 + 48);
    id v17 = v7;
    id v18 = *(id *)(a1 + 32);
    char v21 = *(unsigned char *)(a1 + 88);
    uint64_t v8 = objc_retainBlock(v16);
    id v9 = [*(id *)(a1 + 32) suggestedPageSize];
    if ((unint64_t)v9 >= 0xC8) {
      uint64_t v10 = 200;
    }
    else {
      uint64_t v10 = (uint64_t)v9;
    }
    id v11 = +[BRDaemonConnection defaultConnection];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006494;
    v14[3] = &unk_1000385D0;
    id v15 = *(id *)(a1 + 32);
    id v12 = [v11 remoteObjectProxyWithErrorHandler:v14];
    objc_msgSend(v12, "enumerateItemsInFolder:sortOrder:offset:limit:completion:", *(void *)(*(void *)(a1 + 48) + 16), *(unsigned __int8 *)(a1 + 88), objc_msgSend(*(id *)(a1 + 40), "br_pageTokenOffset"), v10, v8);
  }
}

void sub_1000061C0(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  long long v21 = *(_OWORD *)(a1 + 56);
  uint64_t v22 = *(void *)(a1 + 72);
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v17 = "";
    id v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 40);
    if (a4) {
      id v17 = " (waiting for gather complete)";
    }
    *(_DWORD *)buf = 134219522;
    uint64_t v24 = v21;
    __int16 v25 = 2112;
    id v26 = v18;
    __int16 v27 = 2048;
    v28 = a3;
    __int16 v29 = 2080;
    v30 = v17;
    __int16 v31 = 2112;
    uint64_t v32 = v19;
    __int16 v33 = 2112;
    id v34 = v9;
    __int16 v35 = 2112;
    v36 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@ - received next page %llu%s for %@ items=%@%@", buf, 0x48u);
  }

  if (v10)
  {
    id v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v20;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      v28 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v14, (os_log_type_t)0x90u, "[ERROR] %@ - there was an error when listing items: %@%@", buf, 0x20u);
    }

    id v15 = *(void **)(a1 + 48);
    uint64_t v16 = objc_msgSend(v10, "br_fileProviderError");
    [v15 finishEnumeratingWithError:v16];
  }
  else
  {
    [*(id *)(a1 + 48) didEnumerateItems:v9];
    uint64_t v16 = +[NSData br_pageTokenFromSortOrder:*(unsigned __int8 *)(a1 + 80) offset:a3];
    if (v16)
    {
      [*(id *)(a1 + 48) finishEnumeratingUpToPage:v16];
    }
    else
    {
      if (a4)
      {
        uint64_t v16 = +[NSData br_pageTokenFromSortOrder:*(unsigned __int8 *)(a1 + 80) gatherBatch:0];
      }
      else
      {
        uint64_t v16 = 0;
      }
      objc_msgSend(*(id *)(a1 + 48), "finishEnumeratingUpToPage:", v16, v21, v22);
    }
  }

  __brc_leave_section();
}

void sub_10000645C(_Unwind_Exception *a1)
{
}

void sub_100006494(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "br_fileProviderError");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 finishEnumeratingWithError:v3];
}

void sub_100006950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  objc_sync_exit(v10);
  __brc_leave_section();
  _Unwind_Resume(a1);
}

void sub_100006DBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000728C(_Unwind_Exception *a1)
{
}

void sub_1000072EC(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  v2 = (void *)qword_100043D60;
  qword_100043D60 = v1;
}

void sub_10000775C(_Unwind_Exception *a1)
{
}

void sub_1000077A8(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  v2 = (void *)qword_100043D70;
  qword_100043D70 = v1;
}

void *sub_100007808(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[3])
  {
    [result invalidateChangeToken];
    id v3 = *(void **)(a1 + 32);
    return [v3 _signalChange];
  }
  return result;
}

void sub_100007904(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000079EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100007A74(uint64_t a1)
{
  v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100023044();
  }

  return [*(id *)(a1 + 32) _invalidate];
}

void sub_100007C5C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100007C88(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, (os_log_type_t)0x90u, a4, (uint8_t *)va, 0x16u);
}

void sub_100007CA8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100007CE0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_100007D14(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

id sub_100007E94(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishEnumeratingWithError:a2];
}

void sub_100007EA0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      sub_1000230B0((uint64_t)v7, (uint64_t)v8, v9);
    }

    id v10 = *(void **)(a1 + 32);
    id v11 = objc_msgSend(v7, "br_fileProviderError");
    [v10 finishEnumeratingWithError:v11];
  }
  else
  {
    [*(id *)(a1 + 32) didEnumerateItems:a2];
    id v12 = *(void **)(a1 + 32);
    id v13 = +[NSData br_pageTokenFromSortOrder:*(unsigned __int8 *)(a1 + 40) offset:a3];
    [v12 finishEnumeratingUpToPage:v13];
  }
}

void sub_1000082C4(_Unwind_Exception *a1)
{
}

void sub_1000082F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [v5 participants];
    int v13 = 138413314;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    __int16 v17 = 2048;
    id v18 = [v5 publicPermission];
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %ld, %@)%@", (uint8_t *)&v13, 0x34u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [v5 participants];
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, [v5 publicPermission], v6);
}

void sub_100008598(_Unwind_Exception *a1)
{
}

void sub_100008A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,id a25)
{
}

void sub_100008B08(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCompletedUnitCount:1];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
  uint64_t v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138413058;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    __int16 v19 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", (uint8_t *)&v12, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100008C60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void sub_100008F14(_Unwind_Exception *a1)
{
}

void sub_100008F44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = v20;
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      __int16 v33 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", location, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_16;
  }
  if ([v5 isKnownToServer])
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:CKShareTypeKey];
    if ([v9 isEqual:_BRFolderShareType])
    {
      unsigned int v10 = [*(id *)(*(void *)(a1 + 32) + 8) characterAtIndex:0];

      if (v10 != 105)
      {
        uint64_t v11 = brc_bread_crumbs();
        int v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_1000231A0((uint64_t *)(a1 + 32), (uint64_t)v11, v12);
        }

        uint64_t v13 = *(void *)(a1 + 48);
        __int16 v14 = +[NSError br_errorWithPOSIXCode:45];
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v17 = *(void *)(a1 + 32);
    __int16 v18 = *(void **)(v17 + 32);
    *(void *)(v17 + 32) = 0;

    [*(id *)(a1 + 40) setCompletedUnitCount:1];
    id v19 = [objc_alloc((Class)BRShareDestroyOperation) initWithShare:v5 fileURL:*(void *)(*(void *)(a1 + 32) + 24)];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100009330;
    v26[3] = &unk_1000388A8;
    v26[4] = *(void *)(a1 + 32);
    id v28 = *(id *)(a1 + 48);
    id v27 = *(id *)(a1 + 40);
    [v19 setShareDestroyCompletionBlock:v26];
    objc_initWeak((id *)location, v19);
    __int16 v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    id v23 = sub_100009444;
    uint64_t v24 = &unk_100038880;
    objc_copyWeak(&v25, (id *)location);
    [*(id *)(a1 + 40) setCancellationHandler:&v21];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "addOperation:", v19, v21, v22, v23, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);

    goto LABEL_16;
  }
  id v15 = brc_bread_crumbs();
  __int16 v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10002326C(a1, (uint64_t)v15, v16);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_16:
}

void sub_100009308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009330(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    int v12 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) setCompletedUnitCount:2];
}

void sub_100009444(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

id sub_100009484(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_100009704(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100009940(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [[BRThumbnailRequest alloc] initWithIdentifier:*(void *)(*((void *)&v23 + 1) + 8 * i) version:0];
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000AB0C;
  v21[3] = &unk_1000388F8;
  id v22 = v9;
  id v18 = v9;
  id v19 = sub_100009B50(v11, v8, v21, v10);

  return v19;
}

id sub_100009B50(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  v73 = a2;
  id v80 = a3;
  id v74 = a4;
  v75 = +[NSProgress progressWithTotalUnitCount:0];
  id v77 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v140 = 0;
  uint64_t v139 = 0;
  uint64_t v141 = 0;
  __brc_create_section();
  brc_bread_crumbs();
  id v8 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v150 = 134218498;
    *(void *)&v150[4] = v139;
    *(_WORD *)&v150[12] = 2112;
    *(void *)&v150[14] = v7;
    *(_WORD *)&v150[22] = 2112;
    v151 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx starting fetch thumbnail for %@%@", v150, 0x20u);
  }

  id v79 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v135 objects:v154 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v136;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v136 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        id v14 = [v13 identifier];
        uint64_t v15 = +[BRFileObjectID fileObjectIDWithString:v14];
        __int16 v16 = v15;
        if (!v15)
        {
          if (!v80) {
            goto LABEL_17;
          }
          uint64_t v17 = [v13 version];
          id v18 = +[NSError brc_errorItemNotFound:v14];
          id v19 = objc_msgSend(v18, "br_fileProviderError");
          (*((void (**)(id, void *, void *, void, void, void *))v80 + 2))(v80, v14, v17, 0, 0, v19);

          goto LABEL_13;
        }
        if ([v15 type] == 2)
        {
          [v77 addObject:v16];
          uint64_t v17 = [v13 version];
          id v18 = [v13 identifier];
          [v79 setObject:v17 forKeyedSubscript:v18];
LABEL_13:

          goto LABEL_16;
        }
        if (!v80) {
          goto LABEL_17;
        }
        uint64_t v17 = [v13 version];
        (*((void (**)(id, void *, void *, void, void, void))v80 + 2))(v80, v14, v17, 0, 0, 0);
LABEL_16:

LABEL_17:
      }
      id v10 = [obj countByEnumeratingWithState:&v135 objects:v154 count:16];
    }
    while (v10);
  }

  if ([v77 count])
  {
    uint64_t v20 = +[BRDaemonConnection defaultConnection];
    id v21 = [v20 newSyncProxy];

    *(void *)v150 = 0;
    *(void *)&v150[8] = v150;
    *(void *)&v150[16] = 0x3032000000;
    v151 = sub_10000ABAC;
    v152 = sub_10000ABBC;
    id v153 = 0;
    uint64_t v129 = 0;
    v130 = &v129;
    uint64_t v131 = 0x3032000000;
    v132 = sub_10000ABAC;
    v133 = sub_10000ABBC;
    id v134 = 0;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x3032000000;
    v126 = sub_10000ABAC;
    v127 = sub_10000ABBC;
    id v128 = 0;
    v121[0] = 0;
    v121[1] = v121;
    v121[2] = 0x3032000000;
    v121[3] = sub_10000ABAC;
    v121[4] = sub_10000ABBC;
    id v122 = 0;
    uint64_t v115 = 0;
    v116 = &v115;
    uint64_t v117 = 0x3032000000;
    v118 = sub_10000ABAC;
    v119 = sub_10000ABBC;
    id v120 = 0;
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472;
    v108[2] = sub_10000ABC4;
    v108[3] = &unk_100038920;
    id v109 = v21;
    v110 = &v115;
    v111 = v150;
    v112 = &v129;
    v113 = &v123;
    v114 = v121;
    id v72 = v109;
    [v109 resolveFileObjectIDsToContentRecordIDsForThumbnails:v77 reply:v108];
    if (v116[5])
    {
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id v76 = (id)v124[5];
      id v22 = [v76 countByEnumeratingWithState:&v104 objects:v143 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v105;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v105 != v23) {
              objc_enumerationMutation(v76);
            }
            long long v25 = *(void **)(*((void *)&v104 + 1) + 8 * (void)j);
            long long v26 = brc_bread_crumbs();
            id v27 = brc_default_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v145 = v25;
              __int16 v146 = 2112;
              v147 = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't resolve file objectID %@%@", buf, 0x16u);
            }

            id v28 = [v25 asString];
            __int16 v29 = [v25 asString];
            __int16 v30 = [v79 objectForKeyedSubscript:v29];
            id v31 = [v25 asString];
            __int16 v32 = +[NSError brc_errorItemNotFound:v31];
            __int16 v33 = objc_msgSend(v32, "br_fileProviderError");
            (*((void (**)(id, void *, void *, void, void, void *))v80 + 2))(v80, v28, v30, 0, 0, v33);
          }
          id v22 = [v76 countByEnumeratingWithState:&v104 objects:v143 count:16];
        }
        while (v22);
      }

      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      id v34 = (id)v130[5];
      id v35 = [v34 countByEnumeratingWithState:&v100 objects:v142 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v101;
        do
        {
          for (k = 0; k != v35; k = (char *)k + 1)
          {
            if (*(void *)v101 != v36) {
              objc_enumerationMutation(v34);
            }
            v38 = *(void **)(*((void *)&v100 + 1) + 8 * (void)k);
            v39 = [v38 asString];
            v40 = [v38 asString];
            v41 = [v79 objectForKeyedSubscript:v40];
            (*((void (**)(id, void *, void *, void, void, void))v80 + 2))(v80, v39, v41, 0, 0, 0);
          }
          id v35 = [v34 countByEnumeratingWithState:&v100 objects:v142 count:16];
        }
        while (v35);
      }

      if ([(id)v116[5] count] || objc_msgSend(*(id *)(*(void *)&v150[8] + 40), "count"))
      {
        long long v96 = 0uLL;
        uint64_t v97 = 0;
        __brc_create_section();
        v42 = brc_bread_crumbs();
        v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v70 = (void *)v116[5];
          *(_DWORD *)buf = 134218498;
          id v145 = (id)v96;
          __int16 v146 = 2112;
          v147 = v70;
          __int16 v148 = 2112;
          v149 = v42;
          _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx fetching the thumbnails for: %@%@", buf, 0x20u);
        }

        long long v98 = v96;
        uint64_t v99 = v97;
        uint64_t v44 = *(void *)(*(void *)&v150[8] + 40);
        v93[0] = _NSConcreteStackBlock;
        v93[1] = 3221225472;
        v93[2] = sub_10000ACF0;
        v93[3] = &unk_100038948;
        id v45 = v80;
        id v95 = v45;
        id v46 = v79;
        id v94 = v46;
        v73[2](v73, v44, v93);
        if ([(id)v116[5] count])
        {
          v47 = objc_opt_new();
          v48 = (void *)v116[5];
          v91[0] = _NSConcreteStackBlock;
          v91[1] = 3221225472;
          v91[2] = sub_10000ADE4;
          v91[3] = &unk_100038970;
          id v49 = v47;
          id v92 = v49;
          [v48 enumerateKeysAndObjectsUsingBlock:v91];
          v50 = +[CKOperationGroup br_downloadThumbnailsUserInitiated];
          id v51 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v49, "count"));
          id v52 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v49, "count"));
          v53 = +[CKContainer containerWithIdentifier:BRUbiquitousCloudKitContainerIdentifier];
          [v53 setSourceApplicationBundleIdentifier:BRDaemonBundleID];
          v83[0] = _NSConcreteStackBlock;
          v83[1] = 3221225472;
          v83[2] = sub_10000AF28;
          v83[3] = &unk_1000389E8;
          id v54 = v51;
          id v84 = v54;
          id v55 = v52;
          id v85 = v55;
          long long v89 = v98;
          uint64_t v90 = v99;
          id v88 = v45;
          id v86 = v46;
          id v56 = v50;
          id v87 = v56;
          [v49 enumerateKeysAndObjectsUsingBlock:v83];
          sub_10000B764(v54, v55, v53, 0, v74);
          [v75 setCancellable:1];
          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472;
          v81[2] = sub_10000BB68;
          v81[3] = &unk_1000387E0;
          id v57 = v54;
          id v82 = v57;
          [v75 setCancellationHandler:v81];
          id v58 = v75;
        }
        else
        {
          (*((void (**)(id, void))v74 + 2))(v74, 0);
          id v66 = v75;
        }

        id v61 = v75;
      }
      else
      {
        v68 = brc_bread_crumbs();
        v69 = brc_default_log();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v145 = v68;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "[WARNING] No thumbnails left to fetch after attempting to resolve content record ids%@", buf, 0xCu);
        }

        (*((void (**)(id, void))v74 + 2))(v74, 0);
        id v61 = 0;
      }
    }
    else
    {
      v62 = brc_bread_crumbs();
      v63 = brc_default_log();
      if (os_log_type_enabled(v63, (os_log_type_t)0x90u))
      {
        v71 = [v72 error];
        *(_DWORD *)buf = 138412802;
        id v145 = v77;
        __int16 v146 = 2112;
        v147 = v71;
        __int16 v148 = 2112;
        v149 = v62;
        _os_log_error_impl((void *)&_mh_execute_header, v63, (os_log_type_t)0x90u, "[ERROR] can't get the record ids for %@: %@%@", buf, 0x20u);
      }
      v64 = [v72 error];
      v65 = objc_msgSend(v64, "br_fileProviderError");
      (*((void (**)(id, void *))v74 + 2))(v74, v65);

      id v61 = v75;
    }

    _Block_object_dispose(&v115, 8);
    _Block_object_dispose(v121, 8);

    _Block_object_dispose(&v123, 8);
    _Block_object_dispose(&v129, 8);

    _Block_object_dispose(v150, 8);
  }
  else
  {
    v59 = brc_bread_crumbs();
    v60 = brc_default_log();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
      sub_100023300();
    }

    (*((void (**)(id, void))v74 + 2))(v74, 0);
    id v61 = v75;
  }

  __brc_leave_section();

  return v61;
}

void sub_10000AA24(_Unwind_Exception *a1)
{
}

void sub_10000AB0C(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v10 = a2;
  id v9 = a6;
  if (a4)
  {
    a4 = +[NSData dataWithContentsOfURL:a4];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000ABAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000ABBC(uint64_t a1)
{
}

void sub_10000ABC4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  [*(id *)(a1 + 32) setError:a7];
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v13;
  id v31 = v13;

  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  id v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v14;
  id v22 = v14;

  uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v15;
  id v25 = v15;

  uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
  id v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v16;
  id v28 = v16;

  uint64_t v29 = *(void *)(*(void *)(a1 + 72) + 8);
  __int16 v30 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v17;
}

void sub_10000ACF0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v17 = [v13 asString];
  id v14 = *(void **)(a1 + 32);
  id v15 = [v13 asString];

  id v16 = [v14 objectForKeyedSubscript:v15];
  (*(void (**)(uint64_t, id, void *, id, id, id))(v9 + 16))(v9, v17, v16, v12, v11, v10);
}

void sub_10000ADE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 zoneID];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    uint64_t v9 = objc_opt_new();
    id v10 = *(void **)(a1 + 32);
    id v11 = [v6 zoneID];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  id v12 = [v9 objectForKeyedSubscript:v6];

  if (v12)
  {
    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_100023368();
    }
  }
  id v13 = [v5 asString];
  [v9 setObject:v13 forKeyedSubscript:v6];
}

void sub_10000AF28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 allKeys];
  id v8 = [v7 mutableCopy];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  id v21 = sub_10000B1FC;
  id v22 = &unk_1000389C0;
  id v23 = *(id *)(a1 + 32);
  id v24 = *(id *)(a1 + 40);
  id v19 = v5;
  id v25 = v19;
  id v9 = v6;
  id v26 = v9;
  long long v30 = *(_OWORD *)(a1 + 72);
  uint64_t v31 = *(void *)(a1 + 88);
  id v29 = *(id *)(a1 + 64);
  id v27 = *(id *)(a1 + 48);
  id v28 = *(id *)(a1 + 56);
  id v10 = v8;
  id v11 = v20;
  id v12 = +[BRCUserDefaults defaultsForMangledID:0];
  unsigned int v13 = [v12 maxRecordCountInFetchRecordsOperation];

  if ([v10 count])
  {
    *(void *)&long long v14 = 67109378;
    long long v18 = v14;
    while ((unint64_t)objc_msgSend(v10, "count", v18) >= v13)
    {
      id v15 = brc_bread_crumbs();
      id v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v18;
        unsigned int v33 = v13;
        __int16 v34 = 2112;
        id v35 = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching thumbnails for more than %u item identifiers, batching request%@", buf, 0x12u);
      }

      id v17 = objc_msgSend(v10, "subarrayWithRange:", 0, v13);
      v21((uint64_t)v11, v17);

      objc_msgSend(v10, "removeObjectsInRange:", 0, v13);
      if (![v10 count]) {
        goto LABEL_9;
      }
    }
    v21((uint64_t)v11, v10);
  }
LABEL_9:
}

void sub_10000B1FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)BRFetchRecordsOperation);
  [*(id *)(a1 + 32) addObject:v4];
  [*(id *)(a1 + 40) addObject:*(void *)(a1 + 48)];
  [v4 setRecordIDs:v3];

  id v5 = +[CKRecord desiredKeysWithMask:16];
  [v4 setDesiredKeys:v5];

  [v4 setQualityOfService:17];
  id v6 = [v4 configuration];
  [v6 setDiscretionaryNetworkBehavior:0];

  id v7 = [v4 configuration];
  [v7 setAutomaticallyRetryNetworkFailures:0];

  uint64_t v8 = BRDaemonBundleID;
  id v9 = [v4 configuration];
  [v9 setSourceApplicationBundleIdentifier:v8];

  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_10000B458;
  id v22 = &unk_100038998;
  id v23 = *(id *)(a1 + 56);
  long long v26 = *(_OWORD *)(a1 + 88);
  uint64_t v27 = *(void *)(a1 + 104);
  id v25 = *(id *)(a1 + 80);
  id v24 = *(id *)(a1 + 64);
  [v4 setPerRecordCompletionBlock:&v19];
  objc_msgSend(v4, "setGroup:", *(void *)(a1 + 72), v19, v20, v21, v22);
  id v10 = [v4 configuration];
  id v11 = [v10 additionalRequestHTTPHeaders];
  id v12 = [v11 mutableCopy];
  unsigned int v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_opt_new();
  }
  id v15 = v14;

  id v16 = objc_alloc_init((Class)BRCDeviceConfiguration);
  id v17 = [v16 getDeviceConfigurationString];
  [v15 setObject:v17 forKeyedSubscript:@"X-APPLE-BR-DEVICE-CONFIGURATION"];

  long long v18 = [v4 configuration];
  [v18 setAdditionalRequestHTTPHeaders:v15];
}

void sub_10000B458(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v7 objectForKeyedSubscript:kBRRecordKeyThumbnail1024x1024];
  id v11 = [v10 fileURL];
  id v12 = [v7 objectForKeyedSubscript:kBRRecordKeyThumbnailQuickLookMetadata];
  unsigned int v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  long long v21 = *(_OWORD *)(a1 + 56);
  id v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    id v23 = (void *)v21;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx received a thumbnail callback for %@%@", buf, 0x20u);
  }

  if (v11)
  {
    id v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_1000233DC();
    }
  }
  else
  {
    id v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v17, (os_log_type_t)0x90u, "[ERROR] error when fetching thumbnail for %@: %@%@", buf, 0x20u);
    }
  }

  uint64_t v18 = *(void *)(a1 + 48);
  id v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:v13];
  uint64_t v20 = objc_msgSend(v9, "br_fileProviderError");
  (*(void (**)(uint64_t, void *, void *, void *, void *, void *))(v18 + 16))(v18, v13, v19, v11, v12, v20);

  __brc_leave_section();
}

void sub_10000B728(_Unwind_Exception *a1)
{
}

void sub_10000B764(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v27 = a3;
  id v11 = a4;
  id v12 = a5;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_10000ABAC;
  v35[4] = sub_10000ABBC;
  id v13 = v11;
  id v36 = v13;
  id v14 = [v9 firstObject];
  if (v14)
  {
    id v15 = [v10 firstObject];
    if (v15)
    {
      [v9 removeObjectAtIndex:0];
      [v10 removeObjectAtIndex:0];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10000BC54;
      v28[3] = &unk_100038A10;
      id v16 = v15;
      id v29 = v16;
      __int16 v34 = v35;
      id v30 = v9;
      id v31 = v10;
      id v17 = v27;
      id v32 = v17;
      id v33 = v12;
      [v14 setFetchRecordsCompletionBlock:v28];
      uint64_t v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v38 = v14;
        __int16 v39 = 2112;
        id v40 = v16;
        __int16 v41 = 2112;
        v42 = v18;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] scheduling operation %@ for zone: %@%@", buf, 0x20u);
      }

      uint64_t v20 = [v16 ownerName];
      unsigned int v21 = [v20 isEqualToString:CKCurrentUserDefaultName];

      if (v21) {
        [v17 privateCloudDatabase];
      }
      else {
      id v22 = [v17 sharedCloudDatabase];
      }
      [v22 addOperation:v14];
    }
    else
    {
      id v25 = brc_bread_crumbs();
      __int16 v26 = brc_default_log();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u)) {
        sub_1000234C4();
      }

      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
  else
  {
    id v23 = brc_bread_crumbs();
    __int16 v24 = brc_default_log();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
      sub_100023450();
    }

    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }

  _Block_object_dispose(v35, 8);
}

void sub_10000BB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000BB68(uint64_t a1)
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * (void)v5), "cancel", (void)v6);
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void sub_10000BC54(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  long long v6 = brc_bread_crumbs();
  long long v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100023608(a1, (uint64_t)v6, v7);
  }

  if (v5)
  {
    long long v8 = brc_bread_crumbs();
    long long v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 138412802;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v9, (os_log_type_t)0x90u, "[ERROR] error while fetching thumbnail batch for %@: %@%@", (uint8_t *)&v17, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  }
  if ([*(id *)(a1 + 40) count] && objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000235A0();
    }

    sub_10000B764(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void *)(a1 + 64));
  }
  else
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100023538();
    }

    uint64_t v14 = *(void *)(a1 + 64);
    id v15 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "br_fileProviderError");
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
}

void sub_10000C528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C55C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C56C(uint64_t a1)
{
}

void sub_10000C574(void *a1, void *a2)
{
  id v11 = a2;
  id v3 = +[CKAllowedSharingOptions standardOptions];
  [v3 setSupportAllowingAddedParticipantsToInviteOthers:1];
  if (v11)
  {
    uint64_t v4 = +[CKAllowedSharingOptions resolvedOptionsFromOptions:v3 forExistingShare:v11];
    uint64_t v5 = *(void *)(a1[6] + 8);
    long long v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = v3;
    long long v6 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }

  long long v9 = [*(id *)(*(void *)(a1[6] + 8) + 40) shareOptions];
  id v10 = [objc_alloc((Class)_SWCollaborationMetadata) initWithLocalIdentifier:a1[4] collaborationIdentifier:&stru_100039108 title:0 defaultShareOptions:v9 initiatorHandle:0 initiatorNameComponents:0];
  (*(void (**)(void))(a1[5] + 16))();
}

void sub_10000C850(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    long long v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      sub_100023854(a1, (uint64_t)v6, v7);
    }

    [*(id *)(a1 + 40) fail];
  }
  else
  {
    id v8 = +[CKAllowedSharingOptions standardOptions];
    [v8 setSupportAllowingAddedParticipantsToInviteOthers:1];
    long long v9 = [v8 shareOptions];
    id v10 = [objc_alloc((Class)_SWCollaborationMetadata) initWithCollaborationIdentifier:v5 title:0 defaultShareOptions:v9 initiatorHandle:0 initiatorNameComponents:0];
    id v11 = *(void **)(a1 + 40);
    id v12 = objc_opt_new();
    [v11 fulfillUsingURL:v12 updatedMetadata:v10];
  }
}

_BRFileProviderShareOperationWrapper *sub_10000CBA4(void *a1)
{
  id v1 = a1;
  id v2 = [[_BRFileProviderShareOperationWrapper alloc] initWithOperation:v1];

  return v2;
}

void sub_10000CFF0(_Unwind_Exception *a1)
{
}

void sub_10000D024(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    uint64_t v7 = "-[BaseFileProviderShareOperationProxy startOperation:toCopyShareURLForShare:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000D148(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[BaseFileProviderShareOperationProxy startOperation:toCopyShareURLForShare:reply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    __int16 v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000D544(_Unwind_Exception *a1)
{
}

void sub_10000D578(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BaseFileProviderShareOperationProxy startOperation:toSaveSharingInfo:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000D690(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BaseFileProviderShareOperationProxy startOperation:toSaveSharingInfo:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000DA70(_Unwind_Exception *a1)
{
}

void sub_10000DAA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[BaseFileProviderShareOperationProxy startOperation:toUnshareShare:forceDelete:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000DBB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[BaseFileProviderShareOperationProxy startOperation:toUnshareShare:forceDelete:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000DF14(_Unwind_Exception *a1)
{
}

void sub_10000DF44(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316674;
    id v7 = "-[BaseFileProviderShareOperationProxy copyCurrentUserNameAndDisplayHandleWithReply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v6, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E080(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v18 = 136316674;
    id v19 = "-[BaseFileProviderShareOperationProxy copyCurrentUserNameAndDisplayHandleWithReply:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v18, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E4BC(_Unwind_Exception *a1)
{
}

void sub_10000E4F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BaseFileProviderShareOperationProxy startOperation:toLookupShareParticipants:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E608(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BaseFileProviderShareOperationProxy startOperation:toLookupShareParticipants:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000E9E8(_Unwind_Exception *a1)
{
}

void sub_10000EA1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BaseFileProviderShareOperationProxy startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    __int16 v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EB34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BaseFileProviderShareOperationProxy startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000EE48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F488(_Unwind_Exception *a1)
{
}

void sub_10000F984(_Unwind_Exception *a1)
{
}

void sub_10000FBB0(_Unwind_Exception *a1)
{
}

void sub_10000FBE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [v5 participants];
    int v13 = 138413314;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    __int16 v16 = v12;
    __int16 v17 = 2048;
    id v18 = [v5 publicPermission];
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    __int16 v22 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %ld, %@)%@", (uint8_t *)&v13, 0x34u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  __int16 v10 = [v5 participants];
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, [v5 publicPermission], v6);
}

void sub_10000FEA0(_Unwind_Exception *a1)
{
}

void sub_1000102E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_destroyWeak(v27);
  objc_destroyWeak(&a27);
  __brc_leave_section();
  _Unwind_Resume(a1);
}

void sub_10001037C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    [*(id *)(a1 + 32) setCachedShare:v7];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setTotalUnitCount:1];

  if (objc_msgSend(v9, "brc_checkErrorsFromCloudKit:", &stru_100038B40))
  {
    uint64_t v11 = BRSharingCreateShareForItemAtURL();
    id v12 = 0;

    int v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v9)
    {
      __int16 v15 = brc_bread_crumbs();
      __int16 v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138413058;
        uint64_t v21 = v18;
        __int16 v22 = 2112;
        id v23 = 0;
        __int16 v24 = 2112;
        id v25 = v9;
        __int16 v26 = 2112;
        id v27 = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
    }
    else
    {
      __int16 v15 = brc_bread_crumbs();
      __int16 v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138413058;
        uint64_t v21 = v19;
        __int16 v22 = 2112;
        id v23 = v7;
        __int16 v24 = 2112;
        id v25 = 0;
        __int16 v26 = 2112;
        id v27 = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", buf, 0x2Au);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v11 = v7;
  }
}

BOOL sub_100010684(id a1, NSError *a2)
{
  id v2 = a2;
  if ([(NSError *)v2 brc_isCloudKitUnknownItemError]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [(NSError *)v2 br_isCloudDocsErrorCode:20];
  }

  return v3;
}

void sub_1000106D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void sub_100010B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_destroyWeak(v27);
  objc_destroyWeak(&a27);
  __brc_leave_section();
  _Unwind_Resume(a1);
}

void sub_100010B94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCompletedUnitCount:1];

  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138413058;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", (uint8_t *)&v11, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100010CD8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void sub_100011148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,id a25)
{
}

void sub_1000111C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setCompletedUnitCount:1];

  [*(id *)(a1 + 32) setCachedShare:v5];
  id v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138413058;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@)%@", (uint8_t *)&v11, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100011314(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

void sub_1000115E0(_Unwind_Exception *a1)
{
}

void sub_100011614(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v22 = a1[4];
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = v22;
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", location, 0x20u);
    }

    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_16;
  }
  if ([v5 isKnownToServer])
  {
    id v9 = [v5 objectForKeyedSubscript:CKShareTypeKey];
    if ([v9 isEqual:_BRFolderShareType])
    {
      uint64_t v10 = [a1[4] itemIdentifier];
      unsigned int v11 = [v10 characterAtIndex:0];

      if (v11 != 105)
      {
        uint64_t v12 = brc_bread_crumbs();
        __int16 v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_100023948((uint64_t *)a1 + 4, (uint64_t)v12, v13);
        }

        id v14 = (void (**)(id, void *))a1[6];
        __int16 v15 = +[NSError br_errorWithPOSIXCode:45];
        v14[2](v14, v15);

        goto LABEL_16;
      }
    }
    else
    {
    }
    [a1[4] setCachedShare:0];
    [a1[5] setCompletedUnitCount:1];
    id v18 = objc_alloc((Class)BRShareDestroyOperation);
    uint64_t v19 = [a1[4] fileURL];
    id v20 = [v18 initWithShare:v5 fileURL:v19];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100011A38;
    v28[3] = &unk_1000388A8;
    void v28[4] = a1[4];
    id v30 = a1[6];
    id v29 = a1[5];
    [v20 setShareDestroyCompletionBlock:v28];
    objc_initWeak((id *)location, v20);
    id v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    id v25 = sub_100011B4C;
    __int16 v26 = &unk_100038880;
    objc_copyWeak(&v27, (id *)location);
    [a1[5] setCancellationHandler:&v23];
    uint64_t v21 = objc_msgSend(a1[4], "operationQueue", v23, v24, v25, v26);
    [v21 addOperation:v20];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)location);

    goto LABEL_16;
  }
  id v16 = brc_bread_crumbs();
  __int16 v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10002326C((uint64_t)a1, (uint64_t)v16, v17);
  }

  (*((void (**)(void))a1[6] + 2))();
LABEL_16:
}

void sub_100011A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011A38(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) setCompletedUnitCount:2];
}

void sub_100011B4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

id sub_100011B8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_100011F08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_100011F40(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100043D78 != -1) {
      dispatch_once(&qword_100043D78, &stru_100038BB0);
    }
    id v3 = (id)qword_100043D80;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  uint64_t v6 = [v5 currentPersona];

  id v23 = 0;
  id v7 = [v6 userPersonaUniqueString];
  uint64_t v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0)
  {
    __int16 v9 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v22 = 0;
    id v12 = [v6 copyCurrentPersonaContextWithError:&v22];
    id v13 = v22;
    id v14 = v23;
    id v23 = v12;

    if (v13)
    {
      __int16 v15 = brc_bread_crumbs();
      id v16 = brc_default_log();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
        sub_100022EA4();
      }
    }
    __int16 v9 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

    if (v9)
    {
      __int16 v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v18, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      __int16 v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100022F74();
      }
      __int16 v9 = 0;
      goto LABEL_29;
    }
    id v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100022F0C();
    }

    __int16 v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  id v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100023A14();
  }

  [*(id *)(a1 + 40) invalidate];
  _BRRestorePersona();
}

void sub_1000122D0(_Unwind_Exception *a1)
{
}

void sub_10001231C(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100043D80;
  qword_100043D80 = v1;
}

void sub_10001237C(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100043D88 != -1) {
      dispatch_once(&qword_100043D88, &stru_100038BD0);
    }
    id v3 = (id)qword_100043D90;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  uint64_t v6 = [v5 currentPersona];

  id v24 = 0;
  id v7 = [v6 userPersonaUniqueString];
  uint64_t v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0)
  {
    __int16 v9 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v23 = 0;
    id v13 = [v6 copyCurrentPersonaContextWithError:&v23];
    id v14 = v23;
    id v15 = v24;
    id v24 = v13;

    if (v14)
    {
      id v16 = brc_bread_crumbs();
      __int16 v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
        sub_100022EA4();
      }
    }
    __int16 v9 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

    if (v9)
    {
      id v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        __int16 v28 = v9;
        __int16 v29 = 2112;
        id v30 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      id v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100022F74();
      }
      __int16 v9 = 0;
      goto LABEL_29;
    }
    uint64_t v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100022F0C();
    }

    __int16 v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  id v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100023A7C();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];

  _BRRestorePersona();
}

void sub_100012718(_Unwind_Exception *a1)
{
}

void sub_100012764(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100043D90;
  qword_100043D90 = v1;
}

uint64_t sub_100012AE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012AF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] error refreshing state for item identifier %@: %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    int v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100023AE4(a1, (uint64_t)v4, v5);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100012DB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100012DCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100012F18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100012F34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013274(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000135EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100013610(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 40);
  if (v8)
  {
    if (!v9) {
      goto LABEL_7;
    }
    id v10 = *(void (**)(void))(v9 + 16);
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    id v10 = *(void (**)(void))(v9 + 16);
  }
  v10();
LABEL_7:
}

void sub_1000136D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

uint64_t sub_100013978(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100013988(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_100013CBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_100013CF4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100043D98 != -1) {
      dispatch_once(&qword_100043D98, &stru_100038C68);
    }
    id v3 = (id)qword_100043DA0;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  uint64_t v6 = [v5 currentPersona];

  id v23 = 0;
  id v7 = [v6 userPersonaUniqueString];
  id v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0)
  {
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v22 = 0;
    id v12 = [v6 copyCurrentPersonaContextWithError:&v22];
    id v13 = v22;
    id v14 = v23;
    id v23 = v12;

    if (v13)
    {
      id v15 = brc_bread_crumbs();
      id v16 = brc_default_log();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
        sub_100022EA4();
      }
    }
    uint64_t v9 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

    if (v9)
    {
      __int16 v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        __int16 v27 = v9;
        __int16 v28 = 2112;
        __int16 v29 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v18, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      __int16 v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100022F74();
      }
      uint64_t v9 = 0;
      goto LABEL_29;
    }
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100022F0C();
    }

    uint64_t v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100023BD4();
  }

  [*(id *)(a1 + 40) invalidate];
  _BRRestorePersona();
}

void sub_100014084(_Unwind_Exception *a1)
{
}

void sub_1000140D0(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100043DA0;
  qword_100043DA0 = v1;
}

void sub_100014130(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100043DA8 != -1) {
      dispatch_once(&qword_100043DA8, &stru_100038C88);
    }
    id v3 = (id)qword_100043DB0;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  uint64_t v6 = [v5 currentPersona];

  id v24 = 0;
  id v7 = [v6 userPersonaUniqueString];
  id v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0)
  {
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v23 = 0;
    id v13 = [v6 copyCurrentPersonaContextWithError:&v23];
    id v14 = v23;
    id v15 = v24;
    id v24 = v13;

    if (v14)
    {
      id v16 = brc_bread_crumbs();
      __int16 v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
        sub_100022EA4();
      }
    }
    uint64_t v9 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

    if (v9)
    {
      id v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        __int16 v28 = v9;
        __int16 v29 = 2112;
        id v30 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_29:
    }
  }
  else
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      id v18 = brc_bread_crumbs();
      uint64_t v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_100022F74();
      }
      uint64_t v9 = 0;
      goto LABEL_29;
    }
    uint64_t v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100022F0C();
    }

    uint64_t v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  }
LABEL_10:
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100023C3C();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];

  _BRRestorePersona();
}

void sub_1000144CC(_Unwind_Exception *a1)
{
}

void sub_100014518(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100043DB0;
  qword_100043DB0 = v1;
}

id sub_1000148B0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishEnumeratingWithError:a2];
}

void sub_1000148BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    id v5 = [v4 domain];
    if ([v5 isEqualToString:BRCloudDocsErrorDomain])
    {
      id v6 = [v9 code];

      if (v6 != (id)2)
      {
LABEL_6:
        id v7 = *(void **)(a1 + 32);
        id v8 = objc_msgSend(v9, "br_fileProviderError");
        [v7 finishEnumeratingWithError:v8];

        goto LABEL_8;
      }
      +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1000 userInfo:0];
      id v5 = v9;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_6;
  }
  [*(id *)(a1 + 32) finishEnumeratingUpToPage:0];
  id v9 = +[NSFileProviderManager br_sharedProviderManager];
  objc_msgSend(v9, "br_signalWorkingSetEnumeratorWithCompletionHandler:", &stru_100038CC8);
LABEL_8:
}

id sub_100014B6C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishEnumeratingWithError:a2];
}

void sub_100014B78(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v19 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = v10;
    id v12 = [v10 domain];
    if ([v12 isEqualToString:BRCloudDocsErrorDomain])
    {
      id v13 = [v11 code];

      if (v13 != (id)2)
      {
LABEL_6:
        id v14 = *(void **)(a1 + 32);
        id v15 = objc_msgSend(v11, "br_fileProviderError");
        [v14 finishEnumeratingWithError:v15];

        goto LABEL_8;
      }
      +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1000 userInfo:0];
      id v11 = v12 = v11;
    }

    goto LABEL_6;
  }
  [*(id *)(a1 + 32) didUpdateItems:a2];
  id v16 = *(void **)(a1 + 32);
  __int16 v17 = NSStringFromSelector("asString");
  id v18 = [v19 valueForKey:v17];
  [v16 didDeleteItemsWithIdentifiers:v18];

  objc_msgSend(*(id *)(a1 + 32), "finishEnumeratingChangesUpToSyncAnchor:moreComing:", v9, objc_msgSend(*(id *)(a1 + 40), "isEqualToData:", v9) ^ 1);
LABEL_8:
}

id sub_100014E1C(void *a1)
{
  id v1 = a1;
  id v2 = +[UMUserManager sharedManager];
  id v3 = [v2 currentPersona];
  id v4 = [v3 userPersonaUniqueString];

  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001C75C;
    v7[3] = &unk_100038728;
    id v8 = v4;
    id v9 = v1;
    id v5 = [v7 copy];
  }
  else
  {
    id v5 = objc_retainBlock(v1);
  }

  return v5;
}

id sub_100014F24(void *a1)
{
  id v1 = a1;
  id v2 = +[UMUserManager sharedManager];
  id v3 = [v2 currentPersona];
  id v4 = [v3 userPersonaUniqueString];

  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001CBA8;
    v7[3] = &unk_100038FC8;
    id v8 = v4;
    id v9 = v1;
    id v5 = [v7 copy];
  }
  else
  {
    id v5 = objc_retainBlock(v1);
  }

  return v5;
}

void sub_10001581C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100015840(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v13 = *(_OWORD *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 72);
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    id v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx item providing completion; %@%@",
      buf,
      0x20u);
  }

  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  id v7 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_100024040();
    }
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(void *)(a1 + 40), v13, v14);
  objc_sync_exit(v6);

  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = objc_msgSend(v3, "br_fileProviderError");
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  __brc_leave_section();
}

void sub_100015A20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  __brc_leave_section();
  _Unwind_Resume(a1);
}

void sub_100015EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100016294(_Unwind_Exception *a1)
{
}

void sub_1000162C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  BOOL v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] got new URL %@; %@%@", buf, 0x20u);
  }

  uint64_t v9 = [*(id *)(a1 + 32) fileProviderErrorFromFSError:v6];

  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    id v15 = 0;
    id v11 = [v10 _propertiesForNewItemAtURL:v5 error:&v15];
    id v12 = v15;
    if (!v11)
    {
      long long v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_1000241E0();
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000166AC(_Unwind_Exception *a1)
{
}

void sub_1000166D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  BOOL v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] got new URL %@; %@%@", buf, 0x20u);
  }

  uint64_t v9 = [*(id *)(a1 + 32) fileProviderErrorFromFSError:v6];

  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    id v13 = 0;
    id v11 = [v10 _propertiesForNewItemAtURL:v5 error:&v13];
    id v12 = v13;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100016AC4(_Unwind_Exception *a1)
{
}

void sub_100016AF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  BOOL v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    __int16 v20 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] got new URL %@; %@%@", buf, 0x20u);
  }

  uint64_t v9 = [*(id *)(a1 + 32) fileProviderErrorFromFSError:v6];

  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    objc_msgSend(v9, "br_fileProviderError");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    id v12 = *(void **)(a1 + 32);
    id v14 = 0;
    id v13 = [v12 _propertiesForNewItemAtURL:v5 error:&v14];
    id v11 = v14;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000173B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  __brc_leave_section();
  _Unwind_Resume(a1);
}

uint64_t sub_10001743C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001744C(uint64_t a1)
{
}

void sub_100017454(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017500;
  v8[3] = &unk_100038D90;
  uint64_t v4 = a1[6];
  id v5 = (void *)a1[8];
  v8[4] = a1[7];
  id v6 = v5;
  uint64_t v7 = a1[9];
  id v9 = v6;
  uint64_t v10 = v7;
  objc_msgSend(v2, "fp_reparentUnderFolder:withNewName:completionHandler:", v3, v4, v8);
}

void sub_100017500(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = brc_bread_crumbs();
  BOOL v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    __int16 v20 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] got new URL %@; %@%@", buf, 0x20u);
  }

  id v9 = [*(id *)(a1 + 32) fileProviderErrorFromFSError:v6];

  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = objc_msgSend(v9, "br_fileProviderError");
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v13 + 40);
    id v11 = [v12 _propertiesForNewItemAtURL:v5 error:&obj];
    objc_storeStrong((id *)(v13 + 40), obj);
    (*(void (**)(void, void *, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v11, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

void sub_1000176A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = [*(id *)(a1 + 32) path];
    int v8 = 138412802;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished providing %@ with error %@%@", (uint8_t *)&v8, 0x20u);
  }
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  id v6 = *(id *)(*(void *)(a1 + 40) + 32);
  objc_sync_enter(v6);
  [*(id *)(*(void *)(a1 + 40) + 32) removeObject:*(void *)(a1 + 48)];
  objc_sync_exit(v6);
}

void sub_100017814(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 160), 8);
  __brc_leave_section();
  _Unwind_Resume(a1);
}

void sub_100017DA0(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    int v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000243B8();
    }

    uint64_t v10 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v11 = a3;
  }
  else
  {
    uint64_t v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = a2;
  }
  objc_storeStrong(v10, v11);
}

void sub_1000182AC(_Unwind_Exception *a1)
{
}

void sub_100018304(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      __int16 v20 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, (os_log_type_t)0x90u, "[ERROR] error untrashing item to %@: %@%@", buf, 0x20u);
    }
  }
  else
  {
    id v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000245C0();
    }
  }

  id v9 = [*(id *)(a1 + 32) fileProviderErrorFromFSError:v6];

  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    objc_msgSend(v9, "br_fileProviderError");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v11);
  }
  else
  {
    __int16 v12 = *(void **)(a1 + 32);
    id v14 = 0;
    uint64_t v13 = [v12 _propertiesForNewItemAtURL:v5 error:&v14];
    id v11 = v14;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_1000186E8(_Unwind_Exception *a1)
{
}

void sub_100018714(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 domain];
  if (![v4 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_7;
  }
  id v5 = [v3 code];

  if (v5 != (id)4)
  {
LABEL_7:
    uint64_t v9 = *(void *)(a1 + 40);
    id v6 = objc_msgSend(v3, "br_fileProviderError");
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v6);
    goto LABEL_8;
  }
  id v6 = objc_msgSend(*(id *)(a1 + 32), "br_physicalURL");
  id v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] couldn't delete %@, retrying with physical url %@%@", buf, 0x20u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000188F0;
  v11[3] = &unk_100038648;
  id v12 = *(id *)(a1 + 40);
  objc_msgSend(v6, "fp_deleteWithCompletionHandler:", v11);

LABEL_8:
}

void sub_1000188F0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(a2, "br_fileProviderError");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void sub_100018B2C(_Unwind_Exception *a1)
{
}

void sub_100018E38(_Unwind_Exception *a1)
{
}

void sub_10001905C(_Unwind_Exception *a1)
{
}

void sub_1000196E4(_Unwind_Exception *a1)
{
}

id sub_10001975C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObjResult:a2 error:a3];
}

void sub_1000199E8(_Unwind_Exception *a1)
{
}

void sub_100019FE0(_Unwind_Exception *a1)
{
}

void sub_10001A530(_Unwind_Exception *a1)
{
}

void sub_10001A898(_Unwind_Exception *a1)
{
}

void sub_10001B1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B1E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v8 = 138412546;
    long long v19 = v8;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(a1 + 32);
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)v11), "asString", v19);
        uint64_t v14 = [v12 URLForItemWithPersistentIdentifier:v13];

        __int16 v15 = brc_bread_crumbs();
        id v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v19;
          __int16 v28 = v14;
          __int16 v29 = 2112;
          id v30 = v15;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] downloading file %@ because quicklook can generate its thumbnail%@", buf, 0x16u);
        }

        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        uint64_t v26 = v14;
        __int16 v17 = +[NSArray arrayWithObjects:&v26 count:1];
        id v21 = v6;
        id v20 = *(id *)(a1 + 40);
        id v18 = v14;
        BRStartDownloadForItemsWithOptions();

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v5 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v9);
  }
}

void sub_10001B484(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      id v6 = [*(id *)(a1 + 32) path];
      int v7 = 138412802;
      long long v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, (os_log_type_t)0x90u, "[ERROR] can't start downloading %@: %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10001B5BC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10001B61C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

id sub_10001BA84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 error:a3];
}

void sub_10001C01C(_Unwind_Exception *a1)
{
}

void sub_10001C09C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend(a2, "br_fileProviderError");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
}

void sub_10001C100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    objc_msgSend(a5, "br_fileProviderError");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v10);
  }
  else
  {
    int v7 = *(void **)(a1 + 32);
    id v11 = 0;
    long long v8 = [v7 _propertiesForItemAtURL:a2 error:&v11];
    id v9 = v11;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10001C584(_Unwind_Exception *a1)
{
}

void sub_10001C5D4(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  uint64_t v2 = (void *)qword_100043DC0;
  qword_100043DC0 = v1;
}

void sub_10001C634(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      sub_100024AE0();
    }
  }
}

void sub_10001C75C(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100043DC8 != -1) {
      dispatch_once(&qword_100043DC8, &stru_100038F80);
    }
    id v3 = (id)qword_100043DD0;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  uint64_t v6 = [v5 currentPersona];

  id v25 = 0;
  id v7 = [v6 userPersonaUniqueString];
  long long v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0) {
    goto LABEL_9;
  }
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      id v21 = brc_bread_crumbs();
      long long v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_100022F74();
      }
    }
    else
    {
      __int16 v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100022F0C();
      }

      uint64_t v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      if (v14) {
        goto LABEL_25;
      }
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  id v24 = 0;
  id v9 = [v6 copyCurrentPersonaContextWithError:&v24];
  id v10 = v24;
  id v11 = v25;
  id v25 = v9;

  if (v10)
  {
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      sub_100022EA4();
    }
  }
  uint64_t v14 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

  if (!v14) {
    goto LABEL_9;
  }
  __int16 v15 = brc_bread_crumbs();
  id v16 = brc_default_log();
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    __int16 v29 = v14;
    __int16 v30 = 2112;
    id v31 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  long long v19 = brc_bread_crumbs();
  id v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    sub_100024B48();
  }

LABEL_10:
  _BRRestorePersona();
}

void sub_10001CAFC(_Unwind_Exception *a1)
{
}

void sub_10001CB48(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100043DD0;
  qword_100043DD0 = v1;
}

void sub_10001CBA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v5 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100043DD8 != -1) {
      dispatch_once(&qword_100043DD8, &stru_100038FA0);
    }
    id v6 = (id)qword_100043DE0;
    int v7 = 1;
  }
  else
  {
    id v6 = v5;
    int v7 = 0;
  }
  long long v8 = +[UMUserManager sharedManager];
  id v9 = [v8 currentPersona];

  id v30 = 0;
  id v10 = [v9 userPersonaUniqueString];
  id v11 = v10;
  if (v10 == v6 || ([v10 isEqualToString:v6] & 1) != 0) {
    goto LABEL_9;
  }
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v7 && ([v9 isDataSeparatedPersona] & 1) == 0)
    {
      uint64_t v26 = brc_bread_crumbs();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_100022F74();
      }
    }
    else
    {
      id v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100022F0C();
      }

      id v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      if (v12) {
        goto LABEL_25;
      }
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v12 = 0;
    goto LABEL_10;
  }
  id v29 = 0;
  id v13 = [v9 copyCurrentPersonaContextWithError:&v29];
  id v14 = v29;
  id v15 = v30;
  id v30 = v13;

  if (v14)
  {
    id v16 = brc_bread_crumbs();
    __int16 v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
      sub_100022EA4();
    }
  }
  id v12 = [v9 generateAndRestorePersonaContextWithPersonaUniqueString:v6];

  if (!v12) {
    goto LABEL_9;
  }
  id v18 = brc_bread_crumbs();
  long long v19 = brc_default_log();
  if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
  {
    uint64_t v28 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = v28;
    __int16 v33 = 2112;
    __int16 v34 = v12;
    __int16 v35 = 2112;
    id v36 = v18;
    _os_log_error_impl((void *)&_mh_execute_header, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  long long v22 = brc_bread_crumbs();
  uint64_t v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
    sub_100024C18();
  }

  if (!xpc_activity_set_state(v3, 3))
  {
    id v24 = brc_bread_crumbs();
    id v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_100024BB0();
    }
  }
LABEL_10:

  _BRRestorePersona();
}

void sub_10001CFCC(_Unwind_Exception *a1)
{
}

void sub_10001D020(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100043DE0;
  qword_100043DE0 = v1;
}

void sub_10001D0C0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10001D4B4(_Unwind_Exception *a1)
{
}

void sub_10001D4E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    int v7 = "-[BRFileProviderShareOperationProxy startOperation:toCopySharingInfoAtURL:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001D60C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[BRFileProviderShareOperationProxy startOperation:toCopySharingInfoAtURL:reply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001D9C4(_Unwind_Exception *a1)
{
}

void sub_10001D9F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BRFileProviderShareOperationProxy createSharingInfoForURL:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001DB0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BRFileProviderShareOperationProxy createSharingInfoForURL:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001DEEC(_Unwind_Exception *a1)
{
}

void sub_10001DF20(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toModifyRecordAccessAtURL:allowAccess:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001E044(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[BRFileProviderShareOperationProxy startOperation:toModifyRecordAccessAtURL:allowAccess:reply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001E440(_Unwind_Exception *a1)
{
}

void sub_10001E474(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toCopyParticipantTokenAtURL:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001E598(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[BRFileProviderShareOperationProxy startOperation:toCopyParticipantTokenAtURL:reply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001E994(_Unwind_Exception *a1)
{
}

void sub_10001E9C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toPrepFolderForSharingAt:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001EAD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toPrepFolderForSharingAt:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001EEA8(_Unwind_Exception *a1)
{
}

void sub_10001EEDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toProcessSubitemsAtURL:maxSubsharesFailures:processType:repl"
         "y:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001EFE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toProcessSubitemsAtURL:maxSubsharesFailures:processType:repl"
         "y:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001F3A4(_Unwind_Exception *a1)
{
}

void sub_10001F3D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toCopyEtagAtURL:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001F4F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BRFileProviderShareOperationProxy startOperation:toCopyEtagAtURL:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001F8C8(_Unwind_Exception *a1)
{
}

void sub_10001F8FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toCopyShareInfoAtURL:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001FA20(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[BRFileProviderShareOperationProxy startOperation:toCopyShareInfoAtURL:reply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001FC60(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[BRFileProviderShareOperationProxy startOperation:toCopySharingAccessToken:reply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002005C(_Unwind_Exception *a1)
{
}

void sub_100020090(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toCopyShortTokenAtURL:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000201A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BRFileProviderShareOperationProxy startOperation:toCopyShortTokenAtURL:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100020528(_Unwind_Exception *a1)
{
}

void sub_100020558(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316674;
    id v7 = "-[BRFileProviderShareOperationProxy copyCurrentUserNameAndDisplayHandleWithReply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    uint64_t v13 = 0;
    __int16 v14 = 2112;
    uint64_t v15 = 0;
    __int16 v16 = 2112;
    id v17 = v3;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v6, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100020694(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v18 = 136316674;
    id v19 = "-[BRFileProviderShareOperationProxy copyCurrentUserNameAndDisplayHandleWithReply:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v14;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@, %@, %@)%@", (uint8_t *)&v18, 0x48u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100020AD8(_Unwind_Exception *a1)
{
}

void sub_100020B0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100020C24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BRFileProviderShareOperationProxy startOperation:toCopyDocumentURLForRecordID:syncIfNeeded:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100020FFC(_Unwind_Exception *a1)
{
}

void sub_100021030(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136316162;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toCopyShareURLForShare:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    __int16 v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v6, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100021154(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136316162;
    id v13 = "-[BRFileProviderShareOperationProxy startOperation:toCopyShareURLForShare:reply:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@, %@)%@", (uint8_t *)&v12, 0x34u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100021550(_Unwind_Exception *a1)
{
}

void sub_100021584(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toLookupShareParticipants:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002169C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BRFileProviderShareOperationProxy startOperation:toLookupShareParticipants:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100021A74(_Unwind_Exception *a1)
{
}

void sub_100021AA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315906;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toSaveSharingInfo:reply:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = 0;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    __int16 v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v6, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100021BC0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  __int16 v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315906;
    __int16 v10 = "-[BRFileProviderShareOperationProxy startOperation:toSaveSharingInfo:reply:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@, %@)%@", (uint8_t *)&v9, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100022154(_Unwind_Exception *a1)
{
}

void sub_1000221A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toUnshareShare:forceDelete:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000222B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toUnshareShare:forceDelete:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000223C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[BRFileProviderShareOperationProxy startOperation:toUnshareShare:forceDelete:reply:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[INFO] %s: reply(%@)%@", (uint8_t *)&v6, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000227BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000227F4(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100024C80((uint64_t)v2, v3);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_100022870(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100024CF8((uint64_t)v2, v3);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void sub_10002290C()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - signal changes to fileproviderd%@");
}

void sub_100022974()
{
  sub_100007C44();
  sub_100007C88((void *)&_mh_execute_header, v0, v1, "[ERROR] We had an error %@, but returning as if we didn't have an error to unblock materialization%@");
}

void sub_1000229DC()
{
  sub_100007CC4();
  sub_100007D14((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - There was an error while fetching items: %@%@");
}

void sub_100022A4C()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - Setting up notifications%@");
}

void sub_100022AB4()
{
  sub_100007C7C();
  sub_100007CE0((void *)&_mh_execute_header, v0, v1, "[CRIT] Assertion failed: !_isSettingUpNotificationReceiving%@", v2, v3, v4, v5, v6);
}

void sub_100022B1C()
{
  sub_100007CFC();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - Finishing right away when invalidated%@");
}

void sub_100022B88()
{
  sub_100007CC4();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Completed gathering with items %@ observer %@%@", v4, 0x2Au);
}

void sub_100022C18()
{
  sub_100007C7C();
  sub_100007CE0((void *)&_mh_execute_header, v0, v1, "[CRIT] Assertion failed: self->_gatherEnumerationObserver == nil%@", v2, v3, v4, v5, v6);
}

void sub_100022C80()
{
  sub_100007C7C();
  sub_100007CE0((void *)&_mh_execute_header, v0, v1, "[CRIT] Assertion failed: !self->_gatherEnumerationObserver%@", v2, v3, v4, v5, v6);
}

void sub_100022CE8()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - Already completed gather so finishing enumerating up to nil page token%@");
}

void sub_100022D50()
{
  sub_100007C7C();
  sub_100007D14((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - token expired (current rank %llu)%@");
}

void sub_100022DD4()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - no update to send back%@");
}

void sub_100022E3C()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - receiveProgressUpdates in the enumerator - just calling the reply.%@");
}

void sub_100022EA4()
{
  sub_100007C44();
  sub_100007C88((void *)&_mh_execute_header, v0, v1, "[ERROR] won't restore persona: %@%@");
}

void sub_100022F0C()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", v2, v3, v4, v5, v6);
}

void sub_100022F74()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", v2, v3, v4, v5, v6);
}

void sub_100022FDC()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - invalidating change token%@");
}

void sub_100023044()
{
  sub_100007CFC();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] %@ - Invalidating%@");
}

void sub_1000230B0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, (os_log_type_t)0x90u, "[ERROR] there was an error when listing items: %@%@", (uint8_t *)&v3, 0x16u);
}

void sub_100023138()
{
  sub_100007C7C();
  sub_100007CE0((void *)&_mh_execute_header, v0, v1, "[CRIT] UNREACHABLE: should be implemented by subclass%@", v2, v3, v4, v5, v6);
}

void sub_1000231A0(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *a1;
  uint8_t v6 = +[NSError br_errorWithPOSIXCode:45];
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  __int16 v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
}

void sub_10002326C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412802;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = 0;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", (uint8_t *)&v4, 0x20u);
}

void sub_100023300()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] no thumbnail left to fetch%@", v2, v3, v4, v5, v6);
}

void sub_100023368()
{
  sub_100007C7C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: fileObjectIDByRecordIDs[recordID] == nil%@", v1, 0xCu);
}

void sub_1000233DC()
{
  sub_100007C7C();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] received a thumbnail for %@%@");
}

void sub_100023450()
{
  sub_100007C7C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, (os_log_type_t)0x90u, "[ERROR] no new fetch thumbnail operation found, returning.%@", v1, 0xCu);
}

void sub_1000234C4()
{
  sub_100007C7C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, (os_log_type_t)0x90u, "[ERROR] no zone ID found, returning.%@", v1, 0xCu);
}

void sub_100023538()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] finished fetching all thumbnail batches%@", v2, v3, v4, v5, v6);
}

void sub_1000235A0()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] fetching next thumbnail batch%@", v2, v3, v4, v5, v6);
}

void sub_100023608(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100007C5C((void *)&_mh_execute_header, a2, a3, "[DEBUG] completed fetching thumbnail batch for %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100023684()
{
  sub_100007C44();
  sub_100007C88((void *)&_mh_execute_header, v0, v1, "[ERROR] there was an error retrieving the URL for %@%@");
}

void sub_1000236EC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] item is not shared, returning default options%@", (uint8_t *)&v2, 0xCu);
}

void sub_100023764(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching collaboration metadata%@", (uint8_t *)&v2, 0xCu);
}

void sub_1000237DC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: manager not found%@", (uint8_t *)&v2, 0xCu);
}

void sub_100023854(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100007C88((void *)&_mh_execute_header, a2, a3, "[ERROR] there was an error retrieving the share URL for %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_1000238D0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: should be implemented by subclass%@", (uint8_t *)&v2, 0xCu);
}

void sub_100023948(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *a1;
  uint8_t v6 = +[NSError br_errorWithPOSIXCode:45];
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  __int16 v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@)%@", (uint8_t *)&v7, 0x20u);
}

void sub_100023A14()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] sharing service source connection invalidated%@", v2, v3, v4, v5, v6);
}

void sub_100023A7C()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] sharing service source connection interrupted%@", v2, v3, v4, v5, v6);
}

void sub_100023AE4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100007C5C((void *)&_mh_execute_header, a2, a3, "[DEBUG] finished refreshing state for item identifier: %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100023B60()
{
  sub_100007C7C();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] Current account id is: %@%@");
}

void sub_100023BD4()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] collaboration service source connection invalidated%@", v2, v3, v4, v5, v6);
}

void sub_100023C3C()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] collaboration service source connection interrupted%@", v2, v3, v4, v5, v6);
}

void sub_100023CA4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, (os_log_type_t)0x90u, "[ERROR] can't create a file enumeration without a url%@", (uint8_t *)&v2, 0xCu);
}

void sub_100023D1C()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] Not allowing legacy extension to start when fpfs is enabled%@", v2, v3, v4, v5, v6);
}

void sub_100023D84()
{
  sub_100007C7C();
  sub_100007CE0((void *)&_mh_execute_header, v0, v1, "[CRIT] Assertion failed: _witness != nil%@", v2, v3, v4, v5, v6);
}

void sub_100023DEC()
{
  sub_100007C7C();
  sub_100007CE0((void *)&_mh_execute_header, v0, v1, "[CRIT] Assertion failed: fd >= 0%@", v2, v3, v4, v5, v6);
}

void sub_100023E54()
{
  sub_100007C7C();
  sub_100007CE0((void *)&_mh_execute_header, v0, v1, "[CRIT] Assertion failed: dataSeparated%@", v2, v3, v4, v5, v6);
}

void sub_100023EBC()
{
  sub_100007C7C();
  sub_100007CE0((void *)&_mh_execute_header, v0, v1, "[CRIT] Assertion failed: _downloadOperationByPath[path] == nil%@", v2, v3, v4, v5, v6);
}

void sub_100023F24(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 path];
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, (os_log_type_t)0x90u, "[ERROR] Someone tries to coordinate at the side fault URL '%@', odd, but allow it%@", (uint8_t *)&v6, 0x16u);
}

void sub_100023FD8()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] url exists, granting the read%@", v2, v3, v4, v5, v6);
}

void sub_100024040()
{
  sub_100007C7C();
  sub_100007CE0((void *)&_mh_execute_header, v0, v1, "[CRIT] Assertion failed: self->_downloadOperationByPath[path]%@", v2, v3, v4, v5, v6);
}

void sub_1000240A8()
{
  sub_100007C44();
  sub_100007C88((void *)&_mh_execute_header, v0, v1, "[ERROR] can't evict item at url: %@%@");
}

void sub_100024110()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] stop providing %@%@");
}

void sub_100024178()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] Item changed at URL %@%@");
}

void sub_1000241E0()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] couldn't find item after importing it: %@%@");
}

void sub_100024248()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] source URL: %@%@");
}

void sub_1000242B0(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Taking coordinated read on source url %@ because it needs downloading%@", buf, 0x16u);
}

void sub_100024318(void *a1)
{
  os_log_t v1 = [a1 path];
  uint64_t v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_10001D0A8();
  sub_10001D0C0((void *)&_mh_execute_header, v3, v4, "[DEBUG] trashing %@%@", v5, v6, v7, v8, v9);
}

void sub_1000243B8()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] failed to coordinate the deletion: %@%@");
}

void sub_100024420()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] untrashing item to %@%@");
}

void sub_100024488()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] couldn't use putback url, fallback to default container%@", v2, v3, v4, v5, v6);
}

void sub_1000244F0()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] untrash with putback url: %@%@");
}

void sub_100024558()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] untrashing from url: %@%@");
}

void sub_1000245C0()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] item was untrashed to %@%@");
}

void sub_100024628()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] returning %@%@");
}

void sub_100024690()
{
  sub_100007C44();
  sub_100007C88((void *)&_mh_execute_header, v0, v1, "[ERROR] returning nil, there was an error: %@%@");
}

void sub_1000246F8()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] we have a bookmark, returning its target%@", v2, v3, v4, v5, v6);
}

void sub_100024760()
{
  sub_10001D080();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] height (%.2f) is greater than max height (%.2f)%@", v1, 0x20u);
}

void sub_1000247D4()
{
  sub_10001D080();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] width (%.2f) is greater than max width (%.2f)%@", v1, 0x20u);
}

void sub_100024848()
{
  sub_100007C44();
  sub_100007C88((void *)&_mh_execute_header, v0, v1, "[ERROR] can't find container with ID %@%@");
}

void sub_1000248B0(void *a1)
{
  os_log_t v1 = [a1 path];
  sub_10001D0A8();
  sub_10001D0C0((void *)&_mh_execute_header, v2, v3, "[DEBUG] Not allowing sharing of %@ because it's a finder bookmark%@", v4, v5, v6, v7, v8);
}

void sub_100024940()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] creating default Documents folder%@", v2, v3, v4, v5, v6);
}

void sub_1000249A8()
{
  sub_100007C44();
  sub_100007C88((void *)&_mh_execute_header, v0, v1, "[ERROR] can't find bundle with id '%@'%@");
}

void sub_100024A10()
{
  sub_100007C44();
  sub_100007C5C((void *)&_mh_execute_header, v0, v1, "[DEBUG] bundle '%@' is not entitled to used iCloud Drive%@");
}

void sub_100024A78()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] received account did update notification, signal changes to fileproviderd%@", v2, v3, v4, v5, v6);
}

void sub_100024AE0()
{
  sub_100007C44();
  sub_100007C88((void *)&_mh_execute_header, v0, v1, "[ERROR] failed to signal enumerator for root container: %@%@");
}

void sub_100024B48()
{
  sub_100007C7C();
  sub_100007CE0((void *)&_mh_execute_header, v0, v1, "[CRIT] UNREACHABLE: Failed to adopt persona for block adoption%@", v2, v3, v4, v5, v6);
}

void sub_100024BB0()
{
  sub_100007C7C();
  sub_100007CA8((void *)&_mh_execute_header, v0, v1, "[DEBUG] Failed to defer the activity after persona failure.%@", v2, v3, v4, v5, v6);
}

void sub_100024C18()
{
  sub_100007C7C();
  sub_100007CE0((void *)&_mh_execute_header, v0, v1, "[CRIT] UNREACHABLE: Can't adopt persona for xpc activity, deferring the activity%@", v2, v3, v4, v5, v6);
}

void sub_100024C80(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] share service source connection invalidated%@", (uint8_t *)&v2, 0xCu);
}

void sub_100024CF8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] share service source connection interrupted%@", (uint8_t *)&v2, 0xCu);
}

uint64_t BRCXPCSharingOperationInterface()
{
  return _BRCXPCSharingOperationInterface();
}

uint64_t BREntitledContainerIdentifiers()
{
  return _BREntitledContainerIdentifiers();
}

uint64_t BRFetchCKShareForItemAtURL()
{
  return _BRFetchCKShareForItemAtURL();
}

uint64_t BRFetchCollaborationIdentifierForItemAtURL()
{
  return _BRFetchCollaborationIdentifierForItemAtURL();
}

uint64_t BRFileCoordinatorReadingOptionsPrettyPrint()
{
  return _BRFileCoordinatorReadingOptionsPrettyPrint();
}

uint64_t BRSharingCreateShareForItemAtURL()
{
  return _BRSharingCreateShareForItemAtURL();
}

uint64_t BRStartDownloadForItemsWithOptions()
{
  return _BRStartDownloadForItemsWithOptions();
}

uint64_t FPGetTagsFromTagsData()
{
  return _FPGetTagsFromTagsData();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return _FPIsCloudDocsWithFPFSEnabled();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t _BRRestorePersona()
{
  return __BRRestorePersona();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __brc_create_section()
{
  return ___brc_create_section();
}

uint64_t __brc_leave_section()
{
  return ___brc_leave_section();
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

uint64_t brc_bread_crumbs()
{
  return _brc_bread_crumbs();
}

uint64_t brc_default_log()
{
  return _brc_default_log();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

uint64_t getSharingServiceInterface()
{
  return _getSharingServiceInterface();
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

uint64_t voucher_process_can_use_arbitrary_personas()
{
  return _voucher_process_can_use_arbitrary_personas();
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend__signalChange(void *a1, const char *a2, ...)
{
  return [a1 _signalChange];
}

id objc_msgSend__startObservingAccountChangesIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _startObservingAccountChangesIfNeeded];
}

id objc_msgSend_additionalRequestHTTPHeaders(void *a1, const char *a2, ...)
{
  return [a1 additionalRequestHTTPHeaders];
}

id objc_msgSend_allContainers(void *a1, const char *a2, ...)
{
  return [a1 allContainers];
}

id objc_msgSend_allContainersByContainerID(void *a1, const char *a2, ...)
{
  return [a1 allContainersByContainerID];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_asFileProviderItem(void *a1, const char *a2, ...)
{
  return [a1 asFileProviderItem];
}

id objc_msgSend_asString(void *a1, const char *a2, ...)
{
  return [a1 asString];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cachedShare(void *a1, const char *a2, ...)
{
  return [a1 cachedShare];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_clientPrivilegesDescriptor(void *a1, const char *a2, ...)
{
  return [a1 clientPrivilegesDescriptor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collaborationMetadata(void *a1, const char *a2, ...)
{
  return [a1 collaborationMetadata];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return [a1 currentPersona];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConnection(void *a1, const char *a2, ...)
{
  return [a1 defaultConnection];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_documentsURL(void *a1, const char *a2, ...)
{
  return [a1 documentsURL];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_fail(void *a1, const char *a2, ...)
{
  return [a1 fail];
}

id objc_msgSend_fileObjectID(void *a1, const char *a2, ...)
{
  return [a1 fileObjectID];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fromRelativePath(void *a1, const char *a2, ...)
{
  return [a1 fromRelativePath];
}

id objc_msgSend_getDeviceConfigurationString(void *a1, const char *a2, ...)
{
  return [a1 getDeviceConfigurationString];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_initialSyncAnchor(void *a1, const char *a2, ...)
{
  return [a1 initialSyncAnchor];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateChangeToken(void *a1, const char *a2, ...)
{
  return [a1 invalidateChangeToken];
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparatedPersona];
}

id objc_msgSend_isDead(void *a1, const char *a2, ...)
{
  return [a1 isDead];
}

id objc_msgSend_isDocumentID(void *a1, const char *a2, ...)
{
  return [a1 isDocumentID];
}

id objc_msgSend_isFolderOrAliasID(void *a1, const char *a2, ...)
{
  return [a1 isFolderOrAliasID];
}

id objc_msgSend_isFolderSharingProxyEntitled(void *a1, const char *a2, ...)
{
  return [a1 isFolderSharingProxyEntitled];
}

id objc_msgSend_isKnownToServer(void *a1, const char *a2, ...)
{
  return [a1 isKnownToServer];
}

id objc_msgSend_isManagedProvider(void *a1, const char *a2, ...)
{
  return [a1 isManagedProvider];
}

id objc_msgSend_isShared(void *a1, const char *a2, ...)
{
  return [a1 isShared];
}

id objc_msgSend_isSharingPrivateInterfaceEntitled(void *a1, const char *a2, ...)
{
  return [a1 isSharingPrivateInterfaceEntitled];
}

id objc_msgSend_isSharingProxyEntitled(void *a1, const char *a2, ...)
{
  return [a1 isSharingProxyEntitled];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemIdentifier];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return [a1 listeners];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_maxRecordCountInFetchRecordsOperation(void *a1, const char *a2, ...)
{
  return [a1 maxRecordCountInFetchRecordsOperation];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newLegacySyncProxy(void *a1, const char *a2, ...)
{
  return [a1 newLegacySyncProxy];
}

id objc_msgSend_newSyncProxy(void *a1, const char *a2, ...)
{
  return [a1 newSyncProxy];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return [a1 operationQueue];
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return [a1 ownerName];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return [a1 participants];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_perAppAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 perAppAccountIdentifier];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateCloudDatabase];
}

id objc_msgSend_publicPermission(void *a1, const char *a2, ...)
{
  return [a1 publicPermission];
}

id objc_msgSend_rawID(void *a1, const char *a2, ...)
{
  return [a1 rawID];
}

id objc_msgSend_remoteObject(void *a1, const char *a2, ...)
{
  return [a1 remoteObject];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_shareOptions(void *a1, const char *a2, ...)
{
  return [a1 shareOptions];
}

id objc_msgSend_sharedCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 sharedCloudDatabase];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_standardOptions(void *a1, const char *a2, ...)
{
  return [a1 standardOptions];
}

id objc_msgSend_startAccountTokenChangeObserverIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 startAccountTokenChangeObserverIfNeeded];
}

id objc_msgSend_suggestedBatchSize(void *a1, const char *a2, ...)
{
  return [a1 suggestedBatchSize];
}

id objc_msgSend_suggestedPageSize(void *a1, const char *a2, ...)
{
  return [a1 suggestedPageSize];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}