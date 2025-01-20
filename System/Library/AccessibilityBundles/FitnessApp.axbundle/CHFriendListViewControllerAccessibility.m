@interface CHFriendListViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CHFriendListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHFriendListViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHFriendListViewController" hasInstanceVariable:@"_sortBarButtonItem" withType:"UIBarButtonItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHFriendListViewController", @"viewDidLoad", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)CHFriendListViewControllerAccessibility;
  [(CHFriendListViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(CHFriendListViewControllerAccessibility *)self safeValueForKey:@"_sortBarButtonItem"];
  v4 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v4);
  [v4 _setAccessibilityLabelBlock:&__block_literal_global];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __85__CHFriendListViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_18448;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityValueBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

NSString *__cdecl __85__CHFriendListViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id a1)
{
  return (NSString *)accessibilityLocalizedString(@"sort.by.options");
}

id __85__CHFriendListViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained title];

  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CHFriendListViewControllerAccessibility;
  [(CHFriendListViewControllerAccessibility *)&v3 viewDidLoad];
  [(CHFriendListViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end