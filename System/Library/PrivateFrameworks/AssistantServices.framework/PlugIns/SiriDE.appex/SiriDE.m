uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayName:");
}