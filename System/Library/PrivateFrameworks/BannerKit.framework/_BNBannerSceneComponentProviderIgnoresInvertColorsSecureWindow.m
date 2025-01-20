@interface _BNBannerSceneComponentProviderIgnoresInvertColorsSecureWindow
- (BOOL)_accessibilityInvertColorsIsDarkWindow;
- (void)accessibilityApplyInvertFilter;
@end

@implementation _BNBannerSceneComponentProviderIgnoresInvertColorsSecureWindow

- (BOOL)_accessibilityInvertColorsIsDarkWindow
{
  return 0;
}

- (void)accessibilityApplyInvertFilter
{
  if (([(_BNBannerSceneComponentProviderIgnoresInvertColorsSecureWindow *)self accessibilityIgnoresInvertColors] & 1) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)_BNBannerSceneComponentProviderIgnoresInvertColorsSecureWindow;
    [(_BNBannerSceneComponentProviderIgnoresInvertColorsSecureWindow *)&v3 accessibilityApplyInvertFilter];
  }
}

@end