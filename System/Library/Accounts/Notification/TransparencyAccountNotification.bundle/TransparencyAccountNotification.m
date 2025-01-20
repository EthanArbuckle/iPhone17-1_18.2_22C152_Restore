void sub_3574(id a1)
{
  uint64_t vars8;

  qword_8638 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void sub_35B8(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "aa_altDSID");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 accountChanged:v5 to:*(void *)(a1 + 40)];
}

void sub_362C(id a1, NSError *a2)
{
  v2 = a2;
  if (qword_8630 != -1) {
    dispatch_once(&qword_8630, &stru_4180);
  }
  v3 = qword_8638;
  if (os_log_type_enabled((os_log_t)qword_8638, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "account changed failed: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_36FC(id a1)
{
  qword_8638 = (uint64_t)os_log_create("com.apple.Transparency", "default");
  _objc_release_x1();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invokeAccountsSupportWithBlock_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invokeAccountsSupportWithBlock:errorHandler:");
}