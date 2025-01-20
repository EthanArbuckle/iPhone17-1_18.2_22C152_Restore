@interface BSUIOrientationTransformWrapperView
- (BOOL)isCounterTransformView;
- (BSUIOrientationTransformWrapperView)initWithFrame:(CGRect)a3;
- (CGAffineTransform)convertTransformFromContainerInterfaceOrientationToContentInterfaceOrientation:(SEL)a3;
- (CGAffineTransform)convertTransformFromContentInterfaceOrientationToContainerInterfaceOrientation:(SEL)a3;
- (CGPoint)convertPointFromContainerInterfaceOrientationToContentInterfaceOrientation:(CGPoint)a3;
- (CGPoint)convertPointFromContentInterfaceOrientationToContainerInterfaceOrientation:(CGPoint)a3;
- (CGRect)convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:(CGRect)a3;
- (CGRect)convertRectFromContentInterfaceOrientationToContainerInterfaceOrientation:(CGRect)a3;
- (CGSize)_referenceContainerSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)contentViews;
- (id)description;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)containerOrientation;
- (int64_t)contentOrientation;
- (void)_updateGeometry;
- (void)addContentView:(id)a3;
- (void)addGestureRecognizerToTransformedView:(id)a3;
- (void)addHitTestView:(id)a3;
- (void)bringContentSubviewToFront:(id)a3;
- (void)layoutSubviews;
- (void)removeGestureRecognizerFromTransformedView:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setContentOrientation:(int64_t)a3;
- (void)setCounterTransformView:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation BSUIOrientationTransformWrapperView

- (void)setContainerOrientation:(int64_t)a3
{
  if (self->_containerOrientation != a3)
  {
    self->_containerOrientation = a3;
    [(BSUIOrientationTransformWrapperView *)self _updateGeometry];
  }
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void)setContentOrientation:(int64_t)a3
{
  if (self->_contentOrientation != a3)
  {
    self->_contentOrientation = a3;
    -[_BSUIOrientationTransformedContentView setContentOrientation:](self->_transformedView, "setContentOrientation:");
    [(BSUIOrientationTransformWrapperView *)self _updateGeometry];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitTestViews, 0);

  objc_storeStrong((id *)&self->_transformedView, 0);
}

- (void)setCenter:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIOrientationTransformWrapperView;
  -[BSUIOrientationTransformWrapperView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  [(BSUIOrientationTransformWrapperView *)self _updateGeometry];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIOrientationTransformWrapperView;
  -[BSUIOrientationTransformWrapperView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(BSUIOrientationTransformWrapperView *)self _updateGeometry];
}

- (void)addContentView:(id)a3
{
  id v4 = a3;
  -[_BSUIOrientationTransformedContentView addSubview:](self->_transformedView, "addSubview:");
  [(BSUIOrientationTransformWrapperView *)self _updateGeometry];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BSUIOrientationTransformWrapperView;
  [(BSUIOrientationTransformWrapperView *)&v3 layoutSubviews];
  [(BSUIOrientationTransformWrapperView *)self _updateGeometry];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIOrientationTransformWrapperView;
  -[BSUIOrientationTransformWrapperView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(BSUIOrientationTransformWrapperView *)self _updateGeometry];
}

- (void)_updateGeometry
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [(BSUIOrientationTransformWrapperView *)self bounds];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  int64_t contentOrientation = self->_contentOrientation;
  int64_t containerOrientation = self->_containerOrientation;
  if (contentOrientation == containerOrientation)
  {
    transformedView = self->_transformedView;
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v27[0] = *MEMORY[0x1E4F1DAB8];
    v27[1] = v14;
    v27[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(_BSUIOrientationTransformedContentView *)transformedView setTransform:v27];
    -[_BSUIOrientationTransformedContentView setFrame:](self->_transformedView, "setFrame:", v7, v8, v9, v10);
    double Width = v10;
    double Height = v9;
  }
  else
  {
    if ((unint64_t)(contentOrientation - 3) < 2 == (unint64_t)(containerOrientation - 3) < 2)
    {
      double Height = v5;
      double Width = v6;
    }
    else
    {
      double Height = CGRectGetHeight(*(CGRect *)&v3);
      v31.origin.x = v7;
      v31.origin.y = v8;
      v31.size.width = v9;
      v31.size.height = v10;
      double Width = CGRectGetWidth(v31);
      int64_t containerOrientation = self->_containerOrientation;
      int64_t contentOrientation = self->_contentOrientation;
    }
    -[_BSUIOrientationTransformedContentView setTransform:](self->_transformedView, "setTransform:", v28, _BSUITransformFromOrientationToOrientation(containerOrientation, contentOrientation, v28));
    v17 = self->_transformedView;
    v32.origin.x = v7;
    v32.origin.y = v8;
    v32.size.width = v9;
    v32.size.height = v10;
    double MidX = CGRectGetMidX(v32);
    v33.origin.x = v7;
    v33.origin.y = v8;
    v33.size.width = v9;
    v33.size.height = v10;
    -[_BSUIOrientationTransformedContentView setCenter:](v17, "setCenter:", MidX, CGRectGetMidY(v33));
    -[_BSUIOrientationTransformedContentView setBounds:](self->_transformedView, "setBounds:", v7, v8, Height, Width);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v19 = [(_BSUIOrientationTransformedContentView *)self->_transformedView subviews];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v22++), "setFrame:", v7, v8, Height, Width);
      }
      while (v20 != v22);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v20);
  }
}

