void sub_2D6C(id a1)
{
  uint64_t vars8;

  qword_11898 = +[UIColor colorWithRed:0.6118 green:0.4078 blue:0.7412 alpha:1.0];

  _objc_release_x1();
}

void sub_2E1C(id a1)
{
  qword_118A8 = +[UIColor colorWithRed:1.0 green:0.7725 blue:0.3765 alpha:1.0];

  _objc_release_x1();
}

void sub_2EC8(id a1)
{
  qword_118B8 = +[UIColor colorWithRed:0.9922 green:0.2941 blue:0.2549 alpha:1.0];

  _objc_release_x1();
}

void sub_2F78(id a1)
{
  qword_118C8 = +[UIColor colorWithRed:0.9647 green:0.9216 blue:0.3137 alpha:1.0];

  _objc_release_x1();
}

void sub_3028(id a1)
{
  qword_118D8 = +[UIColor colorWithRed:0.8627 green:0.9765 blue:0.2706 alpha:1.0];

  _objc_release_x1();
}

void sub_30D8(id a1)
{
  qword_118E8 = +[UIColor colorWithRed:0.8118 green:0.5137 blue:0.3216 alpha:1.0];

  _objc_release_x1();
}

void sub_3188(id a1)
{
  qword_118F8 = +[UIColor lightGrayColor];

  _objc_release_x1();
}

void sub_321C(id a1)
{
  qword_11908 = +[UIColor colorWithRed:0.4471 green:0.5765 blue:0.3451 alpha:1.0];

  _objc_release_x1();
}

void sub_32CC(id a1)
{
  qword_11918 = +[UIColor colorWithRed:0.8902 green:0.5608 blue:0.5137 alpha:1.0];

  _objc_release_x1();
}

void sub_337C(id a1)
{
  qword_11928 = +[UIColor colorWithRed:0.6392 green:0.7882 blue:0.2275 alpha:1.0];

  _objc_release_x1();
}

void sub_342C(id a1)
{
  qword_11938 = +[UIColor colorWithRed:0.4431 green:0.5569 blue:0.851 alpha:1.0];

  _objc_release_x1();
}

CFStringRef NSStringFromNTKInfinityCharacterType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Buzz";
  }
  else {
    return off_C4A8[a1 - 1];
  }
}

id _makeInfinityListingWithPlayback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  if ((unint64_t)(a1 - 1) > 2) {
    CFStringRef v15 = @"Buzz";
  }
  else {
    CFStringRef v15 = off_C4A8[a1 - 1];
  }
  id v16 = a8;
  id v17 = a4;
  v18 = +[NSString stringWithFormat:@"%@_%@_%@", @"Infinity", v15, a2];
  v19 = +[NTKInfinityListing listingForDevice:v16 withFilename:v18];

  [v19 setType:a3];
  [v19 setPlayback:a7];
  v20 = +[NSMutableDictionary dictionary];
  v21 = +[NSNumber numberWithUnsignedInteger:a1];
  [v20 setObject:v21 forKey:@"character"];

  [v20 setObject:v17 forKey:@"color"];
  if (a5)
  {
    v22 = +[NSNumber numberWithUnsignedInteger:a5];
    [v20 setObject:v22 forKey:@"crop"];
  }
  if (a6)
  {
    v23 = +[NSNumber numberWithUnsignedInteger:a6];
    [v20 setObject:v23 forKey:@"setting"];
  }
  v24 = +[NTKInfinityListingAttributes attributesWithDictionary:v20];
  [v19 setAttributes:v24];

  return v19;
}

id _makeInfinityListing(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (a3 > 4) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = qword_9B08[a3];
  }
  return _makeInfinityListingWithPlayback(a1, a2, a3, a4, a5, a6, v8, a7);
}

id sub_38BC(uint64_t a1, void *a2)
{
  v3 = [a2 attributes];
  id v4 = [v3 containsAttributes:*(void *)(a1 + 32) ignoreKeys:&__NSArray0__struct];

  return v4;
}

