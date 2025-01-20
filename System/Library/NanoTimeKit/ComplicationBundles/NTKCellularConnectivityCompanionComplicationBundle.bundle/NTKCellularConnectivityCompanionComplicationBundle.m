void sub_1A44(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t vars8;

  v2 = a2;
  v18 = (id)objc_opt_new();
  v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];

  [v3 scaledValue:24.0];
  v5 = v4;
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v7 = +[NSNumber numberWithInteger:CLKComplicationFamilyCircularMedium];
  [v18 setObject:v6 forKeyedSubscript:v7];

  [v18 setObject:v6 forKeyedSubscript:&off_83B0];
  [v18 setObject:v6 forKeyedSubscript:&off_83C8];
  v8 = +[CLKDevice currentDevice];
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v10 = v9;

  v11 = +[NSNumber numberWithDouble:v5 * v10];

  [v18 setObject:v11 forKeyedSubscript:&off_83E0];
  [v3 scaledValue:70.0];
  v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v18 setObject:v12 forKeyedSubscript:&off_83F8];

  [v3 scaledValue:14.0];
  v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v18 setObject:v13 forKeyedSubscript:&off_8410];

  [v3 scaledValue:18.5];
  v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v18 setObject:v14 forKeyedSubscript:&off_8428];

  [v3 scaledValue:21.0];
  v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  [v18 setObject:v15 forKeyedSubscript:&off_8440];
  [v18 setObject:v15 forKeyedSubscript:&off_8458];
  v16 = [v18 copy];
  v17 = (void *)qword_D948;
  qword_D948 = (uint64_t)v16;
}

