@interface CKAvatarPickerLayoutAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)prepareLayout;
@end

@implementation CKAvatarPickerLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKAvatarPickerLayout";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)prepareLayout
{
  v2.receiver = self;
  v2.super_class = (Class)CKAvatarPickerLayoutAccessibility;
  [(CKAvatarPickerLayoutAccessibility *)&v2 prepareLayout];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end