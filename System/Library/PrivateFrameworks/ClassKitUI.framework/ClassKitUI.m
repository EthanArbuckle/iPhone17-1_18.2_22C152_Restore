id sub_22BFA2228(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  unsigned char v28[128];
  uint64_t v29;
  uint64_t vars8;

  v29 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend_connectedScenes(a1, a2, a3);
  objc_msgSend_objectsPassingTest_(v3, v4, (uint64_t)&unk_26DF667D0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v24, v28, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v5);
        }
        v13 = objc_msgSend_keyWindow(*(void **)(*((void *)&v24 + 1) + 8 * i), v8, v9, (void)v24);
        if (v13)
        {
          v22 = (void *)v13;
          v17 = v5;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v24, v28, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }

  v14 = objc_alloc(MEMORY[0x263F1CBC8]);
  v17 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v15, v16);
  objc_msgSend_bounds(v17, v18, v19);
  v22 = objc_msgSend_initWithFrame_(v14, v20, v21);
LABEL_11:

  return v22;
}

uint64_t sub_22BFA239C(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend_activationState(v2, v3, v4))
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t sub_22BFA2788()
{
  qword_2684961F8 = (uint64_t)dispatch_queue_create("com.apple.ClassKit.banner", 0);

  return MEMORY[0x270F9A758]();
}

void sub_22BFA28BC(_Unwind_Exception *a1)
{
}

void sub_22BFA28D4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_bannerSemaphore((void *)qword_2684961F0, a2, a3);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22BFA2984;
  block[3] = &unk_264904E40;
  id v6 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t sub_22BFA2984(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](qword_2684961F0, sel__showBanner_, *(void *)(a1 + 32));
}

void sub_22BFA2A90()
{
  v13[3] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263F1C350]);
  objc_msgSend_setLineBreakMode_(v0, v1, 4);
  v3 = objc_msgSend_preferredFontForTextStyle_(MEMORY[0x263F1C658], v2, *MEMORY[0x263F1D298]);
  uint64_t v4 = *MEMORY[0x263F1C238];
  v13[0] = v3;
  uint64_t v5 = *MEMORY[0x263F1C240];
  v12[0] = v4;
  v12[1] = v5;
  v8 = objc_msgSend_labelColor(MEMORY[0x263F1C550], v6, v7);
  v12[2] = *MEMORY[0x263F1C268];
  v13[1] = v8;
  v13[2] = v0;
  uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v13, v12, 3);
  v11 = (void *)qword_268496208;
  qword_268496208 = v10;
}

void sub_22BFA2BF4()
{
  v13[3] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263F1C350]);
  objc_msgSend_setLineBreakMode_(v0, v1, 4);
  v3 = objc_msgSend_preferredFontForTextStyle_(MEMORY[0x263F1C658], v2, *MEMORY[0x263F1D270]);
  uint64_t v4 = *MEMORY[0x263F1C238];
  v13[0] = v3;
  uint64_t v5 = *MEMORY[0x263F1C240];
  v12[0] = v4;
  v12[1] = v5;
  v8 = objc_msgSend_labelColor(MEMORY[0x263F1C550], v6, v7);
  v12[2] = *MEMORY[0x263F1C268];
  v13[1] = v8;
  v13[2] = v0;
  uint64_t v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v9, (uint64_t)v13, v12, 3);
  v11 = (void *)qword_268496218;
  qword_268496218 = v10;
}

uint64_t sub_22BFA2D58()
{
  id v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();
  qword_268496228 = objc_msgSend_bundleForClass_(v0, v2, v1);

  return MEMORY[0x270F9A758]();
}