- (BSUIOrientationTransformWrapperView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BSUIOrientationTransformWrapperView;
  double v3 = -[BSUIOrientationTransformWrapperView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_int64_t contentOrientation = 1;
    v3->_int64_t containerOrientation = 1;
    double v5 = [_BSUIOrientationTransformedContentView alloc];
    [(BSUIOrientationTransformWrapperView *)v4 bounds];
    uint64_t v6 = -[_BSUIOrientationTransformedContentView initWithFrame:](v5, "initWithFrame:");
    transformedView = v4->_transformedView;
    v4->_transformedView = (_BSUIOrientationTransformedContentView *)v6;

    [(BSUIOrientationTransformWrapperView *)v4 addSubview:v4->_transformedView];
  }
  return v4;
}

- (id)description
{
  v2 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  double v3 = BSInterfaceOrientationDescription();
  id v4 = (id)[v2 appendObject:v3 withName:@"container"];

  id v5 = (id)[v2 appendSuper];
  uint64_t v6 = [v2 build];

  return v6;
}

- (void)setCounterTransformView:(BOOL)a3
{
}

- (BOOL)isCounterTransformView
{
  return [(_UIDirectionalRotationView *)self->_transformedView isCounterTransformView];
}

- (NSArray)contentViews
{
  return (NSArray *)[(_BSUIOrientationTransformedContentView *)self->_transformedView subviews];
}

- (void)addHitTestView:(id)a3
{
  id v4 = a3;
  hitTestViews = self->_hitTestViews;
  id v8 = v4;
  if (!hitTestViews)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v7 = self->_hitTestViews;
    self->_hitTestViews = v6;

    hitTestViews = self->_hitTestViews;
    id v4 = v8;
  }
  [(NSMutableArray *)hitTestViews addObject:v4];
}

- (void)addGestureRecognizerToTransformedView:(id)a3
{
}

- (void)removeGestureRecognizerFromTransformedView:(id)a3
{
}

- (void)bringContentSubviewToFront:(id)a3
{
}

- (CGSize)_referenceContainerSize
{
  [(BSUIOrientationTransformWrapperView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  int64_t v7 = [(BSUIOrientationTransformWrapperView *)self containerOrientation];
  if ((unint64_t)(v7 - 3) >= 2) {
    double v8 = v4;
  }
  else {
    double v8 = v6;
  }
  if ((unint64_t)(v7 - 3) >= 2) {
    double v9 = v6;
  }
  else {
    double v9 = v4;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGPoint)convertPointFromContainerInterfaceOrientationToContentInterfaceOrientation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(BSUIOrientationTransformWrapperView *)self _referenceContainerSize];
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  int64_t v10 = [(BSUIOrientationTransformWrapperView *)self containerOrientation];
  int64_t v11 = [(BSUIOrientationTransformWrapperView *)self contentOrientation];
  v12.n128_f64[0] = x;
  v13.n128_f64[0] = y;
  v14.n128_u64[0] = v7;
  v15.n128_u64[0] = v9;

  MEMORY[0x1F4103020](v10, v11, v12, v13, v14, v15);
  result.CGFloat y = v17;
  result.CGFloat x = v16;
  return result;
}

- (CGRect)convertRectFromContainerInterfaceOrientationToContentInterfaceOrientation:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(BSUIOrientationTransformWrapperView *)self _referenceContainerSize];
  unint64_t v9 = v8;
  unint64_t v11 = v10;
  int64_t v12 = [(BSUIOrientationTransformWrapperView *)self containerOrientation];
  int64_t v13 = [(BSUIOrientationTransformWrapperView *)self contentOrientation];
  v14.n128_f64[0] = x;
  v15.n128_f64[0] = y;
  v16.n128_f64[0] = width;
  v17.n128_f64[0] = height;
  v18.n128_u64[0] = v9;
  v19.n128_u64[0] = v11;

  MEMORY[0x1F4103028](v12, v13, v14, v15, v16, v17, v18, v19);
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGAffineTransform)convertTransformFromContainerInterfaceOrientationToContentInterfaceOrientation:(SEL)a3
{
  long long v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&a4->tx;
  unint64_t v8 = [(BSUIOrientationTransformWrapperView *)self containerOrientation];
  CGRect result = [(BSUIOrientationTransformWrapperView *)self contentOrientation];
  if (v8 != result)
  {
    memset(&v14, 0, sizeof(v14));
    _BSUITransformFromOrientationToOrientation((uint64_t)v8, (uint64_t)result, &v14);
    CGAffineTransform v11 = v14;
    CGAffineTransformInvert(&t2, &v11);
    long long v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v11.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v11.c = v10;
    *(_OWORD *)&v11.tCGFloat x = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v13, &v11, &t2);
    CGAffineTransform v11 = v14;
    return CGAffineTransformConcat(retstr, &v11, &v13);
  }
  return result;
}

