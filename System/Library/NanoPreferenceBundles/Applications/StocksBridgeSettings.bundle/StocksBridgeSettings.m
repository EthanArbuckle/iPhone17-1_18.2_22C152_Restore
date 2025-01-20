uint64_t sub_1C10(uint64_t a1)
{
  uint64_t vars8;

  qword_D930 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) initPrivate];

  return _objc_release_x1();
}

uint64_t sub_20E8()
{
  qword_D940 = +[NSBundle bundleForClass:objc_opt_class()];

  return _objc_release_x1();
}

id stocks_bridge_log()
{
  if (qword_D958 != -1) {
    dispatch_once(&qword_D958, &stru_8370);
  }
  v0 = (void *)qword_D950;

  return v0;
}

void sub_24B0(id a1)
{
  qword_D950 = (uint64_t)os_log_create("com.apple.stocks.watchapp", "bridge");

  _objc_release_x1();
}

void sub_2A2C(uint64_t a1)
{
  id v2 = objc_alloc((Class)UIWatchKitExtensionRequestAction);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2B40;
  v6[3] = &unk_83C8;
  v6[4] = *(void *)(a1 + 32);
  id v3 = [v2 initWithRequest:&__NSDictionary0__struct withHandler:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2B50;
  v5[3] = &unk_83E8;
  v5[4] = *(void *)(a1 + 32);
  v4 = objc_retainBlock(v5);
  [*(id *)(a1 + 32) _launchAppWithBundleID:@"com.apple.stocks" withAction:v3 completion:v4];
}

id sub_2B40(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postNotification:@"com.apple.stocks.wake-watch-app"];
}

void sub_2B50(uint64_t a1, void *a2)
{
  id v3 = [a2 pid];
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) _createAssertionForTargetWithPid:v3];
    if (objc_msgSend(*(id *)(a1 + 32), "_acquire:")) {
      [*(id *)(a1 + 32) _invalidateAfterDelay:v5];
    }
  }
  else
  {
    v4 = stocks_sync_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_4D70(v4);
    }
  }
}

void sub_2E80(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v9 = 0;
  [v1 invalidateWithError:&v9];
  uint64_t v2 = v9;
  id v3 = stocks_sync_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      __int16 v8 = 0;
      id v5 = "Unable to release assertion.";
      v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    __int16 v7 = 0;
    id v5 = "Released assertion.";
    v6 = (uint8_t *)&v7;
    goto LABEL_6;
  }
}

void sub_31E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    __int16 v7 = stocks_sync_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_4DB4(a1, (uint64_t)v6, v7);
    }
    goto LABEL_4;
  }
  if ([v5 pid])
  {
    __int16 v7 = stocks_sync_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    int v16 = 138543362;
    uint64_t v17 = v10;
    v11 = "Successfully launched %{public}@.";
    goto LABEL_12;
  }
  __int16 v7 = stocks_sync_log();
  BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v12)
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138543362;
      uint64_t v17 = v15;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "FrontBoard indicates we successfully launched %{public}@, but we do not have a BSProcessHandle.", (uint8_t *)&v16, 0xCu);
    }
LABEL_4:

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v9 = *(void (**)(void))(v8 + 16);
LABEL_15:
      v9();
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v16 = 138543362;
    uint64_t v17 = v13;
    v11 = "FrontBoard indicates we successfully launched %{public}@, but we do not have a PID.";
LABEL_12:
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
  }
LABEL_13:

  uint64_t v14 = *(void *)(a1 + 40);
  if (v14)
  {
    uint64_t v9 = *(void (**)(void))(v14 + 16);
    goto LABEL_15;
  }
LABEL_16:
}

void sub_346C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 persistence];
  [v3 synchronize];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3804;
  block[3] = &unk_8330;
  id v6 = v2;
  id v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_3804(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateOfUpdate];
}

id sub_4000(uint64_t a1, void *a2)
{
  return [a2 _notifyDelegateOfUpdate];
}

id sub_4368(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 symbol];
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

id sub_49A4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = +[StocksSyncPreferenceKeys symbol];
  id v5 = [v3 objectForKeyedSubscript:v4];

  id v6 = [v2 isEqualToString:v5];
  return v6;
}

id stocks_sync_log()
{
  if (qword_D968 != -1) {
    dispatch_once(&qword_D968, &stru_84C0);
  }
  v0 = (void *)qword_D960;

  return v0;
}

void sub_4D2C(id a1)
{
  qword_D960 = (uint64_t)os_log_create("com.apple.stocks.watchapp", "sync");

  _objc_release_x1();
}

void sub_4D70(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to acquire assertion for target with PID of zero.", v1, 2u);
}

void sub_4DB4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error launching %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

void objc_release(id a1)
{
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

id objc_msgSend__addObservers(void *a1, const char *a2, ...)
{
  return [a1 _addObservers];
}

id objc_msgSend__removeObservers(void *a1, const char *a2, ...)
{
  return [a1 _removeObservers];
}

id objc_msgSend__setupDefaults(void *a1, const char *a2, ...)
{
  return [a1 _setupDefaults];
}

id objc_msgSend__stockDictionaries(void *a1, const char *a2, ...)
{
  return [a1 _stockDictionaries];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_appPreferences(void *a1, const char *a2, ...)
{
  return [a1 appPreferences];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bridgePreferences(void *a1, const char *a2, ...)
{
  return [a1 bridgePreferences];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_compactListName(void *a1, const char *a2, ...)
{
  return [a1 compactListName];
}

id objc_msgSend_companionDefaults(void *a1, const char *a2, ...)
{
  return [a1 companionDefaults];
}

id objc_msgSend_companyName(void *a1, const char *a2, ...)
{
  return [a1 companyName];
}

id objc_msgSend_complicationDisplayMode(void *a1, const char *a2, ...)
{
  return [a1 complicationDisplayMode];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStockSymbol(void *a1, const char *a2, ...)
{
  return [a1 defaultStockSymbol];
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return [a1 defaults];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_initPrivate(void *a1, const char *a2, ...)
{
  return [a1 initPrivate];
}

id objc_msgSend_isIndex(void *a1, const char *a2, ...)
{
  return [a1 isIndex];
}

id objc_msgSend_keysToSynchronize(void *a1, const char *a2, ...)
{
  return [a1 keysToSynchronize];
}

id objc_msgSend_launchPhoneApp(void *a1, const char *a2, ...)
{
  return [a1 launchPhoneApp];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listName(void *a1, const char *a2, ...)
{
  return [a1 listName];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_persistence(void *a1, const char *a2, ...)
{
  return [a1 persistence];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_shouldUseCompanyNameAsListName(void *a1, const char *a2, ...)
{
  return [a1 shouldUseCompanyNameAsListName];
}

id objc_msgSend_stocklist(void *a1, const char *a2, ...)
{
  return [a1 stocklist];
}

id objc_msgSend_symbol(void *a1, const char *a2, ...)
{
  return [a1 symbol];
}

id objc_msgSend_syncManager(void *a1, const char *a2, ...)
{
  return [a1 syncManager];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}