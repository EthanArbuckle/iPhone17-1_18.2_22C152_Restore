@interface LibraryMainViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation LibraryMainViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.LibraryMainViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.LibraryMainViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.LibraryMainViewController", @"setEditing:animated:", "v", "B", "B", 0);
  [v3 validateClass:@"Music.LibraryMainViewController" hasSwiftField:@"$__lazy_storage_$_accountButton" withSwiftType:"Optional<Optional<AccountButtonWrapper>>"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3 = [(LibraryMainViewControllerAccessibility *)self safeSwiftValueForKey:@"$__lazy_storage_$_accountButton"];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityRespondsToUserInteraction:1];
  v4 = accessibilityMusicLocalizedString(@"account");
  [v3 setAccessibilityLabel:v4];

  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v3 _accessibilitySetFKAShouldProcessChildren:0];
  v5.receiver = self;
  v5.super_class = (Class)LibraryMainViewControllerAccessibility;
  [(LibraryMainViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LibraryMainViewControllerAccessibility;
  [(LibraryMainViewControllerAccessibility *)&v3 viewDidLoad];
  [(LibraryMainViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)LibraryMainViewControllerAccessibility;
  [(LibraryMainViewControllerAccessibility *)&v5 setEditing:a3 animated:a4];
  [(LibraryMainViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end