void sub_1230(id a1)
{
  id v1;
  void *v2;
  uint64_t vars8;

  v1 = objc_alloc_init((Class)NSNumberFormatter);
  v2 = (void *)qword_172E8;
  qword_172E8 = (uint64_t)v1;

  qword_172F0 = +[NTKMargaritaFaceBundle localizedStringForKey:@"MARGARITA_DEGREE_FORMAT" comment:&stru_10A08];

  _objc_release_x1();
}

void sub_1330()
{
  v0 = +[NSMutableDictionary dictionary];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend((id)objc_opt_class(), "__allOrderedValues", 0);
  id v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v7 = [v6 description];
        [v0 setObject:v7 forKeyedSubscript:v6];
      }
      id v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }

  id v8 = [v0 copy];
  v9 = (void *)qword_17300;
  qword_17300 = (uint64_t)v8;
}

void sub_1598(id a1)
{
  v3[0] = &off_11998;
  v3[1] = &off_119C8;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  v3[2] = &off_119B0;
  v3[3] = &off_119E0;
  v4[2] = NTKFaceBundleStyle3;
  v4[3] = NTKFaceBundleStyle4;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  id v2 = (void *)qword_17310;
  qword_17310 = v1;
}

double sub_18F4(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_17328);
  id WeakRetained = objc_loadWeakRetained(&qword_17330);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_17330);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_17330, v1);
    qword_17338 = (uint64_t)[v1 version];

    +[NTKAnalogUtilities largeDialDiameterForDevice:v1];
    qword_17320 = v8;
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_17338;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_17328);
  double v9 = *(double *)&qword_17320;

  return v9;
}

void sub_2C60(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 56);
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 transitionalPalette];
  [v6 setTransitionFraction:v3];

  id v7 = [*(id *)(a1 + 40) editOptionForSlot:v5];
  id v16 = [v7 pigmentEditOption];

  uint64_t v8 = [*(id *)(a1 + 32) transitionalPalette];
  double v9 = [v8 fromPalette];

  [v9 setPigmentEditOption:v16];
  [v9 setEditing:0];
  [v9 setStyle:*(void *)(*(void *)(a1 + 32) + 8)];
  long long v10 = [*(id *)(a1 + 32) transitionalPalette];
  long long v11 = [v10 toPalette];

  [v11 setPigmentEditOption:v16];
  [v11 setEditing:1];
  [v11 setStyle:*(void *)(*(void *)(a1 + 32) + 8)];
  long long v12 = *(void **)(a1 + 48);
  long long v13 = [*(id *)(a1 + 32) transitionalPalette];
  v14 = [v13 stripe];
  id v15 = [v5 integerValue];

  [v12 setStripeColor:v14 atIndex:v15];
}

void sub_48AC(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) normalComplicationDisplayWrapperForSlot:a2];
  id v2 = [v5 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = [v5 display];
    [v4 updateMonochromeColor];
  }
}

void sub_4E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4E20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4E30(uint64_t a1)
{
}

uint64_t sub_4E38(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 complication];

  return _objc_release_x1();
}

void sub_52C4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  id v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

void sub_5894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_58BC(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  if ((uint64_t)[v6 integerValue] > *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    || [v6 integerValue] == *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && (id v7 = [*(id *)(a1 + 32) slotIndexForOption:v8],
        v7 < [*(id *)(a1 + 32) slotIndexForOption:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)]))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 integerValue];
  }
}

void sub_5AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5B14(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "editOptionForSlot:");
  id v7 = [v6 pigmentEditOption];

  if ([*(id *)(a1 + 40) isEqual:v7])
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 integerValue];
    *a4 = 1;
  }
}

void sub_5EE0(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) defaultFaceForDevice:*(void *)(a1 + 40)];
  id v4 = v3;
  if (v3)
  {
    [v3 selectOption:v5 forCustomEditMode:11 slot:0];
    [*(id *)(a1 + 48) addObject:v4];
  }
}

id sub_6E24()
{
  if (qword_17370 != -1) {
    dispatch_once(&qword_17370, &stru_106E0);
  }
  v0 = (void *)qword_17368;

  return v0;
}

void sub_703C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  id v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

id sub_72C4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 CGContext];

  return [v2 renderInContext:v3];
}

void sub_7564(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CALayer layer];
  id v6 = v3;
  objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));
  id v5 = sub_6E24();
  [v4 setActions:v5];

  [v4 setAllowsEdgeAntialiasing:1];
  [*(id *)(*(void *)(a1 + 32) + 24) insertSublayer:v4 atIndex:0];
  [*(id *)(a1 + 40) addObject:v4];
}

id sub_7730(double *a1, void *a2, unint64_t a3)
{
  return objc_msgSend(a2, "setFrame:", (double)a3 * a1[4] + -0.5, (double)a3 * a1[5] + -0.5, a1[6] + 1.0, a1[7] + 1.0);
}

double sub_7F34(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_17350);
  id WeakRetained = objc_loadWeakRetained(&qword_17358);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_17358);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_17358, v1);
    qword_17360 = (uint64_t)[v1 version];

    sub_8328(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_17360;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_17350);
  double v9 = *(double *)&qword_17340;

  return v9;
}

