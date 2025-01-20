@interface CUINamedVectorSVGImage
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4;
- (CGSVGDocument)svgDocument;
@end

@implementation CUINamedVectorSVGImage

- (CGSVGDocument)svgDocument
{
  v2 = [(CUINamedLookup *)self _rendition];
  return [(CUIThemeRendition *)v2 svgDocument];
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (a3 == 0.0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CUINamedVectorImage.m", 126, @"Invalid parameter not satisfying: %@", @"scale" object file lineNumber description];
  }
  if (width <= 0.0 || height <= 0.0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CUINamedVectorImage.m", 127, @"Invalid parameter not satisfying: %@", @"targetSizeInPoints.width>0 && targetSizeInPoints.height>0" object file lineNumber description];
  }
  v9 = [(CUINamedLookup *)self name];
  _CUILog(3, (uint64_t)"-[CUINamedVectorImage (%@) rasterizeImageUsingScaleFactor:%f forTargetSize:%fx%f]", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  [(CUINamedVectorSVGImage *)self svgDocument];
  CGSVGDocumentGetCanvasSize();
  double v17 = v16;
  double v19 = v18;
  double v20 = floor(width * a3);
  double v21 = floor(height * a3);
  if ([(CUIRenditionKey *)[(CUINamedLookup *)self renditionKey] themeDisplayGamut]
    && CGSVGDocumentContainsWideGamutContent())
  {
    uint64_t v22 = 4097;
    unint64_t v23 = 8;
    size_t v24 = 16;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetDisplayP3();
  }
  else
  {
    uint64_t v22 = 8193;
    unint64_t v23 = 4;
    size_t v24 = 8;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  }
  v28 = CUICGBitmapContextCreate((unint64_t)v20, (unint64_t)v21, v24, (unint64_t)(v20 * (double)v23), DisplayP3, v22, v26, v27);
  if (v28)
  {
    v35 = v28;
    CGContextScaleCTM(v28, v20 / v17, v21 / v19);
    CGContextDrawSVGDocument();
    Image = CGBitmapContextCreateImage(v35);
    CFRelease(v35);
    return Image;
  }
  else
  {
    _CUILog(4, (uint64_t)"CoreUI: %s couldn't create bitmapContext for %s (%fx%f) colorSpace:'%@' [pdfsize:%fx%f scale:%f bpc:%zd bpp:%zd bitmapInfo:%zd]", v29, v30, v31, v32, v33, v34, (uint64_t)"-[CUINamedVectorSVGImage rasterizeImageUsingScaleFactor:forTargetSize:]");
    return 0;
  }
}

@end