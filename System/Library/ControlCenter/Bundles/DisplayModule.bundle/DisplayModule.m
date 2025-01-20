void sub_240641DA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_240641DBC(uint64_t a1, long long *a2)
{
  v3 = (id *)(a1 + 32);
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    long long v7 = a2[1];
    long long v13 = *a2;
    long long v6 = v13;
    long long v14 = v7;
    uint64_t v15 = *((void *)a2 + 4);
    *((void *)WeakRetained + 139) = v15;
    *(_OWORD *)(WeakRetained + 1080) = v6;
    *(_OWORD *)(WeakRetained + 1096) = v7;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_240641EA8;
    v8[3] = &unk_2650CA320;
    objc_copyWeak(&v9, v3);
    long long v10 = v13;
    long long v11 = v14;
    uint64_t v12 = v15;
    dispatch_async(MEMORY[0x263EF83A0], v8);
    objc_destroyWeak(&v9);
  }
}

void sub_240641EA8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    long long v6 = (void *)MEMORY[0x263F33C78];
    long long v7 = objc_msgSend_viewIfLoaded(WeakRetained, v3, v4);
    long long v10 = objc_msgSend_window(v7, v8, v9);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_240641F90;
    v12[3] = &unk_2650CA2F8;
    v12[4] = v5;
    long long v13 = *(_OWORD *)(a1 + 40);
    long long v14 = *(_OWORD *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 72);
    objc_msgSend_performWithoutAnimationWhileHiddenInWindow_actions_(v6, v11, (uint64_t)v10, v12);
  }
}

uint64_t sub_240641F90(uint64_t a1, const char *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_240642034;
  v3[3] = &unk_2650CA2F8;
  v3[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 72);
  return objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x263F1CB60], a2, 4, v3, 0, 0.25, 0.0);
}

void sub_240642034(uint64_t a1, const char *a2, uint64_t a3)
{
  long long v4 = objc_msgSend_nightShiftButton(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_setEnabled_(v4, v5, *(unsigned __int8 *)(a1 + 41));
  if (*(void *)(a1 + 64)) {
    objc_msgSend_setInoperative_(v4, v6, 1);
  }
  else {
    objc_msgSend_setInoperative_(v4, v6, *(unsigned char *)(a1 + 72) == 0);
  }
  v8 = *(void **)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 56);
  v12[0] = *(_OWORD *)(a1 + 40);
  v12[1] = v9;
  uint64_t v13 = *(void *)(a1 + 72);
  long long v10 = objc_msgSend__subtitleForBlueLightStatus_(v8, v7, (uint64_t)v12);
  objc_msgSend_setSubtitle_(v4, v11, (uint64_t)v10);
}

void sub_2406421A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2406421C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v4 = WeakRetained;
  if (WeakRetained)
  {
    long long v5 = (void *)MEMORY[0x263F33C78];
    uint64_t v6 = objc_msgSend_viewIfLoaded(WeakRetained, v2, v3);
    long long v9 = objc_msgSend_window(v6, v7, v8);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_240642288;
    v11[3] = &unk_2650CA370;
    v11[4] = v4;
    objc_msgSend_performWithoutAnimationWhileHiddenInWindow_actions_(v5, v10, (uint64_t)v9, v11);
  }
}

uint64_t sub_240642288(uint64_t a1, const char *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_240642314;
  v3[3] = &unk_2650CA370;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x263F1CB60], a2, 4, v3, 0, 0.25, 0.0);
}

void sub_240642314(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_trueToneButton(*(void **)(a1 + 32), a2, a3);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t Enabled = objc_msgSend_getEnabled(*(void **)(*(void *)(a1 + 32) + 1064), v4, v5);
  objc_msgSend_setEnabled_(v15, v7, Enabled);
  long long v9 = objc_msgSend__subtitleForTrueToneEnabled_(*(void **)(a1 + 32), v8, Enabled);
  objc_msgSend_setSubtitle_(v15, v10, (uint64_t)v9);

  int v13 = objc_msgSend_available(*(void **)(*(void *)(a1 + 32) + 1064), v11, v12);
  objc_msgSend_setInoperative_(v15, v14, v13 ^ 1u);
}

