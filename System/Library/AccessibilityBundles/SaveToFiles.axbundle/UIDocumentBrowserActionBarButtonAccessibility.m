@interface UIDocumentBrowserActionBarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation UIDocumentBrowserActionBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SaveToFiles.UIDocumentBrowserActionBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  char v11 = 0;
  objc_opt_class();
  v3 = [(UIDocumentBrowserActionBarButtonAccessibility *)self safeValueForKey:@"docAction"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 localizedTitle];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [v4 localizedTitle];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIDocumentBrowserActionBarButtonAccessibility;
    uint64_t v7 = [(UIDocumentBrowserActionBarButtonAccessibility *)&v10 accessibilityLabel];
  }
  v8 = (void *)v7;

  return v8;
}

@end