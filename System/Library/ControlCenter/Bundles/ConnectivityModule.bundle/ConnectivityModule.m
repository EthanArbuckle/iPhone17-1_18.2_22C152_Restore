void sub_24062FA90(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t vars8;

  objc_msgSend_setDelegate_(*(void **)(*(void *)(a1 + 32) + 1112), a2, 0);
  v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 1112);
  *(void *)(v3 + 1112) = 0;
}

uint64_t sub_24062FCA8(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_refresh(*(void **)(*(void *)(a1 + 32) + 1112), a2, a3);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 1112);

  return objc_msgSend_setDelegate_(v6, v4, v5);
}

uint64_t sub_24062FD94(uint64_t a1, const char *a2)
{
  return objc_msgSend_setDelegate_(*(void **)(*(void *)(a1 + 32) + 1112), a2, 0);
}

uint64_t sub_24062FE9C(uint64_t a1, const char *a2)
{
  return objc_msgSend__updateStateWithEnabled_(*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

void sub_24062FFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24062FFC4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend_airplaneMode(*(void **)(*(void *)(a1 + 32) + 1112), a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_24063024C(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(*(void *)(a1 + 32) + 1112), sel_setAirplaneMode_, *(unsigned __int8 *)(a1 + 40));
}

void sub_240630F24(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_view(*(void **)(a1 + 32), a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutIfNeeded(v5, v3, v4);
}

uint64_t sub_24063171C(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__initializeExpandedView(*(void **)(a1 + 32), a2, a3);
}

void sub_2406317E0(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__initializeExpandedView(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_view(*(void **)(a1 + 32), v4, v5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNeedsLayout(v10, v6, v7);
  objc_msgSend_layoutIfNeeded(v10, v8, v9);
}

uint64_t sub_2406319F8(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__updateTelephonyState(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_240633294(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2406342C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_240634F58(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = objc_opt_class();
  v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  v8 = objc_msgSend_localizedStringForKey_value_table_(v6, v7, @"CONTROL_CENTER_STATUS_CELLULAR_SETTINGS", &stru_26F4C07A8, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_24063507C;
  v10[3] = &unk_2650C9448;
  objc_copyWeak(&v11, &location);
  objc_msgSend_setFooterButtonTitle_handler_(v2, v9, (uint64_t)v8, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void sub_240635058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_24063507C(uint64_t a1, const char *a2)
{
  v3 = objc_msgSend_URLWithString_(NSURL, a2, @"prefs:root=MOBILE_DATA_SETTINGS_ID");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = objc_msgSend_contentModuleContext(WeakRetained, v5, v6);
  objc_msgSend_openURL_completionHandler_(v7, v8, (uint64_t)v3, 0);

  return 0;
}

uint64_t sub_2406351C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__updateCellularMenuItems, a3);
}

void sub_24063571C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_24063574C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)WeakRetained[158];
  uint64_t v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_240635804;
  v7[3] = &unk_2650C9470;
  id v8 = v4;
  objc_msgSend_setActiveUserDataSelection_completion_(v3, v5, (uint64_t)v8, v7);

  return 0;
}

void sub_240635804(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F33C50];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5) {
      sub_240636F7C(a1, (uint64_t)v3, v4);
    }
  }
  else if (v5)
  {
    sub_240636F00(a1, v4);
  }
}

uint64_t sub_2406358F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__updateCellularMenuItems, a3);
}

void sub_2406360D8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2406360EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && _NETRBClientCreate())
  {
    v2 = *MEMORY[0x263F33C50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_24062E000, v2, OS_LOG_TYPE_DEFAULT, "[Hotspot] Starting hotspot service", v3, 2u);
    }
    _NETRBClientSetGlobalServiceState();
    _NETRBClientDestroy();
  }
}

uint64_t sub_2406361AC()
{
  return 0;
}

