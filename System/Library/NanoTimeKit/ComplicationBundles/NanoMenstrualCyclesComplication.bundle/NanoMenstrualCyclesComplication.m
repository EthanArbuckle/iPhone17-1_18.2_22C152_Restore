id _ImageNamed(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v1 = (void *)MEMORY[0x263F086E0];
  v2 = a1;
  v3 = [v1 bundleForClass:objc_opt_class()];
  v4 = [MEMORY[0x263F1C6B0] imageNamed:v2 inBundle:v3];

  return v4;
}

id sub_23CB1C984(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = _ImageNamed(a3);
  v4 = [MEMORY[0x263EFD1D0] imageProviderWithOnePieceImage:v3];
  [v4 setForegroundAccentImage:v3];

  return v4;
}

id sub_23CB1C9E8(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (void *)MEMORY[0x263EFD1A8];
  v4 = _ImageNamed(a3);
  v5 = [v3 providerWithFullColorImage:v4 monochromeFilterType:0];

  return v5;
}

void sub_23CB1CA4C(void *a1)
{
  v2 = (void *)MEMORY[0x263EFF9A0];
  v3 = [a1 metadata];
  id v8 = [v2 dictionaryWithDictionary:v3];

  v4 = (void *)MEMORY[0x263F1C550];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v4 colorNamed:@"Background" inBundle:v5 compatibleWithTraitCollection:0];
  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x263EFCF80]];

  v7 = (void *)[v8 copy];
  [a1 setMetadata:v7];
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}