id nanophotos_log_NanoPhotosCore()
{
  void *v0;
  uint64_t vars8;

  if (qword_14080 != -1) {
    dispatch_once(&qword_14080, &stru_C2A0);
  }
  v0 = (void *)qword_14078;

  return v0;
}

void sub_4A04(id a1)
{
  qword_14078 = (uint64_t)os_log_create("com.apple.NanoPhotos", "NanoPhotosCore");

  _objc_release_x1();
}

id nanophotos_log_NanoPhotosUI()
{
  if (qword_14090 != -1) {
    dispatch_once(&qword_14090, &stru_C2C0);
  }
  v0 = (void *)qword_14088;

  return v0;
}

void sub_4A9C(id a1)
{
  qword_14088 = (uint64_t)os_log_create("com.apple.NanoPhotos", "NanoPhotosUI");

  _objc_release_x1();
}

id nanophotos_log_sync()
{
  if (qword_140A0 != -1) {
    dispatch_once(&qword_140A0, &stru_C2E0);
  }
  v0 = (void *)qword_14098;

  return v0;
}

void sub_4B34(id a1)
{
  qword_14098 = (uint64_t)os_log_create("com.apple.NanoPhotos", "sync");

  _objc_release_x1();
}

id nanophotos_log_sync_oversize()
{
  if (qword_140B0 != -1) {
    dispatch_once(&qword_140B0, &stru_C300);
  }
  v0 = (void *)qword_140A8;

  return v0;
}

void sub_4BCC(id a1)
{
  qword_140A8 = (uint64_t)os_log_create("com.apple.NanoPhotos", "sync_oversize");

  _objc_release_x1();
}

id nanophotos_log_bridge()
{
  if (qword_140C0 != -1) {
    dispatch_once(&qword_140C0, &stru_C320);
  }
  v0 = (void *)qword_140B8;

  return v0;
}

void sub_4C64(id a1)
{
  qword_140B8 = (uint64_t)os_log_create("com.apple.NanoPhotos", "bridge");

  _objc_release_x1();
}

id nanophotos_log_Settings()
{
  if (qword_140D0 != -1) {
    dispatch_once(&qword_140D0, &stru_C340);
  }
  v0 = (void *)qword_140C8;

  return v0;
}

void sub_4CFC(id a1)
{
  qword_140C8 = (uint64_t)os_log_create("com.apple.NanoPhotos", "Settings");

  _objc_release_x1();
}

void sub_51E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_520C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncedAlbumIdentifierPreferenceChanged];
}

void sub_5578(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) _allowsSharedAlbumSelection] & 1) != 0
    || [v3 assetCollectionSubtype] != (char *)&stru_20.flags + 1)
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

id sub_58A0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isViewLoaded];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _reloadData];
  }
  return result;
}

id _npto_albumCount(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)PHFetchOptions);
  [v2 setWantsIncrementalChangeDetails:0];
  id v3 = +[PHAsset fetchAssetsInAssetCollection:v1 options:v2];

  id v4 = [v3 countOfAssetsWithMediaType:1];
  return v4;
}

void sub_69A4(id a1)
{
  qword_140E8 = objc_alloc_init(NPTOBridgeInterfaceTheme);

  _objc_release_x1();
}

void sub_6A68()
{
  uint64_t v0 = +[PUInterfaceManager currentTheme];
  id v1 = (void *)qword_140D8;
  qword_140D8 = v0;

  id v2 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v2, "currentTheme");
  id v4 = (objc_class *)objc_opt_class();
  v5 = class_getClassMethod(v4, "sharedInstance");

  method_exchangeImplementations(ClassMethod, v5);
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

uint64_t BPSCellHightlightColor()
{
  return _BPSCellHightlightColor();
}

uint64_t BPSDetailTextColor()
{
  return _BPSDetailTextColor();
}

uint64_t BPSForegroundColor()
{
  return _BPSForegroundColor();
}

uint64_t BPSSeparatorColor()
{
  return _BPSSeparatorColor();
}

uint64_t BPSTextColor()
{
  return _BPSTextColor();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

Method class_getClassMethod(Class cls, SEL name)
{
  return _class_getClassMethod(cls, name);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void method_exchangeImplementations(Method m1, Method m2)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

id objc_msgSend__albumsSectionTitle(void *a1, const char *a2, ...)
{
  return [a1 _albumsSectionTitle];
}

id objc_msgSend__allowsRecentAlbumSelection(void *a1, const char *a2, ...)
{
  return [a1 _allowsRecentAlbumSelection];
}

id objc_msgSend__allowsSharedAlbumSelection(void *a1, const char *a2, ...)
{
  return [a1 _allowsSharedAlbumSelection];
}

id objc_msgSend__device(void *a1, const char *a2, ...)
{
  return [a1 _device];
}

id objc_msgSend__isTinkerPaired(void *a1, const char *a2, ...)
{
  return [a1 _isTinkerPaired];
}

id objc_msgSend__mainTableView(void *a1, const char *a2, ...)
{
  return [a1 _mainTableView];
}

id objc_msgSend__noneAlbumName(void *a1, const char *a2, ...)
{
  return [a1 _noneAlbumName];
}

id objc_msgSend__preferencesAccessor(void *a1, const char *a2, ...)
{
  return [a1 _preferencesAccessor];
}

id objc_msgSend__reloadData(void *a1, const char *a2, ...)
{
  return [a1 _reloadData];
}

id objc_msgSend__syncedAlbumIdentifierPreferenceChanged(void *a1, const char *a2, ...)
{
  return [a1 _syncedAlbumIdentifierPreferenceChanged];
}

id objc_msgSend__title(void *a1, const char *a2, ...)
{
  return [a1 _title];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_activePairingDevice(void *a1, const char *a2, ...)
{
  return [a1 activePairingDevice];
}

id objc_msgSend_albumsSection(void *a1, const char *a2, ...)
{
  return [a1 albumsSection];
}

id objc_msgSend_albumsSections(void *a1, const char *a2, ...)
{
  return [a1 albumsSections];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetCollectionSubtype(void *a1, const char *a2, ...)
{
  return [a1 assetCollectionSubtype];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentTheme(void *a1, const char *a2, ...)
{
  return [a1 currentTheme];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_indexPathsForVisibleRows(void *a1, const char *a2, ...)
{
  return [a1 indexPathsForVisibleRows];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_markPaneAsSkipped(void *a1, const char *a2, ...)
{
  return [a1 markPaneAsSkipped];
}

id objc_msgSend_miniFlowDelegate(void *a1, const char *a2, ...)
{
  return [a1 miniFlowDelegate];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sectionHeaderHeight(void *a1, const char *a2, ...)
{
  return [a1 sectionHeaderHeight];
}

id objc_msgSend_setupFlowUserInfo(void *a1, const char *a2, ...)
{
  return [a1 setupFlowUserInfo];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedPhotoLibrary];
}

id objc_msgSend_spec(void *a1, const char *a2, ...)
{
  return [a1 spec];
}

id objc_msgSend_stackSize(void *a1, const char *a2, ...)
{
  return [a1 stackSize];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_topPlaceholdersSection(void *a1, const char *a2, ...)
{
  return [a1 topPlaceholdersSection];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return [a1 visibleCells];
}