uint64_t sub_3A4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 type]);
  if ([v4 containsObject:v5])
  {
    v6 = [v3 attributes];
    if ([v6 containsAttributes:*(void *)(a1 + 40) ignoreKeys:&__NSArray0__struct]) {
      uint64_t v7 = [*(id *)(a1 + 48) containsObject:v3] ^ 1;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t sub_3C28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 type]);
  if ([v4 containsObject:v5])
  {
    v6 = [v3 attributes];
    uint64_t v7 = *(void *)(a1 + 40);
    CFStringRef v11 = @"character";
    uint64_t v8 = +[NSArray arrayWithObjects:&v11 count:1];
    if ([v6 containsAttributes:v7 ignoreKeys:v8]) {
      uint64_t v9 = [*(id *)(a1 + 48) containsObject:v3] ^ 1;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_4DA8(uint64_t a1, uint64_t a2, void *a3)
{
  if (NTKComplicationSlotTopRight == a2)
  {
    id v4 = [a3 display];
    v5 = v4;
    if (*(unsigned char *)(a1 + 40))
    {
      v6 = [v4 foregroundColor];
      uint64_t v7 = *(void **)(a1 + 32);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_4EC4;
      v10[3] = &unk_C4C8;
      id v11 = v5;
      id v12 = v6;
      uint64_t v13 = *(void *)(a1 + 32);
      id v8 = v6;
      id v9 = [v7 _complicationFlickerWorkgroundAnimationWithDuration:v10 applier:0.1];
    }
    else
    {
      [v4 setForegroundColor:*(void *)(*(void *)(a1 + 32) + 56)];
    }
  }
}

void sub_4EC4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  NTKInterpolateBetweenColors();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setForegroundColor:v2];
}

void sub_5484(uint64_t a1, uint64_t a2, void *a3)
{
  if (NTKComplicationSlotTopRight == a2)
  {
    id v7 = [a3 display];
    id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "complicationColorForStyle:", objc_msgSend(*(id *)(a1 + 40), "style"));
    v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "complicationColorForStyle:", objc_msgSend(*(id *)(a1 + 48), "style"));
    v6 = NTKInterpolateBetweenColors();
    [v7 setForegroundColor:v6];
  }
}

void sub_57F8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) videoPlayerView];
  id v3 = [*(id *)(a1 + 32) currentListing];
  id v4 = [v3 video];
  [v2 loadVideo:v4];

  if (([*(id *)(a1 + 32) paused] & 1) == 0)
  {
    v5 = [*(id *)(a1 + 32) videoPlayerView];
    [v5 play];
  }
  id v6 = [*(id *)(a1 + 32) posterImageView];
  [v6 setHidden:1];
}

id _toyboxComplicationColor()
{
  if (qword_11950 != -1) {
    dispatch_once(&qword_11950, &stru_C580);
  }
  v0 = (void *)qword_11948;

  return v0;
}

void sub_6530(id a1)
{
  uint64_t v1 = +[UIColor colorWithWhite:0.898039216 alpha:1.0];
  uint64_t v2 = qword_11948;
  qword_11948 = v1;

  _objc_release_x1(v1, v2);
}

void sub_662C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_6648(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_7634(id a1)
{
  v3[0] = &off_CE00;
  v3[1] = &off_CE18;
  v4[0] = @"toybox";
  v4[1] = @"buzz";
  v3[2] = &off_CE30;
  v3[3] = &off_CE48;
  v4[2] = @"jessie";
  v4[3] = @"woody";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  uint64_t v2 = (void *)qword_11978;
  qword_11978 = v1;
}

void sub_7700()
{
  sub_6664();
  sub_662C(&dword_0, v0, v1, "%s selected listing: %@", v2, v3, v4, v5, 2u);
}

void sub_7774()
{
  sub_6664();
  sub_662C(&dword_0, v0, v1, "%s selecting from listings: %@", v2, v3, v4, v5, 2u);
}

void sub_77E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7874(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7900(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_6648(&dword_0, a1, a3, "%s _currentListing == nil", a5, a6, a7, a8, 2u);
}

void sub_7978(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_79F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7A68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_6648(&dword_0, a1, a3, "%s _currentListing != nil", a5, a6, a7, a8, 2u);
}

uint64_t NTKAllUtilityLargeNarrowComplicationTypes()
{
  return _NTKAllUtilityLargeNarrowComplicationTypes();
}

uint64_t NTKAllUtilitySmallFlatComplicationTypes()
{
  return _NTKAllUtilitySmallFlatComplicationTypes();
}

uint64_t NTKAssetsBundle()
{
  return _NTKAssetsBundle();
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKDigitalTimeLabelStyleWideRightSideMargin()
{
  return _NTKDigitalTimeLabelStyleWideRightSideMargin();
}

uint64_t NTKImageNamedFromAssetsBundle()
{
  return _NTKImageNamedFromAssetsBundle();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
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

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend__countListings(void *a1, const char *a2, ...)
{
  return [a1 _countListings];
}

id objc_msgSend__curtainView(void *a1, const char *a2, ...)
{
  return [a1 _curtainView];
}

id objc_msgSend__curtainViewVisible(void *a1, const char *a2, ...)
{
  return [a1 _curtainViewVisible];
}

id objc_msgSend__editingComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 _editingComplicationColor];
}

id objc_msgSend__hideCurtainView(void *a1, const char *a2, ...)
{
  return [a1 _hideCurtainView];
}

id objc_msgSend__loadCharacters(void *a1, const char *a2, ...)
{
  return [a1 _loadCharacters];
}

id objc_msgSend__maxRecentlyPlayedActions(void *a1, const char *a2, ...)
{
  return [a1 _maxRecentlyPlayedActions];
}

id objc_msgSend__maxRecentlyPlayedMagicMoments(void *a1, const char *a2, ...)
{
  return [a1 _maxRecentlyPlayedMagicMoments];
}

id objc_msgSend__nextToyboxListing(void *a1, const char *a2, ...)
{
  return [a1 _nextToyboxListing];
}

id objc_msgSend__recentlyPlayedListings(void *a1, const char *a2, ...)
{
  return [a1 _recentlyPlayedListings];
}

id objc_msgSend__resetVideoForListing(void *a1, const char *a2, ...)
{
  return [a1 _resetVideoForListing];
}

id objc_msgSend__shouldQueueKeepAlive(void *a1, const char *a2, ...)
{
  return [a1 _shouldQueueKeepAlive];
}

id objc_msgSend__updateImageToBlur(void *a1, const char *a2, ...)
{
  return [a1 _updateImageToBlur];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_backgroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 backgroundContainerView];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buzzColor(void *a1, const char *a2, ...)
{
  return [a1 buzzColor];
}

id objc_msgSend_complicationColor(void *a1, const char *a2, ...)
{
  return [a1 complicationColor];
}

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
}

id objc_msgSend_controllerMode(void *a1, const char *a2, ...)
{
  return [a1 controllerMode];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 currentComplicationColor];
}

