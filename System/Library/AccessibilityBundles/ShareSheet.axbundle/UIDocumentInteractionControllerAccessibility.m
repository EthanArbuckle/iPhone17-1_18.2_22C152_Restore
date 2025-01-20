@interface UIDocumentInteractionControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)presentPreviewAnimated:(BOOL)a3;
@end

@implementation UIDocumentInteractionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDocumentInteractionController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDocumentInteractionController", @"presentPreviewAnimated:", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDocumentInteractionController", @"previewsPresentWithMarkup", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDocumentInteractionController", @"previewController", "@", 0);
}

- (BOOL)presentPreviewAnimated:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIDocumentInteractionControllerAccessibility;
  BOOL v4 = [(UIDocumentInteractionControllerAccessibility *)&v11 presentPreviewAnimated:a3];
  if ([(UIDocumentInteractionControllerAccessibility *)self safeBoolForKey:@"previewsPresentWithMarkup"])
  {
    objc_opt_class();
    v5 = [(UIDocumentInteractionControllerAccessibility *)self safeValueForKey:@"previewController"];
    v6 = [v5 safeValueForKey:@"additionalRightBarButtonItems"];
    v7 = __UIAccessibilityCastAsClass();

    v8 = [v7 lastObject];
    v9 = accessibilityLocalizedString(@"sharing.markup.button.label");
    [v8 setAccessibilityLabel:v9];
  }
  return v4;
}

@end