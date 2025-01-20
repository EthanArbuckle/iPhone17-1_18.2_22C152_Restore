void sub_10000190C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001928(uint64_t a1, int a2)
{
  if (a2)
  {
    PUPickerAssetPreparationOptionsFromAdditionalSelectionState();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _finishPicking:*(void *)(a1 + 40) withPreparationOptions:v6];
  }
  else
  {
    v4 = [*(id *)(a1 + 40) objects];
    PXMap();
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v5 = [WeakRetained pickerCoordinator];
    [v5 deselectAssetsWithIdentifiers:v6];
  }
}

id sub_1000019E4(id a1, PHAsset *a2)
{
  return [(PHAsset *)a2 localIdentifier];
}

void sub_100001AD8(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) loadingStatusManager];
  v2 = [*(id *)(a1 + 40) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"PhotosMessagesExtensionProgressTrackingIDKey"];
  [*(id *)(a1 + 40) fractionCompleted];
  objc_msgSend(v4, "didUpdateLoadOperationWithTrackingID:withProgress:", v3);
}

void sub_100001DF8(id a1, PXMutableMessagesExtensionViewModel *a2)
{
}

id sub_100001F60(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v2 = 10;
  }
  else {
    uint64_t v2 = 15;
  }
  return [a2 setEdgesWithoutContentMargins:v2];
}

void sub_100002024(id a1, PXMutableMessagesExtensionViewModel *a2)
{
  uint64_t v2 = a2;
  [(PXMutableMessagesExtensionViewModel *)v2 setSelectedMessageText:0];
  [(PXMutableMessagesExtensionViewModel *)v2 setSelectedMessageDate:0];
}

void sub_100002154(id a1, PXMutableMessagesExtensionViewModel *a2)
{
  uint64_t v2 = a2;
  [(PXMutableMessagesExtensionViewModel *)v2 clearSelection];
  [(PXMutableMessagesExtensionViewModel *)v2 setDrawerActive:0];
}

void sub_1000023AC(id a1, PXMutableMessagesExtensionViewModel *a2)
{
}

void sub_100002668(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSelectedMessageText:v3];
  [v4 setSelectedMessageDate:*(void *)(a1 + 40)];
}

void sub_1000028D8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 url];
  [v5 setSelectedURL:v4];

  [v5 setSelectedActivityType:*(void *)(a1 + 40)];
}

void sub_100002DFC(id a1, PXMutableMessagesExtensionViewModel *a2)
{
}

void sub_100002E7C(id a1, PXMutableMessagesExtensionViewModel *a2)
{
}

id sub_100002F34(uint64_t a1, void *a2)
{
  return [a2 setPresentedViewController:*(void *)(a1 + 32)];
}

void sub_10000324C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Unstaging complete: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000352C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Staging complete: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100003908(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100003924(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 300000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000039E0;
  v3[3] = &unk_10000C780;
  char v5 = *(unsigned char *)(a1 + 40);
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
}

void sub_1000039E0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained dismiss];
  }
}

void sub_100003DDC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

uint64_t sub_100003E24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100003E38(id a1, UIViewController *a2)
{
  uint64_t v3 = a2;
  [(UIViewController *)v3 willMoveToParentViewController:0];
  dispatch_time_t v2 = [(UIViewController *)v3 view];
  [v2 removeFromSuperview];

  [(UIViewController *)v3 removeFromParentViewController];
}

