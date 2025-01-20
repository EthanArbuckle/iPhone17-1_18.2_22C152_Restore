@interface MapsDebugCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axContentConfiguration;
- (id)_axSwitch;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MapsDebugCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MapsDebugCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MapsDebugCollectionViewCell" isKindOfClass:@"UICollectionViewListCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MapsDebugCollectionViewCell", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MapsDebugCollectionViewCell", @"detailTextLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCell", @"contentConfiguration", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(MapsDebugCollectionViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"textLabel, detailTextLabel"];
  if (!v3)
  {
    v4 = [(MapsDebugCollectionViewCellAccessibility *)self _axContentConfiguration];
    v5 = v4;
    if (v4)
    {
      v6 = [v4 text];
      v8 = [v5 secondaryText];
      id v3 = __AXStringForVariables();
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (id)accessibilityValue
{
  uint64_t v3 = [(MapsDebugCollectionViewCellAccessibility *)self _axContentConfiguration];
  if (v3
    && (v4 = (void *)v3,
        [(MapsDebugCollectionViewCellAccessibility *)self _axSwitch],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = [(MapsDebugCollectionViewCellAccessibility *)self _axSwitch];
    v7 = [v6 accessibilityValue];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MapsDebugCollectionViewCellAccessibility;
    v7 = [(MapsDebugCollectionViewCellAccessibility *)&v9 accessibilityValue];
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = [(MapsDebugCollectionViewCellAccessibility *)self _axContentConfiguration];
  if (v3
    && (v4 = (void *)v3,
        [(MapsDebugCollectionViewCellAccessibility *)self _axSwitch],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = [(MapsDebugCollectionViewCellAccessibility *)self _axSwitch];
    unint64_t v7 = [v6 accessibilityTraits];

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MapsDebugCollectionViewCellAccessibility;
    return [(MapsDebugCollectionViewCellAccessibility *)&v9 accessibilityTraits];
  }
}

- (id)_accessibilitySupplementaryFooterViews
{
  v11.receiver = self;
  v11.super_class = (Class)MapsDebugCollectionViewCellAccessibility;
  uint64_t v3 = [(MapsDebugCollectionViewCellAccessibility *)&v11 _accessibilitySupplementaryFooterViews];
  v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MapsDebugCollectionViewCellAccessibility *)self _axContentConfiguration];
  if (v5)
  {
    v6 = (void *)v5;
    unint64_t v7 = [(MapsDebugCollectionViewCellAccessibility *)self _axSwitch];
    int v8 = [v4 containsObject:v7];

    if (v8)
    {
      objc_super v9 = [(MapsDebugCollectionViewCellAccessibility *)self _axSwitch];
      [v4 removeObject:v9];
    }
  }

  return v4;
}

- (id)_axSwitch
{
  v2 = [(MapsDebugCollectionViewCellAccessibility *)self _accessibilityFindDescendant:&__block_literal_global_3];
  objc_opt_class();
  uint64_t v3 = __UIAccessibilityCastAsClass();

  return v3;
}

uint64_t __53__MapsDebugCollectionViewCellAccessibility__axSwitch__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axContentConfiguration
{
  objc_opt_class();
  uint64_t v3 = [(MapsDebugCollectionViewCellAccessibility *)self safeValueForKey:@"contentConfiguration"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

@end