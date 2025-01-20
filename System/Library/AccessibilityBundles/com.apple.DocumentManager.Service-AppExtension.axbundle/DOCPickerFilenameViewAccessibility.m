@interface DOCPickerFilenameViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateTagButtonAccessibility:(id)a3;
@end

@implementation DOCPickerFilenameViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"com_apple_DocumentManager_Service.DOCPickerFilenameView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCPickerFilenameView", @"updateTagButtonAccessibility:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCPickerFilenameView", @"tags", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"com_apple_DocumentManager_Service.DOCPickerFilenameView", @"tagButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)DOCPickerFilenameViewAccessibility;
  [(DOCPickerFilenameViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(DOCPickerFilenameViewAccessibility *)self safeValueForKey:@"tagButton"];
  v4 = __UIAccessibilityCastAsClass();

  [(DOCPickerFilenameViewAccessibility *)self updateTagButtonAccessibility:v4];
}

- (void)updateTagButtonAccessibility:(id)a3
{
  id v4 = a3;
  id v7 = [(DOCPickerFilenameViewAccessibility *)self safeArrayForKey:@"tags"];
  if ([v7 count]) {
    objc_super v5 = @"Tags";
  }
  else {
    objc_super v5 = @"Add Tags";
  }
  v6 = accessibilityLocalizedString(v5);
  [v4 setAccessibilityLabel:v6];
}

@end