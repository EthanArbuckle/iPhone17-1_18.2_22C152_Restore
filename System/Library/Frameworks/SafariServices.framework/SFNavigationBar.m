@interface SFNavigationBar
@end

@implementation SFNavigationBar

void __28___SFNavigationBar_setItem___block_invoke(id *a1)
{
  -[_SFNavigationBar _updatePlaceholderText](a1[4]);
  [a1[4] _updateText];
  [a1[4] _updateShowsLockIcon];
  -[_SFNavigationBar _updateShowsSearchIndicator]((uint64_t)a1[4]);
  -[_SFNavigationBar _updateAccessoryButtonsVisibility]((uint64_t)a1[4]);
  -[_SFNavigationBar _updateMediaStateMuteButton]((id *)a1[4]);
  -[_SFNavigationBar _updateNavigationBarTrailingButtonType]((uint64_t)a1[4]);
  -[_SFNavigationBar _updateTextColor]((uint64_t)a1[4]);
  id v2 = a1[4];
  if (!*((unsigned char *)v2 + 816))
  {
    *((unsigned char *)v2 + 816) = 1;
    [v2 setNeedsLayout];
    id v2 = a1[4];
  }
  [*((id *)v2 + 51) resetDisplay];
  [a1[4] _updateSecurityWarningsVisibility];
  -[_SFNavigationBar _updateProgressView]((uint64_t)a1[4]);
  -[_SFNavigationBar _updateFormatButtonAccessories]((uint64_t)a1[4]);
  if (-[_SFNavigationBar _shouldUpdateBackdropStyleForTransitionFromItem:toItem:]((uint64_t)a1[4], a1[5], a1[6]))
  {
    uint64_t v3 = (uint64_t)a1[4];
    -[_SFNavigationBar _updateEffectiveTheme](v3);
  }
}

uint64_t __51___SFNavigationBar_setDismissButtonStyle_animated___block_invoke(uint64_t a1)
{
  -[SFDismissButton setStyle:](*(void *)(*(void *)(a1 + 32) + 800), *(void *)(a1 + 40));
  [*(id *)(a1 + 32) setNeedsLayout];
  id v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

id __45___SFNavigationBar__dimmingButtonWithAction___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[101] == 1)
    {
      v12 = (void *)MEMORY[0x1E4FB1AE8];
      v13 = objc_msgSend(MEMORY[0x1E4FB1AE0], "sf_shapeForToolbarButton:", v7);
      v14 = v12;
    }
    else
    {
      double v16 = -[SFNavigationBarMetrics urlOutlineCornerRadius](WeakRetained[79]);
      v17 = (void *)MEMORY[0x1E4FB1AE0];
      [v7 frame];
      CGRect v21 = CGRectInset(v20, 2.0, 2.0);
      v13 = objc_msgSend(v17, "shapeWithRoundedRect:cornerRadius:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, v16 + -2.0);
      v14 = (void *)MEMORY[0x1E4FB1AE8];
    }
    v15 = [v14 styleWithEffect:v8 shape:v13];
  }
  else
  {
    v15 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v8 shape:v9];
  }

  return v15;
}

double __48___SFNavigationBar__updateAccessoryButtonsAlpha__block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = -[SFNavigationBarAccessoryButtonArrangement containsButtonType:](*(void *)(*(void *)(a1 + 32) + 720), a2);
  double result = 0.0;
  if (v3)
  {
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 560)) {
      return *(double *)(a1 + 40);
    }
  }
  return result;
}

uint64_t __34___SFNavigationBar_layoutSubviews__block_invoke()
{
  _SFClamp();

  return _SFRoundFloatToPixels();
}

