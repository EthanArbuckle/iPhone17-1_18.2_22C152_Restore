void sub_100001BA4(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;

  v2 = [objc_alloc((Class)UISApplicationState) initWithBundleIdentifier:*(void *)(a1 + 32)];
  v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v2 setBadgeValue:v3];

  v4 = [v2 badgeValue];
  v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    v7 = *(void *)(a1 + 32);
    v9 = 138412802;
    v10 = v6;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v7;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Badged (%@, %@)", (uint8_t *)&v9, 0x20u);
  }
}

id sub_100002A18(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008588;
  v4[3] = &unk_10001CAC0;
  v4[4] = a1[6];
  return [v2 _unsafeSelectFollowUpItemsWithUniqueIdentifiers:v1 rowHandler:v4];
}

void sub_100002E68(uint64_t a1, sqlite3_stmt *a2)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        sqlite3_bind_text(a2, objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9)+ 1, (const char *)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "UTF8String"), -1, 0);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void sub_1000034B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000037B8(uint64_t a1)
{
}

void sub_1000037C0(uint64_t a1)
{
}

void sub_1000037C8(uint64_t a1)
{
}

uint64_t sub_1000037D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1000037E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1000037F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100003800(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100003970(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100003988(id a1)
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.followup.itemstorequeue", v3);
  v2 = (void *)qword_100022E58;
  qword_100022E58 = (uint64_t)v1;
}

uint64_t sub_100003D3C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000426C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100004290(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = objc_msgSend(v2, "_unsafe_openDatabase:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

id sub_10000461C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsafe_wipeDatabase");
}

id sub_1000047B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsafe_closeDatabase");
}

id sub_100004A6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = v3;
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    id v5 = [v3 clientIdentifier];
    unsigned int v6 = [v5 isEqualToString:*(void *)(*(void *)(a1 + 32) + 8)];

    if (v6) {
      goto LABEL_8;
    }
LABEL_6:
    id v9 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = +[FLApprovedItemsFilter sharedFilter];
  id v8 = [v7 approvalStatusForItem:v4];

  if (v8 != (id)1)
  {
    if (v8 == (id)2) {
      goto LABEL_6;
    }
    +[FLApprovedItemsDecorator decorateUnknownItem:v4];
  }
LABEL_8:
  id v9 = v4;
LABEL_9:

  return v9;
}

void sub_100004CFC(id a1, NSNotification *a2)
{
  v2 = _FLLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MC restrictions changed, refreshing badges", v3, 2u);
  }

  +[ClientInterface updateBadgeCounts:0];
}

uint64_t sub_100005278()
{
  v0 = _FLLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Notified of language change. Will exit when all clear.", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

void sub_100005430(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.followup.badges", v3);
  v2 = (void *)qword_100022E70;
  qword_100022E70 = (uint64_t)v1;
}

void sub_100005840(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [v3 notification];
  id v5 = [v4 previousNotificationActionDate];
  unsigned int v6 = [*(id *)(a1 + 32) notification];
  [v6 setPreviousNotificationActionDate:v5];

  uint64_t v7 = [v3 notification];
  id v8 = [v7 creationDate];
  id v9 = [*(id *)(a1 + 32) notification];
  [v9 setCreationDate:v8];

  long long v10 = _FLLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Replacing existing item %@ with matching identifier", (uint8_t *)&v11, 0xCu);
  }
}

uint64_t sub_100005FB8(uint64_t a1, void *a2)
{
  if (!*(void *)(a1 + 32)) {
    return 1;
  }
  id v3 = [a2 clientIdentifier];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return (uint64_t)v4;
}

void sub_100006014(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  os_transaction_needs_more_time();
  [*(id *)(a1 + 40) removeObject:v7];
  if (!*(unsigned char *)(a1 + 64) || [*(id *)(a1 + 48) containsObject:v7])
  {
    unsigned int v6 = *(void **)(a1 + 56);
    if (v6) {
      [v6 processCurrentItems:v5];
    }
    +[ClientInterface refreshBadgesWithItems:v5 forBundleIdentifier:v7];
  }
}

id sub_1000060B8(id a1, FLFollowUpItem *a2)
{
  v2 = a2;
  id v3 = +[FLApprovedItemsFilter sharedFilter];
  id v4 = [v3 approvalStatusForItem:v2];

  if (v4 == (id)1)
  {
    id v5 = [(FLFollowUpItem *)v2 targetBundleIdentifier];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_100006394(id a1)
{
  dispatch_queue_t v1 = objc_alloc_init(ItemStore);
  v2 = (void *)qword_100022E80;
  qword_100022E80 = (uint64_t)v1;

  id v3 = [FLSQLiteExecutor alloc];
  NSHomeDirectory();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v7 stringByAppendingString:@"/Library/CoreFollowUp/items.db"];
  id v5 = [(FLSQLiteExecutor *)v3 initWithDatabasePath:v4];
  unsigned int v6 = *(void **)(qword_100022E80 + 8);
  *(void *)(qword_100022E80 + 8) = v5;
}

void sub_100006518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006530(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uniqueIdentifier];

  if (v2)
  {
    id v3 = +[ItemStore sharedInstance];
    id v4 = [v3 queryExecutor];

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000660C;
    v5[3] = &unk_10001C960;
    id v6 = *(id *)(a1 + 32);
    long long v7 = *(_OWORD *)(a1 + 40);
    [v4 performTransactionBlockAndWait:v5];
  }
}

id sub_10000660C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSqlID:", objc_msgSend(*(id *)(a1 + 40), "_unsafe_insertFollowUpItem:", *(void *)(a1 + 32)));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "actions", 0);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_unsafe_insertAction:item:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v6), *(void *)(a1 + 32));
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  long long v7 = [*(id *)(a1 + 32) notification];

  if (v7)
  {
    id v8 = objc_msgSend(*(id *)(a1 + 40), "_unsafe_insertNotificationForItem:", *(void *)(a1 + 32));
    id v9 = [*(id *)(a1 + 32) notification];
    [v9 setSqlID:v8];
  }
  id result = [*(id *)(a1 + 32) sqlID];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result != (id)-1;
  return result;
}

