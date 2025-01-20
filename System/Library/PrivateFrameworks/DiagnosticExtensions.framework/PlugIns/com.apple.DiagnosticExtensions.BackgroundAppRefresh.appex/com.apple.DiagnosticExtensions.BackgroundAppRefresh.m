uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_msgSend_attachmentWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachmentWithPath:");
}