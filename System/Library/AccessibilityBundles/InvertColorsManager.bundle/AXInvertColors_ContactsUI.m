@interface AXInvertColors_ContactsUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_ContactsUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNAvatarView"];
  [v3 validateClass:@"CNVisualIdentityPickerViewController" conformsToProtocol:@"UICollectionViewDataSource"];
  [v3 validateClass:@"CNVisualIdentityPickerViewController" hasProperty:@"dataSource" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerDataSource", @"isItemAtIndexPathAddItem:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentityAvatarViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentityAvatarViewController", @"contentView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNVisualIdentityPickerViewController", @"collectionView:cellForItemAtIndexPath:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactHeaderStaticDisplayView", @"posterView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactHeaderStaticDisplayView", @"setUpPosterView", "v", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"CNAvatarViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CNContactHeaderStaticDisplayViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CNVisualIdentityPickerViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CNVisualIdentityAvatarViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end