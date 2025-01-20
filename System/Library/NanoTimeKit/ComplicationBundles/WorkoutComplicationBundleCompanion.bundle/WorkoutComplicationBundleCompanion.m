id NLWorkoutComplicationLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t vars8;

  v1 = a1;
  v2 = sub_4308();
  v3 = [v2 localizedStringForKey:v1 value:&stru_C608 table:@"Localizable"];

  return v3;
}

id sub_4308()
{
  if (qword_11B80 != -1) {
    dispatch_once(&qword_11B80, &stru_C440);
  }
  v0 = (void *)qword_11B78;

  return v0;
}

id NLWorkoutComplicationImageNamed(void *a1)
{
  id v1 = a1;
  v2 = sub_4308();
  v3 = +[UIImage imageNamed:v1 inBundle:v2 compatibleWithTraitCollection:0];

  return v3;
}

id NLWorkoutNoNonGradientTextColor()
{
  if (qword_11B60 != -1) {
    dispatch_once(&qword_11B60, &stru_C400);
  }
  v0 = (void *)qword_11B58;

  return v0;
}

void sub_4428(id a1)
{
  id v3 = +[ARUIMetricColors noMetricColors];
  uint64_t v1 = [v3 nonGradientTextColor];
  v2 = (void *)qword_11B58;
  qword_11B58 = v1;
}

id NLWorkoutKeyNonGradientTextColor()
{
  if (qword_11B70 != -1) {
    dispatch_once(&qword_11B70, &stru_C420);
  }
  v0 = (void *)qword_11B68;

  return v0;
}

void sub_44D8(id a1)
{
  id v3 = +[ARUIMetricColors keyColors];
  uint64_t v1 = [v3 nonGradientTextColor];
  v2 = (void *)qword_11B68;
  qword_11B68 = v1;
}

void sub_4534(id a1)
{
  qword_11B78 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

void sub_4F1C(uint64_t a1)
{
  uint64_t v2 = +[HKHealthStore fiui_sharedHealthStoreForCarousel];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  _HKInitializeLogging();
  v5 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 64);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "fiui_sharedHealthStoreForCarousel returned healthStore: %@", (uint8_t *)&v7, 0xCu);
  }
}

void sub_62CC(id a1)
{
  id v4 = +[HKHealthStore fiui_sharedHealthStoreForCarousel];
  id v1 = [objc_alloc((Class)FIUIUnitManager) initWithHealthStore:v4];
  id v2 = [objc_alloc((Class)FIUIFormattingManager) initWithUnitManager:v1];
  uint64_t v3 = (void *)qword_11B88;
  qword_11B88 = (uint64_t)v2;
}

void sub_6E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

NLWorkoutComplicationAnimatedWrapperView *sub_6E90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = [NLWorkoutComplicationAnimatedWrapperView alloc];
    uint64_t v3 = [WeakRetained _animationImages];
    id v4 = [(NLWorkoutComplicationAnimatedWrapperView *)v2 initWithAnimationImages:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_70DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_70F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateActiveWorkoutState];
    id WeakRetained = v2;
  }
}

void sub_7354(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained healthStore];

    if (v5)
    {
      id v6 = objc_alloc((Class)_HKWorkoutObserver);
      int v7 = [v4 healthStore];
      id v8 = [v6 initWithHealthStore:v7];

      _HKInitializeLogging();
      v9 = HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[NLWorkoutComplicationDataSource] Calling _HKWorkoutObserver's currentWorkoutSnapshotWithCompletion", buf, 2u);
      }
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_7500;
      v11[3] = &unk_C530;
      objc_copyWeak(&v12, v2);
      [v8 currentWorkoutSnapshotWithCompletion:v11];
      objc_destroyWeak(&v12);
    }
    else
    {
      _HKInitializeLogging();
      v10 = (void *)HKLogWorkouts;
      if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
        sub_7E20(a1, v10);
      }
      if (NTKInternalBuild()) {
        _NTKGenerateSimulatedCrash();
      }
    }
  }
}

void sub_74EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_7500(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_75DC;
  block[3] = &unk_C508;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
}

void sub_75DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setActiveWorkoutSnapshot:*(void *)(a1 + 32)];
    [v3 _invalidate];
    _HKInitializeLogging();
    id v4 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[NLWorkoutComplicationDataSource] currentWorkoutSnapshot: %@, error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v7 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_7ED0(v7);
    }
  }
}

void sub_7E20(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_0, v2, OS_LOG_TYPE_ERROR, "%@ healthStore is nil", (uint8_t *)&v5, 0xCu);
}

