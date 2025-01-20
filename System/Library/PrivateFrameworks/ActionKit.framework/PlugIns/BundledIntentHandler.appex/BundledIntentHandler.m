void sub_100003B44(id a1)
{
  uint64_t vars8;

  qword_100008200 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
  _objc_release_x1();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_msgSend__codableDescription(void *a1, const char *a2, ...)
{
  return [a1 _codableDescription];
}

id objc_msgSend__intentInstanceDescription(void *a1, const char *a2, ...)
{
  return [a1 _intentInstanceDescription];
}

id objc_msgSend__type(void *a1, const char *a2, ...)
{
  return [a1 _type];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_typeName(void *a1, const char *a2, ...)
{
  return [a1 typeName];
}