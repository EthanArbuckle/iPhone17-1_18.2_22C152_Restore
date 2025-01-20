@interface SSSCropOverlayView
+ (double)_outsetAmountForHandles;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_frameForGrabberAtEdge:(unint64_t)a3 inSize:(CGSize)a4 dimension:(double)a5;
- (CGRect)_frameForLineAtEdge:(unint64_t)a3 inSize:(CGSize)a4 dimension:(double)a5;
- (CGRect)_frameForViewInCorner:(unint64_t)a3 inSize:(CGSize)a4 cornerSize:(CGSize)a5;
- (SSSCropOverlayGrabPosition)grabPositionForLocation:(CGPoint)a3;
- (SSSCropOverlayView)initWithFrame:(CGRect)a3;
- (double)cornerGrabberAlpha;
- (double)lineAlpha;
- (double)lineGrabberAlpha;
- (id)_orderedRectCorners;
- (id)_orderedRectEdges;
- (id)_viewsToHitTest;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setCornerGrabberAlpha:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLineAlpha:(double)a3;
- (void)setLineGrabberAlpha:(double)a3;
@end

@implementation SSSCropOverlayView

- (SSSCropOverlayView)initWithFrame:(CGRect)a3
{
  v45.receiver = self;
  v45.super_class = (Class)SSSCropOverlayView;
  v3 = -[SSSCropOverlayView initWithFrame:](&v45, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SSSCropOverlayView *)v3 setClipsToBounds:0];
  v4 = [(SSSCropOverlayView *)v3 layer];
  [v4 setAllowsGroupOpacity:0];

  v3->_cornerGrabberAlpha = 1.0;
  v3->_lineGrabberAlpha = 1.0;
  v3->_lineAlpha = 1.0;
  v5 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = v3->_containerView;
  v3->_containerView = v5;

  v7 = [(UIView *)v3->_containerView layer];
  [v7 setAllowsGroupOpacity:0];

  [(SSSCropOverlayView *)v3 addSubview:v3->_containerView];
  id obj = +[NSMutableArray array];
  id v35 = +[NSMutableArray array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v8 = [(SSSCropOverlayView *)v3 _orderedRectEdges];
  id v9 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)v12) integerValue];
        v14 = [[SSSCropOverlayLineView alloc] initWithEdge:v13];
        v15 = [[SSSCropOverlayGrabberView alloc] initWithEdge:v13];
        [obj addObject:v14];
        [v35 addObject:v15];
        [(UIView *)v3->_containerView addSubview:v14];
        [(UIView *)v3->_containerView addSubview:v15];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v10);
  }

  objc_storeStrong((id *)&v3->_lineViews, obj);
  objc_storeStrong((id *)&v3->_grabberViews, v35);
  v16 = +[NSMutableArray array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v17 = [(SSSCropOverlayView *)v3 _orderedRectCorners];
  id v18 = [v17 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      v21 = 0;
      do
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = -[SSSCropOverlayCornerView initForCorner:]([SSSCropOverlayCornerView alloc], "initForCorner:", [*(id *)(*((void *)&v37 + 1) + 8 * (void)v21) integerValue]);
        [(NSArray *)v16 addObject:v22];
        [(UIView *)v3->_containerView addSubview:v22];

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v19);
  }

  cornerViews = v3->_cornerViews;
  v3->_cornerViews = v16;
  v24 = v16;

  v25 = [(UIView *)v3->_containerView layer];
  v26 = +[SSMaterial cropHandle];
  v27 = [v26 filter];
  v46 = v27;
  v28 = +[NSArray arrayWithObjects:&v46 count:1];
  [v25 setFilters:v28];

  v29 = v3->_containerView;
  v30 = +[SSMaterial cropHandle];
  [v30 colorAlpha];
  -[UIView setAlpha:](v29, "setAlpha:");

  v31 = +[SSMaterial cropHandle];

  v32 = [v31 color];
  v33 = [v32 colorWithAlphaComponent:1.0];
  [(SSSCropOverlayView *)v3 setTintColor:v33];

  return v3;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSSCropOverlayView;
  -[SSSCropOverlayView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SSSCropOverlayView *)self setNeedsLayout];
  [(SSSCropOverlayView *)self layoutIfNeeded];
}

