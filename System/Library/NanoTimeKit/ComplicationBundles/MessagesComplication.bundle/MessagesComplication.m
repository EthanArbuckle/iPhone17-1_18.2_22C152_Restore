uint64_t sub_23883CF38(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6)
{
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t vars8;

  objc_msgSend_connectToDaemon(*(void **)(a1 + 32), a2, a3, a4, a5, a6);
  v11 = *(void *)(a1 + 32);

  return MEMORY[0x270F9A6D0](v11, sel_startUnreadCountObservation, v7, v8, v9, v10);
}

void sub_23883CF74(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6)
{
  if (objc_msgSend_isConnectedToDaemon(*(void **)(a1 + 32), a2, a3, a4, a5, a6))
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend_sharedRegistry(MEMORY[0x263F4A540], v7, v8, v9, v10, v11);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_unreadCount(v24, v13, v14, v15, v16, v17);
    objc_msgSend_setInitialUnreadCount_(v12, v19, v20, v21, v22, v23, v18);
  }
}

uint64_t sub_23883D110(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6)
{
  objc_msgSend_stopUnreadCountObservation(*(void **)(a1 + 32), a2, a3, a4, a5, a6);
  v12 = *(void **)(a1 + 32);

  return objc_msgSend_disconnectFromDaemon(v12, v7, v8, v9, v10, v11);
}

void sub_23883D2DC(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6)
{
  v7 = objc_msgSend_log(*(void **)(a1 + 32), a2, a3, a4, a5, a6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_2388408C4();
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_23883D38C;
  block[3] = &unk_264D48A68;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t sub_23883D38C(uint64_t a1, const char *a2, double a3, double a4, double a5, double a6)
{
  v7 = *(void **)(a1 + 32);
  double v8 = objc_msgSend_currentSubscribers(v7, a2, a3, a4, a5, a6);
  objc_msgSend_notifySubscribersAboutNewUnreadCount_(v7, v9, v10, v11, v12, v13, v8);

  uint64_t v18 = *(void *)(a1 + 32);

  return MEMORY[0x270F9A6D0](v18, sel_setIsConnectedToDaemon_, v14, v15, v16, v17);
}

void sub_23883D5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23883D5F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v13 = WeakRetained;
    v7 = objc_msgSend_currentSubscribers(WeakRetained, v2, v3, v4, v5, v6);
    objc_msgSend_notifySubscribersAboutNewUnreadCount_(v13, v8, v9, v10, v11, v12, v7);

    id WeakRetained = v13;
  }
}

void sub_23883DA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23883DA7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_23883DA8C(uint64_t a1)
{
}

uint64_t sub_23883DA94(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_msgSend_firstObject(a2, (const char *)a2, a3, a4, a5, a6);

  return MEMORY[0x270F9A758]();
}

void sub_23883DBAC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_23883DE8C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_23883DEA4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_setCommunicationPolicies_(WeakRetained, v4, v5, v6, v7, v8, v1);

  id v20 = objc_loadWeakRetained(v2);
  double v14 = objc_msgSend_delegate(v20, v9, v10, v11, v12, v13);
  objc_msgSend_invalidateEntries(v14, v15, v16, v17, v18, v19);
}

