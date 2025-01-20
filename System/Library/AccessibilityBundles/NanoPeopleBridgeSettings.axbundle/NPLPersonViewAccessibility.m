@interface NPLPersonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityEditingFriendsDialViewAllowed;
- (BOOL)_accessibilityIsAddPersonSlot;
- (BOOL)_accessibilityShouldEmptySlotsBeIgnored;
- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityPeopleViewController;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityStyle;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation NPLPersonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NPLPersonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NPLPersonView", @"person", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NPLPersonView", @"position", "Q", 0);
  [v3 validateClass:@"NPLPersonView" hasInstanceVariable:@"_style" withType:"q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FKPerson", @"displayName", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  if (![(NPLPersonViewAccessibility *)self _accessibilityShouldEmptySlotsBeIgnored])return 1; {
  id v3 = [(NPLPersonViewAccessibility *)self safeValueForKey:@"person"];
  }
  if (v3) {
    char v4 = 1;
  }
  else {
    char v4 = [(NPLPersonViewAccessibility *)self _accessibilityStyle] != 0;
  }

  return v4;
}

- (id)accessibilityLabel
{
  if ([(NPLPersonViewAccessibility *)self _accessibilityIsAddPersonSlot])
  {
    id v3 = accessibilityLocalizedString(@"people.add.person");
  }
  else
  {
    char v4 = [(NPLPersonViewAccessibility *)self safeValueForKey:@"person"];
    id v3 = [v4 safeValueForKey:@"displayName"];
  }

  return v3;
}

- (id)accessibilityValue
{
  if ([(NPLPersonViewAccessibility *)self _accessibilityEditingFriendsDialViewAllowed])
  {
    [(NPLPersonViewAccessibility *)self safeUnsignedIntegerForKey:@"position"];
    id v3 = accessibilityLocalizedString(@"dial.person.position");
    char v4 = AXFormatInteger();
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)NPLPersonViewAccessibility;
  UIAccessibilityTraits v3 = UIAccessibilityTraitButton | [(NPLPersonViewAccessibility *)&v5 accessibilityTraits];
  if ([(NPLPersonViewAccessibility *)self _accessibilityEditingFriendsDialViewAllowed]&& ![(NPLPersonViewAccessibility *)self _accessibilityIsAddPersonSlot])
  {
    v3 |= UIAccessibilityTraitAdjustable;
  }
  return v3;
}

- (void)accessibilityIncrement
{
  id v3 = [(NPLPersonViewAccessibility *)self safeUnsignedIntegerForKey:@"position"];
  id v4 = [(NPLPersonViewAccessibility *)self _accessibilityPeopleViewController];
  [v4 _accessibilitySwapPeopleAtIndex:v3 andIndex:((unint64_t)v3 + 1) % 0xC];
}

- (void)accessibilityDecrement
{
  id v3 = [(NPLPersonViewAccessibility *)self safeUnsignedIntegerForKey:@"position"];
  id v4 = v3;
  if (v3) {
    uint64_t v5 = (uint64_t)v3 - 1;
  }
  else {
    uint64_t v5 = 11;
  }
  id v6 = [(NPLPersonViewAccessibility *)self _accessibilityPeopleViewController];
  [v6 _accessibilitySwapPeopleAtIndex:v4 andIndex:v5];
}

- (id)accessibilityHint
{
  if ([(NPLPersonViewAccessibility *)self _accessibilityEditingFriendsDialViewAllowed])
  {
    if ([(NPLPersonViewAccessibility *)self _accessibilityIsAddPersonSlot])
    {
      id v3 = 0;
      goto LABEL_11;
    }
    id v6 = @"reorder.person.hint";
  }
  else
  {
    int64_t v4 = [(NPLPersonViewAccessibility *)self _accessibilityStyle];
    CFStringRef v5 = @"person.hint";
    if (v4 == 2) {
      CFStringRef v5 = @"person.triple.tap.hint";
    }
    if (v4 == 1) {
      id v6 = @"person.crown.hint";
    }
    else {
      id v6 = (__CFString *)v5;
    }
  }
  id v3 = accessibilityLocalizedString(v6);
LABEL_11:

  return v3;
}

- (int64_t)_accessibilityStyle
{
  int64_t result = (int64_t)[(NPLPersonViewAccessibility *)self safeIvarForKey:@"_style"];
  if (result) {
    return *(void *)result;
  }
  return result;
}

- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  return 1;
}

- (BOOL)_accessibilityIsAddPersonSlot
{
  v2 = [(NPLPersonViewAccessibility *)self safeValueForKey:@"person"];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)_accessibilityPeopleViewController
{
  v2 = [(NPLPersonViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_0 startWithSelf:0];
  BOOL v3 = [v2 _accessibilityViewController];

  return v3;
}

BOOL __64__NPLPersonViewAccessibility__accessibilityPeopleViewController__block_invoke(id a1, id a2)
{
  v2 = [a2 _accessibilityViewController];
  AXSafeClassFromString();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityShouldEmptySlotsBeIgnored
{
  return ![(NPLPersonViewAccessibility *)self _accessibilityEditingFriendsDialViewAllowed];
}

- (BOOL)_accessibilityEditingFriendsDialViewAllowed
{
  return 1;
}

@end