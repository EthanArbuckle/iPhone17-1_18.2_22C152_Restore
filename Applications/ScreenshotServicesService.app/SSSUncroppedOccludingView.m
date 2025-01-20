@interface SSSUncroppedOccludingView
- (BOOL)_pointInsideAnOccludingView:(CGPoint)a3;
- (BOOL)pointCanPassthrough:(CGPoint)a3;
- (CGRect)unoccludedRect;
- (SSSUncroppedOccludingView)initWithFrame:(CGRect)a3;
- (id)_occludingViews;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setUnoccludedRect:(CGRect)a3;
@end

@implementation SSSUncroppedOccludingView

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)SSSUncroppedOccludingView;
  [(SSSUncroppedOccludingView *)&v28 layoutSubviews];
  [(SSSUncroppedOccludingView *)self bounds];
  double x = v29.origin.x;
  double width = v29.size.width;
  CGFloat height = v29.size.height;
  double y = v29.origin.y;
  if (!CGRectIsEmpty(v29))
  {
    [(SSSUncroppedOccludingView *)self unoccludedRect];
    v7 = [(SSSUncroppedOccludingView *)self traitCollection];
    [v7 displayScale];
    SSRoundRectToScale();
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v30.origin.double x = v9;
    v30.origin.double y = v11;
    v30.size.double width = v13;
    v30.size.CGFloat height = v15;
    double MinY = CGRectGetMinY(v30);
    -[SSSOccludingCoveringView sss_setFrameUnanimatingIfChangingFromCGSizeZero:](self->_topView, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", x, y, width, MinY);
    v31.origin.double x = v9;
    v31.origin.double y = v11;
    v31.size.double width = v13;
    v31.size.CGFloat height = v15;
    double v25 = height;
    double MaxY = CGRectGetMaxY(v31);
    v32.origin.double x = v9;
    v32.origin.double y = v11;
    v32.size.double width = v13;
    v32.size.CGFloat height = v15;
    CGFloat v26 = v25 - CGRectGetMaxY(v32);
    CGFloat v27 = MaxY;
    -[SSSOccludingCoveringView sss_setFrameUnanimatingIfChangingFromCGSizeZero:](self->_bottomView, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", x, MaxY, width, v26);
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.CGFloat height = MinY;
    double v23 = CGRectGetMaxY(v33);
    v34.origin.double x = x;
    v34.origin.double y = MaxY;
    v34.size.double width = width;
    v34.size.CGFloat height = v26;
    double v17 = CGRectGetMinY(v34);
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.CGFloat height = MinY;
    double v18 = v17 - CGRectGetMaxY(v35);
    v36.origin.double x = v9;
    v36.origin.double y = v11;
    v36.size.double width = v13;
    v36.size.CGFloat height = v15;
    -[SSSOccludingCoveringView sss_setFrameUnanimatingIfChangingFromCGSizeZero:](self->_leftView, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", x, v23, CGRectGetMinX(v36), v18);
    v37.origin.double x = v9;
    v37.origin.double y = v11;
    v37.size.double width = v13;
    v37.size.CGFloat height = v15;
    double MaxX = CGRectGetMaxX(v37);
    v38.origin.double x = x;
    v38.origin.double y = y;
    v38.size.double width = width;
    v38.size.CGFloat height = MinY;
    double v21 = CGRectGetMaxY(v38);
    v39.origin.double x = v9;
    v39.origin.double y = v11;
    v39.size.double width = v13;
    v39.size.CGFloat height = v15;
    double v19 = width - CGRectGetMaxX(v39);
    v40.origin.double x = x;
    v40.size.CGFloat height = v26;
    v40.origin.double y = v27;
    v40.size.double width = width;
    double v20 = CGRectGetMinY(v40);
    v41.origin.double x = x;
    v41.origin.double y = y;
    v41.size.double width = width;
    v41.size.CGFloat height = MinY;
    -[SSSOccludingCoveringView sss_setFrameUnanimatingIfChangingFromCGSizeZero:](self->_rightView, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", MaxX, v21, v19, v20 - CGRectGetMaxY(v41));
  }
}

- (id)_occludingViews
{
  bottomView = self->_bottomView;
  v6[0] = self->_topView;
  v6[1] = bottomView;
  rightView = self->_rightView;
  v6[2] = self->_leftView;
  v6[3] = rightView;
  v4 = +[NSArray arrayWithObjects:v6 count:4];

  return v4;
}

- (BOOL)pointCanPassthrough:(CGPoint)a3
{
  return !-[SSSUncroppedOccludingView _pointInsideAnOccludingView:](self, "_pointInsideAnOccludingView:", a3.x, a3.y);
}

- (BOOL)_pointInsideAnOccludingView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(SSSUncroppedOccludingView *)self _occludingViews];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v11 convertPoint:self x:y];
        if (objc_msgSend(v11, "pointInside:withEvent:", 0))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setUnoccludedRect:(CGRect)a3
{
  self->_unoccludedRect = a3;
  [(SSSUncroppedOccludingView *)self setNeedsLayout];
}

- (SSSUncroppedOccludingView)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)SSSUncroppedOccludingView;
  v3 = -[SSSUncroppedOccludingView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SSSUncroppedOccludingView *)v3 setClipsToBounds:1];
  uint64_t v4 = objc_opt_new();
  topView = v3->_topView;
  v3->_topView = (SSSOccludingCoveringView *)v4;

  uint64_t v6 = objc_opt_new();
  bottomView = v3->_bottomView;
  v3->_bottomView = (SSSOccludingCoveringView *)v6;

  uint64_t v8 = objc_opt_new();
  leftView = v3->_leftView;
  v3->_leftView = (SSSOccludingCoveringView *)v8;

  uint64_t v10 = objc_opt_new();
  rightView = v3->_rightView;
  v3->_rightView = (SSSOccludingCoveringView *)v10;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v12 = [(SSSUncroppedOccludingView *)v3 _occludingViews];
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [(SSSUncroppedOccludingView *)v3 addSubview:*(void *)(*((void *)&v18 + 1) + 8 * (void)v16)];
        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v14);
  }

  return v3;
}

- (CGRect)unoccludedRect
{
  double x = self->_unoccludedRect.origin.x;
  double y = self->_unoccludedRect.origin.y;
  double width = self->_unoccludedRect.size.width;
  double height = self->_unoccludedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);

  objc_storeStrong((id *)&self->_topView, 0);
}

@end