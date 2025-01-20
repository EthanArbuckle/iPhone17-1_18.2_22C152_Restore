void sub_1CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

id sub_1D24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(objc_alloc((Class)NTKRichComplicationDialView), "initWithTickCount:tickSize:dialRange:startAngle:", *(void *)(*(void *)(a1 + 32) + 88), *(double *)(*(void *)(a1 + 32) + 96), *(double *)(*(void *)(a1 + 32) + 104), 6.28318531, 0.0);
  id v5 = v3;
  id v6 = [v5 CGColor];

  v7 = [v4 largeTickLayer];
  [v7 setBackgroundColor:v6];

  [v4 setHidden:1];
  v8 = [*(id *)(a1 + 32) contentView];
  [v8 addSubview:v4];

  return v4;
}

id sub_1E00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = CLKDate;
  }
  id v3 = [WeakRetained complicationDate];

  return v3;
}

void sub_1E60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

void sub_2648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_266C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDialProgress];
}

void sub_2ADC(uint64_t a1, void *a2)
{
  *(void *)&xmmword_11270 = 60;
  id v2 = a2;
  id v10 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v10 scaledValue:4.0];
  *((void *)&xmmword_11270 + 1) = 0x3FF0000000000000;
  qword_11280 = v3;
  [v10 scaledValue:40.0];
  qword_11288 = v4;
  [v10 scaledValue:11.0];
  *((void *)&xmmword_11290 + 1) = v5;
  [v10 scaledValue:30.0];
  qword_112A0 = v6;
  [v10 scaledValue:24.5];
  *(void *)&xmmword_11290 = v7;
  qword_112A8 = 0x4038000000000000;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v9 = v8;

  xmmword_112B0 = xmmword_11270;
  unk_112C0 = *(_OWORD *)&qword_11280;
  xmmword_112D0 = xmmword_11290;
  unk_112E0 = *(_OWORD *)&qword_112A0;
  *(long long *)((char *)&xmmword_112B0 + 8) = (__int128)vmulq_n_f64(*(float64x2_t *)((char *)&xmmword_112B0 + 8), v9);
  *(long long *)((char *)&xmmword_112D0 + 8) = (__int128)vmulq_n_f64(*(float64x2_t *)((char *)&xmmword_112D0 + 8), v9);
  unk_112C8 = vmulq_n_f64(unk_112C8, v9);
  *(double *)&qword_112E8 = v9 * *(double *)&qword_112A8;
}

void sub_3B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3B78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3C8C;
  block[3] = &unk_C530;
  objc_copyWeak(v16, (id *)(a1 + 48));
  id v12 = *(id *)(a1 + 32);
  v16[1] = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  double v8 = *(void **)(a1 + 64);
  id v14 = v5;
  id v15 = v7;
  v16[2] = v8;
  id v13 = v6;
  id v9 = v5;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(v16);
}