void sub_1000068A0(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, 0);

  uint64_t v5 = [*(id *)(a1 + 32) title];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) title];
    sqlite3_bind_text(a2, 2, (const char *)[v6 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 2);
  }
  long long v7 = [*(id *)(a1 + 32) informativeText];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) informativeText];
    sqlite3_bind_text(a2, 3, (const char *)[v8 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 3);
  }
  sqlite3_bind_int(a2, 4, (int)[*(id *)(a1 + 32) showInSettings]);
  sqlite3_bind_int(a2, 5, (int)[*(id *)(a1 + 32) displayStyle]);
  sqlite3_bind_int(a2, 6, (int)[*(id *)(a1 + 32) shouldPersistWhenActivated]);
  sqlite3_bind_int(a2, 7, (int)[*(id *)(a1 + 32) shouldPersistWhenDismissed]);
  id v9 = [*(id *)(a1 + 32) _userInfoData];
  id v36 = v9;
  if (v9)
  {
    id v10 = v9;
    sqlite3_bind_blob(a2, 8, [v10 bytes], (int)objc_msgSend(v10, "length"), 0);
  }
  else
  {
    sqlite3_bind_null(a2, 8);
  }
  long long v11 = [*(id *)(a1 + 32) clientIdentifier];

  if (v11)
  {
    id v12 = [*(id *)(a1 + 32) clientIdentifier];
    sqlite3_bind_text(a2, 9, (const char *)[v12 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 9);
  }
  long long v13 = [*(id *)(a1 + 32) extensionIdentifier];

  if (v13)
  {
    id v14 = [*(id *)(a1 + 32) extensionIdentifier];
    sqlite3_bind_text(a2, 10, (const char *)[v14 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 10);
  }
  v15 = [*(id *)(a1 + 32) groupIdentifier];

  if (v15)
  {
    id v16 = [*(id *)(a1 + 32) groupIdentifier];
    sqlite3_bind_text(a2, 11, (const char *)[v16 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 11);
  }
  v17 = [*(id *)(a1 + 32) targetBundleIdentifier];

  if (v17)
  {
    id v18 = [*(id *)(a1 + 32) targetBundleIdentifier];
    sqlite3_bind_text(a2, 12, (const char *)[v18 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 12);
  }
  v19 = [*(id *)(a1 + 32) representingBundlePath];

  if (v19)
  {
    id v20 = [*(id *)(a1 + 32) representingBundlePath];
    sqlite3_bind_text(a2, 13, (const char *)[v20 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 13);
  }
  v21 = [*(id *)(a1 + 32) bundleIconName];

  if (v21)
  {
    id v22 = [*(id *)(a1 + 32) bundleIconName];
    sqlite3_bind_text(a2, 14, (const char *)[v22 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 14);
  }
  v23 = [*(id *)(a1 + 32) informativeFooterText];

  if (v23)
  {
    id v24 = [*(id *)(a1 + 32) informativeFooterText];
    sqlite3_bind_text(a2, 15, (const char *)[v24 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 15);
  }
  v25 = [*(id *)(a1 + 32) categoryIdentifier];

  if (v25)
  {
    id v26 = [*(id *)(a1 + 32) categoryIdentifier];
    sqlite3_bind_text(a2, 16, (const char *)[v26 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 16);
  }
  v27 = [*(id *)(a1 + 32) expirationDate];

  if (v27)
  {
    v28 = [*(id *)(a1 + 32) expirationDate];
    [v28 timeIntervalSince1970];
    sqlite3_bind_double(a2, 17, v29);
  }
  else
  {
    sqlite3_bind_null(a2, 17);
  }
  v30 = [*(id *)(a1 + 32) accountIdentifier];

  if (v30)
  {
    id v31 = [*(id *)(a1 + 32) accountIdentifier];
    sqlite3_bind_text(a2, 18, (const char *)[v31 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 18);
  }
  v32 = [*(id *)(a1 + 32) typeIdentifier];

  if (v32)
  {
    id v33 = [*(id *)(a1 + 32) typeIdentifier];
    sqlite3_bind_text(a2, 19, (const char *)[v33 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 19);
  }
  v34 = [*(id *)(a1 + 32) collectionIdentifier];

  if (v34)
  {
    id v35 = [*(id *)(a1 + 32) collectionIdentifier];
    sqlite3_bind_text(a2, 20, (const char *)[v35 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 20);
  }
}

void sub_100007014(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = [*(id *)(a1 + 32) label];
  sqlite3_bind_text(a2, 1, (const char *)[v4 UTF8String], -1, 0);

  uint64_t v5 = [*(id *)(a1 + 32) url];
  id v6 = [v5 absoluteString];
  sqlite3_bind_text(a2, 2, (const char *)[v6 UTF8String], -1, 0);

  long long v7 = [*(id *)(a1 + 32) launchActionURL];
  id v8 = [v7 absoluteString];
  sqlite3_bind_text(a2, 3, (const char *)[v8 UTF8String], -1, 0);

  id v9 = [*(id *)(a1 + 32) _userInfoData];
  id v13 = v9;
  if (v9)
  {
    id v10 = v9;
    sqlite3_bind_blob(a2, 4, [v10 bytes], (int)objc_msgSend(v10, "length"), 0);
  }
  else
  {
    sqlite3_bind_null(a2, 4);
  }
  long long v11 = *(void **)(a1 + 40);
  if (v11) {
    sqlite3_bind_int64(a2, 5, (sqlite3_int64)[v11 sqlID]);
  }
  else {
    sqlite3_bind_null(a2, 5);
  }
  id v12 = [*(id *)(a1 + 32) identifier];
  sqlite3_bind_text(a2, 6, (const char *)[v12 UTF8String], -1, 0);
}

void sub_10000751C(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, (sqlite3_int64)[*(id *)(a1 + 32) sqlID]);
  id v4 = [*(id *)(a1 + 40) title];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) title];
    sqlite3_bind_text(a2, 2, (const char *)[v5 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 2);
  }
  id v6 = [*(id *)(a1 + 40) informativeText];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) informativeText];
    sqlite3_bind_text(a2, 3, (const char *)[v7 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 3);
  }
  id v8 = [*(id *)(a1 + 40) unlockActionLabel];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) unlockActionLabel];
    sqlite3_bind_text(a2, 4, (const char *)[v9 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 4);
  }
  id v10 = [*(id *)(a1 + 40) previousNotificationActionDate];
  [v10 timeIntervalSince1970];
  sqlite3_bind_double(a2, 5, v11);

  id v12 = [*(id *)(a1 + 40) activateAction];
  id v13 = [v12 sqlID];

  if (v13)
  {
    id v14 = [*(id *)(a1 + 40) activateAction];
    sqlite3_bind_int64(a2, 6, (sqlite3_int64)[v14 sqlID]);
  }
  else
  {
    sqlite3_bind_null(a2, 6);
  }
  v15 = [*(id *)(a1 + 40) dismissAction];
  id v16 = [v15 sqlID];

  if (v16)
  {
    v17 = [*(id *)(a1 + 40) dismissAction];
    sqlite3_bind_int64(a2, 7, (sqlite3_int64)[v17 sqlID]);
  }
  else
  {
    sqlite3_bind_null(a2, 7);
  }
  id v18 = [*(id *)(a1 + 40) clearAction];
  id v19 = [v18 sqlID];

  if (v19)
  {
    id v20 = [*(id *)(a1 + 40) clearAction];
    sqlite3_bind_int64(a2, 8, (sqlite3_int64)[v20 sqlID]);
  }
  else
  {
    sqlite3_bind_null(a2, 8);
  }
  [*(id *)(a1 + 40) frequency];
  if (v21 <= 0.0)
  {
    sqlite3_bind_null(a2, 9);
  }
  else
  {
    [*(id *)(a1 + 40) frequency];
    sqlite3_bind_double(a2, 9, v22);
  }
  v23 = [*(id *)(a1 + 40) creationDate];
  [v23 timeIntervalSince1970];
  sqlite3_bind_double(a2, 10, v24);

  v25 = [*(id *)(a1 + 40) _optionsData];
  id v29 = v25;
  if (v25)
  {
    id v26 = v25;
    sqlite3_bind_blob(a2, 11, [v26 bytes], (int)objc_msgSend(v26, "length"), 0);
  }
  else
  {
    sqlite3_bind_null(a2, 11);
  }
  v27 = [*(id *)(a1 + 40) subtitleText];

  if (v27)
  {
    id v28 = [*(id *)(a1 + 40) subtitleText];
    sqlite3_bind_text(a2, 12, (const char *)[v28 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(a2, 12);
  }
  if ([*(id *)(a1 + 40) sqlID]) {
    sqlite3_bind_int64(a2, 13, (sqlite3_int64)[*(id *)(a1 + 40) sqlID]);
  }
}

void sub_100007A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007A74(uint64_t a1)
{
  v2 = +[FLSQLiteQuery queryWithString:@"DELETE FROM items WHERE id=?"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007B9C;
  v8[3] = &unk_10001C988;
  id v9 = *(id *)(a1 + 32);
  [v2 setBindHandler:v8];
  id v3 = *(void **)(*(void *)(a1 + 40) + 8);
  id v7 = 0;
  unsigned __int8 v4 = [v3 performQuery:v2 error:&v7];
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v6 = _FLLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001096C();
    }
  }
}

uint64_t sub_100007B9C(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) sqlID];

  return sqlite3_bind_int64(a2, 1, (sqlite3_int64)v3);
}

void sub_100007CB4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_100007CCC(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_unsafe_insertNotificationForItem:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result != 0;
  return result;
}

void sub_100007E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007E8C(uint64_t a1)
{
  v2 = +[FLSQLiteQuery queryWithString:@"DELETE FROM notifications WHERE item_id=?"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007FB4;
  v8[3] = &unk_10001C988;
  id v9 = *(id *)(a1 + 32);
  [v2 setBindHandler:v8];
  id v3 = *(void **)(*(void *)(a1 + 40) + 8);
  id v7 = 0;
  unsigned __int8 v4 = [v3 performQuery:v2 error:&v7];
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v6 = _FLLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001096C();
    }
  }
}

uint64_t sub_100007FB4(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) sqlID];

  return sqlite3_bind_int64(a2, 1, (sqlite3_int64)v3);
}