id objc_msgSend_currentListing(void *a1, const char *a2, ...)
{
  return [a1 currentListing];
}

id objc_msgSend_currentStyle(void *a1, const char *a2, ...)
{
  return [a1 currentStyle];
}

id objc_msgSend_currentStyleComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 currentStyleComplicationColor];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faultInFaceContentSkippedDuringSwiping(void *a1, const char *a2, ...)
{
  return [a1 faultInFaceContentSkippedDuringSwiping];
}

id objc_msgSend_foregroundColor(void *a1, const char *a2, ...)
{
  return [a1 foregroundColor];
}

id objc_msgSend_foregroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 foregroundContainerView];
}

id objc_msgSend_invalidateCurrentListing(void *a1, const char *a2, ...)
{
  return [a1 invalidateCurrentListing];
}

id objc_msgSend_invalidatePreparedListing(void *a1, const char *a2, ...)
{
  return [a1 invalidatePreparedListing];
}

id objc_msgSend_isPlaybackReady(void *a1, const char *a2, ...)
{
  return [a1 isPlaybackReady];
}

id objc_msgSend_jessieColor(void *a1, const char *a2, ...)
{
  return [a1 jessieColor];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return [a1 lightGrayColor];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nextListing(void *a1, const char *a2, ...)
{
  return [a1 nextListing];
}

id objc_msgSend_nextQueueListing(void *a1, const char *a2, ...)
{
  return [a1 nextQueueListing];
}

id objc_msgSend_numberOfTotalActions(void *a1, const char *a2, ...)
{
  return [a1 numberOfTotalActions];
}

id objc_msgSend_numberOfTotalMagicMoments(void *a1, const char *a2, ...)
{
  return [a1 numberOfTotalMagicMoments];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_paused(void *a1, const char *a2, ...)
{
  return [a1 paused];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_playback(void *a1, const char *a2, ...)
{
  return [a1 playback];
}

id objc_msgSend_posterImageView(void *a1, const char *a2, ...)
{
  return [a1 posterImageView];
}

id objc_msgSend_prepareListing(void *a1, const char *a2, ...)
{
  return [a1 prepareListing];
}

id objc_msgSend_prepareUserTapAction(void *a1, const char *a2, ...)
{
  return [a1 prepareUserTapAction];
}

id objc_msgSend_preparedListing(void *a1, const char *a2, ...)
{
  return [a1 preparedListing];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_shouldChangeVariantForScreenWake(void *a1, const char *a2, ...)
{
  return [a1 shouldChangeVariantForScreenWake];
}

id objc_msgSend_shouldPause(void *a1, const char *a2, ...)
{
  return [a1 shouldPause];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_video(void *a1, const char *a2, ...)
{
  return [a1 video];
}

id objc_msgSend_videoPlayerView(void *a1, const char *a2, ...)
{
  return [a1 videoPlayerView];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_woodyColor(void *a1, const char *a2, ...)
{
  return [a1 woodyColor];
}