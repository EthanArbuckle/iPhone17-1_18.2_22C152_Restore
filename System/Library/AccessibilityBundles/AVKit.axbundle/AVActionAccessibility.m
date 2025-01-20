@interface AVActionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation AVActionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVAction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(AVActionAccessibility *)self safeStringForKey:@"title"];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AVActionAccessibility;
    id v4 = [(AVActionAccessibility *)&v7 accessibilityLabel];
  }
  v5 = v4;

  return v5;
}

@end