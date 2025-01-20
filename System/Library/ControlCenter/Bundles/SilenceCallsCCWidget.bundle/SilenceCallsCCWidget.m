void sub_3B64(id a1)
{
  id v1;
  uint64_t vars8;

  v1 = objc_alloc((Class)NSUserDefaults);
  qword_8140 = (uint64_t)[v1 initWithSuiteName:TUBundleIdentifierTelephonyUtilitiesFramework];

  _objc_release_x1();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

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

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return [a1 defaults];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}