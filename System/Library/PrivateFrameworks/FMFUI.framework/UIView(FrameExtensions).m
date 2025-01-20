@interface UIView(FrameExtensions)
- (uint64_t)centerHorizontalInView:()FrameExtensions;
- (uint64_t)centerVerticalInView:()FrameExtensions;
@end

@implementation UIView(FrameExtensions)

- (uint64_t)centerHorizontalInView:()FrameExtensions
{
  id v4 = a3;
  [a1 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v4 frame];
  double v12 = v11;

  float v13 = v12 * 0.5;
  float v14 = v8 * 0.5;
  double v15 = floorf(v13 - v14);
  return objc_msgSend(a1, "setFrame:", v15, v6, v8, v10);
}

- (uint64_t)centerVerticalInView:()FrameExtensions
{
  id v4 = a3;
  [a1 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v4 frame];
  double v12 = v11;

  float v13 = v12 * 0.5;
  float v14 = v10 * 0.5;
  double v15 = floorf(v13 - v14);
  return objc_msgSend(a1, "setFrame:", v6, v15, v8, v10);
}

@end