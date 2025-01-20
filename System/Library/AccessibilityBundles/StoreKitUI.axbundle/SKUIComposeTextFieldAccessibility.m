@interface SKUIComposeTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (SKUIComposeTextFieldAccessibility)initWithConfiguration:(id)a3 style:(int)a4;
@end

@implementation SKUIComposeTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIComposeTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SKUIComposeTextFieldAccessibility)initWithConfiguration:(id)a3 style:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SKUIComposeTextFieldAccessibility;
  v4 = [(SKUIComposeTextFieldAccessibility *)&v9 initWithConfiguration:a3 style:*(void *)&a4];
  v5 = [(SKUIComposeTextFieldAccessibility *)v4 safeValueForKey:@"_textField"];
  v6 = [(SKUIComposeTextFieldAccessibility *)v4 safeValueForKey:@"_configuration"];
  v7 = [v6 safeValueForKey:@"label"];
  [v5 setAccessibilityLabel:v7];

  return v4;
}

@end