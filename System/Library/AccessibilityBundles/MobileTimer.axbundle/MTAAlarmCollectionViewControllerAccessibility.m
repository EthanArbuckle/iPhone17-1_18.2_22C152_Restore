@interface MTAAlarmCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axDataSource;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation MTAAlarmCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAAlarmCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAAlarmCollectionViewController", @"_removeAlarm:", "v", "@", 0);
  [v3 validateClass:@"MTAAlarmCollectionViewController" isKindOfClass:@"UICollectionViewController"];
  [v3 validateClass:@"MTAAlarmCollectionViewController" hasInstanceVariable:@"_noItemsView" withType:"_UIContentUnavailableView"];
  [v3 validateClass:@"MTAAlarmCollectionViewController" hasInstanceVariable:@"_dataSource" withType:"MTAlarmDataSource"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)MTAAlarmCollectionViewControllerAccessibility;
  [(MTAAlarmCollectionViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)MTAAlarmCollectionViewControllerAccessibility;
  [(MTAAlarmCollectionViewControllerAccessibility *)&v2 viewDidLoad];
}

- (id)_axDataSource
{
  objc_opt_class();
  id v3 = [(MTAAlarmCollectionViewControllerAccessibility *)self safeValueForKey:@"_dataSource"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

@end