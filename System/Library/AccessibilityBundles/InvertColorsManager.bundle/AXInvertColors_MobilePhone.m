@interface AXInvertColors_MobilePhone
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_MobilePhone

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PHBottomBarButton"];
  [v3 validateClass:@"PHHandsetDialerNumberPadButton" isKindOfClass:@"UIView"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"PHBottomBarButton__MobilePhone__InvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PHHandsetDialerNumberPadButtonInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 2;
}

@end