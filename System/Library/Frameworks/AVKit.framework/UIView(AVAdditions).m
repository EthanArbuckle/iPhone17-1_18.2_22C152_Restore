@interface UIView(AVAdditions)
- (BOOL)avkit_isInAWindowAndVisible;
- (double)avkit_extendedDynamicRangeGain;
- (double)avkit_overrideLayoutMarginsForCounterRotation;
- (double)avkit_portionOfFrameUnobscuredBySuperviews;
- (id)avkit_ancestorViewPassingTest:()AVAdditions;
- (id)avkit_backdropGroupLeader;
- (id)avkit_hitTestControlForPoint:()AVAdditions withEvent:;
- (uint64_t)avkit_hasFullScreenLayoutClass;
- (uint64_t)avkit_isAncestorOfViewPassingTest:()AVAdditions;
- (uint64_t)avkit_isBeingDismissed;
- (uint64_t)avkit_isBeingPresented;
- (uint64_t)avkit_isBeingScrollTested;
- (uint64_t)avkit_isBeingScrolled;
- (uint64_t)avkit_isBeingScrolledQuickly;
- (uint64_t)avkit_isCompletelyTransparent;
- (uint64_t)avkit_isCounterRotatedForTransition;
- (uint64_t)avkit_isDescendantOfNonPagingScrollView;
- (uint64_t)avkit_isDescendantOfViewPassingTest:()AVAdditions;
- (uint64_t)avkit_isInAScrollView;
- (uint64_t)avkit_isVideoGravityFrozen;
- (uint64_t)avkit_setFrame:()AVAdditions inLayoutDirection:;
- (uint64_t)avkit_wantsAnimatedViewTransitions;
- (void)avkit_hitTestControlForPoint:()AVAdditions withEvent:bestSoFar:shortestDistanceSoFar:;
- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:()AVAdditions;
- (void)avkit_makeSubtreeDisallowGroupBlending;
- (void)avkit_needsUpdateBackdropCaptureViewHidden;
- (void)avkit_reevaluateHiddenStateOfItem:()AVAdditions;
- (void)setAvkit_extendedDynamicRangeGain:()AVAdditions;
@end

@implementation UIView(AVAdditions)

- (void)setAvkit_extendedDynamicRangeGain:()AVAdditions
{
  float v4 = a2;
  float v5 = fabsf(v4);
  uint64_t ExtendedDynamicRangeGainFilter = -[UIView _getExtendedDynamicRangeGainFilterIndex](a1);
  uint64_t v7 = ExtendedDynamicRangeGainFilter;
  if (v4 <= 0.0 || v5 < 0.00000011921)
  {
    if (ExtendedDynamicRangeGainFilter == 0x7FFFFFFFFFFFFFFFLL) {
      return;
    }
    id v21 = [a1 layer];
    v15 = [v21 filters];
    v16 = (void *)[v15 mutableCopy];

    [v16 removeObjectAtIndex:v7];
    if ([v16 count]) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    [v21 setFilters:v17];
  }
  else
  {
    v9 = [a1 layer];
    id v21 = v9;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0C0]];
      [v10 setValue:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F3A0F0]];
      [v10 setName:@"AVExtendedDynamicRangeGain.filter"];
      v11 = [v21 filters];
      v12 = (void *)[v11 mutableCopy];
      v13 = v12;
      if (v12) {
        id v14 = v12;
      }
      else {
        id v14 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      }
      v18 = v14;

      [v18 addObject:v10];
      uint64_t v7 = [v18 count] - 1;
      [v21 setFilters:v18];

      v9 = v21;
    }
    v19 = [v9 filters];
    v16 = [v19 objectAtIndexedSubscript:v7];

    v20 = [NSNumber numberWithDouble:a2];
    [v16 setValue:v20 forKey:*MEMORY[0x1E4F3A100]];
  }
}

