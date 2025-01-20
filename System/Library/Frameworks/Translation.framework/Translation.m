uint64_t start()
{
  void *v0;
  id v1;

  v1 = objc_alloc_init((Class)_LTDDaemon);
  [v1 run];

  return 0;
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}