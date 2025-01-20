void sub_1DD6AB10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id DEPLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = _bundle();
  v3 = [v2 localizedStringForKey:v1 value:0 table:@"DEPLocalizable"];

  return v3;
}

id _bundle()
{
  if (_bundle_once != -1) {
    dispatch_once(&_bundle_once, &__block_literal_global);
  }
  v0 = (void *)_bundle_bundle;
  return v0;
}

id DEPUSEnglishString(void *a1)
{
  id v1 = a1;
  v2 = _bundle();
  v3 = [v2 localizedStringForKey:v1 value:0 table:@"DEPLocalizable" localization:@"en"];

  return v3;
}

id DEPErrorArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9, uint64_t a10)
{
  id v10 = a1;
  v11 = objc_opt_new();
  _DEPStashFormattedStringInArray(v11, v10, 0, (uint64_t)&a9);
  _DEPStashFormattedStringInArray(v11, v10, 1, (uint64_t)&a9);
  id v12 = v11;
  v18 = (id *)&a10;
  id v13 = a9;
  if (v13)
  {
    v14 = v13;
    do
    {
      [v12 addObject:v14];
      v15 = v18++;
      id v16 = *v15;

      v14 = v16;
    }
    while (v16);
  }

  return v12;
}

void _DEPStashFormattedStringInArray(void *a1, void *a2, int a3, uint64_t a4)
{
  v6 = (objc_class *)NSString;
  id v7 = a2;
  id v8 = a1;
  id v9 = [v6 alloc];
  if (a3)
  {
    id v10 = DEPUSEnglishString(v7);

    if (DEPUSEnglishLocale_once != -1) {
      dispatch_once(&DEPUSEnglishLocale_once, &__block_literal_global_45);
    }
    v11 = objc_msgSend(v9, "initWithFormat:locale:arguments:", v10, DEPUSEnglishLocale_locale, a4, a4, a4);
    [v8 addObject:v11];
  }
  else
  {
    id v10 = DEPLocalizedString(v7);

    v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v12 = [v9 initWithFormat:v10 locale:v11 arguments:a4];
    [v8 addObject:v12];

    id v8 = (id)v12;
  }
}

uint64_t ___bundle_block_invoke()
{
  _bundle_bundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  return MEMORY[0x1F41817F8]();
}

uint64_t __DEPUSEnglishLocale_block_invoke()
{
  DEPUSEnglishLocale_locale = [objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  return MEMORY[0x1F41817F8]();
}

uint64_t *DEPLogObjects()
{
  if (DEPLogObjects_onceToken != -1) {
    dispatch_once(&DEPLogObjects_onceToken, &__block_literal_global_0);
  }
  return &DEPLogObjects__DEPLogObjects;
}

uint64_t __DEPLogObjects_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.devicemanagementclient", "DEPClient");
  id v1 = (void *)DEPLogObjects__DEPLogObjects;
  DEPLogObjects__DEPLogObjects = (uint64_t)v0;

  qword_1EAB56F50 = (uint64_t)os_log_create("com.apple.devicemanagementclient", "DEPDaemon");
  return MEMORY[0x1F41817F8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}