void sub_1E40(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_new();
  v4 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];

  [v4 setRoundingBehavior:3];
  id v5 = objc_alloc_init((Class)NTKExplorerDotLayoutConstraints);
  v91[0] = &off_8470;
  v91[1] = &off_8488;
  v92[0] = &off_84B8;
  v92[1] = &off_84C8;
  v6 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2];
  [v4 scaledValue:v6 withOverrides:6.0];
  objc_msgSend(v5, "setDotDiameter:");

  v89[0] = &off_8470;
  v89[1] = &off_8488;
  v90[0] = &off_84D8;
  v90[1] = &off_84E8;
  v7 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
  [v4 scaledValue:v7 withOverrides:1.0];
  objc_msgSend(v5, "setDotBorderWidth:");

  v87[0] = &off_8470;
  v87[1] = &off_8488;
  v88[0] = &off_84F8;
  v88[1] = &off_8508;
  v8 = +[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
  [v4 scaledValue:v8 withOverrides:3.0];
  objc_msgSend(v5, "setDotSpacing:");

  v85[0] = &off_8470;
  v85[1] = &off_8488;
  v86[0] = &off_8518;
  v86[1] = &off_8528;
  v9 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];
  [v4 scaledValue:v9 withOverrides:1.5];
  objc_msgSend(v5, "setNoServiceDotHeight:");

  v10 = +[NSNumber numberWithInteger:CLKComplicationFamilyCircularMedium];
  [v3 setObject:v5 forKeyedSubscript:v10];

  [v3 setObject:v5 forKeyedSubscript:&off_83B0];
  [v3 setObject:v5 forKeyedSubscript:&off_83C8];
  [v4 setRoundingBehavior:0];
  id v11 = objc_alloc_init((Class)NTKExplorerDotLayoutConstraints);

  v12 = +[CLKDevice currentDevice];
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v14 = v13;

  v83[0] = &off_8470;
  v83[1] = &off_8488;
  v84[0] = &off_84B8;
  v84[1] = &off_84C8;
  v15 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];
  [v4 scaledValue:v15 withOverrides:6.0];
  [v11 setDotDiameter:v14 * v16];

  v81[0] = &off_8470;
  v81[1] = &off_8488;
  v82[0] = &off_84D8;
  v82[1] = &off_84E8;
  v17 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
  [v4 scaledValue:v17 withOverrides:1.0];
  [v11 setDotBorderWidth:v14 * v18];

  v79[0] = &off_8470;
  v79[1] = &off_8488;
  v80[0] = &off_84F8;
  v80[1] = &off_8508;
  v19 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];
  [v4 scaledValue:v19 withOverrides:3.0];
  [v11 setDotSpacing:v14 * v20];

  v77[0] = &off_8470;
  v77[1] = &off_8488;
  v78[0] = &off_8518;
  v78[1] = &off_8528;
  v21 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:2];
  [v4 scaledValue:v21 withOverrides:1.5];
  [v11 setNoServiceDotHeight:v14 * v22];

  [v3 setObject:v11 forKeyedSubscript:&off_83E0];
  [v4 setRoundingBehavior:3];
  id v23 = objc_alloc_init((Class)NTKExplorerDotLayoutConstraints);

  v75[0] = &off_8470;
  v75[1] = &off_8488;
  v76[0] = &off_84F8;
  v76[1] = &off_8508;
  v24 = +[NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
  [v4 scaledValue:v24 withOverrides:3.0];
  objc_msgSend(v23, "setDotDiameter:");

  v73[0] = &off_8470;
  v73[1] = &off_8488;
  v74[0] = &off_8538;
  v74[1] = &off_8548;
  v25 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];
  [v4 scaledValue:v25 withOverrides:0.5];
  objc_msgSend(v23, "setDotBorderWidth:");

  v71[0] = &off_8470;
  v71[1] = &off_8488;
  v72[0] = &off_8558;
  v72[1] = &off_8568;
  v26 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
  [v4 scaledValue:v26 withOverrides:2.0];
  objc_msgSend(v23, "setDotSpacing:");

  v69[0] = &off_8470;
  v69[1] = &off_8488;
  v70[0] = &off_84D8;
  v70[1] = &off_84E8;
  v27 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
  [v4 scaledValue:v27 withOverrides:1.0];
  objc_msgSend(v23, "setNoServiceDotHeight:");

  [v3 setObject:v23 forKeyedSubscript:&off_8410];
  id v28 = objc_alloc_init((Class)NTKExplorerDotLayoutConstraints);

  v67[0] = &off_8470;
  v67[1] = &off_8488;
  v68[0] = &off_84B8;
  v68[1] = &off_84C8;
  v29 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
  [v4 scaledValue:v29 withOverrides:6.0];
  objc_msgSend(v28, "setDotDiameter:");

  v65[0] = &off_8470;
  v65[1] = &off_84A0;
  v66[0] = &off_8578;
  v66[1] = &off_8588;
  v65[2] = &off_8488;
  v66[2] = &off_8598;
  v30 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];
  [v4 scaledValue:v30 withOverrides:1.125];
  objc_msgSend(v28, "setDotBorderWidth:");

  v63[0] = &off_8470;
  v63[1] = &off_8488;
  v64[0] = &off_84F8;
  v64[1] = &off_8508;
  v31 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
  [v4 scaledValue:v31 withOverrides:3.0];
  objc_msgSend(v28, "setDotSpacing:");

  v61[0] = &off_8470;
  v61[1] = &off_8488;
  v62[0] = &off_8518;
  v62[1] = &off_8528;
  v32 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
  [v4 scaledValue:v32 withOverrides:1.5];
  objc_msgSend(v28, "setNoServiceDotHeight:");

  [v3 setObject:v28 forKeyedSubscript:&off_8428];
  id v33 = objc_alloc_init((Class)NTKExplorerDotLayoutConstraints);

  v59[0] = &off_8470;
  v59[1] = &off_8488;
  v60[0] = &off_85A8;
  v60[1] = &off_85B8;
  v34 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
  [v4 scaledValue:v34 withOverrides:4.0];
  objc_msgSend(v33, "setDotDiameter:");

  v57[0] = &off_8470;
  v57[1] = &off_84A0;
  v58[0] = &off_85C8;
  v58[1] = &off_85D8;
  v57[2] = &off_8488;
  v58[2] = &off_85E8;
  v35 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];
  [v4 scaledValue:v35 withOverrides:0.75];
  objc_msgSend(v33, "setDotBorderWidth:");

  v55[0] = &off_8470;
  v55[1] = &off_8488;
  v56[0] = &off_8558;
  v56[1] = &off_8568;
  v36 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  [v4 scaledValue:v36 withOverrides:2.0];
  objc_msgSend(v33, "setDotSpacing:");

  v53[0] = &off_8470;
  v53[1] = &off_8488;
  v54[0] = &off_84D8;
  v54[1] = &off_84E8;
  v37 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
  [v4 scaledValue:v37 withOverrides:1.0];
  objc_msgSend(v33, "setNoServiceDotHeight:");

  [v3 setObject:v33 forKeyedSubscript:&off_8440];
  [v3 setObject:v33 forKeyedSubscript:&off_8458];
  id v38 = objc_alloc_init((Class)NTKExplorerDotLayoutConstraints);

  v51[0] = &off_8470;
  v51[1] = &off_8488;
  v52[0] = &off_85F8;
  v52[1] = &off_8608;
  v39 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
  [v4 scaledValue:v39 withOverrides:17.5];
  objc_msgSend(v38, "setDotDiameter:");

  v49[0] = &off_8470;
  v49[1] = &off_8488;
  v50[0] = &off_8618;
  v50[1] = &off_8628;
  v40 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
  [v4 scaledValue:v40 withOverrides:2.5];
  objc_msgSend(v38, "setDotBorderWidth:");

  v47[0] = &off_8470;
  v47[1] = &off_8488;
  v48[0] = &off_8638;
  v48[1] = &off_8648;
  v41 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
  [v4 scaledValue:v41 withOverrides:8.0];
  objc_msgSend(v38, "setDotSpacing:");

  v45[0] = &off_8470;
  v45[1] = &off_8488;
  v46[0] = &off_8658;
  v46[1] = &off_8668;
  v42 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
  [v4 scaledValue:v42 withOverrides:4.5];
  objc_msgSend(v38, "setNoServiceDotHeight:");

  [v3 setObject:v38 forKeyedSubscript:&off_83F8];
  id v43 = [v3 copy];
  v44 = (void *)qword_D968;
  qword_D968 = (uint64_t)v43;
}

