void sub_2406B41D4(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  MTCCTimer *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  MTCCTimer *v19;
  const char *v20;
  uint64_t v21;
  MTCCTimer *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  id v30;
  uint64_t vars8;

  v30 = a2;
  v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 73))
  {
    v6 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = 0;

    v5 = *(void *)(a1 + 32);
  }
  v7 = *(void **)(v5 + 104);
  if (v7)
  {
    v8 = objc_msgSend_timerID(v7, v3, v4);

    v5 = *(void *)(a1 + 32);
    if (v8)
    {
      v9 = objc_msgSend_timerID(*(void **)(v5 + 104), v3, v4);
      v11 = objc_msgSend_firstThatMatches_fromTimers_(MTCCTimerModule, v10, (uint64_t)v9, v30);

      if (v11)
      {
        v12 = [MTCCTimer alloc];
        v14 = objc_msgSend_initWithMTTimer_(v12, v13, (uint64_t)v11);
        v15 = *(void *)(a1 + 32);
        v16 = *(void **)(v15 + 104);
        *(void *)(v15 + 104) = v14;
      }
      else
      {
        v17 = *(void *)(a1 + 32);
        v16 = *(void **)(v17 + 104);
        *(void *)(v17 + 104) = 0;
      }

      v5 = *(void *)(a1 + 32);
    }
  }
  if (!*(void *)(v5 + 104))
  {
    v18 = objc_msgSend_firstActiveTimerFromTimers_(MEMORY[0x263F55D90], v3, (uint64_t)v30);
    v19 = [MTCCTimer alloc];
    v22 = v19;
    if (v18)
    {
      v23 = objc_msgSend_initWithMTTimer_(v19, v20, (uint64_t)v18);
    }
    else
    {
      objc_msgSend_defaultDuration(*(void **)(a1 + 32), v20, v21);
      v23 = objc_msgSend_initWithState_duration_(v22, v24, 1);
    }
    v25 = *(void *)(a1 + 32);
    v26 = *(void **)(v25 + 104);
    *(void *)(v25 + 104) = v23;

    v5 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(a1 + 40))
  {
    objc_msgSend_duration(*(void **)(v5 + 104), v3, v4);
    objc_msgSend_setDefaultDuration_((void *)v5, v27, v28);
    v5 = *(void *)(a1 + 32);
  }
  objc_msgSend_setTimer_(*(void **)(v5 + 88), v3, *(void *)(v5 + 104));
  objc_msgSend_setTimer_(*(void **)(*(void *)(a1 + 32) + 96), v29, *(void *)(*(void *)(a1 + 32) + 104));
}

void sub_2406B459C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6 = objc_msgSend_timerBackgroundViewController(*(void **)(a1 + 32), v4, v5);
  objc_msgSend_setTimer_(v6, v7, (uint64_t)v3);

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 104);
  *(void *)(v8 + 104) = v3;
}

void sub_2406B47F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6 = objc_msgSend_timerViewController(*(void **)(a1 + 32), v4, v5);
  objc_msgSend_setTimer_(v6, v7, (uint64_t)v3);

  v10 = objc_msgSend_timerBackgroundViewController(*(void **)(a1 + 32), v8, v9);
  objc_msgSend_setTimer_(v10, v11, (uint64_t)v3);

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 104);
  *(void *)(v12 + 104) = v3;
}

uint64_t sub_2406B4B20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend_state(v3, v4, v5) == 3 || objc_msgSend_state(v3, v6, v7) == 2)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = objc_msgSend_timerID(v3, v6, v7);
    uint64_t isEqual = objc_msgSend_isEqual_(v8, v10, (uint64_t)v9);
  }
  else
  {
    uint64_t isEqual = 0;
  }

  return isEqual;
}

id sub_2406B4CB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6 = objc_msgSend_timers(*(void **)(*(void *)(a1 + 32) + 80), v4, v5);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2406B4DA8;
  v13[3] = &unk_2650CFBD0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v14 = v7;
  uint64_t v15 = v8;
  id v16 = v3;
  id v9 = v3;
  v11 = objc_msgSend_flatMap_(v6, v10, (uint64_t)v13);

  return v11;
}

