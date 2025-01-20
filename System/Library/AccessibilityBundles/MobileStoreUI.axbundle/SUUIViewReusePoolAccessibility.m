@interface SUUIViewReusePoolAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)dequeueReusableViewWithReuseIdentifier:(id)a3;
@end

@implementation SUUIViewReusePoolAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIViewReusePool";
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
  v5.super_class = (Class)SUUIViewReusePoolAccessibility;
  v3 = [(SUUIViewReusePoolAccessibility *)&v5 dequeueReusableViewWithReuseIdentifier:a3];
  [v3 _accessibilityUnregister];

  return v3;
}

@end