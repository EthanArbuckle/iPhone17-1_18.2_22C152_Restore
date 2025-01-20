uint64_t sub_100003C70(uint64_t a1, CGContextRef context)
{
  size_t Width;
  size_t Height;
  double v6;
  double v7;

  Width = CGBitmapContextGetWidth(context);
  Height = CGBitmapContextGetHeight(context);
  v6 = *(double *)(a1 + 40);
  v7 = (double)Width / *(double *)(a1 + 32);
  if (v7 >= (double)Height / v6) {
    v7 = (double)Height / v6;
  }
  CGContextScaleCTM(context, v7, v7);
  CGContextDrawSVGDocument();
  CFRelease(*(CFTypeRef *)(a1 + 48));
  return 1;
}

void CFRelease(CFTypeRef cf)
{
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return _CGBitmapContextGetHeight(context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return _CGBitmapContextGetWidth(context);
}

uint64_t CGContextDrawSVGDocument()
{
  return _CGContextDrawSVGDocument();
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t CGSVGDocumentCreateFromURL()
{
  return _CGSVGDocumentCreateFromURL();
}

uint64_t CGSVGDocumentGetCanvasSize()
{
  return _CGSVGDocumentGetCanvasSize();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_msgSend_replyWithContextSize_drawingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replyWithContextSize:drawingBlock:");
}