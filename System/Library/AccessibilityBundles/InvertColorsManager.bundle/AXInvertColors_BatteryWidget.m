@interface AXInvertColors_BatteryWidget
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_BatteryWidget

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BCBatteryWidgetRowView" hasInstanceVariable:@"_glyphImageView" withType:"UIImageView"];
  [v3 validateClass:@"BCBatteryView"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"BCBatteryWidgetRowViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"BCBatteryViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 3;
}

@end