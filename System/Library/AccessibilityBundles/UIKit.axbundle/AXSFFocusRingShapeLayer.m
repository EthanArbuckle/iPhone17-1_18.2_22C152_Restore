@interface AXSFFocusRingShapeLayer
+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3;
+ (id)layer;
+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3;
+ (id)selectedLayerForUserInterfaceStyle:(int64_t)a3;
+ (id)selectedParentLayerForUserInterfaceStyle:(int64_t)a3;
- (uint64_t)innerBorder;
- (uint64_t)outerBorder;
- (void)setInnerBorder:(uint64_t)a1;
- (void)setOuterBorder:(uint64_t)a1;
- (void)setPath:(CGPath *)a3;
@end

@implementation AXSFFocusRingShapeLayer

+ (id)layer
{
  v7[2] = a1;
  v7[1] = (id)a2;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AXSFFocusRingShapeLayer;
  v7[0] = objc_msgSendSuper2(&v6, sel_layer);
  id v4 = (id)[MEMORY[0x263F1C550] clearColor];
  uint64_t v2 = [v4 CGColor];
  [v7[0] setFillColor:v2];

  id v5 = v7[0];
  objc_storeStrong(v7, 0);

  return v5;
}

+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3
{
  v27[3] = a1;
  v27[2] = (id)a2;
  v27[1] = (id)a3;
  v27[0] = +[AXSFFocusRingShapeLayer layer];
  id v4 = (id)[MEMORY[0x263F15880] layer];
  -[AXSFFocusRingShapeLayer setInnerBorder:]((uint64_t)v27[0], v4);

  id v7 = (id)[MEMORY[0x263F1C550] blackColor];
  uint64_t v5 = [v7 CGColor];
  id v6 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v27[0]);
  [v6 setStrokeColor:v5];

  id v10 = (id)[MEMORY[0x263F1C550] clearColor];
  uint64_t v8 = [v10 CGColor];
  id v9 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v27[0]);
  [v9 setFillColor:v8];

  id v11 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v27[0]);
  [v11 setLineWidth:3.0];

  id v12 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v27[0]);
  objc_msgSend(v12, "setCornerRadius:");

  id v13 = v27[0];
  id v14 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v27[0]);
  objc_msgSend(v13, "addSublayer:");

  id v15 = (id)[MEMORY[0x263F15880] layer];
  -[AXSFFocusRingShapeLayer setOuterBorder:]((uint64_t)v27[0], v15);

  id v18 = (id)[MEMORY[0x263F1C550] whiteColor];
  uint64_t v16 = [v18 CGColor];
  id v17 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v27[0]);
  [v17 setStrokeColor:v16];

  id v21 = (id)[MEMORY[0x263F1C550] clearColor];
  uint64_t v19 = [v21 CGColor];
  id v20 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v27[0]);
  [v20 setFillColor:v19];

  id v22 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v27[0]);
  [v22 setLineWidth:1.0];

  id v23 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v27[0]);
  [v23 setCornerRadius:5.0];

  id v24 = v27[0];
  id v25 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v27[0]);
  objc_msgSend(v24, "addSublayer:");

  id v26 = v27[0];
  objc_storeStrong(v27, 0);

  return v26;
}

- (void)setInnerBorder:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)innerBorder
{
  if (a1) {
    return *(void *)(a1 + 32);
  }
  else {
    return 0;
  }
}

- (void)setOuterBorder:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (uint64_t)outerBorder
{
  if (a1) {
    return *(void *)(a1 + 40);
  }
  else {
    return 0;
  }
}

+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3
{
  return +[AXSFFocusRingShapeLayer layer];
}

+ (id)selectedLayerForUserInterfaceStyle:(int64_t)a3
{
  return +[AXSFFocusRingShapeLayer focusLayerForUserInterfaceStyle:0];
}

+ (id)selectedParentLayerForUserInterfaceStyle:(int64_t)a3
{
  return +[AXSFFocusRingShapeLayer layer];
}

- (void)setPath:(CGPath *)a3
{
  v33 = self;
  SEL v32 = a2;
  v31 = a3;
  v30.receiver = self;
  v30.super_class = (Class)AXSFFocusRingShapeLayer;
  [(AXSFFocusRingShapeLayer *)&v30 setPath:a3];
  id v7 = v31;
  id v8 = (id)-[AXSFFocusRingShapeLayer outerBorder]((uint64_t)v33);
  [v8 setPath:v7];

  id v29 = (id)[MEMORY[0x263F1C478] bezierPathWithCGPath:v31];
  [v29 bounds];
  CGRect v28 = v34;
  CGRect v27 = CGRectInset(v34, 1.0, 1.0);
  double Width = CGRectGetWidth(v27);
  double v26 = Width / CGRectGetWidth(v28);
  double Height = CGRectGetHeight(v27);
  double v25 = Height / CGRectGetHeight(v28);
  memset(&__b, 0, sizeof(__b));
  __src = (void *)MEMORY[0x263F000D0];
  memcpy(&__dst, MEMORY[0x263F000D0], sizeof(__dst));
  CGAffineTransformScale(&__b, &__dst, v26, v25);
  memcpy(v22, &__b, sizeof(v22));
  [v29 applyTransform:v22];
  [v29 bounds];
  *(void *)&long long v19 = v3;
  *((void *)&v19 + 1) = v4;
  uint64_t v20 = v5;
  uint64_t v21 = v6;
  long long v18 = v19;
  CGPoint origin = v28.origin;
  memset(&v16, 0, sizeof(v16));
  memcpy(&v15, __src, sizeof(v15));
  CGAffineTransformTranslate(&v16, &v15, v28.origin.x - *(double *)&v19 + 1.0, v28.origin.y - *((double *)&v19 + 1) + 1.0);
  memcpy(v14, &v16, sizeof(v14));
  [v29 applyTransform:v14];
  uint64_t v12 = [v29 CGPath];
  id v13 = (id)-[AXSFFocusRingShapeLayer innerBorder]((uint64_t)v33);
  [v13 setPath:v12];

  objc_storeStrong(&v29, 0);
}

- (void).cxx_destruct
{
}

@end