- (double)avkit_extendedDynamicRangeGain
{
  uint64_t ExtendedDynamicRangeGainFilter = -[UIView _getExtendedDynamicRangeGainFilterIndex](a1);
  double v3 = 0.0;
  if (ExtendedDynamicRangeGainFilter != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = ExtendedDynamicRangeGainFilter;
    float v5 = [a1 layer];
    v6 = [v5 filters];
    uint64_t v7 = [v6 objectAtIndexedSubscript:v4];

    v8 = [v7 valueForKey:*MEMORY[0x1E4F3A100]];
    [v8 floatValue];
    double v3 = v9;
  }
  return v3;
}

- (uint64_t)avkit_setFrame:()AVAdditions inLayoutDirection:
{
  if (a7 == 1)
  {
    id v12 = a1;
    v13 = [v12 superview];
    [v13 bounds];
    double v15 = v14;

    v16 = [v12 superview];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
      [v17 contentInset];
      double v19 = v18;
      double v21 = v20;
      [v17 bounds];
      double v23 = v22 - (v19 + v21);
      [v17 contentSize];
      double v25 = v24;

      double v15 = v23 + fmax(v25 - v23, 0.0);
    }
    a2 = v15 - a2 - a4;
  }

  return objc_msgSend(a1, "setFrame:", a2, a3, a4, a5);
}

