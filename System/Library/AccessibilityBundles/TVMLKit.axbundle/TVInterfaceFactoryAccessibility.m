@interface TVInterfaceFactoryAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_viewFromElement:(id)a3 existingView:(id)a4;
@end

@implementation TVInterfaceFactoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVInterfaceFactory";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_viewFromElement:(id)a3 existingView:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)TVInterfaceFactoryAccessibility;
  id v5 = a3;
  v6 = [(TVInterfaceFactoryAccessibility *)&v12 _viewFromElement:v5 existingView:a4];
  v7 = objc_msgSend(v5, "accessibilityText", v12.receiver, v12.super_class);

  v8 = [v6 accessibilityLabel];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    if ([v7 length])
    {
      [v6 setAccessibilityLabel:v7];
    }
    else
    {
      v10 = accessibilityLabelForTVView(v6);
      [v6 setAccessibilityLabel:v10];
    }
  }

  return v6;
}

@end