@interface AXInvertColors_AppStore
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_AppStore

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AppStore.VideoView"];
  [v3 validateClass:@"AppStore.AccountButton"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"UberedCollectionViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"VideoViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"AppStoreAccountButtonInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 2;
}

@end