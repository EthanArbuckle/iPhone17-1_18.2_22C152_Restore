void sub_2406A6934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2406A695C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2406A6A18;
  v5[3] = &unk_2650CF110;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void sub_2406A6A18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateMenuItemsWithDate:*(void *)(a1 + 32)];
}

void sub_2406A6FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

uint64_t sub_2406A7008(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _turnOnSpokenMessages];
    [v2 _refreshState];
  }

  return 1;
}

uint64_t sub_2406A704C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _muteSpokenMessages];
    [v2 _refreshState];
  }

  return 1;
}

uint64_t sub_2406A7090(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _turnOffSpokenMessagesForTheDay];
    [v2 _refreshState];
  }

  return 1;
}

void sub_2406A785C(uint64_t a1, char a2)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_2406A7914;
  v4[3] = &unk_2650CF188;
  char v6 = a2;
  v4[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x263EF83A0], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void sub_2406A7914(uint64_t a1)
{
  BOOL v2 = !*(unsigned char *)(a1 + 48)
    && [*(id *)(a1 + 32) isDeviceInEligibleAnnounceNotificationsConfiguration]
    && [*(id *)(a1 + 32) contentRenderingMode] != 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_refreshStateWithSelected:expanded:", v2, objc_msgSend(*(id *)(a1 + 32), "isExpanded"));
}

uint64_t sub_2406A7BA4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setSelected:0];
    id v4 = *(void **)(a1 + 32);
  }
  else
  {
    [v3 setSelected:*(unsigned __int8 *)(a1 + 41)];
    id v5 = *(void **)(a1 + 32);
    [v5 isSelected];
    id v4 = v5;
  }

  return MEMORY[0x270F9A6D0](v4, sel_setGlyphState_);
}

void sub_2406A7DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2406A7DCC(uint64_t a1, char a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (a2) {
    [WeakRetained _turnOnSpokenMessages];
  }
  else {
    [WeakRetained _turnOffSpokenMessagesForTheDay];
  }

  id v6 = objc_loadWeakRetained(v3);
  [v6 _refreshState];
}

uint64_t sub_2406A7F30(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMenuItems];
}

void sub_2406A81C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _fetchAnnounceSettingsAndRefreshState];
    id WeakRetained = v2;
  }
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}