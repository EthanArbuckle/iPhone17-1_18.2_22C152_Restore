uint64_t sub_2405D656C(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = [a1 accountType];
  v3 = [v2 identifier];

  if ([v3 isEqualToString:*MEMORY[0x263EFAE58]]) {
    v4 = objc_msgSend(a1, "aa_isAccountClass:", *MEMORY[0x263F25618]);
  }
  else {
    v4 = 0;
  }

  return v4;
}

uint64_t PKLogFacilityTypeGetObject()
{
  return MEMORY[0x270F51DA0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}