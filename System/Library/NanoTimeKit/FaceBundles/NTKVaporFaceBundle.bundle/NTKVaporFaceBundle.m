void sub_4CB4(id a1)
{
  uint64_t v1;
  void *v2;
  void v3[4];
  void v4[4];

  v3[0] = &off_8A18;
  v3[1] = &off_8A48;
  v4[0] = @"blue/green";
  v4[1] = @"pink/orange";
  v3[2] = &off_8A30;
  v3[3] = &off_8A60;
  v4[2] = @"black/white";
  v4[3] = @"all";
  v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  v2 = (void *)qword_CB28;
  qword_CB28 = v1;
}

id sub_511C()
{
  if (qword_CB50 != -1) {
    dispatch_once(&qword_CB50, &stru_82A8);
  }
  v0 = (void *)qword_CB48;

  return v0;
}

id sub_5170()
{
  if (qword_CB60 != -1) {
    dispatch_once(&qword_CB60, &stru_82C8);
  }
  v0 = (void *)qword_CB58;

  return v0;
}

id sub_51C4()
{
  if (qword_CB70 != -1) {
    dispatch_once(&qword_CB70, &stru_82E8);
  }
  v0 = (void *)qword_CB68;

  return v0;
}

void sub_5F98(id a1)
{
  qword_CB38 = +[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];

  _objc_release_x1();
}

void sub_5FEC(id a1)
{
  qword_CB48 = +[UIColor colorWithRed:0.325490196 green:0.694117647 blue:0.850980392 alpha:1.0];

  _objc_release_x1();
}

void sub_6048(id a1)
{
  qword_CB58 = +[UIColor colorWithRed:0.694117647 green:0.690196078 blue:0.717647059 alpha:1.0];

  _objc_release_x1();
}

void sub_60A4(id a1)
{
  qword_CB68 = +[UIColor colorWithRed:0.894117647 green:0.37254902 blue:0.305882353 alpha:1.0];

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

uint64_t NTKImageNamedFromAssetsBundle()
{
  return _NTKImageNamedFromAssetsBundle();
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

id objc_msgSend__updateDialSize(void *a1, const char *a2, ...)
{
  return [a1 _updateDialSize];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
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

id objc_msgSend_dialShape(void *a1, const char *a2, ...)
{
  return [a1 dialShape];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_posterImage(void *a1, const char *a2, ...)
{
  return [a1 posterImage];
}

id objc_msgSend_reloadDataSources(void *a1, const char *a2, ...)
{
  return [a1 reloadDataSources];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_setupDataSources(void *a1, const char *a2, ...)
{
  return [a1 setupDataSources];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_videoPlayerView(void *a1, const char *a2, ...)
{
  return [a1 videoPlayerView];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}