void __34___SFNavigationBar_layoutSubviews__block_invoke_2(uint64_t a1, unint64_t a2)
{
  -[_SFNavigationBar _viewForAccessoryButtonType:](*(void *)(a1 + 32), a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (([v6 isHidden] & 1) == 0)
  {
    -[_SFNavigationBar _widthForAccessoryButtonType:](*(void *)(a1 + 32), a2);
    double v5 = v4;
    objc_msgSend(v6, "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 0.0 + *(double *)(a1 + 48), 0.0, v4, *(double *)(a1 + 56));
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5
                                                                + 0.0
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

void __34___SFNavigationBar_layoutSubviews__block_invoke_3(uint64_t a1, unint64_t a2)
{
  -[_SFNavigationBar _viewForAccessoryButtonType:](*(void *)(a1 + 32), a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (([v6 isHidden] & 1) == 0)
  {
    -[_SFNavigationBar _widthForAccessoryButtonType:](*(void *)(a1 + 32), a2);
    double v5 = v4;
    objc_msgSend(v6, "setFrame:", *(double *)(a1 + 80)+ CGRectGetWidth(*(CGRect *)(a1 + 48))- (v5+ *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)+ 0.0), 0.0, v5, *(double *)(a1 + 88));
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5
                                                                + 0.0
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

void __34___SFNavigationBar_layoutSubviews__block_invoke_4(uint64_t a1)
{
}

uint64_t __34___SFNavigationBar_layoutSubviews__block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 184))
  {
    _SFRoundFloatToPixels();
    double v3 = v2 + *(double *)(a1 + 56);
  }
  else
  {
    double v3 = *(double *)(a1 + 64);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 859)) {
    double v5 = 0.0;
  }
  else {
    double v5 = v3;
  }
  double v6 = *(double *)(a1 + 88) / 0.7;
  [*(id *)(v4 + 448) urlSize];
  if (v6 >= v7)
  {
    [*(id *)(*(void *)(a1 + 32) + 448) urlSize];
    double v8 = v9;
  }
  else
  {
    double v8 = *(double *)(a1 + 88) / 0.7;
  }
  [*(id *)(*(void *)(a1 + 32) + 448) urlSize];
  double v11 = v10;
  uint64_t v12 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v12 + 859))
  {
    int v13 = 1;
  }
  else
  {
    int v13 = [*(id *)(v12 + 864) showsSearchIndicator];
    uint64_t v12 = *(void *)(a1 + 32);
  }
  [*(id *)(v12 + 448) frame];
  double Height = CGRectGetHeight(v36);
  double v15 = 0.0;
  v37.origin.y = 0.0;
  v37.origin.x = v5;
  v37.size.width = v8;
  v37.size.height = v11;
  double v16 = CGRectGetHeight(v37);
  [*(id *)(*(void *)(a1 + 32) + 520) bounds];
  double v17 = CGRectGetWidth(v38) - *(double *)(a1 + 104) + -14.0 - *(double *)(a1 + 112);
  v39.origin.y = 0.0;
  v39.origin.x = v5;
  v39.size.width = v8;
  v39.size.height = v11;
  double v18 = fmin(CGRectGetWidth(v39), v17);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "setFrame:", v5, 0.0, v18, v11);
  [*(id *)(*(void *)(a1 + 32) + 448) setTextAlignmentEdge:v13 ^ 1u];
  v19 = [*(id *)(*(void *)(a1 + 32) + 864) text];
  if (![v19 length])
  {
    [*(id *)(a1 + 32) placeholderHorizontalInset];
    double v15 = v20;
  }

  if ((v13 & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 448) bounds];
    double Width = CGRectGetWidth(v40);
    [*(id *)(*(void *)(a1 + 32) + 448) urlSize];
    double v15 = v15 + v3 + Width - v22;
  }
  _SFCeilingFloatToPixels();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "ss_setUntransformedFrame:", v15, 0.0, v23, *(double *)(*(void *)(a1 + 32) + 496));
  uint64_t v24 = *(void *)(a1 + 32);
  BOOL v25 = *(double *)(a1 + 128) == 0.0 && *(unsigned char *)(v24 + 859) == 0;
  [*(id *)(v24 + 664) setHidden:!v25];
  if (Height != v16)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "lastLineBaselineFrameOriginY", *(double *)&pencilTextInputElementIdentifier_block_invoke_URLBaseline);
    pencilTextInputElementIdentifier_block_invoke_URLBaseline = v26;
  }
  uint64_t v27 = *(void *)(a1 + 32);
  v28 = *(void **)(v27 + 672);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __34___SFNavigationBar_layoutSubviews__block_invoke_6;
  v31[3] = &unk_1E5C734E0;
  v31[4] = v27;
  *(double *)&v31[5] = v5;
  v31[6] = 0;
  *(double *)&v31[7] = v18;
  *(double *)&v31[8] = v11;
  v31[9] = *(void *)(a1 + 128);
  long long v29 = *(_OWORD *)(a1 + 152);
  long long v32 = *(_OWORD *)(a1 + 136);
  long long v33 = v29;
  long long v34 = *(_OWORD *)(a1 + 168);
  BOOL v35 = v25;
  return [v28 enumerateObjectsWithOptions:2 usingBlock:v31];
}

