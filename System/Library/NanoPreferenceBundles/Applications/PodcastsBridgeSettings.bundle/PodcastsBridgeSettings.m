void sub_2500(uint64_t a1)
{
  id v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___MTShowsPreferencesDataStore;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, "allocWithZone:", 0), "init");
  v2 = (void *)qword_23348;
  qword_23348 = (uint64_t)v1;
}

void sub_2E80(id a1)
{
  qword_23358 = [[NMTPodcastsArtworkDataSource alloc] _initWithIsImageURLKey:0];

  _objc_release_x1();
}

void sub_2F18(id a1)
{
  qword_23368 = [[NMTPodcastsArtworkDataSource alloc] _initWithIsImageURLKey:1];

  _objc_release_x1();
}

void sub_34B4(uint64_t a1)
{
  v2 = +[MTImageStore defaultStore];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_358C;
  v5[3] = &unk_1C820;
  long long v8 = *(_OWORD *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  id v6 = v4;
  id v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "asyncImageForKey:size:completionHandler:", v3, v5, *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void sub_358C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = a3;
    id v7 = [objc_alloc((Class)PFStaticArtworkVisualIdenticality) initWithArtworkIdentifier:v6];
    long long v8 = +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v7, v5, *(double *)(a1 + 56), *(double *)(a1 + 64));
    v9 = objc_msgSend(*(id *)(a1 + 32), "_cacheKeyForSize:withBaseKey:", v6, *(double *)(a1 + 56), *(double *)(a1 + 64));

    v10 = [*(id *)(a1 + 40) cache];
    [v10 setObject:v8 forKey:v9];

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v8, 0);
    }
  }
  else
  {
    id v12 = a3;
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = +[NSString stringWithFormat:@"Failed to resize existing original for key: %@", v12, NSDebugDescriptionErrorKey];

    v20 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v17 = +[NSError errorWithDomain:v14 code:1 userInfo:v16];

    uint64_t v18 = *(void *)(a1 + 48);
    if (v18) {
      (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v17);
    }
  }
}

void sub_3774(void *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(a1[6] + 16);
    v3();
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = +[NSString stringWithFormat:@"Failed to download original for key: %@", a1[5], NSDebugDescriptionErrorKey];
    uint64_t v11 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    long long v8 = +[NSError errorWithDomain:v5 code:2 userInfo:v7];

    uint64_t v9 = a1[7];
    if (v9) {
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v8);
    }
  }
}

void sub_5100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_5120(uint64_t a1, unint64_t a2)
{
  +[NSMutableArray arrayWithCapacity:a2];
  unint64_t v22 = a2;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  v4 = +[NSMutableSet setWithCapacity:a2];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained settings];

  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v25;
    *(void *)&long long v8 = 138412290;
    long long v21 = v8;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "podcast", v21);
        v14 = [v13 uuid];
        uint64_t v15 = [v13 artworkCatalog];
        v16 = (void *)v15;
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {
          uint64_t v18 = _MTLogCategoryDefault();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v29 = v12;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Station artwork will ignore podcast setting: %@", buf, 0xCu);
          }
        }
        else
        {
          unsigned int v19 = [v13 isExplicit];
          if (!v19
            || +[PFRestrictionsController isExplicitContentAllowed])
          {
            if (([v4 containsObject:v14] & 1) == 0)
            {
              [v23 addObject:v16];
              [v4 addObject:v14];
            }
            if ((unint64_t)[v23 count] >= v22)
            {

              goto LABEL_23;
            }
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  return v23;
}

id sub_71E8(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateHeaderAndSyncProgress];
}

void sub_7D4C(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  v2 = (void *)qword_23378;
  qword_23378 = (uint64_t)v1;

  [(id)qword_23378 setNumberStyle:1];
  uint64_t v3 = (void *)qword_23378;
  v4 = +[NSLocale currentLocale];
  [v3 setLocale:v4];

  id v5 = (void *)qword_23378;

  [v5 setMaximumFractionDigits:0];
}

NSString *__cdecl sub_9860(id a1, NSSortDescriptor *a2)
{
  return [(NSSortDescriptor *)a2 key];
}

