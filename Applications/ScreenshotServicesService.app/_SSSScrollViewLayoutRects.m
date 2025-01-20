@interface _SSSScrollViewLayoutRects
- (CGRect)contentInsetRect;
- (CGRect)scrollViewRect;
- (CGRect)visibleRect;
- (_SSSScrollViewLayoutRects)initWithScrollView:(id)a3 visibleRectInScrollView:(CGRect)a4;
- (double)initWithScrollViewRect:(double)a3 contentInsetRect:(double)a4 visibleRect:(double)a5;
- (id)layoutRectsByApplyingTransform:(CGAffineTransform *)a3;
- (id)layoutRectsByConvertingFromView:(id)a3 toView:(id)a4;
@end

@implementation _SSSScrollViewLayoutRects

- (_SSSScrollViewLayoutRects)initWithScrollView:(id)a3 visibleRectInScrollView:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v40.receiver = self;
  v40.super_class = (Class)_SSSScrollViewLayoutRects;
  id v8 = a3;
  v9 = [(_SSSScrollViewLayoutRects *)&v40 init];
  [v8 bounds];
  v9->_scrollViewRect.origin.CGFloat x = v10;
  v9->_scrollViewRect.origin.CGFloat y = v11;
  v9->_scrollViewRect.size.CGFloat width = v12;
  v9->_scrollViewRect.size.CGFloat height = v13;
  v9->_visibleRect.origin.CGFloat x = x;
  v9->_visibleRect.origin.CGFloat y = y;
  v9->_visibleRect.size.CGFloat width = width;
  v9->_visibleRect.size.CGFloat height = height;
  [v8 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [v8 contentInset];
  double v23 = v15 + v22;
  double v25 = v17 + v24;
  double v27 = v19 - (v22 + v26);
  double v29 = v21 - (v24 + v28);
  v30 = [v8 superview];
  [v8 convertRect:v30 fromView:v23 toView:v25];
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;

  v9->_contentInsetRect.origin.CGFloat x = v32;
  v9->_contentInsetRect.origin.CGFloat y = v34;
  v9->_contentInsetRect.size.CGFloat width = v36;
  v9->_contentInsetRect.size.CGFloat height = v38;

  return v9;
}

- (double)initWithScrollViewRect:(double)a3 contentInsetRect:(double)a4 visibleRect:(double)a5
{
  v29.receiver = a1;
  v29.super_class = (Class)_SSSScrollViewLayoutRects;
  double v25 = (char *)[super init];
  *((double *)v25 + 1) = a2;
  *((double *)v25 + 2) = a3;
  *((double *)v25 + 3) = a4;
  *((double *)v25 + 4) = a5;
  *(_OWORD *)(v25 + 40) = a17;
  *((void *)v25 + 7) = a18;
  *((void *)v25 + 8) = a19;
  *((double *)v25 + 9) = a6;
  *((double *)v25 + 10) = a7;
  *((double *)v25 + 11) = a8;
  double result = a9;
  *((double *)v25 + 12) = a9;
  return result;
}

- (id)layoutRectsByApplyingTransform:(CGAffineTransform *)a3
{
  [(_SSSScrollViewLayoutRects *)self scrollViewRect];
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v18.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v18.c = v5;
  *(_OWORD *)&v18.tdouble x = *(_OWORD *)&a3->tx;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v18);
  double y = v21.origin.y;
  double x = v21.origin.x;
  double height = v21.size.height;
  double width = v21.size.width;
  [(_SSSScrollViewLayoutRects *)self visibleRect];
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v18.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v18.c = v6;
  *(_OWORD *)&v18.tdouble x = *(_OWORD *)&a3->tx;
  CGRect v23 = CGRectApplyAffineTransform(v22, &v18);
  CGFloat v7 = v23.origin.x;
  CGFloat v8 = v23.origin.y;
  CGFloat v9 = v23.size.width;
  CGFloat v10 = v23.size.height;
  [(_SSSScrollViewLayoutRects *)self contentInsetRect];
  long long v11 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v18.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v18.c = v11;
  *(_OWORD *)&v18.tdouble x = *(_OWORD *)&a3->tx;
  CGRect v25 = CGRectApplyAffineTransform(v24, &v18);
  CGFloat v12 = -[_SSSScrollViewLayoutRects initWithScrollViewRect:contentInsetRect:visibleRect:]([_SSSScrollViewLayoutRects alloc], "initWithScrollViewRect:contentInsetRect:visibleRect:", x, y, width, height, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height, *(void *)&v7, *(void *)&v8, *(void *)&v9, *(void *)&v10);

  return v12;
}

- (id)layoutRectsByConvertingFromView:(id)a3 toView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_SSSScrollViewLayoutRects *)self scrollViewRect];
  [v7 convertRect:v6];
  double v32 = v9;
  double v33 = v8;
  double v30 = v11;
  double v31 = v10;
  [(_SSSScrollViewLayoutRects *)self visibleRect];
  [v7 convertRect:v6];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  [(_SSSScrollViewLayoutRects *)self contentInsetRect];
  [v7 convertRect:v6 toView:];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  double v28 = -[_SSSScrollViewLayoutRects initWithScrollViewRect:contentInsetRect:visibleRect:]([_SSSScrollViewLayoutRects alloc], "initWithScrollViewRect:contentInsetRect:visibleRect:", v33, v32, v31, v30, v21, v23, v25, v27, v13, v15, v17, v19);

  return v28;
}

- (CGRect)scrollViewRect
{
  double x = self->_scrollViewRect.origin.x;
  double y = self->_scrollViewRect.origin.y;
  double width = self->_scrollViewRect.size.width;
  double height = self->_scrollViewRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)contentInsetRect
{
  double x = self->_contentInsetRect.origin.x;
  double y = self->_contentInsetRect.origin.y;
  double width = self->_contentInsetRect.size.width;
  double height = self->_contentInsetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end