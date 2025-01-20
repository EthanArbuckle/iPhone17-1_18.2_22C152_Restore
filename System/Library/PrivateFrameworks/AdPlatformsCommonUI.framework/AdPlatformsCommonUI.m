void sub_235F4F1B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_235F4F30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_235F4F474()
{
  qword_26AB31CA0 = objc_alloc_init(APClientInfoUI);
  return MEMORY[0x270F9A758]();
}

id sub_235F4F50C(void *a1, uint64_t a2, void *a3)
{
  v4 = (void *)MEMORY[0x263F1FAB8];
  id v5 = a3;
  v6 = [v4 remoteObjectInterfaceWithProtocol:&unk_26E9628D8];
  v7 = [a1 _remoteObjectRegistry];
  [v7 registerExportedObject:v5 interface:v6];

  return v6;
}

void sub_235F4F598(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [a1 _remoteObjectRegistry];
  [v6 unregisterExportedObject:a1 interface:v5];
}

id sub_235F4F600(void *a1)
{
  v2 = [MEMORY[0x263F1FAB8] remoteObjectInterfaceWithProtocol:&unk_26E962A70];
  v3 = [a1 _remoteObjectRegistry];
  v4 = [v3 remoteObjectProxyWithInterface:v2];

  return v4;
}

uint64_t sub_235F4F680(void *a1)
{
  [a1 _setInputDelegate:a1];
  [a1 _setResourceLoadDelegate:a1];
  uint64_t result = [MEMORY[0x263F20B88] isAppleInternalInstall];
  if (result)
  {
    return MEMORY[0x270F9A6D0](a1, sel__setObservedRenderingProgressEvents_);
  }
  return result;
}

uint64_t sub_235F4F6E8()
{
  return 0;
}

void sub_235F4F6F0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  sub_235F4F8F4((uint64_t)APWebViewResourceLoadCAReporter, v9, v10, a6);
  if (v10)
  {
    if ((byte_26884DBC8 & 1) == 0
      && [v10 code] == -1002
      && ([v10 domain],
          v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 isEqualToString:*MEMORY[0x263F08570]],
          v11,
          v12))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"WebKit custom protocols were not registered. Proxy is running: %d", *MEMORY[0x263F242A0]);
      APSimulateCrash();
      byte_26884DBC8 = 1;
    }
    else
    {
      v14 = APLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = [v10 domain];
        uint64_t v16 = [v10 code];
        v17 = [v9 originalURL];
        v18 = [v17 host];
        *(_DWORD *)buf = 141559042;
        uint64_t v20 = 1752392040;
        __int16 v21 = 2048;
        uint64_t v22 = a1;
        __int16 v23 = 2114;
        v24 = v15;
        __int16 v25 = 2048;
        uint64_t v26 = v16;
        __int16 v27 = 2114;
        v28 = v18;
        _os_log_impl(&dword_235F4E000, v14, OS_LOG_TYPE_ERROR, "WebView (%{mask.hash}p) request failed: %{public}@:%ld. Host: %{public}@", buf, 0x34u);
      }
    }
  }
}

void sub_235F4F8F4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  id v10 = [v6 originalURL];
  v11 = [v10 scheme];
  if ([v11 isEqualToString:@"blob"])
  {
    int v12 = [v6 originalURL];
    v13 = [v12 resourceSpecifier];
    char v14 = [v13 hasPrefix:@"null"];

    if (v14) {
      goto LABEL_17;
    }
    if (!v7) {
      goto LABEL_13;
    }
  }
  else
  {

    if (!v7) {
      goto LABEL_13;
    }
  }
  if (![v7 code])
  {
    v15 = [v7 domain];
    if (![v15 length])
    {
      uint64_t v16 = [v7 description];
      if ([v16 isEqualToString:@"Redirection to URL with a scheme that is not HTTP(S)"])
      {
        v17 = [v6 originalURL];
        char v18 = [v9 _isHTTPOrHTTPSURL:v17];

        if ((v18 & 1) == 0) {
          goto LABEL_17;
        }
        goto LABEL_13;
      }
    }
  }
LABEL_13:
  uint64_t v26 = -1;
  uint64_t v27 = 0;
  id v25 = 0;
  [v9 _parseResourceLoadResultForError:v7 response:v8 result:&v27 errorDomain:&v25 errorCode:&v26];
  id v19 = v25;
  if (v27)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_235F4FB90;
    v24[3] = &unk_264C960F8;
    v24[4] = v27;
    [MEMORY[0x263F20B48] sendEventLazy:@"wk.resource.result" eventPayloadBuilder:v24];
    if (v27 != 1)
    {
      uint64_t v20 = (void *)MEMORY[0x263F20B48];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = sub_235F4FC44;
      v21[3] = &unk_264C96120;
      id v22 = v19;
      uint64_t v23 = v26;
      [v20 sendEventLazy:@"wk.resource.error" eventPayloadBuilder:v21];
    }
  }

LABEL_17:
}

id sub_235F4FB90(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v4 = @"result";
  v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

id sub_235F4FC44(uint64_t a1)
{
  void v5[2] = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", *(void *)(a1 + 40), @"domain", @"error", *(void *)(a1 + 32));
  v5[1] = v1;
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:2];

  return v2;
}

void sub_235F4FF9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x263F1C748] sharedInputModeController];
  v2 = [v1 normalizedEnabledInputModeIdentifiers];
  [WeakRetained setUserKeyboards:v2];
}

uint64_t APLogForCategory()
{
  return MEMORY[0x270F08BC8]();
}

uint64_t APSimulateCrash()
{
  return MEMORY[0x270F08BD8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x270F91820]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x270F91838]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x270F91848]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}