void __34___SFNavigationBar_layoutSubviews__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 size];
  if (v6 != 0.0)
  {
    double v8 = v6;
    double v9 = v7;
    [v5 spacing];
    double v44 = v10;
    int v11 = [v5 centerAligned];
    if (v11)
    {
      [*(id *)(*(void *)(a1 + 32) + 448) frame];
      double MidY = CGRectGetMidY(v46);
    }
    else
    {
      double MidY = *(double *)&pencilTextInputElementIdentifier_block_invoke_URLBaseline;
    }
    if (v11) {
      double v13 = v9 * 0.5;
    }
    else {
      double v13 = v9;
    }
    v14 = objc_msgSend(v5, "view", *(void *)&MidY);
    double v15 = [v14 image];

    double v16 = [v5 view];
    double v17 = [v16 preferredSymbolConfiguration];
    double v18 = [v15 imageWithSymbolConfiguration:v17];

    double v19 = 0.0;
    if ((v11 & 1) == 0)
    {
      [v18 baselineOffsetFromBottom];
      double v19 = v20;
    }
    uint64_t v21 = a3 + 1;
    if (v21 == [*(id *)(*(void *)(a1 + 32) + 672) count])
    {
      CGFloat v22 = *(double *)(a1 + 40);
      CGFloat v23 = *(double *)(a1 + 48);
      CGFloat v25 = *(double *)(a1 + 56);
      CGFloat v24 = *(double *)(a1 + 64);
    }
    else
    {
      uint64_t v26 = [*(id *)(*(void *)(a1 + 32) + 672) objectAtIndexedSubscript:v21];
      [v26 frame];
      CGFloat v22 = v27;
      CGFloat v23 = v28;
      CGFloat v25 = v29;
      CGFloat v24 = v30;
    }
    v47.origin.double x = v22;
    v47.origin.double y = v23;
    v47.size.width = v25;
    v47.size.height = v24;
    double v31 = CGRectGetMinX(v47) - v8 - v44;
    double v32 = v43 + v19 - v13;
    if (*(double *)(a1 + 72) < 1.0)
    {
      long long v33 = *(_OWORD *)(a1 + 96);
      *(_OWORD *)&v45.a = *(_OWORD *)(a1 + 80);
      *(_OWORD *)&v45.c = v33;
      *(_OWORD *)&v45.tdouble x = *(_OWORD *)(a1 + 112);
      double v34 = v31;
      *(double *)&long long v33 = v32;
      double v35 = v8;
      double v36 = v9;
      CGRect v48 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v33 - 8), &v45);
      double x = v48.origin.x;
      double y = v48.origin.y;
      _SFRoundRectToPixels();
      double v31 = v31 + v39 - x;
      double v32 = v32 + v40 - y;
    }
    objc_msgSend(v5, "setFrame:", v31, v32, v8, v9);
    uint64_t v41 = *(unsigned __int8 *)(a1 + 128);
    v42 = [v5 view];
    [v42 setHidden:v41];
  }
}

void __31___SFNavigationBar__updateText__block_invoke(uint64_t a1)
{
  -[_SFNavigationBar _attributedStringSecurityAnnotation](*(id **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 480) setAttributedText:v2];
}

uint64_t __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 859))
  {
    double v3 = *(void **)(v2 + 888);
    uint64_t v4 = [*(id *)(v2 + 864) text];
    if ([v4 length]) {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 712);
    }
    else {
      uint64_t v5 = 0;
    }
    [v3 setAttributedText:v5];

    [*(id *)(*(void *)(a1 + 32) + 424) addSubview:*(void *)(*(void *)(a1 + 32) + 888)];
    -[_SFNavigationBar _updateAccessoryButtonsVisibility](*(void *)(a1 + 32));
    -[_SFNavigationBar _updateTextFieldFrame](*(void *)(a1 + 32));
  }
  else
  {
    [*(id *)(v2 + 432) setHidden:0];
    [*(id *)(*(void *)(a1 + 32) + 680) setUserInteractionEnabled:1];
    -[_SFNavigationBar _updateAccessoryButtonsVisibility](*(void *)(a1 + 32));
  }
  -[_SFNavigationBar _updateAvailabilityAndPageMenuButtonAnimated:](*(void *)(a1 + 32), 0);
  double v6 = *(void **)(*(void *)(a1 + 32) + 888);

  return [v6 setAlpha:0.0];
}