uint64_t sub_1000080F8(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

void sub_100008298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000082BC(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008338;
  v3[3] = &unk_10001CA48;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 _unsafeSelectFollowUpActionsForItem:0 orActionID:0 rowHandler:v3];
}

id sub_100008338(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

void sub_1000084DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100008500(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100008574;
  v3[3] = &unk_10001CA98;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 _unsafeSelectFollowUpNotificationsWithRowHandler:v3];
}

id sub_100008574(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

id sub_100008588(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

void sub_10000859C(uint64_t a1, sqlite3_stmt *a2, unsigned char *a3)
{
  id v6 = [objc_alloc((Class)FLFollowUpItem) initWithoutDefaults];
  objc_msgSend(v6, "setSqlID:", sqlite3_column_int64(a2, 0));
  id v7 = [*(id *)(a1 + 32) stringFromColumn:1 inStatement:a2];
  [v6 setUniqueIdentifier:v7];

  id v8 = [*(id *)(a1 + 32) stringFromColumn:2 inStatement:a2];
  [v6 setTitle:v8];

  id v9 = [*(id *)(a1 + 32) stringFromColumn:3 inStatement:a2];
  [v6 setInformativeText:v9];

  objc_msgSend(v6, "setShowInSettings:", sqlite3_column_int(a2, 4) != 0);
  objc_msgSend(v6, "setDisplayStyle:", sqlite3_column_int(a2, 5));
  objc_msgSend(v6, "setShouldPersistWhenActivated:", sqlite3_column_int(a2, 6) != 0);
  objc_msgSend(v6, "setShouldPersistWhenDismissed:", sqlite3_column_int(a2, 7) != 0);
  id v10 = [*(id *)(a1 + 32) dataFromColumn:8 inStatement:a2];
  objc_msgSend(v6, "set_userInfoData:", v10);

  double v11 = [*(id *)(a1 + 32) stringFromColumn:9 inStatement:a2];
  [v6 setClientIdentifier:v11];

  id v12 = [*(id *)(a1 + 32) stringFromColumn:10 inStatement:a2];
  [v6 setExtensionIdentifier:v12];

  id v13 = [*(id *)(a1 + 32) stringFromColumn:11 inStatement:a2];
  [v6 setGroupIdentifier:v13];

  id v14 = [*(id *)(a1 + 32) stringFromColumn:12 inStatement:a2];
  [v6 setTargetBundleIdentifier:v14];

  v15 = [*(id *)(a1 + 32) stringFromColumn:13 inStatement:a2];
  [v6 setRepresentingBundlePath:v15];

  id v16 = [*(id *)(a1 + 32) stringFromColumn:14 inStatement:a2];
  [v6 setBundleIconName:v16];

  v17 = [*(id *)(a1 + 32) stringFromColumn:15 inStatement:a2];
  [v6 setInformativeFooterText:v17];

  id v18 = [*(id *)(a1 + 32) stringFromColumn:16 inStatement:a2];
  [v6 setCategoryIdentifier:v18];

  id v19 = [*(id *)(a1 + 32) dateFromColumn:17 inStatement:a2];
  [v6 setExpirationDate:v19];

  id v20 = [*(id *)(a1 + 32) stringFromColumn:18 inStatement:a2];
  [v6 setAccountIdentifier:v20];

  double v21 = [*(id *)(a1 + 32) stringFromColumn:19 inStatement:a2];
  [v6 setTypeIdentifier:v21];

  double v22 = [*(id *)(a1 + 32) stringFromColumn:20 inStatement:a2];
  [v6 setCollectionIdentifier:v22];

  v23 = +[NSMutableArray array];
  double v24 = *(void **)(a1 + 32);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000089DC;
  v30[3] = &unk_10001CAE8;
  id v25 = v23;
  id v31 = v25;
  [v24 _unsafeSelectFollowUpActionsForItem:v6 orActionID:0 rowHandler:v30];
  [v6 setActions:v25];
  id v26 = [*(id *)(a1 + 32) _unsafeSelectNotificationForFollowUpItem:v6];
  [v6 setNotification:v26];

  char v29 = 0;
  uint64_t v27 = *(void *)(a1 + 40);
  if (v27)
  {
    (*(void (**)(uint64_t, id, char *))(v27 + 16))(v27, v6, &v29);
    char v28 = v29;
  }
  else
  {
    char v28 = 0;
  }
  *a3 = v28;
}

id sub_1000089DC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100008B04(uint64_t a1, sqlite3_stmt *a2, uint8_t *a3)
{
  id v6 = objc_alloc_init((Class)FLFollowUpNotification);
  objc_msgSend(v6, "setSqlID:", sqlite3_column_int64(a2, 0));
  id v7 = [*(id *)(a1 + 32) stringFromColumn:1 inStatement:a2];
  [v6 setTitle:v7];

  id v8 = [*(id *)(a1 + 32) stringFromColumn:2 inStatement:a2];
  [v6 setInformativeText:v8];

  id v9 = [*(id *)(a1 + 32) stringFromColumn:3 inStatement:a2];
  [v6 setUnlockActionLabel:v9];

  id v10 = [*(id *)(a1 + 32) dateFromColumn:4 inStatement:a2];
  [v6 setPreviousNotificationActionDate:v10];

  sqlite3_int64 v11 = sqlite3_column_int64(a2, 5);
  if (v11 >= 1)
  {
    sqlite3_int64 v12 = v11;
    id v13 = *(void **)(a1 + 32);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100008E4C;
    v28[3] = &unk_10001CAE8;
    id v29 = v6;
    [v13 _unsafeSelectFollowUpActionsForItem:0 orActionID:v12 rowHandler:v28];
  }
  sqlite3_int64 v14 = sqlite3_column_int64(a2, 7);
  if (v14)
  {
    sqlite3_int64 v15 = v14;
    id v16 = *(void **)(a1 + 32);
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    id v25 = sub_100008E58;
    id v26 = &unk_10001CAE8;
    id v27 = v6;
    [v16 _unsafeSelectFollowUpActionsForItem:0 orActionID:v15 rowHandler:&v23];
  }
  objc_msgSend(*(id *)(a1 + 32), "intervalFromColumn:inStatement:", 8, a2, v23, v24, v25, v26);
  objc_msgSend(v6, "setFrequency:");
  v17 = [*(id *)(a1 + 32) dateFromColumn:9 inStatement:a2];
  [v6 setCreationDate:v17];

  id v18 = [*(id *)(a1 + 32) dataFromColumn:10 inStatement:a2];
  objc_msgSend(v6, "set_optionsData:", v18);

  id v19 = [*(id *)(a1 + 32) stringFromColumn:11 inStatement:a2];
  [v6 setSubtitleText:v19];

  id v20 = _FLLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found notification: %@", buf, 0xCu);
  }

  buf[0] = 0;
  uint64_t v21 = *(void *)(a1 + 40);
  if (v21)
  {
    (*(void (**)(uint64_t, id, uint8_t *))(v21 + 16))(v21, v6, buf);
    uint8_t v22 = buf[0];
  }
  else
  {
    uint8_t v22 = 0;
  }
  *a3 = v22;
}

id sub_100008E4C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setActivateAction:a2];
}