void sub_22BFA40D0(uint64_t a1, const char *a2)
{
  objc_msgSend_setBannerAnimating_(*(void **)(a1 + 32), a2, 0);
  objc_msgSend_duration(*(void **)(a1 + 40), v3, v4);
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22BFA4180;
  block[3] = &unk_264904E40;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

uint64_t sub_22BFA4180(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend_bannerVisible(*(void **)(a1 + 32), a2, a3);
  if (result)
  {
    dispatch_time_t v6 = *(void **)(a1 + 32);
    return objc_msgSend_hideBannerQuickly_(v6, v5, 0);
  }
  return result;
}

void sub_22BFA41D0(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_bannerView(*(void **)(a1 + 32), a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlpha_(v5, v3, v4, 1.0);
}

uint64_t sub_22BFA4218(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22BFA43E8(uint64_t a1, const char *a2)
{
  objc_msgSend_setBannerAnimating_(*(void **)(a1 + 32), a2, 0);
  objc_msgSend_callCompletionHandler(*(void **)(a1 + 40), v3, v4);
  objc_msgSend_removeFromSuperview(*(void **)(a1 + 40), v5, v6);
  objc_msgSend_setBannerView_(*(void **)(a1 + 32), v7, 0);
  dispatch_time_t v8 = dispatch_time(0, 500000000);
  v9 = MEMORY[0x263EF83A0];

  dispatch_after(v8, v9, &unk_26DF66870);
}

void sub_22BFA4460(uint64_t a1, const char *a2, uint64_t a3)
{
  v3 = objc_msgSend_bannerSemaphore((void *)qword_2684961F0, a2, a3);
  dispatch_semaphore_signal(v3);

  if ((int)atomic_fetch_add_explicit(&dword_2684961EC, 0xFFFFFFFF, memory_order_relaxed) <= 1)
  {
    objc_sync_enter(@"CLSNotificationBannerSyncObject");
    uint64_t v4 = (void *)qword_2684961F0;
    qword_2684961F0 = 0;

    objc_sync_exit(@"CLSNotificationBannerSyncObject");
  }
}

void sub_22BFA44EC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  objc_msgSend_bounds(*(void **)(a1 + 40), a2, a3);
  objc_msgSend__hiddenBannerPosition_(v4, v5, v6, v7, v8);
  double v10 = v9;
  v13 = objc_msgSend_bannerYPositionConstraint(*(void **)(a1 + 32), v11, v12);
  objc_msgSend_setConstant_(v13, v14, v15, v10);

  objc_msgSend_view(*(void **)(a1 + 32), v16, v17);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutIfNeeded(v20, v18, v19);
}

uint64_t sub_22BFA457C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_22BFA478C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_bannerWidthConstraint(*(void **)(a1 + 32), a2, a3);

  if (v4)
  {
    objc_msgSend_bannerWidthForViewSize_(*(void **)(a1 + 32), v5, v6, *(double *)(a1 + 40), *(double *)(a1 + 48));
    double v8 = v7;
    v11 = objc_msgSend_bannerWidthConstraint(*(void **)(a1 + 32), v9, v10);
    objc_msgSend_setConstant_(v11, v12, v13, v8);
  }
  v14 = objc_msgSend_bannerYPositionConstraint(*(void **)(a1 + 32), v5, v6);
  objc_msgSend_constant(v14, v15, v16);
  double v18 = v17;

  uint64_t v19 = *(void **)(a1 + 32);
  v22 = objc_msgSend_bannerView(v19, v20, v21);
  objc_msgSend_bounds(v22, v23, v24);
  objc_msgSend__hiddenBannerPosition_(v19, v25, v26, v27, v28);
  double v30 = v29;

  if (v18 != v30)
  {
    v33 = *(void **)(a1 + 32);
    v34 = objc_msgSend_bannerView(v33, v31, v32);
    objc_msgSend_bounds(v34, v35, v36);
    objc_msgSend__visibleBannerCenterPosition_(v33, v37, v38, v39, v40);
    double v42 = v41;
    v45 = objc_msgSend_bannerYPositionConstraint(*(void **)(a1 + 32), v43, v44);
    objc_msgSend_setConstant_(v45, v46, v47, v42);
  }
  objc_msgSend_view(*(void **)(a1 + 32), v31, v32);
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutIfNeeded(v50, v48, v49);
}

void sub_22BFA4FDC(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  byte_2684961E8 = objc_msgSend_userInterfaceIdiom(v5, v3, v4) == 1;
}

uint64_t sub_22BFA5288(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_22BFA52A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  }
  return result;
}

void sub_22BFA54F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22BFA5510(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = objc_msgSend_previousKeyWindow(WeakRetained, v3, v4);

    if (v5)
    {
      double v8 = objc_msgSend_previousKeyWindow(WeakRetained, v6, v7);
      objc_msgSend_makeKeyAndVisible(v8, v9, v10);

      objc_msgSend_setPreviousKeyWindow_(WeakRetained, v11, 0);
    }
    uint64_t v12 = objc_msgSend_window(WeakRetained, v6, v7);
    objc_msgSend_setRootViewController_(v12, v13, 0);

    uint64_t v16 = objc_msgSend_window(WeakRetained, v14, v15);
    objc_msgSend_removeFromSuperview(v16, v17, v18);

    objc_msgSend_setWindow_(WeakRetained, v19, 0);
  }
}

void sub_22BFA5684(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_sharedApplication(MEMORY[0x263F1C408], a2, a3);
  uint64_t v7 = sub_22BFA2228(v4, v5, v6);
  objc_msgSend_setPreviousKeyWindow_(*(void **)(a1 + 32), v8, (uint64_t)v7);

  id v9 = objc_alloc(MEMORY[0x263F1CBC8]);
  uint64_t v12 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v10, v11);
  objc_msgSend_bounds(v12, v13, v14);
  id v29 = (id)objc_msgSend_initWithFrame_(v9, v15, v16);

  objc_msgSend_setWindow_(*(void **)(a1 + 32), v17, (uint64_t)v29);
  uint64_t v18 = objc_opt_new();
  objc_msgSend_setRootViewController_(v29, v19, (uint64_t)v18);

  objc_msgSend_setWindowLevel_(v29, v20, v21, *MEMORY[0x263F1D820] + -1.0);
  objc_msgSend_makeKeyAndVisible(v29, v22, v23);
  objc_msgSend_setModalPresentationStyle_(*(void **)(a1 + 32), v24, 0);
  double v27 = objc_msgSend_rootViewController(v29, v25, v26);
  objc_msgSend_presentViewController_animated_completion_(v27, v28, *(void *)(a1 + 32), 1, *(void *)(a1 + 40));
}

uint64_t sub_22BFA58A0()
{
  qword_268496240 = objc_alloc_init(CLSNotificationBannerDisplayManager);

  return MEMORY[0x270F9A758]();
}

void sub_22BFA59A0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_lastBannerTime(*(void **)(a1 + 32), a2, a3);
  if (!v4
    || (uint64_t v7 = (void *)v4,
        objc_msgSend_lastBannerTime(*(void **)(a1 + 32), v5, v6),
        double v8 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_timeIntervalSinceNow(v8, v9, v10),
        double v12 = v11,
        v8,
        v7,
        v12 < -30.0))
  {
    uint64_t v13 = objc_msgSend_date(MEMORY[0x263EFF910], v5, v6);
    objc_msgSend_setLastBannerTime_(*(void **)(a1 + 32), v14, (uint64_t)v13);

    uint64_t v15 = *(void *)(a1 + 40);
    MEMORY[0x270F9A6D0](CLSNotificationBanner, sel_showBannerWithTitle_message_completionHandler_, v15);
  }
}

uint64_t sub_22BFA5AA4(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](a2, sel_presentModallyInNewWindowWithCompletion_, 0);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

void objc_enumerationMutation(id obj)
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}