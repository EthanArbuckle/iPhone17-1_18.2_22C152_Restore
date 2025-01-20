@interface _TVCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCellAllowsFocus;
- (id)_accessibilityAncestorFocusParcel;
- (id)_accessibilityFrameDelegate;
- (id)_atvaccessibilityCollectionViewCellSemanticContext;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)prepareForReuse;
@end

@implementation _TVCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TVCollectionViewCell" isKindOfClass:@"TVContainerCollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVContainerCollectionViewCell", @"allowsFocus", "B", 0);
  [v3 validateClass:@"_TVCardFloatingContentView"];
  [v3 validateClass:@"_TVCollectionViewCell" isKindOfClass:@"UICollectionViewCell"];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)_TVCollectionViewCellAccessibility;
  [(_TVCollectionViewCellAccessibility *)&v3 prepareForReuse];
  [(_TVCollectionViewCellAccessibility *)self _accessibilityRemoveValueForKey:@"cachedTextForSubhierarchy"];
}

- (BOOL)_accessibilityCellAllowsFocus
{
  return [(_TVCollectionViewCellAccessibility *)self safeBoolForKey:@"allowsFocus"];
}

- (id)_accessibilityAncestorFocusParcel
{
  if (_accessibilityAncestorFocusParcel_onceToken != -1) {
    dispatch_once(&_accessibilityAncestorFocusParcel_onceToken, &__block_literal_global_1);
  }
  if ([(_TVCollectionViewCellAccessibility *)self isAccessibilityElement]
    && ([(_TVCollectionViewCellAccessibility *)self superview],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) != 0))
  {
    v5 = self;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_TVCollectionViewCellAccessibility;
    v5 = [(_TVCollectionViewCellAccessibility *)&v7 _accessibilityAncestorFocusParcel];
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)_TVCollectionViewCellAccessibility;
  unint64_t v3 = [(_TVCollectionViewCellAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(_TVCollectionViewCellAccessibility *)self isAccessibilityElement];
  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (id)accessibilityLabel
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(_TVCollectionViewCellAccessibility *)self accessibilityUserDefinedLabel];
  if (![v3 length]
    && [(_TVCollectionViewCellAccessibility *)self isAccessibilityElement])
  {
    BOOL v4 = [(_TVCollectionViewCellAccessibility *)self _accessibilityValueForKey:@"cachedTextForSubhierarchy"];

    if (![v4 length])
    {
      [(_TVCollectionViewCellAccessibility *)self _accessibilityCollectionViewCellContentSubviews];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v14;
LABEL_6:
        uint64_t v9 = 0;
        v10 = v4;
        while (1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v4 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "accessibilityLabel", (void)v13);

          if ([v4 length]) {
            break;
          }
          ++v9;
          v10 = v4;
          if (v7 == v9)
          {
            uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
            if (v7) {
              goto LABEL_6;
            }
            break;
          }
        }
      }

      if (![v4 length])
      {
        uint64_t v11 = [(_TVCollectionViewCellAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:0 focusableItems:0 exclusions:0];

        BOOL v4 = (void *)v11;
      }
      [(_TVCollectionViewCellAccessibility *)self _accessibilitySetRetainedValue:v4, @"cachedTextForSubhierarchy", (void)v13 forKey];
    }
    unint64_t v3 = v4;
  }

  return v3;
}

- (id)_accessibilityFrameDelegate
{
  char v11 = 0;
  objc_opt_class();
  unint64_t v3 = [(_TVCollectionViewCellAccessibility *)self safeValueForKey:@"contentView"];
  BOOL v4 = __UIAccessibilityCastAsClass();

  id v5 = [v4 subviews];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    uint64_t v7 = [v4 subviews];
    uint64_t v8 = [v7 firstObject];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVCollectionViewCellAccessibility;
    uint64_t v8 = [(_TVCollectionViewCellAccessibility *)&v10 _accessibilityFrameDelegate];
  }

  return v8;
}

- (id)_atvaccessibilityCollectionViewCellSemanticContext
{
  v2 = [(_TVCollectionViewCellAccessibility *)self safeValueForKey:@"contentView"];
  objc_opt_class();
  unint64_t v3 = [v2 safeValueForKey:@"subviews"];
  BOOL v4 = __UIAccessibilityCastAsClass();

  id v5 = [v4 axFilterObjectsUsingBlock:&__block_literal_global_308];
  uint64_t v6 = [v5 firstObject];

  if (v6) {
    uint64_t v7 = (void *)MEMORY[0x263EFFA78];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

@end