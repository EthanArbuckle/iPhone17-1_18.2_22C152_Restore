@interface UIAutonomousSingleAppModeConfigurationAPIOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)__gaxTrampoline_defaultBoolValueForFeatureKey:(id)a3;
@end

@implementation UIAutonomousSingleAppModeConfigurationAPIOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIAutonomousSingleAppModeConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)__gaxTrampoline_defaultBoolValueForFeatureKey:(id)a3
{
  v3 = GAXProfileKeyForUIAutonomousSingleAppModeConfigurationDictionaryKey(a3);
  v4 = GAXFallbackValueForProfileKey(v3, 3, 1);
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

@end