@interface COSActiveWatchCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
@end

@implementation COSActiveWatchCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSActiveWatchCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"COSActiveWatchCell" hasInstanceVariable:@"_watchName" withType:"UILabel"];
  [v3 validateClass:@"COSActiveWatchCell" hasInstanceVariable:@"_watchDetails" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  id v3 = [(COSActiveWatchCellAccessibility *)self safeValueForKey:@"_watchName"];
  v4 = [v3 accessibilityLabel];
  v5 = [(COSActiveWatchCellAccessibility *)self safeValueForKey:@"_watchDetails"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)accessibilityIdentifier
{
  v2 = NSString;
  id v3 = [(COSActiveWatchCellAccessibility *)self accessibilityLabel];
  v4 = [v2 stringWithFormat:@"PairedWatch: [%@]", v3];

  return v4;
}

@end