- (id)_orderedRectCorners
{
  return &off_10009DF20;
}

- (id)_orderedRectEdges
{
  return &off_10009DF38;
}

+ (double)_outsetAmountForHandles
{
  +[SSChromeHelper cropsHandleOutset];
  return result;
}

- (CGRect)_frameForViewInCorner:(unint64_t)a3 inSize:(CGSize)a4 cornerSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  +[SSSCropOverlayGrabberView preferredDimension];
  double v11 = v10;
  [(id)objc_opt_class() _outsetAmountForHandles];
  double v13 = v11 + v12;
  if (a3 == 4 || a3 == 1)
  {
    double v14 = -v13;
    double v15 = -v13;
  }
  else
  {
    double v15 = v8 - width + v13;
    double v14 = -v13;
  }
  double v16 = v7 - height + v13;
  if (a3 - 1 < 2) {
    double v16 = v14;
  }
  double v17 = width;
  double v18 = height;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_frameForLineAtEdge:(unint64_t)a3 inSize:(CGSize)a4 dimension:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  [(id)objc_opt_class() _outsetAmountForHandles];
  double v10 = v9;
  double v11 = -a5;
  int IsHorizontal = SSRectEdgeIsHorizontal();
  double v13 = -a5;
  switch(a3)
  {
    case 1uLL:
      double v13 = v11 - v10;
      break;
    case 2uLL:
      double v13 = -a5;
      double v11 = v11 - v10;
      break;
    case 4uLL:
      double v13 = height + v10;
      break;
    case 8uLL:
      double v13 = -a5;
      double v11 = width + v10;
      break;
    default:
      break;
  }
  double v14 = width + a5 * 2.0;
  if (IsHorizontal)
  {
    double v15 = a5;
  }
  else
  {
    double v14 = a5;
    double v15 = height + a5 * 2.0;
  }
  double v16 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v16;
  return result;
}

- (CGRect)_frameForGrabberAtEdge:(unint64_t)a3 inSize:(CGSize)a4 dimension:(double)a5
{
  [(SSSCropOverlayView *)self _frameForLineAtEdge:a4.width inSize:a4.height dimension:a5];
  +[SSSCropOverlayGrabberView preferredOtherDimension];
  if (SSRectEdgeIsHorizontal()) {
    UIRectCenteredXInRect();
  }
  else {
    UIRectCenteredYInRect();
  }
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)layoutSubviews
{
  containerView = self->_containerView;
  [(SSSCropOverlayView *)self bounds];
  -[UIView setFrame:](containerView, "setFrame:");
  [(SSSCropOverlayView *)self bounds];
  double v5 = floor(v4);
  [(SSSCropOverlayView *)self bounds];
  double v7 = floor(v6);
  id v36 = [(SSSCropOverlayView *)self _orderedRectCorners];
  if ([(NSArray *)self->_cornerViews count])
  {
    unint64_t v8 = 0;
    do
    {
      double v9 = [(NSArray *)self->_cornerViews objectAtIndex:v8];
      double v10 = [v36 objectAtIndex:v8];
      id v11 = [v10 integerValue];

      [v9 intrinsicContentSize];
      -[SSSCropOverlayView _frameForViewInCorner:inSize:cornerSize:](self, "_frameForViewInCorner:inSize:cornerSize:", v11, v5, v7, v12, v13);
      [v9 sss_setFrameUnanimatingIfChangingFromCGSizeZero:];

      ++v8;
    }
    while (v8 < [(NSArray *)self->_cornerViews count]);
  }
  double v14 = [(SSSCropOverlayView *)self _orderedRectEdges];
  if ([(NSArray *)self->_grabberViews count])
  {
    unint64_t v15 = 0;
    do
    {
      double v16 = [(NSArray *)self->_grabberViews objectAtIndex:v15];
      double v17 = [(NSArray *)self->_lineViews objectAtIndex:v15];
      double v18 = [v14 objectAtIndex:v15];
      id v19 = [v18 integerValue];

      +[SSSCropOverlayGrabberView preferredDimension];
      -[SSSCropOverlayView _frameForGrabberAtEdge:inSize:dimension:](self, "_frameForGrabberAtEdge:inSize:dimension:", v19, v5, v7, v20);
      double v37 = v22;
      double v38 = v21;
      double v24 = v23;
      double v26 = v25;
      +[SSSCropOverlayLineView preferredDimension];
      -[SSSCropOverlayView _frameForLineAtEdge:inSize:dimension:](self, "_frameForLineAtEdge:inSize:dimension:", v19, v5, v7, v27);
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      [v16 sss_setFrameUnanimatingIfChangingFromCGSizeZero:v38, v37, v24, v26];
      [v17 sss_setFrameUnanimatingIfChangingFromCGSizeZero:v29, v31, v33, v35];

      ++v15;
    }
    while (v15 < [(NSArray *)self->_grabberViews count]);
  }
}