uint64_t __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 859)) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  [*(id *)(v2 + 848) setAlpha:v3];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 648);
  if (*(unsigned char *)(v4 + 859)) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }

  return [v5 setAlpha:v6];
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 859)) {
    [*(id *)(v2 + 728) setHidden:1];
  }
  double v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_5(uint64_t a1)
{
  -[_SFNavigationBar _updateToolbarAndCancelButtonAlpha](*(id **)(a1 + 32));
  -[_SFNavigationBar _updateAccessoryButtonsAlpha](*(id **)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = 0.0;
  if (*(unsigned char *)(v2 + 859)) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  uint64_t v5 = [*(id *)(v2 + 448) contentView];
  [v5 setAlpha:v4];

  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v6 + 859))
  {
    double v3 = (double)[*(id *)(v6 + 864) showsSecurityAnnotation];
    uint64_t v6 = *(void *)(a1 + 32);
  }
  [*(id *)(v6 + 480) setAlpha:v3];
  uint64_t v7 = *(void *)(a1 + 32);
  LOBYTE(v8) = *(unsigned char *)(v7 + 859);
  [*(id *)(v7 + 456) setAlpha:(double)v8];
  if ([*(id *)(*(void *)(a1 + 32) + 864) overrideBarStyleForSecurityWarning])
  {
    uint64_t v9 = *(void *)(a1 + 32);
    -[_SFNavigationBar _updateEffectiveTheme](v9);
  }
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_6(uint64_t a1)
{
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 528))
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 528);
    *(void *)(v5 + 528) = v4;

    uint64_t v7 = *(void *)(a1 + 32);
    unint64_t v8 = *(void **)(v7 + 528);
    uint64_t v9 = [*(id *)(v7 + 888) selectionHighlightColor];
    [v8 setBackgroundColor:v9];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 552))
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 552);
    *(void *)(v11 + 552) = v10;

    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 552);
    double v15 = [*(id *)(v13 + 888) _clearButtonImageForState:0];
    [v14 setImage:v15 forState:0];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  CFAttributedStringRef v16 = [*(id *)(v2 + 456) attributedText];
  double v17 = CTLineCreateWithAttributedString(v16);

  *(CGFloat *)(*(void *)(a1 + 32) + 536) = CTLineGetOffsetForStringIndex(v17, *(void *)(a1 + 48), 0);
  *(CGFloat *)(*(void *)(a1 + 32) + 544) = CTLineGetOffsetForStringIndex(v17, *(void *)(a1 + 56) + *(void *)(a1 + 48), 0);
  CFRelease(v17);
  uint64_t v18 = *(void *)(a1 + 32);
  double v19 = 0.0;
  if (!*(unsigned char *)(v18 + 859)) {
    double v19 = 1.0;
  }
  [*(id *)(v18 + 528) setAlpha:v19];
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void **)(v20 + 552);
  if (*(unsigned char *)(v20 + 859))
  {
    CGAffineTransformMakeScale(&v23, 0.0, 0.0);
  }
  else
  {
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v23.c = v22;
    *(_OWORD *)&v23.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  [v21 setTransform:&v23];
  [*(id *)(*(void *)(a1 + 32) + 680) insertSubview:*(void *)(*(void *)(a1 + 32) + 528) aboveSubview:*(void *)(*(void *)(a1 + 32) + 520)];
  [*(id *)(*(void *)(a1 + 32) + 680) insertSubview:*(void *)(*(void *)(a1 + 32) + 552) belowSubview:*(void *)(*(void *)(a1 + 32) + 520)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_8(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  LOBYTE(a2) = *(unsigned char *)(v3 + 859);
  [*(id *)(v3 + 528) setAlpha:(double)*(unint64_t *)&a2];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 552);
  if (*(unsigned char *)(v4 + 859))
  {
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v8.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v8.c = v6;
    *(_OWORD *)&v8.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v8, 0.0, 0.0);
  }
  return [v5 setTransform:&v8];
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_9(uint64_t a1)
{
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_10(uint64_t a1)
{
  -[_SFNavigationBar _updateFakeViews](*(void *)(a1 + 32));
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

uint64_t __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 624);
  *(unsigned char *)(v2 + 624) = 1;
  uint64_t result = [*(id *)(a1 + 32) layoutBelowIfNeeded];
  *(unsigned char *)(*(void *)(a1 + 32) + 624) = v3;
  return result;
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  char v3 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12_cold_2(a1, v3);
    }
    -[_SFNavigationBar _setHidePlaceholderURLItemsForPencilInput:](*(void *)(a1 + 32), 0);
  }
  else if (v4)
  {
    __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12_cold_1(a1, v3);
  }
  [*(id *)(a1 + 32) setNeedsLayout];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 859))
  {
    -[_SFNavigationBar _updateAccessoryButtonsVisibility](v5);
    [*(id *)(*(void *)(a1 + 32) + 680) setUserInteractionEnabled:0];
    [*(id *)(*(void *)(a1 + 32) + 432) setHidden:1];
    [*(id *)(*(void *)(a1 + 32) + 888) setAlpha:1.0];
  }
  else
  {
    [*(id *)(v5 + 888) removeFromSuperview];
  }
  [*(id *)(*(void *)(a1 + 32) + 528) removeFromSuperview];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 528);
  *(void *)(v6 + 528) = 0;

  [*(id *)(*(void *)(a1 + 32) + 552) removeFromSuperview];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 552);
  *(void *)(v8 + 552) = 0;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke(uint64_t a1)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_2;
  v9[3] = &unk_1E5C724D8;
  uint64_t v10 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_3;
  v8[3] = &unk_1E5C72678;
  v8[4] = v10;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:50331648 delay:v9 options:v8 animations:0.2 completion:0.0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_4;
  v7[3] = &unk_1E5C724D8;
  v7[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4FB1EB0] animateWithDuration:50331648 delay:v7 options:&__block_literal_global_7 animations:0.5 completion:0.0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 728);
  v5[4] = v2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_6;
  v6[3] = &unk_1E5C724D8;
  v6[4] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_7;
  v5[3] = &unk_1E5C72678;
  return [MEMORY[0x1E4FB1EB0] transitionWithView:v3 duration:5242882 options:v6 animations:v5 completion:0.1];
}

