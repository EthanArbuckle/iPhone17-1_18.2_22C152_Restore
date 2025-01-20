@interface AXInvertColors_QuickLook
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_QuickLook

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLImageItemViewController", @"loadPreviewControllerWithContents:context:completionHandler:", "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLImageItemViewController", @"previewDidAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"QLListCell", @"setThumbnail:", "v", "@", 0);
  [v3 validateClass:@"QLListCell" hasInstanceVariable:@"_thumbnailView" withType:"UIImageView"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"QLImageItemViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"QLPreviewScrollViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"QLListCellInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end