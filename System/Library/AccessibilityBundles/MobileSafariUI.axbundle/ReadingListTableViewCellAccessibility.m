@interface ReadingListTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityDeleteReadingListItem;
- (id)_privateAccessibilityCustomActions;
@end

@implementation ReadingListTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ReadingListTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ReadingListTableViewCell", @"siteName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ReadingListTableViewCell", @"previewText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ReadingListViewController", @"_readingListItemAtIndexPathDelete:", "v", "@", 0);
}

- (id)_privateAccessibilityCustomActions
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F1C390]);
  v4 = accessibilityLocalizedString(@"delete");
  v5 = (void *)[v3 initWithName:v4 target:self selector:sel__accessibilityDeleteReadingListItem];

  [v5 setSortPriority:*MEMORY[0x263F81158]];
  v6 = _UIAccessibilityCustomActionDeleteImage();
  [v5 setImage:v6];

  v9[0] = v5;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  return v7;
}

- (BOOL)_accessibilityDeleteReadingListItem
{
  v2 = [(ReadingListTableViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  id v3 = [v2 dataSource];
  char v4 = objc_opt_respondsToSelector();
  if (v4)
  {
    id v6 = v3;
    AXPerformSafeBlock();
  }
  return v4 & 1;
}

void __76__ReadingListTableViewCellAccessibility__accessibilityDeleteReadingListItem__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) _accessibilityIndexPath];
  [v1 _readingListItemAtIndexPathDelete:v2];
}

@end