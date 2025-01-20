@interface AXInvertColors_Preferences
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_Preferences

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSTableCell", @"setIcon:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUIKSearchResultCollectionViewSectionHeader", @"_commonInit", "v", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"PSTableCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SUIKSearchResultCollectionViewSectionHeaderInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end