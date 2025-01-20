@interface MediaControlsContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation MediaControlsContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MediaControlsContainerView" hasInstanceVariable:@"_timeControl" withType:"MediaControlsTimeControl"];
  [v3 validateClass:@"MediaControlsContainerView" hasInstanceVariable:@"_transportStackView" withType:"MediaControlsTransportStackView"];
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  v4 = [(MediaControlsContainerViewAccessibility *)self safeUIViewForKey:@"_timeControl"];
  v5 = [(MediaControlsContainerViewAccessibility *)self safeUIViewForKey:@"_transportStackView"];
  v6 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);

  return v6;
}

@end