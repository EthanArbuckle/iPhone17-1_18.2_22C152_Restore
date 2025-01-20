void sub_100003610(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  unsigned char v32[128];

  v1 = a1;
  v2 = *(void **)(a1 + 32);
  v3 = [v2 phoneNumbers];
  v4 = [v2 _canonicalizedPhoneNumbersToPhoneNumbers:v3];

  v5 = [*(id *)(v1 + 32) store];
  v6 = [v4 allKeys];
  v29 = 0;
  v7 = [v5 firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:v6 error:&v29];
  v8 = v29;

  if (v7
    && ([*(id *)(v1 + 32) _storeIdentificationEntryToIdentificationEntriesForDictionary:v7],
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    v22 = v7;
    v23 = v8;
    v24 = v1;
    v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v9 count]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v10;
    v13 = [v12 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v13)
    {
      v14 = v13;
      v15 = *(void *)v26;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v18 = [v12 objectForKeyedSubscript:v17];
          v19 = [v4 objectForKeyedSubscript:v17];
          if (v19)
          {
            [v11 setObject:v18 forKeyedSubscript:v19];
          }
          else
          {
            v20 = sub_10000492C();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v17;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Canonicalized phone number '%@' from store did not match any canonicalized phone numbers requested, so skipping it but this may indicate a problem with the phone number canonicalization logic", buf, 0xCu);
            }
          }
        }
        v14 = [v12 countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v14);
    }

    v21 = [v11 copy];
    v8 = v23;
    v1 = v24;
    v7 = v22;
  }
  else
  {
    v12 = 0;
    v21 = 0;
  }
  (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
}

void sub_1000038B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = sub_10000492C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100024120();
    }
  }
  if ([v5 count] || !_os_feature_enabled_impl())
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v16 = v5;
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = *(id *)(a1 + 32);
    id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v14 = *(void **)(a1 + 40);
          uint64_t v15 = *(unsigned __int8 *)(a1 + 56);
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10000CBB8;
          v18[3] = &unk_100034E70;
          id v19 = v8;
          uint64_t v20 = v13;
          [v14 fetchLiveIdentityInfoFor:v13 cacheOnly:v15 completionHandler:v18];
        }
        id v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = v16;
  }
}

void sub_1000048C4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_10000492C()
{
  if (qword_10003D088[0] != -1) {
    dispatch_once(qword_10003D088, &stru_100034C90);
  }
  v0 = (void *)qword_10003D080;

  return v0;
}

uint64_t FTServerBag.identityWaitSeconds.getter()
{
  NSString v1 = sub_100025B90();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_100025D10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100004B18((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    sub_100004AB8((uint64_t)v7);
    return 5;
  }
  sub_10001A988();
  if ((swift_dynamicCast() & 1) == 0) {
    return 5;
  }
  id v3 = [v5 unsignedIntegerValue];

  return (uint64_t)v3;
}

uint64_t sub_100004AB8(uint64_t a1)
{
  uint64_t v2 = sub_100004B80(&qword_10003CFA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004B18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B80(&qword_10003CFA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004B80(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005450(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v12;

        goto LABEL_47;
      case 2u:
        uint64_t v15 = objc_alloc_init(LiveLookupIcon);
        objc_storeStrong((id *)(a1 + 16), v15);
        if PBReaderPlaceMark() && (sub_1000078E0((uint64_t)v15, a2))
        {
          PBReaderRecallMark();

LABEL_47:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }

        return 0;
      case 3u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (2)
        {
          unint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v19 == -1 || v19 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v20 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
            v18 |= (unint64_t)(v20 & 0x7F) << v16;
            if (v20 < 0)
            {
              v16 += 7;
              BOOL v9 = v17++ >= 9;
              if (v9)
              {
                LODWORD(v18) = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_41:
        uint64_t v25 = 8;
        goto LABEL_46;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v18 = 0;
        *(unsigned char *)(a1 + 40) |= 2u;
        while (2)
        {
          unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v23 == -1 || v23 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
            v18 |= (unint64_t)(v24 & 0x7F) << v21;
            if (v24 < 0)
            {
              v21 += 7;
              BOOL v9 = v22++ >= 9;
              if (v9)
              {
                LODWORD(v18) = 0;
                goto LABEL_45;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_45:
        uint64_t v25 = 24;
LABEL_46:
        *(_DWORD *)(a1 + v25) = v18;
        goto LABEL_47;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_47;
    }
  }
}

void sub_10000611C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_10000615C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v5 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v6 = [WeakRetained queue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100006220;
    v7[3] = &unk_100034A98;
    id v8 = v3;
    BOOL v9 = v5;
    dispatch_async(v6, v7);
  }
}

void sub_100006220(uint64_t a1)
{
  uint64_t v2 = sub_10000492C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Request with requestIdentifier %@ completed", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) extension];

  if (v4)
  {
    [*(id *)(a1 + 40) setExtension:0];
    unsigned int v5 = [*(id *)(a1 + 40) completionHandler];
    v5[2](v5, 0);

    [*(id *)(a1 + 40) setCompletionHandler:0];
  }
}

void sub_10000631C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v9 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006400;
    block[3] = &unk_100034AE8;
    id v11 = v5;
    id v12 = v6;
    uint64_t v13 = v8;
    dispatch_async(v9, block);
  }
}

void sub_100006400(uint64_t a1)
{
  uint64_t v2 = sub_10000492C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 138412546;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Request with requestIdentifier %@ was cancelled. Error: %@", (uint8_t *)&v9, 0x16u);
  }

  id v5 = [*(id *)(a1 + 48) extension];

  if (v5)
  {
    [*(id *)(a1 + 48) setExtension:0];
    id v6 = [*(id *)(a1 + 48) completionHandler];
    uint64_t v7 = [*(id *)(a1 + 48) hostCancellationError];
    id v8 = v7;
    if (!v7) {
      id v8 = *(void **)(a1 + 40);
    }
    ((void (**)(void, void *))v6)[2](v6, v8);

    [*(id *)(a1 + 48) setCompletionHandler:0];
  }
}

void sub_100006530(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained queue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000065F4;
    v7[3] = &unk_100034A98;
    id v8 = v3;
    int v9 = v5;
    dispatch_async(v6, v7);
  }
}

void sub_1000065F4(uint64_t a1)
{
  uint64_t v2 = sub_10000492C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10002351C(a1, v2);
  }

  id v3 = [*(id *)(a1 + 40) extension];

  if (v3)
  {
    [*(id *)(a1 + 40) setExtension:0];
    uint64_t v4 = +[NSError cx_callDirectoryManagerErrorWithCode:2];
    id v5 = [*(id *)(a1 + 40) completionHandler];
    ((void (**)(void, void *))v5)[2](v5, v4);

    [*(id *)(a1 + 40) setCompletionHandler:0];
  }
}

void sub_1000066B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006794;
  block[3] = &unk_100034AE8;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v8;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void sub_100006794(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = sub_10000492C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100023598(a1, v2, v3);
    }

    uint64_t v4 = [*(id *)(a1 + 40) extension];

    if (v4)
    {
      [*(id *)(a1 + 40) setExtension:0];
      id v5 = [*(id *)(a1 + 40) completionHandler];
      v5[2](v5, *(void *)(a1 + 32));

      [*(id *)(a1 + 40) setCompletionHandler:0];
    }
  }
  else
  {
    [*(id *)(a1 + 40) setRequestIdentifier:*(void *)(a1 + 48)];
    id v6 = [*(id *)(a1 + 40) extension];
    uint64_t v7 = [v6 _extensionContextForUUID:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setContext:v7];

    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = [v8 context];
    [v9 setDelegate:v8];

    id v10 = [*(id *)(a1 + 40) context];
    [v10 activate];
  }
}

intptr_t sub_100006B48(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006C04(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = 0;
  [v2 extensionDataRequest:v3 isIncrementalLoadingAllowedWithError:&v5];
  id v4 = v5;

  if (v4) {
    [*(id *)(a1 + 32) _cancelWithError:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100006D6C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = 0;
  unsigned __int8 v5 = [v2 extensionDataRequest:v3 addedBlockingEntryData:v4 error:&v7];
  id v6 = v7;

  if ((v5 & 1) == 0) {
    [*(id *)(a1 + 32) _cancelWithError:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100006ECC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = 0;
  unsigned __int8 v5 = [v2 extensionDataRequest:v3 removedBlockingEntryData:v4 error:&v7];
  id v6 = v7;

  if ((v5 & 1) == 0) {
    [*(id *)(a1 + 32) _cancelWithError:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100007008(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = 0;
  unsigned __int8 v4 = [v2 extensionDataRequest:v3 removedAllBlockingEntriesWithError:&v6];
  id v5 = v6;

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) _cancelWithError:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100007168(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = 0;
  unsigned __int8 v5 = [v2 extensionDataRequest:v3 addedIdentificationEntryData:v4 error:&v7];
  id v6 = v7;

  if ((v5 & 1) == 0) {
    [*(id *)(a1 + 32) _cancelWithError:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000072C8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = 0;
  unsigned __int8 v5 = [v2 extensionDataRequest:v3 removedIdentificationEntryData:v4 error:&v7];
  id v6 = v7;

  if ((v5 & 1) == 0) {
    [*(id *)(a1 + 32) _cancelWithError:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100007404(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = 0;
  unsigned __int8 v4 = [v2 extensionDataRequest:v3 removedAllIdentificationEntriesWithError:&v6];
  id v5 = v6;

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) _cancelWithError:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_1000078E0(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      uint64_t v17 = PBReaderReadData();
      uint64_t v18 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v17;
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 24) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_30;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100007F68(uint64_t a1)
{
  id v2 = [objc_alloc((Class)AWDServerConnection) initWithComponentId:80 andBlockOnConfiguration:1];
  [*(id *)(a1 + 32) setServerConnection:v2];
}

AWDCXCallDirectoryChanged *sub_10000807C(uint64_t a1)
{
  id v2 = objc_alloc_init(AWDCXCallDirectoryChanged);
  [(AWDCXCallDirectoryChanged *)v2 setTotalBlockedHandles:*(unsigned int *)(a1 + 40)];
  [(AWDCXCallDirectoryChanged *)v2 setTotalIdentifiedHandles:*(unsigned int *)(a1 + 48)];
  [(AWDCXCallDirectoryChanged *)v2 setIsEnabled:1];
  [(AWDCXCallDirectoryChanged *)v2 setProviderBundleId:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 40) >> 31)
  {
    uint64_t v3 = sub_10000492C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v8 = 134217984;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Number of blocking entries (%ld) greater than INT_MAX", (uint8_t *)&v8, 0xCu);
    }
  }
  if (*(void *)(a1 + 48) >> 31)
  {
    unsigned int v5 = sub_10000492C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v8 = 134217984;
      uint64_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Number of identification entries (%ld) greater than INT_MAX", (uint8_t *)&v8, 0xCu);
    }
  }

  return v2;
}

AWDCXCallDirectoryChanged *sub_10000828C(uint64_t a1)
{
  id v2 = objc_alloc_init(AWDCXCallDirectoryChanged);
  [(AWDCXCallDirectoryChanged *)v2 setProviderBundleId:*(void *)(a1 + 32)];
  [(AWDCXCallDirectoryChanged *)v2 setIsEnabled:*(unsigned __int8 *)(a1 + 40)];

  return v2;
}

void sub_1000083A0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serverConnection];
  id v3 = [v2 newMetricContainerWithIdentifier:*(unsigned int *)(a1 + 48)];

  uint64_t v4 = sub_10000492C();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(unsigned int *)(a1 + 48);
      int v9 = 134217984;
      uint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got metric container for metricId=%lu", (uint8_t *)&v9, 0xCu);
    }

    unint64_t v7 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [v3 setMetric:v7];

    uint64_t v4 = [*(id *)(a1 + 32) serverConnection];
    [v4 submitMetric:v3];
  }
  else if (v5)
  {
    uint64_t v8 = *(unsigned int *)(a1 + 48);
    int v9 = 134217984;
    uint64_t v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skipping reporting for metricId=%lu since no metric container was provided", (uint8_t *)&v9, 0xCu);
  }
}

void start()
{
  NSString v1 = objc_alloc_init(CDXManager);
  id v2 = +[NSXPCListener serviceListener];
  [v2 setDelegate:v1];
  [v2 resume];

  exit(1);
}

void sub_10000864C(id a1)
{
  qword_10003D080 = (uint64_t)os_log_create("com.apple.calls.calldirectory", "Default");

  _objc_release_x1();
}

void sub_100008914(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) extensionsDataSource];
  id v90 = 0;
  id v3 = [v2 installedExtensionsWithError:&v90];
  id v4 = v90;

  BOOL v5 = sub_10000492C();
  uint64_t v6 = v5;
  if (v3)
  {
    uint64_t v68 = a1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100023A7C();
    }

    long long v88 = 0u;
    long long v89 = 0u;
    long long v87 = 0u;
    long long v86 = 0u;
    v65 = v3;
    id obj = v3;
    id v7 = [obj countByEnumeratingWithState:&v86 objects:v91 count:16];
    if (v7)
    {
      id v8 = v7;
      id v73 = 0;
      int v9 = 0;
      uint64_t v10 = *(void *)v87;
      uint64_t v11 = CXLiveLookupExtensionPointIdentifier;
      uint64_t v66 = CXLiveLookupExtensionPointIdentifier;
      do
      {
        char v12 = 0;
        id v69 = v8;
        do
        {
          if (*(void *)v87 != v10) {
            objc_enumerationMutation(obj);
          }
          unsigned int v13 = *(void **)(*((void *)&v86 + 1) + 8 * (void)v12);
          uint64_t v14 = [v13 extensionPointIdentifier];
          unsigned int v15 = [v14 isEqualToString:v11];

          if (v15)
          {
            uint64_t v16 = v10;
            uint64_t v17 = v9;
            if (!v73) {
              id v73 = objc_alloc_init((Class)NSMutableArray);
            }
            id v18 = objc_alloc((Class)LSApplicationRecord);
            unint64_t v19 = [v13 _plugIn];
            char v20 = [v19 containingUrl];
            id v85 = v4;
            uint64_t v21 = 1;
            id v22 = [v18 initWithURL:v20 allowPlaceholder:1 error:&v85];
            id v23 = v85;

            if (v22) {
              uint64_t v21 = (uint64_t)[v22 isAppStoreVendable];
            }
            char v24 = [*(id *)(v68 + 32) liveLookupStore];
            uint64_t v25 = [v13 identifier];
            v26 = [v24 extensionUpdateFor:v25 isAppStorVendable:v21];
            [v73 addObject:v26];

            id v4 = v23;
            int v9 = v17;
            uint64_t v10 = v16;
            uint64_t v11 = v66;
            id v8 = v69;
          }
          else
          {
            if (!v9)
            {
              int v9 = +[NSMutableSet set];
            }
            id v22 = [v13 identifier];
            [v9 addObject:v22];
          }

          char v12 = (char *)v12 + 1;
        }
        while (v8 != v12);
        id v8 = [obj countByEnumeratingWithState:&v86 objects:v91 count:16];
      }
      while (v8);
    }
    else
    {
      id v73 = 0;
      int v9 = 0;
    }

    unsigned int v27 = [*(id *)(v68 + 32) afterFirstUnlock];
    v28 = sub_10000492C();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v27)
    {
      if (v29) {
        sub_1000239D0();
      }

      v28 = [*(id *)(v68 + 32) liveLookupStore];
      [v28 updateExtensionsWith:v73];
    }
    else if (v29)
    {
      sub_100023A38(v28);
    }

    v30 = *(void **)(v68 + 32);
    id v84 = v4;
    v31 = [v30 storedExtensionIdentifiersWithError:&v84];
    id v32 = v84;

    v33 = sub_10000492C();
    v34 = v33;
    if (v31)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        sub_100023968();
      }

      v35 = *(void **)(v68 + 32);
      id v83 = v32;
      v36 = [v35 enabledStoredExtensionIdentifiersWithError:&v83];
      id v37 = v83;

      v38 = sub_10000492C();
      v39 = v38;
      if (v36)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          sub_100023900();
        }

        v40 = *(void **)(v68 + 32);
        id v82 = v37;
        v41 = [v40 disabledStoredExtensionIdentifiersWithError:&v82];
        id v42 = v82;

        v43 = sub_10000492C();
        v44 = v43;
        if (v41)
        {
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
            sub_100023898();
          }

          v45 = *(void **)(v68 + 32);
          id v81 = v42;
          v46 = [v45 unavailableStoredExtensionIdentifiersWithError:&v81];
          id obja = v81;

          v47 = sub_10000492C();
          v48 = v47;
          if (v46)
          {
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
              sub_100023830();
            }

            id v49 = [v9 mutableCopy];
            [v49 minusSet:v31];
            id v50 = [v9 mutableCopy];
            v70 = v46;
            [v50 intersectSet:v46];
            id v51 = [v36 mutableCopy];
            [v51 minusSet:v9];
            id v52 = [v41 mutableCopy];
            [v52 minusSet:v9];
            BOOL v53 = ![v49 count]
               && ![v50 count]
               && ![v51 count]
               && [v52 count] == 0;
            v75[0] = _NSConcreteStackBlock;
            v75[1] = 3221225472;
            v75[2] = sub_10000911C;
            v75[3] = &unk_100034CB8;
            id v54 = v49;
            uint64_t v55 = *(void *)(v68 + 32);
            id v67 = v54;
            id v76 = v54;
            uint64_t v77 = v55;
            id v56 = v50;
            id v78 = v56;
            id v64 = v51;
            id v79 = v64;
            id v57 = v52;
            id v80 = v57;
            v58 = objc_retainBlock(v75);
            if (v53)
            {
              v46 = v70;
              id v59 = obja;
            }
            else
            {
              v60 = [*(id *)(v68 + 32) store];
              id v74 = obja;
              [v60 performTransactionWithBlock:v58 error:&v74];
              v61 = v41;
              v62 = v9;
              id v63 = v74;

              id v59 = v63;
              int v9 = v62;
              v41 = v61;
              v46 = v70;
            }
            (*(void (**)(void))(*(void *)(v68 + 40) + 16))();
            [*(id *)(v68 + 32) setCachedCallDirectoryStoreExtensions:0];
          }
          else
          {
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
              sub_1000237C8();
            }

            id v59 = obja;
            (*(void (**)(void))(*(void *)(v68 + 40) + 16))();
          }

          id v42 = v59;
        }
        else
        {
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            sub_100023760();
          }

          (*(void (**)(void))(*(void *)(v68 + 40) + 16))();
        }

        id v37 = v42;
      }
      else
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_1000236F8();
        }

        (*(void (**)(void))(*(void *)(v68 + 40) + 16))();
      }

      id v32 = v37;
    }
    else
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100023690();
      }

      (*(void (**)(void))(*(void *)(v68 + 40) + 16))();
    }

    id v4 = v32;
    id v3 = v65;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100023628();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_10000911C(id *a1, void *a2, void *a3)
{
  id v59 = a2;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = a1[4];
  id v4 = [obj countByEnumeratingWithState:&v81 objects:v96 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v82;
    while (2)
    {
      id v8 = 0;
      int v9 = v6;
      do
      {
        if (*(void *)v82 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v81 + 1) + 8 * (void)v8);
        uint64_t v11 = sub_10000492C();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v88 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding extension with identifier %@", buf, 0xCu);
        }

        char v12 = [a1[5] store];
        id v80 = v9;
        id v13 = [v12 addExtensionWithIdentifier:v10 error:&v80];
        id v6 = v80;

        if (v13 == (id)-1)
        {
          uint64_t v14 = sub_10000492C();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v54 = [a1[5] store];
            *(_DWORD *)buf = 138412802;
            uint64_t v88 = v10;
            __int16 v89 = 2112;
            id v90 = v54;
            __int16 v91 = 2112;
            id v92 = v6;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error adding extension with identifier %@ into store %@: %@", buf, 0x20u);
          }
          unsigned int v15 = v59;
          if (a3) {
            *a3 = v6;
          }
          id v79 = 0;
          char v16 = (*((uint64_t (**)(id, id *))v59 + 2))(v59, &v79);
          id v17 = v79;
          if ((v16 & 1) == 0)
          {
            id v18 = sub_10000492C();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              sub_100023AE4();
            }
LABEL_72:
          }
          goto LABEL_73;
        }
        id v8 = (char *)v8 + 1;
        int v9 = v6;
      }
      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v81 objects:v96 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v6 = 0;
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = a1[6];
  id v19 = [obj countByEnumeratingWithState:&v75 objects:v95 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v76;
LABEL_22:
    id v22 = 0;
    id v23 = v6;
    while (1)
    {
      if (*(void *)v76 != v21) {
        objc_enumerationMutation(obj);
      }
      char v24 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v22);
      uint64_t v25 = sub_10000492C();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v88 = 4;
        __int16 v89 = 2112;
        id v90 = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Changing state to %ld for extension with identifier %@", buf, 0x16u);
      }

      v26 = [a1[5] store];
      id v74 = v23;
      unsigned __int8 v27 = [v26 setState:4 forExtensionWithIdentifier:v24 error:&v74];
      id v6 = v74;

      if ((v27 & 1) == 0) {
        break;
      }
      id v22 = (char *)v22 + 1;
      id v23 = v6;
      if (v20 == v22)
      {
        id v20 = [obj countByEnumeratingWithState:&v75 objects:v95 count:16];
        if (v20) {
          goto LABEL_22;
        }
        goto LABEL_30;
      }
    }
    v47 = sub_10000492C();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      uint64_t v55 = [a1[5] store];
      *(_DWORD *)buf = 134218754;
      uint64_t v88 = 4;
      __int16 v89 = 2112;
      id v90 = v24;
      __int16 v91 = 2112;
      id v92 = v55;
      __int16 v93 = 2112;
      id v94 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Error changing state to %ld for extension with identifier %@ from store %@: %@", buf, 0x2Au);
    }
    unsigned int v15 = v59;
    if (a3) {
      *a3 = v6;
    }
    id v73 = 0;
    char v48 = (*((uint64_t (**)(id, id *))v59 + 2))(v59, &v73);
    id v17 = v73;
    if ((v48 & 1) == 0)
    {
      id v18 = sub_10000492C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100023AE4();
      }
      goto LABEL_72;
    }
    goto LABEL_73;
  }
LABEL_30:

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = a1[7];
  id v28 = [obj countByEnumeratingWithState:&v69 objects:v86 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v70;
LABEL_32:
    v31 = 0;
    id v32 = v6;
    while (1)
    {
      if (*(void *)v70 != v30) {
        objc_enumerationMutation(obj);
      }
      v33 = *(void **)(*((void *)&v69 + 1) + 8 * (void)v31);
      v34 = sub_10000492C();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v88 = 5;
        __int16 v89 = 2112;
        id v90 = v33;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Changing state to %ld for extension with identifier %@", buf, 0x16u);
      }

      v35 = [a1[5] store];
      id v68 = v32;
      unsigned __int8 v36 = [v35 setState:5 forExtensionWithIdentifier:v33 error:&v68];
      id v6 = v68;

      if ((v36 & 1) == 0) {
        break;
      }
      v31 = (char *)v31 + 1;
      id v32 = v6;
      if (v29 == v31)
      {
        id v29 = [obj countByEnumeratingWithState:&v69 objects:v86 count:16];
        if (v29) {
          goto LABEL_32;
        }
        goto LABEL_40;
      }
    }
    id v49 = sub_10000492C();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      id v56 = [a1[5] store];
      *(_DWORD *)buf = 134218754;
      uint64_t v88 = 5;
      __int16 v89 = 2112;
      id v90 = v33;
      __int16 v91 = 2112;
      id v92 = v56;
      __int16 v93 = 2112;
      id v94 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Error changing state to %ld for extension with identifier %@ from store %@: %@", buf, 0x2Au);
    }
    unsigned int v15 = v59;
    if (a3) {
      *a3 = v6;
    }
    id v67 = 0;
    char v50 = (*((uint64_t (**)(id, id *))v59 + 2))(v59, &v67);
    id v17 = v67;
    if ((v50 & 1) == 0)
    {
      id v18 = sub_10000492C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100023AE4();
      }
      goto LABEL_72;
    }
    goto LABEL_73;
  }
LABEL_40:

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = a1[8];
  id v37 = [obj countByEnumeratingWithState:&v63 objects:v85 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v64;
LABEL_42:
    v40 = 0;
    v41 = v6;
    while (1)
    {
      if (*(void *)v64 != v39) {
        objc_enumerationMutation(obj);
      }
      uint64_t v42 = *(void *)(*((void *)&v63 + 1) + 8 * (void)v40);
      v43 = sub_10000492C();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v88 = v42;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Removing extension with identifier %@", buf, 0xCu);
      }

      v44 = [a1[5] store];
      id v62 = v41;
      unsigned __int8 v45 = [v44 removeExtensionWithIdentifier:v42 error:&v62];
      id v6 = v62;

      if ((v45 & 1) == 0) {
        break;
      }
      v40 = (char *)v40 + 1;
      v41 = v6;
      if (v38 == v40)
      {
        id v38 = [obj countByEnumeratingWithState:&v63 objects:v85 count:16];
        if (v38) {
          goto LABEL_42;
        }
        goto LABEL_50;
      }
    }
    id v51 = sub_10000492C();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      id v57 = [a1[5] store];
      *(_DWORD *)buf = 138412802;
      uint64_t v88 = v42;
      __int16 v89 = 2112;
      id v90 = v57;
      __int16 v91 = 2112;
      id v92 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Error removing extension with identifier %@ from store %@: %@", buf, 0x20u);
    }
    unsigned int v15 = v59;
    if (a3) {
      *a3 = v6;
    }
    id v61 = 0;
    char v52 = (*((uint64_t (**)(id, id *))v59 + 2))(v59, &v61);
    id v17 = v61;
    if ((v52 & 1) == 0)
    {
      id v18 = sub_10000492C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100023AE4();
      }
      goto LABEL_72;
    }
LABEL_73:

    uint64_t v46 = 0;
    goto LABEL_74;
  }
LABEL_50:

  id obj = [a1[5] identificationEntriesChangedNotifier];
  [obj postNotification];
  uint64_t v46 = 1;
  unsigned int v15 = v59;
LABEL_74:

  return v46;
}

BOOL sub_100009C88(id a1, CXCallDirectoryStoreExtension *a2)
{
  return 1;
}

BOOL sub_100009CA0(id a1, CXCallDirectoryStoreExtension *a2)
{
  return (char *)[(CXCallDirectoryStoreExtension *)a2 state] - 3 < (char *)2;
}

BOOL sub_100009CD8(id a1, CXCallDirectoryStoreExtension *a2)
{
  return (char *)[(CXCallDirectoryStoreExtension *)a2 state] - 1 < (char *)2;
}

BOOL sub_100009D10(id a1, CXCallDirectoryStoreExtension *a2)
{
  return [(CXCallDirectoryStoreExtension *)a2 state] == (id)5;
}

