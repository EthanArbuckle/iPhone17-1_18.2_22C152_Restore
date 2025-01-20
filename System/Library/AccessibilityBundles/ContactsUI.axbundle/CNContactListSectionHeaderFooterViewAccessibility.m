@interface CNContactListSectionHeaderFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CNContactListSectionHeaderFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactListSectionHeaderFooterView";
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
  v6.receiver = self;
  v6.super_class = (Class)CNContactListSectionHeaderFooterViewAccessibility;
  v2 = [(CNContactListSectionHeaderFooterViewAccessibility *)&v6 accessibilityLabel];
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [v2 lowercaseStringWithLocale:v3];

  return v4;
}

@end