uint64_t __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) setAlpha:0.0];
}

uint64_t __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) removeFromSuperview];
}

uint64_t __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 448) contentView];
  [v2 setAlpha:1.0];

  [*(id *)(*(void *)(a1 + 32) + 848) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 840) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 648) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 656) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 464) setAlpha:-[_SFNavigationBar _privateBrowsingLabelRevealPercent](*(double **)(a1 + 32))];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 864) showsSecurityAnnotation];
  if (result)
  {
    BOOL v4 = *(void **)(*(void *)(a1 + 32) + 480);
    return [v4 setAlpha:1.0];
  }
  return result;
}

void __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_6(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 776) = 0;
  -[_SFNavigationBar _formatToggleButtonImage](*(id **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 728) setImage:v2];
}

uint64_t __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke_7(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 728) setHighlightsBackground:0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 728);

  return [v2 setAccessibilityIdentifier:@"PageFormatMenuButton"];
}

uint64_t __65___SFNavigationBar__updateAvailabilityAndPageMenuButtonAnimated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(*(void *)(a1 + 32) + 432) addSubview:*(void *)(*(void *)(a1 + 32) + 472)];
    id v2 = [*(id *)(*(void *)(a1 + 32) + 408) currentLabel];
    [*(id *)(*(void *)(a1 + 32) + 472) setText:v2];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65___SFNavigationBar__updateAvailabilityAndPageMenuButtonAnimated___block_invoke_2;
    v11[3] = &unk_1E5C724D8;
    v11[4] = *(void *)(a1 + 32);
    [MEMORY[0x1E4FB1EB0] animateWithDuration:50331648 delay:v11 options:0 animations:0.2 completion:0.0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65___SFNavigationBar__updateAvailabilityAndPageMenuButtonAnimated___block_invoke_3;
    v10[3] = &unk_1E5C724D8;
    v10[4] = *(void *)(a1 + 32);
    [MEMORY[0x1E4FB1EB0] animateWithDuration:50331648 delay:v10 options:0 animations:0.5 completion:0.06];
    uint64_t v3 = *(void *)(a1 + 40);
    if ((v3 & 0x20) != 0)
    {
      *(void *)(*(void *)(a1 + 32) + 776) = 1;
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if ((v3 & 0x40) != 0) {
        *(void *)(v4 + 776) = 2;
      }
      else {
        *(void *)(v4 + 776) = 0;
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 728) setHighlightsBackground:1];
    [*(id *)(*(void *)(a1 + 32) + 728) setAccessibilityIdentifier:@"ReaderButton"];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 728);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65___SFNavigationBar__updateAvailabilityAndPageMenuButtonAnimated___block_invoke_4;
    v9[3] = &unk_1E5C724D8;
    void v9[4] = v6;
    [MEMORY[0x1E4FB1EB0] transitionWithView:v7 duration:5242882 options:v9 animations:0 completion:0.1];
    double v5 = 0.0;
    if (!*(unsigned char *)(a1 + 48)) {
      double v5 = 0.1;
    }
  }
  else
  {
    double v5 = 0.1;
  }
  return -[_SFNavigationBar _adjustLabelRectForLeadingButtonWithDelay:](*(void *)(a1 + 32), v5);
}

