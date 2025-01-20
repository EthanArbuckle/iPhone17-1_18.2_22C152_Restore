@interface AXInvertColors_TextInputUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_TextInputUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionView", @"configurePredictionCell:forCandidate:animated:", "v", "@", "@", "B", 0);
  [v3 validateClass:@"TUIPredictionViewCell" hasProperty:@"candidate" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TIKeyboardCandidate", @"isEmojiCandidate", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionViewCell", @"highlighted", "B", 0);
  [v3 validateClass:@"TUIPredictionViewCell" isKindOfClass:@"UIView"];
  [v3 validateClass:@"TUIEmojiSearchResultsCollectionViewController" isKindOfClass:@"UICollectionViewController"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"TUIPredictionViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"TUIEmojiSearchResultsCollectionViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end