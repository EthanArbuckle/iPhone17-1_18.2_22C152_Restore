@interface SCNSceneAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityContainerIsSet;
- (CGRect)accessibilityFrame;
- (id)accessibilityContainer;
- (id)accessibilityElements;
- (void)dealloc;
@end

@implementation SCNSceneAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SCNScene";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (void)dealloc
{
  [(SCNSceneAccessibility *)self _accessibilityUnregister];
  v3.receiver = self;
  v3.super_class = (Class)SCNSceneAccessibility;
  [(SCNSceneAccessibility *)&v3 dealloc];
}

- (id)accessibilityElements
{
  objc_super v3 = [(SCNSceneAccessibility *)self safeValueForKey:@"rootNode"];
  [v3 setAccessibilityContainer:self];
  v4 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (BOOL)accessibilityContainerIsSet
{
  v5.receiver = self;
  v5.super_class = (Class)SCNSceneAccessibility;
  v2 = [(SCNSceneAccessibility *)&v5 accessibilityContainer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)accessibilityContainer
{
  v4.receiver = self;
  v4.super_class = (Class)SCNSceneAccessibility;
  v2 = [(SCNSceneAccessibility *)&v4 accessibilityContainer];
  if (!v2) {
    _AXAssert();
  }

  return v2;
}

- (CGRect)accessibilityFrame
{
  v2 = [(SCNSceneAccessibility *)self accessibilityContainer];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end