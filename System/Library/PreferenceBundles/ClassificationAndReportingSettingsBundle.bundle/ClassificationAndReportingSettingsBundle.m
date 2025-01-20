id sub_23E8(uint64_t a1)
{
  void *v2;
  uint64_t vars8;

  [*(id *)(a1 + 32) setExtensionSpecifiers:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_268C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "setting specifier %@ checked", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 40) setProperty:*(void *)(a1 + 32) forKey:PSRadioGroupCheckedSpecifierKey];
  v6 = ILDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "setting extension %@ elected", (uint8_t *)&v8, 0xCu);
  }

  v7 = +[ILClassificationController sharedInstance];
  [v7 setElectedExtension:v3];

  [*(id *)(a1 + 48) reloadSpecifiers];
}

void sub_27D0(uint64_t a1, int a2)
{
  v4 = ILDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "completed electing extension (%@): %d", (uint8_t *)&v6, 0x12u);
  }

  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_2B40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2B54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ILDefaultLog()
{
  return _ILDefaultLog();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__plugIn(void *a1, const char *a2, ...)
{
  return [a1 _plugIn];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_classBundle(void *a1, const char *a2, ...)
{
  return [a1 classBundle];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_electedExtension(void *a1, const char *a2, ...)
{
  return [a1 electedExtension];
}

id objc_msgSend_extensionSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 extensionSpecifiers];
}

id objc_msgSend_extensions(void *a1, const char *a2, ...)
{
  return [a1 extensions];
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return [a1 localizationTableName];
}

id objc_msgSend_localizedContainingName(void *a1, const char *a2, ...)
{
  return [a1 localizedContainingName];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_specifiersArray(void *a1, const char *a2, ...)
{
  return [a1 specifiersArray];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}