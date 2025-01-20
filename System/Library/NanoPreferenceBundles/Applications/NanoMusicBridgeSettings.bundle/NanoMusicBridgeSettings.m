void sub_52C8(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t vars8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained _removeExpiredEnabledStates];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }
}

BOOL sub_57E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKey:v3];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 >= 0.0)
  {
    v8 = sub_CF20(13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[KeepLocalTransientState] Expiring enable state for model object: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7 >= 0.0;
}

void sub_6A68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 propertyForKey:@"NMBSpecifierRecommendationKey"];
  v4 = [v7 identifier];
  unsigned int v5 = [v4 isEqualToString:NMSRecommendationRecentMusicIdentifier];

  uint64_t v6 = 32;
  if (v5) {
    uint64_t v6 = 40;
  }
  [*(id *)(a1 + v6) addObject:v3];
}

void sub_6BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_6C0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unsigned int v5 = +[NSMutableArray array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        int v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(WeakRetained, "_recommendationSpecifierWithRecommendation:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
          [v5 addObject:v11];

          int v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [WeakRetained setRecommendationSpecifiers:v5];
    [WeakRetained reloadSpecifiers];
  }
}

void sub_70EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = objc_alloc((Class)MPIdentifierSet);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_71B4;
  v8[3] = &unk_14558;
  id v9 = v3;
  id v6 = v3;
  id v7 = [v5 initWithBlock:v8];
  [v4 addObject:v7];
}

void sub_71B4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));
}

void sub_720C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_CF20(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_D160(v5);
    }
  }
  else
  {
    id v7 = [a2 results];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_7370;
    v14[3] = &unk_145A8;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    long long v15 = v8;
    uint64_t v16 = v9;
    [v7 enumerateItemsUsingBlock:v14];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_73C8;
    block[3] = &unk_145D0;
    int8x16_t v11 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v11.i64[0];
    int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    id v6 = v15;
  }
}

void sub_7370(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _playlistSpecifierWithPlaylist:a2];
  [v2 addObject:v3];
}

id sub_73C8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setPlaylistSpecifiers:v2];

  id v3 = *(void **)(a1 + 32);

  return [v3 reloadSpecifiers];
}

void sub_7740(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = objc_alloc((Class)MPIdentifierSet);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_7808;
  v8[3] = &unk_14558;
  id v9 = v3;
  id v6 = v3;
  id v7 = [v5 initWithBlock:v8];
  [v4 addObject:v7];
}

void sub_7808(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));
}

void sub_7860(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = sub_CF20(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_D1E8(v5);
    }
  }
  else
  {
    id v7 = [a2 results];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_79C4;
    v14[3] = &unk_14620;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    long long v15 = v8;
    uint64_t v16 = v9;
    [v7 enumerateItemsUsingBlock:v14];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_7A1C;
    block[3] = &unk_145D0;
    int8x16_t v11 = *(int8x16_t *)(a1 + 32);
    id v10 = (id)v11.i64[0];
    int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    id v6 = v15;
  }
}

void sub_79C4(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _albumSpecifierWithAlbum:a2];
  [v2 addObject:v3];
}

id sub_7A1C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setAlbumSpecifiers:v2];

  id v3 = *(void **)(a1 + 32);

  return [v3 reloadSpecifiers];
}

id sub_7B60(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestRecommendations];
}

id sub_7C68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadContents];
}

void sub_A0E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_A100(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _presentDownloadWaitingAlertIfNeededWithModelObject:*(void *)(a1 + 32)];
}

void sub_AB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_ABB0(uint64_t a1, void *a2)
{
  return [a2 setTitle:*(void *)(a1 + 32)];
}

uint64_t sub_ABBC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_ABCC(uint64_t a1)
{
}

void sub_ABD4(uint64_t a1, uint64_t a2, id *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *a3);
  id v5 = a3[1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 integerValue] == (char *)&stru_20.vmsize
                                                                                                 + 7;
}

