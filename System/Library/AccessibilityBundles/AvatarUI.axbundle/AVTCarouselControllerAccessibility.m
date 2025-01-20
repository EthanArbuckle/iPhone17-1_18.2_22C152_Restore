@interface AVTCarouselControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
- (void)presentEditorForCreatingAvatar:(id)a3;
@end

@implementation AVTCarouselControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTCarouselController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTCarouselController", @"loadView", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTCarouselController", @"presentEditorForCreatingAvatar:", "v", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)AVTCarouselControllerAccessibility;
  [(AVTCarouselControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)AVTCarouselControllerAccessibility;
  [(AVTCarouselControllerAccessibility *)&v3 loadView];
  [(AVTCarouselControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)presentEditorForCreatingAvatar:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AVTCarouselControllerAccessibility;
  [(AVTCarouselControllerAccessibility *)&v3 presentEditorForCreatingAvatar:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end