void sub_3C8C(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    id v7 = +[NTKTimerBundleComplicationDataSource _unknownEntryForDevice:*(void *)(a1 + 32) complicationDuration:*(double *)(a1 + 72)];
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = [v7 entryForComplicationFamily:*(void *)(a1 + 80)];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    goto LABEL_26;
  }
  uint64_t v3 = [[NTKTimerBundleTimelineEntry alloc] initWithDevice:*(void *)(a1 + 32)];
  [WeakRetained complicationDuration];
  [(NTKTimerBundleTimelineEntry *)v3 setIsDefaultComplication:v4 == 0.0];
  if (!*(void *)(a1 + 40))
  {
    v36 = v3;
    id v10 = [*(id *)(a1 + 48) sortedArrayUsingComparator:&stru_C508];
    id v11 = objc_alloc_init((Class)NSMutableArray);
    id v12 = objc_alloc_init((Class)NSMutableArray);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v38;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          double v19 = WeakRetained[3];
          if (v19 != 0.0)
          {
            [*(id *)(*((void *)&v37 + 1) + 8 * i) duration];
            if (v19 != v20) {
              continue;
            }
          }
          v21 = (char *)[v18 state];
          v22 = v11;
          if (v21 != (unsigned char *)&dword_0 + 3)
          {
            v23 = (char *)[v18 state];
            v22 = v12;
            if (v23 != (unsigned char *)&dword_0 + 2) {
              continue;
            }
          }
          [v22 addObject:v18];
        }
        id v15 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v15);
    }

    v24 = +[NTKDate unmodifiedDate];
    id v6 = v36;
    [(NTKTimerBundleTimelineEntry *)v36 setEntryDate:v24];

    -[NTKTimerBundleTimelineEntry setNumPausedTimers:](v36, "setNumPausedTimers:", [v12 count]);
    -[NTKTimerBundleTimelineEntry setNumRunningTimers:](v36, "setNumRunningTimers:", [v11 count]);
    if ([v11 count])
    {
      v25 = [v11 objectAtIndexedSubscript:0];
      [v25 remainingTime];
      -[NTKTimerBundleTimelineEntry setRemainingTime:](v36, "setRemainingTime:");
      [v25 duration];
      -[NTKTimerBundleTimelineEntry setCountdownDuration:](v36, "setCountdownDuration:");
      v26 = [v25 title];
      [(NTKTimerBundleTimelineEntry *)v36 setTitle:v26];

      v27 = v36;
      uint64_t v28 = 3;
    }
    else
    {
      if (![v12 count])
      {
        +[NTKTimerBundleComplicationDataSource _fallbackDurationWithComplicationDuration:WeakRetained[3]];
        -[NTKTimerBundleTimelineEntry setCountdownDuration:](v36, "setCountdownDuration:");
        [(NTKTimerBundleTimelineEntry *)v36 countdownDuration];
        -[NTKTimerBundleTimelineEntry setRemainingTime:](v36, "setRemainingTime:");
        [(NTKTimerBundleTimelineEntry *)v36 setTitle:0];
        [(NTKTimerBundleTimelineEntry *)v36 setState:1];
        goto LABEL_22;
      }
      v25 = [v12 objectAtIndexedSubscript:0];
      [v25 remainingTime];
      -[NTKTimerBundleTimelineEntry setRemainingTime:](v36, "setRemainingTime:");
      [v25 duration];
      -[NTKTimerBundleTimelineEntry setCountdownDuration:](v36, "setCountdownDuration:");
      v29 = [v25 title];
      [(NTKTimerBundleTimelineEntry *)v36 setTitle:v29];

      v27 = v36;
      uint64_t v28 = 2;
    }
    [(NTKTimerBundleTimelineEntry *)v27 setState:v28];

LABEL_22:
    goto LABEL_23;
  }
  uint64_t v5 = +[NTKTimerBundleComplicationDataSource _unknownEntryForDevice:*(void *)(a1 + 32) complicationDuration:WeakRetained[3]];

  id v6 = (void *)v5;
LABEL_23:
  v30 = (void *)kMTCurrentTimerTitle;
  v31 = [v6 title];
  LODWORD(v30) = [v30 isEqualToString:v31];

  if (v30) {
    [v6 setTitle:0];
  }
  v32 = (void *)*((void *)WeakRetained + 1);
  *((void *)WeakRetained + 1) = v6;
  id v33 = v6;

  uint64_t v34 = *(void *)(a1 + 56);
  v35 = [v33 entryForComplicationFamily:*(void *)(a1 + 80)];
  (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v35);

LABEL_26:
}

