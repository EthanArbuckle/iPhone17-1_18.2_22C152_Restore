@interface HMIVideoAnnotator
- (HMIVideoAnnotator)initWithPixelBuffer:(__CVBuffer *)a3 fontSize:(double)a4;
- (__CTFont)_createFontWithSize:(double)a3;
- (void)dealloc;
- (void)draw:(id)a3;
- (void)drawBoundingBox:(CGRect)a3 lineWidth:(double)a4 text:(id)a5 color:(const double *)a6;
- (void)drawPolygonWithNormalizedPoints:(id)a3;
- (void)drawRect:(CGRect)a3 width:(double)a4 color:(const double *)a5;
- (void)drawText:(id)a3 at:(CGPoint)a4 color:(const double *)a5;
- (void)drawTextHeaderBar:(id)a3;
@end

@implementation HMIVideoAnnotator

- (HMIVideoAnnotator)initWithPixelBuffer:(__CVBuffer *)a3 fontSize:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HMIVideoAnnotator;
  v6 = [(HMIVideoAnnotator *)&v8 init];
  if (v6)
  {
    *((void *)v6 + 1) = CVPixelBufferRetain(a3);
    *((void *)v6 + 2) = 0;
    *((void *)v6 + 3) = 0;
    *((void *)v6 + 4) = [v6 _createFontWithSize:a4];
    *(_OWORD *)(v6 + 40) = *MEMORY[0x263F001B0];
  }
  return (HMIVideoAnnotator *)v6;
}

- (__CTFont)_createFontWithSize:(double)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, a3, 0);
  uint64_t v14 = *MEMORY[0x263F03A98];
  uint64_t v4 = *MEMORY[0x263F03A90];
  v11[0] = *MEMORY[0x263F03AA0];
  v11[1] = v4;
  v12[0] = &unk_26D9A92B8;
  v12[1] = &unk_26D9A92D0;
  v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v13 = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  v15[0] = v6;
  CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];

  objc_super v8 = CTFontDescriptorCreateWithAttributes(v7);
  CopyWithAttributes = CTFontCreateCopyWithAttributes(UIFontForLanguage, 0.0, 0, v8);
  CFRelease(v8);
  CFRelease(UIFontForLanguage);

  return CopyWithAttributes;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  CGContextRelease(self->_context);
  CGColorSpaceRelease(self->_colorSpace);
  CFRelease(self->_font);
  v3.receiver = self;
  v3.super_class = (Class)HMIVideoAnnotator;
  [(HMIVideoAnnotator *)&v3 dealloc];
}

- (void)draw:(id)a3
{
  v13 = (void (**)(void))a3;
  CVPixelBufferLockBaseAddress(self->_pixelBuffer, 0);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(self->_pixelBuffer, 0);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
  self->_size.size_t width = HMICVPixelBufferGetSize(self->_pixelBuffer);
  self->_size.size_t height = v6;
  if (PixelFormatType == 32)
  {
    uint32_t v7 = 2;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceGray();
    uint32_t v7 = 0;
  }
  self->_colorSpace = DeviceRGB;
  size_t width = (unint64_t)self->_size.width;
  size_t height = (unint64_t)self->_size.height;
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(self->_pixelBuffer, 0);
  v12 = CGBitmapContextCreate(BaseAddressOfPlane, width, height, 8uLL, BytesPerRowOfPlane, self->_colorSpace, v7);
  self->_context = v12;
  if (v12) {
    v13[2]();
  }
  CVPixelBufferUnlockBaseAddress(self->_pixelBuffer, 0);
  CGColorSpaceRelease(self->_colorSpace);
  CGContextRelease(self->_context);
  self->_context = 0;
  self->_colorSpace = 0;
}

- (void)drawText:(id)a3 at:(CGPoint)a4 color:(const double *)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v18[2] = *MEMORY[0x263EF8340];
  colorSpace = self->_colorSpace;
  id v10 = a3;
  v11 = CGColorCreate(colorSpace, a5);
  font = self->_font;
  uint64_t v13 = *MEMORY[0x263F03C60];
  v17[0] = *MEMORY[0x263F039A0];
  v17[1] = v13;
  v18[0] = font;
  v18[1] = v11;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  CFAttributedStringRef v15 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v10 attributes:v14];

  v16 = CTLineCreateWithAttributedString(v15);
  CGContextSetTextPosition(self->_context, x, y);
  CTLineDraw(v16, self->_context);
  CFRelease(v16);
  CGColorRelease(v11);
}

