@interface TVButtonLockupAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldAnnounceAxLabelChange;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLastAxLabel;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetLastAxLabel:(id)a3;
- (void)_accessibilitySetShouldAnnounceAxLabelChange:(BOOL)a3;
- (void)_selectButtonAction:(id)a3;
@end

@implementation TVButtonLockupAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVButtonLockup";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVButtonLockup", @"titleView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVButtonLockup", @"imageView", "@", 0);
  [v3 validateClass:@"TVButtonLockup" hasInstanceVariable:@"_textView" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVButtonLockup", @"_selectButtonAction:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v18.receiver = self;
  v18.super_class = (Class)TVButtonLockupAccessibility;
  id v3 = [(TVButtonLockupAccessibility *)&v18 accessibilityLabel];
  v4 = [(TVButtonLockupAccessibility *)self safeValueForKey:@"titleView"];
  v5 = [v4 accessibilityLabel];

  v6 = [(TVButtonLockupAccessibility *)self safeValueForKey:@"_textView"];
  v7 = [v6 accessibilityLabel];

  if ([v3 length])
  {
    id v8 = v3;
    if (([v8 axContainsString:v7 options:2] & 1) == 0)
    {
      v14 = v7;
      v16 = @"__AXStringForVariablesSentinel";
      uint64_t v9 = __UIAXStringForVariables();

      id v8 = (id)v9;
    }
    if ((objc_msgSend(v8, "axContainsString:options:", v5, 2, v14, v16) & 1) == 0)
    {
      v15 = v5;
      v17 = @"__AXStringForVariablesSentinel";
      uint64_t v10 = __UIAXStringForVariables();

      id v8 = (id)v10;
    }
  }
  else
  {
    v15 = v5;
    v17 = @"__AXStringForVariablesSentinel";
    __UIAXStringForVariables();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = [(TVButtonLockupAccessibility *)self _accessibilityLastAxLabel];
  if (-[TVButtonLockupAccessibility _accessibilityShouldAnnounceAxLabelChange](self, "_accessibilityShouldAnnounceAxLabelChange")&& ([v8 isEqualToString:v11] & 1) == 0)
  {
    [(TVButtonLockupAccessibility *)self _accessibilitySetShouldAnnounceAxLabelChange:0];
  }
  [(TVButtonLockupAccessibility *)self _accessibilitySetLastAxLabel:v8];
  id v12 = v8;

  return v12;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)_accessibilityShouldAnnounceAxLabelChange
{
  return MEMORY[0x270F0A438](self, &__TVButtonLockupAccessibility___accessibilityShouldAnnounceAxLabelChange);
}

- (void)_accessibilitySetShouldAnnounceAxLabelChange:(BOOL)a3
{
}

- (id)_accessibilityLastAxLabel
{
}

- (void)_accessibilitySetLastAxLabel:(id)a3
{
}

- (void)_selectButtonAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TVButtonLockupAccessibility;
  [(TVButtonLockupAccessibility *)&v4 _selectButtonAction:a3];
  [(TVButtonLockupAccessibility *)self _accessibilitySetShouldAnnounceAxLabelChange:1];
}

@end