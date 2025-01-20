@interface CKUIBehaviorPhone
- (CGSize)detonatedItemBalloonViewSize;
- (CGSize)detonatedItemDocumentIconSize;
- (double)welcomeViewContentViewLeadingAnchorLayoutConstraintConstant;
- (double)welcomeViewContentViewTopAnchorLayoutConstraintConstant;
- (double)whatsNewViewBulletPointSymbolLeadingAnchorLayoutConstraintConstant;
- (double)whatsNewViewBulletPointTextTrailingAnchorLayoutConstraintConstant;
- (id)whatsNewViewApplePayImage;
@end

@implementation CKUIBehaviorPhone

- (double)welcomeViewContentViewLeadingAnchorLayoutConstraintConstant
{
  v7.receiver = self;
  v7.super_class = (Class)CKUIBehaviorPhone;
  [(CKUIBehavior *)&v7 welcomeViewContentViewLeadingAnchorLayoutConstraintConstant];
  double v3 = v2;
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  uint64_t v5 = objc_msgSend(v4, "ck_screenSizeCategory");

  double result = 16.0;
  if (v5 != 1) {
    return v3;
  }
  return result;
}

- (double)welcomeViewContentViewTopAnchorLayoutConstraintConstant
{
  v7.receiver = self;
  v7.super_class = (Class)CKUIBehaviorPhone;
  [(CKUIBehavior *)&v7 welcomeViewContentViewTopAnchorLayoutConstraintConstant];
  double v3 = v2;
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  uint64_t v5 = objc_msgSend(v4, "ck_screenSizeCategory");

  double result = 88.0;
  if (v5 != 4) {
    return v3;
  }
  return result;
}

- (double)whatsNewViewBulletPointSymbolLeadingAnchorLayoutConstraintConstant
{
  v7.receiver = self;
  v7.super_class = (Class)CKUIBehaviorPhone;
  [(CKUIBehavior *)&v7 whatsNewViewBulletPointSymbolLeadingAnchorLayoutConstraintConstant];
  double v3 = v2;
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  uint64_t v5 = objc_msgSend(v4, "ck_screenSizeCategory");

  double result = 16.0;
  if (v5 != 1) {
    return v3;
  }
  return result;
}

- (double)whatsNewViewBulletPointTextTrailingAnchorLayoutConstraintConstant
{
  v7.receiver = self;
  v7.super_class = (Class)CKUIBehaviorPhone;
  [(CKUIBehavior *)&v7 whatsNewViewBulletPointTextTrailingAnchorLayoutConstraintConstant];
  double v3 = v2;
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  uint64_t v5 = objc_msgSend(v4, "ck_screenSizeCategory");

  double result = 16.0;
  if (v5 != 1) {
    return v3;
  }
  return result;
}

- (id)whatsNewViewApplePayImage
{
  v7.receiver = self;
  v7.super_class = (Class)CKUIBehaviorPhone;
  double v2 = [(CKUIBehavior *)&v7 whatsNewViewApplePayImage];
  double v3 = [MEMORY[0x1E4F42D90] mainScreen];
  uint64_t v4 = objc_msgSend(v3, "ck_screenSizeCategory");

  if (v4 == 4)
  {
    uint64_t v5 = [MEMORY[0x1E4F42A80] ckImageNamed:@"CKSurfEducationScreen_D22"];

    double v2 = (void *)v5;
  }

  return v2;
}

- (CGSize)detonatedItemBalloonViewSize
{
  if (detonatedItemBalloonViewSize_once != -1) {
    dispatch_once(&detonatedItemBalloonViewSize_once, &__block_literal_global_5715);
  }
  double v2 = *(double *)&detonatedItemBalloonViewSize_sBehavior_0;
  double v3 = *(double *)&detonatedItemBalloonViewSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __49__CKUIBehaviorPhone_detonatedItemBalloonViewSize__block_invoke()
{
  detonatedItemBalloonViewSize_sBehavior_0 = 0x4064000000000000;
  detonatedItemBalloonViewSize_sBehavior_1 = 0x405E000000000000;
}

- (CGSize)detonatedItemDocumentIconSize
{
  if (detonatedItemDocumentIconSize_once != -1) {
    dispatch_once(&detonatedItemDocumentIconSize_once, &__block_literal_global_5717);
  }
  double v2 = *(double *)&detonatedItemDocumentIconSize_sBehavior_0;
  double v3 = *(double *)&detonatedItemDocumentIconSize_sBehavior_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __50__CKUIBehaviorPhone_detonatedItemDocumentIconSize__block_invoke()
{
  detonatedItemDocumentIconSize_sBehavior_0 = 0x404B000000000000;
  detonatedItemDocumentIconSize_sBehavior_1 = 0x404E000000000000;
}

@end