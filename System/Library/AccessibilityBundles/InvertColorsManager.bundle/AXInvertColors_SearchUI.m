@interface AXInvertColors_SearchUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_SearchUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SearchUIImageView"];
  [v3 validateClass:@"SearchUIImageView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SearchUITableViewCell" isKindOfClass:@"UITableViewCell"];
  [v3 validateClass:@"UITableViewCell" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SearchUILabel" isKindOfClass:@"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUITableViewCell", @"supportsRecycling", "B", 0);
  [v3 validateClass:@"SearchUIResultsCollectionViewController" isKindOfClass:@"SearchUICollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUICollectionViewController", @"cellForRowModel:atIndexPath:", "@", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"SearchUITableViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SearchUIHomeScreenAppIconViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SearchUIImageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SearchUIResultsCollectionViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end