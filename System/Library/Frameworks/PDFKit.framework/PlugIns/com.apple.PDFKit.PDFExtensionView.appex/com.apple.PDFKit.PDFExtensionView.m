void sub_100003ACC(id a1)
{
  uint64_t vars8;

  qword_100008590 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PDFExtensionProtocol];

  _objc_release_x1();
}

void sub_100003B68(id a1)
{
  qword_1000085A0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PDFHostProtocol];

  _objc_release_x1();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}