void sub_9FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9FE0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = +[MTRecencyUtil upNextForPodcastUuid:v2 excludeExplicit:0 ctx:*(void *)(a1 + 40)];

  v4 = [v3 episodeUuid];
  id v5 = [*(id *)(a1 + 32) nextEpisodeUuid];
  id v6 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*(id *)(a1 + 32) uuid];
    long long v8 = [v3 episodeUuid];
    [v3 modifiedDate];
    int v14 = 138543874;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    BOOL v17 = v8;
    __int16 v18 = 2050;
    uint64_t v19 = v9;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "UpNext result from update cursor position for podcast %{public}@: episodeUuid: %{public}@ at %{public}f", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v10 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v3 episodeUuid];
    int v14 = 138543618;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    BOOL v17 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "UpNext result updating podcast nextEpisodeUuid from %{public}@ to %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if (v5 != v4 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    id v12 = [*(id *)(a1 + 40) episodeForUuid:v4];
    v13 = [*(id *)(a1 + 40) episodeForUuid:v5];
    if ([v13 listenNowEpisode])
    {
      [v13 setListenNowEpisode:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    if (v12 && ([v12 listenNowEpisode] & 1) == 0)
    {
      [v12 setListenNowEpisode:1];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      [v3 modifiedDate];
      objc_msgSend(*(id *)(a1 + 32), "setModifiedDate:");
    }
  }
  if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) saveInCurrentBlock];
  }
}

void sub_A3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_A3E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_A3F8(uint64_t a1)
{
}

void sub_A400(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) podcastForFeedUrl:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 uuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_A834(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_A84C(uint64_t a1)
{
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  v4 = +[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:v3];
  [v2 setPredicate:v4];

  [v2 setFetchLimit:1];
  id v5 = *(void **)(a1 + 40);
  id v8 = 0;
  id v6 = [v5 executeFetchRequest:v2 error:&v8];
  id v7 = v8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 count] != 0;

  [v7 logAndThrow:0];
}

void sub_AAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_AABC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchRequestForDistinctSeasons];
  uint64_t v3 = *(void **)(a1 + 40);
  id v9 = 0;
  v4 = [v3 executeFetchRequest:v2 error:&v9];
  id v5 = v9;
  [v5 logAndThrow:0];
  uint64_t v6 = [v4 valueForKey:kEpisodeSeasonNumber];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_ACC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_ACDC(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) predicateForPodcast:*(void *)(a1 + 40)];
  uint64_t v2 = +[MTEpisode predicateForEpisodeType:1];
  uint64_t v3 = +[MTEpisode predicateForSeasonNumberWithNoEpisodeNumber:*(void *)(a1 + 64)];
  v4 = [v10 AND:v2];
  id v5 = [v4 AND:v3];

  uint64_t v6 = +[MTEpisode sortDescriptorsForPubDateAscending:0];
  uint64_t v7 = [*(id *)(a1 + 48) objectsInEntity:kMTEpisodeEntityName predicate:v5 sortDescriptors:v6 returnsObjectsAsFaults:0 limit:1];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

id sub_B870(uint64_t a1, void *a2)
{
  return [a2 _handlePodcastsDidUpdateNotification];
}

void sub_1019C(id a1, BSProcessHandle *a2, NSError *a3)
{
  uint64_t v3 = a3;
  v4 = _MTLogCategoryBridge();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      uint64_t v11 = v3;
      uint64_t v6 = "Podcasts failed to launch due to %{public}@";
      uint64_t v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    uint64_t v6 = "Podcasts launched successfully.";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 2;
    goto LABEL_6;
  }
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return _UIRectCenteredIntegralRectScale();
}

void UIRectFill(CGRect rect)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MTLogCategoryBridge()
{
  return __MTLogCategoryBridge();
}

uint64_t _MTLogCategoryDatabase()
{
  return __MTLogCategoryDatabase();
}

uint64_t _MTLogCategoryDefault()
{
  return __MTLogCategoryDefault();
}

uint64_t _UIScaleTransformForAspectFitOfSizeInTargetSize()
{
  return __UIScaleTransformForAspectFitOfSizeInTargetSize();
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

uint64_t os_feature_enabled_image_provider_on_watch()
{
  return _os_feature_enabled_image_provider_on_watch();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_NOT(void *a1, const char *a2, ...)
{
  return [a1 NOT];
}

id objc_msgSend__addShowsSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _addShowsSpecifier];
}

