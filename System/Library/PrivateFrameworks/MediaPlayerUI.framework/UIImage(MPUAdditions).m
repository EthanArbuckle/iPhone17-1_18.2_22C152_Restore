@interface UIImage(MPUAdditions)
+ (id)imageWithSize:()MPUAdditions opaque:fromBlock:;
- (id)scaledImageWithSize:()MPUAdditions;
@end

@implementation UIImage(MPUAdditions)

+ (id)imageWithSize:()MPUAdditions opaque:fromBlock:
{
  if (a6)
  {
    v9 = a6;
    v13.width = a1;
    v13.height = a2;
    UIGraphicsBeginImageContextWithOptions(v13, a5, 0.0);
    v9[2](v9);

    v10 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)scaledImageWithSize:()MPUAdditions
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__UIImage_MPUAdditions__scaledImageWithSize___block_invoke;
  v5[3] = &unk_2647C26B0;
  v5[4] = a1;
  *(double *)&v5[5] = a2;
  *(double *)&v5[6] = a3;
  v3 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithSize:opaque:fromBlock:", 0, v5);
  return v3;
}

@end