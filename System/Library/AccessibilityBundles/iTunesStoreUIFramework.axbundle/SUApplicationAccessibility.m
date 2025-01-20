@interface SUApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityContentLanguage;
@end

@implementation SUApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityContentLanguage
{
  v2 = [NSClassFromString(&cfstr_Sustorecontrol.isa) safeValueForKey:@"sharedInstance"];
  v3 = [v2 safeValueForKey:@"storeContentLanguage"];

  return v3;
}

@end