void sub_100004094(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

void sub_100004A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004A9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

id sub_100004AA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSSet setWithObject:objc_opt_class()];
  id v11 = 0;
  char v5 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v4 fromData:v3 error:&v11];

  id v6 = v11;
  if (v5)
  {
    v7 = [v5 mutableCopy];
    v8 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
    [v7 setSidecarObject:v8 forKey:AEPackageTransportSidecarProposedOrderKey];

    id v9 = [v7 copy];
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v7 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to unarchive draft asset archive with error: %@", buf, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

void sub_100004C58(id a1, PUMutablePickerConfiguration *a2)
{
}

NSString *__cdecl sub_100004C64(id a1, AEAssetPackage *a2)
{
  dispatch_time_t v2 = [(AEAssetPackage *)a2 identifier];
  id v3 = +[PHAsset localIdentifierWithUUID:v2];

  return (NSString *)v3;
}

void sub_100004E5C(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = (CGContext *)[v9 CGContext];
  id v4 = [v9 format];
  if (*(unsigned char *)(a1 + 40))
  {
    char v5 = +[UIColor redColor];
  }
  else
  {
    id v6 = +[UIColor systemBackgroundColor];
    v7 = [*(id *)(a1 + 32) traitCollection];
    char v5 = [v6 resolvedColorWithTraitCollection:v7];
  }
  id v8 = v5;
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v8 CGColor]);

  [v4 bounds];
  objc_msgSend(v9, "fillRect:");
}

void sub_100005054(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _contentReadyForDisplayTimeout];
}

void sub_100005708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
  objc_destroyWeak(v36);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005730(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) expectedPackageIdentifiers];
  unsigned int v10 = [v9 containsObject:*(void *)(a1 + 40)];

  if (!v10) {
    goto LABEL_19;
  }
  if (v7)
  {
    id v11 = [v7 mutableCopy];
    [v11 setMediaOrigin:4];
    v12 = *(void **)(a1 + 32);
    id v13 = [v7 identifier];
    id v14 = [v12 proposedStagedIndexForPendingIdentifier:v13];

    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = +[NSNumber numberWithUnsignedInteger:v14];
      [v11 setSidecarObject:v15 forKey:AEPackageTransportSidecarProposedOrderKey];
    }
    [*(id *)(a1 + 32) stagePackage:v11];

    goto LABEL_13;
  }
  if (v8)
  {
    [*(id *)(a1 + 32) reportError:v8];
LABEL_12:
    [*(id *)(a1 + 32) removePendingPackageIdentifier:*(void *)(a1 + 40)];
    goto LABEL_13;
  }
  if ((a4 & 1) == 0)
  {
    v16 = PLAssetExplorerGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Nil package returned from package generator with no error!", v26, 2u);
    }

    goto LABEL_12;
  }
LABEL_13:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v18 = [WeakRetained loadingProgresses];

  v19 = [v18 objectForKey:*(void *)(a1 + 40)];
  v20 = v19;
  if (v19)
  {
    v21 = [v19 userInfo];
    v22 = [v21 objectForKeyedSubscript:@"PhotosMessagesExtensionProgressTrackingIDKey"];

    v23 = *(void **)(a1 + 48);
    if (a4) {
      [v23 didCancelLoadOperationWithTrackingID:v22];
    }
    else {
      [v23 didCompleteLoadOperationWithTrackingID:v22 withSuccess:v7 != 0 error:v8];
    }
    uint64_t v24 = *(void *)(a1 + 56);
    v25 = NSStringFromSelector("fractionCompleted");
    [v20 removeObserver:v24 forKeyPath:v25];

    [v18 removeObjectForKey:*(void *)(a1 + 40)];
  }

LABEL_19:
}

NSString *__cdecl sub_100005974(id a1, PHAsset *a2)
{
  dispatch_time_t v2 = [(PHAsset *)a2 localIdentifier];
  id v3 = +[PHObject uuidFromLocalIdentifier:v2];

  return (NSString *)v3;
}

uint64_t sub_100005B50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005B64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005DEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = PLSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to stage message with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    char v5 = *(unsigned char **)(a1 + 32);
    if (v5[40]) {
      [v5 dismiss];
    }
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"DidStageBubble" object:0];
  }
}