id sub_AC4C(uint64_t a1, void *a2)
{
  return [a2 setName:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void sub_AEE8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _selfOrPresentedViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void sub_C020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_C044(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C0FC;
  block[3] = &unk_14738;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  char v7 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v6);
}

void sub_C0FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _completeTransientStateWithModelObject:*(void *)(a1 + 32) success:*(unsigned __int8 *)(a1 + 48)];
}

void sub_C384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_C3A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadContents];
}

id sub_CAEC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) playlistSpecifiers];
  id v3 = [v2 filteredArrayUsingPredicate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setPlaylistSpecifiers:v3];

  [*(id *)(a1 + 32) _unpinPlaylist:*(void *)(a1 + 48)];
  v4 = +[NMSMediaPinningManager sharedManager];
  [v4 setWorkoutPlaylistID:0];

  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 56);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)NMBridgeSyncedMusicController;
  objc_msgSendSuper2(&v9, "tableView:commitEditingStyle:forRowAtIndexPath:", v7, v5, v6);
  return [*(id *)(a1 + 32) _disableEditableAndButtonIfNothingLeftToEdit];
}

uint64_t sub_CDDC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_CF00(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_CF20(uint64_t a1)
{
  if (qword_19240 != -1) {
    dispatch_once(&qword_19240, &stru_14818);
  }
  uint64_t v2 = (void *)qword_191C8[a1];

  return v2;
}

void sub_CF84(id a1)
{
  os_log_t v1 = os_log_create("com.apple.nanomusic", "NanoMusicCore");
  uint64_t v2 = (void *)qword_191C8[0];
  qword_191C8[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.nanomusic", "NanoMusicCore-Oversize");
  v4 = (void *)qword_191D0;
  qword_191D0 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.nanomusic", "NanoMediaRemote");
  uint64_t v6 = (void *)qword_191D8;
  qword_191D8 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.nanomusic", "NanoMediaRemote-Oversize");
  id v8 = (void *)qword_191E0;
  qword_191E0 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.nanomusic", "NanoAudioControl");
  uint64_t v10 = (void *)qword_191E8;
  qword_191E8 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.nanomusic", "NanoMusicSync");
  long long v12 = (void *)qword_191F0;
  qword_191F0 = (uint64_t)v11;

  os_log_t v13 = os_log_create("com.apple.nanomusic", "NanoMusicSync-Oversize");
  long long v14 = (void *)qword_191F8;
  qword_191F8 = (uint64_t)v13;

  os_log_t v15 = os_log_create("com.apple.nanomusic", "NanoMediaUI");
  uint64_t v16 = (void *)qword_19200;
  qword_19200 = (uint64_t)v15;

  os_log_t v17 = os_log_create("com.apple.nanomusic", "NanoMediaUI-Oversize");
  v18 = (void *)qword_19208;
  qword_19208 = (uint64_t)v17;

  os_log_t v19 = os_log_create("com.apple.nanomusic", "NanoMediaAPI");
  v20 = (void *)qword_19210;
  qword_19210 = (uint64_t)v19;

  os_log_t v21 = os_log_create("com.apple.nanomusic", "NanoMediaAPI-Oversize");
  v22 = (void *)qword_19218;
  qword_19218 = (uint64_t)v21;

  os_log_t v23 = os_log_create("com.apple.nanomusic", "NanoMediaTool");
  v24 = (void *)qword_19220;
  qword_19220 = (uint64_t)v23;

  os_log_t v25 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI");
  v26 = (void *)qword_19230;
  qword_19230 = (uint64_t)v25;

  os_log_t v27 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI-Oversize");
  v28 = (void *)qword_19238;
  qword_19238 = (uint64_t)v27;

  qword_19228 = (uint64_t)os_log_create("com.apple.nanomusic", "NanoMediaAppActivity");

  _objc_release_x1();
}

void sub_D160(void *a1)
{
  os_log_t v1 = [a1 userInfo];
  sub_CF00(&dword_0, v2, v3, "[NMBridgeSyncedMusicController] Requesting playlists failed with error: %@", v4, v5, v6, v7, 2u);
}

void sub_D1E8(void *a1)
{
  os_log_t v1 = [a1 userInfo];
  sub_CF00(&dword_0, v2, v3, "[NMBridgeSyncedMusicController] Requesting albums failed with error: %@", v4, v5, v6, v7, 2u);
}

void sub_D270(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[NMBridgeSyncedMusicController] Unexpected picked music grouping: %ld", (uint8_t *)&v3, 0xCu);
}

void sub_D2EC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[NMBridgeSyncedMusicController] Displaying download error to user since device is not Favoriting-aware", v1, 2u);
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return _NRWatchOSVersionForRemoteDevice();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
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

id objc_msgSend__configureHeaderIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _configureHeaderIfNeeded];
}

