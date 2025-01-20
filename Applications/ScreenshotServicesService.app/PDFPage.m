@interface PDFPage
- (id)_imageWithBox:(int64_t)a3 resolution:(CGSize)a4 offset:(CGPoint)a5 wantThumbnail:(BOOL)a6;
- (id)imageWithBox:(int64_t)a3;
@end

@implementation PDFPage

- (id)imageWithBox:(int64_t)a3
{
  return -[PDFPage _imageWithBox:resolution:offset:wantThumbnail:](self, "_imageWithBox:resolution:offset:wantThumbnail:", a3, 0, 144.0, 144.0, CGPointZero.x, CGPointZero.y);
}

- (id)_imageWithBox:(int64_t)a3 resolution:(CGSize)a4 offset:(CGPoint)a5 wantThumbnail:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  double v11 = a4.width / 72.0;
  double v12 = a4.height / 72.0;
  -[PDFPage boundsForBox:](self, "boundsForBox:", 0x3FF0000000000000, 0x3FF0000000000000, 0x3FF0000000000000, unk_100075F68);
  double v16 = floor(v15 + v11 * v13) - ceil(v15);
  double v18 = floor(v17 + v12 * v14) - ceil(v17);
  NSInteger v19 = [(PDFPage *)self rotation];
  if (v19 == 180) {
    double v20 = v18;
  }
  else {
    double v20 = v16;
  }
  if (v19 == 180) {
    double v21 = v16;
  }
  else {
    double v21 = v18;
  }
  if (v19)
  {
    double v18 = v20;
    double v16 = v21;
  }
  v22 = CGColorSpaceCreateWithName(kCGColorSpaceAdobeRGB1998);
  if (v22)
  {
    v23 = v22;
    CGColorSpaceGetNumberOfComponents(v22);
    size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    v25 = CGBitmapContextCreate(0, (unint64_t)v16, (unint64_t)v18, 8uLL, AlignedBytesPerRow, v23, 0x2002u);
    if (v25)
    {
      v26 = v25;
      CGContextSetAllowsAntialiasing(v25, 1);
      CGContextSetAllowsFontSmoothing(v26, 1);
      CGContextSetAllowsFontSubpixelPositioning(v26, 1);
      CGContextSetAllowsFontSubpixelQuantization(v26, 1);
      CGContextSetFillColor(v26, (const CGFloat *)&v30);
      v32.size.width = (double)(unint64_t)v16;
      v32.size.height = (double)(unint64_t)v18;
      v32.origin.CGFloat x = 0.0;
      v32.origin.CGFloat y = 0.0;
      CGContextFillRect(v26, v32);
      CGContextTranslateCTM(v26, x, y);
      CGContextScaleCTM(v26, v11, v12);
      CGContextSetShouldAntialias(v26, 1);
      CGContextSetShouldSubpixelPositionFonts(v26, 1);
      CGContextSetShouldSubpixelQuantizeFonts(v26, 1);
      [(PDFPage *)self drawWithBox:a3 inContext:v26 isThumbnail:v6];
      CGImageRef Image = CGBitmapContextCreateImage(v26);
      CGContextRelease(v26);
    }
    else
    {
      CGImageRef Image = 0;
    }
    CGColorSpaceRelease(v23);
  }
  else
  {
    CGImageRef Image = 0;
  }
  id v28 = [objc_alloc((Class)UIImage) initWithCGImage:Image];

  return v28;
}

@end