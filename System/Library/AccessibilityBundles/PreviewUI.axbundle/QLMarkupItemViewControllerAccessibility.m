@interface QLMarkupItemViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axPhotoDescriptionFromContext:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)previewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation QLMarkupItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLMarkupItemViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLMarkupItemViewController", @"loadPreviewControllerWithContents:context:completionHandler:", "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLMarkupItemViewController", @"previewDidAppear:", "v", "B", 0);
  [v3 validateClass:@"QLMarkupItemViewController" isKindOfClass:@"QLItemViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLItemViewController", @"scrollView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLItemViewController", @"context", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLPreviewContext", @"previewTitle", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)QLMarkupItemViewControllerAccessibility;
  [(QLMarkupItemViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(QLMarkupItemViewControllerAccessibility *)self safeValueForKey:@"context"];
  v4 = [(QLMarkupItemViewControllerAccessibility *)self _axPhotoDescriptionFromContext:v3];
  v5 = [(QLMarkupItemViewControllerAccessibility *)self safeValueForKey:@"scrollView"];
  v6 = [v5 _accessibilityFindSubviewDescendant:&__block_literal_global_0];

  [v6 setIsAccessibilityElement:1];
  [v6 setAccessibilityLabel:v4];
}

uint64_t __85__QLMarkupItemViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)QLMarkupItemViewControllerAccessibility;
  [(QLMarkupItemViewControllerAccessibility *)&v6 loadPreviewControllerWithContents:a3 context:a4 completionHandler:a5];
  [(QLMarkupItemViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)QLMarkupItemViewControllerAccessibility;
  [(QLMarkupItemViewControllerAccessibility *)&v4 viewDidLoad];
  id v3 = [(QLMarkupItemViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  [v3 setAccessibilityViewIsModal:1];
}

- (void)previewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLMarkupItemViewControllerAccessibility;
  [(QLMarkupItemViewControllerAccessibility *)&v4 previewDidAppear:a3];
  [(QLMarkupItemViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_axPhotoDescriptionFromContext:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 accessibilityLabel];
  if (!v4)
  {
    objc_super v4 = [v3 safeValueForKey:@"previewTitle"];
  }

  return v4;
}

@end