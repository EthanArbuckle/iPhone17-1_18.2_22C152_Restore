@interface SKLabelNodeAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SKLabelNodeAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKLabelNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKLabelNode", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKNode", @"alpha", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKNode", @"isHidden", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(SKLabelNodeAccessibility *)self safeValueForKey:@"text"];
  if ([v3 length]
    && ([(SKLabelNodeAccessibility *)self safeCGFloatForKey:@"alpha"], v4 > 0.0))
  {
    int v5 = [(SKLabelNodeAccessibility *)self safeBoolForKey:@"isHidden"] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)accessibilityLabel
{
  v5.receiver = self;
  v5.super_class = (Class)SKLabelNodeAccessibility;
  id v3 = [(SKLabelNodeAccessibility *)&v5 accessibilityLabel];
  if (!v3)
  {
    id v3 = [(SKLabelNodeAccessibility *)self safeValueForKey:@"text"];
  }

  return v3;
}

@end