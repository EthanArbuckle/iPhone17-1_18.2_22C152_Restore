intptr_t sub_3D54(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_msgSend_removeObsoleteAccountsFromStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObsoleteAccountsFromStore:");
}