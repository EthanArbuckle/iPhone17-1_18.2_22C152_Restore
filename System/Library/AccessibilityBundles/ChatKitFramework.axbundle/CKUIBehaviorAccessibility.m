@interface CKUIBehaviorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldUseDynamicScrolling;
- (BOOL)shouldUseRotisserieScrolling;
@end

@implementation CKUIBehaviorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKUIBehavior";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKUIBehavior"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKUIBehavior", @"shouldUseDynamicScrolling", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKUIBehavior", @"shouldUseRotisserieScrolling", "B", 0);
}

- (BOOL)shouldUseDynamicScrolling
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKUIBehaviorAccessibility;
  return [(CKUIBehaviorAccessibility *)&v4 shouldUseDynamicScrolling];
}

- (BOOL)shouldUseRotisserieScrolling
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKUIBehaviorAccessibility;
  return [(CKUIBehaviorAccessibility *)&v4 shouldUseRotisserieScrolling];
}

@end