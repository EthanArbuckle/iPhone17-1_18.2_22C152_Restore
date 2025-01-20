@interface CKEntryViewPlusButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CKEntryViewPlusButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKEntryViewPlusButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"messaging.apps.button.text");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CKEntryViewPlusButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CKEntryViewPlusButtonAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)accessibilityActivate
{
  v4.receiver = self;
  v4.super_class = (Class)CKEntryViewPlusButtonAccessibility;
  BOOL v2 = [(CKEntryViewPlusButtonAccessibility *)&v4 accessibilityActivate];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  return v2;
}

@end