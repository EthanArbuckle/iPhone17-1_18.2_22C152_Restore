@interface DOCItemCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityIdentifier;
- (id)accessibilityValue;
@end

@implementation DOCItemCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Files.DOCItemCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DOCFullDocumentManagerViewController"];
  [v3 validateClass:@"Files.DOCItemCollectionView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Files.DOCItemCollectionViewController", @"displayMode", "q", 0);
}

- (id)accessibilityIdentifier
{
  return @"File View";
}

- (id)accessibilityValue
{
  if (AXDoesRequestingClientDeserveAutomation())
  {
    id v3 = [(DOCItemCollectionViewAccessibility *)self safeValueForKey:@"delegate"];
    unint64_t v4 = [v3 safeIntegerForKey:@"displayMode"];
    if (v4 > 2) {
      v5 = 0;
    }
    else {
      v5 = off_2651207D8[v4];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DOCItemCollectionViewAccessibility;
    v5 = [(DOCItemCollectionViewAccessibility *)&v7 accessibilityValue];
  }

  return v5;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v5.receiver = self;
  v5.super_class = (Class)DOCItemCollectionViewAccessibility;
  v2 = [(DOCItemCollectionViewAccessibility *)&v5 _accessibilitySupplementaryFooterViews];
  id v3 = [v2 axFilterObjectsUsingBlock:&__block_literal_global_3];

  return v3;
}

BOOL __76__DOCItemCollectionViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

@end