void sub_240636270(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_24063628C(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int isDiscoverable = objc_msgSend_isDiscoverable(WeakRetained, v5, v6);

  if (isDiscoverable != a2)
  {
    id v8 = *MEMORY[0x263F33C50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = a2;
      _os_log_impl(&dword_24062E000, v8, OS_LOG_TYPE_DEFAULT, "[Hotspot] Hotspot discoverability changed to %d", buf, 8u);
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_2406363CC;
    v9[3] = &unk_2650C9508;
    objc_copyWeak(&v10, v3);
    char v11 = a2;
    dispatch_async(MEMORY[0x263EF83A0], v9);
    objc_destroyWeak(&v10);
  }
}

void sub_2406363CC(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_setDiscoverable_(WeakRetained, v4, *(unsigned __int8 *)(a1 + 40));

  id v7 = objc_loadWeakRetained(v2);
  objc_msgSend__updateState(v7, v5, v6);
}

void sub_240636544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_240636558(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v19 = 0;
    if (_NETRBClientCreate())
    {
      int v18 = 0;
      uint64_t v17 = 0;
      _NETRBClientGetGlobalServiceState();
      _NETRBClientGetHostCount();
      _NETRBClientDestroy();
      __int16 v16 = 0;
      char v15 = 0;
      uint64_t v4 = _CTServerConnectionCreateWithIdentifier();
      if (v4)
      {
        BOOL v5 = (const void *)v4;
        _CTServerConnectionGetCellularDataSettings();
        CFRelease(v5);
        BOOL v6 = HIBYTE(v16) == 1;
        BOOL v7 = v16 == 1;
        BOOL v8 = v15 == 1;
      }
      else
      {
        BOOL v8 = 0;
        BOOL v7 = 0;
        BOOL v6 = 0;
      }
      id v10 = *MEMORY[0x263F33C50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110144;
        int v21 = 0;
        __int16 v22 = 1024;
        int v23 = 0;
        __int16 v24 = 1024;
        BOOL v25 = v6;
        __int16 v26 = 1024;
        BOOL v27 = v7;
        __int16 v28 = 1024;
        BOOL v29 = v8;
        _os_log_impl(&dword_24062E000, v10, OS_LOG_TYPE_DEFAULT, "[Hotspot] Evaluating state... (shouldShowTethering: %d, isDataPrevented: %d, isCellularDataCapable: %d, isCellularDataEnabled: %d, isAirplaneModeEnabled: %d)", buf, 0x20u);
      }
      char v9 = (!v7 || v8) | 1;
    }
    else
    {
      char v9 = 0;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2406367E0;
    block[3] = &unk_2650C9558;
    objc_copyWeak(&v12, v2);
    char v14 = v9;
    int v13 = v19;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v12);
  }
}

uint64_t sub_2406367D8()
{
  return 0;
}

void sub_2406367E0(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int isHotspotRestricted = objc_msgSend__isHotspotRestricted(WeakRetained, v3, v4);
  BOOL v6 = (os_log_t *)MEMORY[0x263F33C50];
  BOOL v7 = *MEMORY[0x263F33C50];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C50], OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 67109120;
    unsigned int v37 = isHotspotRestricted;
    _os_log_impl(&dword_24062E000, v7, OS_LOG_TYPE_DEFAULT, "[Hotspot] Evaluating state... (isHotspotRestricted: %d)", (uint8_t *)&v36, 8u);
  }
  if (*(unsigned char *)(a1 + 52)) {
    objc_msgSend_setInoperative_(WeakRetained, v8, 1);
  }
  else {
    objc_msgSend_setInoperative_(WeakRetained, v8, isHotspotRestricted);
  }
  objc_msgSend_setConnections_(WeakRetained, v9, *(unsigned int *)(a1 + 48));
  if (*(unsigned char *)(a1 + 52)) {
    objc_msgSend_setEnabled_(WeakRetained, v10, 0);
  }
  else {
    objc_msgSend_setEnabled_(WeakRetained, v10, *(_DWORD *)(a1 + 48) != 0);
  }
  int v13 = objc_msgSend_subtitleText(WeakRetained, v11, v12);
  objc_msgSend_setSubtitle_(WeakRetained, v14, (uint64_t)v13);

  uint64_t v17 = objc_msgSend__glyphImageForCurrentState(*(void **)(a1 + 32), v15, v16);
  objc_msgSend_setGlyphImage_(WeakRetained, v18, (uint64_t)v17);

  int isDiscoverable = objc_msgSend_isDiscoverable(WeakRetained, v19, v20);
  int v23 = isDiscoverable;
  BOOL v24 = 0;
  if (!*(unsigned char *)(a1 + 52) && isDiscoverable) {
    BOOL v24 = *(_DWORD *)(a1 + 48) == 0;
  }
  objc_msgSend_setUseAlternateBackground_(WeakRetained, v22, v24);
  os_log_t v25 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v26 = v25;
    unsigned int isInoperative = objc_msgSend_isInoperative(WeakRetained, v27, v28);
    int isEnabled = objc_msgSend_isEnabled(WeakRetained, v30, v31);
    int v35 = objc_msgSend_connections(WeakRetained, v33, v34);
    int v36 = 67109888;
    unsigned int v37 = isInoperative;
    __int16 v38 = 1024;
    int v39 = isEnabled;
    __int16 v40 = 1024;
    int v41 = v23;
    __int16 v42 = 1024;
    int v43 = v35;
    _os_log_impl(&dword_24062E000, v26, OS_LOG_TYPE_DEFAULT, "[Hotspot] Updated state [ inoperative: %d enabled: %d discoverable: %d connections: %d ]", (uint8_t *)&v36, 0x1Au);
  }
}

