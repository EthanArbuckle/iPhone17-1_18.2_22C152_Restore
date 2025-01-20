@interface SFPersonCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityRoleDescription;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation SFPersonCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFPersonCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFPersonCollectionViewCell" hasInstanceVariable:@"_secondLabel" withType:"UILabel"];
  [v3 validateClass:@"SFPersonCollectionViewCell" hasInstanceVariable:@"_nameLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFPersonCollectionViewCell", @"cellState", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFPersonCollectionViewCell", @"circleProgressView", "@", 0);
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(@"person.airdrop.label");
}

- (id)accessibilityLabel
{
  id v3 = [(SFPersonCollectionViewCellAccessibility *)self safeValueForKey:@"_secondLabel"];
  if ([v3 _accessibilityViewIsVisible])
  {
    v4 = [(SFPersonCollectionViewCellAccessibility *)self safeValueForKey:@"_secondLabel"];
    v5 = [v4 accessibilityLabel];
  }
  else
  {
    v5 = 0;
  }

  v6 = [(SFPersonCollectionViewCellAccessibility *)self safeValueForKey:@"_nameLabel"];
  v7 = [v6 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (id)accessibilityValue
{
  if ([(SFPersonCollectionViewCellAccessibility *)self safeIntegerForKey:@"cellState"] == 3)
  {
    id v3 = [(SFPersonCollectionViewCellAccessibility *)self safeValueForKey:@"circleProgressView"];
    v4 = [v3 accessibilityValue];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SFPersonCollectionViewCellAccessibility;
    v4 = [(SFPersonCollectionViewCellAccessibility *)&v6 accessibilityValue];
  }

  return v4;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"person.airdrop.hint");
}

@end