id sub_100009E30(CXCallDirectoryNSExtensionManager *self, SEL a2, id *a3)
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_100009FD8;
  id v22 = sub_100009FE8;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unsigned int v15 = sub_100009FD8;
  char v16 = sub_100009FE8;
  id v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009FF0;
  v8[3] = &unk_100034D80;
  uint64_t v10 = &v18;
  uint64_t v11 = &v12;
  id v5 = dispatch_semaphore_create(0);
  int v9 = v5;
  [(CXCallDirectoryNSExtensionManager *)self extensionsWithCompletionHandler:v8];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v13[5];
  }
  id v6 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

void sub_100009FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009FD8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009FE8(uint64_t a1)
{
}

void sub_100009FF0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_10000492C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100023B4C();
  }

  if (v5)
  {
    id v8 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v9 = v5;
  }
  else
  {
    id v8 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v9 = v6;
  }
  id v10 = v9;
  uint64_t v11 = *v8;
  *id v8 = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000A0A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000A0C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_10000A498(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 36) |= 1u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_50;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            uint64_t v14 = 0;
            goto LABEL_52;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_50:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v14 = 0;
        }
LABEL_52:
        *(void *)(a1 + 8) = v14;
        continue;
      case 2u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 36) |= 2u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_56:
        uint64_t v34 = 24;
        goto LABEL_61;
      case 3u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 36) |= 4u;
        while (2)
        {
          unint64_t v25 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v25 == -1 || v25 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
            v20 |= (unint64_t)(v26 & 0x7F) << v23;
            if (v26 < 0)
            {
              v23 += 7;
              BOOL v9 = v24++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_60;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_60:
        uint64_t v34 = 28;
LABEL_61:
        *(_DWORD *)(a1 + v34) = v20;
        continue;
      case 4u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v29 = 0;
        *(unsigned char *)(a1 + 36) |= 8u;
        break;
      case 5u:
        uint64_t v32 = PBReaderReadString();
        v33 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v32;

        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v30 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v30 == -1 || v30 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v31 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v30);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v30 + 1;
      v29 |= (unint64_t)(v31 & 0x7F) << v27;
      if ((v31 & 0x80) == 0) {
        goto LABEL_63;
      }
      v27 += 7;
      BOOL v9 = v28++ >= 9;
      if (v9)
      {
        uint64_t v29 = 0;
        goto LABEL_65;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_63:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v29 = 0;
    }
LABEL_65:
    *(unsigned char *)(a1 + 32) = v29 != 0;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000B168(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) store];
  id v3 = [*(id *)(a1 + 32) extensionIdentifier];
  id v6 = 0;
  char v4 = [v2 extensionWithIdentifier:v3 error:&v6];
  id v5 = v6;

  if (v4) {
    [v4 state];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000B580(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) store];
  char v4 = [*v2 extensionIdentifier];
  id v38 = 0;
  id v5 = [v3 extensionWithIdentifier:v4 error:&v38];
  id v6 = v38;

  if (v5)
  {
    switch((unint64_t)[v5 state])
    {
      case 1uLL:
        unsigned int v7 = [*v2 isEnabled];
        char v8 = sub_10000492C();
        BOOL v9 = v8;
        if (v7)
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v10 = [*v2 isEnabled];
            id v11 = [v5 state];
            *(_DWORD *)buf = 67109376;
            unsigned int v40 = v10;
            __int16 v41 = 2048;
            id v42 = v11;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requested to set extension enabled status to %d and current state of extension is %ld, so attempting to load extension data", buf, 0x12u);
          }

          id v12 = *v2;
          id v37 = v6;
          unsigned int v13 = [v12 _loadExtensionDataWithError:&v37];
          uint64_t v14 = v37;

          unint64_t v15 = sub_10000492C();
          id v6 = v15;
          if (v13)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Loaded extension data successfully", buf, 2u);
            }
          }
          else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            sub_100023C34((uint64_t)v14, v6);
          }
          goto LABEL_30;
        }
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        goto LABEL_27;
      case 2uLL:
        unsigned int v17 = [*v2 isEnabled];
        char v18 = sub_10000492C();
        BOOL v9 = v18;
        if (v17)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v19 = [*v2 isEnabled];
            id v20 = [v5 state];
            *(_DWORD *)buf = 67109632;
            unsigned int v40 = v19;
            __int16 v41 = 2048;
            id v42 = v20;
            __int16 v43 = 2048;
            uint64_t v44 = 4;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requested to set extension enabled status to %d and current state of extension is %ld, so updating state to %ld", buf, 0x1Cu);
          }

          unint64_t v21 = [*v2 store];
          unsigned __int8 v36 = v6;
          unsigned int v22 = objc_msgSend(v21, "setState:forExtensionWithID:error:", 4, objc_msgSend(v5, "primaryKey"), &v36);
          uint64_t v14 = v36;

          if (v22)
          {
            id v6 = [*v2 awdReporter];
            char v23 = [*v2 extensionIdentifier];
            unsigned int v24 = v6;
            uint64_t v25 = 1;
            goto LABEL_38;
          }
          id v6 = sub_10000492C();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            sub_100023D2C();
          }
          goto LABEL_30;
        }
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        goto LABEL_27;
      case 3uLL:
        char v26 = sub_10000492C();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_100023BB4();
        }

        uint64_t v16 = 7;
        break;
      case 4uLL:
        unsigned int v27 = [*v2 isEnabled];
        unsigned int v28 = sub_10000492C();
        BOOL v9 = v28;
        if (!v27)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v31 = [*v2 isEnabled];
            id v32 = [v5 state];
            *(_DWORD *)buf = 67109632;
            unsigned int v40 = v31;
            __int16 v41 = 2048;
            id v42 = v32;
            __int16 v43 = 2048;
            uint64_t v44 = 2;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requested to set extension enabled status to %d and current state of extension is %ld, so updating state to %ld", buf, 0x1Cu);
          }

          v33 = [*v2 store];
          v35 = v6;
          unsigned int v34 = objc_msgSend(v33, "setState:forExtensionWithID:error:", 2, objc_msgSend(v5, "primaryKey"), &v35);
          uint64_t v14 = v35;

          if (v34)
          {
            id v6 = [*v2 awdReporter];
            char v23 = [*v2 extensionIdentifier];
            unsigned int v24 = v6;
            uint64_t v25 = 0;
LABEL_38:
            [v24 reportSetEnabled:v25 forExtensionWithIdentifier:v23];
          }
          else
          {
            id v6 = sub_10000492C();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
              sub_100023DAC();
            }
          }
          goto LABEL_30;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
LABEL_27:
        }
          sub_100023CAC();
LABEL_28:

        uint64_t v16 = 0;
        break;
      case 5uLL:
        uint64_t v29 = sub_10000492C();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100023BB4();
        }

        uint64_t v16 = 102;
        break;
      default:
        goto LABEL_31;
    }
  }
  else
  {
    uint64_t v16 = 1;
  }
  uint64_t v14 = +[NSError cx_callDirectoryManagerErrorWithCode:v16];
LABEL_30:

  id v6 = v14;
LABEL_31:
  if (!v6)
  {
    unint64_t v30 = [*v2 identificationEntriesChangedNotifier];
    [v30 postNotification];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000BD4C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BD7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000BD8C(uint64_t a1)
{
}

void sub_10000BD94(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000BF18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id sub_10000BF64(void **a1)
{
  id v2 = *a1;
  return [v2 isEnabled];
}

id sub_10000BF7C()
{
  return [v0 state];
}

void sub_10000BF94(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_10000C1A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10000C1D0(uint64_t a1)
{
  id v2 = sub_10000492C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Device first unlock block invoked, attempting to prepare store...", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained host];
  [v4 prepareStoreIfNecessary];
}

void sub_10000C260(uint64_t a1)
{
  id v2 = sub_10000492C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained systemMonitor];
    v12[0] = 67109120;
    v12[1] = [v4 firstUnlocked];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "systemMonitor activated: firstUnlocked=%d", (uint8_t *)v12, 8u);
  }
  id v5 = (id *)(a1 + 32);
  id v6 = objc_loadWeakRetained(v5);
  unsigned int v7 = [v6 systemMonitor];
  unsigned int v8 = [v7 firstUnlocked];

  if (v8)
  {
    BOOL v9 = sub_10000492C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "calling prepare because we are unlocked", (uint8_t *)v12, 2u);
    }

    id v10 = objc_loadWeakRetained(v5);
    id v11 = [v10 host];
    [v11 prepareStoreIfNecessary];
  }
}

void sub_10000C5C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_10000492C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100023F40();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000C85C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10000492C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100024014();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000CB3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_10000492C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100024080(a1, (uint64_t)v3, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000CBB8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_10000492C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "live lookup entry %@", (uint8_t *)&v11, 0xCu);
  }

  if (!a3)
  {
    uint64_t v7 = [v5 localizedLabel];
    if (v7)
    {
      unsigned int v8 = (void *)v7;
      BOOL v9 = [v5 localizedLabel];
      id v10 = [v9 length];

      if (v10) {
        [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
      }
    }
  }
}

void sub_10000CEA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v8 = -v7;
  BOOL v9 = [*(id *)(a1 + 40) analyticsReporter];
  [v9 sendBlastDoorWithTimeInterval:*(void *)(a1 + 48) for:v8];

  if (v6)
  {
    id v10 = [*(id *)(a1 + 40) analyticsReporter];
    objc_msgSend(v10, "sendBlockingWithError:for:", objc_msgSend(v6, "code"), *(void *)(a1 + 48));

    int v11 = sub_10000492C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000241F0(a1, (uint64_t)v6, v11);
    }
    id v12 = 0;
  }
  else
  {
    id v13 = [objc_alloc((Class)NSURL) initFileURLWithPath:@"/var/mobile/Library/CallDirectory/images"];
    int v11 = [v13 URLByAppendingPathComponent:*(void *)(a1 + 48)];

    uint64_t v14 = +[NSFileManager defaultManager];
    [v14 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:0];

    unint64_t v15 = [v11 URLByAppendingPathComponent:*(void *)(a1 + 56)];
    id v12 = [v15 URLByAppendingPathExtension:@"heic"];

    [v5 writeToURL:v12 atomically:1];
    uint64_t v16 = sub_10000492C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100024188();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_10000D4A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v8 = -v7;
  BOOL v9 = [*(id *)(a1 + 40) analyticsReporter];
  [v9 sendBlockingWithTimeInterval:*(void *)(a1 + 48) for:v8];

  id v10 = sub_10000492C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(void **)(a1 + 56);
    int v21 = 138412290;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "received Data useCase: %@", (uint8_t *)&v21, 0xCu);
  }

  id v12 = sub_10000492C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "block data = %@", (uint8_t *)&v21, 0xCu);
  }

  id v13 = sub_10000492C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "error = %@", (uint8_t *)&v21, 0xCu);
  }

  if (v6)
  {
    uint64_t v14 = *(void *)(a1 + 80);
    if (v14) {
      (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v6);
    }
    unint64_t v15 = sub_10000492C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "block request returned error: %@", (uint8_t *)&v21, 0xCu);
    }

    uint64_t v16 = [*(id *)(a1 + 40) analyticsReporter];
    objc_msgSend(v16, "sendBlockingWithError:for:", objc_msgSend(v6, "code"), *(void *)(a1 + 48));
  }
  else
  {
    if ([v5 length] == (id)1)
    {
      BOOL v17 = *(unsigned char *)[v5 bytes] != 0;
    }
    else
    {
      char v18 = sub_10000492C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "data length != 1 ignoring", (uint8_t *)&v21, 2u);
      }

      BOOL v17 = 0;
    }
    uint64_t v19 = *(void *)(a1 + 80);
    if (v19) {
      (*(void (**)(uint64_t, BOOL, void))(v19 + 16))(v19, v17, 0);
    }
    uint64_t v16 = [*(id *)(a1 + 40) liveLookupStore];
    [v16 updateBlockingInfoFor:*(void *)(a1 + 64) with:*(void *)(a1 + 72) shouldBlock:v17];
  }

  id v20 = [*(id *)(a1 + 40) liveLookupGroup];
  dispatch_group_leave(v20);
}

void sub_10000D7B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v8 = -v7;
  BOOL v9 = [*(id *)(a1 + 40) analyticsReporter];
  [v9 sendIdentityWithTimeInterval:*(void *)(a1 + 48) for:v8];

  id v10 = sub_10000492C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(LiveLookupCallIdentity **)(a1 + 56);
    *(_DWORD *)buf = 138412290;
    unsigned int v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "received Data useCase: %@", buf, 0xCu);
  }

  id v12 = sub_10000492C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "identity data = %@", buf, 0xCu);
  }

  id v13 = sub_10000492C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "error = %@", buf, 0xCu);
  }

  if (v6)
  {
    uint64_t v14 = [*(id *)(a1 + 40) analyticsReporter];
    objc_msgSend(v14, "sendIdentityWithError:for:", -[LiveLookupCallIdentity code](v6, "code"), *(void *)(a1 + 48));

    unint64_t v15 = sub_10000492C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "identity request returned error: %@", buf, 0xCu);
    }

    uint64_t v16 = *(void *)(a1 + 80);
    if (v16) {
      (*(void (**)(uint64_t, void, void, void, LiveLookupCallIdentity *))(v16 + 16))(v16, 0, 0, 0, v6);
    }
  }
  else
  {
    BOOL v17 = [[LiveLookupCallIdentity alloc] initWithData:v5];
    char v18 = sub_10000492C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "identity = %@", buf, 0xCu);
    }

    uint64_t v19 = [(LiveLookupCallIdentity *)v17 name];
    uint64_t v20 = [(LiveLookupCallIdentity *)v17 identityType];
    int v21 = *(void **)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    char v23 = *(void **)(a1 + 64);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000DB6C;
    v26[3] = &unk_100034F10;
    v26[4] = v21;
    id v27 = v23;
    id v28 = *(id *)(a1 + 72);
    id v29 = v19;
    uint64_t v32 = v20;
    unint64_t v30 = v17;
    id v31 = *(id *)(a1 + 80);
    unsigned int v24 = v17;
    id v25 = v19;
    [v21 writeImageIfNecessary:v24 extensionIdentifier:v22 handle:v27 completionHandler:v26];
  }
}

void sub_10000DB6C(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) liveLookupStore];
  objc_msgSend(v3, "updateIdentityInfoFor:with:name:iconURL:type:ttlMinutes:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), v6, *(void *)(a1 + 80), objc_msgSend(*(id *)(a1 + 64), "cacheExpiryMinutes"));

  uint64_t v4 = *(void *)(a1 + 72);
  if (v4) {
    (*(void (**)(uint64_t, void, id, void, void))(v4 + 16))(v4, *(void *)(a1 + 56), v6, *(void *)(a1 + 80), 0);
  }
  id v5 = [*(id *)(a1 + 32) liveLookupGroup];
  dispatch_group_leave(v5);
}

void sub_10000DD74(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  int v11 = sub_10000492C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    int v15 = 138412290;
    uint64_t v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "got identity for %@", (uint8_t *)&v15, 0xCu);
  }

  if (!a5)
  {
    id v13 = [*(id *)(a1 + 40) identificationEntryFrom:*(void *)(a1 + 32) withName:v9 withIconURL:v10 withType:a4 fromCache:0];
    unsigned int v14 = *(unsigned __int16 *)(a1 + 80);
    if (!*(_WORD *)(a1 + 80))
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      unsigned int v14 = *(unsigned __int16 *)(a1 + 80);
    }
    [*(id *)(a1 + 48) setObject:v13 atIndexedSubscript:v14];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

void sub_10000E598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_10000E5D8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10000492C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "got blocking for %@ shouldBlock=%d", (uint8_t *)&v9, 0x12u);
  }

  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    double v8 = [*(id *)(a1 + 40) analyticsReporter];
    [v8 sendBlockingCacheHitFor:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10000EA7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_10000492C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000242D4();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EC7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_10000492C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002433C();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F050(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_10000492C();
  double v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Retrieved extensions %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100024418();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F3B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_10000492C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100024480();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000F984(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000FBC8(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_10000492C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [a1[4] identifier];
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "error disabling extension when resetting context %@", buf, 0xCu);
    }
    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    uint64_t v7 = [WeakRetained liveLookupStore];
    double v8 = [a1[4] identifier];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000FD6C;
    v9[3] = &unk_100035000;
    id v10 = a1[4];
    id v11 = a1[5];
    [v7 setEnabled:1 forExtensionWith:v8 completionHandler:v9];
  }
}

void sub_10000FD6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = sub_10000492C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) identifier];
      int v7 = 138412290;
      double v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "error enabling extension when resetting context %@", (uint8_t *)&v7, 0xCu);
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

void sub_100010218(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100010238(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_1000103EC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setExtensionIdentifier:v2];

  [*(id *)(a1 + 32) setExtensionID:-1];
  [*(id *)(a1 + 32) setUpdateDelegate:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setDataRequest:*(void *)(a1 + 56)];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 dataRequest];
  [v4 setDelegate:v3];

  [*(id *)(a1 + 32) setStore:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setMaximumAllowedEntries:*(void *)(a1 + 80)];
  [*(id *)(a1 + 32) setIdentificationEntriesChangedNotifier:*(void *)(a1 + 72)];
  id v5 = objc_alloc_init(CDXAWDReporter);
  [*(id *)(a1 + 32) setAwdReporter:v5];
}

void sub_1000108C4(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setBlockingEntriesAdded:0];
  [*v2 setIdentificationEntriesAdded:0];
  [*v2 setLastBlockingPhoneNumber:0];
  [*v2 setLastIdentificationPhoneNumber:0];
  id v3 = [*v2 store];
  uint64_t v4 = [*v2 extensionIdentifier];
  id v33 = 0;
  id v5 = [v3 extensionWithIdentifier:v4 error:&v33];
  id v6 = v33;

  if (v5)
  {
    objc_msgSend(*v2, "setExtensionID:", objc_msgSend(v5, "primaryKey"));
    switch((unint64_t)[v5 state])
    {
      case 1uLL:
        if ([*v2 allowLoadingDisabledExtensions]) {
          goto LABEL_4;
        }
        id v11 = sub_10000492C();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1000248EC(v2, v11);
        }
        goto LABEL_32;
      case 2uLL:
        id v11 = sub_10000492C();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1000249A4((uint64_t)v2);
        }
LABEL_32:

        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = 6;
        goto LABEL_33;
      case 3uLL:
        int v12 = sub_10000492C();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100024A28((uint64_t)v2);
        }

        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = 7;
        goto LABEL_33;
      case 4uLL:
        [*v2 setIncrementalLoadingState:1];
        char v7 = 0;
        goto LABEL_19;
      case 5uLL:
        id v27 = sub_10000492C();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_100024AAC((uint64_t)v2);
        }

        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = 102;
LABEL_33:
        id v28 = +[NSError cx_callDirectoryManagerErrorWithCode:v14];
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v28);

        break;
      default:
LABEL_4:
        char v7 = 1;
LABEL_19:
        int v15 = sub_10000492C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [*v2 incrementalLoadingState];
          BOOL v17 = [*v2 extensionIdentifier];
          *(_DWORD *)buf = 134218242;
          id v35 = v16;
          __int16 v36 = 2112;
          id v37 = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "incrementalLoadingState: %ld for extension with identifier %@", buf, 0x16u);
        }
        char v18 = [*v2 store];
        uint64_t v19 = [*v2 extensionIdentifier];
        id v32 = v6;
        unsigned __int8 v20 = [v18 setState:3 forExtensionWithIdentifier:v19 error:&v32];
        id v21 = v32;

        if (v20)
        {
          uint64_t v22 = [*(id *)(a1 + 32) dataRequest];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_100010DB4;
          v29[3] = &unk_1000350A0;
          char v23 = *(void **)(a1 + 40);
          v29[4] = *(void *)(a1 + 32);
          char v31 = v7;
          id v30 = v23;
          [v22 beginWithCompletion:v29];
        }
        else
        {
          unsigned int v24 = sub_10000492C();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_100024840();
          }

          uint64_t v25 = *(void *)(a1 + 40);
          char v26 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
          (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
        }
        id v6 = v21;
        break;
    }
  }
  else
  {
    double v8 = sub_10000492C();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9) {
        sub_1000247B4();
      }

      uint64_t v10 = +[NSError cx_callDirectoryManagerErrorWithCode:0];
    }
    else
    {
      if (v9) {
        sub_100024720((uint64_t)v2);
      }

      uint64_t v10 = +[NSError cx_callDirectoryManagerErrorWithCode:1];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = (id)v10;
  }
}

void sub_100010DB4(uint64_t a1, void *a2)
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_100010EE8;
  v11[4] = sub_100010EF8;
  id v3 = a2;
  id v12 = v3;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010F00;
  v7[3] = &unk_100035078;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  BOOL v9 = v11;
  void v7[4] = v5;
  char v10 = *(unsigned char *)(a1 + 48);
  id v8 = v6;
  dispatch_async(v4, v7);

  _Block_object_dispose(v11, 8);
}

void sub_100010ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010EE8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010EF8(uint64_t a1)
{
}

void sub_100010F00(uint64_t a1)
{
  uint64_t v2 = a1 + 48;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v4 = sub_10000492C();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100024C60();
    }

    id v6 = [*(id *)(a1 + 32) store];
    id v7 = [*(id *)(a1 + 32) extensionID];
    id v43 = 0;
    unsigned __int8 v8 = [v6 removeBlockingEntriesForExtensionWithID:v7 error:&v43];
    id v9 = v43;
    if (v8)
    {
      char v10 = [*(id *)(a1 + 32) store];
      id v11 = [*(id *)(a1 + 32) extensionID];
      id v42 = v9;
      unsigned __int8 v12 = [v10 removeIdentificationEntriesForExtensionWithID:v11 error:&v42];
      id v13 = v42;

      id v9 = v13;
      if (v12)
      {
LABEL_22:
        if (*(unsigned char *)(a1 + 56)) {
          uint64_t v27 = 1;
        }
        else {
          uint64_t v27 = 4;
        }
        id v28 = [*(id *)(a1 + 32) store];
        id v29 = [*(id *)(a1 + 32) extensionIdentifier];
        id v41 = 0;
        unsigned __int8 v30 = [v28 setState:v27 forExtensionWithIdentifier:v29 error:&v41];
        id v25 = v41;

        if ((v30 & 1) == 0)
        {
          char v31 = sub_10000492C();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            id v37 = [*(id *)(a1 + 32) extensionIdentifier];
            id v38 = [*(id *)(a1 + 32) store];
            *(_DWORD *)buf = 134218754;
            uint64_t v45 = v27;
            __int16 v46 = 2112;
            v47 = v37;
            __int16 v48 = 2112;
            id v49 = v38;
            __int16 v50 = 2112;
            id v51 = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Error setting state to %ld for extension with identifier %@ into store %@: %@", buf, 0x2Au);
          }
        }
        goto LABEL_29;
      }
    }
    else
    {
    }
    char v26 = sub_10000492C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v34 = [*(id *)(a1 + 32) extensionID];
      id v35 = [*(id *)(a1 + 32) extensionIdentifier];
      __int16 v36 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 134218754;
      uint64_t v45 = (uint64_t)v34;
      __int16 v46 = 2112;
      v47 = v35;
      __int16 v48 = 2112;
      id v49 = v36;
      __int16 v50 = 2112;
      id v51 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error removing entries for extensionID %lld (identifier %@) from store (attempting to recover from data request error %@): %@", buf, 0x2Au);
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [*(id *)(a1 + 32) extensionIdentifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v45 = (uint64_t)v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Data request completed successfully for extension with identifier %@", buf, 0xCu);
  }
  id v16 = (id *)(a1 + 32);
  int v15 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v17 + 40);
  unsigned __int8 v18 = [v15 performInitialDeletionIfNecessaryWithError:&obj];
  objc_storeStrong((id *)(v17 + 40), obj);
  if ((v18 & 1) == 0)
  {
    uint64_t v19 = sub_10000492C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100024BDC(v2, v19);
    }
  }
  unsigned __int8 v20 = [*v16 store];
  id v21 = [*v16 extensionIdentifier];
  id v39 = 0;
  unsigned __int8 v22 = [v20 setState:4 forExtensionWithIdentifier:v21 error:&v39];
  id v9 = v39;

  if ((v22 & 1) == 0)
  {
    char v23 = sub_10000492C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100024B30();
    }
  }
  unsigned int v24 = [*v16 updateDelegate];
  objc_msgSend(v24, "callDirectoryLastInformationUpdatedForPhoneNumber:", objc_msgSend(*v16, "lastIdentificationPhoneNumber"));

  id v25 = [*v16 identificationEntriesChangedNotifier];
  [v25 postNotification];
LABEL_29:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v32 = [*(id *)(a1 + 32) awdReporter];
    id v33 = [*(id *)(a1 + 32) extensionIdentifier];
    objc_msgSend(v32, "reportLoadedDataForExtensionWithIdentifier:blockingEntries:identificationEntries:", v33, objc_msgSend(*(id *)(a1 + 32), "blockingEntriesAdded"), objc_msgSend(*(id *)(a1 + 32), "identificationEntriesAdded"));
  }
}

