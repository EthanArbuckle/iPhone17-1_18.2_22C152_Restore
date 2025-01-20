@interface AVTColorWheelView
+ (BOOL)colorItems:(id)a3 containColorItem:(id)a4;
+ (id)buildCircleViewWithDiameter:(double)a3;
+ (id)colorItemsFrom:(id)a3 excluding:(id)a4;
- (AVTColorWheelView)initWithFrame:(CGRect)a3;
- (CGPoint)rotatePoint:(CGPoint)a3 aroundCenter:(CGPoint)a4 withAngle:(double)a5;
- (NSArray)circleViews;
- (UIView)containerView;
- (id)buildAllCircleViews;
- (void)setCircleViews:(id)a3;
- (void)setContainerView:(id)a3;
- (void)updateWithPrimaryItems:(id)a3 extendedItems:(id)a4;
@end

@implementation AVTColorWheelView

+ (id)buildCircleViewWithDiameter:(double)a3
{
  v3 = -[AVTCircularView initWithFrame:]([AVTCircularView alloc], "initWithFrame:", 0.0, 0.0, a3, a3);
  return v3;
}

- (AVTColorWheelView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVTColorWheelView;
  v3 = -[AVTAttributeValueView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AVTColorWheelView *)v3 bounds];
    CGRect v12 = CGRectInset(v11, 8.0, 8.0);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
    [(AVTColorWheelView *)v4 setContainerView:v5];

    v6 = [(AVTColorWheelView *)v4 containerView];
    [v6 setAutoresizingMask:18];

    v7 = [(AVTColorWheelView *)v4 containerView];
    [(AVTColorWheelView *)v4 addSubview:v7];

    v8 = [(AVTColorWheelView *)v4 buildAllCircleViews];
    [(AVTColorWheelView *)v4 setCircleViews:v8];
  }
  return v4;
}

- (id)buildAllCircleViews
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(AVTColorWheelView *)self containerView];
  [v4 bounds];
  double MidX = CGRectGetMidX(v21);
  v6 = [(AVTColorWheelView *)self containerView];
  [v6 bounds];
  double MidY = CGRectGetMidY(v22);

  v8 = [(AVTColorWheelView *)self containerView];
  [v8 bounds];
  double v9 = CGRectGetHeight(v23) * 0.25;

  objc_super v10 = [(id)objc_opt_class() buildCircleViewWithDiameter:v9];
  objc_msgSend(v10, "setCenter:", MidX, MidY);
  [v10 setAutoresizingMask:63];
  CGRect v11 = [(AVTColorWheelView *)self containerView];
  [v11 addSubview:v10];

  [v3 addObject:v10];
  double v12 = v9 * 0.5;
  uint64_t v13 = 6;
  double v14 = MidX;
  do
  {
    v15 = [(id)objc_opt_class() buildCircleViewWithDiameter:v9];
    objc_msgSend(v15, "setCenter:", v14, v12);
    [v15 setAutoresizingMask:63];
    v16 = [(AVTColorWheelView *)self containerView];
    [v16 addSubview:v15];

    [v3 addObject:v15];
    -[AVTColorWheelView rotatePoint:aroundCenter:withAngle:](self, "rotatePoint:aroundCenter:withAngle:", v14, v12, MidX, MidY, 60.0);
    double v14 = v17;
    double v12 = v18;

    --v13;
  }
  while (v13);

  return v3;
}

- (CGPoint)rotatePoint:(CGPoint)a3 aroundCenter:(CGPoint)a4 withAngle:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  CGFloat v7 = a3.x - a4.x;
  CGFloat v8 = a3.y - a4.y;
  __double2 v9 = __sincos_stret(a5 * 3.14159265 / 180.0);
  double v10 = x + v7 * v9.__cosval - v8 * v9.__sinval;
  double v11 = y + v7 * v9.__sinval + v8 * v9.__cosval;
  result.double y = v11;
  result.double x = v10;
  return result;
}

+ (BOOL)colorItems:(id)a3 containColorItem:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__AVTColorWheelView_colorItems_containColorItem___block_invoke;
  v8[3] = &unk_263FF26B0;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a3) = [a3 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)a3;
}

uint64_t __49__AVTColorWheelView_colorItems_containColorItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 color];
  v4 = [*(id *)(a1 + 32) color];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

+ (id)colorItemsFrom:(id)a3 excluding:(id)a4
{
  id v6 = a4;
  CGFloat v7 = (void *)MEMORY[0x263F08A98];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __46__AVTColorWheelView_colorItemsFrom_excluding___block_invoke;
  v16 = &unk_263FF26D8;
  id v17 = v6;
  id v18 = a1;
  id v8 = v6;
  id v9 = a3;
  double v10 = [v7 predicateWithBlock:&v13];
  double v11 = objc_msgSend(v9, "filteredArrayUsingPredicate:", v10, v13, v14, v15, v16);

  return v11;
}

uint64_t __46__AVTColorWheelView_colorItemsFrom_excluding___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  LODWORD(a1) = [(id)objc_opt_class() colorItems:*(void *)(a1 + 32) containColorItem:v3];

  return a1 ^ 1;
}

- (void)updateWithPrimaryItems:(id)a3 extendedItems:(id)a4
{
  id v25 = a3;
  id v24 = a4;
  id v6 = [(id)objc_opt_class() colorItemsFrom:v24 excluding:v25];
  CGFloat v7 = (void *)[v6 mutableCopy];

  unint64_t v8 = [v7 count];
  id v9 = [(AVTColorWheelView *)self circleViews];
  unint64_t v10 = [v9 count];

  if (v8 < v10) {
    [v7 addObjectsFromArray:v25];
  }
  double v11 = [(AVTColorWheelView *)self circleViews];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = [(AVTColorWheelView *)self circleViews];
      v15 = [v14 objectAtIndexedSubscript:v13];

      v16 = [v7 objectAtIndexedSubscript:v13];
      id v17 = [v16 layerContentProvider];
      id v18 = [v16 color];
      v19 = [v18 baseColorPreset];
      v20 = [v16 skinColor];
      CGRect v21 = [v15 layer];
      ((void (**)(void, void *, void *, void *))v17)[2](v17, v19, v20, v21);

      ++v13;
      CGRect v22 = [(AVTColorWheelView *)self circleViews];
      unint64_t v23 = [v22 count];
    }
    while (v13 < v23);
  }
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (NSArray)circleViews
{
  return self->_circleViews;
}

- (void)setCircleViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleViews, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end