@interface CKRemotePeoplePickerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKRemotePeoplePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKRemotePeoplePickerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)CKRemotePeoplePickerViewControllerAccessibility;
  [(CKRemotePeoplePickerViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v3 = [(CKRemotePeoplePickerViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  v4 = [v3 subviews];
  v5 = [v4 lastObject];

  [v5 setAccessibilityViewIsModalBlock:&__block_literal_global_1];
}

uint64_t __93__CKRemotePeoplePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

@end