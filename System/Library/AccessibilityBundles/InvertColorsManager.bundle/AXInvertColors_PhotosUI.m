@interface AXInvertColors_PhotosUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_PhotosUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PHLivePhotoView"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"PHAssetCreationRequest", @"creationRequestForAssetFromScreenshotImage:", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"PHLivePhotoViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PHAssetCreationRequestInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end