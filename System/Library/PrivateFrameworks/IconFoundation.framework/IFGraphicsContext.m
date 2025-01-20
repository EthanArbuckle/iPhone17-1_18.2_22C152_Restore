@interface IFGraphicsContext
+ (id)bitmapContextWithSize:(CGSize)a3 scale:(double)a4 preset:(unint64_t)a5;
- (CGAffineTransform)transform;
- (CGContext)cgContext;
- (CGRect)bounds;
- (CGSize)size;
- (IFColor)fillColor;
- (IFColor)strokeColor;
- (IFGraphicsContext)initWithCGContext:(CGContext *)a3 preset:(unint64_t)a4;
- (IFImage)image;
- (NSData)data;
- (double)lineWidth;
- (double)scale;
- (id)imageFromRect:(CGRect)a3;
- (int)blendMode;
- (unint64_t)preset;
- (void)clear;
- (void)clipToMaskCGImage:(CGImage *)a3 inRect:(CGRect)a4;
- (void)dealloc;
- (void)drawCGImage:(CGImage *)a3 centeredInRect:(CGRect)a4;
- (void)drawCGImage:(CGImage *)a3 inRect:(CGRect)a4;
- (void)drawSymbolImage:(id)a3 centeredInRect:(CGRect)a4;
- (void)drawText:(id)a3 fontName:(id)a4 fontSize:(double)a5 inRect:(CGRect)a6;
- (void)fillPath:(CGPath *)a3;
- (void)fillRect:(CGRect)a3;
- (void)popState;
- (void)pushState;
- (void)setBlendMode:(int)a3;
- (void)setFillColor:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setStrokeColor:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)strokePath:(CGPath *)a3;
- (void)strokeRect:(CGRect)a3;
@end

@implementation IFGraphicsContext

+ (id)bitmapContextWithSize:(CGSize)a3 scale:(double)a4 preset:(unint64_t)a5
{
  double v7 = round(a3.width * a4);
  double v8 = round(a3.height * a4);
  if (a5 == 3)
  {
    v10 = 0;
    uint32_t v11 = 7;
LABEL_7:
    double v9 = v7;
    goto LABEL_10;
  }
  if (a5 == 2)
  {
    v10 = +[IFColor deviceGreyColorSpace];
    uint32_t v11 = 1;
    goto LABEL_7;
  }
  double v9 = v7 * 4.0;
  if (a5) {
    v10 = 0;
  }
  else {
    v10 = +[IFColor deviceRGBColorSpace];
  }
  uint32_t v11 = 1;
LABEL_10:
  CGContextRef v12 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v8, 8uLL, (unint64_t)v9, v10, v11);
  if (v12)
  {
    CGContextRef v13 = v12;
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v18.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v18.c = v14;
    *(_OWORD *)&v18.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v17.a = *(_OWORD *)&v18.a;
    *(_OWORD *)&v17.c = v14;
    *(_OWORD *)&v17.tx = *(_OWORD *)&v18.tx;
    CGAffineTransformScale(&v18, &v17, a4, a4);
    CGAffineTransform v17 = v18;
    CGContextSetCTM();
    v15 = [[IFGraphicsContext alloc] initWithCGContext:v13 preset:a5];
    CFRelease(v13);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (IFGraphicsContext)initWithCGContext:(CGContext *)a3 preset:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)IFGraphicsContext;
  v6 = [(IFGraphicsContext *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    v6->_preset = a4;
    v6->_cgContext = (CGContext *)CFRetain(a3);
  }
  return v7;
}

- (void)dealloc
{
  cgContext = self->_cgContext;
  if (cgContext) {
    CFRelease(cgContext);
  }
  v4.receiver = self;
  v4.super_class = (Class)IFGraphicsContext;
  [(IFGraphicsContext *)&v4 dealloc];
}

- (CGSize)size
{
  [(IFGraphicsContext *)self scale];
  double v4 = v3;
  double v5 = (double)CGBitmapContextGetWidth(self->_cgContext) / v3;
  double v6 = (double)CGBitmapContextGetHeight(self->_cgContext) / v4;
  double v7 = v5;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)scale
{
  memset(&v3, 0, sizeof(v3));
  CGContextGetCTM(&v3, [(IFGraphicsContext *)self cgContext]);
  return sqrt(fabs(v3.a * v3.d - v3.b * v3.c));
}

