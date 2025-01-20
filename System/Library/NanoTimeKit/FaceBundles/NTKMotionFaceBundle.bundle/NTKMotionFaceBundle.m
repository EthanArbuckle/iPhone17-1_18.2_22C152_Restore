void sub_39D8(id a1)
{
  uint64_t v1;
  void *v2;
  void v3[3];
  void v4[3];

  v3[0] = &off_8820;
  v3[1] = &off_8838;
  v4[0] = NTKFaceBundleThemeButterfly;
  v4[1] = NTKFaceBundleThemeFlower;
  v3[2] = &off_8850;
  v4[2] = NTKFaceBundleThemeJellyfish;
  v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  v2 = (void *)qword_CA18;
  qword_CA18 = v1;
}

void sub_3D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_3D80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _complicationForegroundColor];

  return v2;
}

double sub_3DCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = 0.0;
  if ([WeakRetained _shouldAdjustLayoutForTimeTravel])
  {
    [WeakRetained _timeTravelYAdjustment];
    double v2 = v3;
  }

  return v2;
}

void sub_4EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4ED0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = WeakRetained;
  if (WeakRetained)
  {
    double v3 = [WeakRetained videoPlayerView];
    v4 = [v2 currentListing];
    v5 = [v4 video];
    if (!v5)
    {
      v6 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_51CC(v4, v6);
      }
    }
    [v3 loadVideo:v5];
    if (([v2 paused] & 1) == 0) {
      [v3 play];
    }
    v7 = [v2 posterImageView];
    [v7 setHidden:1];
  }
}

void sub_51CC(void *a1, NSObject *a2)
{
  int v4 = 136315906;
  v5 = "-[NTKVideoFaceView _handleTapToPlayVideoGesture:]_block_invoke";
  __int16 v6 = 2048;
  id v7 = [a1 theme];
  __int16 v8 = 2048;
  id v9 = [a1 variant];
  __int16 v10 = 2048;
  id v11 = [a1 clip];
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s — Video listing video is nil for theme (%lu) variant (%lu) clip (%lu)", (uint8_t *)&v4, 0x2Au);
}

uint64_t NTKAllUtilityLargeNarrowComplicationTypes()
{
  return _NTKAllUtilityLargeNarrowComplicationTypes();
}

uint64_t NTKAllUtilitySmallFlatComplicationTypes()
{
  return _NTKAllUtilitySmallFlatComplicationTypes();
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

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKWrappedDateComplicationType()
{
  return _NTKWrappedDateComplicationType();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
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

void objc_release(id a1)
{
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

id objc_msgSend__cancelDelayedPlayback(void *a1, const char *a2, ...)
{
  return [a1 _cancelDelayedPlayback];
}

id objc_msgSend__complicationForegroundColor(void *a1, const char *a2, ...)
{
  return [a1 _complicationForegroundColor];
}

id objc_msgSend__defaultListing(void *a1, const char *a2, ...)
{
  return [a1 _defaultListing];
}

id objc_msgSend__hideCurtainView(void *a1, const char *a2, ...)
{
  return [a1 _hideCurtainView];
}

id objc_msgSend__nextListing(void *a1, const char *a2, ...)
{
  return [a1 _nextListing];
}

id objc_msgSend__playNextVideo(void *a1, const char *a2, ...)
{
  return [a1 _playNextVideo];
}

id objc_msgSend__shouldAdjustLayoutForTimeTravel(void *a1, const char *a2, ...)
{
  return [a1 _shouldAdjustLayoutForTimeTravel];
}

id objc_msgSend__shouldDelayBeforePlayingNextVideo(void *a1, const char *a2, ...)
{
  return [a1 _shouldDelayBeforePlayingNextVideo];
}

id objc_msgSend__timeTravelYAdjustment(void *a1, const char *a2, ...)
{
  return [a1 _timeTravelYAdjustment];
}

id objc_msgSend__updateImageToBlur(void *a1, const char *a2, ...)
{
  return [a1 _updateImageToBlur];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_clip(void *a1, const char *a2, ...)
{
  return [a1 clip];
}

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentListing(void *a1, const char *a2, ...)
{
  return [a1 currentListing];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_discardAssets(void *a1, const char *a2, ...)
{
  return [a1 discardAssets];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faultInFaceContentSkippedDuringSwiping(void *a1, const char *a2, ...)
{
  return [a1 faultInFaceContentSkippedDuringSwiping];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_isContentUnloadedForFaceSwiping(void *a1, const char *a2, ...)
{
  return [a1 isContentUnloadedForFaceSwiping];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_overlayColor(void *a1, const char *a2, ...)
{
  return [a1 overlayColor];
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

id objc_msgSend_posterImageView(void *a1, const char *a2, ...)
{
  return [a1 posterImageView];
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

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return [a1 theme];
}

id objc_msgSend_timeScrubbing(void *a1, const char *a2, ...)
{
  return [a1 timeScrubbing];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_variant(void *a1, const char *a2, ...)
{
  return [a1 variant];
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

id objc_msgSend_videoTheme(void *a1, const char *a2, ...)
{
  return [a1 videoTheme];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}