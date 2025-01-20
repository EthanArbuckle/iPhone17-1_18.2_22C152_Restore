@interface SUUIImageCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIImageCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIImageCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIViewReuseCollectionViewCell", @"allExistingViews", "@", 0);
  [v3 validateClass:@"SUUIImageView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  char v13 = 0;
  objc_opt_class();
  id v3 = [(SUUIImageCollectionViewCellAccessibility *)self superview];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 collectionViewLayout];
  NSClassFromString(&cfstr_Suuicarouselco.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v12 = self;
    v7 = (void *)MEMORY[0x263F1CEE8];
    v8 = (objc_super *)&v12;
  }
  else
  {
    v11.receiver = self;
    v7 = (void *)MEMORY[0x263F1CF00];
    v8 = &v11;
  }
  v8->super_class = (Class)SUUIImageCollectionViewCellAccessibility;
  unint64_t v9 = *v7 | (unint64_t)[(objc_super *)v8 accessibilityTraits];

  return v9;
}

- (id)accessibilityLabel
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __62__SUUIImageCollectionViewCellAccessibility_accessibilityLabel__block_invoke;
  v36[3] = &unk_265138580;
  v36[4] = self;
  id v3 = [(SUUIImageCollectionViewCellAccessibility *)self _accessibilityFindDescendant:v36];
  v4 = [v3 accessibilityLabel];

  if (!v4)
  {
    char v35 = 0;
    objc_opt_class();
    uint64_t v5 = [(SUUIImageCollectionViewCellAccessibility *)self superview];
    v6 = __UIAccessibilityCastAsClass();

    v7 = [v6 collectionViewLayout];
    NSClassFromString(&cfstr_Suuistorepagec.isa);
    LOBYTE(v5) = objc_opt_isKindOfClass();

    if (v5)
    {
      [v6 subviews];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(v8);
            }
            char v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            NSClassFromString(&cfstr_Suuiproductloc.isa);
            if (objc_opt_isKindOfClass())
            {
              id v14 = v13;
              goto LABEL_13;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v38 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      id v14 = 0;
LABEL_13:

      v15 = [v14 safeValueForKey:@"allExistingViews"];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        while (2)
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v27 + 1) + 8 * j);
            NSClassFromString(&cfstr_Suuiimageview.isa);
            if (objc_opt_isKindOfClass())
            {
              v24 = NSString;
              v25 = accessibilityLocalizedString(@"cover.photo.of.artist");
              v26 = [v21 accessibilityLabel];
              v22 = objc_msgSend(v24, "stringWithFormat:", v25, v26);

              goto LABEL_24;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
    }
  }
  v22 = [v3 accessibilityLabel];
LABEL_24:

  return v22;
}

BOOL __62__SUUIImageCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 0;
  }
  v2 = [a2 accessibilityLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

@end