@interface UITransitionViewAccessibility__MusicUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_foundNowPlayingViewControllerForIPad;
- (BOOL)accessibilityViewIsModal;
@end

@implementation UITransitionViewAccessibility__MusicUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITransitionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITransitionView", @"delegate", "@", 0);
  [v3 validateClass:@"_UISearchPresentationController" isKindOfClass:@"UIPresentationController"];
  [v3 validateClass:@"_UIFormSheetPresentationController" isKindOfClass:@"UIPresentationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPresentationController", @"presentedViewController", "@", 0);
  [v3 validateClass:@"Music.NowPlayingViewController" isKindOfClass:@"UIViewController"];
}

- (BOOL)accessibilityViewIsModal
{
  id v3 = [(UITransitionViewAccessibility__MusicUI__UIKit *)self safeValueForKey:@"delegate"];
  MEMORY[0x245658030](@"_UIFormSheetPresentationController");
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 safeValueForKey:@"presentedViewController"],
        v4 = objc_claimAutoreleasedReturnValue(),
        MEMORY[0x245658030](@"Music.NowPlayingViewController"),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0)
    || !v3
    && [(UITransitionViewAccessibility__MusicUI__UIKit *)self _foundNowPlayingViewControllerForIPad])
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITransitionViewAccessibility__MusicUI__UIKit;
    BOOL v6 = [(UITransitionViewAccessibility__MusicUI__UIKit *)&v8 accessibilityViewIsModal];
  }

  return v6;
}

- (BOOL)_foundNowPlayingViewControllerForIPad
{
  if (AXDeviceIsPad())
  {
    id v3 = [(UITransitionViewAccessibility__MusicUI__UIKit *)self _accessibilityFindSubviewDescendant:&__block_literal_global_3];
    v4 = v3;
    if (v3)
    {
      v5 = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global_299];
      BOOL v6 = v5;
      if (v5)
      {
        v7 = [v5 safeValueForKey:@"subviews"];
        objc_super v8 = [v7 firstObject];

        if (v8)
        {
          v9 = [v8 safeValueForKey:@"subviews"];
          v10 = [v9 firstObject];

          if (v10)
          {
            v11 = [v10 _accessibilityViewController];
            MEMORY[0x245658030](@"Music.NowPlayingViewController");
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              char v13 = 1;
            }
            else
            {
              v14 = [v10 safeValueForKey:@"subviews"];
              v15 = [v14 firstObject];

              v16 = [v15 safeValueForKey:@"subviews"];
              v17 = [v16 firstObject];

              v18 = [v17 _accessibilityViewController];
              MEMORY[0x245658030](@"Music.NowPlayingViewController");
              char v13 = objc_opt_isKindOfClass();
            }
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

@end