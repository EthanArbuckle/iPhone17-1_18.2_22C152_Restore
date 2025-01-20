uint64_t sub_38D4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_msgSend__gkAuthenticatedPlayerID(void *a1, const char *a2, ...)
{
  return [a1 _gkAuthenticatedPlayerID];
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return [a1 accountName];
}

id objc_msgSend_authenticatedCredential(void *a1, const char *a2, ...)
{
  return [a1 authenticatedCredential];
}

id objc_msgSend_authenticationToken(void *a1, const char *a2, ...)
{
  return [a1 authenticationToken];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_daemonProxy(void *a1, const char *a2, ...)
{
  return [a1 daemonProxy];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_playerID(void *a1, const char *a2, ...)
{
  return [a1 playerID];
}

id objc_msgSend_udid(void *a1, const char *a2, ...)
{
  return [a1 udid];
}