id sub_100008E58(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setClearAction:a2];
}

void sub_1000090D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000090FC(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = [*(id *)(a1 + 32) sqlID];

  return sqlite3_bind_int64(a2, 1, (sqlite3_int64)v3);
}

void sub_100009140(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = objc_alloc_init((Class)FLFollowUpNotification);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setSqlID:", sqlite3_column_int64(a2, 0));
  id v7 = [*(id *)(a1 + 32) stringFromColumn:1 inStatement:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTitle:v7];

  id v8 = [*(id *)(a1 + 32) stringFromColumn:2 inStatement:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setInformativeText:v8];

  id v9 = [*(id *)(a1 + 32) stringFromColumn:3 inStatement:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setUnlockActionLabel:v9];

  id v10 = [*(id *)(a1 + 32) dateFromColumn:4 inStatement:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setPreviousNotificationActionDate:v10];

  sqlite3_int64 v11 = sqlite3_column_int64(a2, 5);
  if (v11 >= 1)
  {
    sqlite3_int64 v12 = v11;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000093F4;
    v21[3] = &unk_10001CA48;
    id v13 = *(void **)(a1 + 32);
    v21[4] = *(void *)(a1 + 40);
    [v13 _unsafeSelectFollowUpActionsForItem:0 orActionID:v12 rowHandler:v21];
  }
  sqlite3_int64 v14 = sqlite3_column_int64(a2, 7);
  if (v14)
  {
    sqlite3_int64 v15 = v14;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100009408;
    v20[3] = &unk_10001CA48;
    id v16 = *(void **)(a1 + 32);
    v20[4] = *(void *)(a1 + 40);
    [v16 _unsafeSelectFollowUpActionsForItem:0 orActionID:v15 rowHandler:v20];
  }
  [*(id *)(a1 + 32) intervalFromColumn:8 inStatement:a2];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setFrequency:");
  v17 = [*(id *)(a1 + 32) dateFromColumn:9 inStatement:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCreationDate:v17];

  id v18 = [*(id *)(a1 + 32) dataFromColumn:10 inStatement:a2];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "set_optionsData:", v18);

  id v19 = [*(id *)(a1 + 32) stringFromColumn:11 inStatement:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSubtitleText:v19];
}

id sub_1000093F4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setActivateAction:a2];
}

id sub_100009408(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setClearAction:a2];
}

uint64_t sub_1000095FC(uint64_t a1, sqlite3_stmt *a2)
{
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v5 = [v4 sqlID];
  }
  else {
    id v5 = *(id *)(a1 + 40);
  }

  return sqlite3_bind_int64(a2, 1, (sqlite3_int64)v5);
}

void sub_100009650(uint64_t a1, sqlite3_stmt *a2, unsigned char *a3)
{
  id v6 = objc_alloc_init((Class)FLFollowUpAction);
  objc_msgSend(v6, "setSqlID:", sqlite3_column_int64(a2, 0));
  id v7 = [*(id *)(a1 + 32) stringFromColumn:1 inStatement:a2];
  [v6 setLabel:v7];

  id v8 = [*(id *)(a1 + 32) urlFromColumn:2 inStatement:a2];
  [v6 setUrl:v8];

  id v9 = [*(id *)(a1 + 32) urlFromColumn:3 inStatement:a2];
  [v6 setLaunchActionURL:v9];

  id v10 = [*(id *)(a1 + 32) dataFromColumn:4 inStatement:a2];
  objc_msgSend(v6, "set_userInfoData:", v10);

  sqlite3_int64 v11 = [*(id *)(a1 + 32) stringFromColumn:5 inStatement:a2];
  [v6 setIdentifier:v11];

  char v14 = 0;
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12)
  {
    (*(void (**)(uint64_t, id, char *))(v12 + 16))(v12, v6, &v14);
    char v13 = v14;
  }
  else
  {
    char v13 = 0;
  }
  *a3 = v13;
}

void sub_10000996C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000999C(id a1)
{
  uint64_t v1 = objc_alloc_init(NotificationController);
  v2 = (void *)qword_100022E90;
  qword_100022E90 = (uint64_t)v1;

  id v3 = objc_alloc_init(FLItemStoreDecorator);
  *(void *)(qword_100022E90 + 8) = v3;

  _objc_release_x1();
}

id sub_100009B08(uint64_t a1)
{
  v2 = _FLLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Processing updating activities", v4, 2u);
  }

  return [*(id *)(a1 + 32) updateRepeatingActivityState];
}

void sub_100009BF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, _xpc_event_key_name)];
  id v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "XPC event (%@) handler called.", (uint8_t *)&v13, 0xCu);
  }

  id v6 = +[NSString stringWithUTF8String:"com.apple.springboard.lockstate"];
  unsigned int v7 = [v4 isEqual:v6];

  if (v7)
  {
    if (xpc_dictionary_get_uint64(v3, "_State") != 1) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  id v8 = +[NSString stringWithUTF8String:"com.apple.mobile.keybagd.lock_status"];
  unsigned int v9 = [v4 isEqual:v8];

  if (v9)
  {
    id v10 = +[FLEnvironment currentEnvironment];
    unsigned __int8 v11 = [v10 isUnlocked];

    if ((v11 & 1) == 0) {
LABEL_8:
    }
      [*(id *)(a1 + 32) _processPendingNotifications:0];
  }
  else
  {
    uint64_t v12 = _FLLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No special handling for XPC event: %@", (uint8_t *)&v13, 0xCu);
    }
  }
LABEL_12:
}

BOOL sub_100009DE8(id a1, FLFollowUpItem *a2, NSDictionary *a3)
{
  id v3 = a2;
  id v4 = [(FLFollowUpItem *)v3 notification];
  [v4 frequency];
  if (v5 > 0.0)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    id v6 = [(FLFollowUpItem *)v3 notification];
    if ([v6 shouldDeliverNotification])
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      id v8 = [(FLFollowUpItem *)v3 notification];
      if (v8)
      {
        unsigned int v9 = [(FLFollowUpItem *)v3 expirationDate];
        if (v9) {
          unsigned int v7 = [(FLFollowUpItem *)v3 isExpired] ^ 1;
        }
        else {
          LOBYTE(v7) = 0;
        }
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
  }

  return v7;
}