void sub_8328(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v6 scaledValue:3 withOverride:133.0 forSizeClass:151.0];
  qword_17340 = v3;
  +[NTKAnalogUtilities dialDiameterForDevice:v2];
  uint64_t v5 = v4;

  qword_17348 = v5;
}

void sub_83D0(id a1)
{
  id v1 = +[NSNull null];
  v4[0] = @"backgroundColor";
  v4[1] = @"cornerCurve";
  v5[0] = v1;
  v5[1] = v1;
  v4[2] = @"cornerRadius";
  v4[3] = @"affineTransform";
  v5[2] = v1;
  v5[3] = v1;
  void v4[4] = @"transform";
  v4[5] = @"bounds";
  v5[4] = v1;
  v5[5] = v1;
  v4[6] = @"position";
  v4[7] = @"opacity";
  v5[6] = v1;
  v5[7] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
  uint64_t v3 = (void *)qword_17368;
  qword_17368 = v2;
}

void sub_8598(id a1)
{
  v3[0] = &off_11B90;
  v3[1] = &off_11B78;
  v4[0] = @"white";
  v4[1] = @"light-gray";
  v3[2] = &off_11B60;
  v3[3] = &off_11B48;
  v4[2] = @"gray";
  v4[3] = @"dark-grey";
  void v3[4] = &off_11B30;
  v3[5] = &off_11B18;
  void v4[4] = @"charcoal";
  v4[5] = @"black";
  v3[6] = &off_11C20;
  v3[7] = &off_11C38;
  v4[6] = @"brick-red";
  v4[7] = @"red";
  v3[8] = &off_11C50;
  v3[9] = &off_11C68;
  void v4[8] = @"rose-red";
  v4[9] = @"bright-red";
  v3[10] = &off_11C80;
  v3[11] = &off_11C98;
  v4[10] = @"pink";
  v4[11] = @"orange-red";
  v3[12] = &off_11CB0;
  v3[13] = &off_11CC8;
  v4[12] = @"orange";
  v4[13] = @"mustard";
  v3[14] = &off_11CE0;
  v3[15] = &off_11CF8;
  v4[14] = @"yellow";
  v4[15] = @"light-yellow";
  v3[16] = &off_11D28;
  v3[17] = &off_11D40;
  v4[16] = @"light-green";
  v4[17] = @"green";
  v3[18] = &off_11D58;
  v3[19] = &off_11D88;
  v4[18] = @"dark-green";
  v4[19] = @"turquoise";
  v3[20] = &off_11DB8;
  v3[21] = &off_11DD0;
  v4[20] = @"slate";
  v4[21] = @"deep-navy";
  v3[22] = &off_11E00;
  v3[23] = &off_11E18;
  v4[22] = @"royal-blue";
  v4[23] = @"lake-blue";
  v3[24] = &off_11E30;
  v3[25] = &off_11E48;
  v4[24] = @"sky-blue";
  v4[25] = @"light-blue";
  v3[26] = &off_11E60;
  v3[27] = &off_11E78;
  v4[26] = @"violet";
  v4[27] = @"purple";
  v3[28] = &off_11E90;
  v3[29] = &off_11EA8;
  v4[28] = @"deep-purple";
  v4[29] = @"magenta";
  v3[30] = &off_11EC0;
  v3[31] = &off_11ED8;
  v4[30] = @"fuchsia";
  v4[31] = @"dusty-rose";
  v3[32] = &off_11EF0;
  v3[33] = &off_11BA8;
  v4[32] = @"light-pink";
  v4[33] = @"beige";
  v3[34] = &off_11BC0;
  v3[35] = &off_11BD8;
  v4[34] = @"tan";
  v4[35] = @"coffee";
  v3[36] = &off_11BF0;
  v3[37] = &off_11C08;
  v4[36] = @"brown";
  v4[37] = @"dark-brown";
  v3[38] = &off_11D10;
  v3[39] = &off_11D70;
  v4[38] = @"lime-green";
  v4[39] = @"teal";
  v3[40] = &off_11DA0;
  v3[41] = &off_11DE8;
  v4[40] = @"jade-green";
  v4[41] = @"gre-blue";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:42];
  uint64_t v2 = (void *)qword_17378;
  qword_17378 = v1;
}

