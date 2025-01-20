@interface AX_FitnessNSStringAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)attrStringWithValue:(id)a3 unit:(id)a4;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation AX_FitnessNSStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NSString";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (id)attrStringWithValue:(id)a3 unit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___AX_FitnessNSStringAccessibility;
  v8 = objc_msgSendSuper2(&v14, "attrStringWithValue:unit:", v6, v7);
  v9 = [v7 accessibilityLabel];

  if (v9)
  {
    v10 = [v7 accessibilityLabel];
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___AX_FitnessNSStringAccessibility;
    v11 = objc_msgSendSuper2(&v13, "attrStringWithValue:unit:", v6, v10);

    [v8 setAccessibilityLabel:v11];
  }

  return v8;
}

@end