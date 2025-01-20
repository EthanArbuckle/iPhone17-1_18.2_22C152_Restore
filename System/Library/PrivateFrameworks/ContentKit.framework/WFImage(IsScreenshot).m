@interface WFImage(IsScreenshot)
+ (BOOL)imageSizeIndicatesScreenshot:()IsScreenshot;
- (uint64_t)isScreenshot;
@end

@implementation WFImage(IsScreenshot)

- (uint64_t)isScreenshot
{
  v2 = objc_opt_class();
  [a1 CGImageSize];
  return objc_msgSend(v2, "imageSizeIndicatesScreenshot:");
}

+ (BOOL)imageSizeIndicatesScreenshot:()IsScreenshot
{
  v4 = [MEMORY[0x263F85258] currentDevice];
  [v4 screenScale];
  double v6 = v5;

  v7 = [MEMORY[0x263F85258] currentDevice];
  [v7 screenBounds];
  double v9 = v8;
  double v11 = v10;

  double v12 = v6 * v11;
  if (v6 * v9 == a1 && v12 == a2) {
    return 1;
  }
  if (v12 == a1) {
    return v6 * v9 == a2;
  }
  return 0;
}

@end