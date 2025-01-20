@interface _CUIThemePDFRendition
- (CGImage)createImageFromPDFRenditionWithScale:(double)a3;
- (CGPDFDocument)pdfDocument;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)metrics;
- (int)pixelFormat;
- (void)dealloc;
@end

@implementation _CUIThemePDFRendition

- (int)pixelFormat
{
  return 1346651680;
}

- (CGPDFDocument)pdfDocument
{
  return self->_pdfDocument;
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v23.receiver = self;
  v23.super_class = (Class)_CUIThemePDFRendition;
  v6 = [(CUIThemeRendition *)&v23 _initWithCSIHeader:a3 version:*(void *)&a4];
  if (a3->var6 != 1346651680)
  {
    v17 = +[NSAssertionHandler currentHandler];
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"_CUIThemePDFRendition.m", 43, @"CoreUI: -[%@ %@] pixel format must be kCSIPixelFormatPDF", v19, NSStringFromSelector(a2));
  }
  v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
  v8 = v7 + 180;
  if (*((_DWORD *)v7 + 46))
  {
    v20 = +[NSAssertionHandler currentHandler];
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"_CUIThemePDFRendition.m", 46, @"CoreUI:-[%@ %@]  data shouldn't be compressed here", v22, NSStringFromSelector(a2));
  }
  unsigned int v9 = *((_DWORD *)v8 + 2);
  unsigned int v10 = bswap32(v9);
  if (*(_DWORD *)v8 == 1146569042) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v9;
  }
  v12 = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", [v6 srcData], v8 - (unsigned char *)objc_msgSend(objc_msgSend(v6, "srcData"), "bytes") + 12, v11);
  if (v12)
  {
    v13 = v12;
    v14 = CGDataProviderCreateWithCFData((CFDataRef)v12);
    if (v14)
    {
      v15 = v14;
      v6[27] = CGPDFDocumentCreateWithProvider(v14);
      CGDataProviderRelease(v15);
    }
  }
  return v6;
}

- (void)dealloc
{
  CGPDFDocumentRelease(self->_pdfDocument);
  v3.receiver = self;
  v3.super_class = (Class)_CUIThemePDFRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

- (id)metrics
{
  return 0;
}

- (CGImage)createImageFromPDFRenditionWithScale:(double)a3
{
  v5 = [(_CUIThemePDFRendition *)self pdfDocument];
  if (!v5) {
    return 0;
  }
  Page = CGPDFDocumentGetPage(v5, 1uLL);
  v7 = CGPDFPageRetain(Page);
  Image = v7;
  if (v7)
  {
    CGRect BoxRect = CGPDFPageGetBoxRect(v7, kCGPDFCropBox);
    double width = BoxRect.size.width;
    double height = BoxRect.size.height;
    [(CUIThemeRendition *)self scale];
    if (v11 < 1.0) {
      double v11 = 1.0;
    }
    size_t v12 = vcvtad_u64_f64(width * a3 / v11);
    size_t v13 = vcvtad_u64_f64(height * a3 / v11);
    SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
    CGContextRef v17 = CUICGBitmapContextCreate(v12, v13, 8uLL, 4 * (v12 & 0x7FFFFFFFFFFFFFFLL), SRGB, 8194, v15, v16);
    if (v17)
    {
      v24 = v17;
      v28.origin.x = 0.0;
      v28.origin.y = 0.0;
      v28.size.double width = width;
      v28.size.double height = height;
      CGPDFPageGetDrawingTransform(&transform, Image, kCGPDFCropBox, v28, 0, 1);
      CGContextConcatCTM(v24, &transform);
      CGContextScaleCTM(v24, a3, a3);
      CGContextDrawPDFPage(v24, Image);
      CGPDFPageRelease(Image);
      Image = CGBitmapContextCreateImage(v24);
      CGContextRelease(v24);
      return Image;
    }
    _CUILog(4, (uint64_t)"%s %d couldn't create bitmapcontext size:[%zu %zu] bpr %zu", v18, v19, v20, v21, v22, v23, (uint64_t)"-[_CUIThemePDFRendition createImageFromPDFRenditionWithScale:]");
    CGPDFPageRelease(Image);
    return 0;
  }
  return Image;
}

@end