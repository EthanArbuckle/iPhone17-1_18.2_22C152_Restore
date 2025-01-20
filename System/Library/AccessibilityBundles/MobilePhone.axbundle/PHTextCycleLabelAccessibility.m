@interface PHTextCycleLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLanguage;
- (unint64_t)accessibilityTraits;
@end

@implementation PHTextCycleLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHTextCycleLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLanguage
{
  v3 = [(PHTextCycleLabelAccessibility *)self _accessibilityValueForKey:@"_accessibilityLanguageMap"];
  if (!v3)
  {
    v3 = objc_msgSend(objc_allocWithZone(NSDictionary), "initWithObjectsAndKeys:", @"en", @"Emergency call", @"de", @"Notruf", @"fr", @"Appel d’urgence", @"it", @"Solo emergenze", @"ja", @"緊急電話", @"es", @"Llamada SOS", @"pt", @"Ligação emergência", @"ru", @"Экстренный вызов", 0);
    [(PHTextCycleLabelAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"_accessibilityLanguageMap"];
  }
  v4 = [(PHTextCycleLabelAccessibility *)self accessibilityLabel];
  v5 = [v3 objectForKey:v4];

  if (!v5) {
    _AXAssert();
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PHTextCycleLabelAccessibility;
  return *MEMORY[0x263F1CF68] | [(PHTextCycleLabelAccessibility *)&v3 accessibilityTraits];
}

@end