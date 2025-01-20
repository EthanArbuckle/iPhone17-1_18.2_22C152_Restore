@interface UIToolbarTextButtonAccessibility__PhotosUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (double)_accessibilityDelayBeforeUpdatingOnActivation;
@end

@implementation UIToolbarTextButtonAccessibility__PhotosUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIToolbarTextButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (double)_accessibilityDelayBeforeUpdatingOnActivation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(UIToolbarTextButtonAccessibility__PhotosUI__UIKit *)self allTargets];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        uint64_t v9 = [v8 _accessibilityValueForKey:AXIsPhotoSharingLikeButtonKey];
        v10 = __UIAccessibilityCastAsClass();

        LOBYTE(v9) = [v10 BOOLValue];
        if (v9)
        {

          double v12 = 5.0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v14.receiver = self;
  v14.super_class = (Class)UIToolbarTextButtonAccessibility__PhotosUI__UIKit;
  [(UIToolbarTextButtonAccessibility__PhotosUI__UIKit *)&v14 _accessibilityDelayBeforeUpdatingOnActivation];
  double v12 = v11;
LABEL_11:

  return v12;
}

@end