- (double)avkit_portionOfFrameUnobscuredBySuperviews
{
  [a1 bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = [a1 window];
  uint64_t v11 = [a1 superview];
  id v12 = (void *)v11;
  if (v10 && v11)
  {
    CGFloat y = -100000.0;
    CGFloat height = 1000000.0;
    CGFloat width = 1000000.0;
    CGFloat x = -100000.0;
    do
    {
      [v12 bounds];
      objc_msgSend(v12, "convertRect:toView:", 0);
      v32.origin.CGFloat x = v17;
      v32.origin.CGFloat y = v18;
      v32.size.CGFloat width = v19;
      v32.size.CGFloat height = v20;
      v28.origin.CGFloat x = x;
      v28.origin.CGFloat y = y;
      v28.size.CGFloat width = width;
      v28.size.CGFloat height = height;
      CGRect v29 = CGRectIntersection(v28, v32);
      CGFloat x = v29.origin.x;
      CGFloat y = v29.origin.y;
      CGFloat width = v29.size.width;
      CGFloat height = v29.size.height;
      uint64_t v21 = [v12 superview];

      id v12 = (void *)v21;
    }
    while (v21);
    objc_msgSend(a1, "convertRect:toView:", 0, v3, v5, v7, v9);
    v33.origin.CGFloat x = v22;
    v33.origin.CGFloat y = v23;
    v33.size.CGFloat width = v24;
    v33.size.CGFloat height = v25;
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    CGRect v31 = CGRectIntersection(v30, v33);
    objc_msgSend(a1, "convertRect:fromView:", 0, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
    double v3 = v26;
  }

  return v3;
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:()AVAdditions
{
  id v4 = a3;
  id v5 = [a1 superview];
  objc_msgSend(v5, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v4);
}

- (void)avkit_reevaluateHiddenStateOfItem:()AVAdditions
{
  id v4 = a3;
  id v5 = [a1 superview];
  objc_msgSend(v5, "avkit_reevaluateHiddenStateOfItem:", v4);
}

- (uint64_t)avkit_hasFullScreenLayoutClass
{
  v1 = [a1 superview];
  uint64_t v2 = objc_msgSend(v1, "avkit_hasFullScreenLayoutClass");

  return v2;
}

- (void)avkit_makeSubtreeDisallowGroupBlending
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 layer];
  [v2 setAllowsGroupBlending:0];

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v3 = objc_msgSend(a1, "subviews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "avkit_makeSubtreeDisallowGroupBlending");
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (uint64_t)avkit_isDescendantOfNonPagingScrollView
{
  v1 = [a1 superview];
  uint64_t v2 = objc_msgSend(v1, "avkit_isDescendantOfNonPagingScrollView");

  return v2;
}

- (uint64_t)avkit_wantsAnimatedViewTransitions
{
  uint64_t result = [a1 _isInAWindow];
  if (result) {
    return objc_msgSend(a1, "avkit_isBeingScrolledQuickly") ^ 1;
  }
  return result;
}

- (uint64_t)avkit_isInAScrollView
{
  v1 = [a1 superview];
  uint64_t v2 = objc_msgSend(v1, "avkit_isInAScrollView");

  return v2;
}

- (uint64_t)avkit_isBeingScrolledQuickly
{
  v1 = [a1 superview];
  uint64_t v2 = objc_msgSend(v1, "avkit_isBeingScrolledQuickly");

  return v2;
}

- (uint64_t)avkit_isBeingScrolled
{
  v1 = [a1 superview];
  uint64_t v2 = objc_msgSend(v1, "avkit_isBeingScrolled");

  return v2;
}

- (uint64_t)avkit_isBeingScrollTested
{
  v1 = [a1 superview];
  uint64_t v2 = objc_msgSend(v1, "avkit_isBeingScrollTested");

  return v2;
}

- (id)avkit_backdropGroupLeader
{
  v1 = [a1 superview];
  uint64_t v2 = objc_msgSend(v1, "avkit_backdropGroupLeader");

  return v2;
}

- (void)avkit_needsUpdateBackdropCaptureViewHidden
{
  id v1 = [a1 superview];
  objc_msgSend(v1, "avkit_needsUpdateBackdropCaptureViewHidden");
}

- (uint64_t)avkit_isBeingPresented
{
  id v1 = [a1 superview];
  uint64_t v2 = objc_msgSend(v1, "avkit_isBeingPresented");

  return v2;
}

- (uint64_t)avkit_isBeingDismissed
{
  id v1 = [a1 superview];
  uint64_t v2 = objc_msgSend(v1, "avkit_isBeingDismissed");

  return v2;
}

- (uint64_t)avkit_isCounterRotatedForTransition
{
  id v1 = [a1 superview];
  uint64_t v2 = objc_msgSend(v1, "avkit_isCounterRotatedForTransition");

  return v2;
}

- (uint64_t)avkit_isVideoGravityFrozen
{
  id v1 = [a1 superview];
  uint64_t v2 = objc_msgSend(v1, "avkit_isVideoGravityFrozen");

  return v2;
}

- (double)avkit_overrideLayoutMarginsForCounterRotation
{
  uint64_t v2 = [a1 superview];
  if (v2)
  {
    double v3 = [a1 superview];
    objc_msgSend(v3, "avkit_overrideLayoutMarginsForCounterRotation");
    double v5 = v4;
  }
  else
  {
    double v5 = 2.22507386e-308;
  }

  return v5;
}

- (uint64_t)avkit_isCompletelyTransparent
{
  uint64_t v2 = [a1 layer];
  double v3 = [v2 presentationLayer];
  [v3 opacity];
  if (v4 == 0.0)
  {
    uint64_t v6 = 1;
  }
  else
  {
    double v5 = [a1 superview];
    uint64_t v6 = objc_msgSend(v5, "avkit_isCompletelyTransparent");
  }
  return v6;
}

- (BOOL)avkit_isInAWindowAndVisible
{
  if (![a1 _isInAWindow] || (objc_msgSend(a1, "isHiddenOrHasHiddenAncestor") & 1) != 0) {
    return 0;
  }
  double v3 = [a1 window];
  [a1 bounds];
  objc_msgSend(v3, "convertRect:fromView:", a1);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  id v12 = [a1 window];
  [v12 bounds];
  v20.origin.CGFloat x = v13;
  v20.origin.CGFloat y = v14;
  v20.size.CGFloat width = v15;
  v20.size.CGFloat height = v16;
  v18.origin.CGFloat x = v5;
  v18.origin.CGFloat y = v7;
  v18.size.CGFloat width = v9;
  v18.size.CGFloat height = v11;
  CGRect v19 = CGRectIntersection(v18, v20);
  BOOL v2 = !CGRectIsEmpty(v19);

  return v2;
}

- (void)avkit_hitTestControlForPoint:()AVAdditions withEvent:bestSoFar:shortestDistanceSoFar:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  if ([a1 isHidden]) {
    goto LABEL_24;
  }
  if (![a1 isUserInteractionEnabled]) {
    goto LABEL_24;
  }
  [a1 bounds];
  if (CGRectIsEmpty(v53)) {
    goto LABEL_24;
  }
  CGFloat v13 = [a1 layer];
  CGFloat v14 = [v13 presentationLayer];
  [v14 opacity];
  double v16 = v15;

  if (v16 <= 0.05) {
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v12 type] == 11)
  {
    uint64_t v17 = objc_msgSend(a1, "hitTest:withEvent:", v12, a2, a3);
    if ((void *)v17 == a1)
    {
    }
    else
    {
      CGRect v18 = (void *)v17;
      [a1 hitRect];
      v52.CGFloat x = a2;
      v52.CGFloat y = a3;
      BOOL v19 = CGRectContainsPoint(v54, v52);

      if (!v19) {
        goto LABEL_16;
      }
    }
    [a1 bounds];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a1 bounds];
      objc_msgSend(a1, "trackRectForBounds:");
      double v44 = v21;
      double v45 = v20;
      double v23 = v22;
      double v25 = v24;
      [a1 bounds];
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      [a1 value];
      LODWORD(v43) = v34;
      objc_msgSend(a1, "thumbRectForBounds:trackRect:value:", v27, v29, v31, v33, v45, v44, v23, v25, v43);
      [a1 _thumbHitEdgeInsets];
    }
    UIDistanceBetweenPointAndRect();
    UIRoundToViewScale();
    double v36 = v35;
    if (v35 <= *a7)
    {
      *a6 = a1;
      *a7 = v36;
    }
  }
