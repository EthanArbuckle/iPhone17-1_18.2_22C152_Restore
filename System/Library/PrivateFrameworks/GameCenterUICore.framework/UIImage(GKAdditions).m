@interface UIImage(GKAdditions)
+ (id)_gkImageWithCheckedData:()GKAdditions scale:;
+ (uint64_t)_gkImageWithCheckedData:()GKAdditions;
+ (void)_gkloadRemoteImageForURL:()GKAdditions queue:withCompletionHandler:;
- (id)_gkCropImageIntoSquare:()GKAdditions;
- (id)_gkImageByScalingToSize:()GKAdditions scale:padColor:;
- (id)_gkImageByTintingWithColor:()GKAdditions;
- (id)circularClippedImage;
- (uint64_t)_gkImageByScalingToSize:()GKAdditions;
- (uint64_t)_gkImageByScalingToSize:()GKAdditions scale:;
@end

@implementation UIImage(GKAdditions)

+ (uint64_t)_gkImageWithCheckedData:()GKAdditions
{
  return objc_msgSend(MEMORY[0x263F1C6B0], "_gkImageWithCheckedData:scale:", 1.0);
}

+ (id)_gkImageWithCheckedData:()GKAdditions scale:
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F40208], "cgImageForGamesWithData:");
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = [MEMORY[0x263F1C6B0] imageWithCGImage:v2 scale:0 orientation:a1];
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_gkImageByScalingToSize:()GKAdditions scale:padColor:
{
  id v10 = a6;
  if (a4 <= 0.0)
  {
    v11 = [MEMORY[0x263F1C920] mainScreen];
    [v11 scale];
    a4 = v12;

    if (a4 <= 0.0) {
      a4 = 1.0;
    }
  }
  double v13 = a2 * a4;
  double v14 = a3 * a4;
  v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithLength:", vcvtd_n_u64_f64(v13 * v14, 2uLL));
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  id v17 = v15;
  v18 = CGBitmapContextCreate((void *)[v17 mutableBytes], (unint64_t)v13, (unint64_t)v14, 8uLL, vcvtd_n_u64_f64(v13, 2uLL), DeviceRGB, 2u);
  CGColorSpaceRelease(DeviceRGB);
  if (v10)
  {
    CGContextSetFillColorWithColor(v18, (CGColorRef)[v10 CGColor]);
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = v13;
    v25.size.height = v14;
    CGContextFillRect(v18, v25);
    [a1 size];
    [a1 size];
  }
  id v19 = a1;
  v20 = (CGImage *)[v19 CGImage];
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.width = v13;
  v26.size.height = v14;
  CGContextDrawImage(v18, v26, v20);
  Image = CGBitmapContextCreateImage(v18);
  CGContextRelease(v18);
  v22 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:scale:orientation:", Image, objc_msgSend(v19, "imageOrientation"), a4);
  CGImageRelease(Image);

  return v22;
}

- (uint64_t)_gkImageByScalingToSize:()GKAdditions scale:
{
  return objc_msgSend(a1, "_gkImageByScalingToSize:scale:padColor:", 0);
}

- (uint64_t)_gkImageByScalingToSize:()GKAdditions
{
  [a1 scale];
  return objc_msgSend(a1, "_gkImageByScalingToSize:scale:padColor:", 0, a2, a3, v6);
}

+ (void)_gkloadRemoteImageForURL:()GKAdditions queue:withCompletionHandler:
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = _gkloadRemoteImageForURL_queue_withCompletionHandler__onceToken;
  id v10 = a4;
  if (v9 != -1) {
    dispatch_once(&_gkloadRemoteImageForURL_queue_withCompletionHandler__onceToken, &__block_literal_global_0);
  }
  v11 = (void *)MEMORY[0x263EFF8F8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__UIImage_GKAdditions___gkloadRemoteImageForURL_queue_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_264789FB0;
  id v15 = v7;
  id v16 = v8;
  id v12 = v7;
  id v13 = v8;
  [v11 _gkLoadRemoteImageDataForURL:v12 subdirectory:0 filename:0 queue:v10 handler:v14];
}

- (id)_gkImageByTintingWithColor:()GKAdditions
{
  id v4 = a3;
  [a1 size];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [a1 scale];
  CGFloat v10 = v9;
  v16.width = v6;
  v16.height = v8;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, 0.0, v8);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeNormal);
  [v4 setFill];

  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = v6;
  v17.size.height = v8;
  CGContextFillRect(CurrentContext, v17);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationIn);
  id v12 = (CGImage *)[a1 CGImage];
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = v6;
  v18.size.height = v8;
  CGContextDrawImage(CurrentContext, v18, v12);
  id v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v13;
}

- (id)_gkCropImageIntoSquare:()GKAdditions
{
  id v5 = a1;
  double Width = (double)CGImageGetWidth((CGImageRef)[v5 CGImage]);
  id v7 = v5;
  size_t Height = CGImageGetHeight((CGImageRef)[v7 CGImage]);
  if (a2 >= a3) {
    double v9 = a3;
  }
  else {
    double v9 = a2;
  }
  CGFloat v10 = floor(v9 * (Width / a2));
  CGFloat v11 = (Width - v10) * 0.5;
  CGFloat v12 = ((double)Height - v10) * 0.5;
  id v13 = v7;
  double v14 = (CGImage *)[v13 CGImage];

  v19.origin.x = v11;
  v19.origin.y = v12;
  v19.size.width = v10;
  v19.size.height = v10;
  id v15 = CGImageCreateWithImageInRect(v14, v19);
  CGSize v16 = [MEMORY[0x263F1C6B0] imageWithCGImage:v15];
  CGImageRelease(v15);
  return v16;
}

- (id)circularClippedImage
{
  id v1 = a1;
  [v1 size];
  UIGraphicsBeginImageContextWithOptions(v13, 0, 1.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  [v1 size];
  double v4 = v3;
  [v1 size];
  double v6 = v5;
  if (v4 >= v5) {
    double v7 = v5;
  }
  else {
    double v7 = v4;
  }
  double v8 = v7 * 0.5;
  CGContextBeginPath(CurrentContext);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", v4 * 0.5 - v8, v6 * 0.5 - v8, v4, v6);
  id v9 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(CurrentContext, (CGPathRef)[v9 CGPath]);
  CGContextClip(CurrentContext);
  objc_msgSend(v1, "drawInRect:", 0.0, 0.0, v4, v6);

  CGFloat v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

@end