id sub_2406B4DA8(void **a1, void *a2)
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v6 = objc_msgSend_timerID(a1[4], v4, v5);
  uint64_t v8 = objc_msgSend_firstThatMatches_fromTimers_(MTCCTimerModule, v7, (uint64_t)v6, v3);

  id v9 = MTLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[5];
    v13 = objc_msgSend_sound(a1[6], v10, v11);
    int v100 = 138543618;
    v101 = v12;
    __int16 v102 = 2114;
    v103 = v13;
    _os_log_impl(&dword_2406B2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched latest duration sound: %{public}@", (uint8_t *)&v100, 0x16u);
  }
  if (v8)
  {
    id v16 = objc_msgSend_mutableCopy(v8, v14, v15);
    uint64_t v19 = objc_msgSend_state(v8, v17, v18);
    uint64_t v22 = objc_msgSend_state(a1[4], v20, v21);
    uint64_t v23 = v22;
    if (v19 == 1 && v22 == 3)
    {
      v24 = MTLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = a1[5];
        int v100 = 138543362;
        v101 = v25;
        _os_log_impl(&dword_2406B2000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ current state is stopped and new state is running", (uint8_t *)&v100, 0xCu);
      }

      v27 = a1[5];
      v26 = a1 + 5;
      objc_msgSend_duration(*(v26 - 1), v28, v29);
      objc_msgSend_setDefaultDuration_(v27, v30, v31);
      v32 = (void *)MEMORY[0x263F55DA0];
      objc_msgSend_duration(*(v26 - 1), v33, v34);
      objc_msgSend_setDefaultDuration_(v32, v35, v36);
      objc_msgSend_duration(*(v26 - 1), v37, v38);
      objc_msgSend_setDuration_(v16, v39, v40);
      v44 = objc_msgSend_sound(v26[1], v41, v42);
      if (v44)
      {
        objc_msgSend_setSound_(v16, v43, (uint64_t)v44);
      }
      else
      {
        v83 = objc_msgSend_defaultSoundForCategory_(MEMORY[0x263F55D78], v43, 1);
        objc_msgSend_setSound_(v16, v84, (uint64_t)v83);
      }
      objc_msgSend_setState_(v16, v85, 3);
    }
    else
    {
      if ((v19 & 0xFFFFFFFFFFFFFFFELL) != 2 || v19 == v22) {
        goto LABEL_28;
      }
      v77 = MTLogForCategory();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v78 = a1[5];
        int v100 = 138543362;
        v101 = v78;
        _os_log_impl(&dword_2406B2000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ current state is paused or running and does not equal new state", (uint8_t *)&v100, 0xCu);
      }

      objc_msgSend_setState_(v16, v79, v23);
      v26 = a1 + 5;
    }
    v86 = objc_msgSend_timerManager(*v26, v80, v81);
    id v88 = (id)objc_msgSend_updateTimer_(v86, v87, (uint64_t)v16);
  }
  else
  {
    if (objc_msgSend_state(a1[4], v14, v15) != 3)
    {
      v82 = objc_msgSend_futureWithResult_(MEMORY[0x263F58190], v45, (uint64_t)a1[4]);
      goto LABEL_29;
    }
    v47 = objc_msgSend_editingTimer(a1[4], v45, v46);

    if (v47)
    {
      v50 = objc_msgSend_editingTimer(a1[4], v48, v49);
      v53 = objc_msgSend_timerID(v50, v51, v52);
      v55 = objc_msgSend_firstThatMatches_fromTimers_(MTCCTimerModule, v54, (uint64_t)v53, v3);

      if (v55)
      {
        v56 = objc_msgSend_timerManager(a1[5], v48, v49);
        id v58 = (id)objc_msgSend_removeTimer_(v56, v57, (uint64_t)v55);
      }
    }
    v59 = (void *)MEMORY[0x263F55DA0];
    objc_msgSend_duration(a1[4], v48, v49);
    objc_msgSend_setDefaultDuration_(v59, v60, v61);
    id v62 = objc_alloc(MEMORY[0x263F55D90]);
    objc_msgSend_duration(a1[4], v63, v64);
    v66 = objc_msgSend_initWithState_duration_(v62, v65, 3);
    id v16 = objc_msgSend_mutableCopy(v66, v67, v68);

    v71 = objc_msgSend_timerLabel(a1[4], v69, v70);
    objc_msgSend_setTitle_(v16, v72, (uint64_t)v71);

    v76 = objc_msgSend_sound(a1[6], v73, v74);
    if (v76)
    {
      objc_msgSend_setSound_(v16, v75, (uint64_t)v76);
    }
    else
    {
      v89 = objc_msgSend_defaultSoundForCategory_(MEMORY[0x263F55D78], v75, 1);
      objc_msgSend_setSound_(v16, v90, (uint64_t)v89);
    }
    v86 = objc_msgSend_timerManager(a1[5], v91, v92);
    id v94 = (id)objc_msgSend_addTimer_(v86, v93, (uint64_t)v16);
  }

