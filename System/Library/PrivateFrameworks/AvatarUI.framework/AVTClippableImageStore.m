@interface AVTClippableImageStore
- (BOOL)saveImage:(id)a3 forItem:(id)a4 scope:(id)a5 clippingRect:(CGRect)a6 error:(id *)a7;
- (CGRect)resourceClippingRectForItem:(id)a3 scope:(id)a4;
@end

@implementation AVTClippableImageStore

- (BOOL)saveImage:(id)a3 forItem:(id)a4 scope:(id)a5 clippingRect:(CGRect)a6 error:(id *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [(AVTImageStore *)self imageEncoder];
  int v19 = [v18 conformsToProtocol:&unk_26BF7F1A0];

  v20 = [(AVTImageStore *)self imageEncoder];
  v21 = v20;
  if (v19) {
    objc_msgSend(v20, "dataFromImage:clippingRect:", v17, x, y, width, height);
  }
  else {
  v22 = [v20 dataFromImage:v17];
  }

  v25.receiver = self;
  v25.super_class = (Class)AVTClippableImageStore;
  BOOL v23 = [(AVTImageStore *)&v25 saveImage:v17 withImageData:v22 forItem:v16 scope:v15 error:a7];

  return v23;
}

- (CGRect)resourceClippingRectForItem:(id)a3 scope:(id)a4
{
  CGFloat x = *MEMORY[0x263F001A8];
  CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
  CFURLRef v8 = [(AVTImageStore *)self resourceURLForItem:a3 scope:a4];
  v9 = CGImageSourceCreateWithURL(v8, 0);
  CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
  CFRelease(v9);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x263F0F248];
    CFDictionaryRef v12 = v10;
    v13 = [(__CFDictionary *)v12 objectForKey:v11];
    CFRelease(v12);

    if (v13)
    {
      v14 = [v13 objectForKey:*MEMORY[0x263F0F340]];
      CGRect v19 = CGRectFromString(v14);
      CGFloat x = v19.origin.x;
      CGFloat y = v19.origin.y;
      CGFloat width = v19.size.width;
      CGFloat height = v19.size.height;
    }
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

@end