void sub_1000124E8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100012520(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10001257C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_100012598(uint64_t a1)
{
  return *(void *)a1;
}

void sub_1000125B4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_100012790(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [*(id *)(a1 + 32) store];
  id v86 = 0;
  uint64_t v3 = [v2 prioritizedExtensionsWithError:&v86];
  id v4 = v86;

  if (!v3)
  {
    id v59 = sub_10000492C();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_100025264((uint64_t)v4, v59, v66, v67, v68, v69, v70, v71);
    }
    goto LABEL_48;
  }
  id v5 = v4;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v72 = v3;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v82 objects:v97 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v83;
    uint64_t v75 = *(void *)v83;
    id v73 = v6;
    do
    {
      uint64_t v10 = 0;
      id v74 = v8;
      do
      {
        if (*(void *)v83 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v10);
        id v12 = [v11 state];
        if (v12 != (id)5)
        {
          if (v12 != (id)2) {
            goto LABEL_35;
          }
          id v13 = v6;
          uint64_t v14 = sub_10000492C();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = [v11 identifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v88 = (uint64_t)v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing entries for extension with identifier %@", buf, 0xCu);
          }
          id v16 = [*(id *)(v1 + 32) store];
          id v17 = [v11 primaryKey];
          id v81 = v5;
          unsigned __int8 v18 = [v16 removeBlockingEntriesForExtensionWithID:v17 error:&v81];
          id v19 = v81;

          if (v18)
          {
            unsigned __int8 v20 = [*(id *)(v1 + 32) store];
            id v21 = [v11 primaryKey];
            id v80 = v19;
            unsigned __int8 v22 = [v20 removeIdentificationEntriesForExtensionWithID:v21 error:&v80];
            id v23 = v80;

            id v8 = v74;
            id v19 = v23;
            if (v22)
            {
LABEL_22:
              id v32 = sub_10000492C();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                id v33 = [v11 identifier];
                *(_DWORD *)buf = 134218242;
                uint64_t v88 = 1;
                __int16 v89 = 2112;
                id v90 = v33;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Changing state to %ld for extension with identifier %@", buf, 0x16u);
              }
              id v34 = [*(id *)(v1 + 32) store];
              id v35 = [v11 primaryKey];
              id v79 = v19;
              unsigned __int8 v36 = [v34 setState:1 forExtensionWithID:v35 error:&v79];
              id v5 = v79;

              uint64_t v9 = v75;
              if (v36)
              {
                id v6 = v13;
                goto LABEL_35;
              }
              char v26 = sub_10000492C();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                id v44 = [v11 primaryKey];
                id v45 = [v11 state];
                __int16 v46 = [*(id *)(v1 + 32) store];
                *(_DWORD *)buf = 134219010;
                uint64_t v88 = (uint64_t)v44;
                __int16 v89 = 2048;
                id v90 = v45;
                __int16 v91 = 2048;
                uint64_t v92 = 1;
                __int16 v93 = 2112;
                id v94 = v46;
                __int16 v95 = 2112;
                id v96 = v5;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error updating state for extensionID %lld from %ld to %ld in store %@: %@", buf, 0x34u);
              }
              id v6 = v13;
              goto LABEL_34;
            }
          }
          else
          {
          }
          char v31 = sub_10000492C();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            id v42 = [v11 primaryKey];
            id v43 = [*(id *)(v1 + 32) store];
            *(_DWORD *)buf = 134218498;
            uint64_t v88 = (uint64_t)v42;
            __int16 v89 = 2112;
            id v90 = v43;
            __int16 v91 = 2112;
            uint64_t v92 = (uint64_t)v19;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Error removing entries for extensionID %lld from store %@: %@", buf, 0x20u);

            id v8 = v74;
          }

          goto LABEL_22;
        }
        unsigned int v24 = sub_10000492C();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = [v11 identifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v88 = (uint64_t)v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Removing extension with identifier %@", buf, 0xCu);
        }
        char v26 = +[NSDate date];
        uint64_t v27 = [v11 stateLastModified];
        [v26 timeIntervalSinceDate:v27];
        double v29 = v28;
        [(id)objc_opt_class() unavailableExtensionPurgeTimeout];
        if (v29 >= v30)
        {
          uint64_t v37 = v1;
          id v38 = [*(id *)(v1 + 32) store];
          id v39 = [v11 identifier];
          id v78 = v5;
          unsigned __int8 v40 = [v38 removeExtensionWithIdentifier:v39 error:&v78];
          id v41 = v78;

          if (v40)
          {
            id v5 = v41;
            uint64_t v1 = v37;
            id v6 = v73;
            id v8 = v74;
            uint64_t v9 = v75;
            goto LABEL_35;
          }
          char v26 = sub_10000492C();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v47 = [v11 identifier];
            *(_DWORD *)buf = 138412546;
            uint64_t v88 = (uint64_t)v47;
            __int16 v89 = 2112;
            id v90 = v41;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Error removing extension with identifier %@: %@", buf, 0x16u);
          }
          id v5 = v41;
          uint64_t v1 = v37;
          id v6 = v73;
          id v8 = v74;
          uint64_t v9 = v75;
        }
        else
        {
        }
LABEL_34:

LABEL_35:
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v82 objects:v97 count:16];
    }
    while (v8);
  }

  uint64_t v3 = v72;
  id v4 = v5;
  if (!v5)
  {
    __int16 v48 = [*(id *)(v1 + 32) store];
    id v77 = 0;
    uint64_t v49 = [v48 removeUnreferencedRecordsWithError:&v77];
    id v4 = v77;

    if ((v49 & 1) == 0)
    {
      __int16 v50 = sub_10000492C();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        sub_10002533C((uint64_t)v4, v50, v51, v52, v53, v54, v55, v56);
      }
    }
    if (!v4)
    {
      id v57 = [*(id *)(v1 + 32) store];
      id v76 = 0;
      unsigned __int8 v58 = [v57 vacuumWithError:&v76];
      id v4 = v76;

      if ((v58 & 1) == 0)
      {
        id v59 = sub_10000492C();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          sub_1000252D0((uint64_t)v4, v59, v60, v61, v62, v63, v64, v65);
        }
LABEL_48:
      }
    }
  }
  (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
}

void sub_1000131A8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) store];
  id v26 = 0;
  uint64_t v3 = [v2 prioritizedExtensionsWithError:&v26];
  id v4 = v26;

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) prioritizedExtensionIdentifiers];
    id v6 = [v5 mutableCopy];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    unsigned __int8 v20 = v3;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "identifier", v20);
          unsigned __int8 v14 = [v6 containsObject:v13];

          if ((v14 & 1) == 0)
          {
            int v15 = [v12 identifier];
            [v6 addObject:v15];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }

    id v16 = [*(id *)(a1 + 32) store];
    id v17 = [v6 copy];
    id v21 = v4;
    [v16 setPrioritizedExtensionIdentifiers:v17 error:&v21];
    id v18 = v21;

    id v19 = [*(id *)(a1 + 32) identificationEntriesChangedNotifier];
    [v19 postNotification];

    id v4 = v18;
    uint64_t v3 = v20;
  }
  else
  {
    id v6 = sub_10000492C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000253A8((uint64_t)v4, v6);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100013688(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) store];
  id v11 = 0;
  uint64_t v3 = [v2 prioritizedExtensionsWithError:&v11];
  id v4 = v11;

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) extensionsDataSource];
    id v10 = v4;
    id v6 = [v5 installedExtensionsWithError:&v10];
    id v7 = v10;

    if (v6)
    {
      id v8 = [*(id *)(a1 + 32) _extensionsFromNSExtensions:v6 usingProritizedStoreExtensions:v3];
    }
    else
    {
      id v9 = sub_10000492C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100025420((uint64_t)v7, v9);
      }

      id v8 = 0;
    }
  }
  else
  {
    id v6 = sub_10000492C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000253A8((uint64_t)v4, v6);
    }
    id v8 = 0;
    id v7 = v4;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100013F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013FAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013FBC(uint64_t a1)
{
}

void sub_100013FC4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = v10;
  }
  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v7 = v5;
  }
  id v8 = v7;
  uint64_t v9 = *v6;
  *id v6 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001486C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100014890(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000148A0(uint64_t a1)
{
}

void sub_1000148A8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100014C44()
{
  uint64_t v0 = sub_100025AE0();
  sub_100014F40(v0, qword_10003D190);
  sub_100014FA4(v0, (uint64_t)qword_10003D190);
  return sub_100025AD0();
}

unint64_t variable initialization expression of CoreAnalyticsReporter.analyticsEventPrefix()
{
  return 0xD000000000000023;
}

uint64_t variable initialization expression of CoreAnalyticsReporter.fetchKey()
{
  return 0x6863746566;
}

uint64_t variable initialization expression of CoreAnalyticsReporter.registrationKey()
{
  return 0x6172747369676572;
}

uint64_t variable initialization expression of CoreAnalyticsReporter.blastDoorErrorKey()
{
  return 0x6F6F647473616C62;
}

uint64_t variable initialization expression of CoreAnalyticsReporter.blastDoorTimeKey()
{
  return 0x6F6F647473616C62;
}

unint64_t variable initialization expression of CoreAnalyticsReporter.blockingCacheHitKey()
{
  return 0xD000000000000012;
}

unint64_t variable initialization expression of CoreAnalyticsReporter.blockingFetchErrorKey()
{
  return 0xD000000000000014;
}

unint64_t variable initialization expression of CoreAnalyticsReporter.blockingFetchTimeKey()
{
  return 0xD000000000000013;
}

unint64_t variable initialization expression of CoreAnalyticsReporter.extensionIdentifierKey()
{
  return 0xD000000000000013;
}

unint64_t variable initialization expression of CoreAnalyticsReporter.identityCacheHitKey()
{
  return 0xD000000000000012;
}

unint64_t variable initialization expression of CoreAnalyticsReporter.identifyFetchErrorKey()
{
  return 0xD000000000000014;
}

unint64_t variable initialization expression of CoreAnalyticsReporter.identifyFetchTimeKey()
{
  return 0xD000000000000013;
}

uint64_t variable initialization expression of CoreAnalyticsReporter.disableErrorKey()
{
  return 0x5F656C6261736964;
}

uint64_t variable initialization expression of CoreAnalyticsReporter.disableTimeKey()
{
  return 0x5F656C6261736964;
}

uint64_t variable initialization expression of CoreAnalyticsReporter.enableErrorKey()
{
  return 0x655F656C62616E65;
}

uint64_t variable initialization expression of CoreAnalyticsReporter.enableTimeKey()
{
  return 0x745F656C62616E65;
}

uint64_t variable initialization expression of CoreAnalyticsReporter.installKey()
{
  return 0x616C6C6174736E69;
}

uint64_t variable initialization expression of CoreAnalyticsReporter.uninstallKey()
{
  return 0x6C6174736E696E75;
}

_UNKNOWN **variable initialization expression of SecureImageTranscoder.warmUpGIFBytes()
{
  return &off_1000351D8;
}

uint64_t variable initialization expression of LiveLookupStoreProxy.maxShards()
{
  return 10000000;
}

uint64_t variable initialization expression of LiveLookupStoreProxy.keyExpirationMinutes()
{
  return 10080;
}

uint64_t variable initialization expression of LiveLookupStoreProxy.keyRotationBeforeExpirationMinutes()
{
  return 1440;
}

uint64_t variable initialization expression of LiveLookupStoreProxy.imagePath()
{
  return sub_1000259D0();
}

uint64_t *sub_100014F40(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100014FA4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for CGImage()
{
  if (!qword_10003CDF8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10003CDF8);
    }
  }
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendBlastDoor(timeInterval:for:)(Swift::Double timeInterval, Swift::String a2)
{
}

uint64_t sub_100015048(uint64_t a1, void *a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_100004B80(&qword_10003CEB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002A120;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x800000010002A8F0;
  id v13 = objc_allocWithZone((Class)NSString);
  swift_bridgeObjectRetain();
  NSString v14 = sub_100025B90();
  swift_bridgeObjectRelease();
  id v15 = [v13 initWithString:v14];

  *(void *)(inited + 48) = v15;
  unint64_t v16 = sub_10001AB00(inited);
  id v17 = objc_allocWithZone((Class)NSNumber);
  swift_bridgeObjectRetain();
  id v18 = [v17 initWithDouble:a3];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_10001661C((uint64_t)v18, a6, a7, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100015950(a1, a2, v16);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendBlocking(timeInterval:for:)(Swift::Double timeInterval, Swift::String a2)
{
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendIdentity(timeInterval:for:)(Swift::Double timeInterval, Swift::String a2)
{
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendBlockingCacheHit(for:)(Swift::String a1)
{
}

uint64_t sub_10001524C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  sub_100004B80(&qword_10003CEB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002A120;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x800000010002A8F0;
  id v11 = objc_allocWithZone((Class)NSString);
  swift_bridgeObjectRetain();
  NSString v12 = sub_100025B90();
  swift_bridgeObjectRelease();
  id v13 = [v11 initWithString:v12];

  *(void *)(inited + 48) = v13;
  unint64_t v14 = sub_10001AB00(inited);
  id v15 = objc_allocWithZone((Class)NSNumber);
  swift_bridgeObjectRetain();
  id v16 = [v15 initWithBool:1];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_10001661C((uint64_t)v16, a3, a4, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100015950(a5, a6, v14);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendIdentityCacheHit(for:)(Swift::String a1)
{
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendBlocking(error:for:)(Swift::UInt error, Swift::String a2)
{
}

uint64_t sub_10001541C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100004B80(&qword_10003CEB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002A120;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x800000010002A8F0;
  id v11 = objc_allocWithZone((Class)NSString);
  swift_bridgeObjectRetain();
  NSString v12 = sub_100025B90();
  swift_bridgeObjectRelease();
  id v13 = [v11 initWithString:v12];

  *(void *)(inited + 48) = v13;
  unint64_t v14 = sub_10001AB00(inited);
  id v15 = objc_allocWithZone((Class)NSNumber);
  swift_bridgeObjectRetain();
  id v16 = [v15 initWithUnsignedInteger:a3];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_10001661C((uint64_t)v16, a4, a5, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100015950(a1, a2, v14);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendIdentity(error:for:)(Swift::UInt error, Swift::String a2)
{
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendBlastDoor(error:for:)(Swift::UInt error, Swift::String a2)
{
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendEnable(timeInterval:for:)(Swift::Double timeInterval, Swift::String a2)
{
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendDisable(timeInterval:for:)(Swift::Double timeInterval, Swift::String a2)
{
}

uint64_t sub_100015640(uint64_t a1, uint64_t a2, void *a3, void *a4, double a5)
{
  return sub_100015048(*(void *)(v5 + *a3), *(void **)(v5 + *a3 + 8), a5, a1, a2, *(void *)(v5 + *a4), *(void *)(v5 + *a4 + 8));
}

uint64_t sub_100015680(char *a1, double a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v10 = sub_100025BA0();
  uint64_t v12 = v11;
  id v13 = (uint64_t *)&a1[*a5];
  uint64_t v14 = *v13;
  id v15 = (void *)v13[1];
  id v16 = (uint64_t *)&a1[*a6];
  uint64_t v17 = *v16;
  uint64_t v18 = v16[1];
  id v19 = a1;
  sub_100015048(v14, v15, a2, v10, v12, v17, v18);

  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendEnable(error:for:)(Swift::UInt error, Swift::String a2)
{
}

uint64_t sub_10001574C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  return sub_10001541C(*(void *)(v5 + *a4), *(void **)(v5 + *a4 + 8), a1, *(void *)(v5 + *a5), *(void *)(v5 + *a5 + 8));
}

uint64_t sub_100015788(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  sub_100025BA0();
  uint64_t v10 = (uint64_t *)&a1[*a5];
  uint64_t v11 = *v10;
  uint64_t v12 = (void *)v10[1];
  id v13 = (uint64_t *)&a1[*a6];
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  id v16 = a1;
  sub_10001541C(v11, v12, a3, v14, v15);

  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendInstallation(for:)(Swift::String a1)
{
}

Swift::Void __swiftcall CoreAnalyticsReporter.sendUninstallation(for:)(Swift::String a1)
{
}

uint64_t sub_100015874(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return sub_10001524C(a1, a2, *(void *)(v4 + *a3), *(void *)(v4 + *a3 + 8), *(void *)(v4 + *a4), *(void **)(v4 + *a4 + 8));
}

uint64_t sub_1000158A8(char *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v8 = sub_100025BA0();
  uint64_t v10 = v9;
  uint64_t v11 = (uint64_t *)&a1[*a4];
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v14 = (uint64_t *)&a1[*a5];
  uint64_t v15 = *v14;
  id v16 = (void *)v14[1];
  uint64_t v17 = a1;
  sub_10001524C(v8, v10, v12, v13, v15, v16);

  return swift_bridgeObjectRelease();
}

void sub_100015950(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100025AE0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003CDF0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100014FA4(v8, (uint64_t)qword_10003D190);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_100025AC0();
  os_log_type_t v14 = sub_100025CC0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v25 = v4;
    uint64_t v15 = swift_slowAlloc();
    long long v24 = (void **)swift_slowAlloc();
    aBlock = v24;
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v26 = a1;
    uint64_t v28 = sub_100019710(a1, (unint64_t)a2, (uint64_t *)&aBlock);
    sub_100025CF0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v27 = a2;
    if (a3)
    {
      uint64_t v28 = a3;
      swift_bridgeObjectRetain();
      sub_100004B80(&qword_10003CEC0);
      uint64_t v16 = sub_100025BB0();
      unint64_t v18 = v17;
    }
    else
    {
      unint64_t v18 = 0xE300000000000000;
      uint64_t v16 = 7104878;
    }
    uint64_t v28 = sub_100019710(v16, v18, (uint64_t *)&aBlock);
    sub_100025CF0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "sending action: %s payload: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    a1 = v26;
    a2 = v27;
    uint64_t v4 = v25;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  uint64_t v19 = *(void *)(v4
                  + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_analyticsEventPrefix
                  + 8);
  aBlock = *(void ***)(v4 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_analyticsEventPrefix);
  uint64_t v30 = v19;
  swift_bridgeObjectRetain();
  v35._countAndFlagsBits = a1;
  v35._object = a2;
  sub_100025BE0(v35);
  NSString v20 = sub_100025B90();
  swift_bridgeObjectRelease();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a3;
  id v33 = sub_1000167C4;
  uint64_t v34 = v21;
  aBlock = _NSConcreteStackBlock;
  uint64_t v30 = 1107296256;
  char v31 = sub_100015D5C;
  id v32 = &unk_1000352C0;
  long long v22 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v22);
}

Class sub_100015D5C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_1000167E4();
    v4.super.isa = sub_100025B70().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

id SecureImageTranscoder.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id CoreAnalyticsReporter.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_analyticsEventPrefix];
  *(void *)uint64_t v2 = 0xD000000000000023;
  *((void *)v2 + 1) = 0x800000010002A860;
  uint64_t v3 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_fetchKey];
  *(void *)uint64_t v3 = 0x6863746566;
  *((void *)v3 + 1) = 0xE500000000000000;
  NSDictionary v4 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_registrationKey];
  strcpy(&v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_registrationKey], "registration");
  v4[13] = 0;
  *((_WORD *)v4 + 7) = -5120;
  uint64_t v5 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_blastDoorErrorKey];
  *(void *)uint64_t v5 = 0x6F6F647473616C62;
  *((void *)v5 + 1) = 0xEF726F7272655F72;
  id v6 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_blastDoorTimeKey];
  strcpy(&v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_blastDoorTimeKey], "blastdoor_time");
  v6[15] = -18;
  id v7 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_blockingCacheHitKey];
  *(void *)id v7 = 0xD000000000000012;
  *((void *)v7 + 1) = 0x800000010002A890;
  uint64_t v8 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_blockingFetchErrorKey];
  *(void *)uint64_t v8 = 0xD000000000000014;
  *((void *)v8 + 1) = 0x800000010002A8B0;
  uint64_t v9 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_blockingFetchTimeKey];
  *(void *)uint64_t v9 = 0xD000000000000013;
  *((void *)v9 + 1) = 0x800000010002A8D0;
  uint64_t v10 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_extensionIdentifierKey];
  *(void *)uint64_t v10 = 0xD000000000000013;
  *((void *)v10 + 1) = 0x800000010002A8F0;
  uint64_t v11 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_identityCacheHitKey];
  *(void *)uint64_t v11 = 0xD000000000000012;
  *((void *)v11 + 1) = 0x800000010002A910;
  uint64_t v12 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_identifyFetchErrorKey];
  *(void *)uint64_t v12 = 0xD000000000000014;
  *((void *)v12 + 1) = 0x800000010002A930;
  uint64_t v13 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_identifyFetchTimeKey];
  *(void *)uint64_t v13 = 0xD000000000000013;
  *((void *)v13 + 1) = 0x800000010002A950;
  os_log_type_t v14 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_disableErrorKey];
  strcpy(&v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_disableErrorKey], "disable_error");
  *((_WORD *)v14 + 7) = -4864;
  uint64_t v15 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_disableTimeKey];
  strcpy(&v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_disableTimeKey], "disable_time");
  v15[13] = 0;
  *((_WORD *)v15 + 7) = -5120;
  uint64_t v16 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_enableErrorKey];
  strcpy(&v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_enableErrorKey], "enable_error");
  v16[13] = 0;
  *((_WORD *)v16 + 7) = -5120;
  unint64_t v17 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_enableTimeKey];
  *(void *)unint64_t v17 = 0x745F656C62616E65;
  *((void *)v17 + 1) = 0xEB00000000656D69;
  unint64_t v18 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_installKey];
  strcpy(&v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_installKey], "installation");
  v18[13] = 0;
  *((_WORD *)v18 + 7) = -5120;
  uint64_t v19 = &v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_uninstallKey];
  strcpy(&v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21CoreAnalyticsReporter_uninstallKey], "uninstallation");
  v19[15] = -18;
  v21.receiver = v0;
  v21.super_class = ObjectType;
  return objc_msgSendSuper2(&v21, "init");
}

id SecureImageTranscoder.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CoreAnalyticsReporter()
{
  return self;
}

uint64_t sub_10001630C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004B80(&qword_10003CED0);
  char v38 = a2;
  uint64_t v6 = sub_100025D90();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  Swift::String v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    long long v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    double v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    id v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_100025E40();
    sub_100025BD0();
    uint64_t result = sub_100025E50();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  long long v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *long long v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_10001661C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100022350(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100016824();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_10001630C(v15, a4 & 1);
  unint64_t v20 = sub_100022350(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_100025DF0();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  long long v22 = (uint64_t *)(v18[6] + 16 * v12);
  *long long v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

uint64_t sub_10001678C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000167C4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000167CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000167DC()
{
  return swift_release();
}

unint64_t sub_1000167E4()
{
  unint64_t result = qword_10003CEC8;
  if (!qword_10003CEC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003CEC8);
  }
  return result;
}

id sub_100016824()
{
  id v1 = v0;
  sub_100004B80(&qword_10003CED0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100025D80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *id v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id SecureImageTranscoder.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21SecureImageTranscoder_warmUpGIFBytes] = &off_100035220;
  uint64_t v2 = (void *)BlastDoorInstanceTypeKnownSender;
  uint64_t v3 = (objc_class *)sub_100025AB0();
  objc_allocWithZone(v3);
  uint64_t v4 = v0;
  id v5 = v2;
  uint64_t v6 = sub_100025AA0();
  unint64_t v7 = (uint64_t *)&v4[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21SecureImageTranscoder_blastDoor];
  v7[3] = (uint64_t)v3;
  void v7[4] = (uint64_t)&off_1000352E8;
  uint64_t *v7 = v6;

  v10.receiver = v4;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, "init");
  sub_100016AB8();

  return v8;
}

uint64_t sub_100016AB8()
{
  id v1 = v0;
  sub_100004B80(&qword_10003CF28);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003CDF0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100025AE0();
  sub_100014FA4(v4, (uint64_t)qword_10003D190);
  id v5 = sub_100025AC0();
  os_log_type_t v6 = sub_100025CC0();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Warming up BlastDoor interface", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = sub_10001A550((unsigned char *)(*(void *)&v1[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21SecureImageTranscoder_warmUpGIFBytes]+ 32), *(void *)(*(void *)&v1[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21SecureImageTranscoder_warmUpGIFBytes]+ 16));
  uint64_t v10 = v9;
  uint64_t v11 = sub_100025CA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v3, 1, 1, v11);
  unint64_t v12 = (void *)swift_allocObject();
  _DWORD v12[2] = 0;
  v12[3] = 0;
  v12[4] = v1;
  v12[5] = v8;
  v12[6] = v10;
  int64_t v13 = v1;
  sub_100018118((uint64_t)v3, (uint64_t)&unk_10003CF90, (uint64_t)v12);
  return swift_release();
}

uint64_t SecureImageTranscoder.generatePreviewImage(from:)(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  sub_100004B80(&qword_10003CEF0);
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  uint64_t v4 = sub_100025AE0();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  uint64_t v5 = sub_1000258F0();
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  uint64_t v6 = sub_100025850();
  v3[14] = v6;
  v3[15] = *(void *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  return _swift_task_switch(sub_100016E9C, 0, 0);
}

uint64_t sub_100016E9C()
{
  uint64_t v49 = v0;
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  uint64_t v5 = v0[12];
  uint64_t v4 = v0[13];
  uint64_t v6 = v0[11];
  sub_100019120();
  sub_1000258E0();
  sub_1000258D0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_100025820();
  swift_bridgeObjectRelease();
  unint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[20] = v7;
  v0[21] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v1, v2);
  if (qword_10003CDF0 != -1) {
    swift_once();
  }
  uint64_t v8 = v0[19];
  uint64_t v9 = v0[17];
  uint64_t v10 = v0[14];
  uint64_t v11 = v0[15];
  uint64_t v13 = v0[9];
  uint64_t v12 = v0[10];
  uint64_t v14 = v0[8];
  uint64_t v15 = sub_100014FA4(v14, (uint64_t)qword_10003D190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v15, v14);
  uint64_t v16 = v10;
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  v17(v9, v8, v16);
  uint64_t v18 = sub_100025AC0();
  os_log_type_t v19 = sub_100025CC0();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v21 = v0[17];
  if (v20)
  {
    os_log_type_t v43 = v19;
    log = v18;
    id v45 = v7;
    uint64_t v23 = v0[14];
    uint64_t v22 = v0[15];
    uint64_t v24 = v0[6];
    uint64_t v25 = v0[7];
    unint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    *(_DWORD *)unint64_t v26 = 136315138;
    v17(v25, v21, v23);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v25, 0, 1, v23);
    sub_100019D68(v25, v24);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v24, 1, v23) == 1)
    {
      sub_10001A738(v0[6], &qword_10003CEF0);
      unint64_t v27 = 0xE300000000000000;
      uint64_t v28 = 7104878;
      double v29 = v45;
    }
    else
    {
      uint64_t v33 = v0[18];
      uint64_t v34 = v0[16];
      uint64_t v35 = v0[14];
      (*(void (**)(uint64_t, void, uint64_t))(v0[15] + 32))(v34, v0[6], v35);
      v17(v33, v34, v35);
      uint64_t v28 = sub_100025BB0();
      unint64_t v27 = v36;
      double v29 = v45;
      v45(v34, v35);
    }
    uint64_t v37 = v0[17];
    uint64_t v38 = v0[14];
    uint64_t v39 = v0[9];
    uint64_t v46 = v0[8];
    uint64_t v47 = v0[10];
    sub_10001A738(v0[7], &qword_10003CEF0);
    v0[2] = sub_100019710(v28, v27, &v48);
    sub_100025CF0();
    swift_bridgeObjectRelease();
    v29(v37, v38);
    _os_log_impl((void *)&_mh_execute_header, log, v43, "Attempting to generate preview of image after writing to URL: %s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v47, v46);
  }
  else
  {
    uint64_t v31 = v0[9];
    uint64_t v30 = v0[10];
    uint64_t v32 = v0[8];
    v7(v0[17], v0[14]);

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
  }
  sub_100025890();
  sub_1000196CC((void *)(v0[5] + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21SecureImageTranscoder_blastDoor), *(void *)(v0[5] + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory21SecureImageTranscoder_blastDoor + 24));
  unsigned __int8 v40 = (void *)swift_task_alloc();
  v0[22] = v40;
  void *v40 = v0;
  v40[1] = sub_1000173EC;
  uint64_t v41 = v0[19];
  return sub_1000184F8(v41);
}

uint64_t sub_1000173EC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 184) = v2;
  swift_task_dealloc();
  if (v2)
  {
    unint64_t v7 = sub_100017614;
  }
  else
  {
    *(void *)(v6 + 192) = a2;
    *(void *)(v6 + 200) = a1;
    unint64_t v7 = sub_100017520;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_100017520()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[20];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[14];
  sub_10001770C();
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  uint64_t v6 = v0[24];
  uint64_t v5 = v0[25];
  return v4(v5, v6);
}

uint64_t sub_100017614()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[20];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[14];
  sub_10001770C();
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

id sub_10001770C()
{
  id v0 = [self defaultManager];
  sub_100025810(v1);
  uint64_t v3 = v2;
  id v8 = 0;
  unsigned int v4 = [v0 removeItemAtURL:v2 error:&v8];

  id v5 = v8;
  if (v4)
  {
    return v5;
  }
  else
  {
    id v7 = v8;
    sub_1000257F0();

    swift_willThrow();
    return (id)swift_errorRelease();
  }
}

