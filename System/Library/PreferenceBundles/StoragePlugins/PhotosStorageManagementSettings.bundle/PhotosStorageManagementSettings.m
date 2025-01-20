id sub_28A8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_opt_class();
    v4 = *(void *)(a1 + 32);
    v9 = 138543618;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Will present iCloud up-sell workflow", (uint8_t *)&v9, 0x16u);
  }

  v5 = objc_alloc_init((Class)ICQUICloudStorageOffersManager);
  v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setDelegate:");
  return [*(id *)(*(void *)(a1 + 32) + 24) beginFlowWithNavigationController:*(void *)(a1 + 40) modally:1];
}

void sub_29A4(uint64_t a1)
{
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> User cancelled insufficient iCloud storage alert", (uint8_t *)&v5, 0x16u);
  }
}

void sub_30D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_311C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  [*(id *)(a1 + 32) _updateStateForEnableCPLOptionTip];
  uint64_t v6 = PLUIGetLog();
  __int16 v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did enable iCloud Photos", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Failed to enable iCloud Photos: %@", buf, 0x20u);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_392C;
    v12[3] = &unk_8320;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
}

void sub_32E4(uint64_t a1, unsigned char *a2, double a3)
{
  LODWORD(a3) = -1.0;
  [*(id *)(a1 + 32) setActivationPercent:a3];
  [*(id *)(*(void *)(a1 + 40) + 40) enableOptimizedMode:1];
  *a2 = 1;
  LODWORD(v5) = 1.0;
  [*(id *)(a1 + 32) setActivationPercent:v5];
  [*(id *)(a1 + 32) setEventualGain:0];
  [*(id *)(a1 + 32) setImmediateGain:0];
  uint64_t v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did enable iCloud Photos optimized mode", (uint8_t *)&v9, 0x16u);
  }
}

void sub_33FC(uint64_t a1)
{
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> User cancelled confirmation to empty recently deleted items", (uint8_t *)&v8, 0x16u);
  }

  double v5 = +[UIApplication sharedApplication];
  uint64_t v6 = [v5 keyWindow];
  uint64_t v7 = [v6 rootViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];
}

void sub_3504(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Will empty recently deleted items", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_367C;
  v10[3] = &unk_83E8;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = v9;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  [v7 _performTipOperation:v10];
  objc_destroyWeak(&v13);
}

void sub_3654(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_3670(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentAlertController:*(void *)(a1 + 40)];
}

void sub_367C(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = -1.0;
  [*(id *)(a1 + 32) setActivationPercent:a3];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(v5 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3764;
  v7[3] = &unk_83C0;
  v7[4] = v5;
  id v8 = *(id *)(a1 + 32);
  v9[1] = a2;
  objc_copyWeak(v9, (id *)(a1 + 48));
  [v6 expungeRecentlyDeletedItemsWithCompletionBlock:v7];
  objc_destroyWeak(v9);
}

void sub_3750(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_3764(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = PLUIGetLog();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 32);
      int v21 = 138543618;
      uint64_t v22 = v8;
      __int16 v23 = 2048;
      uint64_t v24 = v9;
      __int16 v10 = "<%{public}@:%p> Succesfully emptied recently deleted items";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl(&dword_0, v11, v12, v10, (uint8_t *)&v21, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = *(void *)(a1 + 32);
    int v21 = 138543874;
    uint64_t v22 = v14;
    __int16 v23 = 2048;
    uint64_t v24 = v15;
    __int16 v25 = 2112;
    id v26 = v5;
    __int16 v10 = "<%{public}@:%p> Failed to empty recently deleted items: %@";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 32;
    goto LABEL_6;
  }

  LODWORD(v16) = 1.0;
  [*(id *)(a1 + 40) setActivationPercent:v16];
  [*(id *)(a1 + 40) setEventualGain:0];
  [*(id *)(a1 + 40) setImmediateGain:0];
  [*(id *)(a1 + 40) setSize:0];
  uint64_t v17 = PULocalizedString();
  [*(id *)(a1 + 40) setInfoText:v17];
  **(unsigned char **)(a1 + 56) = 1;
  __int16 v18 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained(v18);
  [WeakRetained _refreshSizeGainForICPLEnableTip];

  id v20 = objc_loadWeakRetained(v18);
  [v20 notifyUsageChanged];
}

id sub_392C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleFailureToEnableCPLWithError:*(void *)(a1 + 40)];
}

uint64_t sub_3A90(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  do
    uint64_t result = usleep(0x7A120u);
  while (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  return result;
}

void sub_3C1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = objc_alloc_init((Class)STStorageActionTipItem);
  uint64_t v4 = [v3 originalMetadataProperties];
  objc_msgSend(v7, "setSize:", objc_msgSend(v4, "originalFilesize"));
  [v7 setRecoverable:*(unsigned __int8 *)(a1 + 40)];
  id v5 = [v3 modificationDate];
  [v7 setLastUsedDate:v5];

  uint64_t v6 = [v3 creationDate];

  [v7 setCreatedDate:v6];
  [*(id *)(a1 + 32) addObject:v7];
}

