@interface NTKLauncherComplicationDataSourceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_currentTimelineEntry;
@end

@implementation NTKLauncherComplicationDataSourceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKLauncherComplicationDataSource";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKLauncherComplicationDataSource", @"_currentTimelineEntry", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKLauncherComplicationDataSource", @"_appTitle", "@", 0);
}

- (id)_currentTimelineEntry
{
  v12.receiver = self;
  v12.super_class = (Class)NTKLauncherComplicationDataSourceAccessibility;
  id v3 = [(NTKLauncherComplicationDataSourceAccessibility *)&v12 _currentTimelineEntry];
  v4 = [v3 complicationTemplate];
  if (_accessibilityComplicationTemplateContainsSimpleImage())
  {
    v5 = [(NTKLauncherComplicationDataSourceAccessibility *)self safeValueForKey:@"_appTitle"];
    if ([v5 length])
    {
      v6 = [v4 safeValueForKey:@"imageProvider"];
      [v6 setAccessibilityLabel:v5];

      v7 = [v4 safeValueForKey:@"imageProvider"];
      v9 = accessibilityLocalizedString(@"double.tap.to.open.complication.hint", v8);
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v5);
      [v7 setAccessibilityHint:v10];
    }
  }

  return v3;
}

@end