- (void)drawRect:(CGRect)a3 width:(double)a4 color:(const double *)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGContextSetLineWidth(self->_context, a4);
  if (a5)
  {
    CGFloat v11 = *a5;
    CGFloat v12 = a5[1];
    CGFloat v13 = a5[2];
    CGFloat v14 = a5[3];
  }
  else
  {
    CGFloat v11 = 1.0;
    CGFloat v12 = 1.0;
    CGFloat v13 = 1.0;
    CGFloat v14 = 1.0;
  }
  CGContextSetRGBStrokeColor(self->_context, v11, v12, v13, v14);
  context = self->_context;
  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;
  CGContextStrokeRect(context, *(CGRect *)&v16);
}

- (void)drawTextHeaderBar:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  context = self->_context;
  id v5 = a3;
  CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
  v9.size.CGFloat width = self->_size.width;
  v9.origin.CGFloat y = self->_size.height + -64.0;
  v9.size.CGFloat height = 64.0;
  v9.origin.CGFloat x = 0.0;
  CGContextFillRect(context, v9);
  CGFloat v6 = self->_size.height + -32.0 + -8.0;
  v7[0] = xmmword_225F2E100;
  v7[1] = unk_225F2E110;
  -[HMIVideoAnnotator drawText:at:color:](self, "drawText:at:color:", v5, v7, 10.0, v6);
}

- (void)drawBoundingBox:(CGRect)a3 lineWidth:(double)a4 text:(id)a5 color:(const double *)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v23 = a5;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  if (!CGRectIsNull(v25))
  {
    HMICGRectPixelFromNormalized(x, y, width, height, self->_size.width, self->_size.height);
    CGFloat v13 = v26.origin.x;
    CGFloat v14 = v26.origin.y;
    CGFloat v15 = v26.size.width;
    CGFloat v16 = v26.size.height;
    double MinX = CGRectGetMinX(v26);
    double v18 = self->_size.height;
    v27.origin.CGFloat x = v13;
    v27.origin.CGFloat y = v14;
    v27.size.CGFloat width = v15;
    v27.size.CGFloat height = v16;
    double v19 = v18 - CGRectGetMinY(v27);
    v28.origin.CGFloat x = v13;
    v28.origin.CGFloat y = v14;
    v28.size.CGFloat width = v15;
    v28.size.CGFloat height = v16;
    double v20 = CGRectGetWidth(v28);
    v29.origin.CGFloat x = v13;
    v29.origin.CGFloat y = v14;
    v29.size.CGFloat width = v15;
    v29.size.CGFloat height = v16;
    double v21 = -CGRectGetHeight(v29);
    -[HMIVideoAnnotator drawRect:width:color:](self, "drawRect:width:color:", a6, MinX, v19, v20, v21, a4);
    if ([v23 length])
    {
      v30.origin.CGFloat x = MinX;
      v30.origin.CGFloat y = v19;
      v30.size.CGFloat width = v20;
      v30.size.CGFloat height = v21;
      CGFloat v22 = CGRectGetMinX(v30) + 4.0;
      v31.origin.CGFloat x = MinX;
      v31.origin.CGFloat y = v19;
      v31.size.CGFloat width = v20;
      v31.size.CGFloat height = v21;
      -[HMIVideoAnnotator drawText:at:color:](self, "drawText:at:color:", v23, a6, v22, CGRectGetMaxY(v31) + 8.0);
    }
  }
}

- (void)drawPolygonWithNormalizedPoints:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  context = self->_context;
  *(_OWORD *)components = xmmword_225F2E100;
  long long v13 = unk_225F2E110;
  id v5 = a3;
  CGContextSetStrokeColor(context, components);
  CGContextSetLineWidth(context, 3.0);
  CGContextSaveGState(context);
  CGContextTranslateCTM(context, 0.0, self->_size.height);
  CGContextScaleCTM(context, 1.0, -1.0);
  CGContextBeginPath(context);
  CGFloat v6 = [v5 objectAtIndexedSubscript:0];
  [v6 x];
  CGFloat v8 = v7 * self->_size.width;
  CGRect v9 = [v5 objectAtIndexedSubscript:0];
  [v9 y];
  CGContextMoveToPoint(context, v8, v10 * self->_size.height);

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __53__HMIVideoAnnotator_drawPolygonWithNormalizedPoints___block_invoke;
  v11[3] = &unk_26477D598;
  v11[4] = self;
  v11[5] = context;
  objc_msgSend(v5, "na_each:", v11);

  CGContextStrokePath(context);
  CGContextRestoreGState(context);
}

void __53__HMIVideoAnnotator_drawPolygonWithNormalizedPoints___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(CGContext **)(a1 + 40);
  id v4 = a2;
  [v4 x];
  double v6 = v5 * *(double *)(*(void *)(a1 + 32) + 40);
  [v4 y];
  double v8 = v7;

  double v9 = v8 * *(double *)(*(void *)(a1 + 32) + 48);
  CGContextAddLineToPoint(v3, v6, v9);
}

@end