void sub_2406425A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32) + 1080;
  uint64_t v6 = *(void *)(a2 + 32);
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v7;
  *(void *)(v5 + 32) = v6;
  uint64_t v8 = objc_msgSend_nightShiftButton(*(void **)(a1 + 32), (const char *)a2, a3);
  objc_msgSend_setEnabled_(v8, v9, *(unsigned __int8 *)(a2 + 1));

  uint64_t v12 = objc_msgSend_nightShiftButton(*(void **)(a1 + 32), v10, v11);
  long long v14 = v12;
  if (*(void *)(a2 + 24)) {
    objc_msgSend_setInoperative_(v12, v13, 1);
  }
  else {
    objc_msgSend_setInoperative_(v12, v13, *(unsigned char *)(a2 + 32) == 0);
  }

  v17 = objc_msgSend_nightShiftButton(*(void **)(a1 + 32), v15, v16);
  v18 = *(void **)(a1 + 32);
  long long v19 = *(_OWORD *)(a2 + 16);
  v23[0] = *(_OWORD *)a2;
  v23[1] = v19;
  uint64_t v24 = *(void *)(a2 + 32);
  v21 = objc_msgSend__subtitleForBlueLightStatus_(v18, v20, (uint64_t)v23);
  objc_msgSend_setSubtitle_(v17, v22, (uint64_t)v21);
}

void sub_240642758(uint64_t a1, uint64_t a2)
{
  int v3 = *(unsigned __int8 *)(a2 + 1);
  uint64_t v4 = *(void *)(a1 + 32) + 1080;
  uint64_t v5 = *(void *)(a2 + 32);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)a2;
  *(_OWORD *)(v4 + 16) = v6;
  *(void *)(v4 + 32) = v5;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_2406428F0;
  v19[3] = &unk_2650CA3E8;
  v19[4] = *(void *)(a1 + 32);
  char v20 = v3 ^ 1;
  long long v7 = (void (**)(void))MEMORY[0x2455F2320](v19);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_240642958;
  v18[3] = &unk_2650CA370;
  v18[4] = *(void *)(a1 + 32);
  uint64_t v8 = (void *)MEMORY[0x2455F2320](v18);
  if (v3 || !_AXSScreenFilterApplied())
  {
    v7[2](v7);
  }
  else
  {
    long long v10 = objc_msgSend__alertControllerForDisablingAccessibilityScreenFilter_cancelBlock_(*(void **)(a1 + 32), v9, (uint64_t)v7, v8);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 1120);
    *(void *)(v11 + 1120) = v10;
    id v13 = v10;

    uint64_t v16 = objc_msgSend_parentViewController(*(void **)(a1 + 32), v14, v15);
    objc_msgSend_presentViewController_animated_completion_(v16, v17, (uint64_t)v13, 1, 0);
  }
}

void sub_2406428F0(uint64_t a1, const char *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1081) = *(unsigned char *)(a1 + 40);
  objc_msgSend__setNightShiftEnabled_(*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 1120);
  *(void *)(v3 + 1120) = 0;
}

void sub_240642958(uint64_t a1, const char *a2)
{
  objc_msgSend__setNightShiftEnabled_(*(void **)(a1 + 32), a2, *(unsigned __int8 *)(*(void *)(a1 + 32) + 1081));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 1120);
  *(void *)(v3 + 1120) = 0;
}

uint64_t sub_240642D60(uint64_t a1)
{
  _AXSDisableScreenFilters();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_240642DB0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_240643860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240643880(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_240643910;
  block[3] = &unk_2650CA450;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void sub_240643910(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x263F33C78];
  uint64_t v5 = objc_msgSend_viewIfLoaded(WeakRetained, v3, v4);
  uint64_t v8 = objc_msgSend_window(v5, v6, v7);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2406439CC;
  v10[3] = &unk_2650CA370;
  v10[4] = WeakRetained;
  objc_msgSend_performWithoutAnimationWhileHiddenInWindow_actions_(v2, v9, (uint64_t)v8, v10);
}

uint64_t sub_2406439CC(uint64_t a1, const char *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_240643A58;
  v3[3] = &unk_2650CA370;
  v3[4] = *(void *)(a1 + 32);
  return objc_msgSend_animateWithDuration_delay_options_animations_completion_(MEMORY[0x263F1CB60], a2, 4, v3, 0, 0.25, 0.0);
}

uint64_t sub_240643A58(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__updateBrightnessControlAvailability(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_240643B30(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_setNeedsLayout(*(void **)(*(void *)(a1 + 32) + 1024), a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1024);

  return MEMORY[0x270F9A6D0](v5, sel_layoutIfNeeded, v4);
}

uint64_t BKSDisplayBrightnessTransactionCreate()
{
  return MEMORY[0x270F10458]();
}

uint64_t CCUISliderPreviewRenderingModeValue()
{
  return MEMORY[0x270F188C8]();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t _AXSDisableScreenFilters()
{
  return MEMORY[0x270F90718]();
}

uint64_t _AXSScreenFilterApplied()
{
  return MEMORY[0x270F909B0]();
}

uint64_t _UIUpdatedVisualStyleEnabled()
{
  return MEMORY[0x270F063C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}