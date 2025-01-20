@interface MOSuggestionSheetInterstitialViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityViewIsModal;
@end

@implementation MOSuggestionSheetInterstitialViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MomentsUIService.MOSuggestionSheetInterstitialView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end