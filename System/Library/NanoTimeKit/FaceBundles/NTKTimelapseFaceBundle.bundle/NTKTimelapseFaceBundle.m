void sub_3C7C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  uint64_t vars8;

  v2 = a2;
  v3 = [[NTKTimelapseListingFactory alloc] _initLibraryForDevice:v2];

  v4 = (void *)qword_154C8;
  qword_154C8 = (uint64_t)v3;
}

uint64_t NTKVideoIndexForTimelapseTheme(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  id v8 = objc_msgSend(objc_alloc((Class)GEOHorizontalCelestialBodyData), "initWithLocation:date:body:", v7, 0, a3, a4);
  [v8 altitude];
  double v10 = v9;
  v11 = [v7 dateByAddingTimeInterval:-900.0];
  v12 = [v7 dateByAddingTimeInterval:900.0];
  id v13 = objc_msgSend(objc_alloc((Class)GEOHorizontalCelestialBodyData), "initWithLocation:date:body:", v11, 0, a3, a4);
  id v14 = objc_msgSend(objc_alloc((Class)GEOHorizontalCelestialBodyData), "initWithLocation:date:body:", v12, 0, a3, a4);
  [v13 altitude];
  double v16 = v15;
  [v14 altitude];
  BOOL v18 = v16 >= v10;
  if (v17 < v10) {
    BOOL v18 = 0;
  }
  if (v16 < v10) {
    BOOL v18 = 1;
  }
  BOOL v20 = (v16 > v10 || v17 > v10) && v18;

  id v21 = v8;
  [v21 altitude];
  if (v20) {
    unint64_t v23 = 18;
  }
  else {
    unint64_t v23 = 36;
  }
  if (v20) {
    unint64_t v24 = 0;
  }
  else {
    unint64_t v24 = 18;
  }
  unint64_t v25 = a1 - 1;
  if ((unint64_t)(a1 - 1) > 4) {
    v26 = &unk_D768;
  }
  else {
    v26 = *(&off_102A0 + v25);
  }
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  double v28 = INFINITY;
  do
  {
    double v29 = (double)qword_D648[v24] - v22;
    if (v29 < 0.0) {
      double v29 = -v29;
    }
    if (v29 < v28 && v26[v24] != -1)
    {
      uint64_t v27 = v24;
      double v28 = v29;
    }
    ++v24;
  }
  while (v24 < v23);
  if (v25 > 4) {
    v30 = &unk_D768;
  }
  else {
    v30 = *(&off_102A0 + v25);
  }
  uint64_t v31 = v30[v27];

  return v31;
}

uint64_t NTKNumberOfTimelapseSlots()
{
  return 36;
}

id NTKPhotoAnalysisForTimelapseVideo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a3 - 2) > 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_DE28[a3 - 2];
  }
  switch(a1)
  {
    case 0:
      v5 = (char *)&unk_9CA0;
      goto LABEL_11;
    case 1:
      v6 = (char *)&unk_C4F0 + 800 * v4;
      uint64_t v7 = 20;
      goto LABEL_12;
    case 2:
      v6 = (char *)&unk_AE70 + 1040 * v4;
      uint64_t v7 = 26;
      goto LABEL_12;
    case 3:
      v6 = (char *)&unk_A6F0 + 640 * v4;
      uint64_t v7 = 16;
      goto LABEL_12;
    case 4:
      v6 = (char *)&unk_CE50 + 680 * v4;
      uint64_t v7 = 17;
      goto LABEL_12;
    case 5:
      v5 = (char *)&unk_BAA0;
LABEL_11:
      v6 = &v5[880 * v4];
      uint64_t v7 = 22;
LABEL_12:
      if (a2 < 1 || v7 < a2) {
        goto LABEL_15;
      }
      id v8 = objc_alloc((Class)NTKPhotoAnalysis);
      double v9 = &v6[40 * a2];
      long long v10 = *(_OWORD *)(v9 - 24);
      v13[0] = *(_OWORD *)(v9 - 40);
      v13[1] = v10;
      uint64_t v14 = *((void *)v9 - 1);
      id v11 = [v8 initWithStructure:v13];
      break;
    default:
LABEL_15:
      id v11 = +[NTKPhotoAnalysis defaultAnalysis];
      break;
  }

  return v11;
}

