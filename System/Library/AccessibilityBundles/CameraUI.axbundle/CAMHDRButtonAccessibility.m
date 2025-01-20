@interface CAMHDRButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CAMHDRButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMHDRButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMHDRButton", @"HDRMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMHDRButton", @"setHDRMode:", "v", "q", 0);
}

- (BOOL)accessibilityActivate
{
  v2 = [(CAMHDRButtonAccessibility *)self safeValueForKey:@"HDRMode"];
  [v2 integerValue];

  AXPerformSafeBlock();
  return 1;
}

void __50__CAMHDRButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHDRMode:*(void *)(a1 + 40)];
  v1 = __UIAccessibilitySafeClass();
  [v1 sendActionsForControlEvents:4096];
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(@"hdr.label");
}

- (id)accessibilityValue
{
  v2 = [(CAMHDRButtonAccessibility *)self safeValueForKey:@"HDRMode"];
  unsigned int v3 = [v2 intValue];

  if (v3 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityCameraKitLocalizedString(off_2650A0220[v3]);
  }

  return v4;
}

- (id)accessibilityHint
{
  return accessibilityCameraKitLocalizedString(@"flash.hdr.button.hint.text");
}

- (id)accessibilityIdentifier
{
  return @"HDR";
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMHDRButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMHDRButtonAccessibility *)&v3 accessibilityTraits];
}

@end