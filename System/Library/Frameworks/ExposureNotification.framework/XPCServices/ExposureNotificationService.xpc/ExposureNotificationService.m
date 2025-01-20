uint64_t start()
{
  void *v0;

  v0 = +[ENXPCServiceListener sharedServiceListener];
  [v0 main];

  return 0;
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return [a1 main];
}

id objc_msgSend_sharedServiceListener(void *a1, const char *a2, ...)
{
  return [a1 sharedServiceListener];
}