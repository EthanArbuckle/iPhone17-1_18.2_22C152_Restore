@interface UIButtonAccessibility__Sharing__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUserTestingIsCancelButton;
- (BOOL)_axIsDismissButton;
- (id)accessibilityLabel;
@end

@implementation UIButtonAccessibility__Sharing__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AudioSoftwareUpdateViewController", @"handleDismissButton:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ProximityPairingViewController", @"handleDismissButton:", "v", "@", 0);
}

- (BOOL)_axIsDismissButton
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)UIButtonAccessibility__Sharing__UIKit;
  id v3 = [(UIButtonAccessibility__Sharing__UIKit *)&v35 accessibilityLabel];
  if ([v3 isEqualToString:@"x"])
  {
    BOOL v4 = 1;
    goto LABEL_30;
  }
  v5 = self;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v6 = [(UIButtonAccessibility__Sharing__UIKit *)v5 allTargets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (!v7)
  {
    BOOL v4 = 0;
    goto LABEL_29;
  }
  uint64_t v8 = *(void *)v32;
  uint64_t v21 = *(void *)v32;
  while (2)
  {
    uint64_t v9 = 0;
    uint64_t v22 = v7;
    do
    {
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * v9);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v11 = -[UIButtonAccessibility__Sharing__UIKit actionsForTarget:forControlEvent:](v5, "actionsForTarget:forControlEvent:", v10, 0x2000, v21);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v28;
LABEL_10:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          if ([*(id *)(*((void *)&v27 + 1) + 8 * v15) isEqualToString:@"handleDismissButton:"])goto LABEL_27; {
          if (v13 == ++v15)
          }
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v37 count:16];
            if (v13) {
              goto LABEL_10;
            }
            break;
          }
        }
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v11 = [(UIButtonAccessibility__Sharing__UIKit *)v5 actionsForTarget:v10 forControlEvent:64];
      uint64_t v16 = [v11 countByEnumeratingWithState:&v23 objects:v36 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v24;
LABEL_18:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v11);
          }
          if ([*(id *)(*((void *)&v23 + 1) + 8 * v19) isEqualToString:@"handleDismissButton:"])break; {
          if (v17 == ++v19)
          }
          {
            uint64_t v17 = [v11 countByEnumeratingWithState:&v23 objects:v36 count:16];
            if (v17) {
              goto LABEL_18;
            }
            goto LABEL_24;
          }
        }
LABEL_27:

        BOOL v4 = 1;
        goto LABEL_29;
      }
LABEL_24:

      ++v9;
      uint64_t v8 = v21;
    }
    while (v9 != v22);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
    BOOL v4 = 0;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_29:

LABEL_30:
  return v4;
}

- (BOOL)_accessibilityUserTestingIsCancelButton
{
  if ([(UIButtonAccessibility__Sharing__UIKit *)self _axIsDismissButton]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIButtonAccessibility__Sharing__UIKit;
  return [(UIButtonAccessibility__Sharing__UIKit *)&v4 _accessibilityUserTestingIsCancelButton];
}

- (id)accessibilityLabel
{
  if ([(UIButtonAccessibility__Sharing__UIKit *)self _axIsDismissButton])
  {
    v7.receiver = self;
    v7.super_class = (Class)UIButtonAccessibility__Sharing__UIKit;
    id v3 = [(UIButtonAccessibility__Sharing__UIKit *)&v7 accessibilityLabel];
    if (![v3 length] || (objc_msgSend(v3, "isEqualToString:", @"x") & 1) != 0)
    {
      objc_super v4 = accessibilityLocalizedString(@"dismiss.button");

      goto LABEL_7;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)UIButtonAccessibility__Sharing__UIKit;
  objc_super v4 = [(UIButtonAccessibility__Sharing__UIKit *)&v6 accessibilityLabel];
LABEL_7:

  return v4;
}

@end