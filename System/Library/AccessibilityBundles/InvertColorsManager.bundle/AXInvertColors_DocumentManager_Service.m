@interface AXInvertColors_DocumentManager_Service
+ (id)bundleName;
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_DocumentManager_Service

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"com_apple_DocumentManager_Service.DOCBasicListViewCell"];
  [v3 validateClass:@"com_apple_DocumentManager_Service.DOCBadgedFittingImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"imageView", "@", 0);
  [v3 validateClass:@"com_apple_DocumentManager_Service.DOCBasicListViewCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDocumentBrowserViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDocumentBrowserViewController", @"updateAppearance:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDocumentBrowserViewController", @"browserUserInterfaceStyle", "Q", 0);
  [v3 validateClass:@"UIDocumentBrowserViewController" isKindOfClass:@"UIViewController"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"DocumentManagerService_DOCBadgedFittingImageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"DocumentManagerService_DOCBasicListViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"DocumentManagerService_UIDocumentBrowserViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 3;
}

+ (id)bundleName
{
  return @"com.apple.DocumentManager.Service.appex";
}

@end