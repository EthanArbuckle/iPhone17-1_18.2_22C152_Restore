id sub_2A24(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t vars8;

  v1 = qword_82C0;
  v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_82C0, &stru_4180);
  }
  v3 = +[UIImage imageNamed:v2 inBundle:qword_82B8 compatibleWithTraitCollection:0];

  return v3;
}

void sub_2AAC(id a1)
{
  qword_82B8 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id sub_2B08()
{
  if (qword_82D0 != -1) {
    dispatch_once(&qword_82D0, &stru_41A0);
  }
  v0 = (void *)qword_82C8;

  return v0;
}

void sub_2B5C(id a1)
{
  qword_82C8 = +[UIColor colorWithWhite:1.0 alpha:0.1];

  _objc_release_x1();
}

void sub_31FC(id a1)
{
  qword_82D8 = objc_opt_new();

  _objc_release_x1();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return [a1 family];
}

id objc_msgSend_formatter(void *a1, const char *a2, ...)
{
  return [a1 formatter];
}

id objc_msgSend_isRunningGraceOrLater(void *a1, const char *a2, ...)
{
  return [a1 isRunningGraceOrLater];
}

id objc_msgSend_templateWithImageProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "templateWithImageProvider:");
}