- (CGPoint)convertPointFromContentInterfaceOrientationToContainerInterfaceOrientation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(BSUIOrientationTransformWrapperView *)self _referenceContainerSize];
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  int64_t v10 = [(BSUIOrientationTransformWrapperView *)self contentOrientation];
  int64_t v11 = [(BSUIOrientationTransformWrapperView *)self containerOrientation];
  v12.n128_f64[0] = x;
  v13.n128_f64[0] = y;
  v14.n128_u64[0] = v7;
  v15.n128_u64[0] = v9;

  MEMORY[0x1F4103020](v10, v11, v12, v13, v14, v15);
  result.CGFloat y = v17;
  result.CGFloat x = v16;
  return result;
}

- (CGRect)convertRectFromContentInterfaceOrientationToContainerInterfaceOrientation:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(BSUIOrientationTransformWrapperView *)self _referenceContainerSize];
  unint64_t v9 = v8;
  unint64_t v11 = v10;
  int64_t v12 = [(BSUIOrientationTransformWrapperView *)self contentOrientation];
  int64_t v13 = [(BSUIOrientationTransformWrapperView *)self containerOrientation];
  v14.n128_f64[0] = x;
  v15.n128_f64[0] = y;
  v16.n128_f64[0] = width;
  v17.n128_f64[0] = height;
  v18.n128_u64[0] = v9;
  v19.n128_u64[0] = v11;

  MEMORY[0x1F4103028](v12, v13, v14, v15, v16, v17, v18, v19);
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGAffineTransform)convertTransformFromContentInterfaceOrientationToContainerInterfaceOrientation:(SEL)a3
{
  long long v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&a4->tx;
  unint64_t v8 = [(BSUIOrientationTransformWrapperView *)self containerOrientation];
  CGRect result = [(BSUIOrientationTransformWrapperView *)self contentOrientation];
  if (v8 != result)
  {
    memset(&v15, 0, sizeof(v15));
    _BSUITransformFromOrientationToOrientation((uint64_t)v8, (uint64_t)result, &v15);
    CGAffineTransform t1 = v15;
    CGAffineTransformInvert(&v14, &t1);
    long long v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t1.c = v10;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a4->tx;
    CGAffineTransform v11 = v15;
    CGAffineTransformConcat(&t2, &t1, &v11);
    return CGAffineTransformConcat(retstr, &v14, &t2);
  }
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)BSUIOrientationTransformWrapperView;
  -[BSUIOrientationTransformWrapperView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (BSUIOrientationTransformWrapperView *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = v5;
  if (v5 == self || v5 == (BSUIOrientationTransformWrapperView *)self->_transformedView)
  {

    unint64_t v6 = 0;
  }
  hitTestViews = self->_hitTestViews;
  if (hitTestViews && ([(NSMutableArray *)hitTestViews containsObject:v6] & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unint64_t v8 = self->_hitTestViews;
    unint64_t v9 = (BSUIOrientationTransformWrapperView *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (BSUIOrientationTransformWrapperView *)((char *)i + 1))
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          if (-[BSUIOrientationTransformWrapperView isDescendantOfView:](v6, "isDescendantOfView:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
          {
            unint64_t v9 = v6;
            goto LABEL_16;
          }
        }
        unint64_t v9 = (BSUIOrientationTransformWrapperView *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    int64_t v12 = v9;
    unint64_t v6 = v12;
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_transformedView) {
    [(_BSUIOrientationTransformedContentView *)self->_transformedView frame];
  }
  else {
    [(BSUIOrientationTransformWrapperView *)self bounds];
  }
  double v5 = v3;
  double v6 = v4;
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (void)setSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BSUIOrientationTransformWrapperView;
  -[BSUIOrientationTransformWrapperView setSize:](&v4, sel_setSize_, a3.width, a3.height);
  [(BSUIOrientationTransformWrapperView *)self _updateGeometry];
}

@end