- (IFImage)image
{
  CGImageRef Image = CGBitmapContextCreateImage(self->_cgContext);
  if (Image)
  {
    CGImageRef v4 = Image;
    double v5 = [IFImage alloc];
    [(IFGraphicsContext *)self scale];
    double v6 = -[IFImage initWithCGImage:scale:](v5, "initWithCGImage:scale:", v4);
    CFRelease(v4);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)imageFromRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGImageRef Image = CGBitmapContextCreateImage(self->_cgContext);
  if (!Image) {
    goto LABEL_4;
  }
  objc_super v9 = Image;
  [(IFGraphicsContext *)self transform];
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGRect v17 = CGRectApplyAffineTransform(v16, &v14);
  CGImageRef v10 = CGImageCreateWithImageInRect(v9, v17);
  CFRelease(v9);
  if (v10)
  {
    uint32_t v11 = [IFImage alloc];
    [(IFGraphicsContext *)self scale];
    CGContextRef v12 = -[IFImage initWithCGImage:scale:](v11, "initWithCGImage:scale:", v10);
    CFRelease(v10);
  }
  else
  {
LABEL_4:
    CGContextRef v12 = 0;
  }

  return v12;
}

- (NSData)data
{
  Data = CGBitmapContextGetData(self->_cgContext);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(self->_cgContext);
  size_t v5 = CGBitmapContextGetHeight(self->_cgContext) * BytesPerRow;
  double v6 = (void *)MEMORY[0x1E4F1C9B8];

  return (NSData *)[v6 dataWithBytesNoCopy:Data length:v5 freeWhenDone:0];
}

- (IFColor)fillColor
{
  v2 = [[IFColor alloc] initWithCGColor:CGContextGetFillColorAsColor()];

  return v2;
}

- (void)setFillColor:(id)a3
{
  cgContext = self->_cgContext;
  CGImageRef v4 = (CGColor *)[a3 cgColor];

  CGContextSetFillColorWithColor(cgContext, v4);
}

- (IFColor)strokeColor
{
  v2 = [[IFColor alloc] initWithCGColor:CGContextGetStrokeColorAsColor()];

  return v2;
}

- (void)setStrokeColor:(id)a3
{
  cgContext = self->_cgContext;
  CGImageRef v4 = (CGColor *)[a3 cgColor];

  CGContextSetStrokeColorWithColor(cgContext, v4);
}

- (void)setLineWidth:(double)a3
{
}

- (double)lineWidth
{
  MEMORY[0x1F40D9FD8](self->_cgContext, a2);
  return result;
}

- (void)setBlendMode:(int)a3
{
}

- (int)blendMode
{
  return MEMORY[0x1F40D9F60](self->_cgContext, a2);
}

- (void)drawCGImage:(CGImage *)a3 inRect:(CGRect)a4
{
}

- (void)drawCGImage:(CGImage *)a3 centeredInRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [(IFGraphicsContext *)self scale];
  double v11 = v10;
  double v12 = (double)CGImageGetWidth(a3) / v10;
  double v13 = (double)CGImageGetHeight(a3) / v11;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v14 = round(CGRectGetMidX(v21) - v12 * 0.5);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v15 = round(CGRectGetMidY(v22) - v13 * 0.5);
  cgContext = self->_cgContext;
  double v17 = v14;
  double v18 = v12;
  double v19 = v13;

  CGContextDrawImage(cgContext, *(CGRect *)&v17, a3);
}

