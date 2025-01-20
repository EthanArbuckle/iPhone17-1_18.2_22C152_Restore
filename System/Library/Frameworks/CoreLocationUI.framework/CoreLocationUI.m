void sub_23CB148D4()
{
  uint8_t v0[16];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v0 = 0;
    _os_log_debug_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#locationButton xpc service(locationUI) Interrupted", v0, 2u);
  }
}

void sub_23CB14934()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v0 = 0;
    _os_log_debug_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#locationButton xpc service(locationUI) Invalidated", v0, 2u);
  }
}

void sub_23CB14994(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138412290;
    uint64_t v4 = a2;
    _os_log_error_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_ERROR, "#locationButton Error with proxy, error: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_23CB14F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(a9);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void sub_23CB14FEC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = objc_msgSend_traitCollection(v5, v7, v9, v10);
    int hasDifferentColorAppearanceComparedToTraitCollection = objc_msgSend_hasDifferentColorAppearanceComparedToTraitCollection_(v6, v12, v13, v14, v11);

    if (hasDifferentColorAppearanceComparedToTraitCollection)
    {
      v19 = (void *)WeakRetained[58];
      v20 = objc_msgSend_traitCollection(v5, v16, v17, v18);
      uint64_t v24 = objc_msgSend_resolvedColorWithTraitCollection_(v19, v21, v22, v23, v20);
      v25 = (void *)WeakRetained[60];
      WeakRetained[60] = v24;

      v26 = (void *)WeakRetained[59];
      v30 = objc_msgSend_traitCollection(v5, v27, v28, v29);
      uint64_t v34 = objc_msgSend_resolvedColorWithTraitCollection_(v26, v31, v32, v33, v30);
      v35 = (void *)WeakRetained[61];
      WeakRetained[61] = v34;

      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        v39 = objc_msgSend_traitCollection(v5, v36, v37, v38);
        uint64_t v40 = WeakRetained[60];
        uint64_t v41 = WeakRetained[61];
        int v42 = 138412802;
        v43 = v39;
        __int16 v44 = 2112;
        uint64_t v45 = v40;
        __int16 v46 = 2112;
        uint64_t v47 = v41;
        _os_log_debug_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#locationButton traitCollection: %@ backgroundColor:%@ tintColor:%@", (uint8_t *)&v42, 0x20u);
      }
    }
  }
}

void sub_23CB151B0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend__yieldSlotViewContentForLayerContextID_slotStyle_withYieldBlock_(WeakRetained, v9, v10, v11, a2, v8, v7);
}

void sub_23CB15960(uint64_t a1, const char *a2, __n128 a3, __n128 a4)
{
  id v5 = objc_msgSend_locationUIProxy(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_23CB15A28;
  v13[3] = &unk_264E82270;
  uint64_t v9 = *(void *)(a1 + 72);
  id v14 = *(id *)(a1 + 64);
  objc_msgSend_getRemoteContentForStyle_layerContext_tag_sandboxExtension_completionHandler_(v5, v10, v11, v12, v6, v9, v7, v8, v13);
}

void sub_23CB15A28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = sub_23CB15B20;
    v4[3] = &unk_264E82248;
    id v6 = *(id *)(a1 + 32);
    id v5 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Error: #locationButton remote-imaging suspended. RemoteSlotContent is null", buf, 2u);
  }
}

uint64_t sub_23CB15B20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_23CB16310(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_msgSend_setAccessibilityContrast_(v8, v2, v3, v4, 0);
  objc_msgSend_setAccessibilityButtonShapes_(v8, v5, v6, v7, 0);
}

double sub_23CB166B0(void *a1, void *a2, double a3)
{
  double v25 = 0.0;
  double v26 = 0.0;
  double v24 = 0.0;
  id v5 = a2;
  objc_msgSend_getRed_green_blue_alpha_(a1, v6, v7, v8, &v26, &v25, &v24, 0);
  double v22 = 0.0;
  double v23 = 0.0;
  double v21 = 0.0;
  objc_msgSend_getRed_green_blue_alpha_(v5, v9, v10, v11, &v23, &v22, &v21, 0);

  double v12 = (1.0 - a3) * v23 + v26 * a3;
  double v13 = v24;
  double v14 = (1.0 - a3) * v22 + v25 * a3;
  double v15 = (1.0 - a3) * v21;
  if (v12 <= 0.03928) {
    double v16 = v12 / 12.92;
  }
  else {
    double v16 = pow((v12 + 0.055) / 1.055, 2.4);
  }
  double v17 = v15 + v13 * a3;
  if (v14 <= 0.03928) {
    double v18 = v14 / 12.92;
  }
  else {
    double v18 = pow((v14 + 0.055) / 1.055, 2.4);
  }
  if (v17 <= 0.03928) {
    double v19 = v17 / 12.92;
  }
  else {
    double v19 = pow((v17 + 0.055) / 1.055, 2.4);
  }
  return v18 * 0.7152 + v16 * 0.2126 + v19 * 0.0722;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x270EE4580]();
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

void CFRelease(CFTypeRef cf)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7060](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AE0](descriptor, matrix, size);
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return MEMORY[0x270EE9B80]();
}

CGFloat CTFontGetSize(CTFontRef font)
{
  MEMORY[0x270EE9C40](font);
  return result;
}

void NSLog(NSString *format, ...)
{
}

uint64_t UISLocalizedStringForSecureName()
{
  return MEMORY[0x270F83050]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void free(void *a1)
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}