uint64_t sub_4AC8()
{
  qword_154E8 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_4D00(id a1)
{
  v3[0] = &off_10A40;
  v3[1] = &off_10A58;
  v4[0] = @"Mack Lake";
  v4[1] = @"New York";
  v3[2] = &off_10A70;
  v3[3] = &off_10A88;
  v4[2] = @"Hong Kong";
  v4[3] = @"London";
  v3[4] = &off_10AA0;
  v3[5] = &off_10AB8;
  v4[4] = @"Paris";
  v4[5] = @"Shanghai";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  v2 = (void *)qword_15508;
  qword_15508 = v1;
}

id sub_5844(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

id sub_5888(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(void **)(a1 + 40);

  return [v2 removeFromSuperview];
}

void sub_6068(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = [a3 display];
  uint64_t v7 = v6;
  if (*(unsigned char *)(a1 + 40))
  {
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    uint64_t v14 = sub_61B8;
    double v15 = &unk_103A0;
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 32);
    id v16 = v8;
    uint64_t v17 = v9;
    +[UIView transitionWithView:v8 duration:5242880 options:&v12 animations:0 completion:0.8];
  }
  else
  {
    [v6 setForegroundColor:*(void *)(*(void *)(a1 + 32) + 48)];
  }
  objc_msgSend(v7, "setShadowColor:", *(void *)(*(void *)(a1 + 32) + 56), v12, v13, v14, v15);
  unsigned __int8 v10 = [v5 isEqualToString:NTKComplicationSlotBottom];

  if (v10) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = *(unsigned char *)(*(void *)(a1 + 32) + 80) & 1;
  }
  [v7 setUsesLegibility:v11];
}

id sub_61B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setForegroundColor:*(void *)(*(void *)(a1 + 40) + 48)];
}

id sub_6898(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) videoPlayerView];
  [v2 setAlpha:1.0];

  [*(id *)(*(void *)(a1 + 32) + 64) setAlpha:1.0];
  v3 = *(void **)(*(void *)(a1 + 32) + 72);

  return [v3 setAlpha:1.0];
}

id sub_6910(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) videoPlayerView];
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v13[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v8 = v13[0];
  v13[1] = v9;
  long long v14 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v7 = v14;
  [v2 setTransform:v13];

  v3 = *(void **)(*(void *)(a1 + 32) + 64);
  v12[0] = v8;
  v12[1] = v9;
  v12[2] = v7;
  [v3 setTransform:v12];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 72);
  v11[0] = v8;
  v11[1] = v9;
  v11[2] = v7;
  [v4 setTransform:v11];
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  v10[0] = v8;
  v10[1] = v9;
  v10[2] = v7;
  return [v5 setTransform:v10];
}

void sub_6AFC(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) videoPlayerView];
  long long v5 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v2 seekToTime:&v5];

  if (([*(id *)(a1 + 32) paused] & 1) == 0)
  {
    v3 = [*(id *)(a1 + 32) videoPlayerView];
    [v3 play];
  }
  uint64_t v4 = [*(id *)(a1 + 32) posterImageView];
  [v4 setHidden:1];
}

id sub_722C(uint64_t a1)
{
  [*(id *)(a1 + 32) setColor:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 setShadowColor:v3];
}

void sub_79E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  [v4 setForegroundColor:*(void *)(a1 + 32)];
  [v4 setShadowColor:*(void *)(a1 + 40)];
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

