@interface PXPeopleStripCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PXPeopleStripCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPeopleStripCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPeopleStripCollectionViewCell", @"people", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHPerson", @"displayName", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  char v19 = 0;
  objc_opt_class();
  id v3 = [(PXPeopleStripCollectionViewCellAccessibility *)self safeValueForKey:@"people"];
  v4 = __UIAccessibilityCastAsClass();

  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (!v6)
  {

LABEL_11:
    v8 = accessibilityPhotosUICoreLocalizedString(@"people.name.unknown");
    goto LABEL_12;
  }
  uint64_t v7 = v6;
  v8 = 0;
  uint64_t v9 = *(void *)v16;
  do
  {
    uint64_t v10 = 0;
    v11 = v8;
    do
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "safeStringForKey:", @"displayName", v13, v14, (void)v15);
      v14 = @"__AXStringForVariablesSentinel";
      v8 = __UIAXStringForVariables();

      ++v10;
      v11 = v8;
    }
    while (v7 != v10);
    uint64_t v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16, v13, @"__AXStringForVariablesSentinel");
  }
  while (v7);

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end