id objc_msgSend__addedShowsPredicate(void *a1, const char *a2, ...)
{
  return [a1 _addedShowsPredicate];
}

id objc_msgSend__applePodcastsFoundationSharedUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 _applePodcastsFoundationSharedUserDefaults];
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

id objc_msgSend__createFRCs(void *a1, const char *a2, ...)
{
  return [a1 _createFRCs];
}

id objc_msgSend__fetchRequestForDistinctSeasons(void *a1, const char *a2, ...)
{
  return [a1 _fetchRequestForDistinctSeasons];
}

id objc_msgSend__isOutOfSpace(void *a1, const char *a2, ...)
{
  return [a1 _isOutOfSpace];
}

id objc_msgSend__isSyncing(void *a1, const char *a2, ...)
{
  return [a1 _isSyncing];
}

id objc_msgSend__launchPodcasts(void *a1, const char *a2, ...)
{
  return [a1 _launchPodcasts];
}

id objc_msgSend__legacyIsCharging(void *a1, const char *a2, ...)
{
  return [a1 _legacyIsCharging];
}

id objc_msgSend__localizedEpisodeDownloadExplanation(void *a1, const char *a2, ...)
{
  return [a1 _localizedEpisodeDownloadExplanation];
}

id objc_msgSend__newLoadingSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _newLoadingSpecifier];
}

id objc_msgSend__otherShowsPredicate(void *a1, const char *a2, ...)
{
  return [a1 _otherShowsPredicate];
}

id objc_msgSend__placeholderPodcastsImage(void *a1, const char *a2, ...)
{
  return [a1 _placeholderPodcastsImage];
}

id objc_msgSend__podcastSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _podcastSpecifiers];
}

id objc_msgSend__reload(void *a1, const char *a2, ...)
{
  return [a1 _reload];
}

id objc_msgSend__savedAndStationSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _savedAndStationSpecifiers];
}

id objc_msgSend__savedSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _savedSpecifier];
}

id objc_msgSend__selectedNumberOfEpisodes(void *a1, const char *a2, ...)
{
  return [a1 _selectedNumberOfEpisodes];
}

id objc_msgSend__selfOrPresentedViewController(void *a1, const char *a2, ...)
{
  return [a1 _selfOrPresentedViewController];
}

id objc_msgSend__shouldShowProgress(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowProgress];
}

id objc_msgSend__showSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _showSpecifiers];
}

id objc_msgSend__showsPredicate(void *a1, const char *a2, ...)
{
  return [a1 _showsPredicate];
}

id objc_msgSend__specifierForSavedEpisodes(void *a1, const char *a2, ...)
{
  return [a1 _specifierForSavedEpisodes];
}

id objc_msgSend__stationSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _stationSpecifiers];
}

id objc_msgSend__supportsPodcastsPinningSettingsV2(void *a1, const char *a2, ...)
{
  return [a1 _supportsPodcastsPinningSettingsV2];
}

id objc_msgSend__syncGroupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _syncGroupSpecifiers];
}

id objc_msgSend__upNextSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _upNextSpecifier];
}

id objc_msgSend__updateHeaderAndSyncProgress(void *a1, const char *a2, ...)
{
  return [a1 _updateHeaderAndSyncProgress];
}

id objc_msgSend__updateHeaderSize(void *a1, const char *a2, ...)
{
  return [a1 _updateHeaderSize];
}

