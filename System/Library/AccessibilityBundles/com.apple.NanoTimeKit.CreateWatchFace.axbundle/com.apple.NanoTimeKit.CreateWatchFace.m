uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
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

id objc_msgSend__selected(void *a1, const char *a2, ...)
{
  return [a1 _selected];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_validateClass_hasInstanceMethod_withFullSignature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateClass:hasInstanceMethod:withFullSignature:");
}