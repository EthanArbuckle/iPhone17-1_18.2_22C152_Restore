@interface InCallControlsCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetupSidebar;
- (void)viewDidLoad;
@end

@implementation InCallControlsCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.InCallControlsCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ConversationKit.InCallControlsCollectionViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"ConversationKit.InCallControlsCollectionViewController" hasSwiftField:@"collectionView" withSwiftType:"Optional<UICollectionView>"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)InCallControlsCollectionViewControllerAccessibility;
  [(InCallControlsCollectionViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  -[InCallControlsCollectionViewControllerAccessibility _accessibilitySetupSidebar](self);
}

- (void)_accessibilitySetupSidebar
{
  if (a1)
  {
    id v2 = [a1 safeSwiftValueForKey:@"collectionView"];
    v1 = accessibilityLocalizedString(@"call.sidebar.label");
    [v2 setAccessibilityLabel:v1];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)InCallControlsCollectionViewControllerAccessibility;
  [(InCallControlsCollectionViewControllerAccessibility *)&v3 viewDidLoad];
  -[InCallControlsCollectionViewControllerAccessibility _accessibilitySetupSidebar](self);
}

@end