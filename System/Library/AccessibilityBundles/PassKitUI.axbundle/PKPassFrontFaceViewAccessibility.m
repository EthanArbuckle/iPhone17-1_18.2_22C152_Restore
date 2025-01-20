@interface PKPassFrontFaceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)createBodyContentViews;
- (void)setBottomRightItem:(int64_t)a3;
@end

@implementation PKPassFrontFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassFrontFaceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPassFrontFaceView" hasInstanceVariable:@"_bottomRightItemView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassFrontFaceView", @"bottomRightItem", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPassFrontFaceView", @"setBottomRightItem:", "v", "q", 0);
}

- (void)createBodyContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassFrontFaceViewAccessibility;
  [(PKPassFrontFaceViewAccessibility *)&v3 createBodyContentViews];
  [(PKPassFrontFaceViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setBottomRightItem:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassFrontFaceViewAccessibility;
  [(PKPassFrontFaceViewAccessibility *)&v4 setBottomRightItem:a3];
  [(PKPassFrontFaceViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end