- (void)drawSymbolImage:(id)a3 centeredInRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  double v10 = (CGImage *)[v9 CGImage];
  [v9 contentBounds];
  double v12 = v11;
  double v33 = v13;
  [v9 alignmentRect];
  double v15 = v14;
  [v9 alignmentRect];
  double v17 = v16;
  [v9 baselineOffset];
  double v19 = v17 - v18;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  double v21 = v15 + MinX + CGRectGetMidX(v36) - v12 * 0.5;
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double v23 = v19 + MinY + CGRectGetMidY(v38) - v33 * 0.5;
  [v9 alignmentRect];
  uint64_t v25 = v24;
  [v9 alignmentRect];
  uint64_t v27 = v26;

  cgContext = self->_cgContext;
  double v29 = v21;
  double v30 = v23;
  uint64_t v31 = v25;
  uint64_t v32 = v27;

  CGContextDrawImage(cgContext, *(CGRect *)&v29, v10);
}

- (void)drawText:(id)a3 fontName:(id)a4 fontSize:(double)a5 inRect:(CGRect)a6
{
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v31[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  [(IFGraphicsContext *)self pushState];
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, a5, 0);
  double v13 = [(IFGraphicsContext *)self strokeColor];
  uint64_t v14 = [v13 cgColor];

  uint64_t v15 = *MEMORY[0x1E4F24740];
  v30[0] = *MEMORY[0x1E4F243F0];
  v30[1] = v15;
  v31[0] = UIFontForLanguage;
  v31[1] = v14;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  CFAttributedStringRef v17 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11 attributes:v16];
  double v18 = CTLineCreateWithAttributedString(v17);
  if (v18)
  {
    double v19 = v18;
    CGFloat descent = 0.0;
    CGFloat ascent = 0.0;
    CGFloat leading = 0.0;
    double TypographicBounds = CTLineGetTypographicBounds(v18, &ascent, &descent, &leading);
    if (TypographicBounds > 0.0)
    {
      double v21 = TypographicBounds;
      double v22 = TypographicBounds + 6.0;
      double v23 = 1.0;
      if (width > 6.0 && v22 > width)
      {
        double v22 = width + -6.0 + 6.0;
        double v23 = (width + -6.0) / v21;
        double v21 = width + -6.0;
      }
      if (v22 <= width)
      {
        CGRect ImageBounds = CTLineGetImageBounds(v19, self->_cgContext);
        CGContextTranslateCTM(self->_cgContext, x + (width - floor(v21)) * 0.5, ceil(y - ImageBounds.origin.y));
        if (v23 < 1.0) {
          CGContextScaleCTM(self->_cgContext, v23, v23);
        }
        cgContext = self->_cgContext;
        long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v26.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v26.c = v25;
        *(_OWORD *)&v26.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        CGContextSetTextMatrix(cgContext, &v26);
      }
      CGContextSetShouldAntialias(self->_cgContext, 1);
      CGContextSetShouldSmoothFonts(self->_cgContext, 0);
      CGContextSetTextDrawingMode(self->_cgContext, kCGTextFill);
      CGContextSetTextPosition(self->_cgContext, 0.0, 0.0);
      CTLineDraw(v19, self->_cgContext);
    }
    CFRelease(v19);
  }
  [(IFGraphicsContext *)self popState];
}

- (void)strokeRect:(CGRect)a3
{
}

- (void)fillRect:(CGRect)a3
{
}

- (void)strokePath:(CGPath *)a3
{
  CGContextSaveGState(self->_cgContext);
  CGContextAddPath(self->_cgContext, a3);
  CGContextStrokePath(self->_cgContext);
  cgContext = self->_cgContext;

  CGContextRestoreGState(cgContext);
}

- (void)fillPath:(CGPath *)a3
{
  CGContextSaveGState(self->_cgContext);
  CGContextAddPath(self->_cgContext, a3);
  CGContextFillPath(self->_cgContext);
  cgContext = self->_cgContext;

  CGContextRestoreGState(cgContext);
}

- (void)clear
{
}

- (CGRect)bounds
{
  return CGContextGetClipBoundingBox(self->_cgContext);
}

- (void)clipToMaskCGImage:(CGImage *)a3 inRect:(CGRect)a4
{
}

- (CGAffineTransform)transform
{
  return CGContextGetCTM(retstr, self->_cgContext);
}

- (void)setTransform:(CGAffineTransform *)a3
{
}

- (void)pushState
{
}

- (void)popState
{
}

- (CGContext)cgContext
{
  return self->_cgContext;
}

- (unint64_t)preset
{
  return self->_preset;
}

@end