@interface MailStatusBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
@end

@implementation MailStatusBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailStatusBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(MailStatusBarViewAccessibility *)self safeArrayForKey:@"subviews"];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "_accessibilityViewIsVisible", (void)v8))
        {
          v3 = [v6 accessibilityLabel];
          goto LABEL_11;
        }
      }
      v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isAccessibilityElement
{
  id v2 = [(MailStatusBarViewAccessibility *)self accessibilityLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)accessibilityIdentifier
{
  return @"MailStatusBar";
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__MailStatusBarViewAccessibility_accessibilityFrame__block_invoke;
  v15[3] = &unk_265133508;
  v15[4] = self;
  id v2 = [(MailStatusBarViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:v15];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

BOOL __52__MailStatusBarViewAccessibility_accessibilityFrame__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAccessibilityElement]) {
    BOOL v4 = *(void *)(a1 + 32) != (void)v3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end