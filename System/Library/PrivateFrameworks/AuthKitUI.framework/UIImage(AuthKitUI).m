@interface UIImage(AuthKitUI)
+ (id)ak_imageNamed:()AuthKitUI;
+ (id)ak_imageWithColor:()AuthKitUI;
- (id)ak_copyScaledToSize:()AuthKitUI;
@end

@implementation UIImage(AuthKitUI)

+ (id)ak_imageNamed:()AuthKitUI
{
  v3 = (void *)MEMORY[0x1E4F42A98];
  id v4 = a3;
  v5 = [v3 configurationWithWeight:5];
  v6 = [MEMORY[0x1E4F42A80] systemImageNamed:v4 withConfiguration:v5];

  return v6;
}

+ (id)ak_imageWithColor:()AuthKitUI
{
  id v4 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v6 = DeviceRGB;
    v7 = CGBitmapContextCreate(0, 1uLL, 1uLL, 8uLL, 4uLL, DeviceRGB, 1u);
    if (v7)
    {
      v8 = v7;
      CGContextSetFillColorWithColor(v7, (CGColorRef)[v4 CGColor]);
      v14.origin.x = 0.0;
      v14.origin.y = 0.0;
      v14.size.width = 1.0;
      v14.size.height = 1.0;
      CGContextFillRect(v8, v14);
      CGImageRef Image = CGBitmapContextCreateImage(v8);
      if (Image)
      {
        v10 = Image;
        v11 = (void *)[[a1 alloc] initWithCGImage:Image];
        CGImageRelease(v10);
      }
      else
      {
        v11 = 0;
      }
      CGContextRelease(v8);
    }
    else
    {
      v11 = 0;
    }
    CGColorSpaceRelease(v6);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)ak_copyScaledToSize:()AuthKitUI
{
  v6 = [MEMORY[0x1E4F42A60] preferredFormat];
  v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 scale];
  objc_msgSend(v6, "setScale:");

  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v6, a2, a3);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__UIImage_AuthKitUI__ak_copyScaledToSize___block_invoke;
  v12[3] = &unk_1E648F650;
  *(double *)&v12[5] = a2;
  *(double *)&v12[6] = a3;
  v12[4] = a1;
  v9 = [v8 imageWithActions:v12];
  v10 = [v9 imageWithRenderingMode:2];

  return v10;
}

@end