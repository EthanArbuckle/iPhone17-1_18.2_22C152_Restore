@interface CNContactListCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)automationElements;
@end

@implementation CNContactListCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactListCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactListViewController", @"suggestionsController", "@", 0);
  [v3 validateClass:@"CNContactSuggestionsViewController" isKindOfClass:@"UIViewController"];
}

- (id)automationElements
{
  v14.receiver = self;
  v14.super_class = (Class)CNContactListCollectionViewAccessibility;
  id v3 = [(CNContactListCollectionViewAccessibility *)&v14 automationElements];
  v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  v7 = v6;

  objc_opt_class();
  v8 = [(CNContactListCollectionViewAccessibility *)self _accessibilityViewController];
  v9 = [v8 safeValueForKey:@"suggestionsController"];
  v10 = __UIAccessibilityCastAsClass();

  v11 = [v10 view];
  v12 = [v11 automationElements];
  [v7 axSafelyAddObjectsFromArray:v12];

  return v7;
}

@end