@interface UIBarButtonItem(AMSUIWebAppViewModel)
+ (id)barButtonItemWithWebAppViewModel:()AMSUIWebAppViewModel;
@end

@implementation UIBarButtonItem(AMSUIWebAppViewModel)

+ (id)barButtonItemWithWebAppViewModel:()AMSUIWebAppViewModel
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263F824A8];
    id v4 = a3;
    id v5 = [v3 alloc];
    v6 = [v4 _makeBarButtonItemView];
    v7 = (void *)[v5 initWithCustomView:v6];

    v8 = [v4 accessibilityLabel];

    [v7 setAccessibilityLabel:v8];
    [v7 setIsAccessibilityElement:1];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end