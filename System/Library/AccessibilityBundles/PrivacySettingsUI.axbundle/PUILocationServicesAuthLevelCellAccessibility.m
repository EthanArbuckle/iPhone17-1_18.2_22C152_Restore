@interface PUILocationServicesAuthLevelCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation PUILocationServicesAuthLevelCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUILocationServicesAuthLevelCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUILocationServicesAuthLevelCell", @"location", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUILocationUsageMixin", @"usage", "i", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(PUILocationServicesAuthLevelCellAccessibility *)self safeValueForKey:@"_location"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [v4 safeValueForKey:@"usage"];
  uint64_t v6 = [v5 integerValue];

  switch(v6)
  {
    case 1:
      v7 = @"tracking.used.none.recently";
      goto LABEL_6;
    case 2:
      v8 = NSString;
      v9 = accessibilityLocalizedString(@"tracking.used.recently");
      v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, 24);

      break;
    case 3:
      v7 = @"tracking.used.currently";
      goto LABEL_6;
    case 4:
      v7 = @"tracking.geofence.enabled";
LABEL_6:
      v10 = accessibilityLocalizedString(v7);
      break;
    default:
      v10 = 0;
      break;
  }
  v11 = [(PUILocationServicesAuthLevelCellAccessibility *)self safeValueForKey:@"textLabel"];
  v12 = __UIAXStringForVariables();

  return v12;
}

@end