@interface UIScrollView(DOCExtensions)
- (double)doc_verticalOverlapIntoSafeAreaForView:()DOCExtensions usingKeyboardInfo:;
- (uint64_t)doc_adjustForAutomaticKeyboardInfo:()DOCExtensions animated:lastAdjustment:;
- (uint64_t)doc_automaticContentOffsetAdjustmentDisabledCount;
- (void)doc_setAutomaticContentOffsetAdjustmentDisabledCount:()DOCExtensions;
@end

@implementation UIScrollView(DOCExtensions)

- (void)doc_setAutomaticContentOffsetAdjustmentDisabledCount:()DOCExtensions
{
  if (a3 < 0)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"UIScrollView+DOCExtensions.m" lineNumber:20 description:@"Unbalanced calls to begin/endDisablingAutomaticContentOffsetAdjustment detected"];
  }
  id v7 = [NSNumber numberWithInteger:a3];
  objc_setAssociatedObject(a1, &doc_automaticContentOffsetAdjustmentDisabledCountKey, v7, (void *)0x301);
}

- (uint64_t)doc_automaticContentOffsetAdjustmentDisabledCount
{
  uint64_t v1 = objc_getAssociatedObject(a1, &doc_automaticContentOffsetAdjustmentDisabledCountKey);
  v2 = (void *)v1;
  v3 = &unk_26DF540A0;
  if (v1) {
    v3 = (void *)v1;
  }
  id v4 = v3;

  uint64_t v5 = [v4 integerValue];
  return v5;
}

- (uint64_t)doc_adjustForAutomaticKeyboardInfo:()DOCExtensions animated:lastAdjustment:
{
  double v7 = *a5;
  uint64_t result = objc_msgSend(a1, "doc_verticalOverlapIntoSafeAreaForView:usingKeyboardInfo:", a1, a3);
  if (v7 != v9)
  {
    *a5 = v9;
    double v10 = v9 - v7;
    [a1 contentInset];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v10 + v17;
    objc_msgSend(a1, "setContentInset:");
    return objc_msgSend(a1, "setScrollIndicatorInsets:", v12, v14, v18, v16);
  }
  return result;
}

- (double)doc_verticalOverlapIntoSafeAreaForView:()DOCExtensions usingKeyboardInfo:
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v50 = [v7 objectForKey:*MEMORY[0x263F837B8]];
    [v50 CGRectValue];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [a1 window];
    double v18 = [v17 windowScene];
    v19 = [v18 coordinateSpace];
    v20 = [a1 window];
    v21 = [v20 windowScene];
    v22 = [v21 screen];
    v23 = [v22 coordinateSpace];
    objc_msgSend(v19, "convertRect:fromCoordinateSpace:", v23, v10, v12, v14, v16);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    v32 = [a1 window];
    v33 = [v32 windowScene];
    v34 = [v33 coordinateSpace];
    objc_msgSend(v34, "convertRect:toCoordinateSpace:", v6, v25, v27, v29, v31);
    CGFloat v36 = v35;
    double v38 = v37;
    CGFloat v40 = v39;
    double v42 = v41;

    [a1 safeAreaInsets];
    double v44 = v42 - v43;
    [a1 safeAreaInsets];
    double v46 = v38 + v45;
  }
  else
  {
    CGFloat v36 = *MEMORY[0x263F001A8];
    double v46 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v40 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v44 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  v51.origin.x = v36;
  v51.origin.y = v46;
  v51.size.width = v40;
  v51.size.height = v44;
  double v47 = 0.0;
  if (!CGRectIsEmpty(v51))
  {
    [v6 bounds];
    double MaxY = CGRectGetMaxY(v52);
    v53.origin.x = v36;
    v53.origin.y = v46;
    v53.size.width = v40;
    v53.size.height = v44;
    double v47 = fmax(MaxY - CGRectGetMinY(v53), 0.0);
  }

  return v47;
}

@end