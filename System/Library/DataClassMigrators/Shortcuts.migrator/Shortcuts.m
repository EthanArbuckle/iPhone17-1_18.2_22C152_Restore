uint64_t _DMLogFunc()
{
  return __DMLogFunc();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_standardClient(void *a1, const char *a2, ...)
{
  return [a1 standardClient];
}

id objc_msgSend_userDataDisposition(void *a1, const char *a2, ...)
{
  return [a1 userDataDisposition];
}