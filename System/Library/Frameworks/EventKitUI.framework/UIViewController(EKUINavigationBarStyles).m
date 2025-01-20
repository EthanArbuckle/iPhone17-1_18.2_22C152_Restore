@interface UIViewController(EKUINavigationBarStyles)
- (uint64_t)ekui_adjustNavAndToolBarToTranslucentGrayStyles;
- (uint64_t)ekui_adjustNavAndToolBarToTransparentStyles;
- (void)ekui_adjustNavBarToTranslucentGrayStyle;
- (void)ekui_adjustNavBarToTransparentStyle;
- (void)ekui_adjustToolBarToTranslucentGrayStyle;
- (void)ekui_adjustToolBarToTransparentStyle;
@end

@implementation UIViewController(EKUINavigationBarStyles)

- (uint64_t)ekui_adjustNavAndToolBarToTranslucentGrayStyles
{
  objc_msgSend(a1, "ekui_adjustNavBarToTranslucentGrayStyle");

  return objc_msgSend(a1, "ekui_adjustToolBarToTranslucentGrayStyle");
}

- (void)ekui_adjustNavBarToTranslucentGrayStyle
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  v2 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setShadowColor:v2];

  v3 = [a1 navigationItem];
  [v3 setScrollEdgeAppearance:v4];
}

- (void)ekui_adjustToolBarToTranslucentGrayStyle
{
  v1 = [a1 navigationController];
  id v4 = [v1 toolbar];

  v2 = [v4 standardAppearance];
  v3 = [MEMORY[0x1E4FB1618] separatorColor];
  [v2 setShadowColor:v3];

  [v4 setScrollEdgeAppearance:v2];
}

- (uint64_t)ekui_adjustNavAndToolBarToTransparentStyles
{
  objc_msgSend(a1, "ekui_adjustNavBarToTransparentStyle");

  return objc_msgSend(a1, "ekui_adjustToolBarToTransparentStyle");
}

- (void)ekui_adjustNavBarToTransparentStyle
{
  id v8 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v8 configureWithOpaqueBackground];
  v2 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v8 setBackgroundColor:v2];

  v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v8 setShadowColor:v3];

  id v4 = [a1 navigationItem];
  [v4 setScrollEdgeAppearance:v8];

  id v5 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  v6 = [MEMORY[0x1E4FB1618] separatorColor];
  [v5 setShadowColor:v6];

  v7 = [a1 navigationItem];
  [v7 setStandardAppearance:v5];
}

- (void)ekui_adjustToolBarToTransparentStyle
{
  v1 = [a1 navigationController];
  id v4 = [v1 toolbar];

  v2 = [v4 scrollEdgeAppearance];
  [v2 configureWithOpaqueBackground];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v2 setBackgroundColor:v3];

  [v2 setShadowColor:0];
  [v4 setScrollEdgeAppearance:v2];
}

@end