@interface CKLargeHitButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIEdgeInsets)ck_hitTestInsets;
- (void)setCk_hitTestInsets:(UIEdgeInsets)a3;
@end

@implementation CKLargeHitButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(CKLargeHitButton *)self ck_hitTestInsets];
  if (v11 == *(double *)(MEMORY[0x1E4F437F8] + 8)
    && v8 == *MEMORY[0x1E4F437F8]
    && v10 == *(double *)(MEMORY[0x1E4F437F8] + 24)
    && v9 == *(double *)(MEMORY[0x1E4F437F8] + 16))
  {
    v32.receiver = self;
    v32.super_class = (Class)CKLargeHitButton;
    BOOL v29 = -[CKLargeHitButton pointInside:withEvent:](&v32, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    [(CKLargeHitButton *)self bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(CKLargeHitButton *)self ck_hitTestInsets];
    CGFloat v24 = v18 + v23;
    CGFloat v27 = v20 - (v25 + v26);
    v34.size.height = v22 - (v23 + v28);
    v34.origin.double x = v16 + v25;
    v34.origin.double y = v24;
    v34.size.width = v27;
    v33.double x = x;
    v33.double y = y;
    BOOL v29 = CGRectContainsPoint(v34, v33);
  }
  BOOL v30 = v29;

  return v30;
}

- (UIEdgeInsets)ck_hitTestInsets
{
  double top = self->_ck_hitTestInsets.top;
  double left = self->_ck_hitTestInsets.left;
  double bottom = self->_ck_hitTestInsets.bottom;
  double right = self->_ck_hitTestInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCk_hitTestInsets:(UIEdgeInsets)a3
{
  self->_ck_hitTestInsets = a3;
}

@end