uint64_t CLKAlterRect()
{
  return _CLKAlterRect();
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

uint64_t NTKImageNamed()
{
  return _NTKImageNamed();
}

uint64_t NTKImageNamedFromAssetsBundle()
{
  return _NTKImageNamedFromAssetsBundle();
}

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__cancelDelayedPlayback(void *a1, const char *a2, ...)
{
  return [a1 _cancelDelayedPlayback];
}

id objc_msgSend__configureComplicationFactory(void *a1, const char *a2, ...)
{
  return [a1 _configureComplicationFactory];
}

id objc_msgSend__curtainView(void *a1, const char *a2, ...)
{
  return [a1 _curtainView];
}

id objc_msgSend__curtainViewVisible(void *a1, const char *a2, ...)
{
  return [a1 _curtainViewVisible];
}

id objc_msgSend__hideCurtainView(void *a1, const char *a2, ...)
{
  return [a1 _hideCurtainView];
}

id objc_msgSend__nextListing(void *a1, const char *a2, ...)
{
  return [a1 _nextListing];
}

id objc_msgSend__setHasAssets(void *a1, const char *a2, ...)
{
  return [a1 _setHasAssets];
}

id objc_msgSend__shouldAdjustLayoutForTimeTravel(void *a1, const char *a2, ...)
{
  return [a1 _shouldAdjustLayoutForTimeTravel];
}

id objc_msgSend__timeTravelYAdjustment(void *a1, const char *a2, ...)
{
  return [a1 _timeTravelYAdjustment];
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return [a1 altitude];
}

id objc_msgSend_anyLocation(void *a1, const char *a2, ...)
{
  return [a1 anyLocation];
}

id objc_msgSend_backgroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 backgroundContainerView];
}

id objc_msgSend_bgBrightness(void *a1, const char *a2, ...)
{
  return [a1 bgBrightness];
}

id objc_msgSend_bgHue(void *a1, const char *a2, ...)
{
  return [a1 bgHue];
}

id objc_msgSend_bgSaturation(void *a1, const char *a2, ...)
{
  return [a1 bgSaturation];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentListing(void *a1, const char *a2, ...)
{
  return [a1 currentListing];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_defaultAnalysis(void *a1, const char *a2, ...)
{
  return [a1 defaultAnalysis];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_discardAssets(void *a1, const char *a2, ...)
{
  return [a1 discardAssets];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_faultInFaceContentSkippedDuringSwiping(void *a1, const char *a2, ...)
{
  return [a1 faultInFaceContentSkippedDuringSwiping];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_isColoredText(void *a1, const char *a2, ...)
{
  return [a1 isColoredText];
}

id objc_msgSend_isComplexBackground(void *a1, const char *a2, ...)
{
  return [a1 isComplexBackground];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_paused(void *a1, const char *a2, ...)
{
  return [a1 paused];
}

id objc_msgSend_photoAnalysis(void *a1, const char *a2, ...)
{
  return [a1 photoAnalysis];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_posterImageView(void *a1, const char *a2, ...)
{
  return [a1 posterImageView];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resourceBaseName(void *a1, const char *a2, ...)
{
  return [a1 resourceBaseName];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_shadowBrightness(void *a1, const char *a2, ...)
{
  return [a1 shadowBrightness];
}

id objc_msgSend_shadowHue(void *a1, const char *a2, ...)
{
  return [a1 shadowHue];
}

id objc_msgSend_shadowSaturation(void *a1, const char *a2, ...)
{
  return [a1 shadowSaturation];
}

id objc_msgSend_sharedLocationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedLocationManager];
}

id objc_msgSend_shouldPause(void *a1, const char *a2, ...)
{
  return [a1 shouldPause];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_textBrightness(void *a1, const char *a2, ...)
{
  return [a1 textBrightness];
}

id objc_msgSend_textHue(void *a1, const char *a2, ...)
{
  return [a1 textHue];
}

id objc_msgSend_textSaturation(void *a1, const char *a2, ...)
{
  return [a1 textSaturation];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return [a1 theme];
}

id objc_msgSend_timeScrubbing(void *a1, const char *a2, ...)
{
  return [a1 timeScrubbing];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_timelapseTheme(void *a1, const char *a2, ...)
{
  return [a1 timelapseTheme];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_videoIndex(void *a1, const char *a2, ...)
{
  return [a1 videoIndex];
}

id objc_msgSend_videoPlayerView(void *a1, const char *a2, ...)
{
  return [a1 videoPlayerView];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}