id objc_msgSend__contentHeaderViewProgress(void *a1, const char *a2, ...)
{
  return [a1 _contentHeaderViewProgress];
}

id objc_msgSend__contentHeaderViewSubtitle(void *a1, const char *a2, ...)
{
  return [a1 _contentHeaderViewSubtitle];
}

id objc_msgSend__contentHeaderViewTitle(void *a1, const char *a2, ...)
{
  return [a1 _contentHeaderViewTitle];
}

id objc_msgSend__disableEditableAndButtonIfNothingLeftToEdit(void *a1, const char *a2, ...)
{
  return [a1 _disableEditableAndButtonIfNothingLeftToEdit];
}

id objc_msgSend__dismissMusicPicker(void *a1, const char *a2, ...)
{
  return [a1 _dismissMusicPicker];
}

id objc_msgSend__hasAlbumsOrPlaylists(void *a1, const char *a2, ...)
{
  return [a1 _hasAlbumsOrPlaylists];
}

id objc_msgSend__isOutOfSpace(void *a1, const char *a2, ...)
{
  return [a1 _isOutOfSpace];
}

id objc_msgSend__isSyncing(void *a1, const char *a2, ...)
{
  return [a1 _isSyncing];
}

id objc_msgSend__numberOfAlbums(void *a1, const char *a2, ...)
{
  return [a1 _numberOfAlbums];
}

id objc_msgSend__numberOfPlaylists(void *a1, const char *a2, ...)
{
  return [a1 _numberOfPlaylists];
}

id objc_msgSend__pinnedAlbums(void *a1, const char *a2, ...)
{
  return [a1 _pinnedAlbums];
}

id objc_msgSend__pinnedPlaylists(void *a1, const char *a2, ...)
{
  return [a1 _pinnedPlaylists];
}

id objc_msgSend__presentFavoritesPlaylistUnsupportedAlert(void *a1, const char *a2, ...)
{
  return [a1 _presentFavoritesPlaylistUnsupportedAlert];
}

id objc_msgSend__recommendationsGroup(void *a1, const char *a2, ...)
{
  return [a1 _recommendationsGroup];
}

id objc_msgSend__reloadContents(void *a1, const char *a2, ...)
{
  return [a1 _reloadContents];
}

id objc_msgSend__removeExpiredEnabledStates(void *a1, const char *a2, ...)
{
  return [a1 _removeExpiredEnabledStates];
}

id objc_msgSend__requestAlbums(void *a1, const char *a2, ...)
{
  return [a1 _requestAlbums];
}

id objc_msgSend__requestPlaylists(void *a1, const char *a2, ...)
{
  return [a1 _requestPlaylists];
}

id objc_msgSend__requestRecommendations(void *a1, const char *a2, ...)
{
  return [a1 _requestRecommendations];
}

id objc_msgSend__selfOrPresentedViewController(void *a1, const char *a2, ...)
{
  return [a1 _selfOrPresentedViewController];
}

id objc_msgSend__shouldShowProgress(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowProgress];
}

id objc_msgSend__updateHeaderAndSyncProgressIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _updateHeaderAndSyncProgressIfNeeded];
}

id objc_msgSend__updateHeaderSize(void *a1, const char *a2, ...)
{
  return [a1 _updateHeaderSize];
}

id objc_msgSend__updateProgressIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _updateProgressIfNeeded];
}

id objc_msgSend__workoutPlaylistID(void *a1, const char *a2, ...)
{
  return [a1 _workoutPlaylistID];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_addMusicSpecifier(void *a1, const char *a2, ...)
{
  return [a1 addMusicSpecifier];
}

id objc_msgSend_albumIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 albumIdentifiers];
}

