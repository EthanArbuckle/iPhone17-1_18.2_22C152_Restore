@interface UISheetPresentationController(CKForwardDeclare_112106558_ForSwift)
- (double)_ck_exteriorDismissPadding;
- (uint64_t)_ck_setExteriorDismissPadding:()CKForwardDeclare_112106558_ForSwift;
@end

@implementation UISheetPresentationController(CKForwardDeclare_112106558_ForSwift)

- (double)_ck_exteriorDismissPadding
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }

  [a1 _exteriorDismissPadding];
  return result;
}

- (uint64_t)_ck_setExteriorDismissPadding:()CKForwardDeclare_112106558_ForSwift
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return [a1 _setExteriorDismissPadding:a2];
  }
  return result;
}

@end