void sub_10000A080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000A0B0(void *a1, void *a2)
{
  id v33 = a2;
  id v3 = [v33 notification];
  [v3 frequency];
  if (v4 > 0.0)
  {
    double v5 = *(double *)(*(void *)(a1[4] + 8) + 24);
    id v6 = [v33 notification];
    [v6 frequency];
    if (v5 <= v7)
    {
      double v9 = *(double *)(*(void *)(a1[4] + 8) + 24);

      id v8 = v33;
      if (v9 != 0.0) {
        goto LABEL_7;
      }
    }
    else
    {

      id v8 = v33;
    }
    id v3 = [v8 notification];
    [v3 frequency];
    *(void *)(*(void *)(a1[4] + 8) + 24) = v10;
  }

  id v8 = v33;
LABEL_7:
  uint64_t v11 = *(void *)(a1[5] + 8);
  if (*(unsigned char *)(v11 + 24))
  {
    *(unsigned char *)(v11 + 24) = 1;
  }
  else
  {
    uint64_t v12 = [v33 expirationDate];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v12 != 0;

    id v8 = v33;
  }
  uint64_t v13 = [v8 expirationDate];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (v15)
    {
      id v16 = [v33 _midnightAdjustedDate];
      id v17 = [v15 compare:v16];

      if (v17 != (id)1) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v18 = [v33 _midnightAdjustedDate];
    uint64_t v19 = *(void *)(a1[6] + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
LABEL_16:
  uint64_t v21 = [v33 notification];
  [v21 frequency];
  if (v22 > 0.0)
  {
    v23 = [v33 notification];
    uint64_t v24 = [v23 previousNotificationActionDate];

    if (!v24) {
      goto LABEL_26;
    }
    id v25 = [v33 notification];
    id v26 = [v25 previousNotificationActionDate];
    id v27 = [v33 notification];
    [v27 frequency];
    uint64_t v21 = objc_msgSend(v26, "dateByAddingTimeInterval:");

    char v28 = +[NSDate date];
    if ([v21 compare:v28] == (id)1)
    {
      id v29 = *(void **)(*(void *)(a1[6] + 8) + 40);
      if (v29)
      {
        id v30 = [v29 compare:v21];

        if (v30 != (id)1) {
          goto LABEL_25;
        }
      }
      else
      {
      }
      uint64_t v31 = *(void *)(a1[6] + 8);
      id v32 = v21;
      char v28 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v32;
    }
  }
LABEL_25:

LABEL_26:
}

void sub_10000A538(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  double v5 = _FLLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (state == 2)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "XPC activity says that it's time post notifications!", buf, 2u);
    }

    if (!xpc_activity_set_state(v3, 4))
    {
      double v7 = _FLLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100010CEC(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    uint64_t v15 = *(void **)(a1 + 32);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000A6E8;
    v17[3] = &unk_10001CC60;
    uint64_t v18 = v3;
    [v15 _processPendingNotifications:v17];
    double v5 = v18;
  }
  else if (v6)
  {
    id v16 = +[NSNumber numberWithLong:state];
    *(_DWORD *)buf = 138412290;
    id v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "XPC activity registration complete. State: %@.", buf, 0xCu);
  }
}

void sub_10000A6E8(uint64_t a1, uint64_t a2)
{
  double v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = +[NSNumber numberWithUnsignedInteger:a2];
    int v14 = 138412290;
    uint64_t v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Posted %@ notifications", (uint8_t *)&v14, 0xCu);
  }
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    BOOL v6 = _FLLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100010D24(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

id sub_10000AAF8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _deliverNotificationsForItem:a2 forceDelivery:0];
}

id sub_10000ACBC(uint64_t a1, char a2)
{
  id result = [*(id *)(a1 + 32) shouldDeliverNotification];
  if ((result & 1) != 0 || (a2 & 1) != 0 || *(unsigned char *)(a1 + 56))
  {
    double v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 postNotificationForFollowUpItem:v6];
  }
  return result;
}

void sub_10000AF04(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(void **)(a1 + 32);
  double v5 = [v3 notification];
  uint64_t v6 = [v5 activateAction];
  uint64_t v7 = [v6 identifier];
  LODWORD(v4) = [v4 isEqualToString:v7];

  if (v4)
  {
    [*(id *)(a1 + 40) _handleActivateActionFromSource:*(void *)(a1 + 48) item:v3];
    goto LABEL_10;
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v3 notification];
  uint64_t v10 = [v9 clearAction];
  uint64_t v11 = [v10 identifier];
  if ([v8 isEqualToString:v11])
  {

LABEL_6:
    uint64_t v13 = *(void **)(a1 + 40);
    int v14 = [v3 notification];
    uint64_t v15 = [v14 clearAction];
    [v13 _handleExtensionAction:v15 forItem:v3];

    goto LABEL_10;
  }
  unsigned __int8 v12 = [*(id *)(a1 + 32) isEqualToString:@"com.apple.followup.clearActionIdentifier"];

  if (v12) {
    goto LABEL_6;
  }
  id v16 = _FLLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Activated notification, but it did not match identifier... bummer", v17, 2u);
  }

LABEL_10:
}

void sub_10000B1D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isHSA2LoginItem] & 1) == 0
    && ([v3 isHSA2PasswordResetItem] & 1) == 0)
  {
    [*(id *)(a1 + 32) _handleActivateActionFromSource:*(void *)(a1 + 40) item:v3];
  }
}

void sub_10000B460(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = +[FLTelemetryFactory sharedTelemetryController];
  [v4 captureActionForItem:v3 withEvent:1 source:*(void *)(a1 + 40)];

  double v5 = *(void **)(a1 + 32);
  id v7 = [v3 notification];
  uint64_t v6 = [v7 clearAction];
  [v5 _handleExtensionAction:v6 forItem:v3];
}

void sub_10000B634(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = +[FLTelemetryFactory sharedTelemetryController];
  [v4 captureActionForItem:v3 withEvent:1 source:*(void *)(a1 + 40)];

  double v5 = *(void **)(a1 + 32);
  id v7 = [v3 notification];
  uint64_t v6 = [v7 clearAction];
  [v5 _handleExtensionAction:v6 forItem:v3];
}

void sub_10000B8F4(uint64_t a1)
{
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_1000037F0;
  id v25 = sub_1000037C8;
  id v2 = objc_alloc((Class)FLHeadlessExtensionLoader);
  id v3 = [*(id *)(a1 + 32) extensionIdentifier];
  id v26 = [v2 initWithIdentifier:v3];

  double v4 = [(id)v22[5] remoteInterface];
  if (v4)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000BAB8;
    v15[3] = &unk_10001CD00;
    uint64_t v20 = *(void *)(a1 + 64);
    int8x16_t v14 = *(int8x16_t *)(a1 + 32);
    id v5 = (id)v14.i64[0];
    int8x16_t v16 = vextq_s8(v14, v14, 8uLL);
    id v17 = *(id *)(a1 + 48);
    uint64_t v19 = &v21;
    id v18 = *(id *)(a1 + 56);
    [v4 followUpPerformUpdateWithCompletionHandler:v15];
  }
  else
  {
    uint64_t v6 = _FLLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100010DC8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  _Block_object_dispose(&v21, 8);
}

