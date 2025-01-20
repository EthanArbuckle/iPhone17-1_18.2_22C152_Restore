@interface IFPDFPage
- (CGPDFPage)pdfPage;
- (IFPDFPage)initWithCGPDFPage:(CGPDFPage *)a3;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
- (void)dealloc;
- (void)setPdfPage:(CGPDFPage *)a3;
@end

@implementation IFPDFPage

- (IFPDFPage)initWithCGPDFPage:(CGPDFPage *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IFPDFPage;
  v4 = [(IFPDFPage *)&v7 init];
  v5 = v4;
  if (a3 && v4)
  {
    CFRetain(a3);
    v5->_pdfPage = a3;
  }
  return v5;
}

- (void)dealloc
{
  pdfPage = self->_pdfPage;
  if (pdfPage) {
    CFRelease(pdfPage);
  }
  v4.receiver = self;
  v4.super_class = (Class)IFPDFPage;
  [(IFPDFPage *)&v4 dealloc];
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  if (self->_pdfPage)
  {
    double height = a3.height;
    double width = a3.width;
    size_t v8 = (unint64_t)(a3.width * a4);
    size_t v9 = (unint64_t)(a3.height * a4);
    v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    v11 = CGBitmapContextCreate(0, v8, v9, 8uLL, 4 * v8, v10, 2u);
    CGContextScaleCTM(v11, a4, a4);
    v25.origin.double x = 0.0;
    v25.origin.double y = 0.0;
    v25.size.double width = width;
    v25.size.double height = height;
    CGContextClearRect(v11, v25);
    CGRect BoxRect = CGPDFPageGetBoxRect(self->_pdfPage, kCGPDFCropBox);
    double x = BoxRect.origin.x;
    double y = BoxRect.origin.y;
    if (BoxRect.size.width <= BoxRect.size.height) {
      double v14 = BoxRect.size.height;
    }
    else {
      double v14 = BoxRect.size.width;
    }
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v23.c = v15;
    *(_OWORD *)&v23.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&transform.a = *(_OWORD *)&v23.a;
    *(_OWORD *)&transform.c = v15;
    *(_OWORD *)&transform.tdouble x = *(_OWORD *)&v23.tx;
    CGAffineTransformScale(&v23, &transform, 1024.0 / v14, 1024.0 / v14);
    if (width <= height) {
      double v16 = height;
    }
    else {
      double v16 = width;
    }
    CGAffineTransform v21 = v23;
    CGAffineTransformScale(&transform, &v21, v16 * 0.0009765625, v16 * 0.0009765625);
    CGAffineTransform v23 = transform;
    CGAffineTransform v21 = transform;
    CGAffineTransformTranslate(&transform, &v21, -x, -y);
    CGAffineTransform v23 = transform;
    CGContextSaveGState(v11);
    CGAffineTransform transform = v23;
    CGContextConcatCTM(v11, &transform);
    CGRect v27 = CGPDFPageGetBoxRect(self->_pdfPage, kCGPDFArtBox);
    CGContextClipToRect(v11, v27);
    CGContextDrawPDFPage(v11, self->_pdfPage);
    CGContextRestoreGState(v11);
    CGContextFlush(v11);
    CGImageRef Image = CGBitmapContextCreateImage(v11);
    if (Image)
    {
      CGImageRef v18 = Image;
      v19 = [[IFImage alloc] initWithCGImage:Image scale:a4];
      CFRelease(v18);
    }
    else
    {
      v19 = 0;
    }
    CGContextRelease(v11);
    CGColorSpaceRelease(v10);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (CGPDFPage)pdfPage
{
  return self->_pdfPage;
}

- (void)setPdfPage:(CGPDFPage *)a3
{
  self->_pdfPage = a3;
}

@end