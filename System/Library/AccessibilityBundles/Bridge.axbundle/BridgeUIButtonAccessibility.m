@interface BridgeUIButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
@end

@implementation BridgeUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BridgeUIButtonAccessibility;
  [(BridgeUIButtonAccessibility *)&v6 setImage:a3 forState:a4];
  v5 = [NSString _accessibilityLastDrawnString];
  if (v5)
  {
    [(BridgeUIButtonAccessibility *)self setAccessibilityLabel:v5];
    [NSString _accessibilitySetLastDrawnString:0];
  }
}

@end