@interface BuddyUILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation BuddyUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v8.receiver = self;
  v8.super_class = (Class)BuddyUILabelAccessibility;
  if (![(BuddyUILabelAccessibility *)&v8 isAccessibilityElement]) {
    return 0;
  }
  v3 = [(BuddyUILabelAccessibility *)self accessibilityLabel];
  v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];
  BOOL v6 = [v5 length] != 0;

  return v6;
}

@end