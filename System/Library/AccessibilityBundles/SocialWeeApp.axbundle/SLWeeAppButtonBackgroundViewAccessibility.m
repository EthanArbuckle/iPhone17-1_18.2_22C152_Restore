@interface SLWeeAppButtonBackgroundViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsFacebookButton;
- (BOOL)isAccessibilityElement;
- (SLWeeAppButtonBackgroundViewAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SLWeeAppButtonBackgroundViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SLWeeAppButtonBackgroundView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsFacebookButton
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(SLWeeAppButtonBackgroundViewAccessibility *)self safeValueForKey:@"subviews", 0];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = [*(id *)(*((void *)&v11 + 1) + 8 * i) accessibilityIdentifier];
        char v8 = [v7 isEqualToString:@"facebookglyph"];

        if (v8)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (SLWeeAppButtonBackgroundViewAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SLWeeAppButtonBackgroundViewAccessibility;
  uint64_t v3 = -[SLWeeAppButtonBackgroundViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = [(SLWeeAppButtonBackgroundViewAccessibility *)v3 safeValueForKey:@"_labelView"];
  [v4 setIsAccessibilityElement:0];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(SLWeeAppButtonBackgroundViewAccessibility *)self _accessibilityIsFacebookButton])
  {
    v2 = @"post.to.facebook";
  }
  else
  {
    v2 = @"post.to.unknown";
  }
  uint64_t v3 = accessibilityLocalizedString(v2);

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SLWeeAppButtonBackgroundViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SLWeeAppButtonBackgroundViewAccessibility *)&v3 accessibilityTraits];
}

@end