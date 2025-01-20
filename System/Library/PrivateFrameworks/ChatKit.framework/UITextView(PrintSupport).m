@interface UITextView(PrintSupport)
- (void)ck_drawVisibleTextInCurrentContextWithContainerView:()PrintSupport;
- (void)ck_textKit1_drawVisibleTextInCurrentContextWithContainerView:()PrintSupport;
- (void)ck_textKit2_drawVisibleTextInCurrentContextWithContainerView:()PrintSupport;
@end

@implementation UITextView(PrintSupport)

- (void)ck_drawVisibleTextInCurrentContextWithContainerView:()PrintSupport
{
  id v7 = a3;
  v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isTextKit2Enabled];

  if (v5
    && ([a1 textLayoutManager], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(a1, "ck_textKit2_drawVisibleTextInCurrentContextWithContainerView:", v7);
  }
  else
  {
    objc_msgSend(a1, "ck_textKit1_drawVisibleTextInCurrentContextWithContainerView:", v7);
  }
}

- (void)ck_textKit1_drawVisibleTextInCurrentContextWithContainerView:()PrintSupport
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = a3;
  [v4 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v4 textContainerInset];
  double v15 = v14;
  double v17 = v16;
  v18 = [v4 layoutManager];
  objc_msgSend(v5, "convertRect:fromView:", v4, v7, v9, v11, v13);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  [v5 bounds];
  v57.origin.double x = v27;
  v57.origin.double y = v28;
  v57.size.double width = v29;
  v57.size.double height = v30;
  v55.origin.double x = v20;
  v55.origin.double y = v22;
  v55.size.double width = v24;
  v55.size.double height = v26;
  CGRect v56 = CGRectIntersection(v55, v57);
  double x = v56.origin.x;
  double y = v56.origin.y;
  double width = v56.size.width;
  double height = v56.size.height;
  objc_msgSend(v4, "convertPoint:toView:", v5, v7, v9);
  double v36 = v17 + v35;
  double v38 = v15 + v37;
  objc_msgSend(v4, "convertRect:fromView:", v5, x, y, width, height);
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;

  v53[0] = *MEMORY[0x1E4FB0700];
  v47 = [MEMORY[0x1E4F428B8] linkColor];
  v53[1] = *MEMORY[0x1E4FB0808];
  v54[0] = v47;
  v54[1] = &unk_1EDF15FF8;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
  [v4 setLinkTextAttributes:v48];

  v49 = [v18 textContainers];
  v50 = [v49 firstObject];
  uint64_t v51 = objc_msgSend(v18, "glyphRangeForBoundingRect:inTextContainer:", v50, v40 - v17, v42 - v15, v44, v46);
  objc_msgSend(v18, "drawGlyphsForGlyphRange:atPoint:", v51, v52, v36, v38);
}

- (void)ck_textKit2_drawVisibleTextInCurrentContextWithContainerView:()PrintSupport
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [a1 textLayoutManager];

  if (!v6)
  {
    CGFloat v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:a1 file:@"CKTranscriptPrintPageRenderer.m" lineNumber:71 description:@"Unable to draw a text view without a text layout manager."];
  }
  [a1 alpha];
  if (!CKFloatApproximatelyEqualToFloatWithTolerance(v7, 0.0, 0.00000999999975))
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:a1 file:@"CKTranscriptPrintPageRenderer.m" lineNumber:72 description:@"Expected to have an alpha value of 0."];
  }
  [a1 setAlpha:1.0];
  v37[0] = *MEMORY[0x1E4FB0700];
  double v8 = [MEMORY[0x1E4F428B8] linkColor];
  v37[1] = *MEMORY[0x1E4FB0808];
  v38[0] = v8;
  v38[1] = &unk_1EDF15FF8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  [a1 setLinkTextAttributes:v9];

  double v10 = [a1 textLayoutManager];
  [a1 bounds];
  objc_msgSend(v10, "ensureLayoutForBounds:");

  [a1 bounds];
  double v12 = v11;
  double v14 = v13;
  [a1 textContainerInset];
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(a1, "convertPoint:toView:", v5, v12, v14);
  double v20 = v19;
  double v22 = v21;

  double v23 = [a1 textLayoutManager];
  CGFloat v24 = [v23 textViewportLayoutController];
  double v25 = [v24 viewportRange];

  CGFloat v26 = [a1 textLayoutManager];
  CGFloat v27 = [v25 location];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __89__UITextView_PrintSupport__ck_textKit2_drawVisibleTextInCurrentContextWithContainerView___block_invoke;
  v32[3] = &unk_1E5621C60;
  id v33 = v25;
  v34 = a1;
  double v35 = v18 + v20;
  double v36 = v16 + v22;
  id v28 = v25;
  id v29 = (id)[v26 enumerateTextLayoutFragmentsFromLocation:v27 options:4 usingBlock:v32];

  [a1 setAlpha:0.0];
}

@end