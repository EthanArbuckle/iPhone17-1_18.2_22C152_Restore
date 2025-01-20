void sub_100002A70(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return _CGAffineTransformIsIdentity(t);
}

BOOL CGPDFDictionaryGetString(CGPDFDictionaryRef dict, const char *key, CGPDFStringRef *value)
{
  return _CGPDFDictionaryGetString(dict, key, value);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return _CGPDFDocumentGetNumberOfPages(document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return _CGPDFDocumentGetPage(document, pageNumber);
}

uint64_t CGPDFPageCopyTextString()
{
  return _CGPDFPageCopyTextString();
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return _CGPDFPageGetRotationAngle(page);
}

CFStringRef CGPDFStringCopyTextString(CGPDFStringRef string)
{
  return _CGPDFStringCopyTextString(string);
}

uint64_t CGPDFTextStringGetBBoxForIndex()
{
  return _CGPDFTextStringGetBBoxForIndex();
}

uint64_t CGPDFTextStringGetCharacterAtIndex()
{
  return _CGPDFTextStringGetCharacterAtIndex();
}

uint64_t CGPDFTextStringGetLength()
{
  return _CGPDFTextStringGetLength();
}

uint64_t CGPDFTextStringGetPositionForIndex()
{
  return _CGPDFTextStringGetPositionForIndex();
}

uint64_t CGPDFTextStringGetTransformForIndex()
{
  return _CGPDFTextStringGetTransformForIndex();
}

uint64_t CGPDFTextStringRelease()
{
  return _CGPDFTextStringRelease();
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void bzero(void *a1, size_t a2)
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t uscript_getScript()
{
  return _uscript_getScript();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_isEncrypted(void *a1, const char *a2, ...)
{
  return [a1 isEncrypted];
}

id objc_msgSend_isUnlocked(void *a1, const char *a2, ...)
{
  return [a1 isUnlocked];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_pageCount(void *a1, const char *a2, ...)
{
  return [a1 pageCount];
}

id objc_msgSend_pageText(void *a1, const char *a2, ...)
{
  return [a1 pageText];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_sync_pageAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sync_pageAtIndex:");
}