void sub_45D4(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  void *v4;
  double *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = [*(id *)(a1 + 32) isEqual:NTKComplicationSlotCenter];
  v3 = *(void **)(a1 + 40);
  v4 = [*(id *)(a1 + 48) device];
  _NTKDigitalModularLayoutConstants();
  if (v2) {
    v5 = (double *)&v9;
  }
  else {
    v5 = (double *)&v8;
  }
  [v3 setContentHeight:*v5];

  v6 = *(void **)(a1 + 48);
  v7 = [v6 faceColorPalette];
  [v6 _applyFaceColorPalette:v7 toModuleView:*(void *)(a1 + 40)];
}

void sub_4CE8(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  v3 = [v2 faceColorPalette];
  [v2 _applyFaceColorPalette:v3 toModuleView:v4];

  [v4 setHighlightAlpha:0.0];
}

void sub_4EAC(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  if (a3 == 2 || a3 == 1 || (double v5 = 0.0, !a3)) {
    CLKCompressFraction();
  }
  double v6 = v5 + -0.5;
  if (v5 + -0.5 < 0.0) {
    double v6 = -(v5 + -0.5);
  }
  double v7 = 0.5 - v6;
  objc_msgSend(v11, "applyTransitionFraction:fromFaceColorPalette:toFaceColorPalette:units:brightenedUnits:", *(void *)(a1 + 32), *(void *)(a1 + 40), 71, 1);
  [v11 setHighlightAlpha:v7];
  double v8 = *(double *)(a1 + 48);
  if (([*(id *)(a1 + 32) isMulticolor] & 1) != 0
    || [*(id *)(a1 + 40) isMulticolor])
  {
    if ([*(id *)(a1 + 40) isMulticolor])
    {
      unsigned __int8 v9 = [*(id *)(a1 + 32) isMulticolor];
      v10 = v11;
      if ((v9 & 1) == 0) {
        double v8 = 1.0 - *(double *)(a1 + 48);
      }
    }
    else
    {
      v10 = v11;
    }
    [v10 transitionToMonochromeWithFraction:v8];
  }
  else
  {
    [v11 updateMonochromeColor];
  }
}

void sub_5450(uint64_t a1, uint64_t a2)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(a1 + 32) _complicationSlotsForRow:a2];
  id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = [*(id *)(a1 + 32) _moduleViewForComplicationSlot:*(void *)(*((void *)&v16 + 1) + 8 * (void)v7)];
        unsigned __int8 v9 = objc_opt_class();
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_5600;
        v12[3] = &unk_8328;
        id v13 = v8;
        id v14 = *(id *)(a1 + 40);
        uint64_t v15 = a2;
        id v10 = v8;
        [v9 _performIfNonRichModuleView:v10 actions:v12];

        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

void *sub_5600(void *result)
{
  uint64_t v1 = result[4];
  if (v1) {
    return (void *)(*(uint64_t (**)(void, uint64_t, void))(result[5] + 16))(result[5], v1, result[6]);
  }
  return result;
}

id sub_56F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyFaceColorPalette:*(void *)(a1 + 40) units:71];
}

id sub_57BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t CLKCompressFraction()
{
  return _CLKCompressFraction();
}

uint64_t CLKLocaleIs24HourMode()
{
  return _CLKLocaleIs24HourMode();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t NTKAllLargeComplicationTypes()
{
  return _NTKAllLargeComplicationTypes();
}

uint64_t NTKAllSmallComplicationTypes()
{
  return _NTKAllSmallComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
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

uint64_t NTKDefaultFaceColorForDeviceCollection()
{
  return _NTKDefaultFaceColorForDeviceCollection();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t _NTKDigitalModularLayoutConstants()
{
  return __NTKDigitalModularLayoutConstants();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__handleLocaleDidChange(void *a1, const char *a2, ...)
{
  return [a1 _handleLocaleDidChange];
}

id objc_msgSend__updateLocale(void *a1, const char *a2, ...)
{
  return [a1 _updateLocale];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
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

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
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

id objc_msgSend_deviceSupportsPigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsPigmentEditOption];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_faceColor(void *a1, const char *a2, ...)
{
  return [a1 faceColor];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_foregroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 foregroundContainerView];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isMulticolor(void *a1, const char *a2, ...)
{
  return [a1 isMulticolor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_runningInStoreDemoModeFProgramNumber(void *a1, const char *a2, ...)
{
  return [a1 runningInStoreDemoModeFProgramNumber];
}

id objc_msgSend_timeScrubbing(void *a1, const char *a2, ...)
{
  return [a1 timeScrubbing];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}