uint64_t sub_1000179A8(void *a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = sub_100025880();
  uint64_t v9 = v8;

  v3[4] = v7;
  v3[5] = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  v3[6] = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_100017A84;
  return SecureImageTranscoder.generatePreviewImage(from:)(v7, v9);
}

uint64_t sub_100017A84(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v8 = *v3;
  uint64_t v7 = *v3;
  uint64_t v9 = *(void **)(*v3 + 16);
  uint64_t v10 = *v3;
  swift_task_dealloc();

  sub_10001A1B8(*(void *)(v7 + 32), *(void *)(v7 + 40));
  if (v4)
  {
    uint64_t v11 = sub_1000257E0();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v13 = (void *)v11;
  }
  else
  {
    Class isa = sub_100025870().super.isa;
    sub_10001A1B8(a1, a2);
    uint64_t v11 = 0;
    uint64_t v13 = isa;
  }
  uint64_t v14 = *(void (***)(void, void, void))(v8 + 24);
  ((void (**)(void, Class, uint64_t))v14)[2](v14, isa, v11);

  _Block_release(v14);
  uint64_t v15 = *(uint64_t (**)(void))(v10 + 8);
  return v15();
}

uint64_t sub_100017C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_100017CFC;
  return SecureImageTranscoder.generatePreviewImage(from:)(a5, a6);
}

