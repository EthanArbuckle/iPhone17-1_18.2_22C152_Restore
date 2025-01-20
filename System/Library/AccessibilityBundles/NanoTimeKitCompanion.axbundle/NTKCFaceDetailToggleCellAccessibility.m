@interface NTKCFaceDetailToggleCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCellSwitch;
- (id)accessibilityHint;
- (id)accessibilityValue;
@end

@implementation NTKCFaceDetailToggleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKCFaceDetailToggleCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailToggleCell", @"toggle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKCFaceDetailToggleCell", @"_switchToggled", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  v2 = [(NTKCFaceDetailToggleCellAccessibility *)self _accessibilityCellSwitch];
  if ([v2 isOn]) {
    CFStringRef v3 = @"toggle.cell.on";
  }
  else {
    CFStringRef v3 = @"toggle.cell.off";
  }
  v4 = accessibilityCompanionLocalizedString((uint64_t)v3);

  return v4;
}

- (id)accessibilityHint
{
  return (id)accessibilityCompanionLocalizedString(@"toggle.cell.hint");
}

- (BOOL)accessibilityActivate
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __62__NTKCFaceDetailToggleCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accessibilityCellSwitch];
  objc_msgSend(v2, "setOn:animated:", objc_msgSend(v2, "isOn") ^ 1, 0);
  [*(id *)(a1 + 32) _switchToggled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (id)_accessibilityCellSwitch
{
  objc_opt_class();
  CFStringRef v3 = [(NTKCFaceDetailToggleCellAccessibility *)self safeValueForKey:@"toggle"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  return v4;
}

@end