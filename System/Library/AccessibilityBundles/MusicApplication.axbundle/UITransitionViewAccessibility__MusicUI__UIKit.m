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
  [v3 validateClass:@"MusicApplication.SearchResultsViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITransitionView", @"delegate", "@", 0);
  [v3 validateClass:@"_UISearchPresentationController" isKindOfClass:@"UIPresentationController"];
  [v3 validateClass:@"_UIFormSheetPresentationController" isKindOfClass:@"UIPresentationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPresentationController", @"presentedViewController", "@", 0);
  [v3 validateClass:@"MusicApplication.SearchResultsViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"MusicApplication.NowPlayingViewController" isKindOfClass:@"UIViewController"];
}

- (BOOL)accessibilityViewIsModal
{
  id v3 = [(UITransitionViewAccessibility__MusicUI__UIKit *)self safeValueForKey:@"delegate"];
  MEMORY[0x2456584B0](@"_UISearchPresentationController");
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v4 = [v3 safeValueForKey:@"presentedViewController"];
    v5 = __UIAccessibilityCastAsClass();
    v6 = [v5 searchResultsController];
    MEMORY[0x2456584B0](@"MusicApplication.SearchResultsViewController");
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v8 = 0;
    if (isKindOfClass) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  MEMORY[0x2456584B0](@"_UIFormSheetPresentationController");
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v3 safeValueForKey:@"presentedViewController"],
        v9 = objc_claimAutoreleasedReturnValue(),
        MEMORY[0x2456584B0](@"MusicApplication.NowPlayingViewController"),
        char v10 = objc_opt_isKindOfClass(),
        v9,
        (v10 & 1) == 0))
  {
    if (v3
      || ![(UITransitionViewAccessibility__MusicUI__UIKit *)self _foundNowPlayingViewControllerForIPad])
    {
LABEL_9:
      v12.receiver = self;
      v12.super_class = (Class)UITransitionViewAccessibility__MusicUI__UIKit;
      BOOL v8 = [(UITransitionViewAccessibility__MusicUI__UIKit *)&v12 accessibilityViewIsModal];
      goto LABEL_10;
    }
  }
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)_foundNowPlayingViewControllerForIPad
{
  if (AXDeviceIsPad())
  {
    id v3 = [(UITransitionViewAccessibility__MusicUI__UIKit *)self _accessibilityFindSubviewDescendant:&__block_literal_global_7];
    v4 = v3;
    if (v3)
    {
      v5 = [v3 _accessibilityFindSubviewDescendant:&__block_literal_global_303];
      v6 = v5;
      if (v5)
      {
        v7 = [v5 safeValueForKey:@"subviews"];
        BOOL v8 = [v7 firstObject];

        if (v8)
        {
          v9 = [v8 safeValueForKey:@"subviews"];
          char v10 = [v9 firstObject];

          if (v10)
          {
            v11 = [v10 _accessibilityViewController];
            MEMORY[0x2456584B0](@"MusicApplication.NowPlayingViewController");
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
              MEMORY[0x2456584B0](@"MusicApplication.NowPlayingViewController");
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