CDComplicationImageView *__cdecl sub_32C8(id a1, CGSize a2)
{
  id v2 = -[NTKCellularConnectivityImageView initWithFrame:]([NTKCellularConnectivityImageView alloc], "initWithFrame:", 0.0, 0.0, a2.width, a2.height);

  return (CDComplicationImageView *)v2;
}

CDComplicationImageView *__cdecl sub_3380(id a1, CGSize a2)
{
  id v2 = -[NTKCellularConnectivityImageView initWithFrame:]([NTKCellularConnectivityImageView alloc], "initWithFrame:", 0.0, 0.0, a2.width, a2.height);

  return (CDComplicationImageView *)v2;
}

id sub_41B4(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  id v2 = *(void **)(a1 + 32);

  return [v2 _reevaluateSignalState];
}

uint64_t CLKComplicationGraphicExtraLargeCircularScalingFactor()
{
  return _CLKComplicationGraphicExtraLargeCircularScalingFactor();
}

uint64_t CLKIsFaceSnapshotService()
{
  return _CLKIsFaceSnapshotService();
}

uint64_t CLKIsNTKDaemon()
{
  return _CLKIsNTKDaemon();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t NTKIsRichComplicationFamily()
{
  return _NTKIsRichComplicationFamily();
}

uint64_t NTKShowGossamerUI()
{
  return _NTKShowGossamerUI();
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

void objc_destroyWeak(id *location)
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

id objc_msgSend__circularMediumTemplate(void *a1, const char *a2, ...)
{
  return [a1 _circularMediumTemplate];
}

id objc_msgSend__circularSmallTemplate(void *a1, const char *a2, ...)
{
  return [a1 _circularSmallTemplate];
}

id objc_msgSend__currentTimelineEntry(void *a1, const char *a2, ...)
{
  return [a1 _currentTimelineEntry];
}

id objc_msgSend__extraLargeTemplate(void *a1, const char *a2, ...)
{
  return [a1 _extraLargeTemplate];
}

id objc_msgSend__filterStyle(void *a1, const char *a2, ...)
{
  return [a1 _filterStyle];
}

id objc_msgSend__graphicBezelTemplate(void *a1, const char *a2, ...)
{
  return [a1 _graphicBezelTemplate];
}

id objc_msgSend__graphicCircularTemplate(void *a1, const char *a2, ...)
{
  return [a1 _graphicCircularTemplate];
}

id objc_msgSend__graphicCornerTemplate(void *a1, const char *a2, ...)
{
  return [a1 _graphicCornerTemplate];
}

id objc_msgSend__graphicExtraLargeTemplate(void *a1, const char *a2, ...)
{
  return [a1 _graphicExtraLargeTemplate];
}

id objc_msgSend__modularSmallTemplate(void *a1, const char *a2, ...)
{
  return [a1 _modularSmallTemplate];
}

id objc_msgSend__showDisconnected(void *a1, const char *a2, ...)
{
  return [a1 _showDisconnected];
}

id objc_msgSend__showDotsInsteadOfImage(void *a1, const char *a2, ...)
{
  return [a1 _showDotsInsteadOfImage];
}

id objc_msgSend__utilitarianSmallTemplate(void *a1, const char *a2, ...)
{
  return [a1 _utilitarianSmallTemplate];
}

id objc_msgSend_animateSearchingState(void *a1, const char *a2, ...)
{
  return [a1 animateSearchingState];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_complicationDate(void *a1, const char *a2, ...)
{
  return [a1 complicationDate];
}

id objc_msgSend_complicationTemplate(void *a1, const char *a2, ...)
{
  return [a1 complicationTemplate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_createSymbolImage(void *a1, const char *a2, ...)
{
  return [a1 createSymbolImage];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_cutoutImageFromPlatter(void *a1, const char *a2, ...)
{
  return [a1 cutoutImageFromPlatter];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dotColorOptions(void *a1, const char *a2, ...)
{
  return [a1 dotColorOptions];
}

id objc_msgSend_dotLayoutConstraints(void *a1, const char *a2, ...)
{
  return [a1 dotLayoutConstraints];
}

id objc_msgSend_dotsView(void *a1, const char *a2, ...)
{
  return [a1 dotsView];
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

id objc_msgSend_imageAlpha(void *a1, const char *a2, ...)
{
  return [a1 imageAlpha];
}

id objc_msgSend_imageOverrideColor(void *a1, const char *a2, ...)
{
  return [a1 imageOverrideColor];
}

id objc_msgSend_imageProvider(void *a1, const char *a2, ...)
{
  return [a1 imageProvider];
}

id objc_msgSend_imageVerticalOffsetScaleFromWidth(void *a1, const char *a2, ...)
{
  return [a1 imageVerticalOffsetScaleFromWidth];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_isDisconnected(void *a1, const char *a2, ...)
{
  return [a1 isDisconnected];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_needsPlatter(void *a1, const char *a2, ...)
{
  return [a1 needsPlatter];
}

id objc_msgSend_numDotsFilled(void *a1, const char *a2, ...)
{
  return [a1 numDotsFilled];
}

id objc_msgSend_platterAlpha(void *a1, const char *a2, ...)
{
  return [a1 platterAlpha];
}

id objc_msgSend_platterOverrideColor(void *a1, const char *a2, ...)
{
  return [a1 platterOverrideColor];
}

id objc_msgSend_platterView(void *a1, const char *a2, ...)
{
  return [a1 platterView];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_showsAsDots(void *a1, const char *a2, ...)
{
  return [a1 showsAsDots];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_tritiumPlatterColor(void *a1, const char *a2, ...)
{
  return [a1 tritiumPlatterColor];
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