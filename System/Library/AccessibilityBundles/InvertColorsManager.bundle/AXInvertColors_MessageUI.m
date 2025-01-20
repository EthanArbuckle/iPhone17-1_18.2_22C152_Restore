@interface AXInvertColors_MessageUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_MessageUI

+ (void)performValidations:(id)a3
{
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"MFPhotoPickerCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MFComposeWebViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end