uint64_t sub_100017CFC(uint64_t a1, unint64_t a2)
{
  *(void *)(*(void *)v3 + 24) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v6 = sub_100017F40;
  }
  else
  {
    sub_10001A1B8(a1, a2);
    uint64_t v6 = sub_100017E2C;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_100017E2C()
{
  if (qword_10003CDF0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100025AE0();
  sub_100014FA4(v1, (uint64_t)qword_10003D190);
  uint64_t v2 = sub_100025AC0();
  os_log_type_t v3 = sub_100025CC0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Warmed up BlastDoor interface", v4, 2u);
    swift_slowDealloc();
  }

  id v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_100017F40()
{
  if (qword_10003CDF0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100025AE0();
  sub_100014FA4(v1, (uint64_t)qword_10003D190);
  uint64_t v2 = sub_100025AC0();
  os_log_type_t v3 = sub_100025CC0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Warming up BlastDoor interface", v4, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();

  if (qword_10003CDF0 != -1) {
    swift_once();
  }
  sub_100014FA4(v1, (uint64_t)qword_10003D190);
  id v5 = sub_100025AC0();
  os_log_type_t v6 = sub_100025CC0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Warmed up BlastDoor interface", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100018118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100025CA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100025C90();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10001A738(a1, &qword_10003CF28);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100025C60();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100018310(uint64_t a1)
{
  uint64_t v2 = sub_100004B80(&qword_10003CF78);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_100025A90();
  return swift_release();
}

uint64_t sub_100018458(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v2 = a1;
    sub_100004B80(&qword_10003CF78);
    return sub_100025C80();
  }
  else
  {
    if (a2)
    {
      swift_errorRetain();
    }
    else
    {
      sub_10001A2C8();
      swift_allocError();
      *uint64_t v4 = 0;
    }
    sub_100004B80(&qword_10003CF78);
    return sub_100025C70();
  }
}

uint64_t sub_1000184F8(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  uint64_t v3 = sub_100025B40();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  sub_100004B80(&qword_10003CF58);
  v2[13] = swift_task_alloc();
  uint64_t v4 = sub_100025B60();
  v2[14] = v4;
  v2[15] = *(void *)(v4 - 8);
  v2[16] = swift_task_alloc();
  uint64_t v5 = sub_100025850();
  v2[17] = v5;
  v2[18] = *(void *)(v5 - 8);
  v2[19] = swift_task_alloc();
  return _swift_task_switch(sub_1000186A0, 0, 0);
}

uint64_t sub_1000186A0()
{
  BOOL v20 = v0;
  if (qword_10003CDF0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[4].i64[0];
  uint64_t v3 = v0[9].i64[0];
  uint64_t v2 = v0[9].i64[1];
  uint64_t v4 = v0[8].i64[1];
  uint64_t v5 = sub_100025AE0();
  v0[10].i64[0] = sub_100014FA4(v5, (uint64_t)qword_10003D190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  uint64_t v6 = sub_100025AC0();
  os_log_type_t v7 = sub_100025CC0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[9].i64[0];
  uint64_t v9 = v0[9].i64[1];
  uint64_t v11 = v0[8].i64[1];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_10001A31C();
    uint64_t v13 = sub_100025DC0();
    v0[3].i64[1] = sub_100019710(v13, v14, &v19);
    sub_100025CF0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Generating preview from file: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0[9].i64[1], v0[8].i64[1]);
  }

  uint64_t v15 = (int8x16_t *)swift_task_alloc();
  v0[10].i64[1] = (uint64_t)v15;
  v15[1] = vextq_s8(v0[4], v0[4], 8uLL);
  uint64_t v16 = (void *)swift_task_alloc();
  v0[11].i64[0] = (uint64_t)v16;
  unint64_t v17 = sub_1000167E4();
  v0[11].i64[1] = v17;
  *uint64_t v16 = v0;
  v16[1] = sub_10001897C;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(&v0[1], 0, 0, 0xD000000000000023, 0x800000010002AF60, sub_10001A2C0, v15, v17);
}

uint64_t sub_10001897C()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100018A98;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_100018B2C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100018A98()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100018B2C()
{
  uint64_t v52 = v0;
  id v1 = *(id *)(v0 + 16);
  uint64_t v2 = sub_100025AC0();
  os_log_type_t v3 = sub_100025CC0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    v51[0] = v5;
    *(void *)(v0 + 40) = v1;
    id v6 = v1;
    uint64_t v7 = sub_100025BB0();
    *(void *)(v0 + 48) = sub_100019710(v7, v8, v51);
    sub_100025CF0();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Generated preview with result: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_100025B10();
  uint64_t v9 = swift_dynamicCastClass();
  id v10 = v1;
  id v11 = v10;
  if (!v9)
  {
    id v11 = v10;
    double v29 = sub_100025AC0();
    os_log_type_t v30 = sub_100025CC0();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      *(void *)(v0 + 24) = swift_getObjectType();
      sub_100004B80(&qword_10003CF68);
      uint64_t v32 = sub_100025BB0();
      *(void *)(v0 + 32) = sub_100019710(v32, v33, v51);
      sub_100025CF0();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Received unsupported result type: %s", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t ObjectType = swift_getObjectType();
    sub_10001A2C8();
    swift_allocError();
    uint64_t *v39 = ObjectType;
    swift_willThrow();
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v12 = (void *)sub_100025B00();
  uint64_t v13 = (void *)sub_100025AF0();

  if (!v13)
  {
    uint64_t v34 = sub_100025AC0();
    os_log_type_t v35 = sub_100025CB0();
    if (os_log_type_enabled(v34, v35))
    {
      unint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Received empty image result from BlastDoor", v36, 2u);
      swift_slowDealloc();
    }

    sub_10001A2C8();
    swift_allocError();
    *uint64_t v37 = 0;
    swift_willThrow();

    goto LABEL_15;
  }
  uint64_t v14 = *(void *)(v0 + 192);
  uint64_t v16 = *(void *)(v0 + 96);
  uint64_t v15 = *(void *)(v0 + 104);
  uint64_t v17 = *(void *)(v0 + 80);
  uint64_t v18 = *(void *)(v0 + 88);
  type metadata accessor for CGImage();
  v51[3] = v19;
  v51[4] = (uint64_t)&protocol witness table for CGImageRef;
  v51[0] = (uint64_t)v13;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v15, 1, 1, v17);
  id v20 = v13;
  sub_100025B50();
  sub_100025B20();
  (*(void (**)(uint64_t, void, uint64_t))(v18 + 104))(v16, enum case for Image.Encoding.atx(_:), v17);
  uint64_t v21 = sub_100025B30();
  if (v14)
  {
    uint64_t v24 = *(void *)(v0 + 120);
    uint64_t v23 = *(void *)(v0 + 128);
    uint64_t v25 = *(void *)(v0 + 112);
    uint64_t v27 = *(void *)(v0 + 88);
    uint64_t v26 = *(void *)(v0 + 96);
    uint64_t v28 = *(void *)(v0 + 80);

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
LABEL_16:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unsigned __int8 v40 = *(uint64_t (**)(void))(v0 + 8);
    return v40();
  }
  uint64_t v42 = v21;
  uint64_t v43 = v22;
  uint64_t v44 = *(void *)(v0 + 120);
  uint64_t v45 = *(void *)(v0 + 128);
  uint64_t v50 = *(void *)(v0 + 112);
  uint64_t v46 = *(void *)(v0 + 96);
  uint64_t v48 = *(void *)(v0 + 80);
  uint64_t v47 = *(void *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v46, v48);
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v45, v50);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v49 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v49(v42, v43);
}

void sub_100019120()
{
  uint64_t v0 = sub_100025850();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  os_log_type_t v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = NSTemporaryDirectory();
  sub_100025BA0();

  sub_100025800();
  swift_bridgeObjectRelease();
  sub_100025820();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v5 = [self defaultManager];
  sub_100025810(v6);
  unint64_t v8 = v7;
  id v21 = 0;
  LODWORD(v3) = [v5 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v21];

  id v9 = v21;
  if (v3)
  {
    id v10 = v9;
  }
  else
  {
    v19[1] = v21;
    id v11 = v21;
    uint64_t v12 = sub_1000257F0();

    swift_willThrow();
    if (qword_10003CDF0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_100025AE0();
    sub_100014FA4(v13, (uint64_t)qword_10003D190);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v14 = sub_100025AC0();
    os_log_type_t v15 = sub_100025CB0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      id v21 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      uint64_t v20 = v12;
      swift_errorRetain();
      sub_100004B80(&qword_10003CF80);
      uint64_t v17 = sub_100025BB0();
      uint64_t v20 = sub_100019710(v17, v18, (uint64_t *)&v21);
      sub_100025CF0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Error creating temporary images directory: %s", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

uint64_t sub_1000194F8(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000195D4;
  return v6(a1);
}

uint64_t sub_1000195D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_1000196CC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100019710(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000197E4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001A260((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10001A260((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001A210((uint64_t)v12);
  return v7;
}

uint64_t sub_1000197E4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100025D00();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000199A0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100025D50();
  if (!v8)
  {
    sub_100025D60();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100025DB0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1000199A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100019A38(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100019C18(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100019C18(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100019A38(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100019BB0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100025D30();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100025D60();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100025BF0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100025DB0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100025D60();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100019BB0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100004B80(&qword_10003CF50);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100019C18(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004B80(&qword_10003CF50);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100025DB0();
  __break(1u);
  return result;
}

uint64_t sub_100019D68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B80(&qword_10003CEF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for SecureImageTranscoder()
{
  return self;
}

uint64_t sub_100019DF4()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100019E3C()
{
  uint64_t v2 = (void *)v0[2];
  unint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *size_t v5 = v1;
  v5[1] = sub_100019EF0;
  unint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_10003CF30 + dword_10003CF30);
  return v6(v2, v3, v4);
}

uint64_t sub_100019EF0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100019FE8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *size_t v5 = v1;
  v5[1] = sub_10001A984;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10003D048 + dword_10003D048);
  return v6(v2, v3, v4);
}

uint64_t sub_10001A0AC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001A0EC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10001A984;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10003D050 + dword_10003D050);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10001A1B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10001A210(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001A260(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001A2C0(uint64_t a1)
{
  return sub_100018310(a1);
}

unint64_t sub_10001A2C8()
{
  unint64_t result = qword_10003CF60;
  if (!qword_10003CF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF60);
  }
  return result;
}

unint64_t sub_10001A31C()
{
  unint64_t result = qword_10003CF70;
  if (!qword_10003CF70)
  {
    sub_100025850();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CF70);
  }
  return result;
}

uint64_t sub_10001A374()
{
  uint64_t v1 = sub_100004B80(&qword_10003CF78);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001A408(void *a1, uint64_t a2)
{
  sub_100004B80(&qword_10003CF78);

  return sub_100018458(a1, a2);
}

uint64_t sub_10001A48C(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_10001A550(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_10001A48C(__src, &__src[a2]);
  }
  sub_1000257D0();
  swift_allocObject();
  sub_1000257C0();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_100025860();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_10001A604()
{
  swift_unknownObjectRelease();

  sub_10001A1B8(*(void *)(v0 + 40), *(void *)(v0 + 48));

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001A64C()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10001A984;
  char v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *char v5 = v4;
  v5[1] = sub_100017CFC;
  return SecureImageTranscoder.generatePreviewImage(from:)(v2, v3);
}

uint64_t sub_10001A738(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004B80(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001A794()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001A7CC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_100019EF0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10003CF98 + dword_10003CF98);
  return v6(a1, v4);
}

void *initializeBufferWithCopyOfBuffer for BlastDoorError(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BlastDoorError(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BlastDoorError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_10001A938(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_10001A954(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for BlastDoorError()
{
  return &type metadata for BlastDoorError;
}

unint64_t sub_10001A988()
{
  unint64_t result = qword_10003CFB0;
  if (!qword_10003CFB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003CFB0);
  }
  return result;
}

uint64_t FTServerBag.blockingWaitSeconds.getter()
{
  NSString v1 = sub_100025B90();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    sub_100025D10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100004B18((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    sub_100004AB8((uint64_t)v7);
    return 1;
  }
  sub_10001A988();
  if ((swift_dynamicCast() & 1) == 0) {
    return 1;
  }
  id v3 = [v5 unsignedIntegerValue];

  return (uint64_t)v3;
}

unint64_t sub_10001AB00(uint64_t a1)
{
  return sub_10001AB0C(a1, &qword_10003CED0);
}

unint64_t sub_10001AB0C(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004B80(a2);
  id v3 = (void *)sub_100025DA0();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  id v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_100022350(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id LiveLookupStoreProxy.init()()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v1 = [objc_allocWithZone((Class)type metadata accessor for CoreAnalyticsReporter()) init];
  sub_1000259F0();
  uint64_t v2 = sub_1000259E0();
  id v3 = sub_1000224AC((uint64_t)v1, v2, (char *)objc_allocWithZone(ObjectType));

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v3;
}

uint64_t LiveLookupStoreProxy.imagePath.getter()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_imagePath);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t LiveLookupStoreProxy.imagePath.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_imagePath);
  swift_beginAccess();
  *id v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*LiveLookupStoreProxy.imagePath.modify())()
{
  return j__swift_endAccess;
}

void *LiveLookupStoreProxy.activeExtensions()()
{
  uint64_t v1 = sub_100025AE0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v52 = (unint64_t)&_swiftEmptyArrayStorage;
  sub_1000196CC((void *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore), *(void *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore + 24));
  unint64_t v5 = sub_100025940();
  unint64_t v6 = v5;
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100025D70();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_3;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v7) {
    goto LABEL_26;
  }
LABEL_3:
  uint64_t v8 = self;
  if (v7 < 1) {
    __break(1u);
  }
  uint64_t v10 = (void *)v8;
  uint64_t v11 = 0;
  unint64_t v50 = v6 & 0xC000000000000001;
  uint64_t v47 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v48 = (void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  *(void *)&long long v9 = 136315394;
  long long v41 = v9;
  v40[1] = (char *)&type metadata for Any + 8;
  uint64_t v42 = v7;
  uint64_t v49 = (void *)v8;
  do
  {
    if (v50) {
      id v12 = (id)sub_100025D40();
    }
    else {
      id v12 = *(id *)(v6 + 8 * v11 + 32);
    }
    uint64_t v13 = v12;
    NSString v14 = [v12 identifier];
    if (v14)
    {
      sub_100025BA0();

      NSString v14 = sub_100025B90();
      swift_bridgeObjectRelease();
    }
    v51[0] = 0;
    id v15 = [v10 extensionWithIdentifier:v14 error:v51];

    if (v15)
    {
      id v16 = v51[0];

      id v17 = v13;
      sub_100025C00();
      if (*(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100025C40();
      }
      sub_100025C50();
      sub_100025C30();
    }
    else
    {
      id v18 = v51[0];
      sub_1000257F0();

      swift_willThrow();
      if (qword_10003CDF0 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_100014FA4(v1, (uint64_t)qword_10003D190);
      (*v48)(v4, v19, v1);
      id v20 = v13;
      swift_errorRetain();
      id v21 = v20;
      swift_errorRetain();
      uint64_t v22 = sub_100025AC0();
      int v23 = sub_100025CC0();
      if (os_log_type_enabled(v22, (os_log_type_t)v23))
      {
        int v46 = v23;
        uint64_t v24 = swift_slowAlloc();
        uint64_t v45 = (void *)swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        uint64_t v53 = v25;
        *(_DWORD *)uint64_t v24 = v41;
        id v26 = [v21 identifier];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = sub_100025BA0();
          uint64_t v43 = v25;
          uint64_t v44 = v22;
          double v29 = v4;
          uint64_t v30 = v1;
          uint64_t v31 = (void *)v28;
          unint64_t v32 = v6;
          uint64_t v34 = v33;

          v51[0] = v31;
          v51[1] = v34;
          uint64_t v1 = v30;
          uint64_t v4 = v29;
          unint64_t v6 = v32;
          uint64_t v22 = v44;
          uint64_t v35 = sub_100025BB0();
          unint64_t v37 = v36;
        }
        else
        {
          unint64_t v37 = 0xE300000000000000;
          uint64_t v35 = 7104878;
        }
        *(void *)(v24 + 4) = sub_100019710(v35, v37, &v53);

        swift_bridgeObjectRelease();
        *(_WORD *)(v24 + 12) = 2112;
        swift_errorRetain();
        uint64_t v38 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v24 + 14) = v38;
        void *v45 = v38;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v22, (os_log_type_t)v46, "ignoring extension in DB, but not installed on the system: %s error=%@", (uint8_t *)v24, 0x16u);
        sub_100004B80(&qword_10003CFC8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
        (*v47)(v4, v1);
        uint64_t v7 = v42;
      }
      else
      {

        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();

        (*v47)(v4, v1);
      }
      uint64_t v10 = v49;
    }
    ++v11;
  }
  while (v7 != v11);
  swift_bridgeObjectRelease();
  return (void *)v52;
}

id LiveLookupStoreProxy.extensionIdentifier(for:)(void *a1)
{
  id result = [a1 identifier];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_100025BA0();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void LiveLookupStoreProxy.extensionIdentifier(from:)(void *a1)
{
  id v1 = [a1 dbExtension];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 identifier];

    if (v3)
    {
      sub_100025BA0();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void *LiveLookupStoreProxy.extensionIdentifier(for:)(void *a1)
{
  id v1 = [a1 dbExtension];
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 identifier];

    if (v3)
    {
      uint64_t v2 = (void *)sub_100025BA0();
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t LiveLookupStoreProxy.identityType(for:)(void *a1)
{
  unsigned int v1 = [a1 type];
  if (v1 == 1) {
    return 1;
  }
  else {
    return 2 * (v1 == 2);
  }
}

uint64_t LiveLookupStoreProxy.getBlockingInfo(for:)()
{
  sub_1000196CC((void *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore), *(void *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore + 24));
  return sub_100025960();
}

uint64_t LiveLookupStoreProxy.llExtension(_:containedIn:)(void *a1, unint64_t a2)
{
  unint64_t v2 = a2;
  id v3 = a1;
  if (a2 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v5 = a1;
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_100025D70())
  {
    unint64_t v19 = v2 & 0xC000000000000001;
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = v19 ? (id)sub_100025D40() : *(id *)(v2 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = [v7 dbExtension];
      if (v10)
      {
        uint64_t v11 = v10;
        sub_100025900();
        unint64_t v12 = v2;
        uint64_t v13 = v3;
        id v14 = v3;
        id v15 = v11;
        LOBYTE(v11) = sub_100025CE0();

        id v3 = v13;
        unint64_t v2 = v12;
        if (v11)
        {

          uint64_t v16 = 1;
          goto LABEL_15;
        }
      }

      ++v6;
      if (v9 == v4) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_13:
    id v17 = v3;
    swift_bridgeObjectRetain();
  }
LABEL_14:
  uint64_t v16 = 0;
LABEL_15:

  swift_bridgeObjectRelease();
  return v16;
}

void *LiveLookupStoreProxy.getBlockingInfo(for:with:)()
{
  sub_1000196CC((void *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore), *(void *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore + 24));
  unsigned int v1 = (void *)sub_1000259C0();
  if (qword_10003CDF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100025AE0();
  sub_100014FA4(v2, (uint64_t)qword_10003D190);
  id v3 = v1;
  uint64_t v4 = sub_100025AC0();
  os_log_type_t v5 = sub_100025CC0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    id v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    if (v1) {
      id v8 = v3;
    }
    sub_100025CF0();
    void *v7 = v1;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "getBlockingInfo blockingInfo=%@", v6, 0xCu);
    sub_100004B80(&qword_10003CFC8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return v1;
}

Swift::Bool __swiftcall LiveLookupStoreProxy.enabled(forExtensionWith:)(Swift::String forExtensionWith)
{
  object = forExtensionWith._object;
  uint64_t countAndFlagsBits = forExtensionWith._countAndFlagsBits;
  sub_1000196CC((void *)(v1 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore), *(void *)(v1 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore + 24));
  unint64_t v3 = sub_100025990();
  unint64_t v4 = v3;
  if (v3 >> 62) {
    goto LABEL_19;
  }
  for (uint64_t i = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_100025D70())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (v4 & 0xC000000000000001) != 0 ? (id)sub_100025D40() : *(id *)(v4 + 8 * v6);
      id v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = [v7 identifier];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = sub_100025BA0();
        id v14 = v13;

        if (v12 == countAndFlagsBits && v14 == object)
        {
          swift_bridgeObjectRelease();
LABEL_17:
          swift_bridgeObjectRelease();
          unsigned __int8 v17 = [v8 isEnabled];

          return v17;
        }
        char v16 = sub_100025DD0();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_17;
        }
      }

      ++v6;
      if (v9 == i) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_19:
    ;
  }
LABEL_20:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t LiveLookupStoreProxy.setEnabled(_:forExtensionWith:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 320) = a3;
  *(void *)(v4 + 328) = v3;
  *(void *)(v4 + 312) = a2;
  *(unsigned char *)(v4 + 608) = a1;
  uint64_t v5 = sub_100025AE0();
  *(void *)(v4 + 336) = v5;
  *(void *)(v4 + 344) = *(void *)(v5 - 8);
  *(void *)(v4 + 352) = swift_task_alloc();
  sub_100004B80(&qword_10003CEF0);
  *(void *)(v4 + 360) = swift_task_alloc();
  *(void *)(v4 + 368) = swift_task_alloc();
  *(void *)(v4 + 376) = swift_task_alloc();
  *(void *)(v4 + 384) = swift_task_alloc();
  uint64_t v6 = sub_1000258C0();
  *(void *)(v4 + 392) = v6;
  *(void *)(v4 + 400) = *(void *)(v6 - 8);
  *(void *)(v4 + 408) = swift_task_alloc();
  uint64_t v7 = sub_100025850();
  *(void *)(v4 + 416) = v7;
  *(void *)(v4 + 424) = *(void *)(v7 - 8);
  *(void *)(v4 + 432) = swift_task_alloc();
  *(void *)(v4 + 440) = swift_task_alloc();
  *(void *)(v4 + 448) = swift_task_alloc();
  *(void *)(v4 + 456) = swift_task_alloc();
  uint64_t v8 = sub_100025A70();
  *(void *)(v4 + 464) = v8;
  *(void *)(v4 + 472) = *(void *)(v8 - 8);
  uint64_t v9 = swift_task_alloc();
  *(void *)(v4 + 480) = v9;
  id v10 = (void *)swift_task_alloc();
  *(void *)(v4 + 488) = v10;
  *id v10 = v4;
  v10[1] = sub_10001C518;
  return static Host.context()(v9);
}

uint64_t sub_10001C518()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001C640, 0, 0);
}

uint64_t sub_10001C640()
{
  uint64_t v203 = v0;
  uint64_t v2 = *(void *)(v0 + 312);
  unint64_t v1 = *(void *)(v0 + 320);
  sub_100025A40();
  sub_100025A60();
  *(void *)(v0 + 496) = sub_100004B80(&qword_10003CFD8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002A220;
  swift_bridgeObjectRetain();
  v205._uint64_t countAndFlagsBits = 0x6B636F6C622ELL;
  v205._object = (void *)0xE600000000000000;
  sub_100025BE0(v205);
  *(void *)(inited + 32) = v2;
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = [objc_allocWithZone((Class)CMLUseCaseConfig) initWithType:0 maxShards:10000000 cacheElementCount:0];
  uint64_t v201 = v2;
  unint64_t v202 = v1;
  swift_bridgeObjectRetain();
  v206._uint64_t countAndFlagsBits = 0x7469746E6564692ELL;
  v206._object = (void *)0xE900000000000079;
  sub_100025BE0(v206);
  *(void *)(inited + 56) = v2;
  *(void *)(inited + 64) = v1;
  *(void *)(inited + 72) = [objc_allocWithZone((Class)CMLUseCaseConfig) initWithType:0 maxShards:10000000 cacheElementCount:0];
  unint64_t v4 = sub_10001AB0C(inited, (uint64_t *)&unk_10003D070);
  *(void *)(v0 + 504) = v4;
  if (qword_10003CDF0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100014FA4(*(void *)(v0 + 336), (uint64_t)qword_10003D190);
  *(void *)(v0 + 512) = v5;
  swift_bridgeObjectRetain_n();
  uint64_t v198 = v5;
  uint64_t v6 = sub_100025AC0();
  os_log_type_t v7 = sub_100025CC0();
  unint64_t v196 = v4;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v201 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_100022F8C();
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100025B80();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    uint64_t v12 = v9;
    unint64_t v4 = v196;
    *(void *)(v0 + 272) = sub_100019710(v12, v11, &v201);
    sub_100025CF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "useCases=%s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v189 = (_DWORD *)(v0 + 604);
  v190 = (uint64_t *)(v0 + 312);
  int v13 = *(unsigned __int8 *)(v0 + 608);
  id v14 = (void *)sub_1000258B0();
  v195 = (void *)v0;
  if (v13 != 1)
  {
    uint64_t v19 = 0;
    unint64_t v20 = v4 + 64;
    uint64_t v21 = -1;
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    if (-v22 < 64) {
      uint64_t v21 = ~(-1 << -(char)v22);
    }
    unint64_t v23 = v21 & *(void *)(v4 + 64);
    int64_t v24 = (unint64_t)(63 - v22) >> 6;
    while (1)
    {
      if (v23)
      {
        unint64_t v25 = __clz(__rbit64(v23));
        v23 &= v23 - 1;
        unint64_t v26 = v25 | (v19 << 6);
      }
      else
      {
        unint64_t v27 = v19 + 1;
        if (__OFADD__(v19, 1))
        {
          __break(1u);
LABEL_93:
          if (v27 >= 0x140)
          {
            unint64_t v141 = v14[12];
            if (v141)
            {
              uint64_t v114 = 4;
              goto LABEL_74;
            }
            uint64_t v165 = 0;
            uint64_t v166 = v27 >> 6;
            if (v166 <= 5) {
              uint64_t v166 = 5;
            }
            uint64_t v167 = v166 - 5;
            while (v167 != v165)
            {
              unint64_t v141 = v14[v165++ + 13];
              if (v141)
              {
                uint64_t v114 = v165 + 4;
                goto LABEL_74;
              }
            }
          }
LABEL_102:
          v168 = *(void **)(v19 + 536);
          unint64_t v169 = *(void *)(v19 + 528);
          uint64_t v170 = *(void *)(v19 + 520);
          uint64_t v171 = *(void *)(v19 + 328);
          swift_release();
          v172 = *(void **)(v171
                          + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_analyticsReporter);
          sub_1000258A0();
          double v174 = -v173;
          NSString v175 = sub_100025B90();
          [v172 sendEnableWithTimeInterval:v175 for:v174];

          sub_100022FCC(v170, v169);
LABEL_38:
          uint64_t v41 = *(void *)(v19 + 320);
          uint64_t v42 = *(void *)(v19 + 312);
          uint64_t v43 = (void *)(*(void *)(v19 + 328)
                         + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore);
          sub_1000196CC(v43, v43[3]);
          sub_100025930();
          sub_1000196CC(v43, v43[3]);
          unint64_t v44 = sub_100025990();
          swift_bridgeObjectRetain();
          uint64_t v45 = sub_1000227E4(v44, v42, v41);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain_n();
          int v46 = sub_100025AC0();
          if (v45)
          {
            uint64_t v47 = (unsigned __int8 *)(v19 + 608);
            os_log_type_t v48 = sub_100025CC0();
            BOOL v49 = os_log_type_enabled(v46, v48);
            unint64_t v50 = *(void *)(v19 + 320);
            if (v49)
            {
              uint64_t v193 = *v190;
              int v199 = *v47;
              uint64_t v51 = swift_slowAlloc();
              uint64_t v201 = swift_slowAlloc();
              *(_DWORD *)uint64_t v51 = 136315394;
              swift_bridgeObjectRetain();
              v195[36] = sub_100019710(v193, v50, &v201);
              uint64_t v19 = (uint64_t)v195;
              sub_100025CF0();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v51 + 12) = 1024;
              _DWORD *v189 = v199;
              sub_100025CF0();
              _os_log_impl((void *)&_mh_execute_header, v46, v48, "setting %s enabled to %{BOOL}d", (uint8_t *)v51, 0x12u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease_n();
            }

            uint64_t v57 = *(void *)(v19 + 472);
            uint64_t v58 = *(void *)(v19 + 480);
            uint64_t v185 = v195[57];
            uint64_t v187 = *(void *)(v19 + 464);
            uint64_t v59 = v195[53];
            uint64_t v60 = v195[52];
            uint64_t v181 = v195[51];
            uint64_t v183 = v195[56];
            uint64_t v61 = v195[50];
            uint64_t v180 = v195[49];
            [v45 setIsEnabled:*v47];
            uint64_t v62 = (void *)sub_100025CD0();
            sub_100025BA0();

            uint64_t v63 = sub_100025BC0();
            swift_bridgeObjectRelease();
            notify_post((const char *)(v63 + 32));
            swift_release();
            sub_1000196CC(v43, v43[3]);
            sub_1000259A0();

            (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v181, v180);
            uint64_t v64 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
            v64(v183, v60);
            v64(v185, v60);
            (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v58, v187);
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            uint64_t v65 = (uint64_t (*)(void))v195[1];
            goto LABEL_83;
          }
          os_log_type_t v52 = sub_100025CB0();
          BOOL v53 = os_log_type_enabled(v46, v52);
          unint64_t v54 = *(void *)(v19 + 320);
          if (v53)
          {
            uint64_t v55 = *v190;
            uint64_t v56 = (uint8_t *)swift_slowAlloc();
            uint64_t v201 = swift_slowAlloc();
            *(_DWORD *)uint64_t v56 = 136315138;
            swift_bridgeObjectRetain();
            *(void *)(v19 + 296) = sub_100019710(v55, v54, &v201);
            sub_100025CF0();
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v46, v52, "Cannot find extension %s in DB", v56, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }

          uint64_t v91 = *(void *)(v19 + 312);
          id v90 = *(void **)(v19 + 320);
          uint64_t v201 = 0;
          unint64_t v202 = 0xE000000000000000;
          sub_100025D20(20);
          swift_bridgeObjectRelease();
          uint64_t v201 = 0xD000000000000012;
          unint64_t v202 = 0x800000010002B040;
          v207._uint64_t countAndFlagsBits = v91;
          v207._object = v90;
          sub_100025BE0(v207);
          uint64_t v92 = v201;
          unint64_t v93 = v202;
          sub_100022ECC();
          swift_allocError();
          *id v94 = v92;
          v94[1] = v93;
          swift_willThrow();
LABEL_82:
          uint64_t v157 = *(void *)(v19 + 472);
          uint64_t v158 = *(void *)(v19 + 480);
          uint64_t v160 = *(void *)(v19 + 456);
          uint64_t v159 = *(void *)(v19 + 464);
          uint64_t v161 = v195[56];
          uint64_t v162 = v195[53];
          uint64_t v163 = v195[52];
          (*(void (**)(void, void))(v195[50] + 8))(v195[51], v195[49]);
          v164 = *(void (**)(uint64_t, uint64_t))(v162 + 8);
          v164(v161, v163);
          v164(v160, v163);
          (*(void (**)(uint64_t, uint64_t))(v157 + 8))(v158, v159);
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          uint64_t v65 = (uint64_t (*)(void))v195[1];
LABEL_83:
          return v65();
        }
        if ((uint64_t)v27 >= v24) {
          goto LABEL_37;
        }
        unint64_t v28 = *(void *)(v20 + 8 * v27);
        ++v19;
        if (!v28)
        {
          uint64_t v19 = v27 + 1;
          if ((uint64_t)(v27 + 1) >= v24) {
            goto LABEL_37;
          }
          unint64_t v28 = *(void *)(v20 + 8 * v19);
          if (!v28)
          {
            uint64_t v19 = v27 + 2;
            if ((uint64_t)(v27 + 2) >= v24) {
              goto LABEL_37;
            }
            unint64_t v28 = *(void *)(v20 + 8 * v19);
            if (!v28)
            {
              uint64_t v19 = v27 + 3;
              if ((uint64_t)(v27 + 3) >= v24) {
                goto LABEL_37;
              }
              unint64_t v28 = *(void *)(v20 + 8 * v19);
              if (!v28)
              {
                uint64_t v19 = v27 + 4;
                if ((uint64_t)(v27 + 4) >= v24) {
                  goto LABEL_37;
                }
                unint64_t v28 = *(void *)(v20 + 8 * v19);
                if (!v28)
                {
                  int64_t v29 = v27 + 5;
                  if (v29 >= v24)
                  {
LABEL_37:
                    uint64_t v19 = (uint64_t)v195;
                    uint64_t v36 = v195[41];
                    swift_release();
                    unint64_t v37 = *(void **)(v36
                                   + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_analyticsReporter);
                    sub_1000258A0();
                    double v39 = -v38;
                    NSString v40 = sub_100025B90();
                    [v37 sendDisableWithTimeInterval:v40 for:v39];

                    goto LABEL_38;
                  }
                  unint64_t v28 = *(void *)(v20 + 8 * v29);
                  if (!v28)
                  {
                    while (1)
                    {
                      uint64_t v19 = v29 + 1;
                      if (__OFADD__(v29, 1)) {
                        break;
                      }
                      if (v19 >= v24) {
                        goto LABEL_37;
                      }
                      unint64_t v28 = *(void *)(v20 + 8 * v19);
                      ++v29;
                      if (v28) {
                        goto LABEL_34;
                      }
                    }
                    __break(1u);
                    return sub_100025D60();
                  }
                  uint64_t v19 = v29;
                }
              }
            }
          }
        }
LABEL_34:
        unint64_t v23 = (v28 - 1) & v28;
        unint64_t v26 = __clz(__rbit64(v28)) + (v19 << 6);
      }
      uint64_t v30 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v26);
      uint64_t v32 = *v30;
      unint64_t v31 = v30[1];
      swift_bridgeObjectRetain_n();
      unint64_t v33 = sub_100025AC0();
      os_log_type_t v34 = sub_100025CC0();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v201 = swift_slowAlloc();
        *(_DWORD *)uint64_t v35 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v35 + 4) = sub_100019710(v32, v31, &v201);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "unregistering group %s", (uint8_t *)v35, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        unint64_t v4 = v196;
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      sub_100022AEC(v32, v31);
      id v14 = (void *)swift_bridgeObjectRelease();
    }
  }
  uint64_t v179 = v0 + 264;
  uint64_t v15 = sub_100025A50();
  uint64_t v17 = v15;
  unint64_t v18 = v16;
  v177 = (uint64_t *)(v0 + 256);
  switch(v16 >> 62)
  {
    case 1uLL:
      sub_10001A1B8(v15, v16);
      if ((int)v17 != v17 >> 32) {
        goto LABEL_48;
      }
      goto LABEL_50;
    case 2uLL:
      uint64_t v67 = *(void *)(v15 + 16);
      uint64_t v66 = *(void *)(v15 + 24);
      sub_10001A1B8(v15, v16);
      if (v67 != v66) {
        goto LABEL_48;
      }
      goto LABEL_50;
    case 3uLL:
      sub_10001A1B8(v15, v16);
      goto LABEL_50;
    default:
      sub_10001A1B8(v15, v16);
      if ((v18 & 0xFF000000000000) != 0)
      {
LABEL_48:
        uint64_t v68 = sub_100025A50();
      }
      else
      {
LABEL_50:
        uint64_t v68 = 0;
        unint64_t v69 = 0xF000000000000000;
      }
      unint64_t v186 = v69;
      uint64_t v188 = v68;
      *(void *)(v0 + 528) = v69;
      *(void *)(v0 + 520) = v68;
      uint64_t v182 = *(void *)(v0 + 456);
      uint64_t v184 = *(void *)(v0 + 448);
      uint64_t v71 = *(void *)(v0 + 416);
      uint64_t v70 = *(void *)(v0 + 424);
      uint64_t v73 = *(void *)(v0 + 376);
      uint64_t v72 = *(void *)(v0 + 384);
      uint64_t v74 = *(void *)(v0 + 344);
      uint64_t v191 = *(void *)(v0 + 352);
      uint64_t v194 = *(void *)(v0 + 336);
      sub_1000196CC((void *)(*(void *)(v0 + 328)+ OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore), *(void *)(*(void *)(v0 + 328)+ OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore+ 24));
      char v75 = sub_100025910();
      id v76 = *(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16);
      v76(v72, v182, v71);
      id v77 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56);
      v77(v72, 0, 1, v71);
      v178 = v76;
      v76(v73, v184, v71);
      v77(v73, 0, 1, v71);
      id v78 = objc_allocWithZone((Class)CMLNetworkManager);
      sub_100022F20(v188, v186);
      id v79 = sub_100021E58(1, v72, v73, v188, v186, (v75 & 1) == 0);
      *(void *)(v0 + 536) = v79;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 16))(v191, v198, v194);
      id v80 = v79;
      id v81 = sub_100025AC0();
      os_log_type_t v82 = sub_100025CC0();
      if (os_log_type_enabled(v81, v82))
      {
        uint64_t v83 = swift_slowAlloc();
        uint64_t v201 = swift_slowAlloc();
        *(_DWORD *)uint64_t v83 = 136315394;
        id v84 = [v80 endpoint];
        os_log_type_t v200 = v82;
        if (v84)
        {
          long long v85 = v84;
          sub_100025830();

          uint64_t v86 = 0;
        }
        else
        {
          uint64_t v86 = 1;
        }
        uint64_t v96 = *(void *)(v0 + 416);
        uint64_t v95 = *(void *)(v0 + 424);
        uint64_t v98 = *(void *)(v0 + 360);
        uint64_t v97 = *(void *)(v0 + 368);
        v77(v97, v86, 1, v96);
        sub_100019D68(v97, v98);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v95 + 48))(v98, 1, v96) == 1)
        {
          sub_10001A738(*(void *)(v0 + 360), &qword_10003CEF0);
          unint64_t v99 = 0xE300000000000000;
          uint64_t v100 = 7104878;
        }
        else
        {
          uint64_t v102 = *(void *)(v0 + 432);
          uint64_t v101 = *(void *)(v0 + 440);
          uint64_t v104 = *(void *)(v0 + 416);
          uint64_t v103 = *(void *)(v0 + 424);
          (*(void (**)(uint64_t, void, uint64_t))(v103 + 32))(v101, *(void *)(v0 + 360), v104);
          v178(v102, v101, v104);
          uint64_t v100 = sub_100025BB0();
          unint64_t v99 = v105;
          (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v101, v104);
        }
        uint64_t v106 = *(void *)(v0 + 344);
        uint64_t v192 = *(void *)(v0 + 352);
        uint64_t v107 = *(void *)(v0 + 336);
        sub_10001A738(*(void *)(v0 + 368), &qword_10003CEF0);
        *(void *)(v0 + 304) = sub_100019710(v100, v99, &v201);
        sub_100025CF0();
        swift_bridgeObjectRelease();

        *(_WORD *)(v83 + 12) = 1024;
        unsigned int v108 = [v80 privacyProxyFailOpen];

        *(_DWORD *)(v0 + 600) = v108;
        sub_100025CF0();

        _os_log_impl((void *)&_mh_execute_header, v81, v200, "networkConfig endpoint=%s privacyProxyFailOpen=%{BOOL}d", (uint8_t *)v83, 0x12u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v192, v107);
      }
      else
      {
        uint64_t v88 = *(void *)(v0 + 344);
        uint64_t v87 = *(void *)(v0 + 352);
        uint64_t v89 = *(void *)(v0 + 336);

        (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v87, v89);
      }
      char v109 = *(unsigned char *)(v196 + 32);
      *(unsigned char *)(v0 + 609) = v109;
      uint64_t v110 = -1;
      uint64_t v111 = -1 << v109;
      uint64_t v112 = *(void *)(v196 + 64);
      if (-v111 < 64) {
        uint64_t v110 = ~(-1 << -(char)v111);
      }
      *(void *)(v0 + 544) = 0;
      unint64_t v113 = v110 & v112;
      uint64_t v19 = v0;
      if (v113)
      {
        uint64_t v114 = 0;
        unint64_t v115 = __clz(__rbit64(v113));
        uint64_t v116 = (v113 - 1) & v113;
        id v14 = *(void **)(v0 + 504);
        goto LABEL_66;
      }
      unint64_t v27 = 63 - v111;
      id v14 = *(void **)(v0 + 504);
      if (v27 <= 0x7F) {
        goto LABEL_102;
      }
      unint64_t v141 = v14[9];
      if (v141)
      {
        uint64_t v114 = 1;
        break;
      }
      if (v27 < 0xC0) {
        goto LABEL_102;
      }
      unint64_t v141 = v14[10];
      if (v141)
      {
        uint64_t v114 = 2;
        break;
      }
      if (v27 < 0x100) {
        goto LABEL_102;
      }
      unint64_t v141 = v14[11];
      if (!v141) {
        goto LABEL_93;
      }
      uint64_t v114 = 3;
      break;
  }
LABEL_74:
  uint64_t v116 = (v141 - 1) & v141;
  unint64_t v115 = __clz(__rbit64(v141)) + (v114 << 6);
LABEL_66:
  *(void *)(v19 + 560) = v116;
  *(void *)(v19 + 552) = v114;
  v117 = *(void **)(v19 + 536);
  v118 = (uint64_t *)(v14[6] + 16 * v115);
  uint64_t v120 = *v118;
  unint64_t v119 = v118[1];
  v121 = *(void **)(v14[7] + 8 * v115);
  *(void *)(v19 + 568) = v121;
  uint64_t v122 = swift_initStackObject();
  *(_OWORD *)(v122 + 16) = xmmword_10002A120;
  *(void *)(v122 + 32) = v120;
  *(void *)(v122 + 40) = v119;
  *(void *)(v122 + 48) = v121;
  swift_bridgeObjectRetain_n();
  id v123 = v121;
  sub_10001AB0C(v122, (uint64_t *)&unk_10003D070);
  id v124 = objc_allocWithZone((Class)CMLUseCaseGroup);
  sub_100022F8C();
  id v125 = v117;
  Class isa = sub_100025B70().super.isa;
  swift_bridgeObjectRelease();
  id v127 = [v124 initWithKeyExpirationMinutes:10080 keyRotationBeforeExpirationMinutes:1440 useCases:isa networkConfig:v125];
  *(void *)(v19 + 576) = v127;

  id v128 = [self sharedManager];
  NSString v129 = sub_100025B90();
  *(void *)(v19 + 264) = 0;
  LODWORD(v125) = [v128 configureGroupWithName:v129 useCaseGroup:v127 error:v179];

  v130 = *(void **)(v19 + 264);
  if (v125)
  {
    swift_bridgeObjectRetain_n();
    id v131 = v130;
    v132 = sub_100025AC0();
    os_log_type_t v133 = sub_100025CC0();
    if (os_log_type_enabled(v132, v133))
    {
      uint64_t v134 = swift_slowAlloc();
      uint64_t v201 = swift_slowAlloc();
      *(_DWORD *)uint64_t v134 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v134 + 4) = sub_100019710(v120, v119, &v201);
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v132, v133, "configured group %s", (uint8_t *)v134, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v197 = self;
    id v142 = objc_allocWithZone((Class)CMLClientConfig);
    swift_bridgeObjectRetain();
    NSString v143 = sub_100025B90();
    swift_bridgeObjectRelease();
    NSString v144 = sub_100025B90();
    swift_bridgeObjectRelease();
    id v145 = [v142 initWithUseCase:v143 sourceApplicationBundleIdentifier:v144];
    *(void *)(v19 + 584) = v145;

    *(void *)(v19 + 16) = v19;
    *(void *)(v19 + 56) = v19 + 280;
    *(void *)(v19 + 24) = sub_10001E000;
    uint64_t v146 = swift_continuation_init();
    *(void *)(v19 + 216) = _NSConcreteStackBlock;
    *(void *)(v19 + 224) = 0x40000000;
    *(void *)(v19 + 232) = sub_10001FFA0;
    *(void *)(v19 + 240) = &unk_100035478;
    *(void *)(v19 + 248) = v146;
    [v197 requestStatusForClientConfig:v145 options:10 completionHandler:v19 + 216];
    return _swift_continuation_await(v19 + 16);
  }
  else
  {
    id v135 = v130;
    swift_bridgeObjectRelease();
    sub_1000257F0();

    swift_willThrow();
    swift_release();
    swift_errorRetain();
    swift_errorRetain();
    v136 = sub_100025AC0();
    os_log_type_t v137 = sub_100025CC0();
    if (os_log_type_enabled(v136, v137))
    {
      v138 = (uint8_t *)swift_slowAlloc();
      v139 = (void *)swift_slowAlloc();
      *(_DWORD *)v138 = 138412290;
      swift_errorRetain();
      uint64_t v140 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t *v177 = v140;
      sub_100025CF0();
      void *v139 = v140;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v136, v137, "configure failed %@", v138, 0xCu);
      sub_100004B80(&qword_10003CFC8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v147 = *(void *)(v19 + 328);

    v148 = *(void **)(v147 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_analyticsReporter);
    v149 = (void *)sub_1000257E0();
    unint64_t v150 = (unint64_t)[v149 code];

    if ((v150 & 0x8000000000000000) == 0)
    {
      v151 = *(void **)(v19 + 536);
      unint64_t v152 = *(void *)(v19 + 528);
      uint64_t v153 = *(void *)(v19 + 520);
      uint64_t v155 = *(void *)(v19 + 312);
      unint64_t v154 = *(void *)(v19 + 320);
      NSString v156 = sub_100025B90();
      [v148 sendEnableWithError:v150 for:v156];

      sub_100022AEC(v155, v154);
      swift_willThrow();

      sub_100022FCC(v153, v152);
      goto LABEL_82;
    }
    return sub_100025D60();
  }
}

uint64_t sub_10001E000()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 592) = v1;
  if (v1) {
    uint64_t v2 = sub_10001EFD8;
  }
  else {
    uint64_t v2 = sub_10001E13C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001E13C()
{
  uint64_t v109 = v0;
  uint64_t v1 = *(void **)(v0 + 584);
  uint64_t v2 = *(void **)(v0 + 576);

  uint64_t v3 = *(void **)(v0 + 280);
  unint64_t v4 = *(void *)(v0 + 560);
  int64_t v5 = *(void *)(v0 + 552);
  if (v4)
  {
    uint64_t v6 = (v4 - 1) & v4;
    unint64_t v7 = __clz(__rbit64(v4)) | (v5 << 6);
    uint64_t v8 = *(void *)(v0 + 504);
LABEL_3:
    *(void *)(v0 + 560) = v6;
    *(void *)(v0 + 552) = v5;
    uint64_t v9 = *(void **)(v0 + 536);
    unint64_t v10 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v7);
    uint64_t v12 = *v10;
    unint64_t v11 = v10[1];
    int v13 = *(void **)(*(void *)(v8 + 56) + 8 * v7);
    *(void *)(v0 + 568) = v13;
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10002A120;
    *(void *)(inited + 32) = v12;
    *(void *)(inited + 40) = v11;
    *(void *)(inited + 48) = v13;
    swift_bridgeObjectRetain_n();
    id v15 = v13;
    sub_10001AB0C(inited, (uint64_t *)&unk_10003D070);
    id v16 = objc_allocWithZone((Class)CMLUseCaseGroup);
    sub_100022F8C();
    id v17 = v9;
    Class isa = sub_100025B70().super.isa;
    swift_bridgeObjectRelease();
    id v19 = [v16 initWithKeyExpirationMinutes:10080 keyRotationBeforeExpirationMinutes:1440 useCases:isa networkConfig:v17];
    *(void *)(v0 + 576) = v19;

    id v20 = [self sharedManager];
    NSString v21 = sub_100025B90();
    *(void *)(v0 + 264) = 0;
    LODWORD(v17) = [v20 configureGroupWithName:v21 useCaseGroup:v19 error:v0 + 264];

    uint64_t v22 = *(void **)(v0 + 264);
    if (v17)
    {
      swift_bridgeObjectRetain_n();
      id v23 = v22;
      int64_t v24 = sub_100025AC0();
      os_log_type_t v25 = sub_100025CC0();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = swift_slowAlloc();
        uint64_t v107 = swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v26 + 4) = sub_100019710(v12, v11, &v107);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "configured group %s", (uint8_t *)v26, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      unint64_t v37 = self;
      id v38 = objc_allocWithZone((Class)CMLClientConfig);
      swift_bridgeObjectRetain();
      NSString v39 = sub_100025B90();
      swift_bridgeObjectRelease();
      NSString v40 = sub_100025B90();
      swift_bridgeObjectRelease();
      id v41 = [v38 initWithUseCase:v39 sourceApplicationBundleIdentifier:v40];
      *(void *)(v0 + 584) = v41;

      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 280;
      *(void *)(v0 + 24) = sub_10001E000;
      uint64_t v42 = swift_continuation_init();
      *(void *)(v0 + 216) = _NSConcreteStackBlock;
      *(void *)(v0 + 224) = 0x40000000;
      *(void *)(v0 + 232) = sub_10001FFA0;
      *(void *)(v0 + 240) = &unk_100035478;
      *(void *)(v0 + 248) = v42;
      [v37 requestStatusForClientConfig:v41 options:10 completionHandler:v0 + 216];
      return _swift_continuation_await(v0 + 16);
    }
    id v27 = v22;
    swift_bridgeObjectRelease();
    sub_1000257F0();

    swift_willThrow();
    swift_release();
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v28 = sub_100025AC0();
    os_log_type_t v29 = sub_100025CC0();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      unint64_t v31 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 138412290;
      swift_errorRetain();
      uint64_t v32 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 256) = v32;
      sub_100025CF0();
      void *v31 = v32;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "configure failed %@", v30, 0xCu);
      sub_100004B80(&qword_10003CFC8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v43 = *(void *)(v0 + 328);

    unint64_t v44 = *(void **)(v43 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_analyticsReporter);
    uint64_t v45 = (void *)sub_1000257E0();
    unint64_t v46 = (unint64_t)[v45 code];

    if ((v46 & 0x8000000000000000) != 0) {
      return sub_100025D60();
    }
    uint64_t v47 = *(void **)(v0 + 536);
    unint64_t v48 = *(void *)(v0 + 528);
    uint64_t v49 = *(void *)(v0 + 520);
    uint64_t v51 = *(void *)(v0 + 312);
    unint64_t v50 = *(void *)(v0 + 320);
    NSString v52 = sub_100025B90();
    [v44 sendEnableWithError:v46 for:v52];

    sub_100022AEC(v51, v50);
    swift_willThrow();

    sub_100022FCC(v49, v48);
    goto LABEL_19;
  }
  int64_t v33 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_44;
  }
  int64_t v34 = (unint64_t)((1 << *(unsigned char *)(v0 + 609)) + 63) >> 6;
  uint64_t v8 = *(void *)(v0 + 504);
  if (v33 < v34)
  {
    uint64_t v35 = v8 + 64;
    unint64_t v36 = *(void *)(v8 + 64 + 8 * v33);
    ++v5;
    if (v36)
    {
LABEL_11:
      uint64_t v6 = (v36 - 1) & v36;
      unint64_t v7 = __clz(__rbit64(v36)) + (v5 << 6);
      goto LABEL_3;
    }
    int64_t v5 = v33 + 1;
    if (v33 + 1 < v34)
    {
      unint64_t v36 = *(void *)(v35 + 8 * v5);
      if (v36) {
        goto LABEL_11;
      }
      int64_t v5 = v33 + 2;
      if (v33 + 2 < v34)
      {
        unint64_t v36 = *(void *)(v35 + 8 * v5);
        if (v36) {
          goto LABEL_11;
        }
        int64_t v62 = v33 + 3;
        if (v62 < v34)
        {
          unint64_t v36 = *(void *)(v35 + 8 * v62);
          if (v36)
          {
            int64_t v5 = v62;
            goto LABEL_11;
          }
          while (1)
          {
            int64_t v5 = v62 + 1;
            if (__OFADD__(v62, 1)) {
              break;
            }
            if (v5 >= v34) {
              goto LABEL_30;
            }
            unint64_t v36 = *(void *)(v35 + 8 * v5);
            ++v62;
            if (v36) {
              goto LABEL_11;
            }
          }
LABEL_44:
          __break(1u);
        }
      }
    }
  }
LABEL_30:
  uint64_t v63 = *(void **)(v0 + 536);
  unint64_t v64 = *(void *)(v0 + 528);
  uint64_t v65 = *(void *)(v0 + 520);
  uint64_t v66 = *(void *)(v0 + 328);
  swift_release();
  uint64_t v67 = *(void **)(v66 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_analyticsReporter);
  sub_1000258A0();
  double v69 = -v68;
  NSString v70 = sub_100025B90();
  [v67 sendEnableWithTimeInterval:v70 for:v69];

  sub_100022FCC(v65, v64);
  uint64_t v71 = *(void *)(v0 + 320);
  uint64_t v72 = *(void *)(v0 + 312);
  uint64_t v73 = (void *)(*(void *)(v0 + 328)
                 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore);
  sub_1000196CC(v73, v73[3]);
  sub_100025930();
  sub_1000196CC(v73, v73[3]);
  unint64_t v74 = sub_100025990();
  swift_bridgeObjectRetain();
  char v75 = sub_1000227E4(v74, v72, v71);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  id v76 = sub_100025AC0();
  if (v75)
  {
    os_log_type_t v77 = sub_100025CC0();
    BOOL v78 = os_log_type_enabled(v76, v77);
    unint64_t v79 = *(void *)(v0 + 320);
    if (v78)
    {
      uint64_t v105 = *(void *)(v0 + 312);
      int v106 = *(unsigned __int8 *)(v0 + 608);
      uint64_t v80 = swift_slowAlloc();
      uint64_t v107 = swift_slowAlloc();
      *(_DWORD *)uint64_t v80 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 288) = sub_100019710(v105, v79, &v107);
      sub_100025CF0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v80 + 12) = 1024;
      *(_DWORD *)(v0 + 604) = v106;
      sub_100025CF0();
      _os_log_impl((void *)&_mh_execute_header, v76, v77, "setting %s enabled to %{BOOL}d", (uint8_t *)v80, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v86 = *(void *)(v0 + 472);
    uint64_t v103 = *(void *)(v0 + 464);
    uint64_t v104 = *(void *)(v0 + 480);
    uint64_t v101 = *(void *)(v0 + 448);
    uint64_t v102 = *(void *)(v0 + 456);
    uint64_t v87 = *(void *)(v0 + 424);
    uint64_t v88 = *(void *)(v0 + 416);
    uint64_t v89 = *(void *)(v0 + 400);
    uint64_t v99 = *(void *)(v0 + 392);
    uint64_t v100 = *(void *)(v0 + 408);
    [v75 setIsEnabled:*(unsigned __int8 *)(v0 + 608)];
    id v90 = (void *)sub_100025CD0();
    sub_100025BA0();

    uint64_t v91 = sub_100025BC0();
    swift_bridgeObjectRelease();
    notify_post((const char *)(v91 + 32));
    swift_release();
    sub_1000196CC(v73, v73[3]);
    sub_1000259A0();

    (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v100, v99);
    uint64_t v92 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
    v92(v101, v88);
    v92(v102, v88);
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v104, v103);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v61 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_37;
  }
  uint64_t v81 = sub_100025CB0();
  BOOL v82 = os_log_type_enabled(v76, (os_log_type_t)v81);
  unint64_t v83 = *(void *)(v0 + 320);
  if (v82)
  {
    uint64_t v84 = *(void *)(v0 + 312);
    long long v85 = (uint8_t *)swift_slowAlloc();
    uint64_t v107 = swift_slowAlloc();
    *(_DWORD *)long long v85 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 296) = sub_100019710(v84, v83, &v107);
    sub_100025CF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v76, (os_log_type_t)v81, "Cannot find extension %s in DB", v85, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v94 = *(void *)(v0 + 312);
  unint64_t v93 = *(void **)(v0 + 320);
  uint64_t v107 = 0;
  unint64_t v108 = 0xE000000000000000;
  sub_100025D20(20);
  swift_bridgeObjectRelease();
  uint64_t v107 = 0xD000000000000012;
  unint64_t v108 = 0x800000010002B040;
  v111._uint64_t countAndFlagsBits = v94;
  v111._object = v93;
  sub_100025BE0(v111);
  uint64_t v96 = v107;
  unint64_t v95 = v108;
  sub_100022ECC();
  swift_allocError();
  *uint64_t v97 = v96;
  v97[1] = v95;
  swift_willThrow();
LABEL_19:
  uint64_t v53 = *(void *)(v0 + 472);
  uint64_t v54 = *(void *)(v0 + 480);
  uint64_t v56 = *(void *)(v0 + 456);
  uint64_t v55 = *(void *)(v0 + 464);
  uint64_t v57 = *(void *)(v0 + 448);
  uint64_t v58 = *(void *)(v0 + 424);
  uint64_t v59 = *(void *)(v0 + 416);
  (*(void (**)(void, void))(*(void *)(v0 + 400) + 8))(*(void *)(v0 + 408), *(void *)(v0 + 392));
  uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
  v60(v57, v59);
  v60(v56, v59);
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v54, v55);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v61 = *(uint64_t (**)(void))(v0 + 8);
LABEL_37:
  return v61();
}

uint64_t sub_10001EFD8()
{
  uint64_t v117 = v0;
  uint64_t v1 = *(void **)(v0 + 584);
  swift_willThrow();

  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_100025AC0();
  os_log_type_t v3 = sub_100025CC0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  int64_t v5 = *(void **)(v0 + 576);
  uint64_t v6 = *(NSObject **)(v0 + 568);
  if (v4)
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v7 + 4) = v9;
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "register failed %@, ignoring", (uint8_t *)v7, 0xCu);
    sub_100004B80(&qword_10003CFC8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
    uint64_t v6 = v2;
  }

  unint64_t v10 = *(void *)(v0 + 560);
  int64_t v11 = *(void *)(v0 + 552);
  *(void *)(v0 + 544) = 0;
  if (v10)
  {
    uint64_t v12 = (v10 - 1) & v10;
    unint64_t v13 = __clz(__rbit64(v10)) | (v11 << 6);
    uint64_t v14 = *(void *)(v0 + 504);
LABEL_6:
    *(void *)(v0 + 560) = v12;
    *(void *)(v0 + 552) = v11;
    id v15 = *(void **)(v0 + 536);
    id v16 = (uint64_t *)(*(void *)(v14 + 48) + 16 * v13);
    uint64_t v18 = *v16;
    unint64_t v17 = v16[1];
    id v19 = *(void **)(*(void *)(v14 + 56) + 8 * v13);
    *(void *)(v0 + 568) = v19;
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10002A120;
    *(void *)(inited + 32) = v18;
    *(void *)(inited + 40) = v17;
    *(void *)(inited + 48) = v19;
    swift_bridgeObjectRetain_n();
    id v21 = v19;
    sub_10001AB0C(inited, (uint64_t *)&unk_10003D070);
    id v22 = objc_allocWithZone((Class)CMLUseCaseGroup);
    sub_100022F8C();
    id v23 = v15;
    Class isa = sub_100025B70().super.isa;
    swift_bridgeObjectRelease();
    id v25 = [v22 initWithKeyExpirationMinutes:10080 keyRotationBeforeExpirationMinutes:1440 useCases:isa networkConfig:v23];
    *(void *)(v0 + 576) = v25;

    id v26 = [self sharedManager];
    NSString v27 = sub_100025B90();
    *(void *)(v0 + 264) = 0;
    LODWORD(v23) = [v26 configureGroupWithName:v27 useCaseGroup:v25 error:v0 + 264];

    unint64_t v28 = *(void **)(v0 + 264);
    if (v23)
    {
      swift_bridgeObjectRetain_n();
      id v29 = v28;
      uint64_t v30 = sub_100025AC0();
      os_log_type_t v31 = sub_100025CC0();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = swift_slowAlloc();
        uint64_t v115 = swift_slowAlloc();
        *(_DWORD *)uint64_t v32 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v32 + 4) = sub_100019710(v18, v17, &v115);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "configured group %s", (uint8_t *)v32, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v43 = self;
      id v44 = objc_allocWithZone((Class)CMLClientConfig);
      swift_bridgeObjectRetain();
      NSString v45 = sub_100025B90();
      swift_bridgeObjectRelease();
      NSString v46 = sub_100025B90();
      swift_bridgeObjectRelease();
      id v47 = [v44 initWithUseCase:v45 sourceApplicationBundleIdentifier:v46];
      *(void *)(v0 + 584) = v47;

      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 280;
      *(void *)(v0 + 24) = sub_10001E000;
      uint64_t v48 = swift_continuation_init();
      *(void *)(v0 + 216) = _NSConcreteStackBlock;
      *(void *)(v0 + 224) = 0x40000000;
      *(void *)(v0 + 232) = sub_10001FFA0;
      *(void *)(v0 + 240) = &unk_100035478;
      *(void *)(v0 + 248) = v48;
      [v43 requestStatusForClientConfig:v47 options:10 completionHandler:v0 + 216];
      return _swift_continuation_await(v0 + 16);
    }
    id v33 = v28;
    swift_bridgeObjectRelease();
    sub_1000257F0();

    swift_willThrow();
    swift_release();
    swift_errorRetain();
    swift_errorRetain();
    int64_t v34 = sub_100025AC0();
    os_log_type_t v35 = sub_100025CC0();
    if (os_log_type_enabled(v34, v35))
    {
      unint64_t v36 = (uint8_t *)swift_slowAlloc();
      unint64_t v37 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v36 = 138412290;
      swift_errorRetain();
      uint64_t v38 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 256) = v38;
      sub_100025CF0();
      *unint64_t v37 = v38;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "configure failed %@", v36, 0xCu);
      sub_100004B80(&qword_10003CFC8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    uint64_t v49 = *(void *)(v0 + 328);

    unint64_t v50 = *(void **)(v49 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_analyticsReporter);
    uint64_t v51 = (void *)sub_1000257E0();
    unint64_t v52 = (unint64_t)[v51 code];

    if ((v52 & 0x8000000000000000) != 0) {
      return sub_100025D60();
    }
    uint64_t v53 = *(void **)(v0 + 536);
    unint64_t v54 = *(void *)(v0 + 528);
    uint64_t v55 = *(void *)(v0 + 520);
    uint64_t v57 = *(void *)(v0 + 312);
    unint64_t v56 = *(void *)(v0 + 320);
    NSString v58 = sub_100025B90();
    [v50 sendEnableWithError:v52 for:v58];

    sub_100022AEC(v57, v56);
    swift_willThrow();

    sub_100022FCC(v55, v54);
    goto LABEL_22;
  }
  int64_t v39 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_47;
  }
  int64_t v40 = (unint64_t)((1 << *(unsigned char *)(v0 + 609)) + 63) >> 6;
  uint64_t v14 = *(void *)(v0 + 504);
  if (v39 < v40)
  {
    uint64_t v41 = v14 + 64;
    unint64_t v42 = *(void *)(v14 + 64 + 8 * v39);
    ++v11;
    if (v42)
    {
LABEL_14:
      uint64_t v12 = (v42 - 1) & v42;
      unint64_t v13 = __clz(__rbit64(v42)) + (v11 << 6);
      goto LABEL_6;
    }
    int64_t v11 = v39 + 1;
    if (v39 + 1 < v40)
    {
      unint64_t v42 = *(void *)(v41 + 8 * v11);
      if (v42) {
        goto LABEL_14;
      }
      int64_t v11 = v39 + 2;
      if (v39 + 2 < v40)
      {
        unint64_t v42 = *(void *)(v41 + 8 * v11);
        if (v42) {
          goto LABEL_14;
        }
        int64_t v68 = v39 + 3;
        if (v68 < v40)
        {
          unint64_t v42 = *(void *)(v41 + 8 * v68);
          if (v42)
          {
            int64_t v11 = v68;
            goto LABEL_14;
          }
          while (1)
          {
            int64_t v11 = v68 + 1;
            if (__OFADD__(v68, 1)) {
              break;
            }
            if (v11 >= v40) {
              goto LABEL_33;
            }
            unint64_t v42 = *(void *)(v41 + 8 * v11);
            ++v68;
            if (v42) {
              goto LABEL_14;
            }
          }
LABEL_47:
          __break(1u);
        }
      }
    }
  }
LABEL_33:
  double v69 = *(void **)(v0 + 536);
  unint64_t v70 = *(void *)(v0 + 528);
  uint64_t v71 = *(void *)(v0 + 520);
  uint64_t v72 = *(void *)(v0 + 328);
  swift_release();
  uint64_t v73 = *(void **)(v72 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_analyticsReporter);
  sub_1000258A0();
  double v75 = -v74;
  NSString v76 = sub_100025B90();
  [v73 sendEnableWithTimeInterval:v76 for:v75];

  sub_100022FCC(v71, v70);
  uint64_t v77 = *(void *)(v0 + 320);
  uint64_t v78 = *(void *)(v0 + 312);
  unint64_t v79 = (void *)(*(void *)(v0 + 328)
                 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore);
  sub_1000196CC(v79, v79[3]);
  sub_100025930();
  sub_1000196CC(v79, v79[3]);
  unint64_t v80 = sub_100025990();
  swift_bridgeObjectRetain();
  uint64_t v81 = sub_1000227E4(v80, v78, v77);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  BOOL v82 = sub_100025AC0();
  if (v81)
  {
    os_log_type_t v83 = sub_100025CC0();
    BOOL v84 = os_log_type_enabled(v82, v83);
    unint64_t v85 = *(void *)(v0 + 320);
    if (v84)
    {
      uint64_t v114 = v81;
      uint64_t v86 = *(void *)(v0 + 312);
      int v113 = *(unsigned __int8 *)(v0 + 608);
      uint64_t v87 = swift_slowAlloc();
      uint64_t v115 = swift_slowAlloc();
      *(_DWORD *)uint64_t v87 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v88 = v86;
      uint64_t v81 = v114;
      *(void *)(v0 + 288) = sub_100019710(v88, v85, &v115);
      sub_100025CF0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v87 + 12) = 1024;
      *(_DWORD *)(v0 + 604) = v113;
      sub_100025CF0();
      _os_log_impl((void *)&_mh_execute_header, v82, v83, "setting %s enabled to %{BOOL}d", (uint8_t *)v87, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v94 = *(void *)(v0 + 472);
    uint64_t v111 = *(void *)(v0 + 464);
    uint64_t v112 = *(void *)(v0 + 480);
    uint64_t v109 = *(void *)(v0 + 448);
    uint64_t v110 = *(void *)(v0 + 456);
    uint64_t v95 = *(void *)(v0 + 424);
    uint64_t v96 = *(void *)(v0 + 416);
    uint64_t v97 = *(void *)(v0 + 400);
    uint64_t v107 = *(void *)(v0 + 392);
    uint64_t v108 = *(void *)(v0 + 408);
    [v81 setIsEnabled:*(unsigned __int8 *)(v0 + 608)];
    uint64_t v98 = (void *)sub_100025CD0();
    sub_100025BA0();

    uint64_t v99 = sub_100025BC0();
    swift_bridgeObjectRelease();
    notify_post((const char *)(v99 + 32));
    swift_release();
    sub_1000196CC(v79, v79[3]);
    sub_1000259A0();

    (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v108, v107);
    uint64_t v100 = *(void (**)(uint64_t, uint64_t))(v95 + 8);
    v100(v109, v96);
    v100(v110, v96);
    (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v112, v111);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v67 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_40;
  }
  os_log_type_t v89 = sub_100025CB0();
  BOOL v90 = os_log_type_enabled(v82, v89);
  unint64_t v91 = *(void *)(v0 + 320);
  if (v90)
  {
    uint64_t v92 = *(void *)(v0 + 312);
    unint64_t v93 = (uint8_t *)swift_slowAlloc();
    uint64_t v115 = swift_slowAlloc();
    *(_DWORD *)unint64_t v93 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 296) = sub_100019710(v92, v91, &v115);
    sub_100025CF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v82, v89, "Cannot find extension %s in DB", v93, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v102 = *(void *)(v0 + 312);
  uint64_t v101 = *(void **)(v0 + 320);
  uint64_t v115 = 0;
  unint64_t v116 = 0xE000000000000000;
  sub_100025D20(20);
  swift_bridgeObjectRelease();
  uint64_t v115 = 0xD000000000000012;
  unint64_t v116 = 0x800000010002B040;
  v119._uint64_t countAndFlagsBits = v102;
  v119._object = v101;
  sub_100025BE0(v119);
  uint64_t v104 = v115;
  unint64_t v103 = v116;
  sub_100022ECC();
  swift_allocError();
  *uint64_t v105 = v104;
  v105[1] = v103;
  swift_willThrow();
LABEL_22:
  uint64_t v59 = *(void *)(v0 + 472);
  uint64_t v60 = *(void *)(v0 + 480);
  uint64_t v62 = *(void *)(v0 + 456);
  uint64_t v61 = *(void *)(v0 + 464);
  uint64_t v63 = *(void *)(v0 + 448);
  uint64_t v64 = *(void *)(v0 + 424);
  uint64_t v65 = *(void *)(v0 + 416);
  (*(void (**)(void, void))(*(void *)(v0 + 400) + 8))(*(void *)(v0 + 408), *(void *)(v0 + 392));
  uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
  v66(v63, v65);
  v66(v62, v65);
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v60, v61);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v67 = *(uint64_t (**)(void))(v0 + 8);
LABEL_40:
  return v67();
}