id objc_msgSend_albumSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 albumSpecifiers];
}

id objc_msgSend_albumTitle(void *a1, const char *a2, ...)
{
  return [a1 albumTitle];
}

id objc_msgSend_allAlbums(void *a1, const char *a2, ...)
{
  return [a1 allAlbums];
}

id objc_msgSend_allPlaylists(void *a1, const char *a2, ...)
{
  return [a1 allPlaylists];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return [a1 artist];
}

id objc_msgSend_artworkCatalog(void *a1, const char *a2, ...)
{
  return [a1 artworkCatalog];
}

id objc_msgSend_autoupdatingSharedLibrary(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingSharedLibrary];
}

id objc_msgSend_beginObservingSyncInfo(void *a1, const char *a2, ...)
{
  return [a1 beginObservingSyncInfo];
}

id objc_msgSend_beginReceivingSyncProgressUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginReceivingSyncProgressUpdates];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cachedRecommendationsData(void *a1, const char *a2, ...)
{
  return [a1 cachedRecommendationsData];
}

id objc_msgSend_containers(void *a1, const char *a2, ...)
{
  return [a1 containers];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_curator(void *a1, const char *a2, ...)
{
  return [a1 curator];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_downloadState(void *a1, const char *a2, ...)
{
  return [a1 downloadState];
}

id objc_msgSend_editable(void *a1, const char *a2, ...)
{
  return [a1 editable];
}

id objc_msgSend_endObservingSyncInfo(void *a1, const char *a2, ...)
{
  return [a1 endObservingSyncInfo];
}

id objc_msgSend_estimatedSyncProgress(void *a1, const char *a2, ...)
{
  return [a1 estimatedSyncProgress];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_genericObjectType(void *a1, const char *a2, ...)
{
  return [a1 genericObjectType];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return [a1 identifiers];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_itemsQuery(void *a1, const char *a2, ...)
{
  return [a1 itemsQuery];
}

id objc_msgSend_keepLocalEnabledAlbums(void *a1, const char *a2, ...)
{
  return [a1 keepLocalEnabledAlbums];
}

id objc_msgSend_keepLocalEnabledPlaylists(void *a1, const char *a2, ...)
{
  return [a1 keepLocalEnabledPlaylists];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return [a1 library];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_modelObject(void *a1, const char *a2, ...)
{
  return [a1 modelObject];
}

id objc_msgSend_musicProgressInfo(void *a1, const char *a2, ...)
{
  return [a1 musicProgressInfo];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return [a1 numberOfSections];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return [a1 persistentID];
}

id objc_msgSend_pinnedAlbums(void *a1, const char *a2, ...)
{
  return [a1 pinnedAlbums];
}

id objc_msgSend_pinnedPlaylists(void *a1, const char *a2, ...)
{
  return [a1 pinnedPlaylists];
}

id objc_msgSend_playlistIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 playlistIdentifiers];
}

id objc_msgSend_playlistSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 playlistSpecifiers];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return [a1 progressView];
}

id objc_msgSend_recommendationSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 recommendationSpecifiers];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_representativeItem(void *a1, const char *a2, ...)
{
  return [a1 representativeItem];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaults];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_subscriptionType(void *a1, const char *a2, ...)
{
  return [a1 subscriptionType];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_syncInfo(void *a1, const char *a2, ...)
{
  return [a1 syncInfo];
}

id objc_msgSend_syncInfoController(void *a1, const char *a2, ...)
{
  return [a1 syncInfoController];
}

id objc_msgSend_syncState(void *a1, const char *a2, ...)
{
  return [a1 syncState];
}

id objc_msgSend_syncStatusDetailText(void *a1, const char *a2, ...)
{
  return [a1 syncStatusDetailText];
}

id objc_msgSend_syncWaitingSubstate(void *a1, const char *a2, ...)
{
  return [a1 syncWaitingSubstate];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableHeaderView(void *a1, const char *a2, ...)
{
  return [a1 tableHeaderView];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_workoutPlaylistID(void *a1, const char *a2, ...)
{
  return [a1 workoutPlaylistID];
}