int64_t sub_40F8(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  [v6 remainingTime];
  double v9 = v8;
  [v7 remainingTime];
  if (v9 < v10)
  {
LABEL_5:
    int64_t v14 = -1;
    goto LABEL_6;
  }
  [v6 remainingTime];
  double v12 = v11;
  [v7 remainingTime];
  if (v12 <= v13)
  {
    [v6 duration];
    double v16 = v15;
    [v7 duration];
    if (v16 >= v17)
    {
      [v6 duration];
      double v20 = v19;
      [v7 duration];
      int64_t v14 = v20 > v21;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int64_t v14 = 1;
LABEL_6:

  return v14;
}

void sub_4994()
{
  NTKImageNamed();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = NTKImageNamed();
  v1 = NTKImageNamed();
  uint64_t v2 = +[CLKImageProvider imageProviderWithOnePieceImage:v4 twoPieceImageBackground:v0 twoPieceImageForeground:v1];
  uint64_t v3 = (void *)qword_11308;
  qword_11308 = v2;
}

void sub_4B60()
{
  NTKImageNamed();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = NTKImageNamed();
  v1 = NTKImageNamed();
  uint64_t v2 = +[CLKImageProvider imageProviderWithOnePieceImage:v4 twoPieceImageBackground:v0 twoPieceImageForeground:v1];
  uint64_t v3 = (void *)qword_11328;
  qword_11328 = v2;
}

void sub_4D2C()
{
  NTKImageNamed();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = NTKImageNamed();
  v1 = NTKImageNamed();
  uint64_t v2 = +[CLKImageProvider imageProviderWithOnePieceImage:v4 twoPieceImageBackground:v0 twoPieceImageForeground:v1];
  uint64_t v3 = (void *)qword_11348;
  qword_11348 = v2;
}

void sub_4EF8()
{
  NTKImageNamed();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = NTKImageNamed();
  v1 = NTKImageNamed();
  uint64_t v2 = +[CLKImageProvider imageProviderWithOnePieceImage:v4 twoPieceImageBackground:v0 twoPieceImageForeground:v1];
  uint64_t v3 = (void *)qword_11368;
  qword_11368 = v2;
}

void sub_50C4()
{
  NTKImageNamed();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = NTKImageNamed();
  v1 = NTKImageNamed();
  uint64_t v2 = +[CLKImageProvider imageProviderWithOnePieceImage:v4 twoPieceImageBackground:v0 twoPieceImageForeground:v1];
  uint64_t v3 = (void *)qword_11388;
  qword_11388 = v2;
}

void sub_7138()
{
  uint64_t v0 = +[CLKFullColorSymbolImageProvider symbolImageProviderWithSystemName:@"timer"];
  v1 = (void *)qword_113C8;
  qword_113C8 = v0;

  id v2 = +[UIColor systemOrangeColor];
  [(id)qword_113C8 setTintColor:v2];
}

void sub_72A0()
{
  uint64_t v0 = +[CLKSymbolImageProvider symbolImageProviderWithSystemName:@"timer"];
  v1 = (void *)qword_113E8;
  qword_113E8 = v0;

  id v2 = +[UIColor systemOrangeColor];
  [(id)qword_113E8 setTintColor:v2];
}

void sub_73E8(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "const LayoutConstants _LayoutConstants(CLKDevice *__strong, CLKComplicationFamily)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unhandled complication family in %s constants: %ld", (uint8_t *)&v2, 0x16u);
}

void sub_7474(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "missing bundle at %@", (uint8_t *)&v2, 0xCu);
}

void sub_74EC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "missing 'ConfigurationIntent' from default schema", v1, 2u);
}

uint64_t CLKComplicationGraphicExtraLargeCircularScalingFactor()
{
  return _CLKComplicationGraphicExtraLargeCircularScalingFactor();
}

uint64_t CLKSizeCenteredInRectForDevice()
{
  return _CLKSizeCenteredInRectForDevice();
}

uint64_t INIntentWithTypedIntent()
{
  return _INIntentWithTypedIntent();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
}

uint64_t NTKImageNamed()
{
  return _NTKImageNamed();
}

uint64_t NTKShowGossamerUI()
{
  return _NTKShowGossamerUI();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CLKFontWithAlternativePunctuation(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithAlternativePunctuation];
}

id objc_msgSend__applyPausedUpdate(void *a1, const char *a2, ...)
{
  return [a1 _applyPausedUpdate];
}

id objc_msgSend__backgroundFilterStyle(void *a1, const char *a2, ...)
{
  return [a1 _backgroundFilterStyle];
}

id objc_msgSend__currentTimelineEntry(void *a1, const char *a2, ...)
{
  return [a1 _currentTimelineEntry];
}

id objc_msgSend__defaultPresets(void *a1, const char *a2, ...)
{
  return [a1 _defaultPresets];
}

id objc_msgSend__foregroundFilterStyle(void *a1, const char *a2, ...)
{
  return [a1 _foregroundFilterStyle];
}

id objc_msgSend__newCircularMediumTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newCircularMediumTemplate];
}

id objc_msgSend__newCircularSmallTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newCircularSmallTemplate];
}

id objc_msgSend__newExtraLargeTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newExtraLargeTemplate];
}

id objc_msgSend__newLargeFlatUtilityTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newLargeFlatUtilityTemplate];
}

id objc_msgSend__newLargeModularTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newLargeModularTemplate];
}

id objc_msgSend__newSignatureBezelTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newSignatureBezelTemplate];
}