LABEL_16:
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v37 = [a1 subviews];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        objc_msgSend(a1, "convertPoint:toView:", v42, a2, a3);
        objc_msgSend(v42, "avkit_hitTestControlForPoint:withEvent:bestSoFar:shortestDistanceSoFar:", v12, a6, a7);
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v39);
  }

LABEL_24:
}

- (id)avkit_hitTestControlForPoint:()AVAdditions withEvent:
{
  id v5 = 0;
  uint64_t v6 = 0x7FEFFFFFFFFFFFFFLL;
  objc_msgSend(a1, "avkit_hitTestControlForPoint:withEvent:bestSoFar:shortestDistanceSoFar:", a3, &v5, &v6);
  id v3 = v5;

  return v3;
}

- (uint64_t)avkit_isDescendantOfViewPassingTest:()AVAdditions
{
  double v4 = a3;
  if (v4[2](v4, a1))
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = [a1 superview];
    uint64_t v5 = objc_msgSend(v6, "avkit_isDescendantOfViewPassingTest:", v4);
  }
  return v5;
}

- (uint64_t)avkit_isAncestorOfViewPassingTest:()AVAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v4 = a3;
  if (v4[2](v4, a1))
  {
    uint64_t v5 = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = objc_msgSend(a1, "subviews", 0);
    uint64_t v5 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "avkit_isAncestorOfViewPassingTest:", v4))
          {
            uint64_t v5 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v5;
}

- (id)avkit_ancestorViewPassingTest:()AVAdditions
{
  double v4 = a3;
  if (v4[2](v4, a1))
  {
    id v5 = a1;
  }
  else
  {
    uint64_t v6 = [a1 superview];
    objc_msgSend(v6, "avkit_ancestorViewPassingTest:", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end