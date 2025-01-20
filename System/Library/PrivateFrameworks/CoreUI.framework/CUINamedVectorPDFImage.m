@interface CUINamedVectorPDFImage
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4;
- (CGPDFDocument)pdfDocument;
@end

@implementation CUINamedVectorPDFImage

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (a3 == 0.0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CUINamedVectorImage.m", 62, @"Invalid parameter not satisfying: %@", @"scale" object file lineNumber description];
  }
  if (width <= 0.0 || height <= 0.0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CUINamedVectorImage.m", 63, @"Invalid parameter not satisfying: %@", @"targetSizeInPoints.width>0 && targetSizeInPoints.height>0" object file lineNumber description];
  }
  Page = CGPDFDocumentGetPage([(CUINamedVectorPDFImage *)self pdfDocument], 1uLL);
  CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
  double v10 = BoxRect.size.width;
  double v11 = BoxRect.size.height;
  double v12 = width * a3;
  double v13 = height * a3;
  if ([(CUIRenditionKey *)[(CUINamedLookup *)self renditionKey] themeDisplayGamut]&& CGPDFPageContainsWideGamutContent())
  {
    uint64_t v14 = 4097;
    unint64_t v15 = 8;
    size_t v16 = 16;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetDisplayP3();
  }
  else
  {
    uint64_t v14 = 8193;
    unint64_t v15 = 4;
    size_t v16 = 8;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  }
  CGContextRef v20 = CUICGBitmapContextCreate((unint64_t)v12, (unint64_t)v13, v16, (unint64_t)(v12 * (double)v15), DisplayP3, v14, v18, v19);
  if (v20)
  {
    v27 = v20;
    v32.origin.x = 0.0;
    v32.origin.y = 0.0;
    v32.size.double width = v10;
    v32.size.double height = v11;
    CGPDFPageGetDrawingTransform(&transform, Page, kCGPDFCropBox, v32, 0, 1);
    CGContextConcatCTM(v27, &transform);
    CGContextScaleCTM(v27, v12 / v10, v13 / v11);
    CGContextDrawPDFPage(v27, Page);
    Image = CGBitmapContextCreateImage(v27);
    CFRelease(v27);
  }
  else
  {
    _CUILog(4, (uint64_t)"CoreUI: %s couldn't create bitmapContext for (%fx%f) colorSpace:'%@' [pdfsize:%fx%f scale:%f bpc:%zd bpp:%zd bitmapInfo:%d]", v21, v22, v23, v24, v25, v26, (uint64_t)"-[CUINamedVectorPDFImage rasterizeImageUsingScaleFactor:forTargetSize:]");
    return 0;
  }
  return Image;
}

- (CGPDFDocument)pdfDocument
{
  v2 = [(CUINamedLookup *)self _rendition];
  return [(CUIThemeRendition *)v2 pdfDocument];
}

@end