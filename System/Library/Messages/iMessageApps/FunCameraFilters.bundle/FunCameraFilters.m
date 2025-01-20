id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_msgSend_filterPickerPresentationDelegate(void *a1, const char *a2, ...)
{
  return [a1 filterPickerPresentationDelegate];
}

id objc_msgSend_filterPickerPresentationModeDidChange(void *a1, const char *a2, ...)
{
  return [a1 filterPickerPresentationModeDidChange];
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return [a1 isExpanded];
}

id objc_msgSend_setIsExpanded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsExpanded:");
}