uint64_t sub_10001FFA0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100004B80(&qword_10003CF80);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    int64_t v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_10002344C((uint64_t)&v11, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1000201E8(char a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v7 = sub_100025BA0();
  uint64_t v9 = v8;
  v4[4] = v8;
  a4;
  unint64_t v10 = (void *)swift_task_alloc();
  v4[5] = v10;
  *unint64_t v10 = v4;
  v10[1] = sub_1000202CC;
  return LiveLookupStoreProxy.setEnabled(_:forExtensionWith:)(a1, v7, v9);
}

uint64_t sub_1000202CC()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_1000257E0();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

Swift::Void __swiftcall LiveLookupStoreProxy.cleanup()()
{
  uint64_t v39 = sub_100025AE0();
  uint64_t v1 = *(void *)(v39 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore + 24);
  id v44 = (void *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore);
  sub_1000196CC((void *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore), v4);
  uint64_t v5 = sub_100025970();
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = (unint64_t *)(v5 + 40);
    do
    {
      uint64_t v8 = *(v7 - 1);
      unint64_t v9 = *v7;
      swift_bridgeObjectRetain();
      sub_100022AEC(v8, v9);
      swift_bridgeObjectRelease();
      v7 += 2;
      --v6;
    }
    while (v6);
  }
  swift_bridgeObjectRelease();
  unint64_t v10 = v44;
  sub_1000196CC(v44, v44[3]);
  unint64_t v11 = sub_100025990();
  unint64_t v12 = v11;
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_100025D70();
    swift_bridgeObjectRelease();
    uint64_t v14 = v39;
    if (v13) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v14 = v39;
    if (v13)
    {
LABEL_6:
      id v50 = self;
      if (v13 < 1) {
        __break(1u);
      }
      uint64_t v16 = 0;
      unint64_t v49 = v12 & 0xC000000000000001;
      NSString v45 = (void (**)(char *, uint64_t))(v1 + 8);
      NSString v46 = (void (**)(char *, uint64_t, uint64_t))(v1 + 16);
      *(void *)&long long v15 = 136315394;
      long long v41 = v15;
      int64_t v40 = (char *)&type metadata for Any + 8;
      unint64_t v42 = v3;
      uint64_t v47 = v13;
      unint64_t v48 = v12;
      do
      {
        if (v49) {
          id v18 = (id)sub_100025D40();
        }
        else {
          id v18 = *(id *)(v12 + 8 * v16 + 32);
        }
        id v19 = v18;
        NSString v20 = objc_msgSend(v18, "identifier", v39, v40);
        if (v20)
        {
          sub_100025BA0();

          NSString v20 = sub_100025B90();
          swift_bridgeObjectRelease();
        }
        v51[0] = 0;
        id v21 = [v50 extensionWithIdentifier:v20 error:v51];

        if (v21)
        {
          id v17 = v51[0];
        }
        else
        {
          id v22 = v51[0];
          sub_1000257F0();

          swift_willThrow();
          if (qword_10003CDF0 != -1) {
            swift_once();
          }
          uint64_t v23 = sub_100014FA4(v14, (uint64_t)qword_10003D190);
          (*v46)(v3, v23, v14);
          id v24 = v19;
          swift_errorRetain();
          id v25 = v24;
          swift_errorRetain();
          id v26 = sub_100025AC0();
          int v27 = sub_100025CC0();
          if (os_log_type_enabled(v26, (os_log_type_t)v27))
          {
            uint64_t v28 = swift_slowAlloc();
            id v29 = (void *)swift_slowAlloc();
            uint64_t v52 = swift_slowAlloc();
            *(_DWORD *)uint64_t v28 = v41;
            id v30 = [v25 identifier];
            if (v30)
            {
              os_log_type_t v31 = v30;
              uint64_t v32 = (void *)sub_100025BA0();
              int v43 = v27;
              int64_t v34 = v33;

              v51[0] = v32;
              v51[1] = v34;
              uint64_t v14 = v39;
              LOBYTE(v27) = v43;
              uint64_t v35 = sub_100025BB0();
              unint64_t v37 = v36;
            }
            else
            {
              unint64_t v37 = 0xE300000000000000;
              uint64_t v35 = 7104878;
            }
            *(void *)(v28 + 4) = sub_100019710(v35, v37, &v52);

            swift_bridgeObjectRelease();
            *(_WORD *)(v28 + 12) = 2112;
            swift_errorRetain();
            uint64_t v38 = _swift_stdlib_bridgeErrorToNSError();
            *(void *)(v28 + 14) = v38;
            *id v29 = v38;
            swift_errorRelease();
            swift_errorRelease();
            _os_log_impl((void *)&_mh_execute_header, v26, (os_log_type_t)v27, "extension in DB, but not installed on the system: %s error=%@", (uint8_t *)v28, 0x16u);
            sub_100004B80(&qword_10003CFC8);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            uint64_t v3 = v42;
            (*v45)(v42, v14);
            unint64_t v10 = v44;
          }
          else
          {

            swift_errorRelease();
            swift_errorRelease();

            (*v45)(v3, v14);
          }
          [v25 setIsInstalled:0];
          sub_1000196CC(v10, v10[3]);
          sub_1000259A0();

          swift_errorRelease();
          uint64_t v13 = v47;
          unint64_t v12 = v48;
        }
        ++v16;
      }
      while (v13 != v16);
      goto LABEL_29;
    }
  }

LABEL_29:
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall LiveLookupStoreProxy.reset(forExtensionWith:)(Swift::String forExtensionWith)
{
  sub_1000196CC((void *)(v1 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore), *(void *)(v1 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore + 24));
  sub_100025930();
}

uint64_t LiveLookupStoreProxy.updateBlockingInfo(for:with:shouldBlock:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_10003CDF0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_100025AE0();
  sub_100014FA4(v6, (uint64_t)qword_10003D190);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_100025AC0();
  os_log_type_t v8 = sub_100025CC0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    swift_bridgeObjectRetain();
    sub_100019710(a1, a2, &v11);
    sub_100025CF0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 12) = 1024;
    sub_100025CF0();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "updating blocking info handle=%s shouldBlock=%{BOOL}d", (uint8_t *)v9, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1000196CC((void *)(v3 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore), *(void *)(v3 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore + 24));
  return sub_100025980();
}

uint64_t LiveLookupStoreProxy.updateIdentityInfo(for:with:name:iconURL:type:ttlMinutes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v21 = a8;
  v20[3] = a5;
  v20[4] = a6;
  v20[1] = a3;
  v20[2] = a4;
  uint64_t v10 = sub_100025A00();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v20 - v15;
  sub_1000196CC((void *)(v8 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore), *(void *)(v8 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore + 24));
  id v17 = (unsigned int *)&enum case for IdentityType.business(_:);
  id v18 = (unsigned int *)&enum case for IdentityType.person(_:);
  if (a7 != 1) {
    id v18 = (unsigned int *)&enum case for IdentityType.unknown(_:);
  }
  if (a7 != 2) {
    id v17 = v18;
  }
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, *v17, v10);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v14, v10);
  sub_100025920();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

uint64_t CXCallDirectoryIdentificationEntryType.identityType.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1 == 2)
  {
    uint64_t v3 = (unsigned int *)&enum case for IdentityType.business(_:);
  }
  else if (a1 == 1)
  {
    uint64_t v3 = (unsigned int *)&enum case for IdentityType.person(_:);
  }
  else
  {
    uint64_t v3 = (unsigned int *)&enum case for IdentityType.unknown(_:);
    if (!a1)
    {
      uint64_t v4 = enum case for IdentityType.unknown(_:);
      goto LABEL_8;
    }
  }
  uint64_t v4 = *v3;
LABEL_8:
  uint64_t v5 = sub_100025A00();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);

  return v6(a2, v4, v5);
}

uint64_t LiveLookupStoreProxy.name(for:)(void *a1)
{
  id v1 = [a1 name];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100025BA0();

  return v3;
}

uint64_t LiveLookupStoreProxy.iconURL(for:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = [a1 iconURL];
  if (v3)
  {
    uint64_t v4 = v3;
    sub_100025BA0();

    sub_100025840();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = sub_100025850();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
    return v7(a2, 1, 1, v6);
  }
}

uint64_t LiveLookupStoreProxy.fetchIdentityInfo(for:from:)()
{
  sub_1000196CC((void *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore), *(void *)(v0 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore + 24));
  return sub_1000259B0();
}

uint64_t LiveLookupStoreProxy.extensionUpdate(for:isAppStorVendable:)()
{
  id v0 = objc_allocWithZone((Class)sub_100025A30());
  swift_bridgeObjectRetain();
  return sub_100025A20();
}

