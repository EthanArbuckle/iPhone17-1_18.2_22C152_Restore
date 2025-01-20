void sub_100003BDC(id a1)
{
  void *v1;
  char v2[56];

  strcpy(v2, "/System/Library/Frameworks/ImageIO.framework/ImageIO");
  v1 = dlopen(v2, 257);
  if (v1) {
    gFunc_OFDCreatePDFDataFromURL = (uint64_t (*)(void, void))dlsym(v1, "OFDCreatePDFDataFromURL");
  }
}

id sub_100003C68(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_typeWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeWithIdentifier:");
}