void sub_10000BA9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000BAB8(uint64_t a1, uint64_t a2)
{
  if (a2 != 1 && *(void *)(a1 + 72) == 5) {
    [*(id *)(a1 + 32) _processFollowUpItemNotificationWithExtension:*(void *)(a1 + 40) activatedAction:*(void *)(a1 + 48)];
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_10000BD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000BD9C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = _FLLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100010E00((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  int8x16_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

void sub_10000C118(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100010E6C(a1, (uint64_t)v3, v4);
  }
}

void sub_10000C264(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000C3F4(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.followup.notifications", v3);
  id v2 = (void *)qword_100022EA0;
  qword_100022EA0 = (uint64_t)v1;
}

void sub_10000C534(id *a1)
{
  id v2 = [a1[4] notification];
  id v3 = [v2 options];
  unsigned int v4 = [v3 containsObject:FLNotificationOptionSpringboardAlert];

  if (v4)
  {
    id v5 = _FLLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to post springboard alert", buf, 2u);
    }

    [*((id *)a1[5] + 1) postNotificationForFollowUpItem:a1[4]];
  }
  else
  {
    [a1[5] addCategoryForFollowUpItem:a1[4]];
    uint64_t v6 = [a1[5] userNotificationRequestForFollowUpItem:a1[4]];
    if (v6)
    {
      uint64_t v7 = _FLLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Posting a followup notification: %@", buf, 0xCu);
      }

      uint64_t v8 = [a1[5] getNotificationCenterForItem:a1[4]];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000C720;
      v9[3] = &unk_10001CDC0;
      id v10 = a1[4];
      id v11 = a1[6];
      [v8 addNotificationRequest:v6 withCompletionHandler:v9];
    }
  }
}

void sub_10000C720(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UN: Notification request added with error %@", (uint8_t *)&v6, 0xCu);
  }

  if (!v3)
  {
    id v5 = +[NotificationController sharedController];
    [v5 updateNotificationDeliveryDateForItem:*(void *)(a1 + 32)];
  }
}

void sub_10000C924(uint64_t a1)
{
  id v2 = _FLLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking existing UNNotifications", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) notification];
  unsigned int v4 = [*(id *)(a1 + 40) getNotificationCenterForItem:*(void *)(a1 + 32)];
  id v5 = [v4 deliveredNotifications];
  *(void *)buf = 0;
  int8x16_t v14 = buf;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000CB54;
  v9[3] = &unk_10001CE10;
  id v10 = *(id *)(a1 + 32);
  id v6 = v3;
  id v11 = v6;
  uint64_t v12 = buf;
  [v5 enumerateObjectsUsingBlock:v9];
  id v7 = _FLLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v14[24]) {
      CFStringRef v8 = @"found";
    }
    else {
      CFStringRef v8 = @"not found";
    }
    *(_DWORD *)id v17 = 138412290;
    CFStringRef v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Existing UNNotification that is out of date: %@", v17, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  _Block_object_dispose(buf, 8);
}

void sub_10000CB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CB54(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v30 = [a2 request];
  id v6 = [v30 content];
  id v7 = [v30 identifier];
  CFStringRef v8 = [*(id *)(a1 + 32) uniqueIdentifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [v6 title];
    id v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (__CFString *)v10;
    }
    else {
      uint64_t v12 = &stru_10001D348;
    }
    uint64_t v13 = [*(id *)(a1 + 40) title];
    int8x16_t v14 = (void *)v13;
    if (v13) {
      CFStringRef v15 = (const __CFString *)v13;
    }
    else {
      CFStringRef v15 = &stru_10001D348;
    }
    if ([(__CFString *)v12 isEqualToString:v15])
    {
      uint64_t v16 = [v6 body];
      id v17 = (void *)v16;
      if (v16) {
        CFStringRef v18 = (__CFString *)v16;
      }
      else {
        CFStringRef v18 = &stru_10001D348;
      }
      uint64_t v19 = [*(id *)(a1 + 32) _informativeNotificationTextOrDate];
      uint64_t v20 = (void *)v19;
      if (v19) {
        CFStringRef v21 = (const __CFString *)v19;
      }
      else {
        CFStringRef v21 = &stru_10001D348;
      }
      if ([(__CFString *)v18 isEqualToString:v21])
      {
        uint64_t v22 = [v6 subtitle];
        uint64_t v23 = (void *)v22;
        if (v22) {
          CFStringRef v24 = (const __CFString *)v22;
        }
        else {
          CFStringRef v24 = &stru_10001D348;
        }
        uint64_t v25 = objc_msgSend(*(id *)(a1 + 40), "subtitleText", v24);
        id v26 = (void *)v25;
        if (v25) {
          CFStringRef v27 = (const __CFString *)v25;
        }
        else {
          CFStringRef v27 = &stru_10001D348;
        }
        unsigned __int8 v28 = [v29 isEqualToString:v27];

        if (v28) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
    }
LABEL_26:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_27:
    *a4 = 1;
  }
}

void sub_10000D138(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) getNotificationCenterForItem:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) tearDownNotificationsForFollowUpItem:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  CFStringRef v8 = v3;
  unsigned int v4 = +[NSArray arrayWithObjects:&v8 count:1];
  [v2 removePendingNotificationRequestsWithIdentifiers:v4];

  id v5 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v7 = v5;
  id v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v2 removeDeliveredNotificationsWithIdentifiers:v6];
}

uint64_t sub_10000DEC8(char a1)
{
  return a1 & 3;
}

void sub_10000E128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E148(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_unsafe_hasAlertForItem:", *(void *)(a1 + 40)))
  {
    id v2 = _FLLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Alert already visible, bailing...", v6, 2u);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _createUserNotificationWithItem:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v5 = *(void **)(*(void *)(a1 + 32) + 8);
    [v5 setObject:v4 forKeyedSubscript:v3];
  }
}

void sub_10000E334(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_10000E350(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _FLLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received response to alert for item with identifier: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    CFStringRef v8 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E534;
    block[3] = &unk_10001CBA8;
    block[4] = WeakRetained;
    id v16 = *(id *)(a1 + 32);
    dispatch_sync(v8, block);
    unsigned int v9 = [v7 delegate];
    uint64_t v10 = v9;
    if (a2) {
      goto LABEL_6;
    }
    [v9 provider:v7 didActivateNotificationForFollowUpItemWithIdentifier:*(void *)(a1 + 32) activationSource:5];
    id v11 = [*(id *)(a1 + 48) notification];
    uint64_t v12 = [v11 options];
    unsigned __int8 v13 = [v12 containsObject:FLNotificationOptionSpringboardAlertActionOnly];

    if ((v13 & 1) == 0)
    {
LABEL_6:
      uint64_t v17 = *(void *)(a1 + 32);
      int8x16_t v14 = +[NSArray arrayWithObjects:&v17 count:1];
      [v10 provider:v7 didClearNotificationsForFollowUpItemsWithIdentifiers:v14 activationSource:5];
    }
  }
}

id sub_10000E534(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10000E768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E794(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 uniqueIdentifier];
  unsigned int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    CFStringRef v8 = [*(id *)(a1 + 40) notification];
    unsigned __int8 v9 = [v8 shouldDeliverNotification];

    if ((v9 & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    *a4 = 1;
  }
}

id sub_10000E954(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v2) {
    CFUserNotificationCancel((CFUserNotificationRef)v2);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v4 removeObjectForKey:v3];
}

uint64_t sub_10000EA68(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 40), 0.0, &responseFlags);
  CFOptionFlags v2 = responseFlags & 3;
  uint64_t v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = +[NSNumber numberWithUnsignedLong:v2];
    *(_DWORD *)buf = 138412290;
    CFStringRef v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notification responded: %@", buf, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000F0B8(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = sqlite3_column_text(a2, 0);
  if (v3)
  {
    id v4 = +[NSString stringWithUTF8String:v3];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 integerValue];
  }
}

void sub_10000F2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

