id sub_10000357C(uint64_t a1)
{
  id v1;
  uint64_t vars8;

  v1 = [objc_alloc((Class)PDFDocument) initWithURL:*(void *)(a1 + 32)];

  return v1;
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

int close(int a1)
{
  return _close(a1);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_typeWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeWithIdentifier:");
}