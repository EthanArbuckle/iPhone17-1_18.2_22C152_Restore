@interface UIScrollView(SafariServicesExtras)
+ (BOOL)_sf_baseHorizontalScrollIndicatorInsetsExtendFullWidth:()SafariServicesExtras;
+ (BOOL)_sf_baseVerticalScrollIndicatorInsetsExtendFullHeight:()SafariServicesExtras;
+ (double)_sf_baseInsetsForHorizontalScrollIndicatorInScrollViewContainerView:()SafariServicesExtras;
+ (double)_sf_baseInsetsForVerticalScrollIndicatorInScrollViewContainerView:()SafariServicesExtras;
- (BOOL)_sf_isScrolledPastTop;
- (BOOL)_sf_isScrolledToOrPastBottom;
- (uint64_t)_sf_scrollIndicatorInsets;
- (uint64_t)_sf_setScrollIndicatorInsets:()SafariServicesExtras;
- (void)_sf_setContentInsetAdjustments:()SafariServicesExtras;
@end

@implementation UIScrollView(SafariServicesExtras)

+ (double)_sf_baseInsetsForVerticalScrollIndicatorInScrollViewContainerView:()SafariServicesExtras
{
  id v3 = a3;
  char v4 = [v3 _shouldReverseLayoutDirection];
  [v3 bounds];
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;
  CGFloat v9 = CGRectGetHeight(v37) / 3.0;
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  CGRect v39 = CGRectInset(v38, 0.0, v9);
  objc_msgSend(v3, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
  CGFloat v10 = v40.origin.x;
  CGFloat v11 = v40.origin.y;
  CGFloat v12 = v40.size.width;
  CGFloat v13 = v40.size.height;
  if (CGRectIsNull(v40)) {
    goto LABEL_7;
  }
  CGFloat v35 = v11;
  CGFloat v36 = v10;
  CGFloat v33 = v13;
  CGFloat v34 = v12;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  CGFloat v16 = v12;
  CGFloat v17 = v13;
  if (v4)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v14);
    double v19 = 3.0;
  }
  else
  {
    double MinX = CGRectGetMaxX(*(CGRect *)&v14) + -3.0;
    double v19 = -2.0;
  }
  double v20 = MinX + v19;
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v41);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  objc_msgSend(v3, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 5, 1, v20, MinY, 2.0, CGRectGetHeight(v42));
  CGFloat v22 = v43.origin.x;
  CGFloat v23 = v43.origin.y;
  CGFloat v24 = v43.size.width;
  CGFloat v25 = v43.size.height;
  if (CGRectIsNull(v43)) {
    goto LABEL_7;
  }
  v44.origin.CGFloat x = v22;
  v44.origin.CGFloat y = v23;
  v44.size.CGFloat width = v24;
  v44.size.CGFloat height = v25;
  CGRect v45 = CGRectInset(v44, 0.0, 3.0);
  CGFloat v30 = v45.origin.y;
  CGFloat v31 = v45.origin.x;
  CGFloat v29 = v45.size.width;
  CGFloat rect = v45.size.height;
  v45.origin.CGFloat x = v36;
  v45.origin.CGFloat y = v35;
  v45.size.CGFloat width = v34;
  v45.size.CGFloat height = v33;
  CGRectGetMinX(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  CGRectGetMinX(v46);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  CGRectGetMaxX(v47);
  v48.origin.CGFloat x = v36;
  v48.origin.CGFloat y = v35;
  v48.size.CGFloat width = v34;
  v48.size.CGFloat height = v33;
  CGRectGetMaxX(v48);
  v49.origin.CGFloat x = v31;
  v49.origin.CGFloat y = v30;
  v49.size.CGFloat width = v29;
  v49.size.CGFloat height = rect;
  CGRectGetMinY(v49);
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  CGRectGetMinY(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  CGRectGetMaxY(v51);
  v52.origin.CGFloat x = v31;
  v52.origin.CGFloat y = v30;
  v52.size.CGFloat width = v29;
  v52.size.CGFloat height = rect;
  CGRectGetMaxY(v52);
  if (_SFInsetIsInvalid())
  {
LABEL_7:
    double v26 = *MEMORY[0x1E4FB2848];
  }
  else
  {
    _SFRoundEdgeInsetsToPixels();
    double v26 = v28;
  }

  return v26;
}

+ (double)_sf_baseInsetsForHorizontalScrollIndicatorInScrollViewContainerView:()SafariServicesExtras
{
  id v3 = a3;
  [v3 bounds];
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  CGFloat v8 = CGRectGetWidth(v30) / 3.0;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGRect v32 = CGRectInset(v31, v8, 0.0);
  objc_msgSend(v3, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 5, 1, v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  CGFloat v9 = v33.origin.x;
  CGFloat v10 = v33.origin.y;
  CGFloat v11 = v33.size.width;
  CGFloat v12 = v33.size.height;
  if (CGRectIsNull(v33)) {
    goto LABEL_4;
  }
  CGFloat v28 = v10;
  CGFloat v29 = v9;
  v34.origin.CGFloat x = v9;
  v34.origin.CGFloat y = v10;
  CGFloat rect_16 = v12;
  CGFloat rect_24 = v11;
  v34.size.CGFloat width = v11;
  v34.size.CGFloat height = v12;
  CGFloat v13 = CGRectGetMaxY(v34) + -3.0 + -2.0;
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v35);
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  objc_msgSend(v3, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, MinX, v13, CGRectGetWidth(v36), 2.0);
  CGFloat v15 = v37.origin.x;
  CGFloat v16 = v37.origin.y;
  CGFloat v17 = v37.size.width;
  CGFloat v18 = v37.size.height;
  if (CGRectIsNull(v37)) {
    goto LABEL_4;
  }
  v38.origin.CGFloat x = v15;
  v38.origin.CGFloat y = v16;
  v38.size.CGFloat width = v17;
  v38.size.CGFloat height = v18;
  CGRect v39 = CGRectInset(v38, 3.0, 0.0);
  CGFloat rect = v39.origin.x;
  CGFloat v19 = v39.origin.y;
  CGFloat v20 = v39.size.width;
  CGFloat v21 = v39.size.height;
  CGRectGetMinX(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGRectGetMinX(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGRectGetMaxX(v41);
  v42.origin.CGFloat x = rect;
  v42.origin.CGFloat y = v19;
  v42.size.CGFloat width = v20;
  v42.size.CGFloat height = v21;
  CGRectGetMaxX(v42);
  v43.origin.CGFloat x = v29;
  v43.origin.CGFloat y = v28;
  v43.size.CGFloat width = rect_24;
  v43.size.CGFloat height = rect_16;
  CGRectGetMinY(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  CGRectGetMinY(v44);
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  CGRectGetMaxY(v45);
  v46.origin.CGFloat x = v29;
  v46.origin.CGFloat y = v28;
  v46.size.CGFloat width = rect_24;
  v46.size.CGFloat height = rect_16;
  CGRectGetMaxY(v46);
  if (_SFInsetIsInvalid())
  {
LABEL_4:
    double v22 = *MEMORY[0x1E4FB2848];
  }
  else
  {
    _SFRoundEdgeInsetsToPixels();
    double v22 = v24;
  }

  return v22;
}

+ (BOOL)_sf_baseVerticalScrollIndicatorInsetsExtendFullHeight:()SafariServicesExtras
{
  return a3 <= 3.0 && a1 <= 3.0;
}

- (uint64_t)_sf_setScrollIndicatorInsets:()SafariServicesExtras
{
  objc_msgSend(a1, "setHorizontalScrollIndicatorInsets:", *a3, a3[1], a3[2], a3[3]);
  double v5 = a3[4];
  double v6 = a3[5];
  double v7 = a3[6];
  double v8 = a3[7];

  return objc_msgSend(a1, "setVerticalScrollIndicatorInsets:", v5, v6, v7, v8);
}

- (void)_sf_setContentInsetAdjustments:()SafariServicesExtras
{
  objc_getAssociatedObject(a1, (const void *)_sf_setContentInsetAdjustments__lastContentInsetAdjustmentsKey);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  [v29 UIEdgeInsetsValue];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [a1 contentInset];
  double v19 = v18 + a2 - v11;
  double v21 = v20 + a3 - v13;
  double v23 = v22 + a4 - v15;
  double v25 = v24 + a5 - v17;
  double v26 = (const void *)_sf_setContentInsetAdjustments__lastContentInsetAdjustmentsKey;
  v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", a2, a3, a4, a5);
  objc_setAssociatedObject(a1, v26, v27, (void *)1);

  uint64_t v28 = [a1 _isAutomaticContentOffsetAdjustmentEnabled];
  [a1 _setAutomaticContentOffsetAdjustmentEnabled:0];
  objc_msgSend(a1, "setContentInset:", v19, v21, v23, v25);
  [a1 _setAutomaticContentOffsetAdjustmentEnabled:v28];
}

- (BOOL)_sf_isScrolledToOrPastBottom
{
  [a1 bounds];
  double MaxY = CGRectGetMaxY(v7);
  [a1 contentSize];
  double v4 = v3;
  [a1 contentInset];
  return MaxY >= v4 + v5;
}

- (BOOL)_sf_isScrolledPastTop
{
  [a1 contentOffset];
  double v3 = -v2;
  [a1 contentInset];
  return v4 < v3;
}

- (uint64_t)_sf_scrollIndicatorInsets
{
  [a1 horizontalScrollIndicatorInsets];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t result = [a1 verticalScrollIndicatorInsets];
  *a2 = v5;
  a2[1] = v7;
  a2[2] = v9;
  a2[3] = v11;
  a2[4] = v13;
  a2[5] = v14;
  a2[6] = v15;
  a2[7] = v16;
  return result;
}

+ (BOOL)_sf_baseHorizontalScrollIndicatorInsetsExtendFullWidth:()SafariServicesExtras
{
  return a4 <= 3.0 && a2 <= 3.0;
}

@end