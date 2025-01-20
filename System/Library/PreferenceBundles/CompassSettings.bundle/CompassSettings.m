id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_specifiersForPolicyOptions_force_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "specifiersForPolicyOptions:force:");
}