id sub_3EF0(uint64_t a1, void *a2)
{
  id v3 = [a2 unsignedLongLongValue];
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 setImmediateGain:v3];
}

id sub_455C(uint64_t a1, void *a2)
{
  id v3 = [a2 unsignedLongLongValue];
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 setImmediateGain:v3];
}

void sub_4EC0(id a1)
{
  qword_CB60 = [@"com.apple.mobileslideshow" stringByAppendingString:@"PhotosStorageManagementSettings"];

  _objc_release_x1();
}

id sub_4FB8(uint64_t a1, void *a2)
{
  id v3 = [a2 unsignedLongLongValue];
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 setImmediateGain:v3];
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t PLUIGetLog()
{
  return _PLUIGetLog();
}

uint64_t PULocalizedString()
{
  return _PULocalizedString();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend__hasCompletedCPLEnablement(void *a1, const char *a2, ...)
{
  return [a1 _hasCompletedCPLEnablement];
}

id objc_msgSend__refreshSizeGainForICPLEnableTip(void *a1, const char *a2, ...)
{
  return [a1 _refreshSizeGainForICPLEnableTip];
}

id objc_msgSend__tipForEnableCPLOption(void *a1, const char *a2, ...)
{
  return [a1 _tipForEnableCPLOption];
}

id objc_msgSend__tipForExpungeRecentlyDeletedItemsOption(void *a1, const char *a2, ...)
{
  return [a1 _tipForExpungeRecentlyDeletedItemsOption];
}

id objc_msgSend__tipForOptimizePhotosOption(void *a1, const char *a2, ...)
{
  return [a1 _tipForOptimizePhotosOption];
}

id objc_msgSend__tipForPhotosAction(void *a1, const char *a2, ...)
{
  return [a1 _tipForPhotosAction];
}

id objc_msgSend__tipForReviewDuplicatesAction(void *a1, const char *a2, ...)
{
  return [a1 _tipForReviewDuplicatesAction];
}

id objc_msgSend__tipForReviewLargeVideoAction(void *a1, const char *a2, ...)
{
  return [a1 _tipForReviewLargeVideoAction];
}

id objc_msgSend__tipForReviewScreenshotsAction(void *a1, const char *a2, ...)
{
  return [a1 _tipForReviewScreenshotsAction];
}

id objc_msgSend__tipOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 _tipOperationQueue];
}

id objc_msgSend__updateStateForEnableCPLOptionTip(void *a1, const char *a2, ...)
{
  return [a1 _updateStateForEnableCPLOptionTip];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cplStatus(void *a1, const char *a2, ...)
{
  return [a1 cplStatus];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_enableCPLOptionTip(void *a1, const char *a2, ...)
{
  return [a1 enableCPLOptionTip];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_initialSyncDate(void *a1, const char *a2, ...)
{
  return [a1 initialSyncDate];
}

id objc_msgSend_isCPLEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCPLEnabled];
}

id objc_msgSend_isCPLInExitMode(void *a1, const char *a2, ...)
{
  return [a1 isCPLInExitMode];
}

id objc_msgSend_isDeletableItemsInTrash(void *a1, const char *a2, ...)
{
  return [a1 isDeletableItemsInTrash];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return [a1 isNetworkReachable];
}

id objc_msgSend_isOptimizedModeOn(void *a1, const char *a2, ...)
{
  return [a1 isOptimizedModeOn];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return [a1 keyWindow];
}

id objc_msgSend_librarySpecificFetchOptions(void *a1, const char *a2, ...)
{
  return [a1 librarySpecificFetchOptions];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_notifyUsageChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyUsageChanged];
}

id objc_msgSend_originalFilesize(void *a1, const char *a2, ...)
{
  return [a1 originalFilesize];
}

id objc_msgSend_originalMetadataProperties(void *a1, const char *a2, ...)
{
  return [a1 originalMetadataProperties];
}

id objc_msgSend_photoLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 photoLibraryURL];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedNetworkObserver];
}

id objc_msgSend_shouldHideCPL(void *a1, const char *a2, ...)
{
  return [a1 shouldHideCPL];
}

id objc_msgSend_significantItems(void *a1, const char *a2, ...)
{
  return [a1 significantItems];
}

id objc_msgSend_sizeForRecentlyDeletedItems(void *a1, const char *a2, ...)
{
  return [a1 sizeForRecentlyDeletedItems];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_totalReclaimableSizeFromPurgingVideoClips(void *a1, const char *a2, ...)
{
  return [a1 totalReclaimableSizeFromPurgingVideoClips];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}