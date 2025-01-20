@interface UIScreen(SwiftUITesting_Swizzles)
+ (void)_performSwiftUITestingOverrides;
- (double)_SwiftUITesting_currentScreenScale;
- (uint64_t)_SwiftUITesting_wantsWideContentMargins;
@end

@implementation UIScreen(SwiftUITesting_Swizzles)

+ (void)_performSwiftUITestingOverrides
{
  v0 = (objc_class *)objc_opt_class();
  _SwizzleMethods(v0, sel_scale, sel__SwiftUITesting_currentScreenScale);
  v1 = (objc_class *)objc_opt_class();

  _SwizzleMethods(v1, sel__wantsWideContentMargins, sel__SwiftUITesting_wantsWideContentMargins);
}

- (double)_SwiftUITesting_currentScreenScale
{
  return 2.0;
}

- (uint64_t)_SwiftUITesting_wantsWideContentMargins
{
  return 0;
}

@end