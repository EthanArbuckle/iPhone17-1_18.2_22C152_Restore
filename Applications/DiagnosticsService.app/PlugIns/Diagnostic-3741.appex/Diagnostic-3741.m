void sub_100003AE8(uint64_t a1)
{
  id v1;
  uint64_t vars8;

  v1 = [*(id *)(a1 + 32) aggregator];
  [v1 beginAggregation];
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_aggregator(void *a1, const char *a2, ...)
{
  return [a1 aggregator];
}

id objc_msgSend_beginAggregation(void *a1, const char *a2, ...)
{
  return [a1 beginAggregation];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_getSynchronousResult(void *a1, const char *a2, ...)
{
  return [a1 getSynchronousResult];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return [a1 setStatusCode:];
}