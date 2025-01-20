@interface UIViewController(DC)
+ (void)dc_enableUIViewAnimations:()DC forBlock:;
- (BOOL)dc_isViewVisible;
- (double)dc_safeAreaDistanceFromBottom;
- (double)dc_safeAreaDistanceFromTop;
- (id)dc_safeAreaLayoutGuide;
- (uint64_t)dc_isRTL;
- (void)dc_showViewController:()DC animated:sender:;
@end

@implementation UIViewController(DC)

- (uint64_t)dc_isRTL
{
  v1 = [a1 view];
  uint64_t v2 = objc_msgSend(v1, "dc_isRTL");

  return v2;
}

+ (void)dc_enableUIViewAnimations:()DC forBlock:
{
  v7 = a4;
  uint64_t v5 = [MEMORY[0x263F1CB60] areAnimationsEnabled];
  if (v5 == a3)
  {
    v7[2]();
  }
  else
  {
    uint64_t v6 = v5;
    [MEMORY[0x263F1CB60] setAnimationsEnabled:a3];
    v7[2]();
    [MEMORY[0x263F1CB60] setAnimationsEnabled:v6];
  }
}

- (void)dc_showViewController:()DC animated:sender:
{
  id v8 = a3;
  id v9 = a5;
  v10 = objc_opt_class();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__UIViewController_DC__dc_showViewController_animated_sender___block_invoke;
  v13[3] = &unk_2642A97F0;
  v13[4] = a1;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  objc_msgSend(v10, "dc_enableUIViewAnimations:forBlock:", a4, v13);
}

- (BOOL)dc_isViewVisible
{
  uint64_t v2 = [a1 viewIfLoaded];
  v3 = [v2 window];
  if (v3) {
    BOOL v4 = [a1 _appearState] != 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (double)dc_safeAreaDistanceFromTop
{
  v1 = objc_msgSend(a1, "dc_safeAreaLayoutGuide");
  [v1 layoutFrame];
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  uint64_t v10 = v3;
  uint64_t v11 = v5;
  uint64_t v12 = v7;
  uint64_t v13 = v9;

  return CGRectGetMinY(*(CGRect *)&v10);
}

- (double)dc_safeAreaDistanceFromBottom
{
  uint64_t v2 = objc_msgSend(a1, "dc_safeAreaLayoutGuide");
  [v2 layoutFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  uint64_t v11 = [a1 view];
  [v11 bounds];
  double MaxY = CGRectGetMaxY(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  double v13 = MaxY - CGRectGetMaxY(v16);

  return v13;
}

- (id)dc_safeAreaLayoutGuide
{
  v1 = [a1 view];
  uint64_t v2 = [v1 safeAreaLayoutGuide];

  return v2;
}

@end