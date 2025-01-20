@interface UITextRangeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)automationElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateGrabbers;
@end

@implementation UITextRangeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITextRangeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UITextRangeView";
  v3 = "UISelectionGrabber";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UITextRangeView" hasInstanceVariable:@"m_endGrabber" withType:"UISelectionGrabber"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITextRangeView", @"updateGrabbers", "v", 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UITextRangeViewAccessibility;
  [(UITextRangeViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v2 = (id)[(UITextRangeViewAccessibility *)v6 safeUIViewForKey:@"m_startGrabber"];
  [v2 setAccessibilityIdentifier:@"TextSelectionStartGrabber"];

  id v3 = (id)[(UITextRangeViewAccessibility *)v6 safeUIViewForKey:@"m_endGrabber"];
  [v3 setAccessibilityIdentifier:@"TextSelectionEndGrabber"];
}

- (void)updateGrabbers
{
  objc_super v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UITextRangeViewAccessibility;
  [(UITextRangeViewAccessibility *)&v2 updateGrabbers];
  [(UITextRangeViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
}

- (id)automationElements
{
  SEL v3 = (void *)MEMORY[0x263EFF8C0];
  id v5 = (id)[(UITextRangeViewAccessibility *)self safeValueForKey:@"m_startGrabber"];
  id v4 = (id)[(UITextRangeViewAccessibility *)self safeValueForKey:@"m_endGrabber"];
  id v6 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v4);

  return v6;
}

@end