id sub_10000F2DC(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  dispatch_queue_t v1 = *(void **)(a1 + 32);
  if (*(uint64_t *)(v2 + 8) > 8) {
    return objc_msgSend(v1, "_migrateToCurrentFrom:");
  }
  else {
    return [v1 _createCleanCurrentDatabase];
  }
}

void sub_1000100EC(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  id v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting launch arguments conversion", buf, 2u);
  }

  if (a2 == 1)
  {
    if (sqlite3_value_type(*a3) == 5)
    {
      sqlite3_result_null(a1);
    }
    else
    {
      unsigned int v7 = sqlite3_value_blob(*a3);
      CFStringRef v8 = +[NSData dataWithBytes:v7 length:sqlite3_value_bytes(*a3)];
      uint64_t v15 = FLFollowUpActionLaunchArgumentsKey;
      id v16 = v8;
      unsigned __int8 v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      uint64_t v13 = 0;
      uint64_t v10 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:200 options:0 error:&v13];
      if (v13)
      {
        sqlite3_result_error(a1, "Bad data.", 1);
      }
      else
      {
        id v11 = _FLLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Row migration completed", buf, 2u);
        }

        id v12 = v10;
        sqlite3_result_blob64(a1, [v12 bytes], (sqlite3_uint64)objc_msgSend(v12, "length"), 0);
      }
    }
  }
  else
  {
    sqlite3_result_error(a1, "Improper number of arguments.", 1);
  }
}

uint64_t start()
{
  dispatch_queue_t v1 = objc_alloc_init(FollowUpServer);
  [(FollowUpServer *)v1 start];
  uint64_t v2 = +[NSRunLoop mainRunLoop];
  [v2 run];

  return 1;
}

void sub_100010574(os_log_t log)
{
  *(_WORD *)dispatch_queue_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating path for database...", v1, 2u);
}

void sub_1000105B8(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Database %@ wiped...", (uint8_t *)&v3, 0xCu);
}

void sub_100010634(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_1000106AC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@: Failed to insert follow up item into database", (uint8_t *)&v2, 0xCu);
}

void sub_100010724(unint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a2;
  __int16 v5 = 2048;
  double v6 = (double)a1 / 1000000000.0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "END [%llu] %fs: FetchDecoratedItems", (uint8_t *)&v3, 0x16u);
}

void sub_1000107BC(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%llu]: FetchDecoratedItems", (uint8_t *)&v2, 0xCu);
}

void sub_100010834()
{
  sub_100009988();
  sub_10000996C((void *)&_mh_execute_header, v0, v1, "Failed to insert item with error: %@", v2, v3, v4, v5, v6);
}

void sub_10001089C()
{
  sub_100009988();
  sub_10000996C((void *)&_mh_execute_header, v0, v1, "Failed to insert action with error: %@", v2, v3, v4, v5, v6);
}

void sub_100010904()
{
  sub_100009988();
  sub_10000996C((void *)&_mh_execute_header, v0, v1, "Failed to insert notification with error: %@", v2, v3, v4, v5, v6);
}

void sub_10001096C()
{
  sub_100009988();
  sub_10000996C((void *)&_mh_execute_header, v0, v1, "Failed to delete notification with error: %@", v2, v3, v4, v5, v6);
}

void sub_1000109D4()
{
  sub_100009988();
  sub_10000996C((void *)&_mh_execute_header, v0, v1, "Failed to delete action with error: %@", v2, v3, v4, v5, v6);
}

void sub_100010A3C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Item Fetched: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100010ABC(uint64_t a1, NSObject *a2, double a3)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "END [%llu] %fs: SelectItemsByIdentifier", (uint8_t *)&v3, 0x16u);
}

void sub_100010B40()
{
  sub_100009988();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "BEGIN [%llu]: SelectItemsByIdentifier", v1, 0xCu);
}

void sub_100010BB4()
{
  sub_100009988();
  sub_10000996C((void *)&_mh_execute_header, v0, v1, "Failed to select items with error: %@", v2, v3, v4, v5, v6);
}

void sub_100010C1C()
{
  sub_100009988();
  sub_10000996C((void *)&_mh_execute_header, v0, v1, "Failed to select notifications for item with error: %@", v2, v3, v4, v5, v6);
}

void sub_100010C84()
{
  sub_100009988();
  sub_10000996C((void *)&_mh_execute_header, v0, v1, "Failed to select actions for item with error: %@", v2, v3, v4, v5, v6);
}

void sub_100010CEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010D24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010D5C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010DC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010E00(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010E6C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@: XPC Error from client delegate while trying to send an HSA2 login activation callback - %@", (uint8_t *)&v4, 0x16u);
}

void sub_100010EF8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 uniqueIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Keeping %@ on lockscreen", (uint8_t *)&v4, 0xCu);
}

void sub_100010F90(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Bundle id %@ is not allowed as a notifying app id. Will use %@ instead", (uint8_t *)&v3, 0x16u);
}

void sub_100011018(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Looks like CFU regressed somewhere... you shuld never see this, please file radar.", v1, 2u);
}

void sub_10001105C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Please file radar, the following item notification is invalid: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000110D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to create migrator function", v1, 2u);
}

void sub_100011118(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating Current database with suffix", v1, 2u);
}

void sub_10001115C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Dropping all tables...", v1, 2u);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
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

uint64_t FLDaemonExportedInterface()
{
  return _FLDaemonExportedInterface();
}

uint64_t FLError()
{
  return _FLError();
}

