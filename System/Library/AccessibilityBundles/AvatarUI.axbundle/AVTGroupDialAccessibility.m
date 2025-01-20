@interface AVTGroupDialAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axScrollDial:(BOOL)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation AVTGroupDialAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTGroupDial";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTGroupDial", @"currentSelectedItemIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTGroupDial", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTGroupDial", @"setSelectedGroupIndex:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTGroupPickerItem", @"localizedName", "@", 0);
  [v3 validateProtocol:@"AVTGroupPickerDelegate" hasRequiredInstanceMethod:@"groupPicker:didSelectGroupAtIndex:tapped:"];
  [v3 validateProtocol:@"AVTGroupPicker" hasRequiredInstanceMethod:@"groupItems"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"editor.picker");
}

- (id)accessibilityValue
{
  uint64_t v3 = [(AVTGroupDialAccessibility *)self safeIntegerForKey:@"currentSelectedItemIndex"];
  v4 = [(AVTGroupDialAccessibility *)self safeArrayForKey:@"groupItems"];
  v5 = [v4 objectAtIndex:v3];
  v6 = [v5 safeStringForKey:@"localizedName"];
  v7 = NSString;
  v8 = accessibilityLocalizedString(@"starfish.number.of");
  v11 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v3 + 1, objc_msgSend(v4, "count"));
  v9 = __UIAXStringForVariables();

  return v9;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AVTGroupDialAccessibility;
  return *MEMORY[0x263F1CED8] | [(AVTGroupDialAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)_axScrollDial:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(AVTGroupDialAccessibility *)self safeIntegerForKey:@"currentSelectedItemIndex"];
  unint64_t v6 = v5;
  if (v3)
  {
    v7 = [(AVTGroupDialAccessibility *)self safeArrayForKey:@"groupItems"];
    BOOL v8 = v6 < [v7 count] - 1;
  }
  else
  {
    BOOL v8 = v5 > 0;
  }
  AXPerformSafeBlock();
  return v8;
}

void __43__AVTGroupDialAccessibility__axScrollDial___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectedGroupIndex:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  [v2 groupPicker:*(void *)(a1 + 32) didSelectGroupAtIndex:*(void *)(a1 + 40) tapped:0];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = 1;
    return [(AVTGroupDialAccessibility *)self _axScrollDial:v3];
  }
  if (a3 == 1)
  {
    uint64_t v3 = 0;
    return [(AVTGroupDialAccessibility *)self _axScrollDial:v3];
  }
  return 0;
}

@end