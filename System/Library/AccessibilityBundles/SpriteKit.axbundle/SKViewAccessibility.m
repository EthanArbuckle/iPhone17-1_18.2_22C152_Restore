@interface SKViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySpriteKitScene;
- (id)accessibilityElements;
@end

@implementation SKViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilitySpriteKitScene
{
  return (id)[(SKViewAccessibility *)self safeValueForKey:@"scene"];
}

- (id)accessibilityElements
{
  v3 = [(SKViewAccessibility *)self _accessibilitySpriteKitScene];
  v4 = [v3 accessibilityContainer];

  if (!v4) {
    [v3 setAccessibilityContainer:self];
  }
  v5 = objc_msgSend(MEMORY[0x263EFF980], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v6 = [(SKViewAccessibility *)self _accessibilitySortedElementsWithin];
  if (v6) {
    [v5 addObjectsFromArray:v6];
  }

  return v5;
}

@end