uint64_t FLLoc()
{
  return _FLLoc();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _FLLogSystem()
{
  return __FLLogSystem();
}

uint64_t _FLLogSystemQuery()
{
  return __FLLogSystemQuery();
}

uint64_t _FLSignpostCreate()
{
  return __FLSignpostCreate();
}

uint64_t _FLSignpostGetNanoseconds()
{
  return __FLSignpostGetNanoseconds();
}

uint64_t _FLSignpostLogSystem()
{
  return __FLSignpostLogSystem();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_transaction_needs_more_time()
{
  return _os_transaction_needs_more_time();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return _sqlite3_changes(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return _sqlite3_create_function_v2(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal, xDestroy);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return _sqlite3_expanded_sql(pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

void sqlite3_free(void *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

void sqlite3_result_blob64(sqlite3_context *a1, const void *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return _sqlite3_value_blob(a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return _sqlite3_value_bytes(a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return _sqlite3_value_type(a1);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
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

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
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

id objc_msgSend__badgeQueue(void *a1, const char *a2, ...)
{
  return [a1 _badgeQueue];
}

id objc_msgSend__beginObservingLanguageChangeNotfication(void *a1, const char *a2, ...)
{
  return [a1 _beginObservingLanguageChangeNotfication];
}

id objc_msgSend__currentDataBaseError(void *a1, const char *a2, ...)
{
  return [a1 _currentDataBaseError];
}

id objc_msgSend__databaseQueue(void *a1, const char *a2, ...)
{
  return [a1 _databaseQueue];
}

id objc_msgSend__didChangeFollowUpItems(void *a1, const char *a2, ...)
{
  return [a1 _didChangeFollowUpItems];
}

id objc_msgSend__dropTables(void *a1, const char *a2, ...)
{
  return [a1 _dropTables];
}

id objc_msgSend__informativeNotificationTextOrDate(void *a1, const char *a2, ...)
{
  return [a1 _informativeNotificationTextOrDate];
}

id objc_msgSend__itemsWithEligibleNotifications(void *a1, const char *a2, ...)
{
  return [a1 _itemsWithEligibleNotifications];
}

id objc_msgSend__loadActionURL(void *a1, const char *a2, ...)
{
  return [a1 _loadActionURL];
}

id objc_msgSend__midnightAdjustedDate(void *a1, const char *a2, ...)
{
  return [a1 _midnightAdjustedDate];
}

id objc_msgSend__migrateFujitailToCurrent(void *a1, const char *a2, ...)
{
  return [a1 _migrateFujitailToCurrent];
}

id objc_msgSend__monitorUnlockEvents(void *a1, const char *a2, ...)
{
  return [a1 _monitorUnlockEvents];
}

id objc_msgSend__notificationDeliveryQueue(void *a1, const char *a2, ...)
{
  return [a1 _notificationDeliveryQueue];
}

id objc_msgSend__optionsData(void *a1, const char *a2, ...)
{
  return [a1 _optionsData];
}

id objc_msgSend__schemaVersion(void *a1, const char *a2, ...)
{
  return [a1 _schemaVersion];
}

id objc_msgSend__stopObservingLanguageChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 _stopObservingLanguageChangeNotification];
}

id objc_msgSend__telemetryProcessor(void *a1, const char *a2, ...)
{
  return [a1 _telemetryProcessor];
}

id objc_msgSend__userInfoData(void *a1, const char *a2, ...)
{
  return [a1 _userInfoData];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_activateAction(void *a1, const char *a2, ...)
{
  return [a1 activateAction];
}

id objc_msgSend_allApprovedItemsByBundle(void *a1, const char *a2, ...)
{
  return [a1 allApprovedItemsByBundle];
}

id objc_msgSend_allFollowUpItems(void *a1, const char *a2, ...)
{
  return [a1 allFollowUpItems];
}

id objc_msgSend_allPendingItems(void *a1, const char *a2, ...)
{
  return [a1 allPendingItems];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_badgeValue(void *a1, const char *a2, ...)
{
  return [a1 badgeValue];
}

id objc_msgSend_bindHandler(void *a1, const char *a2, ...)
{
  return [a1 bindHandler];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return [a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIconName(void *a1, const char *a2, ...)
{
  return [a1 bundleIconName];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_clearAction(void *a1, const char *a2, ...)
{
  return [a1 clearAction];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientIdentifier];
}

id objc_msgSend_collectionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 collectionIdentifier];
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

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return [a1 currentEnvironment];
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return [a1 database];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultActionURL(void *a1, const char *a2, ...)
{
  return [a1 defaultActionURL];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deliveredNotifications(void *a1, const char *a2, ...)
{
  return [a1 deliveredNotifications];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dismissAction(void *a1, const char *a2, ...)
{
  return [a1 dismissAction];
}

id objc_msgSend_displayStyle(void *a1, const char *a2, ...)
{
  return [a1 displayStyle];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_extensionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 extensionIdentifier];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_followUpExtensionSupportEnabled(void *a1, const char *a2, ...)
{
  return [a1 followUpExtensionSupportEnabled];
}

id objc_msgSend_followUpItemUserInfo(void *a1, const char *a2, ...)
{
  return [a1 followUpItemUserInfo];
}

id objc_msgSend_followUpItems(void *a1, const char *a2, ...)
{
  return [a1 followUpItems];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_groupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 groupIdentifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_informativeFooterText(void *a1, const char *a2, ...)
{
  return [a1 informativeFooterText];
}

id objc_msgSend_informativeText(void *a1, const char *a2, ...)
{
  return [a1 informativeText];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initWithoutDefaults(void *a1, const char *a2, ...)
{
  return [a1 initWithoutDefaults];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isExpired(void *a1, const char *a2, ...)
{
  return [a1 isExpired];
}

id objc_msgSend_isHSA2LoginItem(void *a1, const char *a2, ...)
{
  return [a1 isHSA2LoginItem];
}

id objc_msgSend_isHSA2PasswordResetItem(void *a1, const char *a2, ...)
{
  return [a1 isHSA2PasswordResetItem];
}

id objc_msgSend_isUnlocked(void *a1, const char *a2, ...)
{
  return [a1 isUnlocked];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_launchActionURL(void *a1, const char *a2, ...)
{
  return [a1 launchActionURL];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_migrateSchemeIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 migrateSchemeIfNecessary];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notificationCategories(void *a1, const char *a2, ...)
{
  return [a1 notificationCategories];
}

id objc_msgSend_oneDayTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 oneDayTimeInterval];
}

id objc_msgSend_openTransaction(void *a1, const char *a2, ...)
{
  return [a1 openTransaction];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_previousNotificationActionDate(void *a1, const char *a2, ...)
{
  return [a1 previousNotificationActionDate];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_queryExecutor(void *a1, const char *a2, ...)
{
  return [a1 queryExecutor];
}

id objc_msgSend_queryString(void *a1, const char *a2, ...)
{
  return [a1 queryString];
}

id objc_msgSend_recalculateActionDateToAccountForDelay(void *a1, const char *a2, ...)
{
  return [a1 recalculateActionDateToAccountForDelay];
}

id objc_msgSend_remoteInterface(void *a1, const char *a2, ...)
{
  return [a1 remoteInterface];
}

id objc_msgSend_representingBundlePath(void *a1, const char *a2, ...)
{
  return [a1 representingBundlePath];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rowHandler(void *a1, const char *a2, ...)
{
  return [a1 rowHandler];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedExtensionQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedExtensionQueue];
}

id objc_msgSend_sharedFilter(void *a1, const char *a2, ...)
{
  return [a1 sharedFilter];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedTelemetryController(void *a1, const char *a2, ...)
{
  return [a1 sharedTelemetryController];
}

id objc_msgSend_shouldAutomaticallyMigrate(void *a1, const char *a2, ...)
{
  return [a1 shouldAutomaticallyMigrate];
}

id objc_msgSend_shouldBackgroundDefaultAction(void *a1, const char *a2, ...)
{
  return [a1 shouldBackgroundDefaultAction];
}

id objc_msgSend_shouldDeliverNotification(void *a1, const char *a2, ...)
{
  return [a1 shouldDeliverNotification];
}

id objc_msgSend_shouldPersistWhenActivated(void *a1, const char *a2, ...)
{
  return [a1 shouldPersistWhenActivated];
}

id objc_msgSend_shouldPersistWhenDismissed(void *a1, const char *a2, ...)
{
  return [a1 shouldPersistWhenDismissed];
}

id objc_msgSend_showInSettings(void *a1, const char *a2, ...)
{
  return [a1 showInSettings];
}

id objc_msgSend_sqlID(void *a1, const char *a2, ...)
{
  return [a1 sqlID];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stressMode(void *a1, const char *a2, ...)
{
  return [a1 stressMode];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_subtitleText(void *a1, const char *a2, ...)
{
  return [a1 subtitleText];
}

id objc_msgSend_supportedBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 supportedBundleIdentifiers];
}

id objc_msgSend_supportedNotifyingAppIds(void *a1, const char *a2, ...)
{
  return [a1 supportedNotifyingAppIds];
}

id objc_msgSend_targetBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 targetBundleIdentifier];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_typeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 typeIdentifier];
}

id objc_msgSend_unentitledClients(void *a1, const char *a2, ...)
{
  return [a1 unentitledClients];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unlockActionLabel(void *a1, const char *a2, ...)
{
  return [a1 unlockActionLabel];
}

id objc_msgSend_updateRepeatingActivityState(void *a1, const char *a2, ...)
{
  return [a1 updateRepeatingActivityState];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_xpcConnectionForClientWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnectionForClientWithMachServiceName:");
}