void sub_7ED0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[NLWorkoutComplicationDataSource] mainStrongSelf is nil. Returning without updating workout snapshot.", v1, 2u);
}

uint64_t CLKIsUVPreviewApp()
{
  return _CLKIsUVPreviewApp();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t FIUILocalizedNameForActivityType()
{
  return _FIUILocalizedNameForActivityType();
}

uint64_t FIUILocalizedNameForIndoorAgnosticActivityType()
{
  return _FIUILocalizedNameForIndoorAgnosticActivityType();
}

uint64_t NSRequestConcreteImplementation()
{
  return _NSRequestConcreteImplementation();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
}

uint64_t NTKInternalBuild()
{
  return _NTKInternalBuild();
}

uint64_t NTKShowGossamerUI()
{
  return _NTKShowGossamerUI();
}

uint64_t NTKStartOfDayForDate()
{
  return _NTKStartOfDayForDate();
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

uint64_t _NTKGenerateSimulatedCrash()
{
  return __NTKGenerateSimulatedCrash();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__animationImages(void *a1, const char *a2, ...)
{
  return [a1 _animationImages];
}

id objc_msgSend__filterStyle(void *a1, const char *a2, ...)
{
  return [a1 _filterStyle];
}

id objc_msgSend__hasActiveWorkout(void *a1, const char *a2, ...)
{
  return [a1 _hasActiveWorkout];
}

id objc_msgSend__hasPausedActiveWorkout(void *a1, const char *a2, ...)
{
  return [a1 _hasPausedActiveWorkout];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend__makeAnimatedImageProvider(void *a1, const char *a2, ...)
{
  return [a1 _makeAnimatedImageProvider];
}

id objc_msgSend__noWorkoutsTemplate(void *a1, const char *a2, ...)
{
  return [a1 _noWorkoutsTemplate];
}

id objc_msgSend__startObserving(void *a1, const char *a2, ...)
{
  return [a1 _startObserving];
}

id objc_msgSend__updateActiveWorkoutState(void *a1, const char *a2, ...)
{
  return [a1 _updateActiveWorkoutState];
}

id objc_msgSend__updateState(void *a1, const char *a2, ...)
{
  return [a1 _updateState];
}

id objc_msgSend__updateTint(void *a1, const char *a2, ...)
{
  return [a1 _updateTint];
}

id objc_msgSend__updateUI(void *a1, const char *a2, ...)
{
  return [a1 _updateUI];
}

id objc_msgSend__workoutTintColor(void *a1, const char *a2, ...)
{
  return [a1 _workoutTintColor];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return [a1 family];
}

id objc_msgSend_filterProvider(void *a1, const char *a2, ...)
{
  return [a1 filterProvider];
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return [a1 healthStore];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_internalState(void *a1, const char *a2, ...)
{
  return [a1 internalState];
}

id objc_msgSend_invalidateEntries(void *a1, const char *a2, ...)
{
  return [a1 invalidateEntries];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return [a1 isPaused];
}

id objc_msgSend_keyColors(void *a1, const char *a2, ...)
{
  return [a1 keyColors];
}

id objc_msgSend_kilocalorieUnit(void *a1, const char *a2, ...)
{
  return [a1 kilocalorieUnit];
}

id objc_msgSend_largeModularEmptyTextProvider(void *a1, const char *a2, ...)
{
  return [a1 largeModularEmptyTextProvider];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_localizedLowercaseString(void *a1, const char *a2, ...)
{
  return [a1 localizedLowercaseString];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_mileUnit(void *a1, const char *a2, ...)
{
  return [a1 mileUnit];
}

id objc_msgSend_noActiveWorkoutImage(void *a1, const char *a2, ...)
{
  return [a1 noActiveWorkoutImage];
}

id objc_msgSend_noMetricColors(void *a1, const char *a2, ...)
{
  return [a1 noMetricColors];
}

id objc_msgSend_nonGradientTextColor(void *a1, const char *a2, ...)
{
  return [a1 nonGradientTextColor];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return [a1 removeAllAnimations];
}

id objc_msgSend_sessionState(void *a1, const char *a2, ...)
{
  return [a1 sessionState];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_workoutActivityType(void *a1, const char *a2, ...)
{
  return [a1 workoutActivityType];
}

id objc_msgSend_workoutWithActivityType_startDate_endDate_duration_totalEnergyBurned_totalDistance_metadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workoutWithActivityType:startDate:endDate:duration:totalEnergyBurned:totalDistance:metadata:");
}