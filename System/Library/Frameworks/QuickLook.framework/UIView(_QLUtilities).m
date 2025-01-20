@interface UIView(_QLUtilities)
- (void)QL_setAnchorPointAndUpdatePosition:()_QLUtilities;
@end

@implementation UIView(_QLUtilities)

- (void)QL_setAnchorPointAndUpdatePosition:()_QLUtilities
{
  [a1 bounds];
  double v7 = a2 * v6;
  [a1 bounds];
  double v9 = a3 * v8;
  [a1 bounds];
  double v11 = v10;
  v12 = [a1 layer];
  [v12 anchorPoint];
  double v14 = v11 * v13;
  [a1 bounds];
  double v16 = v15;
  v17 = [a1 layer];
  [v17 anchorPoint];
  double v19 = v16 * v18;

  [a1 transform];
  double v20 = v41 + v9 * v39 + v37 * v7;
  double v21 = v42 + v9 * v40 + v38 * v7;
  [a1 transform];
  double v22 = v35 + v19 * v33 + v31 * v14;
  double v23 = v36 + v19 * v34 + v32 * v14;
  v24 = [a1 layer];
  [v24 position];
  double v26 = v25;
  double v28 = v27;

  v29 = [a1 layer];
  objc_msgSend(v29, "setPosition:", v20 + v26 - v22, v21 + v28 - v23);

  v30 = [a1 layer];
  objc_msgSend(v30, "setAnchorPoint:", a2, a3);
}

@end