void sub_8BD4()
{
  v0 = +[NSMutableDictionary dictionary];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v1 = objc_msgSend((id)objc_opt_class(), "__allOrderedValues", 0);
  id v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v7 = [v6 description];
        [v0 setObject:v7 forKeyedSubscript:v6];
      }
      id v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }

  id v8 = [v0 copy];
  double v9 = (void *)qword_17388;
  qword_17388 = (uint64_t)v8;
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  return _CGPathGetPathBoundingBox(path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenRects()
{
  return _CLKInterpolateBetweenRects();
}

uint64_t CLKInterpolateBetweenSizes()
{
  return _CLKInterpolateBetweenSizes();
}

uint64_t CLKInterpolateBetweenVectors()
{
  return _CLKInterpolateBetweenVectors();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t CLKSizeCenteredInRectForDevice()
{
  return _CLKSizeCenteredInRectForDevice();
}

uint64_t CLKUIDefaultAlternateComplicationColor()
{
  return _CLKUIDefaultAlternateComplicationColor();
}

uint64_t CLKUIMonochromeFiltersForStyleWithTintedBackground()
{
  return _CLKUIMonochromeFiltersForStyleWithTintedBackground();
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKColorByBrightening()
{
  return _NTKColorByBrightening();
}

uint64_t NTKColorWithRGBA()
{
  return _NTKColorWithRGBA();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKDesatMonochromeFilter()
{
  return _NTKDesatMonochromeFilter();
}

uint64_t NTKDesatMonochromeFilterOpaque()
{
  return _NTKDesatMonochromeFilterOpaque();
}

uint64_t NTKFlatMonochromeFilter()
{
  return _NTKFlatMonochromeFilter();
}

uint64_t NTKFlatMonochromeFilterOpaque()
{
  return _NTKFlatMonochromeFilterOpaque();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKKeylineViewWithBezierPath()
{
  return _NTKKeylineViewWithBezierPath();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

long double acos(long double __x)
{
  return _acos(__x);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double sin(long double __x)
{
  return _sin(__x);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend__bezelComplicationTextWidthInRadians(void *a1, const char *a2, ...)
{
  return [a1 _bezelComplicationTextWidthInRadians];
}

id objc_msgSend__colorSlots(void *a1, const char *a2, ...)
{
  return [a1 _colorSlots];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__hasBezelComplication(void *a1, const char *a2, ...)
{
  return [a1 _hasBezelComplication];
}

id objc_msgSend__layoutStripes(void *a1, const char *a2, ...)
{
  return [a1 _layoutStripes];
}

id objc_msgSend__loadContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadContentViews];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__maxStripeCount(void *a1, const char *a2, ...)
{
  return [a1 _maxStripeCount];
}

id objc_msgSend__recreateStripeLayers(void *a1, const char *a2, ...)
{
  return [a1 _recreateStripeLayers];
}

id objc_msgSend__removeContentViews(void *a1, const char *a2, ...)
{
  return [a1 _removeContentViews];
}

id objc_msgSend__removeDialView(void *a1, const char *a2, ...)
{
  return [a1 _removeDialView];
}

id objc_msgSend__shouldShowDial(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowDial];
}

id objc_msgSend__updateComplicationColors(void *a1, const char *a2, ...)
{
  return [a1 _updateComplicationColors];
}

id objc_msgSend__utilityBezelComplicationView(void *a1, const char *a2, ...)
{
  return [a1 _utilityBezelComplicationView];
}

id objc_msgSend__value(void *a1, const char *a2, ...)
{
  return [a1 _value];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_analogTimeView(void *a1, const char *a2, ...)
{
  return [a1 analogTimeView];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return [a1 backgroundView];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return [a1 bezierPath];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return [a1 closePath];
}

id objc_msgSend_coffee(void *a1, const char *a2, ...)
{
  return [a1 coffee];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_colorOption(void *a1, const char *a2, ...)
{
  return [a1 colorOption];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
}

id objc_msgSend_complication(void *a1, const char *a2, ...)
{
  return [a1 complication];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationTemplate(void *a1, const char *a2, ...)
{
  return [a1 complicationTemplate];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
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

id objc_msgSend_darkGray(void *a1, const char *a2, ...)
{
  return [a1 darkGray];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_dialView(void *a1, const char *a2, ...)
{
  return [a1 dialView];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_digitalTimeView(void *a1, const char *a2, ...)
{
  return [a1 digitalTimeView];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editConfigurations(void *a1, const char *a2, ...)
{
  return [a1 editConfigurations];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_faceViewComplicationSlots(void *a1, const char *a2, ...)
{
  return [a1 faceViewComplicationSlots];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_faceViewShouldIgnoreSnapshotImages(void *a1, const char *a2, ...)
{
  return [a1 faceViewShouldIgnoreSnapshotImages];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isBlackColor(void *a1, const char *a2, ...)
{
  return [a1 isBlackColor];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 isWhiteColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rotation(void *a1, const char *a2, ...)
{
  return [a1 rotation];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 screenCornerRadius];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_showAllTicksInDial(void *a1, const char *a2, ...)
{
  return [a1 showAllTicksInDial];
}

id objc_msgSend_softBlack(void *a1, const char *a2, ...)
{
  return [a1 softBlack];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_stripe(void *a1, const char *a2, ...)
{
  return [a1 stripe];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_suggestedColorOptionForComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 suggestedColorOptionForComplicationColor];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_textWidthInRadians(void *a1, const char *a2, ...)
{
  return [a1 textWidthInRadians];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_totalStripeCount(void *a1, const char *a2, ...)
{
  return [a1 totalStripeCount];
}

id objc_msgSend_transitionalPalette(void *a1, const char *a2, ...)
{
  return [a1 transitionalPalette];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}