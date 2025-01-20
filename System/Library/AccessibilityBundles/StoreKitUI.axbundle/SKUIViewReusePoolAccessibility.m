@interface SKUIViewReusePoolAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)dequeueReusableViewWithReuseIdentifier:(id)a3;
@end

@implementation SKUIViewReusePoolAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIViewReusePool";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)dequeueReusableViewWithReuseIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIViewReusePoolAccessibility;
  v3 = [(SKUIViewReusePoolAccessibility *)&v5 dequeueReusableViewWithReuseIdentifier:a3];
  [v3 _accessibilityUnregister];

  return v3;
}

@end