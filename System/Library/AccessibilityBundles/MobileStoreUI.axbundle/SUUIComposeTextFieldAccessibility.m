@interface SUUIComposeTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (SUUIComposeTextFieldAccessibility)initWithConfiguration:(id)a3 style:(int)a4;
@end

@implementation SUUIComposeTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIComposeTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SUUIComposeTextFieldAccessibility)initWithConfiguration:(id)a3 style:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIComposeTextFieldAccessibility;
  v4 = [(SUUIComposeTextFieldAccessibility *)&v9 initWithConfiguration:a3 style:*(void *)&a4];
  v5 = [(SUUIComposeTextFieldAccessibility *)v4 safeValueForKey:@"_textField"];
  v6 = [(SUUIComposeTextFieldAccessibility *)v4 safeValueForKey:@"_configuration"];
  v7 = [v6 safeValueForKey:@"label"];
  [v5 setAccessibilityLabel:v7];

  return v4;
}

@end