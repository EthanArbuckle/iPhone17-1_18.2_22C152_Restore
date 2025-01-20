@interface AKToolbarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AKToolbarViewAccessibility)initWithFrame:(CGRect)a3;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (BOOL)shouldGroupAccessibilityChildren;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AKToolbarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKToolbarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKToolbarView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"AKToolbarView" hasInstanceVariable:@"_toolbar" withType:"UIToolbar"];
  [v3 validateClass:@"AKToolbarView" hasInstanceVariable:@"_undoButton" withType:"UIBarButtonItem"];
  [v3 validateClass:@"AKToolbarView" hasInstanceVariable:@"_redoButton" withType:"UIBarButtonItem"];
  [v3 validateClass:@"AKToolbarView" hasInstanceVariable:@"_shapesPickerButton" withType:"UIBarButtonItem"];
  [v3 validateClass:@"AKToolbarView" hasInstanceVariable:@"_attributesPickerButton" withType:"AKAttributesPickerButton"];
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (AKToolbarViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKToolbarViewAccessibility;
  id v3 = -[AKToolbarViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AKToolbarViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)AKToolbarViewAccessibility;
  [(AKToolbarViewAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AKToolbarViewAccessibility *)self safeValueForKey:@"_toolbar"];
  [v3 setShouldGroupAccessibilityChildren:0];

  v4 = [(AKToolbarViewAccessibility *)self safeValueForKey:@"_undoButton"];
  objc_super v5 = accessibilityLocalizedString(@"undo.button");
  [v4 setAccessibilityLabel:v5];

  v6 = [(AKToolbarViewAccessibility *)self safeValueForKey:@"_redoButton"];
  v7 = accessibilityLocalizedString(@"redo.button");
  [v6 setAccessibilityLabel:v7];

  v8 = [(AKToolbarViewAccessibility *)self safeValueForKey:@"_shapesPickerButton"];
  v9 = accessibilityLocalizedString(@"add.shape.button");
  [v8 setAccessibilityLabel:v9];

  v10 = [(AKToolbarViewAccessibility *)self safeValueForKey:@"_attributesPickerButton"];
  v11 = accessibilityLocalizedString(@"shape.attributes");
  [v10 setAccessibilityLabel:v11];
}

@end