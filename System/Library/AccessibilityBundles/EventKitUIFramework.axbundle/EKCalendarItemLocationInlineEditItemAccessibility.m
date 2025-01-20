@interface EKCalendarItemLocationInlineEditItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)_updateClearButtonAndMakeVisible:(id)a3 index:(unint64_t)a4;
@end

@implementation EKCalendarItemLocationInlineEditItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKCalendarItemLocationInlineEditItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKCalendarItemLocationInlineEditItem", @"cellForSubitemAtIndex:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKCalendarItemLocationInlineEditItem", @"_updateClearButtonAndMakeVisible:index:", "v", "@", "Q", 0);
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKCalendarItemLocationInlineEditItemAccessibility;
  id v3 = [(EKCalendarItemLocationInlineEditItemAccessibility *)&v6 cellForSubitemAtIndex:a3];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | v4];

  return v3;
}

- (void)_updateClearButtonAndMakeVisible:(id)a3 index:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKCalendarItemLocationInlineEditItemAccessibility;
  id v5 = a3;
  [(EKCalendarItemLocationInlineEditItemAccessibility *)&v7 _updateClearButtonAndMakeVisible:v5 index:a4];
  objc_super v6 = UIKitAccessibilityLocalizedString();
  objc_msgSend(v5, "setAccessibilityLabel:", v6, v7.receiver, v7.super_class);
}

@end