@interface CAMView
+ (void)animateIfNeededWithDuration:(double)a3 animations:(id)a4;
+ (void)animateIfNeededWithDuration:(double)a3 animations:(id)a4 completion:(id)a5;
+ (void)animateIfNeededWithDuration:(double)a3 options:(unint64_t)a4 animations:(id)a5 completion:(id)a6;
+ (void)animateIfNeededWithDuration:(double)a3 usingSpringWithDamping:(double)a4 initialSpringVelocity:(double)a5 options:(unint64_t)a6 animations:(id)a7 completion:(id)a8;
+ (void)ceilBounds:(CGRect *)a3 andRoundCenter:(CGPoint *)a4 toViewScale:(id)a5;
+ (void)convertRect:(CGRect)a3 toCeiledBounds:(CGRect *)a4 andRoundedCenter:(CGPoint *)a5 toViewScale:(id)a6;
+ (void)rotateView:(id)a3 toInterfaceOrientation:(int64_t)a4 animated:(BOOL)a5;
+ (void)setBorderColor:(id)a3 forView:(id)a4;
+ (void)setBorderColor:(id)a3 width:(double)a4 forView:(id)a5;
+ (void)setBorderForView:(id)a3;
@end

@implementation CAMView

+ (void)ceilBounds:(CGRect *)a3 andRoundCenter:(CGPoint *)a4 toViewScale:(id)a5
{
  if (a3 && a4)
  {
    CGPoint origin = a3->origin;
    id v7 = a5;
    UICeilToViewScale();
    double v9 = v8;
    CGFloat v24 = v8;
    UICeilToViewScale();
    CGFloat v23 = v10;
    double x = a4->x;
    double y = a4->y;
    double v13 = v9 * 0.5;
    CGFloat v14 = a4->x - v13;
    double v15 = v10 * 0.5;
    double v16 = y - v10 * 0.5;
    UIRoundToViewScale();
    double v18 = v17;
    UIRoundToViewScale();
    double v20 = v19;

    double v21 = v13 + v18;
    if (v18 == v14) {
      double v21 = x;
    }
    double v22 = v15 + v20;
    a3->CGPoint origin = origin;
    if (v20 == v16) {
      double v22 = y;
    }
    a3->size.width = v24;
    a3->size.height = v23;
    a4->double x = v21;
    a4->double y = v22;
  }
}

+ (void)convertRect:(CGRect)a3 toCeiledBounds:(CGRect *)a4 andRoundedCenter:(CGPoint *)a5 toViewScale:(id)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGPoint v16 = (CGPoint)*MEMORY[0x263F00148];
  v17.CGFloat width = a3.size.width;
  v17.CGFloat height = a3.size.height;
  id v12 = a6;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  v15.CGFloat x = MidX;
  v15.CGFloat y = CGRectGetMidY(v19);
  +[CAMView ceilBounds:&v16 andRoundCenter:&v15 toViewScale:v12];

  if (a4)
  {
    CGSize v14 = v17;
    a4->CGPoint origin = v16;
    a4->size = v14;
  }
  if (a5) {
    *a5 = v15;
  }
}

+ (void)rotateView:(id)a3 toInterfaceOrientation:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v11[1] = 3221225472;
  v11[0] = MEMORY[0x263EF8330];
  v11[2] = __54__CAMView_rotateView_toInterfaceOrientation_animated___block_invoke;
  v11[3] = &unk_263FA04E0;
  if (v5) {
    double v9 = 0.3;
  }
  else {
    double v9 = 0.0;
  }
  id v12 = v8;
  int64_t v13 = a4;
  id v10 = v8;
  [a1 animateIfNeededWithDuration:2 options:v11 animations:0 completion:v9];
}

uint64_t __54__CAMView_rotateView_toInterfaceOrientation_animated___block_invoke(uint64_t a1)
{
  CAMOrientationTransform(*(void *)(a1 + 40), (uint64_t)v5);
  v2 = *(void **)(a1 + 32);
  v4[0] = v5[0];
  v4[1] = v5[1];
  v4[2] = v5[2];
  return [v2 setTransform:v4];
}

+ (void)animateIfNeededWithDuration:(double)a3 usingSpringWithDamping:(double)a4 initialSpringVelocity:(double)a5 options:(unint64_t)a6 animations:(id)a7 completion:(id)a8
{
  id v13 = a8;
  id v15 = v13;
  if (a3 == 0.0)
  {
    (*((void (**)(id, id))a7 + 2))(a7, v13);
    CGSize v14 = v15;
    if (!v15) {
      goto LABEL_6;
    }
    (*((void (**)(void))v15 + 2))();
  }
  else
  {
    [MEMORY[0x263F82E00] animateWithDuration:a6 delay:a7 usingSpringWithDamping:v13 initialSpringVelocity:a3 options:0.0 animations:a4 completion:a5];
  }
  CGSize v14 = v15;
LABEL_6:
}

+ (void)animateIfNeededWithDuration:(double)a3 options:(unint64_t)a4 animations:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v11 = v9;
  if (a3 == 0.0)
  {
    (*((void (**)(id, id))a5 + 2))(a5, v9);
    id v10 = v11;
    if (!v11) {
      goto LABEL_6;
    }
    (*((void (**)(void))v11 + 2))();
  }
  else
  {
    [MEMORY[0x263F82E00] animateWithDuration:a4 delay:a5 options:v9 animations:a3 completion:0.0];
  }
  id v10 = v11;
LABEL_6:
}

+ (void)animateIfNeededWithDuration:(double)a3 animations:(id)a4 completion:(id)a5
{
}

+ (void)animateIfNeededWithDuration:(double)a3 animations:(id)a4
{
}

+ (void)setBorderForView:(id)a3
{
  v4 = (void *)MEMORY[0x263F825C8];
  id v5 = a3;
  id v6 = [v4 whiteColor];
  [a1 setBorderColor:v6 forView:v5];
}

+ (void)setBorderColor:(id)a3 forView:(id)a4
{
}

+ (void)setBorderColor:(id)a3 width:(double)a4 forView:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 CGColor];
  id v10 = [v8 layer];
  [v10 setBorderColor:v9];

  id v11 = [v8 layer];

  [v11 setBorderWidth:a4];
}

@end