- (SSSCropOverlayGrabPosition)grabPositionForLocation:(CGPoint)a3
{
  v3 = -[SSSCropOverlayView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 corner];
LABEL_6:
    id v5 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = 0;
    goto LABEL_6;
  }
  id v5 = [v3 edge];
  id v4 = 0;
LABEL_7:

  unint64_t v6 = (unint64_t)v5;
  unint64_t v7 = (unint64_t)v4;
  result.corner = v7;
  result.edge = v6;
  return result;
}

- (id)_viewsToHitTest
{
  return [(NSArray *)self->_cornerViews arrayByAddingObjectsFromArray:self->_grabberViews];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v8 = [(SSSCropOverlayView *)self _viewsToHitTest];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v13 convertPoint:self x:y];
        if (objc_msgSend(v13, "pointInside:withEvent:", v7))
        {

          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)SSSCropOverlayView;
  BOOL v14 = -[SSSCropOverlayView pointInside:withEvent:](&v16, "pointInside:withEvent:", v7, x, y);
LABEL_11:

  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (UIViewIgnoresTouchEvents())
  {
    unint64_t v8 = 0;
    goto LABEL_17;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [(SSSCropOverlayView *)self _viewsToHitTest];
  id v10 = [(SSSCropOverlayView *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v9);
      }
      BOOL v14 = *(SSSCropOverlayView **)(*((void *)&v17 + 1) + 8 * v13);
      -[SSSCropOverlayView convertPoint:fromView:](v14, "convertPoint:fromView:", self, x, y);
      if (-[SSSCropOverlayView pointInside:withEvent:](v14, "pointInside:withEvent:", v7)) {
        goto LABEL_15;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [(SSSCropOverlayView *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)SSSCropOverlayView;
  -[SSSCropOverlayView hitTest:withEvent:](&v16, "hitTest:withEvent:", v7, x, y);
  BOOL v14 = (SSSCropOverlayView *)objc_claimAutoreleasedReturnValue();
  if (v14 != self && ([(SSSCropOverlayView *)self containsView:v14] & 1) == 0)
  {
    id v9 = v14;
LABEL_15:
    unint64_t v8 = v14;
    BOOL v14 = v9;
    goto LABEL_16;
  }
  unint64_t v8 = 0;
LABEL_16:

LABEL_17:

  return v8;
}

- (void)setCornerGrabberAlpha:(double)a3
{
  self->_cornerGrabberAlpha = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_cornerViews;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      unint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setAlpha:a3];
        unint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setLineAlpha:(double)a3
{
  self->_lineAlpha = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_lineViews;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      unint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setAlpha:a3 v9];
        unint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setLineGrabberAlpha:(double)a3
{
  self->_lineGrabberAlpha = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_grabberViews;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      unint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setAlpha:a3];
        unint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (double)cornerGrabberAlpha
{
  return self->_cornerGrabberAlpha;
}

- (double)lineAlpha
{
  return self->_lineAlpha;
}

- (double)lineGrabberAlpha
{
  return self->_lineGrabberAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineViews, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_grabberViews, 0);

  objc_storeStrong((id *)&self->_cornerViews, 0);
}

@end