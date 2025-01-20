@interface UIStatusBarBatteryItemAccessibility
@end

@implementation UIStatusBarBatteryItemAccessibility

double __66___UIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke(id *a1)
{
  v29[2] = a1;
  v29[1] = a1;
  v29[0] = objc_loadWeakRetained(a1 + 4);
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  [v29[0] frame];
  r1.origin.x = v1;
  r1.origin.y = v2;
  r1.size.width = v3;
  r1.size.height = v4;
  [WeakRetained frame];
  r2.origin.x = v5;
  r2.origin.y = v6;
  r2.size.width = v7;
  r2.size.height = v8;
  CGRect v27 = CGRectUnion(r1, r2);
  id v19 = (id)[v29[0] superview];
  objc_msgSend(v19, "convertRect:toView:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
  double v21 = v9;
  double v22 = v10;
  double v23 = v11;
  double v24 = v12;

  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = (id)[v29[0] window];
  objc_msgSend(v20, "convertRect:toWindow:", 0, v21, v22, v23, v24);
  *(void *)&long long v30 = v13;
  *((void *)&v30 + 1) = v14;
  *(void *)&long long v31 = v15;
  *((void *)&v31 + 1) = v16;

  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(v29, 0);
  return *(double *)&v30;
}

double __66___UIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke_2(id *a1)
{
  v20[2] = a1;
  v20[1] = a1;
  v20[0] = objc_loadWeakRetained(a1 + 4);
  id v14 = (id)[v20[0] superview];
  [v20[0] frame];
  objc_msgSend(v14, "convertRect:toView:", v1, v2, v3, v4);
  double v16 = v5;
  double v17 = v6;
  double v18 = v7;
  double v19 = v8;

  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = (id)[v20[0] window];
  objc_msgSend(v15, "convertRect:toWindow:", 0, v16, v17, v18, v19);
  *(void *)&long long v21 = v9;
  *((void *)&v21 + 1) = v10;
  *(void *)&long long v22 = v11;
  *((void *)&v22 + 1) = v12;

  objc_storeStrong(v20, 0);
  return *(double *)&v21;
}

@end