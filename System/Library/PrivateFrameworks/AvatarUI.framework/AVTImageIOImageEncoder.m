@interface AVTImageIOImageEncoder
+ (id)addImageOptions;
+ (id)typeIdentifier;
- (id)dataFromImage:(id)a3;
- (id)fileExtension;
- (id)imageFromData:(id)a3 error:(id *)a4;
- (id)imageFromImageSource:(CGImageSource *)a3 error:(id *)a4;
- (id)imageFromURL:(id)a3 error:(id *)a4;
@end

@implementation AVTImageIOImageEncoder

- (id)imageFromImageSource:(CGImageSource *)a3 error:(id *)a4
{
  if (!a3)
  {
    v7 = 0;
    goto LABEL_9;
  }
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
  if (ImageAtIndex)
  {
    CGImageRef v6 = ImageAtIndex;
    v7 = [MEMORY[0x263F1C6B0] imageWithCGImage:ImageAtIndex];
    CFRelease(v6);
    if (!a4) {
      goto LABEL_9;
    }
  }
  else
  {
    v7 = 0;
    if (!a4) {
      goto LABEL_9;
    }
  }
  if (!v7)
  {
    *a4 = [MEMORY[0x263F29748] errorWithCode:604 userInfo:0];
  }
LABEL_9:
  return v7;
}

- (id)imageFromURL:(id)a3 error:(id *)a4
{
  CGImageSourceRef v6 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v6)
  {
    CGImageSourceRef v7 = v6;
    v8 = [(AVTImageIOImageEncoder *)self imageFromImageSource:v6 error:a4];
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)imageFromData:(id)a3 error:(id *)a4
{
  CGImageSourceRef v6 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (v6)
  {
    CGImageSourceRef v7 = v6;
    v8 = [(AVTImageIOImageEncoder *)self imageFromImageSource:v6 error:a4];
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)dataFromImage:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF990];
  id v4 = a3;
  v5 = [v3 data];
  CGImageSourceRef v6 = [(id)objc_opt_class() typeIdentifier];
  CGImageSourceRef v7 = CGImageDestinationCreateWithData(v5, v6, 1uLL, 0);
  CFDictionaryRef v8 = [(id)objc_opt_class() addImageOptions];
  id v9 = v4;
  v10 = (CGImage *)[v9 CGImage];

  CGImageDestinationAddImage(v7, v10, v8);
  CGImageDestinationFinalize(v7);
  if (v7) {
    CFRelease(v7);
  }
  v11 = (void *)[(__CFData *)v5 copy];

  return v11;
}

+ (id)typeIdentifier
{
  return &stru_26BF058D0;
}

+ (id)addImageOptions
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)fileExtension
{
  return &stru_26BF058D0;
}

@end