Swift::Void __swiftcall LiveLookupStoreProxy.updateExtensions(with:)(Swift::OpaquePointer with)
{
  uint64_t v2 = v1;
  sub_1000196CC((void *)(v2 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore), *(void *)(v2 + OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore + 24));
  unint64_t v3 = sub_100025950();
  unint64_t v5 = v3;
  unint64_t v41 = v6;
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100025D70();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  p_name = &stru_10003AFF8.name;
  uint64_t v42 = v1;
  if (v7)
  {
    if (v7 < 1)
    {
      __break(1u);
      goto LABEL_40;
    }
    uint64_t v9 = 0;
    uint64_t v10 = OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_analyticsReporter;
    unint64_t v11 = v5 & 0xC000000000000001;
    uint64_t v12 = qword_10003D190;
    *(void *)&long long v4 = 138412290;
    long long v39 = v4;
    unint64_t v40 = v5 & 0xC000000000000001;
    do
    {
      if (v11) {
        uint64_t v14 = sub_100025D40();
      }
      else {
        uint64_t v14 = *(id *)(v5 + 8 * v9 + 32);
      }
      uint64_t v15 = v14;
      uint64_t v16 = objc_msgSend(v14, p_name[130], v39);
      if (v16)
      {
        uint64_t v13 = v16;
        [*(id *)(v2 + v10) sendInstallationFor:v16];
      }
      else
      {
        if (qword_10003CDF0 != -1) {
          swift_once();
        }
        uint64_t v17 = sub_100025AE0();
        sub_100014FA4(v17, (uint64_t)v12);
        uint64_t v15 = v15;
        uint64_t v13 = sub_100025AC0();
        os_log_type_t v18 = sub_100025CC0();
        if (os_log_type_enabled(v13, v18))
        {
          uint64_t v19 = v7;
          unint64_t v20 = v5;
          uint64_t v21 = v10;
          id v22 = v12;
          uint64_t v23 = swift_slowAlloc();
          id v24 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v23 = v39;
          *(void *)(v23 + 4) = v15;
          *id v24 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, v18, "installed extension does not have identifier: %@", (uint8_t *)v23, 0xCu);
          sub_100004B80(&qword_10003CFC8);
          swift_arrayDestroy();
          uint64_t v2 = v42;
          swift_slowDealloc();
          uint64_t v12 = v22;
          uint64_t v10 = v21;
          unint64_t v5 = v20;
          uint64_t v7 = v19;
          unint64_t v11 = v40;
          swift_slowDealloc();
        }
        else
        {

          uint64_t v13 = v15;
        }
        p_name = (char **)(&stru_10003AFF8 + 8);
      }
      ++v9;
    }
    while (v7 != v9);
  }
  swift_bridgeObjectRelease();
  unint64_t v25 = v41;
  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_100025D70();
    swift_bridgeObjectRelease();
    if (v26)
    {
LABEL_20:
      if (v26 >= 1)
      {
        uint64_t v27 = 0;
        uint64_t v28 = OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_analyticsReporter;
        do
        {
          if ((v41 & 0xC000000000000001) != 0) {
            id v30 = sub_100025D40();
          }
          else {
            id v30 = *(id *)(v25 + 8 * v27 + 32);
          }
          os_log_type_t v31 = v30;
          uint64_t v32 = objc_msgSend(v30, p_name[130]);
          if (v32)
          {
            id v29 = v32;
            [*(id *)(v2 + v28) sendUninstallationFor:v32];
          }
          else
          {
            if (qword_10003CDF0 != -1) {
              swift_once();
            }
            uint64_t v33 = sub_100025AE0();
            sub_100014FA4(v33, (uint64_t)qword_10003D190);
            os_log_type_t v31 = v31;
            id v29 = sub_100025AC0();
            os_log_type_t v34 = sub_100025CC0();
            if (os_log_type_enabled(v29, v34))
            {
              uint64_t v35 = swift_slowAlloc();
              unint64_t v36 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v35 = 138412290;
              *(void *)(v35 + 4) = v31;
              void *v36 = v31;
              _os_log_impl((void *)&_mh_execute_header, v29, v34, "removed extension does not have identifier: %@", (uint8_t *)v35, 0xCu);
              sub_100004B80(&qword_10003CFC8);
              swift_arrayDestroy();
              p_name = (char **)(&stru_10003AFF8 + 8);
              swift_slowDealloc();
              unint64_t v25 = v41;
              swift_slowDealloc();
            }
            else
            {

              id v29 = v31;
            }
            uint64_t v2 = v42;
          }
          ++v27;
        }
        while (v26 != v27);
        goto LABEL_36;
      }
LABEL_40:
      __break(1u);
      return;
    }
  }
  else
  {
    uint64_t v26 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v26) {
      goto LABEL_20;
    }
  }
LABEL_36:
  swift_bridgeObjectRelease();
  unint64_t v37 = (void *)sub_100025CD0();
  sub_100025BA0();

  uint64_t v38 = sub_100025BC0();
  swift_bridgeObjectRelease();
  notify_post((const char *)(v38 + 32));

  swift_release();
}

id sub_100021E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t v11 = sub_100025850();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  uint64_t v15 = 0;
  if (v13(a2, 1, v11) != 1)
  {
    sub_100025810(v14);
    uint64_t v15 = v16;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a2, v11);
  }
  if (v13(a3, 1, v11) == 1)
  {
    os_log_type_t v18 = 0;
  }
  else
  {
    sub_100025810(v17);
    os_log_type_t v18 = v19;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a3, v11);
  }
  if (a5 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_100025870().super.isa;
    sub_100022FCC(a4, a5);
  }
  id v21 = [v24 initWithType:a1 endpoint:v15 issuer:v18 authenticationToken:isa privacyProxyFailOpen:a6 & 1];

  return v21;
}

uint64_t sub_10002200C(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *long long v4 = v3;
  v4[1] = sub_10001A984;
  return v6();
}

uint64_t sub_1000220D8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *unint64_t v5 = v4;
  v5[1] = sub_10001A984;
  return v7();
}

uint64_t sub_1000221A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100025CA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100025C90();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10001A738(a1, &qword_10003CF28);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100025C60();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t sub_100022350(uint64_t a1, uint64_t a2)
{
  sub_100025E40();
  sub_100025BD0();
  Swift::Int v4 = sub_100025E50();

  return sub_1000223C8(a1, a2, v4);
}

unint64_t sub_1000223C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100025DD0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100025DD0() & 1) == 0);
    }
  }
  return v6;
}

id sub_1000224AC(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v13[3] = sub_1000259F0();
  v13[4] = &protocol witness table for LiveLookupStore;
  v13[0] = a2;
  *(void *)&a3[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_maxShards] = 10000000;
  *(void *)&a3[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_keyExpirationMinutes] = 10080;
  *(void *)&a3[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_keyRotationBeforeExpirationMinutes] = 1440;
  uint64_t v7 = (uint64_t *)&a3[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_imagePath];
  uint64_t v8 = a3;
  uint64_t *v7 = sub_1000259D0();
  v7[1] = v9;
  *(void *)&v8[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_analyticsReporter] = a1;
  sub_1000234B4((uint64_t)v13, (uint64_t)&v8[OBJC_IVAR____TtC31com_apple_CallKit_CallDirectory20LiveLookupStoreProxy_liveLookupStore]);
  swift_unknownObjectRetain();

  v12.receiver = v8;
  v12.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v12, "init");
  sub_10001A210((uint64_t)v13);
  return v10;
}

void *_s018com_apple_CallKit_C9Directory20LiveLookupStoreProxyC19extensionIdentifier3forSSSg08IdentityG012BlockingInfoCSg_tF_0(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = a1;
  id v2 = [v1 dbExtension];
  uint64_t v3 = v2;
  if (!v2)
  {

    return v3;
  }
  id v4 = [v2 identifier];

  if (!v4)
  {

    return 0;
  }
  uint64_t v3 = (void *)sub_100025BA0();

  return v3;
}

void *sub_100022660(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_100025D70())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0 ? (id)sub_100025D40() : *(id *)(a1 + 8 * v4);
      unint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = [v5 dbExtension];
      if (v8)
      {
        uint64_t v9 = v8;
        sub_100025900();
        id v10 = a2;
        id v11 = v9;
        LOBYTE(v9) = sub_100025CE0();

        if (v9)
        {
          swift_bridgeObjectRelease();
          return v6;
        }
      }

      ++v4;
      if (v7 == v3) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_15:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_1000227E4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_100025D70())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)sub_100025D40() : *(id *)(a1 + 8 * v6);
      id v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = [v7 identifier];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = sub_100025BA0();
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        char v16 = sub_100025DD0();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_18;
        }
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

void *_s018com_apple_CallKit_C9Directory20LiveLookupStoreProxyC38firstEnabledBlockedExtensionIdentifier3forSSSgSay08IdentityG012BlockingInfoCG_tF_0(unint64_t a1)
{
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_18:
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_100025D70();
  if (!v2) {
    goto LABEL_19;
  }
LABEL_3:
  for (uint64_t i = 4; ; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v4 = (id)sub_100025D40();
    }
    else {
      id v4 = *(id *)(a1 + 8 * i);
    }
    uint64_t v5 = v4;
    uint64_t v6 = i - 3;
    if (__OFADD__(i - 4, 1))
    {
      __break(1u);
      goto LABEL_18;
    }
    if ([v4 shouldBlock]) {
      break;
    }

    if (v6 == v2)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  id v8 = [v5 dbExtension];
  id v7 = v8;
  if (v8)
  {
    id v9 = [v8 identifier];

    if (!v9)
    {

      return 0;
    }
    id v7 = (void *)sub_100025BA0();
  }
  else
  {
  }
  return v7;
}

void sub_100022AEC(uint64_t a1, unint64_t a2)
{
  id v4 = [self sharedManager];
  NSString v5 = sub_100025B90();
  id v19 = 0;
  unsigned int v6 = [v4 configureGroupWithName:v5 useCaseGroup:0 error:&v19];

  if (v6)
  {
    uint64_t v7 = qword_10003CDF0;
    id v8 = v19;
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_100025AE0();
    sub_100014FA4(v9, (uint64_t)qword_10003D190);
    swift_bridgeObjectRetain_n();
    id v10 = sub_100025AC0();
    os_log_type_t v11 = sub_100025CC0();
    if (!os_log_type_enabled(v10, v11))
    {

      swift_bridgeObjectRelease_n();
      return;
    }
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    id v19 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    swift_bridgeObjectRetain();
    sub_100019710(a1, a2, (uint64_t *)&v19);
    sub_100025CF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "set group %s to nil", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    id v13 = v19;
    sub_1000257F0();

    swift_willThrow();
    if (qword_10003CDF0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_100025AE0();
    sub_100014FA4(v14, (uint64_t)qword_10003D190);
    swift_errorRetain();
    swift_errorRetain();
    id v10 = sub_100025AC0();
    os_log_type_t v15 = sub_100025CB0();
    if (os_log_type_enabled(v10, v15))
    {
      char v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = (void *)swift_slowAlloc();
      *(_DWORD *)char v16 = 138412290;
      swift_errorRetain();
      os_log_type_t v18 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v19 = v18;
      sub_100025CF0();
      *uint64_t v17 = v18;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v15, "unregister failed %@", v16, 0xCu);
      sub_100004B80(&qword_10003CFC8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
}

unint64_t sub_100022ECC()
{
  unint64_t result = qword_10003CFE8;
  if (!qword_10003CFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003CFE8);
  }
  return result;
}

uint64_t sub_100022F20(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100022F34(a1, a2);
  }
  return a1;
}

uint64_t sub_100022F34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

unint64_t sub_100022F8C()
{
  unint64_t result = qword_10003CFF0;
  if (!qword_10003CFF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003CFF0);
  }
  return result;
}

uint64_t sub_100022FCC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10001A1B8(a1, a2);
  }
  return a1;
}

id _s018com_apple_CallKit_C9Directory20LiveLookupStoreProxyC11shouldBlock4withSbSay08IdentityG012BlockingInfoCG_tF_0(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_100025D70())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)sub_100025D40() : *(id *)(a1 + 8 * v3);
      NSString v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      id v7 = [v4 shouldBlock];

      if ((v7 & 1) == 0)
      {
        ++v3;
        if (v6 != v2) {
          continue;
        }
      }
      goto LABEL_14;
    }
    __break(1u);
LABEL_12:
    swift_bridgeObjectRetain();
  }
  id v7 = 0;
LABEL_14:
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t type metadata accessor for LiveLookupStoreProxy()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for LiveLookupError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LiveLookupError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for LiveLookupError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for LiveLookupError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for LiveLookupError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveLookupError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveLookupError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_100023230()
{
  return 0;
}

ValueMetadata *type metadata accessor for LiveLookupError()
{
  return &type metadata for LiveLookupError;
}

uint64_t sub_100023248()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100023290()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  id v4 = *(void **)(v0 + 32);
  NSString v5 = *(void **)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_100019EF0;
  id v7 = (uint64_t (*)(char, int, void *, void *))((char *)&dword_10003D038 + dword_10003D038);
  return v7(v2, v3, v4, v5);
}

uint64_t sub_10002335C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100023394(uint64_t a1)
{
  id v4 = *(int **)(v1 + 16);
  NSString v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *NSString v5 = v2;
  v5[1] = sub_100019EF0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10003D058 + dword_10003D058);
  return v6(a1, v4);
}

uint64_t sub_10002344C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B80(&qword_10003D068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000234B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_10002351C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Request with requestIdentifier %@ was interrupted", (uint8_t *)&v3, 0xCu);
}

void sub_100023598(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Request with requestIdentifier %@ failed to begin. Error: %@", (uint8_t *)&v5, 0x16u);
}

void sub_100023628()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error retrieving installedExtensions: %@", v2, v3, v4, v5, v6);
}

void sub_100023690()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error retrieving stored extension identifiers: %@", v2, v3, v4, v5, v6);
}

void sub_1000236F8()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error retrieving enabled stored extension identifiers: %@", v2, v3, v4, v5, v6);
}

void sub_100023760()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error retrieving disabled stored extension identifiers: %@", v2, v3, v4, v5, v6);
}

void sub_1000237C8()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error retrieving unavailable stored extension identifiers: %@", v2, v3, v4, v5, v6);
}

void sub_100023830()
{
  sub_10000A0BC();
  sub_10000A0C8((void *)&_mh_execute_header, v0, v1, "unavailableStoredExtensionIdentifiers: %@", v2, v3, v4, v5, v6);
}

void sub_100023898()
{
  sub_10000A0BC();
  sub_10000A0C8((void *)&_mh_execute_header, v0, v1, "disabledStoredExtensionIdentifiers: %@", v2, v3, v4, v5, v6);
}

void sub_100023900()
{
  sub_10000A0BC();
  sub_10000A0C8((void *)&_mh_execute_header, v0, v1, "enabledStoredExtensionIdentifiers: %@", v2, v3, v4, v5, v6);
}

void sub_100023968()
{
  sub_10000A0BC();
  sub_10000A0C8((void *)&_mh_execute_header, v0, v1, "storedExtensionIdentifiers: %@", v2, v3, v4, v5, v6);
}

void sub_1000239D0()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "installedLiveLookupExtensionIdentifiers: %@", v2, v3, v4, v5, v6);
}

void sub_100023A38(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "not unlocked, not updated liveLookup extensions", v1, 2u);
}

void sub_100023A7C()
{
  sub_10000A0BC();
  sub_10000A0C8((void *)&_mh_execute_header, v0, v1, "installedExtensions: %@", v2, v3, v4, v5, v6);
}

void sub_100023AE4()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error rolling back transaction: %@", v2, v3, v4, v5, v6);
}

void sub_100023B4C()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "extensions: %@", v2, v3, v4, v5, v6);
}

void sub_100023BB4()
{
  sub_10000BF38();
  sub_10000BF64(v0);
  sub_10000BF7C();
  sub_10000BF00();
  sub_10000BF18((void *)&_mh_execute_header, v1, v2, "Requested to set extension enabled status to %d but current state of extension is %ld", v3, v4, v5, v6, v7);
}

void sub_100023C34(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error loading extension data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100023CAC()
{
  sub_10000BF38();
  sub_10000BF64(v0);
  sub_10000BF7C();
  sub_10000BF00();
  sub_10000BF18((void *)&_mh_execute_header, v1, v2, "Requested to set extension enabled status to %d but current state of extension is already %ld", v3, v4, v5, v6, v7);
}

void sub_100023D2C()
{
  sub_10000BF38();
  [v0 primaryKey];
  sub_10000BF44();
  sub_10000BF94((void *)&_mh_execute_header, v1, v2, "Error setting state to %ld for extension with ID %lld: %@", v3, v4, v5, v6, 2u);
}

void sub_100023DAC()
{
  sub_10000BF38();
  [v0 primaryKey];
  sub_10000BF44();
  sub_10000BF94((void *)&_mh_execute_header, v1, v2, "Error setting state to %ld for extension with identifier %lld: %@", v3, v4, v5, v6, 2u);
}

void sub_100023E2C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: attempted to load extension data but no loadExtensionDataOperation was specified", v1, 2u);
}

void sub_100023E70()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Identifier of main bundle is not recognized ('%@'), not accepting any incoming XPC connections", v2, v3, v4, v5, v6);
}

void sub_100023ED8()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error getting store: %@", v2, v3, v4, v5, v6);
}

void sub_100023F40()
{
  sub_1000101E0();
  sub_100010238((void *)&_mh_execute_header, v0, v1, "Error loading data from extension %@ into store %@: %@");
}

void sub_100023FAC()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Unable to initialize CXCallDirectoryStore for reading: %@", v2, v3, v4, v5, v6);
}

void sub_100024014()
{
  sub_1000101E0();
  sub_100010238((void *)&_mh_execute_header, v0, v1, "Error retrieving enabled status for extension %@ with store %@: %@");
}

void sub_100024080(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = 67109890;
  v6[1] = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error setting enabled to %d for extension %@ with store %@: %@", (uint8_t *)v6, 0x26u);
}

void sub_100024120()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error getting first identification entries: %@", v2, v3, v4, v5, v6);
}

void sub_100024188()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "blastdoor successful, wrote image: %@", v2, v3, v4, v5, v6);
}

void sub_1000241F0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 56);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100010218((void *)&_mh_execute_header, a2, a3, "Error blastdooring image for handle: %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10002426C()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Unable to initialize CXCallDirectoryStore for reading and writing: %@", v2, v3, v4, v5, v6);
}

void sub_1000242D4()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error synchronizing extensions: %@", v2, v3, v4, v5, v6);
}

void sub_10002433C()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error compacting store: %@", v2, v3, v4, v5, v6);
}

void sub_1000243A4()
{
  sub_10000A0BC();
  sub_100010218((void *)&_mh_execute_header, v0, v1, "Error while opening settings for callDirectoryURL %@ : error: %@");
}

void sub_100024418()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error getting extensions: %@", v2, v3, v4, v5, v6);
}

void sub_100024480()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error prioritizing extension identifiers: %@", v2, v3, v4, v5, v6);
}

void sub_1000244E8()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error preparing store: %@", v2, v3, v4, v5, v6);
}

void sub_100024550()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100010200();
  sub_10000BF18((void *)&_mh_execute_header, v1, v2, "failed to initialize temporary directory (%d): %s", v3, v4, v5, v6, v7);
}

void sub_1000245D8()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100010200();
  sub_10000BF18((void *)&_mh_execute_header, v1, v2, "failed to resolve temporary directory (%d): %s", v3, v4, v5, v6, v7);
}

void sub_100024660()
{
  sub_1000125A4();
  id v4 = [v3 extensionID];
  uint64_t v5 = [v2 store];
  int v6 = 134218498;
  id v7 = v4;
  __int16 v8 = 2112;
  __int16 v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error removing entries for extensionID %lld from store %@: %@", (uint8_t *)&v6, 0x20u);
}

void sub_100024720(uint64_t a1)
{
  uint64_t v1 = [(id)sub_100012598(a1) extensionIdentifier];
  sub_1000124E8((void *)&_mh_execute_header, v2, v3, "No extension found with identifier %@: %@", v4, v5, v6, v7, 2u);
}

void sub_1000247B4()
{
  sub_10000BF38();
  uint64_t v1 = [(id)sub_100012598(v0) extensionIdentifier];
  sub_100012508();
  sub_1000124E8((void *)&_mh_execute_header, v2, v3, "Error retrieving information about extension with identifier %@: %@", v4, v5, v6, v7, v8);
}

void sub_100024840()
{
  sub_1000125A4();
  uint64_t v2 = [*v1 extensionIdentifier];
  uint64_t v3 = [*v0 store];
  sub_100012558();
  sub_1000125B4((void *)&_mh_execute_header, v4, v5, "Error setting state to %ld for extension with identifier %@ into store %@: %@", v6, v7, v8, v9, 2u);
}

void sub_1000248EC(id *a1, NSObject *a2)
{
  uint64_t v4 = [(id)sub_100012598((uint64_t)a1) extensionIdentifier];
  unsigned int v5 = [*a1 allowLoadingDisabledExtensions];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 1024;
  unsigned int v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Requested to load data for extension with identifier %@ but it is currently Disabled (without data) and allowLoadingDisabledExtensions is %d", (uint8_t *)&v6, 0x12u);
}

void sub_1000249A4(uint64_t a1)
{
  uint64_t v1 = [(id)sub_100012598(a1) extensionIdentifier];
  sub_10000A0BC();
  sub_100012520((void *)&_mh_execute_header, v2, v3, "Requested to load data for extension with identifier %@ but it is currently Disabled (with data)", v4, v5, v6, v7, v8);
}

void sub_100024A28(uint64_t a1)
{
  uint64_t v1 = [(id)sub_100012598(a1) extensionIdentifier];
  sub_10000A0BC();
  sub_100012520((void *)&_mh_execute_header, v2, v3, "Requested to load data for extension with identifier %@ but it is currently already loading", v4, v5, v6, v7, v8);
}

void sub_100024AAC(uint64_t a1)
{
  uint64_t v1 = [(id)sub_100012598(a1) extensionIdentifier];
  sub_10000A0BC();
  sub_100012520((void *)&_mh_execute_header, v2, v3, "Requested to load data for extension with identifier %@ but it is unavailable", v4, v5, v6, v7, v8);
}

void sub_100024B30()
{
  sub_1000125A4();
  uint64_t v2 = [*v1 extensionIdentifier];
  uint64_t v3 = [*v0 store];
  sub_100012558();
  sub_1000125B4((void *)&_mh_execute_header, v4, v5, "Error setting state to %ld for extension with identifier %@ into store %@: %@", v6, v7, v8, v9, 2u);
}

void sub_100024BDC(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error performing initial deletion during request completion: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100024C60()
{
  sub_10000BF38();
  uint64_t v1 = [*(id *)(v0 + 32) extensionIdentifier];
  sub_10000A0BC();
  sub_1000124E8((void *)&_mh_execute_header, v2, v3, "Error requesting data for extension with identifier %@: %@", v4, v5, v6, v7, v8);
}

void sub_100024D08()
{
  sub_10000BF38();
  [v0 extensionID];
  sub_100012508();
  sub_1000124E8((void *)&_mh_execute_header, v1, v2, "Error adding blocking entries for extensionID: %ld: %@", v3, v4, v5, v6, v7);
}

void sub_100024D80()
{
  sub_10000BF38();
  [v0 lastBlockingPhoneNumber];
  sub_100012540();
  sub_1000124E8((void *)&_mh_execute_header, v1, v2, "Cannot add blocking phone number %llu since it is equal to the last phone number %llu, returning error", v3, v4, v5, v6, v7);
}

void sub_100024DF8()
{
  sub_10000BF38();
  [v0 lastBlockingPhoneNumber];
  sub_100012540();
  sub_1000124E8((void *)&_mh_execute_header, v1, v2, "Cannot add blocking phone number %llu since it is less than the last phone number %llu, returning error", v3, v4, v5, v6, v7);
}

void sub_100024E70(void *a1)
{
  [a1 maximumAllowedEntries];
  sub_10000A0BC();
  sub_100012520((void *)&_mh_execute_header, v1, v2, "Cannot add entries since it would exceed maximum allowed entries (%ld), returning error", v3, v4, v5, v6, v7);
}

void sub_100024EE8()
{
  sub_10000BF38();
  [v0 extensionID];
  sub_100012508();
  sub_1000124E8((void *)&_mh_execute_header, v1, v2, "Error removing blocking entries for extensionID: %ld: %@", v3, v4, v5, v6, v7);
}

void sub_100024F60()
{
  sub_1000125D4();
  sub_10001257C((void *)&_mh_execute_header, v0, v1, "Cannot remove entries since incremental loading has not been confirmed, returning error", v2, v3, v4, v5, v6);
}

void sub_100024F94()
{
  sub_10000BF38();
  [v0 extensionID];
  sub_100012508();
  sub_1000124E8((void *)&_mh_execute_header, v1, v2, "Error removing all blocking entries for extensionID: %ld: %@", v3, v4, v5, v6, v7);
}

void sub_10002500C()
{
  sub_10000BF38();
  [v0 extensionID];
  sub_100012508();
  sub_1000124E8((void *)&_mh_execute_header, v1, v2, "Error adding identification entries for extensionID: %ld: %@", v3, v4, v5, v6, v7);
}

void sub_100025084()
{
  sub_10000BF38();
  [v0 lastIdentificationPhoneNumber];
  sub_100012540();
  sub_1000124E8((void *)&_mh_execute_header, v1, v2, "Cannot add identification phone number %llu since it is equal to the last phone number %llu, returning error", v3, v4, v5, v6, v7);
}

void sub_1000250FC()
{
  sub_10000BF38();
  [v0 lastIdentificationPhoneNumber];
  sub_100012540();
  sub_1000124E8((void *)&_mh_execute_header, v1, v2, "Cannot add identification phone number %llu since it is less than the last phone number %llu, returning error", v3, v4, v5, v6, v7);
}

void sub_100025174()
{
  sub_10000BF38();
  [v0 extensionID];
  sub_100012508();
  sub_1000124E8((void *)&_mh_execute_header, v1, v2, "Error removing identification entries for extensionID: %ld: %@", v3, v4, v5, v6, v7);
}

void sub_1000251EC()
{
  sub_10000BF38();
  [v0 extensionID];
  sub_100012508();
  sub_1000124E8((void *)&_mh_execute_header, v1, v2, "Error removing all identification entries for extensionID: %ld: %@", v3, v4, v5, v6, v7);
}

void sub_100025264(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000252D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002533C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000253A8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error getting extensions: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100025420(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error getting installed extensions: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100025498()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error creating new store: %@", v2, v3, v4, v5, v6);
}

void sub_100025500()
{
  sub_100014C2C();
  sub_100010218((void *)&_mh_execute_header, v0, v1, "Error removing store DB at URL '%@': %@");
}

void sub_100025568(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Store is corrupt, resetting...", v1, 2u);
}

void sub_1000255AC()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error performing migrations: %@", v2, v3, v4, v5, v6);
}

void sub_100025614()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error checking for extensions stuck loading: %@", v2, v3, v4, v5, v6);
}

void sub_10002567C()
{
  sub_10000A0BC();
  sub_10000A0A0((void *)&_mh_execute_header, v0, v1, "Error disabling all extensions: %@", v2, v3, v4, v5, v6);
}

void sub_1000256E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025758()
{
  sub_100014C2C();
  sub_100010218((void *)&_mh_execute_header, v0, v1, "Error resetting state of store extension %@ to Enabled: %@");
}

uint64_t sub_1000257C0()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t sub_1000257D0()
{
  return type metadata accessor for __DataStorage();
}

uint64_t sub_1000257E0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000257F0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100025800()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

void sub_100025810(NSURL *retstr@<X8>)
{
}

uint64_t sub_100025820()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100025830()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100025840()
{
  return URL.init(string:)();
}

uint64_t sub_100025850()
{
  return type metadata accessor for URL();
}

uint64_t sub_100025860()
{
  return type metadata accessor for Data.RangeReference();
}

NSData sub_100025870()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100025880()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100025890()
{
  return Data.write(to:options:)();
}

uint64_t sub_1000258A0()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_1000258B0()
{
  return Date.init()();
}

uint64_t sub_1000258C0()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000258D0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_1000258E0()
{
  return UUID.init()();
}

uint64_t sub_1000258F0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100025900()
{
  return type metadata accessor for LiveLookupDBExtension();
}

uint64_t sub_100025910()
{
  return dispatch thunk of LiveLookupStoreProtocol.isAppStoreVendable(forExtensionWith:)();
}

uint64_t sub_100025920()
{
  return dispatch thunk of LiveLookupStoreProtocol.updateIdentityInfo(for:with:name:iconURL:type:ttlMinutes:)();
}

uint64_t sub_100025930()
{
  return dispatch thunk of LiveLookupStoreProtocol.resetExtension(with:)();
}

uint64_t sub_100025940()
{
  return dispatch thunk of LiveLookupStoreProtocol.activeExtensions()();
}

