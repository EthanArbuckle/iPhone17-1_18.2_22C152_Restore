void sub_100003AE4(id a1)
{
  void *v1;
  char v2[56];

  strcpy(v2, "/System/Library/Frameworks/ImageIO.framework/ImageIO");
  v1 = dlopen(v2, 257);
  if (v1) {
    gFunc_OFDCreatePDFDataFromURL = dlsym(v1, "OFDCreatePDFDataFromURL");
  }
}

uint64_t sub_100003B70(uint64_t a1, CGContextRef c)
{
  CGContextSaveGState(c);
  double v4 = *(double *)(a1 + 40);
  [*(id *)(a1 + 32) scale];
  CGFloat v6 = v4 * v5;
  double v7 = *(double *)(a1 + 40);
  [*(id *)(a1 + 32) scale];
  CGContextScaleCTM(c, v6, v7 * v8);
  CGContextDrawPDFPage(c, *(CGPDFPageRef *)(a1 + 48));
  CFAutorelease(*(CFTypeRef *)(a1 + 48));
  CGContextRestoreGState(c);
  return 1;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return _CGDataProviderCreateWithCFData(data);
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return _CGPDFDocumentCreateWithProvider(provider);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return _CGPDFDocumentGetPage(document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  return _CGPDFPageGetBoxRect(page, box);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_maximumSize(void *a1, const char *a2, ...)
{
  return [a1 maximumSize];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}