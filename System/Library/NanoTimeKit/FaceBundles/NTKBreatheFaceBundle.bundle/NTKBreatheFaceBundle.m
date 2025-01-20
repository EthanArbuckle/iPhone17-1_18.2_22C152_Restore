void sub_3ED0(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  unsigned int v4;
  _UNKNOWN **v5;
  void *v6;
  uint64_t vars8;

  v2 = a2;
  v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
  v4 = [v2 supportsCapability:v3];

  v5 = &off_8BF0;
  v6 = (void *)qword_CB38;
  if (v4) {
    v5 = &off_8BD8;
  }
  qword_CB38 = (uint64_t)v5;
}

void sub_4130(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) device];
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
  unsigned int v3 = [v1 supportsCapability:v2];

  if (v3)
  {
    v11[0] = &off_8980;
    v11[1] = &off_8998;
    v12[0] = NTKFaceBundleBreatheVideoStyleOrbs;
    v12[1] = NTKFaceBundleBreatheVideoStyleClassic;
    v11[2] = &off_89B0;
    v11[3] = &off_89C8;
    v12[2] = NTKFaceBundleBreatheVideoStyleCalm;
    v12[3] = NTKFaceBundleBreatheVideoStyleFocus;
    v4 = v12;
    v5 = v11;
    uint64_t v6 = 4;
  }
  else
  {
    v9[0] = &off_8998;
    v9[1] = &off_89B0;
    v10[0] = NTKFaceBundleBreatheVideoStyleClassic;
    v10[1] = NTKFaceBundleBreatheVideoStyleCalm;
    v9[2] = &off_89C8;
    v10[2] = NTKFaceBundleBreatheVideoStyleFocus;
    v4 = v10;
    v5 = v9;
    uint64_t v6 = 3;
  }
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v5 count:v6];
  v8 = (void *)qword_CB58;
  qword_CB58 = v7;
}

id sub_4384()
{
  if (qword_CB70 != -1) {
    dispatch_once(&qword_CB70, &stru_8328);
  }
  v0 = (void *)qword_CB68;

  return v0;
}

id sub_4800()
{
  if (qword_CBB0 != -1) {
    dispatch_once(&qword_CBB0, &stru_83E8);
  }
  v0 = (void *)qword_CBA8;

  return v0;
}

void sub_4D50(id a1)
{
  qword_CB68 = +[UIColor colorWithRed:0.0 green:0.462222222 blue:0.368627451 alpha:1.0];

  _objc_release_x1();
}

void sub_4DA8(uint64_t a1, void *a2)
{
  id v2 = a2;
  +[NTKAnalogUtilities dialSizeForDevice:v2];
  double v4 = v3;
  id v10 = +[UIGraphicsImageRendererFormat preferredFormat];
  [v2 screenScale];
  double v6 = v5;

  [v10 setScale:v6];
  [v10 setPreferredRange:2];
  id v7 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", v4, v4);
  uint64_t v8 = [v7 imageWithActions:&stru_8368];
  v9 = (void *)qword_CB78;
  qword_CB78 = v8;
}

void sub_4E84(id a1, UIGraphicsImageRendererContext *a2)
{
  id v2 = a2;
  double v3 = sub_4800();
  double v4 = [v3 colorWithAlphaComponent:0.235294118];
  [v4 setFill];

  id v6 = [(UIGraphicsImageRendererContext *)v2 format];

  [v6 bounds];
  double v5 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
  [v5 fill];
}

void sub_4F34(id a1)
{
  id v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v1 = CLKClearCacheRequestNotification;
  id v2 = +[NSOperationQueue mainQueue];
  uint64_t v3 = [v5 addObserverForName:v1 object:0 queue:v2 usingBlock:&stru_83C8];
  double v4 = (void *)qword_CB98;
  qword_CB98 = v3;
}

void sub_4FD4(id a1, NSNotification *a2)
{
  id v2 = (void *)qword_CB78;
  qword_CB78 = 0;
}

void sub_4FE4(id a1)
{
  qword_CBA8 = +[UIColor colorWithRed:0.650980392 green:1.13333333 blue:0.97254902 alpha:1.0];

  _objc_release_x1();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllUtilityLargeComplicationTypes()
{
  return _NTKAllUtilityLargeComplicationTypes();
}

uint64_t NTKAllUtilitySmallComplicationTypes()
{
  return _NTKAllUtilitySmallComplicationTypes();
}

uint64_t NTKColorByPremultiplyingAlpha()
{
  return _NTKColorByPremultiplyingAlpha();
}

uint64_t NTKCompanionClockFaceLocalizedString()
{
  return _NTKCompanionClockFaceLocalizedString();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKDefaultAppLaunchLocation()
{
  return _NTKDefaultAppLaunchLocation();
}

uint64_t NTKImageNamedFromAssetsBundle()
{
  return _NTKImageNamedFromAssetsBundle();
}

uint64_t NTKLaunchApp()
{
  return _NTKLaunchApp();
}

uint64_t NTKMultiFamilyComplicationSlotDescriptor()
{
  return _NTKMultiFamilyComplicationSlotDescriptor();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend__applyVideoPlayerTransform(void *a1, const char *a2, ...)
{
  return [a1 _applyVideoPlayerTransform];
}

id objc_msgSend__releaseBacklightAssertion(void *a1, const char *a2, ...)
{
  return [a1 _releaseBacklightAssertion];
}

id objc_msgSend__takeBacklightAssertion(void *a1, const char *a2, ...)
{
  return [a1 _takeBacklightAssertion];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentVideoStyle(void *a1, const char *a2, ...)
{
  return [a1 currentVideoStyle];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_posterImage(void *a1, const char *a2, ...)
{
  return [a1 posterImage];
}

id objc_msgSend_preferredFormat(void *a1, const char *a2, ...)
{
  return [a1 preferredFormat];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_setupDataSources(void *a1, const char *a2, ...)
{
  return [a1 setupDataSources];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_videoPlayerView(void *a1, const char *a2, ...)
{
  return [a1 videoPlayerView];
}