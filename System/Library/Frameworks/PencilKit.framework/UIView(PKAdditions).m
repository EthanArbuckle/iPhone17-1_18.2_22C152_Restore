@interface UIView(PKAdditions)
- (BOOL)PK_isBelowViewInDepth:()PKAdditions;
- (double)PK_convertRect:()PKAdditions fromCoordinateSpace:;
- (double)PK_convertRect:()PKAdditions toCoordinateSpace:;
- (double)PK_convertRect:()PKAdditions toView:;
- (id)PK_enclosingScrollableScrollView;
- (id)pk_autoFadeOutShapePointLayer;
- (id)pk_autoFadeOutShapeRectLayer;
- (uint64_t)PK_convertPoint:()PKAdditions fromCoordinateSpace:;
- (uint64_t)PK_convertPoint:()PKAdditions fromView:;
- (uint64_t)PK_convertPoint:()PKAdditions toCoordinateSpace:;
- (uint64_t)PK_convertPoint:()PKAdditions toView:;
- (uint64_t)PK_convertRect:()PKAdditions fromView:;
@end

@implementation UIView(PKAdditions)

- (id)PK_enclosingScrollableScrollView
{
  id v1 = (id)[a1 superview];
  if (v1)
  {
    v2 = v1;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v2 isScrollEnabled]) {
          break;
        }
      }
      id v1 = (id)[v2 superview];
      v2 = v1;
      if (!v1) {
        goto LABEL_8;
      }
    }
    id v1 = v2;
  }
LABEL_8:

  return v1;
}

- (uint64_t)PK_convertPoint:()PKAdditions fromView:
{
  return objc_msgSend(a3, "PK_convertPoint:toView:", a1);
}

- (uint64_t)PK_convertPoint:()PKAdditions toView:
{
  return objc_msgSend(a1, "PK_convertRect:toView:", a3, a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (double)PK_convertRect:()PKAdditions toView:
{
  id v12 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = a1;
  }
  else
  {
    id v13 = [a1 window];
  }
  v14 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v12;
  }
  else
  {
    id v15 = [v12 window];
  }
  v16 = v15;
  v17 = a1;
  double v18 = a2;
  double v19 = a3;
  double v20 = a4;
  double v21 = a5;
  if (v14 != v16)
  {
    objc_msgSend(a1, "convertRect:toView:", v14, a2, a3, a4, a5);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = (void *)MEMORY[0x1E4FB1D68];
      v31 = [v14 windowScene];
      v32 = [v30 activeTextEffectsWindowForWindowScene:v31];

      if (v32 && v32 != v14)
      {
        objc_msgSend(v32, "convertRect:fromWindow:", v14, v23, v25, v27, v29);
        double v23 = v33;
        double v25 = v34;
        double v27 = v35;
        double v29 = v36;
        id v37 = v32;

        v14 = v37;
      }
    }
    objc_msgSend(v16, "convertRect:toCoordinateSpace:", v14, v23, v25, v27, v29);
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v46 = (void *)MEMORY[0x1E4FB1D68];
      v47 = [v16 windowScene];
      v48 = [v46 activeTextEffectsWindowForWindowScene:v47];

      if (v48)
      {
        objc_msgSend(v48, "convertRect:toWindow:", v16, v23, v25, v27, v29);
        double v39 = v49;
        double v41 = v50;
        double v43 = v51;
        double v45 = v52;
      }
    }
    v17 = v16;
    double v18 = v39;
    double v19 = v41;
    double v20 = v43;
    double v21 = v45;
  }
  objc_msgSend(v17, "convertRect:toView:", v12, v18, v19, v20, v21);
  double v54 = v53;

  return v54;
}

- (uint64_t)PK_convertRect:()PKAdditions fromView:
{
  return objc_msgSend(a3, "PK_convertRect:toView:", a1);
}

- (uint64_t)PK_convertPoint:()PKAdditions toCoordinateSpace:
{
  return objc_msgSend(a1, "PK_convertRect:toCoordinateSpace:", a3, a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (uint64_t)PK_convertPoint:()PKAdditions fromCoordinateSpace:
{
  return objc_msgSend(a1, "PK_convertRect:fromCoordinateSpace:", a3, a4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (double)PK_convertRect:()PKAdditions toCoordinateSpace:
{
  id v12 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "PK_convertRect:toView:", v12, a2, a3, a4, a5);
  }
  else {
    objc_msgSend(v12, "convertRect:fromCoordinateSpace:", a1, a2, a3, a4, a5);
  }
  double v14 = v13;

  return v14;
}

- (double)PK_convertRect:()PKAdditions fromCoordinateSpace:
{
  id v12 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "PK_convertRect:fromView:", v12, a2, a3, a4, a5);
  }
  else {
    objc_msgSend(v12, "convertRect:toCoordinateSpace:", a1, a2, a3, a4, a5);
  }
  double v14 = v13;

  return v14;
}

- (id)pk_autoFadeOutShapeRectLayer
{
  id v1 = objc_msgSend(a1, "pk_autoFadeOutShapePointLayer");
  objc_msgSend(v1, "setBorderColor:", objc_msgSend(v1, "backgroundColor"));
  [v1 setBorderWidth:2.0];
  id v2 = [MEMORY[0x1E4FB1618] clearColor];
  objc_msgSend(v1, "setBackgroundColor:", objc_msgSend(v2, "CGColor"));

  return v1;
}

- (id)pk_autoFadeOutShapePointLayer
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_randomColor");
  id v4 = [v3 colorWithAlphaComponent:0.8];
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  objc_msgSend(v2, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 10.0, 10.0);
  v5 = [a1 layer];
  [v5 addSublayer:v2];

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke;
  block[3] = &unk_1E64C61C0;
  id v7 = v2;
  id v10 = v7;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);

  return v7;
}

- (BOOL)PK_isBelowViewInDepth:()PKAdditions
{
  id v4 = a3;
  id v5 = a1;
  id v6 = v4;
  uint64_t v7 = [v5 superview];
  v8 = (void *)v7;
  if (v6 && v7)
  {
    while (([v6 isDescendantOfView:v8] & 1) == 0)
    {
      id v9 = v8;

      v8 = [v9 superview];

      id v5 = v9;
      if (!v8) {
        goto LABEL_7;
      }
    }
  }
  id v9 = v5;
LABEL_7:
  id v10 = [v6 superview];
  if (!v10 || v10 == v8)
  {
    v11 = v6;
  }
  else
  {
    v11 = v6;
    do
    {
      id v12 = v11;
      v11 = v10;

      id v10 = [v11 superview];
    }
    while (v10 && v10 != v8);
  }

  double v13 = [v8 subviews];
  unint64_t v14 = [v13 indexOfObject:v9];
  id v15 = [v8 subviews];
  BOOL v16 = v14 < [v15 indexOfObject:v11];

  return v16;
}

@end