id objc_msgSend__newSignatureCircularTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newSignatureCircularTemplate];
}

id objc_msgSend__newSignatureCornerGaugeImageTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newSignatureCornerGaugeImageTemplate];
}

id objc_msgSend__newSignatureExtraLargeCircularTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newSignatureExtraLargeCircularTemplate];
}

id objc_msgSend__newSignatureRectangular(void *a1, const char *a2, ...)
{
  return [a1 _newSignatureRectangular];
}

id objc_msgSend__newSignatureRectangularBodyRelativeDateTextProvider(void *a1, const char *a2, ...)
{
  return [a1 _newSignatureRectangularBodyRelativeDateTextProvider];
}

id objc_msgSend__newSignatureRectangularHeaderTextProvider(void *a1, const char *a2, ...)
{
  return [a1 _newSignatureRectangularHeaderTextProvider];
}

id objc_msgSend__newSimpleTextTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newSimpleTextTemplate];
}

id objc_msgSend__newSmallFlatUtilityTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newSmallFlatUtilityTemplate];
}

id objc_msgSend__newSmallModularTemplate(void *a1, const char *a2, ...)
{
  return [a1 _newSmallModularTemplate];
}

id objc_msgSend__pause(void *a1, const char *a2, ...)
{
  return [a1 _pause];
}

id objc_msgSend__resume(void *a1, const char *a2, ...)
{
  return [a1 _resume];
}

id objc_msgSend__startObserving(void *a1, const char *a2, ...)
{
  return [a1 _startObserving];
}

id objc_msgSend__stopObserving(void *a1, const char *a2, ...)
{
  return [a1 _stopObserving];
}

id objc_msgSend__templateMetadata(void *a1, const char *a2, ...)
{
  return [a1 _templateMetadata];
}

id objc_msgSend__updateDialProgress(void *a1, const char *a2, ...)
{
  return [a1 _updateDialProgress];
}

id objc_msgSend__updatePausedDialProgress(void *a1, const char *a2, ...)
{
  return [a1 _updatePausedDialProgress];
}

id objc_msgSend__updatePlatterColor(void *a1, const char *a2, ...)
{
  return [a1 _updatePlatterColor];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_complicationDate(void *a1, const char *a2, ...)
{
  return [a1 complicationDate];
}

id objc_msgSend_complicationDescriptor(void *a1, const char *a2, ...)
{
  return [a1 complicationDescriptor];
}

id objc_msgSend_complicationDuration(void *a1, const char *a2, ...)
{
  return [a1 complicationDuration];
}

id objc_msgSend_complicationTemplate(void *a1, const char *a2, ...)
{
  return [a1 complicationTemplate];
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

id objc_msgSend_countdownDuration(void *a1, const char *a2, ...)
{
  return [a1 countdownDuration];
}

id objc_msgSend_createSymbolImage(void *a1, const char *a2, ...)
{
  return [a1 createSymbolImage];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return [a1 family];
}

id objc_msgSend_filterProvider(void *a1, const char *a2, ...)
{
  return [a1 filterProvider];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_invalidateEntries(void *a1, const char *a2, ...)
{
  return [a1 invalidateEntries];
}

id objc_msgSend_isDefaultComplication(void *a1, const char *a2, ...)
{
  return [a1 isDefaultComplication];
}

id objc_msgSend_isRunningGloryGMOrLater(void *a1, const char *a2, ...)
{
  return [a1 isRunningGloryGMOrLater];
}

id objc_msgSend_largeTickLayer(void *a1, const char *a2, ...)
{
  return [a1 largeTickLayer];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nrDeviceUUID(void *a1, const char *a2, ...)
{
  return [a1 nrDeviceUUID];
}

id objc_msgSend_paused(void *a1, const char *a2, ...)
{
  return [a1 paused];
}

id objc_msgSend_remainingTime(void *a1, const char *a2, ...)
{
  return [a1 remainingTime];
}

id objc_msgSend_rootDirectory(void *a1, const char *a2, ...)
{
  return [a1 rootDirectory];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_textProvider(void *a1, const char *a2, ...)
{
  return [a1 textProvider];
}

id objc_msgSend_timers(void *a1, const char *a2, ...)
{
  return [a1 timers];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_unmodifiedDate(void *a1, const char *a2, ...)
{
  return [a1 unmodifiedDate];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}