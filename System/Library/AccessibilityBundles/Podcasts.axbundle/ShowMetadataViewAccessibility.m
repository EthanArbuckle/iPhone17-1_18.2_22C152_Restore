@interface ShowMetadataViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)ratingFormatter;
@end

@implementation ShowMetadataViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.ShowMetadataView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ShelfKitCollectionViews.ShowMetadataView" hasSwiftField:@"label" withSwiftType:"UILabel"];
  [v3 validateClass:@"ShelfKitCollectionViews.ShowMetadataView" hasSwiftField:@"rating" withSwiftType:"Float"];
  [v3 validateClass:@"ShelfKitCollectionViews.ShowMetadataView" hasSwiftField:@"numberFormatter" withSwiftType:"NSNumberFormatter"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(ShowMetadataViewAccessibility *)self safeSwiftValueForKey:@"label"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];
  [(ShowMetadataViewAccessibility *)self safeSwiftFloatForKey:@"rating"];
  float v7 = v6;
  v8 = NSString;
  v9 = accessibilityLocalizedString(@"stars.count");
  v10 = objc_msgSend(v8, "stringWithFormat:", v9, (float)(roundf(v7 * 10.0) / 10.0));

  uint64_t v11 = [(ShowMetadataViewAccessibility *)self safeSwiftIntForKey:@"numberOfRatings"];
  uint64_t v12 = v11 + 50 - (unsigned __int16)(v11 + 50) % 0x64u;
  if (v11 < 1000) {
    uint64_t v12 = v11;
  }
  if (v11 >= 10000) {
    uint64_t v13 = 1000 * ((v11 + 500) / 1000);
  }
  else {
    uint64_t v13 = v12;
  }
  v14 = NSString;
  v15 = accessibilityLocalizedString(@"ratings.count");
  v16 = objc_msgSend(v14, "stringWithFormat:", v15, v13);

  v17 = [v5 componentsSeparatedByString:@"·"];
  v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v10, v16, 0);
  if ([v17 count])
  {
    v19 = objc_msgSend(v17, "subarrayWithRange:", 1, objc_msgSend(v17, "count") - 1);
    [v18 axSafelyAddObjectsFromArray:v19];
  }
  v20 = [v18 componentsJoinedByString:@", "];

  return v20;
}

- (id)ratingFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v2 setNumberStyle:1];

  return v2;
}

@end