id objc_msgSend__updatePredicates(void *a1, const char *a2, ...)
{
  return [a1 _updatePredicates];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artworkCatalog(void *a1, const char *a2, ...)
{
  return [a1 artworkCatalog];
}

id objc_msgSend_artworkPrimaryColor(void *a1, const char *a2, ...)
{
  return [a1 artworkPrimaryColor];
}

id objc_msgSend_artworkSize(void *a1, const char *a2, ...)
{
  return [a1 artworkSize];
}

id objc_msgSend_attemptToFix(void *a1, const char *a2, ...)
{
  return [a1 attemptToFix];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return [a1 author];
}

id objc_msgSend_availablePodcastStationsFetchedResultsController(void *a1, const char *a2, ...)
{
  return [a1 availablePodcastStationsFetchedResultsController];
}

id objc_msgSend_availablePodcastsFetchedResultsController(void *a1, const char *a2, ...)
{
  return [a1 availablePodcastsFetchedResultsController];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
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

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_cachedPinnedFeedURLs(void *a1, const char *a2, ...)
{
  return [a1 cachedPinnedFeedURLs];
}

id objc_msgSend_cachedPinnedStationUUIDs(void *a1, const char *a2, ...)
{
  return [a1 cachedPinnedStationUUIDs];
}

id objc_msgSend_canExtensionOpenDatabase(void *a1, const char *a2, ...)
{
  return [a1 canExtensionOpenDatabase];
}

id objc_msgSend_cellConfiguration(void *a1, const char *a2, ...)
{
  return [a1 cellConfiguration];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createGroupIndices(void *a1, const char *a2, ...)
{
  return [a1 createGroupIndices];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_defaultCellHeight(void *a1, const char *a2, ...)
{
  return [a1 defaultCellHeight];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return [a1 directionalLayoutMargins];
}

id objc_msgSend_downloadCountFormatter(void *a1, const char *a2, ...)
{
  return [a1 downloadCountFormatter];
}

id objc_msgSend_downloadState(void *a1, const char *a2, ...)
{
  return [a1 downloadState];
}

id objc_msgSend_emptyProminentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 emptyProminentConfiguration];
}

id objc_msgSend_endObservingSyncInfo(void *a1, const char *a2, ...)
{
  return [a1 endObservingSyncInfo];
}

id objc_msgSend_episodeUuid(void *a1, const char *a2, ...)
{
  return [a1 episodeUuid];
}

id objc_msgSend_estimatedSyncProgress(void *a1, const char *a2, ...)
{
  return [a1 estimatedSyncProgress];
}

id objc_msgSend_feedChangedDate(void *a1, const char *a2, ...)
{
  return [a1 feedChangedDate];
}

id objc_msgSend_feedURL(void *a1, const char *a2, ...)
{
  return [a1 feedURL];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return [a1 fetchRequest];
}

id objc_msgSend_fetchedObjects(void *a1, const char *a2, ...)
{
  return [a1 fetchedObjects];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fittingSize(void *a1, const char *a2, ...)
{
  return [a1 fittingSize];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return [a1 flags];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_hasHTML(void *a1, const char *a2, ...)
{
  return [a1 hasHTML];
}

id objc_msgSend_hasITunesAccount(void *a1, const char *a2, ...)
{
  return [a1 hasITunesAccount];
}

id objc_msgSend_hasItemsOverStorageLimit(void *a1, const char *a2, ...)
{
  return [a1 hasItemsOverStorageLimit];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageCache(void *a1, const char *a2, ...)
{
  return [a1 imageCache];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return [a1 imageURL];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isExplicit(void *a1, const char *a2, ...)
{
  return [a1 isExplicit];
}

id objc_msgSend_isExplicitContentAllowed(void *a1, const char *a2, ...)
{
  return [a1 isExplicitContentAllowed];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return [a1 isReady];
}

id objc_msgSend_isSerialShowTypeInFeed(void *a1, const char *a2, ...)
{
  return [a1 isSerialShowTypeInFeed];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_isWaitingForDatabaseSetup(void *a1, const char *a2, ...)
{
  return [a1 isWaitingForDatabaseSetup];
}

id objc_msgSend_itemCount(void *a1, const char *a2, ...)
{
  return [a1 itemCount];
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return [a1 itemDescription];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_lastDatePlayed(void *a1, const char *a2, ...)
{
  return [a1 lastDatePlayed];
}

id objc_msgSend_lastImplicitlyFollowedDate(void *a1, const char *a2, ...)
{
  return [a1 lastImplicitlyFollowedDate];
}

id objc_msgSend_latestSeasonNumber(void *a1, const char *a2, ...)
{
  return [a1 latestSeasonNumber];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lenientSharedInstance(void *a1, const char *a2, ...)
{
  return [a1 lenientSharedInstance];
}

id objc_msgSend_listenNowEpisode(void *a1, const char *a2, ...)
{
  return [a1 listenNowEpisode];
}

id objc_msgSend_localizedAddEpisodesString(void *a1, const char *a2, ...)
{
  return [a1 localizedAddEpisodesString];
}

id objc_msgSend_localizedChooseShowsString(void *a1, const char *a2, ...)
{
  return [a1 localizedChooseShowsString];
}

id objc_msgSend_localizedNoPodcastsString(void *a1, const char *a2, ...)
{
  return [a1 localizedNoPodcastsString];
}

id objc_msgSend_localizedNotificationsString(void *a1, const char *a2, ...)
{
  return [a1 localizedNotificationsString];
}

id objc_msgSend_localizedOffString(void *a1, const char *a2, ...)
{
  return [a1 localizedOffString];
}

id objc_msgSend_localizedOutOfSpaceHeaderMessage(void *a1, const char *a2, ...)
{
  return [a1 localizedOutOfSpaceHeaderMessage];
}

id objc_msgSend_localizedOutOfSpaceHeaderTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedOutOfSpaceHeaderTitle];
}

id objc_msgSend_localizedPodcastsDownloadsExplanation(void *a1, const char *a2, ...)
{
  return [a1 localizedPodcastsDownloadsExplanation];
}

id objc_msgSend_localizedSavedString(void *a1, const char *a2, ...)
{
  return [a1 localizedSavedString];
}

id objc_msgSend_localizedSettingsMessage(void *a1, const char *a2, ...)
{
  return [a1 localizedSettingsMessage];
}

id objc_msgSend_localizedSettingsString(void *a1, const char *a2, ...)
{
  return [a1 localizedSettingsString];
}

id objc_msgSend_localizedSignInMessage(void *a1, const char *a2, ...)
{
  return [a1 localizedSignInMessage];
}

id objc_msgSend_localizedSignInString(void *a1, const char *a2, ...)
{
  return [a1 localizedSignInString];
}

id objc_msgSend_localizedUpNextString(void *a1, const char *a2, ...)
{
  return [a1 localizedUpNextString];
}

id objc_msgSend_mainQueueContext(void *a1, const char *a2, ...)
{
  return [a1 mainQueueContext];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_markPlaylistsForUpdate(void *a1, const char *a2, ...)
{
  return [a1 markPlaylistsForUpdate];
}

id objc_msgSend_modelObject(void *a1, const char *a2, ...)
{
  return [a1 modelObject];
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return [a1 modifiedDate];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_needsUpdate(void *a1, const char *a2, ...)
{
  return [a1 needsUpdate];
}

id objc_msgSend_nextEpisodeUuid(void *a1, const char *a2, ...)
{
  return [a1 nextEpisodeUuid];
}

id objc_msgSend_numberOfEpisodes(void *a1, const char *a2, ...)
{
  return [a1 numberOfEpisodes];
}

id objc_msgSend_numberOfGroups(void *a1, const char *a2, ...)
{
  return [a1 numberOfGroups];
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return [a1 numberOfSections];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_orderedDownloadSettings(void *a1, const char *a2, ...)
{
  return [a1 orderedDownloadSettings];
}

id objc_msgSend_pinnedPodcastsAreUserSet(void *a1, const char *a2, ...)
{
  return [a1 pinnedPodcastsAreUserSet];
}

id objc_msgSend_playbackNewestToOldest(void *a1, const char *a2, ...)
{
  return [a1 playbackNewestToOldest];
}

id objc_msgSend_playlist(void *a1, const char *a2, ...)
{
  return [a1 playlist];
}

id objc_msgSend_playlistIfDefault(void *a1, const char *a2, ...)
{
  return [a1 playlistIfDefault];
}

id objc_msgSend_playlistSettings(void *a1, const char *a2, ...)
{
  return [a1 playlistSettings];
}

id objc_msgSend_podcast(void *a1, const char *a2, ...)
{
  return [a1 podcast];
}

id objc_msgSend_podcastFeedURLs(void *a1, const char *a2, ...)
{
  return [a1 podcastFeedURLs];
}

id objc_msgSend_podcastStationUUIDs(void *a1, const char *a2, ...)
{
  return [a1 podcastStationUUIDs];
}

id objc_msgSend_podcastsFoundationBundle(void *a1, const char *a2, ...)
{
  return [a1 podcastsFoundationBundle];
}

id objc_msgSend_podcastsProgressInfo(void *a1, const char *a2, ...)
{
  return [a1 podcastsProgressInfo];
}

id objc_msgSend_podcastsSavedEpisodesDownloadSettings(void *a1, const char *a2, ...)
{
  return [a1 podcastsSavedEpisodesDownloadSettings];
}

id objc_msgSend_podcastsSelectedShowFeedURLs(void *a1, const char *a2, ...)
{
  return [a1 podcastsSelectedShowFeedURLs];
}

id objc_msgSend_podcastsSelectedStationUUIDs(void *a1, const char *a2, ...)
{
  return [a1 podcastsSelectedStationUUIDs];
}

id objc_msgSend_podcastsSettingsSpecifier(void *a1, const char *a2, ...)
{
  return [a1 podcastsSettingsSpecifier];
}

id objc_msgSend_podcastsUpNextDownloadSettings(void *a1, const char *a2, ...)
{
  return [a1 podcastsUpNextDownloadSettings];
}

id objc_msgSend_predicateForEntitledShows(void *a1, const char *a2, ...)
{
  return [a1 predicateForEntitledShows];
}

id objc_msgSend_predicateForSubscribedAndNotHidden(void *a1, const char *a2, ...)
{
  return [a1 predicateForSubscribedAndNotHidden];
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

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_renderHint(void *a1, const char *a2, ...)
{
  return [a1 renderHint];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_saveInCurrentBlock(void *a1, const char *a2, ...)
{
  return [a1 saveInCurrentBlock];
}

id objc_msgSend_savedEpisodesEnabled(void *a1, const char *a2, ...)
{
  return [a1 savedEpisodesEnabled];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scaledFittingSize(void *a1, const char *a2, ...)
{
  return [a1 scaledFittingSize];
}

id objc_msgSend_seasonNumbers(void *a1, const char *a2, ...)
{
  return [a1 seasonNumbers];
}

id objc_msgSend_seasonSortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return [a1 seasonSortDescriptorsForSortOrder];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedDataSource(void *a1, const char *a2, ...)
{
  return [a1 sharedDataSource];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_showTypeInFeed(void *a1, const char *a2, ...)
{
  return [a1 showTypeInFeed];
}

id objc_msgSend_showTypeSetting(void *a1, const char *a2, ...)
{
  return [a1 showTypeSetting];
}

id objc_msgSend_signInSpecifier(void *a1, const char *a2, ...)
{
  return [a1 signInSpecifier];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sortAscending(void *a1, const char *a2, ...)
{
  return [a1 sortAscending];
}

id objc_msgSend_sortDescriptors(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptors];
}

id objc_msgSend_sortDescriptorsForManualOrder(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForManualOrder];
}

id objc_msgSend_sortDescriptorsForPlayOrderByEpisodeNumber(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForPlayOrderByEpisodeNumber];
}

id objc_msgSend_sortDescriptorsForPlayOrderByPubDate(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForPlayOrderByPubDate];
}

id objc_msgSend_sortDescriptorsForRecentlyUnfollowed(void *a1, const char *a2, ...)
{
  return [a1 sortDescriptorsForRecentlyUnfollowed];
}

id objc_msgSend_sortOrder(void *a1, const char *a2, ...)
{
  return [a1 sortOrder];
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

id objc_msgSend_storeCollectionId(void *a1, const char *a2, ...)
{
  return [a1 storeCollectionId];
}

id objc_msgSend_stringBySmartlyStrippingHTML(void *a1, const char *a2, ...)
{
  return [a1 stringBySmartlyStrippingHTML];
}

id objc_msgSend_subscribed(void *a1, const char *a2, ...)
{
  return [a1 subscribed];
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

id objc_msgSend_syncType(void *a1, const char *a2, ...)
{
  return [a1 syncType];
}

id objc_msgSend_syncWaitingSubstate(void *a1, const char *a2, ...)
{
  return [a1 syncWaitingSubstate];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
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

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_topLevelPlaylistsPredicate(void *a1, const char *a2, ...)
{
  return [a1 topLevelPlaylistsPredicate];
}

id objc_msgSend_uiShared(void *a1, const char *a2, ...)
{
  return [a1 uiShared];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateAvg(void *a1, const char *a2, ...)
{
  return [a1 updateAvg];
}

id objc_msgSend_updateStdDev(void *a1, const char *a2, ...)
{
  return [a1 updateStdDev];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_uuidSharedDataSource(void *a1, const char *a2, ...)
{
  return [a1 uuidSharedDataSource];
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return [a1 webpageURL];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}