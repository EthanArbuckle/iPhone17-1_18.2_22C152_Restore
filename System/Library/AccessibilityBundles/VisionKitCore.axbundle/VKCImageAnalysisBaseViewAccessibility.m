@interface VKCImageAnalysisBaseViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)copyButtonPressed:(id)a3;
@end

@implementation VKCImageAnalysisBaseViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKCImageAnalysisBaseView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)copyButtonPressed:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalysisBaseViewAccessibility;
  [(VKCImageAnalysisBaseViewAccessibility *)&v4 copyButtonPressed:a3];
  [(VKCImageAnalysisBaseViewAccessibility *)self _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B78]];
}

@end