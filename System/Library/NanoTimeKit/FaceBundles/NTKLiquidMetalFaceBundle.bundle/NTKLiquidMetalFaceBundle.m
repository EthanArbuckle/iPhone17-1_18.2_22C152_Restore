void sub_46E4(id a1)
{
  uint64_t v1;
  void *v2;
  void v3[4];
  void v4[4];

  v3[0] = &off_8920;
  v3[1] = &off_8950;
  v4[0] = @"silver";
  v4[1] = @"black";
  v3[2] = &off_8938;
  v3[3] = &off_8968;
  v4[2] = @"gold";
  v4[3] = @"all";
  v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  v2 = (void *)qword_CB00;
  qword_CB00 = v1;
}

id sub_52F0()
{
  if (qword_CB18 != -1) {
    dispatch_once(&qword_CB18, &stru_8290);
  }
  v0 = (void *)qword_CB10;

  return v0;
}

id sub_5344()
{
  if (qword_CB28 != -1) {
    dispatch_once(&qword_CB28, &stru_82B0);
  }
  v0 = (void *)qword_CB20;

  return v0;
}

void sub_6118(id a1)
{
  qword_CB10 = +[UIColor colorWithRed:0.705882353 green:0.517647059 blue:0.407843137 alpha:1.0];

  _objc_release_x1();
}

void sub_6174(id a1)
{
  qword_CB20 = +[UIColor colorWithRed:0.694117647 green:0.690196078 blue:0.717647059 alpha:1.0];

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