void sub_23883F324(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_23883F888()
{
  qword_26897B618 = objc_alloc_init(CKMessagesComplicationImageProvider);

  return MEMORY[0x270F9A758]();
}

void sub_23883FAA4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_23883FAC0(_Unwind_Exception *a1)
{
}

void sub_23883FD34(uint64_t a1, void *a2)
{
  id v43 = a2;
  double v8 = objc_msgSend_bubbleTintColor(CKMessagesComplicationSpecs, v3, v4, v5, v6, v7);
  objc_msgSend_set(v8, v9, v10, v11, v12, v13);

  objc_msgSend_drawInRect_(*(void **)(a1 + 32), v14, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (*(unsigned char *)(a1 + 80))
  {
    id v20 = (CGContext *)objc_msgSend_CGContext(v43, v15, v16, v17, v18, v19);
    CGContextSetBlendMode(v20, kCGBlendModeClear);
    v26 = objc_msgSend_bubbleText(*(void **)(a1 + 40), v21, v22, v23, v24, v25);
    objc_msgSend_bubbleTextOrigin(*(void **)(a1 + 40), v27, v28, v29, v30, v31);
    double v33 = v32;
    double v35 = v34;
    v39 = objc_msgSend_textAttributes(*(void **)(a1 + 40), v36, v32, v34, v37, v38);
    objc_msgSend_drawAtPoint_withAttributes_(v26, v40, v33, v35, v41, v42, v39);
  }
}

uint64_t CKHashFromCGRect(double a1, double a2, double a3, double a4)
{
  return (*(void *)&a2 ^ (*(void *)&a1 << 10)) + (*(void *)&a4 ^ (*(void *)&a3 << 10));
}

void sub_2388407D4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23883B000, a2, OS_LOG_TYPE_DEBUG, "added subscriber %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_23884084C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23883B000, a2, OS_LOG_TYPE_DEBUG, "removed subscriber %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_2388408C4()
{
  sub_23883DBC8();
  sub_23883DBAC(&dword_23883B000, v0, v1, "connected to daemon", v2, v3, v4, v5, v6);
}

void sub_2388408F8()
{
  sub_23883DBC8();
  sub_23883DBAC(&dword_23883B000, v0, v1, "disconnected from daemon", v2, v3, v4, v5, v6);
}

void sub_23884092C()
{
  sub_23883DBC8();
  sub_23883DBAC(&dword_23883B000, v0, v1, "starting unread count observation", v2, v3, v4, v5, v6);
}

void sub_238840960()
{
  sub_23883DBC8();
  sub_23883DBAC(&dword_23883B000, v0, v1, "stopping unread count observation", v2, v3, v4, v5, v6);
}

void sub_238840994()
{
  sub_23883DBC8();
  sub_23883DBAC(&dword_23883B000, v0, v1, "number of existing chats == 0", v2, v3, v4, v5, v6);
}

void sub_2388409C8()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_23883F340();
  _os_log_error_impl(&dword_23883B000, v0, OS_LOG_TYPE_ERROR, "unable to request communication policies with error: %{public}@", v1, 0xCu);
}

void sub_238840A3C()
{
  sub_23883F340();
  sub_23883F324(&dword_23883B000, v0, v1, "deallocing %{public}@", v2, v3, v4, v5, v6);
}

void sub_238840AA4()
{
  sub_23883F340();
  sub_23883F324(&dword_23883B000, v0, v1, "Initial unread cound: %{public}lu", v2, v3, v4, v5, v6);
}

void sub_238840B0C()
{
  sub_23883DBC8();
  sub_23883DBAC(&dword_23883B000, v0, v1, "privacyTemplate", v2, v3, v4, v5, v6);
}

void sub_238840B40()
{
  sub_23883DBC8();
  sub_23883DBAC(&dword_23883B000, v0, v1, "lockedTemplate", v2, v3, v4, v5, v6);
}

void sub_238840B74()
{
  sub_23883DBC8();
  sub_23883DBAC(&dword_23883B000, v0, v1, "timeline", v2, v3, v4, v5, v6);
}

void sub_238840BA8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_238840C18(uint64_t a1, const char *a2, NSObject *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_numberWithInteger_(NSNumber, a2, a4, a5, a6, a7, a1);
  sub_23883F340();
  __int16 v11 = 2050;
  double v12 = a2;
  _os_log_debug_impl(&dword_23883B000, a3, OS_LOG_TYPE_DEBUG, "creating template for family: %{public}@, unread: %{public}lu", v10, 0x16u);
}

void sub_238840CD0()
{
  sub_23883DBC8();
  sub_23883DBAC(&dword_23883B000, v0, v1, "setting background color via metadata", v2, v3, v4, v5, v6);
}

void sub_238840D04()
{
  __assert_rtn("-[CKMessagesComplicationDataContext initWithUnreadCount:family:template:specs:imageSize:]", "CKMessagesComplicationDataContext.m", 53, "CGSizeEqualToSize(canvasSize, CGSizeZero) == NO");
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F061F8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F06258]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}