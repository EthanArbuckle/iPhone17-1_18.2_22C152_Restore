@interface UIImage(AMSUICommonImage)
+ (uint64_t)ams_imageWithSystemSymbolName:()AMSUICommonImage;
+ (uint64_t)ams_systemChevronLeft;
+ (uint64_t)ams_systemChevronRight;
- (id)ams_imageCroppedTo:()AMSUICommonImage;
- (id)ams_imageWithRenderingMode:()AMSUICommonImage;
- (uint64_t)ams_aspectRatio;
- (uint64_t)ams_imageScaledTo:()AMSUICommonImage;
@end

@implementation UIImage(AMSUICommonImage)

- (uint64_t)ams_aspectRatio
{
  uint64_t result = [a1 size];
  if (v3 != 0.0)
  {
    objc_msgSend(a1, "size", -1.0);
    return [a1 size];
  }
  return result;
}

- (id)ams_imageCroppedTo:()AMSUICommonImage
{
  CGFloat v10 = *MEMORY[0x263F00148];
  CGFloat v11 = *(double *)(MEMORY[0x263F00148] + 8);
  [a1 size];
  v27.size.width = v12;
  v27.size.height = v13;
  v25.origin.x = a2;
  v25.origin.y = a3;
  v25.size.width = a4;
  v25.size.height = a5;
  v27.origin.x = v10;
  v27.origin.y = v11;
  if (CGRectEqualToRect(v25, v27))
  {
    id v14 = a1;
  }
  else
  {
    [a1 scale];
    CGFloat v16 = a2 * v15;
    CGFloat v17 = a3 * v15;
    CGFloat v18 = a4 * v15;
    CGFloat v19 = a5 * v15;
    v20 = (CGImage *)[a1 CGImage];
    v26.origin.x = v16;
    v26.origin.y = v17;
    v26.size.width = v18;
    v26.size.height = v19;
    CGImageRef v21 = CGImageCreateWithImageInRect(v20, v26);
    if (v21)
    {
      v22 = v21;
      id v14 = (id)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:v21];
      CGImageRelease(v22);
    }
    else
    {
      id v14 = 0;
    }
  }
  return v14;
}

- (uint64_t)ams_imageScaledTo:()AMSUICommonImage
{
  double v3 = (void *)MEMORY[0x263F827E8];
  uint64_t v4 = [a1 CGImage];
  return [v3 imageWithCGImage:v4 scale:0 orientation:a2];
}

- (id)ams_imageWithRenderingMode:()AMSUICommonImage
{
  if ([a1 isSymbolImage])
  {
    id v5 = a1;
  }
  else
  {
    id v5 = [a1 imageWithRenderingMode:a3];
  }
  return v5;
}

+ (uint64_t)ams_imageWithSystemSymbolName:()AMSUICommonImage
{
  return objc_msgSend(MEMORY[0x263F827E8], "_systemImageNamed:");
}

+ (uint64_t)ams_systemChevronLeft
{
  return objc_msgSend(a1, "ams_imageWithSystemSymbolName:", @"chevron.left");
}

+ (uint64_t)ams_systemChevronRight
{
  return objc_msgSend(a1, "ams_imageWithSystemSymbolName:", @"chevron.right");
}

@end