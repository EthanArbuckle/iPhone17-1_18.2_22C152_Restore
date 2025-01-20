@interface CAMShutterUtilities
+ (BOOL)isStopMode:(int64_t)a3;
+ (BOOL)shouldUseImageViewForMode:(int64_t)a3;
+ (BOOL)shouldUseTimelapseOuterViewForMode:(int64_t)a3;
+ (id)spinnerAnimation;
+ (id)spinnerViewForLayoutStyle:(int64_t)a3;
@end

@implementation CAMShutterUtilities

+ (BOOL)isStopMode:(int64_t)a3
{
  return (unint64_t)(a3 - 5) < 5;
}

+ (BOOL)shouldUseImageViewForMode:(int64_t)a3
{
  return a3 == 7 || a3 == 2;
}

+ (BOOL)shouldUseTimelapseOuterViewForMode:(int64_t)a3
{
  return a3 == 8 || a3 == 3;
}

+ (id)spinnerViewForLayoutStyle:(int64_t)a3
{
  if (a3 == 4) {
    v3 = @"CAMShutterButtonSpinner-d22";
  }
  else {
    v3 = @"CAMShutterButtonSpinner";
  }
  v4 = (void *)MEMORY[0x263F827E8];
  v5 = CAMCameraUIFrameworkBundle();
  v6 = [v4 imageNamed:v3 inBundle:v5];

  v7 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v6];
  return v7;
}

+ (id)spinnerAnimation
{
  v2 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.rotation.z"];
  [v2 setFromValue:&unk_26BDDE970];
  [v2 setToValue:&unk_26BDDF4D8];
  [v2 setDuration:0.666];
  v3 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
  [v2 setTimingFunction:v3];

  LODWORD(v4) = 2139095040;
  [v2 setRepeatCount:v4];
  return v2;
}

@end