void sub_240636E10(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24062E000, a2, OS_LOG_TYPE_ERROR, "Could not get subscription info. Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_240636E88(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24062E000, a2, OS_LOG_TYPE_ERROR, "Could not get subscriptions Info. Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_240636F00(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_24062E000, a2, OS_LOG_TYPE_ERROR, "Setting Active user data selection to %@", (uint8_t *)&v3, 0xCu);
}

void sub_240636F7C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_24062E000, log, OS_LOG_TYPE_ERROR, "Error setting active data selection to %@. Error: %@", (uint8_t *)&v4, 0x16u);
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t CCSIsInternalInstall()
{
  return MEMORY[0x270F18818]();
}

uint64_t CCUICompactModuleContinuousCornerRadiusForGridSizeClass()
{
  return MEMORY[0x270F18838]();
}

uint64_t CCUIItemEdgeSize()
{
  return MEMORY[0x270F18868]();
}

uint64_t CCUILayoutGutter()
{
  return MEMORY[0x270F18870]();
}

uint64_t CCUINumberOfColumnsForGridSizeClass()
{
  return MEMORY[0x270F18888]();
}

uint64_t CCUINumberOfRowsForGridSizeClass()
{
  return MEMORY[0x270F18890]();
}

uint64_t CCUIReferenceScreenBounds()
{
  return MEMORY[0x270F18898]();
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x270F06220]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F06260]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x270F06280]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x270EE87D8]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x270EE8808]();
}

uint64_t _CTServerConnectionGetCellularDataSettings()
{
  return MEMORY[0x270EE8810]();
}

uint64_t _CTServerConnectionSetCellularDataIsEnabled()
{
  return MEMORY[0x270EE8890]();
}

uint64_t _NETRBClientCreate()
{
  return MEMORY[0x270F4DC70]();
}

uint64_t _NETRBClientDestroy()
{
  return MEMORY[0x270F4DC78]();
}

uint64_t _NETRBClientGetGlobalServiceState()
{
  return MEMORY[0x270F4DC80]();
}

uint64_t _NETRBClientGetHostCount()
{
  return MEMORY[0x270F4DC88]();
}

uint64_t _NETRBClientSetGlobalServiceState()
{
  return MEMORY[0x270F4DC90]();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}