@interface AVTStickerImageEncoder
- (id)dataFromImage:(id)a3;
- (id)dataFromImage:(id)a3 clippingRect:(CGRect)a4;
- (id)fileExtension;
- (id)imageFromData:(id)a3 error:(id *)a4;
- (id)imageFromURL:(id)a3 error:(id *)a4;
@end

@implementation AVTStickerImageEncoder

- (id)imageFromURL:(id)a3 error:(id *)a4
{
  v6 = (objc_class *)MEMORY[0x263EFF8F8];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithContentsOfURL:v7 options:1 error:a4];

  if (v8)
  {
    v9 = [(AVTStickerImageEncoder *)self imageFromData:v8 error:a4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)imageFromData:(id)a3 error:(id *)a4
{
  uint64_t v5 = [MEMORY[0x263F1C6B0] imageWithData:a3];
  v6 = (void *)v5;
  if (a4 && !v5)
  {
    *a4 = [MEMORY[0x263F29748] errorWithCode:604 userInfo:0];
  }
  return v6;
}

- (id)dataFromImage:(id)a3
{
  return UIImagePNGRepresentation((UIImage *)a3);
}

- (id)dataFromImage:(id)a3 clippingRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v27[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  DataProvider = CGImageGetDataProvider((CGImageRef)[v8 CGImage]);
  CGImageSourceRef v10 = CGImageSourceCreateWithDataProvider(DataProvider, 0);
  [v8 scale];
  double v12 = v11 * 72.0;
  v26[0] = *MEMORY[0x263F0F1A0];
  v13 = [NSNumber numberWithDouble:v11 * 72.0];
  v27[0] = v13;
  v26[1] = *MEMORY[0x263F0F198];
  v14 = [NSNumber numberWithDouble:v12];
  v27[1] = v14;
  v26[2] = *MEMORY[0x263F0F248];
  uint64_t v24 = *MEMORY[0x263F0F340];
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  v15 = NSStringFromCGRect(v29);
  v25 = v15;
  v16 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v27[2] = v16;
  CFDictionaryRef v17 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

  Mutable = CFDataCreateMutable(0, 0);
  v19 = [(id)*MEMORY[0x263F1DC08] identifier];
  v20 = CGImageDestinationCreateWithData(Mutable, v19, 1uLL, 0);

  id v21 = v8;
  v22 = (CGImage *)[v21 CGImage];

  CGImageDestinationAddImage(v20, v22, v17);
  CGImageDestinationFinalize(v20);
  if (v20) {
    CFRelease(v20);
  }
  if (v10) {
    CFRelease(v10);
  }

  return Mutable;
}

- (id)fileExtension
{
  return (id)[(id)*MEMORY[0x263F1DC08] preferredFilenameExtension];
}

@end