uint64_t __65___SFNavigationBar__updateAvailabilityAndPageMenuButtonAnimated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 448) contentView];
  [v2 setAlpha:0.0];

  [*(id *)(*(void *)(a1 + 32) + 480) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 464) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 848) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 840) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 648) setAlpha:0.0];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 656);

  return [v3 setAlpha:0.0];
}

uint64_t __65___SFNavigationBar__updateAvailabilityAndPageMenuButtonAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) setAlpha:1.0];
}

void __65___SFNavigationBar__updateAvailabilityAndPageMenuButtonAnimated___block_invoke_4(uint64_t a1)
{
  -[_SFNavigationBar _formatToggleButtonImage](*(id **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 728) setImage:v2];
}

uint64_t __62___SFNavigationBar__adjustLabelRectForLeadingButtonWithDelay___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[54];
  if (v3)
  {
    *(unsigned char *)(v3 + 408) = 1;
    id v2 = *(void **)(a1 + 32);
  }
  [v2 setNeedsLayout];
  uint64_t result = [*(id *)(a1 + 32) layoutIfNeeded];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 432);
  if (v5) {
    *(unsigned char *)(v5 + 408) = 0;
  }
  return result;
}

uint64_t __53___SFNavigationBar__updateSecurityWarningsVisibility__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __65___SFNavigationBar_navigationBarURLButtonDidReceivePasteCommand___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [MEMORY[0x1E4F78598] builder];
    uint64_t v6 = [v5 navigationIntentWithText:v7];
    [v4 navigationBar:WeakRetained didProduceNavigationIntent:v6];
  }
}

void __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 560) = a2;
  -[_SFNavigationBar _updateAccessoryButtonsAlpha](*(id **)(a1 + 32));
}

uint64_t __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __53___SFNavigationBar_dragInteraction_sessionWillBegin___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1718];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 _title];
  uint64_t v4 = [v1 previewForURL:v2 title:v3];

  return v4;
}

void __48___SFNavigationBar_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (id *)(*(void *)(a1 + 32) + 904);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained navigationBar:*(void *)(a1 + 32) didProduceNavigationIntent:v4];
  }
}

void __123___SFNavigationBar_animateLinkImage_fromRect_inView_toBarItem_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = MEMORY[0x1E4F14428];
    dispatch_async(v4, v3);
  }
}

void __67___SFNavigationBar_navigationBarItemDidUpdateOverlayConfiguration___block_invoke(uint64_t a1)
{
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 859)) {
    uint64_t v3 = @"YES";
  }
  else {
    uint64_t v3 = @"NO";
  }
  id v4 = v3;
  int v6 = 138543362;
  id v7 = v4;
  OUTLINED_FUNCTION_3_1(&dword_1A690B000, a2, v5, "Not changing placeholder hiding after animation because it wasn't hidden before; expanded: %{public}@",
    (uint8_t *)&v6);
}

void __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 859)) {
    uint64_t v3 = @"YES";
  }
  else {
    uint64_t v3 = @"NO";
  }
  id v4 = v3;
  int v6 = 138543362;
  id v7 = v4;
  OUTLINED_FUNCTION_3_1(&dword_1A690B000, a2, v5, "Unhiding placeholder items since expand animation is complete; expanded: %{public}@",
    (uint8_t *)&v6);
}

@end