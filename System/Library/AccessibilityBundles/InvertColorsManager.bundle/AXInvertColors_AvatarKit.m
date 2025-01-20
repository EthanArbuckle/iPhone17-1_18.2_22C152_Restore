@interface AXInvertColors_AvatarKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_AvatarKit

+ (void)performValidations:(id)a3
{
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"AVTRecordViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"AVTViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end