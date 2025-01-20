@interface PNGRenderer
- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4;
- (CGImage)cgimage;
- (PNGRenderer)init;
- (void)dealloc;
- (void)flushRender;
- (void)setFileURL:(id)a3;
@end

@implementation PNGRenderer

- (PNGRenderer)init
{
  v4.receiver = self;
  v4.super_class = (Class)PNGRenderer;
  v2 = [(CGRenderer *)&v4 init];
  if (v2)
  {
    v2->background = CGColorCreateWithHex(0xFFFFFFFFuLL);
    v2->colorSpace = CGColorSpaceCreateDeviceRGB();
  }
  return v2;
}

- (void)dealloc
{
  CGColorRelease(self->background);
  CGColorSpaceRelease(self->colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PNGRenderer;
  [(CGRenderer *)&v3 dealloc];
}

- (void)setFileURL:(id)a3
{
  self->fullURL = (__CFURL *)[a3 URLByAppendingPathExtension:@"png"];
}

- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4
{
  context = self->super.context;
  if (context) {
    CGContextRelease(context);
  }
  double v8 = (double)a3 + 40.0 + (double)a3 + 40.0;
  v9 = CGBitmapContextCreate(0, (unint64_t)v8, (unint64_t)((double)a4 + 40.0 + (double)a4 + 40.0), 8uLL, vcvtd_n_u64_f64(v8, 2uLL), self->colorSpace, 0x2002u);
  self->super.context = v9;
  if (v9)
  {
    CGContextSetFillColorWithColor(v9, self->background);
    CGContextSetAlpha(self->super.context, 1.0);
    v11.origin.x = 0.0;
    v11.origin.y = 0.0;
    v11.size.width = (double)a3 + 40.0 + (double)a3 + 40.0;
    v11.size.height = (double)a4 + 40.0 + (double)a4 + 40.0;
    CGContextFillRect(self->super.context, v11);
    v9 = self->super.context;
  }
  CGContextScaleCTM(v9, 2.0, 2.0);
  CGContextTranslateCTM(self->super.context, 20.0, 20.0);
  return self->super.context != 0;
}

- (void)flushRender
{
  CGImageDestinationRef v3 = CGImageDestinationCreateWithURL(self->fullURL, @"public.png", 1uLL, 0);
  if (v3)
  {
    objc_super v4 = v3;
    v5 = [(PNGRenderer *)self cgimage];
    CGImageDestinationAddImage(v4, v5, 0);
    CGImageDestinationFinalize(v4);
    CFRelease(v4);
    CGImageRelease(v5);
  }
}

- (CGImage)cgimage
{
  result = self->super.context;
  if (result) {
    return CGBitmapContextCreateImage(result);
  }
  return result;
}

@end