void sub_100005EE0(id a1, NSError *a2)
{
  dispatch_time_t v2 = a2;
  if (v2)
  {
    id v3 = PLSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      char v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to direct send message with error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

id sub_1000062FC(uint64_t a1, void *a2)
{
  return [a2 setRecipients:*(void *)(a1 + 32)];
}

void sub_100006628(id a1)
{
  id v1 = +[PXPreloadScheduler sharedScheduler];
  [v1 scheduleDeferredTaskWithQoS:1 block:&stru_10000C488];
}

void sub_10000667C(id a1)
{
}

void sub_1000066FC(id a1)
{
  id v1 = +[NSBundle mainBundle];
  +[CPAnalytics setupWithConfigurationFilename:@"CPAnalyticsConfig-PhotosMessagesApp" inBundle:v1];

  dispatch_time_t v2 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
  +[CPAnalytics setupSystemPropertyProvidersForLibrary:v2];

  +[CPAnalytics startAppTracking];
  +[CPAnalytics startViewTracking];

  +[UIApplication pu_prepareCPAnalytics];
}

void sub_1000067CC(id a1)
{
  +[PXSettings setSuiteName:@"com.apple.mobileslideshow"];
  id v1 = +[NSUserDefaults standardUserDefaults];
  [v1 removeObjectForKey:@"UIBarsApplyChromelessEverywhere"];

  _PXAsynchronousAddDragAndDropFileProviderDomain();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return _NSStringFromUIEdgeInsets(insets);
}

uint64_t PFStringWithValidatedFormat()
{
  return _PFStringWithValidatedFormat();
}

uint64_t PLAssetExplorerGetLog()
{
  return _PLAssetExplorerGetLog();
}

uint64_t PLSharingGetLog()
{
  return _PLSharingGetLog();
}

uint64_t PLUIGetLog()
{
  return _PLUIGetLog();
}

uint64_t PUPickerAssetPreparationOptionsFromAdditionalSelectionState()
{
  return _PUPickerAssetPreparationOptionsFromAdditionalSelectionState();
}

uint64_t PXAssertGetLog()
{
  return _PXAssertGetLog();
}

uint64_t PXCMMTitleAndSubtitleForAssetCollection()
{
  return _PXCMMTitleAndSubtitleForAssetCollection();
}

uint64_t PXExpungeMomentShareForURL()
{
  return _PXExpungeMomentShareForURL();
}

uint64_t PXFetchAssetCollectionForCMMShareURL()
{
  return _PXFetchAssetCollectionForCMMShareURL();
}

uint64_t PXIncrementShareCountForAssets()
{
  return _PXIncrementShareCountForAssets();
}

uint64_t PXLocalizedAssetCountForUsage()
{
  return _PXLocalizedAssetCountForUsage();
}

uint64_t PXLocalizedString()
{
  return _PXLocalizedString();
}

uint64_t PXMap()
{
  return _PXMap();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void abort(void)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_retainAutorelease(id a1)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t plsGreenTeaEnabled()
{
  return _plsGreenTeaEnabled();
}

uint64_t plslogGreenTea()
{
  return _plslogGreenTea();
}

uint64_t px_dispatch_on_main_queue()
{
  return _px_dispatch_on_main_queue();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend__contentReadyForDisplayTimeout(void *a1, const char *a2, ...)
{
  return [a1 _contentReadyForDisplayTimeout];
}

id objc_msgSend__isDrawerViewController(void *a1, const char *a2, ...)
{
  return [a1 _isDrawerViewController];
}

id objc_msgSend__setNeedsUpdateOfSupportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return [a1 _setNeedsUpdateOfSupportedInterfaceOrientations];
}

id objc_msgSend__updatePresentedViewController(void *a1, const char *a2, ...)
{
  return [a1 _updatePresentedViewController];
}

id objc_msgSend_activeConversation(void *a1, const char *a2, ...)
{
  return [a1 activeConversation];
}

id objc_msgSend_aggregateMediaType(void *a1, const char *a2, ...)
{
  return [a1 aggregateMediaType];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetCollectionType(void *a1, const char *a2, ...)
{
  return [a1 assetCollectionType];
}

id objc_msgSend_assetCount(void *a1, const char *a2, ...)
{
  return [a1 assetCount];
}

id objc_msgSend_beginGenerating(void *a1, const char *a2, ...)
{
  return [a1 beginGenerating];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearSelection(void *a1, const char *a2, ...)
{
  return [a1 clearSelection];
}

id objc_msgSend_confidentialityCheckRequired(void *a1, const char *a2, ...)
{
  return [a1 confidentialityCheckRequired];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_directSendMessages(void *a1, const char *a2, ...)
{
  return [a1 directSendMessages];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_draftAssetArchives(void *a1, const char *a2, ...)
{
  return [a1 draftAssetArchives];
}

id objc_msgSend_expectedPackageIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 expectedPackageIdentifiers];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_fetchedObjects(void *a1, const char *a2, ...)
{
  return [a1 fetchedObjects];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_invalidAddressString(void *a1, const char *a2, ...)
{
  return [a1 invalidAddressString];
}

id objc_msgSend_isDrawerActive(void *a1, const char *a2, ...)
{
  return [a1 isDrawerActive];
}

id objc_msgSend_isPending(void *a1, const char *a2, ...)
{
  return [a1 isPending];
}

id objc_msgSend_isSender(void *a1, const char *a2, ...)
{
  return [a1 isSender];
}

id objc_msgSend_librarySpecificFetchOptions(void *a1, const char *a2, ...)
{
  return [a1 librarySpecificFetchOptions];
}

id objc_msgSend_loadingProgresses(void *a1, const char *a2, ...)
{
  return [a1 loadingProgresses];
}

id objc_msgSend_loadingStatusManager(void *a1, const char *a2, ...)
{
  return [a1 loadingStatusManager];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_localParticipantIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localParticipantIdentifier];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_objects(void *a1, const char *a2, ...)
{
  return [a1 objects];
}

id objc_msgSend_orderedStagedIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 orderedStagedIdentifiers];
}

id objc_msgSend_photoLibrary(void *a1, const char *a2, ...)
{
  return [a1 photoLibrary];
}

id objc_msgSend_pickerCoordinator(void *a1, const char *a2, ...)
{
  return [a1 pickerCoordinator];
}

id objc_msgSend_preselectedAssetIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 preselectedAssetIdentifiers];
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return [a1 presentationStyle];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_preview(void *a1, const char *a2, ...)
{
  return [a1 preview];
}

id objc_msgSend_previewImageData(void *a1, const char *a2, ...)
{
  return [a1 previewImageData];
}

id objc_msgSend_previouslySelectedObjectIDs(void *a1, const char *a2, ...)
{
  return [a1 previouslySelectedObjectIDs];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_recipientAddresses(void *a1, const char *a2, ...)
{
  return [a1 recipientAddresses];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return [a1 recipients];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requestResize(void *a1, const char *a2, ...)
{
  return [a1 requestResize];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_selectedActivityType(void *a1, const char *a2, ...)
{
  return [a1 selectedActivityType];
}

id objc_msgSend_selectedMessage(void *a1, const char *a2, ...)
{
  return [a1 selectedMessage];
}

id objc_msgSend_selectedURL(void *a1, const char *a2, ...)
{
  return [a1 selectedURL];
}

id objc_msgSend_senderParticipantIdentifier(void *a1, const char *a2, ...)
{
  return [a1 senderParticipantIdentifier];
}

id objc_msgSend_setReadyForDisplay(void *a1, const char *a2, ...)
{
  return [a1 setReadyForDisplay];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedRootViewModel(void *a1, const char *a2, ...)
{
  return [a1 sharedRootViewModel];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAppTracking(void *a1, const char *a2, ...)
{
  return [a1 startAppTracking];
}

id objc_msgSend_startViewTracking(void *a1, const char *a2, ...)
{
  return [a1 startViewTracking];
}

id objc_msgSend_supportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return [a1 supportedInterfaceOrientations];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemPhotoLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 systemPhotoLibraryURL];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_useDebugColors(void *a1, const char *a2, ...)
{
  return [a1 useDebugColors];
}

id objc_msgSend_useNavBarAnimatedTransition(void *a1, const char *a2, ...)
{
  return [a1 useNavBarAnimatedTransition];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return [a1 yellowColor];
}