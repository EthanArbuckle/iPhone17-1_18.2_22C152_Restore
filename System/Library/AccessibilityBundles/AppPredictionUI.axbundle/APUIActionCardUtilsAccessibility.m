@interface APUIActionCardUtilsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)_generateCardSectionWithInfo:(id)a3 config:(id)a4;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation APUIActionCardUtilsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"APUIActionCardUtils";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"APUIActionCardUtils", @"_generateCardSectionWithInfo:config:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"APUIActionCardViewConfig", @"bundleId", "@", 0);
}

+ (id)_generateCardSectionWithInfo:(id)a3 config:(id)a4
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___APUIActionCardUtilsAccessibility;
  id v5 = a4;
  v6 = objc_msgSendSuper2(&v9, sel__generateCardSectionWithInfo_config_, a3, v5);
  v7 = objc_msgSend(v5, "safeValueForKey:", @"bundleId", v9.receiver, v9.super_class);

  [v6 _accessibilitySetRetainedValue:v7 forKey:*MEMORY[0x263EFFB58]];

  return v6;
}

@end