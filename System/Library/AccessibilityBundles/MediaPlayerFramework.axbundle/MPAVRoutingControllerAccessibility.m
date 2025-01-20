@interface MPAVRoutingControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)_iconImageForRoute:(id)a3;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation MPAVRoutingControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPAVRoutingController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (id)_iconImageForRoute:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MPAVRoutingControllerAccessibility;
  id v3 = a3;
  v4 = objc_msgSendSuper2(&v7, sel__iconImageForRoute_, v3);
  v5 = AXLabelForMediaRoute(v3);

  objc_msgSend(v4, "setAccessibilityLabel:", v5, v7.receiver, v7.super_class);

  return v4;
}

@end