void sub_222E2A56C(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  uint64_t vars8;

  v9 = a2;
  v5 = *(void **)(*(void *)(a1 + 32) + 32);
  v6 = a3;
  v7 = [v5 profileDataForKey:v9];
  v8 = [v7 isEqualToData:v6];

  if ((v8 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v9];
  }
}

void sub_222E2A604(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKey:");

  if (!v3) {
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:v4];
  }
}

id CorrectionsProfilesDigest(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = [v1 allKeys];
  v3 = (void *)[v2 mutableCopy];

  [v3 sortUsingComparator:&unk_26D5C1578];
  id v4 = AFSecurityDigestChunksWithProvider();
  id v5 = 0;
  if (v5)
  {
    v6 = *MEMORY[0x263F28380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "CorrectionsProfilesDigest";
      __int16 v15 = 2112;
      id v16 = v1;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_error_impl(&dword_222E28000, v6, OS_LOG_TYPE_ERROR, "%s Error creating digest for correction profiles %@: %@", buf, 0x20u);
    }
    v7 = 0;
  }
  else
  {
    uint64_t v8 = [v4 length];
    v7 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:2 * v8];
    uint64_t v9 = [v4 bytes];
    if (v8)
    {
      v10 = (unsigned __int8 *)v9;
      do
      {
        unsigned int v11 = *v10++;
        objc_msgSend(v7, "appendFormat:", @"%02x", v11);
        --v8;
      }
      while (v8);
    }
  }

  return v7;
}

uint64_t sub_222E2B288(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 absoluteString];
  v6 = [v4 absoluteString];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t AFSecurityDigestChunksWithProvider()
{
  return MEMORY[0x270F0EF20]();
}

uint64_t AFUserSupportDirectoryPath()
{
  return MEMORY[0x270F0EFE0]();
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}