LABEL_28:
  v95 = [MTCCTimer alloc];
  v97 = objc_msgSend_initWithMTTimer_(v95, v96, (uint64_t)v16);
  v82 = objc_msgSend_futureWithResult_(MEMORY[0x263F58190], v98, (uint64_t)v97);

LABEL_29:

  return v82;
}

void sub_2406B6A00(uint64_t a1, const char *a2, uint64_t a3)
{
  if (objc_msgSend_isEnabled(*(void **)(a1 + 32), a2, a3))
  {
    double v6 = 1.0;
    objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v4, v5, 1.0, 1.0);
  }
  else
  {
    double v6 = 0.75;
    objc_msgSend_colorWithWhite_alpha_(MEMORY[0x263F1C550], v4, v5, 1.0, 0.75);
  id v7 = };
  v10 = objc_msgSend_titleLabel(*(void **)(a1 + 32), v8, v9);
  objc_msgSend_setTextColor_(v10, v11, (uint64_t)v7);

  LODWORD(v10) = objc_msgSend_isSelected(*(void **)(a1 + 32), v12, v13);
  id v16 = objc_msgSend_selectedStateBackgroundView(*(void **)(a1 + 32), v14, v15);
  uint64_t v19 = v16;
  if (v10)
  {
    objc_msgSend_setAlpha_(v16, v17, v18, v6);

    uint64_t v22 = objc_msgSend_normalStateBackgroundView(*(void **)(a1 + 32), v20, v21);
    objc_msgSend_setAlpha_(v22, v23, v24, 0.0);
  }
  else
  {
    objc_msgSend_setAlpha_(v16, v17, v18, 0.0);

    uint64_t v22 = objc_msgSend_normalStateBackgroundView(*(void **)(a1 + 32), v25, v26);
    objc_msgSend_setAlpha_(v22, v27, v28, v6);
  }

  if (objc_msgSend_isHighlighted(*(void **)(a1 + 32), v29, v30)) {
    double v33 = 1.0;
  }
  else {
    double v33 = 0.0;
  }
  objc_msgSend_highlightView(*(void **)(a1 + 32), v31, v32);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v36, v34, v35, v33);
}

uint64_t sub_2406BAC70(uint64_t a1, const char *a2, uint64_t a3)
{
  v4 = objc_msgSend_sliderView(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_sliderValueFromRemainingTime_(*(void **)(a1 + 32), v5, v6, *(double *)(a1 + 40));
  *(float *)&double v7 = v7;
  objc_msgSend_setValue_animated_(v4, v8, *(unsigned __int8 *)(a1 + 48), v7);

  uint64_t v11 = objc_msgSend_timer(*(void **)(a1 + 32), v9, v10);
  BOOL v14 = objc_msgSend_state(v11, v12, v13) != 3;
  v17 = objc_msgSend_sliderView(*(void **)(a1 + 32), v15, v16);
  objc_msgSend_setFirstStepIsDisabled_(v17, v18, v14);

  if (*(unsigned char *)(a1 + 49)) {
    uint64_t v19 = @"timing";
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = *(void *)(a1 + 32);

  return MEMORY[0x270F9A6D0](v20, sel_setGlyphState_, v19);
}

uint64_t CCUISliderExpandedContentModuleHeight()
{
  return MEMORY[0x270F188B0]();
}

uint64_t CCUISliderExpandedContentModuleWidth()
{
  return MEMORY[0x270F188B8]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MTLogForCategory()
{
  return MEMORY[0x270F4B3E0]();
}

void NSLog(NSString *format, ...)
{
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F05FC0](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
}

uint64_t UIPointIntegral()
{
  return MEMORY[0x270F061D0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}