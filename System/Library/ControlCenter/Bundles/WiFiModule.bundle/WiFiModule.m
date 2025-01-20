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

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_contentModuleContext(void *a1, const char *a2, ...)
{
  return [a1 contentModuleContext];
}

id objc_msgSend_initWithContentModuleContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentModuleContext:");
}