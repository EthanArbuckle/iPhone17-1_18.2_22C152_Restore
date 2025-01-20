id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_cellularSetupViewController(void *a1, const char *a2, ...)
{
  return [a1 cellularSetupViewController];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_setMiniFlowDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMiniFlowDelegate:");
}