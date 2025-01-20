@interface QLLivePhotoItemViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axPhotoDescriptionFromContext:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)previewDidAppear:(BOOL)a3;
@end

@implementation QLLivePhotoItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLLivePhotoItemViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLLivePhotoItemViewController", @"loadPreviewControllerWithContents:context:completionHandler:", "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLLivePhotoItemViewController", @"previewDidAppear:", "v", "B", 0);
  [v3 validateClass:@"QLLivePhotoItemViewController" hasInstanceVariable:@"_livePhotoView" withType:"PHLivePhotoView"];
  [v3 validateClass:@"QLLivePhotoItemViewController" isKindOfClass:@"QLItemViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLItemViewController", @"context", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLPreviewContext", @"previewTitle", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)QLLivePhotoItemViewControllerAccessibility;
  [(QLLivePhotoItemViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(QLLivePhotoItemViewControllerAccessibility *)self safeValueForKey:@"context"];
  v4 = [(QLLivePhotoItemViewControllerAccessibility *)self _axPhotoDescriptionFromContext:v3];
  v5 = [(QLLivePhotoItemViewControllerAccessibility *)self safeValueForKey:@"_livePhotoView"];
  [v5 setIsAccessibilityElement:1];
  [v5 setAccessibilityLabel:v4];
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)QLLivePhotoItemViewControllerAccessibility;
  [(QLLivePhotoItemViewControllerAccessibility *)&v6 loadPreviewControllerWithContents:a3 context:a4 completionHandler:a5];
  [(QLLivePhotoItemViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)previewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLLivePhotoItemViewControllerAccessibility;
  [(QLLivePhotoItemViewControllerAccessibility *)&v4 previewDidAppear:a3];
  [(QLLivePhotoItemViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_axPhotoDescriptionFromContext:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 accessibilityLabel];
  if (!v4)
  {
    objc_super v4 = [v3 safeValueForKey:@"previewTitle"];
  }
  v7 = accessibilityLocalizedString(@"ql.live.photo");
  v5 = __UIAXStringForVariables();

  return v5;
}

@end