@interface AXInvertColors_MediaControls
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_MediaControls

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsHeaderView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsMaterialView", @"_setContinuousCornerRadius:", "v", "d", 0);
  [v3 validateClass:@"MediaControlsHeaderView" hasInstanceVariable:@"_artworkView" withType:"UIImageView"];
  [v3 validateClass:@"MediaControlsMaterialView" hasInstanceVariable:@"_backgroundView" withType:"UIView"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"MediaControlsHeaderViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MediaControlsMaterialViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"MRUArtworkViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end