@interface CNAvatarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation CNAvatarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNAvatarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAvatarView", @"contact", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAvatarView", @"imageView", "@", 0);
}

- (id)accessibilityLabel
{
  v17[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  id v3 = [(CNAvatarViewAccessibility *)self safeValueForKey:@"contact"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
  v17[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];

  if (!v4) {
    goto LABEL_7;
  }
  if (([v4 areKeysAvailable:v6] & 1) == 0)
  {
    v7 = [v4 identifier];

    if (v7)
    {
      v8 = accessibilityContactStore();
      v9 = [v4 identifier];
      uint64_t v10 = [v8 unifiedContactWithIdentifier:v9 keysToFetch:v6 error:0];

      v4 = (void *)v10;
      if (!v10) {
        goto LABEL_7;
      }
    }
  }
  uint64_t v11 = [MEMORY[0x263EFEA20] stringFromContact:v4 style:0];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = NSString;
    v14 = accessibilityLocalizedString(@"person.photo");
    v15 = objc_msgSend(v13, "stringWithFormat:", v14, v12);
  }
  else
  {
LABEL_7:
    v15 = accessibilityLocalizedString(@"person.photo.unknown");
  }

  return v15;
}

- (BOOL)accessibilityElementsHidden
{
  id v3 = [(CNAvatarViewAccessibility *)self storedAccessibilityElementsHidden];
  v4 = v3;
  if (v3) {
    LOBYTE(v5) = [v3 BOOLValue];
  }
  else {
    int v5 = ![(CNAvatarViewAccessibility *)self isAccessibilityElement];
  }

  return v5;
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(CNAvatarViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (!v3) {
    return AXDoesRequestingClientDeserveAutomation() != 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CNAvatarViewAccessibility;
  return [(CNAvatarViewAccessibility *)&v5 isAccessibilityElement];
}

- (id)automationElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(CNAvatarViewAccessibility *)self safeUIViewForKey:@"imageView"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end