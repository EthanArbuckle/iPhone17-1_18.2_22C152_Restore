@interface PUILocationServicesCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation PUILocationServicesCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUILocationServicesCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUILocationServicesCell", @"location", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUILocationUsageMixin", @"usage", "i", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(PUILocationServicesCellAccessibility *)self safeValueForKey:@"location"];
  v4 = [v3 safeValueForKey:@"usage"];
  uint64_t v5 = [v4 integerValue];

  switch(v5)
  {
    case 2:
      v7 = NSString;
      v8 = accessibilityLocalizedString(@"tracking.used.recently");
      v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, 24);

      goto LABEL_9;
    case 4:
      v6 = @"tracking.geofence.enabled";
      goto LABEL_7;
    case 3:
      v6 = @"tracking.used.currently";
LABEL_7:
      v9 = accessibilityLocalizedString(v6);
      goto LABEL_9;
  }
  v9 = 0;
LABEL_9:
  v10 = [(PUILocationServicesCellAccessibility *)self safeValueForKey:@"textLabel"];
  v11 = __UIAXStringForVariables();

  return v11;
}

@end