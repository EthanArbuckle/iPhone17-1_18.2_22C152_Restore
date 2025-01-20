@interface DBSArrangementLayoutViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (DBSArrangementLayoutViewAccessibility)initWithDataSource:(id)a3;
- (unint64_t)_axDisplayLocation;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetDisplayLocation:(unint64_t)a3;
- (void)placeCurrentDisplayAtLocation:(unint64_t)a3;
@end

@implementation DBSArrangementLayoutViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DBSArrangementLayoutView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_axDisplayLocation
{
  return MEMORY[0x270F0A478](self, &__DBSArrangementLayoutViewAccessibility___axDisplayLocation);
}

- (void)_axSetDisplayLocation:(unint64_t)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DBSArrangementLayoutView" hasProperty:@"northDisplay" withType:"@"];
  [v3 validateClass:@"DBSArrangementLayoutView" hasProperty:@"eastDisplay" withType:"@"];
  [v3 validateClass:@"DBSArrangementLayoutView" hasProperty:@"southDisplay" withType:"@"];
  [v3 validateClass:@"DBSArrangementLayoutView" hasProperty:@"westDisplay" withType:"@"];
  [v3 validateClass:@"DBSNativeDisplayIconView" hasProperty:@"nameField" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DBSArrangementLayoutView", @"initWithDataSource:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DBSArrangementLayoutView", @"placeCurrentDisplayAtLocation:", "v", "Q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)DBSArrangementLayoutViewAccessibility;
  [(DBSArrangementLayoutViewAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [(DBSArrangementLayoutViewAccessibility *)self safeValueForKey:@"northDisplay"];
  v4 = accessibilityLocalizedString(@"arrangement.north");
  [v3 setAccessibilityLabel:v4];

  v5 = [(DBSArrangementLayoutViewAccessibility *)self safeValueForKey:@"eastDisplay"];
  v6 = accessibilityLocalizedString(@"arrangement.east");
  [v5 setAccessibilityLabel:v6];

  v7 = [(DBSArrangementLayoutViewAccessibility *)self safeValueForKey:@"southDisplay"];
  v8 = accessibilityLocalizedString(@"arrangement.south");
  [v7 setAccessibilityLabel:v8];

  v9 = [(DBSArrangementLayoutViewAccessibility *)self safeValueForKey:@"westDisplay"];
  v10 = accessibilityLocalizedString(@"arrangement.west");
  [v9 setAccessibilityLabel:v10];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (DBSArrangementLayoutViewAccessibility)initWithDataSource:(id)a3
{
  id v4 = a3;
  [(DBSArrangementLayoutViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  v7.receiver = self;
  v7.super_class = (Class)DBSArrangementLayoutViewAccessibility;
  v5 = [(DBSArrangementLayoutViewAccessibility *)&v7 initWithDataSource:v4];

  return v5;
}

- (void)placeCurrentDisplayAtLocation:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)DBSArrangementLayoutViewAccessibility;
  -[DBSArrangementLayoutViewAccessibility placeCurrentDisplayAtLocation:](&v12, sel_placeCurrentDisplayAtLocation_);
  if ([(DBSArrangementLayoutViewAccessibility *)self _axDisplayLocation] != a3)
  {
    [(DBSArrangementLayoutViewAccessibility *)self _axSetDisplayLocation:a3];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    v5 = 0;
    if (a3 <= 3)
    {
      v5 = [(DBSArrangementLayoutViewAccessibility *)self safeValueForKey:off_26511D348[a3]];
    }
    v6 = [v5 safeValueForKey:@"nameField"];
    objc_super v7 = [v6 accessibilityLabel];

    v8 = NSString;
    v9 = accessibilityLocalizedString(@"arrangement.announcement");
    v10 = &stru_26F6918F0;
    if (v7) {
      v10 = v7;
    }
    objc_super v11 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v10);

    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

@end