uint64_t sub_100025950()
{
  return dispatch thunk of LiveLookupStoreProtocol.updateExtensions(with:)();
}

uint64_t sub_100025960()
{
  return dispatch thunk of LiveLookupStoreProtocol.fetchBlockingInfo(for:)();
}

uint64_t sub_100025970()
{
  return dispatch thunk of LiveLookupStoreProtocol.removeStaleRecords()();
}

uint64_t sub_100025980()
{
  return dispatch thunk of LiveLookupStoreProtocol.updateBlockingInfo(for:with:shouldBlock:)();
}

uint64_t sub_100025990()
{
  return dispatch thunk of LiveLookupStoreProtocol.installedExtensions()();
}

uint64_t sub_1000259A0()
{
  return dispatch thunk of LiveLookupStoreProtocol.save()();
}

uint64_t sub_1000259B0()
{
  return LiveLookupStoreProtocol.fetchIdentityInfo(for:from:)();
}

uint64_t sub_1000259C0()
{
  return LiveLookupStoreProtocol.fetchBlockingInfo(for:with:)();
}

uint64_t sub_1000259D0()
{
  return static LiveLookupStore.imageDirectoryPath.getter();
}

uint64_t sub_1000259E0()
{
  return static LiveLookupStore.shared.getter();
}

uint64_t sub_1000259F0()
{
  return type metadata accessor for LiveLookupStore();
}

uint64_t sub_100025A00()
{
  return type metadata accessor for IdentityType();
}

uint64_t sub_100025A10()
{
  return type metadata accessor for BlockingInfo();
}

uint64_t sub_100025A20()
{
  return ExtensionUpdate.init(identifier:isAppStoreVendable:)();
}

uint64_t sub_100025A30()
{
  return type metadata accessor for ExtensionUpdate();
}

uint64_t sub_100025A40()
{
  return LiveCallerIDLookupExtensionContext.serviceURL.getter();
}

uint64_t sub_100025A50()
{
  return LiveCallerIDLookupExtensionContext.userTierToken.getter();
}

uint64_t sub_100025A60()
{
  return LiveCallerIDLookupExtensionContext.tokenIssuerURL.getter();
}

uint64_t sub_100025A70()
{
  return type metadata accessor for LiveCallerIDLookupExtensionContext();
}

uint64_t sub_100025A90()
{
  return dispatch thunk of MessagesBlastDoorInterface.generatePreview(forAttachmentWith:resultHandler:)();
}

uint64_t sub_100025AA0()
{
  return MessagesBlastDoorInterface.init(with:)();
}

uint64_t sub_100025AB0()
{
  return type metadata accessor for MessagesBlastDoorInterface();
}

uint64_t sub_100025AC0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100025AD0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100025AE0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100025AF0()
{
  return _ObjCMachImageWrapper.cgImage.getter();
}

uint64_t sub_100025B00()
{
  return dispatch thunk of _ObjCLargeImageWrapper.image.getter();
}

uint64_t sub_100025B10()
{
  return type metadata accessor for _ObjCLargeImageWrapper();
}

uint64_t sub_100025B20()
{
  return ATXEncodingConfiguration.init(preTwiddled:lzfseCompression:)();
}

uint64_t sub_100025B30()
{
  return Image.data(using:)();
}

uint64_t sub_100025B40()
{
  return type metadata accessor for Image.Encoding();
}

uint64_t sub_100025B50()
{
  return Image.init(provider:maxPixelDimension:enforcedEncoding:)();
}

uint64_t sub_100025B60()
{
  return type metadata accessor for Image();
}

NSDictionary sub_100025B70()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100025B80()
{
  return Dictionary.description.getter();
}

NSString sub_100025B90()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100025BA0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100025BB0()
{
  return String.init<A>(reflecting:)();
}

uint64_t sub_100025BC0()
{
  return String.utf8CString.getter();
}

uint64_t sub_100025BD0()
{
  return String.hash(into:)();
}

void sub_100025BE0(Swift::String a1)
{
}

Swift::Int sub_100025BF0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100025C00()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100025C10()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100025C20()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100025C30()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100025C40()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100025C50()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100025C60()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100025C70()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_100025C80()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100025C90()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100025CA0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100025CB0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100025CC0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100025CD0()
{
  return static NSNotificationName.LiveLookupStoreExtensionsChangedNotification.getter();
}

uint64_t sub_100025CE0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100025CF0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100025D00()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100025D10()
{
  return _bridgeAnyObjectToAny(_:)();
}

void sub_100025D20(Swift::Int a1)
{
}

uint64_t sub_100025D30()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100025D40()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100025D50()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100025D60()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100025D70()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100025D80()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100025D90()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100025DA0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100025DB0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100025DC0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100025DD0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100025DF0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100025E00()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100025E10()
{
  return Error._code.getter();
}

uint64_t sub_100025E20()
{
  return Error._domain.getter();
}

uint64_t sub_100025E30()
{
  return Error._userInfo.getter();
}

uint64_t sub_100025E40()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100025E50()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutoreleasedReturnValue(id a1)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__cancelWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelWithError:");
}

id objc_msgSend__canonicalizedPhoneNumbersToPhoneNumbers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canonicalizedPhoneNumbersToPhoneNumbers:");
}

id objc_msgSend__extensionContextForUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extensionContextForUUID:");
}

id objc_msgSend__extensionWithNSExtension_storeExtension_isOnlyExtensionInContainingApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extensionWithNSExtension:storeExtension:isOnlyExtensionInContainingApp:");
}

id objc_msgSend__extensionsFromNSExtensions_usingProritizedStoreExtensions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extensionsFromNSExtensions:usingProritizedStoreExtensions:");
}

id objc_msgSend__loadExtensionDataOperationWithStore_extension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadExtensionDataOperationWithStore:extension:");
}

id objc_msgSend__loadExtensionDataWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadExtensionDataWithError:");
}

id objc_msgSend__nsExtension_isOnlyExtensionInContainingAppAmongNSExtensions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsExtension:isOnlyExtensionInContainingAppAmongNSExtensions:");
}

id objc_msgSend__plugIn(void *a1, const char *a2, ...)
{
  return _[a1 _plugIn];
}

id objc_msgSend__reportMetricId_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportMetricId:usingBlock:");
}

id objc_msgSend__setUpTemporaryDirectory(void *a1, const char *a2, ...)
{
  return _[a1 _setUpTemporaryDirectory];
}

id objc_msgSend__storeIdentificationEntryToIdentificationEntriesForDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeIdentificationEntryToIdentificationEntriesForDictionary:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activeExtensions(void *a1, const char *a2, ...)
{
  return _[a1 activeExtensions];
}

id objc_msgSend_addBlockingEntriesWithData_extensionID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBlockingEntriesWithData:extensionID:error:");
}

id objc_msgSend_addExtensionWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addExtensionWithIdentifier:error:");
}

id objc_msgSend_addIdentificationEntriesWithData_extensionID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIdentificationEntriesWithData:extensionID:error:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_afterFirstUnlock(void *a1, const char *a2, ...)
{
  return _[a1 afterFirstUnlock];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowLoadingDisabledExtensions(void *a1, const char *a2, ...)
{
  return _[a1 allowLoadingDisabledExtensions];
}

id objc_msgSend_analyticsReporter(void *a1, const char *a2, ...)
{
  return _[a1 analyticsReporter];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_awdReporter(void *a1, const char *a2, ...)
{
  return _[a1 awdReporter];
}

id objc_msgSend_beginExtensionRequestWithInputItems_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginExtensionRequestWithInputItems:completion:");
}

id objc_msgSend_beginWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginWithCompletion:");
}

id objc_msgSend_blockingEntriesAdded(void *a1, const char *a2, ...)
{
  return _[a1 blockingEntriesAdded];
}

id objc_msgSend_blockingWaitSeconds(void *a1, const char *a2, ...)
{
  return _[a1 blockingWaitSeconds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cacheExpiryMinutes(void *a1, const char *a2, ...)
{
  return _[a1 cacheExpiryMinutes];
}

id objc_msgSend_cachedCallDirectoryStoreExtensions(void *a1, const char *a2, ...)
{
  return _[a1 cachedCallDirectoryStoreExtensions];
}

id objc_msgSend_callDirectoryLastInformationUpdatedForPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callDirectoryLastInformationUpdatedForPhoneNumber:");
}

id objc_msgSend_cancelExtensionRequestWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelExtensionRequestWithIdentifier:");
}

id objc_msgSend_canonicalizedPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canonicalizedPhoneNumber:");
}

id objc_msgSend_checkForExtensionsStuckLoading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForExtensionsStuckLoading:");
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return _[a1 cleanup];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _[a1 completionHandler];
}

id objc_msgSend_containingAppURL(void *a1, const char *a2, ...)
{
  return _[a1 containingAppURL];
}

id objc_msgSend_containingUrl(void *a1, const char *a2, ...)
{
  return _[a1 containingUrl];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_cx_callDirectoryManagerDefaultHostInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cx_callDirectoryManagerDefaultHostInterface");
}

id objc_msgSend_cx_callDirectoryManagerErrorWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cx_callDirectoryManagerErrorWithCode:");
}

id objc_msgSend_cx_callDirectoryManagerMaintenanceHostInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cx_callDirectoryManagerMaintenanceHostInterface");
}

id objc_msgSend_dataRequest(void *a1, const char *a2, ...)
{
  return _[a1 dataRequest];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_disableAllExtensionsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableAllExtensionsWithError:");
}

id objc_msgSend_disabledStoredExtensionIdentifiersWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disabledStoredExtensionIdentifiersWithError:");
}

id objc_msgSend_enabledForExtensionWith_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabledForExtensionWith:");
}

id objc_msgSend_enabledStoredExtensionIdentifiersWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabledStoredExtensionIdentifiersWithError:");
}

id objc_msgSend_entriesAdded(void *a1, const char *a2, ...)
{
  return _[a1 entriesAdded];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return _[a1 extension];
}

id objc_msgSend_extensionBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 extensionBundleIdentifier];
}

id objc_msgSend_extensionDataRequest_addedBlockingEntryData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionDataRequest:addedBlockingEntryData:error:");
}

id objc_msgSend_extensionDataRequest_addedIdentificationEntryData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionDataRequest:addedIdentificationEntryData:error:");
}

id objc_msgSend_extensionDataRequest_isIncrementalLoadingAllowedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionDataRequest:isIncrementalLoadingAllowedWithError:");
}

id objc_msgSend_extensionDataRequest_removedAllBlockingEntriesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionDataRequest:removedAllBlockingEntriesWithError:");
}

id objc_msgSend_extensionDataRequest_removedAllIdentificationEntriesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionDataRequest:removedAllIdentificationEntriesWithError:");
}

id objc_msgSend_extensionDataRequest_removedBlockingEntryData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionDataRequest:removedBlockingEntryData:error:");
}

id objc_msgSend_extensionDataRequest_removedIdentificationEntryData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionDataRequest:removedIdentificationEntryData:error:");
}

id objc_msgSend_extensionID(void *a1, const char *a2, ...)
{
  return _[a1 extensionID];
}

id objc_msgSend_extensionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 extensionIdentifier];
}

id objc_msgSend_extensionIdentifierFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionIdentifierFor:");
}

id objc_msgSend_extensionIdentifierFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionIdentifierFrom:");
}

id objc_msgSend_extensionPointIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 extensionPointIdentifier];
}

id objc_msgSend_extensionUpdateFor_isAppStorVendable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionUpdateFor:isAppStorVendable:");
}

id objc_msgSend_extensionWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionWithIdentifier:error:");
}

id objc_msgSend_extensionsDataSource(void *a1, const char *a2, ...)
{
  return _[a1 extensionsDataSource];
}

id objc_msgSend_extensionsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionsWithCompletionHandler:");
}

id objc_msgSend_fetchIdentityInfoFor_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchIdentityInfoFor:from:");
}

id objc_msgSend_fetchLiveIdentityInfoFor_cacheOnly_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLiveIdentityInfoFor:cacheOnly:completionHandler:");
}

id objc_msgSend_fetchLiveInfoFor_with_blockingCompletion_identityCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLiveInfoFor:with:blockingCompletion:identityCompletion:");
}

id objc_msgSend_firstEnabledBlockedExtensionIdentifierFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstEnabledBlockedExtensionIdentifierFor:");
}

id objc_msgSend_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:error:");
}

id objc_msgSend_firstUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 firstUnlocked];
}

id objc_msgSend_fromCache(void *a1, const char *a2, ...)
{
  return _[a1 fromCache];
}

id objc_msgSend_generatePreviewImageFrom_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePreviewImageFrom:completionHandler:");
}

id objc_msgSend_getBlockingInfoFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBlockingInfoFor:");
}

id objc_msgSend_hasIcon(void *a1, const char *a2, ...)
{
  return _[a1 hasIcon];
}

id objc_msgSend_hasImage(void *a1, const char *a2, ...)
{
  return _[a1 hasImage];
}

id objc_msgSend_hasPerfomedInitialDeletion(void *a1, const char *a2, ...)
{
  return _[a1 hasPerfomedInitialDeletion];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_hostCancellationError(void *a1, const char *a2, ...)
{
  return _[a1 hostCancellationError];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return _[a1 icon];
}

id objc_msgSend_iconURLFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconURLFor:");
}

id objc_msgSend_identificationEntriesAdded(void *a1, const char *a2, ...)
{
  return _[a1 identificationEntriesAdded];
}

id objc_msgSend_identificationEntriesChangedNotifier(void *a1, const char *a2, ...)
{
  return _[a1 identificationEntriesChangedNotifier];
}

id objc_msgSend_identificationEntryFrom_withName_withIconURL_withType_fromCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identificationEntryFrom:withName:withIconURL:withType:fromCache:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identityType(void *a1, const char *a2, ...)
{
  return _[a1 identityType];
}

id objc_msgSend_identityTypeFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityTypeFor:");
}

id objc_msgSend_identityWaitSeconds(void *a1, const char *a2, ...)
{
  return _[a1 identityWaitSeconds];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageTranscoder(void *a1, const char *a2, ...)
{
  return _[a1 imageTranscoder];
}

id objc_msgSend_incrementalLoadingState(void *a1, const char *a2, ...)
{
  return _[a1 incrementalLoadingState];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initFileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFileURLWithPath:");
}

id objc_msgSend_initForReadingAndWritingWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingAndWritingWithError:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClientConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientConfig:");
}

id objc_msgSend_initWithComponentId_andBlockOnConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithComponentId:andBlockOnConfiguration:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithExtension_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtension:queue:");
}

id objc_msgSend_initWithExtensionIdentifier_dataRequest_queue_store_lastUpdateDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtensionIdentifier:dataRequest:queue:store:lastUpdateDelegate:");
}

id objc_msgSend_initWithExtensionIdentifier_dataRequest_queue_store_maximumAllowedEntries_identificationEntriesChangedNotifier_lastUpdateDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtensionIdentifier:dataRequest:queue:store:maximumAllowedEntries:identificationEntriesChangedNotifier:lastUpdateDelegate:");
}

id objc_msgSend_initWithExtensionIdentifier_enabled_loadExtensionDataOperation_queue_store_identificationEntriesChangedNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtensionIdentifier:enabled:loadExtensionDataOperation:queue:store:identificationEntriesChangedNotifier:");
}

id objc_msgSend_initWithExtensionIdentifier_enabled_loadExtensionDataOperation_store_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtensionIdentifier:enabled:loadExtensionDataOperation:store:");
}

id objc_msgSend_initWithExtensionIdentifier_queue_store_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtensionIdentifier:queue:store:");
}

id objc_msgSend_initWithExtensionIdentifier_store_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtensionIdentifier:store:");
}

id objc_msgSend_initWithFirstUnlockStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirstUnlockStatus:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithNotificationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotificationName:");
}

id objc_msgSend_initWithPhoneNumbers_extensionsDataSource_store_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhoneNumbers:extensionsDataSource:store:");
}

id objc_msgSend_initWithPhoneNumbers_store_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhoneNumbers:store:");
}

id objc_msgSend_initWithPrioritizedExtensionIdentifiers_store_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrioritizedExtensionIdentifiers:store:");
}

id objc_msgSend_initWithPrioritizedExtensionIdentifiers_store_identificationEntriesChangedNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrioritizedExtensionIdentifiers:store:identificationEntriesChangedNotifier:");
}

id objc_msgSend_initWithStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStore:");
}

id objc_msgSend_initWithStore_extensionsDataSource_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStore:extensionsDataSource:queue:");
}

id objc_msgSend_initWithStore_firstUnlockStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStore:firstUnlockStatus:");
}

id objc_msgSend_initWithStore_firstUnlockStatus_extensionsDataSource_identificationEntriesChangedNotifier_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStore:firstUnlockStatus:extensionsDataSource:identificationEntriesChangedNotifier:queue:");
}

id objc_msgSend_initWithStore_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStore:queue:");
}

id objc_msgSend_initWithURL_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:allowPlaceholder:error:");
}

id objc_msgSend_initWithUseCase_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUseCase:sourceApplicationBundleIdentifier:");
}

id objc_msgSend_installedExtensionWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedExtensionWithIdentifier:error:");
}

id objc_msgSend_installedExtensionsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedExtensionsWithError:");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_isAppStoreVendable(void *a1, const char *a2, ...)
{
  return _[a1 isAppStoreVendable];
}

id objc_msgSend_isCorrupt(void *a1, const char *a2, ...)
{
  return _[a1 isCorrupt];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_lastBlockingPhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 lastBlockingPhoneNumber];
}

id objc_msgSend_lastIdentificationPhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 lastIdentificationPhoneNumber];
}

id objc_msgSend_lastInformationUpdate(void *a1, const char *a2, ...)
{
  return _[a1 lastInformationUpdate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_liveLookupGroup(void *a1, const char *a2, ...)
{
  return _[a1 liveLookupGroup];
}

id objc_msgSend_liveLookupStore(void *a1, const char *a2, ...)
{
  return _[a1 liveLookupStore];
}

id objc_msgSend_llExtension_containedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "llExtension:containedIn:");
}

id objc_msgSend_loadExtensionDataOperation(void *a1, const char *a2, ...)
{
  return _[a1 loadExtensionDataOperation];
}

id objc_msgSend_localizedContainingAppName(void *a1, const char *a2, ...)
{
  return _[a1 localizedContainingAppName];
}

id objc_msgSend_localizedLabel(void *a1, const char *a2, ...)
{
  return _[a1 localizedLabel];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_maximumAllowedEntries(void *a1, const char *a2, ...)
{
  return _[a1 maximumAllowedEntries];
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameFor:");
}

id objc_msgSend_newMetricContainerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newMetricContainerWithIdentifier:");
}

id objc_msgSend_notificationName(void *a1, const char *a2, ...)
{
  return _[a1 notificationName];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_performInitialDeletionIfNecessaryWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performInitialDeletionIfNecessaryWithError:");
}

id objc_msgSend_performMigrationsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performMigrationsWithError:");
}

id objc_msgSend_performTransactionWithBlock_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTransactionWithBlock:error:");
}

id objc_msgSend_performWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithCompletionHandler:");
}

id objc_msgSend_performWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithError:");
}

id objc_msgSend_phoneNumberAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberAtIndex:");
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumbers];
}

id objc_msgSend_plugInKitProxy(void *a1, const char *a2, ...)
{
  return _[a1 plugInKitProxy];
}

id objc_msgSend_postNotification(void *a1, const char *a2, ...)
{
  return _[a1 postNotification];
}

id objc_msgSend_prepareStoreIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 prepareStoreIfNecessary];
}

id objc_msgSend_primaryKey(void *a1, const char *a2, ...)
{
  return _[a1 primaryKey];
}

id objc_msgSend_prioritizedExtensionIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 prioritizedExtensionIdentifiers];
}

id objc_msgSend_prioritizedExtensionsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prioritizedExtensionsWithError:");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_removeBlockingEntriesForExtensionWithID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeBlockingEntriesForExtensionWithID:error:");
}

id objc_msgSend_removeBlockingEntriesWithData_extensionID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeBlockingEntriesWithData:extensionID:error:");
}

id objc_msgSend_removeExtensionWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeExtensionWithIdentifier:error:");
}

id objc_msgSend_removeIdentificationEntriesForExtensionWithID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIdentificationEntriesForExtensionWithID:error:");
}

id objc_msgSend_removeIdentificationEntriesWithData_extensionID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIdentificationEntriesWithData:extensionID:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeUnreferencedRecordsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeUnreferencedRecordsWithError:");
}

id objc_msgSend_reportLoadedDataForExtensionWithIdentifier_blockingEntries_identificationEntries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportLoadedDataForExtensionWithIdentifier:blockingEntries:identificationEntries:");
}

id objc_msgSend_reportSetEnabled_forExtensionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportSetEnabled:forExtensionWithIdentifier:");
}

id objc_msgSend_requestDataByStringKeyword_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestDataByStringKeyword:completionHandler:");
}

id objc_msgSend_requestFailedWithError_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestFailedWithError:completion:");
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 requestIdentifier];
}

id objc_msgSend_requestStatusForClientConfig_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestStatusForClientConfig:options:completionHandler:");
}

id objc_msgSend_requiresExtensionDisablement(void *a1, const char *a2, ...)
{
  return _[a1 requiresExtensionDisablement];
}

id objc_msgSend_requiresExtensionSynchronization(void *a1, const char *a2, ...)
{
  return _[a1 requiresExtensionSynchronization];
}

id objc_msgSend_requiresInitialDeletion(void *a1, const char *a2, ...)
{
  return _[a1 requiresInitialDeletion];
}

id objc_msgSend_resetForExtensionWith_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetForExtensionWith:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_sanitizer(void *a1, const char *a2, ...)
{
  return _[a1 sanitizer];
}

id objc_msgSend_sendBlastDoorWithTimeInterval_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendBlastDoorWithTimeInterval:for:");
}

id objc_msgSend_sendBlockingCacheHitFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendBlockingCacheHitFor:");
}

id objc_msgSend_sendBlockingWithError_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendBlockingWithError:for:");
}

id objc_msgSend_sendBlockingWithTimeInterval_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendBlockingWithTimeInterval:for:");
}

id objc_msgSend_sendIdentityCacheHitFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendIdentityCacheHitFor:");
}

id objc_msgSend_sendIdentityWithError_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendIdentityWithError:for:");
}

id objc_msgSend_sendIdentityWithTimeInterval_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendIdentityWithTimeInterval:for:");
}

id objc_msgSend_serverBag(void *a1, const char *a2, ...)
{
  return _[a1 serverBag];
}

id objc_msgSend_serverConnection(void *a1, const char *a2, ...)
{
  return _[a1 serverConnection];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAllowLoadingDisabledExtensions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowLoadingDisabledExtensions:");
}

id objc_msgSend_setAwdReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAwdReporter:");
}

id objc_msgSend_setBlockingEntriesAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockingEntriesAdded:");
}

id objc_msgSend_setCachedCallDirectoryStoreExtensions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedCallDirectoryStoreExtensions:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setDataRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataRequest:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:queue:");
}

id objc_msgSend_setEnabled_forExtensionWith_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:forExtensionWith:completionHandler:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtension:");
}

id objc_msgSend_setExtensionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtensionID:");
}

id objc_msgSend_setExtensionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtensionIdentifier:");
}

id objc_msgSend_setFirstUnlockHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstUnlockHandler:");
}

id objc_msgSend_setFromCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromCache:");
}

id objc_msgSend_setHasPerfomedInitialDeletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasPerfomedInitialDeletion:");
}

id objc_msgSend_setHostCancellationError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHostCancellationError:");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setIconURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconURL:");
}

id objc_msgSend_setIdentificationEntriesAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentificationEntriesAdded:");
}

id objc_msgSend_setIdentificationEntriesChangedNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentificationEntriesChangedNotifier:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setIncrementalLoadingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncrementalLoadingState:");
}

id objc_msgSend_setIsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsEnabled:");
}

id objc_msgSend_setLastBlockingPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastBlockingPhoneNumber:");
}

id objc_msgSend_setLastIdentificationPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastIdentificationPhoneNumber:");
}

id objc_msgSend_setLocalizedContainingAppName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedContainingAppName:");
}

id objc_msgSend_setLocalizedExtensionContainingAppName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedExtensionContainingAppName:");
}

id objc_msgSend_setLocalizedExtensionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedExtensionName:");
}

id objc_msgSend_setLocalizedLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedLabel:");
}

id objc_msgSend_setLocalizedName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedName:");
}

id objc_msgSend_setMaximumAllowedEntries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumAllowedEntries:");
}

id objc_msgSend_setMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetric:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOnlyExtensionInContainingApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnlyExtensionInContainingApp:");
}

id objc_msgSend_setPlugInKitProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlugInKitProxy:");
}

id objc_msgSend_setPrioritizedExtensionIdentifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrioritizedExtensionIdentifiers:error:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProviderBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProviderBundleId:");
}

id objc_msgSend_setRequestCancellationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestCancellationBlock:");
}

id objc_msgSend_setRequestCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestCompletionBlock:");
}

id objc_msgSend_setRequestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestIdentifier:");
}

id objc_msgSend_setRequestInterruptionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestInterruptionBlock:");
}

id objc_msgSend_setServerConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerConnection:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_forExtensionWithID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:forExtensionWithID:error:");
}

id objc_msgSend_setState_forExtensionWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:forExtensionWithIdentifier:error:");
}

id objc_msgSend_setStateForAllExtensions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateForAllExtensions:error:");
}

id objc_msgSend_setStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStore:");
}

id objc_msgSend_setTotalBlockedHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalBlockedHandles:");
}

id objc_msgSend_setTotalIdentifiedHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalIdentifiedHandles:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUpdateDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateDelegate:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldBlockWith_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldBlockWith:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateLastModified(void *a1, const char *a2, ...)
{
  return _[a1 stateLastModified];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return _[a1 store];
}

id objc_msgSend_storedExtensionIdentifiersWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storedExtensionIdentifiersWithError:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_submitMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitMetric:");
}

id objc_msgSend_synchronizeExtensionsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeExtensionsWithError:");
}

id objc_msgSend_systemMonitor(void *a1, const char *a2, ...)
{
  return _[a1 systemMonitor];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_unavailableExtensionPurgeTimeout(void *a1, const char *a2, ...)
{
  return _[a1 unavailableExtensionPurgeTimeout];
}

id objc_msgSend_unavailableStoredExtensionIdentifiersWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unavailableStoredExtensionIdentifiersWithError:");
}

id objc_msgSend_updateBlockingInfoFor_with_shouldBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBlockingInfoFor:with:shouldBlock:");
}

id objc_msgSend_updateDelegate(void *a1, const char *a2, ...)
{
  return _[a1 updateDelegate];
}

id objc_msgSend_updateExtensionsWith_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateExtensionsWith:");
}

id objc_msgSend_updateIdentityInfoFor_with_name_iconURL_type_ttlMinutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIdentityInfoFor:with:name:iconURL:type:ttlMinutes:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_vacuumWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vacuumWithError:");
}

id objc_msgSend_writeImageIfNecessary_extensionIdentifier_handle_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeImageIfNecessary:extensionIdentifier:handle:completionHandler:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}