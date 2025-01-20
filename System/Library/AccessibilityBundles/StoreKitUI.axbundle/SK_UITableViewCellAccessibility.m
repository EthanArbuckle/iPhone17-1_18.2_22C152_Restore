@interface SK_UITableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)tableTextAccessibleLabel:(id)a3;
@end

@implementation SK_UITableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUICircleProgressIndicator"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"tableTextAccessibleLabel:", "@", 0);
}

- (id)tableTextAccessibleLabel:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SK_UITableViewCellAccessibility;
  v4 = [(SK_UITableViewCellAccessibility *)&v10 tableTextAccessibleLabel:a3];
  v5 = [(SK_UITableViewCellAccessibility *)self accessoryView];
  NSClassFromString(&cfstr_Skuicircleprog_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = accessibilitySKUILocalizedString(@"loading.status");
    uint64_t v8 = __UIAXStringForVariables();

    v4 = (void *)v8;
  }

  return v4;
}

@end